/*
 * File:   statemachine.c
 * Author: micael
 *
 * Created on January 28, 2020, 4:20 PM
 */

/* Inclusao de bibliotecas */
#include <iostream>
#include <fstream>
#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/* Definicao de constantes */
#define CONFIRM_USER_TIMEOUT	 20
#define SYSTEM_TIMEOUT			 15
#define MAX_NUMBER_OF_USERS		 10
#define	MAX_LENGTH_USER_NAME	 20
#define MAX_LENGTH_DIVISION_NAME 20
#define DAYS_OF_THE_WEEK 		 7
#define MAX_NUMBER_OF_DIVISIONS  10
#define TEMP_SAMPLING_TIME		 10

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

/* Prototipos de funcoes */
char  getch(void);
void  putstr(const char * str);

void  process_event();
void  process_state();

void  func_sleep();
void  func_recognition();
void  func_confirmUser();
void  func_modifySetpoint();
void  func_createUser();
void  func_menus();

//void  func_firstmenu();
void  itgr_ui_adjustTemperature(bool *changed);
void  itgr_ui_stats(void);
void  itgr_ui_schedule(void);
void  itgr_ui_settings(void);

state_createUser_t func_createUser_validation(void);
state_createUser_t func_createUser_insert(void);
state_createUser_t func_createUser_capture(void);
state_createUser_t func_createUser_process(void);
state_createUser_t func_createUser_end(void);

int   itgr_recog_getName(void);
void  itgr_recog_takePhotos(void);
void  itgr_recog_processPhotos(void);
void  itgr_mesh_modifySetpoint(float setpoint);
void  itgr_mesh_modifySetpoint(bool *changed);
void  itgr_mesh_checkSchedule(void);
void  itgr_mesh_updateTemperature(void);
void  itgr_ui_changeMenu(ui_menu_t menu);
void  itgr_ui_getNewUserData(void);
float itgr_ui_getUserSetpoint(int id);
void  itgr_ui_updateTemperature(void);



int   itgr_sens_getTemperature(void);


void  aux_initSystem(void);
void  aux_loadUsers(void);
void  aux_loadDivisions(void);
time_t aux_setTime(int year, int mon, int day, int hour, int min, int sec);
void  aux_updateUsers(void);

/* Flags para mudanca da estados */
int fl_userDetected = 0;
int fl_ui_confirmUser_recogtionFailed = 0, fl_ui_confirmUser_accessMenus = 0;
int fl_ui_validation_success = 0;
int fl_ui_validation_failure = 0;
int fl_ui_addUser_userDataReady = 0;
int fl_ui_adjust_setpointsChanged = 0;
int fl_ui_schedule_scheduleChanged = 0;
int fl_ui_settings_gotosleep = 0;
int fl_ui_settings_changeUserSetpoint = 0;
int fl_ui_settings_addUser = 0;

/* Variaveis Globais */
state_t gl_currentState = st_sleep;
state_t gl_nextState = st_sleep;

int 	 gl_totalUsers;
User 	 gl_user[MAX_NUMBER_OF_USERS];
int  	 gl_thisUser;

time_t 	 gl_confirmUser_startTime;
time_t   gl_menus_timeout;

int      gl_totalDivisons;
Division gl_division[MAX_NUMBER_OF_DIVISIONS];
int 	 gl_thisDivision = 1;

using namespace std;


/* Função main */
int main(void) {
	aux_initSystem();
    while (1) {
		itgr_mesh_checkSchedule();
		itgr_sens_getTemperature();
		process_event();
        process_state();
    }
    return 0;
}


/******************************************************************************/
/*************Funcoes para executar a maquina de estados principal*************/
/******************************************************************************/
/* Funcao para processar eventos e ativar flags */
void process_event() {
	char ch;
    putstr("\nEnviar caracter: ");
    ch = getch();
    switch (ch) {
        case '1':
            fl_userDetected = 1;
            break;

        case '2':
            fl_ui_confirmUser_accessMenus = 1;
            break;

        case '3':
            fl_ui_confirmUser_recogtionFailed = 1;
            break;

        case '4':
			fl_ui_validation_success = 1;
            break;

        case '5':
			fl_ui_validation_failure = 1;
            break;

        case '6':
			fl_ui_addUser_userDataReady = 1;
            break;

        case '7':
        	fl_ui_adjust_setpointsChanged = 1;
            break;

        case '8':
        	fl_ui_schedule_scheduleChanged = 1;
            break;

        case '9':
			gl_division[gl_thisDivision].curSetpoint = 15;
            break;

        case '0':
        	fl_ui_settings_gotosleep = 1;
            break;

        case 'a':
        	fl_ui_settings_changeUserSetpoint = 1;
        	break;

        case 'b':
        	fl_ui_settings_addUser = 1;
        	break;

    	default:
            break;
    }
}

