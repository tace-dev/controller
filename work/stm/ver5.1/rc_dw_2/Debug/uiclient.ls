   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               __lcdEnable:
  24  0000 00            	dc.b	0
  25  0001               _lcd_pwmIndex2:
  26  0001 00            	dc.b	0
  27  0002               _lcd_pwmCount2:
  28  0002 46            	dc.b	70
  29  0003               __backlight:
  30  0003 03            	dc.b	3
  31  0004               __led_key_pwmIndex:
  32  0004 00            	dc.b	0
  33  0005               __led_key_pwmCount:
  34  0005 a0            	dc.b	160
  35  0006               __led_i:
  36  0006 00            	dc.b	0
  37  0007               __led_j:
  38  0007 00            	dc.b	0
  39  0008               __led_s:
  40  0008 00            	dc.b	0
  41  0009               __abc:
  42  0009 00            	dc.b	0
  93                     ; 68 void	__rcCb(void)
  93                     ; 69 {
  95                     .text:	section	.text,new
  96  0000               ___rcCb:
  98  0000 88            	push	a
  99       00000001      OFST:	set	1
 102                     ; 71 	i = _backup_backlight2==0 ? _backlight : BACKLIGHT_MAX_LEVEL;
 104  0001 c60000        	ld	a,__backup_backlight2
 105  0004 2605          	jrne	L6
 106  0006 c60003        	ld	a,__backlight
 107  0009 2002          	jra	L01
 108  000b               L6:
 109  000b a660          	ld	a,#96
 110  000d               L01:
 111  000d 6b01          	ld	(OFST+0,sp),a
 112                     ; 87 		_abc = i;
 114  000f c70009        	ld	__abc,a
 115                     ; 89 	if( lcd_pwmIndex2 <= i )	{	PWM_HIGH;	}
 117  0012 c60001        	ld	a,_lcd_pwmIndex2
 118  0015 1101          	cp	a,(OFST+0,sp)
 119  0017 2206          	jrugt	L72
 122  0019 721c5014      	bset	20500,#6
 124  001d 2004          	jra	L13
 125  001f               L72:
 126                     ; 90 	else					{	PWM_LOW;	}
 128  001f 721d5014      	bres	20500,#6
 129  0023               L13:
 130                     ; 92 	lcd_pwmIndex2++;
 132  0023 725c0001      	inc	_lcd_pwmIndex2
 133                     ; 93 	if( lcd_pwmIndex2 >= lcd_pwmCount2 )
 135  0027 c60001        	ld	a,_lcd_pwmIndex2
 136  002a c10002        	cp	a,_lcd_pwmCount2
 137  002d 2504          	jrult	L33
 138                     ; 94 		lcd_pwmIndex2 = 0;
 140  002f 725f0001      	clr	_lcd_pwmIndex2
 141  0033               L33:
 142                     ; 98 	if( _led_key_onOff == 1 )
 144  0033 c60000        	ld	a,__led_key_onOff
 145  0036 a101          	cp	a,#1
 146  0038 2609          	jrne	L53
 147                     ; 100 		D_IO_HIGH(GPIOE, GPIO_Pin_7);
 149  003a cd010b        	call	LC004
 150                     ; 107 		_led_key_onOff = 2;
 152  003d 35020000      	mov	__led_key_onOff,#2
 153                     ; 109 		D_IO_HIGH(_led_key_port, _led_key_pin);
 155  0041 2031          	jp	L15
 156  0043               L53:
 157                     ; 111 	else if( _led_key_onOff == 2 )
 159  0043 a102          	cp	a,#2
 160  0045 2636          	jrne	L14
 161                     ; 113 		if( _led_key_status == 0 )
 163  0047 c60000        	ld	a,__led_key_status
 164  004a 2703cc00f9    	jrne	L73
 165                     ; 116 			_led_i++;
 167  004f 725c0006      	inc	__led_i
 168                     ; 117 			if( _led_i >= 10 )
 170  0053 c60006        	ld	a,__led_i
 171  0056 a10a          	cp	a,#10
 172  0058 2513          	jrult	L54
 173                     ; 119 				_led_s++;
 175  005a 725c0008      	inc	__led_s
 176                     ; 120 				_led_i = 0;
 178  005e 725f0006      	clr	__led_i
 179                     ; 121 				if( _led_s >= 40 )
 181  0062 c60008        	ld	a,__led_s
 182  0065 a128          	cp	a,#40
 183  0067 2504          	jrult	L54
 184                     ; 122 					_led_s = 0;
 186  0069 725f0008      	clr	__led_s
 187  006d               L54:
 188                     ; 125 			if( _led_s == 6 )
 190  006d c60008        	ld	a,__led_s
 191  0070 a106          	cp	a,#6
 192                     ; 128 				if( _led_key_status == 0 )
 193                     ; 130 					LED_BOILER
 194  0072 2774          	jreq	LC002
 195  0074               L15:
 196                     ; 135 				D_IO_HIGH(_led_key_port, _led_key_pin);
 199  0074 72c60000      	ld	a,[__led_key_port.w]
 200  0078 ca0000        	or	a,__led_key_pin
 201  007b 2078          	jp	LC001
 202  007d               L14:
 203                     ; 139 	else if( _led_key_onOff == 0 )
 205  007d c60000        	ld	a,__led_key_onOff
 206  0080 2677          	jrne	L73
 207                     ; 142 		i = 14;	//	10 -> 14,
 209                     ; 143 		_led_i++;
 211  0082 725c0006      	inc	__led_i
 212                     ; 144 		if( _led_i >= 10 )
 214  0086 c60006        	ld	a,__led_i
 215  0089 a10a          	cp	a,#10
 216  008b 2513          	jrult	L36
 217                     ; 146 			_led_s++;
 219  008d 725c0008      	inc	__led_s
 220                     ; 147 			_led_i = 0;
 222  0091 725f0006      	clr	__led_i
 223                     ; 148 			if( _led_s >= 40 )
 225  0095 c60008        	ld	a,__led_s
 226  0098 a128          	cp	a,#40
 227  009a 2504          	jrult	L36
 228                     ; 149 				_led_s = 0;
 230  009c 725f0008      	clr	__led_s
 231  00a0               L36:
 232                     ; 152 			D_IO_HIGH(GPIOE, GPIO_Pin_7);
 234  00a0 ad69          	call	LC004
 235                     ; 159 			D_IO_HIGH(_led_key_port, _led_key_pin);
 237  00a2 72c60000      	ld	a,[__led_key_port.w]
 238  00a6 ca0000        	or	a,__led_key_pin
 239  00a9 72c70000      	ld	[__led_key_port.w],a
 240                     ; 161 		if( _led_s == 0 )			{	D_IO_LOW(GPIOE, GPIO_Pin_7);}
 242  00ad c60008        	ld	a,__led_s
 243  00b0 2606          	jrne	L76
 246  00b2 721f5014      	bres	20500,#7
 248  00b6 2041          	jra	L73
 249  00b8               L76:
 250                     ; 162 		else if( _led_s == 1 )		{	D_IO_LOW(GPIOC, GPIO_Pin_6);}
 252  00b8 a101          	cp	a,#1
 253  00ba 2606          	jrne	L37
 256  00bc 721d500a      	bres	20490,#6
 258  00c0 2037          	jra	L73
 259  00c2               L37:
 260                     ; 163 		else if( _led_s == 2 )		{	D_IO_LOW(GPIOC, GPIO_Pin_5);}
 262  00c2 a102          	cp	a,#2
 263  00c4 2606          	jrne	L77
 266  00c6 721b500a      	bres	20490,#5
 268  00ca 202d          	jra	L73
 269  00cc               L77:
 270                     ; 164 		else if( _led_s == 3 )		{}
 272  00cc a103          	cp	a,#3
 273  00ce 2729          	jreq	L73
 275                     ; 165 		else if( _led_s == 4 )		{	D_IO_LOW(GPIOC, GPIO_Pin_1);}
 277  00d0 a104          	cp	a,#4
 278  00d2 2606          	jrne	L701
 281  00d4 7213500a      	bres	20490,#1
 283  00d8 201f          	jra	L73
 284  00da               L701:
 285                     ; 166 		else if( _led_s == 5 )		{	D_IO_LOW(GPIOA, GPIO_Pin_2);}
 287  00da a105          	cp	a,#5
 288  00dc 2606          	jrne	L311
 291  00de 72155000      	bres	20480,#2
 293  00e2 2015          	jra	L73
 294  00e4               L311:
 295                     ; 167 		else if( _led_s == 6 )
 297  00e4 a106          	cp	a,#6
 298  00e6 2611          	jrne	L73
 299                     ; 169 BOILER_ENTRY:
 299                     ; 170 			//	for boiler led
 299                     ; 171 			if( _led_key_status == 0 )
 301                     ; 173 				LED_BOILER
 303  00e8               LC002:
 305  00e8 c60000        	ld	a,__led_key_status
 306  00eb 260c          	jrne	L73
 308  00ed c60000        	ld	a,__led_key_pin
 309  00f0 43            	cpl	a
 310  00f1 72c40000      	and	a,[__led_key_port.w]
 311  00f5               LC001:
 312  00f5 72c70000      	ld	[__led_key_port.w],a
 313  00f9               L73:
 314                     ; 179 		_led_key_pwmIndex++;
 316  00f9 725c0004      	inc	__led_key_pwmIndex
 317                     ; 180 		if( _led_key_pwmIndex >= _led_key_pwmCount )
 319  00fd c60004        	ld	a,__led_key_pwmIndex
 320  0100 c10005        	cp	a,__led_key_pwmCount
 321  0103 2504          	jrult	L321
 322                     ; 181 			_led_key_pwmIndex = 0;	
 324  0105 725f0004      	clr	__led_key_pwmIndex
 325  0109               L321:
 326                     ; 185 }
 329  0109 84            	pop	a
 330  010a 81            	ret	
 331  010b               LC004:
 332  010b 721e5014      	bset	20500,#7
 333                     ; 153 			D_IO_HIGH(GPIOC, GPIO_Pin_6);
 335  010f 721c500a      	bset	20490,#6
 336                     ; 154 			D_IO_HIGH(GPIOC, GPIO_Pin_5);
 338  0113 721a500a      	bset	20490,#5
 339                     ; 156 			D_IO_HIGH(GPIOC, GPIO_Pin_1);
 341  0117 7212500a      	bset	20490,#1
 342                     ; 157 			D_IO_HIGH(GPIOA, GPIO_Pin_2);
 344  011b 72145000      	bset	20480,#2
 345  011f 81            	ret	
 394                     ; 187 void	disp_backlight(uint8_t mode)
 394                     ; 188 {
 395                     .text:	section	.text,new
 396  0000               _disp_backlight:
 398       00000001      OFST:	set	1
 401                     ; 192 	_backup_backlight2 = 0;
 403  0000 725f0000      	clr	__backup_backlight2
 404  0004 88            	push	a
 405                     ; 194 	if( _dsCount == 0 )
 407  0005 c60000        	ld	a,__dsCount
 408  0008 2611          	jrne	L341
 409                     ; 196 		lcd_clear(0);
 411  000a cd0000        	call	_lcd_clear
 413                     ; 197 		lcd_disp_backlight();
 415  000d cd0000        	call	_lcd_disp_backlight
 417                     ; 198 		_dsCount = 1;
 419  0010 35010000      	mov	__dsCount,#1
 420                     ; 199 		uiInfo._t = _backlight;
 422  0014 550003005f    	mov	_uiInfo+95,__backlight
 424  0019 205c          	jra	L541
 425  001b               L341:
 426                     ; 203 		i = _backlight;
 428  001b c60003        	ld	a,__backlight
 429  001e 6b01          	ld	(OFST+0,sp),a
 430                     ; 204 		i = _backlight_get_index(i);
 432  0020 cd0000        	call	__backlight_get_index
 434  0023 6b01          	ld	(OFST+0,sp),a
 435                     ; 205 		if( uiInfo.enc != 0 )
 437  0025 c60000        	ld	a,_uiInfo
 438  0028 2728          	jreq	L741
 439                     ; 209 			ENC_MOVE_0(1, 5, 1);
 441  002a a540          	bcp	a,#64
 442  002c 260e          	jrne	L151
 445  002e 7b01          	ld	a,(OFST+0,sp)
 446  0030 a102          	cp	a,#2
 447  0032 2404          	jruge	L351
 450  0034 a605          	ld	a,#5
 452  0036 200c          	jp	LC005
 453  0038               L351:
 456  0038 0a01          	dec	(OFST+0,sp)
 457  003a 200e          	jra	L751
 458  003c               L151:
 461  003c 7b01          	ld	a,(OFST+0,sp)
 462  003e a105          	cp	a,#5
 463  0040 2506          	jrult	L161
 466  0042 a601          	ld	a,#1
 467  0044               LC005:
 468  0044 6b01          	ld	(OFST+0,sp),a
 470  0046 2002          	jra	L751
 471  0048               L161:
 474  0048 0c01          	inc	(OFST+0,sp)
 475  004a               L751:
 476                     ; 210 			_backlight = _backlight_get_code(i);
 479  004a 7b01          	ld	a,(OFST+0,sp)
 480  004c cd0000        	call	__backlight_get_code
 482  004f c70003        	ld	__backlight,a
 483  0052               L741:
 484                     ; 213 		if( _dsPrev != i )
 486  0052 c60000        	ld	a,__dsPrev
 487  0055 1101          	cp	a,(OFST+0,sp)
 488  0057 271e          	jreq	L541
 489                     ; 215 			_dsPrev = i;
 491  0059 7b01          	ld	a,(OFST+0,sp)
 492  005b c70000        	ld	__dsPrev,a
 493                     ; 216 			UI_DISP_2Digit(i);
 495  005e 5f            	clrw	x
 496  005f 97            	ld	xl,a
 497  0060 a60a          	ld	a,#10
 498  0062 62            	div	x,a
 499  0063 a602          	ld	a,#2
 500  0065 95            	ld	xh,a
 501  0066 cd0000        	call	_lcd_disp_n
 505  0069 7b01          	ld	a,(OFST+0,sp)
 506  006b 5f            	clrw	x
 507  006c 97            	ld	xl,a
 508  006d a60a          	ld	a,#10
 509  006f 62            	div	x,a
 510  0070 97            	ld	xl,a
 511  0071 a603          	ld	a,#3
 512  0073 95            	ld	xh,a
 513  0074 cd0000        	call	_lcd_disp_n
 516  0077               L541:
 517                     ; 219 }
 520  0077 84            	pop	a
 521  0078 81            	ret	
 560                     ; 223 void	disp_status_loop_messageDn(uint8_t i)
 560                     ; 224 {
 561                     .text:	section	.text,new
 562  0000               _disp_status_loop_messageDn:
 564  0000 88            	push	a
 565       00000000      OFST:	set	0
 568                     ; 225 	lcd_clear_btn();
 570  0001 cd0000        	call	_lcd_clear_btn
 572                     ; 226 	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(/*bS9*/bT7);	/*	¿ÜÃâ*/	}
 574  0004 7b01          	ld	a,(OFST+1,sp)
 575  0006 4a            	dec	a
 576  0007 2608          	jrne	L302
 579  0009 35020000      	mov	__disp_mode,#2
 582  000d ad58          	call	LC007
 584  000f 2049          	jp	LC006
 585  0011               L302:
 586                     ; 227 	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(/*bS10*/bT7);	/*	Á¤Áö*/	}
 588  0011 7b01          	ld	a,(OFST+1,sp)
 589  0013 2608          	jrne	L702
 592  0015 35040000      	mov	__disp_mode,#4
 595  0019 ad4c          	call	LC007
 597  001b 203d          	jp	LC006
 598  001d               L702:
 599                     ; 228 	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(/*bS6*/bT6);	/*	³­¹æ*/	}
 601  001d a102          	cp	a,#2
 602  001f 2611          	jrne	L312
 605  0021 35010000      	mov	__disp_mode,#1
 608  0025 5f            	clrw	x
 609  0026 c60006        	ld	a,_iLF_DEF+6
 610  0029 97            	ld	xl,a
 611  002a d6540c        	ld	a,(21516,x)
 612  002d ca0006        	or	a,_bLF_DEF+6
 614  0030 2028          	jp	LC006
 615  0032               L312:
 616                     ; 229 	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(/*bS7*/bT14);	/*	¿¹¾à*/	}
 618  0032 a103          	cp	a,#3
 619  0034 2611          	jrne	L712
 622  0036 35080000      	mov	__disp_mode,#8
 625  003a 5f            	clrw	x
 626  003b c60041        	ld	a,_iLF_DEF+65
 627  003e 97            	ld	xl,a
 628  003f d6540c        	ld	a,(21516,x)
 629  0042 ca0041        	or	a,_bLF_DEF+65
 631  0045 2013          	jp	LC006
 632  0047               L712:
 633                     ; 230 	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(/*bS8*/bT18);	/*	¹Ýº¹*/	}
 635  0047 a104          	cp	a,#4
 636  0049 2612          	jrne	L502
 639  004b 35100000      	mov	__disp_mode,#16
 642  004f 5f            	clrw	x
 643  0050 c60042        	ld	a,_iLF_DEF+66
 644  0053 97            	ld	xl,a
 645  0054 d6540c        	ld	a,(21516,x)
 646  0057 ca0042        	or	a,_bLF_DEF+66
 647  005a               LC006:
 648  005a d7540c        	ld	(21516,x),a
 649  005d               L502:
 650                     ; 231 	_disp_mode2 = _disp_mode;
 652  005d 5500000000    	mov	__disp_mode2,__disp_mode
 653                     ; 232 	timerClear();
 655  0062 cd0000        	call	_timerClear
 657                     ; 233 }
 660  0065 84            	pop	a
 661  0066 81            	ret	
 662  0067               LC007:
 663  0067 5f            	clrw	x
 664  0068 c60019        	ld	a,_iLF_DEF+25
 665  006b 97            	ld	xl,a
 666  006c d6540c        	ld	a,(21516,x)
 667  006f ca0019        	or	a,_bLF_DEF+25
 668  0072 81            	ret	
 704                     ; 235 void	disp_status_loop_clientDn(uint8_t key)
 704                     ; 236 {
 705                     .text:	section	.text,new
 706  0000               _disp_status_loop_clientDn:
 710                     ; 238 	disp_status_loop_messageDn(key);
 712  0000 cd0000        	call	_disp_status_loop_messageDn
 714                     ; 239 	disp_status_curr_only();
 716  0003 cd0000        	call	_disp_status_curr_only
 718                     ; 240 	lcd_blink_clear();
 721                     ; 241 }
 724  0006 cc0000        	jp	_lcd_blink_clear
 791                     ; 250 void	disp_status_loop_client(uint8_t key)
 791                     ; 251 {
 792                     .text:	section	.text,new
 793  0000               _disp_status_loop_client:
 795  0000 88            	push	a
 796  0001 88            	push	a
 797       00000001      OFST:	set	1
 800                     ; 252 	uint8_t	i = 0;
 802  0002 0f01          	clr	(OFST+0,sp)
 803                     ; 253 	if( __s == 0 )
 805  0004 c60000        	ld	a,___s
 806  0007 2703cc0424    	jrne	L772
 807                     ; 255 		if( _dsCount == 0 )
 809  000c c60000        	ld	a,__dsCount
 810  000f 2618          	jrne	L103
 811                     ; 257 			_dsCount = 10;
 813  0011 350a0000      	mov	__dsCount,#10
 814                     ; 259 			if (start_flag == 0) {
 816  0015 725d0000      	tnz	_start_flag
 817  0019 2603          	jrne	L303
 818                     ; 260 				__sUp = 0;
 820  001b c70000        	ld	___sUp,a
 821  001e               L303:
 822                     ; 262 			start_flag = 0;
 824  001e 725f0000      	clr	_start_flag
 825                     ; 264 			__sDn = 0xff;
 827  0022 35ff0000      	mov	___sDn,#255
 829  0026 cc03a8        	jra	L503
 830  0029               L103:
 831                     ; 267 		else if( _dsCount == 10 )
 833  0029 a10a          	cp	a,#10
 834  002b 264b          	jrne	L703
 835                     ; 269 			if( __sUp == 0 )		_dsCount = 15;	//	N
 837  002d c60000        	ld	a,___sUp
 838  0030 2606          	jrne	L113
 841  0032 350f0000      	mov	__dsCount,#15
 843  0036 203a          	jra	L313
 844  0038               L113:
 845                     ; 270 			else if( __sUp == 1 )	_dsCount = 35;	//	¿¹¾à
 847  0038 a101          	cp	a,#1
 848  003a 2606          	jrne	L513
 851  003c 35230000      	mov	__dsCount,#35
 853  0040 2030          	jra	L313
 854  0042               L513:
 855                     ; 271 			else if( __sUp == 2 )	_dsCount = 25;	//	B
 857  0042 a102          	cp	a,#2
 858  0044 2606          	jrne	L123
 861  0046 35190000      	mov	__dsCount,#25
 863  004a 2026          	jra	L313
 864  004c               L123:
 865                     ; 272 			else if( __sUp == 5 )	_dsCount = 45;	//	J
 867  004c a105          	cp	a,#5
 868  004e 2606          	jrne	L523
 871  0050 352d0000      	mov	__dsCount,#45
 873  0054 201c          	jra	L313
 874  0056               L523:
 875                     ; 273 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //out
 877  0056 a110          	cp	a,#16
 878  0058 260a          	jrne	L133
 881  005a 35100000      	mov	__dsCount,#16
 884  005e 35080000      	mov	___sUp,#8
 886  0062 200e          	jra	L313
 887  0064               L133:
 888                     ; 274 			else if( __sUp == 151 )	_dsCount = 151;	//	N->OUT
 890  0064 a197          	cp	a,#151
 891  0066 2606          	jrne	L533
 894  0068 35970000      	mov	__dsCount,#151
 896  006c 2004          	jra	L313
 897  006e               L533:
 898                     ; 276 				_dsCount = 1;
 900  006e 35010000      	mov	__dsCount,#1
 901  0072               L313:
 902                     ; 277 			disp_status_loop_init();
 904  0072 cd0000        	call	_disp_status_loop_init
 907  0075 cc03a8        	jra	L503
 908  0078               L703:
 909                     ; 279 		else if( _dsCount == 15 )			//	N/OUT
 911  0078 a10f          	cp	a,#15
 912  007a 2657          	jrne	L343
 913                     ; 281 			if( key==1 )		_GOTO(151)	//	To OUT
 915  007c 7b02          	ld	a,(OFST+1,sp)
 916  007e a101          	cp	a,#1
 917  0080 260a          	jrne	L543
 920  0082 35970000      	mov	___sUp,#151
 923  0086 350a0000      	mov	__dsCount,#10
 925  008a 2032          	jra	L743
 926  008c               L543:
 927                     ; 282 			else if( key==2 )	{ _NOT_KEY_ }	//	
 929  008c a102          	cp	a,#2
 930  008e 272e          	jreq	L743
 933                     ; 283 			else if( key==4 )	_GOTO(2)	//	BAN
 935  0090 a104          	cp	a,#4
 936  0092 260a          	jrne	L553
 939  0094 35020000      	mov	___sUp,#2
 942  0098 350a0000      	mov	__dsCount,#10
 944  009c 2020          	jra	L743
 945  009e               L553:
 946                     ; 284 			else if( key==8 )	_GOTO(1)	//	¿¹¾à
 948  009e a108          	cp	a,#8
 949  00a0 260a          	jrne	L163
 952  00a2 35010000      	mov	___sUp,#1
 955  00a6 350a0000      	mov	__dsCount,#10
 957  00aa 2012          	jra	L743
 958  00ac               L163:
 959                     ; 285 			else if( key==16 )	_DN
 961  00ac a110          	cp	a,#16
 962  00ae 2606          	jrne	L563
 965  00b0 35400000      	mov	_uiInfo,#64
 967  00b4 2008          	jra	L743
 968  00b6               L563:
 969                     ; 286 			else if( key==32 )	_UP
 971  00b6 a120          	cp	a,#32
 972  00b8 2604          	jrne	L743
 975  00ba 35010000      	mov	_uiInfo,#1
 976  00be               L743:
 977                     ; 287 			_disp_temp = 1;
 979  00be 35010000      	mov	__disp_temp,#1
 980                     ; 288 			i = disp_status_loop_host_N(key);
 982  00c2 7b02          	ld	a,(OFST+1,sp)
 983  00c4 cd0000        	call	_disp_status_loop_host_N
 985  00c7 6b01          	ld	(OFST+0,sp),a
 986                     ; 289 			if( i==1 )
 988  00c9 4a            	dec	a
 989  00ca 26a9          	jrne	L503
 990                     ; 290 				_key_blink = 1;
 992  00cc 35010000      	mov	__key_blink,#1
 993  00d0 cc03a8        	jra	L503
 994  00d3               L343:
 995                     ; 292 		else if( _dsCount == 151 )			//	OUT/Nan
 997  00d3 a197          	cp	a,#151
 998  00d5 263b          	jrne	L773
 999                     ; 295 			if( key==1 )		_GOTO(0)	//	To Nan	
1001  00d7 7b02          	ld	a,(OFST+1,sp)
1002  00d9 a101          	cp	a,#1
1003  00db 2606          	jrne	L104
1006  00dd 725f0000      	clr	___sUp
1009  00e1 2016          	jp	LC008
1010  00e3               L104:
1011                     ; 296 			else if( key==2 )	{ _NOT_KEY_ }	//	
1013  00e3 a102          	cp	a,#2
1014  00e5 2716          	jreq	L514
1017                     ; 297 			else if( key==4 )	_GOTO(2)	//	BAN
1019  00e7 a104          	cp	a,#4
1020  00e9 2606          	jrne	L114
1023  00eb 35020000      	mov	___sUp,#2
1026  00ef 2008          	jp	LC008
1027  00f1               L114:
1028                     ; 298 			else if( key==8 )	_GOTO(1)	//	¿¹¾à
1030  00f1 a108          	cp	a,#8
1031  00f3 2608          	jrne	L514
1034  00f5 35010000      	mov	___sUp,#1
1037  00f9               LC008:
1040  00f9 350a0000      	mov	__dsCount,#10
1042  00fd               L514:
1043                     ; 299 			else if( key==16 )	{ _NOT_DEF_; }	//	DN
1048                     ; 300 			else if( key==32 )	{ _NOT_DEF_; }	//	UP
1052                     ; 301 			_disp_temp = 1;
1054  00fd 35010000      	mov	__disp_temp,#1
1055                     ; 302 			i = disp_status_loop_host_N2OUT(key);
1057  0101 7b02          	ld	a,(OFST+1,sp)
1058  0103 cd0000        	call	_disp_status_loop_host_N2OUT
1060  0106 6b01          	ld	(OFST+0,sp),a
1061                     ; 303 			if( i==1 )
1063  0108 4a            	dec	a
1064  0109 26c5          	jrne	L503
1065                     ; 304 				_key_blink = 1;
1067  010b 35010000      	mov	__key_blink,#1
1068  010f cc03a8        	jra	L503
1069  0112               L773:
1070                     ; 306 		else if( _dsCount == 16 )			//	OUT
1072  0112 a110          	cp	a,#16
1073  0114 2633          	jrne	L334
1074                     ; 309 			if( key==1 )		_GOTO(0)	//	N
1076  0116 7b02          	ld	a,(OFST+1,sp)
1077  0118 a101          	cp	a,#1
1081  011a 2708          	jreq	LC010
1082                     ; 310 			else if( key==2 )	{ _NOT_KEY_ }	//	
1084  011c a102          	cp	a,#2
1085  011e 2716          	jreq	L734
1088                     ; 311 			else if( key==4 )	_GOTO(0)	//	N
1090  0120 a104          	cp	a,#4
1091  0122 2606          	jrne	L544
1094  0124               LC010:
1096  0124 725f0000      	clr	___sUp
1099  0128 2008          	jp	LC009
1100  012a               L544:
1101                     ; 312 			else if( key==8 )	_GOTO(5)	//	Off
1103  012a a108          	cp	a,#8
1104  012c 2608          	jrne	L734
1107  012e 35050000      	mov	___sUp,#5
1110  0132               LC009:
1113  0132 350a0000      	mov	__dsCount,#10
1114  0136               L734:
1115                     ; 313 			_disp_temp = 1;
1117  0136 35010000      	mov	__disp_temp,#1
1118                     ; 314 			i = disp_status_loop_host_Out(key);
1120  013a cd0000        	call	_disp_status_loop_host_Out
1122  013d 6b01          	ld	(OFST+0,sp),a
1123                     ; 315 			if( i==1 )
1125  013f 4a            	dec	a
1126  0140 26cd          	jrne	L503
1127                     ; 316 				_key_blink = 1;
1129  0142 35010000      	mov	__key_blink,#1
1130  0146 cc03a8        	jra	L503
1131  0149               L334:
1132                     ; 318 		else if( _dsCount == 25 )			//	B
1134  0149 a119          	cp	a,#25
1135  014b 2653          	jrne	L754
1136                     ; 320 			if( key==1 )		_GOTO(0)	//	NAN
1138  014d 7b02          	ld	a,(OFST+1,sp)
1139  014f a101          	cp	a,#1
1140  0151 260a          	jrne	L164
1143  0153 725f0000      	clr	___sUp
1146  0157 350a0000      	mov	__dsCount,#10
1148  015b 2032          	jra	L364
1149  015d               L164:
1150                     ; 321 			else if( key==2 )	{ _NOT_KEY_ }	//	
1152  015d a102          	cp	a,#2
1153  015f 272e          	jreq	L364
1156                     ; 322 			else if( key==4 )	_GOTO(0)	//	NAN
1158  0161 a104          	cp	a,#4
1159  0163 260a          	jrne	L174
1162  0165 725f0000      	clr	___sUp
1165  0169 350a0000      	mov	__dsCount,#10
1167  016d 2020          	jra	L364
1168  016f               L174:
1169                     ; 323 			else if( key==8 )	_GOTO(1)	//	¿¹¾à
1171  016f a108          	cp	a,#8
1172  0171 260a          	jrne	L574
1175  0173 35010000      	mov	___sUp,#1
1178  0177 350a0000      	mov	__dsCount,#10
1180  017b 2012          	jra	L364
1181  017d               L574:
1182                     ; 324 			else if( key==16 )	_DN
1184  017d a110          	cp	a,#16
1185  017f 2606          	jrne	L105
1188  0181 35400000      	mov	_uiInfo,#64
1190  0185 2008          	jra	L364
1191  0187               L105:
1192                     ; 325 			else if( key==32 )	_UP
1194  0187 a120          	cp	a,#32
1195  0189 2604          	jrne	L364
1198  018b 35010000      	mov	_uiInfo,#1
1199  018f               L364:
1200                     ; 327 			i = disp_status_loop_host_B(key);
1202  018f 7b02          	ld	a,(OFST+1,sp)
1203  0191 cd0000        	call	_disp_status_loop_host_B
1205  0194 6b01          	ld	(OFST+0,sp),a
1206                     ; 328 			if( i==1 )
1208  0196 4a            	dec	a
1209  0197 26ad          	jrne	L503
1210                     ; 329 				_key_blink = 1;
1212  0199 35010000      	mov	__key_blink,#1
1213  019d cc03a8        	jra	L503
1214  01a0               L754:
1215                     ; 331 		else if( _dsCount == 35 )			//	¿¹¾à
1217  01a0 a123          	cp	a,#35
1218  01a2 2653          	jrne	L315
1219                     ; 333 			if( key==1 )		_GOTO(0)	//	NAN
1221  01a4 7b02          	ld	a,(OFST+1,sp)
1222  01a6 a101          	cp	a,#1
1223  01a8 260a          	jrne	L515
1226  01aa 725f0000      	clr	___sUp
1229  01ae 350a0000      	mov	__dsCount,#10
1231  01b2 2032          	jra	L715
1232  01b4               L515:
1233                     ; 334 			else if( key==2 )	{ _NOT_KEY_ }	//	
1235  01b4 a102          	cp	a,#2
1236  01b6 272e          	jreq	L715
1239                     ; 335 			else if( key==4 )	_GOTO(2)	//	BAN
1241  01b8 a104          	cp	a,#4
1242  01ba 260a          	jrne	L525
1245  01bc 35020000      	mov	___sUp,#2
1248  01c0 350a0000      	mov	__dsCount,#10
1250  01c4 2020          	jra	L715
1251  01c6               L525:
1252                     ; 336 			else if( key==8 )	_GOTO(0)	//	NAN
1254  01c6 a108          	cp	a,#8
1255  01c8 260a          	jrne	L135
1258  01ca 725f0000      	clr	___sUp
1261  01ce 350a0000      	mov	__dsCount,#10
1263  01d2 2012          	jra	L715
1264  01d4               L135:
1265                     ; 337 			else if( key==16 )	_DN
1267  01d4 a110          	cp	a,#16
1268  01d6 2606          	jrne	L535
1271  01d8 35400000      	mov	_uiInfo,#64
1273  01dc 2008          	jra	L715
1274  01de               L535:
1275                     ; 338 			else if( key==32 )	_UP
1277  01de a120          	cp	a,#32
1278  01e0 2604          	jrne	L715
1281  01e2 35010000      	mov	_uiInfo,#1
1282  01e6               L715:
1283                     ; 340 			i = disp_status_loop_host_Y(key);
1285  01e6 7b02          	ld	a,(OFST+1,sp)
1286  01e8 cd0000        	call	_disp_status_loop_host_Y
1288  01eb 6b01          	ld	(OFST+0,sp),a
1289                     ; 341 			if( i==1 )
1291  01ed 4a            	dec	a
1292  01ee 26ad          	jrne	L503
1293                     ; 342 				_key_blink = 1;
1295  01f0 35010000      	mov	__key_blink,#1
1296  01f4 cc03a8        	jra	L503
1297  01f7               L315:
1298                     ; 344 		else if( _dsCount == 45 )			//	OFF
1300  01f7 a12d          	cp	a,#45
1301  01f9 2637          	jrne	L745
1302                     ; 346 			if( key==1 )		_GOTO(1)	//	Y
1304  01fb 7b02          	ld	a,(OFST+1,sp)
1305  01fd a101          	cp	a,#1
1306  01ff 2606          	jrne	L155
1309  0201 35010000      	mov	___sUp,#1
1312  0205 2016          	jp	LC011
1313  0207               L155:
1314                     ; 347 			else if( key==2 )	_GOTO(2)	//	Ban
1316  0207 a102          	cp	a,#2
1317  0209 2606          	jrne	L555
1320  020b 35020000      	mov	___sUp,#2
1323  020f 200c          	jp	LC011
1324  0211               L555:
1325                     ; 348 			else if( key==4 )	_GOTO(0)	//	N
1327  0211 a104          	cp	a,#4
1331  0213 2704          	jreq	LC012
1332                     ; 349 			else if( key==8 )	_GOTO(0)	//	On
1334  0215 a108          	cp	a,#8
1335  0217 260a          	jrne	L355
1338  0219               LC012:
1340  0219 725f0000      	clr	___sUp
1343  021d               LC011:
1347  021d 350a0000      	mov	__dsCount,#10
1348  0221 7b02          	ld	a,(OFST+1,sp)
1349  0223               L355:
1350                     ; 350 			i = disp_status_loop_host_Off(key);
1352  0223 cd0000        	call	_disp_status_loop_host_Off
1354  0226 6b01          	ld	(OFST+0,sp),a
1355                     ; 351 			if( i==1 )
1357  0228 4a            	dec	a
1358  0229 26c9          	jrne	L503
1359                     ; 352 				_key_blink = 1;
1361  022b 35010000      	mov	__key_blink,#1
1362  022f cc03a8        	jra	L503
1363  0232               L745:
1364                     ; 354 		else if( _dsCount == 1 )
1366  0232 a101          	cp	a,#1
1367  0234 2703cc032b    	jrne	L375
1368                     ; 356 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
1370  0239 c60000        	ld	a,___sUp
1371  023c 2607          	jrne	L575
1374  023e 7b02          	ld	a,(OFST+1,sp)
1375  0240 cd0000        	call	_disp_status_loop_host_N
1378  0243 2014          	jp	LC013
1379  0245               L575:
1380                     ; 357 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
1382  0245 a101          	cp	a,#1
1383  0247 2607          	jrne	L106
1386  0249 7b02          	ld	a,(OFST+1,sp)
1387  024b cd0000        	call	_disp_status_loop_host_Y
1390  024e 2009          	jp	LC013
1391  0250               L106:
1392                     ; 358 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
1394  0250 a102          	cp	a,#2
1395  0252 2607          	jrne	L775
1398  0254 7b02          	ld	a,(OFST+1,sp)
1399  0256 cd0000        	call	_disp_status_loop_host_B
1401  0259               LC013:
1402  0259 6b01          	ld	(OFST+0,sp),a
1403  025b               L775:
1404                     ; 360 			if( i==1 )
1406  025b 7b01          	ld	a,(OFST+0,sp)
1407  025d 4a            	dec	a
1408  025e 2604          	jrne	L706
1409                     ; 361 				_key_blink = 1;
1411  0260 4c            	inc	a
1412  0261 c70000        	ld	__key_blink,a
1413  0264               L706:
1414                     ; 363 			_disp_temp = __sUp==0 ? 1 : 0;
1416  0264 c60000        	ld	a,___sUp
1417  0267 2603          	jrne	L47
1418  0269 4c            	inc	a
1419  026a 2001          	jra	L67
1420  026c               L47:
1421  026c 4f            	clr	a
1422  026d               L67:
1423  026d c70000        	ld	__disp_temp,a
1424                     ; 364 			if( _disp_temp == 0 && _key_blink == 0 )
1426  0270 261c          	jrne	L116
1428  0272 c60000        	ld	a,__key_blink
1429  0275 2617          	jrne	L116
1430                     ; 366 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
1432  0277 c60000        	ld	a,___sUp
1433  027a a101          	cp	a,#1
1434  027c 270c          	jreq	L516
1436  027e a102          	cp	a,#2
1437  0280 2708          	jreq	L516
1439  0282 a105          	cp	a,#5
1440  0284 2704          	jreq	L516
1442  0286 a108          	cp	a,#8
1443  0288 2604          	jrne	L116
1444  028a               L516:
1445                     ; 367 					_disp_temp = 1;
1447  028a 35010000      	mov	__disp_temp,#1
1448  028e               L116:
1449                     ; 370 			if( __sUp == 0 && i == 1 )
1451  028e c60000        	ld	a,___sUp
1452  0291 2609          	jrne	L326
1454  0293 7b01          	ld	a,(OFST+0,sp)
1455  0295 4a            	dec	a
1456  0296 2604          	jrne	L326
1457                     ; 372 marker_1_0:
1457                     ; 373 				_key_blink = 1;
1459  0298 35010000      	mov	__key_blink,#1
1460  029c               L326:
1461                     ; 376 			if( key == 1 )
1463  029c 7b02          	ld	a,(OFST+1,sp)
1464  029e a101          	cp	a,#1
1465  02a0 261e          	jrne	L526
1466                     ; 378 				if( __sUp == 0 )
1468  02a2 c60000        	ld	a,___sUp
1469  02a5 2703cc0339    	jrne	L342
1470                     ; 380 					if( _key_blink == 1 )
1472  02aa c60000        	ld	a,__key_blink
1473  02ad 4a            	dec	a
1474  02ae 276e          	jreq	L752
1475                     ; 381 						goto DisplayEntry;
1477                     ; 382 					disp_status_loop_clientDn(3/*0*/);	//Á¤Á>>YKö - subR/C selection
1479  02b0 a603          	ld	a,#3
1480  02b2 cd0000        	call	_disp_status_loop_clientDn
1482                     ; 383 					_dsCount = 4;
1484  02b5 35040000      	mov	__dsCount,#4
1485                     ; 385 					_disp_temp = 1;
1487  02b9 35010000      	mov	__disp_temp,#1
1489  02bd cc0341        	jra	L336
1490  02c0               L526:
1491                     ; 395 			else if( key == /*2*/7 )
1493  02c0 a107          	cp	a,#7
1494  02c2 260a          	jrne	L736
1495  02c4 cc034f        	jra	L542
1496  02c7               L742:
1497                     ; 400 marker_2s:
1497                     ; 401 				__sUp = 1;
1499  02c7 a601          	ld	a,#1
1500  02c9 cd044c        	call	LC015
1501                     ; 405 				_key_blink = 1;
1502  02cc 2040          	jra	L536
1503  02ce               L736:
1504                     ; 407 			else if( key == 3 )
1506  02ce a103          	cp	a,#3
1507  02d0 2631          	jrne	L546
1508                     ; 409 				if( __sUp == 0 )
1510  02d2 c60000        	ld	a,___sUp
1511  02d5 260f          	jrne	L746
1512                     ; 411 					if( _key_blink == 0 )
1514  02d7 725d0000      	tnz	__key_blink
1515  02db 261d          	jrne	L356
1516                     ; 413 marker_1s:						
1516                     ; 414 						__s = 2;
1518  02dd 35020000      	mov	___s,#2
1519                     ; 415 						_dsCount = 0;
1521  02e1 c70000        	ld	__dsCount,a
1522                     ; 416 						return;
1525  02e4 85            	popw	x
1526  02e5 81            	ret	
1527  02e6               L746:
1528                     ; 419 				else if( __sUp == 1 )
1530  02e6 a101          	cp	a,#1
1531  02e8 2607          	jrne	L556
1532                     ; 421 					if( _key_blink == 0 )
1534  02ea c60000        	ld	a,__key_blink
1535  02ed 260b          	jrne	L356
1536                     ; 422 						goto marker_2;
1538  02ef 205e          	jra	L542
1539  02f1               L556:
1540                     ; 424 				else if( __sUp == 2 )
1542  02f1 a102          	cp	a,#2
1543  02f3 2605          	jrne	L356
1544                     ; 426 					if( _key_blink == 0 )
1546  02f5 c60000        	ld	a,__key_blink
1547  02f8 2772          	jreq	L352
1548                     ; 427 						goto marker_4;
1550  02fa               L356:
1551                     ; 429 				disp_status_loop_init();
1553  02fa cd0000        	call	_disp_status_loop_init
1555                     ; 430 				_key_blink = 0;
1557  02fd 725f0000      	clr	__key_blink
1559  0301 200b          	jra	L536
1560  0303               L546:
1561                     ; 432 			else if( key == /*4*/2 )
1563  0303 a102          	cp	a,#2
1564  0305 2607          	jrne	L536
1565  0307 2063          	jra	L352
1566  0309               L552:
1567                     ; 437 marker_4s:
1567                     ; 438 				__sUp = 2;
1569  0309 a602          	ld	a,#2
1570  030b cd044c        	call	LC015
1571  030e               L536:
1572                     ; 444 			if( _key_blink == 1 )
1574  030e c60000        	ld	a,__key_blink
1575  0311 4a            	dec	a
1576  0312 2703cc03a8    	jrne	L503
1577                     ; 446 				if( _key_sec >= KEY_BLINK_FADE )
1579  0317 c60000        	ld	a,__key_sec
1580  031a a10a          	cp	a,#10
1581  031c 25f6          	jrult	L503
1582  031e               L752:
1583                     ; 448 DisplayEntry:					
1583                     ; 449 					//	reset key timer
1583                     ; 450 					lcd_blink_clear();
1585  031e cd0000        	call	_lcd_blink_clear
1587                     ; 451 					_key_blink = 0;
1589  0321 725f0000      	clr	__key_blink
1590                     ; 452 					_dsCount = 10;
1592  0325 350a0000      	mov	__dsCount,#10
1593  0329 207d          	jra	L503
1594  032b               L375:
1595                     ; 457 		else if( _dsCount == 4 )
1597  032b a104          	cp	a,#4
1598  032d 2657          	jrne	L307
1599                     ; 459 			if( key == 1 )		
1601  032f 7b02          	ld	a,(OFST+1,sp)
1602  0331 a101          	cp	a,#1
1603  0333 2612          	jrne	L507
1604                     ; 467 				_dsCount = 1;	
1606  0335 35010000      	mov	__dsCount,#1
1607                     ; 468 				goto marker_1;	
1608  0339               L342:
1609                     ; 389 marker_1:					
1609                     ; 390 					__sUp = 0;
1611  0339 725f0000      	clr	___sUp
1612                     ; 391 					_dsCount = 0;
1614  033d 725f0000      	clr	__dsCount
1615  0341               L336:
1616                     ; 393 				_dsPrev = 0xff;
1618  0341 35ff0000      	mov	__dsPrev,#255
1620  0345 20c7          	jra	L536
1621  0347               L507:
1622                     ; 470 			else if( key == 2 )	{	_dsCount = 1;	goto marker_2;	}
1624  0347 a102          	cp	a,#2
1625  0349 2615          	jrne	L117
1628  034b 35010000      	mov	__dsCount,#1
1630  034f               L542:
1631                     ; 397 marker_2:				
1631                     ; 398 				if( __sUp == 1 && _key_blink == 1 )
1633  034f c60000        	ld	a,___sUp
1634  0352 4a            	dec	a
1635  0353 2703cc02c7    	jrne	L742
1637  0358 c60000        	ld	a,__key_blink
1638  035b 4a            	dec	a
1639  035c 26f7          	jrne	L742
1640                     ; 399 					goto DisplayEntry;
1642  035e 20be          	jra	L752
1643  0360               L117:
1644                     ; 471 			else if( key == 3 )	{	}
1646  0360 a103          	cp	a,#3
1647  0362 2717          	jreq	L707
1649                     ; 472 			else if( key == 4 )	{	_dsCount = 1;	goto marker_4;	}
1651  0364 a104          	cp	a,#4
1652  0366 2613          	jrne	L707
1655  0368 35010000      	mov	__dsCount,#1
1657  036c               L352:
1658                     ; 434 marker_4:				
1658                     ; 435 				if( __sUp == 2 && _key_blink == 1 )
1660  036c c60000        	ld	a,___sUp
1661  036f a102          	cp	a,#2
1662  0371 2696          	jrne	L552
1664  0373 c60000        	ld	a,__key_blink
1665  0376 4a            	dec	a
1666  0377 2690          	jrne	L552
1667                     ; 436 					goto DisplayEntry;
1669  0379 20a3          	jra	L752
1670  037b               L707:
1671                     ; 474 			if( uiInfo.enc != 0 )
1673  037b c60000        	ld	a,_uiInfo
1674  037e 2728          	jreq	L503
1675                     ; 475 				_dsCount = 10;
1677  0380 350a0000      	mov	__dsCount,#10
1678  0384 2022          	jra	L503
1679  0386               L307:
1680                     ; 477 		else if( _dsCount == 5 )
1682  0386 a105          	cp	a,#5
1683  0388 260e          	jrne	L727
1684                     ; 479 			disp_status_loop_init();
1686  038a cd0000        	call	_disp_status_loop_init
1688                     ; 480 			disp_status_loop_clientDn(1);	//	¿ÜÃâ¸ðµå Ç¥½Ã
1690  038d a601          	ld	a,#1
1691  038f cd0000        	call	_disp_status_loop_clientDn
1693                     ; 481 			_dsCount = 6;
1695  0392 35060000      	mov	__dsCount,#6
1697  0396 2010          	jra	L503
1698  0398               L727:
1699                     ; 483 		else if( _dsCount == 6 )
1701  0398 a106          	cp	a,#6
1702  039a 260c          	jrne	L503
1703                     ; 485 			if( _disp_mode != _disp_mode2 )
1705  039c c60000        	ld	a,__disp_mode
1706  039f c10000        	cp	a,__disp_mode2
1707  03a2 2704          	jreq	L503
1708                     ; 487 				_dsCount = 0;
1710  03a4 725f0000      	clr	__dsCount
1711  03a8               L503:
1712                     ; 491 		if( _dsCount == 15 || _dsCount == 16 || _dsCount == 25 || 
1712                     ; 492 				_dsCount == 35 || _dsCount == 46
1712                     ; 493 #if defined (_RC_DW_)
1712                     ; 494 				|| _dsCount == 151 
1712                     ; 495 #endif
1712                     ; 496 				)
1714  03a8 c60000        	ld	a,__dsCount
1715  03ab a10f          	cp	a,#15
1716  03ad 2714          	jreq	L147
1718  03af a110          	cp	a,#16
1719  03b1 2710          	jreq	L147
1721  03b3 a119          	cp	a,#25
1722  03b5 270c          	jreq	L147
1724  03b7 a123          	cp	a,#35
1725  03b9 2708          	jreq	L147
1727  03bb a12e          	cp	a,#46
1728  03bd 2704          	jreq	L147
1730  03bf a197          	cp	a,#151
1731  03c1 263c          	jrne	L031
1732  03c3               L147:
1733                     ; 498 			if( _disp_mode != _disp_mode2 || packet_changed == 1)
1735  03c3 c60000        	ld	a,__disp_mode
1736  03c6 c10000        	cp	a,__disp_mode2
1737  03c9 2606          	jrne	L557
1739  03cb c60000        	ld	a,_packet_changed
1740  03ce 4a            	dec	a
1741  03cf 262e          	jrne	L031
1742  03d1               L557:
1743                     ; 500 				packet_changed = 0;
1745  03d1 725f0000      	clr	_packet_changed
1746                     ; 501 				_dsCount = 10;
1748  03d5 350a0000      	mov	__dsCount,#10
1749                     ; 502 				_key_blink = 0;
1751  03d9 725f0000      	clr	__key_blink
1752                     ; 504 				if( _disp_mode2 == 0x01 )		
1754  03dd c60000        	ld	a,__disp_mode2
1755  03e0 a101          	cp	a,#1
1756  03e2 2606          	jrne	L757
1757                     ; 506 					__sUp = 0; 
1759  03e4 725f0000      	clr	___sUp
1761  03e8 2035          	jra	L167
1762  03ea               L757:
1763                     ; 508 				else if( _disp_mode2 == 0x02 )	
1765  03ea a102          	cp	a,#2
1766  03ec 2606          	jrne	L367
1767                     ; 513 					__sUp = 16;
1769  03ee 35100000      	mov	___sUp,#16
1770                     ; 514 					return;
1772  03f2 200b          	jra	L031
1773  03f4               L367:
1774                     ; 516 				else if( _disp_mode2 == 0x04 )	
1776  03f4 a104          	cp	a,#4
1777  03f6 2609          	jrne	L767
1778                     ; 518 					disp_status_loop_init();
1780  03f8 cd0000        	call	_disp_status_loop_init
1782                     ; 519 					disp_status_loop_clientDn(0);	// Á¤Áö
1784  03fb 4f            	clr	a
1785  03fc cd0000        	call	_disp_status_loop_clientDn
1787                     ; 520 					return;
1788  03ff               L031:
1791  03ff 85            	popw	x
1792  0400 81            	ret	
1793  0401               L767:
1794                     ; 522 				else if( _disp_mode2 == 0x08 )	
1796  0401 a108          	cp	a,#8
1797  0403 2606          	jrne	L377
1798                     ; 524 					__sUp = 1;
1800  0405 35010000      	mov	___sUp,#1
1801                     ; 525 					_key_sec = _key_min = _key_hour = 0;
1803  0409 2008          	jp	LC014
1804  040b               L377:
1805                     ; 528 				else if( _disp_mode2 == 0x10 )	
1807  040b a110          	cp	a,#16
1808  040d 26f0          	jrne	L031
1809                     ; 530 					__sUp = 2;
1811  040f 35020000      	mov	___sUp,#2
1812                     ; 531 					_key_sec = _key_min = _key_hour = 0;
1814  0413               LC014:
1816  0413 725f0000      	clr	__key_hour
1817  0417 725f0000      	clr	__key_min
1818  041b 725f0000      	clr	__key_sec
1820  041f               L167:
1821                     ; 537 				disp_status_loop_init();
1823  041f cd0000        	call	_disp_status_loop_init
1825  0422 20db          	jra	L031
1826                     ; 535 					return;
1828  0424               L772:
1829                     ; 541 	else if( __s == 2 )
1831  0424 a102          	cp	a,#2
1832  0426 26d7          	jrne	L031
1833                     ; 543 		disp_backlight(0);
1835  0428 4f            	clr	a
1836  0429 cd0000        	call	_disp_backlight
1838                     ; 544 		if( key == 1 || key == 2 || key == 3 || key == 4 )
1840  042c 7b02          	ld	a,(OFST+1,sp)
1841  042e a101          	cp	a,#1
1842  0430 270c          	jreq	L1101
1844  0432 a102          	cp	a,#2
1845  0434 2708          	jreq	L1101
1847  0436 a103          	cp	a,#3
1848  0438 2704          	jreq	L1101
1850  043a a104          	cp	a,#4
1851  043c 26c1          	jrne	L031
1852  043e               L1101:
1853                     ; 546 			__s = 0;
1855  043e 725f0000      	clr	___s
1856                     ; 547 			_dsCount = 0;
1858  0442 725f0000      	clr	__dsCount
1859                     ; 548 			file_update2(0);
1861  0446 4f            	clr	a
1862  0447 cd0000        	call	_file_update2
1864                     ; 551 }
1866  044a 20b3          	jra	L031
1867  044c               LC015:
1868  044c c70000        	ld	___sUp,a
1869                     ; 402 				_dsPrev = 0xff;
1871  044f 35ff0000      	mov	__dsPrev,#255
1872                     ; 403 				disp_status_loop_message(__sUp);
1874  0453 cd0000        	call	_disp_status_loop_message
1876                     ; 405 				_key_blink = 1;
1878  0456 35010000      	mov	__key_blink,#1
1879  045a 81            	ret	
1974                     	xref	_disp_status_loop_host_N2OUT
1975                     	xref	_disp_status_loop_host_Out
1976                     	xref	_disp_status_loop_host_Off
1977                     	xref	_timerClear
1978                     	xdef	___rcCb
1979                     	xdef	__abc
1980                     	xref	__backlight_get_code
1981                     	xref	__backlight_get_index
1982                     	xdef	__led_s
1983                     	xdef	__led_j
1984                     	xdef	__led_i
1985                     	xdef	__led_key_pwmCount
1986                     	xdef	__led_key_pwmIndex
1987                     	xref	__led_key_onOff
1988                     	xref	__led_key_status
1989                     	xref	__led_key_pin
1990                     	xref	__led_key_port
1991                     	xref	_start_flag
1992                     	xref	__backup_backlight2
1993                     	xref	_packet_changed
1994                     	xref	__disp_temp
1995                     	xdef	__backlight
1996                     	xdef	_lcd_pwmCount2
1997                     	xdef	_lcd_pwmIndex2
1998                     	xdef	__lcdEnable
1999                     	switch	.bss
2000  0000               __lcdTimer:
2001  0000 00000000      	ds.b	4
2002                     	xdef	__lcdTimer
2003                     	xdef	_disp_backlight
2004                     	xref	_file_update2
2005                     	xref	__key_blink
2006                     	xref	__key_hour
2007                     	xref	__key_min
2008                     	xref	__key_sec
2009                     	xref	__disp_mode2
2010                     	xref	__disp_mode
2011                     	xdef	_disp_status_loop_clientDn
2012                     	xref	_disp_status_curr_only
2013                     	xref	_disp_status_loop_init
2014                     	xref	_disp_status_loop_host_B
2015                     	xref	_disp_status_loop_host_Y
2016                     	xref	_disp_status_loop_host_N
2017                     	xdef	_disp_status_loop_messageDn
2018                     	xref	_disp_status_loop_message
2019                     	xref	__dsPrev
2020                     	xref	__dsCount
2021                     	xdef	_disp_status_loop_client
2022                     	xref	___sDn
2023                     	xref	___sUp
2024                     	xref	___s
2025                     	xref	_lcd_blink_clear
2026                     	xref	_lcd_disp_n
2027                     	xref	_lcd_clear
2028                     	xref	_lcd_disp_backlight
2029                     	xref	_lcd_clear_btn
2030                     	xref	_iLF_DEF
2031                     	xref	_bLF_DEF
2032                     	xref	_uiInfo
2052                     	end
