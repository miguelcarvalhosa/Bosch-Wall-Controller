/* main.c - Application main entry point */

#include <stdio.h>
#include <string.h>
#include <math.h>

#include "esp_log.h"
#include "nvs_flash.h"
#include "nvs.h"
#include "esp_bt.h"

#include "esp_ble_mesh_defs.h"
#include "esp_ble_mesh_common_api.h"
#include "esp_ble_mesh_networking_api.h"
#include "esp_ble_mesh_provisioning_api.h"
#include "esp_ble_mesh_config_model_api.h"
#include "esp_ble_mesh_generic_model_api.h"
#include "esp_ble_mesh_local_data_operation_api.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/uart.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "esp_vfs_dev.h"

#include "ble_mesh_demo_init.h"
#include "uart_struct.h"

#define UART_NUM UART_NUM_1
#define TXD (GPIO_NUM_4)
#define RXD (GPIO_NUM_2)
#define RTS (UART_PIN_NO_CHANGE)
#define CTS (UART_PIN_NO_CHANGE)

#define BUF_SIZE (2048)
#define RD_BUF_SIZE (BUF_SIZE)
static QueueHandle_t uart0_queue;

#define CID_ESP 0x02E5
#define CID_NVAL 0xFFFF

#define MSG_SEND_TTL 3
#define MSG_SEND_REL false
#define MSG_TIMEOUT 0
#define MSG_ROLE ROLE_NODE

#define NODE_COUNT 3
#define ESP_BLE_MESH_VND_MODEL_ID_CLIENT 0x0000
#define ESP_BLE_MESH_VND_MODEL_ID_SERVER 0x0001

#define ESP_BLE_MESH_VND_MODEL_OP_GET ESP_BLE_MESH_MODEL_OP_3(0x00, CID_ESP)
#define ESP_BLE_MESH_VND_MODEL_OP_SET ESP_BLE_MESH_MODEL_OP_3(0x01, CID_ESP)
#define ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS ESP_BLE_MESH_MODEL_OP_3(0x02, CID_ESP)
#define ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS ESP_BLE_MESH_MODEL_OP_3(0x03, CID_ESP)

#define EEPROM_SIZE 1

#define SET_NODE_TEMP 1 //setpoint operation
#define SET_NODE_OFF  0 //turn off operation
#define UPDATE_TEMP   2 //update room temperature operation

#define ON 1
#define OFF 0

nvs_handle_t mem_handle;

/* information about the provisioner used */
static uint8_t dev_uuid[ESP_BLE_MESH_OCTET16_LEN] = {0x32, 0x10};
uint16_t start_addr = 0x0002;
uint16_t self_addr;
static uint8_t msg_tid = 0x0;

/* internal action signals */
uint8_t node_count = 0;
uint8_t flag = 0;
uint8_t pos = -1;
uint8_t packet[15];
uart_frame_t frame;

/* internal structure to save the data received from each node in msgs*/
struct esp_ble_mesh_temp_t
{
    uint16_t addr;
    uint8_t temperature;
    uint8_t setpoint;
    uint8_t state;
    char name[11];
    uint8_t set;
};

struct esp_ble_mesh_temp_t node[NODE_COUNT];

/* models are refered as esp_ble_mesh_client_t or specific to the model library in case of servers */
static esp_ble_mesh_client_t onoff_client;

static esp_ble_mesh_cfg_srv_t config_server = {
    .relay = ESP_BLE_MESH_RELAY_ENABLED,
    .beacon = ESP_BLE_MESH_BEACON_ENABLED,
#if defined(CONFIG_BLE_MESH_FRIEND)
    .friend_state = ESP_BLE_MESH_FRIEND_ENABLED,
#else
    .friend_state = ESP_BLE_MESH_FRIEND_NOT_SUPPORTED,
#endif
#if defined(CONFIG_BLE_MESH_GATT_PROXY_SERVER)
    .gatt_proxy = ESP_BLE_MESH_GATT_PROXY_ENABLED,
#else
    .gatt_proxy = ESP_BLE_MESH_GATT_PROXY_NOT_SUPPORTED,
#endif
    .default_ttl = 7,
    /* 3 transmissions with 20ms interval */
    .net_transmit = ESP_BLE_MESH_TRANSMIT(2, 20),
    .relay_retransmit = ESP_BLE_MESH_TRANSMIT(2, 20),
};

/* ESP_BLE_MESH_MODEL_PUB_DEFINE(onoff_cli_pub, 2 + 1, ROLE_NODE); */
ESP_BLE_MESH_MODEL_PUB_DEFINE(onoff_srv_pub, 2 + 1, ROLE_NODE);

static esp_ble_mesh_gen_onoff_srv_t onoff_server = {
    .rsp_ctrl.get_auto_rsp = ESP_BLE_MESH_SERVER_AUTO_RSP,
    .rsp_ctrl.set_auto_rsp = ESP_BLE_MESH_SERVER_AUTO_RSP,
};

static esp_ble_mesh_model_t root_models[] = {
    ESP_BLE_MESH_MODEL_CFG_SRV(&config_server),
    ESP_BLE_MESH_MODEL_GEN_ONOFF_SRV(&onoff_srv_pub, &onoff_server),
    ESP_BLE_MESH_MODEL_GEN_ONOFF_CLI(NULL, &onoff_client),
};
/* Definition of the publication context */
ESP_BLE_MESH_MODEL_PUB_DEFINE(vnd_srv_pub, 3 + 3 + 10, ROLE_NODE);
static esp_ble_mesh_model_op_t vnd_op_srv[] = {
    ESP_BLE_MESH_MODEL_OP(ESP_BLE_MESH_VND_MODEL_OP_GET, 0),
    ESP_BLE_MESH_MODEL_OP(ESP_BLE_MESH_VND_MODEL_OP_SET, 1),
    ESP_BLE_MESH_MODEL_OP_END,
};
/* Definition of the publication context */
ESP_BLE_MESH_MODEL_PUB_DEFINE(vnd_cli_pub, 3 + 1, ROLE_NODE);
static esp_ble_mesh_model_op_t vnd_op_cli[] = {
    /*Esta função cria um formato para as mensagens: opcode + tamanho da mensagem*/
    ESP_BLE_MESH_MODEL_OP(ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS, 13),
    ESP_BLE_MESH_MODEL_OP(ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS, 1),
    ESP_BLE_MESH_MODEL_OP_END,
};
static const esp_ble_mesh_client_op_pair_t vnd_op_pair[] = {
    {ESP_BLE_MESH_VND_MODEL_OP_GET, ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS},
    {ESP_BLE_MESH_VND_MODEL_OP_SET, ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS},
};

