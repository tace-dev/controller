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
 124  000b cd0718        	call	_Clock_Config
 126                     ; 232 	Gpio_Config();
 128  000e cd0731        	call	_Gpio_Config
 130                     ; 234 	Timer4_Config();
 132  0011 cd0822        	call	L5_Timer4_Config
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
 149  001f cd0836        	call	L3_Adc_Config
 151                     ; 246 	Drive.NormalOpen = 1;
 153  0022 35010044      	mov	_Drive+22,#1
 154                     ; 247 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 156  0026 ae012c        	ldw	x,#300
 157  0029 bf39          	ldw	_Drive+11,x
 158                     ; 249 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 160  002b bf40          	ldw	_Drive+18,x
 161                     ; 252 	Drive.ExcitationType = 0;		//	2 excition
 163  002d 3f42          	clr	_Drive+20
 164                     ; 255 	Drive.Interval = 16u;			//	20180225
 166  002f 3510003e      	mov	_Drive+16,#16
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
 271  009d cd06f1        	call	_CPulse
 273  00a0 bf2f          	ldw	_Drive+1,x
 274                     ; 325 						Drive.ExcitationType = 0;		//	1 excition
 276  00a2 3f42          	clr	_Drive+20
 277                     ; 326 						Drive.Interval = 16u;			//	20180225
 279  00a4 3510003e      	mov	_Drive+16,#16
 280                     ; 327 						StartDriveOR( 0u, 0u  );				// Goto Zero position
 282  00a8 4b00          	push	#0
 283  00aa 5f            	clrw	x
 284  00ab cd0364        	call	_StartDriveOR
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
 495  0171 cd06f1        	call	_CPulse
 497  0174 cd0364        	call	_StartDriveOR
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
 525  0184 cd06f1        	call	_CPulse
 526  0187 cd0364        	call	_StartDriveOR
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
1008                     ; 540 OnTimer_1mS(void)
1008                     ; 541 { 	
1009                     	switch	.text
1010  029a               _OnTimer_1mS:
1014                     ; 542 	Ticks_1mS++;
1016  029a be4d          	ldw	x,_Ticks_1mS
1017  029c 5c            	incw	x
1018  029d bf4d          	ldw	_Ticks_1mS,x
1019                     ; 544 	Adc_Config( );
1021  029f cd0836        	call	L3_Adc_Config
1023                     ; 546 	if ( PowerDelay_1mS )
1025  02a2 b613          	ld	a,_PowerDelay_1mS
1026  02a4 2702          	jreq	L713
1027                     ; 547 		PowerDelay_1mS--;
1029  02a6 3a13          	dec	_PowerDelay_1mS
1030  02a8               L713:
1031                     ; 548 }
1034  02a8 81            	ret	
1067                     ; 551 void OnTimer4(void)
1067                     ; 552 {
1068                     	switch	.text
1069  02a9               _OnTimer4:
1073                     ; 553 	Ticks_50uS++;
1075  02a9 3c4f          	inc	_Ticks_50uS
1076                     ; 555 	Adc_Config( );
1078  02ab cd0836        	call	L3_Adc_Config
1080                     ; 557 	if ( My.BoostEnable == 0 && Adc.Value[3] < 20 )	//		Power off
1082  02ae 7200002d0d    	btjt	_My+14,#0,L133
1084  02b3 be11          	ldw	x,_Adc+6
1085  02b5 a30014        	cpw	x,#20
1086  02b8 2406          	jruge	L133
1087                     ; 560 		My.BoostEnable = 1;
1089  02ba 7210002d      	bset	_My+14,#0
1091  02be 2010          	jra	L333
1092  02c0               L133:
1093                     ; 562 	else if ( My.BoostEnable == 1 &&  Adc.Value[3] >800 )
1095  02c0 7201002d0b    	btjf	_My+14,#0,L333
1097  02c5 be11          	ldw	x,_Adc+6
1098  02c7 a30321        	cpw	x,#801
1099  02ca 2504          	jrult	L333
1100                     ; 565 		My.BoostEnable = 0;
1102  02cc 7211002d      	bres	_My+14,#0
1103  02d0               L333:
1104                     ; 569 	if ( Ticks_50uS == 5 )
1106  02d0 b64f          	ld	a,_Ticks_50uS
1107  02d2 a105          	cp	a,#5
1108  02d4 2615          	jrne	L733
1109                     ; 570 		Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
1111  02d6 4b02          	push	#2
1112  02d8 ae5000        	ldw	x,#20480
1113  02db cd0000        	call	_GPIO_ReadInputPin
1115  02de 5b01          	addw	sp,#1
1116  02e0 4d            	tnz	a
1117  02e1 2603          	jrne	L221
1118  02e3 4c            	inc	a
1119  02e4 2001          	jra	L621
1120  02e6               L221:
1121  02e6 4f            	clr	a
1122  02e7               L621:
1123  02e7 b743          	ld	_Drive+21,a
1125  02e9 2040          	jra	L143
1126  02eb               L733:
1127                     ; 572 		if ( Ticks_50uS == 10 )
1129  02eb a10a          	cp	a,#10
1130  02ed 2613          	jrne	L343
1131                     ; 573 		{	if ( My.ChargeOn ) 
1133  02ef 7203002d07    	btjf	_My+14,#1,L543
1134                     ; 574 				GPIO_WriteHigh( _CHARGE_ON_PORT, _CHARGE_ON_PIN ); 
1136  02f4 4b10          	push	#16
1137  02f6 ae500f        	ldw	x,#20495
1140  02f9 2015          	jp	LC008
1141  02fb               L543:
1142                     ; 576 				GPIO_WriteLow( _CHARGE_ON_PORT, _CHARGE_ON_PIN );
1144  02fb 4b10          	push	#16
1145  02fd ae500f        	ldw	x,#20495
1147  0300 2018          	jp	LC007
1148  0302               L343:
1149                     ; 579 		if ( Ticks_50uS == 15 )
1151  0302 a10f          	cp	a,#15
1152  0304 261a          	jrne	L353
1153                     ; 581 			if ( My.BoostEnable ) 
1155  0306 7201002d0a    	btjf	_My+14,#0,L553
1156                     ; 582 				GPIO_WriteHigh( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
1158  030b 4b08          	push	#8
1159  030d ae5000        	ldw	x,#20480
1160  0310               LC008:
1161  0310 cd0000        	call	_GPIO_WriteHigh
1164  0313 2008          	jp	LC006
1165  0315               L553:
1166                     ; 584 				GPIO_WriteLow( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
1168  0315 4b08          	push	#8
1169  0317 ae5000        	ldw	x,#20480
1170  031a               LC007:
1171  031a cd0000        	call	_GPIO_WriteLow
1173  031d               LC006:
1174  031d 84            	pop	a
1175  031e 200b          	jra	L143
1176  0320               L353:
1177                     ; 587 		if ( Ticks_50uS >= 20 )
1179  0320 a114          	cp	a,#20
1180  0322 2507          	jrult	L143
1181                     ; 589 			Ticks_50uS = 0;
1183  0324 3f4f          	clr	_Ticks_50uS
1184                     ; 591 			Ticks_1mS++;
1186  0326 be4d          	ldw	x,_Ticks_1mS
1187  0328 5c            	incw	x
1188  0329 bf4d          	ldw	_Ticks_1mS,x
1189  032b               L143:
1190                     ; 599 	if ( Drive.Ticks > 0 )
1192  032b b63f          	ld	a,_Drive+17
1193  032d 2702          	jreq	L563
1194                     ; 600 		Drive.Ticks--;
1196  032f 3a3f          	dec	_Drive+17
1197  0331               L563:
1198                     ; 602 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
1200  0331 7201002e08    	btjf	_Drive,#0,L763
1202  0336 2606          	jrne	L763
1203                     ; 604 		DriveService();	
1205  0338 cd0477        	call	_DriveService
1207                     ; 605 		Drive.Ticks = Drive.Interval;
1209  033b 453e3f        	mov	_Drive+17,_Drive+16
1210  033e               L763:
1211                     ; 608 }
1214  033e 81            	ret	
1238                     ; 615 void StopDrive(void)			//TROff()
1238                     ; 616 {	
1239                     	switch	.text
1240  033f               _StopDrive:
1244                     ; 617 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1246  033f 4b04          	push	#4
1247  0341 ae5000        	ldw	x,#20480
1248  0344 cd0000        	call	_GPIO_WriteLow
1250  0347 84            	pop	a
1251                     ; 618 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1253  0348 4b20          	push	#32
1254  034a ae500a        	ldw	x,#20490
1255  034d cd0000        	call	_GPIO_WriteLow
1257  0350 84            	pop	a
1258                     ; 619 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1260  0351 4b40          	push	#64
1261  0353 ae500a        	ldw	x,#20490
1262  0356 cd0000        	call	_GPIO_WriteLow
1264  0359 84            	pop	a
1265                     ; 620 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1267  035a 4b80          	push	#128
1268  035c ae500a        	ldw	x,#20490
1269  035f cd0000        	call	_GPIO_WriteLow
1271  0362 84            	pop	a
1272                     ; 621 }
1275  0363 81            	ret	
1320                     ; 627 void StartDriveOR( uint16_t Target, uint8_t overrun )
1320                     ; 628 {
1321                     	switch	.text
1322  0364               _StartDriveOR:
1324  0364 89            	pushw	x
1325       00000000      OFST:	set	0
1328                     ; 629 	if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
1330  0365 7203002e20    	btjf	_Drive,#1,L324
1331                     ; 631 		if ( Drive.Dir == 1 && Drive.Position < Target )			// same dir
1333  036a 7209002e04    	btjf	_Drive,#4,L524
1335  036f b32f          	cpw	x,_Drive+1
1336  0371 2217          	jrugt	L324
1338  0373               L524:
1339                     ; 635 		else if ( Drive.Dir == 0 && Drive.Position > Target )
1341  0373 7208002e0c    	btjt	_Drive,#4,L134
1343  0378 be2f          	ldw	x,_Drive+1
1344  037a 1301          	cpw	x,(OFST+1,sp)
1345  037c 2306          	jrule	L134
1346                     ; 637 			if ( Target == 0 )
1348  037e 1e01          	ldw	x,(OFST+1,sp)
1349  0380 2608          	jrne	L324
1350                     ; 638 				return;
1352  0382 2004          	jra	L261
1353  0384               L134:
1354                     ; 642 			Drive.Stop = 1;
1356  0384 7216002e      	bset	_Drive,#3
1357                     ; 643 			return;
1358  0388               L261:
1361  0388 85            	popw	x
1362  0389 81            	ret	
1363  038a               L324:
1364                     ; 650 	Drive.PreStep = Drive.Step;
1366  038a 454546        	mov	_Drive+24,_Drive+23
1367                     ; 653 	if ( Drive.Position == Target ) return;
1369  038d be2f          	ldw	x,_Drive+1
1370  038f 1301          	cpw	x,(OFST+1,sp)
1371  0391 27f5          	jreq	L261
1374                     ; 655 	if ( Target == 0 )				//  goto origin
1376  0393 1e01          	ldw	x,(OFST+1,sp)
1377  0395 260e          	jrne	L144
1378                     ; 657 		Drive.Overrun =	0u;
1380  0397 5f            	clrw	x
1381  0398 bf33          	ldw	_Drive+5,x
1382                     ; 658 		Drive.ZeroOffset = CPulse( OVER_STEP );
1384  039a ae001e        	ldw	x,#30
1385  039d cd06f1        	call	_CPulse
1387  03a0 bf36          	ldw	_Drive+8,x
1388                     ; 661 		Drive.Target = 0u;
1390  03a2 5f            	clrw	x
1391                     ; 662 		Drive.State = nMotorClose;		// 0;
1393  03a3 2013          	jp	LC009
1394  03a5               L144:
1395                     ; 667 		if (Drive.Position >= Target)		// Closing
1397  03a5 be2f          	ldw	x,_Drive+1
1398  03a7 1301          	cpw	x,(OFST+1,sp)
1399  03a9 2513          	jrult	L544
1400                     ; 669 			Drive.Dir = 0;
1402  03ab 7219002e      	bres	_Drive,#4
1403                     ; 670 			Drive.Overrun =	0u;
1405  03af 5f            	clrw	x
1406  03b0 bf33          	ldw	_Drive+5,x
1407                     ; 671 			Drive.State = nMotorClose;
1409  03b2 3f3d          	clr	_Drive+15
1410                     ; 672 			Drive.Overrun2 = 0u;
1412  03b4 3f35          	clr	_Drive+7
1413                     ; 673 			Drive.Target = Target;
1415  03b6 1e01          	ldw	x,(OFST+1,sp)
1416                     ; 674 			Drive.State = nMotorClose;		// 0;
1418  03b8               LC009:
1419  03b8 bf31          	ldw	_Drive+3,x
1421  03ba 3f3d          	clr	_Drive+15
1423  03bc 201b          	jra	L344
1424  03be               L544:
1425                     ; 678 			Drive.Dir = 1;
1427  03be 7218002e      	bset	_Drive,#4
1428                     ; 679 			Drive.State = nMotorOpen;	//1;
1430  03c2 3501003d      	mov	_Drive+15,#1
1431                     ; 680 			Drive.Overrun2 = overrun;		//100;
1433  03c6 7b05          	ld	a,(OFST+5,sp)
1434  03c8 b735          	ld	_Drive+7,a
1435                     ; 681 			Drive.Target = Target + overrun;	//100;	
1437  03ca 7b01          	ld	a,(OFST+1,sp)
1438  03cc 97            	ld	xl,a
1439  03cd 7b02          	ld	a,(OFST+2,sp)
1440  03cf 1b05          	add	a,(OFST+5,sp)
1441  03d1 2401          	jrnc	L061
1442  03d3 5c            	incw	x
1443  03d4               L061:
1444  03d4 b732          	ld	_Drive+4,a
1445  03d6 9f            	ld	a,xl
1446  03d7 b731          	ld	_Drive+3,a
1447  03d9               L344:
1448                     ; 685 	Drive.Run = TRUE;
1450  03d9 7212002e      	bset	_Drive,#1
1451                     ; 686 	Drive.Ticks = Drive.Interval;
1453  03dd 453e3f        	mov	_Drive+17,_Drive+16
1454                     ; 687 }
1456  03e0 20a6          	jra	L261
1516                     ; 693 void MotorStep(MOTOR_DIR Dir)
1516                     ; 694 {
1517                     	switch	.text
1518  03e2               _MotorStep:
1522                     ; 695 	if ( Dir == nMotorClose )
1524  03e2 4d            	tnz	a
1525  03e3 2625          	jrne	L505
1526                     ; 697 		if ( Drive.Position != 0 ) 
1528  03e5 be2f          	ldw	x,_Drive+1
1529  03e7 270f          	jreq	LC010
1530                     ; 699 			Drive.Position--;
1532  03e9 5a            	decw	x
1533  03ea bf2f          	ldw	_Drive+1,x
1534                     ; 700 			if ( Drive.NormalOpen )
1536  03ec b644          	ld	a,_Drive+22
1537  03ee 2704          	jreq	L115
1538                     ; 701 				Drive.Phase++;   // NC
1540  03f0 3c38          	inc	_Drive+10
1542  03f2 2047          	jra	L125
1543  03f4               L115:
1544                     ; 704 				Drive.Phase--;	//NC
1546  03f4 3a38          	dec	_Drive+10
1547  03f6 2043          	jra	L125
1548                     ; 708 		if ( Drive.Position == 0 ) 
1550  03f8               LC010:
1551                     ; 711 			Drive.Overrun = 0u;
1553  03f8 5f            	clrw	x
1554  03f9 bf33          	ldw	_Drive+5,x
1555                     ; 712 			Drive.Run = FALSE;
1557  03fb 7213002e      	bres	_Drive,#1
1558                     ; 713 			Drive.ZeroOffset = 0u;
1560  03ff bf36          	ldw	_Drive+8,x
1561                     ; 714 			Drive.Position = 0u;
1563  0401 bf2f          	ldw	_Drive+1,x
1564                     ; 715 			Drive.Target = 0u;
1566  0403 bf31          	ldw	_Drive+3,x
1567                     ; 716 			StopDrive();	
1569  0405 cd033f        	call	_StopDrive
1571  0408 2031          	jra	L125
1572  040a               L505:
1573                     ; 722 			Drive.Position++;
1575  040a be2f          	ldw	x,_Drive+1
1576  040c 5c            	incw	x
1577  040d bf2f          	ldw	_Drive+1,x
1578                     ; 724 		if ( Drive.NormalOpen )
1580  040f b644          	ld	a,_Drive+22
1581  0411 2704          	jreq	L325
1582                     ; 725 				Drive.Phase--;
1584  0413 3a38          	dec	_Drive+10
1586  0415 2002          	jra	L525
1587  0417               L325:
1588                     ; 727 				Drive.Phase++;
1590  0417 3c38          	inc	_Drive+10
1591  0419               L525:
1592                     ; 730 		if ( Drive.Origin ) 
1594  0419 b643          	ld	a,_Drive+21
1595  041b 2708          	jreq	L725
1596                     ; 732 			Drive.ORGPosition = Drive.Position;
1598  041d bf3b          	ldw	_Drive+13,x
1599                     ; 733 			Drive.LastOrigin = TRUE;
1601  041f 7214002e      	bset	_Drive,#2
1603  0423 2016          	jra	L125
1604  0425               L725:
1605                     ; 736 			if ( Drive.LastOrigin )
1607  0425 7205002e11    	btjf	_Drive,#2,L125
1608                     ; 738 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1610  042a be3b          	ldw	x,_Drive+13
1611  042c 1d0028        	subw	x,#40
1612  042f bf39          	ldw	_Drive+11,x
1613                     ; 739 				if ( Drive.MaxOverrun > OVERRUN )
1615  0431 a3012d        	cpw	x,#301
1616  0434 2505          	jrult	L125
1617                     ; 740 					Drive.MaxOverrun = OVERRUN;				
1619  0436 ae012c        	ldw	x,#300
1620  0439 bf39          	ldw	_Drive+11,x
1621  043b               L125:
1622                     ; 745 	if ( !Drive.Run ) return;
1624  043b 7202002e01    	btjt	_Drive,#1,L735
1628  0440 81            	ret	
1629  0441               L735:
1630                     ; 746 	if ( !Drive.Enabled ) return;
1632  0441 7200002e01    	btjt	_Drive,#0,L145
1636  0446 81            	ret	
1637  0447               L145:
1638                     ; 747 	switch ( Drive.ExcitationType )
1640  0447 b642          	ld	a,_Drive+20
1642                     ; 758 			break;
1643  0449 2707          	jreq	L154
1644  044b 4a            	dec	a
1645  044c 2707          	jreq	L354
1646  044e 4a            	dec	a
1647  044f 2707          	jreq	L554
1649  0451 81            	ret	
1650  0452               L154:
1651                     ; 750 		case 0:
1651                     ; 751 			Excitation_1Phase();	
1654                     ; 752 			break;
1657  0452 cc062b        	jp	_Excitation_1Phase
1658  0455               L354:
1659                     ; 753 		case 1:
1659                     ; 754 			Excitation_12Phase();
1662                     ; 755 			break;
1665  0455 cc0562        	jp	_Excitation_12Phase
1666  0458               L554:
1667                     ; 756 		case 2:
1667                     ; 757 			Excitation_2Phase();
1670                     ; 758 			break;
1672                     ; 763 }
1675  0458 207a          	jp	_Excitation_2Phase
1701                     ; 768 void MotorClose(void)
1701                     ; 769 {
1702                     	switch	.text
1703  045a               _MotorClose:
1707                     ; 771 	if ( Drive.Origin )   		// Hall IC Sensing 
1709  045a b643          	ld	a,_Drive+21
1710  045c 2715          	jreq	L755
1711                     ; 773 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1713  045e be33          	ldw	x,_Drive+5
1714  0460 b339          	cpw	x,_Drive+11
1715  0462 250c          	jrult	L165
1716                     ; 775 			Drive.Target = 0u;
1718  0464 5f            	clrw	x
1719  0465 bf31          	ldw	_Drive+3,x
1720                     ; 776 			Drive.Position = 0u;
1722  0467 bf2f          	ldw	_Drive+1,x
1723                     ; 777 			Drive.Overrun = 0u;
1725  0469 bf33          	ldw	_Drive+5,x
1726                     ; 778 			Drive.ZeroOffset = 0u;
1728  046b bf36          	ldw	_Drive+8,x
1729                     ; 782 			StopDrive();
1734  046d cc033f        	jp	_StopDrive
1735  0470               L165:
1736                     ; 786 			Drive.Overrun++;
1738  0470 5c            	incw	x
1739  0471 bf33          	ldw	_Drive+5,x
1740                     ; 787 			MotorStep(nMotorClose);
1742  0473               L755:
1743                     ; 791 		MotorStep(nMotorClose);		// move 1 step close
1746  0473 4f            	clr	a
1748                     ; 792 }
1751  0474 cc03e2        	jp	_MotorStep
1778                     ; 797 void DriveService(void)
1778                     ; 798 {
1779                     	switch	.text
1780  0477               _DriveService:
1782  0477 89            	pushw	x
1783       00000002      OFST:	set	2
1786                     ; 800 	if ( ! Drive.Run ) 
1788  0478 7202002e02    	btjt	_Drive,#1,L775
1789                     ; 803 		StopDrive();
1791                     ; 804 		return;	//when Drive is stop 
1793  047d 2050          	jp	LC012
1794  047f               L775:
1795                     ; 807 	if ( Drive.Stop )
1797  047f 7207002e08    	btjf	_Drive,#3,L106
1798                     ; 809 		Drive.Stop = 0;
1800  0484 7217002e      	bres	_Drive,#3
1801                     ; 810 		Drive.Target = Drive.Position ;
1803  0488 be2f          	ldw	x,_Drive+1
1804  048a bf31          	ldw	_Drive+3,x
1805  048c               L106:
1806                     ; 813 	if ( Drive.Target > Drive.Position )
1808  048c be31          	ldw	x,_Drive+3
1809  048e b32f          	cpw	x,_Drive+1
1810  0490 2307          	jrule	L306
1811                     ; 814 	 	MotorStep(nMotorOpen);
1813  0492 a601          	ld	a,#1
1814  0494 cd03e2        	call	_MotorStep
1817  0497 2039          	jra	L506
1818  0499               L306:
1819                     ; 815 	else if ( Drive.Target < Drive.Position )
1821  0499 b32f          	cpw	x,_Drive+1
1822  049b 2404          	jruge	L706
1823                     ; 816 		MotorClose( );
1825  049d adbb          	call	_MotorClose
1828  049f 2031          	jra	L506
1829  04a1               L706:
1830                     ; 817 	else if ( Drive.Target ) 	// on target position
1832  04a1 be31          	ldw	x,_Drive+3
1833  04a3 2721          	jreq	L316
1834                     ; 819 			if ( Drive.Overrun2 )
1836  04a5 b635          	ld	a,_Drive+7
1837  04a7 270f          	jreq	L516
1838                     ; 821 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1840  04a9 5f            	clrw	x
1841  04aa 97            	ld	xl,a
1842  04ab 1f01          	ldw	(OFST-1,sp),x
1844  04ad be31          	ldw	x,_Drive+3
1845  04af 72f001        	subw	x,(OFST-1,sp)
1846  04b2 bf31          	ldw	_Drive+3,x
1847                     ; 822 				Drive.Overrun2 = 0u;
1849  04b4 3f35          	clr	_Drive+7
1851  04b6 201a          	jra	L506
1852  04b8               L516:
1853                     ; 826 				Drive.ZeroOffset = 0u;
1855  04b8 5f            	clrw	x
1856  04b9 bf36          	ldw	_Drive+8,x
1857                     ; 827 				Drive.Overrun = 0u;
1859  04bb bf33          	ldw	_Drive+5,x
1860                     ; 829 				StopDrive();	
1862  04bd cd033f        	call	_StopDrive
1864                     ; 830 				Drive.Run = FALSE;				
1866  04c0 7213002e      	bres	_Drive,#1
1867  04c4 200c          	jra	L506
1868  04c6               L316:
1869                     ; 836 			Drive.ZeroOffset = 0u;
1871  04c6 5f            	clrw	x
1872  04c7 bf36          	ldw	_Drive+8,x
1873                     ; 837 			Drive.Overrun = 0u;
1875  04c9 bf33          	ldw	_Drive+5,x
1876                     ; 838 			Drive.Run = FALSE;
1878  04cb 7213002e      	bres	_Drive,#1
1879                     ; 839 			StopDrive();	
1881  04cf               LC012:
1883  04cf cd033f        	call	_StopDrive
1885  04d2               L506:
1886                     ; 841 }
1889  04d2 85            	popw	x
1890  04d3 81            	ret	
1916                     ; 844 void Excitation_2Phase( void )
1916                     ; 845 {
1917                     	switch	.text
1918  04d4               _Excitation_2Phase:
1922                     ; 847 	switch (Drive.Phase%8)
1924  04d4 b638          	ld	a,_Drive+10
1925  04d6 a407          	and	a,#7
1927                     ; 879 		default:
1927                     ; 880 			break;
1928  04d8 2716          	jreq	L326
1929  04da 4a            	dec	a
1930  04db 2713          	jreq	L326
1931  04dd 4a            	dec	a
1932  04de 271e          	jreq	L526
1933  04e0 4a            	dec	a
1934  04e1 271b          	jreq	L526
1935  04e3 4a            	dec	a
1936  04e4 272f          	jreq	L726
1937  04e6 4a            	dec	a
1938  04e7 272c          	jreq	L726
1939  04e9 4a            	dec	a
1940  04ea 2737          	jreq	L136
1941  04ec 4a            	dec	a
1942  04ed 2734          	jreq	L136
1944  04ef 81            	ret	
1945  04f0               L326:
1946                     ; 849 		case 0:
1946                     ; 850 		case 1:
1946                     ; 851 		//case 1:
1946                     ; 852 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1948  04f0 ad48          	call	LC016
1949                     ; 853 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1951  04f2 ad5a          	call	LC018
1952                     ; 854 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1954  04f4 4b40          	push	#64
1955  04f6 ae500a        	ldw	x,#20490
1956  04f9 cd0000        	call	_GPIO_WriteLow
1958                     ; 855 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1960                     ; 856 			break;		
1962  04fc 200c          	jp	LC015
1963  04fe               L526:
1964                     ; 857 		case 2:
1964                     ; 858 		case 3:
1964                     ; 859 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1966  04fe ad44          	call	LC017
1967                     ; 860 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1969  0500 ad4c          	call	LC018
1970                     ; 861 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1972  0502 4b40          	push	#64
1973  0504 ae500a        	ldw	x,#20490
1974  0507 cd0000        	call	_GPIO_WriteHigh
1976                     ; 862 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1978  050a               LC015:
1979  050a 84            	pop	a
1981  050b 4b80          	push	#128
1982  050d ae500a        	ldw	x,#20490
1983  0510 cd0000        	call	_GPIO_WriteLow
1985                     ; 863 			break;
1987  0513 2023          	jp	LC013
1988  0515               L726:
1989                     ; 864 		case 4:
1989                     ; 865 		case 5:
1989                     ; 866 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1991  0515 ad2d          	call	LC017
1992                     ; 867 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1994  0517 ad3f          	call	LC019
1995                     ; 868 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1997  0519 4b40          	push	#64
1998  051b ae500a        	ldw	x,#20490
1999  051e cd0000        	call	_GPIO_WriteHigh
2001                     ; 869 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2003                     ; 870 			break;
2005  0521 200c          	jp	LC014
2006  0523               L136:
2007                     ; 871 		case 6:
2007                     ; 872 		case 7:		
2007                     ; 873 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2009  0523 ad15          	call	LC016
2010                     ; 874 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2012  0525 ad31          	call	LC019
2013                     ; 875 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2015  0527 4b40          	push	#64
2016  0529 ae500a        	ldw	x,#20490
2017  052c cd0000        	call	_GPIO_WriteLow
2019                     ; 876 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2021  052f               LC014:
2022  052f 84            	pop	a
2024  0530 4b80          	push	#128
2025  0532 ae500a        	ldw	x,#20490
2026  0535 cd0000        	call	_GPIO_WriteHigh
2028  0538               LC013:
2029  0538 84            	pop	a
2030                     ; 877 			break;
2032                     ; 879 		default:
2032                     ; 880 			break;
2034                     ; 883 }
2037  0539 81            	ret	
2038  053a               LC016:
2039  053a 4b04          	push	#4
2040  053c ae5000        	ldw	x,#20480
2041  053f cd0000        	call	_GPIO_WriteHigh
2043  0542 84            	pop	a
2044  0543 81            	ret	
2045  0544               LC017:
2046  0544 4b04          	push	#4
2047  0546 ae5000        	ldw	x,#20480
2048  0549 cd0000        	call	_GPIO_WriteLow
2050  054c 84            	pop	a
2051  054d 81            	ret	
2052  054e               LC018:
2053  054e 4b20          	push	#32
2054  0550 ae500a        	ldw	x,#20490
2055  0553 cd0000        	call	_GPIO_WriteHigh
2057  0556 84            	pop	a
2058  0557 81            	ret	
2059  0558               LC019:
2060  0558 4b20          	push	#32
2061  055a ae500a        	ldw	x,#20490
2062  055d cd0000        	call	_GPIO_WriteLow
2064  0560 84            	pop	a
2065  0561 81            	ret	
2091                     ; 886 void Excitation_12Phase( void )
2091                     ; 887 {
2092                     	switch	.text
2093  0562               _Excitation_12Phase:
2097                     ; 889 	switch (Drive.Phase%8)
2099  0562 b638          	ld	a,_Drive+10
2100  0564 a407          	and	a,#7
2102                     ; 940 		default:
2102                     ; 941 			break;
2103  0566 2716          	jreq	L156
2104  0568 4a            	dec	a
2105  0569 271d          	jreq	L356
2106  056b 4a            	dec	a
2107  056c 272d          	jreq	L556
2108  056e 4a            	dec	a
2109  056f 273f          	jreq	L756
2110  0571 4a            	dec	a
2111  0572 2748          	jreq	L166
2112  0574 4a            	dec	a
2113  0575 2753          	jreq	L366
2114  0577 4a            	dec	a
2115  0578 276e          	jreq	L566
2116  057a 4a            	dec	a
2117  057b 2775          	jreq	L766
2119  057d 81            	ret	
2120  057e               L156:
2121                     ; 891 		case 0:
2121                     ; 892 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2123  057e 4b04          	push	#4
2124  0580 ae5000        	ldw	x,#20480
2125  0583 cd0000        	call	_GPIO_WriteHigh
2127                     ; 893 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2129                     ; 894 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2131                     ; 895 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2133                     ; 896 			break;
2135  0586 2008          	jp	LC023
2136  0588               L356:
2137                     ; 897 		case 1:
2137                     ; 898 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2139  0588 4b04          	push	#4
2140  058a ae5000        	ldw	x,#20480
2141  058d cd0000        	call	_GPIO_WriteLow
2143                     ; 899 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2145  0590               LC023:
2146  0590 84            	pop	a
2148  0591 4b20          	push	#32
2149  0593 ae500a        	ldw	x,#20490
2150  0596 cd0000        	call	_GPIO_WriteHigh
2152                     ; 900 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2154                     ; 901 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2156                     ; 902 			break;		
2158  0599 2068          	jp	LC022
2159  059b               L556:
2160                     ; 903 		case 2:
2160                     ; 904 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2162  059b ad7a          	call	LC027
2163                     ; 905 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2165  059d 4b20          	push	#32
2166  059f ae500a        	ldw	x,#20490
2167  05a2 cd0000        	call	_GPIO_WriteHigh
2169                     ; 906 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2171  05a5               LC024:
2172  05a5 84            	pop	a
2174  05a6 4b40          	push	#64
2175  05a8 ae500a        	ldw	x,#20490
2176  05ab cd0000        	call	_GPIO_WriteHigh
2178                     ; 907 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2180                     ; 908 			break;
2182  05ae 205c          	jp	LC021
2183  05b0               L756:
2184                     ; 909 		case 3:
2184                     ; 910 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2186  05b0 ad65          	call	LC027
2187                     ; 911 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2189  05b2 4b20          	push	#32
2190  05b4 ae500a        	ldw	x,#20490
2191  05b7 cd0000        	call	_GPIO_WriteLow
2193                     ; 912 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2195                     ; 913 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2197                     ; 914 			break;
2199  05ba 20e9          	jp	LC024
2200  05bc               L166:
2201                     ; 915 		case 4:
2201                     ; 916 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2203  05bc ad59          	call	LC027
2204                     ; 917 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2206  05be ad61          	call	LC028
2207                     ; 918 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2209  05c0 4b40          	push	#64
2210  05c2 ae500a        	ldw	x,#20490
2211  05c5 cd0000        	call	_GPIO_WriteHigh
2213                     ; 919 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2215                     ; 920 			break;
2217  05c8 2013          	jp	LC025
2218  05ca               L366:
2219                     ; 921 		case 5: 
2219                     ; 922 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2221  05ca 4b04          	push	#4
2222  05cc ae5000        	ldw	x,#20480
2223  05cf cd0000        	call	_GPIO_WriteLow
2225                     ; 923 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2228                     ; 924 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2230  05d2               LC026:
2231  05d2 84            	pop	a
2233  05d3 ad4c          	call	LC028
2235  05d5 4b40          	push	#64
2236  05d7 ae500a        	ldw	x,#20490
2237  05da cd0000        	call	_GPIO_WriteLow
2239                     ; 925 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2241  05dd               LC025:
2242  05dd 84            	pop	a
2245  05de 4b80          	push	#128
2246  05e0 ae500a        	ldw	x,#20490
2247  05e3 cd0000        	call	_GPIO_WriteHigh
2249                     ; 926 			break;
2251  05e6 202d          	jp	LC020
2252  05e8               L566:
2253                     ; 927 		case 6:  
2253                     ; 928 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2255  05e8 4b04          	push	#4
2256  05ea ae5000        	ldw	x,#20480
2257  05ed cd0000        	call	_GPIO_WriteHigh
2259                     ; 929 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2261                     ; 930 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2263                     ; 931 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2265                     ; 932 			break;
2267  05f0 20e0          	jp	LC026
2268  05f2               L766:
2269                     ; 933 		case 7:
2269                     ; 934 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2271  05f2 4b04          	push	#4
2272  05f4 ae5000        	ldw	x,#20480
2273  05f7 cd0000        	call	_GPIO_WriteHigh
2275  05fa 84            	pop	a
2276                     ; 935 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2278  05fb 4b20          	push	#32
2279  05fd ae500a        	ldw	x,#20490
2280  0600 cd0000        	call	_GPIO_WriteLow
2282                     ; 936 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2284  0603               LC022:
2285  0603 84            	pop	a
2288  0604 4b40          	push	#64
2289  0606 ae500a        	ldw	x,#20490
2290  0609 cd0000        	call	_GPIO_WriteLow
2292                     ; 937 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2294  060c               LC021:
2295  060c 84            	pop	a
2300  060d 4b80          	push	#128
2301  060f ae500a        	ldw	x,#20490
2302  0612 cd0000        	call	_GPIO_WriteLow
2304  0615               LC020:
2305  0615 84            	pop	a
2306                     ; 938 			break;
2308                     ; 940 		default:
2308                     ; 941 			break;
2310                     ; 944 }
2313  0616 81            	ret	
2314  0617               LC027:
2315  0617 4b04          	push	#4
2316  0619 ae5000        	ldw	x,#20480
2317  061c cd0000        	call	_GPIO_WriteLow
2319  061f 84            	pop	a
2320  0620 81            	ret	
2321  0621               LC028:
2322  0621 4b20          	push	#32
2323  0623 ae500a        	ldw	x,#20490
2324  0626 cd0000        	call	_GPIO_WriteLow
2326  0629 84            	pop	a
2327  062a 81            	ret	
2353                     ; 946 void Excitation_1Phase( void )
2353                     ; 947 {
2354                     	switch	.text
2355  062b               _Excitation_1Phase:
2359                     ; 950 	switch (Drive.Phase%8)
2361  062b b638          	ld	a,_Drive+10
2362  062d a407          	and	a,#7
2364                     ; 981 		default:
2364                     ; 982 			break;
2365  062f 2716          	jreq	L707
2366  0631 4a            	dec	a
2367  0632 2713          	jreq	L707
2368  0634 4a            	dec	a
2369  0635 2723          	jreq	L117
2370  0637 4a            	dec	a
2371  0638 2720          	jreq	L117
2372  063a 4a            	dec	a
2373  063b 273b          	jreq	L317
2374  063d 4a            	dec	a
2375  063e 2738          	jreq	L317
2376  0640 4a            	dec	a
2377  0641 2741          	jreq	L517
2378  0643 4a            	dec	a
2379  0644 273e          	jreq	L517
2381  0646 81            	ret	
2382  0647               L707:
2383                     ; 952 		case 0:
2383                     ; 953 		case 1:
2383                     ; 954 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2385  0647 4b04          	push	#4
2386  0649 ae5000        	ldw	x,#20480
2387  064c cd0000        	call	_GPIO_WriteHigh
2389  064f 84            	pop	a
2390                     ; 955 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2392  0650 4b20          	push	#32
2393  0652 ae500a        	ldw	x,#20490
2394  0655 cd0000        	call	_GPIO_WriteLow
2396                     ; 956 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2398                     ; 957 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2400                     ; 958 			break;		
2402  0658 200a          	jp	LC031
2403  065a               L117:
2404                     ; 959 		case 2:
2404                     ; 960 		case 3:
2404                     ; 961 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2406  065a ad49          	call	LC033
2407                     ; 962 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2409  065c 4b20          	push	#32
2410  065e ae500a        	ldw	x,#20490
2411  0661 cd0000        	call	_GPIO_WriteHigh
2413                     ; 963 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2415  0664               LC031:
2416  0664 84            	pop	a
2418  0665 4b40          	push	#64
2419  0667 ae500a        	ldw	x,#20490
2420  066a cd0000        	call	_GPIO_WriteLow
2422                     ; 964 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2424  066d               LC030:
2425  066d 84            	pop	a
2428  066e 4b80          	push	#128
2429  0670 ae500a        	ldw	x,#20490
2430  0673 cd0000        	call	_GPIO_WriteLow
2432                     ; 965 			break;
2434  0676 201f          	jp	LC029
2435  0678               L317:
2436                     ; 966 		case 4:
2436                     ; 967 		case 5:
2436                     ; 968 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2438  0678 ad1f          	call	LC032
2439                     ; 970 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2441  067a 4b40          	push	#64
2442  067c ae500a        	ldw	x,#20490
2443  067f cd0000        	call	_GPIO_WriteHigh
2445                     ; 971 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2447                     ; 972 			break;
2449  0682 20e9          	jp	LC030
2450  0684               L517:
2451                     ; 973 		case 6:
2451                     ; 974 		case 7:
2451                     ; 975 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2453  0684 ad13          	call	LC032
2454                     ; 977 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2456  0686 4b40          	push	#64
2457  0688 ae500a        	ldw	x,#20490
2458  068b cd0000        	call	_GPIO_WriteLow
2460  068e 84            	pop	a
2461                     ; 978 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2463  068f 4b80          	push	#128
2464  0691 ae500a        	ldw	x,#20490
2465  0694 cd0000        	call	_GPIO_WriteHigh
2467  0697               LC029:
2468  0697 84            	pop	a
2469                     ; 979 			break;
2471                     ; 981 		default:
2471                     ; 982 			break;
2473                     ; 985 }
2476  0698 81            	ret	
2477  0699               LC032:
2478  0699 ad0a          	call	LC033
2479                     ; 969 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2481  069b 4b20          	push	#32
2482  069d ae500a        	ldw	x,#20490
2483  06a0 cd0000        	call	_GPIO_WriteLow
2485  06a3 84            	pop	a
2486  06a4 81            	ret	
2487  06a5               LC033:
2488  06a5 4b04          	push	#4
2489  06a7 ae5000        	ldw	x,#20480
2490  06aa cd0000        	call	_GPIO_WriteLow
2492  06ad 84            	pop	a
2493  06ae 81            	ret	
2528                     ; 988 u8 Interval( u16 Vmon)
2528                     ; 989 {
2529                     	switch	.text
2530  06af               _Interval:
2532  06af 89            	pushw	x
2533       00000000      OFST:	set	0
2536                     ; 990 	Vmon = Vmon / IntervalSlope;
2538  06b0 a61c          	ld	a,#28
2539  06b2 62            	div	x,a
2540                     ; 992 	if (Vmon < 10 ) Vmon = 10;
2542  06b3 a3000a        	cpw	x,#10
2543  06b6 2403          	jruge	L357
2546  06b8 ae000a        	ldw	x,#10
2547  06bb               L357:
2548                     ; 993 	if (Vmon > 26 ) Vmon = 26;
2550  06bb a3001b        	cpw	x,#27
2551  06be 2503          	jrult	L557
2554  06c0 ae001a        	ldw	x,#26
2555  06c3               L557:
2556                     ; 995 	return ( TableInterval[ Vmon-10 ] );
2558  06c3 1d000a        	subw	x,#10
2559  06c6 e602          	ld	a,(_TableInterval,x)
2562  06c8 85            	popw	x
2563  06c9 81            	ret	
2607                     .const:	section	.text
2608  0000               L634:
2609  0000 00000064      	dc.l	100
2610                     ; 1010 uint16_t CStep( uint16_t pulse )
2610                     ; 1011 {
2611                     	switch	.text
2612  06ca               _CStep:
2614  06ca 5204          	subw	sp,#4
2615       00000004      OFST:	set	4
2618                     ; 1015 	i = (uint32_t) pulse * My.GearRatio100 ;
2620  06cc 90be2b        	ldw	y,_My+12
2621  06cf cd0000        	call	c_umul
2623  06d2 96            	ldw	x,sp
2624  06d3 5c            	incw	x
2625  06d4 cd0000        	call	c_rtol
2628                     ; 1016 	i = (i+1)/100;   				// Round up  20150925
2630  06d7 96            	ldw	x,sp
2631  06d8 5c            	incw	x
2632  06d9 cd0000        	call	c_ltor
2634  06dc a601          	ld	a,#1
2635  06de cd0000        	call	c_ladc
2637  06e1 ae0000        	ldw	x,#L634
2638  06e4 cd0000        	call	c_ludv
2640  06e7 96            	ldw	x,sp
2641  06e8 5c            	incw	x
2642  06e9 cd0000        	call	c_rtol
2645                     ; 1017 	return (uint16_t) i;
2647  06ec 1e03          	ldw	x,(OFST-1,sp)
2650  06ee 5b04          	addw	sp,#4
2651  06f0 81            	ret	
2695                     ; 1021 uint16_t CPulse( uint16_t step )
2695                     ; 1022 {
2696                     	switch	.text
2697  06f1               _CPulse:
2699  06f1 5204          	subw	sp,#4
2700       00000004      OFST:	set	4
2703                     ; 1031 	i = (uint32_t) step * My.GearRatio100 ;
2705  06f3 90be2b        	ldw	y,_My+12
2706  06f6 cd0000        	call	c_umul
2708  06f9 96            	ldw	x,sp
2709  06fa 5c            	incw	x
2710  06fb cd0000        	call	c_rtol
2713                     ; 1032 	i = (i+1)/100;   			
2715  06fe 96            	ldw	x,sp
2716  06ff 5c            	incw	x
2717  0700 cd0000        	call	c_ltor
2719  0703 a601          	ld	a,#1
2720  0705 cd0000        	call	c_ladc
2722  0708 ae0000        	ldw	x,#L634
2723  070b cd0000        	call	c_ludv
2725  070e 96            	ldw	x,sp
2726  070f 5c            	incw	x
2727  0710 cd0000        	call	c_rtol
2730                     ; 1034 	return (uint16_t) i;
2732  0713 1e03          	ldw	x,(OFST-1,sp)
2735  0715 5b04          	addw	sp,#4
2736  0717 81            	ret	
2765                     ; 1045 void Clock_Config(void)
2765                     ; 1046 {
2766                     	switch	.text
2767  0718               _Clock_Config:
2771                     ; 1048 	CLK_DeInit();
2773  0718 cd0000        	call	_CLK_DeInit
2775                     ; 1049 	CLK_HSICmd(ENABLE);
2777  071b a601          	ld	a,#1
2778  071d cd0000        	call	_CLK_HSICmd
2780                     ; 1050 	CLK_LSICmd(DISABLE);
2782  0720 4f            	clr	a
2783  0721 cd0000        	call	_CLK_LSICmd
2785                     ; 1051 	CLK_HSECmd(DISABLE);
2787  0724 4f            	clr	a
2788  0725 cd0000        	call	_CLK_HSECmd
2790                     ; 1053 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2792  0728 4f            	clr	a
2793  0729 cd0000        	call	_CLK_HSIPrescalerConfig
2795                     ; 1054 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2797  072c a680          	ld	a,#128
2799                     ; 1055 }
2802  072e cc0000        	jp	_CLK_SYSCLKConfig
2828                     ; 1058 void Gpio_Config(void)
2828                     ; 1059 {
2829                     	switch	.text
2830  0731               _Gpio_Config:
2834                     ; 1061   GPIO_Init(_LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2836  0731 4be0          	push	#224
2837  0733 4b10          	push	#16
2838  0735 ae5005        	ldw	x,#20485
2839  0738 cd0000        	call	_GPIO_Init
2841  073b 85            	popw	x
2842                     ; 1062 	GPIO_WriteHigh(_LED_PORT, _LED_PIN);
2844  073c 4b10          	push	#16
2845  073e ae5005        	ldw	x,#20485
2846  0741 cd0000        	call	_GPIO_WriteHigh
2848  0744 84            	pop	a
2849                     ; 1065 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2851  0745 4be0          	push	#224
2852  0747 4b04          	push	#4
2853  0749 ae5000        	ldw	x,#20480
2854  074c cd0000        	call	_GPIO_Init
2856  074f 85            	popw	x
2857                     ; 1066 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2859  0750 4be0          	push	#224
2860  0752 4b40          	push	#64
2861  0754 ae500a        	ldw	x,#20490
2862  0757 cd0000        	call	_GPIO_Init
2864  075a 85            	popw	x
2865                     ; 1067 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2867  075b 4be0          	push	#224
2868  075d 4b20          	push	#32
2869  075f ae500a        	ldw	x,#20490
2870  0762 cd0000        	call	_GPIO_Init
2872  0765 85            	popw	x
2873                     ; 1068 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2875  0766 4be0          	push	#224
2876  0768 4b80          	push	#128
2877  076a ae500a        	ldw	x,#20490
2878  076d cd0000        	call	_GPIO_Init
2880  0770 85            	popw	x
2881                     ; 1070 	GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2883  0771 4b04          	push	#4
2884  0773 ae5000        	ldw	x,#20480
2885  0776 cd0000        	call	_GPIO_WriteHigh
2887  0779 84            	pop	a
2888                     ; 1071 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2890  077a 4b04          	push	#4
2891  077c ae5000        	ldw	x,#20480
2892  077f cd0000        	call	_GPIO_WriteLow
2894  0782 84            	pop	a
2895                     ; 1073 	GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2897  0783 4b20          	push	#32
2898  0785 ae500a        	ldw	x,#20490
2899  0788 cd0000        	call	_GPIO_WriteHigh
2901  078b 84            	pop	a
2902                     ; 1074 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2904  078c 4b20          	push	#32
2905  078e ae500a        	ldw	x,#20490
2906  0791 cd0000        	call	_GPIO_WriteLow
2908  0794 84            	pop	a
2909                     ; 1076 	GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2911  0795 4b40          	push	#64
2912  0797 ae500a        	ldw	x,#20490
2913  079a cd0000        	call	_GPIO_WriteHigh
2915  079d 84            	pop	a
2916                     ; 1077 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2918  079e 4b40          	push	#64
2919  07a0 ae500a        	ldw	x,#20490
2920  07a3 cd0000        	call	_GPIO_WriteLow
2922  07a6 84            	pop	a
2923                     ; 1079 	GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);		
2925  07a7 4b80          	push	#128
2926  07a9 ae500a        	ldw	x,#20490
2927  07ac cd0000        	call	_GPIO_WriteHigh
2929  07af 84            	pop	a
2930                     ; 1080 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2932  07b0 4b80          	push	#128
2933  07b2 ae500a        	ldw	x,#20490
2934  07b5 cd0000        	call	_GPIO_WriteLow
2936  07b8 84            	pop	a
2937                     ; 1083   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2939  07b9 4b00          	push	#0
2940  07bb 4b02          	push	#2
2941  07bd ae5000        	ldw	x,#20480
2942  07c0 cd0000        	call	_GPIO_Init
2944  07c3 85            	popw	x
2945                     ; 1089 	GPIO_Init(_CHARGE_ON_PORT, _CHARGE_ON_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2947  07c4 4be0          	push	#224
2948  07c6 4b10          	push	#16
2949  07c8 ae500f        	ldw	x,#20495
2950  07cb cd0000        	call	_GPIO_Init
2952  07ce 85            	popw	x
2953                     ; 1092 	GPIO_Init(_BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN, GPIO_MODE_OUT_PP_LOW_FAST);		
2955  07cf 4be0          	push	#224
2956  07d1 4b08          	push	#8
2957  07d3 ae5000        	ldw	x,#20480
2958  07d6 cd0000        	call	_GPIO_Init
2960  07d9 85            	popw	x
2961                     ; 1097 	GPIO_Init( _ADJ_MO_PORT , _ADJ_MO_PIN , GPIO_MODE_IN_FL_NO_IT );
2963  07da 4b00          	push	#0
2964  07dc 4b10          	push	#16
2965  07de ae500a        	ldw	x,#20490
2966  07e1 cd0000        	call	_GPIO_Init
2968  07e4 85            	popw	x
2969                     ; 1099 	GPIO_Init( _BAT_MO_PORT , _BAT_MO_PIN, GPIO_MODE_IN_FL_NO_IT );
2971  07e5 ad2f          	call	LC034
2972                     ; 1101 	GPIO_Init( _BOOST_MO_PORT , _BOOST_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2974  07e7 ad2d          	call	LC034
2975                     ; 1103   GPIO_Init( _POWER_MO_PORT , _POWER_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2977  07e9 4b00          	push	#0
2978  07eb 4b20          	push	#32
2979  07ed ae500f        	ldw	x,#20495
2980  07f0 cd0000        	call	_GPIO_Init
2982  07f3 85            	popw	x
2983                     ; 1105 	GPIO_Init( _ISENSE_PORT , _ISENSE_PIN  , GPIO_MODE_IN_FL_NO_IT );
2985  07f4 4b00          	push	#0
2986  07f6 4b04          	push	#4
2987  07f8 ae500f        	ldw	x,#20495
2988  07fb cd0000        	call	_GPIO_Init
2990  07fe 85            	popw	x
2991                     ; 1111 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
2993  07ff 4b00          	push	#0
2994  0801 4b20          	push	#32
2995  0803 ae5005        	ldw	x,#20485
2996  0806 cd0000        	call	_GPIO_Init
2998  0809 85            	popw	x
2999                     ; 1112 	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
3001  080a 4b00          	push	#0
3002  080c 4b08          	push	#8
3003  080e ae500a        	ldw	x,#20490
3004  0811 cd0000        	call	_GPIO_Init
3006  0814 85            	popw	x
3007                     ; 1114 }
3010  0815 81            	ret	
3011  0816               LC034:
3012  0816 4b00          	push	#0
3013  0818 4b08          	push	#8
3014  081a ae500f        	ldw	x,#20495
3015  081d cd0000        	call	_GPIO_Init
3017  0820 85            	popw	x
3018  0821 81            	ret	
3045                     ; 1118 void Timer4_Config(void)
3045                     ; 1119 {
3046                     	switch	.text
3047  0822               L5_Timer4_Config:
3051                     ; 1120   TIM4_DeInit();
3053  0822 cd0000        	call	_TIM4_DeInit
3055                     ; 1126 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
3057  0825 ae0432        	ldw	x,#1074
3058  0828 cd0000        	call	_TIM4_TimeBaseInit
3060                     ; 1130   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
3062  082b ae0101        	ldw	x,#257
3063  082e cd0000        	call	_TIM4_ITConfig
3065                     ; 1133   TIM4_Cmd(ENABLE);
3067  0831 a601          	ld	a,#1
3069                     ; 1134 }
3072  0833 cc0000        	jp	_TIM4_Cmd
3100                     ; 1137 static void Adc_Config( void )
3100                     ; 1138 {
3101                     	switch	.text
3102  0836               L3_Adc_Config:
3106                     ; 1140 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
3108  0836 cd0000        	call	_ADC1_GetConversionValue
3110  0839 b615          	ld	a,_Adc+10
3111  083b 905f          	clrw	y
3112  083d 9097          	ld	yl,a
3113  083f 9058          	sllw	y
3114  0841 90ef0b        	ldw	(_Adc,y),x
3115                     ; 1142 	ADC1_DeInit( );
3117  0844 cd0000        	call	_ADC1_DeInit
3119                     ; 1144 	switch (Adc.Idx)
3121  0847 b615          	ld	a,_Adc+10
3123                     ; 1178 			break;
3124  0849 270e          	jreq	L3501
3125  084b 4a            	dec	a
3126  084c 2725          	jreq	L5501
3127  084e 4a            	dec	a
3128  084f 273c          	jreq	L7501
3129  0851 4a            	dec	a
3130  0852 2753          	jreq	L1601
3131  0854 4a            	dec	a
3132  0855 276a          	jreq	L3601
3133                     ; 1176 		default:
3133                     ; 1177 			Adc.Idx = 0;
3134                     ; 1178 			break;
3136  0857 207c          	jp	LC035
3137  0859               L3501:
3138                     ; 1146 		case 0:
3138                     ; 1147 		  
3138                     ; 1148 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
3138                     ; 1149 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
3140  0859 4b00          	push	#0
3141  085b 4b03          	push	#3
3142  085d 4b08          	push	#8
3143  085f 4b00          	push	#0
3144  0861 4b00          	push	#0
3145  0863 4b00          	push	#0
3146  0865 ae0003        	ldw	x,#3
3147  0868 cd0000        	call	_ADC1_Init
3149  086b 5b06          	addw	sp,#6
3150                     ; 1150 			Adc.Idx = 1;
3152  086d 35010015      	mov	_Adc+10,#1
3153                     ; 1151 			break;
3155  0871 2064          	jra	L1011
3156  0873               L5501:
3157                     ; 1152 		case 1:
3157                     ; 1153 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
3157                     ; 1154 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
3159  0873 4b00          	push	#0
3160  0875 4b04          	push	#4
3161  0877 4b08          	push	#8
3162  0879 4b00          	push	#0
3163  087b 4b00          	push	#0
3164  087d 4b00          	push	#0
3165  087f ae0004        	ldw	x,#4
3166  0882 cd0000        	call	_ADC1_Init
3168  0885 5b06          	addw	sp,#6
3169                     ; 1155 			Adc.Idx = 2;
3171  0887 35020015      	mov	_Adc+10,#2
3172                     ; 1156 			break;
3174  088b 204a          	jra	L1011
3175  088d               L7501:
3176                     ; 1158 		case 2:
3176                     ; 1159 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_5, ADC1_PRESSEL_FCPU_D2, 
3176                     ; 1160 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3178  088d 4b00          	push	#0
3179  088f 4b02          	push	#2
3180  0891 4b08          	push	#8
3181  0893 4b00          	push	#0
3182  0895 4b00          	push	#0
3183  0897 4b00          	push	#0
3184  0899 ae0005        	ldw	x,#5
3185  089c cd0000        	call	_ADC1_Init
3187  089f 5b06          	addw	sp,#6
3188                     ; 1161 			Adc.Idx = 3;
3190  08a1 35030015      	mov	_Adc+10,#3
3191                     ; 1162 			break;
3193  08a5 2030          	jra	L1011
3194  08a7               L1601:
3195                     ; 1164 		case 3:
3195                     ; 1165 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_6, ADC1_PRESSEL_FCPU_D2, 
3195                     ; 1166 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3197  08a7 4b00          	push	#0
3198  08a9 4b02          	push	#2
3199  08ab 4b08          	push	#8
3200  08ad 4b00          	push	#0
3201  08af 4b00          	push	#0
3202  08b1 4b00          	push	#0
3203  08b3 ae0006        	ldw	x,#6
3204  08b6 cd0000        	call	_ADC1_Init
3206  08b9 5b06          	addw	sp,#6
3207                     ; 1167 			Adc.Idx = 4;
3209  08bb 35040015      	mov	_Adc+10,#4
3210                     ; 1168 			break;	
3212  08bf 2016          	jra	L1011
3213  08c1               L3601:
3214                     ; 1170 		case 4:
3214                     ; 1171 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
3214                     ; 1172 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3216  08c1 4b00          	push	#0
3217  08c3 4b02          	push	#2
3218  08c5 4b08          	push	#8
3219  08c7 4b00          	push	#0
3220  08c9 4b00          	push	#0
3221  08cb 4b00          	push	#0
3222  08cd ae0002        	ldw	x,#2
3223  08d0 cd0000        	call	_ADC1_Init
3225  08d3 5b06          	addw	sp,#6
3226                     ; 1173 			Adc.Idx = 0;
3228  08d5               LC035:
3230  08d5 3f15          	clr	_Adc+10
3231                     ; 1174 			break;	
3233  08d7               L1011:
3234                     ; 1181 		ADC1_StartConversion();		
3237                     ; 1182 }
3240  08d7 cc0000        	jp	_ADC1_StartConversion
3284                     ; 1197 void assert_failed(u8* file, u32 line)
3284                     ; 1198 {
3285                     	switch	.text
3286  08da               _assert_failed:
3288  08da 88            	push	a
3289       00000001      OFST:	set	1
3292  08db               L5211:
3293                     ; 1207 	i = i++;
3295  08db 0c01          	inc	(OFST+0,sp)
3297  08dd 6b01          	ld	(OFST+0,sp),a
3300  08df 20fa          	jra	L5211
3829                     	xdef	_MotorClose
3830                     	xdef	_MotorStep
3831                     	xdef	_StopDrive
3832                     	xdef	_OnTimer_1mS
3833                     	xdef	_OnTimer_1S
3834                     	xdef	_main
3835                     	xdef	_MotorService
3836                     	xdef	_AdcService
3837                     	xdef	_LedService
3838                     	xdef	_SAbs
3839                     	xdef	_Diff
3840                     	xdef	_Gpio_Config
3841                     	xdef	_Clock_Config
3842                     	xdef	_OnTimer4
3843                     	xdef	_Interval
3844                     	xdef	_StartDriveOR
3845                     	xdef	_DriveService
3846                     	xdef	_Excitation_2Phase
3847                     	xdef	_Excitation_12Phase
3848                     	xdef	_Excitation_1Phase
3849                     	xdef	_CPulse
3850                     	xdef	_CStep
3851                     	xdef	_PowerDelay_1mS
3852                     	switch	.ubsct
3853  0000               _Timer:
3854  0000 000000000000  	ds.b	11
3855                     	xdef	_Timer
3856  000b               _Adc:
3857  000b 000000000000  	ds.b	20
3858                     	xdef	_Adc
3859  001f               _My:
3860  001f 000000000000  	ds.b	15
3861                     	xdef	_My
3862  002e               _Drive:
3863  002e 000000000000  	ds.b	27
3864                     	xdef	_Drive
3865                     	xdef	_TableInterval
3866  0049               _ledint:
3867  0049 0000          	ds.b	2
3868                     	xdef	_ledint
3869  004b               _Ticks_S:
3870  004b 0000          	ds.b	2
3871                     	xdef	_Ticks_S
3872  004d               _Ticks_1mS:
3873  004d 0000          	ds.b	2
3874                     	xdef	_Ticks_1mS
3875  004f               _Ticks_50uS:
3876  004f 00            	ds.b	1
3877                     	xdef	_Ticks_50uS
3878                     	xdef	_PeriodNumber
3879  0050               _Counter:
3880  0050 0000          	ds.b	2
3881                     	xdef	_Counter
3882                     	xdef	_assert_failed
3883                     	xref	_TIM4_ITConfig
3884                     	xref	_TIM4_Cmd
3885                     	xref	_TIM4_TimeBaseInit
3886                     	xref	_TIM4_DeInit
3887                     	xref	_GPIO_ReadInputPin
3888                     	xref	_GPIO_WriteReverse
3889                     	xref	_GPIO_WriteLow
3890                     	xref	_GPIO_WriteHigh
3891                     	xref	_GPIO_Init
3892                     	xref	_CLK_SYSCLKConfig
3893                     	xref	_CLK_HSIPrescalerConfig
3894                     	xref	_CLK_LSICmd
3895                     	xref	_CLK_HSICmd
3896                     	xref	_CLK_HSECmd
3897                     	xref	_CLK_DeInit
3898                     	xref	_ADC1_GetConversionValue
3899                     	xref	_ADC1_StartConversion
3900                     	xref	_ADC1_Init
3901                     	xref	_ADC1_DeInit
3902                     	xref.b	c_lreg
3903                     	xref.b	c_x
3904                     	xref.b	c_y
3924                     	xref	c_ludv
3925                     	xref	c_ladc
3926                     	xref	c_umul
3927                     	xref	c_ladd
3928                     	xref	c_lsub
3929                     	xref	c_ltor
3930                     	xref	c_lcmp
3931                     	xref	c_rtol
3932                     	xref	c_uitolx
3933                     	xref	c_imul
3934                     	end
