/*
 * Includes
 */
#include <xc.h>
#include "new1wire.h"

/*
 * I/O 1 wire pins
 */
#define OW_PIN_DIRECTION 	TRISBbits.TRISB2 
#define OW_WRITE_PIN  		LATBbits.LATB2
#define OW_READ_PIN			PORTBbits.RB2

/*
 * Função para dar reset ao OW e iniciar uma operação
 * Retorna um char que indica ou não a presença de um dispositivo
 */
unsigned char OW_reset_pulse(void) {
    
    unsigned char presence;
    
    OW_PIN_DIRECTION = 0;           // set as output  
    OW_WRITE_PIN = 0;               //pull line low
    delay_us(480);                  // leave it low for 480us

    OW_PIN_DIRECTION = 1;           // set as input

    delay_us(60); // wait for presence

    if (OW_READ_PIN == 0) {
        delay_us(480);                      
        presence = 0;                           // 0 is detected
    }else {
        delay_us(480);                          // 1 is not detected  
        presence = 1;
    }
    return presence;
}

/*
 * Função para enviar 1 bit para o slave 1 wire
 * Recebe com argumento o bit a enviar
 */
void OW_write_bit(int write_bit){
    
    write_bit = write_bit & 0x01;
    
    if(write_bit){
        OW_PIN_DIRECTION = 0;           // set as output
        OW_WRITE_PIN = 0;               // set high
        delay_us(5);                    // 5 us delay
        
        OW_PIN_DIRECTION = 0;           // set as input
        delay_us(60);                   // 60 us delay
    }else{
        OW_PIN_DIRECTION = 0;           // set as output
        OW_WRITE_PIN = 0;               // set high
        delay_us(70); // 70 us delay
        
        OW_PIN_DIRECTION = 1;           // set as input
        delay_us(2);                    // 2 us delay
    }
}

/*
 * Função para ler 1 bit ao slave 1 wire
 * Retorna o bit lido
 */
unsigned char OW_read_bit(void){

    unsigned char read_data;
    
    OW_PIN_DIRECTION = 0;           // set as output
    OW_WRITE_PIN = 0;               // set high
    delay_us(1);                    // 1 us delay
  
    OW_PIN_DIRECTION = 1;           // set as input
    delay_us(5);                    // 5 us delay
  
    read_data = OW_READ_PIN;        // read pin
    delay_us(55);                   // 55 us delay
    
    return read_data;
}

/*
 * Função para enviar 1 byte para o slave 1 wire
 * Recebe com argumento os dados para enviar
 */
void OW_write_byte(unsigned char write_data){
    
    unsigned char i,temp;
    
    for (i=0; i<8; i++){
        temp = write_data >> i;
        temp &= 0x01;
        OW_write_bit(temp); 
    }
    delay_ms(5);
}

/*
 * Funçao para ler um byte completo do slave 1 wire
 * Retorna o byte lido
 */
unsigned char OW_read_byte(void){

    unsigned char i, data=0;

    for (i = 0; i < 8; i++) {
        // read byte in and shift left
        if (OW_read_bit()) {
            data |= 0x01 << i;
        }
    } 
    delay_ms(6);
    
    return data;
}

/*
 * Delay in microseconds
 */
void delay_us(int us) {
    for(; us > 0; us--) {
        _CP0_SET_COUNT(0);
        while(_CP0_GET_COUNT() < 40);
    }
}

/*
 * Delay in milliseconds
 */
void delay_ms(int ms) {
    for(; ms > 0; ms--) {
        delay_us(1000);
    }
}

/* *****************************************************************************
 End of File
 */