/* Funcao que processa a maquina de estados principal */
void process_state() {

    switch (gl_currentState) {

        /* Estado para display em modo sleep */
        case st_sleep:
            func_sleep();
            break;

        /* Estado para o reconhecimento facial */
        case st_recognition:
            func_recognition();
            break;

        /* Estado para menu de confirmacao do Utilizador */
        case st_confirmUser:
            func_confirmUser();
            break;

		case st_createUser:
			func_createUser();
			break;

		case st_modifySetpoint:
			func_modifySetpoint();
			break;

		case st_menus:
			func_menus();
			break;
    }
    gl_currentState = gl_nextState;

}


/******************************************************************************/
/****************Funcoes para executar em cada estado principal****************/
/******************************************************************************/
/* Funcao para processar o estado st_sleep */
void func_sleep() {
	if (fl_userDetected) {
		fl_userDetected = 0;
        putstr("Passar do st_sleep para st_recognition\n");
        gl_nextState = st_recognition;
    }
    else {
        putstr("Ficar no st_sleep\n");
    }
}

/* Funcao para processar o estado st_recognition */
void func_recognition() {
	gl_thisUser = itgr_recog_getName();

	if(gl_thisUser >= 0) {
		printf("Utilizador reconhecido %s\n", gl_user[gl_thisUser].name);
		putstr("Passar do st_recognition para st_confirmUser\n");
		gl_confirmUser_startTime = time(0);
		itgr_ui_changeMenu(m_confirmUser);
		gl_nextState = st_confirmUser;
	}
	else {
		putstr("Passar do st_recognition para st_createUser\n");
		itgr_ui_changeMenu(m_validation);
		gl_nextState = st_createUser;
	}
}

/*Funcao para processar o estado de st_confirmUser */
void func_confirmUser() {
	double tm = difftime(time(0), gl_confirmUser_startTime);
	printf("tempo: %f\n", tm);
	if(tm >= CONFIRM_USER_TIMEOUT) {
		putstr("Passar do st_confirmUser para st_modifySetpoint\n");
		gl_nextState = st_modifySetpoint;
	}
	else if(fl_ui_confirmUser_accessMenus == 1) {
		fl_ui_confirmUser_accessMenus = 0;
		putstr("Passar do st_confirmUser para st_menus\n");
		gl_menus_timeout = time(0);
		gl_nextState = st_menus;
	}
	else if(fl_ui_confirmUser_recogtionFailed == 1) {
		fl_ui_confirmUser_recogtionFailed = 0;
		putstr("Passar do st_confirmUser para st_recognition\n");
        gl_nextState = st_recognition;
	}
}

/*Funcao para processar o estado de st_modifySetpoint */
void func_modifySetpoint() {
	float setpoint = 0;
	printf("Alterar Setpoint\n");
	setpoint = gl_user[gl_thisUser].setpoint;
	if(setpoint != 0) {
		itgr_mesh_modifySetpoint(setpoint);
	}
	putstr("Passar do st_modifySetpoint para st_menus\n");
	gl_menus_timeout = time(0);
	gl_nextState = st_menus;
}

/*Funcao para processar o estado COMPOSTO de st_createUser */
void func_createUser() {
	static state_createUser_t createUser_currentState = st_createUser_validation;
	static state_createUser_t createUser_nextState = st_createUser_validation;

	switch (createUser_currentState) {
		/* Estado para o utilizador dizer se pretende ou não criar conta */
		case st_createUser_validation:
			createUser_nextState = func_createUser_validation();
			break;

		/* Estado para o utilizador inserir o seu nome e setpoint */
		case st_createUser_insert:
			createUser_nextState = func_createUser_insert();
			break;

		/* Estado para o Utilizador tirar fotografias */
		case st_createUser_capture:
			createUser_nextState = func_createUser_capture();
			break;

		/* Estado para o processamento e criação do classificador */
		case st_createUser_process:
			createUser_nextState = func_createUser_process();
			break;

		/* Estado para terminar o processo de criação de utilizador */
		case st_createUser_end:
			createUser_nextState = func_createUser_end();
			break;

	}
	createUser_currentState = createUser_nextState;
}

