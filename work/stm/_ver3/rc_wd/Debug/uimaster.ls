   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               __boiler_type:
  23  0000 00            	dc.b	0
  24  0001               __boiler_water_shower:
  25  0001 32            	dc.b	50
  26  0002               __boiler_water_heat:
  27  0002 46            	dc.b	70
  28  0003               __boiler_fire:
  29  0003 00            	dc.b	0
  30  0004               __remote:
  31  0004 00            	dc.b	0
  32  0005               __disp_mode:
  33  0005 01            	dc.b	1
  34  0006               __disp_mode2:
  35  0006 01            	dc.b	1
  77                     ; 26 void	disp_status_remote_message(uint8_t i)
  77                     ; 27 {
  79                     	switch	.text
  80  0000               _disp_status_remote_message:
  82  0000 88            	push	a
  83       00000000      OFST:	set	0
  86                     ; 28 	lcd_clear_btn();
  88  0001 cd0000        	call	_lcd_clear_btn
  90                     ; 29 	if( i == 0x01 )			{	LCD_BIT_SET(bS6);	/*	(0)난방*/	}
  92  0004 7b01          	ld	a,(OFST+1,sp)
  93  0006 a101          	cp	a,#1
  94  0008 260a          	jrne	L52
  97  000a c60011        	ld	a,_iLF_DEF+17
  98  000d ad40          	call	LC002
  99  000f ca0011        	or	a,_bLF_DEF+17
 101  0012 2036          	jp	LC001
 102  0014               L52:
 103                     ; 30 	else if( i == 0x02 )	{	LCD_BIT_SET(bS9);	/*	(1)외출*/	}
 105  0014 a102          	cp	a,#2
 106  0016 260a          	jrne	L13
 109  0018 c60010        	ld	a,_iLF_DEF+16
 110  001b ad32          	call	LC002
 111  001d ca0010        	or	a,_bLF_DEF+16
 113  0020 2028          	jp	LC001
 114  0022               L13:
 115                     ; 31 	else if( i == 0x04 )	{	LCD_BIT_SET(bS10);	/*	(2)정지*/	}
 117  0022 a104          	cp	a,#4
 118  0024 260a          	jrne	L53
 121  0026 c60020        	ld	a,_iLF_DEF+32
 122  0029 ad24          	call	LC002
 123  002b ca0020        	or	a,_bLF_DEF+32
 125  002e 201a          	jp	LC001
 126  0030               L53:
 127                     ; 32 	else if( i == 0x08 )	{	LCD_BIT_SET(bS7);	/*	(2)예약*/	}
 129  0030 a108          	cp	a,#8
 130  0032 260a          	jrne	L14
 133  0034 c60021        	ld	a,_iLF_DEF+33
 134  0037 ad16          	call	LC002
 135  0039 ca0021        	or	a,_bLF_DEF+33
 137  003c 200c          	jp	LC001
 138  003e               L14:
 139                     ; 33 	else if( i == 0x10 )	{	LCD_BIT_SET(bS8);	/*	(2)반복*/	}
 141  003e a110          	cp	a,#16
 142  0040 260b          	jrne	L72
 145  0042 c60031        	ld	a,_iLF_DEF+49
 146  0045 ad08          	call	LC002
 147  0047 ca0031        	or	a,_bLF_DEF+49
 148  004a               LC001:
 149  004a d7540c        	ld	(21516,x),a
 150  004d               L72:
 151                     ; 34 }
 154  004d 84            	pop	a
 155  004e 81            	ret	
 156  004f               LC002:
 157  004f 5f            	clrw	x
 158  0050 97            	ld	xl,a
 159  0051 d6540c        	ld	a,(21516,x)
 160  0054 81            	ret	
 212                     ; 36 uint8_t		disp_status_loop_remote_N(uint8_t key)
 212                     ; 37 {
 213                     	switch	.text
 214  0055               _disp_status_loop_remote_N:
 216  0055 88            	push	a
 217  0056 89            	pushw	x
 218       00000002      OFST:	set	2
 221                     ; 39 	uint8_t	j = 0;
 223  0057 0f01          	clr	(OFST-1,sp)
 224                     ; 40 	i = uiInfo.tempSetup[key];
 226  0059 5f            	clrw	x
 227  005a 97            	ld	xl,a
 228  005b d6003d        	ld	a,(_uiInfo+61,x)
 229  005e 6b02          	ld	(OFST+0,sp),a
 230                     ; 41 	if( uiInfo.enc != 0 )
 232  0060 c60000        	ld	a,_uiInfo
 233  0063 2727          	jreq	L76
 234                     ; 44 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 236  0065 a540          	bcp	a,#64
 237  0067 2604          	jrne	L21
 238  0069 a6ff          	ld	a,#255
 239  006b 2002          	jra	L41
 240  006d               L21:
 241  006d a601          	ld	a,#1
 242  006f               L41:
 243  006f 1b02          	add	a,(OFST+0,sp)
 244                     ; 45 		if( i<=10 )	i = 10;
 246  0071 a10b          	cp	a,#11
 247  0073 2402          	jruge	L17
 250  0075 a60a          	ld	a,#10
 251  0077               L17:
 252                     ; 46 		if( i>=80 )	i = 80;
 254  0077 a150          	cp	a,#80
 255  0079 2502          	jrult	L37
 258  007b a650          	ld	a,#80
 259  007d               L37:
 260  007d 6b02          	ld	(OFST+0,sp),a
 261                     ; 47 		uiInfo.tempSetup[key] = i;
 263  007f 5f            	clrw	x
 264  0080 7b03          	ld	a,(OFST+1,sp)
 265  0082 97            	ld	xl,a
 266  0083 7b02          	ld	a,(OFST+0,sp)
 267  0085 d7003d        	ld	(_uiInfo+61,x),a
 268                     ; 48 		j = 1;
 270  0088 a601          	ld	a,#1
 271  008a 6b01          	ld	(OFST-1,sp),a
 272  008c               L76:
 273                     ; 50 	if( _dsPrev != i )
 275  008c c60000        	ld	a,__dsPrev
 276  008f 1102          	cp	a,(OFST+0,sp)
 277  0091 271e          	jreq	L57
 278                     ; 52 		_dsPrev = i;
 280  0093 7b02          	ld	a,(OFST+0,sp)
 281  0095 c70000        	ld	__dsPrev,a
 282                     ; 53 		ui_disp_temp_mark(1);
 284  0098 a601          	ld	a,#1
 285  009a cd0000        	call	_ui_disp_temp_mark
 287                     ; 54 		ui_disp_temp_setup(uiInfo.tempSetup[key]);
 289  009d 7b03          	ld	a,(OFST+1,sp)
 290  009f 5f            	clrw	x
 291  00a0 97            	ld	xl,a
 292  00a1 d6003d        	ld	a,(_uiInfo+61,x)
 293  00a4 cd0000        	call	_ui_disp_temp_setup
 295                     ; 55 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 297  00a7 7b03          	ld	a,(OFST+1,sp)
 298  00a9 5f            	clrw	x
 299  00aa 97            	ld	xl,a
 300  00ab d60035        	ld	a,(_uiInfo+53,x)
 301  00ae cd0000        	call	_ui_disp_temp_curr
 303  00b1               L57:
 304                     ; 57 	return j;
 306  00b1 7b01          	ld	a,(OFST-1,sp)
 309  00b3 5b03          	addw	sp,#3
 310  00b5 81            	ret	
 360                     ; 60 uint8_t	disp_status_loop_remote_Y(uint8_t key)
 360                     ; 61 {
 361                     	switch	.text
 362  00b6               _disp_status_loop_remote_Y:
 364  00b6 88            	push	a
 365  00b7 89            	pushw	x
 366       00000002      OFST:	set	2
 369                     ; 63 	uint8_t	j = 0;
 371  00b8 0f01          	clr	(OFST-1,sp)
 372                     ; 64 	i = uiInfo.remote_time[key];
 374  00ba 5f            	clrw	x
 375  00bb 97            	ld	xl,a
 376  00bc d6004d        	ld	a,(_uiInfo+77,x)
 377  00bf 6b02          	ld	(OFST+0,sp),a
 378                     ; 65 	if( uiInfo.enc != 0 )
 380  00c1 c60000        	ld	a,_uiInfo
 381  00c4 2727          	jreq	L711
 382                     ; 68 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 384  00c6 a540          	bcp	a,#64
 385  00c8 2604          	jrne	L62
 386  00ca a6ff          	ld	a,#255
 387  00cc 2002          	jra	L03
 388  00ce               L62:
 389  00ce a601          	ld	a,#1
 390  00d0               L03:
 391  00d0 1b02          	add	a,(OFST+0,sp)
 392                     ; 69 		if( i<=2 )	i = 2;
 394  00d2 a103          	cp	a,#3
 395  00d4 2402          	jruge	L121
 398  00d6 a602          	ld	a,#2
 399  00d8               L121:
 400                     ; 70 		if( i>=48 )	i = 48;
 402  00d8 a130          	cp	a,#48
 403  00da 2502          	jrult	L321
 406  00dc a630          	ld	a,#48
 407  00de               L321:
 408  00de 6b02          	ld	(OFST+0,sp),a
 409                     ; 71 		uiInfo.remote_time[key] = i;
 411  00e0 5f            	clrw	x
 412  00e1 7b03          	ld	a,(OFST+1,sp)
 413  00e3 97            	ld	xl,a
 414  00e4 7b02          	ld	a,(OFST+0,sp)
 415  00e6 d7004d        	ld	(_uiInfo+77,x),a
 416                     ; 72 		j = 1;
 418  00e9 a601          	ld	a,#1
 419  00eb 6b01          	ld	(OFST-1,sp),a
 420  00ed               L711:
 421                     ; 74 	if( _dsPrev != i )
 423  00ed c60000        	ld	a,__dsPrev
 424  00f0 1102          	cp	a,(OFST+0,sp)
 425  00f2 270f          	jreq	L521
 426                     ; 76 		_dsPrev = i;
 428  00f4 7b02          	ld	a,(OFST+0,sp)
 429  00f6 c70000        	ld	__dsPrev,a
 430                     ; 77 		ui_disp_reserve_setup(uiInfo.remote_time[key]);
 432  00f9 5f            	clrw	x
 433  00fa 7b03          	ld	a,(OFST+1,sp)
 434  00fc 97            	ld	xl,a
 435  00fd d6004d        	ld	a,(_uiInfo+77,x)
 436  0100 cd0000        	call	_ui_disp_reserve_setup
 438  0103               L521:
 439                     ; 79 	return j;
 441  0103 7b01          	ld	a,(OFST-1,sp)
 444  0105 5b03          	addw	sp,#3
 445  0107 81            	ret	
 482                     ; 82 uint8_t		disp_status_loop_remote_J(uint8_t key)
 482                     ; 83 {
 483                     	switch	.text
 484  0108               _disp_status_loop_remote_J:
 486  0108 88            	push	a
 487       00000000      OFST:	set	0
 490                     ; 85 	if (_dsPrev != 0xFE ) {
 492  0109 c60000        	ld	a,__dsPrev
 493  010c a1fe          	cp	a,#254
 494  010e 2713          	jreq	L341
 495                     ; 86 		_dsPrev = 0xFE;
 497  0110 35fe0000      	mov	__dsPrev,#254
 498                     ; 87 		ui_disp_clear_tSetup(1);
 500  0114 a601          	ld	a,#1
 501  0116 cd0000        	call	_ui_disp_clear_tSetup
 503                     ; 88 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 505  0119 7b01          	ld	a,(OFST+1,sp)
 506  011b 5f            	clrw	x
 507  011c 97            	ld	xl,a
 508  011d d60035        	ld	a,(_uiInfo+53,x)
 509  0120 cd0000        	call	_ui_disp_temp_curr
 511  0123               L341:
 512                     ; 91 	return key;
 514  0123 7b01          	ld	a,(OFST+1,sp)
 517  0125 5b01          	addw	sp,#1
 518  0127 81            	ret	
 568                     ; 94 uint8_t		disp_status_loop_remote_B(uint8_t key)
 568                     ; 95 {
 569                     	switch	.text
 570  0128               _disp_status_loop_remote_B:
 572  0128 88            	push	a
 573  0129 89            	pushw	x
 574       00000002      OFST:	set	2
 577                     ; 97 	uint8_t	j = 0;
 579  012a 0f01          	clr	(OFST-1,sp)
 580                     ; 98 	i = uiInfo.remote_banb[key];
 582  012c 5f            	clrw	x
 583  012d 97            	ld	xl,a
 584  012e d60055        	ld	a,(_uiInfo+85,x)
 585  0131 6b02          	ld	(OFST+0,sp),a
 586                     ; 99 	if( uiInfo.enc != 0 )
 588  0133 c60000        	ld	a,_uiInfo
 589  0136 2727          	jreq	L561
 590                     ; 102 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 592  0138 a540          	bcp	a,#64
 593  013a 2604          	jrne	L44
 594  013c a6ff          	ld	a,#255
 595  013e 2002          	jra	L64
 596  0140               L44:
 597  0140 a601          	ld	a,#1
 598  0142               L64:
 599  0142 1b02          	add	a,(OFST+0,sp)
 600                     ; 103 		if( i<=5 )	i = 5;
 602  0144 a106          	cp	a,#6
 603  0146 2402          	jruge	L761
 606  0148 a605          	ld	a,#5
 607  014a               L761:
 608                     ; 104 		if( i>=85 )	i = 85;
 610  014a a155          	cp	a,#85
 611  014c 2502          	jrult	L171
 614  014e a655          	ld	a,#85
 615  0150               L171:
 616  0150 6b02          	ld	(OFST+0,sp),a
 617                     ; 105 		uiInfo.remote_banb[key] = i;
 619  0152 5f            	clrw	x
 620  0153 7b03          	ld	a,(OFST+1,sp)
 621  0155 97            	ld	xl,a
 622  0156 7b02          	ld	a,(OFST+0,sp)
 623  0158 d70055        	ld	(_uiInfo+85,x),a
 624                     ; 106 		j = 1;
 626  015b a601          	ld	a,#1
 627  015d 6b01          	ld	(OFST-1,sp),a
 628  015f               L561:
 629                     ; 108 	if( _dsPrev != i )
 631  015f c60000        	ld	a,__dsPrev
 632  0162 1102          	cp	a,(OFST+0,sp)
 633  0164 270f          	jreq	L371
 634                     ; 110 		_dsPrev = i;
 636  0166 7b02          	ld	a,(OFST+0,sp)
 637  0168 c70000        	ld	__dsPrev,a
 638                     ; 111 		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
 640  016b 5f            	clrw	x
 641  016c 7b03          	ld	a,(OFST+1,sp)
 642  016e 97            	ld	xl,a
 643  016f d60055        	ld	a,(_uiInfo+85,x)
 644  0172 cd0000        	call	_ui_disp_repeat_setup
 646  0175               L371:
 647                     ; 113 	return j;
 649  0175 7b01          	ld	a,(OFST-1,sp)
 652  0177 5b03          	addw	sp,#3
 653  0179 81            	ret	
 710                     ; 116 uint8_t		disp_status_loop_host_N(uint8_t key)
 710                     ; 117 {
 711                     	switch	.text
 712  017a               _disp_status_loop_host_N:
 714  017a 89            	pushw	x
 715       00000002      OFST:	set	2
 718                     ; 119 	uint8_t	j = 0;
 720  017b 0f01          	clr	(OFST-1,sp)
 721                     ; 120 	i = uiInfo.tSetup;
 723  017d c6000e        	ld	a,_uiInfo+14
 724  0180 6b02          	ld	(OFST+0,sp),a
 725                     ; 121 	if( uiInfo.enc != 0 )
 727  0182 c60000        	ld	a,_uiInfo
 728  0185 2726          	jreq	L512
 729                     ; 124 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 731  0187 a540          	bcp	a,#64
 732  0189 2604          	jrne	L45
 733  018b a6ff          	ld	a,#255
 734  018d 2002          	jra	L65
 735  018f               L45:
 736  018f a601          	ld	a,#1
 737  0191               L65:
 738  0191 1b02          	add	a,(OFST+0,sp)
 739                     ; 125 		if( i<=10 )	i = 10;
 741  0193 a10b          	cp	a,#11
 742  0195 2402          	jruge	L712
 745  0197 a60a          	ld	a,#10
 746  0199               L712:
 747                     ; 126 		if( i>=80 )	i = 80;
 749  0199 a150          	cp	a,#80
 750  019b 2502          	jrult	L122
 753  019d a650          	ld	a,#80
 754  019f               L122:
 755  019f 6b02          	ld	(OFST+0,sp),a
 756                     ; 127 		uiInfo.tSetup = i;
 758  01a1 c7000e        	ld	_uiInfo+14,a
 759                     ; 128 		lcd_blink_item(bS6);
 761  01a4 a611          	ld	a,#17
 762  01a6 cd0000        	call	_lcd_blink_item
 764                     ; 129 		j = 1;
 766  01a9 a601          	ld	a,#1
 767  01ab 6b01          	ld	(OFST-1,sp),a
 768  01ad               L512:
 769                     ; 131 	if( _dsPrev != i )
 771  01ad c60000        	ld	a,__dsPrev
 772  01b0 1102          	cp	a,(OFST+0,sp)
 773  01b2 2723          	jreq	L322
 774                     ; 133 		_dsPrev = i;
 776  01b4 7b02          	ld	a,(OFST+0,sp)
 777  01b6 c70000        	ld	__dsPrev,a
 778                     ; 134 		ui_disp_temp_mark(1);
 780  01b9 a601          	ld	a,#1
 781  01bb cd0000        	call	_ui_disp_temp_mark
 783                     ; 135 		ui_disp_temp_setup(uiInfo.tSetup);
 785  01be c6000e        	ld	a,_uiInfo+14
 786  01c1 cd0000        	call	_ui_disp_temp_setup
 788                     ; 136 		ui_disp_temp_curr(uiInfo.tCurr);
 790  01c4 c60002        	ld	a,_uiInfo+2
 791  01c7 cd0000        	call	_ui_disp_temp_curr
 793                     ; 137 		UPDATE_BIT(BIT_TSETUP);
 795  01ca 72140000      	bset	__updateBit,#2
 798  01ce 5500000000    	mov	__updateTimer,___timer1s
 801  01d3 35050000      	mov	__updateCount,#5
 803  01d7               L322:
 804                     ; 139 	return j;
 806  01d7 7b01          	ld	a,(OFST-1,sp)
 809  01d9 85            	popw	x
 810  01da 81            	ret	
 865                     ; 142 uint8_t	disp_status_loop_host_Y(uint8_t key)
 865                     ; 143 {
 866                     	switch	.text
 867  01db               _disp_status_loop_host_Y:
 869  01db 89            	pushw	x
 870       00000002      OFST:	set	2
 873                     ; 145 	uint8_t	j = 0;
 875  01dc 0f01          	clr	(OFST-1,sp)
 876                     ; 146 	i = uiInfo.reserve;
 878  01de c6000d        	ld	a,_uiInfo+13
 879  01e1 6b02          	ld	(OFST+0,sp),a
 880                     ; 147 	if( uiInfo.enc != 0 )
 882  01e3 c60000        	ld	a,_uiInfo
 883  01e6 2726          	jreq	L542
 884                     ; 150 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 886  01e8 a540          	bcp	a,#64
 887  01ea 2604          	jrne	L27
 888  01ec a6ff          	ld	a,#255
 889  01ee 2002          	jra	L47
 890  01f0               L27:
 891  01f0 a601          	ld	a,#1
 892  01f2               L47:
 893  01f2 1b02          	add	a,(OFST+0,sp)
 894                     ; 151 		if( i<=2 )	i = 2;
 896  01f4 a103          	cp	a,#3
 897  01f6 2402          	jruge	L742
 900  01f8 a602          	ld	a,#2
 901  01fa               L742:
 902                     ; 152 		if( i>=48 )	i = 48;
 904  01fa a130          	cp	a,#48
 905  01fc 2502          	jrult	L152
 908  01fe a630          	ld	a,#48
 909  0200               L152:
 910  0200 6b02          	ld	(OFST+0,sp),a
 911                     ; 153 		uiInfo.reserve = i;
 913  0202 c7000d        	ld	_uiInfo+13,a
 914                     ; 154 		lcd_blink_item(bS7);
 916  0205 a621          	ld	a,#33
 917  0207 cd0000        	call	_lcd_blink_item
 919                     ; 155 		j = 1;
 921  020a a601          	ld	a,#1
 922  020c 6b01          	ld	(OFST-1,sp),a
 923  020e               L542:
 924                     ; 157 	if( _dsPrev != i )
 926  020e c60000        	ld	a,__dsPrev
 927  0211 1102          	cp	a,(OFST+0,sp)
 928  0213 2718          	jreq	L352
 929                     ; 159 		_dsPrev = i;
 931  0215 7b02          	ld	a,(OFST+0,sp)
 932  0217 c70000        	ld	__dsPrev,a
 933                     ; 160 		ui_disp_reserve_setup(uiInfo.reserve);
 935  021a c6000d        	ld	a,_uiInfo+13
 936  021d cd0000        	call	_ui_disp_reserve_setup
 938                     ; 161 		UPDATE_BIT(BIT_RESERVE);
 940  0220 72120000      	bset	__updateBit,#1
 943  0224 5500000000    	mov	__updateTimer,___timer1s
 946  0229 35050000      	mov	__updateCount,#5
 948  022d               L352:
 949                     ; 163 	return j;
 951  022d 7b01          	ld	a,(OFST-1,sp)
 954  022f 85            	popw	x
 955  0230 81            	ret	
1010                     ; 166 uint8_t		disp_status_loop_host_B(uint8_t key)
1010                     ; 167 {
1011                     	switch	.text
1012  0231               _disp_status_loop_host_B:
1014  0231 89            	pushw	x
1015       00000002      OFST:	set	2
1018                     ; 169 	uint8_t	j = 0;
1020  0232 0f01          	clr	(OFST-1,sp)
1021                     ; 170 	i = uiInfo.repeat;
1023  0234 c6000c        	ld	a,_uiInfo+12
1024  0237 6b02          	ld	(OFST+0,sp),a
1025                     ; 171 	if( uiInfo.enc != 0 )
1027  0239 c60000        	ld	a,_uiInfo
1028  023c 2726          	jreq	L572
1029                     ; 174 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
1031  023e a540          	bcp	a,#64
1032  0240 2604          	jrne	L401
1033  0242 a6ff          	ld	a,#255
1034  0244 2002          	jra	L601
1035  0246               L401:
1036  0246 a601          	ld	a,#1
1037  0248               L601:
1038  0248 1b02          	add	a,(OFST+0,sp)
1039                     ; 175 		if( i<=5 )	i = 5;
1041  024a a106          	cp	a,#6
1042  024c 2402          	jruge	L772
1045  024e a605          	ld	a,#5
1046  0250               L772:
1047                     ; 176 		if( i>=85 )	i = 85;
1049  0250 a155          	cp	a,#85
1050  0252 2502          	jrult	L103
1053  0254 a655          	ld	a,#85
1054  0256               L103:
1055  0256 6b02          	ld	(OFST+0,sp),a
1056                     ; 177 		uiInfo.repeat = i;
1058  0258 c7000c        	ld	_uiInfo+12,a
1059                     ; 178 		lcd_blink_item(bS8);
1061  025b a631          	ld	a,#49
1062  025d cd0000        	call	_lcd_blink_item
1064                     ; 179 		j = 1;
1066  0260 a601          	ld	a,#1
1067  0262 6b01          	ld	(OFST-1,sp),a
1068  0264               L572:
1069                     ; 181 	if( _dsPrev != i )
1071  0264 c60000        	ld	a,__dsPrev
1072  0267 1102          	cp	a,(OFST+0,sp)
1073  0269 2718          	jreq	L303
1074                     ; 183 		_dsPrev = i;
1076  026b 7b02          	ld	a,(OFST+0,sp)
1077  026d c70000        	ld	__dsPrev,a
1078                     ; 184 		ui_disp_repeat_setup(uiInfo.repeat);
1080  0270 c6000c        	ld	a,_uiInfo+12
1081  0273 cd0000        	call	_ui_disp_repeat_setup
1083                     ; 185 		UPDATE_BIT(BIT_REPEAT);
1085  0276 72100000      	bset	__updateBit,#0
1088  027a 5500000000    	mov	__updateTimer,___timer1s
1091  027f 35050000      	mov	__updateCount,#5
1093  0283               L303:
1094                     ; 187 	return j;
1096  0283 7b01          	ld	a,(OFST-1,sp)
1099  0285 85            	popw	x
1100  0286 81            	ret	
1103                     	switch	.data
1104  0007               __key_blink:
1105  0007 00            	dc.b	0
1155                     ; 193 void	disp_rid_info(void)
1155                     ; 194 {
1156                     	switch	.text
1157  0287               _disp_rid_info:
1159  0287 5203          	subw	sp,#3
1160       00000003      OFST:	set	3
1163                     ; 200 	j = uiInfo.cnt + uiInfo.cnt_sub;
1165                     ; 202 	j = 8;
1167  0289 a608          	ld	a,#8
1168  028b 6b01          	ld	(OFST-2,sp),a
1169                     ; 203 	for( i=1; i<j; i++ )
1171  028d a601          	ld	a,#1
1172  028f 6b03          	ld	(OFST+0,sp),a
1174  0291 2039          	jra	L133
1175  0293               L523:
1176                     ; 205 		if( i >= 8 )
1178  0293 a108          	cp	a,#8
1179  0295 2503          	jrult	L533
1180                     ; 206 			break;
1181  0297               L333:
1182                     ; 214 }
1185  0297 5b03          	addw	sp,#3
1186  0299 81            	ret	
1187  029a               L533:
1188                     ; 207 		if( packet_buf[i] != 10 ){
1190  029a 5f            	clrw	x
1191  029b 97            	ld	xl,a
1192  029c d60000        	ld	a,(_packet_buf,x)
1193  029f a10a          	cp	a,#10
1194  02a1 271b          	jreq	L733
1195                     ; 208 			led = getHexToBin(_rcLED, i);
1197  02a3 7b03          	ld	a,(OFST+0,sp)
1198  02a5 97            	ld	xl,a
1199  02a6 c60000        	ld	a,__rcLED
1200  02a9 95            	ld	xh,a
1201  02aa cd0000        	call	_getHexToBin
1203  02ad 6b02          	ld	(OFST-1,sp),a
1204                     ; 209 			lcd_disp_rid(i + 1, led, 1);
1206  02af 4b01          	push	#1
1207  02b1 7b03          	ld	a,(OFST+0,sp)
1208  02b3 97            	ld	xl,a
1209  02b4 7b04          	ld	a,(OFST+1,sp)
1210  02b6 4c            	inc	a
1211  02b7 95            	ld	xh,a
1212  02b8 cd0000        	call	_lcd_disp_rid
1214  02bb 84            	pop	a
1216  02bc 200a          	jra	L143
1217  02be               L733:
1218                     ; 212 			lcd_clear_rid_n(i+1, 1);
1220  02be ae0001        	ldw	x,#1
1221  02c1 7b03          	ld	a,(OFST+0,sp)
1222  02c3 4c            	inc	a
1223  02c4 95            	ld	xh,a
1224  02c5 cd0000        	call	_lcd_clear_rid_n
1226  02c8               L143:
1227                     ; 203 	for( i=1; i<j; i++ )
1229  02c8 0c03          	inc	(OFST+0,sp)
1230  02ca 7b03          	ld	a,(OFST+0,sp)
1231  02cc               L133:
1234  02cc 1101          	cp	a,(OFST-2,sp)
1235  02ce 25c3          	jrult	L523
1236  02d0 20c5          	jra	L333
1272                     ; 221 void	_disp_status_loop_host_boiler(uint8_t id)
1272                     ; 222 {
1273                     	switch	.text
1274  02d2               __disp_status_loop_host_boiler:
1278                     ; 224 	uiInfo.controlMode = 0;
1280  02d2 725f0009      	clr	_uiInfo+9
1281                     ; 229 	if( id == 0 )
1283  02d6 4d            	tnz	a
1284  02d7 2606          	jrne	L753
1285                     ; 232 		__boiler_shower[6] = _boiler_water_shower;
1287  02d9 550001000e    	mov	___boiler_shower+6,__boiler_water_shower
1290  02de 81            	ret	
1291  02df               L753:
1292                     ; 237 		__boiler_shower[6] = 0;
1294  02df 725f000e      	clr	___boiler_shower+6
1295                     ; 239 }
1298  02e3 81            	ret	
1401                     ; 241 void	disp_status_loop_host(uint8_t key)
1401                     ; 242 {
1402                     	switch	.text
1403  02e4               _disp_status_loop_host:
1405  02e4 88            	push	a
1406  02e5 89            	pushw	x
1407       00000002      OFST:	set	2
1410                     ; 243 	uint8_t	i = 0;
1412  02e6 0f02          	clr	(OFST+0,sp)
1413                     ; 244 	uint8_t	j = 0;
1415                     ; 245 	uint8_t	k = 0;
1417  02e8 0f01          	clr	(OFST-1,sp)
1418                     ; 260 	if (_remote == 0) {
1420  02ea c60004        	ld	a,__remote
1421  02ed 2602          	jrne	L144
1422                     ; 261 		disp_rid_info();
1424  02ef ad96          	call	_disp_rid_info
1426  02f1               L144:
1427                     ; 264 	_disp_temp = 0;
1429  02f1 725f0000      	clr	__disp_temp
1430                     ; 265 	if( __s == 0 )
1432  02f5 c60000        	ld	a,___s
1433  02f8 2703cc04b8    	jrne	L344
1434                     ; 267 		if( _dsCount == 0 )
1436  02fd c60000        	ld	a,__dsCount
1437  0300 2611          	jrne	L544
1438                     ; 269 			_dsCount = 1;
1440  0302 35010000      	mov	__dsCount,#1
1441                     ; 270 			__sUp = 0;
1443  0306 c70000        	ld	___sUp,a
1444                     ; 271 			__sDn = 0xff;
1446  0309 35ff0000      	mov	___sDn,#255
1447                     ; 272 			disp_status_loop_init();
1449  030d cd0000        	call	_disp_status_loop_init
1452  0310 cc08ef        	jra	L326
1453  0313               L544:
1454                     ; 273 		} else if (_dsCount == 9) {
1456  0313 a109          	cp	a,#9
1457  0315 2606          	jrne	L154
1458                     ; 274 			_dsCount = 1;
1460  0317 cd0964        	call	LC026
1462                     ; 276 			disp_status_loop_init();
1463  031a cc08ef        	jra	L326
1464  031d               L154:
1465                     ; 278 		else if( _dsCount == 10 )
1467  031d a10a          	cp	a,#10
1468  031f 2606          	jrne	L554
1469                     ; 280 			_dsCount = 1;
1471  0321 cd0964        	call	LC026
1473                     ; 282 			disp_status_loop_init();
1474  0324 cc08ef        	jra	L326
1475  0327               L554:
1476                     ; 284 		else if( _dsCount == 11 )
1478  0327 a10b          	cp	a,#11
1479  0329 2617          	jrne	L164
1480                     ; 286 			_dsCount = 2;
1482  032b 35020000      	mov	__dsCount,#2
1483                     ; 287 			__sUp = 0xff;
1485  032f 35ff0000      	mov	___sUp,#255
1486                     ; 288 			disp_status_loop_init();
1488  0333 cd0000        	call	_disp_status_loop_init
1490                     ; 289 			disp_status_loop_messageDn(__sDn);
1492  0336 c60000        	ld	a,___sDn
1493  0339 cd0000        	call	_disp_status_loop_messageDn
1495                     ; 290 			disp_status_curr_only();
1497  033c cd0000        	call	_disp_status_curr_only
1500  033f cc08ef        	jra	L326
1501  0342               L164:
1502                     ; 292 		else if( _dsCount == 1 )
1504  0342 a101          	cp	a,#1
1505  0344 2703cc0465    	jrne	L564
1506                     ; 297 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
1508  0349 c60000        	ld	a,___sUp
1509  034c 2607          	jrne	L764
1512  034e 7b03          	ld	a,(OFST+1,sp)
1513  0350 cd017a        	call	_disp_status_loop_host_N
1516  0353 2014          	jp	LC003
1517  0355               L764:
1518                     ; 298 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
1520  0355 a101          	cp	a,#1
1521  0357 2607          	jrne	L374
1524  0359 7b03          	ld	a,(OFST+1,sp)
1525  035b cd01db        	call	_disp_status_loop_host_Y
1528  035e 2009          	jp	LC003
1529  0360               L374:
1530                     ; 299 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
1532  0360 a102          	cp	a,#2
1533  0362 2607          	jrne	L174
1536  0364 7b03          	ld	a,(OFST+1,sp)
1537  0366 cd0231        	call	_disp_status_loop_host_B
1539  0369               LC003:
1540  0369 6b02          	ld	(OFST+0,sp),a
1541  036b               L174:
1542                     ; 301 			if( i==1 )
1544  036b 7b02          	ld	a,(OFST+0,sp)
1545  036d 4a            	dec	a
1546  036e 2604          	jrne	L105
1547                     ; 302 				_key_blink = 1;
1549  0370 4c            	inc	a
1550  0371 c70007        	ld	__key_blink,a
1551  0374               L105:
1552                     ; 305 			_disp_temp = __sUp==0 ? 1 : 0;
1554  0374 c60000        	ld	a,___sUp
1555  0377 2603          	jrne	L651
1556  0379 4c            	inc	a
1557  037a 2001          	jra	L061
1558  037c               L651:
1559  037c 4f            	clr	a
1560  037d               L061:
1561  037d c70000        	ld	__disp_temp,a
1562                     ; 306 			if( _disp_temp == 0 && _key_blink == 0 )
1564  0380 261c          	jrne	L305
1566  0382 c60007        	ld	a,__key_blink
1567  0385 2617          	jrne	L305
1568                     ; 308 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
1570  0387 c60000        	ld	a,___sUp
1571  038a a101          	cp	a,#1
1572  038c 270c          	jreq	L705
1574  038e a102          	cp	a,#2
1575  0390 2708          	jreq	L705
1577  0392 a105          	cp	a,#5
1578  0394 2704          	jreq	L705
1580  0396 a108          	cp	a,#8
1581  0398 2604          	jrne	L305
1582  039a               L705:
1583                     ; 309 					_disp_temp = 1;
1585  039a 35010000      	mov	__disp_temp,#1
1586  039e               L305:
1587                     ; 312 			if( key == 1 )
1589  039e 7b03          	ld	a,(OFST+1,sp)
1590  03a0 a101          	cp	a,#1
1591  03a2 2630          	jrne	L515
1592                     ; 314 				__sUp = (__sUp+1) % 3;
1594  03a4 c60000        	ld	a,___sUp
1595  03a7 5f            	clrw	x
1596  03a8 97            	ld	xl,a
1597  03a9 5c            	incw	x
1598  03aa a603          	ld	a,#3
1599  03ac cd0000        	call	c_smodx
1601  03af 01            	rrwa	x,a
1602  03b0 c70000        	ld	___sUp,a
1603  03b3 cc0440        	jra	L363
1604  03b6               L715:
1605                     ; 317 				else if( __sUp == 1 )	i = bS7;
1607  03b6 4a            	dec	a
1608  03b7 2604          	jrne	L325
1611  03b9 a621          	ld	a,#33
1613  03bb 2002          	jra	L125
1614  03bd               L325:
1615                     ; 318 				else					i = bS8;
1617  03bd a631          	ld	a,#49
1618  03bf               L125:
1619  03bf 6b02          	ld	(OFST+0,sp),a
1620                     ; 319 				lcd_blink_item(i);
1622  03c1 cd0000        	call	_lcd_blink_item
1624                     ; 320 				disp_status_loop_message(__sUp);
1626  03c4 c60000        	ld	a,___sUp
1627  03c7 cd0000        	call	_disp_status_loop_message
1629                     ; 321 				_dsPrev = 0xff;
1631  03ca 35ff0000      	mov	__dsPrev,#255
1632                     ; 323 				_key_blink = 1;
1634  03ce 35010007      	mov	__key_blink,#1
1636  03d2 2040          	jra	L725
1637  03d4               L515:
1638                     ; 325 			else if( key == 2 )
1640  03d4 a102          	cp	a,#2
1641  03d6 261c          	jrne	L135
1642                     ; 327 				__sUp = 0xff;
1644  03d8 35ff0000      	mov	___sUp,#255
1645                     ; 328 				__sDn = 0;
1647  03dc 725f0000      	clr	___sDn
1648                     ; 329 				disp_status_loop_messageDn(__sDn);
1650  03e0 4f            	clr	a
1651  03e1 cd0000        	call	_disp_status_loop_messageDn
1653                     ; 330 				disp_status_curr_only();
1655  03e4 cd0000        	call	_disp_status_curr_only
1657                     ; 331 				lcd_blink_clear();
1659  03e7 cd0000        	call	_lcd_blink_clear
1661                     ; 332 				_dsCount = 2;
1663  03ea 35020000      	mov	__dsCount,#2
1664                     ; 333 				_dsPrev = 0xff;
1666  03ee 35ff0000      	mov	__dsPrev,#255
1667                     ; 335 				_key_blink = 0;
1669  03f2 201c          	jp	LC004
1670  03f4               L135:
1671                     ; 337 			else if( key == 3 )
1673  03f4 a103          	cp	a,#3
1674  03f6 2655          	jrne	L535
1675                     ; 339 				if( __sUp == 0 )
1677  03f8 c60000        	ld	a,___sUp
1678  03fb 2635          	jrne	L735
1679                     ; 341 					if( _key_blink == 0 )
1681  03fd c60007        	ld	a,__key_blink
1682  0400 260b          	jrne	L745
1683  0402 cc0499        	jra	L563
1684  0405               L345:
1685                     ; 347 							__s = 1;
1687  0405 35010000      	mov	___s,#1
1688  0409               L545:
1689                     ; 348 						_dsCount = 0;
1691  0409 725f0000      	clr	__dsCount
1692  040d               L745:
1693                     ; 361 				disp_status_loop_init();
1696  040d cd0000        	call	_disp_status_loop_init
1698                     ; 363 				_key_blink = 0;
1700  0410               LC004:
1703  0410 725f0007      	clr	__key_blink
1705  0414               L725:
1706                     ; 380 			if( _key_blink == 1 )
1708  0414 c60007        	ld	a,__key_blink
1709  0417 4a            	dec	a
1710  0418 2703cc08ef    	jrne	L326
1711                     ; 382 				if( _key_sec >= KEY_BLINK_FADE )
1713  041d c60000        	ld	a,__key_sec
1714  0420 a10a          	cp	a,#10
1715  0422 25f6          	jrult	L326
1716                     ; 385 					lcd_blink_clear();
1718  0424 cd0000        	call	_lcd_blink_clear
1720                     ; 386 					_key_blink = 0;
1722  0427 725f0007      	clr	__key_blink
1723                     ; 387 					_dsCount = 10;
1725  042b 350a0000      	mov	__dsCount,#10
1726  042f cc08ef        	jra	L326
1727  0432               L735:
1728                     ; 351 				else if( __sUp == 1 )	
1730  0432 a101          	cp	a,#1
1731                     ; 353 					if( _key_blink != 1 )
1732                     ; 354 						goto SetupEntry2;
1734  0434 2704          	jreq	LC006
1735                     ; 356 				else if( __sUp == 2 )	
1737  0436 a102          	cp	a,#2
1738  0438 26d3          	jrne	L745
1739                     ; 358 					if( _key_blink != 1 )
1741  043a               LC006:
1743  043a c60007        	ld	a,__key_blink
1744  043d 4a            	dec	a
1745  043e 27cd          	jreq	L745
1746                     ; 359 						goto SetupEntry2;
1747  0440               L363:
1748                     ; 315 SetupEntry2:				
1748                     ; 316 				if( __sUp == 0 )		i = bS6;
1750  0440 c60000        	ld	a,___sUp
1751  0443 2703cc03b6    	jrne	L715
1754  0448 a611          	ld	a,#17
1756  044a cc03bf        	jra	L125
1757  044d               L535:
1758                     ; 365 			else if( key == 4 )
1760  044d a104          	cp	a,#4
1761  044f 26c3          	jrne	L725
1762                     ; 367 				if( _key_blink == 1 )
1764  0451 c60007        	ld	a,__key_blink
1765  0454 4a            	dec	a
1766                     ; 370 					disp_status_loop_init();
1768                     ; 371 					_key_blink = 0;
1770  0455 27b6          	jreq	L745
1771                     ; 375 					__s = 3;
1773  0457 35030000      	mov	___s,#3
1774                     ; 376 					_dsCount = 0;
1776  045b 725f0000      	clr	__dsCount
1777                     ; 377 					_dsPrev = 0xff;
1779  045f 35ff0000      	mov	__dsPrev,#255
1780  0463 20af          	jra	L725
1781  0465               L564:
1782                     ; 391 		else if( _dsCount == 2 )
1784  0465 a102          	cp	a,#2
1785  0467 26c6          	jrne	L326
1786                     ; 393 			_disp_temp = 1;
1788  0469 35010000      	mov	__disp_temp,#1
1789                     ; 394 			if( key == 1 )
1791  046d 7b03          	ld	a,(OFST+1,sp)
1792  046f a101          	cp	a,#1
1793  0471 260a          	jrne	L306
1794                     ; 396 				__sUp = 0;
1796  0473 725f0000      	clr	___sUp
1797                     ; 397 				_dsCount = 0;
1799  0477 725f0000      	clr	__dsCount
1801  047b 202b          	jra	L316
1802  047d               L306:
1803                     ; 399 			else if( key == 2 )
1805  047d a102          	cp	a,#2
1806  047f 2614          	jrne	L706
1807                     ; 401 				__sDn = __sDn==0 ? 1 : 0;
1809  0481 c60000        	ld	a,___sDn
1810  0484 2603          	jrne	L202
1811  0486 4c            	inc	a
1812  0487 2001          	jra	L402
1813  0489               L202:
1814  0489 4f            	clr	a
1815  048a               L402:
1816  048a c70000        	ld	___sDn,a
1817                     ; 402 				disp_status_loop_messageDn(__sDn);
1819  048d cd0000        	call	_disp_status_loop_messageDn
1821                     ; 403 				disp_status_curr_only();
1823  0490 cd0000        	call	_disp_status_curr_only
1826  0493 2013          	jra	L316
1827  0495               L706:
1828                     ; 405 			else if( key == 3 )	{	goto SetupEntry;	}
1830  0495 a103          	cp	a,#3
1831  0497 260f          	jrne	L316
1833  0499               L563:
1834                     ; 343 SetupEntry:				
1834                     ; 344 						if( uiInfo.cntlMode == 0 )
1836  0499 c60003        	ld	a,_uiInfo+3
1837  049c 2703cc0405    	jrne	L345
1838                     ; 345 							__s = 4;
1840  04a1 35040000      	mov	___s,#4
1842  04a5 cc0409        	jra	L545
1843  04a8               L316:
1844                     ; 406 			else if( key == 4 )
1846                     ; 409 			if( uiInfo.enc != 0 )
1848  04a8 c60000        	ld	a,_uiInfo
1849  04ab 2782          	jreq	L326
1850                     ; 411 				__sUp = 0;
1852  04ad 725f0000      	clr	___sUp
1853                     ; 412 				_dsCount = 0;
1855  04b1 725f0000      	clr	__dsCount
1856  04b5 cc08ef        	jra	L326
1857  04b8               L344:
1858                     ; 416 	else if( __s == 2 )
1860  04b8 a102          	cp	a,#2
1861  04ba 2703cc0595    	jrne	L526
1862                     ; 419 		if( _dsCount == 0 )
1864  04bf c60000        	ld	a,__dsCount
1865  04c2 2628          	jrne	L726
1866                     ; 421 			lcd_clear(0);
1868  04c4 cd0000        	call	_lcd_clear
1870                     ; 422 			__sInfo = 1;
1872  04c7 35010000      	mov	___sInfo,#1
1873                     ; 423 			lcd_disp_info(__sInfo, 0, 0);
1875  04cb 4b00          	push	#0
1876  04cd ae0100        	ldw	x,#256
1877  04d0 cd0000        	call	_lcd_disp_info
1879  04d3 84            	pop	a
1880                     ; 424 			UI_DISP_2Digit(_boiler_water_heat);
1882  04d4 c60002        	ld	a,__boiler_water_heat
1883  04d7 cd0936        	call	LC022
1887  04da c60002        	ld	a,__boiler_water_heat
1888  04dd cd092a        	call	LC021
1890                     ; 425 			LCD_BIT_SET(bC2);
1893  04e0 cd0941        	call	LC023
1894                     ; 426 			lcd_disp_info_shower(0x08, 0);
1896  04e3 ae0800        	ldw	x,#2048
1897  04e6 cd096f        	call	LC027
1898                     ; 428 			_dsPrev = 0xff;
1899  04e9 cc08ef        	jra	L326
1900  04ec               L726:
1901                     ; 430 		else if( _dsCount == 1 )
1903  04ec 4a            	dec	a
1904  04ed 26fa          	jrne	L326
1905                     ; 432 			i = _boiler_water_heat;
1907  04ef c60002        	ld	a,__boiler_water_heat
1908  04f2 6b02          	ld	(OFST+0,sp),a
1909                     ; 433 			if( uiInfo.enc != 0 )
1911  04f4 c60000        	ld	a,_uiInfo
1912  04f7 272a          	jreq	L536
1913                     ; 436 				if( (uiInfo.enc & 0x40) == 0 )
1915  04f9 a540          	bcp	a,#64
1916  04fb 2613          	jrne	L736
1917                     ; 438 					if( i==0 )
1919  04fd 7b02          	ld	a,(OFST+0,sp)
1920  04ff 2604          	jrne	L146
1921                     ; 439 						i = 80;
1923  0501 a650          	ld	a,#80
1925  0503 2019          	jp	LC007
1926  0505               L146:
1927                     ; 442 						if( i==40 )
1929  0505 a128          	cp	a,#40
1930  0507 2603          	jrne	L546
1931                     ; 443 							i = 0;
1933  0509               LC008:
1935  0509 4f            	clr	a
1937  050a 2012          	jra	LC007
1938  050c               L546:
1939                     ; 445 							i -= 5;
1941  050c a005          	sub	a,#5
1942  050e 200e          	jp	LC007
1943  0510               L736:
1944                     ; 450 					if( i==0 )
1946  0510 7b02          	ld	a,(OFST+0,sp)
1947  0512 2604          	jrne	L356
1948                     ; 451 						i = 40;
1950  0514 a628          	ld	a,#40
1952  0516 2006          	jp	LC007
1953  0518               L356:
1954                     ; 454 						if( i==80 )
1956  0518 a150          	cp	a,#80
1957                     ; 455 							i = 0;
1959  051a 27ed          	jreq	LC008
1960                     ; 457 							i += 5;
1962  051c ab05          	add	a,#5
1963  051e               LC007:
1964  051e 6b02          	ld	(OFST+0,sp),a
1965                     ; 460 				_boiler_water_heat = i;
1967  0520 c70002        	ld	__boiler_water_heat,a
1968  0523               L536:
1969                     ; 462 			if( _dsPrev != i )
1971  0523 c60000        	ld	a,__dsPrev
1972  0526 1102          	cp	a,(OFST+0,sp)
1973  0528 270d          	jreq	L366
1974                     ; 464 				_dsPrev = i;
1976  052a 7b02          	ld	a,(OFST+0,sp)
1977  052c c70000        	ld	__dsPrev,a
1978                     ; 465 				UI_DISP_2Digit(i);
1980  052f cd0936        	call	LC022
1984  0532 7b02          	ld	a,(OFST+0,sp)
1985  0534 cd092a        	call	LC021
1988  0537               L366:
1989                     ; 468 			if( key == 1 )		{	EXIT_HOST(0);	}
1991  0537 7b03          	ld	a,(OFST+1,sp)
1992  0539 a101          	cp	a,#1
1993  053b 260a          	jrne	L566
1996  053d 725f0000      	clr	___s
1999  0541 725f0000      	clr	__dsCount
2007  0545 2010          	jp	LC010
2008  0547               L566:
2009                     ; 469 			else if( key == 2 )	{	EXIT_HOST3(0);	}
2011  0547 a102          	cp	a,#2
2012  0549 261d          	jrne	L176
2015  054b 725f0000      	clr	___s
2018  054f 725f0000      	clr	___sDn
2021  0553 350b0000      	mov	__dsCount,#11
2029  0557               LC010:
2031  0557 35ff0000      	mov	__dsPrev,#255
2033  055b cd0000        	call	_lcd_blink_clear
2035  055e 4b00          	push	#0
2036  0560 cd0950        	call	LC024
2037  0563 cd0000        	call	_lcd_disp_info
2041  0566 201f          	jp	LC009
2042  0568               L176:
2043                     ; 470 			else if( key == 3 )	{	EXIT_HOST(0);	__s = 4;	}
2045  0568 a103          	cp	a,#3
2046  056a 261c          	jrne	L766
2049  056c 725f0000      	clr	___s
2052  0570 725f0000      	clr	__dsCount
2055  0574 35ff0000      	mov	__dsPrev,#255
2058  0578 cd0000        	call	_lcd_blink_clear
2062  057b 4b00          	push	#0
2063  057d cd0950        	call	LC024
2064  0580 cd0000        	call	_lcd_disp_info
2066  0583 35040000      	mov	___s,#4
2067  0587               LC009:
2068  0587 84            	pop	a
2072  0588               L766:
2073                     ; 471 			if( _key_min == KEY_BOILER_FADE )
2075  0588 c60000        	ld	a,__key_min
2076  058b a10a          	cp	a,#10
2077  058d 2703cc08ef    	jrne	L326
2078                     ; 474 				EXIT_HOST(0);
2086  0592 cc06cd        	jp	LC017
2087  0595               L526:
2088                     ; 478 	else if( __s == 1 )
2090  0595 a101          	cp	a,#1
2091  0597 2703cc06af    	jrne	L307
2092                     ; 481 		if( _dsCount == 0 )
2094  059c c60000        	ld	a,__dsCount
2095  059f 263f          	jrne	L507
2096                     ; 483 			lcd_clear(0);
2098  05a1 cd0000        	call	_lcd_clear
2100                     ; 484 			__sInfo = 2;
2102  05a4 35020000      	mov	___sInfo,#2
2103                     ; 485 			lcd_disp_info(__sInfo, 0, 0);
2105  05a8 4b00          	push	#0
2106  05aa ae0200        	ldw	x,#512
2107  05ad cd0000        	call	_lcd_disp_info
2109  05b0 84            	pop	a
2110                     ; 486 			UI_DISP_2Digit(_boiler_water_shower);
2112  05b1 c60001        	ld	a,__boiler_water_shower
2113  05b4 cd0936        	call	LC022
2117  05b7 c60001        	ld	a,__boiler_water_shower
2118  05ba cd092a        	call	LC021
2120                     ; 487 			LCD_BIT_SET(bC2);
2123  05bd cd0941        	call	LC023
2124                     ; 488 			lcd_disp_info_shower(0x80, 0);
2126  05c0 ae8000        	ldw	x,#32768
2127  05c3 cd096f        	call	LC027
2128                     ; 491 			__boiler_shower[0] = _boiler_water_shower;
2130  05c6 5500010008    	mov	___boiler_shower,__boiler_water_shower
2131                     ; 492 			__boiler_shower[1] = 0xff;
2133  05cb 35ff0009      	mov	___boiler_shower+1,#255
2134                     ; 493 			__boiler_shower[3] = uiInfo.opMode;
2136  05cf 550007000b    	mov	___boiler_shower+3,_uiInfo+7
2137                     ; 494 			__boiler_shower[5] = 1;
2139  05d4 3501000d      	mov	___boiler_shower+5,#1
2140                     ; 495 			__boiler_shower[4] = 0;
2142  05d8 725f000c      	clr	___boiler_shower+4
2143                     ; 496 			_B_CNTL(0)
2145  05dc 4f            	clr	a
2148  05dd cc06a9        	jp	LC018
2149  05e0               L507:
2150                     ; 499 		else if( _dsCount == 1 )
2152  05e0 4a            	dec	a
2153  05e1 26ac          	jrne	L326
2154                     ; 501 			i = _boiler_water_shower;
2156  05e3 c60001        	ld	a,__boiler_water_shower
2157  05e6 6b02          	ld	(OFST+0,sp),a
2158                     ; 502 			if( uiInfo.enc != 0 )
2160  05e8 c60000        	ld	a,_uiInfo
2161  05eb 272c          	jreq	L317
2162                     ; 504 				ENC_MOVE_0(40,70,5);
2164  05ed a540          	bcp	a,#64
2165  05ef 260e          	jrne	L517
2168  05f1 7b02          	ld	a,(OFST+0,sp)
2169  05f3 a129          	cp	a,#41
2170  05f5 2404          	jruge	L717
2173  05f7 a646          	ld	a,#70
2175  05f9 2010          	jra	L327
2176  05fb               L717:
2179  05fb a005          	sub	a,#5
2180  05fd 200c          	jra	L327
2181  05ff               L517:
2184  05ff 7b02          	ld	a,(OFST+0,sp)
2185  0601 a146          	cp	a,#70
2186  0603 2504          	jrult	L527
2189  0605 a628          	ld	a,#40
2191  0607 2002          	jra	L327
2192  0609               L527:
2195  0609 ab05          	add	a,#5
2196  060b               L327:
2197  060b 6b02          	ld	(OFST+0,sp),a
2198                     ; 531 				_boiler_water_shower = i;
2201  060d c70001        	ld	__boiler_water_shower,a
2202                     ; 532 				__boiler_shower[1] = __timer1s;
2204  0610 5500000009    	mov	___boiler_shower+1,___timer1s
2205                     ; 533 				__boiler_shower[2] = 0;
2207  0615 725f000a      	clr	___boiler_shower+2
2208  0619               L317:
2209                     ; 535 			if( _dsPrev != i )
2211  0619 c60000        	ld	a,__dsPrev
2212  061c 1102          	cp	a,(OFST+0,sp)
2213  061e 270d          	jreq	L137
2214                     ; 537 				_dsPrev = i;
2216  0620 7b02          	ld	a,(OFST+0,sp)
2217  0622 c70000        	ld	__dsPrev,a
2218                     ; 538 				UI_DISP_2Digit(i);
2220  0625 cd0936        	call	LC022
2224  0628 7b02          	ld	a,(OFST+0,sp)
2225  062a cd092a        	call	LC021
2228  062d               L137:
2229                     ; 541 			if( __boiler_shower[1] != 0xff )
2231  062d c60009        	ld	a,___boiler_shower+1
2232  0630 a1ff          	cp	a,#255
2233  0632 272a          	jreq	L337
2234                     ; 543 				if( __boiler_shower[1] != __timer1s )
2236  0634 c10000        	cp	a,___timer1s
2237  0637 2725          	jreq	L337
2238                     ; 545 					__boiler_shower[1] = __timer1s;
2240  0639 5500000009    	mov	___boiler_shower+1,___timer1s
2241                     ; 546 					__boiler_shower[2]++;
2243  063e 725c000a      	inc	___boiler_shower+2
2244                     ; 547 					if( __boiler_shower[2] == 4 )
2246  0642 c6000a        	ld	a,___boiler_shower+2
2247  0645 a104          	cp	a,#4
2248  0647 2615          	jrne	L337
2249                     ; 549 						__boiler_shower[1] = 0xff;
2251  0649 35ff0009      	mov	___boiler_shower+1,#255
2252                     ; 550 						if( __boiler_shower[0] != _boiler_water_shower )
2254  064d c60008        	ld	a,___boiler_shower
2255  0650 c10001        	cp	a,__boiler_water_shower
2256  0653 2709          	jreq	L337
2257                     ; 552 							__boiler_shower[0] = _boiler_water_shower;
2259  0655 5500010008    	mov	___boiler_shower,__boiler_water_shower
2260                     ; 553 							_B_CNTL(0)
2262  065a 4f            	clr	a
2263  065b cd02d2        	call	__disp_status_loop_host_boiler
2265  065e               L337:
2266                     ; 558 			if( __boiler_shower[5] == 0x80 )
2268  065e c6000d        	ld	a,___boiler_shower+5
2269  0661 a180          	cp	a,#128
2270  0663 2608          	jrne	L347
2271                     ; 560 				key = 1;
2273  0665 a601          	ld	a,#1
2274  0667 6b03          	ld	(OFST+1,sp),a
2275                     ; 561 				__boiler_shower[5] = 0;
2277  0669 725f000d      	clr	___boiler_shower+5
2278  066d               L347:
2279                     ; 564 			if( key == 1 )		{	_B_CNTL(1) EXIT_HOST(0);	}
2281  066d 7b03          	ld	a,(OFST+1,sp)
2282  066f a101          	cp	a,#1
2283  0671 2607          	jrne	L547
2286  0673 a601          	ld	a,#1
2287  0675 cd02d2        	call	__disp_status_loop_host_boiler
2298  0678 2053          	jp	LC017
2299  067a               L547:
2300                     ; 565 			else if( key == 2 )	{	_B_CNTL(1) EXIT_HOST3(0);	}
2302  067a a102          	cp	a,#2
2303  067c 2613          	jrne	L157
2306  067e a601          	ld	a,#1
2307  0680 cd02d2        	call	__disp_status_loop_host_boiler
2311  0683 725f0000      	clr	___s
2314  0687 725f0000      	clr	___sDn
2317  068b 350b0000      	mov	__dsCount,#11
2325  068f 2044          	jp	LC016
2326  0691               L157:
2327                     ; 566 			else if( key == 3 )	{	
2329  0691 a103          	cp	a,#3
2330  0693 2703cc08ef    	jrne	L326
2331                     ; 567 				__s = 2;
2333  0698 35020000      	mov	___s,#2
2334                     ; 568 				_dsCount = 0;
2336  069c 725f0000      	clr	__dsCount
2337                     ; 569 				lcd_blink_clear();
2339  06a0 cd0000        	call	_lcd_blink_clear
2341                     ; 570 				_key_blink = 0;
2343  06a3 725f0007      	clr	__key_blink
2344                     ; 571 				_B_CNTL(1) 
2346  06a7 a601          	ld	a,#1
2347  06a9               LC018:
2348  06a9 cd02d2        	call	__disp_status_loop_host_boiler
2350  06ac cc08ef        	jra	L326
2351  06af               L307:
2352                     ; 575 	else if( __s == 4 )
2354  06af a104          	cp	a,#4
2355  06b1 2635          	jrne	L167
2356                     ; 577 		disp_backlight(0);
2358  06b3 4f            	clr	a
2359  06b4 cd0000        	call	_disp_backlight
2361                     ; 578 		if( key == 1 || key == 2 || key == 3 || key == 4 )
2363  06b7 7b03          	ld	a,(OFST+1,sp)
2364  06b9 a101          	cp	a,#1
2365  06bb 270c          	jreq	L567
2367  06bd a102          	cp	a,#2
2368  06bf 2708          	jreq	L567
2370  06c1 a103          	cp	a,#3
2371  06c3 2704          	jreq	L567
2373  06c5 a104          	cp	a,#4
2374  06c7 26e3          	jrne	L326
2375  06c9               L567:
2376                     ; 580 			file_update2(0);
2378  06c9 4f            	clr	a
2379  06ca cd0000        	call	_file_update2
2381                     ; 581 			EXIT_HOST(0);
2385  06cd               LC017:
2388  06cd 725f0000      	clr	___s
2391  06d1 725f0000      	clr	__dsCount
2400  06d5               LC016:
2404  06d5 35ff0000      	mov	__dsPrev,#255
2408  06d9 cd0000        	call	_lcd_blink_clear
2412  06dc 4b00          	push	#0
2413  06de cd0950        	call	LC024
2414  06e1 cd0000        	call	_lcd_disp_info
2415  06e4 84            	pop	a
2417  06e5 cc08ef        	jra	L326
2418  06e8               L167:
2419                     ; 584 	else if( __s == 3 )
2421  06e8 a103          	cp	a,#3
2422  06ea 2703cc0896    	jrne	L577
2423                     ; 587 		if( _dsCount == 0 )
2425  06ef c60000        	ld	a,__dsCount
2426  06f2 2654          	jrne	L777
2427                     ; 589 			lcd_clear(0);
2429  06f4 cd0000        	call	_lcd_clear
2431                     ; 590 			ui_disp_temp_mark(1);
2433  06f7 a601          	ld	a,#1
2434  06f9 cd0000        	call	_ui_disp_temp_mark
2436                     ; 591 			_remote = 1;
2438  06fc 35010004      	mov	__remote,#1
2439                     ; 593 			j = uiInfo.cnt + uiInfo.cnt_sub;
2441                     ; 595 			j = 8;
2443  0700 a608          	ld	a,#8
2444  0702 6b02          	ld	(OFST+0,sp),a
2445                     ; 596 			__sRoom = (uiInfo.id_rc + 1) % j;
2447  0704 5f            	clrw	x
2448  0705 c60001        	ld	a,_uiInfo+1
2449  0708 97            	ld	xl,a
2450  0709 5c            	incw	x
2451  070a a608          	ld	a,#8
2452  070c cd0000        	call	c_smodx
2454  070f               L763:
2455  070f cd0958        	call	LC025
2456  0712 2610          	jrne	L1001
2457                     ; 601 				__sRoom = (__sRoom + 1) % j;
2459  0714 cd097b        	call	LC028
2460  0717 5c            	incw	x
2461  0718 7b02          	ld	a,(OFST+0,sp)
2462  071a 905f          	clrw	y
2463  071c 9097          	ld	yl,a
2464  071e cd0000        	call	c_idiv
2466  0721 93            	ldw	x,y
2467                     ; 602 				goto OneMore2;
2469  0722 20eb          	jra	L763
2470  0724               L1001:
2471                     ; 605 			j = __sRoom;
2473                     ; 606 RemoteEntry:
2473                     ; 607 			if( __sRoom == uiInfo.id_rc )
2475  0724 c60000        	ld	a,___sRoom
2476  0727 c10001        	cp	a,_uiInfo+1
2477  072a 2603cc0884    	jreq	L373
2478                     ; 617 			lcd_clear_rid();
2480  072f cd0000        	call	_lcd_clear_rid
2482                     ; 618 			lcd_blink_itemRoom(__sRoom, 1);
2484  0732 ae0001        	ldw	x,#1
2485  0735 c60000        	ld	a,___sRoom
2486  0738 95            	ld	xh,a
2487  0739 cd0000        	call	_lcd_blink_itemRoom
2489                     ; 619 			disp_status_remote_message(REMOTE_MODE); //모드 변경
2491  073c c60000        	ld	a,___sRoom
2492  073f cd0924        	call	LC020
2493  0742 cd0000        	call	_disp_status_remote_message
2495                     ; 620 			_dsCount = 4;
2497  0745 cc0879        	jp	L7011
2498  0748               L777:
2499                     ; 622 		else if( _dsCount == 2 )
2501  0748 a102          	cp	a,#2
2502  074a 261f          	jrne	L7001
2503  074c               L573:
2504                     ; 626 OneMore:			
2504                     ; 627 			j = uiInfo.cnt + uiInfo.cnt_sub;
2506  074c c60005        	ld	a,_uiInfo+5
2507  074f cb0006        	add	a,_uiInfo+6
2508  0752 6b02          	ld	(OFST+0,sp),a
2509                     ; 628 			__sRoom = (__sRoom + 1) % j;
2511  0754 5f            	clrw	x
2512  0755 c60000        	ld	a,___sRoom
2513  0758 97            	ld	xl,a
2514  0759 5c            	incw	x
2515  075a 7b02          	ld	a,(OFST+0,sp)
2516  075c 905f          	clrw	y
2517  075e 9097          	ld	yl,a
2518  0760 cd0000        	call	c_idiv
2520  0763 93            	ldw	x,y
2521  0764 cd0958        	call	LC025
2522  0767 27e3          	jreq	L573
2523                     ; 631 				goto OneMore;
2525                     ; 633 			if( __sRoom != 0 ) {
2527                     ; 635 				j = __sRoom - 1;
2529  0769 20b9          	jra	L1001
2530  076b               L7001:
2531                     ; 639 		else if( _dsCount == 4 )
2533  076b a104          	cp	a,#4
2534  076d 2703cc0831    	jrne	L7101
2535                     ; 641 			j = __sRoom;
2537  0772 c60000        	ld	a,___sRoom
2538  0775 6b02          	ld	(OFST+0,sp),a
2539                     ; 643 			if( REMOTE_MODEi(j) == 0x01 )		{	disp_status_loop_remote_N(j);	}
2541  0777 cd0924        	call	LC020
2542  077a 4a            	dec	a
2543  077b 2607          	jrne	L1201
2546  077d 7b02          	ld	a,(OFST+0,sp)
2547  077f cd0055        	call	_disp_status_loop_remote_N
2550  0782 202e          	jra	L3201
2551  0784               L1201:
2552                     ; 644 			else if( REMOTE_MODEi(j) == 0x08 )	{	disp_status_loop_remote_Y(j);	}
2554  0784 7b02          	ld	a,(OFST+0,sp)
2555  0786 cd0924        	call	LC020
2556  0789 a108          	cp	a,#8
2557  078b 2607          	jrne	L5201
2560  078d 7b02          	ld	a,(OFST+0,sp)
2561  078f cd00b6        	call	_disp_status_loop_remote_Y
2564  0792 201e          	jra	L3201
2565  0794               L5201:
2566                     ; 645 			else if( REMOTE_MODEi(j) == 0x10 )	{	disp_status_loop_remote_B(j);	}
2568  0794 7b02          	ld	a,(OFST+0,sp)
2569  0796 cd0924        	call	LC020
2570  0799 a110          	cp	a,#16
2571  079b 2607          	jrne	L1301
2574  079d 7b02          	ld	a,(OFST+0,sp)
2575  079f cd0128        	call	_disp_status_loop_remote_B
2578  07a2 200e          	jra	L3201
2579  07a4               L1301:
2580                     ; 646 			else if( REMOTE_MODEi(j) == 0x04 )	{	disp_status_loop_remote_J(j);	}
2582  07a4 7b02          	ld	a,(OFST+0,sp)
2583  07a6 cd0924        	call	LC020
2584  07a9 a104          	cp	a,#4
2585  07ab 2605          	jrne	L3201
2588  07ad 7b02          	ld	a,(OFST+0,sp)
2589  07af cd0108        	call	_disp_status_loop_remote_J
2591  07b2               L3201:
2592                     ; 647 			if( key == 1 )	
2594  07b2 7b03          	ld	a,(OFST+1,sp)
2595  07b4 a101          	cp	a,#1
2596  07b6 263b          	jrne	L7301
2597                     ; 651 				if( REMOTE_MODEi(j)==0x01 )		{	REMOTE_MODEi(j) = 0x08;		}
2599  07b8 7b02          	ld	a,(OFST+0,sp)
2600  07ba cd0924        	call	LC020
2601  07bd 4a            	dec	a
2602  07be 2608          	jrne	L1401
2605  07c0 7b02          	ld	a,(OFST+0,sp)
2606  07c2 5f            	clrw	x
2607  07c3 97            	ld	xl,a
2608  07c4 a608          	ld	a,#8
2610  07c6 2046          	jp	L5601
2611  07c8               L1401:
2612                     ; 652 				else if( REMOTE_MODEi(j)==0x08 ){	REMOTE_MODEi(j) = 0x10;		}
2614  07c8 7b02          	ld	a,(OFST+0,sp)
2615  07ca cd0924        	call	LC020
2616  07cd a108          	cp	a,#8
2617  07cf 2608          	jrne	L5401
2620  07d1 7b02          	ld	a,(OFST+0,sp)
2621  07d3 5f            	clrw	x
2622  07d4 97            	ld	xl,a
2623  07d5 a610          	ld	a,#16
2625  07d7 2035          	jp	L5601
2626  07d9               L5401:
2627                     ; 653 				else if( REMOTE_MODEi(j)==0x10 ){	REMOTE_MODEi(j) = 0x01;		}
2629  07d9 7b02          	ld	a,(OFST+0,sp)
2630  07db cd0924        	call	LC020
2631  07de a110          	cp	a,#16
2634  07e0 2709          	jreq	LC012
2635                     ; 654 				else if( REMOTE_MODEi(j)==0x04 ){	REMOTE_MODEi(j) = 0x01;		}
2637  07e2 7b02          	ld	a,(OFST+0,sp)
2638  07e4 cd0924        	call	LC020
2639  07e7 a104          	cp	a,#4
2640  07e9 2626          	jrne	LC013
2643  07eb               LC012:
2645  07eb 7b02          	ld	a,(OFST+0,sp)
2646  07ed 5f            	clrw	x
2647  07ee 97            	ld	xl,a
2648  07ef a601          	ld	a,#1
2649                     ; 655 				disp_status_remote_message(REMOTE_MODE);
2652  07f1 201b          	jp	L5601
2653  07f3               L7301:
2654                     ; 657 			else if( key == 2 )
2656  07f3 a102          	cp	a,#2
2657  07f5 2625          	jrne	L1601
2658                     ; 659 				i = uiInfo.remote_mode[j];
2660  07f7 7b02          	ld	a,(OFST+0,sp)
2661  07f9 cd0924        	call	LC020
2662  07fc 6b02          	ld	(OFST+0,sp),a
2663                     ; 660 				if( i == 0x04 )	{	REMOTE_MODE = 0x01;		}
2665  07fe a104          	cp	a,#4
2666  0800 2607          	jrne	L3601
2669  0802 cd097b        	call	LC028
2670  0805 a601          	ld	a,#1
2672  0807 2005          	jra	L5601
2673  0809               L3601:
2674                     ; 661 				else			{	REMOTE_MODE = 0x04;		}
2676  0809 cd097b        	call	LC028
2677  080c a604          	ld	a,#4
2678  080e               L5601:
2679  080e d70045        	ld	(_uiInfo+69,x),a
2680                     ; 662 				disp_status_remote_message(REMOTE_MODE);
2682  0811               LC013:
2684  0811 c60000        	ld	a,___sRoom
2685  0814 cd0924        	call	LC020
2686  0817 cd0000        	call	_disp_status_remote_message
2689  081a 200c          	jra	L7501
2690  081c               L1601:
2691                     ; 664 			else if( key == 3 )
2693  081c a103          	cp	a,#3
2694  081e 2764          	jreq	L373
2695                     ; 666 				goto RemoteExit;
2697                     ; 668 			else if( key == 4 )	
2699  0820 a104          	cp	a,#4
2700  0822 2604          	jrne	L7501
2701                     ; 670 				_dsCount = 2;
2703  0824 35020000      	mov	__dsCount,#2
2704  0828               L7501:
2705                     ; 672 			if( _key_min == KEY_BLINK_FADE )
2707  0828 c60000        	ld	a,__key_min
2708  082b a10a          	cp	a,#10
2709  082d 264e          	jrne	L5001
2710                     ; 674 				goto RemoteExit;
2712  082f 2053          	jra	L373
2713  0831               L7101:
2714                     ; 677 		else if( _dsCount == 1 )
2716  0831 4a            	dec	a
2717  0832 2649          	jrne	L5001
2718                     ; 679 			j = __sRoom;
2720  0834 c60000        	ld	a,___sRoom
2721  0837 6b02          	ld	(OFST+0,sp),a
2722                     ; 680 			if( REMOTE_MODEi(j) == 0x01 )		
2724  0839 cd0924        	call	LC020
2725  083c 4a            	dec	a
2726  083d 260d          	jrne	L5011
2727                     ; 682 				i = disp_status_loop_remote_N(j);	
2729  083f 7b02          	ld	a,(OFST+0,sp)
2730  0841 cd0055        	call	_disp_status_loop_remote_N
2732                     ; 683 				REMOTE_MODEi(j) = 0x08;
2734  0844 7b02          	ld	a,(OFST+0,sp)
2735  0846 5f            	clrw	x
2736  0847 97            	ld	xl,a
2737  0848 a608          	ld	a,#8
2739  084a 202a          	jp	LC014
2740  084c               L5011:
2741                     ; 685 			else if( REMOTE_MODEi(j) == 0x08 )	
2743  084c 7b02          	ld	a,(OFST+0,sp)
2744  084e cd0924        	call	LC020
2745  0851 a108          	cp	a,#8
2746  0853 260d          	jrne	L1111
2747                     ; 687 				i = disp_status_loop_remote_Y(j);	
2749  0855 7b02          	ld	a,(OFST+0,sp)
2750  0857 cd00b6        	call	_disp_status_loop_remote_Y
2752                     ; 688 				REMOTE_MODEi(j) = 0x10;
2754  085a 7b02          	ld	a,(OFST+0,sp)
2755  085c 5f            	clrw	x
2756  085d 97            	ld	xl,a
2757  085e a610          	ld	a,#16
2759  0860 2014          	jp	LC014
2760  0862               L1111:
2761                     ; 690 			else if( REMOTE_MODEi(j) == 0x10 )	
2763  0862 7b02          	ld	a,(OFST+0,sp)
2764  0864 cd0924        	call	LC020
2765  0867 a110          	cp	a,#16
2766  0869 260e          	jrne	L7011
2767                     ; 692 				i = disp_status_loop_remote_B(j);	
2769  086b 7b02          	ld	a,(OFST+0,sp)
2770  086d cd0128        	call	_disp_status_loop_remote_B
2772                     ; 693 				REMOTE_MODEi(j) = 0x01;
2774  0870 7b02          	ld	a,(OFST+0,sp)
2775  0872 5f            	clrw	x
2776  0873 97            	ld	xl,a
2777  0874 a601          	ld	a,#1
2778  0876               LC014:
2779  0876 d70045        	ld	(_uiInfo+69,x),a
2780  0879               L7011:
2781                     ; 696 			_dsCount = 4;	
2784  0879 35040000      	mov	__dsCount,#4
2785  087d               L5001:
2786                     ; 698 		if( _key_min == KEY_BLINK_FADE )
2788  087d c60000        	ld	a,__key_min
2789  0880 a10a          	cp	a,#10
2790  0882 266b          	jrne	L326
2791                     ; 700 			goto RemoteExit;
2792  0884               L373:
2793                     ; 609 RemoteExit:				
2793                     ; 610 				//	mode change
2793                     ; 611 				_remote = 0;
2795  0884 725f0004      	clr	__remote
2796                     ; 612 				__s = 5;
2798  0888 35050000      	mov	___s,#5
2799                     ; 613 				_dsCount = 0;
2801  088c 725f0000      	clr	__dsCount
2802                     ; 614 				lcd_blink_clear();
2804  0890 cd0000        	call	_lcd_blink_clear
2806                     ; 615 				return;
2808  0893 cc0921        	jra	L1311
2809  0896               L577:
2810                     ; 702 	} else if (__s == 5){
2812  0896 a105          	cp	a,#5
2813  0898 2655          	jrne	L326
2814                     ; 703 		__sUp = 0;
2816  089a 725f0000      	clr	___sUp
2817                     ; 705 		switch (_disp_mode) {
2819  089e c60005        	ld	a,__disp_mode
2821                     ; 710 		case 0x10:	__sUp = 2;	break;
2822  08a1 4a            	dec	a
2823  08a2 2711          	jreq	L773
2824  08a4 4a            	dec	a
2825  08a5 2713          	jreq	L104
2826  08a7 a002          	sub	a,#2
2827  08a9 2715          	jreq	L304
2828  08ab a004          	sub	a,#4
2829  08ad 2717          	jreq	L504
2830  08af a008          	sub	a,#8
2831  08b1 2719          	jreq	L704
2832  08b3 201b          	jra	L7211
2833  08b5               L773:
2834                     ; 706 		case 0x01:	__sUp = 0;	break;
2836  08b5 c70000        	ld	___sUp,a
2839  08b8 2016          	jra	L7211
2840  08ba               L104:
2841                     ; 707 		case 0x02:	__sUp = 3;	break;
2843  08ba 35030000      	mov	___sUp,#3
2846  08be 2010          	jra	L7211
2847  08c0               L304:
2848                     ; 708 		case 0x04:	__sUp = 4;	break;
2850  08c0 35040000      	mov	___sUp,#4
2853  08c4 200a          	jra	L7211
2854  08c6               L504:
2855                     ; 709 		case 0x08:	__sUp = 1;	break;
2857  08c6 35010000      	mov	___sUp,#1
2860  08ca 2004          	jra	L7211
2861  08cc               L704:
2862                     ; 710 		case 0x10:	__sUp = 2;	break;
2864  08cc 35020000      	mov	___sUp,#2
2867  08d0               L7211:
2868                     ; 712 		__sDn = 0xff;
2870  08d0 35ff0000      	mov	___sDn,#255
2871                     ; 713 		disp_status_loop_init();
2873  08d4 cd0000        	call	_disp_status_loop_init
2875                     ; 714 		_dsCount = 1;
2877  08d7 35010000      	mov	__dsCount,#1
2878                     ; 715 		__s = 0;
2880  08db 725f0000      	clr	___s
2881                     ; 716 		_key_blink = 1;
2883  08df 35010007      	mov	__key_blink,#1
2884                     ; 717 		_key_sec = _key_min = _key_hour = 0;
2886  08e3 725f0000      	clr	__key_hour
2887  08e7 725f0000      	clr	__key_min
2888  08eb 725f0000      	clr	__key_sec
2889  08ef               L326:
2890                     ; 721 	if (packet_changed == 1) {
2892  08ef c60000        	ld	a,_packet_changed
2893  08f2 4a            	dec	a
2894  08f3 262c          	jrne	L1311
2895                     ; 722 		__s = 0;
2897  08f5 c70000        	ld	___s,a
2898                     ; 723 		switch (_disp_mode2) {
2900  08f8 c60006        	ld	a,__disp_mode2
2902                     ; 732 				break;
2903  08fb 4a            	dec	a
2904  08fc 2709          	jreq	L114
2905  08fe 4a            	dec	a
2906  08ff 270b          	jreq	L314
2907  0901 a002          	sub	a,#2
2908  0903 2711          	jreq	L514
2909  0905 2016          	jra	L5311
2910  0907               L114:
2911                     ; 724 			case 0x01:	_dsCount = 0;	break;
2913  0907 c70000        	ld	__dsCount,a
2916  090a 2011          	jra	L5311
2917  090c               L314:
2918                     ; 725 			case 0x02:
2918                     ; 726 				_dsCount = 11;
2920  090c 350b0000      	mov	__dsCount,#11
2921                     ; 727 				__sDn = 1;
2923  0910 35010000      	mov	___sDn,#1
2924                     ; 728 				break;
2926  0914 2007          	jra	L5311
2927  0916               L514:
2928                     ; 729 			case 0x04:
2928                     ; 730 				_dsCount = 11;
2930  0916 350b0000      	mov	__dsCount,#11
2931                     ; 731 				__sDn = 0;	
2933  091a c70000        	ld	___sDn,a
2934                     ; 732 				break;
2936  091d               L5311:
2937                     ; 734 		packet_changed = 0;
2939  091d 725f0000      	clr	_packet_changed
2940  0921               L1311:
2941                     ; 736 }
2944  0921 5b03          	addw	sp,#3
2945  0923 81            	ret	
2946  0924               LC020:
2947  0924 5f            	clrw	x
2948  0925 97            	ld	xl,a
2949  0926 d60045        	ld	a,(_uiInfo+69,x)
2950  0929 81            	ret	
2951  092a               LC021:
2952  092a 5f            	clrw	x
2953  092b 97            	ld	xl,a
2954  092c a60a          	ld	a,#10
2955  092e 62            	div	x,a
2956  092f 97            	ld	xl,a
2957  0930 a603          	ld	a,#3
2958  0932 95            	ld	xh,a
2959  0933 cc0000        	jp	_lcd_disp_n
2960  0936               LC022:
2961  0936 5f            	clrw	x
2962  0937 97            	ld	xl,a
2963  0938 a60a          	ld	a,#10
2964  093a 62            	div	x,a
2965  093b a602          	ld	a,#2
2966  093d 95            	ld	xh,a
2967  093e cc0000        	jp	_lcd_disp_n
2968  0941               LC023:
2969  0941 c6001b        	ld	a,_iLF_DEF+27
2970  0944 5f            	clrw	x
2971  0945 97            	ld	xl,a
2972  0946 d6540c        	ld	a,(21516,x)
2973  0949 ca001b        	or	a,_bLF_DEF+27
2974  094c d7540c        	ld	(21516,x),a
2975  094f 81            	ret	
2976  0950               LC024:
2977  0950 ae0001        	ldw	x,#1
2978  0953 c60000        	ld	a,___sInfo
2979  0956 95            	ld	xh,a
2980  0957 81            	ret	
2981  0958               LC025:
2982  0958 01            	rrwa	x,a
2983  0959 c70000        	ld	___sRoom,a
2984                     ; 598 OneMore2:			
2984                     ; 599 			if( packet_buf[__sRoom] == 10 )
2986  095c 5f            	clrw	x
2987  095d 97            	ld	xl,a
2988  095e d60000        	ld	a,(_packet_buf,x)
2989  0961 a10a          	cp	a,#10
2990  0963 81            	ret	
2991  0964               LC026:
2992  0964 35010000      	mov	__dsCount,#1
2993                     ; 281 			__sDn = 0xff;
2995  0968 35ff0000      	mov	___sDn,#255
2996                     ; 282 			disp_status_loop_init();
2998  096c cc0000        	jp	_disp_status_loop_init
2999  096f               LC027:
3000  096f cd0000        	call	_lcd_disp_info_shower
3002                     ; 489 			_dsCount = 1;
3004  0972 35010000      	mov	__dsCount,#1
3005                     ; 490 			_dsPrev = 0xff;
3007  0976 35ff0000      	mov	__dsPrev,#255
3008  097a 81            	ret	
3009  097b               LC028:
3010  097b c60000        	ld	a,___sRoom
3011  097e 5f            	clrw	x
3012  097f 97            	ld	xl,a
3013  0980 81            	ret	
3105                     	xdef	_disp_rid_info
3106                     	xref	_packet_buf
3107                     	xdef	_disp_status_loop_remote_B
3108                     	xdef	_disp_status_loop_remote_J
3109                     	xdef	_disp_status_loop_remote_Y
3110                     	xdef	_disp_status_loop_remote_N
3111                     	xdef	_disp_status_remote_message
3112                     	xref	_packet_changed
3113                     	xref	_getHexToBin
3114                     	xref	__rcLED
3115                     	xref	__disp_temp
3116                     	switch	.bss
3117  0000               __remote_buf:
3118  0000 000000000000  	ds.b	8
3119                     	xdef	__remote_buf
3120                     	xdef	__remote
3121                     	xdef	__boiler_fire
3122                     	xdef	__boiler_type
3123                     	xdef	__boiler_water_heat
3124                     	xdef	__boiler_water_shower
3125  0008               ___boiler_shower:
3126  0008 000000000000  	ds.b	7
3127                     	xdef	___boiler_shower
3128                     	xdef	__disp_status_loop_host_boiler
3129                     	xref	_disp_backlight
3130                     	xref	_file_update2
3131                     	xref	__updateCount
3132                     	xref	__updateBit
3133                     	xref	__updateTimer
3134                     	xdef	__key_blink
3135                     	xref	__key_hour
3136                     	xref	__key_min
3137                     	xref	__key_sec
3138                     	xdef	__disp_mode2
3139                     	xdef	__disp_mode
3140                     	xref	_disp_status_curr_only
3141                     	xref	_disp_status_loop_init
3142                     	xdef	_disp_status_loop_host_B
3143                     	xdef	_disp_status_loop_host_Y
3144                     	xdef	_disp_status_loop_host_N
3145                     	xref	_disp_status_loop_messageDn
3146                     	xref	_disp_status_loop_message
3147                     	xref	__dsPrev
3148                     	xref	__dsCount
3149                     	xdef	_disp_status_loop_host
3150                     	xref	___sRoom
3151                     	xref	___sInfo
3152                     	xref	___sDn
3153                     	xref	___sUp
3154                     	xref	___s
3155                     	xref	_lcd_disp_info
3156                     	xref	_lcd_disp_info_shower
3157                     	xref	_ui_disp_reserve_setup
3158                     	xref	_ui_disp_repeat_setup
3159                     	xref	_ui_disp_clear_tSetup
3160                     	xref	_ui_disp_temp_mark
3161                     	xref	_ui_disp_temp_curr
3162                     	xref	_ui_disp_temp_setup
3163                     	xref	_lcd_clear_rid_n
3164                     	xref	_lcd_blink_itemRoom
3165                     	xref	_lcd_blink_item
3166                     	xref	_lcd_blink_clear
3167                     	xref	_lcd_disp_rid
3168                     	xref	_lcd_disp_n
3169                     	xref	_lcd_clear
3170                     	xref	_lcd_clear_rid
3171                     	xref	_lcd_clear_btn
3172                     	xref	_iLF_DEF
3173                     	xref	_bLF_DEF
3174                     	xref	_uiInfo
3175                     	xref	___timer1s
3176                     	xref.b	c_x
3196                     	xref	c_idiv
3197                     	xref	c_smodx
3198                     	end
