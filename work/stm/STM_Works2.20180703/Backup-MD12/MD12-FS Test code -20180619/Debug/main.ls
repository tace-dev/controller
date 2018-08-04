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
 102                     ; 220 void main(void)
 102                     ; 221 {
 104                     	switch	.text
 105  0000               _main:
 107  0000 89            	pushw	x
 108       00000002      OFST:	set	2
 111                     ; 227 	Ticks_1mS = 0;
 113  0001 5f            	clrw	x
 114  0002 bf4e          	ldw	_Ticks_1mS,x
 115                     ; 228 	Ticks_50uS = 0;
 117  0004 3f50          	clr	_Ticks_50uS
 118                     ; 233 	My.GearRatio100 = 287u;		//  	4096 * 325/360 * 15.54 20180605
 120  0006 ae011f        	ldw	x,#287
 121  0009 bf2c          	ldw	_My+12,x
 122                     ; 235 	My.Mode = 0;
 124  000b 3f2b          	clr	_My+11
 125                     ; 237 	Clock_Config();
 127  000d cd0701        	call	_Clock_Config
 129                     ; 238 	Gpio_Config();
 131  0010 cd071a        	call	_Gpio_Config
 133                     ; 240 	Timer4_Config();
 135  0013 cd080b        	call	L5_Timer4_Config
 137                     ; 242 	Adc.Idx = 2;
 139  0016 35020015      	mov	_Adc+10,#2
 140                     ; 243 	Adc.IdxAvg = 0;
 142  001a 3f1b          	clr	_Adc+16
 143                     ; 244 	Adc.Average = 0;
 145  001c 3f1c          	clr	_Adc+17
 146                     ; 245 	Adc.Sum = 0;
 148  001e 5f            	clrw	x
 149  001f bf1d          	ldw	_Adc+18,x
 150                     ; 246 	Adc_Config(  );
 152  0021 cd081f        	call	L3_Adc_Config
 154                     ; 252 	Drive.NormalOpen = 1;
 156  0024 35010045      	mov	_Drive+22,#1
 157                     ; 253 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 159  0028 ae012c        	ldw	x,#300
 160  002b bf3a          	ldw	_Drive+11,x
 161                     ; 255 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 163  002d bf41          	ldw	_Drive+18,x
 164                     ; 259 	Drive.ExcitationType = 1;		//	1-2 excition
 166  002f 35010043      	mov	_Drive+20,#1
 167                     ; 261 	Drive.Interval = 16u;			//	20180225
 169  0033 3510003f      	mov	_Drive+16,#16
 170                     ; 262 	Drive.DiffStep = 1;
 172  0037 35010048      	mov	_Drive+25,#1
 173                     ; 263 	Drive.Enabled = ENABLED;
 175  003b 7210002f      	bset	_Drive,#0
 176                     ; 264 	Drive.Stage = 0;		// Charging
 178  003f 3f49          	clr	_Drive+26
 179                     ; 266 	My.BoostEnable = 0;
 181  0041 7211002e      	bres	_My+14,#0
 182                     ; 267 	My.ChargeOn = 0;
 184  0045 7213002e      	bres	_My+14,#1
 185                     ; 268 	Adc.Delay = 20;
 187  0049 3514001f      	mov	_Adc+20,#20
 188                     ; 270 	enableInterrupts();
 191  004d 9a            	rim	
 195  004e               L53:
 196                     ; 272   while ( Ticks_1mS < PowerDelay_1mS )
 198  004e b613          	ld	a,_PowerDelay_1mS
 199  0050 5f            	clrw	x
 200  0051 97            	ld	xl,a
 201  0052 bf00          	ldw	c_x,x
 202  0054 be4e          	ldw	x,_Ticks_1mS
 203  0056 b300          	cpw	x,c_x
 204  0058 25f4          	jrult	L53
 205                     ; 275 	GPIO_WriteLow(_LED_PORT, _LED_PIN);
 207  005a 4b10          	push	#16
 208  005c ae5005        	ldw	x,#20485
 209  005f cd0000        	call	_GPIO_WriteLow
 211  0062 be4e          	ldw	x,_Ticks_1mS
 212  0064 bf00          	ldw	_Timer,x
 213  0066 bf02          	ldw	_Timer+2,x
 214  0068 bf04          	ldw	_Timer+4,x
 215  006a bf06          	ldw	_Timer+6,x
 216  006c ae07d0        	ldw	x,#2000
 217  006f bf4a          	ldw	_ledint,x
 218  0071 84            	pop	a
 219                     ; 297 	Timer.Led = Ticks_1mS;
 221                     ; 298 	Timer.Motor = Ticks_1mS;
 223                     ; 299 	Timer.Adc = Ticks_1mS;
 225                     ; 300   Timer.Boost = Ticks_1mS;
 227                     ; 302 	ledint = 2000u;
 229  0072               L14:
 230                     ; 306 		t = Ticks_1mS;
 232  0072 be4e          	ldw	x,_Ticks_1mS
 233  0074 1f01          	ldw	(OFST-1,sp),x
 235                     ; 308 		LedService();
 237  0076 cd01e2        	call	_LedService
 239                     ; 309 		AdcService();
 241  0079 cd0192        	call	_AdcService
 243                     ; 311 		if ( Drive.Stage == 0 )	//	Charging
 245  007c b649          	ld	a,_Drive+26
 246  007e 2636          	jrne	L54
 247                     ; 313 			ledint = 1000u;
 249  0080 ae03e8        	ldw	x,#1000
 250  0083 bf4a          	ldw	_ledint,x
 251                     ; 320 				if (Adc.Value[2] > 950)		//	 Charging then goto origin
 253  0085 be0f          	ldw	x,_Adc+4
 254  0087 a303b7        	cpw	x,#951
 255  008a 2403cc0142    	jrult	L701
 256                     ; 322 					ledint = 1000u;
 258  008f ae03e8        	ldw	x,#1000
 259  0092 bf4a          	ldw	_ledint,x
 260                     ; 323 					Drive.Stage = 1;
 262  0094 35010049      	mov	_Drive+26,#1
 263                     ; 324 					if ( Drive.Origin ) 
 265  0098 b644          	ld	a,_Drive+21
 266  009a 2706          	jreq	L15
 267                     ; 326 						Drive.Position = 0;
 269  009c 5f            	clrw	x
 270  009d bf30          	ldw	_Drive+1,x
 272  009f cc0142        	jra	L701
 273  00a2               L15:
 274                     ; 330 						Drive.Position = CPulse(205u);
 276  00a2 ae00cd        	ldw	x,#205
 277  00a5 cd06ef        	call	_CPulse
 279  00a8 bf30          	ldw	_Drive+1,x
 280                     ; 331 						Drive.ExcitationType = 0;		//	1 excition
 282  00aa 3f43          	clr	_Drive+20
 283                     ; 333 						StartDriveOR( 0u, 0u  );				// Goto Zero position
 285  00ac 4b00          	push	#0
 286  00ae 5f            	clrw	x
 287  00af cd0362        	call	_StartDriveOR
 289  00b2 84            	pop	a
 290  00b3 cc0142        	jra	L701
 291  00b6               L54:
 292                     ; 338 		else if ( Drive.Stage == 1 )	// Initializing
 294  00b6 a101          	cp	a,#1
 295  00b8 261b          	jrne	L75
 296                     ; 340 			if (My.BoostEnable == 1)
 298  00ba 7201002e06    	btjf	_My+14,#0,L16
 299                     ; 342 				Drive.Stop = 1;	
 301  00bf 7216002f      	bset	_Drive,#3
 302                     ; 343 				Drive.Stage = 0;				
 304  00c3 206f          	jp	LC001
 305  00c5               L16:
 306                     ; 347 				if ( !Drive.Run )		//	Origin
 308  00c5 7202002f78    	btjt	_Drive,#1,L701
 309                     ; 349 					ledint = 500u;
 311  00ca ae01f4        	ldw	x,#500
 312  00cd bf4a          	ldw	_ledint,x
 313                     ; 350 					Drive.Stage = 2;
 315  00cf 35020049      	mov	_Drive+26,#2
 316  00d3 206d          	jra	L701
 317  00d5               L75:
 318                     ; 354 		else if ( Drive.Stage == 2 )	//	Running with Power On
 320  00d5 a102          	cp	a,#2
 321  00d7 264d          	jrne	L17
 322                     ; 356 			if (My.BoostEnable == 1)
 324  00d9 7201002e26    	btjf	_My+14,#0,L37
 325                     ; 358 				if ( Drive.Run )
 327  00de 7203002f0a    	btjf	_Drive,#1,L57
 328                     ; 360 					Drive.Stop = 1;	
 330  00e3 7216002f      	bset	_Drive,#3
 331                     ; 361 					Timer.Motor = Ticks_1mS;					
 333  00e7 be4e          	ldw	x,_Ticks_1mS
 334  00e9 bf02          	ldw	_Timer+2,x
 336  00eb 2055          	jra	L701
 337  00ed               L57:
 338                     ; 367 						ledint = 125u;
 340  00ed ae007d        	ldw	x,#125
 341  00f0 bf4a          	ldw	_ledint,x
 342                     ; 368 						Drive.Stage = 3;
 344  00f2 35030049      	mov	_Drive+26,#3
 345                     ; 370 						Drive.ExcitationType = 1;		//	1 excition
 347  00f6 35010043      	mov	_Drive+20,#1
 348                     ; 371 						Drive.Interval = 17u;			//	20180615
 350  00fa 3511003f      	mov	_Drive+16,#17
 351                     ; 374 						Drive.Step = 0u;		//((u16)Adc.Average * 100 )/110; 
 353  00fe 3f46          	clr	_Drive+23
 354                     ; 375 						MotorService();
 356  0100 ad50          	call	_MotorService
 358  0102 203e          	jra	L701
 359  0104               L37:
 360                     ; 382 				if ( Diff ( Timer.Motor, 500u ) )
 362  0104 ae01f4        	ldw	x,#500
 363  0107 89            	pushw	x
 364  0108 be02          	ldw	x,_Timer+2
 365  010a cd020d        	call	_Diff
 367  010d 4d            	tnz	a
 368  010e 85            	popw	x
 369  010f 2731          	jreq	L701
 370                     ; 384 					Drive.Step = ((u16)Adc.Average * 100 )/109; 
 372  0111 b61c          	ld	a,_Adc+17
 373  0113 5f            	clrw	x
 374  0114 97            	ld	xl,a
 375  0115 90ae0064      	ldw	y,#100
 376  0119 cd0000        	call	c_imul
 378  011c a66d          	ld	a,#109
 379  011e 62            	div	x,a
 380  011f 01            	rrwa	x,a
 381  0120 b746          	ld	_Drive+23,a
 382                     ; 385 					MotorService();
 384  0122 ad2e          	call	_MotorService
 386  0124 201c          	jra	L701
 387  0126               L17:
 388                     ; 390 		else if ( Drive.Stage == 3 )	//	Running with Power Off
 390  0126 a103          	cp	a,#3
 391  0128 2618          	jrne	L701
 392                     ; 392 			if (My.BoostEnable == 0 /*&& !Drive.Run*/ )
 394  012a 7200002e09    	btjt	_My+14,#0,L111
 395                     ; 394 				ledint = 500u;
 397  012f ae01f4        	ldw	x,#500
 398  0132 bf4a          	ldw	_ledint,x
 399                     ; 395 				Drive.Stage = 0;
 401  0134               LC001:
 403  0134 3f49          	clr	_Drive+26
 405  0136 200a          	jra	L701
 406  0138               L111:
 407                     ; 414 				if ( !Drive.Run )
 409  0138 7202002f05    	btjt	_Drive,#1,L701
 410                     ; 416 					ledint = 2000u;
 412  013d ae07d0        	ldw	x,#2000
 413  0140 bf4a          	ldw	_ledint,x
 414  0142               L701:
 415                     ; 422 		else if ( Drive.Stage == 4 )	//	wait
 417                     ; 428 		while ( Diff ( t, 10u ) )
 419  0142 ae000a        	ldw	x,#10
 420  0145 89            	pushw	x
 421  0146 1e03          	ldw	x,(OFST+1,sp)
 422  0148 cd020d        	call	_Diff
 424  014b 4d            	tnz	a
 425  014c 85            	popw	x
 426  014d 26f3          	jrne	L701
 427                     ; 432 			;
 429  014f cc0072        	jra	L14
 458                     ; 438 void MotorService()
 458                     ; 439 {
 459                     	switch	.text
 460  0152               _MotorService:
 464                     ; 445 			if ( Drive.Step > 210u )
 466  0152 b646          	ld	a,_Drive+23
 467  0154 a1d3          	cp	a,#211
 468  0156 2504          	jrult	L141
 469                     ; 446 				Drive.Step = 210u;
 471  0158 a6d2          	ld	a,#210
 472  015a b746          	ld	_Drive+23,a
 473  015c               L141:
 474                     ; 447 			if ( Drive.Step < 20u )
 476  015c a114          	cp	a,#20
 477  015e 2402          	jruge	L341
 478                     ; 448 				Drive.Step = 0u;
 480  0160 3f46          	clr	_Drive+23
 481  0162               L341:
 482                     ; 456 			if  ( SAbs( Drive.Step ,Drive.PreStep ) > 1  )
 484  0162 b647          	ld	a,_Drive+24
 485  0164 97            	ld	xl,a
 486  0165 b646          	ld	a,_Drive+23
 487  0167 95            	ld	xh,a
 488  0168 cd01fb        	call	_SAbs
 490  016b a102          	cp	a,#2
 491  016d b646          	ld	a,_Drive+23
 492  016f 250b          	jrult	L541
 493                     ; 458 				if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
 495                     ; 462 						Drive.PreStep = Drive.Step;
 496                     ; 463 						StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
 500                     ; 475 					Drive.PreStep = Drive.Step;
 502                     ; 476 					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );					
 505  0171 b747          	ld	_Drive+24,a
 507  0173 4b00          	push	#0
 508  0175 5f            	clrw	x
 509  0176 97            	ld	xl,a
 510  0177 cd06ef        	call	_CPulse
 513  017a 200d          	jp	LC002
 514  017c               L541:
 515                     ; 480 				if ( Drive.Step == 0 && !Drive.Run  )
 517  017c 260f          	jrne	L351
 519  017e 7202002f0a    	btjt	_Drive,#1,L351
 520                     ; 482 					Drive.PreStep = Drive.Step;
 522  0183 454647        	mov	_Drive+24,_Drive+23
 523                     ; 483 					StartDriveOR( 0u , 0u );	//Drive.Step, 0u  );					
 525  0186 4b00          	push	#0
 526  0188 5f            	clrw	x
 528  0189               LC002:
 529  0189 cd0362        	call	_StartDriveOR
 530  018c 84            	pop	a
 531  018d               L351:
 532                     ; 486 			Timer.Motor = Ticks_1mS;
 534  018d be4e          	ldw	x,_Ticks_1mS
 535  018f bf02          	ldw	_Timer+2,x
 536                     ; 488 	}
 539  0191 81            	ret	
 566                     ; 492 void AdcService()
 566                     ; 493 {
 567                     	switch	.text
 568  0192               _AdcService:
 572                     ; 494 	if ( Diff ( Timer.Adc, 10u ) )
 574  0192 ae000a        	ldw	x,#10
 575  0195 89            	pushw	x
 576  0196 be04          	ldw	x,_Timer+4
 577  0198 ad73          	call	_Diff
 579  019a 4d            	tnz	a
 580  019b 85            	popw	x
 581  019c 2743          	jreq	L761
 582                     ; 496 			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
 584  019e b61b          	ld	a,_Adc+16
 585  01a0 5f            	clrw	x
 586  01a1 97            	ld	xl,a
 587  01a2 e616          	ld	a,(_Adc+11,x)
 588  01a4 5f            	clrw	x
 589  01a5 97            	ld	xl,a
 590  01a6 72b0001d      	subw	x,_Adc+18
 591  01aa 50            	negw	x
 592  01ab bf1d          	ldw	_Adc+18,x
 593                     ; 497 			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
 595  01ad be0b          	ldw	x,_Adc
 596  01af 54            	srlw	x
 597  01b0 54            	srlw	x
 598  01b1 b61b          	ld	a,_Adc+16
 599  01b3 905f          	clrw	y
 600  01b5 9097          	ld	yl,a
 601  01b7 01            	rrwa	x,a
 602  01b8 90e716        	ld	(_Adc+11,y),a
 603                     ; 498 			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
 605  01bb 5f            	clrw	x
 606  01bc b61b          	ld	a,_Adc+16
 607  01be 97            	ld	xl,a
 608  01bf e616          	ld	a,(_Adc+11,x)
 609  01c1 bb1e          	add	a,_Adc+19
 610  01c3 b71e          	ld	_Adc+19,a
 611  01c5 2402          	jrnc	L26
 612  01c7 3c1d          	inc	_Adc+18
 613  01c9               L26:
 614                     ; 499 			Adc.Average = Adc.Sum /5;
 616  01c9 be1d          	ldw	x,_Adc+18
 617  01cb a605          	ld	a,#5
 618  01cd 62            	div	x,a
 619  01ce 01            	rrwa	x,a
 620  01cf b71c          	ld	_Adc+17,a
 621                     ; 500 			if  (Adc.IdxAvg	>= 4 )
 623  01d1 b61b          	ld	a,_Adc+16
 624  01d3 a104          	cp	a,#4
 625  01d5 2504          	jrult	L171
 626                     ; 501 				Adc.IdxAvg = 0;
 628  01d7 3f1b          	clr	_Adc+16
 630  01d9 2002          	jra	L371
 631  01db               L171:
 632                     ; 503 				Adc.IdxAvg++;
 634  01db 3c1b          	inc	_Adc+16
 635  01dd               L371:
 636                     ; 505 			Timer.Adc = Ticks_1mS;
 638  01dd be4e          	ldw	x,_Ticks_1mS
 639  01df bf04          	ldw	_Timer+4,x
 640  01e1               L761:
 641                     ; 507 }
 644  01e1 81            	ret	
 672                     ; 509 void LedService()
 672                     ; 510 {
 673                     	switch	.text
 674  01e2               _LedService:
 678                     ; 523 		if ( Diff ( Timer.Led, ledint ) )
 680  01e2 be4a          	ldw	x,_ledint
 681  01e4 89            	pushw	x
 682  01e5 be00          	ldw	x,_Timer
 683  01e7 ad24          	call	_Diff
 685  01e9 4d            	tnz	a
 686  01ea 85            	popw	x
 687  01eb 270d          	jreq	L502
 688                     ; 525 			Timer.Led = Ticks_1mS;
 690  01ed be4e          	ldw	x,_Ticks_1mS
 691  01ef bf00          	ldw	_Timer,x
 692                     ; 526 			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
 694  01f1 4b10          	push	#16
 695  01f3 ae5005        	ldw	x,#20485
 696  01f6 cd0000        	call	_GPIO_WriteReverse
 698  01f9 84            	pop	a
 699  01fa               L502:
 700                     ; 528 }
 703  01fa 81            	ret	
 746                     ; 530 u8 SAbs(u8 s1, u8 s2)
 746                     ; 531 {
 747                     	switch	.text
 748  01fb               _SAbs:
 750  01fb 89            	pushw	x
 751       00000000      OFST:	set	0
 754                     ; 532 	if (s1 > s2 )
 756  01fc 9f            	ld	a,xl
 757  01fd 1101          	cp	a,(OFST+1,sp)
 758  01ff 2406          	jruge	L132
 759                     ; 533 		return s1 - s2;
 761  0201 9f            	ld	a,xl
 762  0202 1001          	sub	a,(OFST+1,sp)
 763  0204 40            	neg	a
 765  0205 2004          	jra	L47
 766  0207               L132:
 767                     ; 535 		return s2 - s1;
 769  0207 7b02          	ld	a,(OFST+2,sp)
 770  0209 1001          	sub	a,(OFST+1,sp)
 772  020b               L47:
 774  020b 85            	popw	x
 775  020c 81            	ret	
 828                     ; 539 u8  Diff( u16 time, u16 diff )
 828                     ; 540 {
 829                     	switch	.text
 830  020d               _Diff:
 832  020d 89            	pushw	x
 833  020e 520c          	subw	sp,#12
 834       0000000c      OFST:	set	12
 837                     ; 542 	t = Ticks_1mS;
 839  0210 be4e          	ldw	x,_Ticks_1mS
 840  0212 cd0000        	call	c_uitolx
 842  0215 96            	ldw	x,sp
 843  0216 1c0009        	addw	x,#OFST-3
 844  0219 cd0000        	call	c_rtol
 847                     ; 544 	if (time <= t )
 849  021c 1e0d          	ldw	x,(OFST+1,sp)
 850  021e cd0000        	call	c_uitolx
 852  0221 96            	ldw	x,sp
 853  0222 1c0009        	addw	x,#OFST-3
 854  0225 cd0000        	call	c_lcmp
 856  0228 222f          	jrugt	L362
 857                     ; 546 		if ( ( t - time ) > diff ) 
 859  022a 1e0d          	ldw	x,(OFST+1,sp)
 860  022c cd0000        	call	c_uitolx
 862  022f 96            	ldw	x,sp
 863  0230 1c0005        	addw	x,#OFST-7
 864  0233 cd0000        	call	c_rtol
 867  0236 96            	ldw	x,sp
 868  0237 1c0009        	addw	x,#OFST-3
 869  023a cd0000        	call	c_ltor
 871  023d 96            	ldw	x,sp
 872  023e 1c0005        	addw	x,#OFST-7
 873  0241 cd0000        	call	c_lsub
 875  0244 96            	ldw	x,sp
 876  0245 5c            	incw	x
 877  0246 cd0000        	call	c_rtol
 880  0249 1e11          	ldw	x,(OFST+5,sp)
 881  024b cd0000        	call	c_uitolx
 883  024e 96            	ldw	x,sp
 884  024f 5c            	incw	x
 885  0250 cd0000        	call	c_lcmp
 887                     ; 547 			return 1;
 889  0253 2537          	jrult	LC005
 890  0255               L562:
 891                     ; 549 			return 0;
 894  0255 4f            	clr	a
 896  0256               L001:
 898  0256 5b0e          	addw	sp,#14
 899  0258 81            	ret	
 900  0259               L362:
 901                     ; 553 		if ( ( 65535 - time + t  ) > diff ) 
 903  0259 1e0d          	ldw	x,(OFST+1,sp)
 904  025b cd0000        	call	c_uitolx
 906  025e 96            	ldw	x,sp
 907  025f 1c0005        	addw	x,#OFST-7
 908  0262 cd0000        	call	c_rtol
 911  0265 aeffff        	ldw	x,#65535
 912  0268 bf02          	ldw	c_lreg+2,x
 913  026a 5f            	clrw	x
 914  026b bf00          	ldw	c_lreg,x
 915  026d 96            	ldw	x,sp
 916  026e 1c0005        	addw	x,#OFST-7
 917  0271 cd0000        	call	c_lsub
 919  0274 96            	ldw	x,sp
 920  0275 1c0009        	addw	x,#OFST-3
 921  0278 cd0000        	call	c_ladd
 923  027b 96            	ldw	x,sp
 924  027c 5c            	incw	x
 925  027d cd0000        	call	c_rtol
 928  0280 1e11          	ldw	x,(OFST+5,sp)
 929  0282 cd0000        	call	c_uitolx
 931  0285 96            	ldw	x,sp
 932  0286 5c            	incw	x
 933  0287 cd0000        	call	c_lcmp
 935  028a 24c9          	jruge	L562
 936                     ; 554 			return 1;
 938  028c               LC005:
 940  028c a601          	ld	a,#1
 942  028e 20c6          	jra	L001
 943                     ; 556 			return 0;
 967                     ; 560 void OnTimer_1S(void)
 967                     ; 561 {
 968                     	switch	.text
 969  0290               _OnTimer_1S:
 973                     ; 563 }
 976  0290 81            	ret	
1001                     ; 568 OnTimer_1mS(void)
1001                     ; 569 { 	
1002                     	switch	.text
1003  0291               _OnTimer_1mS:
1007                     ; 570 	Ticks_1mS++;
1009  0291 be4e          	ldw	x,_Ticks_1mS
1010  0293 5c            	incw	x
1011  0294 bf4e          	ldw	_Ticks_1mS,x
1012                     ; 574 	if ( PowerDelay_1mS )
1014  0296 b613          	ld	a,_PowerDelay_1mS
1015  0298 2702          	jreq	L713
1016                     ; 575 		PowerDelay_1mS--;
1018  029a 3a13          	dec	_PowerDelay_1mS
1019  029c               L713:
1020                     ; 576 }
1023  029c 81            	ret	
1056                     ; 579 void OnTimer4(void)
1056                     ; 580 {
1057                     	switch	.text
1058  029d               _OnTimer4:
1062                     ; 581 	Ticks_50uS++;
1064  029d 3c50          	inc	_Ticks_50uS
1065                     ; 583 	if ( Adc.Delay == 0 )
1067  029f b61f          	ld	a,_Adc+20
1068  02a1 2605          	jrne	L133
1069                     ; 584 		Adc_Config( );
1071  02a3 cd081f        	call	L3_Adc_Config
1074  02a6 2002          	jra	L333
1075  02a8               L133:
1076                     ; 586 		Adc.Delay--;
1078  02a8 3a1f          	dec	_Adc+20
1079  02aa               L333:
1080                     ; 588 	if ( My.BoostEnable == 0 && Adc.Value[3] < 20 )	//		Power off
1082  02aa 7200002e15    	btjt	_My+14,#0,L533
1084  02af be11          	ldw	x,_Adc+6
1085  02b1 a30014        	cpw	x,#20
1086  02b4 240e          	jruge	L533
1087                     ; 591 		My.BoostEnable = 1;
1089  02b6 7210002e      	bset	_My+14,#0
1090                     ; 592 		GPIO_WriteHigh( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
1092  02ba 4b08          	push	#8
1093  02bc ae5000        	ldw	x,#20480
1094  02bf cd0000        	call	_GPIO_WriteHigh
1096                     ; 593 		Adc.Delay = 20;
1099  02c2 2018          	jp	LC006
1100  02c4               L533:
1101                     ; 595 	else if ( My.BoostEnable == 1 &&  Adc.Value[3] >800 )
1103  02c4 7201002e18    	btjf	_My+14,#0,L733
1105  02c9 be11          	ldw	x,_Adc+6
1106  02cb a30321        	cpw	x,#801
1107  02ce 2511          	jrult	L733
1108                     ; 598 		My.BoostEnable = 0;
1110  02d0 7211002e      	bres	_My+14,#0
1111                     ; 599 		GPIO_WriteLow( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
1113  02d4 4b08          	push	#8
1114  02d6 ae5000        	ldw	x,#20480
1115  02d9 cd0000        	call	_GPIO_WriteLow
1117  02dc               LC006:
1118  02dc 3514001f      	mov	_Adc+20,#20
1119  02e0 84            	pop	a
1120                     ; 600 		Adc.Delay = 20;
1122  02e1               L733:
1123                     ; 604 	if ( Ticks_50uS == 5 )
1125  02e1 b650          	ld	a,_Ticks_50uS
1126  02e3 a105          	cp	a,#5
1127  02e5 2615          	jrne	L343
1128                     ; 605 		Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
1130  02e7 4b02          	push	#2
1131  02e9 ae5000        	ldw	x,#20480
1132  02ec cd0000        	call	_GPIO_ReadInputPin
1134  02ef 5b01          	addw	sp,#1
1135  02f1 4d            	tnz	a
1136  02f2 2603          	jrne	L611
1137  02f4 4c            	inc	a
1138  02f5 2001          	jra	L221
1139  02f7               L611:
1140  02f7 4f            	clr	a
1141  02f8               L221:
1142  02f8 b744          	ld	_Drive+21,a
1144  02fa 202d          	jra	L543
1145  02fc               L343:
1146                     ; 607 		if ( Ticks_50uS == 10 )
1148  02fc a10a          	cp	a,#10
1149  02fe 261a          	jrne	L743
1150                     ; 608 		{	if ( My.ChargeOn ) 
1152  0300 7203002e0a    	btjf	_My+14,#1,L153
1153                     ; 609 				GPIO_WriteHigh( _CHARGE_ON_PORT, _CHARGE_ON_PIN ); 
1155  0305 4b10          	push	#16
1156  0307 ae500f        	ldw	x,#20495
1157  030a cd0000        	call	_GPIO_WriteHigh
1160  030d 2008          	jp	LC007
1161  030f               L153:
1162                     ; 611 				GPIO_WriteLow( _CHARGE_ON_PORT, _CHARGE_ON_PIN );
1164  030f 4b10          	push	#16
1165  0311 ae500f        	ldw	x,#20495
1166  0314 cd0000        	call	_GPIO_WriteLow
1168  0317               LC007:
1169  0317 84            	pop	a
1170  0318 200f          	jra	L543
1171  031a               L743:
1172                     ; 614 		if ( Ticks_50uS == 15 )
1174  031a a10f          	cp	a,#15
1175  031c 270b          	jreq	L543
1177                     ; 623 		if ( Ticks_50uS >= 20 )
1179  031e a114          	cp	a,#20
1180  0320 2507          	jrult	L543
1181                     ; 625 			Ticks_50uS = 0;
1183  0322 3f50          	clr	_Ticks_50uS
1184                     ; 627 			Ticks_1mS++;
1186  0324 be4e          	ldw	x,_Ticks_1mS
1187  0326 5c            	incw	x
1188  0327 bf4e          	ldw	_Ticks_1mS,x
1189  0329               L543:
1190                     ; 635 	if ( Drive.Ticks > 0 )
1192  0329 b640          	ld	a,_Drive+17
1193  032b 2702          	jreq	L563
1194                     ; 636 		Drive.Ticks--;
1196  032d 3a40          	dec	_Drive+17
1197  032f               L563:
1198                     ; 638 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
1200  032f 7201002f08    	btjf	_Drive,#0,L763
1202  0334 2606          	jrne	L763
1203                     ; 640 		DriveService();	
1205  0336 cd0475        	call	_DriveService
1207                     ; 641 		Drive.Ticks = Drive.Interval;
1209  0339 453f40        	mov	_Drive+17,_Drive+16
1210  033c               L763:
1211                     ; 644 }
1214  033c 81            	ret	
1238                     ; 651 void StopDrive(void)			//TROff()
1238                     ; 652 {	
1239                     	switch	.text
1240  033d               _StopDrive:
1244                     ; 653 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
1246  033d 4b80          	push	#128
1247  033f ae500a        	ldw	x,#20490
1248  0342 cd0000        	call	_GPIO_WriteLow
1250  0345 84            	pop	a
1251                     ; 654 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1253  0346 4b20          	push	#32
1254  0348 ae500a        	ldw	x,#20490
1255  034b cd0000        	call	_GPIO_WriteLow
1257  034e 84            	pop	a
1258                     ; 655 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
1260  034f 4b40          	push	#64
1261  0351 ae500a        	ldw	x,#20490
1262  0354 cd0000        	call	_GPIO_WriteLow
1264  0357 84            	pop	a
1265                     ; 656 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1267  0358 4b04          	push	#4
1268  035a ae5000        	ldw	x,#20480
1269  035d cd0000        	call	_GPIO_WriteLow
1271  0360 84            	pop	a
1272                     ; 657 }
1275  0361 81            	ret	
1320                     ; 663 void StartDriveOR( uint16_t Target, uint8_t overrun )
1320                     ; 664 {
1321                     	switch	.text
1322  0362               _StartDriveOR:
1324  0362 89            	pushw	x
1325       00000000      OFST:	set	0
1328                     ; 665 	if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
1330  0363 7203002f20    	btjf	_Drive,#1,L324
1331                     ; 667 		if ( Drive.Dir == 1 && Drive.Position < Target )			// same dir
1333  0368 7209002f04    	btjf	_Drive,#4,L524
1335  036d b330          	cpw	x,_Drive+1
1336  036f 2217          	jrugt	L324
1338  0371               L524:
1339                     ; 671 		else if ( Drive.Dir == 0 && Drive.Position > Target )
1341  0371 7208002f0c    	btjt	_Drive,#4,L134
1343  0376 be30          	ldw	x,_Drive+1
1344  0378 1301          	cpw	x,(OFST+1,sp)
1345  037a 2306          	jrule	L134
1346                     ; 673 			if ( Target == 0 )
1348  037c 1e01          	ldw	x,(OFST+1,sp)
1349  037e 2608          	jrne	L324
1350                     ; 674 				return;
1352  0380 2004          	jra	L251
1353  0382               L134:
1354                     ; 678 			Drive.Stop = 1;
1356  0382 7216002f      	bset	_Drive,#3
1357                     ; 679 			return;
1358  0386               L251:
1361  0386 85            	popw	x
1362  0387 81            	ret	
1363  0388               L324:
1364                     ; 686 	Drive.PreStep = Drive.Step;
1366  0388 454647        	mov	_Drive+24,_Drive+23
1367                     ; 689 	if ( Drive.Position == Target ) return;
1369  038b be30          	ldw	x,_Drive+1
1370  038d 1301          	cpw	x,(OFST+1,sp)
1371  038f 27f5          	jreq	L251
1374                     ; 691 	if ( Target == 0 )				//  goto origin
1376  0391 1e01          	ldw	x,(OFST+1,sp)
1377  0393 260e          	jrne	L144
1378                     ; 693 		Drive.Overrun =	0u;
1380  0395 5f            	clrw	x
1381  0396 bf34          	ldw	_Drive+5,x
1382                     ; 694 		Drive.ZeroOffset = CPulse( OVER_STEP );
1384  0398 ae001e        	ldw	x,#30
1385  039b cd06ef        	call	_CPulse
1387  039e bf37          	ldw	_Drive+8,x
1388                     ; 697 		Drive.Target = 0u;
1390  03a0 5f            	clrw	x
1391                     ; 698 		Drive.State = nMotorClose;		// 0;
1393  03a1 2013          	jp	LC008
1394  03a3               L144:
1395                     ; 703 		if (Drive.Position >= Target)		// Closing
1397  03a3 be30          	ldw	x,_Drive+1
1398  03a5 1301          	cpw	x,(OFST+1,sp)
1399  03a7 2513          	jrult	L544
1400                     ; 705 			Drive.Dir = 0;
1402  03a9 7219002f      	bres	_Drive,#4
1403                     ; 706 			Drive.Overrun =	0u;
1405  03ad 5f            	clrw	x
1406  03ae bf34          	ldw	_Drive+5,x
1407                     ; 707 			Drive.State = nMotorClose;
1409  03b0 3f3e          	clr	_Drive+15
1410                     ; 708 			Drive.Overrun2 = 0u;
1412  03b2 3f36          	clr	_Drive+7
1413                     ; 709 			Drive.Target = Target;
1415  03b4 1e01          	ldw	x,(OFST+1,sp)
1416                     ; 710 			Drive.State = nMotorClose;		// 0;
1418  03b6               LC008:
1419  03b6 bf32          	ldw	_Drive+3,x
1421  03b8 3f3e          	clr	_Drive+15
1423  03ba 201b          	jra	L344
1424  03bc               L544:
1425                     ; 714 			Drive.Dir = 1;
1427  03bc 7218002f      	bset	_Drive,#4
1428                     ; 715 			Drive.State = nMotorOpen;	//1;
1430  03c0 3501003e      	mov	_Drive+15,#1
1431                     ; 716 			Drive.Overrun2 = overrun;		//100;
1433  03c4 7b05          	ld	a,(OFST+5,sp)
1434  03c6 b736          	ld	_Drive+7,a
1435                     ; 717 			Drive.Target = Target + overrun;	//100;	
1437  03c8 7b01          	ld	a,(OFST+1,sp)
1438  03ca 97            	ld	xl,a
1439  03cb 7b02          	ld	a,(OFST+2,sp)
1440  03cd 1b05          	add	a,(OFST+5,sp)
1441  03cf 2401          	jrnc	L051
1442  03d1 5c            	incw	x
1443  03d2               L051:
1444  03d2 b733          	ld	_Drive+4,a
1445  03d4 9f            	ld	a,xl
1446  03d5 b732          	ld	_Drive+3,a
1447  03d7               L344:
1448                     ; 721 	Drive.Run = TRUE;
1450  03d7 7212002f      	bset	_Drive,#1
1451                     ; 722 	Drive.Ticks = Drive.Interval;
1453  03db 453f40        	mov	_Drive+17,_Drive+16
1454                     ; 723 }
1456  03de 20a6          	jra	L251
1516                     ; 729 void MotorStep(MOTOR_DIR Dir)
1516                     ; 730 {
1517                     	switch	.text
1518  03e0               _MotorStep:
1522                     ; 731 	if ( Dir == nMotorClose )
1524  03e0 4d            	tnz	a
1525  03e1 2625          	jrne	L505
1526                     ; 733 		if ( Drive.Position != 0 ) 
1528  03e3 be30          	ldw	x,_Drive+1
1529  03e5 270f          	jreq	LC009
1530                     ; 735 			Drive.Position--;
1532  03e7 5a            	decw	x
1533  03e8 bf30          	ldw	_Drive+1,x
1534                     ; 736 			if ( Drive.NormalOpen )
1536  03ea b645          	ld	a,_Drive+22
1537  03ec 2704          	jreq	L115
1538                     ; 737 				Drive.Phase++;   // NC
1540  03ee 3c39          	inc	_Drive+10
1542  03f0 2047          	jra	L125
1543  03f2               L115:
1544                     ; 740 				Drive.Phase--;	//NC
1546  03f2 3a39          	dec	_Drive+10
1547  03f4 2043          	jra	L125
1548                     ; 744 		if ( Drive.Position == 0 ) 
1550  03f6               LC009:
1551                     ; 747 			Drive.Overrun = 0u;
1553  03f6 5f            	clrw	x
1554  03f7 bf34          	ldw	_Drive+5,x
1555                     ; 748 			Drive.Run = FALSE;
1557  03f9 7213002f      	bres	_Drive,#1
1558                     ; 749 			Drive.ZeroOffset = 0u;
1560  03fd bf37          	ldw	_Drive+8,x
1561                     ; 750 			Drive.Position = 0u;
1563  03ff bf30          	ldw	_Drive+1,x
1564                     ; 751 			Drive.Target = 0u;
1566  0401 bf32          	ldw	_Drive+3,x
1567                     ; 752 			StopDrive();	
1569  0403 cd033d        	call	_StopDrive
1571  0406 2031          	jra	L125
1572  0408               L505:
1573                     ; 758 			Drive.Position++;
1575  0408 be30          	ldw	x,_Drive+1
1576  040a 5c            	incw	x
1577  040b bf30          	ldw	_Drive+1,x
1578                     ; 760 		if ( Drive.NormalOpen )
1580  040d b645          	ld	a,_Drive+22
1581  040f 2704          	jreq	L325
1582                     ; 761 				Drive.Phase--;
1584  0411 3a39          	dec	_Drive+10
1586  0413 2002          	jra	L525
1587  0415               L325:
1588                     ; 763 				Drive.Phase++;
1590  0415 3c39          	inc	_Drive+10
1591  0417               L525:
1592                     ; 766 		if ( Drive.Origin ) 
1594  0417 b644          	ld	a,_Drive+21
1595  0419 2708          	jreq	L725
1596                     ; 768 			Drive.ORGPosition = Drive.Position;
1598  041b bf3c          	ldw	_Drive+13,x
1599                     ; 769 			Drive.LastOrigin = TRUE;
1601  041d 7214002f      	bset	_Drive,#2
1603  0421 2016          	jra	L125
1604  0423               L725:
1605                     ; 772 			if ( Drive.LastOrigin )
1607  0423 7205002f11    	btjf	_Drive,#2,L125
1608                     ; 774 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1610  0428 be3c          	ldw	x,_Drive+13
1611  042a 1d0028        	subw	x,#40
1612  042d bf3a          	ldw	_Drive+11,x
1613                     ; 775 				if ( Drive.MaxOverrun > OVERRUN )
1615  042f a3012d        	cpw	x,#301
1616  0432 2505          	jrult	L125
1617                     ; 776 					Drive.MaxOverrun = OVERRUN;				
1619  0434 ae012c        	ldw	x,#300
1620  0437 bf3a          	ldw	_Drive+11,x
1621  0439               L125:
1622                     ; 781 	if ( !Drive.Run ) return;
1624  0439 7202002f01    	btjt	_Drive,#1,L735
1628  043e 81            	ret	
1629  043f               L735:
1630                     ; 782 	if ( !Drive.Enabled ) return;
1632  043f 7200002f01    	btjt	_Drive,#0,L145
1636  0444 81            	ret	
1637  0445               L145:
1638                     ; 783 	switch ( Drive.ExcitationType )
1640  0445 b643          	ld	a,_Drive+20
1642                     ; 794 			break;
1643  0447 2707          	jreq	L154
1644  0449 4a            	dec	a
1645  044a 2707          	jreq	L354
1646  044c 4a            	dec	a
1647  044d 2707          	jreq	L554
1649  044f 81            	ret	
1650  0450               L154:
1651                     ; 786 		case 0:
1651                     ; 787 			Excitation_1Phase();	
1654                     ; 788 			break;
1657  0450 cc0629        	jp	_Excitation_1Phase
1658  0453               L354:
1659                     ; 789 		case 1:
1659                     ; 790 			Excitation_12Phase();
1662                     ; 791 			break;
1665  0453 cc0560        	jp	_Excitation_12Phase
1666  0456               L554:
1667                     ; 792 		case 2:
1667                     ; 793 			Excitation_2Phase();
1670                     ; 794 			break;
1672                     ; 799 }
1675  0456 207a          	jp	_Excitation_2Phase
1701                     ; 804 void MotorClose(void)
1701                     ; 805 {
1702                     	switch	.text
1703  0458               _MotorClose:
1707                     ; 807 	if ( Drive.Origin )   		// Hall IC Sensing 
1709  0458 b644          	ld	a,_Drive+21
1710  045a 2715          	jreq	L755
1711                     ; 809 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1713  045c be34          	ldw	x,_Drive+5
1714  045e b33a          	cpw	x,_Drive+11
1715  0460 250c          	jrult	L165
1716                     ; 811 			Drive.Target = 0u;
1718  0462 5f            	clrw	x
1719  0463 bf32          	ldw	_Drive+3,x
1720                     ; 812 			Drive.Position = 0u;
1722  0465 bf30          	ldw	_Drive+1,x
1723                     ; 813 			Drive.Overrun = 0u;
1725  0467 bf34          	ldw	_Drive+5,x
1726                     ; 814 			Drive.ZeroOffset = 0u;
1728  0469 bf37          	ldw	_Drive+8,x
1729                     ; 818 			StopDrive();
1734  046b cc033d        	jp	_StopDrive
1735  046e               L165:
1736                     ; 822 			Drive.Overrun++;
1738  046e 5c            	incw	x
1739  046f bf34          	ldw	_Drive+5,x
1740                     ; 823 			MotorStep(nMotorClose);
1742  0471               L755:
1743                     ; 827 		MotorStep(nMotorClose);		// move 1 step close
1746  0471 4f            	clr	a
1748                     ; 828 }
1751  0472 cc03e0        	jp	_MotorStep
1778                     ; 833 void DriveService(void)
1778                     ; 834 {
1779                     	switch	.text
1780  0475               _DriveService:
1782  0475 89            	pushw	x
1783       00000002      OFST:	set	2
1786                     ; 836 	if ( ! Drive.Run ) 
1788  0476 7202002f02    	btjt	_Drive,#1,L775
1789                     ; 839 		StopDrive();
1791                     ; 840 		return;	//when Drive is stop 
1793  047b 2050          	jp	LC011
1794  047d               L775:
1795                     ; 843 	if ( Drive.Stop )
1797  047d 7207002f08    	btjf	_Drive,#3,L106
1798                     ; 845 		Drive.Stop = 0;
1800  0482 7217002f      	bres	_Drive,#3
1801                     ; 846 		Drive.Target = Drive.Position ;
1803  0486 be30          	ldw	x,_Drive+1
1804  0488 bf32          	ldw	_Drive+3,x
1805  048a               L106:
1806                     ; 849 	if ( Drive.Target > Drive.Position )
1808  048a be32          	ldw	x,_Drive+3
1809  048c b330          	cpw	x,_Drive+1
1810  048e 2307          	jrule	L306
1811                     ; 850 	 	MotorStep(nMotorOpen);
1813  0490 a601          	ld	a,#1
1814  0492 cd03e0        	call	_MotorStep
1817  0495 2039          	jra	L506
1818  0497               L306:
1819                     ; 851 	else if ( Drive.Target < Drive.Position )
1821  0497 b330          	cpw	x,_Drive+1
1822  0499 2404          	jruge	L706
1823                     ; 852 		MotorClose( );
1825  049b adbb          	call	_MotorClose
1828  049d 2031          	jra	L506
1829  049f               L706:
1830                     ; 853 	else if ( Drive.Target ) 	// on target position
1832  049f be32          	ldw	x,_Drive+3
1833  04a1 2721          	jreq	L316
1834                     ; 855 			if ( Drive.Overrun2 )
1836  04a3 b636          	ld	a,_Drive+7
1837  04a5 270f          	jreq	L516
1838                     ; 857 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1840  04a7 5f            	clrw	x
1841  04a8 97            	ld	xl,a
1842  04a9 1f01          	ldw	(OFST-1,sp),x
1844  04ab be32          	ldw	x,_Drive+3
1845  04ad 72f001        	subw	x,(OFST-1,sp)
1846  04b0 bf32          	ldw	_Drive+3,x
1847                     ; 858 				Drive.Overrun2 = 0u;
1849  04b2 3f36          	clr	_Drive+7
1851  04b4 201a          	jra	L506
1852  04b6               L516:
1853                     ; 862 				Drive.ZeroOffset = 0u;
1855  04b6 5f            	clrw	x
1856  04b7 bf37          	ldw	_Drive+8,x
1857                     ; 863 				Drive.Overrun = 0u;
1859  04b9 bf34          	ldw	_Drive+5,x
1860                     ; 865 				StopDrive();	
1862  04bb cd033d        	call	_StopDrive
1864                     ; 866 				Drive.Run = FALSE;				
1866  04be 7213002f      	bres	_Drive,#1
1867  04c2 200c          	jra	L506
1868  04c4               L316:
1869                     ; 872 			Drive.ZeroOffset = 0u;
1871  04c4 5f            	clrw	x
1872  04c5 bf37          	ldw	_Drive+8,x
1873                     ; 873 			Drive.Overrun = 0u;
1875  04c7 bf34          	ldw	_Drive+5,x
1876                     ; 874 			Drive.Run = FALSE;
1878  04c9 7213002f      	bres	_Drive,#1
1879                     ; 875 			StopDrive();	
1881  04cd               LC011:
1883  04cd cd033d        	call	_StopDrive
1885  04d0               L506:
1886                     ; 877 }
1889  04d0 85            	popw	x
1890  04d1 81            	ret	
1916                     ; 880 void Excitation_2Phase( void )
1916                     ; 881 {
1917                     	switch	.text
1918  04d2               _Excitation_2Phase:
1922                     ; 883 	switch (Drive.Phase%8)
1924  04d2 b639          	ld	a,_Drive+10
1925  04d4 a407          	and	a,#7
1927                     ; 915 		default:
1927                     ; 916 			break;
1928  04d6 2716          	jreq	L326
1929  04d8 4a            	dec	a
1930  04d9 2713          	jreq	L326
1931  04db 4a            	dec	a
1932  04dc 271e          	jreq	L526
1933  04de 4a            	dec	a
1934  04df 271b          	jreq	L526
1935  04e1 4a            	dec	a
1936  04e2 272f          	jreq	L726
1937  04e4 4a            	dec	a
1938  04e5 272c          	jreq	L726
1939  04e7 4a            	dec	a
1940  04e8 2737          	jreq	L136
1941  04ea 4a            	dec	a
1942  04eb 2734          	jreq	L136
1944  04ed 81            	ret	
1945  04ee               L326:
1946                     ; 885 		case 0:
1946                     ; 886 		case 1:
1946                     ; 887 		//case 1:
1946                     ; 888 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1948  04ee ad48          	call	LC015
1949                     ; 889 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1951  04f0 ad5a          	call	LC017
1952                     ; 890 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1954  04f2 4b40          	push	#64
1955  04f4 ae500a        	ldw	x,#20490
1956  04f7 cd0000        	call	_GPIO_WriteLow
1958                     ; 891 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1960                     ; 892 			break;		
1962  04fa 200c          	jp	LC014
1963  04fc               L526:
1964                     ; 893 		case 2:
1964                     ; 894 		case 3:
1964                     ; 895 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1966  04fc ad44          	call	LC016
1967                     ; 896 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1969  04fe ad4c          	call	LC017
1970                     ; 897 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1972  0500 4b40          	push	#64
1973  0502 ae500a        	ldw	x,#20490
1974  0505 cd0000        	call	_GPIO_WriteHigh
1976                     ; 898 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1978  0508               LC014:
1979  0508 84            	pop	a
1981  0509 4b04          	push	#4
1982  050b ae5000        	ldw	x,#20480
1983  050e cd0000        	call	_GPIO_WriteLow
1985                     ; 899 			break;
1987  0511 2023          	jp	LC012
1988  0513               L726:
1989                     ; 900 		case 4:
1989                     ; 901 		case 5:
1989                     ; 902 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1991  0513 ad2d          	call	LC016
1992                     ; 903 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1994  0515 ad3f          	call	LC018
1995                     ; 904 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1997  0517 4b40          	push	#64
1998  0519 ae500a        	ldw	x,#20490
1999  051c cd0000        	call	_GPIO_WriteHigh
2001                     ; 905 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2003                     ; 906 			break;
2005  051f 200c          	jp	LC013
2006  0521               L136:
2007                     ; 907 		case 6:
2007                     ; 908 		case 7:		
2007                     ; 909 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2009  0521 ad15          	call	LC015
2010                     ; 910 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2012  0523 ad31          	call	LC018
2013                     ; 911 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2015  0525 4b40          	push	#64
2016  0527 ae500a        	ldw	x,#20490
2017  052a cd0000        	call	_GPIO_WriteLow
2019                     ; 912 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2021  052d               LC013:
2022  052d 84            	pop	a
2024  052e 4b04          	push	#4
2025  0530 ae5000        	ldw	x,#20480
2026  0533 cd0000        	call	_GPIO_WriteHigh
2028  0536               LC012:
2029  0536 84            	pop	a
2030                     ; 913 			break;
2032                     ; 915 		default:
2032                     ; 916 			break;
2034                     ; 919 }
2037  0537 81            	ret	
2038  0538               LC015:
2039  0538 4b80          	push	#128
2040  053a ae500a        	ldw	x,#20490
2041  053d cd0000        	call	_GPIO_WriteHigh
2043  0540 84            	pop	a
2044  0541 81            	ret	
2045  0542               LC016:
2046  0542 4b80          	push	#128
2047  0544 ae500a        	ldw	x,#20490
2048  0547 cd0000        	call	_GPIO_WriteLow
2050  054a 84            	pop	a
2051  054b 81            	ret	
2052  054c               LC017:
2053  054c 4b20          	push	#32
2054  054e ae500a        	ldw	x,#20490
2055  0551 cd0000        	call	_GPIO_WriteHigh
2057  0554 84            	pop	a
2058  0555 81            	ret	
2059  0556               LC018:
2060  0556 4b20          	push	#32
2061  0558 ae500a        	ldw	x,#20490
2062  055b cd0000        	call	_GPIO_WriteLow
2064  055e 84            	pop	a
2065  055f 81            	ret	
2091                     ; 922 void Excitation_12Phase( void )
2091                     ; 923 {
2092                     	switch	.text
2093  0560               _Excitation_12Phase:
2097                     ; 925 	switch (Drive.Phase%8)
2099  0560 b639          	ld	a,_Drive+10
2100  0562 a407          	and	a,#7
2102                     ; 976 		default:
2102                     ; 977 			break;
2103  0564 2716          	jreq	L156
2104  0566 4a            	dec	a
2105  0567 271d          	jreq	L356
2106  0569 4a            	dec	a
2107  056a 272d          	jreq	L556
2108  056c 4a            	dec	a
2109  056d 273f          	jreq	L756
2110  056f 4a            	dec	a
2111  0570 2748          	jreq	L166
2112  0572 4a            	dec	a
2113  0573 2753          	jreq	L366
2114  0575 4a            	dec	a
2115  0576 276e          	jreq	L566
2116  0578 4a            	dec	a
2117  0579 2775          	jreq	L766
2119  057b 81            	ret	
2120  057c               L156:
2121                     ; 927 		case 0:
2121                     ; 928 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2123  057c 4b80          	push	#128
2124  057e ae500a        	ldw	x,#20490
2125  0581 cd0000        	call	_GPIO_WriteHigh
2127                     ; 929 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2129                     ; 930 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2131                     ; 931 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2133                     ; 932 			break;
2135  0584 2008          	jp	LC022
2136  0586               L356:
2137                     ; 933 		case 1:
2137                     ; 934 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2139  0586 4b80          	push	#128
2140  0588 ae500a        	ldw	x,#20490
2141  058b cd0000        	call	_GPIO_WriteLow
2143                     ; 935 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2145  058e               LC022:
2146  058e 84            	pop	a
2148  058f 4b20          	push	#32
2149  0591 ae500a        	ldw	x,#20490
2150  0594 cd0000        	call	_GPIO_WriteHigh
2152                     ; 936 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2154                     ; 937 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2156                     ; 938 			break;		
2158  0597 2068          	jp	LC021
2159  0599               L556:
2160                     ; 939 		case 2:
2160                     ; 940 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2162  0599 ad7a          	call	LC026
2163                     ; 941 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2165  059b 4b20          	push	#32
2166  059d ae500a        	ldw	x,#20490
2167  05a0 cd0000        	call	_GPIO_WriteHigh
2169                     ; 942 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2171  05a3               LC023:
2172  05a3 84            	pop	a
2174  05a4 4b40          	push	#64
2175  05a6 ae500a        	ldw	x,#20490
2176  05a9 cd0000        	call	_GPIO_WriteHigh
2178                     ; 943 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
2180                     ; 944 			break;
2182  05ac 205c          	jp	LC020
2183  05ae               L756:
2184                     ; 945 		case 3:
2184                     ; 946 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2186  05ae ad65          	call	LC026
2187                     ; 947 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2189  05b0 4b20          	push	#32
2190  05b2 ae500a        	ldw	x,#20490
2191  05b5 cd0000        	call	_GPIO_WriteLow
2193                     ; 948 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2195                     ; 949 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2197                     ; 950 			break;
2199  05b8 20e9          	jp	LC023
2200  05ba               L166:
2201                     ; 951 		case 4:
2201                     ; 952 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2203  05ba ad59          	call	LC026
2204                     ; 953 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2206  05bc ad61          	call	LC027
2207                     ; 954 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2209  05be 4b40          	push	#64
2210  05c0 ae500a        	ldw	x,#20490
2211  05c3 cd0000        	call	_GPIO_WriteHigh
2213                     ; 955 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2215                     ; 956 			break;
2217  05c6 2013          	jp	LC024
2218  05c8               L366:
2219                     ; 957 		case 5: 
2219                     ; 958 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2221  05c8 4b80          	push	#128
2222  05ca ae500a        	ldw	x,#20490
2223  05cd cd0000        	call	_GPIO_WriteLow
2225                     ; 959 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2228                     ; 960 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2230  05d0               LC025:
2231  05d0 84            	pop	a
2233  05d1 ad4c          	call	LC027
2235  05d3 4b40          	push	#64
2236  05d5 ae500a        	ldw	x,#20490
2237  05d8 cd0000        	call	_GPIO_WriteLow
2239                     ; 961 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2241  05db               LC024:
2242  05db 84            	pop	a
2245  05dc 4b04          	push	#4
2246  05de ae5000        	ldw	x,#20480
2247  05e1 cd0000        	call	_GPIO_WriteHigh
2249                     ; 962 			break;
2251  05e4 202d          	jp	LC019
2252  05e6               L566:
2253                     ; 963 		case 6:  
2253                     ; 964 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2255  05e6 4b80          	push	#128
2256  05e8 ae500a        	ldw	x,#20490
2257  05eb cd0000        	call	_GPIO_WriteHigh
2259                     ; 965 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2261                     ; 966 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2263                     ; 967 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
2265                     ; 968 			break;
2267  05ee 20e0          	jp	LC025
2268  05f0               L766:
2269                     ; 969 		case 7:
2269                     ; 970 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2271  05f0 4b80          	push	#128
2272  05f2 ae500a        	ldw	x,#20490
2273  05f5 cd0000        	call	_GPIO_WriteHigh
2275  05f8 84            	pop	a
2276                     ; 971 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2278  05f9 4b20          	push	#32
2279  05fb ae500a        	ldw	x,#20490
2280  05fe cd0000        	call	_GPIO_WriteLow
2282                     ; 972 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2284  0601               LC021:
2285  0601 84            	pop	a
2288  0602 4b40          	push	#64
2289  0604 ae500a        	ldw	x,#20490
2290  0607 cd0000        	call	_GPIO_WriteLow
2292                     ; 973 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2294  060a               LC020:
2295  060a 84            	pop	a
2300  060b 4b04          	push	#4
2301  060d ae5000        	ldw	x,#20480
2302  0610 cd0000        	call	_GPIO_WriteLow
2304  0613               LC019:
2305  0613 84            	pop	a
2306                     ; 974 			break;
2308                     ; 976 		default:
2308                     ; 977 			break;
2310                     ; 980 }
2313  0614 81            	ret	
2314  0615               LC026:
2315  0615 4b80          	push	#128
2316  0617 ae500a        	ldw	x,#20490
2317  061a cd0000        	call	_GPIO_WriteLow
2319  061d 84            	pop	a
2320  061e 81            	ret	
2321  061f               LC027:
2322  061f 4b20          	push	#32
2323  0621 ae500a        	ldw	x,#20490
2324  0624 cd0000        	call	_GPIO_WriteLow
2326  0627 84            	pop	a
2327  0628 81            	ret	
2353                     ; 982 void Excitation_1Phase( void )
2353                     ; 983 {
2354                     	switch	.text
2355  0629               _Excitation_1Phase:
2359                     ; 986 	switch (Drive.Phase%8)
2361  0629 b639          	ld	a,_Drive+10
2362  062b a407          	and	a,#7
2364                     ; 1017 		default:
2364                     ; 1018 			break;
2365  062d 2716          	jreq	L707
2366  062f 4a            	dec	a
2367  0630 2713          	jreq	L707
2368  0632 4a            	dec	a
2369  0633 2723          	jreq	L117
2370  0635 4a            	dec	a
2371  0636 2720          	jreq	L117
2372  0638 4a            	dec	a
2373  0639 273b          	jreq	L317
2374  063b 4a            	dec	a
2375  063c 2738          	jreq	L317
2376  063e 4a            	dec	a
2377  063f 2741          	jreq	L517
2378  0641 4a            	dec	a
2379  0642 273e          	jreq	L517
2381  0644 81            	ret	
2382  0645               L707:
2383                     ; 988 		case 0:
2383                     ; 989 		case 1:
2383                     ; 990 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2385  0645 4b80          	push	#128
2386  0647 ae500a        	ldw	x,#20490
2387  064a cd0000        	call	_GPIO_WriteHigh
2389  064d 84            	pop	a
2390                     ; 991 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2392  064e 4b20          	push	#32
2393  0650 ae500a        	ldw	x,#20490
2394  0653 cd0000        	call	_GPIO_WriteLow
2396                     ; 992 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2398                     ; 993 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
2400                     ; 994 			break;		
2402  0656 200a          	jp	LC030
2403  0658               L117:
2404                     ; 995 		case 2:
2404                     ; 996 		case 3:
2404                     ; 997 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2406  0658 ad49          	call	LC032
2407                     ; 998 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2409  065a 4b20          	push	#32
2410  065c ae500a        	ldw	x,#20490
2411  065f cd0000        	call	_GPIO_WriteHigh
2413                     ; 999 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2415  0662               LC030:
2416  0662 84            	pop	a
2418  0663 4b40          	push	#64
2419  0665 ae500a        	ldw	x,#20490
2420  0668 cd0000        	call	_GPIO_WriteLow
2422                     ; 1000 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2424  066b               LC029:
2425  066b 84            	pop	a
2428  066c 4b04          	push	#4
2429  066e ae5000        	ldw	x,#20480
2430  0671 cd0000        	call	_GPIO_WriteLow
2432                     ; 1001 			break;
2434  0674 201f          	jp	LC028
2435  0676               L317:
2436                     ; 1002 		case 4:
2436                     ; 1003 		case 5:
2436                     ; 1004 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2438  0676 ad1f          	call	LC031
2439                     ; 1006 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2441  0678 4b40          	push	#64
2442  067a ae500a        	ldw	x,#20490
2443  067d cd0000        	call	_GPIO_WriteHigh
2445                     ; 1007 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
2447                     ; 1008 			break;
2449  0680 20e9          	jp	LC029
2450  0682               L517:
2451                     ; 1009 		case 6:
2451                     ; 1010 		case 7:
2451                     ; 1011 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
2453  0682 ad13          	call	LC031
2454                     ; 1013 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
2456  0684 4b40          	push	#64
2457  0686 ae500a        	ldw	x,#20490
2458  0689 cd0000        	call	_GPIO_WriteLow
2460  068c 84            	pop	a
2461                     ; 1014 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
2463  068d 4b04          	push	#4
2464  068f ae5000        	ldw	x,#20480
2465  0692 cd0000        	call	_GPIO_WriteHigh
2467  0695               LC028:
2468  0695 84            	pop	a
2469                     ; 1015 			break;
2471                     ; 1017 		default:
2471                     ; 1018 			break;
2473                     ; 1021 }
2476  0696 81            	ret	
2477  0697               LC031:
2478  0697 ad0a          	call	LC032
2479                     ; 1005 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2481  0699 4b20          	push	#32
2482  069b ae500a        	ldw	x,#20490
2483  069e cd0000        	call	_GPIO_WriteLow
2485  06a1 84            	pop	a
2486  06a2 81            	ret	
2487  06a3               LC032:
2488  06a3 4b80          	push	#128
2489  06a5 ae500a        	ldw	x,#20490
2490  06a8 cd0000        	call	_GPIO_WriteLow
2492  06ab 84            	pop	a
2493  06ac 81            	ret	
2528                     ; 1024 u8 Interval( u16 Vmon)
2528                     ; 1025 {
2529                     	switch	.text
2530  06ad               _Interval:
2532  06ad 89            	pushw	x
2533       00000000      OFST:	set	0
2536                     ; 1026 	Vmon = Vmon / IntervalSlope;
2538  06ae a61c          	ld	a,#28
2539  06b0 62            	div	x,a
2540                     ; 1028 	if (Vmon < 10 ) Vmon = 10;
2542  06b1 a3000a        	cpw	x,#10
2543  06b4 2403          	jruge	L357
2546  06b6 ae000a        	ldw	x,#10
2547  06b9               L357:
2548                     ; 1029 	if (Vmon > 26 ) Vmon = 26;
2550  06b9 a3001b        	cpw	x,#27
2551  06bc 2503          	jrult	L557
2554  06be ae001a        	ldw	x,#26
2555  06c1               L557:
2556                     ; 1031 	return ( TableInterval[ Vmon-10 ] );
2558  06c1 1d000a        	subw	x,#10
2559  06c4 e602          	ld	a,(_TableInterval,x)
2562  06c6 85            	popw	x
2563  06c7 81            	ret	
2607                     .const:	section	.text
2608  0000               L624:
2609  0000 00000064      	dc.l	100
2610                     ; 1046 uint16_t CStep( uint16_t pulse )
2610                     ; 1047 {
2611                     	switch	.text
2612  06c8               _CStep:
2614  06c8 5204          	subw	sp,#4
2615       00000004      OFST:	set	4
2618                     ; 1051 	i = (uint32_t) pulse * My.GearRatio100 ;
2620  06ca 90be2c        	ldw	y,_My+12
2621  06cd cd0000        	call	c_umul
2623  06d0 96            	ldw	x,sp
2624  06d1 5c            	incw	x
2625  06d2 cd0000        	call	c_rtol
2628                     ; 1052 	i = (i+1)/100;   				// Round up  20150925
2630  06d5 96            	ldw	x,sp
2631  06d6 5c            	incw	x
2632  06d7 cd0000        	call	c_ltor
2634  06da a601          	ld	a,#1
2635  06dc cd0000        	call	c_ladc
2637  06df ae0000        	ldw	x,#L624
2638  06e2 cd0000        	call	c_ludv
2640  06e5 96            	ldw	x,sp
2641  06e6 5c            	incw	x
2642  06e7 cd0000        	call	c_rtol
2645                     ; 1053 	return (uint16_t) i;
2647  06ea 1e03          	ldw	x,(OFST-1,sp)
2650  06ec 5b04          	addw	sp,#4
2651  06ee 81            	ret	
2695                     ; 1057 uint16_t CPulse( uint16_t step )
2695                     ; 1058 {
2696                     	switch	.text
2697  06ef               _CPulse:
2699  06ef 5204          	subw	sp,#4
2700       00000004      OFST:	set	4
2703                     ; 1067 	i = (uint32_t) step * My.GearRatio100 ;
2705  06f1 90be2c        	ldw	y,_My+12
2706  06f4 cd0000        	call	c_umul
2708  06f7 96            	ldw	x,sp
2709  06f8 5c            	incw	x
2710  06f9 cd0000        	call	c_rtol
2713                     ; 1071 	return (uint16_t) i;
2715  06fc 1e03          	ldw	x,(OFST-1,sp)
2718  06fe 5b04          	addw	sp,#4
2719  0700 81            	ret	
2748                     ; 1082 void Clock_Config(void)
2748                     ; 1083 {
2749                     	switch	.text
2750  0701               _Clock_Config:
2754                     ; 1085 	CLK_DeInit();
2756  0701 cd0000        	call	_CLK_DeInit
2758                     ; 1086 	CLK_HSICmd(ENABLE);
2760  0704 a601          	ld	a,#1
2761  0706 cd0000        	call	_CLK_HSICmd
2763                     ; 1087 	CLK_LSICmd(DISABLE);
2765  0709 4f            	clr	a
2766  070a cd0000        	call	_CLK_LSICmd
2768                     ; 1088 	CLK_HSECmd(DISABLE);
2770  070d 4f            	clr	a
2771  070e cd0000        	call	_CLK_HSECmd
2773                     ; 1090 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2775  0711 4f            	clr	a
2776  0712 cd0000        	call	_CLK_HSIPrescalerConfig
2778                     ; 1091 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2780  0715 a680          	ld	a,#128
2782                     ; 1092 }
2785  0717 cc0000        	jp	_CLK_SYSCLKConfig
2811                     ; 1095 void Gpio_Config(void)
2811                     ; 1096 {
2812                     	switch	.text
2813  071a               _Gpio_Config:
2817                     ; 1098   GPIO_Init(_LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2819  071a 4be0          	push	#224
2820  071c 4b10          	push	#16
2821  071e ae5005        	ldw	x,#20485
2822  0721 cd0000        	call	_GPIO_Init
2824  0724 85            	popw	x
2825                     ; 1099 	GPIO_WriteHigh(_LED_PORT, _LED_PIN);
2827  0725 4b10          	push	#16
2828  0727 ae5005        	ldw	x,#20485
2829  072a cd0000        	call	_GPIO_WriteHigh
2831  072d 84            	pop	a
2832                     ; 1102 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2834  072e 4be0          	push	#224
2835  0730 4b80          	push	#128
2836  0732 ae500a        	ldw	x,#20490
2837  0735 cd0000        	call	_GPIO_Init
2839  0738 85            	popw	x
2840                     ; 1103 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2842  0739 4be0          	push	#224
2843  073b 4b40          	push	#64
2844  073d ae500a        	ldw	x,#20490
2845  0740 cd0000        	call	_GPIO_Init
2847  0743 85            	popw	x
2848                     ; 1104 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2850  0744 4be0          	push	#224
2851  0746 4b20          	push	#32
2852  0748 ae500a        	ldw	x,#20490
2853  074b cd0000        	call	_GPIO_Init
2855  074e 85            	popw	x
2856                     ; 1105 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2858  074f 4be0          	push	#224
2859  0751 4b04          	push	#4
2860  0753 ae5000        	ldw	x,#20480
2861  0756 cd0000        	call	_GPIO_Init
2863  0759 85            	popw	x
2864                     ; 1107 	GPIO_WriteHigh(_X1_PORT, _X1_PIN);
2866  075a 4b80          	push	#128
2867  075c ae500a        	ldw	x,#20490
2868  075f cd0000        	call	_GPIO_WriteHigh
2870  0762 84            	pop	a
2871                     ; 1108 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2873  0763 4b80          	push	#128
2874  0765 ae500a        	ldw	x,#20490
2875  0768 cd0000        	call	_GPIO_WriteLow
2877  076b 84            	pop	a
2878                     ; 1110 	GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
2880  076c 4b20          	push	#32
2881  076e ae500a        	ldw	x,#20490
2882  0771 cd0000        	call	_GPIO_WriteHigh
2884  0774 84            	pop	a
2885                     ; 1111 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2887  0775 4b20          	push	#32
2888  0777 ae500a        	ldw	x,#20490
2889  077a cd0000        	call	_GPIO_WriteLow
2891  077d 84            	pop	a
2892                     ; 1113 	GPIO_WriteHigh(_X2_PORT, _X2_PIN);
2894  077e 4b40          	push	#64
2895  0780 ae500a        	ldw	x,#20490
2896  0783 cd0000        	call	_GPIO_WriteHigh
2898  0786 84            	pop	a
2899                     ; 1114 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2901  0787 4b40          	push	#64
2902  0789 ae500a        	ldw	x,#20490
2903  078c cd0000        	call	_GPIO_WriteLow
2905  078f 84            	pop	a
2906                     ; 1116 	GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);		
2908  0790 4b04          	push	#4
2909  0792 ae5000        	ldw	x,#20480
2910  0795 cd0000        	call	_GPIO_WriteHigh
2912  0798 84            	pop	a
2913                     ; 1117 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2915  0799 4b04          	push	#4
2916  079b ae5000        	ldw	x,#20480
2917  079e cd0000        	call	_GPIO_WriteLow
2919  07a1 84            	pop	a
2920                     ; 1120   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2922  07a2 4b00          	push	#0
2923  07a4 4b02          	push	#2
2924  07a6 ae5000        	ldw	x,#20480
2925  07a9 cd0000        	call	_GPIO_Init
2927  07ac 85            	popw	x
2928                     ; 1126 	GPIO_Init(_CHARGE_ON_PORT, _CHARGE_ON_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2930  07ad 4be0          	push	#224
2931  07af 4b10          	push	#16
2932  07b1 ae500f        	ldw	x,#20495
2933  07b4 cd0000        	call	_GPIO_Init
2935  07b7 85            	popw	x
2936                     ; 1129 	GPIO_Init(_BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN, GPIO_MODE_OUT_PP_LOW_FAST);		
2938  07b8 4be0          	push	#224
2939  07ba 4b08          	push	#8
2940  07bc ae5000        	ldw	x,#20480
2941  07bf cd0000        	call	_GPIO_Init
2943  07c2 85            	popw	x
2944                     ; 1134 	GPIO_Init( _ADJ_MO_PORT , _ADJ_MO_PIN , GPIO_MODE_IN_FL_NO_IT );
2946  07c3 4b00          	push	#0
2947  07c5 4b10          	push	#16
2948  07c7 ae500a        	ldw	x,#20490
2949  07ca cd0000        	call	_GPIO_Init
2951  07cd 85            	popw	x
2952                     ; 1136 	GPIO_Init( _BAT_MO_PORT , _BAT_MO_PIN, GPIO_MODE_IN_FL_NO_IT );
2954  07ce ad2f          	call	LC033
2955                     ; 1138 	GPIO_Init( _BOOST_MO_PORT , _BOOST_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2957  07d0 ad2d          	call	LC033
2958                     ; 1140   GPIO_Init( _POWER_MO_PORT , _POWER_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
2960  07d2 4b00          	push	#0
2961  07d4 4b20          	push	#32
2962  07d6 ae500f        	ldw	x,#20495
2963  07d9 cd0000        	call	_GPIO_Init
2965  07dc 85            	popw	x
2966                     ; 1142 	GPIO_Init( _ISENSE_PORT , _ISENSE_PIN  , GPIO_MODE_IN_FL_NO_IT );
2968  07dd 4b00          	push	#0
2969  07df 4b04          	push	#4
2970  07e1 ae500f        	ldw	x,#20495
2971  07e4 cd0000        	call	_GPIO_Init
2973  07e7 85            	popw	x
2974                     ; 1148 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
2976  07e8 4b00          	push	#0
2977  07ea 4b20          	push	#32
2978  07ec ae5005        	ldw	x,#20485
2979  07ef cd0000        	call	_GPIO_Init
2981  07f2 85            	popw	x
2982                     ; 1149 	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
2984  07f3 4b00          	push	#0
2985  07f5 4b08          	push	#8
2986  07f7 ae500a        	ldw	x,#20490
2987  07fa cd0000        	call	_GPIO_Init
2989  07fd 85            	popw	x
2990                     ; 1151 }
2993  07fe 81            	ret	
2994  07ff               LC033:
2995  07ff 4b00          	push	#0
2996  0801 4b08          	push	#8
2997  0803 ae500f        	ldw	x,#20495
2998  0806 cd0000        	call	_GPIO_Init
3000  0809 85            	popw	x
3001  080a 81            	ret	
3028                     ; 1155 void Timer4_Config(void)
3028                     ; 1156 {
3029                     	switch	.text
3030  080b               L5_Timer4_Config:
3034                     ; 1157   TIM4_DeInit();
3036  080b cd0000        	call	_TIM4_DeInit
3038                     ; 1163 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
3040  080e ae0432        	ldw	x,#1074
3041  0811 cd0000        	call	_TIM4_TimeBaseInit
3043                     ; 1167   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
3045  0814 ae0101        	ldw	x,#257
3046  0817 cd0000        	call	_TIM4_ITConfig
3048                     ; 1170   TIM4_Cmd(ENABLE);
3050  081a a601          	ld	a,#1
3052                     ; 1171 }
3055  081c cc0000        	jp	_TIM4_Cmd
3083                     ; 1174 static void Adc_Config( void )
3083                     ; 1175 {
3084                     	switch	.text
3085  081f               L3_Adc_Config:
3089                     ; 1177 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
3091  081f cd0000        	call	_ADC1_GetConversionValue
3093  0822 b615          	ld	a,_Adc+10
3094  0824 905f          	clrw	y
3095  0826 9097          	ld	yl,a
3096  0828 9058          	sllw	y
3097  082a 90ef0b        	ldw	(_Adc,y),x
3098                     ; 1179 	ADC1_DeInit( );
3100  082d cd0000        	call	_ADC1_DeInit
3102                     ; 1181 	switch (Adc.Idx)
3104  0830 b615          	ld	a,_Adc+10
3106                     ; 1213 		default:
3106                     ; 1214 			//Adc.Idx = 0;
3106                     ; 1215 			break;
3107  0832 270e          	jreq	L3501
3108  0834 4a            	dec	a
3109  0835 2725          	jreq	L5501
3110  0837 4a            	dec	a
3111  0838 273c          	jreq	L7501
3112  083a 4a            	dec	a
3113  083b 2753          	jreq	L1601
3114  083d 4a            	dec	a
3115  083e 276a          	jreq	L3601
3116  0840 207e          	jra	L1011
3117  0842               L3501:
3118                     ; 1183 		case 0:
3118                     ; 1184 		  
3118                     ; 1185 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
3118                     ; 1186 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
3120  0842 4b00          	push	#0
3121  0844 4b03          	push	#3
3122  0846 4b08          	push	#8
3123  0848 4b00          	push	#0
3124  084a 4b00          	push	#0
3125  084c 4b00          	push	#0
3126  084e ae0003        	ldw	x,#3
3127  0851 cd0000        	call	_ADC1_Init
3129  0854 5b06          	addw	sp,#6
3130                     ; 1187 			Adc.Idx = 1;
3132  0856 35010015      	mov	_Adc+10,#1
3133                     ; 1188 			break;
3135  085a 2064          	jra	L1011
3136  085c               L5501:
3137                     ; 1189 		case 1:
3137                     ; 1190 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
3137                     ; 1191 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
3139  085c 4b00          	push	#0
3140  085e 4b04          	push	#4
3141  0860 4b08          	push	#8
3142  0862 4b00          	push	#0
3143  0864 4b00          	push	#0
3144  0866 4b00          	push	#0
3145  0868 ae0004        	ldw	x,#4
3146  086b cd0000        	call	_ADC1_Init
3148  086e 5b06          	addw	sp,#6
3149                     ; 1192 			Adc.Idx = 2;
3151  0870 35020015      	mov	_Adc+10,#2
3152                     ; 1193 			break;
3154  0874 204a          	jra	L1011
3155  0876               L7501:
3156                     ; 1195 		case 2:
3156                     ; 1196 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_5, ADC1_PRESSEL_FCPU_D2, 
3156                     ; 1197 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL5, DISABLE );
3158  0876 4b00          	push	#0
3159  0878 4b05          	push	#5
3160  087a 4b08          	push	#8
3161  087c 4b00          	push	#0
3162  087e 4b00          	push	#0
3163  0880 4b00          	push	#0
3164  0882 ae0005        	ldw	x,#5
3165  0885 cd0000        	call	_ADC1_Init
3167  0888 5b06          	addw	sp,#6
3168                     ; 1198 			Adc.Idx = 3;
3170  088a 35030015      	mov	_Adc+10,#3
3171                     ; 1199 			break;
3173  088e 2030          	jra	L1011
3174  0890               L1601:
3175                     ; 1201 		case 3:
3175                     ; 1202 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_6, ADC1_PRESSEL_FCPU_D2, 
3175                     ; 1203 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL6, DISABLE );
3177  0890 4b00          	push	#0
3178  0892 4b06          	push	#6
3179  0894 4b08          	push	#8
3180  0896 4b00          	push	#0
3181  0898 4b00          	push	#0
3182  089a 4b00          	push	#0
3183  089c ae0006        	ldw	x,#6
3184  089f cd0000        	call	_ADC1_Init
3186  08a2 5b06          	addw	sp,#6
3187                     ; 1204 			Adc.Idx = 4;
3189  08a4 35040015      	mov	_Adc+10,#4
3190                     ; 1205 			break;	
3192  08a8 2016          	jra	L1011
3193  08aa               L3601:
3194                     ; 1207 		case 4:
3194                     ; 1208 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
3194                     ; 1209 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
3196  08aa 4b00          	push	#0
3197  08ac 4b02          	push	#2
3198  08ae 4b08          	push	#8
3199  08b0 4b00          	push	#0
3200  08b2 4b00          	push	#0
3201  08b4 4b00          	push	#0
3202  08b6 ae0002        	ldw	x,#2
3203  08b9 cd0000        	call	_ADC1_Init
3205  08bc 5b06          	addw	sp,#6
3206                     ; 1210 			Adc.Idx = 0;
3208  08be 3f15          	clr	_Adc+10
3209                     ; 1211 			break;	
3211                     ; 1213 		default:
3211                     ; 1214 			//Adc.Idx = 0;
3211                     ; 1215 			break;
3213  08c0               L1011:
3214                     ; 1218 		ADC1_StartConversion();		
3217                     ; 1219 }
3220  08c0 cc0000        	jp	_ADC1_StartConversion
3264                     ; 1234 void assert_failed(u8* file, u32 line)
3264                     ; 1235 {
3265                     	switch	.text
3266  08c3               _assert_failed:
3268  08c3 88            	push	a
3269       00000001      OFST:	set	1
3272  08c4               L5211:
3273                     ; 1244 	i = i++;
3275  08c4 0c01          	inc	(OFST+0,sp)
3277  08c6 6b01          	ld	(OFST+0,sp),a
3280  08c8 20fa          	jra	L5211
3816                     	xdef	_MotorClose
3817                     	xdef	_MotorStep
3818                     	xdef	_StopDrive
3819                     	xdef	_OnTimer_1mS
3820                     	xdef	_OnTimer_1S
3821                     	xdef	_main
3822                     	xdef	_MotorService
3823                     	xdef	_AdcService
3824                     	xdef	_LedService
3825                     	xdef	_SAbs
3826                     	xdef	_Diff
3827                     	xdef	_Gpio_Config
3828                     	xdef	_Clock_Config
3829                     	xdef	_OnTimer4
3830                     	xdef	_Interval
3831                     	xdef	_StartDriveOR
3832                     	xdef	_DriveService
3833                     	xdef	_Excitation_2Phase
3834                     	xdef	_Excitation_12Phase
3835                     	xdef	_Excitation_1Phase
3836                     	xdef	_CPulse
3837                     	xdef	_CStep
3838                     	xdef	_PowerDelay_1mS
3839                     	switch	.ubsct
3840  0000               _Timer:
3841  0000 000000000000  	ds.b	11
3842                     	xdef	_Timer
3843  000b               _Adc:
3844  000b 000000000000  	ds.b	21
3845                     	xdef	_Adc
3846  0020               _My:
3847  0020 000000000000  	ds.b	15
3848                     	xdef	_My
3849  002f               _Drive:
3850  002f 000000000000  	ds.b	27
3851                     	xdef	_Drive
3852                     	xdef	_TableInterval
3853  004a               _ledint:
3854  004a 0000          	ds.b	2
3855                     	xdef	_ledint
3856  004c               _Ticks_S:
3857  004c 0000          	ds.b	2
3858                     	xdef	_Ticks_S
3859  004e               _Ticks_1mS:
3860  004e 0000          	ds.b	2
3861                     	xdef	_Ticks_1mS
3862  0050               _Ticks_50uS:
3863  0050 00            	ds.b	1
3864                     	xdef	_Ticks_50uS
3865                     	xdef	_PeriodNumber
3866  0051               _Counter:
3867  0051 0000          	ds.b	2
3868                     	xdef	_Counter
3869                     	xdef	_assert_failed
3870                     	xref	_TIM4_ITConfig
3871                     	xref	_TIM4_Cmd
3872                     	xref	_TIM4_TimeBaseInit
3873                     	xref	_TIM4_DeInit
3874                     	xref	_GPIO_ReadInputPin
3875                     	xref	_GPIO_WriteReverse
3876                     	xref	_GPIO_WriteLow
3877                     	xref	_GPIO_WriteHigh
3878                     	xref	_GPIO_Init
3879                     	xref	_CLK_SYSCLKConfig
3880                     	xref	_CLK_HSIPrescalerConfig
3881                     	xref	_CLK_LSICmd
3882                     	xref	_CLK_HSICmd
3883                     	xref	_CLK_HSECmd
3884                     	xref	_CLK_DeInit
3885                     	xref	_ADC1_GetConversionValue
3886                     	xref	_ADC1_StartConversion
3887                     	xref	_ADC1_Init
3888                     	xref	_ADC1_DeInit
3889                     	xref.b	c_lreg
3890                     	xref.b	c_x
3891                     	xref.b	c_y
3911                     	xref	c_ludv
3912                     	xref	c_ladc
3913                     	xref	c_umul
3914                     	xref	c_ladd
3915                     	xref	c_lsub
3916                     	xref	c_ltor
3917                     	xref	c_lcmp
3918                     	xref	c_rtol
3919                     	xref	c_uitolx
3920                     	xref	c_imul
3921                     	end