/*Funcao para processar o estado COMPOSTO de st_menus */
void func_menus() {

	if(time(0) - gl_menus_timeout >= SYSTEM_TIMEOUT) {
		printf("Timeout nos menus\n");
		gl_nextState = st_sleep;
	}

	if(fl_ui_adjust_setpointsChanged){
		fl_ui_adjust_setpointsChanged = 0;
		bool setpointChanged[gl_totalDivisons];
		itgr_ui_adjustTemperature(setpointChanged);
		itgr_mesh_modifySetpoint(setpointChanged);
	}

	else if(fl_ui_schedule_scheduleChanged){
		fl_ui_schedule_scheduleChanged = 0;
		itgr_ui_schedule();
	}

	else if(fl_ui_settings_gotosleep){
		fl_ui_settings_gotosleep = 0;
		printf("[UI] Carreguei no botao sleep\n");
		gl_nextState = st_sleep;
		func_sleep();
	}

	else if(fl_ui_settings_changeUserSetpoint){
		fl_ui_settings_changeUserSetpoint = 0;
		printf("[UI] Carreguei no botao para mudar o setpoint de um utilizador\n");
		gl_user[gl_thisUser].setpoint = itgr_ui_getUserSetpoint(gl_thisUser);
		aux_updateUsers();
		printf("Atualizacao de setpoint: User: %s Setpoint %5.2f\n",gl_user[gl_thisUser].name, gl_user[gl_thisUser].setpoint);
	}

	else if(fl_ui_settings_addUser){
		fl_ui_settings_addUser = 0;
		printf("[UI] Carreguei no botao de adicionar utilizador\n");
		gl_nextState = st_createUser;
		func_createUser();
	}

}


/******************************************************************************/
/********************Funcoes para integração com a UI**************************/
/******************************************************************************/
/*Funcao para processar o estado do menu principal*/
/*void func_firstmenu() {
}
*/

/*Funcao para processar o estado de informacao de temperaturas */
void itgr_ui_adjustTemperature(bool *changed) {
	// get do Carva
	float setpoint;
	float temperature;
	bool enableSetpoint;
	// atualização da estrutura
	printf("[UI] Temperaturas lidas da UI:\n");
	for(int i=0; i < gl_totalDivisons; i++){
		setpoint = rand()%5 + 30;
		temperature = rand()%5 + 30;
		enableSetpoint = rand()%2;
		srand(time(NULL));

		gl_division[i].curSetpoint = setpoint;
		gl_division[i].curTemperature = temperature;
		if(gl_division[i].enableSetpoint != enableSetpoint){
			gl_division[i].enableSetpoint = enableSetpoint;
			changed[i] = true;
		}else{
			changed[i] = false;
		}
		printf("\t%-13s %5.2f %5.2f %d\n",gl_division[i].name,setpoint,temperature,enableSetpoint);
	}
}

/*Funcao para processar o estado de informacao de configuracao fl_manual da temperatura */
void itgr_ui_stats(void) {

}

/*Funcao para processar o estado de configuracao previa das temperaturas */
void itgr_ui_schedule(void) {
	// get do Carva

	float sch_setpoint[DAYS_OF_THE_WEEK];
	time_t start_time[DAYS_OF_THE_WEEK];
	time_t stop_time[DAYS_OF_THE_WEEK];
	bool timeIsValid[DAYS_OF_THE_WEEK];
	int hour, min;

	// atualização da estrutura
	printf("[UI] Planeamento das temperaturas:\n");

	for (int i = 0; i < DAYS_OF_THE_WEEK; i++){
		sch_setpoint[i] = rand()%10 + 40;
		timeIsValid[i] = 1;//rand()%2;
		hour = 22;
		min = 14;

		start_time[i] = aux_setTime(2020,5,18,hour, min, 0);
		stop_time[i] = aux_setTime(2020,5,18,hour, min, 15);

		gl_division[gl_thisDivision].sch_setpoint[i] = sch_setpoint[i];
		gl_division[gl_thisDivision].timeIsValid[i] = timeIsValid[i];
		gl_division[gl_thisDivision].start_time[i] = start_time[i];
		gl_division[gl_thisDivision].stop_time[i] = stop_time[i];


		printf("\t%d %5.2f %d\n",i,sch_setpoint[i],timeIsValid[i]);
		printf("\t%s", ctime(&start_time[i]));
		printf("\t%s", ctime(&stop_time[i]));
	}
}

