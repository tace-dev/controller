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
 439                     ; 241 void	timer4_UpdateCb(void)
 439                     ; 242 {
 440                     .text:	section	.text,new
 441  0000               _timer4_UpdateCb:
 445                     ; 243 	_iouart_50ms();
 447  0000 cd0000        	call	__iouart_50ms
 449                     ; 252 	___k++;
 451  0003 725c0005      	inc	____k
 452                     ; 253 	if( timer50usCount == 0 )
 454  0007 725d0000      	tnz	_timer50usCount
 455  000b 2624          	jrne	L341
 456                     ; 261 		timer50usCount = 1;
 458  000d 35010000      	mov	_timer50usCount,#1
 459                     ; 262 		timer100usCount++;
 461  0011 725c0001      	inc	_timer100usCount
 462                     ; 263 		if( timer100usCount == 100 )
 464  0015 c60001        	ld	a,_timer100usCount
 465  0018 a164          	cp	a,#100
 466  001a 2627          	jrne	L151
 467                     ; 265 			_t20ms++;	//	10ms
 469  001c 725c0002      	inc	__t20ms
 470                     ; 266 			if( _t20ms == 100 )
 472  0020 c60002        	ld	a,__t20ms
 473  0023 a164          	cp	a,#100
 474  0025 2604          	jrne	L741
 475                     ; 267 				_t20ms = 0;
 477  0027 725f0002      	clr	__t20ms
 478  002b               L741:
 479                     ; 268 			timer100usCount = 0;
 481  002b 725f0001      	clr	_timer100usCount
 482  002f 2012          	jra	L151
 483  0031               L341:
 484                     ; 356 		timer50usCount = 0;
 486  0031 725f0000      	clr	_timer50usCount
 487                     ; 357 		if( indiIOUartSendWait != 0 )
 489  0035 ce0000        	ldw	x,_indiIOUartSendWait
 490  0038 2706          	jreq	L351
 491                     ; 358 			indiIOUartSendWait--;
 493  003a 5a            	decw	x
 494  003b cf0000        	ldw	_indiIOUartSendWait,x
 496  003e 2003          	jra	L151
 497  0040               L351:
 498                     ; 360 			iouart_Write();
 500  0040 cd0000        	call	_iouart_Write
 502  0043               L151:
 503                     ; 374 	__rcCb();
 506                     ; 376 }
 509  0043 cc0000        	jp	___rcCb
 512                     	switch	.data
 513  000d               ___timer100ms:
 514  000d 00            	dc.b	0
 515  000e               ___timer1s:
 516  000e 00            	dc.b	0
 517  000f               ___timer1sa:
 518  000f 00            	dc.b	0
 519  0010               ___timer1min:
 520  0010 00            	dc.b	0
 521  0011               ___timer1h:
 522  0011 00            	dc.b	0
 523  0012               ___timeri:
 524  0012 00            	dc.b	0
 525  0013               ___timeri2:
 526  0013 00            	dc.b	0
 527  0014               ___timerOffset:
 528  0014 3c            	dc.b	60
 562                     ; 389 uint8_t	timerCalc2(void)
 562                     ; 390 {
 563                     .text:	section	.text,new
 564  0000               _timerCalc2:
 566  0000 88            	push	a
 567       00000001      OFST:	set	1
 570                     ; 391 	uint8_t	r = 0;
 572                     ; 392 	__timer1sa++;
 574  0001 725c000f      	inc	___timer1sa
 575                     ; 393 	if( __timer1sa != __timerOffset )
 577  0005 c6000f        	ld	a,___timer1sa
 578  0008 c10014        	cp	a,___timerOffset
 579  000b 2704          	jreq	L371
 580                     ; 394 		return r;
 582  000d 4f            	clr	a
 585  000e 5b01          	addw	sp,#1
 586  0010 81            	ret	
 587  0011               L371:
 588                     ; 396 	__timerOffset = __timerOffset==60 ? 59 : 60;
 590  0011 c60014        	ld	a,___timerOffset
 591  0014 a13c          	cp	a,#60
 592  0016 2604          	jrne	L63
 593  0018 a63b          	ld	a,#59
 594  001a 2002          	jra	L04
 595  001c               L63:
 596  001c a63c          	ld	a,#60
 597  001e               L04:
 598  001e c70014        	ld	___timerOffset,a
 599                     ; 397 	__timer1sa = 0;
 601  0021 725f000f      	clr	___timer1sa
 602                     ; 398 	__timer1min++;
 604  0025 725c0010      	inc	___timer1min
 605                     ; 399 	r = 1;
 607                     ; 400 	if( __timer1min != 60 )
 609  0029 c60010        	ld	a,___timer1min
 610  002c a13c          	cp	a,#60
 611  002e 2705          	jreq	L571
 612                     ; 401 		return r;
 614  0030 a601          	ld	a,#1
 617  0032 5b01          	addw	sp,#1
 618  0034 81            	ret	
 619  0035               L571:
 620                     ; 403 	__timer1min = 0;
 622  0035 725f0010      	clr	___timer1min
 623                     ; 404 	__timer1h++;
 625  0039 725c0011      	inc	___timer1h
 626                     ; 405 	if( __timer1h == 24 )
 628  003d c60011        	ld	a,___timer1h
 629  0040 a118          	cp	a,#24
 630  0042 2604          	jrne	L771
 631                     ; 406 		__timer1h = 0;
 633  0044 725f0011      	clr	___timer1h
 634  0048               L771:
 635                     ; 408 	return r;
 637  0048 a601          	ld	a,#1
 640  004a 5b01          	addw	sp,#1
 641  004c 81            	ret	
 644                     	switch	.data
 645  0015               __timer100ms255:
 646  0015 00            	dc.b	0
 689                     ; 411 uint8_t	timerCalc(void)
 689                     ; 412 {
 690                     .text:	section	.text,new
 691  0000               _timerCalc:
 693  0000 89            	pushw	x
 694       00000002      OFST:	set	2
 697                     ; 414 	uint8_t	r = 0;
 699  0001 0f02          	clr	(OFST+0,sp)
 700                     ; 416 	uint8_t	i = _t20ms/10;
 702  0003 c60002        	ld	a,__t20ms
 703  0006 5f            	clrw	x
 704  0007 97            	ld	xl,a
 705  0008 a60a          	ld	a,#10
 706  000a 62            	div	x,a
 707  000b 9f            	ld	a,xl
 708  000c 6b01          	ld	(OFST-1,sp),a
 709                     ; 417 	if( __timeri != i )
 711  000e c60012        	ld	a,___timeri
 712  0011 1101          	cp	a,(OFST-1,sp)
 713  0013 2733          	jreq	L64
 714                     ; 419 		__timeri = i;
 716  0015 7b01          	ld	a,(OFST-1,sp)
 717  0017 c70012        	ld	___timeri,a
 718                     ; 420 		__timer100ms++;
 720  001a 725c000d      	inc	___timer100ms
 721                     ; 421 		_timer100ms255++;
 723  001e 725c0015      	inc	__timer100ms255
 724                     ; 422 		if( _timer100ms255 == 200 )
 726  0022 c60015        	ld	a,__timer100ms255
 727  0025 a1c8          	cp	a,#200
 728  0027 2604          	jrne	L122
 729                     ; 423 			_timer100ms255 = 0;
 731  0029 725f0015      	clr	__timer100ms255
 732  002d               L122:
 733                     ; 424 		if( __timer100ms != 10 )
 735  002d c6000d        	ld	a,___timer100ms
 736  0030 a10a          	cp	a,#10
 737                     ; 425 			return r;
 739  0032 2614          	jrne	L64
 740                     ; 427 		__timer100ms = 0;
 742  0034 725f000d      	clr	___timer100ms
 743                     ; 428 		__timer1s++;
 745  0038 725c000e      	inc	___timer1s
 746                     ; 429 		r = timerCalc2();
 748  003c cd0000        	call	_timerCalc2
 750  003f 6b02          	ld	(OFST+0,sp),a
 751                     ; 430 		if( __timer1s != 60 )
 753  0041 c6000e        	ld	a,___timer1s
 754  0044 a13c          	cp	a,#60
 755  0046 2704          	jreq	L522
 756                     ; 431 			return r;
 759  0048               L64:
 762  0048 7b02          	ld	a,(OFST+0,sp)
 764  004a 85            	popw	x
 765  004b 81            	ret	
 766  004c               L522:
 767                     ; 433 		__timer1s = 0;
 769  004c 725f000e      	clr	___timer1s
 770                     ; 435 	return r;
 772  0050 20f6          	jra	L64
 800                     ; 445 void	systemTimer(void)
 800                     ; 446 {
 801                     .text:	section	.text,new
 802  0000               _systemTimer:
 806                     ; 460 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 808  0000 ae0201        	ldw	x,#513
 809  0003 cd0000        	call	_CLK_PeripheralClockConfig
 811                     ; 461 	TIM4_TimeBaseInit(TIM4_Prescaler_32, TIMER_PERIOD);
 813  0006 ae0518        	ldw	x,#1304
 814  0009 cd0000        	call	_TIM4_TimeBaseInit
 816                     ; 462 	TIM4_ClearFlag(TIM4_FLAG_Update);
 818  000c a601          	ld	a,#1
 819  000e cd0000        	call	_TIM4_ClearFlag
 821                     ; 463 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 823  0011 ae0101        	ldw	x,#257
 824  0014 cd0000        	call	_TIM4_ITConfig
 826                     ; 464 	TIM4_Cmd(ENABLE);
 828  0017 a601          	ld	a,#1
 830                     ; 515 }
 833  0019 cc0000        	jp	_TIM4_Cmd
 865                     ; 517 void	timer2Cntl(uint8_t mode)
 865                     ; 518 {
 866                     .text:	section	.text,new
 867  0000               _timer2Cntl:
 871                     ; 522 	return;
 874  0000 81            	ret	
1112                     	xdef	__timer100ms255
1113                     	xdef	_timerCalc2
1114                     	xdef	___timerOffset
1115                     	xdef	___timeri2
1116                     	xdef	___timeri
1117                     	xdef	___timer1sa
1118                     	xref	__iouart_50ms
1119                     	xdef	_timer485Cntl
1120                     	xdef	__swuartCb
1121                     	xdef	__sw_sending
1122                     	xdef	__sw_bit
1123                     	switch	.bss
1124  0000               __sw_data:
1125  0000 00            	ds.b	1
1126                     	xdef	__sw_data
1127                     	xdef	__swuart_tx_tail
1128                     	xdef	__swuart_tx_head
1129  0001               _swTxBuffer:
1130  0001 000000000000  	ds.b	64
1131                     	xdef	_swTxBuffer
1132                     	xref	___rcCb
1133                     	xdef	__io_rc_prev
1134                     	xdef	_beepSet
1135                     	xdef	_beepEnable
1136                     	xdef	_beepCount
1137                     	xdef	____k
1138                     	xdef	_swuart_Write
1139                     	xdef	_timer1CiCb
1140                     	xdef	_timerCalc
1141                     	xdef	_timer2CiCb
1142                     	xdef	_timer4_UpdateCb
1143                     	xdef	_systemTimer
1144                     	xdef	___timer1h
1145                     	xdef	___timer1min
1146                     	xdef	___timer1s
1147                     	xdef	___timer100ms
1148                     	xdef	__t20ms
1149                     	xdef	_timer50usCount
1150                     	xdef	_timer100usCount
1151  0041               __io_buf:
1152  0041 000000000000  	ds.b	48
1153                     	xdef	__io_buf
1154                     	xdef	__io_tail
1155                     	xdef	__io_head
1156                     	xref	_iouart_Write
1157                     	xdef	_timer2Cntl
1158                     	xref	_indiIOUartIdle
1159                     	xref	_indiIOUartSendWait
1160                     	xdef	_timer2_UpdateCb
1161                     	xref	_TIM4_ClearFlag
1162                     	xref	_TIM4_ITConfig
1163                     	xref	_TIM4_Cmd
1164                     	xref	_TIM4_TimeBaseInit
1165                     	xref	_GPIO_ReadInputData
1166                     	xref	_CLK_PeripheralClockConfig
1186                     	end
