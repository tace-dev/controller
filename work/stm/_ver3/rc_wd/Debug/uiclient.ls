   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               __lcdEnable:
  23  0000 00            	dc.b	0
  24  0001               __backlight:
  25  0001 04            	dc.b	4
  26  0002               _lcd_pwmIndex2:
  27  0002 00            	dc.b	0
  28  0003               _lcd_pwmCount2:
  29  0003 19            	dc.b	25
  72                     ; 27 void	__rcCb(void)
  72                     ; 28 {
  74                     	switch	.text
  75  0000               ___rcCb:
  77  0000 88            	push	a
  78       00000001      OFST:	set	1
  81                     ; 30 	i = _backup_backlight2==0 ? _backlight : 24;
  83  0001 c60000        	ld	a,__backup_backlight2
  84  0004 2605          	jrne	L6
  85  0006 c60001        	ld	a,__backlight
  86  0009 2002          	jra	L01
  87  000b               L6:
  88  000b a618          	ld	a,#24
  89  000d               L01:
  90  000d 6b01          	ld	(OFST+0,sp),a
  91                     ; 37 	if( _lcdTimer[1] == 2 )
  93  000f c60001        	ld	a,__lcdTimer+1
  94  0012 a102          	cp	a,#2
  95  0014 2602          	jrne	L52
  96                     ; 38 		return;
  99  0016 84            	pop	a
 100  0017 81            	ret	
 101  0018               L52:
 102                     ; 41 	if( lcd_pwmIndex2 <= i )	{	PWM_HIGH;	}
 104  0018 c60002        	ld	a,_lcd_pwmIndex2
 105  001b 1101          	cp	a,(OFST+0,sp)
 106  001d 2206          	jrugt	L72
 109  001f 721c5014      	bset	20500,#6
 111  0023 2004          	jra	L13
 112  0025               L72:
 113                     ; 42 	else					{	PWM_LOW;	}
 115  0025 721d5014      	bres	20500,#6
 116  0029               L13:
 117                     ; 44 	lcd_pwmIndex2++;
 119  0029 725c0002      	inc	_lcd_pwmIndex2
 120                     ; 45 	if( lcd_pwmIndex2 == lcd_pwmCount2 )
 122  002d c60002        	ld	a,_lcd_pwmIndex2
 123  0030 c10003        	cp	a,_lcd_pwmCount2
 124  0033 2604          	jrne	L33
 125                     ; 46 		lcd_pwmIndex2 = 0;
 127  0035 725f0002      	clr	_lcd_pwmIndex2
 128  0039               L33:
 129                     ; 47 }
 132  0039 84            	pop	a
 133  003a 81            	ret	
 179                     ; 49 void	disp_backlight(uint8_t mode)
 179                     ; 50 {
 180                     	switch	.text
 181  003b               _disp_backlight:
 183  003b 88            	push	a
 184       00000001      OFST:	set	1
 187                     ; 53 	if( _dsCount == 0 )
 189  003c c60000        	ld	a,__dsCount
 190  003f 2611          	jrne	L35
 191                     ; 55 		lcd_clear(0);
 193  0041 cd0000        	call	_lcd_clear
 195                     ; 56 		lcd_disp_backlight();
 197  0044 cd0000        	call	_lcd_disp_backlight
 199                     ; 57 		_dsCount = 1;
 201  0047 35010000      	mov	__dsCount,#1
 202                     ; 58 		uiInfo._t = _backlight;
 204  004b 550001005f    	mov	_uiInfo+95,__backlight
 206  0050 2054          	jra	L55
 207  0052               L35:
 208                     ; 62 		i = _backlight;
 210  0052 c60001        	ld	a,__backlight
 211  0055 6b01          	ld	(OFST+0,sp),a
 212                     ; 63 		if( uiInfo.enc != 0 )
 214  0057 c60000        	ld	a,_uiInfo
 215  005a 2725          	jreq	L75
 216                     ; 65 			ENC_MOVE_0(1, 24, 1);
 218  005c a540          	bcp	a,#64
 219  005e 260e          	jrne	L16
 222  0060 7b01          	ld	a,(OFST+0,sp)
 223  0062 a102          	cp	a,#2
 224  0064 2404          	jruge	L36
 227  0066 a618          	ld	a,#24
 229  0068 200c          	jp	LC001
 230  006a               L36:
 233  006a 0a01          	dec	(OFST+0,sp)
 234  006c 200e          	jra	L76
 235  006e               L16:
 238  006e 7b01          	ld	a,(OFST+0,sp)
 239  0070 a118          	cp	a,#24
 240  0072 2506          	jrult	L17
 243  0074 a601          	ld	a,#1
 244  0076               LC001:
 245  0076 6b01          	ld	(OFST+0,sp),a
 247  0078 2002          	jra	L76
 248  007a               L17:
 251  007a 0c01          	inc	(OFST+0,sp)
 252  007c               L76:
 253                     ; 66 			_backlight = i;
 256  007c 7b01          	ld	a,(OFST+0,sp)
 257  007e c70001        	ld	__backlight,a
 258  0081               L75:
 259                     ; 68 		if( _dsPrev != i )
 261  0081 c60000        	ld	a,__dsPrev
 262  0084 1101          	cp	a,(OFST+0,sp)
 263  0086 271e          	jreq	L55
 264                     ; 70 			_dsPrev = i;
 266  0088 7b01          	ld	a,(OFST+0,sp)
 267  008a c70000        	ld	__dsPrev,a
 268                     ; 71 			UI_DISP_2Digit(i);
 270  008d 5f            	clrw	x
 271  008e 97            	ld	xl,a
 272  008f a60a          	ld	a,#10
 273  0091 62            	div	x,a
 274  0092 a602          	ld	a,#2
 275  0094 95            	ld	xh,a
 276  0095 cd0000        	call	_lcd_disp_n
 280  0098 7b01          	ld	a,(OFST+0,sp)
 281  009a 5f            	clrw	x
 282  009b 97            	ld	xl,a
 283  009c a60a          	ld	a,#10
 284  009e 62            	div	x,a
 285  009f 97            	ld	xl,a
 286  00a0 a603          	ld	a,#3
 287  00a2 95            	ld	xh,a
 288  00a3 cd0000        	call	_lcd_disp_n
 291  00a6               L55:
 292                     ; 74 }
 295  00a6 84            	pop	a
 296  00a7 81            	ret	
 335                     ; 78 void	disp_status_loop_messageDn(uint8_t i)
 335                     ; 79 {
 336                     	switch	.text
 337  00a8               _disp_status_loop_messageDn:
 339  00a8 88            	push	a
 340       00000000      OFST:	set	0
 343                     ; 80 	lcd_clear_btn();
 345  00a9 cd0000        	call	_lcd_clear_btn
 347                     ; 81 	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(bS9);	/*	외출*/	}
 349  00ac 7b01          	ld	a,(OFST+1,sp)
 350  00ae 4a            	dec	a
 351  00af 2611          	jrne	L311
 354  00b1 35020000      	mov	__disp_mode,#2
 357  00b5 5f            	clrw	x
 358  00b6 c60010        	ld	a,_iLF_DEF+16
 359  00b9 97            	ld	xl,a
 360  00ba d6540c        	ld	a,(21516,x)
 361  00bd ca0010        	or	a,_bLF_DEF+16
 363  00c0 2052          	jp	LC002
 364  00c2               L311:
 365                     ; 82 	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bS10);	/*	정지*/	}
 367  00c2 7b01          	ld	a,(OFST+1,sp)
 368  00c4 2611          	jrne	L711
 371  00c6 35040000      	mov	__disp_mode,#4
 374  00ca 5f            	clrw	x
 375  00cb c60020        	ld	a,_iLF_DEF+32
 376  00ce 97            	ld	xl,a
 377  00cf d6540c        	ld	a,(21516,x)
 378  00d2 ca0020        	or	a,_bLF_DEF+32
 380  00d5 203d          	jp	LC002
 381  00d7               L711:
 382                     ; 83 	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(bS6);	/*	난방*/	}
 384  00d7 a102          	cp	a,#2
 385  00d9 2611          	jrne	L321
 388  00db 35010000      	mov	__disp_mode,#1
 391  00df 5f            	clrw	x
 392  00e0 c60011        	ld	a,_iLF_DEF+17
 393  00e3 97            	ld	xl,a
 394  00e4 d6540c        	ld	a,(21516,x)
 395  00e7 ca0011        	or	a,_bLF_DEF+17
 397  00ea 2028          	jp	LC002
 398  00ec               L321:
 399                     ; 84 	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(bS7);	/*	예약*/	}
 401  00ec a103          	cp	a,#3
 402  00ee 2611          	jrne	L721
 405  00f0 35080000      	mov	__disp_mode,#8
 408  00f4 5f            	clrw	x
 409  00f5 c60021        	ld	a,_iLF_DEF+33
 410  00f8 97            	ld	xl,a
 411  00f9 d6540c        	ld	a,(21516,x)
 412  00fc ca0021        	or	a,_bLF_DEF+33
 414  00ff 2013          	jp	LC002
 415  0101               L721:
 416                     ; 85 	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(bS8);	/*	반복*/	}
 418  0101 a104          	cp	a,#4
 419  0103 2612          	jrne	L511
 422  0105 35100000      	mov	__disp_mode,#16
 425  0109 5f            	clrw	x
 426  010a c60031        	ld	a,_iLF_DEF+49
 427  010d 97            	ld	xl,a
 428  010e d6540c        	ld	a,(21516,x)
 429  0111 ca0031        	or	a,_bLF_DEF+49
 430  0114               LC002:
 431  0114 d7540c        	ld	(21516,x),a
 432  0117               L511:
 433                     ; 86 	_disp_mode2 = _disp_mode;
 435  0117 5500000000    	mov	__disp_mode2,__disp_mode
 436                     ; 87 	timerClear();
 438  011c cd0000        	call	_timerClear
 440                     ; 88 }
 443  011f 84            	pop	a
 444  0120 81            	ret	
 480                     ; 90 void	disp_status_loop_clientDn(uint8_t key)
 480                     ; 91 {
 481                     	switch	.text
 482  0121               _disp_status_loop_clientDn:
 486                     ; 93 	disp_status_loop_messageDn(key);
 488  0121 ad85          	call	_disp_status_loop_messageDn
 490                     ; 94 	disp_status_curr_only();
 492  0123 cd0000        	call	_disp_status_curr_only
 494                     ; 95 	lcd_blink_clear();
 497                     ; 96 }
 500  0126 cc0000        	jp	_lcd_blink_clear
 564                     ; 104 void	disp_status_loop_client(uint8_t key)
 564                     ; 105 {
 565                     	switch	.text
 566  0129               _disp_status_loop_client:
 568  0129 88            	push	a
 569  012a 88            	push	a
 570       00000001      OFST:	set	1
 573                     ; 106 	uint8_t	i = 0;
 575  012b 0f01          	clr	(OFST+0,sp)
 576                     ; 107 	if( __s == 0 )
 578  012d c60000        	ld	a,___s
 579  0130 2703cc0344    	jrne	L502
 580                     ; 109 		if( _dsCount == 0 )
 582  0135 c60000        	ld	a,__dsCount
 583  0138 2611          	jrne	L702
 584                     ; 111 			_dsCount = 1;
 586  013a 35010000      	mov	__dsCount,#1
 587                     ; 112 			__sUp = 0;
 589  013e c70000        	ld	___sUp,a
 590                     ; 113 			__sDn = 0xff;
 592  0141 35ff0000      	mov	___sDn,#255
 593                     ; 114 			disp_status_loop_init();
 595  0145 cd0000        	call	_disp_status_loop_init
 598  0148 cc02a1        	jra	L112
 599  014b               L702:
 600                     ; 116 		else if( _dsCount == 10 )
 602  014b a10a          	cp	a,#10
 603  014d 260a          	jrne	L312
 604                     ; 118 			_dsCount = 1;
 606  014f 35010000      	mov	__dsCount,#1
 607                     ; 119 			disp_status_loop_init();
 609  0153 cd0000        	call	_disp_status_loop_init
 612  0156 cc02a1        	jra	L112
 613  0159               L312:
 614                     ; 121 		else if( _dsCount == 1 )
 616  0159 a101          	cp	a,#1
 617  015b 2703cc0221    	jrne	L712
 618                     ; 123 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
 620  0160 c60000        	ld	a,___sUp
 621  0163 2607          	jrne	L122
 624  0165 7b02          	ld	a,(OFST+1,sp)
 625  0167 cd0000        	call	_disp_status_loop_host_N
 628  016a 2014          	jp	LC003
 629  016c               L122:
 630                     ; 124 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
 632  016c a101          	cp	a,#1
 633  016e 2607          	jrne	L522
 636  0170 7b02          	ld	a,(OFST+1,sp)
 637  0172 cd0000        	call	_disp_status_loop_host_Y
 640  0175 2009          	jp	LC003
 641  0177               L522:
 642                     ; 125 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
 644  0177 a102          	cp	a,#2
 645  0179 2607          	jrne	L322
 648  017b 7b02          	ld	a,(OFST+1,sp)
 649  017d cd0000        	call	_disp_status_loop_host_B
 651  0180               LC003:
 652  0180 6b01          	ld	(OFST+0,sp),a
 653  0182               L322:
 654                     ; 127 			if( i==1 )
 656  0182 7b01          	ld	a,(OFST+0,sp)
 657  0184 4a            	dec	a
 658  0185 2604          	jrne	L332
 659                     ; 128 				_key_blink = 1;
 661  0187 4c            	inc	a
 662  0188 c70000        	ld	__key_blink,a
 663  018b               L332:
 664                     ; 130 			_disp_temp = __sUp==0 ? 1 : 0;
 666  018b c60000        	ld	a,___sUp
 667  018e 2603          	jrne	L65
 668  0190 4c            	inc	a
 669  0191 2001          	jra	L06
 670  0193               L65:
 671  0193 4f            	clr	a
 672  0194               L06:
 673  0194 c70000        	ld	__disp_temp,a
 674                     ; 131 			if( _disp_temp == 0 && _key_blink == 0 )
 676  0197 261c          	jrne	L532
 678  0199 c60000        	ld	a,__key_blink
 679  019c 2617          	jrne	L532
 680                     ; 133 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
 682  019e c60000        	ld	a,___sUp
 683  01a1 a101          	cp	a,#1
 684  01a3 270c          	jreq	L142
 686  01a5 a102          	cp	a,#2
 687  01a7 2708          	jreq	L142
 689  01a9 a105          	cp	a,#5
 690  01ab 2704          	jreq	L142
 692  01ad a108          	cp	a,#8
 693  01af 2604          	jrne	L532
 694  01b1               L142:
 695                     ; 134 					_disp_temp = 1;
 697  01b1 35010000      	mov	__disp_temp,#1
 698  01b5               L532:
 699                     ; 137 			if( __sUp == 0 && i == 1 )
 701  01b5 c60000        	ld	a,___sUp
 702  01b8 260e          	jrne	L742
 704  01ba 7b01          	ld	a,(OFST+0,sp)
 705  01bc 4a            	dec	a
 706  01bd 2609          	jrne	L742
 707                     ; 139 marker_1_0:
 707                     ; 140 				_key_blink = 1;
 709  01bf 35010000      	mov	__key_blink,#1
 710                     ; 141 				lcd_blink_item(bS6);
 712  01c3 a611          	ld	a,#17
 713  01c5 cd0000        	call	_lcd_blink_item
 715  01c8               L742:
 716                     ; 143 			if( key == 1 )
 718  01c8 7b02          	ld	a,(OFST+1,sp)
 719  01ca a101          	cp	a,#1
 720  01cc 261c          	jrne	L152
 721                     ; 145 				if( __sUp == 0 )
 723  01ce c60000        	ld	a,___sUp
 724  01d1 265c          	jrne	L351
 725                     ; 147 					if( _key_blink == 1 )
 727  01d3 c60000        	ld	a,__key_blink
 728  01d6 4a            	dec	a
 729  01d7 2603cc0336    	jreq	L561
 730                     ; 148 						goto DisplayEntry;
 732                     ; 149 					disp_status_loop_clientDn(0);	//정지 - subR/C selection
 734  01dc 4f            	clr	a
 735  01dd cd0121        	call	_disp_status_loop_clientDn
 737                     ; 150 					_dsCount = 4;
 739  01e0 35040000      	mov	__dsCount,#4
 740                     ; 152 					_disp_temp = 1;
 742  01e4 35010000      	mov	__disp_temp,#1
 744  01e8 204d          	jra	L752
 745  01ea               L152:
 746                     ; 162 			else if( key == 2 )
 748  01ea a102          	cp	a,#2
 749  01ec 2758          	jreq	L551
 750                     ; 174 			else if( key == 3 )
 752  01ee a103          	cp	a,#3
 753  01f0 2629          	jrne	L172
 754                     ; 176 				if( __sUp == 0 )
 756  01f2 c60000        	ld	a,___sUp
 757  01f5 2606          	jrne	L372
 758                     ; 178 					if( _key_blink == 0 )
 760  01f7 725d0000      	tnz	__key_blink
 761  01fb 2014          	jra	L772
 762  01fd               L372:
 763                     ; 188 				else if( __sUp == 1 )
 765  01fd a101          	cp	a,#1
 766  01ff 2607          	jrne	L103
 767                     ; 190 					if( _key_blink == 0 )
 769  0201 c60000        	ld	a,__key_blink
 770  0204 260b          	jrne	L772
 771                     ; 191 						goto marker_2;
 773  0206 203e          	jra	L551
 774  0208               L103:
 775                     ; 193 				else if( __sUp == 2 )
 777  0208 a102          	cp	a,#2
 778  020a 2605          	jrne	L772
 779                     ; 195 					if( _key_blink == 0 )
 781  020c c60000        	ld	a,__key_blink
 782  020f 2753          	jreq	L161
 783                     ; 196 						goto marker_4;
 785  0211               L772:
 786                     ; 198 				disp_status_loop_init();
 788  0211 cd0000        	call	_disp_status_loop_init
 790                     ; 199 				_key_blink = 0;
 792  0214 725f0000      	clr	__key_blink
 794  0218 cc0326        	jra	L162
 795  021b               L172:
 796                     ; 201 			else if( key == 4 )
 798  021b a104          	cp	a,#4
 799  021d 26f9          	jrne	L162
 800  021f 2043          	jra	L161
 801  0221               L712:
 802                     ; 226 		else if( _dsCount == 4 )
 804  0221 a104          	cp	a,#4
 805  0223 265a          	jrne	L723
 806                     ; 228 			if( key == 1 )		
 808  0225 7b02          	ld	a,(OFST+1,sp)
 809  0227 a101          	cp	a,#1
 810  0229 2613          	jrne	L133
 811                     ; 236 				_dsCount = 1;	
 813  022b 35010000      	mov	__dsCount,#1
 814                     ; 237 				goto marker_1;	
 815  022f               L351:
 816                     ; 156 marker_1:					
 816                     ; 157 					__sUp = 0;
 818  022f 725f0000      	clr	___sUp
 819                     ; 158 					_dsCount = 0;
 821  0233 725f0000      	clr	__dsCount
 822  0237               L752:
 823                     ; 160 				_dsPrev = 0xff;
 825  0237 35ff0000      	mov	__dsPrev,#255
 827  023b cc0326        	jra	L162
 828  023e               L133:
 829                     ; 239 			else if( key == 2 )	{	_dsCount = 1;	goto marker_2;	}
 831  023e a102          	cp	a,#2
 832  0240 2616          	jrne	L533
 835  0242 35010000      	mov	__dsCount,#1
 837  0246               L551:
 838                     ; 164 marker_2:				
 838                     ; 165 				if( __sUp == 1 && _key_blink == 1 )
 840  0246 c60000        	ld	a,___sUp
 841  0249 4a            	dec	a
 842  024a 2703cc0301    	jrne	L751
 844  024f c60000        	ld	a,__key_blink
 845  0252 4a            	dec	a
 846  0253 26f7          	jrne	L751
 847                     ; 166 					goto DisplayEntry;
 849  0255 cc0336        	jra	L561
 850  0258               L533:
 851                     ; 240 			else if( key == 3 )	{	}
 853  0258 a103          	cp	a,#3
 854  025a 271b          	jreq	L333
 856                     ; 241 			else if( key == 4 )	{	_dsCount = 1;	goto marker_4;	}
 858  025c a104          	cp	a,#4
 859  025e 2617          	jrne	L333
 862  0260 35010000      	mov	__dsCount,#1
 864  0264               L161:
 865                     ; 203 marker_4:				
 865                     ; 204 				if( __sUp == 2 && _key_blink == 1 )
 867  0264 c60000        	ld	a,___sUp
 868  0267 a102          	cp	a,#2
 869  0269 2703cc0319    	jrne	L361
 871  026e c60000        	ld	a,__key_blink
 872  0271 4a            	dec	a
 873  0272 26f7          	jrne	L361
 874                     ; 205 					goto DisplayEntry;
 876  0274 cc0336        	jra	L561
 877  0277               L333:
 878                     ; 243 			if( uiInfo.enc != 0 )
 880  0277 c60000        	ld	a,_uiInfo
 881  027a 2725          	jreq	L112
 882                     ; 244 				_dsCount = 10;
 883  027c cc033d        	jp	LC004
 884  027f               L723:
 885                     ; 246 		else if( _dsCount == 5 )
 887  027f a105          	cp	a,#5
 888  0281 260e          	jrne	L353
 889                     ; 248 			disp_status_loop_init();
 891  0283 cd0000        	call	_disp_status_loop_init
 893                     ; 249 			disp_status_loop_clientDn(1);	//	외출모드 표시
 895  0286 a601          	ld	a,#1
 896  0288 cd0121        	call	_disp_status_loop_clientDn
 898                     ; 250 			_dsCount = 6;
 900  028b 35060000      	mov	__dsCount,#6
 902  028f 2010          	jra	L112
 903  0291               L353:
 904                     ; 252 		else if( _dsCount == 6 )
 906  0291 a106          	cp	a,#6
 907  0293 260c          	jrne	L112
 908                     ; 254 			if( _disp_mode != _disp_mode2 )
 910  0295 c60000        	ld	a,__disp_mode
 911  0298 c10000        	cp	a,__disp_mode2
 912  029b 2704          	jreq	L112
 913                     ; 256 				_dsCount = 0;
 915  029d 725f0000      	clr	__dsCount
 916  02a1               L112:
 917                     ; 260 		if( _dsCount == 1 || _dsCount == 4 )
 919  02a1 c60000        	ld	a,__dsCount
 920  02a4 a101          	cp	a,#1
 921  02a6 2707          	jreq	L563
 923  02a8 a104          	cp	a,#4
 924  02aa 2703cc036a    	jrne	L124
 925  02af               L563:
 926                     ; 262 			if( _disp_mode != _disp_mode2 || packet_changed == 1)
 928  02af c60000        	ld	a,__disp_mode
 929  02b2 c10000        	cp	a,__disp_mode2
 930  02b5 2606          	jrne	L173
 932  02b7 c60000        	ld	a,_packet_changed
 933  02ba 4a            	dec	a
 934  02bb 26ef          	jrne	L124
 935  02bd               L173:
 936                     ; 264 				packet_changed = 0;
 938  02bd 725f0000      	clr	_packet_changed
 939                     ; 265 				_dsCount = 1;
 941  02c1 35010000      	mov	__dsCount,#1
 942                     ; 266 				_key_blink = 0;
 944  02c5 725f0000      	clr	__key_blink
 945                     ; 267 				if( _disp_mode2 == 0x01 )		
 947  02c9 c60000        	ld	a,__disp_mode2
 948  02cc a101          	cp	a,#1
 949  02ce 260a          	jrne	L373
 950                     ; 269 					__sUp = 0; 
 952  02d0 725f0000      	clr	___sUp
 954                     ; 298 				disp_status_loop_init();
 956  02d4 cd0000        	call	_disp_status_loop_init
 958  02d7 cc036a        	jra	L124
 959  02da               L373:
 960                     ; 271 				else if( _disp_mode2 == 0x02 )	
 962  02da a102          	cp	a,#2
 963  02dc 2606          	jrne	L773
 964                     ; 276 					_dsCount = 5;
 966  02de 35050000      	mov	__dsCount,#5
 967                     ; 277 					return;
 969  02e2 200b          	jra	L021
 970  02e4               L773:
 971                     ; 279 				else if( _disp_mode2 == 0x04 )	
 973  02e4 a104          	cp	a,#4
 974  02e6 2609          	jrne	L304
 975                     ; 281 					disp_status_loop_init();
 977  02e8 cd0000        	call	_disp_status_loop_init
 979                     ; 282 					disp_status_loop_clientDn(0);	// 정지
 981  02eb 4f            	clr	a
 982  02ec cd0121        	call	_disp_status_loop_clientDn
 984                     ; 283 					return;
 985  02ef               L021:
 988  02ef 85            	popw	x
 989  02f0 81            	ret	
 990  02f1               L304:
 991                     ; 285 				else if( _disp_mode2 == 0x08 )	
 993  02f1 a108          	cp	a,#8
 994  02f3 2614          	jrne	L704
 995                     ; 287 					_key_sec = _key_min = _key_hour = 0;
 997  02f5 725f0000      	clr	__key_hour
 998  02f9 725f0000      	clr	__key_min
 999  02fd 725f0000      	clr	__key_sec
1000                     ; 288 					goto marker_2s;
1001  0301               L751:
1002                     ; 167 marker_2s:
1002                     ; 168 				__sUp = 1;
1004  0301 a601          	ld	a,#1
1005  0303 ad67          	call	LC006
1007                     ; 171 				lcd_blink_item(bS7);
1009  0305 a621          	ld	a,#33
1011                     ; 172 				_key_blink = 1;
1013  0307 2016          	jp	LC005
1014  0309               L704:
1015                     ; 290 				else if( _disp_mode2 == 0x10 )	
1017  0309 a110          	cp	a,#16
1018  030b 26e2          	jrne	L021
1019                     ; 292 					_key_sec = _key_min = _key_hour = 0;
1021  030d 725f0000      	clr	__key_hour
1022  0311 725f0000      	clr	__key_min
1023  0315 725f0000      	clr	__key_sec
1024                     ; 293 					goto marker_4s;
1025  0319               L361:
1026                     ; 206 marker_4s:
1026                     ; 207 				__sUp = 2;
1028  0319 a602          	ld	a,#2
1029  031b ad4f          	call	LC006
1031                     ; 210 				lcd_blink_item(bS8);
1033  031d a631          	ld	a,#49
1035                     ; 211 				_key_blink = 1;
1037  031f               LC005:
1038  031f cd0000        	call	_lcd_blink_item
1040  0322 35010000      	mov	__key_blink,#1
1041  0326               L162:
1042                     ; 213 			if( _key_blink == 1 )
1044  0326 c60000        	ld	a,__key_blink
1045  0329 4a            	dec	a
1046  032a 2703cc02a1    	jrne	L112
1047                     ; 215 				if( _key_sec >= KEY_BLINK_FADE )
1049  032f c60000        	ld	a,__key_sec
1050  0332 a10a          	cp	a,#10
1051  0334 25f6          	jrult	L112
1052  0336               L561:
1053                     ; 217 DisplayEntry:					
1053                     ; 218 					//	reset key timer
1053                     ; 219 					lcd_blink_clear();
1055  0336 cd0000        	call	_lcd_blink_clear
1057                     ; 220 					_key_blink = 0;
1059  0339 725f0000      	clr	__key_blink
1060                     ; 221 					_dsCount = 10;
1062  033d               LC004:
1064  033d 350a0000      	mov	__dsCount,#10
1065  0341 cc02a1        	jra	L112
1066                     ; 296 					return;
1068  0344               L502:
1069                     ; 302 	else if( __s == /*2*/7 )
1071  0344 a107          	cp	a,#7
1072  0346 2622          	jrne	L124
1073                     ; 304 		disp_backlight(0);
1075  0348 4f            	clr	a
1076  0349 cd003b        	call	_disp_backlight
1078                     ; 305 		if( key == 1 || key == 2 || key == 3 || key == 4 )
1080  034c 7b02          	ld	a,(OFST+1,sp)
1081  034e a101          	cp	a,#1
1082  0350 270c          	jreq	L524
1084  0352 a102          	cp	a,#2
1085  0354 2708          	jreq	L524
1087  0356 a103          	cp	a,#3
1088  0358 2704          	jreq	L524
1090  035a a104          	cp	a,#4
1091  035c 260c          	jrne	L124
1092  035e               L524:
1093                     ; 307 			__s = 0;
1095  035e 725f0000      	clr	___s
1096                     ; 308 			_dsCount = 0;
1098  0362 725f0000      	clr	__dsCount
1099                     ; 309 			file_update2(0);
1101  0366 4f            	clr	a
1102  0367 cd0000        	call	_file_update2
1104  036a               L124:
1105                     ; 312 	else if( __s == 2 )
1107                     ; 394 }
1110  036a 85            	popw	x
1111  036b 81            	ret	
1112  036c               LC006:
1113  036c c70000        	ld	___sUp,a
1114                     ; 208 				_dsPrev = 0xff;
1116  036f 35ff0000      	mov	__dsPrev,#255
1117                     ; 209 				disp_status_loop_message(__sUp);
1119  0373 cc0000        	jp	_disp_status_loop_message
1172                     	xref	_timerClear
1173                     	xdef	___rcCb
1174                     	xref	__backup_backlight2
1175                     	xref	_packet_changed
1176                     	xref	__disp_temp
1177                     	xdef	_lcd_pwmCount2
1178                     	xdef	_lcd_pwmIndex2
1179                     	xdef	__backlight
1180                     	xdef	__lcdEnable
1181                     	switch	.bss
1182  0000               __lcdTimer:
1183  0000 000000        	ds.b	3
1184                     	xdef	__lcdTimer
1185                     	xdef	_disp_backlight
1186                     	xref	_file_update2
1187                     	xref	__key_blink
1188                     	xref	__key_hour
1189                     	xref	__key_min
1190                     	xref	__key_sec
1191                     	xref	__disp_mode2
1192                     	xref	__disp_mode
1193                     	xdef	_disp_status_loop_clientDn
1194                     	xref	_disp_status_curr_only
1195                     	xref	_disp_status_loop_init
1196                     	xref	_disp_status_loop_host_B
1197                     	xref	_disp_status_loop_host_Y
1198                     	xref	_disp_status_loop_host_N
1199                     	xdef	_disp_status_loop_messageDn
1200                     	xref	_disp_status_loop_message
1201                     	xref	__dsPrev
1202                     	xref	__dsCount
1203                     	xdef	_disp_status_loop_client
1204                     	xref	___sDn
1205                     	xref	___sUp
1206                     	xref	___s
1207                     	xref	_lcd_blink_item
1208                     	xref	_lcd_blink_clear
1209                     	xref	_lcd_disp_n
1210                     	xref	_lcd_clear
1211                     	xref	_lcd_disp_backlight
1212                     	xref	_lcd_clear_btn
1213                     	xref	_iLF_DEF
1214                     	xref	_bLF_DEF
1215                     	xref	_uiInfo
1235                     	end
