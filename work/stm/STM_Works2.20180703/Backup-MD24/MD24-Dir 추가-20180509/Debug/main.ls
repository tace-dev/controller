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
 126  0001 bfa1          	ldw	_Ticks_1mS,x
 127                     ; 220 	Ticks_50uS = 0;
 129  0003 bfa5          	ldw	_Ticks_50uS+2,x
 130  0005 bfa3          	ldw	_Ticks_50uS,x
 131                     ; 223 	Clock_Config();
 133  0007 cd06da        	call	_Clock_Config
 135                     ; 224 	Gpio_Config();
 137  000a cd06f3        	call	_Gpio_Config
 139                     ; 226 	Timer4_Config();
 141  000d cd0786        	call	L5_Timer4_Config
 143                     ; 228 	Adc.Idx = 2;
 145  0010 35020058      	mov	_Adc+6,#2
 146                     ; 229 	Adc_Config(  );
 148  0014 cd079a        	call	L3_Adc_Config
 150                     ; 236 	Drive.Enabled = ENABLED;
 152  0017 7210006c      	bset	_Drive,#0
 153                     ; 237 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 155  001b ae012c        	ldw	x,#300
 156  001e bf77          	ldw	_Drive+11,x
 157                     ; 239 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 159  0020 bf7f          	ldw	_Drive+19,x
 160                     ; 241 	Drive.Position = 0;
 162  0022 5f            	clrw	x
 163  0023 bf6d          	ldw	_Drive+1,x
 164                     ; 242 	Drive.Dir = nMotorClose;
 166                     ; 243 	Drive.Interval = 12u;	//	for 24V 35RD Motor Best speed
 168                     ; 244 	Drive.Interval = 11u;	//	for 24V 35RD Motor Best speed
 170                     ; 245 	Drive.Interval = 14u;	//	for 24V 35RD Motor Best speed
 172  0025 ae000e        	ldw	x,#14
 173  0028 7219006c      	bres	_Drive,#4
 174  002c bf7b          	ldw	_Drive+15,x
 175                     ; 246 	Drive.Stage = 0;		// Not Initialized
 177  002e 3f87          	clr	_Drive+27
 178                     ; 251 	Drive.ExcitationType = 1;		//12 excition
 180  0030 35010081      	mov	_Drive+21,#1
 181                     ; 270 	Drive.Prescaler = TIM2_PRESCALER_8;
 183  0034 35030098      	mov	_Drive+44,#3
 184                     ; 272 	TIM2_DeInit();	
 186  0038 cd0000        	call	_TIM2_DeInit
 188                     ; 273 	TIM2_TimeBaseInit( Drive.Prescaler, 0xffff );
 190  003b aeffff        	ldw	x,#65535
 191  003e 89            	pushw	x
 192  003f b698          	ld	a,_Drive+44
 193  0041 cd0000        	call	_TIM2_TimeBaseInit
 195  0044 85            	popw	x
 196                     ; 274 	TIM2_ITConfig( TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
 198  0045 ae0301        	ldw	x,#769
 199  0048 cd0000        	call	_TIM2_ITConfig
 201                     ; 275 	TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
 201                     ; 276                TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
 203  004b 4b00          	push	#0
 204  004d 4b0c          	push	#12
 205  004f 4b01          	push	#1
 206  0051 5f            	clrw	x
 207  0052 cd0000        	call	_TIM2_ICInit
 209  0055 5b03          	addw	sp,#3
 210                     ; 277 	TIM2_Cmd(ENABLE);
 212  0057 a601          	ld	a,#1
 213  0059 cd0000        	call	_TIM2_Cmd
 215                     ; 279 	enableInterrupts();
 218  005c 9a            	rim	
 220                     ; 282 	Drive.PwmEdge = 0;
 223  005d 721b006c      	bres	_Drive,#5
 224                     ; 287 	StopDrive();
 226  0061 cd0468        	call	_StopDrive
 228                     ; 292 	GPIO_WriteLow(_LED_PORT, _LED_PIN);		// Led on
 230  0064 4b04          	push	#4
 231  0066 ae5000        	ldw	x,#20480
 232  0069 cd0000        	call	_GPIO_WriteLow
 234  006c 84            	pop	a
 236  006d               L72:
 237                     ; 294 	while ( Ticks_1mS < PowerDelay_1mS )		// Delay Power ON
 239  006d bea1          	ldw	x,_Ticks_1mS
 240  006f b314          	cpw	x,_PowerDelay_1mS
 241  0071 25fa          	jrult	L72
 242                     ; 297   GPIO_WriteHigh(_LED_PORT, _LED_PIN);		// Led off
 244  0073 4b04          	push	#4
 245  0075 ae5000        	ldw	x,#20480
 246  0078 cd0000        	call	_GPIO_WriteHigh
 248  007b 3d82          	tnz	_Drive+22
 249  007d 84            	pop	a
 250                     ; 313 	if ( Drive.Origin ) 
 252  007e 2716          	jreq	L33
 253                     ; 315 		Drive.Position = 0;
 255  0080 5f            	clrw	x
 256  0081 bf6d          	ldw	_Drive+1,x
 257                     ; 316 		StartDriveOR( CPulse(200u), 0u  );				// Goto Zero position
 259  0083 4b00          	push	#0
 260  0085 ae00c8        	ldw	x,#200
 261  0088 cd06cf        	call	_CPulse
 263  008b cd048d        	call	_StartDriveOR
 265  008e 84            	pop	a
 267  008f               L73:
 268                     ; 318 		while (Drive.Run)				// Wait while motor is running
 270  008f 7202006cfb    	btjt	_Drive,#1,L73
 272  0094 2008          	jra	L34
 273  0096               L33:
 274                     ; 323 		Drive.Position = CPulse(205u);
 276  0096 ae00cd        	ldw	x,#205
 277  0099 cd06cf        	call	_CPulse
 279  009c bf6d          	ldw	_Drive+1,x
 280  009e               L34:
 281                     ; 330 	Timer.Led = Ticks_1mS;
 283  009e bea1          	ldw	x,_Ticks_1mS
 284  00a0 bf48          	ldw	_Timer,x
 285                     ; 331 	Timer.Motor = Ticks_1mS;
 287  00a2 bea1          	ldw	x,_Ticks_1mS
 288  00a4 bf4a          	ldw	_Timer+2,x
 289                     ; 332 	Timer.Adc = Ticks_1mS;
 291  00a6 bea1          	ldw	x,_Ticks_1mS
 292  00a8 bf4c          	ldw	_Timer+4,x
 293                     ; 335   ledint = 1000u;
 295  00aa ae03e8        	ldw	x,#1000
 296  00ad bf99          	ldw	_ledint,x
 297  00af               L54:
 298                     ; 339 		tt = Ticks_1mS;
 300  00af bea1          	ldw	x,_Ticks_1mS
 301  00b1 bfc1          	ldw	_tt,x
 302                     ; 341 		if ( Diff ( Timer.Led, ledint ) )
 304  00b3 be99          	ldw	x,_ledint
 305  00b5 89            	pushw	x
 306  00b6 be48          	ldw	x,_Timer
 307  00b8 cd029c        	call	_Diff
 309  00bb 4d            	tnz	a
 310  00bc 85            	popw	x
 311  00bd 270d          	jreq	L15
 312                     ; 344 			Timer.Led = Ticks_1mS;
 314  00bf bea1          	ldw	x,_Ticks_1mS
 315  00c1 bf48          	ldw	_Timer,x
 316                     ; 345 			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
 318  00c3 4b04          	push	#4
 319  00c5 ae5000        	ldw	x,#20480
 320  00c8 cd0000        	call	_GPIO_WriteReverse
 322  00cb 84            	pop	a
 323  00cc               L15:
 324                     ; 348 		AdcService();
 326  00cc cd023a        	call	_AdcService
 328                     ; 351 		if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
 330  00cf b68c          	ld	a,_Drive+32
 331  00d1 2610          	jrne	L35
 333  00d3 7203006c0b    	btjf	_Drive,#1,L35
 334                     ; 353 			Drive.T1_1mS = Ticks_1mS;
 336  00d8 bea1          	ldw	x,_Ticks_1mS
 337  00da bf88          	ldw	_Drive+28,x
 338                     ; 354 			Drive.Run0 = Drive.Run;			
 340  00dc b66c          	ld	a,_Drive
 341  00de a402          	and	a,#2
 342  00e0 44            	srl	a
 343  00e1 b78c          	ld	_Drive+32,a
 344  00e3               L35:
 345                     ; 357 		if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
 347  00e3 4a            	dec	a
 348  00e4 2610          	jrne	L55
 350  00e6 7202006c0b    	btjt	_Drive,#1,L55
 351                     ; 359 			Drive.T2_1mS = Ticks_1mS;
 353  00eb bea1          	ldw	x,_Ticks_1mS
 354  00ed bf8a          	ldw	_Drive+30,x
 355                     ; 360 			Drive.Run0 = Drive.Run;			
 357  00ef b66c          	ld	a,_Drive
 358  00f1 a402          	and	a,#2
 359  00f3 44            	srl	a
 360  00f4 b78c          	ld	_Drive+32,a
 361  00f6               L55:
 362                     ; 364 		if ( Drive.Stage == 0 )	//	Init
 364  00f6 b687          	ld	a,_Drive+27
 365  00f8 261e          	jrne	L75
 366                     ; 366 			if ( Drive.Run == 0 )
 368  00fa 7203006c03cc  	btjt	_Drive,#1,L721
 369                     ; 368 				if ( Drive.Origin == 1 )
 371  0102 b682          	ld	a,_Drive+22
 372  0104 4a            	dec	a
 373  0105 2607          	jrne	L36
 374                     ; 370 					Drive.Stage = 1;
 376  0107 35010087      	mov	_Drive+27,#1
 378  010b cc01fe        	jra	L721
 379  010e               L36:
 380                     ; 374 					StartDriveOR( 0u, 0u  );				// Goto Zero position
 382  010e 4b00          	push	#0
 383  0110 5f            	clrw	x
 384  0111 cd048d        	call	_StartDriveOR
 386  0114 84            	pop	a
 387  0115 cc01fe        	jra	L721
 388  0118               L75:
 389                     ; 379 		else if ( Drive.Stage == 1 )	// Running 
 391  0118 4a            	dec	a
 392  0119 26fa          	jrne	L721
 393                     ; 381 			if ( Diff ( Timer.Motor, 200u ) != 0 )
 395  011b ae00c8        	ldw	x,#200
 396  011e 89            	pushw	x
 397  011f be4a          	ldw	x,_Timer+2
 398  0121 cd029c        	call	_Diff
 400  0124 4d            	tnz	a
 401  0125 85            	popw	x
 402  0126 2603cc01fa    	jreq	L37
 403                     ; 384 				if ( Diff ( Timer.PwmUpdate, 2000u ) != 0 )
 405  012b ae07d0        	ldw	x,#2000
 406  012e 89            	pushw	x
 407  012f be50          	ldw	x,_Timer+8
 408  0131 cd029c        	call	_Diff
 410  0134 4d            	tnz	a
 411  0135 85            	popw	x
 412  0136 271a          	jreq	L57
 413                     ; 386 					Drive.Step = 0;
 415  0138 3f84          	clr	_Drive+24
 416                     ; 389 					if ( Ticks_1mS > 2000 )
 418  013a bea1          	ldw	x,_Ticks_1mS
 419  013c a307d1        	cpw	x,#2001
 420  013f 2507          	jrult	L77
 421                     ; 390 						Timer.PwmUpdate = Ticks_1mS-2000;
 423  0141 bea1          	ldw	x,_Ticks_1mS
 424  0143 1d07d0        	subw	x,#2000
 426  0146 2005          	jp	LC001
 427  0148               L77:
 428                     ; 392 						Timer.PwmUpdate = 65535 - 2000 + Ticks_1mS;						
 430  0148 bea1          	ldw	x,_Ticks_1mS
 431  014a 1cf82f        	addw	x,#63535
 432  014d               LC001:
 433  014d bf50          	ldw	_Timer+8,x
 434  014f cc01f4        	jra	L301
 435  0152               L57:
 436                     ; 397 					if ( nDuty < 8 )
 438  0152 b602          	ld	a,_nDuty
 439  0154 a108          	cp	a,#8
 440  0156 2402          	jruge	L501
 441                     ; 398 						nDuty ++;
 443  0158 3c02          	inc	_nDuty
 444  015a               L501:
 445                     ; 400 					if (iDuty < 7)
 447  015a b6ab          	ld	a,_iDuty
 448  015c a107          	cp	a,#7
 449  015e 2404          	jruge	L701
 450                     ; 402 						iDuty++;
 452  0160 3cab          	inc	_iDuty
 454  0162 2002          	jra	L111
 455  0164               L701:
 456                     ; 406 						iDuty = 0;
 458  0164 3fab          	clr	_iDuty
 459  0166               L111:
 460                     ; 409 					sDuty -= Duty[iDuty];
 462  0166 b6ab          	ld	a,_iDuty
 463  0168 5f            	clrw	x
 464  0169 97            	ld	xl,a
 465  016a e6ac          	ld	a,(_Duty,x)
 466  016c 5f            	clrw	x
 467  016d 97            	ld	xl,a
 468  016e 72b000a9      	subw	x,_sDuty
 469  0172 50            	negw	x
 470  0173 bfa9          	ldw	_sDuty,x
 471                     ; 410 					Duty[iDuty] = Drive.PwmDuty;
 473  0175 5f            	clrw	x
 474  0176 b6ab          	ld	a,_iDuty
 475  0178 97            	ld	xl,a
 476  0179 b692          	ld	a,_Drive+38
 477  017b e7ac          	ld	(_Duty,x),a
 478                     ; 411 					sDuty += Duty[iDuty]; //Drive.Step; 
 480  017d 5f            	clrw	x
 481  017e b6ab          	ld	a,_iDuty
 482  0180 97            	ld	xl,a
 483  0181 e6ac          	ld	a,(_Duty,x)
 484  0183 bbaa          	add	a,_sDuty+1
 485  0185 b7aa          	ld	_sDuty+1,a
 486  0187 2402          	jrnc	L06
 487  0189 3ca9          	inc	_sDuty
 488  018b               L06:
 489                     ; 414 					mDuty = (sDuty / nDuty)*2 + 1;
 491  018b bea9          	ldw	x,_sDuty
 492  018d b602          	ld	a,_nDuty
 493  018f 62            	div	x,a
 494  0190 58            	sllw	x
 495  0191 5c            	incw	x
 496  0192 bfa7          	ldw	_mDuty,x
 497                     ; 415 					mDuty /= 2;
 499  0194 34a7          	srl	_mDuty
 500  0196 36a8          	rrc	_mDuty+1
 501                     ; 419 					if (mDuty <20)
 503  0198 bea7          	ldw	x,_mDuty
 504  019a a30014        	cpw	x,#20
 505  019d 2405          	jruge	L311
 506                     ; 420 					   mDuty = 20;
 508  019f ae0014        	ldw	x,#20
 509  01a2 bfa7          	ldw	_mDuty,x
 510  01a4               L311:
 511                     ; 421 					if (mDuty >180)
 513  01a4 a300b5        	cpw	x,#181
 514  01a7 2505          	jrult	L511
 515                     ; 422 					  mDuty = 180; 
 517  01a9 ae00b4        	ldw	x,#180
 518  01ac bfa7          	ldw	_mDuty,x
 519  01ae               L511:
 520                     ; 424 					disableInterrupts();
 523  01ae 9b            	sim	
 525                     ; 425 					mVal  =  (625u * (u32)mDuty);
 528  01af 90ae0271      	ldw	y,#625
 529  01b3 cd0000        	call	c_umul
 531  01b6 ae0003        	ldw	x,#_mVal
 532  01b9 cd0000        	call	c_rtol
 534                     ; 426 					mVal /= (10u);
 536  01bc cd0000        	call	c_ltor
 538  01bf ae0000        	ldw	x,#L26
 539  01c2 ad4a          	call	LC002
 541                     ; 427 					mVal -= 1250u ;
 543  01c4 ae04e2        	ldw	x,#1250
 544  01c7 bf02          	ldw	c_lreg+2,x
 545  01c9 5f            	clrw	x
 546  01ca bf00          	ldw	c_lreg,x
 547  01cc ae0003        	ldw	x,#_mVal
 548  01cf cd0000        	call	c_lgsub
 550                     ; 428 					mVal = mVal /(u32)50u;
 552  01d2 cd0000        	call	c_ltor
 554  01d5 ae0004        	ldw	x,#L46
 555  01d8 ad34          	call	LC002
 557                     ; 429 					mVal += 1u;
 559  01da a601          	ld	a,#1
 560  01dc cd0000        	call	c_lgadc
 562                     ; 430 					mVal /= 2u;
 564  01df 3403          	srl	_mVal
 565  01e1 3604          	rrc	_mVal+1
 566  01e3 3605          	rrc	_mVal+2
 567  01e5 3606          	rrc	_mVal+3
 568                     ; 431 					enableInterrupts();
 571  01e7 9a            	rim	
 573                     ; 433 					Drive.Step = (u8)mVal*2;
 576  01e8 b606          	ld	a,_mVal+3
 577  01ea 48            	sll	a
 578  01eb b784          	ld	_Drive+24,a
 579                     ; 435 					if ( Drive.Step < min )
 581  01ed b116          	cp	a,_min
 582  01ef 2403          	jruge	L301
 583                     ; 436 						min = Drive.Step;
 585  01f1 458416        	mov	_min,_Drive+24
 586  01f4               L301:
 587                     ; 439 				MotorService();
 589  01f4 ad21          	call	_MotorService
 591                     ; 440 				Timer.Motor = Ticks_1mS;				
 593  01f6 bea1          	ldw	x,_Ticks_1mS
 594  01f8 bf4a          	ldw	_Timer+2,x
 595  01fa               L37:
 596                     ; 442 			if ( Drive.Run == 1 )
 598  01fa b66c          	ld	a,_Drive
 599  01fc a502          	bcp	a,#2
 601  01fe               L721:
 602                     ; 454 		while ( Diff ( tt, 50u ) == 0 )
 604  01fe ae0032        	ldw	x,#50
 605  0201 89            	pushw	x
 606  0202 bec1          	ldw	x,_tt
 607  0204 cd029c        	call	_Diff
 609  0207 4d            	tnz	a
 610  0208 85            	popw	x
 611  0209 27f3          	jreq	L721
 613  020b cc00af        	jra	L54
 614  020e               LC002:
 615  020e cd0000        	call	c_ludv
 617  0211 ae0003        	ldw	x,#_mVal
 618  0214 cc0000        	jp	c_rtol
 646                     ; 461 void MotorService()
 646                     ; 462 {
 647                     	switch	.text
 648  0217               _MotorService:
 652                     ; 468 			if ( Drive.Step > 210u )
 654  0217 b684          	ld	a,_Drive+24
 655  0219 a1d3          	cp	a,#211
 656  021b 2504          	jrult	L341
 657                     ; 469 				Drive.Step = 210u;
 659  021d a6d2          	ld	a,#210
 660  021f b784          	ld	_Drive+24,a
 661  0221               L341:
 662                     ; 470 			if ( Drive.Step < 20u )
 664  0221 a114          	cp	a,#20
 665  0223 2403          	jruge	L541
 666                     ; 471 				Drive.Step = 0u;
 668  0225 4f            	clr	a
 669  0226 b784          	ld	_Drive+24,a
 670  0228               L541:
 671                     ; 481 				if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
 673                     ; 485 						Drive.PreStep = Drive.Step;
 674                     ; 486 						StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 678                     ; 498 					Drive.PreStep = Drive.Step;
 680                     ; 499 					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );					
 685  0228 b785          	ld	_Drive+25,a
 687  022a 4b00          	push	#0
 688  022c 5f            	clrw	x
 689  022d 97            	ld	xl,a
 690  022e cd06cf        	call	_CPulse
 691  0231 cd048d        	call	_StartDriveOR
 692  0234 bea1          	ldw	x,_Ticks_1mS
 693  0236 bf4a          	ldw	_Timer+2,x
 694  0238 84            	pop	a
 695                     ; 503 			Timer.Motor = Ticks_1mS;
 697                     ; 505 	}
 700  0239 81            	ret	
 727                     ; 508 void AdcService()
 727                     ; 509 {
 728                     	switch	.text
 729  023a               _AdcService:
 733                     ; 510 	if ( Diff ( Timer.Adc, 10u )== 1 )
 735  023a ae000a        	ldw	x,#10
 736  023d 89            	pushw	x
 737  023e be4c          	ldw	x,_Timer+4
 738  0240 ad5a          	call	_Diff
 740  0242 4a            	dec	a
 741  0243 85            	popw	x
 742  0244 2643          	jrne	L361
 743                     ; 512 			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
 745  0246 b65c          	ld	a,_Adc+10
 746  0248 5f            	clrw	x
 747  0249 97            	ld	xl,a
 748  024a e659          	ld	a,(_Adc+7,x)
 749  024c 5f            	clrw	x
 750  024d 97            	ld	xl,a
 751  024e 72b0005e      	subw	x,_Adc+12
 752  0252 50            	negw	x
 753  0253 bf5e          	ldw	_Adc+12,x
 754                     ; 513 			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
 756  0255 be52          	ldw	x,_Adc
 757  0257 54            	srlw	x
 758  0258 54            	srlw	x
 759  0259 b65c          	ld	a,_Adc+10
 760  025b 905f          	clrw	y
 761  025d 9097          	ld	yl,a
 762  025f 01            	rrwa	x,a
 763  0260 90e759        	ld	(_Adc+7,y),a
 764                     ; 514 			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
 766  0263 5f            	clrw	x
 767  0264 b65c          	ld	a,_Adc+10
 768  0266 97            	ld	xl,a
 769  0267 e659          	ld	a,(_Adc+7,x)
 770  0269 bb5f          	add	a,_Adc+13
 771  026b b75f          	ld	_Adc+13,a
 772  026d 2402          	jrnc	L011
 773  026f 3c5e          	inc	_Adc+12
 774  0271               L011:
 775                     ; 515 			Adc.Average = Adc.Sum /5;
 777  0271 be5e          	ldw	x,_Adc+12
 778  0273 a605          	ld	a,#5
 779  0275 62            	div	x,a
 780  0276 01            	rrwa	x,a
 781  0277 b75d          	ld	_Adc+11,a
 782                     ; 516 			if  (Adc.IdxAvg	>= 4 )
 784  0279 b65c          	ld	a,_Adc+10
 785  027b a104          	cp	a,#4
 786  027d 2504          	jrult	L561
 787                     ; 517 				Adc.IdxAvg = 0;
 789  027f 3f5c          	clr	_Adc+10
 791  0281 2002          	jra	L761
 792  0283               L561:
 793                     ; 519 				Adc.IdxAvg++;
 795  0283 3c5c          	inc	_Adc+10
 796  0285               L761:
 797                     ; 521 			Timer.Adc = Ticks_1mS;
 799  0285 bea1          	ldw	x,_Ticks_1mS
 800  0287 bf4c          	ldw	_Timer+4,x
 801  0289               L361:
 802                     ; 523 }
 805  0289 81            	ret	
 848                     ; 530 u8 SAbs(u8 s1, u8 s2)
 848                     ; 531 {
 849                     	switch	.text
 850  028a               _SAbs:
 852  028a 89            	pushw	x
 853       00000000      OFST:	set	0
 856                     ; 532 	if (s1 > s2 )
 858  028b 9f            	ld	a,xl
 859  028c 1101          	cp	a,(OFST+1,sp)
 860  028e 2406          	jruge	L312
 861                     ; 533 		return s1 - s2;
 863  0290 9f            	ld	a,xl
 864  0291 1001          	sub	a,(OFST+1,sp)
 865  0293 40            	neg	a
 867  0294 2004          	jra	L411
 868  0296               L312:
 869                     ; 535 		return s2 - s1;
 871  0296 7b02          	ld	a,(OFST+2,sp)
 872  0298 1001          	sub	a,(OFST+1,sp)
 874  029a               L411:
 876  029a 85            	popw	x
 877  029b 81            	ret	
 931                     ; 539 u8  Diff( u16 time, u16 diff )
 931                     ; 540 {
 932                     	switch	.text
 933  029c               _Diff:
 935  029c 89            	pushw	x
 936  029d 520e          	subw	sp,#14
 937       0000000e      OFST:	set	14
 940                     ; 542 	t0 = Ticks_1mS;
 942  029f bea1          	ldw	x,_Ticks_1mS
 943  02a1 1f0d          	ldw	(OFST-1,sp),x
 945                     ; 544 	if (time <= t0 )
 947  02a3 1e0f          	ldw	x,(OFST+1,sp)
 948  02a5 130d          	cpw	x,(OFST-1,sp)
 949  02a7 2214          	jrugt	L542
 950                     ; 546 		Dif = t0 - time;
 952  02a9 1e0d          	ldw	x,(OFST-1,sp)
 953  02ab 72f00f        	subw	x,(OFST+1,sp)
 954  02ae bfbc          	ldw	_Dif,x
 955                     ; 547 		if ( ( t0 - time ) > diff ) 
 957  02b0 1e0d          	ldw	x,(OFST-1,sp)
 958  02b2 72f00f        	subw	x,(OFST+1,sp)
 959  02b5 1313          	cpw	x,(OFST+5,sp)
 960                     ; 549 			return 1u;
 962  02b7 2252          	jrugt	LC004
 963  02b9               L742:
 964                     ; 553 			return 0u;
 967  02b9 4f            	clr	a
 969  02ba               L021:
 971  02ba 5b10          	addw	sp,#16
 972  02bc 81            	ret	
 973  02bd               L542:
 974                     ; 559 	if (time > t0 )
 976  02bd 130d          	cpw	x,(OFST-1,sp)
 977  02bf 23f9          	jrule	L021
 978                     ; 561 		Dif = 65535 - time + t0;
 980  02c1 aeffff        	ldw	x,#65535
 981  02c4 72f00f        	subw	x,(OFST+1,sp)
 982  02c7 72fb0d        	addw	x,(OFST-1,sp)
 983  02ca bfbc          	ldw	_Dif,x
 984                     ; 562 		if ( ( 65535 - time + t0  ) > diff ) 
 986  02cc 1e0d          	ldw	x,(OFST-1,sp)
 987  02ce cd0000        	call	c_uitolx
 989  02d1 96            	ldw	x,sp
 990  02d2 1c0009        	addw	x,#OFST-5
 991  02d5 cd0000        	call	c_rtol
 994  02d8 1e0f          	ldw	x,(OFST+1,sp)
 995  02da cd0000        	call	c_uitolx
 997  02dd 96            	ldw	x,sp
 998  02de 1c0005        	addw	x,#OFST-9
 999  02e1 cd0000        	call	c_rtol
1002  02e4 aeffff        	ldw	x,#65535
1003  02e7 bf02          	ldw	c_lreg+2,x
1004  02e9 5f            	clrw	x
1005  02ea bf00          	ldw	c_lreg,x
1006  02ec 96            	ldw	x,sp
1007  02ed 1c0005        	addw	x,#OFST-9
1008  02f0 cd0000        	call	c_lsub
1010  02f3 96            	ldw	x,sp
1011  02f4 1c0009        	addw	x,#OFST-5
1012  02f7 cd0000        	call	c_ladd
1014  02fa 96            	ldw	x,sp
1015  02fb 5c            	incw	x
1016  02fc cd0000        	call	c_rtol
1019  02ff 1e13          	ldw	x,(OFST+5,sp)
1020  0301 cd0000        	call	c_uitolx
1022  0304 96            	ldw	x,sp
1023  0305 5c            	incw	x
1024  0306 cd0000        	call	c_lcmp
1026  0309 2eae          	jrsge	L742
1027                     ; 564 			return 1u;
1029  030b               LC004:
1031  030b a601          	ld	a,#1
1033  030d 20ab          	jra	L021
1034                     ; 568 			return 0u;
1036                     ; 571 }
1060                     ; 574 OnTimer_1S(void)
1060                     ; 575 {
1061                     	switch	.text
1062  030f               _OnTimer_1S:
1066                     ; 577 }
1069  030f 81            	ret	
1095                     ; 586 OnTimer_1mS(void)
1095                     ; 587 { 
1096                     	switch	.text
1097  0310               _OnTimer_1mS:
1101                     ; 589 	Ticks_1mS++;
1103  0310 bea1          	ldw	x,_Ticks_1mS
1104  0312 5c            	incw	x
1105  0313 bfa1          	ldw	_Ticks_1mS,x
1106                     ; 591 	Adc_Config( );
1108  0315 cd079a        	call	L3_Adc_Config
1110                     ; 593 	if ( PowerDelay_1mS )
1112  0318 be14          	ldw	x,_PowerDelay_1mS
1113  031a 2703          	jreq	L103
1114                     ; 594 		PowerDelay_1mS--;
1116  031c 5a            	decw	x
1117  031d bf14          	ldw	_PowerDelay_1mS,x
1118  031f               L103:
1119                     ; 595 }
1122  031f 81            	ret	
1151                     	switch	.const
1152  0008               L241:
1153  0008 00000013      	dc.l	19
1154                     ; 598 void OnTimer4(void)
1154                     ; 599 {
1155                     	switch	.text
1156  0320               _OnTimer4:
1160                     ; 600 	Adc_Config(  );
1162  0320 cd079a        	call	L3_Adc_Config
1164                     ; 601 	Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
1166  0323 4b10          	push	#16
1167  0325 ae5005        	ldw	x,#20485
1168  0328 cd0000        	call	_GPIO_ReadInputPin
1170  032b 5b01          	addw	sp,#1
1171  032d 4d            	tnz	a
1172  032e 2603          	jrne	L431
1173  0330 4c            	inc	a
1174  0331 2001          	jra	L041
1175  0333               L431:
1176  0333 4f            	clr	a
1177  0334               L041:
1178  0334 b782          	ld	_Drive+22,a
1179                     ; 603 	if (  Ticks_50uS < 19 )
1181  0336 ae00a3        	ldw	x,#_Ticks_50uS
1182  0339 cd0000        	call	c_ltor
1184  033c ae0008        	ldw	x,#L241
1185  033f cd0000        	call	c_lcmp
1187  0342 240a          	jruge	L313
1188                     ; 604 		Ticks_50uS++;
1190  0344 ae00a3        	ldw	x,#_Ticks_50uS
1191  0347 a601          	ld	a,#1
1192  0349 cd0000        	call	c_lgadc
1195  034c 2007          	jra	L513
1196  034e               L313:
1197                     ; 607 		Ticks_50uS = 0;
1199  034e 5f            	clrw	x
1200  034f bfa5          	ldw	_Ticks_50uS+2,x
1201  0351 bfa3          	ldw	_Ticks_50uS,x
1202                     ; 608 		OnTimer_1mS();
1204  0353 adbb          	call	_OnTimer_1mS
1206  0355               L513:
1207                     ; 612 	if ( Drive.Ticks > 0 )
1209  0355 be7d          	ldw	x,_Drive+17
1210  0357 2703          	jreq	L713
1211                     ; 613 		Drive.Ticks--;
1213  0359 5a            	decw	x
1214  035a bf7d          	ldw	_Drive+17,x
1215  035c               L713:
1216                     ; 615 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
1218  035c 7201006c0b    	btjf	_Drive,#0,L123
1220  0361 be7d          	ldw	x,_Drive+17
1221  0363 2607          	jrne	L123
1222                     ; 617 		DriveService();	
1224  0365 cd0594        	call	_DriveService
1226                     ; 618 		Drive.Ticks = Drive.Interval;
1228  0368 be7b          	ldw	x,_Drive+15
1229  036a bf7d          	ldw	_Drive+17,x
1230  036c               L123:
1231                     ; 620 }
1234  036c 81            	ret	
1260                     ; 622 void OnCaptureOVTim2(void)
1260                     ; 623 {
1261                     	switch	.text
1262  036d               _OnCaptureOVTim2:
1266                     ; 624 	if ( TIM2_GetITStatus( TIM2_IT_UPDATE)  != SET ) 
1268  036d a601          	ld	a,#1
1269  036f cd0000        	call	_TIM2_GetITStatus
1271  0372 4a            	dec	a
1272  0373 2701          	jreq	L333
1273                     ; 625 		return;
1276  0375 81            	ret	
1277  0376               L333:
1278                     ; 627 	Drive.PwmOF++;
1280  0376 3c97          	inc	_Drive+43
1281                     ; 629 	TIM2_ClearITPendingBit(TIM1_IT_UPDATE);
1283  0378 4c            	inc	a
1285                     ; 630 }
1288  0379 cc0000        	jp	_TIM2_ClearITPendingBit
1318                     ; 650 void OnCaptureTim2(void)
1318                     ; 651 {
1319                     	switch	.text
1320  037c               _OnCaptureTim2:
1322  037c 5204          	subw	sp,#4
1323       00000004      OFST:	set	4
1326                     ; 652 	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
1328  037e a602          	ld	a,#2
1329  0380 cd0000        	call	_TIM2_GetITStatus
1331  0383 4a            	dec	a
1332  0384 2703cc0465    	jrne	L373
1333                     ; 653 		return;
1335                     ; 655 	if ( Drive.PwmEdge == 0 ) 
1337  0389 720b006c03cc  	btjt	_Drive,#5,L743
1338                     ; 657 		Drive.PwmT2 = TIM2_GetCapture1();
1340  0391 cd0000        	call	_TIM2_GetCapture1
1342  0394 bf8f          	ldw	_Drive+35,x
1343                     ; 658 		TIM2_ClearITPendingBit(TIM1_IT_CC1);
1345  0396 a602          	ld	a,#2
1346  0398 cd0000        	call	_TIM2_ClearITPendingBit
1348                     ; 659 		Drive.PwmEdge = 1;
1350  039b 721a006c      	bset	_Drive,#5
1351                     ; 661 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
1351                     ; 662                TIM2_ICPSC_DIV8, 0x0) ;
1353  039f 4b00          	push	#0
1354  03a1 4b0c          	push	#12
1355  03a3 4b01          	push	#1
1356  03a5 ae0044        	ldw	x,#68
1357  03a8 cd0000        	call	_TIM2_ICInit
1359  03ab 5b03          	addw	sp,#3
1360                     ; 664 		if ( Drive.PwmT2 > Drive.PwmT1 ) 
1362  03ad be8f          	ldw	x,_Drive+35
1363  03af b38d          	cpw	x,_Drive+33
1364  03b1 2311          	jrule	L153
1365                     ; 666 			if ( Drive.PwmOF == 0 )
1367  03b3 b697          	ld	a,_Drive+43
1368  03b5 2606          	jrne	L353
1369                     ; 668 				Drive.PwmT4 = Drive.PwmT2 - Drive.PwmT1;
1371  03b7 72b0008d      	subw	x,_Drive+33
1373  03bb 2003          	jp	LC005
1374  03bd               L353:
1375                     ; 672 				Drive.PwmT4 = 0xffff;
1377  03bd aeffff        	ldw	x,#65535
1378  03c0               LC005:
1379  03c0 bf95          	ldw	_Drive+41,x
1380  03c2 2019          	jra	L753
1381  03c4               L153:
1382                     ; 678 			if ( Drive.PwmOF == 1 )
1384  03c4 b697          	ld	a,_Drive+43
1385  03c6 4a            	dec	a
1386  03c7 260d          	jrne	L163
1387                     ; 680 				Drive.PwmT4 = 0xffff - Drive.PwmT1 + Drive.PwmT2;
1389  03c9 aeffff        	ldw	x,#65535
1390  03cc 72b0008d      	subw	x,_Drive+33
1391  03d0 72bb008f      	addw	x,_Drive+35
1393  03d4 2003          	jra	L363
1394  03d6               L163:
1395                     ; 684 				Drive.PwmT4 = 0xffff;
1397  03d6 aeffff        	ldw	x,#65535
1398  03d9               L363:
1399  03d9 bf95          	ldw	_Drive+41,x
1400                     ; 686 			Drive.PwmOF = 0;
1402  03db 3f97          	clr	_Drive+43
1403  03dd               L753:
1404                     ; 692 		if ( Drive.PwmT3 == 0xffff || Drive.PwmT4 == 0xffff )
1406  03dd be93          	ldw	x,_Drive+39
1407  03df 5c            	incw	x
1408  03e0 2705          	jreq	L763
1410  03e2 be95          	ldw	x,_Drive+41
1411  03e4 5c            	incw	x
1412  03e5 2609          	jrne	L563
1413  03e7               L763:
1414                     ; 694 			Drive.PwmDuty = 0u;
1416  03e7 5f            	clrw	x
1417  03e8 bf91          	ldw	_Drive+37,x
1419  03ea               L173:
1420                     ; 702 		Timer.PwmUpdate = Ticks_1mS;		
1422  03ea bea1          	ldw	x,_Ticks_1mS
1423  03ec bf50          	ldw	_Timer+8,x
1425  03ee 2075          	jra	L373
1426  03f0               L563:
1427                     ; 698 			Drive.PwmDuty = ( Drive.PwmT3 * (uint32_t)400 / ( Drive.PwmT3 + Drive.PwmT4 ) ) + 1 ;
1429  03f0 be93          	ldw	x,_Drive+39
1430  03f2 72bb0095      	addw	x,_Drive+41
1431  03f6 cd0000        	call	c_uitolx
1433  03f9 96            	ldw	x,sp
1434  03fa 5c            	incw	x
1435  03fb cd0000        	call	c_rtol
1438  03fe be93          	ldw	x,_Drive+39
1439  0400 90ae0190      	ldw	y,#400
1440  0404 cd0000        	call	c_umul
1442  0407 96            	ldw	x,sp
1443  0408 5c            	incw	x
1444  0409 cd0000        	call	c_ludv
1446  040c a601          	ld	a,#1
1447  040e cd0000        	call	c_ladc
1449  0411 be02          	ldw	x,c_lreg+2
1450  0413 bf91          	ldw	_Drive+37,x
1451                     ; 699 			Drive.PwmDuty /= 2;
1453  0415 3491          	srl	_Drive+37
1454  0417 3692          	rrc	_Drive+38
1455  0419 20cf          	jra	L173
1456  041b               L743:
1457                     ; 706 		Drive.PwmT1 = TIM2_GetCapture1();
1459  041b cd0000        	call	_TIM2_GetCapture1
1461  041e bf8d          	ldw	_Drive+33,x
1462                     ; 707 		TIM2_ClearITPendingBit(TIM1_IT_CC1);
1464  0420 a602          	ld	a,#2
1465  0422 cd0000        	call	_TIM2_ClearITPendingBit
1467                     ; 708 		Drive.PwmEdge = 0;	
1469  0425 721b006c      	bres	_Drive,#5
1470                     ; 710 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
1470                     ; 711                TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
1472  0429 4b00          	push	#0
1473  042b 4b0c          	push	#12
1474  042d 4b01          	push	#1
1475  042f 5f            	clrw	x
1476  0430 cd0000        	call	_TIM2_ICInit
1478  0433 5b03          	addw	sp,#3
1479                     ; 713 		if ( Drive.PwmT1 > Drive.PwmT2 ) 
1481  0435 be8d          	ldw	x,_Drive+33
1482  0437 b38f          	cpw	x,_Drive+35
1483  0439 2311          	jrule	L573
1484                     ; 715 			if ( Drive.PwmOF == 0 )
1486  043b b697          	ld	a,_Drive+43
1487  043d 2606          	jrne	L773
1488                     ; 717 				Drive.PwmT3 = Drive.PwmT1 - Drive.PwmT2;
1490  043f 72b0008f      	subw	x,_Drive+35
1492  0443 2003          	jp	LC006
1493  0445               L773:
1494                     ; 721 				Drive.PwmT3 = 0xffff;
1496  0445 aeffff        	ldw	x,#65535
1497  0448               LC006:
1498  0448 bf93          	ldw	_Drive+39,x
1499  044a 2019          	jra	L373
1500  044c               L573:
1501                     ; 727 			if ( Drive.PwmOF == 1 )
1503  044c b697          	ld	a,_Drive+43
1504  044e 4a            	dec	a
1505  044f 260d          	jrne	L504
1506                     ; 729 				Drive.PwmT3 = 0xffff - Drive.PwmT2 + Drive.PwmT1;
1508  0451 aeffff        	ldw	x,#65535
1509  0454 72b0008f      	subw	x,_Drive+35
1510  0458 72bb008d      	addw	x,_Drive+33
1512  045c 2003          	jra	L704
1513  045e               L504:
1514                     ; 733 				Drive.PwmT3 = 0xffff;
1516  045e aeffff        	ldw	x,#65535
1517  0461               L704:
1518  0461 bf93          	ldw	_Drive+39,x
1519                     ; 735 			Drive.PwmOF = 0;
1521  0463 3f97          	clr	_Drive+43
1522  0465               L373:
1523                     ; 742 }
1526  0465 5b04          	addw	sp,#4
1527  0467 81            	ret	
1551                     ; 754 void StopDrive(void)			//TROff()
1551                     ; 755 {
1552                     	switch	.text
1553  0468               _StopDrive:
1557                     ; 757 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1559  0468 4b40          	push	#64
1560  046a ae500a        	ldw	x,#20490
1561  046d cd0000        	call	_GPIO_WriteLow
1563  0470 84            	pop	a
1564                     ; 758 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1566  0471 4b08          	push	#8
1567  0473 ae500a        	ldw	x,#20490
1568  0476 cd0000        	call	_GPIO_WriteLow
1570  0479 84            	pop	a
1571                     ; 759 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1573  047a 4b80          	push	#128
1574  047c ae500a        	ldw	x,#20490
1575  047f cd0000        	call	_GPIO_WriteLow
1577  0482 84            	pop	a
1578                     ; 760 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
1580  0483 4b08          	push	#8
1581  0485 ae5000        	ldw	x,#20480
1582  0488 cd0000        	call	_GPIO_WriteLow
1584  048b 84            	pop	a
1585                     ; 761 }
1588  048c 81            	ret	
1635                     ; 767 void StartDriveOR( uint16_t Target, uint8_t overrun )
1635                     ; 768 {
1636                     	switch	.text
1637  048d               _StartDriveOR:
1639  048d 89            	pushw	x
1640       00000000      OFST:	set	0
1643                     ; 776 	if ( Drive.Run ) return;
1645  048e 7202006c06    	btjt	_Drive,#1,L022
1648                     ; 777 	if ( Drive.Position == Target ) return;
1650  0493 be6d          	ldw	x,_Drive+1
1651  0495 1301          	cpw	x,(OFST+1,sp)
1652  0497 2602          	jrne	L544
1654  0499               L022:
1657  0499 85            	popw	x
1658  049a 81            	ret	
1659  049b               L544:
1660                     ; 779 	mStep[iStep]=Target;//Drive.Step;
1662  049b b607          	ld	a,_iStep
1663  049d 5f            	clrw	x
1664  049e 97            	ld	xl,a
1665  049f 58            	sllw	x
1666  04a0 1601          	ldw	y,(OFST+1,sp)
1667  04a2 ef08          	ldw	(_mStep,x),y
1668                     ; 781 	if (iStep<31)
1670  04a4 a11f          	cp	a,#31
1671  04a6 2404          	jruge	L744
1672                     ; 782 	  iStep ++;
1674  04a8 3c07          	inc	_iStep
1676  04aa 2002          	jra	L154
1677  04ac               L744:
1678                     ; 784 		iStep = 0;	
1680  04ac 3f07          	clr	_iStep
1681  04ae               L154:
1682                     ; 787 	if ( Target == 0 )				//  goto origin
1684  04ae 1e01          	ldw	x,(OFST+1,sp)
1685  04b0 261c          	jrne	L354
1686                     ; 789 		Drive.Overrun =	0u;
1688  04b2 5f            	clrw	x
1689  04b3 bf71          	ldw	_Drive+5,x
1690                     ; 790 		Drive.ZeroOffset = CPulse( OVER_STEP );
1692  04b5 ae001e        	ldw	x,#30
1693  04b8 cd06cf        	call	_CPulse
1695  04bb bf74          	ldw	_Drive+8,x
1696                     ; 792 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
1698  04bd be6d          	ldw	x,_Drive+1
1699  04bf 72bb0074      	addw	x,_Drive+8
1700  04c3 bf6d          	ldw	_Drive+1,x
1701                     ; 793 		Drive.Target = 0u;
1703  04c5 5f            	clrw	x
1704  04c6 bf6f          	ldw	_Drive+3,x
1705                     ; 795 		Drive.Dir = nMotorClose;		// 0;
1707  04c8 7219006c      	bres	_Drive,#4
1709  04cc 202c          	jra	L554
1710  04ce               L354:
1711                     ; 802 		if (Drive.Position >= Target)		// Closing
1713  04ce be6d          	ldw	x,_Drive+1
1714  04d0 1301          	cpw	x,(OFST+1,sp)
1715  04d2 250f          	jrult	L754
1716                     ; 804 			Drive.Overrun =	0u;
1718  04d4 5f            	clrw	x
1719  04d5 bf71          	ldw	_Drive+5,x
1720                     ; 806 			Drive.Dir = nMotorClose;
1722  04d7 7219006c      	bres	_Drive,#4
1723                     ; 807 			Drive.Overrun2 = 0u;
1725  04db 3f73          	clr	_Drive+7
1726                     ; 808 			Drive.Target = Target;
1728  04dd 1e01          	ldw	x,(OFST+1,sp)
1729  04df bf6f          	ldw	_Drive+3,x
1731  04e1 2017          	jra	L554
1732  04e3               L754:
1733                     ; 814 			Drive.Dir = nMotorOpen;	//1;
1735  04e3 7218006c      	bset	_Drive,#4
1736                     ; 823 				Drive.Overrun2 = overrun;		//100;
1738  04e7 7b05          	ld	a,(OFST+5,sp)
1739  04e9 b773          	ld	_Drive+7,a
1740                     ; 824 				Drive.Target = Target + overrun;	//100;	
1742  04eb 7b01          	ld	a,(OFST+1,sp)
1743  04ed 97            	ld	xl,a
1744  04ee 7b02          	ld	a,(OFST+2,sp)
1745  04f0 1b05          	add	a,(OFST+5,sp)
1746  04f2 2401          	jrnc	L612
1747  04f4 5c            	incw	x
1748  04f5               L612:
1749  04f5 b770          	ld	_Drive+4,a
1750  04f7 9f            	ld	a,xl
1751  04f8 b76f          	ld	_Drive+3,a
1752  04fa               L554:
1753                     ; 829 	Drive.Run = TRUE;
1755  04fa 7212006c      	bset	_Drive,#1
1756                     ; 830 	Drive.Ticks = Drive.Interval;
1758  04fe be7b          	ldw	x,_Drive+15
1759  0500 bf7d          	ldw	_Drive+17,x
1760                     ; 831 }
1762  0502 2095          	jra	L022
1820                     ; 837 void MotorStep(MOTOR_DIR Dir)
1820                     ; 838 {
1821                     	switch	.text
1822  0504               _MotorStep:
1826                     ; 839 	if ( Dir == nMotorClose )
1828  0504 4d            	tnz	a
1829  0505 2627          	jrne	L715
1830                     ; 841 		if ( Drive.Position != 0 ) 
1832  0507 be6d          	ldw	x,_Drive+1
1833  0509 270d          	jreq	L125
1834                     ; 843 			Drive.Position--;
1836  050b 5a            	decw	x
1837  050c bf6d          	ldw	_Drive+1,x
1838                     ; 844 			if ( Drive.NormalOpen )
1840  050e b683          	ld	a,_Drive+23
1841  0510 2704          	jreq	L325
1842                     ; 845 				Drive.Phase++;   // NC
1844  0512 3c76          	inc	_Drive+10
1846  0514 2002          	jra	L125
1847  0516               L325:
1848                     ; 848 				Drive.Phase--;	//NC
1850  0516 3a76          	dec	_Drive+10
1851  0518               L125:
1852                     ; 852 		if ( Drive.Position == 0 ) 
1854  0518 be6d          	ldw	x,_Drive+1
1855  051a 2643          	jrne	L135
1856                     ; 855 			Drive.Overrun = 0u;
1858  051c 5f            	clrw	x
1859  051d bf71          	ldw	_Drive+5,x
1860                     ; 856 			Drive.Run = FALSE;
1862  051f 7213006c      	bres	_Drive,#1
1863                     ; 857 			Drive.ZeroOffset = 0u;
1865  0523 bf74          	ldw	_Drive+8,x
1866                     ; 858 			Drive.Position = 0u;
1868  0525 bf6d          	ldw	_Drive+1,x
1869                     ; 859 			Drive.Target = 0u;
1871  0527 bf6f          	ldw	_Drive+3,x
1872                     ; 860 			StopDrive();	
1874  0529 cd0468        	call	_StopDrive
1876  052c 2031          	jra	L135
1877  052e               L715:
1878                     ; 866 			Drive.Position++;
1880  052e be6d          	ldw	x,_Drive+1
1881  0530 5c            	incw	x
1882  0531 bf6d          	ldw	_Drive+1,x
1883                     ; 868 		if ( Drive.NormalOpen )
1885  0533 b683          	ld	a,_Drive+23
1886  0535 2704          	jreq	L335
1887                     ; 869 				Drive.Phase--;
1889  0537 3a76          	dec	_Drive+10
1891  0539 2002          	jra	L535
1892  053b               L335:
1893                     ; 871 				Drive.Phase++;
1895  053b 3c76          	inc	_Drive+10
1896  053d               L535:
1897                     ; 874 		if ( Drive.Origin ) 
1899  053d b682          	ld	a,_Drive+22
1900  053f 2708          	jreq	L735
1901                     ; 876 			Drive.ORGPosition = Drive.Position;
1903  0541 bf79          	ldw	_Drive+13,x
1904                     ; 877 			Drive.LastOrigin = TRUE;
1906  0543 7214006c      	bset	_Drive,#2
1908  0547 2016          	jra	L135
1909  0549               L735:
1910                     ; 880 			if ( Drive.LastOrigin )
1912  0549 7205006c11    	btjf	_Drive,#2,L135
1913                     ; 882 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1915  054e be79          	ldw	x,_Drive+13
1916  0550 1d0028        	subw	x,#40
1917  0553 bf77          	ldw	_Drive+11,x
1918                     ; 883 				if ( Drive.MaxOverrun > OVERRUN )
1920  0555 a3012d        	cpw	x,#301
1921  0558 2505          	jrult	L135
1922                     ; 884 					Drive.MaxOverrun = OVERRUN;				
1924  055a ae012c        	ldw	x,#300
1925  055d bf77          	ldw	_Drive+11,x
1926  055f               L135:
1927                     ; 889 	if ( !Drive.Run ) return;
1929  055f 7202006c01    	btjt	_Drive,#1,L745
1933  0564 81            	ret	
1934  0565               L745:
1935                     ; 890 	if ( !Drive.Enabled ) return;
1937  0565 7200006c01    	btjt	_Drive,#0,L155
1941  056a 81            	ret	
1942  056b               L155:
1943                     ; 891 	switch ( Drive.ExcitationType )
1945  056b b681          	ld	a,_Drive+21
1946  056d 4a            	dec	a
1947  056e 2602          	jrne	L555
1950                     ; 894 		case 0:
1950                     ; 895 			//Excitation_1Phase();	
1950                     ; 896 			break;
1952                     ; 897 		case 1:
1952                     ; 898 			Excitation_12Phase();
1954  0570 ad65          	call	_Excitation_12Phase
1956                     ; 899 			break;
1958                     ; 900 		case 2:
1958                     ; 901 			//Excitation_2Phase();
1958                     ; 902 			break;
1960  0572               L555:
1961                     ; 907 }
1964  0572 81            	ret	
1990                     ; 912 void MotorClose(void)
1990                     ; 913 {
1991                     	switch	.text
1992  0573               _MotorClose:
1996                     ; 914 	if ( Drive.Origin )   		// Hall IC Sensing 
1998  0573 b682          	ld	a,_Drive+22
1999  0575 2719          	jreq	L765
2000                     ; 916 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
2002  0577 be71          	ldw	x,_Drive+5
2003  0579 b377          	cpw	x,_Drive+11
2004  057b 2510          	jrult	L175
2005                     ; 918 			Drive.Target = 0u;
2007  057d 5f            	clrw	x
2008  057e bf6f          	ldw	_Drive+3,x
2009                     ; 919 			Drive.Position = 0u;
2011  0580 bf6d          	ldw	_Drive+1,x
2012                     ; 920 			Drive.Overrun = 0u;
2014  0582 bf71          	ldw	_Drive+5,x
2015                     ; 921 			Drive.ZeroOffset = 0u;
2017  0584 bf74          	ldw	_Drive+8,x
2018                     ; 922 			Drive.Run = FALSE;			
2020  0586 7213006c      	bres	_Drive,#1
2021                     ; 923 			StopDrive();
2026  058a cc0468        	jp	_StopDrive
2027  058d               L175:
2028                     ; 927 			Drive.Overrun++;
2030  058d 5c            	incw	x
2031  058e bf71          	ldw	_Drive+5,x
2032                     ; 928 			MotorStep(nMotorClose);
2034  0590               L765:
2035                     ; 932 		MotorStep(nMotorClose);		// move 1 step close
2038  0590 4f            	clr	a
2040                     ; 933 }
2043  0591 cc0504        	jp	_MotorStep
2070                     ; 938 void DriveService(void)
2070                     ; 939 {
2071                     	switch	.text
2072  0594               _DriveService:
2074  0594 89            	pushw	x
2075       00000002      OFST:	set	2
2078                     ; 949 	if ( ! Drive.Run ) 
2080  0595 7202006c02    	btjt	_Drive,#1,L706
2081                     ; 951 		StopDrive();
2083                     ; 952 		return;	//when Drive is stop 
2085  059a 2035          	jp	LC008
2086  059c               L706:
2087                     ; 959 	if ( Drive.Target > Drive.Position )
2089  059c be6f          	ldw	x,_Drive+3
2090  059e b36d          	cpw	x,_Drive+1
2091  05a0 2307          	jrule	L116
2092                     ; 960 	 	MotorStep(nMotorOpen);
2094  05a2 a601          	ld	a,#1
2095  05a4 cd0504        	call	_MotorStep
2098  05a7 202b          	jra	L316
2099  05a9               L116:
2100                     ; 961 	else if ( Drive.Target < Drive.Position )
2102  05a9 b36d          	cpw	x,_Drive+1
2103  05ab 2404          	jruge	L516
2104                     ; 962 		MotorClose( );
2106  05ad adc4          	call	_MotorClose
2109  05af 2023          	jra	L316
2110  05b1               L516:
2111                     ; 963 	else if ( Drive.Target ) 	// on target position
2113  05b1 be6f          	ldw	x,_Drive+3
2114  05b3 2713          	jreq	L326
2115                     ; 965 			if ( Drive.Overrun2 )
2117  05b5 b673          	ld	a,_Drive+7
2118  05b7 270f          	jreq	L326
2119                     ; 967 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
2121  05b9 5f            	clrw	x
2122  05ba 97            	ld	xl,a
2123  05bb 1f01          	ldw	(OFST-1,sp),x
2125  05bd be6f          	ldw	x,_Drive+3
2126  05bf 72f001        	subw	x,(OFST-1,sp)
2127  05c2 bf6f          	ldw	_Drive+3,x
2128                     ; 968 				Drive.Overrun2 = 0u;
2130  05c4 3f73          	clr	_Drive+7
2132  05c6 200c          	jra	L316
2133  05c8               L326:
2134                     ; 972 				Drive.ZeroOffset = 0u;
2135                     ; 973 				Drive.Overrun = 0u;
2136                     ; 974 				Drive.Run = FALSE;
2137                     ; 975 				StopDrive();		
2139                     ; 981 			Drive.ZeroOffset = 0u;
2141                     ; 982 			Drive.Overrun = 0u;
2143                     ; 983 			Drive.Run = FALSE;
2146  05c8 5f            	clrw	x
2147  05c9 bf74          	ldw	_Drive+8,x
2149  05cb bf71          	ldw	_Drive+5,x
2151  05cd 7213006c      	bres	_Drive,#1
2152                     ; 984 			StopDrive();	
2154  05d1               LC008:
2157  05d1 cd0468        	call	_StopDrive
2159  05d4               L316:
2160                     ; 986 }
2163  05d4 85            	popw	x
2164  05d5 81            	ret	
2187                     ; 989 void Excitation_2Phase( void )
2187                     ; 990 {
2188                     	switch	.text
2189  05d6               _Excitation_2Phase:
2193                     ; 1049 }
2196  05d6 81            	ret	
2222                     ; 1052 void Excitation_12Phase( void )
2222                     ; 1053 {
2223                     	switch	.text
2224  05d7               _Excitation_12Phase:
2228                     ; 1055 	switch (Drive.Phase%8)
2230  05d7 b676          	ld	a,_Drive+10
2231  05d9 a407          	and	a,#7
2233                     ; 1106 		default:
2233                     ; 1107 			break;
2234  05db 2716          	jreq	L146
2235  05dd 4a            	dec	a
2236  05de 271d          	jreq	L346
2237  05e0 4a            	dec	a
2238  05e1 272d          	jreq	L546
2239  05e3 4a            	dec	a
2240  05e4 273f          	jreq	L746
2241  05e6 4a            	dec	a
2242  05e7 2748          	jreq	L156
2243  05e9 4a            	dec	a
2244  05ea 2753          	jreq	L356
2245  05ec 4a            	dec	a
2246  05ed 276e          	jreq	L556
2247  05ef 4a            	dec	a
2248  05f0 2775          	jreq	L756
2250  05f2 81            	ret	
2251  05f3               L146:
2252                     ; 1057 		case 0:
2252                     ; 1058 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2254  05f3 4b40          	push	#64
2255  05f5 ae500a        	ldw	x,#20490
2256  05f8 cd0000        	call	_GPIO_WriteHigh
2258                     ; 1059 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2260                     ; 1060 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2262                     ; 1061 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2264                     ; 1062 			break;
2266  05fb 2008          	jp	LC013
2267  05fd               L346:
2268                     ; 1063 		case 1:
2268                     ; 1064 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2270  05fd 4b40          	push	#64
2271  05ff ae500a        	ldw	x,#20490
2272  0602 cd0000        	call	_GPIO_WriteLow
2274                     ; 1065 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2276  0605               LC013:
2277  0605 84            	pop	a
2279  0606 4b08          	push	#8
2280  0608 ae500a        	ldw	x,#20490
2281  060b cd0000        	call	_GPIO_WriteHigh
2283                     ; 1066 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2285                     ; 1067 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2287                     ; 1068 			break;		
2289  060e 2068          	jp	LC012
2290  0610               L546:
2291                     ; 1069 		case 2:
2291                     ; 1070 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2293  0610 ad7a          	call	LC017
2294                     ; 1071 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2296  0612 4b08          	push	#8
2297  0614 ae500a        	ldw	x,#20490
2298  0617 cd0000        	call	_GPIO_WriteHigh
2300                     ; 1072 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2302  061a               LC014:
2303  061a 84            	pop	a
2305  061b 4b80          	push	#128
2306  061d ae500a        	ldw	x,#20490
2307  0620 cd0000        	call	_GPIO_WriteHigh
2309                     ; 1073 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2311                     ; 1074 			break;
2313  0623 205c          	jp	LC011
2314  0625               L746:
2315                     ; 1075 		case 3:
2315                     ; 1076 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2317  0625 ad65          	call	LC017
2318                     ; 1077 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2320  0627 4b08          	push	#8
2321  0629 ae500a        	ldw	x,#20490
2322  062c cd0000        	call	_GPIO_WriteLow
2324                     ; 1078 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2326                     ; 1079 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2328                     ; 1080 			break;
2330  062f 20e9          	jp	LC014
2331  0631               L156:
2332                     ; 1081 		case 4:
2332                     ; 1082 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2334  0631 ad59          	call	LC017
2335                     ; 1083 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2337  0633 ad61          	call	LC018
2338                     ; 1084 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2340  0635 4b80          	push	#128
2341  0637 ae500a        	ldw	x,#20490
2342  063a cd0000        	call	_GPIO_WriteHigh
2344                     ; 1085 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2346                     ; 1086 			break;
2348  063d 2013          	jp	LC015
2349  063f               L356:
2350                     ; 1087 		case 5: 
2350                     ; 1088 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2352  063f 4b40          	push	#64
2353  0641 ae500a        	ldw	x,#20490
2354  0644 cd0000        	call	_GPIO_WriteLow
2356                     ; 1089 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2359                     ; 1090 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2361  0647               LC016:
2362  0647 84            	pop	a
2364  0648 ad4c          	call	LC018
2366  064a 4b80          	push	#128
2367  064c ae500a        	ldw	x,#20490
2368  064f cd0000        	call	_GPIO_WriteLow
2370                     ; 1091 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2372  0652               LC015:
2373  0652 84            	pop	a
2376  0653 4b08          	push	#8
2377  0655 ae5000        	ldw	x,#20480
2378  0658 cd0000        	call	_GPIO_WriteHigh
2380                     ; 1092 			break;
2382  065b 202d          	jp	LC010
2383  065d               L556:
2384                     ; 1093 		case 6:  
2384                     ; 1094 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2386  065d 4b40          	push	#64
2387  065f ae500a        	ldw	x,#20490
2388  0662 cd0000        	call	_GPIO_WriteHigh
2390                     ; 1095 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2392                     ; 1096 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2394                     ; 1097 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2396                     ; 1098 			break;
2398  0665 20e0          	jp	LC016
2399  0667               L756:
2400                     ; 1099 		case 7:
2400                     ; 1100 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2402  0667 4b40          	push	#64
2403  0669 ae500a        	ldw	x,#20490
2404  066c cd0000        	call	_GPIO_WriteHigh
2406  066f 84            	pop	a
2407                     ; 1101 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2409  0670 4b08          	push	#8
2410  0672 ae500a        	ldw	x,#20490
2411  0675 cd0000        	call	_GPIO_WriteLow
2413                     ; 1102 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2415  0678               LC012:
2416  0678 84            	pop	a
2419  0679 4b80          	push	#128
2420  067b ae500a        	ldw	x,#20490
2421  067e cd0000        	call	_GPIO_WriteLow
2423                     ; 1103 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2425  0681               LC011:
2426  0681 84            	pop	a
2431  0682 4b08          	push	#8
2432  0684 ae5000        	ldw	x,#20480
2433  0687 cd0000        	call	_GPIO_WriteLow
2435  068a               LC010:
2436  068a 84            	pop	a
2437                     ; 1104 			break;
2439                     ; 1106 		default:
2439                     ; 1107 			break;
2441                     ; 1110 }
2444  068b 81            	ret	
2445  068c               LC017:
2446  068c 4b40          	push	#64
2447  068e ae500a        	ldw	x,#20490
2448  0691 cd0000        	call	_GPIO_WriteLow
2450  0694 84            	pop	a
2451  0695 81            	ret	
2452  0696               LC018:
2453  0696 4b08          	push	#8
2454  0698 ae500a        	ldw	x,#20490
2455  069b cd0000        	call	_GPIO_WriteLow
2457  069e 84            	pop	a
2458  069f 81            	ret	
2481                     ; 1112 void Excitation_1Phase( void )
2481                     ; 1113 {
2482                     	switch	.text
2483  06a0               _Excitation_1Phase:
2487                     ; 1150 }
2490  06a0 81            	ret	
2533                     	switch	.const
2534  000c               L663:
2535  000c 00000960      	dc.l	2400
2536                     ; 1177 uint16_t CStep( uint16_t pulse )
2536                     ; 1178 {
2537                     	switch	.text
2538  06a1               _CStep:
2540  06a1 5204          	subw	sp,#4
2541       00000004      OFST:	set	4
2544                     ; 1181 	i = (uint32_t) pulse * 200u / (2400UL);
2546  06a3 a6c8          	ld	a,#200
2547  06a5 cd0000        	call	c_cmulx
2549  06a8 ae000c        	ldw	x,#L663
2550  06ab cd0000        	call	c_ludv
2552  06ae 96            	ldw	x,sp
2553  06af 5c            	incw	x
2554  06b0 cd0000        	call	c_rtol
2557                     ; 1182 	i = (i+1)/2;   				// Round up  20150925
2559  06b3 96            	ldw	x,sp
2560  06b4 5c            	incw	x
2561  06b5 cd0000        	call	c_ltor
2563  06b8 a601          	ld	a,#1
2564  06ba cd0000        	call	c_ladc
2566  06bd 3400          	srl	c_lreg
2567  06bf 3601          	rrc	c_lreg+1
2568  06c1 3602          	rrc	c_lreg+2
2569  06c3 96            	ldw	x,sp
2570  06c4 3603          	rrc	c_lreg+3
2571  06c6 5c            	incw	x
2572  06c7 cd0000        	call	c_rtol
2575                     ; 1183 	return (uint16_t) i;
2577  06ca 1e03          	ldw	x,(OFST-1,sp)
2580  06cc 5b04          	addw	sp,#4
2581  06ce 81            	ret	
2624                     ; 1187 uint16_t CPulse( uint16_t step )
2624                     ; 1188 {
2625                     	switch	.text
2626  06cf               _CPulse:
2628  06cf 89            	pushw	x
2629       00000002      OFST:	set	2
2632                     ; 1192 		i= (uint32_t) step *(26UL);  // 20180509  change to 5200 pulse
2634  06d0 90ae001a      	ldw	y,#26
2635  06d4 cd0000        	call	c_imul
2638                     ; 1194 	return (uint16_t) i;
2642  06d7 5b02          	addw	sp,#2
2643  06d9 81            	ret	
2672                     ; 1205 void Clock_Config(void)
2672                     ; 1206 {
2673                     	switch	.text
2674  06da               _Clock_Config:
2678                     ; 1208 	CLK_DeInit();
2680  06da cd0000        	call	_CLK_DeInit
2682                     ; 1209 	CLK_HSICmd(ENABLE);
2684  06dd a601          	ld	a,#1
2685  06df cd0000        	call	_CLK_HSICmd
2687                     ; 1210 	CLK_LSICmd(DISABLE);
2689  06e2 4f            	clr	a
2690  06e3 cd0000        	call	_CLK_LSICmd
2692                     ; 1211 	CLK_HSECmd(DISABLE);
2694  06e6 4f            	clr	a
2695  06e7 cd0000        	call	_CLK_HSECmd
2697                     ; 1213 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2699  06ea 4f            	clr	a
2700  06eb cd0000        	call	_CLK_HSIPrescalerConfig
2702                     ; 1214 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2704  06ee a680          	ld	a,#128
2706                     ; 1215 }
2709  06f0 cc0000        	jp	_CLK_SYSCLKConfig
2734                     ; 1218 void Gpio_Config(void)
2734                     ; 1219 {
2735                     	switch	.text
2736  06f3               _Gpio_Config:
2740                     ; 1221   GPIO_Init( _LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2742  06f3 4be0          	push	#224
2743  06f5 4b04          	push	#4
2744  06f7 ae5000        	ldw	x,#20480
2745  06fa cd0000        	call	_GPIO_Init
2747  06fd 85            	popw	x
2748                     ; 1225 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2750  06fe 4be0          	push	#224
2751  0700 4b40          	push	#64
2752  0702 ae500a        	ldw	x,#20490
2753  0705 cd0000        	call	_GPIO_Init
2755  0708 85            	popw	x
2756                     ; 1226 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2758  0709 4be0          	push	#224
2759  070b 4b80          	push	#128
2760  070d ae500a        	ldw	x,#20490
2761  0710 cd0000        	call	_GPIO_Init
2763  0713 85            	popw	x
2764                     ; 1227 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2766  0714 4be0          	push	#224
2767  0716 4b08          	push	#8
2768  0718 ae500a        	ldw	x,#20490
2769  071b cd0000        	call	_GPIO_Init
2771  071e 85            	popw	x
2772                     ; 1228 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2774  071f 4be0          	push	#224
2775  0721 4b08          	push	#8
2776  0723 ae5000        	ldw	x,#20480
2777  0726 cd0000        	call	_GPIO_Init
2779  0729 85            	popw	x
2780                     ; 1230 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2782  072a 4b40          	push	#64
2783  072c ae500a        	ldw	x,#20490
2784  072f cd0000        	call	_GPIO_WriteLow
2786  0732 84            	pop	a
2787                     ; 1231 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2789  0733 4b08          	push	#8
2790  0735 ae500a        	ldw	x,#20490
2791  0738 cd0000        	call	_GPIO_WriteLow
2793  073b 84            	pop	a
2794                     ; 1232 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2796  073c 4b80          	push	#128
2797  073e ae500a        	ldw	x,#20490
2798  0741 cd0000        	call	_GPIO_WriteLow
2800  0744 84            	pop	a
2801                     ; 1233 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2803  0745 4b08          	push	#8
2804  0747 ae5000        	ldw	x,#20480
2805  074a cd0000        	call	_GPIO_WriteLow
2807  074d 84            	pop	a
2808                     ; 1236   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2810  074e 4b00          	push	#0
2811  0750 4b10          	push	#16
2812  0752 ae5005        	ldw	x,#20485
2813  0755 cd0000        	call	_GPIO_Init
2815  0758 85            	popw	x
2816                     ; 1239 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
2818  0759 4b00          	push	#0
2819  075b 4b04          	push	#4
2820  075d ae500f        	ldw	x,#20495
2821  0760 cd0000        	call	_GPIO_Init
2823  0763 85            	popw	x
2824                     ; 1241 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2826  0764 4b00          	push	#0
2827  0766 4b10          	push	#16
2828  0768 ae500f        	ldw	x,#20495
2829  076b cd0000        	call	_GPIO_Init
2831  076e 85            	popw	x
2832                     ; 1243 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2834  076f 4b00          	push	#0
2835  0771 4b10          	push	#16
2836  0773 ae500a        	ldw	x,#20490
2837  0776 cd0000        	call	_GPIO_Init
2839  0779 85            	popw	x
2840                     ; 1244 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
2842  077a 4b00          	push	#0
2843  077c 4b08          	push	#8
2844  077e ae500f        	ldw	x,#20495
2845  0781 cd0000        	call	_GPIO_Init
2847  0784 85            	popw	x
2848                     ; 1246 }
2851  0785 81            	ret	
2878                     ; 1299 void Timer4_Config(void)
2878                     ; 1300 {
2879                     	switch	.text
2880  0786               L5_Timer4_Config:
2884                     ; 1301   TIM4_DeInit();
2886  0786 cd0000        	call	_TIM4_DeInit
2888                     ; 1307 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
2890  0789 ae0432        	ldw	x,#1074
2891  078c cd0000        	call	_TIM4_TimeBaseInit
2893                     ; 1310   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2895  078f ae0101        	ldw	x,#257
2896  0792 cd0000        	call	_TIM4_ITConfig
2898                     ; 1313   TIM4_Cmd(ENABLE);
2900  0795 a601          	ld	a,#1
2902                     ; 1314 }
2905  0797 cc0000        	jp	_TIM4_Cmd
2933                     ; 1317 static void Adc_Config( void )
2933                     ; 1318 {
2934                     	switch	.text
2935  079a               L3_Adc_Config:
2939                     ; 1320 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
2941  079a cd0000        	call	_ADC1_GetConversionValue
2943  079d b658          	ld	a,_Adc+6
2944  079f 905f          	clrw	y
2945  07a1 9097          	ld	yl,a
2946  07a3 9058          	sllw	y
2947  07a5 90ef52        	ldw	(_Adc,y),x
2948                     ; 1321 	ADC1_DeInit();
2950  07a8 cd0000        	call	_ADC1_DeInit
2952                     ; 1323 	switch (Adc.Idx)
2954  07ab b658          	ld	a,_Adc+6
2956                     ; 1345 			break;
2957  07ad 2708          	jreq	L3001
2958  07af 4a            	dec	a
2959  07b0 271f          	jreq	L5001
2960  07b2 4a            	dec	a
2961  07b3 2736          	jreq	L7001
2962                     ; 1343 		default:
2962                     ; 1344 			Adc.Idx = 0;
2963                     ; 1345 			break;
2965  07b5 2048          	jp	LC019
2966  07b7               L3001:
2967                     ; 1325 		case 0:
2967                     ; 1326 		  
2967                     ; 1327 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
2967                     ; 1328 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
2969  07b7 4b00          	push	#0
2970  07b9 4b03          	push	#3
2971  07bb 4b08          	push	#8
2972  07bd 4b00          	push	#0
2973  07bf 4b00          	push	#0
2974  07c1 4b00          	push	#0
2975  07c3 ae0003        	ldw	x,#3
2976  07c6 cd0000        	call	_ADC1_Init
2978  07c9 5b06          	addw	sp,#6
2979                     ; 1329 			Adc.Idx = 1;
2981  07cb 35010058      	mov	_Adc+6,#1
2982                     ; 1330 			break;
2984  07cf 2030          	jra	L5201
2985  07d1               L5001:
2986                     ; 1331 		case 1:
2986                     ; 1332 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
2986                     ; 1333 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
2988  07d1 4b00          	push	#0
2989  07d3 4b04          	push	#4
2990  07d5 4b08          	push	#8
2991  07d7 4b00          	push	#0
2992  07d9 4b00          	push	#0
2993  07db 4b00          	push	#0
2994  07dd ae0004        	ldw	x,#4
2995  07e0 cd0000        	call	_ADC1_Init
2997  07e3 5b06          	addw	sp,#6
2998                     ; 1334 			Adc.Idx = 2;
3000  07e5 35020058      	mov	_Adc+6,#2
3001                     ; 1335 			break;
3003  07e9 2016          	jra	L5201
3004  07eb               L7001:
3005                     ; 1337 		case 2:
3005                     ; 1338 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
3005                     ; 1339 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3007  07eb 4b00          	push	#0
3008  07ed 4b02          	push	#2
3009  07ef 4b08          	push	#8
3010  07f1 4b00          	push	#0
3011  07f3 4b00          	push	#0
3012  07f5 4b00          	push	#0
3013  07f7 ae0002        	ldw	x,#2
3014  07fa cd0000        	call	_ADC1_Init
3016  07fd 5b06          	addw	sp,#6
3017                     ; 1340 			Adc.Idx = 0;
3019  07ff               LC019:
3021  07ff 3f58          	clr	_Adc+6
3022                     ; 1341 			break;
3024  0801               L5201:
3025                     ; 1348 		ADC1_StartConversion();		
3028                     ; 1349 }
3031  0801 cc0000        	jp	_ADC1_StartConversion
3075                     ; 1364 void assert_failed(u8* file, u32 line)
3075                     ; 1365 {
3076                     	switch	.text
3077  0804               _assert_failed:
3079  0804 88            	push	a
3080       00000001      OFST:	set	1
3083  0805               L1501:
3084                     ; 1374 	i = i++;
3086  0805 0c01          	inc	(OFST+0,sp)
3088  0807 6b01          	ld	(OFST+0,sp),a
3091  0809 20fa          	jra	L1501
3795                     	xdef	_MotorClose
3796                     	xdef	_MotorStep
3797                     	xdef	_OnTimer_1mS
3798                     	switch	.ubsct
3799  0000               _pos2:
3800  0000 00            	ds.b	1
3801                     	xdef	_pos2
3802  0001               _pos:
3803  0001 0000          	ds.b	2
3804                     	xdef	_pos
3805                     	xdef	_OnTimer_1S
3806                     	xdef	_main
3807  0003               _mVal:
3808  0003 00000000      	ds.b	4
3809                     	xdef	_mVal
3810  0007               _iStep:
3811  0007 00            	ds.b	1
3812                     	xdef	_iStep
3813  0008               _mStep:
3814  0008 000000000000  	ds.b	64
3815                     	xdef	_mStep
3816                     	xdef	_min
3817                     	xdef	_MotorService
3818                     	xdef	_AdcService
3819                     	xdef	_SAbs
3820                     	xdef	_Diff
3821                     	xdef	_Gpio_Config
3822                     	xdef	_Clock_Config
3823                     	xdef	_OnCaptureOVTim2
3824                     	xdef	_OnCaptureTim2
3825                     	xdef	_OnTimer4
3826                     	xdef	_StopDrive
3827                     	xdef	_StartDriveOR
3828                     	xdef	_DriveService
3829                     	xdef	_Excitation_2Phase
3830                     	xdef	_Excitation_12Phase
3831                     	xdef	_Excitation_1Phase
3832                     	xdef	_CPulse
3833                     	xdef	_CStep
3834                     	xdef	_PowerDelay_1mS
3835  0048               _Timer:
3836  0048 000000000000  	ds.b	10
3837                     	xdef	_Timer
3838  0052               _Adc:
3839  0052 000000000000  	ds.b	14
3840                     	xdef	_Adc
3841  0060               _My:
3842  0060 000000000000  	ds.b	12
3843                     	xdef	_My
3844  006c               _Drive:
3845  006c 000000000000  	ds.b	45
3846                     	xdef	_Drive
3847                     	xdef	_TableInterval
3848  0099               _ledint:
3849  0099 0000          	ds.b	2
3850                     	xdef	_ledint
3851  009b               _Ticks_S:
3852  009b 00000000      	ds.b	4
3853                     	xdef	_Ticks_S
3854  009f               _Ticks2_1mS:
3855  009f 0000          	ds.b	2
3856                     	xdef	_Ticks2_1mS
3857  00a1               _Ticks_1mS:
3858  00a1 0000          	ds.b	2
3859                     	xdef	_Ticks_1mS
3860  00a3               _Ticks_50uS:
3861  00a3 00000000      	ds.b	4
3862                     	xdef	_Ticks_50uS
3863  00a7               _mDuty:
3864  00a7 0000          	ds.b	2
3865                     	xdef	_mDuty
3866                     	xdef	_nDuty
3867  00a9               _sDuty:
3868  00a9 0000          	ds.b	2
3869                     	xdef	_sDuty
3870  00ab               _iDuty:
3871  00ab 00            	ds.b	1
3872                     	xdef	_iDuty
3873  00ac               _Duty:
3874  00ac 000000000000  	ds.b	16
3875                     	xdef	_Duty
3876  00bc               _Dif:
3877  00bc 0000          	ds.b	2
3878                     	xdef	_Dif
3879  00be               _update:
3880  00be 00            	ds.b	1
3881                     	xdef	_update
3882  00bf               _t2:
3883  00bf 0000          	ds.b	2
3884                     	xdef	_t2
3885  00c1               _tt:
3886  00c1 0000          	ds.b	2
3887                     	xdef	_tt
3888                     	xdef	_PeriodNumber
3889  00c3               _Counter:
3890  00c3 0000          	ds.b	2
3891                     	xdef	_Counter
3892                     	xdef	_assert_failed
3893                     	xref	_TIM4_ITConfig
3894                     	xref	_TIM4_Cmd
3895                     	xref	_TIM4_TimeBaseInit
3896                     	xref	_TIM4_DeInit
3897                     	xref	_TIM2_ClearITPendingBit
3898                     	xref	_TIM2_GetITStatus
3899                     	xref	_TIM2_GetCapture1
3900                     	xref	_TIM2_ITConfig
3901                     	xref	_TIM2_Cmd
3902                     	xref	_TIM2_ICInit
3903                     	xref	_TIM2_TimeBaseInit
3904                     	xref	_TIM2_DeInit
3905                     	xref	_GPIO_ReadInputPin
3906                     	xref	_GPIO_WriteReverse
3907                     	xref	_GPIO_WriteLow
3908                     	xref	_GPIO_WriteHigh
3909                     	xref	_GPIO_Init
3910                     	xref	_CLK_SYSCLKConfig
3911                     	xref	_CLK_HSIPrescalerConfig
3912                     	xref	_CLK_LSICmd
3913                     	xref	_CLK_HSICmd
3914                     	xref	_CLK_HSECmd
3915                     	xref	_CLK_DeInit
3916                     	xref	_ADC1_GetConversionValue
3917                     	xref	_ADC1_StartConversion
3918                     	xref	_ADC1_Init
3919                     	xref	_ADC1_DeInit
3920                     	xref.b	c_lreg
3921                     	xref.b	c_x
3922                     	xref.b	c_y
3942                     	xref	c_imul
3943                     	xref	c_cmulx
3944                     	xref	c_ladc
3945                     	xref	c_lcmp
3946                     	xref	c_ladd
3947                     	xref	c_lsub
3948                     	xref	c_uitolx
3949                     	xref	c_lgadc
3950                     	xref	c_lgsub
3951                     	xref	c_ludv
3952                     	xref	c_ltor
3953                     	xref	c_rtol
3954                     	xref	c_umul
3955                     	end
