#include "br_protocol.h"
#include "cnt_protocol.h"

extern uint8_t bData1_b;
extern uint8_t bData2_b;
extern uint8_t bData3_b;

extern uint8_t bData1_r;
extern uint8_t bData2_r;
extern uint8_t bData3_r;

extern U485INFO	_ub;
extern uint8_t _is_shower;

#define ERROR_RESET_COUNT  	2

#define BR_KR_WAIT		20		//	50ms - 10ms(timer out)
#define BR_KR_SEND		\
						_ub.ir = 6;\
						_ub.sendReady = 1;\
						_ub.sendCount = BR_KR_WAIT;

uint8_t kr_error_reset = 0;
uint8_t kr_error_reset_count = ERROR_RESET_COUNT;

extern uint8_t cnt_check_state;

uint8_t br_kr_check_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 4 ; i++) {
		s ^= _ub.b[i];
	}
	
	if (s == _ub.b[4]) {
		return 1;
	}
	
	return 0;
}

uint8_t br_kr_ptc_change_BCD(uint8_t val) {
	uint8_t a;
	uint8_t b;
	
	a = val / 10;
	b = val % 10;
	
	return (a << 4) | b;
}

uint8_t br_kr_ptc_change_BCDToHex(uint8_t val) {
	uint8_t a;
	uint8_t b;
	
	a = (val & 0xF0) >> 4;
	b = (val & 0x0F);
	
	return b + (a * 10);
}

uint8_t br_kr_ptc_baseCheck(void) {
	if (br_buf_count == 15) {
		br_buf_count = 0;
	}
	
	if(_ub.b[0] != 0x02) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	if(_ub.b[5] != 0x03) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	if (br_kr_check_checkSum() != 1) {
		br_error_checksum = 1;
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	br_error_checksum = 0;
	br_buf_error[br_buf_count++] = 0;
	
	ext_br_error = 1;  							// 2015.11.03 보일러 정상 패킷 체크
	return 1;
}
void br_kr_ptc_check(void) {
	if(br_kr_ptc_baseCheck() == 0) {
		return;
	}
	
	br_type = BR_TYPE_KR;
	br_connect = 0;
	
	bData1_r = _ub.b[1];
	bData2_r = _ub.b[2];
	bData3_r = _ub.b[3];
	
	if (_ub.b[3] != 0x00) {
		if (funcInfo.error_type == ERROR_TYPE_NONE) {
			func_cnt_error(ERROR_TYPE_BOILER, br_kr_ptc_change_BCDToHex(_ub.b[3]));
		}
	} else {
		if (funcInfo.error_type == ERROR_TYPE_BOILER) {
//			cnt_check_state = STATE_ERROR_RECOVER;
			func_cnt_errorReset();
		}
	}
}

void br_kr_ptc_check_clio(void) {
	if(br_kr_ptc_baseCheck() == 0) {
		return;
	}
	
	br_type = BR_TYPE_KR;
	br_connect = 0;
	
	bData1_r = _ub.b[1];
	bData2_r = _ub.b[2];
	bData3_r = _ub.b[3];
	
	if (_ub.b[3] != 0x00) {
		if (funcInfo.error_type == ERROR_TYPE_NONE) {
			func_cnt_error(ERROR_TYPE_BOILER, _ub.b[3]);
		}
	} else {
		if (funcInfo.error_type == ERROR_TYPE_BOILER) {
//			cnt_check_state = STATE_ERROR_RECOVER;
			func_cnt_errorReset();
		}
	}
}

void br_kr_make_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 4 ; i++) {
		s ^= _ub.r[i];
	}
	
	_ub.r[4] = s;
	
}

uint8_t br_kr_ptc_openValve(void) {
	uint8_t i = 0;
	uint8_t co = 0;
	uint8_t open = 0;
	open = funcInfo.rcLED | funcInfo.sub_rcLED;
	
	for (i = 0 ; i < 8 ; i++) {
		if (br_getHexToBin(open, i)) {
			co++;
		}
	}
	
	return co;
}



void br_kr_ptc_make(void) {
	uint8_t open;
	uint8_t val = 0;
	uint8_t set_water;
	uint8_t set_heat;
	
	open = br_kr_ptc_openValve();
	
	if (open == 1) {
		val = 0x24;
	} else if (open == 2 || open == 3) {
		val = 0x14;
	} else if (open >= 4) {
		val = 0x0C;
	} else {
		val = 0x00;
	}
	
	/*
	val = 0x08;
	
	if (open != 0) {
		val = 0x0C;
	}
	*/
	
	_ub.r[0] = 0x02;
	
	if (kr_error_reset == 1) {
		if (kr_error_reset_count == 0) {
			kr_error_reset = 0;
			kr_error_reset_count = ERROR_RESET_COUNT;
		} else {
			kr_error_reset_count--;
			_ub.r[1] = 	0x00;
		}
	} else {
		_ub.r[1] = 	0x80;
	}
	
	_ub.r[1] |= (_is_shower == 1 ? 0x40 : 0x00);
	_ub.r[1] |=	val;
	if( val == 0 )
	{
		_ub.r[1] &= 0x7f;
		if( _is_shower == 1 )
			_ub.r[1] |= 0x80;
	}
	set_heat = funcInfo.boiler_set_water_heat;
	
	if (set_heat < 45) {
		set_heat = 45;
	}
	
	if (set_heat > 85) {
		set_heat = 85;
	}
	
	_ub.r[2] = br_kr_ptc_change_BCD(set_heat);       // 40~80 이나 귀뚜라미는 45~85 임
	
	set_water = funcInfo.boiler_set_water_shower;	// 40~70 이나 귀뚜라미는 35~60 임
	
	if (set_water < 35) {
		set_water = 35;
	}
	//	2016.3.29 ignore max for Gumi
	/*
	if (set_water > 60) {
		set_water = 60;
	}
	*/
	_ub.r[3] = br_kr_ptc_change_BCD(set_water);				
	br_kr_make_checkSum();
	_ub.r[5] = 0x03;
	
	BR_KR_SEND
}

void br_kr_error_reset(void) {
	kr_error_reset = 1;
}

void br_kr_ptc_make_clio(void) {
	uint8_t open;
	uint8_t val = 0;
	open = br_kr_ptc_openValve();
	
	if (open == 1) {
		val = 0x24;
	} else if (open == 2 || open == 3) {
		val = 0x14;
	} else if (open >= 4) {
		val = 0x0C;
	} else {
		val = 0x00;
	}
	
	_ub.r[0] = 0x02;
	_ub.r[1] = (bData1_b & 0xC3) | val;
	_ub.r[2] = bData2_b;
	_ub.r[3] = bData3_b;
	br_kr_make_checkSum();
	_ub.r[5] = 0x03;
	
	BR_KR_SEND
}

void br_kr_ptc_close_clio(void) {
	bData1_b = 0x80;
}

void br_kr_ptc_open_clio(void) {
	bData1_b = bData1_b | 0x0C;
}

