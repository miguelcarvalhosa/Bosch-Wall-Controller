/* 
 * File:   main.c
 * Author: Miguel Carvalhosa
 *
 * Created on 25 de Janeiro de 2020, 14:13
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/attribs.h>
#include <proc/p32mx795f512h.h>
#include "lvgl/lvgl.h"
#include "pic32_config.h"
#include "RA8875.h"
#include "uart.h"

/*
 * Protótipos das funções
 */
void timer1_config(void);
void spi2_config(void);
void my_disp_flush(lv_disp_t * disp, const lv_area_t * area, lv_color_t * color_p);


/*
 * Main
 */
int main(int argc, char** argv) {
	
	EnableInterrupts();		// Enables global das interrupções
	EnableMultivector();
	timer1_config();
	spi2_config();
	//uart1_config(9600, 8, 0, 1);
	lv_init();
	RA8875_begin();
	RA8875_displayOn(1);
	RA8875_backlight(1, 255);
	
	/*
	static lv_disp_buf_t disp_buf;									// display buffer
	static lv_color_t buf[LV_HOR_RES_MAX * 10];                     //Declare a buffer for 10 lines//
	lv_disp_buf_init(&disp_buf, buf, NULL, LV_HOR_RES_MAX * 10);    //Initialize the display buffer//
	
	lv_disp_drv_t disp_drv;               //Descriptor of a display driver
	lv_disp_drv_init(&disp_drv);          //Basic initialization
	disp_drv.flush_cb = my_disp_flush;    //Set your driver function
	disp_drv.buffer = &disp_buf;          //Assign the buffer to the display
	lv_disp_drv_register(&disp_drv);      //Finally register the driver
	
	lv_obj_t * scr1  = lv_obj_create(NULL, NULL);
	
	lv_obj_t  * calendar = lv_calendar_create(scr1, NULL);
	lv_obj_set_size(calendar, 230, 230);
    lv_obj_align(calendar, NULL, LV_ALIGN_IN_TOP_LEFT, 10, 0);
	//lv_calendar_set_style(calendar, LV_CALENDAR_STYLE_BG, &lv_style_transp);
	
	
	//Create styles for the keyboard
    static lv_style_t rel_style, pr_style;

    lv_style_copy(&rel_style, &lv_style_btn_rel);
    rel_style.body.radius = 0;
    rel_style.body.border.width = 1;

    lv_style_copy(&pr_style, &lv_style_btn_pr);
    pr_style.body.radius = 0;
    pr_style.body.border.width = 1;

    //Create a keyboard and apply the styles
    lv_obj_t *kb = lv_kb_create(scr1, NULL);
    lv_kb_set_cursor_manage(kb, true);
    lv_kb_set_style(kb, LV_KB_STYLE_BG, &lv_style_transp_tight);
    lv_kb_set_style(kb, LV_KB_STYLE_BTN_REL, &rel_style);
    lv_kb_set_style(kb, LV_KB_STYLE_BTN_PR, &pr_style);
	
	lv_obj_t *bt1 = lv_btn_create(scr1, NULL);
	lv_obj_align(bt1, NULL, LV_ALIGN_IN_TOP_MID, 0, 50);
	lv_obj_t *lb1 = lv_label_create(bt1, NULL);
    lv_label_set_text(lb1, "Botao 1");
	
	static const char * btns[] ={"Cancelar", "OK", ""};
    lv_obj_t * mbox1 = lv_mbox_create(scr1, NULL);
    lv_mbox_set_text(mbox1, "Mensagem com dois botoes.");
    lv_mbox_add_btns(mbox1, btns);
    lv_obj_set_width(mbox1, 200);
    lv_obj_align(mbox1, NULL, LV_ALIGN_IN_TOP_RIGHT, -50, 50); //Align to the corner
	
	
	lv_scr_load(scr1);
	
	
	TRISFbits.TRISF0 = 1;
	*/
	
	RA8875_fillScreen(RA8875_BLUE);
	delay_ms(1000);
	RA8875_fillScreen(RA8875_WHITE);
	
	
	while(1) {
			
	}
	
	
	return (EXIT_SUCCESS);
}


/*
 * Configuração do timer 2. f = 1kHz /  T = 1ms
 */
void timer1_config() {
	T1CONbits.TCKPS = 0;	// K_prescaler = 1
	PR1 = 39999;
	TMR1 = 0;				// Reset ao registo de contagem
	IPC1bits.T1IP = 2;		// Prioridade das interrupções do timer
	IEC0bits.T1IE = 1;		// Enable das interrupções do timer
	IFS0bits.T1IF = 0;		// Reset à flag de interrupção do timer
	T1CONbits.TON = 1;
}


/*
 * Rotina de serviço à interrupção do timer 1
 */
void __ISR(_TIMER_1_VECTOR) T1ISR(void) {
	lv_tick_inc(1);
	lv_task_handler();
	IFS0bits.T1IF = 0;
}


/*
 * Função para copiar um array de pixeis para uma área do display
 */
void my_disp_flush(lv_disp_t * disp, const lv_area_t * area, lv_color_t * color_p) {
	short x = area->x1;
	short y = area->y1;
	for(y = area->y1; y <= area->y2; y++) {
        for(x = area->x1; x <= area->x2; x++) {
			RA8875_drawPixel(x, y, color_p->full);
            color_p++;
        }
    }
	
	/*short x = area->x1;
	short y = area->y1;
	unsigned int char_sent = 0;
	unsigned short color = 0;
	writeReg(RA8875_CURH0, x);
	writeReg(RA8875_CURH1, x >> 8);
	writeReg(RA8875_CURV0, y);
	writeReg(RA8875_CURV1, y >> 8);
	//writeReg(RA8875_MWCR0, (readReg(RA8875_MWCR0) & ~RA8875_MWCR0_DIRMASK) | RA8875_MWCR0_LRTD);
	writeCommand(RA8875_MRWC);
	SPI2BUF = RA8875_DATAWRITE;
	for(y = area->y1; y <= area->y2; y++) {
        for(x = area->x1; x <= area->x2; x++) {
            color = color_p->full;
			SPI2BUF = color >> 8;
			SPI2BUF = color;
			while(SPI2STATbits.SPIBUSY);
            color_p++;
			char_sent++;
        }
    }*/
	
    lv_disp_flush_ready(disp);         /* Indicate you are ready with the flushing*/
}


/*
 * Função para configurar o SPI2
 */
void spi2_config() {
	SPI2CONbits.MSTEN = 1;		// Master
	SPI2CONbits.ENHBUF = 1;		// Ativar FIFOs de tx e rx
	SPI2CONbits.MSSEN = 1;		// Ativar o SS
	char trash;
	while(SPI2STATbits.SPIRBE == 0) trash = SPI2BUF;	// Limpar o FIFO de receção
	SPI2STATCLR = 1 << 6;		// Limpar a flag de overflow de receção
	SPI2BRG = 1;				// f_sck ~= 3.33 MHz (5)  10 MHz (1)
	SPI2CONbits.CKP = 1;		// idle when SCK is high
	SPI2CONbits.CKE = 0;		// transição de relógio de active para idle
	SPI2CONbits.SMP = 1;		// sampling no meio do tempo de receção
	SPI2CONbits.MODE32 = 0;		// palavras de 8 bits
	SPI2CONbits.MODE16 = 0;
	SPI2CONbits.ON = 1;
}