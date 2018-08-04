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
 127                     ; 81 void	timer1CiCb(void)
 127                     ; 82 {	
 128                     	switch	.text
 129  0009               _timer1CiCb:
 133                     ; 90 }
 136  0009 81            	ret	
 163                     ; 92 void	timer2CiCb(void)
 163                     ; 93 {	
 164                     	switch	.text
 165  000a               _timer2CiCb:
 169                     ; 94 	if( indiIOUartIdle == 0 )
 171  000a c60000        	ld	a,_indiIOUartIdle
 172  000d 2624          	jrne	L54
 173                     ; 96 		if( ___k != 0 )
 175  000f 725d0005      	tnz	____k
 176  0013 271e          	jreq	L54
 177                     ; 98 			_io_buf[_io_head++] = ___k;
 179  0015 c60003        	ld	a,__io_head
 180  0018 725c0003      	inc	__io_head
 181  001c 5f            	clrw	x
 182  001d 97            	ld	xl,a
 183  001e c60005        	ld	a,____k
 184  0021 d70041        	ld	(__io_buf,x),a
 185                     ; 99 			if( _io_head == _IO_BUF_SIZE )
 187  0024 c60003        	ld	a,__io_head
 188  0027 a130          	cp	a,#48
 189  0029 2604          	jrne	L15
 190                     ; 100 				_io_head = 0;
 192  002b 725f0003      	clr	__io_head
 193  002f               L15:
 194                     ; 101 			___k = 0;
 196  002f 725f0005      	clr	____k
 197  0033               L54:
 198                     ; 104 }
 201  0033 81            	ret	
 238                     ; 106 void	timer2_UpdateCb(void)
 238                     ; 107 {
 239                     	switch	.text
 240  0034               _timer2_UpdateCb:
 242  0034 88            	push	a
 243       00000001      OFST:	set	1
 246                     ; 111 	i = GPIO_ReadInputData(D_IOUART_RX_PORT);
 248  0035 ae500f        	ldw	x,#20495
 249  0038 cd0000        	call	_GPIO_ReadInputData
 251                     ; 112 	i = i & D_IOUART_RX_PIN;
 253  003b a420          	and	a,#32
 254  003d 6b01          	ld	(OFST+0,sp),a
 255                     ; 113 	if( i == _io_rc_prev )
 257  003f c10008        	cp	a,__io_rc_prev
 258  0042 2602          	jrne	L76
 259                     ; 114 		return;
 262  0044 84            	pop	a
 263  0045 81            	ret	
 264  0046               L76:
 265                     ; 116 	_io_rc_prev = i;
 267  0046 c70008        	ld	__io_rc_prev,a
 268                     ; 117 	if( i == 0 )
 270  0049 7b01          	ld	a,(OFST+0,sp)
 271  004b 261e          	jrne	L17
 272                     ; 119 		_io_buf[_io_head] = ___k;
 274  004d c60003        	ld	a,__io_head
 275  0050 5f            	clrw	x
 276  0051 97            	ld	xl,a
 277  0052 c60005        	ld	a,____k
 278  0055 d70041        	ld	(__io_buf,x),a
 279                     ; 120 		_io_head += 1;
 281  0058 725c0003      	inc	__io_head
 282                     ; 121 		if( _io_head == _IO_BUF_SIZE )
 284  005c c60003        	ld	a,__io_head
 285  005f a130          	cp	a,#48
 286  0061 2604          	jrne	L37
 287                     ; 122 			_io_head = 0;
 289  0063 725f0003      	clr	__io_head
 290  0067               L37:
 291                     ; 123 		___k = 0;
 293  0067 725f0005      	clr	____k
 294  006b               L17:
 295                     ; 129 }
 298  006b 84            	pop	a
 299  006c 81            	ret	
 322                     ; 131 void	_swuartCb(void)
 322                     ; 132 {
 323                     	switch	.text
 324  006d               __swuartCb:
 328                     ; 171 }
 331  006d 81            	ret	
 366                     ; 173 void	swuart_Write(uint8_t *p, uint8_t size)
 366                     ; 174 {
 367                     	switch	.text
 368  006e               _swuart_Write:
 372                     ; 184 }
 375  006e 81            	ret	
 398                     ; 190 void	timer485Cntl(void)
 398                     ; 191 {
 399                     	switch	.text
 400  006f               _timer485Cntl:
 404                     ; 237 }
 407  006f 81            	ret	
 438                     ; 241 void	timer4_UpdateCb(void)
 438                     ; 242 {
 439                     	switch	.text
 440  0070               _timer4_UpdateCb:
 444                     ; 243 	_iouart_50ms();
 446  0070 cd0000        	call	__iouart_50ms
 448                     ; 252 	___k++;
 450  0073 725c0005      	inc	____k
 451                     ; 253 	if( timer50usCount == 0 )
 453  0077 725d0000      	tnz	_timer50usCount
 454  007b 2624          	jrne	L341
 455                     ; 261 		timer50usCount = 1;
 457  007d 35010000      	mov	_timer50usCount,#1
 458                     ; 262 		timer100usCount++;
 460  0081 725c0001      	inc	_timer100usCount
 461                     ; 263 		if( timer100usCount == 100 )
 463  0085 c60001        	ld	a,_timer100usCount
 464  0088 a164          	cp	a,#100
 465  008a 2627          	jrne	L151
 466                     ; 265 			_t20ms++;	//	10ms
 468  008c 725c0002      	inc	__t20ms
 469                     ; 266 			if( _t20ms == 100 )
 471  0090 c60002        	ld	a,__t20ms
 472  0093 a164          	cp	a,#100
 473  0095 2604          	jrne	L741
 474                     ; 267 				_t20ms = 0;
 476  0097 725f0002      	clr	__t20ms
 477  009b               L741:
 478                     ; 268 			timer100usCount = 0;
 480  009b 725f0001      	clr	_timer100usCount
 481  009f 2012          	jra	L151
 482  00a1               L341:
 483                     ; 356 		timer50usCount = 0;
 485  00a1 725f0000      	clr	_timer50usCount
 486                     ; 357 		if( indiIOUartSendWait != 0 )
 488  00a5 ce0000        	ldw	x,_indiIOUartSendWait
 489  00a8 2706          	jreq	L351
 490                     ; 358 			indiIOUartSendWait--;
 492  00aa 5a            	decw	x
 493  00ab cf0000        	ldw	_indiIOUartSendWait,x
 495  00ae 2003          	jra	L151
 496  00b0               L351:
 497                     ; 360 			iouart_Write();
 499  00b0 cd0000        	call	_iouart_Write
 501  00b3               L151:
 502                     ; 374 	__rcCb();
 505                     ; 376 }
 508  00b3 cc0000        	jp	___rcCb
 511                     	switch	.data
 512  000d               ___timer100ms:
 513  000d 00            	dc.b	0
 514  000e               ___timer1s:
 515  000e 00            	dc.b	0
 516  000f               ___timer1sa:
 517  000f 00            	dc.b	0
 518  0010               ___timer1min:
 519  0010 00            	dc.b	0
 520  0011               ___timer1h:
 521  0011 00            	dc.b	0
 522  0012               ___timeri:
 523  0012 00            	dc.b	0
 524  0013               ___timeri2:
 525  0013 00            	dc.b	0
 526  0014               ___timerOffset:
 527  0014 3c            	dc.b	60
 561                     ; 389 uint8_t	timerCalc2(void)
 561                     ; 390 {
 562                     	switch	.text
 563  00b6               _timerCalc2:
 565  00b6 88            	push	a
 566       00000001      OFST:	set	1
 569                     ; 391 	uint8_t	r = 0;
 571                     ; 392 	__timer1sa++;
 573  00b7 725c000f      	inc	___timer1sa
 574                     ; 393 	if( __timer1sa != __timerOffset )
 576  00bb c6000f        	ld	a,___timer1sa
 577  00be c10014        	cp	a,___timerOffset
 578  00c1 2704          	jreq	L371
 579                     ; 394 		return r;
 581  00c3 4f            	clr	a
 584  00c4 5b01          	addw	sp,#1
 585  00c6 81            	ret	
 586  00c7               L371:
 587                     ; 396 	__timerOffset = __timerOffset==60 ? 59 : 60;
 589  00c7 c60014        	ld	a,___timerOffset
 590  00ca a13c          	cp	a,#60
 591  00cc 2604          	jrne	L63
 592  00ce a63b          	ld	a,#59
 593  00d0 2002          	jra	L04
 594  00d2               L63:
 595  00d2 a63c          	ld	a,#60
 596  00d4               L04:
 597  00d4 c70014        	ld	___timerOffset,a
 598                     ; 397 	__timer1sa = 0;
 600  00d7 725f000f      	clr	___timer1sa
 601                     ; 398 	__timer1min++;
 603  00db 725c0010      	inc	___timer1min
 604                     ; 399 	r = 1;
 606                     ; 400 	if( __timer1min != 60 )
 608  00df c60010        	ld	a,___timer1min
 609  00e2 a13c          	cp	a,#60
 610  00e4 2705          	jreq	L571
 611                     ; 401 		return r;
 613  00e6 a601          	ld	a,#1
 616  00e8 5b01          	addw	sp,#1
 617  00ea 81            	ret	
 618  00eb               L571:
 619                     ; 403 	__timer1min = 0;
 621  00eb 725f0010      	clr	___timer1min
 622                     ; 404 	__timer1h++;
 624  00ef 725c0011      	inc	___timer1h
 625                     ; 405 	if( __timer1h == 24 )
 627  00f3 c60011        	ld	a,___timer1h
 628  00f6 a118          	cp	a,#24
 629  00f8 2604          	jrne	L771
 630                     ; 406 		__timer1h = 0;
 632  00fa 725f0011      	clr	___timer1h
 633  00fe               L771:
 634                     ; 408 	return r;
 636  00fe a601          	ld	a,#1
 639  0100 5b01          	addw	sp,#1
 640  0102 81            	ret	
 643                     	switch	.data
 644  0015               __timer100ms255:
 645  0015 00            	dc.b	0
 688                     ; 411 uint8_t	timerCalc(void)
 688                     ; 412 {
 689                     	switch	.text
 690  0103               _timerCalc:
 692  0103 89            	pushw	x
 693       00000002      OFST:	set	2
 696                     ; 414 	uint8_t	r = 0;
 698  0104 0f02          	clr	(OFST+0,sp)
 699                     ; 416 	uint8_t	i = _t20ms/10;
 701  0106 c60002        	ld	a,__t20ms
 702  0109 5f            	clrw	x
 703  010a 97            	ld	xl,a
 704  010b a60a          	ld	a,#10
 705  010d 62            	div	x,a
 706  010e 9f            	ld	a,xl
 707  010f 6b01          	ld	(OFST-1,sp),a
 708                     ; 417 	if( __timeri != i )
 710  0111 c60012        	ld	a,___timeri
 711  0114 1101          	cp	a,(OFST-1,sp)
 712  0116 2733          	jreq	L64
 713                     ; 419 		__timeri = i;
 715  0118 7b01          	ld	a,(OFST-1,sp)
 716  011a c70012        	ld	___timeri,a
 717                     ; 420 		__timer100ms++;
 719  011d 725c000d      	inc	___timer100ms
 720                     ; 421 		_timer100ms255++;
 722  0121 725c0015      	inc	__timer100ms255
 723                     ; 422 		if( _timer100ms255 == 200 )
 725  0125 c60015        	ld	a,__timer100ms255
 726  0128 a1c8          	cp	a,#200
 727  012a 2604          	jrne	L122
 728                     ; 423 			_timer100ms255 = 0;
 730  012c 725f0015      	clr	__timer100ms255
 731  0130               L122:
 732                     ; 424 		if( __timer100ms != 10 )
 734  0130 c6000d        	ld	a,___timer100ms
 735  0133 a10a          	cp	a,#10
 736                     ; 425 			return r;
 738  0135 2614          	jrne	L64
 739                     ; 427 		__timer100ms = 0;
 741  0137 725f000d      	clr	___timer100ms
 742                     ; 428 		__timer1s++;
 744  013b 725c000e      	inc	___timer1s
 745                     ; 429 		r = timerCalc2();
 747  013f cd00b6        	call	_timerCalc2
 749  0142 6b02          	ld	(OFST+0,sp),a
 750                     ; 430 		if( __timer1s != 60 )
 752  0144 c6000e        	ld	a,___timer1s
 753  0147 a13c          	cp	a,#60
 754  0149 2704          	jreq	L522
 755                     ; 431 			return r;
 758  014b               L64:
 761  014b 7b02          	ld	a,(OFST+0,sp)
 763  014d 85            	popw	x
 764  014e 81            	ret	
 765  014f               L522:
 766                     ; 433 		__timer1s = 0;
 768  014f 725f000e      	clr	___timer1s
 769                     ; 435 	return r;
 771  0153 20f6          	jra	L64
 799                     ; 445 void	systemTimer(void)
 799                     ; 446 {
 800                     	switch	.text
 801  0155               _systemTimer:
 805                     ; 460 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 807  0155 ae0201        	ldw	x,#513
 808  0158 cd0000        	call	_CLK_PeripheralClockConfig
 810                     ; 461 	TIM4_TimeBaseInit(TIM4_Prescaler_32, TIMER_PERIOD);
 812  015b ae0518        	ldw	x,#1304
 813  015e cd0000        	call	_TIM4_TimeBaseInit
 815                     ; 462 	TIM4_ClearFlag(TIM4_FLAG_Update);
 817  0161 a601          	ld	a,#1
 818  0163 cd0000        	call	_TIM4_ClearFlag
 820                     ; 463 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 822  0166 ae0101        	ldw	x,#257
 823  0169 cd0000        	call	_TIM4_ITConfig
 825                     ; 464 	TIM4_Cmd(ENABLE);
 827  016c a601          	ld	a,#1
 829                     ; 515 }
 832  016e cc0000        	jp	_TIM4_Cmd
 864                     ; 517 void	timer2Cntl(uint8_t mode)
 864                     ; 518 {
 865                     	switch	.text
 866  0171               _timer2Cntl:
 870                     ; 522 	return;
 873  0171 81            	ret	
1111                     	xdef	__timer100ms255
1112                     	xdef	_timerCalc2
1113                     	xdef	___timerOffset
1114                     	xdef	___timeri2
1115                     	xdef	___timeri
1116                     	xdef	___timer1sa
1117                     	xref	__iouart_50ms
1118                     	xdef	_timer485Cntl
1119                     	xdef	__swuartCb
1120                     	xdef	__sw_sending
1121                     	xdef	__sw_bit
1122                     	switch	.bss
1123  0000               __sw_data:
1124  0000 00            	ds.b	1
1125                     	xdef	__sw_data
1126                     	xdef	__swuart_tx_tail
1127                     	xdef	__swuart_tx_head
1128  0001               _swTxBuffer:
1129  0001 000000000000  	ds.b	64
1130                     	xdef	_swTxBuffer
1131                     	xref	___rcCb
1132                     	xdef	__io_rc_prev
1133                     	xdef	_beepSet
1134                     	xdef	_beepEnable
1135                     	xdef	_beepCount
1136                     	xdef	____k
1137                     	xdef	_swuart_Write
1138                     	xdef	_timer1CiCb
1139                     	xdef	_timerCalc
1140                     	xdef	_timer2CiCb
1141                     	xdef	_timer4_UpdateCb
1142                     	xdef	_systemTimer
1143                     	xdef	___timer1h
1144                     	xdef	___timer1min
1145                     	xdef	___timer1s
1146                     	xdef	___timer100ms
1147                     	xdef	__t20ms
1148                     	xdef	_timer50usCount
1149                     	xdef	_timer100usCount
1150  0041               __io_buf:
1151  0041 000000000000  	ds.b	48
1152                     	xdef	__io_buf
1153                     	xdef	__io_tail
1154                     	xdef	__io_head
1155                     	xref	_iouart_Write
1156                     	xdef	_timer2Cntl
1157                     	xref	_indiIOUartIdle
1158                     	xref	_indiIOUartSendWait
1159                     	xdef	_timer2_UpdateCb
1160                     	xref	_TIM4_ClearFlag
1161                     	xref	_TIM4_ITConfig
1162                     	xref	_TIM4_Cmd
1163                     	xref	_TIM4_TimeBaseInit
1164                     	xref	_GPIO_ReadInputData
1165                     	xref	_CLK_PeripheralClockConfig
1185                     	end
