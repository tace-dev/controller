#include "stdafx.h"
#include "hn_protocol.h"
#include "function.h"
#include "cnt_protocol.h"
#include "br_protocol.h"

#define CHANGE_TEMP(x)		(hn_ptc_16To10(x) * 2)
#define CLIO_WAIT		5		//	50ms - 10ms(timer out)
#define CLIO_SEND		\
						_ua.ir = 26;\
						_ua.sendReady = 1;\
						_ua.sendCount = CLIO_WAIT;
						
#define CLIO_SEND_KD		\
						_ua.ir = 15;\
						_ua.sendReady = 1;\
						_ua.sendCount = CLIO_WAIT;
						
extern uint8_t msg_hn;
extern U485INFO	_ua;
extern uint8_t	packet_buf[];

HNINFO_CLIO hnInfo_clio;

uint8_t bData1_b;
uint8_t bData2_b;
uint8_t bData3_b;

uint8_t bData1_r;
uint8_t bData2_r;
uint8_t bData3_r;

void hn_clio_make_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 24 ; i++) {
		s ^= _ua.r[i];
	}
	
	_ua.r[24] = s;
}

void hn_clio_ptc_make(void) {
	uint8_t i;
		
	for (i = 0 ; i < 26 ; i++) {
		switch (i) {
			case 1:
				_ua.r[i] = 0x10;
				break;
			case 4:
				_ua.r[i] = 0x00;
				
				if (funcInfo.error_type == ERROR_TYPE_BOILER) {
					_ua.r[i] = funcInfo.error + 70;
				} else if (funcInfo.error_type == ERROR_TYPE_CNT) {
					_ua.r[i] = funcInfo.error;
				}
				break;
			case 21:
				_ua.r[i] = bData1_r;
				break;
			case 22:
				_ua.r[i] = bData2_r;
				break;
			case 23:
				_ua.r[i] = bData3_r;
				break;
			case 24:
				hn_clio_make_checkSum();
				break;
			default:
				_ua.r[i] = _ua.b[i];
				break;
		}
	}
	
	CLIO_SEND
}

//----------------------------------------------------

uint8_t hn_clio_check_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 24 ; i++) {
		s ^= _ua.b[i];
	}
	
	if (s == _ua.b[24]) {
		return 1;
	}
	
	return 0;
}

void hn_clio_ptc_check_rc(void) {
	uint8_t i;
	uint8_t isOp;
	uint8_t mode;
	uint8_t op;
	uint8_t currt;
	uint8_t setupt;
	uint8_t opv;
	
	mode = _ua.b[3];
	op = _ua.b[4];
	
	opv = 0;
	for (i = 0 ; i < 8 ; i++) {
		isOp = getHexToBin(op, i);
		if (isOp == 1) {
			opv = 1;
		}
		
		if (_ua.b[5 + i + 8] == 0x00) {
			currt = 0x00;
		} else {
			currt = CHANGE_TEMP(_ua.b[5 + i + 8]);
		}
		
		if (_ua.b[5 + i] == 0x00) {
			setupt = 0x00;
		} else {
			if (isOp == 1) {
				setupt = CHANGE_TEMP(_ua.b[5 + i]);
			} else {
				setupt = 0x00;
			}
		}
		
		packet_buf[i] = 0;
		
		func_cnt_calcInfo(i + 1, 
											((isOp == 1) ? MODE_HOT : MODE_STOP), 
											0x30, 
											((isOp == 1) ? 0x40 : 0x10));
											
		rcInfo.mode[i] = (isOp == 1) ? MODE_HOT : MODE_STOP;
		rcInfo.curr_temp[i] = 0x30;
		rcInfo.setup_temp[i] = ((isOp == 1) ? 0x40 : 0x10);
	}
	
	bData1_b = opv == 1 ? (_ua.b[21] | 0x0C) : _ua.b[21];
	bData2_b = _ua.b[22];
	bData3_b = _ua.b[23];
	
	if (funcInfo.error_type != ERROR_TYPE_NONE) {
		if (_ua.b[21] == 0x00) {
			//bData1_b = _ua.b[21] | (0x01 << 6);
			func_cnt_errorReset();
		}
	}
	
	hn_clio_ptc_make();
}

void hn_clio_ptc_check(void) {	
	if (hn_buf_count == 15) {
		hn_buf_count = 0;
	}
	
	if (_ua.b[0] != 0x7E) {
		hn_buf_error[hn_buf_count++] = 1;
		return;
	}
	
	if (_ua.b[25] != 0xAA) {
		hn_buf_error[hn_buf_count++] = 1;
		return;
	}
	
	if (hn_clio_check_checkSum() != 1) {
		hn_error_checksum = 1;
		hn_buf_error[hn_buf_count++] = 1;
		return;
	}
	
	hn_error_checksum = 0;
	hn_type = HN_TYPE_CLIO;
	hn_connect = 0;
	hn_buf_error[hn_buf_count++] = 0;
	
	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크
	
	hn_clio_ptc_check_rc();
}

