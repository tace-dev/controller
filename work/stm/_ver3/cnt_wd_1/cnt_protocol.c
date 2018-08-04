#include "stdafx.h"
#include "cnt_protocol.h"
#include "br_protocol.h"
#include "hn_protocol.h"
#include "function.h"

#define 	BYTE_START_CNT_NORMAL 			0x70
#define 	BYTE_START_SUB_CNT_NORMAL 	0x90
#define 	BYTE_START_CNT_SETTING 			0x30					
#define 	BYTE_START_CNT_MIRROR 			0x20

#define 	BYTE_START_RC_NORMAL 				0xF0
#define 	BYTE_START_RC_MIRROR 				0x40
#define 	BYTE_START_RC_SETTING 			0x50
#define 	BYTE_START_RC_SUBRC 				0x60
#define 	BYTE_START_RC_ERROR 				0xE0

#define		COMMAND_MODE_MIRROR					0x01
#define		COMMAND_MODE_HOTWATER				0x02
#define		COMMAND_MODE_RESET					0x04
#define		COMMAND_MODE_FACTORY				0x08

#define	  MAX_MIRROR_PAGE							0x02

uint8_t cnt_ptc_id_count;
uint8_t cnt_check_state;
uint8_t curr_setting_page;
uint8_t curr_mirror_page;
uint8_t curr_subCnt_page;
uint8_t mirror_type;
uint8_t ptc_sub_control = 0;

FUNCINFO funcInfo;
FUNCINFO funcInfo2;
RCINFO rcInfo;
HNCNT hnCnt;
HNCNT hnCnts[8];

uint8_t msg_hn;
uint8_t msg_hn_more;
uint8_t __mode_shower[8];
uint8_t _is_shower;

extern uint8_t	packet_buf[];

void cnt_ptc_baseSet(void) {
	cnt_ptc_id_count = 1;
	cnt_check_state = STATE_NORMAL;
	
	if (funcInfo.cnt == 0) {
		funcInfo.cnt = 8;
	}
}

void makeChecksum(uint8_t *buf) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 7 ; i++) {
		s += buf[i];
	}
	buf[7] = s;
}

// 설정 중일때
void cnt_ptc_make_setting(uint8_t *buf) {
	buf[0] = BYTE_START_CNT_SETTING | curr_setting_page;
	buf[1] = 0x00;
	buf[2] = funcInfo.boiler_water_shower;
	buf[3] = funcInfo.boiler_water_heat;
	buf[4] = (funcInfo.error << 2) | funcInfo.boiler_state;
	buf[5] = funcInfo.error;
	buf[6] = funcInfo.version << 1 | 
					 funcInfo.subrcLock;
	
	makeChecksum(buf);
}

// mirror 제어기 설정 
void cnt_ptc_make_mirror(uint8_t *buf) {
	buf[0] = BYTE_START_CNT_MIRROR | curr_mirror_page;
	switch (curr_mirror_page) {
		case 0:
			buf[1] = ((funcInfo.boiler_type& 0x01) << 7) | funcInfo.lpmType;
			buf[2] = ((funcInfo.relay & 0x01) << 7) | (funcInfo.cnt & 0x07) << 4 | funcInfo.valve;
			buf[3] = funcInfo.boiler_water_shower;
			buf[4] = funcInfo.houseCapa;
			buf[5] = funcInfo.boiler_water_heat;
			buf[6] = 	0x00 << 7 
								| (funcInfo.subrcLock << 6) 
								| (funcInfo.poType << 4) 
								| (funcInfo.cntlMode << 3) 
								| funcInfo.opMode;
		break;
		case 1:
			buf[1] = 0x00 << 7 
							 | (funcInfo.valve_rc[0] << 4) 
							 | 0x00 << 3 
							 | funcInfo.valve_rc[1];
			buf[2] = 0x00 << 7 
							 | (funcInfo.valve_rc[2] << 4) 
							 | 0x00 << 3 
							 | funcInfo.valve_rc[3];
			buf[3] = funcInfo.valve_len[0];
			buf[4] = funcInfo.valve_len[1];
			buf[5] = funcInfo.valve_len[2];
			buf[6] = funcInfo.valve_len[3];
		break;
		case 2:
			buf[1] = 0x00 << 7 
							 | (funcInfo.valve_rc[4] << 4) 
							 | 0x00 << 3 
							 | funcInfo.valve_rc[5];
			buf[2] = 0x00 << 7 
							 | (funcInfo.valve_rc[6] << 4) 
							 | 0x00 << 3 
							 | funcInfo.valve_rc[7];
			buf[3] = funcInfo.valve_len[4];
			buf[4] = funcInfo.valve_len[5];
			buf[5] = funcInfo.valve_len[6];
			buf[6] = funcInfo.valve_len[7];
		break;
	}
	
	makeChecksum(buf);
}

