/*********************************************************************
 *
 *                  Boot Loader Simple Application
 *
 *********************************************************************
 * FileName:        main.c
 * Dependencies:
 * Processor:       PIC32
 *
 * Complier:        MPLAB C32
 *                  MPLAB IDE
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * The software supplied herewith by Microchip Technology Incorporated
 * (the “Company”) for its PIC32 Microcontroller is intended
 * and supplied to you, the Company’s customer, for use solely and
 * exclusively on Microchip PIC32 Microcontroller products.
 * The software is owned by the Company and/or its supplier, and is
 * protected under applicable copyright laws. All rights are reserved.
 * Any use in violation of the foregoing restrictions may subject the
 * user to criminal sanctions under applicable laws, as well as to
 * civil liability for the breach of the terms and conditions of this
 * license.
 *
 * THIS SOFTWARE IS PROVIDED IN AN “AS IS” CONDITION. NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 * TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 * IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 *
 * $Id: $
 * $Name: x.x $
 *
 **********************************************************************/

/*
Boot Loader Example Application
This project shows an application that works with the boot loader.  The application is almost 
same as a standard c program for pic32.  The  only difference is that this project use an updated procdef.ld linker file.  
This linker file sets the code to reside wholly in the program flash area and not use the Boot block area.  

Code and debug this application as any other standard application using real ice. just make sure this procdefs.ld is in your project folder.

When you are ready to deploy your app, program the PIC32  with the boot loader firmware, and then program your application 
to the PIC32 using the boot loader.  Now the PIC32 has both the boot loader and your application.

Note: make sure the boot loader and your application, both use the same fuse settings.  This is because the boot loader does not reprogram the fuse settings to the PIC.

*/
 
#include <stdlib.h>
#include <plib.h>

// Configuration Bit settings
// SYSCLK = 80 MHz (8MHz Crystal/ FPLLIDIV * FPLLMUL / FPLLODIV)
// PBCLK = 80 MHz
// Primary Osc w/PLL (XT+,HS+,EC+PLL)
// WDT OFF
// Use Dbg Comm channel 2
// Other options are don't care
//
#pragma config FPLLMUL = MUL_20, FPLLIDIV = DIV_2, FPLLODIV = DIV_1, FWDTEN = OFF
#pragma config POSCMOD = HS, FNOSC = PRIPLL, FPBDIV = DIV_1
#pragma config ICESEL = ICS_PGx2

#ifdef EXPLORER16
#define mInitAllLEDs()  {TRISA = 0; LATA = 0;}
#else
#define mInitAllLEDs()  {TRISD = 0; LATD = 0;}
#endif

#if   (((__PIC32_FEATURE_SET__ >= 100) && (__PIC32_FEATURE_SET__ <= 299)))
		#warning("TODO: For PIC32MX1xx/PIC32MX2xx devices, user must map the LED ports to required pins");
#endif

#ifdef EXPLORER16
#define mLED_1              LATAbits.LATA6
#define mLED_2              LATAbits.LATA7
#else
#define mLED_1              LATDbits.LATD0
#define mLED_2              LATDbits.LATD1
#endif


#define mLED_1_On()         mLED_1 = 1;
#define mLED_2_On()         mLED_2 = 1;

#define mLED_1_Tgl()         mLED_1 = !mLED_1;


#define SYS_FREQ 				(80000000L)
#define TOGGLES_PER_SEC			18
#define CORE_TICK_RATE	       (SYS_FREQ/2/TOGGLES_PER_SEC)

	
////////////////////////////////////////////////////////////
//
int main(void)
{
	unsigned int pb_clock;
	
	SYSTEMConfig(SYS_FREQ, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);

    OpenCoreTimer(CORE_TICK_RATE);
    
    mConfigIntCoreTimer((CT_INT_ON | CT_INT_PRIOR_2 | CT_INT_SUB_PRIOR_0));
    
    INTEnableSystemMultiVectoredInt();

	// Initialize the Led Port
	mInitAllLEDs();

	mLED_1_On();
	mLED_2_On();	

	while(1)
	{
		mLED_1 = ((ReadCoreTimer() & 0x0200000) != 0);
	}
		
	return 0;
}

////////////////////////////////////////////////////////////
// Core Timer Interrupts
//
void __ISR(_CORE_TIMER_VECTOR, ipl2) CoreTimerHandler(void)
{
    // clear the interrupt flag
    mCTClearIntFlag();
    
#ifdef EXPLORER16
    mPORTAToggleBits(BIT_7);  //mLED_2 = !mLED_2;
#else
	mPORTDToggleBits(BIT_1);  //mLED_2 = !mLED_2;
#endif
    // update the period
    UpdateCoreTimer(CORE_TICK_RATE);
}
