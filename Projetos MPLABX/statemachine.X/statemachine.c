/* 
 * File:   statemachine.c
 * Author: micae
 *
 * Created on January 28, 2020, 4:12 PM
 */
#include <stdio.h>
#include <stdlib.h>
#include "pic32_config.h"

/*
 * declaração dos diferentes estados
 */
typedef enum {
    sleep, recognition, confirm_user, modify_setpoint, first_menu,
    temperature_info, manual_config, settings, pre_config
} state_e;

/*
 * Flags para mudança de estados
 */
int user = 0, suspension = 0, success = 0, setpoint = 0, info = 0, manual = 0;
int prev = 0, def = 0, first = 0;

/*
 * chamada de funções
 */
void configUART(unsigned int baud, char parity, unsigned int stopbits);
char getch();
void putch(char byte2send);
void putstr(char *str);
void check_event();
void check_state();
void check_sleep();
void check_recognition();
void check_confirm_user();
void check_firstmenu();
void check_temperature_info();
void check_manual_config();
void check_pre_config();
void check_settings();

/*
 * variaveis
 */
state_e current_state = sleep;
state_e next_state = sleep;
char c;
int temp = 0; // sinal de saída para alterar setpoint

/*
 * 
 */
int main(void) {
    configUART(115200, 'N', 1);

    while (1) {
        check_event();
        check_state();
    }
    return 0;
}

/*
 * Configuração da UART1
 */
void configUART(unsigned int baud, char parity, unsigned int stopbits) {
    /* configurar baudrate */
    if ((baud >= 600) && (baud <= 115200))
        U1BRG = (int) ((PBCLK + 8 * baud) / (16 * baud)) - 1;
    else
        U1BRG = 10;
    U1MODEbits.BRGH = 0;

    /*configurar data bits (8), paridade e numero de stop bits*/
    switch (parity) {
        case 'E':
            U1MODEbits.PDSEL = 1;
            break;
        case 'O':
            U1MODEbits.PDSEL = 2;
            break;
        default:
            U1MODEbits.PDSEL = 0;
            break;
    }

    if (stopbits == 2)
        U1MODEbits.STSEL = 1;
    else
        U1MODEbits.STSEL = 0;

    /*Enable transmissor, recetor e UART1*/
    U1STAbits.UTXEN = 1;
    U1STAbits.URXEN = 1;
    U1MODEbits.ON = 1;
}

/*
 * Ler carater do teclado
 */
char getch() {
    if (U1STAbits.OERR == 1)
        U1STAbits.OERR = 0;
    while (U1STAbits.URXDA == 0);
    return U1RXREG;
}

/*
 * Imprimir Caracter 
 */
void putch(char byte2send) {
    while (U1STAbits.UTXBF == 1);
    U1TXREG = byte2send;
}

/*
 * Imprimir String 
 */
void putstr(char *str) {
    while (*str != '\0') {
        putch(*str);
        str++;
    }
}

/*
 * Função para ver eventos
 */
void check_event() {

    putstr("Enviar caracter: ");
    c = getch();

    switch (c) {
        case '1':
            user = 1;
            break;

        case '2':
            suspension = 1;
            break;

        case '3':
            success = 1;
            setpoint = 1;
            break;

        case '4':
            success = 1;
            setpoint = 0;
            break;

        case '5':
            success = 0;
            break;

        case '6':
            info = 1;
            break;

        case '7':
            manual = 1;
            break;

        case '8':
            prev = 1;
            break;

        case '9':
            def = 1;
            break;

        case '0':
            first = 1;
            break;

            /*default:
                putstr("Carater Inválido\n");
                break;*/
    }
}

void check_state() {

    /*ver mudanças de estado*/
    check_event();

    switch (current_state) {

            /*estado para display em modo sleep*/
        case sleep:
            check_sleep();
            break;

            /*estado para o reconhecimento facial*/
        case recognition:
            check_recognition();
            break;

            /*estado para menu de confirmação do user*/
        case confirm_user:
            check_confirm_user();
            break;

            /*Estado para o menu principal*/
        case first_menu:
            check_firstmenu();
            break;

            /*Estado para mostrar a informação das temperaturas*/
        case temperature_info:
            check_temperature_info();
            break;

            /*Estado para configurar manualmente a temperatura*/
        case manual_config:
            check_manual_config();
            break;

            /*Estado para configurar a temperatura previamente*/
        case pre_config:
            check_pre_config();
            break;

            /*Estado para as definições*/
        case settings:
            check_settings();
            break;

            // default -> pus retornar ao sleep provisoriamente
        default:
            putstr("Retornar ao sleep\n");
            next_state = sleep;
            break;
    }
    current_state = next_state;
    user = 0, suspension = 0, success = 0, setpoint = 0, info = 0, manual = 0, prev = 0, def = 0, first = 0;
}

/*Funçao para processar o estado sleep*/
void check_sleep(){
    suspension = 0;
    if (user) {
        putstr("Passar do sleep para recognition\n");
        next_state = recognition;
    }
    if (!user) {
        putstr("Ficar no sleep\n");
        next_state = current_state;
    }
}

