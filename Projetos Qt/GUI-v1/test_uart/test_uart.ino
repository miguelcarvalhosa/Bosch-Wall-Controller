#include <SoftwareSerial.h>
SoftwareSerial s(2,3); // RX, TX

#define TOTAL_CODES    3
#define CODE_OFF    0
#define CODE_SETPOINT   1
#define CODE_TEMPERATURE  2

#define PACKET_SIZE   15
#define PACKET_SYNC_OFFSET  3
#define PACKET_TEMP_OFFEST  11
#define PACKET_NAME_DIV_LENGTH  10

#define TOTAL_DIVISIONS   3
#define MIN_TEMP    0
#define MAX_TEMP    70




/* INFORMACAO A ENVIAR */
int send_chars = 0;
unsigned long send_period = 100000;
char seq[4]="bgn";
char code = '0';
char value = 62;
char division[11] = "Kitchen---";
/*--------------------*/





int count = 0;
uint8_t pos = -1;
int flag = 0;
uint8_t packet[15];

struct frameStruct {
  uint8_t code;
  char division[11];
  uint8_t value;
};
typedef struct frameStruct frameType;
frameType frame;

unsigned long last = millis();


void setup() {
  Serial.begin(9600);
  s.begin(9600);
  Serial.println("Inicio\n\n");
  s.write("oooo",4);
}
void compare_sequence(char received, char expected) {
  if(received == expected) {
    flag++;
  } else {
    flag = 0;
  }
}
void uart_frame_parsing (uint8_t packet[]) {
  int index = 0;
  while(index < 12) {
    if(index == 0) {
      frame.code = packet[index] - 48;
    } else if(index >0 && index <11) {
      frame.division[index-1] = packet[index];
    } else {
      frame.value = packet[index] - 48;
    }
    index++;
  }
  Serial.println("-------- RECEIVED --------");
  Serial.print("code:");
  Serial.println(frame.code);
  Serial.print("division:");
  Serial.println(frame.division);
  Serial.print("value:");
  Serial.println(frame.value);
}
void loop() {
  
  static int pos = 0;
  
  int dataAvailable;
  char char_rx;
  char packet[PACKET_SIZE + 1];
  
  dataAvailable = s.available();
  while(s.available() > 0 && pos < PACKET_SIZE) {
    char_rx = s.read();
    if(pos == 0 && char_rx != 's')      { pos = 0;  }
    else if(pos == 1 && char_rx != 'y') { pos = 0;  }
    else if(pos == 2 && char_rx != 'c') { pos = 0;  }
    else {
      packet[pos] = char_rx;
      pos++;
    }
  }
  if(pos == PACKET_SIZE) {
    char frame_tmp[11];
    frame_tmp[10] = 0;
    pos = 0;
    packet[PACKET_SIZE] = 0;
    Serial.print("[READ] Trama:");
    Serial.println(packet);
    Serial.print("[READ] CODE: ");
    Serial.print(packet[3] - '0');
    Serial.print(" | TEMP: ");
    Serial.print(packet[14] - '0');
    strncpy(frame_tmp,&packet[4], PACKET_NAME_DIV_LENGTH);
    Serial.print(" | DIV: ");
    Serial.println(frame_tmp);
  }
  


   // ENVIO
   if(millis() - last > send_period && send_chars == 1) {
    Serial.println("-------- SENT --------");
    Serial.print(seq);
    s.write(seq,3);
    Serial.print('-');
    
    s.write(code);
    Serial.print(code);
    Serial.print('-');
    
    Serial.print(division);
    s.write(division,10);
    Serial.print('-');
    
    Serial.println(value);
    s.write(value);
    last = millis();
   }
}
