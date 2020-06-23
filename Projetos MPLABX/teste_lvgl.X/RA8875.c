#include "RA8875.h"
#include <sys/attribs.h>
#include <proc/p32mx795f512h.h>

// Display size
unsigned short _width = 800;
unsigned short _height = 480;

void RA8875_begin() {
	// o pino de reset é o RD7
	TRISDbits.TRISD7 = 0;
	LATDbits.LATD7 = 0;
	delay_ms(10);
	LATDbits.LATD7 = 1;
	delay_ms(10);
	
	RA8875_PLLinit();
	
	writeReg(RA8875_SYSR, RA8875_SYSR_16BPP | RA8875_SYSR_MCU8);
	
	// Timing values
	unsigned char pixclk = RA8875_PCSR_PDATL | RA8875_PCSR_2CLK;
	unsigned char hsync_start = 32;
	unsigned char hsync_pw = 96;
	unsigned char hsync_finetune = 0;
	unsigned char hsync_nondisp = 26;
	unsigned char vsync_pw = 2;
	unsigned short vsync_nondisp = 32;
	unsigned short vsync_start = 23;
	
	writeReg(RA8875_PCSR, pixclk);
	delay_ms(1);
	
	// Horizontal settings registers
	writeReg(RA8875_HDWR, (_width / 8) - 1);                          // H width: (HDWR + 1) * 8 = 480
	writeReg(RA8875_HNDFTR, RA8875_HNDFTR_DE_HIGH + hsync_finetune);
	writeReg(RA8875_HNDR, (hsync_nondisp - hsync_finetune - 2)/8);    // H non-display: HNDR * 8 + HNDFTR + 2 = 10
	writeReg(RA8875_HSTR, hsync_start/8 - 1);                         // Hsync start: (HSTR + 1)*8
	writeReg(RA8875_HPWR, RA8875_HPWR_LOW + (hsync_pw/8 - 1));        // HSync pulse width = (HPWR+1) * 8

	// Vertical settings registers
	writeReg(RA8875_VDHR0, (uint16_t)(_height - 1) & 0xFF);
	writeReg(RA8875_VDHR1, (uint16_t)(_height - 1) >> 8);
	writeReg(RA8875_VNDR0, vsync_nondisp-1);                          // V non-display period = VNDR + 1
	writeReg(RA8875_VNDR1, vsync_nondisp >> 8);
	writeReg(RA8875_VSTR0, vsync_start-1);                            // Vsync start position = VSTR + 1
	writeReg(RA8875_VSTR1, vsync_start >> 8);
	writeReg(RA8875_VPWR, RA8875_VPWR_LOW + vsync_pw - 1);            // Vsync pulse width = VPWR + 1

	// Set active window X
	writeReg(RA8875_HSAW0, 0);                                        // horizontal start point
	writeReg(RA8875_HSAW1, 0);
	writeReg(RA8875_HEAW0, (uint16_t)(_width - 1) & 0xFF);            // horizontal end point
	writeReg(RA8875_HEAW1, (uint16_t)(_width - 1) >> 8);

	// Set active window Y
	writeReg(RA8875_VSAW0, 0);										  // vertical start point
	writeReg(RA8875_VSAW1, 0);
	writeReg(RA8875_VEAW0, (uint16_t)(_height - 1) & 0xFF);			  // vertical end point
	writeReg(RA8875_VEAW1, (uint16_t)(_height - 1) >> 8);

	// Clear the entire window
	writeReg(RA8875_MCLR, RA8875_MCLR_START | RA8875_MCLR_FULL);
	delay_ms(500);
}


void RA8875_PLLinit() {
	writeReg(RA8875_PLLC1, RA8875_PLLC1_PLLDIV1 + 11);
	delay_ms(1);
	writeReg(RA8875_PLLC2, RA8875_PLLC2_DIV4);
	delay_ms(1);
}


void RA8875_displayOn(char on) {
	if(on == 1) writeReg(RA8875_PWRR, RA8875_PWRR_NORMAL | RA8875_PWRR_DISPON);
	else writeReg(RA8875_PWRR, RA8875_PWRR_NORMAL | RA8875_PWRR_DISPOFF);
}


