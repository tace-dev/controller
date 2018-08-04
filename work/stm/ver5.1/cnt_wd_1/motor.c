//
//	motor
#include "stdafx.h"
#include "mtDef.h"
#include "function.h"

			/*
				영점 측정후, 소음 발생을 줄이기 위해서,
				자동으로 영점을 +방향으로 이동,
				다만, 테스트 모드에서는 문제가 발생함
				2015.10.20
			 */
#define MOTOR_AUTO_CAL_PT

/*
	5와트 소비전력 문제를 해결하기 위한 코드
	기본적으로 30ms On, 180ms Off 시간으로 전체 High Level 
	구간을 축소하고 대응(대기)시간을 늘려서 전력소비 감소시킴
	테스트 결과 5와트 조건 충족시킴
	테스트 코드로 저장공간의 1/2번 위치에 시간 간격을 읽어서 처리
	가능하도록 코드 변경했음
*/
//#define _POWER_TEST_

#ifdef _POWER_TEST_		
uint8_t	_power_test_a = 30;
uint8_t	_power_test_b = 180;
#endif

#define __L			D_IO_LOW
#define __H			D_IO_HIGH

#define _MT_OFFSET		30
#define	_MT_R_OFFSET	150

#define MT_PWM(a,b)		_mt_p1 = a; _mt_p2 = b;

uint8_t	_mt_Cntl = 0;
uint8_t	_mt_s = 0;
uint8_t	_mt_s_rev = 0;

uint8_t	_mt_pwm = 0;
uint8_t	_mt_p1 = 0;
uint8_t	_mt_p2 = 0;

uint8_t	_qqq[1];
uint8_t _qq = 0;

uint8_t	__mt_closeError[TBL_V_SIZE] = 
{ 
0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 
0, 0, 0, 0, 0,
0
};

uint8_t	__mt_offset[8+1];

extern uint8_t	plc3_NotReady(void);
extern uint8_t	_mtCount;

void	mt_clear(uint8_t i)
{
	uint8_t	j;
	__mt_enable = 0;
	
	__L(IO_MV, IO_V1p);
	__L(IO_MV, IO_V2p);
	__L(IO_MV, IO_V3p);
	__L(IO_MV, IO_V4p);

	D_IO_LOW(IO_M1, IO_M1p);
	D_IO_LOW(IO_M2, IO_M2p);
	D_IO_LOW(IO_M3, IO_M3p);
	D_IO_LOW(IO_M4, IO_M4p);

	D_IO_LOW(IO_M5, IO_M5p);
	D_IO_LOW(IO_M6, IO_M6p);
	D_IO_LOW(IO_M7, IO_M7p);
	D_IO_LOW(IO_M8, IO_M8p);

	MT_PWM(0,0)		
}

void	mt_init(void)
{
#ifdef _POWER_TEST_		
	_power_test_a = file_read(0);
	if( _power_test_a == 0 )
		_power_test_a = 30;
	_power_test_b = file_read(1);
	if( _power_test_b == 0 )
		_power_test_b = 180;
#endif
	//	Dal TR
	GPIO_Init(IO_M1, IO_M1p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_M2, IO_M2p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_M3, IO_M3p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_M4, IO_M4p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_M5, IO_M5p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_M6, IO_M6p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_M7, IO_M7p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_M8, IO_M8p, D_IO_OUT_TRIGER);

	GPIO_Init(IO_MV, IO_V1p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_MV, IO_V2p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_MV, IO_V3p, D_IO_OUT_TRIGER);
	GPIO_Init(IO_MV, IO_V4p, D_IO_OUT_TRIGER);

	//	Origin
	GPIO_Init(IO_B1, IO_B1p, D_IO_IN_TRIGER_NOIT);
	GPIO_Init(IO_B2, IO_B2p, D_IO_IN_TRIGER_NOIT);
	GPIO_Init(IO_B3, IO_B3p, D_IO_IN_TRIGER_NOIT);
	GPIO_Init(IO_B4, IO_B4p, D_IO_IN_TRIGER_NOIT);
	GPIO_Init(IO_B5, IO_B5p, D_IO_IN_TRIGER_NOIT);
	GPIO_Init(IO_B6, IO_B6p, D_IO_IN_TRIGER_NOIT);
	GPIO_Init(IO_B7, IO_B7p, D_IO_IN_TRIGER_NOIT);
	GPIO_Init(IO_B8, IO_B8p, D_IO_IN_TRIGER_NOIT);
/*
	__mt_offset[0] = FW2_GET_MT_1;
	__mt_offset[1] = FW2_GET_MT_2;
	__mt_offset[2] = FW2_GET_MT_3;
	__mt_offset[3] = FW2_GET_MT_4;
	__mt_offset[4] = FW2_GET_MT_5;
	__mt_offset[5] = FW2_GET_MT_6;
	__mt_offset[6] = FW2_GET_MT_7;
	__mt_offset[7] = FW2_GET_MT_8;
*/	
	mt_clear(1);
	/*
	_mt_Cntl = 1;
	*/
}

