#include "br_protocol.h"
#include "cnt_protocol.h"
#include "hn_protocol.h"

extern U485INFO	_ub;
extern uint8_t _is_shower;

#define KD_MAX_HEAT   	60
#define KD_MIN_HEAT   	30
#define KD_MAX_SHOWER   60
#define KD_MIN_SHOWER   30
#define BR_KD_WAIT			10		//	50ms - 10ms(timer out)
#define BR_KD_SEND		\
						_ub.ir = 17;\
						_ub.sendReady = 1;\
						_ub.sendCount = BR_KD_WAIT;

BRINFO_KD _kdInfo;
uint8_t kd_error_reset = 0;

void br_kd_makeChecksum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 1 ; i < 15 ; i++) {
		s += _ub.r[i];
	}
	_ub.r[15] = s;
}

uint8_t br_kd_check_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 1 ; i < 15 ; i++) {
		s += _ub.b[i];
	}
	
	if (s == _ub.b[15]) {
		return 1;
	}
	
	return 0;
}

uint8_t br_kd_baseCheck(void) {
	if (br_buf_count == 15) {
		br_buf_count = 0;
	}
	
	if(_ub.b[0] != 0x02) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	if(_ub.b[16] != 0x03) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	if(_ub.b[2] != 0x01) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	if(_ub.b[3] != 0x00) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	if (br_kd_check_checkSum() != 1) {
		br_error_checksum = 1;
		return 0;
	}
	
	br_error_checksum = 0;
	br_buf_error[br_buf_count++] = 0;
	
	ext_br_error = 1;  							// 2015.11.03 보일러 정상 패킷 체크
	
	return 1;
}

// 온도 값 * 2 형식 변경
uint8_t br_kd_temp_format_wd(uint8_t temp) {
	uint8_t real = 0;
	uint8_t add = 0;
	
	if (br_getHexToBin(temp, 7) == 1) {
		add = 1;
	}
	
	real = ((temp & 0x7F) * 2) + add; 
	return real;
}

// 경동 온도 형식 변경
uint8_t br_kd_temp_format_kd(uint8_t temp) {
	uint8_t real = 0;
	uint8_t add = 0;
	
	add = temp % 2;
	
	real = (temp / 2) | (add << 7); 
	return real;
}

uint8_t br_kd_isvalveOpen(void) {
	uint8_t i;
	uint8_t result;
	uint8_t led = funcInfo.rcLED | funcInfo.sub_rcLED;

	result = 0;
	for (i = 0 ; i < 8 ; i++) {
		if (br_getHexToBin(led, i) == 1) {
			result = 1;
			break;
		}
	}
	
	return result;
}

uint8_t br_kd_valveOpen_count(void) {
	uint8_t i;
	uint8_t result;
	uint8_t led = funcInfo.rcLED | funcInfo.sub_rcLED;

	result = 0;
	for (i = 0 ; i < 8 ; i++) {
		if (br_getHexToBin(led, i) == 1) {
			result += 1;
		}
	}
	
	return result;
}

