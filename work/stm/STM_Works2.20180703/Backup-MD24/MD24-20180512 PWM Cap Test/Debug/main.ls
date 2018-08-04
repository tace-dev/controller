   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  21                     	bsct
  22  0000               _nDuty:
  23  0000 00            	dc.b	0
  24  0001               _ledint:
  25  0001 01f4          	dc.w	500
  26  0003               _PowerDelay_1mS:
  27  0003 01f3          	dc.w	499
  70                     ; 159 void	phase_excite(uint8_t phase)
  70                     ; 160 {
  72                     .text:	section	.text,new
  73  0000               _phase_excite:
  75  0000 88            	push	a
  76       00000000      OFST:	set	0
  79                     ; 161 	if ( !Drive.Run || !Drive.Enabled ) return;
  81  0001 b667          	ld	a,_Drive+1
  82  0003 2705          	jreq	L15
  84  0005 7200006602    	btjt	_Drive,#0,L74
  85  000a               L15:
  89  000a 84            	pop	a
  90  000b 81            	ret	
  91  000c               L74:
  92                     ; 162 	switch(phase)
  94  000c 7b01          	ld	a,(OFST+1,sp)
  96                     ; 179 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
  97  000e 271b          	jreq	L3
  98  0010 4a            	dec	a
  99  0011 2722          	jreq	L5
 100  0013 4a            	dec	a
 101  0014 2732          	jreq	L7
 102  0016 4a            	dec	a
 103  0017 2745          	jreq	L11
 104  0019 4a            	dec	a
 105  001a 274e          	jreq	L31
 106  001c 4a            	dec	a
 107  001d 2757          	jreq	L51
 108  001f 4a            	dec	a
 109  0020 2779          	jreq	L71
 110  0022 4a            	dec	a
 111  0023 2603cc00a5    	jreq	L12
 112  0028 cc00c9        	jra	L55
 113  002b               L3:
 114                     ; 172 		case 0: _H_X1 _L_X2 _H_Y1 _L_Y2 break;
 116  002b 4b40          	push	#64
 117  002d ae500a        	ldw	x,#20490
 118  0030 cd0000        	call	_GPIO_WriteHigh
 128  0033 2008          	jp	LC005
 129  0035               L5:
 130                     ; 173 		case 1: _L_X1 _L_X2 _H_Y1 _L_Y2 break;		
 132  0035 4b40          	push	#64
 133  0037 ae500a        	ldw	x,#20490
 134  003a cd0000        	call	_GPIO_WriteLow
 138  003d               LC005:
 139  003d 84            	pop	a
 141  003e 4b80          	push	#128
 142  0040 ae500a        	ldw	x,#20490
 143  0043 cd0000        	call	_GPIO_WriteLow
 151  0046 200b          	jp	LC004
 152  0048               L7:
 153                     ; 174 		case 2: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
 155  0048 cd00cb        	call	LC008
 158  004b 4b80          	push	#128
 159  004d ae500a        	ldw	x,#20490
 160  0050 cd0000        	call	_GPIO_WriteHigh
 164  0053               LC004:
 165  0053 84            	pop	a
 168  0054 4b08          	push	#8
 169  0056 ae500a        	ldw	x,#20490
 170  0059 cd0000        	call	_GPIO_WriteHigh
 176  005c 2061          	jp	LC002
 177  005e               L11:
 178                     ; 175 		case 3: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
 180  005e ad6b          	call	LC008
 183  0060 4b80          	push	#128
 184  0062 ae500a        	ldw	x,#20490
 185  0065 cd0000        	call	_GPIO_WriteHigh
 193  0068 204c          	jp	LC003
 194  006a               L31:
 195                     ; 176 		case 4: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
 197  006a ad5f          	call	LC008
 200  006c 4b80          	push	#128
 201  006e ae500a        	ldw	x,#20490
 202  0071 cd0000        	call	_GPIO_WriteHigh
 210  0074 2011          	jp	LC006
 211  0076               L51:
 212                     ; 177 		case 5: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
 214  0076 4b40          	push	#64
 215  0078 ae500a        	ldw	x,#20490
 216  007b cd0000        	call	_GPIO_WriteLow
 220  007e               LC007:
 221  007e 84            	pop	a
 223  007f 4b80          	push	#128
 224  0081 ae500a        	ldw	x,#20490
 225  0084 cd0000        	call	_GPIO_WriteLow
 232  0087               LC006:
 233  0087 84            	pop	a
 236  0088 4b08          	push	#8
 237  008a ae500a        	ldw	x,#20490
 238  008d cd0000        	call	_GPIO_WriteLow
 239  0090 84            	pop	a
 242  0091 4b08          	push	#8
 243  0093 ae5000        	ldw	x,#20480
 244  0096 cd0000        	call	_GPIO_WriteHigh
 248  0099 202d          	jp	LC001
 249  009b               L71:
 250                     ; 178 		case 6: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
 252  009b 4b40          	push	#64
 253  009d ae500a        	ldw	x,#20490
 254  00a0 cd0000        	call	_GPIO_WriteHigh
 264  00a3 20d9          	jp	LC007
 265  00a5               L12:
 266                     ; 179 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
 268  00a5 4b40          	push	#64
 269  00a7 ae500a        	ldw	x,#20490
 270  00aa cd0000        	call	_GPIO_WriteHigh
 272  00ad 84            	pop	a
 275  00ae 4b80          	push	#128
 276  00b0 ae500a        	ldw	x,#20490
 277  00b3 cd0000        	call	_GPIO_WriteLow
 281  00b6               LC003:
 282  00b6 84            	pop	a
 284  00b7 4b08          	push	#8
 285  00b9 ae500a        	ldw	x,#20490
 286  00bc cd0000        	call	_GPIO_WriteLow
 290  00bf               LC002:
 291  00bf 84            	pop	a
 296  00c0 4b08          	push	#8
 297  00c2 ae5000        	ldw	x,#20480
 298  00c5 cd0000        	call	_GPIO_WriteLow
 300  00c8               LC001:
 301  00c8 84            	pop	a
 304  00c9               L55:
 305                     ; 188 }
 308  00c9 84            	pop	a
 309  00ca 81            	ret	
 310  00cb               LC008:
 311  00cb 4b40          	push	#64
 312  00cd ae500a        	ldw	x,#20490
 313  00d0 cd0000        	call	_GPIO_WriteLow
 315  00d3 84            	pop	a
 316  00d4 81            	ret	
 350                     ; 190 uint16_t CPulse( u8 step )
 350                     ; 191 {
 351                     .text:	section	.text,new
 352  0000               _CPulse:
 356                     ; 192 	return (uint16_t)((uint32_t) step *(26UL));  // 20180509  change to 5200 pulse
 358  0000 b703          	ld	c_lreg+3,a
 359  0002 3f02          	clr	c_lreg+2
 360  0004 3f01          	clr	c_lreg+1
 361  0006 3f00          	clr	c_lreg
 362  0008 a61a          	ld	a,#26
 363  000a cd0000        	call	c_smul
 365  000d be02          	ldw	x,c_lreg+2
 368  000f 81            	ret	
 421                     ; 195 u8  Diff(uint16_t time, uint16_t diff)				
 421                     ; 196 {
 422                     .text:	section	.text,new
 423  0000               _Diff:
 425  0000 89            	pushw	x
 426  0001 89            	pushw	x
 427       00000002      OFST:	set	2
 430                     ; 197 	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
 432  0002 b381          	cpw	x,_Ticks_1mS
 433  0004 2207          	jrugt	L211
 434  0006 be81          	ldw	x,_Ticks_1mS
 435  0008 72f003        	subw	x,(OFST+1,sp)
 436  000b 200a          	jra	L411
 437  000d               L211:
 438  000d aeffff        	ldw	x,#65535
 439  0010 72f003        	subw	x,(OFST+1,sp)
 440  0013 72bb0081      	addw	x,_Ticks_1mS
 441  0017               L411:
 442  0017 1f01          	ldw	(OFST-1,sp),x
 444                     ; 198 	return _t > diff ? 1u : 0u;
 446  0019 1307          	cpw	x,(OFST+5,sp)
 447  001b 2304          	jrule	L611
 448  001d a601          	ld	a,#1
 449  001f 2001          	jra	L021
 450  0021               L611:
 451  0021 4f            	clr	a
 452  0022               L021:
 455  0022 5b04          	addw	sp,#4
 456  0024 81            	ret	
 493                     ; 201 uint16_t	stepPrepare(uint8_t i)
 493                     ; 202 {
 494                     .text:	section	.text,new
 495  0000               _stepPrepare:
 497  0000 88            	push	a
 498       00000000      OFST:	set	0
 501                     ; 203 	sDuty -= dutyBuffer[i];
 503  0001 5f            	clrw	x
 504  0002 97            	ld	xl,a
 505  0003 e689          	ld	a,(_dutyBuffer,x)
 506  0005 5f            	clrw	x
 507  0006 97            	ld	xl,a
 508  0007 72b00086      	subw	x,_sDuty
 509  000b 50            	negw	x
 510  000c bf86          	ldw	_sDuty,x
 511                     ; 204 	dutyBuffer[i] = Pwm.Duty;
 513  000e 5f            	clrw	x
 514  000f 7b01          	ld	a,(OFST+1,sp)
 515  0011 97            	ld	xl,a
 516  0012 b663          	ld	a,_Pwm+15
 517  0014 e789          	ld	(_dutyBuffer,x),a
 518                     ; 205 	sDuty += dutyBuffer[i];
 520  0016 5f            	clrw	x
 521  0017 7b01          	ld	a,(OFST+1,sp)
 522  0019 97            	ld	xl,a
 523  001a e689          	ld	a,(_dutyBuffer,x)
 524  001c bb87          	add	a,_sDuty+1
 525  001e b787          	ld	_sDuty+1,a
 526  0020 2402          	jrnc	L421
 527  0022 3c86          	inc	_sDuty
 528  0024               L421:
 529                     ; 206 	return sDuty;
 531  0024 be86          	ldw	x,_sDuty
 534  0026 84            	pop	a
 535  0027 81            	ret	
 580                     ; 209 uint8_t	stepCalc(uint16_t sDuty)
 580                     ; 210 {
 581                     .text:	section	.text,new
 582  0000               _stepCalc:
 584  0000 89            	pushw	x
 585  0001 89            	pushw	x
 586       00000002      OFST:	set	2
 589                     ; 213 	if ( nDuty < 16 )
 591  0002 b600          	ld	a,_nDuty
 592  0004 a110          	cp	a,#16
 593  0006 2404          	jruge	L361
 594                     ; 214 		nDuty ++;
 596  0008 3c00          	inc	_nDuty
 597  000a b600          	ld	a,_nDuty
 598  000c               L361:
 599                     ; 215 	mDuty = (sDuty / nDuty) * 2 + 1;	
 601  000c 62            	div	x,a
 602  000d 58            	sllw	x
 603  000e 5c            	incw	x
 604  000f bf84          	ldw	_mDuty,x
 605                     ; 216 	mDuty /= 2;
 607  0011 3484          	srl	_mDuty
 608  0013 3685          	rrc	_mDuty+1
 609                     ; 217 	RANGE_FROM_TO(mDuty, 20, 180)
 611  0015 be84          	ldw	x,_mDuty
 612  0017 a30014        	cpw	x,#20
 613  001a 2405          	jruge	L561
 616  001c ae0014        	ldw	x,#20
 617  001f bf84          	ldw	_mDuty,x
 618  0021               L561:
 621  0021 a300b5        	cpw	x,#181
 622  0024 2505          	jrult	L761
 625  0026 ae00b4        	ldw	x,#180
 626  0029 bf84          	ldw	_mDuty,x
 627  002b               L761:
 628                     ; 219 	mVal  =  (625u * mDuty)/10u -1250u;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
 630  002b 90ae0271      	ldw	y,#625
 631  002f cd0000        	call	c_imul
 633  0032 a60a          	ld	a,#10
 634  0034 62            	div	x,a
 635  0035 1d04e2        	subw	x,#1250
 637                     ; 220 	mVal = (mVal / 25u + 1 ) /	2u;
 639  0038 a619          	ld	a,#25
 640  003a 62            	div	x,a
 641  003b 5c            	incw	x
 642  003c 54            	srlw	x
 643  003d 1f01          	ldw	(OFST-1,sp),x
 645                     ; 221 	return (uint8_t)mVal ;
 647  003f 7b02          	ld	a,(OFST+0,sp)
 650  0041 5b04          	addw	sp,#4
 651  0043 81            	ret	
 678                     ; 224 void	waitPowerDelay(void)
 678                     ; 225 {
 679                     .text:	section	.text,new
 680  0000               _waitPowerDelay:
 684                     ; 226 	LightOn
 686  0000 4b04          	push	#4
 687  0002 ae5000        	ldw	x,#20480
 688  0005 cd0000        	call	_GPIO_WriteLow
 690  0008 84            	pop	a
 692  0009               L302:
 693                     ; 227 	while ( Ticks_1mS < PowerDelay_1mS )
 695  0009 be81          	ldw	x,_Ticks_1mS
 696  000b b303          	cpw	x,_PowerDelay_1mS
 697  000d 25fa          	jrult	L302
 698                     ; 229 	LightOff
 700  000f 4b04          	push	#4
 701  0011 ae5000        	ldw	x,#20480
 702  0014 cd0000        	call	_GPIO_WriteHigh
 704  0017 84            	pop	a
 705                     ; 230 }
 708  0018 81            	ret	
 755                     ; 232 void StartDriveOR( uint16_t Target, uint8_t overrun )
 755                     ; 233 {
 756                     .text:	section	.text,new
 757  0000               _StartDriveOR:
 759  0000 89            	pushw	x
 760       00000000      OFST:	set	0
 763                     ; 235 	mStep[iStep] = Target;
 765  0001 b600          	ld	a,_iStep
 766  0003 905f          	clrw	y
 767  0005 9097          	ld	yl,a
 768  0007 9058          	sllw	y
 769                     ; 236 	iStep = (iStep + 1)  % 32u;
 771  0009 4c            	inc	a
 772  000a 90ef01        	ldw	(_mStep,y),x
 773  000d a41f          	and	a,#31
 774  000f b700          	ld	_iStep,a
 775                     ; 237 	mStep[iStep] = 0;
 777  0011 5f            	clrw	x
 778  0012 97            	ld	xl,a
 779  0013 58            	sllw	x
 780  0014 905f          	clrw	y
 781  0016 ef01          	ldw	(_mStep,x),y
 782                     ; 240 	if ( Drive.Run || (Drive.Position==Target) ) return;
 784  0018 b667          	ld	a,_Drive+1
 785  001a 2653          	jrne	L441
 787  001c be6b          	ldw	x,_Drive+5
 788  001e 1301          	cpw	x,(OFST+1,sp)
 791  0020 274d          	jreq	L441
 792                     ; 241 	if ( Target == 0 )				//  goto origin
 794  0022 1e01          	ldw	x,(OFST+1,sp)
 795  0024 261a          	jrne	L532
 796                     ; 243 		Drive.ZeroOffset = CPulse( OVER_STEP );
 798  0026 a61e          	ld	a,#30
 799  0028 cd0000        	call	_CPulse
 801  002b bf72          	ldw	_Drive+12,x
 802                     ; 244 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
 804  002d be6b          	ldw	x,_Drive+5
 805  002f 72bb0072      	addw	x,_Drive+12
 806  0033 bf6b          	ldw	_Drive+5,x
 807                     ; 245 		Drive.Overrun =	Drive.Target = 0u;
 809  0035 5f            	clrw	x
 810  0036 bf6d          	ldw	_Drive+7,x
 811  0038 bf6f          	ldw	_Drive+9,x
 812                     ; 246 		Drive.Dir = nMotorClose;
 814  003a 72150068      	bres	_Drive+2,#2
 816  003e 2028          	jra	L732
 817  0040               L532:
 818                     ; 250 		if (Drive.Position >= Target)	// Closing
 820  0040 be6b          	ldw	x,_Drive+5
 821  0042 1301          	cpw	x,(OFST+1,sp)
 822  0044 250b          	jrult	L142
 823                     ; 252 			Drive.Overrun =	Drive.Overrun2 = 0u;
 825  0046 3f71          	clr	_Drive+11
 826  0048 5f            	clrw	x
 827  0049 bf6f          	ldw	_Drive+9,x
 828                     ; 253 			Drive.Dir = nMotorClose;
 830  004b 72150068      	bres	_Drive+2,#2
 832  004f 2008          	jra	L342
 833  0051               L142:
 834                     ; 257 			Drive.Overrun2 = overrun;
 836  0051 7b05          	ld	a,(OFST+5,sp)
 837  0053 b771          	ld	_Drive+11,a
 838                     ; 258 			Drive.Dir = nMotorOpen;
 840  0055 72140068      	bset	_Drive+2,#2
 841  0059               L342:
 842                     ; 260 		Drive.Target = Target + Drive.Overrun2;
 844  0059 7b01          	ld	a,(OFST+1,sp)
 845  005b 97            	ld	xl,a
 846  005c 7b02          	ld	a,(OFST+2,sp)
 847  005e bb71          	add	a,_Drive+11
 848  0060 2401          	jrnc	L241
 849  0062 5c            	incw	x
 850  0063               L241:
 851  0063 b76e          	ld	_Drive+8,a
 852  0065 9f            	ld	a,xl
 853  0066 b76d          	ld	_Drive+7,a
 854  0068               L732:
 855                     ; 262 	Drive.Run = TRUE;
 857  0068 35010067      	mov	_Drive+1,#1
 858                     ; 263 	Drive.Ticks = Drive.Interval;
 860  006c 45797a        	mov	_Drive+20,_Drive+19
 861                     ; 264 }
 862  006f               L441:
 865  006f 85            	popw	x
 866  0070 81            	ret	
 891                     ; 266 u8	ZeroPos(void)
 891                     ; 267 {
 892                     .text:	section	.text,new
 893  0000               _ZeroPos:
 897                     ; 268 	if( Drive.Run != 0 )
 899  0000 b667          	ld	a,_Drive+1
 900  0002 2702          	jreq	L552
 901                     ; 269 		return 0;
 903  0004 4f            	clr	a
 906  0005 81            	ret	
 907  0006               L552:
 908                     ; 270 	if( Drive.Origin == 1 )
 910  0006 b669          	ld	a,_Drive+3
 911  0008 4a            	dec	a
 912  0009 2602          	jrne	L752
 913                     ; 271 		return 1;
 915  000b 4c            	inc	a
 918  000c 81            	ret	
 919  000d               L752:
 920                     ; 273 	StartDriveOR(0u, OFFSET_OVERRUN);	// Goto Zero position
 922  000d 4b00          	push	#0
 923  000f 5f            	clrw	x
 924  0010 cd0000        	call	_StartDriveOR
 926  0013 84            	pop	a
 927                     ; 274 	return 0;
 929  0014 4f            	clr	a
 932  0015 81            	ret	
 970                     ; 277 void	LightControl(uint16_t t)
 970                     ; 278 {
 971                     .text:	section	.text,new
 972  0000               _LightControl:
 974  0000 89            	pushw	x
 975       00000000      OFST:	set	0
 978                     ; 279 	if ( Diff (Timer.Led, ledint) == 0 )
 980  0001 be01          	ldw	x,_ledint
 981  0003 89            	pushw	x
 982  0004 be41          	ldw	x,_Timer
 983  0006 cd0000        	call	_Diff
 985  0009 4d            	tnz	a
 986  000a 85            	popw	x
 987  000b 270d          	jreq	L061
 988                     ; 280 		return;
 990                     ; 281 	Timer.Led = t;
 992  000d 1e01          	ldw	x,(OFST+1,sp)
 993  000f bf41          	ldw	_Timer,x
 994                     ; 282 	LightToggle
 996  0011 4b04          	push	#4
 997  0013 ae5000        	ldw	x,#20480
 998  0016 cd0000        	call	_GPIO_WriteReverse
1000  0019 84            	pop	a
1001                     ; 284 }
1002  001a               L061:
1005  001a 85            	popw	x
1006  001b 81            	ret	
1044                     ; 286 void MotorService(uint8_t step)
1044                     ; 287 {
1045                     .text:	section	.text,new
1046  0000               _MotorService:
1048  0000 88            	push	a
1049       00000000      OFST:	set	0
1052                     ; 288 	if ( step > 205u ) step = 205u;
1054  0001 a1ce          	cp	a,#206
1055  0003 2504          	jrult	L713
1058  0005 a6cd          	ld	a,#205
1059  0007 6b01          	ld	(OFST+1,sp),a
1060  0009               L713:
1061                     ; 289 	if ( step < 20u ) step = 0u;
1063  0009 7b01          	ld	a,(OFST+1,sp)
1064  000b a114          	cp	a,#20
1065  000d 2402          	jruge	L123
1068  000f 0f01          	clr	(OFST+1,sp)
1069  0011               L123:
1070                     ; 290 	StartDriveOR( CPulse(step), OFFSET_OVERRUN );
1072  0011 4b00          	push	#0
1073  0013 7b02          	ld	a,(OFST+2,sp)
1074  0015 cd0000        	call	_CPulse
1076  0018 cd0000        	call	_StartDriveOR
1078  001b be81          	ldw	x,_Ticks_1mS
1079  001d bf43          	ldw	_Timer+2,x
1080  001f 84            	pop	a
1081                     ; 291 	Timer.Motor = Ticks_1mS;
1083                     ; 292 }
1086  0020 84            	pop	a
1087  0021 81            	ret	
1112                     ; 294 void StopDrive(void)
1112                     ; 295 {
1113                     .text:	section	.text,new
1114  0000               _StopDrive:
1118                     ; 296 	_L_X1 _L_X2 _L_Y1 _L_Y2
1120  0000 4b40          	push	#64
1121  0002 ae500a        	ldw	x,#20490
1122  0005 cd0000        	call	_GPIO_WriteLow
1124  0008 84            	pop	a
1127  0009 4b80          	push	#128
1128  000b ae500a        	ldw	x,#20490
1129  000e cd0000        	call	_GPIO_WriteLow
1131  0011 84            	pop	a
1134  0012 4b08          	push	#8
1135  0014 ae500a        	ldw	x,#20490
1136  0017 cd0000        	call	_GPIO_WriteLow
1138  001a 84            	pop	a
1141  001b 4b08          	push	#8
1142  001d ae5000        	ldw	x,#20480
1143  0020 cd0000        	call	_GPIO_WriteLow
1145  0023 3f67          	clr	_Drive+1
1146  0025 84            	pop	a
1147                     ; 297 	Drive.Run = FALSE;
1149                     ; 298 }
1152  0026 81            	ret	
1179                     ; 302 void DriveService(void)
1179                     ; 303 {
1180                     .text:	section	.text,new
1181  0000               _DriveService:
1183  0000 89            	pushw	x
1184       00000002      OFST:	set	2
1187                     ; 304 	if ( !Drive.Run ) 
1189  0001 b667          	ld	a,_Drive+1
1190                     ; 306 		StopDrive();
1192                     ; 307 		return;
1194  0003 2732          	jreq	LC009
1195                     ; 309 	if ( Drive.Target > Drive.Position )
1197  0005 be6d          	ldw	x,_Drive+7
1198  0007 b36b          	cpw	x,_Drive+5
1199  0009 2307          	jrule	L543
1200                     ; 311 	 	MotorStep(nMotorOpen);
1202  000b a601          	ld	a,#1
1203  000d cd0000        	call	_MotorStep
1205                     ; 312 		return;
1206  0010               L412:
1209  0010 85            	popw	x
1210  0011 81            	ret	
1211  0012               L543:
1212                     ; 314 	if ( Drive.Target < Drive.Position )
1214  0012 b36b          	cpw	x,_Drive+5
1215  0014 2405          	jruge	L743
1216                     ; 316 		MotorClose( );
1218  0016 cd0000        	call	_MotorClose
1220                     ; 317 		return;
1222  0019 20f5          	jra	L412
1223  001b               L743:
1224                     ; 319 	if ( Drive.Target ) 	// on target position
1226  001b be6d          	ldw	x,_Drive+7
1227  001d 2713          	jreq	L153
1228                     ; 321 		if ( Drive.Overrun2 )
1230  001f b671          	ld	a,_Drive+11
1231  0021 270f          	jreq	L153
1232                     ; 323 			Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1234  0023 5f            	clrw	x
1235  0024 97            	ld	xl,a
1236  0025 1f01          	ldw	(OFST-1,sp),x
1238  0027 be6d          	ldw	x,_Drive+7
1239  0029 72f001        	subw	x,(OFST-1,sp)
1240  002c bf6d          	ldw	_Drive+7,x
1241                     ; 324 			Drive.Overrun2 = 0u;
1243  002e 3f71          	clr	_Drive+11
1244                     ; 325 			return;
1246  0030 20de          	jra	L412
1247  0032               L153:
1248                     ; 329 	Drive.ZeroOffset = Drive.Overrun = 0u;
1250  0032 5f            	clrw	x
1251  0033 bf6f          	ldw	_Drive+9,x
1252  0035 bf72          	ldw	_Drive+12,x
1253                     ; 330 	StopDrive();	
1255  0037               LC009:
1257  0037 cd0000        	call	_StopDrive
1259                     ; 331 }
1261  003a 20d4          	jra	L412
1288                     ; 333 void AdcService(void)
1288                     ; 334 {
1289                     .text:	section	.text,new
1290  0000               _AdcService:
1294                     ; 335 	if ( Diff ( Timer.Adc, 10u )!= 1 )
1296  0000 ae000a        	ldw	x,#10
1297  0003 89            	pushw	x
1298  0004 be45          	ldw	x,_Timer+4
1299  0006 cd0000        	call	_Diff
1301  0009 4a            	dec	a
1302  000a 85            	popw	x
1303  000b 2701          	jreq	L563
1304                     ; 336 		return;
1307  000d 81            	ret	
1308  000e               L563:
1309                     ; 343 	Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
1311  000e be49          	ldw	x,_Adc
1312  0010 54            	srlw	x
1313  0011 54            	srlw	x
1314  0012 b653          	ld	a,_Adc+10
1315  0014 905f          	clrw	y
1316  0016 9097          	ld	yl,a
1317  0018 01            	rrwa	x,a
1318  0019 90e750        	ld	(_Adc+7,y),a
1319                     ; 345 	Adc.IdxAvg = (Adc.IdxAvg + 1) % 4; 
1321  001c 5f            	clrw	x
1322  001d b653          	ld	a,_Adc+10
1323  001f 97            	ld	xl,a
1324  0020 5c            	incw	x
1325  0021 a604          	ld	a,#4
1326  0023 cd0000        	call	c_smodx
1328  0026 01            	rrwa	x,a
1329  0027 b753          	ld	_Adc+10,a
1330                     ; 346 	Timer.Adc = Ticks_1mS;
1332  0029 be81          	ldw	x,_Ticks_1mS
1333  002b bf45          	ldw	_Timer+4,x
1334                     ; 347 }
1337  002d 81            	ret	
1381                     ; 351 void	MotorStepPhase(uint8_t dir)
1381                     ; 352 {
1382                     .text:	section	.text,new
1383  0000               _MotorStepPhase:
1385  0000 88            	push	a
1386       00000001      OFST:	set	1
1389                     ; 353 	uint8_t offset = 0;
1391                     ; 354 	if( dir == 1 )
1393  0001 4a            	dec	a
1394  0002 2611          	jrne	L114
1395                     ; 356 		Drive.Position--;
1397  0004 be6b          	ldw	x,_Drive+5
1398  0006 5a            	decw	x
1399  0007 bf6b          	ldw	_Drive+5,x
1400                     ; 357 		offset = Drive.NormalOpen ? 1 : -1;
1402  0009 7201006a03    	btjf	_Drive+4,#0,L422
1403  000e 4c            	inc	a
1404  000f 2014          	jra	L232
1405  0011               L422:
1406  0011 a6ff          	ld	a,#255
1408  0013 2010          	jra	L232
1409  0015               L114:
1410                     ; 361 		Drive.Position++;
1412  0015 be6b          	ldw	x,_Drive+5
1413  0017 5c            	incw	x
1414  0018 bf6b          	ldw	_Drive+5,x
1415                     ; 362 		offset = Drive.NormalOpen ? -1 : 1;
1417  001a 7201006a04    	btjf	_Drive+4,#0,L032
1418  001f a6ff          	ld	a,#255
1419  0021 2002          	jra	L232
1420  0023               L032:
1421  0023 a601          	ld	a,#1
1422  0025               L232:
1424                     ; 364 	Drive.Phase += offset;
1426  0025 bb74          	add	a,_Drive+14
1427  0027 b774          	ld	_Drive+14,a
1428                     ; 365 }
1431  0029 84            	pop	a
1432  002a 81            	ret	
1457                     ; 367 void	MotorStepSetOverrun(void)
1457                     ; 368 {
1458                     .text:	section	.text,new
1459  0000               _MotorStepSetOverrun:
1463                     ; 369 	Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1465  0000 be77          	ldw	x,_Drive+17
1466  0002 1d0028        	subw	x,#40
1467                     ; 370 	if ( Drive.MaxOverrun > OVERRUN )
1469  0005 a3012d        	cpw	x,#301
1470  0008 2503          	jrult	L524
1471                     ; 371 		Drive.MaxOverrun = OVERRUN;				
1473  000a ae012c        	ldw	x,#300
1474  000d               L524:
1475  000d bf75          	ldw	_Drive+15,x
1476                     ; 372 }
1479  000f 81            	ret	
1539                     ; 374 void MotorStep(MOTOR_DIR Dir)
1539                     ; 375 {
1540                     .text:	section	.text,new
1541  0000               _MotorStep:
1545                     ; 376 	if ( Dir == nMotorClose )
1547  0000 4d            	tnz	a
1548  0001 261a          	jrne	L554
1549                     ; 378 		if ( Drive.Position != 0 ) 
1551  0003 be6b          	ldw	x,_Drive+5
1552  0005 2704          	jreq	L754
1553                     ; 379 			MotorStepPhase(1);
1555  0007 4c            	inc	a
1556  0008 cd0000        	call	_MotorStepPhase
1558  000b               L754:
1559                     ; 381 		if ( Drive.Position == 0 ) 
1561  000b be6b          	ldw	x,_Drive+5
1562  000d 2628          	jrne	L364
1563                     ; 383 			Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0u;
1565  000f 5f            	clrw	x
1566  0010 bf6d          	ldw	_Drive+7,x
1567  0012 bf6b          	ldw	_Drive+5,x
1568  0014 bf72          	ldw	_Drive+12,x
1569  0016 bf6f          	ldw	_Drive+9,x
1570                     ; 384 			StopDrive();	
1572  0018 cd0000        	call	_StopDrive
1574  001b 201a          	jra	L364
1575  001d               L554:
1576                     ; 390 		MotorStepPhase(0);
1578  001d 4f            	clr	a
1579  001e cd0000        	call	_MotorStepPhase
1581                     ; 392 		if ( Drive.Origin ) 
1583  0021 b669          	ld	a,_Drive+3
1584  0023 270a          	jreq	L564
1585                     ; 394 			Drive.ORGPosition = Drive.Position;
1587  0025 be6b          	ldw	x,_Drive+5
1588  0027 bf77          	ldw	_Drive+17,x
1589                     ; 395 			Drive.LastOrigin = TRUE;
1591  0029 72120068      	bset	_Drive+2,#1
1593  002d 2008          	jra	L364
1594  002f               L564:
1595                     ; 399 			if ( Drive.LastOrigin )
1597  002f 7203006803    	btjf	_Drive+2,#1,L364
1598                     ; 400 				MotorStepSetOverrun();
1600  0034 cd0000        	call	_MotorStepSetOverrun
1602  0037               L364:
1603                     ; 403 	phase_excite(Drive.Phase%8);
1605  0037 b674          	ld	a,_Drive+14
1606  0039 a407          	and	a,#7
1608                     ; 404 }
1611  003b cc0000        	jp	_phase_excite
1637                     ; 406 void MotorClose(void)
1637                     ; 407 {
1638                     .text:	section	.text,new
1639  0000               _MotorClose:
1643                     ; 408 	if ( !Drive.Origin )   		// Hall IC Sensing 
1645  0000 b669          	ld	a,_Drive+3
1646  0002 2603          	jrne	L305
1647                     ; 410 		MotorStep(nMotorClose);
1650                     ; 411 		return;
1653  0004 cc0000        	jp	_MotorStep
1654  0007               L305:
1655                     ; 413 	if ( Drive.Overrun >= Drive.MaxOverrun )
1657  0007 be6f          	ldw	x,_Drive+9
1658  0009 b375          	cpw	x,_Drive+15
1659  000b 250c          	jrult	L505
1660                     ; 415 		Drive.Target = Drive.Position = Drive.Overrun = Drive.ZeroOffset = 0u;
1662  000d 5f            	clrw	x
1663  000e bf72          	ldw	_Drive+12,x
1664  0010 bf6f          	ldw	_Drive+9,x
1665  0012 bf6b          	ldw	_Drive+5,x
1666  0014 bf6d          	ldw	_Drive+7,x
1667                     ; 416 		StopDrive();
1670                     ; 417 		return;
1673  0016 cc0000        	jp	_StopDrive
1674  0019               L505:
1675                     ; 419 	Drive.Overrun++;
1677  0019 5c            	incw	x
1678  001a bf6f          	ldw	_Drive+9,x
1679                     ; 420 	MotorStep(nMotorClose);
1681  001c 4f            	clr	a
1683                     ; 421 }
1686  001d cc0000        	jp	_MotorStep
1713                     ; 423 void Clock_Config(void)
1713                     ; 424 {
1714                     .text:	section	.text,new
1715  0000               _Clock_Config:
1719                     ; 425 	CLK_DeInit();
1721  0000 cd0000        	call	_CLK_DeInit
1723                     ; 426 	CLK_HSICmd(ENABLE);
1725  0003 a601          	ld	a,#1
1726  0005 cd0000        	call	_CLK_HSICmd
1728                     ; 427 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1730  0008 4f            	clr	a
1731  0009 cd0000        	call	_CLK_HSIPrescalerConfig
1733                     ; 428 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
1735  000c a680          	ld	a,#128
1737                     ; 429 }
1740  000e cc0000        	jp	_CLK_SYSCLKConfig
1765                     ; 431 void Gpio_Config(void)
1765                     ; 432 {
1766                     .text:	section	.text,new
1767  0000               _Gpio_Config:
1771                     ; 433   	GPIO_Init(_LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1773  0000 4be0          	push	#224
1774  0002 4b04          	push	#4
1775  0004 ae5000        	ldw	x,#20480
1776  0007 cd0000        	call	_GPIO_Init
1778  000a 85            	popw	x
1779                     ; 434   	GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
1781  000b 4b00          	push	#0
1782  000d 4b10          	push	#16
1783  000f ae5005        	ldw	x,#20485
1784  0012 cd0000        	call	_GPIO_Init
1786  0015 85            	popw	x
1787                     ; 436 	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1789  0016 4be0          	push	#224
1790  0018 4b40          	push	#64
1791  001a ae500a        	ldw	x,#20490
1792  001d cd0000        	call	_GPIO_Init
1794  0020 85            	popw	x
1795                     ; 437 	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1797  0021 4be0          	push	#224
1798  0023 4b80          	push	#128
1799  0025 ae500a        	ldw	x,#20490
1800  0028 cd0000        	call	_GPIO_Init
1802  002b 85            	popw	x
1803                     ; 438 	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1805  002c 4be0          	push	#224
1806  002e 4b08          	push	#8
1807  0030 ae500a        	ldw	x,#20490
1808  0033 cd0000        	call	_GPIO_Init
1810  0036 85            	popw	x
1811                     ; 439 	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1813  0037 4be0          	push	#224
1814  0039 4b08          	push	#8
1815  003b ae5000        	ldw	x,#20480
1816  003e cd0000        	call	_GPIO_Init
1818  0041 85            	popw	x
1819                     ; 440 	StopDrive();
1821  0042 cd0000        	call	_StopDrive
1823                     ; 442 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
1825  0045 4b00          	push	#0
1826  0047 4b04          	push	#4
1827  0049 ae500f        	ldw	x,#20495
1828  004c cd0000        	call	_GPIO_Init
1830  004f 85            	popw	x
1831                     ; 443 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
1833  0050 4b00          	push	#0
1834  0052 4b10          	push	#16
1835  0054 ae500f        	ldw	x,#20495
1836  0057 cd0000        	call	_GPIO_Init
1838  005a 85            	popw	x
1839                     ; 444 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
1841  005b 4b00          	push	#0
1842  005d 4b10          	push	#16
1843  005f ae500a        	ldw	x,#20490
1844  0062 cd0000        	call	_GPIO_Init
1846  0065 85            	popw	x
1847                     ; 445 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
1849  0066 4b00          	push	#0
1850  0068 4b08          	push	#8
1851  006a ae500f        	ldw	x,#20495
1852  006d cd0000        	call	_GPIO_Init
1854  0070 85            	popw	x
1855                     ; 446 }
1858  0071 81            	ret	
1881                     ; 448 OnTimer_1S(void) {}
1882                     .text:	section	.text,new
1883  0000               _OnTimer_1S:
1890  0000 81            	ret	
1893                     	bsct
1894  0005               __chan:
1895  0005 03            	dc.b	3
1896  0006 04            	dc.b	4
1897  0007 02            	dc.b	2
1898  0008               __chanSchmit:
1899  0008 03            	dc.b	3
1900  0009 04            	dc.b	4
1901  000a 02            	dc.b	2
1902  000b               __chanId:
1903  000b 01            	dc.b	1
1904  000c 02            	dc.b	2
1905  000d 00            	dc.b	0
1934                     ; 454 static void Adc_Config( void )
1934                     ; 455 {
1935                     .text:	section	.text,new
1936  0000               L735_Adc_Config:
1940                     ; 456 	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
1942  0000 cd0000        	call	_ADC1_GetConversionValue
1944  0003 b64f          	ld	a,_Adc+6
1945  0005 905f          	clrw	y
1946  0007 9097          	ld	yl,a
1947  0009 9058          	sllw	y
1948  000b 90ef49        	ldw	(_Adc,y),x
1949                     ; 457 	ADC1_DeInit();
1951  000e cd0000        	call	_ADC1_DeInit
1953                     ; 458 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
1953                     ; 459 		_chan[Adc.Idx], 
1953                     ; 460 		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
1953                     ; 461 		_chanSchmit[Adc.Idx],
1953                     ; 462 	   	DISABLE
1953                     ; 463 		);
1955  0011 4b00          	push	#0
1956  0013 b64f          	ld	a,_Adc+6
1957  0015 5f            	clrw	x
1958  0016 97            	ld	xl,a
1959  0017 e608          	ld	a,(__chanSchmit,x)
1960  0019 88            	push	a
1961  001a 4b08          	push	#8
1962  001c 4b00          	push	#0
1963  001e 4b00          	push	#0
1964  0020 4b00          	push	#0
1965  0022 b64f          	ld	a,_Adc+6
1966  0024 5f            	clrw	x
1967  0025 97            	ld	xl,a
1968  0026 e605          	ld	a,(__chan,x)
1969  0028 5f            	clrw	x
1970  0029 97            	ld	xl,a
1971  002a cd0000        	call	_ADC1_Init
1973  002d 5b06          	addw	sp,#6
1974                     ; 464 	Adc.Idx = _chanId[Adc.Idx];
1976  002f b64f          	ld	a,_Adc+6
1977  0031 5f            	clrw	x
1978  0032 97            	ld	xl,a
1979  0033 e60b          	ld	a,(__chanId,x)
1980  0035 b74f          	ld	_Adc+6,a
1981                     ; 465 	ADC1_StartConversion();		
1984                     ; 466 }
1987  0037 cc0000        	jp	_ADC1_StartConversion
2015                     ; 468 void OnTimer4(void)
2015                     ; 469 {
2016                     .text:	section	.text,new
2017  0000               _OnTimer4:
2021                     ; 473 	Ticks_50uS++;
2023  0000 3c83          	inc	_Ticks_50uS
2024                     ; 474 	if( Ticks_50uS >= 20 )
2026  0002 b683          	ld	a,_Ticks_50uS
2027  0004 a114          	cp	a,#20
2028  0006 2507          	jrult	L165
2029                     ; 476 		Ticks_50uS = 0;
2031  0008 3f83          	clr	_Ticks_50uS
2032                     ; 477 		Ticks_1mS++;
2034  000a be81          	ldw	x,_Ticks_1mS
2035  000c 5c            	incw	x
2036  000d bf81          	ldw	_Ticks_1mS,x
2037  000f               L165:
2038                     ; 480 	if( Drive.Ticks )
2040  000f b67a          	ld	a,_Drive+20
2041  0011 2706          	jreq	L365
2042                     ; 481 		Drive.Ticks--;
2044  0013 3a7a          	dec	_Drive+20
2046  0015 a601          	ld	a,#1
2047  0017 2003          	jra	L565
2048  0019               L365:
2049                     ; 484 		Drive.MotorRun = 1;
2051  0019 4c            	inc	a
2052  001a b77d          	ld	_Drive+23,a
2053  001c               L565:
2054                     ; 491 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
2056  001c cd0000        	call	_TIM4_ClearITPendingBit
2058                     ; 492 	TIM4_ClearFlag(TIM4_IT_UPDATE);
2060  001f a601          	ld	a,#1
2062                     ; 493 }
2065  0021 cc0000        	jp	_TIM4_ClearFlag
2089                     ; 495 void OnCaptureOVTim2(void)
2089                     ; 496 {
2090                     .text:	section	.text,new
2091  0000               _OnCaptureOVTim2:
2095                     ; 502 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
2097  0000 a601          	ld	a,#1
2099                     ; 504 }	
2102  0002 cc0000        	jp	_TIM2_ClearITPendingBit
2143                     ; 506 void OnCaptureTim2(void)
2143                     ; 507 {
2144                     .text:	section	.text,new
2145  0000               _OnCaptureTim2:
2147  0000 89            	pushw	x
2148       00000002      OFST:	set	2
2151                     ; 510 	if ( TIM2_GetITStatus( TIM2_IT_CC1) == SET )
2153  0001 a602          	ld	a,#2
2154  0003 cd0000        	call	_TIM2_GetITStatus
2156  0006 4a            	dec	a
2157  0007 2611          	jrne	L716
2158                     ; 512 		t = TIM2_GetCapture1();	
2160  0009 cd0000        	call	_TIM2_GetCapture1
2162  000c 1f01          	ldw	(OFST-1,sp),x
2164                     ; 513 		Pwm.T10 = t;	
2166  000e bf5a          	ldw	_Pwm+6,x
2167                     ; 514 		Pwm.T20 = TIM2_GetCapture2();
2169  0010 cd0000        	call	_TIM2_GetCapture2
2171  0013 bf5c          	ldw	_Pwm+8,x
2172                     ; 516 		TIM2_ClearITPendingBit(TIM2_IT_CC1);
2174  0015 a602          	ld	a,#2
2175  0017 cd0000        	call	_TIM2_ClearITPendingBit
2178  001a               L716:
2179                     ; 521 	if ( TIM2_GetITStatus( TIM2_IT_CC2) == SET ) 
2181  001a a604          	ld	a,#4
2182  001c cd0000        	call	_TIM2_GetITStatus
2184  001f 4a            	dec	a
2185  0020 2619          	jrne	L126
2186                     ; 523 		t = TIM2_GetCapture2();	
2188  0022 cd0000        	call	_TIM2_GetCapture2
2190  0025 1f01          	ldw	(OFST-1,sp),x
2192                     ; 524 		Pwm.T2 = t;	
2194  0027 bf60          	ldw	_Pwm+12,x
2195                     ; 525 		Pwm.T1 = TIM2_GetCapture1();
2197  0029 cd0000        	call	_TIM2_GetCapture1
2199  002c bf5e          	ldw	_Pwm+10,x
2200                     ; 527 		TIM2_ClearITPendingBit(TIM2_IT_CC2);
2202  002e a604          	ld	a,#4
2203  0030 cd0000        	call	_TIM2_ClearITPendingBit
2205                     ; 530 		Pwm.Count = Pwm.T20 - Pwm.T10;
2207  0033 be5c          	ldw	x,_Pwm+8
2208  0035 72b0005a      	subw	x,_Pwm+6
2209  0039 bf64          	ldw	_Pwm+16,x
2210  003b               L126:
2211                     ; 533 		iDuty = (iDuty + 1) % 64;
2214  003b b688          	ld	a,_iDuty
2215  003d 5f            	clrw	x
2216  003e 97            	ld	xl,a
2217  003f 5c            	incw	x
2218  0040 a640          	ld	a,#64
2219  0042 cd0000        	call	c_smodx
2221  0045 01            	rrwa	x,a
2222  0046 b788          	ld	_iDuty,a
2223                     ; 534 		dutyBuffer[iDuty] = (t>>4);
2225  0048 1e01          	ldw	x,(OFST-1,sp)
2226  004a 54            	srlw	x
2227  004b 54            	srlw	x
2228  004c 54            	srlw	x
2229  004d 54            	srlw	x
2230  004e 905f          	clrw	y
2231  0050 9097          	ld	yl,a
2232  0052 01            	rrwa	x,a
2233  0053 90e789        	ld	(_dutyBuffer,y),a
2234                     ; 536 	return;
2237  0056 85            	popw	x
2238  0057 81            	ret	
2270                     ; 560 void Timer_Config(void)
2270                     ; 561 {
2271                     .text:	section	.text,new
2272  0000               _Timer_Config:
2276                     ; 562   TIM4_DeInit();
2278  0000 cd0000        	call	_TIM4_DeInit
2280                     ; 563 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);  //  16 * 0x32 = 50uS  Ticks 
2282  0003 ae0432        	ldw	x,#1074
2283  0006 cd0000        	call	_TIM4_TimeBaseInit
2285                     ; 565   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2287  0009 ae0101        	ldw	x,#257
2288  000c cd0000        	call	_TIM4_ITConfig
2290                     ; 566   TIM4_Cmd(ENABLE);
2292  000f a601          	ld	a,#1
2293  0011 cd0000        	call	_TIM4_Cmd
2295                     ; 568 	TIM2_DeInit();	
2297  0014 cd0000        	call	_TIM2_DeInit
2299                     ; 569 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 0xffff);
2301  0017 aeffff        	ldw	x,#65535
2302  001a 89            	pushw	x
2303  001b a606          	ld	a,#6
2304  001d cd0000        	call	_TIM2_TimeBaseInit
2306  0020 85            	popw	x
2307                     ; 571 	TIM2_PWMIConfig(	TIM2_CHANNEL_1,
2307                     ; 572 										TIM2_ICPOLARITY_FALLING, 
2307                     ; 573 										TIM2_ICSELECTION_DIRECTTI,
2307                     ; 574 										TIM2_ICPSC_DIV8,
2307                     ; 575 										0x0 );
2309  0021 4b00          	push	#0
2310  0023 4b0c          	push	#12
2311  0025 4b01          	push	#1
2312  0027 ae0044        	ldw	x,#68
2313  002a cd0000        	call	_TIM2_PWMIConfig
2315  002d 5b03          	addw	sp,#3
2316                     ; 581 	TIM2_ITConfig(/*TIM2_IT_UPDATE |*/ TIM2_IT_CC1 | TIM2_IT_CC2, ENABLE);
2318  002f ae0601        	ldw	x,#1537
2319  0032 cd0000        	call	_TIM2_ITConfig
2321                     ; 583 	TIM2_Cmd(ENABLE);
2323  0035 a601          	ld	a,#1
2325                     ; 584 }
2328  0037 cc0000        	jp	_TIM2_Cmd
2400                     ; 587 void main(void)
2400                     ; 588 {
2401                     .text:	section	.text,new
2402  0000               _main:
2404  0000 520c          	subw	sp,#12
2405       0000000c      OFST:	set	12
2408                     ; 591 	Ticks_1mS = Ticks_50uS = Pwm.Edge = 0;
2410  0002 72110058      	bres	_Pwm+4,#0
2411  0006 3f83          	clr	_Ticks_50uS
2412  0008 5f            	clrw	x
2413  0009 bf81          	ldw	_Ticks_1mS,x
2414                     ; 592 	Clock_Config();
2416  000b cd0000        	call	_Clock_Config
2418                     ; 593 	Gpio_Config();
2420  000e cd0000        	call	_Gpio_Config
2422                     ; 594 	Timer_Config();
2424  0011 cd0000        	call	_Timer_Config
2426                     ; 595 	StopDrive();
2428  0014 cd0000        	call	_StopDrive
2430                     ; 597 	Adc.Idx = 2;
2432  0017 3502004f      	mov	_Adc+6,#2
2433                     ; 598 	Adc_Config();
2435  001b cd0000        	call	L735_Adc_Config
2437                     ; 600 	Drive.Enabled = ENABLED;
2439  001e 72100066      	bset	_Drive,#0
2440                     ; 601 	Drive.MaxOverrun = OVERRUN;				// Zero position over run
2442  0022 ae012c        	ldw	x,#300
2443  0025 bf75          	ldw	_Drive+15,x
2444                     ; 602 	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
2446  0027 bf7b          	ldw	_Drive+21,x
2447                     ; 603 	Drive.Position = Drive.Stage = 0;
2449  0029 3f80          	clr	_Drive+26
2450  002b 5f            	clrw	x
2451  002c bf6b          	ldw	_Drive+5,x
2452                     ; 604 	Drive.Dir = nMotorClose;
2454  002e 72150068      	bres	_Drive+2,#2
2455                     ; 605 	Drive.Interval = 15u;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
2457  0032 350f0079      	mov	_Drive+19,#15
2458                     ; 607 	enableInterrupts();
2461  0036 9a            	rim	
2463                     ; 625 	Drive.Position = CPulse(205u);
2466  0037 a6cd          	ld	a,#205
2467  0039 cd0000        	call	_CPulse
2469  003c bf6b          	ldw	_Drive+5,x
2470                     ; 627 	Timer.Led = Timer.Motor = Timer.Adc = Ticks_1mS;
2472  003e be81          	ldw	x,_Ticks_1mS
2473  0040 bf45          	ldw	_Timer+4,x
2474  0042 bf43          	ldw	_Timer+2,x
2475  0044 bf41          	ldw	_Timer,x
2476                     ; 628 	Drive.Run0 = Drive.Run;
2478  0046 b667          	ld	a,_Drive+1
2479  0048 44            	srl	a
2480  0049 90110068      	bccm	_Drive+2,#0
2481  004d               L766:
2482                     ; 632 		tt = Ticks_1mS;
2484  004d be81          	ldw	x,_Ticks_1mS
2485  004f bfc9          	ldw	_tt,x
2486                     ; 633 		LightControl(tt);
2488  0051 cd0000        	call	_LightControl
2490                     ; 634 		AdcService();
2492  0054 cd0000        	call	_AdcService
2494                     ; 647 		if( Drive.Stage == 0u )
2496  0057 b680          	ld	a,_Drive+26
2497  0059 2608          	jrne	L376
2498                     ; 649 			Drive.Stage = ZeroPos();
2500  005b cd0000        	call	_ZeroPos
2502  005e b780          	ld	_Drive+26,a
2503                     ; 650 			goto Loop;
2505  0060 cc00ef        	jra	L507
2506  0063               L376:
2507                     ; 652 		if ( Diff ( Timer.Motor, 200u ) == 0u )
2509  0063 ae00c8        	ldw	x,#200
2510  0066 89            	pushw	x
2511  0067 be43          	ldw	x,_Timer+2
2512  0069 cd0000        	call	_Diff
2514  006c 4d            	tnz	a
2515  006d 85            	popw	x
2516  006e 277f          	jreq	L507
2517                     ; 653 			goto Loop;
2519                     ; 654 		if ( Diff ( Timer.PwmUpdate, 2000u ) != 0u )
2521  0070 ae07d0        	ldw	x,#2000
2522  0073 89            	pushw	x
2523  0074 be47          	ldw	x,_Timer+6
2524  0076 cd0000        	call	_Diff
2526  0079 4d            	tnz	a
2527  007a 85            	popw	x
2528  007b 2719          	jreq	L776
2529                     ; 656 			Timer.PwmUpdate = (Ticks_1mS > 2000u) ? Ticks_1mS - 2000u : 65535u - 2000u + Ticks_1mS;
2531  007d be81          	ldw	x,_Ticks_1mS
2532  007f a307d1        	cpw	x,#2001
2533  0082 2507          	jrult	L254
2534  0084 be81          	ldw	x,_Ticks_1mS
2535  0086 1d07d0        	subw	x,#2000
2536  0089 2005          	jra	L454
2537  008b               L254:
2538  008b be81          	ldw	x,_Ticks_1mS
2539  008d 1cf82f        	addw	x,#63535
2540  0090               L454:
2541  0090 bf47          	ldw	_Timer+6,x
2542                     ; 657 			Drive.Step = 0;
2544  0092 3f7e          	clr	_Drive+24
2546  0094 200d          	jra	L107
2547  0096               L776:
2548                     ; 661 			iDuty = (iDuty + 1) % 16;
2550  0096 b688          	ld	a,_iDuty
2551  0098 5f            	clrw	x
2552  0099 97            	ld	xl,a
2553  009a 5c            	incw	x
2554  009b a610          	ld	a,#16
2555  009d cd0000        	call	c_smodx
2557  00a0 01            	rrwa	x,a
2558  00a1 b788          	ld	_iDuty,a
2559  00a3               L107:
2560                     ; 665 		Drive.PreStep = Drive.Step;
2562  00a3 457e7f        	mov	_Drive+25,_Drive+24
2563  00a6 2047          	jra	L507
2564  00a8               L307:
2565                     ; 670 			Adc_Config();
2567  00a8 cd0000        	call	L735_Adc_Config
2569                     ; 672 			if( Pwm.Calc == 1 )
2571  00ab b659          	ld	a,_Pwm+5
2572  00ad 4a            	dec	a
2573  00ae 262d          	jrne	L117
2574                     ; 674 				Pwm.Calc = 0;
2576  00b0 b759          	ld	_Pwm+5,a
2577                     ; 675 				_t1 = Pwm.T1;
2579  00b2 be5e          	ldw	x,_Pwm+10
2580  00b4 1f05          	ldw	(OFST-7,sp),x
2582                     ; 676 				_t2 = Pwm.T2;
2584  00b6 be60          	ldw	x,_Pwm+12
2585  00b8 1f07          	ldw	(OFST-5,sp),x
2587                     ; 677 				_t = (uint32_t)_t1 * 200 / _t2;
2589  00ba cd0000        	call	c_uitolx
2591  00bd 96            	ldw	x,sp
2592  00be 5c            	incw	x
2593  00bf cd0000        	call	c_rtol
2596  00c2 1e05          	ldw	x,(OFST-7,sp)
2597  00c4 a6c8          	ld	a,#200
2598  00c6 cd0000        	call	c_cmulx
2600  00c9 96            	ldw	x,sp
2601  00ca 5c            	incw	x
2602  00cb cd0000        	call	c_ludv
2604  00ce 96            	ldw	x,sp
2605  00cf 1c0009        	addw	x,#OFST-3
2606  00d2 cd0000        	call	c_rtol
2609                     ; 678 				Pwm.Duty = _t;
2611  00d5 1e0b          	ldw	x,(OFST-1,sp)
2612  00d7 bf62          	ldw	_Pwm+14,x
2613                     ; 687 				Timer.PwmUpdate = Ticks_1mS;		
2615  00d9 be81          	ldw	x,_Ticks_1mS
2616  00db bf47          	ldw	_Timer+6,x
2617  00dd               L117:
2618                     ; 689 			if ( Drive.MotorRun == 1 && Drive.Enabled ) 	// &&  ( Drive.Ticks == 0 ) ) 
2620  00dd b67d          	ld	a,_Drive+23
2621  00df 4a            	dec	a
2622  00e0 260d          	jrne	L507
2624  00e2 7201006608    	btjf	_Drive,#0,L507
2625                     ; 691 				Drive.MotorRun = 0;
2627  00e7 b77d          	ld	_Drive+23,a
2628                     ; 692 				DriveService();	
2630  00e9 cd0000        	call	_DriveService
2632                     ; 693 				Drive.Ticks = Drive.Interval;
2634  00ec 45797a        	mov	_Drive+20,_Drive+19
2635  00ef               L507:
2636                     ; 666 	Loop:		
2636                     ; 667 //		WAIT_50ms(tt);
2636                     ; 668 		while(Diff(tt, 50u)==0)
2638  00ef ae0032        	ldw	x,#50
2639  00f2 89            	pushw	x
2640  00f3 bec9          	ldw	x,_tt
2641  00f5 cd0000        	call	_Diff
2643  00f8 4d            	tnz	a
2644  00f9 85            	popw	x
2645  00fa 27ac          	jreq	L307
2647  00fc cc004d        	jra	L766
2670                     ; 699 void Test(void)
2670                     ; 700 {
2671                     .text:	section	.text,new
2672  0000               _Test:
2676                     ; 704 }
2679  0000 81            	ret	
2723                     ; 712 void assert_failed(u8* file, u32 line)
2723                     ; 713 {
2724                     .text:	section	.text,new
2725  0000               _assert_failed:
2727  0000 88            	push	a
2728       00000001      OFST:	set	1
2731  0001               L747:
2732                     ; 715   	while (1) i++;
2734  0001 0c01          	inc	(OFST+0,sp)
2737  0003 20fc          	jra	L747
3264                     	xdef	_main
3265                     	xdef	_Test
3266                     	xdef	_Timer_Config
3267                     	xdef	_OnCaptureTim2
3268                     	xdef	_OnCaptureOVTim2
3269                     	xdef	_OnTimer4
3270                     	xdef	__chanId
3271                     	xdef	__chanSchmit
3272                     	xdef	__chan
3273                     	xdef	_OnTimer_1S
3274                     	xdef	_Gpio_Config
3275                     	xdef	_Clock_Config
3276                     	xdef	_MotorStepSetOverrun
3277                     	xdef	_MotorStepPhase
3278                     	xdef	_AdcService
3279                     	xdef	_DriveService
3280                     	xdef	_MotorClose
3281                     	xdef	_MotorStep
3282                     	xdef	_StopDrive
3283                     	xdef	_MotorService
3284                     	xdef	_LightControl
3285                     	xdef	_ZeroPos
3286                     	xdef	_StartDriveOR
3287                     	xdef	_waitPowerDelay
3288                     	xdef	_stepCalc
3289                     	xdef	_stepPrepare
3290                     	xdef	_Diff
3291                     	xdef	_CPulse
3292                     	xdef	_phase_excite
3293                     	switch	.ubsct
3294  0000               _iStep:
3295  0000 00            	ds.b	1
3296                     	xdef	_iStep
3297  0001               _mStep:
3298  0001 000000000000  	ds.b	64
3299                     	xdef	_mStep
3300                     	xdef	_PowerDelay_1mS
3301  0041               _Timer:
3302  0041 000000000000  	ds.b	8
3303                     	xdef	_Timer
3304  0049               _Adc:
3305  0049 000000000000  	ds.b	11
3306                     	xdef	_Adc
3307  0054               _Pwm:
3308  0054 000000000000  	ds.b	18
3309                     	xdef	_Pwm
3310  0066               _Drive:
3311  0066 000000000000  	ds.b	27
3312                     	xdef	_Drive
3313                     	xdef	_ledint
3314  0081               _Ticks_1mS:
3315  0081 0000          	ds.b	2
3316                     	xdef	_Ticks_1mS
3317  0083               _Ticks_50uS:
3318  0083 00            	ds.b	1
3319                     	xdef	_Ticks_50uS
3320  0084               _mDuty:
3321  0084 0000          	ds.b	2
3322                     	xdef	_mDuty
3323                     	xdef	_nDuty
3324  0086               _sDuty:
3325  0086 0000          	ds.b	2
3326                     	xdef	_sDuty
3327  0088               _iDuty:
3328  0088 00            	ds.b	1
3329                     	xdef	_iDuty
3330  0089               _dutyBuffer:
3331  0089 000000000000  	ds.b	64
3332                     	xdef	_dutyBuffer
3333  00c9               _tt:
3334  00c9 0000          	ds.b	2
3335                     	xdef	_tt
3336                     	xdef	_assert_failed
3337                     	xref	_TIM4_ClearITPendingBit
3338                     	xref	_TIM4_ClearFlag
3339                     	xref	_TIM4_ITConfig
3340                     	xref	_TIM4_Cmd
3341                     	xref	_TIM4_TimeBaseInit
3342                     	xref	_TIM4_DeInit
3343                     	xref	_TIM2_ClearITPendingBit
3344                     	xref	_TIM2_GetITStatus
3345                     	xref	_TIM2_GetCapture2
3346                     	xref	_TIM2_GetCapture1
3347                     	xref	_TIM2_ITConfig
3348                     	xref	_TIM2_Cmd
3349                     	xref	_TIM2_PWMIConfig
3350                     	xref	_TIM2_TimeBaseInit
3351                     	xref	_TIM2_DeInit
3352                     	xref	_GPIO_WriteReverse
3353                     	xref	_GPIO_WriteLow
3354                     	xref	_GPIO_WriteHigh
3355                     	xref	_GPIO_Init
3356                     	xref	_CLK_SYSCLKConfig
3357                     	xref	_CLK_HSIPrescalerConfig
3358                     	xref	_CLK_HSICmd
3359                     	xref	_CLK_DeInit
3360                     	xref	_ADC1_GetConversionValue
3361                     	xref	_ADC1_StartConversion
3362                     	xref	_ADC1_Init
3363                     	xref	_ADC1_DeInit
3364                     	xref.b	c_lreg
3365                     	xref.b	c_x
3385                     	xref	c_ludv
3386                     	xref	c_rtol
3387                     	xref	c_uitolx
3388                     	xref	c_cmulx
3389                     	xref	c_smodx
3390                     	xref	c_imul
3391                     	xref	c_smul
3392                     	end
