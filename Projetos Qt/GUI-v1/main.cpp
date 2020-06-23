
/******************************Bibliotecas*****************************/
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QTextCodec>
//#include <windows.h>

#include "backend.h"
#include "centralUnit.h"
#include "libSonar.h"
#include "uart.h"


/***********************************Flags**************************************/
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

volatile int fl_mesh_receivedTemp = 0;
volatile int fl_mesh_receivedSetpoint = 0;
volatile int fl_mesh_receivedOff	= 0;
int fl_endProgram = 0;


/******************************Variaveis Globais*******************************/
BackEnd *backend = BackEnd::instance(); // Instanciação da classe BackEnd

state_t  gl_currentState = st_sleep;
state_t  gl_nextState = st_sleep;

int 	 gl_totalUsers;
User 	 gl_user[MAX_NUMBER_OF_USERS];
int  	 gl_thisUser;

time_t 	 gl_confirmUser_startTime = time(0);
time_t   gl_createUser_insert_startTime = time(0);
time_t   gl_menus_timeout = time(0);

int      gl_totalDivisons;
Division gl_division[MAX_NUMBER_OF_DIVISIONS];
int 	 gl_thisDivision = 0;

Sonar 	 gl_sonar;


/************************************Main**************************************/
using namespace std;

int main(int argc, char *argv[]) {
    printf("div = %d", gl_thisDivision);
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));       // Para poder utilizar o teclado virtual no ecrã
    QTextCodec::setCodecForLocale(QTextCodec::codecForName("UTF-8"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    // Registo da classe BackEnd
    qmlRegisterSingletonType<BackEnd>("backend", 1, 0, "BackEnd", &BackEnd::qmlInstance);
    //qmlRegisterType<BackEnd>("backend", 1, 0, "BackEnd");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);
    //app.exec();


    aux_initSystem();
	uart_init();
	gl_sonar.init(SONAR_TRIGGER_PIN, SONAR_ECHO_PIN);
    while(1) {
		//process_event();
		uart_read();
        itgr_mesh_checkSchedule();
        itgr_sens_getTemperature();
		process_mesh_events();
		if(fl_endProgram) { break; }
        process_state();
        app.processEvents();	//NOTA
        fflush(stdout);
		//Sleep(100);
    }

    Py_Finalize();

    return 0;
}



/***********************************Funcoes************************************/
/******************************************************************************/
/*************Funcoes para executar a maquina de estados principal*************/
/******************************************************************************/
/* Funcao para processar eventos e ativar flags */
void process_event(void) {
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

        case 'c':
        	fl_mesh_receivedTemp = 1;
        	break;

        case 'd':
        	fl_mesh_receivedSetpoint = 1;
        	break;

        case 'e':
        	fl_mesh_receivedOff = 1;
        	break;

		case 'z':
			fl_endProgram = 1;
			break;
    	default:
            break;
    }
}

