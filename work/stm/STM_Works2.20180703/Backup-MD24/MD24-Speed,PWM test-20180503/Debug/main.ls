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
  88                     ; 169 void main(void)
  88                     ; 170 {
  90                     	switch	.text
  91  0000               _main:
  95                     ; 172 	Clock_Config();
  97  0000 cd0441        	call	_Clock_Config
  99                     ; 173 	Gpio_Config();
 101  0003 cd045a        	call	_Gpio_Config
 103                     ; 174 	StopDrive();
 105  0006 cd01df        	call	_StopDrive
 107                     ; 175 	Timer4_Config();
 109  0009 cd0515        	call	L5_Timer4_Config
 111                     ; 177 	Adc.Idx = 2;
 113  000c 35020009      	mov	_Adc+6,#2
 114                     ; 178 	Adc_Config(  );
 116  0010 cd0529        	call	L3_Adc_Config
 118                     ; 185 	Drive.Enabled = ENABLED;
 120  0013 72100016      	bset	_Drive,#0
 121                     ; 186 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
 123  0017 ae012c        	ldw	x,#300
 124  001a bf21          	ldw	_Drive+11,x
 125                     ; 187 	Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval	
 127  001c ae0032        	ldw	x,#50
 128  001f bf26          	ldw	_Drive+16,x
 129                     ; 188 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
 131  0021 ae012c        	ldw	x,#300
 132  0024 bf2a          	ldw	_Drive+20,x
 133                     ; 190 	Drive.Position = CPulse(MAX_STEP);
 135  0026 ae00d2        	ldw	x,#210
 136  0029 cd0430        	call	_CPulse
 138                     ; 192 	Drive.Position = 0;
 140  002c 5f            	clrw	x
 141  002d bf17          	ldw	_Drive+1,x
 142                     ; 194 	Drive.ExcitationType = 1;		//12 excition
 144  002f 3501002c      	mov	_Drive+22,#1
 145                     ; 197 	Drive.Prescaler = 0x05;
 147  0033 3505003e      	mov	_Drive+40,#5
 148                     ; 227 	TIM2_DeInit();	
 150  0037 cd0000        	call	_TIM2_DeInit
 152                     ; 228 	TIM2_TimeBaseInit( Drive.Prescaler, 0xffff );
 154  003a aeffff        	ldw	x,#65535
 155  003d 89            	pushw	x
 156  003e b63e          	ld	a,_Drive+40
 157  0040 cd0000        	call	_TIM2_TimeBaseInit
 159  0043 85            	popw	x
 160                     ; 229 	TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
 162  0044 ae0201        	ldw	x,#513
 163  0047 cd0000        	call	_TIM2_ITConfig
 165                     ; 231 	enableInterrupts();
 168  004a 9a            	rim	
 170                     ; 234 	Drive.PwmEdge = 0;
 173  004b 72170016      	bres	_Drive,#3
 174                     ; 235 	TIM2_Config( Drive.PwmEdge );
 176  004f 4f            	clr	a
 177                     	btst	_Drive,#3
 178  0055 49            	rlc	a
 179  0056 cd04f6        	call	_TIM2_Config
 181                     ; 239 	StopDrive();
 183  0059 cd01df        	call	_StopDrive
 186  005c               L72:
 187                     ; 241   while ( PowerDelay_1mS )
 189  005c b613          	ld	a,_PowerDelay_1mS
 190  005e 26fc          	jrne	L72
 191                     ; 247 	Drive.Interval = 40u;
 193                     ; 248 	Drive.Interval = 12u;
 195  0060 ae000c        	ldw	x,#12
 196  0063 bf26          	ldw	_Drive+16,x
 197                     ; 250 	Drive.Position = 0;
 199  0065 5f            	clrw	x
 200  0066 bf17          	ldw	_Drive+1,x
 201                     ; 253   Drive.T1_1mS = Ticks_1mS;
 203  0068 be45          	ldw	x,_Ticks_1mS
 204  006a bf2f          	ldw	_Drive+25,x
 205                     ; 254 	StartDriveOR( 4800u, 0u  );				// Goto Zero position
 207  006c 4b00          	push	#0
 208  006e ae12c0        	ldw	x,#4800
 209  0071 cd01e1        	call	_StartDriveOR
 211  0074 84            	pop	a
 213  0075               L53:
 214                     ; 256 	while (Drive.Run)				// Wait while motor is running
 216  0075 72020016fb    	btjt	_Drive,#1,L53
 217                     ; 259 	Drive.T2_1mS = Ticks_1mS;
 219  007a be45          	ldw	x,_Ticks_1mS
 220                     ; 260 	Drive.Run0 = Drive.Run;
 222  007c               LC001:
 223  007c bf31          	ldw	_Drive+27,x
 225  007e b616          	ld	a,_Drive
 226  0080 a402          	and	a,#2
 227  0082 44            	srl	a
 228  0083 b733          	ld	_Drive+29,a
 229  0085               L14:
 230                     ; 266 		if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
 232  0085 b633          	ld	a,_Drive+29
 233  0087 2610          	jrne	L54
 235  0089 720300160b    	btjf	_Drive,#1,L54
 236                     ; 268 			Drive.T1_1mS = Ticks2_1mS;
 238  008e be43          	ldw	x,_Ticks2_1mS
 239  0090 bf2f          	ldw	_Drive+25,x
 240                     ; 269 			Drive.Run0 = Drive.Run;			
 242  0092 b616          	ld	a,_Drive
 243  0094 a402          	and	a,#2
 244  0096 44            	srl	a
 245  0097 b733          	ld	_Drive+29,a
 246  0099               L54:
 247                     ; 272 		if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
 249  0099 4a            	dec	a
 250  009a 26e9          	jrne	L14
 252  009c 72020016e4    	btjt	_Drive,#1,L14
 253                     ; 274 			Drive.T2_1mS = Ticks2_1mS;
 255  00a1 be43          	ldw	x,_Ticks2_1mS
 256                     ; 275 			Drive.Run0 = Drive.Run;			
 257  00a3 20d7          	jp	LC001
 280                     ; 285 OnTimer_1S(void)
 280                     ; 286 {
 281                     	switch	.text
 282  00a5               _OnTimer_1S:
 286                     ; 307 }
 289  00a5 81            	ret	
 320                     ; 316 OnTimer_1mS(void)
 320                     ; 317 { 
 321                     	switch	.text
 322  00a6               _OnTimer_1mS:
 326                     ; 318 	Ticks2_1mS++;
 328  00a6 be43          	ldw	x,_Ticks2_1mS
 329  00a8 5c            	incw	x
 330  00a9 bf43          	ldw	_Ticks2_1mS,x
 331                     ; 320 	if ( PowerDelay_1mS )
 333  00ab b613          	ld	a,_PowerDelay_1mS
 334  00ad 2702          	jreq	L17
 335                     ; 321 		PowerDelay_1mS--;
 337  00af 3a13          	dec	_PowerDelay_1mS
 338  00b1               L17:
 339                     ; 323 	if (  Ticks_1mS < 1999 )
 341  00b1 be45          	ldw	x,_Ticks_1mS
 342  00b3 a307cf        	cpw	x,#1999
 343  00b6 2405          	jruge	L37
 344                     ; 324 		Ticks_1mS++;
 346  00b8 5c            	incw	x
 347  00b9 bf45          	ldw	_Ticks_1mS,x
 349  00bb 2005          	jra	L57
 350  00bd               L37:
 351                     ; 327 		Ticks_1mS = 0;
 353  00bd 5f            	clrw	x
 354  00be bf45          	ldw	_Ticks_1mS,x
 355                     ; 328 		OnTimer_1S();
 357  00c0 ade3          	call	_OnTimer_1S
 359  00c2               L57:
 360                     ; 331 	pos = Adc.Value[0] / 4;
 362  00c2 be03          	ldw	x,_Adc
 363  00c4 54            	srlw	x
 364  00c5 54            	srlw	x
 365  00c6 bf01          	ldw	_pos,x
 366                     ; 332 	pos = pos *  4;
 368  00c8 3802          	sll	_pos+1
 369  00ca 3901          	rlc	_pos
 370  00cc 3802          	sll	_pos+1
 371  00ce 3901          	rlc	_pos
 372                     ; 333 	pos = pos / 5 ;
 374  00d0 a605          	ld	a,#5
 375  00d2 be01          	ldw	x,_pos
 376  00d4 62            	div	x,a
 377                     ; 348 	if ( pos > 200 ) pos = 200;
 379  00d5 a300c9        	cpw	x,#201
 380  00d8 2503          	jrult	L77
 383  00da ae00c8        	ldw	x,#200
 384  00dd               L77:
 385                     ; 350 	if  ( pos < 20 ) pos = 0;
 387  00dd a30014        	cpw	x,#20
 388  00e0 2401          	jruge	L101
 391  00e2 5f            	clrw	x
 392  00e3               L101:
 393  00e3 bf01          	ldw	_pos,x
 394                     ; 356 	if ( ! (Ticks_1mS % 500) )
 396  00e5 90ae01f4      	ldw	y,#500
 397  00e9 be45          	ldw	x,_Ticks_1mS
 398  00eb 65            	divw	x,y
 399  00ec 905d          	tnzw	y
 400  00ee 260d          	jrne	L301
 401                     ; 358 		if ( ! Drive.Run )
 403  00f0 b616          	ld	a,_Drive
 404  00f2 a502          	bcp	a,#2
 405                     ; 367 		GPIO_WriteReverse(LED_PORT, LED_PIN);
 407  00f4 4b04          	push	#4
 408  00f6 ae5000        	ldw	x,#20480
 409  00f9 cd0000        	call	_GPIO_WriteReverse
 411  00fc 84            	pop	a
 412  00fd               L301:
 413                     ; 371 }
 416  00fd 81            	ret	
 445                     .const:	section	.text
 446  0000               L06:
 447  0000 00000013      	dc.l	19
 448                     ; 374 void OnTimer4(void)
 448                     ; 375 {
 449                     	switch	.text
 450  00fe               _OnTimer4:
 454                     ; 377 	Adc_Config(  );
 456  00fe cd0529        	call	L3_Adc_Config
 458                     ; 378 	Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
 460  0101 4b10          	push	#16
 461  0103 ae5005        	ldw	x,#20485
 462  0106 cd0000        	call	_GPIO_ReadInputPin
 464  0109 5b01          	addw	sp,#1
 465  010b 4d            	tnz	a
 466  010c 2603          	jrne	L25
 467  010e 4c            	inc	a
 468  010f 2001          	jra	L65
 469  0111               L25:
 470  0111 4f            	clr	a
 471  0112               L65:
 472  0112 b72d          	ld	_Drive+23,a
 473                     ; 380 	if (  Ticks_50uS < 19 )
 475  0114 ae0047        	ldw	x,#_Ticks_50uS
 476  0117 cd0000        	call	c_ltor
 478  011a ae0000        	ldw	x,#L06
 479  011d cd0000        	call	c_lcmp
 481  0120 240a          	jruge	L711
 482                     ; 381 		Ticks_50uS++;
 484  0122 ae0047        	ldw	x,#_Ticks_50uS
 485  0125 a601          	ld	a,#1
 486  0127 cd0000        	call	c_lgadc
 489  012a 2008          	jra	L121
 490  012c               L711:
 491                     ; 384 		Ticks_50uS = 0;
 493  012c 5f            	clrw	x
 494  012d bf49          	ldw	_Ticks_50uS+2,x
 495  012f bf47          	ldw	_Ticks_50uS,x
 496                     ; 385 		OnTimer_1mS();
 498  0131 cd00a6        	call	_OnTimer_1mS
 500  0134               L121:
 501                     ; 389 	if ( Drive.Ticks > 0 )
 503  0134 be28          	ldw	x,_Drive+18
 504  0136 2703          	jreq	L321
 505                     ; 390 		Drive.Ticks--;
 507  0138 5a            	decw	x
 508  0139 bf28          	ldw	_Drive+18,x
 509  013b               L321:
 510                     ; 392 	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
 512  013b 720100160b    	btjf	_Drive,#0,L521
 514  0140 be28          	ldw	x,_Drive+18
 515  0142 2607          	jrne	L521
 516                     ; 394 		DriveService();	
 518  0144 cd02d9        	call	_DriveService
 520                     ; 395 		Drive.Ticks = Drive.Interval;
 522  0147 be26          	ldw	x,_Drive+16
 523  0149 bf28          	ldw	_Drive+18,x
 524  014b               L521:
 525                     ; 398 }
 528  014b 81            	ret	
 554                     ; 400 void OnCaptureOVTim2(void)
 554                     ; 401 {
 555                     	switch	.text
 556  014c               _OnCaptureOVTim2:
 560                     ; 402 	Drive.PwmT4 = TIM2_GetCapture1();
 562  014c cd0000        	call	_TIM2_GetCapture1
 564  014f bf3c          	ldw	_Drive+38,x
 565                     ; 403 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);		//Move to Interrupt routine
 567  0151 ae0001        	ldw	x,#1
 569                     ; 404 }
 572  0154 cc0000        	jp	_TIM2_ClearFlag
 600                     ; 423 void OnCaptureTim2(void)
 600                     ; 424 {
 601                     	switch	.text
 602  0157               _OnCaptureTim2:
 604  0157 5204          	subw	sp,#4
 605       00000004      OFST:	set	4
 608                     ; 438 	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
 610  0159 a602          	ld	a,#2
 611  015b cd0000        	call	_TIM2_GetITStatus
 613  015e 4a            	dec	a
 614  015f 2656          	jrne	L351
 615                     ; 439 		return;
 617                     ; 441 	if ( Drive.PwmEdge == 0 ) 
 619  0161 720600163e    	btjt	_Drive,#3,L151
 620                     ; 443 		Drive.PwmT2 = TIM2_GetCapture1();
 622  0166 cd0000        	call	_TIM2_GetCapture1
 624  0169 bf36          	ldw	_Drive+32,x
 625                     ; 445 		TIM2_SetCounter(0u);
 627  016b 5f            	clrw	x
 628  016c cd0000        	call	_TIM2_SetCounter
 630                     ; 447 		Drive.PwmEdge = 1;
 632  016f 72160016      	bset	_Drive,#3
 633                     ; 448 		TIM2_Config( Drive.PwmEdge );
 635  0173 4f            	clr	a
 636                     	btst	_Drive,#3
 637  0179 49            	rlc	a
 638  017a cd04f6        	call	_TIM2_Config
 640                     ; 450 		Drive.PwmDuty = (Drive.PwmT1 * (uint32_t)400 /  Drive.PwmT2) + 1 ;
 642  017d be36          	ldw	x,_Drive+32
 643  017f cd0000        	call	c_uitolx
 645  0182 96            	ldw	x,sp
 646  0183 5c            	incw	x
 647  0184 cd0000        	call	c_rtol
 650  0187 be34          	ldw	x,_Drive+30
 651  0189 90ae0190      	ldw	y,#400
 652  018d cd0000        	call	c_umul
 654  0190 96            	ldw	x,sp
 655  0191 5c            	incw	x
 656  0192 cd0000        	call	c_ludv
 658  0195 a601          	ld	a,#1
 659  0197 cd0000        	call	c_ladc
 661  019a be02          	ldw	x,c_lreg+2
 662  019c bf38          	ldw	_Drive+34,x
 663                     ; 451 		Drive.PwmDuty /= 2;
 665  019e 3438          	srl	_Drive+34
 666  01a0 3639          	rrc	_Drive+35
 668  01a2 2013          	jra	L351
 669  01a4               L151:
 670                     ; 456 		Drive.PwmT1 = TIM2_GetCapture1();
 672  01a4 cd0000        	call	_TIM2_GetCapture1
 674  01a7 bf34          	ldw	_Drive+30,x
 675                     ; 457 		Drive.PwmEdge = 0;
 677                     ; 458 		TIM2_Config( Drive.PwmEdge );
 679  01a9 72170016      	bres	_Drive,#3
 680  01ad 4f            	clr	a
 681                     	btst	_Drive,#3
 682  01b3 49            	rlc	a
 683  01b4 cd04f6        	call	_TIM2_Config
 685  01b7               L351:
 686                     ; 464 }
 689  01b7 5b04          	addw	sp,#4
 690  01b9 81            	ret	
 714                     ; 470 void ExOff(void)
 714                     ; 471 {
 715                     	switch	.text
 716  01ba               _ExOff:
 720                     ; 472 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
 722  01ba 4b40          	push	#64
 723  01bc ae500a        	ldw	x,#20490
 724  01bf cd0000        	call	_GPIO_WriteLow
 726  01c2 84            	pop	a
 727                     ; 473 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
 729  01c3 4b08          	push	#8
 730  01c5 ae500a        	ldw	x,#20490
 731  01c8 cd0000        	call	_GPIO_WriteLow
 733  01cb 84            	pop	a
 734                     ; 474 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
 736  01cc 4b80          	push	#128
 737  01ce ae500a        	ldw	x,#20490
 738  01d1 cd0000        	call	_GPIO_WriteLow
 740  01d4 84            	pop	a
 741                     ; 475 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
 743  01d5 4b08          	push	#8
 744  01d7 ae5000        	ldw	x,#20480
 745  01da cd0000        	call	_GPIO_WriteLow
 747  01dd 84            	pop	a
 748                     ; 476 }
 751  01de 81            	ret	
 775                     ; 481 void StopDrive(void)			//TROff()
 775                     ; 482 {
 776                     	switch	.text
 777  01df               _StopDrive:
 781                     ; 483 	ExOff();	
 784                     ; 484 }
 787  01df 20d9          	jp	_ExOff
 832                     ; 490 void StartDriveOR( uint16_t Target, uint8_t overrun )
 832                     ; 491 {
 833                     	switch	.text
 834  01e1               _StartDriveOR:
 836  01e1 89            	pushw	x
 837       00000000      OFST:	set	0
 840                     ; 499 	if ( Drive.Run ) return;
 842  01e2 7202001606    	btjt	_Drive,#1,L041
 845                     ; 500 	if ( Drive.Position == Target ) return;
 847  01e7 be17          	ldw	x,_Drive+1
 848  01e9 1301          	cpw	x,(OFST+1,sp)
 849  01eb 2602          	jrne	L122
 851  01ed               L041:
 854  01ed 85            	popw	x
 855  01ee 81            	ret	
 856  01ef               L122:
 857                     ; 503 	if ( Target == 0 )				//  goto origin
 859  01ef 1e01          	ldw	x,(OFST+1,sp)
 860  01f1 2616          	jrne	L322
 861                     ; 505 		Drive.Overrun =	0u;
 863  01f3 5f            	clrw	x
 864  01f4 bf1b          	ldw	_Drive+5,x
 865                     ; 506 		Drive.ZeroOffset = CPulse( OVER_STEP );
 867  01f6 ae001e        	ldw	x,#30
 868  01f9 cd0430        	call	_CPulse
 870  01fc bf1e          	ldw	_Drive+8,x
 871                     ; 508 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
 873  01fe be17          	ldw	x,_Drive+1
 874  0200 72bb001e      	addw	x,_Drive+8
 875  0204 bf17          	ldw	_Drive+1,x
 876                     ; 509 		Drive.Target = 0u;
 878  0206 5f            	clrw	x
 879                     ; 510 		Drive.State = nMotorClose;		// 0;
 881  0207 200f          	jp	LC002
 882  0209               L322:
 883                     ; 517 		if (Drive.Position >= Target)		// Closing
 885  0209 be17          	ldw	x,_Drive+1
 886  020b 1301          	cpw	x,(OFST+1,sp)
 887  020d 250f          	jrult	L722
 888                     ; 519 			Drive.Overrun =	0u;
 890  020f 5f            	clrw	x
 891  0210 bf1b          	ldw	_Drive+5,x
 892                     ; 520 			Drive.State = nMotorClose;
 894  0212 3f25          	clr	_Drive+15
 895                     ; 521 			Drive.Overrun2 = 0u;
 897  0214 3f1d          	clr	_Drive+7
 898                     ; 522 			Drive.Target = Target;
 900  0216 1e01          	ldw	x,(OFST+1,sp)
 901                     ; 523 			Drive.State = nMotorClose;		// 0;
 903  0218               LC002:
 904  0218 bf19          	ldw	_Drive+3,x
 906  021a 3f25          	clr	_Drive+15
 908  021c 2017          	jra	L522
 909  021e               L722:
 910                     ; 527 			Drive.State = nMotorOpen;	//1;
 912  021e 35010025      	mov	_Drive+15,#1
 913                     ; 536 				Drive.Overrun2 = overrun;		//100;
 915  0222 7b05          	ld	a,(OFST+5,sp)
 916  0224 b71d          	ld	_Drive+7,a
 917                     ; 537 				Drive.Target = Target + overrun;	//100;	
 919  0226 7b01          	ld	a,(OFST+1,sp)
 920  0228 97            	ld	xl,a
 921  0229 7b02          	ld	a,(OFST+2,sp)
 922  022b 1b05          	add	a,(OFST+5,sp)
 923  022d 2401          	jrnc	L631
 924  022f 5c            	incw	x
 925  0230               L631:
 926  0230 b71a          	ld	_Drive+4,a
 927  0232 9f            	ld	a,xl
 928  0233 b719          	ld	_Drive+3,a
 929  0235               L522:
 930                     ; 542 	Drive.Run = TRUE;
 932  0235 72120016      	bset	_Drive,#1
 933                     ; 543 	Drive.Ticks = Drive.Interval;
 935  0239 be26          	ldw	x,_Drive+16
 936  023b bf28          	ldw	_Drive+18,x
 937                     ; 544 }
 939  023d 20ae          	jra	L041
 999                     ; 550 void MotorStep(MOTOR_DIR Dir)
 999                     ; 551 {
1000                     	switch	.text
1001  023f               _MotorStep:
1005                     ; 552 	if ( Dir == nMotorClose )
1007  023f 4d            	tnz	a
1008  0240 2627          	jrne	L762
1009                     ; 554 		if ( Drive.Position != 0 ) 
1011  0242 be17          	ldw	x,_Drive+1
1012  0244 270d          	jreq	L172
1013                     ; 556 			Drive.Position--;
1015  0246 5a            	decw	x
1016  0247 bf17          	ldw	_Drive+1,x
1017                     ; 557 			if ( Drive.NormalOpen )
1019  0249 b62e          	ld	a,_Drive+24
1020  024b 2704          	jreq	L372
1021                     ; 558 				Drive.Phase++;   // NC
1023  024d 3c20          	inc	_Drive+10
1025  024f 2002          	jra	L172
1026  0251               L372:
1027                     ; 561 				Drive.Phase--;	//NC
1029  0251 3a20          	dec	_Drive+10
1030  0253               L172:
1031                     ; 565 		if ( Drive.Position == 0 ) 
1033  0253 be17          	ldw	x,_Drive+1
1034  0255 2643          	jrne	L103
1035                     ; 568 			Drive.Overrun = 0u;
1037  0257 5f            	clrw	x
1038  0258 bf1b          	ldw	_Drive+5,x
1039                     ; 569 			Drive.Run = FALSE;
1041  025a 72130016      	bres	_Drive,#1
1042                     ; 570 			Drive.ZeroOffset = 0u;
1044  025e bf1e          	ldw	_Drive+8,x
1045                     ; 571 			Drive.Position = 0u;
1047  0260 bf17          	ldw	_Drive+1,x
1048                     ; 572 			Drive.Target = 0u;
1050  0262 bf19          	ldw	_Drive+3,x
1051                     ; 573 			StopDrive();	
1053  0264 cd01df        	call	_StopDrive
1055  0267 2031          	jra	L103
1056  0269               L762:
1057                     ; 579 			Drive.Position++;
1059  0269 be17          	ldw	x,_Drive+1
1060  026b 5c            	incw	x
1061  026c bf17          	ldw	_Drive+1,x
1062                     ; 581 		if ( Drive.NormalOpen )
1064  026e b62e          	ld	a,_Drive+24
1065  0270 2704          	jreq	L303
1066                     ; 582 				Drive.Phase--;
1068  0272 3a20          	dec	_Drive+10
1070  0274 2002          	jra	L503
1071  0276               L303:
1072                     ; 584 				Drive.Phase++;
1074  0276 3c20          	inc	_Drive+10
1075  0278               L503:
1076                     ; 587 		if ( Drive.Origin ) 
1078  0278 b62d          	ld	a,_Drive+23
1079  027a 2708          	jreq	L703
1080                     ; 589 			Drive.ORGPosition = Drive.Position;
1082  027c bf23          	ldw	_Drive+13,x
1083                     ; 590 			Drive.LastOrigin = TRUE;
1085  027e 72140016      	bset	_Drive,#2
1087  0282 2016          	jra	L103
1088  0284               L703:
1089                     ; 593 			if ( Drive.LastOrigin )
1091  0284 7205001611    	btjf	_Drive,#2,L103
1092                     ; 595 				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1094  0289 be23          	ldw	x,_Drive+13
1095  028b 1d0028        	subw	x,#40
1096  028e bf21          	ldw	_Drive+11,x
1097                     ; 596 				if ( Drive.MaxOverrun > OVERRUN )
1099  0290 a3012d        	cpw	x,#301
1100  0293 2505          	jrult	L103
1101                     ; 597 					Drive.MaxOverrun = OVERRUN;				
1103  0295 ae012c        	ldw	x,#300
1104  0298 bf21          	ldw	_Drive+11,x
1105  029a               L103:
1106                     ; 602 	if ( !Drive.Run ) return;
1108  029a 7202001601    	btjt	_Drive,#1,L713
1112  029f 81            	ret	
1113  02a0               L713:
1114                     ; 603 	if ( !Drive.Enabled ) return;
1116  02a0 7200001601    	btjt	_Drive,#0,L123
1120  02a5 81            	ret	
1121  02a6               L123:
1122                     ; 604 	switch ( Drive.ExcitationType )
1124  02a6 b62c          	ld	a,_Drive+22
1126                     ; 615 			break;
1127  02a8 2707          	jreq	L332
1128  02aa 4a            	dec	a
1129  02ab 2707          	jreq	L532
1130  02ad 4a            	dec	a
1131  02ae 2706          	jreq	L732
1133  02b0 81            	ret	
1134  02b1               L332:
1135                     ; 607 		case 0:
1135                     ; 608 			Excitation_1Phase();	
1138                     ; 609 			break;
1141  02b1 cc03e6        	jp	_Excitation_1Phase
1142  02b4               L532:
1143                     ; 610 		case 1:
1143                     ; 611 			Excitation_12Phase();
1146                     ; 612 			break;
1149  02b4 2067          	jp	_Excitation_12Phase
1150  02b6               L732:
1151                     ; 613 		case 2:
1151                     ; 614 			Excitation_2Phase();
1154                     ; 615 			break;
1156                     ; 620 }
1159  02b6 2064          	jp	_Excitation_2Phase
1185                     ; 625 void MotorClose(void)
1185                     ; 626 {
1186                     	switch	.text
1187  02b8               _MotorClose:
1191                     ; 627 	if ( Drive.Origin )   		// Hall IC Sensing 
1193  02b8 b62d          	ld	a,_Drive+23
1194  02ba 2719          	jreq	L733
1195                     ; 629 		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
1197  02bc be1b          	ldw	x,_Drive+5
1198  02be b321          	cpw	x,_Drive+11
1199  02c0 2510          	jrult	L143
1200                     ; 631 			Drive.Target = 0u;
1202  02c2 5f            	clrw	x
1203  02c3 bf19          	ldw	_Drive+3,x
1204                     ; 632 			Drive.Position = 0u;
1206  02c5 bf17          	ldw	_Drive+1,x
1207                     ; 633 			Drive.Overrun = 0u;
1209  02c7 bf1b          	ldw	_Drive+5,x
1210                     ; 634 			Drive.ZeroOffset = 0u;
1212  02c9 bf1e          	ldw	_Drive+8,x
1213                     ; 635 			Drive.Run = FALSE;			
1215  02cb 72130016      	bres	_Drive,#1
1216                     ; 636 			StopDrive();
1221  02cf cc01df        	jp	_StopDrive
1222  02d2               L143:
1223                     ; 640 			Drive.Overrun++;
1225  02d2 5c            	incw	x
1226  02d3 bf1b          	ldw	_Drive+5,x
1227                     ; 641 			MotorStep(nMotorClose);
1229  02d5               L733:
1230                     ; 645 		MotorStep(nMotorClose);		// move 1 step close
1233  02d5 4f            	clr	a
1235                     ; 646 }
1238  02d6 cc023f        	jp	_MotorStep
1266                     ; 651 void DriveService(void)
1266                     ; 652 {
1267                     	switch	.text
1268  02d9               _DriveService:
1270  02d9 89            	pushw	x
1271       00000002      OFST:	set	2
1274                     ; 660 	ExOff();
1276  02da cd01ba        	call	_ExOff
1278                     ; 662 	if ( ! Drive.Run ) return;	//when Drive is stop 
1280  02dd 7203001638    	btjf	_Drive,#1,L363
1283                     ; 669 	if ( Drive.Target > Drive.Position )
1285  02e2 be19          	ldw	x,_Drive+3
1286  02e4 b317          	cpw	x,_Drive+1
1287  02e6 2307          	jrule	L163
1288                     ; 670 	 	MotorStep(nMotorOpen);
1290  02e8 a601          	ld	a,#1
1291  02ea cd023f        	call	_MotorStep
1294  02ed 202b          	jra	L363
1295  02ef               L163:
1296                     ; 671 	else if ( Drive.Target < Drive.Position )
1298  02ef b317          	cpw	x,_Drive+1
1299  02f1 2404          	jruge	L563
1300                     ; 672 		MotorClose( );
1302  02f3 adc3          	call	_MotorClose
1305  02f5 2023          	jra	L363
1306  02f7               L563:
1307                     ; 673 	else if ( Drive.Target ) 	// on target position
1309  02f7 be19          	ldw	x,_Drive+3
1310  02f9 2713          	jreq	L373
1311                     ; 675 			if ( Drive.Overrun2 )
1313  02fb b61d          	ld	a,_Drive+7
1314  02fd 270f          	jreq	L373
1315                     ; 677 				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1317  02ff 5f            	clrw	x
1318  0300 97            	ld	xl,a
1319  0301 1f01          	ldw	(OFST-1,sp),x
1321  0303 be19          	ldw	x,_Drive+3
1322  0305 72f001        	subw	x,(OFST-1,sp)
1323  0308 bf19          	ldw	_Drive+3,x
1324                     ; 678 				Drive.Overrun2 = 0u;
1326  030a 3f1d          	clr	_Drive+7
1328  030c 200c          	jra	L363
1329  030e               L373:
1330                     ; 682 				Drive.ZeroOffset = 0u;
1331                     ; 683 				Drive.Overrun = 0u;
1332                     ; 684 				Drive.Run = FALSE;
1333                     ; 685 				StopDrive();		
1335                     ; 691 			Drive.ZeroOffset = 0u;
1337                     ; 692 			Drive.Overrun = 0u;
1339                     ; 693 			Drive.Run = FALSE;
1341                     ; 694 			StopDrive();	
1344  030e 5f            	clrw	x
1345  030f bf1e          	ldw	_Drive+8,x
1347  0311 bf1b          	ldw	_Drive+5,x
1349  0313 72130016      	bres	_Drive,#1
1351  0317 cd01df        	call	_StopDrive
1353  031a               L363:
1354                     ; 696 }
1357  031a 85            	popw	x
1358  031b 81            	ret	
1381                     ; 699 void Excitation_2Phase( void )
1381                     ; 700 {
1382                     	switch	.text
1383  031c               _Excitation_2Phase:
1387                     ; 759 }
1390  031c 81            	ret	
1416                     ; 762 void Excitation_12Phase( void )
1416                     ; 763 {
1417                     	switch	.text
1418  031d               _Excitation_12Phase:
1422                     ; 765 	switch (Drive.Phase%8)
1424  031d b620          	ld	a,_Drive+10
1425  031f a407          	and	a,#7
1427                     ; 816 		default:
1427                     ; 817 			break;
1428  0321 2716          	jreq	L114
1429  0323 4a            	dec	a
1430  0324 271d          	jreq	L314
1431  0326 4a            	dec	a
1432  0327 272d          	jreq	L514
1433  0329 4a            	dec	a
1434  032a 273f          	jreq	L714
1435  032c 4a            	dec	a
1436  032d 2748          	jreq	L124
1437  032f 4a            	dec	a
1438  0330 2753          	jreq	L324
1439  0332 4a            	dec	a
1440  0333 276e          	jreq	L524
1441  0335 4a            	dec	a
1442  0336 2775          	jreq	L724
1444  0338 81            	ret	
1445  0339               L114:
1446                     ; 767 		case 0:
1446                     ; 768 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1448  0339 4b40          	push	#64
1449  033b ae500a        	ldw	x,#20490
1450  033e cd0000        	call	_GPIO_WriteHigh
1452                     ; 769 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1454                     ; 770 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1456                     ; 771 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1458                     ; 772 			break;
1460  0341 2008          	jp	LC008
1461  0343               L314:
1462                     ; 773 		case 1:
1462                     ; 774 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1464  0343 4b40          	push	#64
1465  0345 ae500a        	ldw	x,#20490
1466  0348 cd0000        	call	_GPIO_WriteLow
1468                     ; 775 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1470  034b               LC008:
1471  034b 84            	pop	a
1473  034c 4b08          	push	#8
1474  034e ae500a        	ldw	x,#20490
1475  0351 cd0000        	call	_GPIO_WriteHigh
1477                     ; 776 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1479                     ; 777 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
1481                     ; 778 			break;		
1483  0354 2068          	jp	LC007
1484  0356               L514:
1485                     ; 779 		case 2:
1485                     ; 780 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1487  0356 ad7a          	call	LC012
1488                     ; 781 			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
1490  0358 4b08          	push	#8
1491  035a ae500a        	ldw	x,#20490
1492  035d cd0000        	call	_GPIO_WriteHigh
1494                     ; 782 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1496  0360               LC009:
1497  0360 84            	pop	a
1499  0361 4b80          	push	#128
1500  0363 ae500a        	ldw	x,#20490
1501  0366 cd0000        	call	_GPIO_WriteHigh
1503                     ; 783 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
1505                     ; 784 			break;
1507  0369 205c          	jp	LC006
1508  036b               L714:
1509                     ; 785 		case 3:
1509                     ; 786 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1511  036b ad65          	call	LC012
1512                     ; 787 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1514  036d 4b08          	push	#8
1515  036f ae500a        	ldw	x,#20490
1516  0372 cd0000        	call	_GPIO_WriteLow
1518                     ; 788 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1520                     ; 789 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1522                     ; 790 			break;
1524  0375 20e9          	jp	LC009
1525  0377               L124:
1526                     ; 791 		case 4:
1526                     ; 792 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1528  0377 ad59          	call	LC012
1529                     ; 793 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1531  0379 ad61          	call	LC013
1532                     ; 794 			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
1534  037b 4b80          	push	#128
1535  037d ae500a        	ldw	x,#20490
1536  0380 cd0000        	call	_GPIO_WriteHigh
1538                     ; 795 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1540                     ; 796 			break;
1542  0383 2013          	jp	LC010
1543  0385               L324:
1544                     ; 797 		case 5: 
1544                     ; 798 			GPIO_WriteLow(_X1_PORT, _X1_PIN);
1546  0385 4b40          	push	#64
1547  0387 ae500a        	ldw	x,#20490
1548  038a cd0000        	call	_GPIO_WriteLow
1550                     ; 799 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1553                     ; 800 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1555  038d               LC011:
1556  038d 84            	pop	a
1558  038e ad4c          	call	LC013
1560  0390 4b80          	push	#128
1561  0392 ae500a        	ldw	x,#20490
1562  0395 cd0000        	call	_GPIO_WriteLow
1564                     ; 801 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
1566  0398               LC010:
1567  0398 84            	pop	a
1570  0399 4b08          	push	#8
1571  039b ae5000        	ldw	x,#20480
1572  039e cd0000        	call	_GPIO_WriteHigh
1574                     ; 802 			break;
1576  03a1 202d          	jp	LC005
1577  03a3               L524:
1578                     ; 803 		case 6:  
1578                     ; 804 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1580  03a3 4b40          	push	#64
1581  03a5 ae500a        	ldw	x,#20490
1582  03a8 cd0000        	call	_GPIO_WriteHigh
1584                     ; 805 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1586                     ; 806 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1588                     ; 807 			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
1590                     ; 808 			break;
1592  03ab 20e0          	jp	LC011
1593  03ad               L724:
1594                     ; 809 		case 7:
1594                     ; 810 			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
1596  03ad 4b40          	push	#64
1597  03af ae500a        	ldw	x,#20490
1598  03b2 cd0000        	call	_GPIO_WriteHigh
1600  03b5 84            	pop	a
1601                     ; 811 			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
1603  03b6 4b08          	push	#8
1604  03b8 ae500a        	ldw	x,#20490
1605  03bb cd0000        	call	_GPIO_WriteLow
1607                     ; 812 			GPIO_WriteLow(_X2_PORT, _X2_PIN);
1609  03be               LC007:
1610  03be 84            	pop	a
1613  03bf 4b80          	push	#128
1614  03c1 ae500a        	ldw	x,#20490
1615  03c4 cd0000        	call	_GPIO_WriteLow
1617                     ; 813 			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
1619  03c7               LC006:
1620  03c7 84            	pop	a
1625  03c8 4b08          	push	#8
1626  03ca ae5000        	ldw	x,#20480
1627  03cd cd0000        	call	_GPIO_WriteLow
1629  03d0               LC005:
1630  03d0 84            	pop	a
1631                     ; 814 			break;
1633                     ; 816 		default:
1633                     ; 817 			break;
1635                     ; 820 }
1638  03d1 81            	ret	
1639  03d2               LC012:
1640  03d2 4b40          	push	#64
1641  03d4 ae500a        	ldw	x,#20490
1642  03d7 cd0000        	call	_GPIO_WriteLow
1644  03da 84            	pop	a
1645  03db 81            	ret	
1646  03dc               LC013:
1647  03dc 4b08          	push	#8
1648  03de ae500a        	ldw	x,#20490
1649  03e1 cd0000        	call	_GPIO_WriteLow
1651  03e4 84            	pop	a
1652  03e5 81            	ret	
1675                     ; 822 void Excitation_1Phase( void )
1675                     ; 823 {
1676                     	switch	.text
1677  03e6               _Excitation_1Phase:
1681                     ; 860 }
1684  03e6 81            	ret	
1719                     ; 863 u8 Interval( u16 Vmon)
1719                     ; 864 {
1720                     	switch	.text
1721  03e7               _Interval:
1723  03e7 89            	pushw	x
1724       00000000      OFST:	set	0
1727                     ; 865 	Vmon = Vmon / IntervalSlope;
1729  03e8 a61c          	ld	a,#28
1730  03ea 62            	div	x,a
1731                     ; 867 	if (Vmon < 10 ) Vmon = 10;
1733  03eb a3000a        	cpw	x,#10
1734  03ee 2403          	jruge	L574
1737  03f0 ae000a        	ldw	x,#10
1738  03f3               L574:
1739                     ; 868 	if (Vmon > 26 ) Vmon = 26;
1741  03f3 a3001b        	cpw	x,#27
1742  03f6 2503          	jrult	L774
1745  03f8 ae001a        	ldw	x,#26
1746  03fb               L774:
1747                     ; 870 	return ( TableInterval[ Vmon-10 ] );
1749  03fb 1d000a        	subw	x,#10
1750  03fe e602          	ld	a,(_TableInterval,x)
1753  0400 85            	popw	x
1754  0401 81            	ret	
1797                     	switch	.const
1798  0004               L413:
1799  0004 00000960      	dc.l	2400
1800                     ; 885 uint16_t CStep( uint16_t pulse )
1800                     ; 886 {
1801                     	switch	.text
1802  0402               _CStep:
1804  0402 5204          	subw	sp,#4
1805       00000004      OFST:	set	4
1808                     ; 889 	i = (uint32_t) pulse * 200u / (2400UL);
1810  0404 a6c8          	ld	a,#200
1811  0406 cd0000        	call	c_cmulx
1813  0409 ae0004        	ldw	x,#L413
1814  040c cd0000        	call	c_ludv
1816  040f 96            	ldw	x,sp
1817  0410 5c            	incw	x
1818  0411 cd0000        	call	c_rtol
1821                     ; 890 	i = (i+1)/2;   				// Round up  20150925
1823  0414 96            	ldw	x,sp
1824  0415 5c            	incw	x
1825  0416 cd0000        	call	c_ltor
1827  0419 a601          	ld	a,#1
1828  041b cd0000        	call	c_ladc
1830  041e 3400          	srl	c_lreg
1831  0420 3601          	rrc	c_lreg+1
1832  0422 3602          	rrc	c_lreg+2
1833  0424 96            	ldw	x,sp
1834  0425 3603          	rrc	c_lreg+3
1835  0427 5c            	incw	x
1836  0428 cd0000        	call	c_rtol
1839                     ; 891 	return (uint16_t) i;
1841  042b 1e03          	ldw	x,(OFST-1,sp)
1844  042d 5b04          	addw	sp,#4
1845  042f 81            	ret	
1888                     ; 895 uint16_t CPulse( uint16_t step )
1888                     ; 896 {
1889                     	switch	.text
1890  0430               _CPulse:
1892  0430 5204          	subw	sp,#4
1893       00000004      OFST:	set	4
1896                     ; 899     i= (uint32_t) step *(24UL);
1898  0432 a618          	ld	a,#24
1899  0434 cd0000        	call	c_cmulx
1901  0437 96            	ldw	x,sp
1902  0438 5c            	incw	x
1903  0439 cd0000        	call	c_rtol
1906                     ; 901 	return (uint16_t) i;
1908  043c 1e03          	ldw	x,(OFST-1,sp)
1911  043e 5b04          	addw	sp,#4
1912  0440 81            	ret	
1941                     ; 912 void Clock_Config(void)
1941                     ; 913 {
1942                     	switch	.text
1943  0441               _Clock_Config:
1947                     ; 915 	CLK_DeInit();
1949  0441 cd0000        	call	_CLK_DeInit
1951                     ; 916 	CLK_HSICmd(ENABLE);
1953  0444 a601          	ld	a,#1
1954  0446 cd0000        	call	_CLK_HSICmd
1956                     ; 917 	CLK_LSICmd(DISABLE);
1958  0449 4f            	clr	a
1959  044a cd0000        	call	_CLK_LSICmd
1961                     ; 918 	CLK_HSECmd(DISABLE);
1963  044d 4f            	clr	a
1964  044e cd0000        	call	_CLK_HSECmd
1966                     ; 920 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1968  0451 4f            	clr	a
1969  0452 cd0000        	call	_CLK_HSIPrescalerConfig
1971                     ; 921 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
1973  0455 a680          	ld	a,#128
1975                     ; 922 }
1978  0457 cc0000        	jp	_CLK_SYSCLKConfig
2004                     ; 925 void Gpio_Config(void)
2004                     ; 926 {
2005                     	switch	.text
2006  045a               _Gpio_Config:
2010                     ; 928   GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2012  045a 4be0          	push	#224
2013  045c 4b04          	push	#4
2014  045e ae5000        	ldw	x,#20480
2015  0461 cd0000        	call	_GPIO_Init
2017  0464 85            	popw	x
2018                     ; 929 	GPIO_WriteHigh(LED_PORT, LED_PIN);
2020  0465 4b04          	push	#4
2021  0467 ae5000        	ldw	x,#20480
2022  046a cd0000        	call	_GPIO_WriteHigh
2024  046d 84            	pop	a
2025                     ; 932 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2027  046e 4be0          	push	#224
2028  0470 4b40          	push	#64
2029  0472 ae500a        	ldw	x,#20490
2030  0475 cd0000        	call	_GPIO_Init
2032  0478 85            	popw	x
2033                     ; 933 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2035  0479 4be0          	push	#224
2036  047b 4b80          	push	#128
2037  047d ae500a        	ldw	x,#20490
2038  0480 cd0000        	call	_GPIO_Init
2040  0483 85            	popw	x
2041                     ; 934 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2043  0484 4be0          	push	#224
2044  0486 4b08          	push	#8
2045  0488 ae500a        	ldw	x,#20490
2046  048b cd0000        	call	_GPIO_Init
2048  048e 85            	popw	x
2049                     ; 935 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2051  048f 4be0          	push	#224
2052  0491 4b08          	push	#8
2053  0493 ae5000        	ldw	x,#20480
2054  0496 cd0000        	call	_GPIO_Init
2056  0499 85            	popw	x
2057                     ; 937 	GPIO_WriteLow(_X1_PORT, _X1_PIN);
2059  049a 4b40          	push	#64
2060  049c ae500a        	ldw	x,#20490
2061  049f cd0000        	call	_GPIO_WriteLow
2063  04a2 84            	pop	a
2064                     ; 938 	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
2066  04a3 4b08          	push	#8
2067  04a5 ae500a        	ldw	x,#20490
2068  04a8 cd0000        	call	_GPIO_WriteLow
2070  04ab 84            	pop	a
2071                     ; 939 	GPIO_WriteLow(_X2_PORT, _X2_PIN);
2073  04ac 4b80          	push	#128
2074  04ae ae500a        	ldw	x,#20490
2075  04b1 cd0000        	call	_GPIO_WriteLow
2077  04b4 84            	pop	a
2078                     ; 940 	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
2080  04b5 4b08          	push	#8
2081  04b7 ae5000        	ldw	x,#20480
2082  04ba cd0000        	call	_GPIO_WriteLow
2084  04bd 84            	pop	a
2085                     ; 943   GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
2087  04be 4b00          	push	#0
2088  04c0 4b10          	push	#16
2089  04c2 ae5005        	ldw	x,#20485
2090  04c5 cd0000        	call	_GPIO_Init
2092  04c8 85            	popw	x
2093                     ; 946 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
2095  04c9 4b00          	push	#0
2096  04cb 4b04          	push	#4
2097  04cd ae500f        	ldw	x,#20495
2098  04d0 cd0000        	call	_GPIO_Init
2100  04d3 85            	popw	x
2101                     ; 948 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2103  04d4 4b00          	push	#0
2104  04d6 4b10          	push	#16
2105  04d8 ae500f        	ldw	x,#20495
2106  04db cd0000        	call	_GPIO_Init
2108  04de 85            	popw	x
2109                     ; 950 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
2111  04df 4b00          	push	#0
2112  04e1 4b10          	push	#16
2113  04e3 ae500a        	ldw	x,#20490
2114  04e6 cd0000        	call	_GPIO_Init
2116  04e9 85            	popw	x
2117                     ; 951 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
2119  04ea 4b00          	push	#0
2120  04ec 4b08          	push	#8
2121  04ee ae500f        	ldw	x,#20495
2122  04f1 cd0000        	call	_GPIO_Init
2124  04f4 85            	popw	x
2125                     ; 953 }
2128  04f5 81            	ret	
2164                     ; 985 void TIM2_Config(uint8_t Edge)
2164                     ; 986 {
2165                     	switch	.text
2166  04f6               _TIM2_Config:
2170                     ; 988 	if ( Edge == 0 )
2172  04f6 4d            	tnz	a
2173  04f7 2609          	jrne	L306
2174                     ; 989 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
2174                     ; 990                TIM2_ICPSC_DIV8, 0xf);		//  16MHz /8 = 2MHz
2176  04f9 4b0f          	push	#15
2177  04fb 4b0c          	push	#12
2178  04fd 4b01          	push	#1
2179  04ff 5f            	clrw	x
2182  0500 2009          	jra	L506
2183  0502               L306:
2184                     ; 992 		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
2184                     ; 993                TIM2_ICPSC_DIV8, 0xf);
2186  0502 4b0f          	push	#15
2187  0504 4b0c          	push	#12
2188  0506 4b01          	push	#1
2189  0508 ae0044        	ldw	x,#68
2191  050b               L506:
2192  050b cd0000        	call	_TIM2_ICInit
2193  050e 5b03          	addw	sp,#3
2194                     ; 996   TIM2_Cmd(ENABLE);
2196  0510 a601          	ld	a,#1
2198                     ; 1002 }
2201  0512 cc0000        	jp	_TIM2_Cmd
2228                     ; 1006 void Timer4_Config(void)
2228                     ; 1007 {
2229                     	switch	.text
2230  0515               L5_Timer4_Config:
2234                     ; 1008   TIM4_DeInit();
2236  0515 cd0000        	call	_TIM4_DeInit
2238                     ; 1014 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
2240  0518 ae0432        	ldw	x,#1074
2241  051b cd0000        	call	_TIM4_TimeBaseInit
2243                     ; 1017   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2245  051e ae0101        	ldw	x,#257
2246  0521 cd0000        	call	_TIM4_ITConfig
2248                     ; 1020   TIM4_Cmd(ENABLE);
2250  0524 a601          	ld	a,#1
2252                     ; 1021 }
2255  0526 cc0000        	jp	_TIM4_Cmd
2283                     ; 1024 static void Adc_Config( void )
2283                     ; 1025 {
2284                     	switch	.text
2285  0529               L3_Adc_Config:
2289                     ; 1027 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
2291  0529 cd0000        	call	_ADC1_GetConversionValue
2293  052c b609          	ld	a,_Adc+6
2294  052e 905f          	clrw	y
2295  0530 9097          	ld	yl,a
2296  0532 9058          	sllw	y
2297  0534 90ef03        	ldw	(_Adc,y),x
2298                     ; 1028 	ADC1_DeInit();
2300  0537 cd0000        	call	_ADC1_DeInit
2302                     ; 1030 	switch (Adc.Idx)
2304  053a b609          	ld	a,_Adc+6
2306                     ; 1052 			break;
2307  053c 2708          	jreq	L716
2308  053e 4a            	dec	a
2309  053f 271f          	jreq	L126
2310  0541 4a            	dec	a
2311  0542 2736          	jreq	L326
2312                     ; 1050 		default:
2312                     ; 1051 			Adc.Idx = 0;
2313                     ; 1052 			break;
2315  0544 2048          	jp	LC014
2316  0546               L716:
2317                     ; 1032 		case 0:
2317                     ; 1033 		  
2317                     ; 1034 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
2317                     ; 1035 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
2319  0546 4b00          	push	#0
2320  0548 4b03          	push	#3
2321  054a 4b08          	push	#8
2322  054c 4b00          	push	#0
2323  054e 4b00          	push	#0
2324  0550 4b00          	push	#0
2325  0552 ae0003        	ldw	x,#3
2326  0555 cd0000        	call	_ADC1_Init
2328  0558 5b06          	addw	sp,#6
2329                     ; 1036 			Adc.Idx = 1;
2331  055a 35010009      	mov	_Adc+6,#1
2332                     ; 1037 			break;
2334  055e 2030          	jra	L146
2335  0560               L126:
2336                     ; 1038 		case 1:
2336                     ; 1039 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
2336                     ; 1040 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
2338  0560 4b00          	push	#0
2339  0562 4b04          	push	#4
2340  0564 4b08          	push	#8
2341  0566 4b00          	push	#0
2342  0568 4b00          	push	#0
2343  056a 4b00          	push	#0
2344  056c ae0004        	ldw	x,#4
2345  056f cd0000        	call	_ADC1_Init
2347  0572 5b06          	addw	sp,#6
2348                     ; 1041 			Adc.Idx = 2;
2350  0574 35020009      	mov	_Adc+6,#2
2351                     ; 1042 			break;
2353  0578 2016          	jra	L146
2354  057a               L326:
2355                     ; 1044 		case 2:
2355                     ; 1045 			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
2355                     ; 1046 								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
2357  057a 4b00          	push	#0
2358  057c 4b02          	push	#2
2359  057e 4b08          	push	#8
2360  0580 4b00          	push	#0
2361  0582 4b00          	push	#0
2362  0584 4b00          	push	#0
2363  0586 ae0002        	ldw	x,#2
2364  0589 cd0000        	call	_ADC1_Init
2366  058c 5b06          	addw	sp,#6
2367                     ; 1047 			Adc.Idx = 0;
2369  058e               LC014:
2371  058e 3f09          	clr	_Adc+6
2372                     ; 1048 			break;
2374  0590               L146:
2375                     ; 1055 		ADC1_StartConversion();		
2378                     ; 1056 }
2381  0590 cc0000        	jp	_ADC1_StartConversion
2425                     ; 1071 void assert_failed(u8* file, u32 line)
2425                     ; 1072 {
2426                     	switch	.text
2427  0593               _assert_failed:
2429  0593 88            	push	a
2430       00000001      OFST:	set	1
2433  0594               L566:
2434                     ; 1081 	i = i++;
2436  0594 0c01          	inc	(OFST+0,sp)
2438  0596 6b01          	ld	(OFST+0,sp),a
2441  0598 20fa          	jra	L566
2886                     	xdef	_MotorClose
2887                     	xdef	_MotorStep
2888                     	xdef	_OnTimer_1mS
2889                     	switch	.ubsct
2890  0000               _pos2:
2891  0000 00            	ds.b	1
2892                     	xdef	_pos2
2893  0001               _pos:
2894  0001 0000          	ds.b	2
2895                     	xdef	_pos
2896                     	xdef	_OnTimer_1S
2897                     	xdef	_main
2898                     	xdef	_TIM2_Config
2899                     	xdef	_Gpio_Config
2900                     	xdef	_Clock_Config
2901                     	xdef	_OnCaptureOVTim2
2902                     	xdef	_OnCaptureTim2
2903                     	xdef	_OnTimer4
2904                     	xdef	_StopDrive
2905                     	xdef	_Interval
2906                     	xdef	_StartDriveOR
2907                     	xdef	_DriveService
2908                     	xdef	_Excitation_2Phase
2909                     	xdef	_Excitation_12Phase
2910                     	xdef	_Excitation_1Phase
2911                     	xdef	_ExOff
2912                     	xdef	_CPulse
2913                     	xdef	_CStep
2914                     	xdef	_PowerDelay_1mS
2915  0003               _Adc:
2916  0003 000000000000  	ds.b	7
2917                     	xdef	_Adc
2918  000a               _My:
2919  000a 000000000000  	ds.b	12
2920                     	xdef	_My
2921  0016               _Drive:
2922  0016 000000000000  	ds.b	41
2923                     	xdef	_Drive
2924                     	xdef	_TableInterval
2925  003f               _Ticks_S:
2926  003f 00000000      	ds.b	4
2927                     	xdef	_Ticks_S
2928  0043               _Ticks2_1mS:
2929  0043 0000          	ds.b	2
2930                     	xdef	_Ticks2_1mS
2931  0045               _Ticks_1mS:
2932  0045 0000          	ds.b	2
2933                     	xdef	_Ticks_1mS
2934  0047               _Ticks_50uS:
2935  0047 00000000      	ds.b	4
2936                     	xdef	_Ticks_50uS
2937                     	xdef	_PeriodNumber
2938  004b               _Counter:
2939  004b 0000          	ds.b	2
2940                     	xdef	_Counter
2941                     	xdef	_assert_failed
2942                     	xref	_TIM4_ITConfig
2943                     	xref	_TIM4_Cmd
2944                     	xref	_TIM4_TimeBaseInit
2945                     	xref	_TIM4_DeInit
2946                     	xref	_TIM2_GetITStatus
2947                     	xref	_TIM2_ClearFlag
2948                     	xref	_TIM2_GetCapture1
2949                     	xref	_TIM2_SetCounter
2950                     	xref	_TIM2_ITConfig
2951                     	xref	_TIM2_Cmd
2952                     	xref	_TIM2_ICInit
2953                     	xref	_TIM2_TimeBaseInit
2954                     	xref	_TIM2_DeInit
2955                     	xref	_GPIO_ReadInputPin
2956                     	xref	_GPIO_WriteReverse
2957                     	xref	_GPIO_WriteLow
2958                     	xref	_GPIO_WriteHigh
2959                     	xref	_GPIO_Init
2960                     	xref	_CLK_SYSCLKConfig
2961                     	xref	_CLK_HSIPrescalerConfig
2962                     	xref	_CLK_LSICmd
2963                     	xref	_CLK_HSICmd
2964                     	xref	_CLK_HSECmd
2965                     	xref	_CLK_DeInit
2966                     	xref	_ADC1_GetConversionValue
2967                     	xref	_ADC1_StartConversion
2968                     	xref	_ADC1_Init
2969                     	xref	_ADC1_DeInit
2970                     	xref.b	c_lreg
2971                     	xref.b	c_x
2972                     	xref.b	c_y
2992                     	xref	c_cmulx
2993                     	xref	c_ladc
2994                     	xref	c_ludv
2995                     	xref	c_rtol
2996                     	xref	c_uitolx
2997                     	xref	c_umul
2998                     	xref	c_lgadc
2999                     	xref	c_lcmp
3000                     	xref	c_ltor
3001                     	end
