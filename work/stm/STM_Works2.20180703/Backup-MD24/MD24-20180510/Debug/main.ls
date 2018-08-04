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
 116                     ; 205 void main(void)
 116                     ; 206 {
 117                     	scross	off
 118                     	switch	.text
 119  0000               _main:
 123                     ; 209 	Ticks_1mS = 0;
 125  0000 5f            	clrw	x
 126  0001 bf95          	ldw	_Ticks_1mS,x
 127                     ; 210 	Ticks_50uS = 0;
 129  0003 bf99          	ldw	_Ticks_50uS+2,x
 130  0005 bf97          	ldw	_Ticks_50uS,x
 131                     ; 212 	Clock_Config();
 133  0007 cd069e        	call	_Clock_Config
 135                     ; 213 	Gpio_Config();
 137  000a cd06b7        	call	_Gpio_Config
 139                     ; 215 	Timer4_Config();
 141  000d cd074a        	call	L5_Timer4_Config
 143                     ; 217 	Adc.Idx = 2;
 145  0010 35020058      	mov	_Adc+6,#2
 146                     ; 218 	Adc_Config(  );
 148  0014 cd075e        	call	L3_Adc_Config
 150                     ; 221 	Drive.Enabled = ENABLED;
 152  0017 72100071      	bset	_Drive,#0
 153                     ; 222 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 155  001b ae012c        	ldw	x,#300
 156  001e bf7c          	ldw	_Drive+11,x
 157                     ; 224 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 159  0020 bf84          	ldw	_Drive+19,x
 160                     ; 226 	Drive.Position = 0;
 162  0022 5f            	clrw	x
 163  0023 bf72          	ldw	_Drive+1,x
 164                     ; 227 	Drive.Dir = nMotorClose;
 166                     ; 228 	Drive.Interval = 12u;	//	for 24V 35RD Motor sample #1
 168  0025 ae000c        	ldw	x,#12
 169  0028 721b0071      	bres	_Drive,#5
 170  002c bf80          	ldw	_Drive+15,x
 171                     ; 232 	Drive.Stage = 0;		// Not Initialized
 173  002e 3f8c          	clr	_Drive+27
 174                     ; 237 	Drive.ExcitationType = 1;		//12 excition
 176  0030 35010086      	mov	_Drive+21,#1
 177                     ; 256 	Pwm.Prescaler = TIM2_PRESCALER_8;
 179  0034 35030070      	mov	_Pwm+16,#3
 180                     ; 258 	TIM2_DeInit();	
 182  0038 cd0000        	call	_TIM2_DeInit
 184                     ; 259 	TIM2_TimeBaseInit( Pwm.Prescaler, 0xffff );
 186  003b aeffff        	ldw	x,#65535
 187  003e 89            	pushw	x
 188  003f b670          	ld	a,_Pwm+16
 189  0041 cd0000        	call	_TIM2_TimeBaseInit
 191  0044 85            	popw	x
 192                     ; 260 	TIM2_ITConfig( TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
 194  0045 ae0301        	ldw	x,#769
 195  0048 cd0000        	call	_TIM2_ITConfig
 197                     ; 261 	TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
 197                     ; 262                TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
 199  004b 4b00          	push	#0
 200  004d 4b0c          	push	#12
 201  004f 4b01          	push	#1
 202  0051 5f            	clrw	x
 203  0052 cd0000        	call	_TIM2_ICInit
 205  0055 5b03          	addw	sp,#3
 206                     ; 263 	TIM2_Cmd(ENABLE);
 208  0057 a601          	ld	a,#1
 209  0059 cd0000        	call	_TIM2_Cmd
 211                     ; 265 	enableInterrupts();
 214  005c 9a            	rim	
 216                     ; 267 	Pwm.Edge = 0;
 219  005d 72110060      	bres	_Pwm,#0
 220                     ; 269 	StopDrive();
 222  0061 cd042c        	call	_StopDrive
 224                     ; 271   GPIO_WriteLow(_LED_PORT, _LED_PIN);		// Led on
 226  0064 4b04          	push	#4
 227  0066 ae5000        	ldw	x,#20480
 228  0069 cd0000        	call	_GPIO_WriteLow
 230  006c 84            	pop	a
 232  006d               L72:
 233                     ; 273 	while ( Ticks_1mS < PowerDelay_1mS )		// Delay Power ON
 235  006d be95          	ldw	x,_Ticks_1mS
 236  006f b314          	cpw	x,_PowerDelay_1mS
 237  0071 25fa          	jrult	L72
 238                     ; 276   GPIO_WriteHigh(_LED_PORT, _LED_PIN);		// Led off
 240  0073 4b04          	push	#4
 241  0075 ae5000        	ldw	x,#20480
 242  0078 cd0000        	call	_GPIO_WriteHigh
 244  007b 3d87          	tnz	_Drive+22
 245  007d 84            	pop	a
 246                     ; 291 	if ( Drive.Origin ) 
 248  007e 2716          	jreq	L33
 249                     ; 293 		Drive.Position = 0;
 251  0080 5f            	clrw	x
 252  0081 bf72          	ldw	_Drive+1,x
 253                     ; 294 		StartDriveOR( CPulse(200u), 0u  );				// Goto Zero position
 255  0083 4b00          	push	#0
 256  0085 ae00c8        	ldw	x,#200
 257  0088 cd0693        	call	_CPulse
 259  008b cd0451        	call	_StartDriveOR
 261  008e 84            	pop	a
 263  008f               L73:
 264                     ; 296 		while (Drive.Run)				// Wait while motor is running
 266  008f 72020071fb    	btjt	_Drive,#1,L73
 268  0094 2008          	jra	L34
 269  0096               L33:
 270                     ; 301 		Drive.Position = CPulse(205u);
 272  0096 ae00cd        	ldw	x,#205
 273  0099 cd0693        	call	_CPulse
 275  009c bf72          	ldw	_Drive+1,x
 276  009e               L34:
 277                     ; 305 	Timer.Led = Ticks_1mS;
 279  009e be95          	ldw	x,_Ticks_1mS
 280  00a0 bf48          	ldw	_Timer,x
 281                     ; 306 	Timer.Motor = Ticks_1mS;
 283  00a2 be95          	ldw	x,_Ticks_1mS
 284  00a4 bf4a          	ldw	_Timer+2,x
 285                     ; 307 	Timer.Adc = Ticks_1mS;
 287  00a6 be95          	ldw	x,_Ticks_1mS
 288  00a8 bf4c          	ldw	_Timer+4,x
 289                     ; 310   ledint = 1000u;
 291  00aa ae03e8        	ldw	x,#1000
 292  00ad bf8d          	ldw	_ledint,x
 293  00af               L54:
 294                     ; 314 		tt = Ticks_1mS;
 296  00af be95          	ldw	x,_Ticks_1mS
 297  00b1 bfb5          	ldw	_tt,x
 298                     ; 316 		if ( Diff ( Timer.Led, ledint ) )
 300  00b3 be8d          	ldw	x,_ledint
 301  00b5 89            	pushw	x
 302  00b6 be48          	ldw	x,_Timer
 303  00b8 cd029c        	call	_Diff
 305  00bb 4d            	tnz	a
 306  00bc 85            	popw	x
 307  00bd 270d          	jreq	L15
 308                     ; 319 			Timer.Led = Ticks_1mS;
 310  00bf be95          	ldw	x,_Ticks_1mS
 311  00c1 bf48          	ldw	_Timer,x
 312                     ; 320 			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
 314  00c3 4b04          	push	#4
 315  00c5 ae5000        	ldw	x,#20480
 316  00c8 cd0000        	call	_GPIO_WriteReverse
 318  00cb 84            	pop	a
 319  00cc               L15:
 320                     ; 323 		AdcService();
 322  00cc cd023a        	call	_AdcService
 324                     ; 326 		if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
 326  00cf 7204007112    	btjt	_Drive,#2,L35
 328  00d4 720300710d    	btjf	_Drive,#1,L35
 329                     ; 328 			Pwm.T1_1mS = Ticks_1mS;
 331  00d9 be95          	ldw	x,_Ticks_1mS
 332  00db bf61          	ldw	_Pwm+1,x
 333                     ; 329 			Drive.Run0 = Drive.Run;			
 335                     	btst	_Drive,#1
 336  00e2 90150071      	bccm	_Drive,#2
 337  00e6               L35:
 338                     ; 332 		if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
 340  00e6 7205007112    	btjf	_Drive,#2,L55
 342  00eb 720200710d    	btjt	_Drive,#1,L55
 343                     ; 334 			Pwm.T2_1mS = Ticks_1mS;
 345  00f0 be95          	ldw	x,_Ticks_1mS
 346  00f2 bf63          	ldw	_Pwm+3,x
 347                     ; 335 			Drive.Run0 = Drive.Run;			
 349                     	btst	_Drive,#1
 350  00f9 90150071      	bccm	_Drive,#2
 351  00fd               L55:
 352                     ; 339 		if ( Drive.Stage == 0 )	//	Init
 354  00fd b68c          	ld	a,_Drive+27
 355  00ff 261e          	jrne	L75
 356                     ; 341 			if ( Drive.Run == 0 )
 358  0101 7203007103cc  	btjt	_Drive,#1,L521
 359                     ; 343 				if ( Drive.Origin == 1 )
 361  0109 b687          	ld	a,_Drive+22
 362  010b 4a            	dec	a
 363  010c 2607          	jrne	L36
 364                     ; 345 					Drive.Stage = 1;
 366  010e 3501008c      	mov	_Drive+27,#1
 368  0112 cc01fe        	jra	L521
 369  0115               L36:
 370                     ; 349 					StartDriveOR( 0u, 0u  );				// Goto Zero position
 372  0115 4b00          	push	#0
 373  0117 5f            	clrw	x
 374  0118 cd0451        	call	_StartDriveOR
 376  011b 84            	pop	a
 377  011c cc01fe        	jra	L521
 378  011f               L75:
 379                     ; 354 		else if ( Drive.Stage == 1 )	// Running 
 381  011f 4a            	dec	a
 382  0120 26fa          	jrne	L521
 383                     ; 356 			if ( Diff ( Timer.Motor, 200u ) != 0 )
 385  0122 ae00c8        	ldw	x,#200
 386  0125 89            	pushw	x
 387  0126 be4a          	ldw	x,_Timer+2
 388  0128 cd029c        	call	_Diff
 390  012b 4d            	tnz	a
 391  012c 85            	popw	x
 392  012d 2603cc01fa    	jreq	L37
 393                     ; 359 				if ( Diff ( Timer.PwmUpdate, 2000u ) != 0 )
 395  0132 ae07d0        	ldw	x,#2000
 396  0135 89            	pushw	x
 397  0136 be50          	ldw	x,_Timer+8
 398  0138 cd029c        	call	_Diff
 400  013b 4d            	tnz	a
 401  013c 85            	popw	x
 402  013d 271a          	jreq	L57
 403                     ; 361 					Drive.Step = 0;
 405  013f 3f89          	clr	_Drive+24
 406                     ; 364 					if ( Ticks_1mS > 2000 )
 408  0141 be95          	ldw	x,_Ticks_1mS
 409  0143 a307d1        	cpw	x,#2001
 410  0146 2507          	jrult	L77
 411                     ; 365 						Timer.PwmUpdate = Ticks_1mS-2000;
 413  0148 be95          	ldw	x,_Ticks_1mS
 414  014a 1d07d0        	subw	x,#2000
 416  014d 2005          	jp	LC001
 417  014f               L77:
 418                     ; 367 						Timer.PwmUpdate = 65535 - 2000 + Ticks_1mS;						
 420  014f be95          	ldw	x,_Ticks_1mS
 421  0151 1cf82f        	addw	x,#63535
 422  0154               LC001:
 423  0154 bf50          	ldw	_Timer+8,x
 424  0156 cc01f4        	jra	L301
 425  0159               L57:
 426                     ; 372 					if ( nDuty < 8 )
 428  0159 b602          	ld	a,_nDuty
 429  015b a108          	cp	a,#8
 430  015d 2402          	jruge	L501
 431                     ; 373 						nDuty ++;
 433  015f 3c02          	inc	_nDuty
 434  0161               L501:
 435                     ; 375 					if (iDuty < 7)
 437  0161 b69f          	ld	a,_iDuty
 438  0163 a107          	cp	a,#7
 439  0165 2404          	jruge	L701
 440                     ; 377 						iDuty++;
 442  0167 3c9f          	inc	_iDuty
 444  0169 2002          	jra	L111
 445  016b               L701:
 446                     ; 381 						iDuty = 0;
 448  016b 3f9f          	clr	_iDuty
 449  016d               L111:
 450                     ; 384 					sDuty -= Duty[iDuty];
 452  016d b69f          	ld	a,_iDuty
 453  016f 5f            	clrw	x
 454  0170 97            	ld	xl,a
 455  0171 e6a0          	ld	a,(_Duty,x)
 456  0173 5f            	clrw	x
 457  0174 97            	ld	xl,a
 458  0175 72b0009d      	subw	x,_sDuty
 459  0179 50            	negw	x
 460  017a bf9d          	ldw	_sDuty,x
 461                     ; 385 					Duty[iDuty] = Pwm.Duty;
 463  017c 5f            	clrw	x
 464  017d b69f          	ld	a,_iDuty
 465  017f 97            	ld	xl,a
 466  0180 b66a          	ld	a,_Pwm+10
 467  0182 e7a0          	ld	(_Duty,x),a
 468                     ; 386 					sDuty += Duty[iDuty]; //Drive.Step; 
 470  0184 5f            	clrw	x
 471  0185 b69f          	ld	a,_iDuty
 472  0187 97            	ld	xl,a
 473  0188 e6a0          	ld	a,(_Duty,x)
 474  018a bb9e          	add	a,_sDuty+1
 475  018c b79e          	ld	_sDuty+1,a
 476  018e 2402          	jrnc	L06
 477  0190 3c9d          	inc	_sDuty
 478  0192               L06:
 479                     ; 388 					mDuty = (sDuty / nDuty)*2 + 1;		// Round Up
 481  0192 be9d          	ldw	x,_sDuty
 482  0194 b602          	ld	a,_nDuty
 483  0196 62            	div	x,a
 484  0197 58            	sllw	x
 485  0198 5c            	incw	x
 486  0199 bf9b          	ldw	_mDuty,x
 487                     ; 389 					mDuty /= 2;
 489  019b 349b          	srl	_mDuty
 490  019d 369c          	rrc	_mDuty+1
 491                     ; 394 					if (mDuty <20)
 493  019f be9b          	ldw	x,_mDuty
 494  01a1 a30014        	cpw	x,#20
 495  01a4 2405          	jruge	L311
 496                     ; 395 					   mDuty = 20;
 498  01a6 ae0014        	ldw	x,#20
 499  01a9 bf9b          	ldw	_mDuty,x
 500  01ab               L311:
 501                     ; 396 					if (mDuty >180)
 503  01ab a300b5        	cpw	x,#181
 504  01ae 2505          	jrult	L511
 505                     ; 397 					  mDuty = 180; 
 507  01b0 ae00b4        	ldw	x,#180
 508  01b3 bf9b          	ldw	_mDuty,x
 509  01b5               L511:
 510                     ; 399 					disableInterrupts();		//****************************************************************
 513  01b5 9b            	sim	
 515                     ; 400 					mVal  =  (625u * (u32)mDuty);
 518  01b6 90ae0271      	ldw	y,#625
 519  01ba cd0000        	call	c_umul
 521  01bd ae0003        	ldw	x,#_mVal
 522  01c0 cd0000        	call	c_rtol
 524                     ; 401 					mVal /= (10u);
 526  01c3 cd0000        	call	c_ltor
 528  01c6 ae0000        	ldw	x,#L26
 529  01c9 ad43          	call	LC002
 531                     ; 402 					mVal -= 1250u ;
 533  01cb ae04e2        	ldw	x,#1250
 534  01ce bf02          	ldw	c_lreg+2,x
 535  01d0 5f            	clrw	x
 536  01d1 bf00          	ldw	c_lreg,x
 537  01d3 ae0003        	ldw	x,#_mVal
 538  01d6 cd0000        	call	c_lgsub
 540                     ; 403 					mVal = mVal /(u32)50u;
 542  01d9 cd0000        	call	c_ltor
 544  01dc ae0004        	ldw	x,#L46
 545  01df ad2d          	call	LC002
 547                     ; 404 					mVal += 1u;
 549  01e1 a601          	ld	a,#1
 550  01e3 cd0000        	call	c_lgadc
 552                     ; 405 					mVal /= 2u;
 554  01e6 3403          	srl	_mVal
 555  01e8 3604          	rrc	_mVal+1
 556  01ea 3605          	rrc	_mVal+2
 557  01ec 3606          	rrc	_mVal+3
 558                     ; 406 					enableInterrupts();			//*****************************************************************
 561  01ee 9a            	rim	
 563                     ; 408 					Drive.Step = (u8)mVal*2;
 566  01ef b606          	ld	a,_mVal+3
 567  01f1 48            	sll	a
 568  01f2 b789          	ld	_Drive+24,a
 569  01f4               L301:
 570                     ; 414 				MotorService();
 572  01f4 ad21          	call	_MotorService
 574                     ; 415 				Timer.Motor = Ticks_1mS;				
 576  01f6 be95          	ldw	x,_Ticks_1mS
 577  01f8 bf4a          	ldw	_Timer+2,x
 578  01fa               L37:
 579                     ; 417 			if ( Drive.Run == 1 )
 581  01fa b671          	ld	a,_Drive
 582  01fc a502          	bcp	a,#2
 584  01fe               L521:
 585                     ; 428 		while ( Diff ( tt, 50u ) == 0 )
 587  01fe ae0032        	ldw	x,#50
 588  0201 89            	pushw	x
 589  0202 beb5          	ldw	x,_tt
 590  0204 cd029c        	call	_Diff
 592  0207 4d            	tnz	a
 593  0208 85            	popw	x
 594  0209 27f3          	jreq	L521
 596  020b cc00af        	jra	L54
 597  020e               LC002:
 598  020e cd0000        	call	c_ludv
 600  0211 ae0003        	ldw	x,#_mVal
 601  0214 cc0000        	jp	c_rtol
 629                     ; 435 void MotorService()
 629                     ; 436 {
 630                     	switch	.text
 631  0217               _MotorService:
 635                     ; 442 			if ( Drive.Step > 205u )
 637  0217 b689          	ld	a,_Drive+24
 638  0219 a1ce          	cp	a,#206
 639  021b 2504          	jrult	L141
 640                     ; 443 				Drive.Step = 205u;
 642  021d a6cd          	ld	a,#205
 643  021f b789          	ld	_Drive+24,a
 644  0221               L141:
 645                     ; 444 			if ( Drive.Step < 20u )
 647  0221 a114          	cp	a,#20
 648  0223 2403          	jruge	L341
 649                     ; 445 				Drive.Step = 0u;
 651  0225 4f            	clr	a
 652  0226 b789          	ld	_Drive+24,a
 653  0228               L341:
 654                     ; 455 				if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
 656                     ; 459 						Drive.PreStep = Drive.Step;
 657                     ; 460 						StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 661                     ; 472 					Drive.PreStep = Drive.Step;
 663                     ; 473 					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );					
 668  0228 b78a          	ld	_Drive+25,a
 670  022a 4b00          	push	#0
 671  022c 5f            	clrw	x
 672  022d 97            	ld	xl,a
 673  022e cd0693        	call	_CPulse
 674  0231 cd0451        	call	_StartDriveOR
 675  0234 be95          	ldw	x,_Ticks_1mS
 676  0236 bf4a          	ldw	_Timer+2,x
 677  0238 84            	pop	a
 678                     ; 477 			Timer.Motor = Ticks_1mS;
 680                     ; 479 	}
 683  0239 81            	ret	
 710                     ; 482 void AdcService()
 710                     ; 483 {
 711                     	switch	.text
 712  023a               _AdcService:
 716                     ; 484 	if ( Diff ( Timer.Adc, 10u )== 1 )
 718  023a ae000a        	ldw	x,#10
 719  023d 89            	pushw	x
 720  023e be4c          	ldw	x,_Timer+4
 721  0240 ad5a          	call	_Diff
 723  0242 4a            	dec	a
 724  0243 85            	popw	x
 725  0244 2643          	jrne	L161
 726                     ; 486 			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
 728  0246 b65c          	ld	a,_Adc+10
 729  0248 5f            	clrw	x
 730  0249 97            	ld	xl,a
 731  024a e659          	ld	a,(_Adc+7,x)
 732  024c 5f            	clrw	x
 733  024d 97            	ld	xl,a
 734  024e 72b0005e      	subw	x,_Adc+12
 735  0252 50            	negw	x
 736  0253 bf5e          	ldw	_Adc+12,x
 737                     ; 487 			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
 739  0255 be52          	ldw	x,_Adc
 740  0257 54            	srlw	x
 741  0258 54            	srlw	x
 742  0259 b65c          	ld	a,_Adc+10
 743  025b 905f          	clrw	y
 744  025d 9097          	ld	yl,a
 745  025f 01            	rrwa	x,a
 746  0260 90e759        	ld	(_Adc+7,y),a
 747                     ; 488 			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
 749  0263 5f            	clrw	x
 750  0264 b65c          	ld	a,_Adc+10
 751  0266 97            	ld	xl,a
 752  0267 e659          	ld	a,(_Adc+7,x)
 753  0269 bb5f          	add	a,_Adc+13
 754  026b b75f          	ld	_Adc+13,a
 755  026d 2402          	jrnc	L011
 756  026f 3c5e          	inc	_Adc+12
 757  0271               L011:
 758                     ; 489 			Adc.Average = Adc.Sum /5;
 760  0271 be5e          	ldw	x,_Adc+12
 761  0273 a605          	ld	a,#5
 762  0275 62            	div	x,a
 763  0276 01            	rrwa	x,a
 764  0277 b75d          	ld	_Adc+11,a
 765                     ; 490 			if  (Adc.IdxAvg	>= 4 )
 767  0279 b65c          	ld	a,_Adc+10
 768  027b a104          	cp	a,#4
 769  027d 2504          	jrult	L361
 770                     ; 491 				Adc.IdxAvg = 0;
 772  027f 3f5c          	clr	_Adc+10
 774  0281 2002          	jra	L561
 775  0283               L361:
 776                     ; 493 				Adc.IdxAvg++;
 778  0283 3c5c          	inc	_Adc+10
 779  0285               L561:
 780                     ; 495 			Timer.Adc = Ticks_1mS;
 782  0285 be95          	ldw	x,_Ticks_1mS
 783  0287 bf4c          	ldw	_Timer+4,x
 784  0289               L161:
 785                     ; 497 }
 788  0289 81            	ret	
 831                     ; 504 u8 SAbs(u8 s1, u8 s2)
 831                     ; 505 {
 832                     	switch	.text
 833  028a               _SAbs:
 835  028a 89            	pushw	x
 836       00000000      OFST:	set	0
 839                     ; 506 	if (s1 > s2 )
 841  028b 9f            	ld	a,xl
 842  028c 1101          	cp	a,(OFST+1,sp)
 843  028e 2406          	jruge	L112
 844                     ; 507 		return s1 - s2;
 846  0290 9f            	ld	a,xl
 847  0291 1001          	sub	a,(OFST+1,sp)
 848  0293 40            	neg	a
 850  0294 2004          	jra	L411
 851  0296               L112:
 852                     ; 509 		return s2 - s1;
 854  0296 7b02          	ld	a,(OFST+2,sp)
 855  0298 1001          	sub	a,(OFST+1,sp)
 857  029a               L411:
 859  029a 85            	popw	x
 860  029b 81            	ret	
 914                     ; 513 u8  Diff( u16 time, u16 diff )
 914                     ; 514 {
 915                     	switch	.text
 916  029c               _Diff:
 918  029c 89            	pushw	x
 919  029d 89            	pushw	x
 920       00000002      OFST:	set	2
 923                     ; 516 	t0 = Ticks_1mS;
 925  029e be95          	ldw	x,_Ticks_1mS
 926  02a0 1f01          	ldw	(OFST-1,sp),x
 928                     ; 518 	if (time <= t0 )
 930  02a2 1e03          	ldw	x,(OFST+1,sp)
 931  02a4 1301          	cpw	x,(OFST-1,sp)
 932  02a6 2214          	jrugt	L342
 933                     ; 520 		Dif = t0 - time;
 935  02a8 1e01          	ldw	x,(OFST-1,sp)
 936  02aa 72f003        	subw	x,(OFST+1,sp)
 937  02ad bfb0          	ldw	_Dif,x
 938                     ; 521 		if ( ( t0 - time ) > diff ) 
 940  02af 1e01          	ldw	x,(OFST-1,sp)
 941  02b1 72f003        	subw	x,(OFST+1,sp)
 942  02b4 1307          	cpw	x,(OFST+5,sp)
 943                     ; 523 			return 1u;
 945  02b6 2217          	jrugt	LC004
 946  02b8               L542:
 947                     ; 527 			return 0u;
 950  02b8 4f            	clr	a
 952  02b9               L021:
 954  02b9 5b04          	addw	sp,#4
 955  02bb 81            	ret	
 956  02bc               L342:
 957                     ; 533 	if (time > t0 )
 959  02bc 1301          	cpw	x,(OFST-1,sp)
 960  02be 23f9          	jrule	L021
 961                     ; 535 		Dif = 0xffff - time + t0;
 963  02c0 aeffff        	ldw	x,#65535
 964  02c3 72f003        	subw	x,(OFST+1,sp)
 965  02c6 72fb01        	addw	x,(OFST-1,sp)
 966  02c9 bfb0          	ldw	_Dif,x
 967                     ; 536 		if ( ( 0xffff - time + t0  ) > diff ) 
 969  02cb 1307          	cpw	x,(OFST+5,sp)
 970  02cd 23e9          	jrule	L542
 971                     ; 538 			return 1u;
 973  02cf               LC004:
 975  02cf a601          	ld	a,#1
 977  02d1 20e6          	jra	L021
 978                     ; 542 			return 0u;
 980                     ; 545 }
1004                     ; 548 OnTimer_1S(void)
1004                     ; 549 {
1005                     	switch	.text
1006  02d3               _OnTimer_1S:
1010                     ; 551 }
1013  02d3 81            	ret	
1038                     ; 560 OnTimer_1mS(void)
1038                     ; 561 { 
1039                     	switch	.text
1040  02d4               _OnTimer_1mS:
1044                     ; 563 	Ticks_1mS++;
1046  02d4 be95          	ldw	x,_Ticks_1mS
1047  02d6 5c            	incw	x
1048  02d7 bf95          	ldw	_Ticks_1mS,x
1049                     ; 567 	if ( PowerDelay_1mS )
1051  02d9 be14          	ldw	x,_PowerDelay_1mS
1052  02db 2703          	jreq	L772
1053                     ; 568 		PowerDelay_1mS--;
1055  02dd 5a            	decw	x
1056  02de bf14          	ldw	_PowerDelay_1mS,x
1057  02e0               L772:
1058                     ; 569 }
1061  02e0 81            	ret	
1090                     	switch	.const
1091  0008               L041:
1092  0008 00000013      	dc.l	19
1093                     ; 572 void OnTimer4(void)
1093                     ; 573 {
1094                     	switch	.text
1095  02e1               _OnTimer4:
1099                     ; 574 	Adc_Config(  );
1101  02e1 cd075e        	call	L3_Adc_Config
1103                     ; 576 	Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
1105  02e4 4b10          	push	#16
1106  02e6 ae5005        	ldw	x,#20485
1107  02e9 cd0000        	call	_GPIO_ReadInputPin
1109  02ec 5b01          	addw	sp,#1
1110  02ee 4d            	tnz	a
1111  02ef 2603          	jrne	L231
1112  02f1 4c            	inc	a
1113  02f2 2001          	jra	L631
1114  02f4               L231:
1115  02f4 4f            	clr	a
1116  02f5               L631:
1117  02f5 b787          	ld	_Drive+22,a
1118                     ; 578 	if (  Ticks_50uS < 19 )
1120  02f7 ae0097        	ldw	x,#_Ticks_50uS
1121  02fa cd0000        	call	c_ltor
1123  02fd ae0008        	ldw	x,#L041
1124  0300 cd0000        	call	c_lcmp
1126  0303 240a          	jruge	L113
1127                     ; 579 		Ticks_50uS++;
1129  0305 ae0097        	ldw	x,#_Ticks_50uS
1130  0308 a601          	ld	a,#1
1131  030a cd0000        	call	c_lgadc
1134  030d 2007          	jra	L313
1135  030f               L113:
1136                     ; 582 		Ticks_50uS = 0;
1138  030f 5f            	clrw	x
1139  0310 bf99          	ldw	_Ticks_50uS+2,x
1140  0312 bf97          	ldw	_Ticks_50uS,x
1141                     ; 583 		OnTimer_1mS();
1143  0314 adbe          	call	_OnTimer_1mS
1145  0316               L313:
1146                     ; 587 	if ( Drive.Ticks > 0 )
1148  0316 be82          	ldw	x,_Drive+17
1149  0318 2703          	jreq	L513
1150                     ; 588 		Drive.Ticks--;
1152  031a 5a            	decw	x
1154  031b 200a          	jp	LC005
1155  031d               L513:
1156                     ; 589 	else if ( Drive.Enabled ) // &&  ( Drive.Ticks == 0 ) ) 
1158  031d 7201007107    	btjf	_Drive,#0,L713
1159                     ; 591 		DriveService();	
1161  0322 cd0558        	call	_DriveService
1163                     ; 592 		Drive.Ticks = Drive.Interval;
1165  0325 be80          	ldw	x,_Drive+15
1166  0327               LC005:
1167  0327 bf82          	ldw	_Drive+17,x
1168  0329               L713:
1169                     ; 594 }
1172  0329 81            	ret	
1198                     ; 596 void OnCaptureOVTim2(void)
1198                     ; 597 {
1199                     	switch	.text
1200  032a               _OnCaptureOVTim2:
1204                     ; 598 	if ( TIM2_GetITStatus( TIM2_IT_UPDATE)  != SET ) 
1206  032a a601          	ld	a,#1
1207  032c cd0000        	call	_TIM2_GetITStatus
1209  032f 4a            	dec	a
1210  0330 2701          	jreq	L333
1211                     ; 599 		return;
1214  0332 81            	ret	
1215  0333               L333:
1216                     ; 601 	if ( Pwm.CntOverflow < 0xff )
1218  0333 b66f          	ld	a,_Pwm+15
1219  0335 a1ff          	cp	a,#255
1220  0337 2402          	jruge	L533
1221                     ; 602 		Pwm.CntOverflow++;
1223  0339 3c6f          	inc	_Pwm+15
1224  033b               L533:
1225                     ; 604 	TIM2_ClearITPendingBit(TIM1_IT_UPDATE);
1227  033b a601          	ld	a,#1
1229                     ; 605 }
1232  033d cc0000        	jp	_TIM2_ClearITPendingBit
1262                     ; 625 void OnCaptureTim2(void)
1262                     ; 626 {
1263                     	switch	.text
1264  0340               _OnCaptureTim2:
1266  0340 5204          	subw	sp,#4
1267       00000004      OFST:	set	4
1270                     ; 627 	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
1272  0342 a602          	ld	a,#2
1273  0344 cd0000        	call	_TIM2_GetITStatus
1275  0347 4a            	dec	a
1276  0348 2703cc0429    	jrne	L573
1277                     ; 628 		return;
1279                     ; 630 	if ( Pwm.Edge == 0 ) 
1281  034d 7201006003cc  	btjt	_Pwm,#0,L153
1282                     ; 632 		Pwm.T2 = TIM2_GetCapture1();
1284  0355 cd0000        	call	_TIM2_GetCapture1
1286  0358 bf67          	ldw	_Pwm+7,x
1287                     ; 633 		TIM2_ClearITPendingBit(TIM1_IT_CC1);
1289  035a a602          	ld	a,#2
1290  035c cd0000        	call	_TIM2_ClearITPendingBit
1292                     ; 634 		Pwm.Edge = 1;
1294  035f 72100060      	bset	_Pwm,#0
1295                     ; 636 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
1295                     ; 637                TIM2_ICPSC_DIV8, 0x0) ;
1297  0363 4b00          	push	#0
1298  0365 4b0c          	push	#12
1299  0367 4b01          	push	#1
1300  0369 ae0044        	ldw	x,#68
1301  036c cd0000        	call	_TIM2_ICInit
1303  036f 5b03          	addw	sp,#3
1304                     ; 639 		if ( Pwm.T2 > Pwm.T1 ) 
1306  0371 be67          	ldw	x,_Pwm+7
1307  0373 b365          	cpw	x,_Pwm+5
1308  0375 2311          	jrule	L353
1309                     ; 641 			if ( Pwm.CntOverflow == 0 )
1311  0377 b66f          	ld	a,_Pwm+15
1312  0379 2606          	jrne	L553
1313                     ; 643 				Pwm.T4 = Pwm.T2 - Pwm.T1;
1315  037b 72b00065      	subw	x,_Pwm+5
1317  037f 2003          	jp	LC006
1318  0381               L553:
1319                     ; 647 				Pwm.T4 = 0xffff;
1321  0381 aeffff        	ldw	x,#65535
1322  0384               LC006:
1323  0384 bf6d          	ldw	_Pwm+13,x
1324  0386 2019          	jra	L163
1325  0388               L353:
1326                     ; 653 			if ( Pwm.CntOverflow == 1 )
1328  0388 b66f          	ld	a,_Pwm+15
1329  038a 4a            	dec	a
1330  038b 260d          	jrne	L363
1331                     ; 655 				Pwm.T4 = 0xffff - Pwm.T1 + Pwm.T2;
1333  038d aeffff        	ldw	x,#65535
1334  0390 72b00065      	subw	x,_Pwm+5
1335  0394 72bb0067      	addw	x,_Pwm+7
1337  0398 2003          	jra	L563
1338  039a               L363:
1339                     ; 659 				Pwm.T4 = 0xffff;
1341  039a aeffff        	ldw	x,#65535
1342  039d               L563:
1343  039d bf6d          	ldw	_Pwm+13,x
1344                     ; 661 			Pwm.CntOverflow = 0;
1346  039f 3f6f          	clr	_Pwm+15
1347  03a1               L163:
1348                     ; 667 		if ( Pwm.T3 == 0xffff || Pwm.T4 == 0xffff )
1350  03a1 be6b          	ldw	x,_Pwm+11
1351  03a3 5c            	incw	x
1352  03a4 2705          	jreq	L173
1354  03a6 be6d          	ldw	x,_Pwm+13
1355  03a8 5c            	incw	x
1356  03a9 2609          	jrne	L763
1357  03ab               L173:
1358                     ; 669 			Pwm.Duty = 0u;
1360  03ab 5f            	clrw	x
1361  03ac bf69          	ldw	_Pwm+9,x
1363  03ae               L373:
1364                     ; 677 		Timer.PwmUpdate = Ticks_1mS;		
1366  03ae be95          	ldw	x,_Ticks_1mS
1367  03b0 bf50          	ldw	_Timer+8,x
1369  03b2 2075          	jra	L573
1370  03b4               L763:
1371                     ; 673 			Pwm.Duty = ( Pwm.T3 * (uint32_t)400 / ( Pwm.T3 + Pwm.T4 ) ) + 1 ;
1373  03b4 be6b          	ldw	x,_Pwm+11
1374  03b6 72bb006d      	addw	x,_Pwm+13
1375  03ba cd0000        	call	c_uitolx
1377  03bd 96            	ldw	x,sp
1378  03be 5c            	incw	x
1379  03bf cd0000        	call	c_rtol
1382  03c2 be6b          	ldw	x,_Pwm+11
1383  03c4 90ae0190      	ldw	y,#400
1384  03c8 cd0000        	call	c_umul
1386  03cb 96            	ldw	x,sp
1387  03cc 5c            	incw	x
1388  03cd cd0000        	call	c_ludv
1390  03d0 a601          	ld	a,#1
1391  03d2 cd0000        	call	c_ladc
1393  03d5 be02          	ldw	x,c_lreg+2
1394  03d7 bf69          	ldw	_Pwm+9,x
1395                     ; 674 			Pwm.Duty /= 2;
1397  03d9 3469          	srl	_Pwm+9
1398  03db 366a          	rrc	_Pwm+10
1399  03dd 20cf          	jra	L373
1400  03df               L153:
1401                     ; 681 		Pwm.T1 = TIM2_GetCapture1();
1403  03df cd0000        	call	_TIM2_GetCapture1
1405  03e2 bf65          	ldw	_Pwm+5,x
1406                     ; 682 		TIM2_ClearITPendingBit(TIM1_IT_CC1);
1408  03e4 a602          	ld	a,#2
1409  03e6 cd0000        	call	_TIM2_ClearITPendingBit
1411                     ; 683 		Pwm.Edge = 0;	
1413  03e9 72110060      	bres	_Pwm,#0
1414                     ; 685 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
1414                     ; 686                TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
1416  03ed 4b00          	push	#0
1417  03ef 4b0c          	push	#12
1418  03f1 4b01          	push	#1
1419  03f3 5f            	clrw	x
1420  03f4 cd0000        	call	_TIM2_ICInit
1422  03f7 5b03          	addw	sp,#3
1423                     ; 688 		if ( Pwm.T1 > Pwm.T2 ) 
1425  03f9 be65          	ldw	x,_Pwm+5
1426  03fb b367          	cpw	x,_Pwm+7
1427  03fd 2311          	jrule	L773
1428                     ; 690 			if ( Pwm.CntOverflow == 0 )
1430  03ff b66f          	ld	a,_Pwm+15
1431  0401 2606          	jrne	L104
1432                     ; 692 				Pwm.T3 = Pwm.T1 - Pwm.T2;
1434  0403 72b00067      	subw	x,_Pwm+7
1436  0407 2003          	jp	LC007
1437  0409               L104:
1438                     ; 696 				Pwm.T3 = 0xffff;
1440  0409 aeffff        	ldw	x,#65535
1441  040c               LC007:
1442  040c bf6b          	ldw	_Pwm+11,x
1443  040e 2019          	jra	L573
1444  0410               L773:
1445                     ; 702 			if ( Pwm.CntOverflow == 1 )
1447  0410 b66f          	ld	a,_Pwm+15
1448  0412 4a            	dec	a
1449  0413 260d          	jrne	L704
1450                     ; 704 				Pwm.T3 = 0xffff - Pwm.T2 + Pwm.T1;
1452  0415 aeffff        	ldw	x,#65535
1453  0418 72b00067      	subw	x,_Pwm+7
1454  041c 72bb0065      	addw	x,_Pwm+5
1456  0420 2003          	jra	L114
1457  0422               L704:
1458                     ; 708 				Pwm.T3 = 0xffff;
1460  0422 aeffff        	ldw	x,#65535
1461  0425               L114:
1462  0425 bf6b          	ldw	_Pwm+11,x
1463                     ; 710 			Pwm.CntOverflow = 0;
1465  0427 3f6f          	clr	_Pwm+15
1466  0429               L573:
1467                     ; 714 }
1470  0429 5b04          	addw	sp,#4
1471  042b 81            	ret	
1495                     ; 718 void StopDrive(void)			//TROff()
1495                     ; 719 {
1496                     	switch	.text
1497  042c               _StopDrive:
1501                     ; 720 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1503  042c 4b40          	push	#64
1504  042e ae500a        	ldw	x,#20490
1505  0431 cd0000        	call	_GPIO_WriteLow
1507  0434 84            	pop	a
1508                     ; 721 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1510  0435 4b08          	push	#8
1511  0437 ae500a        	ldw	x,#20490
1512  043a cd0000        	call	_GPIO_WriteLow
1514  043d 84            	pop	a
1515                     ; 722 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1517  043e 4b80          	push	#128
1518  0440 ae500a        	ldw	x,#20490
1519  0443 cd0000        	call	_GPIO_WriteLow
1521  0446 84            	pop	a
1522                     ; 723 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
1524  0447 4b08          	push	#8
1525  0449 ae5000        	ldw	x,#20480
1526  044c cd0000        	call	_GPIO_WriteLow
1528  044f 84            	pop	a
1529                     ; 724 }
1532  0450 81            	ret	
1579                     ; 730 void StartDriveOR( uint16_t Target, uint8_t overrun )
1579                     ; 731 {
1580                     	switch	.text
1581  0451               _StartDriveOR:
1583  0451 89            	pushw	x
1584       00000000      OFST:	set	0
1587                     ; 739 	if ( Drive.Run ) return;
1589  0452 7202007106    	btjt	_Drive,#1,L612
1592                     ; 740 	if ( Drive.Position == Target ) return;
1594  0457 be72          	ldw	x,_Drive+1
1595  0459 1301          	cpw	x,(OFST+1,sp)
1596  045b 2602          	jrne	L744
1598  045d               L612:
1601  045d 85            	popw	x
1602  045e 81            	ret	
1603  045f               L744:
1604                     ; 742 	mStep[iStep]=Target;//Drive.Step;
1606  045f b607          	ld	a,_iStep
1607  0461 5f            	clrw	x
1608  0462 97            	ld	xl,a
1609  0463 58            	sllw	x
1610  0464 1601          	ldw	y,(OFST+1,sp)
1611  0466 ef08          	ldw	(_mStep,x),y
1612                     ; 744 	if (iStep<31)
1614  0468 a11f          	cp	a,#31
1615  046a 2404          	jruge	L154
1616                     ; 745 	  iStep ++;
1618  046c 3c07          	inc	_iStep
1620  046e 2002          	jra	L354
1621  0470               L154:
1622                     ; 747 		iStep = 0;	
1624  0470 3f07          	clr	_iStep
1625  0472               L354:
1626                     ; 750 	if ( Target == 0 )				//  goto origin
1628  0472 1e01          	ldw	x,(OFST+1,sp)
1629  0474 261c          	jrne	L554
1630                     ; 752 		Drive.Overrun =	0u;
1632  0476 5f            	clrw	x
1633  0477 bf76          	ldw	_Drive+5,x
1634                     ; 753 		Drive.ZeroOffset = CPulse( OVER_STEP );
1636  0479 ae001e        	ldw	x,#30
1637  047c cd0693        	call	_CPulse
1639  047f bf79          	ldw	_Drive+8,x
1640                     ; 755 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
1642  0481 be72          	ldw	x,_Drive+1
1643  0483 72bb0079      	addw	x,_Drive+8
1644  0487 bf72          	ldw	_Drive+1,x
1645                     ; 756 		Drive.Target = 0u;
1647  0489 5f            	clrw	x
1648  048a bf74          	ldw	_Drive+3,x
1649                     ; 758 		Drive.Dir = nMotorClose;		// 0;
1651  048c 721b0071      	bres	_Drive,#5
1653  0490 202c          	jra	L754
1654  0492               L554:
1655                     ; 765 		if (Drive.Position >= Target)		// Closing
1657  0492 be72          	ldw	x,_Drive+1
1658  0494 1301          	cpw	x,(OFST+1,sp)
1659  0496 250f          	jrult	L164
1660                     ; 767 			Drive.Overrun =	0u;
1662  0498 5f            	clrw	x
1663  0499 bf76          	ldw	_Drive+5,x
1664                     ; 769 			Drive.Dir = nMotorClose;
1666  049b 721b0071      	bres	_Drive,#5
1667                     ; 770 			Drive.Overrun2 = 0u;
1669  049f 3f78          	clr	_Drive+7
1670                     ; 771 			Drive.Target = Target;
1672  04a1 1e01          	ldw	x,(OFST+1,sp)
1673  04a3 bf74          	ldw	_Drive+3,x
1675  04a5 2017          	jra	L754
1676  04a7               L164:
1677                     ; 777 			Drive.Dir = nMotorOpen;	//1;
1679  04a7 721a0071      	bset	_Drive,#5
1680                     ; 786 				Drive.Overrun2 = overrun;		//100;
1682  04ab 7b05          	ld	a,(OFST+5,sp)
1683  04ad b778          	ld	_Drive+7,a
1684                     ; 787 				Drive.Target = Target + overrun;	//100;	
1686  04af 7b01          	ld	a,(OFST+1,sp)
1687  04b1 97            	ld	xl,a
1688  04b2 7b02          	ld	a,(OFST+2,sp)
1689  04b4 1b05          	add	a,(OFST+5,sp)
1690  04b6 2401          	jrnc	L412
1691  04b8 5c            	incw	x
1692  04b9               L412:
1693  04b9 b775          	ld	_Drive+4,a
1694  04bb 9f            	ld	a,xl
1695  04bc b774          	ld	_Drive+3,a
1696  04be               L754:
1697                     ; 792 	Drive.Run = TRUE;
1699  04be 72120071      	bset	_Drive,#1
1700                     ; 793 	Drive.Ticks = Drive.Interval;
1702  04c2 be80          	ldw	x,_Drive+15
1703  04c4 bf82          	ldw	_Drive+17,x
1704                     ; 794 }
1706  04c6 2095          	jra	L612
1764                     ; 800 void MotorStep(MOTOR_DIR Dir)
1764                     ; 801 {
1765                     	switch	.text
1766  04c8               _MotorStep:
1770                     ; 802 	if ( Dir == nMotorClose )
1772  04c8 4d            	tnz	a
1773  04c9 2627          	jrne	L125
1774                     ; 804 		if ( Drive.Position != 0 ) 
1776  04cb be72          	ldw	x,_Drive+1
1777  04cd 270d          	jreq	L325
1778                     ; 806 			Drive.Position--;
1780  04cf 5a            	decw	x
1781  04d0 bf72          	ldw	_Drive+1,x
1782                     ; 807 			if ( Drive.NormalOpen )
1784  04d2 b688          	ld	a,_Drive+23
1785  04d4 2704          	jreq	L525
1786                     ; 808 				Drive.Phase++;   // NC
1788  04d6 3c7b          	inc	_Drive+10
1790  04d8 2002          	jra	L325
1791  04da               L525:
1792                     ; 811 				Drive.Phase--;	//NC
1794  04da 3a7b          	dec	_Drive+10
1795  04dc               L325:
1796                     ; 815 		if ( Drive.Position == 0 ) 
1798  04dc be72          	ldw	x,_Drive+1
1799  04de 2643          	jrne	L335
1800                     ; 818 			Drive.Overrun = 0u;
1802  04e0 5f            	clrw	x
1803  04e1 bf76          	ldw	_Drive+5,x
1804                     ; 819 			Drive.Run = FALSE;
1806  04e3 72130071      	bres	_Drive,#1
1807                     ; 820 			Drive.ZeroOffset = 0u;
1809  04e7 bf79          	ldw	_Drive+8,x
1810                     ; 821 			Drive.Position = 0u;
1812  04e9 bf72          	ldw	_Drive+1,x
1813                     ; 822 			Drive.Target = 0u;
1815  04eb bf74          	ldw	_Drive+3,x
1816                     ; 823 			StopDrive();	
1818  04ed cd042c        	call	_StopDrive
1820  04f0 2031          	jra	L335
1821  04f2               L125:
1822                     ; 829 			Drive.Position++;
1824  04f2 be72          	ldw	x,_Drive+1
1825  04f4 5c            	incw	x
1826  04f5 bf72          	ldw	_Drive+1,x
1827                     ; 831 		if ( Drive.NormalOpen )
1829  04f7 b688          	ld	a,_Drive+23
1830  04f9 2704          	jreq	L535
1831                     ; 832 				Drive.Phase--;
1833  04fb 3a7b          	dec	_Drive+10
1835  04fd 2002          	jra	L735
1836  04ff               L535:
1837                     ; 834 				Drive.Phase++;
1839  04ff 3c7b          	inc	_Drive+10
1840  0501               L735:
1841                     ; 837 		if ( Drive.Origin ) 
1843  0501 b687          	ld	a,_Drive+22
1844  0503 2708          	jreq	L145
1845                     ; 839 			Drive.ORGPosition = Drive.Position;
1847  0505 bf7e          	ldw	_Drive+13,x
1848                     ; 840 			Drive.LastOrigin = TRUE;
1850  0507 72160071      	bset	_Drive,#3
1852  050b 2016          	jra	L335
1853  050d               L145:
1854                     ; 843 			if ( Drive.LastOrigin )
1856  050d 7207007111    	btjf	_Drive,#3,L335
1857                     ; 845 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1859  0512 be7e          	ldw	x,_Drive+13
1860  0514 1d0028        	subw	x,#40
1861  0517 bf7c          	ldw	_Drive+11,x
1862                     ; 846 				if ( Drive.MaxOverrun > OVERRUN )
1864  0519 a3012d        	cpw	x,#301
1865  051c 2505          	jrult	L335
1866                     ; 847 					Drive.MaxOverrun = OVERRUN;				
1868  051e ae012c        	ldw	x,#300
1869  0521 bf7c          	ldw	_Drive+11,x
1870  0523               L335:
1871                     ; 852 	if ( !Drive.Run ) return;
1873  0523 7202007101    	btjt	_Drive,#1,L155
1877  0528 81            	ret	
1878  0529               L155:
1879                     ; 853 	if ( !Drive.Enabled ) return;
1881  0529 7200007101    	btjt	_Drive,#0,L355
1885  052e 81            	ret	
1886  052f               L355:
1887                     ; 854 	switch ( Drive.ExcitationType )
1889  052f b686          	ld	a,_Drive+21
1890  0531 4a            	dec	a
1891  0532 2602          	jrne	L755
1894                     ; 857 		case 0:
1894                     ; 858 			//Excitation_1Phase();	
1894                     ; 859 			break;
1896                     ; 860 		case 1:
1896                     ; 861 			Excitation_12Phase();
1898  0534 ad65          	call	_Excitation_12Phase
1900                     ; 862 			break;
1902                     ; 863 		case 2:
1902                     ; 864 			//Excitation_2Phase();
1902                     ; 865 			break;
1904  0536               L755:
1905                     ; 870 }
1908  0536 81            	ret	
1934                     ; 875 void MotorClose(void)
1934                     ; 876 {
1935                     	switch	.text
1936  0537               _MotorClose:
1940                     ; 877 	if ( Drive.Origin )   		// Hall IC Sensing 
1942  0537 b687          	ld	a,_Drive+22
1943  0539 2719          	jreq	L175
1944                     ; 879 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1946  053b be76          	ldw	x,_Drive+5
1947  053d b37c          	cpw	x,_Drive+11
1948  053f 2510          	jrult	L375
1949                     ; 881 			Drive.Target = 0u;
1951  0541 5f            	clrw	x
1952  0542 bf74          	ldw	_Drive+3,x
1953                     ; 882 			Drive.Position = 0u;
1955  0544 bf72          	ldw	_Drive+1,x
1956                     ; 883 			Drive.Overrun = 0u;
1958  0546 bf76          	ldw	_Drive+5,x
1959                     ; 884 			Drive.ZeroOffset = 0u;
1961  0548 bf79          	ldw	_Drive+8,x
1962                     ; 885 			Drive.Run = FALSE;			
1964  054a 72130071      	bres	_Drive,#1
1965                     ; 886 			StopDrive();
1970  054e cc042c        	jp	_StopDrive
1971  0551               L375:
1972                     ; 890 			Drive.Overrun++;
1974  0551 5c            	incw	x
1975  0552 bf76          	ldw	_Drive+5,x
1976                     ; 891 			MotorStep(nMotorClose);
1978  0554               L175:
1979                     ; 895 		MotorStep(nMotorClose);		// move 1 step close
1982  0554 4f            	clr	a
1984                     ; 896 }
1987  0555 cc04c8        	jp	_MotorStep
2014                     ; 901 void DriveService(void)
2014                     ; 902 {
2015                     	switch	.text
2016  0558               _DriveService:
2018  0558 89            	pushw	x
2019       00000002      OFST:	set	2
2022                     ; 912 	if ( ! Drive.Run ) 
2024  0559 7202007102    	btjt	_Drive,#1,L116
2025                     ; 914 		StopDrive();
2027                     ; 915 		return;	//when Drive is stop 
2029  055e 2035          	jp	LC009
2030  0560               L116:
2031                     ; 922 	if ( Drive.Target > Drive.Position )
2033  0560 be74          	ldw	x,_Drive+3
2034  0562 b372          	cpw	x,_Drive+1
2035  0564 2307          	jrule	L316
2036                     ; 923 	 	MotorStep(nMotorOpen);
2038  0566 a601          	ld	a,#1
2039  0568 cd04c8        	call	_MotorStep
2042  056b 202b          	jra	L516
2043  056d               L316:
2044                     ; 924 	else if ( Drive.Target < Drive.Position )
2046  056d b372          	cpw	x,_Drive+1
2047  056f 2404          	jruge	L716
2048                     ; 925 		MotorClose( );
2050  0571 adc4          	call	_MotorClose
2053  0573 2023          	jra	L516
2054  0575               L716:
2055                     ; 926 	else if ( Drive.Target ) 	// on target position
2057  0575 be74          	ldw	x,_Drive+3
2058  0577 2713          	jreq	L526
2059                     ; 928 			if ( Drive.Overrun2 )
2061  0579 b678          	ld	a,_Drive+7
2062  057b 270f          	jreq	L526
2063                     ; 930 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
2065  057d 5f            	clrw	x
2066  057e 97            	ld	xl,a
2067  057f 1f01          	ldw	(OFST-1,sp),x
2069  0581 be74          	ldw	x,_Drive+3
2070  0583 72f001        	subw	x,(OFST-1,sp)
2071  0586 bf74          	ldw	_Drive+3,x
2072                     ; 931 				Drive.Overrun2 = 0u;
2074  0588 3f78          	clr	_Drive+7
2076  058a 200c          	jra	L516
2077  058c               L526:
2078                     ; 935 				Drive.ZeroOffset = 0u;
2079                     ; 936 				Drive.Overrun = 0u;
2080                     ; 937 				Drive.Run = FALSE;
2081                     ; 938 				StopDrive();		
2083                     ; 944 			Drive.ZeroOffset = 0u;
2085                     ; 945 			Drive.Overrun = 0u;
2087                     ; 946 			Drive.Run = FALSE;
2090  058c 5f            	clrw	x
2091  058d bf79          	ldw	_Drive+8,x
2093  058f bf76          	ldw	_Drive+5,x
2095  0591 72130071      	bres	_Drive,#1
2096                     ; 947 			StopDrive();	
2098  0595               LC009:
2101  0595 cd042c        	call	_StopDrive
2103  0598               L516:
2104                     ; 949 }
2107  0598 85            	popw	x
2108  0599 81            	ret	
2131                     ; 952 void Excitation_2Phase( void )
2131                     ; 953 {
2132                     	switch	.text
2133  059a               _Excitation_2Phase:
2137                     ; 1012 }
2140  059a 81            	ret	
2166                     ; 1015 void Excitation_12Phase( void )
2166                     ; 1016 {
2167                     	switch	.text
2168  059b               _Excitation_12Phase:
2172                     ; 1018 	switch (Drive.Phase%8)
2174  059b b67b          	ld	a,_Drive+10
2175  059d a407          	and	a,#7
2177                     ; 1069 		default:
2177                     ; 1070 			break;
2178  059f 2716          	jreq	L346
2179  05a1 4a            	dec	a
2180  05a2 271d          	jreq	L546
2181  05a4 4a            	dec	a
2182  05a5 272d          	jreq	L746
2183  05a7 4a            	dec	a
2184  05a8 273f          	jreq	L156
2185  05aa 4a            	dec	a
2186  05ab 2748          	jreq	L356
2187  05ad 4a            	dec	a
2188  05ae 2753          	jreq	L556
2189  05b0 4a            	dec	a
2190  05b1 276e          	jreq	L756
2191  05b3 4a            	dec	a
2192  05b4 2775          	jreq	L166
2194  05b6 81            	ret	
2195  05b7               L346:
2196                     ; 1020 		case 0:
2196                     ; 1021 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2198  05b7 4b40          	push	#64
2199  05b9 ae500a        	ldw	x,#20490
2200  05bc cd0000        	call	_GPIO_WriteHigh
2202                     ; 1022 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2204                     ; 1023 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2206                     ; 1024 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2208                     ; 1025 			break;
2210  05bf 2008          	jp	LC014
2211  05c1               L546:
2212                     ; 1026 		case 1:
2212                     ; 1027 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2214  05c1 4b40          	push	#64
2215  05c3 ae500a        	ldw	x,#20490
2216  05c6 cd0000        	call	_GPIO_WriteLow
2218                     ; 1028 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2220  05c9               LC014:
2221  05c9 84            	pop	a
2223  05ca 4b08          	push	#8
2224  05cc ae500a        	ldw	x,#20490
2225  05cf cd0000        	call	_GPIO_WriteHigh
2227                     ; 1029 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2229                     ; 1030 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2231                     ; 1031 			break;		
2233  05d2 2068          	jp	LC013
2234  05d4               L746:
2235                     ; 1032 		case 2:
2235                     ; 1033 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2237  05d4 ad7a          	call	LC018
2238                     ; 1034 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2240  05d6 4b08          	push	#8
2241  05d8 ae500a        	ldw	x,#20490
2242  05db cd0000        	call	_GPIO_WriteHigh
2244                     ; 1035 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2246  05de               LC015:
2247  05de 84            	pop	a
2249  05df 4b80          	push	#128
2250  05e1 ae500a        	ldw	x,#20490
2251  05e4 cd0000        	call	_GPIO_WriteHigh
2253                     ; 1036 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2255                     ; 1037 			break;
2257  05e7 205c          	jp	LC012
2258  05e9               L156:
2259                     ; 1038 		case 3:
2259                     ; 1039 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2261  05e9 ad65          	call	LC018
2262                     ; 1040 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2264  05eb 4b08          	push	#8
2265  05ed ae500a        	ldw	x,#20490
2266  05f0 cd0000        	call	_GPIO_WriteLow
2268                     ; 1041 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2270                     ; 1042 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2272                     ; 1043 			break;
2274  05f3 20e9          	jp	LC015
2275  05f5               L356:
2276                     ; 1044 		case 4:
2276                     ; 1045 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2278  05f5 ad59          	call	LC018
2279                     ; 1046 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2281  05f7 ad61          	call	LC019
2282                     ; 1047 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2284  05f9 4b80          	push	#128
2285  05fb ae500a        	ldw	x,#20490
2286  05fe cd0000        	call	_GPIO_WriteHigh
2288                     ; 1048 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2290                     ; 1049 			break;
2292  0601 2013          	jp	LC016
2293  0603               L556:
2294                     ; 1050 		case 5: 
2294                     ; 1051 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2296  0603 4b40          	push	#64
2297  0605 ae500a        	ldw	x,#20490
2298  0608 cd0000        	call	_GPIO_WriteLow
2300                     ; 1052 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2303                     ; 1053 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2305  060b               LC017:
2306  060b 84            	pop	a
2308  060c ad4c          	call	LC019
2310  060e 4b80          	push	#128
2311  0610 ae500a        	ldw	x,#20490
2312  0613 cd0000        	call	_GPIO_WriteLow
2314                     ; 1054 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2316  0616               LC016:
2317  0616 84            	pop	a
2320  0617 4b08          	push	#8
2321  0619 ae5000        	ldw	x,#20480
2322  061c cd0000        	call	_GPIO_WriteHigh
2324                     ; 1055 			break;
2326  061f 202d          	jp	LC011
2327  0621               L756:
2328                     ; 1056 		case 6:  
2328                     ; 1057 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2330  0621 4b40          	push	#64
2331  0623 ae500a        	ldw	x,#20490
2332  0626 cd0000        	call	_GPIO_WriteHigh
2334                     ; 1058 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2336                     ; 1059 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2338                     ; 1060 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2340                     ; 1061 			break;
2342  0629 20e0          	jp	LC017
2343  062b               L166:
2344                     ; 1062 		case 7:
2344                     ; 1063 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2346  062b 4b40          	push	#64
2347  062d ae500a        	ldw	x,#20490
2348  0630 cd0000        	call	_GPIO_WriteHigh
2350  0633 84            	pop	a
2351                     ; 1064 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2353  0634 4b08          	push	#8
2354  0636 ae500a        	ldw	x,#20490
2355  0639 cd0000        	call	_GPIO_WriteLow
2357                     ; 1065 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2359  063c               LC013:
2360  063c 84            	pop	a
2363  063d 4b80          	push	#128
2364  063f ae500a        	ldw	x,#20490
2365  0642 cd0000        	call	_GPIO_WriteLow
2367                     ; 1066 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2369  0645               LC012:
2370  0645 84            	pop	a
2375  0646 4b08          	push	#8
2376  0648 ae5000        	ldw	x,#20480
2377  064b cd0000        	call	_GPIO_WriteLow
2379  064e               LC011:
2380  064e 84            	pop	a
2381                     ; 1067 			break;
2383                     ; 1069 		default:
2383                     ; 1070 			break;
2385                     ; 1073 }
2388  064f 81            	ret	
2389  0650               LC018:
2390  0650 4b40          	push	#64
2391  0652 ae500a        	ldw	x,#20490
2392  0655 cd0000        	call	_GPIO_WriteLow
2394  0658 84            	pop	a
2395  0659 81            	ret	
2396  065a               LC019:
2397  065a 4b08          	push	#8
2398  065c ae500a        	ldw	x,#20490
2399  065f cd0000        	call	_GPIO_WriteLow
2401  0662 84            	pop	a
2402  0663 81            	ret	
2425                     ; 1075 void Excitation_1Phase( void )
2425                     ; 1076 {
2426                     	switch	.text
2427  0664               _Excitation_1Phase:
2431                     ; 1113 }
2434  0664 81            	ret	
2477                     	switch	.const
2478  000c               L463:
2479  000c 00000a28      	dc.l	2600
2480                     ; 1140 uint16_t CStep( uint16_t pulse )
2480                     ; 1141 {
2481                     	switch	.text
2482  0665               _CStep:
2484  0665 5204          	subw	sp,#4
2485       00000004      OFST:	set	4
2488                     ; 1145 	i = (uint32_t) pulse * 200u / (2600UL);
2490  0667 a6c8          	ld	a,#200
2491  0669 cd0000        	call	c_cmulx
2493  066c ae000c        	ldw	x,#L463
2494  066f cd0000        	call	c_ludv
2496  0672 96            	ldw	x,sp
2497  0673 5c            	incw	x
2498  0674 cd0000        	call	c_rtol
2501                     ; 1146 	i = (i+1)/2;   				// Round up  20150925
2503  0677 96            	ldw	x,sp
2504  0678 5c            	incw	x
2505  0679 cd0000        	call	c_ltor
2507  067c a601          	ld	a,#1
2508  067e cd0000        	call	c_ladc
2510  0681 3400          	srl	c_lreg
2511  0683 3601          	rrc	c_lreg+1
2512  0685 3602          	rrc	c_lreg+2
2513  0687 96            	ldw	x,sp
2514  0688 3603          	rrc	c_lreg+3
2515  068a 5c            	incw	x
2516  068b cd0000        	call	c_rtol
2519                     ; 1147 	return (uint16_t) i;
2521  068e 1e03          	ldw	x,(OFST-1,sp)
2524  0690 5b04          	addw	sp,#4
2525  0692 81            	ret	
2568                     ; 1151 uint16_t CPulse( uint16_t step )
2568                     ; 1152 {
2569                     	switch	.text
2570  0693               _CPulse:
2572  0693 89            	pushw	x
2573       00000002      OFST:	set	2
2576                     ; 1156 		i= (uint32_t) step *(26UL);  // 20180509  change to 5200 pulse
2578  0694 90ae001a      	ldw	y,#26
2579  0698 cd0000        	call	c_imul
2582                     ; 1158 	return (uint16_t) i;
2586  069b 5b02          	addw	sp,#2
2587  069d 81            	ret	
2616                     ; 1169 void Clock_Config(void)
2616                     ; 1170 {
2617                     	switch	.text
2618  069e               _Clock_Config:
2622                     ; 1172 	CLK_DeInit();
2624  069e cd0000        	call	_CLK_DeInit
2626                     ; 1173 	CLK_HSICmd(ENABLE);
2628  06a1 a601          	ld	a,#1
2629  06a3 cd0000        	call	_CLK_HSICmd
2631                     ; 1174 	CLK_LSICmd(DISABLE);
2633  06a6 4f            	clr	a
2634  06a7 cd0000        	call	_CLK_LSICmd
2636                     ; 1175 	CLK_HSECmd(DISABLE);
2638  06aa 4f            	clr	a
2639  06ab cd0000        	call	_CLK_HSECmd
2641                     ; 1177 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2643  06ae 4f            	clr	a
2644  06af cd0000        	call	_CLK_HSIPrescalerConfig
2646                     ; 1178 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2648  06b2 a680          	ld	a,#128
2650                     ; 1179 }
2653  06b4 cc0000        	jp	_CLK_SYSCLKConfig
2678                     ; 1182 void Gpio_Config(void)
2678                     ; 1183 {
2679                     	switch	.text
2680  06b7               _Gpio_Config:
2684                     ; 1185   GPIO_Init( _LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2686  06b7 4be0          	push	#224
2687  06b9 4b04          	push	#4
2688  06bb ae5000        	ldw	x,#20480
2689  06be cd0000        	call	_GPIO_Init
2691  06c1 85            	popw	x
2692                     ; 1189 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2694  06c2 4be0          	push	#224
2695  06c4 4b40          	push	#64
2696  06c6 ae500a        	ldw	x,#20490
2697  06c9 cd0000        	call	_GPIO_Init
2699  06cc 85            	popw	x
2700                     ; 1190 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2702  06cd 4be0          	push	#224
2703  06cf 4b80          	push	#128
2704  06d1 ae500a        	ldw	x,#20490
2705  06d4 cd0000        	call	_GPIO_Init
2707  06d7 85            	popw	x
2708                     ; 1191 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2710  06d8 4be0          	push	#224
2711  06da 4b08          	push	#8
2712  06dc ae500a        	ldw	x,#20490
2713  06df cd0000        	call	_GPIO_Init
2715  06e2 85            	popw	x
2716                     ; 1192 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2718  06e3 4be0          	push	#224
2719  06e5 4b08          	push	#8
2720  06e7 ae5000        	ldw	x,#20480
2721  06ea cd0000        	call	_GPIO_Init
2723  06ed 85            	popw	x
2724                     ; 1194 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2726  06ee 4b40          	push	#64
2727  06f0 ae500a        	ldw	x,#20490
2728  06f3 cd0000        	call	_GPIO_WriteLow
2730  06f6 84            	pop	a
2731                     ; 1195 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2733  06f7 4b08          	push	#8
2734  06f9 ae500a        	ldw	x,#20490
2735  06fc cd0000        	call	_GPIO_WriteLow
2737  06ff 84            	pop	a
2738                     ; 1196 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2740  0700 4b80          	push	#128
2741  0702 ae500a        	ldw	x,#20490
2742  0705 cd0000        	call	_GPIO_WriteLow
2744  0708 84            	pop	a
2745                     ; 1197 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2747  0709 4b08          	push	#8
2748  070b ae5000        	ldw	x,#20480
2749  070e cd0000        	call	_GPIO_WriteLow
2751  0711 84            	pop	a
2752                     ; 1200   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2754  0712 4b00          	push	#0
2755  0714 4b10          	push	#16
2756  0716 ae5005        	ldw	x,#20485
2757  0719 cd0000        	call	_GPIO_Init
2759  071c 85            	popw	x
2760                     ; 1203 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
2762  071d 4b00          	push	#0
2763  071f 4b04          	push	#4
2764  0721 ae500f        	ldw	x,#20495
2765  0724 cd0000        	call	_GPIO_Init
2767  0727 85            	popw	x
2768                     ; 1205 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2770  0728 4b00          	push	#0
2771  072a 4b10          	push	#16
2772  072c ae500f        	ldw	x,#20495
2773  072f cd0000        	call	_GPIO_Init
2775  0732 85            	popw	x
2776                     ; 1207 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2778  0733 4b00          	push	#0
2779  0735 4b10          	push	#16
2780  0737 ae500a        	ldw	x,#20490
2781  073a cd0000        	call	_GPIO_Init
2783  073d 85            	popw	x
2784                     ; 1208 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
2786  073e 4b00          	push	#0
2787  0740 4b08          	push	#8
2788  0742 ae500f        	ldw	x,#20495
2789  0745 cd0000        	call	_GPIO_Init
2791  0748 85            	popw	x
2792                     ; 1210 }
2795  0749 81            	ret	
2822                     ; 1263 void Timer4_Config(void)
2822                     ; 1264 {
2823                     	switch	.text
2824  074a               L5_Timer4_Config:
2828                     ; 1265   TIM4_DeInit();
2830  074a cd0000        	call	_TIM4_DeInit
2832                     ; 1271 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
2834  074d ae0432        	ldw	x,#1074
2835  0750 cd0000        	call	_TIM4_TimeBaseInit
2837                     ; 1274   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2839  0753 ae0101        	ldw	x,#257
2840  0756 cd0000        	call	_TIM4_ITConfig
2842                     ; 1277   TIM4_Cmd(ENABLE);
2844  0759 a601          	ld	a,#1
2846                     ; 1278 }
2849  075b cc0000        	jp	_TIM4_Cmd
2877                     ; 1281 static void Adc_Config( void )
2877                     ; 1282 {
2878                     	switch	.text
2879  075e               L3_Adc_Config:
2883                     ; 1284 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
2885  075e cd0000        	call	_ADC1_GetConversionValue
2887  0761 b658          	ld	a,_Adc+6
2888  0763 905f          	clrw	y
2889  0765 9097          	ld	yl,a
2890  0767 9058          	sllw	y
2891  0769 90ef52        	ldw	(_Adc,y),x
2892                     ; 1285 	ADC1_DeInit();
2894  076c cd0000        	call	_ADC1_DeInit
2896                     ; 1287 	switch (Adc.Idx)
2898  076f b658          	ld	a,_Adc+6
2900                     ; 1309 			break;
2901  0771 2708          	jreq	L5001
2902  0773 4a            	dec	a
2903  0774 271f          	jreq	L7001
2904  0776 4a            	dec	a
2905  0777 2736          	jreq	L1101
2906                     ; 1307 		default:
2906                     ; 1308 			Adc.Idx = 0;
2907                     ; 1309 			break;
2909  0779 2048          	jp	LC020
2910  077b               L5001:
2911                     ; 1289 		case 0:
2911                     ; 1290 		  
2911                     ; 1291 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
2911                     ; 1292 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
2913  077b 4b00          	push	#0
2914  077d 4b03          	push	#3
2915  077f 4b08          	push	#8
2916  0781 4b00          	push	#0
2917  0783 4b00          	push	#0
2918  0785 4b00          	push	#0
2919  0787 ae0003        	ldw	x,#3
2920  078a cd0000        	call	_ADC1_Init
2922  078d 5b06          	addw	sp,#6
2923                     ; 1293 			Adc.Idx = 1;
2925  078f 35010058      	mov	_Adc+6,#1
2926                     ; 1294 			break;
2928  0793 2030          	jra	L7201
2929  0795               L7001:
2930                     ; 1295 		case 1:
2930                     ; 1296 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
2930                     ; 1297 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
2932  0795 4b00          	push	#0
2933  0797 4b04          	push	#4
2934  0799 4b08          	push	#8
2935  079b 4b00          	push	#0
2936  079d 4b00          	push	#0
2937  079f 4b00          	push	#0
2938  07a1 ae0004        	ldw	x,#4
2939  07a4 cd0000        	call	_ADC1_Init
2941  07a7 5b06          	addw	sp,#6
2942                     ; 1298 			Adc.Idx = 2;
2944  07a9 35020058      	mov	_Adc+6,#2
2945                     ; 1299 			break;
2947  07ad 2016          	jra	L7201
2948  07af               L1101:
2949                     ; 1301 		case 2:
2949                     ; 1302 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
2949                     ; 1303 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
2951  07af 4b00          	push	#0
2952  07b1 4b02          	push	#2
2953  07b3 4b08          	push	#8
2954  07b5 4b00          	push	#0
2955  07b7 4b00          	push	#0
2956  07b9 4b00          	push	#0
2957  07bb ae0002        	ldw	x,#2
2958  07be cd0000        	call	_ADC1_Init
2960  07c1 5b06          	addw	sp,#6
2961                     ; 1304 			Adc.Idx = 0;
2963  07c3               LC020:
2965  07c3 3f58          	clr	_Adc+6
2966                     ; 1305 			break;
2968  07c5               L7201:
2969                     ; 1312 		ADC1_StartConversion();		
2972                     ; 1313 }
2975  07c5 cc0000        	jp	_ADC1_StartConversion
3019                     ; 1328 void assert_failed(u8* file, u32 line)
3019                     ; 1329 {
3020                     	switch	.text
3021  07c8               _assert_failed:
3023  07c8 88            	push	a
3024       00000001      OFST:	set	1
3027  07c9               L3501:
3028                     ; 1338 	i = i++;
3030  07c9 0c01          	inc	(OFST+0,sp)
3032  07cb 6b01          	ld	(OFST+0,sp),a
3035  07cd 20fa          	jra	L3501
3679                     	xdef	_MotorClose
3680                     	xdef	_MotorStep
3681                     	xdef	_OnTimer_1mS
3682                     	switch	.ubsct
3683  0000               _pos2:
3684  0000 00            	ds.b	1
3685                     	xdef	_pos2
3686  0001               _pos:
3687  0001 0000          	ds.b	2
3688                     	xdef	_pos
3689                     	xdef	_OnTimer_1S
3690                     	xdef	_main
3691  0003               _mVal:
3692  0003 00000000      	ds.b	4
3693                     	xdef	_mVal
3694  0007               _iStep:
3695  0007 00            	ds.b	1
3696                     	xdef	_iStep
3697  0008               _mStep:
3698  0008 000000000000  	ds.b	64
3699                     	xdef	_mStep
3700                     	xdef	_min
3701                     	xdef	_MotorService
3702                     	xdef	_AdcService
3703                     	xdef	_SAbs
3704                     	xdef	_Diff
3705                     	xdef	_Gpio_Config
3706                     	xdef	_Clock_Config
3707                     	xdef	_OnCaptureOVTim2
3708                     	xdef	_OnCaptureTim2
3709                     	xdef	_OnTimer4
3710                     	xdef	_StopDrive
3711                     	xdef	_StartDriveOR
3712                     	xdef	_DriveService
3713                     	xdef	_Excitation_2Phase
3714                     	xdef	_Excitation_12Phase
3715                     	xdef	_Excitation_1Phase
3716                     	xdef	_CPulse
3717                     	xdef	_CStep
3718                     	xdef	_PowerDelay_1mS
3719  0048               _Timer:
3720  0048 000000000000  	ds.b	10
3721                     	xdef	_Timer
3722  0052               _Adc:
3723  0052 000000000000  	ds.b	14
3724                     	xdef	_Adc
3725  0060               _Pwm:
3726  0060 000000000000  	ds.b	17
3727                     	xdef	_Pwm
3728  0071               _Drive:
3729  0071 000000000000  	ds.b	28
3730                     	xdef	_Drive
3731                     	xdef	_TableInterval
3732  008d               _ledint:
3733  008d 0000          	ds.b	2
3734                     	xdef	_ledint
3735  008f               _Ticks_S:
3736  008f 00000000      	ds.b	4
3737                     	xdef	_Ticks_S
3738  0093               _Ticks2_1mS:
3739  0093 0000          	ds.b	2
3740                     	xdef	_Ticks2_1mS
3741  0095               _Ticks_1mS:
3742  0095 0000          	ds.b	2
3743                     	xdef	_Ticks_1mS
3744  0097               _Ticks_50uS:
3745  0097 00000000      	ds.b	4
3746                     	xdef	_Ticks_50uS
3747  009b               _mDuty:
3748  009b 0000          	ds.b	2
3749                     	xdef	_mDuty
3750                     	xdef	_nDuty
3751  009d               _sDuty:
3752  009d 0000          	ds.b	2
3753                     	xdef	_sDuty
3754  009f               _iDuty:
3755  009f 00            	ds.b	1
3756                     	xdef	_iDuty
3757  00a0               _Duty:
3758  00a0 000000000000  	ds.b	16
3759                     	xdef	_Duty
3760  00b0               _Dif:
3761  00b0 0000          	ds.b	2
3762                     	xdef	_Dif
3763  00b2               _update:
3764  00b2 00            	ds.b	1
3765                     	xdef	_update
3766  00b3               _t2:
3767  00b3 0000          	ds.b	2
3768                     	xdef	_t2
3769  00b5               _tt:
3770  00b5 0000          	ds.b	2
3771                     	xdef	_tt
3772                     	xdef	_PeriodNumber
3773  00b7               _Counter:
3774  00b7 0000          	ds.b	2
3775                     	xdef	_Counter
3776                     	xdef	_assert_failed
3777                     	xref	_TIM4_ITConfig
3778                     	xref	_TIM4_Cmd
3779                     	xref	_TIM4_TimeBaseInit
3780                     	xref	_TIM4_DeInit
3781                     	xref	_TIM2_ClearITPendingBit
3782                     	xref	_TIM2_GetITStatus
3783                     	xref	_TIM2_GetCapture1
3784                     	xref	_TIM2_ITConfig
3785                     	xref	_TIM2_Cmd
3786                     	xref	_TIM2_ICInit
3787                     	xref	_TIM2_TimeBaseInit
3788                     	xref	_TIM2_DeInit
3789                     	xref	_GPIO_ReadInputPin
3790                     	xref	_GPIO_WriteReverse
3791                     	xref	_GPIO_WriteLow
3792                     	xref	_GPIO_WriteHigh
3793                     	xref	_GPIO_Init
3794                     	xref	_CLK_SYSCLKConfig
3795                     	xref	_CLK_HSIPrescalerConfig
3796                     	xref	_CLK_LSICmd
3797                     	xref	_CLK_HSICmd
3798                     	xref	_CLK_HSECmd
3799                     	xref	_CLK_DeInit
3800                     	xref	_ADC1_GetConversionValue
3801                     	xref	_ADC1_StartConversion
3802                     	xref	_ADC1_Init
3803                     	xref	_ADC1_DeInit
3804                     	xref.b	c_lreg
3805                     	xref.b	c_x
3806                     	xref.b	c_y
3826                     	xref	c_imul
3827                     	xref	c_cmulx
3828                     	xref	c_ladc
3829                     	xref	c_uitolx
3830                     	xref	c_lcmp
3831                     	xref	c_lgadc
3832                     	xref	c_lgsub
3833                     	xref	c_ludv
3834                     	xref	c_ltor
3835                     	xref	c_rtol
3836                     	xref	c_umul
3837                     	end
