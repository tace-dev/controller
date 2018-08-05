#ifndef __STDAFX_H_
#define __STDAFX_H_

#define TIME_POWERDELAY		499

#if defined (_CNT_CONV_)
#include "stm8s_conf.h"
#include "stm8s.h"
#endif

typedef void (*__func)(void)	FUNC_VOID;

typedef struct tagIoDef
{
	GPIO_TypeDef	*port;
	GPIO_Mode_TypeDef	pin;
}	IODEF, *LPIODEF;

#define UARTBUF_SIZE		16
#define UART_LOW(w)			GPIO_WriteLow(w.io.port, w.io.pin);
#define UART_HIGH(w)		GPIO_WriteHigh(w.io.port, w.io.pin);

typedef struct tagUartDef
{
	IODEF io;
	uint8_t ready;
	uint8_t	size;
	uint8_t	buf[UARTBUF_SIZE];	
}	UARTDEF, *LPUARTDEF;

#define UART_ENABLE(w)		UART_HIGH(w)
#define UART_IDLE(w)		if( w.ready != 0 )	w.ready--;\
							else { UART_LOW(w) }

#define WIREBUF_SIZE		12
#define WIREBUF_SIZE_2		WIREBUF_SIZE*2

typedef struct tagWireDef
{
	IODEF io;
	uint8_t	high;
	uint8_t	wait;
	uint8_t	h;
	uint8_t t;
	uint8_t	enable;
	uint8_t	buf[WIREBUF_SIZE+4];	//	12byte + 2byte
										//	BCD Code for size
}	WIREDEF, *LPWIREDEF;

#define _WIRE_LOW(w)	GPIO_WriteLow(w.io.port, w.io.pin);
#define _WIRE_HIGH(w)	GPIO_WriteHigh(w.io.port, w.io.pin);

#define WIRE_CNTL(w)	if( w.high == 1 ) {\
							w.high = 0;\
							GPIO_WriteLow(w.io.port, w.io.pin);\
						}	
#define WIRE_WRITE(w, func)	\
						if( w.wait != 0 )	w.wait--;\
						else\
							func();

#define WIRE_ENABLE(w)	if( w.enable == 0 ) {
#define WIRE_ENABLE_END	}
#define WIRE_ADD(w, k)	if( (w.h%2) != 0 )	k = (k<<4);\
						else	w.buf[w.h/2] = 0;\
						w.buf[w.h/2] |= k;\
						w.h = (w.h + 1) % WIREBUF_SIZE_2; 

#define IODEF_RESET(io,_port,_pin)	IO_##io.port = GPIO##_port;\
									IO_##io.pin = GPIO_PIN_##_pin;
#define GPIO_SET(portDef,type)		GPIO_Init(\
										IO_##portDef.port,\
										IO_##portDef.pin, type\
										);

#define _H_X1			GPIO_WriteHigh(IO_X1.port, IO_X1.pin);	
#define _L_X1			GPIO_WriteLow(IO_X1.port, IO_X1.pin);	

//	LED
#define LightOn			GPIO_WriteLow(IO_LED.port, IO_LED.pin);
#define LightOff		GPIO_WriteHigh(IO_LED.port, IO_LED.pin);
#define LightToggle 	GPIO_WriteReverse(IO_LED.port, IO_LED.pin);

#define MotorOrigin()	GPIO_ReadInputPin(IO_ORG.port, IO_ORG.pin);
#define ModeSelect()	GPIO_ReadInputPin(IO_MOD.port, IO_MOD.pin)

//	TIMER
//
typedef struct tagTimerInfo
{
	uint8_t	ms10;	//	10ms
	uint8_t	s;
	uint8_t	m;
	uint8_t	h;
	uint8_t	_offset;
	uint8_t	_update;
}	TIMERINFO, *LPTIMERINFO;

extern uint8_t Ticks_50uS;
extern uint16_t Ticks_1mS;

//	FUNCTION
//
//	SYSTEM
//
void configClock(void);
void configTimer(void);
void configGpio(void);

#ifdef USE_FULL_ASSER T
void assert_failed(uint8_t* file, uint32_t line);
#endif

#endif 	//	__STDAFX__H

