   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               __boiler_type:
  21  0000 00            	dc.b	0
  22  0001               __boiler_water_shower:
  23  0001 32            	dc.b	50
  24  0002               __boiler_water_heat:
  25  0002 46            	dc.b	70
  26  0003               __boiler_fire:
  27  0003 00            	dc.b	0
  28  0004               __remote:
  29  0004 00            	dc.b	0
  30  0005               __disp_mode:
  31  0005 01            	dc.b	1
  32  0006               __disp_mode2:
  33  0006 01            	dc.b	1
  75                     ; 60 void	disp_status_remote_message(uint8_t i)
  75                     ; 61 {
  77                     .text:	section	.text,new
  78  0000               _disp_status_remote_message:
  80  0000 88            	push	a
  81       00000000      OFST:	set	0
  84                     ; 62 	lcd_clear_btn();
  86  0001 cd0000        	call	_lcd_clear_btn
  88                     ; 63 	if( i == 0x01 )			{	LCD_BIT_SET(bS6);	/*	(0)난방*/	}
  90  0004 7b01          	ld	a,(OFST+1,sp)
  91  0006 a101          	cp	a,#1
  92  0008 2610          	jrne	L52
  95  000a c60011        	ld	a,_iLF_DEF+17
  96  000d 5f            	clrw	x
  97  000e 97            	ld	xl,a
  98  000f d6540c        	ld	a,(21516,x)
  99  0012 ca0011        	or	a,_bLF_DEF+17
 100  0015 d7540c        	ld	(21516,x),a
 102  0018 2056          	jra	L72
 103  001a               L52:
 104                     ; 64 	else if( i == 0x02 )	{	LCD_BIT_SET(bS9);	/*	(1)외출*/	}
 106  001a 7b01          	ld	a,(OFST+1,sp)
 107  001c a102          	cp	a,#2
 108  001e 2610          	jrne	L13
 111  0020 c60010        	ld	a,_iLF_DEF+16
 112  0023 5f            	clrw	x
 113  0024 97            	ld	xl,a
 114  0025 d6540c        	ld	a,(21516,x)
 115  0028 ca0010        	or	a,_bLF_DEF+16
 116  002b d7540c        	ld	(21516,x),a
 118  002e 2040          	jra	L72
 119  0030               L13:
 120                     ; 65 	else if( i == 0x04 )	{	LCD_BIT_SET(bS10);	/*	(2)정지*/	}
 122  0030 7b01          	ld	a,(OFST+1,sp)
 123  0032 a104          	cp	a,#4
 124  0034 2610          	jrne	L53
 127  0036 c60020        	ld	a,_iLF_DEF+32
 128  0039 5f            	clrw	x
 129  003a 97            	ld	xl,a
 130  003b d6540c        	ld	a,(21516,x)
 131  003e ca0020        	or	a,_bLF_DEF+32
 132  0041 d7540c        	ld	(21516,x),a
 134  0044 202a          	jra	L72
 135  0046               L53:
 136                     ; 66 	else if( i == 0x08 )	{	LCD_BIT_SET(bS7);	/*	(2)예약*/	}
 138  0046 7b01          	ld	a,(OFST+1,sp)
 139  0048 a108          	cp	a,#8
 140  004a 2610          	jrne	L14
 143  004c c60021        	ld	a,_iLF_DEF+33
 144  004f 5f            	clrw	x
 145  0050 97            	ld	xl,a
 146  0051 d6540c        	ld	a,(21516,x)
 147  0054 ca0021        	or	a,_bLF_DEF+33
 148  0057 d7540c        	ld	(21516,x),a
 150  005a 2014          	jra	L72
 151  005c               L14:
 152                     ; 67 	else if( i == 0x10 )	{	LCD_BIT_SET(bS8);	/*	(2)반복*/	}
 154  005c 7b01          	ld	a,(OFST+1,sp)
 155  005e a110          	cp	a,#16
 156  0060 260e          	jrne	L72
 159  0062 c60031        	ld	a,_iLF_DEF+49
 160  0065 5f            	clrw	x
 161  0066 97            	ld	xl,a
 162  0067 d6540c        	ld	a,(21516,x)
 163  006a ca0031        	or	a,_bLF_DEF+49
 164  006d d7540c        	ld	(21516,x),a
 165  0070               L72:
 166                     ; 68 }
 169  0070 84            	pop	a
 170  0071 81            	ret
 222                     ; 70 uint8_t		disp_status_loop_remote_N(uint8_t key)
 222                     ; 71 {
 223                     .text:	section	.text,new
 224  0000               _disp_status_loop_remote_N:
 226  0000 88            	push	a
 227  0001 89            	pushw	x
 228       00000002      OFST:	set	2
 231                     ; 73 	uint8_t	j = 0;
 233  0002 0f01          	clr	(OFST-1,sp)
 234                     ; 74 	i = uiInfo.tempSetup[key];
 236  0004 5f            	clrw	x
 237  0005 97            	ld	xl,a
 238  0006 d6003d        	ld	a,(_uiInfo+61,x)
 239  0009 6b02          	ld	(OFST+0,sp),a
 240                     ; 75 	if( uiInfo.enc != 0 )
 242  000b 725d0000      	tnz	_uiInfo
 243  000f 2732          	jreq	L76
 244                     ; 78 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 246  0011 c60000        	ld	a,_uiInfo
 247  0014 a540          	bcp	a,#64
 248  0016 2604          	jrne	L01
 249  0018 a6ff          	ld	a,#255
 250  001a 2002          	jra	L21
 251  001c               L01:
 252  001c a601          	ld	a,#1
 253  001e               L21:
 254  001e 1b02          	add	a,(OFST+0,sp)
 255  0020 6b02          	ld	(OFST+0,sp),a
 256                     ; 79 		if( i<=10 )	i = 10;
 258  0022 7b02          	ld	a,(OFST+0,sp)
 259  0024 a10b          	cp	a,#11
 260  0026 2404          	jruge	L17
 263  0028 a60a          	ld	a,#10
 264  002a 6b02          	ld	(OFST+0,sp),a
 265  002c               L17:
 266                     ; 80 		if( i>=80 )	i = 80;
 268  002c 7b02          	ld	a,(OFST+0,sp)
 269  002e a150          	cp	a,#80
 270  0030 2504          	jrult	L37
 273  0032 a650          	ld	a,#80
 274  0034 6b02          	ld	(OFST+0,sp),a
 275  0036               L37:
 276                     ; 81 		uiInfo.tempSetup[key] = i;
 278  0036 7b03          	ld	a,(OFST+1,sp)
 279  0038 5f            	clrw	x
 280  0039 97            	ld	xl,a
 281  003a 7b02          	ld	a,(OFST+0,sp)
 282  003c d7003d        	ld	(_uiInfo+61,x),a
 283                     ; 82 		j = 1;
 285  003f a601          	ld	a,#1
 286  0041 6b01          	ld	(OFST-1,sp),a
 287  0043               L76:
 288                     ; 84 	if( _dsPrev != i )
 290  0043 c60000        	ld	a,__dsPrev
 291  0046 1102          	cp	a,(OFST+0,sp)
 292  0048 271e          	jreq	L57
 293                     ; 86 		_dsPrev = i;
 295  004a 7b02          	ld	a,(OFST+0,sp)
 296  004c c70000        	ld	__dsPrev,a
 297                     ; 87 		ui_disp_temp_mark(1);
 299  004f a601          	ld	a,#1
 300  0051 cd0000        	call	_ui_disp_temp_mark
 302                     ; 88 		ui_disp_temp_setup(uiInfo.tempSetup[key]);
 304  0054 7b03          	ld	a,(OFST+1,sp)
 305  0056 5f            	clrw	x
 306  0057 97            	ld	xl,a
 307  0058 d6003d        	ld	a,(_uiInfo+61,x)
 308  005b cd0000        	call	_ui_disp_temp_setup
 310                     ; 89 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 312  005e 7b03          	ld	a,(OFST+1,sp)
 313  0060 5f            	clrw	x
 314  0061 97            	ld	xl,a
 315  0062 d60035        	ld	a,(_uiInfo+53,x)
 316  0065 cd0000        	call	_ui_disp_temp_curr
 318  0068               L57:
 319                     ; 91 	return j;
 321  0068 7b01          	ld	a,(OFST-1,sp)
 324  006a 5b03          	addw	sp,#3
 325  006c 81            	ret
 375                     ; 94 uint8_t	disp_status_loop_remote_Y(uint8_t key)
 375                     ; 95 {
 376                     .text:	section	.text,new
 377  0000               _disp_status_loop_remote_Y:
 379  0000 88            	push	a
 380  0001 89            	pushw	x
 381       00000002      OFST:	set	2
 384                     ; 97 	uint8_t	j = 0;
 386  0002 0f01          	clr	(OFST-1,sp)
 387                     ; 98 	i = uiInfo.remote_time[key];
 389  0004 5f            	clrw	x
 390  0005 97            	ld	xl,a
 391  0006 d6004d        	ld	a,(_uiInfo+77,x)
 392  0009 6b02          	ld	(OFST+0,sp),a
 393                     ; 99 	if( uiInfo.enc != 0 )
 395  000b 725d0000      	tnz	_uiInfo
 396  000f 2732          	jreq	L711
 397                     ; 102 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 399  0011 c60000        	ld	a,_uiInfo
 400  0014 a540          	bcp	a,#64
 401  0016 2604          	jrne	L61
 402  0018 a6ff          	ld	a,#255
 403  001a 2002          	jra	L02
 404  001c               L61:
 405  001c a601          	ld	a,#1
 406  001e               L02:
 407  001e 1b02          	add	a,(OFST+0,sp)
 408  0020 6b02          	ld	(OFST+0,sp),a
 409                     ; 103 		if( i<=2 )	i = 2;
 411  0022 7b02          	ld	a,(OFST+0,sp)
 412  0024 a103          	cp	a,#3
 413  0026 2404          	jruge	L121
 416  0028 a602          	ld	a,#2
 417  002a 6b02          	ld	(OFST+0,sp),a
 418  002c               L121:
 419                     ; 104 		if( i>=48 )	i = 48;
 421  002c 7b02          	ld	a,(OFST+0,sp)
 422  002e a130          	cp	a,#48
 423  0030 2504          	jrult	L321
 426  0032 a630          	ld	a,#48
 427  0034 6b02          	ld	(OFST+0,sp),a
 428  0036               L321:
 429                     ; 105 		uiInfo.remote_time[key] = i;
 431  0036 7b03          	ld	a,(OFST+1,sp)
 432  0038 5f            	clrw	x
 433  0039 97            	ld	xl,a
 434  003a 7b02          	ld	a,(OFST+0,sp)
 435  003c d7004d        	ld	(_uiInfo+77,x),a
 436                     ; 106 		j = 1;
 438  003f a601          	ld	a,#1
 439  0041 6b01          	ld	(OFST-1,sp),a
 440  0043               L711:
 441                     ; 108 	if( _dsPrev != i )
 443  0043 c60000        	ld	a,__dsPrev
 444  0046 1102          	cp	a,(OFST+0,sp)
 445  0048 270f          	jreq	L521
 446                     ; 110 		_dsPrev = i;
 448  004a 7b02          	ld	a,(OFST+0,sp)
 449  004c c70000        	ld	__dsPrev,a
 450                     ; 111 		ui_disp_reserve_setup(uiInfo.remote_time[key]);
 452  004f 7b03          	ld	a,(OFST+1,sp)
 453  0051 5f            	clrw	x
 454  0052 97            	ld	xl,a
 455  0053 d6004d        	ld	a,(_uiInfo+77,x)
 456  0056 cd0000        	call	_ui_disp_reserve_setup
 458  0059               L521:
 459                     ; 113 	return j;
 461  0059 7b01          	ld	a,(OFST-1,sp)
 464  005b 5b03          	addw	sp,#3
 465  005d 81            	ret
 502                     ; 116 uint8_t		disp_status_loop_remote_J(uint8_t key)
 502                     ; 117 {
 503                     .text:	section	.text,new
 504  0000               _disp_status_loop_remote_J:
 506  0000 88            	push	a
 507       00000000      OFST:	set	0
 510                     ; 119 	if (_dsPrev != 0xFE ) {
 512  0001 c60000        	ld	a,__dsPrev
 513  0004 a1fe          	cp	a,#254
 514  0006 2713          	jreq	L341
 515                     ; 120 		_dsPrev = 0xFE;
 517  0008 35fe0000      	mov	__dsPrev,#254
 518                     ; 121 		ui_disp_clear_tSetup(1);
 520  000c a601          	ld	a,#1
 521  000e cd0000        	call	_ui_disp_clear_tSetup
 523                     ; 122 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 525  0011 7b01          	ld	a,(OFST+1,sp)
 526  0013 5f            	clrw	x
 527  0014 97            	ld	xl,a
 528  0015 d60035        	ld	a,(_uiInfo+53,x)
 529  0018 cd0000        	call	_ui_disp_temp_curr
 531  001b               L341:
 532                     ; 125 	return key;
 534  001b 7b01          	ld	a,(OFST+1,sp)
 537  001d 5b01          	addw	sp,#1
 538  001f 81            	ret
 588                     ; 128 uint8_t		disp_status_loop_remote_B(uint8_t key)
 588                     ; 129 {
 589                     .text:	section	.text,new
 590  0000               _disp_status_loop_remote_B:
 592  0000 88            	push	a
 593  0001 89            	pushw	x
 594       00000002      OFST:	set	2
 597                     ; 131 	uint8_t	j = 0;
 599  0002 0f01          	clr	(OFST-1,sp)
 600                     ; 132 	i = uiInfo.remote_banb[key];
 602  0004 5f            	clrw	x
 603  0005 97            	ld	xl,a
 604  0006 d60055        	ld	a,(_uiInfo+85,x)
 605  0009 6b02          	ld	(OFST+0,sp),a
 606                     ; 133 	if( uiInfo.enc != 0 )
 608  000b 725d0000      	tnz	_uiInfo
 609  000f 2732          	jreq	L561
 610                     ; 136 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 612  0011 c60000        	ld	a,_uiInfo
 613  0014 a540          	bcp	a,#64
 614  0016 2604          	jrne	L62
 615  0018 a6ff          	ld	a,#255
 616  001a 2002          	jra	L03
 617  001c               L62:
 618  001c a601          	ld	a,#1
 619  001e               L03:
 620  001e 1b02          	add	a,(OFST+0,sp)
 621  0020 6b02          	ld	(OFST+0,sp),a
 622                     ; 137 		if( i<=5 )	i = 5;
 624  0022 7b02          	ld	a,(OFST+0,sp)
 625  0024 a106          	cp	a,#6
 626  0026 2404          	jruge	L761
 629  0028 a605          	ld	a,#5
 630  002a 6b02          	ld	(OFST+0,sp),a
 631  002c               L761:
 632                     ; 138 		if( i>=85 )	i = 85;
 634  002c 7b02          	ld	a,(OFST+0,sp)
 635  002e a155          	cp	a,#85
 636  0030 2504          	jrult	L171
 639  0032 a655          	ld	a,#85
 640  0034 6b02          	ld	(OFST+0,sp),a
 641  0036               L171:
 642                     ; 139 		uiInfo.remote_banb[key] = i;
 644  0036 7b03          	ld	a,(OFST+1,sp)
 645  0038 5f            	clrw	x
 646  0039 97            	ld	xl,a
 647  003a 7b02          	ld	a,(OFST+0,sp)
 648  003c d70055        	ld	(_uiInfo+85,x),a
 649                     ; 140 		j = 1;
 651  003f a601          	ld	a,#1
 652  0041 6b01          	ld	(OFST-1,sp),a
 653  0043               L561:
 654                     ; 142 	if( _dsPrev != i )
 656  0043 c60000        	ld	a,__dsPrev
 657  0046 1102          	cp	a,(OFST+0,sp)
 658  0048 270f          	jreq	L371
 659                     ; 144 		_dsPrev = i;
 661  004a 7b02          	ld	a,(OFST+0,sp)
 662  004c c70000        	ld	__dsPrev,a
 663                     ; 145 		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
 665  004f 7b03          	ld	a,(OFST+1,sp)
 666  0051 5f            	clrw	x
 667  0052 97            	ld	xl,a
 668  0053 d60055        	ld	a,(_uiInfo+85,x)
 669  0056 cd0000        	call	_ui_disp_repeat_setup
 671  0059               L371:
 672                     ; 147 	return j;
 674  0059 7b01          	ld	a,(OFST-1,sp)
 677  005b 5b03          	addw	sp,#3
 678  005d 81            	ret
 735                     ; 150 uint8_t		disp_status_loop_host_N(uint8_t key)
 735                     ; 151 {
 736                     .text:	section	.text,new
 737  0000               _disp_status_loop_host_N:
 739  0000 89            	pushw	x
 740       00000002      OFST:	set	2
 743                     ; 153 	uint8_t	j = 0;
 745  0001 0f01          	clr	(OFST-1,sp)
 746                     ; 154 	i = uiInfo.tSetup;
 748  0003 c6000e        	ld	a,_uiInfo+14
 749  0006 6b02          	ld	(OFST+0,sp),a
 750                     ; 155 	if( uiInfo.enc != 0 )
 752  0008 725d0000      	tnz	_uiInfo
 753  000c 2733          	jreq	L512
 754                     ; 158 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 756  000e c60000        	ld	a,_uiInfo
 757  0011 a540          	bcp	a,#64
 758  0013 2604          	jrne	L43
 759  0015 a6ff          	ld	a,#255
 760  0017 2002          	jra	L63
 761  0019               L43:
 762  0019 a601          	ld	a,#1
 763  001b               L63:
 764  001b 1b02          	add	a,(OFST+0,sp)
 765  001d 6b02          	ld	(OFST+0,sp),a
 766                     ; 159 		if( i<=10 )	i = 10;
 768  001f 7b02          	ld	a,(OFST+0,sp)
 769  0021 a10b          	cp	a,#11
 770  0023 2404          	jruge	L712
 773  0025 a60a          	ld	a,#10
 774  0027 6b02          	ld	(OFST+0,sp),a
 775  0029               L712:
 776                     ; 160 		if( i>=80 )	i = 80;
 778  0029 7b02          	ld	a,(OFST+0,sp)
 779  002b a150          	cp	a,#80
 780  002d 2504          	jrult	L122
 783  002f a650          	ld	a,#80
 784  0031 6b02          	ld	(OFST+0,sp),a
 785  0033               L122:
 786                     ; 161 		uiInfo.tSetup = i;
 788  0033 7b02          	ld	a,(OFST+0,sp)
 789  0035 c7000e        	ld	_uiInfo+14,a
 790                     ; 162 		lcd_blink_item(bS6);
 792  0038 a611          	ld	a,#17
 793  003a cd0000        	call	_lcd_blink_item
 795                     ; 163 		j = 1;
 797  003d a601          	ld	a,#1
 798  003f 6b01          	ld	(OFST-1,sp),a
 799  0041               L512:
 800                     ; 165 	if( _dsPrev != i )
 802  0041 c60000        	ld	a,__dsPrev
 803  0044 1102          	cp	a,(OFST+0,sp)
 804  0046 2723          	jreq	L322
 805                     ; 167 		_dsPrev = i;
 807  0048 7b02          	ld	a,(OFST+0,sp)
 808  004a c70000        	ld	__dsPrev,a
 809                     ; 168 		ui_disp_temp_mark(1);
 811  004d a601          	ld	a,#1
 812  004f cd0000        	call	_ui_disp_temp_mark
 814                     ; 169 		ui_disp_temp_setup(uiInfo.tSetup);
 816  0052 c6000e        	ld	a,_uiInfo+14
 817  0055 cd0000        	call	_ui_disp_temp_setup
 819                     ; 170 		ui_disp_temp_curr(uiInfo.tCurr);
 821  0058 c60002        	ld	a,_uiInfo+2
 822  005b cd0000        	call	_ui_disp_temp_curr
 824                     ; 171 		UPDATE_BIT(BIT_TSETUP);
 826  005e 72140000      	bset	__updateBit,#2
 829  0062 5500000000    	mov	__updateTimer,___timer1s
 832  0067 35050000      	mov	__updateCount,#5
 834  006b               L322:
 835                     ; 173 	return j;
 837  006b 7b01          	ld	a,(OFST-1,sp)
 840  006d 85            	popw	x
 841  006e 81            	ret
 896                     ; 176 uint8_t	disp_status_loop_host_Y(uint8_t key)
 896                     ; 177 {
 897                     .text:	section	.text,new
 898  0000               _disp_status_loop_host_Y:
 900  0000 89            	pushw	x
 901       00000002      OFST:	set	2
 904                     ; 179 	uint8_t	j = 0;
 906  0001 0f01          	clr	(OFST-1,sp)
 907                     ; 180 	i = uiInfo.reserve;
 909  0003 c6000d        	ld	a,_uiInfo+13
 910  0006 6b02          	ld	(OFST+0,sp),a
 911                     ; 181 	if( uiInfo.enc != 0 )
 913  0008 725d0000      	tnz	_uiInfo
 914  000c 2733          	jreq	L542
 915                     ; 184 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 917  000e c60000        	ld	a,_uiInfo
 918  0011 a540          	bcp	a,#64
 919  0013 2604          	jrne	L24
 920  0015 a6ff          	ld	a,#255
 921  0017 2002          	jra	L44
 922  0019               L24:
 923  0019 a601          	ld	a,#1
 924  001b               L44:
 925  001b 1b02          	add	a,(OFST+0,sp)
 926  001d 6b02          	ld	(OFST+0,sp),a
 927                     ; 185 		if( i<=2 )	i = 2;
 929  001f 7b02          	ld	a,(OFST+0,sp)
 930  0021 a103          	cp	a,#3
 931  0023 2404          	jruge	L742
 934  0025 a602          	ld	a,#2
 935  0027 6b02          	ld	(OFST+0,sp),a
 936  0029               L742:
 937                     ; 186 		if( i>=48 )	i = 48;
 939  0029 7b02          	ld	a,(OFST+0,sp)
 940  002b a130          	cp	a,#48
 941  002d 2504          	jrult	L152
 944  002f a630          	ld	a,#48
 945  0031 6b02          	ld	(OFST+0,sp),a
 946  0033               L152:
 947                     ; 187 		uiInfo.reserve = i;
 949  0033 7b02          	ld	a,(OFST+0,sp)
 950  0035 c7000d        	ld	_uiInfo+13,a
 951                     ; 188 		lcd_blink_item(bS7);
 953  0038 a621          	ld	a,#33
 954  003a cd0000        	call	_lcd_blink_item
 956                     ; 189 		j = 1;
 958  003d a601          	ld	a,#1
 959  003f 6b01          	ld	(OFST-1,sp),a
 960  0041               L542:
 961                     ; 191 	if( _dsPrev != i )
 963  0041 c60000        	ld	a,__dsPrev
 964  0044 1102          	cp	a,(OFST+0,sp)
 965  0046 2718          	jreq	L352
 966                     ; 193 		_dsPrev = i;
 968  0048 7b02          	ld	a,(OFST+0,sp)
 969  004a c70000        	ld	__dsPrev,a
 970                     ; 194 		ui_disp_reserve_setup(uiInfo.reserve);
 972  004d c6000d        	ld	a,_uiInfo+13
 973  0050 cd0000        	call	_ui_disp_reserve_setup
 975                     ; 195 		UPDATE_BIT(BIT_RESERVE);
 977  0053 72120000      	bset	__updateBit,#1
 980  0057 5500000000    	mov	__updateTimer,___timer1s
 983  005c 35050000      	mov	__updateCount,#5
 985  0060               L352:
 986                     ; 197 	return j;
 988  0060 7b01          	ld	a,(OFST-1,sp)
 991  0062 85            	popw	x
 992  0063 81            	ret
1047                     ; 200 uint8_t		disp_status_loop_host_B(uint8_t key)
1047                     ; 201 {
1048                     .text:	section	.text,new
1049  0000               _disp_status_loop_host_B:
1051  0000 89            	pushw	x
1052       00000002      OFST:	set	2
1055                     ; 203 	uint8_t	j = 0;
1057  0001 0f01          	clr	(OFST-1,sp)
1058                     ; 204 	i = uiInfo.repeat;
1060  0003 c6000c        	ld	a,_uiInfo+12
1061  0006 6b02          	ld	(OFST+0,sp),a
1062                     ; 205 	if( uiInfo.enc != 0 )
1064  0008 725d0000      	tnz	_uiInfo
1065  000c 2733          	jreq	L572
1066                     ; 208 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
1068  000e c60000        	ld	a,_uiInfo
1069  0011 a540          	bcp	a,#64
1070  0013 2604          	jrne	L05
1071  0015 a6ff          	ld	a,#255
1072  0017 2002          	jra	L25
1073  0019               L05:
1074  0019 a601          	ld	a,#1
1075  001b               L25:
1076  001b 1b02          	add	a,(OFST+0,sp)
1077  001d 6b02          	ld	(OFST+0,sp),a
1078                     ; 209 		if( i<=5 )	i = 5;
1080  001f 7b02          	ld	a,(OFST+0,sp)
1081  0021 a106          	cp	a,#6
1082  0023 2404          	jruge	L772
1085  0025 a605          	ld	a,#5
1086  0027 6b02          	ld	(OFST+0,sp),a
1087  0029               L772:
1088                     ; 210 		if( i>=85 )	i = 85;
1090  0029 7b02          	ld	a,(OFST+0,sp)
1091  002b a155          	cp	a,#85
1092  002d 2504          	jrult	L103
1095  002f a655          	ld	a,#85
1096  0031 6b02          	ld	(OFST+0,sp),a
1097  0033               L103:
1098                     ; 211 		uiInfo.repeat = i;
1100  0033 7b02          	ld	a,(OFST+0,sp)
1101  0035 c7000c        	ld	_uiInfo+12,a
1102                     ; 212 		lcd_blink_item(bS8);
1104  0038 a631          	ld	a,#49
1105  003a cd0000        	call	_lcd_blink_item
1107                     ; 213 		j = 1;
1109  003d a601          	ld	a,#1
1110  003f 6b01          	ld	(OFST-1,sp),a
1111  0041               L572:
1112                     ; 215 	if( _dsPrev != i )
1114  0041 c60000        	ld	a,__dsPrev
1115  0044 1102          	cp	a,(OFST+0,sp)
1116  0046 2718          	jreq	L303
1117                     ; 217 		_dsPrev = i;
1119  0048 7b02          	ld	a,(OFST+0,sp)
1120  004a c70000        	ld	__dsPrev,a
1121                     ; 218 		ui_disp_repeat_setup(uiInfo.repeat);
1123  004d c6000c        	ld	a,_uiInfo+12
1124  0050 cd0000        	call	_ui_disp_repeat_setup
1126                     ; 219 		UPDATE_BIT(BIT_REPEAT);
1128  0053 72100000      	bset	__updateBit,#0
1131  0057 5500000000    	mov	__updateTimer,___timer1s
1134  005c 35050000      	mov	__updateCount,#5
1136  0060               L303:
1137                     ; 221 	return j;
1139  0060 7b01          	ld	a,(OFST-1,sp)
1142  0062 85            	popw	x
1143  0063 81            	ret
1146                     	switch	.data
1147  0007               __key_blink:
1148  0007 00            	dc.b	0
1198                     ; 227 void	disp_rid_info(void)
1198                     ; 228 {
1199                     .text:	section	.text,new
1200  0000               _disp_rid_info:
1202  0000 5203          	subw	sp,#3
1203       00000003      OFST:	set	3
1206                     ; 234 	j = uiInfo.cnt + uiInfo.cnt_sub;
1208  0002 c60005        	ld	a,_uiInfo+5
1209  0005 cb0006        	add	a,_uiInfo+6
1210  0008 6b01          	ld	(OFST-2,sp),a
1211                     ; 235 	for( i=1; i<j; i++ )
1213  000a a601          	ld	a,#1
1214  000c 6b03          	ld	(OFST+0,sp),a
1216  000e 203b          	jra	L133
1217  0010               L523:
1218                     ; 237 		if( i >= 8 )
1220  0010 7b03          	ld	a,(OFST+0,sp)
1221  0012 a108          	cp	a,#8
1222  0014 2503          	jrult	L533
1223                     ; 238 			break;
1224  0016               L333:
1225                     ; 246 }
1228  0016 5b03          	addw	sp,#3
1229  0018 81            	ret
1230  0019               L533:
1231                     ; 239 		if( packet_buf[i] != 10 ){
1233  0019 7b03          	ld	a,(OFST+0,sp)
1234  001b 5f            	clrw	x
1235  001c 97            	ld	xl,a
1236  001d d60000        	ld	a,(_packet_buf,x)
1237  0020 a10a          	cp	a,#10
1238  0022 271b          	jreq	L733
1239                     ; 240 			led = getHexToBin(_rcLED, i);
1241  0024 7b03          	ld	a,(OFST+0,sp)
1242  0026 97            	ld	xl,a
1243  0027 c60000        	ld	a,__rcLED
1244  002a 95            	ld	xh,a
1245  002b cd0000        	call	_getHexToBin
1247  002e 6b02          	ld	(OFST-1,sp),a
1248                     ; 241 			lcd_disp_rid(i + 1, led, 1);
1250  0030 4b01          	push	#1
1251  0032 7b03          	ld	a,(OFST+0,sp)
1252  0034 97            	ld	xl,a
1253  0035 7b04          	ld	a,(OFST+1,sp)
1254  0037 4c            	inc	a
1255  0038 95            	ld	xh,a
1256  0039 cd0000        	call	_lcd_disp_rid
1258  003c 84            	pop	a
1260  003d 200a          	jra	L143
1261  003f               L733:
1262                     ; 244 			lcd_clear_rid_n(i+1, 1);
1264  003f ae0001        	ldw	x,#1
1265  0042 7b03          	ld	a,(OFST+0,sp)
1266  0044 4c            	inc	a
1267  0045 95            	ld	xh,a
1268  0046 cd0000        	call	_lcd_clear_rid_n
1270  0049               L143:
1271                     ; 235 	for( i=1; i<j; i++ )
1273  0049 0c03          	inc	(OFST+0,sp)
1274  004b               L133:
1277  004b 7b03          	ld	a,(OFST+0,sp)
1278  004d 1101          	cp	a,(OFST-2,sp)
1279  004f 25bf          	jrult	L523
1280  0051 20c3          	jra	L333
1380                     ; 248 void	disp_status_loop_host(uint8_t key)
1380                     ; 249 {
1381                     .text:	section	.text,new
1382  0000               _disp_status_loop_host:
1384  0000 88            	push	a
1385  0001 89            	pushw	x
1386       00000002      OFST:	set	2
1389                     ; 250 	uint8_t	i = 0;
1391  0002 0f02          	clr	(OFST+0,sp)
1392                     ; 251 	uint8_t	j = 0;
1394                     ; 252 	uint8_t	k = 0;
1396  0004 0f01          	clr	(OFST-1,sp)
1397                     ; 267 	if (_remote == 0) {
1399  0006 725d0004      	tnz	__remote
1400  000a 2603          	jrne	L124
1401                     ; 268 		disp_rid_info();
1403  000c cd0000        	call	_disp_rid_info
1405  000f               L124:
1406                     ; 271 	_disp_temp = 0;
1408  000f 725f0000      	clr	__disp_temp
1409                     ; 272 	if( __s == 0 )
1411  0013 725d0000      	tnz	___s
1412  0017 2703          	jreq	L27
1413  0019 cc0269        	jp	L324
1414  001c               L27:
1415                     ; 274 		if( _dsCount == 0 )
1417  001c 725d0000      	tnz	__dsCount
1418  0020 2613          	jrne	L524
1419                     ; 276 			_dsCount = 1;
1421  0022 35010000      	mov	__dsCount,#1
1422                     ; 277 			__sUp = 0;
1424  0026 725f0000      	clr	___sUp
1425                     ; 278 			__sDn = 0xff;
1427  002a 35ff0000      	mov	___sDn,#255
1428                     ; 279 			disp_status_loop_init();
1430  002e cd0000        	call	_disp_status_loop_init
1433  0031 ac3d083d      	jpf	L306
1434  0035               L524:
1435                     ; 280 		} else if (_dsCount == 9) {
1437  0035 c60000        	ld	a,__dsCount
1438  0038 a109          	cp	a,#9
1439  003a 260f          	jrne	L134
1440                     ; 281 			_dsCount = 1;
1442  003c 35010000      	mov	__dsCount,#1
1443                     ; 282 			__sDn = 0xff;
1445  0040 35ff0000      	mov	___sDn,#255
1446                     ; 283 			disp_status_loop_init();
1448  0044 cd0000        	call	_disp_status_loop_init
1451  0047 ac3d083d      	jpf	L306
1452  004b               L134:
1453                     ; 285 		else if( _dsCount == 10 )
1455  004b c60000        	ld	a,__dsCount
1456  004e a10a          	cp	a,#10
1457  0050 260f          	jrne	L534
1458                     ; 287 			_dsCount = 1;
1460  0052 35010000      	mov	__dsCount,#1
1461                     ; 288 			__sDn = 0xff;
1463  0056 35ff0000      	mov	___sDn,#255
1464                     ; 289 			disp_status_loop_init();
1466  005a cd0000        	call	_disp_status_loop_init
1469  005d ac3d083d      	jpf	L306
1470  0061               L534:
1471                     ; 291 		else if( _dsCount == 11 )
1473  0061 c60000        	ld	a,__dsCount
1474  0064 a10b          	cp	a,#11
1475  0066 2618          	jrne	L144
1476                     ; 293 			_dsCount = 2;
1478  0068 35020000      	mov	__dsCount,#2
1479                     ; 294 			__sUp = 0xff;
1481  006c 35ff0000      	mov	___sUp,#255
1482                     ; 295 			disp_status_loop_init();
1484  0070 cd0000        	call	_disp_status_loop_init
1486                     ; 296 			disp_status_loop_messageDn(__sDn);
1488  0073 c60000        	ld	a,___sDn
1489  0076 cd0000        	call	_disp_status_loop_messageDn
1491                     ; 297 			disp_status_curr_only();
1493  0079 cd0000        	call	_disp_status_curr_only
1496  007c ac3d083d      	jpf	L306
1497  0080               L144:
1498                     ; 299 		else if( _dsCount == 1 )
1500  0080 c60000        	ld	a,__dsCount
1501  0083 a101          	cp	a,#1
1502  0085 2703          	jreq	L47
1503  0087 cc01fc        	jp	L544
1504  008a               L47:
1505                     ; 304 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
1507  008a 725d0000      	tnz	___sUp
1508  008e 2609          	jrne	L744
1511  0090 7b03          	ld	a,(OFST+1,sp)
1512  0092 cd0000        	call	_disp_status_loop_host_N
1514  0095 6b02          	ld	(OFST+0,sp),a
1516  0097 201e          	jra	L154
1517  0099               L744:
1518                     ; 305 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
1520  0099 c60000        	ld	a,___sUp
1521  009c a101          	cp	a,#1
1522  009e 2609          	jrne	L354
1525  00a0 7b03          	ld	a,(OFST+1,sp)
1526  00a2 cd0000        	call	_disp_status_loop_host_Y
1528  00a5 6b02          	ld	(OFST+0,sp),a
1530  00a7 200e          	jra	L154
1531  00a9               L354:
1532                     ; 306 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
1534  00a9 c60000        	ld	a,___sUp
1535  00ac a102          	cp	a,#2
1536  00ae 2607          	jrne	L154
1539  00b0 7b03          	ld	a,(OFST+1,sp)
1540  00b2 cd0000        	call	_disp_status_loop_host_B
1542  00b5 6b02          	ld	(OFST+0,sp),a
1543  00b7               L154:
1544                     ; 308 			if( i==1 )
1546  00b7 7b02          	ld	a,(OFST+0,sp)
1547  00b9 a101          	cp	a,#1
1548  00bb 2604          	jrne	L164
1549                     ; 309 				_key_blink = 1;
1551  00bd 35010007      	mov	__key_blink,#1
1552  00c1               L164:
1553                     ; 312 			_disp_temp = __sUp==0 ? 1 : 0;
1555  00c1 725d0000      	tnz	___sUp
1556  00c5 2604          	jrne	L06
1557  00c7 a601          	ld	a,#1
1558  00c9 2001          	jra	L26
1559  00cb               L06:
1560  00cb 4f            	clr	a
1561  00cc               L26:
1562  00cc c70000        	ld	__disp_temp,a
1563                     ; 313 			if( _disp_temp == 0 && _key_blink == 0 )
1565  00cf 725d0000      	tnz	__disp_temp
1566  00d3 2626          	jrne	L364
1568  00d5 725d0007      	tnz	__key_blink
1569  00d9 2620          	jrne	L364
1570                     ; 315 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
1572  00db c60000        	ld	a,___sUp
1573  00de a101          	cp	a,#1
1574  00e0 2715          	jreq	L764
1576  00e2 c60000        	ld	a,___sUp
1577  00e5 a102          	cp	a,#2
1578  00e7 270e          	jreq	L764
1580  00e9 c60000        	ld	a,___sUp
1581  00ec a105          	cp	a,#5
1582  00ee 2707          	jreq	L764
1584  00f0 c60000        	ld	a,___sUp
1585  00f3 a108          	cp	a,#8
1586  00f5 2604          	jrne	L364
1587  00f7               L764:
1588                     ; 316 					_disp_temp = 1;
1590  00f7 35010000      	mov	__disp_temp,#1
1591  00fb               L364:
1592                     ; 319 			if( key == 1 )
1594  00fb 7b03          	ld	a,(OFST+1,sp)
1595  00fd a101          	cp	a,#1
1596  00ff 263a          	jrne	L574
1597                     ; 321 				__sUp = (__sUp+1) % 3;
1599  0101 c60000        	ld	a,___sUp
1600  0104 5f            	clrw	x
1601  0105 97            	ld	xl,a
1602  0106 5c            	incw	x
1603  0107 a603          	ld	a,#3
1604  0109 cd0000        	call	c_smodx
1606  010c 01            	rrwa	x,a
1607  010d c70000        	ld	___sUp,a
1608  0110 02            	rlwa	x,a
1609  0111 acc701c7      	jpf	L343
1610  0115               L774:
1611                     ; 324 				else if( __sUp == 1 )	i = bS7;
1613  0115 c60000        	ld	a,___sUp
1614  0118 a101          	cp	a,#1
1615  011a 2606          	jrne	L305
1618  011c a621          	ld	a,#33
1619  011e 6b02          	ld	(OFST+0,sp),a
1621  0120 2004          	jra	L105
1622  0122               L305:
1623                     ; 325 				else					i = bS8;
1625  0122 a631          	ld	a,#49
1626  0124 6b02          	ld	(OFST+0,sp),a
1627  0126               L105:
1628                     ; 326 				lcd_blink_item(i);
1630  0126 7b02          	ld	a,(OFST+0,sp)
1631  0128 cd0000        	call	_lcd_blink_item
1633                     ; 327 				disp_status_loop_message(__sUp);
1635  012b c60000        	ld	a,___sUp
1636  012e cd0000        	call	_disp_status_loop_message
1638                     ; 328 				_dsPrev = 0xff;
1640  0131 35ff0000      	mov	__dsPrev,#255
1641                     ; 330 				_key_blink = 1;
1643  0135 35010007      	mov	__key_blink,#1
1645  0139 204b          	jra	L705
1646  013b               L574:
1647                     ; 332 			else if( key == 2 )
1649  013b 7b03          	ld	a,(OFST+1,sp)
1650  013d a102          	cp	a,#2
1651  013f 2620          	jrne	L115
1652                     ; 334 				__sUp = 0xff;
1654  0141 35ff0000      	mov	___sUp,#255
1655                     ; 335 				__sDn = 0;
1657  0145 725f0000      	clr	___sDn
1658                     ; 336 				disp_status_loop_messageDn(__sDn);
1660  0149 4f            	clr	a
1661  014a cd0000        	call	_disp_status_loop_messageDn
1663                     ; 337 				disp_status_curr_only();
1665  014d cd0000        	call	_disp_status_curr_only
1667                     ; 338 				lcd_blink_clear();
1669  0150 cd0000        	call	_lcd_blink_clear
1671                     ; 339 				_dsCount = 2;
1673  0153 35020000      	mov	__dsCount,#2
1674                     ; 340 				_dsPrev = 0xff;
1676  0157 35ff0000      	mov	__dsPrev,#255
1677                     ; 342 				_key_blink = 0;
1679  015b 725f0007      	clr	__key_blink
1681  015f 2025          	jra	L705
1682  0161               L115:
1683                     ; 344 			else if( key == 3 )
1685  0161 7b03          	ld	a,(OFST+1,sp)
1686  0163 a103          	cp	a,#3
1687  0165 2671          	jrne	L515
1688                     ; 346 				if( __sUp == 0 )
1690  0167 725d0000      	tnz	___sUp
1691  016b 263c          	jrne	L715
1692                     ; 348 					if( _key_blink == 0 )
1694  016d 725d0007      	tnz	__key_blink
1695  0171 260c          	jrne	L725
1696  0173 ac3f023f      	jpf	L543
1697  0177               L325:
1698                     ; 354 							__s = 1;
1700  0177 35010000      	mov	___s,#1
1701  017b               L525:
1702                     ; 355 						_dsCount = 0;
1704  017b 725f0000      	clr	__dsCount
1705  017f               L725:
1706                     ; 368 				disp_status_loop_init();
1708  017f cd0000        	call	_disp_status_loop_init
1710                     ; 370 				_key_blink = 0;
1712  0182 725f0007      	clr	__key_blink
1714  0186               L705:
1715                     ; 387 			if( _key_blink == 1 )
1717  0186 c60007        	ld	a,__key_blink
1718  0189 a101          	cp	a,#1
1719  018b 2703          	jreq	L67
1720  018d cc083d        	jp	L306
1721  0190               L67:
1722                     ; 389 				if( _key_sec >= KEY_BLINK_FADE )
1724  0190 c60000        	ld	a,__key_sec
1725  0193 a10a          	cp	a,#10
1726  0195 2403          	jruge	L001
1727  0197 cc083d        	jp	L306
1728  019a               L001:
1729                     ; 392 					lcd_blink_clear();
1731  019a cd0000        	call	_lcd_blink_clear
1733                     ; 393 					_key_blink = 0;
1735  019d 725f0007      	clr	__key_blink
1736                     ; 394 					_dsCount = 10;
1738  01a1 350a0000      	mov	__dsCount,#10
1739  01a5 ac3d083d      	jpf	L306
1740  01a9               L715:
1741                     ; 358 				else if( __sUp == 1 )	
1743  01a9 c60000        	ld	a,___sUp
1744  01ac a101          	cp	a,#1
1745  01ae 2609          	jrne	L135
1746                     ; 360 					if( _key_blink != 1 )
1748  01b0 c60007        	ld	a,__key_blink
1749  01b3 a101          	cp	a,#1
1750  01b5 27c8          	jreq	L725
1751                     ; 361 						goto SetupEntry2;
1753  01b7 200e          	jra	L343
1754  01b9               L135:
1755                     ; 363 				else if( __sUp == 2 )	
1757  01b9 c60000        	ld	a,___sUp
1758  01bc a102          	cp	a,#2
1759  01be 26bf          	jrne	L725
1760                     ; 365 					if( _key_blink != 1 )
1762  01c0 c60007        	ld	a,__key_blink
1763  01c3 a101          	cp	a,#1
1764  01c5 27b8          	jreq	L725
1765                     ; 366 						goto SetupEntry2;
1766  01c7               L343:
1767                     ; 322 SetupEntry2:				
1767                     ; 323 				if( __sUp == 0 )		i = bS6;
1769  01c7 725d0000      	tnz	___sUp
1770  01cb 2703          	jreq	L201
1771  01cd cc0115        	jp	L774
1772  01d0               L201:
1775  01d0 a611          	ld	a,#17
1776  01d2 6b02          	ld	(OFST+0,sp),a
1778  01d4 ac260126      	jpf	L105
1779  01d8               L515:
1780                     ; 372 			else if( key == 4 )
1782  01d8 7b03          	ld	a,(OFST+1,sp)
1783  01da a104          	cp	a,#4
1784  01dc 26a8          	jrne	L705
1785                     ; 374 				if( _key_blink == 1 )
1787  01de c60007        	ld	a,__key_blink
1788  01e1 a101          	cp	a,#1
1789  01e3 2609          	jrne	L745
1790                     ; 377 					disp_status_loop_init();
1792  01e5 cd0000        	call	_disp_status_loop_init
1794                     ; 378 					_key_blink = 0;
1796  01e8 725f0007      	clr	__key_blink
1798  01ec 2098          	jra	L705
1799  01ee               L745:
1800                     ; 382 					__s = 3;
1802  01ee 35030000      	mov	___s,#3
1803                     ; 383 					_dsCount = 0;
1805  01f2 725f0000      	clr	__dsCount
1806                     ; 384 					_dsPrev = 0xff;
1808  01f6 35ff0000      	mov	__dsPrev,#255
1809  01fa 208a          	jra	L705
1810  01fc               L544:
1811                     ; 398 		else if( _dsCount == 2 )
1813  01fc c60000        	ld	a,__dsCount
1814  01ff a102          	cp	a,#2
1815  0201 2703          	jreq	L401
1816  0203 cc083d        	jp	L306
1817  0206               L401:
1818                     ; 400 			_disp_temp = 1;
1820  0206 35010000      	mov	__disp_temp,#1
1821                     ; 401 			if( key == 1 )
1823  020a 7b03          	ld	a,(OFST+1,sp)
1824  020c a101          	cp	a,#1
1825  020e 260a          	jrne	L365
1826                     ; 403 				__sUp = 0;
1828  0210 725f0000      	clr	___sUp
1829                     ; 404 				_dsCount = 0;
1831  0214 725f0000      	clr	__dsCount
1833  0218 203a          	jra	L565
1834  021a               L365:
1835                     ; 406 			else if( key == 2 )
1837  021a 7b03          	ld	a,(OFST+1,sp)
1838  021c a102          	cp	a,#2
1839  021e 2619          	jrne	L765
1840                     ; 408 				__sDn = __sDn==0 ? 1 : 0;
1842  0220 725d0000      	tnz	___sDn
1843  0224 2604          	jrne	L46
1844  0226 a601          	ld	a,#1
1845  0228 2001          	jra	L66
1846  022a               L46:
1847  022a 4f            	clr	a
1848  022b               L66:
1849  022b c70000        	ld	___sDn,a
1850                     ; 409 				disp_status_loop_messageDn(__sDn);
1852  022e c60000        	ld	a,___sDn
1853  0231 cd0000        	call	_disp_status_loop_messageDn
1855                     ; 410 				disp_status_curr_only();
1857  0234 cd0000        	call	_disp_status_curr_only
1860  0237 201b          	jra	L565
1861  0239               L765:
1862                     ; 412 			else if( key == 3 )	{	goto SetupEntry;	}
1864  0239 7b03          	ld	a,(OFST+1,sp)
1865  023b a103          	cp	a,#3
1866  023d 2611          	jrne	L375
1868  023f               L543:
1869                     ; 350 SetupEntry:				
1869                     ; 351 						if( uiInfo.cntlMode == 0 )
1871  023f 725d0003      	tnz	_uiInfo+3
1872  0243 2703          	jreq	L601
1873  0245 cc0177        	jp	L325
1874  0248               L601:
1875                     ; 352 							__s = 4;
1877  0248 35040000      	mov	___s,#4
1879  024c ac7b017b      	jpf	L525
1880  0250               L375:
1881                     ; 413 			else if( key == 4 )
1883  0250 7b03          	ld	a,(OFST+1,sp)
1884  0252 a104          	cp	a,#4
1885  0254               L565:
1886                     ; 416 			if( uiInfo.enc != 0 )
1888  0254 725d0000      	tnz	_uiInfo
1889  0258 2603          	jrne	L011
1890  025a cc083d        	jp	L306
1891  025d               L011:
1892                     ; 418 				__sUp = 0;
1894  025d 725f0000      	clr	___sUp
1895                     ; 419 				_dsCount = 0;
1897  0261 725f0000      	clr	__dsCount
1898  0265 ac3d083d      	jpf	L306
1899  0269               L324:
1900                     ; 423 	else if( __s == 1 )
1902  0269 c60000        	ld	a,___s
1903  026c a101          	cp	a,#1
1904  026e 2703          	jreq	L211
1905  0270 cc03e1        	jp	L506
1906  0273               L211:
1907                     ; 426 		if( _dsCount == 0 )
1909  0273 725d0000      	tnz	__dsCount
1910  0277 2653          	jrne	L706
1911                     ; 428 			lcd_clear(0);
1913  0279 4f            	clr	a
1914  027a cd0000        	call	_lcd_clear
1916                     ; 429 			__sInfo = 1;
1918  027d 35010000      	mov	___sInfo,#1
1919                     ; 430 			lcd_disp_info(__sInfo, 0, 0);
1921  0281 4b00          	push	#0
1922  0283 ae0100        	ldw	x,#256
1923  0286 cd0000        	call	_lcd_disp_info
1925  0289 84            	pop	a
1926                     ; 431 			UI_DISP_2Digit(_boiler_water_heat);
1928  028a c60002        	ld	a,__boiler_water_heat
1929  028d 5f            	clrw	x
1930  028e 97            	ld	xl,a
1931  028f a60a          	ld	a,#10
1932  0291 62            	div	x,a
1933  0292 9f            	ld	a,xl
1934  0293 97            	ld	xl,a
1935  0294 a602          	ld	a,#2
1936  0296 95            	ld	xh,a
1937  0297 cd0000        	call	_lcd_disp_n
1941  029a c60002        	ld	a,__boiler_water_heat
1942  029d 5f            	clrw	x
1943  029e 97            	ld	xl,a
1944  029f a60a          	ld	a,#10
1945  02a1 62            	div	x,a
1946  02a2 5f            	clrw	x
1947  02a3 97            	ld	xl,a
1948  02a4 9f            	ld	a,xl
1949  02a5 97            	ld	xl,a
1950  02a6 a603          	ld	a,#3
1951  02a8 95            	ld	xh,a
1952  02a9 cd0000        	call	_lcd_disp_n
1954                     ; 432 			LCD_BIT_SET(bC2);
1957  02ac c6001b        	ld	a,_iLF_DEF+27
1958  02af 5f            	clrw	x
1959  02b0 97            	ld	xl,a
1960  02b1 d6540c        	ld	a,(21516,x)
1961  02b4 ca001b        	or	a,_bLF_DEF+27
1962  02b7 d7540c        	ld	(21516,x),a
1963                     ; 433 			lcd_disp_info_shower(0x08, 0);
1965  02ba ae0800        	ldw	x,#2048
1966  02bd cd0000        	call	_lcd_disp_info_shower
1968                     ; 434 			_dsCount = 1;
1970  02c0 35010000      	mov	__dsCount,#1
1971                     ; 435 			_dsPrev = 0xff;
1973  02c4 35ff0000      	mov	__dsPrev,#255
1975  02c8 ac3d083d      	jpf	L306
1976  02cc               L706:
1977                     ; 437 		else if( _dsCount == 1 )
1979  02cc c60000        	ld	a,__dsCount
1980  02cf a101          	cp	a,#1
1981  02d1 2703          	jreq	L411
1982  02d3 cc083d        	jp	L306
1983  02d6               L411:
1984                     ; 439 			i = _boiler_water_heat;
1986  02d6 c60002        	ld	a,__boiler_water_heat
1987  02d9 6b02          	ld	(OFST+0,sp),a
1988                     ; 440 			if( uiInfo.enc != 0 )
1990  02db 725d0000      	tnz	_uiInfo
1991  02df 2732          	jreq	L516
1992                     ; 442 				ENC_MOVE_0(40,80,5);
1994  02e1 c60000        	ld	a,_uiInfo
1995  02e4 a540          	bcp	a,#64
1996  02e6 2614          	jrne	L716
1999  02e8 7b02          	ld	a,(OFST+0,sp)
2000  02ea a129          	cp	a,#41
2001  02ec 2406          	jruge	L126
2004  02ee a650          	ld	a,#80
2005  02f0 6b02          	ld	(OFST+0,sp),a
2007  02f2 201a          	jra	L526
2008  02f4               L126:
2011  02f4 7b02          	ld	a,(OFST+0,sp)
2012  02f6 a005          	sub	a,#5
2013  02f8 6b02          	ld	(OFST+0,sp),a
2014  02fa 2012          	jra	L526
2015  02fc               L716:
2018  02fc 7b02          	ld	a,(OFST+0,sp)
2019  02fe a150          	cp	a,#80
2020  0300 2506          	jrult	L726
2023  0302 a628          	ld	a,#40
2024  0304 6b02          	ld	(OFST+0,sp),a
2026  0306 2006          	jra	L526
2027  0308               L726:
2030  0308 7b02          	ld	a,(OFST+0,sp)
2031  030a ab05          	add	a,#5
2032  030c 6b02          	ld	(OFST+0,sp),a
2033  030e               L526:
2034                     ; 443 				_boiler_water_heat = i;
2037  030e 7b02          	ld	a,(OFST+0,sp)
2038  0310 c70002        	ld	__boiler_water_heat,a
2039  0313               L516:
2040                     ; 445 			if( _dsPrev != i )
2042  0313 c60000        	ld	a,__dsPrev
2043  0316 1102          	cp	a,(OFST+0,sp)
2044  0318 2725          	jreq	L336
2045                     ; 447 				_dsPrev = i;
2047  031a 7b02          	ld	a,(OFST+0,sp)
2048  031c c70000        	ld	__dsPrev,a
2049                     ; 448 				UI_DISP_2Digit(i);
2051  031f 7b02          	ld	a,(OFST+0,sp)
2052  0321 5f            	clrw	x
2053  0322 97            	ld	xl,a
2054  0323 a60a          	ld	a,#10
2055  0325 62            	div	x,a
2056  0326 9f            	ld	a,xl
2057  0327 97            	ld	xl,a
2058  0328 a602          	ld	a,#2
2059  032a 95            	ld	xh,a
2060  032b cd0000        	call	_lcd_disp_n
2064  032e 7b02          	ld	a,(OFST+0,sp)
2065  0330 5f            	clrw	x
2066  0331 97            	ld	xl,a
2067  0332 a60a          	ld	a,#10
2068  0334 62            	div	x,a
2069  0335 5f            	clrw	x
2070  0336 97            	ld	xl,a
2071  0337 9f            	ld	a,xl
2072  0338 97            	ld	xl,a
2073  0339 a603          	ld	a,#3
2074  033b 95            	ld	xh,a
2075  033c cd0000        	call	_lcd_disp_n
2078  033f               L336:
2079                     ; 451 			if( key == 1 )		{	EXIT_HOST(0);	}
2081  033f 7b03          	ld	a,(OFST+1,sp)
2082  0341 a101          	cp	a,#1
2083  0343 261e          	jrne	L536
2086  0345 725f0000      	clr	___s
2089  0349 725f0000      	clr	__dsCount
2092  034d 35ff0000      	mov	__dsPrev,#255
2095  0351 cd0000        	call	_lcd_blink_clear
2099  0354 4b00          	push	#0
2100  0356 ae0001        	ldw	x,#1
2101  0359 c60000        	ld	a,___sInfo
2102  035c 95            	ld	xh,a
2103  035d cd0000        	call	_lcd_disp_info
2105  0360 84            	pop	a
2108  0361 2054          	jra	L736
2109  0363               L536:
2110                     ; 452 			else if( key == 2 )	{	EXIT_HOST3(0);	}
2112  0363 7b03          	ld	a,(OFST+1,sp)
2113  0365 a102          	cp	a,#2
2114  0367 2622          	jrne	L146
2117  0369 725f0000      	clr	___s
2120  036d 725f0000      	clr	___sDn
2123  0371 350b0000      	mov	__dsCount,#11
2126  0375 35ff0000      	mov	__dsPrev,#255
2129  0379 cd0000        	call	_lcd_blink_clear
2133  037c 4b00          	push	#0
2134  037e ae0001        	ldw	x,#1
2135  0381 c60000        	ld	a,___sInfo
2136  0384 95            	ld	xh,a
2137  0385 cd0000        	call	_lcd_disp_info
2139  0388 84            	pop	a
2142  0389 202c          	jra	L736
2143  038b               L146:
2144                     ; 453 			else if( key == 3 )	{	EXIT_HOST(0);	__s = 2;	}
2146  038b 7b03          	ld	a,(OFST+1,sp)
2147  038d a103          	cp	a,#3
2148  038f 2622          	jrne	L546
2151  0391 725f0000      	clr	___s
2154  0395 725f0000      	clr	__dsCount
2157  0399 35ff0000      	mov	__dsPrev,#255
2160  039d cd0000        	call	_lcd_blink_clear
2164  03a0 4b00          	push	#0
2165  03a2 ae0001        	ldw	x,#1
2166  03a5 c60000        	ld	a,___sInfo
2167  03a8 95            	ld	xh,a
2168  03a9 cd0000        	call	_lcd_disp_info
2170  03ac 84            	pop	a
2174  03ad 35020000      	mov	___s,#2
2176  03b1 2004          	jra	L736
2177  03b3               L546:
2178                     ; 454 			else if( key == 4 )	{
2180  03b3 7b03          	ld	a,(OFST+1,sp)
2181  03b5 a104          	cp	a,#4
2182  03b7               L736:
2183                     ; 456 			if( _key_min == KEY_BOILER_FADE )
2185  03b7 c60000        	ld	a,__key_min
2186  03ba a10a          	cp	a,#10
2187  03bc 2703          	jreq	L611
2188  03be cc083d        	jp	L306
2189  03c1               L611:
2190                     ; 459 				EXIT_HOST(0);
2192  03c1 725f0000      	clr	___s
2195  03c5 725f0000      	clr	__dsCount
2198  03c9 35ff0000      	mov	__dsPrev,#255
2201  03cd cd0000        	call	_lcd_blink_clear
2205  03d0 4b00          	push	#0
2206  03d2 ae0001        	ldw	x,#1
2207  03d5 c60000        	ld	a,___sInfo
2208  03d8 95            	ld	xh,a
2209  03d9 cd0000        	call	_lcd_disp_info
2211  03dc 84            	pop	a
2213  03dd ac3d083d      	jpf	L306
2214  03e1               L506:
2215                     ; 463 	else if( __s == 2 )
2217  03e1 c60000        	ld	a,___s
2218  03e4 a102          	cp	a,#2
2219  03e6 2703          	jreq	L021
2220  03e8 cc0548        	jp	L756
2221  03eb               L021:
2222                     ; 466 		if( _dsCount == 0 )
2224  03eb 725d0000      	tnz	__dsCount
2225  03ef 2653          	jrne	L166
2226                     ; 468 			lcd_clear(0);
2228  03f1 4f            	clr	a
2229  03f2 cd0000        	call	_lcd_clear
2231                     ; 469 			__sInfo = 2;
2233  03f5 35020000      	mov	___sInfo,#2
2234                     ; 470 			lcd_disp_info(__sInfo, 0, 0);
2236  03f9 4b00          	push	#0
2237  03fb ae0200        	ldw	x,#512
2238  03fe cd0000        	call	_lcd_disp_info
2240  0401 84            	pop	a
2241                     ; 471 			UI_DISP_2Digit(_boiler_water_shower);
2243  0402 c60001        	ld	a,__boiler_water_shower
2244  0405 5f            	clrw	x
2245  0406 97            	ld	xl,a
2246  0407 a60a          	ld	a,#10
2247  0409 62            	div	x,a
2248  040a 9f            	ld	a,xl
2249  040b 97            	ld	xl,a
2250  040c a602          	ld	a,#2
2251  040e 95            	ld	xh,a
2252  040f cd0000        	call	_lcd_disp_n
2256  0412 c60001        	ld	a,__boiler_water_shower
2257  0415 5f            	clrw	x
2258  0416 97            	ld	xl,a
2259  0417 a60a          	ld	a,#10
2260  0419 62            	div	x,a
2261  041a 5f            	clrw	x
2262  041b 97            	ld	xl,a
2263  041c 9f            	ld	a,xl
2264  041d 97            	ld	xl,a
2265  041e a603          	ld	a,#3
2266  0420 95            	ld	xh,a
2267  0421 cd0000        	call	_lcd_disp_n
2269                     ; 472 			LCD_BIT_SET(bC2);
2272  0424 c6001b        	ld	a,_iLF_DEF+27
2273  0427 5f            	clrw	x
2274  0428 97            	ld	xl,a
2275  0429 d6540c        	ld	a,(21516,x)
2276  042c ca001b        	or	a,_bLF_DEF+27
2277  042f d7540c        	ld	(21516,x),a
2278                     ; 473 			lcd_disp_info_shower(0x80, 0);
2280  0432 ae8000        	ldw	x,#32768
2281  0435 cd0000        	call	_lcd_disp_info_shower
2283                     ; 474 			_dsCount = 1;
2285  0438 35010000      	mov	__dsCount,#1
2286                     ; 475 			_dsPrev = 0xff;
2288  043c 35ff0000      	mov	__dsPrev,#255
2290  0440 ac3d083d      	jpf	L306
2291  0444               L166:
2292                     ; 477 		else if( _dsCount == 1 )
2294  0444 c60000        	ld	a,__dsCount
2295  0447 a101          	cp	a,#1
2296  0449 2703          	jreq	L221
2297  044b cc083d        	jp	L306
2298  044e               L221:
2299                     ; 479 			i = _boiler_water_shower;
2301  044e c60001        	ld	a,__boiler_water_shower
2302  0451 6b02          	ld	(OFST+0,sp),a
2303                     ; 480 			if( uiInfo.enc != 0 )
2305  0453 725d0000      	tnz	_uiInfo
2306  0457 2732          	jreq	L766
2307                     ; 482 				ENC_MOVE_0(40,70,5);
2309  0459 c60000        	ld	a,_uiInfo
2310  045c a540          	bcp	a,#64
2311  045e 2614          	jrne	L176
2314  0460 7b02          	ld	a,(OFST+0,sp)
2315  0462 a129          	cp	a,#41
2316  0464 2406          	jruge	L376
2319  0466 a646          	ld	a,#70
2320  0468 6b02          	ld	(OFST+0,sp),a
2322  046a 201a          	jra	L776
2323  046c               L376:
2326  046c 7b02          	ld	a,(OFST+0,sp)
2327  046e a005          	sub	a,#5
2328  0470 6b02          	ld	(OFST+0,sp),a
2329  0472 2012          	jra	L776
2330  0474               L176:
2333  0474 7b02          	ld	a,(OFST+0,sp)
2334  0476 a146          	cp	a,#70
2335  0478 2506          	jrult	L107
2338  047a a628          	ld	a,#40
2339  047c 6b02          	ld	(OFST+0,sp),a
2341  047e 2006          	jra	L776
2342  0480               L107:
2345  0480 7b02          	ld	a,(OFST+0,sp)
2346  0482 ab05          	add	a,#5
2347  0484 6b02          	ld	(OFST+0,sp),a
2348  0486               L776:
2349                     ; 483 				_boiler_water_shower = i;
2352  0486 7b02          	ld	a,(OFST+0,sp)
2353  0488 c70001        	ld	__boiler_water_shower,a
2354  048b               L766:
2355                     ; 485 			if( _dsPrev != i )
2357  048b c60000        	ld	a,__dsPrev
2358  048e 1102          	cp	a,(OFST+0,sp)
2359  0490 2725          	jreq	L507
2360                     ; 487 				_dsPrev = i;
2362  0492 7b02          	ld	a,(OFST+0,sp)
2363  0494 c70000        	ld	__dsPrev,a
2364                     ; 488 				UI_DISP_2Digit(i);
2366  0497 7b02          	ld	a,(OFST+0,sp)
2367  0499 5f            	clrw	x
2368  049a 97            	ld	xl,a
2369  049b a60a          	ld	a,#10
2370  049d 62            	div	x,a
2371  049e 9f            	ld	a,xl
2372  049f 97            	ld	xl,a
2373  04a0 a602          	ld	a,#2
2374  04a2 95            	ld	xh,a
2375  04a3 cd0000        	call	_lcd_disp_n
2379  04a6 7b02          	ld	a,(OFST+0,sp)
2380  04a8 5f            	clrw	x
2381  04a9 97            	ld	xl,a
2382  04aa a60a          	ld	a,#10
2383  04ac 62            	div	x,a
2384  04ad 5f            	clrw	x
2385  04ae 97            	ld	xl,a
2386  04af 9f            	ld	a,xl
2387  04b0 97            	ld	xl,a
2388  04b1 a603          	ld	a,#3
2389  04b3 95            	ld	xh,a
2390  04b4 cd0000        	call	_lcd_disp_n
2393  04b7               L507:
2394                     ; 491 			if( key == 1 )		{	EXIT_HOST(0);	}
2396  04b7 7b03          	ld	a,(OFST+1,sp)
2397  04b9 a101          	cp	a,#1
2398  04bb 261e          	jrne	L707
2401  04bd 725f0000      	clr	___s
2404  04c1 725f0000      	clr	__dsCount
2407  04c5 35ff0000      	mov	__dsPrev,#255
2410  04c9 cd0000        	call	_lcd_blink_clear
2414  04cc 4b00          	push	#0
2415  04ce ae0001        	ldw	x,#1
2416  04d1 c60000        	ld	a,___sInfo
2417  04d4 95            	ld	xh,a
2418  04d5 cd0000        	call	_lcd_disp_info
2420  04d8 84            	pop	a
2423  04d9 2043          	jra	L117
2424  04db               L707:
2425                     ; 492 			else if( key == 2 )	{	EXIT_HOST3(0);	}
2427  04db 7b03          	ld	a,(OFST+1,sp)
2428  04dd a102          	cp	a,#2
2429  04df 2622          	jrne	L317
2432  04e1 725f0000      	clr	___s
2435  04e5 725f0000      	clr	___sDn
2438  04e9 350b0000      	mov	__dsCount,#11
2441  04ed 35ff0000      	mov	__dsPrev,#255
2444  04f1 cd0000        	call	_lcd_blink_clear
2448  04f4 4b00          	push	#0
2449  04f6 ae0001        	ldw	x,#1
2450  04f9 c60000        	ld	a,___sInfo
2451  04fc 95            	ld	xh,a
2452  04fd cd0000        	call	_lcd_disp_info
2454  0500 84            	pop	a
2457  0501 201b          	jra	L117
2458  0503               L317:
2459                     ; 493 			else if( key == 3 )	{	/*EXIT_HOST(0);*/
2461  0503 7b03          	ld	a,(OFST+1,sp)
2462  0505 a103          	cp	a,#3
2463  0507 2611          	jrne	L717
2464                     ; 494 				__s = 4;
2466  0509 35040000      	mov	___s,#4
2467                     ; 495 				_dsCount = 0;
2469  050d 725f0000      	clr	__dsCount
2470                     ; 496 				lcd_blink_clear();
2472  0511 cd0000        	call	_lcd_blink_clear
2474                     ; 497 				_key_blink = 0;
2476  0514 725f0007      	clr	__key_blink
2478  0518 2004          	jra	L117
2479  051a               L717:
2480                     ; 499 			else if( key == 4 )	{
2482  051a 7b03          	ld	a,(OFST+1,sp)
2483  051c a104          	cp	a,#4
2484  051e               L117:
2485                     ; 501 			if( _key_min == KEY_BOILER_FADE )
2487  051e c60000        	ld	a,__key_min
2488  0521 a10a          	cp	a,#10
2489  0523 2703          	jreq	L421
2490  0525 cc083d        	jp	L306
2491  0528               L421:
2492                     ; 504 				EXIT_HOST(0);
2494  0528 725f0000      	clr	___s
2497  052c 725f0000      	clr	__dsCount
2500  0530 35ff0000      	mov	__dsPrev,#255
2503  0534 cd0000        	call	_lcd_blink_clear
2507  0537 4b00          	push	#0
2508  0539 ae0001        	ldw	x,#1
2509  053c c60000        	ld	a,___sInfo
2510  053f 95            	ld	xh,a
2511  0540 cd0000        	call	_lcd_disp_info
2513  0543 84            	pop	a
2515  0544 ac3d083d      	jpf	L306
2516  0548               L756:
2517                     ; 508 	else if( __s == 4 )
2519  0548 c60000        	ld	a,___s
2520  054b a104          	cp	a,#4
2521  054d 2643          	jrne	L137
2522                     ; 510 		disp_backlight(0);
2524  054f 4f            	clr	a
2525  0550 cd0000        	call	_disp_backlight
2527                     ; 511 		if( key == 1 || key == 2 || key == 3 || key == 4 )
2529  0553 7b03          	ld	a,(OFST+1,sp)
2530  0555 a101          	cp	a,#1
2531  0557 2715          	jreq	L537
2533  0559 7b03          	ld	a,(OFST+1,sp)
2534  055b a102          	cp	a,#2
2535  055d 270f          	jreq	L537
2537  055f 7b03          	ld	a,(OFST+1,sp)
2538  0561 a103          	cp	a,#3
2539  0563 2709          	jreq	L537
2541  0565 7b03          	ld	a,(OFST+1,sp)
2542  0567 a104          	cp	a,#4
2543  0569 2703          	jreq	L621
2544  056b cc083d        	jp	L306
2545  056e               L621:
2546  056e               L537:
2547                     ; 513 			file_update2(0);
2549  056e 4f            	clr	a
2550  056f cd0000        	call	_file_update2
2552                     ; 514 			EXIT_HOST(0);
2554  0572 725f0000      	clr	___s
2557  0576 725f0000      	clr	__dsCount
2560  057a 35ff0000      	mov	__dsPrev,#255
2563  057e cd0000        	call	_lcd_blink_clear
2567  0581 4b00          	push	#0
2568  0583 ae0001        	ldw	x,#1
2569  0586 c60000        	ld	a,___sInfo
2570  0589 95            	ld	xh,a
2571  058a cd0000        	call	_lcd_disp_info
2573  058d 84            	pop	a
2575  058e ac3d083d      	jpf	L306
2576  0592               L137:
2577                     ; 517 	else if( __s == 3 )
2579  0592 c60000        	ld	a,___s
2580  0595 a103          	cp	a,#3
2581  0597 2703          	jreq	L031
2582  0599 cc07e0        	jp	L547
2583  059c               L031:
2584                     ; 520 		if( _dsCount == 0 )
2586  059c 725d0000      	tnz	__dsCount
2587  05a0 2678          	jrne	L747
2588                     ; 522 			lcd_clear(0);
2590  05a2 4f            	clr	a
2591  05a3 cd0000        	call	_lcd_clear
2593                     ; 523 			ui_disp_temp_mark(1);
2595  05a6 a601          	ld	a,#1
2596  05a8 cd0000        	call	_ui_disp_temp_mark
2598                     ; 524 			_remote = 1;
2600  05ab 35010004      	mov	__remote,#1
2601                     ; 526 			j = uiInfo.cnt + uiInfo.cnt_sub;
2603  05af c60005        	ld	a,_uiInfo+5
2604  05b2 cb0006        	add	a,_uiInfo+6
2605  05b5 6b02          	ld	(OFST+0,sp),a
2606                     ; 527 			__sRoom = (uiInfo.id_rc + 1) % j;
2608  05b7 c60001        	ld	a,_uiInfo+1
2609  05ba 5f            	clrw	x
2610  05bb 97            	ld	xl,a
2611  05bc 5c            	incw	x
2612  05bd 7b02          	ld	a,(OFST+0,sp)
2613  05bf 905f          	clrw	y
2614  05c1 9097          	ld	yl,a
2615  05c3 cd0000        	call	c_idiv
2617  05c6 51            	exgw	x,y
2618  05c7 01            	rrwa	x,a
2619  05c8 c70000        	ld	___sRoom,a
2620  05cb 02            	rlwa	x,a
2621  05cc               L743:
2622                     ; 529 OneMore2:			
2622                     ; 530 			if( packet_buf[__sRoom] == 10 )
2624  05cc c60000        	ld	a,___sRoom
2625  05cf 5f            	clrw	x
2626  05d0 97            	ld	xl,a
2627  05d1 d60000        	ld	a,(_packet_buf,x)
2628  05d4 a10a          	cp	a,#10
2629  05d6 2617          	jrne	L157
2630                     ; 532 				__sRoom = (__sRoom + 1) % j;
2632  05d8 c60000        	ld	a,___sRoom
2633  05db 5f            	clrw	x
2634  05dc 97            	ld	xl,a
2635  05dd 5c            	incw	x
2636  05de 7b02          	ld	a,(OFST+0,sp)
2637  05e0 905f          	clrw	y
2638  05e2 9097          	ld	yl,a
2639  05e4 cd0000        	call	c_idiv
2641  05e7 51            	exgw	x,y
2642  05e8 01            	rrwa	x,a
2643  05e9 c70000        	ld	___sRoom,a
2644  05ec 02            	rlwa	x,a
2645                     ; 533 				goto OneMore2;
2647  05ed 20dd          	jra	L743
2648  05ef               L157:
2649                     ; 536 			j = __sRoom;
2651  05ef               L153:
2652                     ; 537 RemoteEntry:
2652                     ; 538 			if( __sRoom == uiInfo.id_rc )
2654  05ef c60000        	ld	a,___sRoom
2655  05f2 c10001        	cp	a,_uiInfo+1
2656  05f5 2603          	jrne	L231
2657  05f7 cc07cd        	jp	L353
2658  05fa               L231:
2659                     ; 548 			lcd_clear_rid();
2661  05fa cd0000        	call	_lcd_clear_rid
2663                     ; 549 			lcd_blink_itemRoom(__sRoom, 1);
2665  05fd ae0001        	ldw	x,#1
2666  0600 c60000        	ld	a,___sRoom
2667  0603 95            	ld	xh,a
2668  0604 cd0000        	call	_lcd_blink_itemRoom
2670                     ; 550 			disp_status_remote_message(REMOTE_MODE); //모드 변경
2672  0607 c60000        	ld	a,___sRoom
2673  060a 5f            	clrw	x
2674  060b 97            	ld	xl,a
2675  060c d60045        	ld	a,(_uiInfo+69,x)
2676  060f cd0000        	call	_disp_status_remote_message
2678                     ; 551 			_dsCount = 4;
2680  0612 35040000      	mov	__dsCount,#4
2682  0616 acc607c6      	jpf	L557
2683  061a               L747:
2684                     ; 553 		else if( _dsCount == 2 )
2686  061a c60000        	ld	a,__dsCount
2687  061d a102          	cp	a,#2
2688  061f 2637          	jrne	L757
2689  0621               L553:
2690                     ; 557 OneMore:			
2690                     ; 558 			j = uiInfo.cnt + uiInfo.cnt_sub;
2692  0621 c60005        	ld	a,_uiInfo+5
2693  0624 cb0006        	add	a,_uiInfo+6
2694  0627 6b02          	ld	(OFST+0,sp),a
2695                     ; 559 			__sRoom = (__sRoom + 1) % j;
2697  0629 c60000        	ld	a,___sRoom
2698  062c 5f            	clrw	x
2699  062d 97            	ld	xl,a
2700  062e 5c            	incw	x
2701  062f 7b02          	ld	a,(OFST+0,sp)
2702  0631 905f          	clrw	y
2703  0633 9097          	ld	yl,a
2704  0635 cd0000        	call	c_idiv
2706  0638 51            	exgw	x,y
2707  0639 01            	rrwa	x,a
2708  063a c70000        	ld	___sRoom,a
2709  063d 02            	rlwa	x,a
2710                     ; 560 			if( packet_buf[__sRoom] == 10 )
2712  063e c60000        	ld	a,___sRoom
2713  0641 5f            	clrw	x
2714  0642 97            	ld	xl,a
2715  0643 d60000        	ld	a,(_packet_buf,x)
2716  0646 a10a          	cp	a,#10
2717  0648 27d7          	jreq	L553
2718                     ; 562 				goto OneMore;
2720                     ; 564 			if( __sRoom != 0 ) {
2722  064a 725d0000      	tnz	___sRoom
2723  064e 279f          	jreq	L153
2724                     ; 566 				j = __sRoom - 1;
2726  0650 c60000        	ld	a,___sRoom
2727  0653 5f            	clrw	x
2728  0654 97            	ld	xl,a
2729  0655 5a            	decw	x
2730  0656 2097          	jra	L153
2731  0658               L757:
2732                     ; 570 		else if( _dsCount == 4 )
2734  0658 c60000        	ld	a,__dsCount
2735  065b a104          	cp	a,#4
2736  065d 2703          	jreq	L431
2737  065f cc0767        	jp	L767
2738  0662               L431:
2739                     ; 572 			j = __sRoom;
2741  0662 c60000        	ld	a,___sRoom
2742  0665 6b02          	ld	(OFST+0,sp),a
2743                     ; 574 			if( REMOTE_MODEi(j) == 0x01 )		{	disp_status_loop_remote_N(j);	}
2745  0667 7b02          	ld	a,(OFST+0,sp)
2746  0669 5f            	clrw	x
2747  066a 97            	ld	xl,a
2748  066b d60045        	ld	a,(_uiInfo+69,x)
2749  066e a101          	cp	a,#1
2750  0670 2607          	jrne	L177
2753  0672 7b02          	ld	a,(OFST+0,sp)
2754  0674 cd0000        	call	_disp_status_loop_remote_N
2757  0677 2034          	jra	L377
2758  0679               L177:
2759                     ; 575 			else if( REMOTE_MODEi(j) == 0x08 )	{	disp_status_loop_remote_Y(j);	}
2761  0679 7b02          	ld	a,(OFST+0,sp)
2762  067b 5f            	clrw	x
2763  067c 97            	ld	xl,a
2764  067d d60045        	ld	a,(_uiInfo+69,x)
2765  0680 a108          	cp	a,#8
2766  0682 2607          	jrne	L577
2769  0684 7b02          	ld	a,(OFST+0,sp)
2770  0686 cd0000        	call	_disp_status_loop_remote_Y
2773  0689 2022          	jra	L377
2774  068b               L577:
2775                     ; 576 			else if( REMOTE_MODEi(j) == 0x10 )	{	disp_status_loop_remote_B(j);	}
2777  068b 7b02          	ld	a,(OFST+0,sp)
2778  068d 5f            	clrw	x
2779  068e 97            	ld	xl,a
2780  068f d60045        	ld	a,(_uiInfo+69,x)
2781  0692 a110          	cp	a,#16
2782  0694 2607          	jrne	L1001
2785  0696 7b02          	ld	a,(OFST+0,sp)
2786  0698 cd0000        	call	_disp_status_loop_remote_B
2789  069b 2010          	jra	L377
2790  069d               L1001:
2791                     ; 577 			else if( REMOTE_MODEi(j) == 0x04 )	{	disp_status_loop_remote_J(j);	}
2793  069d 7b02          	ld	a,(OFST+0,sp)
2794  069f 5f            	clrw	x
2795  06a0 97            	ld	xl,a
2796  06a1 d60045        	ld	a,(_uiInfo+69,x)
2797  06a4 a104          	cp	a,#4
2798  06a6 2605          	jrne	L377
2801  06a8 7b02          	ld	a,(OFST+0,sp)
2802  06aa cd0000        	call	_disp_status_loop_remote_J
2804  06ad               L377:
2805                     ; 578 			if( key == 1 )	
2807  06ad 7b03          	ld	a,(OFST+1,sp)
2808  06af a101          	cp	a,#1
2809  06b1 2663          	jrne	L7001
2810                     ; 582 				if( REMOTE_MODEi(j)==0x01 )		{	REMOTE_MODEi(j) = 0x08;		}
2812  06b3 7b02          	ld	a,(OFST+0,sp)
2813  06b5 5f            	clrw	x
2814  06b6 97            	ld	xl,a
2815  06b7 d60045        	ld	a,(_uiInfo+69,x)
2816  06ba a101          	cp	a,#1
2817  06bc 260b          	jrne	L1101
2820  06be 7b02          	ld	a,(OFST+0,sp)
2821  06c0 5f            	clrw	x
2822  06c1 97            	ld	xl,a
2823  06c2 a608          	ld	a,#8
2824  06c4 d70045        	ld	(_uiInfo+69,x),a
2826  06c7 2040          	jra	L3101
2827  06c9               L1101:
2828                     ; 583 				else if( REMOTE_MODEi(j)==0x08 ){	REMOTE_MODEi(j) = 0x10;		}
2830  06c9 7b02          	ld	a,(OFST+0,sp)
2831  06cb 5f            	clrw	x
2832  06cc 97            	ld	xl,a
2833  06cd d60045        	ld	a,(_uiInfo+69,x)
2834  06d0 a108          	cp	a,#8
2835  06d2 260b          	jrne	L5101
2838  06d4 7b02          	ld	a,(OFST+0,sp)
2839  06d6 5f            	clrw	x
2840  06d7 97            	ld	xl,a
2841  06d8 a610          	ld	a,#16
2842  06da d70045        	ld	(_uiInfo+69,x),a
2844  06dd 202a          	jra	L3101
2845  06df               L5101:
2846                     ; 584 				else if( REMOTE_MODEi(j)==0x10 ){	REMOTE_MODEi(j) = 0x01;		}
2848  06df 7b02          	ld	a,(OFST+0,sp)
2849  06e1 5f            	clrw	x
2850  06e2 97            	ld	xl,a
2851  06e3 d60045        	ld	a,(_uiInfo+69,x)
2852  06e6 a110          	cp	a,#16
2853  06e8 260b          	jrne	L1201
2856  06ea 7b02          	ld	a,(OFST+0,sp)
2857  06ec 5f            	clrw	x
2858  06ed 97            	ld	xl,a
2859  06ee a601          	ld	a,#1
2860  06f0 d70045        	ld	(_uiInfo+69,x),a
2862  06f3 2014          	jra	L3101
2863  06f5               L1201:
2864                     ; 585 				else if( REMOTE_MODEi(j)==0x04 ){	REMOTE_MODEi(j) = 0x01;		}
2866  06f5 7b02          	ld	a,(OFST+0,sp)
2867  06f7 5f            	clrw	x
2868  06f8 97            	ld	xl,a
2869  06f9 d60045        	ld	a,(_uiInfo+69,x)
2870  06fc a104          	cp	a,#4
2871  06fe 2609          	jrne	L3101
2874  0700 7b02          	ld	a,(OFST+0,sp)
2875  0702 5f            	clrw	x
2876  0703 97            	ld	xl,a
2877  0704 a601          	ld	a,#1
2878  0706 d70045        	ld	(_uiInfo+69,x),a
2879  0709               L3101:
2880                     ; 586 				disp_status_remote_message(REMOTE_MODE);
2882  0709 c60000        	ld	a,___sRoom
2883  070c 5f            	clrw	x
2884  070d 97            	ld	xl,a
2885  070e d60045        	ld	a,(_uiInfo+69,x)
2886  0711 cd0000        	call	_disp_status_remote_message
2889  0714 2048          	jra	L7201
2890  0716               L7001:
2891                     ; 588 			else if( key == 2 )
2893  0716 7b03          	ld	a,(OFST+1,sp)
2894  0718 a102          	cp	a,#2
2895  071a 2632          	jrne	L1301
2896                     ; 590 				i = uiInfo.remote_mode[j];
2898  071c 7b02          	ld	a,(OFST+0,sp)
2899  071e 5f            	clrw	x
2900  071f 97            	ld	xl,a
2901  0720 d60045        	ld	a,(_uiInfo+69,x)
2902  0723 6b02          	ld	(OFST+0,sp),a
2903                     ; 591 				if( i == 0x04 )	{	REMOTE_MODE = 0x01;		}
2905  0725 7b02          	ld	a,(OFST+0,sp)
2906  0727 a104          	cp	a,#4
2907  0729 260c          	jrne	L3301
2910  072b c60000        	ld	a,___sRoom
2911  072e 5f            	clrw	x
2912  072f 97            	ld	xl,a
2913  0730 a601          	ld	a,#1
2914  0732 d70045        	ld	(_uiInfo+69,x),a
2916  0735 200a          	jra	L5301
2917  0737               L3301:
2918                     ; 592 				else			{	REMOTE_MODE = 0x04;		}
2920  0737 c60000        	ld	a,___sRoom
2921  073a 5f            	clrw	x
2922  073b 97            	ld	xl,a
2923  073c a604          	ld	a,#4
2924  073e d70045        	ld	(_uiInfo+69,x),a
2925  0741               L5301:
2926                     ; 593 				disp_status_remote_message(REMOTE_MODE);
2928  0741 c60000        	ld	a,___sRoom
2929  0744 5f            	clrw	x
2930  0745 97            	ld	xl,a
2931  0746 d60045        	ld	a,(_uiInfo+69,x)
2932  0749 cd0000        	call	_disp_status_remote_message
2935  074c 2010          	jra	L7201
2936  074e               L1301:
2937                     ; 595 			else if( key == 3 )
2939  074e 7b03          	ld	a,(OFST+1,sp)
2940  0750 a103          	cp	a,#3
2941  0752 2779          	jreq	L353
2942                     ; 597 				goto RemoteExit;
2944                     ; 599 			else if( key == 4 )	
2946  0754 7b03          	ld	a,(OFST+1,sp)
2947  0756 a104          	cp	a,#4
2948  0758 2604          	jrne	L7201
2949                     ; 601 				_dsCount = 2;
2951  075a 35020000      	mov	__dsCount,#2
2952  075e               L7201:
2953                     ; 603 			if( _key_min == KEY_BLINK_FADE )
2955  075e c60000        	ld	a,__key_min
2956  0761 a10a          	cp	a,#10
2957  0763 2661          	jrne	L557
2958                     ; 605 				goto RemoteExit;
2960  0765 2066          	jra	L353
2961  0767               L767:
2962                     ; 608 		else if( _dsCount == 1 )
2964  0767 c60000        	ld	a,__dsCount
2965  076a a101          	cp	a,#1
2966  076c 2658          	jrne	L557
2967                     ; 610 			j = __sRoom;
2969  076e c60000        	ld	a,___sRoom
2970  0771 6b02          	ld	(OFST+0,sp),a
2971                     ; 611 			if( REMOTE_MODEi(j) == 0x01 )		
2973  0773 7b02          	ld	a,(OFST+0,sp)
2974  0775 5f            	clrw	x
2975  0776 97            	ld	xl,a
2976  0777 d60045        	ld	a,(_uiInfo+69,x)
2977  077a a101          	cp	a,#1
2978  077c 2610          	jrne	L5501
2979                     ; 613 				i = disp_status_loop_remote_N(j);	
2981  077e 7b02          	ld	a,(OFST+0,sp)
2982  0780 cd0000        	call	_disp_status_loop_remote_N
2984                     ; 614 				REMOTE_MODEi(j) = 0x08;
2986  0783 7b02          	ld	a,(OFST+0,sp)
2987  0785 5f            	clrw	x
2988  0786 97            	ld	xl,a
2989  0787 a608          	ld	a,#8
2990  0789 d70045        	ld	(_uiInfo+69,x),a
2992  078c 2034          	jra	L7501
2993  078e               L5501:
2994                     ; 616 			else if( REMOTE_MODEi(j) == 0x08 )	
2996  078e 7b02          	ld	a,(OFST+0,sp)
2997  0790 5f            	clrw	x
2998  0791 97            	ld	xl,a
2999  0792 d60045        	ld	a,(_uiInfo+69,x)
3000  0795 a108          	cp	a,#8
3001  0797 2610          	jrne	L1601
3002                     ; 618 				i = disp_status_loop_remote_Y(j);	
3004  0799 7b02          	ld	a,(OFST+0,sp)
3005  079b cd0000        	call	_disp_status_loop_remote_Y
3007                     ; 619 				REMOTE_MODEi(j) = 0x10;
3009  079e 7b02          	ld	a,(OFST+0,sp)
3010  07a0 5f            	clrw	x
3011  07a1 97            	ld	xl,a
3012  07a2 a610          	ld	a,#16
3013  07a4 d70045        	ld	(_uiInfo+69,x),a
3015  07a7 2019          	jra	L7501
3016  07a9               L1601:
3017                     ; 621 			else if( REMOTE_MODEi(j) == 0x10 )	
3019  07a9 7b02          	ld	a,(OFST+0,sp)
3020  07ab 5f            	clrw	x
3021  07ac 97            	ld	xl,a
3022  07ad d60045        	ld	a,(_uiInfo+69,x)
3023  07b0 a110          	cp	a,#16
3024  07b2 260e          	jrne	L7501
3025                     ; 623 				i = disp_status_loop_remote_B(j);	
3027  07b4 7b02          	ld	a,(OFST+0,sp)
3028  07b6 cd0000        	call	_disp_status_loop_remote_B
3030                     ; 624 				REMOTE_MODEi(j) = 0x01;
3032  07b9 7b02          	ld	a,(OFST+0,sp)
3033  07bb 5f            	clrw	x
3034  07bc 97            	ld	xl,a
3035  07bd a601          	ld	a,#1
3036  07bf d70045        	ld	(_uiInfo+69,x),a
3037  07c2               L7501:
3038                     ; 627 			_dsCount = 4;	
3040  07c2 35040000      	mov	__dsCount,#4
3041  07c6               L557:
3042                     ; 629 		if( _key_min == KEY_BLINK_FADE )
3044  07c6 c60000        	ld	a,__key_min
3045  07c9 a10a          	cp	a,#10
3046  07cb 2670          	jrne	L306
3047                     ; 631 			goto RemoteExit;
3048  07cd               L353:
3049                     ; 540 RemoteExit:				
3049                     ; 541 				//	mode change
3049                     ; 542 				_remote = 0;
3051  07cd 725f0004      	clr	__remote
3052                     ; 543 				__s = 5;
3054  07d1 35050000      	mov	___s,#5
3055                     ; 544 				_dsCount = 0;
3057  07d5 725f0000      	clr	__dsCount
3058                     ; 545 				lcd_blink_clear();
3060  07d9 cd0000        	call	_lcd_blink_clear
3062                     ; 546 				return;
3064  07dc ac730873      	jpf	L07
3065  07e0               L547:
3066                     ; 633 	} else if (__s == 5){
3068  07e0 c60000        	ld	a,___s
3069  07e3 a105          	cp	a,#5
3070  07e5 2656          	jrne	L306
3071                     ; 634 		__sUp = 0;
3073  07e7 725f0000      	clr	___sUp
3074                     ; 636 		switch (_disp_mode) {
3076  07eb c60005        	ld	a,__disp_mode
3078                     ; 641 		case 0x10:	__sUp = 2;	break;
3079  07ee 4a            	dec	a
3080  07ef 2711          	jreq	L753
3081  07f1 4a            	dec	a
3082  07f2 2714          	jreq	L163
3083  07f4 a002          	sub	a,#2
3084  07f6 2716          	jreq	L363
3085  07f8 a004          	sub	a,#4
3086  07fa 2718          	jreq	L563
3087  07fc a008          	sub	a,#8
3088  07fe 271a          	jreq	L763
3089  0800 201c          	jra	L7701
3090  0802               L753:
3091                     ; 637 		case 0x01:	__sUp = 0;	break;
3093  0802 725f0000      	clr	___sUp
3096  0806 2016          	jra	L7701
3097  0808               L163:
3098                     ; 638 		case 0x02:	__sUp = 3;	break;
3100  0808 35030000      	mov	___sUp,#3
3103  080c 2010          	jra	L7701
3104  080e               L363:
3105                     ; 639 		case 0x04:	__sUp = 4;	break;
3107  080e 35040000      	mov	___sUp,#4
3110  0812 200a          	jra	L7701
3111  0814               L563:
3112                     ; 640 		case 0x08:	__sUp = 1;	break;
3114  0814 35010000      	mov	___sUp,#1
3117  0818 2004          	jra	L7701
3118  081a               L763:
3119                     ; 641 		case 0x10:	__sUp = 2;	break;
3121  081a 35020000      	mov	___sUp,#2
3124  081e               L7701:
3125                     ; 643 		__sDn = 0xff;
3127  081e 35ff0000      	mov	___sDn,#255
3128                     ; 644 		disp_status_loop_init();
3130  0822 cd0000        	call	_disp_status_loop_init
3132                     ; 645 		_dsCount = 1;
3134  0825 35010000      	mov	__dsCount,#1
3135                     ; 646 		__s = 0;
3137  0829 725f0000      	clr	___s
3138                     ; 647 		_key_blink = 1;
3140  082d 35010007      	mov	__key_blink,#1
3141                     ; 648 		_key_sec = _key_min = _key_hour = 0;
3143  0831 725f0000      	clr	__key_hour
3144  0835 725f0000      	clr	__key_min
3145  0839 725f0000      	clr	__key_sec
3146  083d               L306:
3147                     ; 652 	if (packet_changed == 1) {
3149  083d c60000        	ld	a,_packet_changed
3150  0840 a101          	cp	a,#1
3151  0842 262f          	jrne	L1011
3152                     ; 653 		__s = 0;
3154  0844 725f0000      	clr	___s
3155                     ; 654 		switch (_disp_mode2) {
3157  0848 c60006        	ld	a,__disp_mode2
3159                     ; 663 				break;
3160  084b 4a            	dec	a
3161  084c 2709          	jreq	L173
3162  084e 4a            	dec	a
3163  084f 270c          	jreq	L373
3164  0851 a002          	sub	a,#2
3165  0853 2712          	jreq	L573
3166  0855 2018          	jra	L5011
3167  0857               L173:
3168                     ; 655 			case 0x01:	_dsCount = 0;	break;
3170  0857 725f0000      	clr	__dsCount
3173  085b 2012          	jra	L5011
3174  085d               L373:
3175                     ; 656 			case 0x02:
3175                     ; 657 				_dsCount = 11;
3177  085d 350b0000      	mov	__dsCount,#11
3178                     ; 658 				__sDn = 1;
3180  0861 35010000      	mov	___sDn,#1
3181                     ; 659 				break;
3183  0865 2008          	jra	L5011
3184  0867               L573:
3185                     ; 660 			case 0x04:
3185                     ; 661 				_dsCount = 11;
3187  0867 350b0000      	mov	__dsCount,#11
3188                     ; 662 				__sDn = 0;	
3190  086b 725f0000      	clr	___sDn
3191                     ; 663 				break;
3193  086f               L5011:
3194                     ; 665 		packet_changed = 0;
3196  086f 725f0000      	clr	_packet_changed
3197  0873               L1011:
3198                     ; 667 }
3199  0873               L07:
3202  0873 5b03          	addw	sp,#3
3203  0875 81            	ret
3295                     	xdef	_disp_rid_info
3296                     	xref	_packet_buf
3297                     	xdef	_disp_status_loop_remote_B
3298                     	xdef	_disp_status_loop_remote_J
3299                     	xdef	_disp_status_loop_remote_Y
3300                     	xdef	_disp_status_loop_remote_N
3301                     	xdef	_disp_status_remote_message
3302                     	xref	_packet_changed
3303                     	xref	_getHexToBin
3304                     	xref	__rcLED
3305                     	xref	__disp_temp
3306                     	switch	.bss
3307  0000               __remote_buf:
3308  0000 000000000000  	ds.b	8
3309                     	xdef	__remote_buf
3310                     	xdef	__remote
3311                     	xdef	__boiler_fire
3312                     	xdef	__boiler_type
3313                     	xdef	__boiler_water_heat
3314                     	xdef	__boiler_water_shower
3315  0008               ___boiler_shower:
3316  0008 000000000000  	ds.b	10
3317                     	xdef	___boiler_shower
3318                     	xref	_disp_backlight
3319                     	xref	_file_update2
3320                     	xref	__updateCount
3321                     	xref	__updateBit
3322                     	xref	__updateTimer
3323                     	xdef	__key_blink
3324                     	xref	__key_hour
3325                     	xref	__key_min
3326                     	xref	__key_sec
3327                     	xdef	__disp_mode2
3328                     	xdef	__disp_mode
3329                     	xref	_disp_status_curr_only
3330                     	xref	_disp_status_loop_init
3331                     	xdef	_disp_status_loop_host_B
3332                     	xdef	_disp_status_loop_host_Y
3333                     	xdef	_disp_status_loop_host_N
3334                     	xref	_disp_status_loop_messageDn
3335                     	xref	_disp_status_loop_message
3336                     	xref	__dsPrev
3337                     	xref	__dsCount
3338                     	xdef	_disp_status_loop_host
3339                     	xref	___sRoom
3340                     	xref	___sInfo
3341                     	xref	___sDn
3342                     	xref	___sUp
3343                     	xref	___s
3344                     	xref	_lcd_disp_info
3345                     	xref	_lcd_disp_info_shower
3346                     	xref	_ui_disp_reserve_setup
3347                     	xref	_ui_disp_repeat_setup
3348                     	xref	_ui_disp_clear_tSetup
3349                     	xref	_ui_disp_temp_mark
3350                     	xref	_ui_disp_temp_curr
3351                     	xref	_ui_disp_temp_setup
3352                     	xref	_lcd_clear_rid_n
3353                     	xref	_lcd_blink_itemRoom
3354                     	xref	_lcd_blink_item
3355                     	xref	_lcd_blink_clear
3356                     	xref	_lcd_disp_rid
3357                     	xref	_lcd_disp_n
3358                     	xref	_lcd_clear
3359                     	xref	_lcd_clear_rid
3360                     	xref	_lcd_clear_btn
3361                     	xref	_iLF_DEF
3362                     	xref	_bLF_DEF
3363                     	xref	_uiInfo
3364                     	xref	___timer1s
3365                     	xref.b	c_x
3385                     	xref	c_idiv
3386                     	xref	c_smodx
3387                     	end
