/**
 * @file lv_delay.h
 * 
 */

#ifndef LV_DELAY_H
#define LV_DELAY_H

#ifdef __cplusplus
extern "C" {
#endif

/*********************
 *      INCLUDES
 *********************/
#include <stdint.h>
    
/*********************
 *      DEFINES
 *********************/
#define DELAY_US_BASE       5
    
/**********************
 *      TYPEDEFS
 **********************/

/**********************
 * GLOBAL PROTOTYPES
 **********************/
/**
 * Wait a given number of milliseconds.
 * @param delay the desired delay in microseconds
 */
void delay_ms(uint32_t delay);

/**
 * Wait a given number of microseconds. 
 * Has to be adjusted with DELAY_US_BASE
 * @param delay the desired delay in microseconds
 */
void delay_us(uint32_t delay); 

/**********************
 *      MACROS
 **********************/


#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /*LV_DELAY_H*/
