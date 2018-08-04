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
  28  0002 61            	dc.b	97
  29  0003               __backlight:
  30  0003 02            	dc.b	2
  31  0004               __abc:
  32  0004 00            	dc.b	0
  75                     ; 68 void	__rcCb(void)
  75                     ; 69 {
  76                     .text:	section	.text,new
  77  0000               f___rcCb:
  79  0000 88            	push	a
  80       00000001      OFST:	set	1
  83                     ; 71 	i = _backup_backlight2==0 ? _backlight : BACKLIGHT_MAX_LEVEL;
  85  0001 c60000        	ld	a,__backup_backlight2
  86  0004 2605          	jrne	L6
  87  0006 c60003        	ld	a,__backlight
  88  0009 2002          	jra	L01
  89  000b               L6:
  90  000b a660          	ld	a,#96
  91  000d               L01:
  92  000d 6b01          	ld	(OFST+0,sp),a
  93                     ; 87 		_abc = i;
  95  000f c70004        	ld	__abc,a
  96                     ; 89 	if( lcd_pwmIndex2 <= i )	{	PWM_HIGH;	}
  98  0012 c60001        	ld	a,_lcd_pwmIndex2
  99  0015 1101          	cp	a,(OFST+0,sp)
 100  0017 2206          	jrugt	L52
 103  0019 721c5014      	bset	20500,#6
 105  001d 2004          	jra	L72
 106  001f               L52:
 107                     ; 90 	else					{	PWM_LOW;	}
 109  001f 721d5014      	bres	20500,#6
 110  0023               L72:
 111                     ; 92 	lcd_pwmIndex2++;
 113  0023 725c0001      	inc	_lcd_pwmIndex2
 114                     ; 93 	if( lcd_pwmIndex2 >= lcd_pwmCount2 )
 116  0027 c60001        	ld	a,_lcd_pwmIndex2
 117  002a c10002        	cp	a,_lcd_pwmCount2
 118  002d 2504          	jrult	L13
 119                     ; 94 		lcd_pwmIndex2 = 0;
 121  002f 725f0001      	clr	_lcd_pwmIndex2
 122  0033               L13:
 123                     ; 185 }
 126  0033 84            	pop	a
 127  0034 87            	retf	
 175                     ; 187 void	disp_backlight(uint8_t mode)
 175                     ; 188 {
 176                     .text:	section	.text,new
 177  0000               f_disp_backlight:
 179       00000001      OFST:	set	1
 182                     ; 192 	_backup_backlight2 = 0;
 184  0000 725f0000      	clr	__backup_backlight2
 185  0004 88            	push	a
 186                     ; 194 	if( _dsCount == 0 )
 188  0005 c60000        	ld	a,__dsCount
 189  0008 2613          	jrne	L15
 190                     ; 196 		lcd_clear(0);
 192  000a 8d000000      	callf	f_lcd_clear
 194                     ; 197 		lcd_disp_backlight();
 196  000e 8d000000      	callf	f_lcd_disp_backlight
 198                     ; 198 		_dsCount = 1;
 200  0012 35010000      	mov	__dsCount,#1
 201                     ; 199 		uiInfo._t = _backlight;
 203  0016 550003005f    	mov	_uiInfo+95,__backlight
 205  001b 2060          	jra	L35
 206  001d               L15:
 207                     ; 203 		i = _backlight;
 209  001d c60003        	ld	a,__backlight
 210  0020 6b01          	ld	(OFST+0,sp),a
 211                     ; 204 		i = _backlight_get_index(i);
 213  0022 8d000000      	callf	f__backlight_get_index
 215  0026 6b01          	ld	(OFST+0,sp),a
 216                     ; 205 		if( uiInfo.enc != 0 )
 218  0028 c60000        	ld	a,_uiInfo
 219  002b 2729          	jreq	L55
 220                     ; 209 			ENC_MOVE_0(1, 5, 1);
 222  002d a540          	bcp	a,#64
 223  002f 260e          	jrne	L75
 226  0031 7b01          	ld	a,(OFST+0,sp)
 227  0033 a102          	cp	a,#2
 228  0035 2404          	jruge	L16
 231  0037 a605          	ld	a,#5
 233  0039 200c          	jpf	LC001
 234  003b               L16:
 237  003b 0a01          	dec	(OFST+0,sp)
 238  003d 200e          	jra	L56
 239  003f               L75:
 242  003f 7b01          	ld	a,(OFST+0,sp)
 243  0041 a105          	cp	a,#5
 244  0043 2506          	jrult	L76
 247  0045 a601          	ld	a,#1
 248  0047               LC001:
 249  0047 6b01          	ld	(OFST+0,sp),a
 251  0049 2002          	jra	L56
 252  004b               L76:
 255  004b 0c01          	inc	(OFST+0,sp)
 256  004d               L56:
 257                     ; 210 			_backlight = _backlight_get_code(i);
 260  004d 7b01          	ld	a,(OFST+0,sp)
 261  004f 8d000000      	callf	f__backlight_get_code
 263  0053 c70003        	ld	__backlight,a
 264  0056               L55:
 265                     ; 213 		if( _dsPrev != i )
 267  0056 c60000        	ld	a,__dsPrev
 268  0059 1101          	cp	a,(OFST+0,sp)
 269  005b 2720          	jreq	L35
 270                     ; 215 			_dsPrev = i;
 272  005d 7b01          	ld	a,(OFST+0,sp)
 273  005f c70000        	ld	__dsPrev,a
 274                     ; 216 			UI_DISP_2Digit(i);
 276  0062 5f            	clrw	x
 277  0063 97            	ld	xl,a
 278  0064 a60a          	ld	a,#10
 279  0066 62            	div	x,a
 280  0067 a602          	ld	a,#2
 281  0069 95            	ld	xh,a
 282  006a 8d000000      	callf	f_lcd_disp_n
 286  006e 7b01          	ld	a,(OFST+0,sp)
 287  0070 5f            	clrw	x
 288  0071 97            	ld	xl,a
 289  0072 a60a          	ld	a,#10
 290  0074 62            	div	x,a
 291  0075 97            	ld	xl,a
 292  0076 a603          	ld	a,#3
 293  0078 95            	ld	xh,a
 294  0079 8d000000      	callf	f_lcd_disp_n
 297  007d               L35:
 298                     ; 219 }
 301  007d 84            	pop	a
 302  007e 87            	retf	
 340                     ; 223 void	disp_status_loop_messageDn(uint8_t i)
 340                     ; 224 {
 341                     .text:	section	.text,new
 342  0000               f_disp_status_loop_messageDn:
 344  0000 88            	push	a
 345       00000000      OFST:	set	0
 348                     ; 225 	lcd_clear_btn();
 350  0001 8d000000      	callf	f_lcd_clear_btn
 352                     ; 226 	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(/*bS9*/bT7);	/*	¿ÜÃâ*/	}
 354  0005 7b01          	ld	a,(OFST+1,sp)
 355  0007 4a            	dec	a
 356  0008 260a          	jrne	L111
 359  000a 35020000      	mov	__disp_mode,#2
 362  000e 8d6d006d      	callf	LC003
 364  0012 204b          	jpf	LC002
 365  0014               L111:
 366                     ; 227 	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(/*bS10*/bT7);	/*	Á¤Áö*/	}
 368  0014 7b01          	ld	a,(OFST+1,sp)
 369  0016 260a          	jrne	L511
 372  0018 35040000      	mov	__disp_mode,#4
 375  001c 8d6d006d      	callf	LC003
 377  0020 203d          	jpf	LC002
 378  0022               L511:
 379                     ; 228 	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(/*bS6*/bT6);	/*	³­¹æ*/	}
 381  0022 a102          	cp	a,#2
 382  0024 2611          	jrne	L121
 385  0026 35010000      	mov	__disp_mode,#1
 388  002a 5f            	clrw	x
 389  002b c60006        	ld	a,_iLF_DEF+6
 390  002e 97            	ld	xl,a
 391  002f d6540c        	ld	a,(21516,x)
 392  0032 ca0006        	or	a,_bLF_DEF+6
 394  0035 2028          	jpf	LC002
 395  0037               L121:
 396                     ; 229 	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(/*bS7*/bT14);	/*	¿¹¾à*/	}
 398  0037 a103          	cp	a,#3
 399  0039 2611          	jrne	L521
 402  003b 35080000      	mov	__disp_mode,#8
 405  003f 5f            	clrw	x
 406  0040 c60041        	ld	a,_iLF_DEF+65
 407  0043 97            	ld	xl,a
 408  0044 d6540c        	ld	a,(21516,x)
 409  0047 ca0041        	or	a,_bLF_DEF+65
 411  004a 2013          	jpf	LC002
 412  004c               L521:
 413                     ; 230 	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(/*bS8*/bT18);	/*	¹Ýº¹*/	}
 415  004c a104          	cp	a,#4
 416  004e 2612          	jrne	L311
 419  0050 35100000      	mov	__disp_mode,#16
 422  0054 5f            	clrw	x
 423  0055 c60042        	ld	a,_iLF_DEF+66
 424  0058 97            	ld	xl,a
 425  0059 d6540c        	ld	a,(21516,x)
 426  005c ca0042        	or	a,_bLF_DEF+66
 427  005f               LC002:
 428  005f d7540c        	ld	(21516,x),a
 429  0062               L311:
 430                     ; 231 	_disp_mode2 = _disp_mode;
 432  0062 5500000000    	mov	__disp_mode2,__disp_mode
 433                     ; 232 	timerClear();
 435  0067 8d000000      	callf	f_timerClear
 437                     ; 233 }
 440  006b 84            	pop	a
 441  006c 87            	retf	
 442  006d               LC003:
 443  006d 5f            	clrw	x
 444  006e c60019        	ld	a,_iLF_DEF+25
 445  0071 97            	ld	xl,a
 446  0072 d6540c        	ld	a,(21516,x)
 447  0075 ca0019        	or	a,_bLF_DEF+25
 448  0078 87            	retf	
 483                     ; 235 void	disp_status_loop_clientDn(uint8_t key)
 483                     ; 236 {
 484                     .text:	section	.text,new
 485  0000               f_disp_status_loop_clientDn:
 489                     ; 238 	disp_status_loop_messageDn(key);
 491  0000 8d000000      	callf	f_disp_status_loop_messageDn
 493                     ; 239 	disp_status_curr_only();
 495  0004 8d000000      	callf	f_disp_status_curr_only
 497                     ; 240 	lcd_blink_clear();
 500                     ; 241 }
 503  0008 ac000000      	jpf	f_lcd_blink_clear
 569                     ; 250 void	disp_status_loop_client(uint8_t key)
 569                     ; 251 {
 570                     .text:	section	.text,new
 571  0000               f_disp_status_loop_client:
 573  0000 88            	push	a
 574  0001 88            	push	a
 575       00000001      OFST:	set	1
 578                     ; 252 	uint8_t	i = 0;
 580  0002 0f01          	clr	(OFST+0,sp)
 581                     ; 253 	if( __s == 0 )
 583  0004 c60000        	ld	a,___s
 584  0007 2704ac450445  	jrne	L502
 585                     ; 255 		if( _dsCount == 0 )
 587  000d c60000        	ld	a,__dsCount
 588  0010 2619          	jrne	L702
 589                     ; 257 			_dsCount = 10;
 591  0012 350a0000      	mov	__dsCount,#10
 592                     ; 259 			if (start_flag == 0) {
 594  0016 725d0000      	tnz	_start_flag
 595  001a 2603          	jrne	L112
 596                     ; 260 				__sUp = 0;
 598  001c c70000        	ld	___sUp,a
 599  001f               L112:
 600                     ; 262 			start_flag = 0;
 602  001f 725f0000      	clr	_start_flag
 603                     ; 264 			__sDn = 0xff;
 605  0023 35ff0000      	mov	___sDn,#255
 607  0027 acca03ca      	jra	L312
 608  002b               L702:
 609                     ; 267 		else if( _dsCount == 10 )
 611  002b a10a          	cp	a,#10
 612  002d 264d          	jrne	L512
 613                     ; 269 			if( __sUp == 0 )		_dsCount = 15;	//	N
 615  002f c60000        	ld	a,___sUp
 616  0032 2606          	jrne	L712
 619  0034 350f0000      	mov	__dsCount,#15
 621  0038 203a          	jra	L122
 622  003a               L712:
 623                     ; 270 			else if( __sUp == 1 )	_dsCount = 35;	//	¿¹¾à
 625  003a a101          	cp	a,#1
 626  003c 2606          	jrne	L322
 629  003e 35230000      	mov	__dsCount,#35
 631  0042 2030          	jra	L122
 632  0044               L322:
 633                     ; 271 			else if( __sUp == 2 )	_dsCount = 25;	//	B
 635  0044 a102          	cp	a,#2
 636  0046 2606          	jrne	L722
 639  0048 35190000      	mov	__dsCount,#25
 641  004c 2026          	jra	L122
 642  004e               L722:
 643                     ; 272 			else if( __sUp == 5 )	_dsCount = 45;	//	J
 645  004e a105          	cp	a,#5
 646  0050 2606          	jrne	L332
 649  0052 352d0000      	mov	__dsCount,#45
 651  0056 201c          	jra	L122
 652  0058               L332:
 653                     ; 273 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //out
 655  0058 a110          	cp	a,#16
 656  005a 260a          	jrne	L732
 659  005c 35100000      	mov	__dsCount,#16
 662  0060 35080000      	mov	___sUp,#8
 664  0064 200e          	jra	L122
 665  0066               L732:
 666                     ; 274 			else if( __sUp == 151 )	_dsCount = 151;	//	N->OUT
 668  0066 a197          	cp	a,#151
 669  0068 2606          	jrne	L342
 672  006a 35970000      	mov	__dsCount,#151
 674  006e 2004          	jra	L122
 675  0070               L342:
 676                     ; 276 				_dsCount = 1;
 678  0070 35010000      	mov	__dsCount,#1
 679  0074               L122:
 680                     ; 277 			disp_status_loop_init();
 682  0074 8d000000      	callf	f_disp_status_loop_init
 685  0078 acca03ca      	jra	L312
 686  007c               L512:
 687                     ; 279 		else if( _dsCount == 15 )			//	N/OUT
 689  007c a10f          	cp	a,#15
 690  007e 2659          	jrne	L152
 691                     ; 281 			if( key==1 )		_GOTO(151)	//	To OUT
 693  0080 7b02          	ld	a,(OFST+1,sp)
 694  0082 a101          	cp	a,#1
 695  0084 260a          	jrne	L352
 698  0086 35970000      	mov	___sUp,#151
 701  008a 350a0000      	mov	__dsCount,#10
 703  008e 2032          	jra	L552
 704  0090               L352:
 705                     ; 282 			else if( key==2 )	{ _NOT_KEY_ }	//	
 707  0090 a102          	cp	a,#2
 708  0092 272e          	jreq	L552
 711                     ; 283 			else if( key==4 )	_GOTO(2)	//	BAN
 713  0094 a104          	cp	a,#4
 714  0096 260a          	jrne	L362
 717  0098 35020000      	mov	___sUp,#2
 720  009c 350a0000      	mov	__dsCount,#10
 722  00a0 2020          	jra	L552
 723  00a2               L362:
 724                     ; 284 			else if( key==8 )	_GOTO(1)	//	¿¹¾à
 726  00a2 a108          	cp	a,#8
 727  00a4 260a          	jrne	L762
 730  00a6 35010000      	mov	___sUp,#1
 733  00aa 350a0000      	mov	__dsCount,#10
 735  00ae 2012          	jra	L552
 736  00b0               L762:
 737                     ; 285 			else if( key==16 )	_DN
 739  00b0 a110          	cp	a,#16
 740  00b2 2606          	jrne	L372
 743  00b4 35400000      	mov	_uiInfo,#64
 745  00b8 2008          	jra	L552
 746  00ba               L372:
 747                     ; 286 			else if( key==32 )	_UP
 749  00ba a120          	cp	a,#32
 750  00bc 2604          	jrne	L552
 753  00be 35010000      	mov	_uiInfo,#1
 754  00c2               L552:
 755                     ; 287 			_disp_temp = 1;
 757  00c2 35010000      	mov	__disp_temp,#1
 758                     ; 288 			i = disp_status_loop_host_N(key);
 760  00c6 7b02          	ld	a,(OFST+1,sp)
 761  00c8 8d000000      	callf	f_disp_status_loop_host_N
 763  00cc 6b01          	ld	(OFST+0,sp),a
 764                     ; 289 			if( i==1 )
 766  00ce 4a            	dec	a
 767  00cf 26a7          	jrne	L312
 768                     ; 290 				_key_blink = 1;
 770  00d1 35010000      	mov	__key_blink,#1
 771  00d5 acca03ca      	jra	L312
 772  00d9               L152:
 773                     ; 292 		else if( _dsCount == 151 )			//	OUT/Nan
 775  00d9 a197          	cp	a,#151
 776  00db 263d          	jrne	L503
 777                     ; 295 			if( key==1 )		_GOTO(0)	//	To Nan	
 779  00dd 7b02          	ld	a,(OFST+1,sp)
 780  00df a101          	cp	a,#1
 781  00e1 2606          	jrne	L703
 784  00e3 725f0000      	clr	___sUp
 787  00e7 2016          	jpf	LC004
 788  00e9               L703:
 789                     ; 296 			else if( key==2 )	{ _NOT_KEY_ }	//	
 791  00e9 a102          	cp	a,#2
 792  00eb 2716          	jreq	L323
 795                     ; 297 			else if( key==4 )	_GOTO(2)	//	BAN
 797  00ed a104          	cp	a,#4
 798  00ef 2606          	jrne	L713
 801  00f1 35020000      	mov	___sUp,#2
 804  00f5 2008          	jpf	LC004
 805  00f7               L713:
 806                     ; 298 			else if( key==8 )	_GOTO(1)	//	¿¹¾à
 808  00f7 a108          	cp	a,#8
 809  00f9 2608          	jrne	L323
 812  00fb 35010000      	mov	___sUp,#1
 815  00ff               LC004:
 818  00ff 350a0000      	mov	__dsCount,#10
 820  0103               L323:
 821                     ; 299 			else if( key==16 )	{ _NOT_DEF_; }	//	DN
 826                     ; 300 			else if( key==32 )	{ _NOT_DEF_; }	//	UP
 830                     ; 301 			_disp_temp = 1;
 832  0103 35010000      	mov	__disp_temp,#1
 833                     ; 302 			i = disp_status_loop_host_N2OUT(key);
 835  0107 7b02          	ld	a,(OFST+1,sp)
 836  0109 8d000000      	callf	f_disp_status_loop_host_N2OUT
 838  010d 6b01          	ld	(OFST+0,sp),a
 839                     ; 303 			if( i==1 )
 841  010f 4a            	dec	a
 842  0110 26c3          	jrne	L312
 843                     ; 304 				_key_blink = 1;
 845  0112 35010000      	mov	__key_blink,#1
 846  0116 acca03ca      	jra	L312
 847  011a               L503:
 848                     ; 306 		else if( _dsCount == 16 )			//	OUT
 850  011a a110          	cp	a,#16
 851  011c 2635          	jrne	L143
 852                     ; 309 			if( key==1 )		_GOTO(0)	//	N
 854  011e 7b02          	ld	a,(OFST+1,sp)
 855  0120 a101          	cp	a,#1
 859  0122 2708          	jreq	LC006
 860                     ; 310 			else if( key==2 )	{ _NOT_KEY_ }	//	
 862  0124 a102          	cp	a,#2
 863  0126 2716          	jreq	L543
 866                     ; 311 			else if( key==4 )	_GOTO(0)	//	N
 868  0128 a104          	cp	a,#4
 869  012a 2606          	jrne	L353
 872  012c               LC006:
 874  012c 725f0000      	clr	___sUp
 877  0130 2008          	jpf	LC005
 878  0132               L353:
 879                     ; 312 			else if( key==8 )	_GOTO(5)	//	Off
 881  0132 a108          	cp	a,#8
 882  0134 2608          	jrne	L543
 885  0136 35050000      	mov	___sUp,#5
 888  013a               LC005:
 891  013a 350a0000      	mov	__dsCount,#10
 892  013e               L543:
 893                     ; 313 			_disp_temp = 1;
 895  013e 35010000      	mov	__disp_temp,#1
 896                     ; 314 			i = disp_status_loop_host_Out(key);
 898  0142 8d000000      	callf	f_disp_status_loop_host_Out
 900  0146 6b01          	ld	(OFST+0,sp),a
 901                     ; 315 			if( i==1 )
 903  0148 4a            	dec	a
 904  0149 26cb          	jrne	L312
 905                     ; 316 				_key_blink = 1;
 907  014b 35010000      	mov	__key_blink,#1
 908  014f acca03ca      	jra	L312
 909  0153               L143:
 910                     ; 318 		else if( _dsCount == 25 )			//	B
 912  0153 a119          	cp	a,#25
 913  0155 2655          	jrne	L563
 914                     ; 320 			if( key==1 )		_GOTO(0)	//	NAN
 916  0157 7b02          	ld	a,(OFST+1,sp)
 917  0159 a101          	cp	a,#1
 918  015b 260a          	jrne	L763
 921  015d 725f0000      	clr	___sUp
 924  0161 350a0000      	mov	__dsCount,#10
 926  0165 2032          	jra	L173
 927  0167               L763:
 928                     ; 321 			else if( key==2 )	{ _NOT_KEY_ }	//	
 930  0167 a102          	cp	a,#2
 931  0169 272e          	jreq	L173
 934                     ; 322 			else if( key==4 )	_GOTO(0)	//	NAN
 936  016b a104          	cp	a,#4
 937  016d 260a          	jrne	L773
 940  016f 725f0000      	clr	___sUp
 943  0173 350a0000      	mov	__dsCount,#10
 945  0177 2020          	jra	L173
 946  0179               L773:
 947                     ; 323 			else if( key==8 )	_GOTO(1)	//	¿¹¾à
 949  0179 a108          	cp	a,#8
 950  017b 260a          	jrne	L304
 953  017d 35010000      	mov	___sUp,#1
 956  0181 350a0000      	mov	__dsCount,#10
 958  0185 2012          	jra	L173
 959  0187               L304:
 960                     ; 324 			else if( key==16 )	_DN
 962  0187 a110          	cp	a,#16
 963  0189 2606          	jrne	L704
 966  018b 35400000      	mov	_uiInfo,#64
 968  018f 2008          	jra	L173
 969  0191               L704:
 970                     ; 325 			else if( key==32 )	_UP
 972  0191 a120          	cp	a,#32
 973  0193 2604          	jrne	L173
 976  0195 35010000      	mov	_uiInfo,#1
 977  0199               L173:
 978                     ; 327 			i = disp_status_loop_host_B(key);
 980  0199 7b02          	ld	a,(OFST+1,sp)
 981  019b 8d000000      	callf	f_disp_status_loop_host_B
 983  019f 6b01          	ld	(OFST+0,sp),a
 984                     ; 328 			if( i==1 )
 986  01a1 4a            	dec	a
 987  01a2 26ab          	jrne	L312
 988                     ; 329 				_key_blink = 1;
 990  01a4 35010000      	mov	__key_blink,#1
 991  01a8 acca03ca      	jra	L312
 992  01ac               L563:
 993                     ; 331 		else if( _dsCount == 35 )			//	¿¹¾à
 995  01ac a123          	cp	a,#35
 996  01ae 2655          	jrne	L124
 997                     ; 333 			if( key==1 )		_GOTO(0)	//	NAN
 999  01b0 7b02          	ld	a,(OFST+1,sp)
1000  01b2 a101          	cp	a,#1
1001  01b4 260a          	jrne	L324
1004  01b6 725f0000      	clr	___sUp
1007  01ba 350a0000      	mov	__dsCount,#10
1009  01be 2032          	jra	L524
1010  01c0               L324:
1011                     ; 334 			else if( key==2 )	{ _NOT_KEY_ }	//	
1013  01c0 a102          	cp	a,#2
1014  01c2 272e          	jreq	L524
1017                     ; 335 			else if( key==4 )	_GOTO(2)	//	BAN
1019  01c4 a104          	cp	a,#4
1020  01c6 260a          	jrne	L334
1023  01c8 35020000      	mov	___sUp,#2
1026  01cc 350a0000      	mov	__dsCount,#10
1028  01d0 2020          	jra	L524
1029  01d2               L334:
1030                     ; 336 			else if( key==8 )	_GOTO(0)	//	NAN
1032  01d2 a108          	cp	a,#8
1033  01d4 260a          	jrne	L734
1036  01d6 725f0000      	clr	___sUp
1039  01da 350a0000      	mov	__dsCount,#10
1041  01de 2012          	jra	L524
1042  01e0               L734:
1043                     ; 337 			else if( key==16 )	_DN
1045  01e0 a110          	cp	a,#16
1046  01e2 2606          	jrne	L344
1049  01e4 35400000      	mov	_uiInfo,#64
1051  01e8 2008          	jra	L524
1052  01ea               L344:
1053                     ; 338 			else if( key==32 )	_UP
1055  01ea a120          	cp	a,#32
1056  01ec 2604          	jrne	L524
1059  01ee 35010000      	mov	_uiInfo,#1
1060  01f2               L524:
1061                     ; 340 			i = disp_status_loop_host_Y(key);
1063  01f2 7b02          	ld	a,(OFST+1,sp)
1064  01f4 8d000000      	callf	f_disp_status_loop_host_Y
1066  01f8 6b01          	ld	(OFST+0,sp),a
1067                     ; 341 			if( i==1 )
1069  01fa 4a            	dec	a
1070  01fb 26ab          	jrne	L312
1071                     ; 342 				_key_blink = 1;
1073  01fd 35010000      	mov	__key_blink,#1
1074  0201 acca03ca      	jra	L312
1075  0205               L124:
1076                     ; 344 		else if( _dsCount == 45 )			//	OFF
1078  0205 a12d          	cp	a,#45
1079  0207 2639          	jrne	L554
1080                     ; 346 			if( key==1 )		_GOTO(1)	//	Y
1082  0209 7b02          	ld	a,(OFST+1,sp)
1083  020b a101          	cp	a,#1
1084  020d 2606          	jrne	L754
1087  020f 35010000      	mov	___sUp,#1
1090  0213 2016          	jpf	LC007
1091  0215               L754:
1092                     ; 347 			else if( key==2 )	_GOTO(2)	//	Ban
1094  0215 a102          	cp	a,#2
1095  0217 2606          	jrne	L364
1098  0219 35020000      	mov	___sUp,#2
1101  021d 200c          	jpf	LC007
1102  021f               L364:
1103                     ; 348 			else if( key==4 )	_GOTO(0)	//	N
1105  021f a104          	cp	a,#4
1109  0221 2704          	jreq	LC008
1110                     ; 349 			else if( key==8 )	_GOTO(0)	//	On
1112  0223 a108          	cp	a,#8
1113  0225 260a          	jrne	L164
1116  0227               LC008:
1118  0227 725f0000      	clr	___sUp
1121  022b               LC007:
1125  022b 350a0000      	mov	__dsCount,#10
1126  022f 7b02          	ld	a,(OFST+1,sp)
1127  0231               L164:
1128                     ; 350 			i = disp_status_loop_host_Off(key);
1130  0231 8d000000      	callf	f_disp_status_loop_host_Off
1132  0235 6b01          	ld	(OFST+0,sp),a
1133                     ; 351 			if( i==1 )
1135  0237 4a            	dec	a
1136  0238 26c7          	jrne	L312
1137                     ; 352 				_key_blink = 1;
1139  023a 35010000      	mov	__key_blink,#1
1140  023e acca03ca      	jra	L312
1141  0242               L554:
1142                     ; 354 		else if( _dsCount == 1 )
1144  0242 a101          	cp	a,#1
1145  0244 2704ac4a034a  	jrne	L105
1146                     ; 356 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
1148  024a c60000        	ld	a,___sUp
1149  024d 2608          	jrne	L305
1152  024f 7b02          	ld	a,(OFST+1,sp)
1153  0251 8d000000      	callf	f_disp_status_loop_host_N
1156  0255 2016          	jpf	LC009
1157  0257               L305:
1158                     ; 357 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
1160  0257 a101          	cp	a,#1
1161  0259 2608          	jrne	L705
1164  025b 7b02          	ld	a,(OFST+1,sp)
1165  025d 8d000000      	callf	f_disp_status_loop_host_Y
1168  0261 200a          	jpf	LC009
1169  0263               L705:
1170                     ; 358 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
1172  0263 a102          	cp	a,#2
1173  0265 2608          	jrne	L505
1176  0267 7b02          	ld	a,(OFST+1,sp)
1177  0269 8d000000      	callf	f_disp_status_loop_host_B
1179  026d               LC009:
1180  026d 6b01          	ld	(OFST+0,sp),a
1181  026f               L505:
1182                     ; 360 			if( i==1 )
1184  026f 7b01          	ld	a,(OFST+0,sp)
1185  0271 4a            	dec	a
1186  0272 2604          	jrne	L515
1187                     ; 361 				_key_blink = 1;
1189  0274 4c            	inc	a
1190  0275 c70000        	ld	__key_blink,a
1191  0278               L515:
1192                     ; 363 			_disp_temp = __sUp==0 ? 1 : 0;
1194  0278 c60000        	ld	a,___sUp
1195  027b 2603          	jrne	L47
1196  027d 4c            	inc	a
1197  027e 2001          	jra	L67
1198  0280               L47:
1199  0280 4f            	clr	a
1200  0281               L67:
1201  0281 c70000        	ld	__disp_temp,a
1202                     ; 364 			if( _disp_temp == 0 && _key_blink == 0 )
1204  0284 261c          	jrne	L715
1206  0286 c60000        	ld	a,__key_blink
1207  0289 2617          	jrne	L715
1208                     ; 366 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
1210  028b c60000        	ld	a,___sUp
1211  028e a101          	cp	a,#1
1212  0290 270c          	jreq	L325
1214  0292 a102          	cp	a,#2
1215  0294 2708          	jreq	L325
1217  0296 a105          	cp	a,#5
1218  0298 2704          	jreq	L325
1220  029a a108          	cp	a,#8
1221  029c 2604          	jrne	L715
1222  029e               L325:
1223                     ; 367 					_disp_temp = 1;
1225  029e 35010000      	mov	__disp_temp,#1
1226  02a2               L715:
1227                     ; 370 			if( __sUp == 0 && i == 1 )
1229  02a2 c60000        	ld	a,___sUp
1230  02a5 2609          	jrne	L135
1232  02a7 7b01          	ld	a,(OFST+0,sp)
1233  02a9 4a            	dec	a
1234  02aa 2604          	jrne	L135
1235                     ; 372 marker_1_0:
1235                     ; 373 				_key_blink = 1;
1237  02ac 35010000      	mov	__key_blink,#1
1238  02b0               L135:
1239                     ; 376 			if( key == 1 )
1241  02b0 7b02          	ld	a,(OFST+1,sp)
1242  02b2 a101          	cp	a,#1
1243  02b4 2621          	jrne	L335
1244                     ; 378 				if( __sUp == 0 )
1246  02b6 c60000        	ld	a,___sUp
1247  02b9 2704ac580358  	jrne	L151
1248                     ; 380 					if( _key_blink == 1 )
1250  02bf c60000        	ld	a,__key_blink
1251  02c2 4a            	dec	a
1252  02c3 2775          	jreq	L561
1253                     ; 381 						goto DisplayEntry;
1255                     ; 382 					disp_status_loop_clientDn(3/*0*/);	//Á¤Á>>YKö - subR/C selection
1257  02c5 a603          	ld	a,#3
1258  02c7 8d000000      	callf	f_disp_status_loop_clientDn
1260                     ; 383 					_dsCount = 4;
1262  02cb 35040000      	mov	__dsCount,#4
1263                     ; 385 					_disp_temp = 1;
1265  02cf 35010000      	mov	__disp_temp,#1
1267  02d3 ac600360      	jra	L145
1268  02d7               L335:
1269                     ; 395 			else if( key == /*2*/7 )
1271  02d7 a107          	cp	a,#7
1272  02d9 260c          	jrne	L545
1273  02db ac6e036e      	jra	L351
1274  02df               L551:
1275                     ; 400 marker_2s:
1275                     ; 401 				__sUp = 1;
1277  02df a601          	ld	a,#1
1278  02e1 8d6f046f      	callf	LC011
1279                     ; 405 				_key_blink = 1;
1280  02e5 2042          	jra	L345
1281  02e7               L545:
1282                     ; 407 			else if( key == 3 )
1284  02e7 a103          	cp	a,#3
1285  02e9 2632          	jrne	L355
1286                     ; 409 				if( __sUp == 0 )
1288  02eb c60000        	ld	a,___sUp
1289  02ee 260f          	jrne	L555
1290                     ; 411 					if( _key_blink == 0 )
1292  02f0 725d0000      	tnz	__key_blink
1293  02f4 261d          	jrne	L165
1294                     ; 413 marker_1s:						
1294                     ; 414 						__s = 2;
1296  02f6 35020000      	mov	___s,#2
1297                     ; 415 						_dsCount = 0;
1299  02fa c70000        	ld	__dsCount,a
1300                     ; 416 						return;
1303  02fd 85            	popw	x
1304  02fe 87            	retf	
1305  02ff               L555:
1306                     ; 419 				else if( __sUp == 1 )
1308  02ff a101          	cp	a,#1
1309  0301 2607          	jrne	L365
1310                     ; 421 					if( _key_blink == 0 )
1312  0303 c60000        	ld	a,__key_blink
1313  0306 260b          	jrne	L165
1314                     ; 422 						goto marker_2;
1316  0308 2064          	jra	L351
1317  030a               L365:
1318                     ; 424 				else if( __sUp == 2 )
1320  030a a102          	cp	a,#2
1321  030c 2605          	jrne	L165
1322                     ; 426 					if( _key_blink == 0 )
1324  030e c60000        	ld	a,__key_blink
1325  0311 2779          	jreq	L161
1326                     ; 427 						goto marker_4;
1328  0313               L165:
1329                     ; 429 				disp_status_loop_init();
1331  0313 8d000000      	callf	f_disp_status_loop_init
1333                     ; 430 				_key_blink = 0;
1335  0317 725f0000      	clr	__key_blink
1337  031b 200c          	jra	L345
1338  031d               L355:
1339                     ; 432 			else if( key == /*4*/2 )
1341  031d a102          	cp	a,#2
1342  031f 2608          	jrne	L345
1343  0321 2069          	jra	L161
1344  0323               L361:
1345                     ; 437 marker_4s:
1345                     ; 438 				__sUp = 2;
1347  0323 a602          	ld	a,#2
1348  0325 8d6f046f      	callf	LC011
1349  0329               L345:
1350                     ; 444 			if( _key_blink == 1 )
1352  0329 c60000        	ld	a,__key_blink
1353  032c 4a            	dec	a
1354  032d 2704acca03ca  	jrne	L312
1355                     ; 446 				if( _key_sec >= KEY_BLINK_FADE )
1357  0333 c60000        	ld	a,__key_sec
1358  0336 a10a          	cp	a,#10
1359  0338 25f5          	jrult	L312
1360  033a               L561:
1361                     ; 448 DisplayEntry:					
1361                     ; 449 					//	reset key timer
1361                     ; 450 					lcd_blink_clear();
1363  033a 8d000000      	callf	f_lcd_blink_clear
1365                     ; 451 					_key_blink = 0;
1367  033e 725f0000      	clr	__key_blink
1368                     ; 452 					_dsCount = 10;
1370  0342 350a0000      	mov	__dsCount,#10
1371  0346 acca03ca      	jra	L312
1372  034a               L105:
1373                     ; 457 		else if( _dsCount == 4 )
1375  034a a104          	cp	a,#4
1376  034c 2658          	jrne	L116
1377                     ; 459 			if( key == 1 )		
1379  034e 7b02          	ld	a,(OFST+1,sp)
1380  0350 a101          	cp	a,#1
1381  0352 2612          	jrne	L316
1382                     ; 467 				_dsCount = 1;	
1384  0354 35010000      	mov	__dsCount,#1
1385                     ; 468 				goto marker_1;	
1386  0358               L151:
1387                     ; 389 marker_1:					
1387                     ; 390 					__sUp = 0;
1389  0358 725f0000      	clr	___sUp
1390                     ; 391 					_dsCount = 0;
1392  035c 725f0000      	clr	__dsCount
1393  0360               L145:
1394                     ; 393 				_dsPrev = 0xff;
1396  0360 35ff0000      	mov	__dsPrev,#255
1398  0364 20c3          	jra	L345
1399  0366               L316:
1400                     ; 470 			else if( key == 2 )	{	_dsCount = 1;	goto marker_2;	}
1402  0366 a102          	cp	a,#2
1403  0368 2616          	jrne	L716
1406  036a 35010000      	mov	__dsCount,#1
1408  036e               L351:
1409                     ; 397 marker_2:				
1409                     ; 398 				if( __sUp == 1 && _key_blink == 1 )
1411  036e c60000        	ld	a,___sUp
1412  0371 4a            	dec	a
1413  0372 2704acdf02df  	jrne	L551
1415  0378 c60000        	ld	a,__key_blink
1416  037b 4a            	dec	a
1417  037c 26f6          	jrne	L551
1418                     ; 399 					goto DisplayEntry;
1420  037e 20ba          	jra	L561
1421  0380               L716:
1422                     ; 471 			else if( key == 3 )	{	}
1424  0380 a103          	cp	a,#3
1425  0382 2717          	jreq	L516
1427                     ; 472 			else if( key == 4 )	{	_dsCount = 1;	goto marker_4;	}
1429  0384 a104          	cp	a,#4
1430  0386 2613          	jrne	L516
1433  0388 35010000      	mov	__dsCount,#1
1435  038c               L161:
1436                     ; 434 marker_4:				
1436                     ; 435 				if( __sUp == 2 && _key_blink == 1 )
1438  038c c60000        	ld	a,___sUp
1439  038f a102          	cp	a,#2
1440  0391 2690          	jrne	L361
1442  0393 c60000        	ld	a,__key_blink
1443  0396 4a            	dec	a
1444  0397 268a          	jrne	L361
1445                     ; 436 					goto DisplayEntry;
1447  0399 209f          	jra	L561
1448  039b               L516:
1449                     ; 474 			if( uiInfo.enc != 0 )
1451  039b c60000        	ld	a,_uiInfo
1452  039e 272a          	jreq	L312
1453                     ; 475 				_dsCount = 10;
1455  03a0 350a0000      	mov	__dsCount,#10
1456  03a4 2024          	jra	L312
1457  03a6               L116:
1458                     ; 477 		else if( _dsCount == 5 )
1460  03a6 a105          	cp	a,#5
1461  03a8 2610          	jrne	L536
1462                     ; 479 			disp_status_loop_init();
1464  03aa 8d000000      	callf	f_disp_status_loop_init
1466                     ; 480 			disp_status_loop_clientDn(1);	//	¿ÜÃâ¸ðµå Ç¥½Ã
1468  03ae a601          	ld	a,#1
1469  03b0 8d000000      	callf	f_disp_status_loop_clientDn
1471                     ; 481 			_dsCount = 6;
1473  03b4 35060000      	mov	__dsCount,#6
1475  03b8 2010          	jra	L312
1476  03ba               L536:
1477                     ; 483 		else if( _dsCount == 6 )
1479  03ba a106          	cp	a,#6
1480  03bc 260c          	jrne	L312
1481                     ; 485 			if( _disp_mode != _disp_mode2 )
1483  03be c60000        	ld	a,__disp_mode
1484  03c1 c10000        	cp	a,__disp_mode2
1485  03c4 2704          	jreq	L312
1486                     ; 487 				_dsCount = 0;
1488  03c6 725f0000      	clr	__dsCount
1489  03ca               L312:
1490                     ; 491 		if( _dsCount == 15 || _dsCount == 16 || _dsCount == 25 || 
1490                     ; 492 				_dsCount == 35 || _dsCount == 46
1490                     ; 493 #if defined (_RC_DW_)
1490                     ; 494 				|| _dsCount == 151 
1490                     ; 495 #endif
1490                     ; 496 				)
1492  03ca c60000        	ld	a,__dsCount
1493  03cd a10f          	cp	a,#15
1494  03cf 2710          	jreq	L746
1496  03d1 a110          	cp	a,#16
1497  03d3 270c          	jreq	L746
1499  03d5 a119          	cp	a,#25
1500  03d7 2708          	jreq	L746
1502  03d9 a123          	cp	a,#35
1503  03db 2704          	jreq	L746
1505  03dd a12e          	cp	a,#46
1506  03df 263e          	jrne	L031
1507  03e1               L746:
1508                     ; 498 			if( _disp_mode != _disp_mode2 || packet_changed == 1)
1510  03e1 c60000        	ld	a,__disp_mode
1511  03e4 c10000        	cp	a,__disp_mode2
1512  03e7 2606          	jrne	L166
1514  03e9 c60000        	ld	a,_packet_changed
1515  03ec 4a            	dec	a
1516  03ed 2630          	jrne	L031
1517  03ef               L166:
1518                     ; 500 				packet_changed = 0;
1520  03ef 725f0000      	clr	_packet_changed
1521                     ; 501 				_dsCount = 10;
1523  03f3 350a0000      	mov	__dsCount,#10
1524                     ; 502 				_key_blink = 0;
1526  03f7 725f0000      	clr	__key_blink
1527                     ; 504 				if( _disp_mode2 == 0x01 )		
1529  03fb c60000        	ld	a,__disp_mode2
1530  03fe a101          	cp	a,#1
1531  0400 2606          	jrne	L366
1532                     ; 506 					__sUp = 0; 
1534  0402 725f0000      	clr	___sUp
1536  0406 2037          	jra	L566
1537  0408               L366:
1538                     ; 508 				else if( _disp_mode2 == 0x02 )	
1540  0408 a102          	cp	a,#2
1541  040a 2606          	jrne	L766
1542                     ; 513 					__sUp = 16;
1544  040c 35100000      	mov	___sUp,#16
1545                     ; 514 					return;
1547  0410 200d          	jra	L031
1548  0412               L766:
1549                     ; 516 				else if( _disp_mode2 == 0x04 )	
1551  0412 a104          	cp	a,#4
1552  0414 260b          	jrne	L376
1553                     ; 518 					disp_status_loop_init();
1555  0416 8d000000      	callf	f_disp_status_loop_init
1557                     ; 519 					disp_status_loop_clientDn(0);	// Á¤Áö
1559  041a 4f            	clr	a
1560  041b 8d000000      	callf	f_disp_status_loop_clientDn
1562                     ; 520 					return;
1563  041f               L031:
1566  041f 85            	popw	x
1567  0420 87            	retf	
1568  0421               L376:
1569                     ; 522 				else if( _disp_mode2 == 0x08 )	
1571  0421 a108          	cp	a,#8
1572  0423 2606          	jrne	L776
1573                     ; 524 					__sUp = 1;
1575  0425 35010000      	mov	___sUp,#1
1576                     ; 525 					_key_sec = _key_min = _key_hour = 0;
1578  0429 2008          	jpf	LC010
1579  042b               L776:
1580                     ; 528 				else if( _disp_mode2 == 0x10 )	
1582  042b a110          	cp	a,#16
1583  042d 26f0          	jrne	L031
1584                     ; 530 					__sUp = 2;
1586  042f 35020000      	mov	___sUp,#2
1587                     ; 531 					_key_sec = _key_min = _key_hour = 0;
1589  0433               LC010:
1591  0433 725f0000      	clr	__key_hour
1592  0437 725f0000      	clr	__key_min
1593  043b 725f0000      	clr	__key_sec
1595  043f               L566:
1596                     ; 537 				disp_status_loop_init();
1598  043f 8d000000      	callf	f_disp_status_loop_init
1600  0443 20da          	jra	L031
1601                     ; 535 					return;
1603  0445               L502:
1604                     ; 541 	else if( __s == 2 )
1606  0445 a102          	cp	a,#2
1607  0447 26d6          	jrne	L031
1608                     ; 543 		disp_backlight(0);
1610  0449 4f            	clr	a
1611  044a 8d000000      	callf	f_disp_backlight
1613                     ; 544 		if( key == 1 || key == 2 || key == 3 || key == 4 )
1615  044e 7b02          	ld	a,(OFST+1,sp)
1616  0450 a101          	cp	a,#1
1617  0452 270c          	jreq	L517
1619  0454 a102          	cp	a,#2
1620  0456 2708          	jreq	L517
1622  0458 a103          	cp	a,#3
1623  045a 2704          	jreq	L517
1625  045c a104          	cp	a,#4
1626  045e 26bf          	jrne	L031
1627  0460               L517:
1628                     ; 546 			__s = 0;
1630  0460 725f0000      	clr	___s
1631                     ; 547 			_dsCount = 0;
1633  0464 725f0000      	clr	__dsCount
1634                     ; 548 			file_update2(0);
1636  0468 4f            	clr	a
1637  0469 8d000000      	callf	f_file_update2
1639                     ; 551 }
1641  046d 20b0          	jra	L031
1642  046f               LC011:
1643  046f c70000        	ld	___sUp,a
1644                     ; 402 				_dsPrev = 0xff;
1646  0472 35ff0000      	mov	__dsPrev,#255
1647                     ; 403 				disp_status_loop_message(__sUp);
1649  0476 8d000000      	callf	f_disp_status_loop_message
1651                     ; 405 				_key_blink = 1;
1653  047a 35010000      	mov	__key_blink,#1
1654  047e 87            	retf	
1713                     	xref	f_disp_status_loop_host_N2OUT
1714                     	xref	f_disp_status_loop_host_Out
1715                     	xref	f_disp_status_loop_host_Off
1716                     	xref	f_timerClear
1717                     	xdef	f___rcCb
1718                     	xdef	__abc
1719                     	xref	f__backlight_get_code
1720                     	xref	f__backlight_get_index
1721                     	xref	_start_flag
1722                     	xref	__backup_backlight2
1723                     	xref	_packet_changed
1724                     	xref	__disp_temp
1725                     	xdef	__backlight
1726                     	xdef	_lcd_pwmCount2
1727                     	xdef	_lcd_pwmIndex2
1728                     	xdef	__lcdEnable
1729                     	switch	.bss
1730  0000               __lcdTimer:
1731  0000 00000000      	ds.b	4
1732                     	xdef	__lcdTimer
1733                     	xdef	f_disp_backlight
1734                     	xref	f_file_update2
1735                     	xref	__key_blink
1736                     	xref	__key_hour
1737                     	xref	__key_min
1738                     	xref	__key_sec
1739                     	xref	__disp_mode2
1740                     	xref	__disp_mode
1741                     	xdef	f_disp_status_loop_clientDn
1742                     	xref	f_disp_status_curr_only
1743                     	xref	f_disp_status_loop_init
1744                     	xref	f_disp_status_loop_host_B
1745                     	xref	f_disp_status_loop_host_Y
1746                     	xref	f_disp_status_loop_host_N
1747                     	xdef	f_disp_status_loop_messageDn
1748                     	xref	f_disp_status_loop_message
1749                     	xref	__dsPrev
1750                     	xref	__dsCount
1751                     	xdef	f_disp_status_loop_client
1752                     	xref	___sDn
1753                     	xref	___sUp
1754                     	xref	___s
1755                     	xref	f_lcd_blink_clear
1756                     	xref	f_lcd_disp_n
1757                     	xref	f_lcd_clear
1758                     	xref	f_lcd_disp_backlight
1759                     	xref	f_lcd_clear_btn
1760                     	xref	_iLF_DEF
1761                     	xref	_bLF_DEF
1762                     	xref	_uiInfo
1782                     	end
