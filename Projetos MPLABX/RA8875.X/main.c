
#include <stdio.h>
#include <stdlib.h>
#include <sys/attribs.h>
#include <proc/p32mx795f512h.h>
#include "pic32_config.h"
#include "RA8875.h"
#include "delay.h"


/*
 * Protótipos das funções
 */
void spi2_config(void);
void button_bar(unsigned char sel);
void menu_1(unsigned char hora, unsigned char minuto, unsigned char temperatura);


int main(int argc, char** argv) {
	
	TRISEbits.TRISE0 = 0;
	LATEbits.LATE0 = 1;

	spi2_config();
	RA8875_begin();
	//RA8875_PLLinit();
	RA8875_displayOn(1);
	RA8875_backlight(1, 255);
	
	RA8875_graphicsMode();
	
	menu_1(22, 10, 23);
	
	while(1) {
		
	}
	

	return (EXIT_SUCCESS);
}


/*
 * Função para configurar o SPI2
 */
void spi2_config() {
	SPI2CONbits.MSTEN = 1;		// Master
	SPI2CONbits.ENHBUF = 1;		// Ativar FIFOs de tx e rx
	SPI2CONbits.MSSEN = 1;		// Ativar o SS
	char trash;
	while(SPI2STATbits.SPIRBE == 0) trash = SPI2BUF;	// Limpar o FIFO de receção
	SPI2STATCLR = 1 << 6;		// Limpar a flag de overflow de receção
	SPI2BRG = 1;				// f_sck ~= 3.33 MHz (5)  10 MHz (1)
	SPI2CONbits.CKP = 1;		// idle when SCK is high
	SPI2CONbits.CKE = 0;		// transição de relógio de active para idle
	SPI2CONbits.SMP = 1;		// sampling no meio do tempo de receção
	SPI2CONbits.MODE32 = 0;		// palavras de 8 bits
	SPI2CONbits.MODE16 = 0;
	SPI2CONbits.ON = 1;
}


