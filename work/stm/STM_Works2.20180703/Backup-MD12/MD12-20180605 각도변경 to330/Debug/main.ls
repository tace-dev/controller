   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  20                     	bsct
  21  0000               _PeriodNumber:
  22  0000 0000          	dc.w	0
  23  0002               _TableInterval:
  24  0002 41            	dc.b	65
  25  0003 38            	dc.b	56
  26  0004 32            	dc.b	50
  27  0005 2d            	dc.b	45
  28  0006 28            	dc.b	40
  29  0007 24            	dc.b	36
  30  0008 20            	dc.b	32
  31  0009 1d            	dc.b	29
  32  000a 1a            	dc.b	26
  33  000b 17            	dc.b	23
  34  000c 15            	dc.b	21
  35  000d 13            	dc.b	19
  36  000e 11            	dc.b	17
  37  000f 10            	dc.b	16
  38  0010 0f            	dc.b	15
  39  0011 0e            	dc.b	14
  40  0012 0d            	dc.b	13
  41  0013               _PowerDelay_1mS:
  42  0013 e7            	dc.b	231
 108                     ; 209 void main(void)
 108                     ; 210 {
 110                     	switch	.text
 111  0000               _main:
 113  0000 5204          	subw	sp,#4
 114       00000004      OFST:	set	4
 117                     ; 216 		Ticks_1mS = 0;
 119  0002 5f            	clrw	x
 120  0003 bf4a          	ldw	_Ticks_1mS,x
 121                     ; 217 	Ticks_50uS = 0;
 123  0005 3f4c          	clr	_Ticks_50uS
 124                     ; 221 	My.GearRatio100 = 292u;		//  	4096 * 330/360 * 15.54 20180605
 126  0007 ae0124        	ldw	x,#292
 127  000a bf2b          	ldw	_My+12,x
 128                     ; 222 	My.Mode = 0;
 130  000c 3f2a          	clr	_My+11
 131                     ; 224 	Clock_Config();
 133  000e cd0638        	call	_Clock_Config
 135                     ; 225 	Gpio_Config();
 137  0011 cd0651        	call	_Gpio_Config
 139                     ; 227 	Timer4_Config();
 141  0014 cd0742        	call	L5_Timer4_Config
 143                     ; 229 	Adc.Idx = 2;
 145  0017 35020015      	mov	_Adc+10,#2
 146                     ; 230 	Adc.IdxAvg = 0;
 148  001b 3f1b          	clr	_Adc+16
 149                     ; 231 	Adc.Average = 0;
 151  001d 3f1c          	clr	_Adc+17
 152                     ; 232 	Adc.Sum = 0;
 154  001f 5f            	clrw	x
 155  0020 bf1d          	ldw	_Adc+18,x
 156                     ; 233 	Adc_Config(  );
 158  0022 cd0756        	call	L3_Adc_Config
 160                     ; 238 	Drive.NormalOpen = 1;
 162  0025 35010044      	mov	_Drive+22,#1
 163                     ; 239 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 165  0029 ae012c        	ldw	x,#300
 166  002c bf39          	ldw	_Drive+11,x
 167                     ; 241 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 169  002e bf40          	ldw	_Drive+18,x
 170                     ; 244 	Drive.ExcitationType = 2;		//	2 excition
 172  0030 35020042      	mov	_Drive+20,#2
 173                     ; 247 	Drive.Interval = 16u;			//	20180225
 175  0034 3510003e      	mov	_Drive+16,#16
 176                     ; 248 	Drive.Enabled = ENABLED;
 178  0038 7210002e      	bset	_Drive,#0
 179                     ; 250 	My.BoostEnable = 0;
 181  003c 7211002d      	bres	_My+14,#0
 182                     ; 251 	My.ChargeOn = 1;
 184  0040 7212002d      	bset	_My+14,#1
 185                     ; 254 	enableInterrupts();
 188  0044 9a            	rim	
 192  0045               L14:
 193                     ; 256   while ( Ticks_1mS < PowerDelay_1mS )
 195  0045 b613          	ld	a,_PowerDelay_1mS
 196  0047 5f            	clrw	x
 197  0048 97            	ld	xl,a
 198  0049 bf00          	ldw	c_x,x
 199  004b be4a          	ldw	x,_Ticks_1mS
 200  004d b300          	cpw	x,c_x
 201  004f 25f4          	jrult	L14
 202                     ; 259 	GPIO_WriteLow(_LED_PORT, _LED_PIN);
 204  0051 4b10          	push	#16
 205  0053 ae5005        	ldw	x,#20485
 206  0056 cd0000        	call	_GPIO_WriteLow
 208  0059 be4a          	ldw	x,_Ticks_1mS
 209  005b bf09          	ldw	_Timer+9,x
 210  005d 84            	pop	a
 211  005e 3d43          	tnz	_Drive+21
 212                     ; 261 	Timer.CycleRun = Ticks_1mS;		
 214                     ; 263 	if ( Drive.Origin ) 
 216  0060 2719          	jreq	L54
 217                     ; 265 		Drive.Position = 0;
 219  0062 5f            	clrw	x
 220  0063 bf2f          	ldw	_Drive+1,x
 222  0065               L74:
 223                     ; 278 	Timer.Led = Ticks_1mS;
 225  0065 be4a          	ldw	x,_Ticks_1mS
 226  0067 bf00          	ldw	_Timer,x
 227                     ; 279 	Timer.Motor = Ticks_1mS;
 229  0069 bf02          	ldw	_Timer+2,x
 230                     ; 280 	Timer.Adc = Ticks_1mS;
 232  006b bf04          	ldw	_Timer+4,x
 233  006d               L75:
 234                     ; 285 		t = Ticks_1mS;
 236  006d be4a          	ldw	x,_Ticks_1mS
 237  006f 1f01          	ldw	(OFST-3,sp),x
 239                     ; 287 		if ( Drive.Run )
 241  0071 7203002e1b    	btjf	_Drive,#1,L36
 242                     ; 288 			ledint = 150u;
 244  0076 ae0096        	ldw	x,#150
 246  0079 2019          	jra	L56
 247  007b               L54:
 248                     ; 271 		Drive.Position = CPulse(205u);
 250  007b ae00cd        	ldw	x,#205
 251  007e cd0626        	call	_CPulse
 253  0081 bf2f          	ldw	_Drive+1,x
 254                     ; 272 		StartDriveOR( 0u, 0u  );				// Goto Zero position
 256  0083 4b00          	push	#0
 257  0085 5f            	clrw	x
 258  0086 cd02c5        	call	_StartDriveOR
 260  0089 84            	pop	a
 262  008a               L35:
 263                     ; 274 		while (Drive.Run)				// Wait while motor is running
 265  008a 7202002efb    	btjt	_Drive,#1,L35
 266  008f 20d4          	jra	L74
 267  0091               L36:
 268                     ; 290 			ledint = 500u;
 270  0091 ae01f4        	ldw	x,#500
 271  0094               L56:
 272  0094 1f03          	ldw	(OFST-1,sp),x
 274                     ; 292 		if ( Diff ( Timer.Led, ledint ) )
 276  0096 89            	pushw	x
 277  0097 be00          	ldw	x,_Timer
 278  0099 cd019b        	call	_Diff
 280  009c 4d            	tnz	a
 281  009d 85            	popw	x
 282  009e 270d          	jreq	L76
 283                     ; 294 			Timer.Led = Ticks_1mS;
 285  00a0 be4a          	ldw	x,_Ticks_1mS
 286  00a2 bf00          	ldw	_Timer,x
 287                     ; 295 			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
 289  00a4 4b10          	push	#16
 290  00a6 ae5005        	ldw	x,#20485
 291  00a9 cd0000        	call	_GPIO_WriteReverse
 293  00ac 84            	pop	a
 294  00ad               L76:
 295                     ; 299 		if ( Diff ( Timer.Motor, 500u ) )
 297  00ad ae01f4        	ldw	x,#500
 298  00b0 89            	pushw	x
 299  00b1 be02          	ldw	x,_Timer+2
 300  00b3 cd019b        	call	_Diff
 302  00b6 4d            	tnz	a
 303  00b7 85            	popw	x
 304  00b8 274e          	jreq	L17
 305                     ; 302 			Drive.Step = (u16)Adc.Average * 100 /105; 
 307  00ba cd0190        	call	LC001
 309  00bd a669          	ld	a,#105
 310  00bf 62            	div	x,a
 311                     ; 303 			Drive.Step = (u16)Adc.Average * 100 /111; 
 313  00c0 cd0190        	call	LC001
 315  00c3 a66f          	ld	a,#111
 316  00c5 62            	div	x,a
 317  00c6 01            	rrwa	x,a
 318                     ; 305 			if ( Drive.Step > 210u )
 320  00c7 a1d3          	cp	a,#211
 321  00c9 2502          	jrult	L37
 322                     ; 306 				Drive.Step = 210u;
 324  00cb a6d2          	ld	a,#210
 325  00cd               L37:
 326                     ; 307 			if ( Drive.Step < 20u )
 328  00cd a114          	cp	a,#20
 329  00cf 2401          	jruge	L57
 330                     ; 308 				Drive.Step = 0u;
 332  00d1 4f            	clr	a
 333  00d2               L57:
 334  00d2 b745          	ld	_Drive+23,a
 335                     ; 312 			if ( Drive.Step != Drive.PreStep && My.Mode == 0  )
 337  00d4 b146          	cp	a,_Drive+24
 338  00d6 272c          	jreq	L77
 340  00d8 b62a          	ld	a,_My+11
 341  00da 2628          	jrne	L77
 342                     ; 314 				if ( Drive.Run && Timer.MotorUpdate != 1 ) 
 344  00dc 7203002e16    	btjf	_Drive,#1,L101
 346  00e1 b608          	ld	a,_Timer+8
 347  00e3 4a            	dec	a
 348  00e4 2711          	jreq	L101
 349                     ; 316 					Drive.Stop = 1;			
 351  00e6 35010047      	mov	_Drive+25,#1
 352                     ; 317 					Drive.PreStep = Drive.Step;
 354  00ea 454546        	mov	_Drive+24,_Drive+23
 355                     ; 318 					Timer.MotorUpdate = 1;
 357  00ed 35010008      	mov	_Timer+8,#1
 358                     ; 319 					Timer.MotorDelay  = Ticks_1mS;
 360  00f1 be4a          	ldw	x,_Ticks_1mS
 361  00f3 bf06          	ldw	_Timer+6,x
 363  00f5 200d          	jra	L77
 364  00f7               L101:
 365                     ; 323 					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 367  00f7 4b00          	push	#0
 368  00f9 b645          	ld	a,_Drive+23
 369  00fb 5f            	clrw	x
 370  00fc 97            	ld	xl,a
 371  00fd cd0626        	call	_CPulse
 373  0100 cd02c5        	call	_StartDriveOR
 375  0103 84            	pop	a
 376  0104               L77:
 377                     ; 325 			Timer.Motor = Ticks_1mS;
 379  0104 be4a          	ldw	x,_Ticks_1mS
 380  0106 bf02          	ldw	_Timer+2,x
 381  0108               L17:
 382                     ; 328 		if ( Diff ( Timer.Adc, 10u ) )
 384  0108 ae000a        	ldw	x,#10
 385  010b 89            	pushw	x
 386  010c be04          	ldw	x,_Timer+4
 387  010e cd019b        	call	_Diff
 389  0111 4d            	tnz	a
 390  0112 85            	popw	x
 391  0113 2743          	jreq	L501
 392                     ; 330 			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
 394  0115 b61b          	ld	a,_Adc+16
 395  0117 5f            	clrw	x
 396  0118 97            	ld	xl,a
 397  0119 e616          	ld	a,(_Adc+11,x)
 398  011b 5f            	clrw	x
 399  011c 97            	ld	xl,a
 400  011d 72b0001d      	subw	x,_Adc+18
 401  0121 50            	negw	x
 402  0122 bf1d          	ldw	_Adc+18,x
 403                     ; 331 			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
 405  0124 be0b          	ldw	x,_Adc
 406  0126 54            	srlw	x
 407  0127 54            	srlw	x
 408  0128 b61b          	ld	a,_Adc+16
 409  012a 905f          	clrw	y
 410  012c 9097          	ld	yl,a
 411  012e 01            	rrwa	x,a
 412  012f 90e716        	ld	(_Adc+11,y),a
 413                     ; 332 			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
 415  0132 5f            	clrw	x
 416  0133 b61b          	ld	a,_Adc+16
 417  0135 97            	ld	xl,a
 418  0136 e616          	ld	a,(_Adc+11,x)
 419  0138 bb1e          	add	a,_Adc+19
 420  013a b71e          	ld	_Adc+19,a
 421  013c 2402          	jrnc	L04
 422  013e 3c1d          	inc	_Adc+18
 423  0140               L04:
 424                     ; 333 			Adc.Average = Adc.Sum /5;
 426  0140 be1d          	ldw	x,_Adc+18
 427  0142 a605          	ld	a,#5
 428  0144 62            	div	x,a
 429  0145 01            	rrwa	x,a
 430  0146 b71c          	ld	_Adc+17,a
 431                     ; 334 			if  (Adc.IdxAvg	>= 4 )
 433  0148 b61b          	ld	a,_Adc+16
 434  014a a104          	cp	a,#4
 435  014c 2504          	jrult	L701
 436                     ; 335 				Adc.IdxAvg = 0;
 438  014e 3f1b          	clr	_Adc+16
 440  0150 2002          	jra	L111
 441  0152               L701:
 442                     ; 337 				Adc.IdxAvg++;
 444  0152 3c1b          	inc	_Adc+16
 445  0154               L111:
 446                     ; 339 			Timer.Adc = Ticks_1mS;
 448  0154 be4a          	ldw	x,_Ticks_1mS
 449  0156 bf04          	ldw	_Timer+4,x
 450  0158               L501:
 451                     ; 342 		if ( Diff ( Timer.CycleRun, 60000u ) )
 453  0158 aeea60        	ldw	x,#60000
 454  015b 89            	pushw	x
 455  015c be09          	ldw	x,_Timer+9
 456  015e ad3b          	call	_Diff
 458  0160 4d            	tnz	a
 459  0161 85            	popw	x
 460  0162 2704          	jreq	L311
 461                     ; 349 			Timer.CycleRun = Ticks_1mS;
 463  0164 be4a          	ldw	x,_Ticks_1mS
 464  0166 bf09          	ldw	_Timer+9,x
 465  0168               L311:
 466                     ; 352 		if ( Timer.MotorUpdate )
 468  0168 b608          	ld	a,_Timer+8
 469  016a 271b          	jreq	L321
 470                     ; 354 			if ( Diff( Timer.MotorDelay, 200 ) )
 472  016c ae00c8        	ldw	x,#200
 473  016f 89            	pushw	x
 474  0170 be06          	ldw	x,_Timer+6
 475  0172 ad27          	call	_Diff
 477  0174 4d            	tnz	a
 478  0175 85            	popw	x
 479  0176 270f          	jreq	L321
 480                     ; 356 				StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 482  0178 4b00          	push	#0
 483  017a b645          	ld	a,_Drive+23
 484  017c 5f            	clrw	x
 485  017d 97            	ld	xl,a
 486  017e cd0626        	call	_CPulse
 488  0181 cd02c5        	call	_StartDriveOR
 490  0184 3f08          	clr	_Timer+8
 491  0186 84            	pop	a
 492                     ; 357 				Timer.MotorUpdate = 0;
 494  0187               L321:
 495                     ; 361 		while ( t == Ticks_1mS )
 497  0187 1e01          	ldw	x,(OFST-3,sp)
 498  0189 b34a          	cpw	x,_Ticks_1mS
 499  018b 27fa          	jreq	L321
 501  018d cc006d        	jra	L75
 502  0190               LC001:
 503  0190 b61c          	ld	a,_Adc+17
 504  0192 5f            	clrw	x
 505  0193 97            	ld	xl,a
 506  0194 90ae0064      	ldw	y,#100
 507  0198 cc0000        	jp	c_imul
 560                     ; 369 u8  Diff( u16 time, u16 diff )
 560                     ; 370 {
 561                     	switch	.text
 562  019b               _Diff:
 564  019b 89            	pushw	x
 565  019c 520c          	subw	sp,#12
 566       0000000c      OFST:	set	12
 569                     ; 372 	t = Ticks_1mS;
 571  019e be4a          	ldw	x,_Ticks_1mS
 572  01a0 cd0000        	call	c_uitolx
 574  01a3 96            	ldw	x,sp
 575  01a4 1c0009        	addw	x,#OFST-3
 576  01a7 cd0000        	call	c_rtol
 579                     ; 374 	if (time <= t )
 581  01aa 1e0d          	ldw	x,(OFST+1,sp)
 582  01ac cd0000        	call	c_uitolx
 584  01af 96            	ldw	x,sp
 585  01b0 1c0009        	addw	x,#OFST-3
 586  01b3 cd0000        	call	c_lcmp
 588  01b6 222f          	jrugt	L551
 589                     ; 376 		if ( ( t - time ) > diff ) 
 591  01b8 1e0d          	ldw	x,(OFST+1,sp)
 592  01ba cd0000        	call	c_uitolx
 594  01bd 96            	ldw	x,sp
 595  01be 1c0005        	addw	x,#OFST-7
 596  01c1 cd0000        	call	c_rtol
 599  01c4 96            	ldw	x,sp
 600  01c5 1c0009        	addw	x,#OFST-3
 601  01c8 cd0000        	call	c_ltor
 603  01cb 96            	ldw	x,sp
 604  01cc 1c0005        	addw	x,#OFST-7
 605  01cf cd0000        	call	c_lsub
 607  01d2 96            	ldw	x,sp
 608  01d3 5c            	incw	x
 609  01d4 cd0000        	call	c_rtol
 612  01d7 1e11          	ldw	x,(OFST+5,sp)
 613  01d9 cd0000        	call	c_uitolx
 615  01dc 96            	ldw	x,sp
 616  01dd 5c            	incw	x
 617  01de cd0000        	call	c_lcmp
 619                     ; 377 			return 1;
 621  01e1 2535          	jrult	LC003
 622  01e3               L751:
 623                     ; 379 			return 0;
 626  01e3 4f            	clr	a
 628  01e4               L45:
 630  01e4 5b0e          	addw	sp,#14
 631  01e6 81            	ret	
 632  01e7               L551:
 633                     ; 383 		if ( ( 65536 - time + t  ) >= diff ) 
 635  01e7 1e0d          	ldw	x,(OFST+1,sp)
 636  01e9 cd0000        	call	c_uitolx
 638  01ec 96            	ldw	x,sp
 639  01ed 1c0005        	addw	x,#OFST-7
 640  01f0 cd0000        	call	c_rtol
 643  01f3 5f            	clrw	x
 644  01f4 bf02          	ldw	c_lreg+2,x
 645  01f6 5c            	incw	x
 646  01f7 bf00          	ldw	c_lreg,x
 647  01f9 96            	ldw	x,sp
 648  01fa 1c0005        	addw	x,#OFST-7
 649  01fd cd0000        	call	c_lsub
 651  0200 96            	ldw	x,sp
 652  0201 1c0009        	addw	x,#OFST-3
 653  0204 cd0000        	call	c_ladd
 655  0207 96            	ldw	x,sp
 656  0208 5c            	incw	x
 657  0209 cd0000        	call	c_rtol
 660  020c 1e11          	ldw	x,(OFST+5,sp)
 661  020e cd0000        	call	c_uitolx
 663  0211 96            	ldw	x,sp
 664  0212 5c            	incw	x
 665  0213 cd0000        	call	c_lcmp
 667  0216 22cb          	jrugt	L751
 668                     ; 384 			return 1;
 670  0218               LC003:
 672  0218 a601          	ld	a,#1
 674  021a 20c8          	jra	L45
 675                     ; 386 			return 0;
 699                     ; 390 void OnTimer_1S(void)
 699                     ; 391 {
 700                     	switch	.text
 701  021c               _OnTimer_1S:
 705                     ; 393 }
 708  021c 81            	ret	
 734                     ; 398 OnTimer_1mS(void)
 734                     ; 399 { 	
 735                     	switch	.text
 736  021d               _OnTimer_1mS:
 740                     ; 400 	Ticks_1mS++;
 742  021d be4a          	ldw	x,_Ticks_1mS
 743  021f 5c            	incw	x
 744  0220 bf4a          	ldw	_Ticks_1mS,x
 745                     ; 402 	Adc_Config( );
 747  0222 cd0756        	call	L3_Adc_Config
 749                     ; 404 	if ( PowerDelay_1mS )
 751  0225 b613          	ld	a,_PowerDelay_1mS
 752  0227 2702          	jreq	L112
 753                     ; 405 		PowerDelay_1mS--;
 755  0229 3a13          	dec	_PowerDelay_1mS
 756  022b               L112:
 757                     ; 406 }
 760  022b 81            	ret	
 792                     ; 409 void OnTimer4(void)
 792                     ; 410 {
 793                     	switch	.text
 794  022c               _OnTimer4:
 798                     ; 411 	Ticks_50uS++;
 800  022c 3c4c          	inc	_Ticks_50uS
 801                     ; 413 	if ( Ticks_50uS == 5 )
 803  022e b64c          	ld	a,_Ticks_50uS
 804  0230 a105          	cp	a,#5
 805  0232 2615          	jrne	L322
 806                     ; 414 		Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
 808  0234 4b02          	push	#2
 809  0236 ae5000        	ldw	x,#20480
 810  0239 cd0000        	call	_GPIO_ReadInputPin
 812  023c 5b01          	addw	sp,#1
 813  023e 4d            	tnz	a
 814  023f 2603          	jrne	L66
 815  0241 4c            	inc	a
 816  0242 2001          	jra	L27
 817  0244               L66:
 818  0244 4f            	clr	a
 819  0245               L27:
 820  0245 b743          	ld	_Drive+21,a
 822  0247 2043          	jra	L522
 823  0249               L322:
 824                     ; 416 		if ( Ticks_50uS == 10 )
 826  0249 a10a          	cp	a,#10
 827  024b 2613          	jrne	L722
 828                     ; 417 		{	if ( My.ChargeOn ) 
 830  024d 7203002d07    	btjf	_My+14,#1,L132
 831                     ; 418 				GPIO_WriteHigh( _CHARGE_ON_PORT, _CHARGE_ON_PIN ); 
 833  0252 4b10          	push	#16
 834  0254 ae500f        	ldw	x,#20495
 837  0257 2015          	jp	LC006
 838  0259               L132:
 839                     ; 420 				GPIO_WriteLow( _CHARGE_ON_PORT, _CHARGE_ON_PIN );
 841  0259 4b10          	push	#16
 842  025b ae500f        	ldw	x,#20495
 844  025e 2018          	jp	LC005
 845  0260               L722:
 846                     ; 423 		if ( Ticks_50uS == 15 )
 848  0260 a10f          	cp	a,#15
 849  0262 261a          	jrne	L732
 850                     ; 425 			if ( My.BoostEnable ) 
 852  0264 7201002d0a    	btjf	_My+14,#0,L142
 853                     ; 426 				GPIO_WriteHigh( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
 855  0269 4b08          	push	#8
 856  026b ae5000        	ldw	x,#20480
 857  026e               LC006:
 858  026e cd0000        	call	_GPIO_WriteHigh
 861  0271 2008          	jp	LC004
 862  0273               L142:
 863                     ; 428 				GPIO_WriteLow( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
 865  0273 4b08          	push	#8
 866  0275 ae5000        	ldw	x,#20480
 867  0278               LC005:
 868  0278 cd0000        	call	_GPIO_WriteLow
 870  027b               LC004:
 871  027b 84            	pop	a
 872  027c 200e          	jra	L522
 873  027e               L732:
 874                     ; 431 		if ( Ticks_50uS >= 20 )
 876  027e a114          	cp	a,#20
 877  0280 250a          	jrult	L522
 878                     ; 433 			Ticks_50uS = 0;
 880  0282 3f4c          	clr	_Ticks_50uS
 881                     ; 435 			Ticks_1mS++;
 883  0284 be4a          	ldw	x,_Ticks_1mS
 884  0286 5c            	incw	x
 885  0287 bf4a          	ldw	_Ticks_1mS,x
 886                     ; 437 			Adc_Config( );
 888  0289 cd0756        	call	L3_Adc_Config
 890  028c               L522:
 891                     ; 443 	if ( Drive.Ticks > 0 )
 893  028c b63f          	ld	a,_Drive+17
 894  028e 2702          	jreq	L152
 895                     ; 444 		Drive.Ticks--;
 897  0290 3a3f          	dec	_Drive+17
 898  0292               L152:
 899                     ; 446 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
 901  0292 7201002e08    	btjf	_Drive,#0,L352
 903  0297 2606          	jrne	L352
 904                     ; 448 		DriveService();	
 906  0299 cd03a9        	call	_DriveService
 908                     ; 449 		Drive.Ticks = Drive.Interval;
 910  029c 453e3f        	mov	_Drive+17,_Drive+16
 911  029f               L352:
 912                     ; 452 }
 915  029f 81            	ret	
 939                     ; 459 void StopDrive(void)			//TROff()
 939                     ; 460 {	
 940                     	switch	.text
 941  02a0               _StopDrive:
 945                     ; 461 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
 947  02a0 4b04          	push	#4
 948  02a2 ae5000        	ldw	x,#20480
 949  02a5 cd0000        	call	_GPIO_WriteLow
 951  02a8 84            	pop	a
 952                     ; 462 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
 954  02a9 4b20          	push	#32
 955  02ab ae500a        	ldw	x,#20490
 956  02ae cd0000        	call	_GPIO_WriteLow
 958  02b1 84            	pop	a
 959                     ; 463 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
 961  02b2 4b40          	push	#64
 962  02b4 ae500a        	ldw	x,#20490
 963  02b7 cd0000        	call	_GPIO_WriteLow
 965  02ba 84            	pop	a
 966                     ; 464 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
 968  02bb 4b80          	push	#128
 969  02bd ae500a        	ldw	x,#20490
 970  02c0 cd0000        	call	_GPIO_WriteLow
 972  02c3 84            	pop	a
 973                     ; 465 }
 976  02c4 81            	ret	
1021                     ; 471 void StartDriveOR( uint16_t Target, uint8_t overrun )
1021                     ; 472 {
1022                     	switch	.text
1023  02c5               _StartDriveOR:
1025  02c5 89            	pushw	x
1026       00000000      OFST:	set	0
1029                     ; 475 	if ( Drive.Position == Target ) return;
1031  02c6 b32f          	cpw	x,_Drive+1
1032  02c8 2748          	jreq	L031
1035                     ; 476 	if ( Drive.Run )
1037  02ca b62e          	ld	a,_Drive
1038  02cc a502          	bcp	a,#2
1039                     ; 480 	if ( Target == 0 )				//  goto origin
1041  02ce 5d            	tnzw	x
1042  02cf 260e          	jrne	L313
1043                     ; 482 		Drive.Overrun =	0u;
1045  02d1 5f            	clrw	x
1046  02d2 bf33          	ldw	_Drive+5,x
1047                     ; 483 		Drive.ZeroOffset = CPulse( OVER_STEP );
1049  02d4 ae001e        	ldw	x,#30
1050  02d7 cd0626        	call	_CPulse
1052  02da bf36          	ldw	_Drive+8,x
1053                     ; 486 		Drive.Target = 0u;
1055  02dc 5f            	clrw	x
1056                     ; 487 		Drive.State = nMotorClose;		// 0;
1058  02dd 200f          	jp	LC007
1059  02df               L313:
1060                     ; 492 		if (Drive.Position >= Target)		// Closing
1062  02df be2f          	ldw	x,_Drive+1
1063  02e1 1301          	cpw	x,(OFST+1,sp)
1064  02e3 250f          	jrult	L713
1065                     ; 494 			Drive.Overrun =	0u;
1067  02e5 5f            	clrw	x
1068  02e6 bf33          	ldw	_Drive+5,x
1069                     ; 495 			Drive.State = nMotorClose;
1071  02e8 3f3d          	clr	_Drive+15
1072                     ; 496 			Drive.Overrun2 = 0u;
1074  02ea 3f35          	clr	_Drive+7
1075                     ; 497 			Drive.Target = Target;
1077  02ec 1e01          	ldw	x,(OFST+1,sp)
1078                     ; 498 			Drive.State = nMotorClose;		// 0;
1080  02ee               LC007:
1081  02ee bf31          	ldw	_Drive+3,x
1083  02f0 3f3d          	clr	_Drive+15
1085  02f2 2017          	jra	L513
1086  02f4               L713:
1087                     ; 502 			Drive.State = nMotorOpen;	//1;
1089  02f4 3501003d      	mov	_Drive+15,#1
1090                     ; 503 			Drive.Overrun2 = overrun;		//100;
1092  02f8 7b05          	ld	a,(OFST+5,sp)
1093  02fa b735          	ld	_Drive+7,a
1094                     ; 504 			Drive.Target = Target + overrun;	//100;	
1096  02fc 7b01          	ld	a,(OFST+1,sp)
1097  02fe 97            	ld	xl,a
1098  02ff 7b02          	ld	a,(OFST+2,sp)
1099  0301 1b05          	add	a,(OFST+5,sp)
1100  0303 2401          	jrnc	L621
1101  0305 5c            	incw	x
1102  0306               L621:
1103  0306 b732          	ld	_Drive+4,a
1104  0308 9f            	ld	a,xl
1105  0309 b731          	ld	_Drive+3,a
1106  030b               L513:
1107                     ; 508 	Drive.Run = TRUE;
1109  030b 7212002e      	bset	_Drive,#1
1110                     ; 509 	Drive.Ticks = Drive.Interval;
1112  030f 453e3f        	mov	_Drive+17,_Drive+16
1113                     ; 510 }
1114  0312               L031:
1117  0312 85            	popw	x
1118  0313 81            	ret	
1178                     ; 516 void MotorStep(MOTOR_DIR Dir)
1178                     ; 517 {
1179                     	switch	.text
1180  0314               _MotorStep:
1184                     ; 518 	if ( Dir == nMotorClose )
1186  0314 4d            	tnz	a
1187  0315 2625          	jrne	L753
1188                     ; 520 		if ( Drive.Position != 0 ) 
1190  0317 be2f          	ldw	x,_Drive+1
1191  0319 270f          	jreq	LC008
1192                     ; 522 			Drive.Position--;
1194  031b 5a            	decw	x
1195  031c bf2f          	ldw	_Drive+1,x
1196                     ; 523 			if ( Drive.NormalOpen )
1198  031e b644          	ld	a,_Drive+22
1199  0320 2704          	jreq	L363
1200                     ; 524 				Drive.Phase++;   // NC
1202  0322 3c38          	inc	_Drive+10
1204  0324 2047          	jra	L373
1205  0326               L363:
1206                     ; 527 				Drive.Phase--;	//NC
1208  0326 3a38          	dec	_Drive+10
1209  0328 2043          	jra	L373
1210                     ; 531 		if ( Drive.Position == 0 ) 
1212  032a               LC008:
1213                     ; 534 			Drive.Overrun = 0u;
1215  032a 5f            	clrw	x
1216  032b bf33          	ldw	_Drive+5,x
1217                     ; 535 			Drive.Run = FALSE;
1219  032d 7213002e      	bres	_Drive,#1
1220                     ; 536 			Drive.ZeroOffset = 0u;
1222  0331 bf36          	ldw	_Drive+8,x
1223                     ; 537 			Drive.Position = 0u;
1225  0333 bf2f          	ldw	_Drive+1,x
1226                     ; 538 			Drive.Target = 0u;
1228  0335 bf31          	ldw	_Drive+3,x
1229                     ; 539 			StopDrive();	
1231  0337 cd02a0        	call	_StopDrive
1233  033a 2031          	jra	L373
1234  033c               L753:
1235                     ; 545 			Drive.Position++;
1237  033c be2f          	ldw	x,_Drive+1
1238  033e 5c            	incw	x
1239  033f bf2f          	ldw	_Drive+1,x
1240                     ; 547 		if ( Drive.NormalOpen )
1242  0341 b644          	ld	a,_Drive+22
1243  0343 2704          	jreq	L573
1244                     ; 548 				Drive.Phase--;
1246  0345 3a38          	dec	_Drive+10
1248  0347 2002          	jra	L773
1249  0349               L573:
1250                     ; 550 				Drive.Phase++;
1252  0349 3c38          	inc	_Drive+10
1253  034b               L773:
1254                     ; 553 		if ( Drive.Origin ) 
1256  034b b643          	ld	a,_Drive+21
1257  034d 2708          	jreq	L104
1258                     ; 555 			Drive.ORGPosition = Drive.Position;
1260  034f bf3b          	ldw	_Drive+13,x
1261                     ; 556 			Drive.LastOrigin = TRUE;
1263  0351 7214002e      	bset	_Drive,#2
1265  0355 2016          	jra	L373
1266  0357               L104:
1267                     ; 559 			if ( Drive.LastOrigin )
1269  0357 7205002e11    	btjf	_Drive,#2,L373
1270                     ; 561 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1272  035c be3b          	ldw	x,_Drive+13
1273  035e 1d0028        	subw	x,#40
1274  0361 bf39          	ldw	_Drive+11,x
1275                     ; 562 				if ( Drive.MaxOverrun > OVERRUN )
1277  0363 a3012d        	cpw	x,#301
1278  0366 2505          	jrult	L373
1279                     ; 563 					Drive.MaxOverrun = OVERRUN;				
1281  0368 ae012c        	ldw	x,#300
1282  036b bf39          	ldw	_Drive+11,x
1283  036d               L373:
1284                     ; 568 	if ( !Drive.Run ) return;
1286  036d 7202002e01    	btjt	_Drive,#1,L114
1290  0372 81            	ret	
1291  0373               L114:
1292                     ; 569 	if ( !Drive.Enabled ) return;
1294  0373 7200002e01    	btjt	_Drive,#0,L314
1298  0378 81            	ret	
1299  0379               L314:
1300                     ; 570 	switch ( Drive.ExcitationType )
1302  0379 b642          	ld	a,_Drive+20
1304                     ; 581 			break;
1305  037b 2707          	jreq	L323
1306  037d 4a            	dec	a
1307  037e 2707          	jreq	L523
1308  0380 4a            	dec	a
1309  0381 2707          	jreq	L723
1311  0383 81            	ret	
1312  0384               L323:
1313                     ; 573 		case 0:
1313                     ; 574 			Excitation_1Phase();	
1316                     ; 575 			break;
1319  0384 cc0560        	jp	_Excitation_1Phase
1320  0387               L523:
1321                     ; 576 		case 1:
1321                     ; 577 			Excitation_12Phase();
1324                     ; 578 			break;
1327  0387 cc0497        	jp	_Excitation_12Phase
1328  038a               L723:
1329                     ; 579 		case 2:
1329                     ; 580 			Excitation_2Phase();
1332                     ; 581 			break;
1334                     ; 586 }
1337  038a 207d          	jp	_Excitation_2Phase
1363                     ; 591 void MotorClose(void)
1363                     ; 592 {
1364                     	switch	.text
1365  038c               _MotorClose:
1369                     ; 594 	if ( Drive.Origin )   		// Hall IC Sensing 
1371  038c b643          	ld	a,_Drive+21
1372  038e 2715          	jreq	L134
1373                     ; 596 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1375  0390 be33          	ldw	x,_Drive+5
1376  0392 b339          	cpw	x,_Drive+11
1377  0394 250c          	jrult	L334
1378                     ; 598 			Drive.Target = 0u;
1380  0396 5f            	clrw	x
1381  0397 bf31          	ldw	_Drive+3,x
1382                     ; 599 			Drive.Position = 0u;
1384  0399 bf2f          	ldw	_Drive+1,x
1385                     ; 600 			Drive.Overrun = 0u;
1387  039b bf33          	ldw	_Drive+5,x
1388                     ; 601 			Drive.ZeroOffset = 0u;
1390  039d bf36          	ldw	_Drive+8,x
1391                     ; 605 			StopDrive();
1396  039f cc02a0        	jp	_StopDrive
1397  03a2               L334:
1398                     ; 609 			Drive.Overrun++;
1400  03a2 5c            	incw	x
1401  03a3 bf33          	ldw	_Drive+5,x
1402                     ; 610 			MotorStep(nMotorClose);
1404  03a5               L134:
1405                     ; 614 		MotorStep(nMotorClose);		// move 1 step close
1408  03a5 4f            	clr	a
1410                     ; 615 }
1413  03a6 cc0314        	jp	_MotorStep
1440                     ; 620 void DriveService(void)
1440                     ; 621 {
1441                     	switch	.text
1442  03a9               _DriveService:
1444  03a9 89            	pushw	x
1445       00000002      OFST:	set	2
1448                     ; 623 	if ( ! Drive.Run ) 
1450  03aa 7202002e02    	btjt	_Drive,#1,L154
1451                     ; 626 		StopDrive();
1453                     ; 627 		return;	//when Drive is stop 
1455  03af 2053          	jp	LC010
1456  03b1               L154:
1457                     ; 630 	if ( Drive.Stop && (Drive.Phase % 8)==0)
1459  03b1 b647          	ld	a,_Drive+25
1460  03b3 270c          	jreq	L354
1462  03b5 b638          	ld	a,_Drive+10
1463  03b7 a507          	bcp	a,#7
1464  03b9 2606          	jrne	L354
1465                     ; 632 		Drive.Stop = 0;
1467  03bb 3f47          	clr	_Drive+25
1468                     ; 633 		Drive.Target = Drive.Position ;
1470  03bd be2f          	ldw	x,_Drive+1
1471  03bf bf31          	ldw	_Drive+3,x
1472  03c1               L354:
1473                     ; 636 	if ( Drive.Target > Drive.Position )
1475  03c1 be31          	ldw	x,_Drive+3
1476  03c3 b32f          	cpw	x,_Drive+1
1477  03c5 2307          	jrule	L554
1478                     ; 637 	 	MotorStep(nMotorOpen);
1480  03c7 a601          	ld	a,#1
1481  03c9 cd0314        	call	_MotorStep
1484  03cc 2039          	jra	L754
1485  03ce               L554:
1486                     ; 638 	else if ( Drive.Target < Drive.Position )
1488  03ce b32f          	cpw	x,_Drive+1
1489  03d0 2404          	jruge	L164
1490                     ; 639 		MotorClose( );
1492  03d2 adb8          	call	_MotorClose
1495  03d4 2031          	jra	L754
1496  03d6               L164:
1497                     ; 640 	else if ( Drive.Target ) 	// on target position
1499  03d6 be31          	ldw	x,_Drive+3
1500  03d8 2721          	jreq	L564
1501                     ; 642 			if ( Drive.Overrun2 )
1503  03da b635          	ld	a,_Drive+7
1504  03dc 270f          	jreq	L764
1505                     ; 644 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1507  03de 5f            	clrw	x
1508  03df 97            	ld	xl,a
1509  03e0 1f01          	ldw	(OFST-1,sp),x
1511  03e2 be31          	ldw	x,_Drive+3
1512  03e4 72f001        	subw	x,(OFST-1,sp)
1513  03e7 bf31          	ldw	_Drive+3,x
1514                     ; 645 				Drive.Overrun2 = 0u;
1516  03e9 3f35          	clr	_Drive+7
1518  03eb 201a          	jra	L754
1519  03ed               L764:
1520                     ; 649 				Drive.ZeroOffset = 0u;
1522  03ed 5f            	clrw	x
1523  03ee bf36          	ldw	_Drive+8,x
1524                     ; 650 				Drive.Overrun = 0u;
1526  03f0 bf33          	ldw	_Drive+5,x
1527                     ; 652 				StopDrive();	
1529  03f2 cd02a0        	call	_StopDrive
1531                     ; 653 				Drive.Run = FALSE;				
1533  03f5 7213002e      	bres	_Drive,#1
1534  03f9 200c          	jra	L754
1535  03fb               L564:
1536                     ; 659 			Drive.ZeroOffset = 0u;
1538  03fb 5f            	clrw	x
1539  03fc bf36          	ldw	_Drive+8,x
1540                     ; 660 			Drive.Overrun = 0u;
1542  03fe bf33          	ldw	_Drive+5,x
1543                     ; 661 			Drive.Run = FALSE;
1545  0400 7213002e      	bres	_Drive,#1
1546                     ; 662 			StopDrive();	
1548  0404               LC010:
1550  0404 cd02a0        	call	_StopDrive
1552  0407               L754:
1553                     ; 664 }
1556  0407 85            	popw	x
1557  0408 81            	ret	
1583                     ; 667 void Excitation_2Phase( void )
1583                     ; 668 {
1584                     	switch	.text
1585  0409               _Excitation_2Phase:
1589                     ; 670 	switch (Drive.Phase%8)
1591  0409 b638          	ld	a,_Drive+10
1592  040b a407          	and	a,#7
1594                     ; 702 		default:
1594                     ; 703 			break;
1595  040d 2716          	jreq	L574
1596  040f 4a            	dec	a
1597  0410 2713          	jreq	L574
1598  0412 4a            	dec	a
1599  0413 271e          	jreq	L774
1600  0415 4a            	dec	a
1601  0416 271b          	jreq	L774
1602  0418 4a            	dec	a
1603  0419 272f          	jreq	L105
1604  041b 4a            	dec	a
1605  041c 272c          	jreq	L105
1606  041e 4a            	dec	a
1607  041f 2737          	jreq	L305
1608  0421 4a            	dec	a
1609  0422 2734          	jreq	L305
1611  0424 81            	ret	
1612  0425               L574:
1613                     ; 672 		case 0:
1613                     ; 673 		case 1:
1613                     ; 674 		//case 1:
1613                     ; 675 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1615  0425 ad48          	call	LC014
1616                     ; 676 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1618  0427 ad5a          	call	LC016
1619                     ; 677 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1621  0429 4b40          	push	#64
1622  042b ae500a        	ldw	x,#20490
1623  042e cd0000        	call	_GPIO_WriteLow
1625                     ; 678 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1627                     ; 679 			break;		
1629  0431 200c          	jp	LC013
1630  0433               L774:
1631                     ; 680 		case 2:
1631                     ; 681 		case 3:
1631                     ; 682 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1633  0433 ad44          	call	LC015
1634                     ; 683 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1636  0435 ad4c          	call	LC016
1637                     ; 684 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1639  0437 4b40          	push	#64
1640  0439 ae500a        	ldw	x,#20490
1641  043c cd0000        	call	_GPIO_WriteHigh
1643                     ; 685 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1645  043f               LC013:
1646  043f 84            	pop	a
1648  0440 4b80          	push	#128
1649  0442 ae500a        	ldw	x,#20490
1650  0445 cd0000        	call	_GPIO_WriteLow
1652                     ; 686 			break;
1654  0448 2023          	jp	LC011
1655  044a               L105:
1656                     ; 687 		case 4:
1656                     ; 688 		case 5:
1656                     ; 689 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1658  044a ad2d          	call	LC015
1659                     ; 690 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1661  044c ad3f          	call	LC017
1662                     ; 691 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1664  044e 4b40          	push	#64
1665  0450 ae500a        	ldw	x,#20490
1666  0453 cd0000        	call	_GPIO_WriteHigh
1668                     ; 692 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1670                     ; 693 			break;
1672  0456 200c          	jp	LC012
1673  0458               L305:
1674                     ; 694 		case 6:
1674                     ; 695 		case 7:		
1674                     ; 696 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1676  0458 ad15          	call	LC014
1677                     ; 697 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1679  045a ad31          	call	LC017
1680                     ; 698 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1682  045c 4b40          	push	#64
1683  045e ae500a        	ldw	x,#20490
1684  0461 cd0000        	call	_GPIO_WriteLow
1686                     ; 699 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1688  0464               LC012:
1689  0464 84            	pop	a
1691  0465 4b80          	push	#128
1692  0467 ae500a        	ldw	x,#20490
1693  046a cd0000        	call	_GPIO_WriteHigh
1695  046d               LC011:
1696  046d 84            	pop	a
1697                     ; 700 			break;
1699                     ; 702 		default:
1699                     ; 703 			break;
1701                     ; 706 }
1704  046e 81            	ret	
1705  046f               LC014:
1706  046f 4b04          	push	#4
1707  0471 ae5000        	ldw	x,#20480
1708  0474 cd0000        	call	_GPIO_WriteHigh
1710  0477 84            	pop	a
1711  0478 81            	ret	
1712  0479               LC015:
1713  0479 4b04          	push	#4
1714  047b ae5000        	ldw	x,#20480
1715  047e cd0000        	call	_GPIO_WriteLow
1717  0481 84            	pop	a
1718  0482 81            	ret	
1719  0483               LC016:
1720  0483 4b20          	push	#32
1721  0485 ae500a        	ldw	x,#20490
1722  0488 cd0000        	call	_GPIO_WriteHigh
1724  048b 84            	pop	a
1725  048c 81            	ret	
1726  048d               LC017:
1727  048d 4b20          	push	#32
1728  048f ae500a        	ldw	x,#20490
1729  0492 cd0000        	call	_GPIO_WriteLow
1731  0495 84            	pop	a
1732  0496 81            	ret	
1758                     ; 709 void Excitation_12Phase( void )
1758                     ; 710 {
1759                     	switch	.text
1760  0497               _Excitation_12Phase:
1764                     ; 712 	switch (Drive.Phase%8)
1766  0497 b638          	ld	a,_Drive+10
1767  0499 a407          	and	a,#7
1769                     ; 763 		default:
1769                     ; 764 			break;
1770  049b 2716          	jreq	L325
1771  049d 4a            	dec	a
1772  049e 271d          	jreq	L525
1773  04a0 4a            	dec	a
1774  04a1 272d          	jreq	L725
1775  04a3 4a            	dec	a
1776  04a4 273f          	jreq	L135
1777  04a6 4a            	dec	a
1778  04a7 2748          	jreq	L335
1779  04a9 4a            	dec	a
1780  04aa 2753          	jreq	L535
1781  04ac 4a            	dec	a
1782  04ad 276e          	jreq	L735
1783  04af 4a            	dec	a
1784  04b0 2775          	jreq	L145
1786  04b2 81            	ret	
1787  04b3               L325:
1788                     ; 714 		case 0:
1788                     ; 715 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1790  04b3 4b04          	push	#4
1791  04b5 ae5000        	ldw	x,#20480
1792  04b8 cd0000        	call	_GPIO_WriteHigh
1794                     ; 716 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1796                     ; 717 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1798                     ; 718 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1800                     ; 719 			break;
1802  04bb 2008          	jp	LC021
1803  04bd               L525:
1804                     ; 720 		case 1:
1804                     ; 721 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1806  04bd 4b04          	push	#4
1807  04bf ae5000        	ldw	x,#20480
1808  04c2 cd0000        	call	_GPIO_WriteLow
1810                     ; 722 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1812  04c5               LC021:
1813  04c5 84            	pop	a
1815  04c6 4b20          	push	#32
1816  04c8 ae500a        	ldw	x,#20490
1817  04cb cd0000        	call	_GPIO_WriteHigh
1819                     ; 723 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1821                     ; 724 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1823                     ; 725 			break;		
1825  04ce 2068          	jp	LC020
1826  04d0               L725:
1827                     ; 726 		case 2:
1827                     ; 727 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1829  04d0 ad7a          	call	LC025
1830                     ; 728 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1832  04d2 4b20          	push	#32
1833  04d4 ae500a        	ldw	x,#20490
1834  04d7 cd0000        	call	_GPIO_WriteHigh
1836                     ; 729 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1838  04da               LC022:
1839  04da 84            	pop	a
1841  04db 4b40          	push	#64
1842  04dd ae500a        	ldw	x,#20490
1843  04e0 cd0000        	call	_GPIO_WriteHigh
1845                     ; 730 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
1847                     ; 731 			break;
1849  04e3 205c          	jp	LC019
1850  04e5               L135:
1851                     ; 732 		case 3:
1851                     ; 733 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1853  04e5 ad65          	call	LC025
1854                     ; 734 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1856  04e7 4b20          	push	#32
1857  04e9 ae500a        	ldw	x,#20490
1858  04ec cd0000        	call	_GPIO_WriteLow
1860                     ; 735 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1862                     ; 736 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1864                     ; 737 			break;
1866  04ef 20e9          	jp	LC022
1867  04f1               L335:
1868                     ; 738 		case 4:
1868                     ; 739 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1870  04f1 ad59          	call	LC025
1871                     ; 740 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1873  04f3 ad61          	call	LC026
1874                     ; 741 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1876  04f5 4b40          	push	#64
1877  04f7 ae500a        	ldw	x,#20490
1878  04fa cd0000        	call	_GPIO_WriteHigh
1880                     ; 742 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1882                     ; 743 			break;
1884  04fd 2013          	jp	LC023
1885  04ff               L535:
1886                     ; 744 		case 5: 
1886                     ; 745 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1888  04ff 4b04          	push	#4
1889  0501 ae5000        	ldw	x,#20480
1890  0504 cd0000        	call	_GPIO_WriteLow
1892                     ; 746 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1895                     ; 747 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1897  0507               LC024:
1898  0507 84            	pop	a
1900  0508 ad4c          	call	LC026
1902  050a 4b40          	push	#64
1903  050c ae500a        	ldw	x,#20490
1904  050f cd0000        	call	_GPIO_WriteLow
1906                     ; 748 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1908  0512               LC023:
1909  0512 84            	pop	a
1912  0513 4b80          	push	#128
1913  0515 ae500a        	ldw	x,#20490
1914  0518 cd0000        	call	_GPIO_WriteHigh
1916                     ; 749 			break;
1918  051b 202d          	jp	LC018
1919  051d               L735:
1920                     ; 750 		case 6:  
1920                     ; 751 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1922  051d 4b04          	push	#4
1923  051f ae5000        	ldw	x,#20480
1924  0522 cd0000        	call	_GPIO_WriteHigh
1926                     ; 752 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1928                     ; 753 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1930                     ; 754 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
1932                     ; 755 			break;
1934  0525 20e0          	jp	LC024
1935  0527               L145:
1936                     ; 756 		case 7:
1936                     ; 757 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1938  0527 4b04          	push	#4
1939  0529 ae5000        	ldw	x,#20480
1940  052c cd0000        	call	_GPIO_WriteHigh
1942  052f 84            	pop	a
1943                     ; 758 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1945  0530 4b20          	push	#32
1946  0532 ae500a        	ldw	x,#20490
1947  0535 cd0000        	call	_GPIO_WriteLow
1949                     ; 759 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1951  0538               LC020:
1952  0538 84            	pop	a
1955  0539 4b40          	push	#64
1956  053b ae500a        	ldw	x,#20490
1957  053e cd0000        	call	_GPIO_WriteLow
1959                     ; 760 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1961  0541               LC019:
1962  0541 84            	pop	a
1967  0542 4b80          	push	#128
1968  0544 ae500a        	ldw	x,#20490
1969  0547 cd0000        	call	_GPIO_WriteLow
1971  054a               LC018:
1972  054a 84            	pop	a
1973                     ; 761 			break;
1975                     ; 763 		default:
1975                     ; 764 			break;
1977                     ; 767 }
1980  054b 81            	ret	
1981  054c               LC025:
1982  054c 4b04          	push	#4
1983  054e ae5000        	ldw	x,#20480
1984  0551 cd0000        	call	_GPIO_WriteLow
1986  0554 84            	pop	a
1987  0555 81            	ret	
1988  0556               LC026:
1989  0556 4b20          	push	#32
1990  0558 ae500a        	ldw	x,#20490
1991  055b cd0000        	call	_GPIO_WriteLow
1993  055e 84            	pop	a
1994  055f 81            	ret	
2020                     ; 769 void Excitation_1Phase( void )
2020                     ; 770 {
2021                     	switch	.text
2022  0560               _Excitation_1Phase:
2026                     ; 773 	switch (Drive.Phase%8)
2028  0560 b638          	ld	a,_Drive+10
2029  0562 a407          	and	a,#7
2031                     ; 804 		default:
2031                     ; 805 			break;
2032  0564 2716          	jreq	L165
2033  0566 4a            	dec	a
2034  0567 2713          	jreq	L165
2035  0569 4a            	dec	a
2036  056a 2723          	jreq	L365
2037  056c 4a            	dec	a
2038  056d 2720          	jreq	L365
2039  056f 4a            	dec	a
2040  0570 273b          	jreq	L565
2041  0572 4a            	dec	a
2042  0573 2738          	jreq	L565
2043  0575 4a            	dec	a
2044  0576 2741          	jreq	L765
2045  0578 4a            	dec	a
2046  0579 273e          	jreq	L765
2048  057b 81            	ret	
2049  057c               L165:
2050                     ; 775 		case 0:
2050                     ; 776 		case 1:
2050                     ; 777 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2052  057c 4b04          	push	#4
2053  057e ae5000        	ldw	x,#20480
2054  0581 cd0000        	call	_GPIO_WriteHigh
2056  0584 84            	pop	a
2057                     ; 778 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2059  0585 4b20          	push	#32
2060  0587 ae500a        	ldw	x,#20490
2061  058a cd0000        	call	_GPIO_WriteLow
2063                     ; 779 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2065                     ; 780 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2067                     ; 781 			break;		
2069  058d 200a          	jp	LC029
2070  058f               L365:
2071                     ; 782 		case 2:
2071                     ; 783 		case 3:
2071                     ; 784 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2073  058f ad49          	call	LC031
2074                     ; 785 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2076  0591 4b20          	push	#32
2077  0593 ae500a        	ldw	x,#20490
2078  0596 cd0000        	call	_GPIO_WriteHigh
2080                     ; 786 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2082  0599               LC029:
2083  0599 84            	pop	a
2085  059a 4b40          	push	#64
2086  059c ae500a        	ldw	x,#20490
2087  059f cd0000        	call	_GPIO_WriteLow
2089                     ; 787 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2091  05a2               LC028:
2092  05a2 84            	pop	a
2095  05a3 4b80          	push	#128
2096  05a5 ae500a        	ldw	x,#20490
2097  05a8 cd0000        	call	_GPIO_WriteLow
2099                     ; 788 			break;
2101  05ab 201f          	jp	LC027
2102  05ad               L565:
2103                     ; 789 		case 4:
2103                     ; 790 		case 5:
2103                     ; 791 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2105  05ad ad1f          	call	LC030
2106                     ; 793 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2108  05af 4b40          	push	#64
2109  05b1 ae500a        	ldw	x,#20490
2110  05b4 cd0000        	call	_GPIO_WriteHigh
2112                     ; 794 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2114                     ; 795 			break;
2116  05b7 20e9          	jp	LC028
2117  05b9               L765:
2118                     ; 796 		case 6:
2118                     ; 797 		case 7:
2118                     ; 798 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2120  05b9 ad13          	call	LC030
2121                     ; 800 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2123  05bb 4b40          	push	#64
2124  05bd ae500a        	ldw	x,#20490
2125  05c0 cd0000        	call	_GPIO_WriteLow
2127  05c3 84            	pop	a
2128                     ; 801 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2130  05c4 4b80          	push	#128
2131  05c6 ae500a        	ldw	x,#20490
2132  05c9 cd0000        	call	_GPIO_WriteHigh
2134  05cc               LC027:
2135  05cc 84            	pop	a
2136                     ; 802 			break;
2138                     ; 804 		default:
2138                     ; 805 			break;
2140                     ; 808 }
2143  05cd 81            	ret	
2144  05ce               LC030:
2145  05ce ad0a          	call	LC031
2146                     ; 792 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2148  05d0 4b20          	push	#32
2149  05d2 ae500a        	ldw	x,#20490
2150  05d5 cd0000        	call	_GPIO_WriteLow
2152  05d8 84            	pop	a
2153  05d9 81            	ret	
2154  05da               LC031:
2155  05da 4b04          	push	#4
2156  05dc ae5000        	ldw	x,#20480
2157  05df cd0000        	call	_GPIO_WriteLow
2159  05e2 84            	pop	a
2160  05e3 81            	ret	
2195                     ; 811 u8 Interval( u16 Vmon)
2195                     ; 812 {
2196                     	switch	.text
2197  05e4               _Interval:
2199  05e4 89            	pushw	x
2200       00000000      OFST:	set	0
2203                     ; 813 	Vmon = Vmon / IntervalSlope;
2205  05e5 a61c          	ld	a,#28
2206  05e7 62            	div	x,a
2207                     ; 815 	if (Vmon < 10 ) Vmon = 10;
2209  05e8 a3000a        	cpw	x,#10
2210  05eb 2403          	jruge	L526
2213  05ed ae000a        	ldw	x,#10
2214  05f0               L526:
2215                     ; 816 	if (Vmon > 26 ) Vmon = 26;
2217  05f0 a3001b        	cpw	x,#27
2218  05f3 2503          	jrult	L726
2221  05f5 ae001a        	ldw	x,#26
2222  05f8               L726:
2223                     ; 818 	return ( TableInterval[ Vmon-10 ] );
2225  05f8 1d000a        	subw	x,#10
2226  05fb e602          	ld	a,(_TableInterval,x)
2229  05fd 85            	popw	x
2230  05fe 81            	ret	
2274                     .const:	section	.text
2275  0000               L404:
2276  0000 00000064      	dc.l	100
2277                     ; 833 uint16_t CStep( uint16_t pulse )
2277                     ; 834 {
2278                     	switch	.text
2279  05ff               _CStep:
2281  05ff 5204          	subw	sp,#4
2282       00000004      OFST:	set	4
2285                     ; 838 	i = (uint32_t) pulse * My.GearRatio100 ;
2287  0601 90be2b        	ldw	y,_My+12
2288  0604 cd0000        	call	c_umul
2290  0607 96            	ldw	x,sp
2291  0608 5c            	incw	x
2292  0609 cd0000        	call	c_rtol
2295                     ; 839 	i = (i+1)/100;   				// Round up  20150925
2297  060c 96            	ldw	x,sp
2298  060d 5c            	incw	x
2299  060e cd0000        	call	c_ltor
2301  0611 a601          	ld	a,#1
2302  0613 cd0000        	call	c_ladc
2304  0616 ae0000        	ldw	x,#L404
2305  0619 cd0000        	call	c_ludv
2307  061c 96            	ldw	x,sp
2308  061d 5c            	incw	x
2309  061e cd0000        	call	c_rtol
2312                     ; 840 	return (uint16_t) i;
2314  0621 1e03          	ldw	x,(OFST-1,sp)
2317  0623 5b04          	addw	sp,#4
2318  0625 81            	ret	
2362                     ; 844 uint16_t CPulse( uint16_t step )
2362                     ; 845 {
2363                     	switch	.text
2364  0626               _CPulse:
2366  0626 5204          	subw	sp,#4
2367       00000004      OFST:	set	4
2370                     ; 854 	i = (uint32_t) step * My.GearRatio100 ;
2372  0628 90be2b        	ldw	y,_My+12
2373  062b cd0000        	call	c_umul
2375  062e 96            	ldw	x,sp
2376  062f 5c            	incw	x
2377  0630 cd0000        	call	c_rtol
2380                     ; 857 	return (uint16_t) i;
2382  0633 1e03          	ldw	x,(OFST-1,sp)
2385  0635 5b04          	addw	sp,#4
2386  0637 81            	ret	
2415                     ; 868 void Clock_Config(void)
2415                     ; 869 {
2416                     	switch	.text
2417  0638               _Clock_Config:
2421                     ; 871 	CLK_DeInit();
2423  0638 cd0000        	call	_CLK_DeInit
2425                     ; 872 	CLK_HSICmd(ENABLE);
2427  063b a601          	ld	a,#1
2428  063d cd0000        	call	_CLK_HSICmd
2430                     ; 873 	CLK_LSICmd(DISABLE);
2432  0640 4f            	clr	a
2433  0641 cd0000        	call	_CLK_LSICmd
2435                     ; 874 	CLK_HSECmd(DISABLE);
2437  0644 4f            	clr	a
2438  0645 cd0000        	call	_CLK_HSECmd
2440                     ; 876 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2442  0648 4f            	clr	a
2443  0649 cd0000        	call	_CLK_HSIPrescalerConfig
2445                     ; 877 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2447  064c a680          	ld	a,#128
2449                     ; 878 }
2452  064e cc0000        	jp	_CLK_SYSCLKConfig
2478                     ; 881 void Gpio_Config(void)
2478                     ; 882 {
2479                     	switch	.text
2480  0651               _Gpio_Config:
2484                     ; 884   GPIO_Init(_LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2486  0651 4be0          	push	#224
2487  0653 4b10          	push	#16
2488  0655 ae5005        	ldw	x,#20485
2489  0658 cd0000        	call	_GPIO_Init
2491  065b 85            	popw	x
2492                     ; 885 	GPIO_WriteHigh(_LED_PORT, _LED_PIN);
2494  065c 4b10          	push	#16
2495  065e ae5005        	ldw	x,#20485
2496  0661 cd0000        	call	_GPIO_WriteHigh
2498  0664 84            	pop	a
2499                     ; 888 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2501  0665 4be0          	push	#224
2502  0667 4b04          	push	#4
2503  0669 ae5000        	ldw	x,#20480
2504  066c cd0000        	call	_GPIO_Init
2506  066f 85            	popw	x
2507                     ; 889 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2509  0670 4be0          	push	#224
2510  0672 4b40          	push	#64
2511  0674 ae500a        	ldw	x,#20490
2512  0677 cd0000        	call	_GPIO_Init
2514  067a 85            	popw	x
2515                     ; 890 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2517  067b 4be0          	push	#224
2518  067d 4b20          	push	#32
2519  067f ae500a        	ldw	x,#20490
2520  0682 cd0000        	call	_GPIO_Init
2522  0685 85            	popw	x
2523                     ; 891 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2525  0686 4be0          	push	#224
2526  0688 4b80          	push	#128
2527  068a ae500a        	ldw	x,#20490
2528  068d cd0000        	call	_GPIO_Init
2530  0690 85            	popw	x
2531                     ; 893 	GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2533  0691 4b04          	push	#4
2534  0693 ae5000        	ldw	x,#20480
2535  0696 cd0000        	call	_GPIO_WriteHigh
2537  0699 84            	pop	a
2538                     ; 894 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2540  069a 4b04          	push	#4
2541  069c ae5000        	ldw	x,#20480
2542  069f cd0000        	call	_GPIO_WriteLow
2544  06a2 84            	pop	a
2545                     ; 896 	GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2547  06a3 4b20          	push	#32
2548  06a5 ae500a        	ldw	x,#20490
2549  06a8 cd0000        	call	_GPIO_WriteHigh
2551  06ab 84            	pop	a
2552                     ; 897 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2554  06ac 4b20          	push	#32
2555  06ae ae500a        	ldw	x,#20490
2556  06b1 cd0000        	call	_GPIO_WriteLow
2558  06b4 84            	pop	a
2559                     ; 899 	GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2561  06b5 4b40          	push	#64
2562  06b7 ae500a        	ldw	x,#20490
2563  06ba cd0000        	call	_GPIO_WriteHigh
2565  06bd 84            	pop	a
2566                     ; 900 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2568  06be 4b40          	push	#64
2569  06c0 ae500a        	ldw	x,#20490
2570  06c3 cd0000        	call	_GPIO_WriteLow
2572  06c6 84            	pop	a
2573                     ; 902 	GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);		
2575  06c7 4b80          	push	#128
2576  06c9 ae500a        	ldw	x,#20490
2577  06cc cd0000        	call	_GPIO_WriteHigh
2579  06cf 84            	pop	a
2580                     ; 903 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2582  06d0 4b80          	push	#128
2583  06d2 ae500a        	ldw	x,#20490
2584  06d5 cd0000        	call	_GPIO_WriteLow
2586  06d8 84            	pop	a
2587                     ; 906   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2589  06d9 4b00          	push	#0
2590  06db 4b02          	push	#2
2591  06dd ae5000        	ldw	x,#20480
2592  06e0 cd0000        	call	_GPIO_Init
2594  06e3 85            	popw	x
2595                     ; 912 	GPIO_Init(_CHARGE_ON_PORT, _CHARGE_ON_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2597  06e4 4be0          	push	#224
2598  06e6 4b10          	push	#16
2599  06e8 ae500f        	ldw	x,#20495
2600  06eb cd0000        	call	_GPIO_Init
2602  06ee 85            	popw	x
2603                     ; 915 	GPIO_Init(_BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN, GPIO_MODE_OUT_PP_LOW_FAST);		
2605  06ef 4be0          	push	#224
2606  06f1 4b08          	push	#8
2607  06f3 ae5000        	ldw	x,#20480
2608  06f6 cd0000        	call	_GPIO_Init
2610  06f9 85            	popw	x
2611                     ; 920 	GPIO_Init( _ADJ_MO_PORT , _ADJ_MO_PIN , GPIO_MODE_IN_FL_NO_IT );
2613  06fa 4b00          	push	#0
2614  06fc 4b10          	push	#16
2615  06fe ae500a        	ldw	x,#20490
2616  0701 cd0000        	call	_GPIO_Init
2618  0704 85            	popw	x
2619                     ; 922 	GPIO_Init( _BAT_MO_PORT , _BAT_MO_PIN, GPIO_MODE_IN_FL_NO_IT );
2621  0705 ad2f          	call	LC032
2622                     ; 924 	GPIO_Init( _BOOST_MO_PORT , _BOOST_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2624  0707 ad2d          	call	LC032
2625                     ; 926   GPIO_Init( _POWER_MO_PORT , _POWER_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2627  0709 4b00          	push	#0
2628  070b 4b20          	push	#32
2629  070d ae500f        	ldw	x,#20495
2630  0710 cd0000        	call	_GPIO_Init
2632  0713 85            	popw	x
2633                     ; 928 	GPIO_Init( _ISENSE_PORT , _ISENSE_PIN  , GPIO_MODE_IN_FL_NO_IT );
2635  0714 4b00          	push	#0
2636  0716 4b04          	push	#4
2637  0718 ae500f        	ldw	x,#20495
2638  071b cd0000        	call	_GPIO_Init
2640  071e 85            	popw	x
2641                     ; 934 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
2643  071f 4b00          	push	#0
2644  0721 4b20          	push	#32
2645  0723 ae5005        	ldw	x,#20485
2646  0726 cd0000        	call	_GPIO_Init
2648  0729 85            	popw	x
2649                     ; 935 	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
2651  072a 4b00          	push	#0
2652  072c 4b08          	push	#8
2653  072e ae500a        	ldw	x,#20490
2654  0731 cd0000        	call	_GPIO_Init
2656  0734 85            	popw	x
2657                     ; 937 }
2660  0735 81            	ret	
2661  0736               LC032:
2662  0736 4b00          	push	#0
2663  0738 4b08          	push	#8
2664  073a ae500f        	ldw	x,#20495
2665  073d cd0000        	call	_GPIO_Init
2667  0740 85            	popw	x
2668  0741 81            	ret	
2695                     ; 941 void Timer4_Config(void)
2695                     ; 942 {
2696                     	switch	.text
2697  0742               L5_Timer4_Config:
2701                     ; 943   TIM4_DeInit();
2703  0742 cd0000        	call	_TIM4_DeInit
2705                     ; 949 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
2707  0745 ae0432        	ldw	x,#1074
2708  0748 cd0000        	call	_TIM4_TimeBaseInit
2710                     ; 953   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2712  074b ae0101        	ldw	x,#257
2713  074e cd0000        	call	_TIM4_ITConfig
2715                     ; 956   TIM4_Cmd(ENABLE);
2717  0751 a601          	ld	a,#1
2719                     ; 957 }
2722  0753 cc0000        	jp	_TIM4_Cmd
2750                     ; 960 static void Adc_Config( void )
2750                     ; 961 {
2751                     	switch	.text
2752  0756               L3_Adc_Config:
2756                     ; 963 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
2758  0756 cd0000        	call	_ADC1_GetConversionValue
2760  0759 b615          	ld	a,_Adc+10
2761  075b 905f          	clrw	y
2762  075d 9097          	ld	yl,a
2763  075f 9058          	sllw	y
2764  0761 90ef0b        	ldw	(_Adc,y),x
2765                     ; 965 	ADC1_DeInit( );
2767  0764 cd0000        	call	_ADC1_DeInit
2769                     ; 967 	switch (Adc.Idx)
2771  0767 b615          	ld	a,_Adc+10
2773                     ; 1001 			break;
2774  0769 270e          	jreq	L527
2775  076b 4a            	dec	a
2776  076c 2725          	jreq	L727
2777  076e 4a            	dec	a
2778  076f 273c          	jreq	L137
2779  0771 4a            	dec	a
2780  0772 2753          	jreq	L337
2781  0774 4a            	dec	a
2782  0775 276a          	jreq	L537
2783                     ; 999 		default:
2783                     ; 1000 			Adc.Idx = 0;
2784                     ; 1001 			break;
2786  0777 207c          	jp	LC033
2787  0779               L527:
2788                     ; 969 		case 0:
2788                     ; 970 		  
2788                     ; 971 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
2788                     ; 972 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
2790  0779 4b00          	push	#0
2791  077b 4b03          	push	#3
2792  077d 4b08          	push	#8
2793  077f 4b00          	push	#0
2794  0781 4b00          	push	#0
2795  0783 4b00          	push	#0
2796  0785 ae0003        	ldw	x,#3
2797  0788 cd0000        	call	_ADC1_Init
2799  078b 5b06          	addw	sp,#6
2800                     ; 973 			Adc.Idx = 1;
2802  078d 35010015      	mov	_Adc+10,#1
2803                     ; 974 			break;
2805  0791 2064          	jra	L357
2806  0793               L727:
2807                     ; 975 		case 1:
2807                     ; 976 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
2807                     ; 977 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
2809  0793 4b00          	push	#0
2810  0795 4b04          	push	#4
2811  0797 4b08          	push	#8
2812  0799 4b00          	push	#0
2813  079b 4b00          	push	#0
2814  079d 4b00          	push	#0
2815  079f ae0004        	ldw	x,#4
2816  07a2 cd0000        	call	_ADC1_Init
2818  07a5 5b06          	addw	sp,#6
2819                     ; 978 			Adc.Idx = 2;
2821  07a7 35020015      	mov	_Adc+10,#2
2822                     ; 979 			break;
2824  07ab 204a          	jra	L357
2825  07ad               L137:
2826                     ; 981 		case 2:
2826                     ; 982 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_5, ADC1_PRESSEL_FCPU_D2, 
2826                     ; 983 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
2828  07ad 4b00          	push	#0
2829  07af 4b02          	push	#2
2830  07b1 4b08          	push	#8
2831  07b3 4b00          	push	#0
2832  07b5 4b00          	push	#0
2833  07b7 4b00          	push	#0
2834  07b9 ae0005        	ldw	x,#5
2835  07bc cd0000        	call	_ADC1_Init
2837  07bf 5b06          	addw	sp,#6
2838                     ; 984 			Adc.Idx = 3;
2840  07c1 35030015      	mov	_Adc+10,#3
2841                     ; 985 			break;
2843  07c5 2030          	jra	L357
2844  07c7               L337:
2845                     ; 987 		case 3:
2845                     ; 988 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_6, ADC1_PRESSEL_FCPU_D2, 
2845                     ; 989 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
2847  07c7 4b00          	push	#0
2848  07c9 4b02          	push	#2
2849  07cb 4b08          	push	#8
2850  07cd 4b00          	push	#0
2851  07cf 4b00          	push	#0
2852  07d1 4b00          	push	#0
2853  07d3 ae0006        	ldw	x,#6
2854  07d6 cd0000        	call	_ADC1_Init
2856  07d9 5b06          	addw	sp,#6
2857                     ; 990 			Adc.Idx = 4;
2859  07db 35040015      	mov	_Adc+10,#4
2860                     ; 991 			break;	
2862  07df 2016          	jra	L357
2863  07e1               L537:
2864                     ; 993 		case 4:
2864                     ; 994 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
2864                     ; 995 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
2866  07e1 4b00          	push	#0
2867  07e3 4b02          	push	#2
2868  07e5 4b08          	push	#8
2869  07e7 4b00          	push	#0
2870  07e9 4b00          	push	#0
2871  07eb 4b00          	push	#0
2872  07ed ae0002        	ldw	x,#2
2873  07f0 cd0000        	call	_ADC1_Init
2875  07f3 5b06          	addw	sp,#6
2876                     ; 996 			Adc.Idx = 0;
2878  07f5               LC033:
2880  07f5 3f15          	clr	_Adc+10
2881                     ; 997 			break;	
2883  07f7               L357:
2884                     ; 1004 		ADC1_StartConversion();		
2887                     ; 1005 }
2890  07f7 cc0000        	jp	_ADC1_StartConversion
2934                     ; 1020 void assert_failed(u8* file, u32 line)
2934                     ; 1021 {
2935                     	switch	.text
2936  07fa               _assert_failed:
2938  07fa 88            	push	a
2939       00000001      OFST:	set	1
2942  07fb               L777:
2943                     ; 1030 	i = i++;
2945  07fb 0c01          	inc	(OFST+0,sp)
2947  07fd 6b01          	ld	(OFST+0,sp),a
2950  07ff 20fa          	jra	L777
3443                     	xdef	_MotorClose
3444                     	xdef	_MotorStep
3445                     	xdef	_StopDrive
3446                     	xdef	_OnTimer_1mS
3447                     	xdef	_OnTimer_1S
3448                     	xdef	_main
3449                     	xdef	_Diff
3450                     	xdef	_Gpio_Config
3451                     	xdef	_Clock_Config
3452                     	xdef	_OnTimer4
3453                     	xdef	_Interval
3454                     	xdef	_StartDriveOR
3455                     	xdef	_DriveService
3456                     	xdef	_Excitation_2Phase
3457                     	xdef	_Excitation_12Phase
3458                     	xdef	_Excitation_1Phase
3459                     	xdef	_CPulse
3460                     	xdef	_CStep
3461                     	xdef	_PowerDelay_1mS
3462                     	switch	.ubsct
3463  0000               _Timer:
3464  0000 000000000000  	ds.b	11
3465                     	xdef	_Timer
3466  000b               _Adc:
3467  000b 000000000000  	ds.b	20
3468                     	xdef	_Adc
3469  001f               _My:
3470  001f 000000000000  	ds.b	15
3471                     	xdef	_My
3472  002e               _Drive:
3473  002e 000000000000  	ds.b	26
3474                     	xdef	_Drive
3475                     	xdef	_TableInterval
3476  0048               _Ticks_S:
3477  0048 0000          	ds.b	2
3478                     	xdef	_Ticks_S
3479  004a               _Ticks_1mS:
3480  004a 0000          	ds.b	2
3481                     	xdef	_Ticks_1mS
3482  004c               _Ticks_50uS:
3483  004c 00            	ds.b	1
3484                     	xdef	_Ticks_50uS
3485                     	xdef	_PeriodNumber
3486  004d               _Counter:
3487  004d 0000          	ds.b	2
3488                     	xdef	_Counter
3489                     	xdef	_assert_failed
3490                     	xref	_TIM4_ITConfig
3491                     	xref	_TIM4_Cmd
3492                     	xref	_TIM4_TimeBaseInit
3493                     	xref	_TIM4_DeInit
3494                     	xref	_GPIO_ReadInputPin
3495                     	xref	_GPIO_WriteReverse
3496                     	xref	_GPIO_WriteLow
3497                     	xref	_GPIO_WriteHigh
3498                     	xref	_GPIO_Init
3499                     	xref	_CLK_SYSCLKConfig
3500                     	xref	_CLK_HSIPrescalerConfig
3501                     	xref	_CLK_LSICmd
3502                     	xref	_CLK_HSICmd
3503                     	xref	_CLK_HSECmd
3504                     	xref	_CLK_DeInit
3505                     	xref	_ADC1_GetConversionValue
3506                     	xref	_ADC1_StartConversion
3507                     	xref	_ADC1_Init
3508                     	xref	_ADC1_DeInit
3509                     	xref.b	c_lreg
3510                     	xref.b	c_x
3511                     	xref.b	c_y
3531                     	xref	c_ludv
3532                     	xref	c_ladc
3533                     	xref	c_umul
3534                     	xref	c_ladd
3535                     	xref	c_lsub
3536                     	xref	c_ltor
3537                     	xref	c_lcmp
3538                     	xref	c_rtol
3539                     	xref	c_uitolx
3540                     	xref	c_imul
3541                     	end
