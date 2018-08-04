#ifndef _HM_PROTOCOL_H_
#define _HM_PROTOCOL_H_

#define HN_CONNECT_COUNT	  10

extern uint8_t hn_connect;
extern uint8_t hn_type;
extern uint8_t hn_error_checksum;
extern uint8_t hn_buf_error[15];
extern uint8_t hn_buf_count;

enum tagHomenetType{
	HN_TYPE_NONE,
	HN_TYPE_COMMAX,
	HN_TYPE_CLIO,
	HN_TYPE_CLIO_KD,
	HN_TYPE_KOCOM,
	HN_TYPE_HYUNDAI,
	HN_TYPE_SEOUL
};

typedef struct tagHomenetInfo {
	uint8_t boiler_on_off;
	uint8_t boiler_mode_shower;
	uint8_t boiler_warm_up;
	uint8_t boiler_water_heat;
	uint8_t boiler_water_shower;
}HNINFO_CLIO;

extern HNINFO_CLIO hnInfo_clio;

typedef struct tagHomenetKocom {
	uint8_t on_off;
	uint8_t mode_heat;
	uint8_t mode_heat_water;
	uint8_t mode_shower_water;
	uint8_t mode_sub;
	uint8_t temp_set_heat;
	uint8_t temp_set_shower_water;
}HNINFO_KOCOM;

extern HNINFO_KOCOM hnInfo_kocom; 

uint8_t getHexToBin(uint8_t hex, uint8_t idx);
uint8_t hn_make_errorCode(void);
uint8_t hn_ptc_10To16(uint8_t val);
uint8_t hn_ptc_16To10(uint8_t val);

// extCommax.c
void hn_commax_ptc_check(void);

// extClio.c
void hn_clio_ptc_check(void);
void hn_clio_ptc_check_KD(void);

// extKocom.c
void hn_kocom_ptc_check(void);
void hn_kocom_ptc_make_send(uint8_t room);
void	hn_kocom_cb(uint8_t mode);

// extHyundai.c
void hn_hyundai_ptc_check (void);

//extSeoul.c
void hn_seoul_ptc_check (void);
#endif