/* Funcao que processa a maquina de estados principal */
void process_state(void) {

    switch (gl_currentState) {

        /* Estado para display em modo sleep */
        case st_sleep:
            if(backend->getCurrentMenu() != SLEEP_PAGE) {
                itgr_ui_changeMenu(m_sleep);
            }
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

/* Funcao que processa as mensagens recebidas pela mesh */
void process_mesh_events(void){
	int idx;
	bool changed[gl_totalDivisons];


	if(fl_mesh_receivedTemp){
		fl_mesh_receivedTemp = 0;
		printf("[MESH] Rececao de uma temperatura\n");
		idx = itgr_mesh_getTemperature();
		memset(changed,0,gl_totalDivisons);
		changed[idx] = 1;
		itgr_ui_setTemperature(changed);
	}

	else if(fl_mesh_receivedSetpoint){
		fl_mesh_receivedSetpoint = 0;
		printf("[MESH] Rececao de um setpoint\n");
		idx = itgr_mesh_getSetpoint();
		memset(changed,0,gl_totalDivisons);
		changed[idx] = 1;
		itgr_ui_setSetpoint(changed);
	}

	else if(fl_mesh_receivedOff){
		fl_mesh_receivedOff = 0;
		printf("[MESH] Estado do controlador\n");
		idx = itgr_mesh_getDisable();
		memset(changed,0,gl_totalDivisons);
		changed[idx] = 1;
		itgr_ui_setDisable(changed);
	}

}

/******************************************************************************/
/****************Funcoes para executar em cada estado principal****************/
/******************************************************************************/
/* Funcao para processar o estado st_sleep */
void func_sleep(void) {
    if (itgr_sens_readSonar()) {
        putstr("Passar do st_sleep para st_recognition\n");
        gl_nextState = st_recognition;
    }
}

/* Funcao para processar o estado st_recognition */
void func_recognition(void) {
    gl_thisUser = itgr_recog_getName();
    if(gl_thisUser >= 0) {
        printf("Utilizador reconhecido %s\n", gl_user[gl_thisUser].name);
        putstr("Passar do st_recognition para st_confirmUser\n");
        gl_confirmUser_startTime = time(0);
        itgr_ui_changeMenu(m_confirmUser);
        gl_nextState = st_confirmUser;
    }
    else {
		putstr("Utilizador desconhecido\n");
        putstr("Passar do st_recognition para st_createUser\n");
        itgr_ui_changeMenu(m_validation);
        gl_nextState = st_createUser;
    }
}

/*Funcao para processar o estado de st_confirmUser */
void func_confirmUser(void) {
    double tm = difftime(time(0), gl_confirmUser_startTime);
    printf("tempo: %f\n", tm);
    if(tm >= CONFIRM_USER_TIMEOUT) {
        putstr("Passar do st_confirmUser para st_modifySetpoint\n");
        gl_nextState = st_modifySetpoint;
    }
    else if(fl_ui_confirmUser_accessMenus == 1) {
        fl_ui_confirmUser_accessMenus = 0;
        itgr_ui_changeMenu(m_adjustTemperature);
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
void func_modifySetpoint(void) {
	bool changed[gl_totalDivisons];
    float setpoint = 0;
    printf("Alterar Setpoint\n");
    setpoint = gl_user[gl_thisUser].setpoint;
    if(setpoint != 0) {
        itgr_mesh_setSetpoint(setpoint);
		memset(changed, 0, gl_totalDivisons);
		changed[gl_thisDivision] = 1;
		itgr_ui_setSetpoint(changed);
    }
    itgr_ui_changeMenu(m_adjustTemperature);
    putstr("Passar do st_modifySetpoint para st_menus\n");
    gl_menus_timeout = time(0);
    gl_nextState = st_menus;
}

/*Funcao para processar o estado COMPOSTO de st_createUser */
void func_createUser(void) {
    static state_createUser_t createUser_currentState = st_createUser_validation;
    static state_createUser_t createUser_nextState = st_createUser_validation;

    switch (createUser_currentState) {
        /* Estado para o utilizador dizer se pretende ou não criar conta */
        case st_createUser_validation:
            if(backend->getCurrentMenu() != NEW_USER_PAGE) {
                itgr_ui_changeMenu(m_validation);
            }
            createUser_nextState = func_createUser_validation();
            break;

        /* Estado para o utilizador inserir o seu nome e setpoint */
        case st_createUser_insert:
            if(backend->getCurrentMenu() != ADD_USER_PAGE) {
                itgr_ui_changeMenu(m_addUser);
            }
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
void func_menus(void) {

    if(time(0) - gl_menus_timeout >= SYSTEM_TIMEOUT) {
        printf("Timeout nos menus\n");
        gl_nextState = st_sleep;
    }

    else if(fl_ui_adjust_setpointsChanged){
        fl_ui_adjust_setpointsChanged = 0;
        bool setpointChanged[gl_totalDivisons];
        itgr_ui_adjustTemperature(setpointChanged);
        itgr_mesh_setSetpoint(setpointChanged);
    }

    else if(fl_ui_schedule_scheduleChanged){
        fl_ui_schedule_scheduleChanged = 0;
        itgr_ui_schedule();
    }

    else if(fl_ui_settings_gotosleep){
        fl_ui_settings_gotosleep = 0;
        printf("[UI] Carreguei no botao sleep\n");
        gl_nextState = st_sleep;
        itgr_ui_changeMenu(m_sleep);
    }

    else if(fl_ui_settings_changeUserSetpoint){
        fl_ui_settings_changeUserSetpoint = 0;
        printf("[UI] Carreguei no botao para mudar o setpoint de um utilizador\n");
        gl_user[gl_thisUser].setpoint = itgr_ui_getUserSetpoint();
        aux_updateUsers();
        printf("Atualizacao de setpoint: User: %s Setpoint %5.2f\n",gl_user[gl_thisUser].name, gl_user[gl_thisUser].setpoint);
    }

    else if(fl_ui_settings_addUser){
        fl_ui_settings_addUser = 0;
        printf("[UI] Carreguei no botao de adicionar utilizador\n");
        gl_nextState = st_createUser;
        itgr_ui_changeMenu(m_validation);
    }

}


/******************************************************************************/
/********************Funcoes para integração com a UI**************************/
/******************************************************************************/
/* Funcao para alterar o menu atual da UI */
void  itgr_ui_changeMenu(ui_menu_t menu) {
    switch (menu) {
        case m_sleep:
            backend->setCurrentMenu(SLEEP_PAGE);
            putstr("[UI] Ecrã m_sleep\n");
            break;
        case m_confirmUser:
            backend->setWelcomeUserName(gl_user[gl_thisUser].name);
            backend->setWelcomeTemperature((int)gl_user[gl_thisUser].setpoint);
            backend->setCurrentMenu(WELCOME_PAGE);
            putstr("[UI] Ecrã m_confirmUser\n");
            break;
        case m_validation:
            backend->setCurrentMenu(NEW_USER_PAGE);
            putstr("[UI] Ecrã m_validation\n");
            break;
        case m_addUser:
            backend->setCurrentMenu(ADD_USER_PAGE);
            putstr("[UI] Ecrã m_addUser\n");
            break;
        case m_adjustTemperature:
            backend->setCurrentMenu(ADJUST_PAGE);
            putstr("[UI] Ecrã m_adjustTemperature\n");
            break;
        case m_stats:
            backend->setCurrentMenu(STATS_PAGE);
            putstr("[UI] Ecrã m_stats\n");
            break;
        case m_schedule:
            backend->setCurrentMenu(SCHEDULE_PAGE);
            putstr("[UI] Ecrã m_schedule\n");
            break;
        case m_settings:
            backend->setCurrentMenu(SETTINGS_PAGE);
            putstr("[UI] Ecrã m_settings\n");
            break;
        default:
            break;
    }
}

/*Funcao para processar o estado de informacao de temperaturas */
void itgr_ui_adjustTemperature(bool *changed) {
    BackEnd::temperature_t temp = backend->getCurrentTemperatureSet(1);
    double temp_arr[] = {temp.room1, temp.room2, temp.room3, temp.room4, temp.room5};
    int temp_en_arr[] = {temp.room1en, temp.room2en, temp.room3en, temp.room4en, temp.room5en};
    // atualização da estrutura
    printf("[UI] Temperaturas lidas da UI:\n");
    for(int i=0; i < gl_totalDivisons; i++){
        gl_division[i].curSetpoint = temp_arr[i];

        if(gl_division[i].enableSetpoint != (bool)temp_en_arr[i]){
            gl_division[i].enableSetpoint = (bool)temp_en_arr[i];
            changed[i] = true;
        }else{
            changed[i] = false;
        }
        printf("\t%-13s %5.2f %d\n",gl_division[i].name,temp_arr[i],temp_en_arr[i]);
    }
}

/*Funcao para processar o estado de configuracao previa das temperaturas */
void itgr_ui_schedule(void) {
    BackEnd::schedule_t schedule = backend->getSchedule(1);

    // atualização da estrutura
    printf("[UI] Planeamento das temperaturas:\n");

    for (int i = 0; i < DAYS_OF_THE_WEEK; i++){

        gl_division[gl_thisDivision].sch_setpoint[i] = schedule.setpoint[i];
        gl_division[gl_thisDivision].timeIsValid[i] = (bool)schedule.state[i];
        gl_division[gl_thisDivision].start_time[i] = schedule.start_time[i];
        gl_division[gl_thisDivision].stop_time[i] = schedule.stop_time[i];


        printf("\t%d %5.2f %d\n",i,gl_division[gl_thisDivision].sch_setpoint[i],gl_division[gl_thisDivision].timeIsValid[i]);
        printf("\t%s", ctime(&gl_division[gl_thisDivision].start_time[i]));
        printf("\t%s", ctime(&gl_division[gl_thisDivision].stop_time[i]));
    }
}

/*Funcao para processar o estado de informacao de configuracao fl_manual da temperatura */
void itgr_ui_stats(void) {

}

/* Funcao para atualizar a estrutura gl_user com base nos dados lidos da UI.
 * Adiciona um novo utilizador ao sistema
 */
void  itgr_ui_getNewUserData(void) {
    const char* name = backend->getNewUserName();
    int temp = backend->getNewUserTemperature();
    gl_thisUser = gl_totalUsers;
    gl_totalUsers++;
    strcpy(gl_user[gl_thisUser].name, name);
    gl_user[gl_thisUser].setpoint = temp;
    aux_updateUsers();
    printf("[UI] Utilizador adicionado! Nome: %s Setpoint %f", gl_user[gl_thisUser].name, gl_user[gl_thisUser].setpoint);
}

/* Funcao para receber o novo setpoint introduzido por um utilizador na UI */
float itgr_ui_getUserSetpoint(void) {
    int temp = backend->getChangeUserTemperature();
    return (float)temp;
}

/* Funcao para dar update a temperatura atual da divisao na UI */
void  itgr_ui_setTemperature(bool *changed) {
	for(int i = 0;i < gl_totalDivisons;i++){
		if(changed[i]==1){
			backend->setCurrentTemperature(gl_division[i].curTemperature, i+1);
			printf("[UI] Temperatura atual da divisao %s enviada: %5.2f\n", gl_division[i].name,gl_division[i].curTemperature);
		}
	}
}

/* Funcao para dar update ao setpoint de qualquer divisao na UI */
void  itgr_ui_setSetpoint(bool *changed) {
	for(int i = 0;i < gl_totalDivisons;i++){
		if(changed[i]==1){
			backend->setCurrentTemperatureSet(gl_division[i].curSetpoint, gl_division[i].enableSetpoint, i+1);
			printf("[UI] Setpoint atual da divisao %s enviada: %5.2f\n", gl_division[i].name,gl_division[i].curSetpoint);
		}
	}
}

/* Funcao para dar disable de qualquer divisao na UI */
void  itgr_ui_setDisable(bool *changed) {
	for(int i = 0;i < gl_totalDivisons;i++){
		if(changed[i]==1){
			backend->setCurrentTemperatureSet(gl_division[i].curSetpoint, gl_division[i].enableSetpoint, i+1);
			printf("[UI] Divisao %s no estado: %d\n", gl_division[i].name,gl_division[i].enableSetpoint);
		}
	}
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
        gl_createUser_insert_startTime = time(0);
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
    double tm = difftime(time(0), gl_createUser_insert_startTime);
    printf("tempo: %f\n", tm);
	putstr("Estado st_createUser_insert\n");
	if(tm >= INSERT_USER_TIMEOUT) {
        nextState = st_createUser_end;
    }
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
/**************Funcoes para integracao com Reconhecimento Facial***************/
/******************************************************************************/
/*
 * Funcao que executa o algoritmo de rec. facial.
 * retorna o id do Utilizador ou -1 caso o utilizador seja desconhecido
*/
int itgr_recog_getName(void) {
    int id = -1;
    char *name;

    PyRun_SimpleString("import sys; sys.path.append('.')");
    PyObject* myModuleString = PyString_FromString((char*)"py_functions");
    PyObject* myModule = PyImport_Import(myModuleString);
    PyObject* myFunction = PyObject_GetAttrString(myModule,(char*)"py_createUser_getName");
    PyObject* myResult;
    myResult = PyObject_CallFunction(myFunction, NULL);
    name = PyString_AS_STRING(myResult);

    if(strcmp(name, "Unknown") != 0) {
        for (int i = 0; i < gl_totalUsers; i++) {
            if(strcmp(name, gl_user[i].name) == 0) {
                id = i;
            }
        }
    }
    return id;
}

/* Funcao bloqueante para tirar fotos ao utilizador que esta a ser criado */
void itgr_recog_takePhotos(void) {
    PyRun_SimpleString("import sys; sys.path.append('.')");
    PyObject* myModuleString = PyString_FromString((char*)"py_functions");
    PyObject* myModule = PyImport_Import(myModuleString);
    PyObject* myFunction = PyObject_GetAttrString(myModule,(char*)"py_createUser_capture");
    PyObject* args = Py_BuildValue("s", gl_user[gl_thisUser].name);
    PyObject_CallFunctionObjArgs(myFunction, args, NULL);
    putstr("[RECOG] Fotos tiradas ao utilizador com sucesso\n");
}

/* Funcao bloqueante para criar o classificador */
void itgr_recog_processPhotos(void) {
    PyRun_SimpleString("import sys; sys.path.append('.')");
    PyObject* myModuleString = PyString_FromString((char*)"py_functions");
    PyObject* myModule = PyImport_Import(myModuleString);
    PyObject* myFunction = PyObject_GetAttrString(myModule,(char*)"py_createUser_process");
    PyObject_CallFunction(myFunction, NULL);
    putstr("[RECOG] Classificador criado com sucesso\n");
}


/******************************************************************************/
/********************Funcoes para integracao com Rede Mesh*********************/
/******************************************************************************/
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
            itgr_mesh_setSetpoint(changed);
        }
        if(time2stop > 0 && gl_division[gl_thisDivision].sch_actuating[wd] == 1) {
            if(gl_division[gl_thisDivision].enableSetpoint == true && gl_division[gl_thisDivision].curSetpoint == gl_division[gl_thisDivision].sch_setpoint[wd]) {
                gl_division[gl_thisDivision].enableSetpoint = false;
                gl_division[gl_thisDivision].curSetpoint = 0;
                memset (changed,0,gl_totalDivisons);
                changed[gl_thisDivision] = 1;
                itgr_mesh_setSetpoint(changed);
            }
            gl_division[gl_thisDivision].sch_actuating[wd] = 0;
            tm *tm = localtime(&gl_division[gl_thisDivision].start_time[wd]);
            tm->tm_mday +=7;
            gl_division[gl_thisDivision].start_time[wd] = mktime(tm);
        }
    }
}

/* Funcao que envia para a rede mesh uma alteracao do setpoint baseado no utilizador */
void itgr_mesh_setSetpoint(float setpoint) {
	char buffer[10];
	snprintf(buffer, sizeof buffer, "%5.2f", setpoint);
	putstr("T: ");
	putstr(buffer);
	putstr(" - Setpoint enviado para a rede mesh\n");
	gl_division[gl_thisDivision].curSetpoint = setpoint;
	gl_division[gl_thisDivision].enableSetpoint = 1;
	uart_setSetpoint(gl_thisDivision);
}

/* Funcao que envia para a rede mesh uma alteracao de setpoints */
void itgr_mesh_setSetpoint(bool *changed) {
	putstr("[MESH] Setpoints enviados para a mesh: \n");
	for (int i = 0; i < gl_totalDivisons; i++){
		if(changed[i]){
			//enviar para rede mesh
			if(gl_division[i].enableSetpoint){
				uart_setSetpoint(i);
				char buffer[10];
				snprintf(buffer, sizeof buffer, "%5.2f", gl_division[i].curSetpoint);
				putstr("\tT: ");
				putstr(buffer);
				putstr(" - Setpoint enviado para a rede mesh na divisao: ");
				putstr(gl_division[i].name);
				putstr("\n");
			}else{
				uart_setDisable(i);
				putstr("\tSetpoint da temperatura desativado na divisao: ");
				putstr(gl_division[i].name);
				putstr("\n");
			}
		}
	}
}

/* Funcao que recebe um setpoint da rede mesh */
int itgr_mesh_getSetpoint(void){
	int setpoint = 15;
	int idx = 0;
	uart_getSetpoint(&setpoint, &idx);
	gl_division[idx].curSetpoint = setpoint;
	gl_division[idx].enableSetpoint = 1;
	printf("[MESH] Setpoint recebido %5.2f para a divisao %s\n",gl_division[idx].curSetpoint,gl_division[idx].name);
	return idx;
}

/* Funcao que da update a temperatura atual da divisao na rede mesh */
void itgr_mesh_setTemperature(void) {
	uart_setTemperature();
    printf("[MESH] Temperatura atual %5.2f enviada\n", gl_division[gl_thisDivision].curTemperature);
}

/* Funcao que recebe uma temperatura da rede mesh */
int itgr_mesh_getTemperature(void){
	int temp = 20;
	int idx = 0;
	uart_getTemperature(&temp, &idx);
	gl_division[idx].curTemperature = temp;
	printf("[MESH] Temperatura recebida %5.2f para a divisao %s\n",gl_division[idx].curTemperature,gl_division[idx].name);
	return idx;
}

/* Funcao que recebe o estado OFF da rede mesh*/
int itgr_mesh_getDisable(void){
	int idx;
	int state;
	uart_getDisable(&state, &idx);
	gl_division[idx].enableSetpoint = (bool)state;
	printf("[MESH] Controlador na divisao %s no estado %d\n",gl_division[idx].name,gl_division[idx].enableSetpoint);
	return idx;
}


/******************************************************************************/
/********************Funcoes para integracao com Sensores**********************/
/******************************************************************************/
/* Funcao que le o sensor de temperatura. Se gl_division[gl_thisDivision].curTemperature for alterada retorna 1 */
int itgr_sens_getTemperature(void) {
	int retVal = 0;
	static time_t lastSample = 0;
	float temp = 12;
	bool changed[gl_totalDivisons];

	if(time(0) - lastSample > TEMP_SAMPLING_TIME) {
		temp = aux_readDhtData();
		if(temp > 0) {
			gl_division[gl_thisDivision].curTemperature = temp;
			memset(changed,0,gl_totalDivisons);
			changed[gl_thisDivision] = 1;
			itgr_ui_setTemperature(changed);
			itgr_mesh_setTemperature();
			lastSample = time(0);
			retVal = 1;
		}
		else {
			retVal = 0;
		}
	}
	return retVal;
}

/* Funcao que le o sonar e caso um utilizador esteja proximo, ativa fl_userDetected*/
int  itgr_sens_readSonar(void) {
    int retval = 0;
    double distance = gl_sonar.distance(30000);
	if(distance < MIN_DETECT_DISTANCE && distance > 1) {
        retval = 1;
		printf("[SENS] Utilizador Detetado\n");
	}
    return retval;
}


/******************************************************************************/
/******************************Funcoes auxiliares******************************/
/******************************************************************************/
/* Funcao que inicia o sistema */
void aux_initSystem(void) {
    putstr("\nSystem Initialization!\n");
	aux_printDaysOfTheWeek();
    srand (time(NULL));
    aux_loadUsers();
    aux_loadDivisions();
    Py_Initialize();
}

/* Funcao que le do ficheiro que carrega os setpoints para a estrutura [gl_user] */
void aux_loadUsers(void) {
    ifstream in(USERS_FILE_PATH);
    in >> gl_totalUsers;
    for (int i = 0; i < gl_totalUsers; i++) {
        in >> gl_user[i].name >> gl_user[i].setpoint;
    }
    printf("%d Users Loaded!\n", gl_totalUsers);
    in.close();
}

/* Funcao que atualiza o txt com os dados dos utilizadores */
void aux_updateUsers(void) {
    ofstream file (USERS_FILE_PATH);
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
    backend->setRoomIndex(gl_thisDivision+1);
    string aux;
    ifstream in(DIVISIONS_FILE_PATH);
    in >> gl_totalDivisons;
    getline(in,aux,'\n');
    for (int i = 0; i < gl_totalDivisons; i++) {
        getline(in,aux,'\n');
        strcpy(gl_division[i].name,aux.c_str());
        backend->setRoomNames(i+1, gl_division[i].name);
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

/* Funcao que devolve o tempo do tipo time_t baseado nos parametros */
time_t aux_setTime(int year, int mon, int day, int hour, int min, int sec) {
  struct tm y2k = {0};
  y2k.tm_hour = hour-1;    y2k.tm_min = min;   y2k.tm_sec = sec;
  y2k.tm_year = year-1900; y2k.tm_mon = mon-1; y2k.tm_mday = day;
  return mktime(&y2k);
}

/* Funcao que devolve a temperatura atual lida pelo sensor DHT */
int aux_readDhtData(void) {
	static int data[5] = { 0, 0, 0, 0, 0 };

	uint8_t laststate	= HIGH;
	uint8_t counter		= 0;
	uint8_t j			= 0, i;
	static float c = 16;

	data[0] = data[1] = data[2] = data[3] = data[4] = 0;

	/* pull pin down for 18 milliseconds */
	pinMode( DHT_PIN, OUTPUT );
	digitalWrite( DHT_PIN, LOW );
	delay( 18 );

	/* prepare to read the pin */
	pinMode( DHT_PIN, INPUT );

	/* detect change and read data */
	for ( i = 0; i < 85; i++ ) {
		counter = 0;
		while(digitalRead( DHT_PIN ) == laststate ) {
			counter++;
			delayMicroseconds(1);
			if(counter == 255 ) {
				break;
			}
		}
		laststate = digitalRead( DHT_PIN );

		if(counter == 255 )
			break;

		/* ignore first 3 transitions */
		if ( (i >= 4) && (i % 2 == 0) ) {
			/* shove each bit into the storage bytes */
			data[j / 8] <<= 1;
			if ( counter > 16 )
				data[j / 8] |= 1;
			j++;
		}
	}

	/*
	 * check we read 40 bits (8bit x 5 ) + verify checksum in the last byte
	 * print it out if data is good
	 */
	if ((j >= 40) && (data[4] == ((data[0] + data[1] + data[2] + data[3]) & 0xFF))){
		c = (float)(((data[2] & 0x7F) << 8) + data[3]) / 10;
		if ( c > 125 ) {
			c = data[2];	// for DHT11
		}
		if ( data[2] & 0x80 ) {
			c = -c;
		}
	}
	printf( "[SENS]Temperature = %.1f *C\n", c);
	return (int)c;
}

/* Funcao que informa o utilizador sobre o numero de dias da semana */
void aux_printDaysOfTheWeek(void) {
	printf("A week has %d days. Have a nice day :)\n", DAYS_OF_THE_WEEK);
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
