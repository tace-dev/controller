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
 133  0007 cd0697        	call	_Clock_Config
 135                     ; 213 	Gpio_Config();
 137  000a cd06b0        	call	_Gpio_Config
 139                     ; 215 	Timer4_Config();
 141  000d cd0743        	call	L5_Timer4_Config
 143                     ; 217 	Adc.Idx = 2;
 145  0010 35020058      	mov	_Adc+6,#2
 146                     ; 218 	Adc_Config(  );
 148  0014 cd0757        	call	L3_Adc_Config
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
 222  0061 cd0425        	call	_StopDrive
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
 257  0088 cd068c        	call	_CPulse
 259  008b cd044a        	call	_StartDriveOR
 261  008e 84            	pop	a
 263  008f               L73:
 264                     ; 296 		while (Drive.Run)				// Wait while motor is running
 266  008f 72020071fb    	btjt	_Drive,#1,L73
 268  0094 2008          	jra	L34
 269  0096               L33:
 270                     ; 301 		Drive.Position = CPulse(205u);
 272  0096 ae00cd        	ldw	x,#205
 273  0099 cd068c        	call	_CPulse
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
 374  0118 cd044a        	call	_StartDriveOR
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
 673  022e cd068c        	call	_CPulse
 674  0231 cd044a        	call	_StartDriveOR
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
1101  02e1 cd0757        	call	L3_Adc_Config
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
1161  0322 cd0551        	call	_DriveService
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
1216                     ; 601 	Pwm.CntOverflow++;
1218  0333 3c6f          	inc	_Pwm+15
1219                     ; 603 	TIM2_ClearITPendingBit(TIM1_IT_UPDATE);
1221  0335 4c            	inc	a
1223                     ; 604 }
1226  0336 cc0000        	jp	_TIM2_ClearITPendingBit
1256                     ; 624 void OnCaptureTim2(void)
1256                     ; 625 {
1257                     	switch	.text
1258  0339               _OnCaptureTim2:
1260  0339 5204          	subw	sp,#4
1261       00000004      OFST:	set	4
1264                     ; 626 	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
1266  033b a602          	ld	a,#2
1267  033d cd0000        	call	_TIM2_GetITStatus
1269  0340 4a            	dec	a
1270  0341 2703cc0422    	jrne	L373
1271                     ; 627 		return;
1273                     ; 629 	if ( Pwm.Edge == 0 ) 
1275  0346 7201006003cc  	btjt	_Pwm,#0,L743
1276                     ; 631 		Pwm.T2 = TIM2_GetCapture1();
1278  034e cd0000        	call	_TIM2_GetCapture1
1280  0351 bf67          	ldw	_Pwm+7,x
1281                     ; 632 		TIM2_ClearITPendingBit(TIM1_IT_CC1);
1283  0353 a602          	ld	a,#2
1284  0355 cd0000        	call	_TIM2_ClearITPendingBit
1286                     ; 633 		Pwm.Edge = 1;
1288  0358 72100060      	bset	_Pwm,#0
1289                     ; 635 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
1289                     ; 636                TIM2_ICPSC_DIV8, 0x0) ;
1291  035c 4b00          	push	#0
1292  035e 4b0c          	push	#12
1293  0360 4b01          	push	#1
1294  0362 ae0044        	ldw	x,#68
1295  0365 cd0000        	call	_TIM2_ICInit
1297  0368 5b03          	addw	sp,#3
1298                     ; 638 		if ( Pwm.T2 > Pwm.T1 ) 
1300  036a be67          	ldw	x,_Pwm+7
1301  036c b365          	cpw	x,_Pwm+5
1302  036e 2311          	jrule	L153
1303                     ; 640 			if ( Pwm.CntOverflow == 0 )
1305  0370 b66f          	ld	a,_Pwm+15
1306  0372 2606          	jrne	L353
1307                     ; 642 				Pwm.T4 = Pwm.T2 - Pwm.T1;
1309  0374 72b00065      	subw	x,_Pwm+5
1311  0378 2003          	jp	LC006
1312  037a               L353:
1313                     ; 646 				Pwm.T4 = 0xffff;
1315  037a aeffff        	ldw	x,#65535
1316  037d               LC006:
1317  037d bf6d          	ldw	_Pwm+13,x
1318  037f 2019          	jra	L753
1319  0381               L153:
1320                     ; 652 			if ( Pwm.CntOverflow == 1 )
1322  0381 b66f          	ld	a,_Pwm+15
1323  0383 4a            	dec	a
1324  0384 260d          	jrne	L163
1325                     ; 654 				Pwm.T4 = 0xffff - Pwm.T1 + Pwm.T2;
1327  0386 aeffff        	ldw	x,#65535
1328  0389 72b00065      	subw	x,_Pwm+5
1329  038d 72bb0067      	addw	x,_Pwm+7
1331  0391 2003          	jra	L363
1332  0393               L163:
1333                     ; 658 				Pwm.T4 = 0xffff;
1335  0393 aeffff        	ldw	x,#65535
1336  0396               L363:
1337  0396 bf6d          	ldw	_Pwm+13,x
1338                     ; 660 			Pwm.CntOverflow = 0;
1340  0398 3f6f          	clr	_Pwm+15
1341  039a               L753:
1342                     ; 666 		if ( Pwm.T3 == 0xffff || Pwm.T4 == 0xffff )
1344  039a be6b          	ldw	x,_Pwm+11
1345  039c 5c            	incw	x
1346  039d 2705          	jreq	L763
1348  039f be6d          	ldw	x,_Pwm+13
1349  03a1 5c            	incw	x
1350  03a2 2609          	jrne	L563
1351  03a4               L763:
1352                     ; 668 			Pwm.Duty = 0u;
1354  03a4 5f            	clrw	x
1355  03a5 bf69          	ldw	_Pwm+9,x
1357  03a7               L173:
1358                     ; 676 		Timer.PwmUpdate = Ticks_1mS;		
1360  03a7 be95          	ldw	x,_Ticks_1mS
1361  03a9 bf50          	ldw	_Timer+8,x
1363  03ab 2075          	jra	L373
1364  03ad               L563:
1365                     ; 672 			Pwm.Duty = ( Pwm.T3 * (uint32_t)400 / ( Pwm.T3 + Pwm.T4 ) ) + 1 ;
1367  03ad be6b          	ldw	x,_Pwm+11
1368  03af 72bb006d      	addw	x,_Pwm+13
1369  03b3 cd0000        	call	c_uitolx
1371  03b6 96            	ldw	x,sp
1372  03b7 5c            	incw	x
1373  03b8 cd0000        	call	c_rtol
1376  03bb be6b          	ldw	x,_Pwm+11
1377  03bd 90ae0190      	ldw	y,#400
1378  03c1 cd0000        	call	c_umul
1380  03c4 96            	ldw	x,sp
1381  03c5 5c            	incw	x
1382  03c6 cd0000        	call	c_ludv
1384  03c9 a601          	ld	a,#1
1385  03cb cd0000        	call	c_ladc
1387  03ce be02          	ldw	x,c_lreg+2
1388  03d0 bf69          	ldw	_Pwm+9,x
1389                     ; 673 			Pwm.Duty /= 2;
1391  03d2 3469          	srl	_Pwm+9
1392  03d4 366a          	rrc	_Pwm+10
1393  03d6 20cf          	jra	L173
1394  03d8               L743:
1395                     ; 680 		Pwm.T1 = TIM2_GetCapture1();
1397  03d8 cd0000        	call	_TIM2_GetCapture1
1399  03db bf65          	ldw	_Pwm+5,x
1400                     ; 681 		TIM2_ClearITPendingBit(TIM1_IT_CC1);
1402  03dd a602          	ld	a,#2
1403  03df cd0000        	call	_TIM2_ClearITPendingBit
1405                     ; 682 		Pwm.Edge = 0;	
1407  03e2 72110060      	bres	_Pwm,#0
1408                     ; 684 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
1408                     ; 685                TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
1410  03e6 4b00          	push	#0
1411  03e8 4b0c          	push	#12
1412  03ea 4b01          	push	#1
1413  03ec 5f            	clrw	x
1414  03ed cd0000        	call	_TIM2_ICInit
1416  03f0 5b03          	addw	sp,#3
1417                     ; 687 		if ( Pwm.T1 > Pwm.T2 ) 
1419  03f2 be65          	ldw	x,_Pwm+5
1420  03f4 b367          	cpw	x,_Pwm+7
1421  03f6 2311          	jrule	L573
1422                     ; 689 			if ( Pwm.CntOverflow == 0 )
1424  03f8 b66f          	ld	a,_Pwm+15
1425  03fa 2606          	jrne	L773
1426                     ; 691 				Pwm.T3 = Pwm.T1 - Pwm.T2;
1428  03fc 72b00067      	subw	x,_Pwm+7
1430  0400 2003          	jp	LC007
1431  0402               L773:
1432                     ; 695 				Pwm.T3 = 0xffff;
1434  0402 aeffff        	ldw	x,#65535
1435  0405               LC007:
1436  0405 bf6b          	ldw	_Pwm+11,x
1437  0407 2019          	jra	L373
1438  0409               L573:
1439                     ; 701 			if ( Pwm.CntOverflow == 1 )
1441  0409 b66f          	ld	a,_Pwm+15
1442  040b 4a            	dec	a
1443  040c 260d          	jrne	L504
1444                     ; 703 				Pwm.T3 = 0xffff - Pwm.T2 + Pwm.T1;
1446  040e aeffff        	ldw	x,#65535
1447  0411 72b00067      	subw	x,_Pwm+7
1448  0415 72bb0065      	addw	x,_Pwm+5
1450  0419 2003          	jra	L704
1451  041b               L504:
1452                     ; 707 				Pwm.T3 = 0xffff;
1454  041b aeffff        	ldw	x,#65535
1455  041e               L704:
1456  041e bf6b          	ldw	_Pwm+11,x
1457                     ; 709 			Pwm.CntOverflow = 0;
1459  0420 3f6f          	clr	_Pwm+15
1460  0422               L373:
1461                     ; 713 }
1464  0422 5b04          	addw	sp,#4
1465  0424 81            	ret	
1489                     ; 717 void StopDrive(void)			//TROff()
1489                     ; 718 {
1490                     	switch	.text
1491  0425               _StopDrive:
1495                     ; 719 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1497  0425 4b40          	push	#64
1498  0427 ae500a        	ldw	x,#20490
1499  042a cd0000        	call	_GPIO_WriteLow
1501  042d 84            	pop	a
1502                     ; 720 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1504  042e 4b08          	push	#8
1505  0430 ae500a        	ldw	x,#20490
1506  0433 cd0000        	call	_GPIO_WriteLow
1508  0436 84            	pop	a
1509                     ; 721 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1511  0437 4b80          	push	#128
1512  0439 ae500a        	ldw	x,#20490
1513  043c cd0000        	call	_GPIO_WriteLow
1515  043f 84            	pop	a
1516                     ; 722 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
1518  0440 4b08          	push	#8
1519  0442 ae5000        	ldw	x,#20480
1520  0445 cd0000        	call	_GPIO_WriteLow
1522  0448 84            	pop	a
1523                     ; 723 }
1526  0449 81            	ret	
1573                     ; 729 void StartDriveOR( uint16_t Target, uint8_t overrun )
1573                     ; 730 {
1574                     	switch	.text
1575  044a               _StartDriveOR:
1577  044a 89            	pushw	x
1578       00000000      OFST:	set	0
1581                     ; 738 	if ( Drive.Run ) return;
1583  044b 7202007106    	btjt	_Drive,#1,L612
1586                     ; 739 	if ( Drive.Position == Target ) return;
1588  0450 be72          	ldw	x,_Drive+1
1589  0452 1301          	cpw	x,(OFST+1,sp)
1590  0454 2602          	jrne	L544
1592  0456               L612:
1595  0456 85            	popw	x
1596  0457 81            	ret	
1597  0458               L544:
1598                     ; 741 	mStep[iStep]=Target;//Drive.Step;
1600  0458 b607          	ld	a,_iStep
1601  045a 5f            	clrw	x
1602  045b 97            	ld	xl,a
1603  045c 58            	sllw	x
1604  045d 1601          	ldw	y,(OFST+1,sp)
1605  045f ef08          	ldw	(_mStep,x),y
1606                     ; 743 	if (iStep<31)
1608  0461 a11f          	cp	a,#31
1609  0463 2404          	jruge	L744
1610                     ; 744 	  iStep ++;
1612  0465 3c07          	inc	_iStep
1614  0467 2002          	jra	L154
1615  0469               L744:
1616                     ; 746 		iStep = 0;	
1618  0469 3f07          	clr	_iStep
1619  046b               L154:
1620                     ; 749 	if ( Target == 0 )				//  goto origin
1622  046b 1e01          	ldw	x,(OFST+1,sp)
1623  046d 261c          	jrne	L354
1624                     ; 751 		Drive.Overrun =	0u;
1626  046f 5f            	clrw	x
1627  0470 bf76          	ldw	_Drive+5,x
1628                     ; 752 		Drive.ZeroOffset = CPulse( OVER_STEP );
1630  0472 ae001e        	ldw	x,#30
1631  0475 cd068c        	call	_CPulse
1633  0478 bf79          	ldw	_Drive+8,x
1634                     ; 754 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
1636  047a be72          	ldw	x,_Drive+1
1637  047c 72bb0079      	addw	x,_Drive+8
1638  0480 bf72          	ldw	_Drive+1,x
1639                     ; 755 		Drive.Target = 0u;
1641  0482 5f            	clrw	x
1642  0483 bf74          	ldw	_Drive+3,x
1643                     ; 757 		Drive.Dir = nMotorClose;		// 0;
1645  0485 721b0071      	bres	_Drive,#5
1647  0489 202c          	jra	L554
1648  048b               L354:
1649                     ; 764 		if (Drive.Position >= Target)		// Closing
1651  048b be72          	ldw	x,_Drive+1
1652  048d 1301          	cpw	x,(OFST+1,sp)
1653  048f 250f          	jrult	L754
1654                     ; 766 			Drive.Overrun =	0u;
1656  0491 5f            	clrw	x
1657  0492 bf76          	ldw	_Drive+5,x
1658                     ; 768 			Drive.Dir = nMotorClose;
1660  0494 721b0071      	bres	_Drive,#5
1661                     ; 769 			Drive.Overrun2 = 0u;
1663  0498 3f78          	clr	_Drive+7
1664                     ; 770 			Drive.Target = Target;
1666  049a 1e01          	ldw	x,(OFST+1,sp)
1667  049c bf74          	ldw	_Drive+3,x
1669  049e 2017          	jra	L554
1670  04a0               L754:
1671                     ; 776 			Drive.Dir = nMotorOpen;	//1;
1673  04a0 721a0071      	bset	_Drive,#5
1674                     ; 785 				Drive.Overrun2 = overrun;		//100;
1676  04a4 7b05          	ld	a,(OFST+5,sp)
1677  04a6 b778          	ld	_Drive+7,a
1678                     ; 786 				Drive.Target = Target + overrun;	//100;	
1680  04a8 7b01          	ld	a,(OFST+1,sp)
1681  04aa 97            	ld	xl,a
1682  04ab 7b02          	ld	a,(OFST+2,sp)
1683  04ad 1b05          	add	a,(OFST+5,sp)
1684  04af 2401          	jrnc	L412
1685  04b1 5c            	incw	x
1686  04b2               L412:
1687  04b2 b775          	ld	_Drive+4,a
1688  04b4 9f            	ld	a,xl
1689  04b5 b774          	ld	_Drive+3,a
1690  04b7               L554:
1691                     ; 791 	Drive.Run = TRUE;
1693  04b7 72120071      	bset	_Drive,#1
1694                     ; 792 	Drive.Ticks = Drive.Interval;
1696  04bb be80          	ldw	x,_Drive+15
1697  04bd bf82          	ldw	_Drive+17,x
1698                     ; 793 }
1700  04bf 2095          	jra	L612
1758                     ; 799 void MotorStep(MOTOR_DIR Dir)
1758                     ; 800 {
1759                     	switch	.text
1760  04c1               _MotorStep:
1764                     ; 801 	if ( Dir == nMotorClose )
1766  04c1 4d            	tnz	a
1767  04c2 2627          	jrne	L715
1768                     ; 803 		if ( Drive.Position != 0 ) 
1770  04c4 be72          	ldw	x,_Drive+1
1771  04c6 270d          	jreq	L125
1772                     ; 805 			Drive.Position--;
1774  04c8 5a            	decw	x
1775  04c9 bf72          	ldw	_Drive+1,x
1776                     ; 806 			if ( Drive.NormalOpen )
1778  04cb b688          	ld	a,_Drive+23
1779  04cd 2704          	jreq	L325
1780                     ; 807 				Drive.Phase++;   // NC
1782  04cf 3c7b          	inc	_Drive+10
1784  04d1 2002          	jra	L125
1785  04d3               L325:
1786                     ; 810 				Drive.Phase--;	//NC
1788  04d3 3a7b          	dec	_Drive+10
1789  04d5               L125:
1790                     ; 814 		if ( Drive.Position == 0 ) 
1792  04d5 be72          	ldw	x,_Drive+1
1793  04d7 2643          	jrne	L135
1794                     ; 817 			Drive.Overrun = 0u;
1796  04d9 5f            	clrw	x
1797  04da bf76          	ldw	_Drive+5,x
1798                     ; 818 			Drive.Run = FALSE;
1800  04dc 72130071      	bres	_Drive,#1
1801                     ; 819 			Drive.ZeroOffset = 0u;
1803  04e0 bf79          	ldw	_Drive+8,x
1804                     ; 820 			Drive.Position = 0u;
1806  04e2 bf72          	ldw	_Drive+1,x
1807                     ; 821 			Drive.Target = 0u;
1809  04e4 bf74          	ldw	_Drive+3,x
1810                     ; 822 			StopDrive();	
1812  04e6 cd0425        	call	_StopDrive
1814  04e9 2031          	jra	L135
1815  04eb               L715:
1816                     ; 828 			Drive.Position++;
1818  04eb be72          	ldw	x,_Drive+1
1819  04ed 5c            	incw	x
1820  04ee bf72          	ldw	_Drive+1,x
1821                     ; 830 		if ( Drive.NormalOpen )
1823  04f0 b688          	ld	a,_Drive+23
1824  04f2 2704          	jreq	L335
1825                     ; 831 				Drive.Phase--;
1827  04f4 3a7b          	dec	_Drive+10
1829  04f6 2002          	jra	L535
1830  04f8               L335:
1831                     ; 833 				Drive.Phase++;
1833  04f8 3c7b          	inc	_Drive+10
1834  04fa               L535:
1835                     ; 836 		if ( Drive.Origin ) 
1837  04fa b687          	ld	a,_Drive+22
1838  04fc 2708          	jreq	L735
1839                     ; 838 			Drive.ORGPosition = Drive.Position;
1841  04fe bf7e          	ldw	_Drive+13,x
1842                     ; 839 			Drive.LastOrigin = TRUE;
1844  0500 72160071      	bset	_Drive,#3
1846  0504 2016          	jra	L135
1847  0506               L735:
1848                     ; 842 			if ( Drive.LastOrigin )
1850  0506 7207007111    	btjf	_Drive,#3,L135
1851                     ; 844 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1853  050b be7e          	ldw	x,_Drive+13
1854  050d 1d0028        	subw	x,#40
1855  0510 bf7c          	ldw	_Drive+11,x
1856                     ; 845 				if ( Drive.MaxOverrun > OVERRUN )
1858  0512 a3012d        	cpw	x,#301
1859  0515 2505          	jrult	L135
1860                     ; 846 					Drive.MaxOverrun = OVERRUN;				
1862  0517 ae012c        	ldw	x,#300
1863  051a bf7c          	ldw	_Drive+11,x
1864  051c               L135:
1865                     ; 851 	if ( !Drive.Run ) return;
1867  051c 7202007101    	btjt	_Drive,#1,L745
1871  0521 81            	ret	
1872  0522               L745:
1873                     ; 852 	if ( !Drive.Enabled ) return;
1875  0522 7200007101    	btjt	_Drive,#0,L155
1879  0527 81            	ret	
1880  0528               L155:
1881                     ; 853 	switch ( Drive.ExcitationType )
1883  0528 b686          	ld	a,_Drive+21
1884  052a 4a            	dec	a
1885  052b 2602          	jrne	L555
1888                     ; 856 		case 0:
1888                     ; 857 			//Excitation_1Phase();	
1888                     ; 858 			break;
1890                     ; 859 		case 1:
1890                     ; 860 			Excitation_12Phase();
1892  052d ad65          	call	_Excitation_12Phase
1894                     ; 861 			break;
1896                     ; 862 		case 2:
1896                     ; 863 			//Excitation_2Phase();
1896                     ; 864 			break;
1898  052f               L555:
1899                     ; 869 }
1902  052f 81            	ret	
1928                     ; 874 void MotorClose(void)
1928                     ; 875 {
1929                     	switch	.text
1930  0530               _MotorClose:
1934                     ; 876 	if ( Drive.Origin )   		// Hall IC Sensing 
1936  0530 b687          	ld	a,_Drive+22
1937  0532 2719          	jreq	L765
1938                     ; 878 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1940  0534 be76          	ldw	x,_Drive+5
1941  0536 b37c          	cpw	x,_Drive+11
1942  0538 2510          	jrult	L175
1943                     ; 880 			Drive.Target = 0u;
1945  053a 5f            	clrw	x
1946  053b bf74          	ldw	_Drive+3,x
1947                     ; 881 			Drive.Position = 0u;
1949  053d bf72          	ldw	_Drive+1,x
1950                     ; 882 			Drive.Overrun = 0u;
1952  053f bf76          	ldw	_Drive+5,x
1953                     ; 883 			Drive.ZeroOffset = 0u;
1955  0541 bf79          	ldw	_Drive+8,x
1956                     ; 884 			Drive.Run = FALSE;			
1958  0543 72130071      	bres	_Drive,#1
1959                     ; 885 			StopDrive();
1964  0547 cc0425        	jp	_StopDrive
1965  054a               L175:
1966                     ; 889 			Drive.Overrun++;
1968  054a 5c            	incw	x
1969  054b bf76          	ldw	_Drive+5,x
1970                     ; 890 			MotorStep(nMotorClose);
1972  054d               L765:
1973                     ; 894 		MotorStep(nMotorClose);		// move 1 step close
1976  054d 4f            	clr	a
1978                     ; 895 }
1981  054e cc04c1        	jp	_MotorStep
2008                     ; 900 void DriveService(void)
2008                     ; 901 {
2009                     	switch	.text
2010  0551               _DriveService:
2012  0551 89            	pushw	x
2013       00000002      OFST:	set	2
2016                     ; 911 	if ( ! Drive.Run ) 
2018  0552 7202007102    	btjt	_Drive,#1,L706
2019                     ; 913 		StopDrive();
2021                     ; 914 		return;	//when Drive is stop 
2023  0557 2035          	jp	LC009
2024  0559               L706:
2025                     ; 921 	if ( Drive.Target > Drive.Position )
2027  0559 be74          	ldw	x,_Drive+3
2028  055b b372          	cpw	x,_Drive+1
2029  055d 2307          	jrule	L116
2030                     ; 922 	 	MotorStep(nMotorOpen);
2032  055f a601          	ld	a,#1
2033  0561 cd04c1        	call	_MotorStep
2036  0564 202b          	jra	L316
2037  0566               L116:
2038                     ; 923 	else if ( Drive.Target < Drive.Position )
2040  0566 b372          	cpw	x,_Drive+1
2041  0568 2404          	jruge	L516
2042                     ; 924 		MotorClose( );
2044  056a adc4          	call	_MotorClose
2047  056c 2023          	jra	L316
2048  056e               L516:
2049                     ; 925 	else if ( Drive.Target ) 	// on target position
2051  056e be74          	ldw	x,_Drive+3
2052  0570 2713          	jreq	L326
2053                     ; 927 			if ( Drive.Overrun2 )
2055  0572 b678          	ld	a,_Drive+7
2056  0574 270f          	jreq	L326
2057                     ; 929 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
2059  0576 5f            	clrw	x
2060  0577 97            	ld	xl,a
2061  0578 1f01          	ldw	(OFST-1,sp),x
2063  057a be74          	ldw	x,_Drive+3
2064  057c 72f001        	subw	x,(OFST-1,sp)
2065  057f bf74          	ldw	_Drive+3,x
2066                     ; 930 				Drive.Overrun2 = 0u;
2068  0581 3f78          	clr	_Drive+7
2070  0583 200c          	jra	L316
2071  0585               L326:
2072                     ; 934 				Drive.ZeroOffset = 0u;
2073                     ; 935 				Drive.Overrun = 0u;
2074                     ; 936 				Drive.Run = FALSE;
2075                     ; 937 				StopDrive();		
2077                     ; 943 			Drive.ZeroOffset = 0u;
2079                     ; 944 			Drive.Overrun = 0u;
2081                     ; 945 			Drive.Run = FALSE;
2084  0585 5f            	clrw	x
2085  0586 bf79          	ldw	_Drive+8,x
2087  0588 bf76          	ldw	_Drive+5,x
2089  058a 72130071      	bres	_Drive,#1
2090                     ; 946 			StopDrive();	
2092  058e               LC009:
2095  058e cd0425        	call	_StopDrive
2097  0591               L316:
2098                     ; 948 }
2101  0591 85            	popw	x
2102  0592 81            	ret	
2125                     ; 951 void Excitation_2Phase( void )
2125                     ; 952 {
2126                     	switch	.text
2127  0593               _Excitation_2Phase:
2131                     ; 1011 }
2134  0593 81            	ret	
2160                     ; 1014 void Excitation_12Phase( void )
2160                     ; 1015 {
2161                     	switch	.text
2162  0594               _Excitation_12Phase:
2166                     ; 1017 	switch (Drive.Phase%8)
2168  0594 b67b          	ld	a,_Drive+10
2169  0596 a407          	and	a,#7
2171                     ; 1068 		default:
2171                     ; 1069 			break;
2172  0598 2716          	jreq	L146
2173  059a 4a            	dec	a
2174  059b 271d          	jreq	L346
2175  059d 4a            	dec	a
2176  059e 272d          	jreq	L546
2177  05a0 4a            	dec	a
2178  05a1 273f          	jreq	L746
2179  05a3 4a            	dec	a
2180  05a4 2748          	jreq	L156
2181  05a6 4a            	dec	a
2182  05a7 2753          	jreq	L356
2183  05a9 4a            	dec	a
2184  05aa 276e          	jreq	L556
2185  05ac 4a            	dec	a
2186  05ad 2775          	jreq	L756
2188  05af 81            	ret	
2189  05b0               L146:
2190                     ; 1019 		case 0:
2190                     ; 1020 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2192  05b0 4b40          	push	#64
2193  05b2 ae500a        	ldw	x,#20490
2194  05b5 cd0000        	call	_GPIO_WriteHigh
2196                     ; 1021 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2198                     ; 1022 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2200                     ; 1023 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2202                     ; 1024 			break;
2204  05b8 2008          	jp	LC014
2205  05ba               L346:
2206                     ; 1025 		case 1:
2206                     ; 1026 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2208  05ba 4b40          	push	#64
2209  05bc ae500a        	ldw	x,#20490
2210  05bf cd0000        	call	_GPIO_WriteLow
2212                     ; 1027 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2214  05c2               LC014:
2215  05c2 84            	pop	a
2217  05c3 4b08          	push	#8
2218  05c5 ae500a        	ldw	x,#20490
2219  05c8 cd0000        	call	_GPIO_WriteHigh
2221                     ; 1028 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2223                     ; 1029 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2225                     ; 1030 			break;		
2227  05cb 2068          	jp	LC013
2228  05cd               L546:
2229                     ; 1031 		case 2:
2229                     ; 1032 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2231  05cd ad7a          	call	LC018
2232                     ; 1033 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2234  05cf 4b08          	push	#8
2235  05d1 ae500a        	ldw	x,#20490
2236  05d4 cd0000        	call	_GPIO_WriteHigh
2238                     ; 1034 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2240  05d7               LC015:
2241  05d7 84            	pop	a
2243  05d8 4b80          	push	#128
2244  05da ae500a        	ldw	x,#20490
2245  05dd cd0000        	call	_GPIO_WriteHigh
2247                     ; 1035 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2249                     ; 1036 			break;
2251  05e0 205c          	jp	LC012
2252  05e2               L746:
2253                     ; 1037 		case 3:
2253                     ; 1038 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2255  05e2 ad65          	call	LC018
2256                     ; 1039 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2258  05e4 4b08          	push	#8
2259  05e6 ae500a        	ldw	x,#20490
2260  05e9 cd0000        	call	_GPIO_WriteLow
2262                     ; 1040 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2264                     ; 1041 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2266                     ; 1042 			break;
2268  05ec 20e9          	jp	LC015
2269  05ee               L156:
2270                     ; 1043 		case 4:
2270                     ; 1044 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2272  05ee ad59          	call	LC018
2273                     ; 1045 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2275  05f0 ad61          	call	LC019
2276                     ; 1046 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2278  05f2 4b80          	push	#128
2279  05f4 ae500a        	ldw	x,#20490
2280  05f7 cd0000        	call	_GPIO_WriteHigh
2282                     ; 1047 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2284                     ; 1048 			break;
2286  05fa 2013          	jp	LC016
2287  05fc               L356:
2288                     ; 1049 		case 5: 
2288                     ; 1050 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2290  05fc 4b40          	push	#64
2291  05fe ae500a        	ldw	x,#20490
2292  0601 cd0000        	call	_GPIO_WriteLow
2294                     ; 1051 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2297                     ; 1052 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2299  0604               LC017:
2300  0604 84            	pop	a
2302  0605 ad4c          	call	LC019
2304  0607 4b80          	push	#128
2305  0609 ae500a        	ldw	x,#20490
2306  060c cd0000        	call	_GPIO_WriteLow
2308                     ; 1053 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2310  060f               LC016:
2311  060f 84            	pop	a
2314  0610 4b08          	push	#8
2315  0612 ae5000        	ldw	x,#20480
2316  0615 cd0000        	call	_GPIO_WriteHigh
2318                     ; 1054 			break;
2320  0618 202d          	jp	LC011
2321  061a               L556:
2322                     ; 1055 		case 6:  
2322                     ; 1056 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2324  061a 4b40          	push	#64
2325  061c ae500a        	ldw	x,#20490
2326  061f cd0000        	call	_GPIO_WriteHigh
2328                     ; 1057 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2330                     ; 1058 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2332                     ; 1059 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2334                     ; 1060 			break;
2336  0622 20e0          	jp	LC017
2337  0624               L756:
2338                     ; 1061 		case 7:
2338                     ; 1062 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2340  0624 4b40          	push	#64
2341  0626 ae500a        	ldw	x,#20490
2342  0629 cd0000        	call	_GPIO_WriteHigh
2344  062c 84            	pop	a
2345                     ; 1063 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2347  062d 4b08          	push	#8
2348  062f ae500a        	ldw	x,#20490
2349  0632 cd0000        	call	_GPIO_WriteLow
2351                     ; 1064 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2353  0635               LC013:
2354  0635 84            	pop	a
2357  0636 4b80          	push	#128
2358  0638 ae500a        	ldw	x,#20490
2359  063b cd0000        	call	_GPIO_WriteLow
2361                     ; 1065 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2363  063e               LC012:
2364  063e 84            	pop	a
2369  063f 4b08          	push	#8
2370  0641 ae5000        	ldw	x,#20480
2371  0644 cd0000        	call	_GPIO_WriteLow
2373  0647               LC011:
2374  0647 84            	pop	a
2375                     ; 1066 			break;
2377                     ; 1068 		default:
2377                     ; 1069 			break;
2379                     ; 1072 }
2382  0648 81            	ret	
2383  0649               LC018:
2384  0649 4b40          	push	#64
2385  064b ae500a        	ldw	x,#20490
2386  064e cd0000        	call	_GPIO_WriteLow
2388  0651 84            	pop	a
2389  0652 81            	ret	
2390  0653               LC019:
2391  0653 4b08          	push	#8
2392  0655 ae500a        	ldw	x,#20490
2393  0658 cd0000        	call	_GPIO_WriteLow
2395  065b 84            	pop	a
2396  065c 81            	ret	
2419                     ; 1074 void Excitation_1Phase( void )
2419                     ; 1075 {
2420                     	switch	.text
2421  065d               _Excitation_1Phase:
2425                     ; 1112 }
2428  065d 81            	ret	
2471                     	switch	.const
2472  000c               L463:
2473  000c 00000960      	dc.l	2400
2474                     ; 1139 uint16_t CStep( uint16_t pulse )
2474                     ; 1140 {
2475                     	switch	.text
2476  065e               _CStep:
2478  065e 5204          	subw	sp,#4
2479       00000004      OFST:	set	4
2482                     ; 1143 	i = (uint32_t) pulse * 200u / (2400UL);
2484  0660 a6c8          	ld	a,#200
2485  0662 cd0000        	call	c_cmulx
2487  0665 ae000c        	ldw	x,#L463
2488  0668 cd0000        	call	c_ludv
2490  066b 96            	ldw	x,sp
2491  066c 5c            	incw	x
2492  066d cd0000        	call	c_rtol
2495                     ; 1144 	i = (i+1)/2;   				// Round up  20150925
2497  0670 96            	ldw	x,sp
2498  0671 5c            	incw	x
2499  0672 cd0000        	call	c_ltor
2501  0675 a601          	ld	a,#1
2502  0677 cd0000        	call	c_ladc
2504  067a 3400          	srl	c_lreg
2505  067c 3601          	rrc	c_lreg+1
2506  067e 3602          	rrc	c_lreg+2
2507  0680 96            	ldw	x,sp
2508  0681 3603          	rrc	c_lreg+3
2509  0683 5c            	incw	x
2510  0684 cd0000        	call	c_rtol
2513                     ; 1145 	return (uint16_t) i;
2515  0687 1e03          	ldw	x,(OFST-1,sp)
2518  0689 5b04          	addw	sp,#4
2519  068b 81            	ret	
2562                     ; 1149 uint16_t CPulse( uint16_t step )
2562                     ; 1150 {
2563                     	switch	.text
2564  068c               _CPulse:
2566  068c 89            	pushw	x
2567       00000002      OFST:	set	2
2570                     ; 1154 		i= (uint32_t) step *(26UL);  // 20180509  change to 5200 pulse
2572  068d 90ae001a      	ldw	y,#26
2573  0691 cd0000        	call	c_imul
2576                     ; 1156 	return (uint16_t) i;
2580  0694 5b02          	addw	sp,#2
2581  0696 81            	ret	
2610                     ; 1167 void Clock_Config(void)
2610                     ; 1168 {
2611                     	switch	.text
2612  0697               _Clock_Config:
2616                     ; 1170 	CLK_DeInit();
2618  0697 cd0000        	call	_CLK_DeInit
2620                     ; 1171 	CLK_HSICmd(ENABLE);
2622  069a a601          	ld	a,#1
2623  069c cd0000        	call	_CLK_HSICmd
2625                     ; 1172 	CLK_LSICmd(DISABLE);
2627  069f 4f            	clr	a
2628  06a0 cd0000        	call	_CLK_LSICmd
2630                     ; 1173 	CLK_HSECmd(DISABLE);
2632  06a3 4f            	clr	a
2633  06a4 cd0000        	call	_CLK_HSECmd
2635                     ; 1175 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2637  06a7 4f            	clr	a
2638  06a8 cd0000        	call	_CLK_HSIPrescalerConfig
2640                     ; 1176 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2642  06ab a680          	ld	a,#128
2644                     ; 1177 }
2647  06ad cc0000        	jp	_CLK_SYSCLKConfig
2672                     ; 1180 void Gpio_Config(void)
2672                     ; 1181 {
2673                     	switch	.text
2674  06b0               _Gpio_Config:
2678                     ; 1183   GPIO_Init( _LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2680  06b0 4be0          	push	#224
2681  06b2 4b04          	push	#4
2682  06b4 ae5000        	ldw	x,#20480
2683  06b7 cd0000        	call	_GPIO_Init
2685  06ba 85            	popw	x
2686                     ; 1187 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2688  06bb 4be0          	push	#224
2689  06bd 4b40          	push	#64
2690  06bf ae500a        	ldw	x,#20490
2691  06c2 cd0000        	call	_GPIO_Init
2693  06c5 85            	popw	x
2694                     ; 1188 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2696  06c6 4be0          	push	#224
2697  06c8 4b80          	push	#128
2698  06ca ae500a        	ldw	x,#20490
2699  06cd cd0000        	call	_GPIO_Init
2701  06d0 85            	popw	x
2702                     ; 1189 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2704  06d1 4be0          	push	#224
2705  06d3 4b08          	push	#8
2706  06d5 ae500a        	ldw	x,#20490
2707  06d8 cd0000        	call	_GPIO_Init
2709  06db 85            	popw	x
2710                     ; 1190 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2712  06dc 4be0          	push	#224
2713  06de 4b08          	push	#8
2714  06e0 ae5000        	ldw	x,#20480
2715  06e3 cd0000        	call	_GPIO_Init
2717  06e6 85            	popw	x
2718                     ; 1192 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2720  06e7 4b40          	push	#64
2721  06e9 ae500a        	ldw	x,#20490
2722  06ec cd0000        	call	_GPIO_WriteLow
2724  06ef 84            	pop	a
2725                     ; 1193 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2727  06f0 4b08          	push	#8
2728  06f2 ae500a        	ldw	x,#20490
2729  06f5 cd0000        	call	_GPIO_WriteLow
2731  06f8 84            	pop	a
2732                     ; 1194 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2734  06f9 4b80          	push	#128
2735  06fb ae500a        	ldw	x,#20490
2736  06fe cd0000        	call	_GPIO_WriteLow
2738  0701 84            	pop	a
2739                     ; 1195 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2741  0702 4b08          	push	#8
2742  0704 ae5000        	ldw	x,#20480
2743  0707 cd0000        	call	_GPIO_WriteLow
2745  070a 84            	pop	a
2746                     ; 1198   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2748  070b 4b00          	push	#0
2749  070d 4b10          	push	#16
2750  070f ae5005        	ldw	x,#20485
2751  0712 cd0000        	call	_GPIO_Init
2753  0715 85            	popw	x
2754                     ; 1201 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
2756  0716 4b00          	push	#0
2757  0718 4b04          	push	#4
2758  071a ae500f        	ldw	x,#20495
2759  071d cd0000        	call	_GPIO_Init
2761  0720 85            	popw	x
2762                     ; 1203 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2764  0721 4b00          	push	#0
2765  0723 4b10          	push	#16
2766  0725 ae500f        	ldw	x,#20495
2767  0728 cd0000        	call	_GPIO_Init
2769  072b 85            	popw	x
2770                     ; 1205 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2772  072c 4b00          	push	#0
2773  072e 4b10          	push	#16
2774  0730 ae500a        	ldw	x,#20490
2775  0733 cd0000        	call	_GPIO_Init
2777  0736 85            	popw	x
2778                     ; 1206 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
2780  0737 4b00          	push	#0
2781  0739 4b08          	push	#8
2782  073b ae500f        	ldw	x,#20495
2783  073e cd0000        	call	_GPIO_Init
2785  0741 85            	popw	x
2786                     ; 1208 }
2789  0742 81            	ret	
2816                     ; 1261 void Timer4_Config(void)
2816                     ; 1262 {
2817                     	switch	.text
2818  0743               L5_Timer4_Config:
2822                     ; 1263   TIM4_DeInit();
2824  0743 cd0000        	call	_TIM4_DeInit
2826                     ; 1269 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
2828  0746 ae0432        	ldw	x,#1074
2829  0749 cd0000        	call	_TIM4_TimeBaseInit
2831                     ; 1272   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2833  074c ae0101        	ldw	x,#257
2834  074f cd0000        	call	_TIM4_ITConfig
2836                     ; 1275   TIM4_Cmd(ENABLE);
2838  0752 a601          	ld	a,#1
2840                     ; 1276 }
2843  0754 cc0000        	jp	_TIM4_Cmd
2871                     ; 1279 static void Adc_Config( void )
2871                     ; 1280 {
2872                     	switch	.text
2873  0757               L3_Adc_Config:
2877                     ; 1282 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
2879  0757 cd0000        	call	_ADC1_GetConversionValue
2881  075a b658          	ld	a,_Adc+6
2882  075c 905f          	clrw	y
2883  075e 9097          	ld	yl,a
2884  0760 9058          	sllw	y
2885  0762 90ef52        	ldw	(_Adc,y),x
2886                     ; 1283 	ADC1_DeInit();
2888  0765 cd0000        	call	_ADC1_DeInit
2890                     ; 1285 	switch (Adc.Idx)
2892  0768 b658          	ld	a,_Adc+6
2894                     ; 1307 			break;
2895  076a 2708          	jreq	L3001
2896  076c 4a            	dec	a
2897  076d 271f          	jreq	L5001
2898  076f 4a            	dec	a
2899  0770 2736          	jreq	L7001
2900                     ; 1305 		default:
2900                     ; 1306 			Adc.Idx = 0;
2901                     ; 1307 			break;
2903  0772 2048          	jp	LC020
2904  0774               L3001:
2905                     ; 1287 		case 0:
2905                     ; 1288 		  
2905                     ; 1289 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
2905                     ; 1290 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
2907  0774 4b00          	push	#0
2908  0776 4b03          	push	#3
2909  0778 4b08          	push	#8
2910  077a 4b00          	push	#0
2911  077c 4b00          	push	#0
2912  077e 4b00          	push	#0
2913  0780 ae0003        	ldw	x,#3
2914  0783 cd0000        	call	_ADC1_Init
2916  0786 5b06          	addw	sp,#6
2917                     ; 1291 			Adc.Idx = 1;
2919  0788 35010058      	mov	_Adc+6,#1
2920                     ; 1292 			break;
2922  078c 2030          	jra	L5201
2923  078e               L5001:
2924                     ; 1293 		case 1:
2924                     ; 1294 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
2924                     ; 1295 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
2926  078e 4b00          	push	#0
2927  0790 4b04          	push	#4
2928  0792 4b08          	push	#8
2929  0794 4b00          	push	#0
2930  0796 4b00          	push	#0
2931  0798 4b00          	push	#0
2932  079a ae0004        	ldw	x,#4
2933  079d cd0000        	call	_ADC1_Init
2935  07a0 5b06          	addw	sp,#6
2936                     ; 1296 			Adc.Idx = 2;
2938  07a2 35020058      	mov	_Adc+6,#2
2939                     ; 1297 			break;
2941  07a6 2016          	jra	L5201
2942  07a8               L7001:
2943                     ; 1299 		case 2:
2943                     ; 1300 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
2943                     ; 1301 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
2945  07a8 4b00          	push	#0
2946  07aa 4b02          	push	#2
2947  07ac 4b08          	push	#8
2948  07ae 4b00          	push	#0
2949  07b0 4b00          	push	#0
2950  07b2 4b00          	push	#0
2951  07b4 ae0002        	ldw	x,#2
2952  07b7 cd0000        	call	_ADC1_Init
2954  07ba 5b06          	addw	sp,#6
2955                     ; 1302 			Adc.Idx = 0;
2957  07bc               LC020:
2959  07bc 3f58          	clr	_Adc+6
2960                     ; 1303 			break;
2962  07be               L5201:
2963                     ; 1310 		ADC1_StartConversion();		
2966                     ; 1311 }
2969  07be cc0000        	jp	_ADC1_StartConversion
3013                     ; 1326 void assert_failed(u8* file, u32 line)
3013                     ; 1327 {
3014                     	switch	.text
3015  07c1               _assert_failed:
3017  07c1 88            	push	a
3018       00000001      OFST:	set	1
3021  07c2               L1501:
3022                     ; 1336 	i = i++;
3024  07c2 0c01          	inc	(OFST+0,sp)
3026  07c4 6b01          	ld	(OFST+0,sp),a
3029  07c6 20fa          	jra	L1501
3673                     	xdef	_MotorClose
3674                     	xdef	_MotorStep
3675                     	xdef	_OnTimer_1mS
3676                     	switch	.ubsct
3677  0000               _pos2:
3678  0000 00            	ds.b	1
3679                     	xdef	_pos2
3680  0001               _pos:
3681  0001 0000          	ds.b	2
3682                     	xdef	_pos
3683                     	xdef	_OnTimer_1S
3684                     	xdef	_main
3685  0003               _mVal:
3686  0003 00000000      	ds.b	4
3687                     	xdef	_mVal
3688  0007               _iStep:
3689  0007 00            	ds.b	1
3690                     	xdef	_iStep
3691  0008               _mStep:
3692  0008 000000000000  	ds.b	64
3693                     	xdef	_mStep
3694                     	xdef	_min
3695                     	xdef	_MotorService
3696                     	xdef	_AdcService
3697                     	xdef	_SAbs
3698                     	xdef	_Diff
3699                     	xdef	_Gpio_Config
3700                     	xdef	_Clock_Config
3701                     	xdef	_OnCaptureOVTim2
3702                     	xdef	_OnCaptureTim2
3703                     	xdef	_OnTimer4
3704                     	xdef	_StopDrive
3705                     	xdef	_StartDriveOR
3706                     	xdef	_DriveService
3707                     	xdef	_Excitation_2Phase
3708                     	xdef	_Excitation_12Phase
3709                     	xdef	_Excitation_1Phase
3710                     	xdef	_CPulse
3711                     	xdef	_CStep
3712                     	xdef	_PowerDelay_1mS
3713  0048               _Timer:
3714  0048 000000000000  	ds.b	10
3715                     	xdef	_Timer
3716  0052               _Adc:
3717  0052 000000000000  	ds.b	14
3718                     	xdef	_Adc
3719  0060               _Pwm:
3720  0060 000000000000  	ds.b	17
3721                     	xdef	_Pwm
3722  0071               _Drive:
3723  0071 000000000000  	ds.b	28
3724                     	xdef	_Drive
3725                     	xdef	_TableInterval
3726  008d               _ledint:
3727  008d 0000          	ds.b	2
3728                     	xdef	_ledint
3729  008f               _Ticks_S:
3730  008f 00000000      	ds.b	4
3731                     	xdef	_Ticks_S
3732  0093               _Ticks2_1mS:
3733  0093 0000          	ds.b	2
3734                     	xdef	_Ticks2_1mS
3735  0095               _Ticks_1mS:
3736  0095 0000          	ds.b	2
3737                     	xdef	_Ticks_1mS
3738  0097               _Ticks_50uS:
3739  0097 00000000      	ds.b	4
3740                     	xdef	_Ticks_50uS
3741  009b               _mDuty:
3742  009b 0000          	ds.b	2
3743                     	xdef	_mDuty
3744                     	xdef	_nDuty
3745  009d               _sDuty:
3746  009d 0000          	ds.b	2
3747                     	xdef	_sDuty
3748  009f               _iDuty:
3749  009f 00            	ds.b	1
3750                     	xdef	_iDuty
3751  00a0               _Duty:
3752  00a0 000000000000  	ds.b	16
3753                     	xdef	_Duty
3754  00b0               _Dif:
3755  00b0 0000          	ds.b	2
3756                     	xdef	_Dif
3757  00b2               _update:
3758  00b2 00            	ds.b	1
3759                     	xdef	_update
3760  00b3               _t2:
3761  00b3 0000          	ds.b	2
3762                     	xdef	_t2
3763  00b5               _tt:
3764  00b5 0000          	ds.b	2
3765                     	xdef	_tt
3766                     	xdef	_PeriodNumber
3767  00b7               _Counter:
3768  00b7 0000          	ds.b	2
3769                     	xdef	_Counter
3770                     	xdef	_assert_failed
3771                     	xref	_TIM4_ITConfig
3772                     	xref	_TIM4_Cmd
3773                     	xref	_TIM4_TimeBaseInit
3774                     	xref	_TIM4_DeInit
3775                     	xref	_TIM2_ClearITPendingBit
3776                     	xref	_TIM2_GetITStatus
3777                     	xref	_TIM2_GetCapture1
3778                     	xref	_TIM2_ITConfig
3779                     	xref	_TIM2_Cmd
3780                     	xref	_TIM2_ICInit
3781                     	xref	_TIM2_TimeBaseInit
3782                     	xref	_TIM2_DeInit
3783                     	xref	_GPIO_ReadInputPin
3784                     	xref	_GPIO_WriteReverse
3785                     	xref	_GPIO_WriteLow
3786                     	xref	_GPIO_WriteHigh
3787                     	xref	_GPIO_Init
3788                     	xref	_CLK_SYSCLKConfig
3789                     	xref	_CLK_HSIPrescalerConfig
3790                     	xref	_CLK_LSICmd
3791                     	xref	_CLK_HSICmd
3792                     	xref	_CLK_HSECmd
3793                     	xref	_CLK_DeInit
3794                     	xref	_ADC1_GetConversionValue
3795                     	xref	_ADC1_StartConversion
3796                     	xref	_ADC1_Init
3797                     	xref	_ADC1_DeInit
3798                     	xref.b	c_lreg
3799                     	xref.b	c_x
3800                     	xref.b	c_y
3820                     	xref	c_imul
3821                     	xref	c_cmulx
3822                     	xref	c_ladc
3823                     	xref	c_uitolx
3824                     	xref	c_lcmp
3825                     	xref	c_lgadc
3826                     	xref	c_lgsub
3827                     	xref	c_ludv
3828                     	xref	c_ltor
3829                     	xref	c_rtol
3830                     	xref	c_umul
3831                     	end