// mirror sub제어기 설정
void cnt_ptc_make_mirror_sub(uint8_t *buf) {
	buf[0] = BYTE_START_CNT_SETTING | curr_mirror_page;
	switch (curr_mirror_page) {
		case 0:
			buf[1] = ((funcInfo2.boiler_type & 0x01) << 7) | funcInfo2.lpmType;
			buf[2] = ((funcInfo2.relay & 0x01) << 7) | funcInfo2.cnt << 4 | funcInfo2.valve;
			buf[3] = funcInfo2.boiler_water_shower;
			buf[4] = funcInfo2.houseCapa;
			buf[5] = funcInfo2.boiler_water_heat;
			buf[6] = 	0x01 << 7 
								| (funcInfo2.subrcLock << 6) 
								| (funcInfo2.poType << 4) 
								| (funcInfo2.cntlMode << 3) 
								| funcInfo2.opMode;
		break;
		case 1:
			buf[1] = 0x01 << 7 
							 | (funcInfo2.valve_rc[0] << 4) 
							 | 0x01 << 3 
							 | funcInfo2.valve_rc[1];
			buf[2] = 0x01 << 7 
							 | (funcInfo2.valve_rc[2] << 4) 
							 | 0x01 << 3 
							 | funcInfo2.valve_rc[3];
			buf[3] = funcInfo2.valve_len[0];
			buf[4] = funcInfo2.valve_len[1];
			buf[5] = funcInfo2.valve_len[2];
			buf[6] = funcInfo2.valve_len[3];
		break;
		case 2:
			buf[1] = 0x01 << 7 
							 | (funcInfo2.valve_rc[4] << 4) 
							 | 0x01 << 3 
							 | funcInfo2.valve_rc[5];
			buf[2] = 0x01 << 7 
							 | (funcInfo2.valve_rc[6] << 4) 
							 | 0x01 << 3 
							 | funcInfo2.valve_rc[7];
			buf[3] = funcInfo2.valve_len[4];
			buf[4] = funcInfo2.valve_len[5];
			buf[5] = funcInfo2.valve_len[6];
			buf[6] = funcInfo2.valve_len[7];
		break;
	}
	
	makeChecksum(buf);
}

uint8_t cnt_getErrorCount(uint8_t *buf) {
	uint8_t count = 0x00;
	uint8_t i;
	
	for (i = 0 ; i < 15 ; i++) {
		if (buf[i] == 0) {
			count++;
		}
	}
	
	return count;
}
// 평상시
void cnt_ptc_make_normal(uint8_t *buf) {
	uint8_t rc_total_count;
	uint8_t i;
	
	rc_total_count = 0;
	
	buf[0] = BYTE_START_CNT_NORMAL | cnt_ptc_id_count;
	
	if (cnt_ptc_id_count != 0x09) {
		buf[1] = funcInfo.rcLED | funcInfo.sub_rcLED;
		buf[2] = funcInfo.boiler_water_shower;
		buf[3] = funcInfo.boiler_water_heat;
		buf[4] = 0x00;
		
		if (msg_hn == 1) {
			buf[1] = 0x10 | hnCnt.id;
			buf[2] = hnCnt.mode;
			buf[3] = hnCnt.setup_temp;
			buf[4] = hnCnt.comm << 7;
		} else {
			buf[4] = (funcInfo.cntlMode & 0x01) << 7;
		}
		
		buf[4] |= ((funcInfo.error_type & 0x03) << 2) | funcInfo.boiler_state;
		buf[5] = funcInfo.error;
		buf[6] = msg_hn << 7 | 
						 funcInfo.version << 1 | 
						 funcInfo.subrcLock;
		
	} else {
		if (br_type == BR_TYPE_NONE) {
			if (br_error_checksum == 1) {
				buf[1] = 0x0E;
			} else {
				buf[1] = 0x0F;
			}
		} else if (br_type == BR_TYPE_KR) {
			buf[1] = 0x10 | cnt_getErrorCount(br_buf_error);
		} else if (br_type == BR_TYPE_KD){
			buf[1] = 0x20 | cnt_getErrorCount(br_buf_error);
		} else if (br_type == BR_TYPE_RN) {
			buf[1] = 0x30 | cnt_getErrorCount(br_buf_error);
		} else if (br_type == BR_TYPE_DW) {
			buf[1] = 0x30 | cnt_getErrorCount(br_buf_error);
		}
		
		if (hn_type == HN_TYPE_NONE) {
			if (hn_error_checksum == 1) {
				buf[2] = 0x0E;
			} else {
				buf[2] = 0x0F;
			}
		} else if (hn_type == HN_TYPE_COMMAX){
			buf[2] = 0x10 | cnt_getErrorCount(hn_buf_error);
		} else if (hn_type == HN_TYPE_CLIO) {
			buf[2] = 0x20 | cnt_getErrorCount(hn_buf_error);
		} else if (hn_type == HN_TYPE_CLIO_KD) {
			buf[2] = 0x30 | cnt_getErrorCount(hn_buf_error);
		} else if (hn_type == HN_TYPE_KOCOM) {
			buf[2] = 0x40 | cnt_getErrorCount(hn_buf_error);
		} else if (hn_type == HN_TYPE_HYUNDAI) {
			buf[2] = 0x50 | cnt_getErrorCount(hn_buf_error);
		} else if (hn_type == HN_TYPE_SEOUL) {
			buf[2] = 0x60 | cnt_getErrorCount(hn_buf_error);
		}
		
		buf[3] = 0x00;
		buf[4] = 0x00;
		buf[5] = 0x00;
		buf[6] = 0x00;
		
		if (hn_type == HN_TYPE_CLIO || hn_type == HN_TYPE_CLIO_KD) {
			buf[5] = 0x01;
			
			for (i = 0 ; i < 8 ; i++) {
				if (rcInfo.mode[i] != MODE_STOP) {
					buf[6] |= (0x01 << i);
				}
			}
		}
	}
	
	makeChecksum(buf);
	
	cnt_ptc_id_count++;
	
	rc_total_count = funcInfo.cnt + funcInfo2.cnt;
	
	if (cnt_ptc_id_count == rc_total_count + 1) {
		cnt_ptc_id_count = 0x09;
	}
	
	if (cnt_ptc_id_count == 0x0A) {
		cnt_ptc_id_count = 1;
	}
}

