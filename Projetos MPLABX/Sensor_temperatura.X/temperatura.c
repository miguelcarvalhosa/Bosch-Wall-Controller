/* 
 * File:   temperatura.c
 * Author: Hugo Leal
 *
 * Created on February 23, 2020, 8:50 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

#include "pic32_config.h"
#include "uart.h"
#include "new1wire.h"

/*
 * Definições
 */
#define SKIP_ROM            0xCC
#define READ_ROM            0x33
#define START_CONVERSION    0x44
#define READ_SCRATCHPAD     0xBE
#define RESOLUTION_12BIT    0x7F
#define MATCH_ROM           0x55
#define SEARCH_ROM          0xF0

/*
 * Variáveis Globais
 */
char getDat[10];
char TEMP_LSB;
char TEMP_MSB;
int  i;
char far_temp;
char cel_temp;
/*
 * Chamada de funções
 */
unsigned char Detect_Slave_Device(void);
void hex_ascii(unsigned char display_data);

/*
 * 
 */
int main(int argc, char** argv) {
   
    uart1_config(115200, 8, 1, 2);              // inicializar uart
    unsigned char present;
    
    while(1){
        present = OW_reset_pulse(); // see if device is present

        if (present == 0) {
            uart1_puts("Device is Present\n");
        } else {
            uart1_puts("Device not present\n");
            return;
        }
        
        OW_reset_pulse();                           // reset
        OW_write_byte(SKIP_ROM);                    //Skip ROM
        OW_write_byte(START_CONVERSION);            // Start Conversion
        
        OW_reset_pulse();                           // reset device
        OW_write_byte(SKIP_ROM);                    // Skip ROM
        OW_write_byte(READ_SCRATCHPAD);             // Read Scratch Pad
        
        //uart1_puts("Writing\n");
         // read scratchpad data
        for (i = 0; i < 9; i++) {
            getDat[i] = OW_read_byte();
            uart1_puts(getDat[i]);
        }
        
        //uart1_puts("Data\n");
        // print scratchpad data
        /*for (i = 0; i < 9; i++) {
            uart1_puts("Read data\n");
            uart1_puts(getDat[i]);
        }*/

        //uart1_puts("Calculating:\n");
        // get temperature data
        TEMP_MSB = getDat[1];           // Sign byte + lsbit
        TEMP_LSB = getDat[0];           // Temp data plus lsb

        if (TEMP_MSB <= 0x80) {
            TEMP_LSB = (TEMP_LSB / 2); // shift to get whole degree
        }

        TEMP_MSB = TEMP_MSB & 0x80; // mask all but the sign bit

        if (TEMP_MSB >= 0x80) {
            TEMP_LSB = (~TEMP_LSB) + 1; // two's complement
        }

        if (TEMP_MSB >= 0x80) {
            TEMP_LSB = (TEMP_LSB / 2); // shift to get whole degree
        }

        if (TEMP_MSB >= 0x80) {
            TEMP_LSB = ((-1) * TEMP_LSB); // add sign bit
        }

        // print temp in Celsius
        uart1_puts("Temperature in Celsius\n");
        uart1_puts(TEMP_LSB);

        delay_ms(1000);
    }
    return (EXIT_SUCCESS);
}

/*
 * Função para detetar slave no barramento
 * Retorna: 1 - se não existir slave
 *          0 - se existir slave  
 */

unsigned char Detect_Slave_Device(void){
    
	unsigned char present = OW_reset_pulse(); // see if device is present

    if (present == 0) {
        uart1_puts("Device is Present\n");
    }
    else {
        uart1_puts("Device not present\n");
        return;
    }
}	

/*
 * Função para converter um valor em Hexadecimal em decimal e envia-lo para o terminal
 */

void hex_ascii(unsigned char display_data){
    
	unsigned char temp;
    
	temp = ((display_data & 0xF0)>>4);
    
	if (temp <= 0x09)
		uart1_putc(temp+'0');	
	else
		uart1_putc(temp+'0'+0x07);	

	temp = display_data & 0x0F;
	if (temp <= 0x09)
		uart1_putc(temp+'0');	
	else
		uart1_putc(temp+'0'+0x07);	
	
	uart1_putc('\r');
	uart1_putc('\n');
}	
