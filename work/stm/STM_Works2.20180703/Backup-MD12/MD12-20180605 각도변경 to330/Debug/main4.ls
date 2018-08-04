   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  21                     	bsct
  22  0000               _nDuty:
  23  0000 00            	dc.b	0
  24  0001               _ledint:
  25  0001 01f4          	dc.w	500
  26  0003               _IO_LED:
  27  0003 5000          	dc.w	20480
  28  0005 04            	dc.b	4
  29  0006               _IO_ORG:
  30  0006 5005          	dc.w	20485
  31  0008 10            	dc.b	16
  32  0009               _IO_X1:
  33  0009 500a          	dc.w	20490
  34  000b 40            	dc.b	64
  35  000c               _IO_X2:
  36  000c 500a          	dc.w	20490
  37  000e 80            	dc.b	128
  38  000f               _IO_Y1:
  39  000f 500a          	dc.w	20490
  40  0011 08            	dc.b	8
  41  0012               _IO_Y2:
  42  0012 5000          	dc.w	20480
  43  0014 08            	dc.b	8
  44  0015               _IO_ADJ:
  45  0015 500a          	dc.w	20490
  46  0017 10            	dc.b	16
  47  0018               _IO_SEN:
  48  0018 500f          	dc.w	20495
  49  001a 08            	dc.b	8
  50  001b               _IO_POWER:
  51  001b 500f          	dc.w	20495
  52  001d 04            	dc.b	4
  53  001e               _IO_MOD:
  54  001e 500f          	dc.w	20495
  55  0020 10            	dc.b	16
  56  0021               _IO_BAT:
  57  0021 500f          	dc.w	20495
  58  0023 08            	dc.b	8
  59  0024               _IO_BOOST:
  60  0024 500f          	dc.w	20495
  61  0026 08            	dc.b	8
  62  0027               _IO_CHARGE:
  63  0027 500f          	dc.w	20495
  64  0029 20            	dc.b	32
 111                     ; 165 void	phase_excite(uint8_t phase)
 111                     ; 166 {
 113                     .text:	section	.text,new
 114  0000               _phase_excite:
 116  0000 88            	push	a
 117       00000000      OFST:	set	0
 120                     ; 167 	if ( !Drive.Run || !Drive.Enabled ) return;
 122  0001 b671          	ld	a,_Drive+1
 123  0003 2705          	jreq	L15
 125  0005 7200007002    	btjt	_Drive,#0,L74
 126  000a               L15:
 130  000a 84            	pop	a
 131  000b 81            	ret	
 132  000c               L74:
 133                     ; 168 	switch(phase)
 135  000c 7b01          	ld	a,(OFST+1,sp)
 137                     ; 190 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
 138  000e 271b          	jreq	L3
 139  0010 4a            	dec	a
 140  0011 2722          	jreq	L5
 141  0013 4a            	dec	a
 142  0014 2732          	jreq	L7
 143  0016 4a            	dec	a
 144  0017 2745          	jreq	L11
 145  0019 4a            	dec	a
 146  001a 274e          	jreq	L31
 147  001c 4a            	dec	a
 148  001d 2757          	jreq	L51
 149  001f 4a            	dec	a
 150  0020 2779          	jreq	L71
 151  0022 4a            	dec	a
 152  0023 2603cc00a5    	jreq	L12
 153  0028 cc00c9        	jra	L55
 154  002b               L3:
 155                     ; 183 		case 0: _H_X1 _L_X2 _H_Y1 _L_Y2 break;
 157  002b 3b000b        	push	_IO_X1+2
 158  002e be09          	ldw	x,_IO_X1
 159  0030 cd0000        	call	_GPIO_WriteHigh
 169  0033 2008          	jp	LC005
 170  0035               L5:
 171                     ; 184 		case 1: _L_X1 _L_X2 _H_Y1 _L_Y2 break;		
 173  0035 3b000b        	push	_IO_X1+2
 174  0038 be09          	ldw	x,_IO_X1
 175  003a cd0000        	call	_GPIO_WriteLow
 179  003d               LC005:
 180  003d 84            	pop	a
 182  003e 3b000e        	push	_IO_X2+2
 183  0041 be0c          	ldw	x,_IO_X2
 184  0043 cd0000        	call	_GPIO_WriteLow
 192  0046 200b          	jp	LC004
 193  0048               L7:
 194                     ; 185 		case 2: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
 196  0048 cd00cb        	call	LC008
 199  004b 3b000e        	push	_IO_X2+2
 200  004e be0c          	ldw	x,_IO_X2
 201  0050 cd0000        	call	_GPIO_WriteHigh
 205  0053               LC004:
 206  0053 84            	pop	a
 209  0054 3b0011        	push	_IO_Y1+2
 210  0057 be0f          	ldw	x,_IO_Y1
 211  0059 cd0000        	call	_GPIO_WriteHigh
 217  005c 2061          	jp	LC002
 218  005e               L11:
 219                     ; 186 		case 3: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
 221  005e ad6b          	call	LC008
 224  0060 3b000e        	push	_IO_X2+2
 225  0063 be0c          	ldw	x,_IO_X2
 226  0065 cd0000        	call	_GPIO_WriteHigh
 234  0068 204c          	jp	LC003
 235  006a               L31:
 236                     ; 187 		case 4: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
 238  006a ad5f          	call	LC008
 241  006c 3b000e        	push	_IO_X2+2
 242  006f be0c          	ldw	x,_IO_X2
 243  0071 cd0000        	call	_GPIO_WriteHigh
 251  0074 2011          	jp	LC006
 252  0076               L51:
 253                     ; 188 		case 5: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
 255  0076 3b000b        	push	_IO_X1+2
 256  0079 be09          	ldw	x,_IO_X1
 257  007b cd0000        	call	_GPIO_WriteLow
 261  007e               LC007:
 262  007e 84            	pop	a
 264  007f 3b000e        	push	_IO_X2+2
 265  0082 be0c          	ldw	x,_IO_X2
 266  0084 cd0000        	call	_GPIO_WriteLow
 273  0087               LC006:
 274  0087 84            	pop	a
 277  0088 3b0011        	push	_IO_Y1+2
 278  008b be0f          	ldw	x,_IO_Y1
 279  008d cd0000        	call	_GPIO_WriteLow
 280  0090 84            	pop	a
 283  0091 3b0014        	push	_IO_Y2+2
 284  0094 be12          	ldw	x,_IO_Y2
 285  0096 cd0000        	call	_GPIO_WriteHigh
 289  0099 202d          	jp	LC001
 290  009b               L71:
 291                     ; 189 		case 6: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
 293  009b 3b000b        	push	_IO_X1+2
 294  009e be09          	ldw	x,_IO_X1
 295  00a0 cd0000        	call	_GPIO_WriteHigh
 305  00a3 20d9          	jp	LC007
 306  00a5               L12:
 307                     ; 190 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
 309  00a5 3b000b        	push	_IO_X1+2
 310  00a8 be09          	ldw	x,_IO_X1
 311  00aa cd0000        	call	_GPIO_WriteHigh
 313  00ad 84            	pop	a
 316  00ae 3b000e        	push	_IO_X2+2
 317  00b1 be0c          	ldw	x,_IO_X2
 318  00b3 cd0000        	call	_GPIO_WriteLow
 322  00b6               LC003:
 323  00b6 84            	pop	a
 325  00b7 3b0011        	push	_IO_Y1+2
 326  00ba be0f          	ldw	x,_IO_Y1
 327  00bc cd0000        	call	_GPIO_WriteLow
 331  00bf               LC002:
 332  00bf 84            	pop	a
 337  00c0 3b0014        	push	_IO_Y2+2
 338  00c3 be12          	ldw	x,_IO_Y2
 339  00c5 cd0000        	call	_GPIO_WriteLow
 341  00c8               LC001:
 342  00c8 84            	pop	a
 345  00c9               L55:
 346                     ; 193 }
 349  00c9 84            	pop	a
 350  00ca 81            	ret	
 351  00cb               LC008:
 352  00cb 3b000b        	push	_IO_X1+2
 353  00ce be09          	ldw	x,_IO_X1
 354  00d0 cd0000        	call	_GPIO_WriteLow
 356  00d3 84            	pop	a
 357  00d4 81            	ret	
 391                     ; 195 uint16_t CPulse( u8 step )
 391                     ; 196 {
 392                     .text:	section	.text,new
 393  0000               _CPulse:
 397                     ; 197 	return (uint16_t)step * 26;  // 20180509  change to 5200 pulse
 399  0000 5f            	clrw	x
 400  0001 97            	ld	xl,a
 401  0002 90ae001a      	ldw	y,#26
 405  0006 cc0000        	jp	c_imul
 458                     ; 200 u8  Diff(uint16_t time, uint16_t diff)				
 458                     ; 201 {
 459                     .text:	section	.text,new
 460  0000               _Diff:
 462  0000 89            	pushw	x
 463  0001 89            	pushw	x
 464       00000002      OFST:	set	2
 467                     ; 202 	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
 469  0002 b38a          	cpw	x,_Ticks_1mS
 470  0004 2207          	jrugt	L211
 471  0006 be8a          	ldw	x,_Ticks_1mS
 472  0008 72f003        	subw	x,(OFST+1,sp)
 473  000b 200a          	jra	L411
 474  000d               L211:
 475  000d aeffff        	ldw	x,#65535
 476  0010 72f003        	subw	x,(OFST+1,sp)
 477  0013 72bb008a      	addw	x,_Ticks_1mS
 478  0017               L411:
 479  0017 1f01          	ldw	(OFST-1,sp),x
 481                     ; 203 	return _t > diff ? 1 : 0;
 483  0019 1307          	cpw	x,(OFST+5,sp)
 484  001b 2304          	jrule	L611
 485  001d a601          	ld	a,#1
 486  001f 2001          	jra	L021
 487  0021               L611:
 488  0021 4f            	clr	a
 489  0022               L021:
 492  0022 5b04          	addw	sp,#4
 493  0024 81            	ret	
 530                     ; 206 uint16_t	stepPrepare(uint8_t i)
 530                     ; 207 {
 531                     .text:	section	.text,new
 532  0000               _stepPrepare:
 534  0000 88            	push	a
 535       00000000      OFST:	set	0
 538                     ; 208 	sDuty -= dutyBuffer[i];
 540  0001 5f            	clrw	x
 541  0002 97            	ld	xl,a
 542  0003 e692          	ld	a,(_dutyBuffer,x)
 543  0005 5f            	clrw	x
 544  0006 97            	ld	xl,a
 545  0007 72b0008f      	subw	x,_sDuty
 546  000b 50            	negw	x
 547  000c bf8f          	ldw	_sDuty,x
 548                     ; 209 	dutyBuffer[i] = Pwm.Duty;
 550  000e 5f            	clrw	x
 551  000f 7b01          	ld	a,(OFST+1,sp)
 552  0011 97            	ld	xl,a
 553  0012 b66b          	ld	a,_Pwm+15
 554  0014 e792          	ld	(_dutyBuffer,x),a
 555                     ; 210 	sDuty += dutyBuffer[i];
 557  0016 5f            	clrw	x
 558  0017 7b01          	ld	a,(OFST+1,sp)
 559  0019 97            	ld	xl,a
 560  001a e692          	ld	a,(_dutyBuffer,x)
 561  001c bb90          	add	a,_sDuty+1
 562  001e b790          	ld	_sDuty+1,a
 563  0020 2402          	jrnc	L421
 564  0022 3c8f          	inc	_sDuty
 565  0024               L421:
 566                     ; 211 	return sDuty;
 568  0024 be8f          	ldw	x,_sDuty
 571  0026 84            	pop	a
 572  0027 81            	ret	
 617                     ; 214 uint8_t	stepCalc(uint16_t duty)
 617                     ; 215 {
 618                     .text:	section	.text,new
 619  0000               _stepCalc:
 621  0000 89            	pushw	x
 622  0001 89            	pushw	x
 623       00000002      OFST:	set	2
 626                     ; 217 	if ( nDuty < 16 )
 628  0002 b600          	ld	a,_nDuty
 629  0004 a110          	cp	a,#16
 630  0006 2404          	jruge	L361
 631                     ; 218 		nDuty ++;
 633  0008 3c00          	inc	_nDuty
 634  000a b600          	ld	a,_nDuty
 635  000c               L361:
 636                     ; 219 	mDuty = (duty / nDuty) * 2 + 1;	
 638  000c 62            	div	x,a
 639  000d 58            	sllw	x
 640  000e 5c            	incw	x
 641  000f bf8d          	ldw	_mDuty,x
 642                     ; 220 	mDuty /= 2;
 644  0011 348d          	srl	_mDuty
 645  0013 368e          	rrc	_mDuty+1
 646                     ; 221 	if( mDuty < 20 )	mDuty = 20;
 648  0015 be8d          	ldw	x,_mDuty
 649  0017 a30014        	cpw	x,#20
 650  001a 2405          	jruge	L561
 653  001c ae0014        	ldw	x,#20
 654  001f bf8d          	ldw	_mDuty,x
 655  0021               L561:
 656                     ; 222 	if( mDuty > 180 )	mDuty = 180;
 658  0021 a300b5        	cpw	x,#181
 659  0024 2505          	jrult	L761
 662  0026 ae00b4        	ldw	x,#180
 663  0029 bf8d          	ldw	_mDuty,x
 664  002b               L761:
 665                     ; 224 	t = (625 * mDuty)/10 -1250;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
 667  002b 90ae0271      	ldw	y,#625
 668  002f cd0000        	call	c_imul
 670  0032 a60a          	ld	a,#10
 671  0034 62            	div	x,a
 672  0035 1d04e2        	subw	x,#1250
 674                     ; 225 	t = (t / 25 + 1 ) /	2;
 676  0038 a619          	ld	a,#25
 677  003a 62            	div	x,a
 678  003b 5c            	incw	x
 679  003c 54            	srlw	x
 680  003d 1f01          	ldw	(OFST-1,sp),x
 682                     ; 226 	return (uint8_t)t;
 684  003f 7b02          	ld	a,(OFST+0,sp)
 687  0041 5b04          	addw	sp,#4
 688  0043 81            	ret	
 715                     ; 229 void	waitPowerDelay(void)
 715                     ; 230 {
 716                     .text:	section	.text,new
 717  0000               _waitPowerDelay:
 721                     ; 231 	LightOn
 723  0000 3b0005        	push	_IO_LED+2
 724  0003 be03          	ldw	x,_IO_LED
 725  0005 cd0000        	call	_GPIO_WriteLow
 727  0008 84            	pop	a
 729  0009               L302:
 730                     ; 232 	while( Ticks_1mS < TIME_POWERDELAY );
 732  0009 be8a          	ldw	x,_Ticks_1mS
 733  000b a301f3        	cpw	x,#499
 734  000e 25f9          	jrult	L302
 735                     ; 233 	LightOff
 737  0010 3b0005        	push	_IO_LED+2
 738  0013 be03          	ldw	x,_IO_LED
 739  0015 cd0000        	call	_GPIO_WriteHigh
 741  0018 84            	pop	a
 742                     ; 235 }
 745  0019 81            	ret	
 792                     ; 237 void StartDriveOR( uint16_t tPos, uint8_t overrun )
 792                     ; 238 {
 793                     .text:	section	.text,new
 794  0000               _StartDriveOR:
 796  0000 89            	pushw	x
 797       00000000      OFST:	set	0
 800                     ; 240 	mStep[iStep] = tPos;
 802  0001 b600          	ld	a,_iStep
 803  0003 905f          	clrw	y
 804  0005 9097          	ld	yl,a
 805  0007 9058          	sllw	y
 806  0009 90ef01        	ldw	(_mStep,y),x
 807                     ; 241 	iStep = (iStep + 1) % MAX_MOTORWATCH;
 809  000c 5f            	clrw	x
 810  000d 97            	ld	xl,a
 811  000e 5c            	incw	x
 812  000f a610          	ld	a,#16
 813  0011 cd0000        	call	c_smodx
 815  0014 01            	rrwa	x,a
 816  0015 b700          	ld	_iStep,a
 817                     ; 242 	mStep[iStep] = 0;
 819  0017 5f            	clrw	x
 820  0018 97            	ld	xl,a
 821  0019 58            	sllw	x
 822  001a 905f          	clrw	y
 823  001c ef01          	ldw	(_mStep,x),y
 824                     ; 245 	if ( Drive.Run || (Drive.Position==tPos) ) return;
 826  001e b671          	ld	a,_Drive+1
 827  0020 2653          	jrne	L441
 829  0022 be75          	ldw	x,_Drive+5
 830  0024 1301          	cpw	x,(OFST+1,sp)
 833  0026 274d          	jreq	L441
 834                     ; 246 	if ( tPos == 0 )				//  goto origin
 836  0028 1e01          	ldw	x,(OFST+1,sp)
 837  002a 261a          	jrne	L532
 838                     ; 248 		Drive.ZeroOffset = CPulse( OVER_STEP );
 840  002c a61e          	ld	a,#30
 841  002e cd0000        	call	_CPulse
 843  0031 bf7c          	ldw	_Drive+12,x
 844                     ; 249 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
 846  0033 be75          	ldw	x,_Drive+5
 847  0035 72bb007c      	addw	x,_Drive+12
 848  0039 bf75          	ldw	_Drive+5,x
 849                     ; 250 		Drive.Overrun =	Drive.Target = 0;
 851  003b 5f            	clrw	x
 852  003c bf77          	ldw	_Drive+7,x
 853  003e bf79          	ldw	_Drive+9,x
 854                     ; 251 		Drive.Dir = nMotorClose;
 856  0040 72150072      	bres	_Drive+2,#2
 858  0044 2028          	jra	L732
 859  0046               L532:
 860                     ; 255 		if (Drive.Position >= tPos)	// Closing
 862  0046 be75          	ldw	x,_Drive+5
 863  0048 1301          	cpw	x,(OFST+1,sp)
 864  004a 250b          	jrult	L142
 865                     ; 257 			Drive.Overrun =	Drive.Overrun2 = 0;
 867  004c 3f7b          	clr	_Drive+11
 868  004e 5f            	clrw	x
 869  004f bf79          	ldw	_Drive+9,x
 870                     ; 258 			Drive.Dir = nMotorClose;
 872  0051 72150072      	bres	_Drive+2,#2
 874  0055 2008          	jra	L342
 875  0057               L142:
 876                     ; 262 			Drive.Overrun2 = overrun;
 878  0057 7b05          	ld	a,(OFST+5,sp)
 879  0059 b77b          	ld	_Drive+11,a
 880                     ; 263 			Drive.Dir = nMotorOpen;
 882  005b 72140072      	bset	_Drive+2,#2
 883  005f               L342:
 884                     ; 265 		Drive.Target = tPos + Drive.Overrun2;
 886  005f 7b01          	ld	a,(OFST+1,sp)
 887  0061 97            	ld	xl,a
 888  0062 7b02          	ld	a,(OFST+2,sp)
 889  0064 bb7b          	add	a,_Drive+11
 890  0066 2401          	jrnc	L241
 891  0068 5c            	incw	x
 892  0069               L241:
 893  0069 b778          	ld	_Drive+8,a
 894  006b 9f            	ld	a,xl
 895  006c b777          	ld	_Drive+7,a
 896  006e               L732:
 897                     ; 267 	Drive.Run = TRUE;
 899  006e 35010071      	mov	_Drive+1,#1
 900                     ; 268 	Drive.Ticks = Drive.Interval;
 902  0072 458384        	mov	_Drive+20,_Drive+19
 903                     ; 269 }
 904  0075               L441:
 907  0075 85            	popw	x
 908  0076 81            	ret	
 933                     ; 271 u8	ZeroPos(void)
 933                     ; 272 {
 934                     .text:	section	.text,new
 935  0000               _ZeroPos:
 939                     ; 273 	if( Drive.Run != 0 ) return 0;
 941  0000 b671          	ld	a,_Drive+1
 942  0002 2702          	jreq	L552
 945  0004 4f            	clr	a
 948  0005 81            	ret	
 949  0006               L552:
 950                     ; 274 	if( Drive.Origin == 1 ) return 1;
 952  0006 b673          	ld	a,_Drive+3
 953  0008 4a            	dec	a
 954  0009 2602          	jrne	L752
 957  000b 4c            	inc	a
 960  000c 81            	ret	
 961  000d               L752:
 962                     ; 275 	StartDriveOR(0, OFFSET_OVERRUN);	// Goto Zero position
 964  000d 4b00          	push	#0
 965  000f 5f            	clrw	x
 966  0010 cd0000        	call	_StartDriveOR
 968  0013 84            	pop	a
 969                     ; 276 	return 0;
 971  0014 4f            	clr	a
 974  0015 81            	ret	
1013                     ; 279 void	LightControl(uint16_t t)
1013                     ; 280 {
1014                     .text:	section	.text,new
1015  0000               _LightControl:
1017  0000 89            	pushw	x
1018       00000000      OFST:	set	0
1021                     ; 281 	if ( Diff (Timer.Led, ledint) == 0 )
1023  0001 be01          	ldw	x,_ledint
1024  0003 89            	pushw	x
1025  0004 be21          	ldw	x,_Timer
1026  0006 cd0000        	call	_Diff
1028  0009 4d            	tnz	a
1029  000a 85            	popw	x
1030  000b 270d          	jreq	L061
1031                     ; 282 		return;
1033                     ; 283 	Timer.Led = t;
1035  000d 1e01          	ldw	x,(OFST+1,sp)
1036  000f bf21          	ldw	_Timer,x
1037                     ; 284 	LightToggle
1039  0011 be03          	ldw	x,_IO_LED
1040  0013 3b0005        	push	_IO_LED+2
1041  0016 cd0000        	call	_GPIO_WriteReverse
1043  0019 84            	pop	a
1044                     ; 286 }
1045  001a               L061:
1048  001a 85            	popw	x
1049  001b 81            	ret	
1087                     ; 288 void MotorService(uint8_t step)
1087                     ; 289 {
1088                     .text:	section	.text,new
1089  0000               _MotorService:
1091  0000 88            	push	a
1092       00000000      OFST:	set	0
1095                     ; 290 	if ( step > 205 ) step = 205;
1097  0001 a1ce          	cp	a,#206
1098  0003 2504          	jrult	L713
1101  0005 a6cd          	ld	a,#205
1102  0007 6b01          	ld	(OFST+1,sp),a
1103  0009               L713:
1104                     ; 291 	if ( step < 20 ) step = 0;
1106  0009 7b01          	ld	a,(OFST+1,sp)
1107  000b a114          	cp	a,#20
1108  000d 2402          	jruge	L123
1111  000f 0f01          	clr	(OFST+1,sp)
1112  0011               L123:
1113                     ; 292 	StartDriveOR( CPulse(step), OFFSET_OVERRUN );
1115  0011 4b00          	push	#0
1116  0013 7b02          	ld	a,(OFST+2,sp)
1117  0015 cd0000        	call	_CPulse
1119  0018 cd0000        	call	_StartDriveOR
1121  001b be8a          	ldw	x,_Ticks_1mS
1122  001d bf23          	ldw	_Timer+2,x
1123  001f 84            	pop	a
1124                     ; 293 	Timer.Motor = Ticks_1mS;
1126                     ; 294 }
1129  0020 84            	pop	a
1130  0021 81            	ret	
1159                     ; 296 void StopDrive(void)
1159                     ; 297 {
1160                     .text:	section	.text,new
1161  0000               _StopDrive:
1165                     ; 298 	_L_X1 _L_X2 _L_Y1 _L_Y2
1167  0000 3b000b        	push	_IO_X1+2
1168  0003 be09          	ldw	x,_IO_X1
1169  0005 cd0000        	call	_GPIO_WriteLow
1171  0008 84            	pop	a
1174  0009 3b000e        	push	_IO_X2+2
1175  000c be0c          	ldw	x,_IO_X2
1176  000e cd0000        	call	_GPIO_WriteLow
1178  0011 84            	pop	a
1181  0012 3b0011        	push	_IO_Y1+2
1182  0015 be0f          	ldw	x,_IO_Y1
1183  0017 cd0000        	call	_GPIO_WriteLow
1185  001a 84            	pop	a
1188  001b 3b0014        	push	_IO_Y2+2
1189  001e be12          	ldw	x,_IO_Y2
1190  0020 cd0000        	call	_GPIO_WriteLow
1192  0023 3f71          	clr	_Drive+1
1193  0025 84            	pop	a
1194                     ; 299 	Drive.Run = FALSE;
1196                     ; 300 }
1199  0026 81            	ret	
1226                     ; 304 void DriveService(void)
1226                     ; 305 {
1227                     .text:	section	.text,new
1228  0000               _DriveService:
1230  0000 89            	pushw	x
1231       00000002      OFST:	set	2
1234                     ; 306 	if ( !Drive.Run ) 
1236  0001 b671          	ld	a,_Drive+1
1237                     ; 308 		StopDrive();
1239                     ; 309 		return;
1241  0003 2732          	jreq	LC009
1242                     ; 311 	if ( Drive.Target > Drive.Position )
1244  0005 be77          	ldw	x,_Drive+7
1245  0007 b375          	cpw	x,_Drive+5
1246  0009 2307          	jrule	L543
1247                     ; 313 	 	MotorStep(nMotorOpen);
1249  000b a601          	ld	a,#1
1250  000d cd0000        	call	_MotorStep
1252                     ; 314 		return;
1253  0010               L412:
1256  0010 85            	popw	x
1257  0011 81            	ret	
1258  0012               L543:
1259                     ; 316 	if ( Drive.Target < Drive.Position )
1261  0012 b375          	cpw	x,_Drive+5
1262  0014 2405          	jruge	L743
1263                     ; 318 		MotorClose( );
1265  0016 cd0000        	call	_MotorClose
1267                     ; 319 		return;
1269  0019 20f5          	jra	L412
1270  001b               L743:
1271                     ; 321 	if ( Drive.Target ) 	// on target position
1273  001b be77          	ldw	x,_Drive+7
1274  001d 2713          	jreq	L153
1275                     ; 323 		if ( Drive.Overrun2 )
1277  001f b67b          	ld	a,_Drive+11
1278  0021 270f          	jreq	L153
1279                     ; 325 			Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1281  0023 5f            	clrw	x
1282  0024 97            	ld	xl,a
1283  0025 1f01          	ldw	(OFST-1,sp),x
1285  0027 be77          	ldw	x,_Drive+7
1286  0029 72f001        	subw	x,(OFST-1,sp)
1287  002c bf77          	ldw	_Drive+7,x
1288                     ; 326 			Drive.Overrun2 = 0;
1290  002e 3f7b          	clr	_Drive+11
1291                     ; 327 			return;
1293  0030 20de          	jra	L412
1294  0032               L153:
1295                     ; 330 	Drive.ZeroOffset = Drive.Overrun = 0;
1297  0032 5f            	clrw	x
1298  0033 bf79          	ldw	_Drive+9,x
1299  0035 bf7c          	ldw	_Drive+12,x
1300                     ; 331 	StopDrive();	
1302  0037               LC009:
1304  0037 cd0000        	call	_StopDrive
1306                     ; 332 }
1308  003a 20d4          	jra	L412
1346                     ; 334 void AdcService(uint8_t channel)
1346                     ; 335 {
1347                     .text:	section	.text,new
1348  0000               _AdcService:
1350  0000 88            	push	a
1351       00000000      OFST:	set	0
1354                     ; 336 	if( Diff(Timer.Adc, 10) != 1 )
1356  0001 ae000a        	ldw	x,#10
1357  0004 89            	pushw	x
1358  0005 be25          	ldw	x,_Timer+4
1359  0007 cd0000        	call	_Diff
1361  000a 4a            	dec	a
1362  000b 85            	popw	x
1363  000c 2702          	jreq	L373
1364                     ; 337 		return;
1367  000e 84            	pop	a
1368  000f 81            	ret	
1369  0010               L373:
1370                     ; 345 	Adc.buf[channel].avg = Adc.buf[channel].b[0]>>2;
1372  0010 7b01          	ld	a,(OFST+1,sp)
1373  0012 97            	ld	xl,a
1374  0013 a60a          	ld	a,#10
1375  0015 42            	mul	x,a
1376  0016 89            	pushw	x
1377  0017 7b03          	ld	a,(OFST+3,sp)
1378  0019 97            	ld	xl,a
1379  001a a60a          	ld	a,#10
1380  001c 42            	mul	x,a
1381  001d ee2a          	ldw	x,(_Adc+1,x)
1382  001f 54            	srlw	x
1383  0020 54            	srlw	x
1384  0021 9085          	popw	y
1385  0023 01            	rrwa	x,a
1386  0024 90e733        	ld	(_Adc+10,y),a
1387                     ; 347 	Timer.Adc = Ticks_1mS;
1389  0027 be8a          	ldw	x,_Ticks_1mS
1390  0029 bf25          	ldw	_Timer+4,x
1391                     ; 348 }
1394  002b 84            	pop	a
1395  002c 81            	ret	
1439                     ; 350 void	MotorStepPhase(uint8_t dir)
1439                     ; 351 {
1440                     .text:	section	.text,new
1441  0000               _MotorStepPhase:
1443  0000 88            	push	a
1444       00000001      OFST:	set	1
1447                     ; 352 	uint8_t offset = 0;
1449                     ; 353 	if( dir == 1 )
1451  0001 4a            	dec	a
1452  0002 2611          	jrne	L714
1453                     ; 355 		Drive.Position--;
1455  0004 be75          	ldw	x,_Drive+5
1456  0006 5a            	decw	x
1457  0007 bf75          	ldw	_Drive+5,x
1458                     ; 356 		offset = Drive.NormalOpen ? 1 : -1;
1460  0009 7201007403    	btjf	_Drive+4,#0,L422
1461  000e 4c            	inc	a
1462  000f 2014          	jra	L232
1463  0011               L422:
1464  0011 a6ff          	ld	a,#255
1466  0013 2010          	jra	L232
1467  0015               L714:
1468                     ; 360 		Drive.Position++;
1470  0015 be75          	ldw	x,_Drive+5
1471  0017 5c            	incw	x
1472  0018 bf75          	ldw	_Drive+5,x
1473                     ; 361 		offset = Drive.NormalOpen ? -1 : 1;
1475  001a 7201007404    	btjf	_Drive+4,#0,L032
1476  001f a6ff          	ld	a,#255
1477  0021 2002          	jra	L232
1478  0023               L032:
1479  0023 a601          	ld	a,#1
1480  0025               L232:
1482                     ; 363 	Drive.Phase += offset;
1484  0025 bb7e          	add	a,_Drive+14
1485  0027 b77e          	ld	_Drive+14,a
1486                     ; 364 }
1489  0029 84            	pop	a
1490  002a 81            	ret	
1515                     ; 366 void	MotorStepSetOverrun(void)
1515                     ; 367 {
1516                     .text:	section	.text,new
1517  0000               _MotorStepSetOverrun:
1521                     ; 368 	Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1523  0000 be81          	ldw	x,_Drive+17
1524  0002 1d0028        	subw	x,#40
1525                     ; 369 	if ( Drive.MaxOverrun > OVERRUN )
1527  0005 a3012d        	cpw	x,#301
1528  0008 2503          	jrult	L334
1529                     ; 370 		Drive.MaxOverrun = OVERRUN;				
1531  000a ae012c        	ldw	x,#300
1532  000d               L334:
1533  000d bf7f          	ldw	_Drive+15,x
1534                     ; 371 }
1537  000f 81            	ret	
1597                     ; 373 void MotorStep(MOTOR_DIR Dir)
1597                     ; 374 {
1598                     .text:	section	.text,new
1599  0000               _MotorStep:
1603                     ; 375 	if( Dir == nMotorClose )
1605  0000 4d            	tnz	a
1606  0001 261a          	jrne	L364
1607                     ; 377 		if( Drive.Position != 0 ) 
1609  0003 be75          	ldw	x,_Drive+5
1610  0005 2704          	jreq	L564
1611                     ; 378 			MotorStepPhase(1);
1613  0007 4c            	inc	a
1614  0008 cd0000        	call	_MotorStepPhase
1616  000b               L564:
1617                     ; 380 		if( Drive.Position == 0 ) 
1619  000b be75          	ldw	x,_Drive+5
1620  000d 2628          	jrne	L174
1621                     ; 382 			Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0;
1623  000f 5f            	clrw	x
1624  0010 bf77          	ldw	_Drive+7,x
1625  0012 bf75          	ldw	_Drive+5,x
1626  0014 bf7c          	ldw	_Drive+12,x
1627  0016 bf79          	ldw	_Drive+9,x
1628                     ; 383 			StopDrive();	
1630  0018 cd0000        	call	_StopDrive
1632  001b 201a          	jra	L174
1633  001d               L364:
1634                     ; 389 		MotorStepPhase(0);
1636  001d 4f            	clr	a
1637  001e cd0000        	call	_MotorStepPhase
1639                     ; 391 		if( Drive.Origin ) 
1641  0021 b673          	ld	a,_Drive+3
1642  0023 270a          	jreq	L374
1643                     ; 393 			Drive.ORGPosition = Drive.Position;
1645  0025 be75          	ldw	x,_Drive+5
1646  0027 bf81          	ldw	_Drive+17,x
1647                     ; 394 			Drive.LastOrigin = TRUE;
1649  0029 72120072      	bset	_Drive+2,#1
1651  002d 2008          	jra	L174
1652  002f               L374:
1653                     ; 398 			if ( Drive.LastOrigin )
1655  002f 7203007203    	btjf	_Drive+2,#1,L174
1656                     ; 399 				MotorStepSetOverrun();
1658  0034 cd0000        	call	_MotorStepSetOverrun
1660  0037               L174:
1661                     ; 402 	phase_excite(Drive.Phase%8);
1663  0037 b67e          	ld	a,_Drive+14
1664  0039 a407          	and	a,#7
1666                     ; 403 }
1669  003b cc0000        	jp	_phase_excite
1695                     ; 405 void MotorClose(void)
1695                     ; 406 {
1696                     .text:	section	.text,new
1697  0000               _MotorClose:
1701                     ; 407 	if ( !Drive.Origin )   		// Hall IC Sensing 
1703  0000 b673          	ld	a,_Drive+3
1704  0002 2603          	jrne	L115
1705                     ; 409 		MotorStep(nMotorClose);
1708                     ; 410 		return;
1711  0004 cc0000        	jp	_MotorStep
1712  0007               L115:
1713                     ; 412 	if ( Drive.Overrun >= Drive.MaxOverrun )
1715  0007 be79          	ldw	x,_Drive+9
1716  0009 b37f          	cpw	x,_Drive+15
1717  000b 250c          	jrult	L315
1718                     ; 414 		Drive.Target = Drive.Position = Drive.Overrun = Drive.ZeroOffset = 0;
1720  000d 5f            	clrw	x
1721  000e bf7c          	ldw	_Drive+12,x
1722  0010 bf79          	ldw	_Drive+9,x
1723  0012 bf75          	ldw	_Drive+5,x
1724  0014 bf77          	ldw	_Drive+7,x
1725                     ; 415 		StopDrive();
1728                     ; 416 		return;
1731  0016 cc0000        	jp	_StopDrive
1732  0019               L315:
1733                     ; 418 	Drive.Overrun++;
1735  0019 5c            	incw	x
1736  001a bf79          	ldw	_Drive+9,x
1737                     ; 419 	MotorStep(nMotorClose);
1739  001c 4f            	clr	a
1741                     ; 420 }
1744  001d cc0000        	jp	_MotorStep
1799                     ; 422 void	factory(uint8_t mode)
1799                     ; 423 {
1800                     .text:	section	.text,new
1801  0000               _factory:
1803  0000 5204          	subw	sp,#4
1804       00000004      OFST:	set	4
1807                     ; 424 	uint16_t t = 0, _t = 0;
1809  0002 5f            	clrw	x
1810  0003 1f01          	ldw	(OFST-3,sp),x
1814  0005 1f03          	ldw	(OFST-1,sp),x
1816                     ; 425 	if( mode == 0 )
1818  0007 4d            	tnz	a
1819  0008 2603          	jrne	L545
1820                     ; 426 		return;
1823  000a 5b04          	addw	sp,#4
1824  000c 81            	ret	
1825  000d               L545:
1826                     ; 429 		if( Ticks_1mS == _t )
1828  000d be8a          	ldw	x,_Ticks_1mS
1829  000f 1303          	cpw	x,(OFST-1,sp)
1830  0011 27fa          	jreq	L545
1831                     ; 430 			continue;
1833                     ; 431 		_t = Ticks_1mS;
1835  0013 be8a          	ldw	x,_Ticks_1mS
1836  0015 1f03          	ldw	(OFST-1,sp),x
1838                     ; 432 		t++;
1840  0017 1e01          	ldw	x,(OFST-3,sp)
1841  0019 5c            	incw	x
1842  001a 1f01          	ldw	(OFST-3,sp),x
1844                     ; 433 		if( t > 200 )
1846  001c a300c9        	cpw	x,#201
1847  001f 25ec          	jrult	L545
1848                     ; 435 			LightToggle
1850  0021 3b0005        	push	_IO_LED+2
1851  0024 be03          	ldw	x,_IO_LED
1852  0026 cd0000        	call	_GPIO_WriteReverse
1854  0029 84            	pop	a
1855  002a 20e1          	jra	L545
1882                     ; 440 void Clock_Config(void)
1882                     ; 441 {
1883                     .text:	section	.text,new
1884  0000               _Clock_Config:
1888                     ; 442 	CLK_DeInit();
1890  0000 cd0000        	call	_CLK_DeInit
1892                     ; 443 	CLK_HSICmd(ENABLE);
1894  0003 a601          	ld	a,#1
1895  0005 cd0000        	call	_CLK_HSICmd
1897                     ; 444 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1899  0008 4f            	clr	a
1900  0009 cd0000        	call	_CLK_HSIPrescalerConfig
1902                     ; 445 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
1904  000c a680          	ld	a,#128
1906                     ; 446 }
1909  000e cc0000        	jp	_CLK_SYSCLKConfig
1959                     ; 448 void Gpio_CheckMode(void)
1959                     ; 449 {
1960                     .text:	section	.text,new
1961  0000               _Gpio_CheckMode:
1963       00000002      OFST:	set	2
1966                     ; 450 	uint8_t t = 0;
1968                     ; 451 	uint8_t prev = 0;
1970                     ; 453 	Drive.DeviceType = TYPE_MD24;
1972  0000 35010089      	mov	_Drive+25,#1
1973                     ; 454 	Ticks_1mS = 0;
1975  0004 5f            	clrw	x
1976  0005 bf8a          	ldw	_Ticks_1mS,x
1977                     ; 455 	return;
1980  0007 81            	ret	
2018                     ; 488 void Gpio_Config(void)
2018                     ; 489 {
2019                     .text:	section	.text,new
2020  0000               _Gpio_Config:
2024                     ; 490 	Gpio_CheckMode();
2026  0000 cd0000        	call	_Gpio_CheckMode
2028                     ; 492 	GPIO_SET(LED, GPIO_MODE_OUT_PP_LOW_FAST)
2030  0003 4be0          	push	#224
2031  0005 3b0005        	push	_IO_LED+2
2032  0008 be03          	ldw	x,_IO_LED
2033  000a cd0000        	call	_GPIO_Init
2035  000d 85            	popw	x
2036                     ; 493 	GPIO_SET(ORG, GPIO_MODE_IN_FL_NO_IT)
2038  000e 4b00          	push	#0
2039  0010 3b0008        	push	_IO_ORG+2
2040  0013 be06          	ldw	x,_IO_ORG
2041  0015 cd0000        	call	_GPIO_Init
2043  0018 85            	popw	x
2044                     ; 494 	GPIO_SET(X1, GPIO_MODE_OUT_PP_LOW_FAST)
2046  0019 4be0          	push	#224
2047  001b 3b000b        	push	_IO_X1+2
2048  001e be09          	ldw	x,_IO_X1
2049  0020 cd0000        	call	_GPIO_Init
2051  0023 85            	popw	x
2052                     ; 495 	GPIO_SET(X2, GPIO_MODE_OUT_PP_LOW_FAST)
2054  0024 4be0          	push	#224
2055  0026 3b000e        	push	_IO_X2+2
2056  0029 be0c          	ldw	x,_IO_X2
2057  002b cd0000        	call	_GPIO_Init
2059  002e 85            	popw	x
2060                     ; 496 	GPIO_SET(Y1, GPIO_MODE_OUT_PP_LOW_FAST)
2062  002f 4be0          	push	#224
2063  0031 3b0011        	push	_IO_Y1+2
2064  0034 be0f          	ldw	x,_IO_Y1
2065  0036 cd0000        	call	_GPIO_Init
2067  0039 85            	popw	x
2068                     ; 497 	GPIO_SET(Y2, GPIO_MODE_OUT_PP_LOW_FAST)
2070  003a 4be0          	push	#224
2071  003c 3b0014        	push	_IO_Y2+2
2072  003f be12          	ldw	x,_IO_Y2
2073  0041 cd0000        	call	_GPIO_Init
2075  0044 85            	popw	x
2076                     ; 498 	StopDrive();
2078  0045 cd0000        	call	_StopDrive
2080                     ; 500 	GPIO_SET(ADJ, GPIO_MODE_IN_FL_NO_IT)
2082  0048 4b00          	push	#0
2083  004a 3b0017        	push	_IO_ADJ+2
2084  004d be15          	ldw	x,_IO_ADJ
2085  004f cd0000        	call	_GPIO_Init
2087  0052 85            	popw	x
2088                     ; 501 	GPIO_SET(SEN, GPIO_MODE_IN_FL_NO_IT)
2090  0053 4b00          	push	#0
2091  0055 3b001a        	push	_IO_SEN+2
2092  0058 be18          	ldw	x,_IO_SEN
2093  005a cd0000        	call	_GPIO_Init
2095  005d 85            	popw	x
2096                     ; 502 	GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
2098  005e 4b00          	push	#0
2099  0060 3b001d        	push	_IO_POWER+2
2100  0063 be1b          	ldw	x,_IO_POWER
2101  0065 cd0000        	call	_GPIO_Init
2103  0068 b689          	ld	a,_Drive+25
2104  006a 4a            	dec	a
2105  006b 85            	popw	x
2106                     ; 503 	if( Drive.DeviceType == TYPE_MD24 )
2108  006c 2601          	jrne	L716
2109                     ; 505 		return;
2112  006e 81            	ret	
2113  006f               L716:
2114                     ; 508 	GPIO_SET(BAT, GPIO_MODE_IN_FL_NO_IT)
2116  006f 4b00          	push	#0
2117  0071 3b0023        	push	_IO_BAT+2
2118  0074 be21          	ldw	x,_IO_BAT
2119  0076 cd0000        	call	_GPIO_Init
2121  0079 b689          	ld	a,_Drive+25
2122  007b a102          	cp	a,#2
2123  007d 85            	popw	x
2124                     ; 509 	if( Drive.DeviceType == TYPE_MD12 )
2126  007e 2616          	jrne	L126
2127                     ; 511 		GPIO_SET(BOOST, GPIO_MODE_IN_FL_NO_IT)
2129  0080 4b00          	push	#0
2130  0082 3b0026        	push	_IO_BOOST+2
2131  0085 be24          	ldw	x,_IO_BOOST
2132  0087 cd0000        	call	_GPIO_Init
2134  008a 85            	popw	x
2135                     ; 512 		GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
2137  008b 4b00          	push	#0
2138  008d 3b001d        	push	_IO_POWER+2
2139  0090 be1b          	ldw	x,_IO_POWER
2140  0092 cd0000        	call	_GPIO_Init
2142  0095 85            	popw	x
2143  0096               L126:
2144                     ; 514 }
2147  0096 81            	ret	
2170                     ; 516 OnTimer_1S(void) {}
2171                     .text:	section	.text,new
2172  0000               _OnTimer_1S:
2179  0000 81            	ret	
2182                     	bsct
2183  002a               __chan:
2184  002a 03            	dc.b	3
2185  002b 04            	dc.b	4
2186  002c 05            	dc.b	5
2187  002d 06            	dc.b	6
2188  002e 02            	dc.b	2
2189  002f               __chanSchmit:
2190  002f 03            	dc.b	3
2191  0030 04            	dc.b	4
2192  0031 05            	dc.b	5
2193  0032 06            	dc.b	6
2194  0033 02            	dc.b	2
2195  0034               __chanId:
2196  0034 01            	dc.b	1
2197  0035 02            	dc.b	2
2198  0036 03            	dc.b	3
2199  0037 04            	dc.b	4
2200  0038 00            	dc.b	0
2230                     ; 531 void Adc_Config(void)
2230                     ; 532 {
2231                     .text:	section	.text,new
2232  0000               _Adc_Config:
2234  0000 5204          	subw	sp,#4
2235       00000004      OFST:	set	4
2238                     ; 533 	Adc.buf[Adc.Channel].b[Adc.buf[Adc.Channel].i] = ADC1_GetConversionValue();
2240  0002 cd0000        	call	_ADC1_GetConversionValue
2242  0005 1f03          	ldw	(OFST-1,sp),x
2244  0007 ad52          	call	LC010
2245  0009 e632          	ld	a,(_Adc+9,x)
2246  000b 5f            	clrw	x
2247  000c 97            	ld	xl,a
2248  000d 58            	sllw	x
2249  000e 1f01          	ldw	(OFST-3,sp),x
2251  0010 ad49          	call	LC010
2252  0012 72fb01        	addw	x,(OFST-3,sp)
2253  0015 1603          	ldw	y,(OFST-1,sp)
2254  0017 ef2a          	ldw	(_Adc+1,x),y
2255                     ; 537 	Adc.buf[Adc.Channel].i = 0;
2257  0019 ad40          	call	LC010
2258  001b 6f32          	clr	(_Adc+9,x)
2259                     ; 539 	Adc.Channel = _chanId[Adc.Channel];
2261  001d 5f            	clrw	x
2262  001e b629          	ld	a,_Adc
2263  0020 97            	ld	xl,a
2264  0021 e634          	ld	a,(__chanId,x)
2265  0023 b729          	ld	_Adc,a
2266                     ; 541 	if( Drive.DeviceType == TYPE_MD24 )
2268  0025 b689          	ld	a,_Drive+25
2269  0027 4a            	dec	a
2270  0028 260a          	jrne	L346
2271                     ; 543 		if( Adc.Channel == 2 )
2273  002a b629          	ld	a,_Adc
2274  002c a102          	cp	a,#2
2275  002e 2604          	jrne	L346
2276                     ; 544 			Adc.Channel = 4;
2278  0030 35040029      	mov	_Adc,#4
2279  0034               L346:
2280                     ; 546 	ADC1_DeInit();
2282  0034 cd0000        	call	_ADC1_DeInit
2284                     ; 547 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
2284                     ; 548 		_chan[Adc.Channel], 
2284                     ; 549 		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
2284                     ; 550 		_chanSchmit[Adc.Channel],
2284                     ; 551 	   	DISABLE
2284                     ; 552 		);
2286  0037 4b00          	push	#0
2287  0039 b629          	ld	a,_Adc
2288  003b 5f            	clrw	x
2289  003c 97            	ld	xl,a
2290  003d e62f          	ld	a,(__chanSchmit,x)
2291  003f 88            	push	a
2292  0040 4b08          	push	#8
2293  0042 4b00          	push	#0
2294  0044 4b00          	push	#0
2295  0046 4b00          	push	#0
2296  0048 b629          	ld	a,_Adc
2297  004a 5f            	clrw	x
2298  004b 97            	ld	xl,a
2299  004c e62a          	ld	a,(__chan,x)
2300  004e 5f            	clrw	x
2301  004f 97            	ld	xl,a
2302  0050 cd0000        	call	_ADC1_Init
2304  0053 5b06          	addw	sp,#6
2305                     ; 554 	ADC1_StartConversion();		
2307  0055 cd0000        	call	_ADC1_StartConversion
2309                     ; 555 }
2312  0058 5b04          	addw	sp,#4
2313  005a 81            	ret	
2314  005b               LC010:
2315  005b b629          	ld	a,_Adc
2316  005d 97            	ld	xl,a
2317  005e a60a          	ld	a,#10
2318  0060 42            	mul	x,a
2319  0061 81            	ret	
2350                     ; 557 void OnTimer4(void)
2350                     ; 558 {
2351                     .text:	section	.text,new
2352  0000               _OnTimer4:
2356                     ; 559 	Ticks_50uS++;
2358  0000 3c8c          	inc	_Ticks_50uS
2359                     ; 560 	if( Ticks_50uS >= 20 )
2361  0002 b68c          	ld	a,_Ticks_50uS
2362  0004 a114          	cp	a,#20
2363  0006 2507          	jrult	L756
2364                     ; 562 		Ticks_50uS = 0;
2366  0008 3f8c          	clr	_Ticks_50uS
2367                     ; 563 		Ticks_1mS++;
2369  000a be8a          	ldw	x,_Ticks_1mS
2370  000c 5c            	incw	x
2371  000d bf8a          	ldw	_Ticks_1mS,x
2372  000f               L756:
2373                     ; 565 	if( Drive.Ticks )
2375  000f b684          	ld	a,_Drive+20
2376  0011 2706          	jreq	L166
2377                     ; 566 		Drive.Ticks--;
2379  0013 3a84          	dec	_Drive+20
2381  0015 a601          	ld	a,#1
2382  0017 200b          	jra	L366
2383  0019               L166:
2384                     ; 569 		Drive.MotorRun = 1;
2386  0019 4c            	inc	a
2387  001a b785          	ld	_Drive+21,a
2388                     ; 570 		if( Drive.Enabled )
2390  001c 7201007003    	btjf	_Drive,#0,L366
2391                     ; 571 			Drive.Ticks = Drive.Interval;
2393  0021 458384        	mov	_Drive+20,_Drive+19
2394  0024               L366:
2395                     ; 573 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
2397  0024 cd0000        	call	_TIM4_ClearITPendingBit
2399                     ; 574 	TIM4_ClearFlag(TIM4_IT_UPDATE);
2401  0027 a601          	ld	a,#1
2402  0029 cd0000        	call	_TIM4_ClearFlag
2404                     ; 576 	Adc_Config();
2406  002c cd0000        	call	_Adc_Config
2408                     ; 577 	Drive.Origin = !MotorOrigin();
2410  002f 3b0008        	push	_IO_ORG+2
2411  0032 be06          	ldw	x,_IO_ORG
2412  0034 cd0000        	call	_GPIO_ReadInputPin
2414  0037 5b01          	addw	sp,#1
2415  0039 4d            	tnz	a
2416  003a 2603          	jrne	L463
2417  003c 4c            	inc	a
2418  003d 2001          	jra	L073
2419  003f               L463:
2420  003f 4f            	clr	a
2421  0040               L073:
2422  0040 b773          	ld	_Drive+3,a
2423                     ; 578 }
2427  0042 81            	ret	
2451                     ; 580 void OnCaptureOVTim2(void)
2451                     ; 581 {
2452                     .text:	section	.text,new
2453  0000               _OnCaptureOVTim2:
2457                     ; 587 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
2459  0000 a601          	ld	a,#1
2461                     ; 588 }	
2464  0002 cc0000        	jp	_TIM2_ClearITPendingBit
2507                     ; 590 void OnCaptureTim2(void)
2507                     ; 591 {
2508                     .text:	section	.text,new
2509  0000               _OnCaptureTim2:
2511  0000 89            	pushw	x
2512       00000002      OFST:	set	2
2515                     ; 593 	if( TIM2_GetITStatus(TIM2_IT_CC1) == SET )
2517  0001 a602          	ld	a,#2
2518  0003 cd0000        	call	_TIM2_GetITStatus
2520  0006 4a            	dec	a
2521  0007 266b          	jrne	L327
2522                     ; 595 		t = TIM2_GetCapture1();	
2524  0009 cd0000        	call	_TIM2_GetCapture1
2526  000c 1f01          	ldw	(OFST-1,sp),x
2528                     ; 596 		Pwm.T10 = t;	
2530  000e bf62          	ldw	_Pwm+6,x
2531                     ; 597 		Pwm.T20 = TIM2_GetCapture2();
2533  0010 cd0000        	call	_TIM2_GetCapture2
2535  0013 bf64          	ldw	_Pwm+8,x
2536                     ; 598 		TIM2_InterruptClear(TIM2_IT_CC1)
2538  0015 a602          	ld	a,#2
2539  0017 cd0000        	call	_TIM2_ClearITPendingBit
2543  001a 5f            	clrw	x
2544  001b cd0000        	call	_TIM2_SetCounter
2546                     ; 600 		iDuty = (iDuty + 1) % MAX_DUTYBUFFER;
2548  001e b691          	ld	a,_iDuty
2549  0020 5f            	clrw	x
2550  0021 97            	ld	xl,a
2551  0022 5c            	incw	x
2552  0023 a628          	ld	a,#40
2553  0025 cd0000        	call	c_smodx
2555  0028 01            	rrwa	x,a
2556  0029 b791          	ld	_iDuty,a
2557                     ; 601 		dutyBuffer[iDuty] = (t>>4);
2559  002b 1e01          	ldw	x,(OFST-1,sp)
2560  002d 54            	srlw	x
2561  002e 54            	srlw	x
2562  002f 54            	srlw	x
2563  0030 54            	srlw	x
2564  0031 905f          	clrw	y
2565  0033 9097          	ld	yl,a
2566  0035 01            	rrwa	x,a
2567  0036 90e792        	ld	(_dutyBuffer,y),a
2568                     ; 602 		goto Next;
2569                     ; 618 Next:	
2569                     ; 619 
2569                     ; 620 	t = TIM2_GetCapture1();	
2571  0039 cd0000        	call	_TIM2_GetCapture1
2573  003c 1f01          	ldw	(OFST-1,sp),x
2575                     ; 621 	TIMER_EDGE_SET(Pwm.Edge)	//	TIM2_Init()
2577  003e 4b00          	push	#0
2578  0040 4b0c          	push	#12
2579  0042 4b01          	push	#1
2580  0044 7200006004    	btjt	_Pwm+4,#0,L614
2581  0049 a644          	ld	a,#68
2582  004b 2001          	jra	L024
2583  004d               L614:
2584  004d 4f            	clr	a
2585  004e               L024:
2586  004e 5f            	clrw	x
2587  004f 97            	ld	xl,a
2588  0050 cd0000        	call	_TIM2_ICInit
2590  0053 5b03          	addw	sp,#3
2591                     ; 623 	if ( Pwm.Edge == 0 ) 
2593  0055 7200006010    	btjt	_Pwm+4,#0,L127
2594                     ; 626 		Pwm.Edge = 1;
2596  005a 72100060      	bset	_Pwm+4,#0
2597                     ; 627 		Pwm.Calc = 1;
2599  005e 35010061      	mov	_Pwm+5,#1
2600                     ; 628 		Pwm.T2 =  Pwm.T20 = t;	
2602  0062 1e01          	ldw	x,(OFST-1,sp)
2603  0064 bf64          	ldw	_Pwm+8,x
2604  0066 bf68          	ldw	_Pwm+12,x
2606  0068 200a          	jra	L327
2607                     ; 617 	return;
2609  006a               L127:
2610                     ; 632 		Pwm.Edge = 0; 
2612  006a 72110060      	bres	_Pwm+4,#0
2613                     ; 633 		Pwm.T1 = Pwm.T10 = t;
2615  006e 1e01          	ldw	x,(OFST-1,sp)
2616  0070 bf62          	ldw	_Pwm+6,x
2617  0072 bf66          	ldw	_Pwm+10,x
2618  0074               L327:
2619                     ; 635 }
2622  0074 85            	popw	x
2623  0075 81            	ret	
2655                     ; 637 void Timer_Config(void)
2655                     ; 638 {
2656                     .text:	section	.text,new
2657  0000               _Timer_Config:
2661                     ; 639   TIM4_DeInit();
2663  0000 cd0000        	call	_TIM4_DeInit
2665                     ; 640 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);  //  16 * 0x32 = 50uS  Ticks, 0x64-100us 
2667  0003 ae0432        	ldw	x,#1074
2668  0006 cd0000        	call	_TIM4_TimeBaseInit
2670                     ; 641   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2672  0009 ae0101        	ldw	x,#257
2673  000c cd0000        	call	_TIM4_ITConfig
2675                     ; 642   TIM4_Cmd(ENABLE);
2677  000f a601          	ld	a,#1
2678  0011 cd0000        	call	_TIM4_Cmd
2680                     ; 644 	TIM2_DeInit();	
2682  0014 cd0000        	call	_TIM2_DeInit
2684                     ; 645 	TIM2_TimeBaseInit(TIM2_PRESCALER_4, 0xffff);
2686  0017 aeffff        	ldw	x,#65535
2687  001a 89            	pushw	x
2688  001b a602          	ld	a,#2
2689  001d cd0000        	call	_TIM2_TimeBaseInit
2691  0020 85            	popw	x
2692                     ; 652 	TIMER_EDGE_SET(0)	//	TIM2_Init()
2694  0021 4b00          	push	#0
2695  0023 4b0c          	push	#12
2696  0025 4b01          	push	#1
2697  0027 ae0044        	ldw	x,#68
2698  002a cd0000        	call	_TIM2_ICInit
2700  002d 5b03          	addw	sp,#3
2701                     ; 653 	TIM2_ITConfig(TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
2703  002f ae0301        	ldw	x,#769
2704  0032 cd0000        	call	_TIM2_ITConfig
2706                     ; 655 	TIM2_Cmd(ENABLE);
2708  0035 a601          	ld	a,#1
2710                     ; 656 }
2713  0037 cc0000        	jp	_TIM2_Cmd
2736                     ; 658 void mainDeviceType(void)
2736                     ; 659 {
2737                     .text:	section	.text,new
2738  0000               _mainDeviceType:
2742  0000               L547:
2743  0000 20fe          	jra	L547
2770                     ; 663 void	motorGo(void)
2770                     ; 664 {
2771                     .text:	section	.text,new
2772  0000               _motorGo:
2776                     ; 665 	if ( Drive.MotorRun == 1 && Drive.Enabled )
2778  0000 b685          	ld	a,_Drive+21
2779  0002 4a            	dec	a
2780  0003 260d          	jrne	L167
2782  0005 7201007008    	btjf	_Drive,#0,L167
2783                     ; 667 		Drive.MotorRun = 0;
2785  000a b785          	ld	_Drive+21,a
2786                     ; 668 		DriveService();	
2788  000c cd0000        	call	_DriveService
2790                     ; 669 		Drive.Ticks = Drive.Interval;
2792  000f 458384        	mov	_Drive+20,_Drive+19
2793  0012               L167:
2794                     ; 672 	if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
2796  0012 720000720f    	btjt	_Drive+2,#0,L367
2798  0017 b671          	ld	a,_Drive+1
2799  0019 a101          	cp	a,#1
2800  001b 2609          	jrne	L367
2801                     ; 674 		Pwm.T1_1mS = Ticks_1mS;
2803  001d be8a          	ldw	x,_Ticks_1mS
2804  001f bf5c          	ldw	_Pwm,x
2805                     ; 675 		Drive.Run0 = Drive.Run;
2807  0021 44            	srl	a
2808  0022 90110072      	bccm	_Drive+2,#0
2809  0026               L367:
2810                     ; 677 	if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
2812  0026 7201007213    	btjf	_Drive+2,#0,L567
2814  002b b671          	ld	a,_Drive+1
2815  002d 260f          	jrne	L567
2816                     ; 679 		Pwm.T2_1mS = Ticks_1mS;
2818  002f be8a          	ldw	x,_Ticks_1mS
2819  0031 bf5e          	ldw	_Pwm+2,x
2820                     ; 680 		Drive.Run0 = Drive.Run;			
2822  0033 44            	srl	a
2823  0034 90110072      	bccm	_Drive+2,#0
2824                     ; 681 		Pwm.diff = Pwm.T2_1mS - Pwm.T1_1mS;
2826  0038 72b0005c      	subw	x,_Pwm
2827  003c bf6e          	ldw	_Pwm+18,x
2828  003e               L567:
2829                     ; 683 }
2832  003e 81            	ret	
2924                     ; 685 void main(void)
2924                     ; 686 {
2925                     .text:	section	.text,new
2926  0000               _main:
2928  0000 520f          	subw	sp,#15
2929       0000000f      OFST:	set	15
2932                     ; 687 	uint8_t		channel = 0;
2934  0002 0f05          	clr	(OFST-10,sp)
2936                     ; 691 	Drive.Enabled = ENABLED;
2938                     ; 692 	Drive.MaxOverrun = OVERRUN;
2940  0004 ae012c        	ldw	x,#300
2941  0007 72100070      	bset	_Drive,#0
2942  000b bf7f          	ldw	_Drive+15,x
2943                     ; 693 	Drive.Position = Drive.Stage = 0;
2945  000d 3f88          	clr	_Drive+24
2946  000f 5f            	clrw	x
2947  0010 bf75          	ldw	_Drive+5,x
2948                     ; 694 	Drive.Dir = nMotorClose;
2950  0012 72150072      	bres	_Drive+2,#2
2951                     ; 695 	Drive.Interval = 15;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
2953  0016 350f0083      	mov	_Drive+19,#15
2954                     ; 697 	Ticks_1mS = Ticks_50uS = Pwm.Edge = 0;
2956  001a 72110060      	bres	_Pwm+4,#0
2957  001e 3f8c          	clr	_Ticks_50uS
2958  0020 bf8a          	ldw	_Ticks_1mS,x
2959                     ; 699 	Clock_Config();
2961  0022 cd0000        	call	_Clock_Config
2963                     ; 700 	Gpio_Config();
2965  0025 cd0000        	call	_Gpio_Config
2967                     ; 701 	Timer_Config();
2969  0028 cd0000        	call	_Timer_Config
2971                     ; 703 	Adc.Channel = 2;
2973  002b 35020029      	mov	_Adc,#2
2974                     ; 704 	Adc_Config();
2976  002f cd0000        	call	_Adc_Config
2978                     ; 706 	enableInterrupts();
2981  0032 9a            	rim	
2983                     ; 707 	waitPowerDelay();
2986  0033 cd0000        	call	_waitPowerDelay
2988                     ; 708 	if ( Drive.Origin ) 
2990  0036 b673          	ld	a,_Drive+3
2991  0038 2719          	jreq	L7201
2992                     ; 710 		Drive.Position = 0;
2994  003a 5f            	clrw	x
2995  003b bf75          	ldw	_Drive+5,x
2996                     ; 711 		StartDriveOR( CPulse(MAX_POS), OFFSET_OVERRUN);
2998  003d 4b00          	push	#0
2999  003f a6c8          	ld	a,#200
3000  0041 cd0000        	call	_CPulse
3002  0044 cd0000        	call	_StartDriveOR
3004  0047 84            	pop	a
3006  0048 2003          	jra	L3301
3007  004a               L1301:
3008                     ; 715 			motorGo();
3010  004a cd0000        	call	_motorGo
3012  004d               L3301:
3013                     ; 714 		while ( Drive.Run )
3015  004d b671          	ld	a,_Drive+1
3016  004f 26f9          	jrne	L1301
3018  0051 2007          	jra	L7301
3019  0053               L7201:
3020                     ; 719 		Drive.Position = CPulse(MAX_POS + 5);
3022  0053 a6cd          	ld	a,#205
3023  0055 cd0000        	call	_CPulse
3025  0058 bf75          	ldw	_Drive+5,x
3026  005a               L7301:
3027                     ; 721 	Timer.Led = Timer.Motor = Timer.Adc = Ticks_1mS;
3029  005a be8a          	ldw	x,_Ticks_1mS
3030  005c bf25          	ldw	_Timer+4,x
3031  005e bf23          	ldw	_Timer+2,x
3032  0060 bf21          	ldw	_Timer,x
3033                     ; 722 	Drive.Run0 = Drive.Run;
3035  0062 b671          	ld	a,_Drive+1
3036  0064 44            	srl	a
3037  0065 90110072      	bccm	_Drive+2,#0
3038                     ; 724 	if( Drive.DeviceType == TYPE_MD12 )
3040  0069 b689          	ld	a,_Drive+25
3041  006b a102          	cp	a,#2
3042  006d 2603          	jrne	L3401
3043                     ; 725 		mainDeviceType();
3045  006f cd0000        	call	_mainDeviceType
3047  0072               L3401:
3048                     ; 729 		tt = Ticks_1mS;
3050  0072 be8a          	ldw	x,_Ticks_1mS
3051  0074 bfba          	ldw	_tt,x
3052                     ; 730 		LightControl(tt);
3054  0076 cd0000        	call	_LightControl
3056                     ; 731 		AdcService(channel);
3058  0079 7b05          	ld	a,(OFST-10,sp)
3059  007b cd0000        	call	_AdcService
3061                     ; 733 		if ( Drive.Stage == 0 )
3063  007e b688          	ld	a,_Drive+24
3064  0080 2607          	jrne	L7401
3065                     ; 735 			Drive.Stage = ZeroPos();
3067  0082 cd0000        	call	_ZeroPos
3069  0085 b788          	ld	_Drive+24,a
3070                     ; 736 			goto Loop;
3072  0087 2043          	jra	L767
3073  0089               L7401:
3074                     ; 738 		if ( Diff(Timer.Motor, 100) == 0 )
3076  0089 ae0064        	ldw	x,#100
3077  008c 89            	pushw	x
3078  008d be23          	ldw	x,_Timer+2
3079  008f cd0000        	call	_Diff
3081  0092 4d            	tnz	a
3082  0093 85            	popw	x
3083  0094 2736          	jreq	L767
3084                     ; 739 			goto Loop;
3086                     ; 740 		if ( Diff(Timer.PwmUpdate, MAX_TIMEOUT) != 0 )
3088  0096 ae07d0        	ldw	x,#2000
3089  0099 89            	pushw	x
3090  009a be27          	ldw	x,_Timer+6
3091  009c cd0000        	call	_Diff
3093  009f 4d            	tnz	a
3094  00a0 85            	popw	x
3095  00a1 2719          	jreq	L3501
3096                     ; 742 			Timer.PwmUpdate = (Ticks_1mS > MAX_TIMEOUT) ? 
3096                     ; 743 				Ticks_1mS - MAX_TIMEOUT : 
3096                     ; 744 				0xffff - MAX_TIMEOUT + Ticks_1mS;
3098  00a3 be8a          	ldw	x,_Ticks_1mS
3099  00a5 a307d1        	cpw	x,#2001
3100  00a8 2507          	jrult	L615
3101  00aa be8a          	ldw	x,_Ticks_1mS
3102  00ac 1d07d0        	subw	x,#2000
3103  00af 2005          	jra	L025
3104  00b1               L615:
3105  00b1 be8a          	ldw	x,_Ticks_1mS
3106  00b3 1cf82f        	addw	x,#63535
3107  00b6               L025:
3108  00b6 bf27          	ldw	_Timer+6,x
3109                     ; 745 			Drive.Step = 0;
3111  00b8 3f86          	clr	_Drive+22
3113  00ba 200d          	jra	L5501
3114  00bc               L3501:
3115                     ; 749 			iDuty = (iDuty + 1) % 16;
3117  00bc b691          	ld	a,_iDuty
3118  00be 5f            	clrw	x
3119  00bf 97            	ld	xl,a
3120  00c0 5c            	incw	x
3121  00c1 a610          	ld	a,#16
3122  00c3 cd0000        	call	c_smodx
3124  00c6 01            	rrwa	x,a
3125  00c7 b791          	ld	_iDuty,a
3126  00c9               L5501:
3127                     ; 752 		Drive.PreStep = Drive.Step;
3129  00c9 458687        	mov	_Drive+23,_Drive+22
3130  00cc               L767:
3131                     ; 753 	Loop:		
3131                     ; 754 		if( _tt != tt )
3133  00cc 1e0e          	ldw	x,(OFST-1,sp)
3134  00ce b3ba          	cpw	x,_tt
3135  00d0 2736          	jreq	L7501
3136                     ; 756 			_tt = tt;
3138  00d2 beba          	ldw	x,_tt
3139  00d4 1f0e          	ldw	(OFST-1,sp),x
3141                     ; 758 			if( Pwm.Calc == 1 )
3143  00d6 b661          	ld	a,_Pwm+5
3144  00d8 4a            	dec	a
3145  00d9 262d          	jrne	L7501
3146                     ; 760 				Pwm.Calc = 0;
3148  00db b761          	ld	_Pwm+5,a
3149                     ; 761 				_t1 = Pwm.T1;
3151  00dd be66          	ldw	x,_Pwm+10
3152  00df 1f06          	ldw	(OFST-9,sp),x
3154                     ; 762 				_t2 = Pwm.T2;
3156  00e1 be68          	ldw	x,_Pwm+12
3157  00e3 1f08          	ldw	(OFST-7,sp),x
3159                     ; 763 				_t = (uint32_t)_t1 * MAX_POS / _t2;
3161  00e5 cd0000        	call	c_uitolx
3163  00e8 96            	ldw	x,sp
3164  00e9 5c            	incw	x
3165  00ea cd0000        	call	c_rtol
3168  00ed 1e06          	ldw	x,(OFST-9,sp)
3169  00ef a6c8          	ld	a,#200
3170  00f1 cd0000        	call	c_cmulx
3172  00f4 96            	ldw	x,sp
3173  00f5 5c            	incw	x
3174  00f6 cd0000        	call	c_ludv
3176  00f9 96            	ldw	x,sp
3177  00fa 1c000a        	addw	x,#OFST-5
3178  00fd cd0000        	call	c_rtol
3181                     ; 764 				Pwm.Duty = _t;
3183  0100 1e0c          	ldw	x,(OFST-3,sp)
3184  0102 bf6a          	ldw	_Pwm+14,x
3185                     ; 773 				Timer.PwmUpdate = Ticks_1mS;		
3187  0104 be8a          	ldw	x,_Ticks_1mS
3188  0106 bf27          	ldw	_Timer+6,x
3189  0108               L7501:
3190                     ; 776 		motorGo();
3192  0108 cd0000        	call	_motorGo
3195  010b cc0072        	jra	L3401
3239                     ; 781 void assert_failed(u8* file, u32 line) { u8 i; while (1) i++; }
3240                     .text:	section	.text,new
3241  0000               _assert_failed:
3243  0000 88            	push	a
3244       00000001      OFST:	set	1
3247  0001               L5011:
3250  0001 0c01          	inc	(OFST+0,sp)
3253  0003 20fc          	jra	L5011
4105                     	xdef	_main
4106                     	xdef	_motorGo
4107                     	xdef	_mainDeviceType
4108                     	xdef	_Timer_Config
4109                     	xdef	_OnCaptureTim2
4110                     	xdef	_OnCaptureOVTim2
4111                     	xdef	_OnTimer4
4112                     	xdef	_Adc_Config
4113                     	xdef	__chanId
4114                     	xdef	__chanSchmit
4115                     	xdef	__chan
4116                     	xdef	_OnTimer_1S
4117                     	xdef	_Gpio_Config
4118                     	xdef	_Gpio_CheckMode
4119                     	xdef	_Clock_Config
4120                     	xdef	_factory
4121                     	xdef	_MotorStepSetOverrun
4122                     	xdef	_MotorStepPhase
4123                     	xdef	_AdcService
4124                     	xdef	_DriveService
4125                     	xdef	_MotorClose
4126                     	xdef	_MotorStep
4127                     	xdef	_StopDrive
4128                     	xdef	_MotorService
4129                     	xdef	_LightControl
4130                     	xdef	_ZeroPos
4131                     	xdef	_StartDriveOR
4132                     	xdef	_waitPowerDelay
4133                     	xdef	_stepCalc
4134                     	xdef	_stepPrepare
4135                     	xdef	_Diff
4136                     	xdef	_CPulse
4137                     	xdef	_phase_excite
4138                     	xdef	_IO_CHARGE
4139                     	xdef	_IO_BOOST
4140                     	xdef	_IO_BAT
4141                     	xdef	_IO_MOD
4142                     	xdef	_IO_POWER
4143                     	xdef	_IO_SEN
4144                     	xdef	_IO_ADJ
4145                     	xdef	_IO_Y2
4146                     	xdef	_IO_Y1
4147                     	xdef	_IO_X2
4148                     	xdef	_IO_X1
4149                     	xdef	_IO_ORG
4150                     	xdef	_IO_LED
4151                     	switch	.ubsct
4152  0000               _iStep:
4153  0000 00            	ds.b	1
4154                     	xdef	_iStep
4155  0001               _mStep:
4156  0001 000000000000  	ds.b	32
4157                     	xdef	_mStep
4158  0021               _Timer:
4159  0021 000000000000  	ds.b	8
4160                     	xdef	_Timer
4161  0029               _Adc:
4162  0029 000000000000  	ds.b	51
4163                     	xdef	_Adc
4164  005c               _Pwm:
4165  005c 000000000000  	ds.b	20
4166                     	xdef	_Pwm
4167  0070               _Drive:
4168  0070 000000000000  	ds.b	26
4169                     	xdef	_Drive
4170                     	xdef	_ledint
4171  008a               _Ticks_1mS:
4172  008a 0000          	ds.b	2
4173                     	xdef	_Ticks_1mS
4174  008c               _Ticks_50uS:
4175  008c 00            	ds.b	1
4176                     	xdef	_Ticks_50uS
4177  008d               _mDuty:
4178  008d 0000          	ds.b	2
4179                     	xdef	_mDuty
4180                     	xdef	_nDuty
4181  008f               _sDuty:
4182  008f 0000          	ds.b	2
4183                     	xdef	_sDuty
4184  0091               _iDuty:
4185  0091 00            	ds.b	1
4186                     	xdef	_iDuty
4187  0092               _dutyBuffer:
4188  0092 000000000000  	ds.b	40
4189                     	xdef	_dutyBuffer
4190  00ba               _tt:
4191  00ba 0000          	ds.b	2
4192                     	xdef	_tt
4193                     	xdef	_assert_failed
4194                     	xref	_TIM4_ClearITPendingBit
4195                     	xref	_TIM4_ClearFlag
4196                     	xref	_TIM4_ITConfig
4197                     	xref	_TIM4_Cmd
4198                     	xref	_TIM4_TimeBaseInit
4199                     	xref	_TIM4_DeInit
4200                     	xref	_TIM2_ClearITPendingBit
4201                     	xref	_TIM2_GetITStatus
4202                     	xref	_TIM2_GetCapture2
4203                     	xref	_TIM2_GetCapture1
4204                     	xref	_TIM2_SetCounter
4205                     	xref	_TIM2_ITConfig
4206                     	xref	_TIM2_Cmd
4207                     	xref	_TIM2_ICInit
4208                     	xref	_TIM2_TimeBaseInit
4209                     	xref	_TIM2_DeInit
4210                     	xref	_GPIO_ReadInputPin
4211                     	xref	_GPIO_WriteReverse
4212                     	xref	_GPIO_WriteLow
4213                     	xref	_GPIO_WriteHigh
4214                     	xref	_GPIO_Init
4215                     	xref	_CLK_SYSCLKConfig
4216                     	xref	_CLK_HSIPrescalerConfig
4217                     	xref	_CLK_HSICmd
4218                     	xref	_CLK_DeInit
4219                     	xref	_ADC1_GetConversionValue
4220                     	xref	_ADC1_StartConversion
4221                     	xref	_ADC1_Init
4222                     	xref	_ADC1_DeInit
4223                     	xref.b	c_x
4243                     	xref	c_ludv
4244                     	xref	c_rtol
4245                     	xref	c_uitolx
4246                     	xref	c_cmulx
4247                     	xref	c_smodx
4248                     	xref	c_imul
4249                     	end