void cnt_ptc_make(uint8_t *buf) {	
	switch (cnt_check_state) {
		case STATE_SUBRC:
		case STATE_COMMAND_HOTWATER:
		case STATE_COMMAND_RESET:
		case STATE_COMMAND_FACTORY:
		case STATE_ERROR_RECOVER:
		case STATE_ERROR:
		case STATE_NORMAL:
			cnt_ptc_make_normal(buf);
			break;
		case STATE_COMMAND_MIRROR:
		
			if (mirror_type == 0x01){
				cnt_ptc_make_mirror(buf);
			} else if (mirror_type == 0x02){
				cnt_ptc_make_mirror_sub(buf);
			} else {
				cnt_ptc_make_normal(buf);
			}
			
			break;
		case STATE_SETTING:
			cnt_ptc_make_setting(buf);
			break;
		default:
			break;
	}
}
//--------------------------------------------------------//

// 룸콘 이 command를 보낼때
void cnt_ptc_check_normal_command(uint8_t *buf) {
	uint8_t mode;
	
	mode = buf[2];
	switch (mode) {
		case COMMAND_MODE_MIRROR:
			func_cnt_mirror(buf[3]);
			cnt_check_state = STATE_COMMAND_MIRROR;
			break;
		case COMMAND_MODE_HOTWATER:
			func_cnt_hotwater(buf[3]);
			cnt_check_state = STATE_COMMAND_HOTWATER;
			break;
		case COMMAND_MODE_RESET:
			func_cnt_reset(buf[3]);
			cnt_check_state = STATE_COMMAND_RESET;
			break;
		case COMMAND_MODE_FACTORY:
			func_cnt_factory(buf[3]);
			cnt_check_state = STATE_COMMAND_FACTORY;
			break;
		default:
			cnt_check_state = STATE_NORMAL;
			break;
	}
}

// 홈넷에서온 명령 응답 유무 처리
void cnt_ptc_check_homenet(uint8_t *buf) {
	uint8_t id;
	uint8_t mode;
	uint8_t i;
	uint8_t isChange;
	
	id = buf[0] & 0x0F;
	mode = buf[1];
	if (msg_hn == 1) {
		if (hnCnt.id != id) {
			return;
		}
		
		if (hnCnt.mode != mode) {
			return;
		}
		
		if (mode != MODE_OUT && mode != MODE_STOP) {
			if (hnCnt.setup_temp != 0xFF) {
				if (hnCnt.setup_temp != buf[3]) {
					return;
				}
			}
		}
		
		// 변경사항이 더 있을 경우
		if (msg_hn_more == 1) {
			isChange = 0;
			
			for (i = 0 ; i < 8 ; i++) {
				if (hnCnts[i].isChange == 1) {
					hnCnt.id = hnCnts[i].id;
					hnCnt.comm = hnCnts[i].comm;
					hnCnt.mode = hnCnts[i].mode;
					hnCnt.setup_temp = hnCnts[i].setup_temp;
					hnCnts[i].isChange = 0;
					isChange = 1;
					break;
				}
			}
			
			if (isChange == 0) {
				msg_hn_more = 0;
				msg_hn = 0;
			}
		} else {
			msg_hn = 0;
		}
	}
}

//온수 모드 검사
void cnt_ptc_check_shower(void) {
	uint8_t i;
	uint8_t checker = 0;
	uint8_t temp = 0;
	
	for (i = 0 ; i < 8 ; i++) {
		if (__mode_shower[i] != 0) {
			checker = 1;
			if (temp < __mode_shower[i]) {
				temp = __mode_shower[i];
			}
		}
	}
	
	_is_shower = checker;
	funcInfo.boiler_set_water_shower = temp;
}