void menu_1(unsigned char hora, unsigned char minuto, unsigned char temperatura) {
	button_bar(1);
	RA8875_textMode();
	RA8875_textColor(RA8875_WHITE, NULL, 1);
	// Texto "Planear Aquecimento"
	RA8875_textEnlarge(2);
	RA8875_textSetCursor(170, 40);
	RA8875_textWrite("Planear Aquecimento");
	// Texto "Hora"
	RA8875_textEnlarge(1);
	RA8875_textSetCursor(275, 130);
	RA8875_textWrite("Hora:");
	// Texto "Temperatura"
	RA8875_textSetCursor(220, 190);
	RA8875_textWrite("Temperatura:");
	// Texto "Divisões"
	RA8875_textSetCursor(245, 250);
	RA8875_textWrite("Divisões:");
	RA8875_graphicsMode();
	// Retângulo Hora
	RA8875_drawRoundRect(470, 130, 84, 35, 5, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRoundRect(472, 132, 80, 31, 5, RA8875_BLACK, 1);
	delay_us(200);
	// Retângulo Temperatura
	RA8875_drawRoundRect(477, 190, 70, 35, 5, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRoundRect(479, 192, 66, 31, 5, RA8875_BLACK, 1);
	delay_us(200);
	// Valor Hora
	RA8875_textMode();
	RA8875_textColor(RA8875_WHITE, NULL, 1);
	RA8875_textEnlarge(1);
	RA8875_textSetCursor(472, 130);
	RA8875_charWrite(hora/10+48);
	RA8875_charWrite(hora%10+48);
	RA8875_textWrite(":");
	RA8875_charWrite(minuto/10+48);
	RA8875_charWrite(minuto%10+48);
	// Valor Temperatura
	RA8875_textMode();
	RA8875_textColor(RA8875_WHITE, NULL, 1);
	RA8875_textEnlarge(1);
	RA8875_textSetCursor(479, 190);
	RA8875_charWrite(temperatura/10+48);
	RA8875_charWrite(temperatura%10+48);
	RA8875_textWrite("ºC");
	
	// Botão - (horas)
	RA8875_drawCircle(440, 147, 17, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawCircle(440, 147, 15, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRect(428, 147, 25, 2, RA8875_WHITE, 1);
	delay_us(200);
	// Botão + (horas)
	RA8875_drawCircle(584, 147, 17, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawCircle(584, 147, 15, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRect(584, 135, 2, 25, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRect(572, 147, 25, 2, RA8875_WHITE, 1);
	delay_us(200);
	// Botão - (temperatura)
	RA8875_drawCircle(447, 207, 17, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawCircle(447, 207, 15, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRect(435, 207, 25, 2, RA8875_WHITE, 1);
	delay_us(200);
	// Botão + (temperatura)
	RA8875_drawCircle(577, 207, 17, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawCircle(577, 207, 15, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRect(577, 195, 2, 25, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRect(565, 207, 25, 2, RA8875_WHITE, 1);
	delay_us(200);
}


void button_bar(unsigned char sel) {
	RA8875_graphicsMode();
	RA8875_drawRoundRect(2, 420, 131, 60, 8, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRoundRect(135, 420, 131, 60, 8, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRoundRect(268, 420, 131, 60, 8, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRoundRect(401, 420, 131, 60, 8, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRoundRect(534, 420, 131, 60, 8, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRoundRect(667, 420, 131, 60, 8, RA8875_WHITE, 1);
	delay_us(200);
	RA8875_drawRoundRect(4, 422, 127, 56, 8, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRoundRect(137, 422, 127, 56, 8, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRoundRect(270, 422, 127, 56, 8, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRoundRect(403, 422, 127, 56, 8, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRoundRect(536, 422, 127, 56, 8, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_drawRoundRect(669, 422, 127, 56, 8, RA8875_BLACK, 1);
	delay_us(200);
	RA8875_textMode();
	RA8875_textColor(RA8875_WHITE, NULL, 1);
	RA8875_textEnlarge(0);
	RA8875_textSetCursor(40, 430);
	RA8875_textWrite("Planear");
	RA8875_textSetCursor(25, 450);
	RA8875_textWrite("Aquecimento");
	RA8875_textSetCursor(175, 430);
	RA8875_textWrite("Ajuste");
	RA8875_textSetCursor(175, 450);
	RA8875_textWrite("Manual");
	RA8875_textSetCursor(285, 440);
	RA8875_textWrite("Estatísticas");
	RA8875_textSetCursor(415, 440);
	RA8875_textWrite("Meteorologia");
	RA8875_textSetCursor(565, 440);
	RA8875_textWrite("Notícias");
	RA8875_textSetCursor(690, 440);
	RA8875_textWrite("Definições");
	if(sel == 1) {
		RA8875_graphicsMode();
		RA8875_drawRoundRect(4, 422, 127, 56, 8, RA8875_WHITE, 1);
		delay_us(200);
		RA8875_textMode();
		RA8875_textColor(RA8875_BLACK, RA8875_BLACK, 1);
		RA8875_textEnlarge(0);
		RA8875_textSetCursor(40, 430);
		RA8875_textWrite("Planear");
		RA8875_textSetCursor(25, 450);
		RA8875_textWrite("Aquecimento");
	}
	else if(sel == 2) {
		RA8875_graphicsMode();
		RA8875_drawRoundRect(137, 422, 127, 56, 8, RA8875_WHITE, 1);
		delay_us(200);
		RA8875_textMode();
		RA8875_textColor(RA8875_BLACK, RA8875_BLACK, 1);
		RA8875_textEnlarge(0);
		RA8875_textSetCursor(175, 430);
		RA8875_textWrite("Ajuste");
		RA8875_textSetCursor(175, 450);
		RA8875_textWrite("Manual");
	}
	else if(sel == 3) {
		RA8875_graphicsMode();
		RA8875_drawRoundRect(270, 422, 127, 56, 8, RA8875_WHITE, 1);
		delay_us(200);
		RA8875_textMode();
		RA8875_textColor(RA8875_BLACK, RA8875_BLACK, 1);
		RA8875_textEnlarge(0);
		RA8875_textSetCursor(285, 440);
		RA8875_textWrite("Estatísticas");
	}
	else if(sel == 4) {
		RA8875_graphicsMode();
		RA8875_drawRoundRect(403, 422, 127, 56, 8, RA8875_WHITE, 1);
		delay_us(200);
		RA8875_textMode();
		RA8875_textColor(RA8875_BLACK, RA8875_BLACK, 1);
		RA8875_textEnlarge(0);
		RA8875_textSetCursor(415, 440);
		RA8875_textWrite("Meteorologia");
	}
	else if(sel == 5) {
		RA8875_graphicsMode();
		RA8875_drawRoundRect(536, 422, 127, 56, 8, RA8875_WHITE, 1);
		delay_us(200);
		RA8875_textMode();
		RA8875_textColor(RA8875_BLACK, RA8875_BLACK, 1);
		RA8875_textEnlarge(0);
		RA8875_textSetCursor(565, 440);
		RA8875_textWrite("Notícias");
	}
	else if(sel == 6) {
		RA8875_graphicsMode();
		RA8875_drawRoundRect(669, 422, 127, 56, 8, RA8875_WHITE, 1);
		delay_us(200);
		RA8875_textMode();
		RA8875_textColor(RA8875_BLACK, RA8875_BLACK, 1);
		RA8875_textEnlarge(0);
		RA8875_textSetCursor(690, 440);
		RA8875_textWrite("Definições");
	}
}

