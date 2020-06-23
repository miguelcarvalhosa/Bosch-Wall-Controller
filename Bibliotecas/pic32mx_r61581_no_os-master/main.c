/**
 * @file main.c
 * 
 */

/*********************
 *      INCLUDES
 *********************/
#define _SUPPRESS_PLIB_WARNING
#include <peripheral/int.h>
#include <peripheral/system.h>
#include <stdio.h>

#include "configbits.h"

#include "lvgl/lvgl.h"
#include "mcu_drv/delay.h"
#include "lv_drivers/display/R61581.h"
#include "lv_examples/lv_apps/demo/demo.h"

/*********************
 *      DEFINES
 *********************/
#define CLOCK_CORE  80000000

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/
static void life_blink(void *param);

/**********************
 *  STATIC VARIABLES
 **********************/
LV_IMG_DECLARE(panda);
/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int main(void) 
{
    
    SYSTEMConfigPerformance(CLOCK_CORE);
    DDPCONbits.JTAGEN = 0;                  /* Disable JTAG */
    INTCONbits.MVEC = 1;                    /* Enable multi vector interrupt mode */
    __builtin_enable_interrupts();          /* Enable global interrupt */
    
    /*Start up blinking*/
    TRISDbits.TRISD7 = 0;
    uint8_t i;
    for(i = 0; i < 5; i++) {
        LATDbits.LATD7 =  0;
        delay_ms(50);
        LATDbits.LATD7 =  1;
        delay_ms(50);
    }
    
    /*Initialize LittlevGL*/
    lv_init();
    
    /*Initialize the display*/
    parallel_init();
    r61581_init();
    
    /*Register the display drier in LittlevGL*/
    lv_disp_drv_t disp_drv;
    lv_disp_drv_init(&disp_drv);
    disp_drv.disp_flush = r61581_flush;
    lv_disp_drv_register(&disp_drv);
    
    /*Start a Timer to measure the elapsed time for LittlevGL*/
    T2CONbits.TCKPS = 3;                        /*8 prescale*/
    PR2 = (uint32_t) CLOCK_CORE / 1000 / 8;     /*1 ms period time*/  
    IPC2bits.T2IP = 1;                          /*Interrupt priority*/
    IEC0bits.T2IE = 1;                          /*Enable interrupts*/
    T2CONbits.ON = 1;                           /*Start Timer*/
    
    /*Create a simple task to blibk a LED*/
    lv_task_create(life_blink, 300, LV_TASK_PRIO_LOW, NULL);
    
    /*Create a demo GUI*/
    demo_create();
    
    lv_obj_t * img = lv_img_create(lv_scr_act(), NULL);
    lv_img_set_src(img, &panda);
    
    /*Main while(1)*/
    while(1) {
        delay_ms(3);            /*A few delay to let the system breath*/
        lv_task_handler();      /*Process LittlevGL task periodically*/
    }
    
    return 0;   /*Never reach this*/
}

/**********************
 *   STATIC FUNCTIONS
 **********************/

/*An lv_task to blink a LED periodically*/
static void life_blink(void *param)
{
    static bool state = false;
    if(state) {
        state = false;
        LATDbits.LATD7 =  1;
    } else {
        state = true;
        LATDbits.LATD7 =  0;
        
    }
}

/* Timer 2 interrupt
 * Called in every milliseconds*/
void __ISR(_TIMER_2_VECTOR, IPL1AUTO) isr_timer2 (void)
{
    IFS0bits.T2IF = 0;      /*Clear the interrupt flag*/
    lv_tick_inc(1);         /*Tell LittlevGL 1 ms is elapsed*/    
}
