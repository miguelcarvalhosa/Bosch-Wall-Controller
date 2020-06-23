
#include "uart.h"
#include "centralUnit.h"

/**************************Variaveis Globais***************************/
uart_frame_t frame_tx, frame_rx;
int serial_port;


/********************************Funcoes*******************************/
/* HAL */
void uart_init(void) {
    if ((serial_port = serialOpen ("/dev/ttyS0", 9600)) < 0)	/* open serial port */
    {
      fprintf (stderr, "Unable to open serial device: %s\n", strerror (errno)) ;
    }

    if (wiringPiSetup () == -1)					/* initializes wiringPi setup */
    {
      fprintf (stdout, "Unable to start wiringPi: %s\n", strerror (errno)) ;
    }
}


void uart_read(void){
  static int pos = 0;

  int dataAvailable;
  char char_rx;
  static char packet[PACKET_SIZE + 1];
  int flags_mesh = fl_mesh_receivedOff + fl_mesh_receivedSetpoint + fl_mesh_receivedTemp;

  dataAvailable = serialDataAvail(serial_port);
  while(serialDataAvail(serial_port) > 0 && pos < PACKET_SIZE && flags_mesh == 0) {
    char_rx = serialGetchar(serial_port);
    if(pos == 0 && char_rx != 'b')      { pos = 0;  }
    else if(pos == 1 && char_rx != 'g') { pos = 0;  }
    else if(pos == 2 && char_rx != 'n') { pos = 0;  }
    else {
      packet[pos] = char_rx;
      pos++;
    }
  }
  if(pos == PACKET_SIZE) {
    pos = 0;
    packet[PACKET_SIZE] = 0;
    int i=0;
    if(uart_frame_parsing(&packet[PACKET_SYNC_OFFSET]) != 0) {
      uart_triggerFlags();
    }
    else {
      printf("[UART] Erro na rececao\n");
    }
  }
}


void uart_send(void) {

  char packet[16];
  char sync[4] = "syc";

  strncpy(&packet[0],sync,3);
  packet[3] = frame_tx.code + '0';
  id2str(frame_tx.id, frame_tx.division);
  strncpy(&packet[4],frame_tx.division,10);
  packet[14] = frame_tx.temperature + '0';
  packet[15] = '\0';

  serialPuts(serial_port,packet);

}


int uart_frame_parsing(char* packet){
    int retVal = 1;

    frame_rx.code = packet[0] - '0';
    frame_rx.temperature = packet[PACKET_TEMP_OFFEST] - '0';
    strncpy(frame_rx.division,&packet[1], PACKET_NAME_DIV_LENGTH);
    frame_rx.division[PACKET_NAME_DIV_LENGTH] = 0;
    frame_rx.id = str2id(frame_rx.division);

    printf("[PARS] ");
    printf("C: %d", frame_rx.code);
    printf("\tD: %s", frame_rx.division);
    printf("\tT: %d", frame_rx.temperature);
    printf("\tID: %d\n", frame_rx.id);

    if(frame_rx.code < 0 || frame_rx.code > TOTAL_CODES-1)                 { retVal = 0; }
    if(frame_rx.id < 0 || frame_rx.id > TOTAL_DIVISIONS-1)                 { retVal = 0; }
    if(frame_rx.temperature < MIN_TEMP || frame_rx.temperature > MAX_TEMP) { retVal = 0; }

    return retVal;
}

void uart_triggerFlags(void) {
  switch (frame_rx.code) {
    case CODE_OFF:
      fl_mesh_receivedOff = 1;
      break;
    case CODE_SETPOINT:
      fl_mesh_receivedSetpoint = 1;
      break;
    case CODE_TEMPERATURE:
      fl_mesh_receivedTemp = 1;
      break;
    default:
      break;
  }
}


/* Funcoes de interface com a unidade central*/
void uart_getTemperature(int * temperature, int * division_id) {
    *temperature = frame_rx.temperature;
    *division_id = frame_rx.id;
}


void uart_setTemperature(void) {
    frame_tx.temperature = (int)gl_division[gl_thisDivision].curTemperature;
    frame_tx.id = gl_thisDivision;
    frame_tx.code = CODE_TEMPERATURE;
    uart_send();
}


void uart_getSetpoint(int * setpoint, int * division_id) {
    *setpoint = frame_rx.temperature;
    *division_id = frame_rx.id;
}


void uart_setSetpoint(int division_id) {
    frame_tx.temperature = (int) gl_division[division_id].curSetpoint;
    frame_tx.id = division_id;
    frame_tx.code = CODE_SETPOINT;
    uart_send();
}


void uart_getDisable(int * state, int * division_id) {
	*state = frame_rx.temperature;
    *division_id = frame_rx.id;
}


void uart_setDisable(int division_id) {
    frame_tx.temperature = 0;
    frame_tx.id = division_id;
    frame_tx.code = CODE_OFF;
    uart_send();
}


/* Funcoes auxiliares*/
void id2str(int id, char* str) {

    switch (id) {
        case 0:
            strcpy(str,"LvgRoom---");
            break;
        case 1:
            strcpy(str,"Kitchen---");
            break;
        case 2:
            strcpy(str, "Bedroom---");
            break;
        default:
            strcpy(str, "Erro123456");
    }

}

int str2id(char * str) {
    int id = -1;
    if(strcmp(str, "LvgRoom---") == 0)       { id = 0; }
    else if(strcmp(str, "Kitchen---") == 0)  { id = 1; }
    else if(strcmp(str, "Bedroom---") == 0)  { id = 2; }
    return id;
}
