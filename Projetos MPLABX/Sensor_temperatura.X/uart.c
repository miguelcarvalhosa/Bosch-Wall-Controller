#include <xc.h>
#include "uart.h"


/*
 * Definições
 */
#define SYSCLK 80000000
#define PBCLK  40000000


/*
 * Função para configurar a UART 1
 * Recebe como parâmetros de entrada:
 *		- baudrate: valores padrão entre 2400 e 921600 (default 9600)
 *		- databits: 8 ou 9 (default 8)
 *		- parity: 0 (sem), 1 (impar) ou 2 (par) (default ímpar)
 *		- stopbits: 1 ou 2 (default 2)
 */
void uart1_config(unsigned int baudrate, unsigned char databits, unsigned char parity, unsigned char stopbits) {
	U1MODEbits.BRGH = 1;		// Divide o clock por 4
	if(baudrate==2400 || baudrate==4800 || baudrate==9600 || baudrate==19200 || baudrate==38400 || baudrate==57600 || baudrate==115200 || baudrate==230400 || baudrate==460800 || baudrate==921600) {
		U1BRG = PBCLK/(4*baudrate) - 1;
	}
	else U1BRG = PBCLK/(4*9600) - 1;		// default baudrate 9600
	
	if(databits == 8) {
		if(parity == 0) U1MODEbits.PDSEL = 0x00;			// 8 bit data, no parity
		else if(parity == 1) U1MODEbits.PDSEL = 0x10;		// 8 bit data, odd parity
		else if(parity == 2) U1MODEbits.PDSEL = 0x01;		// 8 bit data, even parity
	}
	else if(databits == 9) U1MODEbits.PDSEL = 0x11;			// 9 bit data, no parity
	else U1MODEbits.PDSEL = 0x10;			// default 8 bit data, odd parity
	
	if(stopbits == 1 || stopbits == 2) U1MODEbits.STSEL = stopbits - 1;
	else U1MODEbits.STSEL = 1;			// default 2 stop bit
	
	U1STAbits.UTXEN = 1;		// Ativar o módulo de transmissão
	U1STAbits.URXEN = 1;		// Ativar o módulo de receção
	U1MODEbits.ON = 1;			// Ativar a UART
}


/*
 * Função para enviar um caracter
 */
void uart1_putc(char byte2send) {
	while(U1STAbits.UTXBF == 1);		// Enquanto o buffer de transmissão estiver cheio, espera-se
	U1TXREG = byte2send;					// Copiar o caracter para o buffer de transmissão
}


/*
 * Função para enviar uma string
 */
void uart1_puts(char *s) {
	while(*s != '\0') {
		uart1_putc(*s);
		s++;
	}
}