uint16_t	__mt_count16 = 0;

uint8_t	_mo_count = 0;
uint8_t	__mt_enable = 0;
uint8_t	__mt_id = 0;
uint8_t	__mt_i = 0;
uint8_t	__mt_dir = 0;
uint8_t	__mt_k;
uint8_t	__mt_side = 0;

uint8_t	__mt_overrun;
uint8_t	__mt_overrunCount;

uint8_t	__mt_closeflag = 0;
uint8_t	__mt_closereset = 0;

/*
 *	2015.5.25 for MOTOR RATIO 103:1
 */
//	1 for 103:1, 0 for 60:1
uint8_t	__mt_type_flag = 0;
//uint8_t	__mt_timer_count = 45;

#define _MT_TYPE_2_25MS		45
#define _MT_TYPE_2_00MS		40
#define _MT_TYPE_1_90MS		45//32

/*
 *	360/7.5 = 48
 */
#define __H_SIDE(pin,side)	__H(IO_MV, pin);	__mt_side = side;

uint16_t	__mt_wait_init = 1000;

void	mt_run(uint8_t id, uint8_t dir, uint16_t count)
{
	uint32_t	i32;
//	uint16_t	i16;
	uint8_t	i;
	mt_clear(1);
	if( count == 0 )
		return;
		
	if( id == 1 )		{	__H_SIDE(IO_V1p, 0);	}
	else if( id == 2 )	{	__H_SIDE(IO_V2p, 0);	}
	else if( id == 3 )	{	__H_SIDE(IO_V3p, 0);	}
	else if( id == 4 )	{	__H_SIDE(IO_V4p, 0);	}
	else if( id == 5 )	{	__H_SIDE(IO_V4p, 1);	}
	else if( id == 6 )	{	__H_SIDE(IO_V3p, 1);	}
	else if( id == 7 )	{	__H_SIDE(IO_V2p, 1);	}
	else if( id == 8 )	{	__H_SIDE(IO_V1p, 1);	}
	
	__mt_dir = dir;
	__mt_id = id;
	_mo_count = 0;
	
	if( __mt_type_flag == 0 )
	{
		/*
			Motor Ratio is 60:1
			Normal Case
		 */
		__mt_count16 = count;
	}
	else
	{
		i32 = 1757;
		i32 = count * i32;			//	1.716*1024
		__mt_count16 = i32 / 1024;	//	/1024
		//	reverse turn side
		__mt_dir = __mt_dir == 0 ? 1 : 0;
	}
	__mt_wait_init = 100;	//	100us*10 = 1ms * 1000 = 1s
	__mt_enable = 1;
}

