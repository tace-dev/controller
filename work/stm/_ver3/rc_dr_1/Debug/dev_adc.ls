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
 170                     ; 150 	_adci++;
 173  001d 725c0000      	inc	__adci
 174                     ; 151 	if( _adci == 12 )
 176  0021 c60000        	ld	a,__adci
 177  0024 a10c          	cp	a,#12
 178  0026 2604          	jrne	L34
 179                     ; 152 		_adci = 0;
 181  0028 725f0000      	clr	__adci
 182  002c               L34:
 183                     ; 153 	_adcBuf[_adci] = i16; 
 185  002c c60000        	ld	a,__adci
 186  002f 5f            	clrw	x
 187  0030 97            	ld	xl,a
 188  0031 58            	sllw	x
 189  0032 1602          	ldw	y,(OFST-4,sp)
 190  0034 df000e        	ldw	(__adcBuf,x),y
 191                     ; 155 	k = min = max = 0;
 193  0037 0f05          	clr	(OFST-1,sp)
 194  0039 0f04          	clr	(OFST-2,sp)
 195  003b 0f01          	clr	(OFST-5,sp)
 196                     ; 156 	for( i=1; i<12; i++ )
 198  003d a601          	ld	a,#1
 199  003f 6b06          	ld	(OFST+0,sp),a
 200  0041               L54:
 201                     ; 158 		if( _adcBuf[i] < _adcBuf[min] )
 203  0041 5f            	clrw	x
 204  0042 97            	ld	xl,a
 205  0043 58            	sllw	x
 206  0044 7b04          	ld	a,(OFST-2,sp)
 207  0046 ad46          	call	LC001
 208  0048 2404          	jruge	L35
 209                     ; 159 			min = i;
 211  004a 7b06          	ld	a,(OFST+0,sp)
 212  004c 6b04          	ld	(OFST-2,sp),a
 213  004e               L35:
 214                     ; 160 		if( _adcBuf[i] > _adcBuf[max] )
 216  004e 7b06          	ld	a,(OFST+0,sp)
 217  0050 5f            	clrw	x
 218  0051 97            	ld	xl,a
 219  0052 58            	sllw	x
 220  0053 7b05          	ld	a,(OFST-1,sp)
 221  0055 ad37          	call	LC001
 222  0057 2304          	jrule	L55
 223                     ; 161 			max = i;
 225  0059 7b06          	ld	a,(OFST+0,sp)
 226  005b 6b05          	ld	(OFST-1,sp),a
 227  005d               L55:
 228                     ; 156 	for( i=1; i<12; i++ )
 230  005d 0c06          	inc	(OFST+0,sp)
 233  005f 7b06          	ld	a,(OFST+0,sp)
 234  0061 a10c          	cp	a,#12
 235  0063 25dc          	jrult	L54
 236                     ; 163 	i16 = 0;
 238  0065 5f            	clrw	x
 239  0066 1f02          	ldw	(OFST-4,sp),x
 240                     ; 164 	for( i=0; i<12; i++ )
 242  0068 4f            	clr	a
 243  0069 6b06          	ld	(OFST+0,sp),a
 244  006b               L75:
 245                     ; 166 		if( i==min || i==max )
 247  006b 1104          	cp	a,(OFST-2,sp)
 248  006d 2711          	jreq	L16
 250  006f 1105          	cp	a,(OFST-1,sp)
 251  0071 270d          	jreq	L16
 252                     ; 168 		i16 += _adcBuf[i];
 254  0073 5f            	clrw	x
 255  0074 97            	ld	xl,a
 256  0075 58            	sllw	x
 257  0076 de000e        	ldw	x,(__adcBuf,x)
 258  0079 72fb02        	addw	x,(OFST-4,sp)
 259  007c 1f02          	ldw	(OFST-4,sp),x
 260                     ; 169 		k++;
 262  007e 0c01          	inc	(OFST-5,sp)
 263  0080               L16:
 264                     ; 164 	for( i=0; i<12; i++ )
 266  0080 0c06          	inc	(OFST+0,sp)
 269  0082 7b06          	ld	a,(OFST+0,sp)
 270  0084 a10c          	cp	a,#12
 271  0086 25e3          	jrult	L75
 272                     ; 171 	i16 = i16/k;
 274  0088 7b01          	ld	a,(OFST-5,sp)
 275  008a 62            	div	x,a
 276                     ; 172 	return i16;
 280  008b 5b06          	addw	sp,#6
 281  008d 81            	ret	
 282  008e               LC001:
 283  008e 905f          	clrw	y
 284  0090 9097          	ld	yl,a
 285  0092 9058          	sllw	y
 286  0094 de000e        	ldw	x,(__adcBuf,x)
 287  0097 90d3000e      	cpw	x,(__adcBuf,y)
 288  009b 81            	ret	
 291                     	switch	.data
 292  0001               __addi:
 293  0001 00            	dc.b	0
 362                     ; 182 uint8_t	adcGet(uint8_t mode)
 362                     ; 183 {
 363                     .text:	section	.text,new
 364  0000               _adcGet:
 366  0000 88            	push	a
 367  0001 5206          	subw	sp,#6
 368       00000006      OFST:	set	6
 371                     ; 188 	i16 = _adcGet();
 373  0003 cd0000        	call	__adcGet
 375                     ; 190 	if( i16 > 2932 )
 377  0006 a30b75        	cpw	x,#2933
 378  0009 2503          	jrult	L121
 379                     ; 191 		i16 = 2932;
 381  000b ae0b74        	ldw	x,#2932
 382  000e               L121:
 383  000e 1f03          	ldw	(OFST-3,sp),x
 384                     ; 192 	for( i=0; i<42; i++ )
 386  0010 4f            	clr	a
 387  0011 6b06          	ld	(OFST+0,sp),a
 388  0013               L321:
 389                     ; 194 		if( i16 >= adcTbl[i] )
 391  0013 5f            	clrw	x
 392  0014 97            	ld	xl,a
 393  0015 58            	sllw	x
 394  0016 de0000        	ldw	x,(_adcTbl,x)
 395  0019 1303          	cpw	x,(OFST-3,sp)
 396  001b 225e          	jrugt	L131
 397                     ; 196 			if( i==0 )
 399  001d 7b06          	ld	a,(OFST+0,sp)
 400                     ; 198 				i = (i+2) * 2;
 401                     ; 199 				goto Exit;
 403  001f 2762          	jreq	LC002
 404                     ; 202 			m = adcTbl[i-1] - adcTbl[i];
 406  0021 5f            	clrw	x
 407  0022 97            	ld	xl,a
 408  0023 58            	sllw	x
 409  0024 1d0002        	subw	x,#2
 410  0027 905f          	clrw	y
 411  0029 9097          	ld	yl,a
 412  002b 9058          	sllw	y
 413  002d 90d60001      	ld	a,(_adcTbl+1,y)
 414  0031 d00001        	sub	a,(_adcTbl+1,x)
 415  0034 40            	neg	a
 416                     ; 203 			m = m/4;
 418  0035 5f            	clrw	x
 419  0036 97            	ld	xl,a
 420  0037 57            	sraw	x
 421  0038 57            	sraw	x
 422  0039 01            	rrwa	x,a
 423  003a 6b05          	ld	(OFST-1,sp),a
 424                     ; 204 			j = adcTbl[i-1] - i16;
 426  003c 5f            	clrw	x
 427  003d 7b06          	ld	a,(OFST+0,sp)
 428  003f 97            	ld	xl,a
 429  0040 58            	sllw	x
 430  0041 1d0002        	subw	x,#2
 431  0044 d60001        	ld	a,(_adcTbl+1,x)
 432  0047 1004          	sub	a,(OFST-2,sp)
 433  0049 6b02          	ld	(OFST-4,sp),a
 434                     ; 205 			k = adcTbl[i] - i16;
 436  004b 5f            	clrw	x
 437  004c 7b06          	ld	a,(OFST+0,sp)
 438  004e 97            	ld	xl,a
 439  004f 58            	sllw	x
 440  0050 d60001        	ld	a,(_adcTbl+1,x)
 441  0053 1004          	sub	a,(OFST-2,sp)
 442  0055 6b01          	ld	(OFST-5,sp),a
 443                     ; 206 			if( j > k )
 445  0057 7b02          	ld	a,(OFST-4,sp)
 446  0059 1101          	cp	a,(OFST-5,sp)
 447  005b 2311          	jrule	L531
 448                     ; 209 				if( m > k )
 450  005d 7b05          	ld	a,(OFST-1,sp)
 451  005f 1101          	cp	a,(OFST-5,sp)
 452  0061 2304          	jrule	L731
 453                     ; 211 					i = (i+2) * 2;
 455  0063 7b06          	ld	a,(OFST+0,sp)
 456                     ; 212 					goto Exit;
 458  0065 201c          	jp	LC002
 459  0067               L731:
 460                     ; 214 				i = (i+2-1) * 2 + 1;
 463  0067 7b06          	ld	a,(OFST+0,sp)
 464  0069 48            	sll	a
 465  006a ab03          	add	a,#3
 466                     ; 215 				goto Exit;
 468  006c 2018          	jra	L17
 469  006e               L531:
 470                     ; 220 				if( m  > j )
 472  006e 7b05          	ld	a,(OFST-1,sp)
 473  0070 1102          	cp	a,(OFST-4,sp)
 474  0072 23f3          	jrule	L731
 475                     ; 222 					i = (i+2-1) * 2;
 477  0074 7b06          	ld	a,(OFST+0,sp)
 478  0076 48            	sll	a
 479  0077 ab02          	add	a,#2
 480                     ; 223 					goto Exit;
 482  0079 200b          	jra	L17
 483                     ; 225 				i = (i+2-1) * 2 + 1;
 484                     ; 226 				goto Exit;
 486  007b               L131:
 487                     ; 192 	for( i=0; i<42; i++ )
 489  007b 0c06          	inc	(OFST+0,sp)
 492  007d 7b06          	ld	a,(OFST+0,sp)
 493  007f a12a          	cp	a,#42
 494  0081 2590          	jrult	L321
 495                     ; 230 	i = (i+2) * 2;
 497  0083               LC002:
 499  0083 48            	sll	a
 500  0084 ab04          	add	a,#4
 501  0086               L17:
 502  0086 6b06          	ld	(OFST+0,sp),a
 503                     ; 231 Exit:	
 503                     ; 232 	if( mode == 1 )
 505  0088 7b07          	ld	a,(OFST+1,sp)
 506  008a 4a            	dec	a
 507  008b 2605          	jrne	L541
 508                     ; 233 		return i;
 510  008d 7b06          	ld	a,(OFST+0,sp)
 512  008f cc0115        	jra	L22
 513  0092               L541:
 514                     ; 235 	_add[_addi++] = i;
 516  0092 c60001        	ld	a,__addi
 517  0095 725c0001      	inc	__addi
 518  0099 5f            	clrw	x
 519  009a 97            	ld	xl,a
 520  009b 7b06          	ld	a,(OFST+0,sp)
 521  009d d70000        	ld	(__add,x),a
 522                     ; 236 	if( _addi == 12 )
 524  00a0 c60001        	ld	a,__addi
 525  00a3 a10c          	cp	a,#12
 526  00a5 2604          	jrne	L741
 527                     ; 237 		_addi = 0;
 529  00a7 725f0001      	clr	__addi
 530  00ab               L741:
 531                     ; 239 	j = 0;	//	min
 533  00ab 0f02          	clr	(OFST-4,sp)
 534                     ; 240 	m = 0;	//	max
 536  00ad 0f05          	clr	(OFST-1,sp)
 537                     ; 241 	for( i=1; i<12; i++ )
 539  00af a601          	ld	a,#1
 540  00b1 6b06          	ld	(OFST+0,sp),a
 541  00b3               L151:
 542                     ; 243 		if( _add[i] < _add[j] )
 544  00b3 7b02          	ld	a,(OFST-4,sp)
 545  00b5 5f            	clrw	x
 546  00b6 97            	ld	xl,a
 547  00b7 7b06          	ld	a,(OFST+0,sp)
 548  00b9 ad5d          	call	LC004
 549  00bb 2404          	jruge	L751
 550                     ; 244 			j = i;
 552  00bd 7b06          	ld	a,(OFST+0,sp)
 553  00bf 6b02          	ld	(OFST-4,sp),a
 554  00c1               L751:
 555                     ; 245 		if( _add[i] > _add[m] )
 557  00c1 7b05          	ld	a,(OFST-1,sp)
 558  00c3 5f            	clrw	x
 559  00c4 97            	ld	xl,a
 560  00c5 7b06          	ld	a,(OFST+0,sp)
 561  00c7 ad4f          	call	LC004
 562  00c9 2304          	jrule	L161
 563                     ; 246 			m = i;
 565  00cb 7b06          	ld	a,(OFST+0,sp)
 566  00cd 6b05          	ld	(OFST-1,sp),a
 567  00cf               L161:
 568                     ; 241 	for( i=1; i<12; i++ )
 570  00cf 0c06          	inc	(OFST+0,sp)
 573  00d1 7b06          	ld	a,(OFST+0,sp)
 574  00d3 a10c          	cp	a,#12
 575  00d5 25dc          	jrult	L151
 576                     ; 248 	k = 0;
 578  00d7 0f01          	clr	(OFST-5,sp)
 579                     ; 249 	i16 = 0;
 581  00d9 5f            	clrw	x
 582  00da 1f03          	ldw	(OFST-3,sp),x
 583                     ; 250 	for( i=0; i<12; i++ )
 585  00dc 4f            	clr	a
 586  00dd 6b06          	ld	(OFST+0,sp),a
 587  00df               L361:
 588                     ; 252 		if( i==j || i==m )
 590  00df 1102          	cp	a,(OFST-4,sp)
 591  00e1 2713          	jreq	L561
 593  00e3 1105          	cp	a,(OFST-1,sp)
 594  00e5 270f          	jreq	L561
 595                     ; 254 		i16 += _add[i];
 597  00e7 5f            	clrw	x
 598  00e8 97            	ld	xl,a
 599  00e9 d60000        	ld	a,(__add,x)
 600  00ec 1b04          	add	a,(OFST-2,sp)
 601  00ee 6b04          	ld	(OFST-2,sp),a
 602  00f0 2402          	jrnc	L02
 603  00f2 0c03          	inc	(OFST-3,sp)
 604  00f4               L02:
 605                     ; 255 		k++;
 607  00f4 0c01          	inc	(OFST-5,sp)
 608  00f6               L561:
 609                     ; 250 	for( i=0; i<12; i++ )
 611  00f6 0c06          	inc	(OFST+0,sp)
 614  00f8 7b06          	ld	a,(OFST+0,sp)
 615  00fa a10c          	cp	a,#12
 616  00fc 25e1          	jrult	L361
 617                     ; 257 	i16 = i16/k;
 619  00fe 1e03          	ldw	x,(OFST-3,sp)
 620  0100 7b01          	ld	a,(OFST-5,sp)
 621  0102 62            	div	x,a
 622  0103 1f03          	ldw	(OFST-3,sp),x
 623                     ; 259 	if( (i16%2) == 1 )
 625  0105 7b04          	ld	a,(OFST-2,sp)
 626  0107 a401          	and	a,#1
 627  0109 5f            	clrw	x
 628  010a 02            	rlwa	x,a
 629  010b 5a            	decw	x
 630  010c 2605          	jrne	L571
 631                     ; 260 		i16--;
 633  010e 1e03          	ldw	x,(OFST-3,sp)
 634  0110 5a            	decw	x
 635  0111 1f03          	ldw	(OFST-3,sp),x
 636  0113               L571:
 637                     ; 262 	return i16;
 639  0113 7b04          	ld	a,(OFST-2,sp)
 641  0115               L22:
 643  0115 5b07          	addw	sp,#7
 644  0117 81            	ret	
 645  0118               LC004:
 646  0118 905f          	clrw	y
 647  011a 9097          	ld	yl,a
 648  011c 90d60000      	ld	a,(__add,y)
 649  0120 d10000        	cp	a,(__add,x)
 650  0123 81            	ret	
 678                     ; 265 void	systemADC(void)
 678                     ; 266 {
 679                     .text:	section	.text,new
 680  0000               _systemADC:
 684                     ; 269 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 686  0000 ae1001        	ldw	x,#4097
 687  0003 cd0000        	call	_CLK_PeripheralClockConfig
 689                     ; 287 	ADC_Init(
 689                     ; 288 		ADC1, 
 689                     ; 289 		ADC_ConversionMode_Continuous, 
 689                     ; 290 		ADC_Resolution_12Bit, 
 689                     ; 291 		ADC_Prescaler_2
 689                     ; 292 		);
 691  0006 4b80          	push	#128
 692  0008 4b00          	push	#0
 693  000a 4b04          	push	#4
 694  000c ae5340        	ldw	x,#21312
 695  000f cd0000        	call	_ADC_Init
 697  0012 5b03          	addw	sp,#3
 698                     ; 293 	ADC_SamplingTimeConfig(
 698                     ; 294 		ADC1, 
 698                     ; 295 		ADC_Group_SlowChannels, 
 698                     ; 296 		ADC_SamplingTime_384Cycles
 698                     ; 297 		);
 700  0014 4b07          	push	#7
 701  0016 4b00          	push	#0
 702  0018 ae5340        	ldw	x,#21312
 703  001b cd0000        	call	_ADC_SamplingTimeConfig
 705  001e 85            	popw	x
 706                     ; 300 	ADC_Cmd(ADC1, ENABLE);
 708  001f 4b01          	push	#1
 709  0021 ae5340        	ldw	x,#21312
 710  0024 cd0000        	call	_ADC_Cmd
 712  0027 84            	pop	a
 713                     ; 303 	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
 715  0028 4b01          	push	#1
 716  002a ae0308        	ldw	x,#776
 717  002d 89            	pushw	x
 718  002e ae5340        	ldw	x,#21312
 719  0031 cd0000        	call	_ADC_ChannelCmd
 721  0034 5b03          	addw	sp,#3
 722                     ; 320 }
 725  0036 81            	ret	
 795                     	xdef	__addi
 796                     	switch	.bss
 797  0000               __add:
 798  0000 000000000000  	ds.b	12
 799                     	xdef	__add
 800                     	xdef	__adcGet
 801  000c               ___di:
 802  000c 0000          	ds.b	2
 803                     	xdef	___di
 804                     	xdef	__adci
 805  000e               __adcBuf:
 806  000e 000000000000  	ds.b	24
 807                     	xdef	__adcBuf
 808                     	xdef	_adcTbl
 809                     	xdef	_adcGet
 810                     	xdef	_systemADC
 811                     	xref	_CLK_PeripheralClockConfig
 812                     	xref	_ADC_GetFlagStatus
 813                     	xref	_ADC_GetConversionValue
 814                     	xref	_ADC_SamplingTimeConfig
 815                     	xref	_ADC_ChannelCmd
 816                     	xref	_ADC_SoftwareStartConv
 817                     	xref	_ADC_Cmd
 818                     	xref	_ADC_Init
 838                     	end
