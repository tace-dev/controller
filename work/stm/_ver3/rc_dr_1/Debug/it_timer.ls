   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               _timer50usCount:
  24  0000 00            	dc.b	0
  25  0001               _timer100usCount:
  26  0001 00            	dc.b	0
  27  0002               __t20ms:
  28  0002 00            	dc.b	0
  29  0003               __io_head:
  30  0003 00            	dc.b	0
  31  0004               __io_tail:
  32  0004 00            	dc.b	0
  33  0005               ____k:
  34  0005 00            	dc.b	0
  35  0006               _beepCount:
  36  0006 00            	dc.b	0
  37  0007               _beepEnable:
  38  0007 00            	dc.b	0
  78                     ; 21 void	beepSet(uint8_t i)
  78                     ; 22 {
  80                     .text:	section	.text,new
  81  0000               _beepSet:
  85                     ; 27 	beepCount =5;
  87  0000 35050006      	mov	_beepCount,#5
  88                     ; 28 	beepEnable = 1;
  90  0004 35010007      	mov	_beepEnable,#1
  91                     ; 29 }
  94  0008 81            	ret	
  97                     	switch	.data
  98  0008               __io_rc_prev:
  99  0008 02            	dc.b	2
 100  0009               __swuart_tx_head:
 101  0009 00            	dc.b	0
 102  000a               __swuart_tx_tail:
 103  000a 00            	dc.b	0
 104  000b               __sw_bit:
 105  000b 00            	dc.b	0
 106  000c               __sw_sending:
 107  000c 00            	dc.b	0
 128                     ; 81 void	timer1CiCb(void)
 128                     ; 82 {	
 129                     .text:	section	.text,new
 130  0000               _timer1CiCb:
 134                     ; 90 }
 137  0000 81            	ret	
 164                     ; 92 void	timer2CiCb(void)
 164                     ; 93 {	
 165                     .text:	section	.text,new
 166  0000               _timer2CiCb:
 170                     ; 94 	if( indiIOUartIdle == 0 )
 172  0000 c60000        	ld	a,_indiIOUartIdle
 173  0003 2624          	jrne	L54
 174                     ; 96 		if( ___k != 0 )
 176  0005 725d0005      	tnz	____k
 177  0009 271e          	jreq	L54
 178                     ; 98 			_io_buf[_io_head++] = ___k;
 180  000b c60003        	ld	a,__io_head
 181  000e 725c0003      	inc	__io_head
 182  0012 5f            	clrw	x
 183  0013 97            	ld	xl,a
 184  0014 c60005        	ld	a,____k
 185  0017 d70041        	ld	(__io_buf,x),a
 186                     ; 99 			if( _io_head == _IO_BUF_SIZE )
 188  001a c60003        	ld	a,__io_head
 189  001d a130          	cp	a,#48
 190  001f 2604          	jrne	L15
 191                     ; 100 				_io_head = 0;
 193  0021 725f0003      	clr	__io_head
 194  0025               L15:
 195                     ; 101 			___k = 0;
 197  0025 725f0005      	clr	____k
 198  0029               L54:
 199                     ; 104 }
 202  0029 81            	ret	
 239                     ; 106 void	timer2_UpdateCb(void)
 239                     ; 107 {
 240                     .text:	section	.text,new
 241  0000               _timer2_UpdateCb:
 243  0000 88            	push	a
 244       00000001      OFST:	set	1
 247                     ; 111 	i = GPIO_ReadInputData(D_IOUART_RX_PORT);
 249  0001 ae500f        	ldw	x,#20495
 250  0004 cd0000        	call	_GPIO_ReadInputData
 252                     ; 112 	i = i & D_IOUART_RX_PIN;
 254  0007 a420          	and	a,#32
 255  0009 6b01          	ld	(OFST+0,sp),a
 256                     ; 113 	if( i == _io_rc_prev )
 258  000b c10008        	cp	a,__io_rc_prev
 259  000e 2602          	jrne	L76
 260                     ; 114 		return;
 263  0010 84            	pop	a
 264  0011 81            	ret	
 265  0012               L76:
 266                     ; 116 	_io_rc_prev = i;
 268  0012 c70008        	ld	__io_rc_prev,a
 269                     ; 117 	if( i == 0 )
 271  0015 7b01          	ld	a,(OFST+0,sp)
 272  0017 261e          	jrne	L17
 273                     ; 119 		_io_buf[_io_head] = ___k;
 275  0019 c60003        	ld	a,__io_head
 276  001c 5f            	clrw	x
 277  001d 97            	ld	xl,a
 278  001e c60005        	ld	a,____k
 279  0021 d70041        	ld	(__io_buf,x),a
 280                     ; 120 		_io_head += 1;
 282  0024 725c0003      	inc	__io_head
 283                     ; 121 		if( _io_head == _IO_BUF_SIZE )
 285  0028 c60003        	ld	a,__io_head
 286  002b a130          	cp	a,#48
 287  002d 2604          	jrne	L37
 288                     ; 122 			_io_head = 0;
 290  002f 725f0003      	clr	__io_head
 291  0033               L37:
 292                     ; 123 		___k = 0;
 294  0033 725f0005      	clr	____k
 295  0037               L17:
 296                     ; 129 }
 299  0037 84            	pop	a
 300  0038 81            	ret	
 323                     ; 131 void	_swuartCb(void)
 323                     ; 132 {
 324                     .text:	section	.text,new
 325  0000               __swuartCb:
 329                     ; 171 }
 332  0000 81            	ret	
 367                     ; 173 void	swuart_Write(uint8_t *p, uint8_t size)
 367                     ; 174 {
 368                     .text:	section	.text,new
 369  0000               _swuart_Write:
 373                     ; 184 }
 376  0000 81            	ret	
 399                     ; 190 void	timer485Cntl(void)
 399                     ; 191 {
 400                     .text:	section	.text,new
 401  0000               _timer485Cntl:
 405                     ; 237 }
 408  0000 81            	ret	
 442                     ; 241 void	timer4_UpdateCb(void)
 442                     ; 242 {
 443                     .text:	section	.text,new
 444  0000               _timer4_UpdateCb:
 448                     ; 243 	_iouart_50ms();
 450  0000 cd0000        	call	__iouart_50ms
 452                     ; 252 	___k++;
 454  0003 725c0005      	inc	____k
 455                     ; 253 	if( timer50usCount == 0 )
 457  0007 725d0000      	tnz	_timer50usCount
 458  000b 2703cc00ee    	jrne	L341
 459                     ; 261 		timer50usCount = 1;
 461  0010 35010000      	mov	_timer50usCount,#1
 462                     ; 262 		timer100usCount++;
 464  0014 725c0001      	inc	_timer100usCount
 465                     ; 263 		if( timer100usCount == 100 )
 467  0018 c60001        	ld	a,_timer100usCount
 468  001b a164          	cp	a,#100
 469  001d 2703cc0100    	jrne	L712
 470                     ; 265 			_t20ms++;	//	10ms
 472  0022 725c0002      	inc	__t20ms
 473                     ; 266 			if( _t20ms == 100 )
 475  0026 c60002        	ld	a,__t20ms
 476  0029 a164          	cp	a,#100
 477  002b 2604          	jrne	L741
 478                     ; 267 				_t20ms = 0;
 480  002d 725f0002      	clr	__t20ms
 481  0031               L741:
 482                     ; 268 			timer100usCount = 0;
 484  0031 725f0001      	clr	_timer100usCount
 485                     ; 270 			if( beepEnable == 1 )
 487  0035 c60007        	ld	a,_beepEnable
 488  0038 4a            	dec	a
 489  0039 260f          	jrne	L151
 490                     ; 272 				D_IO_LOW(GPIOC, GPIO_Pin_5);
 492  003b 721b500a      	bres	20490,#5
 493                     ; 273 				beepEnable = 14;
 495  003f 350e0007      	mov	_beepEnable,#14
 496                     ; 274 				BEEP_Cmd(ENABLE);
 498  0043 4c            	inc	a
 499  0044 cd0000        	call	_BEEP_Cmd
 502  0047 cc0100        	jra	L712
 503  004a               L151:
 504                     ; 276 			else if( beepEnable == 14 )
 506  004a c60007        	ld	a,_beepEnable
 507  004d a10e          	cp	a,#14
 508  004f 2615          	jrne	L551
 509                     ; 278 				beepCount--;
 511  0051 725a0006      	dec	_beepCount
 512                     ; 279 				if( beepCount == 1 )
 514  0055 c60006        	ld	a,_beepCount
 515  0058 4a            	dec	a
 516  0059 26ec          	jrne	L712
 517                     ; 281 					beepCount = BEEP_COUNT;
 519  005b 35ff0006      	mov	_beepCount,#255
 520                     ; 282 					beepEnable = 2;
 522  005f 35020007      	mov	_beepEnable,#2
 523  0063 cc0100        	jra	L712
 524  0066               L551:
 525                     ; 285 			else if( beepEnable == 2 )
 527  0066 c60007        	ld	a,_beepEnable
 528  0069 a102          	cp	a,#2
 529  006b 2615          	jrne	L361
 530                     ; 287 				beepCount--;
 532  006d 725a0006      	dec	_beepCount
 533                     ; 288 				if( beepCount == BEEP_COUNT-6 )
 535  0071 c60006        	ld	a,_beepCount
 536  0074 a1f9          	cp	a,#249
 537  0076 26eb          	jrne	L712
 538                     ; 290 					D_IO_HIGH(GPIOC, GPIO_Pin_5);
 540  0078 721a500a      	bset	20490,#5
 541                     ; 292 					beepEnable = 3;
 543  007c 35030007      	mov	_beepEnable,#3
 544  0080 207e          	jra	L712
 545  0082               L361:
 546                     ; 295 			else if( beepEnable == 3 )
 548  0082 c60007        	ld	a,_beepEnable
 549  0085 a103          	cp	a,#3
 550  0087 2614          	jrne	L171
 551                     ; 297 				beepCount--;
 553  0089 725a0006      	dec	_beepCount
 554                     ; 298 				if( beepCount == 0 )
 556  008d 725d0006      	tnz	_beepCount
 557  0091 266d          	jrne	L712
 558                     ; 300 					beepCount = BEEP_COUNT;
 560  0093 35ff0006      	mov	_beepCount,#255
 561                     ; 301 					beepEnable = 4;
 563  0097 35040007      	mov	_beepEnable,#4
 564  009b 2063          	jra	L712
 565  009d               L171:
 566                     ; 304 			else if( beepEnable == 4 )
 568  009d c60007        	ld	a,_beepEnable
 569  00a0 a104          	cp	a,#4
 570  00a2 2614          	jrne	L771
 571                     ; 306 				beepCount--;
 573  00a4 725a0006      	dec	_beepCount
 574                     ; 307 				if( beepCount == 0 )
 576  00a8 725d0006      	tnz	_beepCount
 577  00ac 2652          	jrne	L712
 578                     ; 309 					beepCount = BEEP_COUNT;
 580  00ae 35ff0006      	mov	_beepCount,#255
 581                     ; 310 					beepEnable = 5;
 583  00b2 35050007      	mov	_beepEnable,#5
 584  00b6 2048          	jra	L712
 585  00b8               L771:
 586                     ; 313 			else if( beepEnable == 5 )
 588  00b8 c60007        	ld	a,_beepEnable
 589  00bb a105          	cp	a,#5
 590  00bd 2614          	jrne	L502
 591                     ; 315 				beepCount--;
 593  00bf 725a0006      	dec	_beepCount
 594                     ; 316 				if( beepCount == 0 )
 596  00c3 725d0006      	tnz	_beepCount
 597  00c7 2637          	jrne	L712
 598                     ; 318 					beepCount = BEEP_COUNT;
 600  00c9 35ff0006      	mov	_beepCount,#255
 601                     ; 319 					beepEnable = 6;
 603  00cd 35060007      	mov	_beepEnable,#6
 604  00d1 202d          	jra	L712
 605  00d3               L502:
 606                     ; 322 			else if( beepEnable == 6 )
 608  00d3 c60007        	ld	a,_beepEnable
 609  00d6 a106          	cp	a,#6
 610  00d8 2626          	jrne	L712
 611                     ; 324 				beepCount--;
 613  00da 725a0006      	dec	_beepCount
 614                     ; 325 				if( beepCount == 0 )
 616  00de 725d0006      	tnz	_beepCount
 617  00e2 261c          	jrne	L712
 618                     ; 327 					BEEP_Cmd(DISABLE);
 620  00e4 4f            	clr	a
 621  00e5 cd0000        	call	_BEEP_Cmd
 623                     ; 328 					beepEnable = 0;
 625  00e8 725f0007      	clr	_beepEnable
 626  00ec 2012          	jra	L712
 627  00ee               L341:
 628                     ; 356 		timer50usCount = 0;
 630  00ee 725f0000      	clr	_timer50usCount
 631                     ; 357 		if( indiIOUartSendWait != 0 )
 633  00f2 ce0000        	ldw	x,_indiIOUartSendWait
 634  00f5 2706          	jreq	L122
 635                     ; 358 			indiIOUartSendWait--;
 637  00f7 5a            	decw	x
 638  00f8 cf0000        	ldw	_indiIOUartSendWait,x
 640  00fb 2003          	jra	L712
 641  00fd               L122:
 642                     ; 360 			iouart_Write();
 644  00fd cd0000        	call	_iouart_Write
 646  0100               L712:
 647                     ; 374 	__rcCb();
 650                     ; 376 }
 653  0100 cc0000        	jp	___rcCb
 656                     	switch	.data
 657  000d               ___timer100ms:
 658  000d 00            	dc.b	0
 659  000e               ___timer1s:
 660  000e 00            	dc.b	0
 661  000f               ___timer1sa:
 662  000f 00            	dc.b	0
 663  0010               ___timer1min:
 664  0010 00            	dc.b	0
 665  0011               ___timer1h:
 666  0011 00            	dc.b	0
 667  0012               ___timeri:
 668  0012 00            	dc.b	0
 669  0013               ___timeri2:
 670  0013 00            	dc.b	0
 671  0014               ___timerOffset:
 672  0014 3c            	dc.b	60
 706                     ; 389 uint8_t	timerCalc2(void)
 706                     ; 390 {
 707                     .text:	section	.text,new
 708  0000               _timerCalc2:
 710  0000 88            	push	a
 711       00000001      OFST:	set	1
 714                     ; 391 	uint8_t	r = 0;
 716                     ; 392 	__timer1sa++;
 718  0001 725c000f      	inc	___timer1sa
 719                     ; 393 	if( __timer1sa != __timerOffset )
 721  0005 c6000f        	ld	a,___timer1sa
 722  0008 c10014        	cp	a,___timerOffset
 723  000b 2704          	jreq	L142
 724                     ; 394 		return r;
 726  000d 4f            	clr	a
 729  000e 5b01          	addw	sp,#1
 730  0010 81            	ret	
 731  0011               L142:
 732                     ; 396 	__timerOffset = __timerOffset==60 ? 59 : 60;
 734  0011 c60014        	ld	a,___timerOffset
 735  0014 a13c          	cp	a,#60
 736  0016 2604          	jrne	L24
 737  0018 a63b          	ld	a,#59
 738  001a 2002          	jra	L44
 739  001c               L24:
 740  001c a63c          	ld	a,#60
 741  001e               L44:
 742  001e c70014        	ld	___timerOffset,a
 743                     ; 397 	__timer1sa = 0;
 745  0021 725f000f      	clr	___timer1sa
 746                     ; 398 	__timer1min++;
 748  0025 725c0010      	inc	___timer1min
 749                     ; 399 	r = 1;
 751                     ; 400 	if( __timer1min != 60 )
 753  0029 c60010        	ld	a,___timer1min
 754  002c a13c          	cp	a,#60
 755  002e 2705          	jreq	L342
 756                     ; 401 		return r;
 758  0030 a601          	ld	a,#1
 761  0032 5b01          	addw	sp,#1
 762  0034 81            	ret	
 763  0035               L342:
 764                     ; 403 	__timer1min = 0;
 766  0035 725f0010      	clr	___timer1min
 767                     ; 404 	__timer1h++;
 769  0039 725c0011      	inc	___timer1h
 770                     ; 405 	if( __timer1h == 24 )
 772  003d c60011        	ld	a,___timer1h
 773  0040 a118          	cp	a,#24
 774  0042 2604          	jrne	L542
 775                     ; 406 		__timer1h = 0;
 777  0044 725f0011      	clr	___timer1h
 778  0048               L542:
 779                     ; 408 	return r;
 781  0048 a601          	ld	a,#1
 784  004a 5b01          	addw	sp,#1
 785  004c 81            	ret	
 788                     	switch	.data
 789  0015               __timer100ms255:
 790  0015 00            	dc.b	0
 833                     ; 411 uint8_t	timerCalc(void)
 833                     ; 412 {
 834                     .text:	section	.text,new
 835  0000               _timerCalc:
 837  0000 89            	pushw	x
 838       00000002      OFST:	set	2
 841                     ; 414 	uint8_t	r = 0;
 843  0001 0f02          	clr	(OFST+0,sp)
 844                     ; 416 	uint8_t	i = _t20ms/10;
 846  0003 c60002        	ld	a,__t20ms
 847  0006 5f            	clrw	x
 848  0007 97            	ld	xl,a
 849  0008 a60a          	ld	a,#10
 850  000a 62            	div	x,a
 851  000b 9f            	ld	a,xl
 852  000c 6b01          	ld	(OFST-1,sp),a
 853                     ; 417 	if( __timeri != i )
 855  000e c60012        	ld	a,___timeri
 856  0011 1101          	cp	a,(OFST-1,sp)
 857  0013 2733          	jreq	L25
 858                     ; 419 		__timeri = i;
 860  0015 7b01          	ld	a,(OFST-1,sp)
 861  0017 c70012        	ld	___timeri,a
 862                     ; 420 		__timer100ms++;
 864  001a 725c000d      	inc	___timer100ms
 865                     ; 421 		_timer100ms255++;
 867  001e 725c0015      	inc	__timer100ms255
 868                     ; 422 		if( _timer100ms255 == 200 )
 870  0022 c60015        	ld	a,__timer100ms255
 871  0025 a1c8          	cp	a,#200
 872  0027 2604          	jrne	L762
 873                     ; 423 			_timer100ms255 = 0;
 875  0029 725f0015      	clr	__timer100ms255
 876  002d               L762:
 877                     ; 424 		if( __timer100ms != 10 )
 879  002d c6000d        	ld	a,___timer100ms
 880  0030 a10a          	cp	a,#10
 881                     ; 425 			return r;
 883  0032 2614          	jrne	L25
 884                     ; 427 		__timer100ms = 0;
 886  0034 725f000d      	clr	___timer100ms
 887                     ; 428 		__timer1s++;
 889  0038 725c000e      	inc	___timer1s
 890                     ; 429 		r = timerCalc2();
 892  003c cd0000        	call	_timerCalc2
 894  003f 6b02          	ld	(OFST+0,sp),a
 895                     ; 430 		if( __timer1s != 60 )
 897  0041 c6000e        	ld	a,___timer1s
 898  0044 a13c          	cp	a,#60
 899  0046 2704          	jreq	L372
 900                     ; 431 			return r;
 903  0048               L25:
 906  0048 7b02          	ld	a,(OFST+0,sp)
 908  004a 85            	popw	x
 909  004b 81            	ret	
 910  004c               L372:
 911                     ; 433 		__timer1s = 0;
 913  004c 725f000e      	clr	___timer1s
 914                     ; 435 	return r;
 916  0050 20f6          	jra	L25
 944                     ; 445 void	systemTimer(void)
 944                     ; 446 {
 945                     .text:	section	.text,new
 946  0000               _systemTimer:
 950                     ; 460 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 952  0000 ae0201        	ldw	x,#513
 953  0003 cd0000        	call	_CLK_PeripheralClockConfig
 955                     ; 461 	TIM4_TimeBaseInit(TIM4_Prescaler_32, TIMER_PERIOD);
 957  0006 ae0518        	ldw	x,#1304
 958  0009 cd0000        	call	_TIM4_TimeBaseInit
 960                     ; 462 	TIM4_ClearFlag(TIM4_FLAG_Update);
 962  000c a601          	ld	a,#1
 963  000e cd0000        	call	_TIM4_ClearFlag
 965                     ; 463 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 967  0011 ae0101        	ldw	x,#257
 968  0014 cd0000        	call	_TIM4_ITConfig
 970                     ; 464 	TIM4_Cmd(ENABLE);
 972  0017 a601          	ld	a,#1
 974                     ; 515 }
 977  0019 cc0000        	jp	_TIM4_Cmd
1009                     ; 517 void	timer2Cntl(uint8_t mode)
1009                     ; 518 {
1010                     .text:	section	.text,new
1011  0000               _timer2Cntl:
1015                     ; 522 	return;
1018  0000 81            	ret	
1256                     	xdef	__timer100ms255
1257                     	xdef	_timerCalc2
1258                     	xdef	___timerOffset
1259                     	xdef	___timeri2
1260                     	xdef	___timeri
1261                     	xdef	___timer1sa
1262                     	xref	__iouart_50ms
1263                     	xdef	_timer485Cntl
1264                     	xdef	__swuartCb
1265                     	xdef	__sw_sending
1266                     	xdef	__sw_bit
1267                     	switch	.bss
1268  0000               __sw_data:
1269  0000 00            	ds.b	1
1270                     	xdef	__sw_data
1271                     	xdef	__swuart_tx_tail
1272                     	xdef	__swuart_tx_head
1273  0001               _swTxBuffer:
1274  0001 000000000000  	ds.b	64
1275                     	xdef	_swTxBuffer
1276                     	xref	___rcCb
1277                     	xdef	__io_rc_prev
1278                     	xdef	_beepSet
1279                     	xdef	_beepEnable
1280                     	xdef	_beepCount
1281                     	xdef	____k
1282                     	xdef	_swuart_Write
1283                     	xdef	_timer1CiCb
1284                     	xdef	_timerCalc
1285                     	xdef	_timer2CiCb
1286                     	xdef	_timer4_UpdateCb
1287                     	xdef	_systemTimer
1288                     	xdef	___timer1h
1289                     	xdef	___timer1min
1290                     	xdef	___timer1s
1291                     	xdef	___timer100ms
1292                     	xdef	__t20ms
1293                     	xdef	_timer50usCount
1294                     	xdef	_timer100usCount
1295  0041               __io_buf:
1296  0041 000000000000  	ds.b	48
1297                     	xdef	__io_buf
1298                     	xdef	__io_tail
1299                     	xdef	__io_head
1300                     	xref	_iouart_Write
1301                     	xdef	_timer2Cntl
1302                     	xref	_indiIOUartIdle
1303                     	xref	_indiIOUartSendWait
1304                     	xdef	_timer2_UpdateCb
1305                     	xref	_TIM4_ClearFlag
1306                     	xref	_TIM4_ITConfig
1307                     	xref	_TIM4_Cmd
1308                     	xref	_TIM4_TimeBaseInit
1309                     	xref	_GPIO_ReadInputData
1310                     	xref	_CLK_PeripheralClockConfig
1311                     	xref	_BEEP_Cmd
1331                     	end