static esp_ble_mesh_client_t vendor_client = {
    .op_pair_size = ARRAY_SIZE(vnd_op_pair),
    .op_pair = vnd_op_pair,
    .msg_role = ROLE_NODE,
};

static esp_ble_mesh_model_t vnd_models[] = {
    ESP_BLE_MESH_VENDOR_MODEL(CID_ESP, ESP_BLE_MESH_VND_MODEL_ID_SERVER,
                              vnd_op_srv, &vnd_srv_pub, NULL),
    ESP_BLE_MESH_VENDOR_MODEL(CID_ESP, ESP_BLE_MESH_VND_MODEL_ID_CLIENT,
                              vnd_op_cli, &vnd_cli_pub, &vendor_client),
};

static esp_ble_mesh_elem_t elements[] = {
    ESP_BLE_MESH_ELEMENT(0, root_models, vnd_models),
};

static esp_ble_mesh_comp_t composition = {
    .cid = CID_ESP,
    .elements = elements,
    .element_count = ARRAY_SIZE(elements),
};

static esp_ble_mesh_prov_t provision = {
    .uuid = dev_uuid,
};
static struct esp_ble_mesh_key
{
    uint16_t net_idx;
    uint16_t app_idx;
    uint8_t app_key[ESP_BLE_MESH_OCTET16_LEN];
} prov_key;

static void mem_set_data(uint8_t operation, uint8_t index)
{
    esp_err_t err;

    err = nvs_open("storage", NVS_READWRITE, &mem_handle);
    if (err != ESP_OK)
    {
        printf("Error (%s) opening NVS handle!\n", esp_err_to_name(err));
    }
    else
    {
        printf("Writing on NVS ... ");
        switch (operation)
        {
        case 0:
            err = nvs_erase_key(mem_handle,"start_addr");
            err = nvs_set_u16(mem_handle, "start_addr", start_addr);
            break;
        case 1:
            err = nvs_erase_key(mem_handle,"self_addr");
            err = nvs_set_u16(mem_handle, "self_addr", self_addr);
            break;
        case 2:
            /* err = nvs_set_u8(mem_handle, "node_count", node_count); */
            break;
        case 3:
            switch (index)
            {
            case 0:
                err = nvs_erase_key(mem_handle,"addr_0");
                err = nvs_erase_key(mem_handle,"temp_0");
                err = nvs_erase_key(mem_handle,"setpoint_0");
                err = nvs_erase_key(mem_handle,"state_0");
                err = nvs_erase_key(mem_handle,"name_0");
                err = nvs_erase_key(mem_handle,"set_0");
                err = nvs_set_u16(mem_handle, "addr_0",    node[0].addr);
                err = nvs_set_u8(mem_handle, "temp_0",     node[0].temperature);
		        err = nvs_set_u8(mem_handle, "setpoint_0", node[0].setpoint);
                err = nvs_set_u8(mem_handle, "state_0",    node[0].state);
                err = nvs_set_str(mem_handle, "name_0",    node[0].name);
                err = nvs_set_u8(mem_handle, "set_0",      node[0].set);
                break;
            case 1:
                err = nvs_erase_key(mem_handle,"addr_1");
                err = nvs_erase_key(mem_handle,"temp_1");
                err = nvs_erase_key(mem_handle,"setpoint_1");
                err = nvs_erase_key(mem_handle,"state_1");
                err = nvs_erase_key(mem_handle,"name_1");
                err = nvs_erase_key(mem_handle,"set_1");
                err = nvs_set_u16(mem_handle, "addr_1",    node[1].addr);
                err = nvs_set_u8(mem_handle, "temp_1",     node[1].temperature);
		        err = nvs_set_u8(mem_handle, "setpoint_1", node[1].setpoint);
                err = nvs_set_u8(mem_handle, "state_1",    node[1].state);
                err = nvs_set_str(mem_handle, "name_1",    node[1].name);
                err = nvs_set_u8(mem_handle, "set_1",      node[1].set);
                break;
            case 2:
                err = nvs_erase_key(mem_handle,"addr_2");
                err = nvs_erase_key(mem_handle,"temp_2");
                err = nvs_erase_key(mem_handle,"setpoint_2");
                err = nvs_erase_key(mem_handle,"state_2");
                err = nvs_erase_key(mem_handle,"name_2");
                err = nvs_erase_key(mem_handle,"set_2");
                err = nvs_set_u16(mem_handle, "addr_2",    node[2].addr);
                err = nvs_set_u8(mem_handle, "temp_2",     node[2].temperature);
		        err = nvs_set_u8(mem_handle, "setpoint_2", node[2].setpoint);
                err = nvs_set_u8(mem_handle, "state_2",    node[2].state);
                err = nvs_set_str(mem_handle, "name_2",    node[2].name);
                err = nvs_set_u8(mem_handle, "set_2",      node[2].set);
                break;
            default:
                break;
            }
            break;
        case 4:
            err = nvs_erase_key(mem_handle,"net_idx");
            err = nvs_erase_key(mem_handle,"app_idx");
            err = nvs_set_u16(mem_handle, "net_idx", prov_key.net_idx);
            err = nvs_set_u16(mem_handle, "app_idx", prov_key.app_idx);
            break;
        default:
            break;
        }
    }
    printf("Committing updates in NVS ... ");
    err = nvs_commit(mem_handle);
    printf((err != ESP_OK) ? "Failed!\n" : "Done\n");
    nvs_close(mem_handle);
}
static void nvs_get_all_data(void)
{
    esp_err_t err;
    size_t buf_len;
    uint8_t index;

    err = nvs_open("storage", NVS_READWRITE, &mem_handle);

    err = nvs_get_u16(mem_handle, "start_addr", &start_addr);
    err = nvs_get_u16(mem_handle, "self_addr", &self_addr);

    index = self_addr - start_addr;
    switch (index)
    {
    case 0:
        buf_len = sizeof(node[0].name);
        err = nvs_get_u16(mem_handle, "addr_0",     &node[0].addr);
        err = nvs_get_u8(mem_handle, "temp_0",      &node[0].temperature);
	    err = nvs_get_u8(mem_handle, "setpoint_0",  &node[0].setpoint);
        err = nvs_get_u8(mem_handle, "state_0",     &node[0].state);
        err = nvs_get_str(mem_handle, "name_0",     node[0].name, &buf_len);
        err = nvs_get_u8(mem_handle, "set_0",       &node[0].set);
        break;
    case 1:
        buf_len = sizeof(node[1].name);
        err = nvs_get_u16(mem_handle, "addr_1",     &node[1].addr);
        err = nvs_get_u8(mem_handle, "temp_1",      &node[1].temperature);
	    err = nvs_get_u8(mem_handle, "setpoint_1",  &node[1].setpoint);
        err = nvs_get_u8(mem_handle, "state_1",     &node[1].state);
        err = nvs_get_str(mem_handle, "name_1",     node[1].name, &buf_len);
        err = nvs_get_u8(mem_handle, "set_1",       &node[1].set);
        break;
    case 2:
        buf_len = sizeof(node[1].name);
        err = nvs_get_u16(mem_handle, "addr_2",     &node[2].addr);
        err = nvs_get_u8(mem_handle, "temp_2",      &node[2].temperature);
	    err = nvs_get_u8(mem_handle, "setpoint_2",  &node[2].setpoint);
        err = nvs_get_u8(mem_handle, "state_2",     &node[2].state);
        err = nvs_get_str(mem_handle, "name_2",     node[2].name, &buf_len);
        err = nvs_get_u8(mem_handle, "set_2",       &node[2].set);
        break;
    default:
        break;
    }
    err = nvs_get_u16(mem_handle, "net_idx", &prov_key.net_idx);
    err = nvs_get_u16(mem_handle, "app_idx", &prov_key.app_idx);
    ESP_LOGI("","--------- SAVED NVS DATA ----------");
    ESP_LOGI("","node name : %s",     node[index].name);
    ESP_LOGI("","node addr : 0x%04x", node[index].addr);
    // Close
    nvs_close(mem_handle);
}

