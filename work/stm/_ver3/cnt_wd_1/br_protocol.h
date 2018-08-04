#ifndef _BR_PROTOCOL_H_
#define _BR_PROTOCOL_H_
#include "stdafx.h"
#include "function.h"

#define BOILER_CONNECT_COUNT	  10

extern uint8_t br_connect;
extern uint8_t br_type;
extern uint8_t br_error_checksum;
extern uint8_t br_buf_error[15];
extern uint8_t br_buf_count;

enum tagBoilerType{
	BR_TYPE_NONE,
	BR_TYPE_KR,
	BR_TYPE_KD,
	BR_TYPE_RN,
	BR_TYPE_DW
};

typedef struct tagBoilerInfoKD {
	uint8_t func_water_cnt;						// ���޼�, ȯ��
	uint8_t func_warm_up;							// ������� 
	uint8_t func_water_heat_cnt;			// �¼� ����
	uint8_t func_heat_mode;						//  ������, �µ� ����
	uint8_t func_water_shower_unit;		// �¼� ���� (0.5 , 1)
	uint8_t func_water_heat_unit;			// ����� ���� (0.5 , 1)
	uint8_t func_heat_capacity;				// ���� �뷮 ����(��/��)
	uint8_t water_heat_min;
	uint8_t water_heat_max;
	uint8_t water_shower_min;
	uint8_t water_shower_max;
	uint8_t boiler_state_error;				//	�������
	uint8_t boiler_state_heat;				//	������
	uint8_t boiler_state_shower;			//	�¼����
	uint8_t boiler_state_burn;				//	ȭ������
	
	uint8_t boiler_state_use_shower;	//	�¼� ���
	uint8_t boiler_state_ice;					//	���Ĺ���
	uint8_t boiler_state_warm_up;			// �¼� ����
	uint8_t boiler_error;
	uint8_t curr_water_heat;
	uint8_t curr_water_shower;
	
}BRINFO_KD;

extern BRINFO_KD _kdInfo;

typedef struct tagBoilerInfoRN {
	uint8_t state_heat;								// ���� ����
	uint8_t state_shower;							// �¼� ���� 
	uint8_t state_error;							// ���� ����
	uint8_t set_heat_water_temp;			// ����� ���� �µ�
	uint8_t state_heat_play;					// ���� ���� ����
	uint8_t set_shower_water_temp;		// �¼� ���� �µ�
	uint8_t state_fire;								// ���� ���� // 0 : ��ȭ��, 1 : ���� ����, 2: �¼� ����, 3: ���濬��
	uint8_t curr_heat_water_temp;			// ���� ���� �µ�
	uint8_t error_code;								// ���� �ڵ�
	
}BRINFO_RN;

extern BRINFO_RN _rnInfo;

uint8_t br_getHexToBin(uint8_t hex, uint8_t idx);

//extB_kr.c
void br_kr_ptc_check(void);
void br_kr_ptc_check_clio(void);
void br_kr_ptc_make(void);
void br_kr_error_reset(void);
void br_kr_ptc_make_clio(void);
void br_kr_ptc_close_clio(void);

//extB_rn.c
void br_rn_ptc_check(uint8_t *buf);
void br_rn_error_reset(void);

//extB_dw.c
void br_dw_ptc_check(uint8_t *buf);
void br_dw_error_reset(void);

//extB_kd.c
void br_kd_ptc_check(void);
void br_kd_error_reset(void);

typedef struct tagBoilerInfoDw {
	uint8_t state_heat;								// ���� ����
	uint8_t state_shower;							// �¼� ���� 
	uint8_t state_error;							// ���� ����
	uint8_t set_heat_water_temp;			// ����� ���� �µ�
	uint8_t state_heat_play;					// ���� ���� ����
	uint8_t set_shower_water_temp;		// �¼� ���� �µ�
	uint8_t state_fire;								// ���� ���� // 0 : ��ȭ��, 1 : ���� ����, 2: �¼� ����, 3: ���濬��
	uint8_t curr_heat_water_temp;			// ���� ���� �µ�
	uint8_t error_code;								// ���� �ڵ�
	
	uint8_t	br_heat_t;
	uint8_t	br_cmd;
	uint8_t	heat_t;
	uint8_t	shower_t;
	uint8_t	br_err;
	uint8_t	br_shower_t;
}BRINFO_DW;

extern BRINFO_DW	_dwInfo;

#endif