void	_mtCbCW(void)
{
	//	-
	if( __mt_side == 0 )
	{
		//	up
		if( __mt_k == 0 )
		{
			__mt_k = 1;
			D_IO_LOW(IO_M1, IO_M1p);
			D_IO_HIGH(IO_M2, IO_M2p);
			D_IO_HIGH(IO_M3, IO_M3p);
			D_IO_LOW(IO_M4, IO_M4p);
			MT_PWM(2,3)
		}
		else if( __mt_k == 1 )
		{
			__mt_k = 2;
			D_IO_LOW(IO_M1, IO_M1p);
			D_IO_HIGH(IO_M2, IO_M2p);
			D_IO_LOW(IO_M3, IO_M3p);
			D_IO_HIGH(IO_M4, IO_M4p);
			MT_PWM(2,4)
		}
		else if( __mt_k == 2 )
		{
			__mt_k = 3;
			D_IO_HIGH(IO_M1, IO_M1p);
			D_IO_LOW(IO_M2, IO_M2p);
			D_IO_LOW(IO_M3, IO_M3p);
			D_IO_HIGH(IO_M4, IO_M4p);
			MT_PWM(1,4)
		}
		else if( __mt_k == 3 )
		{
			__mt_k = 0;
			D_IO_HIGH(IO_M1, IO_M1p);
			D_IO_LOW(IO_M2, IO_M2p);
			D_IO_HIGH(IO_M3, IO_M3p);
			D_IO_LOW(IO_M4, IO_M4p);
			MT_PWM(1,3)
		}
	}
	else
	{
		if( __mt_k == 0 )
		{
			__mt_k = 1;
			D_IO_LOW(IO_M5, IO_M5p);
			D_IO_HIGH(IO_M6, IO_M6p);
			D_IO_HIGH(IO_M7, IO_M7p);
			D_IO_LOW(IO_M8, IO_M8p);
			MT_PWM(6,7)
		}
		else if( __mt_k == 1 )
		{
			__mt_k = 2;
			D_IO_LOW(IO_M5, IO_M5p);
			D_IO_HIGH(IO_M6, IO_M6p);
			D_IO_LOW(IO_M7, IO_M7p);
			D_IO_HIGH(IO_M8, IO_M8p);
			MT_PWM(6,8)
		}
		else if( __mt_k == 2 )
		{
			__mt_k = 3;
			D_IO_HIGH(IO_M5, IO_M5p);
			D_IO_LOW(IO_M6, IO_M6p);
			D_IO_LOW(IO_M7, IO_M7p);
			D_IO_HIGH(IO_M8, IO_M8p);
			MT_PWM(5,8)
		}
		else if( __mt_k == 3 )
		{
			__mt_k = 0;
			D_IO_HIGH(IO_M5, IO_M5p);
			D_IO_LOW(IO_M6, IO_M6p);
			D_IO_HIGH(IO_M7, IO_M7p);
			D_IO_LOW(IO_M8, IO_M8p);
			MT_PWM(5,7)
		}
	}
}

void	_mtCbCCW(void)
{
	//	+
	if( __mt_side == 0 )
	{
		if( __mt_k == 0 )
		{
			__mt_k = 3;
			D_IO_LOW(IO_M1, IO_M1p);
			D_IO_HIGH(IO_M2, IO_M2p);
			D_IO_HIGH(IO_M3, IO_M3p);
			D_IO_LOW(IO_M4, IO_M4p);
			MT_PWM(2,3)
		}
		else if( __mt_k == 1 )
		{
			__mt_k = 0;
			D_IO_LOW(IO_M1, IO_M1p);
			D_IO_HIGH(IO_M2, IO_M2p);
			D_IO_LOW(IO_M3, IO_M3p);
			D_IO_HIGH(IO_M4, IO_M4p);
			MT_PWM(2,4)
		}
		else if( __mt_k == 2 )
		{
			__mt_k = 1;
			D_IO_HIGH(IO_M1, IO_M1p);
			D_IO_LOW(IO_M2, IO_M2p);
			D_IO_LOW(IO_M3, IO_M3p);
			D_IO_HIGH(IO_M4, IO_M4p);
			MT_PWM(1,4)
		}
		else if( __mt_k == 3 )
		{
			__mt_k = 2;
			D_IO_HIGH(IO_M1, IO_M1p);
			D_IO_LOW(IO_M2, IO_M2p);
			D_IO_HIGH(IO_M3, IO_M3p);
			D_IO_LOW(IO_M4, IO_M4p);
			MT_PWM(1,3)
		}
	}
	else
	{
		if( __mt_k == 0 )
		{
			__mt_k = 3;
			D_IO_LOW(IO_M5, IO_M5p);
			D_IO_HIGH(IO_M6, IO_M6p);
			D_IO_HIGH(IO_M7, IO_M7p);
			D_IO_LOW(IO_M8, IO_M8p);
			MT_PWM(6,7)
		}
		else if( __mt_k == 1 )
		{
			__mt_k = 0;
			D_IO_LOW(IO_M5, IO_M5p);
			D_IO_HIGH(IO_M6, IO_M6p);
			D_IO_LOW(IO_M7, IO_M7p);
			D_IO_HIGH(IO_M8, IO_M8p);
			MT_PWM(6,8)
		}
		else if( __mt_k == 2 )
		{
			__mt_k = 1;
			D_IO_HIGH(IO_M5, IO_M5p);
			D_IO_LOW(IO_M6, IO_M6p);
			D_IO_LOW(IO_M7, IO_M7p);
			D_IO_HIGH(IO_M8, IO_M8p);
			MT_PWM(5,8)
		}
		else if( __mt_k == 3 )
		{
			__mt_k = 2;
			D_IO_HIGH(IO_M5, IO_M5p);
			D_IO_LOW(IO_M6, IO_M6p);
			D_IO_HIGH(IO_M7, IO_M7p);
			D_IO_LOW(IO_M8, IO_M8p);
			MT_PWM(5,7)
		}
	}
}

