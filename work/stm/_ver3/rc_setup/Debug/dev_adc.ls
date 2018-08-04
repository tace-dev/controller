   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     .const:	section	.text
  20  0000               _adcTbl:
  21  0000 0b92          	dc.w	2962
  22  0002 0b74          	dc.w	2932
  23  0004 0b4e          	dc.w	2894
  24  0006 0b29          	dc.w	2857
  25  0008 0b02          	dc.w	2818
  26  000a 0adb          	dc.w	2779
  27  000c 0ab4          	dc.w	2740
  28  000e 0a8c          	dc.w	2700
  29  0010 0a65          	dc.w	2661
  30  0012 0a3c          	dc.w	2620
  31  0014 0a14          	dc.w	2580
  32  0016 09ec          	dc.w	2540
  33  0018 09c3          	dc.w	2499
  34  001a 099a          	dc.w	2458
  35  001c 0970          	dc.w	2416
  36  001e 0947          	dc.w	2375
  37  0020 091f          	dc.w	2335
  38  0022 08f5          	dc.w	2293
  39  0024 08cc          	dc.w	2252
  40  0026 08a2          	dc.w	2210
  41  0028 087a          	dc.w	2170
  42  002a 0851          	dc.w	2129
  43  002c 0829          	dc.w	2089
  44  002e 0800          	dc.w	2048
  45  0030 07d8          	dc.w	2008
  46  0032 07b0          	dc.w	1968
  47  0034 0788          	dc.w	1928
  48  0036 0760          	dc.w	1888
  49  0038 073a          	dc.w	1850
  50  003a 0713          	dc.w	1811
  51  003c 06ec          	dc.w	1772
  52  003e 06c6          	dc.w	1734
  53  0040 06a1          	dc.w	1697
  54  0042 067c          	dc.w	1660
  55  0044 0657          	dc.w	1623
  56  0046 0633          	dc.w	1587
  57  0048 060f          	dc.w	1551
  58  004a 05ec          	dc.w	1516
  59  004c 05c9          	dc.w	1481
  60  004e 05a8          	dc.w	1448
  61  0050 0587          	dc.w	1415
  62  0052 0564          	dc.w	1380
  63                     	switch	.data
  64  0000               __adci:
  65  0000 00            	dc.b	0
 136                     ; 60 uint16_t	_adcGet(void)
 136                     ; 61 {
 138                     .text:	section	.text,new
 139  0000               __adcGet:
 141  0000 5206          	subw	sp,#6
 142       00000006      OFST:	set	6
 145                     ; 149 	_ADC_GET(i16);
 147  0002 ae5340        	ldw	x,#21312
 148  0005 cd0000        	call	_ADC_SoftwareStartConv
 151  0008               L73:
 154  0008 4b01          	push	#1
 155  000a ae5340        	ldw	x,#21312
 156  000d cd0000        	call	_ADC_GetFlagStatus
 158  0010 5b01          	addw	sp,#1
 159  0012 4d            	tnz	a
 160  0013 27f3          	jreq	L73
 163  0015 ae5340        	ldw	x,#21312
 164  0018 cd0000        	call	_ADC_GetConversionValue
 166  001b 1f02          	ldw	(OFST-4,sp),x
 167                     ; 150 	_adci++;
 170  001d 725c0000      	inc	__adci
 171                     ; 151 	if( _adci == 12 )
 173  0021 c60000        	ld	a,__adci
 174  0024 a10c          	cp	a,#12
 175  0026 2604          	jrne	L34
 176                     ; 152 		_adci = 0;
 178  0028 725f0000      	clr	__adci
 179  002c               L34:
 180                     ; 153 	_adcBuf[_adci] = i16; 
 182  002c c60000        	ld	a,__adci
 183  002f 5f            	clrw	x
 184  0030 97            	ld	xl,a
 185  0031 58            	sllw	x
 186  0032 1602          	ldw	y,(OFST-4,sp)
 187  0034 df000e        	ldw	(__adcBuf,x),y
 188                     ; 155 	k = min = max = 0;
 190  0037 0f05          	clr	(OFST-1,sp)
 191  0039 0f04          	clr	(OFST-2,sp)
 192  003b 0f01          	clr	(OFST-5,sp)
 193                     ; 156 	for( i=1; i<12; i++ )
 195  003d a601          	ld	a,#1
 196  003f 6b06          	ld	(OFST+0,sp),a
 197  0041               L54:
 198                     ; 158 		if( _adcBuf[i] < _adcBuf[min] )
 200  0041 7b06          	ld	a,(OFST+0,sp)
 201  0043 5f            	clrw	x
 202  0044 97            	ld	xl,a
 203  0045 58            	sllw	x
 204  0046 7b04          	ld	a,(OFST-2,sp)
 205  0048 905f          	clrw	y
 206  004a 9097          	ld	yl,a
 207  004c 9058          	sllw	y
 208  004e de000e        	ldw	x,(__adcBuf,x)
 209  0051 90d3000e      	cpw	x,(__adcBuf,y)
 210  0055 2404          	jruge	L35
 211                     ; 159 			min = i;
 213  0057 7b06          	ld	a,(OFST+0,sp)
 214  0059 6b04          	ld	(OFST-2,sp),a
 215  005b               L35:
 216                     ; 160 		if( _adcBuf[i] > _adcBuf[max] )
 218  005b 7b06          	ld	a,(OFST+0,sp)
 219  005d 5f            	clrw	x
 220  005e 97            	ld	xl,a
 221  005f 58            	sllw	x
 222  0060 7b05          	ld	a,(OFST-1,sp)
 223  0062 905f          	clrw	y
 224  0064 9097          	ld	yl,a
 225  0066 9058          	sllw	y
 226  0068 de000e        	ldw	x,(__adcBuf,x)
 227  006b 90d3000e      	cpw	x,(__adcBuf,y)
 228  006f 2304          	jrule	L55
 229                     ; 161 			max = i;
 231  0071 7b06          	ld	a,(OFST+0,sp)
 232  0073 6b05          	ld	(OFST-1,sp),a
 233  0075               L55:
 234                     ; 156 	for( i=1; i<12; i++ )
 236  0075 0c06          	inc	(OFST+0,sp)
 239  0077 7b06          	ld	a,(OFST+0,sp)
 240  0079 a10c          	cp	a,#12
 241  007b 25c4          	jrult	L54
 242                     ; 163 	i16 = 0;
 244  007d 5f            	clrw	x
 245  007e 1f02          	ldw	(OFST-4,sp),x
 246                     ; 164 	for( i=0; i<12; i++ )
 248  0080 0f06          	clr	(OFST+0,sp)
 249  0082               L75:
 250                     ; 166 		if( i==min || i==max )
 252  0082 7b06          	ld	a,(OFST+0,sp)
 253  0084 1104          	cp	a,(OFST-2,sp)
 254  0086 2715          	jreq	L16
 256  0088 7b06          	ld	a,(OFST+0,sp)
 257  008a 1105          	cp	a,(OFST-1,sp)
 258  008c 270f          	jreq	L16
 259                     ; 168 		i16 += _adcBuf[i];
 261  008e 7b06          	ld	a,(OFST+0,sp)
 262  0090 5f            	clrw	x
 263  0091 97            	ld	xl,a
 264  0092 58            	sllw	x
 265  0093 de000e        	ldw	x,(__adcBuf,x)
 266  0096 72fb02        	addw	x,(OFST-4,sp)
 267  0099 1f02          	ldw	(OFST-4,sp),x
 268                     ; 169 		k++;
 270  009b 0c01          	inc	(OFST-5,sp)
 271  009d               L16:
 272                     ; 164 	for( i=0; i<12; i++ )
 274  009d 0c06          	inc	(OFST+0,sp)
 277  009f 7b06          	ld	a,(OFST+0,sp)
 278  00a1 a10c          	cp	a,#12
 279  00a3 25dd          	jrult	L75
 280                     ; 171 	i16 = i16/k;
 282  00a5 1e02          	ldw	x,(OFST-4,sp)
 283  00a7 7b01          	ld	a,(OFST-5,sp)
 284  00a9 62            	div	x,a
 285  00aa 1f02          	ldw	(OFST-4,sp),x
 286                     ; 172 	return i16;
 288  00ac 1e02          	ldw	x,(OFST-4,sp)
 291  00ae 5b06          	addw	sp,#6
 292  00b0 81            	ret
 295                     	switch	.data
 296  0001               __addi:
 297  0001 00            	dc.b	0
 366                     ; 182 uint8_t	adcGet(uint8_t mode)
 366                     ; 183 {
 367                     .text:	section	.text,new
 368  0000               _adcGet:
 370  0000 88            	push	a
 371  0001 5206          	subw	sp,#6
 372       00000006      OFST:	set	6
 375                     ; 188 	i16 = _adcGet();
 377  0003 cd0000        	call	__adcGet
 379  0006 1f03          	ldw	(OFST-3,sp),x
 380                     ; 190 	if( i16 > 2932 )
 382  0008 1e03          	ldw	x,(OFST-3,sp)
 383  000a a30b75        	cpw	x,#2933
 384  000d 2505          	jrult	L121
 385                     ; 191 		i16 = 2932;
 387  000f ae0b74        	ldw	x,#2932
 388  0012 1f03          	ldw	(OFST-3,sp),x
 389  0014               L121:
 390                     ; 192 	for( i=0; i<42; i++ )
 392  0014 0f06          	clr	(OFST+0,sp)
 393  0016               L321:
 394                     ; 194 		if( i16 >= adcTbl[i] )
 396  0016 7b06          	ld	a,(OFST+0,sp)
 397  0018 5f            	clrw	x
 398  0019 97            	ld	xl,a
 399  001a 58            	sllw	x
 400  001b 9093          	ldw	y,x
 401  001d 51            	exgw	x,y
 402  001e de0000        	ldw	x,(_adcTbl,x)
 403  0021 1303          	cpw	x,(OFST-3,sp)
 404  0023 51            	exgw	x,y
 405  0024 2303cc00aa    	jrugt	L131
 406                     ; 196 			if( i==0 )
 408  0029 0d06          	tnz	(OFST+0,sp)
 409  002b 260a          	jrne	L331
 410                     ; 198 				i = (i+2) * 2;
 412  002d 7b06          	ld	a,(OFST+0,sp)
 413  002f 48            	sll	a
 414  0030 ab04          	add	a,#4
 415  0032 6b06          	ld	(OFST+0,sp),a
 416                     ; 199 				goto Exit;
 418  0034 cc00bc        	jra	L17
 419  0037               L331:
 420                     ; 202 			m = adcTbl[i-1] - adcTbl[i];
 422  0037 7b06          	ld	a,(OFST+0,sp)
 423  0039 5f            	clrw	x
 424  003a 97            	ld	xl,a
 425  003b 58            	sllw	x
 426  003c 5a            	decw	x
 427  003d 5a            	decw	x
 428  003e 7b06          	ld	a,(OFST+0,sp)
 429  0040 905f          	clrw	y
 430  0042 9097          	ld	yl,a
 431  0044 9058          	sllw	y
 432  0046 90d60001      	ld	a,(_adcTbl+1,y)
 433  004a d00001        	sub	a,(_adcTbl+1,x)
 434  004d 40            	neg	a
 435  004e 6b05          	ld	(OFST-1,sp),a
 436                     ; 203 			m = m/4;
 438  0050 7b05          	ld	a,(OFST-1,sp)
 439  0052 5f            	clrw	x
 440  0053 97            	ld	xl,a
 441  0054 57            	sraw	x
 442  0055 57            	sraw	x
 443  0056 01            	rrwa	x,a
 444  0057 6b05          	ld	(OFST-1,sp),a
 445  0059 02            	rlwa	x,a
 446                     ; 204 			j = adcTbl[i-1] - i16;
 448  005a 7b06          	ld	a,(OFST+0,sp)
 449  005c 5f            	clrw	x
 450  005d 97            	ld	xl,a
 451  005e 58            	sllw	x
 452  005f 5a            	decw	x
 453  0060 5a            	decw	x
 454  0061 d60001        	ld	a,(_adcTbl+1,x)
 455  0064 1004          	sub	a,(OFST-2,sp)
 456  0066 6b02          	ld	(OFST-4,sp),a
 457                     ; 205 			k = adcTbl[i] - i16;
 459  0068 7b06          	ld	a,(OFST+0,sp)
 460  006a 5f            	clrw	x
 461  006b 97            	ld	xl,a
 462  006c 58            	sllw	x
 463  006d d60001        	ld	a,(_adcTbl+1,x)
 464  0070 1004          	sub	a,(OFST-2,sp)
 465  0072 6b01          	ld	(OFST-5,sp),a
 466                     ; 206 			if( j > k )
 468  0074 7b02          	ld	a,(OFST-4,sp)
 469  0076 1101          	cp	a,(OFST-5,sp)
 470  0078 2318          	jrule	L531
 471                     ; 209 				if( m > k )
 473  007a 7b05          	ld	a,(OFST-1,sp)
 474  007c 1101          	cp	a,(OFST-5,sp)
 475  007e 2309          	jrule	L731
 476                     ; 211 					i = (i+2) * 2;
 478  0080 7b06          	ld	a,(OFST+0,sp)
 479  0082 48            	sll	a
 480  0083 ab04          	add	a,#4
 481  0085 6b06          	ld	(OFST+0,sp),a
 482                     ; 212 					goto Exit;
 484  0087 2033          	jra	L17
 485  0089               L731:
 486                     ; 214 				i = (i+2-1) * 2 + 1;
 488  0089 7b06          	ld	a,(OFST+0,sp)
 489  008b 48            	sll	a
 490  008c ab03          	add	a,#3
 491  008e 6b06          	ld	(OFST+0,sp),a
 492                     ; 215 				goto Exit;
 494  0090 202a          	jra	L17
 495  0092               L531:
 496                     ; 220 				if( m  > j )
 498  0092 7b05          	ld	a,(OFST-1,sp)
 499  0094 1102          	cp	a,(OFST-4,sp)
 500  0096 2309          	jrule	L341
 501                     ; 222 					i = (i+2-1) * 2;
 503  0098 7b06          	ld	a,(OFST+0,sp)
 504  009a 48            	sll	a
 505  009b ab02          	add	a,#2
 506  009d 6b06          	ld	(OFST+0,sp),a
 507                     ; 223 					goto Exit;
 509  009f 201b          	jra	L17
 510  00a1               L341:
 511                     ; 225 				i = (i+2-1) * 2 + 1;
 513  00a1 7b06          	ld	a,(OFST+0,sp)
 514  00a3 48            	sll	a
 515  00a4 ab03          	add	a,#3
 516  00a6 6b06          	ld	(OFST+0,sp),a
 517                     ; 226 				goto Exit;
 519  00a8 2012          	jra	L17
 520  00aa               L131:
 521                     ; 192 	for( i=0; i<42; i++ )
 523  00aa 0c06          	inc	(OFST+0,sp)
 526  00ac 7b06          	ld	a,(OFST+0,sp)
 527  00ae a12a          	cp	a,#42
 528  00b0 2403          	jruge	L41
 529  00b2 cc0016        	jp	L321
 530  00b5               L41:
 531                     ; 230 	i = (i+2) * 2;
 533  00b5 7b06          	ld	a,(OFST+0,sp)
 534  00b7 48            	sll	a
 535  00b8 ab04          	add	a,#4
 536  00ba 6b06          	ld	(OFST+0,sp),a
 537  00bc               L17:
 538                     ; 231 Exit:	
 538                     ; 232 	if( mode == 1 )
 540  00bc 7b07          	ld	a,(OFST+1,sp)
 541  00be a101          	cp	a,#1
 542  00c0 2606          	jrne	L541
 543                     ; 233 		return i;
 545  00c2 7b06          	ld	a,(OFST+0,sp)
 547  00c4 ac560156      	jpf	L21
 548  00c8               L541:
 549                     ; 235 	_add[_addi++] = i;
 551  00c8 c60001        	ld	a,__addi
 552  00cb 97            	ld	xl,a
 553  00cc 725c0001      	inc	__addi
 554  00d0 9f            	ld	a,xl
 555  00d1 5f            	clrw	x
 556  00d2 97            	ld	xl,a
 557  00d3 7b06          	ld	a,(OFST+0,sp)
 558  00d5 d70000        	ld	(__add,x),a
 559                     ; 236 	if( _addi == 12 )
 561  00d8 c60001        	ld	a,__addi
 562  00db a10c          	cp	a,#12
 563  00dd 2604          	jrne	L741
 564                     ; 237 		_addi = 0;
 566  00df 725f0001      	clr	__addi
 567  00e3               L741:
 568                     ; 239 	j = 0;	//	min
 570  00e3 0f02          	clr	(OFST-4,sp)
 571                     ; 240 	m = 0;	//	max
 573  00e5 0f05          	clr	(OFST-1,sp)
 574                     ; 241 	for( i=1; i<12; i++ )
 576  00e7 a601          	ld	a,#1
 577  00e9 6b06          	ld	(OFST+0,sp),a
 578  00eb               L151:
 579                     ; 243 		if( _add[i] < _add[j] )
 581  00eb 7b02          	ld	a,(OFST-4,sp)
 582  00ed 5f            	clrw	x
 583  00ee 97            	ld	xl,a
 584  00ef 7b06          	ld	a,(OFST+0,sp)
 585  00f1 905f          	clrw	y
 586  00f3 9097          	ld	yl,a
 587  00f5 90d60000      	ld	a,(__add,y)
 588  00f9 d10000        	cp	a,(__add,x)
 589  00fc 2404          	jruge	L751
 590                     ; 244 			j = i;
 592  00fe 7b06          	ld	a,(OFST+0,sp)
 593  0100 6b02          	ld	(OFST-4,sp),a
 594  0102               L751:
 595                     ; 245 		if( _add[i] > _add[m] )
 597  0102 7b05          	ld	a,(OFST-1,sp)
 598  0104 5f            	clrw	x
 599  0105 97            	ld	xl,a
 600  0106 7b06          	ld	a,(OFST+0,sp)
 601  0108 905f          	clrw	y
 602  010a 9097          	ld	yl,a
 603  010c 90d60000      	ld	a,(__add,y)
 604  0110 d10000        	cp	a,(__add,x)
 605  0113 2304          	jrule	L161
 606                     ; 246 			m = i;
 608  0115 7b06          	ld	a,(OFST+0,sp)
 609  0117 6b05          	ld	(OFST-1,sp),a
 610  0119               L161:
 611                     ; 241 	for( i=1; i<12; i++ )
 613  0119 0c06          	inc	(OFST+0,sp)
 616  011b 7b06          	ld	a,(OFST+0,sp)
 617  011d a10c          	cp	a,#12
 618  011f 25ca          	jrult	L151
 619                     ; 248 	k = 0;
 621  0121 0f01          	clr	(OFST-5,sp)
 622                     ; 249 	i16 = 0;
 624  0123 5f            	clrw	x
 625  0124 1f03          	ldw	(OFST-3,sp),x
 626                     ; 250 	for( i=0; i<12; i++ )
 628  0126 0f06          	clr	(OFST+0,sp)
 629  0128               L361:
 630                     ; 252 		if( i==j || i==m )
 632  0128 7b06          	ld	a,(OFST+0,sp)
 633  012a 1102          	cp	a,(OFST-4,sp)
 634  012c 2717          	jreq	L561
 636  012e 7b06          	ld	a,(OFST+0,sp)
 637  0130 1105          	cp	a,(OFST-1,sp)
 638  0132 2711          	jreq	L561
 639                     ; 254 		i16 += _add[i];
 641  0134 7b06          	ld	a,(OFST+0,sp)
 642  0136 5f            	clrw	x
 643  0137 97            	ld	xl,a
 644  0138 d60000        	ld	a,(__add,x)
 645  013b 1b04          	add	a,(OFST-2,sp)
 646  013d 6b04          	ld	(OFST-2,sp),a
 647  013f 2402          	jrnc	L01
 648  0141 0c03          	inc	(OFST-3,sp)
 649  0143               L01:
 650                     ; 255 		k++;
 652  0143 0c01          	inc	(OFST-5,sp)
 653  0145               L561:
 654                     ; 250 	for( i=0; i<12; i++ )
 656  0145 0c06          	inc	(OFST+0,sp)
 659  0147 7b06          	ld	a,(OFST+0,sp)
 660  0149 a10c          	cp	a,#12
 661  014b 25db          	jrult	L361
 662                     ; 257 	i16 = i16/k;
 664  014d 1e03          	ldw	x,(OFST-3,sp)
 665  014f 7b01          	ld	a,(OFST-5,sp)
 666  0151 62            	div	x,a
 667  0152 1f03          	ldw	(OFST-3,sp),x
 668                     ; 262 	return i16;
 670  0154 7b04          	ld	a,(OFST-2,sp)
 672  0156               L21:
 674  0156 5b07          	addw	sp,#7
 675  0158 81            	ret
 703                     ; 265 void	systemADC(void)
 703                     ; 266 {
 704                     .text:	section	.text,new
 705  0000               _systemADC:
 709                     ; 269 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 711  0000 ae1001        	ldw	x,#4097
 712  0003 cd0000        	call	_CLK_PeripheralClockConfig
 714                     ; 287 	ADC_Init(
 714                     ; 288 		ADC1, 
 714                     ; 289 		ADC_ConversionMode_Continuous, 
 714                     ; 290 		ADC_Resolution_12Bit, 
 714                     ; 291 		ADC_Prescaler_2
 714                     ; 292 		);
 716  0006 4b80          	push	#128
 717  0008 4b00          	push	#0
 718  000a 4b04          	push	#4
 719  000c ae5340        	ldw	x,#21312
 720  000f cd0000        	call	_ADC_Init
 722  0012 5b03          	addw	sp,#3
 723                     ; 293 	ADC_SamplingTimeConfig(
 723                     ; 294 		ADC1, 
 723                     ; 295 		ADC_Group_SlowChannels, 
 723                     ; 296 		ADC_SamplingTime_384Cycles
 723                     ; 297 		);
 725  0014 4b07          	push	#7
 726  0016 4b00          	push	#0
 727  0018 ae5340        	ldw	x,#21312
 728  001b cd0000        	call	_ADC_SamplingTimeConfig
 730  001e 85            	popw	x
 731                     ; 300 	ADC_Cmd(ADC1, ENABLE);
 733  001f 4b01          	push	#1
 734  0021 ae5340        	ldw	x,#21312
 735  0024 cd0000        	call	_ADC_Cmd
 737  0027 84            	pop	a
 738                     ; 303 	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
 740  0028 4b01          	push	#1
 741  002a ae0308        	ldw	x,#776
 742  002d 89            	pushw	x
 743  002e ae5340        	ldw	x,#21312
 744  0031 cd0000        	call	_ADC_ChannelCmd
 746  0034 5b03          	addw	sp,#3
 747                     ; 320 }
 750  0036 81            	ret
 820                     	xdef	__addi
 821                     	switch	.bss
 822  0000               __add:
 823  0000 000000000000  	ds.b	12
 824                     	xdef	__add
 825                     	xdef	__adcGet
 826  000c               ___di:
 827  000c 0000          	ds.b	2
 828                     	xdef	___di
 829                     	xdef	__adci
 830  000e               __adcBuf:
 831  000e 000000000000  	ds.b	24
 832                     	xdef	__adcBuf
 833                     	xdef	_adcTbl
 834                     	xdef	_adcGet
 835                     	xdef	_systemADC
 836                     	xref	_CLK_PeripheralClockConfig
 837                     	xref	_ADC_GetFlagStatus
 838                     	xref	_ADC_GetConversionValue
 839                     	xref	_ADC_SamplingTimeConfig
 840                     	xref	_ADC_ChannelCmd
 841                     	xref	_ADC_SoftwareStartConv
 842                     	xref	_ADC_Cmd
 843                     	xref	_ADC_Init
 863                     	end
