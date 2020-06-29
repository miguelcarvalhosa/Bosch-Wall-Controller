
#ifndef _BLE_MESH_DEMO_INIT_H_
#define _BLE_MESH_DEMO_INIT_H_

#define TAG "NODE"
#define TAG_UART "UART_EVT"

void ble_mesh_get_dev_uuid(uint8_t *dev_uuid);

esp_err_t bluetooth_init(void);

#endif
