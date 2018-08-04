/*
 *
 *	CNT_WD_1
 *
 */
#include "stdafx.h"
#include "mtDef.h"
#include "factory.h"
#include "function.h"
#include "cnt_protocol.h"
#include "hn_protocol.h"
#include "br_protocol.h"

/*
 * factory mode driver for RN boiler
 */
//#define _FACTORY_RN_ 

/*
 *
 구동기 테스트용 코드
 2016.4. by heedoprk
 *	
 */
//#define MT_TEST_OPEN_IT

#ifdef MT_TEST_OPEN_IT
//	defined @function.c
extern void	testCb_mt_test_open_it(void);
#endif

/*	defined extKocom
 */
uint8_t	timer10msCb(void);
			
#define HN_ERROR 1

uint8_t	__light[8];
uint8_t	__ls[6];
extern uint8_t	_timer100ms255;

CONST	uint8_t	ver[] = "heedop=151103";

void	hn_ptc_check(void);
void	_flash_saveCb(void);

void	ptc_baseSet(void);
void 	ptc_check(uint8_t * buf);
void 	ptc_make(uint8_t * buf);
void 	ptc_ctr_resp(uint8_t * buf);
void	copy_funcInfo(uint8_t i);
void	mt_init(void);
void	vtbl_init(void);

uint8_t	vtbl_loop(uint8_t cmd);

uint8_t	iouartTimer0 = 0;
uint8_t	iouartTimer1 = 0;

U485INFO	_ua;
U485INFO	_ub;
U485INFO_2	_uc;

extern uint8_t	_ts;
extern uint8_t	_mc_i;
extern uint8_t	_t1ms;
extern uint8_t	debug_enable_cnt;
extern uint8_t	_plc_s;
extern uint8_t	_plc_rc;

extern uint8_t ptc_sub_control;
extern uint8_t	_plc3Loop(uint8_t mode);

uint8_t	packet_buf[PACKET_SIZE];

extern uint8_t cnt_check_state;

/*
	boiler/homenet flag
	2015.10.31
 */
uint8_t	ext_br_ready = 0;
uint8_t	ext_hn_ready = 0;
uint8_t	ext_br_type = 0;
uint8_t	ext_br_error = 0;
uint8_t	ext_hn_error = 0;
uint8_t	ext_br_timeout = 40;

uint8_t	ext_sub_ready = 0;
uint8_t	ext_sub_timeout = 20;
uint8_t	ext_sub_error = 0;

/*
 *	대림/구미 봉곡 현장별 설정
 *	B7/B6 2개를 사용함
 *	설정프로그램 변경 확인필요
*/
#define DAERIM_GUMI
/*
 *	B7 속성정보로 설정
		7 보일러설정 유무
		6 홈넷설정 유무
		5 서브제어기 설정 유무
		4:0 예약
	2015.12.28
 */
//#define B7_DEFINED

void cnt_Open(void) {

	uint8_t	i;
	funcInfo.relay = FW_GET_RELAY;
	funcInfo.cnt = FW_GET_CNT;
//funcInfo.cnt = 4;
	funcInfo.valve = FW_GET_VALVE;
/*	for motor zero detection 
 */
if( funcInfo.valve == 0 )
	funcInfo.valve = 8;
	
	funcInfo.boiler_set_water_shower = FW_GET_B_SHOWER;
	funcInfo.houseCapa = FW_GET_HOUSECAPA;
	funcInfo.boiler_set_water_heat = FW_GET_B_HEAT;
	funcInfo.subrcLock = FW_GET_SUBRCLOCK;
	funcInfo.poType = FW_GET_POTYPE;
	funcInfo.cntlMode = FW_GET_CNT_MODE;
	funcInfo.opMode = FW_GET_OPMODE;
	funcInfo.lpmType = FW_GET_LPM;
	
	funcInfo.sub_rcLED = 0;
	
	funcInfo2.relay = FW2_GET_RELAY;
	funcInfo2.cnt = FW2_GET_CNT;
	funcInfo2.valve = FW2_GET_VALVE;
	funcInfo2.boiler_set_water_shower = FW2_GET_B_SHOWER;
	funcInfo2.houseCapa = FW2_GET_HOUSECAPA;
	funcInfo2.boiler_set_water_heat = FW2_GET_B_HEAT;
	funcInfo2.subrcLock = FW2_GET_SUBRCLOCK;
	funcInfo2.poType = FW2_GET_POTYPE;
	funcInfo2.cntlMode = FW2_GET_CNT_MODE;
	funcInfo2.opMode = FW2_GET_OPMODE;
	funcInfo2.lpmType = FW2_GET_LPM;

	funcInfo.valve_rc[0] = FW_GET_VRC_1;
	funcInfo.valve_rc[1] = FW_GET_VRC_2;
	funcInfo.valve_rc[2] = FW_GET_VRC_3;
	funcInfo.valve_rc[3] = FW_GET_VRC_4;
	funcInfo.valve_rc[4] = FW_GET_VRC_5;
	funcInfo.valve_rc[5] = FW_GET_VRC_6;
	funcInfo.valve_rc[6] = FW_GET_VRC_7;
	funcInfo.valve_rc[7] = FW_GET_VRC_8;
	funcInfo.valve_len[0] = FW_GET_VL_1;
	funcInfo.valve_len[1] = FW_GET_VL_2;
	funcInfo.valve_len[2] = FW_GET_VL_3;
	funcInfo.valve_len[3] = FW_GET_VL_4;
	funcInfo.valve_len[4] = FW_GET_VL_5;
	funcInfo.valve_len[5] = FW_GET_VL_6;
	funcInfo.valve_len[6] = FW_GET_VL_7;
	funcInfo.valve_len[7] = FW_GET_VL_8;
#if defined (DAERIM_GUMI)	
	/*
		boiler/homenet flag
		2015.10.31
	 */
	ext_br_ready = (funcInfo.valve_len[7]&0x80) == 0 ? 0 : 1;
	ext_hn_ready = (funcInfo.valve_len[7]&0x40) == 0 ? 0 : 1;
	
	funcInfo.valve_len[7] = (funcInfo.valve_len[7]&0x3f) * 4;
	
	ext_sub_ready = (funcInfo.valve_len[6]&0x80) == 0 ? 0 : 1;
	funcInfo.valve_len[6] = (funcInfo.valve_len[6]&0x7f) * 2;
#endif
#if defined (B7_DEFINED)
	/*
		boiler/homenet flag
		2015.12.28
		len[7] for Boiler
		len[6] for Homenet
		len[5] for Sub Control
		len[4:0] Reserved
	 */
	ext_br_ready = (funcInfo.valve_len[7]&0x80) == 0 ? 0 : 1;
	ext_hn_ready = (funcInfo.valve_len[6]&0x80) == 0 ? 0 : 1;
	ext_sub_ready = (funcInfo.valve_len[5]&0x80) == 0 ? 0 : 1;
	for( i=0; i<7; i++ )
	{
		funcInfo.valve_len[i] = (funcInfo.valve_len[i]&0x7f) * 2;
	}
#endif
	funcInfo2.valve_rc[0] = FW2_GET_VRC_1;
	funcInfo2.valve_rc[1] = FW2_GET_VRC_2;
	funcInfo2.valve_rc[2] = FW2_GET_VRC_3;
	funcInfo2.valve_rc[3] = FW2_GET_VRC_4;
	funcInfo2.valve_rc[4] = FW2_GET_VRC_5;
	funcInfo2.valve_rc[5] = FW2_GET_VRC_6;
	funcInfo2.valve_rc[6] = FW2_GET_VRC_7;
	funcInfo2.valve_rc[7] = FW2_GET_VRC_8;
	funcInfo2.valve_len[0] = FW2_GET_VL_1;
	funcInfo2.valve_len[1] = FW2_GET_VL_2;
	funcInfo2.valve_len[2] = FW2_GET_VL_3;
	funcInfo2.valve_len[3] = FW2_GET_VL_4;
	funcInfo2.valve_len[4] = FW2_GET_VL_5;
	funcInfo2.valve_len[5] = FW2_GET_VL_6;
	funcInfo2.valve_len[6] = FW2_GET_VL_7;
	funcInfo2.valve_len[7] = FW2_GET_VL_8;

	debug_enable_cnt = FW_GET_CNTTYPE;
	
	funcInfo.plc = FW_GET_PLC;
	funcInfo2.plc = FW2_GET_PLC;
	
	funcInfo.boiler_type = FW_GET_B_TYPE;
	funcInfo2.boiler_type = FW2_GET_B_TYPE;
/*	
	i = file_read(_B+44);
	if( i != 0xaa )
	{
		//초기값 저장
		file_write(_B+44, 0xaa);
		file_write(_B+45, 0xbb);
		file_write(_B+46, 1);
		//	Marker
		 file_write(_B-2, 0x99);
	}
	else
	{
		//	실행카운트 저장
		i = file_read(_B+46);
		file_write(_B+46, i+1);
	}
*/
	/*
	if( 1 )
	{
		debug_enable_cnt = 1;
		FW_CNTTYPE(debug_enable_cnt);
	}
	*/	
	/*
	*/
	copy_funcInfo(1);
}