// 룸콘의 일반적인 응답
void cnt_ptc_check_normal(uint8_t *buf) {
	uint8_t id;
	uint8_t mode;
	
	id = buf[0] & 0x0F;
	mode = buf[1];
	packet_buf[id - 1] = 0; 
	
	switch (mode) {
		case MODE_HOT:
		case MODE_OUT:
		case MODE_STOP:
		case MODE_RESERVE:
		case MODE_REPEAT:
			func_cnt_calcInfo(id, mode, buf[2], buf[3]);
			cnt_check_state = STATE_NORMAL;
			
#if defined (_VERSION2)			
			//__mode_shower[id - 1] = buf[6];    //온수 수집
			
			if ((id - 1) == 0) {
				_is_shower = (buf[6] & 0x01);
				funcInfo.boiler_set_water_shower = (buf[6] >> 1);
				funcInfo.boiler_set_water_heat = buf[4];
			}
		
			//cnt_ptc_check_shower();
#endif
			break;
		case MODE_COMMAND:
			cnt_ptc_check_normal_command(buf);
			break;
		default:
			cnt_check_state = STATE_NORMAL;
			break;
	}
	
	rcInfo.mode[id - 1] = mode;
	rcInfo.curr_temp[id - 1] = buf[2];
	rcInfo.setup_temp[id - 1] = buf[3];
	
	cnt_ptc_check_homenet(buf);
}

uint8_t cnt_ptc_getCheckState(void) {
	return cnt_check_state;
}

void   copy_funcInfo(uint8_t page)
{
   FUNCINFO   *p;
   uint8_t   i, k;
   
   p = cntGetType()==0 ? &funcInfo : &funcInfo2;
   for( i=0; i<TBL_V_SIZE/2; i++ )
   {
      vtbl.coil[i] = funcInfo.valve_len[i];
      vtbl.valve2rc[i] = funcInfo.valve_rc[i];
      if( i >= funcInfo.valve )
         vtbl.coil[i] = 0;
   }
   for( i=0; i<TBL_V_SIZE/2; i++ )
   {
      k = TBL_V_SIZE/2 + i;
      vtbl.coil[k] = funcInfo2.valve_len[i];
      vtbl.valve2rc[k] = funcInfo2.valve_rc[i];
      if( i >= funcInfo2.valve )
         vtbl.coil[k] = 0;
   }
   for( i=0; i<TBL_V_SIZE; i++ )
   {
      if( vtbl.valve2rc[i] == 0 )
      {
         vtbl.curr[i] = 0;
         vtbl.setup[i] = 0;
         vtbl.coil[i] = 0;
      }
   }
	 
   if( vtbl.ii[0] != 0x80 )
   {
      vtbl.ii[0] = page==0 ? 0x80 : 0;
      //   for Boiler Cntl
      if( p->opMode == 7 )
      {
         vtbl.ii[0] = 0;
         vtbl.ii[2] = 0xff;
      }
      else if( vtbl.ii[2] == 0xff )
      {
         vtbl.ii[0] = 0;
         vtbl.ii[2] = 0;
      }
   }
	 
   vtbl.ii[1] = vtbl.valveCnt > p->valve ? vtbl.valveCnt : 0;
   
   vtbl.valveCnt = p->valve;
   vtbl.max = p->houseCapa;
   vtbl.cntlMode = funcInfo.cntlMode;
}

/*
*/
uint8_t	_flash_save_enable = 0;
uint8_t	_flash_save_count = 0;
uint8_t	_flash_save_timer = 0;

//	wait 5sec and flash write
/*
	5s -> 1s by heedopark 2016.08.28
 */
#define	FLASH_SET_TIMESTAMP	_flash_save_timer = 1; \
							_flash_save_enable = 1;

