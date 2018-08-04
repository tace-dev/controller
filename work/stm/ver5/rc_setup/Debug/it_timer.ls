   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               _timer50usCount:
  21  0000 00            	dc.b	0
  22  0001               _timer100usCount:
  23  0001 00            	dc.b	0
  24  0002               __t20ms:
  25  0002 00            	dc.b	0
  26  0003               __io_head:
  27  0003 00            	dc.b	0
  28  0004               __io_tail:
  29  0004 00            	dc.b	0
  30  0005               ____k:
  31  0005 00            	dc.b	0
  32  0006               _beepCount:
  33  0006 00            	dc.b	0
  34  0007               _beepEnable:
  35  0007 00            	dc.b	0
  75                     ; 21 void	beepSet(uint8_t i)
  75                     ; 22 {
  77                     .text:	section	.text,new
  78  0000               _beepSet:
  82                     ; 27 	beepCount =5;
  84  0000 35050006      	mov	_beepCount,#5
  85                     ; 28 	beepEnable = 1;
  87  0004 35010007      	mov	_beepEnable,#1
  88                     ; 29 }
  91  0008 81            	ret
  94                     	switch	.data
  95  0008               __io_rc_prev:
  96  0008 02            	dc.b	2
  97  0009               __swuart_tx_head:
  98  0009 00            	dc.b	0
  99  000a               __swuart_tx_tail:
 100  000a 00            	dc.b	0
 101  000b               __sw_bit:
 102  000b 00            	dc.b	0
 103  000c               __sw_sending:
 104  000c 00            	dc.b	0
 125                     ; 81 void	timer1CiCb(void)
 125                     ; 82 {	
 126                     .text:	section	.text,new
 127  0000               _timer1CiCb:
 131                     ; 90 }
 134  0000 81            	ret
 161                     ; 92 void	timer2CiCb(void)
 161                     ; 93 {	
 162                     .text:	section	.text,new
 163  0000               _timer2CiCb:
 167                     ; 94 	if( indiIOUartIdle == 0 )
 169  0000 725d0000      	tnz	_indiIOUartIdle
 170  0004 2626          	jrne	L54
 171                     ; 96 		if( ___k != 0 )
 173  0006 725d0005      	tnz	____k
 174  000a 2720          	jreq	L54
 175                     ; 98 			_io_buf[_io_head++] = ___k;
 177  000c c60003        	ld	a,__io_head
 178  000f 97            	ld	xl,a
 179  0010 725c0003      	inc	__io_head
 180  0014 9f            	ld	a,xl
 181  0015 5f            	clrw	x
 182  0016 97            	ld	xl,a
 183  0017 c60005        	ld	a,____k
 184  001a d70041        	ld	(__io_buf,x),a
 185                     ; 99 			if( _io_head == _IO_BUF_SIZE )
 187  001d c60003        	ld	a,__io_head
 188  0020 a130          	cp	a,#48
 189  0022 2604          	jrne	L15
 190                     ; 100 				_io_head = 0;
 192  0024 725f0003      	clr	__io_head
 193  0028               L15:
 194                     ; 101 			___k = 0;
 196  0028 725f0005      	clr	____k
 197  002c               L54:
 198                     ; 104 }
 201  002c 81            	ret
 238                     ; 106 void	timer2_UpdateCb(void)
 238                     ; 107 {
 239                     .text:	section	.text,new
 240  0000               _timer2_UpdateCb:
 242  0000 88            	push	a
 243       00000001      OFST:	set	1
 246                     ; 111 	i = GPIO_ReadInputData(D_IOUART_RX_PORT);
 248  0001 ae500f        	ldw	x,#20495
 249  0004 cd0000        	call	_GPIO_ReadInputData
 251  0007 6b01          	ld	(OFST+0,sp),a
 252                     ; 112 	i = i & D_IOUART_RX_PIN;
 254  0009 7b01          	ld	a,(OFST+0,sp)
 255  000b a420          	and	a,#32
 256  000d 6b01          	ld	(OFST+0,sp),a
 257                     ; 113 	if( i == _io_rc_prev )
 259  000f 7b01          	ld	a,(OFST+0,sp)
 260  0011 c10008        	cp	a,__io_rc_prev
 261  0014 2602          	jrne	L76
 262                     ; 114 		return;
 265  0016 84            	pop	a
 266  0017 81            	ret
 267  0018               L76:
 268                     ; 116 	_io_rc_prev = i;
 270  0018 7b01          	ld	a,(OFST+0,sp)
 271  001a c70008        	ld	__io_rc_prev,a
 272                     ; 117 	if( i == 0 )
 274  001d 0d01          	tnz	(OFST+0,sp)
 275  001f 261e          	jrne	L17
 276                     ; 119 		_io_buf[_io_head] = ___k;
 278  0021 c60003        	ld	a,__io_head
 279  0024 5f            	clrw	x
 280  0025 97            	ld	xl,a
 281  0026 c60005        	ld	a,____k
 282  0029 d70041        	ld	(__io_buf,x),a
 283                     ; 120 		_io_head += 1;
 285  002c 725c0003      	inc	__io_head
 286                     ; 121 		if( _io_head == _IO_BUF_SIZE )
 288  0030 c60003        	ld	a,__io_head
 289  0033 a130          	cp	a,#48
 290  0035 2604          	jrne	L37
 291                     ; 122 			_io_head = 0;
 293  0037 725f0003      	clr	__io_head
 294  003b               L37:
 295                     ; 123 		___k = 0;
 297  003b 725f0005      	clr	____k
 298  003f               L17:
 299                     ; 129 }
 302  003f 84            	pop	a
 303  0040 81            	ret
 326                     ; 131 void	_swuartCb(void)
 326                     ; 132 {
 327                     .text:	section	.text,new
 328  0000               __swuartCb:
 332                     ; 171 }
 335  0000 81            	ret
 370                     ; 173 void	swuart_Write(uint8_t *p, uint8_t size)
 370                     ; 174 {
 371                     .text:	section	.text,new
 372  0000               _swuart_Write:
 376                     ; 184 }
 379  0000 81            	ret
 402                     ; 190 void	timer485Cntl(void)
 402                     ; 191 {
 403                     .text:	section	.text,new
 404  0000               _timer485Cntl:
 408                     ; 237 }
 411  0000 81            	ret
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
 458  000b 2624          	jrne	L341
 459                     ; 261 		timer50usCount = 1;
 461  000d 35010000      	mov	_timer50usCount,#1
 462                     ; 262 		timer100usCount++;
 464  0011 725c0001      	inc	_timer100usCount
 465                     ; 263 		if( timer100usCount == 100 )
 467  0015 c60001        	ld	a,_timer100usCount
 468  0018 a164          	cp	a,#100
 469  001a 262c          	jrne	L151
 470                     ; 265 			_t20ms++;	//	10ms
 472  001c 725c0002      	inc	__t20ms
 473                     ; 266 			if( _t20ms == 100 )
 475  0020 c60002        	ld	a,__t20ms
 476  0023 a164          	cp	a,#100
 477  0025 2604          	jrne	L741
 478                     ; 267 				_t20ms = 0;
 480  0027 725f0002      	clr	__t20ms
 481  002b               L741:
 482                     ; 268 			timer100usCount = 0;
 484  002b 725f0001      	clr	_timer100usCount
 485  002f 2017          	jra	L151
 486  0031               L341:
 487                     ; 356 		timer50usCount = 0;
 489  0031 725f0000      	clr	_timer50usCount
 490                     ; 357 		if( indiIOUartSendWait != 0 )
 492  0035 ce0000        	ldw	x,_indiIOUartSendWait
 493  0038 270b          	jreq	L351
 494                     ; 358 			indiIOUartSendWait--;
 496  003a ce0000        	ldw	x,_indiIOUartSendWait
 497  003d 1d0001        	subw	x,#1
 498  0040 cf0000        	ldw	_indiIOUartSendWait,x
 500  0043 2003          	jra	L151
 501  0045               L351:
 502                     ; 360 			iouart_Write();
 504  0045 cd0000        	call	_iouart_Write
 506  0048               L151:
 507                     ; 374 	__rcCb();
 509  0048 cd0000        	call	___rcCb
 511                     ; 376 }
 514  004b 81            	ret
 517                     	switch	.data
 518  000d               ___timer100ms:
 519  000d 00            	dc.b	0
 520  000e               ___timer1s:
 521  000e 00            	dc.b	0
 522  000f               ___timer1sa:
 523  000f 00            	dc.b	0
 524  0010               ___timer1min:
 525  0010 00            	dc.b	0
 526  0011               ___timer1h:
 527  0011 00            	dc.b	0
 528  0012               ___timeri:
 529  0012 00            	dc.b	0
 530  0013               ___timeri2:
 531  0013 00            	dc.b	0
 532  0014               ___timerOffset:
 533  0014 3c            	dc.b	60
 567                     ; 389 uint8_t	timerCalc2(void)
 567                     ; 390 {
 568                     .text:	section	.text,new
 569  0000               _timerCalc2:
 571  0000 88            	push	a
 572       00000001      OFST:	set	1
 575                     ; 391 	uint8_t	r = 0;
 577                     ; 392 	__timer1sa++;
 579  0001 725c000f      	inc	___timer1sa
 580                     ; 393 	if( __timer1sa != __timerOffset )
 582  0005 c6000f        	ld	a,___timer1sa
 583  0008 c10014        	cp	a,___timerOffset
 584  000b 2704          	jreq	L371
 585                     ; 394 		return r;
 587  000d 4f            	clr	a
 590  000e 5b01          	addw	sp,#1
 591  0010 81            	ret
 592  0011               L371:
 593                     ; 396 	__timerOffset = __timerOffset==60 ? 59 : 60;
 595  0011 c60014        	ld	a,___timerOffset
 596  0014 a13c          	cp	a,#60
 597  0016 2604          	jrne	L62
 598  0018 a63b          	ld	a,#59
 599  001a 2002          	jra	L03
 600  001c               L62:
 601  001c a63c          	ld	a,#60
 602  001e               L03:
 603  001e c70014        	ld	___timerOffset,a
 604                     ; 397 	__timer1sa = 0;
 606  0021 725f000f      	clr	___timer1sa
 607                     ; 398 	__timer1min++;
 609  0025 725c0010      	inc	___timer1min
 610                     ; 399 	r = 1;
 612                     ; 400 	if( __timer1min != 60 )
 614  0029 c60010        	ld	a,___timer1min
 615  002c a13c          	cp	a,#60
 616  002e 2705          	jreq	L571
 617                     ; 401 		return r;
 619  0030 a601          	ld	a,#1
 622  0032 5b01          	addw	sp,#1
 623  0034 81            	ret
 624  0035               L571:
 625                     ; 403 	__timer1min = 0;
 627  0035 725f0010      	clr	___timer1min
 628                     ; 404 	__timer1h++;
 630  0039 725c0011      	inc	___timer1h
 631                     ; 405 	if( __timer1h == 24 )
 633  003d c60011        	ld	a,___timer1h
 634  0040 a118          	cp	a,#24
 635  0042 2604          	jrne	L771
 636                     ; 406 		__timer1h = 0;
 638  0044 725f0011      	clr	___timer1h
 639  0048               L771:
 640                     ; 408 	return r;
 642  0048 a601          	ld	a,#1
 645  004a 5b01          	addw	sp,#1
 646  004c 81            	ret
 649                     	switch	.data
 650  0015               __timer100ms255:
 651  0015 00            	dc.b	0
 694                     ; 411 uint8_t	timerCalc(void)
 694                     ; 412 {
 695                     .text:	section	.text,new
 696  0000               _timerCalc:
 698  0000 89            	pushw	x
 699       00000002      OFST:	set	2
 702                     ; 414 	uint8_t	r = 0;
 704  0001 0f02          	clr	(OFST+0,sp)
 705                     ; 416 	uint8_t	i = _t20ms/10;
 707  0003 c60002        	ld	a,__t20ms
 708  0006 5f            	clrw	x
 709  0007 97            	ld	xl,a
 710  0008 a60a          	ld	a,#10
 711  000a 62            	div	x,a
 712  000b 9f            	ld	a,xl
 713  000c 6b01          	ld	(OFST-1,sp),a
 714                     ; 417 	if( __timeri != i )
 716  000e c60012        	ld	a,___timeri
 717  0011 1101          	cp	a,(OFST-1,sp)
 718  0013 273f          	jreq	L712
 719                     ; 419 		__timeri = i;
 721  0015 7b01          	ld	a,(OFST-1,sp)
 722  0017 c70012        	ld	___timeri,a
 723                     ; 420 		__timer100ms++;
 725  001a 725c000d      	inc	___timer100ms
 726                     ; 421 		_timer100ms255++;
 728  001e 725c0015      	inc	__timer100ms255
 729                     ; 422 		if( _timer100ms255 == 200 )
 731  0022 c60015        	ld	a,__timer100ms255
 732  0025 a1c8          	cp	a,#200
 733  0027 2604          	jrne	L122
 734                     ; 423 			_timer100ms255 = 0;
 736  0029 725f0015      	clr	__timer100ms255
 737  002d               L122:
 738                     ; 424 		if( __timer100ms != 10 )
 740  002d c6000d        	ld	a,___timer100ms
 741  0030 a10a          	cp	a,#10
 742  0032 2704          	jreq	L322
 743                     ; 425 			return r;
 745  0034 7b02          	ld	a,(OFST+0,sp)
 747  0036 2016          	jra	L43
 748  0038               L322:
 749                     ; 427 		__timer100ms = 0;
 751  0038 725f000d      	clr	___timer100ms
 752                     ; 428 		__timer1s++;
 754  003c 725c000e      	inc	___timer1s
 755                     ; 429 		r = timerCalc2();
 757  0040 cd0000        	call	_timerCalc2
 759  0043 6b02          	ld	(OFST+0,sp),a
 760                     ; 430 		if( __timer1s != 60 )
 762  0045 c6000e        	ld	a,___timer1s
 763  0048 a13c          	cp	a,#60
 764  004a 2704          	jreq	L522
 765                     ; 431 			return r;
 767  004c 7b02          	ld	a,(OFST+0,sp)
 769  004e               L43:
 771  004e 85            	popw	x
 772  004f 81            	ret
 773  0050               L522:
 774                     ; 433 		__timer1s = 0;
 776  0050 725f000e      	clr	___timer1s
 777  0054               L712:
 778                     ; 435 	return r;
 780  0054 7b02          	ld	a,(OFST+0,sp)
 782  0056 20f6          	jra	L43
 810                     ; 445 void	systemTimer(void)
 810                     ; 446 {
 811                     .text:	section	.text,new
 812  0000               _systemTimer:
 816                     ; 460 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 818  0000 ae0201        	ldw	x,#513
 819  0003 cd0000        	call	_CLK_PeripheralClockConfig
 821                     ; 461 	TIM4_TimeBaseInit(TIM4_Prescaler_32, TIMER_PERIOD);
 823  0006 ae0518        	ldw	x,#1304
 824  0009 cd0000        	call	_TIM4_TimeBaseInit
 826                     ; 462 	TIM4_ClearFlag(TIM4_FLAG_Update);
 828  000c a601          	ld	a,#1
 829  000e cd0000        	call	_TIM4_ClearFlag
 831                     ; 463 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 833  0011 ae0101        	ldw	x,#257
 834  0014 cd0000        	call	_TIM4_ITConfig
 836                     ; 464 	TIM4_Cmd(ENABLE);
 838  0017 a601          	ld	a,#1
 839  0019 cd0000        	call	_TIM4_Cmd
 841                     ; 515 }
 844  001c 81            	ret
 876                     ; 517 void	timer2Cntl(uint8_t mode)
 876                     ; 518 {
 877                     .text:	section	.text,new
 878  0000               _timer2Cntl:
 882                     ; 522 	return;
 885  0000 81            	ret
1123                     	xdef	__timer100ms255
1124                     	xdef	_timerCalc2
1125                     	xdef	___timerOffset
1126                     	xdef	___timeri2
1127                     	xdef	___timeri
1128                     	xdef	___timer1sa
1129                     	xref	__iouart_50ms
1130                     	xdef	_timer485Cntl
1131                     	xdef	__swuartCb
1132                     	xdef	__sw_sending
1133                     	xdef	__sw_bit
1134                     	switch	.bss
1135  0000               __sw_data:
1136  0000 00            	ds.b	1
1137                     	xdef	__sw_data
1138                     	xdef	__swuart_tx_tail
1139                     	xdef	__swuart_tx_head
1140  0001               _swTxBuffer:
1141  0001 000000000000  	ds.b	64
1142                     	xdef	_swTxBuffer
1143                     	xref	___rcCb
1144                     	xdef	__io_rc_prev
1145                     	xdef	_beepSet
1146                     	xdef	_beepEnable
1147                     	xdef	_beepCount
1148                     	xdef	____k
1149                     	xdef	_swuart_Write
1150                     	xdef	_timer1CiCb
1151                     	xdef	_timerCalc
1152                     	xdef	_timer2CiCb
1153                     	xdef	_timer4_UpdateCb
1154                     	xdef	_systemTimer
1155                     	xdef	___timer1h
1156                     	xdef	___timer1min
1157                     	xdef	___timer1s
1158                     	xdef	___timer100ms
1159                     	xdef	__t20ms
1160                     	xdef	_timer50usCount
1161                     	xdef	_timer100usCount
1162  0041               __io_buf:
1163  0041 000000000000  	ds.b	48
1164                     	xdef	__io_buf
1165                     	xdef	__io_tail
1166                     	xdef	__io_head
1167                     	xref	_iouart_Write
1168                     	xdef	_timer2Cntl
1169                     	xref	_indiIOUartIdle
1170                     	xref	_indiIOUartSendWait
1171                     	xdef	_timer2_UpdateCb
1172                     	xref	_TIM4_ClearFlag
1173                     	xref	_TIM4_ITConfig
1174                     	xref	_TIM4_Cmd
1175                     	xref	_TIM4_TimeBaseInit
1176                     	xref	_GPIO_ReadInputData
1177                     	xref	_CLK_PeripheralClockConfig
1197                     	end
