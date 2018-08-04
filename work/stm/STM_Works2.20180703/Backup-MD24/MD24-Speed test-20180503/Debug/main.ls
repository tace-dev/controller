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
  42  0013 f3            	dc.b	243
  84                     ; 158 void main(void)
  84                     ; 159 {
  86                     	switch	.text
  87  0000               _main:
  91                     ; 161 	Clock_Config();
  93  0000 cd04de        	call	_Clock_Config
  95                     ; 162 	Gpio_Config();
  97  0003 cd04f7        	call	_Gpio_Config
  99                     ; 163 	StopDrive();
 101  0006 cd015b        	call	_StopDrive
 103                     ; 164 	Timer4_Config();
 105  0009 cd0588        	call	L5_Timer4_Config
 107                     ; 166 	Adc.Idx = 2;
 109  000c 35020009      	mov	_Adc+6,#2
 110                     ; 167 	Adc_Config(  );
 112  0010 cd059c        	call	L3_Adc_Config
 114                     ; 174 	Drive.Enabled = ENABLED;
 116  0013 72100016      	bset	_Drive,#0
 117                     ; 175 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 119  0017 ae012c        	ldw	x,#300
 120  001a bf21          	ldw	_Drive+11,x
 121                     ; 176 	Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval	
 123  001c ae0032        	ldw	x,#50
 124  001f bf26          	ldw	_Drive+16,x
 125                     ; 177 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 127  0021 ae012c        	ldw	x,#300
 128  0024 bf2a          	ldw	_Drive+20,x
 129                     ; 179 	Drive.Position = CPulse(MAX_STEP);
 131  0026 ae00d2        	ldw	x,#210
 132  0029 cd04cd        	call	_CPulse
 134                     ; 181 	Drive.Position = 0;
 136  002c 5f            	clrw	x
 137  002d bf17          	ldw	_Drive+1,x
 138                     ; 183 	Drive.ExcitationType = 1;		//12 excition
 140  002f 3501002c      	mov	_Drive+22,#1
 141                     ; 189 	enableInterrupts();
 144  0033 9a            	rim	
 146                     ; 191 	StopDrive();
 149  0034 cd015b        	call	_StopDrive
 152  0037               L72:
 153                     ; 193   while ( PowerDelay_1mS )
 155  0037 b613          	ld	a,_PowerDelay_1mS
 156  0039 26fc          	jrne	L72
 157                     ; 199 	Drive.Interval = 40u;
 159                     ; 200 	Drive.Interval = 15u;
 161  003b ae000f        	ldw	x,#15
 162  003e bf26          	ldw	_Drive+16,x
 163                     ; 202 	Drive.Position = 0;
 165  0040 5f            	clrw	x
 166  0041 bf17          	ldw	_Drive+1,x
 167                     ; 205   Drive.T1_1mS = Ticks_1mS;
 169  0043 be3a          	ldw	x,_Ticks_1mS
 170  0045 bf2f          	ldw	_Drive+25,x
 171                     ; 206 	StartDriveOR( 4800u, 0u  );				// Goto Zero position
 173  0047 4b00          	push	#0
 174  0049 ae12c0        	ldw	x,#4800
 175  004c cd015d        	call	_StartDriveOR
 177  004f 84            	pop	a
 179  0050               L53:
 180                     ; 208 	while (Drive.Run)				// Wait while motor is running
 182  0050 72020016fb    	btjt	_Drive,#1,L53
 183                     ; 211 	Drive.T2_1mS = Ticks_1mS;
 185  0055 be3a          	ldw	x,_Ticks_1mS
 186                     ; 212 	Drive.Run0 = Drive.Run;
 188  0057               LC001:
 189  0057 bf31          	ldw	_Drive+27,x
 191  0059 b616          	ld	a,_Drive
 192  005b a402          	and	a,#2
 193  005d 44            	srl	a
 194  005e b733          	ld	_Drive+29,a
 195  0060               L14:
 196                     ; 216 		if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
 198  0060 b633          	ld	a,_Drive+29
 199  0062 2610          	jrne	L54
 201  0064 720300160b    	btjf	_Drive,#1,L54
 202                     ; 218 			Drive.T1_1mS = Ticks2_1mS;
 204  0069 be38          	ldw	x,_Ticks2_1mS
 205  006b bf2f          	ldw	_Drive+25,x
 206                     ; 219 			Drive.Run0 = Drive.Run;			
 208  006d b616          	ld	a,_Drive
 209  006f a402          	and	a,#2
 210  0071 44            	srl	a
 211  0072 b733          	ld	_Drive+29,a
 212  0074               L54:
 213                     ; 222 		if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
 215  0074 4a            	dec	a
 216  0075 26e9          	jrne	L14
 218  0077 72020016e4    	btjt	_Drive,#1,L14
 219                     ; 224 			Drive.T2_1mS = Ticks2_1mS;
 221  007c be38          	ldw	x,_Ticks2_1mS
 222                     ; 225 			Drive.Run0 = Drive.Run;			
 223  007e 20d7          	jp	LC001
 246                     ; 235 OnTimer_1S(void)
 246                     ; 236 {
 247                     	switch	.text
 248  0080               _OnTimer_1S:
 252                     ; 257 }
 255  0080 81            	ret	
 288                     ; 266 OnTimer_1mS(void)
 288                     ; 267 { 
 289                     	switch	.text
 290  0081               _OnTimer_1mS:
 294                     ; 268 	Ticks2_1mS++;
 296  0081 be38          	ldw	x,_Ticks2_1mS
 297  0083 5c            	incw	x
 298  0084 bf38          	ldw	_Ticks2_1mS,x
 299                     ; 270 	if ( PowerDelay_1mS )
 301  0086 b613          	ld	a,_PowerDelay_1mS
 302  0088 2702          	jreq	L17
 303                     ; 271 		PowerDelay_1mS--;
 305  008a 3a13          	dec	_PowerDelay_1mS
 306  008c               L17:
 307                     ; 273 	if (  Ticks_1mS < 1999 )
 309  008c be3a          	ldw	x,_Ticks_1mS
 310  008e a307cf        	cpw	x,#1999
 311  0091 2405          	jruge	L37
 312                     ; 274 		Ticks_1mS++;
 314  0093 5c            	incw	x
 315  0094 bf3a          	ldw	_Ticks_1mS,x
 317  0096 2005          	jra	L57
 318  0098               L37:
 319                     ; 277 		Ticks_1mS = 0;
 321  0098 5f            	clrw	x
 322  0099 bf3a          	ldw	_Ticks_1mS,x
 323                     ; 278 		OnTimer_1S();
 325  009b ade3          	call	_OnTimer_1S
 327  009d               L57:
 328                     ; 281 	pos = Adc.Value[0] / 4;
 330  009d be03          	ldw	x,_Adc
 331  009f 54            	srlw	x
 332  00a0 54            	srlw	x
 333  00a1 bf01          	ldw	_pos,x
 334                     ; 282 	pos = pos *  4;
 336  00a3 3802          	sll	_pos+1
 337  00a5 3901          	rlc	_pos
 338  00a7 3802          	sll	_pos+1
 339  00a9 3901          	rlc	_pos
 340                     ; 283 	pos = pos / 5 ;
 342  00ab a605          	ld	a,#5
 343  00ad be01          	ldw	x,_pos
 344  00af 62            	div	x,a
 345                     ; 298 	if ( pos > 200 ) pos = 200;
 347  00b0 a300c9        	cpw	x,#201
 348  00b3 2503          	jrult	L77
 351  00b5 ae00c8        	ldw	x,#200
 352  00b8               L77:
 353                     ; 300 	if  ( pos < 20 ) pos = 0;
 355  00b8 a30014        	cpw	x,#20
 356  00bb 2401          	jruge	L101
 359  00bd 5f            	clrw	x
 360  00be               L101:
 361  00be bf01          	ldw	_pos,x
 362                     ; 304 	pos2 = cvtTable(pos*5/4);
 364  00c0 90ae0005      	ldw	y,#5
 365  00c4 cd0000        	call	c_imul
 367  00c7 54            	srlw	x
 368  00c8 54            	srlw	x
 369  00c9 9f            	ld	a,xl
 370  00ca cd0000        	call	_cvtTable
 372  00cd b700          	ld	_pos2,a
 373                     ; 306 	if ( ! (Ticks_1mS % 500) )
 375  00cf 90ae01f4      	ldw	y,#500
 376  00d3 be3a          	ldw	x,_Ticks_1mS
 377  00d5 65            	divw	x,y
 378  00d6 905d          	tnzw	y
 379  00d8 260d          	jrne	L301
 380                     ; 308 		if ( ! Drive.Run )
 382  00da b616          	ld	a,_Drive
 383  00dc a502          	bcp	a,#2
 384                     ; 317 		GPIO_WriteReverse(LED_PORT, LED_PIN);
 386  00de 4b04          	push	#4
 387  00e0 ae5000        	ldw	x,#20480
 388  00e3 cd0000        	call	_GPIO_WriteReverse
 390  00e6 84            	pop	a
 391  00e7               L301:
 392                     ; 321 }
 395  00e7 81            	ret	
 424                     .const:	section	.text
 425  0000               L25:
 426  0000 00000013      	dc.l	19
 427                     ; 324 void OnTimer4(void)
 427                     ; 325 {
 428                     	switch	.text
 429  00e8               _OnTimer4:
 433                     ; 327 	Adc_Config(  );
 435  00e8 cd059c        	call	L3_Adc_Config
 437                     ; 328 	Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
 439  00eb 4b10          	push	#16
 440  00ed ae5005        	ldw	x,#20485
 441  00f0 cd0000        	call	_GPIO_ReadInputPin
 443  00f3 5b01          	addw	sp,#1
 444  00f5 4d            	tnz	a
 445  00f6 2603          	jrne	L44
 446  00f8 4c            	inc	a
 447  00f9 2001          	jra	L05
 448  00fb               L44:
 449  00fb 4f            	clr	a
 450  00fc               L05:
 451  00fc b72d          	ld	_Drive+23,a
 452                     ; 330 	if (  Ticks_50uS < 19 )
 454  00fe ae003c        	ldw	x,#_Ticks_50uS
 455  0101 cd0000        	call	c_ltor
 457  0104 ae0000        	ldw	x,#L25
 458  0107 cd0000        	call	c_lcmp
 460  010a 240a          	jruge	L711
 461                     ; 331 		Ticks_50uS++;
 463  010c ae003c        	ldw	x,#_Ticks_50uS
 464  010f a601          	ld	a,#1
 465  0111 cd0000        	call	c_lgadc
 468  0114 2008          	jra	L121
 469  0116               L711:
 470                     ; 334 		Ticks_50uS = 0;
 472  0116 5f            	clrw	x
 473  0117 bf3e          	ldw	_Ticks_50uS+2,x
 474  0119 bf3c          	ldw	_Ticks_50uS,x
 475                     ; 335 		OnTimer_1mS();
 477  011b cd0081        	call	_OnTimer_1mS
 479  011e               L121:
 480                     ; 339 	if ( Drive.Ticks > 0 )
 482  011e be28          	ldw	x,_Drive+18
 483  0120 2703          	jreq	L321
 484                     ; 340 		Drive.Ticks--;
 486  0122 5a            	decw	x
 487  0123 bf28          	ldw	_Drive+18,x
 488  0125               L321:
 489                     ; 342 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
 491  0125 720100160b    	btjf	_Drive,#0,L521
 493  012a be28          	ldw	x,_Drive+18
 494  012c 2607          	jrne	L521
 495                     ; 344 		DriveService();	
 497  012e cd0256        	call	_DriveService
 499                     ; 345 		Drive.Ticks = Drive.Interval;
 501  0131 be26          	ldw	x,_Drive+16
 502  0133 bf28          	ldw	_Drive+18,x
 503  0135               L521:
 504                     ; 348 }
 507  0135 81            	ret	
 531                     ; 354 void ExOff(void)
 531                     ; 355 {
 532                     	switch	.text
 533  0136               _ExOff:
 537                     ; 356 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
 539  0136 4b40          	push	#64
 540  0138 ae500a        	ldw	x,#20490
 541  013b cd0000        	call	_GPIO_WriteLow
 543  013e 84            	pop	a
 544                     ; 357 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
 546  013f 4b08          	push	#8
 547  0141 ae500a        	ldw	x,#20490
 548  0144 cd0000        	call	_GPIO_WriteLow
 550  0147 84            	pop	a
 551                     ; 358 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
 553  0148 4b80          	push	#128
 554  014a ae500a        	ldw	x,#20490
 555  014d cd0000        	call	_GPIO_WriteLow
 557  0150 84            	pop	a
 558                     ; 359 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
 560  0151 4b08          	push	#8
 561  0153 ae5000        	ldw	x,#20480
 562  0156 cd0000        	call	_GPIO_WriteLow
 564  0159 84            	pop	a
 565                     ; 360 }
 568  015a 81            	ret	
 592                     ; 365 void StopDrive(void)			//TROff()
 592                     ; 366 {
 593                     	switch	.text
 594  015b               _StopDrive:
 598                     ; 367 	ExOff();	
 601                     ; 368 }
 604  015b 20d9          	jp	_ExOff
 649                     ; 374 void StartDriveOR( uint16_t Target, uint8_t overrun )
 649                     ; 375 {
 650                     	switch	.text
 651  015d               _StartDriveOR:
 653  015d 89            	pushw	x
 654       00000000      OFST:	set	0
 657                     ; 383 	if ( Drive.Run ) return;
 659  015e 7202001606    	btjt	_Drive,#1,L401
 662                     ; 384 	if ( Drive.Position == Target ) return;
 664  0163 be17          	ldw	x,_Drive+1
 665  0165 1301          	cpw	x,(OFST+1,sp)
 666  0167 2602          	jrne	L371
 668  0169               L401:
 671  0169 85            	popw	x
 672  016a 81            	ret	
 673  016b               L371:
 674                     ; 387 	if ( Target == 0 )				//  goto origin
 676  016b 1e01          	ldw	x,(OFST+1,sp)
 677  016d 2616          	jrne	L571
 678                     ; 389 		Drive.Overrun =	0u;
 680  016f 5f            	clrw	x
 681  0170 bf1b          	ldw	_Drive+5,x
 682                     ; 390 		Drive.ZeroOffset = CPulse( OVER_STEP );
 684  0172 ae001e        	ldw	x,#30
 685  0175 cd04cd        	call	_CPulse
 687  0178 bf1e          	ldw	_Drive+8,x
 688                     ; 392 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
 690  017a be17          	ldw	x,_Drive+1
 691  017c 72bb001e      	addw	x,_Drive+8
 692  0180 bf17          	ldw	_Drive+1,x
 693                     ; 393 		Drive.Target = 0u;
 695  0182 5f            	clrw	x
 696                     ; 394 		Drive.State = nMotorClose;		// 0;
 698  0183 200f          	jp	LC002
 699  0185               L571:
 700                     ; 401 		if (Drive.Position >= Target)		// Closing
 702  0185 be17          	ldw	x,_Drive+1
 703  0187 1301          	cpw	x,(OFST+1,sp)
 704  0189 250f          	jrult	L102
 705                     ; 403 			Drive.Overrun =	0u;
 707  018b 5f            	clrw	x
 708  018c bf1b          	ldw	_Drive+5,x
 709                     ; 404 			Drive.State = nMotorClose;
 711  018e 3f25          	clr	_Drive+15
 712                     ; 405 			Drive.Overrun2 = 0u;
 714  0190 3f1d          	clr	_Drive+7
 715                     ; 406 			Drive.Target = Target;
 717  0192 1e01          	ldw	x,(OFST+1,sp)
 718                     ; 407 			Drive.State = nMotorClose;		// 0;
 720  0194               LC002:
 721  0194 bf19          	ldw	_Drive+3,x
 723  0196 3f25          	clr	_Drive+15
 725  0198 2017          	jra	L771
 726  019a               L102:
 727                     ; 411 			Drive.State = nMotorOpen;	//1;
 729  019a 35010025      	mov	_Drive+15,#1
 730                     ; 420 				Drive.Overrun2 = overrun;		//100;
 732  019e 7b05          	ld	a,(OFST+5,sp)
 733  01a0 b71d          	ld	_Drive+7,a
 734                     ; 421 				Drive.Target = Target + overrun;	//100;	
 736  01a2 7b01          	ld	a,(OFST+1,sp)
 737  01a4 97            	ld	xl,a
 738  01a5 7b02          	ld	a,(OFST+2,sp)
 739  01a7 1b05          	add	a,(OFST+5,sp)
 740  01a9 2401          	jrnc	L201
 741  01ab 5c            	incw	x
 742  01ac               L201:
 743  01ac b71a          	ld	_Drive+4,a
 744  01ae 9f            	ld	a,xl
 745  01af b719          	ld	_Drive+3,a
 746  01b1               L771:
 747                     ; 426 	Drive.Run = TRUE;
 749  01b1 72120016      	bset	_Drive,#1
 750                     ; 427 	Drive.Ticks = Drive.Interval;
 752  01b5 be26          	ldw	x,_Drive+16
 753  01b7 bf28          	ldw	_Drive+18,x
 754                     ; 428 }
 756  01b9 20ae          	jra	L401
 816                     ; 434 void MotorStep(MOTOR_DIR Dir)
 816                     ; 435 {
 817                     	switch	.text
 818  01bb               _MotorStep:
 822                     ; 436 	if ( Dir == nMotorClose )
 824  01bb 4d            	tnz	a
 825  01bc 2627          	jrne	L142
 826                     ; 438 		if ( Drive.Position != 0 ) 
 828  01be be17          	ldw	x,_Drive+1
 829  01c0 270d          	jreq	L342
 830                     ; 440 			Drive.Position--;
 832  01c2 5a            	decw	x
 833  01c3 bf17          	ldw	_Drive+1,x
 834                     ; 441 			if ( Drive.NormalOpen )
 836  01c5 b62e          	ld	a,_Drive+24
 837  01c7 2704          	jreq	L542
 838                     ; 442 				Drive.Phase++;   // NC
 840  01c9 3c20          	inc	_Drive+10
 842  01cb 2002          	jra	L342
 843  01cd               L542:
 844                     ; 445 				Drive.Phase--;	//NC
 846  01cd 3a20          	dec	_Drive+10
 847  01cf               L342:
 848                     ; 449 		if ( Drive.Position == 0 ) 
 850  01cf be17          	ldw	x,_Drive+1
 851  01d1 2643          	jrne	L352
 852                     ; 452 			Drive.Overrun = 0u;
 854  01d3 5f            	clrw	x
 855  01d4 bf1b          	ldw	_Drive+5,x
 856                     ; 453 			Drive.Run = FALSE;
 858  01d6 72130016      	bres	_Drive,#1
 859                     ; 454 			Drive.ZeroOffset = 0u;
 861  01da bf1e          	ldw	_Drive+8,x
 862                     ; 455 			Drive.Position = 0u;
 864  01dc bf17          	ldw	_Drive+1,x
 865                     ; 456 			Drive.Target = 0u;
 867  01de bf19          	ldw	_Drive+3,x
 868                     ; 457 			StopDrive();	
 870  01e0 cd015b        	call	_StopDrive
 872  01e3 2031          	jra	L352
 873  01e5               L142:
 874                     ; 463 			Drive.Position++;
 876  01e5 be17          	ldw	x,_Drive+1
 877  01e7 5c            	incw	x
 878  01e8 bf17          	ldw	_Drive+1,x
 879                     ; 465 		if ( Drive.NormalOpen )
 881  01ea b62e          	ld	a,_Drive+24
 882  01ec 2704          	jreq	L552
 883                     ; 466 				Drive.Phase--;
 885  01ee 3a20          	dec	_Drive+10
 887  01f0 2002          	jra	L752
 888  01f2               L552:
 889                     ; 468 				Drive.Phase++;
 891  01f2 3c20          	inc	_Drive+10
 892  01f4               L752:
 893                     ; 471 		if ( Drive.Origin ) 
 895  01f4 b62d          	ld	a,_Drive+23
 896  01f6 2708          	jreq	L162
 897                     ; 473 			Drive.ORGPosition = Drive.Position;
 899  01f8 bf23          	ldw	_Drive+13,x
 900                     ; 474 			Drive.LastOrigin = TRUE;
 902  01fa 72140016      	bset	_Drive,#2
 904  01fe 2016          	jra	L352
 905  0200               L162:
 906                     ; 477 			if ( Drive.LastOrigin )
 908  0200 7205001611    	btjf	_Drive,#2,L352
 909                     ; 479 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
 911  0205 be23          	ldw	x,_Drive+13
 912  0207 1d0028        	subw	x,#40
 913  020a bf21          	ldw	_Drive+11,x
 914                     ; 480 				if ( Drive.MaxOverrun > OVERRUN )
 916  020c a3012d        	cpw	x,#301
 917  020f 2505          	jrult	L352
 918                     ; 481 					Drive.MaxOverrun = OVERRUN;				
 920  0211 ae012c        	ldw	x,#300
 921  0214 bf21          	ldw	_Drive+11,x
 922  0216               L352:
 923                     ; 486 	if ( !Drive.Run ) return;
 925  0216 7202001601    	btjt	_Drive,#1,L172
 929  021b 81            	ret	
 930  021c               L172:
 931                     ; 487 	if ( !Drive.Enabled ) return;
 933  021c 7200001601    	btjt	_Drive,#0,L372
 937  0221 81            	ret	
 938  0222               L372:
 939                     ; 488 	switch ( Drive.ExcitationType )
 941  0222 b62c          	ld	a,_Drive+22
 943                     ; 499 			break;
 944  0224 2707          	jreq	L502
 945  0226 4a            	dec	a
 946  0227 2707          	jreq	L702
 947  0229 4a            	dec	a
 948  022a 2707          	jreq	L112
 950  022c 81            	ret	
 951  022d               L502:
 952                     ; 491 		case 0:
 952                     ; 492 			Excitation_1Phase();	
 955                     ; 493 			break;
 958  022d cc0400        	jp	_Excitation_1Phase
 959  0230               L702:
 960                     ; 494 		case 1:
 960                     ; 495 			Excitation_12Phase();
 963                     ; 496 			break;
 966  0230 cc0337        	jp	_Excitation_12Phase
 967  0233               L112:
 968                     ; 497 		case 2:
 968                     ; 498 			Excitation_2Phase();
 971                     ; 499 			break;
 973                     ; 504 }
 976  0233 2064          	jp	_Excitation_2Phase
1002                     ; 509 void MotorClose(void)
1002                     ; 510 {
1003                     	switch	.text
1004  0235               _MotorClose:
1008                     ; 511 	if ( Drive.Origin )   		// Hall IC Sensing 
1010  0235 b62d          	ld	a,_Drive+23
1011  0237 2719          	jreq	L113
1012                     ; 513 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1014  0239 be1b          	ldw	x,_Drive+5
1015  023b b321          	cpw	x,_Drive+11
1016  023d 2510          	jrult	L313
1017                     ; 515 			Drive.Target = 0u;
1019  023f 5f            	clrw	x
1020  0240 bf19          	ldw	_Drive+3,x
1021                     ; 516 			Drive.Position = 0u;
1023  0242 bf17          	ldw	_Drive+1,x
1024                     ; 517 			Drive.Overrun = 0u;
1026  0244 bf1b          	ldw	_Drive+5,x
1027                     ; 518 			Drive.ZeroOffset = 0u;
1029  0246 bf1e          	ldw	_Drive+8,x
1030                     ; 519 			Drive.Run = FALSE;			
1032  0248 72130016      	bres	_Drive,#1
1033                     ; 520 			StopDrive();
1038  024c cc015b        	jp	_StopDrive
1039  024f               L313:
1040                     ; 524 			Drive.Overrun++;
1042  024f 5c            	incw	x
1043  0250 bf1b          	ldw	_Drive+5,x
1044                     ; 525 			MotorStep(nMotorClose);
1046  0252               L113:
1047                     ; 529 		MotorStep(nMotorClose);		// move 1 step close
1050  0252 4f            	clr	a
1052                     ; 530 }
1055  0253 cc01bb        	jp	_MotorStep
1083                     ; 535 void DriveService(void)
1083                     ; 536 {
1084                     	switch	.text
1085  0256               _DriveService:
1087  0256 89            	pushw	x
1088       00000002      OFST:	set	2
1091                     ; 544 	ExOff();
1093  0257 cd0136        	call	_ExOff
1095                     ; 546 	if ( ! Drive.Run ) return;	//when Drive is stop 
1097  025a 7203001638    	btjf	_Drive,#1,L533
1100                     ; 553 	if ( Drive.Target > Drive.Position )
1102  025f be19          	ldw	x,_Drive+3
1103  0261 b317          	cpw	x,_Drive+1
1104  0263 2307          	jrule	L333
1105                     ; 554 	 	MotorStep(nMotorOpen);
1107  0265 a601          	ld	a,#1
1108  0267 cd01bb        	call	_MotorStep
1111  026a 202b          	jra	L533
1112  026c               L333:
1113                     ; 555 	else if ( Drive.Target < Drive.Position )
1115  026c b317          	cpw	x,_Drive+1
1116  026e 2404          	jruge	L733
1117                     ; 556 		MotorClose( );
1119  0270 adc3          	call	_MotorClose
1122  0272 2023          	jra	L533
1123  0274               L733:
1124                     ; 557 	else if ( Drive.Target ) 	// on target position
1126  0274 be19          	ldw	x,_Drive+3
1127  0276 2713          	jreq	L543
1128                     ; 559 			if ( Drive.Overrun2 )
1130  0278 b61d          	ld	a,_Drive+7
1131  027a 270f          	jreq	L543
1132                     ; 561 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1134  027c 5f            	clrw	x
1135  027d 97            	ld	xl,a
1136  027e 1f01          	ldw	(OFST-1,sp),x
1138  0280 be19          	ldw	x,_Drive+3
1139  0282 72f001        	subw	x,(OFST-1,sp)
1140  0285 bf19          	ldw	_Drive+3,x
1141                     ; 562 				Drive.Overrun2 = 0u;
1143  0287 3f1d          	clr	_Drive+7
1145  0289 200c          	jra	L533
1146  028b               L543:
1147                     ; 566 				Drive.ZeroOffset = 0u;
1148                     ; 567 				Drive.Overrun = 0u;
1149                     ; 568 				Drive.Run = FALSE;
1150                     ; 569 				StopDrive();		
1152                     ; 575 			Drive.ZeroOffset = 0u;
1154                     ; 576 			Drive.Overrun = 0u;
1156                     ; 577 			Drive.Run = FALSE;
1158                     ; 578 			StopDrive();	
1161  028b 5f            	clrw	x
1162  028c bf1e          	ldw	_Drive+8,x
1164  028e bf1b          	ldw	_Drive+5,x
1166  0290 72130016      	bres	_Drive,#1
1168  0294 cd015b        	call	_StopDrive
1170  0297               L533:
1171                     ; 580 }
1174  0297 85            	popw	x
1175  0298 81            	ret	
1201                     ; 583 void Excitation_2Phase( void )
1201                     ; 584 {
1202                     	switch	.text
1203  0299               _Excitation_2Phase:
1207                     ; 586 	switch (Drive.Phase%8)
1209  0299 b620          	ld	a,_Drive+10
1210  029b a407          	and	a,#7
1212                     ; 639 		default:
1212                     ; 640 			break;
1213  029d 274e          	jreq	L363
1214  029f 4a            	dec	a
1215  02a0 2713          	jreq	L553
1216  02a2 4a            	dec	a
1217  02a3 272c          	jreq	L753
1218  02a5 4a            	dec	a
1219  02a6 276a          	jreq	L173
1220  02a8 4a            	dec	a
1221  02a9 2742          	jreq	L363
1222  02ab 4a            	dec	a
1223  02ac 2707          	jreq	L553
1224  02ae 4a            	dec	a
1225  02af 2720          	jreq	L753
1226  02b1 4a            	dec	a
1227  02b2 275e          	jreq	L173
1229  02b4 81            	ret	
1230                     ; 588 		case 0:
1230                     ; 589 		//case 1:
1230                     ; 590 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1232                     ; 591 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1234                     ; 592 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1236                     ; 593 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1238                     ; 594 			break;		
1240  02b5               L553:
1241                     ; 595 		case 1:
1241                     ; 596 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1244                     ; 597 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1247                     ; 598 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1250  02b5 4b40          	push	#64
1251  02b7 ae500a        	ldw	x,#20490
1252  02ba cd0000        	call	_GPIO_WriteLow
1253  02bd 84            	pop	a
1255  02be 4b08          	push	#8
1256  02c0 ae500a        	ldw	x,#20490
1257  02c3 cd0000        	call	_GPIO_WriteHigh
1258  02c6 84            	pop	a
1260  02c7 4b80          	push	#128
1261  02c9 ae500a        	ldw	x,#20490
1262  02cc cd0000        	call	_GPIO_WriteHigh
1264                     ; 599 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1266                     ; 600 			break;
1268  02cf 2036          	jp	LC009
1269  02d1               L753:
1270                     ; 601 		case 2:
1270                     ; 602 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1273                     ; 603 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1276                     ; 604 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1279  02d1 4b40          	push	#64
1280  02d3 ae500a        	ldw	x,#20490
1281  02d6 cd0000        	call	_GPIO_WriteLow
1282  02d9 84            	pop	a
1284  02da 4b08          	push	#8
1285  02dc ae500a        	ldw	x,#20490
1286  02df cd0000        	call	_GPIO_WriteLow
1287  02e2 84            	pop	a
1289  02e3 4b80          	push	#128
1290  02e5 ae500a        	ldw	x,#20490
1291  02e8 cd0000        	call	_GPIO_WriteHigh
1293                     ; 605 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1295                     ; 606 			break;
1297  02eb 203f          	jp	LC006
1298                     ; 607 		case 3:  
1298                     ; 608 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1300                     ; 609 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1302                     ; 610 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1304                     ; 611 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1306                     ; 612 			break;
1308  02ed               L363:
1309                     ; 614 		case 4:
1309                     ; 615 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1312                     ; 616 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1315                     ; 617 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1318  02ed 4b40          	push	#64
1319  02ef ae500a        	ldw	x,#20490
1320  02f2 cd0000        	call	_GPIO_WriteHigh
1321  02f5 84            	pop	a
1323  02f6 4b08          	push	#8
1324  02f8 ae500a        	ldw	x,#20490
1325  02fb cd0000        	call	_GPIO_WriteHigh
1326  02fe 84            	pop	a
1328  02ff 4b80          	push	#128
1329  0301 ae500a        	ldw	x,#20490
1330  0304 cd0000        	call	_GPIO_WriteLow
1332                     ; 618 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1334  0307               LC009:
1335  0307 84            	pop	a
1339  0308 4b08          	push	#8
1340  030a ae5000        	ldw	x,#20480
1341  030d cd0000        	call	_GPIO_WriteLow
1343                     ; 619 			break;		
1345  0310 2023          	jp	LC005
1346                     ; 620 		case 5:
1346                     ; 621 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1348                     ; 622 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1350                     ; 623 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1352                     ; 624 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1354                     ; 625 			break;
1356                     ; 626 		case 6:
1356                     ; 627 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1358                     ; 628 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1360                     ; 629 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1362                     ; 630 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1364                     ; 631 			break;
1366  0312               L173:
1367                     ; 632 		case 7:  
1367                     ; 633 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1370                     ; 634 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1373                     ; 635 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1376  0312 4b40          	push	#64
1377  0314 ae500a        	ldw	x,#20490
1378  0317 cd0000        	call	_GPIO_WriteHigh
1379  031a 84            	pop	a
1381  031b 4b08          	push	#8
1382  031d ae500a        	ldw	x,#20490
1383  0320 cd0000        	call	_GPIO_WriteLow
1384  0323 84            	pop	a
1386  0324 4b80          	push	#128
1387  0326 ae500a        	ldw	x,#20490
1388  0329 cd0000        	call	_GPIO_WriteLow
1390                     ; 636 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1392  032c               LC006:
1393  032c 84            	pop	a
1397  032d 4b08          	push	#8
1398  032f ae5000        	ldw	x,#20480
1399  0332 cd0000        	call	_GPIO_WriteHigh
1401  0335               LC005:
1402  0335 84            	pop	a
1403                     ; 637 			break;
1405                     ; 639 		default:
1405                     ; 640 			break;
1407                     ; 643 }
1410  0336 81            	ret	
1436                     ; 646 void Excitation_12Phase( void )
1436                     ; 647 {
1437                     	switch	.text
1438  0337               _Excitation_12Phase:
1442                     ; 649 	switch (Drive.Phase%8)
1444  0337 b620          	ld	a,_Drive+10
1445  0339 a407          	and	a,#7
1447                     ; 700 		default:
1447                     ; 701 			break;
1448  033b 2716          	jreq	L114
1449  033d 4a            	dec	a
1450  033e 271d          	jreq	L314
1451  0340 4a            	dec	a
1452  0341 272d          	jreq	L514
1453  0343 4a            	dec	a
1454  0344 273f          	jreq	L714
1455  0346 4a            	dec	a
1456  0347 2748          	jreq	L124
1457  0349 4a            	dec	a
1458  034a 2753          	jreq	L324
1459  034c 4a            	dec	a
1460  034d 276e          	jreq	L524
1461  034f 4a            	dec	a
1462  0350 2775          	jreq	L724
1464  0352 81            	ret	
1465  0353               L114:
1466                     ; 651 		case 0:
1466                     ; 652 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1468  0353 4b40          	push	#64
1469  0355 ae500a        	ldw	x,#20490
1470  0358 cd0000        	call	_GPIO_WriteHigh
1472                     ; 653 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1474                     ; 654 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1476                     ; 655 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1478                     ; 656 			break;
1480  035b 2008          	jp	LC015
1481  035d               L314:
1482                     ; 657 		case 1:
1482                     ; 658 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1484  035d 4b40          	push	#64
1485  035f ae500a        	ldw	x,#20490
1486  0362 cd0000        	call	_GPIO_WriteLow
1488                     ; 659 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1490  0365               LC015:
1491  0365 84            	pop	a
1493  0366 4b08          	push	#8
1494  0368 ae500a        	ldw	x,#20490
1495  036b cd0000        	call	_GPIO_WriteHigh
1497                     ; 660 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1499                     ; 661 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1501                     ; 662 			break;		
1503  036e 2068          	jp	LC014
1504  0370               L514:
1505                     ; 663 		case 2:
1505                     ; 664 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1507  0370 ad7a          	call	LC019
1508                     ; 665 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1510  0372 4b08          	push	#8
1511  0374 ae500a        	ldw	x,#20490
1512  0377 cd0000        	call	_GPIO_WriteHigh
1514                     ; 666 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1516  037a               LC016:
1517  037a 84            	pop	a
1519  037b 4b80          	push	#128
1520  037d ae500a        	ldw	x,#20490
1521  0380 cd0000        	call	_GPIO_WriteHigh
1523                     ; 667 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
1525                     ; 668 			break;
1527  0383 205c          	jp	LC013
1528  0385               L714:
1529                     ; 669 		case 3:
1529                     ; 670 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1531  0385 ad65          	call	LC019
1532                     ; 671 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1534  0387 4b08          	push	#8
1535  0389 ae500a        	ldw	x,#20490
1536  038c cd0000        	call	_GPIO_WriteLow
1538                     ; 672 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1540                     ; 673 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1542                     ; 674 			break;
1544  038f 20e9          	jp	LC016
1545  0391               L124:
1546                     ; 675 		case 4:
1546                     ; 676 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1548  0391 ad59          	call	LC019
1549                     ; 677 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1551  0393 ad61          	call	LC020
1552                     ; 678 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1554  0395 4b80          	push	#128
1555  0397 ae500a        	ldw	x,#20490
1556  039a cd0000        	call	_GPIO_WriteHigh
1558                     ; 679 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1560                     ; 680 			break;
1562  039d 2013          	jp	LC017
1563  039f               L324:
1564                     ; 681 		case 5: 
1564                     ; 682 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1566  039f 4b40          	push	#64
1567  03a1 ae500a        	ldw	x,#20490
1568  03a4 cd0000        	call	_GPIO_WriteLow
1570                     ; 683 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1573                     ; 684 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1575  03a7               LC018:
1576  03a7 84            	pop	a
1578  03a8 ad4c          	call	LC020
1580  03aa 4b80          	push	#128
1581  03ac ae500a        	ldw	x,#20490
1582  03af cd0000        	call	_GPIO_WriteLow
1584                     ; 685 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1586  03b2               LC017:
1587  03b2 84            	pop	a
1590  03b3 4b08          	push	#8
1591  03b5 ae5000        	ldw	x,#20480
1592  03b8 cd0000        	call	_GPIO_WriteHigh
1594                     ; 686 			break;
1596  03bb 202d          	jp	LC012
1597  03bd               L524:
1598                     ; 687 		case 6:  
1598                     ; 688 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1600  03bd 4b40          	push	#64
1601  03bf ae500a        	ldw	x,#20490
1602  03c2 cd0000        	call	_GPIO_WriteHigh
1604                     ; 689 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1606                     ; 690 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1608                     ; 691 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
1610                     ; 692 			break;
1612  03c5 20e0          	jp	LC018
1613  03c7               L724:
1614                     ; 693 		case 7:
1614                     ; 694 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1616  03c7 4b40          	push	#64
1617  03c9 ae500a        	ldw	x,#20490
1618  03cc cd0000        	call	_GPIO_WriteHigh
1620  03cf 84            	pop	a
1621                     ; 695 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1623  03d0 4b08          	push	#8
1624  03d2 ae500a        	ldw	x,#20490
1625  03d5 cd0000        	call	_GPIO_WriteLow
1627                     ; 696 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1629  03d8               LC014:
1630  03d8 84            	pop	a
1633  03d9 4b80          	push	#128
1634  03db ae500a        	ldw	x,#20490
1635  03de cd0000        	call	_GPIO_WriteLow
1637                     ; 697 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1639  03e1               LC013:
1640  03e1 84            	pop	a
1645  03e2 4b08          	push	#8
1646  03e4 ae5000        	ldw	x,#20480
1647  03e7 cd0000        	call	_GPIO_WriteLow
1649  03ea               LC012:
1650  03ea 84            	pop	a
1651                     ; 698 			break;
1653                     ; 700 		default:
1653                     ; 701 			break;
1655                     ; 704 }
1658  03eb 81            	ret	
1659  03ec               LC019:
1660  03ec 4b40          	push	#64
1661  03ee ae500a        	ldw	x,#20490
1662  03f1 cd0000        	call	_GPIO_WriteLow
1664  03f4 84            	pop	a
1665  03f5 81            	ret	
1666  03f6               LC020:
1667  03f6 4b08          	push	#8
1668  03f8 ae500a        	ldw	x,#20490
1669  03fb cd0000        	call	_GPIO_WriteLow
1671  03fe 84            	pop	a
1672  03ff 81            	ret	
1698                     ; 706 void Excitation_1Phase( void )
1698                     ; 707 {
1699                     	switch	.text
1700  0400               _Excitation_1Phase:
1704                     ; 710 	switch (Drive.Phase%8)
1706  0400 b620          	ld	a,_Drive+10
1707  0402 a407          	and	a,#7
1709                     ; 741 		default:
1709                     ; 742 			break;
1710  0404 2716          	jreq	L744
1711  0406 4a            	dec	a
1712  0407 2713          	jreq	L744
1713  0409 4a            	dec	a
1714  040a 2723          	jreq	L154
1715  040c 4a            	dec	a
1716  040d 2720          	jreq	L154
1717  040f 4a            	dec	a
1718  0410 273b          	jreq	L354
1719  0412 4a            	dec	a
1720  0413 2738          	jreq	L354
1721  0415 4a            	dec	a
1722  0416 2741          	jreq	L554
1723  0418 4a            	dec	a
1724  0419 273e          	jreq	L554
1726  041b 81            	ret	
1727  041c               L744:
1728                     ; 712 		case 0:
1728                     ; 713 		case 1:
1728                     ; 714 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1730  041c 4b40          	push	#64
1731  041e ae500a        	ldw	x,#20490
1732  0421 cd0000        	call	_GPIO_WriteHigh
1734  0424 84            	pop	a
1735                     ; 715 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1737  0425 4b08          	push	#8
1738  0427 ae500a        	ldw	x,#20490
1739  042a cd0000        	call	_GPIO_WriteLow
1741                     ; 716 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1743                     ; 717 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1745                     ; 718 			break;		
1747  042d 200a          	jp	LC023
1748  042f               L154:
1749                     ; 719 		case 2:
1749                     ; 720 		case 3:
1749                     ; 721 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1751  042f ad49          	call	LC025
1752                     ; 722 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1754  0431 4b08          	push	#8
1755  0433 ae500a        	ldw	x,#20490
1756  0436 cd0000        	call	_GPIO_WriteHigh
1758                     ; 723 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1760  0439               LC023:
1761  0439 84            	pop	a
1763  043a 4b80          	push	#128
1764  043c ae500a        	ldw	x,#20490
1765  043f cd0000        	call	_GPIO_WriteLow
1767                     ; 724 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1769  0442               LC022:
1770  0442 84            	pop	a
1773  0443 4b08          	push	#8
1774  0445 ae5000        	ldw	x,#20480
1775  0448 cd0000        	call	_GPIO_WriteLow
1777                     ; 725 			break;
1779  044b 201f          	jp	LC021
1780  044d               L354:
1781                     ; 726 		case 4:
1781                     ; 727 		case 5:
1781                     ; 728 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1783  044d ad1f          	call	LC024
1784                     ; 730 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1786  044f 4b80          	push	#128
1787  0451 ae500a        	ldw	x,#20490
1788  0454 cd0000        	call	_GPIO_WriteHigh
1790                     ; 731 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1792                     ; 732 			break;
1794  0457 20e9          	jp	LC022
1795  0459               L554:
1796                     ; 733 		case 6:
1796                     ; 734 		case 7:
1796                     ; 735 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1798  0459 ad13          	call	LC024
1799                     ; 737 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1801  045b 4b80          	push	#128
1802  045d ae500a        	ldw	x,#20490
1803  0460 cd0000        	call	_GPIO_WriteLow
1805  0463 84            	pop	a
1806                     ; 738 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1808  0464 4b08          	push	#8
1809  0466 ae5000        	ldw	x,#20480
1810  0469 cd0000        	call	_GPIO_WriteHigh
1812  046c               LC021:
1813  046c 84            	pop	a
1814                     ; 739 			break;
1816                     ; 741 		default:
1816                     ; 742 			break;
1818                     ; 745 }
1821  046d 81            	ret	
1822  046e               LC024:
1823  046e ad0a          	call	LC025
1824                     ; 729 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1826  0470 4b08          	push	#8
1827  0472 ae500a        	ldw	x,#20490
1828  0475 cd0000        	call	_GPIO_WriteLow
1830  0478 84            	pop	a
1831  0479 81            	ret	
1832  047a               LC025:
1833  047a 4b40          	push	#64
1834  047c ae500a        	ldw	x,#20490
1835  047f cd0000        	call	_GPIO_WriteLow
1837  0482 84            	pop	a
1838  0483 81            	ret	
1873                     ; 748 u8 Interval( u16 Vmon)
1873                     ; 749 {
1874                     	switch	.text
1875  0484               _Interval:
1877  0484 89            	pushw	x
1878       00000000      OFST:	set	0
1881                     ; 750 	Vmon = Vmon / IntervalSlope;
1883  0485 a61c          	ld	a,#28
1884  0487 62            	div	x,a
1885                     ; 752 	if (Vmon < 10 ) Vmon = 10;
1887  0488 a3000a        	cpw	x,#10
1888  048b 2403          	jruge	L315
1891  048d ae000a        	ldw	x,#10
1892  0490               L315:
1893                     ; 753 	if (Vmon > 26 ) Vmon = 26;
1895  0490 a3001b        	cpw	x,#27
1896  0493 2503          	jrult	L515
1899  0495 ae001a        	ldw	x,#26
1900  0498               L515:
1901                     ; 755 	return ( TableInterval[ Vmon-10 ] );
1903  0498 1d000a        	subw	x,#10
1904  049b e602          	ld	a,(_TableInterval,x)
1907  049d 85            	popw	x
1908  049e 81            	ret	
1951                     	switch	.const
1952  0004               L024:
1953  0004 00000960      	dc.l	2400
1954                     ; 770 uint16_t CStep( uint16_t pulse )
1954                     ; 771 {
1955                     	switch	.text
1956  049f               _CStep:
1958  049f 5204          	subw	sp,#4
1959       00000004      OFST:	set	4
1962                     ; 774 	i = (uint32_t) pulse * 200u / (2400UL);
1964  04a1 a6c8          	ld	a,#200
1965  04a3 cd0000        	call	c_cmulx
1967  04a6 ae0004        	ldw	x,#L024
1968  04a9 cd0000        	call	c_ludv
1970  04ac 96            	ldw	x,sp
1971  04ad 5c            	incw	x
1972  04ae cd0000        	call	c_rtol
1975                     ; 775 	i = (i+1)/2;   				// Round up  20150925
1977  04b1 96            	ldw	x,sp
1978  04b2 5c            	incw	x
1979  04b3 cd0000        	call	c_ltor
1981  04b6 a601          	ld	a,#1
1982  04b8 cd0000        	call	c_ladc
1984  04bb 3400          	srl	c_lreg
1985  04bd 3601          	rrc	c_lreg+1
1986  04bf 3602          	rrc	c_lreg+2
1987  04c1 96            	ldw	x,sp
1988  04c2 3603          	rrc	c_lreg+3
1989  04c4 5c            	incw	x
1990  04c5 cd0000        	call	c_rtol
1993                     ; 776 	return (uint16_t) i;
1995  04c8 1e03          	ldw	x,(OFST-1,sp)
1998  04ca 5b04          	addw	sp,#4
1999  04cc 81            	ret	
2042                     ; 780 uint16_t CPulse( uint16_t step )
2042                     ; 781 {
2043                     	switch	.text
2044  04cd               _CPulse:
2046  04cd 5204          	subw	sp,#4
2047       00000004      OFST:	set	4
2050                     ; 784     i= (uint32_t) step *(24UL);
2052  04cf a618          	ld	a,#24
2053  04d1 cd0000        	call	c_cmulx
2055  04d4 96            	ldw	x,sp
2056  04d5 5c            	incw	x
2057  04d6 cd0000        	call	c_rtol
2060                     ; 786 	return (uint16_t) i;
2062  04d9 1e03          	ldw	x,(OFST-1,sp)
2065  04db 5b04          	addw	sp,#4
2066  04dd 81            	ret	
2095                     ; 797 void Clock_Config(void)
2095                     ; 798 {
2096                     	switch	.text
2097  04de               _Clock_Config:
2101                     ; 800 	CLK_DeInit();
2103  04de cd0000        	call	_CLK_DeInit
2105                     ; 801 	CLK_HSICmd(ENABLE);
2107  04e1 a601          	ld	a,#1
2108  04e3 cd0000        	call	_CLK_HSICmd
2110                     ; 802 	CLK_LSICmd(DISABLE);
2112  04e6 4f            	clr	a
2113  04e7 cd0000        	call	_CLK_LSICmd
2115                     ; 803 	CLK_HSECmd(DISABLE);
2117  04ea 4f            	clr	a
2118  04eb cd0000        	call	_CLK_HSECmd
2120                     ; 805 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2122  04ee 4f            	clr	a
2123  04ef cd0000        	call	_CLK_HSIPrescalerConfig
2125                     ; 806 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
2127  04f2 a680          	ld	a,#128
2129                     ; 807 }
2132  04f4 cc0000        	jp	_CLK_SYSCLKConfig
2158                     ; 810 void Gpio_Config(void)
2158                     ; 811 {
2159                     	switch	.text
2160  04f7               _Gpio_Config:
2164                     ; 813   GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2166  04f7 4be0          	push	#224
2167  04f9 4b04          	push	#4
2168  04fb ae5000        	ldw	x,#20480
2169  04fe cd0000        	call	_GPIO_Init
2171  0501 85            	popw	x
2172                     ; 814 	GPIO_WriteHigh(LED_PORT, LED_PIN);
2174  0502 4b04          	push	#4
2175  0504 ae5000        	ldw	x,#20480
2176  0507 cd0000        	call	_GPIO_WriteHigh
2178  050a 84            	pop	a
2179                     ; 817 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2181  050b 4be0          	push	#224
2182  050d 4b40          	push	#64
2183  050f ae500a        	ldw	x,#20490
2184  0512 cd0000        	call	_GPIO_Init
2186  0515 85            	popw	x
2187                     ; 818 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2189  0516 4be0          	push	#224
2190  0518 4b80          	push	#128
2191  051a ae500a        	ldw	x,#20490
2192  051d cd0000        	call	_GPIO_Init
2194  0520 85            	popw	x
2195                     ; 819 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2197  0521 4be0          	push	#224
2198  0523 4b08          	push	#8
2199  0525 ae500a        	ldw	x,#20490
2200  0528 cd0000        	call	_GPIO_Init
2202  052b 85            	popw	x
2203                     ; 820 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2205  052c 4be0          	push	#224
2206  052e 4b08          	push	#8
2207  0530 ae5000        	ldw	x,#20480
2208  0533 cd0000        	call	_GPIO_Init
2210  0536 85            	popw	x
2211                     ; 822 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2213  0537 4b40          	push	#64
2214  0539 ae500a        	ldw	x,#20490
2215  053c cd0000        	call	_GPIO_WriteLow
2217  053f 84            	pop	a
2218                     ; 823 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2220  0540 4b08          	push	#8
2221  0542 ae500a        	ldw	x,#20490
2222  0545 cd0000        	call	_GPIO_WriteLow
2224  0548 84            	pop	a
2225                     ; 824 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2227  0549 4b80          	push	#128
2228  054b ae500a        	ldw	x,#20490
2229  054e cd0000        	call	_GPIO_WriteLow
2231  0551 84            	pop	a
2232                     ; 825 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2234  0552 4b08          	push	#8
2235  0554 ae5000        	ldw	x,#20480
2236  0557 cd0000        	call	_GPIO_WriteLow
2238  055a 84            	pop	a
2239                     ; 828   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2241  055b 4b00          	push	#0
2242  055d 4b10          	push	#16
2243  055f ae5005        	ldw	x,#20485
2244  0562 cd0000        	call	_GPIO_Init
2246  0565 85            	popw	x
2247                     ; 831 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
2249  0566 4b00          	push	#0
2250  0568 4b04          	push	#4
2251  056a ae500f        	ldw	x,#20495
2252  056d cd0000        	call	_GPIO_Init
2254  0570 85            	popw	x
2255                     ; 834 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2257  0571 4b00          	push	#0
2258  0573 4b10          	push	#16
2259  0575 ae500a        	ldw	x,#20490
2260  0578 cd0000        	call	_GPIO_Init
2262  057b 85            	popw	x
2263                     ; 835 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
2265  057c 4b00          	push	#0
2266  057e 4b08          	push	#8
2267  0580 ae500f        	ldw	x,#20495
2268  0583 cd0000        	call	_GPIO_Init
2270  0586 85            	popw	x
2271                     ; 837 }
2274  0587 81            	ret	
2301                     ; 841 void Timer4_Config(void)
2301                     ; 842 {
2302                     	switch	.text
2303  0588               L5_Timer4_Config:
2307                     ; 843   TIM4_DeInit();
2309  0588 cd0000        	call	_TIM4_DeInit
2311                     ; 849 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
2313  058b ae0432        	ldw	x,#1074
2314  058e cd0000        	call	_TIM4_TimeBaseInit
2316                     ; 852   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2318  0591 ae0101        	ldw	x,#257
2319  0594 cd0000        	call	_TIM4_ITConfig
2321                     ; 855   TIM4_Cmd(ENABLE);
2323  0597 a601          	ld	a,#1
2325                     ; 856 }
2328  0599 cc0000        	jp	_TIM4_Cmd
2356                     ; 859 static void Adc_Config( void )
2356                     ; 860 {
2357                     	switch	.text
2358  059c               L3_Adc_Config:
2362                     ; 862 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
2364  059c cd0000        	call	_ADC1_GetConversionValue
2366  059f b609          	ld	a,_Adc+6
2367  05a1 905f          	clrw	y
2368  05a3 9097          	ld	yl,a
2369  05a5 9058          	sllw	y
2370  05a7 90ef03        	ldw	(_Adc,y),x
2371                     ; 863 	ADC1_DeInit();
2373  05aa cd0000        	call	_ADC1_DeInit
2375                     ; 865 	switch (Adc.Idx)
2377  05ad b609          	ld	a,_Adc+6
2379                     ; 887 			break;
2380  05af 2708          	jreq	L316
2381  05b1 4a            	dec	a
2382  05b2 271f          	jreq	L516
2383  05b4 4a            	dec	a
2384  05b5 2736          	jreq	L716
2385                     ; 885 		default:
2385                     ; 886 			Adc.Idx = 0;
2386                     ; 887 			break;
2388  05b7 2048          	jp	LC026
2389  05b9               L316:
2390                     ; 867 		case 0:
2390                     ; 868 		  
2390                     ; 869 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
2390                     ; 870 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
2392  05b9 4b00          	push	#0
2393  05bb 4b03          	push	#3
2394  05bd 4b08          	push	#8
2395  05bf 4b00          	push	#0
2396  05c1 4b00          	push	#0
2397  05c3 4b00          	push	#0
2398  05c5 ae0003        	ldw	x,#3
2399  05c8 cd0000        	call	_ADC1_Init
2401  05cb 5b06          	addw	sp,#6
2402                     ; 871 			Adc.Idx = 1;
2404  05cd 35010009      	mov	_Adc+6,#1
2405                     ; 872 			break;
2407  05d1 2030          	jra	L536
2408  05d3               L516:
2409                     ; 873 		case 1:
2409                     ; 874 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
2409                     ; 875 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
2411  05d3 4b00          	push	#0
2412  05d5 4b04          	push	#4
2413  05d7 4b08          	push	#8
2414  05d9 4b00          	push	#0
2415  05db 4b00          	push	#0
2416  05dd 4b00          	push	#0
2417  05df ae0004        	ldw	x,#4
2418  05e2 cd0000        	call	_ADC1_Init
2420  05e5 5b06          	addw	sp,#6
2421                     ; 876 			Adc.Idx = 2;
2423  05e7 35020009      	mov	_Adc+6,#2
2424                     ; 877 			break;
2426  05eb 2016          	jra	L536
2427  05ed               L716:
2428                     ; 879 		case 2:
2428                     ; 880 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
2428                     ; 881 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
2430  05ed 4b00          	push	#0
2431  05ef 4b02          	push	#2
2432  05f1 4b08          	push	#8
2433  05f3 4b00          	push	#0
2434  05f5 4b00          	push	#0
2435  05f7 4b00          	push	#0
2436  05f9 ae0002        	ldw	x,#2
2437  05fc cd0000        	call	_ADC1_Init
2439  05ff 5b06          	addw	sp,#6
2440                     ; 882 			Adc.Idx = 0;
2442  0601               LC026:
2444  0601 3f09          	clr	_Adc+6
2445                     ; 883 			break;
2447  0603               L536:
2448                     ; 890 		ADC1_StartConversion();		
2451                     ; 891 }
2454  0603 cc0000        	jp	_ADC1_StartConversion
2498                     ; 906 void assert_failed(u8* file, u32 line)
2498                     ; 907 {
2499                     	switch	.text
2500  0606               _assert_failed:
2502  0606 88            	push	a
2503       00000001      OFST:	set	1
2506  0607               L166:
2507                     ; 916 	i = i++;
2509  0607 0c01          	inc	(OFST+0,sp)
2511  0609 6b01          	ld	(OFST+0,sp),a
2514  060b 20fa          	jra	L166
2907                     	xdef	_MotorClose
2908                     	xdef	_MotorStep
2909                     	xdef	_OnTimer_1mS
2910                     	xref	_cvtTable
2911                     	switch	.ubsct
2912  0000               _pos2:
2913  0000 00            	ds.b	1
2914                     	xdef	_pos2
2915  0001               _pos:
2916  0001 0000          	ds.b	2
2917                     	xdef	_pos
2918                     	xdef	_OnTimer_1S
2919                     	xdef	_main
2920                     	xdef	_Gpio_Config
2921                     	xdef	_Clock_Config
2922                     	xdef	_OnTimer4
2923                     	xdef	_StopDrive
2924                     	xdef	_Interval
2925                     	xdef	_StartDriveOR
2926                     	xdef	_DriveService
2927                     	xdef	_Excitation_2Phase
2928                     	xdef	_Excitation_12Phase
2929                     	xdef	_Excitation_1Phase
2930                     	xdef	_ExOff
2931                     	xdef	_CPulse
2932                     	xdef	_CStep
2933                     	xdef	_PowerDelay_1mS
2934  0003               _Adc:
2935  0003 000000000000  	ds.b	7
2936                     	xdef	_Adc
2937  000a               _My:
2938  000a 000000000000  	ds.b	12
2939                     	xdef	_My
2940  0016               _Drive:
2941  0016 000000000000  	ds.b	30
2942                     	xdef	_Drive
2943                     	xdef	_TableInterval
2944  0034               _Ticks_S:
2945  0034 00000000      	ds.b	4
2946                     	xdef	_Ticks_S
2947  0038               _Ticks2_1mS:
2948  0038 0000          	ds.b	2
2949                     	xdef	_Ticks2_1mS
2950  003a               _Ticks_1mS:
2951  003a 0000          	ds.b	2
2952                     	xdef	_Ticks_1mS
2953  003c               _Ticks_50uS:
2954  003c 00000000      	ds.b	4
2955                     	xdef	_Ticks_50uS
2956                     	xdef	_PeriodNumber
2957  0040               _Counter:
2958  0040 0000          	ds.b	2
2959                     	xdef	_Counter
2960                     	xdef	_assert_failed
2961                     	xref	_TIM4_ITConfig
2962                     	xref	_TIM4_Cmd
2963                     	xref	_TIM4_TimeBaseInit
2964                     	xref	_TIM4_DeInit
2965                     	xref	_GPIO_ReadInputPin
2966                     	xref	_GPIO_WriteReverse
2967                     	xref	_GPIO_WriteLow
2968                     	xref	_GPIO_WriteHigh
2969                     	xref	_GPIO_Init
2970                     	xref	_CLK_SYSCLKConfig
2971                     	xref	_CLK_HSIPrescalerConfig
2972                     	xref	_CLK_LSICmd
2973                     	xref	_CLK_HSICmd
2974                     	xref	_CLK_HSECmd
2975                     	xref	_CLK_DeInit
2976                     	xref	_ADC1_GetConversionValue
2977                     	xref	_ADC1_StartConversion
2978                     	xref	_ADC1_Init
2979                     	xref	_ADC1_DeInit
2980                     	xref.b	c_lreg
2981                     	xref.b	c_x
3001                     	xref	c_ladc
3002                     	xref	c_rtol
3003                     	xref	c_ludv
3004                     	xref	c_cmulx
3005                     	xref	c_lgadc
3006                     	xref	c_lcmp
3007                     	xref	c_ltor
3008                     	xref	c_imul
3009                     	end
