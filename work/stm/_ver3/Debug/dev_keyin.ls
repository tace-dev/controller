   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               _indiEncoderPrevCode:
  23  0000 64            	dc.b	100
  24  0001               _indiEncoderFlag:
  25  0001 00            	dc.b	0
  26  0002               _indiEncoderMove:
  27  0002 00            	dc.b	0
  28  0003               __key_sec:
  29  0003 00            	dc.b	0
  30  0004               __key_min:
  31  0004 00            	dc.b	0
  32  0005               __key_hour:
  33  0005 00            	dc.b	0
  34  0006               ___key2:
  35  0006 00            	dc.b	0
  36  0007               ___key_2:
  37  0007 00            	dc.b	0
  89                     ; 28 uint8_t	key_get(void)
  89                     ; 29 {
  91                     	switch	.text
  92  0000               _key_get:
  94  0000 5203          	subw	sp,#3
  95       00000003      OFST:	set	3
  98                     ; 31 	uint8_t	b = GPIO_ReadInputData(D_KEY_4PORT);
 100  0002 ae500a        	ldw	x,#20490
 101  0005 cd0000        	call	_GPIO_ReadInputData
 103  0008 6b02          	ld	(OFST-1,sp),a
 104                     ; 32 	uint8_t r = (b>>5) & 0x03;
 106  000a 4e            	swap	a
 107  000b a406          	and	a,#6
 108  000d 44            	srl	a
 109  000e 6b03          	ld	(OFST+0,sp),a
 110                     ; 33 	b = GPIO_ReadInputData(D_KEY_2PORT);
 112  0010 ae5000        	ldw	x,#20480
 113  0013 cd0000        	call	_GPIO_ReadInputData
 115  0016 6b02          	ld	(OFST-1,sp),a
 116                     ; 34 	r = (r<<2) | ((b>>2)&0x03);
 118  0018 a40c          	and	a,#12
 119  001a 44            	srl	a
 120  001b 44            	srl	a
 121  001c 6b01          	ld	(OFST-2,sp),a
 122  001e 7b03          	ld	a,(OFST+0,sp)
 123  0020 48            	sll	a
 124  0021 48            	sll	a
 125  0022 1a01          	or	a,(OFST-2,sp)
 126                     ; 35 	r = r & 0x0f;
 128  0024 a40f          	and	a,#15
 129  0026 6b03          	ld	(OFST+0,sp),a
 130                     ; 38 	if( r != 0x0f )
 132  0028 a10f          	cp	a,#15
 133  002a 270c          	jreq	L72
 134                     ; 40 		KEY_CLEAR;
 136  002c 725f0005      	clr	__key_hour
 137  0030 725f0004      	clr	__key_min
 138  0034 725f0003      	clr	__key_sec
 139  0038               L72:
 140                     ; 43 	if( __key2 != __timer1s )
 142  0038 c60006        	ld	a,___key2
 143  003b c10000        	cp	a,___timer1s
 144  003e 2732          	jreq	L13
 145                     ; 45 		if( __key_2 == 0 )
 147  0040 c60007        	ld	a,___key_2
 148  0043 2631          	jrne	L14
 149                     ; 47 			__key_2 = 1;
 151  0045 35010007      	mov	___key_2,#1
 152                     ; 48 			_key_sec++;
 154  0049 725c0003      	inc	__key_sec
 155                     ; 49 			if( _key_sec == 60 )
 157  004d c60003        	ld	a,__key_sec
 158  0050 a13c          	cp	a,#60
 159  0052 2617          	jrne	L53
 160                     ; 51 				_key_sec = 0;
 162  0054 725f0003      	clr	__key_sec
 163                     ; 52 				_key_min++;
 165  0058 725c0004      	inc	__key_min
 166                     ; 53 				if( _key_min == 60 )
 168  005c c60004        	ld	a,__key_min
 169  005f a13c          	cp	a,#60
 170  0061 2608          	jrne	L53
 171                     ; 55 					_key_min = 0;
 173  0063 725f0004      	clr	__key_min
 174                     ; 56 					_key_hour++;
 176  0067 725c0005      	inc	__key_hour
 177  006b               L53:
 178                     ; 59 			__key2 = __timer1s;
 180  006b 5500000006    	mov	___key2,___timer1s
 181  0070 2004          	jra	L14
 182  0072               L13:
 183                     ; 63 		__key_2 = 0;
 185  0072 725f0007      	clr	___key_2
 186  0076               L14:
 187                     ; 65 	return (r & 0x0f);
 189  0076 7b03          	ld	a,(OFST+0,sp)
 190  0078 a40f          	and	a,#15
 193  007a 5b03          	addw	sp,#3
 194  007c 81            	ret	
 229                     ; 71 void	encoder_resetCount(uint8_t code)
 229                     ; 72 {
 230                     	switch	.text
 231  007d               _encoder_resetCount:
 235                     ; 74 	TIM1_SetCounter(100);
 237  007d ae0064        	ldw	x,#100
 238  0080 cd0000        	call	_TIM1_SetCounter
 240                     ; 75 	indiEncoderCode = 100;
 242  0083 35640000      	mov	_indiEncoderCode,#100
 243                     ; 82 	indiEncoderPrevCode = indiEncoderCode;
 245  0087 5500000000    	mov	_indiEncoderPrevCode,_indiEncoderCode
 246                     ; 84 }
 249  008c 81            	ret	
 285                     ; 86 void	encoder_irq(void)
 285                     ; 87 {
 286                     	switch	.text
 287  008d               _encoder_irq:
 289  008d 89            	pushw	x
 290       00000002      OFST:	set	2
 293                     ; 90 	i = (uint8_t)TIM1_GetCounter();
 295  008e cd0000        	call	_TIM1_GetCounter
 297  0091 9f            	ld	a,xl
 298  0092 5f            	clrw	x
 299  0093 97            	ld	xl,a
 300  0094 1f01          	ldw	(OFST-1,sp),x
 301                     ; 91 	indiEncoderCode = i;
 303  0096 7b02          	ld	a,(OFST+0,sp)
 304  0098 c70000        	ld	_indiEncoderCode,a
 305                     ; 92 	indiEncoderFlag = 1;
 307  009b 35010001      	mov	_indiEncoderFlag,#1
 308                     ; 93 	if( indiEncoderCode > 195 || indiEncoderCode < 5 )
 310  009f c60000        	ld	a,_indiEncoderCode
 311  00a2 a1c4          	cp	a,#196
 312  00a4 2407          	jruge	L57
 314  00a6 c60000        	ld	a,_indiEncoderCode
 315  00a9 a105          	cp	a,#5
 316  00ab 2405          	jruge	L37
 317  00ad               L57:
 318                     ; 94 		encoder_resetCount(indiEncoderCode);
 320  00ad c60000        	ld	a,_indiEncoderCode
 321  00b0 adcb          	call	_encoder_resetCount
 323  00b2               L37:
 324                     ; 96 }
 327  00b2 85            	popw	x
 328  00b3 81            	ret	
 331                     	switch	.data
 332  0008               __key_pressed:
 333  0008 00            	dc.b	0
 334  0009               __key_timer:
 335  0009 00            	dc.b	0
 336  000a               __key_code:
 337  000a 00            	dc.b	0
 338  000b               __key_complete:
 339  000b 00            	dc.b	0
 340  000c               __enc_t1:
 341  000c 00            	dc.b	0
 342  000d               __key_continue:
 343  000d 00            	dc.b	0
 403                     ; 107 uint8_t	key_ready(void)
 403                     ; 108 {
 404                     	switch	.text
 405  00b4               _key_ready:
 407  00b4 5203          	subw	sp,#3
 408       00000003      OFST:	set	3
 411                     ; 111 	uint8_t i = 0;
 413  00b6 0f02          	clr	(OFST-1,sp)
 414                     ; 112 	uint8_t r = 0;
 416  00b8 0f03          	clr	(OFST+0,sp)
 417                     ; 113 	if( indiEncoderFlag == 1 )
 419  00ba c60001        	ld	a,_indiEncoderFlag
 420  00bd 4a            	dec	a
 421  00be 266e          	jrne	L121
 422                     ; 115 		indiEncoderFlag = 0;
 424  00c0 c70001        	ld	_indiEncoderFlag,a
 425                     ; 117 		if( indiEncoderCode > indiEncoderPrevCode )
 427  00c3 c60000        	ld	a,_indiEncoderCode
 428  00c6 c10000        	cp	a,_indiEncoderPrevCode
 429  00c9 230c          	jrule	L321
 430                     ; 119 			r = 0xc0;	//	b1100
 432  00cb a6c0          	ld	a,#192
 433  00cd 6b03          	ld	(OFST+0,sp),a
 434                     ; 120 			i = indiEncoderCode - indiEncoderPrevCode;
 436  00cf c60000        	ld	a,_indiEncoderCode
 437  00d2 c00000        	sub	a,_indiEncoderPrevCode
 439  00d5 2012          	jra	L521
 440  00d7               L321:
 441                     ; 122 		else if( indiEncoderCode < indiEncoderPrevCode )
 443  00d7 c60000        	ld	a,_indiEncoderCode
 444  00da c10000        	cp	a,_indiEncoderPrevCode
 445  00dd 244b          	jruge	L721
 446                     ; 124 			r = 0xa0;	//	b1010
 448  00df a6a0          	ld	a,#160
 449  00e1 6b03          	ld	(OFST+0,sp),a
 450                     ; 125 			i = indiEncoderPrevCode - indiEncoderCode;
 452  00e3 c60000        	ld	a,_indiEncoderPrevCode
 453  00e6 c00000        	sub	a,_indiEncoderCode
 455  00e9               L521:
 456  00e9 6b02          	ld	(OFST-1,sp),a
 457                     ; 130 		indiEncoderPrevCode = indiEncoderCode;
 459  00eb 5500000000    	mov	_indiEncoderPrevCode,_indiEncoderCode
 460                     ; 131 		if( _enc_t1 != timer100usCount/10 )//_t20ms )
 462  00f0 c60000        	ld	a,_timer100usCount
 463  00f3 5f            	clrw	x
 464  00f4 97            	ld	xl,a
 465  00f5 a60a          	ld	a,#10
 466  00f7 cd0000        	call	c_sdivx
 468  00fa c6000c        	ld	a,__enc_t1
 469  00fd 905f          	clrw	y
 470  00ff 9097          	ld	yl,a
 471  0101 90bf00        	ldw	c_y,y
 472  0104 b300          	cpw	x,c_y
 473  0106 2726          	jreq	L121
 474                     ; 133 			encoder_resetCount(0);
 476  0108 4f            	clr	a
 477  0109 cd007d        	call	_encoder_resetCount
 479                     ; 134 			KEY_CLEAR;
 481  010c 725f0005      	clr	__key_hour
 482  0110 725f0004      	clr	__key_min
 483  0114 725f0003      	clr	__key_sec
 484                     ; 135 			_enc_t1 = timer100usCount/10;//_t20ms;
 486  0118 5f            	clrw	x
 487  0119 c60000        	ld	a,_timer100usCount
 488  011c 97            	ld	xl,a
 489  011d a60a          	ld	a,#10
 490  011f 62            	div	x,a
 491  0120 9f            	ld	a,xl
 492  0121 c7000c        	ld	__enc_t1,a
 493                     ; 136 			return r | i;
 495  0124 7b03          	ld	a,(OFST+0,sp)
 496  0126 1a02          	or	a,(OFST-1,sp)
 498  0128 2001          	jra	L23
 499  012a               L721:
 500                     ; 128 			return 0;
 507  012a 4f            	clr	a
 509  012b               L23:
 511  012b 5b03          	addw	sp,#3
 512  012d 81            	ret	
 513  012e               L121:
 514                     ; 140 	if( _t20ms == _key_timer )
 516  012e c60000        	ld	a,__t20ms
 517  0131 c10009        	cp	a,__key_timer
 518                     ; 141 		return 0;
 520  0134 27f4          	jreq	L721
 521                     ; 143 	_key_timer = _t20ms;
 523  0136 5500000009    	mov	__key_timer,__t20ms
 524                     ; 144 	t = key_get();
 526  013b cd0000        	call	_key_get
 528  013e 6b01          	ld	(OFST-2,sp),a
 529                     ; 145 	if( t == 0x0f )
 531  0140 a10f          	cp	a,#15
 532  0142 2733          	jreq	L77
 533                     ; 146 		goto err;
 535                     ; 148 	if( (t & 0x08) == 0 )
 537  0144 a508          	bcp	a,#8
 538  0146 2608          	jrne	L141
 539                     ; 150 		i++;
 541  0148 0c02          	inc	(OFST-1,sp)
 542                     ; 151 		r = 4;
 544  014a a604          	ld	a,#4
 545  014c 6b03          	ld	(OFST+0,sp),a
 546  014e 7b01          	ld	a,(OFST-2,sp)
 547  0150               L141:
 548                     ; 153 	if( (t & 0x04) == 0 )
 550  0150 a504          	bcp	a,#4
 551  0152 2608          	jrne	L341
 552                     ; 155 		i++;
 554  0154 0c02          	inc	(OFST-1,sp)
 555                     ; 156 		r = 3;
 557  0156 a603          	ld	a,#3
 558  0158 6b03          	ld	(OFST+0,sp),a
 559  015a 7b01          	ld	a,(OFST-2,sp)
 560  015c               L341:
 561                     ; 158 	if( (t & 0x02) == 0 )
 563  015c a502          	bcp	a,#2
 564  015e 2608          	jrne	L541
 565                     ; 160 		i++;
 567  0160 0c02          	inc	(OFST-1,sp)
 568                     ; 161 		r = 2;
 570  0162 a602          	ld	a,#2
 571  0164 6b03          	ld	(OFST+0,sp),a
 572  0166 7b01          	ld	a,(OFST-2,sp)
 573  0168               L541:
 574                     ; 163 	if( (t & 0x01) == 0 )
 576  0168 a501          	bcp	a,#1
 577  016a 2606          	jrne	L741
 578                     ; 165 		i++;
 580  016c 0c02          	inc	(OFST-1,sp)
 581                     ; 166 		r = 1;
 583  016e a601          	ld	a,#1
 584  0170 6b03          	ld	(OFST+0,sp),a
 585  0172               L741:
 586                     ; 168 	if( i != 1 )
 588  0172 7b02          	ld	a,(OFST-1,sp)
 589  0174 4a            	dec	a
 590  0175 270a          	jreq	L151
 591                     ; 169 		goto err;
 592  0177               L77:
 593                     ; 204 err:
 593                     ; 205 	_key_pressed = 0;
 595  0177 725f0008      	clr	__key_pressed
 596                     ; 206 	_key_code = 0;
 598  017b 725f000a      	clr	__key_code
 599                     ; 207 	_key_complete = 0;
 600                     ; 208 	_key_continue = 0;
 601                     ; 210 	return 0;
 603  017f 2010          	jp	LC002
 604  0181               L151:
 605                     ; 171 	if( _key_code != r )
 607  0181 c6000a        	ld	a,__key_code
 608  0184 1103          	cp	a,(OFST+0,sp)
 609  0186 2713          	jreq	L351
 610                     ; 173 		_key_code = r;
 612  0188 7b03          	ld	a,(OFST+0,sp)
 613  018a c7000a        	ld	__key_code,a
 614                     ; 174 		_key_pressed = 0;
 616  018d 725f0008      	clr	__key_pressed
 617                     ; 175 		_key_complete = 0;
 619                     ; 176 		_key_continue = 0;
 621  0191               LC002:
 623  0191 725f000b      	clr	__key_complete
 625  0195 725f000d      	clr	__key_continue
 626                     ; 177 		return 0;
 628  0199 208f          	jp	L721
 629  019b               L351:
 630                     ; 180 	_key_pressed++;
 632  019b 725c0008      	inc	__key_pressed
 633                     ; 182 	if( _key_pressed >= /*13*/6 )
 635  019f c60008        	ld	a,__key_pressed
 636  01a2 a106          	cp	a,#6
 637  01a4 2584          	jrult	L721
 638                     ; 184 		if( _key_complete != 0 )
 640  01a6 c6000b        	ld	a,__key_complete
 641  01a9 271f          	jreq	L751
 642                     ; 186 			_key_complete++;
 644  01ab 725c000b      	inc	__key_complete
 645                     ; 187 			_key_pressed = 0;
 647  01af 725f0008      	clr	__key_pressed
 648                     ; 188 			if( _key_complete == /*15*/20 )
 650  01b3 c6000b        	ld	a,__key_complete
 651  01b6 a114          	cp	a,#20
 652  01b8 2703cc012a    	jrne	L721
 653                     ; 190 				_key_complete = 1;
 655  01bd 3501000b      	mov	__key_complete,#1
 656                     ; 191 				_key_continue++;
 658  01c1 725c000d      	inc	__key_continue
 659                     ; 193 				return r;
 661  01c5               LC003:
 663  01c5 7b03          	ld	a,(OFST+0,sp)
 665  01c7 cc012b        	jra	L23
 666                     ; 195 			return 0;
 668  01ca               L751:
 669                     ; 199 		_key_pressed = 0;
 671  01ca c70008        	ld	__key_pressed,a
 672                     ; 200 		_key_complete = 1;
 674  01cd 3501000b      	mov	__key_complete,#1
 675                     ; 201 		return r;
 677  01d1 20f2          	jp	LC003
 678                     ; 203 	return 0;
 712                     ; 213 void 	encoder_Open(void)
 712                     ; 214 {
 713                     	switch	.text
 714  01d3               _encoder_Open:
 718                     ; 215 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 720  01d3 ae1101        	ldw	x,#4353
 721  01d6 cd0000        	call	_CLK_PeripheralClockConfig
 723                     ; 218 	TIM1_EncoderInterfaceConfig (
 723                     ; 219 		TIM1_EncoderMode_TI2, 
 723                     ; 220 		TIM1_ICPolarity_Rising,
 723                     ; 221 		TIM2_ICPolarity_Falling
 723                     ; 222 		);
 725  01d9 4b01          	push	#1
 726  01db ae0200        	ldw	x,#512
 727  01de cd0000        	call	_TIM1_EncoderInterfaceConfig
 729  01e1 84            	pop	a
 730                     ; 223 	TIM1_CounterModeConfig(TIM1_CounterMode_CenterAligned1);
 732  01e2 a620          	ld	a,#32
 733  01e4 cd0000        	call	_TIM1_CounterModeConfig
 735                     ; 224 	TIM1_SetCounter(100);
 737  01e7 ae0064        	ldw	x,#100
 738  01ea cd0000        	call	_TIM1_SetCounter
 740                     ; 228 	TIM1_SelectInputTrigger(TIM1_TRGSelection_TI1FP1);
 742  01ed a650          	ld	a,#80
 743  01ef cd0000        	call	_TIM1_SelectInputTrigger
 745                     ; 229 	TIM1_ITConfig(TIM1_FLAG_Trigger, ENABLE);
 747  01f2 ae4001        	ldw	x,#16385
 748  01f5 cd0000        	call	_TIM1_ITConfig
 750                     ; 232 	TIM1_ICInit(
 750                     ; 233 		TIM1_Channel_3, 
 750                     ; 234 //		TIM1_ICPolarity_Rising,
 750                     ; 235 		TIM1_ICPolarity_Falling,
 750                     ; 236 		TIM1_ICSelection_DirectTI,
 750                     ; 237 		TIM1_ICPSC_DIV1,
 750                     ; 238 		0
 750                     ; 239 		);
 752  01f8 4b00          	push	#0
 753  01fa 4b00          	push	#0
 754  01fc 4b01          	push	#1
 755  01fe ae0201        	ldw	x,#513
 756  0201 cd0000        	call	_TIM1_ICInit
 758  0204 5b03          	addw	sp,#3
 759                     ; 240 	TIM1_ClearFlag(TIM1_FLAG_CC3);	
 761  0206 ae0008        	ldw	x,#8
 762  0209 cd0000        	call	_TIM1_ClearFlag
 764                     ; 241 	TIM1_ITConfig(TIM1_IT_CC3, ENABLE);
 766  020c ae0801        	ldw	x,#2049
 767  020f cd0000        	call	_TIM1_ITConfig
 769                     ; 242 	TIM1_Cmd(ENABLE);
 771  0212 a601          	ld	a,#1
 772  0214 cd0000        	call	_TIM1_Cmd
 774                     ; 260 	GPIO_Init(D_KEY_4PORT, D_KEY_4PIN, GPIO_Mode_In_PU_No_IT);
 776  0217 4b40          	push	#64
 777  0219 4b06          	push	#6
 778  021b ae500a        	ldw	x,#20490
 779  021e cd0000        	call	_GPIO_Init
 781  0221 85            	popw	x
 782                     ; 261 	GPIO_Init(D_KEY_3PORT, D_KEY_3PIN, GPIO_Mode_In_PU_No_IT);
 784  0222 4b40          	push	#64
 785  0224 4b05          	push	#5
 786  0226 ae500a        	ldw	x,#20490
 787  0229 cd0000        	call	_GPIO_Init
 789  022c 85            	popw	x
 790                     ; 262 	GPIO_Init(D_KEY_2PORT, D_KEY_2PIN, GPIO_Mode_In_PU_No_IT);
 792  022d 4b40          	push	#64
 793  022f 4b03          	push	#3
 794  0231 ae5000        	ldw	x,#20480
 795  0234 cd0000        	call	_GPIO_Init
 797  0237 85            	popw	x
 798                     ; 263 	GPIO_Init(D_KEY_1PORT, D_KEY_1PIN, GPIO_Mode_In_PU_No_IT);
 800  0238 4b40          	push	#64
 801  023a 4b02          	push	#2
 802  023c ae5000        	ldw	x,#20480
 803  023f cd0000        	call	_GPIO_Init
 805  0242 85            	popw	x
 806                     ; 265 }
 809  0243 81            	ret	
 938                     	xdef	__key_continue
 939                     	xdef	__enc_t1
 940                     	xdef	__key_complete
 941                     	xdef	__key_code
 942                     	xdef	__key_timer
 943                     	xdef	__key_pressed
 944                     	xdef	_encoder_resetCount
 945                     	xdef	___key_2
 946                     	xdef	___key2
 947                     	xdef	__key_hour
 948                     	xdef	__key_min
 949                     	xdef	__key_sec
 950                     	xdef	_indiEncoderMove
 951                     	xdef	_indiEncoderPrevCode
 952                     	xref	___timer1s
 953                     	xref	__t20ms
 954                     	xref	_timer100usCount
 955                     	xdef	_key_ready
 956                     	xdef	_encoder_Open
 957                     	xdef	_encoder_irq
 958                     	xdef	_indiEncoderFlag
 959                     	switch	.bss
 960  0000               _indiEncoderCode:
 961  0000 00            	ds.b	1
 962                     	xdef	_indiEncoderCode
 963                     	xdef	_key_get
 964                     	xref	_TIM1_EncoderInterfaceConfig
 965                     	xref	_TIM1_SelectInputTrigger
 966                     	xref	_TIM1_ClearFlag
 967                     	xref	_TIM1_ITConfig
 968                     	xref	_TIM1_ICInit
 969                     	xref	_TIM1_Cmd
 970                     	xref	_TIM1_GetCounter
 971                     	xref	_TIM1_SetCounter
 972                     	xref	_TIM1_CounterModeConfig
 973                     	xref	_GPIO_ReadInputData
 974                     	xref	_GPIO_Init
 975                     	xref	_CLK_PeripheralClockConfig
 976                     	xref.b	c_x
 977                     	xref.b	c_y
 997                     	xref	c_sdivx
 998                     	end