static void esp_ble_mesh_save_node(uint16_t addr)
{
    /* fill array of data temperatures */
    uint8_t index = addr - start_addr;
    node[index].addr = addr;
    self_addr = addr;
    strcpy(node[index].name, "LvgRoom---");
    node[index].name[10] = '\0';
    node[index].set = 1;
    node[index].state = onoff_server.state.onoff;
    node[index].temperature = 25;
    node_count++;
}

static void publish_temp(void)
{
    int i = 0;
    uint8_t index = self_addr - start_addr;

    uint8_t d[13] = {(self_addr & 0xff), (self_addr >> 8), node[index].temperature};
    for (i = 0; i < 10; i++)
    {
        if (*node[index].name != '\0')
        {
            d[3 + i] = node[index].name[i];
        }
    }

    esp_err_t err = esp_ble_mesh_model_publish(&vnd_models[0], ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS, sizeof(d), (uint8_t *)&d, ROLE_NODE);
    if (err)
    {
        ESP_LOGE("", "Failed to publish msg");
    }
}

static void publish_state(uint8_t node_state)
{
    esp_ble_mesh_msg_ctx_t ctx = {0};
    esp_err_t err;

    ctx.net_idx = prov_key.net_idx;
    ctx.app_idx = prov_key.app_idx;
    ctx.addr = 0xFFFF;
    ctx.send_ttl = MSG_SEND_TTL;
    ctx.send_rel = MSG_SEND_REL;
    onoff_server.state.onoff = node_state;

    err = esp_ble_mesh_server_model_send_msg(&root_models[1], &ctx,
                                             ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_STATUS, sizeof(onoff_server.state.onoff), &onoff_server.state.onoff);
    if (err)
    {
        ESP_LOGE("", "Failed to publish off msg");
    }
}

static void esp_ble_mesh_send_vendor_message(uint32_t opcode, uint8_t setpoint, uint16_t addr)
{
    esp_ble_mesh_msg_ctx_t ctx = {0};
    esp_err_t err;

    ctx.net_idx = prov_key.net_idx;
    ctx.app_idx = prov_key.app_idx;
    ctx.addr = addr;
    ctx.send_ttl = MSG_SEND_TTL;
    ctx.send_rel = MSG_SEND_REL;

    switch (opcode)
    {
    case ESP_BLE_MESH_VND_MODEL_OP_GET:
        err = esp_ble_mesh_client_model_send_msg(vendor_client.model, &ctx, opcode, 0, NULL, MSG_TIMEOUT, true, MSG_ROLE);
        if (err != ESP_OK)
        {
            ESP_LOGE(TAG, "Failed to send get vendor message 0x%06x", opcode);
        }
        break;
    case ESP_BLE_MESH_VND_MODEL_OP_SET:
        err = esp_ble_mesh_client_model_send_msg(vendor_client.model, &ctx, opcode, sizeof(setpoint), &setpoint, MSG_TIMEOUT, true, MSG_ROLE);
        if (err != ESP_OK)
        {
            ESP_LOGE(TAG, "Failed to send set vendor message 0x%06x", opcode);
        }
        break;
    default:
        break;
    }
}

