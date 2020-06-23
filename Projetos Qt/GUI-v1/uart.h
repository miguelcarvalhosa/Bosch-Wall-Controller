
#ifndef UART_H
#define UART_H

/******************************Bibliotecas*****************************/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <stdint.h>
#include <wiringPi.h>
#include <wiringSerial.h>


/******************************Definicoes******************************/
#define TOTAL_CODES				3
#define CODE_OFF				0
#define CODE_SETPOINT			1
#define CODE_TEMPERATURE		2

#define PACKET_SIZE				15
#define PACKET_SYNC_OFFSET		3
#define PACKET_TEMP_OFFEST		11
#define	PACKET_NAME_DIV_LENGTH	10

#define	TOTAL_DIVISIONS			3
#define MIN_TEMP				0	//Tem de ser 0 por causa do estado ON/OFF
#define MAX_TEMP				70


/**************************Estruturas e Tipos**************************/
typedef struct {
	int 	id;
	uint8_t code;
	char 	division[PACKET_NAME_DIV_LENGTH + 1];
	int 	temperature;
} uart_frame_t;


/********************************Funcoes*******************************/
/*
 * Inicializacao da UART
 */
void uart_init(void);

/*
 * Leitura da UART. A funcao chama uart_frame_parsing() quando uma trama
 * se encontra completa para ser analisada.
 */
void uart_read(void);

/*
 * Envia para a UART a informacao contida em [uart_tx].
 */
void uart_send(void);

/*
 * Preenche os campos de [uart_rx] com base no pacote recebido.
 * Chamada apenas pela funcao uart_read().
 * Verifica se valores recebidos sao adequados
 * Devolve 1 caso sejam, 0 caso não
 */
int uart_frame_parsing(char* packet);

/*
 * Envia flags para a SM que indicam que tipo de informacao chegou
 */
void uart_triggerFlags(void);

/*
 * Chamada apos  flag de alteracao de temperatura
 * Poem nos ponteiros de entrada a temperatura e divisao
 */
void uart_getTemperature(int * temperature, int * division_id);

/*
 * Envia temperatura atual da divisao para a mesh
 */
void uart_setTemperature(void);

/* Chamada apos flag de alteracao de temperatura
 * Poem nos ponteiros de entrada o setpoint e divisao (na qual e para alterar)
 */
void uart_getSetpoint(int * setpoint, int * division_id);

/*
 * Envia setpoint da divisao atual para a mesh
 */
void uart_setSetpoint(int division_id);

/* Chamada apos flag que indica que um controlador foi ligado ou desligado
 * Coloca em division_ id a divisao que se atuou e em state o estado.
 */
void uart_getDisable(int * state, int * division_id);

/*
 * Desliga controlador de division_id
 */
void uart_setDisable(int division_id);

/*
 * Converte id na string da divisao
 * Devolve string de erro caso id nao esteja nos possiveis
 */
void id2str(int id, char* str);

/*
 * Transforma id na string da divisao correspondente
 */
int str2id(char * str);

/**************************Variaveis Externas**************************/
extern uart_frame_t frame_tx, frame_rx;

#endif
