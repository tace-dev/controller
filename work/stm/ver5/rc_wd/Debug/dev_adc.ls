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
 138                     ; 49 uint16_t	_adcGet(void)
 138                     ; 50 {
 140                     	switch	.text
 141  0000               __adcGet:
 143  0000 5206          	subw	sp,#6
 144       00000006      OFST:	set	6
 147                     ; 117 	_ADC_GET(i16);
 149  0002 ae5340        	ldw	x,#21312
 150  0005 cd0000        	call	_ADC_SoftwareStartConv
 153  0008               L73:
 156  0008 4b01          	push	#1
 157  000a ae5340        	ldw	x,#21312
 158  000d cd0000        	call	_ADC_GetFlagStatus
 160  0010 5b01          	addw	sp,#1
 161  0012 4d            	tnz	a
 162  0013 27f3          	jreq	L73
 165  0015 ae5340        	ldw	x,#21312
 166  0018 cd0000        	call	_ADC_GetConversionValue
 168  001b 1f02          	ldw	(OFST-4,sp),x
 169                     ; 118 	_adci++;
 172  001d 725c0000      	inc	__adci
 173                     ; 119 	if( _adci == 12 )
 175  0021 c60000        	ld	a,__adci
 176  0024 a10c          	cp	a,#12
 177  0026 2604          	jrne	L34
 178                     ; 120 		_adci = 0;
 180  0028 725f0000      	clr	__adci
 181  002c               L34:
 182                     ; 121 	_adcBuf[_adci] = i16; 
 184  002c c60000        	ld	a,__adci
 185  002f 5f            	clrw	x
 186  0030 97            	ld	xl,a
 187  0031 58            	sllw	x
 188  0032 1602          	ldw	y,(OFST-4,sp)
 189  0034 df000c        	ldw	(__adcBuf,x),y
 190                     ; 123 	k = min = max = 0;
 192  0037 0f05          	clr	(OFST-1,sp)
 193  0039 0f04          	clr	(OFST-2,sp)
 194  003b 0f01          	clr	(OFST-5,sp)
 195                     ; 124 	for( i=1; i<12; i++ )
 197  003d a601          	ld	a,#1
 198  003f 6b06          	ld	(OFST+0,sp),a
 199  0041               L54:
 200                     ; 126 		if( _adcBuf[i] < _adcBuf[min] )
 202  0041 5f            	clrw	x
 203  0042 97            	ld	xl,a
 204  0043 58            	sllw	x
 205  0044 7b04          	ld	a,(OFST-2,sp)
 206  0046 ad46          	call	LC001
 207  0048 2404          	jruge	L35
 208                     ; 127 			min = i;
 210  004a 7b06          	ld	a,(OFST+0,sp)
 211  004c 6b04          	ld	(OFST-2,sp),a
 212  004e               L35:
 213                     ; 128 		if( _adcBuf[i] > _adcBuf[max] )
 215  004e 7b06          	ld	a,(OFST+0,sp)
 216  0050 5f            	clrw	x
 217  0051 97            	ld	xl,a
 218  0052 58            	sllw	x
 219  0053 7b05          	ld	a,(OFST-1,sp)
 220  0055 ad37          	call	LC001
 221  0057 2304          	jrule	L55
 222                     ; 129 			max = i;
 224  0059 7b06          	ld	a,(OFST+0,sp)
 225  005b 6b05          	ld	(OFST-1,sp),a
 226  005d               L55:
 227                     ; 124 	for( i=1; i<12; i++ )
 229  005d 0c06          	inc	(OFST+0,sp)
 232  005f 7b06          	ld	a,(OFST+0,sp)
 233  0061 a10c          	cp	a,#12
 234  0063 25dc          	jrult	L54
 235                     ; 131 	i16 = 0;
 237  0065 5f            	clrw	x
 238  0066 1f02          	ldw	(OFST-4,sp),x
 239                     ; 132 	for( i=0; i<12; i++ )
 241  0068 4f            	clr	a
 242  0069 6b06          	ld	(OFST+0,sp),a
 243  006b               L75:
 244                     ; 134 		if( i==min || i==max )
 246  006b 1104          	cp	a,(OFST-2,sp)
 247  006d 2711          	jreq	L16
 249  006f 1105          	cp	a,(OFST-1,sp)
 250  0071 270d          	jreq	L16
 251                     ; 136 		i16 += _adcBuf[i];
 253  0073 5f            	clrw	x
 254  0074 97            	ld	xl,a
 255  0075 58            	sllw	x
 256  0076 de000c        	ldw	x,(__adcBuf,x)
 257  0079 72fb02        	addw	x,(OFST-4,sp)
 258  007c 1f02          	ldw	(OFST-4,sp),x
 259                     ; 137 		k++;
 261  007e 0c01          	inc	(OFST-5,sp)
 262  0080               L16:
 263                     ; 132 	for( i=0; i<12; i++ )
 265  0080 0c06          	inc	(OFST+0,sp)
 268  0082 7b06          	ld	a,(OFST+0,sp)
 269  0084 a10c          	cp	a,#12
 270  0086 25e3          	jrult	L75
 271                     ; 139 	i16 = i16/k;
 273  0088 7b01          	ld	a,(OFST-5,sp)
 274  008a 62            	div	x,a
 275                     ; 140 	return i16;
 279  008b 5b06          	addw	sp,#6
 280  008d 81            	ret	
 281  008e               LC001:
 282  008e 905f          	clrw	y
 283  0090 9097          	ld	yl,a
 284  0092 9058          	sllw	y
 285  0094 de000c        	ldw	x,(__adcBuf,x)
 286  0097 90d3000c      	cpw	x,(__adcBuf,y)
 287  009b 81            	ret	
 290                     	switch	.data
 291  0001               __addi:
 292  0001 00            	dc.b	0
 361                     ; 150 uint8_t	adcGet(uint8_t mode)
 361                     ; 151 {
 362                     	switch	.text
 363  009c               _adcGet:
 365  009c 88            	push	a
 366  009d 5206          	subw	sp,#6
 367       00000006      OFST:	set	6
 370                     ; 156 	i16 = _adcGet();
 372  009f cd0000        	call	__adcGet
 374  00a2 1f02          	ldw	(OFST-4,sp),x
 375                     ; 157 	for( i=0; i<42; i++ )
 377  00a4 4f            	clr	a
 378  00a5 6b06          	ld	(OFST+0,sp),a
 379  00a7               L121:
 380                     ; 159 		if( i16 >= adcTbl[i] )
 382  00a7 5f            	clrw	x
 383  00a8 97            	ld	xl,a
 384  00a9 58            	sllw	x
 385  00aa de0000        	ldw	x,(_adcTbl,x)
 386  00ad 1302          	cpw	x,(OFST-4,sp)
 387  00af 225e          	jrugt	L721
 388                     ; 161 			if( i==0 )
 390  00b1 7b06          	ld	a,(OFST+0,sp)
 391                     ; 163 				i = (i+2) * 2;
 392                     ; 164 				goto Exit;
 394  00b3 2762          	jreq	LC002
 395                     ; 167 			m = adcTbl[i-1] - adcTbl[i];
 397  00b5 5f            	clrw	x
 398  00b6 97            	ld	xl,a
 399  00b7 58            	sllw	x
 400  00b8 1d0002        	subw	x,#2
 401  00bb 905f          	clrw	y
 402  00bd 9097          	ld	yl,a
 403  00bf 9058          	sllw	y
 404  00c1 90d60001      	ld	a,(_adcTbl+1,y)
 405  00c5 d00001        	sub	a,(_adcTbl+1,x)
 406  00c8 40            	neg	a
 407                     ; 168 			m = m/4;
 409  00c9 5f            	clrw	x
 410  00ca 97            	ld	xl,a
 411  00cb 57            	sraw	x
 412  00cc 57            	sraw	x
 413  00cd 01            	rrwa	x,a
 414  00ce 6b05          	ld	(OFST-1,sp),a
 415                     ; 169 			j = adcTbl[i-1] - i16;
 417  00d0 5f            	clrw	x
 418  00d1 7b06          	ld	a,(OFST+0,sp)
 419  00d3 97            	ld	xl,a
 420  00d4 58            	sllw	x
 421  00d5 1d0002        	subw	x,#2
 422  00d8 d60001        	ld	a,(_adcTbl+1,x)
 423  00db 1003          	sub	a,(OFST-3,sp)
 424  00dd 6b04          	ld	(OFST-2,sp),a
 425                     ; 170 			k = adcTbl[i] - i16;
 427  00df 5f            	clrw	x
 428  00e0 7b06          	ld	a,(OFST+0,sp)
 429  00e2 97            	ld	xl,a
 430  00e3 58            	sllw	x
 431  00e4 d60001        	ld	a,(_adcTbl+1,x)
 432  00e7 1003          	sub	a,(OFST-3,sp)
 433  00e9 6b01          	ld	(OFST-5,sp),a
 434                     ; 171 			if( j > k )
 436  00eb 7b04          	ld	a,(OFST-2,sp)
 437  00ed 1101          	cp	a,(OFST-5,sp)
 438  00ef 2311          	jrule	L331
 439                     ; 174 				if( m > k )
 441  00f1 7b05          	ld	a,(OFST-1,sp)
 442  00f3 1101          	cp	a,(OFST-5,sp)
 443  00f5 2304          	jrule	L531
 444                     ; 176 					i = (i+2) * 2;
 446  00f7 7b06          	ld	a,(OFST+0,sp)
 447                     ; 177 					goto Exit;
 449  00f9 201c          	jp	LC002
 450  00fb               L531:
 451                     ; 179 				i = (i+2-1) * 2 + 1;
 454  00fb 7b06          	ld	a,(OFST+0,sp)
 455  00fd 48            	sll	a
 456  00fe ab03          	add	a,#3
 457                     ; 180 				goto Exit;
 459  0100 2018          	jra	L17
 460  0102               L331:
 461                     ; 185 				if( m  > j )
 463  0102 7b05          	ld	a,(OFST-1,sp)
 464  0104 1104          	cp	a,(OFST-2,sp)
 465  0106 23f3          	jrule	L531
 466                     ; 187 					i = (i+2-1) * 2;
 468  0108 7b06          	ld	a,(OFST+0,sp)
 469  010a 48            	sll	a
 470  010b ab02          	add	a,#2
 471                     ; 188 					goto Exit;
 473  010d 200b          	jra	L17
 474                     ; 190 				i = (i+2-1) * 2 + 1;
 475                     ; 191 				goto Exit;
 477  010f               L721:
 478                     ; 157 	for( i=0; i<42; i++ )
 480  010f 0c06          	inc	(OFST+0,sp)
 483  0111 7b06          	ld	a,(OFST+0,sp)
 484  0113 a12a          	cp	a,#42
 485  0115 2590          	jrult	L121
 486                     ; 195 	i = (i+2) * 2;
 488  0117               LC002:
 490  0117 48            	sll	a
 491  0118 ab04          	add	a,#4
 492  011a               L17:
 493  011a 6b06          	ld	(OFST+0,sp),a
 494                     ; 196 Exit:	
 494                     ; 197 	if( mode == 1 )
 496  011c 7b07          	ld	a,(OFST+1,sp)
 497  011e 4a            	dec	a
 498  011f 2604          	jrne	L341
 499                     ; 198 		return i;
 501  0121 7b06          	ld	a,(OFST+0,sp)
 503  0123 2075          	jra	L22
 504  0125               L341:
 505                     ; 200 	_add[_addi++] = i;
 507  0125 c60001        	ld	a,__addi
 508  0128 725c0001      	inc	__addi
 509  012c 5f            	clrw	x
 510  012d 97            	ld	xl,a
 511  012e 7b06          	ld	a,(OFST+0,sp)
 512  0130 d70000        	ld	(__add,x),a
 513                     ; 201 	if( _addi == 12 )
 515  0133 c60001        	ld	a,__addi
 516  0136 a10c          	cp	a,#12
 517  0138 2604          	jrne	L541
 518                     ; 202 		_addi = 0;
 520  013a 725f0001      	clr	__addi
 521  013e               L541:
 522                     ; 204 	j = 0;	//	min
 524  013e 0f04          	clr	(OFST-2,sp)
 525                     ; 205 	m = 0;	//	max
 527  0140 0f05          	clr	(OFST-1,sp)
 528                     ; 206 	for( i=1; i<12; i++ )
 530  0142 a601          	ld	a,#1
 531  0144 6b06          	ld	(OFST+0,sp),a
 532  0146               L741:
 533                     ; 208 		if( _add[i] < _add[j] )
 535  0146 7b04          	ld	a,(OFST-2,sp)
 536  0148 5f            	clrw	x
 537  0149 97            	ld	xl,a
 538  014a 7b06          	ld	a,(OFST+0,sp)
 539  014c ad4f          	call	LC004
 540  014e 2404          	jruge	L551
 541                     ; 209 			j = i;
 543  0150 7b06          	ld	a,(OFST+0,sp)
 544  0152 6b04          	ld	(OFST-2,sp),a
 545  0154               L551:
 546                     ; 210 		if( _add[i] > _add[m] )
 548  0154 7b05          	ld	a,(OFST-1,sp)
 549  0156 5f            	clrw	x
 550  0157 97            	ld	xl,a
 551  0158 7b06          	ld	a,(OFST+0,sp)
 552  015a ad41          	call	LC004
 553  015c 2304          	jrule	L751
 554                     ; 211 			m = i;
 556  015e 7b06          	ld	a,(OFST+0,sp)
 557  0160 6b05          	ld	(OFST-1,sp),a
 558  0162               L751:
 559                     ; 206 	for( i=1; i<12; i++ )
 561  0162 0c06          	inc	(OFST+0,sp)
 564  0164 7b06          	ld	a,(OFST+0,sp)
 565  0166 a10c          	cp	a,#12
 566  0168 25dc          	jrult	L741
 567                     ; 213 	k = 0;
 569  016a 0f01          	clr	(OFST-5,sp)
 570                     ; 214 	i16 = 0;
 572  016c 5f            	clrw	x
 573  016d 1f02          	ldw	(OFST-4,sp),x
 574                     ; 215 	for( i=0; i<12; i++ )
 576  016f 4f            	clr	a
 577  0170 6b06          	ld	(OFST+0,sp),a
 578  0172               L161:
 579                     ; 217 		if( i==j || i==m )
 581  0172 1104          	cp	a,(OFST-2,sp)
 582  0174 2713          	jreq	L361
 584  0176 1105          	cp	a,(OFST-1,sp)
 585  0178 270f          	jreq	L361
 586                     ; 219 		i16 += _add[i];
 588  017a 5f            	clrw	x
 589  017b 97            	ld	xl,a
 590  017c d60000        	ld	a,(__add,x)
 591  017f 1b03          	add	a,(OFST-3,sp)
 592  0181 6b03          	ld	(OFST-3,sp),a
 593  0183 2402          	jrnc	L02
 594  0185 0c02          	inc	(OFST-4,sp)
 595  0187               L02:
 596                     ; 220 		k++;
 598  0187 0c01          	inc	(OFST-5,sp)
 599  0189               L361:
 600                     ; 215 	for( i=0; i<12; i++ )
 602  0189 0c06          	inc	(OFST+0,sp)
 605  018b 7b06          	ld	a,(OFST+0,sp)
 606  018d a10c          	cp	a,#12
 607  018f 25e1          	jrult	L161
 608                     ; 222 	i16 = i16/k;
 610  0191 1e02          	ldw	x,(OFST-4,sp)
 611  0193 7b01          	ld	a,(OFST-5,sp)
 612  0195 62            	div	x,a
 613  0196 1f02          	ldw	(OFST-4,sp),x
 614                     ; 227 	return i16;
 616  0198 7b03          	ld	a,(OFST-3,sp)
 618  019a               L22:
 620  019a 5b07          	addw	sp,#7
 621  019c 81            	ret	
 622  019d               LC004:
 623  019d 905f          	clrw	y
 624  019f 9097          	ld	yl,a
 625  01a1 90d60000      	ld	a,(__add,y)
 626  01a5 d10000        	cp	a,(__add,x)
 627  01a8 81            	ret	
 655                     ; 230 void	systemADC(void)
 655                     ; 231 {
 656                     	switch	.text
 657  01a9               _systemADC:
 661                     ; 234 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 663  01a9 ae1001        	ldw	x,#4097
 664  01ac cd0000        	call	_CLK_PeripheralClockConfig
 666                     ; 252 	ADC_Init(
 666                     ; 253 		ADC1, 
 666                     ; 254 		ADC_ConversionMode_Continuous, 
 666                     ; 255 		ADC_Resolution_12Bit, 
 666                     ; 256 		ADC_Prescaler_2
 666                     ; 257 		);
 668  01af 4b80          	push	#128
 669  01b1 4b00          	push	#0
 670  01b3 4b04          	push	#4
 671  01b5 ae5340        	ldw	x,#21312
 672  01b8 cd0000        	call	_ADC_Init
 674  01bb 5b03          	addw	sp,#3
 675                     ; 258 	ADC_SamplingTimeConfig(
 675                     ; 259 		ADC1, 
 675                     ; 260 		ADC_Group_SlowChannels, 
 675                     ; 261 		ADC_SamplingTime_384Cycles
 675                     ; 262 		);
 677  01bd 4b07          	push	#7
 678  01bf 4b00          	push	#0
 679  01c1 ae5340        	ldw	x,#21312
 680  01c4 cd0000        	call	_ADC_SamplingTimeConfig
 682  01c7 85            	popw	x
 683                     ; 265 	ADC_Cmd(ADC1, ENABLE);
 685  01c8 4b01          	push	#1
 686  01ca ae5340        	ldw	x,#21312
 687  01cd cd0000        	call	_ADC_Cmd
 689  01d0 84            	pop	a
 690                     ; 268 	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
 692  01d1 4b01          	push	#1
 693  01d3 ae0308        	ldw	x,#776
 694  01d6 89            	pushw	x
 695  01d7 ae5340        	ldw	x,#21312
 696  01da cd0000        	call	_ADC_ChannelCmd
 698  01dd 5b03          	addw	sp,#3
 699                     ; 285 }
 702  01df 81            	ret	
 765                     	xdef	__addi
 766                     	switch	.bss
 767  0000               __add:
 768  0000 000000000000  	ds.b	12
 769                     	xdef	__add
 770                     	xdef	__adcGet
 771                     	xdef	__adci
 772  000c               __adcBuf:
 773  000c 000000000000  	ds.b	24
 774                     	xdef	__adcBuf
 775                     	xdef	_adcTbl
 776                     	xdef	_adcGet
 777                     	xdef	_systemADC
 778                     	xref	_CLK_PeripheralClockConfig
 779                     	xref	_ADC_GetFlagStatus
 780                     	xref	_ADC_GetConversionValue
 781                     	xref	_ADC_SamplingTimeConfig
 782                     	xref	_ADC_ChannelCmd
 783                     	xref	_ADC_SoftwareStartConv
 784                     	xref	_ADC_Cmd
 785                     	xref	_ADC_Init
 805                     	end
