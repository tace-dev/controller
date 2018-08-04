   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               _currTemp:
  23  0000 00            	dc.b	0
  24  0001               _ui_error:
  25  0001 00            	dc.b	0
  26  0002               _ui_error_type:
  27  0002 00            	dc.b	0
  28  0003               _rc_type:
  29  0003 00            	dc.b	0
  59                     ; 42 uint8_t	getCurrTemp(void)
  59                     ; 43 {
  61                     	switch	.text
  62  0000               _getCurrTemp:
  66                     ; 44 	return currTemp;
  68  0000 c60000        	ld	a,_currTemp
  71  0003 81            	ret	
 103                     ; 47 uint8_t	_msgLoop(uint8_t mode)
 103                     ; 48 {
 104                     	switch	.text
 105  0004               __msgLoop:
 109                     ; 49 	return 0;
 111  0004 4f            	clr	a
 114  0005 81            	ret	
 146                     ; 52 uint8_t _call_ptc_woodang(void) {
 147                     	switch	.text
 148  0006               __call_ptc_woodang:
 152                     ; 53 	rc_ptc_check(iouart_getReadBuffer());
 154  0006 cd0000        	call	_iouart_getReadBuffer
 156  0009 cd0000        	call	_rc_ptc_check
 158                     ; 55 	switch (getState_check()) {
 160  000c cd0000        	call	_getState_check
 163                     ; 59 	case RC_STATE_FACTORY:	return 3;
 164  000f 4a            	dec	a
 165  0010 270c          	jreq	L53
 166  0012 4a            	dec	a
 167  0013 2711          	jreq	L73
 168  0015 a003          	sub	a,#3
 169  0017 271d          	jreq	L34
 170  0019 4a            	dec	a
 171  001a 2712          	jreq	L14
 172  001c 201b          	jra	L75
 173  001e               L53:
 174                     ; 56 	case RC_STATE_NORMAL:	rc_ptc_make(iouart_getBuffer());	break;
 176  001e cd0000        	call	_iouart_getBuffer
 178  0021 cd0000        	call	_rc_ptc_make
 182  0024 2013          	jra	L75
 183  0026               L73:
 184                     ; 57 	case RC_STATE_SETTING:	rc_ptc_make_setting(iouart_getBuffer());break;
 186  0026 cd0000        	call	_iouart_getBuffer
 188  0029 cd0000        	call	_rc_ptc_make_setting
 192  002c 200b          	jra	L75
 193  002e               L14:
 194                     ; 58 	case RC_STATE_MIRROR:	rc_ptc_make_mirror(iouart_getBuffer());	break;
 196  002e cd0000        	call	_iouart_getBuffer
 198  0031 cd0000        	call	_rc_ptc_make_mirror
 202  0034 2003          	jra	L75
 203  0036               L34:
 204                     ; 59 	case RC_STATE_FACTORY:	return 3;
 206  0036 a603          	ld	a,#3
 209  0038 81            	ret	
 210  0039               L75:
 211                     ; 62 	iouart_Set_Packet(60);
 213  0039 a63c          	ld	a,#60
 214  003b cd0000        	call	_iouart_Set_Packet
 216                     ; 63 	iouart_Pkt_Start();
 218  003e cd0000        	call	_iouart_Pkt_Start
 220                     ; 64 	return 0;
 222  0041 4f            	clr	a
 225  0042 81            	ret	
 255                     ; 67 uint8_t _call_ptc_lse(void) {
 256                     	switch	.text
 257  0043               __call_ptc_lse:
 261                     ; 68 	rc_lse_ptc_check(iouart_getReadBuffer());
 263  0043 cd0000        	call	_iouart_getReadBuffer
 265  0046 cd0000        	call	_rc_lse_ptc_check
 267                     ; 70 	switch (getLSEState_check()) {
 269  0049 cd0000        	call	_getLSEState_check
 271  004c 4a            	dec	a
 272  004d 260e          	jrne	L57
 275                     ; 71 		case RC_LSE_STATE_NORMAL:
 275                     ; 72 			rc_lse_ptc_make(iouart_getBuffer());
 277  004f cd0000        	call	_iouart_getBuffer
 279  0052 cd0000        	call	_rc_lse_ptc_make
 281                     ; 73 			iouart_Set_Packet(60);
 283  0055 a63c          	ld	a,#60
 284  0057 cd0000        	call	_iouart_Set_Packet
 286                     ; 74 			iouart_Pkt_Start();
 288  005a cd0000        	call	_iouart_Pkt_Start
 290                     ; 75 			break;
 292  005d               L57:
 293                     ; 78 	return 0;
 295  005d 4f            	clr	a
 298  005e 81            	ret	
 347                     ; 81 uint8_t	_iouartLoop(void)
 347                     ; 82 {
 348                     	switch	.text
 349  005f               __iouartLoop:
 351  005f 5203          	subw	sp,#3
 352       00000003      OFST:	set	3
 355                     ; 83 	uint8_t	i = 0;
 358  0061 2043          	jra	L121
 359  0063               L711:
 360                     ; 88 		i = iouart_Ready();
 362  0063 cd0000        	call	_iouart_Ready
 364  0066 6b03          	ld	(OFST+0,sp),a
 365                     ; 89 		if( i != 0 )
 367  0068 2705          	jreq	L521
 368                     ; 91 			p = iouart_getReadBuffer();
 370  006a cd0000        	call	_iouart_getReadBuffer
 372  006d 7b03          	ld	a,(OFST+0,sp)
 373  006f               L521:
 374                     ; 98 		if( i == 2 )	DISP("e", 1);
 376  006f a102          	cp	a,#2
 377  0071 260b          	jrne	L721
 380  0073 4b01          	push	#1
 381  0075 ae0000        	ldw	x,#L131
 382  0078 cd0000        	call	_uart1_tx_put
 384  007b 84            	pop	a
 385  007c 7b03          	ld	a,(OFST+0,sp)
 386  007e               L721:
 387                     ; 99 		if( i == 1 )
 389  007e 4a            	dec	a
 390  007f 2625          	jrne	L121
 391                     ; 102 			p = iouart_getReadBuffer();
 393  0081 cd0000        	call	_iouart_getReadBuffer
 395  0084 1f01          	ldw	(OFST-2,sp),x
 396                     ; 105 			if ((p[0] & 0xF0) == 0xF0) {
 398  0086 f6            	ld	a,(x)
 399  0087 a4f0          	and	a,#240
 400  0089 a1f0          	cp	a,#240
 401  008b 260c          	jrne	L531
 402                     ; 106 				i = p[0] & 0x0F;
 404  008d f6            	ld	a,(x)
 405  008e a40f          	and	a,#15
 406  0090 6b03          	ld	(OFST+0,sp),a
 407                     ; 108 				packet_buf[i - 1] = 0;
 409  0092 5f            	clrw	x
 410  0093 97            	ld	xl,a
 411  0094 5a            	decw	x
 412  0095 724f0000      	clr	(_packet_buf,x)
 413  0099               L531:
 414                     ; 111 			i = _call_ptc_woodang();
 416  0099 cd0006        	call	__call_ptc_woodang
 418  009c 6b03          	ld	(OFST+0,sp),a
 419                     ; 112 			if( i == 3 )
 421  009e a103          	cp	a,#3
 422  00a0 2604          	jrne	L121
 423                     ; 113 				return 3;
 425  00a2 a603          	ld	a,#3
 427  00a4 2009          	jra	L47
 428  00a6               L121:
 429                     ; 86 	while( _io_head != _io_tail )
 431  00a6 c60000        	ld	a,__io_head
 432  00a9 c10000        	cp	a,__io_tail
 433  00ac 26b5          	jrne	L711
 434                     ; 151 	return 0;
 436  00ae 4f            	clr	a
 438  00af               L47:
 440  00af 5b03          	addw	sp,#3
 441  00b1 81            	ret	
 485                     ; 159 void	disp_key(uint8_t k)
 485                     ; 160 {
 486                     	switch	.text
 487  00b2               _disp_key:
 489  00b2 88            	push	a
 490  00b3 5205          	subw	sp,#5
 491       00000005      OFST:	set	5
 494                     ; 162 	buf[0] = '<';
 496  00b5 a63c          	ld	a,#60
 497  00b7 6b01          	ld	(OFST-4,sp),a
 498                     ; 163 	buf[2] = ':';
 500  00b9 a63a          	ld	a,#58
 501  00bb 6b03          	ld	(OFST-2,sp),a
 502                     ; 164 	buf[3] = '0' + _key_continue;
 504  00bd c60000        	ld	a,__key_continue
 505  00c0 ab30          	add	a,#48
 506  00c2 6b04          	ld	(OFST-1,sp),a
 507                     ; 165 	buf[4] = '>';
 509  00c4 a63e          	ld	a,#62
 510  00c6 6b05          	ld	(OFST+0,sp),a
 511                     ; 166 	if( k == 4 )		buf[1] = '4';
 513  00c8 7b06          	ld	a,(OFST+1,sp)
 514  00ca a104          	cp	a,#4
 515  00cc 2604          	jrne	L161
 518  00ce a634          	ld	a,#52
 520  00d0 2015          	jp	LC001
 521  00d2               L161:
 522                     ; 167 	else if( k == 3 )	buf[1] = '3';
 524  00d2 a103          	cp	a,#3
 525  00d4 2604          	jrne	L561
 528  00d6 a633          	ld	a,#51
 530  00d8 200d          	jp	LC001
 531  00da               L561:
 532                     ; 168 	else if( k == 2 )	buf[1] = '2';
 534  00da a102          	cp	a,#2
 535  00dc 2604          	jrne	L171
 538  00de a632          	ld	a,#50
 540  00e0 2005          	jp	LC001
 541  00e2               L171:
 542                     ; 169 	else if( k == 1 )	buf[1] = '1';
 544  00e2 4a            	dec	a
 545  00e3 2606          	jrne	L571
 548  00e5 a631          	ld	a,#49
 549  00e7               LC001:
 550  00e7 6b02          	ld	(OFST-3,sp),a
 552  00e9 2004          	jra	L361
 553  00eb               L571:
 554                     ; 171 		buf[2] = '?';
 556  00eb a63f          	ld	a,#63
 557  00ed 6b03          	ld	(OFST-2,sp),a
 558  00ef               L361:
 559                     ; 172 	DISP(buf, 5);
 561  00ef 4b05          	push	#5
 562  00f1 96            	ldw	x,sp
 563  00f2 1c0002        	addw	x,#OFST-3
 564  00f5 cd0000        	call	_uart1_tx_put
 566  00f8 84            	pop	a
 567                     ; 173 }
 570  00f9 5b06          	addw	sp,#6
 571  00fb 81            	ret	
 621                     ; 175 void	disp_enc(uint8_t enc)
 621                     ; 176 {
 622                     	switch	.text
 623  00fc               _disp_enc:
 625  00fc 88            	push	a
 626  00fd 5204          	subw	sp,#4
 627       00000004      OFST:	set	4
 630                     ; 179 	if( (enc & 0x40) != 0 )
 632  00ff a540          	bcp	a,#64
 633  0101 2704          	jreq	L322
 634                     ; 180 		buf[0] = '+';
 636  0103 a62b          	ld	a,#43
 638  0105 2002          	jra	L522
 639  0107               L322:
 640                     ; 182 		buf[0] = '-';
 642  0107 a62d          	ld	a,#45
 643  0109               L522:
 644  0109 6b02          	ld	(OFST-2,sp),a
 645                     ; 184 	i = enc&0x0f;
 647  010b 7b05          	ld	a,(OFST+1,sp)
 648  010d a40f          	and	a,#15
 649  010f 6b01          	ld	(OFST-3,sp),a
 650                     ; 185 	buf[1] = '0' + i/10;
 652  0111 5f            	clrw	x
 653  0112 97            	ld	xl,a
 654  0113 a60a          	ld	a,#10
 655  0115 62            	div	x,a
 656  0116 9f            	ld	a,xl
 657  0117 ab30          	add	a,#48
 658  0119 6b03          	ld	(OFST-1,sp),a
 659                     ; 186 	buf[2] = '0' + i%10;
 661  011b 5f            	clrw	x
 662  011c 7b01          	ld	a,(OFST-3,sp)
 663  011e 97            	ld	xl,a
 664  011f a60a          	ld	a,#10
 665  0121 62            	div	x,a
 666  0122 ab30          	add	a,#48
 667  0124 6b04          	ld	(OFST+0,sp),a
 668                     ; 187 	DISP(buf, 3);
 670  0126 4b03          	push	#3
 671  0128 96            	ldw	x,sp
 672  0129 1c0003        	addw	x,#OFST-1
 673  012c cd0000        	call	_uart1_tx_put
 675  012f 84            	pop	a
 676                     ; 188 }
 679  0130 5b05          	addw	sp,#5
 680  0132 81            	ret	
 712                     ; 190 void	disp_adc(uint8_t i)
 712                     ; 191 {
 713                     	switch	.text
 714  0133               _disp_adc:
 718                     ; 201 }
 721  0133 81            	ret	
 771                     ; 288 void	deviceCb(void)
 771                     ; 289 {
 772                     	switch	.text
 773  0134               _deviceCb:
 775  0134 89            	pushw	x
 776       00000002      OFST:	set	2
 779                     ; 291 	uint8_t	lcd = 0;
 781  0135 0f01          	clr	(OFST-1,sp)
 782                     ; 293 	uiInfo.enc = 0;
 784  0137 725f0000      	clr	_uiInfo
 785                     ; 294 	key = key_ready();
 787  013b cd0000        	call	_key_ready
 789  013e 6b02          	ld	(OFST+0,sp),a
 790                     ; 295 	if( key != 0 && key < 0x80 )
 792  0140 270f          	jreq	L162
 794  0142 a180          	cp	a,#128
 795  0144 240b          	jruge	L162
 796                     ; 297 		lcd = 1;
 798  0146 a601          	ld	a,#1
 799  0148 6b01          	ld	(OFST-1,sp),a
 800                     ; 298 		disp_key(key);
 802  014a 7b02          	ld	a,(OFST+0,sp)
 803  014c cd00b2        	call	_disp_key
 806  014f 2011          	jra	L362
 807  0151               L162:
 808                     ; 302 		if( (key & 0x80) != 0 )
 810  0151 a580          	bcp	a,#128
 811  0153 270d          	jreq	L362
 812                     ; 304 			lcd = 1;
 814  0155 a601          	ld	a,#1
 815  0157 6b01          	ld	(OFST-1,sp),a
 816                     ; 305 			disp_enc(key);
 818  0159 7b02          	ld	a,(OFST+0,sp)
 819  015b ad9f          	call	_disp_enc
 821                     ; 306 			uiInfo.enc = key;
 823  015d 7b02          	ld	a,(OFST+0,sp)
 824  015f c70000        	ld	_uiInfo,a
 825  0162               L362:
 826                     ; 309 	if( key == 3 && _key_continue == 1 )
 828  0162 7b02          	ld	a,(OFST+0,sp)
 829  0164 a103          	cp	a,#3
 830  0166 260e          	jrne	L762
 832  0168 c60000        	ld	a,__key_continue
 833  016b 4a            	dec	a
 834  016c 2608          	jrne	L762
 835                     ; 312 		key = 0x88;
 837  016e a688          	ld	a,#136
 838  0170 6b02          	ld	(OFST+0,sp),a
 839                     ; 313 		_key_code = 0xff;
 841  0172 35ff0000      	mov	__key_code,#255
 842  0176               L762:
 843                     ; 315 	if( key == 2 && _key_continue == 2 )
 845  0176 7b02          	ld	a,(OFST+0,sp)
 846  0178 a102          	cp	a,#2
 847  017a 260f          	jrne	L172
 849  017c c60000        	ld	a,__key_continue
 850  017f a102          	cp	a,#2
 851  0181 2608          	jrne	L172
 852                     ; 318 		key = 0x89;
 854  0183 a689          	ld	a,#137
 855  0185 6b02          	ld	(OFST+0,sp),a
 856                     ; 319 		_key_code = 0xff;
 858  0187 35ff0000      	mov	__key_code,#255
 859  018b               L172:
 860                     ; 321 	disp_status(key);
 862  018b 7b02          	ld	a,(OFST+0,sp)
 863  018d cd0000        	call	_disp_status
 865                     ; 324 	if( _backlight == 1 )
 867  0190 c60000        	ld	a,__backlight
 868  0193 4a            	dec	a
 869  0194 264c          	jrne	L372
 870                     ; 326 		_backup_backlight2 = 24;
 872  0196 35180000      	mov	__backup_backlight2,#24
 873                     ; 327 		if( lcd == 1 )
 875  019a 7b01          	ld	a,(OFST-1,sp)
 876  019c 4a            	dec	a
 877  019d 2618          	jrne	L572
 878                     ; 330 			if( _lcdTimer[1] != 0 )
 880  019f c60001        	ld	a,__lcdTimer+1
 881  01a2 2704          	jreq	L772
 882                     ; 333 				D_IO_HIGH(D_BL_PORT, D_BL_PIN);
 884  01a4 721c5014      	bset	20500,#6
 885  01a8               L772:
 886                     ; 335 			_lcdTimer[0] = 0;
 888  01a8 725f0000      	clr	__lcdTimer
 889                     ; 336 			_lcdTimer[1] = 0;
 891  01ac 725f0001      	clr	__lcdTimer+1
 892                     ; 337 			_lcdTimer[2] = __timer1s;
 894  01b0 5500000002    	mov	__lcdTimer+2,___timer1s
 896  01b5 202f          	jra	L113
 897  01b7               L572:
 898                     ; 341 			if( _lcdTimer[2] != __timer1s )
 900  01b7 c60002        	ld	a,__lcdTimer+2
 901  01ba c10000        	cp	a,___timer1s
 902  01bd 2727          	jreq	L113
 903                     ; 343 				_lcdTimer[2] = __timer1s;
 905  01bf 5500000002    	mov	__lcdTimer+2,___timer1s
 906                     ; 344 				_lcdTimer[0]++;
 908  01c4 725c0000      	inc	__lcdTimer
 909                     ; 345 				if( _lcdTimer[0] >= 10 )
 911  01c8 c60000        	ld	a,__lcdTimer
 912  01cb a10a          	cp	a,#10
 913  01cd 2517          	jrult	L113
 914                     ; 347 					if( _lcdTimer[1] == 0 )
 916  01cf c60001        	ld	a,__lcdTimer+1
 917  01d2 2608          	jrne	L703
 918                     ; 350 						_lcdTimer[1] = 2;
 920  01d4 35020001      	mov	__lcdTimer+1,#2
 921                     ; 351 						D_IO_LOW(D_BL_PORT, D_BL_PIN);
 923  01d8 721d5014      	bres	20500,#6
 924  01dc               L703:
 925                     ; 353 					_lcdTimer[0] = 0;
 927  01dc 725f0000      	clr	__lcdTimer
 928  01e0 2004          	jra	L113
 929  01e2               L372:
 930                     ; 359 		_backup_backlight2 = 0;
 932  01e2 725f0000      	clr	__backup_backlight2
 933  01e6               L113:
 934                     ; 455 }
 937  01e6 85            	popw	x
 938  01e7 81            	ret	
 973                     ; 459 void	device_adc(void)
 973                     ; 460 {
 974                     	switch	.text
 975  01e8               _device_adc:
 977  01e8 88            	push	a
 978       00000001      OFST:	set	1
 981                     ; 462 	i = adcGet(0);
 983  01e9 4f            	clr	a
 984  01ea cd0000        	call	_adcGet
 986                     ; 465 	if( i >= WOODANG_TOFFSET )
 988  01ed a104          	cp	a,#4
 989  01ef 2502          	jrult	L723
 990                     ; 467 		i -= WOODANG_TOFFSET;
 992  01f1 a004          	sub	a,#4
 993  01f3               L723:
 994  01f3 6b01          	ld	(OFST+0,sp),a
 995                     ; 469 	if( i != currTemp )
 997  01f5 c10000        	cp	a,_currTemp
 998  01f8 2706          	jreq	L133
 999                     ; 471 		currTemp = i;
1001  01fa c70000        	ld	_currTemp,a
1002                     ; 472 		disp_adc(i);
1004  01fd cd0133        	call	_disp_adc
1006  0200               L133:
1007                     ; 474 }
1010  0200 84            	pop	a
1011  0201 81            	ret	
1014                     	switch	.data
1015  0004               ___tim30min_reset:
1016  0004 00            	dc.b	0
1040                     ; 483 uint8_t timerEventClear(void) {
1041                     	switch	.text
1042  0202               _timerEventClear:
1046                     ; 484 	__timer1sa = 0;
1048  0202 725f0000      	clr	___timer1sa
1049                     ; 485 	__timer1min = 0;
1051  0206 725f0000      	clr	___timer1min
1052                     ; 486 	__timer1h = 0 ;
1054  020a 725f0000      	clr	___timer1h
1055                     ; 487 }
1058  020e 81            	ret	
1091                     ; 489 void	timerEvent(void)
1091                     ; 490 {
1092                     	switch	.text
1093  020f               _timerEvent:
1095       00000002      OFST:	set	2
1098                     ; 491 	_tim1min++;
1100  020f 725c0000      	inc	__tim1min
1101  0213 89            	pushw	x
1102                     ; 492 	if( (_tim1min%30) == 0 )
1104  0214 c60000        	ld	a,__tim1min
1105  0217 5f            	clrw	x
1106  0218 97            	ld	xl,a
1107  0219 a61e          	ld	a,#30
1108  021b cd0000        	call	c_smodx
1110  021e 5d            	tnzw	x
1111  021f 2615          	jrne	L353
1112                     ; 494 		if( _tim30min != 0xff )
1114  0221 c60000        	ld	a,__tim30min
1115  0224 4c            	inc	a
1116  0225 2713          	jreq	L163
1117                     ; 496 			if( __tim30min_reset == 0 )
1119  0227 c60004        	ld	a,___tim30min_reset
1120  022a 260e          	jrne	L163
1121                     ; 498 				__tim30min_reset = 1;
1123  022c 35010004      	mov	___tim30min_reset,#1
1124                     ; 499 				_tim30min++;
1126  0230 725c0000      	inc	__tim30min
1127  0234 2004          	jra	L163
1128  0236               L353:
1129                     ; 504 		__tim30min_reset = 0;
1131  0236 725f0004      	clr	___tim30min_reset
1132  023a               L163:
1133                     ; 506 	if( __boiler_shower[5] == 1 )
1135  023a c60005        	ld	a,___boiler_shower+5
1136  023d 4a            	dec	a
1137  023e 260f          	jrne	L363
1138                     ; 508 		__boiler_shower[4]++;
1140  0240 725c0004      	inc	___boiler_shower+4
1141                     ; 509 		if( __boiler_shower[4] >= /*21*/90 )
1143  0244 c60004        	ld	a,___boiler_shower+4
1144  0247 a15a          	cp	a,#90
1145  0249 2504          	jrult	L363
1146                     ; 512 			__boiler_shower[5] = 0x80;
1148  024b 35800005      	mov	___boiler_shower+5,#128
1149  024f               L363:
1150                     ; 516 	if( _disp_mode == 0x10 )
1152  024f c60000        	ld	a,__disp_mode
1153  0252 a110          	cp	a,#16
1154  0254 2635          	jrne	L763
1155                     ; 519 		if( _timFlag == 0 )
1157  0256 c60000        	ld	a,__timFlag
1158  0259 2612          	jrne	L173
1159                     ; 521 			if( uiInfo.repeat == _tim1min )
1161  025b c6000c        	ld	a,_uiInfo+12
1162  025e c10000        	cp	a,__tim1min
1163  0261 2628          	jrne	L763
1164                     ; 523 				_tim1min = 0;
1166  0263 725f0000      	clr	__tim1min
1167                     ; 525 				_timFlag = 1;
1169  0267 35010000      	mov	__timFlag,#1
1170  026b 201e          	jra	L763
1171  026d               L173:
1172                     ; 530 			if( (_TIME_REPEAT_BASE-uiInfo.repeat) == _tim1min )
1174  026d c60000        	ld	a,__tim1min
1175  0270 5f            	clrw	x
1176  0271 97            	ld	xl,a
1177  0272 1f01          	ldw	(OFST-1,sp),x
1178  0274 4f            	clr	a
1179  0275 97            	ld	xl,a
1180  0276 a65a          	ld	a,#90
1181  0278 c0000c        	sub	a,_uiInfo+12
1182  027b 2401          	jrnc	L431
1183  027d 5a            	decw	x
1184  027e               L431:
1185  027e 02            	rlwa	x,a
1186  027f 1301          	cpw	x,(OFST-1,sp)
1187  0281 2608          	jrne	L763
1188                     ; 532 				_tim1min = 0;
1190  0283 725f0000      	clr	__tim1min
1191                     ; 534 				_timFlag = 0;
1193  0287 725f0000      	clr	__timFlag
1194  028b               L763:
1195                     ; 538 	if( _disp_mode == 0x08 )
1197  028b c60000        	ld	a,__disp_mode
1198  028e a108          	cp	a,#8
1199  0290 2618          	jrne	L104
1200                     ; 541 		if( uiInfo.reserve == _tim30min )
1202  0292 c6000d        	ld	a,_uiInfo+13
1203  0295 c10000        	cp	a,__tim30min
1204  0298 2610          	jrne	L104
1205                     ; 543 			_tim30min = 0xff;
1207  029a 35ff0000      	mov	__tim30min,#255
1208                     ; 544 			__s = 0;
1210  029e 725f0000      	clr	___s
1211                     ; 545 			_dsCount = 0;
1213  02a2 725f0000      	clr	__dsCount
1214                     ; 546 			_key_blink = 0;
1216  02a6 725f0000      	clr	__key_blink
1217  02aa               L104:
1218                     ; 549 }
1221  02aa 85            	popw	x
1222  02ab 81            	ret	
1309                     ; 581 int		main()
1309                     ; 582 {
1310                     	switch	.text
1311  02ac               _main:
1313  02ac 5207          	subw	sp,#7
1314       00000007      OFST:	set	7
1317                     ; 583 	uint8_t	logo = 0;
1319  02ae 0f01          	clr	(OFST-6,sp)
1320                     ; 587 	uint8_t	_loopStatus = 0;
1322  02b0 0f02          	clr	(OFST-5,sp)
1323                     ; 595 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
1325  02b2 4f            	clr	a
1326  02b3 cd0000        	call	_CLK_SYSCLKDivConfig
1328                     ; 596 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
1330  02b6 a601          	ld	a,#1
1331  02b8 cd0000        	call	_CLK_SYSCLKSourceConfig
1334  02bb               L534:
1335                     ; 598 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
1337  02bb cd0000        	call	_CLK_GetSYSCLKSource
1339  02be 4a            	dec	a
1340  02bf 26fa          	jrne	L534
1341                     ; 613 	systemTimer();
1343  02c1 cd0000        	call	_systemTimer
1345                     ; 615 	iouart_Open();
1347  02c4 cd0000        	call	_iouart_Open
1349                     ; 616 	encoder_Open();
1351  02c7 cd0000        	call	_encoder_Open
1353                     ; 617 	systemADC();
1355  02ca cd0000        	call	_systemADC
1357                     ; 618 	systemLcd();
1359  02cd cd0000        	call	_systemLcd
1361                     ; 621 	GPIO_Init(D_BL_PORT, D_BL_PIN, GPIO_Mode_Out_PP_Low_Fast);
1363  02d0 4be0          	push	#224
1364  02d2 4b40          	push	#64
1365  02d4 ae5014        	ldw	x,#20500
1366  02d7 cd0000        	call	_GPIO_Init
1368  02da 721c5014      	bset	20500,#6
1369  02de 725f0000      	clr	__lcdTimer
1370  02e2 725f0001      	clr	__lcdTimer+1
1371  02e6 85            	popw	x
1372  02e7 5500000002    	mov	__lcdTimer+2,___timer1s
1373                     ; 622 	D_IO_HIGH(D_BL_PORT, D_BL_PIN);
1375                     ; 624 	_lcdTimer[0] = 0;
1377                     ; 625 	_lcdTimer[1] = 0;
1379                     ; 626 	_lcdTimer[2] = __timer1s;
1381                     ; 630 	GPIO_Init(D_LED_PORT, D_LED_PIN, GPIO_Mode_Out_PP_Low_Fast);
1383  02ec 4be0          	push	#224
1384  02ee 4b01          	push	#1
1385  02f0 ae500a        	ldw	x,#20490
1386  02f3 cd0000        	call	_GPIO_Init
1388  02f6 7211500a      	bres	20490,#0
1389  02fa 85            	popw	x
1390                     ; 631 	D_IO_LOW(D_LED_PORT, D_LED_PIN);
1392                     ; 633 	systemUart();
1394  02fb cd0000        	call	_systemUart
1396                     ; 636 	lcd_disp_n(0, 6);
1398  02fe ae0006        	ldw	x,#6
1399  0301 cd0000        	call	_lcd_disp_n
1401                     ; 637 	lcd_disp_n(1, 6);
1403  0304 ae0106        	ldw	x,#262
1404  0307 cd0000        	call	_lcd_disp_n
1406                     ; 638 	lcd_disp_n(2, 0);
1408  030a ae0200        	ldw	x,#512
1409  030d cd0000        	call	_lcd_disp_n
1411                     ; 639 	lcd_disp_n(3, 4);
1413  0310 ae0304        	ldw	x,#772
1414  0313 cd0000        	call	_lcd_disp_n
1416                     ; 642 	indiIOUartIdle = 0;
1418  0316 725f0000      	clr	_indiIOUartIdle
1419                     ; 644 	rc_ptc_baseSet();
1421  031a cd0000        	call	_rc_ptc_baseSet
1423                     ; 645 	ui_Open();
1425  031d cd0000        	call	_ui_Open
1427                     ; 649 	if( uiInfo.id == 0 )
1429  0320 c60004        	ld	a,_uiInfo+4
1430  0323 2604          	jrne	L144
1431                     ; 651 		_ds = 2;
1433  0325 35020000      	mov	__ds,#2
1434  0329               L144:
1435                     ; 653 	enableInterrupts();
1438  0329 9a            	rim	
1440                     ; 655 	for( i=0; i<24; i++ )	
1443  032a 4f            	clr	a
1444  032b 6b07          	ld	(OFST+0,sp),a
1445  032d               L344:
1446                     ; 656 		_add[i%12] = adcGet(1);
1448  032d 5f            	clrw	x
1449  032e 97            	ld	xl,a
1450  032f a60c          	ld	a,#12
1451  0331 cd0000        	call	c_smodx
1453  0334 89            	pushw	x
1454  0335 a601          	ld	a,#1
1455  0337 cd0000        	call	_adcGet
1457  033a 85            	popw	x
1458  033b d70000        	ld	(__add,x),a
1459                     ; 655 	for( i=0; i<24; i++ )	
1461  033e 0c07          	inc	(OFST+0,sp)
1464  0340 7b07          	ld	a,(OFST+0,sp)
1465  0342 a118          	cp	a,#24
1466  0344 25e7          	jrult	L344
1467  0346               L504:
1468                     ; 685 Entry:		
1468                     ; 686 #if	defined(WATCHDOG_ENABLE)
1468                     ; 687 		while(1)
1468                     ; 688 		{
1468                     ; 689 			for(i=0; i<200; i++ )
1468                     ; 690 			{
1468                     ; 691 				for( j=0; j<250; j++);
1468                     ; 692 			}
1468                     ; 693 			break;
1468                     ; 694 		}
1468                     ; 695 		IWDG_ReloadCounter();
1468                     ; 696 #endif
1468                     ; 697 		i = 0;
1470                     ; 698 		if (timerCalc() == 1) 
1472  0346 cd0000        	call	_timerCalc
1474  0349 4a            	dec	a
1475  034a 2603          	jrne	L554
1476                     ; 701 			timerEvent();
1478  034c cd020f        	call	_timerEvent
1480  034f               L554:
1481                     ; 705 		if( _loopStatus == 0 )
1483  034f 7b02          	ld	a,(OFST-5,sp)
1484  0351 270b          	jreq	L164
1486                     ; 708 		else if( _loopStatus == 3 )
1488  0353 a103          	cp	a,#3
1489  0355 2607          	jrne	L164
1490                     ; 710 			factory(1);
1492  0357 a601          	ld	a,#1
1493  0359 cd0000        	call	_factory
1495                     ; 711 			goto Entry;
1497  035c 20e8          	jra	L504
1498  035e               L164:
1499                     ; 714 		if( logo < 4 )
1501  035e 7b01          	ld	a,(OFST-6,sp)
1502  0360 a104          	cp	a,#4
1503  0362 2419          	jruge	L564
1504                     ; 716 			if( __timer1s != pp[3] )
1506  0364 c60000        	ld	a,___timer1s
1507  0367 1106          	cp	a,(OFST-1,sp)
1508  0369 27db          	jreq	L504
1509                     ; 718 				pp[3] = __timer1s;
1511  036b 6b06          	ld	(OFST-1,sp),a
1512                     ; 719 				if( logo == 2 )
1514  036d 7b01          	ld	a,(OFST-6,sp)
1515  036f a102          	cp	a,#2
1516  0371 2606          	jrne	L174
1517                     ; 721 					logo = 100;
1519  0373 a664          	ld	a,#100
1520  0375 6b01          	ld	(OFST-6,sp),a
1522  0377 20cd          	jra	L504
1523  0379               L174:
1524                     ; 725 					logo++;
1526  0379 0c01          	inc	(OFST-6,sp)
1527  037b 20c9          	jra	L504
1528  037d               L564:
1529                     ; 731 		i = _iouartLoop();
1531  037d cd005f        	call	__iouartLoop
1533  0380 6b07          	ld	(OFST+0,sp),a
1534                     ; 732 		if( i == 3 )		{	_loopStatus = 3;	}//	factory mode
1536  0382 a103          	cp	a,#3
1537  0384 2606          	jrne	L574
1540  0386 a603          	ld	a,#3
1541  0388 6b02          	ld	(OFST-5,sp),a
1543  038a 2006          	jra	L774
1544  038c               L574:
1545                     ; 733 		else if( i == 99 )	{	_loopStatus = 0;	}//	normal mode	
1547  038c a163          	cp	a,#99
1548  038e 2602          	jrne	L774
1551  0390 0f02          	clr	(OFST-5,sp)
1552  0392               L774:
1553                     ; 735 		deviceCb();
1555  0392 cd0134        	call	_deviceCb
1557                     ; 737 		if( (__timer1s%2) != pp[3] )
1559  0395 c60000        	ld	a,___timer1s
1560  0398 a401          	and	a,#1
1561  039a 1106          	cp	a,(OFST-1,sp)
1562  039c 2713          	jreq	L305
1563                     ; 739 			pp[3] = __timer1s%2;
1565  039e c60000        	ld	a,___timer1s
1566  03a1 a401          	and	a,#1
1567  03a3 6b06          	ld	(OFST-1,sp),a
1568                     ; 740 			if( pp[2] == 0 )
1570  03a5 7b05          	ld	a,(OFST-2,sp)
1571  03a7 260a          	jrne	L705
1572                     ; 742 				pp[2] = 1;
1574  03a9 4c            	inc	a
1575  03aa 6b05          	ld	(OFST-2,sp),a
1576                     ; 743 				device_adc();
1578  03ac cd01e8        	call	_device_adc
1580  03af 2002          	jra	L705
1581  03b1               L305:
1582                     ; 747 			pp[2] = 0;
1584  03b1 0f05          	clr	(OFST-2,sp)
1585  03b3               L705:
1586                     ; 749 		if( (__timer1s) != pp[1] )
1588  03b3 c60000        	ld	a,___timer1s
1589  03b6 1104          	cp	a,(OFST-3,sp)
1590  03b8 278c          	jreq	L504
1591                     ; 751 			pp[1] = __timer1s;
1593  03ba 6b04          	ld	(OFST-3,sp),a
1594                     ; 753 			for( i=0; i<PACKET_SIZE; i++ )
1596  03bc 4f            	clr	a
1597  03bd 6b07          	ld	(OFST+0,sp),a
1598  03bf               L315:
1599                     ; 755 				if( packet_buf[i] != 10 )
1601  03bf 5f            	clrw	x
1602  03c0 97            	ld	xl,a
1603  03c1 d60000        	ld	a,(_packet_buf,x)
1604  03c4 a10a          	cp	a,#10
1605  03c6 2708          	jreq	L125
1606                     ; 757 					packet_buf[i] += 1;
1608  03c8 7b07          	ld	a,(OFST+0,sp)
1609  03ca 5f            	clrw	x
1610  03cb 97            	ld	xl,a
1611  03cc 724c0000      	inc	(_packet_buf,x)
1612  03d0               L125:
1613                     ; 753 			for( i=0; i<PACKET_SIZE; i++ )
1615  03d0 0c07          	inc	(OFST+0,sp)
1618  03d2 7b07          	ld	a,(OFST+0,sp)
1619  03d4 a108          	cp	a,#8
1620  03d6 25e7          	jrult	L315
1621                     ; 760 			if( ui_error == 30 && ui_error_type == ERROR_TYPE_CNT )
1623  03d8 c60001        	ld	a,_ui_error
1624  03db a11e          	cp	a,#30
1625  03dd 261f          	jrne	L325
1627  03df c60002        	ld	a,_ui_error_type
1628  03e2 a102          	cp	a,#2
1629  03e4 2618          	jrne	L325
1630                     ; 762 				if( packet_buf[uiInfo.id - 1] < 9 )
1632  03e6 ad2f          	call	LC002
1633  03e8 a109          	cp	a,#9
1634  03ea 2503cc0346    	jruge	L504
1635                     ; 764 					ui_error = 0;
1637  03ef 725f0001      	clr	_ui_error
1638                     ; 765 					ui_error_type = 0;
1640  03f3 725f0002      	clr	_ui_error_type
1641                     ; 766 					_ds = 100;
1643  03f7 35640000      	mov	__ds,#100
1644  03fb cc0346        	jra	L504
1645  03fe               L325:
1646                     ; 771 				if( packet_buf[uiInfo.id - 1] == 10 )
1648  03fe ad17          	call	LC002
1649  0400 a10a          	cp	a,#10
1650  0402 26f7          	jrne	L504
1651                     ; 773 					ui_error = 30;
1653  0404 351e0001      	mov	_ui_error,#30
1654                     ; 774 					ui_error_type = ERROR_TYPE_CNT;
1656  0408 35020002      	mov	_ui_error_type,#2
1657                     ; 775 					_ds = 97;
1659  040c 35610000      	mov	__ds,#97
1660                     ; 776 					_dsCount = 0;
1662  0410 725f0000      	clr	__dsCount
1663  0414 cc0346        	jra	L504
1664  0417               LC002:
1665  0417 c60004        	ld	a,_uiInfo+4
1666  041a 5f            	clrw	x
1667  041b 97            	ld	xl,a
1668  041c 5a            	decw	x
1669  041d d60000        	ld	a,(_packet_buf,x)
1670  0420 81            	ret	
1730                     	xdef	_main
1731                     	xref	__add
1732                     	xdef	_timerEvent
1733                     	xdef	_timerEventClear
1734                     	xdef	___tim30min_reset
1735                     	xref	___timer1sa
1736                     	xref	__timFlag
1737                     	xref	__tim1min
1738                     	xref	__tim30min
1739                     	xdef	_device_adc
1740                     	xdef	_deviceCb
1741                     	xref	__key_code
1742                     	xdef	_disp_key
1743                     	xref	__key_continue
1744                     	xdef	__iouartLoop
1745                     	xdef	__call_ptc_lse
1746                     	xdef	__call_ptc_woodang
1747                     	xdef	__msgLoop
1748                     	xdef	_getCurrTemp
1749                     	xdef	_ui_error_type
1750                     	xdef	_ui_error
1751                     	switch	.bss
1752  0000               _packet_buf:
1753  0000 000000000000  	ds.b	8
1754                     	xdef	_packet_buf
1755                     	xdef	_currTemp
1756                     	xref	__backup_backlight2
1757                     	xref	__backlight
1758                     	xref	__lcdTimer
1759                     	xref	_rc_lse_ptc_make
1760                     	xref	_getLSEState_check
1761                     	xref	_rc_lse_ptc_check
1762                     	xdef	_rc_type
1763                     	xref	_rc_ptc_make_mirror
1764                     	xref	_rc_ptc_make
1765                     	xref	_rc_ptc_make_setting
1766                     	xref	_getState_check
1767                     	xref	_rc_ptc_check
1768                     	xref	_rc_ptc_baseSet
1769                     	xref	_factory
1770                     	xref	___boiler_shower
1771                     	xref	__key_blink
1772                     	xref	__disp_mode
1773                     	xref	__dsCount
1774                     	xref	__ds
1775                     	xref	_ui_Open
1776                     	xref	___s
1777                     	xref	_disp_status
1778                     	xref	_lcd_disp_n
1779                     	xref	_uiInfo
1780                     	xref	_timerCalc
1781                     	xref	_systemTimer
1782                     	xref	___timer1h
1783                     	xref	___timer1min
1784                     	xref	___timer1s
1785                     	xref	_systemUart
1786                     	xref	_uart1_tx_put
1787                     	xref	_iouart_getReadBuffer
1788                     	xref	_iouart_getBuffer
1789                     	xref	_iouart_Ready
1790                     	xref	__io_tail
1791                     	xref	__io_head
1792                     	xref	_iouart_Pkt_Start
1793                     	xref	_iouart_Set_Packet
1794                     	xref	_iouart_Open
1795                     	xref	_indiIOUartIdle
1796                     	xref	_systemLcd
1797                     	xref	_key_ready
1798                     	xref	_encoder_Open
1799                     	xdef	_disp_enc
1800                     	xdef	_disp_adc
1801                     	xref	_adcGet
1802                     	xref	_systemADC
1803                     	xref	_GPIO_Init
1804                     	xref	_CLK_SYSCLKDivConfig
1805                     	xref	_CLK_GetSYSCLKSource
1806                     	xref	_CLK_SYSCLKSourceConfig
1807                     .const:	section	.text
1808  0000               L131:
1809  0000 6500          	dc.b	"e",0
1810                     	xref.b	c_x
1830                     	xref	c_smodx
1831                     	end