uint8_t	mt_getPt(uint8_t i)
{
	uint8_t	r;
	if( i == 1 )		r = MT_READ(IO_B1, IO_B1p); 
	else if( i == 2 )	r = MT_READ(IO_B2, IO_B2p); 
	else if( i == 3 )	r = MT_READ(IO_B3, IO_B3p); 
	else if( i == 4 )	r = MT_READ(IO_B4, IO_B4p); 
	else if( i == 5 )	r = MT_READ(IO_B5, IO_B5p); 
	else if( i == 6 )	r = MT_READ(IO_B6, IO_B6p); 
	else if( i == 7 )	r = MT_READ(IO_B7, IO_B7p); 
	else if( i == 8 )	r = MT_READ(IO_B8, IO_B8p); 
	return r==0 ? 0 : 1;
}

void	mtOverrun(void)
{
	__mt_overrun = 0;
	switch( __mt_k )
	{
	case 3:	__mt_k = 1;	break;
	case 2:	__mt_k = 0;	break;
	case 1:	__mt_k = 3;	break;
	case 0:	__mt_k = 2;	break;
	}
	mt_run(__mt_id, __mt_dir==0 ? 1 : 0, __mt_overrunCount+1);
}

void	mtCloseError(void)
{
//	if( __mt_closeError[__mt_id-1] < 100 )
//		__mt_closeError[__mt_id-1] += 1;
	if( __mt_closeError[__mt_id - 1] < 100 )
		__mt_closeError[__mt_id - 1] = 100;
}

//
//
uint8_t	__mt_power = 1;
uint8_t	__mt_power_mode = 1;

