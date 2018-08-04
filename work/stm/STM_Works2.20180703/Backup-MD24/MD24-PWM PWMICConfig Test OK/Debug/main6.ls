   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  21                     	bsct
  22  0000               _ledint:
  23  0000 01f4          	dc.w	500
  24  0002               _IO_LED:
  25  0002 5005          	dc.w	20485
  26  0004 10            	dc.b	16
  27  0005               _IO_ORG:
  28  0005 5000          	dc.w	20480
  29  0007 02            	dc.b	2
  30  0008               _IO_X1:
  31  0008 5000          	dc.w	20480
  32  000a 08            	dc.b	8
  33  000b               _IO_X2:
  34  000b 500f          	dc.w	20495
  35  000d 40            	dc.b	64
  36  000e               _IO_Y1:
  37  000e 500a          	dc.w	20490
  38  0010 20            	dc.b	32
  39  0011               _IO_Y2:
  40  0011 5000          	dc.w	20480
  41  0013 04            	dc.b	4
  42  0014               _IO_ADJ:
  43  0014 500a          	dc.w	20490
  44  0016 10            	dc.b	16
  45  0017               _IO_SEN:
  46  0017 500f          	dc.w	20495
  47  0019 04            	dc.b	4
  48  001a               _IO_POWER:
  49  001a 500f          	dc.w	20495
  50  001c 20            	dc.b	32
  51  001d               _IO_MOD:
  52  001d 500f          	dc.w	20495
  53  001f 10            	dc.b	16
  54  0020               _IO_BAT:
  55  0020 500f          	dc.w	20495
  56  0022 08            	dc.b	8
  57  0023               _IO_BOOST:
  58  0023 500f          	dc.w	20495
  59  0025 40            	dc.b	64
  60  0026               _IO_CHARGE:
  61  0026 5000          	dc.w	20480
  62  0028 08            	dc.b	8
 109                     ; 238 void	phase_excite(uint8_t phase)
 109                     ; 239 {
 111                     .text:	section	.text,new
 112  0000               _phase_excite:
 114  0000 88            	push	a
 115       00000000      OFST:	set	0
 118                     ; 240 	if ( !Drive.Run || !Drive.Enabled ) return;
 120  0001 b666          	ld	a,_Drive+1
 121  0003 2705          	jreq	L15
 123  0005 7200006502    	btjt	_Drive,#0,L74
 124  000a               L15:
 128  000a 84            	pop	a
 129  000b 81            	ret	
 130  000c               L74:
 131                     ; 241 	switch(phase)
 133  000c 7b01          	ld	a,(OFST+1,sp)
 135                     ; 263 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
 136  000e 271b          	jreq	L3
 137  0010 4a            	dec	a
 138  0011 2722          	jreq	L5
 139  0013 4a            	dec	a
 140  0014 2732          	jreq	L7
 141  0016 4a            	dec	a
 142  0017 2745          	jreq	L11
 143  0019 4a            	dec	a
 144  001a 274e          	jreq	L31
 145  001c 4a            	dec	a
 146  001d 2757          	jreq	L51
 147  001f 4a            	dec	a
 148  0020 2779          	jreq	L71
 149  0022 4a            	dec	a
 150  0023 2603cc00a5    	jreq	L12
 151  0028 cc00c9        	jra	L55
 152  002b               L3:
 153                     ; 256 		case 0: _H_X1 _L_X2 _H_Y1 _L_Y2 break;
 155  002b 3b000a        	push	_IO_X1+2
 156  002e be08          	ldw	x,_IO_X1
 157  0030 cd0000        	call	_GPIO_WriteHigh
 167  0033 2008          	jp	LC005
 168  0035               L5:
 169                     ; 257 		case 1: _L_X1 _L_X2 _H_Y1 _L_Y2 break;		
 171  0035 3b000a        	push	_IO_X1+2
 172  0038 be08          	ldw	x,_IO_X1
 173  003a cd0000        	call	_GPIO_WriteLow
 177  003d               LC005:
 178  003d 84            	pop	a
 180  003e 3b000d        	push	_IO_X2+2
 181  0041 be0b          	ldw	x,_IO_X2
 182  0043 cd0000        	call	_GPIO_WriteLow
 190  0046 200b          	jp	LC004
 191  0048               L7:
 192                     ; 258 		case 2: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
 194  0048 cd00cb        	call	LC008
 197  004b 3b000d        	push	_IO_X2+2
 198  004e be0b          	ldw	x,_IO_X2
 199  0050 cd0000        	call	_GPIO_WriteHigh
 203  0053               LC004:
 204  0053 84            	pop	a
 207  0054 3b0010        	push	_IO_Y1+2
 208  0057 be0e          	ldw	x,_IO_Y1
 209  0059 cd0000        	call	_GPIO_WriteHigh
 215  005c 2061          	jp	LC002
 216  005e               L11:
 217                     ; 259 		case 3: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
 219  005e ad6b          	call	LC008
 222  0060 3b000d        	push	_IO_X2+2
 223  0063 be0b          	ldw	x,_IO_X2
 224  0065 cd0000        	call	_GPIO_WriteHigh
 232  0068 204c          	jp	LC003
 233  006a               L31:
 234                     ; 260 		case 4: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
 236  006a ad5f          	call	LC008
 239  006c 3b000d        	push	_IO_X2+2
 240  006f be0b          	ldw	x,_IO_X2
 241  0071 cd0000        	call	_GPIO_WriteHigh
 249  0074 2011          	jp	LC006
 250  0076               L51:
 251                     ; 261 		case 5: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
 253  0076 3b000a        	push	_IO_X1+2
 254  0079 be08          	ldw	x,_IO_X1
 255  007b cd0000        	call	_GPIO_WriteLow
 259  007e               LC007:
 260  007e 84            	pop	a
 262  007f 3b000d        	push	_IO_X2+2
 263  0082 be0b          	ldw	x,_IO_X2
 264  0084 cd0000        	call	_GPIO_WriteLow
 271  0087               LC006:
 272  0087 84            	pop	a
 275  0088 3b0010        	push	_IO_Y1+2
 276  008b be0e          	ldw	x,_IO_Y1
 277  008d cd0000        	call	_GPIO_WriteLow
 278  0090 84            	pop	a
 281  0091 3b0013        	push	_IO_Y2+2
 282  0094 be11          	ldw	x,_IO_Y2
 283  0096 cd0000        	call	_GPIO_WriteHigh
 287  0099 202d          	jp	LC001
 288  009b               L71:
 289                     ; 262 		case 6: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
 291  009b 3b000a        	push	_IO_X1+2
 292  009e be08          	ldw	x,_IO_X1
 293  00a0 cd0000        	call	_GPIO_WriteHigh
 303  00a3 20d9          	jp	LC007
 304  00a5               L12:
 305                     ; 263 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
 307  00a5 3b000a        	push	_IO_X1+2
 308  00a8 be08          	ldw	x,_IO_X1
 309  00aa cd0000        	call	_GPIO_WriteHigh
 311  00ad 84            	pop	a
 314  00ae 3b000d        	push	_IO_X2+2
 315  00b1 be0b          	ldw	x,_IO_X2
 316  00b3 cd0000        	call	_GPIO_WriteLow
 320  00b6               LC003:
 321  00b6 84            	pop	a
 323  00b7 3b0010        	push	_IO_Y1+2
 324  00ba be0e          	ldw	x,_IO_Y1
 325  00bc cd0000        	call	_GPIO_WriteLow
 329  00bf               LC002:
 330  00bf 84            	pop	a
 335  00c0 3b0013        	push	_IO_Y2+2
 336  00c3 be11          	ldw	x,_IO_Y2
 337  00c5 cd0000        	call	_GPIO_WriteLow
 339  00c8               LC001:
 340  00c8 84            	pop	a
 343  00c9               L55:
 344                     ; 266 }
 347  00c9 84            	pop	a
 348  00ca 81            	ret	
 349  00cb               LC008:
 350  00cb 3b000a        	push	_IO_X1+2
 351  00ce be08          	ldw	x,_IO_X1
 352  00d0 cd0000        	call	_GPIO_WriteLow
 354  00d3 84            	pop	a
 355  00d4 81            	ret	
 389                     ; 268 uint16_t CPulse( uint8_t step )
 389                     ; 269 {
 390                     .text:	section	.text,new
 391  0000               _CPulse:
 395                     ; 270 	return (uint16_t)step * 26;  // 20180509  change to 5200 pulse
 397  0000 5f            	clrw	x
 398  0001 97            	ld	xl,a
 399  0002 90ae001a      	ldw	y,#26
 403  0006 cc0000        	jp	c_imul
 456                     ; 273 uint8_t  Diff(uint16_t time, uint16_t diff)				
 456                     ; 274 {
 457                     .text:	section	.text,new
 458  0000               _Diff:
 460  0000 89            	pushw	x
 461  0001 89            	pushw	x
 462       00000002      OFST:	set	2
 465                     ; 275 	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
 467  0002 b37c          	cpw	x,_Ticks_1mS
 468  0004 2207          	jrugt	L211
 469  0006 be7c          	ldw	x,_Ticks_1mS
 470  0008 72f003        	subw	x,(OFST+1,sp)
 471  000b 200a          	jra	L411
 472  000d               L211:
 473  000d aeffff        	ldw	x,#65535
 474  0010 72f003        	subw	x,(OFST+1,sp)
 475  0013 72bb007c      	addw	x,_Ticks_1mS
 476  0017               L411:
 477  0017 1f01          	ldw	(OFST-1,sp),x
 479                     ; 276 	return _t > diff ? 1 : 0;
 481  0019 1307          	cpw	x,(OFST+5,sp)
 482  001b 2304          	jrule	L611
 483  001d a601          	ld	a,#1
 484  001f 2001          	jra	L021
 485  0021               L611:
 486  0021 4f            	clr	a
 487  0022               L021:
 490  0022 5b04          	addw	sp,#4
 491  0024 81            	ret	
 527                     ; 279 uint16_t	stepPrepare(uint8_t i)
 527                     ; 280 {
 528                     .text:	section	.text,new
 529  0000               _stepPrepare:
 531  0000 88            	push	a
 532       00000000      OFST:	set	0
 535                     ; 281 	dutyInfo.s -= dutyInfo.b[i];
 537  0001 5f            	clrw	x
 538  0002 97            	ld	xl,a
 539  0003 e67f          	ld	a,(_dutyInfo,x)
 540  0005 5f            	clrw	x
 541  0006 97            	ld	xl,a
 542  0007 72b000a9      	subw	x,_dutyInfo+42
 543  000b 50            	negw	x
 544  000c bfa9          	ldw	_dutyInfo+42,x
 545                     ; 282 	dutyInfo.b[i] = Pwm.Duty;
 547  000e 5f            	clrw	x
 548  000f 7b01          	ld	a,(OFST+1,sp)
 549  0011 97            	ld	xl,a
 550  0012 b65d          	ld	a,_Pwm+8
 551  0014 e77f          	ld	(_dutyInfo,x),a
 552                     ; 283 	dutyInfo.s += dutyInfo.b[i];
 554  0016 5f            	clrw	x
 555  0017 7b01          	ld	a,(OFST+1,sp)
 556  0019 97            	ld	xl,a
 557  001a e67f          	ld	a,(_dutyInfo,x)
 558  001c bbaa          	add	a,_dutyInfo+43
 559  001e b7aa          	ld	_dutyInfo+43,a
 560  0020 2402          	jrnc	L421
 561  0022 3ca9          	inc	_dutyInfo+42
 562  0024               L421:
 563                     ; 284 	return dutyInfo.s;
 565  0024 bea9          	ldw	x,_dutyInfo+42
 568  0026 84            	pop	a
 569  0027 81            	ret	
 614                     ; 287 uint8_t	stepCalc(uint16_t duty)
 614                     ; 288 {
 615                     .text:	section	.text,new
 616  0000               _stepCalc:
 618  0000 89            	pushw	x
 619  0001 89            	pushw	x
 620       00000002      OFST:	set	2
 623                     ; 290 	if ( dutyInfo.n < 16 )
 625  0002 b6a8          	ld	a,_dutyInfo+41
 626  0004 a110          	cp	a,#16
 627  0006 2404          	jruge	L361
 628                     ; 291 		dutyInfo.n ++;
 630  0008 3ca8          	inc	_dutyInfo+41
 631  000a b6a8          	ld	a,_dutyInfo+41
 632  000c               L361:
 633                     ; 292 	t = (duty / dutyInfo.n) * 2 + 1;	
 635  000c 62            	div	x,a
 636  000d 58            	sllw	x
 637  000e 5c            	incw	x
 638  000f 1f01          	ldw	(OFST-1,sp),x
 640                     ; 293 	t /= 2;
 642  0011 0401          	srl	(OFST-1,sp)
 643  0013 0602          	rrc	(OFST+0,sp)
 645                     ; 294 	if( t < 20 )	t = 20;
 647  0015 1e01          	ldw	x,(OFST-1,sp)
 648  0017 a30014        	cpw	x,#20
 649  001a 2403          	jruge	L561
 652  001c ae0014        	ldw	x,#20
 654  001f               L561:
 655                     ; 295 	if( t > 180 )	t = 180;
 657  001f a300b5        	cpw	x,#181
 658  0022 2503          	jrult	L761
 661  0024 ae00b4        	ldw	x,#180
 663  0027               L761:
 664                     ; 297 	t = (625 * t)/10 -1250;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
 666  0027 90ae0271      	ldw	y,#625
 667  002b cd0000        	call	c_imul
 669  002e a60a          	ld	a,#10
 670  0030 62            	div	x,a
 671  0031 1d04e2        	subw	x,#1250
 673                     ; 298 	t = (t / 25 + 1 ) /	2;
 675  0034 a619          	ld	a,#25
 676  0036 62            	div	x,a
 677  0037 5c            	incw	x
 678  0038 54            	srlw	x
 679  0039 1f01          	ldw	(OFST-1,sp),x
 681                     ; 300 	Drive.PreStep = Drive.Step;
 683  003b 457879        	mov	_Drive+20,_Drive+19
 684                     ; 301 	return (uint8_t)t;
 686  003e 7b02          	ld	a,(OFST+0,sp)
 689  0040 5b04          	addw	sp,#4
 690  0042 81            	ret	
 717                     ; 304 void	waitPowerDelay(void)
 717                     ; 305 {
 718                     .text:	section	.text,new
 719  0000               _waitPowerDelay:
 723                     ; 306 	LightOn
 725  0000 3b0004        	push	_IO_LED+2
 726  0003 be02          	ldw	x,_IO_LED
 727  0005 cd0000        	call	_GPIO_WriteLow
 729  0008 84            	pop	a
 731  0009               L302:
 732                     ; 307 	while( Ticks_1mS < TIME_POWERDELAY );
 734  0009 be7c          	ldw	x,_Ticks_1mS
 735  000b a301f3        	cpw	x,#499
 736  000e 25f9          	jrult	L302
 737                     ; 308 	LightOff
 739  0010 3b0004        	push	_IO_LED+2
 740  0013 be02          	ldw	x,_IO_LED
 741  0015 cd0000        	call	_GPIO_WriteHigh
 743  0018 84            	pop	a
 744                     ; 310 }
 747  0019 81            	ret	
 793                     ; 312 void StartDriveOR( uint16_t tPos, uint8_t overrun )
 793                     ; 313 {
 794                     .text:	section	.text,new
 795  0000               _StartDriveOR:
 797  0000 89            	pushw	x
 798       00000000      OFST:	set	0
 801                     ; 315 	motorWatch.step[motorWatch.i] = tPos;
 803  0001 b620          	ld	a,_motorWatch+32
 804  0003 905f          	clrw	y
 805  0005 9097          	ld	yl,a
 806  0007 9058          	sllw	y
 807  0009 90ef00        	ldw	(_motorWatch,y),x
 808                     ; 316 	motorWatch.i = (motorWatch.i + 1) % MAX_MOTORWATCH;
 810  000c 5f            	clrw	x
 811  000d 97            	ld	xl,a
 812  000e 5c            	incw	x
 813  000f a610          	ld	a,#16
 814  0011 cd0000        	call	c_smodx
 816  0014 01            	rrwa	x,a
 817  0015 b720          	ld	_motorWatch+32,a
 818                     ; 317 	motorWatch.step[motorWatch.i] = 0;
 820  0017 5f            	clrw	x
 821  0018 97            	ld	xl,a
 822  0019 58            	sllw	x
 823  001a 905f          	clrw	y
 824  001c ef00          	ldw	(_motorWatch,x),y
 825                     ; 320 	if ( Drive.Run || (Drive.Position==tPos) ) return;
 827  001e b666          	ld	a,_Drive+1
 828  0020 2653          	jrne	L441
 830  0022 be67          	ldw	x,_Drive+2
 831  0024 1301          	cpw	x,(OFST+1,sp)
 834  0026 274d          	jreq	L441
 835                     ; 321 	if ( tPos == 0 )				//  goto origin
 837  0028 1e01          	ldw	x,(OFST+1,sp)
 838  002a 261a          	jrne	L532
 839                     ; 323 		Drive.ZeroOffset = CPulse( OVER_STEP );
 841  002c a61e          	ld	a,#30
 842  002e cd0000        	call	_CPulse
 844  0031 bf6e          	ldw	_Drive+9,x
 845                     ; 324 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
 847  0033 be67          	ldw	x,_Drive+2
 848  0035 72bb006e      	addw	x,_Drive+9
 849  0039 bf67          	ldw	_Drive+2,x
 850                     ; 325 		Drive.Overrun =	Drive.Target = 0;
 852  003b 5f            	clrw	x
 853  003c bf69          	ldw	_Drive+4,x
 854  003e bf6b          	ldw	_Drive+6,x
 855                     ; 326 		Drive.Dir = nMotorClose;
 857  0040 72170065      	bres	_Drive,#3
 859  0044 2028          	jra	L732
 860  0046               L532:
 861                     ; 330 		if (Drive.Position >= tPos)	// Closing
 863  0046 be67          	ldw	x,_Drive+2
 864  0048 1301          	cpw	x,(OFST+1,sp)
 865  004a 250b          	jrult	L142
 866                     ; 332 			Drive.Overrun =	Drive.Overrun2 = 0;
 868  004c 3f6d          	clr	_Drive+8
 869  004e 5f            	clrw	x
 870  004f bf6b          	ldw	_Drive+6,x
 871                     ; 333 			Drive.Dir = nMotorClose;
 873  0051 72170065      	bres	_Drive,#3
 875  0055 2008          	jra	L342
 876  0057               L142:
 877                     ; 337 			Drive.Overrun2 = overrun;
 879  0057 7b05          	ld	a,(OFST+5,sp)
 880  0059 b76d          	ld	_Drive+8,a
 881                     ; 338 			Drive.Dir = nMotorOpen;
 883  005b 72160065      	bset	_Drive,#3
 884  005f               L342:
 885                     ; 340 		Drive.Target = tPos + Drive.Overrun2;
 887  005f 7b01          	ld	a,(OFST+1,sp)
 888  0061 97            	ld	xl,a
 889  0062 7b02          	ld	a,(OFST+2,sp)
 890  0064 bb6d          	add	a,_Drive+8
 891  0066 2401          	jrnc	L241
 892  0068 5c            	incw	x
 893  0069               L241:
 894  0069 b76a          	ld	_Drive+5,a
 895  006b 9f            	ld	a,xl
 896  006c b769          	ld	_Drive+4,a
 897  006e               L732:
 898                     ; 342 	Drive.Run = TRUE;
 900  006e 35010066      	mov	_Drive+1,#1
 901                     ; 343 	Drive.Ticks = Drive.Interval;
 903  0072 457576        	mov	_Drive+17,_Drive+16
 904                     ; 344 }
 905  0075               L441:
 908  0075 85            	popw	x
 909  0076 81            	ret	
 934                     ; 346 uint8_t	ZeroPos(void)
 934                     ; 347 {
 935                     .text:	section	.text,new
 936  0000               _ZeroPos:
 940                     ; 348 	if( Drive.Run != 0 ) return 0;
 942  0000 b666          	ld	a,_Drive+1
 943  0002 2702          	jreq	L552
 946  0004 4f            	clr	a
 949  0005 81            	ret	
 950  0006               L552:
 951                     ; 349 	if( Drive.Origin == 1 ) return 1;
 953  0006 720b006502    	btjf	_Drive,#5,L752
 956  000b 4c            	inc	a
 959  000c 81            	ret	
 960  000d               L752:
 961                     ; 350 	StartDriveOR(0, OFFSET_OVERRUN);	// Goto Zero position
 963  000d 4b00          	push	#0
 964  000f 5f            	clrw	x
 965  0010 cd0000        	call	_StartDriveOR
 967  0013 84            	pop	a
 968                     ; 351 	return 0;
 970  0014 4f            	clr	a
 973  0015 81            	ret	
1012                     ; 354 void	LightControl(uint16_t t)
1012                     ; 355 {
1013                     .text:	section	.text,new
1014  0000               _LightControl:
1016  0000 89            	pushw	x
1017       00000000      OFST:	set	0
1020                     ; 356 	if ( Diff (Timer.Led, ledint) == 0 )
1022  0001 be00          	ldw	x,_ledint
1023  0003 89            	pushw	x
1024  0004 be21          	ldw	x,_Timer
1025  0006 cd0000        	call	_Diff
1027  0009 4d            	tnz	a
1028  000a 85            	popw	x
1029  000b 270d          	jreq	L061
1030                     ; 357 		return;
1032                     ; 358 	Timer.Led = t;
1034  000d 1e01          	ldw	x,(OFST+1,sp)
1035  000f bf21          	ldw	_Timer,x
1036                     ; 359 	LightToggle
1038  0011 be02          	ldw	x,_IO_LED
1039  0013 3b0004        	push	_IO_LED+2
1040  0016 cd0000        	call	_GPIO_WriteReverse
1042  0019 84            	pop	a
1043                     ; 361 }
1044  001a               L061:
1047  001a 85            	popw	x
1048  001b 81            	ret	
1084                     ; 363 void MotorService(uint8_t step)
1084                     ; 364 {
1085                     .text:	section	.text,new
1086  0000               _MotorService:
1088  0000 88            	push	a
1089       00000000      OFST:	set	0
1092                     ; 365 	if ( step > 205 ) step = 205;
1094  0001 a1ce          	cp	a,#206
1095  0003 2504          	jrult	L713
1098  0005 a6cd          	ld	a,#205
1099  0007 6b01          	ld	(OFST+1,sp),a
1100  0009               L713:
1101                     ; 366 	if ( step < 20 ) step = 0;
1103  0009 7b01          	ld	a,(OFST+1,sp)
1104  000b a114          	cp	a,#20
1105  000d 2402          	jruge	L123
1108  000f 0f01          	clr	(OFST+1,sp)
1109  0011               L123:
1110                     ; 367 	StartDriveOR( CPulse(step), OFFSET_OVERRUN );
1112  0011 4b00          	push	#0
1113  0013 7b02          	ld	a,(OFST+2,sp)
1114  0015 cd0000        	call	_CPulse
1116  0018 cd0000        	call	_StartDriveOR
1118  001b 84            	pop	a
1119                     ; 369 }
1122  001c 84            	pop	a
1123  001d 81            	ret	
1152                     ; 371 void StopDrive(void)
1152                     ; 372 {
1153                     .text:	section	.text,new
1154  0000               _StopDrive:
1158                     ; 373 	_L_X1 _L_X2 _L_Y1 _L_Y2
1160  0000 3b000a        	push	_IO_X1+2
1161  0003 be08          	ldw	x,_IO_X1
1162  0005 cd0000        	call	_GPIO_WriteLow
1164  0008 84            	pop	a
1167  0009 3b000d        	push	_IO_X2+2
1168  000c be0b          	ldw	x,_IO_X2
1169  000e cd0000        	call	_GPIO_WriteLow
1171  0011 84            	pop	a
1174  0012 3b0010        	push	_IO_Y1+2
1175  0015 be0e          	ldw	x,_IO_Y1
1176  0017 cd0000        	call	_GPIO_WriteLow
1178  001a 84            	pop	a
1181  001b 3b0013        	push	_IO_Y2+2
1182  001e be11          	ldw	x,_IO_Y2
1183  0020 cd0000        	call	_GPIO_WriteLow
1185  0023 3f66          	clr	_Drive+1
1186  0025 84            	pop	a
1187                     ; 374 	Drive.Run = FALSE;
1189                     ; 375 }
1192  0026 81            	ret	
1219                     ; 379 void DriveService(void)
1219                     ; 380 {
1220                     .text:	section	.text,new
1221  0000               _DriveService:
1223  0000 89            	pushw	x
1224       00000002      OFST:	set	2
1227                     ; 381 	if ( !Drive.Run ) 
1229  0001 b666          	ld	a,_Drive+1
1230                     ; 383 		StopDrive();
1232                     ; 384 		return;
1234  0003 2732          	jreq	LC009
1235                     ; 386 	if ( Drive.Target > Drive.Position )
1237  0005 be69          	ldw	x,_Drive+4
1238  0007 b367          	cpw	x,_Drive+2
1239  0009 2307          	jrule	L543
1240                     ; 388 	 	MotorStep(nMotorOpen);
1242  000b a601          	ld	a,#1
1243  000d cd0000        	call	_MotorStep
1245                     ; 389 		return;
1246  0010               L412:
1249  0010 85            	popw	x
1250  0011 81            	ret	
1251  0012               L543:
1252                     ; 391 	if ( Drive.Target < Drive.Position )
1254  0012 b367          	cpw	x,_Drive+2
1255  0014 2405          	jruge	L743
1256                     ; 393 		MotorClose();
1258  0016 cd0000        	call	_MotorClose
1260                     ; 394 		return;
1262  0019 20f5          	jra	L412
1263  001b               L743:
1264                     ; 396 	if ( Drive.Target ) 	// on target position
1266  001b be69          	ldw	x,_Drive+4
1267  001d 2713          	jreq	L153
1268                     ; 398 		if ( Drive.Overrun2 )
1270  001f b66d          	ld	a,_Drive+8
1271  0021 270f          	jreq	L153
1272                     ; 400 			Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1274  0023 5f            	clrw	x
1275  0024 97            	ld	xl,a
1276  0025 1f01          	ldw	(OFST-1,sp),x
1278  0027 be69          	ldw	x,_Drive+4
1279  0029 72f001        	subw	x,(OFST-1,sp)
1280  002c bf69          	ldw	_Drive+4,x
1281                     ; 401 			Drive.Overrun2 = 0;
1283  002e 3f6d          	clr	_Drive+8
1284                     ; 402 			return;
1286  0030 20de          	jra	L412
1287  0032               L153:
1288                     ; 405 	Drive.ZeroOffset = Drive.Overrun = 0;
1290  0032 5f            	clrw	x
1291  0033 bf6b          	ldw	_Drive+6,x
1292  0035 bf6e          	ldw	_Drive+9,x
1293                     ; 406 	StopDrive();	
1295  0037               LC009:
1297  0037 cd0000        	call	_StopDrive
1299                     ; 407 }
1301  003a 20d4          	jra	L412
1345                     ; 409 void	MotorStepPhase(uint8_t dir)
1345                     ; 410 {
1346                     .text:	section	.text,new
1347  0000               _MotorStepPhase:
1349  0000 88            	push	a
1350       00000001      OFST:	set	1
1353                     ; 411 	uint8_t offset = 0;
1355                     ; 412 	if( dir == 1 )
1357  0001 4a            	dec	a
1358  0002 2611          	jrne	L773
1359                     ; 414 		Drive.Position--;
1361  0004 be67          	ldw	x,_Drive+2
1362  0006 5a            	decw	x
1363  0007 bf67          	ldw	_Drive+2,x
1364                     ; 415 		offset = Drive.NormalOpen ? 1 : -1;
1366  0009 7209006503    	btjf	_Drive,#4,L022
1367  000e 4c            	inc	a
1368  000f 2014          	jra	L622
1369  0011               L022:
1370  0011 a6ff          	ld	a,#255
1372  0013 2010          	jra	L622
1373  0015               L773:
1374                     ; 419 		Drive.Position++;
1376  0015 be67          	ldw	x,_Drive+2
1377  0017 5c            	incw	x
1378  0018 bf67          	ldw	_Drive+2,x
1379                     ; 420 		offset = Drive.NormalOpen ? -1 : 1;
1381  001a 7209006504    	btjf	_Drive,#4,L422
1382  001f a6ff          	ld	a,#255
1383  0021 2002          	jra	L622
1384  0023               L422:
1385  0023 a601          	ld	a,#1
1386  0025               L622:
1388                     ; 422 	Drive.Phase += offset;
1390  0025 bb70          	add	a,_Drive+11
1391  0027 b770          	ld	_Drive+11,a
1392                     ; 423 }
1395  0029 84            	pop	a
1396  002a 81            	ret	
1421                     ; 425 void	MotorStepSetOverrun(void)
1421                     ; 426 {
1422                     .text:	section	.text,new
1423  0000               _MotorStepSetOverrun:
1427                     ; 427 	Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1429  0000 be73          	ldw	x,_Drive+14
1430  0002 1d0028        	subw	x,#40
1431                     ; 428 	if ( Drive.MaxOverrun > OVERRUN )
1433  0005 a3012d        	cpw	x,#301
1434  0008 2503          	jrult	L314
1435                     ; 429 		Drive.MaxOverrun = OVERRUN;				
1437  000a ae012c        	ldw	x,#300
1438  000d               L314:
1439  000d bf71          	ldw	_Drive+12,x
1440                     ; 430 }
1443  000f 81            	ret	
1503                     ; 432 void MotorStep(MOTOR_DIR Dir)
1503                     ; 433 {
1504                     .text:	section	.text,new
1505  0000               _MotorStep:
1509                     ; 434 	if( Dir == nMotorClose )
1511  0000 4d            	tnz	a
1512  0001 261a          	jrne	L344
1513                     ; 436 		if( Drive.Position != 0 ) 
1515  0003 be67          	ldw	x,_Drive+2
1516  0005 2704          	jreq	L544
1517                     ; 437 			MotorStepPhase(1);
1519  0007 4c            	inc	a
1520  0008 cd0000        	call	_MotorStepPhase
1522  000b               L544:
1523                     ; 439 		if( Drive.Position == 0 ) 
1525  000b be67          	ldw	x,_Drive+2
1526  000d 2629          	jrne	L154
1527                     ; 441 			Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0;
1529  000f 5f            	clrw	x
1530  0010 bf69          	ldw	_Drive+4,x
1531  0012 bf67          	ldw	_Drive+2,x
1532  0014 bf6e          	ldw	_Drive+9,x
1533  0016 bf6b          	ldw	_Drive+6,x
1534                     ; 442 			StopDrive();	
1536  0018 cd0000        	call	_StopDrive
1538  001b 201b          	jra	L154
1539  001d               L344:
1540                     ; 448 		MotorStepPhase(0);
1542  001d 4f            	clr	a
1543  001e cd0000        	call	_MotorStepPhase
1545                     ; 450 		if( Drive.Origin ) 
1547  0021 720b00650a    	btjf	_Drive,#5,L354
1548                     ; 452 			Drive.ORGPosition = Drive.Position;
1550  0026 be67          	ldw	x,_Drive+2
1551  0028 bf73          	ldw	_Drive+14,x
1552                     ; 453 			Drive.LastOrigin = TRUE;
1554  002a 72140065      	bset	_Drive,#2
1556  002e 2008          	jra	L154
1557  0030               L354:
1558                     ; 457 			if ( Drive.LastOrigin )
1560  0030 7205006503    	btjf	_Drive,#2,L154
1561                     ; 458 				MotorStepSetOverrun();
1563  0035 cd0000        	call	_MotorStepSetOverrun
1565  0038               L154:
1566                     ; 461 	phase_excite(Drive.Phase%8);
1568  0038 b670          	ld	a,_Drive+11
1569  003a a407          	and	a,#7
1571                     ; 462 }
1574  003c cc0000        	jp	_phase_excite
1600                     ; 464 void MotorClose(void)
1600                     ; 465 {
1601                     .text:	section	.text,new
1602  0000               _MotorClose:
1606                     ; 466 	if ( !Drive.Origin )   		// Hall IC Sensing 
1608  0000 720a006504    	btjt	_Drive,#5,L174
1609                     ; 468 		MotorStep(nMotorClose);
1611  0005 4f            	clr	a
1613                     ; 469 		return;
1616  0006 cc0000        	jp	_MotorStep
1617  0009               L174:
1618                     ; 471 	if ( Drive.Overrun >= Drive.MaxOverrun )
1620  0009 be6b          	ldw	x,_Drive+6
1621  000b b371          	cpw	x,_Drive+12
1622  000d 250c          	jrult	L374
1623                     ; 473 		Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0;
1625  000f 5f            	clrw	x
1626  0010 bf69          	ldw	_Drive+4,x
1627  0012 bf67          	ldw	_Drive+2,x
1628  0014 bf6e          	ldw	_Drive+9,x
1629  0016 bf6b          	ldw	_Drive+6,x
1630                     ; 474 		StopDrive();
1633                     ; 475 		return;
1636  0018 cc0000        	jp	_StopDrive
1637  001b               L374:
1638                     ; 477 	Drive.Overrun++;
1640  001b 5c            	incw	x
1641  001c bf6b          	ldw	_Drive+6,x
1642                     ; 478 	MotorStep(nMotorClose);
1644  001e 4f            	clr	a
1646                     ; 479 }
1649  001f cc0000        	jp	_MotorStep
1704                     ; 481 void	factory(uint8_t mode)
1704                     ; 482 {
1705                     .text:	section	.text,new
1706  0000               _factory:
1708  0000 5204          	subw	sp,#4
1709       00000004      OFST:	set	4
1712                     ; 483 	uint16_t t = 0, _t = 0;
1714  0002 5f            	clrw	x
1715  0003 1f01          	ldw	(OFST-3,sp),x
1719  0005 1f03          	ldw	(OFST-1,sp),x
1721                     ; 484 	if( mode == 0 )
1723  0007 4d            	tnz	a
1724  0008 2603          	jrne	L525
1725                     ; 485 		return;
1728  000a 5b04          	addw	sp,#4
1729  000c 81            	ret	
1730  000d               L525:
1731                     ; 488 		if( Ticks_1mS == _t )
1733  000d be7c          	ldw	x,_Ticks_1mS
1734  000f 1303          	cpw	x,(OFST-1,sp)
1735  0011 27fa          	jreq	L525
1736                     ; 489 			continue;
1738                     ; 490 		_t = Ticks_1mS;
1740  0013 be7c          	ldw	x,_Ticks_1mS
1741  0015 1f03          	ldw	(OFST-1,sp),x
1743                     ; 491 		t++;
1745  0017 1e01          	ldw	x,(OFST-3,sp)
1746  0019 5c            	incw	x
1747  001a 1f01          	ldw	(OFST-3,sp),x
1749                     ; 492 		if( t > 200 )
1751  001c a300c9        	cpw	x,#201
1752  001f 25ec          	jrult	L525
1753                     ; 494 			LightToggle
1755  0021 3b0004        	push	_IO_LED+2
1756  0024 be02          	ldw	x,_IO_LED
1757  0026 cd0000        	call	_GPIO_WriteReverse
1759  0029 84            	pop	a
1760  002a 20e1          	jra	L525
1785                     ; 499 void Clock_Config(void)
1785                     ; 500 {
1786                     .text:	section	.text,new
1787  0000               _Clock_Config:
1791                     ; 501 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
1793  0000 4f            	clr	a
1794  0001 cd0000        	call	_CLK_SYSCLKConfig
1796                     ; 502 	CLK_HSICmd(ENABLE);
1798  0004 a601          	ld	a,#1
1800                     ; 503 }
1803  0006 cc0000        	jp	_CLK_HSICmd
1865                     ; 505 void Gpio_CheckMode(void)
1865                     ; 506 {
1866                     .text:	section	.text,new
1867  0000               _Gpio_CheckMode:
1869       00000002      OFST:	set	2
1872                     ; 507 	uint8_t t = 0;
1874                     ; 508 	uint8_t prev = 0;
1876                     ; 510 	Drive.DeviceType = TYPE_MD24;
1878  0000 3501007b      	mov	_Drive+22,#1
1879                     ; 511 	Ticks_1mS = 0;
1881  0004 5f            	clrw	x
1882  0005 bf7c          	ldw	_Ticks_1mS,x
1883                     ; 512 	return;
1886  0007 81            	ret	
1924                     ; 559 void Gpio_Config(void)
1924                     ; 560 {
1925                     .text:	section	.text,new
1926  0000               _Gpio_Config:
1930                     ; 561 	Gpio_CheckMode();
1932  0000 cd0000        	call	_Gpio_CheckMode
1934                     ; 563 	GPIO_SET(LED, GPIO_MODE_OUT_PP_LOW_FAST)
1936  0003 4be0          	push	#224
1937  0005 3b0004        	push	_IO_LED+2
1938  0008 be02          	ldw	x,_IO_LED
1939  000a cd0000        	call	_GPIO_Init
1941  000d 85            	popw	x
1942                     ; 564 	GPIO_SET(ORG, GPIO_MODE_IN_FL_NO_IT)
1944  000e 4b00          	push	#0
1945  0010 3b0007        	push	_IO_ORG+2
1946  0013 be05          	ldw	x,_IO_ORG
1947  0015 cd0000        	call	_GPIO_Init
1949  0018 85            	popw	x
1950                     ; 565 	GPIO_SET(X1, GPIO_MODE_OUT_PP_LOW_FAST)
1952  0019 4be0          	push	#224
1953  001b 3b000a        	push	_IO_X1+2
1954  001e be08          	ldw	x,_IO_X1
1955  0020 cd0000        	call	_GPIO_Init
1957  0023 85            	popw	x
1958                     ; 566 	GPIO_SET(X2, GPIO_MODE_OUT_PP_LOW_FAST)
1960  0024 4be0          	push	#224
1961  0026 3b000d        	push	_IO_X2+2
1962  0029 be0b          	ldw	x,_IO_X2
1963  002b cd0000        	call	_GPIO_Init
1965  002e 85            	popw	x
1966                     ; 567 	GPIO_SET(Y1, GPIO_MODE_OUT_PP_LOW_FAST)
1968  002f 4be0          	push	#224
1969  0031 3b0010        	push	_IO_Y1+2
1970  0034 be0e          	ldw	x,_IO_Y1
1971  0036 cd0000        	call	_GPIO_Init
1973  0039 85            	popw	x
1974                     ; 568 	GPIO_SET(Y2, GPIO_MODE_OUT_PP_LOW_FAST)
1976  003a 4be0          	push	#224
1977  003c 3b0013        	push	_IO_Y2+2
1978  003f be11          	ldw	x,_IO_Y2
1979  0041 cd0000        	call	_GPIO_Init
1981  0044 85            	popw	x
1982                     ; 569 	StopDrive();
1984  0045 cd0000        	call	_StopDrive
1986                     ; 571 	GPIO_SET(ADJ, GPIO_MODE_IN_FL_NO_IT)
1988  0048 4b00          	push	#0
1989  004a 3b0016        	push	_IO_ADJ+2
1990  004d be14          	ldw	x,_IO_ADJ
1991  004f cd0000        	call	_GPIO_Init
1993  0052 85            	popw	x
1994                     ; 572 	GPIO_SET(SEN, GPIO_MODE_IN_FL_NO_IT)
1996  0053 4b00          	push	#0
1997  0055 3b0019        	push	_IO_SEN+2
1998  0058 be17          	ldw	x,_IO_SEN
1999  005a cd0000        	call	_GPIO_Init
2001  005d 85            	popw	x
2002                     ; 573 	GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
2004  005e 4b00          	push	#0
2005  0060 3b001c        	push	_IO_POWER+2
2006  0063 be1a          	ldw	x,_IO_POWER
2007  0065 cd0000        	call	_GPIO_Init
2009  0068 b67b          	ld	a,_Drive+22
2010  006a 4a            	dec	a
2011  006b 85            	popw	x
2012                     ; 574 	if( Drive.DeviceType == TYPE_MD24 )
2014  006c 2601          	jrne	L775
2015                     ; 576 		return;
2018  006e 81            	ret	
2019  006f               L775:
2020                     ; 579 	GPIO_SET(BAT, GPIO_MODE_IN_FL_NO_IT)
2022  006f 4b00          	push	#0
2023  0071 3b0022        	push	_IO_BAT+2
2024  0074 be20          	ldw	x,_IO_BAT
2025  0076 cd0000        	call	_GPIO_Init
2027  0079 b67b          	ld	a,_Drive+22
2028  007b a102          	cp	a,#2
2029  007d 85            	popw	x
2030                     ; 581 	if( Drive.DeviceType == TYPE_MD12 )
2032  007e 2616          	jrne	L106
2033                     ; 583 		GPIO_SET(BOOST, GPIO_MODE_IN_FL_NO_IT)
2035  0080 4b00          	push	#0
2036  0082 3b0025        	push	_IO_BOOST+2
2037  0085 be23          	ldw	x,_IO_BOOST
2038  0087 cd0000        	call	_GPIO_Init
2040  008a 85            	popw	x
2041                     ; 584 		GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
2043  008b 4b00          	push	#0
2044  008d 3b001c        	push	_IO_POWER+2
2045  0090 be1a          	ldw	x,_IO_POWER
2046  0092 cd0000        	call	_GPIO_Init
2048  0095 85            	popw	x
2049  0096               L106:
2050                     ; 586 }
2053  0096 81            	ret	
2076                     ; 588 OnTimer_1S(void) {}
2077                     .text:	section	.text,new
2078  0000               _OnTimer_1S:
2085  0000 81            	ret	
2088                     	bsct
2089  0029               __chan:
2090  0029 03            	dc.b	3
2091  002a 04            	dc.b	4
2092  002b 05            	dc.b	5
2093  002c 06            	dc.b	6
2094  002d 02            	dc.b	2
2095  002e               __chanSchmit:
2096  002e 03            	dc.b	3
2097  002f 04            	dc.b	4
2098  0030 05            	dc.b	5
2099  0031 06            	dc.b	6
2100  0032 02            	dc.b	2
2101  0033               __chanId:
2102  0033 01            	dc.b	1
2103  0034 02            	dc.b	2
2104  0035 03            	dc.b	3
2105  0036 04            	dc.b	4
2106  0037 00            	dc.b	0
2149                     ; 604 void	AdcGetCode(uint8_t ch)
2149                     ; 605 {
2150                     .text:	section	.text,new
2151  0000               _AdcGetCode:
2153  0000 88            	push	a
2154  0001 5203          	subw	sp,#3
2155       00000003      OFST:	set	3
2158                     ; 610 	uint8_t i = 0;
2160                     ; 612 	Adc.buf[ch].b[i] = ADC1_GetConversionValue();
2162  0003 cd0000        	call	_ADC1_GetConversionValue
2164  0006 1f01          	ldw	(OFST-2,sp),x
2166  0008 7b04          	ld	a,(OFST+1,sp)
2167  000a 97            	ld	xl,a
2168  000b a609          	ld	a,#9
2169  000d 42            	mul	x,a
2170  000e 1601          	ldw	y,(OFST-2,sp)
2171  0010 ef28          	ldw	(_Adc+1,x),y
2172                     ; 613 }
2175  0012 5b04          	addw	sp,#4
2176  0014 81            	ret	
2208                     ; 615 void Adc_Config(void)
2208                     ; 616 {
2209                     .text:	section	.text,new
2210  0000               _Adc_Config:
2214                     ; 617 	AdcGetCode(Adc.ch);
2216  0000 b627          	ld	a,_Adc
2217  0002 cd0000        	call	_AdcGetCode
2219                     ; 618 	Adc.ch = _chanId[Adc.ch];
2221  0005 b627          	ld	a,_Adc
2222  0007 5f            	clrw	x
2223  0008 97            	ld	xl,a
2224  0009 e633          	ld	a,(__chanId,x)
2225  000b b727          	ld	_Adc,a
2226                     ; 620 	if( Drive.DeviceType == TYPE_MD24 )
2228  000d b67b          	ld	a,_Drive+22
2229  000f 4a            	dec	a
2230  0010 2612          	jrne	L546
2231                     ; 622 		if( Adc.ch == 1 )
2233  0012 b627          	ld	a,_Adc
2234  0014 a101          	cp	a,#1
2235  0016 2604          	jrne	L746
2236                     ; 623 			Adc.ch = 2;
2238  0018 a602          	ld	a,#2
2239  001a b727          	ld	_Adc,a
2240  001c               L746:
2241                     ; 624 		if( Adc.ch == 3 )
2243  001c a103          	cp	a,#3
2244  001e 2604          	jrne	L546
2245                     ; 625 			Adc.ch = 4;
2247  0020 35040027      	mov	_Adc,#4
2248  0024               L546:
2249                     ; 628 	ADC1_DeInit();
2251  0024 cd0000        	call	_ADC1_DeInit
2253                     ; 629 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
2253                     ; 630 		_chan[Adc.ch], 
2253                     ; 631 		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
2253                     ; 632 		_chanSchmit[Adc.ch],
2253                     ; 633 	   	DISABLE
2253                     ; 634 		);
2255  0027 4b00          	push	#0
2256  0029 b627          	ld	a,_Adc
2257  002b 5f            	clrw	x
2258  002c 97            	ld	xl,a
2259  002d e62e          	ld	a,(__chanSchmit,x)
2260  002f 88            	push	a
2261  0030 4b08          	push	#8
2262  0032 4b00          	push	#0
2263  0034 4b00          	push	#0
2264  0036 4b00          	push	#0
2265  0038 b627          	ld	a,_Adc
2266  003a 5f            	clrw	x
2267  003b 97            	ld	xl,a
2268  003c e629          	ld	a,(__chan,x)
2269  003e 5f            	clrw	x
2270  003f 97            	ld	xl,a
2271  0040 cd0000        	call	_ADC1_Init
2273  0043 5b06          	addw	sp,#6
2274                     ; 635 	ADC1_StartConversion();		
2277                     ; 636 }
2280  0045 cc0000        	jp	_ADC1_StartConversion
2315                     ; 638 void	AdcGetAvg(uint8_t ch)
2315                     ; 639 {
2316                     .text:	section	.text,new
2317  0000               _AdcGetAvg:
2319  0000 88            	push	a
2320       00000000      OFST:	set	0
2323                     ; 647 	Adc.buf[ch].avg = Adc.buf[ch].b[0]>>2;
2325  0001 97            	ld	xl,a
2326  0002 a609          	ld	a,#9
2327  0004 42            	mul	x,a
2328  0005 89            	pushw	x
2329  0006 7b03          	ld	a,(OFST+3,sp)
2330  0008 97            	ld	xl,a
2331  0009 a609          	ld	a,#9
2332  000b 42            	mul	x,a
2333  000c ee28          	ldw	x,(_Adc+1,x)
2334  000e 54            	srlw	x
2335  000f 54            	srlw	x
2336  0010 9085          	popw	y
2337  0012 01            	rrwa	x,a
2338  0013 90e730        	ld	(_Adc+9,y),a
2339                     ; 649 }
2342  0016 84            	pop	a
2343  0017 81            	ret	
2386                     ; 651 void AdcService(uint8_t ch)
2386                     ; 652 {
2387                     .text:	section	.text,new
2388  0000               _AdcService:
2390  0000 88            	push	a
2391       00000000      OFST:	set	0
2394                     ; 653 	if( Ticks_50uS >= 10 )
2396  0001 b67e          	ld	a,_Ticks_50uS
2397  0003 a10a          	cp	a,#10
2398  0005 2517          	jrult	L063
2399                     ; 656 		Drive.Origin = !MotorOrigin();
2401  0007 3b0007        	push	_IO_ORG+2
2402  000a be05          	ldw	x,_IO_ORG
2403  000c cd0000        	call	_GPIO_ReadInputPin
2405  000f 5b01          	addw	sp,#1
2406  0011 4d            	tnz	a
2407  0012 2606          	jrne	L453
2408  0014 721a0065      	bset	_Drive,#5
2409  0018 2004          	jra	L063
2410  001a               L453:
2411  001a 721b0065      	bres	_Drive,#5
2412  001e               L063:
2414                     ; 659 	if( Diff(Timer.Adc, 10) != 1 )
2416  001e ae000a        	ldw	x,#10
2417  0021 89            	pushw	x
2418  0022 be23          	ldw	x,_Timer+2
2419  0024 cd0000        	call	_Diff
2421  0027 4a            	dec	a
2422  0028 85            	popw	x
2423  0029 2702          	jreq	L117
2424                     ; 660 		return;
2427  002b 84            	pop	a
2428  002c 81            	ret	
2429  002d               L117:
2430                     ; 661 	Timer.Adc = Ticks_1mS;
2432  002d be7c          	ldw	x,_Ticks_1mS
2433  002f bf23          	ldw	_Timer+2,x
2434                     ; 663 	Adc_Config();
2436  0031 cd0000        	call	_Adc_Config
2438                     ; 664 	AdcGetAvg(ch);	//	Adc.buf[ch].avg
2440  0034 7b01          	ld	a,(OFST+1,sp)
2441  0036 cd0000        	call	_AdcGetAvg
2443                     ; 665 	if( Drive.DeviceType == TYPE_MD24 )
2445                     ; 668 		if( ch == 0 ) { }
2448                     ; 669 		else if( ch == 1 ) { }
2451                     ; 670 		else if( ch == 2 ) { }
2453                     ; 674 		if( ch == 0 ) { }
2456                     ; 675 		else if( ch == 1 ) { }
2459                     ; 676 		else if( ch == 2 ) { }
2462                     ; 677 		else if( ch == 3 ) { }
2465                     ; 678 		else if( ch == 4 ) { }
2467                     ; 680 }
2470  0039 84            	pop	a
2471  003a 81            	ret	
2498                     ; 682 void OnTimer4(void)
2498                     ; 683 {
2499                     .text:	section	.text,new
2500  0000               _OnTimer4:
2504                     ; 684 	Ticks_50uS++;
2506  0000 3c7e          	inc	_Ticks_50uS
2507                     ; 685 	if( Ticks_50uS >= 20 )
2509  0002 b67e          	ld	a,_Ticks_50uS
2510  0004 a114          	cp	a,#20
2511  0006 2507          	jrult	L367
2512                     ; 687 		Ticks_50uS = 0;
2514  0008 3f7e          	clr	_Ticks_50uS
2515                     ; 688 		Ticks_1mS++;
2517  000a be7c          	ldw	x,_Ticks_1mS
2518  000c 5c            	incw	x
2519  000d bf7c          	ldw	_Ticks_1mS,x
2520  000f               L367:
2521                     ; 690 	if( Drive.Ticks )
2523  000f b676          	ld	a,_Drive+17
2524  0011 2706          	jreq	L567
2525                     ; 691 		Drive.Ticks--;
2527  0013 3a76          	dec	_Drive+17
2529  0015 a601          	ld	a,#1
2530  0017 200b          	jra	L767
2531  0019               L567:
2532                     ; 694 		Drive.MotorRun = 1;
2534  0019 4c            	inc	a
2535  001a b777          	ld	_Drive+18,a
2536                     ; 695 		if( Drive.Enabled )
2538  001c 7201006503    	btjf	_Drive,#0,L767
2539                     ; 696 			Drive.Ticks = Drive.Interval;
2541  0021 457576        	mov	_Drive+17,_Drive+16
2542  0024               L767:
2543                     ; 699 	TIM4_ClearFlag(TIM4_IT_UPDATE);
2546                     ; 700 }
2549  0024 cc0000        	jp	_TIM4_ClearFlag
2574                     ; 702 void OnCaptureOVTim2(void)
2574                     ; 703 {
2575                     .text:	section	.text,new
2576  0000               _OnCaptureOVTim2:
2580                     ; 710 	Pwm.Overflow = 1;
2582  0000 a601          	ld	a,#1
2583  0002 b760          	ld	_Pwm+11,a
2584                     ; 711 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
2587                     ; 715 }	
2590  0004 cc0000        	jp	_TIM1_ClearITPendingBit
2619                     ; 717 void OnCaptureTim2(void)
2619                     ; 718 {
2620                     .text:	section	.text,new
2621  0000               _OnCaptureTim2:
2625                     ; 720 	if( TIM1_GetITStatus(TIM1_IT_CC1) == SET )
2627  0000 a602          	ld	a,#2
2628  0002 cd0000        	call	_TIM1_GetITStatus
2630  0005 4a            	dec	a
2631  0006 260a          	jrne	L3101
2632                     ; 722 		Pwm.T1 = TIM1_GetCapture1();	
2634  0008 cd0000        	call	_TIM1_GetCapture1
2636  000b bf56          	ldw	_Pwm+1,x
2637                     ; 723 		TIM1_InterruptClear(TIM1_IT_CC1)
2639  000d a602          	ld	a,#2
2640  000f cd0000        	call	_TIM1_ClearITPendingBit
2642  0012               L3101:
2643                     ; 725 	if( TIM1_GetITStatus(TIM1_IT_CC2) == SET ) 
2645  0012 a604          	ld	a,#4
2646  0014 cd0000        	call	_TIM1_GetITStatus
2648  0017 4a            	dec	a
2649  0018 2624          	jrne	L5101
2650                     ; 727 		Pwm.T2 = TIM1_GetCapture2();	
2652  001a cd0000        	call	_TIM1_GetCapture2
2654  001d bf58          	ldw	_Pwm+3,x
2655                     ; 728 		TIM1_InterruptClear(TIM1_IT_CC2)
2657  001f a604          	ld	a,#4
2658  0021 cd0000        	call	_TIM1_ClearITPendingBit
2660                     ; 729 		TIM1_SetCounter(0u);
2662  0024 5f            	clrw	x
2663  0025 cd0000        	call	_TIM1_SetCounter
2665                     ; 730 		Pwm._t1 = Pwm.T1;
2667  0028 be56          	ldw	x,_Pwm+1
2668  002a bf61          	ldw	_Pwm+12,x
2669                     ; 731 		Pwm._t2 = Pwm.T2;
2671  002c be58          	ldw	x,_Pwm+3
2672  002e bf63          	ldw	_Pwm+14,x
2673                     ; 732 		if ( Pwm.Overflow )
2675  0030 b660          	ld	a,_Pwm+11
2676  0032 2706          	jreq	L7101
2677                     ; 734 			Pwm._t1 = 0;
2679  0034 5f            	clrw	x
2680  0035 bf61          	ldw	_Pwm+12,x
2681                     ; 735 			Pwm.Overflow = 0;
2683  0037 3f60          	clr	_Pwm+11
2686  0039 81            	ret	
2687  003a               L7101:
2688                     ; 739 			Pwm.Calc = 1;
2690  003a 72140055      	bset	_Pwm,#2
2691  003e               L5101:
2692                     ; 764 }
2695  003e 81            	ret	
2729                     ; 766 void Timer_Config(void)
2729                     ; 767 {
2730                     .text:	section	.text,new
2731  0000               _Timer_Config:
2735                     ; 772 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x64);  //  16 * 0x32 = 50uS  Ticks, 0x64-100us 
2737  0000 ae0464        	ldw	x,#1124
2738  0003 cd0000        	call	_TIM4_TimeBaseInit
2740                     ; 775 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2742  0006 ae0101        	ldw	x,#257
2743  0009 cd0000        	call	_TIM4_ITConfig
2745                     ; 776   TIM4_Cmd(ENABLE);
2747  000c a601          	ld	a,#1
2748  000e cd0000        	call	_TIM4_Cmd
2750                     ; 794 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
2752  0011 ae0701        	ldw	x,#1793
2753  0014 cd0000        	call	_CLK_PeripheralClockConfig
2755                     ; 797 	TIM1_TimeBaseInit(0x02, TIM1_COUNTERMODE_UP, 
2755                     ; 798 		0xffff, 0);	//	4 -> 0.25us
2757  0017 4b00          	push	#0
2758  0019 aeffff        	ldw	x,#65535
2759  001c 89            	pushw	x
2760  001d 4b00          	push	#0
2761  001f ae0002        	ldw	x,#2
2762  0022 cd0000        	call	_TIM1_TimeBaseInit
2764  0025 5b04          	addw	sp,#4
2765                     ; 799 	TIM1_PWMIConfig(TIM1_CHANNEL_2, 
2765                     ; 800 			//TIM1_ICPOLARITY_FALLING, 
2765                     ; 801 			TIM1_ICPOLARITY_RISING, 
2765                     ; 802 			TIM1_ICSELECTION_DIRECTTI, 
2765                     ; 803 			TIM1_ICPSC_DIV1, 0);//ENABLE);//ICFilter);
2767  0027 4b00          	push	#0
2768  0029 4b00          	push	#0
2769  002b 4b01          	push	#1
2770  002d ae0100        	ldw	x,#256
2771  0030 cd0000        	call	_TIM1_PWMIConfig
2773  0033 5b03          	addw	sp,#3
2774                     ; 804 	TIM1_SelectInputTrigger(TIM1_TS_TI1FP1);
2776  0035 a650          	ld	a,#80
2777  0037 cd0000        	call	_TIM1_SelectInputTrigger
2779                     ; 805 	TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET);
2781  003a a604          	ld	a,#4
2782  003c cd0000        	call	_TIM1_SelectSlaveMode
2784                     ; 806 	TIM1_ITConfig(TIM1_IT_UPDATE | TIM1_IT_CC1 | TIM1_IT_CC2, ENABLE);
2786  003f ae0701        	ldw	x,#1793
2787  0042 cd0000        	call	_TIM1_ITConfig
2789                     ; 807 	TIM1_SetCounter(0xffff);
2791  0045 aeffff        	ldw	x,#65535
2792  0048 cd0000        	call	_TIM1_SetCounter
2794                     ; 808 	TIM1_Cmd(ENABLE);
2796  004b a601          	ld	a,#1
2798                     ; 823 }
2801  004d cc0000        	jp	_TIM1_Cmd
2824                     ; 825 void mainDeviceType(void)
2824                     ; 826 {
2825                     .text:	section	.text,new
2826  0000               _mainDeviceType:
2830  0000               L3401:
2831  0000 20fe          	jra	L3401
2856                     ; 830 void	motorGo(void)
2856                     ; 831 {
2857                     .text:	section	.text,new
2858  0000               _motorGo:
2862                     ; 832 	if ( Drive.MotorRun == 1 && Drive.Enabled )
2864  0000 b677          	ld	a,_Drive+18
2865  0002 4a            	dec	a
2866  0003 260d          	jrne	L7501
2868  0005 7201006508    	btjf	_Drive,#0,L7501
2869                     ; 834 		Drive.MotorRun = 0;
2871  000a b777          	ld	_Drive+18,a
2872                     ; 835 		DriveService();	
2874  000c cd0000        	call	_DriveService
2876                     ; 836 		Drive.Ticks = Drive.Interval;
2878  000f 457576        	mov	_Drive+17,_Drive+16
2879  0012               L7501:
2880                     ; 852 }
2883  0012 81            	ret	
2948                     ; 854 void main(void)
2948                     ; 855 {
2949                     .text:	section	.text,new
2950  0000               _main:
2952  0000 5209          	subw	sp,#9
2953       00000009      OFST:	set	9
2956                     ; 857 	uint8_t		channel = 0;
2958  0002 0f05          	clr	(OFST-4,sp)
2960                     ; 861 	Drive.Enabled = TRUE;
2962                     ; 862 	Drive.MaxOverrun = OVERRUN;
2964  0004 ae012c        	ldw	x,#300
2965  0007 72100065      	bset	_Drive,#0
2966  000b bf71          	ldw	_Drive+12,x
2967                     ; 863 	Drive.Position = Drive.Stage = 0;
2969  000d 3f7a          	clr	_Drive+21
2970  000f 5f            	clrw	x
2971  0010 bf67          	ldw	_Drive+2,x
2972                     ; 864 	Drive.Dir = nMotorClose;
2974  0012 72170065      	bres	_Drive,#3
2975                     ; 865 	Drive.Interval = 15;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
2977  0016 350f0075      	mov	_Drive+16,#15
2978                     ; 867 	Ticks_1mS = Ticks_50uS = Pwm.Edge = 0;
2980  001a 72110055      	bres	_Pwm,#0
2981  001e 3f7e          	clr	_Ticks_50uS
2982  0020 bf7c          	ldw	_Ticks_1mS,x
2983                     ; 869 	Clock_Config();
2985  0022 cd0000        	call	_Clock_Config
2987                     ; 870 	Gpio_Config();
2989  0025 cd0000        	call	_Gpio_Config
2991                     ; 871 	Timer_Config();
2993  0028 cd0000        	call	_Timer_Config
2995                     ; 873 	Adc.ch = 2;
2997  002b 35020027      	mov	_Adc,#2
2998                     ; 874 	Adc_Config();
3000  002f cd0000        	call	_Adc_Config
3002                     ; 876 	dutyInfo.s = dutyInfo.i = 0;
3004  0032 3fa7          	clr	_dutyInfo+40
3005  0034 5f            	clrw	x
3006  0035 bfa9          	ldw	_dutyInfo+42,x
3007                     ; 877 	Pwm.Calc = Pwm.Edge = 0;
3009                     ; 878 	Pwm.Update = 1;
3011                     ; 880 	enableInterrupts();
3014  0037 b655          	ld	a,_Pwm
3015  0039 a4fa          	and	a,#250
3016  003b aa02          	or	a,#2
3017  003d b755          	ld	_Pwm,a
3018  003f 9a            	rim	
3020                     ; 881 	waitPowerDelay();
3023  0040 cd0000        	call	_waitPowerDelay
3025                     ; 882 	if ( Drive.Origin ) 
3027  0043 720b006519    	btjf	_Drive,#5,L3011
3028                     ; 884 		Drive.Position = 0;
3030  0048 5f            	clrw	x
3031  0049 bf67          	ldw	_Drive+2,x
3032                     ; 885 		StartDriveOR( CPulse(MAX_MOTOR_POS), OFFSET_OVERRUN);
3034  004b 4b00          	push	#0
3035  004d a6c8          	ld	a,#200
3036  004f cd0000        	call	_CPulse
3038  0052 cd0000        	call	_StartDriveOR
3040  0055 84            	pop	a
3042  0056 2003          	jra	L7011
3043  0058               L5011:
3044                     ; 888 			motorGo();
3046  0058 cd0000        	call	_motorGo
3048  005b               L7011:
3049                     ; 887 		while ( Drive.Run )
3051  005b b666          	ld	a,_Drive+1
3052  005d 26f9          	jrne	L5011
3054  005f 2007          	jra	L3111
3055  0061               L3011:
3056                     ; 891 		Drive.Position = CPulse(MAX_MOTOR_POS + 5);
3058  0061 a6cd          	ld	a,#205
3059  0063 cd0000        	call	_CPulse
3061  0066 bf67          	ldw	_Drive+2,x
3062  0068               L3111:
3063                     ; 893 	Timer.Led = /*Timer.Motor = */Timer.Adc = Ticks_1mS;
3065  0068 be7c          	ldw	x,_Ticks_1mS
3066  006a bf23          	ldw	_Timer+2,x
3067  006c bf21          	ldw	_Timer,x
3068                     ; 894 	Drive.Run0 = Drive.Run;
3070  006e b666          	ld	a,_Drive+1
3071  0070 44            	srl	a
3072  0071 90130065      	bccm	_Drive,#1
3073                     ; 896 	if( Drive.DeviceType == TYPE_MD12 )
3075  0075 b67b          	ld	a,_Drive+22
3076  0077 a102          	cp	a,#2
3077  0079 2603          	jrne	L7111
3078                     ; 897 		mainDeviceType();
3080  007b cd0000        	call	_mainDeviceType
3082  007e               L7111:
3083                     ; 901 		LightControl(Ticks_1mS);
3085  007e be7c          	ldw	x,_Ticks_1mS
3086  0080 cd0000        	call	_LightControl
3088                     ; 903 		if ( Drive.Stage == 0 )
3090  0083 b67a          	ld	a,_Drive+21
3091  0085 2607          	jrne	L3211
3092                     ; 905 			Drive.Stage = ZeroPos();
3094  0087 cd0000        	call	_ZeroPos
3096  008a b77a          	ld	_Drive+21,a
3098  008c 2027          	jra	L5211
3099  008e               L3211:
3100                     ; 909 			if( Pwm.Update == 0 )
3102  008e 7202005505    	btjt	_Pwm,#1,L7211
3103                     ; 911 				AdcService(channel);
3105  0093 7b05          	ld	a,(OFST-4,sp)
3106  0095 cd0000        	call	_AdcService
3108  0098               L7211:
3109                     ; 914 			if ( Diff(Timer.PwmUpdate, MAX_TIMEOUT) == 1 )
3111  0098 ae07d0        	ldw	x,#2000
3112  009b 89            	pushw	x
3113  009c be25          	ldw	x,_Timer+4
3114  009e cd0000        	call	_Diff
3116  00a1 4a            	dec	a
3117  00a2 85            	popw	x
3118  00a3 260c          	jrne	L1311
3119                     ; 916 				Timer.PwmUpdate = Ticks_1mS;		
3121  00a5 be7c          	ldw	x,_Ticks_1mS
3122  00a7 bf25          	ldw	_Timer+4,x
3123                     ; 917 				Drive.Step = 0;
3125  00a9 3f78          	clr	_Drive+19
3126                     ; 918 				Pwm.Update = 0;
3128  00ab 72130055      	bres	_Pwm,#1
3130  00af 2004          	jra	L5211
3131  00b1               L1311:
3132                     ; 922 				Pwm.Update = 1;
3134  00b1 72120055      	bset	_Pwm,#1
3135  00b5               L5211:
3136                     ; 925 		if( Pwm.Calc == 1 )
3138  00b5 b655          	ld	a,_Pwm
3139  00b7 a504          	bcp	a,#4
3140  00b9 274f          	jreq	L5311
3141                     ; 927 			Pwm.Calc = 0;
3143  00bb 72150055      	bres	_Pwm,#2
3145  00bf 2008          	jra	L3411
3146  00c1               L7311:
3147                     ; 933 				Pwm._t1 >>= 1;
3149  00c1 3461          	srl	_Pwm+12
3150  00c3 3662          	rrc	_Pwm+13
3151                     ; 934 				Pwm._t2 >>= 1;
3153  00c5 3463          	srl	_Pwm+14
3154  00c7 3664          	rrc	_Pwm+15
3155  00c9               L3411:
3156                     ; 931 			while ( Pwm._t2 > 0xff )
3158  00c9 be63          	ldw	x,_Pwm+14
3159  00cb a30100        	cpw	x,#256
3160  00ce 24f1          	jruge	L7311
3161                     ; 937 			dt = 100. * Pwm._t1 / ( Pwm._t2);
3163  00d0 cd0000        	call	c_uitof
3165  00d3 96            	ldw	x,sp
3166  00d4 5c            	incw	x
3167  00d5 cd0000        	call	c_rtol
3170  00d8 be61          	ldw	x,_Pwm+12
3171  00da cd0000        	call	c_uitof
3173  00dd ae0000        	ldw	x,#L3511
3174  00e0 cd0000        	call	c_fmul
3176  00e3 96            	ldw	x,sp
3177  00e4 5c            	incw	x
3178  00e5 cd0000        	call	c_fdiv
3180  00e8 96            	ldw	x,sp
3181  00e9 1c0006        	addw	x,#OFST-3
3182  00ec cd0000        	call	c_rtol
3185                     ; 938 			Pwm.Duty100 = (uint16_t)dt;
3187  00ef 96            	ldw	x,sp
3188  00f0 1c0006        	addw	x,#OFST-3
3189  00f3 cd0000        	call	c_ltor
3191  00f6 cd0000        	call	c_ftoi
3193  00f9 bf5e          	ldw	_Pwm+9,x
3194                     ; 939 			Pwm.Duty = Pwm.Duty100 / 100 * MAX_MOTOR_POS / 100; 
3196  00fb a664          	ld	a,#100
3197  00fd 62            	div	x,a
3198  00fe 58            	sllw	x
3199  00ff bf5c          	ldw	_Pwm+7,x
3200                     ; 940 			Drive.Step = stepCalc(Pwm.Duty);
3202  0101 cd0000        	call	_stepCalc
3204  0104 b778          	ld	_Drive+19,a
3205                     ; 942 			Timer.PwmUpdate = Ticks_1mS;		
3207  0106 be7c          	ldw	x,_Ticks_1mS
3208  0108 bf25          	ldw	_Timer+4,x
3209  010a               L5311:
3210                     ; 945 		motorGo();
3212  010a cd0000        	call	_motorGo
3215  010d cc007e        	jra	L7111
3259                     ; 950 void assert_failed(uint8_t* file, uint32_t line) { uint8_t i; while (1) i++; }
3260                     .text:	section	.text,new
3261  0000               _assert_failed:
3263  0000 88            	push	a
3264       00000001      OFST:	set	1
3267  0001               L1021:
3270  0001 0c01          	inc	(OFST+0,sp)
3273  0003 20fc          	jra	L1021
4128                     	xdef	_main
4129                     	xdef	_motorGo
4130                     	xdef	_mainDeviceType
4131                     	xdef	_Timer_Config
4132                     	xdef	_OnCaptureTim2
4133                     	xdef	_OnCaptureOVTim2
4134                     	xdef	_OnTimer4
4135                     	xdef	_AdcService
4136                     	xdef	_AdcGetAvg
4137                     	xdef	_Adc_Config
4138                     	xdef	_AdcGetCode
4139                     	xdef	__chanId
4140                     	xdef	__chanSchmit
4141                     	xdef	__chan
4142                     	xdef	_OnTimer_1S
4143                     	xdef	_Gpio_Config
4144                     	xdef	_Gpio_CheckMode
4145                     	xdef	_Clock_Config
4146                     	xdef	_factory
4147                     	xdef	_MotorStepSetOverrun
4148                     	xdef	_MotorStepPhase
4149                     	xdef	_DriveService
4150                     	xdef	_MotorClose
4151                     	xdef	_MotorStep
4152                     	xdef	_StopDrive
4153                     	xdef	_MotorService
4154                     	xdef	_LightControl
4155                     	xdef	_ZeroPos
4156                     	xdef	_StartDriveOR
4157                     	xdef	_waitPowerDelay
4158                     	xdef	_stepCalc
4159                     	xdef	_stepPrepare
4160                     	xdef	_Diff
4161                     	xdef	_CPulse
4162                     	xdef	_phase_excite
4163                     	xdef	_IO_CHARGE
4164                     	xdef	_IO_BOOST
4165                     	xdef	_IO_BAT
4166                     	xdef	_IO_MOD
4167                     	xdef	_IO_POWER
4168                     	xdef	_IO_SEN
4169                     	xdef	_IO_ADJ
4170                     	xdef	_IO_Y2
4171                     	xdef	_IO_Y1
4172                     	xdef	_IO_X2
4173                     	xdef	_IO_X1
4174                     	xdef	_IO_ORG
4175                     	xdef	_IO_LED
4176                     	switch	.ubsct
4177  0000               _motorWatch:
4178  0000 000000000000  	ds.b	33
4179                     	xdef	_motorWatch
4180  0021               _Timer:
4181  0021 000000000000  	ds.b	6
4182                     	xdef	_Timer
4183  0027               _Adc:
4184  0027 000000000000  	ds.b	46
4185                     	xdef	_Adc
4186  0055               _Pwm:
4187  0055 000000000000  	ds.b	16
4188                     	xdef	_Pwm
4189  0065               _Drive:
4190  0065 000000000000  	ds.b	23
4191                     	xdef	_Drive
4192                     	xdef	_ledint
4193  007c               _Ticks_1mS:
4194  007c 0000          	ds.b	2
4195                     	xdef	_Ticks_1mS
4196  007e               _Ticks_50uS:
4197  007e 00            	ds.b	1
4198                     	xdef	_Ticks_50uS
4199  007f               _dutyInfo:
4200  007f 000000000000  	ds.b	44
4201                     	xdef	_dutyInfo
4202                     	xdef	_assert_failed
4203                     	xref	_TIM4_ClearFlag
4204                     	xref	_TIM4_ITConfig
4205                     	xref	_TIM4_Cmd
4206                     	xref	_TIM4_TimeBaseInit
4207                     	xref	_TIM1_ClearITPendingBit
4208                     	xref	_TIM1_GetITStatus
4209                     	xref	_TIM1_GetCapture2
4210                     	xref	_TIM1_GetCapture1
4211                     	xref	_TIM1_SetCounter
4212                     	xref	_TIM1_SelectSlaveMode
4213                     	xref	_TIM1_SelectInputTrigger
4214                     	xref	_TIM1_ITConfig
4215                     	xref	_TIM1_Cmd
4216                     	xref	_TIM1_PWMIConfig
4217                     	xref	_TIM1_TimeBaseInit
4218                     	xref	_GPIO_ReadInputPin
4219                     	xref	_GPIO_WriteReverse
4220                     	xref	_GPIO_WriteLow
4221                     	xref	_GPIO_WriteHigh
4222                     	xref	_GPIO_Init
4223                     	xref	_CLK_SYSCLKConfig
4224                     	xref	_CLK_PeripheralClockConfig
4225                     	xref	_CLK_HSICmd
4226                     	xref	_ADC1_GetConversionValue
4227                     	xref	_ADC1_StartConversion
4228                     	xref	_ADC1_Init
4229                     	xref	_ADC1_DeInit
4230                     .const:	section	.text
4231  0000               L3511:
4232  0000 42c80000      	dc.w	17096,0
4233                     	xref.b	c_x
4253                     	xref	c_ftoi
4254                     	xref	c_ltor
4255                     	xref	c_fdiv
4256                     	xref	c_rtol
4257                     	xref	c_fmul
4258                     	xref	c_uitof
4259                     	xref	c_smodx
4260                     	xref	c_imul
4261                     	end