static void esp_ble_mesh_send_gen_onoff_set(uint16_t node_addr, uint8_t node_state)
{
    esp_ble_mesh_generic_client_set_state_t set = {0};
    esp_ble_mesh_client_common_param_t common = {0};
    esp_err_t err;

    common.opcode = ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK;
    common.model = onoff_client.model;
    common.ctx.net_idx = prov_key.net_idx;
    common.ctx.app_idx = prov_key.app_idx;
    common.ctx.addr = node_addr;
    common.ctx.send_ttl = 3;
    common.ctx.send_rel = false;
    /* 0 indicates that timeout value from menuconfig will be used */
    common.msg_timeout = 0;
    common.msg_role = ROLE_NODE;

    set.onoff_set.op_en = false;
    set.onoff_set.onoff = node_state;
    set.onoff_set.tid = msg_tid++;

    err = esp_ble_mesh_generic_client_set_state(&common, &set);
    if (err)
    {
        ESP_LOGE(TAG, "%s: Generic OnOff Set failed", __func__);
    }
}

static void send_temp_update_to_raspberry(uint8_t index)
{
    char data[4] = "bgn";
    uart_write_bytes(UART_NUM, (const char *)&data, 3);
    char code = 2 + 48;
    uart_write_bytes(UART_NUM, (const char *)&code, 1);
    uart_write_bytes(UART_NUM, (const char *)&node[index].name, 10);
    char temp = node[index].temperature + 48;
    uart_write_bytes(UART_NUM, (const char *)&temp, 1);
}
static void send_state_update_to_raspberry(uint8_t index)
{
    char data[4] = "bgn";
    uart_write_bytes(UART_NUM, (const char *)&data, 3);
    char code = 0 + 48;
    uart_write_bytes(UART_NUM, (const char *)&code, 1);
    uart_write_bytes(UART_NUM, (const char *)&node[index].name, 10);
    char state = node[index].state + 48;
    uart_write_bytes(UART_NUM, (const char *)&state, 1);
}
static void send_setpoint_to_raspberry(uint8_t index)
{
    char data[4] = "bgn";
    uart_write_bytes(UART_NUM, (const char *)&data, 3);
    char code = 1 + 48;
    uart_write_bytes(UART_NUM, (const char *)&code, 1);
    uart_write_bytes(UART_NUM, (const char *)&node[index].name, 10);
    char temp = node[index].setpoint + 48;
    uart_write_bytes(UART_NUM, (const char *)&temp, 1);
}
static void esp_ble_mesh_process_set_node_temp(void)
{
    uint8_t index = self_addr - start_addr;
    esp_err_t err;

    if (strcmp(frame.destination, node[index].name) == 0)
    {
        node[index].setpoint = frame.value;
        node[index].state = ON;
        ESP_LOGI("mesh operation", "set temperature setpoint to %d", node[index].setpoint);
        
	publish_state(ON);
        send_state_update_to_raspberry(index);

        err = nvs_open("storage", NVS_READWRITE, &mem_handle);
        switch(index) {
            case 0:
                err = nvs_erase_key(mem_handle,"setpoint_0");
                err = nvs_erase_key(mem_handle,"state_0");
                err = nvs_set_u8(mem_handle, "temp_0", node[0].setpoint);
                err = nvs_set_u8(mem_handle, "state_0", node[0].state);
                break;
            case 1:
                err = nvs_erase_key(mem_handle,"setpoint_1");
                err = nvs_erase_key(mem_handle,"state_1");
                err = nvs_set_u8(mem_handle, "temp_1", node[1].setpoint);
                err = nvs_set_u8(mem_handle, "state_1", node[1].state);
                break;
            case 2:
                err = nvs_erase_key(mem_handle,"state_2");
                err = nvs_erase_key(mem_handle,"setpoint_2");
                err = nvs_set_u8(mem_handle, "temp_2", node[2].setpoint);
                err = nvs_set_u8(mem_handle, "state_1", node[1].state);
                break;
            default:
                break;
        }
        nvs_close(mem_handle);
    }
    else
    {
        for (int i = 0; i < node_count; i++)
        {
            if (strcmp(frame.destination, node[i].name) == 0)
            {
                node[i].setpoint = frame.value;
                esp_ble_mesh_send_vendor_message(ESP_BLE_MESH_VND_MODEL_OP_SET, frame.value, node[i].addr);
                ESP_LOGI("mesh operation", "set node name %s to %d", frame.destination, node[i].setpoint);
            }
        }
    }
}
static void esp_ble_mesh_process_set_node_off(void)
{
    uint8_t index = self_addr - start_addr;

    if (strcmp(frame.destination, node[index].name) == 0)
    {
        ESP_LOGI("mesh operation", "set self node state to %d", OFF);
	node[index].state = OFF;
        publish_state(OFF);
        send_state_update_to_raspberry(index);
        mem_set_data(3, index);
    }
    else
    {
        for (int i = 0; i < node_count; i++)
        {
            if (strcmp(frame.destination, node[i].name) == 0)
            {
                esp_ble_mesh_send_gen_onoff_set(node[i].addr, OFF);
                ESP_LOGI("mesh operation", "set node name %s to OFF", frame.destination);
            }
        }
    }
}
static void esp_ble_mesh_update_current_temp(void)
{
    uint8_t index = self_addr - start_addr;
    esp_err_t err;

    node[index].temperature = frame.value;
    err = nvs_open("storage", NVS_READWRITE, &mem_handle);
    switch(index) {
	case 0:
        err = nvs_erase_key(mem_handle,"temp_0");
	    err = nvs_set_u8(mem_handle, "temp_0", node[0].temperature);
	   break;
	case 1:
        err = nvs_erase_key(mem_handle,"temp_1");
	    err = nvs_set_u8(mem_handle, "temp_1", node[1].temperature);
	   break;
	case 2:
        err = nvs_erase_key(mem_handle,"temp_2");
	    err = nvs_set_u8(mem_handle, "temp_2", node[2].temperature);
	   break;
	default:
	   break;
    }
    nvs_close(mem_handle);
    publish_temp();
}
static void prov_complete(uint16_t net_idx, uint16_t addr, uint8_t flags, uint32_t iv_index)
{
    ESP_LOGI(TAG, "net_idx 0x%03x, addr 0x%04x", net_idx, addr);
    ESP_LOGI(TAG, "flags 0x%02x, iv_index 0x%08x", flags, iv_index);

    for (int j = 0; j < NODE_COUNT; j++)
    {
        node[j].set = 0;
    }
    esp_ble_mesh_save_node(addr);
    mem_set_data(0, 0);
    mem_set_data(1, 0);
    mem_set_data(3, self_addr - start_addr);
    mem_set_data(4, 0);
}