//-----------------------------------------------------------------------------
void hn_clio_make_checkSum_KD(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 13 ; i++) {
		s ^= _ua.r[i];
	}
	
	_ua.r[13] = s;
}

// 우당 형태의 값에서 다시 Clio 형태로 변경
uint8_t hn_clio_temp_format_KD(uint8_t temp) {	
	return temp / 2;
}

void hn_clio_ptc_make_KD(void) {
	uint8_t i = 0;
	
	_ua.r[0] = 0x77;
	_ua.r[1] = 0x18;
	_ua.r[2] = 0x43;
	_ua.r[3] = 0x00;
	_ua.r[3] = _kdInfo.boiler_state_error 
						| ((_kdInfo.boiler_state_heat == 1) ? 0 : _kdInfo.boiler_state_shower << 1) 
						| _kdInfo.boiler_state_heat << 2
						| _kdInfo.boiler_state_use_shower << 5;
	
	if (funcInfo.error_type == ERROR_TYPE_BOILER && funcInfo.error != 0) {
		_ua.r[4] = funcInfo.error + 70;
	} else if (funcInfo.error_type == ERROR_TYPE_CNT && funcInfo.error != 0) {
		_ua.r[4] = funcInfo.error;
	} else {
		_ua.r[4] = funcInfo.error;
	}
		
	_ua.r[5] = hn_clio_temp_format_KD(_kdInfo.curr_water_heat);
	
	for (i = 6 ; i < 13 ; i++) {
		_ua.r[i] = 0x00;
	}
	/*
	_ua.r[6] = hn_clio_temp_format_KD(_kdInfo.curr_water_shower);
	_ua.r[7] = 0x00;  // 난방 기능 옵션
	_ua.r[8] = hn_clio_temp_format_KD(_kdInfo.water_heat_max);
	_ua.r[9] = hn_clio_temp_format_KD(_kdInfo.water_heat_min);
	_ua.r[10] = hn_clio_temp_format_KD(_kdInfo.water_shower_max);
	_ua.r[11] = hn_clio_temp_format_KD(_kdInfo.water_shower_min);
	_ua.r[12] = 0xFF;
	*/
	_ua.r[14] = 0xE7;
	
	hn_clio_make_checkSum_KD();
	
	CLIO_SEND_KD
}

uint8_t hn_clio_check_checkSum_KD(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 13 ; i++) {
		s ^= _ua.b[i];
	}
	
	if (s == _ua.b[13]) {
		return 1;
	}
	
	return 0;
}

void hn_clio_ptc_check_rc_KD(void) {
	uint8_t open = 0;
	uint8_t i;
	uint8_t isOp;
	
	open = _ua.b[2];
	
	hnInfo_clio.boiler_on_off = (_ua.b[3] & 0x01);
	hnInfo_clio.boiler_mode_shower = (_ua.b[3] & 0x10) >> 4;
	hnInfo_clio.boiler_warm_up = (_ua.b[3] & 0x20) >> 5;
	hnInfo_clio.boiler_water_heat = _ua.b[4];
	hnInfo_clio.boiler_water_shower = _ua.b[5];
	
	for (i = 0 ; i < 8 ; i++) {
		packet_buf[i] = 0;
		isOp = getHexToBin(open, i);
		if (hnInfo_clio.boiler_on_off == 0) {
			isOp = 0;
		}
		
		func_cnt_calcInfo(i + 1, 
											((isOp == 1) ? MODE_HOT : MODE_STOP), 
											0x30, 
											((isOp == 1) ? 0x40 : 0x10));
											
		rcInfo.mode[i] = (isOp == 1) ? MODE_HOT : MODE_STOP;
		rcInfo.curr_temp[i] = 0x30;
		rcInfo.setup_temp[i] = ((isOp == 1) ? 0x40 : 0x10);
	}
	
	if (hnInfo_clio.boiler_on_off == 0) {
		if (funcInfo.error_type != 0) {
				func_cnt_errorReset();
		}
	}
	
	hn_clio_ptc_make_KD();
}

void hn_clio_ptc_check_KD(void) {	
	if (hn_buf_count == 15) {
		hn_buf_count = 0;
	}
	
	if (_ua.b[0] != 0x77) {
		hn_buf_error[hn_buf_count++] = 1;
		return;
	}
	
	if (_ua.b[14] != 0xE7) {
		hn_buf_error[hn_buf_count++] = 1;
		return;
	}
	
	if (_ua.b[1] != 0x81) {
		hn_buf_error[hn_buf_count++] = 1;
		return;
	}
	
	if (hn_clio_check_checkSum_KD() != 1) {
		hn_error_checksum = 1;
		hn_buf_error[hn_buf_count++] = 1;
		return;
	}
	
	hn_error_checksum = 0;
	hn_type = HN_TYPE_CLIO_KD;
	hn_connect = 0;
	hn_buf_error[hn_buf_count++] = 0;
	
	hn_clio_ptc_check_rc_KD();
}