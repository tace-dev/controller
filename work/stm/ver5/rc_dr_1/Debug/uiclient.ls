   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
  91                     ; 36 	if( i==BACKLIGHT_MAX_LEVEL )
  93  000d a160          	cp	a,#96
  94  000f 2602          	jrne	L52
  95                     ; 37 		i = 20;
  97  0011 a614          	ld	a,#20
  99  0013               L52:
 100  0013 6b01          	ld	(OFST+0,sp),a
 101                     ; 46 	if( lcd_pwmIndex2 <= i )	{	PWM_HIGH;	}
 103  0015 c60002        	ld	a,_lcd_pwmIndex2
 104  0018 1101          	cp	a,(OFST+0,sp)
 105  001a 2206          	jrugt	L72
 108  001c 721c5014      	bset	20500,#6
 110  0020 2004          	jra	L13
 111  0022               L72:
 112                     ; 47 	else					{	PWM_LOW;	}
 114  0022 721d5014      	bres	20500,#6
 115  0026               L13:
 116                     ; 49 	lcd_pwmIndex2++;
 118  0026 725c0002      	inc	_lcd_pwmIndex2
 119                     ; 50 	if( lcd_pwmIndex2 == lcd_pwmCount2 )
 121  002a c60002        	ld	a,_lcd_pwmIndex2
 122  002d c10003        	cp	a,_lcd_pwmCount2
 123  0030 2604          	jrne	L33
 124                     ; 51 		lcd_pwmIndex2 = 0;
 126  0032 725f0002      	clr	_lcd_pwmIndex2
 127  0036               L33:
 128                     ; 52 }
 131  0036 84            	pop	a
 132  0037 81            	ret	
 181                     ; 57 void	disp_backlight(uint8_t mode)
 181                     ; 58 {
 182                     .text:	section	.text,new
 183  0000               _disp_backlight:
 185       00000001      OFST:	set	1
 188                     ; 62 	_backup_backlight2 = 0;
 190  0000 725f0000      	clr	__backup_backlight2
 191  0004 88            	push	a
 192                     ; 64 	if( _dsCount == 0 )
 194  0005 c60000        	ld	a,__dsCount
 195  0008 2611          	jrne	L35
 196                     ; 66 		lcd_clear(0);
 198  000a cd0000        	call	_lcd_clear
 200                     ; 67 		lcd_disp_backlight();
 202  000d cd0000        	call	_lcd_disp_backlight
 204                     ; 68 		_dsCount = 1;
 206  0010 35010000      	mov	__dsCount,#1
 207                     ; 69 		uiInfo._t = _backlight;
 209  0014 550001005f    	mov	_uiInfo+95,__backlight
 211  0019 205e          	jra	L55
 212  001b               L35:
 213                     ; 73 		i = _backlight;
 215  001b c60001        	ld	a,__backlight
 216  001e 6b01          	ld	(OFST+0,sp),a
 218                     ; 74 		i = _backlight_get_index(i);
 220  0020 cd0000        	call	__backlight_get_index
 222  0023 6b01          	ld	(OFST+0,sp),a
 224                     ; 75 		if( uiInfo.enc != 0 )
 226  0025 c60000        	ld	a,_uiInfo
 227  0028 2728          	jreq	L75
 228                     ; 79 			ENC_MOVE_0(1, 5, 1);
 230  002a a540          	bcp	a,#64
 231  002c 260e          	jrne	L16
 234  002e 7b01          	ld	a,(OFST+0,sp)
 235  0030 a102          	cp	a,#2
 236  0032 2404          	jruge	L36
 239  0034 a605          	ld	a,#5
 241  0036 200c          	jp	LC001
 242  0038               L36:
 245  0038 0a01          	dec	(OFST+0,sp)
 247  003a 200e          	jra	L76
 248  003c               L16:
 251  003c 7b01          	ld	a,(OFST+0,sp)
 252  003e a105          	cp	a,#5
 253  0040 2506          	jrult	L17
 256  0042 a601          	ld	a,#1
 257  0044               LC001:
 258  0044 6b01          	ld	(OFST+0,sp),a
 261  0046 2002          	jra	L76
 262  0048               L17:
 265  0048 0c01          	inc	(OFST+0,sp)
 267  004a               L76:
 268                     ; 80 			_backlight = _backlight_get_code(i);
 271  004a 7b01          	ld	a,(OFST+0,sp)
 272  004c cd0000        	call	__backlight_get_code
 274  004f c70001        	ld	__backlight,a
 275  0052               L75:
 276                     ; 83 		if( _dsPrev != i )
 278  0052 c60000        	ld	a,__dsPrev
 279  0055 1101          	cp	a,(OFST+0,sp)
 280  0057 2720          	jreq	L55
 281                     ; 85 			_dsPrev = i;
 283  0059 7b01          	ld	a,(OFST+0,sp)
 284  005b c70000        	ld	__dsPrev,a
 285                     ; 86 			UI_DISP_2Digit(i);
 287  005e 5f            	clrw	x
 288  005f 97            	ld	xl,a
 289  0060 a60a          	ld	a,#10
 290  0062 62            	div	x,a
 291  0063 9f            	ld	a,xl
 292  0064 ae0200        	ldw	x,#512
 293  0067 97            	ld	xl,a
 294  0068 cd0000        	call	_lcd_disp_n
 298  006b 7b01          	ld	a,(OFST+0,sp)
 299  006d 5f            	clrw	x
 300  006e 97            	ld	xl,a
 301  006f a60a          	ld	a,#10
 302  0071 62            	div	x,a
 303  0072 ae0300        	ldw	x,#768
 304  0075 97            	ld	xl,a
 305  0076 cd0000        	call	_lcd_disp_n
 308  0079               L55:
 309                     ; 89 }
 312  0079 84            	pop	a
 313  007a 81            	ret	
 352                     ; 93 void	disp_status_loop_messageDn(uint8_t i)
 352                     ; 94 {
 353                     .text:	section	.text,new
 354  0000               _disp_status_loop_messageDn:
 356  0000 88            	push	a
 357       00000000      OFST:	set	0
 360                     ; 95 	lcd_clear_btn();
 362  0001 cd0000        	call	_lcd_clear_btn
 364                     ; 96 	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(/*bS9*/bP20);	/*	ø‹√‚*/	}
 366  0004 7b01          	ld	a,(OFST+1,sp)
 367  0006 4a            	dec	a
 368  0007 2611          	jrne	L311
 371  0009 35020000      	mov	__disp_mode,#2
 374  000d 5f            	clrw	x
 375  000e c60039        	ld	a,_iLF_DEF+57
 376  0011 97            	ld	xl,a
 377  0012 d6540c        	ld	a,(21516,x)
 378  0015 ca0039        	or	a,_bLF_DEF+57
 380  0018 2052          	jp	LC002
 381  001a               L311:
 382                     ; 97 	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(/*bS10*/bP13);	/*	¡§¡ˆ*/	}
 384  001a 7b01          	ld	a,(OFST+1,sp)
 385  001c 2611          	jrne	L711
 388  001e 35040000      	mov	__disp_mode,#4
 391  0022 5f            	clrw	x
 392  0023 c60010        	ld	a,_iLF_DEF+16
 393  0026 97            	ld	xl,a
 394  0027 d6540c        	ld	a,(21516,x)
 395  002a ca0010        	or	a,_bLF_DEF+16
 397  002d 203d          	jp	LC002
 398  002f               L711:
 399                     ; 98 	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(/*bS6*/bP15);	/*	≥≠πÊ*/	}
 401  002f a102          	cp	a,#2
 402  0031 2611          	jrne	L321
 405  0033 35010000      	mov	__disp_mode,#1
 408  0037 5f            	clrw	x
 409  0038 c6003f        	ld	a,_iLF_DEF+63
 410  003b 97            	ld	xl,a
 411  003c d6540c        	ld	a,(21516,x)
 412  003f ca003f        	or	a,_bLF_DEF+63
 414  0042 2028          	jp	LC002
 415  0044               L321:
 416                     ; 99 	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(/*bS7*/bP10);	/*	øπæ‡*/	}
 418  0044 a103          	cp	a,#3
 419  0046 2611          	jrne	L721
 422  0048 35080000      	mov	__disp_mode,#8
 425  004c 5f            	clrw	x
 426  004d c6003a        	ld	a,_iLF_DEF+58
 427  0050 97            	ld	xl,a
 428  0051 d6540c        	ld	a,(21516,x)
 429  0054 ca003a        	or	a,_bLF_DEF+58
 431  0057 2013          	jp	LC002
 432  0059               L721:
 433                     ; 100 	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(/*bS8*/bP9);	/*	π›∫π*/	}
 435  0059 a104          	cp	a,#4
 436  005b 2612          	jrne	L511
 439  005d 35100000      	mov	__disp_mode,#16
 442  0061 5f            	clrw	x
 443  0062 c60031        	ld	a,_iLF_DEF+49
 444  0065 97            	ld	xl,a
 445  0066 d6540c        	ld	a,(21516,x)
 446  0069 ca0031        	or	a,_bLF_DEF+49
 447  006c               LC002:
 448  006c d7540c        	ld	(21516,x),a
 449  006f               L511:
 450                     ; 101 	_disp_mode2 = _disp_mode;
 452  006f 5500000000    	mov	__disp_mode2,__disp_mode
 453                     ; 102 	timerClear();
 455  0074 cd0000        	call	_timerClear
 457                     ; 103 }
 460  0077 84            	pop	a
 461  0078 81            	ret	
 497                     ; 105 void	disp_status_loop_clientDn(uint8_t key)
 497                     ; 106 {
 498                     .text:	section	.text,new
 499  0000               _disp_status_loop_clientDn:
 503                     ; 108 	disp_status_loop_messageDn(key);
 505  0000 cd0000        	call	_disp_status_loop_messageDn
 507                     ; 109 	disp_status_curr_only();
 509  0003 cd0000        	call	_disp_status_curr_only
 511                     ; 110 	lcd_blink_clear();
 514                     ; 111 }
 517  0006 cc0000        	jp	_lcd_blink_clear
 583                     ; 116 void	disp_status_loop_client(uint8_t key)
 583                     ; 117 {
 584                     .text:	section	.text,new
 585  0000               _disp_status_loop_client:
 587  0000 88            	push	a
 588  0001 88            	push	a
 589       00000001      OFST:	set	1
 592                     ; 118 	uint8_t	i = 0;
 594  0002 0f01          	clr	(OFST+0,sp)
 596                     ; 119 	if( __s == 0 )
 598  0004 c60000        	ld	a,___s
 599  0007 2703cc0408    	jrne	L702
 600                     ; 121 		if( _dsCount == 0 )
 602  000c c60000        	ld	a,__dsCount
 603  000f 2618          	jrne	L112
 604                     ; 123 			_dsCount = 10;
 606  0011 350a0000      	mov	__dsCount,#10
 607                     ; 125 			if (start_flag == 0) {
 609  0015 725d0000      	tnz	_start_flag
 610  0019 2603          	jrne	L312
 611                     ; 126 				__sUp = 0;
 613  001b c70000        	ld	___sUp,a
 614  001e               L312:
 615                     ; 128 			start_flag = 0;
 617  001e 725f0000      	clr	_start_flag
 618                     ; 130 			__sDn = 0xff;
 620  0022 35ff0000      	mov	___sDn,#255
 622  0026 cc0393        	jra	L512
 623  0029               L112:
 624                     ; 133 		else if( _dsCount == 10 )
 626  0029 a10a          	cp	a,#10
 627  002b 2641          	jrne	L712
 628                     ; 135 			if( __sUp == 0 )		_dsCount = 15;	//	N
 630  002d c60000        	ld	a,___sUp
 631  0030 2606          	jrne	L122
 634  0032 350f0000      	mov	__dsCount,#15
 636  0036 2030          	jra	L322
 637  0038               L122:
 638                     ; 136 			else if( __sUp == 1 )	_dsCount = 35;	//	Y
 640  0038 a101          	cp	a,#1
 641  003a 2606          	jrne	L522
 644  003c 35230000      	mov	__dsCount,#35
 646  0040 2026          	jra	L322
 647  0042               L522:
 648                     ; 137 			else if( __sUp == 2 )	_dsCount = 25;	//	B
 650  0042 a102          	cp	a,#2
 651  0044 2606          	jrne	L132
 654  0046 35190000      	mov	__dsCount,#25
 656  004a 201c          	jra	L322
 657  004c               L132:
 658                     ; 138 			else if( __sUp == 5 )	_dsCount = 45;	//	J
 660  004c a105          	cp	a,#5
 661  004e 2606          	jrne	L532
 664  0050 352d0000      	mov	__dsCount,#45
 666  0054 2012          	jra	L322
 667  0056               L532:
 668                     ; 139 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //out
 670  0056 a110          	cp	a,#16
 671  0058 260a          	jrne	L142
 674  005a 35100000      	mov	__dsCount,#16
 677  005e 35080000      	mov	___sUp,#8
 679  0062 2004          	jra	L322
 680  0064               L142:
 681                     ; 141 				_dsCount = 1;
 683  0064 35010000      	mov	__dsCount,#1
 684  0068               L322:
 685                     ; 142 			disp_status_loop_init();
 687  0068 cd0000        	call	_disp_status_loop_init
 690  006b cc0393        	jra	L512
 691  006e               L712:
 692                     ; 144 		else if( _dsCount == 15 )			//	N/Out
 694  006e a10f          	cp	a,#15
 695  0070 2661          	jrne	L742
 696                     ; 146 			if( key==1 )		_GOTO(1)	//	Y
 698  0072 7b02          	ld	a,(OFST+1,sp)
 699  0074 a101          	cp	a,#1
 700  0076 260a          	jrne	L152
 703  0078 35010000      	mov	___sUp,#1
 706  007c 350a0000      	mov	__dsCount,#10
 708  0080 203c          	jra	L352
 709  0082               L152:
 710                     ; 147 			else if( key==2 )	_GOTO(2)	//	Ban
 712  0082 a102          	cp	a,#2
 713  0084 260a          	jrne	L552
 716  0086 35020000      	mov	___sUp,#2
 719  008a 350a0000      	mov	__dsCount,#10
 721  008e 202e          	jra	L352
 722  0090               L552:
 723                     ; 148 			else if( key==4 )	_GOTO(16)	//	Out
 725  0090 a104          	cp	a,#4
 726  0092 260a          	jrne	L162
 729  0094 35100000      	mov	___sUp,#16
 732  0098 350a0000      	mov	__dsCount,#10
 734  009c 2020          	jra	L352
 735  009e               L162:
 736                     ; 149 			else if( key==8 )	_GOTO(5)	//	Off
 738  009e a108          	cp	a,#8
 739  00a0 260a          	jrne	L562
 742  00a2 35050000      	mov	___sUp,#5
 745  00a6 350a0000      	mov	__dsCount,#10
 747  00aa 2012          	jra	L352
 748  00ac               L562:
 749                     ; 150 			else if( key==16 )	_DN
 751  00ac a110          	cp	a,#16
 752  00ae 2606          	jrne	L172
 755  00b0 35400000      	mov	_uiInfo,#64
 757  00b4 2008          	jra	L352
 758  00b6               L172:
 759                     ; 151 			else if( key==32 )	_UP
 761  00b6 a120          	cp	a,#32
 762  00b8 2604          	jrne	L352
 765  00ba 35010000      	mov	_uiInfo,#1
 766  00be               L352:
 767                     ; 152 			_disp_temp = 1;
 769  00be 35010000      	mov	__disp_temp,#1
 770                     ; 153 			i = disp_status_loop_host_N(key);
 772  00c2 7b02          	ld	a,(OFST+1,sp)
 773  00c4 cd0000        	call	_disp_status_loop_host_N
 775  00c7 6b01          	ld	(OFST+0,sp),a
 777                     ; 154 			if( i==1 )
 779  00c9 4a            	dec	a
 780  00ca 269f          	jrne	L512
 781                     ; 155 				_key_blink = 1;
 783  00cc 35010000      	mov	__key_blink,#1
 784  00d0 cc0393        	jra	L512
 785  00d3               L742:
 786                     ; 157 		else if( _dsCount == 16 )			//	OUT
 788  00d3 a110          	cp	a,#16
 789  00d5 2641          	jrne	L303
 790                     ; 159 			if( key==1 )		_GOTO(1)	//	Y
 792  00d7 7b02          	ld	a,(OFST+1,sp)
 793  00d9 a101          	cp	a,#1
 794  00db 2606          	jrne	L503
 797  00dd 35010000      	mov	___sUp,#1
 800  00e1 201c          	jp	LC003
 801  00e3               L503:
 802                     ; 160 			else if( key==2 )	_GOTO(2)	//	Ban
 804  00e3 a102          	cp	a,#2
 805  00e5 2606          	jrne	L113
 808  00e7 35020000      	mov	___sUp,#2
 811  00eb 2012          	jp	LC003
 812  00ed               L113:
 813                     ; 161 			else if( key==4 )	_GOTO(0)	//	N
 815  00ed a104          	cp	a,#4
 816  00ef 2606          	jrne	L513
 819  00f1 725f0000      	clr	___sUp
 822  00f5 2008          	jp	LC003
 823  00f7               L513:
 824                     ; 162 			else if( key==8 )	_GOTO(5)	//	Off
 826  00f7 a108          	cp	a,#8
 827  00f9 2608          	jrne	L703
 830  00fb 35050000      	mov	___sUp,#5
 833  00ff               LC003:
 837  00ff 350a0000      	mov	__dsCount,#10
 838  0103               L703:
 839                     ; 163 			_disp_temp = 1;
 841  0103 35010000      	mov	__disp_temp,#1
 842                     ; 164 			i = disp_status_loop_host_Out(key);
 844  0107 7b02          	ld	a,(OFST+1,sp)
 845  0109 cd0000        	call	_disp_status_loop_host_Out
 847  010c 6b01          	ld	(OFST+0,sp),a
 849                     ; 165 			if( i==1 )
 851  010e 4a            	dec	a
 852  010f 26bf          	jrne	L512
 853                     ; 166 				_key_blink = 1;
 855  0111 35010000      	mov	__key_blink,#1
 856  0115 cc0393        	jra	L512
 857  0118               L303:
 858                     ; 168 		else if( _dsCount == 25 )			//	B
 860  0118 a119          	cp	a,#25
 861  011a 2661          	jrne	L723
 862                     ; 170 			if( key==1 )		_GOTO(1)	//	Y
 864  011c 7b02          	ld	a,(OFST+1,sp)
 865  011e a101          	cp	a,#1
 866  0120 260a          	jrne	L133
 869  0122 35010000      	mov	___sUp,#1
 872  0126 350a0000      	mov	__dsCount,#10
 874  012a 203c          	jra	L333
 875  012c               L133:
 876                     ; 171 			else if( key==2 )	_GOTO(0)	//	N
 878  012c a102          	cp	a,#2
 879  012e 260a          	jrne	L533
 882  0130 725f0000      	clr	___sUp
 885  0134 350a0000      	mov	__dsCount,#10
 887  0138 202e          	jra	L333
 888  013a               L533:
 889                     ; 172 			else if( key==4 )	_GOTO(0)	//	N
 891  013a a104          	cp	a,#4
 892  013c 260a          	jrne	L143
 895  013e 725f0000      	clr	___sUp
 898  0142 350a0000      	mov	__dsCount,#10
 900  0146 2020          	jra	L333
 901  0148               L143:
 902                     ; 173 			else if( key==8 )	_GOTO(5)	//	Off
 904  0148 a108          	cp	a,#8
 905  014a 260a          	jrne	L543
 908  014c 35050000      	mov	___sUp,#5
 911  0150 350a0000      	mov	__dsCount,#10
 913  0154 2012          	jra	L333
 914  0156               L543:
 915                     ; 174 			else if( key==16 )	_DN
 917  0156 a110          	cp	a,#16
 918  0158 2606          	jrne	L153
 921  015a 35400000      	mov	_uiInfo,#64
 923  015e 2008          	jra	L333
 924  0160               L153:
 925                     ; 175 			else if( key==32 )	_UP
 927  0160 a120          	cp	a,#32
 928  0162 2604          	jrne	L333
 931  0164 35010000      	mov	_uiInfo,#1
 932  0168               L333:
 933                     ; 176 			_disp_temp = 1;
 935  0168 35010000      	mov	__disp_temp,#1
 936                     ; 177 			i = disp_status_loop_host_B(key);
 938  016c 7b02          	ld	a,(OFST+1,sp)
 939  016e cd0000        	call	_disp_status_loop_host_B
 941  0171 6b01          	ld	(OFST+0,sp),a
 943                     ; 178 			if( i==1 )
 945  0173 4a            	dec	a
 946  0174 269f          	jrne	L512
 947                     ; 179 				_key_blink = 1;
 949  0176 35010000      	mov	__key_blink,#1
 950  017a cc0393        	jra	L512
 951  017d               L723:
 952                     ; 181 		else if( _dsCount == 35 )			//	Y
 954  017d a123          	cp	a,#35
 955  017f 2661          	jrne	L363
 956                     ; 183 			if( key==1 )		_GOTO(0)	//	N
 958  0181 7b02          	ld	a,(OFST+1,sp)
 959  0183 a101          	cp	a,#1
 960  0185 260a          	jrne	L563
 963  0187 725f0000      	clr	___sUp
 966  018b 350a0000      	mov	__dsCount,#10
 968  018f 203c          	jra	L763
 969  0191               L563:
 970                     ; 184 			else if( key==2 )	_GOTO(2)	//	Ban
 972  0191 a102          	cp	a,#2
 973  0193 260a          	jrne	L173
 976  0195 35020000      	mov	___sUp,#2
 979  0199 350a0000      	mov	__dsCount,#10
 981  019d 202e          	jra	L763
 982  019f               L173:
 983                     ; 185 			else if( key==4 )	_GOTO(0)	//	N
 985  019f a104          	cp	a,#4
 986  01a1 260a          	jrne	L573
 989  01a3 725f0000      	clr	___sUp
 992  01a7 350a0000      	mov	__dsCount,#10
 994  01ab 2020          	jra	L763
 995  01ad               L573:
 996                     ; 186 			else if( key==8 )	_GOTO(5)	//	Off
 998  01ad a108          	cp	a,#8
 999  01af 260a          	jrne	L104
1002  01b1 35050000      	mov	___sUp,#5
1005  01b5 350a0000      	mov	__dsCount,#10
1007  01b9 2012          	jra	L763
1008  01bb               L104:
1009                     ; 187 			else if( key==16 )	_DN
1011  01bb a110          	cp	a,#16
1012  01bd 2606          	jrne	L504
1015  01bf 35400000      	mov	_uiInfo,#64
1017  01c3 2008          	jra	L763
1018  01c5               L504:
1019                     ; 188 			else if( key==32 )	_UP
1021  01c5 a120          	cp	a,#32
1022  01c7 2604          	jrne	L763
1025  01c9 35010000      	mov	_uiInfo,#1
1026  01cd               L763:
1027                     ; 189 			_disp_temp = 1;
1029  01cd 35010000      	mov	__disp_temp,#1
1030                     ; 190 			i = disp_status_loop_host_Y(key);
1032  01d1 7b02          	ld	a,(OFST+1,sp)
1033  01d3 cd0000        	call	_disp_status_loop_host_Y
1035  01d6 6b01          	ld	(OFST+0,sp),a
1037                     ; 191 			if( i==1 )
1039  01d8 4a            	dec	a
1040  01d9 269f          	jrne	L512
1041                     ; 192 				_key_blink = 1;
1043  01db 35010000      	mov	__key_blink,#1
1044  01df cc0393        	jra	L512
1045  01e2               L363:
1046                     ; 194 		else if( _dsCount == 45 )			//	OFF
1048  01e2 a12d          	cp	a,#45
1049  01e4 2637          	jrne	L714
1050                     ; 196 			if( key==1 )		_GOTO(1)	//	Y
1052  01e6 7b02          	ld	a,(OFST+1,sp)
1053  01e8 a101          	cp	a,#1
1054  01ea 2606          	jrne	L124
1057  01ec 35010000      	mov	___sUp,#1
1060  01f0 2016          	jp	LC004
1061  01f2               L124:
1062                     ; 197 			else if( key==2 )	_GOTO(2)	//	Ban
1064  01f2 a102          	cp	a,#2
1065  01f4 2606          	jrne	L524
1068  01f6 35020000      	mov	___sUp,#2
1071  01fa 200c          	jp	LC004
1072  01fc               L524:
1073                     ; 198 			else if( key==4 )	_GOTO(0)	//	N
1075  01fc a104          	cp	a,#4
1079  01fe 2704          	jreq	LC005
1080                     ; 199 			else if( key==8 )	_GOTO(0)	//	On
1082  0200 a108          	cp	a,#8
1083  0202 260a          	jrne	L324
1086  0204               LC005:
1088  0204 725f0000      	clr	___sUp
1091  0208               LC004:
1095  0208 350a0000      	mov	__dsCount,#10
1096  020c 7b02          	ld	a,(OFST+1,sp)
1097  020e               L324:
1098                     ; 200 			i = disp_status_loop_host_Off(key);
1100  020e cd0000        	call	_disp_status_loop_host_Off
1102  0211 6b01          	ld	(OFST+0,sp),a
1104                     ; 201 			if( i==1 )
1106  0213 4a            	dec	a
1107  0214 26c9          	jrne	L512
1108                     ; 202 				_key_blink = 1;
1110  0216 35010000      	mov	__key_blink,#1
1111  021a cc0393        	jra	L512
1112  021d               L714:
1113                     ; 204 		else if( _dsCount == 1 )
1115  021d a101          	cp	a,#1
1116  021f 2703cc0316    	jrne	L344
1117                     ; 206 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
1119  0224 c60000        	ld	a,___sUp
1120  0227 2607          	jrne	L544
1123  0229 7b02          	ld	a,(OFST+1,sp)
1124  022b cd0000        	call	_disp_status_loop_host_N
1127  022e 2014          	jp	LC006
1128  0230               L544:
1129                     ; 207 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
1131  0230 a101          	cp	a,#1
1132  0232 2607          	jrne	L154
1135  0234 7b02          	ld	a,(OFST+1,sp)
1136  0236 cd0000        	call	_disp_status_loop_host_Y
1139  0239 2009          	jp	LC006
1140  023b               L154:
1141                     ; 208 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
1143  023b a102          	cp	a,#2
1144  023d 2607          	jrne	L744
1147  023f 7b02          	ld	a,(OFST+1,sp)
1148  0241 cd0000        	call	_disp_status_loop_host_B
1150  0244               LC006:
1151  0244 6b01          	ld	(OFST+0,sp),a
1153  0246               L744:
1154                     ; 210 			if( i==1 )
1156  0246 7b01          	ld	a,(OFST+0,sp)
1157  0248 4a            	dec	a
1158  0249 2604          	jrne	L754
1159                     ; 211 				_key_blink = 1;
1161  024b 4c            	inc	a
1162  024c c70000        	ld	__key_blink,a
1163  024f               L754:
1164                     ; 213 			_disp_temp = __sUp==0 ? 1 : 0;
1166  024f c60000        	ld	a,___sUp
1167  0252 2603          	jrne	L27
1168  0254 4c            	inc	a
1169  0255 2001          	jra	L47
1170  0257               L27:
1171  0257 4f            	clr	a
1172  0258               L47:
1173  0258 c70000        	ld	__disp_temp,a
1174                     ; 214 			if( _disp_temp == 0 && _key_blink == 0 )
1176  025b 261c          	jrne	L164
1178  025d c60000        	ld	a,__key_blink
1179  0260 2617          	jrne	L164
1180                     ; 216 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
1182  0262 c60000        	ld	a,___sUp
1183  0265 a101          	cp	a,#1
1184  0267 270c          	jreq	L564
1186  0269 a102          	cp	a,#2
1187  026b 2708          	jreq	L564
1189  026d a105          	cp	a,#5
1190  026f 2704          	jreq	L564
1192  0271 a108          	cp	a,#8
1193  0273 2604          	jrne	L164
1194  0275               L564:
1195                     ; 217 					_disp_temp = 1;
1197  0275 35010000      	mov	__disp_temp,#1
1198  0279               L164:
1199                     ; 220 			if( __sUp == 0 && i == 1 )
1201  0279 c60000        	ld	a,___sUp
1202  027c 2609          	jrne	L374
1204  027e 7b01          	ld	a,(OFST+0,sp)
1205  0280 4a            	dec	a
1206  0281 2604          	jrne	L374
1207                     ; 222 marker_1_0:
1207                     ; 223 				_key_blink = 1;
1209  0283 35010000      	mov	__key_blink,#1
1210  0287               L374:
1211                     ; 226 			if( key == 1 )
1213  0287 7b02          	ld	a,(OFST+1,sp)
1214  0289 a101          	cp	a,#1
1215  028b 261e          	jrne	L574
1216                     ; 228 				if( __sUp == 0 )
1218  028d c60000        	ld	a,___sUp
1219  0290 2703cc0324    	jrne	L351
1220                     ; 230 					if( _key_blink == 1 )
1222  0295 c60000        	ld	a,__key_blink
1223  0298 4a            	dec	a
1224  0299 276e          	jreq	L761
1225                     ; 231 						goto DisplayEntry;
1227                     ; 232 					disp_status_loop_clientDn(3/*0*/);	//¡§¡>>YKˆ - subR/C selection
1229  029b a603          	ld	a,#3
1230  029d cd0000        	call	_disp_status_loop_clientDn
1232                     ; 233 					_dsCount = 4;
1234  02a0 35040000      	mov	__dsCount,#4
1235                     ; 235 					_disp_temp = 1;
1237  02a4 35010000      	mov	__disp_temp,#1
1239  02a8 cc032c        	jra	L305
1240  02ab               L574:
1241                     ; 245 			else if( key == /*2*/7 )
1243  02ab a107          	cp	a,#7
1244  02ad 260a          	jrne	L705
1245  02af cc033a        	jra	L551
1246  02b2               L751:
1247                     ; 250 marker_2s:
1247                     ; 251 				__sUp = 1;
1249  02b2 a601          	ld	a,#1
1250  02b4 cd0430        	call	LC007
1251                     ; 255 				_key_blink = 1;
1252  02b7 2040          	jra	L505
1253  02b9               L705:
1254                     ; 257 			else if( key == 3 )
1256  02b9 a103          	cp	a,#3
1257  02bb 2631          	jrne	L515
1258                     ; 259 				if( __sUp == 0 )
1260  02bd c60000        	ld	a,___sUp
1261  02c0 260f          	jrne	L715
1262                     ; 261 					if( _key_blink == 0 )
1264  02c2 725d0000      	tnz	__key_blink
1265  02c6 261d          	jrne	L325
1266                     ; 263 marker_1s:						
1266                     ; 264 						__s = 2;
1268  02c8 35020000      	mov	___s,#2
1269                     ; 265 						_dsCount = 0;
1271  02cc c70000        	ld	__dsCount,a
1272                     ; 266 						return;
1275  02cf 85            	popw	x
1276  02d0 81            	ret	
1277  02d1               L715:
1278                     ; 269 				else if( __sUp == 1 )
1280  02d1 a101          	cp	a,#1
1281  02d3 2607          	jrne	L525
1282                     ; 271 					if( _key_blink == 0 )
1284  02d5 c60000        	ld	a,__key_blink
1285  02d8 260b          	jrne	L325
1286                     ; 272 						goto marker_2;
1288  02da 205e          	jra	L551
1289  02dc               L525:
1290                     ; 274 				else if( __sUp == 2 )
1292  02dc a102          	cp	a,#2
1293  02de 2605          	jrne	L325
1294                     ; 276 					if( _key_blink == 0 )
1296  02e0 c60000        	ld	a,__key_blink
1297  02e3 2772          	jreq	L361
1298                     ; 277 						goto marker_4;
1300  02e5               L325:
1301                     ; 279 				disp_status_loop_init();
1303  02e5 cd0000        	call	_disp_status_loop_init
1305                     ; 280 				_key_blink = 0;
1307  02e8 725f0000      	clr	__key_blink
1309  02ec 200b          	jra	L505
1310  02ee               L515:
1311                     ; 282 			else if( key == /*4*/2 )
1313  02ee a102          	cp	a,#2
1314  02f0 2607          	jrne	L505
1315  02f2 2063          	jra	L361
1316  02f4               L561:
1317                     ; 287 marker_4s:
1317                     ; 288 				__sUp = 2;
1319  02f4 a602          	ld	a,#2
1320  02f6 cd0430        	call	LC007
1321  02f9               L505:
1322                     ; 294 			if( _key_blink == 1 )
1324  02f9 c60000        	ld	a,__key_blink
1325  02fc 4a            	dec	a
1326  02fd 2703cc0393    	jrne	L512
1327                     ; 296 				if( _key_sec >= KEY_BLINK_FADE )
1329  0302 c60000        	ld	a,__key_sec
1330  0305 a10a          	cp	a,#10
1331  0307 25f6          	jrult	L512
1332  0309               L761:
1333                     ; 298 DisplayEntry:					
1333                     ; 299 					//	reset key timer
1333                     ; 300 					lcd_blink_clear();
1335  0309 cd0000        	call	_lcd_blink_clear
1337                     ; 301 					_key_blink = 0;
1339  030c 725f0000      	clr	__key_blink
1340                     ; 302 					_dsCount = 10;
1342  0310 350a0000      	mov	__dsCount,#10
1343  0314 207d          	jra	L512
1344  0316               L344:
1345                     ; 307 		else if( _dsCount == 4 )
1347  0316 a104          	cp	a,#4
1348  0318 2657          	jrne	L355
1349                     ; 309 			if( key == 1 )		
1351  031a 7b02          	ld	a,(OFST+1,sp)
1352  031c a101          	cp	a,#1
1353  031e 2612          	jrne	L555
1354                     ; 317 				_dsCount = 1;	
1356  0320 35010000      	mov	__dsCount,#1
1357                     ; 318 				goto marker_1;	
1358  0324               L351:
1359                     ; 239 marker_1:					
1359                     ; 240 					__sUp = 0;
1361  0324 725f0000      	clr	___sUp
1362                     ; 241 					_dsCount = 0;
1364  0328 725f0000      	clr	__dsCount
1365  032c               L305:
1366                     ; 243 				_dsPrev = 0xff;
1368  032c 35ff0000      	mov	__dsPrev,#255
1370  0330 20c7          	jra	L505
1371  0332               L555:
1372                     ; 320 			else if( key == 2 )	{	_dsCount = 1;	goto marker_2;	}
1374  0332 a102          	cp	a,#2
1375  0334 2615          	jrne	L165
1378  0336 35010000      	mov	__dsCount,#1
1380  033a               L551:
1381                     ; 247 marker_2:				
1381                     ; 248 				if( __sUp == 1 && _key_blink == 1 )
1383  033a c60000        	ld	a,___sUp
1384  033d 4a            	dec	a
1385  033e 2703cc02b2    	jrne	L751
1387  0343 c60000        	ld	a,__key_blink
1388  0346 4a            	dec	a
1389  0347 26f7          	jrne	L751
1390                     ; 249 					goto DisplayEntry;
1392  0349 20be          	jra	L761
1393  034b               L165:
1394                     ; 321 			else if( key == 3 )	{	}
1396  034b a103          	cp	a,#3
1397  034d 2717          	jreq	L755
1399                     ; 322 			else if( key == 4 )	{	_dsCount = 1;	goto marker_4;	}
1401  034f a104          	cp	a,#4
1402  0351 2613          	jrne	L755
1405  0353 35010000      	mov	__dsCount,#1
1407  0357               L361:
1408                     ; 284 marker_4:				
1408                     ; 285 				if( __sUp == 2 && _key_blink == 1 )
1410  0357 c60000        	ld	a,___sUp
1411  035a a102          	cp	a,#2
1412  035c 2696          	jrne	L561
1414  035e c60000        	ld	a,__key_blink
1415  0361 4a            	dec	a
1416  0362 2690          	jrne	L561
1417                     ; 286 					goto DisplayEntry;
1419  0364 20a3          	jra	L761
1420  0366               L755:
1421                     ; 324 			if( uiInfo.enc != 0 )
1423  0366 c60000        	ld	a,_uiInfo
1424  0369 2728          	jreq	L512
1425                     ; 325 				_dsCount = 10;
1427  036b 350a0000      	mov	__dsCount,#10
1428  036f 2022          	jra	L512
1429  0371               L355:
1430                     ; 327 		else if( _dsCount == 5 )
1432  0371 a105          	cp	a,#5
1433  0373 260e          	jrne	L775
1434                     ; 329 			disp_status_loop_init();
1436  0375 cd0000        	call	_disp_status_loop_init
1438                     ; 330 			disp_status_loop_clientDn(1);	//	ø‹√‚∏µÂ «•Ω√
1440  0378 a601          	ld	a,#1
1441  037a cd0000        	call	_disp_status_loop_clientDn
1443                     ; 331 			_dsCount = 6;
1445  037d 35060000      	mov	__dsCount,#6
1447  0381 2010          	jra	L512
1448  0383               L775:
1449                     ; 333 		else if( _dsCount == 6 )
1451  0383 a106          	cp	a,#6
1452  0385 260c          	jrne	L512
1453                     ; 335 			if( _disp_mode != _disp_mode2 )
1455  0387 c60000        	ld	a,__disp_mode
1456  038a c10000        	cp	a,__disp_mode2
1457  038d 2704          	jreq	L512
1458                     ; 337 				_dsCount = 0;
1460  038f 725f0000      	clr	__dsCount
1461  0393               L512:
1462                     ; 341 		if( _dsCount == 15 || _dsCount == 16 || _dsCount == 25 || 
1462                     ; 342 				_dsCount == 35 || _dsCount == 45)
1464  0393 c60000        	ld	a,__dsCount
1465  0396 a10f          	cp	a,#15
1466  0398 2710          	jreq	L116
1468  039a a110          	cp	a,#16
1469  039c 270c          	jreq	L116
1471  039e a119          	cp	a,#25
1472  03a0 2708          	jreq	L116
1474  03a2 a123          	cp	a,#35
1475  03a4 2704          	jreq	L116
1477  03a6 a12d          	cp	a,#45
1478  03a8 262f          	jrne	L221
1479  03aa               L116:
1480                     ; 344 			if( _disp_mode != _disp_mode2 || packet_changed == 1)
1482  03aa c60000        	ld	a,__disp_mode
1483  03ad c10000        	cp	a,__disp_mode2
1484  03b0 2606          	jrne	L326
1486  03b2 c60000        	ld	a,_packet_changed
1487  03b5 4a            	dec	a
1488  03b6 2621          	jrne	L221
1489  03b8               L326:
1490                     ; 346 				packet_changed = 0;
1492  03b8 725f0000      	clr	_packet_changed
1493                     ; 347 				_dsCount = 10;
1495  03bc 350a0000      	mov	__dsCount,#10
1496                     ; 348 				_key_blink = 0;
1498  03c0 725f0000      	clr	__key_blink
1499                     ; 350 				if( _disp_mode2 == 0x01 )		
1501  03c4 c60000        	ld	a,__disp_mode2
1502  03c7 a101          	cp	a,#1
1503  03c9 2606          	jrne	L526
1504                     ; 352 					_dsCount = 0;
1506  03cb 725f0000      	clr	__dsCount
1507                     ; 353 					return;					
1509  03cf 2008          	jra	L221
1510  03d1               L526:
1511                     ; 355 				else if( _disp_mode2 == 0x02 )	
1513  03d1 a102          	cp	a,#2
1514  03d3 2606          	jrne	L136
1515                     ; 357 					__sUp = 16;//	ø‹√‚
1517  03d5 35100000      	mov	___sUp,#16
1518                     ; 358 					return;
1519  03d9               L221:
1522  03d9 85            	popw	x
1523  03da 81            	ret	
1524  03db               L136:
1525                     ; 360 				else if( _disp_mode2 == 0x04 )	
1527  03db a104          	cp	a,#4
1528  03dd 2606          	jrne	L536
1529                     ; 362 					__sUp = 5;	// ¡§¡ˆ
1531  03df 35050000      	mov	___sUp,#5
1532                     ; 363 					return;
1534  03e3 20f4          	jra	L221
1535  03e5               L536:
1536                     ; 365 				else if( _disp_mode2 == 0x08 )	
1538  03e5 a108          	cp	a,#8
1539  03e7 2606          	jrne	L146
1540                     ; 367 					__sUp = 1;
1542  03e9 35010000      	mov	___sUp,#1
1543                     ; 368 					_key_sec = _key_min = _key_hour = 0;
1545  03ed 2008          	jra	L726
1546  03ef               L146:
1547                     ; 371 				else if( _disp_mode2 == 0x10 )	
1549  03ef a110          	cp	a,#16
1550  03f1 26e6          	jrne	L221
1551                     ; 373 					__sUp = 2;
1553  03f3 35020000      	mov	___sUp,#2
1554                     ; 374 					_key_sec = _key_min = _key_hour = 0;
1557  03f7               L726:
1559  03f7 725f0000      	clr	__key_hour
1560  03fb 725f0000      	clr	__key_min
1561  03ff 725f0000      	clr	__key_sec
1562                     ; 380 				disp_status_loop_init();
1564  0403 cd0000        	call	_disp_status_loop_init
1566  0406 20d1          	jra	L221
1567                     ; 378 					return;
1569  0408               L702:
1570                     ; 384 	else if( __s == 2 )
1572  0408 a102          	cp	a,#2
1573  040a 26cd          	jrne	L221
1574                     ; 386 		disp_backlight(0);
1576  040c 4f            	clr	a
1577  040d cd0000        	call	_disp_backlight
1579                     ; 387 		if( key == 1 || key == 2 || key == 3 || key == 4 )
1581  0410 7b02          	ld	a,(OFST+1,sp)
1582  0412 a101          	cp	a,#1
1583  0414 270c          	jreq	L756
1585  0416 a102          	cp	a,#2
1586  0418 2708          	jreq	L756
1588  041a a103          	cp	a,#3
1589  041c 2704          	jreq	L756
1591  041e a104          	cp	a,#4
1592  0420 26b7          	jrne	L221
1593  0422               L756:
1594                     ; 389 			__s = 0;
1596  0422 725f0000      	clr	___s
1597                     ; 390 			_dsCount = 0;
1599  0426 725f0000      	clr	__dsCount
1600                     ; 391 			file_update2(0);
1602  042a 4f            	clr	a
1603  042b cd0000        	call	_file_update2
1605                     ; 394 }
1607  042e 20a9          	jra	L221
1608  0430               LC007:
1609  0430 c70000        	ld	___sUp,a
1610                     ; 252 				_dsPrev = 0xff;
1612  0433 35ff0000      	mov	__dsPrev,#255
1613                     ; 253 				disp_status_loop_message(__sUp);
1615  0437 cd0000        	call	_disp_status_loop_message
1617                     ; 255 				_key_blink = 1;
1619  043a 35010000      	mov	__key_blink,#1
1620  043e 81            	ret	
1673                     	xref	_disp_status_loop_host_Out
1674                     	xref	_disp_status_loop_host_Off
1675                     	xref	_timerClear
1676                     	xref	__backlight_get_code
1677                     	xref	__backlight_get_index
1678                     	xdef	___rcCb
1679                     	xref	_start_flag
1680                     	xref	__backup_backlight2
1681                     	xref	_packet_changed
1682                     	xref	__disp_temp
1683                     	xdef	_lcd_pwmCount2
1684                     	xdef	_lcd_pwmIndex2
1685                     	xdef	__backlight
1686                     	xdef	__lcdEnable
1687                     	switch	.bss
1688  0000               __lcdTimer:
1689  0000 00000000      	ds.b	4
1690                     	xdef	__lcdTimer
1691                     	xdef	_disp_backlight
1692                     	xref	_file_update2
1693                     	xref	__key_blink
1694                     	xref	__key_hour
1695                     	xref	__key_min
1696                     	xref	__key_sec
1697                     	xref	__disp_mode2
1698                     	xref	__disp_mode
1699                     	xdef	_disp_status_loop_clientDn
1700                     	xref	_disp_status_curr_only
1701                     	xref	_disp_status_loop_init
1702                     	xref	_disp_status_loop_host_B
1703                     	xref	_disp_status_loop_host_Y
1704                     	xref	_disp_status_loop_host_N
1705                     	xdef	_disp_status_loop_messageDn
1706                     	xref	_disp_status_loop_message
1707                     	xref	__dsPrev
1708                     	xref	__dsCount
1709                     	xdef	_disp_status_loop_client
1710                     	xref	___sDn
1711                     	xref	___sUp
1712                     	xref	___s
1713                     	xref	_lcd_blink_clear
1714                     	xref	_lcd_disp_n
1715                     	xref	_lcd_clear
1716                     	xref	_lcd_disp_backlight
1717                     	xref	_lcd_clear_btn
1718                     	xref	_iLF_DEF
1719                     	xref	_bLF_DEF
1720                     	xref	_uiInfo
1740                     	end
