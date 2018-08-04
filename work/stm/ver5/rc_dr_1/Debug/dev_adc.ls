   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
 141                     .text:	section	.text,new
 142  0000               __adcGet:
 144  0000 5206          	subw	sp,#6
 145       00000006      OFST:	set	6
 148                     ; 149 	_ADC_GET(i16);
 150  0002 ae5340        	ldw	x,#21312
 151  0005 cd0000        	call	_ADC_SoftwareStartConv
 154  0008               L73:
 157  0008 4b01          	push	#1
 158  000a ae5340        	ldw	x,#21312
 159  000d cd0000        	call	_ADC_GetFlagStatus
 161  0010 5b01          	addw	sp,#1
 162  0012 4d            	tnz	a
 163  0013 27f3          	jreq	L73
 166  0015 ae5340        	ldw	x,#21312
 167  0018 cd0000        	call	_ADC_GetConversionValue
 169  001b 1f02          	ldw	(OFST-4,sp),x
 171                     ; 150 	_adci++;
 174  001d 725c0000      	inc	__adci
 175                     ; 151 	if( _adci == 12 )
 177  0021 c60000        	ld	a,__adci
 178  0024 a10c          	cp	a,#12
 179  0026 2604          	jrne	L34
 180                     ; 152 		_adci = 0;
 182  0028 725f0000      	clr	__adci
 183  002c               L34:
 184                     ; 153 	_adcBuf[_adci] = i16; 
 186  002c c60000        	ld	a,__adci
 187  002f 5f            	clrw	x
 188  0030 97            	ld	xl,a
 189  0031 58            	sllw	x
 190  0032 1602          	ldw	y,(OFST-4,sp)
 191  0034 df000e        	ldw	(__adcBuf,x),y
 192                     ; 155 	k = min = max = 0;
 194  0037 0f05          	clr	(OFST-1,sp)
 196  0039 0f04          	clr	(OFST-2,sp)
 198  003b 0f01          	clr	(OFST-5,sp)
 200                     ; 156 	for( i=1; i<12; i++ )
 202  003d a601          	ld	a,#1
 203  003f 6b06          	ld	(OFST+0,sp),a
 205  0041               L54:
 206                     ; 158 		if( _adcBuf[i] < _adcBuf[min] )
 208  0041 5f            	clrw	x
 209  0042 97            	ld	xl,a
 210  0043 58            	sllw	x
 211  0044 7b04          	ld	a,(OFST-2,sp)
 212  0046 ad46          	call	LC001
 213  0048 2404          	jruge	L35
 214                     ; 159 			min = i;
 216  004a 7b06          	ld	a,(OFST+0,sp)
 217  004c 6b04          	ld	(OFST-2,sp),a
 219  004e               L35:
 220                     ; 160 		if( _adcBuf[i] > _adcBuf[max] )
 222  004e 7b06          	ld	a,(OFST+0,sp)
 223  0050 5f            	clrw	x
 224  0051 97            	ld	xl,a
 225  0052 58            	sllw	x
 226  0053 7b05          	ld	a,(OFST-1,sp)
 227  0055 ad37          	call	LC001
 228  0057 2304          	jrule	L55
 229                     ; 161 			max = i;
 231  0059 7b06          	ld	a,(OFST+0,sp)
 232  005b 6b05          	ld	(OFST-1,sp),a
 234  005d               L55:
 235                     ; 156 	for( i=1; i<12; i++ )
 237  005d 0c06          	inc	(OFST+0,sp)
 241  005f 7b06          	ld	a,(OFST+0,sp)
 242  0061 a10c          	cp	a,#12
 243  0063 25dc          	jrult	L54
 244                     ; 163 	i16 = 0;
 246  0065 5f            	clrw	x
 247  0066 1f02          	ldw	(OFST-4,sp),x
 249                     ; 164 	for( i=0; i<12; i++ )
 251  0068 4f            	clr	a
 252  0069 6b06          	ld	(OFST+0,sp),a
 254  006b               L75:
 255                     ; 166 		if( i==min || i==max )
 257  006b 1104          	cp	a,(OFST-2,sp)
 258  006d 2711          	jreq	L16
 260  006f 1105          	cp	a,(OFST-1,sp)
 261  0071 270d          	jreq	L16
 262                     ; 168 		i16 += _adcBuf[i];
 264  0073 5f            	clrw	x
 265  0074 97            	ld	xl,a
 266  0075 58            	sllw	x
 267  0076 de000e        	ldw	x,(__adcBuf,x)
 268  0079 72fb02        	addw	x,(OFST-4,sp)
 269  007c 1f02          	ldw	(OFST-4,sp),x
 271                     ; 169 		k++;
 273  007e 0c01          	inc	(OFST-5,sp)
 275  0080               L16:
 276                     ; 164 	for( i=0; i<12; i++ )
 278  0080 0c06          	inc	(OFST+0,sp)
 282  0082 7b06          	ld	a,(OFST+0,sp)
 283  0084 a10c          	cp	a,#12
 284  0086 25e3          	jrult	L75
 285                     ; 171 	i16 = i16/k;
 287  0088 7b01          	ld	a,(OFST-5,sp)
 288  008a 62            	div	x,a
 290                     ; 172 	return i16;
 294  008b 5b06          	addw	sp,#6
 295  008d 81            	ret	
 296  008e               LC001:
 297  008e 905f          	clrw	y
 298  0090 9097          	ld	yl,a
 299  0092 9058          	sllw	y
 300  0094 de000e        	ldw	x,(__adcBuf,x)
 301  0097 90d3000e      	cpw	x,(__adcBuf,y)
 302  009b 81            	ret	
 305                     	switch	.data
 306  0001               __addi:
 307  0001 00            	dc.b	0
 376                     ; 182 uint8_t	adcGet(uint8_t mode)
 376                     ; 183 {
 377                     .text:	section	.text,new
 378  0000               _adcGet:
 380  0000 88            	push	a
 381  0001 5206          	subw	sp,#6
 382       00000006      OFST:	set	6
 385                     ; 188 	i16 = _adcGet();
 387  0003 cd0000        	call	__adcGet
 390                     ; 190 	if( i16 > 2932 )
 392  0006 a30b75        	cpw	x,#2933
 393  0009 2503          	jrult	L121
 394                     ; 191 		i16 = 2932;
 396  000b ae0b74        	ldw	x,#2932
 398  000e               L121:
 399  000e 1f03          	ldw	(OFST-3,sp),x
 400                     ; 192 	for( i=0; i<42; i++ )
 402  0010 4f            	clr	a
 403  0011 6b06          	ld	(OFST+0,sp),a
 405  0013               L321:
 406                     ; 194 		if( i16 >= adcTbl[i] )
 408  0013 5f            	clrw	x
 409  0014 97            	ld	xl,a
 410  0015 58            	sllw	x
 411  0016 de0000        	ldw	x,(_adcTbl,x)
 412  0019 1303          	cpw	x,(OFST-3,sp)
 413  001b 2259          	jrugt	L131
 414                     ; 196 			if( i==0 )
 416  001d 7b06          	ld	a,(OFST+0,sp)
 417                     ; 198 				i = (i+2) * 2;
 418                     ; 199 				goto Exit;
 420  001f 275d          	jreq	LC002
 421                     ; 202 			m = adcTbl[i-1] - adcTbl[i];
 423  0021 5f            	clrw	x
 424  0022 97            	ld	xl,a
 425  0023 5a            	decw	x
 426  0024 58            	sllw	x
 427  0025 905f          	clrw	y
 428  0027 9097          	ld	yl,a
 429  0029 9058          	sllw	y
 430  002b 90d60001      	ld	a,(_adcTbl+1,y)
 431  002f d00001        	sub	a,(_adcTbl+1,x)
 432  0032 40            	neg	a
 434                     ; 203 			m = m/4;
 436  0033 5f            	clrw	x
 437  0034 97            	ld	xl,a
 438  0035 57            	sraw	x
 439  0036 57            	sraw	x
 440  0037 01            	rrwa	x,a
 441  0038 6b05          	ld	(OFST-1,sp),a
 443                     ; 204 			j = adcTbl[i-1] - i16;
 445  003a 5f            	clrw	x
 446  003b 7b06          	ld	a,(OFST+0,sp)
 447  003d 97            	ld	xl,a
 448  003e 5a            	decw	x
 449  003f 58            	sllw	x
 450  0040 d60001        	ld	a,(_adcTbl+1,x)
 451  0043 1004          	sub	a,(OFST-2,sp)
 452  0045 6b02          	ld	(OFST-4,sp),a
 454                     ; 205 			k = adcTbl[i] - i16;
 456  0047 5f            	clrw	x
 457  0048 7b06          	ld	a,(OFST+0,sp)
 458  004a 97            	ld	xl,a
 459  004b 58            	sllw	x
 460  004c d60001        	ld	a,(_adcTbl+1,x)
 461  004f 1004          	sub	a,(OFST-2,sp)
 462  0051 6b01          	ld	(OFST-5,sp),a
 464                     ; 206 			if( j > k )
 466  0053 7b02          	ld	a,(OFST-4,sp)
 467  0055 1101          	cp	a,(OFST-5,sp)
 468  0057 2311          	jrule	L531
 469                     ; 209 				if( m > k )
 471  0059 7b05          	ld	a,(OFST-1,sp)
 472  005b 1101          	cp	a,(OFST-5,sp)
 473  005d 2304          	jrule	L731
 474                     ; 211 					i = (i+2) * 2;
 476  005f 7b06          	ld	a,(OFST+0,sp)
 477                     ; 212 					goto Exit;
 479  0061 201b          	jp	LC002
 480  0063               L731:
 481                     ; 214 				i = (i+2-1) * 2 + 1;
 484  0063 7b06          	ld	a,(OFST+0,sp)
 485  0065 48            	sll	a
 486  0066 ab03          	add	a,#3
 487                     ; 215 				goto Exit;
 489  0068 2017          	jra	L17
 490  006a               L531:
 491                     ; 220 				if( m  > j )
 493  006a 7b05          	ld	a,(OFST-1,sp)
 494  006c 1102          	cp	a,(OFST-4,sp)
 495  006e 23f3          	jrule	L731
 496                     ; 222 					i = (i+2-1) * 2;
 498  0070 7b06          	ld	a,(OFST+0,sp)
 499  0072 4c            	inc	a
 500  0073 48            	sll	a
 501                     ; 223 					goto Exit;
 503  0074 200b          	jra	L17
 504                     ; 225 				i = (i+2-1) * 2 + 1;
 505                     ; 226 				goto Exit;
 507  0076               L131:
 508                     ; 192 	for( i=0; i<42; i++ )
 510  0076 0c06          	inc	(OFST+0,sp)
 514  0078 7b06          	ld	a,(OFST+0,sp)
 515  007a a12a          	cp	a,#42
 516  007c 2595          	jrult	L321
 517                     ; 230 	i = (i+2) * 2;
 519  007e               LC002:
 521  007e 48            	sll	a
 522  007f ab04          	add	a,#4
 523  0081               L17:
 524  0081 6b06          	ld	(OFST+0,sp),a
 526                     ; 231 Exit:	
 526                     ; 232 	if( mode == 1 )
 528  0083 7b07          	ld	a,(OFST+1,sp)
 529  0085 4a            	dec	a
 530  0086 2605          	jrne	L541
 531                     ; 233 		return i;
 533  0088 7b06          	ld	a,(OFST+0,sp)
 535  008a cc0110        	jra	L22
 536  008d               L541:
 537                     ; 235 	_add[_addi++] = i;
 539  008d c60001        	ld	a,__addi
 540  0090 725c0001      	inc	__addi
 541  0094 5f            	clrw	x
 542  0095 97            	ld	xl,a
 543  0096 7b06          	ld	a,(OFST+0,sp)
 544  0098 d70000        	ld	(__add,x),a
 545                     ; 236 	if( _addi == 12 )
 547  009b c60001        	ld	a,__addi
 548  009e a10c          	cp	a,#12
 549  00a0 2604          	jrne	L741
 550                     ; 237 		_addi = 0;
 552  00a2 725f0001      	clr	__addi
 553  00a6               L741:
 554                     ; 239 	j = 0;	//	min
 556  00a6 0f02          	clr	(OFST-4,sp)
 558                     ; 240 	m = 0;	//	max
 560  00a8 0f05          	clr	(OFST-1,sp)
 562                     ; 241 	for( i=1; i<12; i++ )
 564  00aa a601          	ld	a,#1
 565  00ac 6b06          	ld	(OFST+0,sp),a
 567  00ae               L151:
 568                     ; 243 		if( _add[i] < _add[j] )
 570  00ae 7b02          	ld	a,(OFST-4,sp)
 571  00b0 5f            	clrw	x
 572  00b1 97            	ld	xl,a
 573  00b2 7b06          	ld	a,(OFST+0,sp)
 574  00b4 ad5d          	call	LC004
 575  00b6 2404          	jruge	L751
 576                     ; 244 			j = i;
 578  00b8 7b06          	ld	a,(OFST+0,sp)
 579  00ba 6b02          	ld	(OFST-4,sp),a
 581  00bc               L751:
 582                     ; 245 		if( _add[i] > _add[m] )
 584  00bc 7b05          	ld	a,(OFST-1,sp)
 585  00be 5f            	clrw	x
 586  00bf 97            	ld	xl,a
 587  00c0 7b06          	ld	a,(OFST+0,sp)
 588  00c2 ad4f          	call	LC004
 589  00c4 2304          	jrule	L161
 590                     ; 246 			m = i;
 592  00c6 7b06          	ld	a,(OFST+0,sp)
 593  00c8 6b05          	ld	(OFST-1,sp),a
 595  00ca               L161:
 596                     ; 241 	for( i=1; i<12; i++ )
 598  00ca 0c06          	inc	(OFST+0,sp)
 602  00cc 7b06          	ld	a,(OFST+0,sp)
 603  00ce a10c          	cp	a,#12
 604  00d0 25dc          	jrult	L151
 605                     ; 248 	k = 0;
 607  00d2 0f01          	clr	(OFST-5,sp)
 609                     ; 249 	i16 = 0;
 611  00d4 5f            	clrw	x
 612  00d5 1f03          	ldw	(OFST-3,sp),x
 614                     ; 250 	for( i=0; i<12; i++ )
 616  00d7 4f            	clr	a
 617  00d8 6b06          	ld	(OFST+0,sp),a
 619  00da               L361:
 620                     ; 252 		if( i==j || i==m )
 622  00da 1102          	cp	a,(OFST-4,sp)
 623  00dc 2713          	jreq	L561
 625  00de 1105          	cp	a,(OFST-1,sp)
 626  00e0 270f          	jreq	L561
 627                     ; 254 		i16 += _add[i];
 629  00e2 5f            	clrw	x
 630  00e3 97            	ld	xl,a
 631  00e4 d60000        	ld	a,(__add,x)
 632  00e7 1b04          	add	a,(OFST-2,sp)
 633  00e9 6b04          	ld	(OFST-2,sp),a
 634  00eb 2402          	jrnc	L02
 635  00ed 0c03          	inc	(OFST-3,sp)
 636  00ef               L02:
 638                     ; 255 		k++;
 640  00ef 0c01          	inc	(OFST-5,sp)
 642  00f1               L561:
 643                     ; 250 	for( i=0; i<12; i++ )
 645  00f1 0c06          	inc	(OFST+0,sp)
 649  00f3 7b06          	ld	a,(OFST+0,sp)
 650  00f5 a10c          	cp	a,#12
 651  00f7 25e1          	jrult	L361
 652                     ; 257 	i16 = i16/k;
 654  00f9 1e03          	ldw	x,(OFST-3,sp)
 655  00fb 7b01          	ld	a,(OFST-5,sp)
 656  00fd 62            	div	x,a
 657  00fe 1f03          	ldw	(OFST-3,sp),x
 659                     ; 259 	if( (i16%2) == 1 )
 661  0100 7b04          	ld	a,(OFST-2,sp)
 662  0102 a401          	and	a,#1
 663  0104 5f            	clrw	x
 664  0105 02            	rlwa	x,a
 665  0106 5a            	decw	x
 666  0107 2605          	jrne	L571
 667                     ; 260 		i16--;
 669  0109 1e03          	ldw	x,(OFST-3,sp)
 670  010b 5a            	decw	x
 671  010c 1f03          	ldw	(OFST-3,sp),x
 673  010e               L571:
 674                     ; 262 	return i16;
 676  010e 7b04          	ld	a,(OFST-2,sp)
 678  0110               L22:
 680  0110 5b07          	addw	sp,#7
 681  0112 81            	ret	
 682  0113               LC004:
 683  0113 905f          	clrw	y
 684  0115 9097          	ld	yl,a
 685  0117 90d60000      	ld	a,(__add,y)
 686  011b d10000        	cp	a,(__add,x)
 687  011e 81            	ret	
 715                     ; 265 void	systemADC(void)
 715                     ; 266 {
 716                     .text:	section	.text,new
 717  0000               _systemADC:
 721                     ; 269 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 723  0000 ae1001        	ldw	x,#4097
 724  0003 cd0000        	call	_CLK_PeripheralClockConfig
 726                     ; 287 	ADC_Init(
 726                     ; 288 		ADC1, 
 726                     ; 289 		ADC_ConversionMode_Continuous, 
 726                     ; 290 		ADC_Resolution_12Bit, 
 726                     ; 291 		ADC_Prescaler_2
 726                     ; 292 		);
 728  0006 4b80          	push	#128
 729  0008 4b00          	push	#0
 730  000a 4b04          	push	#4
 731  000c ae5340        	ldw	x,#21312
 732  000f cd0000        	call	_ADC_Init
 734  0012 5b03          	addw	sp,#3
 735                     ; 293 	ADC_SamplingTimeConfig(
 735                     ; 294 		ADC1, 
 735                     ; 295 		ADC_Group_SlowChannels, 
 735                     ; 296 		ADC_SamplingTime_384Cycles
 735                     ; 297 		);
 737  0014 4b07          	push	#7
 738  0016 4b00          	push	#0
 739  0018 ae5340        	ldw	x,#21312
 740  001b cd0000        	call	_ADC_SamplingTimeConfig
 742  001e 85            	popw	x
 743                     ; 300 	ADC_Cmd(ADC1, ENABLE);
 745  001f 4b01          	push	#1
 746  0021 ae5340        	ldw	x,#21312
 747  0024 cd0000        	call	_ADC_Cmd
 749  0027 84            	pop	a
 750                     ; 303 	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
 752  0028 4b01          	push	#1
 753  002a ae0308        	ldw	x,#776
 754  002d 89            	pushw	x
 755  002e ae5340        	ldw	x,#21312
 756  0031 cd0000        	call	_ADC_ChannelCmd
 758  0034 5b03          	addw	sp,#3
 759                     ; 320 }
 762  0036 81            	ret	
 832                     	xdef	__addi
 833                     	switch	.bss
 834  0000               __add:
 835  0000 000000000000  	ds.b	12
 836                     	xdef	__add
 837                     	xdef	__adcGet
 838  000c               ___di:
 839  000c 0000          	ds.b	2
 840                     	xdef	___di
 841                     	xdef	__adci
 842  000e               __adcBuf:
 843  000e 000000000000  	ds.b	24
 844                     	xdef	__adcBuf
 845                     	xdef	_adcTbl
 846                     	xdef	_adcGet
 847                     	xdef	_systemADC
 848                     	xref	_CLK_PeripheralClockConfig
 849                     	xref	_ADC_GetFlagStatus
 850                     	xref	_ADC_GetConversionValue
 851                     	xref	_ADC_SamplingTimeConfig
 852                     	xref	_ADC_ChannelCmd
 853                     	xref	_ADC_SoftwareStartConv
 854                     	xref	_ADC_Cmd
 855                     	xref	_ADC_Init
 875                     	end
