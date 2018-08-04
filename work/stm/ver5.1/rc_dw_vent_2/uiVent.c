//	
#include "stdafx.h"
#include "uiDef.h"

#if defined(_RC_DW_VENT_)

#define VK_TIMER_PING	5
#define VK_TIMER_RESET	50

#define _K3			0x04	//	Up
#define	_K4			0x08	//	Vent
#define _K7			0x40	//	Dn
#define _K8			0x80	//	Func

#define _VK_UP		_K3
#define _VK_DN		_K7
#define _VK_FN		_K8
#define _VK_ON		_K4
#define _VK_KEY		(_K3|_K4|_K7|_K8)

VENTINFO	_ventInfo;

LPVENTINFO	vent_getInfo(void)
{
	return &_ventInfo;
}

uint8_t	__vs;
uint8_t	_vsCount;

uint8_t vent_time_event[5];
void	vent_disp_func(void);
void	vent_disp(void);

extern uint8_t	getCurrTemp(void);

#define	VWRITE(i, x)	b[i] = (x)	

void	vent_write(void)
{
	uint8_t	crc, i;
	uint8_t	b[6];
	LPVENTINFO	lp = vent_getInfo();
	VWRITE(0, 0xe1);
	VWRITE(1, 0x80|(lp->err_clear==1 ? 0x03 : 0x01));	
	VWRITE(2, (lp->speed<<4) | lp->speed);
	VWRITE(3, getCurrTemp());
	VWRITE(4, lp->err_clear==0 ? lp->err : 0);
	crc = 0;
	for( i=0; i<5; i++ )
		crc += b[i];
	VWRITE(5, crc);
	uart3_tx_put(b, 6);
	lp->err_clear = 0;
}

void	vent_blink(void)
{
	uint8_t	i;
	LPVENTINFO	lp = vent_getInfo();
	if( lp->enable == 0 )
		return;

	if( vent_time_event[0] != __timer100ms)
	{
		vent_time_event[0] = __timer100ms;
		vent_time_event[1]++;
		if( vent_time_event[1] >= 3 )
		{
			vent_time_event[1] = 0;
			lp->bl = lp->bl == 0 ? 1 : 0;
			if( lp->bl == 0 )
			{
				i = lp->fn;
				lp->fn = 0;
				vent_disp_func();
				lp->fn = i;
			}
			else
				vent_disp_func();
		}
		vent_time_event[2]++;
		if( vent_time_event[2] >= VK_TIMER_RESET )
		{
			vent_disp_func();
			lp->enable = 0;
		}
	}
}

void	vent_disp_func(void)
{
	LPVENTINFO	lp = vent_getInfo();
	uint8_t	fn[] = { bT31, bT32, bT33, bT34 };
	uint8_t	i;
	for( i=0; i<4; i++ )
	{
		if( (i+1) == lp->fn )	{	LCD_BIT_SET(fn[i]);	}
		else		{	LCD_BIT_CLEAR(fn[i]);	}
	}
}

void	vent_disp_level(void)
{
	LPVENTINFO	lp = vent_getInfo();
	uint8_t	i, j;
	uint8_t	sp[] = { bT25, bT26, bT27, bT28, bT29, bT30 };
	j = lp->speed*2;
	for( i=0; i<6; i++ )
	{
		if( i<j )	{	LCD_BIT_SET(sp[i]);	}
		else	{ 	LCD_BIT_CLEAR(sp[i]);	}
	}
	LCD_BIT_SET(bT24);
}

void	vent_update_level(uint8_t key)
{
	LPVENTINFO	lp = vent_getInfo();
	if( lp->fn == 1 )	//	vent
	{
		if( key == _VK_UP && lp->speed != 3 )	lp->speed++;
		if( key == _VK_DN && lp->speed != 0 )	lp->speed--;
		vent_disp_level();
	}
	else if( lp->fn == 2 )	//	sleep
	{
	}
	else if( lp->fn == 3 )	//	reser
	{
	}
	else if( lp->fn == 4 )	//	auto
	{
		lp->_temp = lp->speed;
		lp->speed = 1;
		vent_disp_level();
	}
}

uint8_t	vs[3];