static void handle_gen_onoff_msg(esp_ble_mesh_model_t *model,
                                 esp_ble_mesh_msg_ctx_t *ctx,
                                 esp_ble_mesh_server_recv_gen_onoff_set_t *set)
{
    esp_ble_mesh_gen_onoff_srv_t *srv = model->user_data;

    switch (ctx->recv_op)
    {
    case ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_GET:
        esp_ble_mesh_server_model_send_msg(model, ctx,
                                           ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_STATUS, sizeof(srv->state.onoff), &srv->state.onoff);
        break;
    case ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET:
    case ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK:
        if (set->op_en == false)
        {
            srv->state.onoff = set->onoff;
        }
        else
        {
            srv->state.onoff = set->onoff;
        }
        if (ctx->recv_op == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET)
        {
            esp_ble_mesh_server_model_send_msg(model, ctx,
                                               ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_STATUS, sizeof(srv->state.onoff), &srv->state.onoff);
        }
        break;
    default:
        break;
    }
}

static void ble_mesh_provisioning_cb(esp_ble_mesh_prov_cb_event_t event,
                                     esp_ble_mesh_prov_cb_param_t *param)
{
    switch (event)
    {
    case ESP_BLE_MESH_PROV_REGISTER_COMP_EVT:
        /*  ESP_LOGI(TAG, "ESP_BLE_MESH_PROV_REGISTER_COMP_EVT, err_code %d", param->prov_register_comp.err_code); */
        break;
    case ESP_BLE_MESH_NODE_PROV_ENABLE_COMP_EVT:
        /*  ESP_LOGI(TAG, "ESP_BLE_MESH_NODE_PROV_ENABLE_COMP_EVT, err_code %d", param->node_prov_enable_comp.err_code); */
        break;
    case ESP_BLE_MESH_NODE_PROV_LINK_OPEN_EVT:
        /* ESP_LOGI(TAG, "ESP_BLE_MESH_NODE_PROV_LINK_OPEN_EVT, bearer %s",
                 param->node_prov_link_open.bearer == ESP_BLE_MESH_PROV_ADV ? "PB-ADV" : "PB-GATT"); */
        break;
    case ESP_BLE_MESH_NODE_PROV_LINK_CLOSE_EVT:
        /* ESP_LOGI(TAG, "ESP_BLE_MESH_NODE_PROV_LINK_CLOSE_EVT, bearer %s",
                 param->node_prov_link_close.bearer == ESP_BLE_MESH_PROV_ADV ? "PB-ADV" : "PB-GATT"); */
        break;
    case ESP_BLE_MESH_NODE_PROV_COMPLETE_EVT:
        /* ESP_LOGI(TAG, "ESP_BLE_MESH_NODE_PROV_COMPLETE_EVT"); */
        prov_complete(param->node_prov_complete.net_idx, param->node_prov_complete.addr,
                      param->node_prov_complete.flags, param->node_prov_complete.iv_index);
        prov_key.net_idx = param->node_prov_complete.net_idx;

        break;
    case ESP_BLE_MESH_NODE_PROV_RESET_EVT:
        /* ESP_LOGI(TAG, "ESP_BLE_MESH_NODE_PROV_RESET_EVT"); */
        break;
    case ESP_BLE_MESH_NODE_SET_UNPROV_DEV_NAME_COMP_EVT:
        /* ESP_LOGI(TAG, "ESP_BLE_MESH_NODE_SET_UNPROV_DEV_NAME_COMP_EVT, err_code %d", param->node_set_unprov_dev_name_comp.err_code); */
        break;
    default:
        break;
    }
}

