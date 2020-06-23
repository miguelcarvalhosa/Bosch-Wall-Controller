/* main.c - Application main entry point */

#include <stdio.h>
#include <string.h>
#include <math.h>

#include "esp_log.h"
#include "nvs_flash.h"
#include "esp_bt.h"

#include "esp_ble_mesh_defs.h"
#include "esp_ble_mesh_common_api.h"
#include "esp_ble_mesh_networking_api.h"
#include "esp_ble_mesh_provisioning_api.h"
#include "esp_ble_mesh_config_model_api.h"
#include "esp_ble_mesh_local_data_operation_api.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/uart.h"
#include "esp_log.h"
#include "esp_vfs_dev.h"

#include "board.h"
#include "ble_mesh_demo_init.h"
#include "uart_struct.h"

#define UART_NUM UART_NUM_0
#define TXD  (GPIO_NUM_4)
#define RXD  (GPIO_NUM_5)
#define RTS  (UART_PIN_NO_CHANGE)
#define CTS  (UART_PIN_NO_CHANGE)


#define BUF_SIZE (1024)
#define RD_BUF_SIZE (BUF_SIZE)
static QueueHandle_t uart0_queue;

#define CID_ESP 0x02E5
#define CID_NVAL 0xFFFF

#define MSG_SEND_TTL 3
#define MSG_SEND_REL false
#define MSG_TIMEOUT 0
#define MSG_ROLE ROLE_NODE

#define NODE_COUNT 2
#define ESP_BLE_MESH_VND_MODEL_ID_CLIENT 0x0000
#define ESP_BLE_MESH_VND_MODEL_ID_SERVER 0x0001

#define ESP_BLE_MESH_VND_MODEL_OP_GET ESP_BLE_MESH_MODEL_OP_3(0x00, CID_ESP)
#define ESP_BLE_MESH_VND_MODEL_OP_SET ESP_BLE_MESH_MODEL_OP_3(0x01, CID_ESP)
#define ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS ESP_BLE_MESH_MODEL_OP_3(0x02, CID_ESP)
#define ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS ESP_BLE_MESH_MODEL_OP_3(0x03, CID_ESP)

#define SET_NODE_TEMP 1
#define SET_NODE_OFF  0


/* information about the provisioner used */
static uint8_t dev_uuid[ESP_BLE_MESH_OCTET16_LEN] = {0x32, 0x10};
uint16_t start_addr = 0x0002;
uint16_t dest_addr, self_addr;

/* internal action signals */
/* uint8_t set_op = 0;
uint8_t set_name = 0; */

uint8_t reference;
uint8_t flag = 0;
uint8_t pos =-1;
uint8_t packet[15];
uart_frame_t frame;


/* internal structure to save the data received from each node in msgs*/
struct esp_ble_mesh_temp_t
{
    uint16_t addr;
    uint8_t temperature;
    char *name;
};
//volatile uint8_t node_count = 0;
volatile struct esp_ble_mesh_temp_t temp[NODE_COUNT];
volatile struct esp_ble_mesh_temp_t *p_temp = temp;

