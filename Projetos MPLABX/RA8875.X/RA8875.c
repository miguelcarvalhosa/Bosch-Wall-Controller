#include "RA8875.h"
#include <sys/attribs.h>
#include <proc/p32mx795f512h.h>

// Display size
static unsigned short _width = 800;
static unsigned short _height = 480;

// Register values
static unsigned char reg_20 = 0b00000000;
static unsigned char reg_21 = 0b00000000;
static unsigned char reg_22 = 0b11000101;
static unsigned char reg_40 = 0;

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


void RA8875_graphicsMode(void) {
	writeCommand(RA8875_MWCR0);
	//unsigned char temp = readData();
	//temp &= ~RA8875_MWCR0_TXTMODE; // bit #7
	reg_40 &= ~(1<<7);		// reset bit 7
	writeData(reg_40);
}


void RA8875_textMode(void) {
	/* Set text mode */
	writeCommand(RA8875_MWCR0);
	//unsigned char temp = readData();
	//temp |= RA8875_MWCR0_TXTMODE; // Set bit 7
	//temp &= 0xFE; // Reset bit 0
	reg_40 |= (1<<7);		// set bit 7
	writeData(reg_40);

	/* Select the internal (ROM) font */
	writeCommand(0x21);
	//temp = readData();
	reg_21 &= ~((1<<7) | (1<<5)); // Clear bits 7 and 5
	writeData(reg_21);
}


void RA8875_textSetCursor(unsigned short x, unsigned short y) {

	/* Set cursor location */
	writeCommand(0x2A);
	writeData(x & 0xFF);
	writeCommand(0x2B);
	writeData(x >> 8);
	writeCommand(0x2C);
	writeData(y & 0xFF);
	writeCommand(0x2D);
	writeData(y >> 8);
}


