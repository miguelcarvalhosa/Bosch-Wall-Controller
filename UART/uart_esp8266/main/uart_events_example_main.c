// Copyright 2018-2025 Espressif Systems (Shanghai) PTE LTD
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/uart.h"
#include "esp_log.h"
#include "uart_struct.h"

static const char *TAG = "uart_events";

/**
 * This example shows how to use the UART driver to handle special UART events.
 *
 * It also reads data from UART0 directly, and echoes it to console.
 *
 * - Port: UART0
 * - Receive (Rx) buffer: on
 * - Transmit (Tx) buffer: on
 * - Flow control: off
 * - Event queue: on
 * - Pin assignment: TxD (default), RxD (default));
 */

#define EX_UART_NUM UART_NUM_0

#define BUF_SIZE (1024)
#define RD_BUF_SIZE (BUF_SIZE)
static QueueHandle_t uart0_queue;
//void *memcpy(void *dest, const void * src, size_t n);
uint8_t flag = 0;
uint8_t pos =-1;
uint8_t packet[15];
uart_frame_t frame;
char aux[12];
char* paux = aux;
static void compare_code(char* dtmp,char expected)
{
  if (*dtmp == expected){
    flag++;
  }
  else {
    flag = 0;
  }
}
// bgn2saladeesta8
// bgn2saladeesta8bgn4cozinha0008
// bgn4cozinha0008
// bgn2sala1111118
static void uart_frame_parsing(uint8_t* packet){
  int pos = 0;
  while(pos<12) {
    //printf("\nDestination %c",packet[pos]);
    if(pos == 0){
      frame.code = *packet;
    }
    else if(pos > 0 && pos < 11) {
      //uint8_t aux = *packet;
      if(*packet != '0') {
        frame.destination =(char*) packet;
      }
      else {
        *frame.destination = NULL;
      }
      //strncpy(frame.destination, (char*) packet, 10);
      frame.destination++;

      //printf("%s   ", frame.destination);
      //printf("%d   ",pos);
    }
    else {
      frame.offset = *packet;
      *frame.destination = 0;
      frame.destination = frame.destination - 10;
      printf("\n\n%c\n", frame.code);
      printf("%s\n", frame.destination);
      printf("%c\n", frame.offset);
    }
    packet++;
    pos++;
  }
}
// static void uart_frame_parsing(uint8_t* packet){
//   int pos = 0;
//
//   while(pos<12) {
//     //printf("\nDestination %c",packet[pos]);
//     if(pos == 0){
//       frame.code = *packet;
//     }
//     else if(pos > 0 && pos < 11) {
//       //uint8_t aux = *packet;
//       if(*packet != '0') {
//         aux[pos] = *(char*) packet;
//         printf("pos: %d  aux: %c   ",pos,aux[pos]);
//       }
//       // else {
//       //   aux[pos] = NULL;
//       // }
//       //strncpy(frame.destination, (char*) packet, 10);
//       //frame.destination++;
//
//       //printf("%s   ", frame.destination);
//       //printf("%d   ",pos);
//     }
//     else {
//       frame.offset = *packet;
//       //printf("%c",aux[0]);
//
//       // for(int i=0; i<sizeof(aux); i++){
//       //   frame.destination = (char *) &aux[i];
//       //   frame.destination++;
//       // }
//       //frame.destination = frame.destination - sizeof(aux);
//       //sprintf(frame.destination,"%s", aux);
//       //frame.destination = (char*) &aux;
//       //frame.destination = (char*) aux;
//       //*frame.destination = 0;
//       //frame.destination = frame.destination - 10;
//       printf("\n\n%c\n", frame.code);
//       printf("%s\n", paux);
//       printf("%c\n", frame.offset);
//     }
//     packet++;
//     pos++;
//   }
// }


static void uart_event_task(void *pvParameters)
{
    uart_event_t event;
    uint8_t *dtmp = (uint8_t *) malloc(RD_BUF_SIZE);
    uint8_t i = 0;


    for (;;) {
        // Waiting for UART event.
        if (xQueueReceive(uart0_queue, (void *)&event, (portTickType)portMAX_DELAY)) {
            bzero(dtmp, RD_BUF_SIZE);
            ESP_LOGI(TAG, "uart[%d] event:", EX_UART_NUM);

            switch (event.type) {
                case UART_DATA:
                  uart_read_bytes(EX_UART_NUM, dtmp, event.size, portMAX_DELAY);
                  printf("Event size: %d\n",event.size);
                  printf("%s",(char*)dtmp);
                  while(i<event.size) {
                    if (flag == 0){
                      printf("\nflag0\n");
                      //printf("%s\n",(char*)dtmp);
                      compare_code((char*) dtmp,'b');
                    }
                    else if (flag == 1) {
                      printf("flag1");
                      compare_code((char*) dtmp,'g');
                    }

                    else if(flag == 2){
                      printf("flag2");
                      compare_code((char*) dtmp,'n');
                    }
                    else{
                      pos++;
                      if(pos<12) {
                        packet[pos] = *dtmp;
                        printf(" pos: %c", packet[pos]);

                      }
                      else {
                        uint8_t* p = packet;
                        printf("\nPonteiro:   %s\n",p);
                        printf("final \n");
                        uart_frame_parsing((uint8_t *) &packet);
                        //bzero(packet, 12);
                      //  bzero(p, 12);
                        flag = 0;
                        pos = -1;
                        dtmp--;
                        // printf("%d\n", frame.code);
                        // printf("%s\n", frame.destination);
                        // printf("%d\n", frame.offset);

                      }


                    }
                    dtmp++;
                    i++;

                  }
                  i = 0;
                  break;

                // Event of HW FIFO overflow detected
                case UART_FIFO_OVF:
                    ESP_LOGI(TAG, "hw fifo overflow");
                    // If fifo overflow happened, you should consider adding flow control for your application.
                    // The ISR has already reset the rx FIFO,
                    // As an example, we directly flush the rx buffer here in order to read more data.
                    uart_flush_input(EX_UART_NUM);
                    xQueueReset(uart0_queue);
                    break;

                // Event of UART ring buffer full
                case UART_BUFFER_FULL:
                    ESP_LOGI(TAG, "ring buffer full");
                    // If buffer full happened, you should consider encreasing your buffer size
                    // As an example, we directly flush the rx buffer here in order to read more data.
                    uart_flush_input(EX_UART_NUM);
                    xQueueReset(uart0_queue);
                    break;

                case UART_PARITY_ERR:
                    ESP_LOGI(TAG, "uart parity error");
                    break;

                // Event of UART frame error
                case UART_FRAME_ERR:
                    ESP_LOGI(TAG, "uart frame error");
                    break;

                // Others
                default:
                    ESP_LOGI(TAG, "uart event type: %d", event.type);
                    break;
            }
        }
    }

    free(dtmp);
    dtmp = NULL;
    vTaskDelete(NULL);
}

void app_main()
{
    // Configure parameters of an UART driver,
    // communication pins and install the driver
    uart_config_t uart_config = {
        .baud_rate = 74880,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    };
    uart_param_config(EX_UART_NUM, &uart_config);

    // Install UART driver, and get the queue.
    uart_driver_install(EX_UART_NUM, BUF_SIZE * 2, BUF_SIZE * 2, 100, &uart0_queue, 0);

    // Create a task to handler UART event from ISR
    xTaskCreate(uart_event_task, "uart_event_task", 2048, NULL, 12, NULL);
}
