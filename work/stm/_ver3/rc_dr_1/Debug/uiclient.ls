   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               __lcdEnable:
  24  0000 00            	dc.b	0
  25  0001               __backlight:
  26  0001 02            	dc.b	2
  27  0002               _lcd_pwmIndex2:
  28  0002 00            	dc.b	0
  29  0003               _lcd_pwmCount2:
  30  0003 61            	dc.b	97
  72                     ; 31 void	__rcCb(void)
  72                     ; 32 {
  74                     .text:	section	.text,new
  75  0000               ___rcCb:
  77  0000 88            	push	a
  78       00000001      OFST:	set	1
  81                     ; 34 	i = _backup_backlight2==0 ? _backlight : BACKLIGHT_MAX_LEVEL;
  83  0001 c60000        	ld	a,__backup_backlight2
  84  0004 2605          	jrne	L6
  85  0006 c60001        	ld	a,__backlight
  86  0009 2002          	jra	L01
  87  000b               L6:
  88  000b a660          	ld	a,#96
  89  000d               L01:
  90                     ; 36 	if( i==BACKLIGHT_MAX_LEVEL )
  92  000d a160          	cp	a,#96
  93  000f 2602          	jrne	L52
  94                     ; 37 		i = 20;
  96  0011 a614          	ld	a,#20
  97  0013               L52:
  98  0013 6b01          	ld	(OFST+0,sp),a
  99                     ; 46 	if( lcd_pwmIndex2 <= i )	{	PWM_HIGH;	}
 101  0015 c60002        	ld	a,_lcd_pwmIndex2
 102  0018 1101          	cp	a,(OFST+0,sp)
 103  001a 2206          	jrugt	L72
 106  001c 721c5014      	bset	20500,#6
 108  0020 2004          	jra	L13
 109  0022               L72:
 110                     ; 47 	else					{	PWM_LOW;	}
 112  0022 721d5014      	bres	20500,#6
 113  0026               L13:
 114                     ; 49 	lcd_pwmIndex2++;
 116  0026 725c0002      	inc	_lcd_pwmIndex2
 117                     ; 50 	if( lcd_pwmIndex2 == lcd_pwmCount2 )
 119  002a c60002        	ld	a,_lcd_pwmIndex2
 120  002d c10003        	cp	a,_lcd_pwmCount2
 121  0030 2604          	jrne	L33
 122                     ; 51 		lcd_pwmIndex2 = 0;
 124  0032 725f0002      	clr	_lcd_pwmIndex2
 125  0036               L33:
 126                     ; 52 }
 129  0036 84            	pop	a
 130  0037 81            	ret	
 179                     ; 57 void	disp_backlight(uint8_t mode)
 179                     ; 58 {
 180                     .text:	section	.text,new
 181  0000               _disp_backlight:
 183       00000001      OFST:	set	1
 186                     ; 62 	_backup_backlight2 = 0;
 188  0000 725f0000      	clr	__backup_backlight2
 189  0004 88            	push	a
 190                     ; 64 	if( _dsCount == 0 )
 192  0005 c60000        	ld	a,__dsCount
 193  0008 2611          	jrne	L35
 194                     ; 66 		lcd_clear(0);
 196  000a cd0000        	call	_lcd_clear
 198                     ; 67 		lcd_disp_backlight();
 200  000d cd0000        	call	_lcd_disp_backlight
 202                     ; 68 		_dsCount = 1;
 204  0010 35010000      	mov	__dsCount,#1
 205                     ; 69 		uiInfo._t = _backlight;
 207  0014 550001005f    	mov	_uiInfo+95,__backlight
 209  0019 205c          	jra	L55
 210  001b               L35:
 211                     ; 73 		i = _backlight;
 213  001b c60001        	ld	a,__backlight
 214  001e 6b01          	ld	(OFST+0,sp),a
 215                     ; 74 		i = _backlight_get_index(i);
 217  0020 cd0000        	call	__backlight_get_index
 219  0023 6b01          	ld	(OFST+0,sp),a
 220                     ; 75 		if( uiInfo.enc != 0 )
 222  0025 c60000        	ld	a,_uiInfo
 223  0028 2728          	jreq	L75
 224                     ; 79 			ENC_MOVE_0(1, 5, 1);
 226  002a a540          	bcp	a,#64
 227  002c 260e          	jrne	L16
 230  002e 7b01          	ld	a,(OFST+0,sp)
 231  0030 a102          	cp	a,#2
 232  0032 2404          	jruge	L36
 235  0034 a605          	ld	a,#5
 237  0036 200c          	jp	LC001
 238  0038               L36:
 241  0038 0a01          	dec	(OFST+0,sp)
 242  003a 200e          	jra	L76
 243  003c               L16:
 246  003c 7b01          	ld	a,(OFST+0,sp)
 247  003e a105          	cp	a,#5
 248  0040 2506          	jrult	L17
 251  0042 a601          	ld	a,#1
 252  0044               LC001:
 253  0044 6b01          	ld	(OFST+0,sp),a
 255  0046 2002          	jra	L76
 256  0048               L17:
 259  0048 0c01          	inc	(OFST+0,sp)
 260  004a               L76:
 261                     ; 80 			_backlight = _backlight_get_code(i);
 264  004a 7b01          	ld	a,(OFST+0,sp)
 265  004c cd0000        	call	__backlight_get_code
 267  004f c70001        	ld	__backlight,a
 268  0052               L75:
 269                     ; 83 		if( _dsPrev != i )
 271  0052 c60000        	ld	a,__dsPrev
 272  0055 1101          	cp	a,(OFST+0,sp)
 273  0057 271e          	jreq	L55
 274                     ; 85 			_dsPrev = i;
 276  0059 7b01          	ld	a,(OFST+0,sp)
 277  005b c70000        	ld	__dsPrev,a
 278                     ; 86 			UI_DISP_2Digit(i);
 280  005e 5f            	clrw	x
 281  005f 97            	ld	xl,a
 282  0060 a60a          	ld	a,#10
 283  0062 62            	div	x,a
 284  0063 a602          	ld	a,#2
 285  0065 95            	ld	xh,a
 286  0066 cd0000        	call	_lcd_disp_n
 290  0069 7b01          	ld	a,(OFST+0,sp)
 291  006b 5f            	clrw	x
 292  006c 97            	ld	xl,a
 293  006d a60a          	ld	a,#10
 294  006f 62            	div	x,a
 295  0070 97            	ld	xl,a
 296  0071 a603          	ld	a,#3
 297  0073 95            	ld	xh,a
 298  0074 cd0000        	call	_lcd_disp_n
 301  0077               L55:
 302                     ; 89 }
 305  0077 84            	pop	a
 306  0078 81            	ret	
 345                     ; 93 void	disp_status_loop_messageDn(uint8_t i)
 345                     ; 94 {
 346                     .text:	section	.text,new
 347  0000               _disp_status_loop_messageDn:
 349  0000 88            	push	a
 350       00000000      OFST:	set	0
 353                     ; 95 	lcd_clear_btn();
 355  0001 cd0000        	call	_lcd_clear_btn
 357                     ; 96 	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(/*bS9*/bP20);	/*	ø‹√‚*/	}
 359  0004 7b01          	ld	a,(OFST+1,sp)
 360  0006 4a            	dec	a
 361  0007 2611          	jrne	L311
 364  0009 35020000      	mov	__disp_mode,#2
 367  000d 5f            	clrw	x
 368  000e c60039        	ld	a,_iLF_DEF+57
 369  0011 97            	ld	xl,a
 370  0012 d6540c        	ld	a,(21516,x)
 371  0015 ca0039        	or	a,_bLF_DEF+57
 373  0018 2052          	jp	LC002
 374  001a               L311:
 375                     ; 97 	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(/*bS10*/bP13);	/*	¡§¡ˆ*/	}
 377  001a 7b01          	ld	a,(OFST+1,sp)
 378  001c 2611          	jrne	L711
 381  001e 35040000      	mov	__disp_mode,#4
 384  0022 5f            	clrw	x
 385  0023 c60010        	ld	a,_iLF_DEF+16
 386  0026 97            	ld	xl,a
 387  0027 d6540c        	ld	a,(21516,x)
 388  002a ca0010        	or	a,_bLF_DEF+16
 390  002d 203d          	jp	LC002
 391  002f               L711:
 392                     ; 98 	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(/*bS6*/bP15);	/*	≥≠πÊ*/	}
 394  002f a102          	cp	a,#2
 395  0031 2611          	jrne	L321
 398  0033 35010000      	mov	__disp_mode,#1
 401  0037 5f            	clrw	x
 402  0038 c6003f        	ld	a,_iLF_DEF+63
 403  003b 97            	ld	xl,a
 404  003c d6540c        	ld	a,(21516,x)
 405  003f ca003f        	or	a,_bLF_DEF+63
 407  0042 2028          	jp	LC002
 408  0044               L321:
 409                     ; 99 	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(/*bS7*/bP10);	/*	øπæ‡*/	}
 411  0044 a103          	cp	a,#3
 412  0046 2611          	jrne	L721
 415  0048 35080000      	mov	__disp_mode,#8
 418  004c 5f            	clrw	x
 419  004d c6003a        	ld	a,_iLF_DEF+58
 420  0050 97            	ld	xl,a
 421  0051 d6540c        	ld	a,(21516,x)
 422  0054 ca003a        	or	a,_bLF_DEF+58
 424  0057 2013          	jp	LC002
 425  0059               L721:
 426                     ; 100 	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(/*bS8*/bP9);	/*	π›∫π*/	}
 428  0059 a104          	cp	a,#4
 429  005b 2612          	jrne	L511
 432  005d 35100000      	mov	__disp_mode,#16
 435  0061 5f            	clrw	x
 436  0062 c60031        	ld	a,_iLF_DEF+49
 437  0065 97            	ld	xl,a
 438  0066 d6540c        	ld	a,(21516,x)
 439  0069 ca0031        	or	a,_bLF_DEF+49
 440  006c               LC002:
 441  006c d7540c        	ld	(21516,x),a
 442  006f               L511:
 443                     ; 101 	_disp_mode2 = _disp_mode;
 445  006f 5500000000    	mov	__disp_mode2,__disp_mode
 446                     ; 102 	timerClear();
 448  0074 cd0000        	call	_timerClear
 450                     ; 103 }
 453  0077 84            	pop	a
 454  0078 81            	ret	
 490                     ; 105 void	disp_status_loop_clientDn(uint8_t key)
 490                     ; 106 {
 491                     .text:	section	.text,new
 492  0000               _disp_status_loop_clientDn:
 496                     ; 108 	disp_status_loop_messageDn(key);
 498  0000 cd0000        	call	_disp_status_loop_messageDn
 500                     ; 109 	disp_status_curr_only();
 502  0003 cd0000        	call	_disp_status_curr_only
 504                     ; 110 	lcd_blink_clear();
 507                     ; 111 }
 510  0006 cc0000        	jp	_lcd_blink_clear
 576                     ; 116 void	disp_status_loop_client(uint8_t key)
 576                     ; 117 {
 577                     .text:	section	.text,new
 578  0000               _disp_status_loop_client:
 580  0000 88            	push	a
 581  0001 88            	push	a
 582       00000001      OFST:	set	1
 585                     ; 118 	uint8_t	i = 0;
 587  0002 0f01          	clr	(OFST+0,sp)
 588                     ; 119 	if( __s == 0 )
 590  0004 c60000        	ld	a,___s
 591  0007 2703cc0408    	jrne	L702
 592                     ; 121 		if( _dsCount == 0 )
 594  000c c60000        	ld	a,__dsCount
 595  000f 2618          	jrne	L112
 596                     ; 123 			_dsCount = 10;
 598  0011 350a0000      	mov	__dsCount,#10
 599                     ; 125 			if (start_flag == 0) {
 601  0015 725d0000      	tnz	_start_flag
 602  0019 2603          	jrne	L312
 603                     ; 126 				__sUp = 0;
 605  001b c70000        	ld	___sUp,a
 606  001e               L312:
 607                     ; 128 			start_flag = 0;
 609  001e 725f0000      	clr	_start_flag
 610                     ; 130 			__sDn = 0xff;
 612  0022 35ff0000      	mov	___sDn,#255
 614  0026 cc0393        	jra	L512
 615  0029               L112:
 616                     ; 133 		else if( _dsCount == 10 )
 618  0029 a10a          	cp	a,#10
 619  002b 2641          	jrne	L712
 620                     ; 135 			if( __sUp == 0 )		_dsCount = 15;	//	N
 622  002d c60000        	ld	a,___sUp
 623  0030 2606          	jrne	L122
 626  0032 350f0000      	mov	__dsCount,#15
 628  0036 2030          	jra	L322
 629  0038               L122:
 630                     ; 136 			else if( __sUp == 1 )	_dsCount = 35;	//	Y
 632  0038 a101          	cp	a,#1
 633  003a 2606          	jrne	L522
 636  003c 35230000      	mov	__dsCount,#35
 638  0040 2026          	jra	L322
 639  0042               L522:
 640                     ; 137 			else if( __sUp == 2 )	_dsCount = 25;	//	B
 642  0042 a102          	cp	a,#2
 643  0044 2606          	jrne	L132
 646  0046 35190000      	mov	__dsCount,#25
 648  004a 201c          	jra	L322
 649  004c               L132:
 650                     ; 138 			else if( __sUp == 5 )	_dsCount = 45;	//	J
 652  004c a105          	cp	a,#5
 653  004e 2606          	jrne	L532
 656  0050 352d0000      	mov	__dsCount,#45
 658  0054 2012          	jra	L322
 659  0056               L532:
 660                     ; 139 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //out
 662  0056 a110          	cp	a,#16
 663  0058 260a          	jrne	L142
 666  005a 35100000      	mov	__dsCount,#16
 669  005e 35080000      	mov	___sUp,#8
 671  0062 2004          	jra	L322
 672  0064               L142:
 673                     ; 141 				_dsCount = 1;
 675  0064 35010000      	mov	__dsCount,#1
 676  0068               L322:
 677                     ; 142 			disp_status_loop_init();
 679  0068 cd0000        	call	_disp_status_loop_init
 682  006b cc0393        	jra	L512
 683  006e               L712:
 684                     ; 144 		else if( _dsCount == 15 )			//	N/Out
 686  006e a10f          	cp	a,#15
 687  0070 2661          	jrne	L742
 688                     ; 146 			if( key==1 )		_GOTO(1)	//	Y
 690  0072 7b02          	ld	a,(OFST+1,sp)
 691  0074 a101          	cp	a,#1
 692  0076 260a          	jrne	L152
 695  0078 35010000      	mov	___sUp,#1
 698  007c 350a0000      	mov	__dsCount,#10
 700  0080 203c          	jra	L352
 701  0082               L152:
 702                     ; 147 			else if( key==2 )	_GOTO(2)	//	Ban
 704  0082 a102          	cp	a,#2
 705  0084 260a          	jrne	L552
 708  0086 35020000      	mov	___sUp,#2
 711  008a 350a0000      	mov	__dsCount,#10
 713  008e 202e          	jra	L352
 714  0090               L552:
 715                     ; 148 			else if( key==4 )	_GOTO(16)	//	Out
 717  0090 a104          	cp	a,#4
 718  0092 260a          	jrne	L162
 721  0094 35100000      	mov	___sUp,#16
 724  0098 350a0000      	mov	__dsCount,#10
 726  009c 2020          	jra	L352
 727  009e               L162:
 728                     ; 149 			else if( key==8 )	_GOTO(5)	//	Off
 730  009e a108          	cp	a,#8
 731  00a0 260a          	jrne	L562
 734  00a2 35050000      	mov	___sUp,#5
 737  00a6 350a0000      	mov	__dsCount,#10
 739  00aa 2012          	jra	L352
 740  00ac               L562:
 741                     ; 150 			else if( key==16 )	_DN
 743  00ac a110          	cp	a,#16
 744  00ae 2606          	jrne	L172
 747  00b0 35400000      	mov	_uiInfo,#64
 749  00b4 2008          	jra	L352
 750  00b6               L172:
 751                     ; 151 			else if( key==32 )	_UP
 753  00b6 a120          	cp	a,#32
 754  00b8 2604          	jrne	L352
 757  00ba 35010000      	mov	_uiInfo,#1
 758  00be               L352:
 759                     ; 152 			_disp_temp = 1;
 761  00be 35010000      	mov	__disp_temp,#1
 762                     ; 153 			i = disp_status_loop_host_N(key);
 764  00c2 7b02          	ld	a,(OFST+1,sp)
 765  00c4 cd0000        	call	_disp_status_loop_host_N
 767  00c7 6b01          	ld	(OFST+0,sp),a
 768                     ; 154 			if( i==1 )
 770  00c9 4a            	dec	a
 771  00ca 269f          	jrne	L512
 772                     ; 155 				_key_blink = 1;
 774  00cc 35010000      	mov	__key_blink,#1
 775  00d0 cc0393        	jra	L512
 776  00d3               L742:
 777                     ; 157 		else if( _dsCount == 16 )			//	OUT
 779  00d3 a110          	cp	a,#16
 780  00d5 2641          	jrne	L303
 781                     ; 159 			if( key==1 )		_GOTO(1)	//	Y
 783  00d7 7b02          	ld	a,(OFST+1,sp)
 784  00d9 a101          	cp	a,#1
 785  00db 2606          	jrne	L503
 788  00dd 35010000      	mov	___sUp,#1
 791  00e1 201c          	jp	LC003
 792  00e3               L503:
 793                     ; 160 			else if( key==2 )	_GOTO(2)	//	Ban
 795  00e3 a102          	cp	a,#2
 796  00e5 2606          	jrne	L113
 799  00e7 35020000      	mov	___sUp,#2
 802  00eb 2012          	jp	LC003
 803  00ed               L113:
 804                     ; 161 			else if( key==4 )	_GOTO(0)	//	N
 806  00ed a104          	cp	a,#4
 807  00ef 2606          	jrne	L513
 810  00f1 725f0000      	clr	___sUp
 813  00f5 2008          	jp	LC003
 814  00f7               L513:
 815                     ; 162 			else if( key==8 )	_GOTO(5)	//	Off
 817  00f7 a108          	cp	a,#8
 818  00f9 2608          	jrne	L703
 821  00fb 35050000      	mov	___sUp,#5
 824  00ff               LC003:
 828  00ff 350a0000      	mov	__dsCount,#10
 829  0103               L703:
 830                     ; 163 			_disp_temp = 1;
 832  0103 35010000      	mov	__disp_temp,#1
 833                     ; 164 			i = disp_status_loop_host_Out(key);
 835  0107 7b02          	ld	a,(OFST+1,sp)
 836  0109 cd0000        	call	_disp_status_loop_host_Out
 838  010c 6b01          	ld	(OFST+0,sp),a
 839                     ; 165 			if( i==1 )
 841  010e 4a            	dec	a
 842  010f 26bf          	jrne	L512
 843                     ; 166 				_key_blink = 1;
 845  0111 35010000      	mov	__key_blink,#1
 846  0115 cc0393        	jra	L512
 847  0118               L303:
 848                     ; 168 		else if( _dsCount == 25 )			//	B
 850  0118 a119          	cp	a,#25
 851  011a 2661          	jrne	L723
 852                     ; 170 			if( key==1 )		_GOTO(1)	//	Y
 854  011c 7b02          	ld	a,(OFST+1,sp)
 855  011e a101          	cp	a,#1
 856  0120 260a          	jrne	L133
 859  0122 35010000      	mov	___sUp,#1
 862  0126 350a0000      	mov	__dsCount,#10
 864  012a 203c          	jra	L333
 865  012c               L133:
 866                     ; 171 			else if( key==2 )	_GOTO(0)	//	N
 868  012c a102          	cp	a,#2
 869  012e 260a          	jrne	L533
 872  0130 725f0000      	clr	___sUp
 875  0134 350a0000      	mov	__dsCount,#10
 877  0138 202e          	jra	L333
 878  013a               L533:
 879                     ; 172 			else if( key==4 )	_GOTO(0)	//	N
 881  013a a104          	cp	a,#4
 882  013c 260a          	jrne	L143
 885  013e 725f0000      	clr	___sUp
 888  0142 350a0000      	mov	__dsCount,#10
 890  0146 2020          	jra	L333
 891  0148               L143:
 892                     ; 173 			else if( key==8 )	_GOTO(5)	//	Off
 894  0148 a108          	cp	a,#8
 895  014a 260a          	jrne	L543
 898  014c 35050000      	mov	___sUp,#5
 901  0150 350a0000      	mov	__dsCount,#10
 903  0154 2012          	jra	L333
 904  0156               L543:
 905                     ; 174 			else if( key==16 )	_DN
 907  0156 a110          	cp	a,#16
 908  0158 2606          	jrne	L153
 911  015a 35400000      	mov	_uiInfo,#64
 913  015e 2008          	jra	L333
 914  0160               L153:
 915                     ; 175 			else if( key==32 )	_UP
 917  0160 a120          	cp	a,#32
 918  0162 2604          	jrne	L333
 921  0164 35010000      	mov	_uiInfo,#1
 922  0168               L333:
 923                     ; 176 			_disp_temp = 1;
 925  0168 35010000      	mov	__disp_temp,#1
 926                     ; 177 			i = disp_status_loop_host_B(key);
 928  016c 7b02          	ld	a,(OFST+1,sp)
 929  016e cd0000        	call	_disp_status_loop_host_B
 931  0171 6b01          	ld	(OFST+0,sp),a
 932                     ; 178 			if( i==1 )
 934  0173 4a            	dec	a
 935  0174 269f          	jrne	L512
 936                     ; 179 				_key_blink = 1;
 938  0176 35010000      	mov	__key_blink,#1
 939  017a cc0393        	jra	L512
 940  017d               L723:
 941                     ; 181 		else if( _dsCount == 35 )			//	Y
 943  017d a123          	cp	a,#35
 944  017f 2661          	jrne	L363
 945                     ; 183 			if( key==1 )		_GOTO(0)	//	N
 947  0181 7b02          	ld	a,(OFST+1,sp)
 948  0183 a101          	cp	a,#1
 949  0185 260a          	jrne	L563
 952  0187 725f0000      	clr	___sUp
 955  018b 350a0000      	mov	__dsCount,#10
 957  018f 203c          	jra	L763
 958  0191               L563:
 959                     ; 184 			else if( key==2 )	_GOTO(2)	//	Ban
 961  0191 a102          	cp	a,#2
 962  0193 260a          	jrne	L173
 965  0195 35020000      	mov	___sUp,#2
 968  0199 350a0000      	mov	__dsCount,#10
 970  019d 202e          	jra	L763
 971  019f               L173:
 972                     ; 185 			else if( key==4 )	_GOTO(0)	//	N
 974  019f a104          	cp	a,#4
 975  01a1 260a          	jrne	L573
 978  01a3 725f0000      	clr	___sUp
 981  01a7 350a0000      	mov	__dsCount,#10
 983  01ab 2020          	jra	L763
 984  01ad               L573:
 985                     ; 186 			else if( key==8 )	_GOTO(5)	//	Off
 987  01ad a108          	cp	a,#8
 988  01af 260a          	jrne	L104
 991  01b1 35050000      	mov	___sUp,#5
 994  01b5 350a0000      	mov	__dsCount,#10
 996  01b9 2012          	jra	L763
 997  01bb               L104:
 998                     ; 187 			else if( key==16 )	_DN
1000  01bb a110          	cp	a,#16
1001  01bd 2606          	jrne	L504
1004  01bf 35400000      	mov	_uiInfo,#64
1006  01c3 2008          	jra	L763
1007  01c5               L504:
1008                     ; 188 			else if( key==32 )	_UP
1010  01c5 a120          	cp	a,#32
1011  01c7 2604          	jrne	L763
1014  01c9 35010000      	mov	_uiInfo,#1
1015  01cd               L763:
1016                     ; 189 			_disp_temp = 1;
1018  01cd 35010000      	mov	__disp_temp,#1
1019                     ; 190 			i = disp_status_loop_host_Y(key);
1021  01d1 7b02          	ld	a,(OFST+1,sp)
1022  01d3 cd0000        	call	_disp_status_loop_host_Y
1024  01d6 6b01          	ld	(OFST+0,sp),a
1025                     ; 191 			if( i==1 )
1027  01d8 4a            	dec	a
1028  01d9 269f          	jrne	L512
1029                     ; 192 				_key_blink = 1;
1031  01db 35010000      	mov	__key_blink,#1
1032  01df cc0393        	jra	L512
1033  01e2               L363:
1034                     ; 194 		else if( _dsCount == 45 )			//	OFF
1036  01e2 a12d          	cp	a,#45
1037  01e4 2637          	jrne	L714
1038                     ; 196 			if( key==1 )		_GOTO(1)	//	Y
1040  01e6 7b02          	ld	a,(OFST+1,sp)
1041  01e8 a101          	cp	a,#1
1042  01ea 2606          	jrne	L124
1045  01ec 35010000      	mov	___sUp,#1
1048  01f0 2016          	jp	LC004
1049  01f2               L124:
1050                     ; 197 			else if( key==2 )	_GOTO(2)	//	Ban
1052  01f2 a102          	cp	a,#2
1053  01f4 2606          	jrne	L524
1056  01f6 35020000      	mov	___sUp,#2
1059  01fa 200c          	jp	LC004
1060  01fc               L524:
1061                     ; 198 			else if( key==4 )	_GOTO(0)	//	N
1063  01fc a104          	cp	a,#4
1067  01fe 2704          	jreq	LC005
1068                     ; 199 			else if( key==8 )	_GOTO(0)	//	On
1070  0200 a108          	cp	a,#8
1071  0202 260a          	jrne	L324
1074  0204               LC005:
1076  0204 725f0000      	clr	___sUp
1079  0208               LC004:
1083  0208 350a0000      	mov	__dsCount,#10
1084  020c 7b02          	ld	a,(OFST+1,sp)
1085  020e               L324:
1086                     ; 200 			i = disp_status_loop_host_Off(key);
1088  020e cd0000        	call	_disp_status_loop_host_Off
1090  0211 6b01          	ld	(OFST+0,sp),a
1091                     ; 201 			if( i==1 )
1093  0213 4a            	dec	a
1094  0214 26c9          	jrne	L512
1095                     ; 202 				_key_blink = 1;
1097  0216 35010000      	mov	__key_blink,#1
1098  021a cc0393        	jra	L512
1099  021d               L714:
1100                     ; 204 		else if( _dsCount == 1 )
1102  021d a101          	cp	a,#1
1103  021f 2703cc0316    	jrne	L344
1104                     ; 206 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
1106  0224 c60000        	ld	a,___sUp
1107  0227 2607          	jrne	L544
1110  0229 7b02          	ld	a,(OFST+1,sp)
1111  022b cd0000        	call	_disp_status_loop_host_N
1114  022e 2014          	jp	LC006
1115  0230               L544:
1116                     ; 207 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
1118  0230 a101          	cp	a,#1
1119  0232 2607          	jrne	L154
1122  0234 7b02          	ld	a,(OFST+1,sp)
1123  0236 cd0000        	call	_disp_status_loop_host_Y
1126  0239 2009          	jp	LC006
1127  023b               L154:
1128                     ; 208 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
1130  023b a102          	cp	a,#2
1131  023d 2607          	jrne	L744
1134  023f 7b02          	ld	a,(OFST+1,sp)
1135  0241 cd0000        	call	_disp_status_loop_host_B
1137  0244               LC006:
1138  0244 6b01          	ld	(OFST+0,sp),a
1139  0246               L744:
1140                     ; 210 			if( i==1 )
1142  0246 7b01          	ld	a,(OFST+0,sp)
1143  0248 4a            	dec	a
1144  0249 2604          	jrne	L754
1145                     ; 211 				_key_blink = 1;
1147  024b 4c            	inc	a
1148  024c c70000        	ld	__key_blink,a
1149  024f               L754:
1150                     ; 213 			_disp_temp = __sUp==0 ? 1 : 0;
1152  024f c60000        	ld	a,___sUp
1153  0252 2603          	jrne	L27
1154  0254 4c            	inc	a
1155  0255 2001          	jra	L47
1156  0257               L27:
1157  0257 4f            	clr	a
1158  0258               L47:
1159  0258 c70000        	ld	__disp_temp,a
1160                     ; 214 			if( _disp_temp == 0 && _key_blink == 0 )
1162  025b 261c          	jrne	L164
1164  025d c60000        	ld	a,__key_blink
1165  0260 2617          	jrne	L164
1166                     ; 216 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
1168  0262 c60000        	ld	a,___sUp
1169  0265 a101          	cp	a,#1
1170  0267 270c          	jreq	L564
1172  0269 a102          	cp	a,#2
1173  026b 2708          	jreq	L564
1175  026d a105          	cp	a,#5
1176  026f 2704          	jreq	L564
1178  0271 a108          	cp	a,#8
1179  0273 2604          	jrne	L164
1180  0275               L564:
1181                     ; 217 					_disp_temp = 1;
1183  0275 35010000      	mov	__disp_temp,#1
1184  0279               L164:
1185                     ; 220 			if( __sUp == 0 && i == 1 )
1187  0279 c60000        	ld	a,___sUp
1188  027c 2609          	jrne	L374
1190  027e 7b01          	ld	a,(OFST+0,sp)
1191  0280 4a            	dec	a
1192  0281 2604          	jrne	L374
1193                     ; 222 marker_1_0:
1193                     ; 223 				_key_blink = 1;
1195  0283 35010000      	mov	__key_blink,#1
1196  0287               L374:
1197                     ; 226 			if( key == 1 )
1199  0287 7b02          	ld	a,(OFST+1,sp)
1200  0289 a101          	cp	a,#1
1201  028b 261e          	jrne	L574
1202                     ; 228 				if( __sUp == 0 )
1204  028d c60000        	ld	a,___sUp
1205  0290 2703cc0324    	jrne	L351
1206                     ; 230 					if( _key_blink == 1 )
1208  0295 c60000        	ld	a,__key_blink
1209  0298 4a            	dec	a
1210  0299 276e          	jreq	L761
1211                     ; 231 						goto DisplayEntry;
1213                     ; 232 					disp_status_loop_clientDn(3/*0*/);	//¡§¡>>YKˆ - subR/C selection
1215  029b a603          	ld	a,#3
1216  029d cd0000        	call	_disp_status_loop_clientDn
1218                     ; 233 					_dsCount = 4;
1220  02a0 35040000      	mov	__dsCount,#4
1221                     ; 235 					_disp_temp = 1;
1223  02a4 35010000      	mov	__disp_temp,#1
1225  02a8 cc032c        	jra	L305
1226  02ab               L574:
1227                     ; 245 			else if( key == /*2*/7 )
1229  02ab a107          	cp	a,#7
1230  02ad 260a          	jrne	L705
1231  02af cc033a        	jra	L551
1232  02b2               L751:
1233                     ; 250 marker_2s:
1233                     ; 251 				__sUp = 1;
1235  02b2 a601          	ld	a,#1
1236  02b4 cd0430        	call	LC007
1237                     ; 255 				_key_blink = 1;
1238  02b7 2040          	jra	L505
1239  02b9               L705:
1240                     ; 257 			else if( key == 3 )
1242  02b9 a103          	cp	a,#3
1243  02bb 2631          	jrne	L515
1244                     ; 259 				if( __sUp == 0 )
1246  02bd c60000        	ld	a,___sUp
1247  02c0 260f          	jrne	L715
1248                     ; 261 					if( _key_blink == 0 )
1250  02c2 725d0000      	tnz	__key_blink
1251  02c6 261d          	jrne	L325
1252                     ; 263 marker_1s:						
1252                     ; 264 						__s = 2;
1254  02c8 35020000      	mov	___s,#2
1255                     ; 265 						_dsCount = 0;
1257  02cc c70000        	ld	__dsCount,a
1258                     ; 266 						return;
1261  02cf 85            	popw	x
1262  02d0 81            	ret	
1263  02d1               L715:
1264                     ; 269 				else if( __sUp == 1 )
1266  02d1 a101          	cp	a,#1
1267  02d3 2607          	jrne	L525
1268                     ; 271 					if( _key_blink == 0 )
1270  02d5 c60000        	ld	a,__key_blink
1271  02d8 260b          	jrne	L325
1272                     ; 272 						goto marker_2;
1274  02da 205e          	jra	L551
1275  02dc               L525:
1276                     ; 274 				else if( __sUp == 2 )
1278  02dc a102          	cp	a,#2
1279  02de 2605          	jrne	L325
1280                     ; 276 					if( _key_blink == 0 )
1282  02e0 c60000        	ld	a,__key_blink
1283  02e3 2772          	jreq	L361
1284                     ; 277 						goto marker_4;
1286  02e5               L325:
1287                     ; 279 				disp_status_loop_init();
1289  02e5 cd0000        	call	_disp_status_loop_init
1291                     ; 280 				_key_blink = 0;
1293  02e8 725f0000      	clr	__key_blink
1295  02ec 200b          	jra	L505
1296  02ee               L515:
1297                     ; 282 			else if( key == /*4*/2 )
1299  02ee a102          	cp	a,#2
1300  02f0 2607          	jrne	L505
1301  02f2 2063          	jra	L361
1302  02f4               L561:
1303                     ; 287 marker_4s:
1303                     ; 288 				__sUp = 2;
1305  02f4 a602          	ld	a,#2
1306  02f6 cd0430        	call	LC007
1307  02f9               L505:
1308                     ; 294 			if( _key_blink == 1 )
1310  02f9 c60000        	ld	a,__key_blink
1311  02fc 4a            	dec	a
1312  02fd 2703cc0393    	jrne	L512
1313                     ; 296 				if( _key_sec >= KEY_BLINK_FADE )
1315  0302 c60000        	ld	a,__key_sec
1316  0305 a10a          	cp	a,#10
1317  0307 25f6          	jrult	L512
1318  0309               L761:
1319                     ; 298 DisplayEntry:					
1319                     ; 299 					//	reset key timer
1319                     ; 300 					lcd_blink_clear();
1321  0309 cd0000        	call	_lcd_blink_clear
1323                     ; 301 					_key_blink = 0;
1325  030c 725f0000      	clr	__key_blink
1326                     ; 302 					_dsCount = 10;
1328  0310 350a0000      	mov	__dsCount,#10
1329  0314 207d          	jra	L512
1330  0316               L344:
1331                     ; 307 		else if( _dsCount == 4 )
1333  0316 a104          	cp	a,#4
1334  0318 2657          	jrne	L355
1335                     ; 309 			if( key == 1 )		
1337  031a 7b02          	ld	a,(OFST+1,sp)
1338  031c a101          	cp	a,#1
1339  031e 2612          	jrne	L555
1340                     ; 317 				_dsCount = 1;	
1342  0320 35010000      	mov	__dsCount,#1
1343                     ; 318 				goto marker_1;	
1344  0324               L351:
1345                     ; 239 marker_1:					
1345                     ; 240 					__sUp = 0;
1347  0324 725f0000      	clr	___sUp
1348                     ; 241 					_dsCount = 0;
1350  0328 725f0000      	clr	__dsCount
1351  032c               L305:
1352                     ; 243 				_dsPrev = 0xff;
1354  032c 35ff0000      	mov	__dsPrev,#255
1356  0330 20c7          	jra	L505
1357  0332               L555:
1358                     ; 320 			else if( key == 2 )	{	_dsCount = 1;	goto marker_2;	}
1360  0332 a102          	cp	a,#2
1361  0334 2615          	jrne	L165
1364  0336 35010000      	mov	__dsCount,#1
1366  033a               L551:
1367                     ; 247 marker_2:				
1367                     ; 248 				if( __sUp == 1 && _key_blink == 1 )
1369  033a c60000        	ld	a,___sUp
1370  033d 4a            	dec	a
1371  033e 2703cc02b2    	jrne	L751
1373  0343 c60000        	ld	a,__key_blink
1374  0346 4a            	dec	a
1375  0347 26f7          	jrne	L751
1376                     ; 249 					goto DisplayEntry;
1378  0349 20be          	jra	L761
1379  034b               L165:
1380                     ; 321 			else if( key == 3 )	{	}
1382  034b a103          	cp	a,#3
1383  034d 2717          	jreq	L755
1385                     ; 322 			else if( key == 4 )	{	_dsCount = 1;	goto marker_4;	}
1387  034f a104          	cp	a,#4
1388  0351 2613          	jrne	L755
1391  0353 35010000      	mov	__dsCount,#1
1393  0357               L361:
1394                     ; 284 marker_4:				
1394                     ; 285 				if( __sUp == 2 && _key_blink == 1 )
1396  0357 c60000        	ld	a,___sUp
1397  035a a102          	cp	a,#2
1398  035c 2696          	jrne	L561
1400  035e c60000        	ld	a,__key_blink
1401  0361 4a            	dec	a
1402  0362 2690          	jrne	L561
1403                     ; 286 					goto DisplayEntry;
1405  0364 20a3          	jra	L761
1406  0366               L755:
1407                     ; 324 			if( uiInfo.enc != 0 )
1409  0366 c60000        	ld	a,_uiInfo
1410  0369 2728          	jreq	L512
1411                     ; 325 				_dsCount = 10;
1413  036b 350a0000      	mov	__dsCount,#10
1414  036f 2022          	jra	L512
1415  0371               L355:
1416                     ; 327 		else if( _dsCount == 5 )
1418  0371 a105          	cp	a,#5
1419  0373 260e          	jrne	L775
1420                     ; 329 			disp_status_loop_init();
1422  0375 cd0000        	call	_disp_status_loop_init
1424                     ; 330 			disp_status_loop_clientDn(1);	//	ø‹√‚∏µÂ «•Ω√
1426  0378 a601          	ld	a,#1
1427  037a cd0000        	call	_disp_status_loop_clientDn
1429                     ; 331 			_dsCount = 6;
1431  037d 35060000      	mov	__dsCount,#6
1433  0381 2010          	jra	L512
1434  0383               L775:
1435                     ; 333 		else if( _dsCount == 6 )
1437  0383 a106          	cp	a,#6
1438  0385 260c          	jrne	L512
1439                     ; 335 			if( _disp_mode != _disp_mode2 )
1441  0387 c60000        	ld	a,__disp_mode
1442  038a c10000        	cp	a,__disp_mode2
1443  038d 2704          	jreq	L512
1444                     ; 337 				_dsCount = 0;
1446  038f 725f0000      	clr	__dsCount
1447  0393               L512:
1448                     ; 341 		if( _dsCount == 15 || _dsCount == 16 || _dsCount == 25 || 
1448                     ; 342 				_dsCount == 35 || _dsCount == 45)
1450  0393 c60000        	ld	a,__dsCount
1451  0396 a10f          	cp	a,#15
1452  0398 2710          	jreq	L116
1454  039a a110          	cp	a,#16
1455  039c 270c          	jreq	L116
1457  039e a119          	cp	a,#25
1458  03a0 2708          	jreq	L116
1460  03a2 a123          	cp	a,#35
1461  03a4 2704          	jreq	L116
1463  03a6 a12d          	cp	a,#45
1464  03a8 262f          	jrne	L221
1465  03aa               L116:
1466                     ; 344 			if( _disp_mode != _disp_mode2 || packet_changed == 1)
1468  03aa c60000        	ld	a,__disp_mode
1469  03ad c10000        	cp	a,__disp_mode2
1470  03b0 2606          	jrne	L326
1472  03b2 c60000        	ld	a,_packet_changed
1473  03b5 4a            	dec	a
1474  03b6 2621          	jrne	L221
1475  03b8               L326:
1476                     ; 346 				packet_changed = 0;
1478  03b8 725f0000      	clr	_packet_changed
1479                     ; 347 				_dsCount = 10;
1481  03bc 350a0000      	mov	__dsCount,#10
1482                     ; 348 				_key_blink = 0;
1484  03c0 725f0000      	clr	__key_blink
1485                     ; 350 				if( _disp_mode2 == 0x01 )		
1487  03c4 c60000        	ld	a,__disp_mode2
1488  03c7 a101          	cp	a,#1
1489  03c9 2606          	jrne	L526
1490                     ; 352 					_dsCount = 0;
1492  03cb 725f0000      	clr	__dsCount
1493                     ; 353 					return;					
1495  03cf 2008          	jra	L221
1496  03d1               L526:
1497                     ; 355 				else if( _disp_mode2 == 0x02 )	
1499  03d1 a102          	cp	a,#2
1500  03d3 2606          	jrne	L136
1501                     ; 357 					__sUp = 16;//	ø‹√‚
1503  03d5 35100000      	mov	___sUp,#16
1504                     ; 358 					return;
1505  03d9               L221:
1508  03d9 85            	popw	x
1509  03da 81            	ret	
1510  03db               L136:
1511                     ; 360 				else if( _disp_mode2 == 0x04 )	
1513  03db a104          	cp	a,#4
1514  03dd 2606          	jrne	L536
1515                     ; 362 					__sUp = 5;	// ¡§¡ˆ
1517  03df 35050000      	mov	___sUp,#5
1518                     ; 363 					return;
1520  03e3 20f4          	jra	L221
1521  03e5               L536:
1522                     ; 365 				else if( _disp_mode2 == 0x08 )	
1524  03e5 a108          	cp	a,#8
1525  03e7 2606          	jrne	L146
1526                     ; 367 					__sUp = 1;
1528  03e9 35010000      	mov	___sUp,#1
1529                     ; 368 					_key_sec = _key_min = _key_hour = 0;
1531  03ed 2008          	jra	L726
1532  03ef               L146:
1533                     ; 371 				else if( _disp_mode2 == 0x10 )	
1535  03ef a110          	cp	a,#16
1536  03f1 26e6          	jrne	L221
1537                     ; 373 					__sUp = 2;
1539  03f3 35020000      	mov	___sUp,#2
1540                     ; 374 					_key_sec = _key_min = _key_hour = 0;
1543  03f7               L726:
1545  03f7 725f0000      	clr	__key_hour
1546  03fb 725f0000      	clr	__key_min
1547  03ff 725f0000      	clr	__key_sec
1548                     ; 380 				disp_status_loop_init();
1550  0403 cd0000        	call	_disp_status_loop_init
1552  0406 20d1          	jra	L221
1553                     ; 378 					return;
1555  0408               L702:
1556                     ; 384 	else if( __s == 2 )
1558  0408 a102          	cp	a,#2
1559  040a 26cd          	jrne	L221
1560                     ; 386 		disp_backlight(0);
1562  040c 4f            	clr	a
1563  040d cd0000        	call	_disp_backlight
1565                     ; 387 		if( key == 1 || key == 2 || key == 3 || key == 4 )
1567  0410 7b02          	ld	a,(OFST+1,sp)
1568  0412 a101          	cp	a,#1
1569  0414 270c          	jreq	L756
1571  0416 a102          	cp	a,#2
1572  0418 2708          	jreq	L756
1574  041a a103          	cp	a,#3
1575  041c 2704          	jreq	L756
1577  041e a104          	cp	a,#4
1578  0420 26b7          	jrne	L221
1579  0422               L756:
1580                     ; 389 			__s = 0;
1582  0422 725f0000      	clr	___s
1583                     ; 390 			_dsCount = 0;
1585  0426 725f0000      	clr	__dsCount
1586                     ; 391 			file_update2(0);
1588  042a 4f            	clr	a
1589  042b cd0000        	call	_file_update2
1591                     ; 394 }
1593  042e 20a9          	jra	L221
1594  0430               LC007:
1595  0430 c70000        	ld	___sUp,a
1596                     ; 252 				_dsPrev = 0xff;
1598  0433 35ff0000      	mov	__dsPrev,#255
1599                     ; 253 				disp_status_loop_message(__sUp);
1601  0437 cd0000        	call	_disp_status_loop_message
1603                     ; 255 				_key_blink = 1;
1605  043a 35010000      	mov	__key_blink,#1
1606  043e 81            	ret	
1659                     	xref	_disp_status_loop_host_Out
1660                     	xref	_disp_status_loop_host_Off
1661                     	xref	_timerClear
1662                     	xref	__backlight_get_code
1663                     	xref	__backlight_get_index
1664                     	xdef	___rcCb
1665                     	xref	_start_flag
1666                     	xref	__backup_backlight2
1667                     	xref	_packet_changed
1668                     	xref	__disp_temp
1669                     	xdef	_lcd_pwmCount2
1670                     	xdef	_lcd_pwmIndex2
1671                     	xdef	__backlight
1672                     	xdef	__lcdEnable
1673                     	switch	.bss
1674  0000               __lcdTimer:
1675  0000 00000000      	ds.b	4
1676                     	xdef	__lcdTimer
1677                     	xdef	_disp_backlight
1678                     	xref	_file_update2
1679                     	xref	__key_blink
1680                     	xref	__key_hour
1681                     	xref	__key_min
1682                     	xref	__key_sec
1683                     	xref	__disp_mode2
1684                     	xref	__disp_mode
1685                     	xdef	_disp_status_loop_clientDn
1686                     	xref	_disp_status_curr_only
1687                     	xref	_disp_status_loop_init
1688                     	xref	_disp_status_loop_host_B
1689                     	xref	_disp_status_loop_host_Y
1690                     	xref	_disp_status_loop_host_N
1691                     	xdef	_disp_status_loop_messageDn
1692                     	xref	_disp_status_loop_message
1693                     	xref	__dsPrev
1694                     	xref	__dsCount
1695                     	xdef	_disp_status_loop_client
1696                     	xref	___sDn
1697                     	xref	___sUp
1698                     	xref	___s
1699                     	xref	_lcd_blink_clear
1700                     	xref	_lcd_disp_n
1701                     	xref	_lcd_clear
1702                     	xref	_lcd_disp_backlight
1703                     	xref	_lcd_clear_btn
1704                     	xref	_iLF_DEF
1705                     	xref	_bLF_DEF
1706                     	xref	_uiInfo
1726                     	end
