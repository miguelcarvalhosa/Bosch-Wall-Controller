/**
 * \file centralUnit.h
 *
 * \brief Unidade central de processamento do sistema.
 *
 * 
 * 
 * \author Miguel Carvalhosa (miguelcarvalhosa@ua.pt)
 * \author Hugo Leal (micaelleal1@ua.pt)
 * \author Fransico Pinto (fpinto@ua.pt)
 * \author Tânia Ferreira (tania.s.ferreira@ua.pt)
 * \author Gonçalo Cardoso (gnvcardoso@ua.pt)  
 */

#ifndef CENTRAL_UNIT_H
#define CENTRAL_UNIT_H

/******************************Bibliotecas*****************************/
#define PY_SSIZE_T_CLEAN				
#include <python2.7/Python.h>
#include <iostream>
#include <fstream>
#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "uart.h"
#include "libSonar.h"

/******************************Definicoes******************************/
#define CONFIRM_USER_TIMEOUT	 10		//!< Timeout do menu confirm user (em segundos)
#define INSERT_USER_TIMEOUT      120    //!< Timeout do menu insert user (em segundos)
#define SYSTEM_TIMEOUT			 300 	//!< Timeout do sistema (em segundos)
#define MAX_NUMBER_OF_USERS		 20		//!< Número máximo de utilizadores
#define	MAX_LENGTH_USER_NAME	 20		//!< Tamanho máximo do nome do utilizador
#define MAX_LENGTH_DIVISION_NAME 20		//!< Tamanho máximo do nome da divisão
#define DAYS_OF_THE_WEEK 		 7		//!< Número de dias da semana
#define MAX_NUMBER_OF_DIVISIONS  10		//!< Número máximo de divisões
#define TEMP_SAMPLING_TIME		 60		//!< Período de amostragem do sensor de temperatura (em segundos)
#define MAX_DETECT_DISTANCE		 10		//!< Distância máxima para que o utilizador seja detetado pelo sonar (em cm)
#define	SONAR_TRIGGER_PIN		 4		//!< Pino da Raspberry Pi - GPIO-23
#define SONAR_ECHO_PIN			 5		//!< Pino da Raspberry Pi - GPIO-24
#define DHT_PIN					 3		//!< Pino da Raspberry Pi - GPIO-22 
#define USERS_FILE_PATH          "/home/pi/users.txt"		//!< Path para o ficheiro com a informação dos utilizadores
#define DIVISIONS_FILE_PATH      "/home/pi/divisions.txt"	//!< Path para o ficheiro com a informação das divisões

/**************************Estruturas e Tipos**************************/
/**
*
* \brief Estados da maquina de estados principal.
*
*/
typedef enum {
    st_sleep, st_recognition, st_confirmUser, st_createUser, st_modifySetpoint, st_menus
} state_t;

/**
*
* \brief Estados da maquina de estados de func_createUser.
*
*/
typedef enum {
	st_createUser_validation, st_createUser_insert,st_createUser_capture,
	st_createUser_process, st_createUser_end
} state_createUser_t;

/**
*
* \brief Menus da UI. 
*
*/
typedef enum {
	m_sleep, m_confirmUser, m_validation, m_addUser, m_adjustTemperature,
	m_stats, m_schedule, m_settings
} ui_menu_t;

/**
*
* \brief Estrutura com os dados de um utilizador. 
*
*/
typedef struct User{
	char  name[MAX_LENGTH_USER_NAME]; 	//!< Nome do utilizador 
	float setpoint;						//!< Setpoint predefinido
} User;

/**
*
* \brief Estrutura com os dados de uma divisão.
*
*/
typedef struct{
	char   name[MAX_LENGTH_DIVISION_NAME]; 	//!< Nome da divisão
	float  curSetpoint; 					//!< Setpoint atual
	float  curTemperature;					//!< Temperatura atual
	bool   enableSetpoint;					//!< Ativação do setpoint 
	time_t start_time[DAYS_OF_THE_WEEK]; 	//!< Array (para uma semana) com o início de cada atuação pré-programada
	time_t stop_time[DAYS_OF_THE_WEEK];		//!< Array (para uma semana) com o fim de cada atuação pré-programada
	bool   timeIsValid[DAYS_OF_THE_WEEK];	//!< Array (para uma semana) com a ativação da pré-programação
	float  sch_setpoint[DAYS_OF_THE_WEEK];	//!< Array (para uma semana) com o setpoint da pré-programação
	bool   sch_actuating[DAYS_OF_THE_WEEK];	//!< Array (para uma semana) com a informação acerca da atuação devido à pré-programação
} Division;


