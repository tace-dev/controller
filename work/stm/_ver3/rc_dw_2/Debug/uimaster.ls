   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               __boiler_type:
  24  0000 00            	dc.b	0
  25  0001               __boiler_water_shower:
  26  0001 32            	dc.b	50
  27  0002               __boiler_water_heat:
  28  0002 46            	dc.b	70
  29  0003               __boiler_fire:
  30  0003 00            	dc.b	0
  31  0004               __remote:
  32  0004 00            	dc.b	0
  33  0005               __disp_mode:
  34  0005 01            	dc.b	1
  35  0006               __disp_mode2:
  36  0006 01            	dc.b	1
  78                     ; 57 void	disp_status_remote_message(uint8_t i)
  78                     ; 58 {
  80                     .text:	section	.text,new
  81  0000               _disp_status_remote_message:
  83  0000 88            	push	a
  84       00000000      OFST:	set	0
  87                     ; 59 	lcd_clear_btn();
  89  0001 cd0000        	call	_lcd_clear_btn
  91                     ; 60 	if( i == 0x01 )			{	LCD_BIT_SET(bT6);	/*	(0)난방*/	}
  93  0004 7b01          	ld	a,(OFST+1,sp)
  94  0006 a101          	cp	a,#1
  95  0008 260a          	jrne	L52
  98  000a c60006        	ld	a,_iLF_DEF+6
  99  000d ad32          	call	LC002
 100  000f ca0006        	or	a,_bLF_DEF+6
 102  0012 2028          	jp	LC001
 103  0014               L52:
 104                     ; 61 	else if( i == 0x02 )	{	LCD_BIT_SET(bT7);	/*	(1)외출*/	}
 106  0014 a102          	cp	a,#2
 107  0016 260a          	jrne	L13
 110  0018 c60019        	ld	a,_iLF_DEF+25
 111  001b ad24          	call	LC002
 112  001d ca0019        	or	a,_bLF_DEF+25
 114  0020 201a          	jp	LC001
 115  0022               L13:
 116                     ; 63 	else if( i == 0x08 )	{	LCD_BIT_SET(bT14);	/*	(2)예약*/	}
 118  0022 a108          	cp	a,#8
 119  0024 260a          	jrne	L53
 122  0026 c60041        	ld	a,_iLF_DEF+65
 123  0029 ad16          	call	LC002
 124  002b ca0041        	or	a,_bLF_DEF+65
 126  002e 200c          	jp	LC001
 127  0030               L53:
 128                     ; 64 	else if( i == 0x10 )	{	LCD_BIT_SET(bT18);	/*	(2)반복*/	}
 130  0030 a110          	cp	a,#16
 131  0032 260b          	jrne	L72
 134  0034 c60042        	ld	a,_iLF_DEF+66
 135  0037 ad08          	call	LC002
 136  0039 ca0042        	or	a,_bLF_DEF+66
 137  003c               LC001:
 138  003c d7540c        	ld	(21516,x),a
 139  003f               L72:
 140                     ; 65 }
 143  003f 84            	pop	a
 144  0040 81            	ret	
 145  0041               LC002:
 146  0041 5f            	clrw	x
 147  0042 97            	ld	xl,a
 148  0043 d6540c        	ld	a,(21516,x)
 149  0046 81            	ret	
 203                     ; 67 uint8_t		disp_status_loop_remote_N(uint8_t key)
 203                     ; 68 {
 204                     .text:	section	.text,new
 205  0000               _disp_status_loop_remote_N:
 207  0000 88            	push	a
 208  0001 89            	pushw	x
 209       00000002      OFST:	set	2
 212                     ; 70 	uint8_t	j = 0;
 214  0002 0f01          	clr	(OFST-1,sp)
 215                     ; 71 	i = uiInfo.tempSetup[key];
 217  0004 5f            	clrw	x
 218  0005 97            	ld	xl,a
 219  0006 d6003d        	ld	a,(_uiInfo+61,x)
 220  0009 6b02          	ld	(OFST+0,sp),a
 221                     ; 72 	if( uiInfo.enc != 0 )
 223  000b c60000        	ld	a,_uiInfo
 224  000e 2727          	jreq	L36
 225                     ; 74 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
 227  0010 a540          	bcp	a,#64
 228  0012 2604          	jrne	L21
 229  0014 a6ff          	ld	a,#255
 230  0016 2002          	jra	L41
 231  0018               L21:
 232  0018 a601          	ld	a,#1
 233  001a               L41:
 234  001a 1b02          	add	a,(OFST+0,sp)
 235                     ; 75 		if( i<=10 )	i = 10;
 237  001c a10b          	cp	a,#11
 238  001e 2402          	jruge	L56
 241  0020 a60a          	ld	a,#10
 242  0022               L56:
 243                     ; 76 		if( i>=80 )	i = 80;
 245  0022 a150          	cp	a,#80
 246  0024 2502          	jrult	L76
 249  0026 a650          	ld	a,#80
 250  0028               L76:
 251  0028 6b02          	ld	(OFST+0,sp),a
 252                     ; 77 		uiInfo.tempSetup[key] = i;
 254  002a 5f            	clrw	x
 255  002b 7b03          	ld	a,(OFST+1,sp)
 256  002d 97            	ld	xl,a
 257  002e 7b02          	ld	a,(OFST+0,sp)
 258  0030 d7003d        	ld	(_uiInfo+61,x),a
 259                     ; 78 		j = 1;
 261  0033 a601          	ld	a,#1
 262  0035 6b01          	ld	(OFST-1,sp),a
 263  0037               L36:
 264                     ; 80 	if( _dsPrev != i )
 266  0037 c60000        	ld	a,__dsPrev
 267  003a 1102          	cp	a,(OFST+0,sp)
 268  003c 273a          	jreq	L17
 269                     ; 82 		_dsPrev = i;
 271  003e 7b02          	ld	a,(OFST+0,sp)
 272  0040 c70000        	ld	__dsPrev,a
 273                     ; 83 		LCD_BIT_SET(bT1);	//	현재온도
 275  0043 5f            	clrw	x
 276  0044 c60004        	ld	a,_iLF_DEF+4
 277  0047 97            	ld	xl,a
 278  0048 d6540c        	ld	a,(21516,x)
 279  004b ca0004        	or	a,_bLF_DEF+4
 280  004e d7540c        	ld	(21516,x),a
 281                     ; 84 		LCD_BIT_SET(bT4);	//	설정온도
 283  0051 c6000f        	ld	a,_iLF_DEF+15
 284  0054 5f            	clrw	x
 285  0055 97            	ld	xl,a
 286  0056 d6540c        	ld	a,(21516,x)
 287  0059 ca000f        	or	a,_bLF_DEF+15
 288  005c d7540c        	ld	(21516,x),a
 289                     ; 85 		__ui_disp_temp_c(3);//도씨 표시
 291  005f a603          	ld	a,#3
 292  0061 cd0000        	call	___ui_disp_temp_c
 294                     ; 86 		ui_disp_temp_setup(uiInfo.tempSetup[key]);
 296  0064 7b03          	ld	a,(OFST+1,sp)
 297  0066 5f            	clrw	x
 298  0067 97            	ld	xl,a
 299  0068 d6003d        	ld	a,(_uiInfo+61,x)
 300  006b cd0000        	call	_ui_disp_temp_setup
 302                     ; 87 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 304  006e 7b03          	ld	a,(OFST+1,sp)
 305  0070 5f            	clrw	x
 306  0071 97            	ld	xl,a
 307  0072 d60035        	ld	a,(_uiInfo+53,x)
 308  0075 cd0000        	call	_ui_disp_temp_curr
 310  0078               L17:
 311                     ; 90 	return j;
 313  0078 7b01          	ld	a,(OFST-1,sp)
 316  007a 5b03          	addw	sp,#3
 317  007c 81            	ret	
 367                     ; 93 uint8_t	disp_status_loop_remote_Y(uint8_t key)
 367                     ; 94 {
 368                     .text:	section	.text,new
 369  0000               _disp_status_loop_remote_Y:
 371  0000 88            	push	a
 372  0001 89            	pushw	x
 373       00000002      OFST:	set	2
 376                     ; 96 	uint8_t	j = 0;
 378  0002 0f01          	clr	(OFST-1,sp)
 379                     ; 97 	i = uiInfo.remote_time[key];
 381  0004 5f            	clrw	x
 382  0005 97            	ld	xl,a
 383  0006 d6004d        	ld	a,(_uiInfo+77,x)
 384  0009 6b02          	ld	(OFST+0,sp),a
 385                     ; 98 	if( uiInfo.enc != 0 )
 387  000b c60000        	ld	a,_uiInfo
 388  000e 2727          	jreq	L311
 389                     ; 100 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
 391  0010 a540          	bcp	a,#64
 392  0012 2604          	jrne	L62
 393  0014 a6ff          	ld	a,#255
 394  0016 2002          	jra	L03
 395  0018               L62:
 396  0018 a601          	ld	a,#1
 397  001a               L03:
 398  001a 1b02          	add	a,(OFST+0,sp)
 399                     ; 101 		if( i<=2 )	i = 2;
 401  001c a103          	cp	a,#3
 402  001e 2402          	jruge	L511
 405  0020 a602          	ld	a,#2
 406  0022               L511:
 407                     ; 102 		if( i>=48 )	i = 48;
 409  0022 a130          	cp	a,#48
 410  0024 2502          	jrult	L711
 413  0026 a630          	ld	a,#48
 414  0028               L711:
 415  0028 6b02          	ld	(OFST+0,sp),a
 416                     ; 103 		uiInfo.remote_time[key] = i;
 418  002a 5f            	clrw	x
 419  002b 7b03          	ld	a,(OFST+1,sp)
 420  002d 97            	ld	xl,a
 421  002e 7b02          	ld	a,(OFST+0,sp)
 422  0030 d7004d        	ld	(_uiInfo+77,x),a
 423                     ; 104 		j = 1;
 425  0033 a601          	ld	a,#1
 426  0035 6b01          	ld	(OFST-1,sp),a
 427  0037               L311:
 428                     ; 107 	if( _dsPrev != i )
 430  0037 c60000        	ld	a,__dsPrev
 431  003a 1102          	cp	a,(OFST+0,sp)
 432  003c 270f          	jreq	L121
 433                     ; 109 		_dsPrev = i;
 435  003e 7b02          	ld	a,(OFST+0,sp)
 436  0040 c70000        	ld	__dsPrev,a
 437                     ; 114 		ui_disp_reserve_setup(uiInfo.remote_time[key]);		
 439  0043 5f            	clrw	x
 440  0044 7b03          	ld	a,(OFST+1,sp)
 441  0046 97            	ld	xl,a
 442  0047 d6004d        	ld	a,(_uiInfo+77,x)
 443  004a cd0000        	call	_ui_disp_reserve_setup
 445  004d               L121:
 446                     ; 117 	return j;
 448  004d 7b01          	ld	a,(OFST-1,sp)
 451  004f 5b03          	addw	sp,#3
 452  0051 81            	ret	
 489                     ; 120 uint8_t		disp_status_loop_remote_J(uint8_t key)
 489                     ; 121 {
 490                     .text:	section	.text,new
 491  0000               _disp_status_loop_remote_J:
 493  0000 88            	push	a
 494       00000000      OFST:	set	0
 497                     ; 123 	if (_dsPrev != 0xFE ) {
 499  0001 c60000        	ld	a,__dsPrev
 500  0004 a1fe          	cp	a,#254
 501  0006 2713          	jreq	L731
 502                     ; 124 		_dsPrev = 0xFE;
 504  0008 35fe0000      	mov	__dsPrev,#254
 505                     ; 125 		ui_disp_clear_tSetup(1);
 507  000c a601          	ld	a,#1
 508  000e cd0000        	call	_ui_disp_clear_tSetup
 510                     ; 126 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 512  0011 7b01          	ld	a,(OFST+1,sp)
 513  0013 5f            	clrw	x
 514  0014 97            	ld	xl,a
 515  0015 d60035        	ld	a,(_uiInfo+53,x)
 516  0018 cd0000        	call	_ui_disp_temp_curr
 518  001b               L731:
 519                     ; 129 	return key;
 521  001b 7b01          	ld	a,(OFST+1,sp)
 524  001d 5b01          	addw	sp,#1
 525  001f 81            	ret	
 565                     ; 132 uint8_t		disp_status_loop_remote_O(uint8_t key)
 565                     ; 133 {
 566                     .text:	section	.text,new
 567  0000               _disp_status_loop_remote_O:
 569  0000 88            	push	a
 570       00000000      OFST:	set	0
 573                     ; 135 	if (_dsPrev != 0xFE ) {
 575  0001 c60000        	ld	a,__dsPrev
 576  0004 a1fe          	cp	a,#254
 577  0006 2734          	jreq	L551
 578                     ; 136 		_dsPrev = 0xFE;
 580  0008 35fe0000      	mov	__dsPrev,#254
 581                     ; 142 		LCD_BIT_SET(bT1);	//	현재온도
 583  000c 5f            	clrw	x
 584  000d c60004        	ld	a,_iLF_DEF+4
 585  0010 97            	ld	xl,a
 586  0011 d6540c        	ld	a,(21516,x)
 587  0014 ca0004        	or	a,_bLF_DEF+4
 588  0017 d7540c        	ld	(21516,x),a
 589                     ; 143 		LCD_BIT_SET(bT4);	//	설정온도
 591  001a c6000f        	ld	a,_iLF_DEF+15
 592  001d 5f            	clrw	x
 593  001e 97            	ld	xl,a
 594  001f d6540c        	ld	a,(21516,x)
 595  0022 ca000f        	or	a,_bLF_DEF+15
 596  0025 d7540c        	ld	(21516,x),a
 597                     ; 144 		__ui_disp_temp_c(3);//도씨 표시
 599  0028 a603          	ld	a,#3
 600  002a cd0000        	call	___ui_disp_temp_c
 602                     ; 145 		ui_disp_temp_setup(/*uiInfo.tempSetup[key]*/20);
 604  002d a614          	ld	a,#20
 605  002f cd0000        	call	_ui_disp_temp_setup
 607                     ; 146 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 609  0032 7b01          	ld	a,(OFST+1,sp)
 610  0034 5f            	clrw	x
 611  0035 97            	ld	xl,a
 612  0036 d60035        	ld	a,(_uiInfo+53,x)
 613  0039 cd0000        	call	_ui_disp_temp_curr
 615  003c               L551:
 616                     ; 149 	return key;
 618  003c 7b01          	ld	a,(OFST+1,sp)
 621  003e 5b01          	addw	sp,#1
 622  0040 81            	ret	
 672                     ; 152 uint8_t		disp_status_loop_remote_B(uint8_t key)
 672                     ; 153 {
 673                     .text:	section	.text,new
 674  0000               _disp_status_loop_remote_B:
 676  0000 88            	push	a
 677  0001 89            	pushw	x
 678       00000002      OFST:	set	2
 681                     ; 155 	uint8_t	j = 0;
 683  0002 0f01          	clr	(OFST-1,sp)
 684                     ; 156 	i = uiInfo.remote_banb[key];
 686  0004 5f            	clrw	x
 687  0005 97            	ld	xl,a
 688  0006 d60055        	ld	a,(_uiInfo+85,x)
 689  0009 6b02          	ld	(OFST+0,sp),a
 690                     ; 157 	if( uiInfo.enc != 0 )
 692  000b c60000        	ld	a,_uiInfo
 693  000e 272b          	jreq	L771
 694                     ; 162 		i += (uiInfo.enc&0x40)==0 ? -5 : 5;
 696  0010 a540          	bcp	a,#64
 697  0012 2604          	jrne	L45
 698  0014 a6fb          	ld	a,#251
 699  0016 2002          	jra	L65
 700  0018               L45:
 701  0018 a605          	ld	a,#5
 702  001a               L65:
 703  001a 1b02          	add	a,(OFST+0,sp)
 704  001c 6b02          	ld	(OFST+0,sp),a
 705                     ; 163 		if( i<30 )	i = 85;
 707  001e a11e          	cp	a,#30
 708  0020 2404          	jruge	L102
 711  0022 a655          	ld	a,#85
 713  0024 2006          	jp	LC003
 714  0026               L102:
 715                     ; 164 		else if( i>90 )	i = 30;
 717  0026 a15b          	cp	a,#91
 718  0028 2504          	jrult	L302
 721  002a a61e          	ld	a,#30
 722  002c               LC003:
 723  002c 6b02          	ld	(OFST+0,sp),a
 724  002e               L302:
 725                     ; 170 		uiInfo.remote_banb[key] = i;
 727  002e 7b03          	ld	a,(OFST+1,sp)
 728  0030 5f            	clrw	x
 729  0031 97            	ld	xl,a
 730  0032 7b02          	ld	a,(OFST+0,sp)
 731  0034 d70055        	ld	(_uiInfo+85,x),a
 732                     ; 171 		j = 1;
 734  0037 a601          	ld	a,#1
 735  0039 6b01          	ld	(OFST-1,sp),a
 736  003b               L771:
 737                     ; 173 	if( _dsPrev != i )
 739  003b c60000        	ld	a,__dsPrev
 740  003e 1102          	cp	a,(OFST+0,sp)
 741  0040 270f          	jreq	L702
 742                     ; 175 		_dsPrev = i;
 744  0042 7b02          	ld	a,(OFST+0,sp)
 745  0044 c70000        	ld	__dsPrev,a
 746                     ; 180 		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
 748  0047 5f            	clrw	x
 749  0048 7b03          	ld	a,(OFST+1,sp)
 750  004a 97            	ld	xl,a
 751  004b d60055        	ld	a,(_uiInfo+85,x)
 752  004e cd0000        	call	_ui_disp_repeat_setup
 754  0051               L702:
 755                     ; 182 	return j;
 757  0051 7b01          	ld	a,(OFST-1,sp)
 760  0053 5b03          	addw	sp,#3
 761  0055 81            	ret	
 810                     ; 185 uint8_t		disp_status_loop_host_Off(uint8_t key)
 810                     ; 186 {
 811                     .text:	section	.text,new
 812  0000               _disp_status_loop_host_Off:
 814  0000 89            	pushw	x
 815       00000002      OFST:	set	2
 818                     ; 188 	uint8_t	j = 0;
 820  0001 0f01          	clr	(OFST-1,sp)
 821                     ; 189 	i = uiInfo.tSetup;
 823  0003 c6000e        	ld	a,_uiInfo+14
 824  0006 6b02          	ld	(OFST+0,sp),a
 825                     ; 190 	if( uiInfo.enc != 0 )
 827  0008 c60000        	ld	a,_uiInfo
 828  000b 271e          	jreq	L132
 829                     ; 193 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 831  000d a540          	bcp	a,#64
 832  000f 2604          	jrne	L46
 833  0011 a6ff          	ld	a,#255
 834  0013 2002          	jra	L66
 835  0015               L46:
 836  0015 a601          	ld	a,#1
 837  0017               L66:
 838  0017 1b02          	add	a,(OFST+0,sp)
 839                     ; 194 		if( i<=10 )	i = 10;
 841  0019 a10b          	cp	a,#11
 842  001b 2402          	jruge	L332
 845  001d a60a          	ld	a,#10
 846  001f               L332:
 847                     ; 195 		if( i>=80 )	i = 80;
 849  001f a150          	cp	a,#80
 850  0021 2502          	jrult	L532
 853  0023 a650          	ld	a,#80
 854  0025               L532:
 855  0025 6b02          	ld	(OFST+0,sp),a
 856                     ; 198 		j = 1;
 858  0027 a601          	ld	a,#1
 859  0029 6b01          	ld	(OFST-1,sp),a
 860  002b               L132:
 861                     ; 200 	if( _dsPrev != i )
 863  002b c60000        	ld	a,__dsPrev
 864  002e 1102          	cp	a,(OFST+0,sp)
 865  0030 2705          	jreq	L732
 866                     ; 202 		_dsPrev = i;
 868  0032 7b02          	ld	a,(OFST+0,sp)
 869  0034 c70000        	ld	__dsPrev,a
 870  0037               L732:
 871                     ; 208 	return j;
 873  0037 7b01          	ld	a,(OFST-1,sp)
 876  0039 85            	popw	x
 877  003a 81            	ret	
 935                     ; 211 uint8_t		disp_status_loop_host_Out(uint8_t key)
 935                     ; 212 {
 936                     .text:	section	.text,new
 937  0000               _disp_status_loop_host_Out:
 939  0000 89            	pushw	x
 940       00000002      OFST:	set	2
 943                     ; 214 	uint8_t	j = 0;
 945  0001 0f01          	clr	(OFST-1,sp)
 946                     ; 215 	i = uiInfo.tSetup;
 948  0003 c6000e        	ld	a,_uiInfo+14
 949  0006 6b02          	ld	(OFST+0,sp),a
 950                     ; 216 	if( uiInfo.enc != 0 )
 952  0008 c60000        	ld	a,_uiInfo
 953  000b 2704          	jreq	L162
 954                     ; 224 		j = 1;
 956  000d a601          	ld	a,#1
 957  000f 6b01          	ld	(OFST-1,sp),a
 958  0011               L162:
 959                     ; 226 	if( _dsPrev != i )
 961  0011 c60000        	ld	a,__dsPrev
 962  0014 1102          	cp	a,(OFST+0,sp)
 963  0016 2730          	jreq	L362
 964                     ; 228 		_dsPrev = i;
 966  0018 7b02          	ld	a,(OFST+0,sp)
 967  001a c70000        	ld	__dsPrev,a
 968                     ; 231 		ui_disp_temp_setup(20/*uiInfo.tSetup*/);
 970  001d a614          	ld	a,#20
 971  001f cd0000        	call	_ui_disp_temp_setup
 973                     ; 232 		__ui_disp_temp_c(2+1);
 975  0022 a603          	ld	a,#3
 976  0024 cd0000        	call	___ui_disp_temp_c
 978                     ; 233 		LCD_BIT_SET(bT4);	//	설정온도
 980  0027 c6000f        	ld	a,_iLF_DEF+15
 981  002a 5f            	clrw	x
 982  002b 97            	ld	xl,a
 983  002c d6540c        	ld	a,(21516,x)
 984  002f ca000f        	or	a,_bLF_DEF+15
 985  0032 d7540c        	ld	(21516,x),a
 986                     ; 236 		ui_disp_temp_curr(uiInfo.tCurr);
 988  0035 c60002        	ld	a,_uiInfo+2
 989  0038 cd0000        	call	_ui_disp_temp_curr
 991                     ; 237 		UPDATE_BIT(BIT_TSETUP);
 993  003b 72140000      	bset	__updateBit,#2
 996  003f 5500000000    	mov	__updateTimer,___timer1s
 999  0044 35050000      	mov	__updateCount,#5
1001  0048               L362:
1002                     ; 239 	return j;
1004  0048 7b01          	ld	a,(OFST-1,sp)
1007  004a 85            	popw	x
1008  004b 81            	ret	
1058                     ; 242 uint8_t		disp_status_loop_host_Out_Long(uint8_t key)
1058                     ; 243 {
1059                     .text:	section	.text,new
1060  0000               _disp_status_loop_host_Out_Long:
1062  0000 89            	pushw	x
1063       00000002      OFST:	set	2
1066                     ; 245 	uint8_t	j = 0;
1068  0001 0f01          	clr	(OFST-1,sp)
1069                     ; 246 	i = uiInfo.tSetup;
1071  0003 c6000e        	ld	a,_uiInfo+14
1072  0006 6b02          	ld	(OFST+0,sp),a
1073                     ; 247 	if( uiInfo.enc != 0 )
1075  0008 c60000        	ld	a,_uiInfo
1076  000b 2704          	jreq	L503
1077                     ; 255 		j = 1;
1079  000d a601          	ld	a,#1
1080  000f 6b01          	ld	(OFST-1,sp),a
1081  0011               L503:
1082                     ; 257 	if( _dsPrev != i )
1084  0011 c60000        	ld	a,__dsPrev
1085  0014 1102          	cp	a,(OFST+0,sp)
1086  0016 270b          	jreq	L703
1087                     ; 259 		_dsPrev = i;
1089  0018 7b02          	ld	a,(OFST+0,sp)
1090  001a c70000        	ld	__dsPrev,a
1091                     ; 261 		ui_disp_temp_curr(uiInfo.tCurr);
1093  001d c60002        	ld	a,_uiInfo+2
1094  0020 cd0000        	call	_ui_disp_temp_curr
1096  0023               L703:
1097                     ; 264 	return j;
1099  0023 7b01          	ld	a,(OFST-1,sp)
1102  0025 85            	popw	x
1103  0026 81            	ret	
1158                     ; 267 uint8_t		disp_status_loop_host_N(uint8_t key)
1158                     ; 268 {
1159                     .text:	section	.text,new
1160  0000               _disp_status_loop_host_N:
1162  0000 89            	pushw	x
1163       00000002      OFST:	set	2
1166                     ; 270 	uint8_t	j = 0;
1168  0001 0f01          	clr	(OFST-1,sp)
1169                     ; 271 	i = uiInfo.tSetup;
1171  0003 c6000e        	ld	a,_uiInfo+14
1172  0006 6b02          	ld	(OFST+0,sp),a
1173                     ; 272 	if( uiInfo.enc != 0 )
1175  0008 c60000        	ld	a,_uiInfo
1176  000b 2721          	jreq	L133
1177                     ; 275 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1179  000d a540          	bcp	a,#64
1180  000f 2604          	jrne	L601
1181  0011 a6ff          	ld	a,#255
1182  0013 2002          	jra	L011
1183  0015               L601:
1184  0015 a601          	ld	a,#1
1185  0017               L011:
1186  0017 1b02          	add	a,(OFST+0,sp)
1187                     ; 276 		if( i<=10 )	i = 10;
1189  0019 a10b          	cp	a,#11
1190  001b 2402          	jruge	L333
1193  001d a60a          	ld	a,#10
1194  001f               L333:
1195                     ; 277 		if( i>=80 )	i = 80;
1197  001f a150          	cp	a,#80
1198  0021 2502          	jrult	L533
1201  0023 a650          	ld	a,#80
1202  0025               L533:
1203  0025 6b02          	ld	(OFST+0,sp),a
1204                     ; 278 		uiInfo.tSetup = i;
1206  0027 c7000e        	ld	_uiInfo+14,a
1207                     ; 280 		j = 1;
1209  002a a601          	ld	a,#1
1210  002c 6b01          	ld	(OFST-1,sp),a
1211  002e               L133:
1212                     ; 282 	if( _dsPrev != i )
1214  002e c60000        	ld	a,__dsPrev
1215  0031 1102          	cp	a,(OFST+0,sp)
1216  0033 271e          	jreq	L733
1217                     ; 284 		_dsPrev = i;
1219  0035 7b02          	ld	a,(OFST+0,sp)
1220  0037 c70000        	ld	__dsPrev,a
1221                     ; 287 		ui_disp_temp_setup(uiInfo.tSetup);
1223  003a c6000e        	ld	a,_uiInfo+14
1224  003d cd0000        	call	_ui_disp_temp_setup
1226                     ; 288 		ui_disp_temp_curr(uiInfo.tCurr);
1228  0040 c60002        	ld	a,_uiInfo+2
1229  0043 cd0000        	call	_ui_disp_temp_curr
1231                     ; 290 		UPDATE_BIT(BIT_TSETUP);
1233  0046 72140000      	bset	__updateBit,#2
1236  004a 5500000000    	mov	__updateTimer,___timer1s
1239  004f 35050000      	mov	__updateCount,#5
1241  0053               L733:
1242                     ; 292 	return j;
1244  0053 7b01          	ld	a,(OFST-1,sp)
1247  0055 85            	popw	x
1248  0056 81            	ret	
1306                     ; 295 uint8_t		disp_status_loop_host_N2OUT(uint8_t key)
1306                     ; 296 {
1307                     .text:	section	.text,new
1308  0000               _disp_status_loop_host_N2OUT:
1310  0000 89            	pushw	x
1311       00000002      OFST:	set	2
1314                     ; 298 	uint8_t	j = 0;
1316  0001 0f01          	clr	(OFST-1,sp)
1317                     ; 299 	i = uiInfo.tSetup;
1319  0003 c6000e        	ld	a,_uiInfo+14
1320  0006 6b02          	ld	(OFST+0,sp),a
1321                     ; 300 	if( uiInfo.enc != 0 )
1323  0008 c60000        	ld	a,_uiInfo
1324  000b 2721          	jreq	L163
1325                     ; 303 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1327  000d a540          	bcp	a,#64
1328  000f 2604          	jrne	L021
1329  0011 a6ff          	ld	a,#255
1330  0013 2002          	jra	L221
1331  0015               L021:
1332  0015 a601          	ld	a,#1
1333  0017               L221:
1334  0017 1b02          	add	a,(OFST+0,sp)
1335                     ; 304 		if( i<=10 )	i = 10;
1337  0019 a10b          	cp	a,#11
1338  001b 2402          	jruge	L363
1341  001d a60a          	ld	a,#10
1342  001f               L363:
1343                     ; 305 		if( i>=80 )	i = 80;
1345  001f a150          	cp	a,#80
1346  0021 2502          	jrult	L563
1349  0023 a650          	ld	a,#80
1350  0025               L563:
1351  0025 6b02          	ld	(OFST+0,sp),a
1352                     ; 306 		uiInfo.tSetup = i;
1354  0027 c7000e        	ld	_uiInfo+14,a
1355                     ; 308 		j = 1;
1357  002a a601          	ld	a,#1
1358  002c 6b01          	ld	(OFST-1,sp),a
1359  002e               L163:
1360                     ; 310 	if( _dsPrev != i )
1362  002e c60000        	ld	a,__dsPrev
1363  0031 1102          	cp	a,(OFST+0,sp)
1364  0033 2730          	jreq	L763
1365                     ; 312 		_dsPrev = i;
1367  0035 7b02          	ld	a,(OFST+0,sp)
1368  0037 c70000        	ld	__dsPrev,a
1369                     ; 316 		ui_disp_temp_setup(20/*uiInfo.tSetup*/);
1371  003a a614          	ld	a,#20
1372  003c cd0000        	call	_ui_disp_temp_setup
1374                     ; 317 		__ui_disp_temp_c(2+1);
1376  003f a603          	ld	a,#3
1377  0041 cd0000        	call	___ui_disp_temp_c
1379                     ; 318 		LCD_BIT_SET(bT4);	//	설정온도
1381  0044 c6000f        	ld	a,_iLF_DEF+15
1382  0047 5f            	clrw	x
1383  0048 97            	ld	xl,a
1384  0049 d6540c        	ld	a,(21516,x)
1385  004c ca000f        	or	a,_bLF_DEF+15
1386  004f d7540c        	ld	(21516,x),a
1387                     ; 321 		ui_disp_temp_curr(uiInfo.tCurr);
1389  0052 c60002        	ld	a,_uiInfo+2
1390  0055 cd0000        	call	_ui_disp_temp_curr
1392                     ; 323 		UPDATE_BIT(BIT_TSETUP);
1394  0058 72140000      	bset	__updateBit,#2
1397  005c 5500000000    	mov	__updateTimer,___timer1s
1400  0061 35050000      	mov	__updateCount,#5
1402  0065               L763:
1403                     ; 325 	return j;
1405  0065 7b01          	ld	a,(OFST-1,sp)
1408  0067 85            	popw	x
1409  0068 81            	ret	
1463                     ; 328 uint8_t	disp_status_loop_host_Y(uint8_t key)
1463                     ; 329 {
1464                     .text:	section	.text,new
1465  0000               _disp_status_loop_host_Y:
1467  0000 89            	pushw	x
1468       00000002      OFST:	set	2
1471                     ; 331 	uint8_t	j = 0;
1473  0001 0f01          	clr	(OFST-1,sp)
1474                     ; 332 	i = uiInfo.reserve;
1476  0003 c6000d        	ld	a,_uiInfo+13
1477  0006 6b02          	ld	(OFST+0,sp),a
1478                     ; 333 	if( uiInfo.enc != 0 )
1480  0008 c60000        	ld	a,_uiInfo
1481  000b 2721          	jreq	L114
1482                     ; 336 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1484  000d a540          	bcp	a,#64
1485  000f 2604          	jrne	L431
1486  0011 a6ff          	ld	a,#255
1487  0013 2002          	jra	L631
1488  0015               L431:
1489  0015 a601          	ld	a,#1
1490  0017               L631:
1491  0017 1b02          	add	a,(OFST+0,sp)
1492                     ; 337 		if( i<=2 )	i = 2;
1494  0019 a103          	cp	a,#3
1495  001b 2402          	jruge	L314
1498  001d a602          	ld	a,#2
1499  001f               L314:
1500                     ; 338 		if( i>=48 )	i = 48;
1502  001f a130          	cp	a,#48
1503  0021 2502          	jrult	L514
1506  0023 a630          	ld	a,#48
1507  0025               L514:
1508  0025 6b02          	ld	(OFST+0,sp),a
1509                     ; 339 		uiInfo.reserve = i;
1511  0027 c7000d        	ld	_uiInfo+13,a
1512                     ; 341 		j = 1;
1514  002a a601          	ld	a,#1
1515  002c 6b01          	ld	(OFST-1,sp),a
1516  002e               L114:
1517                     ; 343 	if( _dsPrev != i )
1519  002e c60000        	ld	a,__dsPrev
1520  0031 1102          	cp	a,(OFST+0,sp)
1521  0033 2718          	jreq	L714
1522                     ; 345 		_dsPrev = i;
1524  0035 7b02          	ld	a,(OFST+0,sp)
1525  0037 c70000        	ld	__dsPrev,a
1526                     ; 348 		ui_disp_reserve_setup(uiInfo.reserve);
1528  003a c6000d        	ld	a,_uiInfo+13
1529  003d cd0000        	call	_ui_disp_reserve_setup
1531                     ; 349 		UPDATE_BIT(BIT_RESERVE);
1533  0040 72120000      	bset	__updateBit,#1
1536  0044 5500000000    	mov	__updateTimer,___timer1s
1539  0049 35050000      	mov	__updateCount,#5
1541  004d               L714:
1542                     ; 351 	return j;
1544  004d 7b01          	ld	a,(OFST-1,sp)
1547  004f 85            	popw	x
1548  0050 81            	ret	
1602                     ; 354 uint8_t		disp_status_loop_host_B(uint8_t key)
1602                     ; 355 {
1603                     .text:	section	.text,new
1604  0000               _disp_status_loop_host_B:
1606  0000 89            	pushw	x
1607       00000002      OFST:	set	2
1610                     ; 357 	uint8_t	j = 0;
1612  0001 0f01          	clr	(OFST-1,sp)
1613                     ; 358 	i = uiInfo.repeat;
1615  0003 c6000c        	ld	a,_uiInfo+12
1616  0006 6b02          	ld	(OFST+0,sp),a
1617                     ; 359 	if( uiInfo.enc != 0 )
1619  0008 c60000        	ld	a,_uiInfo
1620  000b 2725          	jreq	L144
1621                     ; 362 		i += (uiInfo.enc&0x40)==0 ? -5 : 5;
1623  000d a540          	bcp	a,#64
1624  000f 2604          	jrne	L441
1625  0011 a6fb          	ld	a,#251
1626  0013 2002          	jra	L641
1627  0015               L441:
1628  0015 a605          	ld	a,#5
1629  0017               L641:
1630  0017 1b02          	add	a,(OFST+0,sp)
1631  0019 6b02          	ld	(OFST+0,sp),a
1632                     ; 363 		if( i<30 )	i = 85;
1634  001b a11e          	cp	a,#30
1635  001d 2404          	jruge	L344
1638  001f a655          	ld	a,#85
1640  0021 2006          	jp	LC004
1641  0023               L344:
1642                     ; 364 		else if( i>90 )	i = 30;
1644  0023 a15b          	cp	a,#91
1645  0025 2504          	jrult	L544
1648  0027 a61e          	ld	a,#30
1649  0029               LC004:
1650  0029 6b02          	ld	(OFST+0,sp),a
1651  002b               L544:
1652                     ; 365 		uiInfo.repeat = i;
1654  002b c7000c        	ld	_uiInfo+12,a
1655                     ; 367 		j = 1;
1657  002e a601          	ld	a,#1
1658  0030 6b01          	ld	(OFST-1,sp),a
1659  0032               L144:
1660                     ; 369 	if( _dsPrev != i )
1662  0032 c60000        	ld	a,__dsPrev
1663  0035 1102          	cp	a,(OFST+0,sp)
1664  0037 2718          	jreq	L154
1665                     ; 371 		_dsPrev = i;
1667  0039 7b02          	ld	a,(OFST+0,sp)
1668  003b c70000        	ld	__dsPrev,a
1669                     ; 374 		ui_disp_repeat_setup(uiInfo.repeat);
1671  003e c6000c        	ld	a,_uiInfo+12
1672  0041 cd0000        	call	_ui_disp_repeat_setup
1674                     ; 375 		UPDATE_BIT(BIT_REPEAT);
1676  0044 72100000      	bset	__updateBit,#0
1679  0048 5500000000    	mov	__updateTimer,___timer1s
1682  004d 35050000      	mov	__updateCount,#5
1684  0051               L154:
1685                     ; 377 	return j;
1687  0051 7b01          	ld	a,(OFST-1,sp)
1690  0053 85            	popw	x
1691  0054 81            	ret	
1694                     	switch	.data
1695  0007               __key_blink:
1696  0007 00            	dc.b	0
1746                     ; 383 void	disp_rid_info(void)
1746                     ; 384 {
1747                     .text:	section	.text,new
1748  0000               _disp_rid_info:
1750  0000 5203          	subw	sp,#3
1751       00000003      OFST:	set	3
1754                     ; 390 	j = uiInfo.cnt + uiInfo.cnt_sub;
1756  0002 c60005        	ld	a,_uiInfo+5
1757  0005 cb0006        	add	a,_uiInfo+6
1758  0008 6b01          	ld	(OFST-2,sp),a
1759                     ; 391 	for( i=1; i<6; i++ )
1761  000a a601          	ld	a,#1
1762  000c 6b03          	ld	(OFST+0,sp),a
1763  000e               L374:
1764                     ; 393 		lcd_clear_rid_n(i + 1, 1);
1766  000e ae0001        	ldw	x,#1
1767  0011 4c            	inc	a
1768  0012 95            	ld	xh,a
1769  0013 cd0000        	call	_lcd_clear_rid_n
1771                     ; 394 		if( i <= j )
1773  0016 7b03          	ld	a,(OFST+0,sp)
1774  0018 1101          	cp	a,(OFST-2,sp)
1775  001a 2222          	jrugt	L105
1776                     ; 396 			if( packet_buf[i] != 10 ){
1778  001c 5f            	clrw	x
1779  001d 97            	ld	xl,a
1780  001e d60000        	ld	a,(_packet_buf,x)
1781  0021 a10a          	cp	a,#10
1782  0023 2719          	jreq	L105
1783                     ; 397 				led = getHexToBin(_rcLED, i);
1785  0025 7b03          	ld	a,(OFST+0,sp)
1786  0027 97            	ld	xl,a
1787  0028 c60000        	ld	a,__rcLED
1788  002b 95            	ld	xh,a
1789  002c cd0000        	call	_getHexToBin
1791  002f 6b02          	ld	(OFST-1,sp),a
1792                     ; 398 				lcd_disp_rid(i + 1, led, 1);
1794  0031 4b01          	push	#1
1795  0033 7b03          	ld	a,(OFST+0,sp)
1796  0035 97            	ld	xl,a
1797  0036 7b04          	ld	a,(OFST+1,sp)
1798  0038 4c            	inc	a
1799  0039 95            	ld	xh,a
1800  003a cd0000        	call	_lcd_disp_rid
1802  003d 84            	pop	a
1803  003e               L105:
1804                     ; 391 	for( i=1; i<6; i++ )
1806  003e 0c03          	inc	(OFST+0,sp)
1809  0040 7b03          	ld	a,(OFST+0,sp)
1810  0042 a106          	cp	a,#6
1811  0044 25c8          	jrult	L374
1812                     ; 402 }
1815  0046 5b03          	addw	sp,#3
1816  0048 81            	ret	
1852                     ; 413 void	_disp_status_loop_host_boiler(uint8_t id)
1852                     ; 414 {
1853                     .text:	section	.text,new
1854  0000               __disp_status_loop_host_boiler:
1858                     ; 415 	uiInfo.opMode = (id==0) ? 7 : __boiler_shower[3];
1860  0000 4d            	tnz	a
1861  0001 2604          	jrne	L461
1862  0003 a607          	ld	a,#7
1863  0005 2003          	jra	L661
1864  0007               L461:
1865  0007 c60016        	ld	a,___boiler_shower+3
1866  000a               L661:
1867  000a c70007        	ld	_uiInfo+7,a
1868                     ; 416 	func_rc_setting();
1871                     ; 417 }
1874  000d cc0000        	jp	_func_rc_setting
1988                     ; 421 void	disp_status_loop_host(uint8_t key)
1988                     ; 422 {
1989                     .text:	section	.text,new
1990  0000               _disp_status_loop_host:
1992  0000 88            	push	a
1993  0001 89            	pushw	x
1994       00000002      OFST:	set	2
1997                     ; 423 	uint8_t	i = 0;
1999  0002 0f02          	clr	(OFST+0,sp)
2000                     ; 424 	uint8_t	j = 0;
2002                     ; 425 	uint8_t	k = 0;
2004  0004 0f01          	clr	(OFST-1,sp)
2005                     ; 427 	if (_remote == 0/* && __s != 200*/ ) {
2007  0006 c60004        	ld	a,__remote
2008  0009 2603          	jrne	L306
2009                     ; 428 		disp_rid_info();
2011  000b cd0000        	call	_disp_rid_info
2013  000e               L306:
2014                     ; 431 	if( __s == 0 )  // 일반 모드
2016  000e c60000        	ld	a,___s
2017  0011 2703cc0542    	jrne	L506
2018                     ; 433 		if( _dsCount == 0 )
2020  0016 c60000        	ld	a,__dsCount
2021  0019 2618          	jrne	L706
2022                     ; 435 			_dsCount = 10;
2024  001b 350a0000      	mov	__dsCount,#10
2025                     ; 439 			if (start_flag == 0) {	__sUp = 0;		}
2027  001f 725d0000      	tnz	_start_flag
2028  0023 2603          	jrne	L116
2031  0025 c70000        	ld	___sUp,a
2032  0028               L116:
2033                     ; 449 			start_flag = 0;
2035  0028 725f0000      	clr	_start_flag
2036                     ; 451 			__sDn = 0xff;
2038  002c 35ff0000      	mov	___sDn,#255
2040  0030 cc09eb        	jra	L3731
2041  0033               L706:
2042                     ; 454 		} else if (_dsCount == 9) {
2044  0033 a109          	cp	a,#9
2045  0035 260e          	jrne	L516
2046                     ; 455 			_dsCount = 1;
2048  0037 35010000      	mov	__dsCount,#1
2049                     ; 456 			__sDn = 0xff;
2051  003b 35ff0000      	mov	___sDn,#255
2052                     ; 457 			disp_status_loop_init();
2054  003f cd0000        	call	_disp_status_loop_init
2057  0042 cc09eb        	jra	L3731
2058  0045               L516:
2059                     ; 459 		else if( _dsCount == 10 )
2061  0045 a10a          	cp	a,#10
2062  0047 2703cc00e5    	jrne	L126
2063                     ; 464 			if( __sUp == 0 )		_dsCount = 15;	//	N
2065  004c c60000        	ld	a,___sUp
2066  004f 2606          	jrne	L326
2069  0051 350f0000      	mov	__dsCount,#15
2071  0055 2052          	jra	L526
2072  0057               L326:
2073                     ; 467 			else if( __sUp == 5 )	{_dsCount = 45; _key_time_event[0] = 0; }	//	off
2075  0057 a105          	cp	a,#5
2076  0059 260a          	jrne	L726
2079  005b 352d0000      	mov	__dsCount,#45
2082  005f 725f0000      	clr	__key_time_event
2084  0063 2044          	jra	L526
2085  0065               L726:
2086                     ; 468 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //	out
2088  0065 a110          	cp	a,#16
2089  0067 260a          	jrne	L336
2092  0069 35100000      	mov	__dsCount,#16
2095  006d 35080000      	mov	___sUp,#8
2097  0071 2036          	jra	L526
2098  0073               L336:
2099                     ; 469 			else if( __sUp == 101 )	{	_dsCount = 0;	__s = 101; }
2101  0073 a165          	cp	a,#101
2102  0075 260a          	jrne	L736
2105  0077 725f0000      	clr	__dsCount
2108  007b 35650000      	mov	___s,#101
2110  007f 2028          	jra	L526
2111  0081               L736:
2112                     ; 470 			else if( __sUp == 20 )	{	
2114  0081 a114          	cp	a,#20
2115  0083 260a          	jrne	L346
2116                     ; 471 				_dsCount = 0; 
2118  0085 725f0000      	clr	__dsCount
2119                     ; 472 				__s = 1;
2121  0089 35010000      	mov	___s,#1
2123  008d 201a          	jra	L526
2124  008f               L346:
2125                     ; 474 			else if( __sUp == 17 )	{_dsCount = 17; _dsPrev = 0xff;}	//	Out long
2127  008f a111          	cp	a,#17
2128  0091 260a          	jrne	L746
2131  0093 35110000      	mov	__dsCount,#17
2134  0097 35ff0000      	mov	__dsPrev,#255
2136  009b 200c          	jra	L526
2137  009d               L746:
2138                     ; 475 			else if( __sUp == 151 || __sUp == 16 )	_dsCount = 151;	//	외출
2140  009d a197          	cp	a,#151
2141  009f 2704          	jreq	L556
2143  00a1 a110          	cp	a,#16
2144  00a3 260a          	jrne	L356
2145  00a5               L556:
2148  00a5 35970000      	mov	__dsCount,#151
2150  00a9               L526:
2151                     ; 482 			disp_status_loop_init();
2153  00a9 cd0000        	call	_disp_status_loop_init
2156  00ac cc09eb        	jra	L3731
2157  00af               L356:
2158                     ; 476 			else if( __sUp == 152 )	_dsCount = 152;	//	온수
2160  00af a198          	cp	a,#152
2161  00b1 2606          	jrne	L166
2164  00b3 35980000      	mov	__dsCount,#152
2166  00b7 20f0          	jra	L526
2167  00b9               L166:
2168                     ; 477 			else if( __sUp == 153 )	_dsCount = 153;	//	난방
2170  00b9 a199          	cp	a,#153
2171  00bb 2606          	jrne	L566
2174  00bd 35990000      	mov	__dsCount,#153
2176  00c1 20e6          	jra	L526
2177  00c3               L566:
2178                     ; 478 			else if( __sUp == 154 || __sUp == 1 )	_dsCount = 154;	//	예약
2180  00c3 a19a          	cp	a,#154
2181  00c5 2704          	jreq	L376
2183  00c7 a101          	cp	a,#1
2184  00c9 2606          	jrne	L176
2185  00cb               L376:
2188  00cb 359a0000      	mov	__dsCount,#154
2190  00cf 20d8          	jra	L526
2191  00d1               L176:
2192                     ; 479 			else if( __sUp == 155 || __sUp == 2 )	_dsCount = 155;	//	타이머
2194  00d1 a19b          	cp	a,#155
2195  00d3 2704          	jreq	L107
2197  00d5 a102          	cp	a,#2
2198  00d7 2606          	jrne	L776
2199  00d9               L107:
2202  00d9 359b0000      	mov	__dsCount,#155
2204  00dd 20ca          	jra	L526
2205  00df               L776:
2206                     ; 481 				_dsCount = 1;
2208  00df 35010000      	mov	__dsCount,#1
2209  00e3 20c4          	jra	L526
2210  00e5               L126:
2211                     ; 486 		else if( _dsCount == 16 )			//	OUT
2213  00e5 a110          	cp	a,#16
2214  00e7 260b          	jrne	L707
2215                     ; 499 			_GOTO(151);
2217  00e9 35970000      	mov	___sUp,#151
2220  00ed 350a0000      	mov	__dsCount,#10
2223  00f1 cc09eb        	jra	L3731
2224  00f4               L707:
2225                     ; 501 		else if( _dsCount == 15 )			//	N/Out
2227  00f4 a10f          	cp	a,#15
2228  00f6 2657          	jrne	L317
2229                     ; 503 			if( key==1 )		_GOTO(151)	//	To OUT
2231  00f8 7b03          	ld	a,(OFST+1,sp)
2232  00fa a101          	cp	a,#1
2233  00fc 260a          	jrne	L517
2236  00fe 35970000      	mov	___sUp,#151
2239  0102 350a0000      	mov	__dsCount,#10
2241  0106 2032          	jra	L717
2242  0108               L517:
2243                     ; 504 			else if( key==2 )	{ _NOT_KEY_ }	//	
2245  0108 a102          	cp	a,#2
2246  010a 272e          	jreq	L717
2249                     ; 505 			else if( key==4 ) _GOTO(152)		//	MODE	
2251  010c a104          	cp	a,#4
2252  010e 260a          	jrne	L527
2255  0110 35980000      	mov	___sUp,#152
2258  0114 350a0000      	mov	__dsCount,#10
2260  0118 2020          	jra	L717
2261  011a               L527:
2262                     ; 506 			else if( key==8 )	_GOTO(101)	//	REMOTE
2264  011a a108          	cp	a,#8
2265  011c 260a          	jrne	L137
2268  011e 35650000      	mov	___sUp,#101
2271  0122 350a0000      	mov	__dsCount,#10
2273  0126 2012          	jra	L717
2274  0128               L137:
2275                     ; 507 			else if( key==16 )	_DN
2277  0128 a110          	cp	a,#16
2278  012a 2606          	jrne	L537
2281  012c 35400000      	mov	_uiInfo,#64
2283  0130 2008          	jra	L717
2284  0132               L537:
2285                     ; 508 			else if( key==32 )	_UP				
2287  0132 a120          	cp	a,#32
2288  0134 2604          	jrne	L717
2291  0136 35010000      	mov	_uiInfo,#1
2292  013a               L717:
2293                     ; 509 			_disp_temp = 1;
2295  013a 35010000      	mov	__disp_temp,#1
2296                     ; 510 			i = disp_status_loop_host_N(key);
2298  013e 7b03          	ld	a,(OFST+1,sp)
2299  0140 cd0000        	call	_disp_status_loop_host_N
2301  0143 6b02          	ld	(OFST+0,sp),a
2302                     ; 511 			if( i==1 )
2304  0145 4a            	dec	a
2305  0146 26a9          	jrne	L3731
2306                     ; 512 				_key_blink = 1;
2308  0148 35010007      	mov	__key_blink,#1
2309  014c cc09eb        	jra	L3731
2310  014f               L317:
2311                     ; 514 		else if( _dsCount == 151 )			//	OUT/Nan
2313  014f a197          	cp	a,#151
2314  0151 263b          	jrne	L747
2315                     ; 518 			if( key==1 )		_GOTO(0)	//	To Nan	
2317  0153 7b03          	ld	a,(OFST+1,sp)
2318  0155 a101          	cp	a,#1
2319  0157 2606          	jrne	L157
2322  0159 725f0000      	clr	___sUp
2325  015d 2016          	jp	LC005
2326  015f               L157:
2327                     ; 519 			else if( key==2 )	{ _NOT_KEY_ }	//	
2329  015f a102          	cp	a,#2
2330  0161 2716          	jreq	L567
2333                     ; 520 			else if( key==4 )	_GOTO(/*2*/154)	//	MODE
2335  0163 a104          	cp	a,#4
2336  0165 2606          	jrne	L167
2339  0167 359a0000      	mov	___sUp,#154
2342  016b 2008          	jp	LC005
2343  016d               L167:
2344                     ; 521 			else if( key==8 )	_GOTO(101)	//	REMOTE
2346  016d a108          	cp	a,#8
2347  016f 2608          	jrne	L567
2350  0171 35650000      	mov	___sUp,#101
2353  0175               LC005:
2356  0175 350a0000      	mov	__dsCount,#10
2358  0179               L567:
2359                     ; 522 			else if( key==16 )	{ _NOT_DEF_; }	//	DN
2364                     ; 523 			else if( key==32 )	{ _NOT_DEF_; }	//	UP
2368                     ; 524 			_disp_temp = 1;
2370  0179 35010000      	mov	__disp_temp,#1
2371                     ; 525 			i = disp_status_loop_host_N2OUT(key);
2373  017d 7b03          	ld	a,(OFST+1,sp)
2374  017f cd0000        	call	_disp_status_loop_host_N2OUT
2376  0182 6b02          	ld	(OFST+0,sp),a
2377                     ; 526 			if( i==1 )
2379  0184 4a            	dec	a
2380  0185 26c5          	jrne	L3731
2381                     ; 527 				_key_blink = 1;
2383  0187 35010007      	mov	__key_blink,#1
2384  018b cc09eb        	jra	L3731
2385  018e               L747:
2386                     ; 529 		else if( _dsCount == 152 )			//	MODE_1
2388  018e a198          	cp	a,#152
2389  0190 2616          	jrne	L3001
2390                     ; 531 			if(uiInfo.cntlMode == 0 )	
2392  0192 c60003        	ld	a,_uiInfo+3
2393  0195 2606          	jrne	L5001
2394                     ; 534 				_GOTO(153);
2396  0197 35990000      	mov	___sUp,#153
2398                     ; 535 				return;
2401  019b 2018          	jp	LC006
2402  019d               L5001:
2403                     ; 538 			__s = 2;
2405  019d 35020000      	mov	___s,#2
2406                     ; 539 			_dsCount = 0;
2408  01a1 725f0000      	clr	__dsCount
2410  01a5 cc09eb        	jra	L3731
2411  01a8               L3001:
2412                     ; 541 		else if( _dsCount == 153 )			//	MODE_2
2414  01a8 a199          	cp	a,#153
2415  01aa 261b          	jrne	L1101
2416                     ; 543 			if(uiInfo.cntlMode == 0 )	
2418  01ac c60003        	ld	a,_uiInfo+3
2419  01af 260b          	jrne	L3101
2420                     ; 546 				_GOTO(154);
2422  01b1 359a0000      	mov	___sUp,#154
2425  01b5               LC006:
2427  01b5 350a0000      	mov	__dsCount,#10
2428                     ; 547 				return;
2429  01b9               L444:
2433  01b9 5b03          	addw	sp,#3
2434  01bb 81            	ret	
2435  01bc               L3101:
2436                     ; 550 			__s = 1;
2438  01bc 35010000      	mov	___s,#1
2439                     ; 551 			_dsCount = 0;
2441  01c0 725f0000      	clr	__dsCount
2443  01c4 cc09eb        	jra	L3731
2444  01c7               L1101:
2445                     ; 553 		else if( _dsCount == 154 )			//	MODE_4
2447  01c7 a19a          	cp	a,#154
2448  01c9 2653          	jrne	L7101
2449                     ; 556 			if( key==1 )		_GOTO(0)	//	To Nan	
2451  01cb 7b03          	ld	a,(OFST+1,sp)
2452  01cd a101          	cp	a,#1
2453  01cf 260a          	jrne	L1201
2456  01d1 725f0000      	clr	___sUp
2459  01d5 350a0000      	mov	__dsCount,#10
2461  01d9 2032          	jra	L3201
2462  01db               L1201:
2463                     ; 557 			else if( key==2 )	{ _NOT_KEY_ }	//	
2465  01db a102          	cp	a,#2
2466  01dd 272e          	jreq	L3201
2469                     ; 558 			else if( key==4 )	_GOTO(155)	//	MODE_5
2471  01df a104          	cp	a,#4
2472  01e1 260a          	jrne	L1301
2475  01e3 359b0000      	mov	___sUp,#155
2478  01e7 350a0000      	mov	__dsCount,#10
2480  01eb 2020          	jra	L3201
2481  01ed               L1301:
2482                     ; 559 			else if( key==8 )	_GOTO(101)	//	REMOTE
2484  01ed a108          	cp	a,#8
2485  01ef 260a          	jrne	L5301
2488  01f1 35650000      	mov	___sUp,#101
2491  01f5 350a0000      	mov	__dsCount,#10
2493  01f9 2012          	jra	L3201
2494  01fb               L5301:
2495                     ; 560 			else if( key==16 )	_DN
2497  01fb a110          	cp	a,#16
2498  01fd 2606          	jrne	L1401
2501  01ff 35400000      	mov	_uiInfo,#64
2503  0203 2008          	jra	L3201
2504  0205               L1401:
2505                     ; 561 			else if( key==32 )	_UP
2507  0205 a120          	cp	a,#32
2508  0207 2604          	jrne	L3201
2511  0209 35010000      	mov	_uiInfo,#1
2512  020d               L3201:
2513                     ; 563 			i = disp_status_loop_host_Y(key);
2515  020d 7b03          	ld	a,(OFST+1,sp)
2516  020f cd0000        	call	_disp_status_loop_host_Y
2518  0212 6b02          	ld	(OFST+0,sp),a
2519                     ; 564 			if( i==1 )
2521  0214 4a            	dec	a
2522  0215 26ad          	jrne	L3731
2523                     ; 565 				_key_blink = 1;
2525  0217 35010007      	mov	__key_blink,#1
2526  021b cc09eb        	jra	L3731
2527  021e               L7101:
2528                     ; 567 		else if( _dsCount == 155 )			//	MODE_5
2530  021e a19b          	cp	a,#155
2531  0220 2653          	jrne	L3501
2532                     ; 570 			if( key==1 )		_GOTO(0)	//	To Nan	
2534  0222 7b03          	ld	a,(OFST+1,sp)
2535  0224 a101          	cp	a,#1
2536  0226 260a          	jrne	L5501
2539  0228 725f0000      	clr	___sUp
2542  022c 350a0000      	mov	__dsCount,#10
2544  0230 2032          	jra	L7501
2545  0232               L5501:
2546                     ; 571 			else if( key==2 )	{ _NOT_KEY_ }	//	
2548  0232 a102          	cp	a,#2
2549  0234 272e          	jreq	L7501
2552                     ; 572 			else if( key==4 )	_GOTO(0)	//	To Nan
2554  0236 a104          	cp	a,#4
2555  0238 260a          	jrne	L5601
2558  023a 725f0000      	clr	___sUp
2561  023e 350a0000      	mov	__dsCount,#10
2563  0242 2020          	jra	L7501
2564  0244               L5601:
2565                     ; 573 			else if( key==8 )	_GOTO(101)	//	REMOTE
2567  0244 a108          	cp	a,#8
2568  0246 260a          	jrne	L1701
2571  0248 35650000      	mov	___sUp,#101
2574  024c 350a0000      	mov	__dsCount,#10
2576  0250 2012          	jra	L7501
2577  0252               L1701:
2578                     ; 574 			else if( key==16 )	_DN
2580  0252 a110          	cp	a,#16
2581  0254 2606          	jrne	L5701
2584  0256 35400000      	mov	_uiInfo,#64
2586  025a 2008          	jra	L7501
2587  025c               L5701:
2588                     ; 575 			else if( key==32 )	_UP
2590  025c a120          	cp	a,#32
2591  025e 2604          	jrne	L7501
2594  0260 35010000      	mov	_uiInfo,#1
2595  0264               L7501:
2596                     ; 577 			i = disp_status_loop_host_B(key);
2598  0264 7b03          	ld	a,(OFST+1,sp)
2599  0266 cd0000        	call	_disp_status_loop_host_B
2601  0269 6b02          	ld	(OFST+0,sp),a
2602                     ; 578 			if( i==1 )
2604  026b 4a            	dec	a
2605  026c 26ad          	jrne	L3731
2606                     ; 579 				_key_blink = 1;
2608  026e 35010007      	mov	__key_blink,#1
2609  0272 cc09eb        	jra	L3731
2610  0275               L3501:
2611                     ; 608 		else if( _dsCount == 25 )			//	B
2613  0275 a119          	cp	a,#25
2614  0277 2665          	jrne	L7011
2615                     ; 610 			if( key==1 )		_GOTO(101)	//	Y
2617  0279 7b03          	ld	a,(OFST+1,sp)
2618  027b a101          	cp	a,#1
2619  027d 260a          	jrne	L1111
2622  027f 35650000      	mov	___sUp,#101
2625  0283 350a0000      	mov	__dsCount,#10
2627  0287 2040          	jra	L3111
2628  0289               L1111:
2629                     ; 611 			else if( key==2 )	
2631  0289 a102          	cp	a,#2
2632  028b 260e          	jrne	L5111
2633                     ; 613 				__sDn = 0;
2635  028d 725f0000      	clr	___sDn
2636                     ; 614 				_GOTO(1)	//	Y
2638  0291 35010000      	mov	___sUp,#1
2641  0295 350a0000      	mov	__dsCount,#10
2643  0299 202e          	jra	L3111
2644  029b               L5111:
2645                     ; 616 			else if( key==4 )	_GOTO(0)	//	N
2647  029b a104          	cp	a,#4
2648  029d 260a          	jrne	L1211
2651  029f 725f0000      	clr	___sUp
2654  02a3 350a0000      	mov	__dsCount,#10
2656  02a7 2020          	jra	L3111
2657  02a9               L1211:
2658                     ; 617 			else if( key==8 )	_GOTO(5)	//	Off
2660  02a9 a108          	cp	a,#8
2661  02ab 260a          	jrne	L5211
2664  02ad 35050000      	mov	___sUp,#5
2667  02b1 350a0000      	mov	__dsCount,#10
2669  02b5 2012          	jra	L3111
2670  02b7               L5211:
2671                     ; 618 			else if( key==16 )	_DN
2673  02b7 a110          	cp	a,#16
2674  02b9 2606          	jrne	L1311
2677  02bb 35400000      	mov	_uiInfo,#64
2679  02bf 2008          	jra	L3111
2680  02c1               L1311:
2681                     ; 619 			else if( key==32 )	_UP
2683  02c1 a120          	cp	a,#32
2684  02c3 2604          	jrne	L3111
2687  02c5 35010000      	mov	_uiInfo,#1
2688  02c9               L3111:
2689                     ; 623 			_disp_temp = 1;
2691  02c9 35010000      	mov	__disp_temp,#1
2692                     ; 624 			i = disp_status_loop_host_B(key);
2694  02cd 7b03          	ld	a,(OFST+1,sp)
2695  02cf cd0000        	call	_disp_status_loop_host_B
2697  02d2 6b02          	ld	(OFST+0,sp),a
2698                     ; 625 			if( i==1 )
2700  02d4 4a            	dec	a
2701  02d5 269b          	jrne	L3731
2702                     ; 626 				_key_blink = 1;
2704  02d7 35010007      	mov	__key_blink,#1
2705  02db cc09eb        	jra	L3731
2706  02de               L7011:
2707                     ; 628 		else if( _dsCount == 35 )			//	Y
2709  02de a123          	cp	a,#35
2710  02e0 2665          	jrne	L3411
2711                     ; 630 			if( key==1 )		_GOTO(101)	//	N
2713  02e2 7b03          	ld	a,(OFST+1,sp)
2714  02e4 a101          	cp	a,#1
2715  02e6 260a          	jrne	L5411
2718  02e8 35650000      	mov	___sUp,#101
2721  02ec 350a0000      	mov	__dsCount,#10
2723  02f0 2040          	jra	L7411
2724  02f2               L5411:
2725                     ; 631 			else if( key==2 )	
2727  02f2 a102          	cp	a,#2
2728  02f4 260e          	jrne	L1511
2729                     ; 633 				__sDn = 1;
2731  02f6 35010000      	mov	___sDn,#1
2732                     ; 634 				_GOTO(2)	//	B
2734  02fa 35020000      	mov	___sUp,#2
2737  02fe 350a0000      	mov	__dsCount,#10
2739  0302 202e          	jra	L7411
2740  0304               L1511:
2741                     ; 636 			else if( key==4 )	_GOTO(0)	//	N
2743  0304 a104          	cp	a,#4
2744  0306 260a          	jrne	L5511
2747  0308 725f0000      	clr	___sUp
2750  030c 350a0000      	mov	__dsCount,#10
2752  0310 2020          	jra	L7411
2753  0312               L5511:
2754                     ; 637 			else if( key==8 )	_GOTO(5)	//	Off
2756  0312 a108          	cp	a,#8
2757  0314 260a          	jrne	L1611
2760  0316 35050000      	mov	___sUp,#5
2763  031a 350a0000      	mov	__dsCount,#10
2765  031e 2012          	jra	L7411
2766  0320               L1611:
2767                     ; 638 			else if( key==16 )	_DN
2769  0320 a110          	cp	a,#16
2770  0322 2606          	jrne	L5611
2773  0324 35400000      	mov	_uiInfo,#64
2775  0328 2008          	jra	L7411
2776  032a               L5611:
2777                     ; 639 			else if( key==32 )	_UP
2779  032a a120          	cp	a,#32
2780  032c 2604          	jrne	L7411
2783  032e 35010000      	mov	_uiInfo,#1
2784  0332               L7411:
2785                     ; 640 			_disp_temp = 1;
2787  0332 35010000      	mov	__disp_temp,#1
2788                     ; 641 			i = disp_status_loop_host_Y(key);
2790  0336 7b03          	ld	a,(OFST+1,sp)
2791  0338 cd0000        	call	_disp_status_loop_host_Y
2793  033b 6b02          	ld	(OFST+0,sp),a
2794                     ; 642 			if( i==1 )
2796  033d 4a            	dec	a
2797  033e 269b          	jrne	L3731
2798                     ; 643 				_key_blink = 1;
2800  0340 35010007      	mov	__key_blink,#1
2801  0344 cc09eb        	jra	L3731
2802  0347               L3411:
2803                     ; 645 		else if( _dsCount == 45 )			//	OFF
2805  0347 a12d          	cp	a,#45
2806  0349 267a          	jrne	L7711
2807                     ; 647 			if (_key_time_event[0] == 0) 
2809  034b c60000        	ld	a,__key_time_event
2810  034e 260e          	jrne	L1021
2811                     ; 649 				_key_time_event[0] = 1;
2813  0350 35010000      	mov	__key_time_event,#1
2814                     ; 650 				_key_time_event[1] = __timer1s;
2816  0354 5500000001    	mov	__key_time_event+1,___timer1s
2817                     ; 651 				_key_time_event[2] = 0;
2819  0359 c70002        	ld	__key_time_event+2,a
2821  035c 201f          	jra	L3021
2822  035e               L1021:
2823                     ; 653 			else if (_key_time_event[0] == 1)
2825  035e 4a            	dec	a
2826  035f 261c          	jrne	L3021
2827                     ; 655 				if (_key_time_event[1] != __timer1s) {
2829  0361 c60001        	ld	a,__key_time_event+1
2830  0364 c10000        	cp	a,___timer1s
2831  0367 2709          	jreq	L7021
2832                     ; 656 					_key_time_event[1] = __timer1s;
2834  0369 5500000001    	mov	__key_time_event+1,___timer1s
2835                     ; 657 					_key_time_event[2]++;
2837  036e 725c0002      	inc	__key_time_event+2
2838  0372               L7021:
2839                     ; 660 				if (_key_time_event[2] == 10) {
2841  0372 c60002        	ld	a,__key_time_event+2
2842  0375 a10a          	cp	a,#10
2843  0377 2604          	jrne	L3021
2844                     ; 661 					_key_time_event[0] = 2;
2846  0379 35020000      	mov	__key_time_event,#2
2847  037d               L3021:
2848                     ; 666 			if( key==1 )		_GOTO(101)	//	TBD
2850  037d 7b03          	ld	a,(OFST+1,sp)
2851  037f a101          	cp	a,#1
2852  0381 2606          	jrne	L3121
2855  0383 35650000      	mov	___sUp,#101
2858  0387 2023          	jp	LC007
2859  0389               L3121:
2860                     ; 667 			else if( key==2 )	_GOTO(1)	//	Y
2862  0389 a102          	cp	a,#2
2863  038b 2606          	jrne	L7121
2866  038d 35010000      	mov	___sUp,#1
2869  0391 2019          	jp	LC007
2870  0393               L7121:
2871                     ; 668 			else if( key==4 )	_GOTO(0)	//	N
2873  0393 a104          	cp	a,#4
2874  0395 2606          	jrne	L3221
2877  0397               LC008:
2879  0397 725f0000      	clr	___sUp
2882  039b 200f          	jp	LC007
2883  039d               L3221:
2884                     ; 669 			else if( key==8 )	
2886  039d a108          	cp	a,#8
2887  039f 260f          	jrne	L5121
2888                     ; 671 				if (_key_time_event[0] == 2) 
2890  03a1 c60000        	ld	a,__key_time_event
2891  03a4 a102          	cp	a,#2
2892                     ; 673 					 _GOTO(0)				//	on
2895  03a6 27ef          	jreq	LC008
2896                     ; 677 					_GOTO(20)       // 	setting
2898  03a8 35140000      	mov	___sUp,#20
2901  03ac               LC007:
2906  03ac 350a0000      	mov	__dsCount,#10
2907  03b0               L5121:
2908                     ; 680 			_disp_temp = 1;
2910  03b0 35010000      	mov	__disp_temp,#1
2911                     ; 681 			i = disp_status_loop_host_Off(key);
2913  03b4 7b03          	ld	a,(OFST+1,sp)
2914  03b6 cd0000        	call	_disp_status_loop_host_Off
2916  03b9 6b02          	ld	(OFST+0,sp),a
2917                     ; 682 			if( i==1 )
2919  03bb 4a            	dec	a
2920  03bc 2686          	jrne	L3731
2921                     ; 683 				_key_blink = 1;
2923  03be 35010007      	mov	__key_blink,#1
2924  03c2 cc09eb        	jra	L3731
2925  03c5               L7711:
2926                     ; 685 		else if( _dsCount == 11 )
2928  03c5 a10b          	cp	a,#11
2929  03c7 2617          	jrne	L1421
2930                     ; 687 			_dsCount = 2;
2932  03c9 35020000      	mov	__dsCount,#2
2933                     ; 688 			__sUp = 0xff;
2935  03cd 35ff0000      	mov	___sUp,#255
2936                     ; 689 			disp_status_loop_init();
2938  03d1 cd0000        	call	_disp_status_loop_init
2940                     ; 690 			disp_status_loop_messageDn(__sDn);
2942  03d4 c60000        	ld	a,___sDn
2943  03d7 cd0000        	call	_disp_status_loop_messageDn
2945                     ; 691 			disp_status_curr_only();
2947  03da cd0000        	call	_disp_status_curr_only
2950  03dd cc09eb        	jra	L3731
2951  03e0               L1421:
2952                     ; 693 		else if( _dsCount == 1 )
2954  03e0 a101          	cp	a,#1
2955  03e2 2703cc04ec    	jrne	L5421
2956                     ; 698 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
2958  03e7 c60000        	ld	a,___sUp
2959  03ea 2607          	jrne	L7421
2962  03ec 7b03          	ld	a,(OFST+1,sp)
2963  03ee cd0000        	call	_disp_status_loop_host_N
2966  03f1 2014          	jp	LC009
2967  03f3               L7421:
2968                     ; 699 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
2970  03f3 a101          	cp	a,#1
2971  03f5 2607          	jrne	L3521
2974  03f7 7b03          	ld	a,(OFST+1,sp)
2975  03f9 cd0000        	call	_disp_status_loop_host_Y
2978  03fc 2009          	jp	LC009
2979  03fe               L3521:
2980                     ; 700 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
2982  03fe a102          	cp	a,#2
2983  0400 2607          	jrne	L1521
2986  0402 7b03          	ld	a,(OFST+1,sp)
2987  0404 cd0000        	call	_disp_status_loop_host_B
2989  0407               LC009:
2990  0407 6b02          	ld	(OFST+0,sp),a
2991  0409               L1521:
2992                     ; 702 			if( i==1 )
2994  0409 7b02          	ld	a,(OFST+0,sp)
2995  040b 4a            	dec	a
2996  040c 2604          	jrne	L1621
2997                     ; 703 				_key_blink = 1;
2999  040e 4c            	inc	a
3000  040f c70007        	ld	__key_blink,a
3001  0412               L1621:
3002                     ; 706 			_disp_temp = __sUp==0 ? 1 : 0;
3004  0412 c60000        	ld	a,___sUp
3005  0415 2603          	jrne	L432
3006  0417 4c            	inc	a
3007  0418 2001          	jra	L632
3008  041a               L432:
3009  041a 4f            	clr	a
3010  041b               L632:
3011  041b c70000        	ld	__disp_temp,a
3012                     ; 707 			if( _disp_temp == 0 && _key_blink == 0 )
3014  041e 261c          	jrne	L3621
3016  0420 c60007        	ld	a,__key_blink
3017  0423 2617          	jrne	L3621
3018                     ; 709 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
3020  0425 c60000        	ld	a,___sUp
3021  0428 a101          	cp	a,#1
3022  042a 270c          	jreq	L7621
3024  042c a102          	cp	a,#2
3025  042e 2708          	jreq	L7621
3027  0430 a105          	cp	a,#5
3028  0432 2704          	jreq	L7621
3030  0434 a108          	cp	a,#8
3031  0436 2604          	jrne	L3621
3032  0438               L7621:
3033                     ; 710 					_disp_temp = 1;
3035  0438 35010000      	mov	__disp_temp,#1
3036  043c               L3621:
3037                     ; 713 			if( key == 1 )
3039  043c 7b03          	ld	a,(OFST+1,sp)
3040  043e a101          	cp	a,#1
3041  0440 2611          	jrne	L5721
3042                     ; 715 				__sUp = (__sUp+1) % 3;
3044  0442 c60000        	ld	a,___sUp
3045  0445 5f            	clrw	x
3046  0446 97            	ld	xl,a
3047  0447 5c            	incw	x
3048  0448 a603          	ld	a,#3
3049  044a cd0000        	call	c_smodx
3051  044d 01            	rrwa	x,a
3052  044e c70000        	ld	___sUp,a
3053  0451 206c          	jra	L125
3054  0453               L5721:
3055                     ; 726 			else if( key == 2 )
3057  0453 a102          	cp	a,#2
3058  0455 261c          	jrne	L1031
3059                     ; 728 				__sUp = 0xff;
3061  0457 35ff0000      	mov	___sUp,#255
3062                     ; 729 				__sDn = 0;
3064  045b 725f0000      	clr	___sDn
3065                     ; 730 				disp_status_loop_messageDn(__sDn);
3067  045f 4f            	clr	a
3068  0460 cd0000        	call	_disp_status_loop_messageDn
3070                     ; 731 				disp_status_curr_only();
3072  0463 cd0000        	call	_disp_status_curr_only
3074                     ; 732 				lcd_blink_clear();
3076  0466 cd0000        	call	_lcd_blink_clear
3078                     ; 733 				_dsCount = 2;
3080  0469 35020000      	mov	__dsCount,#2
3081                     ; 734 				_dsPrev = 0xff;
3083  046d 35ff0000      	mov	__dsPrev,#255
3084                     ; 736 				_key_blink = 0;
3086  0471 201c          	jp	LC010
3087  0473               L1031:
3088                     ; 738 			else if( key == 3 )
3090  0473 a103          	cp	a,#3
3091  0475 265d          	jrne	L5031
3092                     ; 740 				if( __sUp == 0 )
3094  0477 c60000        	ld	a,___sUp
3095  047a 2635          	jrne	L7031
3096                     ; 742 					if( _key_blink == 0 )
3098  047c c60007        	ld	a,__key_blink
3099  047f 260b          	jrne	L7131
3100  0481 cc0520        	jra	L325
3101  0484               L3131:
3102                     ; 748 							__s = 1;
3104  0484 35010000      	mov	___s,#1
3105  0488               L5131:
3106                     ; 749 						_dsCount = 0;
3108  0488 725f0000      	clr	__dsCount
3109  048c               L7131:
3110                     ; 762 				disp_status_loop_init();
3113  048c cd0000        	call	_disp_status_loop_init
3115                     ; 764 				_key_blink = 0;
3117  048f               LC010:
3120  048f 725f0007      	clr	__key_blink
3122  0493               L7721:
3123                     ; 781 			if( _key_blink == 1 )
3125  0493 c60007        	ld	a,__key_blink
3126  0496 4a            	dec	a
3127  0497 2703cc09eb    	jrne	L3731
3128                     ; 783 				if( _key_sec >= KEY_BLINK_FADE )
3130  049c c60000        	ld	a,__key_sec
3131  049f a10a          	cp	a,#10
3132  04a1 25f6          	jrult	L3731
3133                     ; 786 					lcd_blink_clear();
3135  04a3 cd0000        	call	_lcd_blink_clear
3137                     ; 787 					_key_blink = 0;
3139  04a6 725f0007      	clr	__key_blink
3140                     ; 788 					_dsCount = 10;
3142  04aa 350a0000      	mov	__dsCount,#10
3143  04ae cc09eb        	jra	L3731
3144  04b1               L7031:
3145                     ; 752 				else if( __sUp == 1 )	
3147  04b1 a101          	cp	a,#1
3148                     ; 754 					if( _key_blink != 1 )
3149                     ; 755 						goto SetupEntry2;
3151  04b3 2704          	jreq	LC012
3152                     ; 757 				else if( __sUp == 2 )	
3154  04b5 a102          	cp	a,#2
3155  04b7 26d3          	jrne	L7131
3156                     ; 759 					if( _key_blink != 1 )
3158  04b9               LC012:
3160  04b9 c60007        	ld	a,__key_blink
3161  04bc 4a            	dec	a
3162  04bd 27cd          	jreq	L7131
3163                     ; 760 						goto SetupEntry2;
3164  04bf               L125:
3165                     ; 716 SetupEntry2:				
3165                     ; 717 //				if( __sUp == 0 )		i = bS6;
3165                     ; 718 //				else if( __sUp == 1 )	i = bS7;
3165                     ; 719 //				else					i = bS8;
3165                     ; 720 				lcd_blink_item(i);
3167  04bf 7b02          	ld	a,(OFST+0,sp)
3168  04c1 cd0000        	call	_lcd_blink_item
3170                     ; 721 				disp_status_loop_message(__sUp);
3172  04c4 c60000        	ld	a,___sUp
3173  04c7 cd0000        	call	_disp_status_loop_message
3175                     ; 722 				_dsPrev = 0xff;
3177  04ca 35ff0000      	mov	__dsPrev,#255
3178                     ; 724 				_key_blink = 1;
3180  04ce 35010007      	mov	__key_blink,#1
3182  04d2 20bf          	jra	L7721
3183  04d4               L5031:
3184                     ; 766 			else if( key == 4 )
3186  04d4 a104          	cp	a,#4
3187  04d6 26bb          	jrne	L7721
3188                     ; 768 				if( _key_blink == 1 )
3190  04d8 c60007        	ld	a,__key_blink
3191  04db 4a            	dec	a
3192                     ; 771 					disp_status_loop_init();
3194                     ; 772 					_key_blink = 0;
3196  04dc 27ae          	jreq	L7131
3197                     ; 776 					__s = 3;
3199  04de 35030000      	mov	___s,#3
3200                     ; 777 					_dsCount = 0;
3202  04e2 725f0000      	clr	__dsCount
3203                     ; 778 					_dsPrev = 0xff;
3205  04e6 35ff0000      	mov	__dsPrev,#255
3206  04ea 20a7          	jra	L7721
3207  04ec               L5421:
3208                     ; 792 		else if( _dsCount == 2 )
3210  04ec a102          	cp	a,#2
3211  04ee 26be          	jrne	L3731
3212                     ; 794 			_disp_temp = 1;
3214  04f0 35010000      	mov	__disp_temp,#1
3215                     ; 795 			if( key == 1 )
3217  04f4 7b03          	ld	a,(OFST+1,sp)
3218  04f6 a101          	cp	a,#1
3219  04f8 260a          	jrne	L3531
3220                     ; 797 				__sUp = 0;
3222  04fa 725f0000      	clr	___sUp
3223                     ; 798 				_dsCount = 0;
3225  04fe 725f0000      	clr	__dsCount
3227  0502 202b          	jra	L3631
3228  0504               L3531:
3229                     ; 800 			else if( key == 2 )
3231  0504 a102          	cp	a,#2
3232  0506 2614          	jrne	L7531
3233                     ; 802 				__sDn = __sDn==0 ? 1 : 0;
3235  0508 c60000        	ld	a,___sDn
3236  050b 2603          	jrne	L062
3237  050d 4c            	inc	a
3238  050e 2001          	jra	L262
3239  0510               L062:
3240  0510 4f            	clr	a
3241  0511               L262:
3242  0511 c70000        	ld	___sDn,a
3243                     ; 803 				disp_status_loop_messageDn(__sDn);
3245  0514 cd0000        	call	_disp_status_loop_messageDn
3247                     ; 804 				disp_status_curr_only();
3249  0517 cd0000        	call	_disp_status_curr_only
3252  051a 2013          	jra	L3631
3253  051c               L7531:
3254                     ; 806 			else if( key == 3 )	{	goto SetupEntry;	}
3256  051c a103          	cp	a,#3
3257  051e 260f          	jrne	L3631
3259  0520               L325:
3260                     ; 744 SetupEntry:				
3260                     ; 745 						if( uiInfo.cntlMode == 0 )
3262  0520 c60003        	ld	a,_uiInfo+3
3263  0523 2703cc0484    	jrne	L3131
3264                     ; 746 							__s = 4;
3266  0528 35040000      	mov	___s,#4
3268  052c cc0488        	jra	L5131
3269  052f               L3631:
3270                     ; 807 			else if( key == 4 )
3272                     ; 810 			if( uiInfo.enc != 0 )
3274  052f c60000        	ld	a,_uiInfo
3275  0532 2603cc09eb    	jreq	L3731
3276                     ; 812 				__sUp = 0;
3278  0537 725f0000      	clr	___sUp
3279                     ; 813 				_dsCount = 0;
3281  053b 725f0000      	clr	__dsCount
3282  053f cc09eb        	jra	L3731
3283  0542               L506:
3284                     ; 817 	else if( __s == 1 ) // 설정 난방수 모드
3286  0542 a101          	cp	a,#1
3287  0544 2703cc060e    	jrne	L5731
3288                     ; 820 		if( _dsCount == 0 )
3290  0549 c60000        	ld	a,__dsCount
3291  054c 262a          	jrne	L7731
3292                     ; 822 			lcd_clear(0);
3294  054e cd0000        	call	_lcd_clear
3296                     ; 823 			__sInfo = 1;
3298  0551 35010000      	mov	___sInfo,#1
3299                     ; 824 			lcd_disp_info(__sInfo, 0, 0);
3301  0555 4b00          	push	#0
3302  0557 ae0100        	ldw	x,#256
3303  055a cd0000        	call	_lcd_disp_info
3305  055d 84            	pop	a
3306                     ; 825 			UI_DISP_2Digit(_boiler_water_heat);
3308  055e c60002        	ld	a,__boiler_water_heat
3309  0561 cd0a2c        	call	LC024
3313  0564 c60002        	ld	a,__boiler_water_heat
3314  0567 cd0a20        	call	LC023
3316                     ; 827 			lcd_disp_info_shower(0x08, 0);
3319  056a ae0800        	ldw	x,#2048
3320  056d cd0a4f        	call	LC028
3321                     ; 830 			uiInfo._t = _boiler_water_heat;
3323  0570 550002005f    	mov	_uiInfo+95,__boiler_water_heat
3325  0575 cc09eb        	jra	L3731
3326  0578               L7731:
3327                     ; 832 		else if( _dsCount == 251 )
3329  0578 a1fb          	cp	a,#251
3330  057a 2729          	jreq	L525
3331                     ; 842 		else if( _dsCount == 1 )
3333  057c 4a            	dec	a
3334  057d 26f6          	jrne	L3731
3335                     ; 844 			if( key==1 )
3337  057f 7b03          	ld	a,(OFST+1,sp)
3338  0581 a101          	cp	a,#1
3339  0583 2606          	jrne	L3141
3340                     ; 846 				_GOTO(0)	//	To Nan	
3342  0585 725f0000      	clr	___sUp
3344                     ; 847 				goto EXIT_1_MAIN;
3346  0589 2016          	jp	LC013
3347  058b               L3141:
3348                     ; 849 			else if( key==2 )	{ _NOT_KEY_ }	//	
3350  058b a102          	cp	a,#2
3351  058d 273b          	jreq	L5141
3354                     ; 850 			else if( key==4 )	
3356  058f a104          	cp	a,#4
3357  0591 2606          	jrne	L3241
3358                     ; 852 				_GOTO(154)	//	MODE_2
3360  0593 359a0000      	mov	___sUp,#154
3362                     ; 853 				goto EXIT_1_MAIN;
3364  0597 2008          	jp	LC013
3365  0599               L3241:
3366                     ; 855 			else if( key==8 )	
3368  0599 a108          	cp	a,#8
3369  059b 261b          	jrne	L7241
3370                     ; 857 				_GOTO(1)	//	REMOTE
3372  059d 35010000      	mov	___sUp,#1
3375  05a1               LC013:
3378  05a1 350a0000      	mov	__dsCount,#10
3379                     ; 858 				goto EXIT_1_MAIN;
3380  05a5               L525:
3381                     ; 834 EXIT_1_MAIN:
3381                     ; 835 			__s = 0;
3383  05a5 725f0000      	clr	___s
3384                     ; 836 			if( _boiler_water_heat != uiInfo._t )
3386  05a9 c60002        	ld	a,__boiler_water_heat
3387  05ac c1005f        	cp	a,_uiInfo+95
3388  05af 27c4          	jreq	L3731
3389                     ; 839 				file_update2(0);
3391  05b1 4f            	clr	a
3392  05b2 cd0000        	call	_file_update2
3394  05b5 cc09eb        	jra	L3731
3395  05b8               L7241:
3396                     ; 860 			else if( key==16 )	_DN
3398  05b8 a110          	cp	a,#16
3399  05ba 2606          	jrne	L3341
3402  05bc 35400000      	mov	_uiInfo,#64
3404  05c0 2008          	jra	L5141
3405  05c2               L3341:
3406                     ; 861 			else if( key==32 )	_UP
3408  05c2 a120          	cp	a,#32
3409  05c4 2604          	jrne	L5141
3412  05c6 35010000      	mov	_uiInfo,#1
3413  05ca               L5141:
3414                     ; 863 			i = _boiler_water_heat;
3416  05ca c60002        	ld	a,__boiler_water_heat
3417  05cd 6b02          	ld	(OFST+0,sp),a
3418                     ; 864 			if( uiInfo.enc != 0 )
3420  05cf c60000        	ld	a,_uiInfo
3421  05d2 2723          	jreq	L1441
3422                     ; 866 				ENC_MOVE_0(45,85,5);
3424  05d4 a540          	bcp	a,#64
3425  05d6 260e          	jrne	L3441
3428  05d8 7b02          	ld	a,(OFST+0,sp)
3429  05da a12e          	cp	a,#46
3430  05dc 2404          	jruge	L5441
3433  05de a655          	ld	a,#85
3435  05e0 2010          	jra	L1541
3436  05e2               L5441:
3439  05e2 a005          	sub	a,#5
3440  05e4 200c          	jra	L1541
3441  05e6               L3441:
3444  05e6 7b02          	ld	a,(OFST+0,sp)
3445  05e8 a155          	cp	a,#85
3446  05ea 2504          	jrult	L3541
3449  05ec a62d          	ld	a,#45
3451  05ee 2002          	jra	L1541
3452  05f0               L3541:
3455  05f0 ab05          	add	a,#5
3456  05f2               L1541:
3457  05f2 6b02          	ld	(OFST+0,sp),a
3458                     ; 867 				_boiler_water_heat = i;
3461  05f4 c70002        	ld	__boiler_water_heat,a
3462  05f7               L1441:
3463                     ; 869 			if( _dsPrev != i )
3465  05f7 c60000        	ld	a,__dsPrev
3466  05fa 1102          	cp	a,(OFST+0,sp)
3467  05fc 27b7          	jreq	L3731
3468                     ; 871 				_dsPrev = i;
3470  05fe 7b02          	ld	a,(OFST+0,sp)
3471  0600 c70000        	ld	__dsPrev,a
3472                     ; 872 				UI_DISP_2Digit(i);
3474  0603 cd0a2c        	call	LC024
3478  0606 7b02          	ld	a,(OFST+0,sp)
3479  0608 cd0a20        	call	LC023
3482  060b cc09eb        	jra	L3731
3483  060e               L5731:
3484                     ; 882 	else if( __s == 2 ) // 설정 온수 모드
3486  060e a102          	cp	a,#2
3487  0610 2703cc06da    	jrne	L3641
3488                     ; 885 		if( _dsCount == 0 )
3490  0615 c60000        	ld	a,__dsCount
3491  0618 262a          	jrne	L5641
3492                     ; 887 			lcd_clear(0);
3494  061a cd0000        	call	_lcd_clear
3496                     ; 888 			__sInfo = 2;
3498  061d 35020000      	mov	___sInfo,#2
3499                     ; 889 			lcd_disp_info(__sInfo, 0, 0);
3501  0621 4b00          	push	#0
3502  0623 ae0200        	ldw	x,#512
3503  0626 cd0000        	call	_lcd_disp_info
3505  0629 84            	pop	a
3506                     ; 890 			UI_DISP_2Digit(_boiler_water_shower);
3508  062a c60001        	ld	a,__boiler_water_shower
3509  062d cd0a2c        	call	LC024
3513  0630 c60001        	ld	a,__boiler_water_shower
3514  0633 cd0a20        	call	LC023
3516                     ; 891 			lcd_disp_info_shower(0x80, 0);
3519  0636 ae8000        	ldw	x,#32768
3520  0639 cd0a4f        	call	LC028
3521                     ; 894 			uiInfo._t = _boiler_water_shower;
3523  063c 550001005f    	mov	_uiInfo+95,__boiler_water_shower
3525  0641 cc09eb        	jra	L3731
3526  0644               L5641:
3527                     ; 896 		else if( _dsCount == 251 )
3529  0644 a1fb          	cp	a,#251
3530  0646 2729          	jreq	L725
3531                     ; 906 		else if( _dsCount == 1 )
3533  0648 4a            	dec	a
3534  0649 26f6          	jrne	L3731
3535                     ; 908 			if( key==1 )
3537  064b 7b03          	ld	a,(OFST+1,sp)
3538  064d a101          	cp	a,#1
3539  064f 2606          	jrne	L1051
3540                     ; 910 				_GOTO(0)	//	To Nan	
3542  0651 725f0000      	clr	___sUp
3544                     ; 911 				goto EXIT_2_MAIN;
3546  0655 2016          	jp	LC014
3547  0657               L1051:
3548                     ; 913 			else if( key==2 )	{ _NOT_KEY_ }	//	
3550  0657 a102          	cp	a,#2
3551  0659 273b          	jreq	L3051
3554                     ; 914 			else if( key==4 )	
3556  065b a104          	cp	a,#4
3557  065d 2606          	jrne	L1151
3558                     ; 916 				_GOTO(153)	//	MODE_2
3560  065f 35990000      	mov	___sUp,#153
3562                     ; 917 				goto EXIT_2_MAIN;
3564  0663 2008          	jp	LC014
3565  0665               L1151:
3566                     ; 919 			else if( key==8 )	
3568  0665 a108          	cp	a,#8
3569  0667 261b          	jrne	L5151
3570                     ; 921 				_GOTO(1)	//	REMOTE
3572  0669 35010000      	mov	___sUp,#1
3575  066d               LC014:
3578  066d 350a0000      	mov	__dsCount,#10
3579                     ; 922 				goto EXIT_2_MAIN;
3580  0671               L725:
3581                     ; 898 EXIT_2_MAIN:
3581                     ; 899 			__s = 0;
3583  0671 725f0000      	clr	___s
3584                     ; 900 			if( _boiler_water_shower != uiInfo._t )
3586  0675 c60001        	ld	a,__boiler_water_shower
3587  0678 c1005f        	cp	a,_uiInfo+95
3588  067b 27c4          	jreq	L3731
3589                     ; 903 				file_update2(0);
3591  067d 4f            	clr	a
3592  067e cd0000        	call	_file_update2
3594  0681 cc09eb        	jra	L3731
3595  0684               L5151:
3596                     ; 924 			else if( key==16 )	_DN
3598  0684 a110          	cp	a,#16
3599  0686 2606          	jrne	L1251
3602  0688 35400000      	mov	_uiInfo,#64
3604  068c 2008          	jra	L3051
3605  068e               L1251:
3606                     ; 925 			else if( key==32 )	_UP
3608  068e a120          	cp	a,#32
3609  0690 2604          	jrne	L3051
3612  0692 35010000      	mov	_uiInfo,#1
3613  0696               L3051:
3614                     ; 929 			i = _boiler_water_shower;
3616  0696 c60001        	ld	a,__boiler_water_shower
3617  0699 6b02          	ld	(OFST+0,sp),a
3618                     ; 930 			if( uiInfo.enc != 0 )
3620  069b c60000        	ld	a,_uiInfo
3621  069e 2723          	jreq	L7251
3622                     ; 932 				ENC_MOVE_0(35,60,5);
3624  06a0 a540          	bcp	a,#64
3625  06a2 260e          	jrne	L1351
3628  06a4 7b02          	ld	a,(OFST+0,sp)
3629  06a6 a124          	cp	a,#36
3630  06a8 2404          	jruge	L3351
3633  06aa a63c          	ld	a,#60
3635  06ac 2010          	jra	L7351
3636  06ae               L3351:
3639  06ae a005          	sub	a,#5
3640  06b0 200c          	jra	L7351
3641  06b2               L1351:
3644  06b2 7b02          	ld	a,(OFST+0,sp)
3645  06b4 a13c          	cp	a,#60
3646  06b6 2504          	jrult	L1451
3649  06b8 a623          	ld	a,#35
3651  06ba 2002          	jra	L7351
3652  06bc               L1451:
3655  06bc ab05          	add	a,#5
3656  06be               L7351:
3657  06be 6b02          	ld	(OFST+0,sp),a
3658                     ; 933 				_boiler_water_shower = i;
3661  06c0 c70001        	ld	__boiler_water_shower,a
3662  06c3               L7251:
3663                     ; 935 			if( _dsPrev != i )
3665  06c3 c60000        	ld	a,__dsPrev
3666  06c6 1102          	cp	a,(OFST+0,sp)
3667  06c8 27b7          	jreq	L3731
3668                     ; 937 				_dsPrev = i;
3670  06ca 7b02          	ld	a,(OFST+0,sp)
3671  06cc c70000        	ld	__dsPrev,a
3672                     ; 938 				UI_DISP_2Digit(i);
3674  06cf cd0a2c        	call	LC024
3678  06d2 7b02          	ld	a,(OFST+0,sp)
3679  06d4 cd0a20        	call	LC023
3682  06d7 cc09eb        	jra	L3731
3683  06da               L3641:
3684                     ; 949 	else if( __s == 4 )
3686  06da a104          	cp	a,#4
3687  06dc 264d          	jrne	L1551
3688                     ; 951 		if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
3690  06de 7b03          	ld	a,(OFST+1,sp)
3691  06e0 a110          	cp	a,#16
3692  06e2 2606          	jrne	L3551
3695  06e4 35400000      	mov	_uiInfo,#64
3697  06e8 2008          	jra	L5551
3698  06ea               L3551:
3699                     ; 952 		else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
3701  06ea a120          	cp	a,#32
3702  06ec 2604          	jrne	L5551
3705  06ee 35010000      	mov	_uiInfo,#1
3706  06f2               L5551:
3707                     ; 954 		disp_backlight(0);
3709  06f2 4f            	clr	a
3710  06f3 cd0000        	call	_disp_backlight
3712                     ; 956 		if( key == KEY_ROOM || key == KEY_YB || key == KEY_NO || key == KEY_ONOFF )
3714  06f6 7b03          	ld	a,(OFST+1,sp)
3715  06f8 a108          	cp	a,#8
3716  06fa 270c          	jreq	L3651
3718  06fc a104          	cp	a,#4
3719  06fe 2708          	jreq	L3651
3721  0700 a101          	cp	a,#1
3722  0702 2704          	jreq	L3651
3724  0704 a180          	cp	a,#128
3725  0706 26cf          	jrne	L3731
3726  0708               L3651:
3727                     ; 958 			file_update2(0);
3729  0708 4f            	clr	a
3730  0709 cd0000        	call	_file_update2
3732                     ; 959 			EXIT_HOST(0);
3734  070c 725f0000      	clr	___s
3737  0710 725f0000      	clr	__dsCount
3740  0714 35ff0000      	mov	__dsPrev,#255
3743  0718 cd0000        	call	_lcd_blink_clear
3747  071b 4b00          	push	#0
3748  071d ae0001        	ldw	x,#1
3749  0720 c60000        	ld	a,___sInfo
3750  0723 95            	ld	xh,a
3751  0724 cd0000        	call	_lcd_disp_info
3753  0727 84            	pop	a
3755  0728 cc09eb        	jra	L3731
3756  072b               L1551:
3757                     ; 961 	} else if (__s == 5){
3759  072b a105          	cp	a,#5
3760  072d 2658          	jrne	L3751
3761                     ; 962 		__sUp = 0;
3763  072f 725f0000      	clr	___sUp
3764                     ; 964 		switch (_disp_mode) {
3766  0733 c60005        	ld	a,__disp_mode
3768                     ; 969 		case 0x10:	__sUp = 2;	break;
3769  0736 4a            	dec	a
3770  0737 2711          	jreq	L135
3771  0739 4a            	dec	a
3772  073a 2713          	jreq	L335
3773  073c a002          	sub	a,#2
3774  073e 2715          	jreq	L535
3775  0740 a004          	sub	a,#4
3776  0742 2717          	jreq	L735
3777  0744 a008          	sub	a,#8
3778  0746 2719          	jreq	L145
3779  0748 201b          	jra	L7751
3780  074a               L135:
3781                     ; 965 		case 0x01:	__sUp = 0;	break;
3783  074a c70000        	ld	___sUp,a
3786  074d 2016          	jra	L7751
3787  074f               L335:
3788                     ; 966 		case 0x02:	__sUp = 3;	break;
3790  074f 35030000      	mov	___sUp,#3
3793  0753 2010          	jra	L7751
3794  0755               L535:
3795                     ; 967 		case 0x04:	__sUp = 4;	break;
3797  0755 35040000      	mov	___sUp,#4
3800  0759 200a          	jra	L7751
3801  075b               L735:
3802                     ; 968 		case 0x08:	__sUp = 1;	break;
3804  075b 35010000      	mov	___sUp,#1
3807  075f 2004          	jra	L7751
3808  0761               L145:
3809                     ; 969 		case 0x10:	__sUp = 2;	break;
3811  0761 35020000      	mov	___sUp,#2
3814  0765               L7751:
3815                     ; 971 		__sDn = 0xff;
3817  0765 35ff0000      	mov	___sDn,#255
3818                     ; 972 		disp_status_loop_init();
3820  0769 cd0000        	call	_disp_status_loop_init
3822                     ; 973 		_dsCount = 1;
3824  076c 35010000      	mov	__dsCount,#1
3825                     ; 974 		__s = 0;
3827  0770 725f0000      	clr	___s
3828                     ; 975 		_key_blink = 1;
3830  0774 35010007      	mov	__key_blink,#1
3831                     ; 976 		_key_sec = _key_min = _key_hour = 0;
3833  0778 725f0000      	clr	__key_hour
3834  077c 725f0000      	clr	__key_min
3835  0780 725f0000      	clr	__key_sec
3837  0784 cc09eb        	jra	L3731
3838  0787               L3751:
3839                     ; 978 	else if( __s == 101 )// remote
3841  0787 a165          	cp	a,#101
3842  0789 2703cc0946    	jrne	L3061
3843                     ; 980 		if( _dsCount == 0 )
3845  078e c60000        	ld	a,__dsCount
3846  0791 266c          	jrne	L5061
3847                     ; 982 			lcd_clear(0);
3849  0793 cd0000        	call	_lcd_clear
3851                     ; 983 			_remote = 1;
3853  0796 35010004      	mov	__remote,#1
3854                     ; 985 			j = uiInfo.cnt + uiInfo.cnt_sub;
3856                     ; 987 			j = __rc_max;
3858  079a c60000        	ld	a,___rc_max
3859                     ; 988 			if( j == 0 )	j = 1;
3861  079d 2601          	jrne	L7061
3864  079f 4c            	inc	a
3865  07a0               L7061:
3866  07a0 6b02          	ld	(OFST+0,sp),a
3867                     ; 989 			__sRoom = (uiInfo.id_rc + 1) % j;
3869  07a2 c60001        	ld	a,_uiInfo+1
3871  07a5               L345:
3872  07a5 5f            	clrw	x
3873  07a6 97            	ld	xl,a
3874  07a7 5c            	incw	x
3875  07a8 7b02          	ld	a,(OFST+0,sp)
3876  07aa 905f          	clrw	y
3877  07ac 9097          	ld	yl,a
3878  07ae cd0000        	call	c_idiv
3879  07b1 93            	ldw	x,y
3880  07b2 cd0a43        	call	LC027
3881  07b5 2605          	jrne	L1161
3882                     ; 993 				__sRoom = (__sRoom + 1) % j;
3884  07b7 c60000        	ld	a,___sRoom
3886                     ; 994 				goto _OneMore2;
3888  07ba 20e9          	jra	L345
3889  07bc               L1161:
3890                     ; 997 			j = __sRoom;
3892                     ; 998 _RemoteEntry:
3892                     ; 999 			if( __sRoom == uiInfo.id_rc )
3894  07bc c60000        	ld	a,___sRoom
3895  07bf c10001        	cp	a,_uiInfo+1
3896  07c2 2612          	jrne	L3161
3897  07c4               L745:
3898                     ; 1001 _RemoteExit:				
3898                     ; 1002 				_remote = 0;
3900  07c4 725f0004      	clr	__remote
3901                     ; 1003 				__s = 0;
3903  07c8 725f0000      	clr	___s
3904                     ; 1004 				_dsCount = 0;
3906  07cc 725f0000      	clr	__dsCount
3907                     ; 1005 				lcd_blink_clear();
3909  07d0 cd0000        	call	_lcd_blink_clear
3911                     ; 1006 				return;
3913  07d3 cc01b9        	jra	L444
3914  07d6               L3161:
3915                     ; 1010 				uiInfo.remote_t[__sRoom] = uiInfo.tempSetup[__sRoom];
3917  07d6 5f            	clrw	x
3918  07d7 97            	ld	xl,a
3919  07d8 d6003d        	ld	a,(_uiInfo+61,x)
3920  07db d70065        	ld	(_uiInfo+101,x),a
3921                     ; 1012 			lcd_clear_rid();
3923  07de cd0000        	call	_lcd_clear_rid
3925                     ; 1013 			lcd_blink_itemRoom(__sRoom, 1);
3927  07e1 ae0001        	ldw	x,#1
3928  07e4 c60000        	ld	a,___sRoom
3929  07e7 95            	ld	xh,a
3930  07e8 cd0000        	call	_lcd_blink_itemRoom
3932                     ; 1014 			disp_status_remote_message(REMOTE_MODE); //모드 변경
3934  07eb c60000        	ld	a,___sRoom
3935  07ee cd0a37        	call	LC025
3936  07f1 cd0000        	call	_disp_status_remote_message
3938                     ; 1015 			_dsCount = 1;
3940  07f4 35010000      	mov	__dsCount,#1
3941                     ; 1016 			_subRemote = 1;
3943  07f8 35010000      	mov	__subRemote,#1
3945  07fc cc09eb        	jra	L3731
3946  07ff               L5061:
3947                     ; 1018 		else if( _dsCount == 1 )//remote 첫화면
3949  07ff a101          	cp	a,#1
3950  0801 2703cc092f    	jrne	L7161
3951                     ; 1020 			if ( key == KEY_PLUS)		{	uiInfo.enc = ENC_UP;			}
3953  0806 7b03          	ld	a,(OFST+1,sp)
3954  0808 a110          	cp	a,#16
3955  080a 2606          	jrne	L1261
3958  080c 35400000      	mov	_uiInfo,#64
3960  0810 2008          	jra	L3261
3961  0812               L1261:
3962                     ; 1021 			else if ( key == KEY_MINUS) {	uiInfo.enc = ENC_DN;			}
3964  0812 a120          	cp	a,#32
3965  0814 2604          	jrne	L3261
3968  0816 35010000      	mov	_uiInfo,#1
3969  081a               L3261:
3970                     ; 1023 			j = __sRoom;
3972  081a c60000        	ld	a,___sRoom
3973  081d 6b02          	ld	(OFST+0,sp),a
3974                     ; 1024 			if( REMOTE_MODEi(j) == 0x01 )		{	_subRemote = 1; disp_status_loop_remote_N(j);	}
3976  081f cd0a37        	call	LC025
3977  0822 4a            	dec	a
3978  0823 260b          	jrne	L7261
3981  0825 35010000      	mov	__subRemote,#1
3984  0829 7b02          	ld	a,(OFST+0,sp)
3985  082b cd0000        	call	_disp_status_loop_remote_N
3988  082e 204e          	jra	L1361
3989  0830               L7261:
3990                     ; 1025 			else if( REMOTE_MODEi(j) == 0x08 )	{	_subRemote = 8;	disp_status_loop_remote_Y(j);	}
3992  0830 7b02          	ld	a,(OFST+0,sp)
3993  0832 cd0a37        	call	LC025
3994  0835 a108          	cp	a,#8
3995  0837 260b          	jrne	L3361
3998  0839 35080000      	mov	__subRemote,#8
4001  083d 7b02          	ld	a,(OFST+0,sp)
4002  083f cd0000        	call	_disp_status_loop_remote_Y
4005  0842 203a          	jra	L1361
4006  0844               L3361:
4007                     ; 1026 			else if( REMOTE_MODEi(j) == 0x10 )	{	_subRemote = 10; disp_status_loop_remote_B(j);	}
4009  0844 7b02          	ld	a,(OFST+0,sp)
4010  0846 cd0a37        	call	LC025
4011  0849 a110          	cp	a,#16
4012  084b 260b          	jrne	L7361
4015  084d 350a0000      	mov	__subRemote,#10
4018  0851 7b02          	ld	a,(OFST+0,sp)
4019  0853 cd0000        	call	_disp_status_loop_remote_B
4022  0856 2026          	jra	L1361
4023  0858               L7361:
4024                     ; 1027 			else if( REMOTE_MODEi(j) == 0x04 )	{	_subRemote = 4; disp_status_loop_remote_J(j);	}
4026  0858 7b02          	ld	a,(OFST+0,sp)
4027  085a cd0a37        	call	LC025
4028  085d a104          	cp	a,#4
4029  085f 260b          	jrne	L3461
4032  0861 35040000      	mov	__subRemote,#4
4035  0865 7b02          	ld	a,(OFST+0,sp)
4036  0867 cd0000        	call	_disp_status_loop_remote_J
4039  086a 2012          	jra	L1361
4040  086c               L3461:
4041                     ; 1028 			else if( REMOTE_MODEi(j) == 0x02 )	{	_subRemote = 2; disp_status_loop_remote_O(j);	}
4043  086c 7b02          	ld	a,(OFST+0,sp)
4044  086e cd0a37        	call	LC025
4045  0871 a102          	cp	a,#2
4046  0873 2609          	jrne	L1361
4049  0875 35020000      	mov	__subRemote,#2
4052  0879 7b02          	ld	a,(OFST+0,sp)
4053  087b cd0000        	call	_disp_status_loop_remote_O
4055  087e               L1361:
4056                     ; 1030 			if (_subRemote == 1) // remote 난방  
4058  087e c60000        	ld	a,__subRemote
4059  0881 a101          	cp	a,#1
4060  0883 261d          	jrne	L1561
4061                     ; 1032 				if( key == KEY_ROOM )	{	_dsCount = 2;				}
4063  0885 7b03          	ld	a,(OFST+1,sp)
4064  0887 a108          	cp	a,#8
4067  0889 2721          	jreq	LC021
4068                     ; 1033 				else if( key == KEY_YB )
4070  088b a104          	cp	a,#4
4071                     ; 1035 					lcd_clear(0);
4073                     ; 1036 					REMOTE_MODEi(j) = 0x08;
4074                     ; 1037 					disp_status_remote_message(REMOTE_MODE);
4077  088d 2749          	jreq	LC018
4078                     ; 1039 				else if( key == KEY_NO )
4080  088f a101          	cp	a,#1
4081  0891 2703cc091b    	jrne	L5002
4082                     ; 1041 					lcd_clear(0);
4084  0896 4f            	clr	a
4085  0897 cd0000        	call	_lcd_clear
4087                     ; 1043 					REMOTE_MODEi(j) = 0x02;
4089  089a 7b02          	ld	a,(OFST+0,sp)
4090  089c 5f            	clrw	x
4091  089d 97            	ld	xl,a
4092  089e a602          	ld	a,#2
4093                     ; 1044 					disp_status_remote_message(2);
4096  08a0 205e          	jp	LC019
4097                     ; 1046 				else if( key == KEY_ONOFF )	
4098                     ; 1048 					goto _RemoteExit;					
4100                     ; 1057 				else if ( key == KEY_PLUS) {}
4103                     ; 1058 				else if ( key == KEY_MINUS) {}
4105  08a2               L1561:
4106                     ; 1060 			else if (_subRemote == 8) // remote 예약
4108  08a2 a108          	cp	a,#8
4109  08a4 2620          	jrne	L3071
4110                     ; 1062 				if( key == KEY_ROOM )	{	_dsCount = 2;		}
4112  08a6 7b03          	ld	a,(OFST+1,sp)
4113  08a8 a108          	cp	a,#8
4114  08aa 2606          	jrne	L5071
4117  08ac               LC021:
4121  08ac 35020000      	mov	__dsCount,#2
4123  08b0 2070          	jra	L1071
4124  08b2               L5071:
4125                     ; 1063 				else if( key == KEY_YB )
4127  08b2 a104          	cp	a,#4
4128  08b4 263c          	jrne	L3471
4129                     ; 1065 					_dsPrev = 0xff;
4131  08b6 35ff0000      	mov	__dsPrev,#255
4132                     ; 1066 					lcd_clear(0);
4134  08ba 4f            	clr	a
4135  08bb cd0000        	call	_lcd_clear
4137                     ; 1067 					REMOTE_MODEi(j) = 0x10;
4139  08be 7b02          	ld	a,(OFST+0,sp)
4140  08c0 5f            	clrw	x
4141  08c1 97            	ld	xl,a
4142  08c2 a610          	ld	a,#16
4143                     ; 1068 					disp_status_remote_message(REMOTE_MODE);
4146  08c4 201c          	jp	LC017
4147                     ; 1070 				else if( key == KEY_NO )
4148                     ; 1072 					lcd_clear(0);
4150                     ; 1073 					REMOTE_MODEi(j) = 0x01;
4151                     ; 1074 					disp_status_remote_message(1);
4154                     ; 1076 				else if( key == KEY_ONOFF )		{	goto _RemoteExit;	}
4157                     ; 1077 				else if ( key == KEY_PLUS) {}
4160                     ; 1078 				else if ( key == KEY_MINUS) {}
4162  08c6               L3071:
4163                     ; 1080 			else if (_subRemote == 10) // remote 반복
4165  08c6 a10a          	cp	a,#10
4166  08c8 263b          	jrne	L5371
4167                     ; 1082 				if( key == KEY_ROOM )	{	_dsCount = 2;		}
4169  08ca 7b03          	ld	a,(OFST+1,sp)
4170  08cc a108          	cp	a,#8
4173  08ce 27dc          	jreq	LC021
4174                     ; 1083 				else if( key == KEY_YB )
4176  08d0 a104          	cp	a,#4
4177  08d2 261e          	jrne	L3471
4178                     ; 1085 					_dsPrev = 0xff;
4180  08d4 35ff0000      	mov	__dsPrev,#255
4181                     ; 1086 					lcd_clear(0);
4184                     ; 1087 					REMOTE_MODEi(j) = 0x08;
4186  08d8               LC018:
4189  08d8 4f            	clr	a
4190  08d9 cd0000        	call	_lcd_clear
4193  08dc 7b02          	ld	a,(OFST+0,sp)
4194  08de 5f            	clrw	x
4195  08df 97            	ld	xl,a
4196  08e0 a608          	ld	a,#8
4197                     ; 1088 					disp_status_remote_message(REMOTE_MODE);
4199  08e2               LC017:
4200  08e2 d70045        	ld	(_uiInfo+69,x),a
4204  08e5 5f            	clrw	x
4205  08e6 c60000        	ld	a,___sRoom
4206  08e9 97            	ld	xl,a
4207  08ea d60045        	ld	a,(_uiInfo+69,x)
4208  08ed               LC016:
4213  08ed cd0000        	call	_disp_status_remote_message
4216  08f0 2030          	jra	L1071
4217  08f2               L3471:
4218                     ; 1090 				else if( key == KEY_NO )
4221  08f2 a101          	cp	a,#1
4222  08f4 2625          	jrne	L5002
4223                     ; 1092 					lcd_clear(0);
4226                     ; 1093 					REMOTE_MODEi(j) = 0x01;
4228  08f6               LC020:
4231  08f6 4f            	clr	a
4232  08f7 cd0000        	call	_lcd_clear
4235  08fa 7b02          	ld	a,(OFST+0,sp)
4236  08fc 5f            	clrw	x
4237  08fd 97            	ld	xl,a
4238  08fe a601          	ld	a,#1
4239  0900               LC019:
4240  0900 d70045        	ld	(_uiInfo+69,x),a
4241                     ; 1094 					disp_status_remote_message(1);
4244  0903 20e8          	jp	LC016
4245                     ; 1096 				else if( key == KEY_ONOFF )	{	goto _RemoteExit;	}
4248                     ; 1097 				else if ( key == KEY_PLUS) {}
4251                     ; 1098 				else if ( key == KEY_MINUS) {}
4253  0905               L5371:
4254                     ; 1100 			else if (_subRemote == 4) // remote 정지
4256  0905 a104          	cp	a,#4
4257  0907 2719          	jreq	L1071
4259                     ; 1103 			else if (_subRemote == 2) // remote 외출
4261  0909 a102          	cp	a,#2
4262  090b 2615          	jrne	L1071
4263                     ; 1105 				if( key == KEY_ROOM )	{	_dsCount = 2;		}
4265  090d 7b03          	ld	a,(OFST+1,sp)
4266  090f a108          	cp	a,#8
4269  0911 2799          	jreq	LC021
4270                     ; 1106 				else if( key == KEY_YB )
4272  0913 a104          	cp	a,#4
4273                     ; 1108 					lcd_clear(0);
4275                     ; 1109 					REMOTE_MODEi(j) = 0x08;
4276                     ; 1110 					disp_status_remote_message(REMOTE_MODE);
4279  0915 27c1          	jreq	LC018
4280                     ; 1112 				else if( key == KEY_NO )
4282  0917 a101          	cp	a,#1
4283                     ; 1115 					lcd_clear(0);
4285                     ; 1116 					REMOTE_MODEi(j) = 0x01;
4286                     ; 1117 					disp_status_remote_message(1);
4289  0919 27db          	jreq	LC020
4290  091b               L5002:
4291                     ; 1119 				else if( key == KEY_ONOFF )	{	goto _RemoteExit;		}
4296  091b a180          	cp	a,#128
4297  091d 2603cc07c4    	jreq	L745
4300                     ; 1120 				else if ( key == KEY_PLUS) {}
4303                     ; 1121 				else if ( key == KEY_MINUS) {}
4305  0922               L1071:
4306                     ; 1123 			if( _key_min == KEY_BLINK_FADE ){	goto _RemoteExit;		}
4308  0922 c60000        	ld	a,__key_min
4309  0925 a10a          	cp	a,#10
4310  0927 2703cc09eb    	jrne	L3731
4313  092c cc07c4        	jra	L745
4314  092f               L7161:
4315                     ; 1125 		else if (_dsCount == 2) 
4317  092f a102          	cp	a,#2
4318  0931 26f6          	jrne	L3731
4319  0933               L155:
4320                     ; 1127 _OneMore:			
4320                     ; 1128 			j = 8;
4322                     ; 1129 			__sRoom = (__sRoom + 1) % j;
4324  0933 c60000        	ld	a,___sRoom
4325  0936 5f            	clrw	x
4326  0937 97            	ld	xl,a
4327  0938 5c            	incw	x
4328  0939 a608          	ld	a,#8
4329  093b cd0000        	call	c_smodx
4331  093e cd0a43        	call	LC027
4332  0941 27f0          	jreq	L155
4333                     ; 1130 			if( packet_buf[__sRoom] == 10 )	{	goto _OneMore;			}			
4335                     ; 1131 			if( __sRoom != 0 ) {	j = __sRoom - 1;		}
4339  0943 cc07bc        	jra	L1161
4340  0946               L3061:
4341                     ; 1135 	else if( __s == 200 )//	LONG_1
4343  0946 a1c8          	cp	a,#200
4344  0948 26df          	jrne	L3731
4345                     ; 1137 		if( _dsCount == 0 )
4347  094a c60000        	ld	a,__dsCount
4348  094d 2660          	jrne	L1402
4349                     ; 1139 			_dsCount = 1;
4351  094f 35010000      	mov	__dsCount,#1
4352                     ; 1142 			lcd_clear(0);
4354  0953 cd0000        	call	_lcd_clear
4356                     ; 1143 			lcd_blink_clear();
4358  0956 cd0000        	call	_lcd_blink_clear
4360                     ; 1144 			lcd_clear_btn();
4362  0959 cd0000        	call	_lcd_clear_btn
4364                     ; 1145 			LCD_BIT_SET(bT7);
4366  095c c60019        	ld	a,_iLF_DEF+25
4367  095f cd0a3d        	call	LC026
4368  0962 ca0019        	or	a,_bLF_DEF+25
4369  0965 d7540c        	ld	(21516,x),a
4370                     ; 1146 			LCD_BIT_SET(bT1);	//	현재온도
4372  0968 c60004        	ld	a,_iLF_DEF+4
4373  096b cd0a3d        	call	LC026
4374  096e ca0004        	or	a,_bLF_DEF+4
4375  0971 d7540c        	ld	(21516,x),a
4376                     ; 1147 			LCD_BIT_SET(bT3);	//	도			
4378  0974 c60000        	ld	a,_iLF_DEF
4379  0977 cd0a3d        	call	LC026
4380  097a ca0000        	or	a,_bLF_DEF
4381  097d d7540c        	ld	(21516,x),a
4382                     ; 1150 			LCD_BIT_SET(bT4);	//	설정온도
4384  0980 c6000f        	ld	a,_iLF_DEF+15
4385  0983 cd0a3d        	call	LC026
4386  0986 ca000f        	or	a,_bLF_DEF+15
4387  0989 d7540c        	ld	(21516,x),a
4388                     ; 1151 			__ui_disp_temp_c(3);//도씨 표시
4390  098c a603          	ld	a,#3
4391  098e cd0000        	call	___ui_disp_temp_c
4393                     ; 1153 			dr_mode_out = 0;
4395  0991 725f0000      	clr	_dr_mode_out
4396                     ; 1154 			_disp_mode = 0x02;
4398  0995 35020005      	mov	__disp_mode,#2
4399                     ; 1155 			ui_disp_temp_curr(uiInfo.tCurr);
4401  0999 c60002        	ld	a,_uiInfo+2
4402  099c cd0000        	call	_ui_disp_temp_curr
4404                     ; 1156 			ui_disp_temp_setup(20/*uiInfo.tSetup*/);
4406  099f a614          	ld	a,#20
4407  09a1 cd0000        	call	_ui_disp_temp_setup
4409                     ; 1157 			_remote_s[0] = __timer100ms;
4411  09a4 5500000003    	mov	__remote_s,___timer100ms
4412                     ; 1158 			_remote_s[1] = 0;
4414  09a9 725f0004      	clr	__remote_s+1
4416  09ad 203c          	jra	L3731
4417  09af               L1402:
4418                     ; 1160 		else if( _dsCount == 1 )
4420  09af 4a            	dec	a
4421  09b0 2639          	jrne	L3731
4422                     ; 1162 			if( _remote_s[0] != __timer100ms )
4424  09b2 c60003        	ld	a,__remote_s
4425  09b5 c10000        	cp	a,___timer100ms
4426  09b8 2709          	jreq	L7402
4427                     ; 1164 				_remote_s[0] = __timer100ms;
4429  09ba 5500000003    	mov	__remote_s,___timer100ms
4430                     ; 1165 				_remote_s[1]++;
4432  09bf 725c0004      	inc	__remote_s+1
4433                     ; 1166 				if( _remote_s[1] > 50 )
4435  09c3               L7402:
4436                     ; 1171 			_disp_temp = 1;		
4438  09c3 35010000      	mov	__disp_temp,#1
4439                     ; 1172 			if( key == 1 || key == 2 || key == 4 || key == 8 )
4441  09c7 7b03          	ld	a,(OFST+1,sp)
4442  09c9 a101          	cp	a,#1
4443  09cb 270c          	jreq	L5502
4445  09cd a102          	cp	a,#2
4446  09cf 2708          	jreq	L5502
4448  09d1 a104          	cp	a,#4
4449  09d3 2704          	jreq	L5502
4451  09d5 a108          	cp	a,#8
4452  09d7 2612          	jrne	L3731
4453  09d9               L5502:
4454                     ; 1174 				__s = uiInfo.remote_t[0];
4456  09d9 5500650000    	mov	___s,_uiInfo+101
4457                     ; 1175 				_dsCount = uiInfo.remote_t[1];
4459  09de 5500660000    	mov	__dsCount,_uiInfo+102
4460                     ; 1176 				__sUp = 0;
4462  09e3 725f0000      	clr	___sUp
4463                     ; 1178 				dr_mode_out = 1;
4465  09e7 35010000      	mov	_dr_mode_out,#1
4466  09eb               L3731:
4467                     ; 1226 	if (packet_changed == 1) {
4469  09eb c60000        	ld	a,_packet_changed
4470  09ee 4a            	dec	a
4471  09ef 2703cc01b9    	jrne	L444
4472                     ; 1227 		__s = 0;
4474  09f4 c70000        	ld	___s,a
4475                     ; 1228 		_dsCount = 10;
4477  09f7 350a0000      	mov	__dsCount,#10
4478                     ; 1229 		switch (_disp_mode2) {
4480  09fb c60006        	ld	a,__disp_mode2
4482                     ; 1232 			case 0x04:  __sUp = 5;	break;
4483  09fe 4a            	dec	a
4484  09ff 2709          	jreq	L355
4485  0a01 4a            	dec	a
4486  0a02 270b          	jreq	L555
4487  0a04 a002          	sub	a,#2
4488  0a06 270d          	jreq	L755
4489  0a08 200f          	jra	L7602
4490  0a0a               L355:
4491                     ; 1230 			case 0x01:	_dsCount = 0;	break;
4493  0a0a c70000        	ld	__dsCount,a
4496  0a0d 200a          	jra	L7602
4497  0a0f               L555:
4498                     ; 1231 			case 0x02:  __sUp = 16;  break;
4500  0a0f 35100000      	mov	___sUp,#16
4503  0a13 2004          	jra	L7602
4504  0a15               L755:
4505                     ; 1232 			case 0x04:  __sUp = 5;	break;
4507  0a15 35050000      	mov	___sUp,#5
4510  0a19               L7602:
4511                     ; 1234 		packet_changed = 0;
4513  0a19 725f0000      	clr	_packet_changed
4514                     ; 1236 }
4516  0a1d cc01b9        	jra	L444
4517  0a20               LC023:
4518  0a20 5f            	clrw	x
4519  0a21 97            	ld	xl,a
4520  0a22 a60a          	ld	a,#10
4521  0a24 62            	div	x,a
4522  0a25 97            	ld	xl,a
4523  0a26 a603          	ld	a,#3
4524  0a28 95            	ld	xh,a
4525  0a29 cc0000        	jp	_lcd_disp_n
4526  0a2c               LC024:
4527  0a2c 5f            	clrw	x
4528  0a2d 97            	ld	xl,a
4529  0a2e a60a          	ld	a,#10
4530  0a30 62            	div	x,a
4531  0a31 a602          	ld	a,#2
4532  0a33 95            	ld	xh,a
4533  0a34 cc0000        	jp	_lcd_disp_n
4534  0a37               LC025:
4535  0a37 5f            	clrw	x
4536  0a38 97            	ld	xl,a
4537  0a39 d60045        	ld	a,(_uiInfo+69,x)
4538  0a3c 81            	ret	
4539  0a3d               LC026:
4540  0a3d 5f            	clrw	x
4541  0a3e 97            	ld	xl,a
4542  0a3f d6540c        	ld	a,(21516,x)
4543  0a42 81            	ret	
4544  0a43               LC027:
4545  0a43 01            	rrwa	x,a
4546  0a44 c70000        	ld	___sRoom,a
4547                     ; 990 _OneMore2:			
4547                     ; 991 			if( packet_buf[__sRoom] == 10 )
4549  0a47 5f            	clrw	x
4550  0a48 97            	ld	xl,a
4551  0a49 d60000        	ld	a,(_packet_buf,x)
4552  0a4c a10a          	cp	a,#10
4553  0a4e 81            	ret	
4554  0a4f               LC028:
4555  0a4f cd0000        	call	_lcd_disp_info_shower
4557                     ; 892 			_dsCount = 1;
4559  0a52 35010000      	mov	__dsCount,#1
4560                     ; 893 			_dsPrev = 0xff;
4562  0a56 35ff0000      	mov	__dsPrev,#255
4563  0a5a 81            	ret	
4675                     	switch	.bss
4676  0000               __key_time_event:
4677  0000 000000        	ds.b	3
4678                     	xdef	__key_time_event
4679                     	xdef	_disp_rid_info
4680                     	xref	_packet_buf
4681                     	xdef	_disp_status_loop_host_N2OUT
4682                     	xdef	_disp_status_loop_host_Out_Long
4683                     	xdef	_disp_status_loop_host_Out
4684                     	xdef	_disp_status_loop_host_Off
4685                     	xdef	_disp_status_loop_remote_B
4686                     	xdef	_disp_status_loop_remote_O
4687                     	xdef	_disp_status_loop_remote_J
4688                     	xdef	_disp_status_loop_remote_Y
4689                     	xdef	_disp_status_loop_remote_N
4690                     	xdef	_disp_status_remote_message
4691                     	xref	_dr_mode_out
4692                     	xref	_packet_changed
4693                     	xref	__rcLED
4694                     	xref	__disp_temp
4695                     	xref	_start_flag
4696  0003               __remote_s:
4697  0003 000000000000  	ds.b	8
4698                     	xdef	__remote_s
4699  000b               __remote_buf:
4700  000b 000000000000  	ds.b	8
4701                     	xdef	__remote_buf
4702                     	xdef	__remote
4703                     	xdef	__boiler_fire
4704                     	xdef	__boiler_type
4705                     	xref	___rc_max
4706                     	xref	_func_rc_setting
4707                     	xref	_getHexToBin
4708                     	xdef	__boiler_water_heat
4709                     	xdef	__boiler_water_shower
4710  0013               ___boiler_shower:
4711  0013 000000000000  	ds.b	10
4712                     	xdef	___boiler_shower
4713                     	xdef	__disp_status_loop_host_boiler
4714                     	xref	_disp_backlight
4715                     	xref	_file_update2
4716                     	xref	__updateCount
4717                     	xref	__updateBit
4718                     	xref	__updateTimer
4719                     	xdef	__key_blink
4720                     	xref	__key_hour
4721                     	xref	__key_min
4722                     	xref	__key_sec
4723                     	xdef	__disp_mode2
4724                     	xdef	__disp_mode
4725                     	xref	_disp_status_curr_only
4726                     	xref	_disp_status_loop_init
4727                     	xdef	_disp_status_loop_host_B
4728                     	xdef	_disp_status_loop_host_Y
4729                     	xdef	_disp_status_loop_host_N
4730                     	xref	_disp_status_loop_messageDn
4731                     	xref	_disp_status_loop_message
4732                     	xref	__subRemote
4733                     	xref	__dsPrev
4734                     	xref	__dsCount
4735                     	xdef	_disp_status_loop_host
4736                     	xref	___sRoom
4737                     	xref	___sInfo
4738                     	xref	___sDn
4739                     	xref	___sUp
4740                     	xref	___s
4741                     	xref	_lcd_disp_info
4742                     	xref	_lcd_disp_info_shower
4743                     	xref	_ui_disp_reserve_setup
4744                     	xref	_ui_disp_repeat_setup
4745                     	xref	_ui_disp_clear_tSetup
4746                     	xref	___ui_disp_temp_c
4747                     	xref	_ui_disp_temp_curr
4748                     	xref	_ui_disp_temp_setup
4749                     	xref	_lcd_clear_rid_n
4750                     	xref	_lcd_blink_itemRoom
4751                     	xref	_lcd_blink_item
4752                     	xref	_lcd_blink_clear
4753                     	xref	_lcd_disp_rid
4754                     	xref	_lcd_disp_n
4755                     	xref	_lcd_clear
4756                     	xref	_lcd_clear_rid
4757                     	xref	_lcd_clear_btn
4758                     	xref	_iLF_DEF
4759                     	xref	_bLF_DEF
4760                     	xref	_uiInfo
4761                     	xref	___timer1s
4762                     	xref	___timer100ms
4763                     	xref.b	c_x
4783                     	xref	c_idiv
4784                     	xref	c_smodx
4785                     	end