/*Funcao para processar o estado de informacao das definicoes */
void itgr_ui_settings(void) {

}

/* Funcao para alterar o menu atual da UI */
void  itgr_ui_changeMenu(ui_menu_t menu) {
	switch (menu) {
		case m_sleep:
			putstr("[UI] Ecrã m_sleep\n");
			break;
		case m_confirmUser:
			putstr("[UI] Ecrã m_confirmUser\n");
			break;
		case m_validation:
			putstr("[UI] Ecrã m_validation\n");
			break;
		case m_addUser:
			putstr("[UI] Ecrã m_addUser\n");
			break;
	}
}

/* Funcao para atualizar a estrutura gl_user com base nos dados lidos da UI.
 * Adiciona um novo utilizador ao sistema
 */
void  itgr_ui_getNewUserData(void) {
	gl_thisUser = gl_totalUsers;
	gl_totalUsers++;
	strcpy(gl_user[gl_thisUser].name, "Novo");
	gl_user[gl_thisUser].setpoint = 44;
	aux_updateUsers();
	printf("[UI] Utilizador adicionado! Nome: %s Setpoint %f", gl_user[gl_thisUser].name, gl_user[gl_thisUser].setpoint);
}

/* Funcao para receber o novo setpoint introduzido por um utilizador na UI */
float itgr_ui_getUserSetpoint(int id) {
	return 55.5;
}

/* Funcao para dar update a temperatura atual da divisao na UI */
void  itgr_ui_updateTemperature(void) {
	printf("[UI] Temperatura atual %5.2f enviada\n", gl_division[gl_thisDivision].curTemperature);
}

/******************************************************************************/
/*************Funcoes para executar no estado composto createUser**************/
/******************************************************************************/
state_createUser_t func_createUser_validation(void) {
	state_createUser_t nextState = st_createUser_validation;
	putstr("Estado st_createUser_validation\n");

	if(fl_ui_validation_success == 1) {
		fl_ui_validation_success = 0;
		nextState = st_createUser_insert;
		itgr_ui_changeMenu(m_addUser);
	}
	else if(fl_ui_validation_failure == 1) {
		fl_ui_validation_success = 0;
		nextState = st_createUser_end;
	}
	return nextState;
}

state_createUser_t func_createUser_insert(void) {
	state_createUser_t nextState = st_createUser_insert;
	putstr("Estado st_createUser_insert\n");
	if(fl_ui_addUser_userDataReady == 1) {
		fl_ui_addUser_userDataReady = 0;
		itgr_ui_getNewUserData();
		nextState = st_createUser_capture;
	}
	return nextState;
}

state_createUser_t func_createUser_capture(void) {
	state_createUser_t nextState;
	putstr("Estado st_createUser_capture\n");
	itgr_recog_takePhotos();
	nextState = st_createUser_process;
	return nextState;
}

state_createUser_t func_createUser_process(void) {
	state_createUser_t nextState;
	putstr("Estado st_createUser_process\n");
	itgr_recog_processPhotos();
	nextState = st_createUser_end;
	return nextState;
}

state_createUser_t func_createUser_end(void) {
	state_createUser_t nextState;
	putstr("Estado st_createUser_end\n");
	nextState = st_createUser_validation;
	itgr_ui_changeMenu(m_sleep);
	gl_nextState = st_sleep;
	return nextState;
}


/******************************************************************************/
/********Funcoes para integracao com Reconhecimento Facial e Rede Mesh*********/
/******************************************************************************/
/*
 * Funcao que executa o algoritmo de rec. facial.
 * retorna o id do Utilizador ou -1 caso o utilizador seja desconhecido
*/
int itgr_recog_getName(void) {
	/* Fazer reconhecimento aqui e apagar isto tudo aqui em baixo */
	int id;
	static int i = 0;
	if(i == 0) {
		id = rand() % gl_totalUsers;
		i = 1;
	}
	else {
		id = -1;
		i = 0;
	}
	return id;
}

