/**
 * @file delay.c
 * 
 */

/*********************
 *      INCLUDES
 *********************/
#include "delay.h"

/*********************
 *      DEFINES
 *********************/

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
 * Wait a given number of milliseconds.
 * @param delay the desired delay in microseconds
 */
void delay_ms(uint32_t delay) 
{
    uint32_t i;
    for(i = 0; i < delay; i++) {
        delay_us(1000);
    }
}

/**
 * Wait a given number of microseconds. 
 * Has to be adjusted with DELAY_US_BASE
 * @param delay the desired delay in microseconds
 */
void delay_us(uint32_t delay) 
{
	volatile uint32_t i, j, k = 0;

	for (i = 0; i < delay; i++) {
		for (j = 0; j < DELAY_US_BASE; j++)
			k++;
	}
}
/**********************
 *   STATIC FUNCTIONS
 **********************/