void	vent_loopCb(uint8_t key)
{
	uint8_t	i, s;
	LPVENTINFO	lp = vent_getInfo();
	while( uart3_Ready() )
	{
		i = uart3_get();
		if( vs[0] == 0 )
		{
			if( i == 0xe1 )
			{
				vs[0] = 1;
				vs[2] = 0;
				lp->b[vs[2]] = i;
				vs[2]++;
			}
		}
		else if( vs[0] == 1 )
		{
			lp->b[vs[2]] = i;
			vs[2]++;
			if( vs[2] == 6 )
			{
				s = 0;
				for( i=0; i<5; i++ )
					s += lp->b[i];
				if( s == lp->b[5] )
				{
					s = 1;
					vs[2] = 1;
					lp->err = lp->b[4];
					if( (lp->err & 0x08) )
					{
						LCD_BIT_SET(bT23);
					}
					else
					{
						LCD_BIT_CLEAR(bT23);
					}
				}
				vs[0] = 0;
				//	update 
				vent_disp();
			}
			
		}
		//i = i+1;
		
	}
	vent_blink();
	if( vent_time_event[3] != __timer100ms )
	{
		vent_time_event[3] = __timer100ms;
		vent_time_event[4]++;
		if( vent_time_event[4] >= VK_TIMER_PING )
		{
			vent_time_event[4] = 0;
			/*
			 *	send data
			 */
			vent_write();
		}
	}
	if( __vs >= 100 )
	{
		if( _vsCount == 1 )
		{
			if( vent_time_event[0] != __timer100ms )
			{
				vent_time_event[0] = __timer100ms;
				vent_time_event[1]++;
				if( vent_time_event[1] >= VK_TIMER_RESET )
				{
					_vsCount = 0;
					if( lp->fn == 1 || lp->fn == 4 )
						vent_disp_level();
				}
			}
		}
	}
	else if( __vs == 0 )
	{
		if( vent_time_event[0] != __timer100ms )
		{
			vent_time_event[0] = __timer100ms;
			vent_time_event[1]++;
			if( vent_time_event[1] >= 20 )
			{
				__vs = 1;
				vent_time_event[1] = vent_time_event[2] = vent_time_event[3] = 0;
			}
			vent_time_event[2]++;
			if( vent_time_event[2] == 2 )
			{
				vent_time_event[2] = 0;
				lp->speed = (lp->speed+1) % 4;
				vent_disp_level();
			}	
		}
	} 
	else if ( __vs == 1 ) 
	{
		__vs = 100;
		lp->enable = lp->speed = 0;
		lp->fn = 1;
		lp->_temp = 255;
		vent_disp_level();
		vent_disp_func();				
	}
}

void	vent_loop(uint8_t key)
{
	LPVENTINFO	lp = vent_getInfo();
	if( __vs == 100 )  //	normal 
	{
		if( key == (_VK_ON | 0xf0) )
		{
			lp->err_clear = 1;
			LCD_BIT_CLEAR(bT23);
		}
		if( _vsCount == 0 ) 
		{
			if( key == _VK_ON )
			{
				vent_time_event[0] = __timer100ms;
				vent_time_event[1] = vent_time_event[2] = 0;
				_vsCount = 1;
				lp->bl = lp->enable = 1;
				if( lp->fn == 0 )
					lp->fn = 1;
			}
		}
		else if( _vsCount == 1 )
		{
			if( key == _VK_ON )
			{
VENT_TIMEOUT:
				_vsCount = 0;
				lp->enable = 0;
				vent_disp_func();				
			}
			else
			{
				if( (_VK_KEY & key) ) 
					vent_time_event[2] = 0; 

				if( key == _VK_FN ) 
				{ 
					if( lp->fn == 4 )	
					{
						lp->speed = lp->_temp;
						lp->fn = 1;
					}
					else
					{
						lp->_temp = lp->speed;
						lp->fn = lp->fn + 1;
						if( lp->fn == 4 )
							lp->speed = 1;
					}
					vent_disp_level();
					vent_disp_func();				
				}
				else if( key == _VK_UP || key == _VK_DN ) { vent_update_level(key); }
				else
				{
					goto VENT_TIMEOUT;
				}
			}
		}
	}
}

void	vent_disp(void)
{
	vent_disp_level();
	vent_disp_func();
}

#endif

