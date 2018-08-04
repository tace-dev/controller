   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     .const:	section	.text
  22  0000               _adcTbl:
  23  0000 0b92          	dc.w	2962
  24  0002 0b74          	dc.w	2932
  25  0004 0b4e          	dc.w	2894
  26  0006 0b29          	dc.w	2857
  27  0008 0b02          	dc.w	2818
  28  000a 0adb          	dc.w	2779
  29  000c 0ab4          	dc.w	2740
  30  000e 0a8c          	dc.w	2700
  31  0010 0a65          	dc.w	2661
  32  0012 0a3c          	dc.w	2620
  33  0014 0a14          	dc.w	2580
  34  0016 09ec          	dc.w	2540
  35  0018 09c3          	dc.w	2499
  36  001a 099a          	dc.w	2458
  37  001c 0970          	dc.w	2416
  38  001e 0947          	dc.w	2375
  39  0020 091f          	dc.w	2335
  40  0022 08f5          	dc.w	2293
  41  0024 08cc          	dc.w	2252
  42  0026 08a2          	dc.w	2210
  43  0028 087a          	dc.w	2170
  44  002a 0851          	dc.w	2129
  45  002c 0829          	dc.w	2089
  46  002e 0800          	dc.w	2048
  47  0030 07d8          	dc.w	2008
  48  0032 07b0          	dc.w	1968
  49  0034 0788          	dc.w	1928
  50  0036 0760          	dc.w	1888
  51  0038 073a          	dc.w	1850
  52  003a 0713          	dc.w	1811
  53  003c 06ec          	dc.w	1772
  54  003e 06c6          	dc.w	1734
  55  0040 06a1          	dc.w	1697
  56  0042 067c          	dc.w	1660
  57  0044 0657          	dc.w	1623
  58  0046 0633          	dc.w	1587
  59  0048 060f          	dc.w	1551
  60  004a 05ec          	dc.w	1516
  61  004c 05c9          	dc.w	1481
  62  004e 05a8          	dc.w	1448
  63  0050 0587          	dc.w	1415
  64  0052 0564          	dc.w	1380
  65                     	switch	.data
  66  0000               __adci:
  67  0000 00            	dc.b	0
 130                     ; 47 uint16_t	_adcGet(void)
 130                     ; 48 {
 132                     	switch	.text
 133  0000               __adcGet:
 135  0000 5205          	subw	sp,#5
 136       00000005      OFST:	set	5
 139  0002               L53:
 140                     ; 53 	_ADC_GET(i16);
 142  0002 4b01          	push	#1
 143  0004 ae5340        	ldw	x,#21312
 144  0007 cd0000        	call	_ADC_GetFlagStatus
 146  000a 5b01          	addw	sp,#1
 147  000c 4d            	tnz	a
 148  000d 27f3          	jreq	L53
 151  000f ae5340        	ldw	x,#21312
 152  0012 cd0000        	call	_ADC_GetConversionValue
 154  0015 1f01          	ldw	(OFST-4,sp),x
 155                     ; 61 	_adcBuf[_adci] = i16; 
 158  0017 5f            	clrw	x
 159  0018 c60000        	ld	a,__adci
 160  001b 97            	ld	xl,a
 161  001c 58            	sllw	x
 162  001d 1601          	ldw	y,(OFST-4,sp)
 163  001f df000c        	ldw	(__adcBuf,x),y
 164                     ; 68 	_adci++;
 166  0022 725c0000      	inc	__adci
 167                     ; 69 	if( _adci == 12 )
 169  0026 c60000        	ld	a,__adci
 170  0029 a10c          	cp	a,#12
 171  002b 2604          	jrne	L14
 172                     ; 70 		_adci = 0;
 174  002d 725f0000      	clr	__adci
 175  0031               L14:
 176                     ; 75 	min = 0;
 178  0031 0f03          	clr	(OFST-2,sp)
 179                     ; 76 	max = 0;
 181  0033 0f04          	clr	(OFST-1,sp)
 182                     ; 77 	for( i=1; i<12; i++ )
 184  0035 a601          	ld	a,#1
 185  0037 6b05          	ld	(OFST+0,sp),a
 186  0039               L34:
 187                     ; 79 		if( _adcBuf[i] < _adcBuf[min] )
 189  0039 5f            	clrw	x
 190  003a 97            	ld	xl,a
 191  003b 58            	sllw	x
 192  003c 7b03          	ld	a,(OFST-2,sp)
 193  003e ad44          	call	LC001
 194  0040 2404          	jruge	L15
 195                     ; 80 			min = i;
 197  0042 7b05          	ld	a,(OFST+0,sp)
 198  0044 6b03          	ld	(OFST-2,sp),a
 199  0046               L15:
 200                     ; 81 		if( _adcBuf[i] > _adcBuf[max] )
 202  0046 7b05          	ld	a,(OFST+0,sp)
 203  0048 5f            	clrw	x
 204  0049 97            	ld	xl,a
 205  004a 58            	sllw	x
 206  004b 7b04          	ld	a,(OFST-1,sp)
 207  004d ad35          	call	LC001
 208  004f 2304          	jrule	L35
 209                     ; 82 			max = i;
 211  0051 7b05          	ld	a,(OFST+0,sp)
 212  0053 6b04          	ld	(OFST-1,sp),a
 213  0055               L35:
 214                     ; 77 	for( i=1; i<12; i++ )
 216  0055 0c05          	inc	(OFST+0,sp)
 219  0057 7b05          	ld	a,(OFST+0,sp)
 220  0059 a10c          	cp	a,#12
 221  005b 25dc          	jrult	L34
 222                     ; 84 	i16 = 0;
 224  005d 5f            	clrw	x
 225  005e 1f01          	ldw	(OFST-4,sp),x
 226                     ; 85 	for( i=0; i<12; i++ )
 228  0060 4f            	clr	a
 229  0061 6b05          	ld	(OFST+0,sp),a
 230  0063               L55:
 231                     ; 87 		if( i==min || i==max )
 233  0063 1103          	cp	a,(OFST-2,sp)
 234  0065 270f          	jreq	L75
 236  0067 1104          	cp	a,(OFST-1,sp)
 237  0069 270b          	jreq	L75
 238                     ; 89 		i16 += _adcBuf[i];
 240  006b 5f            	clrw	x
 241  006c 97            	ld	xl,a
 242  006d 58            	sllw	x
 243  006e de000c        	ldw	x,(__adcBuf,x)
 244  0071 72fb01        	addw	x,(OFST-4,sp)
 245  0074 1f01          	ldw	(OFST-4,sp),x
 246  0076               L75:
 247                     ; 85 	for( i=0; i<12; i++ )
 249  0076 0c05          	inc	(OFST+0,sp)
 252  0078 7b05          	ld	a,(OFST+0,sp)
 253  007a a10c          	cp	a,#12
 254  007c 25e5          	jrult	L55
 255                     ; 91 	i16 = i16/10;
 257  007e a60a          	ld	a,#10
 258  0080 62            	div	x,a
 259                     ; 92 	return i16;
 263  0081 5b05          	addw	sp,#5
 264  0083 81            	ret	
 265  0084               LC001:
 266  0084 905f          	clrw	y
 267  0086 9097          	ld	yl,a
 268  0088 9058          	sllw	y
 269  008a de000c        	ldw	x,(__adcBuf,x)
 270  008d 90d3000c      	cpw	x,(__adcBuf,y)
 271  0091 81            	ret	
 274                     	switch	.data
 275  0001               __addi:
 276  0001 00            	dc.b	0
 345                     ; 98 uint8_t	adcGet(uint8_t mode)
 345                     ; 99 {
 346                     	switch	.text
 347  0092               _adcGet:
 349  0092 88            	push	a
 350  0093 5206          	subw	sp,#6
 351       00000006      OFST:	set	6
 354                     ; 104 	i16 = _adcGet();
 356  0095 cd0000        	call	__adcGet
 358  0098 1f02          	ldw	(OFST-4,sp),x
 359                     ; 105 	for( i=0; i<42; i++ )
 361  009a 4f            	clr	a
 362  009b 6b06          	ld	(OFST+0,sp),a
 363  009d               L711:
 364                     ; 107 		if( i16 >= adcTbl[i] )
 366  009d 5f            	clrw	x
 367  009e 97            	ld	xl,a
 368  009f 58            	sllw	x
 369  00a0 de0000        	ldw	x,(_adcTbl,x)
 370  00a3 1302          	cpw	x,(OFST-4,sp)
 371  00a5 225e          	jrugt	L521
 372                     ; 109 			if( i==0 )
 374  00a7 7b06          	ld	a,(OFST+0,sp)
 375                     ; 111 				i = (i+2) * 2;
 376                     ; 112 				goto Exit;
 378  00a9 2762          	jreq	LC002
 379                     ; 115 			m = adcTbl[i-1] - adcTbl[i];
 381  00ab 5f            	clrw	x
 382  00ac 97            	ld	xl,a
 383  00ad 58            	sllw	x
 384  00ae 1d0002        	subw	x,#2
 385  00b1 905f          	clrw	y
 386  00b3 9097          	ld	yl,a
 387  00b5 9058          	sllw	y
 388  00b7 90d60001      	ld	a,(_adcTbl+1,y)
 389  00bb d00001        	sub	a,(_adcTbl+1,x)
 390  00be 40            	neg	a
 391                     ; 116 			m = m/4;
 393  00bf 5f            	clrw	x
 394  00c0 97            	ld	xl,a
 395  00c1 57            	sraw	x
 396  00c2 57            	sraw	x
 397  00c3 01            	rrwa	x,a
 398  00c4 6b05          	ld	(OFST-1,sp),a
 399                     ; 117 			j = adcTbl[i-1] - i16;
 401  00c6 5f            	clrw	x
 402  00c7 7b06          	ld	a,(OFST+0,sp)
 403  00c9 97            	ld	xl,a
 404  00ca 58            	sllw	x
 405  00cb 1d0002        	subw	x,#2
 406  00ce d60001        	ld	a,(_adcTbl+1,x)
 407  00d1 1003          	sub	a,(OFST-3,sp)
 408  00d3 6b04          	ld	(OFST-2,sp),a
 409                     ; 118 			k = adcTbl[i] - i16;
 411  00d5 5f            	clrw	x
 412  00d6 7b06          	ld	a,(OFST+0,sp)
 413  00d8 97            	ld	xl,a
 414  00d9 58            	sllw	x
 415  00da d60001        	ld	a,(_adcTbl+1,x)
 416  00dd 1003          	sub	a,(OFST-3,sp)
 417  00df 6b01          	ld	(OFST-5,sp),a
 418                     ; 119 			if( j > k )
 420  00e1 7b04          	ld	a,(OFST-2,sp)
 421  00e3 1101          	cp	a,(OFST-5,sp)
 422  00e5 2311          	jrule	L131
 423                     ; 122 				if( m > k )
 425  00e7 7b05          	ld	a,(OFST-1,sp)
 426  00e9 1101          	cp	a,(OFST-5,sp)
 427  00eb 2304          	jrule	L331
 428                     ; 124 					i = (i+2) * 2;
 430  00ed 7b06          	ld	a,(OFST+0,sp)
 431                     ; 125 					goto Exit;
 433  00ef 201c          	jp	LC002
 434  00f1               L331:
 435                     ; 127 				i = (i+2-1) * 2 + 1;
 438  00f1 7b06          	ld	a,(OFST+0,sp)
 439  00f3 48            	sll	a
 440  00f4 ab03          	add	a,#3
 441                     ; 128 				goto Exit;
 443  00f6 2018          	jra	L76
 444  00f8               L131:
 445                     ; 133 				if( m  > j )
 447  00f8 7b05          	ld	a,(OFST-1,sp)
 448  00fa 1104          	cp	a,(OFST-2,sp)
 449  00fc 23f3          	jrule	L331
 450                     ; 135 					i = (i+2-1) * 2;
 452  00fe 7b06          	ld	a,(OFST+0,sp)
 453  0100 48            	sll	a
 454  0101 ab02          	add	a,#2
 455                     ; 136 					goto Exit;
 457  0103 200b          	jra	L76
 458                     ; 138 				i = (i+2-1) * 2 + 1;
 459                     ; 139 				goto Exit;
 461  0105               L521:
 462                     ; 105 	for( i=0; i<42; i++ )
 464  0105 0c06          	inc	(OFST+0,sp)
 467  0107 7b06          	ld	a,(OFST+0,sp)
 468  0109 a12a          	cp	a,#42
 469  010b 2590          	jrult	L711
 470                     ; 143 	i = (i+2) * 2;
 472  010d               LC002:
 474  010d 48            	sll	a
 475  010e ab04          	add	a,#4
 476  0110               L76:
 477  0110 6b06          	ld	(OFST+0,sp),a
 478                     ; 144 Exit:	
 478                     ; 145 	if( mode == 1 )
 480  0112 7b07          	ld	a,(OFST+1,sp)
 481  0114 4a            	dec	a
 482  0115 2604          	jrne	L141
 483                     ; 146 		return i;
 485  0117 7b06          	ld	a,(OFST+0,sp)
 487  0119 206f          	jra	L02
 488  011b               L141:
 489                     ; 148 	_add[_addi++] = i;
 491  011b c60001        	ld	a,__addi
 492  011e 725c0001      	inc	__addi
 493  0122 5f            	clrw	x
 494  0123 97            	ld	xl,a
 495  0124 7b06          	ld	a,(OFST+0,sp)
 496  0126 d70000        	ld	(__add,x),a
 497                     ; 149 	if( _addi == 12 )
 499  0129 c60001        	ld	a,__addi
 500  012c a10c          	cp	a,#12
 501  012e 2604          	jrne	L341
 502                     ; 150 		_addi = 0;
 504  0130 725f0001      	clr	__addi
 505  0134               L341:
 506                     ; 152 	j = 0;	//	min
 508  0134 0f04          	clr	(OFST-2,sp)
 509                     ; 153 	k = 0;	//	max
 511                     ; 154 	for( i=1; i<12; i++ )
 513  0136 a601          	ld	a,#1
 514  0138 6b06          	ld	(OFST+0,sp),a
 515  013a               L541:
 516                     ; 156 		if( _add[i] < _add[j] )
 518  013a 7b04          	ld	a,(OFST-2,sp)
 519  013c 5f            	clrw	x
 520  013d 97            	ld	xl,a
 521  013e 7b06          	ld	a,(OFST+0,sp)
 522  0140 ad4b          	call	LC004
 523  0142 2404          	jruge	L351
 524                     ; 157 			j = i;
 526  0144 7b06          	ld	a,(OFST+0,sp)
 527  0146 6b04          	ld	(OFST-2,sp),a
 528  0148               L351:
 529                     ; 158 		if( _add[i] > _add[m] )
 531  0148 7b05          	ld	a,(OFST-1,sp)
 532  014a 5f            	clrw	x
 533  014b 97            	ld	xl,a
 534  014c 7b06          	ld	a,(OFST+0,sp)
 535  014e ad3d          	call	LC004
 536  0150 2304          	jrule	L551
 537                     ; 159 			m = i;
 539  0152 7b06          	ld	a,(OFST+0,sp)
 540  0154 6b05          	ld	(OFST-1,sp),a
 541  0156               L551:
 542                     ; 154 	for( i=1; i<12; i++ )
 544  0156 0c06          	inc	(OFST+0,sp)
 547  0158 7b06          	ld	a,(OFST+0,sp)
 548  015a a10c          	cp	a,#12
 549  015c 25dc          	jrult	L541
 550                     ; 161 	i16 = 0;
 552  015e 5f            	clrw	x
 553  015f 1f02          	ldw	(OFST-4,sp),x
 554                     ; 162 	for( i=0; i<12; i++ )
 556  0161 4f            	clr	a
 557  0162 6b06          	ld	(OFST+0,sp),a
 558  0164               L751:
 559                     ; 164 		if( i==j || i==m )
 561  0164 1104          	cp	a,(OFST-2,sp)
 562  0166 2711          	jreq	L61
 564  0168 1105          	cp	a,(OFST-1,sp)
 565  016a 270d          	jreq	L61
 566                     ; 166 		i16 += _add[i];
 568  016c 5f            	clrw	x
 569  016d 97            	ld	xl,a
 570  016e d60000        	ld	a,(__add,x)
 571  0171 1b03          	add	a,(OFST-3,sp)
 572  0173 6b03          	ld	(OFST-3,sp),a
 573  0175 2402          	jrnc	L61
 574  0177 0c02          	inc	(OFST-4,sp)
 575  0179               L61:
 576                     ; 162 	for( i=0; i<12; i++ )
 578  0179 0c06          	inc	(OFST+0,sp)
 581  017b 7b06          	ld	a,(OFST+0,sp)
 582  017d a10c          	cp	a,#12
 583  017f 25e3          	jrult	L751
 584                     ; 168 	i16 = i16/10;
 586  0181 1e02          	ldw	x,(OFST-4,sp)
 587  0183 a60a          	ld	a,#10
 588  0185 62            	div	x,a
 589  0186 1f02          	ldw	(OFST-4,sp),x
 590                     ; 173 	return i16;
 592  0188 7b03          	ld	a,(OFST-3,sp)
 594  018a               L02:
 596  018a 5b07          	addw	sp,#7
 597  018c 81            	ret	
 598  018d               LC004:
 599  018d 905f          	clrw	y
 600  018f 9097          	ld	yl,a
 601  0191 90d60000      	ld	a,(__add,y)
 602  0195 d10000        	cp	a,(__add,x)
 603  0198 81            	ret	
 632                     ; 176 void	systemADC(void)
 632                     ; 177 {
 633                     	switch	.text
 634  0199               _systemADC:
 638                     ; 180 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 640  0199 ae1001        	ldw	x,#4097
 641  019c cd0000        	call	_CLK_PeripheralClockConfig
 643                     ; 182 	ADC_Init(
 643                     ; 183 		ADC1, 
 643                     ; 184 		ADC_ConversionMode_Continuous, 
 643                     ; 185 		ADC_Resolution_12Bit, 
 643                     ; 186 		ADC_Prescaler_2
 643                     ; 187 		);
 645  019f 4b80          	push	#128
 646  01a1 4b00          	push	#0
 647  01a3 4b04          	push	#4
 648  01a5 ae5340        	ldw	x,#21312
 649  01a8 cd0000        	call	_ADC_Init
 651  01ab 5b03          	addw	sp,#3
 652                     ; 188 	ADC_SamplingTimeConfig(
 652                     ; 189 		ADC1, 
 652                     ; 190 		ADC_Group_SlowChannels, 
 652                     ; 191 		ADC_SamplingTime_384Cycles
 652                     ; 192 		);
 654  01ad 4b07          	push	#7
 655  01af 4b00          	push	#0
 656  01b1 ae5340        	ldw	x,#21312
 657  01b4 cd0000        	call	_ADC_SamplingTimeConfig
 659  01b7 85            	popw	x
 660                     ; 195 	ADC_Cmd(ADC1, ENABLE);
 662  01b8 4b01          	push	#1
 663  01ba ae5340        	ldw	x,#21312
 664  01bd cd0000        	call	_ADC_Cmd
 666  01c0 84            	pop	a
 667                     ; 199 	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
 669  01c1 4b01          	push	#1
 670  01c3 ae0308        	ldw	x,#776
 671  01c6 89            	pushw	x
 672  01c7 ae5340        	ldw	x,#21312
 673  01ca cd0000        	call	_ADC_ChannelCmd
 675  01cd 5b03          	addw	sp,#3
 676                     ; 214 	ADC_SoftwareStartConv(ADC1);
 678  01cf ae5340        	ldw	x,#21312
 680                     ; 222 }
 683  01d2 cc0000        	jp	_ADC_SoftwareStartConv
 742                     	xdef	__addi
 743                     	switch	.bss
 744  0000               __add:
 745  0000 000000000000  	ds.b	12
 746                     	xdef	__add
 747                     	xdef	__adcGet
 748                     	xdef	__adci
 749  000c               __adcBuf:
 750  000c 000000000000  	ds.b	24
 751                     	xdef	__adcBuf
 752                     	xdef	_adcTbl
 753                     	xdef	_adcGet
 754                     	xdef	_systemADC
 755                     	xref	_CLK_PeripheralClockConfig
 756                     	xref	_ADC_GetFlagStatus
 757                     	xref	_ADC_GetConversionValue
 758                     	xref	_ADC_SamplingTimeConfig
 759                     	xref	_ADC_ChannelCmd
 760                     	xref	_ADC_SoftwareStartConv
 761                     	xref	_ADC_Cmd
 762                     	xref	_ADC_Init
 782                     	end
