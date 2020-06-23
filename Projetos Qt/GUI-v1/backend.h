#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <string>
#include <iostream>

#define MAX_LENGTH_USER_NAME 20
#define ADJUST_PAGE     0
#define SCHEDULE_PAGE   1
#define STATS_PAGE      2
#define SETTINGS_PAGE   3
#define WELCOME_PAGE    4
#define NEW_USER_PAGE   5
#define ADD_USER_PAGE   6
#define SLEEP_PAGE      7


class QQmlEngine;
class QJSEngine;


class BackEnd : public QObject
{
    Q_OBJECT

    /*
     * Propriedade que permite alternar entre os diversos menus
     */
    Q_PROPERTY(int currentMenu READ getCurrentMenu WRITE setCurrentMenu NOTIFY currentMenuChanged)

    /*
     * Propriedade que permite saber o indice da divisao atual
     */
    Q_PROPERTY(int roomIndex READ getRoomIndex NOTIFY roomIndexChanged)

    /*
     * Propriedade que permite saber o nome das divisões
     */
    Q_PROPERTY(QList<QString> roomNames READ getRoomNames NOTIFY roomNamesChanged)

    /*
     * Propriedade que permite trocar os valores das temperaturas atuais entre o frontend e o backend
     */
    Q_PROPERTY(QList<double> currentTemperature READ getCurrentTemperature WRITE setCurrentTemperature NOTIFY currentTemperatureChanged)

    /*
     * Propriedade que permite trocar os valores dos setpoints das temperaturas atuais entre o frontend e o backend
     */
    Q_PROPERTY(QList<double> currentTemperatureSet READ getCurrentTemperatureSet WRITE setCurrentTemperatureSet NOTIFY currentTemperatureSetChanged)

    /*
     * Propriedade que permite recever os valores do ecrã Schedule
     */
    Q_PROPERTY(QList<int> schedule READ getSchedule WRITE setSchedule)

    /*
     * Propriedade que permite enviar para o frontend o nome do utilizador que foi reconhecido
     */
    Q_PROPERTY(QString welcomeUserName READ getWelcomeUserName NOTIFY welcomeUserNameChanged)

    /*
     * Propriedade que permite enviar para o frontend o valor de temperatura associado ao utilizador que foi reconhecido
     */
    Q_PROPERTY(int welcomeTemperature READ getWelcomeTemperature NOTIFY welcomeTemperatureChanged)

    /*
     * Propriedade que permite indicar ao backend quando os botões da página Welcome são pressionados
     */
    Q_PROPERTY(int welcomeButtons WRITE setWelcomeButtons)

    /*
     * Propriedade que permite indicar ao backend quando os botões da página Add New User são pressionados
     */
    Q_PROPERTY(int newUserButtons WRITE setNewUserButtons)

    /*
     * Propriedade que permite trocar o nome do utilizador adicionado ao sistema
     */
    Q_PROPERTY(QString newUserName WRITE setNewUserName)

    /*
     * Propriedade que permite trocar a temperatura associada ao utilizador adicionado ao sistema
     */
    Q_PROPERTY(int newUserTemperature WRITE setNewUserTemperature)

    /*
     * Propriedade que permite alterar a temperatura associada ao utilizador adicionado ao sistema
     */
    Q_PROPERTY(int changeUserTemperature WRITE setChangeUserTemperature)

