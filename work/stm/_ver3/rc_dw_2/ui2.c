//
#include "stdafx.h"
#include "uiDef.h"

void	ui_disp_clear_tSetup(uint8_t i)
{
	lcd_clear_npos(2, 0);
	lcd_clear_npos(3, 0);
	lcd_clear_npos(5, 0);
//	LCD_BIT_CLEAR(bS3);
//	LCD_BIT_CLEAR(bC2);
//	LCD_BIT_CLEAR(bT3);
//	LCD_BIT_CLEAR(bT4);
	if (i == 1) {
//		LCD_BIT_CLEAR(bCOL);
//		LCD_BIT_SET(bS1);
//		LCD_BIT_SET(bC1);
	}
}

void	ui_disp_set_tSetup(uint8_t i)
{
//	LCD_BIT_SET(bS3);
//	LCD_BIT_SET(bC2);
}

void	__ui_disp_temp_c(uint8_t i)
{
	LCD_BIT_CLEAR(bT3);
	LCD_BIT_CLEAR(bT5);
	if( i&0x01 )
	{
		LCD_BIT_SET(bT3);
	}
	if( i&0x02 )
	{
		LCD_BIT_SET(bT5);
	}
}

void	ui_disp_temp_c(uint8_t i)
{
	if( i == 0 )
	{
		LCD_BIT_CLEAR(bT3);
		LCD_BIT_CLEAR(bT5);
	}
	else
	{
		LCD_BIT_SET(bT3);
		LCD_BIT_SET(bT5);
	}
}

void	ui_disp_temp_mark(uint8_t i)
{
	if( i == 0 )
	{
//		LCD_BIT_CLEAR(bS1);
//		LCD_BIT_CLEAR(bS3);
	}
	else
	{
//		LCD_BIT_CLEAR(bCOL);
//		LCD_BIT_SET(bS1);
//		LCD_BIT_SET(bS3);
	}
	ui_disp_temp_c(i);
//	LCD_BIT_CLEAR(bCOL);
}

void	ui_disp_temp_setup(uint8_t i)
{
	uint8_t	a, b;
	a = i/2;
	b = i%2;
	lcd_clear_npos(5, 0);
	LCD_BIT_CLEAR(bP2);
	lcd_disp_n(2, a/10);
	lcd_disp_n(3, a%10);
	
	if( b != 0 )
	{
		lcd_disp_n(5, 5);
		LCD_BIT_SET(bP2);
	}
	else
	{
//		lcd_clear_npos(5, 0);
	}
}

void	ui_disp_temp_curr(uint8_t i)
{
	uint8_t	a, b;
	a = i/2;
	b = i%2;
	lcd_clear_npos(4, 0);
	lcd_clear_npos(0, 0);
	LCD_BIT_CLEAR(bP1);
	if( (a/10) != 0 )
	{
		lcd_disp_n(0, a/10);
	}
	lcd_disp_n(1, a%10);
	
	if( b != 0 )
	{
		lcd_disp_n(4, 5);
		LCD_BIT_SET(bP1);
	}
	else
	{
//		lcd_clear_npos(4, 0);
	}
}


void	ui_disp_repeat_setup(uint8_t i)
{
//	ui_disp_temp_mark(0);
//	ui_disp_temp_c(0);
//	LCD_BIT_CLEAR(bT1);
//	LCD_BIT_CLEAR(bT2);
//	LCD_BIT_CLEAR(bT3);
//	LCD_BIT_CLEAR(bT4);
//	LCD_BIT_SET(bCOL);
//	LCD_BIT_SET(bS1);
	
	lcd_disp_n(2, i/10);
	lcd_disp_n(3, i%10);
//	lcd_disp_n(2, (90-i)/10);
//	lcd_disp_n(3, (90-i)%10);
}

void	ui_disp_reserve_setup(uint8_t i)
{
	int8_t	a, b;
//	ui_disp_temp_mark(0);
//	ui_disp_temp_c(0);
//	LCD_BIT_CLEAR(bT1);
//	LCD_BIT_CLEAR(bT2);
//	LCD_BIT_CLEAR(bT3);
//	LCD_BIT_CLEAR(bT4);
//	LCD_BIT_SET(bCOL);
//	LCD_BIT_SET(bS2);
	
	a = i/2;
	b = i%2;
	lcd_disp_n(2, a/10);
	lcd_disp_n(3, a%10);
//	lcd_disp_n(2, b==0 ? 0 : 3);
//	lcd_disp_n(3, 0);
}



