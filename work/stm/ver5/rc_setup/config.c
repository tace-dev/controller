#include "stdafx.h"
#include "uiDef.h"

#define _SETUP_ULSAN_20150423_	1

#if defined (_SETUP_ULSAN_20150423_)	
#define SETUP_SIZE		3
uint8_t	_config_data_1[] =     // 59A
{
	4, 72, 62, 76, 42,
	4,	//	RoomCntl
		1, 1,
		2, 2,
		3, 3,
		4, 4,
	1,	//	8LPM, ºº¥ÎπÎ∫Í __lpm[1] = 8
        100,    //      ºº¥ÎπÎ∫Í √÷¥Î¿Ø∑Æ
	1,	//	EACH=1, Local=0
	0	//	XL15A, ∫Ò∑ πÎ∫Í∞Óº±
};
uint8_t	_config_data_2[] =    // 84A 
{
	4, 99, 94, 76, 101,
	4,	//	RoomCntl
		1, 1,
		2, 2,
		3, 3,
		4, 4,
	1,	//	8LPM, ºº¥ÎπÎ∫Í __lpm[1] = 8
        100,    //      ºº¥ÎπÎ∫Í √÷¥Î¿Ø∑Æ
	1,	//	EACH=1, Local=0
	0	//	XL15A, ∫Ò∑ πÎ∫Í∞Óº±
};
uint8_t	_config_data_3[] =    //	84D
{
	3, 109, 119, 74, 51,
	3,	//	RoomCntl
		1, 1,
		2, 2,
		3, 3,
		4, 4,
	1,	//	8LPM, ºº¥ÎπÎ∫Í __lpm[1] = 8
        181,    //      ºº¥ÎπÎ∫Í √÷¥Î¿Ø∑Æ
	1,	//	EACH=1, Local=0
	0	//	XL15A, ∫Ò∑ πÎ∫Í∞Óº±
};

#endif

#if defined (_SETUP_SONGDO_)
#define SETUP_SIZE		4
uint8_t	_config_data_59ae[] =     // #2 --- 59A √÷«œ, √÷ªÛ,  √¯ºº¥Î »Æ¿Â«¸
{
	4, 57, 79, 63, 70,
	4,	//	RoomCntl
		1, 1,
		2, 2,
		3, 3,
		4, 4,
	1,	//	8LPM, ºº¥ÎπÎ∫Í __lpm[1] = 8
        128,    //      ºº¥ÎπÎ∫Í √÷¥Î¿Ø∑Æ
	0,	//	Local
	0	//	XL15A, ∫Ò∑ πÎ∫Í∞Óº±
};
uint8_t	_config_data_59be[] =    // #4 --- 59B √÷«œ, √÷ªÛ, √¯ºº¥Î »Æ¿Â«¸
{
	4, 71, 73, 68, 55,
	4,	//	RoomCntl
		1, 1,
		2, 2,
		3, 3,
		4, 4,
	1,	//	8LPM, ºº¥ÎπÎ∫Í __lpm[1] = 8
        120,    //      ºº¥ÎπÎ∫Í √÷¥Î¿Ø∑Æ
	0,	//	Local
	0	//	XL15A, ∫Ò∑ πÎ∫Í∞Óº±
};
uint8_t	_config_data_8ae1[] =    // #7 --- 84A ±‚¡ÿ√˛ »Æ¿Â«¸
{
	4, 100, 95, 67, 75,
	4,	//	RoomCntl
		1, 1,
		2, 2,
		3, 3,
		4, 4,
	1,	//	8LPM, ºº¥ÎπÎ∫Í __lpm[1] = 8
        181,    //      ºº¥ÎπÎ∫Í √÷¥Î¿Ø∑Æ
	0,	//	Local
	0	//	XL15A, ∫Ò∑ πÎ∫Í∞Óº±
};
uint8_t	_config_data_8be0[] =
{
	5, 93, 88, 62, 73, 82,	//	πÎ∫Íºˆ + πÎ∫Í¡§∫∏ 
	4,	//	RoomCntl
		1, 1,	//	(multi) rc 1, 2 pt, 1/2
		2, 2,
		3, 2,
		4, 3,
		5, 4,
	1,	//	8LPM, ºº¥ÎπÎ∫Í __lpm[1] = 8
        181,    //      ºº¥ÎπÎ∫Í √÷¥Î¿Ø∑Æ
	0,	//	Local
	0	//	XL15A, ∫Ò∑ πÎ∫Í∞Óº±
};
#endif