/* Funcao bloqueante para tirar fotos ao utilizador que esta a ser criado */
void itgr_recog_takePhotos(void) {
	putstr("[RECOG] Fotos tiradas ao utilizador com sucesso\n");
}

/* Funcao bloqueante para criar o classificador */
void itgr_recog_processPhotos(void) {
	putstr("[RECOG] Classificador criado com sucesso\n");
}

/* Funcao que envia para a rede mesh uma alteracao do setpoint baseado no utilizador */
void itgr_mesh_modifySetpoint(float setpoint) {
	char buffer[10];
	snprintf(buffer, sizeof buffer, "%5.2f", setpoint);
	putstr("T: ");
	putstr(buffer);
	putstr(" - Temperatura enviada para a rede mesh\n");
}

/* Funcao que envia para a rede mesh uma alteracao de setpoints */
void itgr_mesh_modifySetpoint(bool *changed) {
	putstr("[MESH] Temperaturas enviadas para a mesh: \n");
	for (int i = 0; i < gl_totalDivisons; i++){
		if(changed[i]){
			//enviar para rede mesh
			if(gl_division[i].enableSetpoint){
				char buffer[10];
				snprintf(buffer, sizeof buffer, "%5.2f", gl_division[i].curSetpoint);
				putstr("\tT: ");
				putstr(buffer);
				putstr(" - Temperatura enviada para a rede mesh na divisao: ");
				putstr(gl_division[i].name);
				putstr("\n");
			}else{
				putstr("\tSetpoint da temperatura desativado na divisao: ");
				putstr(gl_division[i].name);
				putstr("\n");
			}
		}
	}
}

/* Funcao que processa o schedule e envia para a mesh sinais de ativar/desativar o sistema de climatizacao */
void itgr_mesh_checkSchedule(void) {
	time_t now;
	time (&now);
	tm *tim = localtime(&now);
	double time2start, time2stop;
	int wd = tim->tm_wday;
	bool changed[gl_totalDivisons];

	if(gl_division[gl_thisDivision].timeIsValid[wd] == 1) {
		time2start = (double)time(0) - (double)gl_division[gl_thisDivision].start_time[wd];
		time2stop = (double)time(0) - (double)gl_division[gl_thisDivision].stop_time[wd];
		if(time2start >= 0 && time2stop < 0 && gl_division[gl_thisDivision].sch_actuating[wd] == 0) {
			gl_division[gl_thisDivision].sch_actuating[wd] = 1;
			gl_division[gl_thisDivision].curSetpoint = gl_division[gl_thisDivision].sch_setpoint[wd];
			gl_division[gl_thisDivision].enableSetpoint = true;
			memset (changed,0,gl_totalDivisons);
			changed[gl_thisDivision] = 1;
			itgr_mesh_modifySetpoint(changed);
		}
		if(time2stop > 0 && gl_division[gl_thisDivision].sch_actuating[wd] == 1) {
			if(gl_division[gl_thisDivision].enableSetpoint == true && gl_division[gl_thisDivision].curSetpoint == gl_division[gl_thisDivision].sch_setpoint[wd]) {
				gl_division[gl_thisDivision].enableSetpoint = false;
				gl_division[gl_thisDivision].curSetpoint = 0;
				memset (changed,0,gl_totalDivisons);
				changed[gl_thisDivision] = 1;
				itgr_mesh_modifySetpoint(changed);
			}
			gl_division[gl_thisDivision].sch_actuating[wd] = 0;
			tm *tm = localtime(&gl_division[gl_thisDivision].start_time[wd]);
			tm->tm_mday +=7;
			gl_division[gl_thisDivision].start_time[wd] = mktime(tm);
		}
	}
}

/* Funcao que da update a temperatura atual da divisao na rede mesh */
void itgr_mesh_updateTemperature(void) {
	printf("[MESH] Temperatura atual %5.2f enviada\n", gl_division[gl_thisDivision].curTemperature);
}

