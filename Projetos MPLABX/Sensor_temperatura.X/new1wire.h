/* ************************************************************************** */

#ifndef _new1wire_H    /* Guard against multiple inclusion */
#define _new1wire_H 

/*
 * Definições
 */
#define HIGH 1
#define LOW 0
#define INPUT 1
#define OUTPUT 0

/*
 * Protótipos de Funções
 */
void OW_Init(void);
unsigned char OW_reset_pulse(void);
void OW_write_bit(int write_bit);
unsigned char OW_read_bit(void);
void OW_write_byte(unsigned char write_data);
unsigned char OW_read_byte(void);
void delay_ms(int ms);
void delay_us(int us);

#endif

/* *****************************************************************************
 End of File
 */
