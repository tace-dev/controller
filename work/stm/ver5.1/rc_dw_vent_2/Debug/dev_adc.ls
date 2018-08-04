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
  67  0000               __adci:
  68  0000 00            	dc.b	0
 139                     ; 60 uint16_t	_adcGet(void)
 139                     ; 61 {
 140                     .text:	section	.text,new
 141  0000               f__adcGet:
 143  0000 5206          	subw	sp,#6
 144       00000006      OFST:	set	6
 147                     ; 149 	_ADC_GET(i16);
 149  0002 ae5340        	ldw	x,#21312
 150  0005 8d000000      	callf	f_ADC_SoftwareStartConv
 153  0009               L73:
 156  0009 4b01          	push	#1
 157  000b ae5340        	ldw	x,#21312
 158  000e 8d000000      	callf	f_ADC_GetFlagStatus
 160  0012 5b01          	addw	sp,#1
 161  0014 4d            	tnz	a
 162  0015 27f2          	jreq	L73
 165  0017 ae5340        	ldw	x,#21312
 166  001a 8d000000      	callf	f_ADC_GetConversionValue
 168  001e 1f02          	ldw	(OFST-4,sp),x
 169                     ; 150 	_adci++;
 172  0020 725c0000      	inc	__adci
 173                     ; 151 	if( _adci == 12 )
 175  0024 c60000        	ld	a,__adci
 176  0027 a10c          	cp	a,#12
 177  0029 2604          	jrne	L34
 178                     ; 152 		_adci = 0;
 180  002b 725f0000      	clr	__adci
 181  002f               L34:
 182                     ; 153 	_adcBuf[_adci] = i16; 
 184  002f c60000        	ld	a,__adci
 185  0032 5f            	clrw	x
 186  0033 97            	ld	xl,a
 187  0034 58            	sllw	x
 188  0035 1602          	ldw	y,(OFST-4,sp)
 189  0037 df000e        	ldw	(__adcBuf,x),y
 190                     ; 155 	k = min = max = 0;
 192  003a 0f05          	clr	(OFST-1,sp)
 193  003c 0f04          	clr	(OFST-2,sp)
 194  003e 0f01          	clr	(OFST-5,sp)
 195                     ; 156 	for( i=1; i<12; i++ )
 197  0040 a601          	ld	a,#1
 198  0042 6b06          	ld	(OFST+0,sp),a
 199  0044               L54:
 200                     ; 158 		if( _adcBuf[i] < _adcBuf[min] )
 202  0044 5f            	clrw	x
 203  0045 97            	ld	xl,a
 204  0046 58            	sllw	x
 205  0047 7b04          	ld	a,(OFST-2,sp)
 206  0049 8d950095      	callf	LC001
 207  004d 2404          	jruge	L35
 208                     ; 159 			min = i;
 210  004f 7b06          	ld	a,(OFST+0,sp)
 211  0051 6b04          	ld	(OFST-2,sp),a
 212  0053               L35:
 213                     ; 160 		if( _adcBuf[i] > _adcBuf[max] )
 215  0053 7b06          	ld	a,(OFST+0,sp)
 216  0055 5f            	clrw	x
 217  0056 97            	ld	xl,a
 218  0057 58            	sllw	x
 219  0058 7b05          	ld	a,(OFST-1,sp)
 220  005a 8d950095      	callf	LC001
 221  005e 2304          	jrule	L55
 222                     ; 161 			max = i;
 224  0060 7b06          	ld	a,(OFST+0,sp)
 225  0062 6b05          	ld	(OFST-1,sp),a
 226  0064               L55:
 227                     ; 156 	for( i=1; i<12; i++ )
 229  0064 0c06          	inc	(OFST+0,sp)
 232  0066 7b06          	ld	a,(OFST+0,sp)
 233  0068 a10c          	cp	a,#12
 234  006a 25d8          	jrult	L54
 235                     ; 163 	i16 = 0;
 237  006c 5f            	clrw	x
 238  006d 1f02          	ldw	(OFST-4,sp),x
 239                     ; 164 	for( i=0; i<12; i++ )
 241  006f 4f            	clr	a
 242  0070 6b06          	ld	(OFST+0,sp),a
 243  0072               L75:
 244                     ; 166 		if( i==min || i==max )
 246  0072 1104          	cp	a,(OFST-2,sp)
 247  0074 2711          	jreq	L16
 249  0076 1105          	cp	a,(OFST-1,sp)
 250  0078 270d          	jreq	L16
 251                     ; 168 		i16 += _adcBuf[i];
 253  007a 5f            	clrw	x
 254  007b 97            	ld	xl,a
 255  007c 58            	sllw	x
 256  007d de000e        	ldw	x,(__adcBuf,x)
 257  0080 72fb02        	addw	x,(OFST-4,sp)
 258  0083 1f02          	ldw	(OFST-4,sp),x
 259                     ; 169 		k++;
 261  0085 0c01          	inc	(OFST-5,sp)
 262  0087               L16:
 263                     ; 164 	for( i=0; i<12; i++ )
 265  0087 0c06          	inc	(OFST+0,sp)
 268  0089 7b06          	ld	a,(OFST+0,sp)
 269  008b a10c          	cp	a,#12
 270  008d 25e3          	jrult	L75
 271                     ; 171 	i16 = i16/k;
 273  008f 7b01          	ld	a,(OFST-5,sp)
 274  0091 62            	div	x,a
 275                     ; 172 	return i16;
 279  0092 5b06          	addw	sp,#6
 280  0094 87            	retf	
 281  0095               LC001:
 282  0095 905f          	clrw	y
 283  0097 9097          	ld	yl,a
 284  0099 9058          	sllw	y
 285  009b de000e        	ldw	x,(__adcBuf,x)
 286  009e 90d3000e      	cpw	x,(__adcBuf,y)
 287  00a2 87            	retf	
 289                     	switch	.data
 290  0001               __addi:
 291  0001 00            	dc.b	0
 360                     ; 182 uint8_t	adcGet(uint8_t mode)
 360                     ; 183 {
 361                     .text:	section	.text,new
 362  0000               f_adcGet:
 364  0000 88            	push	a
 365  0001 5206          	subw	sp,#6
 366       00000006      OFST:	set	6
 369                     ; 188 	i16 = _adcGet();
 371  0003 8d000000      	callf	f__adcGet
 373                     ; 190 	if( i16 > 2932 )
 375  0007 a30b75        	cpw	x,#2933
 376  000a 2503          	jrult	L121
 377                     ; 191 		i16 = 2932;
 379  000c ae0b74        	ldw	x,#2932
 380  000f               L121:
 381  000f 1f03          	ldw	(OFST-3,sp),x
 382                     ; 192 	for( i=0; i<42; i++ )
 384  0011 4f            	clr	a
 385  0012 6b06          	ld	(OFST+0,sp),a
 386  0014               L321:
 387                     ; 194 		if( i16 >= adcTbl[i] )
 389  0014 5f            	clrw	x
 390  0015 97            	ld	xl,a
 391  0016 58            	sllw	x
 392  0017 de0000        	ldw	x,(_adcTbl,x)
 393  001a 1303          	cpw	x,(OFST-3,sp)
 394  001c 225e          	jrugt	L131
 395                     ; 196 			if( i==0 )
 397  001e 7b06          	ld	a,(OFST+0,sp)
 398                     ; 198 				i = (i+2) * 2;
 399                     ; 199 				goto Exit;
 401  0020 2762          	jreq	LC002
 402                     ; 202 			m = adcTbl[i-1] - adcTbl[i];
 404  0022 5f            	clrw	x
 405  0023 97            	ld	xl,a
 406  0024 58            	sllw	x
 407  0025 1d0002        	subw	x,#2
 408  0028 905f          	clrw	y
 409  002a 9097          	ld	yl,a
 410  002c 9058          	sllw	y
 411  002e 90d60001      	ld	a,(_adcTbl+1,y)
 412  0032 d00001        	sub	a,(_adcTbl+1,x)
 413  0035 40            	neg	a
 414                     ; 203 			m = m/4;
 416  0036 5f            	clrw	x
 417  0037 97            	ld	xl,a
 418  0038 57            	sraw	x
 419  0039 57            	sraw	x
 420  003a 01            	rrwa	x,a
 421  003b 6b05          	ld	(OFST-1,sp),a
 422                     ; 204 			j = adcTbl[i-1] - i16;
 424  003d 5f            	clrw	x
 425  003e 7b06          	ld	a,(OFST+0,sp)
 426  0040 97            	ld	xl,a
 427  0041 58            	sllw	x
 428  0042 1d0002        	subw	x,#2
 429  0045 d60001        	ld	a,(_adcTbl+1,x)
 430  0048 1004          	sub	a,(OFST-2,sp)
 431  004a 6b02          	ld	(OFST-4,sp),a
 432                     ; 205 			k = adcTbl[i] - i16;
 434  004c 5f            	clrw	x
 435  004d 7b06          	ld	a,(OFST+0,sp)
 436  004f 97            	ld	xl,a
 437  0050 58            	sllw	x
 438  0051 d60001        	ld	a,(_adcTbl+1,x)
 439  0054 1004          	sub	a,(OFST-2,sp)
 440  0056 6b01          	ld	(OFST-5,sp),a
 441                     ; 206 			if( j > k )
 443  0058 7b02          	ld	a,(OFST-4,sp)
 444  005a 1101          	cp	a,(OFST-5,sp)
 445  005c 2311          	jrule	L531
 446                     ; 209 				if( m > k )
 448  005e 7b05          	ld	a,(OFST-1,sp)
 449  0060 1101          	cp	a,(OFST-5,sp)
 450  0062 2304          	jrule	L731
 451                     ; 211 					i = (i+2) * 2;
 453  0064 7b06          	ld	a,(OFST+0,sp)
 454                     ; 212 					goto Exit;
 456  0066 201c          	jpf	LC002
 457  0068               L731:
 458                     ; 214 				i = (i+2-1) * 2 + 1;
 461  0068 7b06          	ld	a,(OFST+0,sp)
 462  006a 48            	sll	a
 463  006b ab03          	add	a,#3
 464                     ; 215 				goto Exit;
 466  006d 2018          	jra	L17
 467  006f               L531:
 468                     ; 220 				if( m  > j )
 470  006f 7b05          	ld	a,(OFST-1,sp)
 471  0071 1102          	cp	a,(OFST-4,sp)
 472  0073 23f3          	jrule	L731
 473                     ; 222 					i = (i+2-1) * 2;
 475  0075 7b06          	ld	a,(OFST+0,sp)
 476  0077 48            	sll	a
 477  0078 ab02          	add	a,#2
 478                     ; 223 					goto Exit;
 480  007a 200b          	jra	L17
 481                     ; 225 				i = (i+2-1) * 2 + 1;
 482                     ; 226 				goto Exit;
 484  007c               L131:
 485                     ; 192 	for( i=0; i<42; i++ )
 487  007c 0c06          	inc	(OFST+0,sp)
 490  007e 7b06          	ld	a,(OFST+0,sp)
 491  0080 a12a          	cp	a,#42
 492  0082 2590          	jrult	L321
 493                     ; 230 	i = (i+2) * 2;
 495  0084               LC002:
 497  0084 48            	sll	a
 498  0085 ab04          	add	a,#4
 499  0087               L17:
 500  0087 6b06          	ld	(OFST+0,sp),a
 501                     ; 231 Exit:	
 501                     ; 232 	if( mode == 1 )
 503  0089 7b07          	ld	a,(OFST+1,sp)
 504  008b 4a            	dec	a
 505  008c 2606          	jrne	L541
 506                     ; 233 		return i;
 508  008e 7b06          	ld	a,(OFST+0,sp)
 510  0090 ac1b011b      	jra	L22
 511  0094               L541:
 512                     ; 235 	_add[_addi++] = i;
 514  0094 c60001        	ld	a,__addi
 515  0097 725c0001      	inc	__addi
 516  009b 5f            	clrw	x
 517  009c 97            	ld	xl,a
 518  009d 7b06          	ld	a,(OFST+0,sp)
 519  009f d70000        	ld	(__add,x),a
 520                     ; 236 	if( _addi == 12 )
 522  00a2 c60001        	ld	a,__addi
 523  00a5 a10c          	cp	a,#12
 524  00a7 2604          	jrne	L741
 525                     ; 237 		_addi = 0;
 527  00a9 725f0001      	clr	__addi
 528  00ad               L741:
 529                     ; 239 	j = 0;	//	min
 531  00ad 0f02          	clr	(OFST-4,sp)
 532                     ; 240 	m = 0;	//	max
 534  00af 0f05          	clr	(OFST-1,sp)
 535                     ; 241 	for( i=1; i<12; i++ )
 537  00b1 a601          	ld	a,#1
 538  00b3 6b06          	ld	(OFST+0,sp),a
 539  00b5               L151:
 540                     ; 243 		if( _add[i] < _add[j] )
 542  00b5 7b02          	ld	a,(OFST-4,sp)
 543  00b7 5f            	clrw	x
 544  00b8 97            	ld	xl,a
 545  00b9 7b06          	ld	a,(OFST+0,sp)
 546  00bb 905f          	clrw	y
 547  00bd 9097          	ld	yl,a
 548  00bf 90d60000      	ld	a,(__add,y)
 549  00c3 d10000        	cp	a,(__add,x)
 550  00c6 2404          	jruge	L751
 551                     ; 244 			j = i;
 553  00c8 7b06          	ld	a,(OFST+0,sp)
 554  00ca 6b02          	ld	(OFST-4,sp),a
 555  00cc               L751:
 556                     ; 245 		if( _add[i] > _add[m] )
 558  00cc 7b05          	ld	a,(OFST-1,sp)
 559  00ce 5f            	clrw	x
 560  00cf 97            	ld	xl,a
 561  00d0 7b06          	ld	a,(OFST+0,sp)
 562  00d2 905f          	clrw	y
 563  00d4 9097          	ld	yl,a
 564  00d6 90d60000      	ld	a,(__add,y)
 565  00da d10000        	cp	a,(__add,x)
 566  00dd 2304          	jrule	L161
 567                     ; 246 			m = i;
 569  00df 7b06          	ld	a,(OFST+0,sp)
 570  00e1 6b05          	ld	(OFST-1,sp),a
 571  00e3               L161:
 572                     ; 241 	for( i=1; i<12; i++ )
 574  00e3 0c06          	inc	(OFST+0,sp)
 577  00e5 7b06          	ld	a,(OFST+0,sp)
 578  00e7 a10c          	cp	a,#12
 579  00e9 25ca          	jrult	L151
 580                     ; 248 	k = 0;
 582  00eb 0f01          	clr	(OFST-5,sp)
 583                     ; 249 	i16 = 0;
 585  00ed 5f            	clrw	x
 586  00ee 1f03          	ldw	(OFST-3,sp),x
 587                     ; 250 	for( i=0; i<12; i++ )
 589  00f0 4f            	clr	a
 590  00f1 6b06          	ld	(OFST+0,sp),a
 591  00f3               L361:
 592                     ; 252 		if( i==j || i==m )
 594  00f3 1102          	cp	a,(OFST-4,sp)
 595  00f5 2713          	jreq	L561
 597  00f7 1105          	cp	a,(OFST-1,sp)
 598  00f9 270f          	jreq	L561
 599                     ; 254 		i16 += _add[i];
 601  00fb 5f            	clrw	x
 602  00fc 97            	ld	xl,a
 603  00fd d60000        	ld	a,(__add,x)
 604  0100 1b04          	add	a,(OFST-2,sp)
 605  0102 6b04          	ld	(OFST-2,sp),a
 606  0104 2402          	jrnc	L02
 607  0106 0c03          	inc	(OFST-3,sp)
 608  0108               L02:
 609                     ; 255 		k++;
 611  0108 0c01          	inc	(OFST-5,sp)
 612  010a               L561:
 613                     ; 250 	for( i=0; i<12; i++ )
 615  010a 0c06          	inc	(OFST+0,sp)
 618  010c 7b06          	ld	a,(OFST+0,sp)
 619  010e a10c          	cp	a,#12
 620  0110 25e1          	jrult	L361
 621                     ; 257 	i16 = i16/k;
 623  0112 1e03          	ldw	x,(OFST-3,sp)
 624  0114 7b01          	ld	a,(OFST-5,sp)
 625  0116 62            	div	x,a
 626  0117 1f03          	ldw	(OFST-3,sp),x
 627                     ; 262 	return i16;
 629  0119 7b04          	ld	a,(OFST-2,sp)
 631  011b               L22:
 633  011b 5b07          	addw	sp,#7
 634  011d 87            	retf	
 661                     ; 265 void	systemADC(void)
 661                     ; 266 {
 662                     .text:	section	.text,new
 663  0000               f_systemADC:
 667                     ; 269 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 669  0000 ae1001        	ldw	x,#4097
 670  0003 8d000000      	callf	f_CLK_PeripheralClockConfig
 672                     ; 287 	ADC_Init(
 672                     ; 288 		ADC1, 
 672                     ; 289 		ADC_ConversionMode_Continuous, 
 672                     ; 290 		ADC_Resolution_12Bit, 
 672                     ; 291 		ADC_Prescaler_2
 672                     ; 292 		);
 674  0007 4b80          	push	#128
 675  0009 4b00          	push	#0
 676  000b 4b04          	push	#4
 677  000d ae5340        	ldw	x,#21312
 678  0010 8d000000      	callf	f_ADC_Init
 680  0014 5b03          	addw	sp,#3
 681                     ; 293 	ADC_SamplingTimeConfig(
 681                     ; 294 		ADC1, 
 681                     ; 295 		ADC_Group_SlowChannels, 
 681                     ; 296 		ADC_SamplingTime_384Cycles
 681                     ; 297 		);
 683  0016 4b07          	push	#7
 684  0018 4b00          	push	#0
 685  001a ae5340        	ldw	x,#21312
 686  001d 8d000000      	callf	f_ADC_SamplingTimeConfig
 688  0021 85            	popw	x
 689                     ; 300 	ADC_Cmd(ADC1, ENABLE);
 691  0022 4b01          	push	#1
 692  0024 ae5340        	ldw	x,#21312
 693  0027 8d000000      	callf	f_ADC_Cmd
 695  002b 84            	pop	a
 696                     ; 303 	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
 698  002c 4b01          	push	#1
 699  002e ae0308        	ldw	x,#776
 700  0031 89            	pushw	x
 701  0032 ae5340        	ldw	x,#21312
 702  0035 8d000000      	callf	f_ADC_ChannelCmd
 704  0039 5b03          	addw	sp,#3
 705                     ; 320 }
 708  003b 87            	retf	
 777                     	xdef	__addi
 778                     	switch	.bss
 779  0000               __add:
 780  0000 000000000000  	ds.b	12
 781                     	xdef	__add
 782                     	xdef	f__adcGet
 783  000c               ___di:
 784  000c 0000          	ds.b	2
 785                     	xdef	___di
 786                     	xdef	__adci
 787  000e               __adcBuf:
 788  000e 000000000000  	ds.b	24
 789                     	xdef	__adcBuf
 790                     	xdef	_adcTbl
 791                     	xdef	f_adcGet
 792                     	xdef	f_systemADC
 793                     	xref	f_CLK_PeripheralClockConfig
 794                     	xref	f_ADC_GetFlagStatus
 795                     	xref	f_ADC_GetConversionValue
 796                     	xref	f_ADC_SamplingTimeConfig
 797                     	xref	f_ADC_ChannelCmd
 798                     	xref	f_ADC_SoftwareStartConv
 799                     	xref	f_ADC_Cmd
 800                     	xref	f_ADC_Init
 820                     	end
