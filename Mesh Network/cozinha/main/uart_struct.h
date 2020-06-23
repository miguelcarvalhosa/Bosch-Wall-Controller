#include <string.h>
#include <stdlib.h>


typedef struct {
	uint8_t code;
	char* destination;
  	uint8_t offset;
} uart_frame_t;
