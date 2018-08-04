   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  20                     	bsct
  21  0000               _PeriodNumber:
  22  0000 0000          	dc.w	0
  23  0002               _nDuty:
  24  0002 00            	dc.b	0
  25  0003               _TableInterval:
  26  0003 41            	dc.b	65
  27  0004 38            	dc.b	56
  28  0005 32            	dc.b	50
  29  0006 2d            	dc.b	45
  30  0007 28            	dc.b	40
  31  0008 24            	dc.b	36
  32  0009 20            	dc.b	32
  33  000a 1d            	dc.b	29
  34  000b 1a            	dc.b	26
  35  000c 17            	dc.b	23
  36  000d 15            	dc.b	21
  37  000e 13            	dc.b	19
  38  000f 11            	dc.b	17
  39  0010 10            	dc.b	16
  40  0011 0f            	dc.b	15
  41  0012 0e            	dc.b	14
  42  0013 0d            	dc.b	13
  43  0014               _PowerDelay_1mS:
  44  0014 01f3          	dc.w	499
  45  0016               _min:
  46  0016 c8            	dc.b	200
 111                     .const:	section	.text
 112  0000               L26:
 113  0000 0000000a      	dc.l	10
 114  0004               L46:
 115  0004 00000032      	dc.l	50
 116                     ; 215 void main(void)
 116                     ; 216 {
 117                     	scross	off
 118                     	switch	.text
 119  0000               _main:
 123                     ; 219 	Ticks_1mS = 0;
 125  0000 5f            	clrw	x
 126  0001 bfa2          	ldw	_Ticks_1mS,x
 127                     ; 220 	Ticks_50uS = 0;
 129  0003 bfa6          	ldw	_Ticks_50uS+2,x
 130  0005 bfa4          	ldw	_Ticks_50uS,x
 131                     ; 223 	Clock_Config();
 133  0007 cd06f5        	call	_Clock_Config
 135                     ; 224 	Gpio_Config();
 137  000a cd070e        	call	_Gpio_Config
 139                     ; 226 	Timer4_Config();
 141  000d cd07c5        	call	L5_Timer4_Config
 143                     ; 228 	Adc.Idx = 2;
 145  0010 35020058      	mov	_Adc+6,#2
 146                     ; 229 	Adc_Config(  );
 148  0014 cd07d9        	call	L3_Adc_Config
 150                     ; 236 	Drive.Enabled = ENABLED;
 152  0017 7210006c      	bset	_Drive,#0
 153                     ; 237 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 155  001b ae012c        	ldw	x,#300
 156  001e bf77          	ldw	_Drive+11,x
 157                     ; 239 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 159  0020 bf80          	ldw	_Drive+20,x
 160                     ; 241 	Drive.Position = 0;
 162  0022 5f            	clrw	x
 163  0023 bf6d          	ldw	_Drive+1,x
 164                     ; 242 	Drive.Interval = 12u;	//	for 24V 35RD Motor Best speed
 166                     ; 243 	Drive.Interval = 11u;	//	for 24V 35RD Motor Best speed
 168                     ; 244 	Drive.Interval = 14u;	//	for 24V 35RD Motor Best speed
 170  0025 ae000e        	ldw	x,#14
 171  0028 bf7c          	ldw	_Drive+16,x
 172                     ; 245 	Drive.Stage = 0;		// Not Initialized
 174  002a 3f88          	clr	_Drive+28
 175                     ; 248 	Drive.ExcitationType = 1;		//12 excition
 177  002c 35010082      	mov	_Drive+22,#1
 178                     ; 267 	Drive.Prescaler = TIM2_PRESCALER_8;
 180  0030 35030099      	mov	_Drive+45,#3
 181                     ; 269 	TIM2_DeInit();	
 183  0034 cd0000        	call	_TIM2_DeInit
 185                     ; 270 	TIM2_TimeBaseInit( Drive.Prescaler, 0xffff );
 187  0037 aeffff        	ldw	x,#65535
 188  003a 89            	pushw	x
 189  003b b699          	ld	a,_Drive+45
 190  003d cd0000        	call	_TIM2_TimeBaseInit
 192  0040 85            	popw	x
 193                     ; 271 	TIM2_ITConfig( TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
 195  0041 ae0301        	ldw	x,#769
 196  0044 cd0000        	call	_TIM2_ITConfig
 198                     ; 272 	TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
 198                     ; 273                TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
 200  0047 4b00          	push	#0
 201  0049 4b0c          	push	#12
 202  004b 4b01          	push	#1
 203  004d 5f            	clrw	x
 204  004e cd0000        	call	_TIM2_ICInit
 206  0051 5b03          	addw	sp,#3
 207                     ; 274 	TIM2_Cmd(ENABLE);
 209  0053 a601          	ld	a,#1
 210  0055 cd0000        	call	_TIM2_Cmd
 212                     ; 276 	enableInterrupts();
 215  0058 9a            	rim	
 217                     ; 279 	Drive.PwmEdge = 0;
 220  0059 721b006c      	bres	_Drive,#5
 221                     ; 284 	StopDrive();
 223  005d cd0464        	call	_StopDrive
 225                     ; 289 	GPIO_WriteLow(_LED_PORT, _LED_PIN);		// Led on
 227  0060 4b04          	push	#4
 228  0062 ae5000        	ldw	x,#20480
 229  0065 cd0000        	call	_GPIO_WriteLow
 231  0068 84            	pop	a
 233  0069               L72:
 234                     ; 291 	while ( Ticks_1mS < PowerDelay_1mS )		// Delay Power ON
 236  0069 bea2          	ldw	x,_Ticks_1mS
 237  006b b314          	cpw	x,_PowerDelay_1mS
 238  006d 25fa          	jrult	L72
 239                     ; 294   GPIO_WriteHigh(_LED_PORT, _LED_PIN);		// Led off
 241  006f 4b04          	push	#4
 242  0071 ae5000        	ldw	x,#20480
 243  0074 cd0000        	call	_GPIO_WriteHigh
 245  0077 3d83          	tnz	_Drive+23
 246  0079 84            	pop	a
 247                     ; 310 	if ( Drive.Origin ) 
 249  007a 2716          	jreq	L33
 250                     ; 312 		Drive.Position = 0;
 252  007c 5f            	clrw	x
 253  007d bf6d          	ldw	_Drive+1,x
 254                     ; 313 		StartDriveOR( CPulse(200u), 0u  );				// Goto Zero position
 256  007f 4b00          	push	#0
 257  0081 ae00c8        	ldw	x,#200
 258  0084 cd06ea        	call	_CPulse
 260  0087 cd0489        	call	_StartDriveOR
 262  008a 84            	pop	a
 264  008b               L73:
 265                     ; 315 		while (Drive.Run)				// Wait while motor is running
 267  008b 7202006cfb    	btjt	_Drive,#1,L73
 269  0090 2008          	jra	L34
 270  0092               L33:
 271                     ; 320 		Drive.Position = CPulse(205u);
 273  0092 ae00cd        	ldw	x,#205
 274  0095 cd06ea        	call	_CPulse
 276  0098 bf6d          	ldw	_Drive+1,x
 277  009a               L34:
 278                     ; 327 	Timer.Led = Ticks_1mS;
 280  009a bea2          	ldw	x,_Ticks_1mS
 281  009c bf48          	ldw	_Timer,x
 282                     ; 328 	Timer.Motor = Ticks_1mS;
 284  009e bea2          	ldw	x,_Ticks_1mS
 285  00a0 bf4a          	ldw	_Timer+2,x
 286                     ; 329 	Timer.Adc = Ticks_1mS;
 288  00a2 bea2          	ldw	x,_Ticks_1mS
 289  00a4 bf4c          	ldw	_Timer+4,x
 290                     ; 332   ledint = 1000u;
 292  00a6 ae03e8        	ldw	x,#1000
 293  00a9 bf9a          	ldw	_ledint,x
 294  00ab               L54:
 295                     ; 336 		tt = Ticks_1mS;
 297  00ab bea2          	ldw	x,_Ticks_1mS
 298  00ad bfc2          	ldw	_tt,x
 299                     ; 338 		if ( Diff ( Timer.Led, ledint ) )
 301  00af be9a          	ldw	x,_ledint
 302  00b1 89            	pushw	x
 303  00b2 be48          	ldw	x,_Timer
 304  00b4 cd0298        	call	_Diff
 306  00b7 4d            	tnz	a
 307  00b8 85            	popw	x
 308  00b9 270d          	jreq	L15
 309                     ; 341 			Timer.Led = Ticks_1mS;
 311  00bb bea2          	ldw	x,_Ticks_1mS
 312  00bd bf48          	ldw	_Timer,x
 313                     ; 342 			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
 315  00bf 4b04          	push	#4
 316  00c1 ae5000        	ldw	x,#20480
 317  00c4 cd0000        	call	_GPIO_WriteReverse
 319  00c7 84            	pop	a
 320  00c8               L15:
 321                     ; 345 		AdcService();
 323  00c8 cd0236        	call	_AdcService
 325                     ; 348 		if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
 327  00cb b68d          	ld	a,_Drive+33
 328  00cd 2610          	jrne	L35
 330  00cf 7203006c0b    	btjf	_Drive,#1,L35
 331                     ; 350 			Drive.T1_1mS = Ticks_1mS;
 333  00d4 bea2          	ldw	x,_Ticks_1mS
 334  00d6 bf89          	ldw	_Drive+29,x
 335                     ; 351 			Drive.Run0 = Drive.Run;			
 337  00d8 b66c          	ld	a,_Drive
 338  00da a402          	and	a,#2
 339  00dc 44            	srl	a
 340  00dd b78d          	ld	_Drive+33,a
 341  00df               L35:
 342                     ; 354 		if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
 344  00df 4a            	dec	a
 345  00e0 2610          	jrne	L55
 347  00e2 7202006c0b    	btjt	_Drive,#1,L55
 348                     ; 356 			Drive.T2_1mS = Ticks_1mS;
 350  00e7 bea2          	ldw	x,_Ticks_1mS
 351  00e9 bf8b          	ldw	_Drive+31,x
 352                     ; 357 			Drive.Run0 = Drive.Run;			
 354  00eb b66c          	ld	a,_Drive
 355  00ed a402          	and	a,#2
 356  00ef 44            	srl	a
 357  00f0 b78d          	ld	_Drive+33,a
 358  00f2               L55:
 359                     ; 361 		if ( Drive.Stage == 0 )	//	Init
 361  00f2 b688          	ld	a,_Drive+28
 362  00f4 261e          	jrne	L75
 363                     ; 363 			if ( Drive.Run == 0 )
 365  00f6 7203006c03cc  	btjt	_Drive,#1,L721
 366                     ; 365 				if ( Drive.Origin == 1 )
 368  00fe b683          	ld	a,_Drive+23
 369  0100 4a            	dec	a
 370  0101 2607          	jrne	L36
 371                     ; 367 					Drive.Stage = 1;
 373  0103 35010088      	mov	_Drive+28,#1
 375  0107 cc01fa        	jra	L721
 376  010a               L36:
 377                     ; 371 					StartDriveOR( 0u, 0u  );				// Goto Zero position
 379  010a 4b00          	push	#0
 380  010c 5f            	clrw	x
 381  010d cd0489        	call	_StartDriveOR
 383  0110 84            	pop	a
 384  0111 cc01fa        	jra	L721
 385  0114               L75:
 386                     ; 376 		else if ( Drive.Stage == 1 )	// Running 
 388  0114 4a            	dec	a
 389  0115 26fa          	jrne	L721
 390                     ; 378 			if ( Diff ( Timer.Motor, 200u ) != 0 )
 392  0117 ae00c8        	ldw	x,#200
 393  011a 89            	pushw	x
 394  011b be4a          	ldw	x,_Timer+2
 395  011d cd0298        	call	_Diff
 397  0120 4d            	tnz	a
 398  0121 85            	popw	x
 399  0122 2603cc01f6    	jreq	L37
 400                     ; 381 				if ( Diff ( Timer.PwmUpdate, 2000u ) != 0 )
 402  0127 ae07d0        	ldw	x,#2000
 403  012a 89            	pushw	x
 404  012b be50          	ldw	x,_Timer+8
 405  012d cd0298        	call	_Diff
 407  0130 4d            	tnz	a
 408  0131 85            	popw	x
 409  0132 271a          	jreq	L57
 410                     ; 383 					Drive.Step = 0;
 412  0134 3f85          	clr	_Drive+25
 413                     ; 386 					if ( Ticks_1mS > 2000 )
 415  0136 bea2          	ldw	x,_Ticks_1mS
 416  0138 a307d1        	cpw	x,#2001
 417  013b 2507          	jrult	L77
 418                     ; 387 						Timer.PwmUpdate = Ticks_1mS-2000;
 420  013d bea2          	ldw	x,_Ticks_1mS
 421  013f 1d07d0        	subw	x,#2000
 423  0142 2005          	jp	LC001
 424  0144               L77:
 425                     ; 389 						Timer.PwmUpdate = 65535 - 2000 + Ticks_1mS;						
 427  0144 bea2          	ldw	x,_Ticks_1mS
 428  0146 1cf82f        	addw	x,#63535
 429  0149               LC001:
 430  0149 bf50          	ldw	_Timer+8,x
 431  014b cc01f0        	jra	L301
 432  014e               L57:
 433                     ; 394 					if ( nDuty < 8 )
 435  014e b602          	ld	a,_nDuty
 436  0150 a108          	cp	a,#8
 437  0152 2402          	jruge	L501
 438                     ; 395 						nDuty ++;
 440  0154 3c02          	inc	_nDuty
 441  0156               L501:
 442                     ; 397 					if (iDuty < 7)
 444  0156 b6ac          	ld	a,_iDuty
 445  0158 a107          	cp	a,#7
 446  015a 2404          	jruge	L701
 447                     ; 399 						iDuty++;
 449  015c 3cac          	inc	_iDuty
 451  015e 2002          	jra	L111
 452  0160               L701:
 453                     ; 403 						iDuty = 0;
 455  0160 3fac          	clr	_iDuty
 456  0162               L111:
 457                     ; 406 					sDuty -= Duty[iDuty];
 459  0162 b6ac          	ld	a,_iDuty
 460  0164 5f            	clrw	x
 461  0165 97            	ld	xl,a
 462  0166 e6ad          	ld	a,(_Duty,x)
 463  0168 5f            	clrw	x
 464  0169 97            	ld	xl,a
 465  016a 72b000aa      	subw	x,_sDuty
 466  016e 50            	negw	x
 467  016f bfaa          	ldw	_sDuty,x
 468                     ; 407 					Duty[iDuty] = Drive.PwmDuty;
 470  0171 5f            	clrw	x
 471  0172 b6ac          	ld	a,_iDuty
 472  0174 97            	ld	xl,a
 473  0175 b693          	ld	a,_Drive+39
 474  0177 e7ad          	ld	(_Duty,x),a
 475                     ; 408 					sDuty += Duty[iDuty]; //Drive.Step; 
 477  0179 5f            	clrw	x
 478  017a b6ac          	ld	a,_iDuty
 479  017c 97            	ld	xl,a
 480  017d e6ad          	ld	a,(_Duty,x)
 481  017f bbab          	add	a,_sDuty+1
 482  0181 b7ab          	ld	_sDuty+1,a
 483  0183 2402          	jrnc	L06
 484  0185 3caa          	inc	_sDuty
 485  0187               L06:
 486                     ; 411 					mDuty = (sDuty / nDuty)*2 + 1;
 488  0187 beaa          	ldw	x,_sDuty
 489  0189 b602          	ld	a,_nDuty
 490  018b 62            	div	x,a
 491  018c 58            	sllw	x
 492  018d 5c            	incw	x
 493  018e bfa8          	ldw	_mDuty,x
 494                     ; 412 					mDuty /= 2;
 496  0190 34a8          	srl	_mDuty
 497  0192 36a9          	rrc	_mDuty+1
 498                     ; 416 					if (mDuty <20)
 500  0194 bea8          	ldw	x,_mDuty
 501  0196 a30014        	cpw	x,#20
 502  0199 2405          	jruge	L311
 503                     ; 417 					   mDuty = 20;
 505  019b ae0014        	ldw	x,#20
 506  019e bfa8          	ldw	_mDuty,x
 507  01a0               L311:
 508                     ; 418 					if (mDuty >180)
 510  01a0 a300b5        	cpw	x,#181
 511  01a3 2505          	jrult	L511
 512                     ; 419 					  mDuty = 180; 
 514  01a5 ae00b4        	ldw	x,#180
 515  01a8 bfa8          	ldw	_mDuty,x
 516  01aa               L511:
 517                     ; 421 					disableInterrupts();
 520  01aa 9b            	sim	
 522                     ; 422 					mVal  =  (625u * (u32)mDuty);
 525  01ab 90ae0271      	ldw	y,#625
 526  01af cd0000        	call	c_umul
 528  01b2 ae0003        	ldw	x,#_mVal
 529  01b5 cd0000        	call	c_rtol
 531                     ; 423 					mVal /= (10u);
 533  01b8 cd0000        	call	c_ltor
 535  01bb ae0000        	ldw	x,#L26
 536  01be ad4a          	call	LC002
 538                     ; 424 					mVal -= 1250u ;
 540  01c0 ae04e2        	ldw	x,#1250
 541  01c3 bf02          	ldw	c_lreg+2,x
 542  01c5 5f            	clrw	x
 543  01c6 bf00          	ldw	c_lreg,x
 544  01c8 ae0003        	ldw	x,#_mVal
 545  01cb cd0000        	call	c_lgsub
 547                     ; 425 					mVal = mVal /(u32)50u;
 549  01ce cd0000        	call	c_ltor
 551  01d1 ae0004        	ldw	x,#L46
 552  01d4 ad34          	call	LC002
 554                     ; 426 					mVal += 1u;
 556  01d6 a601          	ld	a,#1
 557  01d8 cd0000        	call	c_lgadc
 559                     ; 427 					mVal /= 2u;
 561  01db 3403          	srl	_mVal
 562  01dd 3604          	rrc	_mVal+1
 563  01df 3605          	rrc	_mVal+2
 564  01e1 3606          	rrc	_mVal+3
 565                     ; 428 					enableInterrupts();
 568  01e3 9a            	rim	
 570                     ; 430 					Drive.Step = (u8)mVal*2;
 573  01e4 b606          	ld	a,_mVal+3
 574  01e6 48            	sll	a
 575  01e7 b785          	ld	_Drive+25,a
 576                     ; 432 					if ( Drive.Step < min )
 578  01e9 b116          	cp	a,_min
 579  01eb 2403          	jruge	L301
 580                     ; 433 						min = Drive.Step;
 582  01ed 458516        	mov	_min,_Drive+25
 583  01f0               L301:
 584                     ; 436 				MotorService();
 586  01f0 ad21          	call	_MotorService
 588                     ; 437 				Timer.Motor = Ticks_1mS;				
 590  01f2 bea2          	ldw	x,_Ticks_1mS
 591  01f4 bf4a          	ldw	_Timer+2,x
 592  01f6               L37:
 593                     ; 439 			if ( Drive.Run == 1 )
 595  01f6 b66c          	ld	a,_Drive
 596  01f8 a502          	bcp	a,#2
 598  01fa               L721:
 599                     ; 451 		while ( Diff ( tt, 50u ) == 0 )
 601  01fa ae0032        	ldw	x,#50
 602  01fd 89            	pushw	x
 603  01fe bec2          	ldw	x,_tt
 604  0200 cd0298        	call	_Diff
 606  0203 4d            	tnz	a
 607  0204 85            	popw	x
 608  0205 27f3          	jreq	L721
 610  0207 cc00ab        	jra	L54
 611  020a               LC002:
 612  020a cd0000        	call	c_ludv
 614  020d ae0003        	ldw	x,#_mVal
 615  0210 cc0000        	jp	c_rtol
 643                     ; 458 void MotorService()
 643                     ; 459 {
 644                     	switch	.text
 645  0213               _MotorService:
 649                     ; 465 			if ( Drive.Step > 210u )
 651  0213 b685          	ld	a,_Drive+25
 652  0215 a1d3          	cp	a,#211
 653  0217 2504          	jrult	L341
 654                     ; 466 				Drive.Step = 210u;
 656  0219 a6d2          	ld	a,#210
 657  021b b785          	ld	_Drive+25,a
 658  021d               L341:
 659                     ; 467 			if ( Drive.Step < 20u )
 661  021d a114          	cp	a,#20
 662  021f 2403          	jruge	L541
 663                     ; 468 				Drive.Step = 0u;
 665  0221 4f            	clr	a
 666  0222 b785          	ld	_Drive+25,a
 667  0224               L541:
 668                     ; 478 				if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
 670                     ; 482 						Drive.PreStep = Drive.Step;
 671                     ; 483 						StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 675                     ; 495 					Drive.PreStep = Drive.Step;
 677                     ; 496 					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );					
 682  0224 b786          	ld	_Drive+26,a
 684  0226 4b00          	push	#0
 685  0228 5f            	clrw	x
 686  0229 97            	ld	xl,a
 687  022a cd06ea        	call	_CPulse
 688  022d cd0489        	call	_StartDriveOR
 689  0230 bea2          	ldw	x,_Ticks_1mS
 690  0232 bf4a          	ldw	_Timer+2,x
 691  0234 84            	pop	a
 692                     ; 500 			Timer.Motor = Ticks_1mS;
 694                     ; 502 	}
 697  0235 81            	ret	
 724                     ; 505 void AdcService()
 724                     ; 506 {
 725                     	switch	.text
 726  0236               _AdcService:
 730                     ; 507 	if ( Diff ( Timer.Adc, 10u )== 1 )
 732  0236 ae000a        	ldw	x,#10
 733  0239 89            	pushw	x
 734  023a be4c          	ldw	x,_Timer+4
 735  023c ad5a          	call	_Diff
 737  023e 4a            	dec	a
 738  023f 85            	popw	x
 739  0240 2643          	jrne	L361
 740                     ; 509 			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
 742  0242 b65c          	ld	a,_Adc+10
 743  0244 5f            	clrw	x
 744  0245 97            	ld	xl,a
 745  0246 e659          	ld	a,(_Adc+7,x)
 746  0248 5f            	clrw	x
 747  0249 97            	ld	xl,a
 748  024a 72b0005e      	subw	x,_Adc+12
 749  024e 50            	negw	x
 750  024f bf5e          	ldw	_Adc+12,x
 751                     ; 510 			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
 753  0251 be52          	ldw	x,_Adc
 754  0253 54            	srlw	x
 755  0254 54            	srlw	x
 756  0255 b65c          	ld	a,_Adc+10
 757  0257 905f          	clrw	y
 758  0259 9097          	ld	yl,a
 759  025b 01            	rrwa	x,a
 760  025c 90e759        	ld	(_Adc+7,y),a
 761                     ; 511 			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
 763  025f 5f            	clrw	x
 764  0260 b65c          	ld	a,_Adc+10
 765  0262 97            	ld	xl,a
 766  0263 e659          	ld	a,(_Adc+7,x)
 767  0265 bb5f          	add	a,_Adc+13
 768  0267 b75f          	ld	_Adc+13,a
 769  0269 2402          	jrnc	L011
 770  026b 3c5e          	inc	_Adc+12
 771  026d               L011:
 772                     ; 512 			Adc.Average = Adc.Sum /5;
 774  026d be5e          	ldw	x,_Adc+12
 775  026f a605          	ld	a,#5
 776  0271 62            	div	x,a
 777  0272 01            	rrwa	x,a
 778  0273 b75d          	ld	_Adc+11,a
 779                     ; 513 			if  (Adc.IdxAvg	>= 4 )
 781  0275 b65c          	ld	a,_Adc+10
 782  0277 a104          	cp	a,#4
 783  0279 2504          	jrult	L561
 784                     ; 514 				Adc.IdxAvg = 0;
 786  027b 3f5c          	clr	_Adc+10
 788  027d 2002          	jra	L761
 789  027f               L561:
 790                     ; 516 				Adc.IdxAvg++;
 792  027f 3c5c          	inc	_Adc+10
 793  0281               L761:
 794                     ; 518 			Timer.Adc = Ticks_1mS;
 796  0281 bea2          	ldw	x,_Ticks_1mS
 797  0283 bf4c          	ldw	_Timer+4,x
 798  0285               L361:
 799                     ; 520 }
 802  0285 81            	ret	
 845                     ; 527 u8 SAbs(u8 s1, u8 s2)
 845                     ; 528 {
 846                     	switch	.text
 847  0286               _SAbs:
 849  0286 89            	pushw	x
 850       00000000      OFST:	set	0
 853                     ; 529 	if (s1 > s2 )
 855  0287 9f            	ld	a,xl
 856  0288 1101          	cp	a,(OFST+1,sp)
 857  028a 2406          	jruge	L312
 858                     ; 530 		return s1 - s2;
 860  028c 9f            	ld	a,xl
 861  028d 1001          	sub	a,(OFST+1,sp)
 862  028f 40            	neg	a
 864  0290 2004          	jra	L411
 865  0292               L312:
 866                     ; 532 		return s2 - s1;
 868  0292 7b02          	ld	a,(OFST+2,sp)
 869  0294 1001          	sub	a,(OFST+1,sp)
 871  0296               L411:
 873  0296 85            	popw	x
 874  0297 81            	ret	
 928                     ; 536 u8  Diff( u16 time, u16 diff )
 928                     ; 537 {
 929                     	switch	.text
 930  0298               _Diff:
 932  0298 89            	pushw	x
 933  0299 520e          	subw	sp,#14
 934       0000000e      OFST:	set	14
 937                     ; 539 	t0 = Ticks_1mS;
 939  029b bea2          	ldw	x,_Ticks_1mS
 940  029d 1f0d          	ldw	(OFST-1,sp),x
 942                     ; 541 	if (time <= t0 )
 944  029f 1e0f          	ldw	x,(OFST+1,sp)
 945  02a1 130d          	cpw	x,(OFST-1,sp)
 946  02a3 2214          	jrugt	L542
 947                     ; 543 		Dif = t0 - time;
 949  02a5 1e0d          	ldw	x,(OFST-1,sp)
 950  02a7 72f00f        	subw	x,(OFST+1,sp)
 951  02aa bfbd          	ldw	_Dif,x
 952                     ; 544 		if ( ( t0 - time ) > diff ) 
 954  02ac 1e0d          	ldw	x,(OFST-1,sp)
 955  02ae 72f00f        	subw	x,(OFST+1,sp)
 956  02b1 1313          	cpw	x,(OFST+5,sp)
 957                     ; 546 			return 1u;
 959  02b3 2252          	jrugt	LC004
 960  02b5               L742:
 961                     ; 550 			return 0u;
 964  02b5 4f            	clr	a
 966  02b6               L021:
 968  02b6 5b10          	addw	sp,#16
 969  02b8 81            	ret	
 970  02b9               L542:
 971                     ; 556 	if (time > t0 )
 973  02b9 130d          	cpw	x,(OFST-1,sp)
 974  02bb 23f9          	jrule	L021
 975                     ; 558 		Dif = 65535 - time + t0;
 977  02bd aeffff        	ldw	x,#65535
 978  02c0 72f00f        	subw	x,(OFST+1,sp)
 979  02c3 72fb0d        	addw	x,(OFST-1,sp)
 980  02c6 bfbd          	ldw	_Dif,x
 981                     ; 559 		if ( ( 65535 - time + t0  ) > diff ) 
 983  02c8 1e0d          	ldw	x,(OFST-1,sp)
 984  02ca cd0000        	call	c_uitolx
 986  02cd 96            	ldw	x,sp
 987  02ce 1c0009        	addw	x,#OFST-5
 988  02d1 cd0000        	call	c_rtol
 991  02d4 1e0f          	ldw	x,(OFST+1,sp)
 992  02d6 cd0000        	call	c_uitolx
 994  02d9 96            	ldw	x,sp
 995  02da 1c0005        	addw	x,#OFST-9
 996  02dd cd0000        	call	c_rtol
 999  02e0 aeffff        	ldw	x,#65535
1000  02e3 bf02          	ldw	c_lreg+2,x
1001  02e5 5f            	clrw	x
1002  02e6 bf00          	ldw	c_lreg,x
1003  02e8 96            	ldw	x,sp
1004  02e9 1c0005        	addw	x,#OFST-9
1005  02ec cd0000        	call	c_lsub
1007  02ef 96            	ldw	x,sp
1008  02f0 1c0009        	addw	x,#OFST-5
1009  02f3 cd0000        	call	c_ladd
1011  02f6 96            	ldw	x,sp
1012  02f7 5c            	incw	x
1013  02f8 cd0000        	call	c_rtol
1016  02fb 1e13          	ldw	x,(OFST+5,sp)
1017  02fd cd0000        	call	c_uitolx
1019  0300 96            	ldw	x,sp
1020  0301 5c            	incw	x
1021  0302 cd0000        	call	c_lcmp
1023  0305 2eae          	jrsge	L742
1024                     ; 561 			return 1u;
1026  0307               LC004:
1028  0307 a601          	ld	a,#1
1030  0309 20ab          	jra	L021
1031                     ; 565 			return 0u;
1033                     ; 568 }
1057                     ; 571 OnTimer_1S(void)
1057                     ; 572 {
1058                     	switch	.text
1059  030b               _OnTimer_1S:
1063                     ; 574 }
1066  030b 81            	ret	
1092                     ; 583 OnTimer_1mS(void)
1092                     ; 584 { 
1093                     	switch	.text
1094  030c               _OnTimer_1mS:
1098                     ; 586 	Ticks_1mS++;
1100  030c bea2          	ldw	x,_Ticks_1mS
1101  030e 5c            	incw	x
1102  030f bfa2          	ldw	_Ticks_1mS,x
1103                     ; 588 	Adc_Config( );
1105  0311 cd07d9        	call	L3_Adc_Config
1107                     ; 590 	if ( PowerDelay_1mS )
1109  0314 be14          	ldw	x,_PowerDelay_1mS
1110  0316 2703          	jreq	L103
1111                     ; 591 		PowerDelay_1mS--;
1113  0318 5a            	decw	x
1114  0319 bf14          	ldw	_PowerDelay_1mS,x
1115  031b               L103:
1116                     ; 592 }
1119  031b 81            	ret	
1148                     	switch	.const
1149  0008               L241:
1150  0008 00000013      	dc.l	19
1151                     ; 595 void OnTimer4(void)
1151                     ; 596 {
1152                     	switch	.text
1153  031c               _OnTimer4:
1157                     ; 597 	Adc_Config(  );
1159  031c cd07d9        	call	L3_Adc_Config
1161                     ; 598 	Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
1163  031f 4b10          	push	#16
1164  0321 ae5005        	ldw	x,#20485
1165  0324 cd0000        	call	_GPIO_ReadInputPin
1167  0327 5b01          	addw	sp,#1
1168  0329 4d            	tnz	a
1169  032a 2603          	jrne	L431
1170  032c 4c            	inc	a
1171  032d 2001          	jra	L041
1172  032f               L431:
1173  032f 4f            	clr	a
1174  0330               L041:
1175  0330 b783          	ld	_Drive+23,a
1176                     ; 600 	if (  Ticks_50uS < 19 )
1178  0332 ae00a4        	ldw	x,#_Ticks_50uS
1179  0335 cd0000        	call	c_ltor
1181  0338 ae0008        	ldw	x,#L241
1182  033b cd0000        	call	c_lcmp
1184  033e 240a          	jruge	L313
1185                     ; 601 		Ticks_50uS++;
1187  0340 ae00a4        	ldw	x,#_Ticks_50uS
1188  0343 a601          	ld	a,#1
1189  0345 cd0000        	call	c_lgadc
1192  0348 2007          	jra	L513
1193  034a               L313:
1194                     ; 604 		Ticks_50uS = 0;
1196  034a 5f            	clrw	x
1197  034b bfa6          	ldw	_Ticks_50uS+2,x
1198  034d bfa4          	ldw	_Ticks_50uS,x
1199                     ; 605 		OnTimer_1mS();
1201  034f adbb          	call	_OnTimer_1mS
1203  0351               L513:
1204                     ; 609 	if ( Drive.Ticks > 0 )
1206  0351 be7e          	ldw	x,_Drive+18
1207  0353 2703          	jreq	L713
1208                     ; 610 		Drive.Ticks--;
1210  0355 5a            	decw	x
1211  0356 bf7e          	ldw	_Drive+18,x
1212  0358               L713:
1213                     ; 612 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
1215  0358 7201006c0b    	btjf	_Drive,#0,L123
1217  035d be7e          	ldw	x,_Drive+18
1218  035f 2607          	jrne	L123
1219                     ; 614 		DriveService();	
1221  0361 cd0594        	call	_DriveService
1223                     ; 615 		Drive.Ticks = Drive.Interval;
1225  0364 be7c          	ldw	x,_Drive+16
1226  0366 bf7e          	ldw	_Drive+18,x
1227  0368               L123:
1228                     ; 617 }
1231  0368 81            	ret	
1257                     ; 619 void OnCaptureOVTim2(void)
1257                     ; 620 {
1258                     	switch	.text
1259  0369               _OnCaptureOVTim2:
1263                     ; 621 	if ( TIM2_GetITStatus( TIM2_IT_UPDATE)  != SET ) 
1265  0369 a601          	ld	a,#1
1266  036b cd0000        	call	_TIM2_GetITStatus
1268  036e 4a            	dec	a
1269  036f 2701          	jreq	L333
1270                     ; 622 		return;
1273  0371 81            	ret	
1274  0372               L333:
1275                     ; 624 	Drive.PwmOF++;
1277  0372 3c98          	inc	_Drive+44
1278                     ; 626 	TIM2_ClearITPendingBit(TIM1_IT_UPDATE);
1280  0374 4c            	inc	a
1282                     ; 627 }
1285  0375 cc0000        	jp	_TIM2_ClearITPendingBit
1315                     ; 647 void OnCaptureTim2(void)
1315                     ; 648 {
1316                     	switch	.text
1317  0378               _OnCaptureTim2:
1319  0378 5204          	subw	sp,#4
1320       00000004      OFST:	set	4
1323                     ; 649 	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
1325  037a a602          	ld	a,#2
1326  037c cd0000        	call	_TIM2_GetITStatus
1328  037f 4a            	dec	a
1329  0380 2703cc0461    	jrne	L373
1330                     ; 650 		return;
1332                     ; 652 	if ( Drive.PwmEdge == 0 ) 
1334  0385 720b006c03cc  	btjt	_Drive,#5,L743
1335                     ; 654 		Drive.PwmT2 = TIM2_GetCapture1();
1337  038d cd0000        	call	_TIM2_GetCapture1
1339  0390 bf90          	ldw	_Drive+36,x
1340                     ; 655 		TIM2_ClearITPendingBit(TIM1_IT_CC1);
1342  0392 a602          	ld	a,#2
1343  0394 cd0000        	call	_TIM2_ClearITPendingBit
1345                     ; 656 		Drive.PwmEdge = 1;
1347  0397 721a006c      	bset	_Drive,#5
1348                     ; 658 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
1348                     ; 659                TIM2_ICPSC_DIV8, 0x0) ;
1350  039b 4b00          	push	#0
1351  039d 4b0c          	push	#12
1352  039f 4b01          	push	#1
1353  03a1 ae0044        	ldw	x,#68
1354  03a4 cd0000        	call	_TIM2_ICInit
1356  03a7 5b03          	addw	sp,#3
1357                     ; 661 		if ( Drive.PwmT2 > Drive.PwmT1 ) 
1359  03a9 be90          	ldw	x,_Drive+36
1360  03ab b38e          	cpw	x,_Drive+34
1361  03ad 2311          	jrule	L153
1362                     ; 663 			if ( Drive.PwmOF == 0 )
1364  03af b698          	ld	a,_Drive+44
1365  03b1 2606          	jrne	L353
1366                     ; 665 				Drive.PwmT4 = Drive.PwmT2 - Drive.PwmT1;
1368  03b3 72b0008e      	subw	x,_Drive+34
1370  03b7 2003          	jp	LC005
1371  03b9               L353:
1372                     ; 669 				Drive.PwmT4 = 0xffff;
1374  03b9 aeffff        	ldw	x,#65535
1375  03bc               LC005:
1376  03bc bf96          	ldw	_Drive+42,x
1377  03be 2019          	jra	L753
1378  03c0               L153:
1379                     ; 675 			if ( Drive.PwmOF == 1 )
1381  03c0 b698          	ld	a,_Drive+44
1382  03c2 4a            	dec	a
1383  03c3 260d          	jrne	L163
1384                     ; 677 				Drive.PwmT4 = 0xffff - Drive.PwmT1 + Drive.PwmT2;
1386  03c5 aeffff        	ldw	x,#65535
1387  03c8 72b0008e      	subw	x,_Drive+34
1388  03cc 72bb0090      	addw	x,_Drive+36
1390  03d0 2003          	jra	L363
1391  03d2               L163:
1392                     ; 681 				Drive.PwmT4 = 0xffff;
1394  03d2 aeffff        	ldw	x,#65535
1395  03d5               L363:
1396  03d5 bf96          	ldw	_Drive+42,x
1397                     ; 683 			Drive.PwmOF = 0;
1399  03d7 3f98          	clr	_Drive+44
1400  03d9               L753:
1401                     ; 689 		if ( Drive.PwmT3 == 0xffff || Drive.PwmT4 == 0xffff )
1403  03d9 be94          	ldw	x,_Drive+40
1404  03db 5c            	incw	x
1405  03dc 2705          	jreq	L763
1407  03de be96          	ldw	x,_Drive+42
1408  03e0 5c            	incw	x
1409  03e1 2609          	jrne	L563
1410  03e3               L763:
1411                     ; 691 			Drive.PwmDuty = 0u;
1413  03e3 5f            	clrw	x
1414  03e4 bf92          	ldw	_Drive+38,x
1416  03e6               L173:
1417                     ; 699 		Timer.PwmUpdate = Ticks_1mS;		
1419  03e6 bea2          	ldw	x,_Ticks_1mS
1420  03e8 bf50          	ldw	_Timer+8,x
1422  03ea 2075          	jra	L373
1423  03ec               L563:
1424                     ; 695 			Drive.PwmDuty = ( Drive.PwmT3 * (uint32_t)400 / ( Drive.PwmT3 + Drive.PwmT4 ) ) + 1 ;
1426  03ec be94          	ldw	x,_Drive+40
1427  03ee 72bb0096      	addw	x,_Drive+42
1428  03f2 cd0000        	call	c_uitolx
1430  03f5 96            	ldw	x,sp
1431  03f6 5c            	incw	x
1432  03f7 cd0000        	call	c_rtol
1435  03fa be94          	ldw	x,_Drive+40
1436  03fc 90ae0190      	ldw	y,#400
1437  0400 cd0000        	call	c_umul
1439  0403 96            	ldw	x,sp
1440  0404 5c            	incw	x
1441  0405 cd0000        	call	c_ludv
1443  0408 a601          	ld	a,#1
1444  040a cd0000        	call	c_ladc
1446  040d be02          	ldw	x,c_lreg+2
1447  040f bf92          	ldw	_Drive+38,x
1448                     ; 696 			Drive.PwmDuty /= 2;
1450  0411 3492          	srl	_Drive+38
1451  0413 3693          	rrc	_Drive+39
1452  0415 20cf          	jra	L173
1453  0417               L743:
1454                     ; 703 		Drive.PwmT1 = TIM2_GetCapture1();
1456  0417 cd0000        	call	_TIM2_GetCapture1
1458  041a bf8e          	ldw	_Drive+34,x
1459                     ; 704 		TIM2_ClearITPendingBit(TIM1_IT_CC1);
1461  041c a602          	ld	a,#2
1462  041e cd0000        	call	_TIM2_ClearITPendingBit
1464                     ; 705 		Drive.PwmEdge = 0;	
1466  0421 721b006c      	bres	_Drive,#5
1467                     ; 707 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
1467                     ; 708                TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
1469  0425 4b00          	push	#0
1470  0427 4b0c          	push	#12
1471  0429 4b01          	push	#1
1472  042b 5f            	clrw	x
1473  042c cd0000        	call	_TIM2_ICInit
1475  042f 5b03          	addw	sp,#3
1476                     ; 710 		if ( Drive.PwmT1 > Drive.PwmT2 ) 
1478  0431 be8e          	ldw	x,_Drive+34
1479  0433 b390          	cpw	x,_Drive+36
1480  0435 2311          	jrule	L573
1481                     ; 712 			if ( Drive.PwmOF == 0 )
1483  0437 b698          	ld	a,_Drive+44
1484  0439 2606          	jrne	L773
1485                     ; 714 				Drive.PwmT3 = Drive.PwmT1 - Drive.PwmT2;
1487  043b 72b00090      	subw	x,_Drive+36
1489  043f 2003          	jp	LC006
1490  0441               L773:
1491                     ; 718 				Drive.PwmT3 = 0xffff;
1493  0441 aeffff        	ldw	x,#65535
1494  0444               LC006:
1495  0444 bf94          	ldw	_Drive+40,x
1496  0446 2019          	jra	L373
1497  0448               L573:
1498                     ; 724 			if ( Drive.PwmOF == 1 )
1500  0448 b698          	ld	a,_Drive+44
1501  044a 4a            	dec	a
1502  044b 260d          	jrne	L504
1503                     ; 726 				Drive.PwmT3 = 0xffff - Drive.PwmT2 + Drive.PwmT1;
1505  044d aeffff        	ldw	x,#65535
1506  0450 72b00090      	subw	x,_Drive+36
1507  0454 72bb008e      	addw	x,_Drive+34
1509  0458 2003          	jra	L704
1510  045a               L504:
1511                     ; 730 				Drive.PwmT3 = 0xffff;
1513  045a aeffff        	ldw	x,#65535
1514  045d               L704:
1515  045d bf94          	ldw	_Drive+40,x
1516                     ; 732 			Drive.PwmOF = 0;
1518  045f 3f98          	clr	_Drive+44
1519  0461               L373:
1520                     ; 739 }
1523  0461 5b04          	addw	sp,#4
1524  0463 81            	ret	
1548                     ; 751 void StopDrive(void)			//TROff()
1548                     ; 752 {
1549                     	switch	.text
1550  0464               _StopDrive:
1554                     ; 754 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1556  0464 4b40          	push	#64
1557  0466 ae500a        	ldw	x,#20490
1558  0469 cd0000        	call	_GPIO_WriteLow
1560  046c 84            	pop	a
1561                     ; 755 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1563  046d 4b08          	push	#8
1564  046f ae500a        	ldw	x,#20490
1565  0472 cd0000        	call	_GPIO_WriteLow
1567  0475 84            	pop	a
1568                     ; 756 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1570  0476 4b80          	push	#128
1571  0478 ae500a        	ldw	x,#20490
1572  047b cd0000        	call	_GPIO_WriteLow
1574  047e 84            	pop	a
1575                     ; 757 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
1577  047f 4b08          	push	#8
1578  0481 ae5000        	ldw	x,#20480
1579  0484 cd0000        	call	_GPIO_WriteLow
1581  0487 84            	pop	a
1582                     ; 758 }
1585  0488 81            	ret	
1632                     ; 764 void StartDriveOR( uint16_t Target, uint8_t overrun )
1632                     ; 765 {
1633                     	switch	.text
1634  0489               _StartDriveOR:
1636  0489 89            	pushw	x
1637       00000000      OFST:	set	0
1640                     ; 773 	if ( Drive.Run ) return;
1642  048a 7202006c06    	btjt	_Drive,#1,L022
1645                     ; 774 	if ( Drive.Position == Target ) return;
1647  048f be6d          	ldw	x,_Drive+1
1648  0491 1301          	cpw	x,(OFST+1,sp)
1649  0493 2602          	jrne	L544
1651  0495               L022:
1654  0495 85            	popw	x
1655  0496 81            	ret	
1656  0497               L544:
1657                     ; 776 	mStep[iStep]=Target;//Drive.Step;
1659  0497 b607          	ld	a,_iStep
1660  0499 5f            	clrw	x
1661  049a 97            	ld	xl,a
1662  049b 58            	sllw	x
1663  049c 1601          	ldw	y,(OFST+1,sp)
1664  049e ef08          	ldw	(_mStep,x),y
1665                     ; 778 	if (iStep<31)
1667  04a0 a11f          	cp	a,#31
1668  04a2 2404          	jruge	L744
1669                     ; 779 	  iStep ++;
1671  04a4 3c07          	inc	_iStep
1673  04a6 2002          	jra	L154
1674  04a8               L744:
1675                     ; 781 		iStep = 0;	
1677  04a8 3f07          	clr	_iStep
1678  04aa               L154:
1679                     ; 784 	if ( Target == 0 )				//  goto origin
1681  04aa 1e01          	ldw	x,(OFST+1,sp)
1682  04ac 2616          	jrne	L354
1683                     ; 786 		Drive.Overrun =	0u;
1685  04ae 5f            	clrw	x
1686  04af bf71          	ldw	_Drive+5,x
1687                     ; 787 		Drive.ZeroOffset = CPulse( OVER_STEP );
1689  04b1 ae001e        	ldw	x,#30
1690  04b4 cd06ea        	call	_CPulse
1692  04b7 bf74          	ldw	_Drive+8,x
1693                     ; 789 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
1695  04b9 be6d          	ldw	x,_Drive+1
1696  04bb 72bb0074      	addw	x,_Drive+8
1697  04bf bf6d          	ldw	_Drive+1,x
1698                     ; 790 		Drive.Target = 0u;
1700  04c1 5f            	clrw	x
1701                     ; 791 		Drive.State = nMotorClose;		// 0;
1703  04c2 200f          	jp	LC007
1704  04c4               L354:
1705                     ; 798 		if (Drive.Position >= Target)		// Closing
1707  04c4 be6d          	ldw	x,_Drive+1
1708  04c6 1301          	cpw	x,(OFST+1,sp)
1709  04c8 250f          	jrult	L754
1710                     ; 800 			Drive.Overrun =	0u;
1712  04ca 5f            	clrw	x
1713  04cb bf71          	ldw	_Drive+5,x
1714                     ; 801 			Drive.State = nMotorClose;
1716  04cd 3f7b          	clr	_Drive+15
1717                     ; 802 			Drive.Overrun2 = 0u;
1719  04cf 3f73          	clr	_Drive+7
1720                     ; 803 			Drive.Target = Target;
1722  04d1 1e01          	ldw	x,(OFST+1,sp)
1723                     ; 804 			Drive.State = nMotorClose;		// 0;
1725  04d3               LC007:
1726  04d3 bf6f          	ldw	_Drive+3,x
1728  04d5 3f7b          	clr	_Drive+15
1730  04d7 2017          	jra	L554
1731  04d9               L754:
1732                     ; 808 			Drive.State = nMotorOpen;	//1;
1734  04d9 3501007b      	mov	_Drive+15,#1
1735                     ; 817 				Drive.Overrun2 = overrun;		//100;
1737  04dd 7b05          	ld	a,(OFST+5,sp)
1738  04df b773          	ld	_Drive+7,a
1739                     ; 818 				Drive.Target = Target + overrun;	//100;	
1741  04e1 7b01          	ld	a,(OFST+1,sp)
1742  04e3 97            	ld	xl,a
1743  04e4 7b02          	ld	a,(OFST+2,sp)
1744  04e6 1b05          	add	a,(OFST+5,sp)
1745  04e8 2401          	jrnc	L612
1746  04ea 5c            	incw	x
1747  04eb               L612:
1748  04eb b770          	ld	_Drive+4,a
1749  04ed 9f            	ld	a,xl
1750  04ee b76f          	ld	_Drive+3,a
1751  04f0               L554:
1752                     ; 823 	Drive.Run = TRUE;
1754  04f0 7212006c      	bset	_Drive,#1
1755                     ; 824 	Drive.Ticks = Drive.Interval;
1757  04f4 be7c          	ldw	x,_Drive+16
1758  04f6 bf7e          	ldw	_Drive+18,x
1759                     ; 825 }
1761  04f8 209b          	jra	L022
1821                     ; 831 void MotorStep(MOTOR_DIR Dir)
1821                     ; 832 {
1822                     	switch	.text
1823  04fa               _MotorStep:
1827                     ; 833 	if ( Dir == nMotorClose )
1829  04fa 4d            	tnz	a
1830  04fb 2627          	jrne	L715
1831                     ; 835 		if ( Drive.Position != 0 ) 
1833  04fd be6d          	ldw	x,_Drive+1
1834  04ff 270d          	jreq	L125
1835                     ; 837 			Drive.Position--;
1837  0501 5a            	decw	x
1838  0502 bf6d          	ldw	_Drive+1,x
1839                     ; 838 			if ( Drive.NormalOpen )
1841  0504 b684          	ld	a,_Drive+24
1842  0506 2704          	jreq	L325
1843                     ; 839 				Drive.Phase++;   // NC
1845  0508 3c76          	inc	_Drive+10
1847  050a 2002          	jra	L125
1848  050c               L325:
1849                     ; 842 				Drive.Phase--;	//NC
1851  050c 3a76          	dec	_Drive+10
1852  050e               L125:
1853                     ; 846 		if ( Drive.Position == 0 ) 
1855  050e be6d          	ldw	x,_Drive+1
1856  0510 2643          	jrne	L135
1857                     ; 849 			Drive.Overrun = 0u;
1859  0512 5f            	clrw	x
1860  0513 bf71          	ldw	_Drive+5,x
1861                     ; 850 			Drive.Run = FALSE;
1863  0515 7213006c      	bres	_Drive,#1
1864                     ; 851 			Drive.ZeroOffset = 0u;
1866  0519 bf74          	ldw	_Drive+8,x
1867                     ; 852 			Drive.Position = 0u;
1869  051b bf6d          	ldw	_Drive+1,x
1870                     ; 853 			Drive.Target = 0u;
1872  051d bf6f          	ldw	_Drive+3,x
1873                     ; 854 			StopDrive();	
1875  051f cd0464        	call	_StopDrive
1877  0522 2031          	jra	L135
1878  0524               L715:
1879                     ; 860 			Drive.Position++;
1881  0524 be6d          	ldw	x,_Drive+1
1882  0526 5c            	incw	x
1883  0527 bf6d          	ldw	_Drive+1,x
1884                     ; 862 		if ( Drive.NormalOpen )
1886  0529 b684          	ld	a,_Drive+24
1887  052b 2704          	jreq	L335
1888                     ; 863 				Drive.Phase--;
1890  052d 3a76          	dec	_Drive+10
1892  052f 2002          	jra	L535
1893  0531               L335:
1894                     ; 865 				Drive.Phase++;
1896  0531 3c76          	inc	_Drive+10
1897  0533               L535:
1898                     ; 868 		if ( Drive.Origin ) 
1900  0533 b683          	ld	a,_Drive+23
1901  0535 2708          	jreq	L735
1902                     ; 870 			Drive.ORGPosition = Drive.Position;
1904  0537 bf79          	ldw	_Drive+13,x
1905                     ; 871 			Drive.LastOrigin = TRUE;
1907  0539 7214006c      	bset	_Drive,#2
1909  053d 2016          	jra	L135
1910  053f               L735:
1911                     ; 874 			if ( Drive.LastOrigin )
1913  053f 7205006c11    	btjf	_Drive,#2,L135
1914                     ; 876 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1916  0544 be79          	ldw	x,_Drive+13
1917  0546 1d0028        	subw	x,#40
1918  0549 bf77          	ldw	_Drive+11,x
1919                     ; 877 				if ( Drive.MaxOverrun > OVERRUN )
1921  054b a3012d        	cpw	x,#301
1922  054e 2505          	jrult	L135
1923                     ; 878 					Drive.MaxOverrun = OVERRUN;				
1925  0550 ae012c        	ldw	x,#300
1926  0553 bf77          	ldw	_Drive+11,x
1927  0555               L135:
1928                     ; 883 	if ( !Drive.Run ) return;
1930  0555 7202006c01    	btjt	_Drive,#1,L745
1934  055a 81            	ret	
1935  055b               L745:
1936                     ; 884 	if ( !Drive.Enabled ) return;
1938  055b 7200006c01    	btjt	_Drive,#0,L155
1942  0560 81            	ret	
1943  0561               L155:
1944                     ; 885 	switch ( Drive.ExcitationType )
1946  0561 b682          	ld	a,_Drive+22
1948                     ; 896 			break;
1949  0563 2707          	jreq	L364
1950  0565 4a            	dec	a
1951  0566 2707          	jreq	L564
1952  0568 4a            	dec	a
1953  0569 2706          	jreq	L764
1955  056b 81            	ret	
1956  056c               L364:
1957                     ; 888 		case 0:
1957                     ; 889 			Excitation_1Phase();	
1960                     ; 890 			break;
1963  056c cc06a0        	jp	_Excitation_1Phase
1964  056f               L564:
1965                     ; 891 		case 1:
1965                     ; 892 			Excitation_12Phase();
1968                     ; 893 			break;
1971  056f 2066          	jp	_Excitation_12Phase
1972  0571               L764:
1973                     ; 894 		case 2:
1973                     ; 895 			Excitation_2Phase();
1976                     ; 896 			break;
1978                     ; 901 }
1981  0571 2063          	jp	_Excitation_2Phase
2007                     ; 906 void MotorClose(void)
2007                     ; 907 {
2008                     	switch	.text
2009  0573               _MotorClose:
2013                     ; 908 	if ( Drive.Origin )   		// Hall IC Sensing 
2015  0573 b683          	ld	a,_Drive+23
2016  0575 2719          	jreq	L765
2017                     ; 910 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
2019  0577 be71          	ldw	x,_Drive+5
2020  0579 b377          	cpw	x,_Drive+11
2021  057b 2510          	jrult	L175
2022                     ; 912 			Drive.Target = 0u;
2024  057d 5f            	clrw	x
2025  057e bf6f          	ldw	_Drive+3,x
2026                     ; 913 			Drive.Position = 0u;
2028  0580 bf6d          	ldw	_Drive+1,x
2029                     ; 914 			Drive.Overrun = 0u;
2031  0582 bf71          	ldw	_Drive+5,x
2032                     ; 915 			Drive.ZeroOffset = 0u;
2034  0584 bf74          	ldw	_Drive+8,x
2035                     ; 916 			Drive.Run = FALSE;			
2037  0586 7213006c      	bres	_Drive,#1
2038                     ; 917 			StopDrive();
2043  058a cc0464        	jp	_StopDrive
2044  058d               L175:
2045                     ; 921 			Drive.Overrun++;
2047  058d 5c            	incw	x
2048  058e bf71          	ldw	_Drive+5,x
2049                     ; 922 			MotorStep(nMotorClose);
2051  0590               L765:
2052                     ; 926 		MotorStep(nMotorClose);		// move 1 step close
2055  0590 4f            	clr	a
2057                     ; 927 }
2060  0591 cc04fa        	jp	_MotorStep
2087                     ; 932 void DriveService(void)
2087                     ; 933 {
2088                     	switch	.text
2089  0594               _DriveService:
2091  0594 89            	pushw	x
2092       00000002      OFST:	set	2
2095                     ; 943 	if ( ! Drive.Run ) 
2097  0595 7202006c02    	btjt	_Drive,#1,L706
2098                     ; 945 		StopDrive();
2100                     ; 946 		return;	//when Drive is stop 
2102  059a 2035          	jp	LC009
2103  059c               L706:
2104                     ; 953 	if ( Drive.Target > Drive.Position )
2106  059c be6f          	ldw	x,_Drive+3
2107  059e b36d          	cpw	x,_Drive+1
2108  05a0 2307          	jrule	L116
2109                     ; 954 	 	MotorStep(nMotorOpen);
2111  05a2 a601          	ld	a,#1
2112  05a4 cd04fa        	call	_MotorStep
2115  05a7 202b          	jra	L316
2116  05a9               L116:
2117                     ; 955 	else if ( Drive.Target < Drive.Position )
2119  05a9 b36d          	cpw	x,_Drive+1
2120  05ab 2404          	jruge	L516
2121                     ; 956 		MotorClose( );
2123  05ad adc4          	call	_MotorClose
2126  05af 2023          	jra	L316
2127  05b1               L516:
2128                     ; 957 	else if ( Drive.Target ) 	// on target position
2130  05b1 be6f          	ldw	x,_Drive+3
2131  05b3 2713          	jreq	L326
2132                     ; 959 			if ( Drive.Overrun2 )
2134  05b5 b673          	ld	a,_Drive+7
2135  05b7 270f          	jreq	L326
2136                     ; 961 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
2138  05b9 5f            	clrw	x
2139  05ba 97            	ld	xl,a
2140  05bb 1f01          	ldw	(OFST-1,sp),x
2142  05bd be6f          	ldw	x,_Drive+3
2143  05bf 72f001        	subw	x,(OFST-1,sp)
2144  05c2 bf6f          	ldw	_Drive+3,x
2145                     ; 962 				Drive.Overrun2 = 0u;
2147  05c4 3f73          	clr	_Drive+7
2149  05c6 200c          	jra	L316
2150  05c8               L326:
2151                     ; 966 				Drive.ZeroOffset = 0u;
2152                     ; 967 				Drive.Overrun = 0u;
2153                     ; 968 				Drive.Run = FALSE;
2154                     ; 969 				StopDrive();		
2156                     ; 975 			Drive.ZeroOffset = 0u;
2158                     ; 976 			Drive.Overrun = 0u;
2160                     ; 977 			Drive.Run = FALSE;
2163  05c8 5f            	clrw	x
2164  05c9 bf74          	ldw	_Drive+8,x
2166  05cb bf71          	ldw	_Drive+5,x
2168  05cd 7213006c      	bres	_Drive,#1
2169                     ; 978 			StopDrive();	
2171  05d1               LC009:
2174  05d1 cd0464        	call	_StopDrive
2176  05d4               L316:
2177                     ; 980 }
2180  05d4 85            	popw	x
2181  05d5 81            	ret	
2204                     ; 983 void Excitation_2Phase( void )
2204                     ; 984 {
2205                     	switch	.text
2206  05d6               _Excitation_2Phase:
2210                     ; 1043 }
2213  05d6 81            	ret	
2239                     ; 1046 void Excitation_12Phase( void )
2239                     ; 1047 {
2240                     	switch	.text
2241  05d7               _Excitation_12Phase:
2245                     ; 1049 	switch (Drive.Phase%8)
2247  05d7 b676          	ld	a,_Drive+10
2248  05d9 a407          	and	a,#7
2250                     ; 1100 		default:
2250                     ; 1101 			break;
2251  05db 2716          	jreq	L146
2252  05dd 4a            	dec	a
2253  05de 271d          	jreq	L346
2254  05e0 4a            	dec	a
2255  05e1 272d          	jreq	L546
2256  05e3 4a            	dec	a
2257  05e4 273f          	jreq	L746
2258  05e6 4a            	dec	a
2259  05e7 2748          	jreq	L156
2260  05e9 4a            	dec	a
2261  05ea 2753          	jreq	L356
2262  05ec 4a            	dec	a
2263  05ed 276e          	jreq	L556
2264  05ef 4a            	dec	a
2265  05f0 2775          	jreq	L756
2267  05f2 81            	ret	
2268  05f3               L146:
2269                     ; 1051 		case 0:
2269                     ; 1052 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2271  05f3 4b40          	push	#64
2272  05f5 ae500a        	ldw	x,#20490
2273  05f8 cd0000        	call	_GPIO_WriteHigh
2275                     ; 1053 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2277                     ; 1054 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2279                     ; 1055 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2281                     ; 1056 			break;
2283  05fb 2008          	jp	LC014
2284  05fd               L346:
2285                     ; 1057 		case 1:
2285                     ; 1058 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2287  05fd 4b40          	push	#64
2288  05ff ae500a        	ldw	x,#20490
2289  0602 cd0000        	call	_GPIO_WriteLow
2291                     ; 1059 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2293  0605               LC014:
2294  0605 84            	pop	a
2296  0606 4b08          	push	#8
2297  0608 ae500a        	ldw	x,#20490
2298  060b cd0000        	call	_GPIO_WriteHigh
2300                     ; 1060 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2302                     ; 1061 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2304                     ; 1062 			break;		
2306  060e 2068          	jp	LC013
2307  0610               L546:
2308                     ; 1063 		case 2:
2308                     ; 1064 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2310  0610 ad7a          	call	LC018
2311                     ; 1065 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2313  0612 4b08          	push	#8
2314  0614 ae500a        	ldw	x,#20490
2315  0617 cd0000        	call	_GPIO_WriteHigh
2317                     ; 1066 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2319  061a               LC015:
2320  061a 84            	pop	a
2322  061b 4b80          	push	#128
2323  061d ae500a        	ldw	x,#20490
2324  0620 cd0000        	call	_GPIO_WriteHigh
2326                     ; 1067 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2328                     ; 1068 			break;
2330  0623 205c          	jp	LC012
2331  0625               L746:
2332                     ; 1069 		case 3:
2332                     ; 1070 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2334  0625 ad65          	call	LC018
2335                     ; 1071 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2337  0627 4b08          	push	#8
2338  0629 ae500a        	ldw	x,#20490
2339  062c cd0000        	call	_GPIO_WriteLow
2341                     ; 1072 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2343                     ; 1073 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2345                     ; 1074 			break;
2347  062f 20e9          	jp	LC015
2348  0631               L156:
2349                     ; 1075 		case 4:
2349                     ; 1076 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2351  0631 ad59          	call	LC018
2352                     ; 1077 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2354  0633 ad61          	call	LC019
2355                     ; 1078 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2357  0635 4b80          	push	#128
2358  0637 ae500a        	ldw	x,#20490
2359  063a cd0000        	call	_GPIO_WriteHigh
2361                     ; 1079 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2363                     ; 1080 			break;
2365  063d 2013          	jp	LC016
2366  063f               L356:
2367                     ; 1081 		case 5: 
2367                     ; 1082 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2369  063f 4b40          	push	#64
2370  0641 ae500a        	ldw	x,#20490
2371  0644 cd0000        	call	_GPIO_WriteLow
2373                     ; 1083 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2376                     ; 1084 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2378  0647               LC017:
2379  0647 84            	pop	a
2381  0648 ad4c          	call	LC019
2383  064a 4b80          	push	#128
2384  064c ae500a        	ldw	x,#20490
2385  064f cd0000        	call	_GPIO_WriteLow
2387                     ; 1085 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2389  0652               LC016:
2390  0652 84            	pop	a
2393  0653 4b08          	push	#8
2394  0655 ae5000        	ldw	x,#20480
2395  0658 cd0000        	call	_GPIO_WriteHigh
2397                     ; 1086 			break;
2399  065b 202d          	jp	LC011
2400  065d               L556:
2401                     ; 1087 		case 6:  
2401                     ; 1088 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2403  065d 4b40          	push	#64
2404  065f ae500a        	ldw	x,#20490
2405  0662 cd0000        	call	_GPIO_WriteHigh
2407                     ; 1089 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2409                     ; 1090 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2411                     ; 1091 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2413                     ; 1092 			break;
2415  0665 20e0          	jp	LC017
2416  0667               L756:
2417                     ; 1093 		case 7:
2417                     ; 1094 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2419  0667 4b40          	push	#64
2420  0669 ae500a        	ldw	x,#20490
2421  066c cd0000        	call	_GPIO_WriteHigh
2423  066f 84            	pop	a
2424                     ; 1095 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2426  0670 4b08          	push	#8
2427  0672 ae500a        	ldw	x,#20490
2428  0675 cd0000        	call	_GPIO_WriteLow
2430                     ; 1096 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2432  0678               LC013:
2433  0678 84            	pop	a
2436  0679 4b80          	push	#128
2437  067b ae500a        	ldw	x,#20490
2438  067e cd0000        	call	_GPIO_WriteLow
2440                     ; 1097 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2442  0681               LC012:
2443  0681 84            	pop	a
2448  0682 4b08          	push	#8
2449  0684 ae5000        	ldw	x,#20480
2450  0687 cd0000        	call	_GPIO_WriteLow
2452  068a               LC011:
2453  068a 84            	pop	a
2454                     ; 1098 			break;
2456                     ; 1100 		default:
2456                     ; 1101 			break;
2458                     ; 1104 }
2461  068b 81            	ret	
2462  068c               LC018:
2463  068c 4b40          	push	#64
2464  068e ae500a        	ldw	x,#20490
2465  0691 cd0000        	call	_GPIO_WriteLow
2467  0694 84            	pop	a
2468  0695 81            	ret	
2469  0696               LC019:
2470  0696 4b08          	push	#8
2471  0698 ae500a        	ldw	x,#20490
2472  069b cd0000        	call	_GPIO_WriteLow
2474  069e 84            	pop	a
2475  069f 81            	ret	
2498                     ; 1106 void Excitation_1Phase( void )
2498                     ; 1107 {
2499                     	switch	.text
2500  06a0               _Excitation_1Phase:
2504                     ; 1144 }
2507  06a0 81            	ret	
2542                     ; 1147 u8 Interval( u16 Vmon)
2542                     ; 1148 {
2543                     	switch	.text
2544  06a1               _Interval:
2546  06a1 89            	pushw	x
2547       00000000      OFST:	set	0
2550                     ; 1149 	Vmon = Vmon / IntervalSlope;
2552  06a2 a61c          	ld	a,#28
2553  06a4 62            	div	x,a
2554                     ; 1151 	if (Vmon < 10 ) Vmon = 10;
2556  06a5 a3000a        	cpw	x,#10
2557  06a8 2403          	jruge	L527
2560  06aa ae000a        	ldw	x,#10
2561  06ad               L527:
2562                     ; 1152 	if (Vmon > 26 ) Vmon = 26;
2564  06ad a3001b        	cpw	x,#27
2565  06b0 2503          	jrult	L727
2568  06b2 ae001a        	ldw	x,#26
2569  06b5               L727:
2570                     ; 1154 	return ( TableInterval[ Vmon-10 ] );
2572  06b5 1d000a        	subw	x,#10
2573  06b8 e603          	ld	a,(_TableInterval,x)
2576  06ba 85            	popw	x
2577  06bb 81            	ret	
2620                     	switch	.const
2621  000c               L473:
2622  000c 00000960      	dc.l	2400
2623                     ; 1169 uint16_t CStep( uint16_t pulse )
2623                     ; 1170 {
2624                     	switch	.text
2625  06bc               _CStep:
2627  06bc 5204          	subw	sp,#4
2628       00000004      OFST:	set	4
2631                     ; 1173 	i = (uint32_t) pulse * 200u / (2400UL);
2633  06be a6c8          	ld	a,#200
2634  06c0 cd0000        	call	c_cmulx
2636  06c3 ae000c        	ldw	x,#L473
2637  06c6 cd0000        	call	c_ludv
2639  06c9 96            	ldw	x,sp
2640  06ca 5c            	incw	x
2641  06cb cd0000        	call	c_rtol
2644                     ; 1174 	i = (i+1)/2;   				// Round up  20150925
2646  06ce 96            	ldw	x,sp
2647  06cf 5c            	incw	x
2648  06d0 cd0000        	call	c_ltor
2650  06d3 a601          	ld	a,#1
2651  06d5 cd0000        	call	c_ladc
2653  06d8 3400          	srl	c_lreg
2654  06da 3601          	rrc	c_lreg+1
2655  06dc 3602          	rrc	c_lreg+2
2656  06de 96            	ldw	x,sp
2657  06df 3603          	rrc	c_lreg+3
2658  06e1 5c            	incw	x
2659  06e2 cd0000        	call	c_rtol
2662                     ; 1175 	return (uint16_t) i;
2664  06e5 1e03          	ldw	x,(OFST-1,sp)
2667  06e7 5b04          	addw	sp,#4
2668  06e9 81            	ret	
2711                     ; 1179 uint16_t CPulse( uint16_t step )
2711                     ; 1180 {
2712                     	switch	.text
2713  06ea               _CPulse:
2715  06ea 89            	pushw	x
2716       00000002      OFST:	set	2
2719                     ; 1184 		i= (uint32_t) step *(26UL);  // 20180509  change to 5200 pulse
2721  06eb 90ae001a      	ldw	y,#26
2722  06ef cd0000        	call	c_imul
2725                     ; 1186 	return (uint16_t) i;
2729  06f2 5b02          	addw	sp,#2
2730  06f4 81            	ret	
2759                     ; 1197 void Clock_Config(void)
2759                     ; 1198 {
2760                     	switch	.text
2761  06f5               _Clock_Config:
2765                     ; 1200 	CLK_DeInit();
2767  06f5 cd0000        	call	_CLK_DeInit
2769                     ; 1201 	CLK_HSICmd(ENABLE);
2771  06f8 a601          	ld	a,#1
2772  06fa cd0000        	call	_CLK_HSICmd
2774                     ; 1202 	CLK_LSICmd(DISABLE);
2776  06fd 4f            	clr	a
2777  06fe cd0000        	call	_CLK_LSICmd
2779                     ; 1203 	CLK_HSECmd(DISABLE);
2781  0701 4f            	clr	a
2782  0702 cd0000        	call	_CLK_HSECmd
2784                     ; 1205 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2786  0705 4f            	clr	a
2787  0706 cd0000        	call	_CLK_HSIPrescalerConfig
2789                     ; 1206 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2791  0709 a680          	ld	a,#128
2793                     ; 1207 }
2796  070b cc0000        	jp	_CLK_SYSCLKConfig
2822                     ; 1210 void Gpio_Config(void)
2822                     ; 1211 {
2823                     	switch	.text
2824  070e               _Gpio_Config:
2828                     ; 1213   GPIO_Init( _LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2830  070e 4be0          	push	#224
2831  0710 4b04          	push	#4
2832  0712 ae5000        	ldw	x,#20480
2833  0715 cd0000        	call	_GPIO_Init
2835  0718 85            	popw	x
2836                     ; 1214 	GPIO_WriteHigh( _LED_PORT, _LED_PIN);
2838  0719 4b04          	push	#4
2839  071b ae5000        	ldw	x,#20480
2840  071e cd0000        	call	_GPIO_WriteHigh
2842  0721 84            	pop	a
2843                     ; 1217 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2845  0722 4be0          	push	#224
2846  0724 4b40          	push	#64
2847  0726 ae500a        	ldw	x,#20490
2848  0729 cd0000        	call	_GPIO_Init
2850  072c 85            	popw	x
2851                     ; 1218 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2853  072d 4be0          	push	#224
2854  072f 4b80          	push	#128
2855  0731 ae500a        	ldw	x,#20490
2856  0734 cd0000        	call	_GPIO_Init
2858  0737 85            	popw	x
2859                     ; 1219 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2861  0738 4be0          	push	#224
2862  073a 4b08          	push	#8
2863  073c ae500a        	ldw	x,#20490
2864  073f cd0000        	call	_GPIO_Init
2866  0742 85            	popw	x
2867                     ; 1220 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2869  0743 4be0          	push	#224
2870  0745 4b08          	push	#8
2871  0747 ae5000        	ldw	x,#20480
2872  074a cd0000        	call	_GPIO_Init
2874  074d 85            	popw	x
2875                     ; 1222 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2877  074e 4b40          	push	#64
2878  0750 ae500a        	ldw	x,#20490
2879  0753 cd0000        	call	_GPIO_WriteLow
2881  0756 84            	pop	a
2882                     ; 1223 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2884  0757 4b08          	push	#8
2885  0759 ae500a        	ldw	x,#20490
2886  075c cd0000        	call	_GPIO_WriteLow
2888  075f 84            	pop	a
2889                     ; 1224 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2891  0760 4b80          	push	#128
2892  0762 ae500a        	ldw	x,#20490
2893  0765 cd0000        	call	_GPIO_WriteLow
2895  0768 84            	pop	a
2896                     ; 1225 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2898  0769 4b08          	push	#8
2899  076b ae5000        	ldw	x,#20480
2900  076e cd0000        	call	_GPIO_WriteLow
2902  0771 84            	pop	a
2903                     ; 1228   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2905  0772 4b00          	push	#0
2906  0774 4b10          	push	#16
2907  0776 ae5005        	ldw	x,#20485
2908  0779 cd0000        	call	_GPIO_Init
2910  077c 85            	popw	x
2911                     ; 1231 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
2913  077d 4b00          	push	#0
2914  077f 4b04          	push	#4
2915  0781 ae500f        	ldw	x,#20495
2916  0784 cd0000        	call	_GPIO_Init
2918  0787 85            	popw	x
2919                     ; 1233 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2921  0788 4b00          	push	#0
2922  078a 4b10          	push	#16
2923  078c ae500f        	ldw	x,#20495
2924  078f cd0000        	call	_GPIO_Init
2926  0792 85            	popw	x
2927                     ; 1235 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2929  0793 4b00          	push	#0
2930  0795 4b10          	push	#16
2931  0797 ae500a        	ldw	x,#20490
2932  079a cd0000        	call	_GPIO_Init
2934  079d 85            	popw	x
2935                     ; 1236 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
2937  079e 4b00          	push	#0
2938  07a0 4b08          	push	#8
2939  07a2 ae500f        	ldw	x,#20495
2940  07a5 cd0000        	call	_GPIO_Init
2942  07a8 85            	popw	x
2943                     ; 1238 }
2946  07a9 81            	ret	
2981                     ; 1270 void TIM2_Config(uint8_t Edge)
2981                     ; 1271 {
2982                     	switch	.text
2983  07aa               _TIM2_Config:
2987                     ; 1273 	if ( Edge == 0 )
2989  07aa 4d            	tnz	a
2990  07ab 2609          	jrne	L3301
2991                     ; 1274 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
2991                     ; 1275                TIM2_ICPSC_DIV8, 0xf);		//  16MHz /8 = 2MHz
2993  07ad 4b0f          	push	#15
2994  07af 4b0c          	push	#12
2995  07b1 4b01          	push	#1
2996  07b3 5f            	clrw	x
2999  07b4 2009          	jra	L5301
3000  07b6               L3301:
3001                     ; 1277 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
3001                     ; 1278                TIM2_ICPSC_DIV8, 0xf);
3003  07b6 4b0f          	push	#15
3004  07b8 4b0c          	push	#12
3005  07ba 4b01          	push	#1
3006  07bc ae0044        	ldw	x,#68
3008  07bf               L5301:
3009  07bf cd0000        	call	_TIM2_ICInit
3010  07c2 5b03          	addw	sp,#3
3011                     ; 1287 }
3014  07c4 81            	ret	
3041                     ; 1291 void Timer4_Config(void)
3041                     ; 1292 {
3042                     	switch	.text
3043  07c5               L5_Timer4_Config:
3047                     ; 1293   TIM4_DeInit();
3049  07c5 cd0000        	call	_TIM4_DeInit
3051                     ; 1299 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
3053  07c8 ae0432        	ldw	x,#1074
3054  07cb cd0000        	call	_TIM4_TimeBaseInit
3056                     ; 1302   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
3058  07ce ae0101        	ldw	x,#257
3059  07d1 cd0000        	call	_TIM4_ITConfig
3061                     ; 1305   TIM4_Cmd(ENABLE);
3063  07d4 a601          	ld	a,#1
3065                     ; 1306 }
3068  07d6 cc0000        	jp	_TIM4_Cmd
3096                     ; 1309 static void Adc_Config( void )
3096                     ; 1310 {
3097                     	switch	.text
3098  07d9               L3_Adc_Config:
3102                     ; 1312 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
3104  07d9 cd0000        	call	_ADC1_GetConversionValue
3106  07dc b658          	ld	a,_Adc+6
3107  07de 905f          	clrw	y
3108  07e0 9097          	ld	yl,a
3109  07e2 9058          	sllw	y
3110  07e4 90ef52        	ldw	(_Adc,y),x
3111                     ; 1313 	ADC1_DeInit();
3113  07e7 cd0000        	call	_ADC1_DeInit
3115                     ; 1315 	switch (Adc.Idx)
3117  07ea b658          	ld	a,_Adc+6
3119                     ; 1337 			break;
3120  07ec 2708          	jreq	L7401
3121  07ee 4a            	dec	a
3122  07ef 271f          	jreq	L1501
3123  07f1 4a            	dec	a
3124  07f2 2736          	jreq	L3501
3125                     ; 1335 		default:
3125                     ; 1336 			Adc.Idx = 0;
3126                     ; 1337 			break;
3128  07f4 2048          	jp	LC020
3129  07f6               L7401:
3130                     ; 1317 		case 0:
3130                     ; 1318 		  
3130                     ; 1319 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
3130                     ; 1320 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
3132  07f6 4b00          	push	#0
3133  07f8 4b03          	push	#3
3134  07fa 4b08          	push	#8
3135  07fc 4b00          	push	#0
3136  07fe 4b00          	push	#0
3137  0800 4b00          	push	#0
3138  0802 ae0003        	ldw	x,#3
3139  0805 cd0000        	call	_ADC1_Init
3141  0808 5b06          	addw	sp,#6
3142                     ; 1321 			Adc.Idx = 1;
3144  080a 35010058      	mov	_Adc+6,#1
3145                     ; 1322 			break;
3147  080e 2030          	jra	L1701
3148  0810               L1501:
3149                     ; 1323 		case 1:
3149                     ; 1324 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
3149                     ; 1325 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
3151  0810 4b00          	push	#0
3152  0812 4b04          	push	#4
3153  0814 4b08          	push	#8
3154  0816 4b00          	push	#0
3155  0818 4b00          	push	#0
3156  081a 4b00          	push	#0
3157  081c ae0004        	ldw	x,#4
3158  081f cd0000        	call	_ADC1_Init
3160  0822 5b06          	addw	sp,#6
3161                     ; 1326 			Adc.Idx = 2;
3163  0824 35020058      	mov	_Adc+6,#2
3164                     ; 1327 			break;
3166  0828 2016          	jra	L1701
3167  082a               L3501:
3168                     ; 1329 		case 2:
3168                     ; 1330 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
3168                     ; 1331 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3170  082a 4b00          	push	#0
3171  082c 4b02          	push	#2
3172  082e 4b08          	push	#8
3173  0830 4b00          	push	#0
3174  0832 4b00          	push	#0
3175  0834 4b00          	push	#0
3176  0836 ae0002        	ldw	x,#2
3177  0839 cd0000        	call	_ADC1_Init
3179  083c 5b06          	addw	sp,#6
3180                     ; 1332 			Adc.Idx = 0;
3182  083e               LC020:
3184  083e 3f58          	clr	_Adc+6
3185                     ; 1333 			break;
3187  0840               L1701:
3188                     ; 1340 		ADC1_StartConversion();		
3191                     ; 1341 }
3194  0840 cc0000        	jp	_ADC1_StartConversion
3238                     ; 1356 void assert_failed(u8* file, u32 line)
3238                     ; 1357 {
3239                     	switch	.text
3240  0843               _assert_failed:
3242  0843 88            	push	a
3243       00000001      OFST:	set	1
3246  0844               L5111:
3247                     ; 1366 	i = i++;
3249  0844 0c01          	inc	(OFST+0,sp)
3251  0846 6b01          	ld	(OFST+0,sp),a
3254  0848 20fa          	jra	L5111
3965                     	xdef	_MotorClose
3966                     	xdef	_MotorStep
3967                     	xdef	_OnTimer_1mS
3968                     	switch	.ubsct
3969  0000               _pos2:
3970  0000 00            	ds.b	1
3971                     	xdef	_pos2
3972  0001               _pos:
3973  0001 0000          	ds.b	2
3974                     	xdef	_pos
3975                     	xdef	_OnTimer_1S
3976                     	xdef	_main
3977  0003               _mVal:
3978  0003 00000000      	ds.b	4
3979                     	xdef	_mVal
3980  0007               _iStep:
3981  0007 00            	ds.b	1
3982                     	xdef	_iStep
3983  0008               _mStep:
3984  0008 000000000000  	ds.b	64
3985                     	xdef	_mStep
3986                     	xdef	_min
3987                     	xdef	_MotorService
3988                     	xdef	_AdcService
3989                     	xdef	_SAbs
3990                     	xdef	_Diff
3991                     	xdef	_TIM2_Config
3992                     	xdef	_Gpio_Config
3993                     	xdef	_Clock_Config
3994                     	xdef	_OnCaptureOVTim2
3995                     	xdef	_OnCaptureTim2
3996                     	xdef	_OnTimer4
3997                     	xdef	_StopDrive
3998                     	xdef	_Interval
3999                     	xdef	_StartDriveOR
4000                     	xdef	_DriveService
4001                     	xdef	_Excitation_2Phase
4002                     	xdef	_Excitation_12Phase
4003                     	xdef	_Excitation_1Phase
4004                     	xdef	_CPulse
4005                     	xdef	_CStep
4006                     	xdef	_PowerDelay_1mS
4007  0048               _Timer:
4008  0048 000000000000  	ds.b	10
4009                     	xdef	_Timer
4010  0052               _Adc:
4011  0052 000000000000  	ds.b	14
4012                     	xdef	_Adc
4013  0060               _My:
4014  0060 000000000000  	ds.b	12
4015                     	xdef	_My
4016  006c               _Drive:
4017  006c 000000000000  	ds.b	46
4018                     	xdef	_Drive
4019                     	xdef	_TableInterval
4020  009a               _ledint:
4021  009a 0000          	ds.b	2
4022                     	xdef	_ledint
4023  009c               _Ticks_S:
4024  009c 00000000      	ds.b	4
4025                     	xdef	_Ticks_S
4026  00a0               _Ticks2_1mS:
4027  00a0 0000          	ds.b	2
4028                     	xdef	_Ticks2_1mS
4029  00a2               _Ticks_1mS:
4030  00a2 0000          	ds.b	2
4031                     	xdef	_Ticks_1mS
4032  00a4               _Ticks_50uS:
4033  00a4 00000000      	ds.b	4
4034                     	xdef	_Ticks_50uS
4035  00a8               _mDuty:
4036  00a8 0000          	ds.b	2
4037                     	xdef	_mDuty
4038                     	xdef	_nDuty
4039  00aa               _sDuty:
4040  00aa 0000          	ds.b	2
4041                     	xdef	_sDuty
4042  00ac               _iDuty:
4043  00ac 00            	ds.b	1
4044                     	xdef	_iDuty
4045  00ad               _Duty:
4046  00ad 000000000000  	ds.b	16
4047                     	xdef	_Duty
4048  00bd               _Dif:
4049  00bd 0000          	ds.b	2
4050                     	xdef	_Dif
4051  00bf               _update:
4052  00bf 00            	ds.b	1
4053                     	xdef	_update
4054  00c0               _t2:
4055  00c0 0000          	ds.b	2
4056                     	xdef	_t2
4057  00c2               _tt:
4058  00c2 0000          	ds.b	2
4059                     	xdef	_tt
4060                     	xdef	_PeriodNumber
4061  00c4               _Counter:
4062  00c4 0000          	ds.b	2
4063                     	xdef	_Counter
4064                     	xdef	_assert_failed
4065                     	xref	_TIM4_ITConfig
4066                     	xref	_TIM4_Cmd
4067                     	xref	_TIM4_TimeBaseInit
4068                     	xref	_TIM4_DeInit
4069                     	xref	_TIM2_ClearITPendingBit
4070                     	xref	_TIM2_GetITStatus
4071                     	xref	_TIM2_GetCapture1
4072                     	xref	_TIM2_ITConfig
4073                     	xref	_TIM2_Cmd
4074                     	xref	_TIM2_ICInit
4075                     	xref	_TIM2_TimeBaseInit
4076                     	xref	_TIM2_DeInit
4077                     	xref	_GPIO_ReadInputPin
4078                     	xref	_GPIO_WriteReverse
4079                     	xref	_GPIO_WriteLow
4080                     	xref	_GPIO_WriteHigh
4081                     	xref	_GPIO_Init
4082                     	xref	_CLK_SYSCLKConfig
4083                     	xref	_CLK_HSIPrescalerConfig
4084                     	xref	_CLK_LSICmd
4085                     	xref	_CLK_HSICmd
4086                     	xref	_CLK_HSECmd
4087                     	xref	_CLK_DeInit
4088                     	xref	_ADC1_GetConversionValue
4089                     	xref	_ADC1_StartConversion
4090                     	xref	_ADC1_Init
4091                     	xref	_ADC1_DeInit
4092                     	xref.b	c_lreg
4093                     	xref.b	c_x
4094                     	xref.b	c_y
4114                     	xref	c_imul
4115                     	xref	c_cmulx
4116                     	xref	c_ladc
4117                     	xref	c_lcmp
4118                     	xref	c_ladd
4119                     	xref	c_lsub
4120                     	xref	c_uitolx
4121                     	xref	c_lgadc
4122                     	xref	c_lgsub
4123                     	xref	c_ludv
4124                     	xref	c_ltor
4125                     	xref	c_rtol
4126                     	xref	c_umul
4127                     	end
