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
  37  0007               _temp_tsetup:
  38  0007 14            	dc.b	20
  80                     ; 57 void	disp_status_remote_message(uint8_t i)
  80                     ; 58 {
  81                     .text:	section	.text,new
  82  0000               f_disp_status_remote_message:
  84  0000 88            	push	a
  85       00000000      OFST:	set	0
  88                     ; 59 	lcd_clear_btn();
  90  0001 8d000000      	callf	f_lcd_clear_btn
  92                     ; 60 	if( i == 0x01 )			{	LCD_BIT_SET(bT6);	/*	(0)난방*/	}
  94  0005 7b01          	ld	a,(OFST+1,sp)
  95  0007 a101          	cp	a,#1
  96  0009 260c          	jrne	L52
  99  000b c60006        	ld	a,_iLF_DEF+6
 100  000e 8d4a004a      	callf	LC002
 101  0012 ca0006        	or	a,_bLF_DEF+6
 103  0015 202e          	jpf	LC001
 104  0017               L52:
 105                     ; 61 	else if( i == 0x02 )	{	LCD_BIT_SET(bT7);	/*	(1)외출*/	}
 107  0017 a102          	cp	a,#2
 108  0019 260c          	jrne	L13
 111  001b c60019        	ld	a,_iLF_DEF+25
 112  001e 8d4a004a      	callf	LC002
 113  0022 ca0019        	or	a,_bLF_DEF+25
 115  0025 201e          	jpf	LC001
 116  0027               L13:
 117                     ; 63 	else if( i == 0x08 )	{	LCD_BIT_SET(bT14);	/*	(2)예약*/	}
 119  0027 a108          	cp	a,#8
 120  0029 260c          	jrne	L53
 123  002b c60041        	ld	a,_iLF_DEF+65
 124  002e 8d4a004a      	callf	LC002
 125  0032 ca0041        	or	a,_bLF_DEF+65
 127  0035 200e          	jpf	LC001
 128  0037               L53:
 129                     ; 64 	else if( i == 0x10 )	{	LCD_BIT_SET(bT18);	/*	(2)반복*/	}
 131  0037 a110          	cp	a,#16
 132  0039 260d          	jrne	L72
 135  003b c60042        	ld	a,_iLF_DEF+66
 136  003e 8d4a004a      	callf	LC002
 137  0042 ca0042        	or	a,_bLF_DEF+66
 138  0045               LC001:
 139  0045 d7540c        	ld	(21516,x),a
 140  0048               L72:
 141                     ; 65 }
 144  0048 84            	pop	a
 145  0049 87            	retf	
 146  004a               LC002:
 147  004a 5f            	clrw	x
 148  004b 97            	ld	xl,a
 149  004c d6540c        	ld	a,(21516,x)
 150  004f 87            	retf	
 203                     ; 67 uint8_t		disp_status_loop_remote_N(uint8_t key)
 203                     ; 68 {
 204                     .text:	section	.text,new
 205  0000               f_disp_status_loop_remote_N:
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
 268  003c 273d          	jreq	L17
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
 292  0061 8d000000      	callf	f___ui_disp_temp_c
 294                     ; 86 		ui_disp_temp_setup(uiInfo.tempSetup[key]);
 296  0065 7b03          	ld	a,(OFST+1,sp)
 297  0067 5f            	clrw	x
 298  0068 97            	ld	xl,a
 299  0069 d6003d        	ld	a,(_uiInfo+61,x)
 300  006c 8d000000      	callf	f_ui_disp_temp_setup
 302                     ; 87 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 304  0070 7b03          	ld	a,(OFST+1,sp)
 305  0072 5f            	clrw	x
 306  0073 97            	ld	xl,a
 307  0074 d60035        	ld	a,(_uiInfo+53,x)
 308  0077 8d000000      	callf	f_ui_disp_temp_curr
 310  007b               L17:
 311                     ; 90 	return j;
 313  007b 7b01          	ld	a,(OFST-1,sp)
 316  007d 5b03          	addw	sp,#3
 317  007f 87            	retf	
 366                     ; 93 uint8_t	disp_status_loop_remote_Y(uint8_t key)
 366                     ; 94 {
 367                     .text:	section	.text,new
 368  0000               f_disp_status_loop_remote_Y:
 370  0000 88            	push	a
 371  0001 89            	pushw	x
 372       00000002      OFST:	set	2
 375                     ; 96 	uint8_t	j = 0;
 377  0002 0f01          	clr	(OFST-1,sp)
 378                     ; 97 	i = uiInfo.remote_time[key];
 380  0004 5f            	clrw	x
 381  0005 97            	ld	xl,a
 382  0006 d6004d        	ld	a,(_uiInfo+77,x)
 383  0009 6b02          	ld	(OFST+0,sp),a
 384                     ; 98 	if( uiInfo.enc != 0 )
 386  000b c60000        	ld	a,_uiInfo
 387  000e 2727          	jreq	L311
 388                     ; 100 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
 390  0010 a540          	bcp	a,#64
 391  0012 2604          	jrne	L62
 392  0014 a6ff          	ld	a,#255
 393  0016 2002          	jra	L03
 394  0018               L62:
 395  0018 a601          	ld	a,#1
 396  001a               L03:
 397  001a 1b02          	add	a,(OFST+0,sp)
 398                     ; 101 		if( i<=2 )	i = 2;
 400  001c a103          	cp	a,#3
 401  001e 2402          	jruge	L511
 404  0020 a602          	ld	a,#2
 405  0022               L511:
 406                     ; 102 		if( i>=48 )	i = 48;
 408  0022 a130          	cp	a,#48
 409  0024 2502          	jrult	L711
 412  0026 a630          	ld	a,#48
 413  0028               L711:
 414  0028 6b02          	ld	(OFST+0,sp),a
 415                     ; 103 		uiInfo.remote_time[key] = i;
 417  002a 5f            	clrw	x
 418  002b 7b03          	ld	a,(OFST+1,sp)
 419  002d 97            	ld	xl,a
 420  002e 7b02          	ld	a,(OFST+0,sp)
 421  0030 d7004d        	ld	(_uiInfo+77,x),a
 422                     ; 104 		j = 1;
 424  0033 a601          	ld	a,#1
 425  0035 6b01          	ld	(OFST-1,sp),a
 426  0037               L311:
 427                     ; 107 	if( _dsPrev != i )
 429  0037 c60000        	ld	a,__dsPrev
 430  003a 1102          	cp	a,(OFST+0,sp)
 431  003c 2710          	jreq	L121
 432                     ; 109 		_dsPrev = i;
 434  003e 7b02          	ld	a,(OFST+0,sp)
 435  0040 c70000        	ld	__dsPrev,a
 436                     ; 114 		ui_disp_reserve_setup(uiInfo.remote_time[key]);		
 438  0043 5f            	clrw	x
 439  0044 7b03          	ld	a,(OFST+1,sp)
 440  0046 97            	ld	xl,a
 441  0047 d6004d        	ld	a,(_uiInfo+77,x)
 442  004a 8d000000      	callf	f_ui_disp_reserve_setup
 444  004e               L121:
 445                     ; 117 	return j;
 447  004e 7b01          	ld	a,(OFST-1,sp)
 450  0050 5b03          	addw	sp,#3
 451  0052 87            	retf	
 487                     ; 120 uint8_t		disp_status_loop_remote_J(uint8_t key)
 487                     ; 121 {
 488                     .text:	section	.text,new
 489  0000               f_disp_status_loop_remote_J:
 491  0000 88            	push	a
 492       00000000      OFST:	set	0
 495                     ; 123 	if (_dsPrev != 0xFE ) {
 497  0001 c60000        	ld	a,__dsPrev
 498  0004 a1fe          	cp	a,#254
 499  0006 2715          	jreq	L731
 500                     ; 124 		_dsPrev = 0xFE;
 502  0008 35fe0000      	mov	__dsPrev,#254
 503                     ; 125 		ui_disp_clear_tSetup(1);
 505  000c a601          	ld	a,#1
 506  000e 8d000000      	callf	f_ui_disp_clear_tSetup
 508                     ; 126 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 510  0012 7b01          	ld	a,(OFST+1,sp)
 511  0014 5f            	clrw	x
 512  0015 97            	ld	xl,a
 513  0016 d60035        	ld	a,(_uiInfo+53,x)
 514  0019 8d000000      	callf	f_ui_disp_temp_curr
 516  001d               L731:
 517                     ; 129 	return key;
 519  001d 7b01          	ld	a,(OFST+1,sp)
 522  001f 5b01          	addw	sp,#1
 523  0021 87            	retf	
 562                     ; 132 uint8_t		disp_status_loop_remote_O(uint8_t key)
 562                     ; 133 {
 563                     .text:	section	.text,new
 564  0000               f_disp_status_loop_remote_O:
 566  0000 88            	push	a
 567       00000000      OFST:	set	0
 570                     ; 135 	if (_dsPrev != 0xFE ) {
 572  0001 c60000        	ld	a,__dsPrev
 573  0004 a1fe          	cp	a,#254
 574  0006 2737          	jreq	L551
 575                     ; 136 		_dsPrev = 0xFE;
 577  0008 35fe0000      	mov	__dsPrev,#254
 578                     ; 142 		LCD_BIT_SET(bT1);	//	현재온도
 580  000c 5f            	clrw	x
 581  000d c60004        	ld	a,_iLF_DEF+4
 582  0010 97            	ld	xl,a
 583  0011 d6540c        	ld	a,(21516,x)
 584  0014 ca0004        	or	a,_bLF_DEF+4
 585  0017 d7540c        	ld	(21516,x),a
 586                     ; 143 		LCD_BIT_SET(bT4);	//	설정온도
 588  001a c6000f        	ld	a,_iLF_DEF+15
 589  001d 5f            	clrw	x
 590  001e 97            	ld	xl,a
 591  001f d6540c        	ld	a,(21516,x)
 592  0022 ca000f        	or	a,_bLF_DEF+15
 593  0025 d7540c        	ld	(21516,x),a
 594                     ; 144 		__ui_disp_temp_c(3);//도씨 표시
 596  0028 a603          	ld	a,#3
 597  002a 8d000000      	callf	f___ui_disp_temp_c
 599                     ; 145 		ui_disp_temp_setup(/*uiInfo.tempSetup[key]*/20);
 601  002e a614          	ld	a,#20
 602  0030 8d000000      	callf	f_ui_disp_temp_setup
 604                     ; 146 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 606  0034 7b01          	ld	a,(OFST+1,sp)
 607  0036 5f            	clrw	x
 608  0037 97            	ld	xl,a
 609  0038 d60035        	ld	a,(_uiInfo+53,x)
 610  003b 8d000000      	callf	f_ui_disp_temp_curr
 612  003f               L551:
 613                     ; 149 	return key;
 615  003f 7b01          	ld	a,(OFST+1,sp)
 618  0041 5b01          	addw	sp,#1
 619  0043 87            	retf	
 668                     ; 152 uint8_t		disp_status_loop_remote_B(uint8_t key)
 668                     ; 153 {
 669                     .text:	section	.text,new
 670  0000               f_disp_status_loop_remote_B:
 672  0000 88            	push	a
 673  0001 89            	pushw	x
 674       00000002      OFST:	set	2
 677                     ; 155 	uint8_t	j = 0;
 679  0002 0f01          	clr	(OFST-1,sp)
 680                     ; 156 	i = uiInfo.remote_banb[key];
 682  0004 5f            	clrw	x
 683  0005 97            	ld	xl,a
 684  0006 d60055        	ld	a,(_uiInfo+85,x)
 685  0009 6b02          	ld	(OFST+0,sp),a
 686                     ; 157 	if( uiInfo.enc != 0 )
 688  000b c60000        	ld	a,_uiInfo
 689  000e 272b          	jreq	L771
 690                     ; 162 		i += (uiInfo.enc&0x40)==0 ? -5 : 5;
 692  0010 a540          	bcp	a,#64
 693  0012 2604          	jrne	L45
 694  0014 a6fb          	ld	a,#251
 695  0016 2002          	jra	L65
 696  0018               L45:
 697  0018 a605          	ld	a,#5
 698  001a               L65:
 699  001a 1b02          	add	a,(OFST+0,sp)
 700  001c 6b02          	ld	(OFST+0,sp),a
 701                     ; 163 		if( i<30 )	i = 85;
 703  001e a11e          	cp	a,#30
 704  0020 2404          	jruge	L102
 707  0022 a655          	ld	a,#85
 709  0024 2006          	jpf	LC003
 710  0026               L102:
 711                     ; 164 		else if( i>90 )	i = 30;
 713  0026 a15b          	cp	a,#91
 714  0028 2504          	jrult	L302
 717  002a a61e          	ld	a,#30
 718  002c               LC003:
 719  002c 6b02          	ld	(OFST+0,sp),a
 720  002e               L302:
 721                     ; 170 		uiInfo.remote_banb[key] = i;
 723  002e 7b03          	ld	a,(OFST+1,sp)
 724  0030 5f            	clrw	x
 725  0031 97            	ld	xl,a
 726  0032 7b02          	ld	a,(OFST+0,sp)
 727  0034 d70055        	ld	(_uiInfo+85,x),a
 728                     ; 171 		j = 1;
 730  0037 a601          	ld	a,#1
 731  0039 6b01          	ld	(OFST-1,sp),a
 732  003b               L771:
 733                     ; 173 	if( _dsPrev != i )
 735  003b c60000        	ld	a,__dsPrev
 736  003e 1102          	cp	a,(OFST+0,sp)
 737  0040 2710          	jreq	L702
 738                     ; 175 		_dsPrev = i;
 740  0042 7b02          	ld	a,(OFST+0,sp)
 741  0044 c70000        	ld	__dsPrev,a
 742                     ; 180 		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
 744  0047 5f            	clrw	x
 745  0048 7b03          	ld	a,(OFST+1,sp)
 746  004a 97            	ld	xl,a
 747  004b d60055        	ld	a,(_uiInfo+85,x)
 748  004e 8d000000      	callf	f_ui_disp_repeat_setup
 750  0052               L702:
 751                     ; 182 	return j;
 753  0052 7b01          	ld	a,(OFST-1,sp)
 756  0054 5b03          	addw	sp,#3
 757  0056 87            	retf	
 805                     ; 185 uint8_t		disp_status_loop_host_Off(uint8_t key)
 805                     ; 186 {
 806                     .text:	section	.text,new
 807  0000               f_disp_status_loop_host_Off:
 809  0000 89            	pushw	x
 810       00000002      OFST:	set	2
 813                     ; 188 	uint8_t	j = 0;
 815  0001 0f01          	clr	(OFST-1,sp)
 816                     ; 189 	i = uiInfo.tSetup;
 818  0003 c6000e        	ld	a,_uiInfo+14
 819  0006 6b02          	ld	(OFST+0,sp),a
 820                     ; 190 	if( uiInfo.enc != 0 )
 822  0008 c60000        	ld	a,_uiInfo
 823  000b 271e          	jreq	L132
 824                     ; 193 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 826  000d a540          	bcp	a,#64
 827  000f 2604          	jrne	L46
 828  0011 a6ff          	ld	a,#255
 829  0013 2002          	jra	L66
 830  0015               L46:
 831  0015 a601          	ld	a,#1
 832  0017               L66:
 833  0017 1b02          	add	a,(OFST+0,sp)
 834                     ; 194 		if( i<=10 )	i = 10;
 836  0019 a10b          	cp	a,#11
 837  001b 2402          	jruge	L332
 840  001d a60a          	ld	a,#10
 841  001f               L332:
 842                     ; 195 		if( i>=80 )	i = 80;
 844  001f a150          	cp	a,#80
 845  0021 2502          	jrult	L532
 848  0023 a650          	ld	a,#80
 849  0025               L532:
 850  0025 6b02          	ld	(OFST+0,sp),a
 851                     ; 198 		j = 1;
 853  0027 a601          	ld	a,#1
 854  0029 6b01          	ld	(OFST-1,sp),a
 855  002b               L132:
 856                     ; 200 	if( _dsPrev != i )
 858  002b c60000        	ld	a,__dsPrev
 859  002e 1102          	cp	a,(OFST+0,sp)
 860  0030 2705          	jreq	L732
 861                     ; 202 		_dsPrev = i;
 863  0032 7b02          	ld	a,(OFST+0,sp)
 864  0034 c70000        	ld	__dsPrev,a
 865  0037               L732:
 866                     ; 208 	return j;
 868  0037 7b01          	ld	a,(OFST-1,sp)
 871  0039 85            	popw	x
 872  003a 87            	retf	
 925                     ; 211 uint8_t		disp_status_loop_host_Out(uint8_t key)
 925                     ; 212 {
 926                     .text:	section	.text,new
 927  0000               f_disp_status_loop_host_Out:
 929  0000 89            	pushw	x
 930       00000002      OFST:	set	2
 933                     ; 214 	uint8_t	j = 0;
 935  0001 0f01          	clr	(OFST-1,sp)
 936                     ; 215 	i = uiInfo.tSetup;
 938  0003 c6000e        	ld	a,_uiInfo+14
 939  0006 6b02          	ld	(OFST+0,sp),a
 940                     ; 216 	if( uiInfo.enc != 0 )
 942  0008 c60000        	ld	a,_uiInfo
 943  000b 2704          	jreq	L162
 944                     ; 224 		j = 1;
 946  000d a601          	ld	a,#1
 947  000f 6b01          	ld	(OFST-1,sp),a
 948  0011               L162:
 949                     ; 226 	if( _dsPrev != i )
 951  0011 c60000        	ld	a,__dsPrev
 952  0014 1102          	cp	a,(OFST+0,sp)
 953  0016 2719          	jreq	L362
 954                     ; 228 		_dsPrev = i;
 956  0018 7b02          	ld	a,(OFST+0,sp)
 957  001a c70000        	ld	__dsPrev,a
 958                     ; 236 		ui_disp_temp_curr(uiInfo.tCurr);
 960  001d c60002        	ld	a,_uiInfo+2
 961  0020 8d000000      	callf	f_ui_disp_temp_curr
 963                     ; 237 		UPDATE_BIT(BIT_TSETUP);
 965  0024 72140000      	bset	__updateBit,#2
 968  0028 5500000000    	mov	__updateTimer,___timer1s
 971  002d 35050000      	mov	__updateCount,#5
 973  0031               L362:
 974                     ; 239 	return j;
 976  0031 7b01          	ld	a,(OFST-1,sp)
 979  0033 85            	popw	x
 980  0034 87            	retf	
1029                     ; 242 uint8_t		disp_status_loop_host_Out_Long(uint8_t key)
1029                     ; 243 {
1030                     .text:	section	.text,new
1031  0000               f_disp_status_loop_host_Out_Long:
1033  0000 89            	pushw	x
1034       00000002      OFST:	set	2
1037                     ; 245 	uint8_t	j = 0;
1039  0001 0f01          	clr	(OFST-1,sp)
1040                     ; 246 	i = uiInfo.tSetup;
1042  0003 c6000e        	ld	a,_uiInfo+14
1043  0006 6b02          	ld	(OFST+0,sp),a
1044                     ; 247 	if( uiInfo.enc != 0 )
1046  0008 c60000        	ld	a,_uiInfo
1047  000b 2704          	jreq	L503
1048                     ; 255 		j = 1;
1050  000d a601          	ld	a,#1
1051  000f 6b01          	ld	(OFST-1,sp),a
1052  0011               L503:
1053                     ; 257 	if( _dsPrev != i )
1055  0011 c60000        	ld	a,__dsPrev
1056  0014 1102          	cp	a,(OFST+0,sp)
1057  0016 270c          	jreq	L703
1058                     ; 259 		_dsPrev = i;
1060  0018 7b02          	ld	a,(OFST+0,sp)
1061  001a c70000        	ld	__dsPrev,a
1062                     ; 261 		ui_disp_temp_curr(uiInfo.tCurr);
1064  001d c60002        	ld	a,_uiInfo+2
1065  0020 8d000000      	callf	f_ui_disp_temp_curr
1067  0024               L703:
1068                     ; 264 	return j;
1070  0024 7b01          	ld	a,(OFST-1,sp)
1073  0026 85            	popw	x
1074  0027 87            	retf	
1128                     ; 267 uint8_t		disp_status_loop_host_N(uint8_t key)
1128                     ; 268 {
1129                     .text:	section	.text,new
1130  0000               f_disp_status_loop_host_N:
1132  0000 89            	pushw	x
1133       00000002      OFST:	set	2
1136                     ; 270 	uint8_t	j = 0;
1138  0001 0f01          	clr	(OFST-1,sp)
1139                     ; 271 	i = uiInfo.tSetup;
1141  0003 c6000e        	ld	a,_uiInfo+14
1142  0006 6b02          	ld	(OFST+0,sp),a
1143                     ; 272 	if( uiInfo.enc != 0 )
1145  0008 c60000        	ld	a,_uiInfo
1146  000b 2721          	jreq	L133
1147                     ; 275 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1149  000d a540          	bcp	a,#64
1150  000f 2604          	jrne	L201
1151  0011 a6ff          	ld	a,#255
1152  0013 2002          	jra	L401
1153  0015               L201:
1154  0015 a601          	ld	a,#1
1155  0017               L401:
1156  0017 1b02          	add	a,(OFST+0,sp)
1157                     ; 276 		if( i<=10 )	i = 10;
1159  0019 a10b          	cp	a,#11
1160  001b 2402          	jruge	L333
1163  001d a60a          	ld	a,#10
1164  001f               L333:
1165                     ; 277 		if( i>=80 )	i = 80;
1167  001f a150          	cp	a,#80
1168  0021 2502          	jrult	L533
1171  0023 a650          	ld	a,#80
1172  0025               L533:
1173  0025 6b02          	ld	(OFST+0,sp),a
1174                     ; 278 		uiInfo.tSetup = i;
1176  0027 c7000e        	ld	_uiInfo+14,a
1177                     ; 280 		j = 1;
1179  002a a601          	ld	a,#1
1180  002c 6b01          	ld	(OFST-1,sp),a
1181  002e               L133:
1182                     ; 282 	if( _dsPrev != i )
1184  002e c60000        	ld	a,__dsPrev
1185  0031 1102          	cp	a,(OFST+0,sp)
1186  0033 2720          	jreq	L733
1187                     ; 284 		_dsPrev = i;
1189  0035 7b02          	ld	a,(OFST+0,sp)
1190  0037 c70000        	ld	__dsPrev,a
1191                     ; 287 		ui_disp_temp_setup(uiInfo.tSetup);
1193  003a c6000e        	ld	a,_uiInfo+14
1194  003d 8d000000      	callf	f_ui_disp_temp_setup
1196                     ; 288 		ui_disp_temp_curr(uiInfo.tCurr);
1198  0041 c60002        	ld	a,_uiInfo+2
1199  0044 8d000000      	callf	f_ui_disp_temp_curr
1201                     ; 290 		UPDATE_BIT(BIT_TSETUP);
1203  0048 72140000      	bset	__updateBit,#2
1206  004c 5500000000    	mov	__updateTimer,___timer1s
1209  0051 35050000      	mov	__updateCount,#5
1211  0055               L733:
1212                     ; 292 	return j;
1214  0055 7b01          	ld	a,(OFST-1,sp)
1217  0057 85            	popw	x
1218  0058 87            	retf	
1271                     ; 295 uint8_t		disp_status_loop_host_N2OUT(uint8_t key)
1271                     ; 296 {
1272                     .text:	section	.text,new
1273  0000               f_disp_status_loop_host_N2OUT:
1275  0000 89            	pushw	x
1276       00000002      OFST:	set	2
1279                     ; 298 	uint8_t	j = 0;
1281  0001 0f01          	clr	(OFST-1,sp)
1282                     ; 299 	i = uiInfo.tSetup;
1284  0003 c6000e        	ld	a,_uiInfo+14
1285  0006 6b02          	ld	(OFST+0,sp),a
1286                     ; 300 	if( uiInfo.enc != 0 )
1288  0008 c60000        	ld	a,_uiInfo
1289  000b 2721          	jreq	L163
1290                     ; 303 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1292  000d a540          	bcp	a,#64
1293  000f 2604          	jrne	L411
1294  0011 a6ff          	ld	a,#255
1295  0013 2002          	jra	L611
1296  0015               L411:
1297  0015 a601          	ld	a,#1
1298  0017               L611:
1299  0017 1b02          	add	a,(OFST+0,sp)
1300                     ; 304 		if( i<=10 )	i = 10;
1302  0019 a10b          	cp	a,#11
1303  001b 2402          	jruge	L363
1306  001d a60a          	ld	a,#10
1307  001f               L363:
1308                     ; 305 		if( i>=80 )	i = 80;
1310  001f a150          	cp	a,#80
1311  0021 2502          	jrult	L563
1314  0023 a650          	ld	a,#80
1315  0025               L563:
1316  0025 6b02          	ld	(OFST+0,sp),a
1317                     ; 306 		uiInfo.tSetup = i;
1319  0027 c7000e        	ld	_uiInfo+14,a
1320                     ; 308 		j = 1;
1322  002a a601          	ld	a,#1
1323  002c 6b01          	ld	(OFST-1,sp),a
1324  002e               L163:
1325                     ; 310 	if( _dsPrev != i )
1327  002e c60000        	ld	a,__dsPrev
1328  0031 1102          	cp	a,(OFST+0,sp)
1329  0033 2719          	jreq	L763
1330                     ; 312 		_dsPrev = i;
1332  0035 7b02          	ld	a,(OFST+0,sp)
1333  0037 c70000        	ld	__dsPrev,a
1334                     ; 321 		ui_disp_temp_curr(uiInfo.tCurr);
1336  003a c60002        	ld	a,_uiInfo+2
1337  003d 8d000000      	callf	f_ui_disp_temp_curr
1339                     ; 323 		UPDATE_BIT(BIT_TSETUP);
1341  0041 72140000      	bset	__updateBit,#2
1344  0045 5500000000    	mov	__updateTimer,___timer1s
1347  004a 35050000      	mov	__updateCount,#5
1349  004e               L763:
1350                     ; 325 	return j;
1352  004e 7b01          	ld	a,(OFST-1,sp)
1355  0050 85            	popw	x
1356  0051 87            	retf	
1409                     ; 328 uint8_t	disp_status_loop_host_Y(uint8_t key)
1409                     ; 329 {
1410                     .text:	section	.text,new
1411  0000               f_disp_status_loop_host_Y:
1413  0000 89            	pushw	x
1414       00000002      OFST:	set	2
1417                     ; 331 	uint8_t	j = 0;
1419  0001 0f01          	clr	(OFST-1,sp)
1420                     ; 332 	i = uiInfo.reserve;
1422  0003 c6000d        	ld	a,_uiInfo+13
1423  0006 6b02          	ld	(OFST+0,sp),a
1424                     ; 333 	if( uiInfo.enc != 0 )
1426  0008 c60000        	ld	a,_uiInfo
1427  000b 2721          	jreq	L114
1428                     ; 336 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1430  000d a540          	bcp	a,#64
1431  000f 2604          	jrne	L421
1432  0011 a6ff          	ld	a,#255
1433  0013 2002          	jra	L621
1434  0015               L421:
1435  0015 a601          	ld	a,#1
1436  0017               L621:
1437  0017 1b02          	add	a,(OFST+0,sp)
1438                     ; 337 		if( i<=2 )	i = 2;
1440  0019 a103          	cp	a,#3
1441  001b 2402          	jruge	L314
1444  001d a602          	ld	a,#2
1445  001f               L314:
1446                     ; 338 		if( i>=48 )	i = 48;
1448  001f a130          	cp	a,#48
1449  0021 2502          	jrult	L514
1452  0023 a630          	ld	a,#48
1453  0025               L514:
1454  0025 6b02          	ld	(OFST+0,sp),a
1455                     ; 339 		uiInfo.reserve = i;
1457  0027 c7000d        	ld	_uiInfo+13,a
1458                     ; 341 		j = 1;
1460  002a a601          	ld	a,#1
1461  002c 6b01          	ld	(OFST-1,sp),a
1462  002e               L114:
1463                     ; 343 	if( _dsPrev != i )
1465  002e c60000        	ld	a,__dsPrev
1466  0031 1102          	cp	a,(OFST+0,sp)
1467  0033 2719          	jreq	L714
1468                     ; 345 		_dsPrev = i;
1470  0035 7b02          	ld	a,(OFST+0,sp)
1471  0037 c70000        	ld	__dsPrev,a
1472                     ; 348 		ui_disp_reserve_setup(uiInfo.reserve);
1474  003a c6000d        	ld	a,_uiInfo+13
1475  003d 8d000000      	callf	f_ui_disp_reserve_setup
1477                     ; 349 		UPDATE_BIT(BIT_RESERVE);
1479  0041 72120000      	bset	__updateBit,#1
1482  0045 5500000000    	mov	__updateTimer,___timer1s
1485  004a 35050000      	mov	__updateCount,#5
1487  004e               L714:
1488                     ; 351 	return j;
1490  004e 7b01          	ld	a,(OFST-1,sp)
1493  0050 85            	popw	x
1494  0051 87            	retf	
1547                     ; 354 uint8_t		disp_status_loop_host_B(uint8_t key)
1547                     ; 355 {
1548                     .text:	section	.text,new
1549  0000               f_disp_status_loop_host_B:
1551  0000 89            	pushw	x
1552       00000002      OFST:	set	2
1555                     ; 357 	uint8_t	j = 0;
1557  0001 0f01          	clr	(OFST-1,sp)
1558                     ; 358 	i = uiInfo.repeat;
1560  0003 c6000c        	ld	a,_uiInfo+12
1561  0006 6b02          	ld	(OFST+0,sp),a
1562                     ; 359 	if( uiInfo.enc != 0 )
1564  0008 c60000        	ld	a,_uiInfo
1565  000b 2725          	jreq	L144
1566                     ; 362 		i += (uiInfo.enc&0x40)==0 ? -5 : 5;
1568  000d a540          	bcp	a,#64
1569  000f 2604          	jrne	L431
1570  0011 a6fb          	ld	a,#251
1571  0013 2002          	jra	L631
1572  0015               L431:
1573  0015 a605          	ld	a,#5
1574  0017               L631:
1575  0017 1b02          	add	a,(OFST+0,sp)
1576  0019 6b02          	ld	(OFST+0,sp),a
1577                     ; 363 		if( i<30 )	i = 85;
1579  001b a11e          	cp	a,#30
1580  001d 2404          	jruge	L344
1583  001f a655          	ld	a,#85
1585  0021 2006          	jpf	LC004
1586  0023               L344:
1587                     ; 364 		else if( i>90 )	i = 30;
1589  0023 a15b          	cp	a,#91
1590  0025 2504          	jrult	L544
1593  0027 a61e          	ld	a,#30
1594  0029               LC004:
1595  0029 6b02          	ld	(OFST+0,sp),a
1596  002b               L544:
1597                     ; 365 		uiInfo.repeat = i;
1599  002b c7000c        	ld	_uiInfo+12,a
1600                     ; 367 		j = 1;
1602  002e a601          	ld	a,#1
1603  0030 6b01          	ld	(OFST-1,sp),a
1604  0032               L144:
1605                     ; 369 	if( _dsPrev != i )
1607  0032 c60000        	ld	a,__dsPrev
1608  0035 1102          	cp	a,(OFST+0,sp)
1609  0037 2719          	jreq	L154
1610                     ; 371 		_dsPrev = i;
1612  0039 7b02          	ld	a,(OFST+0,sp)
1613  003b c70000        	ld	__dsPrev,a
1614                     ; 374 		ui_disp_repeat_setup(uiInfo.repeat);
1616  003e c6000c        	ld	a,_uiInfo+12
1617  0041 8d000000      	callf	f_ui_disp_repeat_setup
1619                     ; 375 		UPDATE_BIT(BIT_REPEAT);
1621  0045 72100000      	bset	__updateBit,#0
1624  0049 5500000000    	mov	__updateTimer,___timer1s
1627  004e 35050000      	mov	__updateCount,#5
1629  0052               L154:
1630                     ; 377 	return j;
1632  0052 7b01          	ld	a,(OFST-1,sp)
1635  0054 85            	popw	x
1636  0055 87            	retf	
1638                     	switch	.data
1639  0008               __key_blink:
1640  0008 00            	dc.b	0
1690                     ; 383 void	disp_rid_info(void)
1690                     ; 384 {
1691                     .text:	section	.text,new
1692  0000               f_disp_rid_info:
1694  0000 5203          	subw	sp,#3
1695       00000003      OFST:	set	3
1698                     ; 390 	j = uiInfo.cnt + uiInfo.cnt_sub;
1700  0002 c60005        	ld	a,_uiInfo+5
1701  0005 cb0006        	add	a,_uiInfo+6
1702  0008 6b01          	ld	(OFST-2,sp),a
1703                     ; 391 	for( i=1; i<6; i++ )
1705  000a a601          	ld	a,#1
1706  000c 6b03          	ld	(OFST+0,sp),a
1707  000e               L374:
1708                     ; 393 		lcd_clear_rid_n(i + 1, 1);
1710  000e ae0001        	ldw	x,#1
1711  0011 4c            	inc	a
1712  0012 95            	ld	xh,a
1713  0013 8d000000      	callf	f_lcd_clear_rid_n
1715                     ; 394 		if( i <= j )
1717  0017 7b03          	ld	a,(OFST+0,sp)
1718  0019 1101          	cp	a,(OFST-2,sp)
1719  001b 2224          	jrugt	L105
1720                     ; 396 			if( packet_buf[i] != 10 ){
1722  001d 5f            	clrw	x
1723  001e 97            	ld	xl,a
1724  001f d60000        	ld	a,(_packet_buf,x)
1725  0022 a10a          	cp	a,#10
1726  0024 271b          	jreq	L105
1727                     ; 397 				led = getHexToBin(_rcLED, i);
1729  0026 7b03          	ld	a,(OFST+0,sp)
1730  0028 97            	ld	xl,a
1731  0029 c60000        	ld	a,__rcLED
1732  002c 95            	ld	xh,a
1733  002d 8d000000      	callf	f_getHexToBin
1735  0031 6b02          	ld	(OFST-1,sp),a
1736                     ; 398 				lcd_disp_rid(i + 1, led, 1);
1738  0033 4b01          	push	#1
1739  0035 7b03          	ld	a,(OFST+0,sp)
1740  0037 97            	ld	xl,a
1741  0038 7b04          	ld	a,(OFST+1,sp)
1742  003a 4c            	inc	a
1743  003b 95            	ld	xh,a
1744  003c 8d000000      	callf	f_lcd_disp_rid
1746  0040 84            	pop	a
1747  0041               L105:
1748                     ; 391 	for( i=1; i<6; i++ )
1750  0041 0c03          	inc	(OFST+0,sp)
1753  0043 7b03          	ld	a,(OFST+0,sp)
1754  0045 a106          	cp	a,#6
1755  0047 25c5          	jrult	L374
1756                     ; 402 }
1759  0049 5b03          	addw	sp,#3
1760  004b 87            	retf	
1795                     ; 413 void	_disp_status_loop_host_boiler(uint8_t id)
1795                     ; 414 {
1796                     .text:	section	.text,new
1797  0000               f__disp_status_loop_host_boiler:
1801                     ; 415 	uiInfo.opMode = (id==0) ? 7 : __boiler_shower[3];
1803  0000 4d            	tnz	a
1804  0001 2604          	jrne	L451
1805  0003 a607          	ld	a,#7
1806  0005 2003          	jra	L651
1807  0007               L451:
1808  0007 c60016        	ld	a,___boiler_shower+3
1809  000a               L651:
1810  000a c70007        	ld	_uiInfo+7,a
1811                     ; 416 	func_rc_setting();
1814                     ; 417 }
1817  000d ac000000      	jpf	f_func_rc_setting
1930                     ; 421 void	disp_status_loop_host(uint8_t key)
1930                     ; 422 {
1931                     .text:	section	.text,new
1932  0000               f_disp_status_loop_host:
1934  0000 88            	push	a
1935  0001 89            	pushw	x
1936       00000002      OFST:	set	2
1939                     ; 423 	uint8_t	i = 0;
1941  0002 0f02          	clr	(OFST+0,sp)
1942                     ; 424 	uint8_t	j = 0;
1944                     ; 425 	uint8_t	k = 0;
1946  0004 0f01          	clr	(OFST-1,sp)
1947                     ; 427 	if (_remote == 0/* && __s != 200*/ ) {
1949  0006 c60004        	ld	a,__remote
1950  0009 2604          	jrne	L306
1951                     ; 428 		disp_rid_info();
1953  000b 8d000000      	callf	f_disp_rid_info
1955  000f               L306:
1956                     ; 431 	if( __s == 0 )  // 일반 모드
1958  000f c60000        	ld	a,___s
1959  0012 2704ac780578  	jrne	L506
1960                     ; 433 		if( _dsCount == 0 )
1962  0018 c60000        	ld	a,__dsCount
1963  001b 2619          	jrne	L706
1964                     ; 435 			_dsCount = 10;
1966  001d 350a0000      	mov	__dsCount,#10
1967                     ; 439 			if (start_flag == 0) {	__sUp = 0;		}
1969  0021 725d0000      	tnz	_start_flag
1970  0025 2603          	jrne	L116
1973  0027 c70000        	ld	___sUp,a
1974  002a               L116:
1975                     ; 449 			start_flag = 0;
1977  002a 725f0000      	clr	_start_flag
1978                     ; 451 			__sDn = 0xff;
1980  002e 35ff0000      	mov	___sDn,#255
1982  0032 ac6c0a6c      	jra	L3731
1983  0036               L706:
1984                     ; 454 		} else if (_dsCount == 9) {
1986  0036 a109          	cp	a,#9
1987  0038 2610          	jrne	L516
1988                     ; 455 			_dsCount = 1;
1990  003a 35010000      	mov	__dsCount,#1
1991                     ; 456 			__sDn = 0xff;
1993  003e 35ff0000      	mov	___sDn,#255
1994                     ; 457 			disp_status_loop_init();
1996  0042 8d000000      	callf	f_disp_status_loop_init
1999  0046 ac6c0a6c      	jra	L3731
2000  004a               L516:
2001                     ; 459 		else if( _dsCount == 10 )
2003  004a a10a          	cp	a,#10
2004  004c 2704aced00ed  	jrne	L126
2005                     ; 464 			if( __sUp == 0 )		_dsCount = 15;	//	N
2007  0052 c60000        	ld	a,___sUp
2008  0055 2606          	jrne	L326
2011  0057 350f0000      	mov	__dsCount,#15
2013  005b 2052          	jra	L526
2014  005d               L326:
2015                     ; 467 			else if( __sUp == 5 )	{_dsCount = 45; _key_time_event[0] = 0; }	//	off
2017  005d a105          	cp	a,#5
2018  005f 260a          	jrne	L726
2021  0061 352d0000      	mov	__dsCount,#45
2024  0065 725f0000      	clr	__key_time_event
2026  0069 2044          	jra	L526
2027  006b               L726:
2028                     ; 468 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //	out
2030  006b a110          	cp	a,#16
2031  006d 260a          	jrne	L336
2034  006f 35100000      	mov	__dsCount,#16
2037  0073 35080000      	mov	___sUp,#8
2039  0077 2036          	jra	L526
2040  0079               L336:
2041                     ; 469 			else if( __sUp == 101 )	{	_dsCount = 0;	__s = 101; }
2043  0079 a165          	cp	a,#101
2044  007b 260a          	jrne	L736
2047  007d 725f0000      	clr	__dsCount
2050  0081 35650000      	mov	___s,#101
2052  0085 2028          	jra	L526
2053  0087               L736:
2054                     ; 470 			else if( __sUp == 20 )	{	
2056  0087 a114          	cp	a,#20
2057  0089 260a          	jrne	L346
2058                     ; 471 				_dsCount = 0; 
2060  008b 725f0000      	clr	__dsCount
2061                     ; 472 				__s = 1;
2063  008f 35010000      	mov	___s,#1
2065  0093 201a          	jra	L526
2066  0095               L346:
2067                     ; 474 			else if( __sUp == 17 )	{_dsCount = 17; _dsPrev = 0xff;}	//	Out long
2069  0095 a111          	cp	a,#17
2070  0097 260a          	jrne	L746
2073  0099 35110000      	mov	__dsCount,#17
2076  009d 35ff0000      	mov	__dsPrev,#255
2078  00a1 200c          	jra	L526
2079  00a3               L746:
2080                     ; 475 			else if( __sUp == 151 || __sUp == 16 )	_dsCount = 151;	//	외출
2082  00a3 a197          	cp	a,#151
2083  00a5 2704          	jreq	L556
2085  00a7 a110          	cp	a,#16
2086  00a9 260c          	jrne	L356
2087  00ab               L556:
2090  00ab 35970000      	mov	__dsCount,#151
2092  00af               L526:
2093                     ; 482 			disp_status_loop_init();
2095  00af 8d000000      	callf	f_disp_status_loop_init
2098  00b3 ac6c0a6c      	jra	L3731
2099  00b7               L356:
2100                     ; 476 			else if( __sUp == 152 )	_dsCount = 152;	//	온수
2102  00b7 a198          	cp	a,#152
2103  00b9 2606          	jrne	L166
2106  00bb 35980000      	mov	__dsCount,#152
2108  00bf 20ee          	jra	L526
2109  00c1               L166:
2110                     ; 477 			else if( __sUp == 153 )	_dsCount = 153;	//	난방
2112  00c1 a199          	cp	a,#153
2113  00c3 2606          	jrne	L566
2116  00c5 35990000      	mov	__dsCount,#153
2118  00c9 20e4          	jra	L526
2119  00cb               L566:
2120                     ; 478 			else if( __sUp == 154 || __sUp == 1 )	_dsCount = 154;	//	예약
2122  00cb a19a          	cp	a,#154
2123  00cd 2704          	jreq	L376
2125  00cf a101          	cp	a,#1
2126  00d1 2606          	jrne	L176
2127  00d3               L376:
2130  00d3 359a0000      	mov	__dsCount,#154
2132  00d7 20d6          	jra	L526
2133  00d9               L176:
2134                     ; 479 			else if( __sUp == 155 || __sUp == 2 )	_dsCount = 155;	//	타이머
2136  00d9 a19b          	cp	a,#155
2137  00db 2704          	jreq	L107
2139  00dd a102          	cp	a,#2
2140  00df 2606          	jrne	L776
2141  00e1               L107:
2144  00e1 359b0000      	mov	__dsCount,#155
2146  00e5 20c8          	jra	L526
2147  00e7               L776:
2148                     ; 481 				_dsCount = 1;
2150  00e7 35010000      	mov	__dsCount,#1
2151  00eb 20c2          	jra	L526
2152  00ed               L126:
2153                     ; 486 		else if( _dsCount == 16 )			//	OUT
2155  00ed a110          	cp	a,#16
2156  00ef 260c          	jrne	L707
2157                     ; 499 			_GOTO(151);
2159  00f1 35970000      	mov	___sUp,#151
2162  00f5 350a0000      	mov	__dsCount,#10
2165  00f9 ac6c0a6c      	jra	L3731
2166  00fd               L707:
2167                     ; 501 		else if( _dsCount == 15 )			//	N/Out
2169  00fd a10f          	cp	a,#15
2170  00ff 2659          	jrne	L317
2171                     ; 503 			if( key==1 )		_GOTO(151)	//	To OUT
2173  0101 7b03          	ld	a,(OFST+1,sp)
2174  0103 a101          	cp	a,#1
2175  0105 260a          	jrne	L517
2178  0107 35970000      	mov	___sUp,#151
2181  010b 350a0000      	mov	__dsCount,#10
2183  010f 2032          	jra	L717
2184  0111               L517:
2185                     ; 504 			else if( key==2 )	{ _NOT_KEY_ }	//	
2187  0111 a102          	cp	a,#2
2188  0113 272e          	jreq	L717
2191                     ; 505 			else if( key==4 ) _GOTO(152)		//	MODE	
2193  0115 a104          	cp	a,#4
2194  0117 260a          	jrne	L527
2197  0119 35980000      	mov	___sUp,#152
2200  011d 350a0000      	mov	__dsCount,#10
2202  0121 2020          	jra	L717
2203  0123               L527:
2204                     ; 506 			else if( key==8 )	_GOTO(101)	//	REMOTE
2206  0123 a108          	cp	a,#8
2207  0125 260a          	jrne	L137
2210  0127 35650000      	mov	___sUp,#101
2213  012b 350a0000      	mov	__dsCount,#10
2215  012f 2012          	jra	L717
2216  0131               L137:
2217                     ; 507 			else if( key==16 )	_DN
2219  0131 a110          	cp	a,#16
2220  0133 2606          	jrne	L537
2223  0135 35400000      	mov	_uiInfo,#64
2225  0139 2008          	jra	L717
2226  013b               L537:
2227                     ; 508 			else if( key==32 )	_UP				
2229  013b a120          	cp	a,#32
2230  013d 2604          	jrne	L717
2233  013f 35010000      	mov	_uiInfo,#1
2234  0143               L717:
2235                     ; 509 			_disp_temp = 1;
2237  0143 35010000      	mov	__disp_temp,#1
2238                     ; 510 			i = disp_status_loop_host_N(key);
2240  0147 7b03          	ld	a,(OFST+1,sp)
2241  0149 8d000000      	callf	f_disp_status_loop_host_N
2243  014d 6b02          	ld	(OFST+0,sp),a
2244                     ; 511 			if( i==1 )
2246  014f 4a            	dec	a
2247  0150 26a7          	jrne	L3731
2248                     ; 512 				_key_blink = 1;
2250  0152 35010008      	mov	__key_blink,#1
2251  0156 ac6c0a6c      	jra	L3731
2252  015a               L317:
2253                     ; 514 		else if( _dsCount == 151 )			//	OUT/Nan
2255  015a a197          	cp	a,#151
2256  015c 263d          	jrne	L747
2257                     ; 518 			if( key==1 )		_GOTO(0)	//	To Nan	
2259  015e 7b03          	ld	a,(OFST+1,sp)
2260  0160 a101          	cp	a,#1
2261  0162 2606          	jrne	L157
2264  0164 725f0000      	clr	___sUp
2267  0168 2016          	jpf	LC005
2268  016a               L157:
2269                     ; 519 			else if( key==2 )	{ _NOT_KEY_ }	//	
2271  016a a102          	cp	a,#2
2272  016c 2716          	jreq	L567
2275                     ; 520 			else if( key==4 )	_GOTO(/*2*/154)	//	MODE
2277  016e a104          	cp	a,#4
2278  0170 2606          	jrne	L167
2281  0172 359a0000      	mov	___sUp,#154
2284  0176 2008          	jpf	LC005
2285  0178               L167:
2286                     ; 521 			else if( key==8 )	_GOTO(101)	//	REMOTE
2288  0178 a108          	cp	a,#8
2289  017a 2608          	jrne	L567
2292  017c 35650000      	mov	___sUp,#101
2295  0180               LC005:
2298  0180 350a0000      	mov	__dsCount,#10
2300  0184               L567:
2301                     ; 522 			else if( key==16 )	{ _NOT_DEF_; }	//	DN
2306                     ; 523 			else if( key==32 )	{ _NOT_DEF_; }	//	UP
2310                     ; 524 			_disp_temp = 1;
2312  0184 35010000      	mov	__disp_temp,#1
2313                     ; 525 			i = disp_status_loop_host_N2OUT(key);
2315  0188 7b03          	ld	a,(OFST+1,sp)
2316  018a 8d000000      	callf	f_disp_status_loop_host_N2OUT
2318  018e 6b02          	ld	(OFST+0,sp),a
2319                     ; 526 			if( i==1 )
2321  0190 4a            	dec	a
2322  0191 26c3          	jrne	L3731
2323                     ; 527 				_key_blink = 1;
2325  0193 35010008      	mov	__key_blink,#1
2326  0197 ac6c0a6c      	jra	L3731
2327  019b               L747:
2328                     ; 529 		else if( _dsCount == 152 )			//	MODE_1
2330  019b a198          	cp	a,#152
2331  019d 2617          	jrne	L3001
2332                     ; 531 			if(uiInfo.cntlMode == 0 )	
2334  019f c60003        	ld	a,_uiInfo+3
2335  01a2 2606          	jrne	L5001
2336                     ; 534 				_GOTO(153);
2338  01a4 35990000      	mov	___sUp,#153
2340                     ; 535 				return;
2343  01a8 2019          	jpf	LC006
2344  01aa               L5001:
2345                     ; 538 			__s = 2;
2347  01aa 35020000      	mov	___s,#2
2348                     ; 539 			_dsCount = 0;
2350  01ae 725f0000      	clr	__dsCount
2352  01b2 ac6c0a6c      	jra	L3731
2353  01b6               L3001:
2354                     ; 541 		else if( _dsCount == 153 )			//	MODE_2
2356  01b6 a199          	cp	a,#153
2357  01b8 261c          	jrne	L1101
2358                     ; 543 			if(uiInfo.cntlMode == 0 )	
2360  01ba c60003        	ld	a,_uiInfo+3
2361  01bd 260b          	jrne	L3101
2362                     ; 546 				_GOTO(154);
2364  01bf 359a0000      	mov	___sUp,#154
2367  01c3               LC006:
2369  01c3 350a0000      	mov	__dsCount,#10
2370                     ; 547 				return;
2371  01c7               L434:
2375  01c7 5b03          	addw	sp,#3
2376  01c9 87            	retf	
2377  01ca               L3101:
2378                     ; 550 			__s = 1;
2380  01ca 35010000      	mov	___s,#1
2381                     ; 551 			_dsCount = 0;
2383  01ce 725f0000      	clr	__dsCount
2385  01d2 ac6c0a6c      	jra	L3731
2386  01d6               L1101:
2387                     ; 553 		else if( _dsCount == 154 )			//	MODE_4
2389  01d6 a19a          	cp	a,#154
2390  01d8 2655          	jrne	L7101
2391                     ; 556 			if( key==1 )		_GOTO(0)	//	To Nan	
2393  01da 7b03          	ld	a,(OFST+1,sp)
2394  01dc a101          	cp	a,#1
2395  01de 260a          	jrne	L1201
2398  01e0 725f0000      	clr	___sUp
2401  01e4 350a0000      	mov	__dsCount,#10
2403  01e8 2032          	jra	L3201
2404  01ea               L1201:
2405                     ; 557 			else if( key==2 )	{ _NOT_KEY_ }	//	
2407  01ea a102          	cp	a,#2
2408  01ec 272e          	jreq	L3201
2411                     ; 558 			else if( key==4 )	_GOTO(155)	//	MODE_5
2413  01ee a104          	cp	a,#4
2414  01f0 260a          	jrne	L1301
2417  01f2 359b0000      	mov	___sUp,#155
2420  01f6 350a0000      	mov	__dsCount,#10
2422  01fa 2020          	jra	L3201
2423  01fc               L1301:
2424                     ; 559 			else if( key==8 )	_GOTO(101)	//	REMOTE
2426  01fc a108          	cp	a,#8
2427  01fe 260a          	jrne	L5301
2430  0200 35650000      	mov	___sUp,#101
2433  0204 350a0000      	mov	__dsCount,#10
2435  0208 2012          	jra	L3201
2436  020a               L5301:
2437                     ; 560 			else if( key==16 )	_DN
2439  020a a110          	cp	a,#16
2440  020c 2606          	jrne	L1401
2443  020e 35400000      	mov	_uiInfo,#64
2445  0212 2008          	jra	L3201
2446  0214               L1401:
2447                     ; 561 			else if( key==32 )	_UP
2449  0214 a120          	cp	a,#32
2450  0216 2604          	jrne	L3201
2453  0218 35010000      	mov	_uiInfo,#1
2454  021c               L3201:
2455                     ; 563 			i = disp_status_loop_host_Y(key);
2457  021c 7b03          	ld	a,(OFST+1,sp)
2458  021e 8d000000      	callf	f_disp_status_loop_host_Y
2460  0222 6b02          	ld	(OFST+0,sp),a
2461                     ; 564 			if( i==1 )
2463  0224 4a            	dec	a
2464  0225 26ab          	jrne	L3731
2465                     ; 565 				_key_blink = 1;
2467  0227 35010008      	mov	__key_blink,#1
2468  022b ac6c0a6c      	jra	L3731
2469  022f               L7101:
2470                     ; 567 		else if( _dsCount == 155 )			//	MODE_5
2472  022f a19b          	cp	a,#155
2473  0231 2655          	jrne	L3501
2474                     ; 570 			if( key==1 )		_GOTO(0)	//	To Nan	
2476  0233 7b03          	ld	a,(OFST+1,sp)
2477  0235 a101          	cp	a,#1
2478  0237 260a          	jrne	L5501
2481  0239 725f0000      	clr	___sUp
2484  023d 350a0000      	mov	__dsCount,#10
2486  0241 2032          	jra	L7501
2487  0243               L5501:
2488                     ; 571 			else if( key==2 )	{ _NOT_KEY_ }	//	
2490  0243 a102          	cp	a,#2
2491  0245 272e          	jreq	L7501
2494                     ; 572 			else if( key==4 )	_GOTO(0)	//	To Nan
2496  0247 a104          	cp	a,#4
2497  0249 260a          	jrne	L5601
2500  024b 725f0000      	clr	___sUp
2503  024f 350a0000      	mov	__dsCount,#10
2505  0253 2020          	jra	L7501
2506  0255               L5601:
2507                     ; 573 			else if( key==8 )	_GOTO(101)	//	REMOTE
2509  0255 a108          	cp	a,#8
2510  0257 260a          	jrne	L1701
2513  0259 35650000      	mov	___sUp,#101
2516  025d 350a0000      	mov	__dsCount,#10
2518  0261 2012          	jra	L7501
2519  0263               L1701:
2520                     ; 574 			else if( key==16 )	_DN
2522  0263 a110          	cp	a,#16
2523  0265 2606          	jrne	L5701
2526  0267 35400000      	mov	_uiInfo,#64
2528  026b 2008          	jra	L7501
2529  026d               L5701:
2530                     ; 575 			else if( key==32 )	_UP
2532  026d a120          	cp	a,#32
2533  026f 2604          	jrne	L7501
2536  0271 35010000      	mov	_uiInfo,#1
2537  0275               L7501:
2538                     ; 577 			i = disp_status_loop_host_B(key);
2540  0275 7b03          	ld	a,(OFST+1,sp)
2541  0277 8d000000      	callf	f_disp_status_loop_host_B
2543  027b 6b02          	ld	(OFST+0,sp),a
2544                     ; 578 			if( i==1 )
2546  027d 4a            	dec	a
2547  027e 26ab          	jrne	L3731
2548                     ; 579 				_key_blink = 1;
2550  0280 35010008      	mov	__key_blink,#1
2551  0284 ac6c0a6c      	jra	L3731
2552  0288               L3501:
2553                     ; 608 		else if( _dsCount == 25 )			//	B
2555  0288 a119          	cp	a,#25
2556  028a 2667          	jrne	L7011
2557                     ; 610 			if( key==1 )		_GOTO(101)	//	Y
2559  028c 7b03          	ld	a,(OFST+1,sp)
2560  028e a101          	cp	a,#1
2561  0290 260a          	jrne	L1111
2564  0292 35650000      	mov	___sUp,#101
2567  0296 350a0000      	mov	__dsCount,#10
2569  029a 2040          	jra	L3111
2570  029c               L1111:
2571                     ; 611 			else if( key==2 )	
2573  029c a102          	cp	a,#2
2574  029e 260e          	jrne	L5111
2575                     ; 613 				__sDn = 0;
2577  02a0 725f0000      	clr	___sDn
2578                     ; 614 				_GOTO(1)	//	Y
2580  02a4 35010000      	mov	___sUp,#1
2583  02a8 350a0000      	mov	__dsCount,#10
2585  02ac 202e          	jra	L3111
2586  02ae               L5111:
2587                     ; 616 			else if( key==4 )	_GOTO(0)	//	N
2589  02ae a104          	cp	a,#4
2590  02b0 260a          	jrne	L1211
2593  02b2 725f0000      	clr	___sUp
2596  02b6 350a0000      	mov	__dsCount,#10
2598  02ba 2020          	jra	L3111
2599  02bc               L1211:
2600                     ; 617 			else if( key==8 )	_GOTO(5)	//	Off
2602  02bc a108          	cp	a,#8
2603  02be 260a          	jrne	L5211
2606  02c0 35050000      	mov	___sUp,#5
2609  02c4 350a0000      	mov	__dsCount,#10
2611  02c8 2012          	jra	L3111
2612  02ca               L5211:
2613                     ; 618 			else if( key==16 )	_DN
2615  02ca a110          	cp	a,#16
2616  02cc 2606          	jrne	L1311
2619  02ce 35400000      	mov	_uiInfo,#64
2621  02d2 2008          	jra	L3111
2622  02d4               L1311:
2623                     ; 619 			else if( key==32 )	_UP
2625  02d4 a120          	cp	a,#32
2626  02d6 2604          	jrne	L3111
2629  02d8 35010000      	mov	_uiInfo,#1
2630  02dc               L3111:
2631                     ; 623 			_disp_temp = 1;
2633  02dc 35010000      	mov	__disp_temp,#1
2634                     ; 624 			i = disp_status_loop_host_B(key);
2636  02e0 7b03          	ld	a,(OFST+1,sp)
2637  02e2 8d000000      	callf	f_disp_status_loop_host_B
2639  02e6 6b02          	ld	(OFST+0,sp),a
2640                     ; 625 			if( i==1 )
2642  02e8 4a            	dec	a
2643  02e9 2699          	jrne	L3731
2644                     ; 626 				_key_blink = 1;
2646  02eb 35010008      	mov	__key_blink,#1
2647  02ef ac6c0a6c      	jra	L3731
2648  02f3               L7011:
2649                     ; 628 		else if( _dsCount == 35 )			//	Y
2651  02f3 a123          	cp	a,#35
2652  02f5 2667          	jrne	L3411
2653                     ; 630 			if( key==1 )		_GOTO(101)	//	N
2655  02f7 7b03          	ld	a,(OFST+1,sp)
2656  02f9 a101          	cp	a,#1
2657  02fb 260a          	jrne	L5411
2660  02fd 35650000      	mov	___sUp,#101
2663  0301 350a0000      	mov	__dsCount,#10
2665  0305 2040          	jra	L7411
2666  0307               L5411:
2667                     ; 631 			else if( key==2 )	
2669  0307 a102          	cp	a,#2
2670  0309 260e          	jrne	L1511
2671                     ; 633 				__sDn = 1;
2673  030b 35010000      	mov	___sDn,#1
2674                     ; 634 				_GOTO(2)	//	B
2676  030f 35020000      	mov	___sUp,#2
2679  0313 350a0000      	mov	__dsCount,#10
2681  0317 202e          	jra	L7411
2682  0319               L1511:
2683                     ; 636 			else if( key==4 )	_GOTO(0)	//	N
2685  0319 a104          	cp	a,#4
2686  031b 260a          	jrne	L5511
2689  031d 725f0000      	clr	___sUp
2692  0321 350a0000      	mov	__dsCount,#10
2694  0325 2020          	jra	L7411
2695  0327               L5511:
2696                     ; 637 			else if( key==8 )	_GOTO(5)	//	Off
2698  0327 a108          	cp	a,#8
2699  0329 260a          	jrne	L1611
2702  032b 35050000      	mov	___sUp,#5
2705  032f 350a0000      	mov	__dsCount,#10
2707  0333 2012          	jra	L7411
2708  0335               L1611:
2709                     ; 638 			else if( key==16 )	_DN
2711  0335 a110          	cp	a,#16
2712  0337 2606          	jrne	L5611
2715  0339 35400000      	mov	_uiInfo,#64
2717  033d 2008          	jra	L7411
2718  033f               L5611:
2719                     ; 639 			else if( key==32 )	_UP
2721  033f a120          	cp	a,#32
2722  0341 2604          	jrne	L7411
2725  0343 35010000      	mov	_uiInfo,#1
2726  0347               L7411:
2727                     ; 640 			_disp_temp = 1;
2729  0347 35010000      	mov	__disp_temp,#1
2730                     ; 641 			i = disp_status_loop_host_Y(key);
2732  034b 7b03          	ld	a,(OFST+1,sp)
2733  034d 8d000000      	callf	f_disp_status_loop_host_Y
2735  0351 6b02          	ld	(OFST+0,sp),a
2736                     ; 642 			if( i==1 )
2738  0353 4a            	dec	a
2739  0354 2699          	jrne	L3731
2740                     ; 643 				_key_blink = 1;
2742  0356 35010008      	mov	__key_blink,#1
2743  035a ac6c0a6c      	jra	L3731
2744  035e               L3411:
2745                     ; 645 		else if( _dsCount == 45 )			//	OFF
2747  035e a12d          	cp	a,#45
2748  0360 2704ace203e2  	jrne	L7711
2749                     ; 647 			if (_key_time_event[0] == 0) 
2751  0366 c60000        	ld	a,__key_time_event
2752  0369 260e          	jrne	L1021
2753                     ; 649 				_key_time_event[0] = 1;
2755  036b 35010000      	mov	__key_time_event,#1
2756                     ; 650 				_key_time_event[1] = __timer1s;
2758  036f 5500000001    	mov	__key_time_event+1,___timer1s
2759                     ; 651 				_key_time_event[2] = 0;
2761  0374 c70002        	ld	__key_time_event+2,a
2763  0377 201f          	jra	L3021
2764  0379               L1021:
2765                     ; 653 			else if (_key_time_event[0] == 1)
2767  0379 4a            	dec	a
2768  037a 261c          	jrne	L3021
2769                     ; 655 				if (_key_time_event[1] != __timer1s) {
2771  037c c60001        	ld	a,__key_time_event+1
2772  037f c10000        	cp	a,___timer1s
2773  0382 2709          	jreq	L7021
2774                     ; 656 					_key_time_event[1] = __timer1s;
2776  0384 5500000001    	mov	__key_time_event+1,___timer1s
2777                     ; 657 					_key_time_event[2]++;
2779  0389 725c0002      	inc	__key_time_event+2
2780  038d               L7021:
2781                     ; 660 				if (_key_time_event[2] == 10) {
2783  038d c60002        	ld	a,__key_time_event+2
2784  0390 a10a          	cp	a,#10
2785  0392 2604          	jrne	L3021
2786                     ; 661 					_key_time_event[0] = 2;
2788  0394 35020000      	mov	__key_time_event,#2
2789  0398               L3021:
2790                     ; 666 			if( key==1 )		_GOTO(101)	//	TBD
2792  0398 7b03          	ld	a,(OFST+1,sp)
2793  039a a101          	cp	a,#1
2794  039c 2606          	jrne	L3121
2797  039e 35650000      	mov	___sUp,#101
2800  03a2 2023          	jpf	LC007
2801  03a4               L3121:
2802                     ; 667 			else if( key==2 )	_GOTO(1)	//	Y
2804  03a4 a102          	cp	a,#2
2805  03a6 2606          	jrne	L7121
2808  03a8 35010000      	mov	___sUp,#1
2811  03ac 2019          	jpf	LC007
2812  03ae               L7121:
2813                     ; 668 			else if( key==4 )	_GOTO(0)	//	N
2815  03ae a104          	cp	a,#4
2816  03b0 2606          	jrne	L3221
2819  03b2               LC008:
2821  03b2 725f0000      	clr	___sUp
2824  03b6 200f          	jpf	LC007
2825  03b8               L3221:
2826                     ; 669 			else if( key==8 )	
2828  03b8 a108          	cp	a,#8
2829  03ba 260f          	jrne	L5121
2830                     ; 671 				if (_key_time_event[0] == 2) 
2832  03bc c60000        	ld	a,__key_time_event
2833  03bf a102          	cp	a,#2
2834                     ; 673 					 _GOTO(0)				//	on
2837  03c1 27ef          	jreq	LC008
2838                     ; 677 					_GOTO(20)       // 	setting
2840  03c3 35140000      	mov	___sUp,#20
2843  03c7               LC007:
2848  03c7 350a0000      	mov	__dsCount,#10
2849  03cb               L5121:
2850                     ; 680 			_disp_temp = 1;
2852  03cb 35010000      	mov	__disp_temp,#1
2853                     ; 681 			i = disp_status_loop_host_Off(key);
2855  03cf 7b03          	ld	a,(OFST+1,sp)
2856  03d1 8d000000      	callf	f_disp_status_loop_host_Off
2858  03d5 6b02          	ld	(OFST+0,sp),a
2859                     ; 682 			if( i==1 )
2861  03d7 4a            	dec	a
2862  03d8 2680          	jrne	L3731
2863                     ; 683 				_key_blink = 1;
2865  03da 35010008      	mov	__key_blink,#1
2866  03de ac6c0a6c      	jra	L3731
2867  03e2               L7711:
2868                     ; 685 		else if( _dsCount == 11 )
2870  03e2 a10b          	cp	a,#11
2871  03e4 261b          	jrne	L1421
2872                     ; 687 			_dsCount = 2;
2874  03e6 35020000      	mov	__dsCount,#2
2875                     ; 688 			__sUp = 0xff;
2877  03ea 35ff0000      	mov	___sUp,#255
2878                     ; 689 			disp_status_loop_init();
2880  03ee 8d000000      	callf	f_disp_status_loop_init
2882                     ; 690 			disp_status_loop_messageDn(__sDn);
2884  03f2 c60000        	ld	a,___sDn
2885  03f5 8d000000      	callf	f_disp_status_loop_messageDn
2887                     ; 691 			disp_status_curr_only();
2889  03f9 8d000000      	callf	f_disp_status_curr_only
2892  03fd ac6c0a6c      	jra	L3731
2893  0401               L1421:
2894                     ; 693 		else if( _dsCount == 1 )
2896  0401 a101          	cp	a,#1
2897  0403 2704ac1c051c  	jrne	L5421
2898                     ; 698 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
2900  0409 c60000        	ld	a,___sUp
2901  040c 2608          	jrne	L7421
2904  040e 7b03          	ld	a,(OFST+1,sp)
2905  0410 8d000000      	callf	f_disp_status_loop_host_N
2908  0414 2016          	jpf	LC009
2909  0416               L7421:
2910                     ; 699 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
2912  0416 a101          	cp	a,#1
2913  0418 2608          	jrne	L3521
2916  041a 7b03          	ld	a,(OFST+1,sp)
2917  041c 8d000000      	callf	f_disp_status_loop_host_Y
2920  0420 200a          	jpf	LC009
2921  0422               L3521:
2922                     ; 700 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
2924  0422 a102          	cp	a,#2
2925  0424 2608          	jrne	L1521
2928  0426 7b03          	ld	a,(OFST+1,sp)
2929  0428 8d000000      	callf	f_disp_status_loop_host_B
2931  042c               LC009:
2932  042c 6b02          	ld	(OFST+0,sp),a
2933  042e               L1521:
2934                     ; 702 			if( i==1 )
2936  042e 7b02          	ld	a,(OFST+0,sp)
2937  0430 4a            	dec	a
2938  0431 2604          	jrne	L1621
2939                     ; 703 				_key_blink = 1;
2941  0433 4c            	inc	a
2942  0434 c70008        	ld	__key_blink,a
2943  0437               L1621:
2944                     ; 706 			_disp_temp = __sUp==0 ? 1 : 0;
2946  0437 c60000        	ld	a,___sUp
2947  043a 2603          	jrne	L422
2948  043c 4c            	inc	a
2949  043d 2001          	jra	L622
2950  043f               L422:
2951  043f 4f            	clr	a
2952  0440               L622:
2953  0440 c70000        	ld	__disp_temp,a
2954                     ; 707 			if( _disp_temp == 0 && _key_blink == 0 )
2956  0443 261c          	jrne	L3621
2958  0445 c60008        	ld	a,__key_blink
2959  0448 2617          	jrne	L3621
2960                     ; 709 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
2962  044a c60000        	ld	a,___sUp
2963  044d a101          	cp	a,#1
2964  044f 270c          	jreq	L7621
2966  0451 a102          	cp	a,#2
2967  0453 2708          	jreq	L7621
2969  0455 a105          	cp	a,#5
2970  0457 2704          	jreq	L7621
2972  0459 a108          	cp	a,#8
2973  045b 2604          	jrne	L3621
2974  045d               L7621:
2975                     ; 710 					_disp_temp = 1;
2977  045d 35010000      	mov	__disp_temp,#1
2978  0461               L3621:
2979                     ; 713 			if( key == 1 )
2981  0461 7b03          	ld	a,(OFST+1,sp)
2982  0463 a101          	cp	a,#1
2983  0465 2612          	jrne	L5721
2984                     ; 715 				__sUp = (__sUp+1) % 3;
2986  0467 c60000        	ld	a,___sUp
2987  046a 5f            	clrw	x
2988  046b 97            	ld	xl,a
2989  046c 5c            	incw	x
2990  046d a603          	ld	a,#3
2991  046f 8d000000      	callf	d_smodx
2993  0473 01            	rrwa	x,a
2994  0474 c70000        	ld	___sUp,a
2995  0477 2074          	jra	L125
2996  0479               L5721:
2997                     ; 726 			else if( key == 2 )
2999  0479 a102          	cp	a,#2
3000  047b 261f          	jrne	L1031
3001                     ; 728 				__sUp = 0xff;
3003  047d 35ff0000      	mov	___sUp,#255
3004                     ; 729 				__sDn = 0;
3006  0481 725f0000      	clr	___sDn
3007                     ; 730 				disp_status_loop_messageDn(__sDn);
3009  0485 4f            	clr	a
3010  0486 8d000000      	callf	f_disp_status_loop_messageDn
3012                     ; 731 				disp_status_curr_only();
3014  048a 8d000000      	callf	f_disp_status_curr_only
3016                     ; 732 				lcd_blink_clear();
3018  048e 8d000000      	callf	f_lcd_blink_clear
3020                     ; 733 				_dsCount = 2;
3022  0492 35020000      	mov	__dsCount,#2
3023                     ; 734 				_dsPrev = 0xff;
3025  0496 35ff0000      	mov	__dsPrev,#255
3026                     ; 736 				_key_blink = 0;
3028  049a 201e          	jpf	LC010
3029  049c               L1031:
3030                     ; 738 			else if( key == 3 )
3032  049c a103          	cp	a,#3
3033  049e 2664          	jrne	L5031
3034                     ; 740 				if( __sUp == 0 )
3036  04a0 c60000        	ld	a,___sUp
3037  04a3 263a          	jrne	L7031
3038                     ; 742 					if( _key_blink == 0 )
3040  04a5 c60008        	ld	a,__key_blink
3041  04a8 260c          	jrne	L7131
3042  04aa ac520552      	jra	L325
3043  04ae               L3131:
3044                     ; 748 							__s = 1;
3046  04ae 35010000      	mov	___s,#1
3047  04b2               L5131:
3048                     ; 749 						_dsCount = 0;
3050  04b2 725f0000      	clr	__dsCount
3051  04b6               L7131:
3052                     ; 762 				disp_status_loop_init();
3055  04b6 8d000000      	callf	f_disp_status_loop_init
3057                     ; 764 				_key_blink = 0;
3059  04ba               LC010:
3062  04ba 725f0008      	clr	__key_blink
3064  04be               L7721:
3065                     ; 781 			if( _key_blink == 1 )
3067  04be c60008        	ld	a,__key_blink
3068  04c1 4a            	dec	a
3069  04c2 2704ac6c0a6c  	jrne	L3731
3070                     ; 783 				if( _key_sec >= KEY_BLINK_FADE )
3072  04c8 c60000        	ld	a,__key_sec
3073  04cb a10a          	cp	a,#10
3074  04cd 25f5          	jrult	L3731
3075                     ; 786 					lcd_blink_clear();
3077  04cf 8d000000      	callf	f_lcd_blink_clear
3079                     ; 787 					_key_blink = 0;
3081  04d3 725f0008      	clr	__key_blink
3082                     ; 788 					_dsCount = 10;
3084  04d7 350a0000      	mov	__dsCount,#10
3085  04db ac6c0a6c      	jra	L3731
3086  04df               L7031:
3087                     ; 752 				else if( __sUp == 1 )	
3089  04df a101          	cp	a,#1
3090                     ; 754 					if( _key_blink != 1 )
3091                     ; 755 						goto SetupEntry2;
3093  04e1 2704          	jreq	LC012
3094                     ; 757 				else if( __sUp == 2 )	
3096  04e3 a102          	cp	a,#2
3097  04e5 26cf          	jrne	L7131
3098                     ; 759 					if( _key_blink != 1 )
3100  04e7               LC012:
3102  04e7 c60008        	ld	a,__key_blink
3103  04ea 4a            	dec	a
3104  04eb 27c9          	jreq	L7131
3105                     ; 760 						goto SetupEntry2;
3106  04ed               L125:
3107                     ; 716 SetupEntry2:				
3107                     ; 717 //				if( __sUp == 0 )		i = bS6;
3107                     ; 718 //				else if( __sUp == 1 )	i = bS7;
3107                     ; 719 //				else					i = bS8;
3107                     ; 720 				lcd_blink_item(i);
3109  04ed 7b02          	ld	a,(OFST+0,sp)
3110  04ef 8d000000      	callf	f_lcd_blink_item
3112                     ; 721 				disp_status_loop_message(__sUp);
3114  04f3 c60000        	ld	a,___sUp
3115  04f6 8d000000      	callf	f_disp_status_loop_message
3117                     ; 722 				_dsPrev = 0xff;
3119  04fa 35ff0000      	mov	__dsPrev,#255
3120                     ; 724 				_key_blink = 1;
3122  04fe 35010008      	mov	__key_blink,#1
3124  0502 20ba          	jra	L7721
3125  0504               L5031:
3126                     ; 766 			else if( key == 4 )
3128  0504 a104          	cp	a,#4
3129  0506 26b6          	jrne	L7721
3130                     ; 768 				if( _key_blink == 1 )
3132  0508 c60008        	ld	a,__key_blink
3133  050b 4a            	dec	a
3134                     ; 771 					disp_status_loop_init();
3136                     ; 772 					_key_blink = 0;
3138  050c 27a8          	jreq	L7131
3139                     ; 776 					__s = 3;
3141  050e 35030000      	mov	___s,#3
3142                     ; 777 					_dsCount = 0;
3144  0512 725f0000      	clr	__dsCount
3145                     ; 778 					_dsPrev = 0xff;
3147  0516 35ff0000      	mov	__dsPrev,#255
3148  051a 20a2          	jra	L7721
3149  051c               L5421:
3150                     ; 792 		else if( _dsCount == 2 )
3152  051c a102          	cp	a,#2
3153  051e 26bb          	jrne	L3731
3154                     ; 794 			_disp_temp = 1;
3156  0520 35010000      	mov	__disp_temp,#1
3157                     ; 795 			if( key == 1 )
3159  0524 7b03          	ld	a,(OFST+1,sp)
3160  0526 a101          	cp	a,#1
3161  0528 260a          	jrne	L3531
3162                     ; 797 				__sUp = 0;
3164  052a 725f0000      	clr	___sUp
3165                     ; 798 				_dsCount = 0;
3167  052e 725f0000      	clr	__dsCount
3169  0532 202f          	jra	L3631
3170  0534               L3531:
3171                     ; 800 			else if( key == 2 )
3173  0534 a102          	cp	a,#2
3174  0536 2616          	jrne	L7531
3175                     ; 802 				__sDn = __sDn==0 ? 1 : 0;
3177  0538 c60000        	ld	a,___sDn
3178  053b 2603          	jrne	L052
3179  053d 4c            	inc	a
3180  053e 2001          	jra	L252
3181  0540               L052:
3182  0540 4f            	clr	a
3183  0541               L252:
3184  0541 c70000        	ld	___sDn,a
3185                     ; 803 				disp_status_loop_messageDn(__sDn);
3187  0544 8d000000      	callf	f_disp_status_loop_messageDn
3189                     ; 804 				disp_status_curr_only();
3191  0548 8d000000      	callf	f_disp_status_curr_only
3194  054c 2015          	jra	L3631
3195  054e               L7531:
3196                     ; 806 			else if( key == 3 )	{	goto SetupEntry;	}
3198  054e a103          	cp	a,#3
3199  0550 2611          	jrne	L3631
3201  0552               L325:
3202                     ; 744 SetupEntry:				
3202                     ; 745 						if( uiInfo.cntlMode == 0 )
3204  0552 c60003        	ld	a,_uiInfo+3
3205  0555 2704acae04ae  	jrne	L3131
3206                     ; 746 							__s = 4;
3208  055b 35040000      	mov	___s,#4
3210  055f acb204b2      	jra	L5131
3211  0563               L3631:
3212                     ; 807 			else if( key == 4 )
3214                     ; 810 			if( uiInfo.enc != 0 )
3216  0563 c60000        	ld	a,_uiInfo
3217  0566 2604ac6c0a6c  	jreq	L3731
3218                     ; 812 				__sUp = 0;
3220  056c 725f0000      	clr	___sUp
3221                     ; 813 				_dsCount = 0;
3223  0570 725f0000      	clr	__dsCount
3224  0574 ac6c0a6c      	jra	L3731
3225  0578               L506:
3226                     ; 817 	else if( __s == 1 ) // 설정 난방수 모드
3228  0578 a101          	cp	a,#1
3229  057a 2704ac500650  	jrne	L5731
3230                     ; 820 		if( _dsCount == 0 )
3232  0580 c60000        	ld	a,__dsCount
3233  0583 2630          	jrne	L7731
3234                     ; 822 			lcd_clear(0);
3236  0585 8d000000      	callf	f_lcd_clear
3238                     ; 823 			__sInfo = 1;
3240  0589 35010000      	mov	___sInfo,#1
3241                     ; 824 			lcd_disp_info(__sInfo, 0, 0);
3243  058d 4b00          	push	#0
3244  058f ae0100        	ldw	x,#256
3245  0592 8d000000      	callf	f_lcd_disp_info
3247  0596 84            	pop	a
3248                     ; 825 			UI_DISP_2Digit(_boiler_water_heat);
3250  0597 c60002        	ld	a,__boiler_water_heat
3251  059a 8db00ab0      	callf	LC024
3255  059e c60002        	ld	a,__boiler_water_heat
3256  05a1 8da30aa3      	callf	LC023
3258                     ; 827 			lcd_disp_info_shower(0x08, 0);
3261  05a5 ae0800        	ldw	x,#2048
3262  05a8 8dc80ac8      	callf	LC027
3263                     ; 830 			uiInfo._t = _boiler_water_heat;
3265  05ac 550002005f    	mov	_uiInfo+95,__boiler_water_heat
3267  05b1 ac6c0a6c      	jra	L3731
3268  05b5               L7731:
3269                     ; 832 		else if( _dsCount == 251 )
3271  05b5 a1fb          	cp	a,#251
3272  05b7 2729          	jreq	L525
3273                     ; 842 		else if( _dsCount == 1 )
3275  05b9 4a            	dec	a
3276  05ba 26f5          	jrne	L3731
3277                     ; 844 			if( key==1 )
3279  05bc 7b03          	ld	a,(OFST+1,sp)
3280  05be a101          	cp	a,#1
3281  05c0 2606          	jrne	L3141
3282                     ; 846 				_GOTO(0)	//	To Nan	
3284  05c2 725f0000      	clr	___sUp
3286                     ; 847 				goto EXIT_1_MAIN;
3288  05c6 2016          	jpf	LC013
3289  05c8               L3141:
3290                     ; 849 			else if( key==2 )	{ _NOT_KEY_ }	//	
3292  05c8 a102          	cp	a,#2
3293  05ca 273d          	jreq	L5141
3296                     ; 850 			else if( key==4 )	
3298  05cc a104          	cp	a,#4
3299  05ce 2606          	jrne	L3241
3300                     ; 852 				_GOTO(154)	//	MODE_2
3302  05d0 359a0000      	mov	___sUp,#154
3304                     ; 853 				goto EXIT_1_MAIN;
3306  05d4 2008          	jpf	LC013
3307  05d6               L3241:
3308                     ; 855 			else if( key==8 )	
3310  05d6 a108          	cp	a,#8
3311  05d8 261d          	jrne	L7241
3312                     ; 857 				_GOTO(1)	//	REMOTE
3314  05da 35010000      	mov	___sUp,#1
3317  05de               LC013:
3320  05de 350a0000      	mov	__dsCount,#10
3321                     ; 858 				goto EXIT_1_MAIN;
3322  05e2               L525:
3323                     ; 834 EXIT_1_MAIN:
3323                     ; 835 			__s = 0;
3325  05e2 725f0000      	clr	___s
3326                     ; 836 			if( _boiler_water_heat != uiInfo._t )
3328  05e6 c60002        	ld	a,__boiler_water_heat
3329  05e9 c1005f        	cp	a,_uiInfo+95
3330  05ec 27c3          	jreq	L3731
3331                     ; 839 				file_update2(0);
3333  05ee 4f            	clr	a
3334  05ef 8d000000      	callf	f_file_update2
3336  05f3 ac6c0a6c      	jra	L3731
3337  05f7               L7241:
3338                     ; 860 			else if( key==16 )	_DN
3340  05f7 a110          	cp	a,#16
3341  05f9 2606          	jrne	L3341
3344  05fb 35400000      	mov	_uiInfo,#64
3346  05ff 2008          	jra	L5141
3347  0601               L3341:
3348                     ; 861 			else if( key==32 )	_UP
3350  0601 a120          	cp	a,#32
3351  0603 2604          	jrne	L5141
3354  0605 35010000      	mov	_uiInfo,#1
3355  0609               L5141:
3356                     ; 863 			i = _boiler_water_heat;
3358  0609 c60002        	ld	a,__boiler_water_heat
3359  060c 6b02          	ld	(OFST+0,sp),a
3360                     ; 864 			if( uiInfo.enc != 0 )
3362  060e c60000        	ld	a,_uiInfo
3363  0611 2723          	jreq	L1441
3364                     ; 866 				ENC_MOVE_0(45,85,5);
3366  0613 a540          	bcp	a,#64
3367  0615 260e          	jrne	L3441
3370  0617 7b02          	ld	a,(OFST+0,sp)
3371  0619 a12e          	cp	a,#46
3372  061b 2404          	jruge	L5441
3375  061d a655          	ld	a,#85
3377  061f 2010          	jra	L1541
3378  0621               L5441:
3381  0621 a005          	sub	a,#5
3382  0623 200c          	jra	L1541
3383  0625               L3441:
3386  0625 7b02          	ld	a,(OFST+0,sp)
3387  0627 a155          	cp	a,#85
3388  0629 2504          	jrult	L3541
3391  062b a62d          	ld	a,#45
3393  062d 2002          	jra	L1541
3394  062f               L3541:
3397  062f ab05          	add	a,#5
3398  0631               L1541:
3399  0631 6b02          	ld	(OFST+0,sp),a
3400                     ; 867 				_boiler_water_heat = i;
3403  0633 c70002        	ld	__boiler_water_heat,a
3404  0636               L1441:
3405                     ; 869 			if( _dsPrev != i )
3407  0636 c60000        	ld	a,__dsPrev
3408  0639 1102          	cp	a,(OFST+0,sp)
3409  063b 27b6          	jreq	L3731
3410                     ; 871 				_dsPrev = i;
3412  063d 7b02          	ld	a,(OFST+0,sp)
3413  063f c70000        	ld	__dsPrev,a
3414                     ; 872 				UI_DISP_2Digit(i);
3416  0642 8db00ab0      	callf	LC024
3420  0646 7b02          	ld	a,(OFST+0,sp)
3421  0648 8da30aa3      	callf	LC023
3424  064c ac6c0a6c      	jra	L3731
3425  0650               L5731:
3426                     ; 882 	else if( __s == 2 ) // 설정 온수 모드
3428  0650 a102          	cp	a,#2
3429  0652 2704ac280728  	jrne	L3641
3430                     ; 885 		if( _dsCount == 0 )
3432  0658 c60000        	ld	a,__dsCount
3433  065b 2630          	jrne	L5641
3434                     ; 887 			lcd_clear(0);
3436  065d 8d000000      	callf	f_lcd_clear
3438                     ; 888 			__sInfo = 2;
3440  0661 35020000      	mov	___sInfo,#2
3441                     ; 889 			lcd_disp_info(__sInfo, 0, 0);
3443  0665 4b00          	push	#0
3444  0667 ae0200        	ldw	x,#512
3445  066a 8d000000      	callf	f_lcd_disp_info
3447  066e 84            	pop	a
3448                     ; 890 			UI_DISP_2Digit(_boiler_water_shower);
3450  066f c60001        	ld	a,__boiler_water_shower
3451  0672 8db00ab0      	callf	LC024
3455  0676 c60001        	ld	a,__boiler_water_shower
3456  0679 8da30aa3      	callf	LC023
3458                     ; 891 			lcd_disp_info_shower(0x80, 0);
3461  067d ae8000        	ldw	x,#32768
3462  0680 8dc80ac8      	callf	LC027
3463                     ; 894 			uiInfo._t = _boiler_water_shower;
3465  0684 550001005f    	mov	_uiInfo+95,__boiler_water_shower
3467  0689 ac6c0a6c      	jra	L3731
3468  068d               L5641:
3469                     ; 896 		else if( _dsCount == 251 )
3471  068d a1fb          	cp	a,#251
3472  068f 2729          	jreq	L725
3473                     ; 906 		else if( _dsCount == 1 )
3475  0691 4a            	dec	a
3476  0692 26f5          	jrne	L3731
3477                     ; 908 			if( key==1 )
3479  0694 7b03          	ld	a,(OFST+1,sp)
3480  0696 a101          	cp	a,#1
3481  0698 2606          	jrne	L1051
3482                     ; 910 				_GOTO(0)	//	To Nan	
3484  069a 725f0000      	clr	___sUp
3486                     ; 911 				goto EXIT_2_MAIN;
3488  069e 2016          	jpf	LC014
3489  06a0               L1051:
3490                     ; 913 			else if( key==2 )	{ _NOT_KEY_ }	//	
3492  06a0 a102          	cp	a,#2
3493  06a2 273d          	jreq	L3051
3496                     ; 914 			else if( key==4 )	
3498  06a4 a104          	cp	a,#4
3499  06a6 2606          	jrne	L1151
3500                     ; 916 				_GOTO(153)	//	MODE_2
3502  06a8 35990000      	mov	___sUp,#153
3504                     ; 917 				goto EXIT_2_MAIN;
3506  06ac 2008          	jpf	LC014
3507  06ae               L1151:
3508                     ; 919 			else if( key==8 )	
3510  06ae a108          	cp	a,#8
3511  06b0 261d          	jrne	L5151
3512                     ; 921 				_GOTO(1)	//	REMOTE
3514  06b2 35010000      	mov	___sUp,#1
3517  06b6               LC014:
3520  06b6 350a0000      	mov	__dsCount,#10
3521                     ; 922 				goto EXIT_2_MAIN;
3522  06ba               L725:
3523                     ; 898 EXIT_2_MAIN:
3523                     ; 899 			__s = 0;
3525  06ba 725f0000      	clr	___s
3526                     ; 900 			if( _boiler_water_shower != uiInfo._t )
3528  06be c60001        	ld	a,__boiler_water_shower
3529  06c1 c1005f        	cp	a,_uiInfo+95
3530  06c4 27c3          	jreq	L3731
3531                     ; 903 				file_update2(0);
3533  06c6 4f            	clr	a
3534  06c7 8d000000      	callf	f_file_update2
3536  06cb ac6c0a6c      	jra	L3731
3537  06cf               L5151:
3538                     ; 924 			else if( key==16 )	_DN
3540  06cf a110          	cp	a,#16
3541  06d1 2606          	jrne	L1251
3544  06d3 35400000      	mov	_uiInfo,#64
3546  06d7 2008          	jra	L3051
3547  06d9               L1251:
3548                     ; 925 			else if( key==32 )	_UP
3550  06d9 a120          	cp	a,#32
3551  06db 2604          	jrne	L3051
3554  06dd 35010000      	mov	_uiInfo,#1
3555  06e1               L3051:
3556                     ; 929 			i = _boiler_water_shower;
3558  06e1 c60001        	ld	a,__boiler_water_shower
3559  06e4 6b02          	ld	(OFST+0,sp),a
3560                     ; 930 			if( uiInfo.enc != 0 )
3562  06e6 c60000        	ld	a,_uiInfo
3563  06e9 2723          	jreq	L7251
3564                     ; 932 				ENC_MOVE_0(35,60,5);
3566  06eb a540          	bcp	a,#64
3567  06ed 260e          	jrne	L1351
3570  06ef 7b02          	ld	a,(OFST+0,sp)
3571  06f1 a124          	cp	a,#36
3572  06f3 2404          	jruge	L3351
3575  06f5 a63c          	ld	a,#60
3577  06f7 2010          	jra	L7351
3578  06f9               L3351:
3581  06f9 a005          	sub	a,#5
3582  06fb 200c          	jra	L7351
3583  06fd               L1351:
3586  06fd 7b02          	ld	a,(OFST+0,sp)
3587  06ff a13c          	cp	a,#60
3588  0701 2504          	jrult	L1451
3591  0703 a623          	ld	a,#35
3593  0705 2002          	jra	L7351
3594  0707               L1451:
3597  0707 ab05          	add	a,#5
3598  0709               L7351:
3599  0709 6b02          	ld	(OFST+0,sp),a
3600                     ; 933 				_boiler_water_shower = i;
3603  070b c70001        	ld	__boiler_water_shower,a
3604  070e               L7251:
3605                     ; 935 			if( _dsPrev != i )
3607  070e c60000        	ld	a,__dsPrev
3608  0711 1102          	cp	a,(OFST+0,sp)
3609  0713 27b6          	jreq	L3731
3610                     ; 937 				_dsPrev = i;
3612  0715 7b02          	ld	a,(OFST+0,sp)
3613  0717 c70000        	ld	__dsPrev,a
3614                     ; 938 				UI_DISP_2Digit(i);
3616  071a 8db00ab0      	callf	LC024
3620  071e 7b02          	ld	a,(OFST+0,sp)
3621  0720 8da30aa3      	callf	LC023
3624  0724 ac6c0a6c      	jra	L3731
3625  0728               L3641:
3626                     ; 949 	else if( __s == 4 )
3628  0728 a104          	cp	a,#4
3629  072a 2652          	jrne	L1551
3630                     ; 951 		if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
3632  072c 7b03          	ld	a,(OFST+1,sp)
3633  072e a110          	cp	a,#16
3634  0730 2606          	jrne	L3551
3637  0732 35400000      	mov	_uiInfo,#64
3639  0736 2008          	jra	L5551
3640  0738               L3551:
3641                     ; 952 		else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
3643  0738 a120          	cp	a,#32
3644  073a 2604          	jrne	L5551
3647  073c 35010000      	mov	_uiInfo,#1
3648  0740               L5551:
3649                     ; 954 		disp_backlight(0);
3651  0740 4f            	clr	a
3652  0741 8d000000      	callf	f_disp_backlight
3654                     ; 956 		if( key == KEY_ROOM || key == KEY_YB || key == KEY_NO || key == KEY_ONOFF )
3656  0745 7b03          	ld	a,(OFST+1,sp)
3657  0747 a101          	cp	a,#1
3658  0749 270c          	jreq	L3651
3660  074b a102          	cp	a,#2
3661  074d 2708          	jreq	L3651
3663  074f a104          	cp	a,#4
3664  0751 2704          	jreq	L3651
3666  0753 a108          	cp	a,#8
3667  0755 26cd          	jrne	L3731
3668  0757               L3651:
3669                     ; 958 			file_update2(0);
3671  0757 4f            	clr	a
3672  0758 8d000000      	callf	f_file_update2
3674                     ; 959 			EXIT_HOST(0);
3676  075c 725f0000      	clr	___s
3679  0760 725f0000      	clr	__dsCount
3682  0764 35ff0000      	mov	__dsPrev,#255
3685  0768 8d000000      	callf	f_lcd_blink_clear
3689  076c 4b00          	push	#0
3690  076e ae0001        	ldw	x,#1
3691  0771 c60000        	ld	a,___sInfo
3692  0774 95            	ld	xh,a
3693  0775 8d000000      	callf	f_lcd_disp_info
3695  0779 84            	pop	a
3697  077a ac6c0a6c      	jra	L3731
3698  077e               L1551:
3699                     ; 961 	} else if (__s == 5){
3701  077e a105          	cp	a,#5
3702  0780 265a          	jrne	L3751
3703                     ; 962 		__sUp = 0;
3705  0782 725f0000      	clr	___sUp
3706                     ; 964 		switch (_disp_mode) {
3708  0786 c60005        	ld	a,__disp_mode
3710                     ; 969 		case 0x10:	__sUp = 2;	break;
3711  0789 4a            	dec	a
3712  078a 2711          	jreq	L135
3713  078c 4a            	dec	a
3714  078d 2713          	jreq	L335
3715  078f a002          	sub	a,#2
3716  0791 2715          	jreq	L535
3717  0793 a004          	sub	a,#4
3718  0795 2717          	jreq	L735
3719  0797 a008          	sub	a,#8
3720  0799 2719          	jreq	L145
3721  079b 201b          	jra	L7751
3722  079d               L135:
3723                     ; 965 		case 0x01:	__sUp = 0;	break;
3725  079d c70000        	ld	___sUp,a
3728  07a0 2016          	jra	L7751
3729  07a2               L335:
3730                     ; 966 		case 0x02:	__sUp = 3;	break;
3732  07a2 35030000      	mov	___sUp,#3
3735  07a6 2010          	jra	L7751
3736  07a8               L535:
3737                     ; 967 		case 0x04:	__sUp = 4;	break;
3739  07a8 35040000      	mov	___sUp,#4
3742  07ac 200a          	jra	L7751
3743  07ae               L735:
3744                     ; 968 		case 0x08:	__sUp = 1;	break;
3746  07ae 35010000      	mov	___sUp,#1
3749  07b2 2004          	jra	L7751
3750  07b4               L145:
3751                     ; 969 		case 0x10:	__sUp = 2;	break;
3753  07b4 35020000      	mov	___sUp,#2
3756  07b8               L7751:
3757                     ; 971 		__sDn = 0xff;
3759  07b8 35ff0000      	mov	___sDn,#255
3760                     ; 972 		disp_status_loop_init();
3762  07bc 8d000000      	callf	f_disp_status_loop_init
3764                     ; 973 		_dsCount = 1;
3766  07c0 35010000      	mov	__dsCount,#1
3767                     ; 974 		__s = 0;
3769  07c4 725f0000      	clr	___s
3770                     ; 975 		_key_blink = 1;
3772  07c8 35010008      	mov	__key_blink,#1
3773                     ; 976 		_key_sec = _key_min = _key_hour = 0;
3775  07cc 725f0000      	clr	__key_hour
3776  07d0 725f0000      	clr	__key_min
3777  07d4 725f0000      	clr	__key_sec
3779  07d8 ac6c0a6c      	jra	L3731
3780  07dc               L3751:
3781                     ; 978 	else if( __s == 101 )// remote
3783  07dc a165          	cp	a,#101
3784  07de 2704acbd09bd  	jrne	L3061
3785                     ; 980 		if( _dsCount == 0 )
3787  07e4 c60000        	ld	a,__dsCount
3788  07e7 2676          	jrne	L5061
3789                     ; 982 			lcd_clear(0);
3791  07e9 8d000000      	callf	f_lcd_clear
3793                     ; 983 			_remote = 1;
3795  07ed 35010004      	mov	__remote,#1
3796                     ; 985 			j = uiInfo.cnt + uiInfo.cnt_sub;
3798                     ; 987 			j = __rc_max;
3800  07f1 c60000        	ld	a,___rc_max
3801                     ; 988 			if( j == 0 )	j = 1;
3803  07f4 2601          	jrne	L7061
3806  07f6 4c            	inc	a
3807  07f7               L7061:
3808  07f7 6b02          	ld	(OFST+0,sp),a
3809                     ; 989 			__sRoom = (uiInfo.id_rc + 1) % j;
3811  07f9 c60001        	ld	a,_uiInfo+1
3813  07fc               L345:
3814  07fc 5f            	clrw	x
3815  07fd 97            	ld	xl,a
3816  07fe 5c            	incw	x
3817  07ff 7b02          	ld	a,(OFST+0,sp)
3818  0801 905f          	clrw	y
3819  0803 9097          	ld	yl,a
3820  0805 8d000000      	callf	d_idiv
3821  0809 93            	ldw	x,y
3822  080a 8dd50ad5      	callf	LC028
3823  080e 2605          	jrne	L1161
3824                     ; 993 				__sRoom = (__sRoom + 1) % j;
3826  0810 c60000        	ld	a,___sRoom
3828                     ; 994 				goto _OneMore2;
3830  0813 20e7          	jra	L345
3831  0815               L1161:
3832                     ; 997 			j = __sRoom;
3834                     ; 998 _RemoteEntry:
3834                     ; 999 			if( __sRoom == uiInfo.id_rc )
3836  0815 c60000        	ld	a,___sRoom
3837  0818 c10001        	cp	a,_uiInfo+1
3838  081b 2614          	jrne	L3161
3839  081d               L745:
3840                     ; 1001 _RemoteExit:				
3840                     ; 1002 				_remote = 0;
3842  081d 725f0004      	clr	__remote
3843                     ; 1003 				__s = 0;
3845  0821 725f0000      	clr	___s
3846                     ; 1004 				_dsCount = 0;
3848  0825 725f0000      	clr	__dsCount
3849                     ; 1005 				lcd_blink_clear();
3851  0829 8d000000      	callf	f_lcd_blink_clear
3853                     ; 1006 				return;
3855  082d acc701c7      	jra	L434
3856  0831               L3161:
3857                     ; 1010 				uiInfo.remote_t[__sRoom] = uiInfo.tempSetup[__sRoom];
3859  0831 5f            	clrw	x
3860  0832 97            	ld	xl,a
3861  0833 d6003d        	ld	a,(_uiInfo+61,x)
3862  0836 d70065        	ld	(_uiInfo+101,x),a
3863                     ; 1012 			lcd_clear_rid();
3865  0839 8d000000      	callf	f_lcd_clear_rid
3867                     ; 1013 			lcd_blink_itemRoom(__sRoom, 1);
3869  083d ae0001        	ldw	x,#1
3870  0840 c60000        	ld	a,___sRoom
3871  0843 95            	ld	xh,a
3872  0844 8d000000      	callf	f_lcd_blink_itemRoom
3874                     ; 1014 			disp_status_remote_message(REMOTE_MODE); //모드 변경
3876  0848 c60000        	ld	a,___sRoom
3877  084b 8dbc0abc      	callf	LC025
3878  084f 8d000000      	callf	f_disp_status_remote_message
3880                     ; 1015 			_dsCount = 1;
3882  0853 35010000      	mov	__dsCount,#1
3883                     ; 1016 			_subRemote = 1;
3885  0857 35010000      	mov	__subRemote,#1
3887  085b ac6c0a6c      	jra	L3731
3888  085f               L5061:
3889                     ; 1018 		else if( _dsCount == 1 )//remote 첫화면
3891  085f a101          	cp	a,#1
3892  0861 2704aca309a3  	jrne	L7161
3893                     ; 1020 			if ( key == KEY_PLUS)		{	uiInfo.enc = ENC_UP;			}
3895  0867 7b03          	ld	a,(OFST+1,sp)
3896  0869 a110          	cp	a,#16
3897  086b 2606          	jrne	L1261
3900  086d 35400000      	mov	_uiInfo,#64
3902  0871 2008          	jra	L3261
3903  0873               L1261:
3904                     ; 1021 			else if ( key == KEY_MINUS) {	uiInfo.enc = ENC_DN;			}
3906  0873 a120          	cp	a,#32
3907  0875 2604          	jrne	L3261
3910  0877 35010000      	mov	_uiInfo,#1
3911  087b               L3261:
3912                     ; 1023 			j = __sRoom;
3914  087b c60000        	ld	a,___sRoom
3915  087e 6b02          	ld	(OFST+0,sp),a
3916                     ; 1024 			if( REMOTE_MODEi(j) == 0x01 )		{	_subRemote = 1; disp_status_loop_remote_N(j);	}
3918  0880 8dbc0abc      	callf	LC025
3919  0884 4a            	dec	a
3920  0885 260c          	jrne	L7261
3923  0887 35010000      	mov	__subRemote,#1
3926  088b 7b02          	ld	a,(OFST+0,sp)
3927  088d 8d000000      	callf	f_disp_status_loop_remote_N
3930  0891 2056          	jra	L1361
3931  0893               L7261:
3932                     ; 1025 			else if( REMOTE_MODEi(j) == 0x08 )	{	_subRemote = 8;	disp_status_loop_remote_Y(j);	}
3934  0893 7b02          	ld	a,(OFST+0,sp)
3935  0895 8dbc0abc      	callf	LC025
3936  0899 a108          	cp	a,#8
3937  089b 260c          	jrne	L3361
3940  089d 35080000      	mov	__subRemote,#8
3943  08a1 7b02          	ld	a,(OFST+0,sp)
3944  08a3 8d000000      	callf	f_disp_status_loop_remote_Y
3947  08a7 2040          	jra	L1361
3948  08a9               L3361:
3949                     ; 1026 			else if( REMOTE_MODEi(j) == 0x10 )	{	_subRemote = 10; disp_status_loop_remote_B(j);	}
3951  08a9 7b02          	ld	a,(OFST+0,sp)
3952  08ab 8dbc0abc      	callf	LC025
3953  08af a110          	cp	a,#16
3954  08b1 260c          	jrne	L7361
3957  08b3 350a0000      	mov	__subRemote,#10
3960  08b7 7b02          	ld	a,(OFST+0,sp)
3961  08b9 8d000000      	callf	f_disp_status_loop_remote_B
3964  08bd 202a          	jra	L1361
3965  08bf               L7361:
3966                     ; 1027 			else if( REMOTE_MODEi(j) == 0x04 )	{	_subRemote = 4; disp_status_loop_remote_J(j);	}
3968  08bf 7b02          	ld	a,(OFST+0,sp)
3969  08c1 8dbc0abc      	callf	LC025
3970  08c5 a104          	cp	a,#4
3971  08c7 260c          	jrne	L3461
3974  08c9 35040000      	mov	__subRemote,#4
3977  08cd 7b02          	ld	a,(OFST+0,sp)
3978  08cf 8d000000      	callf	f_disp_status_loop_remote_J
3981  08d3 2014          	jra	L1361
3982  08d5               L3461:
3983                     ; 1028 			else if( REMOTE_MODEi(j) == 0x02 )	{	_subRemote = 2; disp_status_loop_remote_O(j);	}
3985  08d5 7b02          	ld	a,(OFST+0,sp)
3986  08d7 8dbc0abc      	callf	LC025
3987  08db a102          	cp	a,#2
3988  08dd 260a          	jrne	L1361
3991  08df 35020000      	mov	__subRemote,#2
3994  08e3 7b02          	ld	a,(OFST+0,sp)
3995  08e5 8d000000      	callf	f_disp_status_loop_remote_O
3997  08e9               L1361:
3998                     ; 1030 			if (_subRemote == 1) // remote 난방  
4000  08e9 c60000        	ld	a,__subRemote
4001  08ec a101          	cp	a,#1
4002  08ee 261f          	jrne	L1561
4003                     ; 1032 				if( key == KEY_ROOM )	{	_dsCount = 2;				}
4005  08f0 7b03          	ld	a,(OFST+1,sp)
4006  08f2 a101          	cp	a,#1
4009  08f4 2723          	jreq	LC021
4010                     ; 1033 				else if( key == KEY_YB )
4012  08f6 a102          	cp	a,#2
4013                     ; 1035 					lcd_clear(0);
4015                     ; 1036 					REMOTE_MODEi(j) = 0x08;
4016                     ; 1037 					disp_status_remote_message(REMOTE_MODE);
4019  08f8 274c          	jreq	LC018
4020                     ; 1039 				else if( key == KEY_NO )
4022  08fa a104          	cp	a,#4
4023  08fc 2704ac8c098c  	jrne	L5002
4024                     ; 1041 					lcd_clear(0);
4026  0902 4f            	clr	a
4027  0903 8d000000      	callf	f_lcd_clear
4029                     ; 1043 					REMOTE_MODEi(j) = 0x02;
4031  0907 7b02          	ld	a,(OFST+0,sp)
4032  0909 5f            	clrw	x
4033  090a 97            	ld	xl,a
4034  090b a602          	ld	a,#2
4035                     ; 1044 					disp_status_remote_message(2);
4038  090d 2062          	jpf	LC019
4039                     ; 1046 				else if( key == KEY_ONOFF )	
4040                     ; 1048 					goto _RemoteExit;					
4042                     ; 1057 				else if ( key == KEY_PLUS) {}
4045                     ; 1058 				else if ( key == KEY_MINUS) {}
4047  090f               L1561:
4048                     ; 1060 			else if (_subRemote == 8) // remote 예약
4050  090f a108          	cp	a,#8
4051  0911 2621          	jrne	L3071
4052                     ; 1062 				if( key == KEY_ROOM )	{	_dsCount = 2;		}
4054  0913 7b03          	ld	a,(OFST+1,sp)
4055  0915 a101          	cp	a,#1
4056  0917 2606          	jrne	L5071
4059  0919               LC021:
4063  0919 35020000      	mov	__dsCount,#2
4065  091d 2075          	jra	L1071
4066  091f               L5071:
4067                     ; 1063 				else if( key == KEY_YB )
4069  091f a102          	cp	a,#2
4070  0921 263f          	jrne	L3471
4071                     ; 1065 					_dsPrev = 0xff;
4073  0923 35ff0000      	mov	__dsPrev,#255
4074                     ; 1066 					lcd_clear(0);
4076  0927 4f            	clr	a
4077  0928 8d000000      	callf	f_lcd_clear
4079                     ; 1067 					REMOTE_MODEi(j) = 0x10;
4081  092c 7b02          	ld	a,(OFST+0,sp)
4082  092e 5f            	clrw	x
4083  092f 97            	ld	xl,a
4084  0930 a610          	ld	a,#16
4085                     ; 1068 					disp_status_remote_message(REMOTE_MODE);
4088  0932 201d          	jpf	LC017
4089                     ; 1070 				else if( key == KEY_NO )
4090                     ; 1072 					lcd_clear(0);
4092                     ; 1073 					REMOTE_MODEi(j) = 0x01;
4093                     ; 1074 					disp_status_remote_message(1);
4096                     ; 1076 				else if( key == KEY_ONOFF )		{	goto _RemoteExit;	}
4099                     ; 1077 				else if ( key == KEY_PLUS) {}
4102                     ; 1078 				else if ( key == KEY_MINUS) {}
4104  0934               L3071:
4105                     ; 1080 			else if (_subRemote == 10) // remote 반복
4107  0934 a10a          	cp	a,#10
4108  0936 263e          	jrne	L5371
4109                     ; 1082 				if( key == KEY_ROOM )	{	_dsCount = 2;		}
4111  0938 7b03          	ld	a,(OFST+1,sp)
4112  093a a101          	cp	a,#1
4115  093c 27db          	jreq	LC021
4116                     ; 1083 				else if( key == KEY_YB )
4118  093e a102          	cp	a,#2
4119  0940 2620          	jrne	L3471
4120                     ; 1085 					_dsPrev = 0xff;
4122  0942 35ff0000      	mov	__dsPrev,#255
4123                     ; 1086 					lcd_clear(0);
4126                     ; 1087 					REMOTE_MODEi(j) = 0x08;
4128  0946               LC018:
4131  0946 4f            	clr	a
4132  0947 8d000000      	callf	f_lcd_clear
4135  094b 7b02          	ld	a,(OFST+0,sp)
4136  094d 5f            	clrw	x
4137  094e 97            	ld	xl,a
4138  094f a608          	ld	a,#8
4139                     ; 1088 					disp_status_remote_message(REMOTE_MODE);
4141  0951               LC017:
4142  0951 d70045        	ld	(_uiInfo+69,x),a
4146  0954 5f            	clrw	x
4147  0955 c60000        	ld	a,___sRoom
4148  0958 97            	ld	xl,a
4149  0959 d60045        	ld	a,(_uiInfo+69,x)
4150  095c               LC016:
4155  095c 8d000000      	callf	f_disp_status_remote_message
4158  0960 2032          	jra	L1071
4159  0962               L3471:
4160                     ; 1090 				else if( key == KEY_NO )
4163  0962 a104          	cp	a,#4
4164  0964 2626          	jrne	L5002
4165                     ; 1092 					lcd_clear(0);
4168                     ; 1093 					REMOTE_MODEi(j) = 0x01;
4170  0966               LC020:
4173  0966 4f            	clr	a
4174  0967 8d000000      	callf	f_lcd_clear
4177  096b 7b02          	ld	a,(OFST+0,sp)
4178  096d 5f            	clrw	x
4179  096e 97            	ld	xl,a
4180  096f a601          	ld	a,#1
4181  0971               LC019:
4182  0971 d70045        	ld	(_uiInfo+69,x),a
4183                     ; 1094 					disp_status_remote_message(1);
4186  0974 20e6          	jpf	LC016
4187                     ; 1096 				else if( key == KEY_ONOFF )	{	goto _RemoteExit;	}
4190                     ; 1097 				else if ( key == KEY_PLUS) {}
4193                     ; 1098 				else if ( key == KEY_MINUS) {}
4195  0976               L5371:
4196                     ; 1100 			else if (_subRemote == 4) // remote 정지
4198  0976 a104          	cp	a,#4
4199  0978 271a          	jreq	L1071
4201                     ; 1103 			else if (_subRemote == 2) // remote 외출
4203  097a a102          	cp	a,#2
4204  097c 2616          	jrne	L1071
4205                     ; 1105 				if( key == KEY_ROOM )	{	_dsCount = 2;		}
4207  097e 7b03          	ld	a,(OFST+1,sp)
4208  0980 a101          	cp	a,#1
4211  0982 2795          	jreq	LC021
4212                     ; 1106 				else if( key == KEY_YB )
4214  0984 a102          	cp	a,#2
4215                     ; 1108 					lcd_clear(0);
4217                     ; 1109 					REMOTE_MODEi(j) = 0x08;
4218                     ; 1110 					disp_status_remote_message(REMOTE_MODE);
4221  0986 27be          	jreq	LC018
4222                     ; 1112 				else if( key == KEY_NO )
4224  0988 a104          	cp	a,#4
4225                     ; 1115 					lcd_clear(0);
4227                     ; 1116 					REMOTE_MODEi(j) = 0x01;
4228                     ; 1117 					disp_status_remote_message(1);
4231  098a 27da          	jreq	LC020
4232  098c               L5002:
4233                     ; 1119 				else if( key == KEY_ONOFF )	{	goto _RemoteExit;		}
4238  098c a108          	cp	a,#8
4239  098e 2604ac1d081d  	jreq	L745
4242                     ; 1120 				else if ( key == KEY_PLUS) {}
4245                     ; 1121 				else if ( key == KEY_MINUS) {}
4247  0994               L1071:
4248                     ; 1123 			if( _key_min == KEY_BLINK_FADE ){	goto _RemoteExit;		}
4250  0994 c60000        	ld	a,__key_min
4251  0997 a10a          	cp	a,#10
4252  0999 2704ac6c0a6c  	jrne	L3731
4255  099f ac1d081d      	jra	L745
4256  09a3               L7161:
4257                     ; 1125 		else if (_dsCount == 2) 
4259  09a3 a102          	cp	a,#2
4260  09a5 26f4          	jrne	L3731
4261  09a7               L155:
4262                     ; 1127 _OneMore:			
4262                     ; 1128 			j = 8;
4264                     ; 1129 			__sRoom = (__sRoom + 1) % j;
4266  09a7 c60000        	ld	a,___sRoom
4267  09aa 5f            	clrw	x
4268  09ab 97            	ld	xl,a
4269  09ac 5c            	incw	x
4270  09ad a608          	ld	a,#8
4271  09af 8d000000      	callf	d_smodx
4273  09b3 8dd50ad5      	callf	LC028
4274  09b7 27ee          	jreq	L155
4275                     ; 1130 			if( packet_buf[__sRoom] == 10 )	{	goto _OneMore;			}			
4277                     ; 1131 			if( __sRoom != 0 ) {	j = __sRoom - 1;		}
4281  09b9 ac150815      	jra	L1161
4282  09bd               L3061:
4283                     ; 1135 	else if( __s == 200 )//	LONG_1
4285  09bd a1c8          	cp	a,#200
4286  09bf 26da          	jrne	L3731
4287                     ; 1137 		if( _dsCount == 0 )
4289  09c1 c60000        	ld	a,__dsCount
4290  09c4 266a          	jrne	L1402
4291                     ; 1139 			_dsCount = 1;
4293  09c6 35010000      	mov	__dsCount,#1
4294                     ; 1142 			lcd_clear(0);
4296  09ca 8d000000      	callf	f_lcd_clear
4298                     ; 1143 			lcd_blink_clear();
4300  09ce 8d000000      	callf	f_lcd_blink_clear
4302                     ; 1144 			lcd_clear_btn();
4304  09d2 8d000000      	callf	f_lcd_clear_btn
4306                     ; 1145 			LCD_BIT_SET(bT7);
4308  09d6 c60019        	ld	a,_iLF_DEF+25
4309  09d9 8dc20ac2      	callf	LC026
4310  09dd ca0019        	or	a,_bLF_DEF+25
4311  09e0 d7540c        	ld	(21516,x),a
4312                     ; 1146 			LCD_BIT_SET(bT1);	//	현재온도
4314  09e3 c60004        	ld	a,_iLF_DEF+4
4315  09e6 8dc20ac2      	callf	LC026
4316  09ea ca0004        	or	a,_bLF_DEF+4
4317  09ed d7540c        	ld	(21516,x),a
4318                     ; 1147 			LCD_BIT_SET(bT3);	//	도			
4320  09f0 c60000        	ld	a,_iLF_DEF
4321  09f3 8dc20ac2      	callf	LC026
4322  09f7 ca0000        	or	a,_bLF_DEF
4323  09fa d7540c        	ld	(21516,x),a
4324                     ; 1150 			LCD_BIT_SET(bT4);	//	설정온도
4326  09fd c6000f        	ld	a,_iLF_DEF+15
4327  0a00 8dc20ac2      	callf	LC026
4328  0a04 ca000f        	or	a,_bLF_DEF+15
4329  0a07 d7540c        	ld	(21516,x),a
4330                     ; 1151 			__ui_disp_temp_c(3);//도씨 표시
4332  0a0a a603          	ld	a,#3
4333  0a0c 8d000000      	callf	f___ui_disp_temp_c
4335                     ; 1153 			dr_mode_out = 0;
4337  0a10 725f0000      	clr	_dr_mode_out
4338                     ; 1154 			_disp_mode = 0x02;
4340  0a14 35020005      	mov	__disp_mode,#2
4341                     ; 1155 			ui_disp_temp_curr(uiInfo.tCurr);
4343  0a18 c60002        	ld	a,_uiInfo+2
4344  0a1b 8d000000      	callf	f_ui_disp_temp_curr
4346                     ; 1156 			ui_disp_temp_setup(20/*uiInfo.tSetup*/);
4348  0a1f a614          	ld	a,#20
4349  0a21 8d000000      	callf	f_ui_disp_temp_setup
4351                     ; 1157 			_remote_s[0] = __timer100ms;
4353  0a25 5500000003    	mov	__remote_s,___timer100ms
4354                     ; 1158 			_remote_s[1] = 0;
4356  0a2a 725f0004      	clr	__remote_s+1
4358  0a2e 203c          	jra	L3731
4359  0a30               L1402:
4360                     ; 1160 		else if( _dsCount == 1 )
4362  0a30 4a            	dec	a
4363  0a31 2639          	jrne	L3731
4364                     ; 1162 			if( _remote_s[0] != __timer100ms )
4366  0a33 c60003        	ld	a,__remote_s
4367  0a36 c10000        	cp	a,___timer100ms
4368  0a39 2709          	jreq	L7402
4369                     ; 1164 				_remote_s[0] = __timer100ms;
4371  0a3b 5500000003    	mov	__remote_s,___timer100ms
4372                     ; 1165 				_remote_s[1]++;
4374  0a40 725c0004      	inc	__remote_s+1
4375                     ; 1166 				if( _remote_s[1] > 50 )
4377  0a44               L7402:
4378                     ; 1171 			_disp_temp = 1;		
4380  0a44 35010000      	mov	__disp_temp,#1
4381                     ; 1172 			if( key == 1 || key == 2 || key == 4 || key == 8 )
4383  0a48 7b03          	ld	a,(OFST+1,sp)
4384  0a4a a101          	cp	a,#1
4385  0a4c 270c          	jreq	L5502
4387  0a4e a102          	cp	a,#2
4388  0a50 2708          	jreq	L5502
4390  0a52 a104          	cp	a,#4
4391  0a54 2704          	jreq	L5502
4393  0a56 a108          	cp	a,#8
4394  0a58 2612          	jrne	L3731
4395  0a5a               L5502:
4396                     ; 1174 				__s = uiInfo.remote_t[0];
4398  0a5a 5500650000    	mov	___s,_uiInfo+101
4399                     ; 1175 				_dsCount = uiInfo.remote_t[1];
4401  0a5f 5500660000    	mov	__dsCount,_uiInfo+102
4402                     ; 1176 				__sUp = 0;
4404  0a64 725f0000      	clr	___sUp
4405                     ; 1178 				dr_mode_out = 1;
4407  0a68 35010000      	mov	_dr_mode_out,#1
4408  0a6c               L3731:
4409                     ; 1226 	if (packet_changed == 1) {
4411  0a6c c60000        	ld	a,_packet_changed
4412  0a6f 4a            	dec	a
4413  0a70 2704acc701c7  	jrne	L434
4414                     ; 1227 		__s = 0;
4416  0a76 c70000        	ld	___s,a
4417                     ; 1228 		_dsCount = 10;
4419  0a79 350a0000      	mov	__dsCount,#10
4420                     ; 1229 		switch (_disp_mode2) {
4422  0a7d c60006        	ld	a,__disp_mode2
4424                     ; 1232 			case 0x04:  __sUp = 5;	break;
4425  0a80 4a            	dec	a
4426  0a81 2709          	jreq	L355
4427  0a83 4a            	dec	a
4428  0a84 270b          	jreq	L555
4429  0a86 a002          	sub	a,#2
4430  0a88 270d          	jreq	L755
4431  0a8a 200f          	jra	L7602
4432  0a8c               L355:
4433                     ; 1230 			case 0x01:	_dsCount = 0;	break;
4435  0a8c c70000        	ld	__dsCount,a
4438  0a8f 200a          	jra	L7602
4439  0a91               L555:
4440                     ; 1231 			case 0x02:  __sUp = 16;  break;
4442  0a91 35100000      	mov	___sUp,#16
4445  0a95 2004          	jra	L7602
4446  0a97               L755:
4447                     ; 1232 			case 0x04:  __sUp = 5;	break;
4449  0a97 35050000      	mov	___sUp,#5
4452  0a9b               L7602:
4453                     ; 1234 		packet_changed = 0;
4455  0a9b 725f0000      	clr	_packet_changed
4456                     ; 1236 }
4458  0a9f acc701c7      	jra	L434
4459  0aa3               LC023:
4460  0aa3 5f            	clrw	x
4461  0aa4 97            	ld	xl,a
4462  0aa5 a60a          	ld	a,#10
4463  0aa7 62            	div	x,a
4464  0aa8 97            	ld	xl,a
4465  0aa9 a603          	ld	a,#3
4466  0aab 95            	ld	xh,a
4467  0aac ac000000      	jpf	f_lcd_disp_n
4468  0ab0               LC024:
4469  0ab0 5f            	clrw	x
4470  0ab1 97            	ld	xl,a
4471  0ab2 a60a          	ld	a,#10
4472  0ab4 62            	div	x,a
4473  0ab5 a602          	ld	a,#2
4474  0ab7 95            	ld	xh,a
4475  0ab8 ac000000      	jpf	f_lcd_disp_n
4476  0abc               LC025:
4477  0abc 5f            	clrw	x
4478  0abd 97            	ld	xl,a
4479  0abe d60045        	ld	a,(_uiInfo+69,x)
4480  0ac1 87            	retf	
4481  0ac2               LC026:
4482  0ac2 5f            	clrw	x
4483  0ac3 97            	ld	xl,a
4484  0ac4 d6540c        	ld	a,(21516,x)
4485  0ac7 87            	retf	
4486  0ac8               LC027:
4487  0ac8 8d000000      	callf	f_lcd_disp_info_shower
4489                     ; 892 			_dsCount = 1;
4491  0acc 35010000      	mov	__dsCount,#1
4492                     ; 893 			_dsPrev = 0xff;
4494  0ad0 35ff0000      	mov	__dsPrev,#255
4495  0ad4 87            	retf	
4496  0ad5               LC028:
4497  0ad5 01            	rrwa	x,a
4498  0ad6 c70000        	ld	___sRoom,a
4499                     ; 990 _OneMore2:			
4499                     ; 991 			if( packet_buf[__sRoom] == 10 )
4501  0ad9 5f            	clrw	x
4502  0ada 97            	ld	xl,a
4503  0adb d60000        	ld	a,(_packet_buf,x)
4504  0ade a10a          	cp	a,#10
4505  0ae0 87            	retf	
4623                     	switch	.bss
4624  0000               __key_time_event:
4625  0000 000000        	ds.b	3
4626                     	xdef	__key_time_event
4627                     	xdef	f_disp_rid_info
4628                     	xref	_packet_buf
4629                     	xdef	f_disp_status_loop_host_N2OUT
4630                     	xdef	f_disp_status_loop_host_Out_Long
4631                     	xdef	f_disp_status_loop_host_Out
4632                     	xdef	f_disp_status_loop_host_Off
4633                     	xdef	f_disp_status_loop_remote_B
4634                     	xdef	f_disp_status_loop_remote_O
4635                     	xdef	f_disp_status_loop_remote_J
4636                     	xdef	f_disp_status_loop_remote_Y
4637                     	xdef	f_disp_status_loop_remote_N
4638                     	xdef	f_disp_status_remote_message
4639                     	xdef	_temp_tsetup
4640                     	xref	_dr_mode_out
4641                     	xref	_packet_changed
4642                     	xref	__rcLED
4643                     	xref	__disp_temp
4644                     	xref	_start_flag
4645  0003               __remote_s:
4646  0003 000000000000  	ds.b	8
4647                     	xdef	__remote_s
4648  000b               __remote_buf:
4649  000b 000000000000  	ds.b	8
4650                     	xdef	__remote_buf
4651                     	xdef	__remote
4652                     	xdef	__boiler_fire
4653                     	xdef	__boiler_type
4654                     	xref	___rc_max
4655                     	xref	f_func_rc_setting
4656                     	xref	f_getHexToBin
4657                     	xdef	__boiler_water_heat
4658                     	xdef	__boiler_water_shower
4659  0013               ___boiler_shower:
4660  0013 000000000000  	ds.b	10
4661                     	xdef	___boiler_shower
4662                     	xdef	f__disp_status_loop_host_boiler
4663                     	xref	f_disp_backlight
4664                     	xref	f_file_update2
4665                     	xref	__updateCount
4666                     	xref	__updateBit
4667                     	xref	__updateTimer
4668                     	xdef	__key_blink
4669                     	xref	__key_hour
4670                     	xref	__key_min
4671                     	xref	__key_sec
4672                     	xdef	__disp_mode2
4673                     	xdef	__disp_mode
4674                     	xref	f_disp_status_curr_only
4675                     	xref	f_disp_status_loop_init
4676                     	xdef	f_disp_status_loop_host_B
4677                     	xdef	f_disp_status_loop_host_Y
4678                     	xdef	f_disp_status_loop_host_N
4679                     	xref	f_disp_status_loop_messageDn
4680                     	xref	f_disp_status_loop_message
4681                     	xref	__subRemote
4682                     	xref	__dsPrev
4683                     	xref	__dsCount
4684                     	xdef	f_disp_status_loop_host
4685                     	xref	___sRoom
4686                     	xref	___sInfo
4687                     	xref	___sDn
4688                     	xref	___sUp
4689                     	xref	___s
4690                     	xref	f_lcd_disp_info
4691                     	xref	f_lcd_disp_info_shower
4692                     	xref	f_ui_disp_reserve_setup
4693                     	xref	f_ui_disp_repeat_setup
4694                     	xref	f_ui_disp_clear_tSetup
4695                     	xref	f___ui_disp_temp_c
4696                     	xref	f_ui_disp_temp_curr
4697                     	xref	f_ui_disp_temp_setup
4698                     	xref	f_lcd_clear_rid_n
4699                     	xref	f_lcd_blink_itemRoom
4700                     	xref	f_lcd_blink_item
4701                     	xref	f_lcd_blink_clear
4702                     	xref	f_lcd_disp_rid
4703                     	xref	f_lcd_disp_n
4704                     	xref	f_lcd_clear
4705                     	xref	f_lcd_clear_rid
4706                     	xref	f_lcd_clear_btn
4707                     	xref	_iLF_DEF
4708                     	xref	_bLF_DEF
4709                     	xref	_uiInfo
4710                     	xref	___timer1s
4711                     	xref	___timer100ms
4712                     	xref.b	c_x
4732                     	xref	d_idiv
4733                     	xref	d_smodx
4734                     	end
