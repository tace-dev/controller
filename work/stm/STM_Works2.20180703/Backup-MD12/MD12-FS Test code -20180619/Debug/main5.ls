   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  20                     	bsct
  21  0000               _ledint:
  22  0000 01f4          	dc.w	500
  23  0002               _IO_LED:
  24  0002 5000          	dc.w	20480
  25  0004 04            	dc.b	4
  26  0005               _IO_ORG:
  27  0005 5005          	dc.w	20485
  28  0007 10            	dc.b	16
  29  0008               _IO_X1:
  30  0008 500a          	dc.w	20490
  31  000a 40            	dc.b	64
  32  000b               _IO_X2:
  33  000b 500a          	dc.w	20490
  34  000d 80            	dc.b	128
  35  000e               _IO_Y1:
  36  000e 500a          	dc.w	20490
  37  0010 08            	dc.b	8
  38  0011               _IO_Y2:
  39  0011 5000          	dc.w	20480
  40  0013 08            	dc.b	8
  41  0014               _IO_ADJ:
  42  0014 500a          	dc.w	20490
  43  0016 10            	dc.b	16
  44  0017               _IO_SEN:
  45  0017 500f          	dc.w	20495
  46  0019 08            	dc.b	8
  47  001a               _IO_POWER:
  48  001a 500f          	dc.w	20495
  49  001c 04            	dc.b	4
  50  001d               _IO_MOD:
  51  001d 500f          	dc.w	20495
  52  001f 10            	dc.b	16
  53  0020               _IO_BAT:
  54  0020 500f          	dc.w	20495
  55  0022 08            	dc.b	8
  56  0023               _IO_BOOST:
  57  0023 500f          	dc.w	20495
  58  0025 08            	dc.b	8
  59  0026               _IO_CHARGE:
  60  0026 500f          	dc.w	20495
  61  0028 20            	dc.b	32
 108                     ; 181 void	phase_excite(uint8_t phase)
 108                     ; 182 {
 110                     	switch	.text
 111  0000               _phase_excite:
 113  0000 88            	push	a
 114       00000000      OFST:	set	0
 117                     ; 183 	if ( !Drive.Run || !Drive.Enabled ) return;
 119  0001 b668          	ld	a,_Drive+1
 120  0003 2705          	jreq	L15
 122  0005 7200006702    	btjt	_Drive,#0,L74
 123  000a               L15:
 127  000a 84            	pop	a
 128  000b 81            	ret	
 129  000c               L74:
 130                     ; 184 	switch(phase)
 132  000c 7b01          	ld	a,(OFST+1,sp)
 134                     ; 206 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
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
 152                     ; 199 		case 0: _H_X1 _L_X2 _H_Y1 _L_Y2 break;
 154  002b 3b000a        	push	_IO_X1+2
 155  002e be08          	ldw	x,_IO_X1
 156  0030 cd0000        	call	_GPIO_WriteHigh
 166  0033 2008          	jp	LC005
 167  0035               L5:
 168                     ; 200 		case 1: _L_X1 _L_X2 _H_Y1 _L_Y2 break;		
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
 191                     ; 201 		case 2: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
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
 216                     ; 202 		case 3: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
 218  005e ad6b          	call	LC008
 221  0060 3b000d        	push	_IO_X2+2
 222  0063 be0b          	ldw	x,_IO_X2
 223  0065 cd0000        	call	_GPIO_WriteHigh
 231  0068 204c          	jp	LC003
 232  006a               L31:
 233                     ; 203 		case 4: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
 235  006a ad5f          	call	LC008
 238  006c 3b000d        	push	_IO_X2+2
 239  006f be0b          	ldw	x,_IO_X2
 240  0071 cd0000        	call	_GPIO_WriteHigh
 248  0074 2011          	jp	LC006
 249  0076               L51:
 250                     ; 204 		case 5: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
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
 288                     ; 205 		case 6: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
 290  009b 3b000a        	push	_IO_X1+2
 291  009e be08          	ldw	x,_IO_X1
 292  00a0 cd0000        	call	_GPIO_WriteHigh
 302  00a3 20d9          	jp	LC007
 303  00a5               L12:
 304                     ; 206 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
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
 343                     ; 209 }
 346  00c9 84            	pop	a
 347  00ca 81            	ret	
 348  00cb               LC008:
 349  00cb 3b000a        	push	_IO_X1+2
 350  00ce be08          	ldw	x,_IO_X1
 351  00d0 cd0000        	call	_GPIO_WriteLow
 353  00d3 84            	pop	a
 354  00d4 81            	ret	
 388                     ; 211 uint16_t CPulse( u8 step )
 388                     ; 212 {
 389                     	switch	.text
 390  00d5               _CPulse:
 394                     ; 213 	return (uint16_t)step * 26;  // 20180509  change to 5200 pulse
 396  00d5 5f            	clrw	x
 397  00d6 97            	ld	xl,a
 398  00d7 90ae001a      	ldw	y,#26
 402  00db cc0000        	jp	c_imul
 455                     ; 216 u8  Diff(uint16_t time, uint16_t diff)				
 455                     ; 217 {
 456                     	switch	.text
 457  00de               _Diff:
 459  00de 89            	pushw	x
 460  00df 89            	pushw	x
 461       00000002      OFST:	set	2
 464                     ; 218 	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
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
 478                     ; 219 	return _t > diff ? 1 : 0;
 480  00f7 1307          	cpw	x,(OFST+5,sp)
 481  00f9 2304          	jrule	L611
 482  00fb a601          	ld	a,#1
 483  00fd 2001          	jra	L021
 484  00ff               L611:
 485  00ff 4f            	clr	a
 486  0100               L021:
 489  0100 5b04          	addw	sp,#4
 490  0102 81            	ret	
 526                     ; 222 uint16_t	stepPrepare(uint8_t i)
 526                     ; 223 {
 527                     	switch	.text
 528  0103               _stepPrepare:
 530  0103 88            	push	a
 531       00000000      OFST:	set	0
 534                     ; 224 	dutyInfo.s -= dutyInfo.b[i];
 536  0104 5f            	clrw	x
 537  0105 97            	ld	xl,a
 538  0106 e684          	ld	a,(_dutyInfo,x)
 539  0108 5f            	clrw	x
 540  0109 97            	ld	xl,a
 541  010a 72b000ae      	subw	x,_dutyInfo+42
 542  010e 50            	negw	x
 543  010f bfae          	ldw	_dutyInfo+42,x
 544                     ; 225 	dutyInfo.b[i] = Pwm.Duty;
 546  0111 5f            	clrw	x
 547  0112 7b01          	ld	a,(OFST+1,sp)
 548  0114 97            	ld	xl,a
 549  0115 b664          	ld	a,_Pwm+13
 550  0117 e784          	ld	(_dutyInfo,x),a
 551                     ; 226 	dutyInfo.s += dutyInfo.b[i];
 553  0119 5f            	clrw	x
 554  011a 7b01          	ld	a,(OFST+1,sp)
 555  011c 97            	ld	xl,a
 556  011d e684          	ld	a,(_dutyInfo,x)
 557  011f bbaf          	add	a,_dutyInfo+43
 558  0121 b7af          	ld	_dutyInfo+43,a
 559  0123 2402          	jrnc	L421
 560  0125 3cae          	inc	_dutyInfo+42
 561  0127               L421:
 562                     ; 227 	return dutyInfo.s;
 564  0127 beae          	ldw	x,_dutyInfo+42
 567  0129 84            	pop	a
 568  012a 81            	ret	
 613                     ; 230 uint8_t	stepCalc(uint16_t duty)
 613                     ; 231 {
 614                     	switch	.text
 615  012b               _stepCalc:
 617  012b 89            	pushw	x
 618  012c 89            	pushw	x
 619       00000002      OFST:	set	2
 622                     ; 233 	if ( dutyInfo.n < 16 )
 624  012d b6ad          	ld	a,_dutyInfo+41
 625  012f a110          	cp	a,#16
 626  0131 2404          	jruge	L361
 627                     ; 234 		dutyInfo.n ++;
 629  0133 3cad          	inc	_dutyInfo+41
 630  0135 b6ad          	ld	a,_dutyInfo+41
 631  0137               L361:
 632                     ; 235 	t = (duty / dutyInfo.n) * 2 + 1;	
 634  0137 62            	div	x,a
 635  0138 58            	sllw	x
 636  0139 5c            	incw	x
 637  013a 1f01          	ldw	(OFST-1,sp),x
 639                     ; 236 	t /= 2;
 641  013c 0401          	srl	(OFST-1,sp)
 642  013e 0602          	rrc	(OFST+0,sp)
 644                     ; 237 	if( t < 20 )	t = 20;
 646  0140 1e01          	ldw	x,(OFST-1,sp)
 647  0142 a30014        	cpw	x,#20
 648  0145 2403          	jruge	L561
 651  0147 ae0014        	ldw	x,#20
 653  014a               L561:
 654                     ; 238 	if( t > 180 )	t = 180;
 656  014a a300b5        	cpw	x,#181
 657  014d 2503          	jrult	L761
 660  014f ae00b4        	ldw	x,#180
 662  0152               L761:
 663                     ; 240 	t = (625 * t)/10 -1250;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
 665  0152 90ae0271      	ldw	y,#625
 666  0156 cd0000        	call	c_imul
 668  0159 a60a          	ld	a,#10
 669  015b 62            	div	x,a
 670  015c 1d04e2        	subw	x,#1250
 672                     ; 241 	t = (t / 25 + 1 ) /	2;
 674  015f a619          	ld	a,#25
 675  0161 62            	div	x,a
 676  0162 5c            	incw	x
 677  0163 54            	srlw	x
 678  0164 1f01          	ldw	(OFST-1,sp),x
 680                     ; 243 	Drive.PreStep = Drive.Step;
 682  0166 457d7e        	mov	_Drive+23,_Drive+22
 683                     ; 244 	return (uint8_t)t;
 685  0169 7b02          	ld	a,(OFST+0,sp)
 688  016b 5b04          	addw	sp,#4
 689  016d 81            	ret	
 716                     ; 247 void	waitPowerDelay(void)
 716                     ; 248 {
 717                     	switch	.text
 718  016e               _waitPowerDelay:
 722                     ; 249 	LightOn
 724  016e 3b0004        	push	_IO_LED+2
 725  0171 be02          	ldw	x,_IO_LED
 726  0173 cd0000        	call	_GPIO_WriteLow
 728  0176 84            	pop	a
 730  0177               L302:
 731                     ; 250 	while( Ticks_1mS < TIME_POWERDELAY );
 733  0177 be81          	ldw	x,_Ticks_1mS
 734  0179 a301f3        	cpw	x,#499
 735  017c 25f9          	jrult	L302
 736                     ; 251 	LightOff
 738  017e 3b0004        	push	_IO_LED+2
 739  0181 be02          	ldw	x,_IO_LED
 740  0183 cd0000        	call	_GPIO_WriteHigh
 742  0186 84            	pop	a
 743                     ; 253 }
 746  0187 81            	ret	
 792                     ; 255 void StartDriveOR( uint16_t tPos, uint8_t overrun )
 792                     ; 256 {
 793                     	switch	.text
 794  0188               _StartDriveOR:
 796  0188 89            	pushw	x
 797       00000000      OFST:	set	0
 800                     ; 258 	motorWatch.step[motorWatch.i] = tPos;
 802  0189 b620          	ld	a,_motorWatch+32
 803  018b 905f          	clrw	y
 804  018d 9097          	ld	yl,a
 805  018f 9058          	sllw	y
 806  0191 90ef00        	ldw	(_motorWatch,y),x
 807                     ; 259 	motorWatch.i = (motorWatch.i + 1) % MAX_MOTORWATCH;
 809  0194 5f            	clrw	x
 810  0195 97            	ld	xl,a
 811  0196 5c            	incw	x
 812  0197 a610          	ld	a,#16
 813  0199 cd0000        	call	c_smodx
 815  019c 01            	rrwa	x,a
 816  019d b720          	ld	_motorWatch+32,a
 817                     ; 260 	motorWatch.step[motorWatch.i] = 0;
 819  019f 5f            	clrw	x
 820  01a0 97            	ld	xl,a
 821  01a1 58            	sllw	x
 822  01a2 905f          	clrw	y
 823  01a4 ef00          	ldw	(_motorWatch,x),y
 824                     ; 263 	if ( Drive.Run || (Drive.Position==tPos) ) return;
 826  01a6 b668          	ld	a,_Drive+1
 827  01a8 2653          	jrne	L441
 829  01aa be6c          	ldw	x,_Drive+5
 830  01ac 1301          	cpw	x,(OFST+1,sp)
 833  01ae 274d          	jreq	L441
 834                     ; 264 	if ( tPos == 0 )				//  goto origin
 836  01b0 1e01          	ldw	x,(OFST+1,sp)
 837  01b2 261a          	jrne	L532
 838                     ; 266 		Drive.ZeroOffset = CPulse( OVER_STEP );
 840  01b4 a61e          	ld	a,#30
 841  01b6 cd00d5        	call	_CPulse
 843  01b9 bf73          	ldw	_Drive+12,x
 844                     ; 267 		Drive.Position += Drive.ZeroOffset;   	// POSITION;
 846  01bb be6c          	ldw	x,_Drive+5
 847  01bd 72bb0073      	addw	x,_Drive+12
 848  01c1 bf6c          	ldw	_Drive+5,x
 849                     ; 268 		Drive.Overrun =	Drive.Target = 0;
 851  01c3 5f            	clrw	x
 852  01c4 bf6e          	ldw	_Drive+7,x
 853  01c6 bf70          	ldw	_Drive+9,x
 854                     ; 269 		Drive.Dir = nMotorClose;
 856  01c8 72150069      	bres	_Drive+2,#2
 858  01cc 2028          	jra	L732
 859  01ce               L532:
 860                     ; 273 		if (Drive.Position >= tPos)	// Closing
 862  01ce be6c          	ldw	x,_Drive+5
 863  01d0 1301          	cpw	x,(OFST+1,sp)
 864  01d2 250b          	jrult	L142
 865                     ; 275 			Drive.Overrun =	Drive.Overrun2 = 0;
 867  01d4 3f72          	clr	_Drive+11
 868  01d6 5f            	clrw	x
 869  01d7 bf70          	ldw	_Drive+9,x
 870                     ; 276 			Drive.Dir = nMotorClose;
 872  01d9 72150069      	bres	_Drive+2,#2
 874  01dd 2008          	jra	L342
 875  01df               L142:
 876                     ; 280 			Drive.Overrun2 = overrun;
 878  01df 7b05          	ld	a,(OFST+5,sp)
 879  01e1 b772          	ld	_Drive+11,a
 880                     ; 281 			Drive.Dir = nMotorOpen;
 882  01e3 72140069      	bset	_Drive+2,#2
 883  01e7               L342:
 884                     ; 283 		Drive.Target = tPos + Drive.Overrun2;
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
 897                     ; 285 	Drive.Run = TRUE;
 899  01f6 35010068      	mov	_Drive+1,#1
 900                     ; 286 	Drive.Ticks = Drive.Interval;
 902  01fa 457a7b        	mov	_Drive+20,_Drive+19
 903                     ; 287 }
 904  01fd               L441:
 907  01fd 85            	popw	x
 908  01fe 81            	ret	
 933                     ; 289 u8	ZeroPos(void)
 933                     ; 290 {
 934                     	switch	.text
 935  01ff               _ZeroPos:
 939                     ; 291 	if( Drive.Run != 0 ) return 0;
 941  01ff b668          	ld	a,_Drive+1
 942  0201 2702          	jreq	L552
 945  0203 4f            	clr	a
 948  0204 81            	ret	
 949  0205               L552:
 950                     ; 292 	if( Drive.Origin == 1 ) return 1;
 952  0205 b66a          	ld	a,_Drive+3
 953  0207 4a            	dec	a
 954  0208 2602          	jrne	L752
 957  020a 4c            	inc	a
 960  020b 81            	ret	
 961  020c               L752:
 962                     ; 293 	StartDriveOR(0, OFFSET_OVERRUN);	// Goto Zero position
 964  020c 4b00          	push	#0
 965  020e 5f            	clrw	x
 966  020f cd0188        	call	_StartDriveOR
 968  0212 84            	pop	a
 969                     ; 294 	return 0;
 971  0213 4f            	clr	a
 974  0214 81            	ret	
1013                     ; 297 void	LightControl(uint16_t t)
1013                     ; 298 {
1014                     	switch	.text
1015  0215               _LightControl:
1017  0215 89            	pushw	x
1018       00000000      OFST:	set	0
1021                     ; 299 	if ( Diff (Timer.Led, ledint) == 0 )
1023  0216 be00          	ldw	x,_ledint
1024  0218 89            	pushw	x
1025  0219 be21          	ldw	x,_Timer
1026  021b cd00de        	call	_Diff
1028  021e 4d            	tnz	a
1029  021f 85            	popw	x
1030  0220 270d          	jreq	L061
1031                     ; 300 		return;
1033                     ; 301 	Timer.Led = t;
1035  0222 1e01          	ldw	x,(OFST+1,sp)
1036  0224 bf21          	ldw	_Timer,x
1037                     ; 302 	LightToggle
1039  0226 be02          	ldw	x,_IO_LED
1040  0228 3b0004        	push	_IO_LED+2
1041  022b cd0000        	call	_GPIO_WriteReverse
1043  022e 84            	pop	a
1044                     ; 304 }
1045  022f               L061:
1048  022f 85            	popw	x
1049  0230 81            	ret	
1087                     ; 306 void MotorService(uint8_t step)
1087                     ; 307 {
1088                     	switch	.text
1089  0231               _MotorService:
1091  0231 88            	push	a
1092       00000000      OFST:	set	0
1095                     ; 308 	if ( step > 205 ) step = 205;
1097  0232 a1ce          	cp	a,#206
1098  0234 2504          	jrult	L713
1101  0236 a6cd          	ld	a,#205
1102  0238 6b01          	ld	(OFST+1,sp),a
1103  023a               L713:
1104                     ; 309 	if ( step < 20 ) step = 0;
1106  023a 7b01          	ld	a,(OFST+1,sp)
1107  023c a114          	cp	a,#20
1108  023e 2402          	jruge	L123
1111  0240 0f01          	clr	(OFST+1,sp)
1112  0242               L123:
1113                     ; 310 	StartDriveOR( CPulse(step), OFFSET_OVERRUN );
1115  0242 4b00          	push	#0
1116  0244 7b02          	ld	a,(OFST+2,sp)
1117  0246 cd00d5        	call	_CPulse
1119  0249 cd0188        	call	_StartDriveOR
1121  024c be81          	ldw	x,_Ticks_1mS
1122  024e bf23          	ldw	_Timer+2,x
1123  0250 84            	pop	a
1124                     ; 311 	Timer.Motor = Ticks_1mS;
1126                     ; 312 }
1129  0251 84            	pop	a
1130  0252 81            	ret	
1159                     ; 314 void StopDrive(void)
1159                     ; 315 {
1160                     	switch	.text
1161  0253               _StopDrive:
1165                     ; 316 	_L_X1 _L_X2 _L_Y1 _L_Y2
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
1194                     ; 317 	Drive.Run = FALSE;
1196                     ; 318 }
1199  0279 81            	ret	
1226                     ; 322 void DriveService(void)
1226                     ; 323 {
1227                     	switch	.text
1228  027a               _DriveService:
1230  027a 89            	pushw	x
1231       00000002      OFST:	set	2
1234                     ; 324 	if ( !Drive.Run ) 
1236  027b b668          	ld	a,_Drive+1
1237                     ; 326 		StopDrive();
1239                     ; 327 		return;
1241  027d 2731          	jreq	LC009
1242                     ; 329 	if ( Drive.Target > Drive.Position )
1244  027f be6e          	ldw	x,_Drive+7
1245  0281 b36c          	cpw	x,_Drive+5
1246  0283 2306          	jrule	L543
1247                     ; 331 	 	MotorStep(nMotorOpen);
1249  0285 a601          	ld	a,#1
1250  0287 ad66          	call	_MotorStep
1252                     ; 332 		return;
1253  0289               L412:
1256  0289 85            	popw	x
1257  028a 81            	ret	
1258  028b               L543:
1259                     ; 334 	if ( Drive.Target < Drive.Position )
1261  028b b36c          	cpw	x,_Drive+5
1262  028d 2405          	jruge	L743
1263                     ; 336 		MotorClose( );
1265  028f cd032a        	call	_MotorClose
1267                     ; 337 		return;
1269  0292 20f5          	jra	L412
1270  0294               L743:
1271                     ; 339 	if ( Drive.Target ) 	// on target position
1273  0294 be6e          	ldw	x,_Drive+7
1274  0296 2713          	jreq	L153
1275                     ; 341 		if ( Drive.Overrun2 )
1277  0298 b672          	ld	a,_Drive+11
1278  029a 270f          	jreq	L153
1279                     ; 343 			Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
1281  029c 5f            	clrw	x
1282  029d 97            	ld	xl,a
1283  029e 1f01          	ldw	(OFST-1,sp),x
1285  02a0 be6e          	ldw	x,_Drive+7
1286  02a2 72f001        	subw	x,(OFST-1,sp)
1287  02a5 bf6e          	ldw	_Drive+7,x
1288                     ; 344 			Drive.Overrun2 = 0;
1290  02a7 3f72          	clr	_Drive+11
1291                     ; 345 			return;
1293  02a9 20de          	jra	L412
1294  02ab               L153:
1295                     ; 348 	Drive.ZeroOffset = Drive.Overrun = 0;
1297  02ab 5f            	clrw	x
1298  02ac bf70          	ldw	_Drive+9,x
1299  02ae bf73          	ldw	_Drive+12,x
1300                     ; 349 	StopDrive();	
1302  02b0               LC009:
1304  02b0 ada1          	call	_StopDrive
1306                     ; 350 }
1308  02b2 20d5          	jra	L412
1352                     ; 352 void	MotorStepPhase(uint8_t dir)
1352                     ; 353 {
1353                     	switch	.text
1354  02b4               _MotorStepPhase:
1356  02b4 88            	push	a
1357       00000001      OFST:	set	1
1360                     ; 354 	uint8_t offset = 0;
1362                     ; 355 	if( dir == 1 )
1364  02b5 4a            	dec	a
1365  02b6 2611          	jrne	L773
1366                     ; 357 		Drive.Position--;
1368  02b8 be6c          	ldw	x,_Drive+5
1369  02ba 5a            	decw	x
1370  02bb bf6c          	ldw	_Drive+5,x
1371                     ; 358 		offset = Drive.NormalOpen ? 1 : -1;
1373  02bd 7201006b03    	btjf	_Drive+4,#0,L022
1374  02c2 4c            	inc	a
1375  02c3 2014          	jra	L622
1376  02c5               L022:
1377  02c5 a6ff          	ld	a,#255
1379  02c7 2010          	jra	L622
1380  02c9               L773:
1381                     ; 362 		Drive.Position++;
1383  02c9 be6c          	ldw	x,_Drive+5
1384  02cb 5c            	incw	x
1385  02cc bf6c          	ldw	_Drive+5,x
1386                     ; 363 		offset = Drive.NormalOpen ? -1 : 1;
1388  02ce 7201006b04    	btjf	_Drive+4,#0,L422
1389  02d3 a6ff          	ld	a,#255
1390  02d5 2002          	jra	L622
1391  02d7               L422:
1392  02d7 a601          	ld	a,#1
1393  02d9               L622:
1395                     ; 365 	Drive.Phase += offset;
1397  02d9 bb75          	add	a,_Drive+14
1398  02db b775          	ld	_Drive+14,a
1399                     ; 366 }
1402  02dd 84            	pop	a
1403  02de 81            	ret	
1428                     ; 368 void	MotorStepSetOverrun(void)
1428                     ; 369 {
1429                     	switch	.text
1430  02df               _MotorStepSetOverrun:
1434                     ; 370 	Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
1436  02df be78          	ldw	x,_Drive+17
1437  02e1 1d0028        	subw	x,#40
1438                     ; 371 	if ( Drive.MaxOverrun > OVERRUN )
1440  02e4 a3012d        	cpw	x,#301
1441  02e7 2503          	jrult	L314
1442                     ; 372 		Drive.MaxOverrun = OVERRUN;				
1444  02e9 ae012c        	ldw	x,#300
1445  02ec               L314:
1446  02ec bf76          	ldw	_Drive+15,x
1447                     ; 373 }
1450  02ee 81            	ret	
1510                     ; 375 void MotorStep(MOTOR_DIR Dir)
1510                     ; 376 {
1511                     	switch	.text
1512  02ef               _MotorStep:
1516                     ; 377 	if( Dir == nMotorClose )
1518  02ef 4d            	tnz	a
1519  02f0 2619          	jrne	L344
1520                     ; 379 		if( Drive.Position != 0 ) 
1522  02f2 be6c          	ldw	x,_Drive+5
1523  02f4 2703          	jreq	L544
1524                     ; 380 			MotorStepPhase(1);
1526  02f6 4c            	inc	a
1527  02f7 adbb          	call	_MotorStepPhase
1529  02f9               L544:
1530                     ; 382 		if( Drive.Position == 0 ) 
1532  02f9 be6c          	ldw	x,_Drive+5
1533  02fb 2626          	jrne	L154
1534                     ; 384 			Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0;
1536  02fd 5f            	clrw	x
1537  02fe bf6e          	ldw	_Drive+7,x
1538  0300 bf6c          	ldw	_Drive+5,x
1539  0302 bf73          	ldw	_Drive+12,x
1540  0304 bf70          	ldw	_Drive+9,x
1541                     ; 385 			StopDrive();	
1543  0306 cd0253        	call	_StopDrive
1545  0309 2018          	jra	L154
1546  030b               L344:
1547                     ; 391 		MotorStepPhase(0);
1549  030b 4f            	clr	a
1550  030c ada6          	call	_MotorStepPhase
1552                     ; 393 		if( Drive.Origin ) 
1554  030e b66a          	ld	a,_Drive+3
1555  0310 270a          	jreq	L354
1556                     ; 395 			Drive.ORGPosition = Drive.Position;
1558  0312 be6c          	ldw	x,_Drive+5
1559  0314 bf78          	ldw	_Drive+17,x
1560                     ; 396 			Drive.LastOrigin = TRUE;
1562  0316 72120069      	bset	_Drive+2,#1
1564  031a 2007          	jra	L154
1565  031c               L354:
1566                     ; 400 			if ( Drive.LastOrigin )
1568  031c 7203006902    	btjf	_Drive+2,#1,L154
1569                     ; 401 				MotorStepSetOverrun();
1571  0321 adbc          	call	_MotorStepSetOverrun
1573  0323               L154:
1574                     ; 404 	phase_excite(Drive.Phase%8);
1576  0323 b675          	ld	a,_Drive+14
1577  0325 a407          	and	a,#7
1579                     ; 405 }
1582  0327 cc0000        	jp	_phase_excite
1608                     ; 407 void MotorClose(void)
1608                     ; 408 {
1609                     	switch	.text
1610  032a               _MotorClose:
1614                     ; 409 	if ( !Drive.Origin )   		// Hall IC Sensing 
1616  032a b66a          	ld	a,_Drive+3
1617  032c 2602          	jrne	L174
1618                     ; 411 		MotorStep(nMotorClose);
1621                     ; 412 		return;
1624  032e 20bf          	jp	_MotorStep
1625  0330               L174:
1626                     ; 414 	if ( Drive.Overrun >= Drive.MaxOverrun )
1628  0330 be70          	ldw	x,_Drive+9
1629  0332 b376          	cpw	x,_Drive+15
1630  0334 250c          	jrult	L374
1631                     ; 416 		Drive.Target = Drive.Position = Drive.Overrun = Drive.ZeroOffset = 0;
1633  0336 5f            	clrw	x
1634  0337 bf73          	ldw	_Drive+12,x
1635  0339 bf70          	ldw	_Drive+9,x
1636  033b bf6c          	ldw	_Drive+5,x
1637  033d bf6e          	ldw	_Drive+7,x
1638                     ; 417 		StopDrive();
1641                     ; 418 		return;
1644  033f cc0253        	jp	_StopDrive
1645  0342               L374:
1646                     ; 420 	Drive.Overrun++;
1648  0342 5c            	incw	x
1649  0343 bf70          	ldw	_Drive+9,x
1650                     ; 421 	MotorStep(nMotorClose);
1652  0345 4f            	clr	a
1654                     ; 422 }
1657  0346 20a7          	jp	_MotorStep
1712                     ; 424 void	factory(uint8_t mode)
1712                     ; 425 {
1713                     	switch	.text
1714  0348               _factory:
1716  0348 5204          	subw	sp,#4
1717       00000004      OFST:	set	4
1720                     ; 426 	uint16_t t = 0, _t = 0;
1722  034a 5f            	clrw	x
1723  034b 1f01          	ldw	(OFST-3,sp),x
1727  034d 1f03          	ldw	(OFST-1,sp),x
1729                     ; 427 	if( mode == 0 )
1731  034f 4d            	tnz	a
1732  0350 2603          	jrne	L525
1733                     ; 428 		return;
1736  0352 5b04          	addw	sp,#4
1737  0354 81            	ret	
1738  0355               L525:
1739                     ; 431 		if( Ticks_1mS == _t )
1741  0355 be81          	ldw	x,_Ticks_1mS
1742  0357 1303          	cpw	x,(OFST-1,sp)
1743  0359 27fa          	jreq	L525
1744                     ; 432 			continue;
1746                     ; 433 		_t = Ticks_1mS;
1748  035b be81          	ldw	x,_Ticks_1mS
1749  035d 1f03          	ldw	(OFST-1,sp),x
1751                     ; 434 		t++;
1753  035f 1e01          	ldw	x,(OFST-3,sp)
1754  0361 5c            	incw	x
1755  0362 1f01          	ldw	(OFST-3,sp),x
1757                     ; 435 		if( t > 200 )
1759  0364 a300c9        	cpw	x,#201
1760  0367 25ec          	jrult	L525
1761                     ; 437 			LightToggle
1763  0369 3b0004        	push	_IO_LED+2
1764  036c be02          	ldw	x,_IO_LED
1765  036e cd0000        	call	_GPIO_WriteReverse
1767  0371 84            	pop	a
1768  0372 20e1          	jra	L525
1793                     ; 442 void Clock_Config(void)
1793                     ; 443 {
1794                     	switch	.text
1795  0374               _Clock_Config:
1799                     ; 449 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
1801  0374 4f            	clr	a
1802  0375 cd0000        	call	_CLK_SYSCLKConfig
1804                     ; 450 	CLK_HSICmd(ENABLE);
1806  0378 a601          	ld	a,#1
1808                     ; 451 }
1811  037a cc0000        	jp	_CLK_HSICmd
1861                     ; 453 void Gpio_CheckMode(void)
1861                     ; 454 {
1862                     	switch	.text
1863  037d               _Gpio_CheckMode:
1865       00000002      OFST:	set	2
1868                     ; 455 	uint8_t t = 0;
1870                     ; 456 	uint8_t prev = 0;
1872                     ; 458 	Drive.DeviceType = TYPE_MD24;
1874  037d 35010080      	mov	_Drive+25,#1
1875                     ; 459 	Ticks_1mS = 0;
1877  0381 5f            	clrw	x
1878  0382 bf81          	ldw	_Ticks_1mS,x
1879                     ; 460 	return;
1882  0384 81            	ret	
1920                     ; 493 void Gpio_Config(void)
1920                     ; 494 {
1921                     	switch	.text
1922  0385               _Gpio_Config:
1926                     ; 495 	Gpio_CheckMode();
1928  0385 adf6          	call	_Gpio_CheckMode
1930                     ; 497 	GPIO_SET(LED, GPIO_MODE_OUT_PP_LOW_FAST)
1932  0387 4be0          	push	#224
1933  0389 3b0004        	push	_IO_LED+2
1934  038c be02          	ldw	x,_IO_LED
1935  038e cd0000        	call	_GPIO_Init
1937  0391 85            	popw	x
1938                     ; 498 	GPIO_SET(ORG, GPIO_MODE_IN_FL_NO_IT)
1940  0392 4b00          	push	#0
1941  0394 3b0007        	push	_IO_ORG+2
1942  0397 be05          	ldw	x,_IO_ORG
1943  0399 cd0000        	call	_GPIO_Init
1945  039c 85            	popw	x
1946                     ; 499 	GPIO_SET(X1, GPIO_MODE_OUT_PP_LOW_FAST)
1948  039d 4be0          	push	#224
1949  039f 3b000a        	push	_IO_X1+2
1950  03a2 be08          	ldw	x,_IO_X1
1951  03a4 cd0000        	call	_GPIO_Init
1953  03a7 85            	popw	x
1954                     ; 500 	GPIO_SET(X2, GPIO_MODE_OUT_PP_LOW_FAST)
1956  03a8 4be0          	push	#224
1957  03aa 3b000d        	push	_IO_X2+2
1958  03ad be0b          	ldw	x,_IO_X2
1959  03af cd0000        	call	_GPIO_Init
1961  03b2 85            	popw	x
1962                     ; 501 	GPIO_SET(Y1, GPIO_MODE_OUT_PP_LOW_FAST)
1964  03b3 4be0          	push	#224
1965  03b5 3b0010        	push	_IO_Y1+2
1966  03b8 be0e          	ldw	x,_IO_Y1
1967  03ba cd0000        	call	_GPIO_Init
1969  03bd 85            	popw	x
1970                     ; 502 	GPIO_SET(Y2, GPIO_MODE_OUT_PP_LOW_FAST)
1972  03be 4be0          	push	#224
1973  03c0 3b0013        	push	_IO_Y2+2
1974  03c3 be11          	ldw	x,_IO_Y2
1975  03c5 cd0000        	call	_GPIO_Init
1977  03c8 85            	popw	x
1978                     ; 503 	StopDrive();
1980  03c9 cd0253        	call	_StopDrive
1982                     ; 505 	GPIO_SET(ADJ, GPIO_MODE_IN_FL_NO_IT)
1984  03cc 4b00          	push	#0
1985  03ce 3b0016        	push	_IO_ADJ+2
1986  03d1 be14          	ldw	x,_IO_ADJ
1987  03d3 cd0000        	call	_GPIO_Init
1989  03d6 85            	popw	x
1990                     ; 506 	GPIO_SET(SEN, GPIO_MODE_IN_FL_NO_IT)
1992  03d7 4b00          	push	#0
1993  03d9 3b0019        	push	_IO_SEN+2
1994  03dc be17          	ldw	x,_IO_SEN
1995  03de cd0000        	call	_GPIO_Init
1997  03e1 85            	popw	x
1998                     ; 507 	GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
2000  03e2 4b00          	push	#0
2001  03e4 3b001c        	push	_IO_POWER+2
2002  03e7 be1a          	ldw	x,_IO_POWER
2003  03e9 cd0000        	call	_GPIO_Init
2005  03ec b680          	ld	a,_Drive+25
2006  03ee 4a            	dec	a
2007  03ef 85            	popw	x
2008                     ; 508 	if( Drive.DeviceType == TYPE_MD24 )
2010  03f0 2601          	jrne	L775
2011                     ; 510 		return;
2014  03f2 81            	ret	
2015  03f3               L775:
2016                     ; 513 	GPIO_SET(BAT, GPIO_MODE_IN_FL_NO_IT)
2018  03f3 4b00          	push	#0
2019  03f5 3b0022        	push	_IO_BAT+2
2020  03f8 be20          	ldw	x,_IO_BAT
2021  03fa cd0000        	call	_GPIO_Init
2023  03fd b680          	ld	a,_Drive+25
2024  03ff a102          	cp	a,#2
2025  0401 85            	popw	x
2026                     ; 514 	if( Drive.DeviceType == TYPE_MD12 )
2028  0402 2616          	jrne	L106
2029                     ; 516 		GPIO_SET(BOOST, GPIO_MODE_IN_FL_NO_IT)
2031  0404 4b00          	push	#0
2032  0406 3b0025        	push	_IO_BOOST+2
2033  0409 be23          	ldw	x,_IO_BOOST
2034  040b cd0000        	call	_GPIO_Init
2036  040e 85            	popw	x
2037                     ; 517 		GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
2039  040f 4b00          	push	#0
2040  0411 3b001c        	push	_IO_POWER+2
2041  0414 be1a          	ldw	x,_IO_POWER
2042  0416 cd0000        	call	_GPIO_Init
2044  0419 85            	popw	x
2045  041a               L106:
2046                     ; 519 }
2049  041a 81            	ret	
2072                     ; 521 OnTimer_1S(void) {}
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
2145                     ; 535 void	AdcGetCode(uint8_t ch)
2145                     ; 536 {
2146                     	switch	.text
2147  041c               _AdcGetCode:
2149  041c 88            	push	a
2150  041d 5203          	subw	sp,#3
2151       00000003      OFST:	set	3
2154                     ; 541 	uint8_t i = 0;
2156                     ; 543 	Adc.buf[ch].b[i] = ADC1_GetConversionValue();
2158  041f cd0000        	call	_ADC1_GetConversionValue
2160  0422 1f01          	ldw	(OFST-2,sp),x
2162  0424 7b04          	ld	a,(OFST+1,sp)
2163  0426 97            	ld	xl,a
2164  0427 a609          	ld	a,#9
2165  0429 42            	mul	x,a
2166  042a 1601          	ldw	y,(OFST-2,sp)
2167  042c ef2a          	ldw	(_Adc+1,x),y
2168                     ; 544 }
2171  042e 5b04          	addw	sp,#4
2172  0430 81            	ret	
2204                     ; 546 void Adc_Config(void)
2204                     ; 547 {
2205                     	switch	.text
2206  0431               _Adc_Config:
2210                     ; 548 	AdcGetCode(Adc.ch);
2212  0431 b629          	ld	a,_Adc
2213  0433 ade7          	call	_AdcGetCode
2215                     ; 549 	Adc.ch = _chanId[Adc.ch];
2217  0435 b629          	ld	a,_Adc
2218  0437 5f            	clrw	x
2219  0438 97            	ld	xl,a
2220  0439 e633          	ld	a,(__chanId,x)
2221  043b b729          	ld	_Adc,a
2222                     ; 551 	if( Drive.DeviceType == TYPE_MD24 )
2224  043d b680          	ld	a,_Drive+25
2225  043f 4a            	dec	a
2226  0440 260a          	jrne	L546
2227                     ; 553 		if( Adc.ch == 2 )
2229  0442 b629          	ld	a,_Adc
2230  0444 a102          	cp	a,#2
2231  0446 2604          	jrne	L546
2232                     ; 554 			Adc.ch = 4;
2234  0448 35040029      	mov	_Adc,#4
2235  044c               L546:
2236                     ; 556 	ADC1_DeInit();
2238  044c cd0000        	call	_ADC1_DeInit
2240                     ; 557 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
2240                     ; 558 		_chan[Adc.ch], 
2240                     ; 559 		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
2240                     ; 560 		_chanSchmit[Adc.ch],
2240                     ; 561 	   	DISABLE
2240                     ; 562 		);
2242  044f 4b00          	push	#0
2243  0451 b629          	ld	a,_Adc
2244  0453 5f            	clrw	x
2245  0454 97            	ld	xl,a
2246  0455 e62e          	ld	a,(__chanSchmit,x)
2247  0457 88            	push	a
2248  0458 4b08          	push	#8
2249  045a 4b00          	push	#0
2250  045c 4b00          	push	#0
2251  045e 4b00          	push	#0
2252  0460 b629          	ld	a,_Adc
2253  0462 5f            	clrw	x
2254  0463 97            	ld	xl,a
2255  0464 e629          	ld	a,(__chan,x)
2256  0466 5f            	clrw	x
2257  0467 97            	ld	xl,a
2258  0468 cd0000        	call	_ADC1_Init
2260  046b 5b06          	addw	sp,#6
2261                     ; 563 	ADC1_StartConversion();		
2264                     ; 564 }
2267  046d cc0000        	jp	_ADC1_StartConversion
2302                     ; 566 void	AdcGetAvg(uint8_t ch)
2302                     ; 567 {
2303                     	switch	.text
2304  0470               _AdcGetAvg:
2306  0470 88            	push	a
2307       00000000      OFST:	set	0
2310                     ; 575 	Adc.buf[ch].avg = Adc.buf[ch].b[0]>>2;
2312  0471 97            	ld	xl,a
2313  0472 a609          	ld	a,#9
2314  0474 42            	mul	x,a
2315  0475 89            	pushw	x
2316  0476 7b03          	ld	a,(OFST+3,sp)
2317  0478 97            	ld	xl,a
2318  0479 a609          	ld	a,#9
2319  047b 42            	mul	x,a
2320  047c ee2a          	ldw	x,(_Adc+1,x)
2321  047e 54            	srlw	x
2322  047f 54            	srlw	x
2323  0480 9085          	popw	y
2324  0482 01            	rrwa	x,a
2325  0483 90e732        	ld	(_Adc+9,y),a
2326                     ; 577 }
2329  0486 84            	pop	a
2330  0487 81            	ret	
2373                     ; 579 void AdcService(uint8_t ch)
2373                     ; 580 {
2374                     	switch	.text
2375  0488               _AdcService:
2377  0488 88            	push	a
2378       00000000      OFST:	set	0
2381                     ; 581 	if( Ticks_50uS >= 10 )
2383  0489 b683          	ld	a,_Ticks_50uS
2384  048b a10a          	cp	a,#10
2385  048d 2515          	jrult	L507
2386                     ; 584 		Adc_Config();
2388  048f ada0          	call	_Adc_Config
2390                     ; 585 		Drive.Origin = !MotorOrigin();
2392  0491 3b0007        	push	_IO_ORG+2
2393  0494 be05          	ldw	x,_IO_ORG
2394  0496 cd0000        	call	_GPIO_ReadInputPin
2396  0499 5b01          	addw	sp,#1
2397  049b 4d            	tnz	a
2398  049c 2603          	jrne	L653
2399  049e 4c            	inc	a
2400  049f 2001          	jra	L263
2401  04a1               L653:
2402  04a1 4f            	clr	a
2403  04a2               L263:
2404  04a2 b76a          	ld	_Drive+3,a
2406  04a4               L507:
2407                     ; 588 	if( Diff(Timer.Adc, 10) != 1 )
2409  04a4 ae000a        	ldw	x,#10
2410  04a7 89            	pushw	x
2411  04a8 be25          	ldw	x,_Timer+4
2412  04aa cd00de        	call	_Diff
2414  04ad 4a            	dec	a
2415  04ae 85            	popw	x
2416  04af 2702          	jreq	L707
2417                     ; 589 		return;
2420  04b1 84            	pop	a
2421  04b2 81            	ret	
2422  04b3               L707:
2423                     ; 590 	Timer.Adc = Ticks_1mS;
2425  04b3 be81          	ldw	x,_Ticks_1mS
2426  04b5 bf25          	ldw	_Timer+4,x
2427                     ; 592 	AdcGetAvg(ch);	//	Adc.buf[ch].avg
2429  04b7 7b01          	ld	a,(OFST+1,sp)
2430  04b9 adb5          	call	_AdcGetAvg
2432                     ; 593 	if( Drive.DeviceType == TYPE_MD24 )
2434                     ; 596 		if( ch == 0 ) { }
2437                     ; 597 		else if( ch == 1 ) { }
2440                     ; 598 		else if( ch == 2 ) { }
2442                     ; 602 		if( ch == 0 ) { }
2445                     ; 603 		else if( ch == 1 ) { }
2448                     ; 604 		else if( ch == 2 ) { }
2451                     ; 605 		else if( ch == 3 ) { }
2454                     ; 606 		else if( ch == 4 ) { }
2456                     ; 608 }
2459  04bb 84            	pop	a
2460  04bc 81            	ret	
2488                     ; 610 void OnTimer4(void)
2488                     ; 611 {
2489                     	switch	.text
2490  04bd               _OnTimer4:
2494                     ; 612 	Ticks_50uS++;
2496  04bd 3c83          	inc	_Ticks_50uS
2497                     ; 613 	if( Ticks_50uS >= 20 )
2499  04bf b683          	ld	a,_Ticks_50uS
2500  04c1 a114          	cp	a,#20
2501  04c3 2507          	jrult	L167
2502                     ; 615 		Ticks_50uS = 0;
2504  04c5 3f83          	clr	_Ticks_50uS
2505                     ; 616 		Ticks_1mS++;
2507  04c7 be81          	ldw	x,_Ticks_1mS
2508  04c9 5c            	incw	x
2509  04ca bf81          	ldw	_Ticks_1mS,x
2510  04cc               L167:
2511                     ; 618 	if( Drive.Ticks )
2513  04cc b67b          	ld	a,_Drive+20
2514  04ce 2706          	jreq	L367
2515                     ; 619 		Drive.Ticks--;
2517  04d0 3a7b          	dec	_Drive+20
2519  04d2 a601          	ld	a,#1
2520  04d4 200b          	jra	L567
2521  04d6               L367:
2522                     ; 622 		Drive.MotorRun = 1;
2524  04d6 4c            	inc	a
2525  04d7 b77c          	ld	_Drive+21,a
2526                     ; 623 		if( Drive.Enabled )
2528  04d9 7201006703    	btjf	_Drive,#0,L567
2529                     ; 624 			Drive.Ticks = Drive.Interval;
2531  04de 457a7b        	mov	_Drive+20,_Drive+19
2532  04e1               L567:
2533                     ; 626 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
2535  04e1 cd0000        	call	_TIM4_ClearITPendingBit
2537                     ; 627 	TIM4_ClearFlag(TIM4_IT_UPDATE);
2539  04e4 a601          	ld	a,#1
2541                     ; 628 }
2544  04e6 cc0000        	jp	_TIM4_ClearFlag
2568                     ; 630 void OnCaptureOVTim2(void)
2568                     ; 631 {
2569                     	switch	.text
2570  04e9               _OnCaptureOVTim2:
2574                     ; 635 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
2576  04e9 a601          	ld	a,#1
2578                     ; 636 }	
2581  04eb cc0000        	jp	_TIM2_ClearITPendingBit
2621                     ; 638 void OnCaptureTim2(void)
2621                     ; 639 {
2622                     	switch	.text
2623  04ee               _OnCaptureTim2:
2625  04ee 89            	pushw	x
2626       00000002      OFST:	set	2
2629                     ; 656 	if( TIM2_GetITStatus(TIM2_IT_CC1) == SET )
2631  04ef a602          	ld	a,#2
2632  04f1 cd0000        	call	_TIM2_GetITStatus
2634  04f4 4a            	dec	a
2635  04f5 2646          	jrne	L7101
2636                     ; 658 		t = TIM2_GetCapture1();	
2638  04f7 cd0000        	call	_TIM2_GetCapture1
2640  04fa 1f01          	ldw	(OFST-1,sp),x
2642                     ; 659 		TIM2_InterruptClear(TIM2_IT_CC1)
2644  04fc a602          	ld	a,#2
2645  04fe cd0000        	call	_TIM2_ClearITPendingBit
2649  0501 5f            	clrw	x
2650  0502 cd0000        	call	_TIM2_SetCounter
2652                     ; 664 		TIMER_EDGE_SET(Pwm.Edge)	//	TIM2_Init()
2654  0505 4b00          	push	#0
2655  0507 4b00          	push	#0
2656  0509 4b01          	push	#1
2657  050b 7200005d04    	btjt	_Pwm+6,#0,L614
2658  0510 a644          	ld	a,#68
2659  0512 2001          	jra	L024
2660  0514               L614:
2661  0514 4f            	clr	a
2662  0515               L024:
2663  0515 5f            	clrw	x
2664  0516 97            	ld	xl,a
2665  0517 cd0000        	call	_TIM2_ICInit
2667  051a 5b03          	addw	sp,#3
2668                     ; 665 		if ( Pwm.Edge == 0 ) 
2670  051c 7200005d0a    	btjt	_Pwm+6,#0,L1201
2671                     ; 667 			Pwm.Edge = 1;
2673  0521 7210005d      	bset	_Pwm+6,#0
2674                     ; 668 			Pwm.T1 = t;
2676  0525 1e01          	ldw	x,(OFST-1,sp)
2677  0527 bf5f          	ldw	_Pwm+8,x
2679  0529 2012          	jra	L7101
2680  052b               L1201:
2681                     ; 672 			Pwm.Edge = 0; 
2683  052b 7211005d      	bres	_Pwm+6,#0
2684                     ; 673 			Pwm.Calc = 1;
2686  052f 3501005e      	mov	_Pwm+7,#1
2687                     ; 674 			Pwm.T2 = t;	
2689  0533 1e01          	ldw	x,(OFST-1,sp)
2690  0535 bf61          	ldw	_Pwm+10,x
2691                     ; 675 			Pwm.Count = Pwm.T2 - Pwm.T1;
2693  0537 72b0005f      	subw	x,_Pwm+8
2694  053b bf65          	ldw	_Pwm+14,x
2695  053d               L7101:
2696                     ; 679 }
2699  053d 85            	popw	x
2700  053e 81            	ret	
2730                     ; 681 void Timer_Config(void)
2730                     ; 682 {
2731                     	switch	.text
2732  053f               _Timer_Config:
2736                     ; 684 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);  //  16 * 0x32 = 50uS  Ticks, 0x64-100us 
2738  053f ae0432        	ldw	x,#1074
2739  0542 cd0000        	call	_TIM4_TimeBaseInit
2741                     ; 685   	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2743  0545 ae0101        	ldw	x,#257
2744  0548 cd0000        	call	_TIM4_ITConfig
2746                     ; 686   	TIM4_Cmd(ENABLE);
2748  054b a601          	ld	a,#1
2749  054d cd0000        	call	_TIM4_Cmd
2751                     ; 688 	TIM2_TimeBaseInit(TIM2_PRESCALER_4, 0xffff);	//	4 -> 0.25us
2753  0550 aeffff        	ldw	x,#65535
2754  0553 89            	pushw	x
2755  0554 a602          	ld	a,#2
2756  0556 cd0000        	call	_TIM2_TimeBaseInit
2758  0559 85            	popw	x
2759                     ; 694 	TIMER_EDGE_SET(0)	//	TIM2_Init()
2761  055a 4b00          	push	#0
2762  055c 4b00          	push	#0
2763  055e 4b01          	push	#1
2764  0560 ae0044        	ldw	x,#68
2765  0563 cd0000        	call	_TIM2_ICInit
2767  0566 5b03          	addw	sp,#3
2768                     ; 695 	TIM2_ITConfig(TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
2770  0568 ae0301        	ldw	x,#769
2771  056b cd0000        	call	_TIM2_ITConfig
2773                     ; 697 	TIM2_Cmd(ENABLE);
2775  056e a601          	ld	a,#1
2777                     ; 698 }
2780  0570 cc0000        	jp	_TIM2_Cmd
2803                     ; 700 void mainDeviceType(void)
2803                     ; 701 {
2804                     	switch	.text
2805  0573               _mainDeviceType:
2809  0573               L5401:
2810  0573 20fe          	jra	L5401
2837                     ; 705 void	motorGo(void)
2837                     ; 706 {
2838                     	switch	.text
2839  0575               _motorGo:
2843                     ; 707 	if ( Drive.MotorRun == 1 && Drive.Enabled )
2845  0575 b67c          	ld	a,_Drive+21
2846  0577 4a            	dec	a
2847  0578 260d          	jrne	L1601
2849  057a 7201006708    	btjf	_Drive,#0,L1601
2850                     ; 709 		Drive.MotorRun = 0;
2852  057f b77c          	ld	_Drive+21,a
2853                     ; 710 		DriveService();	
2855  0581 cd027a        	call	_DriveService
2857                     ; 711 		Drive.Ticks = Drive.Interval;
2859  0584 457a7b        	mov	_Drive+20,_Drive+19
2860  0587               L1601:
2861                     ; 715 	if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
2863  0587 720000690f    	btjt	_Drive+2,#0,L3601
2865  058c b668          	ld	a,_Drive+1
2866  058e a101          	cp	a,#1
2867  0590 2609          	jrne	L3601
2868                     ; 717 		Pwm.T1_1mS = Ticks_1mS;
2870  0592 be81          	ldw	x,_Ticks_1mS
2871  0594 bf57          	ldw	_Pwm,x
2872                     ; 718 		Drive.Run0 = Drive.Run;
2874  0596 44            	srl	a
2875  0597 90110069      	bccm	_Drive+2,#0
2876  059b               L3601:
2877                     ; 720 	if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
2879  059b 7201006913    	btjf	_Drive+2,#0,L5601
2881  05a0 b668          	ld	a,_Drive+1
2882  05a2 260f          	jrne	L5601
2883                     ; 722 		Pwm.T2_1mS = Ticks_1mS;
2885  05a4 be81          	ldw	x,_Ticks_1mS
2886  05a6 bf59          	ldw	_Pwm+2,x
2887                     ; 723 		Drive.Run0 = Drive.Run;			
2889  05a8 44            	srl	a
2890  05a9 90110069      	bccm	_Drive+2,#0
2891                     ; 724 		Pwm.diff = Pwm.T2_1mS - Pwm.T1_1mS;
2893  05ad 72b00057      	subw	x,_Pwm
2894  05b1 bf5b          	ldw	_Pwm+4,x
2895  05b3               L5601:
2896                     ; 727 }
2899  05b3 81            	ret	
3000                     ; 729 void main(void)
3000                     ; 730 {
3001                     	switch	.text
3002  05b4               _main:
3004  05b4 5211          	subw	sp,#17
3005       00000011      OFST:	set	17
3008                     ; 733 	uint8_t		channel = 0;
3010  05b6 0f05          	clr	(OFST-12,sp)
3012                     ; 737 	Drive.Enabled = TRUE;
3014                     ; 738 	Drive.MaxOverrun = OVERRUN;
3016  05b8 ae012c        	ldw	x,#300
3017  05bb 72100067      	bset	_Drive,#0
3018  05bf bf76          	ldw	_Drive+15,x
3019                     ; 739 	Drive.Position = Drive.Stage = 0;
3021  05c1 3f7f          	clr	_Drive+24
3022  05c3 5f            	clrw	x
3023  05c4 bf6c          	ldw	_Drive+5,x
3024                     ; 740 	Drive.Dir = nMotorClose;
3026  05c6 72150069      	bres	_Drive+2,#2
3027                     ; 741 	Drive.Interval = 15;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
3029  05ca 350f007a      	mov	_Drive+19,#15
3030                     ; 743 	Ticks_1mS = Ticks_50uS = Pwm.Edge = 0;
3032  05ce 7211005d      	bres	_Pwm+6,#0
3033  05d2 3f83          	clr	_Ticks_50uS
3034  05d4 bf81          	ldw	_Ticks_1mS,x
3035                     ; 745 	Clock_Config();
3037  05d6 cd0374        	call	_Clock_Config
3039                     ; 746 	Gpio_Config();
3041  05d9 cd0385        	call	_Gpio_Config
3043                     ; 747 	Timer_Config();
3045  05dc cd053f        	call	_Timer_Config
3047                     ; 749 	Adc.ch = 2;
3049  05df 35020029      	mov	_Adc,#2
3050                     ; 750 	Adc_Config();
3052  05e3 cd0431        	call	_Adc_Config
3054                     ; 752 	dutyInfo.s = dutyInfo.i = 0;
3056  05e6 3fac          	clr	_dutyInfo+40
3057  05e8 5f            	clrw	x
3058  05e9 bfae          	ldw	_dutyInfo+42,x
3059                     ; 753 	Pwm.Calc = Pwm.Edge = 0;
3061  05eb 7211005d      	bres	_Pwm+6,#0
3062  05ef 3f5e          	clr	_Pwm+7
3063                     ; 755 	enableInterrupts();
3066  05f1 9a            	rim	
3068                     ; 756 	waitPowerDelay();
3071  05f2 cd016e        	call	_waitPowerDelay
3073                     ; 757 	if ( Drive.Origin ) 
3075  05f5 b66a          	ld	a,_Drive+3
3076  05f7 2719          	jreq	L1311
3077                     ; 759 		Drive.Position = 0;
3079  05f9 5f            	clrw	x
3080  05fa bf6c          	ldw	_Drive+5,x
3081                     ; 760 		StartDriveOR( CPulse(MAX_MOTOR_POS), OFFSET_OVERRUN);
3083  05fc 4b00          	push	#0
3084  05fe a6c8          	ld	a,#200
3085  0600 cd00d5        	call	_CPulse
3087  0603 cd0188        	call	_StartDriveOR
3089  0606 84            	pop	a
3091  0607 2003          	jra	L5311
3092  0609               L3311:
3093                     ; 763 			motorGo();
3095  0609 cd0575        	call	_motorGo
3097  060c               L5311:
3098                     ; 762 		while ( Drive.Run )
3100  060c b668          	ld	a,_Drive+1
3101  060e 26f9          	jrne	L3311
3103  0610 2007          	jra	L1411
3104  0612               L1311:
3105                     ; 766 		Drive.Position = CPulse(MAX_MOTOR_POS + 5);
3107  0612 a6cd          	ld	a,#205
3108  0614 cd00d5        	call	_CPulse
3110  0617 bf6c          	ldw	_Drive+5,x
3111  0619               L1411:
3112                     ; 768 	Timer.Led = Timer.Motor = Timer.Adc = Ticks_1mS;
3114  0619 be81          	ldw	x,_Ticks_1mS
3115  061b bf25          	ldw	_Timer+4,x
3116  061d bf23          	ldw	_Timer+2,x
3117  061f bf21          	ldw	_Timer,x
3118                     ; 769 	Drive.Run0 = Drive.Run;
3120  0621 b668          	ld	a,_Drive+1
3121  0623 44            	srl	a
3122  0624 90110069      	bccm	_Drive+2,#0
3123                     ; 771 	if( Drive.DeviceType == TYPE_MD12 )
3125  0628 b680          	ld	a,_Drive+25
3126  062a a102          	cp	a,#2
3127  062c 2603          	jrne	L5411
3128                     ; 772 		mainDeviceType();
3130  062e cd0573        	call	_mainDeviceType
3132  0631               L5411:
3133                     ; 776 		tt = Ticks_1mS;
3135  0631 be81          	ldw	x,_Ticks_1mS
3136  0633 1f10          	ldw	(OFST-1,sp),x
3138                     ; 777 		LightControl(tt);
3140  0635 cd0215        	call	_LightControl
3142                     ; 779 		AdcService(channel);
3144  0638 7b05          	ld	a,(OFST-12,sp)
3145  063a cd0488        	call	_AdcService
3147                     ; 781 		if ( Drive.Stage == 0 )
3149  063d b67f          	ld	a,_Drive+24
3150  063f 2607          	jrne	L1511
3151                     ; 783 			Drive.Stage = ZeroPos();
3153  0641 cd01ff        	call	_ZeroPos
3155  0644 b77f          	ld	_Drive+24,a
3157  0646 2031          	jra	L3511
3158  0648               L1511:
3159                     ; 787 			if ( Diff(Timer.Motor, 100) == 1 )
3161  0648 ae0064        	ldw	x,#100
3162  064b 89            	pushw	x
3163  064c be23          	ldw	x,_Timer+2
3164  064e cd00de        	call	_Diff
3166  0651 4a            	dec	a
3167  0652 85            	popw	x
3168  0653 2624          	jrne	L3511
3169                     ; 789 				if ( Diff(Timer.PwmUpdate, MAX_TIMEOUT) != 0 )
3171  0655 ae07d0        	ldw	x,#2000
3172  0658 89            	pushw	x
3173  0659 be27          	ldw	x,_Timer+6
3174  065b cd00de        	call	_Diff
3176  065e 4d            	tnz	a
3177  065f 85            	popw	x
3178  0660 2717          	jreq	L3511
3179                     ; 791 					Timer.PwmUpdate = (Ticks_1mS > MAX_TIMEOUT) ? 
3179                     ; 792 						Ticks_1mS - MAX_TIMEOUT : 
3179                     ; 793 						0xffff - MAX_TIMEOUT + Ticks_1mS;
3181  0662 be81          	ldw	x,_Ticks_1mS
3182  0664 a307d1        	cpw	x,#2001
3183  0667 2507          	jrult	L015
3184  0669 be81          	ldw	x,_Ticks_1mS
3185  066b 1d07d0        	subw	x,#2000
3186  066e 2005          	jra	L215
3187  0670               L015:
3188  0670 be81          	ldw	x,_Ticks_1mS
3189  0672 1cf82f        	addw	x,#63535
3190  0675               L215:
3191  0675 bf27          	ldw	_Timer+6,x
3192                     ; 794 					Drive.Step = 0;
3194  0677 3f7d          	clr	_Drive+22
3196  0679               L3511:
3197                     ; 803 		if( Pwm.Calc == 1 )
3199  0679 b65e          	ld	a,_Pwm+7
3200  067b a101          	cp	a,#1
3201  067d 2643          	jrne	L3611
3202                     ; 805 			Pwm.Calc = 0;
3204  067f 3f5e          	clr	_Pwm+7
3205                     ; 806 			_t1 = Pwm.T1;
3207  0681 be5f          	ldw	x,_Pwm+8
3208  0683 1f0e          	ldw	(OFST-3,sp),x
3210                     ; 807 			_t2 = Pwm.T2;
3212  0685 be61          	ldw	x,_Pwm+10
3213  0687 1f0a          	ldw	(OFST-7,sp),x
3215                     ; 808 			dt = 10000. * _t1 / (_t1 + _t2);
3217  0689 1e0e          	ldw	x,(OFST-3,sp)
3218  068b 72fb0a        	addw	x,(OFST-7,sp)
3219  068e cd0000        	call	c_uitof
3221  0691 96            	ldw	x,sp
3222  0692 5c            	incw	x
3223  0693 cd0000        	call	c_rtol
3226  0696 1e0e          	ldw	x,(OFST-3,sp)
3227  0698 cd0000        	call	c_uitof
3229  069b ae0000        	ldw	x,#L1711
3230  069e cd0000        	call	c_fmul
3232  06a1 96            	ldw	x,sp
3233  06a2 5c            	incw	x
3234  06a3 cd0000        	call	c_fdiv
3236  06a6 96            	ldw	x,sp
3237  06a7 1c0006        	addw	x,#OFST-11
3238  06aa cd0000        	call	c_rtol
3241                     ; 809 			Pwm.Duty = (uint16_t)dt;
3243  06ad 96            	ldw	x,sp
3244  06ae 1c0006        	addw	x,#OFST-11
3245  06b1 cd0000        	call	c_ltor
3247  06b4 cd0000        	call	c_ftoi
3249  06b7 bf63          	ldw	_Pwm+12,x
3250                     ; 812 			Drive.Step = stepCalc(Pwm.Duty);
3252  06b9 cd012b        	call	_stepCalc
3254  06bc b77d          	ld	_Drive+22,a
3255                     ; 814 			Timer.PwmUpdate = Ticks_1mS;		
3257  06be be81          	ldw	x,_Ticks_1mS
3258  06c0 bf27          	ldw	_Timer+6,x
3259  06c2               L3611:
3260                     ; 816 		if( _tt != tt )
3262  06c2 1e0c          	ldw	x,(OFST-5,sp)
3263  06c4 1310          	cpw	x,(OFST-1,sp)
3264  06c6 2704          	jreq	L5711
3265                     ; 818 			_tt = tt;
3267  06c8 1e10          	ldw	x,(OFST-1,sp)
3268  06ca 1f0c          	ldw	(OFST-5,sp),x
3270  06cc               L5711:
3271                     ; 820 		motorGo();
3273  06cc cd0575        	call	_motorGo
3276  06cf cc0631        	jra	L5411
3320                     ; 825 void assert_failed(u8* file, u32 line) { u8 i; while (1) i++; }
3321                     	switch	.text
3322  06d2               _assert_failed:
3324  06d2 88            	push	a
3325       00000001      OFST:	set	1
3328  06d3               L1221:
3331  06d3 0c01          	inc	(OFST+0,sp)
3334  06d5 20fc          	jra	L1221
4173                     	xdef	_main
4174                     	xdef	_motorGo
4175                     	xdef	_mainDeviceType
4176                     	xdef	_Timer_Config
4177                     	xdef	_OnCaptureTim2
4178                     	xdef	_OnCaptureOVTim2
4179                     	xdef	_OnTimer4
4180                     	xdef	_AdcService
4181                     	xdef	_AdcGetAvg
4182                     	xdef	_Adc_Config
4183                     	xdef	_AdcGetCode
4184                     	xdef	__chanId
4185                     	xdef	__chanSchmit
4186                     	xdef	__chan
4187                     	xdef	_OnTimer_1S
4188                     	xdef	_Gpio_Config
4189                     	xdef	_Gpio_CheckMode
4190                     	xdef	_Clock_Config
4191                     	xdef	_factory
4192                     	xdef	_MotorStepSetOverrun
4193                     	xdef	_MotorStepPhase
4194                     	xdef	_DriveService
4195                     	xdef	_MotorClose
4196                     	xdef	_MotorStep
4197                     	xdef	_StopDrive
4198                     	xdef	_MotorService
4199                     	xdef	_LightControl
4200                     	xdef	_ZeroPos
4201                     	xdef	_StartDriveOR
4202                     	xdef	_waitPowerDelay
4203                     	xdef	_stepCalc
4204                     	xdef	_stepPrepare
4205                     	xdef	_Diff
4206                     	xdef	_CPulse
4207                     	xdef	_phase_excite
4208                     	xdef	_IO_CHARGE
4209                     	xdef	_IO_BOOST
4210                     	xdef	_IO_BAT
4211                     	xdef	_IO_MOD
4212                     	xdef	_IO_POWER
4213                     	xdef	_IO_SEN
4214                     	xdef	_IO_ADJ
4215                     	xdef	_IO_Y2
4216                     	xdef	_IO_Y1
4217                     	xdef	_IO_X2
4218                     	xdef	_IO_X1
4219                     	xdef	_IO_ORG
4220                     	xdef	_IO_LED
4221                     	switch	.ubsct
4222  0000               _motorWatch:
4223  0000 000000000000  	ds.b	33
4224                     	xdef	_motorWatch
4225  0021               _Timer:
4226  0021 000000000000  	ds.b	8
4227                     	xdef	_Timer
4228  0029               _Adc:
4229  0029 000000000000  	ds.b	46
4230                     	xdef	_Adc
4231  0057               _Pwm:
4232  0057 000000000000  	ds.b	16
4233                     	xdef	_Pwm
4234  0067               _Drive:
4235  0067 000000000000  	ds.b	26
4236                     	xdef	_Drive
4237                     	xdef	_ledint
4238  0081               _Ticks_1mS:
4239  0081 0000          	ds.b	2
4240                     	xdef	_Ticks_1mS
4241  0083               _Ticks_50uS:
4242  0083 00            	ds.b	1
4243                     	xdef	_Ticks_50uS
4244  0084               _dutyInfo:
4245  0084 000000000000  	ds.b	44
4246                     	xdef	_dutyInfo
4247                     	xdef	_assert_failed
4248                     	xref	_TIM4_ClearITPendingBit
4249                     	xref	_TIM4_ClearFlag
4250                     	xref	_TIM4_ITConfig
4251                     	xref	_TIM4_Cmd
4252                     	xref	_TIM4_TimeBaseInit
4253                     	xref	_TIM2_ClearITPendingBit
4254                     	xref	_TIM2_GetITStatus
4255                     	xref	_TIM2_GetCapture1
4256                     	xref	_TIM2_SetCounter
4257                     	xref	_TIM2_ITConfig
4258                     	xref	_TIM2_Cmd
4259                     	xref	_TIM2_ICInit
4260                     	xref	_TIM2_TimeBaseInit
4261                     	xref	_GPIO_ReadInputPin
4262                     	xref	_GPIO_WriteReverse
4263                     	xref	_GPIO_WriteLow
4264                     	xref	_GPIO_WriteHigh
4265                     	xref	_GPIO_Init
4266                     	xref	_CLK_SYSCLKConfig
4267                     	xref	_CLK_HSICmd
4268                     	xref	_ADC1_GetConversionValue
4269                     	xref	_ADC1_StartConversion
4270                     	xref	_ADC1_Init
4271                     	xref	_ADC1_DeInit
4272                     .const:	section	.text
4273  0000               L1711:
4274  0000 461c4000      	dc.w	17948,16384
4275                     	xref.b	c_x
4295                     	xref	c_ftoi
4296                     	xref	c_ltor
4297                     	xref	c_fdiv
4298                     	xref	c_rtol
4299                     	xref	c_fmul
4300                     	xref	c_uitof
4301                     	xref	c_smodx
4302                     	xref	c_imul
4303                     	end