uint8_t	_msgLoop(uint8_t mode)
{
	cnt_ptc_make(iouart_getBuffer());
	iouart_Set_Packet(0);
	iouart_Pkt_Start();
	return 0;
}

uint8_t	cntGetType(void)
{
	/*	0 for main type, 1 for sub type
	*/
	return debug_enable_cnt;
}

extern void	_plc_check(void);

uint8_t	_iouart3uLoop(void)
{
#if defined (_PLC_)	
	uint8_t	i = 0;
	uint8_t	j;
	uint8_t	*p;
	while( _io3_head != _io3_tail )
	{
		i = iouart3_Ready();
		if( i == 1 )
		{
			p = iouart3_getReadBuffer();
			if( cntGetType() == 0 )
			{
				if( p3_decoder(p) == 0 )
					_plc_check();
			}
			else
			{
			}
		}
	}
#endif
	return 0;
}

extern void	sub_cnt_ptc_check(uint8_t *p);
//	2015.5.9 by heedopark
//	for light cntl
uint8_t	_ioMaster[3+5] = { 0, 0, 0 };

uint8_t	_iouartLoop(void)
{
	uint8_t	i = 0;
	uint8_t	j;
	uint8_t	*p;
	while( _io_head != _io_tail )
	{
		i = iouart_Ready();
//		if( i != 0 )
//			p = iouart_getReadBuffer();
		if( i == 2 )	
			DISP("e", 1);
		if( i == 1 )
		{
			p = iouart_getReadBuffer();
			if( cntGetType() == 0 )
			{
				//	r/c ready
				_ioMaster[4] = 1;
				cnt_ptc_check(p);
				
				if (cnt_ptc_getCheckState() == STATE_COMMAND_FACTORY) {
					if( p[3] >= 100 )
						return 0;
					return 3;
				}
				/*
					timeout recover
				 */
				if( _ioMaster[2] == 1 )
				{
					_ioMaster[2] = 0;
					if( ext_sub_ready == 1 )
					{
#ifdef	SUB_ERROR						
						if( funcInfo.error_type == ERROR_TYPE_CNT && funcInfo.error == 96 )
							func_cnt_errorReset();
#endif							
					}
				}
			}
			else
			{
				//	sub control, controlMode==0
				/*
				*/
				sub_cnt_ptc_check(p);
			}
		}
	}
#if defined (_PLC_)	
	if( iouart3_Get_WriteEnable() == 1 )
		iouart3_Pkt_Start();
#endif		
	//	sub packet not comming
	if( _ioMaster[0] != __timer1s )
	{
		_ioMaster[0] = __timer1s;
		_ioMaster[1]++;
		if( _ioMaster[1] >= ext_sub_timeout )
		{
			ext_sub_timeout = 60;
			_ioMaster[2] = 1;
			_ioMaster[1] = 1;
			if( ext_sub_ready == 1 )
			{
#ifdef	SUB_ERROR						
				if( cntGetType() == 0 )
					func_cnt_error(ERROR_TYPE_CNT, 96);
#endif							
			}
		}			
	}		
	return 0;
}

