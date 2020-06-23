/**
 * @file parallel.h
 * 
 */

#ifndef PARALLEL_H
#define PARALLEL_H

#ifdef __cplusplus
extern "C" {
#endif

/*********************
 *      INCLUDES
 *********************/
#define  _SUPPRESS_PLIB_WARNING
#include <plib.h>
#include <stdint.h>
    
/*********************
 *      DEFINES
 *********************/

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 * GLOBAL PROTOTYPES
 **********************/

/**
 * Initialize the software parallel port
 */
void parallel_init(void);

/**
 * Write word to the parallel port
 * @param w a word to write
 */
void parallel_wr_word(uint16_t w);

/**
 * Write an array to the parallel port
 * @param array pointer to a memory block to write
 * @param length number of words (not bytes) to write
 */
void parallel_wr_array(uint16_t * array, uint32_t length);

/**********************
 *      MACROS
 **********************/


#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /*PARALLEL_H*/