/* models are refered as esp_ble_mesh_client_t or specific to the model library in case of servers */
static esp_ble_mesh_cfg_srv_t config_server = {
    .relay = ESP_BLE_MESH_RELAY_NOT_SUPPORTED,
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

static esp_ble_mesh_model_t root_models[] = {
    ESP_BLE_MESH_MODEL_CFG_SRV(&config_server),
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

static void esp_ble_mesh_save_node(uint16_t addr) {
    /* fill array of data temperatures */
    uint8_t index = addr-start_addr; //(uint8_t) round((float)addr / (float)start_addr);
    ESP_LOGI("INDEX:","%d",index);
    p_temp = p_temp + index;
    p_temp->addr = addr;
    self_addr = addr;
    p_temp->temperature = addr * 10;
    p_temp->name = "cozinha";
    p_temp = p_temp - index;
}
void esp_ble_mesh_process_set_node_temp(void) {
    uint8_t index = self_addr-start_addr;
    p_temp = p_temp + index;

    ESP_LOGI("","frame.destination: %s",frame.destination);
    ESP_LOGI("","p_temp.name: %s",p_temp->name);
    ESP_LOGI("","p_temp.size %d",sizeof(p_temp));
    ESP_LOGI("","resultado %d",strcmp(frame.destination, p_temp->name));

    if(strcmp(frame.destination, p_temp->name) == 0) {
        p_temp->temperature = frame.offset;
        ESP_LOGI("set_node_temp","set self node temp to %d",p_temp->temperature);
        p_temp = p_temp - index;
    } else {
        p_temp = p_temp - index;
        for(int i = 0; i<NODE_COUNT;i++) {
            ESP_LOGI("","%d resultado %d",i,strcmp(frame.destination, p_temp->name));
            if(strcmp(frame.destination, p_temp->name) == 0) {
                p_temp->temperature = frame.offset;
                ESP_LOGI("set_node_temp","set node name %s to %d",frame.destination,p_temp->temperature);
            }
            p_temp++;
        }
        p_temp = p_temp - sizeof(p_temp);
    }
}
void esp_ble_mesh_process_set_node_off(void) {
    
}
static void prov_complete(uint16_t net_idx, uint16_t addr, uint8_t flags, uint32_t iv_index)
{
    ESP_LOGI(TAG, "net_idx 0x%03x, addr 0x%04x", net_idx, addr);
    ESP_LOGI(TAG, "flags 0x%02x, iv_index 0x%08x", flags, iv_index);
    board_led_operation(LED_G, LED_OFF);
    esp_ble_mesh_save_node(addr);
}
void esp_ble_mesh_send_vendor_message(uint32_t opcode, uint8_t reference, uint16_t addr)
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
        err = esp_ble_mesh_client_model_send_msg(vendor_client.model, &ctx, opcode, sizeof(reference), &reference, MSG_TIMEOUT, true, MSG_ROLE);
        if (err != ESP_OK)
        {
            ESP_LOGE(TAG, "Failed to send set vendor message 0x%06x", opcode);
        }
        break;
    default:
        break;
    }
}
static void publish_temp(void) {
        int i=0;
	uint8_t index = self_addr-start_addr;
        p_temp = p_temp + index;
	ESP_LOGI("div res", "%d",index);
        uint8_t d[13]= {(self_addr & 0xff), (self_addr >> 8), p_temp->temperature};
	ESP_LOGI("","name of node %s", p_temp->name);
        for(i=0;i<10;i++) {
            if(*p_temp->name != '0') {
                d[3+i] = (uint8_t)*p_temp->name;
                ESP_LOGI("","%d %c",i,d[3+i]);
            }
            p_temp->name++;
        }
        p_temp->name = p_temp->name - 10;

        ESP_LOGI("","room name: %s",p_temp->name);
        ESP_LOG_BUFFER_HEX("",d,sizeof(d)); 
 
        esp_err_t err = esp_ble_mesh_model_publish(&vnd_models[0], ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS, sizeof(d), (uint8_t *)&d, ROLE_NODE);
        if (err)
        {
            ESP_LOGE("", "Failed to publish msg");
        }
        p_temp = p_temp - index; 
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

static void ble_mesh_config_server_cb(esp_ble_mesh_cfg_server_cb_event_t event,
                                              esp_ble_mesh_cfg_server_cb_param_t *param)
{

    if (event == ESP_BLE_MESH_CFG_SERVER_STATE_CHANGE_EVT)
    {
        switch (param->ctx.recv_op)
        {
        case ESP_BLE_MESH_MODEL_OP_APP_KEY_ADD:
/*             ESP_LOGI(TAG, "ESP_BLE_MESH_MODEL_OP_APP_KEY_ADD");
            ESP_LOGI(TAG, "net_idx 0x%04x, app_idx 0x%04x",
                     param->value.state_change.appkey_add.net_idx,
                     param->value.state_change.appkey_add.app_idx);
            ESP_LOG_BUFFER_HEX("AppKey", param->value.state_change.appkey_add.app_key, 16); */
            break;
        case ESP_BLE_MESH_MODEL_OP_MODEL_APP_BIND:
/*             ESP_LOGI("cfg_client", "ESP_BLE_MESH_MODEL_OP_MODEL_APP_BIND");
            ESP_LOGI("cfg_client", "elem_addr 0x%04x, app_idx 0x%04x, cid 0x%04x, mod_id 0x%04x",
                     param->value.state_change.mod_app_bind.element_addr,
                     param->value.state_change.mod_app_bind.app_idx,
                     param->value.state_change.mod_app_bind.company_id,
                     param->value.state_change.mod_app_bind.model_id);
            prov_key.app_idx = param->value.state_change.mod_app_bind.app_idx; */
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
    uint8_t *p;
    uint8_t index;
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
	    index = self_addr-start_addr;
            p_temp = p_temp + index;
            ESP_LOGI("", "------ RECEIVED TEMPERATURE GET MESSAGE --------");
            ESP_LOGI("","msg ttl: %d",param->model_operation.ctx->recv_ttl);
            ESP_LOGI("", "node address: x%04x\n temperature status: %d", p_temp->addr, p_temp->temperature);
            uint8_t d[13] = {(self_addr & 0xff), (self_addr >> 8), p_temp->temperature, *p_temp->name};
            uint8_t *data = d;
            data = (uint8_t *)&p_temp->temperature;

            err = esp_ble_mesh_server_model_send_msg(&vnd_models[0],
                                                     param->model_operation.ctx, ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS,
                                                     sizeof(data), data);
            if (err)
            {
                ESP_LOGE("temp_srv", "Failed to send get status message 0x%06x", ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS);
            }
            p_temp = p_temp - index;
            break;
        case ESP_BLE_MESH_VND_MODEL_OP_SET:
	    index = self_addr-start_addr;
            p_temp = p_temp + index;
            ESP_LOGI("", "------  RECEIVED TEMPERATURE SET MESSAGE ------ ");
            ESP_LOGI("","msg ttl: %d",param->model_operation.ctx->recv_ttl);
            ESP_LOGI("", "node address: 0x%04x", p_temp->addr);
            ESP_LOGI("", "previous temperature: %d", p_temp->temperature);
            p_temp->temperature = *(uint8_t *)param->model_operation.msg;
            ESP_LOGI("", "current temperature: %d", p_temp->temperature);
            err = esp_ble_mesh_server_model_send_msg(&vnd_models[0],
                                                     param->model_operation.ctx, ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS,
                                                     sizeof(p_temp->temperature), (uint8_t *)&p_temp->temperature);
            if (err)
            {
                ESP_LOGE("temp_srv", "Failed to send message 0x%06x", ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS);
            }
            p_temp = p_temp - index;
            publish_temp();
            break;
        /* ------ client messages treatment ------ */
        case ESP_BLE_MESH_VND_MODEL_OP_GET_STATUS:
	    index = d_addr-start_addr;
            p_temp = p_temp + index;
            p = (uint8_t *)param->model_operation.msg;
            p_temp->addr = d_addr;
            p = p + 2;
            p_temp->temperature = *(uint8_t *)p;
            p++;
            p_temp->name = (char *)p;
            ESP_LOGI("", "------  RECEIVED TEMPERATURE GET STATUS MESSAGE ------- ");
            ESP_LOGI("","msg ttl: %d",param->model_operation.ctx->recv_ttl);
            ESP_LOGI("", "temperature of node 0x%04x is currenty %d", param->model_operation.ctx->addr, p_temp->temperature);
            ESP_LOGI("", "node name %s", p_temp->name);
            p_temp = p_temp - index;
            p = p - 3;
            break;
        case ESP_BLE_MESH_VND_MODEL_OP_SET_STATUS:
	    index = d_addr-start_addr;
            p_temp = p_temp + index;
            uint8_t recv_temp = *(uint8_t *)param->model_operation.msg;
            ESP_LOGI("", "------ RECEIVED TEMPERATURE SET STATUS MESSAGE ------ ");
            /* compare the sent temperature with the successfully*/
            ESP_LOGI("","msg ttl: %d",param->model_operation.ctx->recv_ttl);
            if (recv_temp != reference)
            {
                ESP_LOGI("", "recv_temp (%d) != reference (%d)", recv_temp, reference);
            }
            else
            {
                p_temp->temperature = recv_temp;
                ESP_LOGI("", "temperature of node 0x%04x set to %d", d_addr, p_temp->temperature);
            }
            p_temp = p_temp - index;
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
		index = d_addr-start_addr;
                p_temp = p_temp + index;
                p_temp->addr = d_addr;
                p = p + 2;
                p_temp->temperature = *(uint8_t *)p;
                p++;
                p_temp->name = (char *)p;
                
                ESP_LOGI("", "------  RECEIVED PUBLISH GET STATUS MSG ------ ");
                ESP_LOGI("","msg ttl: %d",param->client_recv_publish_msg.ctx->recv_ttl);
                ESP_LOGI("", "node address: 0x%04x", p_temp->addr);
                ESP_LOGI("", "node temperature: %d", p_temp->temperature);
                ESP_LOGI("", "node name: %s", p_temp->name);
                p_temp = p_temp - index;
                p = p - 3;
                break;
            default:
                break;
            }
        }
        break;
    case ESP_BLE_MESH_CLIENT_MODEL_SEND_TIMEOUT_EVT:
        ESP_LOGW("", "message 0x%06x timeout", param->client_send_timeout.opcode);
        /* esp_err_t err = esp_ble_mesh_client_model_send_msg(param->client_send_timeout.model, param->client_send_timeout.ctx, param->client_send_timeout.opcode, sizeof(reference), &reference, MSG_TIMEOUT, true, MSG_ROLE);
        if (err)
        {
            ESP_LOGE("", "Failed to send msg");
        } */
        break;
    case ESP_BLE_MESH_MODEL_PUBLISH_UPDATE_EVT:
        //publish_temp();
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
    board_led_operation(LED_G, LED_ON);
    err = esp_ble_mesh_client_model_init(&vnd_models[1]);
    if (err)
    {
        ESP_LOGE(TAG, "Failed to initialize vendor client");
        return err;
    }

    ESP_LOGI(TAG, "BLE Mesh Node initialized");

    return ESP_OK;
}

void uart_config(void)  {
    /// Configure parameters of an UART driver,
    // communication pins and install the driver
    uart_config_t uart_config = {
        .baud_rate = 9600,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    };
    uart_param_config(UART_NUM, &uart_config);

    // Install UART driver, and get the queue.
    uart_driver_install(UART_NUM, BUF_SIZE * 2, BUF_SIZE * 2, 100, &uart0_queue, 0);
    uart_set_pin(UART_NUM, TXD, RXD, RTS, CTS);

}
static void compare_code(char* dtmp,char expected)
{
  if (*dtmp == expected){
    flag++;
  }
  else {
    flag = 0;
  }
}

static void uart_frame_parsing(uint8_t* packet){
  int pos = 0;
  while(pos<12) {
    //printf("\nDestination %c",packet[pos]);
    if(pos == 0){
      frame.code = *packet - 48;
    }
    else if(pos > 0 && pos < 11) {
      //uint8_t aux = *packet;
      if(*packet != '0') {
        frame.destination =(char*) packet;
      } else {
        *frame.destination = 0;
      }
      frame.destination++;
    } else {
      frame.offset = *packet - 48;
      *frame.destination = 0;
      frame.destination = frame.destination - 10;
      printf("\n\n%d\n", frame.code);
      printf("%s\n", frame.destination);
      printf("%d\n", frame.offset);
      switch(frame.code) {
          case SET_NODE_TEMP:
            esp_ble_mesh_process_set_node_temp();
            break;
          case SET_NODE_OFF:
            esp_ble_mesh_process_set_node_off();
            break;
          default:
            break;
      }
    }
    packet++;
    pos++;
  }
}
/* static void uart_event_task(void *pvParameters)
{
    uart_event_t event;
    //size_t buffered_size;
    uint8_t *dtmp = (uint8_t *)malloc(RD_BUF_SIZE);
    for (;;)
    {
        //Waiting for UART event.
        if (xQueueReceive(uart0_queue, (void *)&event, (portTickType)portMAX_DELAY))
        {
            bzero(dtmp, RD_BUF_SIZE);
            switch (event.type)
            {
            //Event of UART receving data
            case UART_DATA:
                uart_read_bytes(UART_NUM, dtmp, event.size, portMAX_DELAY);
                printf("%c",*dtmp);
                if(set_name == 0) {
                    if ((*(dtmp) == 83) | (*(dtmp) == 115)) {
                    printf("\n---------------- TEMPERATURE SET STARTED ---------------\n");
                    printf(" OPERATION A. set self temperature\n");
                    printf(" OPERATION B. set node temperature\n");
                    set_op = 1;
                    } else if (set_op == 1) {
                        if ((*(dtmp) == 65) | (*(dtmp) == 97)) { // OPERATION A
                            printf("\n");
                            printf("REFERENCE TEMPERATURE:");
                            set_op = 2;
                        }
                        else if ((*(dtmp) == 66) | (*(dtmp) == 98)) { // OPERATION B
                            printf("\n NODE UNICAST ADDRESS:");
                            set_op = 4;
                        }
                    } else if (set_op == 2) {
                        packet[0] = *dtmp - 48;
                        set_op = 3;
                    } else if (set_op == 3) {
                        packet[1] = *dtmp - 48;
                        p_temp = p_temp + ((self_addr / start_addr) - 1);
                        p_temp->temperature = packet[0] * 10 + packet[1];
                        printf("\n");
                        ESP_LOGI("","Set self temperature to %d", p_temp->temperature);
                        p_temp = p_temp - ((self_addr / start_addr) - 1);
                        publish_temp();
                        set_op = 0;
                    } else if (set_op == 4) {
                        packet[0] = *dtmp - 48;
                        set_op = 5;
                    } else if (set_op == 5) {
                        packet[1] = *dtmp - 48;
                        dest_addr = packet[0] * 10 + packet[1];
                        printf("\n REFERENCE TEMPERATURE:");
                        set_op = 6;
                    } else if (set_op == 6) {
                        packet[2] = *dtmp - 48;
                        set_op = 7;
                    } else if (set_op == 7) {
                        packet[3] = *dtmp - 48;
                        reference = packet[2] * 10 + packet[3];
                        printf("\n");

                        esp_ble_mesh_send_vendor_message(ESP_BLE_MESH_VND_MODEL_OP_SET, reference, dest_addr);
                        ESP_LOGI("temp_srv", "Sent SET msg to node 0x%04x with temp=%d \n", dest_addr, reference);
                        set_op = 0;
                    } 
                    
                }
                break;
            //Event of HW FIFO overflow detected
            case UART_FIFO_OVF:
                ESP_LOGI(TAG, "hw fifo overflow");
                // If fifo overflow happened, you should consider adding flow control for your application.
                // The ISR has already reset the rx FIFO,
                // As an example, we directly flush the rx buffer here in order to read more data.
                uart_flush_input(UART_NUM);
                xQueueReset(uart0_queue);
                break;
            //Event of UART ring buffer full
            case UART_BUFFER_FULL:
                ESP_LOGI(TAG, "ring buffer full");
                // If buffer full happened, you should consider encreasing your buffer size
                // As an example, we directly flush the rx buffer here in order to read more data.
                uart_flush_input(UART_NUM);
                xQueueReset(uart0_queue);
                break;
            //Event of UART RX break detected
            case UART_BREAK:
                ESP_LOGI(TAG, "uart rx break");
                break;
            //Event of UART parity check error
            case UART_PARITY_ERR:
                ESP_LOGI(TAG, "uart parity error");
                break;
            //Event of UART frame error
            case UART_FRAME_ERR:
                ESP_LOGI(TAG, "uart frame error");
                break;
            default:
                ESP_LOGI(TAG, "uart event type: %d", event.type);
                break;
            }
        }
    }
    free(dtmp);
    dtmp = NULL;
    vTaskDelete(NULL);
} */

static void uart_event_task(void *pvParameters)
{
    uart_event_t event;
    uint8_t *dtmp = (uint8_t *) malloc(RD_BUF_SIZE);
    uint8_t i = 0;


    for (;;) {
        // Waiting for UART event.
        if (xQueueReceive(uart0_queue, (void *)&event, (portTickType)portMAX_DELAY)) {
            bzero(dtmp, RD_BUF_SIZE);
            ESP_LOGI(TAG, "uart[%d] event:", UART_NUM);
            switch (event.type) {
                case UART_DATA:
                  uart_read_bytes(UART_NUM, dtmp, event.size, portMAX_DELAY);
                  //printf("Event size: %d\n",event.size);
                  printf("%c",*dtmp);
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
                    ESP_LOGI(TAG, "uart event type: %d", event.type);
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

    ESP_LOGI(TAG, "Initializing...");

    err = nvs_flash_init();
    if (err == ESP_ERR_NVS_NO_FREE_PAGES)
    {
        ESP_ERROR_CHECK(nvs_flash_erase());
        err = nvs_flash_init();
    }
    ESP_ERROR_CHECK(err);

    board_init();

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
    //Create a task to handler UART event from ISR
    xTaskCreate(uart_event_task, "uart_event_task", 2048, NULL, 12, NULL);
}