void	extCommax(void)
{
	ext_hn_ready = 1;
	hn_commax_ptc_check();
}

void	extClio_KR(void)
{
	ext_hn_ready = 1;
	hn_clio_ptc_check();
}

void	extClio_KD(void)
{
	ext_hn_ready = 1;
	hn_clio_ptc_check_KD();
}

void extKocom(void) {
	ext_hn_ready = 1;
	hn_kocom_ptc_check();
}

void extHyundai(void) {
	ext_hn_ready = 1;
	hn_hyundai_ptc_check();
}

void extSeoul(void) {
	ext_hn_ready = 1;
	hn_seoul_ptc_check();
}

volatile uint8_t	_uartBr[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
volatile uint8_t	_uartHn[4] = { 0, 0, 0, 0 };

void	extB_KR(void)
{
	switch (hn_type) {
		case HN_TYPE_NONE:
			br_kr_ptc_check();
			break;
		case HN_TYPE_COMMAX:
			br_kr_ptc_check();
			break;
		case HN_TYPE_CLIO:
			br_kr_ptc_check_clio();
			break;
		case HN_TYPE_HYUNDAI:
			br_kr_ptc_check();
			break;
		case HN_TYPE_SEOUL:
			br_kr_ptc_check();
			break;
		default :
			br_kr_ptc_check();
			break;
	}
	
	//	Set Master Mode
	_uartBr[1] = 1;
	//	if boiler ready, set ready for previous cnt_version
	ext_br_ready = 1;
}

void	extB_KD(void)
{
	br_kd_ptc_check();
	//	if boiler ready, set ready for previous cnt_version
	ext_br_ready = 1;
}
#if	0
#if	defined (_RINNAI_BOILER_)
void	extB_Rn(void)
{
	/*
	*/
	br_rn_ptc_check();
	//	if boiler ready, set ready for previous cnt_version
	ext_br_ready = 1;
}
#endif
#if	defined (_DAEWOO_BOILER_)
void	extB_Dw(void)
{
	/*
	*/
	//br_dw_ptc_check();
	//	if boiler ready, set ready for previous cnt_version
	ext_br_ready = 1;
}
#endif
#endif

//
//	KOEX DEMO
//	2016.2.3
//#define _KOEX_DEMO_

#ifdef _KOEX_DEMO_
extern void br_remocon_ptc_check(void);
void	extB_Remocon(void)
{
	br_remocon_ptc_check();
	//	if boiler ready, set ready for previous cnt_version
	ext_br_ready = 1;
}
#endif

volatile uint8_t	_ping[3] = { 0, 0, 0 };

void	_br_make(void)
{
	if (hn_type == HN_TYPE_CLIO) {
		br_kr_ptc_make_clio();
	} else if (hn_type == HN_TYPE_NONE) {
		br_kr_ptc_make();
	} else {
		br_kr_ptc_make();
	}
}

void	_uartLoopCheckMaster(void)
{
	if( _uartBr[1] == 0 )
	{
		//	Not Connected, PING
		_br_make();
	}
	else
	{
		//	100ms * 9
		if( _ping[0] == 0 )
		{
			_ping[0] = 1;
			_ping[1] = __timer100ms;
			_ping[2] = 0;

			_br_make();
		}
		else
		{
			if( _ping[1] != __timer100ms )
			{
				_ping[1] = __timer100ms;
				_ping[2]++;
				if( _ping[2] == 9 )
				{
					_ping[0] = 0;
				}
			}
		}	
	}
}

#if defined (_RINNAI_BOILER_)

extern uint8_t	iouart9_ReadyBuf(void);
extern uint8_t	iouart9_Ready(void);
extern uint8_t	*iouart9_getReadBuffer(void);
extern void	iouart9_Pkt_Start(void);
extern void	iouart9_Set_Packet(uint8_t wait);
extern uint8_t	_u9TxBuf[];

#define RN_L1_PORT	GPIOB
#define RN_L2_PORT	GPIOB
#define RN_L1_PIN	GPIO_PIN_6
#define RN_L2_PIN	GPIO_PIN_7

void	rn_init(void)
{
	GPIO_Init(RN_L1_PORT, RN_L1_PIN, D_IO_OUT_TRIGER);
	D_IO_LOW(RN_L1_PORT, RN_L1_PIN);
	GPIO_Init(RN_L2_PORT, RN_L2_PIN, D_IO_OUT_TRIGER);
	D_IO_LOW(RN_L2_PORT, RN_L2_PIN);

	//	Tx
	GPIO_Init(D_IOUART9_TX_PORT, D_IOUART9_TX_PIN, D_IO_OUT_TRIGER);
	D_IO_LOW(D_IOUART9_TX_PORT, D_IOUART9_TX_PIN);
	//	Rx
	GPIO_Init(D_IOUART9_READ_PORT, D_IOUART9_READ_PIN, D_IO_IN_TRIGER_NOIT);
}

void	rn_LaCntl(uint8_t i)
{
	if( i==0 )
		D_IO_LOW(RN_L1_PORT, RN_L1_PIN);
	else
		D_IO_HIGH(RN_L1_PORT, RN_L1_PIN);	
}

void	rn_LbCntl(uint8_t i)
{
	if( i==0 )
		D_IO_LOW(RN_L2_PORT, RN_L2_PIN);
	else
		D_IO_HIGH(RN_L2_PORT, RN_L2_PIN);	
}

void	extB_Rn(void)
{
	br_rn_ptc_check(iouart9_getReadBuffer());
		//	if boiler ready, set ready for previous cnt_version
	ext_br_ready = 1;
}

uint8_t	_ioRnLoop(void)
{
	uint8_t	*p;
	while( iouart9_ReadyBuf() )
	{
		if( iouart9_Ready() == 1 )
		{
			//	Ready packet
			p = iouart9_getReadBuffer();
			
			_ioMaster[5] = 1;
			extB_Rn();
			
		} else {
			//	reset br error
			ext_br_error = 0;
		}
	}
}

#endif

#if defined (_DAEWOO_BOILER_)
extern uint8_t	iouart9d_ReadyBuf(void);
extern uint8_t	iouart9d_Ready(void);
extern uint8_t	*iouart9d_getReadBuffer(void);
extern void	iouart9d_Pkt_Start(void);
extern void	iouart9d_Set_Packet(uint8_t wait);
extern uint8_t	_u9dTxBuf[];

extern void br_dw_ptc_make(void);

#define DW_L1_PORT	GPIOB
#define DW_L2_PORT	GPIOB
#define DW_L1_PIN	GPIO_PIN_6
#define DW_L2_PIN	GPIO_PIN_7

void	dw_init(void)
{
	GPIO_Init(DW_L1_PORT, DW_L1_PIN, D_IO_OUT_TRIGER);
	D_IO_LOW(DW_L1_PORT, DW_L1_PIN);
	GPIO_Init(DW_L2_PORT, DW_L2_PIN, D_IO_OUT_TRIGER);
	D_IO_LOW(DW_L2_PORT, DW_L2_PIN);

	//	Tx
//	GPIO_Init(D_IOUART9_TX_PORT, D_IOUART9_TX_PIN, D_IO_OUT_TRIGER);
//	D_IO_LOW(D_IOUART9_TX_PORT, D_IOUART9_TX_PIN);
	//	Rx
//	GPIO_Init(D_IOUART9_READ_PORT, D_IOUART9_READ_PIN, D_IO_IN_TRIGER_NOIT);
}

void	dw_LaCntl(uint8_t i)
{
	if( i==0 )
		D_IO_LOW(DW_L1_PORT, DW_L1_PIN);
	else
		D_IO_HIGH(DW_L1_PORT, DW_L1_PIN);	
}

void	dw_LbCntl(uint8_t i)
{
	if( i==0 )
		D_IO_LOW(DW_L2_PORT, DW_L2_PIN);
	else
		D_IO_HIGH(DW_L2_PORT, DW_L2_PIN);	
}

void	extB_Dw(void)
{
	br_dw_ptc_check(iouart9d_getReadBuffer());
	//	if boiler ready, set ready for previous cnt_version
	ext_br_ready = 1;
}

uint8_t	_ioDwLoop(void)
{
	uint8_t	*p;
	while( iouart9d_ReadyBuf() )
	{
		if( iouart9d_Ready() == 1 )
		{
			p = iouart9d_getReadBuffer();
			_ioMaster[5] = 1;
			extB_Dw();
			
		} else {
			ext_br_error = 0;
		}
	}
}

void	dwLoop(void)
{
	br_dw_ptc_make();
}

#endif

void	_uartLoopB(void)
{
	uint8_t	k;
	uint8_t i;
	while( uart1_Ready() )
	{
		k = uart1_get();
		_ub.t = _t1ms;
		_ub.tCount = 1;
		_ub.b[_ub.i] = k;
		_ub.i++;
		if( _ub.i == U485_SIZE )
		{
			_ub.i = 0;
			_ub.tCount = 0;
		}
	}
	//	reset br error
	ext_br_error = 0;
			
	if( _ub.tCount == 1 )
	{
		i = _t1ms;
		if( _ub.t > i )
			k = 100 + i - _ub.t;
		else
			k = i - _ub.t;
		if( k >= 5 )
		{
			//	light on
			_ioMaster[5] = 1;
			if( _ub.i == 6 )		extB_KR();
			else if( _ub.i == 17 )	extB_KD();
#ifdef _RINNAI_BOILDER_
//			else if( _ub.i == 8 )	extB_Rn();
#endif
#ifdef _DAEWOO_BOILDER_
//			else if( _ub.i == 8 )	extB_Dw();
#endif
#ifdef _KOEX_DEMO_			
			else if( _ub.i == 13 )	extB_Remocon();
#endif			
			//	for boiler error code func_get_errorcode()@function.c
			ext_br_type = _ub.i==6 ? 1 : (_ub.i==17 ? 2 : _ub.i==8 ? 3 : 0);
			
			_ub.i = 0;
			_ub.tCount = 0;
			_ub.q = _t1ms;
			
			//	disable Master
			_uartBr[0] = __timer1s;
		}
	}
	if( _ub.sendReady == 1 )
	{
		if( _ub.q != _t1ms )
		{
			_ub.q = _t1ms;
			_ub.sendCount--;
			if( _ub.sendCount == 0 )
			{
				_ub.sendReady = 0;
				uart1_tx_put(_ub.r, _ub.ir);
			}
		}
	}
	
#if defined (_RINNAI_BOILER_)
	_ioRnLoop();
#endif
#if defined (_DAEWOO_BOILER_)
	_ioDwLoop();
#endif
}

#define HN_OPENED		199

//	by heedopark for clio KR/KD continue packet handler
uint8_t		extHn = 0;
uint8_t		clio15buf[15];
uint8_t		clio26buf[26];
uint8_t		clio15i = 0;
uint8_t		clio26i = 0;
uint8_t		clio15s = 0;
uint8_t		clio26s = 0;

uint8_t   _uai = 0;
uint8_t   _uai2 = 0;
uint8_t   _uartSeoulType = 0;
//	for Kocom response
extern void	hn_kocom_ptc_Cb(void);
extern void	loopTta(uint8_t k);
extern void	loopTtaCb(void);

void	_uartLoopHome(void)
{
	uint8_t	k;
	uint8_t i;
	
	
	while( uart3_Ready() )
	{
		k = uart3_get();
		
		loopTta(k);
		_ua.t = _t1ms;
		_ua.tCount = 1;
		_ua.b[_ua.i] = k;
		_ua.i++;
			
		if( _ua.i == U485_SIZE )
		{
			_ua.i = 0;
			_ua.tCount = 0;
		}
		//	by heedop for clio 15/26
		if( clio15s == 0 )
		{
			//	77...e7
			if( k == 0x77 )
			{
				clio15s = 1;
				clio15i = 0;
				clio15buf[clio15i] = k;
			}
		}
		else if( clio15s == 1 )
		{
			clio15i++;
			clio15buf[clio15i] = k;
			if( clio15i == 14 )
			{
				clio15s = 0;
				if( k == 0xe7 )
				{
					//	packet complete
					for( i=0; i<15; i++ )
					{
						_ua.b[i] = clio15buf[i];
					}
					_ua.i = 15;
					_ua.tCount = 1;
					extClio_KD();
//					goto PacketEntry;
				}				
			}
		}
		
		if( clio26s == 0 )
		{
			//	7e...aa
			if( k == 0x7e )
			{
				clio26s = 1;
				clio26i = 0;
				clio26buf[clio26i] = k;
			}
		}
		else if( clio26s == 1 )
		{
			clio26i++;
			clio26buf[clio26i] = k;
			if( clio26i == 25 )
			{
				clio26s = 0;
				if( k == 0xaa )
				{
					//	packet complete
					for( i=0; i<26; i++ )
					{
						_ua.b[i] = clio26buf[i];
					}
					_ua.i = 26;
					_ua.tCount = 1;
					extClio_KR();
//					goto PacketEntry;
				}				
			}
		}
	}
	//	reset hn error
	ext_hn_error = 0;
			
	if( _ua.tCount == 1 )
	{
		i = _t1ms;
		if( _ua.t > i )
			k = 100 + i - _ua.t;
		else
			k = i - _ua.t;
			
		if( k >= 5 )
		{
PacketEntry: 
			ext_hn_error = 0;
			
			if (_uartSeoulType == 1) {
				if (_ua.i == 4) {	extSeoul();	} 
				else if (_ua.i == 8) {	extSeoul(); }
				
				//if (hn_type != HN_TYPE_SEOUL) { 
				//	_uartSeoulType = 0; 
				//	systemUart3ChangeNoneParity();
				//}
			} 
			else 
			{
				if( _ua.i == 8 ) { extCommax();	}
				else if( _ua.i == 26 ) { extClio_KR(); }
				else if( _ua.i == 15 ) { extClio_KD(); }
				else if( _ua.i == 21 ) { extKocom(); }
				else if( _ua.i == 11 ) { extHyundai(); }
				else if (_ua.i == 4) {	
					_uartSeoulType = 1;	
					systemUart3ChangeEvenParity();
				}
				else
				{
					//	clio ?
					if( _ua.i >= 15 )
					{
						if( extHn == 0 )
						{
							goto CLIO_ENTRY;
						}
					}
				}
			}
		
			_ua.i = 0;
			_ua.tCount = 0;
			_ua.q = _t1ms;
			_uai = 0;
			_uai2 = 0;
		}
		
		//	by heedopark 2015.12.21
		if( extHn == 0 )
		{
CLIO_ENTRY:	
			if( _ua.i >= 15 )
			{
				for( i=0; i<_ua.i; i++ )
				{
					if( _ua.b[i] == 0x77 )
					{
						if( _ua.b[i+14] == 0xe7 )
						{
							extHn = 15;
						}
					}
					else if( _ua.b[i] == 0x7e )
					{
						if( _ua.b[i+25] == 0xaa )
						{
							extHn = 26;
						}
					}
				}
				/*
				if( _ua.b[_ua.i] == 0xE7 )
				{
					if( _ua.b[_ua.i-14] == 0x77 )
					{
						extHn = 15;
					}
				}
				if( _ua.b[_ua.i] == 0xAA )
				{
					if( _ua.i >= 25 )
					{
						if( _ua.b[_ua.i-25] == 0x7E )
						{
							extHn = 26;
						}
					}
				}
				*/
			}			
		}
		if( extHn == 26 )
		{
			//	clio-kr
			//   26 -> 1 more packet, CLIO_KR
			if( _ua.i > 26 )
			{
				 if( _uai != _ua.i )
				 {
						_uai = _ua.i;
						for( i=_uai2; i<_uai; i++ )
						{
						  if( _ua.b[i] != 0xAA )
								continue;
							
							if( i >= 25 )
							{
								if( _ua.b[i-25] == 0x7E )
								{
									 for( k=0; k<26; k++ )
									 {
											_ua.b[k] = _ua.b[i-25+k]; 
									 }
									 _ua.i = 26;
									 goto PacketEntry;
								}
							}
						}
						_uai2 = _uai;
				 }
			}
		}
		if( extHn == 15 )
		{
			//	clio-kd
			//   15 -> 1 more packet, CLIO_KR
			if( _ua.i > 15 )
			{
				 if( _uai != _ua.i )
				 {
						_uai = _ua.i;
						for( i=_uai2; i<_uai; i++ )
						{
						  if( _ua.b[i] != 0xE7 )
								continue;
							
							if( i >= 14 )
							{
								if( _ua.b[i-14] == 0x77 /*&& _ua.b[i-13] == 0x81*/ )
								{
									 for( k=0; k<15; k++ )
									 {
											_ua.b[k] = _ua.b[i-14+k]; 
									 }
									 _ua.i = 15;
									 goto PacketEntry;
								}
							}
						}
						_uai2 = _uai;
				 }
			}
		}
	}	
	if( _ua.sendReady == 1 )
	{
		if( _ua.q != _t1ms )
		{
			_ua.q = _t1ms;
			_ua.sendCount--;
			if( _ua.sendCount == 0 )
			{
				_ua.sendReady = 0;
				uart3_tx_put(_ua.r, _ua.ir);
				if( hn_type == HN_TYPE_KOCOM )
				{
//					hn_kocom_ptc_Cb();
				}
			}
		}
	}
	//	KOCOM retry, 16.6.4 heedo
	if( hn_type == HN_TYPE_KOCOM )
	{
		hn_kocom_cb(0);
	}
	//	16.12.23
	loopTtaCb();
}

/*
 *	CLIO 	- 26 byte / 0x7E
 *			- 10~100ms response time
 *	COMMAX 	- 8 byte / 0x02//0x004//0x05
 *			- 30ms response time
 */ 
void	_uartLoop(void)
{
	uint8_t	k;
	uint8_t i;
#if defined(_DAEWOO_BOILDER_)
	//	skip boiler
#else
	/*	for Boiler
	*/
	_uartLoopB();
#endif
	/*	check Master Mode
	*/
	if( _uartBr[1] == 1 )
	{
		_uartLoopCheckMaster();
	}
	else
	{
		i = __timer1s;
		if( i >= _uartBr[0] )
			i = i - _uartBr[0];
		else
			i = 60 + i - _uartBr[0];
			
		if( i > 5 )
		{
			/*
			5초 간격으로 5회 전송하는 코드를 무한반복으로 변경
			2015.10.30
			 */
			/*
			if( _uartBr[3] < 5 )
			{
				_uartBr[0] = __timer1s;
				_uartBr[1] = 0;
				_uartLoopCheckMaster();
				_uartBr[3]++;
			}
			*/
			_uartBr[0] = __timer1s;
			_uartLoopCheckMaster();
		}
	}	
	if( ext_br_error == 1 )
	{
		/*
			clear error
		 */
		if( _uartBr[6] == 1 )
		{
			_uartBr[6] = 0;
			if( ext_br_ready == 1 )
			{
				if( funcInfo.error_type == ERROR_TYPE_CNT && funcInfo.error == 3 )
					func_cnt_errorReset();
			}
		}
		_uartBr[4] = 0;
	}
	//	packet not comming
	if( _uartBr[5] != __timer1s )
	{
		_uartBr[5] = __timer1s;
		_uartBr[4]++;
		if( _uartBr[4] >= ext_br_timeout )
		{
			ext_br_timeout = 60;
			_uartBr[6] = 1;
			_uartBr[4] = 0;
			if( ext_br_ready == 1 )
				func_cnt_error(ERROR_TYPE_CNT, 3);
		}			
	}
	
	/*	for HOME
	*/
	_uartLoopHome();
#ifdef	HN_ERROR	
	/*
		clear error
	 */
	if( _uartHn[3] == 1 )
	{
		if( ext_hn_error == 1 )
		{
HN_RECOVER_ENTRY:
			//	light on
			_ioMaster[6] = 1;
			_uartHn[3] = 0;
			_uartHn[2] = HN_OPENED;
			if( ext_hn_ready == 1 )
			{
				if( funcInfo.error_type == ERROR_TYPE_CNT && funcInfo.error == 98 )
					func_cnt_errorReset();
			}
		}
	}	
	else
	{
		//	packet ready
		if( ext_hn_error == 1 )
		{			
			//	light on
			_ioMaster[6] = 1;
			_uartHn[2] = 0;
		}
	}
	//	packet not comming
	if( _uartHn[0] != __timer1s )
	{
		_uartHn[0] = __timer1s;
		_uartHn[1]++;
		_uartHn[2]++;
		if( _uartHn[2] == 30 )
		{
			_uartHn[3] = 1;
			if( ext_hn_ready == 1 )
			{
				if( _uartHn[1] == 30 )
				{
					func_cnt_error(ERROR_TYPE_CNT, 98);
				}
				//	Only One
				_uartHn[1] = 31;
			}
		}
		else if( _uartHn[2] == 90 )
		{
			goto HN_RECOVER_ENTRY;
		}
		else
		{
			if( _uartHn[2] >= HN_OPENED )
			{
				_uartHn[2] = HN_OPENED;
				return;
			}
		}
	}
#endif
}

#define D_RELAY_PORT	GPIOA
#define D_RELAY_PIN		GPIO_PIN_3

void	relayCntl(uint8_t i)
{
	if( i==0 )
		D_IO_LOW(D_RELAY_PORT, D_RELAY_PIN);
	else
		D_IO_HIGH(D_RELAY_PORT, D_RELAY_PIN);
}

void	uart_Open(void)
{
	_ua.t = 0;
	_ua.tCount = 0;
	_ua.i = 0;
	_ua.sendReady = 0;
	
	_ub.t = 0;
	_ub.tCount = 0;
	_ub.i = 0;
	_ub.sendReady = 0;
}

void cnt_chnage_rc_set(int room) {
	if ( hn_type == HN_TYPE_KOCOM ) {
		hn_kocom_cb(room+100);
/*		
		if (rcInfo.mode[id - 1] != mode || rcInfo.setup_temp[id - 1] != set) {
			cnt_chnage_rc_set(id - 1);
		}
*/ 		
		/*
		hn_kocom_ptc_make_send(room);
		*/
	}
}
/*
 *	구동기 연속 동작 실험을 위한 코드
 */
/*
#define	CNT_MONKEY_TEST
*/
#ifdef	CNT_MONKEY_TEST
extern uint8_t	_tsCntlTail, _tsCntlHead;
extern uint8_t	__mt_closeflag, __mt_closereset;

void	cnt_monkey(void)
{
	uint16_t	i;
	uint8_t	pp[10];
	uint8_t		id, capa, cntl;
	uint16_t	capaStep;
	
	pp[0] = 0;
	while(1)
	{
		timerCalc();

		/*	motor control
		*/
		if( _tsCntlTail != _tsCntlHead )
		{
			i = toolSetPop();
			if( i != 0 )
			{
				capa = (uint8_t)(i&0xff);
				id = (uint8_t)((i>>12)&0xff);
				cntl = (uint8_t)((i>>8)&0x0f);
				
				capaStep = MT_STEP(capa);
				
				if( cntl == TS_CLOSE )
				{
					__mt_closeflag = 1;
					__mt_closereset = 1;
					mt_run(1, 0, MT_CLOSE_OFFSET);
				}
				else if( cntl == TS_OPEN )		
				{	
					mt_run(1, 1, MT_OPEN_OFFSET);	
				}
			}
		}
		
		if( __timer1s != pp[5] )
		{
			pp[6] = pp[6]==0 ? 1 : 0;
			if( pp[6]==1 )
				D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);
				
			pp[5] = __timer1s;
			pp[0]++;
			if( pp[0] == 20 )
			{
				//	60s
				pp[1] = pp[1]==0 ? 1 : 0;
				if( pp[1] == 0 )
				{
					//	On
					toolSetPush(1, 1, TS_CLOSE); 
				}
				else
				{
					//	Off
					toolSetPush(1, 200, TS_OPEN); 
				}
				pp[0] = 0;
				//	relay output
				relayCntl(pp[1]);
			}
		}
	}
}
#endif

