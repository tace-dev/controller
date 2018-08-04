/*
 *
 *	CNV
 *
 */
#include "stdafx.h"

typedef struct tagProtocolData
{
	uint8_t	id;
	uint8_t	op_mode;
	uint8_t	time_reserve;
	uint8_t	op;
	uint8_t	cur_tmp;
	uint8_t	set_tmp;
	uint8_t	tmp_diff;
	uint8_t	byte4;
	uint8_t	byte5;
	uint8_t	byte6;
}	PROTOCOLDATA;

typedef struct tagSettingData
{
	uint8_t	mode_ctr_op;
	uint8_t	mode_ctr_ct;
	uint8_t	mode_heat;
	uint8_t	valve_count;
	uint8_t	rc_count;
	uint8_t	rc_valve[8];
	uint8_t	room_length[8];
	uint8_t	max_water;
	uint8_t	subrc_lock;
}	SETTINGDATA;

PROTOCOLDATA ptcData;
SETTINGDATA setData;

uint8_t	ptc_rc_status;
uint8_t	ptc_id_count;
uint8_t	ptc_page_count;

#define	BYTE3_0 0xE0
#define	BYTE4_0 0x11
#define	BYTE5_0 0x30
#define	BYTE6_0 0x45

#define	BYTE3_1 0x06
#define	BYTE4_1 0xC8
#define	BYTE5_1 0x00
#define	BYTE6_1 0X00

#define	BYTE3_2 0x00
#define	BYTE4_2 0x00
#define	BYTE5_2 0x01
#define	BYTE6_2 0x01

#define	BYTE3_3 0x02
#define	BYTE4_3 0x02
#define	BYTE5_3 0x03
#define	BYTE6_3 0x03

#define	BYTE3_4 0x04
#define	BYTE4_4 0x04
#define	BYTE5_4 0x05
#define	BYTE6_4 0x05

#define	BYTE3_5 0x06
#define	BYTE4_5 0x06
#define	BYTE5_5 0x07
#define	BYTE6_5 0x07

void ptc_baseSet(void)
{
	uint8_t i;
	uint8_t j;
	uint8_t	dip;
	uint8_t	valve;
	
	dip = BYTE3_0;
	valve = (BYTE3_0 & 0xE0) >> 5;
	
	setData.valve_count =  valve == 0 ? 0 : valve + 1;
	setData.mode_ctr_ct = dip & 0x18 >> 3;
	setData.mode_heat = dip & 0x04 >> 2;
	setData.mode_ctr_op = dip & 0x03;
	setData.rc_count = BYTE3_1;
	
	setData.rc_valve[0] = BYTE3_2 << 4 | BYTE4_2;
	setData.rc_valve[1] = BYTE5_2 << 4 | BYTE6_2;
	setData.rc_valve[2] = BYTE3_3 << 4 | BYTE4_3;
	setData.rc_valve[3] = BYTE5_3 << 4 | BYTE6_3;
	setData.rc_valve[4] = BYTE3_4 << 4 | BYTE4_4;
	setData.rc_valve[5] = BYTE5_4 << 4 | BYTE6_4;
	setData.rc_valve[6] = BYTE3_5 << 4 | BYTE4_5;
	setData.rc_valve[7] = BYTE5_5 << 4 | BYTE6_5;
			
	for (i = 0 ; i < 8 ; i++)
	{
		setData.room_length[i] = 0x64;
	}
	
	setData.max_water = BYTE4_1;
	setData.subrc_lock = 0x00;
}

void ptc_check(uint8_t * buf)
{
	uint8_t	disp[8];
	uint8_t temp;
	uint8_t tempBit;
	uint8_t	id;
	
	swuart_Write(buf, 8);
	id = buf[0] & 0x0F;
	
	if (id == 0) {
		return;
	}
	
	ptcData.id = id;
	ptcData.op_mode = (buf[0] & 0x70) >> 4;
	ptcData.time_reserve = buf[1] & 0x3F;
	ptcData.op = (buf[1] & 0x80) >> 7;

	temp = (buf[2] & 0x80) >> 7;
	ptcData.cur_tmp = (buf[2] & 0x7F) * 2 + temp;
	ptcData.set_tmp = buf[3];
	ptcData.byte4 = buf[4];
	ptcData.byte5 = buf[5];
	ptcData.byte6 = buf[6];
	ptcData.tmp_diff = 100 + ptcData.set_tmp - ptcData.cur_tmp;
	
	disp[0] = 'I';
	disp[1] = 'D';
	disp[2] = ptcData.id + '0';
	disp[3] = (ptcData.set_tmp > ptcData.cur_tmp) ? '+' : '-';
	
	swuart_Write(disp, 4);
	swuart_Write("\r\n", 2);
	
	tempBit = ptc_rc_status & ~(0x01 << ( ptcData.id - 1));
	tempBit |= 0x01 << ( ptcData.id - 1);
	ptc_rc_status = tempBit;
}

