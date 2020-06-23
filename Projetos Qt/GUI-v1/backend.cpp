#include "backend.h"
#include <QQmlEngine>

extern int fl_ui_adjust_setpointsChanged;
extern int fl_ui_confirmUser_recogtionFailed;
extern int fl_ui_confirmUser_accessMenus;
extern int fl_ui_validation_success;
extern int fl_ui_validation_failure;
extern int fl_ui_addUser_userDataReady;
extern int fl_ui_schedule_scheduleChanged;
extern int fl_ui_settings_changeUserSetpoint;
extern int fl_ui_settings_gotosleep;
extern int fl_ui_settings_addUser;


BackEnd* BackEnd::m_pThis = nullptr;
BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
}


BackEnd *BackEnd::instance()
{
    if (m_pThis == nullptr) // avoid creation of new instances
        m_pThis = new BackEnd;
    return m_pThis;
}


QObject *BackEnd::qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine) {
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    // C++ and QML instance they are the same instance
    return BackEnd::instance();
}


/* Funcao devolve o tempo do tipo time_t baseado nos parametros */
time_t BackEnd::aux_setTime(int year, int mon, int day, int hour, int min, int sec) {
  struct tm y2k = {0};
  y2k.tm_hour = hour-1;   y2k.tm_min = min; y2k.tm_sec = sec;
  y2k.tm_year = year-1900; y2k.tm_mon = mon-1; y2k.tm_mday = day;
  return mktime(&y2k);
}


int BackEnd::getCurrentMenu() {
    return currentMenu;
}


void BackEnd::setCurrentMenu(int menu) {
    currentMenu = menu;
    currentMenuChanged();
}


int BackEnd::getRoomIndex() {
    return roomIndex;
}


void BackEnd::setRoomIndex(int idx) {
    roomIndex = idx;
    roomIndexChanged();
}


QList<QString> BackEnd::getRoomNames() {
    QList<QString> list = {roomNames.room1, roomNames.room2, roomNames.room3, roomNames.room4, roomNames.room5};
    return list;
}


void BackEnd::setRoomNames(int room, char *name) {
    switch(room) {
        case 1:
            strcpy(roomNames.room1, name);
        break;
        case 2:
            strcpy(roomNames.room2, name);
        break;
        case 3:
            strcpy(roomNames.room3, name);
        break;
        case 4:
            strcpy(roomNames.room4, name);
        break;
        case 5:
            strcpy(roomNames.room5, name);
        break;
        default:
        break;
    }
    roomNamesChanged();
}


QList<double> BackEnd::getCurrentTemperature() {
    QList<double> temp = {0,0,0,0,0};
    temp[0] = currentTemperature.room1;
    temp[1] = currentTemperature.room2;
    temp[2] = currentTemperature.room3;
    temp[3] = currentTemperature.room4;
    temp[4] = currentTemperature.room5;
    return temp;
}


BackEnd::temperature_t BackEnd::getCurrentTemperature(int foo) {
    return currentTemperature;
}


void BackEnd::setCurrentTemperature(QList<double> temp) {
    currentTemperature.room1 = temp[0];
    currentTemperature.room2 = temp[1];
    currentTemperature.room3 = temp[2];
    currentTemperature.room4 = temp[3];
    currentTemperature.room5 = temp[4];
}


void BackEnd::setCurrentTemperature(double temp, int room) {
    switch(room) {
        case 1:
            currentTemperature.room1 = temp;
        break;
        case 2:
            currentTemperature.room2 = temp;
        break;
        case 3:
            currentTemperature.room3 = temp;
        break;
        case 4:
            currentTemperature.room4 = temp;
        break;
        case 5:
            currentTemperature.room5 = temp;
        break;
        default:
        break;
    }
    currentTemperatureChanged();
}


QList<double> BackEnd::getCurrentTemperatureSet() {
    QList<double> temp = {0,0,0,0,0,0,0,0,0,0};
    temp[0] = currentTemperatureSet.room1;
    temp[1] = currentTemperatureSet.room2;
    temp[2] = currentTemperatureSet.room3;
    temp[3] = currentTemperatureSet.room4;
    temp[4] = currentTemperatureSet.room5;
    temp[5] = currentTemperatureSet.room1en;
    temp[6] = currentTemperatureSet.room2en;
    temp[7] = currentTemperatureSet.room3en;
    temp[8] = currentTemperatureSet.room4en;
    temp[9] = currentTemperatureSet.room5en;
    return temp;
}


BackEnd::temperature_t BackEnd::getCurrentTemperatureSet(int foo) {
    return currentTemperatureSet;
}


void BackEnd::setCurrentTemperatureSet(QList<double> temp) {
    currentTemperatureSet.room1 = temp[0];
    currentTemperatureSet.room2 = temp[1];
    currentTemperatureSet.room3 = temp[2];
    currentTemperatureSet.room4 = temp[3];
    currentTemperatureSet.room5 = temp[4];
    currentTemperatureSet.room1en = temp[5];
    currentTemperatureSet.room2en = temp[6];
    currentTemperatureSet.room3en = temp[7];
    currentTemperatureSet.room4en = temp[8];
    currentTemperatureSet.room5en = temp[9];
    fl_ui_adjust_setpointsChanged = 1;
}


