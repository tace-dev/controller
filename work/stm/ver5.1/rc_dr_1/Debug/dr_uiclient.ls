   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               __backlight:
  23  0000 04            	dc.b	4
  24  0001               _lcd_pwmIndex2:
  25  0001 00            	dc.b	0
  26  0002               _lcd_pwmCount2:
  27  0002 19            	dc.b	25
  69                     ; 20 void	__rcCb(void)
  69                     ; 21 {
  71                     	switch	.text
  72  0000               ___rcCb:
  74  0000 88            	push	a
  75       00000001      OFST:	set	1
  78                     ; 23 	i = _backup_backlight==0 ? _backlight : 24;
  80                     ; 24 	if( lcd_pwmIndex2 <= _backlight )	{	PWM_HIGH;	}
  82  0001 c60001        	ld	a,_lcd_pwmIndex2
  83  0004 c10000        	cp	a,__backlight
  84  0007 2206          	jrugt	L52
  87  0009 721c5014      	bset	20500,#6
  89  000d 2004          	jra	L72
  90  000f               L52:
  91                     ; 25 	else					{	PWM_LOW;	}
  93  000f 721d5014      	bres	20500,#6
  94  0013               L72:
  95                     ; 27 	lcd_pwmIndex2++;
  97  0013 725c0001      	inc	_lcd_pwmIndex2
  98                     ; 28 	if( lcd_pwmIndex2 == lcd_pwmCount2 )
 100  0017 c60001        	ld	a,_lcd_pwmIndex2
 101  001a c10002        	cp	a,_lcd_pwmCount2
 102  001d 2604          	jrne	L13
 103                     ; 29 		lcd_pwmIndex2 = 0;
 105  001f 725f0001      	clr	_lcd_pwmIndex2
 106  0023               L13:
 107                     ; 30 }
 110  0023 84            	pop	a
 111  0024 81            	ret	
 157                     ; 32 void	disp_backlight(uint8_t mode)
 157                     ; 33 {
 158                     	switch	.text
 159  0025               _disp_backlight:
 161  0025 88            	push	a
 162       00000001      OFST:	set	1
 165                     ; 36 	if( _dsCount == 0 )
 167  0026 c60000        	ld	a,__dsCount
 168  0029 2611          	jrne	L15
 169                     ; 38 		lcd_clear(0);
 171  002b cd0000        	call	_lcd_clear
 173                     ; 39 		lcd_disp_backlight();
 175  002e cd0000        	call	_lcd_disp_backlight
 177                     ; 40 		_dsCount = 1;
 179  0031 35010000      	mov	__dsCount,#1
 180                     ; 41 		uiInfo._t = _backlight;
 182  0035 550000005f    	mov	_uiInfo+95,__backlight
 184  003a 2054          	jra	L35
 185  003c               L15:
 186                     ; 45 		i = _backlight;
 188  003c c60000        	ld	a,__backlight
 189  003f 6b01          	ld	(OFST+0,sp),a
 190                     ; 46 		if( uiInfo.enc != 0 )
 192  0041 c60000        	ld	a,_uiInfo
 193  0044 2725          	jreq	L55
 194                     ; 48 			ENC_MOVE_0(1, 24, 1);
 196  0046 a540          	bcp	a,#64
 197  0048 260e          	jrne	L75
 200  004a 7b01          	ld	a,(OFST+0,sp)
 201  004c a102          	cp	a,#2
 202  004e 2404          	jruge	L16
 205  0050 a618          	ld	a,#24
 207  0052 200c          	jp	LC001
 208  0054               L16:
 211  0054 0a01          	dec	(OFST+0,sp)
 212  0056 200e          	jra	L56
 213  0058               L75:
 216  0058 7b01          	ld	a,(OFST+0,sp)
 217  005a a118          	cp	a,#24
 218  005c 2506          	jrult	L76
 221  005e a601          	ld	a,#1
 222  0060               LC001:
 223  0060 6b01          	ld	(OFST+0,sp),a
 225  0062 2002          	jra	L56
 226  0064               L76:
 229  0064 0c01          	inc	(OFST+0,sp)
 230  0066               L56:
 231                     ; 49 			_backlight = i;
 234  0066 7b01          	ld	a,(OFST+0,sp)
 235  0068 c70000        	ld	__backlight,a
 236  006b               L55:
 237                     ; 51 		if( _dsPrev != i )
 239  006b c60000        	ld	a,__dsPrev
 240  006e 1101          	cp	a,(OFST+0,sp)
 241  0070 271e          	jreq	L35
 242                     ; 53 			_dsPrev = i;
 244  0072 7b01          	ld	a,(OFST+0,sp)
 245  0074 c70000        	ld	__dsPrev,a
 246                     ; 54 			UI_DISP_2Digit(i);
 248  0077 5f            	clrw	x
 249  0078 97            	ld	xl,a
 250  0079 a60a          	ld	a,#10
 251  007b 62            	div	x,a
 252  007c a602          	ld	a,#2
 253  007e 95            	ld	xh,a
 254  007f cd0000        	call	_lcd_disp_n
 258  0082 7b01          	ld	a,(OFST+0,sp)
 259  0084 5f            	clrw	x
 260  0085 97            	ld	xl,a
 261  0086 a60a          	ld	a,#10
 262  0088 62            	div	x,a
 263  0089 97            	ld	xl,a
 264  008a a603          	ld	a,#3
 265  008c 95            	ld	xh,a
 266  008d cd0000        	call	_lcd_disp_n
 269  0090               L35:
 270                     ; 57 }
 273  0090 84            	pop	a
 274  0091 81            	ret	
 313                     ; 61 void	disp_status_loop_messageDn(uint8_t i)
 313                     ; 62 {
 314                     	switch	.text
 315  0092               _disp_status_loop_messageDn:
 317  0092 88            	push	a
 318       00000000      OFST:	set	0
 321                     ; 63 	lcd_clear_btn();
 323  0093 cd0000        	call	_lcd_clear_btn
 325                     ; 64 	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(/*bS9*/bP20);	/*	¿ÜÃâ*/	}
 327  0096 7b01          	ld	a,(OFST+1,sp)
 328  0098 4a            	dec	a
 329  0099 2611          	jrne	L111
 332  009b 35020000      	mov	__disp_mode,#2
 335  009f 5f            	clrw	x
 336  00a0 c60039        	ld	a,_iLF_DEF+57
 337  00a3 97            	ld	xl,a
 338  00a4 d6540c        	ld	a,(21516,x)
 339  00a7 ca0039        	or	a,_bLF_DEF+57
 341  00aa 2052          	jp	LC002
 342  00ac               L111:
 343                     ; 65 	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(/*bS10*/bP13);	/*	Á¤Áö*/	}
 345  00ac 7b01          	ld	a,(OFST+1,sp)
 346  00ae 2611          	jrne	L511
 349  00b0 35040000      	mov	__disp_mode,#4
 352  00b4 5f            	clrw	x
 353  00b5 c60010        	ld	a,_iLF_DEF+16
 354  00b8 97            	ld	xl,a
 355  00b9 d6540c        	ld	a,(21516,x)
 356  00bc ca0010        	or	a,_bLF_DEF+16
 358  00bf 203d          	jp	LC002
 359  00c1               L511:
 360                     ; 66 	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(/*bS6*/bP15);	/*	³­¹æ*/	}
 362  00c1 a102          	cp	a,#2
 363  00c3 2611          	jrne	L121
 366  00c5 35010000      	mov	__disp_mode,#1
 369  00c9 5f            	clrw	x
 370  00ca c6003f        	ld	a,_iLF_DEF+63
 371  00cd 97            	ld	xl,a
 372  00ce d6540c        	ld	a,(21516,x)
 373  00d1 ca003f        	or	a,_bLF_DEF+63
 375  00d4 2028          	jp	LC002
 376  00d6               L121:
 377                     ; 67 	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(/*bS7*/bP10);	/*	¿¹¾à*/	}
 379  00d6 a103          	cp	a,#3
 380  00d8 2611          	jrne	L521
 383  00da 35080000      	mov	__disp_mode,#8
 386  00de 5f            	clrw	x
 387  00df c6003a        	ld	a,_iLF_DEF+58
 388  00e2 97            	ld	xl,a
 389  00e3 d6540c        	ld	a,(21516,x)
 390  00e6 ca003a        	or	a,_bLF_DEF+58
 392  00e9 2013          	jp	LC002
 393  00eb               L521:
 394                     ; 68 	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(/*bS8*/bP9);	/*	¹Ýº¹*/	}
 396  00eb a104          	cp	a,#4
 397  00ed 2612          	jrne	L311
 400  00ef 35100000      	mov	__disp_mode,#16
 403  00f3 5f            	clrw	x
 404  00f4 c60031        	ld	a,_iLF_DEF+49
 405  00f7 97            	ld	xl,a
 406  00f8 d6540c        	ld	a,(21516,x)
 407  00fb ca0031        	or	a,_bLF_DEF+49
 408  00fe               LC002:
 409  00fe d7540c        	ld	(21516,x),a
 410  0101               L311:
 411                     ; 69 	_disp_mode2 = _disp_mode;
 413  0101 5500000000    	mov	__disp_mode2,__disp_mode
 414                     ; 70 	timerClear();
 416  0106 cd0000        	call	_timerClear
 418                     ; 71 }
 421  0109 84            	pop	a
 422  010a 81            	ret	
 458                     ; 73 void	disp_status_loop_clientDn(uint8_t key)
 458                     ; 74 {
 459                     	switch	.text
 460  010b               _disp_status_loop_clientDn:
 464                     ; 76 	disp_status_loop_messageDn(key);
 466  010b ad85          	call	_disp_status_loop_messageDn
 468                     ; 77 	disp_status_curr_only();
 470  010d cd0000        	call	_disp_status_curr_only
 472                     ; 78 	lcd_blink_clear();
 475                     ; 79 }
 478  0110 cc0000        	jp	_lcd_blink_clear
 543                     ; 84 void	disp_status_loop_client(uint8_t key)
 543                     ; 85 {
 544                     	switch	.text
 545  0113               _disp_status_loop_client:
 547  0113 88            	push	a
 548  0114 88            	push	a
 549       00000001      OFST:	set	1
 552                     ; 86 	uint8_t	i = 0;
 554  0115 0f01          	clr	(OFST+0,sp)
 555                     ; 87 	if( __s == 0 )
 557  0117 c60000        	ld	a,___s
 558  011a 2703cc0511    	jrne	L502
 559                     ; 89 		if( _dsCount == 0 )
 561  011f c60000        	ld	a,__dsCount
 562  0122 260e          	jrne	L702
 563                     ; 91 			_dsCount = 10;
 565  0124 350a0000      	mov	__dsCount,#10
 566                     ; 92 			__sUp = 0;
 568  0128 c70000        	ld	___sUp,a
 569                     ; 93 			__sDn = 0xff;
 571  012b 35ff0000      	mov	___sDn,#255
 573  012f cc046f        	jra	L112
 574  0132               L702:
 575                     ; 96 		else if( _dsCount == 10 )
 577  0132 a10a          	cp	a,#10
 578  0134 2641          	jrne	L312
 579                     ; 98 			if( __sUp == 0 )		_dsCount = 15;	//	N
 581  0136 c60000        	ld	a,___sUp
 582  0139 2606          	jrne	L512
 585  013b 350f0000      	mov	__dsCount,#15
 587  013f 2030          	jra	L712
 588  0141               L512:
 589                     ; 99 			else if( __sUp == 1 )	_dsCount = 35;	//	Y
 591  0141 a101          	cp	a,#1
 592  0143 2606          	jrne	L122
 595  0145 35230000      	mov	__dsCount,#35
 597  0149 2026          	jra	L712
 598  014b               L122:
 599                     ; 100 			else if( __sUp == 2 )	_dsCount = 25;	//	B
 601  014b a102          	cp	a,#2
 602  014d 2606          	jrne	L522
 605  014f 35190000      	mov	__dsCount,#25
 607  0153 201c          	jra	L712
 608  0155               L522:
 609                     ; 101 			else if( __sUp == 5 )	_dsCount = 45;	//	Out
 611  0155 a105          	cp	a,#5
 612  0157 2606          	jrne	L132
 615  0159 352d0000      	mov	__dsCount,#45
 617  015d 2012          	jra	L712
 618  015f               L132:
 619                     ; 102 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	}
 621  015f a110          	cp	a,#16
 622  0161 260a          	jrne	L532
 625  0163 35100000      	mov	__dsCount,#16
 628  0167 35080000      	mov	___sUp,#8
 630  016b 2004          	jra	L712
 631  016d               L532:
 632                     ; 104 				_dsCount = 1;
 634  016d 35010000      	mov	__dsCount,#1
 635  0171               L712:
 636                     ; 105 			disp_status_loop_init();
 638  0171 cd0000        	call	_disp_status_loop_init
 641  0174 cc046f        	jra	L112
 642  0177               L312:
 643                     ; 107 		else if( _dsCount == 15 )			//	N/Out
 645  0177 a10f          	cp	a,#15
 646  0179 2661          	jrne	L342
 647                     ; 109 			if( key==1 )		_GOTO(1)	//	Y
 649  017b 7b02          	ld	a,(OFST+1,sp)
 650  017d a101          	cp	a,#1
 651  017f 260a          	jrne	L542
 654  0181 35010000      	mov	___sUp,#1
 657  0185 350a0000      	mov	__dsCount,#10
 659  0189 203c          	jra	L742
 660  018b               L542:
 661                     ; 110 			else if( key==2 )	_GOTO(2)	//	Ban
 663  018b a102          	cp	a,#2
 664  018d 260a          	jrne	L152
 667  018f 35020000      	mov	___sUp,#2
 670  0193 350a0000      	mov	__dsCount,#10
 672  0197 202e          	jra	L742
 673  0199               L152:
 674                     ; 111 			else if( key==4 )	_GOTO(16)	//	Out
 676  0199 a104          	cp	a,#4
 677  019b 260a          	jrne	L552
 680  019d 35100000      	mov	___sUp,#16
 683  01a1 350a0000      	mov	__dsCount,#10
 685  01a5 2020          	jra	L742
 686  01a7               L552:
 687                     ; 112 			else if( key==8 )	_GOTO(5)	//	Off
 689  01a7 a108          	cp	a,#8
 690  01a9 260a          	jrne	L162
 693  01ab 35050000      	mov	___sUp,#5
 696  01af 350a0000      	mov	__dsCount,#10
 698  01b3 2012          	jra	L742
 699  01b5               L162:
 700                     ; 113 			else if( key==16 )	_DN
 702  01b5 a110          	cp	a,#16
 703  01b7 2606          	jrne	L562
 706  01b9 35400000      	mov	_uiInfo,#64
 708  01bd 2008          	jra	L742
 709  01bf               L562:
 710                     ; 114 			else if( key==32 )	_UP
 712  01bf a120          	cp	a,#32
 713  01c1 2604          	jrne	L742
 716  01c3 35010000      	mov	_uiInfo,#1
 717  01c7               L742:
 718                     ; 115 			_disp_temp = 1;
 720  01c7 35010000      	mov	__disp_temp,#1
 721                     ; 116 			i = disp_status_loop_host_N(key);
 723  01cb 7b02          	ld	a,(OFST+1,sp)
 724  01cd cd0000        	call	_disp_status_loop_host_N
 726  01d0 6b01          	ld	(OFST+0,sp),a
 727                     ; 117 			if( i==1 )
 729  01d2 4a            	dec	a
 730  01d3 269f          	jrne	L112
 731                     ; 118 				_key_blink = 1;
 733  01d5 35010000      	mov	__key_blink,#1
 734  01d9 cc046f        	jra	L112
 735  01dc               L342:
 736                     ; 120 		else if( _dsCount == 16 )			//	OUT
 738  01dc a110          	cp	a,#16
 739  01de 263d          	jrne	L772
 740                     ; 122 			if( key==1 )		_GOTO(1)	//	Y
 742  01e0 7b02          	ld	a,(OFST+1,sp)
 743  01e2 a101          	cp	a,#1
 744  01e4 2606          	jrne	L103
 747  01e6 35010000      	mov	___sUp,#1
 750  01ea 201c          	jp	LC003
 751  01ec               L103:
 752                     ; 123 			else if( key==2 )	_GOTO(2)	//	Ban
 754  01ec a102          	cp	a,#2
 755  01ee 2606          	jrne	L503
 758  01f0 35020000      	mov	___sUp,#2
 761  01f4 2012          	jp	LC003
 762  01f6               L503:
 763                     ; 124 			else if( key==4 )	_GOTO(0)	//	N
 765  01f6 a104          	cp	a,#4
 766  01f8 2606          	jrne	L113
 769  01fa 725f0000      	clr	___sUp
 772  01fe 2008          	jp	LC003
 773  0200               L113:
 774                     ; 125 			else if( key==8 )	_GOTO(5)	//	Off
 776  0200 a108          	cp	a,#8
 777  0202 260a          	jrne	L303
 780  0204 35050000      	mov	___sUp,#5
 783  0208               LC003:
 787  0208 350a0000      	mov	__dsCount,#10
 788  020c 7b02          	ld	a,(OFST+1,sp)
 789  020e               L303:
 790                     ; 126 			i = disp_status_loop_host_Out(key);
 792  020e cd0000        	call	_disp_status_loop_host_Out
 794  0211 6b01          	ld	(OFST+0,sp),a
 795                     ; 127 			if( i==1 )
 797  0213 4a            	dec	a
 798  0214 26c3          	jrne	L112
 799                     ; 128 				_key_blink = 1;
 801  0216 35010000      	mov	__key_blink,#1
 802  021a cc046f        	jra	L112
 803  021d               L772:
 804                     ; 130 		else if( _dsCount == 25 )			//	B
 806  021d a119          	cp	a,#25
 807  021f 2661          	jrne	L323
 808                     ; 132 			if( key==1 )		_GOTO(1)	//	Y
 810  0221 7b02          	ld	a,(OFST+1,sp)
 811  0223 a101          	cp	a,#1
 812  0225 260a          	jrne	L523
 815  0227 35010000      	mov	___sUp,#1
 818  022b 350a0000      	mov	__dsCount,#10
 820  022f 203c          	jra	L723
 821  0231               L523:
 822                     ; 133 			else if( key==2 )	_GOTO(0)	//	N
 824  0231 a102          	cp	a,#2
 825  0233 260a          	jrne	L133
 828  0235 725f0000      	clr	___sUp
 831  0239 350a0000      	mov	__dsCount,#10
 833  023d 202e          	jra	L723
 834  023f               L133:
 835                     ; 134 			else if( key==4 )	_GOTO(0)	//	N
 837  023f a104          	cp	a,#4
 838  0241 260a          	jrne	L533
 841  0243 725f0000      	clr	___sUp
 844  0247 350a0000      	mov	__dsCount,#10
 846  024b 2020          	jra	L723
 847  024d               L533:
 848                     ; 135 			else if( key==8 )	_GOTO(5)	//	Off
 850  024d a108          	cp	a,#8
 851  024f 260a          	jrne	L143
 854  0251 35050000      	mov	___sUp,#5
 857  0255 350a0000      	mov	__dsCount,#10
 859  0259 2012          	jra	L723
 860  025b               L143:
 861                     ; 136 			else if( key==16 )	_DN
 863  025b a110          	cp	a,#16
 864  025d 2606          	jrne	L543
 867  025f 35400000      	mov	_uiInfo,#64
 869  0263 2008          	jra	L723
 870  0265               L543:
 871                     ; 137 			else if( key==32 )	_UP
 873  0265 a120          	cp	a,#32
 874  0267 2604          	jrne	L723
 877  0269 35010000      	mov	_uiInfo,#1
 878  026d               L723:
 879                     ; 138 			_disp_temp = 1;
 881  026d 35010000      	mov	__disp_temp,#1
 882                     ; 139 			i = disp_status_loop_host_B(key);
 884  0271 7b02          	ld	a,(OFST+1,sp)
 885  0273 cd0000        	call	_disp_status_loop_host_B
 887  0276 6b01          	ld	(OFST+0,sp),a
 888                     ; 140 			if( i==1 )
 890  0278 4a            	dec	a
 891  0279 269f          	jrne	L112
 892                     ; 141 				_key_blink = 1;
 894  027b 35010000      	mov	__key_blink,#1
 895  027f cc046f        	jra	L112
 896  0282               L323:
 897                     ; 143 		else if( _dsCount == 35 )			//	Y
 899  0282 a123          	cp	a,#35
 900  0284 2661          	jrne	L753
 901                     ; 145 			if( key==1 )		_GOTO(0)	//	N
 903  0286 7b02          	ld	a,(OFST+1,sp)
 904  0288 a101          	cp	a,#1
 905  028a 260a          	jrne	L163
 908  028c 725f0000      	clr	___sUp
 911  0290 350a0000      	mov	__dsCount,#10
 913  0294 203c          	jra	L363
 914  0296               L163:
 915                     ; 146 			else if( key==2 )	_GOTO(2)	//	Ban
 917  0296 a102          	cp	a,#2
 918  0298 260a          	jrne	L563
 921  029a 35020000      	mov	___sUp,#2
 924  029e 350a0000      	mov	__dsCount,#10
 926  02a2 202e          	jra	L363
 927  02a4               L563:
 928                     ; 147 			else if( key==4 )	_GOTO(0)	//	N
 930  02a4 a104          	cp	a,#4
 931  02a6 260a          	jrne	L173
 934  02a8 725f0000      	clr	___sUp
 937  02ac 350a0000      	mov	__dsCount,#10
 939  02b0 2020          	jra	L363
 940  02b2               L173:
 941                     ; 148 			else if( key==8 )	_GOTO(5)	//	Off
 943  02b2 a108          	cp	a,#8
 944  02b4 260a          	jrne	L573
 947  02b6 35050000      	mov	___sUp,#5
 950  02ba 350a0000      	mov	__dsCount,#10
 952  02be 2012          	jra	L363
 953  02c0               L573:
 954                     ; 149 			else if( key==16 )	_DN
 956  02c0 a110          	cp	a,#16
 957  02c2 2606          	jrne	L104
 960  02c4 35400000      	mov	_uiInfo,#64
 962  02c8 2008          	jra	L363
 963  02ca               L104:
 964                     ; 150 			else if( key==32 )	_UP
 966  02ca a120          	cp	a,#32
 967  02cc 2604          	jrne	L363
 970  02ce 35010000      	mov	_uiInfo,#1
 971  02d2               L363:
 972                     ; 151 			_disp_temp = 1;
 974  02d2 35010000      	mov	__disp_temp,#1
 975                     ; 152 			i = disp_status_loop_host_Y(key);
 977  02d6 7b02          	ld	a,(OFST+1,sp)
 978  02d8 cd0000        	call	_disp_status_loop_host_Y
 980  02db 6b01          	ld	(OFST+0,sp),a
 981                     ; 153 			if( i==1 )
 983  02dd 4a            	dec	a
 984  02de 269f          	jrne	L112
 985                     ; 154 				_key_blink = 1;
 987  02e0 35010000      	mov	__key_blink,#1
 988  02e4 cc046f        	jra	L112
 989  02e7               L753:
 990                     ; 156 		else if( _dsCount == 45 )			//	OUT
 992  02e7 a12d          	cp	a,#45
 993  02e9 2637          	jrne	L314
 994                     ; 158 			if( key==1 )		_GOTO(1)	//	Y
 996  02eb 7b02          	ld	a,(OFST+1,sp)
 997  02ed a101          	cp	a,#1
 998  02ef 2606          	jrne	L514
