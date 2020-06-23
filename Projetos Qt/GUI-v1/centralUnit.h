
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
#define CONFIRM_USER_TIMEOUT	 10
#define INSERT_USER_TIMEOUT      120
#define SYSTEM_TIMEOUT			 300
#define MAX_NUMBER_OF_USERS		 20
#define	MAX_LENGTH_USER_NAME	 20
#define MAX_LENGTH_DIVISION_NAME 20
#define DAYS_OF_THE_WEEK 		 7
#define MAX_NUMBER_OF_DIVISIONS  10
#define TEMP_SAMPLING_TIME		 60
#define MIN_DETECT_DISTANCE		 10
#define	SONAR_TRIGGER_PIN		 4	/* GPIO-23 */
#define SONAR_ECHO_PIN			 5	/* GPIO-24 */
#define DHT_PIN					 3	/* GPIO-22 */
#define USERS_FILE_PATH          "/home/pi/users.txt"
#define DIVISIONS_FILE_PATH      "/home/pi/divisions.txt"

/**************************Estruturas e Tipos**************************/
/* Estados da maquina de estados principal */
typedef enum {
    st_sleep, st_recognition, st_confirmUser, st_createUser, st_modifySetpoint, st_menus
} state_t;

/* Estados da maquina de estados de func_createUser */
typedef enum {
	st_createUser_validation, st_createUser_insert,st_createUser_capture,
	st_createUser_process, st_createUser_end
} state_createUser_t;

/* Menus da UI */
typedef enum {
	m_sleep, m_confirmUser, m_validation, m_addUser, m_adjustTemperature,
	m_stats, m_schedule, m_settings
} ui_menu_t;

/* Estrutua dos utilizadores */
typedef struct User{
	char  name[MAX_LENGTH_USER_NAME];
	float setpoint;
} User;

/* Estrutua com os dados de uma divisão */
typedef struct{
	char   name[MAX_LENGTH_DIVISION_NAME];
	float  curSetpoint;
	float  curTemperature;
	bool   enableSetpoint;
	time_t start_time[DAYS_OF_THE_WEEK];
	time_t stop_time[DAYS_OF_THE_WEEK];
	bool   timeIsValid[DAYS_OF_THE_WEEK];
	float  sch_setpoint[DAYS_OF_THE_WEEK];
	bool   sch_actuating[DAYS_OF_THE_WEEK];
} Division;


/********************************Funcoes*******************************/
void  process_event(void);
void  process_state(void);
void  process_mesh_events(void);

void  func_sleep(void);
void  func_recognition(void);
void  func_confirmUser(void);
void  func_modifySetpoint(void);
void  func_createUser(void);
void  func_menus(void);

void  itgr_ui_changeMenu(ui_menu_t menu);
void  itgr_ui_adjustTemperature(bool *changed);
void  itgr_ui_schedule(void);
void  itgr_ui_stats(void);
void  itgr_ui_getNewUserData(void);
float itgr_ui_getUserSetpoint(void);
void  itgr_ui_setTemperature(bool *changed);
void  itgr_ui_setSetpoint(bool *changed);
void  itgr_ui_setDisable(bool *changed);

state_createUser_t func_createUser_validation(void);
state_createUser_t func_createUser_insert(void);
state_createUser_t func_createUser_capture(void);
state_createUser_t func_createUser_process(void);
state_createUser_t func_createUser_end(void);

int   itgr_recog_getName(void);
void  itgr_recog_takePhotos(void);
void  itgr_recog_processPhotos(void);

void  itgr_mesh_checkSchedule(void);
void  itgr_mesh_setSetpoint(float setpoint);
void  itgr_mesh_setSetpoint(bool *changed);
int   itgr_mesh_getSetpoint(void);
void  itgr_mesh_setTemperature(void);
int   itgr_mesh_getTemperature(void);
int   itgr_mesh_getDisable(void);

int	  itgr_sens_getTemperature(void);
int   itgr_sens_readSonar(void);

void   aux_initSystem(void);
void   aux_loadUsers(void);
void   aux_updateUsers(void);
void   aux_loadDivisions(void);
time_t aux_setTime(int year, int mon, int day, int hour, int min, int sec);
int	   aux_readDhtData(void);
void   aux_printDaysOfTheWeek(void);

char   getch(void);
void   putstr(const char * str);

/**************************Variaveis Externas**************************/
extern volatile int fl_mesh_receivedTemp;
extern volatile int fl_mesh_receivedSetpoint;
extern volatile int fl_mesh_receivedOff;

extern int      gl_thisDivision;
extern Division gl_division[MAX_NUMBER_OF_DIVISIONS];

#endif