CONST uint8_t	_config[] = { b1A, b1F, b1E };
CONST uint8_t	_c1_a[] = { b2A, b2B, b2C, b2G, b2F, b2E };
CONST uint8_t	_c1_b[] = { b2F, b2E, b2G, b2C, b2D };
CONST uint8_t	_c2_a[] = { b3A, b3B, b3C, b3G, b3F, b3E };
CONST uint8_t	_c2_b[] = { b3F, b3E, b3G, b3C, b3D };
CONST uint8_t	_c2_e[] = { b3F, b3E, b3G, b3A, b3D };
CONST uint8_t	_c2_d[] = { b3B, b3E, b3G, b3C, b3D };
CONST uint8_t	_c3_b[] = { b4F, b4E, b4G, b4C, b4D };
CONST uint8_t	_c3_e[] = { b4F, b4E, b4G, b4A, b4D };

LCD_DISP_FUNC(config_title, 3, _config)

uint8_t	_config_id = 1;

void	config_disp_c1(uint8_t i, uint8_t c)
{
	uint8_t j;
	if( c=='A' )
	{
		for( j=0; j<6; j++ )	LCD_BIT_SET(_c1_a[j]);
	}
	if( c=='B' )
	{
		for( j=0; j<5; j++ )	LCD_BIT_SET(_c1_b[j]);
	}
}

void	config_disp_c2(uint8_t i, uint8_t c)
{
	uint8_t j;
	if( c=='A' )
	{
		for( j=0; j<6; j++ )	LCD_BIT_SET(_c2_a[j]);
	}
	if( c=='B' )
	{
		for( j=0; j<5; j++ )	LCD_BIT_SET(_c2_b[j]);
	}
	if( c=='E' )
	{
		for( j=0; j<5; j++ )	LCD_BIT_SET(_c2_e[j]);
	}
	if( c=='D' )
	{
		for( j=0; j<5; j++ )	LCD_BIT_SET(_c2_d[j]);
	}
}

void	config_disp_c3(uint8_t i, uint8_t c)
{
	uint8_t j;
	if( c=='B' )
	{
		for( j=0; j<5; j++ )	LCD_BIT_SET(_c3_b[j]);
	}
	if( c=='E' )
	{
		for( j=0; j<5; j++ )	LCD_BIT_SET(_c3_e[j]);
	}
}

void	config_disp_item(uint8_t i, uint8_t j)
{
	uint8_t k;
	for(k=0; k<4; k++)
		lcd_clear_npos(k, 0);
#if defined (_SETUP_ULSAN_20150423_)		
	if( i==1 )
	{
		//	59A
		lcd_disp_n(0, 5);
		lcd_disp_n(1, 9);
		config_disp_c2(0, 'A');
//		config_disp_c3(0, 'E');
	}
	else if( i==2 )
	{
		//	84A
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		config_disp_c2(0, 'A');
//		config_disp_c3(0, 'E');
	}
	else if( i==3 )
	{
		//	84AD
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		config_disp_c2(0, 'D');
//		config_disp_c3(0, 'E');
	}
#endif
#if defined (_SETUP_SONGDO_)
	if( i==1 )
	{
		//	59AE
		lcd_disp_n(0, 5);
		lcd_disp_n(1, 9);
		config_disp_c2(0, 'A');
		config_disp_c3(0, 'E');
	}
	else if( i==2 )
	{
		//	59bE
		lcd_disp_n(0, 5);
		lcd_disp_n(1, 9);
		config_disp_c2(0, 'B');
		config_disp_c3(0, 'E');
	}
	else if( i==3 )
	{
		//	8AE1
		lcd_disp_n(0, 8);
		config_disp_c1(0, 'A');
		config_disp_c2(0, 'E');
		lcd_disp_n(3, 1);
	}
	else if( i==4 )
	{
		//	8BE0
		lcd_disp_n(0, 8);
		config_disp_c1(0, 'B');
		config_disp_c2(0, 'E');
		lcd_disp_n(3, 0);
	}
#endif
}

