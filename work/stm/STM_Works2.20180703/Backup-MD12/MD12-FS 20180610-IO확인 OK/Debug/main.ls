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
 102                     ; 219 void main(void)
 102                     ; 220 {
 104                     	switch	.text
 105  0000               _main:
 107  0000 89            	pushw	x
 108       00000002      OFST:	set	2
 111                     ; 226 	Ticks_1mS = 0;
 113  0001 5f            	clrw	x
 114  0002 bf4d          	ldw	_Ticks_1mS,x
 115                     ; 227 	Ticks_50uS = 0;
 117  0004 3f4f          	clr	_Ticks_50uS
 118                     ; 229 	My.GearRatio100 = 26520u;		//  	4096 * 300/360 * 15.54 
 120  0006 ae6798        	ldw	x,#26520
 121  0009 bf2b          	ldw	_My+12,x
 122                     ; 231 	Clock_Config();
 124  000b cd0715        	call	_Clock_Config
 126                     ; 232 	Gpio_Config();
 128  000e cd072e        	call	_Gpio_Config
 130                     ; 234 	Timer4_Config();
 132  0011 cd081f        	call	L5_Timer4_Config
 134                     ; 236 	Adc.Idx = 2;
 136  0014 35020015      	mov	_Adc+10,#2
 137                     ; 237 	Adc.IdxAvg = 0;
 139  0018 3f1b          	clr	_Adc+16
 140                     ; 238 	Adc.Average = 0;
 142  001a 3f1c          	clr	_Adc+17
 143                     ; 239 	Adc.Sum = 0;
 145  001c 5f            	clrw	x
 146  001d bf1d          	ldw	_Adc+18,x
 147                     ; 240 	Adc_Config(  );
 149  001f cd0833        	call	L3_Adc_Config
 151                     ; 246 	Drive.NormalOpen = 1;
 153  0022 35010044      	mov	_Drive+22,#1
 154                     ; 247 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 156  0026 ae012c        	ldw	x,#300
 157  0029 bf39          	ldw	_Drive+11,x
 158                     ; 249 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 160  002b bf40          	ldw	_Drive+18,x
 161                     ; 252 	Drive.ExcitationType = 0;		//	2 excition
 163  002d 3f42          	clr	_Drive+20
 164                     ; 255 	Drive.Interval = 13u;			//	20180225
 166  002f 350d003e      	mov	_Drive+16,#13
 167                     ; 256 	Drive.DiffStep = 1;
 169  0033 35010047      	mov	_Drive+25,#1
 170                     ; 257 	Drive.Enabled = ENABLED;
 172  0037 7210002e      	bset	_Drive,#0
 173                     ; 258 	Drive.Stage = 0;		// Charging
 175  003b 3f48          	clr	_Drive+26
 176                     ; 260 	My.BoostEnable = 0;
 178  003d 7211002d      	bres	_My+14,#0
 179                     ; 261 	My.ChargeOn = 0;
 181  0041 7213002d      	bres	_My+14,#1
 182                     ; 264 	enableInterrupts();
 185  0045 9a            	rim	
 189  0046               L53:
 190                     ; 266   while ( Ticks_1mS < PowerDelay_1mS )
 192  0046 b613          	ld	a,_PowerDelay_1mS
 193  0048 5f            	clrw	x
 194  0049 97            	ld	xl,a
 195  004a bf00          	ldw	c_x,x
 196  004c be4d          	ldw	x,_Ticks_1mS
 197  004e b300          	cpw	x,c_x
 198  0050 25f4          	jrult	L53
 199                     ; 269 	GPIO_WriteLow(_LED_PORT, _LED_PIN);
 201  0052 4b10          	push	#16
 202  0054 ae5005        	ldw	x,#20485
 203  0057 cd0000        	call	_GPIO_WriteLow
 205  005a be4d          	ldw	x,_Ticks_1mS
 206  005c bf00          	ldw	_Timer,x
 207  005e bf02          	ldw	_Timer+2,x
 208  0060 bf04          	ldw	_Timer+4,x
 209  0062 bf06          	ldw	_Timer+6,x
 210  0064 ae07d0        	ldw	x,#2000
 211  0067 bf49          	ldw	_ledint,x
 212  0069 84            	pop	a
 213                     ; 291 	Timer.Led = Ticks_1mS;
 215                     ; 292 	Timer.Motor = Ticks_1mS;
 217                     ; 293 	Timer.Adc = Ticks_1mS;
 219                     ; 294   Timer.Boost = Ticks_1mS;
 221                     ; 296 	ledint = 2000u;
 223  006a               L14:
 224                     ; 300 		t = Ticks_1mS;
 226  006a be4d          	ldw	x,_Ticks_1mS
 227  006c 1f01          	ldw	(OFST-1,sp),x
 229                     ; 302 		LedService();
 231  006e cd01eb        	call	_LedService
 233                     ; 303 		AdcService();
 235  0071 cd019b        	call	_AdcService
 237                     ; 305 		if ( Drive.Stage == 0 )	//	Charging
 239  0074 b648          	ld	a,_Drive+26
 240  0076 263a          	jrne	L54
 241                     ; 307 			ledint = 1000u;
 243  0078 ae03e8        	ldw	x,#1000
 244  007b bf49          	ldw	_ledint,x
 245                     ; 314 				if (Adc.Value[2] > 850)		//	 Charging then goto origin
 247  007d be0f          	ldw	x,_Adc+4
 248  007f a30353        	cpw	x,#851
 249  0082 2403cc0147    	jrult	L111
 250                     ; 316 					ledint = 1000u;
 252  0087 ae03e8        	ldw	x,#1000
 253  008a bf49          	ldw	_ledint,x
 254                     ; 317 					Drive.Stage = 1;
 256  008c 35010048      	mov	_Drive+26,#1
 257                     ; 318 					if ( Drive.Origin ) 
 259  0090 b643          	ld	a,_Drive+21
 260  0092 2706          	jreq	L15
 261                     ; 320 						Drive.Position = 0;
 263  0094 5f            	clrw	x
 264  0095 bf2f          	ldw	_Drive+1,x
 266  0097 cc0147        	jra	L111
 267  009a               L15:
 268                     ; 324 						Drive.Position = CPulse(210u);
 270  009a ae00d2        	ldw	x,#210
 271  009d cd06ee        	call	_CPulse
 273  00a0 bf2f          	ldw	_Drive+1,x
 274                     ; 325 						Drive.ExcitationType = 0;		//	1 excition
 276  00a2 3f42          	clr	_Drive+20
 277                     ; 326 						Drive.Interval = 13u;			//	20180225
 279  00a4 350d003e      	mov	_Drive+16,#13
 280                     ; 327 						StartDriveOR( 0u, 0u  );				// Goto Zero position
 282  00a8 4b00          	push	#0
 283  00aa 5f            	clrw	x
 284  00ab cd0361        	call	_StartDriveOR
 286  00ae 84            	pop	a
 287  00af cc0147        	jra	L111
 288  00b2               L54:
 289                     ; 332 		else if ( Drive.Stage == 1 )	// Initializing
 291  00b2 a101          	cp	a,#1
 292  00b4 261b          	jrne	L75
 293                     ; 334 			if (My.BoostEnable == 1)
 295  00b6 7201002d06    	btjf	_My+14,#0,L16
 296                     ; 336 				Drive.Stop = 1;	
 298  00bb 7216002e      	bset	_Drive,#3
 299                     ; 337 				Drive.Stage = 0;				
 301  00bf 2078          	jp	LC001
 302  00c1               L16:
 303                     ; 341 				if ( !Drive.Run )		//	Origin
 305  00c1 7202002ee9    	btjt	_Drive,#1,L111
 306                     ; 343 					ledint = 500u;
 308  00c6 ae01f4        	ldw	x,#500
 309  00c9 bf49          	ldw	_ledint,x
 310                     ; 344 					Drive.Stage = 2;
 312  00cb 35020048      	mov	_Drive+26,#2
 313  00cf 2076          	jra	L111
 314  00d1               L75:
 315                     ; 348 		else if ( Drive.Stage == 2 )	//	Running with Power On
 317  00d1 a102          	cp	a,#2
 318  00d3 2656          	jrne	L17
 319                     ; 350 			if (My.BoostEnable == 1)
 321  00d5 7201002d2f    	btjf	_My+14,#0,L37
 322                     ; 352 				if ( Drive.Run )
 324  00da 7203002e06    	btjf	_Drive,#1,L57
 325                     ; 354 					Drive.Stop = 1;			
 327  00df 7216002e      	bset	_Drive,#3
 329  00e3 2062          	jra	L111
 330  00e5               L57:
 331                     ; 358 					if ( Diff ( Timer.Motor, 100u ) )
 333  00e5 ae0064        	ldw	x,#100
 334  00e8 89            	pushw	x
 335  00e9 be02          	ldw	x,_Timer+2
 336  00eb cd0216        	call	_Diff
 338  00ee 4d            	tnz	a
 339  00ef 85            	popw	x
 340  00f0 2755          	jreq	L111
 341                     ; 360 						ledint = 125u;
 343  00f2 ae007d        	ldw	x,#125
 344  00f5 bf49          	ldw	_ledint,x
 345                     ; 361 						Drive.Stage = 3;
 347  00f7 35030048      	mov	_Drive+26,#3
 348                     ; 363 						Drive.ExcitationType = 1;		//	1 excition
 350  00fb 35010042      	mov	_Drive+20,#1
 351                     ; 364 						Drive.Interval = 16u;			//	20180225
 353  00ff 3510003e      	mov	_Drive+16,#16
 354                     ; 367 						Drive.Step = 0u;		//((u16)Adc.Average * 100 )/110; 
 356  0103 3f45          	clr	_Drive+23
 357                     ; 368 						MotorService();
 359  0105 ad50          	call	_MotorService
 361  0107 203e          	jra	L111
 362  0109               L37:
 363                     ; 375 				if ( Diff ( Timer.Motor, 500u ) )
 365  0109 ae01f4        	ldw	x,#500
 366  010c 89            	pushw	x
 367  010d be02          	ldw	x,_Timer+2
 368  010f cd0216        	call	_Diff
 370  0112 4d            	tnz	a
 371  0113 85            	popw	x
 372  0114 2731          	jreq	L111
 373                     ; 377 					Drive.Step = ((u16)Adc.Average * 100 )/110; 
 375  0116 b61c          	ld	a,_Adc+17
 376  0118 5f            	clrw	x
 377  0119 97            	ld	xl,a
 378  011a 90ae0064      	ldw	y,#100
 379  011e cd0000        	call	c_imul
 381  0121 a66e          	ld	a,#110
 382  0123 62            	div	x,a
 383  0124 01            	rrwa	x,a
 384  0125 b745          	ld	_Drive+23,a
 385                     ; 378 					MotorService();
 387  0127 ad2e          	call	_MotorService
 389  0129 201c          	jra	L111
 390  012b               L17:
 391                     ; 383 		else if ( Drive.Stage == 3 )	//	Running with Power Off
 393  012b a103          	cp	a,#3
 394  012d 2618          	jrne	L111
 395                     ; 385 			if (My.BoostEnable == 0)
 397  012f 7200002d09    	btjt	_My+14,#0,L311
 398                     ; 387 				ledint = 500u;
 400  0134 ae01f4        	ldw	x,#500
 401  0137 bf49          	ldw	_ledint,x
 402                     ; 388 				Drive.Stage = 0;
 404  0139               LC001:
 406  0139 3f48          	clr	_Drive+26
 408  013b 200a          	jra	L111
 409  013d               L311:
 410                     ; 392 				if ( !Drive.Run )
 412  013d 7202002e05    	btjt	_Drive,#1,L111
 413                     ; 394 					ledint = 2000u;
 415  0142 ae07d0        	ldw	x,#2000
 416  0145 bf49          	ldw	_ledint,x
 417  0147               L111:
 418                     ; 400 		else if ( Drive.Stage == 4 )	//	wait
 420                     ; 406 		while ( Diff ( t, 10u ) )
 422  0147 ae000a        	ldw	x,#10
 423  014a 89            	pushw	x
 424  014b 1e03          	ldw	x,(OFST+1,sp)
 425  014d cd0216        	call	_Diff
 427  0150 4d            	tnz	a
 428  0151 85            	popw	x
 429  0152 26f3          	jrne	L111
 430                     ; 410 			;
 432  0154 cc006a        	jra	L14
 461                     ; 416 void MotorService()
 461                     ; 417 {
 462                     	switch	.text
 463  0157               _MotorService:
 467                     ; 423 			if ( Drive.Step > 210u )
 469  0157 b645          	ld	a,_Drive+23
 470  0159 a1d3          	cp	a,#211
 471  015b 2504          	jrult	L341
 472                     ; 424 				Drive.Step = 210u;
 474  015d a6d2          	ld	a,#210
 475  015f b745          	ld	_Drive+23,a
 476  0161               L341:
 477                     ; 425 			if ( Drive.Step < 20u )
 479  0161 a114          	cp	a,#20
 480  0163 2402          	jruge	L541
 481                     ; 426 				Drive.Step = 0u;
 483  0165 3f45          	clr	_Drive+23
 484  0167               L541:
 485                     ; 429 			if  ( SAbs( Drive.Step ,Drive.PreStep ) > 1 )
 487  0167 ad27          	call	LC003
 488  0169 250d          	jrult	L741
 489                     ; 430 				StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 491  016b 4b00          	push	#0
 492  016d b645          	ld	a,_Drive+23
 493  016f 5f            	clrw	x
 494  0170 97            	ld	xl,a
 495  0171 cd06ee        	call	_CPulse
 497  0174 cd0361        	call	_StartDriveOR
 499  0177 84            	pop	a
 500  0178               L741:
 501                     ; 434 			if  ( SAbs( Drive.Step ,Drive.PreStep ) > 1 )
 503  0178 ad16          	call	LC003
 504  017a 250f          	jrult	L151
 505                     ; 436 				if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
 507  017c b645          	ld	a,_Drive+23
 508                     ; 440 						Drive.PreStep = Drive.Step;
 509                     ; 441 						StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 513                     ; 453 					Drive.PreStep = Drive.Step;
 515                     ; 454 					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );					
 520  017e b746          	ld	_Drive+24,a
 522  0180 4b00          	push	#0
 523  0182 5f            	clrw	x
 524  0183 97            	ld	xl,a
 525  0184 cd06ee        	call	_CPulse
 526  0187 cd0361        	call	_StartDriveOR
 527  018a 84            	pop	a
 528  018b               L151:
 529                     ; 458 			Timer.Motor = Ticks_1mS;
 531  018b be4d          	ldw	x,_Ticks_1mS
 532  018d bf02          	ldw	_Timer+2,x
 533                     ; 460 	}
 536  018f 81            	ret	
 537  0190               LC003:
 538  0190 b646          	ld	a,_Drive+24
 539  0192 97            	ld	xl,a
 540  0193 b645          	ld	a,_Drive+23
 541  0195 95            	ld	xh,a
 542  0196 ad6c          	call	_SAbs
 544  0198 a102          	cp	a,#2
 545  019a 81            	ret	
 572                     ; 464 void AdcService()
 572                     ; 465 {
 573                     	switch	.text
 574  019b               _AdcService:
 578                     ; 466 	if ( Diff ( Timer.Adc, 10u ) )
 580  019b ae000a        	ldw	x,#10
 581  019e 89            	pushw	x
 582  019f be04          	ldw	x,_Timer+4
 583  01a1 ad73          	call	_Diff
 585  01a3 4d            	tnz	a
 586  01a4 85            	popw	x
 587  01a5 2743          	jreq	L761
 588                     ; 468 			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
 590  01a7 b61b          	ld	a,_Adc+16
 591  01a9 5f            	clrw	x
 592  01aa 97            	ld	xl,a
 593  01ab e616          	ld	a,(_Adc+11,x)
 594  01ad 5f            	clrw	x
 595  01ae 97            	ld	xl,a
 596  01af 72b0001d      	subw	x,_Adc+18
 597  01b3 50            	negw	x
 598  01b4 bf1d          	ldw	_Adc+18,x
 599                     ; 469 			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
 601  01b6 be0b          	ldw	x,_Adc
 602  01b8 54            	srlw	x
 603  01b9 54            	srlw	x
 604  01ba b61b          	ld	a,_Adc+16
 605  01bc 905f          	clrw	y
 606  01be 9097          	ld	yl,a
 607  01c0 01            	rrwa	x,a
 608  01c1 90e716        	ld	(_Adc+11,y),a
 609                     ; 470 			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
 611  01c4 5f            	clrw	x
 612  01c5 b61b          	ld	a,_Adc+16
 613  01c7 97            	ld	xl,a
 614  01c8 e616          	ld	a,(_Adc+11,x)
 615  01ca bb1e          	add	a,_Adc+19
 616  01cc b71e          	ld	_Adc+19,a
 617  01ce 2402          	jrnc	L07
 618  01d0 3c1d          	inc	_Adc+18
 619  01d2               L07:
 620                     ; 471 			Adc.Average = Adc.Sum /5;
 622  01d2 be1d          	ldw	x,_Adc+18
 623  01d4 a605          	ld	a,#5
 624  01d6 62            	div	x,a
 625  01d7 01            	rrwa	x,a
 626  01d8 b71c          	ld	_Adc+17,a
 627                     ; 472 			if  (Adc.IdxAvg	>= 4 )
 629  01da b61b          	ld	a,_Adc+16
 630  01dc a104          	cp	a,#4
 631  01de 2504          	jrult	L171
 632                     ; 473 				Adc.IdxAvg = 0;
 634  01e0 3f1b          	clr	_Adc+16
 636  01e2 2002          	jra	L371
 637  01e4               L171:
 638                     ; 475 				Adc.IdxAvg++;
 640  01e4 3c1b          	inc	_Adc+16
 641  01e6               L371:
 642                     ; 477 			Timer.Adc = Ticks_1mS;
 644  01e6 be4d          	ldw	x,_Ticks_1mS
 645  01e8 bf04          	ldw	_Timer+4,x
 646  01ea               L761:
 647                     ; 479 }
 650  01ea 81            	ret	
 678                     ; 481 void LedService()
 678                     ; 482 {
 679                     	switch	.text
 680  01eb               _LedService:
 684                     ; 495 		if ( Diff ( Timer.Led, ledint ) )
 686  01eb be49          	ldw	x,_ledint
 687  01ed 89            	pushw	x
 688  01ee be00          	ldw	x,_Timer
 689  01f0 ad24          	call	_Diff
 691  01f2 4d            	tnz	a
 692  01f3 85            	popw	x
 693  01f4 270d          	jreq	L502
 694                     ; 497 			Timer.Led = Ticks_1mS;
 696  01f6 be4d          	ldw	x,_Ticks_1mS
 697  01f8 bf00          	ldw	_Timer,x
 698                     ; 498 			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
 700  01fa 4b10          	push	#16
 701  01fc ae5005        	ldw	x,#20485
 702  01ff cd0000        	call	_GPIO_WriteReverse
 704  0202 84            	pop	a
 705  0203               L502:
 706                     ; 500 }
 709  0203 81            	ret	
 752                     ; 502 u8 SAbs(u8 s1, u8 s2)
 752                     ; 503 {
 753                     	switch	.text
 754  0204               _SAbs:
 756  0204 89            	pushw	x
 757       00000000      OFST:	set	0
 760                     ; 504 	if (s1 > s2 )
 762  0205 9f            	ld	a,xl
 763  0206 1101          	cp	a,(OFST+1,sp)
 764  0208 2406          	jruge	L132
 765                     ; 505 		return s1 - s2;
 767  020a 9f            	ld	a,xl
 768  020b 1001          	sub	a,(OFST+1,sp)
 769  020d 40            	neg	a
 771  020e 2004          	jra	L201
 772  0210               L132:
 773                     ; 507 		return s2 - s1;
 775  0210 7b02          	ld	a,(OFST+2,sp)
 776  0212 1001          	sub	a,(OFST+1,sp)
 778  0214               L201:
 780  0214 85            	popw	x
 781  0215 81            	ret	
 834                     ; 511 u8  Diff( u16 time, u16 diff )
 834                     ; 512 {
 835                     	switch	.text
 836  0216               _Diff:
 838  0216 89            	pushw	x
 839  0217 520c          	subw	sp,#12
 840       0000000c      OFST:	set	12
 843                     ; 514 	t = Ticks_1mS;
 845  0219 be4d          	ldw	x,_Ticks_1mS
 846  021b cd0000        	call	c_uitolx
 848  021e 96            	ldw	x,sp
 849  021f 1c0009        	addw	x,#OFST-3
 850  0222 cd0000        	call	c_rtol
 853                     ; 516 	if (time <= t )
 855  0225 1e0d          	ldw	x,(OFST+1,sp)
 856  0227 cd0000        	call	c_uitolx
 858  022a 96            	ldw	x,sp
 859  022b 1c0009        	addw	x,#OFST-3
 860  022e cd0000        	call	c_lcmp
 862  0231 222f          	jrugt	L362
 863                     ; 518 		if ( ( t - time ) > diff ) 
 865  0233 1e0d          	ldw	x,(OFST+1,sp)
 866  0235 cd0000        	call	c_uitolx
 868  0238 96            	ldw	x,sp
 869  0239 1c0005        	addw	x,#OFST-7
 870  023c cd0000        	call	c_rtol
 873  023f 96            	ldw	x,sp
 874  0240 1c0009        	addw	x,#OFST-3
 875  0243 cd0000        	call	c_ltor
 877  0246 96            	ldw	x,sp
 878  0247 1c0005        	addw	x,#OFST-7
 879  024a cd0000        	call	c_lsub
 881  024d 96            	ldw	x,sp
 882  024e 5c            	incw	x
 883  024f cd0000        	call	c_rtol
 886  0252 1e11          	ldw	x,(OFST+5,sp)
 887  0254 cd0000        	call	c_uitolx
 889  0257 96            	ldw	x,sp
 890  0258 5c            	incw	x
 891  0259 cd0000        	call	c_lcmp
 893                     ; 519 			return 1;
 895  025c 2537          	jrult	LC005
 896  025e               L562:
 897                     ; 521 			return 0;
 900  025e 4f            	clr	a
 902  025f               L601:
 904  025f 5b0e          	addw	sp,#14
 905  0261 81            	ret	
 906  0262               L362:
 907                     ; 525 		if ( ( 65535 - time + t  ) > diff ) 
 909  0262 1e0d          	ldw	x,(OFST+1,sp)
 910  0264 cd0000        	call	c_uitolx
 912  0267 96            	ldw	x,sp
 913  0268 1c0005        	addw	x,#OFST-7
 914  026b cd0000        	call	c_rtol
 917  026e aeffff        	ldw	x,#65535
 918  0271 bf02          	ldw	c_lreg+2,x
 919  0273 5f            	clrw	x
 920  0274 bf00          	ldw	c_lreg,x
 921  0276 96            	ldw	x,sp
 922  0277 1c0005        	addw	x,#OFST-7
 923  027a cd0000        	call	c_lsub
 925  027d 96            	ldw	x,sp
 926  027e 1c0009        	addw	x,#OFST-3
 927  0281 cd0000        	call	c_ladd
 929  0284 96            	ldw	x,sp
 930  0285 5c            	incw	x
 931  0286 cd0000        	call	c_rtol
 934  0289 1e11          	ldw	x,(OFST+5,sp)
 935  028b cd0000        	call	c_uitolx
 937  028e 96            	ldw	x,sp
 938  028f 5c            	incw	x
 939  0290 cd0000        	call	c_lcmp
 941  0293 24c9          	jruge	L562
 942                     ; 526 			return 1;
 944  0295               LC005:
 946  0295 a601          	ld	a,#1
 948  0297 20c6          	jra	L601
 949                     ; 528 			return 0;
 973                     ; 532 void OnTimer_1S(void)
 973                     ; 533 {
 974                     	switch	.text
 975  0299               _OnTimer_1S:
 979                     ; 535 }
 982  0299 81            	ret	
1007                     ; 540 OnTimer_1mS(void)
1007                     ; 541 { 	
1008                     	switch	.text
1009  029a               _OnTimer_1mS:
1013                     ; 542 	Ticks_1mS++;
1015  029a be4d          	ldw	x,_Ticks_1mS
1016  029c 5c            	incw	x
1017  029d bf4d          	ldw	_Ticks_1mS,x
1018                     ; 546 	if ( PowerDelay_1mS )
1020  029f b613          	ld	a,_PowerDelay_1mS
1021  02a1 2702          	jreq	L713
1022                     ; 547 		PowerDelay_1mS--;
1024  02a3 3a13          	dec	_PowerDelay_1mS
1025  02a5               L713:
1026                     ; 548 }
1029  02a5 81            	ret	
1062                     ; 551 void OnTimer4(void)
1062                     ; 552 {
1063                     	switch	.text
1064  02a6               _OnTimer4:
1068                     ; 553 	Ticks_50uS++;
1070  02a6 3c4f          	inc	_Ticks_50uS
1071                     ; 555 	Adc_Config( );
1073  02a8 cd0833        	call	L3_Adc_Config
1075                     ; 557 	if ( My.BoostEnable == 0 && Adc.Value[3] < 20 )	//		Power off
1077  02ab 7200002d0d    	btjt	_My+14,#0,L133
1079  02b0 be11          	ldw	x,_Adc+6
1080  02b2 a30014        	cpw	x,#20
1081  02b5 2406          	jruge	L133
1082                     ; 560 		My.BoostEnable = 1;
1084  02b7 7210002d      	bset	_My+14,#0
1086  02bb 2010          	jra	L333
1087  02bd               L133:
1088                     ; 562 	else if ( My.BoostEnable == 1 &&  Adc.Value[3] >800 )
1090  02bd 7201002d0b    	btjf	_My+14,#0,L333
1092  02c2 be11          	ldw	x,_Adc+6
1093  02c4 a30321        	cpw	x,#801
1094  02c7 2504          	jrult	L333
1095                     ; 565 		My.BoostEnable = 0;
1097  02c9 7211002d      	bres	_My+14,#0
1098  02cd               L333:
1099                     ; 569 	if ( Ticks_50uS == 5 )
1101  02cd b64f          	ld	a,_Ticks_50uS
1102  02cf a105          	cp	a,#5
1103  02d1 2615          	jrne	L733
1104                     ; 570 		Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
1106  02d3 4b02          	push	#2
1107  02d5 ae5000        	ldw	x,#20480
1108  02d8 cd0000        	call	_GPIO_ReadInputPin
1110  02db 5b01          	addw	sp,#1
1111  02dd 4d            	tnz	a
1112  02de 2603          	jrne	L021
1113  02e0 4c            	inc	a
1114  02e1 2001          	jra	L421
1115  02e3               L021:
1116  02e3 4f            	clr	a
1117  02e4               L421:
1118  02e4 b743          	ld	_Drive+21,a
1120  02e6 2040          	jra	L143
1121  02e8               L733:
1122                     ; 572 		if ( Ticks_50uS == 10 )
1124  02e8 a10a          	cp	a,#10
1125  02ea 2613          	jrne	L343
1126                     ; 573 		{	if ( My.ChargeOn ) 
1128  02ec 7203002d07    	btjf	_My+14,#1,L543
1129                     ; 574 				GPIO_WriteHigh( _CHARGE_ON_PORT, _CHARGE_ON_PIN ); 
1131  02f1 4b10          	push	#16
1132  02f3 ae500f        	ldw	x,#20495
1135  02f6 2015          	jp	LC008
1136  02f8               L543:
1137                     ; 576 				GPIO_WriteLow( _CHARGE_ON_PORT, _CHARGE_ON_PIN );
1139  02f8 4b10          	push	#16
1140  02fa ae500f        	ldw	x,#20495
1142  02fd 2018          	jp	LC007
1143  02ff               L343:
1144                     ; 579 		if ( Ticks_50uS == 15 )
1146  02ff a10f          	cp	a,#15
1147  0301 261a          	jrne	L353
1148                     ; 581 			if ( My.BoostEnable ) 
1150  0303 7201002d0a    	btjf	_My+14,#0,L553
1151                     ; 582 				GPIO_WriteHigh( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
1153  0308 4b08          	push	#8
1154  030a ae5000        	ldw	x,#20480
1155  030d               LC008:
1156  030d cd0000        	call	_GPIO_WriteHigh
1159  0310 2008          	jp	LC006
1160  0312               L553:
1161                     ; 584 				GPIO_WriteLow( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
1163  0312 4b08          	push	#8
1164  0314 ae5000        	ldw	x,#20480
1165  0317               LC007:
1166  0317 cd0000        	call	_GPIO_WriteLow
1168  031a               LC006:
1169  031a 84            	pop	a
1170  031b 200b          	jra	L143
1171  031d               L353:
1172                     ; 587 		if ( Ticks_50uS >= 20 )
1174  031d a114          	cp	a,#20
1175  031f 2507          	jrult	L143
1176                     ; 589 			Ticks_50uS = 0;
1178  0321 3f4f          	clr	_Ticks_50uS
1179                     ; 591 			Ticks_1mS++;
1181  0323 be4d          	ldw	x,_Ticks_1mS
1182  0325 5c            	incw	x
1183  0326 bf4d          	ldw	_Ticks_1mS,x
1184  0328               L143:
1185                     ; 599 	if ( Drive.Ticks > 0 )
1187  0328 b63f          	ld	a,_Drive+17
1188  032a 2702          	jreq	L563
1189                     ; 600 		Drive.Ticks--;
1191  032c 3a3f          	dec	_Drive+17
1192  032e               L563:
1193                     ; 602 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
1195  032e 7201002e08    	btjf	_Drive,#0,L763
1197  0333 2606          	jrne	L763
1198                     ; 604 		DriveService();	
1200  0335 cd0474        	call	_DriveService
1202                     ; 605 		Drive.Ticks = Drive.Interval;
1204  0338 453e3f        	mov	_Drive+17,_Drive+16
1205  033b               L763:
1206                     ; 608 }
1209  033b 81            	ret	
1233                     ; 615 void StopDrive(void)			//TROff()
1233                     ; 616 {	
1234                     	switch	.text
1235  033c               _StopDrive:
1239                     ; 617 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1241  033c 4b80          	push	#128
1242  033e ae500a        	ldw	x,#20490
1243  0341 cd0000        	call	_GPIO_WriteLow
1245  0344 84            	pop	a
1246                     ; 618 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1248  0345 4b20          	push	#32
1249  0347 ae500a        	ldw	x,#20490
1250  034a cd0000        	call	_GPIO_WriteLow
1252  034d 84            	pop	a
1253                     ; 619 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1255  034e 4b40          	push	#64
1256  0350 ae500a        	ldw	x,#20490
1257  0353 cd0000        	call	_GPIO_WriteLow
1259  0356 84            	pop	a
1260                     ; 620 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1262  0357 4b04          	push	#4
1263  0359 ae5000        	ldw	x,#20480
1264  035c cd0000        	call	_GPIO_WriteLow
1266  035f 84            	pop	a
1267                     ; 621 }
1270  0360 81            	ret	
1315                     ; 627 void StartDriveOR( uint16_t Target, uint8_t overrun )
1315                     ; 628 {
1316                     	switch	.text
1317  0361               _StartDriveOR:
1319  0361 89            	pushw	x
1320       00000000      OFST:	set	0
1323                     ; 629 	if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
1325  0362 7203002e20    	btjf	_Drive,#1,L324
1326                     ; 631 		if ( Drive.Dir == 1 && Drive.Position < Target )			// same dir
1328  0367 7209002e04    	btjf	_Drive,#4,L524
1330  036c b32f          	cpw	x,_Drive+1
1331  036e 2217          	jrugt	L324
1333  0370               L524:
1334                     ; 635 		else if ( Drive.Dir == 0 && Drive.Position > Target )
1336  0370 7208002e0c    	btjt	_Drive,#4,L134
1338  0375 be2f          	ldw	x,_Drive+1
1339  0377 1301          	cpw	x,(OFST+1,sp)
1340  0379 2306          	jrule	L134
1341                     ; 637 			if ( Target == 0 )
1343  037b 1e01          	ldw	x,(OFST+1,sp)
1344  037d 2608          	jrne	L324
1345                     ; 638 				return;
1347  037f 2004          	jra	L061
1348  0381               L134:
1349                     ; 642 			Drive.Stop = 1;
1351  0381 7216002e      	bset	_Drive,#3
1352                     ; 643 			return;
1353  0385               L061:
1356  0385 85            	popw	x
1357  0386 81            	ret	
1358  0387               L324:
1359                     ; 650 	Drive.PreStep = Drive.Step;
1361  0387 454546        	mov	_Drive+24,_Drive+23
1362                     ; 653 	if ( Drive.Position == Target ) return;
1364  038a be2f          	ldw	x,_Drive+1
1365  038c 1301          	cpw	x,(OFST+1,sp)
1366  038e 27f5          	jreq	L061
1369                     ; 655 	if ( Target == 0 )				//  goto origin
1371  0390 1e01          	ldw	x,(OFST+1,sp)
1372  0392 260e          	jrne	L144
1373                     ; 657 		Drive.Overrun =	0u;
1375  0394 5f            	clrw	x
1376  0395 bf33          	ldw	_Drive+5,x
1377                     ; 658 		Drive.ZeroOffset = CPulse( OVER_STEP );
1379  0397 ae001e        	ldw	x,#30
1380  039a cd06ee        	call	_CPulse
1382  039d bf36          	ldw	_Drive+8,x
1383                     ; 661 		Drive.Target = 0u;
1385  039f 5f            	clrw	x
1386                     ; 662 		Drive.State = nMotorClose;		// 0;
1388  03a0 2013          	jp	LC009
1389  03a2               L144:
1390                     ; 667 		if (Drive.Position >= Target)		// Closing
1392  03a2 be2f          	ldw	x,_Drive+1
1393  03a4 1301          	cpw	x,(OFST+1,sp)
1394  03a6 2513          	jrult	L544
1395                     ; 669 			Drive.Dir = 0;
1397  03a8 7219002e      	bres	_Drive,#4
1398                     ; 670 			Drive.Overrun =	0u;
1400  03ac 5f            	clrw	x
1401  03ad bf33          	ldw	_Drive+5,x
1402                     ; 671 			Drive.State = nMotorClose;
1404  03af 3f3d          	clr	_Drive+15
1405                     ; 672 			Drive.Overrun2 = 0u;
1407  03b1 3f35          	clr	_Drive+7
1408                     ; 673 			Drive.Target = Target;
1410  03b3 1e01          	ldw	x,(OFST+1,sp)
1411                     ; 674 			Drive.State = nMotorClose;		// 0;
1413  03b5               LC009:
1414  03b5 bf31          	ldw	_Drive+3,x
1416  03b7 3f3d          	clr	_Drive+15
1418  03b9 201b          	jra	L344
1419  03bb               L544:
1420                     ; 678 			Drive.Dir = 1;
1422  03bb 7218002e      	bset	_Drive,#4
1423                     ; 679 			Drive.State = nMotorOpen;	//1;
1425  03bf 3501003d      	mov	_Drive+15,#1
1426                     ; 680 			Drive.Overrun2 = overrun;		//100;
1428  03c3 7b05          	ld	a,(OFST+5,sp)
1429  03c5 b735          	ld	_Drive+7,a
1430                     ; 681 			Drive.Target = Target + overrun;	//100;	
1432  03c7 7b01          	ld	a,(OFST+1,sp)
1433  03c9 97            	ld	xl,a
1434  03ca 7b02          	ld	a,(OFST+2,sp)
1435  03cc 1b05          	add	a,(OFST+5,sp)
1436  03ce 2401          	jrnc	L651
1437  03d0 5c            	incw	x
1438  03d1               L651:
1439  03d1 b732          	ld	_Drive+4,a
1440  03d3 9f            	ld	a,xl
1441  03d4 b731          	ld	_Drive+3,a
1442  03d6               L344:
1443                     ; 685 	Drive.Run = TRUE;
1445  03d6 7212002e      	bset	_Drive,#1
1446                     ; 686 	Drive.Ticks = Drive.Interval;
1448  03da 453e3f        	mov	_Drive+17,_Drive+16
1449                     ; 687 }
1451  03dd 20a6          	jra	L061
1511                     ; 693 void MotorStep(MOTOR_DIR Dir)
1511                     ; 694 {
1512                     	switch	.text
1513  03df               _MotorStep:
1517                     ; 695 	if ( Dir == nMotorClose )
1519  03df 4d            	tnz	a
1520  03e0 2625          	jrne	L505
1521                     ; 697 		if ( Drive.Position != 0 ) 
1523  03e2 be2f          	ldw	x,_Drive+1
1524  03e4 270f          	jreq	LC010
1525                     ; 699 			Drive.Position--;
1527  03e6 5a            	decw	x
1528  03e7 bf2f          	ldw	_Drive+1,x
1529                     ; 700 			if ( Drive.NormalOpen )
1531  03e9 b644          	ld	a,_Drive+22
1532  03eb 2704          	jreq	L115
1533                     ; 701 				Drive.Phase++;   // NC
1535  03ed 3c38          	inc	_Drive+10
1537  03ef 2047          	jra	L125
1538  03f1               L115:
1539                     ; 704 				Drive.Phase--;	//NC
1541  03f1 3a38          	dec	_Drive+10
1542  03f3 2043          	jra	L125
1543                     ; 708 		if ( Drive.Position == 0 ) 
1545  03f5               LC010:
1546                     ; 711 			Drive.Overrun = 0u;
1548  03f5 5f            	clrw	x
1549  03f6 bf33          	ldw	_Drive+5,x
1550                     ; 712 			Drive.Run = FALSE;
1552  03f8 7213002e      	bres	_Drive,#1
1553                     ; 713 			Drive.ZeroOffset = 0u;
1555  03fc bf36          	ldw	_Drive+8,x
1556                     ; 714 			Drive.Position = 0u;
1558  03fe bf2f          	ldw	_Drive+1,x
1559                     ; 715 			Drive.Target = 0u;
1561  0400 bf31          	ldw	_Drive+3,x
1562                     ; 716 			StopDrive();	
1564  0402 cd033c        	call	_StopDrive
1566  0405 2031          	jra	L125
1567  0407               L505:
1568                     ; 722 			Drive.Position++;
1570  0407 be2f          	ldw	x,_Drive+1
1571  0409 5c            	incw	x
1572  040a bf2f          	ldw	_Drive+1,x
1573                     ; 724 		if ( Drive.NormalOpen )
1575  040c b644          	ld	a,_Drive+22
1576  040e 2704          	jreq	L325
1577                     ; 725 				Drive.Phase--;
1579  0410 3a38          	dec	_Drive+10
1581  0412 2002          	jra	L525
1582  0414               L325:
1583                     ; 727 				Drive.Phase++;
1585  0414 3c38          	inc	_Drive+10
1586  0416               L525:
1587                     ; 730 		if ( Drive.Origin ) 
1589  0416 b643          	ld	a,_Drive+21
1590  0418 2708          	jreq	L725
1591                     ; 732 			Drive.ORGPosition = Drive.Position;
1593  041a bf3b          	ldw	_Drive+13,x
1594                     ; 733 			Drive.LastOrigin = TRUE;
1596  041c 7214002e      	bset	_Drive,#2
1598  0420 2016          	jra	L125
1599  0422               L725:
1600                     ; 736 			if ( Drive.LastOrigin )
1602  0422 7205002e11    	btjf	_Drive,#2,L125
1603                     ; 738 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1605  0427 be3b          	ldw	x,_Drive+13
1606  0429 1d0028        	subw	x,#40
1607  042c bf39          	ldw	_Drive+11,x
1608                     ; 739 				if ( Drive.MaxOverrun > OVERRUN )
1610  042e a3012d        	cpw	x,#301
1611  0431 2505          	jrult	L125
1612                     ; 740 					Drive.MaxOverrun = OVERRUN;				
1614  0433 ae012c        	ldw	x,#300
1615  0436 bf39          	ldw	_Drive+11,x
1616  0438               L125:
1617                     ; 745 	if ( !Drive.Run ) return;
1619  0438 7202002e01    	btjt	_Drive,#1,L735
1623  043d 81            	ret	
1624  043e               L735:
1625                     ; 746 	if ( !Drive.Enabled ) return;
1627  043e 7200002e01    	btjt	_Drive,#0,L145
1631  0443 81            	ret	
1632  0444               L145:
1633                     ; 747 	switch ( Drive.ExcitationType )
1635  0444 b642          	ld	a,_Drive+20
1637                     ; 758 			break;
1638  0446 2707          	jreq	L154
1639  0448 4a            	dec	a
1640  0449 2707          	jreq	L354
1641  044b 4a            	dec	a
1642  044c 2707          	jreq	L554
1644  044e 81            	ret	
1645  044f               L154:
1646                     ; 750 		case 0:
1646                     ; 751 			Excitation_1Phase();	
1649                     ; 752 			break;
1652  044f cc0628        	jp	_Excitation_1Phase
1653  0452               L354:
1654                     ; 753 		case 1:
1654                     ; 754 			Excitation_12Phase();
1657                     ; 755 			break;
1660  0452 cc055f        	jp	_Excitation_12Phase
1661  0455               L554:
1662                     ; 756 		case 2:
1662                     ; 757 			Excitation_2Phase();
1665                     ; 758 			break;
1667                     ; 763 }
1670  0455 207a          	jp	_Excitation_2Phase
1696                     ; 768 void MotorClose(void)
1696                     ; 769 {
1697                     	switch	.text
1698  0457               _MotorClose:
1702                     ; 771 	if ( Drive.Origin )   		// Hall IC Sensing 
1704  0457 b643          	ld	a,_Drive+21
1705  0459 2715          	jreq	L755
1706                     ; 773 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1708  045b be33          	ldw	x,_Drive+5
1709  045d b339          	cpw	x,_Drive+11
1710  045f 250c          	jrult	L165
1711                     ; 775 			Drive.Target = 0u;
1713  0461 5f            	clrw	x
1714  0462 bf31          	ldw	_Drive+3,x
1715                     ; 776 			Drive.Position = 0u;
1717  0464 bf2f          	ldw	_Drive+1,x
1718                     ; 777 			Drive.Overrun = 0u;
1720  0466 bf33          	ldw	_Drive+5,x
1721                     ; 778 			Drive.ZeroOffset = 0u;
1723  0468 bf36          	ldw	_Drive+8,x
1724                     ; 782 			StopDrive();
1729  046a cc033c        	jp	_StopDrive
1730  046d               L165:
1731                     ; 786 			Drive.Overrun++;
1733  046d 5c            	incw	x
1734  046e bf33          	ldw	_Drive+5,x
1735                     ; 787 			MotorStep(nMotorClose);
1737  0470               L755:
1738                     ; 791 		MotorStep(nMotorClose);		// move 1 step close
1741  0470 4f            	clr	a
1743                     ; 792 }
1746  0471 cc03df        	jp	_MotorStep
1773                     ; 797 void DriveService(void)
1773                     ; 798 {
1774                     	switch	.text
1775  0474               _DriveService:
1777  0474 89            	pushw	x
1778       00000002      OFST:	set	2
1781                     ; 800 	if ( ! Drive.Run ) 
1783  0475 7202002e02    	btjt	_Drive,#1,L775
1784                     ; 803 		StopDrive();
1786                     ; 804 		return;	//when Drive is stop 
1788  047a 2050          	jp	LC012
1789  047c               L775:
1790                     ; 807 	if ( Drive.Stop )
1792  047c 7207002e08    	btjf	_Drive,#3,L106
1793                     ; 809 		Drive.Stop = 0;
1795  0481 7217002e      	bres	_Drive,#3
1796                     ; 810 		Drive.Target = Drive.Position ;
1798  0485 be2f          	ldw	x,_Drive+1
1799  0487 bf31          	ldw	_Drive+3,x
1800  0489               L106:
1801                     ; 813 	if ( Drive.Target > Drive.Position )
1803  0489 be31          	ldw	x,_Drive+3
1804  048b b32f          	cpw	x,_Drive+1
1805  048d 2307          	jrule	L306
1806                     ; 814 	 	MotorStep(nMotorOpen);
1808  048f a601          	ld	a,#1
1809  0491 cd03df        	call	_MotorStep
1812  0494 2039          	jra	L506
1813  0496               L306:
1814                     ; 815 	else if ( Drive.Target < Drive.Position )
1816  0496 b32f          	cpw	x,_Drive+1
1817  0498 2404          	jruge	L706
1818                     ; 816 		MotorClose( );
1820  049a adbb          	call	_MotorClose
1823  049c 2031          	jra	L506
1824  049e               L706:
1825                     ; 817 	else if ( Drive.Target ) 	// on target position
1827  049e be31          	ldw	x,_Drive+3
1828  04a0 2721          	jreq	L316
1829                     ; 819 			if ( Drive.Overrun2 )
1831  04a2 b635          	ld	a,_Drive+7
1832  04a4 270f          	jreq	L516
1833                     ; 821 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1835  04a6 5f            	clrw	x
1836  04a7 97            	ld	xl,a
1837  04a8 1f01          	ldw	(OFST-1,sp),x
1839  04aa be31          	ldw	x,_Drive+3
1840  04ac 72f001        	subw	x,(OFST-1,sp)
1841  04af bf31          	ldw	_Drive+3,x
1842                     ; 822 				Drive.Overrun2 = 0u;
1844  04b1 3f35          	clr	_Drive+7
1846  04b3 201a          	jra	L506
1847  04b5               L516:
1848                     ; 826 				Drive.ZeroOffset = 0u;
1850  04b5 5f            	clrw	x
1851  04b6 bf36          	ldw	_Drive+8,x
1852                     ; 827 				Drive.Overrun = 0u;
1854  04b8 bf33          	ldw	_Drive+5,x
1855                     ; 829 				StopDrive();	
1857  04ba cd033c        	call	_StopDrive
1859                     ; 830 				Drive.Run = FALSE;				
1861  04bd 7213002e      	bres	_Drive,#1
1862  04c1 200c          	jra	L506
1863  04c3               L316:
1864                     ; 836 			Drive.ZeroOffset = 0u;
1866  04c3 5f            	clrw	x
1867  04c4 bf36          	ldw	_Drive+8,x
1868                     ; 837 			Drive.Overrun = 0u;
1870  04c6 bf33          	ldw	_Drive+5,x
1871                     ; 838 			Drive.Run = FALSE;
1873  04c8 7213002e      	bres	_Drive,#1
1874                     ; 839 			StopDrive();	
1876  04cc               LC012:
1878  04cc cd033c        	call	_StopDrive
1880  04cf               L506:
1881                     ; 841 }
1884  04cf 85            	popw	x
1885  04d0 81            	ret	
1911                     ; 844 void Excitation_2Phase( void )
1911                     ; 845 {
1912                     	switch	.text
1913  04d1               _Excitation_2Phase:
1917                     ; 847 	switch (Drive.Phase%8)
1919  04d1 b638          	ld	a,_Drive+10
1920  04d3 a407          	and	a,#7
1922                     ; 879 		default:
1922                     ; 880 			break;
1923  04d5 2716          	jreq	L326
1924  04d7 4a            	dec	a
1925  04d8 2713          	jreq	L326
1926  04da 4a            	dec	a
1927  04db 271e          	jreq	L526
1928  04dd 4a            	dec	a
1929  04de 271b          	jreq	L526
1930  04e0 4a            	dec	a
1931  04e1 272f          	jreq	L726
1932  04e3 4a            	dec	a
1933  04e4 272c          	jreq	L726
1934  04e6 4a            	dec	a
1935  04e7 2737          	jreq	L136
1936  04e9 4a            	dec	a
1937  04ea 2734          	jreq	L136
1939  04ec 81            	ret	
1940  04ed               L326:
1941                     ; 849 		case 0:
1941                     ; 850 		case 1:
1941                     ; 851 		//case 1:
1941                     ; 852 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1943  04ed ad48          	call	LC016
1944                     ; 853 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1946  04ef ad5a          	call	LC018
1947                     ; 854 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1949  04f1 4b40          	push	#64
1950  04f3 ae500a        	ldw	x,#20490
1951  04f6 cd0000        	call	_GPIO_WriteLow
1953                     ; 855 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1955                     ; 856 			break;		
1957  04f9 200c          	jp	LC015
1958  04fb               L526:
1959                     ; 857 		case 2:
1959                     ; 858 		case 3:
1959                     ; 859 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1961  04fb ad44          	call	LC017
1962                     ; 860 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1964  04fd ad4c          	call	LC018
1965                     ; 861 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1967  04ff 4b40          	push	#64
1968  0501 ae500a        	ldw	x,#20490
1969  0504 cd0000        	call	_GPIO_WriteHigh
1971                     ; 862 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1973  0507               LC015:
1974  0507 84            	pop	a
1976  0508 4b04          	push	#4
1977  050a ae5000        	ldw	x,#20480
1978  050d cd0000        	call	_GPIO_WriteLow
1980                     ; 863 			break;
1982  0510 2023          	jp	LC013
1983  0512               L726:
1984                     ; 864 		case 4:
1984                     ; 865 		case 5:
1984                     ; 866 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1986  0512 ad2d          	call	LC017
1987                     ; 867 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1989  0514 ad3f          	call	LC019
1990                     ; 868 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1992  0516 4b40          	push	#64
1993  0518 ae500a        	ldw	x,#20490
1994  051b cd0000        	call	_GPIO_WriteHigh
1996                     ; 869 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1998                     ; 870 			break;
2000  051e 200c          	jp	LC014
2001  0520               L136:
2002                     ; 871 		case 6:
2002                     ; 872 		case 7:		
2002                     ; 873 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2004  0520 ad15          	call	LC016
2005                     ; 874 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2007  0522 ad31          	call	LC019
2008                     ; 875 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2010  0524 4b40          	push	#64
2011  0526 ae500a        	ldw	x,#20490
2012  0529 cd0000        	call	_GPIO_WriteLow
2014                     ; 876 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2016  052c               LC014:
2017  052c 84            	pop	a
2019  052d 4b04          	push	#4
2020  052f ae5000        	ldw	x,#20480
2021  0532 cd0000        	call	_GPIO_WriteHigh
2023  0535               LC013:
2024  0535 84            	pop	a
2025                     ; 877 			break;
2027                     ; 879 		default:
2027                     ; 880 			break;
2029                     ; 883 }
2032  0536 81            	ret	
2033  0537               LC016:
2034  0537 4b80          	push	#128
2035  0539 ae500a        	ldw	x,#20490
2036  053c cd0000        	call	_GPIO_WriteHigh
2038  053f 84            	pop	a
2039  0540 81            	ret	
2040  0541               LC017:
2041  0541 4b80          	push	#128
2042  0543 ae500a        	ldw	x,#20490
2043  0546 cd0000        	call	_GPIO_WriteLow
2045  0549 84            	pop	a
2046  054a 81            	ret	
2047  054b               LC018:
2048  054b 4b20          	push	#32
2049  054d ae500a        	ldw	x,#20490
2050  0550 cd0000        	call	_GPIO_WriteHigh
2052  0553 84            	pop	a
2053  0554 81            	ret	
2054  0555               LC019:
2055  0555 4b20          	push	#32
2056  0557 ae500a        	ldw	x,#20490
2057  055a cd0000        	call	_GPIO_WriteLow
2059  055d 84            	pop	a
2060  055e 81            	ret	
2086                     ; 886 void Excitation_12Phase( void )
2086                     ; 887 {
2087                     	switch	.text
2088  055f               _Excitation_12Phase:
2092                     ; 889 	switch (Drive.Phase%8)
2094  055f b638          	ld	a,_Drive+10
2095  0561 a407          	and	a,#7
2097                     ; 940 		default:
2097                     ; 941 			break;
2098  0563 2716          	jreq	L156
2099  0565 4a            	dec	a
2100  0566 271d          	jreq	L356
2101  0568 4a            	dec	a
2102  0569 272d          	jreq	L556
2103  056b 4a            	dec	a
2104  056c 273f          	jreq	L756
2105  056e 4a            	dec	a
2106  056f 2748          	jreq	L166
2107  0571 4a            	dec	a
2108  0572 2753          	jreq	L366
2109  0574 4a            	dec	a
2110  0575 276e          	jreq	L566
2111  0577 4a            	dec	a
2112  0578 2775          	jreq	L766
2114  057a 81            	ret	
2115  057b               L156:
2116                     ; 891 		case 0:
2116                     ; 892 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2118  057b 4b80          	push	#128
2119  057d ae500a        	ldw	x,#20490
2120  0580 cd0000        	call	_GPIO_WriteHigh
2122                     ; 893 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2124                     ; 894 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2126                     ; 895 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2128                     ; 896 			break;
2130  0583 2008          	jp	LC023
2131  0585               L356:
2132                     ; 897 		case 1:
2132                     ; 898 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2134  0585 4b80          	push	#128
2135  0587 ae500a        	ldw	x,#20490
2136  058a cd0000        	call	_GPIO_WriteLow
2138                     ; 899 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2140  058d               LC023:
2141  058d 84            	pop	a
2143  058e 4b20          	push	#32
2144  0590 ae500a        	ldw	x,#20490
2145  0593 cd0000        	call	_GPIO_WriteHigh
2147                     ; 900 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2149                     ; 901 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2151                     ; 902 			break;		
2153  0596 2068          	jp	LC022
2154  0598               L556:
2155                     ; 903 		case 2:
2155                     ; 904 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2157  0598 ad7a          	call	LC027
2158                     ; 905 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2160  059a 4b20          	push	#32
2161  059c ae500a        	ldw	x,#20490
2162  059f cd0000        	call	_GPIO_WriteHigh
2164                     ; 906 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2166  05a2               LC024:
2167  05a2 84            	pop	a
2169  05a3 4b40          	push	#64
2170  05a5 ae500a        	ldw	x,#20490
2171  05a8 cd0000        	call	_GPIO_WriteHigh
2173                     ; 907 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2175                     ; 908 			break;
2177  05ab 205c          	jp	LC021
2178  05ad               L756:
2179                     ; 909 		case 3:
2179                     ; 910 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2181  05ad ad65          	call	LC027
2182                     ; 911 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2184  05af 4b20          	push	#32
2185  05b1 ae500a        	ldw	x,#20490
2186  05b4 cd0000        	call	_GPIO_WriteLow
2188                     ; 912 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2190                     ; 913 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2192                     ; 914 			break;
2194  05b7 20e9          	jp	LC024
2195  05b9               L166:
2196                     ; 915 		case 4:
2196                     ; 916 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2198  05b9 ad59          	call	LC027
2199                     ; 917 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2201  05bb ad61          	call	LC028
2202                     ; 918 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2204  05bd 4b40          	push	#64
2205  05bf ae500a        	ldw	x,#20490
2206  05c2 cd0000        	call	_GPIO_WriteHigh
2208                     ; 919 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2210                     ; 920 			break;
2212  05c5 2013          	jp	LC025
2213  05c7               L366:
2214                     ; 921 		case 5: 
2214                     ; 922 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2216  05c7 4b80          	push	#128
2217  05c9 ae500a        	ldw	x,#20490
2218  05cc cd0000        	call	_GPIO_WriteLow
2220                     ; 923 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2223                     ; 924 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2225  05cf               LC026:
2226  05cf 84            	pop	a
2228  05d0 ad4c          	call	LC028
2230  05d2 4b40          	push	#64
2231  05d4 ae500a        	ldw	x,#20490
2232  05d7 cd0000        	call	_GPIO_WriteLow
2234                     ; 925 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2236  05da               LC025:
2237  05da 84            	pop	a
2240  05db 4b04          	push	#4
2241  05dd ae5000        	ldw	x,#20480
2242  05e0 cd0000        	call	_GPIO_WriteHigh
2244                     ; 926 			break;
2246  05e3 202d          	jp	LC020
2247  05e5               L566:
2248                     ; 927 		case 6:  
2248                     ; 928 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2250  05e5 4b80          	push	#128
2251  05e7 ae500a        	ldw	x,#20490
2252  05ea cd0000        	call	_GPIO_WriteHigh
2254                     ; 929 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2256                     ; 930 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2258                     ; 931 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2260                     ; 932 			break;
2262  05ed 20e0          	jp	LC026
2263  05ef               L766:
2264                     ; 933 		case 7:
2264                     ; 934 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2266  05ef 4b80          	push	#128
2267  05f1 ae500a        	ldw	x,#20490
2268  05f4 cd0000        	call	_GPIO_WriteHigh
2270  05f7 84            	pop	a
2271                     ; 935 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2273  05f8 4b20          	push	#32
2274  05fa ae500a        	ldw	x,#20490
2275  05fd cd0000        	call	_GPIO_WriteLow
2277                     ; 936 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2279  0600               LC022:
2280  0600 84            	pop	a
2283  0601 4b40          	push	#64
2284  0603 ae500a        	ldw	x,#20490
2285  0606 cd0000        	call	_GPIO_WriteLow
2287                     ; 937 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2289  0609               LC021:
2290  0609 84            	pop	a
2295  060a 4b04          	push	#4
2296  060c ae5000        	ldw	x,#20480
2297  060f cd0000        	call	_GPIO_WriteLow
2299  0612               LC020:
2300  0612 84            	pop	a
2301                     ; 938 			break;
2303                     ; 940 		default:
2303                     ; 941 			break;
2305                     ; 944 }
2308  0613 81            	ret	
2309  0614               LC027:
2310  0614 4b80          	push	#128
2311  0616 ae500a        	ldw	x,#20490
2312  0619 cd0000        	call	_GPIO_WriteLow
2314  061c 84            	pop	a
2315  061d 81            	ret	
2316  061e               LC028:
2317  061e 4b20          	push	#32
2318  0620 ae500a        	ldw	x,#20490
2319  0623 cd0000        	call	_GPIO_WriteLow
2321  0626 84            	pop	a
2322  0627 81            	ret	
2348                     ; 946 void Excitation_1Phase( void )
2348                     ; 947 {
2349                     	switch	.text
2350  0628               _Excitation_1Phase:
2354                     ; 950 	switch (Drive.Phase%8)
2356  0628 b638          	ld	a,_Drive+10
2357  062a a407          	and	a,#7
2359                     ; 981 		default:
2359                     ; 982 			break;
2360  062c 2716          	jreq	L707
2361  062e 4a            	dec	a
2362  062f 2713          	jreq	L707
2363  0631 4a            	dec	a
2364  0632 2723          	jreq	L117
2365  0634 4a            	dec	a
2366  0635 2720          	jreq	L117
2367  0637 4a            	dec	a
2368  0638 273b          	jreq	L317
2369  063a 4a            	dec	a
2370  063b 2738          	jreq	L317
2371  063d 4a            	dec	a
2372  063e 2741          	jreq	L517
2373  0640 4a            	dec	a
2374  0641 273e          	jreq	L517
2376  0643 81            	ret	
2377  0644               L707:
2378                     ; 952 		case 0:
2378                     ; 953 		case 1:
2378                     ; 954 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2380  0644 4b80          	push	#128
2381  0646 ae500a        	ldw	x,#20490
2382  0649 cd0000        	call	_GPIO_WriteHigh
2384  064c 84            	pop	a
2385                     ; 955 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2387  064d 4b20          	push	#32
2388  064f ae500a        	ldw	x,#20490
2389  0652 cd0000        	call	_GPIO_WriteLow
2391                     ; 956 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2393                     ; 957 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2395                     ; 958 			break;		
2397  0655 200a          	jp	LC031
2398  0657               L117:
2399                     ; 959 		case 2:
2399                     ; 960 		case 3:
2399                     ; 961 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2401  0657 ad49          	call	LC033
2402                     ; 962 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2404  0659 4b20          	push	#32
2405  065b ae500a        	ldw	x,#20490
2406  065e cd0000        	call	_GPIO_WriteHigh
2408                     ; 963 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2410  0661               LC031:
2411  0661 84            	pop	a
2413  0662 4b40          	push	#64
2414  0664 ae500a        	ldw	x,#20490
2415  0667 cd0000        	call	_GPIO_WriteLow
2417                     ; 964 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2419  066a               LC030:
2420  066a 84            	pop	a
2423  066b 4b04          	push	#4
2424  066d ae5000        	ldw	x,#20480
2425  0670 cd0000        	call	_GPIO_WriteLow
2427                     ; 965 			break;
2429  0673 201f          	jp	LC029
2430  0675               L317:
2431                     ; 966 		case 4:
2431                     ; 967 		case 5:
2431                     ; 968 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2433  0675 ad1f          	call	LC032
2434                     ; 970 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2436  0677 4b40          	push	#64
2437  0679 ae500a        	ldw	x,#20490
2438  067c cd0000        	call	_GPIO_WriteHigh
2440                     ; 971 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2442                     ; 972 			break;
2444  067f 20e9          	jp	LC030
2445  0681               L517:
2446                     ; 973 		case 6:
2446                     ; 974 		case 7:
2446                     ; 975 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2448  0681 ad13          	call	LC032
2449                     ; 977 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2451  0683 4b40          	push	#64
2452  0685 ae500a        	ldw	x,#20490
2453  0688 cd0000        	call	_GPIO_WriteLow
2455  068b 84            	pop	a
2456                     ; 978 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2458  068c 4b04          	push	#4
2459  068e ae5000        	ldw	x,#20480
2460  0691 cd0000        	call	_GPIO_WriteHigh
2462  0694               LC029:
2463  0694 84            	pop	a
2464                     ; 979 			break;
2466                     ; 981 		default:
2466                     ; 982 			break;
2468                     ; 985 }
2471  0695 81            	ret	
2472  0696               LC032:
2473  0696 ad0a          	call	LC033
2474                     ; 969 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2476  0698 4b20          	push	#32
2477  069a ae500a        	ldw	x,#20490
2478  069d cd0000        	call	_GPIO_WriteLow
2480  06a0 84            	pop	a
2481  06a1 81            	ret	
2482  06a2               LC033:
2483  06a2 4b80          	push	#128
2484  06a4 ae500a        	ldw	x,#20490
2485  06a7 cd0000        	call	_GPIO_WriteLow
2487  06aa 84            	pop	a
2488  06ab 81            	ret	
2523                     ; 988 u8 Interval( u16 Vmon)
2523                     ; 989 {
2524                     	switch	.text
2525  06ac               _Interval:
2527  06ac 89            	pushw	x
2528       00000000      OFST:	set	0
2531                     ; 990 	Vmon = Vmon / IntervalSlope;
2533  06ad a61c          	ld	a,#28
2534  06af 62            	div	x,a
2535                     ; 992 	if (Vmon < 10 ) Vmon = 10;
2537  06b0 a3000a        	cpw	x,#10
2538  06b3 2403          	jruge	L357
2541  06b5 ae000a        	ldw	x,#10
2542  06b8               L357:
2543                     ; 993 	if (Vmon > 26 ) Vmon = 26;
2545  06b8 a3001b        	cpw	x,#27
2546  06bb 2503          	jrult	L557
2549  06bd ae001a        	ldw	x,#26
2550  06c0               L557:
2551                     ; 995 	return ( TableInterval[ Vmon-10 ] );
2553  06c0 1d000a        	subw	x,#10
2554  06c3 e602          	ld	a,(_TableInterval,x)
2557  06c5 85            	popw	x
2558  06c6 81            	ret	
2602                     .const:	section	.text
2603  0000               L434:
2604  0000 00000064      	dc.l	100
2605                     ; 1010 uint16_t CStep( uint16_t pulse )
2605                     ; 1011 {
2606                     	switch	.text
2607  06c7               _CStep:
2609  06c7 5204          	subw	sp,#4
2610       00000004      OFST:	set	4
2613                     ; 1015 	i = (uint32_t) pulse * My.GearRatio100 ;
2615  06c9 90be2b        	ldw	y,_My+12
2616  06cc cd0000        	call	c_umul
2618  06cf 96            	ldw	x,sp
2619  06d0 5c            	incw	x
2620  06d1 cd0000        	call	c_rtol
2623                     ; 1016 	i = (i+1)/100;   				// Round up  20150925
2625  06d4 96            	ldw	x,sp
2626  06d5 5c            	incw	x
2627  06d6 cd0000        	call	c_ltor
2629  06d9 a601          	ld	a,#1
2630  06db cd0000        	call	c_ladc
2632  06de ae0000        	ldw	x,#L434
2633  06e1 cd0000        	call	c_ludv
2635  06e4 96            	ldw	x,sp
2636  06e5 5c            	incw	x
2637  06e6 cd0000        	call	c_rtol
2640                     ; 1017 	return (uint16_t) i;
2642  06e9 1e03          	ldw	x,(OFST-1,sp)
2645  06eb 5b04          	addw	sp,#4
2646  06ed 81            	ret	
2690                     ; 1021 uint16_t CPulse( uint16_t step )
2690                     ; 1022 {
2691                     	switch	.text
2692  06ee               _CPulse:
2694  06ee 5204          	subw	sp,#4
2695       00000004      OFST:	set	4
2698                     ; 1031 	i = (uint32_t) step * My.GearRatio100 ;
2700  06f0 90be2b        	ldw	y,_My+12
2701  06f3 cd0000        	call	c_umul
2703  06f6 96            	ldw	x,sp
2704  06f7 5c            	incw	x
2705  06f8 cd0000        	call	c_rtol
2708                     ; 1032 	i = (i+1)/100;   			
2710  06fb 96            	ldw	x,sp
2711  06fc 5c            	incw	x
2712  06fd cd0000        	call	c_ltor
2714  0700 a601          	ld	a,#1
2715  0702 cd0000        	call	c_ladc
2717  0705 ae0000        	ldw	x,#L434
2718  0708 cd0000        	call	c_ludv
2720  070b 96            	ldw	x,sp
2721  070c 5c            	incw	x
2722  070d cd0000        	call	c_rtol
2725                     ; 1034 	return (uint16_t) i;
2727  0710 1e03          	ldw	x,(OFST-1,sp)
2730  0712 5b04          	addw	sp,#4
2731  0714 81            	ret	
2760                     ; 1045 void Clock_Config(void)
2760                     ; 1046 {
2761                     	switch	.text
2762  0715               _Clock_Config:
2766                     ; 1048 	CLK_DeInit();
2768  0715 cd0000        	call	_CLK_DeInit
2770                     ; 1049 	CLK_HSICmd(ENABLE);
2772  0718 a601          	ld	a,#1
2773  071a cd0000        	call	_CLK_HSICmd
2775                     ; 1050 	CLK_LSICmd(DISABLE);
2777  071d 4f            	clr	a
2778  071e cd0000        	call	_CLK_LSICmd
2780                     ; 1051 	CLK_HSECmd(DISABLE);
2782  0721 4f            	clr	a
2783  0722 cd0000        	call	_CLK_HSECmd
2785                     ; 1053 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2787  0725 4f            	clr	a
2788  0726 cd0000        	call	_CLK_HSIPrescalerConfig
2790                     ; 1054 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2792  0729 a680          	ld	a,#128
2794                     ; 1055 }
2797  072b cc0000        	jp	_CLK_SYSCLKConfig
2823                     ; 1058 void Gpio_Config(void)
2823                     ; 1059 {
2824                     	switch	.text
2825  072e               _Gpio_Config:
2829                     ; 1061   GPIO_Init(_LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2831  072e 4be0          	push	#224
2832  0730 4b10          	push	#16
2833  0732 ae5005        	ldw	x,#20485
2834  0735 cd0000        	call	_GPIO_Init
2836  0738 85            	popw	x
2837                     ; 1062 	GPIO_WriteHigh(_LED_PORT, _LED_PIN);
2839  0739 4b10          	push	#16
2840  073b ae5005        	ldw	x,#20485
2841  073e cd0000        	call	_GPIO_WriteHigh
2843  0741 84            	pop	a
2844                     ; 1065 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2846  0742 4be0          	push	#224
2847  0744 4b80          	push	#128
2848  0746 ae500a        	ldw	x,#20490
2849  0749 cd0000        	call	_GPIO_Init
2851  074c 85            	popw	x
2852                     ; 1066 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2854  074d 4be0          	push	#224
2855  074f 4b40          	push	#64
2856  0751 ae500a        	ldw	x,#20490
2857  0754 cd0000        	call	_GPIO_Init
2859  0757 85            	popw	x
2860                     ; 1067 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2862  0758 4be0          	push	#224
2863  075a 4b20          	push	#32
2864  075c ae500a        	ldw	x,#20490
2865  075f cd0000        	call	_GPIO_Init
2867  0762 85            	popw	x
2868                     ; 1068 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2870  0763 4be0          	push	#224
2871  0765 4b04          	push	#4
2872  0767 ae5000        	ldw	x,#20480
2873  076a cd0000        	call	_GPIO_Init
2875  076d 85            	popw	x
2876                     ; 1070 	GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2878  076e 4b80          	push	#128
2879  0770 ae500a        	ldw	x,#20490
2880  0773 cd0000        	call	_GPIO_WriteHigh
2882  0776 84            	pop	a
2883                     ; 1071 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2885  0777 4b80          	push	#128
2886  0779 ae500a        	ldw	x,#20490
2887  077c cd0000        	call	_GPIO_WriteLow
2889  077f 84            	pop	a
2890                     ; 1073 	GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2892  0780 4b20          	push	#32
2893  0782 ae500a        	ldw	x,#20490
2894  0785 cd0000        	call	_GPIO_WriteHigh
2896  0788 84            	pop	a
2897                     ; 1074 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2899  0789 4b20          	push	#32
2900  078b ae500a        	ldw	x,#20490
2901  078e cd0000        	call	_GPIO_WriteLow
2903  0791 84            	pop	a
2904                     ; 1076 	GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2906  0792 4b40          	push	#64
2907  0794 ae500a        	ldw	x,#20490
2908  0797 cd0000        	call	_GPIO_WriteHigh
2910  079a 84            	pop	a
2911                     ; 1077 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2913  079b 4b40          	push	#64
2914  079d ae500a        	ldw	x,#20490
2915  07a0 cd0000        	call	_GPIO_WriteLow
2917  07a3 84            	pop	a
2918                     ; 1079 	GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);		
2920  07a4 4b04          	push	#4
2921  07a6 ae5000        	ldw	x,#20480
2922  07a9 cd0000        	call	_GPIO_WriteHigh
2924  07ac 84            	pop	a
2925                     ; 1080 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2927  07ad 4b04          	push	#4
2928  07af ae5000        	ldw	x,#20480
2929  07b2 cd0000        	call	_GPIO_WriteLow
2931  07b5 84            	pop	a
2932                     ; 1083   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2934  07b6 4b00          	push	#0
2935  07b8 4b02          	push	#2
2936  07ba ae5000        	ldw	x,#20480
2937  07bd cd0000        	call	_GPIO_Init
2939  07c0 85            	popw	x
2940                     ; 1089 	GPIO_Init(_CHARGE_ON_PORT, _CHARGE_ON_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2942  07c1 4be0          	push	#224
2943  07c3 4b10          	push	#16
2944  07c5 ae500f        	ldw	x,#20495
2945  07c8 cd0000        	call	_GPIO_Init
2947  07cb 85            	popw	x
2948                     ; 1092 	GPIO_Init(_BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN, GPIO_MODE_OUT_PP_LOW_FAST);		
2950  07cc 4be0          	push	#224
2951  07ce 4b08          	push	#8
2952  07d0 ae5000        	ldw	x,#20480
2953  07d3 cd0000        	call	_GPIO_Init
2955  07d6 85            	popw	x
2956                     ; 1097 	GPIO_Init( _ADJ_MO_PORT , _ADJ_MO_PIN , GPIO_MODE_IN_FL_NO_IT );
2958  07d7 4b00          	push	#0
2959  07d9 4b10          	push	#16
2960  07db ae500a        	ldw	x,#20490
2961  07de cd0000        	call	_GPIO_Init
2963  07e1 85            	popw	x
2964                     ; 1099 	GPIO_Init( _BAT_MO_PORT , _BAT_MO_PIN, GPIO_MODE_IN_FL_NO_IT );
2966  07e2 ad2f          	call	LC034
2967                     ; 1101 	GPIO_Init( _BOOST_MO_PORT , _BOOST_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2969  07e4 ad2d          	call	LC034
2970                     ; 1103   GPIO_Init( _POWER_MO_PORT , _POWER_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2972  07e6 4b00          	push	#0
2973  07e8 4b20          	push	#32
2974  07ea ae500f        	ldw	x,#20495
2975  07ed cd0000        	call	_GPIO_Init
2977  07f0 85            	popw	x
2978                     ; 1105 	GPIO_Init( _ISENSE_PORT , _ISENSE_PIN  , GPIO_MODE_IN_FL_NO_IT );
2980  07f1 4b00          	push	#0
2981  07f3 4b04          	push	#4
2982  07f5 ae500f        	ldw	x,#20495
2983  07f8 cd0000        	call	_GPIO_Init
2985  07fb 85            	popw	x
2986                     ; 1111 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
2988  07fc 4b00          	push	#0
2989  07fe 4b20          	push	#32
2990  0800 ae5005        	ldw	x,#20485
2991  0803 cd0000        	call	_GPIO_Init
2993  0806 85            	popw	x
2994                     ; 1112 	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
2996  0807 4b00          	push	#0
2997  0809 4b08          	push	#8
2998  080b ae500a        	ldw	x,#20490
2999  080e cd0000        	call	_GPIO_Init
3001  0811 85            	popw	x
3002                     ; 1114 }
3005  0812 81            	ret	
3006  0813               LC034:
3007  0813 4b00          	push	#0
3008  0815 4b08          	push	#8
3009  0817 ae500f        	ldw	x,#20495
3010  081a cd0000        	call	_GPIO_Init
3012  081d 85            	popw	x
3013  081e 81            	ret	
3040                     ; 1118 void Timer4_Config(void)
3040                     ; 1119 {
3041                     	switch	.text
3042  081f               L5_Timer4_Config:
3046                     ; 1120   TIM4_DeInit();
3048  081f cd0000        	call	_TIM4_DeInit
3050                     ; 1126 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
3052  0822 ae0432        	ldw	x,#1074
3053  0825 cd0000        	call	_TIM4_TimeBaseInit
3055                     ; 1130   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
3057  0828 ae0101        	ldw	x,#257
3058  082b cd0000        	call	_TIM4_ITConfig
3060                     ; 1133   TIM4_Cmd(ENABLE);
3062  082e a601          	ld	a,#1
3064                     ; 1134 }
3067  0830 cc0000        	jp	_TIM4_Cmd
3095                     ; 1137 static void Adc_Config( void )
3095                     ; 1138 {
3096                     	switch	.text
3097  0833               L3_Adc_Config:
3101                     ; 1140 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
3103  0833 cd0000        	call	_ADC1_GetConversionValue
3105  0836 b615          	ld	a,_Adc+10
3106  0838 905f          	clrw	y
3107  083a 9097          	ld	yl,a
3108  083c 9058          	sllw	y
3109  083e 90ef0b        	ldw	(_Adc,y),x
3110                     ; 1142 	ADC1_DeInit( );
3112  0841 cd0000        	call	_ADC1_DeInit
3114                     ; 1144 	switch (Adc.Idx)
3116  0844 b615          	ld	a,_Adc+10
3118                     ; 1178 			break;
3119  0846 270e          	jreq	L3501
3120  0848 4a            	dec	a
3121  0849 2725          	jreq	L5501
3122  084b 4a            	dec	a
3123  084c 273c          	jreq	L7501
3124  084e 4a            	dec	a
3125  084f 2753          	jreq	L1601
3126  0851 4a            	dec	a
3127  0852 276a          	jreq	L3601
3128                     ; 1176 		default:
3128                     ; 1177 			Adc.Idx = 0;
3129                     ; 1178 			break;
3131  0854 207c          	jp	LC035
3132  0856               L3501:
3133                     ; 1146 		case 0:
3133                     ; 1147 		  
3133                     ; 1148 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
3133                     ; 1149 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
3135  0856 4b00          	push	#0
3136  0858 4b03          	push	#3
3137  085a 4b08          	push	#8
3138  085c 4b00          	push	#0
3139  085e 4b00          	push	#0
3140  0860 4b00          	push	#0
3141  0862 ae0003        	ldw	x,#3
3142  0865 cd0000        	call	_ADC1_Init
3144  0868 5b06          	addw	sp,#6
3145                     ; 1150 			Adc.Idx = 1;
3147  086a 35010015      	mov	_Adc+10,#1
3148                     ; 1151 			break;
3150  086e 2064          	jra	L1011
3151  0870               L5501:
3152                     ; 1152 		case 1:
3152                     ; 1153 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
3152                     ; 1154 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
3154  0870 4b00          	push	#0
3155  0872 4b04          	push	#4
3156  0874 4b08          	push	#8
3157  0876 4b00          	push	#0
3158  0878 4b00          	push	#0
3159  087a 4b00          	push	#0
3160  087c ae0004        	ldw	x,#4
3161  087f cd0000        	call	_ADC1_Init
3163  0882 5b06          	addw	sp,#6
3164                     ; 1155 			Adc.Idx = 2;
3166  0884 35020015      	mov	_Adc+10,#2
3167                     ; 1156 			break;
3169  0888 204a          	jra	L1011
3170  088a               L7501:
3171                     ; 1158 		case 2:
3171                     ; 1159 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_5, ADC1_PRESSEL_FCPU_D2, 
3171                     ; 1160 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3173  088a 4b00          	push	#0
3174  088c 4b02          	push	#2
3175  088e 4b08          	push	#8
3176  0890 4b00          	push	#0
3177  0892 4b00          	push	#0
3178  0894 4b00          	push	#0
3179  0896 ae0005        	ldw	x,#5
3180  0899 cd0000        	call	_ADC1_Init
3182  089c 5b06          	addw	sp,#6
3183                     ; 1161 			Adc.Idx = 3;
3185  089e 35030015      	mov	_Adc+10,#3
3186                     ; 1162 			break;
3188  08a2 2030          	jra	L1011
3189  08a4               L1601:
3190                     ; 1164 		case 3:
3190                     ; 1165 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_6, ADC1_PRESSEL_FCPU_D2, 
3190                     ; 1166 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3192  08a4 4b00          	push	#0
3193  08a6 4b02          	push	#2
3194  08a8 4b08          	push	#8
3195  08aa 4b00          	push	#0
3196  08ac 4b00          	push	#0
3197  08ae 4b00          	push	#0
3198  08b0 ae0006        	ldw	x,#6
3199  08b3 cd0000        	call	_ADC1_Init
3201  08b6 5b06          	addw	sp,#6
3202                     ; 1167 			Adc.Idx = 4;
3204  08b8 35040015      	mov	_Adc+10,#4
3205                     ; 1168 			break;	
3207  08bc 2016          	jra	L1011
3208  08be               L3601:
3209                     ; 1170 		case 4:
3209                     ; 1171 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
3209                     ; 1172 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3211  08be 4b00          	push	#0
3212  08c0 4b02          	push	#2
3213  08c2 4b08          	push	#8
3214  08c4 4b00          	push	#0
3215  08c6 4b00          	push	#0
3216  08c8 4b00          	push	#0
3217  08ca ae0002        	ldw	x,#2
3218  08cd cd0000        	call	_ADC1_Init
3220  08d0 5b06          	addw	sp,#6
3221                     ; 1173 			Adc.Idx = 0;
3223  08d2               LC035:
3225  08d2 3f15          	clr	_Adc+10
3226                     ; 1174 			break;	
3228  08d4               L1011:
3229                     ; 1181 		ADC1_StartConversion();		
3232                     ; 1182 }
3235  08d4 cc0000        	jp	_ADC1_StartConversion
3279                     ; 1197 void assert_failed(u8* file, u32 line)
3279                     ; 1198 {
3280                     	switch	.text
3281  08d7               _assert_failed:
3283  08d7 88            	push	a
3284       00000001      OFST:	set	1
3287  08d8               L5211:
3288                     ; 1207 	i = i++;
3290  08d8 0c01          	inc	(OFST+0,sp)
3292  08da 6b01          	ld	(OFST+0,sp),a
3295  08dc 20fa          	jra	L5211
3824                     	xdef	_MotorClose
3825                     	xdef	_MotorStep
3826                     	xdef	_StopDrive
3827                     	xdef	_OnTimer_1mS
3828                     	xdef	_OnTimer_1S
3829                     	xdef	_main
3830                     	xdef	_MotorService
3831                     	xdef	_AdcService
3832                     	xdef	_LedService
3833                     	xdef	_SAbs
3834                     	xdef	_Diff
3835                     	xdef	_Gpio_Config
3836                     	xdef	_Clock_Config
3837                     	xdef	_OnTimer4
3838                     	xdef	_Interval
3839                     	xdef	_StartDriveOR
3840                     	xdef	_DriveService
3841                     	xdef	_Excitation_2Phase
3842                     	xdef	_Excitation_12Phase
3843                     	xdef	_Excitation_1Phase
3844                     	xdef	_CPulse
3845                     	xdef	_CStep
3846                     	xdef	_PowerDelay_1mS
3847                     	switch	.ubsct
3848  0000               _Timer:
3849  0000 000000000000  	ds.b	11
3850                     	xdef	_Timer
3851  000b               _Adc:
3852  000b 000000000000  	ds.b	20
3853                     	xdef	_Adc
3854  001f               _My:
3855  001f 000000000000  	ds.b	15
3856                     	xdef	_My
3857  002e               _Drive:
3858  002e 000000000000  	ds.b	27
3859                     	xdef	_Drive
3860                     	xdef	_TableInterval
3861  0049               _ledint:
3862  0049 0000          	ds.b	2
3863                     	xdef	_ledint
3864  004b               _Ticks_S:
3865  004b 0000          	ds.b	2
3866                     	xdef	_Ticks_S
3867  004d               _Ticks_1mS:
3868  004d 0000          	ds.b	2
3869                     	xdef	_Ticks_1mS
3870  004f               _Ticks_50uS:
3871  004f 00            	ds.b	1
3872                     	xdef	_Ticks_50uS
3873                     	xdef	_PeriodNumber
3874  0050               _Counter:
3875  0050 0000          	ds.b	2
3876                     	xdef	_Counter
3877                     	xdef	_assert_failed
3878                     	xref	_TIM4_ITConfig
3879                     	xref	_TIM4_Cmd
3880                     	xref	_TIM4_TimeBaseInit
3881                     	xref	_TIM4_DeInit
3882                     	xref	_GPIO_ReadInputPin
3883                     	xref	_GPIO_WriteReverse
3884                     	xref	_GPIO_WriteLow
3885                     	xref	_GPIO_WriteHigh
3886                     	xref	_GPIO_Init
3887                     	xref	_CLK_SYSCLKConfig
3888                     	xref	_CLK_HSIPrescalerConfig
3889                     	xref	_CLK_LSICmd
3890                     	xref	_CLK_HSICmd
3891                     	xref	_CLK_HSECmd
3892                     	xref	_CLK_DeInit
3893                     	xref	_ADC1_GetConversionValue
3894                     	xref	_ADC1_StartConversion
3895                     	xref	_ADC1_Init
3896                     	xref	_ADC1_DeInit
3897                     	xref.b	c_lreg
3898                     	xref.b	c_x
3899                     	xref.b	c_y
3919                     	xref	c_ludv
3920                     	xref	c_ladc
3921                     	xref	c_umul
3922                     	xref	c_ladd
3923                     	xref	c_lsub
3924                     	xref	c_ltor
3925                     	xref	c_lcmp
3926                     	xref	c_rtol
3927                     	xref	c_uitolx
3928                     	xref	c_imul
3929                     	end