void	_flash_saveCb(void)
{
	if( _flash_save_enable != 1 )
		return;
		
	if( _flash_save_timer != 0 )
	{
		_flash_save_timer--;
		return;
	}
	_flash_save_enable = 0;
	
	//	UART1/3 Desable
	UART1_DeInit();
	UART3_DeInit();
	
	if( (_flash_save_count & 0x80) != 0 )
	{
		FW_B_TYPE(funcInfo.boiler_type);
		FW_LPM(funcInfo.lpmType);
		FW_CNT(funcInfo.cnt);
		FW_VALVE(funcInfo.valve);
		FW_B_SHOWER(funcInfo.boiler_set_water_shower);
		FW_HOUSECAPA(funcInfo.houseCapa);
		FW_B_HEAT(funcInfo.boiler_set_water_heat);
		FW_SUBRCLOCK(funcInfo.subrcLock);
		FW_POTYPE(funcInfo.poType);
		FW_CNT_MODE(funcInfo.cntlMode);
		FW_OPMODE(funcInfo.opMode);
		FW_PLC(funcInfo.plc);
	}
	if( (_flash_save_count & 0x40) != 0 )
	{
		FW2_B_TYPE(funcInfo2.boiler_type);
		FW2_LPM(funcInfo2.lpmType);
		FW2_CNT(funcInfo2.cnt);
		FW2_VALVE(funcInfo2.valve);
		FW2_B_SHOWER(funcInfo2.boiler_set_water_shower);
		FW2_HOUSECAPA(funcInfo2.houseCapa);
		FW2_B_HEAT(funcInfo2.boiler_set_water_heat);
		FW2_SUBRCLOCK(funcInfo2.subrcLock);
		FW2_POTYPE(funcInfo2.poType);
		FW2_CNT_MODE(funcInfo2.cntlMode);
		FW2_OPMODE(funcInfo2.opMode);
		FW2_PLC(funcInfo2.plc);
	}
	if( (_flash_save_count & 0x20) != 0 )
	{
		FW_VRC_1(funcInfo.valve_rc[0]);
		FW_VRC_2(funcInfo.valve_rc[1]);
		FW_VRC_3(funcInfo.valve_rc[2]);
		FW_VRC_4(funcInfo.valve_rc[3]);
		FW_VL_1(funcInfo.valve_len[0]);
		FW_VL_2(funcInfo.valve_len[1]);
		FW_VL_3(funcInfo.valve_len[2]);
		FW_VL_4(funcInfo.valve_len[3]);
	}
	if( (_flash_save_count & 0x10) != 0 )
	{
		FW2_VRC_1(funcInfo2.valve_rc[0]);
		FW2_VRC_2(funcInfo2.valve_rc[1]);
		FW2_VRC_3(funcInfo2.valve_rc[2]);
		FW2_VRC_4(funcInfo2.valve_rc[3]);
		FW2_VL_1(funcInfo2.valve_len[0]);
		FW2_VL_2(funcInfo2.valve_len[1]);
		FW2_VL_3(funcInfo2.valve_len[2]);
		FW2_VL_4(funcInfo2.valve_len[3]);
	}
	if( (_flash_save_count & 0x08) != 0 )
	{
		FW_VRC_5(funcInfo.valve_rc[4]);
		FW_VRC_6(funcInfo.valve_rc[5]);
		FW_VRC_7(funcInfo.valve_rc[6]);
		FW_VRC_8(funcInfo.valve_rc[7]);
		FW_VL_5(funcInfo.valve_len[4]);
		FW_VL_6(funcInfo.valve_len[5]);
		FW_VL_7(funcInfo.valve_len[6]);
		FW_VL_8(funcInfo.valve_len[7]);
	}
	if( (_flash_save_count & 0x04) != 0 )
	{
		FW2_VRC_5(funcInfo2.valve_rc[4]);
		FW2_VRC_6(funcInfo2.valve_rc[5]);
		FW2_VRC_7(funcInfo2.valve_rc[6]);
		FW2_VRC_8(funcInfo2.valve_rc[7]);
		FW2_VL_5(funcInfo2.valve_len[4]);
		FW2_VL_6(funcInfo2.valve_len[5]);
		FW2_VL_7(funcInfo2.valve_len[6]);
		FW2_VL_8(funcInfo2.valve_len[7]);
	}
	//	CLEAR
	_flash_save_count = 0;
	//	OPEN UART
	systemUart();
}