void BackEnd::setCurrentTemperatureSet(double temp, int on, int room) {
    switch(room) {
        case 1:
            currentTemperatureSet.room1 = temp;
            currentTemperatureSet.room1en = on;
        break;
        case 2:
            currentTemperatureSet.room2 = temp;
            currentTemperatureSet.room2en = on;
        break;
        case 3:
            currentTemperatureSet.room3 = temp;
            currentTemperatureSet.room3en = on;
        break;
        case 4:
            currentTemperatureSet.room4 = temp;
            currentTemperatureSet.room4en = on;
        break;
        case 5:
            currentTemperatureSet.room5 = temp;
            currentTemperatureSet.room5en = on;
        break;
        default:
        break;
    }
    currentTemperatureSetChanged();
}


void BackEnd::setSchedule(QList<int> list) {
    /* Recebe uma lista de inteiros que representa o planeamento para um dia.
     * A lista tem a seguinte estrutura: {day, state, setpoint, start_time_h, start_time_m, stop_time_h, stop_time_m}
     * day:           0 a 6
     * state:         0 ou 1
     * setpoint:      10 a 30
     * start_time_h:  0 a 24
     * start_time_m:  0 a 59
     * stop_time_h:   0 a 24
     * stop_time_m:   0 a 59
     */

    time_t foo = time(0);
    struct tm *curr_time = localtime(&foo);
    int today = curr_time->tm_wday;
    int day_offset = list[0] - today;
    if(day_offset < 0) day_offset += 7;

    time_t start_time = aux_setTime(curr_time->tm_year+1900, curr_time->tm_mon+1, curr_time->tm_mday+day_offset, list[3], list[4], 0);
    time_t stop_time = aux_setTime(curr_time->tm_year+1900, curr_time->tm_mon+1, curr_time->tm_mday+day_offset, list[5], list[6], 0);
    int state = list[1];
    int setpoint = list[2];
    schedule.state[list[0]] = state;
    schedule.setpoint[list[0]] = setpoint;
    schedule.start_time[list[0]] = start_time;
    schedule.stop_time[list[0]] = stop_time;
    fl_ui_schedule_scheduleChanged = 1;
}


QList<int> BackEnd::getSchedule() {
    /*
     * Envia para o frontend uma lista de inteiros que representa o planeamento para toda a semana.
     * A lista tem uma sequência de 7 dias e a estrutura de casa dia é:
     * day:           0 a 6
     * state:         0 ou 1
     * setpoint:      10 a 30
     * start_time_h:  0 a 24
     * start_time_m:  0 a 59
     * stop_time_h:   0 a 24
     * stop_time_m:   0 a 59
     */

    QList<int> list = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

    // j -> posição na lista ,  i -> dia da semana
    int j = 0;
    for(int i=0; i<7; i++) {
        list[j] = i;    // day
        j++;
        list[j] = schedule.state[i];        // state
        j++;
        list[j] = schedule.setpoint[i];     // setpoint
        j++;
        struct tm *start_time = localtime(&schedule.start_time[i]);
        list[j] = start_time->tm_hour;      // start_time_h
        j++;
        list[j] = start_time->tm_min;       // start_time_m
        j++;
        struct tm *stop_time = localtime(&schedule.stop_time[i]);
        list[j] = stop_time->tm_hour;       // stop_time_h
        j++;
        list[j] = stop_time->tm_min;        // stop_time_m
        j++;
    }
    return list;
}


BackEnd::schedule_t BackEnd::getSchedule(int foo) {
    return schedule;
}


QString BackEnd::getWelcomeUserName() {
    QString str = QString::fromLocal8Bit(welcomeUserName);
    return str;
}


void BackEnd::setWelcomeUserName(const char *str) {
    strcpy(welcomeUserName, str);
    welcomeUserNameChanged();
}


int BackEnd::getWelcomeTemperature() {
    return welcomeTemperature;
}


void BackEnd::setWelcomeTemperature(int temp) {
    welcomeTemperature = temp;
    welcomeTemperatureChanged();
}


void BackEnd::setWelcomeButtons(int buttons) {
    switch(buttons) {
        case 1:
            fl_ui_confirmUser_recogtionFailed = 1;
        break;
        case 2:
            fl_ui_confirmUser_accessMenus = 1;
        break;
        default:
        break;
    }
}


void BackEnd::setNewUserButtons(int buttons) {
    switch(buttons) {
        case 1:
            fl_ui_validation_success = 1;
        break;
        case 2:
            fl_ui_validation_failure = 1;
        break;
        case 3:
            fl_ui_addUser_userDataReady = 1;
        break;
        default:
        break;
    }
}


const char* BackEnd::getNewUserName() {
    return newUserName;
}


void BackEnd::setNewUserName(QString str) {
    const char *username;
    QByteArray ba = str.toLatin1();
    username = ba.data();
    strcpy(newUserName, username);
}


int BackEnd::getNewUserTemperature() {
    return newUserTemperature;
}


void BackEnd::setNewUserTemperature(int temp) {
    newUserTemperature = temp;
}


int BackEnd::getChangeUserTemperature() {
    return changeUserTemperature;
}


void BackEnd::setChangeUserTemperature(int temp) {
    changeUserTemperature = temp;
    fl_ui_settings_changeUserSetpoint = 1;
}


void BackEnd::setSettingsButtons(int buttons) {
    switch(buttons) {
    case 1:
        fl_ui_settings_addUser = 1;
        break;
    case 2:
        fl_ui_settings_gotosleep = 1;
        break;
    default:
        break;
    }
}