static void ble_mesh_generic_server_cb(esp_ble_mesh_generic_server_cb_event_t event,
                                       esp_ble_mesh_generic_server_cb_param_t *param)
{
    uint8_t index;
    esp_ble_mesh_gen_onoff_srv_t *srv;
    esp_err_t err;

    ESP_LOGI(TAG, "event 0x%02x, opcode 0x%04x, src 0x%04x, dst 0x%04x",
             event, param->ctx.recv_op, param->ctx.addr, param->ctx.recv_dst);

    switch (event)
    {
    case ESP_BLE_MESH_GENERIC_SERVER_STATE_CHANGE_EVT:
        ESP_LOGI(TAG, "ESP_BLE_MESH_GENERIC_SERVER_STATE_CHANGE_EVT");
        if (param->ctx.recv_op == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET ||
            param->ctx.recv_op == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK)
        {
            index = self_addr - start_addr;
            node[index].state = param->value.state_change.onoff_set.onoff;
            ESP_LOGI("", "--------------- RECEIVED SET STATE MSG ----------------");
            ESP_LOGI("", "node addr  : 0x%04x",   node[index].addr);
            ESP_LOGI("", "node name  : %s",       node[index].name);
            ESP_LOGI("", "onoff state: 0x%02x",   node[index].state);

            publish_state(OFF);
            send_state_update_to_raspberry(index);

            err = nvs_open("storage", NVS_READWRITE, &mem_handle);
            switch(index) {
                case 0:
                    err = nvs_erase_key(mem_handle,"state_0");
                    err = nvs_set_u8(mem_handle, "state_0", node[0].state);
                    break;
                case 1:
                    err = nvs_erase_key(mem_handle,"state_1");
                    err = nvs_set_u8(mem_handle, "state_1", node[1].state);
                    break;
                case 2:
                    err = nvs_erase_key(mem_handle,"state_2");
                    err = nvs_set_u8(mem_handle, "state_2", node[2].state);
                    break;
                default:
                    break;
            }
            nvs_close(mem_handle);
        }
        break;
    case ESP_BLE_MESH_GENERIC_SERVER_RECV_GET_MSG_EVT:
        ESP_LOGI(TAG, "ESP_BLE_MESH_GENERIC_SERVER_RECV_GET_MSG_EVT");
        if (param->ctx.recv_op == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_GET)
        {
            srv = param->model->user_data;
            ESP_LOGI(TAG, "onoff 0x%02x", srv->state.onoff);
            handle_gen_onoff_msg(param->model, &param->ctx, NULL);
        }
        break;
    case ESP_BLE_MESH_GENERIC_SERVER_RECV_SET_MSG_EVT:
        ESP_LOGI(TAG, "ESP_BLE_MESH_GENERIC_SERVER_RECV_SET_MSG_EVT");
        if (param->ctx.recv_op == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET ||
            param->ctx.recv_op == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK)
        {
            ESP_LOGI(TAG, "onoff 0x%02x, tid 0x%02x", param->value.set.onoff.onoff, param->value.set.onoff.tid);
            if (param->value.set.onoff.op_en)
            {
                ESP_LOGI(TAG, "trans_time 0x%02x, delay 0x%02x",
                         param->value.set.onoff.trans_time, param->value.set.onoff.delay);
            }
            handle_gen_onoff_msg(param->model, &param->ctx, &param->value.set.onoff);
        }
        break;
    default:
        ESP_LOGE(TAG, "Unknown Generic Server event 0x%02x", event);
        break;
    }
}
static void ble_mesh_generic_client_cb(esp_ble_mesh_generic_client_cb_event_t event,
                                       esp_ble_mesh_generic_client_cb_param_t *param)
{
    uint16_t node_addr;
    uint8_t index;
    ESP_LOGI(TAG, "%s: event is %d, error code is %d, opcode is 0x%x",
             __func__, event, param->error_code, param->params->opcode);

    switch (event)
    {
    case ESP_BLE_MESH_GENERIC_CLIENT_GET_STATE_EVT:
        ESP_LOGI(TAG, "ESP_BLE_MESH_GENERIC_CLIENT_GET_STATE_EVT");
        if (param->params->opcode == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_GET)
        {
            ESP_LOGI(TAG, "ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_GET, onoff %d", param->status_cb.onoff_status.present_onoff);
        }
        break;
    case ESP_BLE_MESH_GENERIC_CLIENT_SET_STATE_EVT:
        ESP_LOGI(TAG, "ESP_BLE_MESH_GENERIC_CLIENT_SET_STATE_EVT");
        if (param->params->opcode == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET)
        {
            ESP_LOGI(TAG, "ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET, onoff %d", param->status_cb.onoff_status.present_onoff);
        }
        break;
    case ESP_BLE_MESH_GENERIC_CLIENT_PUBLISH_EVT:
        node_addr = param->params->ctx.addr; /* origin node address*/
        index = node_addr - start_addr;
        if (node_addr != self_addr)
        {
            ESP_LOGI("", "-------------- RECEIVED ONOFF STATUS MSG --------------");
            /* update state of node with address node_addr */
            node[index].state = param->status_cb.onoff_status.present_onoff;
            ESP_LOGI("", "node address: 0x%02x", node_addr);
            ESP_LOGI("", "node name: %s", node[index].name);
            ESP_LOGI("", "onoff state: 0x%02x", node[index].state);
            send_state_update_to_raspberry(index);
        }
        break;
    case ESP_BLE_MESH_GENERIC_CLIENT_TIMEOUT_EVT:
        ESP_LOGI(TAG, "ESP_BLE_MESH_GENERIC_CLIENT_TIMEOUT_EVT");
        if (param->params->opcode == ESP_BLE_MESH_MODEL_OP_GEN_ONOFF_SET)
        {
            /* If failed to get the response of Generic OnOff Set, resend Generic OnOff Set  */
            node_addr = param->params->ctx.addr;
            esp_ble_mesh_send_gen_onoff_set(node_addr, OFF);
        }
        break;
    default:
        break;
    }
}
static void ble_mesh_config_server_cb(esp_ble_mesh_cfg_server_cb_event_t event,
                                      esp_ble_mesh_cfg_server_cb_param_t *param)
{

    if (event == ESP_BLE_MESH_CFG_SERVER_STATE_CHANGE_EVT)
    {
        switch (param->ctx.recv_op)
        {
        case ESP_BLE_MESH_MODEL_OP_APP_KEY_ADD:
            break;
        case ESP_BLE_MESH_MODEL_OP_MODEL_APP_BIND:
            ESP_LOGI("cfg_client", "ESP_BLE_MESH_MODEL_OP_MODEL_APP_BIND");
            ESP_LOGI("cfg_client", "elem_addr 0x%04x, mod_id 0x%04x",
                     param->value.state_change.mod_app_bind.element_addr,
                     param->value.state_change.mod_app_bind.model_id);
            break;
        case ESP_BLE_MESH_MODEL_OP_MODEL_PUB_SET:
            ESP_LOGI("cfg_client", "ESP_BLE_MESH_MODEL_OP_MODEL_PUB_SET");
            ESP_LOGI("cfg_client", "elem_addr 0x%04x, pub_addr 0x%04x, pub_ttl 0x%04x, pub_retransmit 0x%04x, mod_id 0x%04x",
                     param->value.state_change.mod_pub_set.element_addr,
                     param->value.state_change.mod_pub_set.pub_addr,
                     param->value.state_change.mod_pub_set.pub_ttl,
                     param->value.state_change.mod_pub_set.pub_retransmit,
                     param->value.state_change.mod_pub_set.model_id);
            switch (param->value.state_change.mod_pub_set.model_id)
            {
            case ESP_BLE_MESH_VND_MODEL_ID_CLIENT:
                break;
            case ESP_BLE_MESH_VND_MODEL_ID_SERVER:
                publish_temp();
                send_temp_update_to_raspberry(self_addr - start_addr);
                break;
            default:
                break;
            }
            break;
        case ESP_BLE_MESH_MODEL_OP_MODEL_SUB_ADD:
            ESP_LOGI("cfg_client", "ESP_BLE_MESH_MODEL_OP_MODEL_SUB_ADD");
            ESP_LOGI("cfg_client", "elem_addr 0x%04x, sub_addr 0x%04x, mod_id 0x%04x",
                     param->value.state_change.mod_sub_add.element_addr,
                     param->value.state_change.mod_sub_add.sub_addr,
                     param->value.state_change.mod_sub_add.model_id);
            break;
        default:
            break;
        }
    }
}