void cnt_ptc_save_flash(uint8_t b0, uint8_t page) {
	switch (page) {
		case 0:
			if (((b0 & 0x80) >> 7) == 0) {
				_flash_save_count |= 0x80;
				FLASH_SET_TIMESTAMP
/*				
				FW_B_TYPE(funcInfo.boiler_type);
				FW_LPM(funcInfo.lpmType);
				FW_RELAY(funcInfo.relay);
				FW_CNT(funcInfo.cnt);
				FW_VALVE(funcInfo.valve);
				FW_B_SHOWER(funcInfo.boiler_set_water_shower);
				FW_HOUSECAPA(funcInfo.houseCapa);
				FW_B_HEAT(funcInfo.boiler_set_water_heat);
				FW_SUBRCLOCK(funcInfo.subrcLock);
				FW_POTYPE(funcInfo.poType);
//				if( funcInfo.cntlMode == 0 || funcInfo.cntlMode == 1 )
//				{
					FW_CNT_MODE(funcInfo.cntlMode);
//				}
				FW_OPMODE(funcInfo.opMode);
*/
			} else {
/*				
				FW2_B_TYPE(funcInfo2.boiler_type);
				FW2_LPM(funcInfo2.lpmType);
				FW2_RELAY(funcInfo2.relay);
				FW2_CNT(funcInfo2.cnt);
				FW2_VALVE(funcInfo2.valve);
				FW2_B_SHOWER(funcInfo2.boiler_set_water_shower);
				FW2_HOUSECAPA(funcInfo2.houseCapa);
				FW2_B_HEAT(funcInfo2.boiler_set_water_heat);
				FW2_SUBRCLOCK(funcInfo2.subrcLock);
				FW2_POTYPE(funcInfo2.poType);
//				if( funcInfo.cntlMode == 0 || funcInfo.cntlMode == 1 )
//				{
					FW2_CNT_MODE(funcInfo2.cntlMode);
//				}
				FW2_OPMODE(funcInfo2.opMode);
*/
				_flash_save_count |= 0x40;
				FLASH_SET_TIMESTAMP
			}
			break;
		case 1:
			if (((b0 & 0x80) >> 7) == 0) {
				_flash_save_count |= 0x20;
				FLASH_SET_TIMESTAMP
/*				
				FW_VRC_1(funcInfo.valve_rc[0]);
				FW_VRC_2(funcInfo.valve_rc[1]);
				FW_VRC_3(funcInfo.valve_rc[2]);
				FW_VRC_4(funcInfo.valve_rc[3]);
				FW_VL_1(funcInfo.valve_len[0]);
				FW_VL_2(funcInfo.valve_len[1]);
				FW_VL_3(funcInfo.valve_len[2]);
				FW_VL_4(funcInfo.valve_len[3]);
*/
			} else {
				_flash_save_count |= 0x10;
				FLASH_SET_TIMESTAMP
/*				
				FW2_VRC_1(funcInfo2.valve_rc[0]);
				FW2_VRC_2(funcInfo2.valve_rc[1]);
				FW2_VRC_3(funcInfo2.valve_rc[2]);
				FW2_VRC_4(funcInfo2.valve_rc[3]);
				FW2_VL_1(funcInfo2.valve_len[0]);
				FW2_VL_2(funcInfo2.valve_len[1]);
				FW2_VL_3(funcInfo2.valve_len[2]);
				FW2_VL_4(funcInfo2.valve_len[3]);
*/
			}
			break;
		case 2:
			if (((b0 & 0x80) >> 7) == 0) {
				_flash_save_count |= 0x08;
				FLASH_SET_TIMESTAMP
/*				
				FW_VRC_5(funcInfo.valve_rc[4]);
				FW_VRC_6(funcInfo.valve_rc[5]);
				FW_VRC_7(funcInfo.valve_rc[6]);
				FW_VRC_8(funcInfo.valve_rc[7]);
				FW_VL_5(funcInfo.valve_len[4]);
				FW_VL_6(funcInfo.valve_len[5]);
				FW_VL_7(funcInfo.valve_len[6]);
				FW_VL_8(funcInfo.valve_len[7]);
*/
			} else {
				_flash_save_count |= 0x04;
				FLASH_SET_TIMESTAMP
/*				
				FW2_VRC_5(funcInfo2.valve_rc[4]);
				FW2_VRC_6(funcInfo2.valve_rc[5]);
				FW2_VRC_7(funcInfo2.valve_rc[6]);
				FW2_VRC_8(funcInfo2.valve_rc[7]);
				FW2_VL_5(funcInfo2.valve_len[4]);
				FW2_VL_6(funcInfo2.valve_len[5]);
				FW2_VL_7(funcInfo2.valve_len[6]);
				FW2_VL_8(funcInfo2.valve_len[7]);
*/
			}
			break;
	}
	/*	
	*/
	copy_funcInfo(page);
}

/*
	2015.11.05 by heedo
	for sub-cnt detector
 */
extern uint8_t	_ioMaster[];
extern uint8_t	ext_sub_ready;

