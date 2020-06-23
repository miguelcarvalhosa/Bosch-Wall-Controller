#ifndef _UART_H
#define _UART_H


/*
 * Protótipos das funções
 */
void uart1_config(unsigned int baud, unsigned char databits, unsigned char parity, unsigned char stopbits);
void uart1_putc(char byte2send);
void uart1_puts(char *s);


#endif