void	lightCntl(void)
{
	/*
	rinnai on -> 0.25s toggle
	r/c off -> off
	*/
	if( __timer1s != __light[0] )
	{
		__light[0] = __timer1s;
		__light[1]++;
		if( __light[1] >= 5 )
		{
			__light[1] = 5;
			//	r/c off
			__ls[0] = 1;
		}
		else
			__ls[0] = 8; 
			
		__light[2]++;
		if( __light[2] >= 5 )
		{
			__light[2] = 5;
			//	rinnai off
			__ls[1] = 1;
		}
		else
			__ls[1] = 8;
			
		__light[3]++;
		if( __light[3] >= 5 )
		{
			__light[3] = 5;
			//	homenet off
			__ls[2] = 1;
		}
		else
			__ls[2] = 8;
	}
	
	//	rc clear
	if( _ioMaster[4] == 1 )
	{
		_ioMaster[4] = 0;
		__light[1] = 0;
		__ls[0] = 8;
	}
	//	boiler
	if( _ioMaster[5] == 1 )
	{
		_ioMaster[5] = 0;
		__light[2] = 0;
		__ls[1] = 8;
	}
	//	homenet
	if( _ioMaster[6] == 1 )
	{
		_ioMaster[6] = 0;
		__light[3] = 0;
		__ls[2] = 8;
	}

	if( (__ls[0]&0x01) == 1 )
	{
		//	r/c off, 2s toggle
		if( (_timer100ms255%2) == 0 )
		{
			if( __light[4] == 0 )
			{
				__light[4] = 1;
				if( cntGetType() == 0 )	
				{	
#if defined (_RINNAI_BOILER_)
					D_IO_TOGGLE(RN_L1_PORT, RN_L1_PIN);		
#endif
#if defined (_DAEWOO_BOILER_)
					D_IO_TOGGLE(DW_L1_PORT, DW_L1_PIN);		
#endif
				}
			}
		}
		else
			__light[4] = 0; 
	}
	if( (__ls[0]&0x08) == 8 )
	{
		if( (_timer100ms255%20) == 0 )
		{
			if( __light[4] == 0 )
			{
				__light[4] = 1;
#if defined (_RINNAI_BOILER_)
				D_IO_LOW(RN_L1_PORT, RN_L1_PIN);		
#endif
#if defined (_DAEWOO_BOILER_)
				D_IO_LOW(DW_L1_PORT, DW_L1_PIN);		
#endif
			}
		}
		else
		
		
			__light[4] = 0; 
	}

	//	boiler
	if( (__ls[1]&0x01) == 1 )
	{
		//	boiler off
		if( (_timer100ms255%3) == 0 )
		{
			if( __light[5] == 0 )
			{
				__light[5] = 1;
				if( cntGetType() == 0 )	{	D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);		}
			}
		}
		else
			__light[5] = 0; 
	}
	if( (__ls[1]&0x08) == 8 )
	{
		if( (_timer100ms255%20) == 0 )
		{
			if( __light[5] == 0 )
			{
				__light[5] = 1;
				D_IO_LOW(D_LED_PORT, D_LED_PIN);		
			}
		}
		else
			__light[5] = 0; 
	}

	//	hn
	if( (__ls[2]&0x01) == 1 )
	{
		//	boiler off
		if( (_timer100ms255%3) == 0 )
		{
			if( __light[6] == 0 )
			{
				__light[6] = 1;
				if( cntGetType() == 0 )	
				{	
#if defined (_RINNAI_BOILER_)
					D_IO_TOGGLE(RN_L2_PORT, RN_L2_PIN);		
#endif
#if defined (_DAEWOO_BOILER_)
					D_IO_TOGGLE(DW_L2_PORT, DW_L2_PIN);		
#endif
				}
				else{}
			}
		}
		else
			__light[6] = 0; 
	}
	if( (__ls[2]&0x08) == 8 )
	{
		// hn off, 2s toggle
		if( (_timer100ms255%20) == 0 )
		{
			if( __light[6] == 0 )
			{
				__light[6] = 1;
#if defined (_RINNAI_BOILER_)
				D_IO_LOW(RN_L2_PORT, RN_L2_PIN);		
#endif
#if defined (_DAEWOO_BOILER_)
				D_IO_LOW(DW_L2_PORT, DW_L2_PIN);		
#endif
			}
		}
		else
			__light[6] = 0; 
	}
}

