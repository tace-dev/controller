   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     .const:	section	.text
  23  0000               _adcTbl:
  24  0000 0b92          	dc.w	2962
  25  0002 0b74          	dc.w	2932
  26  0004 0b4e          	dc.w	2894
  27  0006 0b29          	dc.w	2857
  28  0008 0b02          	dc.w	2818
  29  000a 0adb          	dc.w	2779
  30  000c 0ab4          	dc.w	2740
  31  000e 0a8c          	dc.w	2700
  32  0010 0a65          	dc.w	2661
  33  0012 0a3c          	dc.w	2620
  34  0014 0a14          	dc.w	2580
  35  0016 09ec          	dc.w	2540
  36  0018 09c3          	dc.w	2499
  37  001a 099a          	dc.w	2458
  38  001c 0970          	dc.w	2416
  39  001e 0947          	dc.w	2375
  40  0020 091f          	dc.w	2335
  41  0022 08f5          	dc.w	2293
  42  0024 08cc          	dc.w	2252
  43  0026 08a2          	dc.w	2210
  44  0028 087a          	dc.w	2170
  45  002a 0851          	dc.w	2129
  46  002c 0829          	dc.w	2089
  47  002e 0800          	dc.w	2048
  48  0030 07d8          	dc.w	2008
  49  0032 07b0          	dc.w	1968
  50  0034 0788          	dc.w	1928
  51  0036 0760          	dc.w	1888
  52  0038 073a          	dc.w	1850
  53  003a 0713          	dc.w	1811
  54  003c 06ec          	dc.w	1772
  55  003e 06c6          	dc.w	1734
  56  0040 06a1          	dc.w	1697
  57  0042 067c          	dc.w	1660
  58  0044 0657          	dc.w	1623
  59  0046 0633          	dc.w	1587
  60  0048 060f          	dc.w	1551
  61  004a 05ec          	dc.w	1516
  62  004c 05c9          	dc.w	1481
  63  004e 05a8          	dc.w	1448
  64  0050 0587          	dc.w	1415
  65  0052 0564          	dc.w	1380
  66                     	switch	.data
  67  0000               __dwi16:
  68  0000 0000          	dc.w	0
  69  0002               __adci:
  70  0002 00            	dc.b	0
 153                     ; 60 uint16_t	_adcGet(void)
 153                     ; 61 {
 155                     .text:	section	.text,new
 156  0000               __adcGet:
 158  0000 520a          	subw	sp,#10
 159       0000000a      OFST:	set	10
 162                     ; 69 	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
 164  0002 4b01          	push	#1
 165  0004 ae0308        	ldw	x,#776
 166  0007 89            	pushw	x
 167  0008 ae5340        	ldw	x,#21312
 168  000b cd0000        	call	_ADC_ChannelCmd
 170  000e 5b03          	addw	sp,#3
 171                     ; 70 	_ADC_GET(i16);
 173  0010 ae5340        	ldw	x,#21312
 174  0013 cd0000        	call	_ADC_SoftwareStartConv
 177  0016               L14:
 180  0016 cd01ef        	call	LC003
 181  0019 27fb          	jreq	L14
 184  001b ae5340        	ldw	x,#21312
 185  001e cd0000        	call	_ADC_GetConversionValue
 187  0021 1f06          	ldw	(OFST-4,sp),x
 188                     ; 71 	ADC_ChannelCmd(ADC1, ADC_Channel_3, DISABLE);
 191  0023 4b00          	push	#0
 192  0025 ae0308        	ldw	x,#776
 193  0028 89            	pushw	x
 194  0029 ae5340        	ldw	x,#21312
 195  002c cd0000        	call	_ADC_ChannelCmd
 197  002f 5b03          	addw	sp,#3
 198                     ; 72 	_adcBuf[_adci] = i16; 
 200  0031 c60002        	ld	a,__adci
 201  0034 5f            	clrw	x
 202  0035 97            	ld	xl,a
 203  0036 58            	sllw	x
 204  0037 1606          	ldw	y,(OFST-4,sp)
 205  0039 df000e        	ldw	(__adcBuf,x),y
 206                     ; 74 	k = min = max = 0;
 208  003c 0f09          	clr	(OFST-1,sp)
 209  003e 0f08          	clr	(OFST-2,sp)
 210  0040 0f05          	clr	(OFST-5,sp)
 211                     ; 75 	for( i=1; i<12; i++ )
 213  0042 a601          	ld	a,#1
 214  0044 6b0a          	ld	(OFST+0,sp),a
 215  0046               L54:
 216                     ; 77 		if( _adcBuf[i] < _adcBuf[min] )
 218  0046 5f            	clrw	x
 219  0047 97            	ld	xl,a
 220  0048 58            	sllw	x
 221  0049 7b08          	ld	a,(OFST-2,sp)
 222  004b cd01e8        	call	LC002
 223  004e de000e        	ldw	x,(__adcBuf,x)
 224  0051 90d3000e      	cpw	x,(__adcBuf,y)
 225  0055 2404          	jruge	L35
 226                     ; 78 			min = i;
 228  0057 7b0a          	ld	a,(OFST+0,sp)
 229  0059 6b08          	ld	(OFST-2,sp),a
 230  005b               L35:
 231                     ; 79 		if( _adcBuf[i] > _adcBuf[max] )
 233  005b 7b0a          	ld	a,(OFST+0,sp)
 234  005d 5f            	clrw	x
 235  005e 97            	ld	xl,a
 236  005f 58            	sllw	x
 237  0060 7b09          	ld	a,(OFST-1,sp)
 238  0062 cd01e8        	call	LC002
 239  0065 de000e        	ldw	x,(__adcBuf,x)
 240  0068 90d3000e      	cpw	x,(__adcBuf,y)
 241  006c 2304          	jrule	L55
 242                     ; 80 			max = i;
 244  006e 7b0a          	ld	a,(OFST+0,sp)
 245  0070 6b09          	ld	(OFST-1,sp),a
 246  0072               L55:
 247                     ; 75 	for( i=1; i<12; i++ )
 249  0072 0c0a          	inc	(OFST+0,sp)
 252  0074 7b0a          	ld	a,(OFST+0,sp)
 253  0076 a10c          	cp	a,#12
 254  0078 25cc          	jrult	L54
 255                     ; 82 	i16 = 0;
 257  007a 5f            	clrw	x
 258  007b 1f06          	ldw	(OFST-4,sp),x
 259                     ; 83 	for( i=0; i<12; i++ )
 261  007d 4f            	clr	a
 262  007e 6b0a          	ld	(OFST+0,sp),a
 263  0080               L75:
 264                     ; 85 		if( i==min || i==max )
 266  0080 1108          	cp	a,(OFST-2,sp)
 267  0082 2711          	jreq	L16
 269  0084 1109          	cp	a,(OFST-1,sp)
 270  0086 270d          	jreq	L16
 271                     ; 87 		i16 += _adcBuf[i];
 273  0088 5f            	clrw	x
 274  0089 97            	ld	xl,a
 275  008a 58            	sllw	x
 276  008b de000e        	ldw	x,(__adcBuf,x)
 277  008e 72fb06        	addw	x,(OFST-4,sp)
 278  0091 1f06          	ldw	(OFST-4,sp),x
 279                     ; 88 		k++;
 281  0093 0c05          	inc	(OFST-5,sp)
 282  0095               L16:
 283                     ; 83 	for( i=0; i<12; i++ )
 285  0095 0c0a          	inc	(OFST+0,sp)
 288  0097 7b0a          	ld	a,(OFST+0,sp)
 289  0099 a10c          	cp	a,#12
 290  009b 25e3          	jrult	L75
 291                     ; 90 	i16 = i16/k;
 293  009d 7b05          	ld	a,(OFST-5,sp)
 294  009f 62            	div	x,a
 295  00a0 1f06          	ldw	(OFST-4,sp),x
 296                     ; 92 	ADC_ChannelCmd(ADC1, ADC_Channel_20, ENABLE);
 298  00a2 4b01          	push	#1
 299  00a4 ae0110        	ldw	x,#272
 300  00a7 89            	pushw	x
 301  00a8 ae5340        	ldw	x,#21312
 302  00ab cd0000        	call	_ADC_ChannelCmd
 304  00ae 5b03          	addw	sp,#3
 305                     ; 93 	_ADC_GET(_dwi16);
 307  00b0 ae5340        	ldw	x,#21312
 308  00b3 cd0000        	call	_ADC_SoftwareStartConv
 311  00b6               L37:
 314  00b6 cd01ef        	call	LC003
 315  00b9 27fb          	jreq	L37
 318  00bb ae5340        	ldw	x,#21312
 319  00be cd0000        	call	_ADC_GetConversionValue
 321  00c1 cf0000        	ldw	__dwi16,x
 322                     ; 94 	ADC_ChannelCmd(ADC1, ADC_Channel_20, DISABLE);
 325  00c4 4b00          	push	#0
 326  00c6 ae0110        	ldw	x,#272
 327  00c9 89            	pushw	x
 328  00ca ae5340        	ldw	x,#21312
 329  00cd cd0000        	call	_ADC_ChannelCmd
 331  00d0 5b03          	addw	sp,#3
 332                     ; 95 	_adcBuf2[_adci] = _dwi16;
 334  00d2 c60002        	ld	a,__adci
 335  00d5 5f            	clrw	x
 336  00d6 97            	ld	xl,a
 337  00d7 58            	sllw	x
 338  00d8 90ce0000      	ldw	y,__dwi16
 339  00dc df002e        	ldw	(__adcBuf2,x),y
 340                     ; 97 	_adci++;
 342  00df 725c0002      	inc	__adci
 343                     ; 98 	if( _adci == 12 )
 345  00e3 c60002        	ld	a,__adci
 346  00e6 a10c          	cp	a,#12
 347  00e8 2604          	jrne	L77
 348                     ; 99 		_adci = 0;
 350  00ea 725f0002      	clr	__adci
 351  00ee               L77:
 352                     ; 101 	k = min = max = 0;
 354  00ee 0f09          	clr	(OFST-1,sp)
 355  00f0 0f08          	clr	(OFST-2,sp)
 356  00f2 0f05          	clr	(OFST-5,sp)
 357                     ; 102 	for( i=1; i<12; i++ )
 359  00f4 a601          	ld	a,#1
 360  00f6 6b0a          	ld	(OFST+0,sp),a
 361  00f8               L101:
 362                     ; 104 		if( _adcBuf2[i] < _adcBuf2[min] )
 364  00f8 5f            	clrw	x
 365  00f9 97            	ld	xl,a
 366  00fa 58            	sllw	x
 367  00fb 7b08          	ld	a,(OFST-2,sp)
 368  00fd cd01e8        	call	LC002
 369  0100 de002e        	ldw	x,(__adcBuf2,x)
 370  0103 90d3002e      	cpw	x,(__adcBuf2,y)
 371  0107 2404          	jruge	L701
 372                     ; 105 			min = i;
 374  0109 7b0a          	ld	a,(OFST+0,sp)
 375  010b 6b08          	ld	(OFST-2,sp),a
 376  010d               L701:
 377                     ; 106 		if( _adcBuf2[i] > _adcBuf2[max] )
 379  010d 7b0a          	ld	a,(OFST+0,sp)
 380  010f 5f            	clrw	x
 381  0110 97            	ld	xl,a
 382  0111 58            	sllw	x
 383  0112 7b09          	ld	a,(OFST-1,sp)
 384  0114 cd01e8        	call	LC002
 385  0117 de002e        	ldw	x,(__adcBuf2,x)
 386  011a 90d3002e      	cpw	x,(__adcBuf2,y)
 387  011e 2304          	jrule	L111
 388                     ; 107 			max = i;
 390  0120 7b0a          	ld	a,(OFST+0,sp)
 391  0122 6b09          	ld	(OFST-1,sp),a
 392  0124               L111:
 393                     ; 102 	for( i=1; i<12; i++ )
 395  0124 0c0a          	inc	(OFST+0,sp)
 398  0126 7b0a          	ld	a,(OFST+0,sp)
 399  0128 a10c          	cp	a,#12
 400  012a 25cc          	jrult	L101
 401                     ; 109 	_dwi16 = 0;
 403  012c 5f            	clrw	x
 404  012d cf0000        	ldw	__dwi16,x
 405                     ; 110 	for( i=0; i<12; i++ )
 407  0130 4f            	clr	a
 408  0131 6b0a          	ld	(OFST+0,sp),a
 409  0133               L311:
 410                     ; 112 		if( i==min || i==max )
 412  0133 1108          	cp	a,(OFST-2,sp)
 413  0135 2713          	jreq	L511
 415  0137 1109          	cp	a,(OFST-1,sp)
 416  0139 270f          	jreq	L511
 417                     ; 114 		_dwi16 += _adcBuf2[i];
 419  013b 5f            	clrw	x
 420  013c 97            	ld	xl,a
 421  013d 58            	sllw	x
 422  013e de002e        	ldw	x,(__adcBuf2,x)
 423  0141 72bb0000      	addw	x,__dwi16
 424  0145 cf0000        	ldw	__dwi16,x
 425                     ; 115 		k++;
 427  0148 0c05          	inc	(OFST-5,sp)
 428  014a               L511:
 429                     ; 110 	for( i=0; i<12; i++ )
 431  014a 0c0a          	inc	(OFST+0,sp)
 434  014c 7b0a          	ld	a,(OFST+0,sp)
 435  014e a10c          	cp	a,#12
 436  0150 25e1          	jrult	L311
 437                     ; 117 	_dwi16 = _dwi16/k;
 439  0152 7b05          	ld	a,(OFST-5,sp)
 440  0154 62            	div	x,a
 441  0155 cf0000        	ldw	__dwi16,x
 442                     ; 118 	__ad[0] = _dwi16;
 444  0158 cf0026        	ldw	___ad,x
 445                     ; 119 	__ad[1] = i16;
 447  015b 1e06          	ldw	x,(OFST-4,sp)
 448  015d cf0028        	ldw	___ad+2,x
 449                     ; 120 	__ad[2] = 0;
 451  0160 5f            	clrw	x
 452  0161 cf002a        	ldw	___ad+4,x
 453                     ; 121 	if( _dwi16 < i16 )
 455  0164 ce0000        	ldw	x,__dwi16
 456  0167 1306          	cpw	x,(OFST-4,sp)
 457  0169 1e06          	ldw	x,(OFST-4,sp)
 458  016b 2478          	jruge	L521
 459                     ; 127 		diff = i16 - _dwi16;
 461  016d 72b00000      	subw	x,__dwi16
 462  0171 1f03          	ldw	(OFST-7,sp),x
 463                     ; 128 		if( diff > 100 )	__di = 20 + (diff - 100) / 5;
 465  0173 a30065        	cpw	x,#101
 466  0176 250b          	jrult	L721
 469  0178 1d0064        	subw	x,#100
 470  017b a605          	ld	a,#5
 471  017d 62            	div	x,a
 472  017e 1c0014        	addw	x,#20
 474  0181 2003          	jra	L131
 475  0183               L721:
 476                     ; 130 			__di = 20;
 478  0183 ae0014        	ldw	x,#20
 479  0186               L131:
 480  0186 cf000c        	ldw	___di,x
 481                     ; 132 		if( _dwi16 < 2500 )
 483  0189 ce0000        	ldw	x,__dwi16
 484  018c a309c4        	cpw	x,#2500
 485  018f 2422          	jruge	L331
 486                     ; 134 			if( _dwi16 > 1600 )
 488  0191 a30641        	cpw	x,#1601
 489  0194 2514          	jrult	L531
 490                     ; 135 				__di += 45 - (_dwi16 - 1600) / 20;
 492  0196 1d0640        	subw	x,#1600
 493  0199 a614          	ld	a,#20
 494  019b 62            	div	x,a
 495  019c 1f01          	ldw	(OFST-9,sp),x
 496  019e ae002d        	ldw	x,#45
 497  01a1 72f001        	subw	x,(OFST-9,sp)
 498  01a4 72bb000c      	addw	x,___di
 500  01a8 2006          	jp	LC001
 501  01aa               L531:
 502                     ; 137 				__di += 45;
 504  01aa ce000c        	ldw	x,___di
 505  01ad 1c002d        	addw	x,#45
 506  01b0               LC001:
 507  01b0 cf000c        	ldw	___di,x
 508  01b3               L331:
 509                     ; 140 		if( i16 > 2660 )		__di += 135;
 511  01b3 1e06          	ldw	x,(OFST-4,sp)
 512  01b5 a30a65        	cpw	x,#2661
 513  01b8 2508          	jrult	L141
 516  01ba ce000c        	ldw	x,___di
 517  01bd 1c0087        	addw	x,#135
 519  01c0 201a          	jra	L341
 520  01c2               L141:
 521                     ; 141 		else if( i16 > 1660 )	__di += 60 + (i16 - 1660) / 14;
 523  01c2 a3067d        	cpw	x,#1661
 524  01c5 250f          	jrult	L541
 527  01c7 1d067c        	subw	x,#1660
 528  01ca a60e          	ld	a,#14
 529  01cc 62            	div	x,a
 530  01cd 1c003c        	addw	x,#60
 531  01d0 72bb000c      	addw	x,___di
 533  01d4 2006          	jra	L341
 534  01d6               L541:
 535                     ; 143 			__di += 60;
 537  01d6 ce000c        	ldw	x,___di
 538  01d9 1c003c        	addw	x,#60
 539  01dc               L341:
 540  01dc cf000c        	ldw	___di,x
 541                     ; 145 		return i16 + __di;
 543  01df 1e06          	ldw	x,(OFST-4,sp)
 544  01e1 72bb000c      	addw	x,___di
 546  01e5               L521:
 547                     ; 147 	return	i16 + 0;
 551  01e5 5b0a          	addw	sp,#10
 552  01e7 81            	ret	
 553  01e8               LC002:
 554  01e8 905f          	clrw	y
 555  01ea 9097          	ld	yl,a
 556  01ec 9058          	sllw	y
 557  01ee 81            	ret	
 558  01ef               LC003:
 559  01ef 4b01          	push	#1
 560  01f1 ae5340        	ldw	x,#21312
 561  01f4 cd0000        	call	_ADC_GetFlagStatus
 563  01f7 5b01          	addw	sp,#1
 564  01f9 4d            	tnz	a
 565  01fa 81            	ret	
 568                     	switch	.data
 569  0003               __addi:
 570  0003 00            	dc.b	0
 639                     ; 182 uint8_t	adcGet(uint8_t mode)
 639                     ; 183 {
 640                     .text:	section	.text,new
 641  0000               _adcGet:
 643  0000 88            	push	a
 644  0001 5206          	subw	sp,#6
 645       00000006      OFST:	set	6
 648                     ; 188 	i16 = _adcGet();
 650  0003 cd0000        	call	__adcGet
 652                     ; 190 	if( i16 > 2932 )
 654  0006 a30b75        	cpw	x,#2933
 655  0009 2503          	jrult	L102
 656                     ; 191 		i16 = 2932;
 658  000b ae0b74        	ldw	x,#2932
 659  000e               L102:
 660  000e 1f03          	ldw	(OFST-3,sp),x
 661                     ; 192 	for( i=0; i<42; i++ )
 663  0010 4f            	clr	a
 664  0011 6b06          	ld	(OFST+0,sp),a
 665  0013               L302:
 666                     ; 194 		if( i16 >= adcTbl[i] )
 668  0013 5f            	clrw	x
 669  0014 97            	ld	xl,a
 670  0015 58            	sllw	x
 671  0016 de0000        	ldw	x,(_adcTbl,x)
 672  0019 1303          	cpw	x,(OFST-3,sp)
 673  001b 225e          	jrugt	L112
 674                     ; 196 			if( i==0 )
 676  001d 7b06          	ld	a,(OFST+0,sp)
 677                     ; 198 				i = (i+2) * 2;
 678                     ; 199 				goto Exit;
 680  001f 2762          	jreq	LC004
 681                     ; 202 			m = adcTbl[i-1] - adcTbl[i];
 683  0021 5f            	clrw	x
 684  0022 97            	ld	xl,a
 685  0023 58            	sllw	x
 686  0024 1d0002        	subw	x,#2
 687  0027 905f          	clrw	y
 688  0029 9097          	ld	yl,a
 689  002b 9058          	sllw	y
 690  002d 90d60001      	ld	a,(_adcTbl+1,y)
 691  0031 d00001        	sub	a,(_adcTbl+1,x)
 692  0034 40            	neg	a
 693                     ; 203 			m = m/4;
 695  0035 5f            	clrw	x
 696  0036 97            	ld	xl,a
 697  0037 57            	sraw	x
 698  0038 57            	sraw	x
 699  0039 01            	rrwa	x,a
 700  003a 6b05          	ld	(OFST-1,sp),a
 701                     ; 204 			j = adcTbl[i-1] - i16;
 703  003c 5f            	clrw	x
 704  003d 7b06          	ld	a,(OFST+0,sp)
 705  003f 97            	ld	xl,a
 706  0040 58            	sllw	x
 707  0041 1d0002        	subw	x,#2
 708  0044 d60001        	ld	a,(_adcTbl+1,x)
 709  0047 1004          	sub	a,(OFST-2,sp)
 710  0049 6b02          	ld	(OFST-4,sp),a
 711                     ; 205 			k = adcTbl[i] - i16;
 713  004b 5f            	clrw	x
 714  004c 7b06          	ld	a,(OFST+0,sp)
 715  004e 97            	ld	xl,a
 716  004f 58            	sllw	x
 717  0050 d60001        	ld	a,(_adcTbl+1,x)
 718  0053 1004          	sub	a,(OFST-2,sp)
 719  0055 6b01          	ld	(OFST-5,sp),a
 720                     ; 206 			if( j > k )
 722  0057 7b02          	ld	a,(OFST-4,sp)
 723  0059 1101          	cp	a,(OFST-5,sp)
 724  005b 2311          	jrule	L512
 725                     ; 209 				if( m > k )
 727  005d 7b05          	ld	a,(OFST-1,sp)
 728  005f 1101          	cp	a,(OFST-5,sp)
 729  0061 2304          	jrule	L712
 730                     ; 211 					i = (i+2) * 2;
 732  0063 7b06          	ld	a,(OFST+0,sp)
 733                     ; 212 					goto Exit;
 735  0065 201c          	jp	LC004
 736  0067               L712:
 737                     ; 214 				i = (i+2-1) * 2 + 1;
 740  0067 7b06          	ld	a,(OFST+0,sp)
 741  0069 48            	sll	a
 742  006a ab03          	add	a,#3
 743                     ; 215 				goto Exit;
 745  006c 2018          	jra	L151
 746  006e               L512:
 747                     ; 220 				if( m  > j )
 749  006e 7b05          	ld	a,(OFST-1,sp)
 750  0070 1102          	cp	a,(OFST-4,sp)
 751  0072 23f3          	jrule	L712
 752                     ; 222 					i = (i+2-1) * 2;
 754  0074 7b06          	ld	a,(OFST+0,sp)
 755  0076 48            	sll	a
 756  0077 ab02          	add	a,#2
 757                     ; 223 					goto Exit;
 759  0079 200b          	jra	L151
 760                     ; 225 				i = (i+2-1) * 2 + 1;
 761                     ; 226 				goto Exit;
 763  007b               L112:
 764                     ; 192 	for( i=0; i<42; i++ )
 766  007b 0c06          	inc	(OFST+0,sp)
 769  007d 7b06          	ld	a,(OFST+0,sp)
 770  007f a12a          	cp	a,#42
 771  0081 2590          	jrult	L302
 772                     ; 230 	i = (i+2) * 2;
 774  0083               LC004:
 776  0083 48            	sll	a
 777  0084 ab04          	add	a,#4
 778  0086               L151:
 779  0086 6b06          	ld	(OFST+0,sp),a
 780                     ; 231 Exit:	
 780                     ; 232 	if( mode == 1 )
 782  0088 7b07          	ld	a,(OFST+1,sp)
 783  008a 4a            	dec	a
 784  008b 2604          	jrne	L522
 785                     ; 233 		return i;
 787  008d 7b06          	ld	a,(OFST+0,sp)
 789  008f 2075          	jra	L24
 790  0091               L522:
 791                     ; 235 	_add[_addi++] = i;
 793  0091 c60003        	ld	a,__addi
 794  0094 725c0003      	inc	__addi
 795  0098 5f            	clrw	x
 796  0099 97            	ld	xl,a
 797  009a 7b06          	ld	a,(OFST+0,sp)
 798  009c d70000        	ld	(__add,x),a
 799                     ; 236 	if( _addi == 12 )
 801  009f c60003        	ld	a,__addi
 802  00a2 a10c          	cp	a,#12
 803  00a4 2604          	jrne	L722
 804                     ; 237 		_addi = 0;
 806  00a6 725f0003      	clr	__addi
 807  00aa               L722:
 808                     ; 239 	j = 0;	//	min
 810  00aa 0f02          	clr	(OFST-4,sp)
 811                     ; 240 	m = 0;	//	max
 813  00ac 0f05          	clr	(OFST-1,sp)
 814                     ; 241 	for( i=1; i<12; i++ )
 816  00ae a601          	ld	a,#1
 817  00b0 6b06          	ld	(OFST+0,sp),a
 818  00b2               L132:
 819                     ; 243 		if( _add[i] < _add[j] )
 821  00b2 7b02          	ld	a,(OFST-4,sp)
 822  00b4 5f            	clrw	x
 823  00b5 97            	ld	xl,a
 824  00b6 7b06          	ld	a,(OFST+0,sp)
 825  00b8 ad4f          	call	LC006
 826  00ba 2404          	jruge	L732
 827                     ; 244 			j = i;
 829  00bc 7b06          	ld	a,(OFST+0,sp)
 830  00be 6b02          	ld	(OFST-4,sp),a
 831  00c0               L732:
 832                     ; 245 		if( _add[i] > _add[m] )
 834  00c0 7b05          	ld	a,(OFST-1,sp)
 835  00c2 5f            	clrw	x
 836  00c3 97            	ld	xl,a
 837  00c4 7b06          	ld	a,(OFST+0,sp)
 838  00c6 ad41          	call	LC006
 839  00c8 2304          	jrule	L142
 840                     ; 246 			m = i;
 842  00ca 7b06          	ld	a,(OFST+0,sp)
 843  00cc 6b05          	ld	(OFST-1,sp),a
 844  00ce               L142:
 845                     ; 241 	for( i=1; i<12; i++ )
 847  00ce 0c06          	inc	(OFST+0,sp)
 850  00d0 7b06          	ld	a,(OFST+0,sp)
 851  00d2 a10c          	cp	a,#12
 852  00d4 25dc          	jrult	L132
 853                     ; 248 	k = 0;
 855  00d6 0f01          	clr	(OFST-5,sp)
 856                     ; 249 	i16 = 0;
 858  00d8 5f            	clrw	x
 859  00d9 1f03          	ldw	(OFST-3,sp),x
 860                     ; 250 	for( i=0; i<12; i++ )
 862  00db 4f            	clr	a
 863  00dc 6b06          	ld	(OFST+0,sp),a
 864  00de               L342:
 865                     ; 252 		if( i==j || i==m )
 867  00de 1102          	cp	a,(OFST-4,sp)
 868  00e0 2713          	jreq	L542
 870  00e2 1105          	cp	a,(OFST-1,sp)
 871  00e4 270f          	jreq	L542
 872                     ; 254 		i16 += _add[i];
 874  00e6 5f            	clrw	x
 875  00e7 97            	ld	xl,a
 876  00e8 d60000        	ld	a,(__add,x)
 877  00eb 1b04          	add	a,(OFST-2,sp)
 878  00ed 6b04          	ld	(OFST-2,sp),a
 879  00ef 2402          	jrnc	L04
 880  00f1 0c03          	inc	(OFST-3,sp)
 881  00f3               L04:
 882                     ; 255 		k++;
 884  00f3 0c01          	inc	(OFST-5,sp)
 885  00f5               L542:
 886                     ; 250 	for( i=0; i<12; i++ )
 888  00f5 0c06          	inc	(OFST+0,sp)
 891  00f7 7b06          	ld	a,(OFST+0,sp)
 892  00f9 a10c          	cp	a,#12
 893  00fb 25e1          	jrult	L342
 894                     ; 257 	i16 = i16/k;
 896  00fd 1e03          	ldw	x,(OFST-3,sp)
 897  00ff 7b01          	ld	a,(OFST-5,sp)
 898  0101 62            	div	x,a
 899  0102 1f03          	ldw	(OFST-3,sp),x
 900                     ; 262 	return i16;
 902  0104 7b04          	ld	a,(OFST-2,sp)
 904  0106               L24:
 906  0106 5b07          	addw	sp,#7
 907  0108 81            	ret	
 908  0109               LC006:
 909  0109 905f          	clrw	y
 910  010b 9097          	ld	yl,a
 911  010d 90d60000      	ld	a,(__add,y)
 912  0111 d10000        	cp	a,(__add,x)
 913  0114 81            	ret	
 940                     ; 265 void	systemADC(void)
 940                     ; 266 {
 941                     .text:	section	.text,new
 942  0000               _systemADC:
 946                     ; 269 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 948  0000 ae1001        	ldw	x,#4097
 949  0003 cd0000        	call	_CLK_PeripheralClockConfig
 951                     ; 272 	ADC_Init(
 951                     ; 273 		ADC1, 
 951                     ; 274 		ADC_ConversionMode_Single, 
 951                     ; 275 		ADC_Resolution_12Bit, 
 951                     ; 276 		ADC_Prescaler_2
 951                     ; 277 		);
 953  0006 4b80          	push	#128
 954  0008 4b00          	push	#0
 955  000a 4b00          	push	#0
 956  000c ae5340        	ldw	x,#21312
 957  000f cd0000        	call	_ADC_Init
 959  0012 5b03          	addw	sp,#3
 960                     ; 278 	ADC_SamplingTimeConfig(
 960                     ; 279 		ADC1, 
 960                     ; 280 		ADC_Group_SlowChannels, 
 960                     ; 281 		ADC_SamplingTime_384Cycles
 960                     ; 282 		);
 962  0014 4b07          	push	#7
 963  0016 4b00          	push	#0
 964  0018 ae5340        	ldw	x,#21312
 965  001b cd0000        	call	_ADC_SamplingTimeConfig
 967  001e 85            	popw	x
 968                     ; 285 	ADC_Cmd(ADC1, ENABLE);
 970  001f 4b01          	push	#1
 971  0021 ae5340        	ldw	x,#21312
 972  0024 cd0000        	call	_ADC_Cmd
 974  0027 84            	pop	a
 975                     ; 320 }
 978  0028 81            	ret	
1075                     	xdef	__addi
1076                     	switch	.bss
1077  0000               __add:
1078  0000 000000000000  	ds.b	12
1079                     	xdef	__add
1080                     	xdef	__adcGet
1081  000c               ___di:
1082  000c 0000          	ds.b	2
1083                     	xdef	___di
1084                     	xdef	__adci
1085  000e               __adcBuf:
1086  000e 000000000000  	ds.b	24
1087                     	xdef	__adcBuf
1088  0026               ___ad:
1089  0026 000000000000  	ds.b	8
1090                     	xdef	___ad
1091                     	xdef	__dwi16
1092  002e               __adcBuf2:
1093  002e 000000000000  	ds.b	24
1094                     	xdef	__adcBuf2
1095                     	xdef	_adcTbl
1096                     	xdef	_adcGet
1097                     	xdef	_systemADC
1098                     	xref	_CLK_PeripheralClockConfig
1099                     	xref	_ADC_GetFlagStatus
1100                     	xref	_ADC_GetConversionValue
1101                     	xref	_ADC_SamplingTimeConfig
1102                     	xref	_ADC_ChannelCmd
1103                     	xref	_ADC_SoftwareStartConv
1104                     	xref	_ADC_Cmd
1105                     	xref	_ADC_Init
1125                     	end