static void ble_mesh_custom_model_cb(esp_ble_mesh_model_cb_event_t event,
                                     esp_ble_mesh_model_cb_param_t *param)
{
    uint16_t d_addr;
    uint8_t index;
    uint8_t *p;
    esp_err_t err;

    switch (event)
    {
    case ESP_BLE_MESH_MODEL_OPERATION_EVT:
        d_addr = param->model_operation.ctx->addr;
        /* ---------------------------RECEIVED MESSAGES ------------------------------*/
        switch (param->model_operation.opcode)
        {
        /* ------ server messages treatment ------ */
        case ESP_BLE_MESH_VND_MODEL_OP_GET:
            index = self_addr - start_addr;
            ESP_LOGI("", "------ RECEIVED TEMPERATURE GET MESSAGE --------");
            ESP_LOGI("", "msg ttl: %d", param->model_operation.ctx->recv_ttl);
            ESP_LOGI("", "node address: x%04x\n temperature status: %d", node[index].addr, node[index].temperature);

            err = esp_ble_mesh_server_model_send_msg(&vnd_models[0],
                                                     param->model_operation.ctx, ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS,
                                                     sizeof(node[index].temperature), &node[index].temperature);
            if (err)
            {
                ESP_LOGE("temp_srv", "Failed to send get status message 0x%06x", ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS);
            }
            if (node[index].set == 0)
            {
                node[index].set = 1;
                node_count++;
            }
            break;
        case ESP_BLE_MESH_VND_MODEL_OP_SET:
            index = self_addr - start_addr;
	    node[index].state = ON;
            onoff_server.state.onoff = ON;
            ESP_LOGI("", "------  RECEIVED TEMPERATURE SET MESSAGE ------ ");
            ESP_LOGI("", "msg ttl            : %d", param->model_operation.ctx->recv_ttl);
            ESP_LOGI("", "node address       : 0x%04x", node[index].addr);
            ESP_LOGI("", "current temperature: %d", node[index].temperature);
            node[index].setpoint = *(uint8_t *)param->model_operation.msg;
            ESP_LOGI("", "setpoint           : %d", node[index].setpoint);
            err = esp_ble_mesh_server_model_send_msg(&vnd_models[0],
                                                     param->model_operation.ctx, ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS,
                                                     sizeof(node[index].setpoint), (uint8_t *)&node[index].setpoint);
            if (err)
            {
                ESP_LOGE("temp_srv", "Failed to send message 0x%06x", ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS);
            }
            publish_state(ON);
            publish_temp();
            send_state_update_to_raspberry(index);
            send_setpoint_to_raspberry(index);
            err = nvs_open("storage", NVS_READWRITE, &mem_handle);
            /* save received setpoint and state in the flash memory */
            switch(index) {
                case 0:
                    err = nvs_erase_key(mem_handle, "setpoint_0");
                    err = nvs_erase_key(mem_handle, "state_0");
                    err = nvs_set_u8(mem_handle, "setpoint_0", node[0].setpoint);
                    err = nvs_set_u8(mem_handle, "state_0",    node[0].state);
                    break;
                case 1:
                    err = nvs_erase_key(mem_handle, "setpoint_1");
                    err = nvs_erase_key(mem_handle, "state_1");
                    err = nvs_set_u8(mem_handle, "setpoint_1", node[1].setpoint);
                    err = nvs_set_u8(mem_handle, "state_1",    node[1].state);
                    break;
                case 2:
                    err = nvs_erase_key(mem_handle, "setpoint_2");
                    err = nvs_erase_key(mem_handle, "state_2");
                    err = nvs_set_u8(mem_handle, "setpoint_2", node[2].setpoint);
                    err = nvs_set_u8(mem_handle, "state_2",    node[2].state);
                    break;
                default:
                    break;
            }
            nvs_close(mem_handle);
            break;
        /* ------ client messages treatment ------ */
        case ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS:
            index = d_addr - start_addr;
            p = (uint8_t *)param->model_operation.msg;
            node[index].addr = d_addr;
            p = p + 2;
            node[index].temperature = *(uint8_t *)p;
            p++;
            strncpy(node[index].name, (char *)p,10);
            node[index].name[10] = '\0';
            ESP_LOGI("", "------  RECEIVED TEMPERATURE GET STATUS MESSAGE ------- ");
            ESP_LOGI("", "msg ttl: %d", param->model_operation.ctx->recv_ttl);
            ESP_LOGI("", "temperature of node 0x%04x is currenty %d", param->model_operation.ctx->addr, node[index].temperature);
            ESP_LOGI("", "node name %s", node[index].name);
            p = p - 3;
            break;
        case ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS:
            break;
        default:
            break;
        }
        break;
    case ESP_BLE_MESH_MODEL_SEND_COMP_EVT:
        if (param->model_send_comp.err_code)
        {
            ESP_LOGE(TAG, "Failed to send message 0x%06x", param->model_send_comp.opcode);
            break;
        }
        ESP_LOGI("", "msg 0x%06x sent to node 0x%04x", param->model_send_comp.opcode, param->model_send_comp.ctx->addr);
        break;
    case ESP_BLE_MESH_CLIENT_MODEL_RECV_PUBLISH_MSG_EVT:

        p = (uint8_t *)param->client_recv_publish_msg.msg;
        d_addr = *(uint16_t *)p;

        if (d_addr != self_addr)
        {
            switch (param->client_recv_publish_msg.opcode)
            {
            case ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS:
                index = d_addr - start_addr;

                node[index].addr = d_addr;
                p = p + 2;
                node[index].temperature = *(uint8_t *)p;
                p++;
                strncpy(node[index].name, (char *)p,10);
                node[index].name[10] = '\0';
                ESP_LOGI("", "------  RECEIVED PUBLISHED GET STATUS MSG ------ ");
                ESP_LOGI("", "msg ttl         : %d", param->client_recv_publish_msg.ctx->recv_ttl);
                ESP_LOGI("", "node address    : 0x%04x", node[index].addr);
                ESP_LOGI("", "node temperature: %d",     node[index].temperature);
                ESP_LOGI("", "node name       : %s",     node[index].name);

                if (node[index].set == 0)
                {
                    node[index].set = 1;
                    node_count++;
                }
                p = p - 3;
                send_temp_update_to_raspberry(index);
                break;
            default:
                break;
            }
        }
        break;
    case ESP_BLE_MESH_CLIENT_MODEL_SEND_TIMEOUT_EVT:
        ESP_LOGW("", "message 0x%06x timeout", param->client_send_timeout.opcode);
        break;
    case ESP_BLE_MESH_MODEL_PUBLISH_UPDATE_EVT:
        break;
    default:
        break;
    }
}
static esp_err_t ble_mesh_init(void)
{
    esp_err_t err;

    esp_ble_mesh_register_prov_callback(ble_mesh_provisioning_cb);
    esp_ble_mesh_register_config_server_callback(ble_mesh_config_server_cb);
    esp_ble_mesh_register_custom_model_callback(ble_mesh_custom_model_cb);
    esp_ble_mesh_register_generic_client_callback(ble_mesh_generic_client_cb);
    esp_ble_mesh_register_generic_server_callback(ble_mesh_generic_server_cb);

    err = esp_ble_mesh_init(&provision, &composition);
    if (err != ESP_OK)
    {
        ESP_LOGE(TAG, "Failed to initialize mesh stack");
        return err;
    }

    err = esp_ble_mesh_node_prov_enable(ESP_BLE_MESH_PROV_ADV | ESP_BLE_MESH_PROV_GATT);
    if (err != ESP_OK)
    {
        ESP_LOGE(TAG, "Failed to enable mesh node");
        return err;
    }

    /* init client models in order to send information */
    err = esp_ble_mesh_client_model_init(&vnd_models[1]);

    if (err)
    {
        ESP_LOGE(TAG, "Failed to initialize vendor client");
        return err;
    }

    ESP_LOGI(TAG, "BLE Mesh Node initialized");

    return ESP_OK;
}

