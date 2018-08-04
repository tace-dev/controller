   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               __boiler_type:
  23  0000 00            	dc.b	0
  24  0001               __boiler_water_shower:
  25  0001 32            	dc.b	50
  26  0002               __boiler_water_heat:
  27  0002 46            	dc.b	70
  28  0003               __boiler_fire:
  29  0003 00            	dc.b	0
  30  0004               __remote:
  31  0004 00            	dc.b	0
  32  0005               __disp_mode:
  33  0005 01            	dc.b	1
  34  0006               __disp_mode2:
  35  0006 01            	dc.b	1
  75                     ; 55 void	disp_status_remote_message(uint8_t i)
  75                     ; 56 {
  77                     	switch	.text
  78  0000               _disp_status_remote_message:
  82                     ; 57 	lcd_clear_btn();
  85                     ; 63 }
  88  0000 cc0000        	jp	_lcd_clear_btn
 140                     ; 65 uint8_t		disp_status_loop_remote_N(uint8_t key)
 140                     ; 66 {
 141                     	switch	.text
 142  0003               _disp_status_loop_remote_N:
 144  0003 88            	push	a
 145  0004 89            	pushw	x
 146       00000002      OFST:	set	2
 149                     ; 68 	uint8_t	j = 0;
 151  0005 0f01          	clr	(OFST-1,sp)
 152                     ; 69 	i = uiInfo.tempSetup[key];
 154  0007 5f            	clrw	x
 155  0008 97            	ld	xl,a
 156  0009 d6003d        	ld	a,(_uiInfo+61,x)
 157  000c 6b02          	ld	(OFST+0,sp),a
 158                     ; 70 	if( uiInfo.enc != 0 )
 160  000e c60000        	ld	a,_uiInfo
 161  0011 2727          	jreq	L54
 162                     ; 72 		i += (uiInfo.enc&0x40)==0 ? -2 : 2;
 164  0013 a540          	bcp	a,#64
 165  0015 2604          	jrne	L21
 166  0017 a6fe          	ld	a,#254
 167  0019 2002          	jra	L41
 168  001b               L21:
 169  001b a602          	ld	a,#2
 170  001d               L41:
 171  001d 1b02          	add	a,(OFST+0,sp)
 172                     ; 73 		if( i<=10 )	i = 10;
 174  001f a10b          	cp	a,#11
 175  0021 2402          	jruge	L74
 178  0023 a60a          	ld	a,#10
 179  0025               L74:
 180                     ; 74 		if( i>=80 )	i = 80;
 182  0025 a150          	cp	a,#80
 183  0027 2502          	jrult	L15
 186  0029 a650          	ld	a,#80
 187  002b               L15:
 188  002b 6b02          	ld	(OFST+0,sp),a
 189                     ; 75 		uiInfo.tempSetup[key] = i;
 191  002d 5f            	clrw	x
 192  002e 7b03          	ld	a,(OFST+1,sp)
 193  0030 97            	ld	xl,a
 194  0031 7b02          	ld	a,(OFST+0,sp)
 195  0033 d7003d        	ld	(_uiInfo+61,x),a
 196                     ; 76 		j = 1;
 198  0036 a601          	ld	a,#1
 199  0038 6b01          	ld	(OFST-1,sp),a
 200  003a               L54:
 201                     ; 78 	if( _dsPrev != i )
 203  003a c60000        	ld	a,__dsPrev
 204  003d 1102          	cp	a,(OFST+0,sp)
 205  003f 271e          	jreq	L35
 206                     ; 80 		_dsPrev = i;
 208  0041 7b02          	ld	a,(OFST+0,sp)
 209  0043 c70000        	ld	__dsPrev,a
 210                     ; 81 		ui_disp_temp_mark(1);
 212  0046 a601          	ld	a,#1
 213  0048 cd0000        	call	_ui_disp_temp_mark
 215                     ; 82 		ui_disp_temp_setup(uiInfo.tempSetup[key]);
 217  004b 7b03          	ld	a,(OFST+1,sp)
 218  004d 5f            	clrw	x
 219  004e 97            	ld	xl,a
 220  004f d6003d        	ld	a,(_uiInfo+61,x)
 221  0052 cd0000        	call	_ui_disp_temp_setup
 223                     ; 83 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 225  0055 7b03          	ld	a,(OFST+1,sp)
 226  0057 5f            	clrw	x
 227  0058 97            	ld	xl,a
 228  0059 d60035        	ld	a,(_uiInfo+53,x)
 229  005c cd0000        	call	_ui_disp_temp_curr
 231  005f               L35:
 232                     ; 85 	return j;
 234  005f 7b01          	ld	a,(OFST-1,sp)
 237  0061 5b03          	addw	sp,#3
 238  0063 81            	ret	
 288                     ; 88 uint8_t	disp_status_loop_remote_Y(uint8_t key)
 288                     ; 89 {
 289                     	switch	.text
 290  0064               _disp_status_loop_remote_Y:
 292  0064 88            	push	a
 293  0065 89            	pushw	x
 294       00000002      OFST:	set	2
 297                     ; 91 	uint8_t	j = 0;
 299  0066 0f01          	clr	(OFST-1,sp)
 300                     ; 92 	i = uiInfo.remote_time[key];
 302  0068 5f            	clrw	x
 303  0069 97            	ld	xl,a
 304  006a d6004d        	ld	a,(_uiInfo+77,x)
 305  006d 6b02          	ld	(OFST+0,sp),a
 306                     ; 93 	if( uiInfo.enc != 0 )
 308  006f c60000        	ld	a,_uiInfo
 309  0072 2727          	jreq	L57
 310                     ; 95 		i += (uiInfo.enc&0x40)==0 ? -2 : 2;
 312  0074 a540          	bcp	a,#64
 313  0076 2604          	jrne	L62
 314  0078 a6fe          	ld	a,#254
 315  007a 2002          	jra	L03
 316  007c               L62:
 317  007c a602          	ld	a,#2
 318  007e               L03:
 319  007e 1b02          	add	a,(OFST+0,sp)
 320                     ; 96 		if( i<=2 )	i = 2;
 322  0080 a103          	cp	a,#3
 323  0082 2402          	jruge	L77
 326  0084 a602          	ld	a,#2
 327  0086               L77:
 328                     ; 97 		if( i>=48 )	i = 48;
 330  0086 a130          	cp	a,#48
 331  0088 2502          	jrult	L101
 334  008a a630          	ld	a,#48
 335  008c               L101:
 336  008c 6b02          	ld	(OFST+0,sp),a
 337                     ; 98 		uiInfo.remote_time[key] = i;
 339  008e 5f            	clrw	x
 340  008f 7b03          	ld	a,(OFST+1,sp)
 341  0091 97            	ld	xl,a
 342  0092 7b02          	ld	a,(OFST+0,sp)
 343  0094 d7004d        	ld	(_uiInfo+77,x),a
 344                     ; 99 		j = 1;
 346  0097 a601          	ld	a,#1
 347  0099 6b01          	ld	(OFST-1,sp),a
 348  009b               L57:
 349                     ; 101 	if( _dsPrev != i )
 351  009b c60000        	ld	a,__dsPrev
 352  009e 1102          	cp	a,(OFST+0,sp)
 353  00a0 270f          	jreq	L301
 354                     ; 103 		_dsPrev = i;
 356  00a2 7b02          	ld	a,(OFST+0,sp)
 357  00a4 c70000        	ld	__dsPrev,a
 358                     ; 104 		ui_disp_reserve_setup(uiInfo.remote_time[key]);
 360  00a7 5f            	clrw	x
 361  00a8 7b03          	ld	a,(OFST+1,sp)
 362  00aa 97            	ld	xl,a
 363  00ab d6004d        	ld	a,(_uiInfo+77,x)
 364  00ae cd0000        	call	_ui_disp_reserve_setup
 366  00b1               L301:
 367                     ; 106 	return j;
 369  00b1 7b01          	ld	a,(OFST-1,sp)
 372  00b3 5b03          	addw	sp,#3
 373  00b5 81            	ret	
 410                     ; 109 uint8_t		disp_status_loop_remote_J(uint8_t key)
 410                     ; 110 {
 411                     	switch	.text
 412  00b6               _disp_status_loop_remote_J:
 414  00b6 88            	push	a
 415       00000000      OFST:	set	0
 418                     ; 112 	if (_dsPrev != 0xFE ) {
 420  00b7 c60000        	ld	a,__dsPrev
 421  00ba a1fe          	cp	a,#254
 422  00bc 2713          	jreq	L121
 423                     ; 113 		_dsPrev = 0xFE;
 425  00be 35fe0000      	mov	__dsPrev,#254
 426                     ; 114 		ui_disp_clear_tSetup(1);
 428  00c2 a601          	ld	a,#1
 429  00c4 cd0000        	call	_ui_disp_clear_tSetup
 431                     ; 115 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 433  00c7 7b01          	ld	a,(OFST+1,sp)
 434  00c9 5f            	clrw	x
 435  00ca 97            	ld	xl,a
 436  00cb d60035        	ld	a,(_uiInfo+53,x)
 437  00ce cd0000        	call	_ui_disp_temp_curr
 439  00d1               L121:
 440                     ; 118 	return key;
 442  00d1 7b01          	ld	a,(OFST+1,sp)
 445  00d3 5b01          	addw	sp,#1
 446  00d5 81            	ret	
 496                     ; 121 uint8_t		disp_status_loop_remote_B(uint8_t key)
 496                     ; 122 {
 497                     	switch	.text
 498  00d6               _disp_status_loop_remote_B:
 500  00d6 88            	push	a
 501  00d7 89            	pushw	x
 502       00000002      OFST:	set	2
 505                     ; 124 	uint8_t	j = 0;
 507  00d8 0f01          	clr	(OFST-1,sp)
 508                     ; 125 	i = uiInfo.remote_banb[key];
 510  00da 5f            	clrw	x
 511  00db 97            	ld	xl,a
 512  00dc d60055        	ld	a,(_uiInfo+85,x)
 513  00df 6b02          	ld	(OFST+0,sp),a
 514                     ; 126 	if( uiInfo.enc != 0 )
 516  00e1 c60000        	ld	a,_uiInfo
 517  00e4 2727          	jreq	L341
 518                     ; 128 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 520  00e6 a540          	bcp	a,#64
 521  00e8 2604          	jrne	L44
 522  00ea a6ff          	ld	a,#255
 523  00ec 2002          	jra	L64
 524  00ee               L44:
 525  00ee a601          	ld	a,#1
 526  00f0               L64:
 527  00f0 1b02          	add	a,(OFST+0,sp)
 528                     ; 129 		if( i<=5 )	i = 5;
 530  00f2 a106          	cp	a,#6
 531  00f4 2402          	jruge	L541
 534  00f6 a605          	ld	a,#5
 535  00f8               L541:
 536                     ; 130 		if( i>=50 )	i = 50;
 538  00f8 a132          	cp	a,#50
 539  00fa 2502          	jrult	L741
 542  00fc a632          	ld	a,#50
 543  00fe               L741:
 544  00fe 6b02          	ld	(OFST+0,sp),a
 545                     ; 131 		uiInfo.remote_banb[key] = i;
 547  0100 5f            	clrw	x
 548  0101 7b03          	ld	a,(OFST+1,sp)
 549  0103 97            	ld	xl,a
 550  0104 7b02          	ld	a,(OFST+0,sp)
 551  0106 d70055        	ld	(_uiInfo+85,x),a
 552                     ; 132 		j = 1;
 554  0109 a601          	ld	a,#1
 555  010b 6b01          	ld	(OFST-1,sp),a
 556  010d               L341:
 557                     ; 134 	if( _dsPrev != i )
 559  010d c60000        	ld	a,__dsPrev
 560  0110 1102          	cp	a,(OFST+0,sp)
 561  0112 270f          	jreq	L151
 562                     ; 136 		_dsPrev = i;
 564  0114 7b02          	ld	a,(OFST+0,sp)
 565  0116 c70000        	ld	__dsPrev,a
 566                     ; 137 		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
 568  0119 5f            	clrw	x
 569  011a 7b03          	ld	a,(OFST+1,sp)
 570  011c 97            	ld	xl,a
 571  011d d60055        	ld	a,(_uiInfo+85,x)
 572  0120 cd0000        	call	_ui_disp_repeat_setup
 574  0123               L151:
 575                     ; 139 	return j;
 577  0123 7b01          	ld	a,(OFST-1,sp)
 580  0125 5b03          	addw	sp,#3
 581  0127 81            	ret	
 630                     ; 142 uint8_t		disp_status_loop_host_Off(uint8_t key)
 630                     ; 143 {
 631                     	switch	.text
 632  0128               _disp_status_loop_host_Off:
 634  0128 89            	pushw	x
 635       00000002      OFST:	set	2
 638                     ; 145 	uint8_t	j = 0;
 640  0129 0f01          	clr	(OFST-1,sp)
 641                     ; 146 	i = uiInfo.tSetup;
 643  012b c6000e        	ld	a,_uiInfo+14
 644  012e 6b02          	ld	(OFST+0,sp),a
 645                     ; 147 	if( uiInfo.enc != 0 )
 647  0130 c60000        	ld	a,_uiInfo
 648  0133 271e          	jreq	L371
 649                     ; 150 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
 651  0135 a540          	bcp	a,#64
 652  0137 2604          	jrne	L45
 653  0139 a6ff          	ld	a,#255
 654  013b 2002          	jra	L65
 655  013d               L45:
 656  013d a601          	ld	a,#1
 657  013f               L65:
 658  013f 1b02          	add	a,(OFST+0,sp)
 659                     ; 151 		if( i<=10 )	i = 10;
 661  0141 a10b          	cp	a,#11
 662  0143 2402          	jruge	L571
 665  0145 a60a          	ld	a,#10
 666  0147               L571:
 667                     ; 152 		if( i>=80 )	i = 80;
 669  0147 a150          	cp	a,#80
 670  0149 2502          	jrult	L771
 673  014b a650          	ld	a,#80
 674  014d               L771:
 675  014d 6b02          	ld	(OFST+0,sp),a
 676                     ; 155 		j = 1;
 678  014f a601          	ld	a,#1
 679  0151 6b01          	ld	(OFST-1,sp),a
 680  0153               L371:
 681                     ; 157 	if( _dsPrev != i )
 683  0153 c60000        	ld	a,__dsPrev
 684  0156 1102          	cp	a,(OFST+0,sp)
 685  0158 2705          	jreq	L102
 686                     ; 159 		_dsPrev = i;
 688  015a 7b02          	ld	a,(OFST+0,sp)
 689  015c c70000        	ld	__dsPrev,a
 690  015f               L102:
 691                     ; 165 	return j;
 693  015f 7b01          	ld	a,(OFST-1,sp)
 696  0161 85            	popw	x
 697  0162 81            	ret	
 751                     ; 168 uint8_t		disp_status_loop_host_Out(uint8_t key)
 751                     ; 169 {
 752                     	switch	.text
 753  0163               _disp_status_loop_host_Out:
 755  0163 89            	pushw	x
 756       00000002      OFST:	set	2
 759                     ; 171 	uint8_t	j = 0;
 761  0164 0f01          	clr	(OFST-1,sp)
 762                     ; 172 	i = uiInfo.tSetup;
 764  0166 c6000e        	ld	a,_uiInfo+14
 765  0169 6b02          	ld	(OFST+0,sp),a
 766                     ; 173 	if( uiInfo.enc != 0 )
 768  016b c60000        	ld	a,_uiInfo
 769  016e 2704          	jreq	L322
 770                     ; 181 		j = 1;
 772  0170 a601          	ld	a,#1
 773  0172 6b01          	ld	(OFST-1,sp),a
 774  0174               L322:
 775                     ; 183 	if( _dsPrev != i )
 777  0174 c60000        	ld	a,__dsPrev
 778  0177 1102          	cp	a,(OFST+0,sp)
 779  0179 2718          	jreq	L522
 780                     ; 185 		_dsPrev = i;
 782  017b 7b02          	ld	a,(OFST+0,sp)
 783  017d c70000        	ld	__dsPrev,a
 784                     ; 187 		ui_disp_temp_setup(uiInfo.tSetup);
 786  0180 c6000e        	ld	a,_uiInfo+14
 787  0183 cd0000        	call	_ui_disp_temp_setup
 789                     ; 189 		UPDATE_BIT(BIT_TSETUP);
 791  0186 72140000      	bset	__updateBit,#2
 794  018a 5500000000    	mov	__updateTimer,___timer1s
 797  018f 35050000      	mov	__updateCount,#5
 799  0193               L522:
 800                     ; 191 	return j;
 802  0193 7b01          	ld	a,(OFST-1,sp)
 805  0195 85            	popw	x
 806  0196 81            	ret	
 861                     ; 194 uint8_t		disp_status_loop_host_N(uint8_t key)
 861                     ; 195 {
 862                     	switch	.text
 863  0197               _disp_status_loop_host_N:
 865  0197 89            	pushw	x
 866       00000002      OFST:	set	2
 869                     ; 197 	uint8_t	j = 0;
 871  0198 0f01          	clr	(OFST-1,sp)
 872                     ; 198 	i = uiInfo.tSetup;
 874  019a c6000e        	ld	a,_uiInfo+14
 875  019d 6b02          	ld	(OFST+0,sp),a
 876                     ; 199 	if( uiInfo.enc != 0 )
 878  019f c60000        	ld	a,_uiInfo
 879  01a2 2721          	jreq	L742
 880                     ; 202 		i += (uiInfo.enc&0x40)==0 ? -2 : 2;
 882  01a4 a540          	bcp	a,#64
 883  01a6 2604          	jrne	L66
 884  01a8 a6fe          	ld	a,#254
 885  01aa 2002          	jra	L07
 886  01ac               L66:
 887  01ac a602          	ld	a,#2
 888  01ae               L07:
 889  01ae 1b02          	add	a,(OFST+0,sp)
 890                     ; 203 		if( i<=10 )	i = 10;
 892  01b0 a10b          	cp	a,#11
 893  01b2 2402          	jruge	L152
 896  01b4 a60a          	ld	a,#10
 897  01b6               L152:
 898                     ; 204 		if( i>=80 )	i = 80;
 900  01b6 a150          	cp	a,#80
 901  01b8 2502          	jrult	L352
 904  01ba a650          	ld	a,#80
 905  01bc               L352:
 906  01bc 6b02          	ld	(OFST+0,sp),a
 907                     ; 205 		uiInfo.tSetup = i;
 909  01be c7000e        	ld	_uiInfo+14,a
 910                     ; 207 		j = 1;
 912  01c1 a601          	ld	a,#1
 913  01c3 6b01          	ld	(OFST-1,sp),a
 914  01c5               L742:
 915                     ; 209 	if( _dsPrev != i )
 917  01c5 c60000        	ld	a,__dsPrev
 918  01c8 1102          	cp	a,(OFST+0,sp)
 919  01ca 271e          	jreq	L552
 920                     ; 211 		_dsPrev = i;
 922  01cc 7b02          	ld	a,(OFST+0,sp)
 923  01ce c70000        	ld	__dsPrev,a
 924                     ; 213 		ui_disp_temp_setup(uiInfo.tSetup);
 926  01d1 c6000e        	ld	a,_uiInfo+14
 927  01d4 cd0000        	call	_ui_disp_temp_setup
 929                     ; 214 		ui_disp_temp_curr(uiInfo.tCurr);
 931  01d7 c60002        	ld	a,_uiInfo+2
 932  01da cd0000        	call	_ui_disp_temp_curr
 934                     ; 215 		UPDATE_BIT(BIT_TSETUP);
 936  01dd 72140000      	bset	__updateBit,#2
 939  01e1 5500000000    	mov	__updateTimer,___timer1s
 942  01e6 35050000      	mov	__updateCount,#5
 944  01ea               L552:
 945                     ; 217 	return j;
 947  01ea 7b01          	ld	a,(OFST-1,sp)
 950  01ec 85            	popw	x
 951  01ed 81            	ret	
1006                     ; 220 uint8_t	disp_status_loop_host_Y(uint8_t key)
1006                     ; 221 {
1007                     	switch	.text
1008  01ee               _disp_status_loop_host_Y:
1010  01ee 89            	pushw	x
1011       00000002      OFST:	set	2
1014                     ; 223 	uint8_t	j = 0;
1016  01ef 0f01          	clr	(OFST-1,sp)
1017                     ; 224 	i = uiInfo.reserve;
1019  01f1 c6000d        	ld	a,_uiInfo+13
1020  01f4 6b02          	ld	(OFST+0,sp),a
1021                     ; 225 	if( uiInfo.enc != 0 )
1023  01f6 c60000        	ld	a,_uiInfo
1024  01f9 2721          	jreq	L772
1025                     ; 228 		i += (uiInfo.enc&0x40)==0 ? -2 : 2;
1027  01fb a540          	bcp	a,#64
1028  01fd 2604          	jrne	L001
1029  01ff a6fe          	ld	a,#254
1030  0201 2002          	jra	L201
1031  0203               L001:
1032  0203 a602          	ld	a,#2
1033  0205               L201:
1034  0205 1b02          	add	a,(OFST+0,sp)
1035                     ; 229 		if( i<=2 )	i = 2;
1037  0207 a103          	cp	a,#3
1038  0209 2402          	jruge	L103
1041  020b a602          	ld	a,#2
1042  020d               L103:
1043                     ; 230 		if( i>=48 )	i = 48;
1045  020d a130          	cp	a,#48
1046  020f 2502          	jrult	L303
1049  0211 a630          	ld	a,#48
1050  0213               L303:
1051  0213 6b02          	ld	(OFST+0,sp),a
1052                     ; 231 		uiInfo.reserve = i;
1054  0215 c7000d        	ld	_uiInfo+13,a
1055                     ; 233 		j = 1;
1057  0218 a601          	ld	a,#1
1058  021a 6b01          	ld	(OFST-1,sp),a
1059  021c               L772:
1060                     ; 235 	if( _dsPrev != i )
1062  021c c60000        	ld	a,__dsPrev
1063  021f 1102          	cp	a,(OFST+0,sp)
1064  0221 271e          	jreq	L503
1065                     ; 237 		_dsPrev = i;
1067  0223 7b02          	ld	a,(OFST+0,sp)
1068  0225 c70000        	ld	__dsPrev,a
1069                     ; 238 		ui_disp_temp_curr(uiInfo.tCurr);
1071  0228 c60002        	ld	a,_uiInfo+2
1072  022b cd0000        	call	_ui_disp_temp_curr
1074                     ; 239 		ui_disp_reserve_setup(uiInfo.reserve);
1076  022e c6000d        	ld	a,_uiInfo+13
1077  0231 cd0000        	call	_ui_disp_reserve_setup
1079                     ; 240 		UPDATE_BIT(BIT_RESERVE);
1081  0234 72120000      	bset	__updateBit,#1
1084  0238 5500000000    	mov	__updateTimer,___timer1s
1087  023d 35050000      	mov	__updateCount,#5
1089  0241               L503:
1090                     ; 242 	return j;
1092  0241 7b01          	ld	a,(OFST-1,sp)
1095  0243 85            	popw	x
1096  0244 81            	ret	
1151                     ; 245 uint8_t		disp_status_loop_host_B(uint8_t key)
1151                     ; 246 {
1152                     	switch	.text
1153  0245               _disp_status_loop_host_B:
1155  0245 89            	pushw	x
1156       00000002      OFST:	set	2
1159                     ; 248 	uint8_t	j = 0;
1161  0246 0f01          	clr	(OFST-1,sp)
1162                     ; 249 	i = uiInfo.repeat;
1164  0248 c6000c        	ld	a,_uiInfo+12
1165  024b 6b02          	ld	(OFST+0,sp),a
1166                     ; 250 	if( uiInfo.enc != 0 )
1168  024d c60000        	ld	a,_uiInfo
1169  0250 2721          	jreq	L723
1170                     ; 253 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
1172  0252 a540          	bcp	a,#64
1173  0254 2604          	jrne	L211
1174  0256 a6ff          	ld	a,#255
1175  0258 2002          	jra	L411
1176  025a               L211:
1177  025a a601          	ld	a,#1
1178  025c               L411:
1179  025c 1b02          	add	a,(OFST+0,sp)
1180                     ; 254 		if( i<=5 )	i = 5;
1182  025e a106          	cp	a,#6
1183  0260 2402          	jruge	L133
1186  0262 a605          	ld	a,#5
1187  0264               L133:
1188                     ; 255 		if( i>=50 )	i = 50;
1190  0264 a132          	cp	a,#50
1191  0266 2502          	jrult	L333
1194  0268 a632          	ld	a,#50
1195  026a               L333:
1196  026a 6b02          	ld	(OFST+0,sp),a
1197                     ; 256 		uiInfo.repeat = i;
1199  026c c7000c        	ld	_uiInfo+12,a
1200                     ; 258 		j = 1;
1202  026f a601          	ld	a,#1
1203  0271 6b01          	ld	(OFST-1,sp),a
1204  0273               L723:
1205                     ; 260 	if( _dsPrev != i )
1207  0273 c60000        	ld	a,__dsPrev
1208  0276 1102          	cp	a,(OFST+0,sp)
1209  0278 271e          	jreq	L533
1210                     ; 262 		_dsPrev = i;
1212  027a 7b02          	ld	a,(OFST+0,sp)
1213  027c c70000        	ld	__dsPrev,a
1214                     ; 263 		ui_disp_temp_curr(uiInfo.tCurr);
1216  027f c60002        	ld	a,_uiInfo+2
1217  0282 cd0000        	call	_ui_disp_temp_curr
1219                     ; 264 		ui_disp_repeat_setup(uiInfo.repeat);
1221  0285 c6000c        	ld	a,_uiInfo+12
1222  0288 cd0000        	call	_ui_disp_repeat_setup
1224                     ; 265 		UPDATE_BIT(BIT_REPEAT);
1226  028b 72100000      	bset	__updateBit,#0
1229  028f 5500000000    	mov	__updateTimer,___timer1s
1232  0294 35050000      	mov	__updateCount,#5
1234  0298               L533:
1235                     ; 267 	return j;
1237  0298 7b01          	ld	a,(OFST-1,sp)
1240  029a 85            	popw	x
1241  029b 81            	ret	
1244                     	switch	.data
1245  0007               __key_blink:
1246  0007 00            	dc.b	0
1296                     ; 273 void	disp_rid_info(void)
1296                     ; 274 {
1297                     	switch	.text
1298  029c               _disp_rid_info:
1300  029c 5203          	subw	sp,#3
1301       00000003      OFST:	set	3
1304                     ; 280 	j = uiInfo.cnt + uiInfo.cnt_sub;
1306  029e c60005        	ld	a,_uiInfo+5
1307  02a1 cb0006        	add	a,_uiInfo+6
1308  02a4 6b01          	ld	(OFST-2,sp),a
1309                     ; 281 	for( i=1; i<j; i++ )
1311  02a6 a601          	ld	a,#1
1312  02a8 6b03          	ld	(OFST+0,sp),a
1314  02aa 2039          	jra	L363
1315  02ac               L753:
1316                     ; 283 		if( i >= 8 )
1318  02ac a108          	cp	a,#8
1319  02ae 2503          	jrult	L763
1320                     ; 284 			break;
1321  02b0               L563:
1322                     ; 292 }
1325  02b0 5b03          	addw	sp,#3
1326  02b2 81            	ret	
1327  02b3               L763:
1328                     ; 285 		if( packet_buf[i] != 10 ){
1330  02b3 5f            	clrw	x
1331  02b4 97            	ld	xl,a
1332  02b5 d60000        	ld	a,(_packet_buf,x)
1333  02b8 a10a          	cp	a,#10
1334  02ba 271b          	jreq	L173
1335                     ; 286 			led = getHexToBin(_rcLED, i);
1337  02bc 7b03          	ld	a,(OFST+0,sp)
1338  02be 97            	ld	xl,a
1339  02bf c60000        	ld	a,__rcLED
1340  02c2 95            	ld	xh,a
1341  02c3 cd0000        	call	_getHexToBin
1343  02c6 6b02          	ld	(OFST-1,sp),a
1344                     ; 287 			lcd_disp_rid(i + 1, led, 1);
1346  02c8 4b01          	push	#1
1347  02ca 7b03          	ld	a,(OFST+0,sp)
1348  02cc 97            	ld	xl,a
1349  02cd 7b04          	ld	a,(OFST+1,sp)
1350  02cf 4c            	inc	a
1351  02d0 95            	ld	xh,a
1352  02d1 cd0000        	call	_lcd_disp_rid
1354  02d4 84            	pop	a
1356  02d5 200a          	jra	L373
1357  02d7               L173:
1358                     ; 290 			lcd_clear_rid_n(i+1, 1);
1360  02d7 ae0001        	ldw	x,#1
1361  02da 7b03          	ld	a,(OFST+0,sp)
1362  02dc 4c            	inc	a
1363  02dd 95            	ld	xh,a
1364  02de cd0000        	call	_lcd_clear_rid_n
1366  02e1               L373:
1367                     ; 281 	for( i=1; i<j; i++ )
1369  02e1 0c03          	inc	(OFST+0,sp)
1370  02e3 7b03          	ld	a,(OFST+0,sp)
1371  02e5               L363:
1374  02e5 1101          	cp	a,(OFST-2,sp)
1375  02e7 25c3          	jrult	L753
1376  02e9 20c5          	jra	L563
1475                     ; 295 void	disp_status_loop_host(uint8_t key)
1475                     ; 296 {
1476                     	switch	.text
1477  02eb               _disp_status_loop_host:
1479  02eb 88            	push	a
1480  02ec 89            	pushw	x
1481       00000002      OFST:	set	2
1484                     ; 297 	uint8_t	i = 0;
1486  02ed 0f02          	clr	(OFST+0,sp)
1487                     ; 298 	uint8_t	j = 0;
1489                     ; 299 	uint8_t	k = 0;
1491  02ef 0f01          	clr	(OFST-1,sp)
1492                     ; 314 	if (_remote == 0) {
1494  02f1 c60004        	ld	a,__remote
1495  02f4 2602          	jrne	L154
1496                     ; 315 		disp_rid_info();
1498  02f6 ada4          	call	_disp_rid_info
1500  02f8               L154:
1501                     ; 318 	if( __s == 0 )
1503  02f8 c60000        	ld	a,___s
1504  02fb 2703cc06a0    	jrne	L354
1505                     ; 320 		if( _dsCount == 0 )
1507  0300 c60000        	ld	a,__dsCount
1508  0303 260e          	jrne	L554
1509                     ; 322 			_dsCount = 10;
1511  0305 350a0000      	mov	__dsCount,#10
1512                     ; 323 			__sUp = 0;
1514  0309 c70000        	ld	___sUp,a
1515                     ; 324 			__sDn = 0xff;
1517  030c 35ff0000      	mov	___sDn,#255
1519  0310 cc0a05        	jra	L7401
1520  0313               L554:
1521                     ; 326 		} else if (_dsCount == 9) {
1523  0313 a109          	cp	a,#9
1524  0315 260e          	jrne	L164
1525                     ; 327 			_dsCount = 1;
1527  0317 35010000      	mov	__dsCount,#1
1528                     ; 328 			__sDn = 0xff;
1530  031b 35ff0000      	mov	___sDn,#255
1531                     ; 329 			disp_status_loop_init();
1533  031f cd0000        	call	_disp_status_loop_init
1536  0322 cc0a05        	jra	L7401
1537  0325               L164:
1538                     ; 331 		else if( _dsCount == 10 )
1540  0325 a10a          	cp	a,#10
1541  0327 264f          	jrne	L564
1542                     ; 333 			if( __sUp == 0 )		_dsCount = 15;	//	N
1544  0329 c60000        	ld	a,___sUp
1545  032c 2606          	jrne	L764
1548  032e 350f0000      	mov	__dsCount,#15
1550  0332 203e          	jra	L174
1551  0334               L764:
1552                     ; 334 			else if( __sUp == 1 )	_dsCount = 35;	//	Y
1554  0334 a101          	cp	a,#1
1555  0336 2606          	jrne	L374
1558  0338 35230000      	mov	__dsCount,#35
1560  033c 2034          	jra	L174
1561  033e               L374:
1562                     ; 335 			else if( __sUp == 2 )	_dsCount = 25;	//	B
1564  033e a102          	cp	a,#2
1565  0340 2606          	jrne	L774
1568  0342 35190000      	mov	__dsCount,#25
1570  0346 202a          	jra	L174
1571  0348               L774:
1572                     ; 336 			else if( __sUp == 5 )	_dsCount = 45;	//	Out
1574  0348 a105          	cp	a,#5
1575  034a 2606          	jrne	L305
1578  034c 352d0000      	mov	__dsCount,#45
1580  0350 2020          	jra	L174
1581  0352               L305:
1582                     ; 337 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	}
1584  0352 a110          	cp	a,#16
1585  0354 260a          	jrne	L705
1588  0356 35100000      	mov	__dsCount,#16
1591  035a 35080000      	mov	___sUp,#8
1593  035e 2012          	jra	L174
1594  0360               L705:
1595                     ; 338 			else if( __sUp == 101 )	{	_dsCount = 0;	__s = 101; }
1597  0360 a165          	cp	a,#101
1598  0362 260a          	jrne	L315
1601  0364 725f0000      	clr	__dsCount
1604  0368 35650000      	mov	___s,#101
1606  036c 2004          	jra	L174
1607  036e               L315:
1608                     ; 340 				_dsCount = 1;
1610  036e 35010000      	mov	__dsCount,#1
1611  0372               L174:
1612                     ; 341 			disp_status_loop_init();
1614  0372 cd0000        	call	_disp_status_loop_init
1617  0375 cc0a05        	jra	L7401
1618  0378               L564:
1619                     ; 346 		else if( _dsCount == 15 )			//	N/Out
1621  0378 a10f          	cp	a,#15
1622  037a 2661          	jrne	L125
1623                     ; 348 			if( key==1 )		_GOTO(101)	//	TBD//Remote
1625  037c 7b03          	ld	a,(OFST+1,sp)
1626  037e a101          	cp	a,#1
1627  0380 260a          	jrne	L325
1630  0382 35650000      	mov	___sUp,#101
1633  0386 350a0000      	mov	__dsCount,#10
1635  038a 2040          	jra	L525
1636  038c               L325:
1637                     ; 349 			else if( key==2 )	_GOTO2(1, 0)	//	Y/B
1639  038c a102          	cp	a,#2
1640  038e 260e          	jrne	L725
1643  0390 35010000      	mov	___sUp,#1
1646  0394 350a0000      	mov	__dsCount,#10
1650  0398 725f0000      	clr	___sDn
1652  039c 202e          	jra	L525
1653  039e               L725:
1654                     ; 350 			else if( key==4 )	_GOTO(16)	//	Out
1656  039e a104          	cp	a,#4
1657  03a0 260a          	jrne	L335
1660  03a2 35100000      	mov	___sUp,#16
1663  03a6 350a0000      	mov	__dsCount,#10
1665  03aa 2020          	jra	L525
1666  03ac               L335:
1667                     ; 351 			else if( key==8 )	_GOTO(5)	//	Off
1669  03ac a108          	cp	a,#8
1670  03ae 260a          	jrne	L735
1673  03b0 35050000      	mov	___sUp,#5
1676  03b4 350a0000      	mov	__dsCount,#10
1678  03b8 2012          	jra	L525
1679  03ba               L735:
1680                     ; 352 			else if( key==16 )	_DN
1682  03ba a110          	cp	a,#16
1683  03bc 2606          	jrne	L345
1686  03be 35400000      	mov	_uiInfo,#64
1688  03c2 2008          	jra	L525
1689  03c4               L345:
1690                     ; 353 			else if( key==32 )	_UP
1692  03c4 a120          	cp	a,#32
1693  03c6 2604          	jrne	L525
1696  03c8 35010000      	mov	_uiInfo,#1
1697  03cc               L525:
1698                     ; 354 			i = disp_status_loop_host_N(key);
1700  03cc 7b03          	ld	a,(OFST+1,sp)
1701  03ce cd0197        	call	_disp_status_loop_host_N
1703  03d1 6b02          	ld	(OFST+0,sp),a
1704                     ; 355 			if( i==1 )
1706  03d3 4a            	dec	a
1707  03d4 269f          	jrne	L7401
1708                     ; 356 				_key_blink = 1;
1710  03d6 35010007      	mov	__key_blink,#1
1711  03da cc0a05        	jra	L7401
1712  03dd               L125:
1713                     ; 358 		else if( _dsCount == 16 )			//	OUT
1715  03dd a110          	cp	a,#16
1716  03df 263d          	jrne	L555
1717                     ; 360 			if( key==1 )		_GOTO(101)	//	TBD//Y
1719  03e1 7b03          	ld	a,(OFST+1,sp)
1720  03e3 a101          	cp	a,#1
1721  03e5 2606          	jrne	L755
1724  03e7 35650000      	mov	___sUp,#101
1727  03eb 201c          	jp	LC001
1728  03ed               L755:
1729                     ; 361 			else if( key==2 )	_GOTO(1)	//	Y
1731  03ed a102          	cp	a,#2
1732  03ef 2606          	jrne	L365
1735  03f1 35010000      	mov	___sUp,#1
1738  03f5 2012          	jp	LC001
1739  03f7               L365:
1740                     ; 362 			else if( key==4 )	_GOTO(0)	//	N
1742  03f7 a104          	cp	a,#4
1743  03f9 2606          	jrne	L765
1746  03fb 725f0000      	clr	___sUp
1749  03ff 2008          	jp	LC001
1750  0401               L765:
1751                     ; 363 			else if( key==8 )	_GOTO(5)	//	Off
1753  0401 a108          	cp	a,#8
1754  0403 260a          	jrne	L165
1757  0405 35050000      	mov	___sUp,#5
1760  0409               LC001:
1764  0409 350a0000      	mov	__dsCount,#10
1765  040d 7b03          	ld	a,(OFST+1,sp)
1766  040f               L165:
1767                     ; 364 			i = disp_status_loop_host_Out(key);
1769  040f cd0163        	call	_disp_status_loop_host_Out
1771  0412 6b02          	ld	(OFST+0,sp),a
1772                     ; 365 			if( i==1 )
1774  0414 4a            	dec	a
1775  0415 26c3          	jrne	L7401
1776                     ; 366 				_key_blink = 1;
1778  0417 35010007      	mov	__key_blink,#1
1779  041b cc0a05        	jra	L7401
1780  041e               L555:
1781                     ; 368 		else if( _dsCount == 25 )			//	B
1783  041e a119          	cp	a,#25
1784  0420 2661          	jrne	L106
1785                     ; 370 			if( key==1 )		_GOTO(101)	//	Y
1787  0422 7b03          	ld	a,(OFST+1,sp)
1788  0424 a101          	cp	a,#1
1789  0426 260a          	jrne	L306
1792  0428 35650000      	mov	___sUp,#101
1795  042c 350a0000      	mov	__dsCount,#10
1797  0430 2040          	jra	L506
1798  0432               L306:
1799                     ; 371 			else if( key==2 )	
1801  0432 a102          	cp	a,#2
1802  0434 260e          	jrne	L706
1803                     ; 373 				__sDn = 0;
1805  0436 725f0000      	clr	___sDn
1806                     ; 374 				_GOTO(1)	//	Y
1808  043a 35010000      	mov	___sUp,#1
1811  043e 350a0000      	mov	__dsCount,#10
1813  0442 202e          	jra	L506
1814  0444               L706:
1815                     ; 376 			else if( key==4 )	_GOTO(0)	//	N
1817  0444 a104          	cp	a,#4
1818  0446 260a          	jrne	L316
1821  0448 725f0000      	clr	___sUp
1824  044c 350a0000      	mov	__dsCount,#10
1826  0450 2020          	jra	L506
1827  0452               L316:
1828                     ; 377 			else if( key==8 )	_GOTO(5)	//	Off
1830  0452 a108          	cp	a,#8
1831  0454 260a          	jrne	L716
1834  0456 35050000      	mov	___sUp,#5
1837  045a 350a0000      	mov	__dsCount,#10
1839  045e 2012          	jra	L506
1840  0460               L716:
1841                     ; 378 			else if( key==16 )	_DN
1843  0460 a110          	cp	a,#16
1844  0462 2606          	jrne	L326
1847  0464 35400000      	mov	_uiInfo,#64
1849  0468 2008          	jra	L506
1850  046a               L326:
1851                     ; 379 			else if( key==32 )	_UP
1853  046a a120          	cp	a,#32
1854  046c 2604          	jrne	L506
1857  046e 35010000      	mov	_uiInfo,#1
1858  0472               L506:
1859                     ; 383 				i = disp_status_loop_host_B(key);
1861  0472 7b03          	ld	a,(OFST+1,sp)
1862  0474 cd0245        	call	_disp_status_loop_host_B
1864  0477 6b02          	ld	(OFST+0,sp),a
1865                     ; 384 			if( i==1 )
1867  0479 4a            	dec	a
1868  047a 269f          	jrne	L7401
1869                     ; 385 				_key_blink = 1;
1871  047c 35010007      	mov	__key_blink,#1
1872  0480 cc0a05        	jra	L7401
1873  0483               L106:
1874                     ; 387 		else if( _dsCount == 35 )			//	Y
1876  0483 a123          	cp	a,#35
1877  0485 2661          	jrne	L536
1878                     ; 389 			if( key==1 )		_GOTO(101)	//	N
1880  0487 7b03          	ld	a,(OFST+1,sp)
1881  0489 a101          	cp	a,#1
1882  048b 260a          	jrne	L736
1885  048d 35650000      	mov	___sUp,#101
1888  0491 350a0000      	mov	__dsCount,#10
1890  0495 2040          	jra	L146
1891  0497               L736:
1892                     ; 390 			else if( key==2 )	
1894  0497 a102          	cp	a,#2
1895  0499 260e          	jrne	L346
1896                     ; 392 				__sDn = 1;
1898  049b 35010000      	mov	___sDn,#1
1899                     ; 393 				_GOTO(2)	//	B
1901  049f 35020000      	mov	___sUp,#2
1904  04a3 350a0000      	mov	__dsCount,#10
1906  04a7 202e          	jra	L146
1907  04a9               L346:
1908                     ; 395 			else if( key==4 )	_GOTO(0)	//	N
1910  04a9 a104          	cp	a,#4
1911  04ab 260a          	jrne	L746
1914  04ad 725f0000      	clr	___sUp
1917  04b1 350a0000      	mov	__dsCount,#10
1919  04b5 2020          	jra	L146
1920  04b7               L746:
1921                     ; 396 			else if( key==8 )	_GOTO(5)	//	Off
1923  04b7 a108          	cp	a,#8
1924  04b9 260a          	jrne	L356
1927  04bb 35050000      	mov	___sUp,#5
1930  04bf 350a0000      	mov	__dsCount,#10
1932  04c3 2012          	jra	L146
1933  04c5               L356:
1934                     ; 397 			else if( key==16 )	_DN
1936  04c5 a110          	cp	a,#16
1937  04c7 2606          	jrne	L756
1940  04c9 35400000      	mov	_uiInfo,#64
1942  04cd 2008          	jra	L146
1943  04cf               L756:
1944                     ; 398 			else if( key==32 )	_UP
1946  04cf a120          	cp	a,#32
1947  04d1 2604          	jrne	L146
1950  04d3 35010000      	mov	_uiInfo,#1
1951  04d7               L146:
1952                     ; 399 			i = disp_status_loop_host_Y(key);
1954  04d7 7b03          	ld	a,(OFST+1,sp)
1955  04d9 cd01ee        	call	_disp_status_loop_host_Y
1957  04dc 6b02          	ld	(OFST+0,sp),a
1958                     ; 400 			if( i==1 )
1960  04de 4a            	dec	a
1961  04df 269f          	jrne	L7401
1962                     ; 401 				_key_blink = 1;
1964  04e1 35010007      	mov	__key_blink,#1
1965  04e5 cc0a05        	jra	L7401
1966  04e8               L536:
1967                     ; 403 		else if( _dsCount == 45 )			//	OUT
1969  04e8 a12d          	cp	a,#45
1970  04ea 2637          	jrne	L176
1971                     ; 405 			if( key==1 )		_GOTO(101)	//	TBD
1973  04ec 7b03          	ld	a,(OFST+1,sp)
1974  04ee a101          	cp	a,#1
1975  04f0 2606          	jrne	L376
1978  04f2 35650000      	mov	___sUp,#101
1981  04f6 2016          	jp	LC002
1982  04f8               L376:
1983                     ; 406 			else if( key==2 )	_GOTO(1)	//	Y
1985  04f8 a102          	cp	a,#2
1986  04fa 2606          	jrne	L776
1989  04fc 35010000      	mov	___sUp,#1
1992  0500 200c          	jp	LC002
1993  0502               L776:
1994                     ; 407 			else if( key==4 )	_GOTO(0)	//	N
1996  0502 a104          	cp	a,#4
2000  0504 2704          	jreq	LC003
2001                     ; 408 			else if( key==8 )	_GOTO(0)	//	On
2003  0506 a108          	cp	a,#8
2004  0508 260a          	jrne	L576
2007  050a               LC003:
2009  050a 725f0000      	clr	___sUp
2012  050e               LC002:
2016  050e 350a0000      	mov	__dsCount,#10
2017  0512 7b03          	ld	a,(OFST+1,sp)
2018  0514               L576:
2019                     ; 409 			i = disp_status_loop_host_Off(key);
2021  0514 cd0128        	call	_disp_status_loop_host_Off
2023  0517 6b02          	ld	(OFST+0,sp),a
2024                     ; 410 			if( i==1 )
2026  0519 4a            	dec	a
2027  051a 26c9          	jrne	L7401
2028                     ; 411 				_key_blink = 1;
2030  051c 35010007      	mov	__key_blink,#1
2031  0520 cc0a05        	jra	L7401
2032  0523               L176:
2033                     ; 413 		else if( _dsCount == 11 )
2035  0523 a10b          	cp	a,#11
2036  0525 2617          	jrne	L517
2037                     ; 415 			_dsCount = 2;
2039  0527 35020000      	mov	__dsCount,#2
2040                     ; 416 			__sUp = 0xff;
2042  052b 35ff0000      	mov	___sUp,#255
2043                     ; 417 			disp_status_loop_init();
2045  052f cd0000        	call	_disp_status_loop_init
2047                     ; 418 			disp_status_loop_messageDn(__sDn);
2049  0532 c60000        	ld	a,___sDn
2050  0535 cd0000        	call	_disp_status_loop_messageDn
2052                     ; 419 			disp_status_curr_only();
2054  0538 cd0000        	call	_disp_status_curr_only
2057  053b cc0a05        	jra	L7401
2058  053e               L517:
2059                     ; 421 		else if( _dsCount == 1 )
2061  053e a101          	cp	a,#1
2062  0540 2703cc064a    	jrne	L127
2063                     ; 426 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
2065  0545 c60000        	ld	a,___sUp
2066  0548 2607          	jrne	L327
2069  054a 7b03          	ld	a,(OFST+1,sp)
2070  054c cd0197        	call	_disp_status_loop_host_N
2073  054f 2014          	jp	LC004
2074  0551               L327:
2075                     ; 427 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
2077  0551 a101          	cp	a,#1
2078  0553 2607          	jrne	L727
2081  0555 7b03          	ld	a,(OFST+1,sp)
2082  0557 cd01ee        	call	_disp_status_loop_host_Y
2085  055a 2009          	jp	LC004
2086  055c               L727:
2087                     ; 428 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
2089  055c a102          	cp	a,#2
2090  055e 2607          	jrne	L527
2093  0560 7b03          	ld	a,(OFST+1,sp)
2094  0562 cd0245        	call	_disp_status_loop_host_B
2096  0565               LC004:
2097  0565 6b02          	ld	(OFST+0,sp),a
2098  0567               L527:
2099                     ; 430 			if( i==1 )
2101  0567 7b02          	ld	a,(OFST+0,sp)
2102  0569 4a            	dec	a
2103  056a 2604          	jrne	L537
2104                     ; 431 				_key_blink = 1;
2106  056c 4c            	inc	a
2107  056d c70007        	ld	__key_blink,a
2108  0570               L537:
2109                     ; 434 			_disp_temp = __sUp==0 ? 1 : 0;
2111  0570 c60000        	ld	a,___sUp
2112  0573 2603          	jrne	L071
2113  0575 4c            	inc	a
2114  0576 2001          	jra	L271
2115  0578               L071:
2116  0578 4f            	clr	a
2117  0579               L271:
2118  0579 c70000        	ld	__disp_temp,a
2119                     ; 435 			if( _disp_temp == 0 && _key_blink == 0 )
2121  057c 261c          	jrne	L737
2123  057e c60007        	ld	a,__key_blink
2124  0581 2617          	jrne	L737
2125                     ; 437 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
2127  0583 c60000        	ld	a,___sUp
2128  0586 a101          	cp	a,#1
2129  0588 270c          	jreq	L347
2131  058a a102          	cp	a,#2
2132  058c 2708          	jreq	L347
2134  058e a105          	cp	a,#5
2135  0590 2704          	jreq	L347
2137  0592 a108          	cp	a,#8
2138  0594 2604          	jrne	L737
2139  0596               L347:
2140                     ; 438 					_disp_temp = 1;
2142  0596 35010000      	mov	__disp_temp,#1
2143  059a               L737:
2144                     ; 441 			if( key == 1 )
2146  059a 7b03          	ld	a,(OFST+1,sp)
2147  059c a101          	cp	a,#1
2148  059e 2611          	jrne	L157
2149                     ; 443 				__sUp = (__sUp+1) % 3;
2151  05a0 c60000        	ld	a,___sUp
2152  05a3 5f            	clrw	x
2153  05a4 97            	ld	xl,a
2154  05a5 5c            	incw	x
2155  05a6 a603          	ld	a,#3
2156  05a8 cd0000        	call	c_smodx
2158  05ab 01            	rrwa	x,a
2159  05ac c70000        	ld	___sUp,a
2160  05af 206c          	jra	L573
2161  05b1               L157:
2162                     ; 454 			else if( key == 2 )
2164  05b1 a102          	cp	a,#2
2165  05b3 261c          	jrne	L557
2166                     ; 456 				__sUp = 0xff;
2168  05b5 35ff0000      	mov	___sUp,#255
2169                     ; 457 				__sDn = 0;
2171  05b9 725f0000      	clr	___sDn
2172                     ; 458 				disp_status_loop_messageDn(__sDn);
2174  05bd 4f            	clr	a
2175  05be cd0000        	call	_disp_status_loop_messageDn
2177                     ; 459 				disp_status_curr_only();
2179  05c1 cd0000        	call	_disp_status_curr_only
2181                     ; 460 				lcd_blink_clear();
2183  05c4 cd0000        	call	_lcd_blink_clear
2185                     ; 461 				_dsCount = 2;
2187  05c7 35020000      	mov	__dsCount,#2
2188                     ; 462 				_dsPrev = 0xff;
2190  05cb 35ff0000      	mov	__dsPrev,#255
2191                     ; 464 				_key_blink = 0;
2193  05cf 201c          	jp	LC005
2194  05d1               L557:
2195                     ; 466 			else if( key == 3 )
2197  05d1 a103          	cp	a,#3
2198  05d3 265d          	jrne	L167
2199                     ; 468 				if( __sUp == 0 )
2201  05d5 c60000        	ld	a,___sUp
2202  05d8 2635          	jrne	L367
2203                     ; 470 					if( _key_blink == 0 )
2205  05da c60007        	ld	a,__key_blink
2206  05dd 260b          	jrne	L377
2207  05df cc067e        	jra	L773
2208  05e2               L767:
2209                     ; 476 							__s = 1;
2211  05e2 35010000      	mov	___s,#1
2212  05e6               L177:
2213                     ; 477 						_dsCount = 0;
2215  05e6 725f0000      	clr	__dsCount
2216  05ea               L377:
2217                     ; 490 				disp_status_loop_init();
2220  05ea cd0000        	call	_disp_status_loop_init
2222                     ; 492 				_key_blink = 0;
2224  05ed               LC005:
2227  05ed 725f0007      	clr	__key_blink
2229  05f1               L357:
2230                     ; 509 			if( _key_blink == 1 )
2232  05f1 c60007        	ld	a,__key_blink
2233  05f4 4a            	dec	a
2234  05f5 2703cc0a05    	jrne	L7401
2235                     ; 511 				if( _key_sec >= KEY_BLINK_FADE )
2237  05fa c60000        	ld	a,__key_sec
2238  05fd a10a          	cp	a,#10
2239  05ff 25f6          	jrult	L7401
2240                     ; 514 					lcd_blink_clear();
2242  0601 cd0000        	call	_lcd_blink_clear
2244                     ; 515 					_key_blink = 0;
2246  0604 725f0007      	clr	__key_blink
2247                     ; 516 					_dsCount = 10;
2249  0608 350a0000      	mov	__dsCount,#10
2250  060c cc0a05        	jra	L7401
2251  060f               L367:
2252                     ; 480 				else if( __sUp == 1 )	
2254  060f a101          	cp	a,#1
2255                     ; 482 					if( _key_blink != 1 )
2256                     ; 483 						goto SetupEntry2;
2258  0611 2704          	jreq	LC007
2259                     ; 485 				else if( __sUp == 2 )	
2261  0613 a102          	cp	a,#2
2262  0615 26d3          	jrne	L377
2263                     ; 487 					if( _key_blink != 1 )
2265  0617               LC007:
2267  0617 c60007        	ld	a,__key_blink
2268  061a 4a            	dec	a
2269  061b 27cd          	jreq	L377
2270                     ; 488 						goto SetupEntry2;
2271  061d               L573:
2272                     ; 444 SetupEntry2:				
2272                     ; 445 //				if( __sUp == 0 )		i = bS6;
2272                     ; 446 //				else if( __sUp == 1 )	i = bS7;
2272                     ; 447 //				else					i = bS8;
2272                     ; 448 				lcd_blink_item(i);
2274  061d 7b02          	ld	a,(OFST+0,sp)
2275  061f cd0000        	call	_lcd_blink_item
2277                     ; 449 				disp_status_loop_message(__sUp);
2279  0622 c60000        	ld	a,___sUp
2280  0625 cd0000        	call	_disp_status_loop_message
2282                     ; 450 				_dsPrev = 0xff;
2284  0628 35ff0000      	mov	__dsPrev,#255
2285                     ; 452 				_key_blink = 1;
2287  062c 35010007      	mov	__key_blink,#1
2289  0630 20bf          	jra	L357
2290  0632               L167:
2291                     ; 494 			else if( key == 4 )
2293  0632 a104          	cp	a,#4
2294  0634 26bb          	jrne	L357
2295                     ; 496 				if( _key_blink == 1 )
2297  0636 c60007        	ld	a,__key_blink
2298  0639 4a            	dec	a
2299                     ; 499 					disp_status_loop_init();
2301                     ; 500 					_key_blink = 0;
2303  063a 27ae          	jreq	L377
2304                     ; 504 					__s = 3;
2306  063c 35030000      	mov	___s,#3
2307                     ; 505 					_dsCount = 0;
2309  0640 725f0000      	clr	__dsCount
2310                     ; 506 					_dsPrev = 0xff;
2312  0644 35ff0000      	mov	__dsPrev,#255
2313  0648 20a7          	jra	L357
2314  064a               L127:
2315                     ; 520 		else if( _dsCount == 2 )
2317  064a a102          	cp	a,#2
2318  064c 26be          	jrne	L7401
2319                     ; 522 			_disp_temp = 1;
2321  064e 35010000      	mov	__disp_temp,#1
2322                     ; 523 			if( key == 1 )
2324  0652 7b03          	ld	a,(OFST+1,sp)
2325  0654 a101          	cp	a,#1
2326  0656 260a          	jrne	L7201
2327                     ; 525 				__sUp = 0;
2329  0658 725f0000      	clr	___sUp
2330                     ; 526 				_dsCount = 0;
2332  065c 725f0000      	clr	__dsCount
2334  0660 202b          	jra	L7301
2335  0662               L7201:
2336                     ; 528 			else if( key == 2 )
2338  0662 a102          	cp	a,#2
2339  0664 2614          	jrne	L3301
2340                     ; 530 				__sDn = __sDn==0 ? 1 : 0;
2342  0666 c60000        	ld	a,___sDn
2343  0669 2603          	jrne	L412
2344  066b 4c            	inc	a
2345  066c 2001          	jra	L612
2346  066e               L412:
2347  066e 4f            	clr	a
2348  066f               L612:
2349  066f c70000        	ld	___sDn,a
2350                     ; 531 				disp_status_loop_messageDn(__sDn);
2352  0672 cd0000        	call	_disp_status_loop_messageDn
2354                     ; 532 				disp_status_curr_only();
2356  0675 cd0000        	call	_disp_status_curr_only
2359  0678 2013          	jra	L7301
2360  067a               L3301:
2361                     ; 534 			else if( key == 3 )	{	goto SetupEntry;	}
2363  067a a103          	cp	a,#3
2364  067c 260f          	jrne	L7301
2366  067e               L773:
2367                     ; 472 SetupEntry:				
2367                     ; 473 						if( uiInfo.cntlMode == 0 )
2369  067e c60003        	ld	a,_uiInfo+3
2370  0681 2703cc05e2    	jrne	L767
2371                     ; 474 							__s = 4;
2373  0686 35040000      	mov	___s,#4
2375  068a cc05e6        	jra	L177
2376  068d               L7301:
2377                     ; 535 			else if( key == 4 )
2379                     ; 538 			if( uiInfo.enc != 0 )
2381  068d c60000        	ld	a,_uiInfo
2382  0690 2603cc0a05    	jreq	L7401
2383                     ; 540 				__sUp = 0;
2385  0695 725f0000      	clr	___sUp
2386                     ; 541 				_dsCount = 0;
2388  0699 725f0000      	clr	__dsCount
2389  069d cc0a05        	jra	L7401
2390  06a0               L354:
2391                     ; 545 	else if( __s == 1 )
2393  06a0 a101          	cp	a,#1
2394  06a2 2703cc077e    	jrne	L1501
2395                     ; 548 		if( _dsCount == 0 )
2397  06a7 c60000        	ld	a,__dsCount
2398  06aa 2625          	jrne	L3501
2399                     ; 550 			lcd_clear(0);
2401  06ac cd0000        	call	_lcd_clear
2403                     ; 551 			__sInfo = 1;
2405  06af 35010000      	mov	___sInfo,#1
2406                     ; 552 			lcd_disp_info(__sInfo, 0, 0);
2408  06b3 4b00          	push	#0
2409  06b5 ae0100        	ldw	x,#256
2410  06b8 cd0000        	call	_lcd_disp_info
2412  06bb 84            	pop	a
2413                     ; 553 			UI_DISP_2Digit(_boiler_water_heat);
2415  06bc c60002        	ld	a,__boiler_water_heat
2416  06bf cd0a5c        	call	LC018
2420  06c2 c60002        	ld	a,__boiler_water_heat
2421  06c5 cd0a50        	call	LC017
2423                     ; 555 			lcd_disp_info_shower(0x08, 0);
2426  06c8 ae0800        	ldw	x,#2048
2427  06cb cd0a6f        	call	LC020
2428                     ; 557 			_dsPrev = 0xff;
2429  06ce cc0a05        	jra	L7401
2430  06d1               L3501:
2431                     ; 559 		else if( _dsCount == 1 )
2433  06d1 4a            	dec	a
2434  06d2 26fa          	jrne	L7401
2435                     ; 561 			i = _boiler_water_heat;
2437  06d4 c60002        	ld	a,__boiler_water_heat
2438  06d7 6b02          	ld	(OFST+0,sp),a
2439                     ; 562 			if( uiInfo.enc != 0 )
2441  06d9 c60000        	ld	a,_uiInfo
2442  06dc 2723          	jreq	L1601
2443                     ; 564 				ENC_MOVE_0(40,80,5);
2445  06de a540          	bcp	a,#64
2446  06e0 260e          	jrne	L3601
2449  06e2 7b02          	ld	a,(OFST+0,sp)
2450  06e4 a129          	cp	a,#41
2451  06e6 2404          	jruge	L5601
2454  06e8 a650          	ld	a,#80
2456  06ea 2010          	jra	L1701
2457  06ec               L5601:
2460  06ec a005          	sub	a,#5
2461  06ee 200c          	jra	L1701
2462  06f0               L3601:
2465  06f0 7b02          	ld	a,(OFST+0,sp)
2466  06f2 a150          	cp	a,#80
2467  06f4 2504          	jrult	L3701
2470  06f6 a628          	ld	a,#40
2472  06f8 2002          	jra	L1701
2473  06fa               L3701:
2476  06fa ab05          	add	a,#5
2477  06fc               L1701:
2478  06fc 6b02          	ld	(OFST+0,sp),a
2479                     ; 565 				_boiler_water_heat = i;
2482  06fe c70002        	ld	__boiler_water_heat,a
2483  0701               L1601:
2484                     ; 567 			if( _dsPrev != i )
2486  0701 c60000        	ld	a,__dsPrev
2487  0704 1102          	cp	a,(OFST+0,sp)
2488  0706 270d          	jreq	L7701
2489                     ; 569 				_dsPrev = i;
2491  0708 7b02          	ld	a,(OFST+0,sp)
2492  070a c70000        	ld	__dsPrev,a
2493                     ; 570 				UI_DISP_2Digit(i);
2495  070d cd0a5c        	call	LC018
2499  0710 7b02          	ld	a,(OFST+0,sp)
2500  0712 cd0a50        	call	LC017
2503  0715               L7701:
2504                     ; 573 			if( key == 1 )		{	EXIT_HOST(0);	}
2506  0715 7b03          	ld	a,(OFST+1,sp)
2507  0717 a101          	cp	a,#1
2508  0719 260a          	jrne	L1011
2511  071b 725f0000      	clr	___s
2514  071f 725f0000      	clr	__dsCount
2522  0723 2010          	jp	LC009
2523  0725               L1011:
2524                     ; 574 			else if( key == 2 )	{	EXIT_HOST3(0);	}
2526  0725 a102          	cp	a,#2
2527  0727 261d          	jrne	L5011
2530  0729 725f0000      	clr	___s
2533  072d 725f0000      	clr	___sDn
2536  0731 350b0000      	mov	__dsCount,#11
2544  0735               LC009:
2546  0735 35ff0000      	mov	__dsPrev,#255
2548  0739 cd0000        	call	_lcd_blink_clear
2550  073c 4b00          	push	#0
2551  073e cd0a67        	call	LC019
2552  0741 cd0000        	call	_lcd_disp_info
2556  0744 201f          	jp	LC008
2557  0746               L5011:
2558                     ; 575 			else if( key == 3 )	{	EXIT_HOST(0);	__s = 2;	}
2560  0746 a103          	cp	a,#3
2561  0748 261c          	jrne	L1111
2564  074a 725f0000      	clr	___s
2567  074e 725f0000      	clr	__dsCount
2570  0752 35ff0000      	mov	__dsPrev,#255
2573  0756 cd0000        	call	_lcd_blink_clear
2577  0759 4b00          	push	#0
2578  075b cd0a67        	call	LC019
2579  075e cd0000        	call	_lcd_disp_info
2581  0761 35020000      	mov	___s,#2
2582  0765               LC008:
2583  0765 84            	pop	a
2588  0766               L1111:
2589                     ; 576 			else if( key == 4 )	{
2591                     ; 578 			if( _key_min == KEY_BOILER_FADE )
2593  0766 c60000        	ld	a,__key_min
2594  0769 a10a          	cp	a,#10
2595  076b 2703cc0a05    	jrne	L7401
2596                     ; 581 				EXIT_HOST(0);
2598  0770 725f0000      	clr	___s
2601  0774 725f0000      	clr	__dsCount
2604  0778 cd0a3a        	call	LC015
2606  077b cc0a05        	jra	L7401
2607  077e               L1501:
2608                     ; 585 	else if( __s == 2 )
2610  077e a102          	cp	a,#2
2611  0780 2703cc0843    	jrne	L3211
2612                     ; 588 		if( _dsCount == 0 )
2614  0785 c60000        	ld	a,__dsCount
2615  0788 2625          	jrne	L5211
2616                     ; 590 			lcd_clear(0);
2618  078a cd0000        	call	_lcd_clear
2620                     ; 591 			__sInfo = 2;
2622  078d 35020000      	mov	___sInfo,#2
2623                     ; 592 			lcd_disp_info(__sInfo, 0, 0);
2625  0791 4b00          	push	#0
2626  0793 ae0200        	ldw	x,#512
2627  0796 cd0000        	call	_lcd_disp_info
2629  0799 84            	pop	a
2630                     ; 593 			UI_DISP_2Digit(_boiler_water_shower);
2632  079a c60001        	ld	a,__boiler_water_shower
2633  079d cd0a5c        	call	LC018
2637  07a0 c60001        	ld	a,__boiler_water_shower
2638  07a3 cd0a50        	call	LC017
2640                     ; 595 			lcd_disp_info_shower(0x80, 0);
2643  07a6 ae8000        	ldw	x,#32768
2644  07a9 cd0a6f        	call	LC020
2645                     ; 597 			_dsPrev = 0xff;
2646  07ac cc0a05        	jra	L7401
2647  07af               L5211:
2648                     ; 599 		else if( _dsCount == 1 )
2650  07af 4a            	dec	a
2651  07b0 26fa          	jrne	L7401
2652                     ; 601 			i = _boiler_water_shower;
2654  07b2 c60001        	ld	a,__boiler_water_shower
2655  07b5 6b02          	ld	(OFST+0,sp),a
2656                     ; 602 			if( uiInfo.enc != 0 )
2658  07b7 c60000        	ld	a,_uiInfo
2659  07ba 2723          	jreq	L3311
2660                     ; 604 				ENC_MOVE_0(40,70,5);
2662  07bc a540          	bcp	a,#64
2663  07be 260e          	jrne	L5311
2666  07c0 7b02          	ld	a,(OFST+0,sp)
2667  07c2 a129          	cp	a,#41
2668  07c4 2404          	jruge	L7311
2671  07c6 a646          	ld	a,#70
2673  07c8 2010          	jra	L3411
2674  07ca               L7311:
2677  07ca a005          	sub	a,#5
2678  07cc 200c          	jra	L3411
2679  07ce               L5311:
2682  07ce 7b02          	ld	a,(OFST+0,sp)
2683  07d0 a146          	cp	a,#70
2684  07d2 2504          	jrult	L5411
2687  07d4 a628          	ld	a,#40
2689  07d6 2002          	jra	L3411
2690  07d8               L5411:
2693  07d8 ab05          	add	a,#5
2694  07da               L3411:
2695  07da 6b02          	ld	(OFST+0,sp),a
2696                     ; 605 				_boiler_water_shower = i;
2699  07dc c70001        	ld	__boiler_water_shower,a
2700  07df               L3311:
2701                     ; 607 			if( _dsPrev != i )
2703  07df c60000        	ld	a,__dsPrev
2704  07e2 1102          	cp	a,(OFST+0,sp)
2705  07e4 270d          	jreq	L1511
2706                     ; 609 				_dsPrev = i;
2708  07e6 7b02          	ld	a,(OFST+0,sp)
2709  07e8 c70000        	ld	__dsPrev,a
2710                     ; 610 				UI_DISP_2Digit(i);
2712  07eb cd0a5c        	call	LC018
2716  07ee 7b02          	ld	a,(OFST+0,sp)
2717  07f0 cd0a50        	call	LC017
2720  07f3               L1511:
2721                     ; 613 			if( key == 1 )		{	EXIT_HOST(0);	}
2723  07f3 7b03          	ld	a,(OFST+1,sp)
2724  07f5 a101          	cp	a,#1
2725  07f7 260a          	jrne	L3511
2728  07f9 725f0000      	clr	___s
2731  07fd 725f0000      	clr	__dsCount
2739  0801 2010          	jp	LC010
2740  0803               L3511:
2741                     ; 614 			else if( key == 2 )	{	EXIT_HOST3(0);	}
2743  0803 a102          	cp	a,#2
2744  0805 2611          	jrne	L7511
2747  0807 725f0000      	clr	___s
2750  080b 725f0000      	clr	___sDn
2753  080f 350b0000      	mov	__dsCount,#11
2762  0813               LC010:
2764  0813 cd0a3a        	call	LC015
2767  0816 2013          	jra	L3611
2768  0818               L7511:
2769                     ; 615 			else if( key == 3 )	{	/*EXIT_HOST(0);*/
2771  0818 a103          	cp	a,#3
2772  081a 260f          	jrne	L3611
2773                     ; 616 				__s = 4;
2775  081c 35040000      	mov	___s,#4
2776                     ; 617 				_dsCount = 0;
2778  0820 725f0000      	clr	__dsCount
2779                     ; 618 				lcd_blink_clear();
2781  0824 cd0000        	call	_lcd_blink_clear
2783                     ; 619 				_key_blink = 0;
2785  0827 725f0007      	clr	__key_blink
2787  082b               L3611:
2788                     ; 621 			else if( key == 4 )	{
2790                     ; 623 			if( _key_min == KEY_BOILER_FADE )
2792  082b c60000        	ld	a,__key_min
2793  082e a10a          	cp	a,#10
2794  0830 2703cc0a05    	jrne	L7401
2795                     ; 626 				EXIT_HOST(0);
2797  0835 725f0000      	clr	___s
2800  0839 725f0000      	clr	__dsCount
2803  083d cd0a3a        	call	LC015
2805  0840 cc0a05        	jra	L7401
2806  0843               L3211:
2807                     ; 630 	else if( __s == 4 )
2809  0843 a104          	cp	a,#4
2810  0845 2628          	jrne	L5711
2811                     ; 632 		disp_backlight(0);
2813  0847 4f            	clr	a
2814  0848 cd0000        	call	_disp_backlight
2816                     ; 633 		if( key == 1 || key == 2 || key == 3 || key == 4 )
2818  084b 7b03          	ld	a,(OFST+1,sp)
2819  084d a101          	cp	a,#1
2820  084f 270c          	jreq	L1021
2822  0851 a102          	cp	a,#2
2823  0853 2708          	jreq	L1021
2825  0855 a103          	cp	a,#3
2826  0857 2704          	jreq	L1021
2828  0859 a104          	cp	a,#4
2829  085b 26e3          	jrne	L7401
2830  085d               L1021:
2831                     ; 635 			file_update2(0);
2833  085d 4f            	clr	a
2834  085e cd0000        	call	_file_update2
2836                     ; 636 			EXIT_HOST(0);
2838  0861 725f0000      	clr	___s
2841  0865 725f0000      	clr	__dsCount
2844  0869 cd0a3a        	call	LC015
2846  086c cc0a05        	jra	L7401
2847  086f               L5711:
2848                     ; 639 	else if( __s == 3 )
2850  086f a103          	cp	a,#3
2851  0871 27f9          	jreq	L7401
2853                     ; 755 	} else if (__s == 5){
2855  0873 a105          	cp	a,#5
2856  0875 2658          	jrne	L5121
2857                     ; 756 		__sUp = 0;
2859  0877 725f0000      	clr	___sUp
2860                     ; 758 		switch (_disp_mode) {
2862  087b c60005        	ld	a,__disp_mode
2864                     ; 763 		case 0x10:	__sUp = 2;	break;
2865  087e 4a            	dec	a
2866  087f 2711          	jreq	L104
2867  0881 4a            	dec	a
2868  0882 2713          	jreq	L304
2869  0884 a002          	sub	a,#2
2870  0886 2715          	jreq	L504
2871  0888 a004          	sub	a,#4
2872  088a 2717          	jreq	L704
2873  088c a008          	sub	a,#8
2874  088e 2719          	jreq	L114
2875  0890 201b          	jra	L1221
2876  0892               L104:
2877                     ; 759 		case 0x01:	__sUp = 0;	break;
2879  0892 c70000        	ld	___sUp,a
2882  0895 2016          	jra	L1221
2883  0897               L304:
2884                     ; 760 		case 0x02:	__sUp = 3;	break;
2886  0897 35030000      	mov	___sUp,#3
2889  089b 2010          	jra	L1221
2890  089d               L504:
2891                     ; 761 		case 0x04:	__sUp = 4;	break;
2893  089d 35040000      	mov	___sUp,#4
2896  08a1 200a          	jra	L1221
2897  08a3               L704:
2898                     ; 762 		case 0x08:	__sUp = 1;	break;
2900  08a3 35010000      	mov	___sUp,#1
2903  08a7 2004          	jra	L1221
2904  08a9               L114:
2905                     ; 763 		case 0x10:	__sUp = 2;	break;
2907  08a9 35020000      	mov	___sUp,#2
2910  08ad               L1221:
2911                     ; 765 		__sDn = 0xff;
2913  08ad 35ff0000      	mov	___sDn,#255
2914                     ; 766 		disp_status_loop_init();
2916  08b1 cd0000        	call	_disp_status_loop_init
2918                     ; 767 		_dsCount = 1;
2920  08b4 35010000      	mov	__dsCount,#1
2921                     ; 768 		__s = 0;
2923  08b8 725f0000      	clr	___s
2924                     ; 769 		_key_blink = 1;
2926  08bc 35010007      	mov	__key_blink,#1
2927                     ; 770 		_key_sec = _key_min = _key_hour = 0;
2929  08c0 725f0000      	clr	__key_hour
2930  08c4 725f0000      	clr	__key_min
2931  08c8 725f0000      	clr	__key_sec
2933  08cc cc0a05        	jra	L7401
2934  08cf               L5121:
2935                     ; 772 	else if( __s == 101 )
2937  08cf a165          	cp	a,#101
2938  08d1 26f9          	jrne	L7401
2939                     ; 774 		if( _dsCount == 0 )
2941  08d3 c60000        	ld	a,__dsCount
2942  08d6 2654          	jrne	L7221
2943                     ; 777 			lcd_clear(0);
2945  08d8 cd0000        	call	_lcd_clear
2947                     ; 778 			ui_disp_temp_mark(1);
2949  08db a601          	ld	a,#1
2950  08dd cd0000        	call	_ui_disp_temp_mark
2952                     ; 779 			_remote = 1;
2954  08e0 35010004      	mov	__remote,#1
2955                     ; 781 			j = uiInfo.cnt + uiInfo.cnt_sub;
2957  08e4 c60005        	ld	a,_uiInfo+5
2958  08e7 cb0006        	add	a,_uiInfo+6
2959  08ea 6b02          	ld	(OFST+0,sp),a
2960                     ; 782 			__sRoom = (uiInfo.id_rc + 1) % j;
2962  08ec c60001        	ld	a,_uiInfo+1
2964  08ef               L314:
2965  08ef 5f            	clrw	x
2966  08f0 97            	ld	xl,a
2967  08f1 5c            	incw	x
2968  08f2 7b02          	ld	a,(OFST+0,sp)
2969  08f4 905f          	clrw	y
2970  08f6 9097          	ld	yl,a
2971  08f8 cd0000        	call	c_idiv
2972  08fb 93            	ldw	x,y
2973  08fc 01            	rrwa	x,a
2974  08fd c70000        	ld	___sRoom,a
2975                     ; 784 OneMore2:			
2975                     ; 785 			if( packet_buf[__sRoom] == 10 )
2977  0900 5f            	clrw	x
2978  0901 97            	ld	xl,a
2979  0902 d60000        	ld	a,(_packet_buf,x)
2980  0905 a10a          	cp	a,#10
2981  0907 2605          	jrne	L1321
2982                     ; 787 				__sRoom = (__sRoom + 1) % j;
2984  0909 c60000        	ld	a,___sRoom
2986                     ; 788 				goto OneMore2;
2988  090c 20e1          	jra	L314
2989  090e               L1321:
2990                     ; 791 			j = __sRoom;
2992                     ; 792 RemoteEntry:
2992                     ; 793 			if( __sRoom == uiInfo.id_rc )
2994  090e c60000        	ld	a,___sRoom
2995  0911 c10001        	cp	a,_uiInfo+1
2996  0914 2603cc09f4    	jreq	L714
2997                     ; 803 			lcd_clear_rid();
2999  0919 cd0000        	call	_lcd_clear_rid
3001                     ; 805 			disp_status_remote_message(REMOTE_MODE); //모드 변경
3003  091c c60000        	ld	a,___sRoom
3004  091f cd0a4a        	call	LC016
3005  0922 cd0000        	call	_disp_status_remote_message
3007                     ; 806 			_dsCount = 4;
3009  0925 35040000      	mov	__dsCount,#4
3011  0929 cc0a05        	jra	L7401
3012  092c               L7221:
3013                     ; 808 		else if( _dsCount == 1 )
3015  092c a101          	cp	a,#1
3016  092e 27f9          	jreq	L7401
3018                     ; 811 		else if( _dsCount == 4 )
3020  0930 a104          	cp	a,#4
3021  0932 26f5          	jrne	L7401
3022                     ; 813 			j = __sRoom;
3024  0934 c60000        	ld	a,___sRoom
3025  0937 6b02          	ld	(OFST+0,sp),a
3026                     ; 815 			if( REMOTE_MODEi(j) == 0x01 )		{	disp_status_loop_remote_N(j);	}
3028  0939 cd0a4a        	call	LC016
3029  093c 4a            	dec	a
3030  093d 2607          	jrne	L5421
3033  093f 7b02          	ld	a,(OFST+0,sp)
3034  0941 cd0003        	call	_disp_status_loop_remote_N
3037  0944 202e          	jra	L7421
3038  0946               L5421:
3039                     ; 816 			else if( REMOTE_MODEi(j) == 0x08 )	{	disp_status_loop_remote_Y(j);	}
3041  0946 7b02          	ld	a,(OFST+0,sp)
3042  0948 cd0a4a        	call	LC016
3043  094b a108          	cp	a,#8
3044  094d 2607          	jrne	L1521
3047  094f 7b02          	ld	a,(OFST+0,sp)
3048  0951 cd0064        	call	_disp_status_loop_remote_Y
3051  0954 201e          	jra	L7421
3052  0956               L1521:
3053                     ; 817 			else if( REMOTE_MODEi(j) == 0x10 )	{	disp_status_loop_remote_B(j);	}
3055  0956 7b02          	ld	a,(OFST+0,sp)
3056  0958 cd0a4a        	call	LC016
3057  095b a110          	cp	a,#16
3058  095d 2607          	jrne	L5521
3061  095f 7b02          	ld	a,(OFST+0,sp)
3062  0961 cd00d6        	call	_disp_status_loop_remote_B
3065  0964 200e          	jra	L7421
3066  0966               L5521:
3067                     ; 818 			else if( REMOTE_MODEi(j) == 0x04 )	{	disp_status_loop_remote_J(j);	}
3069  0966 7b02          	ld	a,(OFST+0,sp)
3070  0968 cd0a4a        	call	LC016
3071  096b a104          	cp	a,#4
3072  096d 2605          	jrne	L7421
3075  096f 7b02          	ld	a,(OFST+0,sp)
3076  0971 cd00b6        	call	_disp_status_loop_remote_J
3078  0974               L7421:
3079                     ; 819 			if( key == 1 )	
3081  0974 7b03          	ld	a,(OFST+1,sp)
3082  0976 a101          	cp	a,#1
3083  0978 263b          	jrne	L3621
3084                     ; 823 				if( REMOTE_MODEi(j)==0x01 )		{	REMOTE_MODEi(j) = 0x08;		}
3086  097a 7b02          	ld	a,(OFST+0,sp)
3087  097c cd0a4a        	call	LC016
3088  097f 4a            	dec	a
3089  0980 2608          	jrne	L5621
3092  0982 7b02          	ld	a,(OFST+0,sp)
3093  0984 5f            	clrw	x
3094  0985 97            	ld	xl,a
3095  0986 a608          	ld	a,#8
3097  0988 204a          	jp	L1131
3098  098a               L5621:
3099                     ; 824 				else if( REMOTE_MODEi(j)==0x08 ){	REMOTE_MODEi(j) = 0x10;		}
3101  098a 7b02          	ld	a,(OFST+0,sp)
3102  098c cd0a4a        	call	LC016
3103  098f a108          	cp	a,#8
3104  0991 2608          	jrne	L1721
3107  0993 7b02          	ld	a,(OFST+0,sp)
3108  0995 5f            	clrw	x
3109  0996 97            	ld	xl,a
3110  0997 a610          	ld	a,#16
3112  0999 2039          	jp	L1131
3113  099b               L1721:
3114                     ; 825 				else if( REMOTE_MODEi(j)==0x10 ){	REMOTE_MODEi(j) = 0x01;		}
3116  099b 7b02          	ld	a,(OFST+0,sp)
3117  099d cd0a4a        	call	LC016
3118  09a0 a110          	cp	a,#16
3121  09a2 2709          	jreq	LC012
3122                     ; 826 				else if( REMOTE_MODEi(j)==0x04 ){	REMOTE_MODEi(j) = 0x01;		}
3124  09a4 7b02          	ld	a,(OFST+0,sp)
3125  09a6 cd0a4a        	call	LC016
3126  09a9 a104          	cp	a,#4
3127  09ab 262a          	jrne	LC013
3130  09ad               LC012:
3132  09ad 7b02          	ld	a,(OFST+0,sp)
3133  09af 5f            	clrw	x
3134  09b0 97            	ld	xl,a
3135  09b1 a601          	ld	a,#1
3136                     ; 827 				disp_status_remote_message(REMOTE_MODE);
3139  09b3 201f          	jp	L1131
3140  09b5               L3621:
3141                     ; 829 			else if( key == 2 )
3143  09b5 a102          	cp	a,#2
3144  09b7 2628          	jrne	L5031
3145                     ; 831 				i = uiInfo.remote_mode[j];
3147  09b9 7b02          	ld	a,(OFST+0,sp)
3148  09bb cd0a4a        	call	LC016
3149  09be 6b02          	ld	(OFST+0,sp),a
3150                     ; 832 				if( i == 0x04 )	{	REMOTE_MODE = 0x01;		}
3152  09c0 a104          	cp	a,#4
3153  09c2 2609          	jrne	L7031
3156  09c4 c60000        	ld	a,___sRoom
3157  09c7 5f            	clrw	x
3158  09c8 97            	ld	xl,a
3159  09c9 a601          	ld	a,#1
3161  09cb 2007          	jra	L1131
3162  09cd               L7031:
3163                     ; 833 				else			{	REMOTE_MODE = 0x04;		}
3165  09cd c60000        	ld	a,___sRoom
3166  09d0 5f            	clrw	x
3167  09d1 97            	ld	xl,a
3168  09d2 a604          	ld	a,#4
3169  09d4               L1131:
3170  09d4 d70045        	ld	(_uiInfo+69,x),a
3171                     ; 834 				disp_status_remote_message(REMOTE_MODE);
3173  09d7               LC013:
3175  09d7 c60000        	ld	a,___sRoom
3176  09da ad6e          	call	LC016
3177  09dc cd0000        	call	_disp_status_remote_message
3180  09df 200c          	jra	L3031
3181  09e1               L5031:
3182                     ; 836 			else if( key == 3 )
3184  09e1 a103          	cp	a,#3
3185  09e3 270f          	jreq	L714
3186                     ; 838 				goto RemoteExit;
3188                     ; 840 			else if( key == 4 )	
3190  09e5 a104          	cp	a,#4
3191  09e7 2604          	jrne	L3031
3192                     ; 842 				_dsCount = 2;
3194  09e9 35020000      	mov	__dsCount,#2
3195  09ed               L3031:
3196                     ; 844 			if( _key_min == KEY_BLINK_FADE )
3198  09ed c60000        	ld	a,__key_min
3199  09f0 a10a          	cp	a,#10
3200  09f2 2611          	jrne	L7401
3201                     ; 846 				goto RemoteExit;
3202  09f4               L714:
3203                     ; 795 RemoteExit:				
3203                     ; 796 				//	mode change
3203                     ; 797 				_remote = 0;
3205  09f4 725f0004      	clr	__remote
3206                     ; 798 				__s = 5;
3208  09f8 35050000      	mov	___s,#5
3209                     ; 799 				_dsCount = 0;
3211  09fc 725f0000      	clr	__dsCount
3212                     ; 800 				lcd_blink_clear();
3214  0a00 cd0000        	call	_lcd_blink_clear
3216                     ; 801 				return;
3218  0a03 2032          	jra	L5231
3219  0a05               L7401:
3220                     ; 853 	if (packet_changed == 1) {
3222  0a05 c60000        	ld	a,_packet_changed
3223  0a08 4a            	dec	a
3224  0a09 262c          	jrne	L5231
3225                     ; 854 		__s = 0;
3227  0a0b c70000        	ld	___s,a
3228                     ; 855 		switch (_disp_mode2) {
3230  0a0e c60006        	ld	a,__disp_mode2
3232                     ; 864 				break;
3233  0a11 4a            	dec	a
3234  0a12 2709          	jreq	L124
3235  0a14 4a            	dec	a
3236  0a15 270b          	jreq	L324
3237  0a17 a002          	sub	a,#2
3238  0a19 2711          	jreq	L524
3239  0a1b 2016          	jra	L1331
3240  0a1d               L124:
3241                     ; 856 			case 0x01:	_dsCount = 0;	break;
3243  0a1d c70000        	ld	__dsCount,a
3246  0a20 2011          	jra	L1331
3247  0a22               L324:
3248                     ; 857 			case 0x02:
3248                     ; 858 				_dsCount = 11;
3250  0a22 350b0000      	mov	__dsCount,#11
3251                     ; 859 				__sDn = 1;
3253  0a26 35010000      	mov	___sDn,#1
3254                     ; 860 				break;
3256  0a2a 2007          	jra	L1331
3257  0a2c               L524:
3258                     ; 861 			case 0x04:
3258                     ; 862 				_dsCount = 11;
3260  0a2c 350b0000      	mov	__dsCount,#11
3261                     ; 863 				__sDn = 0;	
3263  0a30 c70000        	ld	___sDn,a
3264                     ; 864 				break;
3266  0a33               L1331:
3267                     ; 866 		packet_changed = 0;
3269  0a33 725f0000      	clr	_packet_changed
3270  0a37               L5231:
3271                     ; 868 }
3274  0a37 5b03          	addw	sp,#3
3275  0a39 81            	ret	
3276  0a3a               LC015:
3277  0a3a 35ff0000      	mov	__dsPrev,#255
3278                     ; 581 				EXIT_HOST(0);
3280  0a3e cd0000        	call	_lcd_blink_clear
3284  0a41 4b00          	push	#0
3285  0a43 ad22          	call	LC019
3286  0a45 cd0000        	call	_lcd_disp_info
3288  0a48 84            	pop	a
3289  0a49 81            	ret	
3290  0a4a               LC016:
3291  0a4a 5f            	clrw	x
3292  0a4b 97            	ld	xl,a
3293  0a4c d60045        	ld	a,(_uiInfo+69,x)
3294  0a4f 81            	ret	
3295  0a50               LC017:
3296  0a50 5f            	clrw	x
3297  0a51 97            	ld	xl,a
3298  0a52 a60a          	ld	a,#10
3299  0a54 62            	div	x,a
3300  0a55 97            	ld	xl,a
3301  0a56 a603          	ld	a,#3
3302  0a58 95            	ld	xh,a
3303  0a59 cc0000        	jp	_lcd_disp_n
3304  0a5c               LC018:
3305  0a5c 5f            	clrw	x
3306  0a5d 97            	ld	xl,a
3307  0a5e a60a          	ld	a,#10
3308  0a60 62            	div	x,a
3309  0a61 a602          	ld	a,#2
3310  0a63 95            	ld	xh,a
3311  0a64 cc0000        	jp	_lcd_disp_n
3312  0a67               LC019:
3313  0a67 ae0001        	ldw	x,#1
3314  0a6a c60000        	ld	a,___sInfo
3315  0a6d 95            	ld	xh,a
3316  0a6e 81            	ret	
3317  0a6f               LC020:
3318  0a6f cd0000        	call	_lcd_disp_info_shower
3320                     ; 596 			_dsCount = 1;
3322  0a72 35010000      	mov	__dsCount,#1
3323                     ; 597 			_dsPrev = 0xff;
3325  0a76 35ff0000      	mov	__dsPrev,#255
3326  0a7a 81            	ret	
3408                     	xdef	_disp_rid_info
3409                     	xref	_packet_buf
3410                     	xdef	_disp_status_loop_host_Out
3411                     	xdef	_disp_status_loop_host_Off
3412                     	xdef	_disp_status_loop_remote_B
3413                     	xdef	_disp_status_loop_remote_J
3414                     	xdef	_disp_status_loop_remote_Y
3415                     	xdef	_disp_status_loop_remote_N
3416                     	xdef	_disp_status_remote_message
3417                     	xref	_packet_changed
3418                     	xref	_getHexToBin
3419                     	xref	__rcLED
3420                     	xref	__disp_temp
3421                     	switch	.bss
3422  0000               __remote_buf:
3423  0000 000000000000  	ds.b	8
3424                     	xdef	__remote_buf
3425                     	xdef	__remote
3426                     	xdef	__boiler_fire
3427                     	xdef	__boiler_water_heat
3428                     	xdef	__boiler_water_shower
3429                     	xdef	__boiler_type
3430                     	xref	_disp_backlight
3431                     	xref	_file_update2
3432                     	xref	__updateCount
3433                     	xref	__updateBit
3434                     	xref	__updateTimer
3435                     	xdef	__key_blink
3436                     	xref	__key_hour
3437                     	xref	__key_min
3438                     	xref	__key_sec
3439                     	xdef	__disp_mode2
3440                     	xdef	__disp_mode
3441                     	xref	_disp_status_curr_only
3442                     	xref	_disp_status_loop_init
3443                     	xdef	_disp_status_loop_host_B
3444                     	xdef	_disp_status_loop_host_Y
3445                     	xdef	_disp_status_loop_host_N
3446                     	xref	_disp_status_loop_messageDn
3447                     	xref	_disp_status_loop_message
3448                     	xref	__dsPrev
3449                     	xref	__dsCount
3450                     	xdef	_disp_status_loop_host
3451                     	xref	___sRoom
3452                     	xref	___sInfo
3453                     	xref	___sDn
3454                     	xref	___sUp
3455                     	xref	___s
3456                     	xref	_lcd_disp_info
3457                     	xref	_lcd_disp_info_shower
3458                     	xref	_ui_disp_reserve_setup
3459                     	xref	_ui_disp_repeat_setup
3460                     	xref	_ui_disp_clear_tSetup
3461                     	xref	_ui_disp_temp_mark
3462                     	xref	_ui_disp_temp_curr
3463                     	xref	_ui_disp_temp_setup
3464                     	xref	_lcd_clear_rid_n
3465                     	xref	_lcd_blink_item
3466                     	xref	_lcd_blink_clear
3467                     	xref	_lcd_disp_rid
3468                     	xref	_lcd_disp_n
3469                     	xref	_lcd_clear
3470                     	xref	_lcd_clear_rid
3471                     	xref	_lcd_clear_btn
3472                     	xref	_uiInfo
3473                     	xref	___timer1s
3474                     	xref.b	c_x
3494                     	xref	c_idiv
3495                     	xref	c_smodx
3496                     	end