/********************************Funcoes*******************************/
/**
 * \brief Funcao para processar eventos e ativar flags.
 *
 */
void  process_event(void);

/**
 * \brief Funcao que processa a maquina de estados principal.
 *
 */
void  process_state(void);

/**
 * \brief Funcao que processa as mensagens recebidas pela mesh.
 *
 */
void  process_mesh_events(void);

/**
 * \brief Funcao para processar o estado st_sleep.
 *
 */
void  func_sleep(void);

/**
 * \brief Funcao para processar o estado st_recognition.
 *
 */
void  func_recognition(void);

/**
 * \brief Funcao para processar o estado de st_confirmUser.
 *
 */
void  func_confirmUser(void);

/**
 * \brief Funcao para processar o estado composto de st_createUser.
 *
 */
void  func_modifySetpoint(void);

/**
 * \brief Funcao para processar o estado composto de st_menus.
 *
 */
void  func_createUser(void);

/**
 * \brief Funcao para processar o estado composto de st_menus.
 *
 */
void  func_menus(void);

/**
 * \brief Funcao para alterar o menu atual da UI.
 *
 * \param menu		Menu da UI para o qual se quer alterar.
 *
 */
void  itgr_ui_changeMenu(ui_menu_t menu);

/**
 * \brief Funcao para processar o estado de informacao de temperaturas.
 *
 * \param *changed 			Ponteiro para um array com gl_totalDivisions posições em que as posições com valor '1' correspondem a alterações da temperatura.		
 *
 */
void  itgr_ui_adjustTemperature(bool *changed);

/**
 * \brief Funcao para processar o estado de configuracao previa das temperaturas.
 *
 */
void  itgr_ui_schedule(void);

/**
 * \brief Funcao para processar o estado de informacao de configuracao fl_manual da temperatura.
 *
 */
void  itgr_ui_stats(void);

/**
 * \brief Funcao para atualizar a estrutura gl_user com base nos dados lidos da UI. Adiciona um novo utilizador ao sistema.
 *
 */
void  itgr_ui_getNewUserData(void);

/**
 * \brief Funcao para receber o novo setpoint introduzido por um utilizador na UI.
 *
 * \return Setpoint introduzido pelo utilizador			
 */
float itgr_ui_getUserSetpoint(void);

/**
 * \brief Funcao para dar update a temperatura atual da divisao na UI.
 *
 * \param *changed 			Ponteiro para um array com gl_totalDivisions posições em que as posições com valor '1' correspondem a alterações da temperatura.		
 *
 */
void  itgr_ui_setTemperature(bool *changed);

/**
 * \brief Funcao para dar update ao setpoint de qualquer divisao na UI.
 *
 * \param *changed 			Ponteiro para um array com gl_totalDivisions posições em que as posições com valor '1' correspondem a alterações da temperatura.		
 *
 */
void  itgr_ui_setSetpoint(bool *changed);

/**
 * \brief Funcao para dar disable de qualquer divisao na UI.
 *
 * \param *changed 			Ponteiro para um array com gl_totalDivisions posições em que as posições com valor '1' correspondem a alterações da temperatura.		
 *
 */
void  itgr_ui_setDisable(bool *changed);

/**
 * \brief Funcao que identifca a intenção do utilizador se registar no sistema.
 *
 * \return Próximo estado da FSM create_user. 
 *
 */
state_createUser_t func_createUser_validation(void);

/**
 * \brief Funcao que recebe os dados (nome e setpoint predefinido) de um novo utilizador
 *
 * \return Próximo estado da FSM create_user.
 *
 */
state_createUser_t func_createUser_insert(void);

/**
 * \brief Funcao que captura imagens de um novo utilizador.
 *
 * \return Próximo estado da FSM create_user.
 *
 */
state_createUser_t func_createUser_capture(void);

/**
 * \brief Funcao que processa as imagens de um novo utilizador.
 *
 * \return Próximo estado da FSM create_user.
 *
 */
state_createUser_t func_createUser_process(void);

/**
 * \brief Funcao que termina o processo de adição de um novo utilizador ao sistema.
 *
 * \return Próximo estado da FSM create_user.
 *
 */
state_createUser_t func_createUser_end(void);

/**
 * \brief Funcao que executa o algoritmo de reconhecimento facial. 
 *
 * \return Id do utilizador ou -1 caso o utilizador seja desconhecido
 * 			
 */
int   itgr_recog_getName(void);

/**
 * \brief Funcao bloqueante para tirar fotos ao utilizador que esta a ser criado.
 *
 */
void  itgr_recog_takePhotos(void);