/*Funçao para processar o estado de reconhecimento facial*/
void check_recognition() {
    user = 0;
    if (suspension) {
        putstr("Passar do recognition para sleep\n");
        next_state = sleep;
    }
    if (!suspension) {
        putstr("Passar do recognition para confirm user\n");
        next_state = confirm_user;
    }
}

/*Funçao para processar o estado de confirmação do reconhecimento previamente efetuado*/
void check_confirm_user(){
    if (!success) {
        putstr("Passar do confirm user para recognition\n");
        next_state = recognition;
    }
    if (success) {
        if (setpoint) {
            putstr("Alterar setpoint\n");
            next_state = modify_setpoint;
            temp = 1; /*sinal de saída para alterar setpoint*/
        } else {
            putstr("Ir para o Menu Principal\n");
            next_state = first_menu;
        }
    }
}
/*Funçao para processar o estado do menu principal*/
void check_firstmenu() {

    if (info) {
        putstr("Passar do menu principal para info das temperaturas\n");
        next_state = temperature_info;
    }
    if (manual) {
        putstr("Passar do menu principal para alteração manual da temperatura\n");
        next_state = manual_config;
    }
    if (prev) {
        putstr("Passar do menu principal para configuração previa da temperatura\n");
        next_state = pre_config;
    }
    if (def) {
        putstr("Passar do menu principal para o menu de definições\n");
        next_state = settings;
    }
    if (suspension) {
        putstr("Passar do menu principal para sleep\n");
        next_state = sleep;
    }
    if (!info && !suspension && !manual && !prev && !def && first) {
        putstr("Ficar no menu principal\n");
        next_state = current_state;
    }
}

/*Função para processar o estado de informação de temperaturas */
void check_temperature_info() {

    if (first) {
        putstr("Passar do menu de info de temperaturas para menu principal\n");
        next_state = first_menu;
    }
    if (manual) {
        putstr("Passar do menu de info de temperaturas para menu de configuração manual\n");
        next_state = manual_config;
    }
    if (prev) {
        putstr("Passar do menu de info de temperaturas para configuração prévia da temperatura\n");
        next_state = pre_config;
    }
    if (def) {
        putstr("Passar do menu de info de temperaturas para definições\n");
        next_state = settings;
    }
    if (suspension) {
        putstr("Passar do menu de info de temperaturas para sleep\n");
        next_state = sleep;
    }
    if (info && !suspension && !manual && !prev && !def && !first) {
        putstr("Ficar no menu de informações\n");
        next_state = current_state;
    }
}

/*Função para processar o estado de informação de configuração manual da temperatura */
void check_manual_config() {

    if (first) {
        putstr("Passar do menu de info de temperaturas para menu principal\n");
        next_state = first_menu;
    }
    if (prev) {
        putstr("Passar do menu de configuração prévia da temperatura para menu de configuração manual\n");
        next_state = pre_config;
    }
    if (info) {
        putstr("Passar do menu de configuração prévia da temperatura para menu de info das temperaturas\n");
        next_state = temperature_info;
    }
    if (def) {
        putstr("Passar do menu de configuração prévia da temperatura para definições\n");
        next_state = settings;
    }
    if (suspension) {
        putstr("Passar do menu de configuração prévia da temperatura para sleep\n");
        next_state = sleep;
    }
    if (!info && !suspension && !def && !first && !prev && manual) {
        putstr("Ficar no menu de configuração previa\n");
        next_state = current_state;
    }
}

/*Função para processar o estado de configuração prévia das temperaturas */
void check_pre_config() {

    if (first) {
        putstr("Passar do menu de configurar previamente a temperatura para menu principal\n");
        next_state = first_menu;
    }
    if (manual) {
        putstr("Passar do menu de configurar previamente a temperatura para menu de configuração manual\n");
        next_state = manual_config;
    }
    if (info) {
        putstr("Passar do menu de configurar previamente a temperatura para menu de info de temperaturas\n");
        next_state = temperature_info;
    }
    if (def) {
        putstr("Passar do menu configurar previamente a temperatura para definições\n");
        next_state = settings;
    }
    if (suspension) {
        putstr("Passar do menu de info de temperaturas para sleep\n");
        next_state = sleep;
    }
    if (!info && !suspension && !manual && prev && !def && !first) {
        putstr("Ficar no menu de informações\n");
        next_state = current_state;
    }
}

/*Função para processar o estado de informação das definições */
void check_settings() {

    if (first) {
        putstr("Passar do menu de definições para menu principal\n");
        next_state = first_menu;
    }
    if (manual) {
        putstr("Passar do menu definições para menu de configuração manual\n");
        next_state = manual_config;
    }
    if (prev) {
        putstr("Passar do menu de definições para configuração prévia da temperatura\n");
        next_state = pre_config;
    }
    if (info) {
        putstr("Passar do menu de definições para menu de info de temperaturas\n");
        next_state = temperature_info;
    }
    if (suspension) {
        putstr("Passar do menu de definições para sleep\n");
        next_state = sleep;
    }
    if (!info && !suspension && !manual && !prev && def && !first) {
        putstr("Ficar no menu de informações\n");
        next_state = current_state;
    }
}