void RA8875_backlight(char on, unsigned char duty) {
	if(on == 1) {
		writeReg(RA8875_GPIOX, 1);
		writeReg(RA8875_P1CR, RA8875_P1CR_ENABLE | (RA8875_PWM_CLK_DIV1024 & 0xF));
		writeReg(RA8875_P1DCR, duty);
	}
	else {
		writeReg(RA8875_GPIOX, 0);
		writeReg(RA8875_P1CR, RA8875_P1CR_DISABLE | (RA8875_PWM_CLK_DIV1024 & 0xF));
	}
}


void RA8875_fillScreen(unsigned short color) {
	unsigned short x = 0;
	unsigned short y = 0;
	unsigned short w = _width - 1;
	unsigned short h = _height - 1;
	
	// Set X
	writeCommand(0x91);
	writeData(x);
	writeCommand(0x92);
	writeData(x >> 8);
	
	// Set Y
	writeCommand(0x93);
	writeData(y);
	writeCommand(0x94);
	writeData(y >> 8);

	// Set X1
	writeCommand(0x95);
	writeData(w);
	writeCommand(0x96);
	writeData((w) >> 8);

	// Set Y1
	writeCommand(0x97);
	writeData(h);
	writeCommand(0x98);
	writeData((h) >> 8);
	
	// Set Color
	writeCommand(0x63);
	writeData((color & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((color & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((color & 0x001f));
	
	// Draw
	writeCommand(RA8875_DCR);
	writeData(0xB0);
	
	
}


void RA8875_drawPixel(short x, short y, short color) {
	writeReg(RA8875_CURH0, x);
	writeReg(RA8875_CURH1, x >> 8);
	writeReg(RA8875_CURV0, y);
	writeReg(RA8875_CURV1, y >> 8);
	writeCommand(RA8875_MRWC);
	SPI2BUF = RA8875_DATAWRITE;
	SPI2BUF = color >> 8;
	SPI2BUF = color;
	while(SPI2STATbits.SPIBUSY);
}


void RA8875_drawPixels(unsigned short * p, unsigned int num, short x, short y) {
	writeReg(RA8875_CURH0, x);
	writeReg(RA8875_CURH1, x >> 8);
	writeReg(RA8875_CURV0, y);
	writeReg(RA8875_CURV1, y >> 8);

	unsigned char dir = RA8875_MWCR0_LRTD;
	writeReg(RA8875_MWCR0, (readReg(RA8875_MWCR0) & ~RA8875_MWCR0_DIRMASK) | dir);

	writeCommand(RA8875_MRWC);
	SPI2BUF = RA8875_DATAWRITE;
	while(num > 0) {
		unsigned short color = *p;
		//unsigned short color = RA8875_BLUE;
		SPI2BUF = color >> 8;
		SPI2BUF = color;
		while(SPI2STATbits.SPIBUSY);
		num--;
		p++;
	}
}


void writeReg(unsigned char reg, unsigned char val) {
	writeCommand(reg);
	writeData(val);
}


unsigned char readReg(unsigned char reg) {
	writeCommand(reg);
	return readData();
}


void writeData(unsigned char d) {
	//while(SPI2STATbits.SPITBF);
	SPI2BUF = RA8875_DATAWRITE;
	SPI2BUF = d;
	while(SPI2STATbits.SPIBUSY);
}


unsigned char readData(void) {
	//while(SPI2STATbits.SPITBF);
	SPI2BUF = RA8875_DATAREAD;
	SPI2BUF = 0;
	while(SPI2STATbits.SPIBUSY);
	//while(SPI2STATbits.SPIRBE);
	unsigned char trash = SPI2BUF;
	return SPI2BUF;
}


void writeCommand(unsigned char d) {
	//while(SPI2STATbits.SPITBF);
	SPI2BUF = RA8875_CMDWRITE;
	SPI2BUF = d;
	while(SPI2STATbits.SPIBUSY);
}


unsigned char readStatus(void) {
	SPI2BUF = RA8875_CMDREAD;
	SPI2BUF = 0;
	while(SPI2STATbits.SPIBUSY);
	unsigned char trash = SPI2BUF;
	return SPI2BUF;
}