/**
 * \brief Funcao bloqueante para criar o classificador.
 *
 */
void  itgr_recog_processPhotos(void);

/**
 * \brief Funcao que processa o schedule e envia para a mesh sinais de ativar/desativar o sistema de climatizacao.
 *
 */
void  itgr_mesh_checkSchedule(void);

/**
 * \brief  Funcao que envia para a rede mesh uma alteracao do setpoint baseado no utilizador.
 *
 * \param setpoint 			Setpoint do utilizador reconhecido facialmente pelo sistema.		
 *
 */
void  itgr_mesh_setSetpoint(float setpoint);

/**
 * \brief Funcao que envia para a rede mesh uma alteracao de setpoints.
 *
 * \param *changed 			Ponteiro para um array com gl_totalDivisions posições em que as posições com valor '1' correspondem a alterações de setpoint.		
 *
 */
void  itgr_mesh_setSetpoint(bool *changed);

/**
 * \brief Funcao que recebe um setpoint da rede mesh
 *
 * \return Valor do setpoint recebido através da rede mesh
 * 			
 */
int   itgr_mesh_getSetpoint(void);

/**
 * \brief Funcao que da update a temperatura atual da divisao na rede mesh.
 *
 */
void  itgr_mesh_setTemperature(void);

/**
 * \brief Funcao que recebe uma temperatura da rede mesh.
 *
 * \return Valor de temperatura recebido através da rede mesh.
 *
 */
int   itgr_mesh_getTemperature(void);

/**
 * \brief Funcao que recebe o estado OFF da rede mesh.
 *
 * \return Estado do atuador da divisão
 * \revtal 0 Atuador desligado
 * \revtal 1 Atuador ligado
 *
 */
int   itgr_mesh_getDisable(void);

/**
 * \brief Funcao que lê o sensor de temperatura.
 *
 * \return Alteração da temperatura.
 * \retval 1 gl_division[gl_thisDivision].curTemperature foi alterado
 * \retval 0 gl_division[gl_thisDivision].curTemperature não foi alterado
 *
 */
int	  itgr_sens_getTemperature(void);

/**
 * \brief Funcao que le o sonar e caso um utilizador esteja proximo, ativa fl_userDetected.
 *
 * \return Utilizador detetado.
 * \retval 1 Utilizador a menos de MAX_DETECT_DISTANCE cm. 
 * \retval 0 Utilizador não detetado.
 *
 */
int   itgr_sens_readSonar(void);

/**
 * \brief Funcao que inicia o sistema.
 *
 */
void   aux_initSystem(void);

/**
 * \brief Funcao que lê do ficheiro .txt. Carrega os setpoints para a estrutura gl_user.
 *
 */
void   aux_loadUsers(void);

/**
 * \brief Funcao que atualiza o ficheiro .txt com os dados dos utilizadores.
 *
 */
void   aux_updateUsers(void);

/**
 * \brief Funcao que lê do ficheiro .txt. Carrega as divisiões para a estrutura gl_division. 
 *
 */
void   aux_loadDivisions(void);

/**
 * \brief Funcao que devolve o tempo do tipo time_t baseado nos parametros.
 *
 * \param year 			Ano.
 * \param mon 			Mês.
 * \param day 			Dia.
 * \param hour 			Hora.
 * \param min  			Minuto.
 * \param sec 			Segundo.
 *
 */
time_t aux_setTime(int year, int mon, int day, int hour, int min, int sec);

/**
 * \brief Funcao que devolve a temperatura atual lida pelo sensor DHT.
 *
 * \return Temperetatura lida pelo sensor DHT.
 *
 */
int	   aux_readDhtData(void);

/**
 * \brief Funcao que informa o utilizador sobre o numero de dias da semana.
 *
 */
void   aux_printDaysOfTheWeek(void);

/**
 * \brief Funcao que le um char do terminal de forma bloqueante.
 *
 */
char   getch(void);

/**
 * \brief Funcao que imprime a string str.
 *
 * \param *str 			String a imprimir no terminal.		
 *
 */
void   putstr(const char * str);

/**************************Variaveis Externas**************************/
extern volatile int fl_mesh_receivedTemp;				//!< Temperatura recebida da rede mesh
extern volatile int fl_mesh_receivedSetpoint;			//!< Setpoint recebido da rede mesh
extern volatile int fl_mesh_receivedOff;				//!< ON/OFF recebido da rede mesh

extern int      gl_thisDivision;						//!< Indíce da divisão atual
extern Division gl_division[MAX_NUMBER_OF_DIVISIONS]; 	//!< Array do tipo Division com MAX_NUMBER_OF_DIVISIONS posições.

#endif
