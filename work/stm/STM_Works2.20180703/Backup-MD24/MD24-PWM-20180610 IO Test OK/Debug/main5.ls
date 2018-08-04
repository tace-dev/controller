   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  20                     	bsct
  21  0000               _ledint:
  22  0000 01f4          	dc.w	500
  23  0002               _IO_LED:
  24  0002 5005          	dc.w	20485
  25  0004 10            	dc.b	16
  26  0005               _IO_ORG:
  27  0005 5000          	dc.w	20480
  28  0007 02            	dc.b	2
  29  0008               _IO_X1:
  30  0008 500a          	dc.w	20490
  31  000a 80            	dc.b	128
  32  000b               _IO_X2:
  33  000b 500a          	dc.w	20490
  34  000d 40            	dc.b	64
  35  000e               _IO_Y1:
  36  000e 500a          	dc.w	20490
  37  0010 20            	dc.b	32
  38  0011               _IO_Y2:
  39  0011 5000          	dc.w	20480
  40  0013 04            	dc.b	4
  41  0014               _IO_ADJ:
  42  0014 500a          	dc.w	20490
  43  0016 10            	dc.b	16
  44  0017               _IO_SEN:
  45  0017 500f          	dc.w	20495
  46  0019 04            	dc.b	4
  47  001a               _IO_POWER:
  48  001a 500f          	dc.w	20495
  49  001c 20            	dc.b	32
  50  001d               _IO_MOD:
  51  001d 500f          	dc.w	20495
  52  001f 10            	dc.b	16
  53  0020               _IO_BAT:
  54  0020 500f          	dc.w	20495
  55  0022 08            	dc.b	8
  56  0023               _IO_BOOST:
  57  0023 500f          	dc.w	20495
  58  0025 40            	dc.b	64
  59  0026               _IO_CHARGE:
  60  0026 5000          	dc.w	20480
  61  0028 08            	dc.b	8
 108                     ; 207 void	phase_excite(uint8_t phase)
 108                     ; 208 {
 110                     	switch	.text
 111  0000               _phase_excite:
 113  0000 88            	push	a
 114       00000000      OFST:	set	0
 117                     ; 209 	if ( !Drive.Run || !Drive.Enabled ) return;
 119  0001 b668          	ld	a,_Drive+1
 120  0003 2705          	jreq	L15
 122  0005 7200006702    	btjt	_Drive,#0,L74
 123  000a               L15:
 127  000a 84            	pop	a
 128  000b 81            	ret	
 129  000c               L74:
 130                     ; 210 	switch(phase)
 132  000c 7b01          	ld	a,(OFST+1,sp)
 134                     ; 232 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
 135  000e 271b          	jreq	L3
 136  0010 4a            	dec	a
 137  0011 2722          	jreq	L5
 138  0013 4a            	dec	a
 139  0014 2732          	jreq	L7
 140  0016 4a            	dec	a
 141  0017 2745          	jreq	L11
 142  0019 4a            	dec	a
 143  001a 274e          	jreq	L31
 144  001c 4a            	dec	a
 145  001d 2757          	jreq	L51
 146  001f 4a            	dec	a
 147  0020 2779          	jreq	L71
 148  0022 4a            	dec	a
 149  0023 2603cc00a5    	jreq	L12
 150  0028 cc00c9        	jra	L55
 151  002b               L3:
 152                     ; 225 		case 0: _H_X1 _L_X2 _H_Y1 _L_Y2 break;
 154  002b 3b000a        	push	_IO_X1+2
 155  002e be08          	ldw	x,_IO_X1
 156  0030 cd0000        	call	_GPIO_WriteHigh
 166  0033 2008          	jp	LC005
 167  0035               L5:
 168                     ; 226 		case 1: _L_X1 _L_X2 _H_Y1 _L_Y2 break;		
 170  0035 3b000a        	push	_IO_X1+2
 171  0038 be08          	ldw	x,_IO_X1
 172  003a cd0000        	call	_GPIO_WriteLow
 176  003d               LC005:
 177  003d 84            	pop	a
 179  003e 3b000d        	push	_IO_X2+2
 180  0041 be0b          	ldw	x,_IO_X2
 181  0043 cd0000        	call	_GPIO_WriteLow
 189  0046 200b          	jp	LC004
 190  0048               L7:
 191                     ; 227 		case 2: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
 193  0048 cd00cb        	call	LC008
 196  004b 3b000d        	push	_IO_X2+2
 197  004e be0b          	ldw	x,_IO_X2
 198  0050 cd0000        	call	_GPIO_WriteHigh
 202  0053               LC004:
 203  0053 84            	pop	a
 206  0054 3b0010        	push	_IO_Y1+2
 207  0057 be0e          	ldw	x,_IO_Y1
 208  0059 cd0000        	call	_GPIO_WriteHigh
 214  005c 2061          	jp	LC002
 215  005e               L11:
 216                     ; 228 		case 3: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
 218  005e ad6b          	call	LC008
 221  0060 3b000d        	push	_IO_X2+2
 222  0063 be0b          	ldw	x,_IO_X2
 223  0065 cd0000        	call	_GPIO_WriteHigh
 231  0068 204c          	jp	LC003
 232  006a               L31:
 233                     ; 229 		case 4: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
 235  006a ad5f          	call	LC008
 238  006c 3b000d        	push	_IO_X2+2
 239  006f be0b          	ldw	x,_IO_X2
 240  0071 cd0000        	call	_GPIO_WriteHigh
 248  0074 2011          	jp	LC006
 249  0076               L51:
 250                     ; 230 		case 5: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
 252  0076 3b000a        	push	_IO_X1+2
 253  0079 be08          	ldw	x,_IO_X1
 254  007b cd0000        	call	_GPIO_WriteLow
 258  007e               LC007:
 259  007e 84            	pop	a
 261  007f 3b000d        	push	_IO_X2+2
 262  0082 be0b          	ldw	x,_IO_X2
 263  0084 cd0000        	call	_GPIO_WriteLow
 270  0087               LC006:
 271  0087 84            	pop	a
 274  0088 3b0010        	push	_IO_Y1+2
 275  008b be0e          	ldw	x,_IO_Y1
 276  008d cd0000        	call	_GPIO_WriteLow
 277  0090 84            	pop	a
 280  0091 3b0013        	push	_IO_Y2+2
 281  0094 be11          	ldw	x,_IO_Y2
 282  0096 cd0000        	call	_GPIO_WriteHigh
 286  0099 202d          	jp	LC001
 287  009b               L71:
 288                     ; 231 		case 6: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
 290  009b 3b000a        	push	_IO_X1+2
 291  009e be08          	ldw	x,_IO_X1
 292  00a0 cd0000        	call	_GPIO_WriteHigh
 302  00a3 20d9          	jp	LC007
 303  00a5               L12:
 304                     ; 232 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
 306  00a5 3b000a        	push	_IO_X1+2
 307  00a8 be08          	ldw	x,_IO_X1
 308  00aa cd0000        	call	_GPIO_WriteHigh
 310  00ad 84            	pop	a
 313  00ae 3b000d        	push	_IO_X2+2
 314  00b1 be0b          	ldw	x,_IO_X2
 315  00b3 cd0000        	call	_GPIO_WriteLow
 319  00b6               LC003:
 320  00b6 84            	pop	a
 322  00b7 3b0010        	push	_IO_Y1+2
 323  00ba be0e          	ldw	x,_IO_Y1
 324  00bc cd0000        	call	_GPIO_WriteLow
 328  00bf               LC002:
 329  00bf 84            	pop	a
 334  00c0 3b0013        	push	_IO_Y2+2
 335  00c3 be11          	ldw	x,_IO_Y2
 336  00c5 cd0000        	call	_GPIO_WriteLow
 338  00c8               LC001:
 339  00c8 84            	pop	a
 342  00c9               L55:
 343                     ; 235 }
 346  00c9 84            	pop	a
 347  00ca 81            	ret	
 348  00cb               LC008:
 349  00cb 3b000a        	push	_IO_X1+2
 350  00ce be08          	ldw	x,_IO_X1
 351  00d0 cd0000        	call	_GPIO_WriteLow
 353  00d3 84            	pop	a
 354  00d4 81            	ret	
 388                     ; 237 uint16_t CPulse( u8 step )
 388                     ; 238 {
 389                     	switch	.text
 390  00d5               _CPulse:
 394                     ; 239 	return (uint16_t)step * 26;  // 20180509  change to 5200 pulse
 396  00d5 5f            	clrw	x
 397  00d6 97            	ld	xl,a
 398  00d7 90ae001a      	ldw	y,#26
 402  00db cc0000        	jp	c_imul
 455                     ; 242 u8  Diff(uint16_t time, uint16_t diff)				
 455                     ; 243 {
 456                     	switch	.text
 457  00de               _Diff:
 459  00de 89            	pushw	x
 460  00df 89            	pushw	x
 461       00000002      OFST:	set	2
 464                     ; 244 	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
 466  00e0 b381          	cpw	x,_Ticks_1mS
 467  00e2 2207          	jrugt	L211
 468  00e4 be81          	ldw	x,_Ticks_1mS
 469  00e6 72f003        	subw	x,(OFST+1,sp)
 470  00e9 200a          	jra	L411
 471  00eb               L211:
 472  00eb aeffff        	ldw	x,#65535
 473  00ee 72f003        	subw	x,(OFST+1,sp)
 474  00f1 72bb0081      	addw	x,_Ticks_1mS
 475  00f5               L411:
 476  00f5 1f01          	ldw	(OFST-1,sp),x
 478                     ; 245 	return _t > diff ? 1 : 0;
 480  00f7 1307          	cpw	x,(OFST+5,sp)
 481  00f9 2304          	jrule	L611
 482  00fb a601          	ld	a,#1
 483  00fd 2001          	jra	L021
 484  00ff               L611:
 485  00ff 4f            	clr	a
 486  0100               L021:
 489  0100 5b04          	addw	sp,#4
 490  0102 81            	ret	
 526                     ; 248 uint16_t	stepPrepare(uint8_t i)
 526                     ; 249 {
 527                     	switch	.text
 528  0103               _stepPrepare:
 530  0103 88            	push	a
 531       00000000      OFST:	set	0
 534                     ; 250 	dutyInfo.s -= dutyInfo.b[i];
 536  0104 5f            	clrw	x
 537  0105 97            	ld	xl,a
 538  0106 e684          	ld	a,(_dutyInfo,x)
 539  0108 5f            	clrw	x
 540  0109 97            	ld	xl,a
 541  010a 72b000ae      	subw	x,_dutyInfo+42
 542  010e 50            	negw	x
 543  010f bfae          	ldw	_dutyInfo+42,x
 544                     ; 251 	dutyInfo.b[i] = Pwm.Duty;
 546  0111 5f            	clrw	x
 547  0112 7b01          	ld	a,(OFST+1,sp)
 548  0114 97            	ld	xl,a
 549  0115 b664          	ld	a,_Pwm+13
 550  0117 e784          	ld	(_dutyInfo,x),a
 551                     ; 252 	dutyInfo.s += dutyInfo.b[i];
 553  0119 5f            	clrw	x
 554  011a 7b01          	ld	a,(OFST+1,sp)
 555  011c 97            	ld	xl,a
 556  011d e684          	ld	a,(_dutyInfo,x)
 557  011f bbaf          	add	a,_dutyInfo+43
 558  0121 b7af          	ld	_dutyInfo+43,a
 559  0123 2402          	jrnc	L421
 560  0125 3cae          	inc	_dutyInfo+42
 561  0127               L421:
 562                     ; 253 	return dutyInfo.s;
 564  0127 beae          	ldw	x,_dutyInfo+42
 567  0129 84            	pop	a
 568  012a 81            	ret	
 613                     ; 256 uint8_t	stepCalc(uint16_t duty)
 613                     ; 257 {
 614                     	switch	.text
 615  012b               _stepCalc:
 617  012b 89            	pushw	x
 618  012c 89            	pushw	x
 619       00000002      OFST:	set	2
 622                     ; 259 	if ( dutyInfo.n < 16 )
 624  012d b6ad          	ld	a,_dutyInfo+41
 625  012f a110          	cp	a,#16
 626  0131 2404          	jruge	L361
 627                     ; 260 		dutyInfo.n ++;
 629  0133 3cad          	inc	_dutyInfo+41
 630  0135 b6ad          	ld	a,_dutyInfo+41
 631  0137               L361:
 632                     ; 261 	t = (duty / dutyInfo.n) * 2 + 1;	
 634  0137 62            	div	x,a
 635  0138 58            	sllw	x
 636  0139 5c            	incw	x
 637  013a 1f01          	ldw	(OFST-1,sp),x
 639                     ; 262 	t /= 2;
 641  013c 0401          	srl	(OFST-1,sp)
 642  013e 0602          	rrc	(OFST+0,sp)
 644                     ; 263 	if( t < 20 )	t = 20;
 646  0140 1e01          	ldw	x,(OFST-1,sp)
 647  0142 a30014        	cpw	x,#20
 648  0145 2403          	jruge	L561
 651  0147 ae0014        	ldw	x,#20
 653  014a               L561:
 654                     ; 264 	if( t > 180 )	t = 180;
 656  014a a300b5        	cpw	x,#181
 657  014d 2503          	jrult	L761
 660  014f ae00b4        	ldw	x,#180
 662  0152               L761:
 663                     ; 266 	t = (625 * t)/10 -1250;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
 665  0152 90ae0271      	ldw	y,#625
 666  0156 cd0000        	call	c_imul
 668  0159 a60a          	ld	a,#10
 669  015b 62            	div	x,a
 670  015c 1d04e2        	subw	x,#1250
 672                     ; 267 	t = (t / 25 + 1 ) /	2;
 674  015f a619          	ld	a,#25
 675  0161 62            	div	x,a
 676  0162 5c            	incw	x
 677  0163 54            	srlw	x
 678  0164 1f01          	ldw	(OFST-1,sp),x
 680                     ; 269 	Drive.PreStep = Drive.Step;
 682  0166 457d7e        	mov	_Drive+23,_Drive+22
 683                     ; 270 	return (uint8_t)t;
 685  0169 7b02          	ld	a,(OFST+0,sp)
 688  016b 5b04          	addw	sp,#4
 689  016d 81            	ret	
 716                     ; 273 void	waitPowerDelay(void)
 716                     ; 274 {
 717                     	switch	.text
 718  016e               _waitPowerDelay:
 722                     ; 275 	LightOn
 724  016e 3b0004        	push	_IO_LED+2
 725  0171 be02          	ldw	x,_IO_LED
 726  0173 cd0000        	call	_GPIO_WriteLow
 728  0176 84            	pop	a
 730  0177               L302:
 731                     ; 276 	while( Ticks_1mS < TIME_POWERDELAY );
 733  0177 be81          	ldw	x,_Ticks_1mS
 734  0179 a301f3        	cpw	x,#499
 735  017c 25f9          	jrult	L302
 736                     ; 277 	LightOff
 738  017e 3b0004        	push	_IO_LED+2
 739  0181 be02          	ldw	x,_IO_LED
 740  0183 cd0000        	call	_GPIO_WriteHigh
 742  0186 84            	pop	a
 743                     ; 279 }
 746  0187 81            	ret	
 792                     ; 281 void StartDriveOR( uint16_t tPos, uint8_t overrun )
 792                     ; 282 {
 793                     	switch	.text
 794  0188               _StartDriveOR:
 796  0188 89            	pushw	x
 797       00000000      OFST:	set	0
 800                     ; 284 	motorWatch.step[motorWatch.i] = tPos;
 802  0189 b620          	ld	a,_motorWatch+32
 803  018b 905f          	clrw	y
 804  018d 9097          	ld	yl,a
 805  018f 9058          	sllw	y
 806  0191 90ef00        	ldw	(_motorWatch,y),x
 807                     ; 285 	motorWatch.i = (motorWatch.i + 1) % MAX_MOTORWATCH;
 809  0194 5f            	clrw	x
 810  0195 97            	ld	xl,a
 811  0196 5c            	incw	x
 812  0197 a610          	ld	a,#16
 813  0199 cd0000        	call	c_smodx
 815  019c 01            	rrwa	x,a
 816  019d b720          	ld	_motorWatch+32,a
 817                     ; 286 	motorWatch.step[motorWatch.i] = 0;
 819  019f 5f            	clrw	x
 820  01a0 97            	ld	xl,a
 821  01a1 58            	sllw	x
 822  01a2 905f          	clrw	y
 823  01a4 ef00          	ldw	(_motorWatch,x),y
 824                     ; 289 	if ( Drive.Run || (Drive.Position==tPos) ) return;
 826  01a6 b668          	ld	a,_Drive+1
 827  01a8 2653          	jrne	L441
 829  01aa be6c          	ldw	x,_Drive+5
 830  01ac 1301          	cpw	x,(OFST+1,sp)
 833  01ae 274d          	jreq	L441
 834                     ; 290 	if ( tPos == 0 )				//  goto origin
 836  01b0 1e01          	ldw	x,(OFST+1,sp)
 837  01b2 261a          	jrne	L532
 838                     ; 292 		Drive.ZeroOffset = CPulse( OVER_STEP );
 840  01b4 a61e          	ld	a,#30
 841  01b6 cd00d5        	call	_CPulse
 843  01b9 bf73          	ldw	_Drive+12,x
 844                     ; 293 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
 846  01bb be6c          	ldw	x,_Drive+5
 847  01bd 72bb0073      	addw	x,_Drive+12
 848  01c1 bf6c          	ldw	_Drive+5,x
 849                     ; 294 		Drive.Overrun =	Drive.Target = 0;
 851  01c3 5f            	clrw	x
 852  01c4 bf6e          	ldw	_Drive+7,x
 853  01c6 bf70          	ldw	_Drive+9,x
 854                     ; 295 		Drive.Dir = nMotorClose;
 856  01c8 72150069      	bres	_Drive+2,#2
 858  01cc 2028          	jra	L732
 859  01ce               L532:
 860                     ; 299 		if (Drive.Position >= tPos)	// Closing
 862  01ce be6c          	ldw	x,_Drive+5
 863  01d0 1301          	cpw	x,(OFST+1,sp)
 864  01d2 250b          	jrult	L142
 865                     ; 301 			Drive.Overrun =	Drive.Overrun2 = 0;
 867  01d4 3f72          	clr	_Drive+11
 868  01d6 5f            	clrw	x
 869  01d7 bf70          	ldw	_Drive+9,x
 870                     ; 302 			Drive.Dir = nMotorClose;
 872  01d9 72150069      	bres	_Drive+2,#2
 874  01dd 2008          	jra	L342
 875  01df               L142:
 876                     ; 306 			Drive.Overrun2 = overrun;
 878  01df 7b05          	ld	a,(OFST+5,sp)
 879  01e1 b772          	ld	_Drive+11,a
 880                     ; 307 			Drive.Dir = nMotorOpen;
 882  01e3 72140069      	bset	_Drive+2,#2
 883  01e7               L342:
 884                     ; 309 		Drive.Target = tPos + Drive.Overrun2;
 886  01e7 7b01          	ld	a,(OFST+1,sp)
 887  01e9 97            	ld	xl,a
 888  01ea 7b02          	ld	a,(OFST+2,sp)
 889  01ec bb72          	add	a,_Drive+11
 890  01ee 2401          	jrnc	L241
 891  01f0 5c            	incw	x
 892  01f1               L241:
 893  01f1 b76f          	ld	_Drive+8,a
 894  01f3 9f            	ld	a,xl
 895  01f4 b76e          	ld	_Drive+7,a
 896  01f6               L732:
 897                     ; 311 	Drive.Run = TRUE;
 899  01f6 35010068      	mov	_Drive+1,#1
 900                     ; 312 	Drive.Ticks = Drive.Interval;
 902  01fa 457a7b        	mov	_Drive+20,_Drive+19
 903                     ; 313 }
 904  01fd               L441:
 907  01fd 85            	popw	x
 908  01fe 81            	ret	
 933                     ; 315 u8	ZeroPos(void)
 933                     ; 316 {
 934                     	switch	.text
 935  01ff               _ZeroPos:
 939                     ; 317 	if( Drive.Run != 0 ) return 0;
 941  01ff b668          	ld	a,_Drive+1
 942  0201 2702          	jreq	L552
 945  0203 4f            	clr	a
 948  0204 81            	ret	
 949  0205               L552:
 950                     ; 318 	if( Drive.Origin == 1 ) return 1;
 952  0205 b66a          	ld	a,_Drive+3
 953  0207 4a            	dec	a
 954  0208 2602          	jrne	L752
 957  020a 4c            	inc	a
 960  020b 81            	ret	
 961  020c               L752:
 962                     ; 319 	StartDriveOR(0, OFFSET_OVERRUN);	// Goto Zero position
 964  020c 4b00          	push	#0
 965  020e 5f            	clrw	x
 966  020f cd0188        	call	_StartDriveOR
 968  0212 84            	pop	a
 969                     ; 320 	return 0;
 971  0213 4f            	clr	a
 974  0214 81            	ret	
1013                     ; 323 void	LightControl(uint16_t t)
1013                     ; 324 {
1014                     	switch	.text
1015  0215               _LightControl:
1017  0215 89            	pushw	x
1018       00000000      OFST:	set	0
1021                     ; 325 	if ( Diff (Timer.Led, ledint) == 0 )
1023  0216 be00          	ldw	x,_ledint
1024  0218 89            	pushw	x
1025  0219 be21          	ldw	x,_Timer
1026  021b cd00de        	call	_Diff
1028  021e 4d            	tnz	a
1029  021f 85            	popw	x
1030  0220 270d          	jreq	L061
1031                     ; 326 		return;
1033                     ; 327 	Timer.Led = t;
1035  0222 1e01          	ldw	x,(OFST+1,sp)
1036  0224 bf21          	ldw	_Timer,x
1037                     ; 328 	LightToggle
1039  0226 be02          	ldw	x,_IO_LED
1040  0228 3b0004        	push	_IO_LED+2
1041  022b cd0000        	call	_GPIO_WriteReverse
1043  022e 84            	pop	a
1044                     ; 330 }
1045  022f               L061:
1048  022f 85            	popw	x
1049  0230 81            	ret	
1087                     ; 332 void MotorService(uint8_t step)
1087                     ; 333 {
1088                     	switch	.text
1089  0231               _MotorService:
1091  0231 88            	push	a
1092       00000000      OFST:	set	0
1095                     ; 334 	if ( step > 205 ) step = 205;
1097  0232 a1ce          	cp	a,#206
1098  0234 2504          	jrult	L713
1101  0236 a6cd          	ld	a,#205
1102  0238 6b01          	ld	(OFST+1,sp),a
1103  023a               L713:
1104                     ; 335 	if ( step < 20 ) step = 0;
1106  023a 7b01          	ld	a,(OFST+1,sp)
1107  023c a114          	cp	a,#20
1108  023e 2402          	jruge	L123
1111  0240 0f01          	clr	(OFST+1,sp)
1112  0242               L123:
1113                     ; 336 	StartDriveOR( CPulse(step), OFFSET_OVERRUN );
1115  0242 4b00          	push	#0
1116  0244 7b02          	ld	a,(OFST+2,sp)
1117  0246 cd00d5        	call	_CPulse
1119  0249 cd0188        	call	_StartDriveOR
1121  024c be81          	ldw	x,_Ticks_1mS
1122  024e bf23          	ldw	_Timer+2,x
1123  0250 84            	pop	a
1124                     ; 337 	Timer.Motor = Ticks_1mS;
1126                     ; 338 }
1129  0251 84            	pop	a
1130  0252 81            	ret	
1159                     ; 340 void StopDrive(void)
1159                     ; 341 {
1160                     	switch	.text
1161  0253               _StopDrive:
1165                     ; 342 	_L_X1 _L_X2 _L_Y1 _L_Y2
1167  0253 3b000a        	push	_IO_X1+2
1168  0256 be08          	ldw	x,_IO_X1
1169  0258 cd0000        	call	_GPIO_WriteLow
1171  025b 84            	pop	a
1174  025c 3b000d        	push	_IO_X2+2
1175  025f be0b          	ldw	x,_IO_X2
1176  0261 cd0000        	call	_GPIO_WriteLow
1178  0264 84            	pop	a
1181  0265 3b0010        	push	_IO_Y1+2
1182  0268 be0e          	ldw	x,_IO_Y1
1183  026a cd0000        	call	_GPIO_WriteLow
1185  026d 84            	pop	a
1188  026e 3b0013        	push	_IO_Y2+2
1189  0271 be11          	ldw	x,_IO_Y2
1190  0273 cd0000        	call	_GPIO_WriteLow
1192  0276 3f68          	clr	_Drive+1
1193  0278 84            	pop	a
1194                     ; 343 	Drive.Run = FALSE;
1196                     ; 344 }
1199  0279 81            	ret	
1226                     ; 348 void DriveService(void)
1226                     ; 349 {
1227                     	switch	.text
1228  027a               _DriveService:
1230  027a 89            	pushw	x
1231       00000002      OFST:	set	2
1234                     ; 350 	if ( !Drive.Run ) 
1236  027b b668          	ld	a,_Drive+1
1237                     ; 352 		StopDrive();
1239                     ; 353 		return;
1241  027d 2731          	jreq	LC009
1242                     ; 355 	if ( Drive.Target > Drive.Position )
1244  027f be6e          	ldw	x,_Drive+7
1245  0281 b36c          	cpw	x,_Drive+5
1246  0283 2306          	jrule	L543
1247                     ; 357 	 	MotorStep(nMotorOpen);
1249  0285 a601          	ld	a,#1
1250  0287 ad66          	call	_MotorStep
1252                     ; 358 		return;
1253  0289               L412:
1256  0289 85            	popw	x
1257  028a 81            	ret	
1258  028b               L543:
1259                     ; 360 	if ( Drive.Target < Drive.Position )
1261  028b b36c          	cpw	x,_Drive+5
1262  028d 2405          	jruge	L743
1263                     ; 362 		MotorClose( );
1265  028f cd032a        	call	_MotorClose
1267                     ; 363 		return;
1269  0292 20f5          	jra	L412
1270  0294               L743:
1271                     ; 365 	if ( Drive.Target ) 	// on target position
1273  0294 be6e          	ldw	x,_Drive+7
1274  0296 2713          	jreq	L153
1275                     ; 367 		if ( Drive.Overrun2 )
1277  0298 b672          	ld	a,_Drive+11
1278  029a 270f          	jreq	L153
1279                     ; 369 			Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1281  029c 5f            	clrw	x
1282  029d 97            	ld	xl,a
1283  029e 1f01          	ldw	(OFST-1,sp),x
1285  02a0 be6e          	ldw	x,_Drive+7
1286  02a2 72f001        	subw	x,(OFST-1,sp)
1287  02a5 bf6e          	ldw	_Drive+7,x
1288                     ; 370 			Drive.Overrun2 = 0;
1290  02a7 3f72          	clr	_Drive+11
1291                     ; 371 			return;
1293  02a9 20de          	jra	L412
1294  02ab               L153:
1295                     ; 374 	Drive.ZeroOffset = Drive.Overrun = 0;
1297  02ab 5f            	clrw	x
1298  02ac bf70          	ldw	_Drive+9,x
1299  02ae bf73          	ldw	_Drive+12,x
1300                     ; 375 	StopDrive();	
1302  02b0               LC009:
1304  02b0 ada1          	call	_StopDrive
1306                     ; 376 }
1308  02b2 20d5          	jra	L412
1352                     ; 378 void	MotorStepPhase(uint8_t dir)
1352                     ; 379 {
1353                     	switch	.text
1354  02b4               _MotorStepPhase:
1356  02b4 88            	push	a
1357       00000001      OFST:	set	1
1360                     ; 380 	uint8_t offset = 0;
1362                     ; 381 	if( dir == 1 )
1364  02b5 4a            	dec	a
1365  02b6 2611          	jrne	L773
1366                     ; 383 		Drive.Position--;
1368  02b8 be6c          	ldw	x,_Drive+5
1369  02ba 5a            	decw	x
1370  02bb bf6c          	ldw	_Drive+5,x
1371                     ; 384 		offset = Drive.NormalOpen ? 1 : -1;
1373  02bd 7201006b03    	btjf	_Drive+4,#0,L022
1374  02c2 4c            	inc	a
1375  02c3 2014          	jra	L622
1376  02c5               L022:
1377  02c5 a6ff          	ld	a,#255
1379  02c7 2010          	jra	L622
1380  02c9               L773:
1381                     ; 388 		Drive.Position++;
1383  02c9 be6c          	ldw	x,_Drive+5
1384  02cb 5c            	incw	x
1385  02cc bf6c          	ldw	_Drive+5,x
1386                     ; 389 		offset = Drive.NormalOpen ? -1 : 1;
1388  02ce 7201006b04    	btjf	_Drive+4,#0,L422
1389  02d3 a6ff          	ld	a,#255
1390  02d5 2002          	jra	L622
1391  02d7               L422:
1392  02d7 a601          	ld	a,#1
1393  02d9               L622:
1395                     ; 391 	Drive.Phase += offset;
1397  02d9 bb75          	add	a,_Drive+14
1398  02db b775          	ld	_Drive+14,a
1399                     ; 392 }
1402  02dd 84            	pop	a
1403  02de 81            	ret	
1428                     ; 394 void	MotorStepSetOverrun(void)
1428                     ; 395 {
1429                     	switch	.text
1430  02df               _MotorStepSetOverrun:
1434                     ; 396 	Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1436  02df be78          	ldw	x,_Drive+17
1437  02e1 1d0028        	subw	x,#40
1438                     ; 397 	if ( Drive.MaxOverrun > OVERRUN )
1440  02e4 a3012d        	cpw	x,#301
1441  02e7 2503          	jrult	L314
1442                     ; 398 		Drive.MaxOverrun = OVERRUN;				
1444  02e9 ae012c        	ldw	x,#300
1445  02ec               L314:
1446  02ec bf76          	ldw	_Drive+15,x
1447                     ; 399 }
1450  02ee 81            	ret	
1510                     ; 401 void MotorStep(MOTOR_DIR Dir)
1510                     ; 402 {
1511                     	switch	.text
1512  02ef               _MotorStep:
1516                     ; 403 	if( Dir == nMotorClose )
1518  02ef 4d            	tnz	a
1519  02f0 2619          	jrne	L344
1520                     ; 405 		if( Drive.Position != 0 ) 
1522  02f2 be6c          	ldw	x,_Drive+5
1523  02f4 2703          	jreq	L544
1524                     ; 406 			MotorStepPhase(1);
1526  02f6 4c            	inc	a
1527  02f7 adbb          	call	_MotorStepPhase
1529  02f9               L544:
1530                     ; 408 		if( Drive.Position == 0 ) 
1532  02f9 be6c          	ldw	x,_Drive+5
1533  02fb 2626          	jrne	L154
1534                     ; 410 			Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0;
1536  02fd 5f            	clrw	x
1537  02fe bf6e          	ldw	_Drive+7,x
1538  0300 bf6c          	ldw	_Drive+5,x
1539  0302 bf73          	ldw	_Drive+12,x
1540  0304 bf70          	ldw	_Drive+9,x
1541                     ; 411 			StopDrive();	
1543  0306 cd0253        	call	_StopDrive
1545  0309 2018          	jra	L154
1546  030b               L344:
1547                     ; 417 		MotorStepPhase(0);
1549  030b 4f            	clr	a
1550  030c ada6          	call	_MotorStepPhase
1552                     ; 419 		if( Drive.Origin ) 
1554  030e b66a          	ld	a,_Drive+3
1555  0310 270a          	jreq	L354
1556                     ; 421 			Drive.ORGPosition = Drive.Position;
1558  0312 be6c          	ldw	x,_Drive+5
1559  0314 bf78          	ldw	_Drive+17,x
1560                     ; 422 			Drive.LastOrigin = TRUE;
1562  0316 72120069      	bset	_Drive+2,#1
1564  031a 2007          	jra	L154
1565  031c               L354:
1566                     ; 426 			if ( Drive.LastOrigin )
1568  031c 7203006902    	btjf	_Drive+2,#1,L154
1569                     ; 427 				MotorStepSetOverrun();
1571  0321 adbc          	call	_MotorStepSetOverrun
1573  0323               L154:
1574                     ; 430 	phase_excite(Drive.Phase%8);
1576  0323 b675          	ld	a,_Drive+14
1577  0325 a407          	and	a,#7
1579                     ; 431 }
1582  0327 cc0000        	jp	_phase_excite
1608                     ; 433 void MotorClose(void)
1608                     ; 434 {
1609                     	switch	.text
1610  032a               _MotorClose:
1614                     ; 435 	if ( !Drive.Origin )   		// Hall IC Sensing 
1616  032a b66a          	ld	a,_Drive+3
1617  032c 2602          	jrne	L174
1618                     ; 437 		MotorStep(nMotorClose);
1621                     ; 438 		return;
1624  032e 20bf          	jp	_MotorStep
1625  0330               L174:
1626                     ; 440 	if ( Drive.Overrun >= Drive.MaxOverrun )
1628  0330 be70          	ldw	x,_Drive+9
1629  0332 b376          	cpw	x,_Drive+15
1630  0334 250c          	jrult	L374
1631                     ; 442 		Drive.Target = Drive.Position = Drive.Overrun = Drive.ZeroOffset = 0;
1633  0336 5f            	clrw	x
1634  0337 bf73          	ldw	_Drive+12,x
1635  0339 bf70          	ldw	_Drive+9,x
1636  033b bf6c          	ldw	_Drive+5,x
1637  033d bf6e          	ldw	_Drive+7,x
1638                     ; 443 		StopDrive();
1641                     ; 444 		return;
1644  033f cc0253        	jp	_StopDrive
1645  0342               L374:
1646                     ; 446 	Drive.Overrun++;
1648  0342 5c            	incw	x
1649  0343 bf70          	ldw	_Drive+9,x
1650                     ; 447 	MotorStep(nMotorClose);
1652  0345 4f            	clr	a
1654                     ; 448 }
1657  0346 20a7          	jp	_MotorStep
1712                     ; 450 void	factory(uint8_t mode)
1712                     ; 451 {
1713                     	switch	.text
1714  0348               _factory:
1716  0348 5204          	subw	sp,#4
1717       00000004      OFST:	set	4
1720                     ; 452 	uint16_t t = 0, _t = 0;
1722  034a 5f            	clrw	x
1723  034b 1f01          	ldw	(OFST-3,sp),x
1727  034d 1f03          	ldw	(OFST-1,sp),x
1729                     ; 453 	if( mode == 0 )
1731  034f 4d            	tnz	a
1732  0350 2603          	jrne	L525
1733                     ; 454 		return;
1736  0352 5b04          	addw	sp,#4
1737  0354 81            	ret	
1738  0355               L525:
1739                     ; 457 		if( Ticks_1mS == _t )
1741  0355 be81          	ldw	x,_Ticks_1mS
1742  0357 1303          	cpw	x,(OFST-1,sp)
1743  0359 27fa          	jreq	L525
1744                     ; 458 			continue;
1746                     ; 459 		_t = Ticks_1mS;
1748  035b be81          	ldw	x,_Ticks_1mS
1749  035d 1f03          	ldw	(OFST-1,sp),x
1751                     ; 460 		t++;
1753  035f 1e01          	ldw	x,(OFST-3,sp)
1754  0361 5c            	incw	x
1755  0362 1f01          	ldw	(OFST-3,sp),x
1757                     ; 461 		if( t > 200 )
1759  0364 a300c9        	cpw	x,#201
1760  0367 25ec          	jrult	L525
1761                     ; 463 			LightToggle
1763  0369 3b0004        	push	_IO_LED+2
1764  036c be02          	ldw	x,_IO_LED
1765  036e cd0000        	call	_GPIO_WriteReverse
1767  0371 84            	pop	a
1768  0372 20e1          	jra	L525
1793                     ; 468 void Clock_Config(void)
1793                     ; 469 {
1794                     	switch	.text
1795  0374               _Clock_Config:
1799                     ; 475 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
1801  0374 4f            	clr	a
1802  0375 cd0000        	call	_CLK_SYSCLKConfig
1804                     ; 476 	CLK_HSICmd(ENABLE);
1806  0378 a601          	ld	a,#1
1808                     ; 477 }
1811  037a cc0000        	jp	_CLK_HSICmd
1861                     ; 479 void Gpio_CheckMode(void)
1861                     ; 480 {
1862                     	switch	.text
1863  037d               _Gpio_CheckMode:
1865       00000002      OFST:	set	2
1868                     ; 481 	uint8_t t = 0;
1870                     ; 482 	uint8_t prev = 0;
1872                     ; 484 	Drive.DeviceType = TYPE_MD24;
1874  037d 35010080      	mov	_Drive+25,#1
1875                     ; 485 	Ticks_1mS = 0;
1877  0381 5f            	clrw	x
1878  0382 bf81          	ldw	_Ticks_1mS,x
1879                     ; 486 	return;
1882  0384 81            	ret	
1920                     ; 519 void Gpio_Config(void)
1920                     ; 520 {
1921                     	switch	.text
1922  0385               _Gpio_Config:
1926                     ; 521 	Gpio_CheckMode();
1928  0385 adf6          	call	_Gpio_CheckMode
1930                     ; 523 	GPIO_SET(LED, GPIO_MODE_OUT_PP_LOW_FAST)
1932  0387 4be0          	push	#224
1933  0389 3b0004        	push	_IO_LED+2
1934  038c be02          	ldw	x,_IO_LED
1935  038e cd0000        	call	_GPIO_Init
1937  0391 85            	popw	x
1938                     ; 524 	GPIO_SET(ORG, GPIO_MODE_IN_FL_NO_IT)
1940  0392 4b00          	push	#0
1941  0394 3b0007        	push	_IO_ORG+2
1942  0397 be05          	ldw	x,_IO_ORG
1943  0399 cd0000        	call	_GPIO_Init
1945  039c 85            	popw	x
1946                     ; 525 	GPIO_SET(X1, GPIO_MODE_OUT_PP_LOW_FAST)
1948  039d 4be0          	push	#224
1949  039f 3b000a        	push	_IO_X1+2
1950  03a2 be08          	ldw	x,_IO_X1
1951  03a4 cd0000        	call	_GPIO_Init
1953  03a7 85            	popw	x
1954                     ; 526 	GPIO_SET(X2, GPIO_MODE_OUT_PP_LOW_FAST)
1956  03a8 4be0          	push	#224
1957  03aa 3b000d        	push	_IO_X2+2
1958  03ad be0b          	ldw	x,_IO_X2
1959  03af cd0000        	call	_GPIO_Init
1961  03b2 85            	popw	x
1962                     ; 527 	GPIO_SET(Y1, GPIO_MODE_OUT_PP_LOW_FAST)
1964  03b3 4be0          	push	#224
1965  03b5 3b0010        	push	_IO_Y1+2
1966  03b8 be0e          	ldw	x,_IO_Y1
1967  03ba cd0000        	call	_GPIO_Init
1969  03bd 85            	popw	x
1970                     ; 528 	GPIO_SET(Y2, GPIO_MODE_OUT_PP_LOW_FAST)
1972  03be 4be0          	push	#224
1973  03c0 3b0013        	push	_IO_Y2+2
1974  03c3 be11          	ldw	x,_IO_Y2
1975  03c5 cd0000        	call	_GPIO_Init
1977  03c8 85            	popw	x
1978                     ; 529 	StopDrive();
1980  03c9 cd0253        	call	_StopDrive
1982                     ; 531 	GPIO_SET(ADJ, GPIO_MODE_IN_FL_NO_IT)
1984  03cc 4b00          	push	#0
1985  03ce 3b0016        	push	_IO_ADJ+2
1986  03d1 be14          	ldw	x,_IO_ADJ
1987  03d3 cd0000        	call	_GPIO_Init
1989  03d6 85            	popw	x
1990                     ; 532 	GPIO_SET(SEN, GPIO_MODE_IN_FL_NO_IT)
1992  03d7 4b00          	push	#0
1993  03d9 3b0019        	push	_IO_SEN+2
1994  03dc be17          	ldw	x,_IO_SEN
1995  03de cd0000        	call	_GPIO_Init
1997  03e1 85            	popw	x
1998                     ; 533 	GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
2000  03e2 4b00          	push	#0
2001  03e4 3b001c        	push	_IO_POWER+2
2002  03e7 be1a          	ldw	x,_IO_POWER
2003  03e9 cd0000        	call	_GPIO_Init
2005  03ec b680          	ld	a,_Drive+25
2006  03ee 4a            	dec	a
2007  03ef 85            	popw	x
2008                     ; 534 	if( Drive.DeviceType == TYPE_MD24 )
2010  03f0 2601          	jrne	L775
2011                     ; 536 		return;
2014  03f2 81            	ret	
2015  03f3               L775:
2016                     ; 539 	GPIO_SET(BAT, GPIO_MODE_IN_FL_NO_IT)
2018  03f3 4b00          	push	#0
2019  03f5 3b0022        	push	_IO_BAT+2
2020  03f8 be20          	ldw	x,_IO_BAT
2021  03fa cd0000        	call	_GPIO_Init
2023  03fd b680          	ld	a,_Drive+25
2024  03ff a102          	cp	a,#2
2025  0401 85            	popw	x
2026                     ; 541 	if( Drive.DeviceType == TYPE_MD12 )
2028  0402 2616          	jrne	L106
2029                     ; 543 		GPIO_SET(BOOST, GPIO_MODE_IN_FL_NO_IT)
2031  0404 4b00          	push	#0
2032  0406 3b0025        	push	_IO_BOOST+2
2033  0409 be23          	ldw	x,_IO_BOOST
2034  040b cd0000        	call	_GPIO_Init
2036  040e 85            	popw	x
2037                     ; 544 		GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
2039  040f 4b00          	push	#0
2040  0411 3b001c        	push	_IO_POWER+2
2041  0414 be1a          	ldw	x,_IO_POWER
2042  0416 cd0000        	call	_GPIO_Init
2044  0419 85            	popw	x
2045  041a               L106:
2046                     ; 546 }
2049  041a 81            	ret	
2072                     ; 548 OnTimer_1S(void) {}
2073                     	switch	.text
2074  041b               _OnTimer_1S:
2081  041b 81            	ret	
2084                     	bsct
2085  0029               __chan:
2086  0029 03            	dc.b	3
2087  002a 04            	dc.b	4
2088  002b 05            	dc.b	5
2089  002c 06            	dc.b	6
2090  002d 02            	dc.b	2
2091  002e               __chanSchmit:
2092  002e 03            	dc.b	3
2093  002f 04            	dc.b	4
2094  0030 05            	dc.b	5
2095  0031 06            	dc.b	6
2096  0032 02            	dc.b	2
2097  0033               __chanId:
2098  0033 01            	dc.b	1
2099  0034 02            	dc.b	2
2100  0035 03            	dc.b	3
2101  0036 04            	dc.b	4
2102  0037 00            	dc.b	0
2145                     ; 564 void	AdcGetCode(uint8_t ch)
2145                     ; 565 {
2146                     	switch	.text
2147  041c               _AdcGetCode:
2149  041c 88            	push	a
2150  041d 5203          	subw	sp,#3
2151       00000003      OFST:	set	3
2154                     ; 570 	uint8_t i = 0;
2156                     ; 572 	Adc.buf[ch].b[i] = ADC1_GetConversionValue();
2158  041f cd0000        	call	_ADC1_GetConversionValue
2160  0422 1f01          	ldw	(OFST-2,sp),x
2162  0424 7b04          	ld	a,(OFST+1,sp)
2163  0426 97            	ld	xl,a
2164  0427 a609          	ld	a,#9
2165  0429 42            	mul	x,a
2166  042a 1601          	ldw	y,(OFST-2,sp)
2167  042c ef2a          	ldw	(_Adc+1,x),y
2168                     ; 573 }
2171  042e 5b04          	addw	sp,#4
2172  0430 81            	ret	
2204                     ; 575 void Adc_Config(void)
2204                     ; 576 {
2205                     	switch	.text
2206  0431               _Adc_Config:
2210                     ; 577 	AdcGetCode(Adc.ch);
2212  0431 b629          	ld	a,_Adc
2213  0433 ade7          	call	_AdcGetCode
2215                     ; 578 	Adc.ch = _chanId[Adc.ch];
2217  0435 b629          	ld	a,_Adc
2218  0437 5f            	clrw	x
2219  0438 97            	ld	xl,a
2220  0439 e633          	ld	a,(__chanId,x)
2221  043b b729          	ld	_Adc,a
2222                     ; 580 	if( Drive.DeviceType == TYPE_MD24 )
2224  043d b680          	ld	a,_Drive+25
2225  043f 4a            	dec	a
2226  0440 2612          	jrne	L546
2227                     ; 582 		if( Adc.ch == 1 )
2229  0442 b629          	ld	a,_Adc
2230  0444 a101          	cp	a,#1
2231  0446 2604          	jrne	L746
2232                     ; 583 			Adc.ch = 2;
2234  0448 a602          	ld	a,#2
2235  044a b729          	ld	_Adc,a
2236  044c               L746:
2237                     ; 584 		if( Adc.ch == 3 )
2239  044c a103          	cp	a,#3
2240  044e 2604          	jrne	L546
2241                     ; 585 			Adc.ch = 4;
2243  0450 35040029      	mov	_Adc,#4
2244  0454               L546:
2245                     ; 588 	ADC1_DeInit();
2247  0454 cd0000        	call	_ADC1_DeInit
2249                     ; 589 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
2249                     ; 590 		_chan[Adc.ch], 
2249                     ; 591 		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
2249                     ; 592 		_chanSchmit[Adc.ch],
2249                     ; 593 	   	DISABLE
2249                     ; 594 		);
2251  0457 4b00          	push	#0
2252  0459 b629          	ld	a,_Adc
2253  045b 5f            	clrw	x
2254  045c 97            	ld	xl,a
2255  045d e62e          	ld	a,(__chanSchmit,x)
2256  045f 88            	push	a
2257  0460 4b08          	push	#8
2258  0462 4b00          	push	#0
2259  0464 4b00          	push	#0
2260  0466 4b00          	push	#0
2261  0468 b629          	ld	a,_Adc
2262  046a 5f            	clrw	x
2263  046b 97            	ld	xl,a
2264  046c e629          	ld	a,(__chan,x)
2265  046e 5f            	clrw	x
2266  046f 97            	ld	xl,a
2267  0470 cd0000        	call	_ADC1_Init
2269  0473 5b06          	addw	sp,#6
2270                     ; 595 	ADC1_StartConversion();		
2273                     ; 596 }
2276  0475 cc0000        	jp	_ADC1_StartConversion
2311                     ; 598 void	AdcGetAvg(uint8_t ch)
2311                     ; 599 {
2312                     	switch	.text
2313  0478               _AdcGetAvg:
2315  0478 88            	push	a
2316       00000000      OFST:	set	0
2319                     ; 607 	Adc.buf[ch].avg = Adc.buf[ch].b[0]>>2;
2321  0479 97            	ld	xl,a
2322  047a a609          	ld	a,#9
2323  047c 42            	mul	x,a
2324  047d 89            	pushw	x
2325  047e 7b03          	ld	a,(OFST+3,sp)
2326  0480 97            	ld	xl,a
2327  0481 a609          	ld	a,#9
2328  0483 42            	mul	x,a
2329  0484 ee2a          	ldw	x,(_Adc+1,x)
2330  0486 54            	srlw	x
2331  0487 54            	srlw	x
2332  0488 9085          	popw	y
2333  048a 01            	rrwa	x,a
2334  048b 90e732        	ld	(_Adc+9,y),a
2335                     ; 609 }
2338  048e 84            	pop	a
2339  048f 81            	ret	
2382                     ; 611 void AdcService(uint8_t ch)
2382                     ; 612 {
2383                     	switch	.text
2384  0490               _AdcService:
2386  0490 88            	push	a
2387       00000000      OFST:	set	0
2390                     ; 613 	if( Ticks_50uS >= 10 )
2392  0491 b683          	ld	a,_Ticks_50uS
2393  0493 a10a          	cp	a,#10
2394  0495 2515          	jrult	L707
2395                     ; 616 		Adc_Config();
2397  0497 ad98          	call	_Adc_Config
2399                     ; 617 		Drive.Origin = !MotorOrigin();
2401  0499 3b0007        	push	_IO_ORG+2
2402  049c be05          	ldw	x,_IO_ORG
2403  049e cd0000        	call	_GPIO_ReadInputPin
2405  04a1 5b01          	addw	sp,#1
2406  04a3 4d            	tnz	a
2407  04a4 2603          	jrne	L653
2408  04a6 4c            	inc	a
2409  04a7 2001          	jra	L263
2410  04a9               L653:
2411  04a9 4f            	clr	a
2412  04aa               L263:
2413  04aa b76a          	ld	_Drive+3,a
2415  04ac               L707:
2416                     ; 620 	if( Diff(Timer.Adc, 10) != 1 )
2418  04ac ae000a        	ldw	x,#10
2419  04af 89            	pushw	x
2420  04b0 be25          	ldw	x,_Timer+4
2421  04b2 cd00de        	call	_Diff
2423  04b5 4a            	dec	a
2424  04b6 85            	popw	x
2425  04b7 2702          	jreq	L117
2426                     ; 621 		return;
2429  04b9 84            	pop	a
2430  04ba 81            	ret	
2431  04bb               L117:
2432                     ; 622 	Timer.Adc = Ticks_1mS;
2434  04bb be81          	ldw	x,_Ticks_1mS
2435  04bd bf25          	ldw	_Timer+4,x
2436                     ; 624 	AdcGetAvg(ch);	//	Adc.buf[ch].avg
2438  04bf 7b01          	ld	a,(OFST+1,sp)
2439  04c1 adb5          	call	_AdcGetAvg
2441                     ; 625 	if( Drive.DeviceType == TYPE_MD24 )
2443                     ; 628 		if( ch == 0 ) { }
2446                     ; 629 		else if( ch == 1 ) { }
2449                     ; 630 		else if( ch == 2 ) { }
2451                     ; 634 		if( ch == 0 ) { }
2454                     ; 635 		else if( ch == 1 ) { }
2457                     ; 636 		else if( ch == 2 ) { }
2460                     ; 637 		else if( ch == 3 ) { }
2463                     ; 638 		else if( ch == 4 ) { }
2465                     ; 640 }
2468  04c3 84            	pop	a
2469  04c4 81            	ret	
2497                     ; 642 void OnTimer4(void)
2497                     ; 643 {
2498                     	switch	.text
2499  04c5               _OnTimer4:
2503                     ; 644 	Ticks_50uS++;
2505  04c5 3c83          	inc	_Ticks_50uS
2506                     ; 645 	if( Ticks_50uS >= 20 )
2508  04c7 b683          	ld	a,_Ticks_50uS
2509  04c9 a114          	cp	a,#20
2510  04cb 2507          	jrult	L367
2511                     ; 647 		Ticks_50uS = 0;
2513  04cd 3f83          	clr	_Ticks_50uS
2514                     ; 648 		Ticks_1mS++;
2516  04cf be81          	ldw	x,_Ticks_1mS
2517  04d1 5c            	incw	x
2518  04d2 bf81          	ldw	_Ticks_1mS,x
2519  04d4               L367:
2520                     ; 650 	if( Drive.Ticks )
2522  04d4 b67b          	ld	a,_Drive+20
2523  04d6 2706          	jreq	L567
2524                     ; 651 		Drive.Ticks--;
2526  04d8 3a7b          	dec	_Drive+20
2528  04da a601          	ld	a,#1
2529  04dc 200b          	jra	L767
2530  04de               L567:
2531                     ; 654 		Drive.MotorRun = 1;
2533  04de 4c            	inc	a
2534  04df b77c          	ld	_Drive+21,a
2535                     ; 655 		if( Drive.Enabled )
2537  04e1 7201006703    	btjf	_Drive,#0,L767
2538                     ; 656 			Drive.Ticks = Drive.Interval;
2540  04e6 457a7b        	mov	_Drive+20,_Drive+19
2541  04e9               L767:
2542                     ; 658 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
2544  04e9 cd0000        	call	_TIM4_ClearITPendingBit
2546                     ; 659 	TIM4_ClearFlag(TIM4_IT_UPDATE);
2548  04ec a601          	ld	a,#1
2550                     ; 660 }
2553  04ee cc0000        	jp	_TIM4_ClearFlag
2577                     ; 662 void OnCaptureOVTim2(void)
2577                     ; 663 {
2578                     	switch	.text
2579  04f1               _OnCaptureOVTim2:
2583                     ; 667 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
2585  04f1 a601          	ld	a,#1
2587                     ; 668 }	
2590  04f3 cc0000        	jp	_TIM2_ClearITPendingBit
2630                     ; 670 void OnCaptureTim2(void)
2630                     ; 671 {
2631                     	switch	.text
2632  04f6               _OnCaptureTim2:
2634  04f6 89            	pushw	x
2635       00000002      OFST:	set	2
2638                     ; 688 	if( TIM2_GetITStatus(TIM2_IT_CC1) == SET )
2640  04f7 a602          	ld	a,#2
2641  04f9 cd0000        	call	_TIM2_GetITStatus
2643  04fc 4a            	dec	a
2644  04fd 2646          	jrne	L1201
2645                     ; 690 		t = TIM2_GetCapture1();	
2647  04ff cd0000        	call	_TIM2_GetCapture1
2649  0502 1f01          	ldw	(OFST-1,sp),x
2651                     ; 691 		TIM2_InterruptClear(TIM2_IT_CC1)
2653  0504 a602          	ld	a,#2
2654  0506 cd0000        	call	_TIM2_ClearITPendingBit
2658  0509 5f            	clrw	x
2659  050a cd0000        	call	_TIM2_SetCounter
2661                     ; 696 		TIMER_EDGE_SET(Pwm.Edge)	//	TIM2_Init()
2663  050d 4b00          	push	#0
2664  050f 4b00          	push	#0
2665  0511 4b01          	push	#1
2666  0513 7200005d04    	btjt	_Pwm+6,#0,L614
2667  0518 a644          	ld	a,#68
2668  051a 2001          	jra	L024
2669  051c               L614:
2670  051c 4f            	clr	a
2671  051d               L024:
2672  051d 5f            	clrw	x
2673  051e 97            	ld	xl,a
2674  051f cd0000        	call	_TIM2_ICInit
2676  0522 5b03          	addw	sp,#3
2677                     ; 697 		if ( Pwm.Edge == 0 ) 
2679  0524 7200005d0a    	btjt	_Pwm+6,#0,L3201
2680                     ; 699 			Pwm.Edge = 1;
2682  0529 7210005d      	bset	_Pwm+6,#0
2683                     ; 700 			Pwm.T1 = t;
2685  052d 1e01          	ldw	x,(OFST-1,sp)
2686  052f bf5f          	ldw	_Pwm+8,x
2688  0531 2012          	jra	L1201
2689  0533               L3201:
2690                     ; 704 			Pwm.Edge = 0; 
2692  0533 7211005d      	bres	_Pwm+6,#0
2693                     ; 705 			Pwm.Calc = 1;
2695  0537 3501005e      	mov	_Pwm+7,#1
2696                     ; 706 			Pwm.T2 = t;	
2698  053b 1e01          	ldw	x,(OFST-1,sp)
2699  053d bf61          	ldw	_Pwm+10,x
2700                     ; 707 			Pwm.Count = Pwm.T2 - Pwm.T1;
2702  053f 72b0005f      	subw	x,_Pwm+8
2703  0543 bf65          	ldw	_Pwm+14,x
2704  0545               L1201:
2705                     ; 711 }
2708  0545 85            	popw	x
2709  0546 81            	ret	
2739                     ; 713 void Timer_Config(void)
2739                     ; 714 {
2740                     	switch	.text
2741  0547               _Timer_Config:
2745                     ; 716 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);  //  16 * 0x32 = 50uS  Ticks, 0x64-100us 
2747  0547 ae0432        	ldw	x,#1074
2748  054a cd0000        	call	_TIM4_TimeBaseInit
2750                     ; 717   	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2752  054d ae0101        	ldw	x,#257
2753  0550 cd0000        	call	_TIM4_ITConfig
2755                     ; 718   	TIM4_Cmd(ENABLE);
2757  0553 a601          	ld	a,#1
2758  0555 cd0000        	call	_TIM4_Cmd
2760                     ; 720 	TIM2_TimeBaseInit(TIM2_PRESCALER_4, 0xffff);	//	4 -> 0.25us
2762  0558 aeffff        	ldw	x,#65535
2763  055b 89            	pushw	x
2764  055c a602          	ld	a,#2
2765  055e cd0000        	call	_TIM2_TimeBaseInit
2767  0561 85            	popw	x
2768                     ; 726 	TIMER_EDGE_SET(0)	//	TIM2_Init()
2770  0562 4b00          	push	#0
2771  0564 4b00          	push	#0
2772  0566 4b01          	push	#1
2773  0568 ae0044        	ldw	x,#68
2774  056b cd0000        	call	_TIM2_ICInit
2776  056e 5b03          	addw	sp,#3
2777                     ; 727 	TIM2_ITConfig(TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
2779  0570 ae0301        	ldw	x,#769
2780  0573 cd0000        	call	_TIM2_ITConfig
2782                     ; 729 	TIM2_Cmd(ENABLE);
2784  0576 a601          	ld	a,#1
2786                     ; 730 }
2789  0578 cc0000        	jp	_TIM2_Cmd
2812                     ; 732 void mainDeviceType(void)
2812                     ; 733 {
2813                     	switch	.text
2814  057b               _mainDeviceType:
2818  057b               L7401:
2819  057b 20fe          	jra	L7401
2846                     ; 737 void	motorGo(void)
2846                     ; 738 {
2847                     	switch	.text
2848  057d               _motorGo:
2852                     ; 739 	if ( Drive.MotorRun == 1 && Drive.Enabled )
2854  057d b67c          	ld	a,_Drive+21
2855  057f 4a            	dec	a
2856  0580 260d          	jrne	L3601
2858  0582 7201006708    	btjf	_Drive,#0,L3601
2859                     ; 741 		Drive.MotorRun = 0;
2861  0587 b77c          	ld	_Drive+21,a
2862                     ; 742 		DriveService();	
2864  0589 cd027a        	call	_DriveService
2866                     ; 743 		Drive.Ticks = Drive.Interval;
2868  058c 457a7b        	mov	_Drive+20,_Drive+19
2869  058f               L3601:
2870                     ; 747 	if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
2872  058f 720000690f    	btjt	_Drive+2,#0,L5601
2874  0594 b668          	ld	a,_Drive+1
2875  0596 a101          	cp	a,#1
2876  0598 2609          	jrne	L5601
2877                     ; 749 		Pwm.T1_1mS = Ticks_1mS;
2879  059a be81          	ldw	x,_Ticks_1mS
2880  059c bf57          	ldw	_Pwm,x
2881                     ; 750 		Drive.Run0 = Drive.Run;
2883  059e 44            	srl	a
2884  059f 90110069      	bccm	_Drive+2,#0
2885  05a3               L5601:
2886                     ; 752 	if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
2888  05a3 7201006913    	btjf	_Drive+2,#0,L7601
2890  05a8 b668          	ld	a,_Drive+1
2891  05aa 260f          	jrne	L7601
2892                     ; 754 		Pwm.T2_1mS = Ticks_1mS;
2894  05ac be81          	ldw	x,_Ticks_1mS
2895  05ae bf59          	ldw	_Pwm+2,x
2896                     ; 755 		Drive.Run0 = Drive.Run;			
2898  05b0 44            	srl	a
2899  05b1 90110069      	bccm	_Drive+2,#0
2900                     ; 756 		Pwm.diff = Pwm.T2_1mS - Pwm.T1_1mS;
2902  05b5 72b00057      	subw	x,_Pwm
2903  05b9 bf5b          	ldw	_Pwm+4,x
2904  05bb               L7601:
2905                     ; 759 }
2908  05bb 81            	ret	
3009                     ; 761 void main(void)
3009                     ; 762 {
3010                     	switch	.text
3011  05bc               _main:
3013  05bc 5211          	subw	sp,#17
3014       00000011      OFST:	set	17
3017                     ; 765 	uint8_t		channel = 0;
3019  05be 0f05          	clr	(OFST-12,sp)
3021                     ; 769 	Drive.Enabled = TRUE;
3023                     ; 770 	Drive.MaxOverrun = OVERRUN;
3025  05c0 ae012c        	ldw	x,#300
3026  05c3 72100067      	bset	_Drive,#0
3027  05c7 bf76          	ldw	_Drive+15,x
3028                     ; 771 	Drive.Position = Drive.Stage = 0;
3030  05c9 3f7f          	clr	_Drive+24
3031  05cb 5f            	clrw	x
3032  05cc bf6c          	ldw	_Drive+5,x
3033                     ; 772 	Drive.Dir = nMotorClose;
3035  05ce 72150069      	bres	_Drive+2,#2
3036                     ; 773 	Drive.Interval = 15;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
3038  05d2 350f007a      	mov	_Drive+19,#15
3039                     ; 775 	Ticks_1mS = Ticks_50uS = Pwm.Edge = 0;
3041  05d6 7211005d      	bres	_Pwm+6,#0
3042  05da 3f83          	clr	_Ticks_50uS
3043  05dc bf81          	ldw	_Ticks_1mS,x
3044                     ; 777 	Clock_Config();
3046  05de cd0374        	call	_Clock_Config
3048                     ; 778 	Gpio_Config();
3050  05e1 cd0385        	call	_Gpio_Config
3052                     ; 779 	Timer_Config();
3054  05e4 cd0547        	call	_Timer_Config
3056                     ; 781 	Adc.ch = 2;
3058  05e7 35020029      	mov	_Adc,#2
3059                     ; 782 	Adc_Config();
3061  05eb cd0431        	call	_Adc_Config
3063                     ; 784 	dutyInfo.s = dutyInfo.i = 0;
3065  05ee 3fac          	clr	_dutyInfo+40
3066  05f0 5f            	clrw	x
3067  05f1 bfae          	ldw	_dutyInfo+42,x
3068                     ; 785 	Pwm.Calc = Pwm.Edge = 0;
3070  05f3 7211005d      	bres	_Pwm+6,#0
3071  05f7 3f5e          	clr	_Pwm+7
3072                     ; 787 	enableInterrupts();
3075  05f9 9a            	rim	
3077                     ; 788 	waitPowerDelay();
3080  05fa cd016e        	call	_waitPowerDelay
3082                     ; 789 	if ( Drive.Origin ) 
3084  05fd b66a          	ld	a,_Drive+3
3085  05ff 2719          	jreq	L3311
3086                     ; 791 		Drive.Position = 0;
3088  0601 5f            	clrw	x
3089  0602 bf6c          	ldw	_Drive+5,x
3090                     ; 792 		StartDriveOR( CPulse(MAX_MOTOR_POS), OFFSET_OVERRUN);
3092  0604 4b00          	push	#0
3093  0606 a6c8          	ld	a,#200
3094  0608 cd00d5        	call	_CPulse
3096  060b cd0188        	call	_StartDriveOR
3098  060e 84            	pop	a
3100  060f 2003          	jra	L7311
3101  0611               L5311:
3102                     ; 795 			motorGo();
3104  0611 cd057d        	call	_motorGo
3106  0614               L7311:
3107                     ; 794 		while ( Drive.Run )
3109  0614 b668          	ld	a,_Drive+1
3110  0616 26f9          	jrne	L5311
3112  0618 2007          	jra	L3411
3113  061a               L3311:
3114                     ; 798 		Drive.Position = CPulse(MAX_MOTOR_POS + 5);
3116  061a a6cd          	ld	a,#205
3117  061c cd00d5        	call	_CPulse
3119  061f bf6c          	ldw	_Drive+5,x
3120  0621               L3411:
3121                     ; 800 	Timer.Led = Timer.Motor = Timer.Adc = Ticks_1mS;
3123  0621 be81          	ldw	x,_Ticks_1mS
3124  0623 bf25          	ldw	_Timer+4,x
3125  0625 bf23          	ldw	_Timer+2,x
3126  0627 bf21          	ldw	_Timer,x
3127                     ; 801 	Drive.Run0 = Drive.Run;
3129  0629 b668          	ld	a,_Drive+1
3130  062b 44            	srl	a
3131  062c 90110069      	bccm	_Drive+2,#0
3132                     ; 803 	if( Drive.DeviceType == TYPE_MD12 )
3134  0630 b680          	ld	a,_Drive+25
3135  0632 a102          	cp	a,#2
3136  0634 2603          	jrne	L7411
3137                     ; 804 		mainDeviceType();
3139  0636 cd057b        	call	_mainDeviceType
3141  0639               L7411:
3142                     ; 808 		tt = Ticks_1mS;
3144  0639 be81          	ldw	x,_Ticks_1mS
3145  063b 1f10          	ldw	(OFST-1,sp),x
3147                     ; 809 		LightControl(tt);
3149  063d cd0215        	call	_LightControl
3151                     ; 811 		AdcService(channel);
3153  0640 7b05          	ld	a,(OFST-12,sp)
3154  0642 cd0490        	call	_AdcService
3156                     ; 813 		if ( Drive.Stage == 0 )
3158  0645 b67f          	ld	a,_Drive+24
3159  0647 2607          	jrne	L3511
3160                     ; 815 			Drive.Stage = ZeroPos();
3162  0649 cd01ff        	call	_ZeroPos
3164  064c b77f          	ld	_Drive+24,a
3166  064e 2031          	jra	L5511
3167  0650               L3511:
3168                     ; 819 			if ( Diff(Timer.Motor, 100) == 1 )
3170  0650 ae0064        	ldw	x,#100
3171  0653 89            	pushw	x
3172  0654 be23          	ldw	x,_Timer+2
3173  0656 cd00de        	call	_Diff
3175  0659 4a            	dec	a
3176  065a 85            	popw	x
3177  065b 2624          	jrne	L5511
3178                     ; 821 				if ( Diff(Timer.PwmUpdate, MAX_TIMEOUT) != 0 )
3180  065d ae07d0        	ldw	x,#2000
3181  0660 89            	pushw	x
3182  0661 be27          	ldw	x,_Timer+6
3183  0663 cd00de        	call	_Diff
3185  0666 4d            	tnz	a
3186  0667 85            	popw	x
3187  0668 2717          	jreq	L5511
3188                     ; 823 					Timer.PwmUpdate = (Ticks_1mS > MAX_TIMEOUT) ? 
3188                     ; 824 						Ticks_1mS - MAX_TIMEOUT : 
3188                     ; 825 						0xffff - MAX_TIMEOUT + Ticks_1mS;
3190  066a be81          	ldw	x,_Ticks_1mS
3191  066c a307d1        	cpw	x,#2001
3192  066f 2507          	jrult	L015
3193  0671 be81          	ldw	x,_Ticks_1mS
3194  0673 1d07d0        	subw	x,#2000
3195  0676 2005          	jra	L215
3196  0678               L015:
3197  0678 be81          	ldw	x,_Ticks_1mS
3198  067a 1cf82f        	addw	x,#63535
3199  067d               L215:
3200  067d bf27          	ldw	_Timer+6,x
3201                     ; 826 					Drive.Step = 0;
3203  067f 3f7d          	clr	_Drive+22
3205  0681               L5511:
3206                     ; 835 		if( Pwm.Calc == 1 )
3208  0681 b65e          	ld	a,_Pwm+7
3209  0683 a101          	cp	a,#1
3210  0685 2643          	jrne	L5611
3211                     ; 837 			Pwm.Calc = 0;
3213  0687 3f5e          	clr	_Pwm+7
3214                     ; 838 			_t1 = Pwm.T1;
3216  0689 be5f          	ldw	x,_Pwm+8
3217  068b 1f0e          	ldw	(OFST-3,sp),x
3219                     ; 839 			_t2 = Pwm.T2;
3221  068d be61          	ldw	x,_Pwm+10
3222  068f 1f0a          	ldw	(OFST-7,sp),x
3224                     ; 840 			dt = 10000. * _t1 / (_t1 + _t2);
3226  0691 1e0e          	ldw	x,(OFST-3,sp)
3227  0693 72fb0a        	addw	x,(OFST-7,sp)
3228  0696 cd0000        	call	c_uitof
3230  0699 96            	ldw	x,sp
3231  069a 5c            	incw	x
3232  069b cd0000        	call	c_rtol
3235  069e 1e0e          	ldw	x,(OFST-3,sp)
3236  06a0 cd0000        	call	c_uitof
3238  06a3 ae0000        	ldw	x,#L3711
3239  06a6 cd0000        	call	c_fmul
3241  06a9 96            	ldw	x,sp
3242  06aa 5c            	incw	x
3243  06ab cd0000        	call	c_fdiv
3245  06ae 96            	ldw	x,sp
3246  06af 1c0006        	addw	x,#OFST-11
3247  06b2 cd0000        	call	c_rtol
3250                     ; 841 			Pwm.Duty = (uint16_t)dt;
3252  06b5 96            	ldw	x,sp
3253  06b6 1c0006        	addw	x,#OFST-11
3254  06b9 cd0000        	call	c_ltor
3256  06bc cd0000        	call	c_ftoi
3258  06bf bf63          	ldw	_Pwm+12,x
3259                     ; 844 			Drive.Step = stepCalc(Pwm.Duty);
3261  06c1 cd012b        	call	_stepCalc
3263  06c4 b77d          	ld	_Drive+22,a
3264                     ; 846 			Timer.PwmUpdate = Ticks_1mS;		
3266  06c6 be81          	ldw	x,_Ticks_1mS
3267  06c8 bf27          	ldw	_Timer+6,x
3268  06ca               L5611:
3269                     ; 848 		if( _tt != tt )
3271  06ca 1e0c          	ldw	x,(OFST-5,sp)
3272  06cc 1310          	cpw	x,(OFST-1,sp)
3273  06ce 2704          	jreq	L7711
3274                     ; 850 			_tt = tt;
3276  06d0 1e10          	ldw	x,(OFST-1,sp)
3277  06d2 1f0c          	ldw	(OFST-5,sp),x
3279  06d4               L7711:
3280                     ; 852 		motorGo();
3282  06d4 cd057d        	call	_motorGo
3285  06d7 cc0639        	jra	L7411
3329                     ; 857 void assert_failed(u8* file, u32 line) { u8 i; while (1) i++; }
3330                     	switch	.text
3331  06da               _assert_failed:
3333  06da 88            	push	a
3334       00000001      OFST:	set	1
3337  06db               L3221:
3340  06db 0c01          	inc	(OFST+0,sp)
3343  06dd 20fc          	jra	L3221
4182                     	xdef	_main
4183                     	xdef	_motorGo
4184                     	xdef	_mainDeviceType
4185                     	xdef	_Timer_Config
4186                     	xdef	_OnCaptureTim2
4187                     	xdef	_OnCaptureOVTim2
4188                     	xdef	_OnTimer4
4189                     	xdef	_AdcService
4190                     	xdef	_AdcGetAvg
4191                     	xdef	_Adc_Config
4192                     	xdef	_AdcGetCode
4193                     	xdef	__chanId
4194                     	xdef	__chanSchmit
4195                     	xdef	__chan
4196                     	xdef	_OnTimer_1S
4197                     	xdef	_Gpio_Config
4198                     	xdef	_Gpio_CheckMode
4199                     	xdef	_Clock_Config
4200                     	xdef	_factory
4201                     	xdef	_MotorStepSetOverrun
4202                     	xdef	_MotorStepPhase
4203                     	xdef	_DriveService
4204                     	xdef	_MotorClose
4205                     	xdef	_MotorStep
4206                     	xdef	_StopDrive
4207                     	xdef	_MotorService
4208                     	xdef	_LightControl
4209                     	xdef	_ZeroPos
4210                     	xdef	_StartDriveOR
4211                     	xdef	_waitPowerDelay
4212                     	xdef	_stepCalc
4213                     	xdef	_stepPrepare
4214                     	xdef	_Diff
4215                     	xdef	_CPulse
4216                     	xdef	_phase_excite
4217                     	xdef	_IO_CHARGE
4218                     	xdef	_IO_BOOST
4219                     	xdef	_IO_BAT
4220                     	xdef	_IO_MOD
4221                     	xdef	_IO_POWER
4222                     	xdef	_IO_SEN
4223                     	xdef	_IO_ADJ
4224                     	xdef	_IO_Y2
4225                     	xdef	_IO_Y1
4226                     	xdef	_IO_X2
4227                     	xdef	_IO_X1
4228                     	xdef	_IO_ORG
4229                     	xdef	_IO_LED
4230                     	switch	.ubsct
4231  0000               _motorWatch:
4232  0000 000000000000  	ds.b	33
4233                     	xdef	_motorWatch
4234  0021               _Timer:
4235  0021 000000000000  	ds.b	8
4236                     	xdef	_Timer
4237  0029               _Adc:
4238  0029 000000000000  	ds.b	46
4239                     	xdef	_Adc
4240  0057               _Pwm:
4241  0057 000000000000  	ds.b	16
4242                     	xdef	_Pwm
4243  0067               _Drive:
4244  0067 000000000000  	ds.b	26
4245                     	xdef	_Drive
4246                     	xdef	_ledint
4247  0081               _Ticks_1mS:
4248  0081 0000          	ds.b	2
4249                     	xdef	_Ticks_1mS
4250  0083               _Ticks_50uS:
4251  0083 00            	ds.b	1
4252                     	xdef	_Ticks_50uS
4253  0084               _dutyInfo:
4254  0084 000000000000  	ds.b	44
4255                     	xdef	_dutyInfo
4256                     	xdef	_assert_failed
4257                     	xref	_TIM4_ClearITPendingBit
4258                     	xref	_TIM4_ClearFlag
4259                     	xref	_TIM4_ITConfig
4260                     	xref	_TIM4_Cmd
4261                     	xref	_TIM4_TimeBaseInit
4262                     	xref	_TIM2_ClearITPendingBit
4263                     	xref	_TIM2_GetITStatus
4264                     	xref	_TIM2_GetCapture1
4265                     	xref	_TIM2_SetCounter
4266                     	xref	_TIM2_ITConfig
4267                     	xref	_TIM2_Cmd
4268                     	xref	_TIM2_ICInit
4269                     	xref	_TIM2_TimeBaseInit
4270                     	xref	_GPIO_ReadInputPin
4271                     	xref	_GPIO_WriteReverse
4272                     	xref	_GPIO_WriteLow
4273                     	xref	_GPIO_WriteHigh
4274                     	xref	_GPIO_Init
4275                     	xref	_CLK_SYSCLKConfig
4276                     	xref	_CLK_HSICmd
4277                     	xref	_ADC1_GetConversionValue
4278                     	xref	_ADC1_StartConversion
4279                     	xref	_ADC1_Init
4280                     	xref	_ADC1_DeInit
4281                     .const:	section	.text
4282  0000               L3711:
4283  0000 461c4000      	dc.w	17948,16384
4284                     	xref.b	c_x
4304                     	xref	c_ftoi
4305                     	xref	c_ltor
4306                     	xref	c_fdiv
4307                     	xref	c_rtol
4308                     	xref	c_fmul
4309                     	xref	c_uitof
4310                     	xref	c_smodx
4311                     	xref	c_imul
4312                     	end