    /*
     * Propriedade que permite indicar ao backend quando os botões da página Settings são pressionados
     */
    Q_PROPERTY(int settingsButtons WRITE setSettingsButtons)


public:
    static BackEnd *instance();
    static QObject *qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine);

    /*
     * Estrutura para armazenar valores de temperatura em diferentes divisões da casa, bem como o estado do aquecimento nessas divisões (on ou off)
     */
    typedef struct temperature_t {
        double room1 = 0;
        double room2 = 0;
        double room3 = 0;
        double room4 = 0;
        double room5 = 0;
        int room1en = 0;
        int room2en = 0;
        int room3en = 0;
        int room4en = 0;
        int room5en = 0;
    } temperature_t;

    /*
     * Estrutura para armazenar valores de planeamento de aquecimento
     */
    typedef struct schedule_t {
        time_t start_time[7];
        time_t stop_time[7];
        int setpoint[7];
        int state[7] = {0, 0, 0, 0, 0, 0, 0};
    } schedule_t;

    /*
     * Estrutura para armazenar os nomes das divisões atuais
     */
    typedef struct roomNames_t {
        char room1[MAX_LENGTH_USER_NAME] = "";
        char room2[MAX_LENGTH_USER_NAME] = "";
        char room3[MAX_LENGTH_USER_NAME] = "";
        char room4[MAX_LENGTH_USER_NAME] = "";
        char room5[MAX_LENGTH_USER_NAME] = "";
    } roomNames_t;


    /*
     * Função para obter uma data no formato time_t com base nos parâmetros de entrada
     */
    time_t aux_setTime(int year, int mon, int day, int hour, int min, int sec);

    /*
     * Funções para ler e escrever o menu atual
     */
    int getCurrentMenu();       // Deve ser chamada em QML
    void setCurrentMenu(int menu);      // Deve ser chamada em C++

    /*
     * Funções para ler e escrever o indice da divisao atual
     */
    int getRoomIndex();
    void setRoomIndex(int idx);

    /*
     * Funções para ler e escrever os nomes das divisões atuais
     */
    QList<QString> getRoomNames();              // Deve ser chamada em QML
    void setRoomNames(int room, char* name);    // Deve ser chamada em C++

    /*
     * Funções para ler os valores das temperaturas atuais do frontend
     */
    QList<double> getCurrentTemperature();          // Deve ser chamada em QML
    temperature_t getCurrentTemperature(int foo);   // Deve ser chamada em C++

    /*
     * Funções para inserir novos valores das temperaturas atuais no frontend
     */
    void setCurrentTemperature(QList<double> temp);     // Deve ser chamada em QML
    void setCurrentTemperature(double temp, int room);  // Deve ser chamada em C++

    /*
     * Funções para ler os valores dos setpoints das temperaturas atuais do frontend
     */
    QList<double> getCurrentTemperatureSet();           // Deve ser chamada em QML
    temperature_t getCurrentTemperatureSet(int foo);    // Deve ser chamada em C++

    /*
     * Funções para inserir novos valores dos setpoints das temperaturas atuais no frontend
     */
    void setCurrentTemperatureSet(QList<double> temp);              // Deve ser chamada em QML
    void setCurrentTemperatureSet(double temp, int on, int room);   // Deve ser chamada em C++

    /*
     * Funções para ler e escrever valores de agendamento de aquecimento
     */
    QList<int> getSchedule();            // Deve ser chamada em QML
    schedule_t getSchedule(int foo);     // Deve ser chamada em C++
    void setSchedule(QList<int> list);   // Deve ser chamada em QML

    /*
     * Funções para ler e escrever no frontend o nome do utilizador que foi reconhecido
     */
    QString getWelcomeUserName();               // Deve ser chamada em QML
    void setWelcomeUserName(const char *str);   // Deve ser chamada em C++

    /*
     * Funções para ler e escrever no frontend o valor de temperatura associado ao utilizador que foi reconhecido
     */
    int getWelcomeTemperature();                // Deve ser chamada em QML
    void setWelcomeTemperature(int temp);       // Deve ser chamada em C++

    /*
     * Função para indicar ao backend quando os botões da página Welcome são pressionados.
     * buttons=1 -> botão "its not me" pressionado
     * buttons=2 -> botão "do not adjust" pressionado
     */
    void setWelcomeButtons(int buttons);        // Deve ser chamada em QML

    /*
     * Função para indicar ao backend quando os botões das páginas para adicionar um novo utilizador são pressionados.
     * buttons=1 -> botão "yes" pressionado
     * buttons=2 -> botão "no" pressionado
     * buttons=3 -> botão "confirm" pressionado
     */
    void setNewUserButtons(int buttons);        // Deve ser chamada em QML

    /*
     * Funções para ler e escrever o nome do utilizador adicionado no frontend para o backend
     */
    const char* getNewUserName();                     // Deve ser chamada em C++
    void setNewUserName(QString);                     // Deve ser chamada em QML

    /*
     * Funções para ler e escrever a temperatura associada ao novo utilizador adicionado no frontend para o backend
     */
    int getNewUserTemperature();                // Deve ser chamada em C++
    void setNewUserTemperature(int temp);       // Deve ser chamada em QML

    /*
     * Funções para ler e escrever a temperatura associada ao utilizador quando é alterada
     */
    int getChangeUserTemperature();                // Deve ser chamada em C++
    void setChangeUserTemperature(int temp);       // Deve ser chamada em QML

    /*
     * Função chamada quando os botões da página Settings são pressionados
     */
    void setSettingsButtons(int buttons);


signals:
    /*
     * Função para sinalizar ao frontend que o menu atual foi alterado
     */
    void currentMenuChanged();

    /*
     * Função para sinalizar ao frontend o índice da divisão atual
     */
    void roomIndexChanged();

    /*
     * Função para sinalizar ao frontend que os nomes das divisões foram modificados
     */
    void roomNamesChanged();

    /*
     * Função para sinalizar ao frontend que foi efetuada uma alteração nos valores das temperaturas atuais
     */
    void currentTemperatureChanged();

    /*
     * Função para sinalizar ao frontend que foi efetuada uma alteração nos valores dos setpoints das temperaturas atuais
     */
    void currentTemperatureSetChanged();

    /*
     * Função para sinalizar ao frontend que foi efetuada uma alteração no nome do utilizador que foi reconhecido
     */
    void welcomeUserNameChanged();

    /*
     * Função para sinalizar ao frontend que foi efetuada uma alteração no valor de temperatura associado ao utilizador que foi reconhecido
     */
    void welcomeTemperatureChanged();


private:
    /*
     * Menu atual do frontend
     */
    int currentMenu = 0;

    /*
     * Índice da divisão onde o controlador se encontra
     */
    int roomIndex = 1;

    /*
     * Estrutura que armazena os valores das temperaturas atuais do frontend
     */
    temperature_t currentTemperature;

    /*
     * Estrutura que armazena os valores dos setpoints das temperaturas atuais do frontend
     */
    temperature_t currentTemperatureSet;

    /*
     * Estrutura para armazenar os valores do planeamento do aquecimento
     */
    schedule_t schedule;

    /*
     * Estrutura para armazenar os nomes das divisões atuais
     */
    roomNames_t roomNames;

    /*
     * String com o nome do utilizador que foi reconhecido
     */
    char welcomeUserName[MAX_LENGTH_USER_NAME];

    /*
     * Valor de temperatura associado ao utilizador que foi reconhecido
     */
    int welcomeTemperature;

    /*
     * String com o nome do utilizador que foi adicionado
     */
    char newUserName[MAX_LENGTH_USER_NAME];

    /*
     * Valor de temperatura associado ao utilizador que foi adicionado
     */
    int newUserTemperature;

    int changeUserTemperature;


    explicit BackEnd(QObject *parent = nullptr);
    static BackEnd* m_pThis;

};


#endif // BACKEND_H

