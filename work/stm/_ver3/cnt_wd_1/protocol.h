
#ifndef _PROTOCOL_H_
#define _PROTOCOL_H_

//#include "stdafx.h"

typedef struct protocolData
{
	uint8_t id;
	uint8_t op_mode;
	uint8_t time_reserve;
	uint8_t op;
	uint8_t cur_tmp;
	uint8_t set_tmp;
//	unit8_t tmp_diff;
	uint8_t byte4;
	uint8_t byte5;
	uint8_t byte6;
}	PROTOCOLDATA;

typedef struct settingData
{
//	unit8_t mode_ctr_op;
	unit8_t mode_ctr_ct;
	unit8_t mode_heat;
	unit8_t	valve_count;
	unit8_t rc_count;
	unit8_t rc_valve[8];
	unit8_t room_length[8];
	unit8_t max_water;
	unit8_t subrc_lock;
} SETTINGDATA;

extern PROTOCOLDATA ptcData;
extern SETTINGDATA setData;

extern uint8_t	ptc_rc_status;
extern uint8_t	ptc_id_count;
extern uint8_t	ptc_page_count;

void ptc_baseSet();
void ptc_check(uint8_t * buf);
void ptc_make(uint8_t *buf);

#endif