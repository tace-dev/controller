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
 107                     ; 211 void main(void)
 107                     ; 212 {
 109                     	switch	.text
 110  0000               _main:
 114                     ; 215 	Ticks_1mS = 0;
 116  0000 5f            	clrw	x
 117  0001 bf5c          	ldw	_Ticks_1mS,x
 118                     ; 216 	Ticks_50uS = 0;
 120  0003 bf60          	ldw	_Ticks_50uS+2,x
 121  0005 bf5e          	ldw	_Ticks_50uS,x
 122                     ; 219 	Clock_Config();
 124  0007 cd05f4        	call	_Clock_Config
 126                     ; 220 	Gpio_Config();
 128  000a cd060d        	call	_Gpio_Config
 130                     ; 222 	Timer4_Config();
 132  000d cd06c8        	call	L5_Timer4_Config
 134                     ; 224 	Adc.Idx = 2;
 136  0010 35020013      	mov	_Adc+6,#2
 137                     ; 225 	Adc_Config(  );
 139  0014 cd06dc        	call	L3_Adc_Config
 141                     ; 232 	Drive.Enabled = ENABLED;
 143  0017 72100027      	bset	_Drive,#0
 144                     ; 233 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 146  001b ae012c        	ldw	x,#300
 147  001e bf32          	ldw	_Drive+11,x
 148                     ; 235 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 150  0020 bf3b          	ldw	_Drive+20,x
 151                     ; 237 	Drive.Position = 0;
 153  0022 5f            	clrw	x
 154  0023 bf28          	ldw	_Drive+1,x
 155                     ; 238 	Drive.Interval = 12u;	//	for 24V 35RD Motor Best speed
 157  0025 ae000c        	ldw	x,#12
 158  0028 bf37          	ldw	_Drive+16,x
 159                     ; 239 	Drive.Stage = 0;		// Not Initialized
 161  002a 3f43          	clr	_Drive+28
 162                     ; 242 	Drive.ExcitationType = 1;		//12 excition
 164  002c 3501003d      	mov	_Drive+22,#1
 165                     ; 244 	Drive.Prescaler = 0x05;
 167  0030 35050053      	mov	_Drive+44,#5
 168                     ; 246 	TIM2_DeInit();	
 170  0034 cd0000        	call	_TIM2_DeInit
 172                     ; 247 	TIM2_TimeBaseInit( Drive.Prescaler, 0xffff );
 174  0037 aeffff        	ldw	x,#65535
 175  003a 89            	pushw	x
 176  003b b653          	ld	a,_Drive+44
 177  003d cd0000        	call	_TIM2_TimeBaseInit
 179  0040 85            	popw	x
 180                     ; 248 	TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
 182  0041 ae0201        	ldw	x,#513
 183  0044 cd0000        	call	_TIM2_ITConfig
 185                     ; 250 	enableInterrupts();
 188  0047 9a            	rim	
 190                     ; 253 	Drive.PwmEdge = 0;
 193  0048 721b0027      	bres	_Drive,#5
 194                     ; 254 	TIM2_Config( Drive.PwmEdge );
 196  004c 4f            	clr	a
 197                     	btst	_Drive,#5
 198  0052 49            	rlc	a
 199  0053 cd06a9        	call	_TIM2_Config
 201                     ; 258 	StopDrive();
 203  0056 cd0370        	call	_StopDrive
 205                     ; 263 	GPIO_WriteHigh(_LED_PORT, _LED_PIN);
 207  0059 4b04          	push	#4
 208  005b ae5000        	ldw	x,#20480
 209  005e cd0000        	call	_GPIO_WriteHigh
 211  0061 84            	pop	a
 213  0062               L72:
 214                     ; 265 	 while ( Ticks_1mS < PowerDelay_1mS )		// Delay Power ON
 216  0062 be5c          	ldw	x,_Ticks_1mS
 217  0064 b314          	cpw	x,_PowerDelay_1mS
 218  0066 25fa          	jrult	L72
 219                     ; 268   GPIO_WriteLow(_LED_PORT, _LED_PIN);
 221  0068 4b04          	push	#4
 222  006a ae5000        	ldw	x,#20480
 223  006d cd0000        	call	_GPIO_WriteLow
 225  0070 3d3e          	tnz	_Drive+23
 226  0072 84            	pop	a
 227                     ; 289 	if ( Drive.Origin ) 
 229  0073 2713          	jreq	L33
 230                     ; 292 		StartDriveOR( CPulse(20u), 0u  );				// Goto Zero position
 232  0075 4b00          	push	#0
 233  0077 ae0014        	ldw	x,#20
 234  007a cd05e3        	call	_CPulse
 236  007d cd0395        	call	_StartDriveOR
 238  0080 84            	pop	a
 240  0081               L73:
 241                     ; 294 		while (Drive.Run)				// Wait while motor is running
 243  0081 72020027fb    	btjt	_Drive,#1,L73
 245  0086 2008          	jra	L34
 246  0088               L33:
 247                     ; 299 		Drive.Position = CPulse(210u);
 249  0088 ae00d2        	ldw	x,#210
 250  008b cd05e3        	call	_CPulse
 252  008e bf28          	ldw	_Drive+1,x
 253  0090               L34:
 254                     ; 308 	Timer.Led = Ticks_1mS;
 256  0090 be5c          	ldw	x,_Ticks_1mS
 257  0092 bf03          	ldw	_Timer,x
 258                     ; 309 	Timer.Motor = Ticks_1mS;
 260  0094 be5c          	ldw	x,_Ticks_1mS
 261  0096 bf05          	ldw	_Timer+2,x
 262                     ; 310 	Timer.Adc = Ticks_1mS;
 264  0098 be5c          	ldw	x,_Ticks_1mS
 265  009a bf07          	ldw	_Timer+4,x
 266                     ; 313   ledint = 1000u;
 268  009c ae03e8        	ldw	x,#1000
 269  009f bf54          	ldw	_ledint,x
 270  00a1               L54:
 271                     ; 317 		tt = Ticks_1mS;
 273  00a1 be5c          	ldw	x,_Ticks_1mS
 274  00a3 bf7c          	ldw	_tt,x
 275                     ; 319 		if ( Diff ( Timer.Led, ledint ) )
 277  00a5 be54          	ldw	x,_ledint
 278  00a7 89            	pushw	x
 279  00a8 be03          	ldw	x,_Timer
 280  00aa cd022d        	call	_Diff
 282  00ad 4d            	tnz	a
 283  00ae 85            	popw	x
 284  00af 270d          	jreq	L15
 285                     ; 322 			Timer.Led = Ticks_1mS;
 287  00b1 be5c          	ldw	x,_Ticks_1mS
 288  00b3 bf03          	ldw	_Timer,x
 289                     ; 323 			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
 291  00b5 4b04          	push	#4
 292  00b7 ae5000        	ldw	x,#20480
 293  00ba cd0000        	call	_GPIO_WriteReverse
 295  00bd 84            	pop	a
 296  00be               L15:
 297                     ; 327 		AdcService();
 299  00be cd01cb        	call	_AdcService
 301                     ; 330 		if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
 303  00c1 b648          	ld	a,_Drive+33
 304  00c3 2610          	jrne	L35
 306  00c5 720300270b    	btjf	_Drive,#1,L35
 307                     ; 332 			Drive.T1_1mS = Ticks_1mS;
 309  00ca be5c          	ldw	x,_Ticks_1mS
 310  00cc bf44          	ldw	_Drive+29,x
 311                     ; 333 			Drive.Run0 = Drive.Run;			
 313  00ce b627          	ld	a,_Drive
 314  00d0 a402          	and	a,#2
 315  00d2 44            	srl	a
 316  00d3 b748          	ld	_Drive+33,a
 317  00d5               L35:
 318                     ; 336 		if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
 320  00d5 4a            	dec	a
 321  00d6 2610          	jrne	L55
 323  00d8 720200270b    	btjt	_Drive,#1,L55
 324                     ; 338 			Drive.T2_1mS = Ticks_1mS;
 326  00dd be5c          	ldw	x,_Ticks_1mS
 327  00df bf46          	ldw	_Drive+31,x
 328                     ; 339 			Drive.Run0 = Drive.Run;			
 330  00e1 b627          	ld	a,_Drive
 331  00e3 a402          	and	a,#2
 332  00e5 44            	srl	a
 333  00e6 b748          	ld	_Drive+33,a
 334  00e8               L55:
 335                     ; 344 		if ( Drive.Stage == 0 )	//	Init
 337  00e8 b643          	ld	a,_Drive+28
 338  00ea 2623          	jrne	L75
 339                     ; 346 			ledint = 1000u;
 341  00ec ae03e8        	ldw	x,#1000
 342  00ef bf54          	ldw	_ledint,x
 343                     ; 347 			if ( Drive.Run == 0 )
 345  00f1 7203002703cc  	btjt	_Drive,#1,L321
 346                     ; 349 				if ( Drive.Origin == 1 )
 348  00f9 b63e          	ld	a,_Drive+23
 349  00fb 4a            	dec	a
 350  00fc 2607          	jrne	L36
 351                     ; 351 					Drive.Stage = 1;
 353  00fe 35010043      	mov	_Drive+28,#1
 355  0102 cc0198        	jra	L321
 356  0105               L36:
 357                     ; 355 					StartDriveOR( 0u, 0u  );				// Goto Zero position
 359  0105 4b00          	push	#0
 360  0107 5f            	clrw	x
 361  0108 cd0395        	call	_StartDriveOR
 363  010b 84            	pop	a
 364  010c cc0198        	jra	L321
 365  010f               L75:
 366                     ; 360 		else if ( Drive.Stage == 1 )	// Running 
 368  010f 4a            	dec	a
 369  0110 26fa          	jrne	L321
 370                     ; 362 			if ( Diff ( Timer.Motor, 500u ) != 0 )
 372  0112 ae01f4        	ldw	x,#500
 373  0115 89            	pushw	x
 374  0116 be05          	ldw	x,_Timer+2
 375  0118 cd022d        	call	_Diff
 377  011b 4d            	tnz	a
 378  011c 85            	popw	x
 379  011d 2775          	jreq	L37
 380                     ; 365 				if ( Diff ( Timer.PwmUpdate, 2000u ) != 0 )
 382  011f ae07d0        	ldw	x,#2000
 383  0122 89            	pushw	x
 384  0123 be0b          	ldw	x,_Timer+8
 385  0125 cd022d        	call	_Diff
 387  0128 4d            	tnz	a
 388  0129 85            	popw	x
 389  012a 2719          	jreq	L57
 390                     ; 367 					Drive.Step = 0;
 392  012c 3f40          	clr	_Drive+25
 393                     ; 370 					if ( Ticks_1mS > 2000 )
 395  012e be5c          	ldw	x,_Ticks_1mS
 396  0130 a307d1        	cpw	x,#2001
 397  0133 2507          	jrult	L77
 398                     ; 371 						Timer.PwmUpdate = Ticks_1mS-2000;
 400  0135 be5c          	ldw	x,_Ticks_1mS
 401  0137 1d07d0        	subw	x,#2000
 403  013a 2005          	jp	LC001
 404  013c               L77:
 405                     ; 373 						Timer.PwmUpdate = 65535 - 2000 + Ticks_1mS;
 407  013c be5c          	ldw	x,_Ticks_1mS
 408  013e 1cf82f        	addw	x,#63535
 409  0141               LC001:
 410  0141 bf0b          	ldw	_Timer+8,x
 411  0143 2049          	jra	L301
 412  0145               L57:
 413                     ; 380 					if ( nDuty < 16 )
 415  0145 b602          	ld	a,_nDuty
 416  0147 a110          	cp	a,#16
 417  0149 2402          	jruge	L501
 418                     ; 381 						nDuty ++;
 420  014b 3c02          	inc	_nDuty
 421  014d               L501:
 422                     ; 383 					if (iDuty < 15)
 424  014d b666          	ld	a,_iDuty
 425  014f a10f          	cp	a,#15
 426  0151 2404          	jruge	L701
 427                     ; 385 						iDuty++;
 429  0153 3c66          	inc	_iDuty
 431  0155 2002          	jra	L111
 432  0157               L701:
 433                     ; 389 						iDuty = 0;
 435  0157 3f66          	clr	_iDuty
 436  0159               L111:
 437                     ; 391 					sDuty -= Duty[iDuty];
 439  0159 b666          	ld	a,_iDuty
 440  015b 5f            	clrw	x
 441  015c 97            	ld	xl,a
 442  015d e667          	ld	a,(_Duty,x)
 443  015f 5f            	clrw	x
 444  0160 97            	ld	xl,a
 445  0161 72b00064      	subw	x,_sDuty
 446  0165 50            	negw	x
 447  0166 bf64          	ldw	_sDuty,x
 448                     ; 392 					Duty[iDuty] = Drive.PwmDuty;
 450  0168 5f            	clrw	x
 451  0169 b666          	ld	a,_iDuty
 452  016b 97            	ld	xl,a
 453  016c b64e          	ld	a,_Drive+39
 454  016e e767          	ld	(_Duty,x),a
 455                     ; 393 					sDuty += Drive.PwmDuty; //Drive.Step; 
 457  0170 be64          	ldw	x,_sDuty
 458  0172 72bb004d      	addw	x,_Drive+38
 459  0176 bf64          	ldw	_sDuty,x
 460                     ; 396 					mDuty = (sDuty / nDuty)*2 + 1;
 462  0178 b602          	ld	a,_nDuty
 463  017a 62            	div	x,a
 464  017b 58            	sllw	x
 465  017c 5c            	incw	x
 466  017d bf62          	ldw	_mDuty,x
 467                     ; 397 					mDuty /= 2;
 469  017f 3462          	srl	_mDuty
 470  0181 3663          	rrc	_mDuty+1
 471                     ; 398 					Drive.Step = mDuty;
 473  0183 b663          	ld	a,_mDuty+1
 474  0185 b740          	ld	_Drive+25,a
 475                     ; 399 					if ( Drive.Step < min )
 477  0187 b116          	cp	a,_min
 478  0189 2403          	jruge	L301
 479                     ; 400 						min = Drive.Step;
 481  018b 454016        	mov	_min,_Drive+25
 482  018e               L301:
 483                     ; 403 				MotorService();
 485  018e ad18          	call	_MotorService
 487                     ; 404 				Timer.Motor = Ticks_1mS;				
 489  0190 be5c          	ldw	x,_Ticks_1mS
 490  0192 bf05          	ldw	_Timer+2,x
 491  0194               L37:
 492                     ; 406 			if ( Drive.Run == 1 )
 494  0194 b627          	ld	a,_Drive
 495  0196 a502          	bcp	a,#2
 497  0198               L321:
 498                     ; 418 		while ( Diff ( tt, 50u ) == 0 )
 500  0198 ae0032        	ldw	x,#50
 501  019b 89            	pushw	x
 502  019c be7c          	ldw	x,_tt
 503  019e cd022d        	call	_Diff
 505  01a1 4d            	tnz	a
 506  01a2 85            	popw	x
 507  01a3 27f3          	jreq	L321
 509  01a5 cc00a1        	jra	L54
 537                     ; 425 void MotorService()
 537                     ; 426 {
 538                     	switch	.text
 539  01a8               _MotorService:
 543                     ; 432 			if ( Drive.Step > 210u )
 545  01a8 b640          	ld	a,_Drive+25
 546  01aa a1d3          	cp	a,#211
 547  01ac 2504          	jrult	L731
 548                     ; 433 				Drive.Step = 210u;
 550  01ae a6d2          	ld	a,#210
 551  01b0 b740          	ld	_Drive+25,a
 552  01b2               L731:
 553                     ; 434 			if ( Drive.Step < 20u )
 555  01b2 a114          	cp	a,#20
 556  01b4 2403          	jruge	L141
 557                     ; 435 				Drive.Step = 0u;
 559  01b6 4f            	clr	a
 560  01b7 b740          	ld	_Drive+25,a
 561  01b9               L141:
 562                     ; 445 				if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
 564                     ; 449 						Drive.PreStep = Drive.Step;
 565                     ; 450 						StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 569                     ; 462 					Drive.PreStep = Drive.Step;
 571                     ; 463 					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );					
 576  01b9 b741          	ld	_Drive+26,a
 578  01bb 4b00          	push	#0
 579  01bd 5f            	clrw	x
 580  01be 97            	ld	xl,a
 581  01bf cd05e3        	call	_CPulse
 582  01c2 cd0395        	call	_StartDriveOR
 583  01c5 be5c          	ldw	x,_Ticks_1mS
 584  01c7 bf05          	ldw	_Timer+2,x
 585  01c9 84            	pop	a
 586                     ; 467 			Timer.Motor = Ticks_1mS;
 588                     ; 469 	}
 591  01ca 81            	ret	
 618                     ; 472 void AdcService()
 618                     ; 473 {
 619                     	switch	.text
 620  01cb               _AdcService:
 624                     ; 474 	if ( Diff ( Timer.Adc, 10u )== 1 )
 626  01cb ae000a        	ldw	x,#10
 627  01ce 89            	pushw	x
 628  01cf be07          	ldw	x,_Timer+4
 629  01d1 ad5a          	call	_Diff
 631  01d3 4a            	dec	a
 632  01d4 85            	popw	x
 633  01d5 2643          	jrne	L751
 634                     ; 476 			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
 636  01d7 b617          	ld	a,_Adc+10
 637  01d9 5f            	clrw	x
 638  01da 97            	ld	xl,a
 639  01db e614          	ld	a,(_Adc+7,x)
 640  01dd 5f            	clrw	x
 641  01de 97            	ld	xl,a
 642  01df 72b00019      	subw	x,_Adc+12
 643  01e3 50            	negw	x
 644  01e4 bf19          	ldw	_Adc+12,x
 645                     ; 477 			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
 647  01e6 be0d          	ldw	x,_Adc
 648  01e8 54            	srlw	x
 649  01e9 54            	srlw	x
 650  01ea b617          	ld	a,_Adc+10
 651  01ec 905f          	clrw	y
 652  01ee 9097          	ld	yl,a
 653  01f0 01            	rrwa	x,a
 654  01f1 90e714        	ld	(_Adc+7,y),a
 655                     ; 478 			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
 657  01f4 5f            	clrw	x
 658  01f5 b617          	ld	a,_Adc+10
 659  01f7 97            	ld	xl,a
 660  01f8 e614          	ld	a,(_Adc+7,x)
 661  01fa bb1a          	add	a,_Adc+13
 662  01fc b71a          	ld	_Adc+13,a
 663  01fe 2402          	jrnc	L001
 664  0200 3c19          	inc	_Adc+12
 665  0202               L001:
 666                     ; 479 			Adc.Average = Adc.Sum /5;
 668  0202 be19          	ldw	x,_Adc+12
 669  0204 a605          	ld	a,#5
 670  0206 62            	div	x,a
 671  0207 01            	rrwa	x,a
 672  0208 b718          	ld	_Adc+11,a
 673                     ; 480 			if  (Adc.IdxAvg	>= 4 )
 675  020a b617          	ld	a,_Adc+10
 676  020c a104          	cp	a,#4
 677  020e 2504          	jrult	L161
 678                     ; 481 				Adc.IdxAvg = 0;
 680  0210 3f17          	clr	_Adc+10
 682  0212 2002          	jra	L361
 683  0214               L161:
 684                     ; 483 				Adc.IdxAvg++;
 686  0214 3c17          	inc	_Adc+10
 687  0216               L361:
 688                     ; 485 			Timer.Adc = Ticks_1mS;
 690  0216 be5c          	ldw	x,_Ticks_1mS
 691  0218 bf07          	ldw	_Timer+4,x
 692  021a               L751:
 693                     ; 487 }
 696  021a 81            	ret	
 739                     ; 494 u8 SAbs(u8 s1, u8 s2)
 739                     ; 495 {
 740                     	switch	.text
 741  021b               _SAbs:
 743  021b 89            	pushw	x
 744       00000000      OFST:	set	0
 747                     ; 496 	if (s1 > s2 )
 749  021c 9f            	ld	a,xl
 750  021d 1101          	cp	a,(OFST+1,sp)
 751  021f 2406          	jruge	L702
 752                     ; 497 		return s1 - s2;
 754  0221 9f            	ld	a,xl
 755  0222 1001          	sub	a,(OFST+1,sp)
 756  0224 40            	neg	a
 758  0225 2004          	jra	L401
 759  0227               L702:
 760                     ; 499 		return s2 - s1;
 762  0227 7b02          	ld	a,(OFST+2,sp)
 763  0229 1001          	sub	a,(OFST+1,sp)
 765  022b               L401:
 767  022b 85            	popw	x
 768  022c 81            	ret	
 822                     ; 503 u8  Diff( u16 time, u16 diff )
 822                     ; 504 {
 823                     	switch	.text
 824  022d               _Diff:
 826  022d 89            	pushw	x
 827  022e 520e          	subw	sp,#14
 828       0000000e      OFST:	set	14
 831                     ; 506 	t0 = Ticks_1mS;
 833  0230 be5c          	ldw	x,_Ticks_1mS
 834  0232 1f0d          	ldw	(OFST-1,sp),x
 836                     ; 508 	if (time <= t0 )
 838  0234 1e0f          	ldw	x,(OFST+1,sp)
 839  0236 130d          	cpw	x,(OFST-1,sp)
 840  0238 2214          	jrugt	L142
 841                     ; 510 		Dif = t0 - time;
 843  023a 1e0d          	ldw	x,(OFST-1,sp)
 844  023c 72f00f        	subw	x,(OFST+1,sp)
 845  023f bf77          	ldw	_Dif,x
 846                     ; 511 		if ( ( t0 - time ) > diff ) 
 848  0241 1e0d          	ldw	x,(OFST-1,sp)
 849  0243 72f00f        	subw	x,(OFST+1,sp)
 850  0246 1313          	cpw	x,(OFST+5,sp)
 851                     ; 513 			return 1u;
 853  0248 2252          	jrugt	LC003
 854  024a               L342:
 855                     ; 517 			return 0u;
 858  024a 4f            	clr	a
 860  024b               L011:
 862  024b 5b10          	addw	sp,#16
 863  024d 81            	ret	
 864  024e               L142:
 865                     ; 523 	if (time > t0 )
 867  024e 130d          	cpw	x,(OFST-1,sp)
 868  0250 23f9          	jrule	L011
 869                     ; 525 		Dif = 65535 - time + t0;
 871  0252 aeffff        	ldw	x,#65535
 872  0255 72f00f        	subw	x,(OFST+1,sp)
 873  0258 72fb0d        	addw	x,(OFST-1,sp)
 874  025b bf77          	ldw	_Dif,x
 875                     ; 526 		if ( ( 65535 - time + t0  ) > diff ) 
 877  025d 1e0d          	ldw	x,(OFST-1,sp)
 878  025f cd0000        	call	c_uitolx
 880  0262 96            	ldw	x,sp
 881  0263 1c0009        	addw	x,#OFST-5
 882  0266 cd0000        	call	c_rtol
 885  0269 1e0f          	ldw	x,(OFST+1,sp)
 886  026b cd0000        	call	c_uitolx
 888  026e 96            	ldw	x,sp
 889  026f 1c0005        	addw	x,#OFST-9
 890  0272 cd0000        	call	c_rtol
 893  0275 aeffff        	ldw	x,#65535
 894  0278 bf02          	ldw	c_lreg+2,x
 895  027a 5f            	clrw	x
 896  027b bf00          	ldw	c_lreg,x
 897  027d 96            	ldw	x,sp
 898  027e 1c0005        	addw	x,#OFST-9
 899  0281 cd0000        	call	c_lsub
 901  0284 96            	ldw	x,sp
 902  0285 1c0009        	addw	x,#OFST-5
 903  0288 cd0000        	call	c_ladd
 905  028b 96            	ldw	x,sp
 906  028c 5c            	incw	x
 907  028d cd0000        	call	c_rtol
 910  0290 1e13          	ldw	x,(OFST+5,sp)
 911  0292 cd0000        	call	c_uitolx
 913  0295 96            	ldw	x,sp
 914  0296 5c            	incw	x
 915  0297 cd0000        	call	c_lcmp
 917  029a 2eae          	jrsge	L342
 918                     ; 528 			return 1u;
 920  029c               LC003:
 922  029c a601          	ld	a,#1
 924  029e 20ab          	jra	L011
 925                     ; 532 			return 0u;
 927                     ; 535 }
 951                     ; 538 OnTimer_1S(void)
 951                     ; 539 {
 952                     	switch	.text
 953  02a0               _OnTimer_1S:
 957                     ; 541 }
 960  02a0 81            	ret	
 986                     ; 550 OnTimer_1mS(void)
 986                     ; 551 { 
 987                     	switch	.text
 988  02a1               _OnTimer_1mS:
 992                     ; 553 	Ticks_1mS++;
 994  02a1 be5c          	ldw	x,_Ticks_1mS
 995  02a3 5c            	incw	x
 996  02a4 bf5c          	ldw	_Ticks_1mS,x
 997                     ; 555 	Adc_Config( );
 999  02a6 cd06dc        	call	L3_Adc_Config
1001                     ; 557 	if ( PowerDelay_1mS )
1003  02a9 be14          	ldw	x,_PowerDelay_1mS
1004  02ab 2703          	jreq	L572
1005                     ; 558 		PowerDelay_1mS--;
1007  02ad 5a            	decw	x
1008  02ae bf14          	ldw	_PowerDelay_1mS,x
1009  02b0               L572:
1010                     ; 559 }
1013  02b0 81            	ret	
1042                     .const:	section	.text
1043  0000               L231:
1044  0000 00000013      	dc.l	19
1045                     ; 562 void OnTimer4(void)
1045                     ; 563 {
1046                     	switch	.text
1047  02b1               _OnTimer4:
1051                     ; 564 	Adc_Config(  );
1053  02b1 cd06dc        	call	L3_Adc_Config
1055                     ; 565 	Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
1057  02b4 4b10          	push	#16
1058  02b6 ae5005        	ldw	x,#20485
1059  02b9 cd0000        	call	_GPIO_ReadInputPin
1061  02bc 5b01          	addw	sp,#1
1062  02be 4d            	tnz	a
1063  02bf 2603          	jrne	L421
1064  02c1 4c            	inc	a
1065  02c2 2001          	jra	L031
1066  02c4               L421:
1067  02c4 4f            	clr	a
1068  02c5               L031:
1069  02c5 b73e          	ld	_Drive+23,a
1070                     ; 567 	if (  Ticks_50uS < 19 )
1072  02c7 ae005e        	ldw	x,#_Ticks_50uS
1073  02ca cd0000        	call	c_ltor
1075  02cd ae0000        	ldw	x,#L231
1076  02d0 cd0000        	call	c_lcmp
1078  02d3 240a          	jruge	L703
1079                     ; 568 		Ticks_50uS++;
1081  02d5 ae005e        	ldw	x,#_Ticks_50uS
1082  02d8 a601          	ld	a,#1
1083  02da cd0000        	call	c_lgadc
1086  02dd 2007          	jra	L113
1087  02df               L703:
1088                     ; 571 		Ticks_50uS = 0;
1090  02df 5f            	clrw	x
1091  02e0 bf60          	ldw	_Ticks_50uS+2,x
1092  02e2 bf5e          	ldw	_Ticks_50uS,x
1093                     ; 572 		OnTimer_1mS();
1095  02e4 adbb          	call	_OnTimer_1mS
1097  02e6               L113:
1098                     ; 576 	if ( Drive.Ticks > 0 )
1100  02e6 be39          	ldw	x,_Drive+18
1101  02e8 2703          	jreq	L313
1102                     ; 577 		Drive.Ticks--;
1104  02ea 5a            	decw	x
1105  02eb bf39          	ldw	_Drive+18,x
1106  02ed               L313:
1107                     ; 579 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
1109  02ed 720100270b    	btjf	_Drive,#0,L513
1111  02f2 be39          	ldw	x,_Drive+18
1112  02f4 2607          	jrne	L513
1113                     ; 581 		DriveService();	
1115  02f6 cd048d        	call	_DriveService
1117                     ; 582 		Drive.Ticks = Drive.Interval;
1119  02f9 be37          	ldw	x,_Drive+16
1120  02fb bf39          	ldw	_Drive+18,x
1121  02fd               L513:
1122                     ; 584 }
1125  02fd 81            	ret	
1151                     ; 586 void OnCaptureOVTim2(void)
1151                     ; 587 {
1152                     	switch	.text
1153  02fe               _OnCaptureOVTim2:
1157                     ; 588 	Drive.PwmT4 = TIM2_GetCapture1();
1159  02fe cd0000        	call	_TIM2_GetCapture1
1161  0301 bf51          	ldw	_Drive+42,x
1162                     ; 589 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);		//Move to Interrupt routine
1164  0303 ae0001        	ldw	x,#1
1166                     ; 590 }
1169  0306 cc0000        	jp	_TIM2_ClearFlag
1199                     ; 609 void OnCaptureTim2(void)
1199                     ; 610 {
1200                     	switch	.text
1201  0309               _OnCaptureTim2:
1203  0309 5204          	subw	sp,#4
1204       00000004      OFST:	set	4
1207                     ; 624 	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
1209  030b a602          	ld	a,#2
1210  030d cd0000        	call	_TIM2_GetITStatus
1212  0310 4a            	dec	a
1213  0311 265a          	jrne	L343
1214                     ; 625 		return;
1216                     ; 627 	if ( Drive.PwmEdge == 0 ) 
1218  0313 720a002742    	btjt	_Drive,#5,L143
1219                     ; 629 		Drive.PwmT2 = TIM2_GetCapture1();
1221  0318 cd0000        	call	_TIM2_GetCapture1
1223  031b bf4b          	ldw	_Drive+36,x
1224                     ; 631 		TIM2_SetCounter(0u);
1226  031d 5f            	clrw	x
1227  031e cd0000        	call	_TIM2_SetCounter
1229                     ; 633 		Drive.PwmEdge = 1;
1231  0321 721a0027      	bset	_Drive,#5
1232                     ; 634 		TIM2_Config( Drive.PwmEdge );
1234  0325 4f            	clr	a
1235                     	btst	_Drive,#5
1236  032b 49            	rlc	a
1237  032c cd06a9        	call	_TIM2_Config
1239                     ; 636 		Drive.PwmDuty = (Drive.PwmT1 * (uint32_t)400 /  Drive.PwmT2) + 1 ;
1241  032f be4b          	ldw	x,_Drive+36
1242  0331 cd0000        	call	c_uitolx
1244  0334 96            	ldw	x,sp
1245  0335 5c            	incw	x
1246  0336 cd0000        	call	c_rtol
1249  0339 be49          	ldw	x,_Drive+34
1250  033b 90ae0190      	ldw	y,#400
1251  033f cd0000        	call	c_umul
1253  0342 96            	ldw	x,sp
1254  0343 5c            	incw	x
1255  0344 cd0000        	call	c_ludv
1257  0347 a601          	ld	a,#1
1258  0349 cd0000        	call	c_ladc
1260  034c be02          	ldw	x,c_lreg+2
1261  034e bf4d          	ldw	_Drive+38,x
1262                     ; 637 		Drive.PwmDuty /= 2;
1264  0350 344d          	srl	_Drive+38
1265  0352 364e          	rrc	_Drive+39
1266                     ; 640 		Timer.PwmUpdate = Ticks_1mS;
1268  0354 be5c          	ldw	x,_Ticks_1mS
1269  0356 bf0b          	ldw	_Timer+8,x
1271  0358 2013          	jra	L343
1272  035a               L143:
1273                     ; 645 		Drive.PwmT1 = TIM2_GetCapture1();
1275  035a cd0000        	call	_TIM2_GetCapture1
1277  035d bf49          	ldw	_Drive+34,x
1278                     ; 646 		Drive.PwmEdge = 0;
1280                     ; 647 		TIM2_Config( Drive.PwmEdge );
1282  035f 721b0027      	bres	_Drive,#5
1283  0363 4f            	clr	a
1284                     	btst	_Drive,#5
1285  0369 49            	rlc	a
1286  036a cd06a9        	call	_TIM2_Config
1288  036d               L343:
1289                     ; 653 }
1292  036d 5b04          	addw	sp,#4
1293  036f 81            	ret	
1317                     ; 667 void StopDrive(void)			//TROff()
1317                     ; 668 {
1318                     	switch	.text
1319  0370               _StopDrive:
1323                     ; 670 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1325  0370 4b40          	push	#64
1326  0372 ae500a        	ldw	x,#20490
1327  0375 cd0000        	call	_GPIO_WriteLow
1329  0378 84            	pop	a
1330                     ; 671 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1332  0379 4b08          	push	#8
1333  037b ae500a        	ldw	x,#20490
1334  037e cd0000        	call	_GPIO_WriteLow
1336  0381 84            	pop	a
1337                     ; 672 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1339  0382 4b80          	push	#128
1340  0384 ae500a        	ldw	x,#20490
1341  0387 cd0000        	call	_GPIO_WriteLow
1343  038a 84            	pop	a
1344                     ; 673 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
1346  038b 4b08          	push	#8
1347  038d ae5000        	ldw	x,#20480
1348  0390 cd0000        	call	_GPIO_WriteLow
1350  0393 84            	pop	a
1351                     ; 674 }
1354  0394 81            	ret	
1399                     ; 680 void StartDriveOR( uint16_t Target, uint8_t overrun )
1399                     ; 681 {
1400                     	switch	.text
1401  0395               _StartDriveOR:
1403  0395 89            	pushw	x
1404       00000000      OFST:	set	0
1407                     ; 689 	if ( Drive.Run ) return;
1409  0396 7202002706    	btjt	_Drive,#1,L602
1412                     ; 690 	if ( Drive.Position == Target ) return;
1414  039b be28          	ldw	x,_Drive+1
1415  039d 1301          	cpw	x,(OFST+1,sp)
1416  039f 2602          	jrne	L104
1418  03a1               L602:
1421  03a1 85            	popw	x
1422  03a2 81            	ret	
1423  03a3               L104:
1424                     ; 693 	if ( Target == 0 )				//  goto origin
1426  03a3 1e01          	ldw	x,(OFST+1,sp)
1427  03a5 2616          	jrne	L304
1428                     ; 695 		Drive.Overrun =	0u;
1430  03a7 5f            	clrw	x
1431  03a8 bf2c          	ldw	_Drive+5,x
1432                     ; 696 		Drive.ZeroOffset = CPulse( OVER_STEP );
1434  03aa ae001e        	ldw	x,#30
1435  03ad cd05e3        	call	_CPulse
1437  03b0 bf2f          	ldw	_Drive+8,x
1438                     ; 698 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
1440  03b2 be28          	ldw	x,_Drive+1
1441  03b4 72bb002f      	addw	x,_Drive+8
1442  03b8 bf28          	ldw	_Drive+1,x
1443                     ; 699 		Drive.Target = 0u;
1445  03ba 5f            	clrw	x
1446                     ; 700 		Drive.State = nMotorClose;		// 0;
1448  03bb 200f          	jp	LC004
1449  03bd               L304:
1450                     ; 707 		if (Drive.Position >= Target)		// Closing
1452  03bd be28          	ldw	x,_Drive+1
1453  03bf 1301          	cpw	x,(OFST+1,sp)
1454  03c1 250f          	jrult	L704
1455                     ; 709 			Drive.Overrun =	0u;
1457  03c3 5f            	clrw	x
1458  03c4 bf2c          	ldw	_Drive+5,x
1459                     ; 710 			Drive.State = nMotorClose;
1461  03c6 3f36          	clr	_Drive+15
1462                     ; 711 			Drive.Overrun2 = 0u;
1464  03c8 3f2e          	clr	_Drive+7
1465                     ; 712 			Drive.Target = Target;
1467  03ca 1e01          	ldw	x,(OFST+1,sp)
1468                     ; 713 			Drive.State = nMotorClose;		// 0;
1470  03cc               LC004:
1471  03cc bf2a          	ldw	_Drive+3,x
1473  03ce 3f36          	clr	_Drive+15
1475  03d0 2017          	jra	L504
1476  03d2               L704:
1477                     ; 717 			Drive.State = nMotorOpen;	//1;
1479  03d2 35010036      	mov	_Drive+15,#1
1480                     ; 726 				Drive.Overrun2 = overrun;		//100;
1482  03d6 7b05          	ld	a,(OFST+5,sp)
1483  03d8 b72e          	ld	_Drive+7,a
1484                     ; 727 				Drive.Target = Target + overrun;	//100;	
1486  03da 7b01          	ld	a,(OFST+1,sp)
1487  03dc 97            	ld	xl,a
1488  03dd 7b02          	ld	a,(OFST+2,sp)
1489  03df 1b05          	add	a,(OFST+5,sp)
1490  03e1 2401          	jrnc	L402
1491  03e3 5c            	incw	x
1492  03e4               L402:
1493  03e4 b72b          	ld	_Drive+4,a
1494  03e6 9f            	ld	a,xl
1495  03e7 b72a          	ld	_Drive+3,a
1496  03e9               L504:
1497                     ; 732 	Drive.Run = TRUE;
1499  03e9 72120027      	bset	_Drive,#1
1500                     ; 733 	Drive.Ticks = Drive.Interval;
1502  03ed be37          	ldw	x,_Drive+16
1503  03ef bf39          	ldw	_Drive+18,x
1504                     ; 734 }
1506  03f1 20ae          	jra	L602
1566                     ; 740 void MotorStep(MOTOR_DIR Dir)
1566                     ; 741 {
1567                     	switch	.text
1568  03f3               _MotorStep:
1572                     ; 742 	if ( Dir == nMotorClose )
1574  03f3 4d            	tnz	a
1575  03f4 2627          	jrne	L744
1576                     ; 744 		if ( Drive.Position != 0 ) 
1578  03f6 be28          	ldw	x,_Drive+1
1579  03f8 270d          	jreq	L154
1580                     ; 746 			Drive.Position--;
1582  03fa 5a            	decw	x
1583  03fb bf28          	ldw	_Drive+1,x
1584                     ; 747 			if ( Drive.NormalOpen )
1586  03fd b63f          	ld	a,_Drive+24
1587  03ff 2704          	jreq	L354
1588                     ; 748 				Drive.Phase++;   // NC
1590  0401 3c31          	inc	_Drive+10
1592  0403 2002          	jra	L154
1593  0405               L354:
1594                     ; 751 				Drive.Phase--;	//NC
1596  0405 3a31          	dec	_Drive+10
1597  0407               L154:
1598                     ; 755 		if ( Drive.Position == 0 ) 
1600  0407 be28          	ldw	x,_Drive+1
1601  0409 2643          	jrne	L164
1602                     ; 758 			Drive.Overrun = 0u;
1604  040b 5f            	clrw	x
1605  040c bf2c          	ldw	_Drive+5,x
1606                     ; 759 			Drive.Run = FALSE;
1608  040e 72130027      	bres	_Drive,#1
1609                     ; 760 			Drive.ZeroOffset = 0u;
1611  0412 bf2f          	ldw	_Drive+8,x
1612                     ; 761 			Drive.Position = 0u;
1614  0414 bf28          	ldw	_Drive+1,x
1615                     ; 762 			Drive.Target = 0u;
1617  0416 bf2a          	ldw	_Drive+3,x
1618                     ; 763 			StopDrive();	
1620  0418 cd0370        	call	_StopDrive
1622  041b 2031          	jra	L164
1623  041d               L744:
1624                     ; 769 			Drive.Position++;
1626  041d be28          	ldw	x,_Drive+1
1627  041f 5c            	incw	x
1628  0420 bf28          	ldw	_Drive+1,x
1629                     ; 771 		if ( Drive.NormalOpen )
1631  0422 b63f          	ld	a,_Drive+24
1632  0424 2704          	jreq	L364
1633                     ; 772 				Drive.Phase--;
1635  0426 3a31          	dec	_Drive+10
1637  0428 2002          	jra	L564
1638  042a               L364:
1639                     ; 774 				Drive.Phase++;
1641  042a 3c31          	inc	_Drive+10
1642  042c               L564:
1643                     ; 777 		if ( Drive.Origin ) 
1645  042c b63e          	ld	a,_Drive+23
1646  042e 2708          	jreq	L764
1647                     ; 779 			Drive.ORGPosition = Drive.Position;
1649  0430 bf34          	ldw	_Drive+13,x
1650                     ; 780 			Drive.LastOrigin = TRUE;
1652  0432 72140027      	bset	_Drive,#2
1654  0436 2016          	jra	L164
1655  0438               L764:
1656                     ; 783 			if ( Drive.LastOrigin )
1658  0438 7205002711    	btjf	_Drive,#2,L164
1659                     ; 785 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1661  043d be34          	ldw	x,_Drive+13
1662  043f 1d0028        	subw	x,#40
1663  0442 bf32          	ldw	_Drive+11,x
1664                     ; 786 				if ( Drive.MaxOverrun > OVERRUN )
1666  0444 a3012d        	cpw	x,#301
1667  0447 2505          	jrult	L164
1668                     ; 787 					Drive.MaxOverrun = OVERRUN;				
1670  0449 ae012c        	ldw	x,#300
1671  044c bf32          	ldw	_Drive+11,x
1672  044e               L164:
1673                     ; 792 	if ( !Drive.Run ) return;
1675  044e 7202002701    	btjt	_Drive,#1,L774
1679  0453 81            	ret	
1680  0454               L774:
1681                     ; 793 	if ( !Drive.Enabled ) return;
1683  0454 7200002701    	btjt	_Drive,#0,L105
1687  0459 81            	ret	
1688  045a               L105:
1689                     ; 794 	switch ( Drive.ExcitationType )
1691  045a b63d          	ld	a,_Drive+22
1693                     ; 805 			break;
1694  045c 2707          	jreq	L314
1695  045e 4a            	dec	a
1696  045f 2707          	jreq	L514
1697  0461 4a            	dec	a
1698  0462 2706          	jreq	L714
1700  0464 81            	ret	
1701  0465               L314:
1702                     ; 797 		case 0:
1702                     ; 798 			Excitation_1Phase();	
1705                     ; 799 			break;
1708  0465 cc0599        	jp	_Excitation_1Phase
1709  0468               L514:
1710                     ; 800 		case 1:
1710                     ; 801 			Excitation_12Phase();
1713                     ; 802 			break;
1716  0468 2066          	jp	_Excitation_12Phase
1717  046a               L714:
1718                     ; 803 		case 2:
1718                     ; 804 			Excitation_2Phase();
1721                     ; 805 			break;
1723                     ; 810 }
1726  046a 2063          	jp	_Excitation_2Phase
1752                     ; 815 void MotorClose(void)
1752                     ; 816 {
1753                     	switch	.text
1754  046c               _MotorClose:
1758                     ; 817 	if ( Drive.Origin )   		// Hall IC Sensing 
1760  046c b63e          	ld	a,_Drive+23
1761  046e 2719          	jreq	L715
1762                     ; 819 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1764  0470 be2c          	ldw	x,_Drive+5
1765  0472 b332          	cpw	x,_Drive+11
1766  0474 2510          	jrult	L125
1767                     ; 821 			Drive.Target = 0u;
1769  0476 5f            	clrw	x
1770  0477 bf2a          	ldw	_Drive+3,x
1771                     ; 822 			Drive.Position = 0u;
1773  0479 bf28          	ldw	_Drive+1,x
1774                     ; 823 			Drive.Overrun = 0u;
1776  047b bf2c          	ldw	_Drive+5,x
1777                     ; 824 			Drive.ZeroOffset = 0u;
1779  047d bf2f          	ldw	_Drive+8,x
1780                     ; 825 			Drive.Run = FALSE;			
1782  047f 72130027      	bres	_Drive,#1
1783                     ; 826 			StopDrive();
1788  0483 cc0370        	jp	_StopDrive
1789  0486               L125:
1790                     ; 830 			Drive.Overrun++;
1792  0486 5c            	incw	x
1793  0487 bf2c          	ldw	_Drive+5,x
1794                     ; 831 			MotorStep(nMotorClose);
1796  0489               L715:
1797                     ; 835 		MotorStep(nMotorClose);		// move 1 step close
1800  0489 4f            	clr	a
1802                     ; 836 }
1805  048a cc03f3        	jp	_MotorStep
1832                     ; 841 void DriveService(void)
1832                     ; 842 {
1833                     	switch	.text
1834  048d               _DriveService:
1836  048d 89            	pushw	x
1837       00000002      OFST:	set	2
1840                     ; 852 	if ( ! Drive.Run ) 
1842  048e 7202002702    	btjt	_Drive,#1,L735
1843                     ; 854 		StopDrive();
1845                     ; 855 		return;	//when Drive is stop 
1847  0493 2035          	jp	LC006
1848  0495               L735:
1849                     ; 862 	if ( Drive.Target > Drive.Position )
1851  0495 be2a          	ldw	x,_Drive+3
1852  0497 b328          	cpw	x,_Drive+1
1853  0499 2307          	jrule	L145
1854                     ; 863 	 	MotorStep(nMotorOpen);
1856  049b a601          	ld	a,#1
1857  049d cd03f3        	call	_MotorStep
1860  04a0 202b          	jra	L345
1861  04a2               L145:
1862                     ; 864 	else if ( Drive.Target < Drive.Position )
1864  04a2 b328          	cpw	x,_Drive+1
1865  04a4 2404          	jruge	L545
1866                     ; 865 		MotorClose( );
1868  04a6 adc4          	call	_MotorClose
1871  04a8 2023          	jra	L345
1872  04aa               L545:
1873                     ; 866 	else if ( Drive.Target ) 	// on target position
1875  04aa be2a          	ldw	x,_Drive+3
1876  04ac 2713          	jreq	L355
1877                     ; 868 			if ( Drive.Overrun2 )
1879  04ae b62e          	ld	a,_Drive+7
1880  04b0 270f          	jreq	L355
1881                     ; 870 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1883  04b2 5f            	clrw	x
1884  04b3 97            	ld	xl,a
1885  04b4 1f01          	ldw	(OFST-1,sp),x
1887  04b6 be2a          	ldw	x,_Drive+3
1888  04b8 72f001        	subw	x,(OFST-1,sp)
1889  04bb bf2a          	ldw	_Drive+3,x
1890                     ; 871 				Drive.Overrun2 = 0u;
1892  04bd 3f2e          	clr	_Drive+7
1894  04bf 200c          	jra	L345
1895  04c1               L355:
1896                     ; 875 				Drive.ZeroOffset = 0u;
1897                     ; 876 				Drive.Overrun = 0u;
1898                     ; 877 				Drive.Run = FALSE;
1899                     ; 878 				StopDrive();		
1901                     ; 884 			Drive.ZeroOffset = 0u;
1903                     ; 885 			Drive.Overrun = 0u;
1905                     ; 886 			Drive.Run = FALSE;
1908  04c1 5f            	clrw	x
1909  04c2 bf2f          	ldw	_Drive+8,x
1911  04c4 bf2c          	ldw	_Drive+5,x
1913  04c6 72130027      	bres	_Drive,#1
1914                     ; 887 			StopDrive();	
1916  04ca               LC006:
1919  04ca cd0370        	call	_StopDrive
1921  04cd               L345:
1922                     ; 889 }
1925  04cd 85            	popw	x
1926  04ce 81            	ret	
1949                     ; 892 void Excitation_2Phase( void )
1949                     ; 893 {
1950                     	switch	.text
1951  04cf               _Excitation_2Phase:
1955                     ; 952 }
1958  04cf 81            	ret	
1984                     ; 955 void Excitation_12Phase( void )
1984                     ; 956 {
1985                     	switch	.text
1986  04d0               _Excitation_12Phase:
1990                     ; 958 	switch (Drive.Phase%8)
1992  04d0 b631          	ld	a,_Drive+10
1993  04d2 a407          	and	a,#7
1995                     ; 1009 		default:
1995                     ; 1010 			break;
1996  04d4 2716          	jreq	L175
1997  04d6 4a            	dec	a
1998  04d7 271d          	jreq	L375
1999  04d9 4a            	dec	a
2000  04da 272d          	jreq	L575
2001  04dc 4a            	dec	a
2002  04dd 273f          	jreq	L775
2003  04df 4a            	dec	a
2004  04e0 2748          	jreq	L106
2005  04e2 4a            	dec	a
2006  04e3 2753          	jreq	L306
2007  04e5 4a            	dec	a
2008  04e6 276e          	jreq	L506
2009  04e8 4a            	dec	a
2010  04e9 2775          	jreq	L706
2012  04eb 81            	ret	
2013  04ec               L175:
2014                     ; 960 		case 0:
2014                     ; 961 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2016  04ec 4b40          	push	#64
2017  04ee ae500a        	ldw	x,#20490
2018  04f1 cd0000        	call	_GPIO_WriteHigh
2020                     ; 962 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2022                     ; 963 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2024                     ; 964 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2026                     ; 965 			break;
2028  04f4 2008          	jp	LC011
2029  04f6               L375:
2030                     ; 966 		case 1:
2030                     ; 967 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2032  04f6 4b40          	push	#64
2033  04f8 ae500a        	ldw	x,#20490
2034  04fb cd0000        	call	_GPIO_WriteLow
2036                     ; 968 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2038  04fe               LC011:
2039  04fe 84            	pop	a
2041  04ff 4b08          	push	#8
2042  0501 ae500a        	ldw	x,#20490
2043  0504 cd0000        	call	_GPIO_WriteHigh
2045                     ; 969 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2047                     ; 970 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2049                     ; 971 			break;		
2051  0507 2068          	jp	LC010
2052  0509               L575:
2053                     ; 972 		case 2:
2053                     ; 973 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2055  0509 ad7a          	call	LC015
2056                     ; 974 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2058  050b 4b08          	push	#8
2059  050d ae500a        	ldw	x,#20490
2060  0510 cd0000        	call	_GPIO_WriteHigh
2062                     ; 975 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2064  0513               LC012:
2065  0513 84            	pop	a
2067  0514 4b80          	push	#128
2068  0516 ae500a        	ldw	x,#20490
2069  0519 cd0000        	call	_GPIO_WriteHigh
2071                     ; 976 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2073                     ; 977 			break;
2075  051c 205c          	jp	LC009
2076  051e               L775:
2077                     ; 978 		case 3:
2077                     ; 979 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2079  051e ad65          	call	LC015
2080                     ; 980 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2082  0520 4b08          	push	#8
2083  0522 ae500a        	ldw	x,#20490
2084  0525 cd0000        	call	_GPIO_WriteLow
2086                     ; 981 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2088                     ; 982 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2090                     ; 983 			break;
2092  0528 20e9          	jp	LC012
2093  052a               L106:
2094                     ; 984 		case 4:
2094                     ; 985 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2096  052a ad59          	call	LC015
2097                     ; 986 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2099  052c ad61          	call	LC016
2100                     ; 987 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2102  052e 4b80          	push	#128
2103  0530 ae500a        	ldw	x,#20490
2104  0533 cd0000        	call	_GPIO_WriteHigh
2106                     ; 988 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2108                     ; 989 			break;
2110  0536 2013          	jp	LC013
2111  0538               L306:
2112                     ; 990 		case 5: 
2112                     ; 991 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2114  0538 4b40          	push	#64
2115  053a ae500a        	ldw	x,#20490
2116  053d cd0000        	call	_GPIO_WriteLow
2118                     ; 992 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2121                     ; 993 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2123  0540               LC014:
2124  0540 84            	pop	a
2126  0541 ad4c          	call	LC016
2128  0543 4b80          	push	#128
2129  0545 ae500a        	ldw	x,#20490
2130  0548 cd0000        	call	_GPIO_WriteLow
2132                     ; 994 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2134  054b               LC013:
2135  054b 84            	pop	a
2138  054c 4b08          	push	#8
2139  054e ae5000        	ldw	x,#20480
2140  0551 cd0000        	call	_GPIO_WriteHigh
2142                     ; 995 			break;
2144  0554 202d          	jp	LC008
2145  0556               L506:
2146                     ; 996 		case 6:  
2146                     ; 997 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2148  0556 4b40          	push	#64
2149  0558 ae500a        	ldw	x,#20490
2150  055b cd0000        	call	_GPIO_WriteHigh
2152                     ; 998 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2154                     ; 999 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2156                     ; 1000 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2158                     ; 1001 			break;
2160  055e 20e0          	jp	LC014
2161  0560               L706:
2162                     ; 1002 		case 7:
2162                     ; 1003 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2164  0560 4b40          	push	#64
2165  0562 ae500a        	ldw	x,#20490
2166  0565 cd0000        	call	_GPIO_WriteHigh
2168  0568 84            	pop	a
2169                     ; 1004 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2171  0569 4b08          	push	#8
2172  056b ae500a        	ldw	x,#20490
2173  056e cd0000        	call	_GPIO_WriteLow
2175                     ; 1005 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2177  0571               LC010:
2178  0571 84            	pop	a
2181  0572 4b80          	push	#128
2182  0574 ae500a        	ldw	x,#20490
2183  0577 cd0000        	call	_GPIO_WriteLow
2185                     ; 1006 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2187  057a               LC009:
2188  057a 84            	pop	a
2193  057b 4b08          	push	#8
2194  057d ae5000        	ldw	x,#20480
2195  0580 cd0000        	call	_GPIO_WriteLow
2197  0583               LC008:
2198  0583 84            	pop	a
2199                     ; 1007 			break;
2201                     ; 1009 		default:
2201                     ; 1010 			break;
2203                     ; 1013 }
2206  0584 81            	ret	
2207  0585               LC015:
2208  0585 4b40          	push	#64
2209  0587 ae500a        	ldw	x,#20490
2210  058a cd0000        	call	_GPIO_WriteLow
2212  058d 84            	pop	a
2213  058e 81            	ret	
2214  058f               LC016:
2215  058f 4b08          	push	#8
2216  0591 ae500a        	ldw	x,#20490
2217  0594 cd0000        	call	_GPIO_WriteLow
2219  0597 84            	pop	a
2220  0598 81            	ret	
2243                     ; 1015 void Excitation_1Phase( void )
2243                     ; 1016 {
2244                     	switch	.text
2245  0599               _Excitation_1Phase:
2249                     ; 1053 }
2252  0599 81            	ret	
2287                     ; 1056 u8 Interval( u16 Vmon)
2287                     ; 1057 {
2288                     	switch	.text
2289  059a               _Interval:
2291  059a 89            	pushw	x
2292       00000000      OFST:	set	0
2295                     ; 1058 	Vmon = Vmon / IntervalSlope;
2297  059b a61c          	ld	a,#28
2298  059d 62            	div	x,a
2299                     ; 1060 	if (Vmon < 10 ) Vmon = 10;
2301  059e a3000a        	cpw	x,#10
2302  05a1 2403          	jruge	L556
2305  05a3 ae000a        	ldw	x,#10
2306  05a6               L556:
2307                     ; 1061 	if (Vmon > 26 ) Vmon = 26;
2309  05a6 a3001b        	cpw	x,#27
2310  05a9 2503          	jrult	L756
2313  05ab ae001a        	ldw	x,#26
2314  05ae               L756:
2315                     ; 1063 	return ( TableInterval[ Vmon-10 ] );
2317  05ae 1d000a        	subw	x,#10
2318  05b1 e603          	ld	a,(_TableInterval,x)
2321  05b3 85            	popw	x
2322  05b4 81            	ret	
2365                     	switch	.const
2366  0004               L263:
2367  0004 00000960      	dc.l	2400
2368                     ; 1078 uint16_t CStep( uint16_t pulse )
2368                     ; 1079 {
2369                     	switch	.text
2370  05b5               _CStep:
2372  05b5 5204          	subw	sp,#4
2373       00000004      OFST:	set	4
2376                     ; 1082 	i = (uint32_t) pulse * 200u / (2400UL);
2378  05b7 a6c8          	ld	a,#200
2379  05b9 cd0000        	call	c_cmulx
2381  05bc ae0004        	ldw	x,#L263
2382  05bf cd0000        	call	c_ludv
2384  05c2 96            	ldw	x,sp
2385  05c3 5c            	incw	x
2386  05c4 cd0000        	call	c_rtol
2389                     ; 1083 	i = (i+1)/2;   				// Round up  20150925
2391  05c7 96            	ldw	x,sp
2392  05c8 5c            	incw	x
2393  05c9 cd0000        	call	c_ltor
2395  05cc a601          	ld	a,#1
2396  05ce cd0000        	call	c_ladc
2398  05d1 3400          	srl	c_lreg
2399  05d3 3601          	rrc	c_lreg+1
2400  05d5 3602          	rrc	c_lreg+2
2401  05d7 96            	ldw	x,sp
2402  05d8 3603          	rrc	c_lreg+3
2403  05da 5c            	incw	x
2404  05db cd0000        	call	c_rtol
2407                     ; 1084 	return (uint16_t) i;
2409  05de 1e03          	ldw	x,(OFST-1,sp)
2412  05e0 5b04          	addw	sp,#4
2413  05e2 81            	ret	
2456                     ; 1088 uint16_t CPulse( uint16_t step )
2456                     ; 1089 {
2457                     	switch	.text
2458  05e3               _CPulse:
2460  05e3 5204          	subw	sp,#4
2461       00000004      OFST:	set	4
2464                     ; 1092     i= (uint32_t) step *(24UL);
2466  05e5 a618          	ld	a,#24
2467  05e7 cd0000        	call	c_cmulx
2469  05ea 96            	ldw	x,sp
2470  05eb 5c            	incw	x
2471  05ec cd0000        	call	c_rtol
2474                     ; 1094 	return (uint16_t) i;
2476  05ef 1e03          	ldw	x,(OFST-1,sp)
2479  05f1 5b04          	addw	sp,#4
2480  05f3 81            	ret	
2509                     ; 1105 void Clock_Config(void)
2509                     ; 1106 {
2510                     	switch	.text
2511  05f4               _Clock_Config:
2515                     ; 1108 	CLK_DeInit();
2517  05f4 cd0000        	call	_CLK_DeInit
2519                     ; 1109 	CLK_HSICmd(ENABLE);
2521  05f7 a601          	ld	a,#1
2522  05f9 cd0000        	call	_CLK_HSICmd
2524                     ; 1110 	CLK_LSICmd(DISABLE);
2526  05fc 4f            	clr	a
2527  05fd cd0000        	call	_CLK_LSICmd
2529                     ; 1111 	CLK_HSECmd(DISABLE);
2531  0600 4f            	clr	a
2532  0601 cd0000        	call	_CLK_HSECmd
2534                     ; 1113 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2536  0604 4f            	clr	a
2537  0605 cd0000        	call	_CLK_HSIPrescalerConfig
2539                     ; 1114 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2541  0608 a680          	ld	a,#128
2543                     ; 1115 }
2546  060a cc0000        	jp	_CLK_SYSCLKConfig
2572                     ; 1118 void Gpio_Config(void)
2572                     ; 1119 {
2573                     	switch	.text
2574  060d               _Gpio_Config:
2578                     ; 1121   GPIO_Init( _LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2580  060d 4be0          	push	#224
2581  060f 4b04          	push	#4
2582  0611 ae5000        	ldw	x,#20480
2583  0614 cd0000        	call	_GPIO_Init
2585  0617 85            	popw	x
2586                     ; 1122 	GPIO_WriteHigh( _LED_PORT, _LED_PIN);
2588  0618 4b04          	push	#4
2589  061a ae5000        	ldw	x,#20480
2590  061d cd0000        	call	_GPIO_WriteHigh
2592  0620 84            	pop	a
2593                     ; 1125 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2595  0621 4be0          	push	#224
2596  0623 4b40          	push	#64
2597  0625 ae500a        	ldw	x,#20490
2598  0628 cd0000        	call	_GPIO_Init
2600  062b 85            	popw	x
2601                     ; 1126 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2603  062c 4be0          	push	#224
2604  062e 4b80          	push	#128
2605  0630 ae500a        	ldw	x,#20490
2606  0633 cd0000        	call	_GPIO_Init
2608  0636 85            	popw	x
2609                     ; 1127 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2611  0637 4be0          	push	#224
2612  0639 4b08          	push	#8
2613  063b ae500a        	ldw	x,#20490
2614  063e cd0000        	call	_GPIO_Init
2616  0641 85            	popw	x
2617                     ; 1128 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2619  0642 4be0          	push	#224
2620  0644 4b08          	push	#8
2621  0646 ae5000        	ldw	x,#20480
2622  0649 cd0000        	call	_GPIO_Init
2624  064c 85            	popw	x
2625                     ; 1130 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2627  064d 4b40          	push	#64
2628  064f ae500a        	ldw	x,#20490
2629  0652 cd0000        	call	_GPIO_WriteLow
2631  0655 84            	pop	a
2632                     ; 1131 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2634  0656 4b08          	push	#8
2635  0658 ae500a        	ldw	x,#20490
2636  065b cd0000        	call	_GPIO_WriteLow
2638  065e 84            	pop	a
2639                     ; 1132 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2641  065f 4b80          	push	#128
2642  0661 ae500a        	ldw	x,#20490
2643  0664 cd0000        	call	_GPIO_WriteLow
2645  0667 84            	pop	a
2646                     ; 1133 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2648  0668 4b08          	push	#8
2649  066a ae5000        	ldw	x,#20480
2650  066d cd0000        	call	_GPIO_WriteLow
2652  0670 84            	pop	a
2653                     ; 1136   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2655  0671 4b00          	push	#0
2656  0673 4b10          	push	#16
2657  0675 ae5005        	ldw	x,#20485
2658  0678 cd0000        	call	_GPIO_Init
2660  067b 85            	popw	x
2661                     ; 1139 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
2663  067c 4b00          	push	#0
2664  067e 4b04          	push	#4
2665  0680 ae500f        	ldw	x,#20495
2666  0683 cd0000        	call	_GPIO_Init
2668  0686 85            	popw	x
2669                     ; 1141 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2671  0687 4b00          	push	#0
2672  0689 4b10          	push	#16
2673  068b ae500f        	ldw	x,#20495
2674  068e cd0000        	call	_GPIO_Init
2676  0691 85            	popw	x
2677                     ; 1143 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2679  0692 4b00          	push	#0
2680  0694 4b10          	push	#16
2681  0696 ae500a        	ldw	x,#20490
2682  0699 cd0000        	call	_GPIO_Init
2684  069c 85            	popw	x
2685                     ; 1144 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
2687  069d 4b00          	push	#0
2688  069f 4b08          	push	#8
2689  06a1 ae500f        	ldw	x,#20495
2690  06a4 cd0000        	call	_GPIO_Init
2692  06a7 85            	popw	x
2693                     ; 1146 }
2696  06a8 81            	ret	
2732                     ; 1178 void TIM2_Config(uint8_t Edge)
2732                     ; 1179 {
2733                     	switch	.text
2734  06a9               _TIM2_Config:
2738                     ; 1181 	if ( Edge == 0 )
2740  06a9 4d            	tnz	a
2741  06aa 2609          	jrne	L367
2742                     ; 1182 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
2742                     ; 1183                TIM2_ICPSC_DIV8, 0xf);		//  16MHz /8 = 2MHz
2744  06ac 4b0f          	push	#15
2745  06ae 4b0c          	push	#12
2746  06b0 4b01          	push	#1
2747  06b2 5f            	clrw	x
2750  06b3 2009          	jra	L567
2751  06b5               L367:
2752                     ; 1185 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
2752                     ; 1186                TIM2_ICPSC_DIV8, 0xf);
2754  06b5 4b0f          	push	#15
2755  06b7 4b0c          	push	#12
2756  06b9 4b01          	push	#1
2757  06bb ae0044        	ldw	x,#68
2759  06be               L567:
2760  06be cd0000        	call	_TIM2_ICInit
2761  06c1 5b03          	addw	sp,#3
2762                     ; 1189   TIM2_Cmd(ENABLE);
2764  06c3 a601          	ld	a,#1
2766                     ; 1195 }
2769  06c5 cc0000        	jp	_TIM2_Cmd
2796                     ; 1199 void Timer4_Config(void)
2796                     ; 1200 {
2797                     	switch	.text
2798  06c8               L5_Timer4_Config:
2802                     ; 1201   TIM4_DeInit();
2804  06c8 cd0000        	call	_TIM4_DeInit
2806                     ; 1207 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
2808  06cb ae0432        	ldw	x,#1074
2809  06ce cd0000        	call	_TIM4_TimeBaseInit
2811                     ; 1210   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2813  06d1 ae0101        	ldw	x,#257
2814  06d4 cd0000        	call	_TIM4_ITConfig
2816                     ; 1213   TIM4_Cmd(ENABLE);
2818  06d7 a601          	ld	a,#1
2820                     ; 1214 }
2823  06d9 cc0000        	jp	_TIM4_Cmd
2851                     ; 1217 static void Adc_Config( void )
2851                     ; 1218 {
2852                     	switch	.text
2853  06dc               L3_Adc_Config:
2857                     ; 1220 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
2859  06dc cd0000        	call	_ADC1_GetConversionValue
2861  06df b613          	ld	a,_Adc+6
2862  06e1 905f          	clrw	y
2863  06e3 9097          	ld	yl,a
2864  06e5 9058          	sllw	y
2865  06e7 90ef0d        	ldw	(_Adc,y),x
2866                     ; 1221 	ADC1_DeInit();
2868  06ea cd0000        	call	_ADC1_DeInit
2870                     ; 1223 	switch (Adc.Idx)
2872  06ed b613          	ld	a,_Adc+6
2874                     ; 1245 			break;
2875  06ef 2708          	jreq	L777
2876  06f1 4a            	dec	a
2877  06f2 271f          	jreq	L1001
2878  06f4 4a            	dec	a
2879  06f5 2736          	jreq	L3001
2880                     ; 1243 		default:
2880                     ; 1244 			Adc.Idx = 0;
2881                     ; 1245 			break;
2883  06f7 2048          	jp	LC017
2884  06f9               L777:
2885                     ; 1225 		case 0:
2885                     ; 1226 		  
2885                     ; 1227 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
2885                     ; 1228 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
2887  06f9 4b00          	push	#0
2888  06fb 4b03          	push	#3
2889  06fd 4b08          	push	#8
2890  06ff 4b00          	push	#0
2891  0701 4b00          	push	#0
2892  0703 4b00          	push	#0
2893  0705 ae0003        	ldw	x,#3
2894  0708 cd0000        	call	_ADC1_Init
2896  070b 5b06          	addw	sp,#6
2897                     ; 1229 			Adc.Idx = 1;
2899  070d 35010013      	mov	_Adc+6,#1
2900                     ; 1230 			break;
2902  0711 2030          	jra	L1201
2903  0713               L1001:
2904                     ; 1231 		case 1:
2904                     ; 1232 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
2904                     ; 1233 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
2906  0713 4b00          	push	#0
2907  0715 4b04          	push	#4
2908  0717 4b08          	push	#8
2909  0719 4b00          	push	#0
2910  071b 4b00          	push	#0
2911  071d 4b00          	push	#0
2912  071f ae0004        	ldw	x,#4
2913  0722 cd0000        	call	_ADC1_Init
2915  0725 5b06          	addw	sp,#6
2916                     ; 1234 			Adc.Idx = 2;
2918  0727 35020013      	mov	_Adc+6,#2
2919                     ; 1235 			break;
2921  072b 2016          	jra	L1201
2922  072d               L3001:
2923                     ; 1237 		case 2:
2923                     ; 1238 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
2923                     ; 1239 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
2925  072d 4b00          	push	#0
2926  072f 4b02          	push	#2
2927  0731 4b08          	push	#8
2928  0733 4b00          	push	#0
2929  0735 4b00          	push	#0
2930  0737 4b00          	push	#0
2931  0739 ae0002        	ldw	x,#2
2932  073c cd0000        	call	_ADC1_Init
2934  073f 5b06          	addw	sp,#6
2935                     ; 1240 			Adc.Idx = 0;
2937  0741               LC017:
2939  0741 3f13          	clr	_Adc+6
2940                     ; 1241 			break;
2942  0743               L1201:
2943                     ; 1248 		ADC1_StartConversion();		
2946                     ; 1249 }
2949  0743 cc0000        	jp	_ADC1_StartConversion
2993                     ; 1264 void assert_failed(u8* file, u32 line)
2993                     ; 1265 {
2994                     	switch	.text
2995  0746               _assert_failed:
2997  0746 88            	push	a
2998       00000001      OFST:	set	1
3001  0747               L5401:
3002                     ; 1274 	i = i++;
3004  0747 0c01          	inc	(OFST+0,sp)
3006  0749 6b01          	ld	(OFST+0,sp),a
3009  074b 20fa          	jra	L5401
3685                     	xdef	_MotorClose
3686                     	xdef	_MotorStep
3687                     	xdef	_OnTimer_1mS
3688                     	switch	.ubsct
3689  0000               _pos2:
3690  0000 00            	ds.b	1
3691                     	xdef	_pos2
3692  0001               _pos:
3693  0001 0000          	ds.b	2
3694                     	xdef	_pos
3695                     	xdef	_OnTimer_1S
3696                     	xdef	_main
3697                     	xdef	_min
3698                     	xdef	_MotorService
3699                     	xdef	_AdcService
3700                     	xdef	_SAbs
3701                     	xdef	_Diff
3702                     	xdef	_TIM2_Config
3703                     	xdef	_Gpio_Config
3704                     	xdef	_Clock_Config
3705                     	xdef	_OnCaptureOVTim2
3706                     	xdef	_OnCaptureTim2
3707                     	xdef	_OnTimer4
3708                     	xdef	_StopDrive
3709                     	xdef	_Interval
3710                     	xdef	_StartDriveOR
3711                     	xdef	_DriveService
3712                     	xdef	_Excitation_2Phase
3713                     	xdef	_Excitation_12Phase
3714                     	xdef	_Excitation_1Phase
3715                     	xdef	_CPulse
3716                     	xdef	_CStep
3717                     	xdef	_PowerDelay_1mS
3718  0003               _Timer:
3719  0003 000000000000  	ds.b	10
3720                     	xdef	_Timer
3721  000d               _Adc:
3722  000d 000000000000  	ds.b	14
3723                     	xdef	_Adc
3724  001b               _My:
3725  001b 000000000000  	ds.b	12
3726                     	xdef	_My
3727  0027               _Drive:
3728  0027 000000000000  	ds.b	45
3729                     	xdef	_Drive
3730                     	xdef	_TableInterval
3731  0054               _ledint:
3732  0054 0000          	ds.b	2
3733                     	xdef	_ledint
3734  0056               _Ticks_S:
3735  0056 00000000      	ds.b	4
3736                     	xdef	_Ticks_S
3737  005a               _Ticks2_1mS:
3738  005a 0000          	ds.b	2
3739                     	xdef	_Ticks2_1mS
3740  005c               _Ticks_1mS:
3741  005c 0000          	ds.b	2
3742                     	xdef	_Ticks_1mS
3743  005e               _Ticks_50uS:
3744  005e 00000000      	ds.b	4
3745                     	xdef	_Ticks_50uS
3746  0062               _mDuty:
3747  0062 0000          	ds.b	2
3748                     	xdef	_mDuty
3749                     	xdef	_nDuty
3750  0064               _sDuty:
3751  0064 0000          	ds.b	2
3752                     	xdef	_sDuty
3753  0066               _iDuty:
3754  0066 00            	ds.b	1
3755                     	xdef	_iDuty
3756  0067               _Duty:
3757  0067 000000000000  	ds.b	16
3758                     	xdef	_Duty
3759  0077               _Dif:
3760  0077 0000          	ds.b	2
3761                     	xdef	_Dif
3762  0079               _update:
3763  0079 00            	ds.b	1
3764                     	xdef	_update
3765  007a               _t2:
3766  007a 0000          	ds.b	2
3767                     	xdef	_t2
3768  007c               _tt:
3769  007c 0000          	ds.b	2
3770                     	xdef	_tt
3771                     	xdef	_PeriodNumber
3772  007e               _Counter:
3773  007e 0000          	ds.b	2
3774                     	xdef	_Counter
3775                     	xdef	_assert_failed
3776                     	xref	_TIM4_ITConfig
3777                     	xref	_TIM4_Cmd
3778                     	xref	_TIM4_TimeBaseInit
3779                     	xref	_TIM4_DeInit
3780                     	xref	_TIM2_GetITStatus
3781                     	xref	_TIM2_ClearFlag
3782                     	xref	_TIM2_GetCapture1
3783                     	xref	_TIM2_SetCounter
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
3826                     	xref	c_cmulx
3827                     	xref	c_ladc
3828                     	xref	c_ludv
3829                     	xref	c_umul
3830                     	xref	c_lgadc
3831                     	xref	c_ltor
3832                     	xref	c_lcmp
3833                     	xref	c_ladd
3834                     	xref	c_lsub
3835                     	xref	c_rtol
3836                     	xref	c_uitolx
3837                     	end
