   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               _indiEncoderPrevCode:
  21  0000 64            	dc.b	100
  22  0001               _indiEncoderFlag:
  23  0001 00            	dc.b	0
  24  0002               _indiEncoderMove:
  25  0002 00            	dc.b	0
  26  0003               __key_sec:
  27  0003 00            	dc.b	0
  28  0004               __key_min:
  29  0004 00            	dc.b	0
  30  0005               __key_hour:
  31  0005 00            	dc.b	0
  32  0006               ___key2:
  33  0006 00            	dc.b	0
  34  0007               ___key_2:
  35  0007 00            	dc.b	0
  87                     ; 28 uint8_t	key_get(void)
  87                     ; 29 {
  89                     .text:	section	.text,new
  90  0000               _key_get:
  92  0000 5203          	subw	sp,#3
  93       00000003      OFST:	set	3
  96                     ; 31 	uint8_t	b = GPIO_ReadInputData(D_KEY_4PORT);
  98  0002 ae500a        	ldw	x,#20490
  99  0005 cd0000        	call	_GPIO_ReadInputData
 101  0008 6b02          	ld	(OFST-1,sp),a
 102                     ; 32 	uint8_t r = (b>>5) & 0x03;
 104  000a 7b02          	ld	a,(OFST-1,sp)
 105  000c 4e            	swap	a
 106  000d 44            	srl	a
 107  000e a407          	and	a,#7
 108  0010 a403          	and	a,#3
 109  0012 6b03          	ld	(OFST+0,sp),a
 110                     ; 33 	b = GPIO_ReadInputData(D_KEY_2PORT);
 112  0014 ae5000        	ldw	x,#20480
 113  0017 cd0000        	call	_GPIO_ReadInputData
 115  001a 6b02          	ld	(OFST-1,sp),a
 116                     ; 34 	r = (r<<2) | ((b>>2)&0x03);
 118  001c 7b02          	ld	a,(OFST-1,sp)
 119  001e 44            	srl	a
 120  001f 44            	srl	a
 121  0020 a403          	and	a,#3
 122  0022 6b01          	ld	(OFST-2,sp),a
 123  0024 7b03          	ld	a,(OFST+0,sp)
 124  0026 48            	sll	a
 125  0027 48            	sll	a
 126  0028 1a01          	or	a,(OFST-2,sp)
 127  002a 6b03          	ld	(OFST+0,sp),a
 128                     ; 35 	r = r & 0x0f;
 130  002c 7b03          	ld	a,(OFST+0,sp)
 131  002e a40f          	and	a,#15
 132  0030 6b03          	ld	(OFST+0,sp),a
 133                     ; 38 	if( r != 0x0f )
 135  0032 7b03          	ld	a,(OFST+0,sp)
 136  0034 a10f          	cp	a,#15
 137  0036 270c          	jreq	L72
 138                     ; 40 		KEY_CLEAR;
 140  0038 725f0005      	clr	__key_hour
 141  003c 725f0004      	clr	__key_min
 142  0040 725f0003      	clr	__key_sec
 143  0044               L72:
 144                     ; 43 	if( __key2 != __timer1s )
 146  0044 c60006        	ld	a,___key2
 147  0047 c10000        	cp	a,___timer1s
 148  004a 2733          	jreq	L13
 149                     ; 45 		if( __key_2 == 0 )
 151  004c 725d0007      	tnz	___key_2
 152  0050 2631          	jrne	L14
 153                     ; 47 			__key_2 = 1;
 155  0052 35010007      	mov	___key_2,#1
 156                     ; 48 			_key_sec++;
 158  0056 725c0003      	inc	__key_sec
 159                     ; 49 			if( _key_sec == 60 )
 161  005a c60003        	ld	a,__key_sec
 162  005d a13c          	cp	a,#60
 163  005f 2617          	jrne	L53
 164                     ; 51 				_key_sec = 0;
 166  0061 725f0003      	clr	__key_sec
 167                     ; 52 				_key_min++;
 169  0065 725c0004      	inc	__key_min
 170                     ; 53 				if( _key_min == 60 )
 172  0069 c60004        	ld	a,__key_min
 173  006c a13c          	cp	a,#60
 174  006e 2608          	jrne	L53
 175                     ; 55 					_key_min = 0;
 177  0070 725f0004      	clr	__key_min
 178                     ; 56 					_key_hour++;
 180  0074 725c0005      	inc	__key_hour
 181  0078               L53:
 182                     ; 59 			__key2 = __timer1s;
 184  0078 5500000006    	mov	___key2,___timer1s
 185  007d 2004          	jra	L14
 186  007f               L13:
 187                     ; 63 		__key_2 = 0;
 189  007f 725f0007      	clr	___key_2
 190  0083               L14:
 191                     ; 65 	return (r & 0x0f);
 193  0083 7b03          	ld	a,(OFST+0,sp)
 194  0085 a40f          	and	a,#15
 197  0087 5b03          	addw	sp,#3
 198  0089 81            	ret
 233                     ; 71 void	encoder_resetCount(uint8_t code)
 233                     ; 72 {
 234                     .text:	section	.text,new
 235  0000               _encoder_resetCount:
 239                     ; 74 	TIM1_SetCounter(100);
 241  0000 ae0064        	ldw	x,#100
 242  0003 cd0000        	call	_TIM1_SetCounter
 244                     ; 75 	indiEncoderCode = 100;
 246  0006 35640000      	mov	_indiEncoderCode,#100
 247                     ; 82 	indiEncoderPrevCode = indiEncoderCode;
 249  000a 5500000000    	mov	_indiEncoderPrevCode,_indiEncoderCode
 250                     ; 84 }
 253  000f 81            	ret
 289                     ; 86 void	encoder_irq(void)
 289                     ; 87 {
 290                     .text:	section	.text,new
 291  0000               _encoder_irq:
 293  0000 89            	pushw	x
 294       00000002      OFST:	set	2
 297                     ; 90 	i = (uint8_t)TIM1_GetCounter();
 299  0001 cd0000        	call	_TIM1_GetCounter
 301  0004 9f            	ld	a,xl
 302  0005 5f            	clrw	x
 303  0006 97            	ld	xl,a
 304  0007 1f01          	ldw	(OFST-1,sp),x
 305                     ; 91 	indiEncoderCode = i;
 307  0009 7b02          	ld	a,(OFST+0,sp)
 308  000b c70000        	ld	_indiEncoderCode,a
 309                     ; 92 	indiEncoderFlag = 1;
 311  000e 35010001      	mov	_indiEncoderFlag,#1
 312                     ; 93 	if( indiEncoderCode > 195 || indiEncoderCode < 5 )
 314  0012 c60000        	ld	a,_indiEncoderCode
 315  0015 a1c4          	cp	a,#196
 316  0017 2407          	jruge	L57
 318  0019 c60000        	ld	a,_indiEncoderCode
 319  001c a105          	cp	a,#5
 320  001e 2406          	jruge	L37
 321  0020               L57:
 322                     ; 94 		encoder_resetCount(indiEncoderCode);
 324  0020 c60000        	ld	a,_indiEncoderCode
 325  0023 cd0000        	call	_encoder_resetCount
 327  0026               L37:
 328                     ; 96 }
 331  0026 85            	popw	x
 332  0027 81            	ret
 335                     	switch	.data
 336  0008               __key_pressed:
 337  0008 00            	dc.b	0
 338  0009               __key_timer:
 339  0009 00            	dc.b	0
 340  000a               __key_code:
 341  000a 00            	dc.b	0
 342  000b               __key_complete:
 343  000b 00            	dc.b	0
 344  000c               __enc_t1:
 345  000c 00            	dc.b	0
 346  000d               __key_continue:
 347  000d 00            	dc.b	0
 407                     ; 107 uint8_t	key_ready(void)
 407                     ; 108 {
 408                     .text:	section	.text,new
 409  0000               _key_ready:
 411  0000 5203          	subw	sp,#3
 412       00000003      OFST:	set	3
 415                     ; 111 	uint8_t i = 0;
 417  0002 0f02          	clr	(OFST-1,sp)
 418                     ; 112 	uint8_t r = 0;
 420  0004 0f03          	clr	(OFST+0,sp)
 421                     ; 113 	if( indiEncoderFlag == 1 )
 423  0006 c60001        	ld	a,_indiEncoderFlag
 424  0009 a101          	cp	a,#1
 425  000b 2671          	jrne	L121
 426                     ; 115 		indiEncoderFlag = 0;
 428  000d 725f0001      	clr	_indiEncoderFlag
 429                     ; 117 		if( indiEncoderCode > indiEncoderPrevCode )
 431  0011 c60000        	ld	a,_indiEncoderCode
 432  0014 c10000        	cp	a,_indiEncoderPrevCode
 433  0017 230e          	jrule	L321
 434                     ; 119 			r = 0xc0;	//	b1100
 436  0019 a6c0          	ld	a,#192
 437  001b 6b03          	ld	(OFST+0,sp),a
 438                     ; 120 			i = indiEncoderCode - indiEncoderPrevCode;
 440  001d c60000        	ld	a,_indiEncoderCode
 441  0020 c00000        	sub	a,_indiEncoderPrevCode
 442  0023 6b02          	ld	(OFST-1,sp),a
 444  0025 2014          	jra	L521
 445  0027               L321:
 446                     ; 122 		else if( indiEncoderCode < indiEncoderPrevCode )
 448  0027 c60000        	ld	a,_indiEncoderCode
 449  002a c10000        	cp	a,_indiEncoderPrevCode
 450  002d 244b          	jruge	L721
 451                     ; 124 			r = 0xa0;	//	b1010
 453  002f a6a0          	ld	a,#160
 454  0031 6b03          	ld	(OFST+0,sp),a
 455                     ; 125 			i = indiEncoderPrevCode - indiEncoderCode;
 457  0033 c60000        	ld	a,_indiEncoderPrevCode
 458  0036 c00000        	sub	a,_indiEncoderCode
 459  0039 6b02          	ld	(OFST-1,sp),a
 461  003b               L521:
 462                     ; 130 		indiEncoderPrevCode = indiEncoderCode;
 464  003b 5500000000    	mov	_indiEncoderPrevCode,_indiEncoderCode
 465                     ; 131 		if( _enc_t1 != timer100usCount/10 )//_t20ms )
 467  0040 c60000        	ld	a,_timer100usCount
 468  0043 5f            	clrw	x
 469  0044 97            	ld	xl,a
 470  0045 a60a          	ld	a,#10
 471  0047 cd0000        	call	c_sdivx
 473  004a c6000c        	ld	a,__enc_t1
 474  004d 905f          	clrw	y
 475  004f 9097          	ld	yl,a
 476  0051 90bf00        	ldw	c_y,y
 477  0054 b300          	cpw	x,c_y
 478  0056 2726          	jreq	L121
 479                     ; 133 			encoder_resetCount(0);
 481  0058 4f            	clr	a
 482  0059 cd0000        	call	_encoder_resetCount
 484                     ; 134 			KEY_CLEAR;
 486  005c 725f0005      	clr	__key_hour
 487  0060 725f0004      	clr	__key_min
 488  0064 725f0003      	clr	__key_sec
 489                     ; 135 			_enc_t1 = timer100usCount/10;//_t20ms;
 491  0068 c60000        	ld	a,_timer100usCount
 492  006b 5f            	clrw	x
 493  006c 97            	ld	xl,a
 494  006d a60a          	ld	a,#10
 495  006f 62            	div	x,a
 496  0070 9f            	ld	a,xl
 497  0071 c7000c        	ld	__enc_t1,a
 498                     ; 136 			return r | i;
 500  0074 7b03          	ld	a,(OFST+0,sp)
 501  0076 1a02          	or	a,(OFST-1,sp)
 503  0078 2001          	jra	L41
 504  007a               L721:
 505                     ; 128 			return 0;
 507  007a 4f            	clr	a
 509  007b               L41:
 511  007b 5b03          	addw	sp,#3
 512  007d 81            	ret
 513  007e               L121:
 514                     ; 140 	if( _t20ms == _key_timer )
 516  007e c60000        	ld	a,__t20ms
 517  0081 c10009        	cp	a,__key_timer
 518  0084 2603          	jrne	L531
 519                     ; 141 		return 0;
 521  0086 4f            	clr	a
 523  0087 20f2          	jra	L41
 524  0089               L531:
 525                     ; 143 	_key_timer = _t20ms;
 527  0089 5500000009    	mov	__key_timer,__t20ms
 528                     ; 144 	t = key_get();
 530  008e cd0000        	call	_key_get
 532  0091 6b01          	ld	(OFST-2,sp),a
 533                     ; 145 	if( t == 0x0f )
 535  0093 7b01          	ld	a,(OFST-2,sp)
 536  0095 a10f          	cp	a,#15
 537  0097 2736          	jreq	L77
 538                     ; 146 		goto err;
 540                     ; 148 	if( (t & 0x08) == 0 )
 542  0099 7b01          	ld	a,(OFST-2,sp)
 543  009b a508          	bcp	a,#8
 544  009d 2606          	jrne	L141
 545                     ; 150 		i++;
 547  009f 0c02          	inc	(OFST-1,sp)
 548                     ; 151 		r = 4;
 550  00a1 a604          	ld	a,#4
 551  00a3 6b03          	ld	(OFST+0,sp),a
 552  00a5               L141:
 553                     ; 153 	if( (t & 0x04) == 0 )
 555  00a5 7b01          	ld	a,(OFST-2,sp)
 556  00a7 a504          	bcp	a,#4
 557  00a9 2606          	jrne	L341
 558                     ; 155 		i++;
 560  00ab 0c02          	inc	(OFST-1,sp)
 561                     ; 156 		r = 3;
 563  00ad a603          	ld	a,#3
 564  00af 6b03          	ld	(OFST+0,sp),a
 565  00b1               L341:
 566                     ; 158 	if( (t & 0x02) == 0 )
 568  00b1 7b01          	ld	a,(OFST-2,sp)
 569  00b3 a502          	bcp	a,#2
 570  00b5 2606          	jrne	L541
 571                     ; 160 		i++;
 573  00b7 0c02          	inc	(OFST-1,sp)
 574                     ; 161 		r = 2;
 576  00b9 a602          	ld	a,#2
 577  00bb 6b03          	ld	(OFST+0,sp),a
 578  00bd               L541:
 579                     ; 163 	if( (t & 0x01) == 0 )
 581  00bd 7b01          	ld	a,(OFST-2,sp)
 582  00bf a501          	bcp	a,#1
 583  00c1 2606          	jrne	L741
 584                     ; 165 		i++;
 586  00c3 0c02          	inc	(OFST-1,sp)
 587                     ; 166 		r = 1;
 589  00c5 a601          	ld	a,#1
 590  00c7 6b03          	ld	(OFST+0,sp),a
 591  00c9               L741:
 592                     ; 168 	if( i != 1 )
 594  00c9 7b02          	ld	a,(OFST-1,sp)
 595  00cb a101          	cp	a,#1
 596  00cd 2713          	jreq	L151
 597                     ; 169 		goto err;
 598  00cf               L77:
 599                     ; 204 err:
 599                     ; 205 	_key_pressed = 0;
 601  00cf 725f0008      	clr	__key_pressed
 602                     ; 206 	_key_code = 0;
 604  00d3 725f000a      	clr	__key_code
 605                     ; 207 	_key_complete = 0;
 607  00d7 725f000b      	clr	__key_complete
 608                     ; 208 	_key_continue = 0;
 610  00db 725f000d      	clr	__key_continue
 611                     ; 210 	return 0;
 613  00df 4f            	clr	a
 615  00e0 2099          	jra	L41
 616  00e2               L151:
 617                     ; 171 	if( _key_code != r )
 619  00e2 c6000a        	ld	a,__key_code
 620  00e5 1103          	cp	a,(OFST+0,sp)
 621  00e7 2715          	jreq	L351
 622                     ; 173 		_key_code = r;
 624  00e9 7b03          	ld	a,(OFST+0,sp)
 625  00eb c7000a        	ld	__key_code,a
 626                     ; 174 		_key_pressed = 0;
 628  00ee 725f0008      	clr	__key_pressed
 629                     ; 175 		_key_complete = 0;
 631  00f2 725f000b      	clr	__key_complete
 632                     ; 176 		_key_continue = 0;
 634  00f6 725f000d      	clr	__key_continue
 635                     ; 177 		return 0;
 637  00fa 4f            	clr	a
 639  00fb cc007b        	jra	L41
 640  00fe               L351:
 641                     ; 180 	_key_pressed++;
 643  00fe 725c0008      	inc	__key_pressed
 644                     ; 182 	if( _key_pressed >= /*13*/6 )
 646  0102 c60008        	ld	a,__key_pressed
 647  0105 a106          	cp	a,#6
 648  0107 2536          	jrult	L551
 649                     ; 184 		if( _key_complete != 0 )
 651  0109 725d000b      	tnz	__key_complete
 652  010d 2722          	jreq	L751
 653                     ; 186 			_key_complete++;
 655  010f 725c000b      	inc	__key_complete
 656                     ; 187 			_key_pressed = 0;
 658  0113 725f0008      	clr	__key_pressed
 659                     ; 188 			if( _key_complete == /*15*/20 )
 661  0117 c6000b        	ld	a,__key_complete
 662  011a a114          	cp	a,#20
 663  011c 260e          	jrne	L161
 664                     ; 190 				_key_complete = 1;
 666  011e 3501000b      	mov	__key_complete,#1
 667                     ; 191 				_key_continue++;
 669  0122 725c000d      	inc	__key_continue
 670                     ; 193 				return r;
 672  0126 7b03          	ld	a,(OFST+0,sp)
 674  0128 ac7b007b      	jpf	L41
 675  012c               L161:
 676                     ; 195 			return 0;
 678  012c 4f            	clr	a
 680  012d ac7b007b      	jpf	L41
 681  0131               L751:
 682                     ; 199 		_key_pressed = 0;
 684  0131 725f0008      	clr	__key_pressed
 685                     ; 200 		_key_complete = 1;
 687  0135 3501000b      	mov	__key_complete,#1
 688                     ; 201 		return r;
 690  0139 7b03          	ld	a,(OFST+0,sp)
 692  013b ac7b007b      	jpf	L41
 693  013f               L551:
 694                     ; 203 	return 0;
 696  013f 4f            	clr	a
 698  0140 ac7b007b      	jpf	L41
 731                     ; 213 void 	encoder_Open(void)
 731                     ; 214 {
 732                     .text:	section	.text,new
 733  0000               _encoder_Open:
 737                     ; 215 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 739  0000 ae1101        	ldw	x,#4353
 740  0003 cd0000        	call	_CLK_PeripheralClockConfig
 742                     ; 218 	TIM1_EncoderInterfaceConfig (
 742                     ; 219 		TIM1_EncoderMode_TI2, 
 742                     ; 220 		TIM1_ICPolarity_Rising,
 742                     ; 221 		TIM2_ICPolarity_Falling
 742                     ; 222 		);
 744  0006 4b01          	push	#1
 745  0008 ae0200        	ldw	x,#512
 746  000b cd0000        	call	_TIM1_EncoderInterfaceConfig
 748  000e 84            	pop	a
 749                     ; 223 	TIM1_CounterModeConfig(TIM1_CounterMode_CenterAligned1);
 751  000f a620          	ld	a,#32
 752  0011 cd0000        	call	_TIM1_CounterModeConfig
 754                     ; 224 	TIM1_SetCounter(100);
 756  0014 ae0064        	ldw	x,#100
 757  0017 cd0000        	call	_TIM1_SetCounter
 759                     ; 228 	TIM1_SelectInputTrigger(TIM1_TRGSelection_TI1FP1);
 761  001a a650          	ld	a,#80
 762  001c cd0000        	call	_TIM1_SelectInputTrigger
 764                     ; 229 	TIM1_ITConfig(TIM1_FLAG_Trigger, ENABLE);
 766  001f ae4001        	ldw	x,#16385
 767  0022 cd0000        	call	_TIM1_ITConfig
 769                     ; 232 	TIM1_ICInit(
 769                     ; 233 		TIM1_Channel_3, 
 769                     ; 234 //		TIM1_ICPolarity_Rising,
 769                     ; 235 		TIM1_ICPolarity_Falling,
 769                     ; 236 		TIM1_ICSelection_DirectTI,
 769                     ; 237 		TIM1_ICPSC_DIV1,
 769                     ; 238 		0
 769                     ; 239 		);
 771  0025 4b00          	push	#0
 772  0027 4b00          	push	#0
 773  0029 4b01          	push	#1
 774  002b ae0201        	ldw	x,#513
 775  002e cd0000        	call	_TIM1_ICInit
 777  0031 5b03          	addw	sp,#3
 778                     ; 240 	TIM1_ClearFlag(TIM1_FLAG_CC3);	
 780  0033 ae0008        	ldw	x,#8
 781  0036 cd0000        	call	_TIM1_ClearFlag
 783                     ; 241 	TIM1_ITConfig(TIM1_IT_CC3, ENABLE);
 785  0039 ae0801        	ldw	x,#2049
 786  003c cd0000        	call	_TIM1_ITConfig
 788                     ; 242 	TIM1_Cmd(ENABLE);
 790  003f a601          	ld	a,#1
 791  0041 cd0000        	call	_TIM1_Cmd
 793                     ; 260 	GPIO_Init(D_KEY_4PORT, D_KEY_4PIN, GPIO_Mode_In_PU_No_IT);
 795  0044 4b40          	push	#64
 796  0046 4b06          	push	#6
 797  0048 ae500a        	ldw	x,#20490
 798  004b cd0000        	call	_GPIO_Init
 800  004e 85            	popw	x
 801                     ; 261 	GPIO_Init(D_KEY_3PORT, D_KEY_3PIN, GPIO_Mode_In_PU_No_IT);
 803  004f 4b40          	push	#64
 804  0051 4b05          	push	#5
 805  0053 ae500a        	ldw	x,#20490
 806  0056 cd0000        	call	_GPIO_Init
 808  0059 85            	popw	x
 809                     ; 262 	GPIO_Init(D_KEY_2PORT, D_KEY_2PIN, GPIO_Mode_In_PU_No_IT);
 811  005a 4b40          	push	#64
 812  005c 4b03          	push	#3
 813  005e ae5000        	ldw	x,#20480
 814  0061 cd0000        	call	_GPIO_Init
 816  0064 85            	popw	x
 817                     ; 263 	GPIO_Init(D_KEY_1PORT, D_KEY_1PIN, GPIO_Mode_In_PU_No_IT);
 819  0065 4b40          	push	#64
 820  0067 4b02          	push	#2
 821  0069 ae5000        	ldw	x,#20480
 822  006c cd0000        	call	_GPIO_Init
 824  006f 85            	popw	x
 825                     ; 265 }
 828  0070 81            	ret
 957                     	xdef	__key_continue
 958                     	xdef	__enc_t1
 959                     	xdef	__key_complete
 960                     	xdef	__key_code
 961                     	xdef	__key_timer
 962                     	xdef	__key_pressed
 963                     	xdef	_encoder_resetCount
 964                     	xdef	___key_2
 965                     	xdef	___key2
 966                     	xdef	__key_hour
 967                     	xdef	__key_min
 968                     	xdef	__key_sec
 969                     	xdef	_indiEncoderMove
 970                     	xdef	_indiEncoderPrevCode
 971                     	xref	___timer1s
 972                     	xref	__t20ms
 973                     	xref	_timer100usCount
 974                     	xdef	_key_ready
 975                     	xdef	_encoder_Open
 976                     	xdef	_encoder_irq
 977                     	xdef	_indiEncoderFlag
 978                     	switch	.bss
 979  0000               _indiEncoderCode:
 980  0000 00            	ds.b	1
 981                     	xdef	_indiEncoderCode
 982                     	xdef	_key_get
 983                     	xref	_TIM1_EncoderInterfaceConfig
 984                     	xref	_TIM1_SelectInputTrigger
 985                     	xref	_TIM1_ClearFlag
 986                     	xref	_TIM1_ITConfig
 987                     	xref	_TIM1_ICInit
 988                     	xref	_TIM1_Cmd
 989                     	xref	_TIM1_GetCounter
 990                     	xref	_TIM1_SetCounter
 991                     	xref	_TIM1_CounterModeConfig
 992                     	xref	_GPIO_ReadInputData
 993                     	xref	_GPIO_Init
 994                     	xref	_CLK_PeripheralClockConfig
 995                     	xref.b	c_x
 996                     	xref.b	c_y
1016                     	xref	c_sdivx
1017                     	end
