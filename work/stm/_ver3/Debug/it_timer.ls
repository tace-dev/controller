   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               _timer50usCount:
  23  0000 00            	dc.b	0
  24  0001               _timer100usCount:
  25  0001 00            	dc.b	0
  26  0002               __t20ms:
  27  0002 00            	dc.b	0
  28  0003               __io_head:
  29  0003 00            	dc.b	0
  30  0004               __io_tail:
  31  0004 00            	dc.b	0
  32  0005               ____k:
  33  0005 00            	dc.b	0
  34  0006               _beepCount:
  35  0006 00            	dc.b	0
  36  0007               _beepEnable:
  37  0007 00            	dc.b	0
  77                     ; 21 void	beepSet(uint8_t i)
  77                     ; 22 {
  79                     	switch	.text
  80  0000               _beepSet:
  84                     ; 27 	beepCount =5;
  86  0000 35050006      	mov	_beepCount,#5
  87                     ; 28 	beepEnable = 1;
  89  0004 35010007      	mov	_beepEnable,#1
  90                     ; 29 }
  93  0008 81            	ret	
  96                     	switch	.data
  97  0008               __io_rc_prev:
  98  0008 02            	dc.b	2
  99  0009               __swuart_tx_head:
 100  0009 00            	dc.b	0
 101  000a               __swuart_tx_tail:
 102  000a 00            	dc.b	0
 103  000b               __sw_bit:
 104  000b 00            	dc.b	0
 105  000c               __sw_sending:
 106  000c 00            	dc.b	0
 127                     ; 72 void	timer1CiCb(void)
 127                     ; 73 {	
 128                     	switch	.text
 129  0009               _timer1CiCb:
 133                     ; 77 }
 136  0009 81            	ret	
 163                     ; 79 void	timer2CiCb(void)
 163                     ; 80 {	
 164                     	switch	.text
 165  000a               _timer2CiCb:
 169                     ; 81 	if( indiIOUartIdle == 0 )
 171  000a c60000        	ld	a,_indiIOUartIdle
 172  000d 2624          	jrne	L54
 173                     ; 83 		if( ___k != 0 )
 175  000f 725d0005      	tnz	____k
 176  0013 271e          	jreq	L54
 177                     ; 85 			_io_buf[_io_head++] = ___k;
 179  0015 c60003        	ld	a,__io_head
 180  0018 725c0003      	inc	__io_head
 181  001c 5f            	clrw	x
 182  001d 97            	ld	xl,a
 183  001e c60005        	ld	a,____k
 184  0021 d70041        	ld	(__io_buf,x),a
 185                     ; 86 			if( _io_head == _IO_BUF_SIZE )
 187  0024 c60003        	ld	a,__io_head
 188  0027 a130          	cp	a,#48
 189  0029 2604          	jrne	L15
 190                     ; 87 				_io_head = 0;
 192  002b 725f0003      	clr	__io_head
 193  002f               L15:
 194                     ; 88 			___k = 0;
 196  002f 725f0005      	clr	____k
 197  0033               L54:
 198                     ; 91 }
 201  0033 81            	ret	
 238                     ; 93 void	timer2_UpdateCb(void)
 238                     ; 94 {
 239                     	switch	.text
 240  0034               _timer2_UpdateCb:
 242  0034 88            	push	a
 243       00000001      OFST:	set	1
 246                     ; 98 	i = GPIO_ReadInputData(D_IOUART_RX_PORT);
 248  0035 ae500f        	ldw	x,#20495
 249  0038 cd0000        	call	_GPIO_ReadInputData
 251                     ; 99 	i = i & D_IOUART_RX_PIN;
 253  003b a420          	and	a,#32
 254  003d 6b01          	ld	(OFST+0,sp),a
 255                     ; 100 	if( i == _io_rc_prev )
 257  003f c10008        	cp	a,__io_rc_prev
 258  0042 2602          	jrne	L76
 259                     ; 101 		return;
 262  0044 84            	pop	a
 263  0045 81            	ret	
 264  0046               L76:
 265                     ; 103 	_io_rc_prev = i;
 267  0046 c70008        	ld	__io_rc_prev,a
 268                     ; 104 	if( i == 0 )
 270  0049 7b01          	ld	a,(OFST+0,sp)
 271  004b 261e          	jrne	L17
 272                     ; 106 		_io_buf[_io_head] = ___k;
 274  004d c60003        	ld	a,__io_head
 275  0050 5f            	clrw	x
 276  0051 97            	ld	xl,a
 277  0052 c60005        	ld	a,____k
 278  0055 d70041        	ld	(__io_buf,x),a
 279                     ; 107 		_io_head += 1;
 281  0058 725c0003      	inc	__io_head
 282                     ; 108 		if( _io_head == _IO_BUF_SIZE )
 284  005c c60003        	ld	a,__io_head
 285  005f a130          	cp	a,#48
 286  0061 2604          	jrne	L37
 287                     ; 109 			_io_head = 0;
 289  0063 725f0003      	clr	__io_head
 290  0067               L37:
 291                     ; 110 		___k = 0;
 293  0067 725f0005      	clr	____k
 294  006b               L17:
 295                     ; 113 }
 298  006b 84            	pop	a
 299  006c 81            	ret	
 322                     ; 115 void	_swuartCb(void)
 322                     ; 116 {
 323                     	switch	.text
 324  006d               __swuartCb:
 328                     ; 155 }
 331  006d 81            	ret	
 366                     ; 157 void	swuart_Write(uint8_t *p, uint8_t size)
 366                     ; 158 {
 367                     	switch	.text
 368  006e               _swuart_Write:
 372                     ; 168 }
 375  006e 81            	ret	
 398                     ; 174 void	timer485Cntl(void)
 398                     ; 175 {
 399                     	switch	.text
 400  006f               _timer485Cntl:
 404                     ; 221 }
 407  006f 81            	ret	
 437                     ; 223 void	timer4_UpdateCb(void)
 437                     ; 224 {
 438                     	switch	.text
 439  0070               _timer4_UpdateCb:
 443                     ; 237 	___k++;
 445  0070 725c0005      	inc	____k
 446                     ; 238 	if( timer50usCount == 0 )
 448  0074 725d0000      	tnz	_timer50usCount
 449  0078 2624          	jrne	L341
 450                     ; 246 		timer50usCount = 1;
 452  007a 35010000      	mov	_timer50usCount,#1
 453                     ; 247 		timer100usCount++;
 455  007e 725c0001      	inc	_timer100usCount
 456                     ; 248 		if( timer100usCount == 100 )
 458  0082 c60001        	ld	a,_timer100usCount
 459  0085 a164          	cp	a,#100
 460  0087 2627          	jrne	L151
 461                     ; 250 			_t20ms++;	//	10ms
 463  0089 725c0002      	inc	__t20ms
 464                     ; 251 			if( _t20ms == 100 )
 466  008d c60002        	ld	a,__t20ms
 467  0090 a164          	cp	a,#100
 468  0092 2604          	jrne	L741
 469                     ; 252 				_t20ms = 0;
 471  0094 725f0002      	clr	__t20ms
 472  0098               L741:
 473                     ; 253 			timer100usCount = 0;
 475  0098 725f0001      	clr	_timer100usCount
 476  009c 2012          	jra	L151
 477  009e               L341:
 478                     ; 331 		timer50usCount = 0;
 480  009e 725f0000      	clr	_timer50usCount
 481                     ; 332 		if( indiIOUartSendWait != 0 )
 483  00a2 ce0000        	ldw	x,_indiIOUartSendWait
 484  00a5 2706          	jreq	L351
 485                     ; 333 			indiIOUartSendWait--;
 487  00a7 5a            	decw	x
 488  00a8 cf0000        	ldw	_indiIOUartSendWait,x
 490  00ab 2003          	jra	L151
 491  00ad               L351:
 492                     ; 335 			iouart_Write();
 494  00ad cd0000        	call	_iouart_Write
 496  00b0               L151:
 497                     ; 349 	__rcCb();
 500                     ; 351 }
 503  00b0 cc0000        	jp	___rcCb
 506                     	switch	.data
 507  000d               ___timer100ms:
 508  000d 00            	dc.b	0
 509  000e               ___timer1s:
 510  000e 00            	dc.b	0
 511  000f               ___timer1sa:
 512  000f 00            	dc.b	0
 513  0010               ___timer1min:
 514  0010 00            	dc.b	0
 515  0011               ___timer1h:
 516  0011 00            	dc.b	0
 517  0012               ___timeri:
 518  0012 00            	dc.b	0
 519  0013               ___timeri2:
 520  0013 00            	dc.b	0
 521  0014               ___timerOffset:
 522  0014 3c            	dc.b	60
 556                     ; 364 uint8_t	timerCalc2(void)
 556                     ; 365 {
 557                     	switch	.text
 558  00b3               _timerCalc2:
 560  00b3 88            	push	a
 561       00000001      OFST:	set	1
 564                     ; 366 	uint8_t	r = 0;
 566                     ; 367 	__timer1sa++;
 568  00b4 725c000f      	inc	___timer1sa
 569                     ; 368 	if( __timer1sa != __timerOffset )
 571  00b8 c6000f        	ld	a,___timer1sa
 572  00bb c10014        	cp	a,___timerOffset
 573  00be 2704          	jreq	L371
 574                     ; 369 		return r;
 576  00c0 4f            	clr	a
 579  00c1 5b01          	addw	sp,#1
 580  00c3 81            	ret	
 581  00c4               L371:
 582                     ; 371 	__timerOffset = __timerOffset==60 ? 59 : 60;
 584  00c4 c60014        	ld	a,___timerOffset
 585  00c7 a13c          	cp	a,#60
 586  00c9 2604          	jrne	L43
 587  00cb a63b          	ld	a,#59
 588  00cd 2002          	jra	L63
 589  00cf               L43:
 590  00cf a63c          	ld	a,#60
 591  00d1               L63:
 592  00d1 c70014        	ld	___timerOffset,a
 593                     ; 372 	__timer1sa = 0;
 595  00d4 725f000f      	clr	___timer1sa
 596                     ; 373 	__timer1min++;
 598  00d8 725c0010      	inc	___timer1min
 599                     ; 374 	r = 1;
 601                     ; 375 	if( __timer1min != 60 )
 603  00dc c60010        	ld	a,___timer1min
 604  00df a13c          	cp	a,#60
 605  00e1 2705          	jreq	L571
 606                     ; 376 		return r;
 608  00e3 a601          	ld	a,#1
 611  00e5 5b01          	addw	sp,#1
 612  00e7 81            	ret	
 613  00e8               L571:
 614                     ; 378 	__timer1min = 0;
 616  00e8 725f0010      	clr	___timer1min
 617                     ; 379 	__timer1h++;
 619  00ec 725c0011      	inc	___timer1h
 620                     ; 380 	if( __timer1h == 24 )
 622  00f0 c60011        	ld	a,___timer1h
 623  00f3 a118          	cp	a,#24
 624  00f5 2604          	jrne	L771
 625                     ; 381 		__timer1h = 0;
 627  00f7 725f0011      	clr	___timer1h
 628  00fb               L771:
 629                     ; 383 	return r;
 631  00fb a601          	ld	a,#1
 634  00fd 5b01          	addw	sp,#1
 635  00ff 81            	ret	
 679                     ; 386 uint8_t	timerCalc(void)
 679                     ; 387 {
 680                     	switch	.text
 681  0100               _timerCalc:
 683  0100 89            	pushw	x
 684       00000002      OFST:	set	2
 687                     ; 389 	uint8_t	r = 0;
 689  0101 0f02          	clr	(OFST+0,sp)
 690                     ; 391 	uint8_t	i = _t20ms/10;
 692  0103 c60002        	ld	a,__t20ms
 693  0106 5f            	clrw	x
 694  0107 97            	ld	xl,a
 695  0108 a60a          	ld	a,#10
 696  010a 62            	div	x,a
 697  010b 9f            	ld	a,xl
 698  010c 6b01          	ld	(OFST-1,sp),a
 699                     ; 392 	if( __timeri != i )
 701  010e c60012        	ld	a,___timeri
 702  0111 1101          	cp	a,(OFST-1,sp)
 703  0113 2726          	jreq	LC001
 704                     ; 394 		__timeri = i;
 706  0115 7b01          	ld	a,(OFST-1,sp)
 707  0117 c70012        	ld	___timeri,a
 708                     ; 395 		__timer100ms++;
 710  011a 725c000d      	inc	___timer100ms
 711                     ; 396 		if( __timer100ms != 10 )
 713  011e c6000d        	ld	a,___timer100ms
 714  0121 a10a          	cp	a,#10
 715  0123 2703          	jreq	L122
 716                     ; 397 			return r;
 718  0125 4f            	clr	a
 720  0126 2015          	jra	L44
 721  0128               L122:
 722                     ; 399 		__timer100ms = 0;
 724  0128 725f000d      	clr	___timer100ms
 725                     ; 400 		__timer1s++;
 727  012c 725c000e      	inc	___timer1s
 728                     ; 401 		r = timerCalc2();
 730  0130 ad81          	call	_timerCalc2
 732  0132 6b02          	ld	(OFST+0,sp),a
 733                     ; 402 		if( __timer1s != 60 )
 735  0134 c6000e        	ld	a,___timer1s
 736  0137 a13c          	cp	a,#60
 737  0139 2704          	jreq	L322
 738                     ; 403 			return r;
 740  013b               LC001:
 742  013b 7b02          	ld	a,(OFST+0,sp)
 744  013d               L44:
 746  013d 85            	popw	x
 747  013e 81            	ret	
 748  013f               L322:
 749                     ; 405 		__timer1s = 0;
 751  013f 725f000e      	clr	___timer1s
 752                     ; 407 	return r;
 754  0143 20f6          	jp	LC001
 782                     ; 417 void	systemTimer(void)
 782                     ; 418 {
 783                     	switch	.text
 784  0145               _systemTimer:
 788                     ; 432 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 790  0145 ae0201        	ldw	x,#513
 791  0148 cd0000        	call	_CLK_PeripheralClockConfig
 793                     ; 433 	TIM4_TimeBaseInit(TIM4_Prescaler_32, TIMER_PERIOD);
 795  014b ae0518        	ldw	x,#1304
 796  014e cd0000        	call	_TIM4_TimeBaseInit
 798                     ; 434 	TIM4_ClearFlag(TIM4_FLAG_Update);
 800  0151 a601          	ld	a,#1
 801  0153 cd0000        	call	_TIM4_ClearFlag
 803                     ; 435 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 805  0156 ae0101        	ldw	x,#257
 806  0159 cd0000        	call	_TIM4_ITConfig
 808                     ; 436 	TIM4_Cmd(ENABLE);
 810  015c a601          	ld	a,#1
 812                     ; 479 }
 815  015e cc0000        	jp	_TIM4_Cmd
 847                     ; 481 void	timer2Cntl(uint8_t mode)
 847                     ; 482 {
 848                     	switch	.text
 849  0161               _timer2Cntl:
 853                     ; 486 	return;
 856  0161 81            	ret	
1087                     	xdef	_timerCalc2
1088                     	xdef	___timerOffset
1089                     	xdef	___timeri2
1090                     	xdef	___timeri
1091                     	xdef	___timer1sa
1092                     	xdef	_timer485Cntl
1093                     	xdef	__swuartCb
1094                     	xdef	__sw_sending
1095                     	xdef	__sw_bit
1096                     	switch	.bss
1097  0000               __sw_data:
1098  0000 00            	ds.b	1
1099                     	xdef	__sw_data
1100                     	xdef	__swuart_tx_tail
1101                     	xdef	__swuart_tx_head
1102  0001               _swTxBuffer:
1103  0001 000000000000  	ds.b	64
1104                     	xdef	_swTxBuffer
1105                     	xref	___rcCb
1106                     	xdef	__io_rc_prev
1107                     	xdef	_beepSet
1108                     	xdef	_beepEnable
1109                     	xdef	_beepCount
1110                     	xdef	____k
1111                     	xdef	_swuart_Write
1112                     	xdef	_timer1CiCb
1113                     	xdef	_timerCalc
1114                     	xdef	_timer2CiCb
1115                     	xdef	_timer4_UpdateCb
1116                     	xdef	_systemTimer
1117                     	xdef	___timer1h
1118                     	xdef	___timer1min
1119                     	xdef	___timer1s
1120                     	xdef	___timer100ms
1121                     	xdef	__t20ms
1122                     	xdef	_timer50usCount
1123                     	xdef	_timer100usCount
1124  0041               __io_buf:
1125  0041 000000000000  	ds.b	48
1126                     	xdef	__io_buf
1127                     	xdef	__io_tail
1128                     	xdef	__io_head
1129                     	xref	_iouart_Write
1130                     	xdef	_timer2Cntl
1131                     	xref	_indiIOUartIdle
1132                     	xref	_indiIOUartSendWait
1133                     	xdef	_timer2_UpdateCb
1134                     	xref	_TIM4_ClearFlag
1135                     	xref	_TIM4_ITConfig
1136                     	xref	_TIM4_Cmd
1137                     	xref	_TIM4_TimeBaseInit
1138                     	xref	_GPIO_ReadInputData
1139                     	xref	_CLK_PeripheralClockConfig
1159                     	end
