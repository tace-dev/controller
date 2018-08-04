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
 176                     ; 101 void	timer1CiCb(void)
 176                     ; 102 {	
 177                     .text:	section	.text,new
 178  0000               _timer1CiCb:
 182                     ; 110 }
 185  0000 81            	ret	
 212                     ; 112 void	timer2CiCb(void)
 212                     ; 113 {	
 213                     .text:	section	.text,new
 214  0000               _timer2CiCb:
 218                     ; 114 	if( indiIOUartIdle == 0 )
 220  0000 c60000        	ld	a,_indiIOUartIdle
 221  0003 2624          	jrne	L74
 222                     ; 116 		if( ___k != 0 )
 224  0005 725d0005      	tnz	____k
 225  0009 271e          	jreq	L74
 226                     ; 118 			_io_buf[_io_head++] = ___k;
 228  000b c60003        	ld	a,__io_head
 229  000e 725c0003      	inc	__io_head
 230  0012 5f            	clrw	x
 231  0013 97            	ld	xl,a
 232  0014 c60005        	ld	a,____k
 233  0017 d70041        	ld	(__io_buf,x),a
 234                     ; 119 			if( _io_head == _IO_BUF_SIZE )
 236  001a c60003        	ld	a,__io_head
 237  001d a130          	cp	a,#48
 238  001f 2604          	jrne	L35
 239                     ; 120 				_io_head = 0;
 241  0021 725f0003      	clr	__io_head
 242  0025               L35:
 243                     ; 121 			___k = 0;
 245  0025 725f0005      	clr	____k
 246  0029               L74:
 247                     ; 124 }
 250  0029 81            	ret	
 287                     ; 126 void	timer2_UpdateCb(void)
 287                     ; 127 {
 288                     .text:	section	.text,new
 289  0000               _timer2_UpdateCb:
 291  0000 88            	push	a
 292       00000001      OFST:	set	1
 295                     ; 131 	i = GPIO_ReadInputData(D_IOUART_RX_PORT);
 297  0001 ae500f        	ldw	x,#20495
 298  0004 cd0000        	call	_GPIO_ReadInputData
 300                     ; 132 	i = i & D_IOUART_RX_PIN;
 302  0007 a420          	and	a,#32
 303  0009 6b01          	ld	(OFST+0,sp),a
 304                     ; 133 	if( i == _io_rc_prev )
 306  000b c10009        	cp	a,__io_rc_prev
 307  000e 2602          	jrne	L17
 308                     ; 134 		return;
 311  0010 84            	pop	a
 312  0011 81            	ret	
 313  0012               L17:
 314                     ; 136 	_io_rc_prev = i;
 316  0012 c70009        	ld	__io_rc_prev,a
 317                     ; 137 	if( i == 0 )
 319  0015 7b01          	ld	a,(OFST+0,sp)
 320  0017 261e          	jrne	L37
 321                     ; 139 		_io_buf[_io_head] = ___k;
 323  0019 c60003        	ld	a,__io_head
 324  001c 5f            	clrw	x
 325  001d 97            	ld	xl,a
 326  001e c60005        	ld	a,____k
 327  0021 d70041        	ld	(__io_buf,x),a
 328                     ; 140 		_io_head += 1;
 330  0024 725c0003      	inc	__io_head
 331                     ; 141 		if( _io_head == _IO_BUF_SIZE )
 333  0028 c60003        	ld	a,__io_head
 334  002b a130          	cp	a,#48
 335  002d 2604          	jrne	L57
 336                     ; 142 			_io_head = 0;
 338  002f 725f0003      	clr	__io_head
 339  0033               L57:
 340                     ; 143 		___k = 0;
 342  0033 725f0005      	clr	____k
 343  0037               L37:
 344                     ; 149 }
 347  0037 84            	pop	a
 348  0038 81            	ret	
 371                     ; 151 void	_swuartCb(void)
 371                     ; 152 {
 372                     .text:	section	.text,new
 373  0000               __swuartCb:
 377                     ; 192 }
 380  0000 81            	ret	
 415                     ; 194 void	swuart_Write(uint8_t *p, uint8_t size)
 415                     ; 195 {
 416                     .text:	section	.text,new
 417  0000               _swuart_Write:
 421                     ; 206 }
 424  0000 81            	ret	
 447                     ; 212 void	timer485Cntl(void)
 447                     ; 213 {
 448                     .text:	section	.text,new
 449  0000               _timer485Cntl:
 453                     ; 272 }
 456  0000 81            	ret	
 487                     ; 276 void	timer4_UpdateCb(void)
 487                     ; 277 {
 488                     .text:	section	.text,new
 489  0000               _timer4_UpdateCb:
 493                     ; 278 	_iouart_50ms();
 495  0000 cd0000        	call	__iouart_50ms
 497                     ; 287 	___k++;
 499  0003 725c0005      	inc	____k
 500                     ; 288 	if( timer50usCount == 0 )
 502  0007 725d0000      	tnz	_timer50usCount
 503  000b 2624          	jrne	L541
 504                     ; 296 		timer50usCount = 1;
 506  000d 35010000      	mov	_timer50usCount,#1
 507                     ; 297 		timer100usCount++;
 509  0011 725c0001      	inc	_timer100usCount
 510                     ; 298 		if( timer100usCount == 100 )
 512  0015 c60001        	ld	a,_timer100usCount
 513  0018 a164          	cp	a,#100
 514  001a 2627          	jrne	L351
 515                     ; 300 			_t20ms++;	//	10ms
 517  001c 725c0002      	inc	__t20ms
 518                     ; 301 			if( _t20ms == 100 )
 520  0020 c60002        	ld	a,__t20ms
 521  0023 a164          	cp	a,#100
 522  0025 2604          	jrne	L151
 523                     ; 302 				_t20ms = 0;
 525  0027 725f0002      	clr	__t20ms
 526  002b               L151:
 527                     ; 303 			timer100usCount = 0;
 529  002b 725f0001      	clr	_timer100usCount
 530  002f 2012          	jra	L351
 531  0031               L541:
 532                     ; 391 		timer50usCount = 0;
 534  0031 725f0000      	clr	_timer50usCount
 535                     ; 392 		if( indiIOUartSendWait != 0 )
 537  0035 ce0000        	ldw	x,_indiIOUartSendWait
 538  0038 2706          	jreq	L551
 539                     ; 393 			indiIOUartSendWait--;
 541  003a 5a            	decw	x
 542  003b cf0000        	ldw	_indiIOUartSendWait,x
 544  003e 2003          	jra	L351
 545  0040               L551:
 546                     ; 395 			iouart_Write();
 548  0040 cd0000        	call	_iouart_Write
 550  0043               L351:
 551                     ; 420 	__rcCb();
 554                     ; 422 }
 557  0043 cc0000        	jp	___rcCb
 560                     	switch	.data
 561  000e               ___timer100ms:
 562  000e 00            	dc.b	0
 563  000f               ___timer1s:
 564  000f 00            	dc.b	0
 565  0010               ___timer1sa:
 566  0010 00            	dc.b	0
 567  0011               ___timer1min:
 568  0011 00            	dc.b	0
 569  0012               ___timer1h:
 570  0012 00            	dc.b	0
 571  0013               ___timeri:
 572  0013 00            	dc.b	0
 573  0014               ___timeri2:
 574  0014 00            	dc.b	0
 575  0015               ___timerOffset:
 576  0015 3c            	dc.b	60
 610                     ; 435 uint8_t	timerCalc2(void)
 610                     ; 436 {
 611                     .text:	section	.text,new
 612  0000               _timerCalc2:
 614  0000 88            	push	a
 615       00000001      OFST:	set	1
 618                     ; 437 	uint8_t	r = 0;
 620                     ; 438 	__timer1sa++;
 622  0001 725c0010      	inc	___timer1sa
 623                     ; 439 	if( __timer1sa != __timerOffset )
 625  0005 c60010        	ld	a,___timer1sa
 626  0008 c10015        	cp	a,___timerOffset
 627  000b 2704          	jreq	L571
 628                     ; 440 		return r;
 630  000d 4f            	clr	a
 633  000e 5b01          	addw	sp,#1
 634  0010 81            	ret	
 635  0011               L571:
 636                     ; 442 	__timerOffset = __timerOffset==60 ? 59 : 60;
 638  0011 c60015        	ld	a,___timerOffset
 639  0014 a13c          	cp	a,#60
 640  0016 2604          	jrne	L05
 641  0018 a63b          	ld	a,#59
 642  001a 2002          	jra	L25
 643  001c               L05:
 644  001c a63c          	ld	a,#60
 645  001e               L25:
 646  001e c70015        	ld	___timerOffset,a
 647                     ; 443 	__timer1sa = 0;
 649  0021 725f0010      	clr	___timer1sa
 650                     ; 444 	__timer1min++;
 652  0025 725c0011      	inc	___timer1min
 653                     ; 445 	r = 1;
 655                     ; 446 	if( __timer1min != 60 )
 657  0029 c60011        	ld	a,___timer1min
 658  002c a13c          	cp	a,#60
 659  002e 2705          	jreq	L771
 660                     ; 447 		return r;
 662  0030 a601          	ld	a,#1
 665  0032 5b01          	addw	sp,#1
 666  0034 81            	ret	
 667  0035               L771:
 668                     ; 449 	__timer1min = 0;
 670  0035 725f0011      	clr	___timer1min
 671                     ; 450 	__timer1h++;
 673  0039 725c0012      	inc	___timer1h
 674                     ; 451 	if( __timer1h == 24 )
 676  003d c60012        	ld	a,___timer1h
 677  0040 a118          	cp	a,#24
 678  0042 2604          	jrne	L102
 679                     ; 452 		__timer1h = 0;
 681  0044 725f0012      	clr	___timer1h
 682  0048               L102:
 683                     ; 454 	return r;
 685  0048 a601          	ld	a,#1
 688  004a 5b01          	addw	sp,#1
 689  004c 81            	ret	
 692                     	switch	.data
 693  0016               __timer100ms255:
 694  0016 00            	dc.b	0
 737                     ; 457 uint8_t	timerCalc(void)
 737                     ; 458 {
 738                     .text:	section	.text,new
 739  0000               _timerCalc:
 741  0000 89            	pushw	x
 742       00000002      OFST:	set	2
 745                     ; 460 	uint8_t	r = 0;
 747  0001 0f02          	clr	(OFST+0,sp)
 748                     ; 462 	uint8_t	i = _t20ms/10;
 750  0003 c60002        	ld	a,__t20ms
 751  0006 5f            	clrw	x
 752  0007 97            	ld	xl,a
 753  0008 a60a          	ld	a,#10
 754  000a 62            	div	x,a
 755  000b 9f            	ld	a,xl
 756  000c 6b01          	ld	(OFST-1,sp),a
 757                     ; 463 	if( __timeri != i )
 759  000e c60013        	ld	a,___timeri
 760  0011 1101          	cp	a,(OFST-1,sp)
 761  0013 2733          	jreq	L06
 762                     ; 465 		__timeri = i;
 764  0015 7b01          	ld	a,(OFST-1,sp)
 765  0017 c70013        	ld	___timeri,a
 766                     ; 466 		__timer100ms++;
 768  001a 725c000e      	inc	___timer100ms
 769                     ; 467 		_timer100ms255++;
 771  001e 725c0016      	inc	__timer100ms255
 772                     ; 468 		if( _timer100ms255 == 200 )
 774  0022 c60016        	ld	a,__timer100ms255
 775  0025 a1c8          	cp	a,#200
 776  0027 2604          	jrne	L322
 777                     ; 469 			_timer100ms255 = 0;
 779  0029 725f0016      	clr	__timer100ms255
 780  002d               L322:
 781                     ; 470 		if( __timer100ms != 10 )
 783  002d c6000e        	ld	a,___timer100ms
 784  0030 a10a          	cp	a,#10
 785                     ; 471 			return r;
 787  0032 2614          	jrne	L06
 788                     ; 473 		__timer100ms = 0;
 790  0034 725f000e      	clr	___timer100ms
 791                     ; 474 		__timer1s++;
 793  0038 725c000f      	inc	___timer1s
 794                     ; 475 		r = timerCalc2();
 796  003c cd0000        	call	_timerCalc2
 798  003f 6b02          	ld	(OFST+0,sp),a
 799                     ; 476 		if( __timer1s != 60 )
 801  0041 c6000f        	ld	a,___timer1s
 802  0044 a13c          	cp	a,#60
 803  0046 2704          	jreq	L722
 804                     ; 477 			return r;
 807  0048               L06:
 810  0048 7b02          	ld	a,(OFST+0,sp)
 812  004a 85            	popw	x
 813  004b 81            	ret	
 814  004c               L722:
 815                     ; 479 		__timer1s = 0;
 817  004c 725f000f      	clr	___timer1s
 818                     ; 481 	return r;
 820  0050 20f6          	jra	L06
 848                     ; 491 void	systemTimer(void)
 848                     ; 492 {
 849                     .text:	section	.text,new
 850  0000               _systemTimer:
 854                     ; 506 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 856  0000 ae0201        	ldw	x,#513
 857  0003 cd0000        	call	_CLK_PeripheralClockConfig
 859                     ; 507 	TIM4_TimeBaseInit(TIM4_Prescaler_32, TIMER_PERIOD);
 861  0006 ae0518        	ldw	x,#1304
 862  0009 cd0000        	call	_TIM4_TimeBaseInit
 864                     ; 508 	TIM4_ClearFlag(TIM4_FLAG_Update);
 866  000c a601          	ld	a,#1
 867  000e cd0000        	call	_TIM4_ClearFlag
 869                     ; 509 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 871  0011 ae0101        	ldw	x,#257
 872  0014 cd0000        	call	_TIM4_ITConfig
 874                     ; 510 	TIM4_Cmd(ENABLE);
 876  0017 a601          	ld	a,#1
 878                     ; 561 }
 881  0019 cc0000        	jp	_TIM4_Cmd
 913                     ; 563 void	timer2Cntl(uint8_t mode)
 913                     ; 564 {
 914                     .text:	section	.text,new
 915  0000               _timer2Cntl:
 919                     ; 568 	return;
 922  0000 81            	ret	
1167                     	xdef	__timer100ms255
1168                     	xdef	_timerCalc2
1169                     	xdef	___timerOffset
1170                     	xdef	___timeri2
1171                     	xdef	___timeri
1172                     	xdef	___timer1sa
1173                     	xref	__iouart_50ms
1174                     	xdef	_timer485Cntl
1175                     	xdef	__swuartCb
1176                     	xdef	__sw_sending
1177                     	xdef	__sw_bit
1178                     	switch	.bss
1179  0000               __sw_data:
1180  0000 00            	ds.b	1
1181                     	xdef	__sw_data
1182                     	xdef	__swuart_tx_tail
1183                     	xdef	__swuart_tx_head
1184  0001               _swTxBuffer:
1185  0001 000000000000  	ds.b	64
1186                     	xdef	_swTxBuffer
1187                     	xref	___rcCb
1188                     	xdef	__io_rc_prev
1189                     	xdef	_beepSet
1190                     	xdef	___beep_enable
1191                     	xdef	_beepEnable
1192                     	xdef	_beepCount
1193                     	xdef	____k
1194                     	xdef	_swuart_Write
1195                     	xdef	_timer1CiCb
1196                     	xdef	_timerCalc
1197                     	xdef	_timer2CiCb
1198                     	xdef	_timer4_UpdateCb
1199                     	xdef	_systemTimer
1200                     	xdef	___timer1h
1201                     	xdef	___timer1min
1202                     	xdef	___timer1s
1203                     	xdef	___timer100ms
1204                     	xdef	__t20ms
1205                     	xdef	_timer50usCount
1206                     	xdef	_timer100usCount
1207  0041               __io_buf:
1208  0041 000000000000  	ds.b	48
1209                     	xdef	__io_buf
1210                     	xdef	__io_tail
1211                     	xdef	__io_head
1212                     	xref	_iouart_Write
1213                     	xdef	_timer2Cntl
1214                     	xref	_indiIOUartIdle
1215                     	xref	_indiIOUartSendWait
1216                     	xdef	_timer2_UpdateCb
1217                     	xref	_TIM4_ClearFlag
1218                     	xref	_TIM4_ITConfig
1219                     	xref	_TIM4_Cmd
1220                     	xref	_TIM4_TimeBaseInit
1221                     	xref	_GPIO_ReadInputData
1222                     	xref	_CLK_PeripheralClockConfig
1223                     	xref	_CLK_BEEPClockConfig
1224                     	xref	_BEEP_LSICalibrationConfig
1225                     	xref	_BEEP_Cmd
1226                     	xref	_BEEP_Init
1246                     	end