uint8_t		config_disp(uint8_t key, uint8_t next)
{
	uint8_t	i;
	uint8_t	j;
	uint8_t	k, m, n;
	
	uint8_t	*p;
	if( _dsCount == 0 )
	{
		lcd_clear(0);
//		config_title();
		_dsCount = 1;
		uiInfo._t = _config_id;
	}
	else
	{
		i = _config_id;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )
			{
				if( i==1 )	i = SETUP_SIZE;
				else
					i--;
			}
			else
			{
				if( i==SETUP_SIZE )	i = 1;
				else
					i++;
			}
			_config_id = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			config_disp_item(i, 0);
		}
	}
	if( key == 3 )		
	{
#if defined (_SETUP_ULSAN_20150423_)		
		if( _config_id == 1 )		p = _config_data_1;
		else if( _config_id == 2 )	p = _config_data_2;
		else if( _config_id == 3 )	p = _config_data_3;
#endif
#if defined (_SETUP_SONGDO_)
		if( _config_id == 1 )		p = _config_data_59ae;
		else if( _config_id == 2 )	p = _config_data_59be;
		else if( _config_id == 3 )	p = _config_data_8ae1;
		else if( _config_id == 4 )	p = _config_data_8be0;
#endif
		j = 0;
		uiInfo.valve = p[j++];
		for( i=0; i<uiInfo.valve; i++ )
		{
			uiInfo.valve_len[i] = p[j++];
		}
		uiInfo.cnt = p[j++];
		for( i=0; i<uiInfo.valve; i++ )
		{
			m = p[j++];	//	valve
			n = p[j++];	//	id
			uiInfo.valve_rc[m-1] = n;
		}
		uiInfo.lpmType = p[j++];	//0, 8, 10, 15, 20
		uiInfo.houseCapa = p[j++];	//	HouseCapa
		uiInfo.cntlMode = p[j++];	//0 local, 1 each
		uiInfo.poType = p[j++];		//0 xe10, ...
		
		STATUS_NEXT(next);	
	}
	else if( key == 2 )
	{
		return 1;
	}
	return 0;
}

uint8_t	_d_cursor = 0;
uint8_t	_d_buf[4] = { 1, 1, 1, 1 };

void	config_disp2(uint8_t key, uint8_t next)
{
	uint8_t	i;
	uint8_t	j;
	uint8_t	k, m, n;
	
	uint8_t	*p;
	if( _dsCount == 0 )
	{
		lcd_clear(0);
		lcd_blink_npos_clear();
		lcd_blink_npos(_d_cursor);
		lcd_disp_n(_d_cursor, _d_buf[_d_cursor]);
		_dsCount = 1;
	}
	else
	{
		i = _d_buf[_d_cursor];
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )
			{
				if( i==1 )	i = 9;
				else
					i--;
			}
			else
			{
				if( i==9 )	i = 1;
				else
					i++;
			}
			_d_buf[_d_cursor] = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			lcd_disp_n(_d_cursor, i);
		}
	}
	if( key == 1 )		
	{
		_d_cursor++;
		if( _d_cursor == 4 )
			_d_cursor = 0;
		lcd_blink_npos_clear();
		lcd_blink_npos(_d_cursor);
	}
	else if( key == 4 )
	{
		STATUS_NEXT(next);	
	}
}