void ptc_make(uint8_t * buf)
{
	uint8_t i;
	uint8_t s;
 
 /*
 buf[0] = 0xff;
 buf[1] = 0xff;
 buf[2] = 0x00;
 buf[3] = 0x00;
 buf[4] = 0xff;
 buf[5] = 0xff;
 buf[6] = 0x00;
 buf[7] = 0x0;
 return;
 */
 
 //ptc_id_count = 4;
	switch(ptc_id_count){
		case 0 :
		case 1 :
		case 2 :
		case 3 :
		case 4 :
		case 5 :
		case 6 :
			buf[0] = ptc_id_count;
			buf[2] = ptc_rc_status;
			break;
		case 7 :
		case 8 :
			buf[0] = ptc_id_count + 2;
			buf[2] = 0;
			break;
		case 9 :
			buf[0] = ptc_id_count + 2;
			buf[2] = ptc_rc_status;
			break;
	}
	
	buf[1] = ptc_page_count;
	switch(ptc_page_count){
		case 0 :
			buf[3] = BYTE3_0;
			buf[4] = BYTE4_0;
			buf[5] = BYTE5_0;
			buf[6] = BYTE6_0;
			break;
		case 1 :
			buf[3] = BYTE3_1;
			buf[4] = BYTE4_1;
			buf[5] = BYTE5_1;
			buf[6] = BYTE6_1;
			break;
		case 2 :
			buf[3] = BYTE3_2;
			buf[4] = BYTE4_2;
			buf[5] = BYTE5_2;
			buf[6] = BYTE6_2;
			break;
		case 3 :
			buf[3] = BYTE3_3;
			buf[4] = BYTE4_3;
			buf[5] = BYTE5_3;
			buf[6] = BYTE6_3;
			break;
		case 4 :
			buf[3] = BYTE3_4;
			buf[4] = BYTE4_4;
			buf[5] = BYTE5_4;
			buf[6] = BYTE6_4;
			break;
		case 5 :
			buf[3] = BYTE3_5;
			buf[4] = BYTE4_5;
			buf[5] = BYTE5_5;
			buf[6] = BYTE6_5;
			break;
	}
	
	s = 0;
	//DISP("\r\n>", 3);
	for (i = 0 ; i < 7 ; i++) 
	{
		//disp_char(buf[i]);
		s += buf[i];
	}
	//DISP("<", 1);
	
	buf[7] = s;
	
	ptc_id_count++;
	ptc_page_count++;
	
	if (ptc_id_count == 10) 
		ptc_id_count = 0;
	
	if (ptc_page_count == 6) 
		ptc_page_count = 0;
}

uint8_t	ptc_ctr_count = 0;

void ptc_ctr_resp(uint8_t * buf)
{
	uint8_t i;
	uint8_t s;
	
	buf[1] = 0x00;
	buf[2] = 0x01;
	switch(ptc_ctr_count){
	case 0 : 
		buf[0] = 0xB0;
		buf[3] = 0x20;
		buf[4] = 0x1E;
		buf[5] = 0x1E;
		buf[6] = 0x1E;
		break;
	case 1 : 
		buf[0] = 0xC0;
		buf[3] = 0x20;
		buf[4] = 0x20;
		buf[5] = 0x20;
		buf[6] = 0x20;
		break;
	case 2 : 
		buf[0] = 0xD0;
		buf[3] = 0x64;
		buf[4] = 0x64;
		buf[5] = 0x64;
		buf[6] = 0x64;
		break;
	case 3 : 
		buf[0] = 0xE0;
		buf[3] = 0x64;
		buf[4] = 0x64;
		buf[5] = 0x64;
		buf[6] = 0x64;
		break;
	}
	
	s = 0;
	for (i = 0 ; i < 7 ; i++) 
		s += buf[i];
	
	buf[7] = s;
	
	ptc_ctr_count++;
	if (ptc_ctr_count == 4)
		ptc_ctr_count = 0;
}

uint8_t	ptc_getid(void)
{
	return ptc_id_count;
}

