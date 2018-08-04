   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               __ttaSendReady:
  25  0000 00            	dc.b	0
  57                     ; 115 void	systemUartTta(void)
  57                     ; 116 {
  59                     .text:	section	.text,new
  60  0000               _systemUartTta:
  64                     ; 137 	UART1_Init( 
  64                     ; 138 		(uint32_t)9600, 
  64                     ; 139 		UART1_WORDLENGTH_8D, 
  64                     ; 140 		UART1_STOPBITS_1, 
  64                     ; 141 		UART1_PARITY_NO,
  64                     ; 142 		UART1_SYNCMODE_CLOCK_DISABLE, 
  64                     ; 143 		UART1_MODE_TXRX_ENABLE
  64                     ; 144 		);
  66  0000 4b0c          	push	#12
  67  0002 4b80          	push	#128
  68  0004 4b00          	push	#0
  69  0006 4b00          	push	#0
  70  0008 4b00          	push	#0
  71  000a ae2580        	ldw	x,#9600
  72  000d 89            	pushw	x
  73  000e 5f            	clrw	x
  74  000f 89            	pushw	x
  75  0010 cd0000        	call	_UART1_Init
  77  0013 5b09          	addw	sp,#9
  78                     ; 145 	COM1_ITConfig(COM1_IT_RXNE_OR, ENABLE);
  80  0015 4b01          	push	#1
  81  0017 ae0205        	ldw	x,#517
  82  001a cd0000        	call	_UART1_ITConfig
  84  001d 84            	pop	a
  85                     ; 146 	COM1_ITConfig(COM1_IT_TXE, ENABLE);
  87  001e 4b01          	push	#1
  88  0020 ae0277        	ldw	x,#631
  89  0023 cd0000        	call	_UART1_ITConfig
  91  0026 84            	pop	a
  92                     ; 147 	COM1_Cmd(ENABLE);
  94  0027 a601          	ld	a,#1
  96                     ; 159 }
  99  0029 cc0000        	jp	_UART1_Cmd
 175                     ; 194 LPVENTINFO	get_ventInfo(void)
 175                     ; 195 {
 176                     .text:	section	.text,new
 177  0000               _get_ventInfo:
 181                     ; 196 	return &ventInfo;
 183  0000 ae0046        	ldw	x,#_ventInfo
 186  0003 81            	ret	
 233                     ; 199 uint8_t	tta_xor(uint8_t j)
 233                     ; 200 {
 234                     .text:	section	.text,new
 235  0000               _tta_xor:
 237  0000 88            	push	a
 238  0001 89            	pushw	x
 239       00000002      OFST:	set	2
 242                     ; 201 	uint8_t	i, k = 0;
 244  0002 0f01          	clr	(OFST-1,sp)
 245                     ; 202 	for( i=0; i<j; i++ )
 247  0004 0f02          	clr	(OFST+0,sp)
 249  0006 200b          	jra	L77
 250  0008               L37:
 251                     ; 203 		k ^= _ttabuf[i];
 253  0008 5f            	clrw	x
 254  0009 97            	ld	xl,a
 255  000a 7b01          	ld	a,(OFST-1,sp)
 256  000c d80054        	xor	a,(__ttabuf,x)
 257  000f 6b01          	ld	(OFST-1,sp),a
 258                     ; 202 	for( i=0; i<j; i++ )
 260  0011 0c02          	inc	(OFST+0,sp)
 261  0013               L77:
 264  0013 7b02          	ld	a,(OFST+0,sp)
 265  0015 1103          	cp	a,(OFST+1,sp)
 266  0017 25ef          	jrult	L37
 267                     ; 204 	return k;
 269  0019 7b01          	ld	a,(OFST-1,sp)
 272  001b 5b03          	addw	sp,#3
 273  001d 81            	ret	
 320                     ; 207 uint8_t	tta_sum(uint8_t j)
 320                     ; 208 {
 321                     .text:	section	.text,new
 322  0000               _tta_sum:
 324  0000 88            	push	a
 325  0001 89            	pushw	x
 326       00000002      OFST:	set	2
 329                     ; 209 	uint8_t	i, k = 0;
 331  0002 0f01          	clr	(OFST-1,sp)
 332                     ; 210 	for( i=0; i<j; i++ )
 334  0004 0f02          	clr	(OFST+0,sp)
 336  0006 200b          	jra	L721
 337  0008               L321:
 338                     ; 211 		k += _ttabuf[i];
 340  0008 5f            	clrw	x
 341  0009 97            	ld	xl,a
 342  000a 7b01          	ld	a,(OFST-1,sp)
 343  000c db0054        	add	a,(__ttabuf,x)
 344  000f 6b01          	ld	(OFST-1,sp),a
 345                     ; 210 	for( i=0; i<j; i++ )
 347  0011 0c02          	inc	(OFST+0,sp)
 348  0013               L721:
 351  0013 7b02          	ld	a,(OFST+0,sp)
 352  0015 1103          	cp	a,(OFST+1,sp)
 353  0017 25ef          	jrult	L321
 354                     ; 212 	return k;
 356  0019 7b01          	ld	a,(OFST-1,sp)
 359  001b 5b03          	addw	sp,#3
 360  001d 81            	ret	
 390                     ; 225 void	loopTtaCb()
 390                     ; 226 {
 391                     .text:	section	.text,new
 392  0000               _loopTtaCb:
 396                     ; 227 	if( _ttaSendReady == 1 )
 398  0000 c60000        	ld	a,__ttaSendReady
 399  0003 4a            	dec	a
 400  0004 2623          	jrne	L341
 401                     ; 229 		if( _ttat0 != _t1ms )
 403  0006 c60051        	ld	a,__ttat0
 404  0009 c10000        	cp	a,__t1ms
 405  000c 271b          	jreq	L341
 406                     ; 231 			_ttat0 = _t1ms;
 408  000e 5500000051    	mov	__ttat0,__t1ms
 409                     ; 232 			_ttat1--;
 411  0013 725a0050      	dec	__ttat1
 412                     ; 233 			if( _ttat0 == 0 )
 414  0017 c60051        	ld	a,__ttat0
 415  001a 260d          	jrne	L341
 416                     ; 235 				_ttaSendReady = 0;
 418  001c c70000        	ld	__ttaSendReady,a
 419                     ; 236 				uart3_tx_put(_ttabuf, _ttabufi);
 421  001f ae0054        	ldw	x,#__ttabuf
 422  0022 3b0052        	push	__ttabufi
 423  0025 cd0000        	call	_uart3_tx_put
 425  0028 84            	pop	a
 426  0029               L341:
 427                     ; 240 }
 430  0029 81            	ret	
 476                     ; 242 void	ttaVent(void)
 476                     ; 243 {
 477                     .text:	section	.text,new
 478  0000               _ttaVent:
 480  0000 89            	pushw	x
 481       00000002      OFST:	set	2
 484                     ; 244 	LPVENTINFO	p = get_ventInfo();
 486  0001 cd0000        	call	_get_ventInfo
 488  0004 1f01          	ldw	(OFST-1,sp),x
 489                     ; 263 	if( _ttabuf[3] == 0x01 )	//	request status
 491  0006 c60057        	ld	a,__ttabuf+3
 492  0009 a101          	cp	a,#1
 493  000b 260c          	jrne	L171
 494                     ; 266 		_ttabuf[3] |= 0x80;
 496  000d cd0096        	call	LC006
 497                     ; 269 		_ttabuf[7] = p->wind & 0x0f;	//	0 off, 1~3
 499  0010 e602          	ld	a,(2,x)
 500  0012 a40f          	and	a,#15
 501  0014 c7005b        	ld	__ttabuf+7,a
 502                     ; 270 		_ttabuf[8] = p->mode;	//	0 normal, 1 sleep, 2 heat, 3 auto, 5 save
 503                     ; 271 		_ttabuf[9] = p->status;
 504                     ; 272 		TTA_SEND(10)
 514  0017 2057          	jp	LC001
 515  0019               L171:
 516                     ; 274 	else if( _ttabuf[3] == 0x0f )	//	attribute
 518  0019 a10f          	cp	a,#15
 519  001b 262d          	jrne	L571
 520                     ; 276 		_ttabuf[3] |= 0x80;
 522  001d 721e0057      	bset	__ttabuf+3,#7
 523                     ; 277 		_ttabuf[5] = p->wind>>4;
 525  0021 e602          	ld	a,(2,x)
 526  0023 4e            	swap	a
 527  0024 a40f          	and	a,#15
 528  0026 c70059        	ld	__ttabuf+5,a
 529                     ; 278 		_ttabuf[6] = p->status_enable;
 531  0029 e604          	ld	a,(4,x)
 532  002b c7005a        	ld	__ttabuf+6,a
 533                     ; 279 		TTA_SEND(7)
 535  002e ad74          	call	LC007
 538  0030 a607          	ld	a,#7
 539  0032 cd0000        	call	_tta_xor
 541  0035 c7005c        	ld	__ttabuf+8,a
 544  0038 a608          	ld	a,#8
 545  003a cd0000        	call	_tta_sum
 547  003d c7005d        	ld	__ttabuf+9,a
 550  0040 725f0058      	clr	__ttabuf+4
 553  0044 35090052      	mov	__ttabufi,#9
 555  0048 204a          	jra	L371
 556  004a               L571:
 557                     ; 281 	else if( _ttabuf[3] == 0x41 )	//	power on/off
 559  004a a141          	cp	a,#65
 560  004c 260c          	jrne	L102
 561                     ; 283 		_ttabuf[3] |= 0x80;
 563                     ; 284 		_ttabuf[5] = p->err;	//	0 OK
 565                     ; 285 		_ttabuf[6] = p->power;	//	0 off, 1 return to prev
 567                     ; 286 		_ttabuf[7] = (p->status & VENT_CO2) ? 1 : 0;
 569  004e               LC005:
 571  004e ad46          	call	LC006
 573  0050 e603          	ld	a,(3,x)
 574  0052 a510          	bcp	a,#16
 575  0054 2714          	jreq	L46
 576  0056               LC004:
 577  0056 a601          	ld	a,#1
 578  0058 2011          	jra	L66
 579                     ; 287 		_ttabuf[8] = p->mode;	//	0 normal, 1 sleep, 2 heat, 3 auto, 5 save
 580                     ; 288 		_ttabuf[9] = p->status;
 581                     ; 289 		TTA_SEND(10)
 591  005a               L102:
 592                     ; 291 	else if( _ttabuf[3] == 0x42 )	//	wind speed
 594  005a a142          	cp	a,#66
 595                     ; 293 		_ttabuf[3] |= 0x80;
 596                     ; 294 		_ttabuf[5] = p->err;	//	0 OK
 597                     ; 295 		_ttabuf[6] = p->power;	//	0 off, 1 return to prev
 598                     ; 296 		_ttabuf[7] = (p->status & VENT_CO2) ? 1 : 0;
 599  005c 27f0          	jreq	LC005
 600                     ; 297 		_ttabuf[8] = p->mode;	//	0 normal, 1 sleep, 2 heat, 3 auto, 5 save
 601                     ; 298 		_ttabuf[9] = p->status;
 602                     ; 299 		TTA_SEND(10)
 612                     ; 301 	else if( _ttabuf[3] == 0x43 )	//	mode
 614  005e a143          	cp	a,#67
 615  0060 2632          	jrne	L371
 616                     ; 303 		_ttabuf[3] |= 0x80;
 618  0062 ad32          	call	LC006
 619                     ; 306 		_ttabuf[7] = (p->status & VENT_CO2) ? 1 : 0;
 621  0064 e603          	ld	a,(3,x)
 622  0066 a510          	bcp	a,#16
 623  0068 26ec          	jrne	LC004
 624  006a               L46:
 625  006a 4f            	clr	a
 626  006b               L66:
 627                     ; 307 		_ttabuf[8] = p->mode;	//	0 normal, 1 sleep, 2 heat, 3 auto, 5 save
 629  006b c7005b        	ld	__ttabuf+7,a
 632  006e 1e01          	ldw	x,(OFST-1,sp)
 633                     ; 308 		_ttabuf[9] = p->status;
 635                     ; 309 		TTA_SEND(10)
 651  0070               LC001:
 653  0070 e605          	ld	a,(5,x)
 654  0072 c7005c        	ld	__ttabuf+8,a
 658  0075 e603          	ld	a,(3,x)
 659  0077 c7005d        	ld	__ttabuf+9,a
 663  007a ad28          	call	LC007
 667  007c a60a          	ld	a,#10
 668  007e cd0000        	call	_tta_xor
 669  0081 c7005f        	ld	__ttabuf+11,a
 673  0084 a60b          	ld	a,#11
 674  0086 cd0000        	call	_tta_sum
 675  0089 c70060        	ld	__ttabuf+12,a
 679  008c 35030058      	mov	__ttabuf+4,#3
 683  0090 350c0052      	mov	__ttabufi,#12
 684  0094               L371:
 685                     ; 311 }
 688  0094 85            	popw	x
 689  0095 81            	ret	
 690  0096               LC006:
 691  0096 721e0057      	bset	__ttabuf+3,#7
 692                     ; 304 		_ttabuf[5] = p->err;	//	0 OK
 694  009a f6            	ld	a,(x)
 695  009b c70059        	ld	__ttabuf+5,a
 696                     ; 305 		_ttabuf[6] = p->power;	//	0 off, 1 return to prev
 698  009e e601          	ld	a,(1,x)
 699  00a0 c7005a        	ld	__ttabuf+6,a
 700  00a3 81            	ret	
 701  00a4               LC007:
 702  00a4 35010000      	mov	__ttaSendReady,#1
 706  00a8 5500000051    	mov	__ttat0,__t1ms
 710  00ad 350b0050      	mov	__ttat1,#11
 711  00b1 81            	ret	
 822                     ; 338 LPTEMPEINFO	get_tempeInfo(void)
 822                     ; 339 {
 823                     .text:	section	.text,new
 824  0000               _get_tempeInfo:
 828                     ; 340 	return &tempeInfo;
 830  0000 ae003b        	ldw	x,#_tempeInfo
 833  0003 81            	ret	
 872                     ; 343 void	ttaTempeResponse(void)
 872                     ; 344 {
 873                     .text:	section	.text,new
 874  0000               _ttaTempeResponse:
 876  0000 89            	pushw	x
 877       00000002      OFST:	set	2
 880                     ; 345 	LPTEMPEINFO	p = get_tempeInfo();
 882  0001 cd0000        	call	_get_tempeInfo
 884                     ; 346 	_ttabuf[5] = p->err;	//	0 OK
 886  0004 f6            	ld	a,(x)
 887  0005 c70059        	ld	__ttabuf+5,a
 888                     ; 347 	_ttabuf[6] = p->heat_mode;	//	bit7:8,...bit0:1
 890  0008 e602          	ld	a,(2,x)
 891  000a c7005a        	ld	__ttabuf+6,a
 892                     ; 348 	_ttabuf[7] = p->outer_mode;		//	bit7:8,...bit0:1
 894  000d e601          	ld	a,(1,x)
 895  000f c7005b        	ld	__ttabuf+7,a
 896                     ; 349 	_ttabuf[8] = p->reserve_mode;	
 898  0012 e603          	ld	a,(3,x)
 899  0014 c7005c        	ld	__ttabuf+8,a
 900                     ; 350 	_ttabuf[9] = p->water_mode;
 902  0017 e604          	ld	a,(4,x)
 903  0019 c7005d        	ld	__ttabuf+9,a
 904                     ; 351 }
 907  001c 85            	popw	x
 908  001d 81            	ret	
 983                     ; 353 void	ttaTempeSet(uint8_t mode)
 983                     ; 354 {
 984                     .text:	section	.text,new
 985  0000               _ttaTempeSet:
 987  0000 5206          	subw	sp,#6
 988       00000006      OFST:	set	6
 991                     ; 355 	LPTEMPEINFO	p = get_tempeInfo();
 993  0002 cd0000        	call	_get_tempeInfo
 995  0005 1f01          	ldw	(OFST-5,sp),x
 996                     ; 357 	i = 10;
 998                     ; 358 	k = _ttabuf[5];
1000                     ; 359 	sub = _ttabuf[2]>>4;
1002  0007 c60056        	ld	a,__ttabuf+2
1003                     ; 360 	id = _ttabuf[2]&0x0f;
1005  000a a40f          	and	a,#15
1006  000c 6b06          	ld	(OFST+0,sp),a
1007                     ; 361 	if( id == 0x0f )
1009                     ; 363 		ttaTempeResponse();
1012                     ; 367 		ttaTempeResponse();
1016  000e cd0000        	call	_ttaTempeResponse
1017                     ; 370 }
1020  0011 5b06          	addw	sp,#6
1021  0013 81            	ret	
1083                     ; 372 void	ttaTempe(void)
1083                     ; 373 {
1084                     .text:	section	.text,new
1085  0000               _ttaTempe:
1087  0000 5204          	subw	sp,#4
1088       00000004      OFST:	set	4
1091                     ; 375 	LPTEMPEINFO	p = get_tempeInfo();
1093  0002 cd0000        	call	_get_tempeInfo
1095  0005 1f02          	ldw	(OFST-2,sp),x
1096                     ; 388 	if( _ttabuf[3] == 0x01 )	//	request status
1098  0007 c60057        	ld	a,__ttabuf+3
1099  000a a101          	cp	a,#1
1100  000c 2658          	jrne	L163
1101                     ; 391 		_ttabuf[3] |= 0x80;
1103  000e 721e0057      	bset	__ttabuf+3,#7
1104                     ; 392 		ttaTempeResponse();
1106  0012 cd0000        	call	_ttaTempeResponse
1108                     ; 393 		i = 10;
1110  0015 a60a          	ld	a,#10
1111  0017 6b04          	ld	(OFST+0,sp),a
1112                     ; 394 		for( j=0; j<4; j++ )
1114  0019 0f01          	clr	(OFST-3,sp)
1115  001b               L363:
1116                     ; 396 			_ttabuf[i++] = 0;//cu
1118  001b 7b04          	ld	a,(OFST+0,sp)
1119  001d 5f            	clrw	x
1120  001e 97            	ld	xl,a
1121                     ; 397 			_ttabuf[i++] = 0;//set
1123  001f 4c            	inc	a
1124  0020 724f0054      	clr	(__ttabuf,x)
1125  0024 6b04          	ld	(OFST+0,sp),a
1126  0026 5f            	clrw	x
1127  0027 97            	ld	xl,a
1128  0028 0c04          	inc	(OFST+0,sp)
1129  002a 724f0054      	clr	(__ttabuf,x)
1130                     ; 394 		for( j=0; j<4; j++ )
1132  002e 0c01          	inc	(OFST-3,sp)
1135  0030 7b01          	ld	a,(OFST-3,sp)
1136  0032 a104          	cp	a,#4
1137  0034 25e5          	jrult	L363
1138                     ; 399 		TTA_SEND(i)
1140  0036 cd00d8        	call	LC009
1143  0039 5f            	clrw	x
1144  003a 7b04          	ld	a,(OFST+0,sp)
1145  003c 97            	ld	xl,a
1146  003d 89            	pushw	x
1147  003e 7b06          	ld	a,(OFST+2,sp)
1148  0040 cd0000        	call	_tta_xor
1150  0043 85            	popw	x
1151  0044 d70055        	ld	(__ttabuf+1,x),a
1154  0047 5f            	clrw	x
1155  0048 7b04          	ld	a,(OFST+0,sp)
1156  004a 97            	ld	xl,a
1157  004b 89            	pushw	x
1158  004c 7b06          	ld	a,(OFST+2,sp)
1159  004e 4c            	inc	a
1160  004f cd0000        	call	_tta_sum
1162  0052 85            	popw	x
1163  0053 d70056        	ld	(__ttabuf+2,x),a
1166  0056 7b04          	ld	a,(OFST+0,sp)
1167  0058 a007          	sub	a,#7
1168  005a c70058        	ld	__ttabuf+4,a
1171  005d 7b04          	ld	a,(OFST+0,sp)
1172  005f ab02          	add	a,#2
1173  0061 c70052        	ld	__ttabufi,a
1175  0064 206f          	jra	L173
1176  0066               L163:
1177                     ; 401 	else if( _ttabuf[3] == 0x0f )	//	attribute
1179  0066 a10f          	cp	a,#15
1180  0068 2642          	jrne	L373
1181                     ; 403 		_ttabuf[3] |= 0x80;
1183  006a 721e0057      	bset	__ttabuf+3,#7
1184                     ; 404 		_ttabuf[5] = p->err;	//	0 OK
1186  006e f6            	ld	a,(x)
1187  006f c70059        	ld	__ttabuf+5,a
1188                     ; 405 		_ttabuf[6] = p->company;
1190  0072 e605          	ld	a,(5,x)
1191  0074 c7005a        	ld	__ttabuf+6,a
1192                     ; 406 		_ttabuf[7] = p->heat_type;
1194  0077 e606          	ld	a,(6,x)
1195  0079 c7005b        	ld	__ttabuf+7,a
1196                     ; 407 		_ttabuf[8] = p->heat_max;	
1198  007c e607          	ld	a,(7,x)
1199  007e c7005c        	ld	__ttabuf+8,a
1200                     ; 408 		_ttabuf[9] = p->heat_min;
1202  0081 e608          	ld	a,(8,x)
1203  0083 c7005d        	ld	__ttabuf+9,a
1204                     ; 409 		_ttabuf[10] = p->mode;
1206  0086 e609          	ld	a,(9,x)
1207  0088 c7005e        	ld	__ttabuf+10,a
1208                     ; 410 		_ttabuf[11] = p->count;
1210  008b e60a          	ld	a,(10,x)
1211  008d c7005f        	ld	__ttabuf+11,a
1212                     ; 411 		TTA_SEND(12)
1214  0090 ad46          	call	LC009
1217  0092 a60c          	ld	a,#12
1218  0094 cd0000        	call	_tta_xor
1220  0097 c70061        	ld	__ttabuf+13,a
1223  009a a60d          	ld	a,#13
1224  009c cd0000        	call	_tta_sum
1226  009f c70062        	ld	__ttabuf+14,a
1229  00a2 35050058      	mov	__ttabuf+4,#5
1232  00a6 350e0052      	mov	__ttabufi,#14
1234  00aa 2029          	jra	L173
1235  00ac               L373:
1236                     ; 413 	else if( _ttabuf[3] == 0x43 )	{	ttaTempeSet(3);	}	//	Heater
1238  00ac a143          	cp	a,#67
1239  00ae 2604          	jrne	L773
1242  00b0 a603          	ld	a,#3
1245  00b2 201e          	jp	LC008
1246  00b4               L773:
1247                     ; 414 	else if( _ttabuf[3] == 0x44 )	{	ttaTempeSet(4);	}	//	Set temp
1249  00b4 a144          	cp	a,#68
1250  00b6 2604          	jrne	L304
1253  00b8 a604          	ld	a,#4
1256  00ba 2016          	jp	LC008
1257  00bc               L304:
1258                     ; 415 	else if( _ttabuf[3] == 0x45 )	{	ttaTempeSet(5);	}	//	Outer
1260  00bc a145          	cp	a,#69
1261  00be 2604          	jrne	L704
1264  00c0 a605          	ld	a,#5
1267  00c2 200e          	jp	LC008
1268  00c4               L704:
1269                     ; 416 	else if( _ttabuf[3] == 0x46 )	{	ttaTempeSet(6);}	//	Reserve
1271  00c4 a146          	cp	a,#70
1272  00c6 2604          	jrne	L314
1275  00c8 a606          	ld	a,#6
1278  00ca 2006          	jp	LC008
1279  00cc               L314:
1280                     ; 417 	else if( _ttabuf[3] == 0x47 )	{	ttaTempeSet(7);}	//	water
1282  00cc a147          	cp	a,#71
1283  00ce 2605          	jrne	L173
1286  00d0 a607          	ld	a,#7
1287  00d2               LC008:
1288  00d2 cd0000        	call	_ttaTempeSet
1290  00d5               L173:
1291                     ; 418 }
1294  00d5 5b04          	addw	sp,#4
1295  00d7 81            	ret	
1296  00d8               LC009:
1297  00d8 35010000      	mov	__ttaSendReady,#1
1298                     ; 411 		TTA_SEND(12)
1300  00dc 5500000051    	mov	__ttat0,__t1ms
1303  00e1 350b0050      	mov	__ttat1,#11
1304  00e5 81            	ret	
1356                     ; 420 void	loopTta(uint8_t k)
1356                     ; 421 {
1357                     .text:	section	.text,new
1358  0000               _loopTta:
1360  0000 88            	push	a
1361  0001 89            	pushw	x
1362       00000002      OFST:	set	2
1365                     ; 431 		_ttabuf[_ttai] = k;
1367  0002 c60053        	ld	a,__ttai
1368  0005 5f            	clrw	x
1369  0006 97            	ld	xl,a
1370  0007 7b03          	ld	a,(OFST+1,sp)
1371  0009 d70054        	ld	(__ttabuf,x),a
1372                     ; 432 		_ttai = (_ttai+1) % TTAI_SIZE;
1374  000c 5f            	clrw	x
1375  000d c60053        	ld	a,__ttai
1376  0010 97            	ld	xl,a
1377  0011 5c            	incw	x
1378  0012 a620          	ld	a,#32
1379  0014 cd0000        	call	c_smodx
1381  0017 01            	rrwa	x,a
1382  0018 c70053        	ld	__ttai,a
1383                     ; 433 		if( _tta[0] == 0 )
1385  001b c6004c        	ld	a,__tta
1386  001e 2617          	jrne	L144
1387                     ; 435 			if( k == 0xf7 )
1389  0020 7b03          	ld	a,(OFST+1,sp)
1390  0022 a1f7          	cp	a,#247
1391  0024 2703cc00a9    	jrne	L544
1392                     ; 437 				_tta[0] = 1;
1394  0029 3501004c      	mov	__tta,#1
1395                     ; 438 				_ttai = 1;
1397  002d 35010053      	mov	__ttai,#1
1398                     ; 439 				_ttabuf[0] = 0xf7;
1400  0031 35f70054      	mov	__ttabuf,#247
1401  0035 2072          	jra	L544
1402  0037               L144:
1403                     ; 442 		else if( _tta[0] == 1 )
1405  0037 a101          	cp	a,#1
1406  0039 261c          	jrne	L744
1407                     ; 444 			if( k == 0x36 )			//	TTA_THERMAL_
1409  003b 7b03          	ld	a,(OFST+1,sp)
1410  003d a136          	cp	a,#54
1411  003f 2606          	jrne	L154
1412                     ; 445 				_tta[0] = 11;
1414  0041 350b004c      	mov	__tta,#11
1416  0045 2062          	jra	L544
1417  0047               L154:
1418                     ; 446 			else if( k == 0x32 )	//	TTA_VSP
1420  0047 a132          	cp	a,#50
1421  0049 2606          	jrne	L554
1422                     ; 447 				_tta[0] = 11;
1424  004b 350b004c      	mov	__tta,#11
1426  004f 2058          	jra	L544
1427  0051               L554:
1428                     ; 449 				_tta[0] = 0;
1430  0051 725f004c      	clr	__tta
1431  0055 2052          	jra	L544
1432  0057               L744:
1433                     ; 451 		else if( _tta[0] == 11 )	{	_tta[0] = 12;	}	/*	sub*/	
1435  0057 a10b          	cp	a,#11
1436  0059 2606          	jrne	L364
1439  005b 350c004c      	mov	__tta,#12
1441  005f 2048          	jra	L544
1442  0061               L364:
1443                     ; 452 		else if( _tta[0] == 12 )	{	_tta[0] = 13;	}	/*	cmd*/
1445  0061 a10c          	cp	a,#12
1446  0063 2606          	jrne	L764
1449  0065 350d004c      	mov	__tta,#13
1451  0069 203e          	jra	L544
1452  006b               L764:
1453                     ; 453 		else if( _tta[0] == 13 )	//	size
1455  006b a10d          	cp	a,#13
1456  006d 2615          	jrne	L374
1457                     ; 455 			_tta[2] = 0;
1459  006f 725f004e      	clr	__tta+2
1460                     ; 456 			_tta[1] = k;
1462  0073 7b03          	ld	a,(OFST+1,sp)
1463  0075 c7004d        	ld	__tta+1,a
1464                     ; 457 			_tta[0] = k==0 ? 15 : 14;
1466  0078 7b03          	ld	a,(OFST+1,sp)
1467  007a 2604          	jrne	L441
1468  007c a60f          	ld	a,#15
1469  007e 2026          	jra	LC010
1470  0080               L441:
1471  0080 a60e          	ld	a,#14
1473  0082 2022          	jp	LC010
1474  0084               L374:
1475                     ; 459 		else if( _tta[0] == 14 )
1477  0084 a10e          	cp	a,#14
1478  0086 2610          	jrne	L774
1479                     ; 461 			_tta[2]++;
1481  0088 725c004e      	inc	__tta+2
1482                     ; 462 			if( _tta[2] == _tta[1] )
1484  008c c6004e        	ld	a,__tta+2
1485  008f c1004d        	cp	a,__tta+1
1486  0092 2615          	jrne	L544
1487                     ; 463 				_tta[0] = 15;
1489  0094 a60f          	ld	a,#15
1490  0096 200e          	jp	LC010
1491  0098               L774:
1492                     ; 465 		else if( _tta[0] == 15 )	{	_tta[0] = 16;	}	/*	xor*/
1494  0098 a10f          	cp	a,#15
1495  009a 2604          	jrne	L505
1498  009c a610          	ld	a,#16
1500  009e 2006          	jp	LC010
1501  00a0               L505:
1502                     ; 466 		else if( _tta[0] == 16 )	{	_tta[0] = 17;	}	/*	xsum*/
1504  00a0 a110          	cp	a,#16
1505  00a2 2605          	jrne	L544
1508  00a4 a611          	ld	a,#17
1509  00a6               LC010:
1510  00a6 c7004c        	ld	__tta,a
1511  00a9               L544:
1512                     ; 468 		if( _tta[0] == 17 )
1514  00a9 c6004c        	ld	a,__tta
1515  00ac a111          	cp	a,#17
1516  00ae 2672          	jrne	L315
1517                     ; 470 			_tta[0] = 0;
1519  00b0 725f004c      	clr	__tta
1520                     ; 471 			x = 0;
1522  00b4 0f01          	clr	(OFST-1,sp)
1523                     ; 472 			for( i=0; i<5+_ttabuf[4]; i++ )
1525  00b6 0f02          	clr	(OFST+0,sp)
1527  00b8 200d          	jra	L125
1528  00ba               L515:
1529                     ; 473 				x ^= _ttabuf[i];
1531  00ba 7b02          	ld	a,(OFST+0,sp)
1532  00bc 5f            	clrw	x
1533  00bd 97            	ld	xl,a
1534  00be 7b01          	ld	a,(OFST-1,sp)
1535  00c0 d80054        	xor	a,(__ttabuf,x)
1536  00c3 6b01          	ld	(OFST-1,sp),a
1537                     ; 472 			for( i=0; i<5+_ttabuf[4]; i++ )
1539  00c5 0c02          	inc	(OFST+0,sp)
1540  00c7               L125:
1543  00c7 7b02          	ld	a,(OFST+0,sp)
1544  00c9 ad5a          	call	LC012
1545  00cb 72a90005      	addw	y,#5
1546  00cf 90b300        	cpw	y,c_x
1547  00d2 2ce6          	jrsgt	L515
1548                     ; 474 			if( x == _ttabuf[6+_ttabuf[4]] )
1550  00d4 5f            	clrw	x
1551  00d5 97            	ld	xl,a
1552  00d6 d6005a        	ld	a,(__ttabuf+6,x)
1553  00d9 1101          	cp	a,(OFST-1,sp)
1554  00db 2645          	jrne	L315
1555                     ; 476 				x = 0;
1557  00dd 0f01          	clr	(OFST-1,sp)
1558                     ; 477 				for( i=0; i<6+_ttabuf[4]; i++ )
1560  00df 0f02          	clr	(OFST+0,sp)
1562  00e1 200d          	jra	L335
1563  00e3               L725:
1564                     ; 478 					x += _ttabuf[i];
1566  00e3 7b02          	ld	a,(OFST+0,sp)
1567  00e5 5f            	clrw	x
1568  00e6 97            	ld	xl,a
1569  00e7 7b01          	ld	a,(OFST-1,sp)
1570  00e9 db0054        	add	a,(__ttabuf,x)
1571  00ec 6b01          	ld	(OFST-1,sp),a
1572                     ; 477 				for( i=0; i<6+_ttabuf[4]; i++ )
1574  00ee 0c02          	inc	(OFST+0,sp)
1575  00f0               L335:
1578  00f0 7b02          	ld	a,(OFST+0,sp)
1579  00f2 ad31          	call	LC012
1580  00f4 72a90006      	addw	y,#6
1581  00f8 90b300        	cpw	y,c_x
1582  00fb 2ce6          	jrsgt	L725
1583                     ; 479 				if( x == _ttabuf[7+_ttabuf[4]] )
1585  00fd 5f            	clrw	x
1586  00fe 97            	ld	xl,a
1587  00ff d6005b        	ld	a,(__ttabuf+7,x)
1588  0102 1101          	cp	a,(OFST-1,sp)
1589  0104 261c          	jrne	L315
1590                     ; 481 					ext_hn_ready = 1;
1592  0106 35010000      	mov	_ext_hn_ready,#1
1593                     ; 483 					if( (_ttabuf[3] & 0x80) != 0x80 )
1595  010a 720e005713    	btjt	__ttabuf+3,#7,L315
1596                     ; 486 						if( _ttabuf[1] == 0x36 )
1598  010f c60055        	ld	a,__ttabuf+1
1599  0112 a136          	cp	a,#54
1600  0114 2605          	jrne	L345
1601                     ; 487 							ttaTempe();
1603  0116 cd0000        	call	_ttaTempe
1606  0119 2007          	jra	L315
1607  011b               L345:
1608                     ; 488 						else if( _ttabuf[1] == 0x32 )
1610  011b a132          	cp	a,#50
1611  011d 2603          	jrne	L315
1612                     ; 489 							ttaVent();
1614  011f cd0000        	call	_ttaVent
1616  0122               L315:
1617                     ; 530 }
1620  0122 5b03          	addw	sp,#3
1621  0124 81            	ret	
1622  0125               LC012:
1623  0125 5f            	clrw	x
1624  0126 97            	ld	xl,a
1625  0127 c60058        	ld	a,__ttabuf+4
1626  012a 905f          	clrw	y
1627  012c 9097          	ld	yl,a
1628  012e bf00          	ldw	c_x,x
1629  0130 81            	ret	
1632                     	switch	.data
1633  0001               _vstTbl:
1634  0001 4a            	dc.b	74
1635  0002 66            	dc.b	102
1636  0003 89            	dc.b	137
1637  0004 4a            	dc.b	74
1638  0005 66            	dc.b	102
1639  0006 89            	dc.b	137
1640  0007 44            	dc.b	68
1641  0008 71            	dc.b	113
1642  0009 78            	dc.b	120
1643  000a 44            	dc.b	68
1644  000b 71            	dc.b	113
1645  000c 78            	dc.b	120
1646  000d 3b            	dc.b	59
1647  000e 62            	dc.b	98
1648  000f 6f            	dc.b	111
1649  0010 3b            	dc.b	59
1650  0011 62            	dc.b	98
1651  0012 6f            	dc.b	111
1652  0013 4d            	dc.b	77
1653  0014 8d            	dc.b	141
1654  0015 a0            	dc.b	160
1655  0016 4d            	dc.b	77
1656  0017 8d            	dc.b	141
1657  0018 a0            	dc.b	160
1658  0019 3c            	dc.b	60
1659  001a 7a            	dc.b	122
1660  001b 8c            	dc.b	140
1661  001c 3c            	dc.b	60
1662  001d 7a            	dc.b	122
1663  001e 8c            	dc.b	140
1664  001f 56            	dc.b	86
1665  0020 80            	dc.b	128
1666  0021 89            	dc.b	137
1667  0022 56            	dc.b	86
1668  0023 80            	dc.b	128
1669  0024 89            	dc.b	137
1670  0025 4a            	dc.b	74
1671  0026 8f            	dc.b	143
1672  0027 9a            	dc.b	154
1673  0028 4a            	dc.b	74
1674  0029 8f            	dc.b	143
1675  002a 9a            	dc.b	154
1676  002b 4a            	dc.b	74
1677  002c 8f            	dc.b	143
1678  002d 9a            	dc.b	154
1679  002e 4a            	dc.b	74
1680  002f 8f            	dc.b	143
1681  0030 9a            	dc.b	154
1783                     ; 572 LPVENTiINFO	get_ventiInfo(void)
1783                     ; 573 {
1784                     .text:	section	.text,new
1785  0000               _get_ventiInfo:
1789                     ; 574 	return &ventiInfo;
1791  0000 ae0031        	ldw	x,#_ventiInfo
1794  0003 81            	ret	
1850                     ; 591 void	ventiSend(uint8_t id, uint8_t *buf)
1850                     ; 592 {
1851                     .text:	section	.text,new
1852  0000               _ventiSend:
1854  0000 88            	push	a
1855  0001 89            	pushw	x
1856       00000002      OFST:	set	2
1859                     ; 593 	LPVENTiINFO	p = get_ventiInfo();
1861  0002 cd0000        	call	_get_ventiInfo
1863  0005 1f01          	ldw	(OFST-1,sp),x
1864                     ; 595 	if( id == 0 )
1866  0007 7b03          	ld	a,(OFST+1,sp)
1867  0009 2605          	jrne	L146
1868                     ; 596 		id = buf[0];
1870  000b 1e06          	ldw	x,(OFST+4,sp)
1871  000d f6            	ld	a,(x)
1872  000e 6b03          	ld	(OFST+1,sp),a
1873  0010               L146:
1874                     ; 597 	if( id == 0x01 )
1876  0010 4a            	dec	a
1877  0011 2718          	jreq	L546
1879                     ; 601 	else if( _ventibuf[3] == 0x83 )	//	time
1881  0013 c60004        	ld	a,__ventibuf+3
1882  0016 a183          	cp	a,#131
1883  0018 2611          	jrne	L546
1884                     ; 603 		p->hour = _ventibuf[4];
1886  001a 1e01          	ldw	x,(OFST-1,sp)
1887  001c c60005        	ld	a,__ventibuf+4
1888  001f e706          	ld	(6,x),a
1889                     ; 604 		p->minute = _ventibuf[5];
1891  0021 c60006        	ld	a,__ventibuf+5
1892  0024 e707          	ld	(7,x),a
1893                     ; 605 		p->tempe = _ventibuf[6];
1895  0026 c60007        	ld	a,__ventibuf+6
1896  0029 e702          	ld	(2,x),a
1897  002b               L546:
1898                     ; 608 }
1901  002b 5b03          	addw	sp,#3
1902  002d 81            	ret	
1941                     ; 610 void	venti(void)
1941                     ; 611 {
1942                     .text:	section	.text,new
1943  0000               _venti:
1945  0000 89            	pushw	x
1946       00000002      OFST:	set	2
1949                     ; 612 	LPVENTiINFO	p = get_ventiInfo();
1951  0001 cd0000        	call	_get_ventiInfo
1953  0004 1f01          	ldw	(OFST-1,sp),x
1954                     ; 613 	if( _ventibuf[3] == 0x80 )
1956  0006 c60004        	ld	a,__ventibuf+3
1957  0009 a180          	cp	a,#128
1958  000b 260b          	jrne	L176
1959                     ; 615 		p->supply = _ventibuf[4];
1961  000d c60005        	ld	a,__ventibuf+4
1962  0010 f7            	ld	(x),a
1963                     ; 616 		p->exhaust = _ventibuf[5];
1965  0011 c60006        	ld	a,__ventibuf+5
1966  0014 e701          	ld	(1,x),a
1967                     ; 617 		p->tempe = _ventibuf[6];
1968                     ; 618 		p->damper = _ventibuf[7];
1969                     ; 619 		p->co2h = _ventibuf[8];
1970                     ; 620 		p->co2L = _ventibuf[9];
1971                     ; 621 		p->err = _ventibuf[10];
1973  0016 200e          	jp	LC014
1974  0018               L176:
1975                     ; 624 	else if( _ventibuf[3] == 0x83 )	//	time
1977  0018 a183          	cp	a,#131
1978  001a 2620          	jrne	L576
1979                     ; 626 		p->hour = _ventibuf[4];
1981  001c c60005        	ld	a,__ventibuf+4
1982  001f e706          	ld	(6,x),a
1983                     ; 627 		p->minute = _ventibuf[5];
1985  0021 c60006        	ld	a,__ventibuf+5
1986  0024 e707          	ld	(7,x),a
1987                     ; 628 		p->tempe = _ventibuf[6];
1989                     ; 629 		p->damper = _ventibuf[7];
1991                     ; 630 		p->co2h = _ventibuf[8];
1993                     ; 631 		p->co2L = _ventibuf[9];
1995  0026               LC014:
1997  0026 c60007        	ld	a,__ventibuf+6
1998  0029 e702          	ld	(2,x),a
2000  002b c60008        	ld	a,__ventibuf+7
2001  002e e703          	ld	(3,x),a
2003  0030 c60009        	ld	a,__ventibuf+8
2004  0033 e704          	ld	(4,x),a
2006  0035 c6000a        	ld	a,__ventibuf+9
2007  0038 e705          	ld	(5,x),a
2008                     ; 632 		p->err = _ventibuf[10];
2010  003a 2004          	jp	LC013
2011  003c               L576:
2012                     ; 635 	else if( _ventibuf[3] == 0x85 )	//	factory reset
2014  003c a185          	cp	a,#133
2015  003e 2605          	jrne	L376
2016                     ; 637 		p->err = _ventibuf[10];
2018  0040               LC013:
2021  0040 c6000b        	ld	a,__ventibuf+10
2022  0043 e708          	ld	(8,x),a
2023  0045               L376:
2024                     ; 640 }
2027  0045 85            	popw	x
2028  0046 81            	ret	
2088                     ; 642 void	loopVenti(uint8_t k)
2088                     ; 643 {
2089                     .text:	section	.text,new
2090  0000               _loopVenti:
2092  0000 88            	push	a
2093  0001 5203          	subw	sp,#3
2094       00000003      OFST:	set	3
2097  0003 cc0107        	jra	L727
2098  0006               L527:
2099                     ; 648 		k = uart3_get();
2101  0006 cd0000        	call	_uart3_get
2103  0009 6b04          	ld	(OFST+1,sp),a
2104                     ; 649 		_ventibuf[_ttai] = k;
2106  000b 5f            	clrw	x
2107  000c c60053        	ld	a,__ttai
2108  000f 97            	ld	xl,a
2109  0010 7b04          	ld	a,(OFST+1,sp)
2110  0012 d70001        	ld	(__ventibuf,x),a
2111                     ; 650 		_venti = (_venti+1) % TTAI_SIZE;
2113  0015 5f            	clrw	x
2114  0016 c60000        	ld	a,__venti
2115  0019 97            	ld	xl,a
2116  001a 5c            	incw	x
2117  001b a620          	ld	a,#32
2118  001d cd0000        	call	c_smodx
2120  0020 01            	rrwa	x,a
2121  0021 c70000        	ld	__venti,a
2122                     ; 651 		if( _tta[0] == 0 )
2124  0024 c6004c        	ld	a,__tta
2125  0027 2614          	jrne	L337
2126                     ; 653 			if( k == 0xf0 )
2128  0029 7b04          	ld	a,(OFST+1,sp)
2129  002b a1f0          	cp	a,#240
2130  002d 266e          	jrne	L737
2131                     ; 655 				_tta[0] = 1;
2133  002f 3501004c      	mov	__tta,#1
2134                     ; 656 				_venti = 1;
2136  0033 35010000      	mov	__venti,#1
2137                     ; 657 				_ventibuf[0] = 0xf7;
2139  0037 35f70001      	mov	__ventibuf,#247
2140  003b 2060          	jra	L737
2141  003d               L337:
2142                     ; 660 		else if( _tta[0] == 1 )
2144  003d a101          	cp	a,#1
2145  003f 2612          	jrne	L147
2146                     ; 662 			if( k == 0x61 )
2148  0041 7b04          	ld	a,(OFST+1,sp)
2149  0043 a161          	cp	a,#97
2150  0045 2606          	jrne	L347
2151                     ; 663 				_tta[0] = 11;
2153  0047 350b004c      	mov	__tta,#11
2155  004b 2050          	jra	L737
2156  004d               L347:
2157                     ; 665 				_tta[0] = 0;
2159  004d 725f004c      	clr	__tta
2160  0051 204a          	jra	L737
2161  0053               L147:
2162                     ; 667 		else if( _tta[0] == 11 )	
2164  0053 a10b          	cp	a,#11
2165  0055 2611          	jrne	L157
2166                     ; 669 			_tta[2] = 0;
2168  0057 725f004e      	clr	__tta+2
2169                     ; 670 			_tta[1] = k - 2;
2171  005b 7b04          	ld	a,(OFST+1,sp)
2172  005d a002          	sub	a,#2
2173  005f c7004d        	ld	__tta+1,a
2174                     ; 671 			_tta[0] = 12;
2176  0062 350c004c      	mov	__tta,#12
2178  0066 2035          	jra	L737
2179  0068               L157:
2180                     ; 673 		else if( _tta[0] == 12 )	
2182  0068 a10c          	cp	a,#12
2183  006a 260c          	jrne	L557
2184                     ; 675 			_tta[0] = k==0 ? 15 : 13;	
2186  006c 7b04          	ld	a,(OFST+1,sp)
2187  006e 2604          	jrne	L271
2188  0070 a60f          	ld	a,#15
2189  0072 2026          	jra	LC015
2190  0074               L271:
2191  0074 a60d          	ld	a,#13
2193  0076 2022          	jp	LC015
2194  0078               L557:
2195                     ; 677 		else if( _tta[0] == 13 )
2197  0078 a10d          	cp	a,#13
2198  007a 2610          	jrne	L167
2199                     ; 679 			_tta[2]++;
2201  007c 725c004e      	inc	__tta+2
2202                     ; 680 			if( _tta[2] == _tta[1] )
2204  0080 c6004e        	ld	a,__tta+2
2205  0083 c1004d        	cp	a,__tta+1
2206  0086 2615          	jrne	L737
2207                     ; 681 				_tta[0] = 15;
2209  0088 a60f          	ld	a,#15
2210  008a 200e          	jp	LC015
2211  008c               L167:
2212                     ; 683 		else if( _tta[0] == 15 )	{	_tta[0] = 16;	}	/*	xor*/
2214  008c a10f          	cp	a,#15
2215  008e 2604          	jrne	L767
2218  0090 a610          	ld	a,#16
2220  0092 2006          	jp	LC015
2221  0094               L767:
2222                     ; 684 		else if( _tta[0] == 16 )	{	_tta[0] = 17;	}	/*	xsum*/
2224  0094 a110          	cp	a,#16
2225  0096 2605          	jrne	L737
2228  0098 a611          	ld	a,#17
2229  009a               LC015:
2230  009a c7004c        	ld	__tta,a
2231  009d               L737:
2232                     ; 686 		if( _tta[0] == 17 )
2234  009d c6004c        	ld	a,__tta
2235  00a0 a111          	cp	a,#17
2236  00a2 2663          	jrne	L727
2237                     ; 688 			_tta[0] = 0xf0;
2239  00a4 35f0004c      	mov	__tta,#240
2240                     ; 689 			s = x = 0;
2242  00a8 0f01          	clr	(OFST-2,sp)
2243  00aa 0f02          	clr	(OFST-1,sp)
2244                     ; 690 			for( i=1; i<_ventibuf[2]-2; i++ )
2246  00ac a601          	ld	a,#1
2247  00ae 6b03          	ld	(OFST+0,sp),a
2249  00b0 2016          	jra	L3001
2250  00b2               L777:
2251                     ; 692 				x ^= _ventibuf[i];
2253  00b2 5f            	clrw	x
2254  00b3 97            	ld	xl,a
2255  00b4 7b01          	ld	a,(OFST-2,sp)
2256  00b6 d80001        	xor	a,(__ventibuf,x)
2257  00b9 6b01          	ld	(OFST-2,sp),a
2258                     ; 693 				s += _ventibuf[i];
2260  00bb 5f            	clrw	x
2261  00bc 7b03          	ld	a,(OFST+0,sp)
2262  00be 97            	ld	xl,a
2263  00bf 7b02          	ld	a,(OFST-1,sp)
2264  00c1 db0001        	add	a,(__ventibuf,x)
2265  00c4 6b02          	ld	(OFST-1,sp),a
2266                     ; 690 			for( i=1; i<_ventibuf[2]-2; i++ )
2268  00c6 0c03          	inc	(OFST+0,sp)
2269  00c8               L3001:
2272  00c8 c60003        	ld	a,__ventibuf+2
2273  00cb 5f            	clrw	x
2274  00cc 97            	ld	xl,a
2275  00cd 1d0002        	subw	x,#2
2276  00d0 7b03          	ld	a,(OFST+0,sp)
2277  00d2 905f          	clrw	y
2278  00d4 9097          	ld	yl,a
2279  00d6 90bf00        	ldw	c_y,y
2280  00d9 b300          	cpw	x,c_y
2281  00db 2cd5          	jrsgt	L777
2282                     ; 695 			s += x;
2284  00dd 7b02          	ld	a,(OFST-1,sp)
2285  00df 1b01          	add	a,(OFST-2,sp)
2286  00e1 6b02          	ld	(OFST-1,sp),a
2287                     ; 696 			if( x == _ventibuf[_ventibuf[2]-2] && s == _ventibuf[_ventibuf[2]-1] )
2289  00e3 5f            	clrw	x
2290  00e4 c60003        	ld	a,__ventibuf+2
2291  00e7 97            	ld	xl,a
2292  00e8 1d0002        	subw	x,#2
2293  00eb d60001        	ld	a,(__ventibuf,x)
2294  00ee 1101          	cp	a,(OFST-2,sp)
2295  00f0 2615          	jrne	L727
2297  00f2 c60003        	ld	a,__ventibuf+2
2298  00f5 5f            	clrw	x
2299  00f6 97            	ld	xl,a
2300  00f7 5a            	decw	x
2301  00f8 d60001        	ld	a,(__ventibuf,x)
2302  00fb 1102          	cp	a,(OFST-1,sp)
2303  00fd 2608          	jrne	L727
2304                     ; 698 				if( (_ventibuf[3] & 0x80) != 0x80 )
2306  00ff 720e000403    	btjt	__ventibuf+3,#7,L727
2307                     ; 699 					venti();
2309  0104 cd0000        	call	_venti
2311  0107               L727:
2312                     ; 646 	while( uart3_Ready() )
2314  0107 cd0000        	call	_uart3_Ready
2316  010a 4d            	tnz	a
2317  010b 2703cc0006    	jrne	L527
2318                     ; 703 }
2321  0110 5b04          	addw	sp,#4
2322  0112 81            	ret	
2478                     	xdef	_loopVenti
2479                     	xdef	_venti
2480                     	xdef	_ventiSend
2481                     	switch	.bss
2482  0000               __venti:
2483  0000 00            	ds.b	1
2484                     	xdef	__venti
2485  0001               __ventibuf:
2486  0001 000000000000  	ds.b	24
2487                     	xdef	__ventibuf
2488  0019               __ventibuf2:
2489  0019 000000000000  	ds.b	24
2490                     	xdef	__ventibuf2
2491                     	xdef	_get_ventiInfo
2492  0031               _ventiInfo:
2493  0031 000000000000  	ds.b	10
2494                     	xdef	_ventiInfo
2495                     	xdef	_vstTbl
2496                     	xdef	_loopTta
2497                     	xdef	_ttaTempe
2498                     	xdef	_ttaTempeSet
2499                     	xdef	_ttaTempeResponse
2500                     	xdef	_get_tempeInfo
2501  003b               _tempeInfo:
2502  003b 000000000000  	ds.b	11
2503                     	xdef	_tempeInfo
2504                     	xdef	_ttaVent
2505                     	xdef	_loopTtaCb
2506                     	xdef	_tta_sum
2507                     	xdef	_tta_xor
2508                     	xdef	_get_ventInfo
2509  0046               _ventInfo:
2510  0046 000000000000  	ds.b	6
2511                     	xdef	_ventInfo
2512  004c               __tta:
2513  004c 00000000      	ds.b	4
2514                     	xdef	__tta
2515                     	xdef	_systemUartTta
2516                     	xref	_ext_hn_ready
2517                     	xref	__t1ms
2518  0050               __ttat1:
2519  0050 00            	ds.b	1
2520                     	xdef	__ttat1
2521  0051               __ttat0:
2522  0051 00            	ds.b	1
2523                     	xdef	__ttat0
2524                     	xdef	__ttaSendReady
2525  0052               __ttabufi:
2526  0052 00            	ds.b	1
2527                     	xdef	__ttabufi
2528  0053               __ttai:
2529  0053 00            	ds.b	1
2530                     	xdef	__ttai
2531  0054               __ttabuf:
2532  0054 000000000000  	ds.b	32
2533                     	xdef	__ttabuf
2534                     	xref	_uart3_get
2535                     	xref	_uart3_tx_put
2536                     	xref	_uart3_Ready
2537                     	xref	_UART1_ITConfig
2538                     	xref	_UART1_Cmd
2539                     	xref	_UART1_Init
2540                     	xref.b	c_x
2541                     	xref.b	c_y
2561                     	xref	c_smodx
2562                     	end