void RA8875_textColor(unsigned short foreColor, unsigned short bgColor, unsigned char transp_bg) {
	/* Set Fore Color */
	writeCommand(0x63);
	writeData((foreColor & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((foreColor & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((foreColor & 0x001f));

	if(transp_bg == 0) {
		/* Set Background Color */
		writeCommand(0x60);
		writeData((bgColor & 0xf800) >> 11);
		writeCommand(0x61);
		writeData((bgColor & 0x07e0) >> 5);
		writeCommand(0x62);
		writeData((bgColor & 0x001f));
		/* Clear transparency flag */
		writeCommand(0x22);
		//unsigned char temp = readData();
		reg_22 &= 0b10101111;
		writeData(reg_22);
	}

	else {
		/* Set transparency flag */
		writeCommand(0x22);
		//unsigned char temp = readData();
		//temp &= 0b10100000;
		//temp |= 0b01000000;
		reg_22 |= (1<<6);
		writeData(reg_22);
	}
}


void RA8875_textEnlarge(unsigned char scale) {
	if (scale > 3) scale = 3; // highest setting is 3

	/* Set font size flags */
	writeCommand(0x22);
	//unsigned char temp = readData();
	//reg_22 &= 0b10101111;
	//reg_22 |= scale << 2;
	//reg_22 |= scale;
	reg_22 &= 0b11110000;
	if(scale == 0) reg_22 |= 0b0000;
	else if(scale == 1) reg_22 |= 0b0101;
	else if(scale == 2) reg_22 |= 0b1010;
	else if(scale == 3) reg_22 |= 0b1111;
	

	writeData(reg_22);
}


void RA8875_cursorBlink(unsigned char rate) {
	writeCommand(RA8875_MWCR0);
	//unsigned char temp = readData();
	reg_40 |= RA8875_MWCR0_CURSOR;
	writeData(reg_40);

	writeCommand(RA8875_MWCR0);
	//temp = readData();
	reg_40 |= RA8875_MWCR0_BLINK;
	reg_40 &= 0xFE; // Reset bit 0
	writeData(reg_40);

	if (rate > 255) rate = 255;
	writeCommand(RA8875_BTCR);
	writeData(rate);
}


void RA8875_textWrite(char* buffer) {
	//if (len == 0) len = strlen(buffer);
	writeCommand(RA8875_MRWC);
	/*unsigned short i;
	for (i=0; i<len; i++) {
		writeData(buffer[i]);
		//if (_textScale > 0) delay(1);
		delay_ms(1);
	}*/
	while(*buffer != '\0') {
		writeData(*buffer);
		buffer++;
		delay_us(500);
	}
}


void RA8875_charWrite(char buffer) {
	//if (len == 0) len = strlen(buffer);
	writeCommand(RA8875_MRWC);
	/*unsigned short i;
	for (i=0; i<len; i++) {
		writeData(buffer[i]);
		//if (_textScale > 0) delay(1);
		delay_ms(1);
	}*/
	writeData(buffer);
	delay_us(500);
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


void RA8875_drawLine(short x0, short y0, short x1, short y1, unsigned short color) {
	/* Set X */
	writeCommand(0x91);
	writeData(x0);
	writeCommand(0x92);
	writeData(x0 >> 8);

	/* Set Y */
	writeCommand(0x93);
	writeData(y0);
	writeCommand(0x94);
	writeData(y0 >> 8);

	/* Set X1 */
	writeCommand(0x95);
	writeData(x1);
	writeCommand(0x96);
	writeData((x1) >> 8);

	/* Set Y1 */
	writeCommand(0x97);
	writeData(y1);
	writeCommand(0x98);
	writeData((y1) >> 8);

	/* Set Color */
	writeCommand(0x63);
	writeData((color & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((color & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((color & 0x001f));

	/* Draw! */
	writeCommand(RA8875_DCR);
	writeData(0x80);

	/* Wait for the command to finish */
	//RA8875_waitPoll(RA8875_DCR, RA8875_DCR_LINESQUTRI_STATUS);
}


void RA8875_drawRect(short x, short y, short w, short h, unsigned short color, unsigned char filled) {

	w = x+w-1;
	h = y+h-1;
	
	/* Set X */
	writeCommand(0x91);
	writeData(x);
	writeCommand(0x92);
	writeData(x >> 8);

	/* Set Y */
	writeCommand(0x93);
	writeData(y);
	writeCommand(0x94);
	writeData(y >> 8);

	/* Set X1 */
	writeCommand(0x95);
	writeData(w);
	writeCommand(0x96);
	writeData((w) >> 8);

	/* Set Y1 */
	writeCommand(0x97);
	writeData(h);
	writeCommand(0x98);
	writeData((h) >> 8);

	/* Set Color */
	writeCommand(0x63);
	writeData((color & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((color & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((color & 0x001f));

	/* Draw! */
	writeCommand(RA8875_DCR);
	if (filled)
	{
	  writeData(0xB0);
	}
	else
	{
	  writeData(0x90);
	}

	/* Wait for the command to finish */
	//RA8875_waitPoll(RA8875_DCR, RA8875_DCR_LINESQUTRI_STATUS);
}


void RA8875_drawCircle(short x, short y, short r, unsigned short color, unsigned char filled) {

	/* Set X */
	writeCommand(0x99);
	writeData(x);
	writeCommand(0x9a);
	writeData(x >> 8);

	/* Set Y */
	writeCommand(0x9b);
	writeData(y);
	writeCommand(0x9c);
	writeData(y >> 8);

	/* Set Radius */
	writeCommand(0x9d);
	writeData(r);

	/* Set Color */
	writeCommand(0x63);
	writeData((color & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((color & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((color & 0x001f));

	/* Draw! */
	writeCommand(RA8875_DCR);
	if (filled)
	{
	  writeData(RA8875_DCR_CIRCLE_START | RA8875_DCR_FILL);
	}
	else
	{
	  writeData(RA8875_DCR_CIRCLE_START | RA8875_DCR_NOFILL);
	}

	/* Wait for the command to finish */
	//RA8875_waitPoll(RA8875_DCR, RA8875_DCR_CIRCLE_STATUS);
}


void RA8875_drawTriangle(short x0, short y0, short x1, short y1, short x2, short y2, unsigned short color, unsigned char filled) {

	/* Set Point 0 */
	writeCommand(0x91);
	writeData(x0);
	writeCommand(0x92);
	writeData(x0 >> 8);
	writeCommand(0x93);
	writeData(y0);
	writeCommand(0x94);
	writeData(y0 >> 8);

	/* Set Point 1 */
	writeCommand(0x95);
	writeData(x1);
	writeCommand(0x96);
	writeData(x1 >> 8);
	writeCommand(0x97);
	writeData(y1);
	writeCommand(0x98);
	writeData(y1 >> 8);

	/* Set Point 2 */
	writeCommand(0xA9);
	writeData(x2);
	writeCommand(0xAA);
	writeData(x2 >> 8);
	writeCommand(0xAB);
	writeData(y2);
	writeCommand(0xAC);
	writeData(y2 >> 8);

	/* Set Color */
	writeCommand(0x63);
	writeData((color & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((color & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((color & 0x001f));

	/* Draw! */
	writeCommand(RA8875_DCR);
	if (filled)
	{
	  writeData(0xA1);
	}
	else
	{
	  writeData(0x81);
	}

	/* Wait for the command to finish */
	//RA8875_waitPoll(RA8875_DCR, RA8875_DCR_LINESQUTRI_STATUS);
}


void RA8875_drawEllipse(short xCenter, short yCenter, short longAxis, short shortAxis, unsigned short color, unsigned char filled) {

	/* Set Center Point */
	writeCommand(0xA5);
	writeData(xCenter);
	writeCommand(0xA6);
	writeData(xCenter >> 8);
	writeCommand(0xA7);
	writeData(yCenter);
	writeCommand(0xA8);
	writeData(yCenter >> 8);

	/* Set Long and Short Axis */
	writeCommand(0xA1);
	writeData(longAxis);
	writeCommand(0xA2);
	writeData(longAxis >> 8);
	writeCommand(0xA3);
	writeData(shortAxis);
	writeCommand(0xA4);
	writeData(shortAxis >> 8);

	/* Set Color */
	writeCommand(0x63);
	writeData((color & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((color & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((color & 0x001f));

	/* Draw! */
	writeCommand(0xA0);
	if (filled)
	{
	  writeData(0xC0);
	}
	else
	{
	  writeData(0x80);
	}

	/* Wait for the command to finish */
	//RA8875_waitPoll(RA8875_ELLIPSE, RA8875_ELLIPSE_STATUS);
}


void RA8875_drawCurve(short xCenter, short yCenter, short longAxis, short shortAxis, unsigned char curvePart, unsigned short color, unsigned char filled) {
	
	/* Set Center Point */
	writeCommand(0xA5);
	writeData(xCenter);
	writeCommand(0xA6);
	writeData(xCenter >> 8);
	writeCommand(0xA7);
	writeData(yCenter);
	writeCommand(0xA8);
	writeData(yCenter >> 8);

	/* Set Long and Short Axis */
	writeCommand(0xA1);
	writeData(longAxis);
	writeCommand(0xA2);
	writeData(longAxis >> 8);
	writeCommand(0xA3);
	writeData(shortAxis);
	writeCommand(0xA4);
	writeData(shortAxis >> 8);

	/* Set Color */
	writeCommand(0x63);
	writeData((color & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((color & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((color & 0x001f));

	/* Draw! */
	writeCommand(0xA0);
	if (filled)
	{
	  writeData(0xD0 | (curvePart & 0x03));
	}
	else
	{
	  writeData(0x90 | (curvePart & 0x03));
	}

	/* Wait for the command to finish */
	//RA8875_waitPoll(RA8875_ELLIPSE, RA8875_ELLIPSE_STATUS);
}


void RA8875_drawRoundRect(short x, short y, short w, short h, short r, unsigned short color, unsigned char filled) {
	
	w = x+w-1;
	h = y+h-1;
	
	//if (x > w) swap(x, w);
	//if (y > h) swap(y, h);

	/* Set X */
	writeCommand(0x91);
	writeData(x);
	writeCommand(0x92);
	writeData(x >> 8);

	/* Set Y */
	writeCommand(0x93);
	writeData(y);
	writeCommand(0x94);
	writeData(y >> 8);

	/* Set X1 */
	writeCommand(0x95);
	writeData(w);
	writeCommand(0x96);
	writeData((w) >> 8);

	/* Set Y1 */
	writeCommand(0x97);
	writeData(h);
	writeCommand(0x98);
	writeData((h) >> 8);

	writeCommand(0xA1);
	writeData(r);
	writeCommand(0xA2);
	writeData((r) >> 8);

	writeCommand(0xA3);
	writeData(r);
	writeCommand(0xA4);
	writeData((r) >> 8);

	/* Set Color */
	writeCommand(0x63);
	writeData((color & 0xf800) >> 11);
	writeCommand(0x64);
	writeData((color & 0x07e0) >> 5);
	writeCommand(0x65);
	writeData((color & 0x001f));

	/* Draw! */
	writeCommand(RA8875_ELLIPSE);
	if (filled)
	{
	  writeData(0xE0);
	}
	else
	{
	  writeData(0xA0);
	}

	/* Wait for the command to finish */
	//RA8875_waitPoll(RA8875_ELLIPSE, RA8875_DCR_LINESQUTRI_STATUS);
}


void RA8875_drawPixel(short x, short y, short color) {
	writeReg(RA8875_CURH0, x);
	writeReg(RA8875_CURH1, x >> 8);
	writeReg(RA8875_CURV0, y);
	writeReg(RA8875_CURV1, y >> 8);
	writeCommand(RA8875_MRWC);
	SPI2BUF = RA8875_DATAREAD;
	SPI2BUF = color >> 8;
	SPI2BUF = color;
	while(SPI2STATbits.SPIBUSY);
}


void RA8875_drawPixels(unsigned long * p, unsigned int num, short x, short y) {
	writeReg(RA8875_CURH0, x);
	writeReg(RA8875_CURH1, x >> 8);
	writeReg(RA8875_CURV0, y);
	writeReg(RA8875_CURV1, y >> 8);

	//unsigned char dir = RA8875_MWCR0_LRTD;
	//writeReg(RA8875_MWCR0, (readReg(RA8875_MWCR0) & ~RA8875_MWCR0_DIRMASK) | dir);

	writeCommand(RA8875_MRWC);
	SPI2BUF = RA8875_DATAREAD;
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


char RA8875_waitPoll(unsigned char regname, unsigned char waitflag) {
  /* Wait for the command to finish */
  while (1)
  {
    unsigned char temp = readReg(regname);
    if (!(temp & waitflag))
      return 0x1;
  }
  return 0x0;
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
	SPI2BUF = RA8875_DATAREAD;
	SPI2BUF = 0;
	while(SPI2STATbits.SPIBUSY);
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


