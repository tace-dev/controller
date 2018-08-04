   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               _currTemp:
  21  0000 00            	dc.b	0
  22  0001               _ui_error:
  23  0001 00            	dc.b	0
  24  0002               _ui_error_type:
  25  0002 00            	dc.b	0
  55                     ; 29 uint8_t	getCurrTemp(void)
  55                     ; 30 {
  57                     .text:	section	.text,new
  58  0000               _getCurrTemp:
  62                     ; 31 	return currTemp;
  64  0000 c60000        	ld	a,_currTemp
  67  0003 81            	ret
  99                     ; 34 uint8_t	_msgLoop(uint8_t mode)
  99                     ; 35 {
 100                     .text:	section	.text,new
 101  0000               __msgLoop:
 105                     ; 36 	return 0;
 107  0000 4f            	clr	a
 110  0001 81            	ret
 165                     ; 39 uint8_t	_iouartLoop(void)
 165                     ; 40 {
 166                     .text:	section	.text,new
 167  0000               __iouartLoop:
 169  0000 5203          	subw	sp,#3
 170       00000003      OFST:	set	3
 173                     ; 41 	uint8_t	i = 0;
 176  0002 2070          	jra	L76
 177  0004               L56:
 178                     ; 46 		i = iouart_Ready();
 180  0004 cd0000        	call	_iouart_Ready
 182  0007 6b03          	ld	(OFST+0,sp),a
 183                     ; 47 		if( i != 0 )
 185  0009 0d03          	tnz	(OFST+0,sp)
 186  000b 2703          	jreq	L37
 187                     ; 49 			p = iouart_getReadBuffer();
 189  000d cd0000        	call	_iouart_getReadBuffer
 191  0010               L37:
 192                     ; 56 		if( i == 2 )	DISP("e", 1);
 194  0010 7b03          	ld	a,(OFST+0,sp)
 195  0012 a102          	cp	a,#2
 196  0014 2609          	jrne	L57
 199  0016 4b01          	push	#1
 200  0018 ae0000        	ldw	x,#L77
 201  001b cd0000        	call	_uart1_tx_put
 203  001e 84            	pop	a
 204  001f               L57:
 205                     ; 57 		if( i == 1 )
 207  001f 7b03          	ld	a,(OFST+0,sp)
 208  0021 a101          	cp	a,#1
 209  0023 264f          	jrne	L76
 210                     ; 60 			p = iouart_getReadBuffer();
 212  0025 cd0000        	call	_iouart_getReadBuffer
 214                     ; 63 			rc_ptc_check(iouart_getReadBuffer());
 216  0028 cd0000        	call	_iouart_getReadBuffer
 218  002b cd0000        	call	_rc_ptc_check
 220                     ; 65 			switch (getState_check()) {
 222  002e cd0000        	call	_getState_check
 225                     ; 83 					break;
 227  0031 4a            	dec	a
 228  0032 270c          	jreq	L53
 229  0034 4a            	dec	a
 230  0035 2719          	jreq	L73
 231  0037 a003          	sub	a,#3
 232  0039 2735          	jreq	L34
 233  003b 4a            	dec	a
 234  003c 2722          	jreq	L14
 235  003e 2034          	jra	L76
 236  0040               L53:
 237                     ; 66 				case RC_STATE_NORMAL:
 237                     ; 67 					rc_ptc_make(iouart_getBuffer());
 239  0040 cd0000        	call	_iouart_getBuffer
 241  0043 cd0000        	call	_rc_ptc_make
 243                     ; 68 					iouart_Set_Packet(60);
 245  0046 a63c          	ld	a,#60
 246  0048 cd0000        	call	_iouart_Set_Packet
 248                     ; 69 					iouart_Pkt_Start();
 250  004b cd0000        	call	_iouart_Pkt_Start
 252                     ; 70 					break;
 254  004e 2024          	jra	L76
 255  0050               L73:
 256                     ; 71 				case RC_STATE_SETTING:
 256                     ; 72 					rc_ptc_make_setting(iouart_getBuffer());
 258  0050 cd0000        	call	_iouart_getBuffer
 260  0053 cd0000        	call	_rc_ptc_make_setting
 262                     ; 73 					iouart_Set_Packet(60);
 264  0056 a63c          	ld	a,#60
 265  0058 cd0000        	call	_iouart_Set_Packet
 267                     ; 74 					iouart_Pkt_Start();
 269  005b cd0000        	call	_iouart_Pkt_Start
 271                     ; 75 					break;
 273  005e 2014          	jra	L76
 274  0060               L14:
 275                     ; 76 				case RC_STATE_MIRROR:
 275                     ; 77 					rc_ptc_make_mirror(iouart_getBuffer());
 277  0060 cd0000        	call	_iouart_getBuffer
 279  0063 cd0000        	call	_rc_ptc_make_mirror
 281                     ; 78 					iouart_Set_Packet(60);
 283  0066 a63c          	ld	a,#60
 284  0068 cd0000        	call	_iouart_Set_Packet
 286                     ; 79 					iouart_Pkt_Start();
 288  006b cd0000        	call	_iouart_Pkt_Start
 290                     ; 80 					break;
 292  006e 2004          	jra	L76
 293  0070               L34:
 294                     ; 81 				case RC_STATE_FACTORY:
 294                     ; 82 					return 3;
 296  0070 a603          	ld	a,#3
 298  0072 2009          	jra	L21
 299  0074               L501:
 300  0074               L76:
 301                     ; 44 	while( _io_head != _io_tail )
 303  0074 c60000        	ld	a,__io_head
 304  0077 c10000        	cp	a,__io_tail
 305  007a 2688          	jrne	L56
 306                     ; 87 	return 0;
 308  007c 4f            	clr	a
 310  007d               L21:
 312  007d 5b03          	addw	sp,#3
 313  007f 81            	ret
 357                     ; 95 void	disp_key(uint8_t k)
 357                     ; 96 {
 358                     .text:	section	.text,new
 359  0000               _disp_key:
 361  0000 88            	push	a
 362  0001 5205          	subw	sp,#5
 363       00000005      OFST:	set	5
 366                     ; 98 	buf[0] = '<';
 368  0003 a63c          	ld	a,#60
 369  0005 6b01          	ld	(OFST-4,sp),a
 370                     ; 99 	buf[2] = ':';
 372  0007 a63a          	ld	a,#58
 373  0009 6b03          	ld	(OFST-2,sp),a
 374                     ; 100 	buf[3] = '0' + _key_continue;
 376  000b c60000        	ld	a,__key_continue
 377  000e ab30          	add	a,#48
 378  0010 6b04          	ld	(OFST-1,sp),a
 379                     ; 101 	buf[4] = '>';
 381  0012 a63e          	ld	a,#62
 382  0014 6b05          	ld	(OFST+0,sp),a
 383                     ; 102 	if( k == 4 )		buf[1] = '4';
 385  0016 7b06          	ld	a,(OFST+1,sp)
 386  0018 a104          	cp	a,#4
 387  001a 2606          	jrne	L721
 390  001c a634          	ld	a,#52
 391  001e 6b02          	ld	(OFST-3,sp),a
 393  0020 2028          	jra	L131
 394  0022               L721:
 395                     ; 103 	else if( k == 3 )	buf[1] = '3';
 397  0022 7b06          	ld	a,(OFST+1,sp)
 398  0024 a103          	cp	a,#3
 399  0026 2606          	jrne	L331
 402  0028 a633          	ld	a,#51
 403  002a 6b02          	ld	(OFST-3,sp),a
 405  002c 201c          	jra	L131
 406  002e               L331:
 407                     ; 104 	else if( k == 2 )	buf[1] = '2';
 409  002e 7b06          	ld	a,(OFST+1,sp)
 410  0030 a102          	cp	a,#2
 411  0032 2606          	jrne	L731
 414  0034 a632          	ld	a,#50
 415  0036 6b02          	ld	(OFST-3,sp),a
 417  0038 2010          	jra	L131
 418  003a               L731:
 419                     ; 105 	else if( k == 1 )	buf[1] = '1';
 421  003a 7b06          	ld	a,(OFST+1,sp)
 422  003c a101          	cp	a,#1
 423  003e 2606          	jrne	L341
 426  0040 a631          	ld	a,#49
 427  0042 6b02          	ld	(OFST-3,sp),a
 429  0044 2004          	jra	L131
 430  0046               L341:
 431                     ; 107 		buf[2] = '?';
 433  0046 a63f          	ld	a,#63
 434  0048 6b03          	ld	(OFST-2,sp),a
 435  004a               L131:
 436                     ; 108 	DISP(buf, 5);
 438  004a 4b05          	push	#5
 439  004c 96            	ldw	x,sp
 440  004d 1c0002        	addw	x,#OFST-3
 441  0050 cd0000        	call	_uart1_tx_put
 443  0053 84            	pop	a
 444                     ; 109 }
 447  0054 5b06          	addw	sp,#6
 448  0056 81            	ret
 498                     ; 111 void	disp_enc(uint8_t enc)
 498                     ; 112 {
 499                     .text:	section	.text,new
 500  0000               _disp_enc:
 502  0000 88            	push	a
 503  0001 5204          	subw	sp,#4
 504       00000004      OFST:	set	4
 507                     ; 115 	if( (enc & 0x40) != 0 )
 509  0003 a540          	bcp	a,#64
 510  0005 2706          	jreq	L171
 511                     ; 116 		buf[0] = '+';
 513  0007 a62b          	ld	a,#43
 514  0009 6b02          	ld	(OFST-2,sp),a
 516  000b 2004          	jra	L371
 517  000d               L171:
 518                     ; 118 		buf[0] = '-';
 520  000d a62d          	ld	a,#45
 521  000f 6b02          	ld	(OFST-2,sp),a
 522  0011               L371:
 523                     ; 120 	i = enc&0x0f;
 525  0011 7b05          	ld	a,(OFST+1,sp)
 526  0013 a40f          	and	a,#15
 527  0015 6b01          	ld	(OFST-3,sp),a
 528                     ; 121 	buf[1] = '0' + i/10;
 530  0017 7b01          	ld	a,(OFST-3,sp)
 531  0019 5f            	clrw	x
 532  001a 97            	ld	xl,a
 533  001b a60a          	ld	a,#10
 534  001d 62            	div	x,a
 535  001e 9f            	ld	a,xl
 536  001f ab30          	add	a,#48
 537  0021 6b03          	ld	(OFST-1,sp),a
 538                     ; 122 	buf[2] = '0' + i%10;
 540  0023 7b01          	ld	a,(OFST-3,sp)
 541  0025 5f            	clrw	x
 542  0026 97            	ld	xl,a
 543  0027 a60a          	ld	a,#10
 544  0029 62            	div	x,a
 545  002a 5f            	clrw	x
 546  002b 97            	ld	xl,a
 547  002c 9f            	ld	a,xl
 548  002d ab30          	add	a,#48
 549  002f 6b04          	ld	(OFST+0,sp),a
 550                     ; 123 	DISP(buf, 3);
 552  0031 4b03          	push	#3
 553  0033 96            	ldw	x,sp
 554  0034 1c0003        	addw	x,#OFST-1
 555  0037 cd0000        	call	_uart1_tx_put
 557  003a 84            	pop	a
 558                     ; 124 }
 561  003b 5b05          	addw	sp,#5
 562  003d 81            	ret
 594                     ; 126 void	disp_adc(uint8_t i)
 594                     ; 127 {
 595                     .text:	section	.text,new
 596  0000               _disp_adc:
 600                     ; 137 }
 603  0000 81            	ret
 642                     ; 148 void	deviceCb(void)
 642                     ; 149 {
 643                     .text:	section	.text,new
 644  0000               _deviceCb:
 646  0000 88            	push	a
 647       00000001      OFST:	set	1
 650                     ; 151 	uiInfo.enc = 0;
 652  0001 725f0000      	clr	_uiInfo
 653                     ; 152 	key = key_ready();
 655  0005 cd0000        	call	_key_ready
 657  0008 6b01          	ld	(OFST+0,sp),a
 658                     ; 153 	if( key != 0 && key < 0x80 )
 660  000a 0d01          	tnz	(OFST+0,sp)
 661  000c 270d          	jreq	L522
 663  000e 7b01          	ld	a,(OFST+0,sp)
 664  0010 a180          	cp	a,#128
 665  0012 2407          	jruge	L522
 666                     ; 154 		disp_key(key);
 668  0014 7b01          	ld	a,(OFST+0,sp)
 669  0016 cd0000        	call	_disp_key
 672  0019 2010          	jra	L722
 673  001b               L522:
 674                     ; 157 		if( (key & 0x80) != 0 )
 676  001b 7b01          	ld	a,(OFST+0,sp)
 677  001d a580          	bcp	a,#128
 678  001f 270a          	jreq	L722
 679                     ; 159 			disp_enc(key);
 681  0021 7b01          	ld	a,(OFST+0,sp)
 682  0023 cd0000        	call	_disp_enc
 684                     ; 160 			uiInfo.enc = key;
 686  0026 7b01          	ld	a,(OFST+0,sp)
 687  0028 c70000        	ld	_uiInfo,a
 688  002b               L722:
 689                     ; 163 	if( key == 3 && _key_continue == 1 )
 691  002b 7b01          	ld	a,(OFST+0,sp)
 692  002d a103          	cp	a,#3
 693  002f 260f          	jrne	L332
 695  0031 c60000        	ld	a,__key_continue
 696  0034 a101          	cp	a,#1
 697  0036 2608          	jrne	L332
 698                     ; 166 		key = 0x88;
 700  0038 a688          	ld	a,#136
 701  003a 6b01          	ld	(OFST+0,sp),a
 702                     ; 167 		_key_code = 0xff;
 704  003c 35ff0000      	mov	__key_code,#255
 705  0040               L332:
 706                     ; 169 	if( key == 2 && _key_continue == 2 )
 708  0040 7b01          	ld	a,(OFST+0,sp)
 709  0042 a102          	cp	a,#2
 710  0044 260f          	jrne	L532
 712  0046 c60000        	ld	a,__key_continue
 713  0049 a102          	cp	a,#2
 714  004b 2608          	jrne	L532
 715                     ; 172 		key = 0x89;
 717  004d a689          	ld	a,#137
 718  004f 6b01          	ld	(OFST+0,sp),a
 719                     ; 173 		_key_code = 0xff;
 721  0051 35ff0000      	mov	__key_code,#255
 722  0055               L532:
 723                     ; 175 	disp_status(key);
 725  0055 7b01          	ld	a,(OFST+0,sp)
 726  0057 cd0000        	call	_disp_status
 728                     ; 176 }
 731  005a 84            	pop	a
 732  005b 81            	ret
 767                     ; 178 void	device_adc(void)
 767                     ; 179 {
 768                     .text:	section	.text,new
 769  0000               _device_adc:
 771  0000 88            	push	a
 772       00000001      OFST:	set	1
 775                     ; 181 	i = adcGet(0);
 777  0001 4f            	clr	a
 778  0002 cd0000        	call	_adcGet
 780  0005 6b01          	ld	(OFST+0,sp),a
 781                     ; 182 	if( i != currTemp )
 783  0007 7b01          	ld	a,(OFST+0,sp)
 784  0009 c10000        	cp	a,_currTemp
 785  000c 270a          	jreq	L352
 786                     ; 184 		currTemp = i;
 788  000e 7b01          	ld	a,(OFST+0,sp)
 789  0010 c70000        	ld	_currTemp,a
 790                     ; 185 		disp_adc(i);
 792  0013 7b01          	ld	a,(OFST+0,sp)
 793  0015 cd0000        	call	_disp_adc
 795  0018               L352:
 796                     ; 187 }
 799  0018 84            	pop	a
 800  0019 81            	ret
 803                     	switch	.data
 804  0003               ___tim30min_reset:
 805  0003 00            	dc.b	0
 829                     ; 196 uint8_t timerEventClear(void) {
 830                     .text:	section	.text,new
 831  0000               _timerEventClear:
 835                     ; 197 	__timer1sa = 0;
 837  0000 725f0000      	clr	___timer1sa
 838                     ; 198 	__timer1min = 0;
 840  0004 725f0000      	clr	___timer1min
 841                     ; 199 	__timer1h = 0 ;
 843  0008 725f0000      	clr	___timer1h
 844                     ; 200 }
 847  000c 81            	ret
 879                     ; 202 void	timerEvent(void)
 879                     ; 203 {
 880                     .text:	section	.text,new
 881  0000               _timerEvent:
 883  0000 89            	pushw	x
 884       00000002      OFST:	set	2
 887                     ; 204 	_tim1min++;
 889  0001 725c0000      	inc	__tim1min
 890                     ; 205 	if( (_tim1min%30) == 0 )
 892  0005 c60000        	ld	a,__tim1min
 893  0008 5f            	clrw	x
 894  0009 97            	ld	xl,a
 895  000a a61e          	ld	a,#30
 896  000c cd0000        	call	c_smodx
 898  000f a30000        	cpw	x,#0
 899  0012 2617          	jrne	L572
 900                     ; 207 		if( _tim30min != 0xff )
 902  0014 c60000        	ld	a,__tim30min
 903  0017 a1ff          	cp	a,#255
 904  0019 2714          	jreq	L303
 905                     ; 209 			if( __tim30min_reset == 0 )
 907  001b 725d0003      	tnz	___tim30min_reset
 908  001f 260e          	jrne	L303
 909                     ; 211 				__tim30min_reset = 1;
 911  0021 35010003      	mov	___tim30min_reset,#1
 912                     ; 212 				_tim30min++;
 914  0025 725c0000      	inc	__tim30min
 915  0029 2004          	jra	L303
 916  002b               L572:
 917                     ; 217 		__tim30min_reset = 0;
 919  002b 725f0003      	clr	___tim30min_reset
 920  002f               L303:
 921                     ; 219 	if( _disp_mode == 0x10 )
 923  002f c60000        	ld	a,__disp_mode
 924  0032 a110          	cp	a,#16
 925  0034 2637          	jrne	L503
 926                     ; 222 		if( _timFlag == 0 )
 928  0036 725d0000      	tnz	__timFlag
 929  003a 2612          	jrne	L703
 930                     ; 224 			if( uiInfo.repeat == _tim1min )
 932  003c c6000c        	ld	a,_uiInfo+12
 933  003f c10000        	cp	a,__tim1min
 934  0042 2629          	jrne	L503
 935                     ; 226 				_tim1min = 0;
 937  0044 725f0000      	clr	__tim1min
 938                     ; 228 				_timFlag = 1;
 940  0048 35010000      	mov	__timFlag,#1
 941  004c 201f          	jra	L503
 942  004e               L703:
 943                     ; 233 			if( (90-uiInfo.repeat) == _tim1min )
 945  004e c60000        	ld	a,__tim1min
 946  0051 5f            	clrw	x
 947  0052 97            	ld	xl,a
 948  0053 1f01          	ldw	(OFST-1,sp),x
 949  0055 a600          	ld	a,#0
 950  0057 97            	ld	xl,a
 951  0058 a65a          	ld	a,#90
 952  005a c0000c        	sub	a,_uiInfo+12
 953  005d 2401          	jrnc	L23
 954  005f 5a            	decw	x
 955  0060               L23:
 956  0060 02            	rlwa	x,a
 957  0061 1301          	cpw	x,(OFST-1,sp)
 958  0063 2608          	jrne	L503
 959                     ; 235 				_tim1min = 0;
 961  0065 725f0000      	clr	__tim1min
 962                     ; 237 				_timFlag = 0;
 964  0069 725f0000      	clr	__timFlag
 965  006d               L503:
 966                     ; 241 	if( _disp_mode == 0x08 )
 968  006d c60000        	ld	a,__disp_mode
 969  0070 a108          	cp	a,#8
 970  0072 2618          	jrne	L713
 971                     ; 244 		if( uiInfo.reserve == _tim30min )
 973  0074 c6000d        	ld	a,_uiInfo+13
 974  0077 c10000        	cp	a,__tim30min
 975  007a 2610          	jrne	L713
 976                     ; 246 			_tim30min = 0xff;
 978  007c 35ff0000      	mov	__tim30min,#255
 979                     ; 247 			__s = 0;
 981  0080 725f0000      	clr	___s
 982                     ; 248 			_dsCount = 0;
 984  0084 725f0000      	clr	__dsCount
 985                     ; 249 			_key_blink = 0;
 987  0088 725f0000      	clr	__key_blink
 988  008c               L713:
 989                     ; 252 }
 992  008c 85            	popw	x
 993  008d 81            	ret
1082                     ; 284 int		main()
1082                     ; 285 {
1083                     .text:	section	.text,new
1084  0000               _main:
1086  0000 5207          	subw	sp,#7
1087       00000007      OFST:	set	7
1090                     ; 286 	uint8_t	logo = 100;
1092  0002 a664          	ld	a,#100
1093  0004 6b01          	ld	(OFST-6,sp),a
1094                     ; 290 	uint8_t	_loopStatus = 0;
1096  0006 0f02          	clr	(OFST-5,sp)
1097                     ; 294 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
1099  0008 4f            	clr	a
1100  0009 cd0000        	call	_CLK_SYSCLKDivConfig
1102                     ; 295 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
1104  000c a601          	ld	a,#1
1105  000e cd0000        	call	_CLK_SYSCLKSourceConfig
1108  0011               L353:
1109                     ; 297 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
1111  0011 cd0000        	call	_CLK_GetSYSCLKSource
1113  0014 a101          	cp	a,#1
1114  0016 26f9          	jrne	L353
1115                     ; 303 	systemTimer();
1117  0018 cd0000        	call	_systemTimer
1119                     ; 305 	iouart_Open();
1121  001b cd0000        	call	_iouart_Open
1123                     ; 306 	encoder_Open();
1125  001e cd0000        	call	_encoder_Open
1127                     ; 307 	systemADC();
1129  0021 cd0000        	call	_systemADC
1131                     ; 309 	systemLcd();
1133  0024 cd0000        	call	_systemLcd
1135                     ; 313 	GPIO_Init(D_BL_PORT, D_BL_PIN, GPIO_Mode_Out_PP_Low_Fast);
1137  0027 4be0          	push	#224
1138  0029 4b40          	push	#64
1139  002b ae5014        	ldw	x,#20500
1140  002e cd0000        	call	_GPIO_Init
1142  0031 85            	popw	x
1143                     ; 314 	D_IO_HIGH(D_BL_PORT, D_BL_PIN);
1145  0032 721c5014      	bset	20500,#6
1146                     ; 318 	GPIO_Init(D_LED_PORT, D_LED_PIN, GPIO_Mode_Out_PP_Low_Fast);
1148  0036 4be0          	push	#224
1149  0038 4b01          	push	#1
1150  003a ae500a        	ldw	x,#20490
1151  003d cd0000        	call	_GPIO_Init
1153  0040 85            	popw	x
1154                     ; 319 	D_IO_LOW(D_LED_PORT, D_LED_PIN);
1156  0041 7211500a      	bres	20490,#0
1157                     ; 321 	systemUart();
1159  0045 cd0000        	call	_systemUart
1161                     ; 322 	lcd_clear(0);
1163  0048 4f            	clr	a
1164  0049 cd0000        	call	_lcd_clear
1166                     ; 337 	indiIOUartIdle = 0;
1168  004c 725f0000      	clr	_indiIOUartIdle
1169                     ; 339 	rc_ptc_baseSet();
1171  0050 cd0000        	call	_rc_ptc_baseSet
1173                     ; 340 	ui_Open();
1175  0053 cd0000        	call	_ui_Open
1177                     ; 342 	_uiSetup = FW_GET_SETUP_LAST;
1179  0056 a63e          	ld	a,#62
1180  0058 cd0000        	call	_file_read
1182  005b c70000        	ld	__uiSetup,a
1183                     ; 343 	_uiSetupPrev = _uiSetupPrev;
1185                     ; 345 	enableInterrupts();
1188  005e 9a            rim
1190                     ; 351 	for( i=0; i<24; i++ )	
1193  005f 0f07          	clr	(OFST+0,sp)
1194  0061               L753:
1195                     ; 352 		_add[i%12] = adcGet(1);
1197  0061 7b07          	ld	a,(OFST+0,sp)
1198  0063 5f            	clrw	x
1199  0064 97            	ld	xl,a
1200  0065 a60c          	ld	a,#12
1201  0067 cd0000        	call	c_smodx
1203  006a 89            	pushw	x
1204  006b a601          	ld	a,#1
1205  006d cd0000        	call	_adcGet
1207  0070 85            	popw	x
1208  0071 d70000        	ld	(__add,x),a
1209                     ; 351 	for( i=0; i<24; i++ )	
1211  0074 0c07          	inc	(OFST+0,sp)
1214  0076 7b07          	ld	a,(OFST+0,sp)
1215  0078 a118          	cp	a,#24
1216  007a 25e5          	jrult	L753
1217  007c               L323:
1218                     ; 356 Entry:		
1218                     ; 357 #if	defined(WATCHDOG_ENABLE)
1218                     ; 358 		while(1)
1218                     ; 359 		{
1218                     ; 360 			for(i=0; i<200; i++ )
1218                     ; 361 			{
1218                     ; 362 				for( j=0; j<250; j++);
1218                     ; 363 			}
1218                     ; 364 			break;
1218                     ; 365 		}
1218                     ; 366 		IWDG_ReloadCounter();
1218                     ; 367 #endif
1218                     ; 368 		i = 0;
1220                     ; 369 		if (timerCalc() == 1) 
1222  007c cd0000        	call	_timerCalc
1224  007f a101          	cp	a,#1
1225  0081 2603          	jrne	L173
1226                     ; 372 			timerEvent();
1228  0083 cd0000        	call	_timerEvent
1230  0086               L173:
1231                     ; 376 		if( _loopStatus == 0 )
1233  0086 0d02          	tnz	(OFST-5,sp)
1234  0088 270d          	jreq	L573
1236                     ; 379 		else if( _loopStatus == 3 )
1238  008a 7b02          	ld	a,(OFST-5,sp)
1239  008c a103          	cp	a,#3
1240  008e 2607          	jrne	L573
1241                     ; 381 			factory(1);
1243  0090 a601          	ld	a,#1
1244  0092 cd0000        	call	_factory
1246                     ; 382 			goto Entry;
1248  0095 20e5          	jra	L323
1249  0097               L573:
1250                     ; 385 		if( logo < 4 )
1252  0097 7b01          	ld	a,(OFST-6,sp)
1253  0099 a104          	cp	a,#4
1254  009b 241c          	jruge	L104
1255                     ; 387 			if( __timer1s != pp[1] )
1257  009d c60000        	ld	a,___timer1s
1258  00a0 1104          	cp	a,(OFST-3,sp)
1259  00a2 27d8          	jreq	L323
1260                     ; 389 				pp[1] = __timer1s;
1262  00a4 c60000        	ld	a,___timer1s
1263  00a7 6b04          	ld	(OFST-3,sp),a
1264                     ; 390 				if( logo == 2 )
1266  00a9 7b01          	ld	a,(OFST-6,sp)
1267  00ab a102          	cp	a,#2
1268  00ad 2606          	jrne	L504
1269                     ; 392 					logo = 100;
1271  00af a664          	ld	a,#100
1272  00b1 6b01          	ld	(OFST-6,sp),a
1274  00b3 20c7          	jra	L323
1275  00b5               L504:
1276                     ; 396 					logo++;
1278  00b5 0c01          	inc	(OFST-6,sp)
1279  00b7 20c3          	jra	L323
1280  00b9               L104:
1281                     ; 402 		i = _iouartLoop();
1283  00b9 cd0000        	call	__iouartLoop
1285  00bc 6b07          	ld	(OFST+0,sp),a
1286                     ; 403 		if( i == 3 )		{	_loopStatus = 3;	}//	factory mode
1288  00be 7b07          	ld	a,(OFST+0,sp)
1289  00c0 a103          	cp	a,#3
1290  00c2 2606          	jrne	L114
1293  00c4 a603          	ld	a,#3
1294  00c6 6b02          	ld	(OFST-5,sp),a
1296  00c8 2008          	jra	L314
1297  00ca               L114:
1298                     ; 404 		else if( i == 99 )	{	_loopStatus = 0;	}//	normal mode	
1300  00ca 7b07          	ld	a,(OFST+0,sp)
1301  00cc a163          	cp	a,#99
1302  00ce 2602          	jrne	L314
1305  00d0 0f02          	clr	(OFST-5,sp)
1306  00d2               L314:
1307                     ; 406 		deviceCb();
1309  00d2 cd0000        	call	_deviceCb
1311                     ; 408 		if( (__timer1s%2) != pp[3] )
1313  00d5 c60000        	ld	a,___timer1s
1314  00d8 a401          	and	a,#1
1315  00da 1106          	cp	a,(OFST-1,sp)
1316  00dc 2714          	jreq	L714
1317                     ; 410 			pp[3] = __timer1s%2;
1319  00de c60000        	ld	a,___timer1s
1320  00e1 a401          	and	a,#1
1321  00e3 6b06          	ld	(OFST-1,sp),a
1322                     ; 411 			if( pp[2] == 0 )
1324  00e5 0d05          	tnz	(OFST-2,sp)
1325  00e7 260b          	jrne	L324
1326                     ; 413 				pp[2] = 1;
1328  00e9 a601          	ld	a,#1
1329  00eb 6b05          	ld	(OFST-2,sp),a
1330                     ; 414 				device_adc();
1332  00ed cd0000        	call	_device_adc
1334  00f0 2002          	jra	L324
1335  00f2               L714:
1336                     ; 418 			pp[2] = 0;
1338  00f2 0f05          	clr	(OFST-2,sp)
1339  00f4               L324:
1340                     ; 420 		if( (__timer1s) != pp[1] )
1342  00f4 c60000        	ld	a,___timer1s
1343  00f7 1104          	cp	a,(OFST-3,sp)
1344  00f9 2781          	jreq	L323
1345                     ; 422 			pp[1] = __timer1s;
1347  00fb c60000        	ld	a,___timer1s
1348  00fe 6b04          	ld	(OFST-3,sp),a
1349                     ; 424 			for( i=0; i<PACKET_SIZE; i++ )
1351  0100 0f07          	clr	(OFST+0,sp)
1352  0102               L724:
1353                     ; 426 				if( packet_buf[i] != 10 )
1355  0102 7b07          	ld	a,(OFST+0,sp)
1356  0104 5f            	clrw	x
1357  0105 97            	ld	xl,a
1358  0106 d60000        	ld	a,(_packet_buf,x)
1359  0109 a10a          	cp	a,#10
1360  010b 2708          	jreq	L534
1361                     ; 428 					packet_buf[i] += 1;
1363  010d 7b07          	ld	a,(OFST+0,sp)
1364  010f 5f            	clrw	x
1365  0110 97            	ld	xl,a
1366  0111 724c0000      	inc	(_packet_buf,x)
1367  0115               L534:
1368                     ; 424 			for( i=0; i<PACKET_SIZE; i++ )
1370  0115 0c07          	inc	(OFST+0,sp)
1373  0117 7b07          	ld	a,(OFST+0,sp)
1374  0119 a108          	cp	a,#8
1375  011b 25e5          	jrult	L724
1376                     ; 431 			if( ui_error == 30 && ui_error_type == ERROR_TYPE_CNT )
1378  011d c60001        	ld	a,_ui_error
1379  0120 a11e          	cp	a,#30
1380  0122 2627          	jrne	L734
1382  0124 c60002        	ld	a,_ui_error_type
1383  0127 a102          	cp	a,#2
1384  0129 2620          	jrne	L734
1385                     ; 433 				if( packet_buf[uiInfo.id - 1] < 9 )
1387  012b c60004        	ld	a,_uiInfo+4
1388  012e 5f            	clrw	x
1389  012f 97            	ld	xl,a
1390  0130 5a            	decw	x
1391  0131 d60000        	ld	a,(_packet_buf,x)
1392  0134 a109          	cp	a,#9
1393  0136 2503          	jrult	L63
1394  0138 cc007c        	jp	L323
1395  013b               L63:
1396                     ; 435 					ui_error = 0;
1398  013b 725f0001      	clr	_ui_error
1399                     ; 436 					ui_error_type = 0;
1401  013f 725f0002      	clr	_ui_error_type
1402                     ; 437 					_ds = 100;
1404  0143 35640000      	mov	__ds,#100
1405  0147 ac7c007c      	jpf	L323
1406  014b               L734:
1407                     ; 442 				if( packet_buf[uiInfo.id - 1] == 10 )
1409  014b c60004        	ld	a,_uiInfo+4
1410  014e 5f            	clrw	x
1411  014f 97            	ld	xl,a
1412  0150 5a            	decw	x
1413  0151 d60000        	ld	a,(_packet_buf,x)
1414  0154 a10a          	cp	a,#10
1415  0156 2703          	jreq	L04
1416  0158 cc007c        	jp	L323
1417  015b               L04:
1418                     ; 444 					ui_error = 30;
1420  015b 351e0001      	mov	_ui_error,#30
1421                     ; 445 					ui_error_type = ERROR_TYPE_CNT;
1423  015f 35020002      	mov	_ui_error_type,#2
1424                     ; 446 					_ds = 97;
1426  0163 35610000      	mov	__ds,#97
1427                     ; 447 					_dsCount = 0;
1429  0167 725f0000      	clr	__dsCount
1430  016b ac7c007c      	jpf	L323
1483                     	xdef	_main
1484                     	xref	__add
1485                     	xdef	_timerEvent
1486                     	xdef	_timerEventClear
1487                     	xdef	___tim30min_reset
1488                     	xref	___timer1sa
1489                     	xref	__timFlag
1490                     	xref	__tim1min
1491                     	xref	__tim30min
1492                     	xdef	_device_adc
1493                     	xdef	_deviceCb
1494                     	xref	__key_code
1495                     	xdef	_disp_key
1496                     	xref	__key_continue
1497                     	xdef	__iouartLoop
1498                     	xdef	__msgLoop
1499                     	xdef	_getCurrTemp
1500                     	xdef	_ui_error_type
1501                     	xdef	_ui_error
1502                     	switch	.bss
1503  0000               _packet_buf:
1504  0000 000000000000  	ds.b	8
1505                     	xdef	_packet_buf
1506                     	xdef	_currTemp
1507                     	xref	__uiSetupPrev
1508                     	xref	__uiSetup
1509                     	xref	_rc_ptc_make_mirror
1510                     	xref	_rc_ptc_make
1511                     	xref	_rc_ptc_make_setting
1512                     	xref	_getState_check
1513                     	xref	_rc_ptc_check
1514                     	xref	_rc_ptc_baseSet
1515                     	xref	_factory
1516                     	xref	__key_blink
1517                     	xref	__disp_mode
1518                     	xref	__dsCount
1519                     	xref	__ds
1520                     	xref	_ui_Open
1521                     	xref	___s
1522                     	xref	_disp_status
1523                     	xref	_lcd_clear
1524                     	xref	_uiInfo
1525                     	xref	_file_read
1526                     	xref	_timerCalc
1527                     	xref	_systemTimer
1528                     	xref	___timer1h
1529                     	xref	___timer1min
1530                     	xref	___timer1s
1531                     	xref	_systemUart
1532                     	xref	_uart1_tx_put
1533                     	xref	_iouart_getReadBuffer
1534                     	xref	_iouart_getBuffer
1535                     	xref	_iouart_Ready
1536                     	xref	__io_tail
1537                     	xref	__io_head
1538                     	xref	_iouart_Pkt_Start
1539                     	xref	_iouart_Set_Packet
1540                     	xref	_iouart_Open
1541                     	xref	_indiIOUartIdle
1542                     	xref	_systemLcd
1543                     	xref	_key_ready
1544                     	xref	_encoder_Open
1545                     	xdef	_disp_enc
1546                     	xdef	_disp_adc
1547                     	xref	_adcGet
1548                     	xref	_systemADC
1549                     	xref	_GPIO_Init
1550                     	xref	_CLK_SYSCLKDivConfig
1551                     	xref	_CLK_GetSYSCLKSource
1552                     	xref	_CLK_SYSCLKSourceConfig
1553                     .const:	section	.text
1554  0000               L77:
1555  0000 6500          	dc.b	"e",0
1556                     	xref.b	c_x
1576                     	xref	c_smodx
1577                     	end