/* Funcao que le o sensor de temperatura. Se gl_division[gl_thisDivision].curTemperature for alterada retorna 1 */
int itgr_sens_getTemperature(void) {
	int retVal = 0;
	static time_t lastSample = 0;
	static float generated_temp = 12;

	if(time(0) - lastSample > TEMP_SAMPLING_TIME) {
		gl_division[gl_thisDivision].curTemperature = generated_temp;
		generated_temp++;
		if(generated_temp >= 30) { generated_temp = 15; }
		itgr_ui_updateTemperature();
		itgr_mesh_updateTemperature();
		lastSample = time(0);
		retVal = 1;
	}
	return retVal;
}

/******************************************************************************/
/******************************Funcoes auxiliares******************************/
/******************************************************************************/
/* Funcao que inicia o sistema */
void aux_initSystem(void) {
	putstr("\nSystem Initialization!\n");
	srand (time(NULL));
	aux_loadUsers();
	aux_loadDivisions();
}

/* Funcao que le do ficheiro que carrega os setpoints para a estrutura [gl_user] */
void aux_loadUsers(void) {
	ifstream in("users.txt");
	in >> gl_totalUsers;
	for (int i = 0; i < gl_totalUsers; i++) {
		in >> gl_user[i].name >> gl_user[i].setpoint;
	}
	printf("%d Users Loaded!\n", gl_totalUsers);
	in.close();
}

/* Funcao que atualiza o txt com os dados dos utilizadores */
void aux_updateUsers(void) {
	ofstream file ("users.txt");
	if (file.is_open()) {
    	file << gl_totalUsers << '\n';
		for (int i = 0; i < gl_totalUsers; i++) {
			file << gl_user[i].name << '\t' << gl_user[i].setpoint << '\n';
		}
    	file.close();
  	}
  	else {
		cout << "Unable to open file\n";
	}
}

/* Funcao que le do ficheiro que carrega as divisioes para a estrutura [gl_division] */
void aux_loadDivisions(void){
	string aux;
	ifstream in("divisions.txt");
	in >> gl_totalDivisons;
	getline(in,aux,'\n');
	for (int i = 0; i < gl_totalDivisons; i++) {
		getline(in,aux,'\n');
		strcpy(gl_division[i].name,aux.c_str());
		gl_division[i].curSetpoint = 1;
		gl_division[i].curTemperature = 1;
		gl_division[i].enableSetpoint = false;
		for (int j=0; j < DAYS_OF_THE_WEEK; j++){
			gl_division[i].start_time[j] = time(0);
			gl_division[i].stop_time[j] = time(0);
			gl_division[i].timeIsValid[j] = false;
			gl_division[i].sch_actuating[j] = false;
		}
	}
	printf("%d Divisions Loaded!\n", gl_totalDivisons);
	in.close();
}

/* Funcao devolve o tempo do tipo time_t baseado nos parametros */
time_t aux_setTime(int year, int mon, int day, int hour, int min, int sec) {
  struct tm y2k = {0};
  y2k.tm_hour = hour-1;    y2k.tm_min = min;   y2k.tm_sec = sec;
  y2k.tm_year = year-1900; y2k.tm_mon = mon-1; y2k.tm_mday = day;
  return mktime(&y2k);
}

/******************************************************************************/
/*****************************Funcoes para teste*******************************/
/******************************************************************************/
/* Funcao que le um char do terminal de forma bloqueante */
char getch(void) {
	char c;
	cin >> c;
	return c;
}

/* Funcao que imprime a string str */
void putstr(const char * str) {
    cout << str;
}


/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
/******************** A partir daqui e um buraco negro ************************/
/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/*Funcao para processar o estado COMPOSTO de st_menus */
#if 0
void func_menus() {
	static ui_menu_t ui_currentState = m_adjustTemperature;
	static ui_menu_t ui_nextState = m_adjustTemperature;

	switch(ui_currentState){
		/* Estado para processar o ecrã de ajustamento da temperatura */
		case m_adjustTemperature:
			ui_nextState = func_adjustTemperature();
			break;

		/* Estado para processar o ecrã de estatísticas */
		case m_stats:
			ui_nextState = func_stats();
			break;

		/* Estado para processar o ecrã de agendamento da temperatura */
		case m_schedule:
			ui_nextState = func_schedule();
			break;

		/* Estado para processar o ecrã de definições */
		case m_settings:
			ui_nextState = func_settings();
			break;

	}
	ui_currentState = ui_nextState;

}
#endif
