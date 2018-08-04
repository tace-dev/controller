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
  79                     .text:	section	.text,new
  80  0000               f_beepSet:
  84                     ; 27 	beepCount =5;
  86  0000 35050006      	mov	_beepCount,#5
  87                     ; 28 	beepEnable = 1;
  89  0004 35010007      	mov	_beepEnable,#1
  90                     ; 29 }
  93  0008 87            	retf	
  95                     	switch	.data
  96  0008               __io_rc_prev:
  97  0008 02            	dc.b	2
  98  0009               __swuart_tx_head:
  99  0009 00            	dc.b	0
 100  000a               __swuart_tx_tail:
 101  000a 00            	dc.b	0
 102  000b               __sw_bit:
 103  000b 00            	dc.b	0
 104  000c               __sw_sending:
 105  000c 00            	dc.b	0
 126                     ; 81 void	timer1CiCb(void)
 126                     ; 82 {	
 127                     .text:	section	.text,new
 128  0000               f_timer1CiCb:
 132                     ; 90 }
 135  0000 87            	retf	
 161                     ; 92 void	timer2CiCb(void)
 161                     ; 93 {	
 162                     .text:	section	.text,new
 163  0000               f_timer2CiCb:
 167                     ; 94 	if( indiIOUartIdle == 0 )
 169  0000 c60000        	ld	a,_indiIOUartIdle
 170  0003 2624          	jrne	L54
 171                     ; 96 		if( ___k != 0 )
 173  0005 725d0005      	tnz	____k
 174  0009 271e          	jreq	L54
 175                     ; 98 			_io_buf[_io_head++] = ___k;
 177  000b c60003        	ld	a,__io_head
 178  000e 725c0003      	inc	__io_head
 179  0012 5f            	clrw	x
 180  0013 97            	ld	xl,a
 181  0014 c60005        	ld	a,____k
 182  0017 d70041        	ld	(__io_buf,x),a
 183                     ; 99 			if( _io_head == _IO_BUF_SIZE )
 185  001a c60003        	ld	a,__io_head
 186  001d a130          	cp	a,#48
 187  001f 2604          	jrne	L15
 188                     ; 100 				_io_head = 0;
 190  0021 725f0003      	clr	__io_head
 191  0025               L15:
 192                     ; 101 			___k = 0;
 194  0025 725f0005      	clr	____k
 195  0029               L54:
 196                     ; 104 }
 199  0029 87            	retf	
 221                     ; 106 void	timer2_UpdateCb(void)
 221                     ; 107 {
 222                     .text:	section	.text,new
 223  0000               f_timer2_UpdateCb:
 227                     ; 129 }
 230  0000 87            	retf	
 252                     ; 131 void	_swuartCb(void)
 252                     ; 132 {
 253                     .text:	section	.text,new
 254  0000               f__swuartCb:
 258                     ; 172 }
 261  0000 87            	retf	
 311                     ; 174 void	swuart_Write(uint8_t *p, uint8_t size)
 311                     ; 175 {
 312                     .text:	section	.text,new
 313  0000               f_swuart_Write:
 315  0000 89            	pushw	x
 316  0001 88            	push	a
 317       00000001      OFST:	set	1
 320                     ; 179 	for( i=0; i<size; i++ )
 322  0002 0f01          	clr	(OFST+0,sp)
 324  0004 2028          	jra	L121
 325  0006               L511:
 326                     ; 181 		swTxBuffer[_swuart_tx_head] = p[i];
 328  0006 c60009        	ld	a,__swuart_tx_head
 329  0009 5f            	clrw	x
 330  000a 97            	ld	xl,a
 331  000b 89            	pushw	x
 332  000c 7b04          	ld	a,(OFST+3,sp)
 333  000e 97            	ld	xl,a
 334  000f 7b05          	ld	a,(OFST+4,sp)
 335  0011 1b03          	add	a,(OFST+2,sp)
 336  0013 2401          	jrnc	L02
 337  0015 5c            	incw	x
 338  0016               L02:
 339  0016 02            	rlwa	x,a
 340  0017 f6            	ld	a,(x)
 341  0018 85            	popw	x
 342  0019 d70001        	ld	(_swTxBuffer,x),a
 343                     ; 182 		_swuart_tx_head = (_swuart_tx_head + 1) % SW_TX_BUFFER_SIZE;
 345  001c c60009        	ld	a,__swuart_tx_head
 346  001f 5f            	clrw	x
 347  0020 97            	ld	xl,a
 348  0021 5c            	incw	x
 349  0022 a640          	ld	a,#64
 350  0024 8d000000      	callf	d_smodx
 352  0028 01            	rrwa	x,a
 353  0029 c70009        	ld	__swuart_tx_head,a
 354                     ; 179 	for( i=0; i<size; i++ )
 356  002c 0c01          	inc	(OFST+0,sp)
 357  002e               L121:
 360  002e 7b01          	ld	a,(OFST+0,sp)
 361  0030 1107          	cp	a,(OFST+6,sp)
 362  0032 25d2          	jrult	L511
 363                     ; 185 }
 366  0034 5b03          	addw	sp,#3
 367  0036 87            	retf	
 389                     ; 191 void	timer485Cntl(void)
 389                     ; 192 {
 390                     .text:	section	.text,new
 391  0000               f_timer485Cntl:
 395                     ; 238 }
 398  0000 87            	retf	
 428                     ; 242 void	timer4_UpdateCb(void)
 428                     ; 243 {
 429                     .text:	section	.text,new
 430  0000               f_timer4_UpdateCb:
 434                     ; 244 	_iouart_50ms();
 436  0000 8d000000      	callf	f__iouart_50ms
 438                     ; 253 	___k++;
 440  0004 725c0005      	inc	____k
 441                     ; 254 	if( timer50usCount == 0 )
 443  0008 725d0000      	tnz	_timer50usCount
 444  000c 2626          	jrne	L541
 445                     ; 262 		timer50usCount = 1;
 447  000e 35010000      	mov	_timer50usCount,#1
 448                     ; 263 		timer100usCount++;
 450  0012 725c0001      	inc	_timer100usCount
 451                     ; 264 		if( timer100usCount == 100 )
 453  0016 c60001        	ld	a,_timer100usCount
 454  0019 a164          	cp	a,#100
 455  001b 2613          	jrne	L741
 456                     ; 266 			_t20ms++;	//	10ms
 458  001d 725c0002      	inc	__t20ms
 459                     ; 267 			if( _t20ms == 100 )
 461  0021 c60002        	ld	a,__t20ms
 462  0024 a164          	cp	a,#100
 463  0026 2604          	jrne	L151
 464                     ; 268 				_t20ms = 0;
 466  0028 725f0002      	clr	__t20ms
 467  002c               L151:
 468                     ; 269 			timer100usCount = 0;
 470  002c 725f0001      	clr	_timer100usCount
 471  0030               L741:
 472                     ; 336 		_swuartCb();
 477  0030 ac000000      	jpf	f__swuartCb
 478  0034               L541:
 479                     ; 357 		timer50usCount = 0;
 481  0034 725f0000      	clr	_timer50usCount
 482                     ; 358 		if( indiIOUartSendWait != 0 )
 484  0038 ce0000        	ldw	x,_indiIOUartSendWait
 485  003b 2705          	jreq	L551
 486                     ; 359 			indiIOUartSendWait--;
 488  003d 5a            	decw	x
 489  003e cf0000        	ldw	_indiIOUartSendWait,x
 492  0041 87            	retf	
 493  0042               L551:
 494                     ; 361 			iouart_Write();
 497                     ; 377 }
 500  0042 ac000000      	jpf	f_iouart_Write
 502                     	switch	.data
 503  000d               ___timer100ms:
 504  000d 00            	dc.b	0
 505  000e               ___timer1s:
 506  000e 00            	dc.b	0
 507  000f               ___timer1sa:
 508  000f 00            	dc.b	0
 509  0010               ___timer1min:
 510  0010 00            	dc.b	0
 511  0011               ___timer1h:
 512  0011 00            	dc.b	0
 513  0012               ___timeri:
 514  0012 00            	dc.b	0
 515  0013               ___timeri2:
 516  0013 00            	dc.b	0
 517  0014               ___timerOffset:
 518  0014 3c            	dc.b	60
 552                     ; 390 uint8_t	timerCalc2(void)
 552                     ; 391 {
 553                     .text:	section	.text,new
 554  0000               f_timerCalc2:
 556  0000 88            	push	a
 557       00000001      OFST:	set	1
 560                     ; 392 	uint8_t	r = 0;
 562                     ; 393 	__timer1sa++;
 564  0001 725c000f      	inc	___timer1sa
 565                     ; 394 	if( __timer1sa != __timerOffset )
 567  0005 c6000f        	ld	a,___timer1sa
 568  0008 c10014        	cp	a,___timerOffset
 569  000b 2704          	jreq	L571
 570                     ; 395 		return r;
 572  000d 4f            	clr	a
 575  000e 5b01          	addw	sp,#1
 576  0010 87            	retf	
 577  0011               L571:
 578                     ; 397 	__timerOffset = __timerOffset==60 ? 59 : 60;
 580  0011 c60014        	ld	a,___timerOffset
 581  0014 a13c          	cp	a,#60
 582  0016 2604          	jrne	L63
 583  0018 a63b          	ld	a,#59
 584  001a 2002          	jra	L04
 585  001c               L63:
 586  001c a63c          	ld	a,#60
 587  001e               L04:
 588  001e c70014        	ld	___timerOffset,a
 589                     ; 398 	__timer1sa = 0;
 591  0021 725f000f      	clr	___timer1sa
 592                     ; 399 	__timer1min++;
 594  0025 725c0010      	inc	___timer1min
 595                     ; 400 	r = 1;
 597                     ; 401 	if( __timer1min != 60 )
 599  0029 c60010        	ld	a,___timer1min
 600  002c a13c          	cp	a,#60
 601  002e 2705          	jreq	L771
 602                     ; 402 		return r;
 604  0030 a601          	ld	a,#1
 607  0032 5b01          	addw	sp,#1
 608  0034 87            	retf	
 609  0035               L771:
 610                     ; 404 	__timer1min = 0;
 612  0035 725f0010      	clr	___timer1min
 613                     ; 405 	__timer1h++;
 615  0039 725c0011      	inc	___timer1h
 616                     ; 406 	if( __timer1h == 24 )
 618  003d c60011        	ld	a,___timer1h
 619  0040 a118          	cp	a,#24
 620  0042 2604          	jrne	L102
 621                     ; 407 		__timer1h = 0;
 623  0044 725f0011      	clr	___timer1h
 624  0048               L102:
 625                     ; 409 	return r;
 627  0048 a601          	ld	a,#1
 630  004a 5b01          	addw	sp,#1
 631  004c 87            	retf	
 633                     	switch	.data
 634  0015               __timer100ms255:
 635  0015 00            	dc.b	0
 678                     ; 412 uint8_t	timerCalc(void)
 678                     ; 413 {
 679                     .text:	section	.text,new
 680  0000               f_timerCalc:
 682  0000 89            	pushw	x
 683       00000002      OFST:	set	2
 686                     ; 415 	uint8_t	r = 0;
 688  0001 0f02          	clr	(OFST+0,sp)
 689                     ; 417 	uint8_t	i = _t20ms/10;
 691  0003 c60002        	ld	a,__t20ms
 692  0006 5f            	clrw	x
 693  0007 97            	ld	xl,a
 694  0008 a60a          	ld	a,#10
 695  000a 62            	div	x,a
 696  000b 9f            	ld	a,xl
 697  000c 6b01          	ld	(OFST-1,sp),a
 698                     ; 418 	if( __timeri != i )
 700  000e c60012        	ld	a,___timeri
 701  0011 1101          	cp	a,(OFST-1,sp)
 702  0013 2734          	jreq	L64
 703                     ; 420 		__timeri = i;
 705  0015 7b01          	ld	a,(OFST-1,sp)
 706  0017 c70012        	ld	___timeri,a
 707                     ; 421 		__timer100ms++;
 709  001a 725c000d      	inc	___timer100ms
 710                     ; 422 		_timer100ms255++;
 712  001e 725c0015      	inc	__timer100ms255
 713                     ; 423 		if( _timer100ms255 == 200 )
 715  0022 c60015        	ld	a,__timer100ms255
 716  0025 a1c8          	cp	a,#200
 717  0027 2604          	jrne	L322
 718                     ; 424 			_timer100ms255 = 0;
 720  0029 725f0015      	clr	__timer100ms255
 721  002d               L322:
 722                     ; 425 		if( __timer100ms != 10 )
 724  002d c6000d        	ld	a,___timer100ms
 725  0030 a10a          	cp	a,#10
 726                     ; 426 			return r;
 728  0032 2615          	jrne	L64
 729                     ; 428 		__timer100ms = 0;
 731  0034 725f000d      	clr	___timer100ms
 732                     ; 429 		__timer1s++;
 734  0038 725c000e      	inc	___timer1s
 735                     ; 430 		r = timerCalc2();
 737  003c 8d000000      	callf	f_timerCalc2
 739  0040 6b02          	ld	(OFST+0,sp),a
 740                     ; 431 		if( __timer1s != 60 )
 742  0042 c6000e        	ld	a,___timer1s
 743  0045 a13c          	cp	a,#60
 744  0047 2704          	jreq	L722
 745                     ; 432 			return r;
 748  0049               L64:
 751  0049 7b02          	ld	a,(OFST+0,sp)
 753  004b 85            	popw	x
 754  004c 87            	retf	
 755  004d               L722:
 756                     ; 434 		__timer1s = 0;
 758  004d 725f000e      	clr	___timer1s
 759                     ; 436 	return r;
 761  0051 20f6          	jra	L64
 783                     ; 446 void	systemTimer(void)
 783                     ; 447 {
 784                     .text:	section	.text,new
 785  0000               f_systemTimer:
 789                     ; 516 }
 792  0000 87            	retf	
 823                     ; 518 void	timer2Cntl(uint8_t mode)
 823                     ; 519 {
 824                     .text:	section	.text,new
 825  0000               f_timer2Cntl:
 829                     ; 523 	return;
 832  0000 87            	retf	
1069                     	xdef	__timer100ms255
1070                     	xdef	f_timerCalc2
1071                     	xdef	___timerOffset
1072                     	xdef	___timeri2
1073                     	xdef	___timeri
1074                     	xdef	___timer1sa
1075                     	xref	f__iouart_50ms
1076                     	xdef	f_timer485Cntl
1077                     	xdef	f__swuartCb
1078                     	xdef	__sw_sending
1079                     	xdef	__sw_bit
1080                     	switch	.bss
1081  0000               __sw_data:
1082  0000 00            	ds.b	1
1083                     	xdef	__sw_data
1084                     	xdef	__swuart_tx_tail
1085                     	xdef	__swuart_tx_head
1086  0001               _swTxBuffer:
1087  0001 000000000000  	ds.b	64
1088                     	xdef	_swTxBuffer
1089                     	xdef	__io_rc_prev
1090                     	xdef	f_beepSet
1091                     	xdef	_beepEnable
1092                     	xdef	_beepCount
1093                     	xdef	____k
1094                     	xdef	f_swuart_Write
1095                     	xdef	f_timer1CiCb
1096                     	xdef	f_timerCalc
1097                     	xdef	f_timer2CiCb
1098                     	xdef	f_timer4_UpdateCb
1099                     	xdef	f_systemTimer
1100                     	xdef	___timer1h
1101                     	xdef	___timer1min
1102                     	xdef	___timer1s
1103                     	xdef	___timer100ms
1104                     	xdef	__t20ms
1105                     	xdef	_timer50usCount
1106                     	xdef	_timer100usCount
1107  0041               __io_buf:
1108  0041 000000000000  	ds.b	48
1109                     	xdef	__io_buf
1110                     	xdef	__io_tail
1111                     	xdef	__io_head
1112                     	xref	f_iouart_Write
1113                     	xdef	f_timer2Cntl
1114                     	xref	_indiIOUartIdle
1115                     	xref	_indiIOUartSendWait
1116                     	xdef	f_timer2_UpdateCb
1117                     	xref.b	c_x
1137                     	xref	d_smodx
1138                     	end