uint8_t br_kd_make(void) {
	uint8_t led = funcInfo.rcLED | funcInfo.sub_rcLED;
	uint8_t setTemp;
	
	_ub.r[0] = 0x02;
	_ub.r[1] = 0x10;
	_ub.r[2] = 0x10;
	_ub.r[3] = 0x00;
	_ub.r[4] = 0x10;
	
	if (funcInfo.error_type == ERROR_TYPE_CNT) {
		_ub.r[5] = 0x01 | (br_kd_isvalveOpen() << 4);
		_ub.r[6] = 0x10;
	} else {
		_ub.r[5] = 0x00 | (br_kd_isvalveOpen() << 4);
		_ub.r[6] = 0x00;
	}
	
	_ub.r[7] = 0xFE;
	
	if ( hn_type == HN_TYPE_CLIO_KD ) {
		_ub.r[8] = hnInfo_clio.boiler_on_off;
		_ub.r[8] = _ub.r[8] | hnInfo_clio.boiler_mode_shower << 4;
		_ub.r[8] = _ub.r[8] | hnInfo_clio.boiler_warm_up << 5;
	} else {
		if (rcInfo.mode[0] == MODE_OUT) {
			_ub.r[8] = 0x01;
		} else {
			_ub.r[8] = 0x00;
		}
	}
	
	if (hn_type == HN_TYPE_CLIO_KD) {
		if (kd_error_reset == 1) {
			_ub.r[8] = _ub.r[8] | (0x01 << 1);
			kd_error_reset = 0;
		}
		
		_ub.r[8] = _ub.r[8] 
							| (br_kd_isvalveOpen() << 2) 
							| (0x01 << 3);	

	} else {
		_ub.r[8] = 0x01 
		           | (br_kd_isvalveOpen() << 2)
							 | (0x01 << 3)
							 | (_is_shower << 5);	
		
		if (kd_error_reset == 1) {
			_ub.r[8] = _ub.r[8] | (0x01 << 1);
			kd_error_reset = 0;
		}
	}
	
	_ub.r[9] = 0xFE;

	if (hn_type == HN_TYPE_CLIO_KD) {
		_ub.r[10] = hnInfo_clio.boiler_water_heat;
		_ub.r[11] = hnInfo_clio.boiler_water_shower;
	} else {
		setTemp = funcInfo.boiler_set_water_heat;
		
		if (setTemp < KD_MIN_HEAT) {
			setTemp = KD_MIN_HEAT;
		}
		
		if (setTemp > KD_MAX_HEAT) {
			setTemp = KD_MAX_HEAT;
		}
		
		_ub.r[10] = setTemp;
		
		setTemp = funcInfo.boiler_set_water_shower;
		
		if (setTemp < KD_MIN_SHOWER) {
			setTemp = KD_MIN_SHOWER;
		}
		
		if (setTemp > KD_MAX_SHOWER) {
			setTemp = KD_MAX_SHOWER;
		}
		_ub.r[11] = setTemp;
	}
	
	_ub.r[12] = funcInfo.valve + funcInfo2.valve;
	_ub.r[13] = br_kd_valveOpen_count();
	_ub.r[14] = 0xFE;
	_ub.r[16] = 0x03;
	br_kd_makeChecksum();
	
	BR_KD_SEND
}

void br_kd_error_reset(void) {
	kd_error_reset = 1;
}

void br_kd_ptc_check(void) {
	if(br_kd_baseCheck() == 0) {
		return;
	}
	
	br_type = BR_TYPE_KD;
	br_connect = 0;
	
	_kdInfo.func_water_cnt = br_getHexToBin(_ub.b[4], 0);
	_kdInfo.func_warm_up = br_getHexToBin(_ub.b[4], 1);
	_kdInfo.func_water_heat_cnt = br_getHexToBin(_ub.b[4], 2);
	_kdInfo.func_heat_mode = br_getHexToBin(_ub.b[4], 3);
	_kdInfo.func_water_shower_unit = br_getHexToBin(_ub.b[4], 4);
	_kdInfo.func_water_heat_unit = br_getHexToBin(_ub.b[4], 5);
	_kdInfo.func_heat_capacity = br_getHexToBin(_ub.b[4], 6);
	
	_kdInfo.water_heat_min =  br_kd_temp_format_wd(_ub.b[5]);
	_kdInfo.water_heat_max =  br_kd_temp_format_wd(_ub.b[6]);
	
	_kdInfo.water_shower_min =  br_kd_temp_format_wd(_ub.b[7]);
	_kdInfo.water_shower_max =  br_kd_temp_format_wd(_ub.b[8]);
	
	_kdInfo.boiler_state_error = br_getHexToBin(_ub.b[10], 0);
	_kdInfo.boiler_state_heat = br_getHexToBin(_ub.b[10], 1);
	_kdInfo.boiler_state_shower = br_getHexToBin(_ub.b[10], 2);
	_kdInfo.boiler_state_heat = br_getHexToBin(_ub.b[10], 3);
	_kdInfo.boiler_state_use_shower = br_getHexToBin(_ub.b[10], 5);
	_kdInfo.boiler_state_ice = br_getHexToBin(_ub.b[10], 6);
	_kdInfo.boiler_state_warm_up = br_getHexToBin(_ub.b[10], 7);
	
	_kdInfo.curr_water_heat = br_kd_temp_format_wd(_ub.b[11]);
	_kdInfo.curr_water_shower = br_kd_temp_format_wd(_ub.b[12]);
	
	_kdInfo.boiler_error = _ub.b[13];
	
	if (_kdInfo.boiler_state_error != 0) {
		func_cnt_error(ERROR_TYPE_BOILER, _kdInfo.boiler_error);
	} else {
		if (funcInfo.error_type == ERROR_TYPE_BOILER) {
			func_cnt_errorReset();
		}
	}
	
	br_kd_make();
}