void	_mtCb(void)
{
	uint8_t dir;
	
	if( __mt_enable == 0 )
		return;

	if( __mt_type_flag == 0 )
	{
		/*
			Motor Ratio is 60:1
			Normal Case
		 */		
#ifdef _POWER_TEST_		
#else
		_mtCount = 30;//_MT_TYPE_2_25MS;
//		_mtCount = _MT_TYPE_2_25MS;
#endif
		dir = __mt_dir;
#ifdef _POWER_TEST_		
		if( __mt_power == 1 )
		{
			_mtCount = _power_test_a;//26; 40us -> 4ms
			__mt_power = 99;
		}
		else if( __mt_power == 99 )
		{
			_mtCount = _power_test_b;	//	4w
			__mt_power = 1;
			goto OFF_ENTRY;			return;
		}
		else if( __mt_power == 98 )
		{
			__mt_power = 1;
			goto OFF_ENTRY;
			return;
		}
		else if( __mt_power == 3 )
		{
			_mtCount--;
			if( _mtCount == 0 )
			{
				__mt_power = 2;
			}
			goto OFF_ENTRY;
//			return;
		}
		else if( __mt_power == 2 )
		{
			_mtCount = 70;//39;//_MT_TYPE_2_25MS;
			__mt_power = 4;
OFF_ENTRY:			
			//	clear
			D_IO_LOW(IO_M1, IO_M1p);
			D_IO_LOW(IO_M2, IO_M2p);
			D_IO_LOW(IO_M3, IO_M3p);
			D_IO_LOW(IO_M4, IO_M4p);
		
			D_IO_LOW(IO_M5, IO_M5p);
			D_IO_LOW(IO_M6, IO_M6p);
			D_IO_LOW(IO_M7, IO_M7p);
			D_IO_LOW(IO_M8, IO_M8p);
			return;
		}
		else if( __mt_power == 4 )
		{
			_mtCount--;
			if( _mtCount == 0 )
			{
				__mt_power = 1;
			}
			return;
		}
		/*
		else
		{
			_mtCount = 70;//39;//_MT_TYPE_2_25MS;
			__mt_power = 1;
			//	clear
			D_IO_LOW(IO_M1, IO_M1p);
			D_IO_LOW(IO_M2, IO_M2p);
			D_IO_LOW(IO_M3, IO_M3p);
			D_IO_LOW(IO_M4, IO_M4p);
		
			D_IO_LOW(IO_M5, IO_M5p);
			D_IO_LOW(IO_M6, IO_M6p);
			D_IO_LOW(IO_M7, IO_M7p);
			D_IO_LOW(IO_M8, IO_M8p);
			return;
		}
		*/
#endif
	}
	else
	{
		//_mtCount = _MT_TYPE_2_00MS;
		_mtCount = _MT_TYPE_1_90MS;
		dir = __mt_dir==0 ? 1 : 0;
	}
//	if( __mt_enable == 0 )
//		return;
/*		
	if( __mt_wait_init != 0 )
	{
		__mt_wait_init--;
		return;
	}
*/
	if( __mt_dir == 0 )		_mtCbCW();
	else
		_mtCbCCW();
		
	if( _mt_Cntl == 0 )
	{
		if( mt_getPt(__mt_id) == 0 && dir == 0 )
		{
			_mo_count++;
			if( _mo_count == __mt_offset[__mt_id-1] )
			{
ErrorExit:			
				__mt_closereset = 0;
				mt_clear(1);
				return;
			}
		}
		else
			_mo_count = 0;
	}
	else if( _mt_Cntl == 2 )
	{
		if( mt_getPt(__mt_id) == 1 )
		{
			mt_clear(1);
#ifdef MOTOR_AUTO_CAL_PT
			/*
				영점 측정후, 소음 발생을 줄이기 위해서,
				자동으로 영점을 +방향으로 이동,
				다만, 테스트 모드에서는 문제가 발생함
			 */
			__mt_offset[__mt_id-1] = _mo_count;
#ifdef _POWER_TEST_				 
			if( _mo_count > 64)			__mt_offset[__mt_id-1] -= 4;
			else if( _mo_count > 32 )	__mt_offset[__mt_id-1] -= 2;
			else if( _mo_count > 16 )	__mt_offset[__mt_id-1] -= 1;
#else
			if( _mo_count > 64)			__mt_offset[__mt_id-1] -= 32+16;
			else if( _mo_count > 32 )	__mt_offset[__mt_id-1] -= 16+8;
			else if( _mo_count > 16 )	__mt_offset[__mt_id-1] -= 8+4;
#endif
#endif
			return;
		}
		else
		{
			_mo_count++;
			if( _mo_count >= _MT_R_OFFSET )
			{
				//	Error
				mt_clear(1);
				__mt_offset[__mt_id-1] = _MT_R_OFFSET;
				return;
			}
		}
	}
		
	__mt_count16--;
	if( __mt_count16 == 0 )
	{
		if( __mt_closeflag == 1 && __mt_closereset == 1 )
			mtCloseError();
Exit:		
#ifdef _POWER_TEST_	
		mtOverrun();
#else
		if( __mt_overrun == 1 )
			mtOverrun();
		else
			mt_clear(1);
#endif
	}	
}

uint8_t	_mc_i = 1;
uint8_t	_mc_complete = 2;
uint8_t	_mc_wait = 0;

uint8_t	mt_Ready(void)
{
	return _mc_complete == 0 ? 1 : 0;
}

#define MT_0			2800
#define MT_NEXT(next)	\
						__mt_closeflag = 1;\
						__mt_closereset = 1;\
						mt_run(_mc_i, 0, MT_0);\
						_mc_i = 99;\
						_mc_complete = next;

uint8_t	mt_plc_mode = 100;

extern uint8_t	_plc3Loop(void);
extern uint8_t	plcerror;

