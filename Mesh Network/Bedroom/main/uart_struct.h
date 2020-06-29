#include <string.h>
#include <stdlib.h>


typedef struct {
	uint8_t code;
	char destination[11];
  	uint8_t value;
} uart_frame_t;