// 룸콘 셋팅의 응답
void cnt_ptc_check_setting(uint8_t *buf) {
	FUNCINFO *p;
	uint8_t page;
	uint8_t mode;
	uint8_t i;
	page = buf[0] & 0x0F;
	packet_buf[0] = 0; 
	
	switch (page) {
	case 0:
		mode = buf[6];
		p = (((mode & 0x80) >> 7) == 0) ? &funcInfo : &funcInfo2;
		p->boiler_type = (buf[1] & 0x80) >> 7;
		p->plc = (buf[1] & 0x70) >> 4;
		p->lpmType = buf[1] & 0x0F;
		p->relay = (buf[2] & 0x80) >> 7;
		p->cnt = (buf[2] & 0x70) >> 4;
		p->valve = buf[2] & 0x0F;
		
		
		if (buf[3] != 0) {														// 2015.11.02 온수 설정 일반 패킷으로 변경
			if (p->boiler_set_water_shower == 0x00) {
				p->boiler_set_water_shower = buf[3];
			}
		}
		
		p->houseCapa = buf[4];
		
		if (buf[5] != 0) {														// 2015.11.02 난방수  설정 일반 패킷으로 변경
		p->boiler_set_water_heat = buf[5];
		}
		
		p->subrcLock = (buf[6] & 0x40) >> 6;
		p->poType = (buf[6] & 0x30) >> 4;
		p->cntlMode = (buf[6] & 0x08) >> 3;
		p->opMode = buf[6] & 0x07;
		/*
		if (((buf[6] & 0x80) >> 7) == 0) {
			funcInfo.boiler_type = (buf[1] & 0x80) >> 7;
			funcInfo.lpmType = buf[1] & 0x0F;
			funcInfo.relay = (buf[2] & 0x80) >> 7;
			funcInfo.cnt = (buf[2] & 0x70) >> 4;
			funcInfo.valve = buf[2] & 0x0F;
			funcInfo.boiler_set_water_shower = buf[3];
			funcInfo.houseCapa = buf[4];
			funcInfo.boiler_set_water_heat = buf[5];
			funcInfo.subrcLock = (buf[6] & 0x40) >> 6;
			funcInfo.poType = (buf[6] & 0x30) >> 4;
			funcInfo.cntlMode = (buf[6] & 0x08) >> 3;
			funcInfo.opMode = buf[6] & 0x07;
		} else {
			funcInfo2.boiler_type = (buf[1] & 0x80) >> 7;
			funcInfo2.lpmType = buf[1] & 0x0F;
			funcInfo2.relay = (buf[2] & 0x80) >> 7;
			funcInfo2.cnt = (buf[2] & 0x70) >> 4;
			funcInfo2.valve = buf[2] & 0x0F;
			funcInfo2.boiler_set_water_shower = buf[3];
			funcInfo2.houseCapa = buf[4];
			funcInfo2.boiler_set_water_heat = buf[5];
			funcInfo2.subrcLock = (buf[6] & 0x40) >> 6;
			funcInfo2.poType = (buf[6] & 0x30) >> 4;
			funcInfo2.cntlMode = (buf[6] & 0x08) >> 3;
			funcInfo2.opMode = buf[6] & 0x07;
		}
		*/
		break;
	case 1:
		mode = buf[1];
		p = (((mode & 0x80) >> 7) == 0) ? &funcInfo : &funcInfo2;
		p->valve_rc[0] = (buf[1] & 0x70) >> 4;
		p->valve_rc[1] = (buf[1] & 0x07);
		p->valve_rc[2] = (buf[2] & 0x70) >> 4;
		p->valve_rc[3] = (buf[2] & 0x07);
		p->valve_len[0] = buf[3];
		p->valve_len[1] = buf[4];
		p->valve_len[2] = buf[5];
		p->valve_len[3] = buf[6];
		
		if (((mode & 0x80) >> 7) == 1) {
			for (i = 0 ; i < 4 ; i++) {
				if (p->valve_rc[i] == 0 && p->valve_len[i] != 0) {
					p->valve_rc[i] = 8;
				}
			}
		}
		/*
		if (((buf[6] & 0x80) >> 7) == 0) {
			funcInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
			funcInfo.valve_rc[1] = (buf[1] & 0x07);
			funcInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
			funcInfo.valve_rc[3] = (buf[2] & 0x07);
			funcInfo.valve_len[0] = buf[3];
			funcInfo.valve_len[1] = buf[4];
			funcInfo.valve_len[2] = buf[5];
			funcInfo.valve_len[3] = buf[6];
		} else {
			funcInfo2.valve_rc[0] = (buf[1] & 0x70) >> 4;
			funcInfo2.valve_rc[1] = (buf[1] & 0x07);
			funcInfo2.valve_rc[2] = (buf[2] & 0x70) >> 4;
			funcInfo2.valve_rc[3] = (buf[2] & 0x07);
			funcInfo2.valve_len[0] = buf[3];
			funcInfo2.valve_len[1] = buf[4];
			funcInfo2.valve_len[2] = buf[5];
			funcInfo2.valve_len[3] = buf[6];
		}
		*/
		break;
	case 2:
		mode = buf[1];
		p = (((mode & 0x80) >> 7) == 0) ? &funcInfo : &funcInfo2;
		p->valve_rc[4] = (buf[1] & 0x70) >> 4;
		p->valve_rc[5] = (buf[1] & 0x07);
		p->valve_rc[6] = (buf[2] & 0x70) >> 4;
		p->valve_rc[7] = (buf[2] & 0x07);
		p->valve_len[4] = buf[3];
		p->valve_len[5] = buf[4];
		p->valve_len[6] = buf[5];
		p->valve_len[7] = buf[6];
	
		if (((mode & 0x80) >> 7) == 1) {
			for (i = 4 ; i < 8 ; i++) {
				if (p->valve_rc[i] == 0 && p->valve_len[i] != 0) {
					p->valve_rc[i] = 8;
				}
			}
		}
		
		/*
		if (((buf[6] & 0x80) >> 7) == 0) {
			funcInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
			funcInfo.valve_rc[5] = (buf[1] & 0x07);
			funcInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
			funcInfo.valve_rc[7] = (buf[2] & 0x07);
			funcInfo.valve_len[4] = buf[3];
			funcInfo.valve_len[5] = buf[4];
			funcInfo.valve_len[6] = buf[5];
			funcInfo.valve_len[7] = buf[6];
		} else {
			funcInfo2.valve_rc[4] = (buf[1] & 0x70) >> 4;
			funcInfo2.valve_rc[5] = (buf[1] & 0x07);
			funcInfo2.valve_rc[6] = (buf[2] & 0x70) >> 4;
			funcInfo2.valve_rc[7] = (buf[2] & 0x07);
			funcInfo2.valve_len[4] = buf[3];
			funcInfo2.valve_len[5] = buf[4];
			funcInfo2.valve_len[6] = buf[5];
			funcInfo2.valve_len[7] = buf[6];
		}
		*/
		break;
	}

	curr_setting_page = page;
	cnt_check_state = STATE_SETTING;
	cnt_ptc_save_flash(mode, page );
}