void	mtCalc(void)
{
	uint8_t	i;
	
	//	if PLC3 Mode, return
	/*
		첫번째로 PLC 모드로 가정하고 PLC 동작확인//
		PLC 완료후, 기존 구동기 영정모드 실행
	 */
	/*
		_plc3Loop()@ext_plc.c 
	 */
#if defined (_PLC_)
	_plc3Loop();
	if( plc3_NotReady() == 0 || mt_plc_mode == 100 )
	{
		if( mt_plc_mode == 199 )
		{
			//	No Response
			i = (cntGetType() == 0) ? funcInfo.boiler_type : funcInfo2.boiler_type;
			if( i == 0 )
			{
				//	NO PLC
				goto MT_ENTRY;
			}
		}
		else if( mt_plc_mode == 111 )
		{
			//	End Origin(OK)
			goto MT_ENTRY;
		}
/*		
		else if( mt_plc_mode >= 200 )
		{
			//	Timeout Error
		}
*/		
		/*
			에러가 발생하면, 다음 상태로 이동(모터 영정 확인)
		 */
		if( plcerror == 0 )		
			return;
	}
#endif
MT_ENTRY:		
	if( _mc_i == 1 )		
	{
		_mt_Cntl = 0;
		for( i=0; i<8+1; i++ )
			__mt_offset[i] = _MT_R_OFFSET;
			
		i = (cntGetType() == 0 ) ? funcInfo.valve : funcInfo2.valve;
	//i = 4;
		if( i == 0 )
			goto MT_INIT_COMPLETE_ENTRY;
			
		MT_NEXT(2);	
	}
	else if( _mc_i == 2 )	{	MT_NEXT(3);	}
	else if( _mc_i == 3 )	{	MT_NEXT(4);	}
	else if( _mc_i == 4 )	{	MT_NEXT(5);	}
	else if( _mc_i == 5 )	{	MT_NEXT(6);	}
	else if( _mc_i == 6 )	{	MT_NEXT(7);	}
	else if( _mc_i == 7 )	{	MT_NEXT(8);	}
	else if( _mc_i == 8 )	{	MT_NEXT(100);	}
	/*
	else if( _mc_i == 7 )	{	MT_NEXT(100);	}
	*/
	else if( _mc_i == 99 )
	{
		_mc_wait = __timer1s;
		_mc_i = 101;
	}
	else if( _mc_i == 100 )
	{
MT_INIT_COMPLETE_ENTRY:
		_mc_i = 100;
		if( vtbl.ii[1] != 0 )
		{	
		}
		_mc_complete = 0;
		_mt_Cntl = 0;
	}
	else if( _mc_i == 101 )
	{
		if( __mt_enable == 1 )
			return;
		
		//	Reverse / Get Origin
		_mt_Cntl = 2;
		mt_run(__mt_id, 1, _MT_R_OFFSET);
		_mc_i = 104;
	}
	else if( _mc_i == 102 )
	{
		if( _mc_wait == __timer1s )
			return;
			
		if( __mt_enable != 0 )
			return;
			
		_mc_i = _mc_complete;
		i = 1;
		if( cntGetType() == 0 )
		{
			if( vtbl.cntlMode == 0 )
			{
				if( funcInfo.lpmType != 0 )
				{
					//	PLC is Zero
					if( funcInfo.boiler_type == 0 )
						i = 2;
				}
			}
			i = funcInfo.valve+i;
		}
		else
		{
			if( vtbl.cntlMode == 0 )
			{
				if( funcInfo2.lpmType != 0 && CNTL_LPM_SUB )
				{
					if( funcInfo2.boiler_type == 0 )
						i = 2;
				}
			}
			i = funcInfo2.valve+i;
		}
		if( _mc_i == i )
			_mc_i = 100;
	}
	else if( _mc_i == 103 )
	{
		if( __mt_enable == 1 )
			return;
			
		_mt_Cntl = 0;
		_mc_wait = __timer1s;
		_mc_i = 102;
	}
	else if( _mc_i == 104 )
	{
		if( __mt_enable == 1 )
			return;
			
		mt_run(__mt_id, 0, _MT_R_OFFSET);
		_mc_wait = __timer1s;
		_mt_Cntl = 0;
		_mc_i = 102;
	}
}