void uart_config(void)
{
    /// Configure parameters of an UART driver

    uart_config_t uart_config = {
        .baud_rate = 9600,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE};
    uart_param_config(UART_NUM, &uart_config);

    // Install UART driver, and get the queue.
    uart_driver_install(UART_NUM, BUF_SIZE * 2, BUF_SIZE * 2, 100, &uart0_queue, 0);
    uart_set_pin(UART_NUM, TXD, RXD, RTS, CTS);
}
static void compare_code(char *dtmp, char expected)
{
    if (*dtmp == expected)
    {
        flag++;
    }
    else
    {
        flag = 0;
    }
}

static void uart_frame_parsing(uint8_t packet[])
{
    int i = 0;
    frame.code = packet[0] - 48;
    while (i < 10)
    {
        frame.destination[i] = packet[i + 1];
        i++;
    }
    frame.destination[10] = '\0';
    frame.value = packet[11] - 48;

/*     printf("frame.code %d", frame.code);
    printf("frame.destination %s", frame.destination);
    printf("frame.value %d", frame.value); */
    switch (frame.code)
    {
    case SET_NODE_TEMP:
        esp_ble_mesh_process_set_node_temp();
        break;
    case SET_NODE_OFF:
        esp_ble_mesh_process_set_node_off();
        break;
    case UPDATE_TEMP:
        esp_ble_mesh_update_current_temp();
        break;
    default:
        break;
    }
}
static void uart_event_task(void *pvParameters)
{
    uart_event_t event;
    uint8_t *dtmp = (uint8_t *)malloc(RD_BUF_SIZE);
    uint8_t i = 0;

    for (;;)
    {
        // Waiting for UART event.
        if (xQueueReceive(uart0_queue, (void *)&event, (portTickType)portMAX_DELAY))
        {
            bzero(dtmp, RD_BUF_SIZE);
            switch (event.type)
            {
            case UART_DATA:
                uart_read_bytes(UART_NUM, dtmp, event.size, portMAX_DELAY);

                while (i < event.size)
                {
                    if (flag == 0)
                    {
                        compare_code((char *)dtmp, 's');
                    }
                    else if (flag == 1)
                    {
                        compare_code((char *)dtmp, 'y');
                    }
                    else if (flag == 2)
                    {
                        compare_code((char *)dtmp, 'c');
                    }
                    else
                    {
                        pos++;
                        if (pos < 12)
                        {
                            packet[pos] = *dtmp;
                        }
                        if(pos==11)
                        {
                            uart_frame_parsing(packet);
                            flag = 0;
                            pos = -1;
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
                uart_flush_input(UART_NUM);
                xQueueReset(uart0_queue);
                break;

            // Event of UART ring buffer full
            case UART_BUFFER_FULL:
                ESP_LOGI(TAG, "ring buffer full");
                // If buffer full happened, you should consider encreasing your buffer size
                // As an example, we directly flush the rx buffer here in order to read more data.
                uart_flush_input(UART_NUM);
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
                break;
            }
        }
    }

    free(dtmp);
    dtmp = NULL;
    vTaskDelete(NULL);
}

void app_main(void)
{
    esp_err_t err;
    nvs_flash_erase();
    ESP_LOGI(TAG, "Initializing...");
    err = nvs_flash_init();
    if (err == ESP_ERR_NVS_NO_FREE_PAGES)
    {
        ESP_ERROR_CHECK(nvs_flash_erase());
        err = nvs_flash_init();
    }
    ESP_ERROR_CHECK(err);

    err = bluetooth_init();
    if (err)
    {
        ESP_LOGE(TAG, "esp32_bluetooth_init failed (err %d)", err);
        return;
    }

    ble_mesh_get_dev_uuid(dev_uuid);

    /* Initialize the Bluetooth Mesh Subsystem */
    err = ble_mesh_init();
    if (err)
    {
        ESP_LOGE(TAG, "Bluetooth mesh init failed (err %d)", err);
    }
    esp_log_level_set(TAG, ESP_LOG_INFO);

    uart_config();
    nvs_get_all_data();

    //Create a task to handler UART event from ISR
    xTaskCreate(uart_event_task, "uart_event_task", 2048, NULL, 12, NULL);
}
