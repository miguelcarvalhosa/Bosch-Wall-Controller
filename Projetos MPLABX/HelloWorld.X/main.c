
#include <stdio.h>
#include <stdlib.h>
#include "pic32_config.h"

/*
 * 
 */
int main(int argc, char** argv) {

	TRISEbits.TRISE0 = 0;
	LATEbits.LATE0 = 1;
	
	while(1) {
		
	}
	
	return (EXIT_SUCCESS);
}