void cnt_ptc_check_subrc(uint8_t *buf) {
	packet_buf[0] = 0; 
	cnt_check_state = STATE_NORMAL;
}

void cnt_ptc_check_error(uint8_t *buf) {
	uint8_t id;
	uint8_t code;
	uint8_t recover;
	
	id = buf[0] & 0x0F;
	code = buf[1];
	recover = buf[2];
	packet_buf[id - 1] = 0; 
	
	if (funcInfo.error == 0) {
		cnt_check_state = STATE_ERROR;
		func_cnt_error(ERROR_TYPE_RC, code);
	}
	
	if (recover != 0) {
//		cnt_check_state = STATE_ERROR_RECOVER;
		func_cnt_errorReset();
	}
}

void cnt_ptc_check_mirror(uint8_t *buf) {
	packet_buf[0] = 0;
	
	if (cnt_check_state != STATE_COMMAND_MIRROR) {
		cnt_check_state = STATE_NORMAL;
		return;
	}

	if ((buf[0] & 0x0F) == curr_mirror_page ) {
		cnt_check_state = STATE_COMMAND_MIRROR;
		curr_mirror_page++;
	}

	if (curr_mirror_page > MAX_MIRROR_PAGE) {
		func_cnt_endMirror();
	}
}

uint8_t	_sub_cnt_ready = 0;

void cnt_ptc_check_subcnt(uint8_t *buf) {
	uint8_t num;
	uint8_t i;
	
	num = buf[0] & 0x0F;
	
	cnt_check_state = STATE_NORMAL;
	
	if (num != 0x09) {
		return;
	}

/*
	2015.11.05 by heedo
	for sub-cnt detector
 */
	_ioMaster[1] = 0;
	ext_sub_ready = 1;
	
	_sub_cnt_ready = 1;
	funcInfo.sub_rcLED = buf[1];
	
	if (buf[2] != 0x00 && buf[3] != 0x00) {
		func_cnt_error(buf[2], buf[3]);
	}
}


void cnt_ptc_make_cnt(uint8_t *buf) {
		buf[0] = BYTE_START_SUB_CNT_NORMAL | 0x09;
		buf[1] = funcInfo.rcLED;
		buf[2] = funcInfo.error_type;
		buf[3] = funcInfo.error;
		buf[4] = 0x00;
		buf[5] = 0x00;
		buf[6] = 0x00;
		
		makeChecksum(buf);
}

// 서브제어기의 메인제어기에 대한 응답
void cnt_ptc_check_cnt(uint8_t *buf) {
	uint8_t num;
	uint8_t i;
	uint8_t isOp;
	
	num = buf[0] & 0x0F;
	
	if (num != 0x09) {
		return;
	}
		
	ptc_sub_control = buf[5];
	
	if (ptc_sub_control == 1) {
		for (i = 0 ; i < 8 ; i++) {
			packet_buf[i] = 0;
			isOp = getHexToBin(buf[6], i);
			func_cnt_calcInfo(i + 1, 
											((isOp == 1) ? MODE_HOT : MODE_STOP), 
											0x30, 
											((isOp == 1) ? 0x40 : 0x10));
			
			rcInfo.mode[i] = (isOp == 1) ? MODE_HOT : MODE_STOP;
			rcInfo.curr_temp[i] = 0x30;
			rcInfo.setup_temp[i] = ((isOp == 1) ? 0x40 : 0x10);
		}
	}
	
	cnt_ptc_make_cnt(iouart_getBuffer());
	iouart_Set_Packet(60);
	iouart_Pkt_Start();
}

void cnt_ptc_check(uint8_t *buf) {
	uint8_t start;
	
	start = buf[0] & 0xF0;
	switch (start) {
		case BYTE_START_RC_NORMAL:
			cnt_ptc_check_normal(buf);
			break;
		case BYTE_START_RC_SETTING:
			cnt_ptc_check_setting(buf);
			break;
		case BYTE_START_RC_SUBRC:
			cnt_ptc_check_subrc(buf);
			break;
		case BYTE_START_RC_ERROR:
			if (cnt_check_state != STATE_ERROR_RECOVER) {
				cnt_ptc_check_error(buf);
			}
			break;
		case BYTE_START_RC_MIRROR:
			cnt_ptc_check_mirror(buf);
			break;
		case BYTE_START_SUB_CNT_NORMAL:
			cnt_ptc_check_subcnt(buf);
			break;
		default:
		break;
	}
}

void	sub_cnt_ptc_check(uint8_t *buf)
{
	uint8_t start;
	
	start = buf[0] & 0xF0;
	switch (start) {
		case BYTE_START_RC_NORMAL:
			cnt_ptc_check_normal(buf);
			break;
		case BYTE_START_RC_SETTING:
			cnt_ptc_check_setting(buf);
			break;
		case BYTE_START_RC_ERROR:
			if (cnt_check_state != STATE_ERROR_RECOVER) {
				cnt_ptc_check_error(buf);
			}
			break;
		case BYTE_START_CNT_NORMAL:
			cnt_ptc_check_cnt(buf);
			break;
		default:
		break;
	}
}

