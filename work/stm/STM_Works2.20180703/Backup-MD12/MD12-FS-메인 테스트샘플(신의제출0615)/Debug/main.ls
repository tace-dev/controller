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
 118                     ; 232 	My.GearRatio100 = 287u;		//  	4096 * 325/360 * 15.54 20180605
 120  0006 ae011f        	ldw	x,#287
 121  0009 bf2b          	ldw	_My+12,x
 122                     ; 234 	My.Mode = 0;
 124  000b 3f2a          	clr	_My+11
 125                     ; 236 	Clock_Config();
 127  000d cd0700        	call	_Clock_Config
 129                     ; 237 	Gpio_Config();
 131  0010 cd0719        	call	_Gpio_Config
 133                     ; 239 	Timer4_Config();
 135  0013 cd080a        	call	L5_Timer4_Config
 137                     ; 241 	Adc.Idx = 2;
 139  0016 35020015      	mov	_Adc+10,#2
 140                     ; 242 	Adc.IdxAvg = 0;
 142  001a 3f1b          	clr	_Adc+16
 143                     ; 243 	Adc.Average = 0;
 145  001c 3f1c          	clr	_Adc+17
 146                     ; 244 	Adc.Sum = 0;
 148  001e 5f            	clrw	x
 149  001f bf1d          	ldw	_Adc+18,x
 150                     ; 245 	Adc_Config(  );
 152  0021 cd081e        	call	L3_Adc_Config
 154                     ; 251 	Drive.NormalOpen = 1;
 156  0024 35010044      	mov	_Drive+22,#1
 157                     ; 252 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 159  0028 ae012c        	ldw	x,#300
 160  002b bf39          	ldw	_Drive+11,x
 161                     ; 254 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 163  002d bf40          	ldw	_Drive+18,x
 164                     ; 258 	Drive.ExcitationType = 1;		//	1-2 excition
 166  002f 35010042      	mov	_Drive+20,#1
 167                     ; 260 	Drive.Interval = 16u;			//	20180225
 169  0033 3510003e      	mov	_Drive+16,#16
 170                     ; 261 	Drive.DiffStep = 1;
 172  0037 35010047      	mov	_Drive+25,#1
 173                     ; 262 	Drive.Enabled = ENABLED;
 175  003b 7210002e      	bset	_Drive,#0
 176                     ; 263 	Drive.Stage = 0;		// Charging
 178  003f 3f48          	clr	_Drive+26
 179                     ; 265 	My.BoostEnable = 0;
 181  0041 7211002d      	bres	_My+14,#0
 182                     ; 266 	My.ChargeOn = 0;
 184  0045 7213002d      	bres	_My+14,#1
 185                     ; 269 	enableInterrupts();
 188  0049 9a            	rim	
 192  004a               L53:
 193                     ; 271   while ( Ticks_1mS < PowerDelay_1mS )
 195  004a b613          	ld	a,_PowerDelay_1mS
 196  004c 5f            	clrw	x
 197  004d 97            	ld	xl,a
 198  004e bf00          	ldw	c_x,x
 199  0050 be4d          	ldw	x,_Ticks_1mS
 200  0052 b300          	cpw	x,c_x
 201  0054 25f4          	jrult	L53
 202                     ; 274 	GPIO_WriteLow(_LED_PORT, _LED_PIN);
 204  0056 4b10          	push	#16
 205  0058 ae5005        	ldw	x,#20485
 206  005b cd0000        	call	_GPIO_WriteLow
 208  005e be4d          	ldw	x,_Ticks_1mS
 209  0060 bf00          	ldw	_Timer,x
 210  0062 bf02          	ldw	_Timer+2,x
 211  0064 bf04          	ldw	_Timer+4,x
 212  0066 bf06          	ldw	_Timer+6,x
 213  0068 ae07d0        	ldw	x,#2000
 214  006b bf49          	ldw	_ledint,x
 215  006d 84            	pop	a
 216                     ; 296 	Timer.Led = Ticks_1mS;
 218                     ; 297 	Timer.Motor = Ticks_1mS;
 220                     ; 298 	Timer.Adc = Ticks_1mS;
 222                     ; 299   Timer.Boost = Ticks_1mS;
 224                     ; 301 	ledint = 2000u;
 226  006e               L14:
 227                     ; 305 		t = Ticks_1mS;
 229  006e be4d          	ldw	x,_Ticks_1mS
 230  0070 1f01          	ldw	(OFST-1,sp),x
 232                     ; 307 		LedService();
 234  0072 cd01eb        	call	_LedService
 236                     ; 308 		AdcService();
 238  0075 cd019b        	call	_AdcService
 240                     ; 310 		if ( Drive.Stage == 0 )	//	Charging
 242  0078 b648          	ld	a,_Drive+26
 243  007a 2636          	jrne	L54
 244                     ; 312 			ledint = 1000u;
 246  007c ae03e8        	ldw	x,#1000
 247  007f bf49          	ldw	_ledint,x
 248                     ; 319 				if (Adc.Value[2] > 850)		//	 Charging then goto origin
 250  0081 be0f          	ldw	x,_Adc+4
 251  0083 a30353        	cpw	x,#851
 252  0086 2403cc014b    	jrult	L111
 253                     ; 321 					ledint = 1000u;
 255  008b ae03e8        	ldw	x,#1000
 256  008e bf49          	ldw	_ledint,x
 257                     ; 322 					Drive.Stage = 1;
 259  0090 35010048      	mov	_Drive+26,#1
 260                     ; 323 					if ( Drive.Origin ) 
 262  0094 b643          	ld	a,_Drive+21
 263  0096 2706          	jreq	L15
 264                     ; 325 						Drive.Position = 0;
 266  0098 5f            	clrw	x
 267  0099 bf2f          	ldw	_Drive+1,x
 269  009b cc014b        	jra	L111
 270  009e               L15:
 271                     ; 329 						Drive.Position = CPulse(210u);
 273  009e ae00d2        	ldw	x,#210
 274  00a1 cd06ee        	call	_CPulse
 276  00a4 bf2f          	ldw	_Drive+1,x
 277                     ; 330 						Drive.ExcitationType = 0;		//	1 excition
 279  00a6 3f42          	clr	_Drive+20
 280                     ; 332 						StartDriveOR( 0u, 0u  );				// Goto Zero position
 282  00a8 4b00          	push	#0
 283  00aa 5f            	clrw	x
 284  00ab cd0361        	call	_StartDriveOR
 286  00ae 84            	pop	a
 287  00af cc014b        	jra	L111
 288  00b2               L54:
 289                     ; 337 		else if ( Drive.Stage == 1 )	// Initializing
 291  00b2 a101          	cp	a,#1
 292  00b4 261b          	jrne	L75
 293                     ; 339 			if (My.BoostEnable == 1)
 295  00b6 7201002d06    	btjf	_My+14,#0,L16
 296                     ; 341 				Drive.Stop = 1;	
 298  00bb 7216002e      	bset	_Drive,#3
 299                     ; 342 				Drive.Stage = 0;				
 301  00bf 207c          	jp	LC001
 302  00c1               L16:
 303                     ; 346 				if ( !Drive.Run )		//	Origin
 305  00c1 7202002ee9    	btjt	_Drive,#1,L111
 306                     ; 348 					ledint = 500u;
 308  00c6 ae01f4        	ldw	x,#500
 309  00c9 bf49          	ldw	_ledint,x
 310                     ; 349 					Drive.Stage = 2;
 312  00cb 35020048      	mov	_Drive+26,#2
 313  00cf 207a          	jra	L111
 314  00d1               L75:
 315                     ; 353 		else if ( Drive.Stage == 2 )	//	Running with Power On
 317  00d1 a102          	cp	a,#2
 318  00d3 265a          	jrne	L17
 319                     ; 355 			if (My.BoostEnable == 1)
 321  00d5 7201002d33    	btjf	_My+14,#0,L37
 322                     ; 357 				if ( Drive.Run )
 324  00da 7203002e0a    	btjf	_Drive,#1,L57
 325                     ; 359 					Drive.Stop = 1;	
 327  00df 7216002e      	bset	_Drive,#3
 328                     ; 360 					Timer.Motor = Ticks_1mS;					
 330  00e3 be4d          	ldw	x,_Ticks_1mS
 331  00e5 bf02          	ldw	_Timer+2,x
 333  00e7 2062          	jra	L111
 334  00e9               L57:
 335                     ; 364 					if ( Diff ( Timer.Motor, 100u ) )
 337  00e9 ae0064        	ldw	x,#100
 338  00ec 89            	pushw	x
 339  00ed be02          	ldw	x,_Timer+2
 340  00ef cd0216        	call	_Diff
 342  00f2 4d            	tnz	a
 343  00f3 85            	popw	x
 344  00f4 2755          	jreq	L111
 345                     ; 366 						ledint = 125u;
 347  00f6 ae007d        	ldw	x,#125
 348  00f9 bf49          	ldw	_ledint,x
 349                     ; 367 						Drive.Stage = 3;
 351  00fb 35030048      	mov	_Drive+26,#3
 352                     ; 369 						Drive.ExcitationType = 1;		//	1 excition
 354  00ff 35010042      	mov	_Drive+20,#1
 355                     ; 370 						Drive.Interval = 19u;			//	20180615
 357  0103 3513003e      	mov	_Drive+16,#19
 358                     ; 373 						Drive.Step = 0u;		//((u16)Adc.Average * 100 )/110; 
 360  0107 3f45          	clr	_Drive+23
 361                     ; 374 						MotorService();
 363  0109 ad50          	call	_MotorService
 365  010b 203e          	jra	L111
 366  010d               L37:
 367                     ; 381 				if ( Diff ( Timer.Motor, 500u ) )
 369  010d ae01f4        	ldw	x,#500
 370  0110 89            	pushw	x
 371  0111 be02          	ldw	x,_Timer+2
 372  0113 cd0216        	call	_Diff
 374  0116 4d            	tnz	a
 375  0117 85            	popw	x
 376  0118 2731          	jreq	L111
 377                     ; 383 					Drive.Step = ((u16)Adc.Average * 100 )/109; 
 379  011a b61c          	ld	a,_Adc+17
 380  011c 5f            	clrw	x
 381  011d 97            	ld	xl,a
 382  011e 90ae0064      	ldw	y,#100
 383  0122 cd0000        	call	c_imul
 385  0125 a66d          	ld	a,#109
 386  0127 62            	div	x,a
 387  0128 01            	rrwa	x,a
 388  0129 b745          	ld	_Drive+23,a
 389                     ; 384 					MotorService();
 391  012b ad2e          	call	_MotorService
 393  012d 201c          	jra	L111
 394  012f               L17:
 395                     ; 389 		else if ( Drive.Stage == 3 )	//	Running with Power Off
 397  012f a103          	cp	a,#3
 398  0131 2618          	jrne	L111
 399                     ; 391 			if (My.BoostEnable == 0 /*&& !Drive.Run*/ )
 401  0133 7200002d09    	btjt	_My+14,#0,L311
 402                     ; 393 				ledint = 500u;
 404  0138 ae01f4        	ldw	x,#500
 405  013b bf49          	ldw	_ledint,x
 406                     ; 394 				Drive.Stage = 0;
 408  013d               LC001:
 410  013d 3f48          	clr	_Drive+26
 412  013f 200a          	jra	L111
 413  0141               L311:
 414                     ; 413 				if ( !Drive.Run )
 416  0141 7202002e05    	btjt	_Drive,#1,L111
 417                     ; 415 					ledint = 2000u;
 419  0146 ae07d0        	ldw	x,#2000
 420  0149 bf49          	ldw	_ledint,x
 421  014b               L111:
 422                     ; 421 		else if ( Drive.Stage == 4 )	//	wait
 424                     ; 427 		while ( Diff ( t, 10u ) )
 426  014b ae000a        	ldw	x,#10
 427  014e 89            	pushw	x
 428  014f 1e03          	ldw	x,(OFST+1,sp)
 429  0151 cd0216        	call	_Diff
 431  0154 4d            	tnz	a
 432  0155 85            	popw	x
 433  0156 26f3          	jrne	L111
 434                     ; 431 			;
 436  0158 cc006e        	jra	L14
 465                     ; 437 void MotorService()
 465                     ; 438 {
 466                     	switch	.text
 467  015b               _MotorService:
 471                     ; 444 			if ( Drive.Step > 210u )
 473  015b b645          	ld	a,_Drive+23
 474  015d a1d3          	cp	a,#211
 475  015f 2504          	jrult	L341
 476                     ; 445 				Drive.Step = 210u;
 478  0161 a6d2          	ld	a,#210
 479  0163 b745          	ld	_Drive+23,a
 480  0165               L341:
 481                     ; 446 			if ( Drive.Step < 20u )
 483  0165 a114          	cp	a,#20
 484  0167 2402          	jruge	L541
 485                     ; 447 				Drive.Step = 0u;
 487  0169 3f45          	clr	_Drive+23
 488  016b               L541:
 489                     ; 455 			if  ( SAbs( Drive.Step ,Drive.PreStep ) > 1  )
 491  016b b646          	ld	a,_Drive+24
 492  016d 97            	ld	xl,a
 493  016e b645          	ld	a,_Drive+23
 494  0170 95            	ld	xh,a
 495  0171 cd0204        	call	_SAbs
 497  0174 a102          	cp	a,#2
 498  0176 b645          	ld	a,_Drive+23
 499  0178 250b          	jrult	L741
 500                     ; 457 				if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
 502                     ; 461 						Drive.PreStep = Drive.Step;
 503                     ; 462 						StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 507                     ; 474 					Drive.PreStep = Drive.Step;
 509                     ; 475 					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );					
 512  017a b746          	ld	_Drive+24,a
 514  017c 4b00          	push	#0
 515  017e 5f            	clrw	x
 516  017f 97            	ld	xl,a
 517  0180 cd06ee        	call	_CPulse
 520  0183 200d          	jp	LC002
 521  0185               L741:
 522                     ; 479 				if ( Drive.Step == 0 && !Drive.Run  )
 524  0185 260f          	jrne	L551
 526  0187 7202002e0a    	btjt	_Drive,#1,L551
 527                     ; 481 					Drive.PreStep = Drive.Step;
 529  018c 454546        	mov	_Drive+24,_Drive+23
 530                     ; 482 					StartDriveOR( 0u , 0u );	//Drive.Step, 0u  );					
 532  018f 4b00          	push	#0
 533  0191 5f            	clrw	x
 535  0192               LC002:
 536  0192 cd0361        	call	_StartDriveOR
 537  0195 84            	pop	a
 538  0196               L551:
 539                     ; 485 			Timer.Motor = Ticks_1mS;
 541  0196 be4d          	ldw	x,_Ticks_1mS
 542  0198 bf02          	ldw	_Timer+2,x
 543                     ; 487 	}
 546  019a 81            	ret	
 573                     ; 491 void AdcService()
 573                     ; 492 {
 574                     	switch	.text
 575  019b               _AdcService:
 579                     ; 493 	if ( Diff ( Timer.Adc, 10u ) )
 581  019b ae000a        	ldw	x,#10
 582  019e 89            	pushw	x
 583  019f be04          	ldw	x,_Timer+4
 584  01a1 ad73          	call	_Diff
 586  01a3 4d            	tnz	a
 587  01a4 85            	popw	x
 588  01a5 2743          	jreq	L171
 589                     ; 495 			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
 591  01a7 b61b          	ld	a,_Adc+16
 592  01a9 5f            	clrw	x
 593  01aa 97            	ld	xl,a
 594  01ab e616          	ld	a,(_Adc+11,x)
 595  01ad 5f            	clrw	x
 596  01ae 97            	ld	xl,a
 597  01af 72b0001d      	subw	x,_Adc+18
 598  01b3 50            	negw	x
 599  01b4 bf1d          	ldw	_Adc+18,x
 600                     ; 496 			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
 602  01b6 be0b          	ldw	x,_Adc
 603  01b8 54            	srlw	x
 604  01b9 54            	srlw	x
 605  01ba b61b          	ld	a,_Adc+16
 606  01bc 905f          	clrw	y
 607  01be 9097          	ld	yl,a
 608  01c0 01            	rrwa	x,a
 609  01c1 90e716        	ld	(_Adc+11,y),a
 610                     ; 497 			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
 612  01c4 5f            	clrw	x
 613  01c5 b61b          	ld	a,_Adc+16
 614  01c7 97            	ld	xl,a
 615  01c8 e616          	ld	a,(_Adc+11,x)
 616  01ca bb1e          	add	a,_Adc+19
 617  01cc b71e          	ld	_Adc+19,a
 618  01ce 2402          	jrnc	L46
 619  01d0 3c1d          	inc	_Adc+18
 620  01d2               L46:
 621                     ; 498 			Adc.Average = Adc.Sum /5;
 623  01d2 be1d          	ldw	x,_Adc+18
 624  01d4 a605          	ld	a,#5
 625  01d6 62            	div	x,a
 626  01d7 01            	rrwa	x,a
 627  01d8 b71c          	ld	_Adc+17,a
 628                     ; 499 			if  (Adc.IdxAvg	>= 4 )
 630  01da b61b          	ld	a,_Adc+16
 631  01dc a104          	cp	a,#4
 632  01de 2504          	jrult	L371
 633                     ; 500 				Adc.IdxAvg = 0;
 635  01e0 3f1b          	clr	_Adc+16
 637  01e2 2002          	jra	L571
 638  01e4               L371:
 639                     ; 502 				Adc.IdxAvg++;
 641  01e4 3c1b          	inc	_Adc+16
 642  01e6               L571:
 643                     ; 504 			Timer.Adc = Ticks_1mS;
 645  01e6 be4d          	ldw	x,_Ticks_1mS
 646  01e8 bf04          	ldw	_Timer+4,x
 647  01ea               L171:
 648                     ; 506 }
 651  01ea 81            	ret	
 679                     ; 508 void LedService()
 679                     ; 509 {
 680                     	switch	.text
 681  01eb               _LedService:
 685                     ; 522 		if ( Diff ( Timer.Led, ledint ) )
 687  01eb be49          	ldw	x,_ledint
 688  01ed 89            	pushw	x
 689  01ee be00          	ldw	x,_Timer
 690  01f0 ad24          	call	_Diff
 692  01f2 4d            	tnz	a
 693  01f3 85            	popw	x
 694  01f4 270d          	jreq	L702
 695                     ; 524 			Timer.Led = Ticks_1mS;
 697  01f6 be4d          	ldw	x,_Ticks_1mS
 698  01f8 bf00          	ldw	_Timer,x
 699                     ; 525 			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
 701  01fa 4b10          	push	#16
 702  01fc ae5005        	ldw	x,#20485
 703  01ff cd0000        	call	_GPIO_WriteReverse
 705  0202 84            	pop	a
 706  0203               L702:
 707                     ; 527 }
 710  0203 81            	ret	
 753                     ; 529 u8 SAbs(u8 s1, u8 s2)
 753                     ; 530 {
 754                     	switch	.text
 755  0204               _SAbs:
 757  0204 89            	pushw	x
 758       00000000      OFST:	set	0
 761                     ; 531 	if (s1 > s2 )
 763  0205 9f            	ld	a,xl
 764  0206 1101          	cp	a,(OFST+1,sp)
 765  0208 2406          	jruge	L332
 766                     ; 532 		return s1 - s2;
 768  020a 9f            	ld	a,xl
 769  020b 1001          	sub	a,(OFST+1,sp)
 770  020d 40            	neg	a
 772  020e 2004          	jra	L67
 773  0210               L332:
 774                     ; 534 		return s2 - s1;
 776  0210 7b02          	ld	a,(OFST+2,sp)
 777  0212 1001          	sub	a,(OFST+1,sp)
 779  0214               L67:
 781  0214 85            	popw	x
 782  0215 81            	ret	
 835                     ; 538 u8  Diff( u16 time, u16 diff )
 835                     ; 539 {
 836                     	switch	.text
 837  0216               _Diff:
 839  0216 89            	pushw	x
 840  0217 520c          	subw	sp,#12
 841       0000000c      OFST:	set	12
 844                     ; 541 	t = Ticks_1mS;
 846  0219 be4d          	ldw	x,_Ticks_1mS
 847  021b cd0000        	call	c_uitolx
 849  021e 96            	ldw	x,sp
 850  021f 1c0009        	addw	x,#OFST-3
 851  0222 cd0000        	call	c_rtol
 854                     ; 543 	if (time <= t )
 856  0225 1e0d          	ldw	x,(OFST+1,sp)
 857  0227 cd0000        	call	c_uitolx
 859  022a 96            	ldw	x,sp
 860  022b 1c0009        	addw	x,#OFST-3
 861  022e cd0000        	call	c_lcmp
 863  0231 222f          	jrugt	L562
 864                     ; 545 		if ( ( t - time ) > diff ) 
 866  0233 1e0d          	ldw	x,(OFST+1,sp)
 867  0235 cd0000        	call	c_uitolx
 869  0238 96            	ldw	x,sp
 870  0239 1c0005        	addw	x,#OFST-7
 871  023c cd0000        	call	c_rtol
 874  023f 96            	ldw	x,sp
 875  0240 1c0009        	addw	x,#OFST-3
 876  0243 cd0000        	call	c_ltor
 878  0246 96            	ldw	x,sp
 879  0247 1c0005        	addw	x,#OFST-7
 880  024a cd0000        	call	c_lsub
 882  024d 96            	ldw	x,sp
 883  024e 5c            	incw	x
 884  024f cd0000        	call	c_rtol
 887  0252 1e11          	ldw	x,(OFST+5,sp)
 888  0254 cd0000        	call	c_uitolx
 890  0257 96            	ldw	x,sp
 891  0258 5c            	incw	x
 892  0259 cd0000        	call	c_lcmp
 894                     ; 546 			return 1;
 896  025c 2537          	jrult	LC005
 897  025e               L762:
 898                     ; 548 			return 0;
 901  025e 4f            	clr	a
 903  025f               L201:
 905  025f 5b0e          	addw	sp,#14
 906  0261 81            	ret	
 907  0262               L562:
 908                     ; 552 		if ( ( 65535 - time + t  ) > diff ) 
 910  0262 1e0d          	ldw	x,(OFST+1,sp)
 911  0264 cd0000        	call	c_uitolx
 913  0267 96            	ldw	x,sp
 914  0268 1c0005        	addw	x,#OFST-7
 915  026b cd0000        	call	c_rtol
 918  026e aeffff        	ldw	x,#65535
 919  0271 bf02          	ldw	c_lreg+2,x
 920  0273 5f            	clrw	x
 921  0274 bf00          	ldw	c_lreg,x
 922  0276 96            	ldw	x,sp
 923  0277 1c0005        	addw	x,#OFST-7
 924  027a cd0000        	call	c_lsub
 926  027d 96            	ldw	x,sp
 927  027e 1c0009        	addw	x,#OFST-3
 928  0281 cd0000        	call	c_ladd
 930  0284 96            	ldw	x,sp
 931  0285 5c            	incw	x
 932  0286 cd0000        	call	c_rtol
 935  0289 1e11          	ldw	x,(OFST+5,sp)
 936  028b cd0000        	call	c_uitolx
 938  028e 96            	ldw	x,sp
 939  028f 5c            	incw	x
 940  0290 cd0000        	call	c_lcmp
 942  0293 24c9          	jruge	L762
 943                     ; 553 			return 1;
 945  0295               LC005:
 947  0295 a601          	ld	a,#1
 949  0297 20c6          	jra	L201
 950                     ; 555 			return 0;
 974                     ; 559 void OnTimer_1S(void)
 974                     ; 560 {
 975                     	switch	.text
 976  0299               _OnTimer_1S:
 980                     ; 562 }
 983  0299 81            	ret	
1008                     ; 567 OnTimer_1mS(void)
1008                     ; 568 { 	
1009                     	switch	.text
1010  029a               _OnTimer_1mS:
1014                     ; 569 	Ticks_1mS++;
1016  029a be4d          	ldw	x,_Ticks_1mS
1017  029c 5c            	incw	x
1018  029d bf4d          	ldw	_Ticks_1mS,x
1019                     ; 573 	if ( PowerDelay_1mS )
1021  029f b613          	ld	a,_PowerDelay_1mS
1022  02a1 2702          	jreq	L123
1023                     ; 574 		PowerDelay_1mS--;
1025  02a3 3a13          	dec	_PowerDelay_1mS
1026  02a5               L123:
1027                     ; 575 }
1030  02a5 81            	ret	
1063                     ; 578 void OnTimer4(void)
1063                     ; 579 {
1064                     	switch	.text
1065  02a6               _OnTimer4:
1069                     ; 580 	Ticks_50uS++;
1071  02a6 3c4f          	inc	_Ticks_50uS
1072                     ; 582 	Adc_Config( );
1074  02a8 cd081e        	call	L3_Adc_Config
1076                     ; 584 	if ( My.BoostEnable == 0 && Adc.Value[3] < 20 )	//		Power off
1078  02ab 7200002d0d    	btjt	_My+14,#0,L333
1080  02b0 be11          	ldw	x,_Adc+6
1081  02b2 a30014        	cpw	x,#20
1082  02b5 2406          	jruge	L333
1083                     ; 587 		My.BoostEnable = 1;
1085  02b7 7210002d      	bset	_My+14,#0
1087  02bb 2010          	jra	L533
1088  02bd               L333:
1089                     ; 589 	else if ( My.BoostEnable == 1 &&  Adc.Value[3] >800 )
1091  02bd 7201002d0b    	btjf	_My+14,#0,L533
1093  02c2 be11          	ldw	x,_Adc+6
1094  02c4 a30321        	cpw	x,#801
1095  02c7 2504          	jrult	L533
1096                     ; 592 		My.BoostEnable = 0;
1098  02c9 7211002d      	bres	_My+14,#0
1099  02cd               L533:
1100                     ; 596 	if ( Ticks_50uS == 5 )
1102  02cd b64f          	ld	a,_Ticks_50uS
1103  02cf a105          	cp	a,#5
1104  02d1 2615          	jrne	L143
1105                     ; 597 		Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
1107  02d3 4b02          	push	#2
1108  02d5 ae5000        	ldw	x,#20480
1109  02d8 cd0000        	call	_GPIO_ReadInputPin
1111  02db 5b01          	addw	sp,#1
1112  02dd 4d            	tnz	a
1113  02de 2603          	jrne	L411
1114  02e0 4c            	inc	a
1115  02e1 2001          	jra	L021
1116  02e3               L411:
1117  02e3 4f            	clr	a
1118  02e4               L021:
1119  02e4 b743          	ld	_Drive+21,a
1121  02e6 2040          	jra	L343
1122  02e8               L143:
1123                     ; 599 		if ( Ticks_50uS == 10 )
1125  02e8 a10a          	cp	a,#10
1126  02ea 2613          	jrne	L543
1127                     ; 600 		{	if ( My.ChargeOn ) 
1129  02ec 7203002d07    	btjf	_My+14,#1,L743
1130                     ; 601 				GPIO_WriteHigh( _CHARGE_ON_PORT, _CHARGE_ON_PIN ); 
1132  02f1 4b10          	push	#16
1133  02f3 ae500f        	ldw	x,#20495
1136  02f6 2015          	jp	LC008
1137  02f8               L743:
1138                     ; 603 				GPIO_WriteLow( _CHARGE_ON_PORT, _CHARGE_ON_PIN );
1140  02f8 4b10          	push	#16
1141  02fa ae500f        	ldw	x,#20495
1143  02fd 2018          	jp	LC007
1144  02ff               L543:
1145                     ; 606 		if ( Ticks_50uS == 15 )
1147  02ff a10f          	cp	a,#15
1148  0301 261a          	jrne	L553
1149                     ; 608 			if ( My.BoostEnable ) 
1151  0303 7201002d0a    	btjf	_My+14,#0,L753
1152                     ; 609 				GPIO_WriteHigh( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
1154  0308 4b08          	push	#8
1155  030a ae5000        	ldw	x,#20480
1156  030d               LC008:
1157  030d cd0000        	call	_GPIO_WriteHigh
1160  0310 2008          	jp	LC006
1161  0312               L753:
1162                     ; 611 				GPIO_WriteLow( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
1164  0312 4b08          	push	#8
1165  0314 ae5000        	ldw	x,#20480
1166  0317               LC007:
1167  0317 cd0000        	call	_GPIO_WriteLow
1169  031a               LC006:
1170  031a 84            	pop	a
1171  031b 200b          	jra	L343
1172  031d               L553:
1173                     ; 614 		if ( Ticks_50uS >= 20 )
1175  031d a114          	cp	a,#20
1176  031f 2507          	jrult	L343
1177                     ; 616 			Ticks_50uS = 0;
1179  0321 3f4f          	clr	_Ticks_50uS
1180                     ; 618 			Ticks_1mS++;
1182  0323 be4d          	ldw	x,_Ticks_1mS
1183  0325 5c            	incw	x
1184  0326 bf4d          	ldw	_Ticks_1mS,x
1185  0328               L343:
1186                     ; 626 	if ( Drive.Ticks > 0 )
1188  0328 b63f          	ld	a,_Drive+17
1189  032a 2702          	jreq	L763
1190                     ; 627 		Drive.Ticks--;
1192  032c 3a3f          	dec	_Drive+17
1193  032e               L763:
1194                     ; 629 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
1196  032e 7201002e08    	btjf	_Drive,#0,L173
1198  0333 2606          	jrne	L173
1199                     ; 631 		DriveService();	
1201  0335 cd0474        	call	_DriveService
1203                     ; 632 		Drive.Ticks = Drive.Interval;
1205  0338 453e3f        	mov	_Drive+17,_Drive+16
1206  033b               L173:
1207                     ; 635 }
1210  033b 81            	ret	
1234                     ; 642 void StopDrive(void)			//TROff()
1234                     ; 643 {	
1235                     	switch	.text
1236  033c               _StopDrive:
1240                     ; 644 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1242  033c 4b80          	push	#128
1243  033e ae500a        	ldw	x,#20490
1244  0341 cd0000        	call	_GPIO_WriteLow
1246  0344 84            	pop	a
1247                     ; 645 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1249  0345 4b20          	push	#32
1250  0347 ae500a        	ldw	x,#20490
1251  034a cd0000        	call	_GPIO_WriteLow
1253  034d 84            	pop	a
1254                     ; 646 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1256  034e 4b40          	push	#64
1257  0350 ae500a        	ldw	x,#20490
1258  0353 cd0000        	call	_GPIO_WriteLow
1260  0356 84            	pop	a
1261                     ; 647 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1263  0357 4b04          	push	#4
1264  0359 ae5000        	ldw	x,#20480
1265  035c cd0000        	call	_GPIO_WriteLow
1267  035f 84            	pop	a
1268                     ; 648 }
1271  0360 81            	ret	
1316                     ; 654 void StartDriveOR( uint16_t Target, uint8_t overrun )
1316                     ; 655 {
1317                     	switch	.text
1318  0361               _StartDriveOR:
1320  0361 89            	pushw	x
1321       00000000      OFST:	set	0
1324                     ; 656 	if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
1326  0362 7203002e20    	btjf	_Drive,#1,L524
1327                     ; 658 		if ( Drive.Dir == 1 && Drive.Position < Target )			// same dir
1329  0367 7209002e04    	btjf	_Drive,#4,L724
1331  036c b32f          	cpw	x,_Drive+1
1332  036e 2217          	jrugt	L524
1334  0370               L724:
1335                     ; 662 		else if ( Drive.Dir == 0 && Drive.Position > Target )
1337  0370 7208002e0c    	btjt	_Drive,#4,L334
1339  0375 be2f          	ldw	x,_Drive+1
1340  0377 1301          	cpw	x,(OFST+1,sp)
1341  0379 2306          	jrule	L334
1342                     ; 664 			if ( Target == 0 )
1344  037b 1e01          	ldw	x,(OFST+1,sp)
1345  037d 2608          	jrne	L524
1346                     ; 665 				return;
1348  037f 2004          	jra	L451
1349  0381               L334:
1350                     ; 669 			Drive.Stop = 1;
1352  0381 7216002e      	bset	_Drive,#3
1353                     ; 670 			return;
1354  0385               L451:
1357  0385 85            	popw	x
1358  0386 81            	ret	
1359  0387               L524:
1360                     ; 677 	Drive.PreStep = Drive.Step;
1362  0387 454546        	mov	_Drive+24,_Drive+23
1363                     ; 680 	if ( Drive.Position == Target ) return;
1365  038a be2f          	ldw	x,_Drive+1
1366  038c 1301          	cpw	x,(OFST+1,sp)
1367  038e 27f5          	jreq	L451
1370                     ; 682 	if ( Target == 0 )				//  goto origin
1372  0390 1e01          	ldw	x,(OFST+1,sp)
1373  0392 260e          	jrne	L344
1374                     ; 684 		Drive.Overrun =	0u;
1376  0394 5f            	clrw	x
1377  0395 bf33          	ldw	_Drive+5,x
1378                     ; 685 		Drive.ZeroOffset = CPulse( OVER_STEP );
1380  0397 ae001e        	ldw	x,#30
1381  039a cd06ee        	call	_CPulse
1383  039d bf36          	ldw	_Drive+8,x
1384                     ; 688 		Drive.Target = 0u;
1386  039f 5f            	clrw	x
1387                     ; 689 		Drive.State = nMotorClose;		// 0;
1389  03a0 2013          	jp	LC009
1390  03a2               L344:
1391                     ; 694 		if (Drive.Position >= Target)		// Closing
1393  03a2 be2f          	ldw	x,_Drive+1
1394  03a4 1301          	cpw	x,(OFST+1,sp)
1395  03a6 2513          	jrult	L744
1396                     ; 696 			Drive.Dir = 0;
1398  03a8 7219002e      	bres	_Drive,#4
1399                     ; 697 			Drive.Overrun =	0u;
1401  03ac 5f            	clrw	x
1402  03ad bf33          	ldw	_Drive+5,x
1403                     ; 698 			Drive.State = nMotorClose;
1405  03af 3f3d          	clr	_Drive+15
1406                     ; 699 			Drive.Overrun2 = 0u;
1408  03b1 3f35          	clr	_Drive+7
1409                     ; 700 			Drive.Target = Target;
1411  03b3 1e01          	ldw	x,(OFST+1,sp)
1412                     ; 701 			Drive.State = nMotorClose;		// 0;
1414  03b5               LC009:
1415  03b5 bf31          	ldw	_Drive+3,x
1417  03b7 3f3d          	clr	_Drive+15
1419  03b9 201b          	jra	L544
1420  03bb               L744:
1421                     ; 705 			Drive.Dir = 1;
1423  03bb 7218002e      	bset	_Drive,#4
1424                     ; 706 			Drive.State = nMotorOpen;	//1;
1426  03bf 3501003d      	mov	_Drive+15,#1
1427                     ; 707 			Drive.Overrun2 = overrun;		//100;
1429  03c3 7b05          	ld	a,(OFST+5,sp)
1430  03c5 b735          	ld	_Drive+7,a
1431                     ; 708 			Drive.Target = Target + overrun;	//100;	
1433  03c7 7b01          	ld	a,(OFST+1,sp)
1434  03c9 97            	ld	xl,a
1435  03ca 7b02          	ld	a,(OFST+2,sp)
1436  03cc 1b05          	add	a,(OFST+5,sp)
1437  03ce 2401          	jrnc	L251
1438  03d0 5c            	incw	x
1439  03d1               L251:
1440  03d1 b732          	ld	_Drive+4,a
1441  03d3 9f            	ld	a,xl
1442  03d4 b731          	ld	_Drive+3,a
1443  03d6               L544:
1444                     ; 712 	Drive.Run = TRUE;
1446  03d6 7212002e      	bset	_Drive,#1
1447                     ; 713 	Drive.Ticks = Drive.Interval;
1449  03da 453e3f        	mov	_Drive+17,_Drive+16
1450                     ; 714 }
1452  03dd 20a6          	jra	L451
1512                     ; 720 void MotorStep(MOTOR_DIR Dir)
1512                     ; 721 {
1513                     	switch	.text
1514  03df               _MotorStep:
1518                     ; 722 	if ( Dir == nMotorClose )
1520  03df 4d            	tnz	a
1521  03e0 2625          	jrne	L705
1522                     ; 724 		if ( Drive.Position != 0 ) 
1524  03e2 be2f          	ldw	x,_Drive+1
1525  03e4 270f          	jreq	LC010
1526                     ; 726 			Drive.Position--;
1528  03e6 5a            	decw	x
1529  03e7 bf2f          	ldw	_Drive+1,x
1530                     ; 727 			if ( Drive.NormalOpen )
1532  03e9 b644          	ld	a,_Drive+22
1533  03eb 2704          	jreq	L315
1534                     ; 728 				Drive.Phase++;   // NC
1536  03ed 3c38          	inc	_Drive+10
1538  03ef 2047          	jra	L325
1539  03f1               L315:
1540                     ; 731 				Drive.Phase--;	//NC
1542  03f1 3a38          	dec	_Drive+10
1543  03f3 2043          	jra	L325
1544                     ; 735 		if ( Drive.Position == 0 ) 
1546  03f5               LC010:
1547                     ; 738 			Drive.Overrun = 0u;
1549  03f5 5f            	clrw	x
1550  03f6 bf33          	ldw	_Drive+5,x
1551                     ; 739 			Drive.Run = FALSE;
1553  03f8 7213002e      	bres	_Drive,#1
1554                     ; 740 			Drive.ZeroOffset = 0u;
1556  03fc bf36          	ldw	_Drive+8,x
1557                     ; 741 			Drive.Position = 0u;
1559  03fe bf2f          	ldw	_Drive+1,x
1560                     ; 742 			Drive.Target = 0u;
1562  0400 bf31          	ldw	_Drive+3,x
1563                     ; 743 			StopDrive();	
1565  0402 cd033c        	call	_StopDrive
1567  0405 2031          	jra	L325
1568  0407               L705:
1569                     ; 749 			Drive.Position++;
1571  0407 be2f          	ldw	x,_Drive+1
1572  0409 5c            	incw	x
1573  040a bf2f          	ldw	_Drive+1,x
1574                     ; 751 		if ( Drive.NormalOpen )
1576  040c b644          	ld	a,_Drive+22
1577  040e 2704          	jreq	L525
1578                     ; 752 				Drive.Phase--;
1580  0410 3a38          	dec	_Drive+10
1582  0412 2002          	jra	L725
1583  0414               L525:
1584                     ; 754 				Drive.Phase++;
1586  0414 3c38          	inc	_Drive+10
1587  0416               L725:
1588                     ; 757 		if ( Drive.Origin ) 
1590  0416 b643          	ld	a,_Drive+21
1591  0418 2708          	jreq	L135
1592                     ; 759 			Drive.ORGPosition = Drive.Position;
1594  041a bf3b          	ldw	_Drive+13,x
1595                     ; 760 			Drive.LastOrigin = TRUE;
1597  041c 7214002e      	bset	_Drive,#2
1599  0420 2016          	jra	L325
1600  0422               L135:
1601                     ; 763 			if ( Drive.LastOrigin )
1603  0422 7205002e11    	btjf	_Drive,#2,L325
1604                     ; 765 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1606  0427 be3b          	ldw	x,_Drive+13
1607  0429 1d0028        	subw	x,#40
1608  042c bf39          	ldw	_Drive+11,x
1609                     ; 766 				if ( Drive.MaxOverrun > OVERRUN )
1611  042e a3012d        	cpw	x,#301
1612  0431 2505          	jrult	L325
1613                     ; 767 					Drive.MaxOverrun = OVERRUN;				
1615  0433 ae012c        	ldw	x,#300
1616  0436 bf39          	ldw	_Drive+11,x
1617  0438               L325:
1618                     ; 772 	if ( !Drive.Run ) return;
1620  0438 7202002e01    	btjt	_Drive,#1,L145
1624  043d 81            	ret	
1625  043e               L145:
1626                     ; 773 	if ( !Drive.Enabled ) return;
1628  043e 7200002e01    	btjt	_Drive,#0,L345
1632  0443 81            	ret	
1633  0444               L345:
1634                     ; 774 	switch ( Drive.ExcitationType )
1636  0444 b642          	ld	a,_Drive+20
1638                     ; 785 			break;
1639  0446 2707          	jreq	L354
1640  0448 4a            	dec	a
1641  0449 2707          	jreq	L554
1642  044b 4a            	dec	a
1643  044c 2707          	jreq	L754
1645  044e 81            	ret	
1646  044f               L354:
1647                     ; 777 		case 0:
1647                     ; 778 			Excitation_1Phase();	
1650                     ; 779 			break;
1653  044f cc0628        	jp	_Excitation_1Phase
1654  0452               L554:
1655                     ; 780 		case 1:
1655                     ; 781 			Excitation_12Phase();
1658                     ; 782 			break;
1661  0452 cc055f        	jp	_Excitation_12Phase
1662  0455               L754:
1663                     ; 783 		case 2:
1663                     ; 784 			Excitation_2Phase();
1666                     ; 785 			break;
1668                     ; 790 }
1671  0455 207a          	jp	_Excitation_2Phase
1697                     ; 795 void MotorClose(void)
1697                     ; 796 {
1698                     	switch	.text
1699  0457               _MotorClose:
1703                     ; 798 	if ( Drive.Origin )   		// Hall IC Sensing 
1705  0457 b643          	ld	a,_Drive+21
1706  0459 2715          	jreq	L165
1707                     ; 800 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1709  045b be33          	ldw	x,_Drive+5
1710  045d b339          	cpw	x,_Drive+11
1711  045f 250c          	jrult	L365
1712                     ; 802 			Drive.Target = 0u;
1714  0461 5f            	clrw	x
1715  0462 bf31          	ldw	_Drive+3,x
1716                     ; 803 			Drive.Position = 0u;
1718  0464 bf2f          	ldw	_Drive+1,x
1719                     ; 804 			Drive.Overrun = 0u;
1721  0466 bf33          	ldw	_Drive+5,x
1722                     ; 805 			Drive.ZeroOffset = 0u;
1724  0468 bf36          	ldw	_Drive+8,x
1725                     ; 809 			StopDrive();
1730  046a cc033c        	jp	_StopDrive
1731  046d               L365:
1732                     ; 813 			Drive.Overrun++;
1734  046d 5c            	incw	x
1735  046e bf33          	ldw	_Drive+5,x
1736                     ; 814 			MotorStep(nMotorClose);
1738  0470               L165:
1739                     ; 818 		MotorStep(nMotorClose);		// move 1 step close
1742  0470 4f            	clr	a
1744                     ; 819 }
1747  0471 cc03df        	jp	_MotorStep
1774                     ; 824 void DriveService(void)
1774                     ; 825 {
1775                     	switch	.text
1776  0474               _DriveService:
1778  0474 89            	pushw	x
1779       00000002      OFST:	set	2
1782                     ; 827 	if ( ! Drive.Run ) 
1784  0475 7202002e02    	btjt	_Drive,#1,L106
1785                     ; 830 		StopDrive();
1787                     ; 831 		return;	//when Drive is stop 
1789  047a 2050          	jp	LC012
1790  047c               L106:
1791                     ; 834 	if ( Drive.Stop )
1793  047c 7207002e08    	btjf	_Drive,#3,L306
1794                     ; 836 		Drive.Stop = 0;
1796  0481 7217002e      	bres	_Drive,#3
1797                     ; 837 		Drive.Target = Drive.Position ;
1799  0485 be2f          	ldw	x,_Drive+1
1800  0487 bf31          	ldw	_Drive+3,x
1801  0489               L306:
1802                     ; 840 	if ( Drive.Target > Drive.Position )
1804  0489 be31          	ldw	x,_Drive+3
1805  048b b32f          	cpw	x,_Drive+1
1806  048d 2307          	jrule	L506
1807                     ; 841 	 	MotorStep(nMotorOpen);
1809  048f a601          	ld	a,#1
1810  0491 cd03df        	call	_MotorStep
1813  0494 2039          	jra	L706
1814  0496               L506:
1815                     ; 842 	else if ( Drive.Target < Drive.Position )
1817  0496 b32f          	cpw	x,_Drive+1
1818  0498 2404          	jruge	L116
1819                     ; 843 		MotorClose( );
1821  049a adbb          	call	_MotorClose
1824  049c 2031          	jra	L706
1825  049e               L116:
1826                     ; 844 	else if ( Drive.Target ) 	// on target position
1828  049e be31          	ldw	x,_Drive+3
1829  04a0 2721          	jreq	L516
1830                     ; 846 			if ( Drive.Overrun2 )
1832  04a2 b635          	ld	a,_Drive+7
1833  04a4 270f          	jreq	L716
1834                     ; 848 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1836  04a6 5f            	clrw	x
1837  04a7 97            	ld	xl,a
1838  04a8 1f01          	ldw	(OFST-1,sp),x
1840  04aa be31          	ldw	x,_Drive+3
1841  04ac 72f001        	subw	x,(OFST-1,sp)
1842  04af bf31          	ldw	_Drive+3,x
1843                     ; 849 				Drive.Overrun2 = 0u;
1845  04b1 3f35          	clr	_Drive+7
1847  04b3 201a          	jra	L706
1848  04b5               L716:
1849                     ; 853 				Drive.ZeroOffset = 0u;
1851  04b5 5f            	clrw	x
1852  04b6 bf36          	ldw	_Drive+8,x
1853                     ; 854 				Drive.Overrun = 0u;
1855  04b8 bf33          	ldw	_Drive+5,x
1856                     ; 856 				StopDrive();	
1858  04ba cd033c        	call	_StopDrive
1860                     ; 857 				Drive.Run = FALSE;				
1862  04bd 7213002e      	bres	_Drive,#1
1863  04c1 200c          	jra	L706
1864  04c3               L516:
1865                     ; 863 			Drive.ZeroOffset = 0u;
1867  04c3 5f            	clrw	x
1868  04c4 bf36          	ldw	_Drive+8,x
1869                     ; 864 			Drive.Overrun = 0u;
1871  04c6 bf33          	ldw	_Drive+5,x
1872                     ; 865 			Drive.Run = FALSE;
1874  04c8 7213002e      	bres	_Drive,#1
1875                     ; 866 			StopDrive();	
1877  04cc               LC012:
1879  04cc cd033c        	call	_StopDrive
1881  04cf               L706:
1882                     ; 868 }
1885  04cf 85            	popw	x
1886  04d0 81            	ret	
1912                     ; 871 void Excitation_2Phase( void )
1912                     ; 872 {
1913                     	switch	.text
1914  04d1               _Excitation_2Phase:
1918                     ; 874 	switch (Drive.Phase%8)
1920  04d1 b638          	ld	a,_Drive+10
1921  04d3 a407          	and	a,#7
1923                     ; 906 		default:
1923                     ; 907 			break;
1924  04d5 2716          	jreq	L526
1925  04d7 4a            	dec	a
1926  04d8 2713          	jreq	L526
1927  04da 4a            	dec	a
1928  04db 271e          	jreq	L726
1929  04dd 4a            	dec	a
1930  04de 271b          	jreq	L726
1931  04e0 4a            	dec	a
1932  04e1 272f          	jreq	L136
1933  04e3 4a            	dec	a
1934  04e4 272c          	jreq	L136
1935  04e6 4a            	dec	a
1936  04e7 2737          	jreq	L336
1937  04e9 4a            	dec	a
1938  04ea 2734          	jreq	L336
1940  04ec 81            	ret	
1941  04ed               L526:
1942                     ; 876 		case 0:
1942                     ; 877 		case 1:
1942                     ; 878 		//case 1:
1942                     ; 879 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1944  04ed ad48          	call	LC016
1945                     ; 880 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1947  04ef ad5a          	call	LC018
1948                     ; 881 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1950  04f1 4b40          	push	#64
1951  04f3 ae500a        	ldw	x,#20490
1952  04f6 cd0000        	call	_GPIO_WriteLow
1954                     ; 882 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1956                     ; 883 			break;		
1958  04f9 200c          	jp	LC015
1959  04fb               L726:
1960                     ; 884 		case 2:
1960                     ; 885 		case 3:
1960                     ; 886 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1962  04fb ad44          	call	LC017
1963                     ; 887 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1965  04fd ad4c          	call	LC018
1966                     ; 888 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1968  04ff 4b40          	push	#64
1969  0501 ae500a        	ldw	x,#20490
1970  0504 cd0000        	call	_GPIO_WriteHigh
1972                     ; 889 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1974  0507               LC015:
1975  0507 84            	pop	a
1977  0508 4b04          	push	#4
1978  050a ae5000        	ldw	x,#20480
1979  050d cd0000        	call	_GPIO_WriteLow
1981                     ; 890 			break;
1983  0510 2023          	jp	LC013
1984  0512               L136:
1985                     ; 891 		case 4:
1985                     ; 892 		case 5:
1985                     ; 893 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1987  0512 ad2d          	call	LC017
1988                     ; 894 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1990  0514 ad3f          	call	LC019
1991                     ; 895 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1993  0516 4b40          	push	#64
1994  0518 ae500a        	ldw	x,#20490
1995  051b cd0000        	call	_GPIO_WriteHigh
1997                     ; 896 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1999                     ; 897 			break;
2001  051e 200c          	jp	LC014
2002  0520               L336:
2003                     ; 898 		case 6:
2003                     ; 899 		case 7:		
2003                     ; 900 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2005  0520 ad15          	call	LC016
2006                     ; 901 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2008  0522 ad31          	call	LC019
2009                     ; 902 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2011  0524 4b40          	push	#64
2012  0526 ae500a        	ldw	x,#20490
2013  0529 cd0000        	call	_GPIO_WriteLow
2015                     ; 903 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2017  052c               LC014:
2018  052c 84            	pop	a
2020  052d 4b04          	push	#4
2021  052f ae5000        	ldw	x,#20480
2022  0532 cd0000        	call	_GPIO_WriteHigh
2024  0535               LC013:
2025  0535 84            	pop	a
2026                     ; 904 			break;
2028                     ; 906 		default:
2028                     ; 907 			break;
2030                     ; 910 }
2033  0536 81            	ret	
2034  0537               LC016:
2035  0537 4b80          	push	#128
2036  0539 ae500a        	ldw	x,#20490
2037  053c cd0000        	call	_GPIO_WriteHigh
2039  053f 84            	pop	a
2040  0540 81            	ret	
2041  0541               LC017:
2042  0541 4b80          	push	#128
2043  0543 ae500a        	ldw	x,#20490
2044  0546 cd0000        	call	_GPIO_WriteLow
2046  0549 84            	pop	a
2047  054a 81            	ret	
2048  054b               LC018:
2049  054b 4b20          	push	#32
2050  054d ae500a        	ldw	x,#20490
2051  0550 cd0000        	call	_GPIO_WriteHigh
2053  0553 84            	pop	a
2054  0554 81            	ret	
2055  0555               LC019:
2056  0555 4b20          	push	#32
2057  0557 ae500a        	ldw	x,#20490
2058  055a cd0000        	call	_GPIO_WriteLow
2060  055d 84            	pop	a
2061  055e 81            	ret	
2087                     ; 913 void Excitation_12Phase( void )
2087                     ; 914 {
2088                     	switch	.text
2089  055f               _Excitation_12Phase:
2093                     ; 916 	switch (Drive.Phase%8)
2095  055f b638          	ld	a,_Drive+10
2096  0561 a407          	and	a,#7
2098                     ; 967 		default:
2098                     ; 968 			break;
2099  0563 2716          	jreq	L356
2100  0565 4a            	dec	a
2101  0566 271d          	jreq	L556
2102  0568 4a            	dec	a
2103  0569 272d          	jreq	L756
2104  056b 4a            	dec	a
2105  056c 273f          	jreq	L166
2106  056e 4a            	dec	a
2107  056f 2748          	jreq	L366
2108  0571 4a            	dec	a
2109  0572 2753          	jreq	L566
2110  0574 4a            	dec	a
2111  0575 276e          	jreq	L766
2112  0577 4a            	dec	a
2113  0578 2775          	jreq	L176
2115  057a 81            	ret	
2116  057b               L356:
2117                     ; 918 		case 0:
2117                     ; 919 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2119  057b 4b80          	push	#128
2120  057d ae500a        	ldw	x,#20490
2121  0580 cd0000        	call	_GPIO_WriteHigh
2123                     ; 920 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2125                     ; 921 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2127                     ; 922 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2129                     ; 923 			break;
2131  0583 2008          	jp	LC023
2132  0585               L556:
2133                     ; 924 		case 1:
2133                     ; 925 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2135  0585 4b80          	push	#128
2136  0587 ae500a        	ldw	x,#20490
2137  058a cd0000        	call	_GPIO_WriteLow
2139                     ; 926 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2141  058d               LC023:
2142  058d 84            	pop	a
2144  058e 4b20          	push	#32
2145  0590 ae500a        	ldw	x,#20490
2146  0593 cd0000        	call	_GPIO_WriteHigh
2148                     ; 927 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2150                     ; 928 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2152                     ; 929 			break;		
2154  0596 2068          	jp	LC022
2155  0598               L756:
2156                     ; 930 		case 2:
2156                     ; 931 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2158  0598 ad7a          	call	LC027
2159                     ; 932 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2161  059a 4b20          	push	#32
2162  059c ae500a        	ldw	x,#20490
2163  059f cd0000        	call	_GPIO_WriteHigh
2165                     ; 933 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2167  05a2               LC024:
2168  05a2 84            	pop	a
2170  05a3 4b40          	push	#64
2171  05a5 ae500a        	ldw	x,#20490
2172  05a8 cd0000        	call	_GPIO_WriteHigh
2174                     ; 934 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2176                     ; 935 			break;
2178  05ab 205c          	jp	LC021
2179  05ad               L166:
2180                     ; 936 		case 3:
2180                     ; 937 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2182  05ad ad65          	call	LC027
2183                     ; 938 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2185  05af 4b20          	push	#32
2186  05b1 ae500a        	ldw	x,#20490
2187  05b4 cd0000        	call	_GPIO_WriteLow
2189                     ; 939 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2191                     ; 940 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2193                     ; 941 			break;
2195  05b7 20e9          	jp	LC024
2196  05b9               L366:
2197                     ; 942 		case 4:
2197                     ; 943 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2199  05b9 ad59          	call	LC027
2200                     ; 944 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2202  05bb ad61          	call	LC028
2203                     ; 945 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2205  05bd 4b40          	push	#64
2206  05bf ae500a        	ldw	x,#20490
2207  05c2 cd0000        	call	_GPIO_WriteHigh
2209                     ; 946 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2211                     ; 947 			break;
2213  05c5 2013          	jp	LC025
2214  05c7               L566:
2215                     ; 948 		case 5: 
2215                     ; 949 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2217  05c7 4b80          	push	#128
2218  05c9 ae500a        	ldw	x,#20490
2219  05cc cd0000        	call	_GPIO_WriteLow
2221                     ; 950 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2224                     ; 951 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2226  05cf               LC026:
2227  05cf 84            	pop	a
2229  05d0 ad4c          	call	LC028
2231  05d2 4b40          	push	#64
2232  05d4 ae500a        	ldw	x,#20490
2233  05d7 cd0000        	call	_GPIO_WriteLow
2235                     ; 952 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2237  05da               LC025:
2238  05da 84            	pop	a
2241  05db 4b04          	push	#4
2242  05dd ae5000        	ldw	x,#20480
2243  05e0 cd0000        	call	_GPIO_WriteHigh
2245                     ; 953 			break;
2247  05e3 202d          	jp	LC020
2248  05e5               L766:
2249                     ; 954 		case 6:  
2249                     ; 955 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2251  05e5 4b80          	push	#128
2252  05e7 ae500a        	ldw	x,#20490
2253  05ea cd0000        	call	_GPIO_WriteHigh
2255                     ; 956 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2257                     ; 957 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2259                     ; 958 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2261                     ; 959 			break;
2263  05ed 20e0          	jp	LC026
2264  05ef               L176:
2265                     ; 960 		case 7:
2265                     ; 961 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2267  05ef 4b80          	push	#128
2268  05f1 ae500a        	ldw	x,#20490
2269  05f4 cd0000        	call	_GPIO_WriteHigh
2271  05f7 84            	pop	a
2272                     ; 962 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2274  05f8 4b20          	push	#32
2275  05fa ae500a        	ldw	x,#20490
2276  05fd cd0000        	call	_GPIO_WriteLow
2278                     ; 963 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2280  0600               LC022:
2281  0600 84            	pop	a
2284  0601 4b40          	push	#64
2285  0603 ae500a        	ldw	x,#20490
2286  0606 cd0000        	call	_GPIO_WriteLow
2288                     ; 964 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2290  0609               LC021:
2291  0609 84            	pop	a
2296  060a 4b04          	push	#4
2297  060c ae5000        	ldw	x,#20480
2298  060f cd0000        	call	_GPIO_WriteLow
2300  0612               LC020:
2301  0612 84            	pop	a
2302                     ; 965 			break;
2304                     ; 967 		default:
2304                     ; 968 			break;
2306                     ; 971 }
2309  0613 81            	ret	
2310  0614               LC027:
2311  0614 4b80          	push	#128
2312  0616 ae500a        	ldw	x,#20490
2313  0619 cd0000        	call	_GPIO_WriteLow
2315  061c 84            	pop	a
2316  061d 81            	ret	
2317  061e               LC028:
2318  061e 4b20          	push	#32
2319  0620 ae500a        	ldw	x,#20490
2320  0623 cd0000        	call	_GPIO_WriteLow
2322  0626 84            	pop	a
2323  0627 81            	ret	
2349                     ; 973 void Excitation_1Phase( void )
2349                     ; 974 {
2350                     	switch	.text
2351  0628               _Excitation_1Phase:
2355                     ; 977 	switch (Drive.Phase%8)
2357  0628 b638          	ld	a,_Drive+10
2358  062a a407          	and	a,#7
2360                     ; 1008 		default:
2360                     ; 1009 			break;
2361  062c 2716          	jreq	L117
2362  062e 4a            	dec	a
2363  062f 2713          	jreq	L117
2364  0631 4a            	dec	a
2365  0632 2723          	jreq	L317
2366  0634 4a            	dec	a
2367  0635 2720          	jreq	L317
2368  0637 4a            	dec	a
2369  0638 273b          	jreq	L517
2370  063a 4a            	dec	a
2371  063b 2738          	jreq	L517
2372  063d 4a            	dec	a
2373  063e 2741          	jreq	L717
2374  0640 4a            	dec	a
2375  0641 273e          	jreq	L717
2377  0643 81            	ret	
2378  0644               L117:
2379                     ; 979 		case 0:
2379                     ; 980 		case 1:
2379                     ; 981 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2381  0644 4b80          	push	#128
2382  0646 ae500a        	ldw	x,#20490
2383  0649 cd0000        	call	_GPIO_WriteHigh
2385  064c 84            	pop	a
2386                     ; 982 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2388  064d 4b20          	push	#32
2389  064f ae500a        	ldw	x,#20490
2390  0652 cd0000        	call	_GPIO_WriteLow
2392                     ; 983 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2394                     ; 984 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2396                     ; 985 			break;		
2398  0655 200a          	jp	LC031
2399  0657               L317:
2400                     ; 986 		case 2:
2400                     ; 987 		case 3:
2400                     ; 988 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2402  0657 ad49          	call	LC033
2403                     ; 989 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2405  0659 4b20          	push	#32
2406  065b ae500a        	ldw	x,#20490
2407  065e cd0000        	call	_GPIO_WriteHigh
2409                     ; 990 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2411  0661               LC031:
2412  0661 84            	pop	a
2414  0662 4b40          	push	#64
2415  0664 ae500a        	ldw	x,#20490
2416  0667 cd0000        	call	_GPIO_WriteLow
2418                     ; 991 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2420  066a               LC030:
2421  066a 84            	pop	a
2424  066b 4b04          	push	#4
2425  066d ae5000        	ldw	x,#20480
2426  0670 cd0000        	call	_GPIO_WriteLow
2428                     ; 992 			break;
2430  0673 201f          	jp	LC029
2431  0675               L517:
2432                     ; 993 		case 4:
2432                     ; 994 		case 5:
2432                     ; 995 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2434  0675 ad1f          	call	LC032
2435                     ; 997 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2437  0677 4b40          	push	#64
2438  0679 ae500a        	ldw	x,#20490
2439  067c cd0000        	call	_GPIO_WriteHigh
2441                     ; 998 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2443                     ; 999 			break;
2445  067f 20e9          	jp	LC030
2446  0681               L717:
2447                     ; 1000 		case 6:
2447                     ; 1001 		case 7:
2447                     ; 1002 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2449  0681 ad13          	call	LC032
2450                     ; 1004 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2452  0683 4b40          	push	#64
2453  0685 ae500a        	ldw	x,#20490
2454  0688 cd0000        	call	_GPIO_WriteLow
2456  068b 84            	pop	a
2457                     ; 1005 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2459  068c 4b04          	push	#4
2460  068e ae5000        	ldw	x,#20480
2461  0691 cd0000        	call	_GPIO_WriteHigh
2463  0694               LC029:
2464  0694 84            	pop	a
2465                     ; 1006 			break;
2467                     ; 1008 		default:
2467                     ; 1009 			break;
2469                     ; 1012 }
2472  0695 81            	ret	
2473  0696               LC032:
2474  0696 ad0a          	call	LC033
2475                     ; 996 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2477  0698 4b20          	push	#32
2478  069a ae500a        	ldw	x,#20490
2479  069d cd0000        	call	_GPIO_WriteLow
2481  06a0 84            	pop	a
2482  06a1 81            	ret	
2483  06a2               LC033:
2484  06a2 4b80          	push	#128
2485  06a4 ae500a        	ldw	x,#20490
2486  06a7 cd0000        	call	_GPIO_WriteLow
2488  06aa 84            	pop	a
2489  06ab 81            	ret	
2524                     ; 1015 u8 Interval( u16 Vmon)
2524                     ; 1016 {
2525                     	switch	.text
2526  06ac               _Interval:
2528  06ac 89            	pushw	x
2529       00000000      OFST:	set	0
2532                     ; 1017 	Vmon = Vmon / IntervalSlope;
2534  06ad a61c          	ld	a,#28
2535  06af 62            	div	x,a
2536                     ; 1019 	if (Vmon < 10 ) Vmon = 10;
2538  06b0 a3000a        	cpw	x,#10
2539  06b3 2403          	jruge	L557
2542  06b5 ae000a        	ldw	x,#10
2543  06b8               L557:
2544                     ; 1020 	if (Vmon > 26 ) Vmon = 26;
2546  06b8 a3001b        	cpw	x,#27
2547  06bb 2503          	jrult	L757
2550  06bd ae001a        	ldw	x,#26
2551  06c0               L757:
2552                     ; 1022 	return ( TableInterval[ Vmon-10 ] );
2554  06c0 1d000a        	subw	x,#10
2555  06c3 e602          	ld	a,(_TableInterval,x)
2558  06c5 85            	popw	x
2559  06c6 81            	ret	
2603                     .const:	section	.text
2604  0000               L034:
2605  0000 00000064      	dc.l	100
2606                     ; 1037 uint16_t CStep( uint16_t pulse )
2606                     ; 1038 {
2607                     	switch	.text
2608  06c7               _CStep:
2610  06c7 5204          	subw	sp,#4
2611       00000004      OFST:	set	4
2614                     ; 1042 	i = (uint32_t) pulse * My.GearRatio100 ;
2616  06c9 90be2b        	ldw	y,_My+12
2617  06cc cd0000        	call	c_umul
2619  06cf 96            	ldw	x,sp
2620  06d0 5c            	incw	x
2621  06d1 cd0000        	call	c_rtol
2624                     ; 1043 	i = (i+1)/100;   				// Round up  20150925
2626  06d4 96            	ldw	x,sp
2627  06d5 5c            	incw	x
2628  06d6 cd0000        	call	c_ltor
2630  06d9 a601          	ld	a,#1
2631  06db cd0000        	call	c_ladc
2633  06de ae0000        	ldw	x,#L034
2634  06e1 cd0000        	call	c_ludv
2636  06e4 96            	ldw	x,sp
2637  06e5 5c            	incw	x
2638  06e6 cd0000        	call	c_rtol
2641                     ; 1044 	return (uint16_t) i;
2643  06e9 1e03          	ldw	x,(OFST-1,sp)
2646  06eb 5b04          	addw	sp,#4
2647  06ed 81            	ret	
2691                     ; 1048 uint16_t CPulse( uint16_t step )
2691                     ; 1049 {
2692                     	switch	.text
2693  06ee               _CPulse:
2695  06ee 5204          	subw	sp,#4
2696       00000004      OFST:	set	4
2699                     ; 1058 	i = (uint32_t) step * My.GearRatio100 ;
2701  06f0 90be2b        	ldw	y,_My+12
2702  06f3 cd0000        	call	c_umul
2704  06f6 96            	ldw	x,sp
2705  06f7 5c            	incw	x
2706  06f8 cd0000        	call	c_rtol
2709                     ; 1062 	return (uint16_t) i;
2711  06fb 1e03          	ldw	x,(OFST-1,sp)
2714  06fd 5b04          	addw	sp,#4
2715  06ff 81            	ret	
2744                     ; 1073 void Clock_Config(void)
2744                     ; 1074 {
2745                     	switch	.text
2746  0700               _Clock_Config:
2750                     ; 1076 	CLK_DeInit();
2752  0700 cd0000        	call	_CLK_DeInit
2754                     ; 1077 	CLK_HSICmd(ENABLE);
2756  0703 a601          	ld	a,#1
2757  0705 cd0000        	call	_CLK_HSICmd
2759                     ; 1078 	CLK_LSICmd(DISABLE);
2761  0708 4f            	clr	a
2762  0709 cd0000        	call	_CLK_LSICmd
2764                     ; 1079 	CLK_HSECmd(DISABLE);
2766  070c 4f            	clr	a
2767  070d cd0000        	call	_CLK_HSECmd
2769                     ; 1081 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2771  0710 4f            	clr	a
2772  0711 cd0000        	call	_CLK_HSIPrescalerConfig
2774                     ; 1082 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2776  0714 a680          	ld	a,#128
2778                     ; 1083 }
2781  0716 cc0000        	jp	_CLK_SYSCLKConfig
2807                     ; 1086 void Gpio_Config(void)
2807                     ; 1087 {
2808                     	switch	.text
2809  0719               _Gpio_Config:
2813                     ; 1089   GPIO_Init(_LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2815  0719 4be0          	push	#224
2816  071b 4b10          	push	#16
2817  071d ae5005        	ldw	x,#20485
2818  0720 cd0000        	call	_GPIO_Init
2820  0723 85            	popw	x
2821                     ; 1090 	GPIO_WriteHigh(_LED_PORT, _LED_PIN);
2823  0724 4b10          	push	#16
2824  0726 ae5005        	ldw	x,#20485
2825  0729 cd0000        	call	_GPIO_WriteHigh
2827  072c 84            	pop	a
2828                     ; 1093 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2830  072d 4be0          	push	#224
2831  072f 4b80          	push	#128
2832  0731 ae500a        	ldw	x,#20490
2833  0734 cd0000        	call	_GPIO_Init
2835  0737 85            	popw	x
2836                     ; 1094 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2838  0738 4be0          	push	#224
2839  073a 4b40          	push	#64
2840  073c ae500a        	ldw	x,#20490
2841  073f cd0000        	call	_GPIO_Init
2843  0742 85            	popw	x
2844                     ; 1095 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2846  0743 4be0          	push	#224
2847  0745 4b20          	push	#32
2848  0747 ae500a        	ldw	x,#20490
2849  074a cd0000        	call	_GPIO_Init
2851  074d 85            	popw	x
2852                     ; 1096 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2854  074e 4be0          	push	#224
2855  0750 4b04          	push	#4
2856  0752 ae5000        	ldw	x,#20480
2857  0755 cd0000        	call	_GPIO_Init
2859  0758 85            	popw	x
2860                     ; 1098 	GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2862  0759 4b80          	push	#128
2863  075b ae500a        	ldw	x,#20490
2864  075e cd0000        	call	_GPIO_WriteHigh
2866  0761 84            	pop	a
2867                     ; 1099 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2869  0762 4b80          	push	#128
2870  0764 ae500a        	ldw	x,#20490
2871  0767 cd0000        	call	_GPIO_WriteLow
2873  076a 84            	pop	a
2874                     ; 1101 	GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2876  076b 4b20          	push	#32
2877  076d ae500a        	ldw	x,#20490
2878  0770 cd0000        	call	_GPIO_WriteHigh
2880  0773 84            	pop	a
2881                     ; 1102 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2883  0774 4b20          	push	#32
2884  0776 ae500a        	ldw	x,#20490
2885  0779 cd0000        	call	_GPIO_WriteLow
2887  077c 84            	pop	a
2888                     ; 1104 	GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2890  077d 4b40          	push	#64
2891  077f ae500a        	ldw	x,#20490
2892  0782 cd0000        	call	_GPIO_WriteHigh
2894  0785 84            	pop	a
2895                     ; 1105 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2897  0786 4b40          	push	#64
2898  0788 ae500a        	ldw	x,#20490
2899  078b cd0000        	call	_GPIO_WriteLow
2901  078e 84            	pop	a
2902                     ; 1107 	GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);		
2904  078f 4b04          	push	#4
2905  0791 ae5000        	ldw	x,#20480
2906  0794 cd0000        	call	_GPIO_WriteHigh
2908  0797 84            	pop	a
2909                     ; 1108 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2911  0798 4b04          	push	#4
2912  079a ae5000        	ldw	x,#20480
2913  079d cd0000        	call	_GPIO_WriteLow
2915  07a0 84            	pop	a
2916                     ; 1111   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2918  07a1 4b00          	push	#0
2919  07a3 4b02          	push	#2
2920  07a5 ae5000        	ldw	x,#20480
2921  07a8 cd0000        	call	_GPIO_Init
2923  07ab 85            	popw	x
2924                     ; 1117 	GPIO_Init(_CHARGE_ON_PORT, _CHARGE_ON_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2926  07ac 4be0          	push	#224
2927  07ae 4b10          	push	#16
2928  07b0 ae500f        	ldw	x,#20495
2929  07b3 cd0000        	call	_GPIO_Init
2931  07b6 85            	popw	x
2932                     ; 1120 	GPIO_Init(_BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN, GPIO_MODE_OUT_PP_LOW_FAST);		
2934  07b7 4be0          	push	#224
2935  07b9 4b08          	push	#8
2936  07bb ae5000        	ldw	x,#20480
2937  07be cd0000        	call	_GPIO_Init
2939  07c1 85            	popw	x
2940                     ; 1125 	GPIO_Init( _ADJ_MO_PORT , _ADJ_MO_PIN , GPIO_MODE_IN_FL_NO_IT );
2942  07c2 4b00          	push	#0
2943  07c4 4b10          	push	#16
2944  07c6 ae500a        	ldw	x,#20490
2945  07c9 cd0000        	call	_GPIO_Init
2947  07cc 85            	popw	x
2948                     ; 1127 	GPIO_Init( _BAT_MO_PORT , _BAT_MO_PIN, GPIO_MODE_IN_FL_NO_IT );
2950  07cd ad2f          	call	LC034
2951                     ; 1129 	GPIO_Init( _BOOST_MO_PORT , _BOOST_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2953  07cf ad2d          	call	LC034
2954                     ; 1131   GPIO_Init( _POWER_MO_PORT , _POWER_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2956  07d1 4b00          	push	#0
2957  07d3 4b20          	push	#32
2958  07d5 ae500f        	ldw	x,#20495
2959  07d8 cd0000        	call	_GPIO_Init
2961  07db 85            	popw	x
2962                     ; 1133 	GPIO_Init( _ISENSE_PORT , _ISENSE_PIN  , GPIO_MODE_IN_FL_NO_IT );
2964  07dc 4b00          	push	#0
2965  07de 4b04          	push	#4
2966  07e0 ae500f        	ldw	x,#20495
2967  07e3 cd0000        	call	_GPIO_Init
2969  07e6 85            	popw	x
2970                     ; 1139 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
2972  07e7 4b00          	push	#0
2973  07e9 4b20          	push	#32
2974  07eb ae5005        	ldw	x,#20485
2975  07ee cd0000        	call	_GPIO_Init
2977  07f1 85            	popw	x
2978                     ; 1140 	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
2980  07f2 4b00          	push	#0
2981  07f4 4b08          	push	#8
2982  07f6 ae500a        	ldw	x,#20490
2983  07f9 cd0000        	call	_GPIO_Init
2985  07fc 85            	popw	x
2986                     ; 1142 }
2989  07fd 81            	ret	
2990  07fe               LC034:
2991  07fe 4b00          	push	#0
2992  0800 4b08          	push	#8
2993  0802 ae500f        	ldw	x,#20495
2994  0805 cd0000        	call	_GPIO_Init
2996  0808 85            	popw	x
2997  0809 81            	ret	
3024                     ; 1146 void Timer4_Config(void)
3024                     ; 1147 {
3025                     	switch	.text
3026  080a               L5_Timer4_Config:
3030                     ; 1148   TIM4_DeInit();
3032  080a cd0000        	call	_TIM4_DeInit
3034                     ; 1154 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
3036  080d ae0432        	ldw	x,#1074
3037  0810 cd0000        	call	_TIM4_TimeBaseInit
3039                     ; 1158   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
3041  0813 ae0101        	ldw	x,#257
3042  0816 cd0000        	call	_TIM4_ITConfig
3044                     ; 1161   TIM4_Cmd(ENABLE);
3046  0819 a601          	ld	a,#1
3048                     ; 1162 }
3051  081b cc0000        	jp	_TIM4_Cmd
3079                     ; 1165 static void Adc_Config( void )
3079                     ; 1166 {
3080                     	switch	.text
3081  081e               L3_Adc_Config:
3085                     ; 1168 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
3087  081e cd0000        	call	_ADC1_GetConversionValue
3089  0821 b615          	ld	a,_Adc+10
3090  0823 905f          	clrw	y
3091  0825 9097          	ld	yl,a
3092  0827 9058          	sllw	y
3093  0829 90ef0b        	ldw	(_Adc,y),x
3094                     ; 1170 	ADC1_DeInit( );
3096  082c cd0000        	call	_ADC1_DeInit
3098                     ; 1172 	switch (Adc.Idx)
3100  082f b615          	ld	a,_Adc+10
3102                     ; 1204 		default:
3102                     ; 1205 			//Adc.Idx = 0;
3102                     ; 1206 			break;
3103  0831 270e          	jreq	L5501
3104  0833 4a            	dec	a
3105  0834 2725          	jreq	L7501
3106  0836 4a            	dec	a
3107  0837 273c          	jreq	L1601
3108  0839 4a            	dec	a
3109  083a 2753          	jreq	L3601
3110  083c 4a            	dec	a
3111  083d 276a          	jreq	L5601
3112  083f 207e          	jra	L3011
3113  0841               L5501:
3114                     ; 1174 		case 0:
3114                     ; 1175 		  
3114                     ; 1176 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
3114                     ; 1177 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
3116  0841 4b00          	push	#0
3117  0843 4b03          	push	#3
3118  0845 4b08          	push	#8
3119  0847 4b00          	push	#0
3120  0849 4b00          	push	#0
3121  084b 4b00          	push	#0
3122  084d ae0003        	ldw	x,#3
3123  0850 cd0000        	call	_ADC1_Init
3125  0853 5b06          	addw	sp,#6
3126                     ; 1178 			Adc.Idx = 1;
3128  0855 35010015      	mov	_Adc+10,#1
3129                     ; 1179 			break;
3131  0859 2064          	jra	L3011
3132  085b               L7501:
3133                     ; 1180 		case 1:
3133                     ; 1181 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
3133                     ; 1182 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
3135  085b 4b00          	push	#0
3136  085d 4b04          	push	#4
3137  085f 4b08          	push	#8
3138  0861 4b00          	push	#0
3139  0863 4b00          	push	#0
3140  0865 4b00          	push	#0
3141  0867 ae0004        	ldw	x,#4
3142  086a cd0000        	call	_ADC1_Init
3144  086d 5b06          	addw	sp,#6
3145                     ; 1183 			Adc.Idx = 2;
3147  086f 35020015      	mov	_Adc+10,#2
3148                     ; 1184 			break;
3150  0873 204a          	jra	L3011
3151  0875               L1601:
3152                     ; 1186 		case 2:
3152                     ; 1187 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_5, ADC1_PRESSEL_FCPU_D2, 
3152                     ; 1188 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL5, DISABLE );
3154  0875 4b00          	push	#0
3155  0877 4b05          	push	#5
3156  0879 4b08          	push	#8
3157  087b 4b00          	push	#0
3158  087d 4b00          	push	#0
3159  087f 4b00          	push	#0
3160  0881 ae0005        	ldw	x,#5
3161  0884 cd0000        	call	_ADC1_Init
3163  0887 5b06          	addw	sp,#6
3164                     ; 1189 			Adc.Idx = 3;
3166  0889 35030015      	mov	_Adc+10,#3
3167                     ; 1190 			break;
3169  088d 2030          	jra	L3011
3170  088f               L3601:
3171                     ; 1192 		case 3:
3171                     ; 1193 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_6, ADC1_PRESSEL_FCPU_D2, 
3171                     ; 1194 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL6, DISABLE );
3173  088f 4b00          	push	#0
3174  0891 4b06          	push	#6
3175  0893 4b08          	push	#8
3176  0895 4b00          	push	#0
3177  0897 4b00          	push	#0
3178  0899 4b00          	push	#0
3179  089b ae0006        	ldw	x,#6
3180  089e cd0000        	call	_ADC1_Init
3182  08a1 5b06          	addw	sp,#6
3183                     ; 1195 			Adc.Idx = 4;
3185  08a3 35040015      	mov	_Adc+10,#4
3186                     ; 1196 			break;	
3188  08a7 2016          	jra	L3011
3189  08a9               L5601:
3190                     ; 1198 		case 4:
3190                     ; 1199 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
3190                     ; 1200 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3192  08a9 4b00          	push	#0
3193  08ab 4b02          	push	#2
3194  08ad 4b08          	push	#8
3195  08af 4b00          	push	#0
3196  08b1 4b00          	push	#0
3197  08b3 4b00          	push	#0
3198  08b5 ae0002        	ldw	x,#2
3199  08b8 cd0000        	call	_ADC1_Init
3201  08bb 5b06          	addw	sp,#6
3202                     ; 1201 			Adc.Idx = 0;
3204  08bd 3f15          	clr	_Adc+10
3205                     ; 1202 			break;	
3207                     ; 1204 		default:
3207                     ; 1205 			//Adc.Idx = 0;
3207                     ; 1206 			break;
3209  08bf               L3011:
3210                     ; 1209 		ADC1_StartConversion();		
3213                     ; 1210 }
3216  08bf cc0000        	jp	_ADC1_StartConversion
3260                     ; 1225 void assert_failed(u8* file, u32 line)
3260                     ; 1226 {
3261                     	switch	.text
3262  08c2               _assert_failed:
3264  08c2 88            	push	a
3265       00000001      OFST:	set	1
3268  08c3               L7211:
3269                     ; 1235 	i = i++;
3271  08c3 0c01          	inc	(OFST+0,sp)
3273  08c5 6b01          	ld	(OFST+0,sp),a
3276  08c7 20fa          	jra	L7211
3805                     	xdef	_MotorClose
3806                     	xdef	_MotorStep
3807                     	xdef	_StopDrive
3808                     	xdef	_OnTimer_1mS
3809                     	xdef	_OnTimer_1S
3810                     	xdef	_main
3811                     	xdef	_MotorService
3812                     	xdef	_AdcService
3813                     	xdef	_LedService
3814                     	xdef	_SAbs
3815                     	xdef	_Diff
3816                     	xdef	_Gpio_Config
3817                     	xdef	_Clock_Config
3818                     	xdef	_OnTimer4
3819                     	xdef	_Interval
3820                     	xdef	_StartDriveOR
3821                     	xdef	_DriveService
3822                     	xdef	_Excitation_2Phase
3823                     	xdef	_Excitation_12Phase
3824                     	xdef	_Excitation_1Phase
3825                     	xdef	_CPulse
3826                     	xdef	_CStep
3827                     	xdef	_PowerDelay_1mS
3828                     	switch	.ubsct
3829  0000               _Timer:
3830  0000 000000000000  	ds.b	11
3831                     	xdef	_Timer
3832  000b               _Adc:
3833  000b 000000000000  	ds.b	20
3834                     	xdef	_Adc
3835  001f               _My:
3836  001f 000000000000  	ds.b	15
3837                     	xdef	_My
3838  002e               _Drive:
3839  002e 000000000000  	ds.b	27
3840                     	xdef	_Drive
3841                     	xdef	_TableInterval
3842  0049               _ledint:
3843  0049 0000          	ds.b	2
3844                     	xdef	_ledint
3845  004b               _Ticks_S:
3846  004b 0000          	ds.b	2
3847                     	xdef	_Ticks_S
3848  004d               _Ticks_1mS:
3849  004d 0000          	ds.b	2
3850                     	xdef	_Ticks_1mS
3851  004f               _Ticks_50uS:
3852  004f 00            	ds.b	1
3853                     	xdef	_Ticks_50uS
3854                     	xdef	_PeriodNumber
3855  0050               _Counter:
3856  0050 0000          	ds.b	2
3857                     	xdef	_Counter
3858                     	xdef	_assert_failed
3859                     	xref	_TIM4_ITConfig
3860                     	xref	_TIM4_Cmd
3861                     	xref	_TIM4_TimeBaseInit
3862                     	xref	_TIM4_DeInit
3863                     	xref	_GPIO_ReadInputPin
3864                     	xref	_GPIO_WriteReverse
3865                     	xref	_GPIO_WriteLow
3866                     	xref	_GPIO_WriteHigh
3867                     	xref	_GPIO_Init
3868                     	xref	_CLK_SYSCLKConfig
3869                     	xref	_CLK_HSIPrescalerConfig
3870                     	xref	_CLK_LSICmd
3871                     	xref	_CLK_HSICmd
3872                     	xref	_CLK_HSECmd
3873                     	xref	_CLK_DeInit
3874                     	xref	_ADC1_GetConversionValue
3875                     	xref	_ADC1_StartConversion
3876                     	xref	_ADC1_Init
3877                     	xref	_ADC1_DeInit
3878                     	xref.b	c_lreg
3879                     	xref.b	c_x
3880                     	xref.b	c_y
3900                     	xref	c_ludv
3901                     	xref	c_ladc
3902                     	xref	c_umul
3903                     	xref	c_ladd
3904                     	xref	c_lsub
3905                     	xref	c_ltor
3906                     	xref	c_lcmp
3907                     	xref	c_rtol
3908                     	xref	c_uitolx
3909                     	xref	c_imul
3910                     	end
