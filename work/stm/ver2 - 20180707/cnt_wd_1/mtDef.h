#ifndef _MT_DEF_H_
#define _MT_DEF_H_

#define IO_M1		GPIOG
#define IO_M2		GPIOG
#define IO_M3		GPIOC
#define IO_M4		GPIOC
#define IO_M5		GPIOC
#define IO_M6		GPIOC
#define IO_M7		GPIOC
#define IO_M8		GPIOE

#define IO_M1p		GPIO_PIN_1
#define IO_M2p		GPIO_PIN_0
#define IO_M3p		GPIO_PIN_7
#define IO_M4p		GPIO_PIN_6
#define IO_M5p		GPIO_PIN_5
#define IO_M6p		GPIO_PIN_4
#define IO_M7p		GPIO_PIN_3
#define IO_M8p		GPIO_PIN_5

#define IO_MV		GPIOE

#define IO_V1p		GPIO_PIN_3
#define IO_V2p		GPIO_PIN_2
#define IO_V3p		GPIO_PIN_1
#define IO_V4p		GPIO_PIN_0

#define	IO_B1		GPIOB
#define	IO_B2		GPIOB
#define	IO_B3		GPIOB
#define	IO_B4		GPIOB
#define	IO_B5		GPIOB
#define	IO_B6		GPIOB
#define	IO_B7		GPIOE
#define	IO_B8		GPIOE

#define IO_B1p		GPIO_PIN_5
#define IO_B2p		GPIO_PIN_4
#define IO_B3p		GPIO_PIN_3
#define IO_B4p		GPIO_PIN_2
#define IO_B5p		GPIO_PIN_1
#define IO_B6p		GPIO_PIN_0
#define IO_B7p		GPIO_PIN_7
#define IO_B8p		GPIO_PIN_6

#define MT_READ(port,pin)	GPIO_ReadInputPin(port,pin)

#define TS_CLOSE		1
#define TS_OPEN			2
#define TS_CNTL			3
#define TS_CNTL_PLUS	4
#define TS_CNTL_MINUS	5

#define TS_CNTL_OPEN	6
#define TS_CNTL_CLOSE	7
#define TS_CNTL_MOVE	8
//#define TS_CNTL_MOVE2	9	//	+ move
#define TS_CNTL_LARGE	10
#define TS_CNTL_SMALL	11
//#define TS_CLOSE2		12
#define TS_CLOSE_2P		13
#define TS_CLOSE_TAB	14

#define TS_PLC_ENABLE	15

#define TOOL_MT2TEST	5
#define TOOL_MT2DRIVE	6

#define MT_STEP(i)			(i*12)
#define MT_OPEN_OFFSET		2400
#define MT_CLOSE_OFFSET		2650
#define MT_CLOSE_OFFSET2	2400
#define MT_OVERRUN_OFFSET	60
#define MT_OVERRUN_BASE		(MT_OPEN_OFFSET+MT_OVERRUN_OFFSET)

//#define VALVE_MAX2		16
//

extern uint8_t	__mt_enable;
extern uint16_t	_mtStep[];
extern uint8_t	__mt_closeError[];

void	toolMtLoop(uint8_t cmd);
uint8_t	toolMtTab(void);
void	toolMt2Operate(void);

void	mt_run(uint8_t id, uint8_t dir, uint16_t count);
void	mt_clear(uint8_t i);
uint8_t	mt_Ready(void);

void	toolMtSetSize(uint8_t i);
void	toolSetPush(uint8_t id, uint8_t capa, uint8_t cntl);
void	toolSetPush2(uint8_t id, uint8_t capa, uint8_t cntl);
uint16_t	toolSetPop(void);
void	toolErrorClear(void);

void	calc_clear(void);
void	calc_set_valve2rc(uint8_t valve, uint8_t rc);
void	calc_set_coil(uint8_t *p);
void	calc_set_valve_max(uint8_t i);
uint8_t	calc_set_current_temp(uint8_t *p);
uint8_t	calc_set_rc2temp(uint8_t id, uint8_t temp);



#endif
