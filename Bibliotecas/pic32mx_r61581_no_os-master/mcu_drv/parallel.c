/**
 * @file parallel.c
 * 
 */


/*********************
 *      INCLUDES
 *********************/
#include "parallel.h"

/*********************
 *      DEFINES
 *********************/
/*
 * Software parallel port pin out
 * DATA: PORTB
 * WR:   PORTE5
 * CS:   PORTE3
 * RESET:   PORTF3
 * RS (Command/Data): PORTE6
 */

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**
 * Initialize the software parallel port
 */
void parallel_init(void)
{
    TRISB = 0;                  /*Data*/
    TRISEbits.TRISE3 = 0;       /*CS*/
    TRISEbits.TRISE5 = 0;       /*WR*/
    TRISEbits.TRISE6 = 0;       /*RS*/
    TRISFbits.TRISF3 = 0;       /*RESET*/
}

/**
 * Write word to the parallel port
 * @param w a word to write
 */
void parallel_wr_word(uint16_t w)
{
    LATB = w;
    LATEbits.LATE5 = 0;         /*LOW impulse on WR pin*/
    LATEbits.LATE5 = 1;
}

/**
 * Write an array to the parallel port
 * @param array pointer to a memory block to write
 * @param length number of words (not bytes) to write
 */
void parallel_wr_array(uint16_t * array, uint32_t length)
{
    uint32_t i;
    
    for(i = 0; i < length; i++) {
        LATB = *array;
        LATEbits.LATE5 = 0;      /*LOW impulse on WR pin*/
        LATEbits.LATE5 = 1;
        array++;
    }
}

/**********************
 *   STATIC FUNCTIONS
 **********************/