1001  02f1 35010000      	mov	___sUp,#1
1004  02f5 2016          	jp	LC004
1005  02f7               L514:
1006                     ; 159 			else if( key==2 )	_GOTO(2)	//	Ban
1008  02f7 a102          	cp	a,#2
1009  02f9 2606          	jrne	L124
1012  02fb 35020000      	mov	___sUp,#2
1015  02ff 200c          	jp	LC004
1016  0301               L124:
1017                     ; 160 			else if( key==4 )	_GOTO(0)	//	N
1019  0301 a104          	cp	a,#4
1023  0303 2704          	jreq	LC005
1024                     ; 161 			else if( key==8 )	_GOTO(0)	//	On
1026  0305 a108          	cp	a,#8
1027  0307 260a          	jrne	L714
1030  0309               LC005:
1032  0309 725f0000      	clr	___sUp
1035  030d               LC004:
1039  030d 350a0000      	mov	__dsCount,#10
1040  0311 7b02          	ld	a,(OFST+1,sp)
1041  0313               L714:
1042                     ; 162 			i = disp_status_loop_host_Off(key);
1044  0313 cd0000        	call	_disp_status_loop_host_Off
1046  0316 6b01          	ld	(OFST+0,sp),a
1047                     ; 163 			if( i==1 )
1049  0318 4a            	dec	a
1050  0319 26c9          	jrne	L112
1051                     ; 164 				_key_blink = 1;
1053  031b 35010000      	mov	__key_blink,#1
1054  031f cc046f        	jra	L112
1055  0322               L314:
1056                     ; 166 		else if( _dsCount == 1 )
1058  0322 a101          	cp	a,#1
1059  0324 2703cc03ef    	jrne	L734
1060                     ; 168 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
1062  0329 c60000        	ld	a,___sUp
1063  032c 2607          	jrne	L144
1066  032e 7b02          	ld	a,(OFST+1,sp)
1067  0330 cd0000        	call	_disp_status_loop_host_N
1070  0333 2014          	jp	LC006
1071  0335               L144:
1072                     ; 169 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
1074  0335 a101          	cp	a,#1
1075  0337 2607          	jrne	L544
1078  0339 7b02          	ld	a,(OFST+1,sp)
1079  033b cd0000        	call	_disp_status_loop_host_Y
1082  033e 2009          	jp	LC006
1083  0340               L544:
1084                     ; 170 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
1086  0340 a102          	cp	a,#2
1087  0342 2607          	jrne	L344
1090  0344 7b02          	ld	a,(OFST+1,sp)
1091  0346 cd0000        	call	_disp_status_loop_host_B
1093  0349               LC006:
1094  0349 6b01          	ld	(OFST+0,sp),a
1095  034b               L344:
1096                     ; 172 			if( i==1 )
1098  034b 7b01          	ld	a,(OFST+0,sp)
1099  034d 4a            	dec	a
1100  034e 2604          	jrne	L354
1101                     ; 173 				_key_blink = 1;
1103  0350 4c            	inc	a
1104  0351 c70000        	ld	__key_blink,a
1105  0354               L354:
1106                     ; 175 			_disp_temp = __sUp==0 ? 1 : 0;
1108  0354 c60000        	ld	a,___sUp
1109  0357 2603          	jrne	L66
1110  0359 4c            	inc	a
1111  035a 2001          	jra	L07
1112  035c               L66:
1113  035c 4f            	clr	a
1114  035d               L07:
1115  035d c70000        	ld	__disp_temp,a
1116                     ; 176 			if( _disp_temp == 0 && _key_blink == 0 )
1118  0360 261c          	jrne	L554
1120  0362 c60000        	ld	a,__key_blink
1121  0365 2617          	jrne	L554
1122                     ; 178 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
1124  0367 c60000        	ld	a,___sUp
1125  036a a101          	cp	a,#1
1126  036c 270c          	jreq	L164
1128  036e a102          	cp	a,#2
1129  0370 2708          	jreq	L164
1131  0372 a105          	cp	a,#5
1132  0374 2704          	jreq	L164
1134  0376 a108          	cp	a,#8
1135  0378 2604          	jrne	L554
1136  037a               L164:
1137                     ; 179 					_disp_temp = 1;
1139  037a 35010000      	mov	__disp_temp,#1
1140  037e               L554:
1141                     ; 182 			if( __sUp == 0 && i == 1 )
1143  037e c60000        	ld	a,___sUp
1144  0381 2609          	jrne	L764
1146  0383 7b01          	ld	a,(OFST+0,sp)
1147  0385 4a            	dec	a
1148  0386 2604          	jrne	L764
1149                     ; 184 marker_1_0:
1149                     ; 185 				_key_blink = 1;
1151  0388 35010000      	mov	__key_blink,#1
1152  038c               L764:
1153                     ; 188 			if( key == 1 )
1155  038c 7b02          	ld	a,(OFST+1,sp)
1156  038e a101          	cp	a,#1
1157  0390 261d          	jrne	L174
1158                     ; 190 				if( __sUp == 0 )
1160  0392 c60000        	ld	a,___sUp
1161  0395 2666          	jrne	L151
1162                     ; 192 					if( _key_blink == 1 )
1164  0397 c60000        	ld	a,__key_blink
1165  039a 4a            	dec	a
1166  039b 2603cc0503    	jreq	L561
1167                     ; 193 						goto DisplayEntry;
1169                     ; 194 					disp_status_loop_clientDn(3/*0*/);	//Á¤Á>>YKö - subR/C selection
1171  03a0 a603          	ld	a,#3
1172  03a2 cd010b        	call	_disp_status_loop_clientDn
1174                     ; 195 					_dsCount = 4;
1176  03a5 35040000      	mov	__dsCount,#4
1177                     ; 197 					_disp_temp = 1;
1179  03a9 35010000      	mov	__disp_temp,#1
1181  03ad 2056          	jra	L774
1182  03af               L174:
1183                     ; 207 			else if( key == /*2*/7 )
1185  03af a107          	cp	a,#7
1186  03b1 2761          	jreq	L351
1187                     ; 219 			else if( key == 3 )
1189  03b3 a103          	cp	a,#3
1190  03b5 2632          	jrne	L115
1191                     ; 221 				if( __sUp == 0 )
1193  03b7 c60000        	ld	a,___sUp
1194  03ba 260f          	jrne	L315
1195                     ; 223 					if( _key_blink == 0 )
1197  03bc 725d0000      	tnz	__key_blink
1198  03c0 261d          	jrne	L715
1199                     ; 225 marker_1s:						
1199                     ; 226 						__s = 2;
1201  03c2 35020000      	mov	___s,#2
1202                     ; 227 						_dsCount = 0;
1204  03c6 c70000        	ld	__dsCount,a
1205                     ; 228 						return;
1208  03c9 85            	popw	x
1209  03ca 81            	ret	
1210  03cb               L315:
1211                     ; 231 				else if( __sUp == 1 )
1213  03cb a101          	cp	a,#1
1214  03cd 2607          	jrne	L125
1215                     ; 233 					if( _key_blink == 0 )
1217  03cf c60000        	ld	a,__key_blink
1218  03d2 260b          	jrne	L715
1219                     ; 234 						goto marker_2;
1221  03d4 203e          	jra	L351
1222  03d6               L125:
1223                     ; 236 				else if( __sUp == 2 )
1225  03d6 a102          	cp	a,#2
1226  03d8 2605          	jrne	L715
1227                     ; 238 					if( _key_blink == 0 )
1229  03da c60000        	ld	a,__key_blink
1230  03dd 2753          	jreq	L161
1231                     ; 239 						goto marker_4;
1233  03df               L715:
1234                     ; 241 				disp_status_loop_init();
1236  03df cd0000        	call	_disp_status_loop_init
1238                     ; 242 				_key_blink = 0;
1240  03e2 725f0000      	clr	__key_blink
1242  03e6 cc04f3        	jra	L105
1243  03e9               L115:
1244                     ; 244 			else if( key == /*4*/2 )
1246  03e9 a102          	cp	a,#2
1247  03eb 26f9          	jrne	L105
1248  03ed 2043          	jra	L161
1249  03ef               L734:
1250                     ; 269 		else if( _dsCount == 4 )
1252  03ef a104          	cp	a,#4
1253  03f1 265a          	jrne	L745
1254                     ; 271 			if( key == 1 )		
1256  03f3 7b02          	ld	a,(OFST+1,sp)
1257  03f5 a101          	cp	a,#1
1258  03f7 2613          	jrne	L155
1259                     ; 279 				_dsCount = 1;	
1261  03f9 35010000      	mov	__dsCount,#1
1262                     ; 280 				goto marker_1;	
1263  03fd               L151:
1264                     ; 201 marker_1:					
1264                     ; 202 					__sUp = 0;
1266  03fd 725f0000      	clr	___sUp
1267                     ; 203 					_dsCount = 0;
1269  0401 725f0000      	clr	__dsCount
1270  0405               L774:
1271                     ; 205 				_dsPrev = 0xff;
1273  0405 35ff0000      	mov	__dsPrev,#255
1275  0409 cc04f3        	jra	L105
1276  040c               L155:
1277                     ; 282 			else if( key == 2 )	{	_dsCount = 1;	goto marker_2;	}
1279  040c a102          	cp	a,#2
1280  040e 2616          	jrne	L555
1283  0410 35010000      	mov	__dsCount,#1
1285  0414               L351:
1286                     ; 209 marker_2:				
1286                     ; 210 				if( __sUp == 1 && _key_blink == 1 )
1288  0414 c60000        	ld	a,___sUp
1289  0417 4a            	dec	a
1290  0418 2703cc04cf    	jrne	L551
1292  041d c60000        	ld	a,__key_blink
1293  0420 4a            	dec	a
1294  0421 26f7          	jrne	L551
1295                     ; 211 					goto DisplayEntry;
1297  0423 cc0503        	jra	L561
1298  0426               L555:
1299                     ; 283 			else if( key == 3 )	{	}
1301  0426 a103          	cp	a,#3
1302  0428 271b          	jreq	L355
1304                     ; 284 			else if( key == 4 )	{	_dsCount = 1;	goto marker_4;	}
1306  042a a104          	cp	a,#4
1307  042c 2617          	jrne	L355
1310  042e 35010000      	mov	__dsCount,#1
1312  0432               L161:
1313                     ; 246 marker_4:				
1313                     ; 247 				if( __sUp == 2 && _key_blink == 1 )
1315  0432 c60000        	ld	a,___sUp
1316  0435 a102          	cp	a,#2
1317  0437 2703cc04e3    	jrne	L361
1319  043c c60000        	ld	a,__key_blink
1320  043f 4a            	dec	a
1321  0440 26f7          	jrne	L361
1322                     ; 248 					goto DisplayEntry;
1324  0442 cc0503        	jra	L561
1325  0445               L355:
1326                     ; 286 			if( uiInfo.enc != 0 )
1328  0445 c60000        	ld	a,_uiInfo
1329  0448 2725          	jreq	L112
1330                     ; 287 				_dsCount = 10;
1331  044a cc050a        	jp	LC007
1332  044d               L745:
1333                     ; 289 		else if( _dsCount == 5 )
1335  044d a105          	cp	a,#5
1336  044f 260e          	jrne	L375
1337                     ; 291 			disp_status_loop_init();
1339  0451 cd0000        	call	_disp_status_loop_init
1341                     ; 292 			disp_status_loop_clientDn(1);	//	¿ÜÃâ¸ðµå Ç¥½Ã
1343  0454 a601          	ld	a,#1
1344  0456 cd010b        	call	_disp_status_loop_clientDn
1346                     ; 293 			_dsCount = 6;
1348  0459 35060000      	mov	__dsCount,#6
1350  045d 2010          	jra	L112
1351  045f               L375:
1352                     ; 295 		else if( _dsCount == 6 )
1354  045f a106          	cp	a,#6
1355  0461 260c          	jrne	L112
1356                     ; 297 			if( _disp_mode != _disp_mode2 )
1358  0463 c60000        	ld	a,__disp_mode
1359  0466 c10000        	cp	a,__disp_mode2
1360  0469 2704          	jreq	L112
1361                     ; 299 				_dsCount = 0;
1363  046b 725f0000      	clr	__dsCount
1364  046f               L112:
1365                     ; 303 		if( _dsCount == 1 || _dsCount == 4 )
1367  046f c60000        	ld	a,__dsCount
1368  0472 a101          	cp	a,#1
1369  0474 2707          	jreq	L506
1371  0476 a104          	cp	a,#4
1372  0478 2703cc0537    	jrne	L736
1373  047d               L506:
1374                     ; 305 			if( _disp_mode != _disp_mode2 || packet_changed == 1)
1376  047d c60000        	ld	a,__disp_mode
1377  0480 c10000        	cp	a,__disp_mode2
1378  0483 2606          	jrne	L116
1380  0485 c60000        	ld	a,_packet_changed
1381  0488 4a            	dec	a
1382  0489 26ef          	jrne	L736
1383  048b               L116:
1384                     ; 307 				packet_changed = 0;
1386  048b 725f0000      	clr	_packet_changed
1387                     ; 308 				_dsCount = 1;
1389  048f 35010000      	mov	__dsCount,#1
1390                     ; 309 				_key_blink = 0;
1392  0493 725f0000      	clr	__key_blink
1393                     ; 310 				if( _disp_mode2 == 0x01 )		
1395  0497 c60000        	ld	a,__disp_mode2
1396  049a a101          	cp	a,#1
1397  049c 260a          	jrne	L316
1398                     ; 312 					__sUp = 0; 
1400  049e 725f0000      	clr	___sUp
1402                     ; 341 				disp_status_loop_init();
1404  04a2 cd0000        	call	_disp_status_loop_init
1406  04a5 cc0537        	jra	L736
1407  04a8               L316:
1408                     ; 314 				else if( _disp_mode2 == 0x02 )	
1410  04a8 a102          	cp	a,#2
1411  04aa 2606          	jrne	L716
1412                     ; 319 					_dsCount = 5;
1414  04ac 35050000      	mov	__dsCount,#5
1415                     ; 320 					return;
1417  04b0 200b          	jra	L221
1418  04b2               L716:
1419                     ; 322 				else if( _disp_mode2 == 0x04 )	
1421  04b2 a104          	cp	a,#4
1422  04b4 2609          	jrne	L326
1423                     ; 324 					disp_status_loop_init();
1425  04b6 cd0000        	call	_disp_status_loop_init
1427                     ; 325 					disp_status_loop_clientDn(0);	// Á¤Áö
1429  04b9 4f            	clr	a
1430  04ba cd010b        	call	_disp_status_loop_clientDn
1432                     ; 326 					return;
1433  04bd               L221:
1436  04bd 85            	popw	x
1437  04be 81            	ret	
1438  04bf               L326:
1439                     ; 328 				else if( _disp_mode2 == 0x08 )	
1441  04bf a108          	cp	a,#8
1442  04c1 2610          	jrne	L726
1443                     ; 330 					_key_sec = _key_min = _key_hour = 0;
1445  04c3 725f0000      	clr	__key_hour
1446  04c7 725f0000      	clr	__key_min
1447  04cb 725f0000      	clr	__key_sec
1448                     ; 331 					goto marker_2s;
1449  04cf               L551:
1450                     ; 212 marker_2s:
1450                     ; 213 				__sUp = 1;
1452  04cf a601          	ld	a,#1
1453                     ; 214 				_dsPrev = 0xff;
1454                     ; 215 				disp_status_loop_message(__sUp);
1456                     ; 217 				_key_blink = 1;
1458  04d1 2012          	jp	LC008
1459  04d3               L726:
1460                     ; 333 				else if( _disp_mode2 == 0x10 )	
1462  04d3 a110          	cp	a,#16
1463  04d5 26e6          	jrne	L221
1464                     ; 335 					_key_sec = _key_min = _key_hour = 0;
1466  04d7 725f0000      	clr	__key_hour
1467  04db 725f0000      	clr	__key_min
1468  04df 725f0000      	clr	__key_sec
1469                     ; 336 					goto marker_4s;
1470  04e3               L361:
1471                     ; 249 marker_4s:
1471                     ; 250 				__sUp = 2;
1473  04e3 a602          	ld	a,#2
1474                     ; 251 				_dsPrev = 0xff;
1476                     ; 252 				disp_status_loop_message(__sUp);
1479                     ; 254 				_key_blink = 1;
1481  04e5               LC008:
1482  04e5 c70000        	ld	___sUp,a
1484  04e8 35ff0000      	mov	__dsPrev,#255
1486  04ec cd0000        	call	_disp_status_loop_message
1488  04ef 35010000      	mov	__key_blink,#1
1489  04f3               L105:
1490                     ; 256 			if( _key_blink == 1 )
1492  04f3 c60000        	ld	a,__key_blink
1493  04f6 4a            	dec	a
1494  04f7 2703cc046f    	jrne	L112
1495                     ; 258 				if( _key_sec >= KEY_BLINK_FADE )
1497  04fc c60000        	ld	a,__key_sec
1498  04ff a10a          	cp	a,#10
1499  0501 25f6          	jrult	L112
1500  0503               L561:
1501                     ; 260 DisplayEntry:					
1501                     ; 261 					//	reset key timer
1501                     ; 262 					lcd_blink_clear();
1503  0503 cd0000        	call	_lcd_blink_clear
1505                     ; 263 					_key_blink = 0;
1507  0506 725f0000      	clr	__key_blink
1508                     ; 264 					_dsCount = 10;
1510  050a               LC007:
1512  050a 350a0000      	mov	__dsCount,#10
1513  050e cc046f        	jra	L112
1514                     ; 339 					return;
1516  0511               L502:
1517                     ; 345 	else if( __s == 2 )
1519  0511 a102          	cp	a,#2
1520  0513 2622          	jrne	L736
1521                     ; 347 		disp_backlight(0);
1523  0515 4f            	clr	a
1524  0516 cd0025        	call	_disp_backlight
1526                     ; 348 		if( key == 1 || key == 2 || key == 3 || key == 4 )
1528  0519 7b02          	ld	a,(OFST+1,sp)
1529  051b a101          	cp	a,#1
1530  051d 270c          	jreq	L546
1532  051f a102          	cp	a,#2
1533  0521 2708          	jreq	L546
1535  0523 a103          	cp	a,#3
1536  0525 2704          	jreq	L546
1538  0527 a104          	cp	a,#4
1539  0529 260c          	jrne	L736
1540  052b               L546:
1541                     ; 350 			__s = 0;
1543  052b 725f0000      	clr	___s
1544                     ; 351 			_dsCount = 0;
1546  052f 725f0000      	clr	__dsCount
1547                     ; 352 			file_update2(0);
1549  0533 4f            	clr	a
1550  0534 cd0000        	call	_file_update2
1552  0537               L736:
1553                     ; 355 }
1556  0537 85            	popw	x
1557  0538 81            	ret	
1593                     	xref	_disp_status_loop_host_Out
1594                     	xref	_disp_status_loop_host_Off
1595                     	xref	_timerClear
1596                     	xdef	___rcCb
1597                     	xref	__backup_backlight
1598                     	xref	_packet_changed
1599                     	xref	__disp_temp
1600                     	xdef	_lcd_pwmCount2
1601                     	xdef	_lcd_pwmIndex2
1602                     	xdef	__backlight
1603                     	xdef	_disp_backlight
1604                     	xref	_file_update2
1605                     	xref	__key_blink
1606                     	xref	__key_hour
1607                     	xref	__key_min
1608                     	xref	__key_sec
1609                     	xref	__disp_mode2
1610                     	xref	__disp_mode
1611                     	xdef	_disp_status_loop_clientDn
1612                     	xref	_disp_status_curr_only
1613                     	xref	_disp_status_loop_init
1614                     	xref	_disp_status_loop_host_B
1615                     	xref	_disp_status_loop_host_Y
1616                     	xref	_disp_status_loop_host_N
1617                     	xdef	_disp_status_loop_messageDn
1618                     	xref	_disp_status_loop_message
1619                     	xref	__dsPrev
1620                     	xref	__dsCount
1621                     	xdef	_disp_status_loop_client
1622                     	xref	___sDn
1623                     	xref	___sUp
1624                     	xref	___s
1625                     	xref	_lcd_blink_clear
1626                     	xref	_lcd_disp_n
1627                     	xref	_lcd_clear
1628                     	xref	_lcd_disp_backlight
1629                     	xref	_lcd_clear_btn
1630                     	xref	_iLF_DEF
1631                     	xref	_bLF_DEF
1632                     	xref	_uiInfo
1651                     	end