#if defined (_FACTORY_RN_)
extern uint8_t	rn_parity(void);
extern void	iouart9_Pkt_Start(void);
extern uint8_t	*iouart9_getBuffer(void);
extern void	rn_parity_make(void);
#endif

int		main()
{
	uint8_t k = 0;
	uint8_t i = 0;
	uint8_t	pp[10];
	uint8_t	*p;
	uint8_t	_loopStatus = 0;
	uint8_t	i10ms = 0;
#if defined (_RINNAI_BOILER_)
	uint8_t	ri = 0;
#endif
#if defined (_DAEWOO_BOILER_)
	uint8_t	dt[4];
#endif

	//	util.c
	clockConfig();
	/*	iouart
	*/
	GPIO_Init(D_IOUART_RX_PORT, D_IOUART_RX_PIN, D_IO_IN_TRIGER_NOIT);

	systemTimer();
	systemUart();

	iouart_Open();
	/*	Led
	*/
	GPIO_Init(D_LED_PORT, D_LED_PIN, D_IO_OUT_TRIGER);
	D_IO_LOW(D_LED_PORT, D_LED_PIN);
	//	Rinnai Led
#if defined (_RINNAI_BOILER_)
	rn_init();
#endif	
	/*	Relay
	*/
	GPIO_Init(D_RELAY_PORT, D_RELAY_PIN, D_IO_OUT_TRIGER);
	D_IO_LOW(D_RELAY_PORT, D_RELAY_PIN);

	mt_init();
	vtbl_init();
	enableInterrupts();
	/*	packet base
	*/
	cnt_Open();
	ptc_baseSet();
	cnt_ptc_baseSet();
	uart_Open();

	/*	valve Size
	*/
	if( cntGetType() == 0 )
	{
		i = funcInfo.valve;
		if( vtbl.cntlMode==0 && funcInfo.lpmType != 0 )
			i++;
	}
	else
	{
		i = funcInfo2.valve;
		if( vtbl.cntlMode==0 && funcInfo2.lpmType != 0 && CNTL_LPM_SUB )
			i++;
		//	plc Not Ready, Test Only
		/*
		_plc_s = 101;
		*/
	}
	toolErrorClear();
	toolMtSetSize(i);

	pp[0] = 0;
	pp[6] = 0xff;
	/*	rc always read mode
	*/
	indiIOUartIdle = 0;
#if defined (_PLC_)	
	_u3Idle = 0;
#endif
	
#ifdef MT_TEST_OPEN_IT
	//	defined @function.c
	testCb_mt_test_open_it();
#endif
#ifdef	CNT_MONKEY_TEST
	cnt_monkey();
#endif
	while(1)
	{
Entry:
		i = 0;
		timerCalc();
		//	485
		_uartLoop();

		if( _loopStatus == 0 )
		{
			if( mt_Ready() == 1 )
				_loopStatus = 1;
		}
		else if( _loopStatus == 1 )
		{
			if( pp[2] == 0 )
			{
				pp[2] = 1;
				_loopStatus = 4;
			}
		}

		if( _t20ms != pp[4] )
		{
			i10ms++;
			pp[4] = _t20ms;
#if defined (_DAEWOO_BOILER_)
			dt[0]++;
			if( dt[0] >= 50 )
			{
				//	500ms
				dt[0] = 0;
				dwLoop();
			}
#endif
			if( i10ms >= 42 )
			{
				//	420ms
				i10ms = 0;
				if( cntGetType() == 0 )
				{
					if( __mt_enable != 10 )
						_msgLoop(0);
				}
			}
			timer10msCb();
		}

		//	iouart packet result
		i = _iouartLoop();
		if( i == 3 )
		{
			while(1)
				factory(1);
		}
		//	iouart3 packet
		_iouart3uLoop();

		/*	motor control
		*/
		toolMtLoop(0);

		//	motor calc
		//
		mtCalc();
		
		lightCntl();
		if( __timer1s != pp[5] )
		{
//			pp[6] = pp[6]==0 ? 1 : 0;
//			if( cntGetType() == 0 || pp[6]==1 )
//				D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);
				
			pp[5] = __timer1s;
			if( vtbl.ii[0] == 0x80 )
			{
				vtbl.ii[0] = 0;
				_ts = 0;
				_mc_i = 1;
				mt_clear(0);
				toolErrorClear();
			}
			else
			{
				if( funcInfo.opMode == 2 )		toolMt2Operate();
				else if( funcInfo.opMode == 3 )	toolMtTab();
				else 
				{
					if( funcInfo.opMode == 7 )
					{
						//	485,
					}
					else
					{
						vtbl_loop(0);
					}
				}
			}
#if defined (_RINNAI_BOILER_)
			ri++;
#if defined (_FACTORY_RN_)
	p = iouart9_getBuffer();
	p[0] = 0x99;
	p[1] = 0x98;
	p[2] = 0x97;
	p[3] = 0x96;
			
	rn_parity_make();
	iouart9_Set_Packet(50);
	iouart9_Pkt_Start();
#endif
//			if( (pp[5]%2) == 0 )
			{
//				rn_LaCntl(ri%3);
//				rn_LbCntl(ri%4);
			}
#endif			
			//개별난방일때
			if (funcInfo.cntlMode == 1) {
				if (br_connect != BOILER_CONNECT_COUNT) {
					br_connect += 1;
					
					if (br_connect == BOILER_CONNECT_COUNT) {
						if (funcInfo.error_type == ERROR_TYPE_NONE) {
							if (hn_type == HN_TYPE_CLIO) {
								func_cnt_error(ERROR_TYPE_BOILER, 0x21);
							}
							br_type = BR_TYPE_NONE;
						}
					} else {
						if (hn_type == HN_TYPE_CLIO) {
							if (funcInfo.error_type == ERROR_TYPE_BOILER &&
									funcInfo.error == 0x21) {
								func_cnt_errorReset();
							}
						}
					}
				}
			}
			
			// 홈넷 연결 체크
			if (hn_type != HN_TYPE_NONE) {
				if (hn_connect != HN_CONNECT_COUNT) {
					hn_connect += 1;
				}
				
				if (hn_connect == HN_CONNECT_COUNT) {
					if (funcInfo.error_type == ERROR_TYPE_NONE) {
						if (hn_type != HN_TYPE_KOCOM) {
							hn_type = HN_TYPE_NONE;
						}
						
						//TODO  보일러 정지 
						switch (br_type) {
							case BR_TYPE_KR:
								br_kr_ptc_close_clio();
							break;
						}
					}
				}
			}
			
			for( i=0; i<PACKET_SIZE; i++ )
			{
				if( packet_buf[i] != PACKET_ERROR_COUNT ) {
					packet_buf[i] += 1;
				} else {
					//if (cntGetType() != 0 && ptc_sub_control == 1) {
					//		packet_buf[i] = 0;
					//} else {
						if (hn_type != HN_TYPE_COMMAX) {
							for( k=0; k<TBL_V_SIZE; k++ )
							{
								if( vtbl.valve2rc[k] == (i+1) )
								{
									vtbl.curr[k] = 0x82;
									vtbl.setup[k] = 0x42;
								}
							}
						}
					//}
				}
			}
			/*
			if( vtbl.cntlMode == 0 )
			{
				i = cntGetType() == 0 ? funcInfo2.valve : 0;
				//	House Keep Valve
				//packet_buf[funcInfo.valve + i] = 0;
			}
			*/
			/*	flash saveCb
			*/
			_flash_saveCb();
			
			//_ua.r[0] = kk;
			//uart3_tx_put(_ua.r, 1);
			//kk++;
		}
	}
}
