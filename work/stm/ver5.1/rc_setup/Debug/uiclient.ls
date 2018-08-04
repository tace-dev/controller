   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               __backlight:
  21  0000 04            	dc.b	4
  22  0001               _lcd_pwmIndex2:
  23  0001 00            	dc.b	0
  24  0002               _lcd_pwmCount2:
  25  0002 19            	dc.b	25
  67                     ; 20 void	__rcCb(void)
  67                     ; 21 {
  69                     .text:	section	.text,new
  70  0000               ___rcCb:
  72  0000 88            	push	a
  73       00000001      OFST:	set	1
  76                     ; 23 	i = _backup_backlight==0 ? _backlight : 24;
  78  0001 725d0000      	tnz	__backup_backlight
  79  0005 2607          	jrne	L6
  80  0007 c60000        	ld	a,__backlight
  81  000a 5f            	clrw	x
  82  000b 97            	ld	xl,a
  83  000c 2003          	jra	L01
  84  000e               L6:
  85  000e ae0018        	ldw	x,#24
  86  0011               L01:
  87                     ; 24 	if( lcd_pwmIndex2 <= _backlight )	{	PWM_HIGH;	}
  89  0011 c60001        	ld	a,_lcd_pwmIndex2
  90  0014 c10000        	cp	a,__backlight
  91  0017 2206          	jrugt	L52
  94  0019 721c5014      	bset	20500,#6
  96  001d 2004          	jra	L72
  97  001f               L52:
  98                     ; 25 	else					{	PWM_LOW;	}
 100  001f 721d5014      	bres	20500,#6
 101  0023               L72:
 102                     ; 27 	lcd_pwmIndex2++;
 104  0023 725c0001      	inc	_lcd_pwmIndex2
 105                     ; 28 	if( lcd_pwmIndex2 == lcd_pwmCount2 )
 107  0027 c60001        	ld	a,_lcd_pwmIndex2
 108  002a c10002        	cp	a,_lcd_pwmCount2
 109  002d 2604          	jrne	L13
 110                     ; 29 		lcd_pwmIndex2 = 0;
 112  002f 725f0001      	clr	_lcd_pwmIndex2
 113  0033               L13:
 114                     ; 30 }
 117  0033 84            	pop	a
 118  0034 81            	ret
 164                     ; 32 void	disp_backlight(uint8_t mode)
 164                     ; 33 {
 165                     .text:	section	.text,new
 166  0000               _disp_backlight:
 168  0000 88            	push	a
 169       00000001      OFST:	set	1
 172                     ; 36 	if( _dsCount == 0 )
 174  0001 725d0000      	tnz	__dsCount
 175  0005 2612          	jrne	L15
 176                     ; 38 		lcd_clear(0);
 178  0007 4f            	clr	a
 179  0008 cd0000        	call	_lcd_clear
 181                     ; 39 		lcd_disp_backlight();
 183  000b cd0000        	call	_lcd_disp_backlight
 185                     ; 40 		_dsCount = 1;
 187  000e 35010000      	mov	__dsCount,#1
 188                     ; 41 		uiInfo._t = _backlight;
 190  0012 550000005f    	mov	_uiInfo+95,__backlight
 192  0017 2061          	jra	L35
 193  0019               L15:
 194                     ; 45 		i = _backlight;
 196  0019 c60000        	ld	a,__backlight
 197  001c 6b01          	ld	(OFST+0,sp),a
 198                     ; 46 		if( uiInfo.enc != 0 )
 200  001e 725d0000      	tnz	_uiInfo
 201  0022 272a          	jreq	L55
 202                     ; 48 			ENC_MOVE_0(1, 24, 1);
 204  0024 c60000        	ld	a,_uiInfo
 205  0027 a540          	bcp	a,#64
 206  0029 2610          	jrne	L75
 209  002b 7b01          	ld	a,(OFST+0,sp)
 210  002d a102          	cp	a,#2
 211  002f 2406          	jruge	L16
 214  0031 a618          	ld	a,#24
 215  0033 6b01          	ld	(OFST+0,sp),a
 217  0035 2012          	jra	L56
 218  0037               L16:
 221  0037 0a01          	dec	(OFST+0,sp)
 222  0039 200e          	jra	L56
 223  003b               L75:
 226  003b 7b01          	ld	a,(OFST+0,sp)
 227  003d a118          	cp	a,#24
 228  003f 2506          	jrult	L76
 231  0041 a601          	ld	a,#1
 232  0043 6b01          	ld	(OFST+0,sp),a
 234  0045 2002          	jra	L56
 235  0047               L76:
 238  0047 0c01          	inc	(OFST+0,sp)
 239  0049               L56:
 240                     ; 49 			_backlight = i;
 243  0049 7b01          	ld	a,(OFST+0,sp)
 244  004b c70000        	ld	__backlight,a
 245  004e               L55:
 246                     ; 51 		if( _dsPrev != i )
 248  004e c60000        	ld	a,__dsPrev
 249  0051 1101          	cp	a,(OFST+0,sp)
 250  0053 2725          	jreq	L35
 251                     ; 53 			_dsPrev = i;
 253  0055 7b01          	ld	a,(OFST+0,sp)
 254  0057 c70000        	ld	__dsPrev,a
 255                     ; 54 			UI_DISP_2Digit(i);
 257  005a 7b01          	ld	a,(OFST+0,sp)
 258  005c 5f            	clrw	x
 259  005d 97            	ld	xl,a
 260  005e a60a          	ld	a,#10
 261  0060 62            	div	x,a
 262  0061 9f            	ld	a,xl
 263  0062 97            	ld	xl,a
 264  0063 a602          	ld	a,#2
 265  0065 95            	ld	xh,a
 266  0066 cd0000        	call	_lcd_disp_n
 270  0069 7b01          	ld	a,(OFST+0,sp)
 271  006b 5f            	clrw	x
 272  006c 97            	ld	xl,a
 273  006d a60a          	ld	a,#10
 274  006f 62            	div	x,a
 275  0070 5f            	clrw	x
 276  0071 97            	ld	xl,a
 277  0072 9f            	ld	a,xl
 278  0073 97            	ld	xl,a
 279  0074 a603          	ld	a,#3
 280  0076 95            	ld	xh,a
 281  0077 cd0000        	call	_lcd_disp_n
 284  007a               L35:
 285                     ; 57 }
 288  007a 84            	pop	a
 289  007b 81            	ret
 328                     ; 61 void	disp_status_loop_messageDn(uint8_t i)
 328                     ; 62 {
 329                     .text:	section	.text,new
 330  0000               _disp_status_loop_messageDn:
 332  0000 88            	push	a
 333       00000000      OFST:	set	0
 336                     ; 63 	lcd_clear_btn();
 338  0001 cd0000        	call	_lcd_clear_btn
 340                     ; 64 	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(bS9);	/*	외출*/	}
 342  0004 7b01          	ld	a,(OFST+1,sp)
 343  0006 a101          	cp	a,#1
 344  0008 2614          	jrne	L111
 347  000a 35020000      	mov	__disp_mode,#2
 350  000e c60010        	ld	a,_iLF_DEF+16
 351  0011 5f            	clrw	x
 352  0012 97            	ld	xl,a
 353  0013 d6540c        	ld	a,(21516,x)
 354  0016 ca0010        	or	a,_bLF_DEF+16
 355  0019 d7540c        	ld	(21516,x),a
 357  001c 2064          	jra	L311
 358  001e               L111:
 359                     ; 65 	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bS10);	/*	정지*/	}
 361  001e 0d01          	tnz	(OFST+1,sp)
 362  0020 2614          	jrne	L511
 365  0022 35040000      	mov	__disp_mode,#4
 368  0026 c60020        	ld	a,_iLF_DEF+32
 369  0029 5f            	clrw	x
 370  002a 97            	ld	xl,a
 371  002b d6540c        	ld	a,(21516,x)
 372  002e ca0020        	or	a,_bLF_DEF+32
 373  0031 d7540c        	ld	(21516,x),a
 375  0034 204c          	jra	L311
 376  0036               L511:
 377                     ; 66 	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(bS6);	/*	난방*/	}
 379  0036 7b01          	ld	a,(OFST+1,sp)
 380  0038 a102          	cp	a,#2
 381  003a 2614          	jrne	L121
 384  003c 35010000      	mov	__disp_mode,#1
 387  0040 c60011        	ld	a,_iLF_DEF+17
 388  0043 5f            	clrw	x
 389  0044 97            	ld	xl,a
 390  0045 d6540c        	ld	a,(21516,x)
 391  0048 ca0011        	or	a,_bLF_DEF+17
 392  004b d7540c        	ld	(21516,x),a
 394  004e 2032          	jra	L311
 395  0050               L121:
 396                     ; 67 	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(bS7);	/*	예약*/	}
 398  0050 7b01          	ld	a,(OFST+1,sp)
 399  0052 a103          	cp	a,#3
 400  0054 2614          	jrne	L521
 403  0056 35080000      	mov	__disp_mode,#8
 406  005a c60021        	ld	a,_iLF_DEF+33
 407  005d 5f            	clrw	x
 408  005e 97            	ld	xl,a
 409  005f d6540c        	ld	a,(21516,x)
 410  0062 ca0021        	or	a,_bLF_DEF+33
 411  0065 d7540c        	ld	(21516,x),a
 413  0068 2018          	jra	L311
 414  006a               L521:
 415                     ; 68 	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(bS8);	/*	반복*/	}
 417  006a 7b01          	ld	a,(OFST+1,sp)
 418  006c a104          	cp	a,#4
 419  006e 2612          	jrne	L311
 422  0070 35100000      	mov	__disp_mode,#16
 425  0074 c60031        	ld	a,_iLF_DEF+49
 426  0077 5f            	clrw	x
 427  0078 97            	ld	xl,a
 428  0079 d6540c        	ld	a,(21516,x)
 429  007c ca0031        	or	a,_bLF_DEF+49
 430  007f d7540c        	ld	(21516,x),a
 431  0082               L311:
 432                     ; 69 	_disp_mode2 = _disp_mode;
 434  0082 5500000000    	mov	__disp_mode2,__disp_mode
 435                     ; 70 	timerClear();
 437  0087 cd0000        	call	_timerClear
 439                     ; 71 }
 442  008a 84            	pop	a
 443  008b 81            	ret
 479                     ; 73 void	disp_status_loop_clientDn(uint8_t key)
 479                     ; 74 {
 480                     .text:	section	.text,new
 481  0000               _disp_status_loop_clientDn:
 485                     ; 76 	disp_status_loop_messageDn(key);
 487  0000 cd0000        	call	_disp_status_loop_messageDn
 489                     ; 77 	disp_status_curr_only();
 491  0003 cd0000        	call	_disp_status_curr_only
 493                     ; 78 	lcd_blink_clear();
 495  0006 cd0000        	call	_lcd_blink_clear
 497                     ; 79 }
 500  0009 81            	ret
 564                     ; 81 void	disp_status_loop_client(uint8_t key)
 564                     ; 82 {
 565                     .text:	section	.text,new
 566  0000               _disp_status_loop_client:
 568  0000 88            	push	a
 569  0001 88            	push	a
 570       00000001      OFST:	set	1
 573                     ; 83 	uint8_t	i = 0;
 575  0002 0f01          	clr	(OFST+0,sp)
 576                     ; 84 	if( __s == 0 )
 578  0004 725d0000      	tnz	___s
 579  0008 2703          	jreq	L03
 580  000a cc02b8        	jp	L502
 581  000d               L03:
 582                     ; 86 		if( _dsCount == 0 )
 584  000d 725d0000      	tnz	__dsCount
 585  0011 2613          	jrne	L702
 586                     ; 88 			_dsCount = 1;
 588  0013 35010000      	mov	__dsCount,#1
 589                     ; 89 			__sUp = 0;
 591  0017 725f0000      	clr	___sUp
 592                     ; 90 			__sDn = 0xff;
 594  001b 35ff0000      	mov	___sDn,#255
 595                     ; 91 			disp_status_loop_init();
 597  001f cd0000        	call	_disp_status_loop_init
 600  0022 ace101e1      	jpf	L112
 601  0026               L702:
 602                     ; 93 		else if( _dsCount == 10 )
 604  0026 c60000        	ld	a,__dsCount
 605  0029 a10a          	cp	a,#10
 606  002b 260b          	jrne	L312
 607                     ; 95 			_dsCount = 1;
 609  002d 35010000      	mov	__dsCount,#1
 610                     ; 96 			disp_status_loop_init();
 612  0031 cd0000        	call	_disp_status_loop_init
 615  0034 ace101e1      	jpf	L112
 616  0038               L312:
 617                     ; 98 		else if( _dsCount == 1 )
 619  0038 c60000        	ld	a,__dsCount
 620  003b a101          	cp	a,#1
 621  003d 2703          	jreq	L23
 622  003f cc0142        	jp	L712
 623  0042               L23:
 624                     ; 100 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
 626  0042 725d0000      	tnz	___sUp
 627  0046 2609          	jrne	L122
 630  0048 7b02          	ld	a,(OFST+1,sp)
 631  004a cd0000        	call	_disp_status_loop_host_N
 633  004d 6b01          	ld	(OFST+0,sp),a
 635  004f 201e          	jra	L322
 636  0051               L122:
 637                     ; 101 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
 639  0051 c60000        	ld	a,___sUp
 640  0054 a101          	cp	a,#1
 641  0056 2609          	jrne	L522
 644  0058 7b02          	ld	a,(OFST+1,sp)
 645  005a cd0000        	call	_disp_status_loop_host_Y
 647  005d 6b01          	ld	(OFST+0,sp),a
 649  005f 200e          	jra	L322
 650  0061               L522:
 651                     ; 102 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
 653  0061 c60000        	ld	a,___sUp
 654  0064 a102          	cp	a,#2
 655  0066 2607          	jrne	L322
 658  0068 7b02          	ld	a,(OFST+1,sp)
 659  006a cd0000        	call	_disp_status_loop_host_B
 661  006d 6b01          	ld	(OFST+0,sp),a
 662  006f               L322:
 663                     ; 104 			if( i==1 )
 665  006f 7b01          	ld	a,(OFST+0,sp)
 666  0071 a101          	cp	a,#1
 667  0073 2604          	jrne	L332
 668                     ; 105 				_key_blink = 1;
 670  0075 35010000      	mov	__key_blink,#1
 671  0079               L332:
 672                     ; 107 			_disp_temp = __sUp==0 ? 1 : 0;
 674  0079 725d0000      	tnz	___sUp
 675  007d 2604          	jrne	L22
 676  007f a601          	ld	a,#1
 677  0081 2001          	jra	L42
 678  0083               L22:
 679  0083 4f            	clr	a
 680  0084               L42:
 681  0084 c70000        	ld	__disp_temp,a
 682                     ; 108 			if( _disp_temp == 0 && _key_blink == 0 )
 684  0087 725d0000      	tnz	__disp_temp
 685  008b 2626          	jrne	L532
 687  008d 725d0000      	tnz	__key_blink
 688  0091 2620          	jrne	L532
 689                     ; 110 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
 691  0093 c60000        	ld	a,___sUp
 692  0096 a101          	cp	a,#1
 693  0098 2715          	jreq	L142
 695  009a c60000        	ld	a,___sUp
 696  009d a102          	cp	a,#2
 697  009f 270e          	jreq	L142
 699  00a1 c60000        	ld	a,___sUp
 700  00a4 a105          	cp	a,#5
 701  00a6 2707          	jreq	L142
 703  00a8 c60000        	ld	a,___sUp
 704  00ab a108          	cp	a,#8
 705  00ad 2604          	jrne	L532
 706  00af               L142:
 707                     ; 111 					_disp_temp = 1;
 709  00af 35010000      	mov	__disp_temp,#1
 710  00b3               L532:
 711                     ; 114 			if( __sUp == 0 && i == 1 )
 713  00b3 725d0000      	tnz	___sUp
 714  00b7 260f          	jrne	L742
 716  00b9 7b01          	ld	a,(OFST+0,sp)
 717  00bb a101          	cp	a,#1
 718  00bd 2609          	jrne	L742
 719                     ; 116 marker_1_0:
 719                     ; 117 				_key_blink = 1;
 721  00bf 35010000      	mov	__key_blink,#1
 722                     ; 118 				lcd_blink_item(bS6);
 724  00c3 a611          	ld	a,#17
 725  00c5 cd0000        	call	_lcd_blink_item
 727  00c8               L742:
 728                     ; 120 			if( key == 1 )
 730  00c8 7b02          	ld	a,(OFST+1,sp)
 731  00ca a101          	cp	a,#1
 732  00cc 2620          	jrne	L152
 733                     ; 122 				if( __sUp == 0 )
 735  00ce 725d0000      	tnz	___sUp
 736  00d2 2702          	jreq	L43
 737  00d4 207d          	jp	L151
 738  00d6               L43:
 739                     ; 124 					if( _key_blink == 1 )
 741  00d6 c60000        	ld	a,__key_blink
 742  00d9 a101          	cp	a,#1
 743  00db 2603          	jrne	L63
 744  00dd cc02a7        	jp	L561
 745  00e0               L63:
 746                     ; 125 						goto DisplayEntry;
 748                     ; 126 					disp_status_loop_clientDn(0);	//정지 - subR/C selection
 750  00e0 4f            	clr	a
 751  00e1 cd0000        	call	_disp_status_loop_clientDn
 753                     ; 127 					_dsCount = 4;
 755  00e4 35040000      	mov	__dsCount,#4
 756                     ; 129 					_disp_temp = 1;
 758  00e8 35010000      	mov	__disp_temp,#1
 760  00ec 206d          	jra	L752
 761  00ee               L152:
 762                     ; 139 			else if( key == 2 )
 764  00ee 7b02          	ld	a,(OFST+1,sp)
 765  00f0 a102          	cp	a,#2
 766  00f2 2779          	jreq	L351
 767                     ; 151 			else if( key == 3 )
 769  00f4 7b02          	ld	a,(OFST+1,sp)
 770  00f6 a103          	cp	a,#3
 771  00f8 263d          	jrne	L172
 772                     ; 153 				if( __sUp == 0 )
 774  00fa 725d0000      	tnz	___sUp
 775  00fe 2610          	jrne	L372
 776                     ; 155 					if( _key_blink == 0 )
 778  0100 725d0000      	tnz	__key_blink
 779  0104 2626          	jrne	L772
 780                     ; 157 marker_1s:						
 780                     ; 158 						__s = 2;
 782  0106 35020000      	mov	___s,#2
 783                     ; 159 						_dsCount = 0;
 785  010a 725f0000      	clr	__dsCount
 786                     ; 160 						return;
 789  010e 85            	popw	x
 790  010f 81            	ret
 791  0110               L372:
 792                     ; 163 				else if( __sUp == 1 )
 794  0110 c60000        	ld	a,___sUp
 795  0113 a101          	cp	a,#1
 796  0115 2608          	jrne	L103
 797                     ; 165 					if( _key_blink == 0 )
 799  0117 725d0000      	tnz	__key_blink
 800  011b 260f          	jrne	L772
 801                     ; 166 						goto marker_2;
 803  011d 204e          	jra	L351
 804  011f               L103:
 805                     ; 168 				else if( __sUp == 2 )
 807  011f c60000        	ld	a,___sUp
 808  0122 a102          	cp	a,#2
 809  0124 2606          	jrne	L772
 810                     ; 170 					if( _key_blink == 0 )
 812  0126 725d0000      	tnz	__key_blink
 813  012a 2769          	jreq	L161
 814                     ; 171 						goto marker_4;
 816  012c               L772:
 817                     ; 173 				disp_status_loop_init();
 819  012c cd0000        	call	_disp_status_loop_init
 821                     ; 174 				_key_blink = 0;
 823  012f 725f0000      	clr	__key_blink
 825  0133 ac930293      	jpf	L162
 826  0137               L172:
 827                     ; 176 			else if( key == 4 )
 829  0137 7b02          	ld	a,(OFST+1,sp)
 830  0139 a104          	cp	a,#4
 831  013b 2703          	jreq	L04
 832  013d cc0293        	jp	L162
 833  0140               L04:
 834  0140 2053          	jra	L161
 835  0142               L712:
 836                     ; 201 		else if( _dsCount == 4 )
 838  0142 c60000        	ld	a,__dsCount
 839  0145 a104          	cp	a,#4
 840  0147 2670          	jrne	L723
 841                     ; 203 			if( key == 1 )		
 843  0149 7b02          	ld	a,(OFST+1,sp)
 844  014b a101          	cp	a,#1
 845  014d 2614          	jrne	L133
 846                     ; 211 				_dsCount = 1;	
 848  014f 35010000      	mov	__dsCount,#1
 849                     ; 212 				goto marker_1;	
 850  0153               L151:
 851                     ; 133 marker_1:					
 851                     ; 134 					__sUp = 0;
 853  0153 725f0000      	clr	___sUp
 854                     ; 135 					_dsCount = 0;
 856  0157 725f0000      	clr	__dsCount
 857  015b               L752:
 858                     ; 137 				_dsPrev = 0xff;
 860  015b 35ff0000      	mov	__dsPrev,#255
 862  015f ac930293      	jpf	L162
 863  0163               L133:
 864                     ; 214 			else if( key == 2 )	{	_dsCount = 1;	goto marker_2;	}
 866  0163 7b02          	ld	a,(OFST+1,sp)
 867  0165 a102          	cp	a,#2
 868  0167 261c          	jrne	L533
 871  0169 35010000      	mov	__dsCount,#1
 873  016d               L351:
 874                     ; 141 marker_2:				
 874                     ; 142 				if( __sUp == 1 && _key_blink == 1 )
 876  016d c60000        	ld	a,___sUp
 877  0170 a101          	cp	a,#1
 878  0172 2703          	jreq	L24
 879  0174 cc0252        	jp	L551
 880  0177               L24:
 882  0177 c60000        	ld	a,__key_blink
 883  017a a101          	cp	a,#1
 884  017c 2703          	jreq	L44
 885  017e cc0252        	jp	L551
 886  0181               L44:
 887                     ; 143 					goto DisplayEntry;
 889  0181 aca702a7      	jpf	L561
 890  0185               L533:
 891                     ; 215 			else if( key == 3 )	{	}
 893  0185 7b02          	ld	a,(OFST+1,sp)
 894  0187 a103          	cp	a,#3
 895  0189 2722          	jreq	L333
 897                     ; 216 			else if( key == 4 )	{	_dsCount = 1;	goto marker_4;	}
 899  018b 7b02          	ld	a,(OFST+1,sp)
 900  018d a104          	cp	a,#4
 901  018f 261c          	jrne	L333
 904  0191 35010000      	mov	__dsCount,#1
 906  0195               L161:
 907                     ; 178 marker_4:				
 907                     ; 179 				if( __sUp == 2 && _key_blink == 1 )
 909  0195 c60000        	ld	a,___sUp
 910  0198 a102          	cp	a,#2
 911  019a 2703          	jreq	L64
 912  019c cc027d        	jp	L361
 913  019f               L64:
 915  019f c60000        	ld	a,__key_blink
 916  01a2 a101          	cp	a,#1
 917  01a4 2703          	jreq	L05
 918  01a6 cc027d        	jp	L361
 919  01a9               L05:
 920                     ; 180 					goto DisplayEntry;
 922  01a9 aca702a7      	jpf	L561
 923  01ad               L333:
 924                     ; 218 			if( uiInfo.enc != 0 )
 926  01ad 725d0000      	tnz	_uiInfo
 927  01b1 272e          	jreq	L112
 928                     ; 219 				_dsCount = 10;
 930  01b3 350a0000      	mov	__dsCount,#10
 931  01b7 2028          	jra	L112
 932  01b9               L723:
 933                     ; 221 		else if( _dsCount == 5 )
 935  01b9 c60000        	ld	a,__dsCount
 936  01bc a105          	cp	a,#5
 937  01be 260e          	jrne	L353
 938                     ; 223 			disp_status_loop_init();
 940  01c0 cd0000        	call	_disp_status_loop_init
 942                     ; 224 			disp_status_loop_clientDn(1);	//	외출모드 표시
 944  01c3 a601          	ld	a,#1
 945  01c5 cd0000        	call	_disp_status_loop_clientDn
 947                     ; 225 			_dsCount = 6;
 949  01c8 35060000      	mov	__dsCount,#6
 951  01cc 2013          	jra	L112
 952  01ce               L353:
 953                     ; 227 		else if( _dsCount == 6 )
 955  01ce c60000        	ld	a,__dsCount
 956  01d1 a106          	cp	a,#6
 957  01d3 260c          	jrne	L112
 958                     ; 229 			if( _disp_mode != _disp_mode2 )
 960  01d5 c60000        	ld	a,__disp_mode
 961  01d8 c10000        	cp	a,__disp_mode2
 962  01db 2704          	jreq	L112
 963                     ; 231 				_dsCount = 0;
 965  01dd 725f0000      	clr	__dsCount
 966  01e1               L112:
 967                     ; 235 		if( _dsCount == 1 || _dsCount == 4 )
 969  01e1 c60000        	ld	a,__dsCount
 970  01e4 a101          	cp	a,#1
 971  01e6 270a          	jreq	L563
 973  01e8 c60000        	ld	a,__dsCount
 974  01eb a104          	cp	a,#4
 975  01ed 2703          	jreq	L25
 976  01ef cc02e7        	jp	L714
 977  01f2               L25:
 978  01f2               L563:
 979                     ; 237 			if( _disp_mode != _disp_mode2 || packet_changed == 1)
 981  01f2 c60000        	ld	a,__disp_mode
 982  01f5 c10000        	cp	a,__disp_mode2
 983  01f8 260a          	jrne	L173
 985  01fa c60000        	ld	a,_packet_changed
 986  01fd a101          	cp	a,#1
 987  01ff 2703          	jreq	L45
 988  0201 cc02e7        	jp	L714
 989  0204               L45:
 990  0204               L173:
 991                     ; 239 				packet_changed = 0;
 993  0204 725f0000      	clr	_packet_changed
 994                     ; 240 				_dsCount = 1;
 996  0208 35010000      	mov	__dsCount,#1
 997                     ; 241 				_key_blink = 0;
 999  020c 725f0000      	clr	__key_blink
1000                     ; 242 				if( _disp_mode2 == 0x01 )		
1002  0210 c60000        	ld	a,__disp_mode2
1003  0213 a101          	cp	a,#1
1004  0215 260b          	jrne	L373
1005                     ; 244 					__sUp = 0; 
1007  0217 725f0000      	clr	___sUp
1009  021b               L573:
1010                     ; 273 				disp_status_loop_init();
1012  021b cd0000        	call	_disp_status_loop_init
1014  021e ace702e7      	jpf	L714
1015  0222               L373:
1016                     ; 246 				else if( _disp_mode2 == 0x02 )	
1018  0222 c60000        	ld	a,__disp_mode2
1019  0225 a102          	cp	a,#2
1020  0227 2606          	jrne	L773
1021                     ; 251 					_dsCount = 5;
1023  0229 35050000      	mov	__dsCount,#5
1024                     ; 252 					return;
1026  022d 200e          	jra	L62
1027  022f               L773:
1028                     ; 254 				else if( _disp_mode2 == 0x04 )	
1030  022f c60000        	ld	a,__disp_mode2
1031  0232 a104          	cp	a,#4
1032  0234 2609          	jrne	L304
1033                     ; 256 					disp_status_loop_init();
1035  0236 cd0000        	call	_disp_status_loop_init
1037                     ; 257 					disp_status_loop_clientDn(0);	// 정지
1039  0239 4f            	clr	a
1040  023a cd0000        	call	_disp_status_loop_clientDn
1042                     ; 258 					return;
1043  023d               L62:
1046  023d 85            	popw	x
1047  023e 81            	ret
1048  023f               L304:
1049                     ; 260 				else if( _disp_mode2 == 0x08 )	
1051  023f c60000        	ld	a,__disp_mode2
1052  0242 a108          	cp	a,#8
1053  0244 2624          	jrne	L704
1054                     ; 262 					_key_sec = _key_min = _key_hour = 0;
1056  0246 725f0000      	clr	__key_hour
1057  024a 725f0000      	clr	__key_min
1058  024e 725f0000      	clr	__key_sec
1059                     ; 263 					goto marker_2s;
1060  0252               L551:
1061                     ; 144 marker_2s:
1061                     ; 145 				__sUp = 1;
1063  0252 35010000      	mov	___sUp,#1
1064                     ; 146 				_dsPrev = 0xff;
1066  0256 35ff0000      	mov	__dsPrev,#255
1067                     ; 147 				disp_status_loop_message(__sUp);
1069  025a a601          	ld	a,#1
1070  025c cd0000        	call	_disp_status_loop_message
1072                     ; 148 				lcd_blink_item(bS7);
1074  025f a621          	ld	a,#33
1075  0261 cd0000        	call	_lcd_blink_item
1077                     ; 149 				_key_blink = 1;
1079  0264 35010000      	mov	__key_blink,#1
1081  0268 2029          	jra	L162
1082  026a               L704:
1083                     ; 265 				else if( _disp_mode2 == 0x10 )	
1085  026a c60000        	ld	a,__disp_mode2
1086  026d a110          	cp	a,#16
1087  026f 2645          	jrne	L314
1088                     ; 267 					_key_sec = _key_min = _key_hour = 0;
1090  0271 725f0000      	clr	__key_hour
1091  0275 725f0000      	clr	__key_min
1092  0279 725f0000      	clr	__key_sec
1093                     ; 268 					goto marker_4s;
1094  027d               L361:
1095                     ; 181 marker_4s:
1095                     ; 182 				__sUp = 2;
1097  027d 35020000      	mov	___sUp,#2
1098                     ; 183 				_dsPrev = 0xff;
1100  0281 35ff0000      	mov	__dsPrev,#255
1101                     ; 184 				disp_status_loop_message(__sUp);
1103  0285 a602          	ld	a,#2
1104  0287 cd0000        	call	_disp_status_loop_message
1106                     ; 185 				lcd_blink_item(bS8);
1108  028a a631          	ld	a,#49
1109  028c cd0000        	call	_lcd_blink_item
1111                     ; 186 				_key_blink = 1;
1113  028f 35010000      	mov	__key_blink,#1
1114  0293               L162:
1115                     ; 188 			if( _key_blink == 1 )
1117  0293 c60000        	ld	a,__key_blink
1118  0296 a101          	cp	a,#1
1119  0298 2703          	jreq	L65
1120  029a cc01e1        	jp	L112
1121  029d               L65:
1122                     ; 190 				if( _key_sec >= KEY_BLINK_FADE )
1124  029d c60000        	ld	a,__key_sec
1125  02a0 a10a          	cp	a,#10
1126  02a2 2403          	jruge	L06
1127  02a4 cc01e1        	jp	L112
1128  02a7               L06:
1129  02a7               L561:
1130                     ; 192 DisplayEntry:					
1130                     ; 193 					//	reset key timer
1130                     ; 194 					lcd_blink_clear();
1132  02a7 cd0000        	call	_lcd_blink_clear
1134                     ; 195 					_key_blink = 0;
1136  02aa 725f0000      	clr	__key_blink
1137                     ; 196 					_dsCount = 10;
1139  02ae 350a0000      	mov	__dsCount,#10
1140  02b2 ace101e1      	jpf	L112
1141  02b6               L314:
1142                     ; 271 					return;
1144  02b6 2085          	jra	L62
1145  02b8               L502:
1146                     ; 277 	else if( __s == 2 )
1148  02b8 c60000        	ld	a,___s
1149  02bb a102          	cp	a,#2
1150  02bd 2628          	jrne	L714
1151                     ; 279 		disp_backlight(0);
1153  02bf 4f            	clr	a
1154  02c0 cd0000        	call	_disp_backlight
1156                     ; 280 		if( key == 1 || key == 2 || key == 3 || key == 4 )
1158  02c3 7b02          	ld	a,(OFST+1,sp)
1159  02c5 a101          	cp	a,#1
1160  02c7 2712          	jreq	L524
1162  02c9 7b02          	ld	a,(OFST+1,sp)
1163  02cb a102          	cp	a,#2
1164  02cd 270c          	jreq	L524
1166  02cf 7b02          	ld	a,(OFST+1,sp)
1167  02d1 a103          	cp	a,#3
1168  02d3 2706          	jreq	L524
1170  02d5 7b02          	ld	a,(OFST+1,sp)
1171  02d7 a104          	cp	a,#4
1172  02d9 260c          	jrne	L714
1173  02db               L524:
1174                     ; 282 			__s = 0;
1176  02db 725f0000      	clr	___s
1177                     ; 283 			_dsCount = 0;
1179  02df 725f0000      	clr	__dsCount
1180                     ; 284 			file_update2(0);
1182  02e3 4f            	clr	a
1183  02e4 cd0000        	call	_file_update2
1185  02e7               L714:
1186                     ; 287 }
1189  02e7 85            	popw	x
1190  02e8 81            	ret
1226                     	xref	_timerClear
1227                     	xdef	___rcCb
1228                     	xref	__backup_backlight
1229                     	xref	_packet_changed
1230                     	xref	__disp_temp
1231                     	xdef	_lcd_pwmCount2
1232                     	xdef	_lcd_pwmIndex2
1233                     	xdef	__backlight
1234                     	xdef	_disp_backlight
1235                     	xref	_file_update2
1236                     	xref	__key_blink
1237                     	xref	__key_hour
1238                     	xref	__key_min
1239                     	xref	__key_sec
1240                     	xref	__disp_mode2
1241                     	xref	__disp_mode
1242                     	xdef	_disp_status_loop_clientDn
1243                     	xref	_disp_status_curr_only
1244                     	xref	_disp_status_loop_init
1245                     	xref	_disp_status_loop_host_B
1246                     	xref	_disp_status_loop_host_Y
1247                     	xref	_disp_status_loop_host_N
1248                     	xdef	_disp_status_loop_messageDn
1249                     	xref	_disp_status_loop_message
1250                     	xref	__dsPrev
1251                     	xref	__dsCount
1252                     	xdef	_disp_status_loop_client
1253                     	xref	___sDn
1254                     	xref	___sUp
1255                     	xref	___s
1256                     	xref	_lcd_blink_item
1257                     	xref	_lcd_blink_clear
1258                     	xref	_lcd_disp_n
1259                     	xref	_lcd_clear
1260                     	xref	_lcd_disp_backlight
1261                     	xref	_lcd_clear_btn
1262                     	xref	_iLF_DEF
1263                     	xref	_bLF_DEF
1264                     	xref	_uiInfo
1283                     	end
