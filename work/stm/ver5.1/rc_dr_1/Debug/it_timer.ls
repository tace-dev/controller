   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
  39  0008               ___beep_enable:
  40  0008 00            	dc.b	0
  86                     ; 23 void	beepSet(uint8_t i)
  86                     ; 24 {
  88                     .text:	section	.text,new
  89  0000               _beepSet:
  93                     ; 25 	if( __beep_enable == 0 )
  95  0000 c60008        	ld	a,___beep_enable
  96  0003 2626          	jrne	L52
  97                     ; 27 		__beep_enable = 1;
  99  0005 35010008      	mov	___beep_enable,#1
 100                     ; 29 		CFG-> GCR |= CFG_GCR_SWD;
 102  0009 72107f60      	bset	32608,#0
 103                     ; 30 		CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, ENABLE);
 105  000d ae0601        	ldw	x,#1537
 106  0010 cd0000        	call	_CLK_PeripheralClockConfig
 108                     ; 31 		CLK_BEEPClockConfig(CLK_BEEPCLKSource_LSI);
 110  0013 a602          	ld	a,#2
 111  0015 cd0000        	call	_CLK_BEEPClockConfig
 113                     ; 33 		BEEP_LSICalibrationConfig( 38000+801+801  );
 115  0018 ae9ab2        	ldw	x,#39602
 116  001b 89            	pushw	x
 117  001c 5f            	clrw	x
 118  001d 89            	pushw	x
 119  001e cd0000        	call	_BEEP_LSICalibrationConfig
 121  0021 5b04          	addw	sp,#4
 122                     ; 35 		BEEP_Init(BEEP_Frequency_1KHz);
 124  0023 4f            	clr	a
 125  0024 cd0000        	call	_BEEP_Init
 127                     ; 36 		BEEP_Cmd(DISABLE);
 129  0027 4f            	clr	a
 130  0028 cd0000        	call	_BEEP_Cmd
 132  002b               L52:
 133                     ; 42 	beepCount =5;
 135  002b 35050006      	mov	_beepCount,#5
 136                     ; 43 	beepEnable = 1;
 138  002f 35010007      	mov	_beepEnable,#1
 139                     ; 44 }
 142  0033 81            	ret	
 145                     	switch	.data
 146  0009               __io_rc_prev:
 147  0009 02            	dc.b	2
 148  000a               __swuart_tx_head:
 149  000a 00            	dc.b	0
 150  000b               __swuart_tx_tail:
 151  000b 00            	dc.b	0
 152  000c               __sw_bit:
 153  000c 00            	dc.b	0
 154  000d               __sw_sending:
 155  000d 00            	dc.b	0
 176                     ; 108 void	timer1CiCb(void)
 176                     ; 109 {	
 177                     .text:	section	.text,new
 178  0000               _timer1CiCb:
 182                     ; 120 }
 185  0000 81            	ret	
 212                     ; 122 void	timer2CiCb(void)
 212                     ; 123 {	
 213                     .text:	section	.text,new
 214  0000               _timer2CiCb:
 218                     ; 124 	if( indiIOUartIdle == 0 )
 220  0000 c60000        	ld	a,_indiIOUartIdle
 221  0003 2624          	jrne	L74
 222                     ; 126 		if( ___k != 0 )
 224  0005 725d0005      	tnz	____k
 225  0009 271e          	jreq	L74
 226                     ; 128 			_io_buf[_io_head++] = ___k;
 228  000b c60003        	ld	a,__io_head
 229  000e 725c0003      	inc	__io_head
 230  0012 5f            	clrw	x
 231  0013 97            	ld	xl,a
 232  0014 c60005        	ld	a,____k
 233  0017 d70041        	ld	(__io_buf,x),a
 234                     ; 129 			if( _io_head == _IO_BUF_SIZE )
 236  001a c60003        	ld	a,__io_head
 237  001d a130          	cp	a,#48
 238  001f 2604          	jrne	L35
 239                     ; 130 				_io_head = 0;
 241  0021 725f0003      	clr	__io_head
 242  0025               L35:
 243                     ; 131 			___k = 0;
 245  0025 725f0005      	clr	____k
 246  0029               L74:
 247                     ; 134 }
 250  0029 81            	ret	
 287                     ; 136 void	timer2_UpdateCb(void)
 287                     ; 137 {
 288                     .text:	section	.text,new
 289  0000               _timer2_UpdateCb:
 291  0000 88            	push	a
 292       00000001      OFST:	set	1
 295                     ; 141 	i = GPIO_ReadInputData(D_IOUART_RX_PORT);
 297  0001 ae500f        	ldw	x,#20495
 298  0004 cd0000        	call	_GPIO_ReadInputData
 301                     ; 142 	i = i & D_IOUART_RX_PIN;
 303  0007 a420          	and	a,#32
 304  0009 6b01          	ld	(OFST+0,sp),a
 306                     ; 143 	if( i == _io_rc_prev )
 308  000b c10009        	cp	a,__io_rc_prev
 309  000e 2602          	jrne	L17
 310                     ; 144 		return;
 313  0010 84            	pop	a
 314  0011 81            	ret	
 315  0012               L17:
 316                     ; 146 	_io_rc_prev = i;
 318  0012 c70009        	ld	__io_rc_prev,a
 319                     ; 147 	if( i == 0 )
 321  0015 7b01          	ld	a,(OFST+0,sp)
 322  0017 261e          	jrne	L37
 323                     ; 149 		_io_buf[_io_head] = ___k;
 325  0019 c60003        	ld	a,__io_head
 326  001c 5f            	clrw	x
 327  001d 97            	ld	xl,a
 328  001e c60005        	ld	a,____k
 329  0021 d70041        	ld	(__io_buf,x),a
 330                     ; 150 		_io_head += 1;
 332  0024 725c0003      	inc	__io_head
 333                     ; 151 		if( _io_head == _IO_BUF_SIZE )
 335  0028 c60003        	ld	a,__io_head
 336  002b a130          	cp	a,#48
 337  002d 2604          	jrne	L57
 338                     ; 152 			_io_head = 0;
 340  002f 725f0003      	clr	__io_head
 341  0033               L57:
 342                     ; 153 		___k = 0;
 344  0033 725f0005      	clr	____k
 345  0037               L37:
 346                     ; 159 }
 349  0037 84            	pop	a
 350  0038 81            	ret	
 373                     ; 161 void	_swuartCb(void)
 373                     ; 162 {
 374                     .text:	section	.text,new
 375  0000               __swuartCb:
 379                     ; 202 }
 382  0000 81            	ret	
 417                     ; 204 void	swuart_Write(uint8_t *p, uint8_t size)
 417                     ; 205 {
 418                     .text:	section	.text,new
 419  0000               _swuart_Write:
 423                     ; 216 }
 426  0000 81            	ret	
 449                     ; 222 void	timer485Cntl(void)
 449                     ; 223 {
 450                     .text:	section	.text,new
 451  0000               _timer485Cntl:
 455                     ; 282 }
 458  0000 81            	ret	
 492                     ; 286 void	timer4_UpdateCb(void)
 492                     ; 287 {
 493                     .text:	section	.text,new
 494  0000               _timer4_UpdateCb:
 498                     ; 288 	_iouart_50ms();
 500  0000 cd0000        	call	__iouart_50ms
 502                     ; 302 	___k++;
 504  0003 725c0005      	inc	____k
 505                     ; 303 	if( timer50usCount == 0 )
 507  0007 725d0000      	tnz	_timer50usCount
 508  000b 2703cc00ee    	jrne	L541
 509                     ; 311 		timer50usCount = 1;
 511  0010 35010000      	mov	_timer50usCount,#1
 512                     ; 312 		timer100usCount++;
 514  0014 725c0001      	inc	_timer100usCount
 515                     ; 313 		if( timer100usCount == 100 )
 517  0018 c60001        	ld	a,_timer100usCount
 518  001b a164          	cp	a,#100
 519  001d 2703cc0100    	jrne	L122
 520                     ; 315 			_t20ms++;	//	10ms
 522  0022 725c0002      	inc	__t20ms
 523                     ; 316 			if( _t20ms == 100 )
 525  0026 c60002        	ld	a,__t20ms
 526  0029 a164          	cp	a,#100
 527  002b 2604          	jrne	L151
 528                     ; 317 				_t20ms = 0;
 530  002d 725f0002      	clr	__t20ms
 531  0031               L151:
 532                     ; 318 			timer100usCount = 0;
 534  0031 725f0001      	clr	_timer100usCount
 535                     ; 320 			if( beepEnable == 1 )
 537  0035 c60007        	ld	a,_beepEnable
 538  0038 4a            	dec	a
 539  0039 260f          	jrne	L351
 540                     ; 322 				D_IO_LOW(GPIOC, GPIO_Pin_5);
 542  003b 721b500a      	bres	20490,#5
 543                     ; 323 				beepEnable = 14;
 545  003f 350e0007      	mov	_beepEnable,#14
 546                     ; 324 				BEEP_Cmd(ENABLE);
 548  0043 4c            	inc	a
 549  0044 cd0000        	call	_BEEP_Cmd
 552  0047 cc0100        	jra	L122
 553  004a               L351:
 554                     ; 326 			else if( beepEnable == 14 )
 556  004a c60007        	ld	a,_beepEnable
 557  004d a10e          	cp	a,#14
 558  004f 2615          	jrne	L751
 559                     ; 328 				beepCount--;
 561  0051 725a0006      	dec	_beepCount
 562                     ; 329 				if( beepCount == 1 )
 564  0055 c60006        	ld	a,_beepCount
 565  0058 4a            	dec	a
 566  0059 26ec          	jrne	L122
 567                     ; 331 					beepCount = BEEP_COUNT;
 569  005b 35ff0006      	mov	_beepCount,#255
 570                     ; 332 					beepEnable = 2;
 572  005f 35020007      	mov	_beepEnable,#2
 573  0063 cc0100        	jra	L122
 574  0066               L751:
 575                     ; 335 			else if( beepEnable == 2 )
 577  0066 c60007        	ld	a,_beepEnable
 578  0069 a102          	cp	a,#2
 579  006b 2615          	jrne	L561
 580                     ; 337 				beepCount--;
 582  006d 725a0006      	dec	_beepCount
 583                     ; 338 				if( beepCount == BEEP_COUNT-6 )
 585  0071 c60006        	ld	a,_beepCount
 586  0074 a1f9          	cp	a,#249
 587  0076 26eb          	jrne	L122
 588                     ; 340 					D_IO_HIGH(GPIOC, GPIO_Pin_5);
 590  0078 721a500a      	bset	20490,#5
 591                     ; 342 					beepEnable = 3;
 593  007c 35030007      	mov	_beepEnable,#3
 594  0080 207e          	jra	L122
 595  0082               L561:
 596                     ; 345 			else if( beepEnable == 3 )
 598  0082 c60007        	ld	a,_beepEnable
 599  0085 a103          	cp	a,#3
 600  0087 2614          	jrne	L371
 601                     ; 347 				beepCount--;
 603  0089 725a0006      	dec	_beepCount
 604                     ; 348 				if( beepCount == 0 )
 606  008d 725d0006      	tnz	_beepCount
 607  0091 266d          	jrne	L122
 608                     ; 350 					beepCount = BEEP_COUNT;
 610  0093 35ff0006      	mov	_beepCount,#255
 611                     ; 351 					beepEnable = 4;
 613  0097 35040007      	mov	_beepEnable,#4
 614  009b 2063          	jra	L122
 615  009d               L371:
 616                     ; 354 			else if( beepEnable == 4 )
 618  009d c60007        	ld	a,_beepEnable
 619  00a0 a104          	cp	a,#4
 620  00a2 2614          	jrne	L102
 621                     ; 356 				beepCount--;
 623  00a4 725a0006      	dec	_beepCount
 624                     ; 357 				if( beepCount == 0 )
 626  00a8 725d0006      	tnz	_beepCount
 627  00ac 2652          	jrne	L122
 628                     ; 359 					beepCount = BEEP_COUNT;
 630  00ae 35ff0006      	mov	_beepCount,#255
 631                     ; 360 					beepEnable = 5;
 633  00b2 35050007      	mov	_beepEnable,#5
 634  00b6 2048          	jra	L122
 635  00b8               L102:
 636                     ; 363 			else if( beepEnable == 5 )
 638  00b8 c60007        	ld	a,_beepEnable
 639  00bb a105          	cp	a,#5
 640  00bd 2614          	jrne	L702
 641                     ; 365 				beepCount--;
 643  00bf 725a0006      	dec	_beepCount
 644                     ; 366 				if( beepCount == 0 )
 646  00c3 725d0006      	tnz	_beepCount
 647  00c7 2637          	jrne	L122
 648                     ; 368 					beepCount = BEEP_COUNT;
 650  00c9 35ff0006      	mov	_beepCount,#255
 651                     ; 369 					beepEnable = 6;
 653  00cd 35060007      	mov	_beepEnable,#6
 654  00d1 202d          	jra	L122
 655  00d3               L702:
 656                     ; 372 			else if( beepEnable == 6 )
 658  00d3 c60007        	ld	a,_beepEnable
 659  00d6 a106          	cp	a,#6
 660  00d8 2626          	jrne	L122
 661                     ; 374 				beepCount--;
 663  00da 725a0006      	dec	_beepCount
 664                     ; 375 				if( beepCount == 0 )
 666  00de 725d0006      	tnz	_beepCount
 667  00e2 261c          	jrne	L122
 668                     ; 377 					BEEP_Cmd(DISABLE);
 670  00e4 4f            	clr	a
 671  00e5 cd0000        	call	_BEEP_Cmd
 673                     ; 378 					beepEnable = 0;
 675  00e8 725f0007      	clr	_beepEnable
 676  00ec 2012          	jra	L122
 677  00ee               L541:
 678                     ; 416 		timer50usCount = 0;
 680  00ee 725f0000      	clr	_timer50usCount
 681                     ; 417 		if( indiIOUartSendWait != 0 )
 683  00f2 ce0000        	ldw	x,_indiIOUartSendWait
 684  00f5 2706          	jreq	L322
 685                     ; 418 			indiIOUartSendWait--;
 687  00f7 5a            	decw	x
 688  00f8 cf0000        	ldw	_indiIOUartSendWait,x
 690  00fb 2003          	jra	L122
 691  00fd               L322:
 692                     ; 420 			iouart_Write();
 694  00fd cd0000        	call	_iouart_Write
 696  0100               L122:
 697                     ; 445 	__rcCb();
 700                     ; 447 }
 703  0100 cc0000        	jp	___rcCb
 706                     	switch	.data
 707  000e               ___timer100ms:
 708  000e 00            	dc.b	0
 709  000f               ___timer1s:
 710  000f 00            	dc.b	0
 711  0010               ___timer1sa:
 712  0010 00            	dc.b	0
 713  0011               ___timer1min:
 714  0011 00            	dc.b	0
 715  0012               ___timer1h:
 716  0012 00            	dc.b	0
 717  0013               ___timeri:
 718  0013 00            	dc.b	0
 719  0014               ___timeri2:
 720  0014 00            	dc.b	0
 721  0015               ___timerOffset:
 722  0015 3c            	dc.b	60
 756                     ; 460 uint8_t	timerCalc2(void)
 756                     ; 461 {
 757                     .text:	section	.text,new
 758  0000               _timerCalc2:
 760       00000001      OFST:	set	1
 763                     ; 462 	uint8_t	r = 0;
 765                     ; 463 	__timer1sa++;
 767  0000 725c0010      	inc	___timer1sa
 768                     ; 464 	if( __timer1sa != __timerOffset )
 770  0004 c60010        	ld	a,___timer1sa
 771  0007 c10015        	cp	a,___timerOffset
 772  000a 2702          	jreq	L342
 773                     ; 465 		return r;
 775  000c 4f            	clr	a
 778  000d 81            	ret	
 779  000e               L342:
 780                     ; 467 	__timerOffset = __timerOffset==60 ? 59 : 60;
 782  000e c60015        	ld	a,___timerOffset
 783  0011 a13c          	cp	a,#60
 784  0013 2604          	jrne	L45
 785  0015 a63b          	ld	a,#59
 786  0017 2002          	jra	L65
 787  0019               L45:
 788  0019 a63c          	ld	a,#60
 789  001b               L65:
 790  001b c70015        	ld	___timerOffset,a
 791                     ; 468 	__timer1sa = 0;
 793  001e 725f0010      	clr	___timer1sa
 794                     ; 469 	__timer1min++;
 796  0022 725c0011      	inc	___timer1min
 797                     ; 470 	r = 1;
 799                     ; 471 	if( __timer1min != 60 )
 801  0026 c60011        	ld	a,___timer1min
 802  0029 a13c          	cp	a,#60
 803  002b 2703          	jreq	L542
 804                     ; 472 		return r;
 806  002d a601          	ld	a,#1
 809  002f 81            	ret	
 810  0030               L542:
 811                     ; 474 	__timer1min = 0;
 813  0030 725f0011      	clr	___timer1min
 814                     ; 475 	__timer1h++;
 816  0034 725c0012      	inc	___timer1h
 817                     ; 476 	if( __timer1h == 24 )
 819  0038 c60012        	ld	a,___timer1h
 820  003b a118          	cp	a,#24
 821  003d 2604          	jrne	L742
 822                     ; 477 		__timer1h = 0;
 824  003f 725f0012      	clr	___timer1h
 825  0043               L742:
 826                     ; 479 	return r;
 828  0043 a601          	ld	a,#1
 831  0045 81            	ret	
 834                     	switch	.data
 835  0016               __timer100ms255:
 836  0016 00            	dc.b	0
 879                     ; 482 uint8_t	timerCalc(void)
 879                     ; 483 {
 880                     .text:	section	.text,new
 881  0000               _timerCalc:
 883  0000 89            	pushw	x
 884       00000002      OFST:	set	2
 887                     ; 485 	uint8_t	r = 0;
 889  0001 0f02          	clr	(OFST+0,sp)
 891                     ; 487 	uint8_t	i = _t20ms/10;
 893  0003 c60002        	ld	a,__t20ms
 894  0006 5f            	clrw	x
 895  0007 97            	ld	xl,a
 896  0008 a60a          	ld	a,#10
 897  000a 62            	div	x,a
 898  000b 9f            	ld	a,xl
 899  000c 6b01          	ld	(OFST-1,sp),a
 901                     ; 488 	if( __timeri != i )
 903  000e c60013        	ld	a,___timeri
 904  0011 1101          	cp	a,(OFST-1,sp)
 905  0013 2733          	jreq	L46
 906                     ; 490 		__timeri = i;
 908  0015 7b01          	ld	a,(OFST-1,sp)
 909  0017 c70013        	ld	___timeri,a
 910                     ; 491 		__timer100ms++;
 912  001a 725c000e      	inc	___timer100ms
 913                     ; 492 		_timer100ms255++;
 915  001e 725c0016      	inc	__timer100ms255
 916                     ; 493 		if( _timer100ms255 == 200 )
 918  0022 c60016        	ld	a,__timer100ms255
 919  0025 a1c8          	cp	a,#200
 920  0027 2604          	jrne	L172
 921                     ; 494 			_timer100ms255 = 0;
 923  0029 725f0016      	clr	__timer100ms255
 924  002d               L172:
 925                     ; 495 		if( __timer100ms != 10 )
 927  002d c6000e        	ld	a,___timer100ms
 928  0030 a10a          	cp	a,#10
 929                     ; 496 			return r;
 931  0032 2614          	jrne	L46
 932                     ; 498 		__timer100ms = 0;
 934  0034 725f000e      	clr	___timer100ms
 935                     ; 499 		__timer1s++;
 937  0038 725c000f      	inc	___timer1s
 938                     ; 500 		r = timerCalc2();
 940  003c cd0000        	call	_timerCalc2
 942  003f 6b02          	ld	(OFST+0,sp),a
 944                     ; 501 		if( __timer1s != 60 )
 946  0041 c6000f        	ld	a,___timer1s
 947  0044 a13c          	cp	a,#60
 948  0046 2704          	jreq	L572
 949                     ; 502 			return r;
 952  0048               L46:
 955  0048 7b02          	ld	a,(OFST+0,sp)
 957  004a 85            	popw	x
 958  004b 81            	ret	
 959  004c               L572:
 960                     ; 504 		__timer1s = 0;
 962  004c 725f000f      	clr	___timer1s
 963                     ; 506 	return r;
 965  0050 20f6          	jra	L46
 993                     ; 516 void	systemTimer(void)
 993                     ; 517 {
 994                     .text:	section	.text,new
 995  0000               _systemTimer:
 999                     ; 531 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
1001  0000 ae0201        	ldw	x,#513
1002  0003 cd0000        	call	_CLK_PeripheralClockConfig
1004                     ; 532 	TIM4_TimeBaseInit(TIM4_Prescaler_32, TIMER_PERIOD);
1006  0006 ae0518        	ldw	x,#1304
1007  0009 cd0000        	call	_TIM4_TimeBaseInit
1009                     ; 533 	TIM4_ClearFlag(TIM4_FLAG_Update);
1011  000c a601          	ld	a,#1
1012  000e cd0000        	call	_TIM4_ClearFlag
1014                     ; 534 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
1016  0011 ae0101        	ldw	x,#257
1017  0014 cd0000        	call	_TIM4_ITConfig
1019                     ; 535 	TIM4_Cmd(ENABLE);
1021  0017 a601          	ld	a,#1
1023                     ; 589 }
1026  0019 cc0000        	jp	_TIM4_Cmd
1058                     ; 591 void	timer2Cntl(uint8_t mode)
1058                     ; 592 {
1059                     .text:	section	.text,new
1060  0000               _timer2Cntl:
1064                     ; 596 	return;
1067  0000 81            	ret	
1312                     	xdef	__timer100ms255
1313                     	xdef	_timerCalc2
1314                     	xdef	___timerOffset
1315                     	xdef	___timeri2
1316                     	xdef	___timeri
1317                     	xdef	___timer1sa
1318                     	xref	__iouart_50ms
1319                     	xdef	_timer485Cntl
1320                     	xdef	__swuartCb
1321                     	xdef	__sw_sending
1322                     	xdef	__sw_bit
1323                     	switch	.bss
1324  0000               __sw_data:
1325  0000 00            	ds.b	1
1326                     	xdef	__sw_data
1327                     	xdef	__swuart_tx_tail
1328                     	xdef	__swuart_tx_head
1329  0001               _swTxBuffer:
1330  0001 000000000000  	ds.b	64
1331                     	xdef	_swTxBuffer
1332                     	xref	___rcCb
1333                     	xdef	__io_rc_prev
1334                     	xdef	_beepSet
1335                     	xdef	___beep_enable
1336                     	xdef	_beepEnable
1337                     	xdef	_beepCount
1338                     	xdef	____k
1339                     	xdef	_swuart_Write
1340                     	xdef	_timer1CiCb
1341                     	xdef	_timerCalc
1342                     	xdef	_timer2CiCb
1343                     	xdef	_timer4_UpdateCb
1344                     	xdef	_systemTimer
1345                     	xdef	___timer1h
1346                     	xdef	___timer1min
1347                     	xdef	___timer1s
1348                     	xdef	___timer100ms
1349                     	xdef	__t20ms
1350                     	xdef	_timer50usCount
1351                     	xdef	_timer100usCount
1352  0041               __io_buf:
1353  0041 000000000000  	ds.b	48
1354                     	xdef	__io_buf
1355                     	xdef	__io_tail
1356                     	xdef	__io_head
1357                     	xref	_iouart_Write
1358                     	xdef	_timer2Cntl
1359                     	xref	_indiIOUartIdle
1360                     	xref	_indiIOUartSendWait
1361                     	xdef	_timer2_UpdateCb
1362                     	xref	_TIM4_ClearFlag
1363                     	xref	_TIM4_ITConfig
1364                     	xref	_TIM4_Cmd
1365                     	xref	_TIM4_TimeBaseInit
1366                     	xref	_GPIO_ReadInputData
1367                     	xref	_CLK_PeripheralClockConfig
1368                     	xref	_CLK_BEEPClockConfig
1369                     	xref	_BEEP_LSICalibrationConfig
1370                     	xref	_BEEP_Cmd
1371                     	xref	_BEEP_Init
1391                     	end
