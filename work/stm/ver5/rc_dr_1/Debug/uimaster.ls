   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
  37  0007               _rn_real_heat_water:
  38  0007 28            	dc.b	40
  39  0008 2d            	dc.b	45
  40  0009 2e            	dc.b	46
  41  000a 2f            	dc.b	47
  42  000b 30            	dc.b	48
  43  000c 31            	dc.b	49
  44  000d 32            	dc.b	50
  45  000e 33            	dc.b	51
  46  000f 34            	dc.b	52
  47  0010 35            	dc.b	53
  48  0011 36            	dc.b	54
  49  0012 37            	dc.b	55
  50  0013 38            	dc.b	56
  51  0014 39            	dc.b	57
  52  0015 3a            	dc.b	58
  53  0016 3b            	dc.b	59
  54  0017 3c            	dc.b	60
  55  0018 41            	dc.b	65
  56  0019 46            	dc.b	70
  57  001a 4b            	dc.b	75
  58  001b 50            	dc.b	80
  59  001c 55            	dc.b	85
  60  001d               _rn_real_shower_water:
  61  001d 23            	dc.b	35
  62  001e 24            	dc.b	36
  63  001f 25            	dc.b	37
  64  0020 26            	dc.b	38
  65  0021 27            	dc.b	39
  66  0022 28            	dc.b	40
  67  0023 29            	dc.b	41
  68  0024 2a            	dc.b	42
  69  0025 2b            	dc.b	43
  70  0026 2c            	dc.b	44
  71  0027 2d            	dc.b	45
  72  0028 2e            	dc.b	46
  73  0029 2f            	dc.b	47
  74  002a 32            	dc.b	50
  75  002b 37            	dc.b	55
  76  002c 3c            	dc.b	60
 132                     ; 54 uint8_t	ENC_MOVE_0_SHOWER(uint8_t temp)
 132                     ; 55 {
 134                     .text:	section	.text,new
 135  0000               _ENC_MOVE_0_SHOWER:
 137  0000 88            	push	a
 138  0001 89            	pushw	x
 139       00000002      OFST:	set	2
 142                     ; 56 	uint8_t num = 0;
 144  0002 0f01          	clr	(OFST-1,sp)
 146                     ; 60 	if( (debug_br>>4) != 3 )
 148  0004 c60000        	ld	a,_debug_br
 149  0007 4e            	swap	a
 150  0008 a40f          	and	a,#15
 151  000a 5f            	clrw	x
 152  000b 97            	ld	xl,a
 153  000c a30003        	cpw	x,#3
 154  000f 2726          	jreq	L13
 155                     ; 62 		i = _boiler_water_shower;
 157  0011 c60001        	ld	a,__boiler_water_shower
 158  0014 6b02          	ld	(OFST+0,sp),a
 160                     ; 63 		ENC_MOVE_0(35, 85, 1);
 162  0016 720c00000c    	btjt	_uiInfo,#6,L33
 165  001b a124          	cp	a,#36
 166  001d 2404          	jruge	L53
 169  001f a655          	ld	a,#85
 171  0021 200a          	jp	LC001
 172  0023               L53:
 175  0023 0a02          	dec	(OFST+0,sp)
 177  0025 200c          	jra	L14
 178  0027               L33:
 181  0027 a155          	cp	a,#85
 182  0029 2506          	jrult	L34
 185  002b a623          	ld	a,#35
 186  002d               LC001:
 187  002d 6b02          	ld	(OFST+0,sp),a
 190  002f 2002          	jra	L14
 191  0031               L34:
 194  0031 0c02          	inc	(OFST+0,sp)
 196  0033               L14:
 197                     ; 64 		return i;		
 200  0033 7b02          	ld	a,(OFST+0,sp)
 202  0035 203a          	jra	L6
 203  0037               L13:
 204                     ; 67 	for (i = 0 ; i < 16 ; i++) {
 206  0037 4f            	clr	a
 207  0038 6b02          	ld	(OFST+0,sp),a
 209  003a               L74:
 210                     ; 68 		if (rn_real_shower_water[i] == temp) {
 212  003a 5f            	clrw	x
 213  003b 97            	ld	xl,a
 214  003c d6001d        	ld	a,(_rn_real_shower_water,x)
 215  003f 1103          	cp	a,(OFST+1,sp)
 216  0041 2606          	jrne	L55
 217                     ; 69 			num = i;
 219  0043 7b02          	ld	a,(OFST+0,sp)
 220  0045 6b01          	ld	(OFST-1,sp),a
 222                     ; 70 			break;
 224  0047 200a          	jra	L35
 225  0049               L55:
 226                     ; 67 	for (i = 0 ; i < 16 ; i++) {
 228  0049 0c02          	inc	(OFST+0,sp)
 232  004b 7b02          	ld	a,(OFST+0,sp)
 233  004d a110          	cp	a,#16
 234  004f 25e9          	jrult	L74
 235  0051 7b01          	ld	a,(OFST-1,sp)
 236  0053               L35:
 237                     ; 74 	if( (uiInfo.enc & 0x40) == 0 ) {
 239  0053 720c000006    	btjt	_uiInfo,#6,L75
 240                     ; 75 		if (num == 0) {
 242                     ; 77 			num = 0;
 244  0058 270a          	jreq	LC002
 245                     ; 79 			num--;
 247  005a 0a01          	dec	(OFST-1,sp)
 249  005c 200c          	jra	L56
 250  005e               L75:
 251                     ; 83 		if (num == 15) {
 253  005e a10f          	cp	a,#15
 254  0060 2606          	jrne	L76
 255                     ; 85 			num = 15;
 257  0062 a60f          	ld	a,#15
 258  0064               LC002:
 260  0064 6b01          	ld	(OFST-1,sp),a
 263  0066 2002          	jra	L56
 264  0068               L76:
 265                     ; 87 			num++;
 267  0068 0c01          	inc	(OFST-1,sp)
 269  006a               L56:
 270                     ; 91 	return rn_real_shower_water[num];
 272  006a 7b01          	ld	a,(OFST-1,sp)
 273  006c 5f            	clrw	x
 274  006d 97            	ld	xl,a
 275  006e d6001d        	ld	a,(_rn_real_shower_water,x)
 277  0071               L6:
 279  0071 5b03          	addw	sp,#3
 280  0073 81            	ret	
 330                     ; 94 uint8_t	ENC_MOVE_0_HEAT(uint8_t temp)
 330                     ; 95 {
 331                     .text:	section	.text,new
 332  0000               _ENC_MOVE_0_HEAT:
 334  0000 88            	push	a
 335  0001 89            	pushw	x
 336       00000002      OFST:	set	2
 339                     ; 96 	uint8_t num = 0;
 341  0002 0f01          	clr	(OFST-1,sp)
 343                     ; 100 	if( (debug_br>>4) != 3 )
 345  0004 c60000        	ld	a,_debug_br
 346  0007 4e            	swap	a
 347  0008 a40f          	and	a,#15
 348  000a 5f            	clrw	x
 349  000b 97            	ld	xl,a
 350  000c a30003        	cpw	x,#3
 351  000f 2722          	jreq	L311
 352                     ; 102 		i = _boiler_water_heat;
 354  0011 c60002        	ld	a,__boiler_water_heat
 355  0014 6b02          	ld	(OFST+0,sp),a
 357                     ; 103 		ENC_MOVE_0(40, 85, 5);
 359  0016 720c00000c    	btjt	_uiInfo,#6,L511
 362  001b a129          	cp	a,#41
 363  001d 2404          	jruge	L711
 366  001f a655          	ld	a,#85
 369  0021 204a          	jra	L21
 370  0023               L711:
 373  0023 a005          	sub	a,#5
 375  0025 2046          	jra	L21
 376  0027               L511:
 379  0027 a155          	cp	a,#85
 380  0029 2504          	jrult	L521
 383  002b a628          	ld	a,#40
 386  002d 203e          	jra	L21
 387  002f               L521:
 390  002f ab05          	add	a,#5
 392                     ; 104 		return i;		
 396  0031 203a          	jra	L21
 397  0033               L311:
 398                     ; 107 	for (i = 0 ; i < 22 ; i++) {
 400  0033 4f            	clr	a
 401  0034 6b02          	ld	(OFST+0,sp),a
 403  0036               L131:
 404                     ; 108 		if (rn_real_heat_water[i] == temp) {
 406  0036 5f            	clrw	x
 407  0037 97            	ld	xl,a
 408  0038 d60007        	ld	a,(_rn_real_heat_water,x)
 409  003b 1103          	cp	a,(OFST+1,sp)
 410  003d 2606          	jrne	L731
 411                     ; 109 			num = i;
 413  003f 7b02          	ld	a,(OFST+0,sp)
 414  0041 6b01          	ld	(OFST-1,sp),a
 416                     ; 110 			break;
 418  0043 200a          	jra	L531
 419  0045               L731:
 420                     ; 107 	for (i = 0 ; i < 22 ; i++) {
 422  0045 0c02          	inc	(OFST+0,sp)
 426  0047 7b02          	ld	a,(OFST+0,sp)
 427  0049 a116          	cp	a,#22
 428  004b 25e9          	jrult	L131
 429  004d 7b01          	ld	a,(OFST-1,sp)
 430  004f               L531:
 431                     ; 114 	if( (uiInfo.enc & 0x40) == 0 ) {
 433  004f 720c000006    	btjt	_uiInfo,#6,L141
 434                     ; 115 		if (num == 0) {
 436                     ; 117 			num = 0;
 438  0054 270a          	jreq	LC003
 439                     ; 119 			num--;
 441  0056 0a01          	dec	(OFST-1,sp)
 443  0058 200c          	jra	L741
 444  005a               L141:
 445                     ; 123 		if (num == 21) {
 447  005a a115          	cp	a,#21
 448  005c 2606          	jrne	L151
 449                     ; 125 			num = 21;
 451  005e a615          	ld	a,#21
 452  0060               LC003:
 454  0060 6b01          	ld	(OFST-1,sp),a
 457  0062 2002          	jra	L741
 458  0064               L151:
 459                     ; 127 			num++;
 461  0064 0c01          	inc	(OFST-1,sp)
 463  0066               L741:
 464                     ; 131 	return rn_real_heat_water[num];
 466  0066 7b01          	ld	a,(OFST-1,sp)
 467  0068 5f            	clrw	x
 468  0069 97            	ld	xl,a
 469  006a d60007        	ld	a,(_rn_real_heat_water,x)
 471  006d               L21:
 473  006d 5b03          	addw	sp,#3
 474  006f 81            	ret	
 510                     ; 135 void	disp_status_remote_message(uint8_t i)
 510                     ; 136 {
 511                     .text:	section	.text,new
 512  0000               _disp_status_remote_message:
 514  0000 88            	push	a
 515       00000000      OFST:	set	0
 518                     ; 137 	lcd_clear_btn();
 520  0001 cd0000        	call	_lcd_clear_btn
 522                     ; 140 	if( i == 0x01 )			{	/*LCD_BIT_SET(bP12);*/	/*	(0)난방*/	}
 524  0004 7b01          	ld	a,(OFST+1,sp)
 525  0006 a101          	cp	a,#1
 526  0008 2739          	jreq	L371
 528                     ; 141 	else if( i == 0x02 )	{	LCD_BIT_SET(bP13);	/*	(1)외출*/	}
 530  000a a102          	cp	a,#2
 531  000c 260a          	jrne	L571
 534  000e c60010        	ld	a,_iLF_DEF+16
 535  0011 ad32          	call	LC005
 536  0013 ca0010        	or	a,_bLF_DEF+16
 538  0016 2028          	jp	LC004
 539  0018               L571:
 540                     ; 142 	else if( i == 0x04 )	{	LCD_BIT_SET(bP11);	/*	(2)정지*/	}
 542  0018 a104          	cp	a,#4
 543  001a 260a          	jrne	L102
 546  001c c60030        	ld	a,_iLF_DEF+48
 547  001f ad24          	call	LC005
 548  0021 ca0030        	or	a,_bLF_DEF+48
 550  0024 201a          	jp	LC004
 551  0026               L102:
 552                     ; 143 	else if( i == 0x08 )	{	LCD_BIT_SET(bP10);	/*	(2)예약*/	}
 554  0026 a108          	cp	a,#8
 555  0028 260a          	jrne	L502
 558  002a c6003a        	ld	a,_iLF_DEF+58
 559  002d ad16          	call	LC005
 560  002f ca003a        	or	a,_bLF_DEF+58
 562  0032 200c          	jp	LC004
 563  0034               L502:
 564                     ; 144 	else if( i == 0x10 )	{	LCD_BIT_SET(bP9);	/*	(2)반복*/	}
 566  0034 a110          	cp	a,#16
 567  0036 260b          	jrne	L371
 570  0038 c60031        	ld	a,_iLF_DEF+49
 571  003b ad08          	call	LC005
 572  003d ca0031        	or	a,_bLF_DEF+49
 573  0040               LC004:
 574  0040 d7540c        	ld	(21516,x),a
 575  0043               L371:
 576                     ; 145 }
 579  0043 84            	pop	a
 580  0044 81            	ret	
 581  0045               LC005:
 582  0045 5f            	clrw	x
 583  0046 97            	ld	xl,a
 584  0047 d6540c        	ld	a,(21516,x)
 585  004a 81            	ret	
 641                     ; 147 uint8_t		disp_status_loop_remote_N(uint8_t key)
 641                     ; 148 {
 642                     .text:	section	.text,new
 643  0000               _disp_status_loop_remote_N:
 645  0000 88            	push	a
 646  0001 89            	pushw	x
 647       00000002      OFST:	set	2
 650                     ; 150 	uint8_t	j = 0;
 652  0002 0f01          	clr	(OFST-1,sp)
 654                     ; 151 	i = uiInfo.tempSetup[key];
 656  0004 5f            	clrw	x
 657  0005 97            	ld	xl,a
 658  0006 d6003d        	ld	a,(_uiInfo+61,x)
 659  0009 6b02          	ld	(OFST+0,sp),a
 661                     ; 153 	if (i == 0) {
 663  000b 260d          	jrne	L332
 664                     ; 154 		i = 10;
 666  000d a60a          	ld	a,#10
 667  000f 6b02          	ld	(OFST+0,sp),a
 669                     ; 155 		uiInfo.tempSetup[key] = i;
 671  0011 5f            	clrw	x
 672  0012 7b03          	ld	a,(OFST+1,sp)
 673  0014 97            	ld	xl,a
 674  0015 a60a          	ld	a,#10
 675  0017 d7003d        	ld	(_uiInfo+61,x),a
 676  001a               L332:
 677                     ; 158 	if( uiInfo.enc != 0 )
 679  001a c60000        	ld	a,_uiInfo
 680  001d 2727          	jreq	L532
 681                     ; 160 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
 683  001f a540          	bcp	a,#64
 684  0021 2604          	jrne	L22
 685  0023 a6fe          	ld	a,#254
 686  0025 2002          	jra	L42
 687  0027               L22:
 688  0027 a602          	ld	a,#2
 689  0029               L42:
 690  0029 1b02          	add	a,(OFST+0,sp)
 692                     ; 161 		if( i<=10 )	i = 10;
 694  002b a10b          	cp	a,#11
 695  002d 2402          	jruge	L732
 698  002f a60a          	ld	a,#10
 700  0031               L732:
 701                     ; 162 		if( i>=80 )	i = 80;
 703  0031 a150          	cp	a,#80
 704  0033 2502          	jrult	L142
 707  0035 a650          	ld	a,#80
 709  0037               L142:
 710  0037 6b02          	ld	(OFST+0,sp),a
 711                     ; 163 		uiInfo.tempSetup[key] = i;
 713  0039 5f            	clrw	x
 714  003a 7b03          	ld	a,(OFST+1,sp)
 715  003c 97            	ld	xl,a
 716  003d 7b02          	ld	a,(OFST+0,sp)
 717  003f d7003d        	ld	(_uiInfo+61,x),a
 718                     ; 164 		j = 1;
 720  0042 a601          	ld	a,#1
 721  0044 6b01          	ld	(OFST-1,sp),a
 723  0046               L532:
 724                     ; 166 	if( _dsPrev != i )
 726  0046 c60000        	ld	a,__dsPrev
 727  0049 1102          	cp	a,(OFST+0,sp)
 728  004b 2756          	jreq	L342
 729                     ; 168 		lcd_clear(0);
 731  004d 4f            	clr	a
 732  004e cd0000        	call	_lcd_clear
 734                     ; 169 		disp_status_remote_message(0x01);
 736  0051 a601          	ld	a,#1
 737  0053 cd0000        	call	_disp_status_remote_message
 739                     ; 170 		_dsPrev = i;
 741  0056 7b02          	ld	a,(OFST+0,sp)
 742  0058 c70000        	ld	__dsPrev,a
 743                     ; 171 		LCD_BIT_SET(bP19);	
 745  005b 5f            	clrw	x
 746  005c c60029        	ld	a,_iLF_DEF+41
 747  005f 97            	ld	xl,a
 748  0060 d6540c        	ld	a,(21516,x)
 749  0063 ca0029        	or	a,_bLF_DEF+41
 750  0066 d7540c        	ld	(21516,x),a
 751                     ; 172 		LCD_BIT_SET(bP20);
 753  0069 c60039        	ld	a,_iLF_DEF+57
 754  006c ad3a          	call	LC006
 755  006e ca0039        	or	a,_bLF_DEF+57
 756  0071 d7540c        	ld	(21516,x),a
 757                     ; 173 		LCD_BIT_SET(bP15);	
 759  0074 c6003f        	ld	a,_iLF_DEF+63
 760  0077 ad2f          	call	LC006
 761  0079 ca003f        	or	a,_bLF_DEF+63
 762  007c d7540c        	ld	(21516,x),a
 763                     ; 174 		LCD_BIT_SET(bP14);
 765  007f c60000        	ld	a,_iLF_DEF
 766  0082 ad24          	call	LC006
 767  0084 ca0000        	or	a,_bLF_DEF
 768  0087 d7540c        	ld	(21516,x),a
 769                     ; 175 		__ui_disp_temp_c(3);//도씨 표시
 771  008a a603          	ld	a,#3
 772  008c cd0000        	call	___ui_disp_temp_c
 774                     ; 176 		ui_disp_temp_setup(uiInfo.tempSetup[key]);
 776  008f 7b03          	ld	a,(OFST+1,sp)
 777  0091 5f            	clrw	x
 778  0092 97            	ld	xl,a
 779  0093 d6003d        	ld	a,(_uiInfo+61,x)
 780  0096 cd0000        	call	_ui_disp_temp_setup
 782                     ; 177 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 784  0099 7b03          	ld	a,(OFST+1,sp)
 785  009b 5f            	clrw	x
 786  009c 97            	ld	xl,a
 787  009d d60035        	ld	a,(_uiInfo+53,x)
 788  00a0 cd0000        	call	_ui_disp_temp_curr
 790  00a3               L342:
 791                     ; 180 	return j;
 793  00a3 7b01          	ld	a,(OFST-1,sp)
 796  00a5 5b03          	addw	sp,#3
 797  00a7 81            	ret	
 798  00a8               LC006:
 799  00a8 5f            	clrw	x
 800  00a9 97            	ld	xl,a
 801  00aa d6540c        	ld	a,(21516,x)
 802  00ad 81            	ret	
 858                     ; 183 uint8_t	disp_status_loop_remote_Y(uint8_t key)
 858                     ; 184 {
 859                     .text:	section	.text,new
 860  0000               _disp_status_loop_remote_Y:
 862  0000 88            	push	a
 863  0001 89            	pushw	x
 864       00000002      OFST:	set	2
 867                     ; 186 	uint8_t	j = 0;
 869  0002 0f01          	clr	(OFST-1,sp)
 871                     ; 187 	i = uiInfo.remote_time[key];
 873  0004 5f            	clrw	x
 874  0005 97            	ld	xl,a
 875  0006 d6004d        	ld	a,(_uiInfo+77,x)
 876  0009 6b02          	ld	(OFST+0,sp),a
 878                     ; 189 	if (i == 0) {
 880  000b 260d          	jrne	L562
 881                     ; 190 		i = 2;
 883  000d a602          	ld	a,#2
 884  000f 6b02          	ld	(OFST+0,sp),a
 886                     ; 191 		uiInfo.remote_time[key] = i;
 888  0011 5f            	clrw	x
 889  0012 7b03          	ld	a,(OFST+1,sp)
 890  0014 97            	ld	xl,a
 891  0015 a602          	ld	a,#2
 892  0017 d7004d        	ld	(_uiInfo+77,x),a
 893  001a               L562:
 894                     ; 194 	if( uiInfo.enc != 0 )
 896  001a c60000        	ld	a,_uiInfo
 897  001d 2727          	jreq	L762
 898                     ; 196 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
 900  001f a540          	bcp	a,#64
 901  0021 2604          	jrne	L24
 902  0023 a6fe          	ld	a,#254
 903  0025 2002          	jra	L44
 904  0027               L24:
 905  0027 a602          	ld	a,#2
 906  0029               L44:
 907  0029 1b02          	add	a,(OFST+0,sp)
 909                     ; 197 		if( i<=2 )	i = 2;
 911  002b a103          	cp	a,#3
 912  002d 2402          	jruge	L172
 915  002f a602          	ld	a,#2
 917  0031               L172:
 918                     ; 198 		if( i>=48 )	i = 48;
 920  0031 a130          	cp	a,#48
 921  0033 2502          	jrult	L372
 924  0035 a630          	ld	a,#48
 926  0037               L372:
 927  0037 6b02          	ld	(OFST+0,sp),a
 928                     ; 199 		uiInfo.remote_time[key] = i;
 930  0039 5f            	clrw	x
 931  003a 7b03          	ld	a,(OFST+1,sp)
 932  003c 97            	ld	xl,a
 933  003d 7b02          	ld	a,(OFST+0,sp)
 934  003f d7004d        	ld	(_uiInfo+77,x),a
 935                     ; 200 		j = 1;
 937  0042 a601          	ld	a,#1
 938  0044 6b01          	ld	(OFST-1,sp),a
 940  0046               L762:
 941                     ; 203 	if( _dsPrev != i )
 943  0046 c60000        	ld	a,__dsPrev
 944  0049 1102          	cp	a,(OFST+0,sp)
 945  004b 274d          	jreq	L572
 946                     ; 205 		lcd_clear(0);
 948  004d 4f            	clr	a
 949  004e cd0000        	call	_lcd_clear
 951                     ; 206 		disp_status_remote_message(0x08);
 953  0051 a608          	ld	a,#8
 954  0053 cd0000        	call	_disp_status_remote_message
 956                     ; 207 		_dsPrev = i;
 958  0056 7b02          	ld	a,(OFST+0,sp)
 959  0058 c70000        	ld	__dsPrev,a
 960                     ; 208 		LCD_BIT_SET(bP19);	
 962  005b 5f            	clrw	x
 963  005c c60029        	ld	a,_iLF_DEF+41
 964  005f 97            	ld	xl,a
 965  0060 d6540c        	ld	a,(21516,x)
 966  0063 ca0029        	or	a,_bLF_DEF+41
 967  0066 d7540c        	ld	(21516,x),a
 968                     ; 209 		LCD_BIT_SET(bP20);
 970  0069 c60039        	ld	a,_iLF_DEF+57
 971  006c 5f            	clrw	x
 972  006d 97            	ld	xl,a
 973  006e d6540c        	ld	a,(21516,x)
 974  0071 ca0039        	or	a,_bLF_DEF+57
 975  0074 d7540c        	ld	(21516,x),a
 976                     ; 210 		__ui_disp_temp_c(1);//도씨 표시
 978  0077 a601          	ld	a,#1
 979  0079 cd0000        	call	___ui_disp_temp_c
 981                     ; 211 		LCD_BIT_SET(bS2d);
 983  007c c6001a        	ld	a,_iLF_DEF+26
 984  007f 5f            	clrw	x
 985  0080 97            	ld	xl,a
 986  0081 d6540c        	ld	a,(21516,x)
 987  0084 ca001a        	or	a,_bLF_DEF+26
 988  0087 d7540c        	ld	(21516,x),a
 989                     ; 212 		ui_disp_temp_curr(uiInfo.tCurr);
 991  008a c60002        	ld	a,_uiInfo+2
 992  008d cd0000        	call	_ui_disp_temp_curr
 994                     ; 213 		ui_disp_reserve_setup(uiInfo.remote_time[key]);		
 996  0090 7b03          	ld	a,(OFST+1,sp)
 997  0092 5f            	clrw	x
 998  0093 97            	ld	xl,a
 999  0094 d6004d        	ld	a,(_uiInfo+77,x)
1000  0097 cd0000        	call	_ui_disp_reserve_setup
1002  009a               L572:
1003                     ; 216 	return j;
1005  009a 7b01          	ld	a,(OFST-1,sp)
1008  009c 5b03          	addw	sp,#3
1009  009e 81            	ret	
1045                     ; 219 uint8_t		disp_status_loop_remote_J(uint8_t key)
1045                     ; 220 {
1046                     .text:	section	.text,new
1047  0000               _disp_status_loop_remote_J:
1049  0000 88            	push	a
1050       00000000      OFST:	set	0
1053                     ; 222 	if (_dsPrev != 0xFE ) {
1055  0001 c60000        	ld	a,__dsPrev
1056  0004 a1fe          	cp	a,#254
1057  0006 270d          	jreq	L313
1058                     ; 223 		_dsPrev = 0xFE;
1060  0008 35fe0000      	mov	__dsPrev,#254
1061                     ; 225 		lcd_clear(0);
1063  000c 4f            	clr	a
1064  000d cd0000        	call	_lcd_clear
1066                     ; 226 		disp_status_remote_message(0x04);
1068  0010 a604          	ld	a,#4
1069  0012 cd0000        	call	_disp_status_remote_message
1071  0015               L313:
1072                     ; 230 	return key;
1074  0015 7b01          	ld	a,(OFST+1,sp)
1077  0017 5b01          	addw	sp,#1
1078  0019 81            	ret	
1121                     ; 233 uint8_t		disp_status_loop_remote_O(uint8_t key)
1121                     ; 234 {
1122                     .text:	section	.text,new
1123  0000               _disp_status_loop_remote_O:
1125  0000 88            	push	a
1126       00000000      OFST:	set	0
1129                     ; 236 	if (_dsPrev != 0xFE ) {
1131  0001 c60000        	ld	a,__dsPrev
1132  0004 a1fe          	cp	a,#254
1133  0006 2742          	jreq	L133
1134                     ; 237 		_dsPrev = 0xFE;
1136  0008 35fe0000      	mov	__dsPrev,#254
1137                     ; 239 		lcd_clear(0);
1139  000c 4f            	clr	a
1140  000d cd0000        	call	_lcd_clear
1142                     ; 240 		disp_status_remote_message(0x02);
1144  0010 a602          	ld	a,#2
1145  0012 cd0000        	call	_disp_status_remote_message
1147                     ; 242 		LCD_BIT_SET(bP19);	
1149  0015 c60029        	ld	a,_iLF_DEF+41
1150  0018 5f            	clrw	x
1151  0019 97            	ld	xl,a
1152  001a d6540c        	ld	a,(21516,x)
1153  001d ca0029        	or	a,_bLF_DEF+41
1154  0020 d7540c        	ld	(21516,x),a
1155                     ; 243 		LCD_BIT_SET(bP20);
1157  0023 c60039        	ld	a,_iLF_DEF+57
1158  0026 5f            	clrw	x
1159  0027 97            	ld	xl,a
1160  0028 d6540c        	ld	a,(21516,x)
1161  002b ca0039        	or	a,_bLF_DEF+57
1162  002e d7540c        	ld	(21516,x),a
1163                     ; 244 		__ui_disp_temp_c(3);
1165  0031 a603          	ld	a,#3
1166  0033 cd0000        	call	___ui_disp_temp_c
1168                     ; 245 		ui_disp_clear_tSetup(1);
1170  0036 a601          	ld	a,#1
1171  0038 cd0000        	call	_ui_disp_clear_tSetup
1173                     ; 246 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
1175  003b 7b01          	ld	a,(OFST+1,sp)
1176  003d 5f            	clrw	x
1177  003e 97            	ld	xl,a
1178  003f d60035        	ld	a,(_uiInfo+53,x)
1179  0042 cd0000        	call	_ui_disp_temp_curr
1181                     ; 247 		ui_disp_temp_setup(30);
1183  0045 a61e          	ld	a,#30
1184  0047 cd0000        	call	_ui_disp_temp_setup
1186  004a               L133:
1187                     ; 250 	return key;
1189  004a 7b01          	ld	a,(OFST+1,sp)
1192  004c 5b01          	addw	sp,#1
1193  004e 81            	ret	
1249                     ; 253 uint8_t		disp_status_loop_remote_B(uint8_t key)
1249                     ; 254 {
1250                     .text:	section	.text,new
1251  0000               _disp_status_loop_remote_B:
1253  0000 88            	push	a
1254  0001 89            	pushw	x
1255       00000002      OFST:	set	2
1258                     ; 256 	uint8_t	j = 0;
1260  0002 0f01          	clr	(OFST-1,sp)
1262                     ; 257 	i = uiInfo.remote_banb[key];
1264  0004 5f            	clrw	x
1265  0005 97            	ld	xl,a
1266  0006 d60055        	ld	a,(_uiInfo+85,x)
1267  0009 6b02          	ld	(OFST+0,sp),a
1269                     ; 259 	if (i == 0) {
1271  000b 260d          	jrne	L353
1272                     ; 260 		i = 10;
1274  000d a60a          	ld	a,#10
1275  000f 6b02          	ld	(OFST+0,sp),a
1277                     ; 261 		uiInfo.remote_banb[key] = i;
1279  0011 5f            	clrw	x
1280  0012 7b03          	ld	a,(OFST+1,sp)
1281  0014 97            	ld	xl,a
1282  0015 a60a          	ld	a,#10
1283  0017 d70055        	ld	(_uiInfo+85,x),a
1284  001a               L353:
1285                     ; 264 	if( uiInfo.enc != 0 )
1287  001a c60000        	ld	a,_uiInfo
1288  001d 2725          	jreq	L553
1289                     ; 269 		i += (uiInfo.enc&0x40)==0 ? -10 : 10;
1291  001f a540          	bcp	a,#64
1292  0021 2604          	jrne	L601
1293  0023 a6f6          	ld	a,#246
1294  0025 2002          	jra	L011
1295  0027               L601:
1296  0027 a60a          	ld	a,#10
1297  0029               L011:
1298  0029 1b02          	add	a,(OFST+0,sp)
1300                     ; 270 		if( i==0 )	i = 50;
1302  002b 2602          	jrne	L753
1305  002d a632          	ld	a,#50
1307  002f               L753:
1308                     ; 271 		if( i==60 )	i = 10;
1310  002f a13c          	cp	a,#60
1311  0031 2602          	jrne	L163
1314  0033 a60a          	ld	a,#10
1316  0035               L163:
1317  0035 6b02          	ld	(OFST+0,sp),a
1318                     ; 272 		uiInfo.remote_banb[key] = i;
1320  0037 5f            	clrw	x
1321  0038 7b03          	ld	a,(OFST+1,sp)
1322  003a 97            	ld	xl,a
1323  003b 7b02          	ld	a,(OFST+0,sp)
1324  003d d70055        	ld	(_uiInfo+85,x),a
1325                     ; 273 		j = 1;
1327  0040 a601          	ld	a,#1
1328  0042 6b01          	ld	(OFST-1,sp),a
1330  0044               L553:
1331                     ; 275 	if( _dsPrev != i )
1333  0044 c60000        	ld	a,__dsPrev
1334  0047 1102          	cp	a,(OFST+0,sp)
1335  0049 2744          	jreq	L363
1336                     ; 277 		_dsPrev = i;
1338  004b 7b02          	ld	a,(OFST+0,sp)
1339  004d c70000        	ld	__dsPrev,a
1340                     ; 279 		lcd_clear(0);
1342  0050 4f            	clr	a
1343  0051 cd0000        	call	_lcd_clear
1345                     ; 280 		disp_status_remote_message(0x10);
1347  0054 a610          	ld	a,#16
1348  0056 cd0000        	call	_disp_status_remote_message
1350                     ; 282 		LCD_BIT_SET(bP19);	
1352  0059 c60029        	ld	a,_iLF_DEF+41
1353  005c ad36          	call	LC007
1354  005e ca0029        	or	a,_bLF_DEF+41
1355  0061 d7540c        	ld	(21516,x),a
1356                     ; 283 		LCD_BIT_SET(bP20);
1358  0064 c60039        	ld	a,_iLF_DEF+57
1359  0067 ad2b          	call	LC007
1360  0069 ca0039        	or	a,_bLF_DEF+57
1361  006c d7540c        	ld	(21516,x),a
1362                     ; 284 		LCD_BIT_SET(bS1);
1364  006f c6002a        	ld	a,_iLF_DEF+42
1365  0072 ad20          	call	LC007
1366  0074 ca002a        	or	a,_bLF_DEF+42
1367  0077 d7540c        	ld	(21516,x),a
1368                     ; 285 		__ui_disp_temp_c(1);
1370  007a a601          	ld	a,#1
1371  007c cd0000        	call	___ui_disp_temp_c
1373                     ; 286 		ui_disp_temp_curr(uiInfo.tCurr);
1375  007f c60002        	ld	a,_uiInfo+2
1376  0082 cd0000        	call	_ui_disp_temp_curr
1378                     ; 287 		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
1380  0085 7b03          	ld	a,(OFST+1,sp)
1381  0087 5f            	clrw	x
1382  0088 97            	ld	xl,a
1383  0089 d60055        	ld	a,(_uiInfo+85,x)
1384  008c cd0000        	call	_ui_disp_repeat_setup
1386  008f               L363:
1387                     ; 289 	return j;
1389  008f 7b01          	ld	a,(OFST-1,sp)
1392  0091 5b03          	addw	sp,#3
1393  0093 81            	ret	
1394  0094               LC007:
1395  0094 5f            	clrw	x
1396  0095 97            	ld	xl,a
1397  0096 d6540c        	ld	a,(21516,x)
1398  0099 81            	ret	
1447                     ; 292 uint8_t		disp_status_loop_host_Off(uint8_t key)
1447                     ; 293 {
1448                     .text:	section	.text,new
1449  0000               _disp_status_loop_host_Off:
1451  0000 89            	pushw	x
1452       00000002      OFST:	set	2
1455                     ; 295 	uint8_t	j = 0;
1457  0001 0f01          	clr	(OFST-1,sp)
1459                     ; 296 	i = uiInfo.tSetup;
1461  0003 c6000e        	ld	a,_uiInfo+14
1462  0006 6b02          	ld	(OFST+0,sp),a
1464                     ; 297 	if( uiInfo.enc != 0 )
1466  0008 c60000        	ld	a,_uiInfo
1467  000b 271e          	jreq	L504
1468                     ; 300 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
1470  000d a540          	bcp	a,#64
1471  000f 2604          	jrne	L621
1472  0011 a6ff          	ld	a,#255
1473  0013 2002          	jra	L031
1474  0015               L621:
1475  0015 a601          	ld	a,#1
1476  0017               L031:
1477  0017 1b02          	add	a,(OFST+0,sp)
1479                     ; 301 		if( i<=10 )	i = 10;
1481  0019 a10b          	cp	a,#11
1482  001b 2402          	jruge	L704
1485  001d a60a          	ld	a,#10
1487  001f               L704:
1488                     ; 302 		if( i>=80 )	i = 80;
1490  001f a150          	cp	a,#80
1491  0021 2502          	jrult	L114
1494  0023 a650          	ld	a,#80
1496  0025               L114:
1497  0025 6b02          	ld	(OFST+0,sp),a
1498                     ; 305 		j = 1;
1500  0027 a601          	ld	a,#1
1501  0029 6b01          	ld	(OFST-1,sp),a
1503  002b               L504:
1504                     ; 307 	if( _dsPrev != i )
1506  002b c60000        	ld	a,__dsPrev
1507  002e 1102          	cp	a,(OFST+0,sp)
1508  0030 2705          	jreq	L314
1509                     ; 309 		_dsPrev = i;
1511  0032 7b02          	ld	a,(OFST+0,sp)
1512  0034 c70000        	ld	__dsPrev,a
1513  0037               L314:
1514                     ; 315 	return j;
1516  0037 7b01          	ld	a,(OFST-1,sp)
1519  0039 85            	popw	x
1520  003a 81            	ret	
1576                     ; 318 uint8_t		disp_status_loop_host_Out(uint8_t key)
1576                     ; 319 {
1577                     .text:	section	.text,new
1578  0000               _disp_status_loop_host_Out:
1580  0000 89            	pushw	x
1581       00000002      OFST:	set	2
1584                     ; 321 	uint8_t	j = 0;
1586  0001 0f02          	clr	(OFST+0,sp)
1588                     ; 322 	i = uiInfo.tSetup;
1590  0003 c6000e        	ld	a,_uiInfo+14
1591  0006 6b01          	ld	(OFST-1,sp),a
1593                     ; 323 	if( uiInfo.enc != 0 )
1595  0008 c60000        	ld	a,_uiInfo
1596  000b 2704          	jreq	L534
1597                     ; 331 		j = 1;
1599  000d a601          	ld	a,#1
1600  000f 6b02          	ld	(OFST+0,sp),a
1602  0011               L534:
1603                     ; 333 	if( _dsPrev != i )
1605  0011 c60000        	ld	a,__dsPrev
1606  0014 1101          	cp	a,(OFST-1,sp)
1607  0016 272d          	jreq	L734
1608                     ; 335 		_dsPrev = i;
1610  0018 7b01          	ld	a,(OFST-1,sp)
1611  001a c70000        	ld	__dsPrev,a
1612                     ; 337 		if (dr_mode_out == 0) {
1614  001d c60000        	ld	a,_dr_mode_out
1615  0020 2605          	jrne	L144
1616                     ; 338 			lcd_blink_item(bP13);
1618  0022 a610          	ld	a,#16
1619  0024 cd0000        	call	_lcd_blink_item
1621  0027               L144:
1622                     ; 341 		LCD_BIT_SET(bP0);	
1624  0027 c60019        	ld	a,_iLF_DEF+25
1625  002a 5f            	clrw	x
1626  002b 97            	ld	xl,a
1627  002c d6540c        	ld	a,(21516,x)
1628  002f ca0019        	or	a,_bLF_DEF+25
1629  0032 d7540c        	ld	(21516,x),a
1630                     ; 342 		ui_disp_temp_curr(uiInfo.tCurr);
1632  0035 c60002        	ld	a,_uiInfo+2
1633  0038 cd0000        	call	_ui_disp_temp_curr
1635                     ; 346 		ui_disp_temp_setup(30);
1637  003b a61e          	ld	a,#30
1638  003d cd0000        	call	_ui_disp_temp_setup
1640                     ; 347 		__ui_disp_temp_c(3);//도씨 표시
1642  0040 a603          	ld	a,#3
1643  0042 cd0000        	call	___ui_disp_temp_c
1645  0045               L734:
1646                     ; 353 	return j;
1648  0045 7b02          	ld	a,(OFST+0,sp)
1651  0047 85            	popw	x
1652  0048 81            	ret	
1702                     ; 356 uint8_t		disp_status_loop_host_Out_Long(uint8_t key)
1702                     ; 357 {
1703                     .text:	section	.text,new
1704  0000               _disp_status_loop_host_Out_Long:
1706  0000 89            	pushw	x
1707       00000002      OFST:	set	2
1710                     ; 359 	uint8_t	j = 0;
1712  0001 0f02          	clr	(OFST+0,sp)
1714                     ; 360 	i = uiInfo.tSetup;
1716  0003 c6000e        	ld	a,_uiInfo+14
1717  0006 6b01          	ld	(OFST-1,sp),a
1719                     ; 361 	if( uiInfo.enc != 0 )
1721  0008 c60000        	ld	a,_uiInfo
1722  000b 2704          	jreq	L364
1723                     ; 369 		j = 1;
1725  000d a601          	ld	a,#1
1726  000f 6b02          	ld	(OFST+0,sp),a
1728  0011               L364:
1729                     ; 371 	if( _dsPrev != i )
1731  0011 c60000        	ld	a,__dsPrev
1732  0014 1101          	cp	a,(OFST-1,sp)
1733  0016 270b          	jreq	L564
1734                     ; 373 		_dsPrev = i;
1736  0018 7b01          	ld	a,(OFST-1,sp)
1737  001a c70000        	ld	__dsPrev,a
1738                     ; 375 		ui_disp_temp_curr(uiInfo.tCurr);
1740  001d c60002        	ld	a,_uiInfo+2
1741  0020 cd0000        	call	_ui_disp_temp_curr
1743  0023               L564:
1744                     ; 378 	return j;
1746  0023 7b02          	ld	a,(OFST+0,sp)
1749  0025 85            	popw	x
1750  0026 81            	ret	
1807                     ; 381 uint8_t		disp_status_loop_host_N(uint8_t key)
1807                     ; 382 {
1808                     .text:	section	.text,new
1809  0000               _disp_status_loop_host_N:
1811  0000 89            	pushw	x
1812       00000002      OFST:	set	2
1815                     ; 384 	uint8_t	j = 0;
1817  0001 0f01          	clr	(OFST-1,sp)
1819                     ; 385 	i = uiInfo.tSetup;
1821  0003 c6000e        	ld	a,_uiInfo+14
1822  0006 6b02          	ld	(OFST+0,sp),a
1824                     ; 386 	if( uiInfo.enc != 0 )
1826  0008 c60000        	ld	a,_uiInfo
1827  000b 2721          	jreq	L705
1828                     ; 389 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1830  000d a540          	bcp	a,#64
1831  000f 2604          	jrne	L251
1832  0011 a6fe          	ld	a,#254
1833  0013 2002          	jra	L451
1834  0015               L251:
1835  0015 a602          	ld	a,#2
1836  0017               L451:
1837  0017 1b02          	add	a,(OFST+0,sp)
1839                     ; 390 		if( i<=10 )	i = 10;
1841  0019 a10b          	cp	a,#11
1842  001b 2402          	jruge	L115
1845  001d a60a          	ld	a,#10
1847  001f               L115:
1848                     ; 391 		if( i>=80 )	i = 80;
1850  001f a150          	cp	a,#80
1851  0021 2502          	jrult	L315
1854  0023 a650          	ld	a,#80
1856  0025               L315:
1857  0025 6b02          	ld	(OFST+0,sp),a
1858                     ; 392 		uiInfo.tSetup = i;
1860  0027 c7000e        	ld	_uiInfo+14,a
1861                     ; 394 		j = 1;
1863  002a a601          	ld	a,#1
1864  002c 6b01          	ld	(OFST-1,sp),a
1866  002e               L705:
1867                     ; 396 	if( _dsPrev != i )
1869  002e c60000        	ld	a,__dsPrev
1870  0031 1102          	cp	a,(OFST+0,sp)
1871  0033 272c          	jreq	L515
1872                     ; 398 		_dsPrev = i;
1874  0035 7b02          	ld	a,(OFST+0,sp)
1875  0037 c70000        	ld	__dsPrev,a
1876                     ; 400 		LCD_BIT_SET(bP0);	
1878  003a 5f            	clrw	x
1879  003b c60019        	ld	a,_iLF_DEF+25
1880  003e 97            	ld	xl,a
1881  003f d6540c        	ld	a,(21516,x)
1882  0042 ca0019        	or	a,_bLF_DEF+25
1883  0045 d7540c        	ld	(21516,x),a
1884                     ; 401 		ui_disp_temp_setup(uiInfo.tSetup);
1886  0048 c6000e        	ld	a,_uiInfo+14
1887  004b cd0000        	call	_ui_disp_temp_setup
1889                     ; 402 		ui_disp_temp_curr(uiInfo.tCurr);
1891  004e c60002        	ld	a,_uiInfo+2
1892  0051 cd0000        	call	_ui_disp_temp_curr
1894                     ; 403 		UPDATE_BIT(BIT_TSETUP);
1896  0054 72140000      	bset	__updateBit,#2
1899  0058 5500000000    	mov	__updateTimer,___timer1s
1902  005d 35050000      	mov	__updateCount,#5
1904  0061               L515:
1905                     ; 405 	return j;
1907  0061 7b01          	ld	a,(OFST-1,sp)
1910  0063 85            	popw	x
1911  0064 81            	ret	
1968                     ; 408 uint8_t	disp_status_loop_host_Y(uint8_t key)
1968                     ; 409 {
1969                     .text:	section	.text,new
1970  0000               _disp_status_loop_host_Y:
1972  0000 89            	pushw	x
1973       00000002      OFST:	set	2
1976                     ; 411 	uint8_t	j = 0;
1978  0001 0f01          	clr	(OFST-1,sp)
1980                     ; 412 	i = uiInfo.reserve;
1982  0003 c6000d        	ld	a,_uiInfo+13
1983  0006 6b02          	ld	(OFST+0,sp),a
1985                     ; 413 	if( uiInfo.enc != 0 )
1987  0008 c60000        	ld	a,_uiInfo
1988  000b 2721          	jreq	L735
1989                     ; 416 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1991  000d a540          	bcp	a,#64
1992  000f 2604          	jrne	L461
1993  0011 a6fe          	ld	a,#254
1994  0013 2002          	jra	L661
1995  0015               L461:
1996  0015 a602          	ld	a,#2
1997  0017               L661:
1998  0017 1b02          	add	a,(OFST+0,sp)
2000                     ; 417 		if( i<=2 )	i = 2;
2002  0019 a103          	cp	a,#3
2003  001b 2402          	jruge	L145
2006  001d a602          	ld	a,#2
2008  001f               L145:
2009                     ; 418 		if( i>=48 )	i = 48;
2011  001f a130          	cp	a,#48
2012  0021 2502          	jrult	L345
2015  0023 a630          	ld	a,#48
2017  0025               L345:
2018  0025 6b02          	ld	(OFST+0,sp),a
2019                     ; 419 		uiInfo.reserve = i;
2021  0027 c7000d        	ld	_uiInfo+13,a
2022                     ; 421 		j = 1;
2024  002a a601          	ld	a,#1
2025  002c 6b01          	ld	(OFST-1,sp),a
2027  002e               L735:
2028                     ; 423 	if( _dsPrev != i )
2030  002e c60000        	ld	a,__dsPrev
2031  0031 1102          	cp	a,(OFST+0,sp)
2032  0033 272c          	jreq	L545
2033                     ; 425 		_dsPrev = i;
2035  0035 7b02          	ld	a,(OFST+0,sp)
2036  0037 c70000        	ld	__dsPrev,a
2037                     ; 426 		LCD_BIT_SET(bP0);	
2039  003a 5f            	clrw	x
2040  003b c60019        	ld	a,_iLF_DEF+25
2041  003e 97            	ld	xl,a
2042  003f d6540c        	ld	a,(21516,x)
2043  0042 ca0019        	or	a,_bLF_DEF+25
2044  0045 d7540c        	ld	(21516,x),a
2045                     ; 427 		ui_disp_temp_curr(uiInfo.tCurr);
2047  0048 c60002        	ld	a,_uiInfo+2
2048  004b cd0000        	call	_ui_disp_temp_curr
2050                     ; 428 		ui_disp_reserve_setup(uiInfo.reserve);
2052  004e c6000d        	ld	a,_uiInfo+13
2053  0051 cd0000        	call	_ui_disp_reserve_setup
2055                     ; 429 		UPDATE_BIT(BIT_RESERVE);
2057  0054 72120000      	bset	__updateBit,#1
2060  0058 5500000000    	mov	__updateTimer,___timer1s
2063  005d 35050000      	mov	__updateCount,#5
2065  0061               L545:
2066                     ; 431 	return j;
2068  0061 7b01          	ld	a,(OFST-1,sp)
2071  0063 85            	popw	x
2072  0064 81            	ret	
2129                     ; 434 uint8_t		disp_status_loop_host_B(uint8_t key)
2129                     ; 435 {
2130                     .text:	section	.text,new
2131  0000               _disp_status_loop_host_B:
2133  0000 89            	pushw	x
2134       00000002      OFST:	set	2
2137                     ; 437 	uint8_t	j = 0;
2139  0001 0f01          	clr	(OFST-1,sp)
2141                     ; 438 	i = uiInfo.repeat;
2143  0003 c6000c        	ld	a,_uiInfo+12
2144  0006 6b02          	ld	(OFST+0,sp),a
2146                     ; 439 	if( uiInfo.enc != 0 )
2148  0008 c60000        	ld	a,_uiInfo
2149  000b 271f          	jreq	L765
2150                     ; 442 		i += (uiInfo.enc&0x40)==0 ? -10 : 10;
2152  000d a540          	bcp	a,#64
2153  000f 2604          	jrne	L671
2154  0011 a6f6          	ld	a,#246
2155  0013 2002          	jra	L002
2156  0015               L671:
2157  0015 a60a          	ld	a,#10
2158  0017               L002:
2159  0017 1b02          	add	a,(OFST+0,sp)
2161                     ; 443 		if( i==0 )	i = 50;
2163  0019 2602          	jrne	L175
2166  001b a632          	ld	a,#50
2168  001d               L175:
2169                     ; 444 		if( i==60 )	i = 10;
2171  001d a13c          	cp	a,#60
2172  001f 2602          	jrne	L375
2175  0021 a60a          	ld	a,#10
2177  0023               L375:
2178  0023 6b02          	ld	(OFST+0,sp),a
2179                     ; 445 		uiInfo.repeat = i;
2181  0025 c7000c        	ld	_uiInfo+12,a
2182                     ; 447 		j = 1;
2184  0028 a601          	ld	a,#1
2185  002a 6b01          	ld	(OFST-1,sp),a
2187  002c               L765:
2188                     ; 449 	if( _dsPrev != i )
2190  002c c60000        	ld	a,__dsPrev
2191  002f 1102          	cp	a,(OFST+0,sp)
2192  0031 272c          	jreq	L575
2193                     ; 451 		_dsPrev = i;
2195  0033 7b02          	ld	a,(OFST+0,sp)
2196  0035 c70000        	ld	__dsPrev,a
2197                     ; 452 		LCD_BIT_SET(bP0);	
2199  0038 5f            	clrw	x
2200  0039 c60019        	ld	a,_iLF_DEF+25
2201  003c 97            	ld	xl,a
2202  003d d6540c        	ld	a,(21516,x)
2203  0040 ca0019        	or	a,_bLF_DEF+25
2204  0043 d7540c        	ld	(21516,x),a
2205                     ; 453 		ui_disp_temp_curr(uiInfo.tCurr);
2207  0046 c60002        	ld	a,_uiInfo+2
2208  0049 cd0000        	call	_ui_disp_temp_curr
2210                     ; 454 		ui_disp_repeat_setup(uiInfo.repeat);
2212  004c c6000c        	ld	a,_uiInfo+12
2213  004f cd0000        	call	_ui_disp_repeat_setup
2215                     ; 455 		UPDATE_BIT(BIT_REPEAT);
2217  0052 72100000      	bset	__updateBit,#0
2220  0056 5500000000    	mov	__updateTimer,___timer1s
2223  005b 35050000      	mov	__updateCount,#5
2225  005f               L575:
2226                     ; 457 	return j;
2228  005f 7b01          	ld	a,(OFST-1,sp)
2231  0061 85            	popw	x
2232  0062 81            	ret	
2235                     	switch	.data
2236  002d               __key_blink:
2237  002d 00            	dc.b	0
2288                     ; 464 void	disp_rid_info(void)
2288                     ; 465 {
2289                     .text:	section	.text,new
2290  0000               _disp_rid_info:
2292  0000 5203          	subw	sp,#3
2293       00000003      OFST:	set	3
2296                     ; 471 	j = uiInfo.cnt + uiInfo.cnt_sub;
2298  0002 c60005        	ld	a,_uiInfo+5
2299  0005 cb0006        	add	a,_uiInfo+6
2300  0008 6b01          	ld	(OFST-2,sp),a
2302                     ; 472 	for( i=1; i<j; i++ )
2304  000a a601          	ld	a,#1
2305  000c 6b03          	ld	(OFST+0,sp),a
2308  000e 203a          	jra	L326
2309  0010               L716:
2310                     ; 474 		if( i >= 7 )
2312  0010 a107          	cp	a,#7
2313  0012 2503          	jrult	L726
2314                     ; 475 			break;
2315  0014               L526:
2316                     ; 484 }
2319  0014 5b03          	addw	sp,#3
2320  0016 81            	ret	
2321  0017               L726:
2322                     ; 477 		if( packet_buf[i] != ui_timeout ){
2324  0017 5f            	clrw	x
2325  0018 97            	ld	xl,a
2326  0019 d60000        	ld	a,(_packet_buf,x)
2327  001c c10000        	cp	a,_ui_timeout
2328  001f 271b          	jreq	L136
2329                     ; 478 			led = getHexToBin(_rcLED, i);
2331  0021 7b03          	ld	a,(OFST+0,sp)
2332  0023 97            	ld	xl,a
2333  0024 c60000        	ld	a,__rcLED
2334  0027 95            	ld	xh,a
2335  0028 cd0000        	call	_getHexToBin
2337  002b 6b02          	ld	(OFST-1,sp),a
2339                     ; 479 			lcd_disp_rid(i + 1, led, 1);
2341  002d 4b01          	push	#1
2342  002f 7b03          	ld	a,(OFST+0,sp)
2343  0031 97            	ld	xl,a
2344  0032 7b04          	ld	a,(OFST+1,sp)
2345  0034 4c            	inc	a
2346  0035 95            	ld	xh,a
2347  0036 cd0000        	call	_lcd_disp_rid
2349  0039 84            	pop	a
2351  003a 200a          	jra	L336
2352  003c               L136:
2353                     ; 482 			lcd_clear_rid_n(i + 1, 1);
2355  003c 7b03          	ld	a,(OFST+0,sp)
2356  003e 4c            	inc	a
2357  003f ae0001        	ldw	x,#1
2358  0042 95            	ld	xh,a
2359  0043 cd0000        	call	_lcd_clear_rid_n
2361  0046               L336:
2362                     ; 472 	for( i=1; i<j; i++ )
2364  0046 0c03          	inc	(OFST+0,sp)
2366  0048 7b03          	ld	a,(OFST+0,sp)
2367  004a               L326:
2370  004a 1101          	cp	a,(OFST-2,sp)
2371  004c 25c2          	jrult	L716
2372  004e 20c4          	jra	L526
2408                     ; 495 void	_disp_status_loop_host_boiler(uint8_t id)
2408                     ; 496 {
2409                     .text:	section	.text,new
2410  0000               __disp_status_loop_host_boiler:
2414                     ; 497 	uiInfo.opMode = (id==0) ? 7 : __boiler_shower[3];
2416  0000 4d            	tnz	a
2417  0001 2604          	jrne	L022
2418  0003 a607          	ld	a,#7
2419  0005 2003          	jra	L222
2420  0007               L022:
2421  0007 c6000e        	ld	a,___boiler_shower+3
2422  000a               L222:
2423  000a c70007        	ld	_uiInfo+7,a
2424                     ; 498 	func_rc_setting();
2427                     ; 499 }
2430  000d cc0000        	jp	_func_rc_setting
2555                     ; 503 void	disp_status_loop_host(uint8_t key)
2555                     ; 504 {
2556                     .text:	section	.text,new
2557  0000               _disp_status_loop_host:
2559  0000 88            	push	a
2560  0001 5204          	subw	sp,#4
2561       00000004      OFST:	set	4
2564                     ; 505 	uint8_t	i = 0;
2566  0003 0f04          	clr	(OFST+0,sp)
2568                     ; 506 	uint8_t	j = 0;
2570                     ; 507 	uint8_t	k = 0;
2572                     ; 509 	uint8_t _pre_boiler_water_shower = 0;
2574  0005 0f02          	clr	(OFST-2,sp)
2576                     ; 510 	uint8_t _pre_boiler_water_heat = 0;	
2578  0007 0f03          	clr	(OFST-1,sp)
2580                     ; 512 	if (_remote == 0) {
2582  0009 c60004        	ld	a,__remote
2583  000c 2603          	jrne	L737
2584                     ; 513 		disp_rid_info();
2586  000e cd0000        	call	_disp_rid_info
2588  0011               L737:
2589                     ; 516 	if( __s == 0 )  // 일반 모드
2591  0011 c60000        	ld	a,___s
2592  0014 2703cc0456    	jrne	L147
2593                     ; 518 		if( _dsCount == 0 )
2595  0019 c60000        	ld	a,__dsCount
2596  001c 2618          	jrne	L347
2597                     ; 520 			_dsCount = 10;
2599  001e 350a0000      	mov	__dsCount,#10
2600                     ; 524 			if (start_flag == 0) {
2602  0022 725d0000      	tnz	_start_flag
2603  0026 2603          	jrne	L547
2604                     ; 525 				__sUp = 0;
2606  0028 c70000        	ld	___sUp,a
2607  002b               L547:
2608                     ; 527 			start_flag = 0;
2610  002b 725f0000      	clr	_start_flag
2611                     ; 529 			__sDn = 0xff;
2613  002f 35ff0000      	mov	___sDn,#255
2615  0033 cc089a        	jra	L3731
2616  0036               L347:
2617                     ; 532 		} else if (_dsCount == 9) {
2619  0036 a109          	cp	a,#9
2620  0038 260e          	jrne	L157
2621                     ; 533 			_dsCount = 1;
2623  003a 35010000      	mov	__dsCount,#1
2624                     ; 534 			__sDn = 0xff;
2626  003e 35ff0000      	mov	___sDn,#255
2627                     ; 535 			disp_status_loop_init();
2629  0042 cd0000        	call	_disp_status_loop_init
2632  0045 cc089a        	jra	L3731
2633  0048               L157:
2634                     ; 537 		else if( _dsCount == 10 )
2636  0048 a10a          	cp	a,#10
2637  004a 2703cc00cc    	jrne	L557
2638                     ; 539 			if (key==200) _GOTO(17)  // out long
2640  004f 7b05          	ld	a,(OFST+1,sp)
2641  0051 a1c8          	cp	a,#200
2642  0053 2608          	jrne	L757
2645  0055 35110000      	mov	___sUp,#17
2648  0059 350a0000      	mov	__dsCount,#10
2649  005d               L757:
2650                     ; 542 			if( __sUp == 0 )		_dsCount = 15;	//	N
2652  005d c60000        	ld	a,___sUp
2653  0060 2606          	jrne	L167
2656  0062 350f0000      	mov	__dsCount,#15
2658  0066 205e          	jra	L367
2659  0068               L167:
2660                     ; 543 			else if( __sUp == 1 )	_dsCount = 35;	//	Y
2662  0068 a101          	cp	a,#1
2663  006a 2606          	jrne	L567
2666  006c 35230000      	mov	__dsCount,#35
2668  0070 2054          	jra	L367
2669  0072               L567:
2670                     ; 544 			else if( __sUp == 2 )	_dsCount = 25;	//	B
2672  0072 a102          	cp	a,#2
2673  0074 2606          	jrne	L177
2676  0076 35190000      	mov	__dsCount,#25
2678  007a 204a          	jra	L367
2679  007c               L177:
2680                     ; 545 			else if( __sUp == 5 )	{_dsCount = 45; _key_time_event[0] = 0; }	//	off
2682  007c a105          	cp	a,#5
2683  007e 260a          	jrne	L577
2686  0080 352d0000      	mov	__dsCount,#45
2689  0084 725f0000      	clr	__key_time_event
2691  0088 203c          	jra	L367
2692  008a               L577:
2693                     ; 546 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //	out
2695  008a a110          	cp	a,#16
2696  008c 260a          	jrne	L1001
2699  008e 35100000      	mov	__dsCount,#16
2702  0092 35080000      	mov	___sUp,#8
2704  0096 202e          	jra	L367
2705  0098               L1001:
2706                     ; 547 			else if( __sUp == 101 )	{	_dsCount = 0;	__s = 101; }
2708  0098 a165          	cp	a,#101
2709  009a 260a          	jrne	L5001
2712  009c 725f0000      	clr	__dsCount
2715  00a0 35650000      	mov	___s,#101
2717  00a4 2020          	jra	L367
2718  00a6               L5001:
2719                     ; 548 			else if( __sUp == 20 )	{	
2721  00a6 a114          	cp	a,#20
2722  00a8 260a          	jrne	L1101
2723                     ; 550 			_dsCount = 0; 
2725  00aa 725f0000      	clr	__dsCount
2726                     ; 551 			__s = 1;} // setting
2728  00ae 35010000      	mov	___s,#1
2730  00b2 2012          	jra	L367
2731  00b4               L1101:
2732                     ; 552 			else if( __sUp == 17 )	{_dsCount = 17; _dsPrev = 0xff;}	//	Out long
2734  00b4 a111          	cp	a,#17
2735  00b6 260a          	jrne	L5101
2738  00b8 35110000      	mov	__dsCount,#17
2741  00bc 35ff0000      	mov	__dsPrev,#255
2743  00c0 2004          	jra	L367
2744  00c2               L5101:
2745                     ; 554 				_dsCount = 1;
2747  00c2 35010000      	mov	__dsCount,#1
2748  00c6               L367:
2749                     ; 555 			disp_status_loop_init();
2751  00c6 cd0000        	call	_disp_status_loop_init
2754  00c9 cc089a        	jra	L3731
2755  00cc               L557:
2756                     ; 560 		else if( _dsCount == 15 )			//	N/Out
2758  00cc a10f          	cp	a,#15
2759  00ce 2665          	jrne	L3201
2760                     ; 562 			if( key==1 )		_GOTO(101)	//	TBD//Remote
2762  00d0 7b05          	ld	a,(OFST+1,sp)
2763  00d2 a101          	cp	a,#1
2764  00d4 260a          	jrne	L5201
2767  00d6 35650000      	mov	___sUp,#101
2770  00da 350a0000      	mov	__dsCount,#10
2772  00de 2040          	jra	L7201
2773  00e0               L5201:
2774                     ; 563 			else if( key==2 )	_GOTO2(1, 0)	//	Y/B
2776  00e0 a102          	cp	a,#2
2777  00e2 260e          	jrne	L1301
2780  00e4 35010000      	mov	___sUp,#1
2783  00e8 350a0000      	mov	__dsCount,#10
2787  00ec 725f0000      	clr	___sDn
2789  00f0 202e          	jra	L7201
2790  00f2               L1301:
2791                     ; 564 			else if( key==4 ) _GOTO(16)	//	Out
2793  00f2 a104          	cp	a,#4
2794  00f4 260a          	jrne	L5301
2797  00f6 35100000      	mov	___sUp,#16
2800  00fa 350a0000      	mov	__dsCount,#10
2802  00fe 2020          	jra	L7201
2803  0100               L5301:
2804                     ; 565 			else if( key==8 )	_GOTO(5)	//	Off
2806  0100 a108          	cp	a,#8
2807  0102 260a          	jrne	L1401
2810  0104 35050000      	mov	___sUp,#5
2813  0108 350a0000      	mov	__dsCount,#10
2815  010c 2012          	jra	L7201
2816  010e               L1401:
2817                     ; 566 			else if( key==16 )	_DN
2819  010e a110          	cp	a,#16
2820  0110 2606          	jrne	L5401
2823  0112 35400000      	mov	_uiInfo,#64
2825  0116 2008          	jra	L7201
2826  0118               L5401:
2827                     ; 567 			else if( key==32 )	_UP
2829  0118 a120          	cp	a,#32
2830  011a 2604          	jrne	L7201
2833  011c 35010000      	mov	_uiInfo,#1
2834  0120               L7201:
2835                     ; 569 			_disp_temp = 1;
2837  0120 35010000      	mov	__disp_temp,#1
2838                     ; 570 			i = disp_status_loop_host_N(key);
2840  0124 7b05          	ld	a,(OFST+1,sp)
2841  0126 cd0000        	call	_disp_status_loop_host_N
2843  0129 6b04          	ld	(OFST+0,sp),a
2845                     ; 571 			if( i==1 )
2847  012b 4a            	dec	a
2848  012c 269b          	jrne	L3731
2849                     ; 572 				_key_blink = 1;
2851  012e 3501002d      	mov	__key_blink,#1
2852  0132 cc089a        	jra	L3731
2853  0135               L3201:
2854                     ; 574 		else if( _dsCount == 16 )			//	OUT
2856  0135 a110          	cp	a,#16
2857  0137 2641          	jrne	L7501
2858                     ; 576 			if( key==1 )		_GOTO(101)	//	TBD//Y
2860  0139 7b05          	ld	a,(OFST+1,sp)
2861  013b a101          	cp	a,#1
2862  013d 2606          	jrne	L1601
2865  013f 35650000      	mov	___sUp,#101
2868  0143 201c          	jp	LC008
2869  0145               L1601:
2870                     ; 577 			else if( key==2 )	_GOTO(1)	//	Y
2872  0145 a102          	cp	a,#2
2873  0147 2606          	jrne	L5601
2876  0149 35010000      	mov	___sUp,#1
2879  014d 2012          	jp	LC008
2880  014f               L5601:
2881                     ; 578 			else if( key==4 )	_GOTO(0)	//	N
2883  014f a104          	cp	a,#4
2884  0151 2606          	jrne	L1701
2887  0153 725f0000      	clr	___sUp
2890  0157 2008          	jp	LC008
2891  0159               L1701:
2892                     ; 579 			else if( key==8 )	_GOTO(5)	//	Off
2894  0159 a108          	cp	a,#8
2895  015b 2608          	jrne	L3601
2898  015d 35050000      	mov	___sUp,#5
2901  0161               LC008:
2905  0161 350a0000      	mov	__dsCount,#10
2906  0165               L3601:
2907                     ; 581 			_disp_temp = 1;
2909  0165 35010000      	mov	__disp_temp,#1
2910                     ; 582 			i = disp_status_loop_host_Out(key);
2912  0169 7b05          	ld	a,(OFST+1,sp)
2913  016b cd0000        	call	_disp_status_loop_host_Out
2915  016e 6b04          	ld	(OFST+0,sp),a
2917                     ; 583 			if( i==1 )
2919  0170 4a            	dec	a
2920  0171 26bf          	jrne	L3731
2921                     ; 584 				_key_blink = 1;
2923  0173 3501002d      	mov	__key_blink,#1
2924  0177 cc089a        	jra	L3731
2925  017a               L7501:
2926                     ; 586 		else if (_dsCount == 17) {
2928  017a a111          	cp	a,#17
2929  017c 260f          	jrne	L3011
2930                     ; 587 			dr_mode_out = 0;
2932  017e 725f0000      	clr	_dr_mode_out
2933                     ; 590 			_GOTO(16);
2935  0182 35100000      	mov	___sUp,#16
2938  0186 350a0000      	mov	__dsCount,#10
2941  018a cc089a        	jra	L3731
2942  018d               L3011:
2943                     ; 615 		else if( _dsCount == 25 )			//	B
2945  018d a119          	cp	a,#25
2946  018f 2665          	jrne	L7011
2947                     ; 617 			if( key==1 )		_GOTO(101)	//	Y
2949  0191 7b05          	ld	a,(OFST+1,sp)
2950  0193 a101          	cp	a,#1
2951  0195 260a          	jrne	L1111
2954  0197 35650000      	mov	___sUp,#101
2957  019b 350a0000      	mov	__dsCount,#10
2959  019f 2040          	jra	L3111
2960  01a1               L1111:
2961                     ; 618 			else if( key==2 )	
2963  01a1 a102          	cp	a,#2
2964  01a3 260e          	jrne	L5111
2965                     ; 620 				__sDn = 0;
2967  01a5 725f0000      	clr	___sDn
2968                     ; 621 				_GOTO(1)	//	Y
2970  01a9 35010000      	mov	___sUp,#1
2973  01ad 350a0000      	mov	__dsCount,#10
2975  01b1 202e          	jra	L3111
2976  01b3               L5111:
2977                     ; 623 			else if( key==4 )	_GOTO(0)	//	N
2979  01b3 a104          	cp	a,#4
2980  01b5 260a          	jrne	L1211
2983  01b7 725f0000      	clr	___sUp
2986  01bb 350a0000      	mov	__dsCount,#10
2988  01bf 2020          	jra	L3111
2989  01c1               L1211:
2990                     ; 624 			else if( key==8 )	_GOTO(5)	//	Off
2992  01c1 a108          	cp	a,#8
2993  01c3 260a          	jrne	L5211
2996  01c5 35050000      	mov	___sUp,#5
2999  01c9 350a0000      	mov	__dsCount,#10
3001  01cd 2012          	jra	L3111
3002  01cf               L5211:
3003                     ; 625 			else if( key==16 )	_DN
3005  01cf a110          	cp	a,#16
3006  01d1 2606          	jrne	L1311
3009  01d3 35400000      	mov	_uiInfo,#64
3011  01d7 2008          	jra	L3111
3012  01d9               L1311:
3013                     ; 626 			else if( key==32 )	_UP
3015  01d9 a120          	cp	a,#32
3016  01db 2604          	jrne	L3111
3019  01dd 35010000      	mov	_uiInfo,#1
3020  01e1               L3111:
3021                     ; 630 			_disp_temp = 1;
3023  01e1 35010000      	mov	__disp_temp,#1
3024                     ; 631 			i = disp_status_loop_host_B(key);
3026  01e5 7b05          	ld	a,(OFST+1,sp)
3027  01e7 cd0000        	call	_disp_status_loop_host_B
3029  01ea 6b04          	ld	(OFST+0,sp),a
3031                     ; 632 			if( i==1 )
3033  01ec 4a            	dec	a
3034  01ed 269b          	jrne	L3731
3035                     ; 633 				_key_blink = 1;
3037  01ef 3501002d      	mov	__key_blink,#1
3038  01f3 cc089a        	jra	L3731
3039  01f6               L7011:
3040                     ; 635 		else if( _dsCount == 35 )			//	Y
3042  01f6 a123          	cp	a,#35
3043  01f8 2665          	jrne	L3411
3044                     ; 637 			if( key==1 )		_GOTO(101)	//	N
3046  01fa 7b05          	ld	a,(OFST+1,sp)
3047  01fc a101          	cp	a,#1
3048  01fe 260a          	jrne	L5411
3051  0200 35650000      	mov	___sUp,#101
3054  0204 350a0000      	mov	__dsCount,#10
3056  0208 2040          	jra	L7411
3057  020a               L5411:
3058                     ; 638 			else if( key==2 )	
3060  020a a102          	cp	a,#2
3061  020c 260e          	jrne	L1511
3062                     ; 640 				__sDn = 1;
3064  020e 35010000      	mov	___sDn,#1
3065                     ; 641 				_GOTO(2)	//	B
3067  0212 35020000      	mov	___sUp,#2
3070  0216 350a0000      	mov	__dsCount,#10
3072  021a 202e          	jra	L7411
3073  021c               L1511:
3074                     ; 643 			else if( key==4 )	_GOTO(0)	//	N
3076  021c a104          	cp	a,#4
3077  021e 260a          	jrne	L5511
3080  0220 725f0000      	clr	___sUp
3083  0224 350a0000      	mov	__dsCount,#10
3085  0228 2020          	jra	L7411
3086  022a               L5511:
3087                     ; 644 			else if( key==8 )	_GOTO(5)	//	Off
3089  022a a108          	cp	a,#8
3090  022c 260a          	jrne	L1611
3093  022e 35050000      	mov	___sUp,#5
3096  0232 350a0000      	mov	__dsCount,#10
3098  0236 2012          	jra	L7411
3099  0238               L1611:
3100                     ; 645 			else if( key==16 )	_DN
3102  0238 a110          	cp	a,#16
3103  023a 2606          	jrne	L5611
3106  023c 35400000      	mov	_uiInfo,#64
3108  0240 2008          	jra	L7411
3109  0242               L5611:
3110                     ; 646 			else if( key==32 )	_UP
3112  0242 a120          	cp	a,#32
3113  0244 2604          	jrne	L7411
3116  0246 35010000      	mov	_uiInfo,#1
3117  024a               L7411:
3118                     ; 647 			_disp_temp = 1;
3120  024a 35010000      	mov	__disp_temp,#1
3121                     ; 648 			i = disp_status_loop_host_Y(key);
3123  024e 7b05          	ld	a,(OFST+1,sp)
3124  0250 cd0000        	call	_disp_status_loop_host_Y
3126  0253 6b04          	ld	(OFST+0,sp),a
3128                     ; 649 			if( i==1 )
3130  0255 4a            	dec	a
3131  0256 269b          	jrne	L3731
3132                     ; 650 				_key_blink = 1;
3134  0258 3501002d      	mov	__key_blink,#1
3135  025c cc089a        	jra	L3731
3136  025f               L3411:
3137                     ; 652 		else if( _dsCount == 45 )			//	off
3139  025f a12d          	cp	a,#45
3140  0261 2676          	jrne	L7711
3141                     ; 654 			if (_key_time_event[0] == 0) 
3143  0263 c60000        	ld	a,__key_time_event
3144  0266 260e          	jrne	L1021
3145                     ; 656 				_key_time_event[0] = 1;
3147  0268 35010000      	mov	__key_time_event,#1
3148                     ; 657 				_key_time_event[1] = __timer1s;
3150  026c 5500000001    	mov	__key_time_event+1,___timer1s
3151                     ; 658 				_key_time_event[2] = 0;
3153  0271 c70002        	ld	__key_time_event+2,a
3155  0274 201f          	jra	L3021
3156  0276               L1021:
3157                     ; 660 			else if (_key_time_event[0] == 1)
3159  0276 4a            	dec	a
3160  0277 261c          	jrne	L3021
3161                     ; 662 				if (_key_time_event[1] != __timer1s) {
3163  0279 c60001        	ld	a,__key_time_event+1
3164  027c c10000        	cp	a,___timer1s
3165  027f 2709          	jreq	L7021
3166                     ; 663 					_key_time_event[1] = __timer1s;
3168  0281 5500000001    	mov	__key_time_event+1,___timer1s
3169                     ; 664 					_key_time_event[2]++;
3171  0286 725c0002      	inc	__key_time_event+2
3172  028a               L7021:
3173                     ; 667 				if (_key_time_event[2] == 10) {
3175  028a c60002        	ld	a,__key_time_event+2
3176  028d a10a          	cp	a,#10
3177  028f 2604          	jrne	L3021
3178                     ; 668 					_key_time_event[0] = 2;
3180  0291 35020000      	mov	__key_time_event,#2
3181  0295               L3021:
3182                     ; 673 			if( key==1 )		_GOTO(101)	//	TBD
3184  0295 7b05          	ld	a,(OFST+1,sp)
3185  0297 a101          	cp	a,#1
3186  0299 2606          	jrne	L3121
3189  029b 35650000      	mov	___sUp,#101
3192  029f 2023          	jp	LC009
3193  02a1               L3121:
3194                     ; 674 			else if( key==2 )	_GOTO(1)	//	Y
3196  02a1 a102          	cp	a,#2
3197  02a3 2606          	jrne	L7121
3200  02a5 35010000      	mov	___sUp,#1
3203  02a9 2019          	jp	LC009
3204  02ab               L7121:
3205                     ; 675 			else if( key==4 )	_GOTO(0)	//	N
3207  02ab a104          	cp	a,#4
3208  02ad 2606          	jrne	L3221
3211  02af               LC010:
3213  02af 725f0000      	clr	___sUp
3216  02b3 200f          	jp	LC009
3217  02b5               L3221:
3218                     ; 676 			else if( key==8 )	
3220  02b5 a108          	cp	a,#8
3221  02b7 2611          	jrne	L5121
3222                     ; 678 				if (_key_time_event[0] == 2) 
3224  02b9 c60000        	ld	a,__key_time_event
3225  02bc a102          	cp	a,#2
3226                     ; 680 					 _GOTO(0)				//	on
3229  02be 27ef          	jreq	LC010
3230                     ; 684 					_GOTO(20)       // 	setting
3232  02c0 35140000      	mov	___sUp,#20
3235  02c4               LC009:
3240  02c4 350a0000      	mov	__dsCount,#10
3241  02c8 7b05          	ld	a,(OFST+1,sp)
3242  02ca               L5121:
3243                     ; 688 			i = disp_status_loop_host_Off(key);
3245  02ca cd0000        	call	_disp_status_loop_host_Off
3247  02cd 6b04          	ld	(OFST+0,sp),a
3249                     ; 689 			if( i==1 )
3251  02cf 4a            	dec	a
3252  02d0 268a          	jrne	L3731
3253                     ; 690 				_key_blink = 1;
3255  02d2 3501002d      	mov	__key_blink,#1
3256  02d6 cc089a        	jra	L3731
3257  02d9               L7711:
3258                     ; 692 		else if( _dsCount == 11 )
3260  02d9 a10b          	cp	a,#11
3261  02db 2617          	jrne	L1421
3262                     ; 694 			_dsCount = 2;
3264  02dd 35020000      	mov	__dsCount,#2
3265                     ; 695 			__sUp = 0xff;
3267  02e1 35ff0000      	mov	___sUp,#255
3268                     ; 696 			disp_status_loop_init();
3270  02e5 cd0000        	call	_disp_status_loop_init
3272                     ; 697 			disp_status_loop_messageDn(__sDn);
3274  02e8 c60000        	ld	a,___sDn
3275  02eb cd0000        	call	_disp_status_loop_messageDn
3277                     ; 698 			disp_status_curr_only();
3279  02ee cd0000        	call	_disp_status_curr_only
3282  02f1 cc089a        	jra	L3731
3283  02f4               L1421:
3284                     ; 700 		else if( _dsCount == 1 )
3286  02f4 a101          	cp	a,#1
3287  02f6 2703cc0400    	jrne	L5421
3288                     ; 705 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
3290  02fb c60000        	ld	a,___sUp
3291  02fe 2607          	jrne	L7421
3294  0300 7b05          	ld	a,(OFST+1,sp)
3295  0302 cd0000        	call	_disp_status_loop_host_N
3298  0305 2014          	jp	LC011
3299  0307               L7421:
3300                     ; 706 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
3302  0307 a101          	cp	a,#1
3303  0309 2607          	jrne	L3521
3306  030b 7b05          	ld	a,(OFST+1,sp)
3307  030d cd0000        	call	_disp_status_loop_host_Y
3310  0310 2009          	jp	LC011
3311  0312               L3521:
3312                     ; 707 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
3314  0312 a102          	cp	a,#2
3315  0314 2607          	jrne	L1521
3318  0316 7b05          	ld	a,(OFST+1,sp)
3319  0318 cd0000        	call	_disp_status_loop_host_B
3321  031b               LC011:
3322  031b 6b04          	ld	(OFST+0,sp),a
3324  031d               L1521:
3325                     ; 709 			if( i==1 )
3327  031d 7b04          	ld	a,(OFST+0,sp)
3328  031f 4a            	dec	a
3329  0320 2604          	jrne	L1621
3330                     ; 710 				_key_blink = 1;
3332  0322 4c            	inc	a
3333  0323 c7002d        	ld	__key_blink,a
3334  0326               L1621:
3335                     ; 713 			_disp_temp = __sUp==0 ? 1 : 0;
3337  0326 c60000        	ld	a,___sUp
3338  0329 2603          	jrne	L462
3339  032b 4c            	inc	a
3340  032c 2001          	jra	L662
3341  032e               L462:
3342  032e 4f            	clr	a
3343  032f               L662:
3344  032f c70000        	ld	__disp_temp,a
3345                     ; 714 			if( _disp_temp == 0 && _key_blink == 0 )
3347  0332 261c          	jrne	L3621
3349  0334 c6002d        	ld	a,__key_blink
3350  0337 2617          	jrne	L3621
3351                     ; 716 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
3353  0339 c60000        	ld	a,___sUp
3354  033c a101          	cp	a,#1
3355  033e 270c          	jreq	L7621
3357  0340 a102          	cp	a,#2
3358  0342 2708          	jreq	L7621
3360  0344 a105          	cp	a,#5
3361  0346 2704          	jreq	L7621
3363  0348 a108          	cp	a,#8
3364  034a 2604          	jrne	L3621
3365  034c               L7621:
3366                     ; 717 					_disp_temp = 1;
3368  034c 35010000      	mov	__disp_temp,#1
3369  0350               L3621:
3370                     ; 720 			if( key == 1 )
3372  0350 7b05          	ld	a,(OFST+1,sp)
3373  0352 a101          	cp	a,#1
3374  0354 2611          	jrne	L5721
3375                     ; 722 				__sUp = (__sUp+1) % 3;
3377  0356 c60000        	ld	a,___sUp
3378  0359 5f            	clrw	x
3379  035a 97            	ld	xl,a
3380  035b 5c            	incw	x
3381  035c a603          	ld	a,#3
3382  035e cd0000        	call	c_smodx
3384  0361 01            	rrwa	x,a
3385  0362 c70000        	ld	___sUp,a
3386  0365 206c          	jra	L156
3387  0367               L5721:
3388                     ; 733 			else if( key == 2 )
3390  0367 a102          	cp	a,#2
3391  0369 261c          	jrne	L1031
3392                     ; 735 				__sUp = 0xff;
3394  036b 35ff0000      	mov	___sUp,#255
3395                     ; 736 				__sDn = 0;
3397  036f 725f0000      	clr	___sDn
3398                     ; 737 				disp_status_loop_messageDn(__sDn);
3400  0373 4f            	clr	a
3401  0374 cd0000        	call	_disp_status_loop_messageDn
3403                     ; 738 				disp_status_curr_only();
3405  0377 cd0000        	call	_disp_status_curr_only
3407                     ; 739 				lcd_blink_clear();
3409  037a cd0000        	call	_lcd_blink_clear
3411                     ; 740 				_dsCount = 2;
3413  037d 35020000      	mov	__dsCount,#2
3414                     ; 741 				_dsPrev = 0xff;
3416  0381 35ff0000      	mov	__dsPrev,#255
3417                     ; 743 				_key_blink = 0;
3419  0385 201c          	jp	LC012
3420  0387               L1031:
3421                     ; 745 			else if( key == 3 )
3423  0387 a103          	cp	a,#3
3424  0389 265d          	jrne	L5031
3425                     ; 747 				if( __sUp == 0 )
3427  038b c60000        	ld	a,___sUp
3428  038e 2635          	jrne	L7031
3429                     ; 749 					if( _key_blink == 0 )
3431  0390 c6002d        	ld	a,__key_blink
3432  0393 260b          	jrne	L7131
3433  0395 cc0434        	jra	L356
3434  0398               L3131:
3435                     ; 755 							__s = 1;
3437  0398 35010000      	mov	___s,#1
3438  039c               L5131:
3439                     ; 756 						_dsCount = 0;
3441  039c 725f0000      	clr	__dsCount
3442  03a0               L7131:
3443                     ; 769 				disp_status_loop_init();
3446  03a0 cd0000        	call	_disp_status_loop_init
3448                     ; 771 				_key_blink = 0;
3450  03a3               LC012:
3453  03a3 725f002d      	clr	__key_blink
3455  03a7               L7721:
3456                     ; 788 			if( _key_blink == 1 )
3458  03a7 c6002d        	ld	a,__key_blink
3459  03aa 4a            	dec	a
3460  03ab 2703cc089a    	jrne	L3731
3461                     ; 790 				if( _key_sec >= KEY_BLINK_FADE )
3463  03b0 c60000        	ld	a,__key_sec
3464  03b3 a10a          	cp	a,#10
3465  03b5 25f6          	jrult	L3731
3466                     ; 793 					lcd_blink_clear();
3468  03b7 cd0000        	call	_lcd_blink_clear
3470                     ; 794 					_key_blink = 0;
3472  03ba 725f002d      	clr	__key_blink
3473                     ; 795 					_dsCount = 10;
3475  03be 350a0000      	mov	__dsCount,#10
3476  03c2 cc089a        	jra	L3731
3477  03c5               L7031:
3478                     ; 759 				else if( __sUp == 1 )	
3480  03c5 a101          	cp	a,#1
3481                     ; 761 					if( _key_blink != 1 )
3482                     ; 762 						goto SetupEntry2;
3484  03c7 2704          	jreq	LC014
3485                     ; 764 				else if( __sUp == 2 )	
3487  03c9 a102          	cp	a,#2
3488  03cb 26d3          	jrne	L7131
3489                     ; 766 					if( _key_blink != 1 )
3491  03cd               LC014:
3493  03cd c6002d        	ld	a,__key_blink
3494  03d0 4a            	dec	a
3495  03d1 27cd          	jreq	L7131
3496                     ; 767 						goto SetupEntry2;
3497  03d3               L156:
3498                     ; 723 SetupEntry2:				
3498                     ; 724 //				if( __sUp == 0 )		i = bS6;
3498                     ; 725 //				else if( __sUp == 1 )	i = bS7;
3498                     ; 726 //				else					i = bS8;
3498                     ; 727 				lcd_blink_item(i);
3500  03d3 7b04          	ld	a,(OFST+0,sp)
3501  03d5 cd0000        	call	_lcd_blink_item
3503                     ; 728 				disp_status_loop_message(__sUp);
3505  03d8 c60000        	ld	a,___sUp
3506  03db cd0000        	call	_disp_status_loop_message
3508                     ; 729 				_dsPrev = 0xff;
3510  03de 35ff0000      	mov	__dsPrev,#255
3511                     ; 731 				_key_blink = 1;
3513  03e2 3501002d      	mov	__key_blink,#1
3515  03e6 20bf          	jra	L7721
3516  03e8               L5031:
3517                     ; 773 			else if( key == 4 )
3519  03e8 a104          	cp	a,#4
3520  03ea 26bb          	jrne	L7721
3521                     ; 775 				if( _key_blink == 1 )
3523  03ec c6002d        	ld	a,__key_blink
3524  03ef 4a            	dec	a
3525                     ; 778 					disp_status_loop_init();
3527                     ; 779 					_key_blink = 0;
3529  03f0 27ae          	jreq	L7131
3530                     ; 783 					__s = 3;
3532  03f2 35030000      	mov	___s,#3
3533                     ; 784 					_dsCount = 0;
3535  03f6 725f0000      	clr	__dsCount
3536                     ; 785 					_dsPrev = 0xff;
3538  03fa 35ff0000      	mov	__dsPrev,#255
3539  03fe 20a7          	jra	L7721
3540  0400               L5421:
3541                     ; 799 		else if( _dsCount == 2 )
3543  0400 a102          	cp	a,#2
3544  0402 26be          	jrne	L3731
3545                     ; 801 			_disp_temp = 1;
3547  0404 35010000      	mov	__disp_temp,#1
3548                     ; 802 			if( key == 1 )
3550  0408 7b05          	ld	a,(OFST+1,sp)
3551  040a a101          	cp	a,#1
3552  040c 260a          	jrne	L3531
3553                     ; 804 				__sUp = 0;
3555  040e 725f0000      	clr	___sUp
3556                     ; 805 				_dsCount = 0;
3558  0412 725f0000      	clr	__dsCount
3560  0416 202b          	jra	L3631
3561  0418               L3531:
3562                     ; 807 			else if( key == 2 )
3564  0418 a102          	cp	a,#2
3565  041a 2614          	jrne	L7531
3566                     ; 809 				__sDn = __sDn==0 ? 1 : 0;
3568  041c c60000        	ld	a,___sDn
3569  041f 2603          	jrne	L013
3570  0421 4c            	inc	a
3571  0422 2001          	jra	L213
3572  0424               L013:
3573  0424 4f            	clr	a
3574  0425               L213:
3575  0425 c70000        	ld	___sDn,a
3576                     ; 810 				disp_status_loop_messageDn(__sDn);
3578  0428 cd0000        	call	_disp_status_loop_messageDn
3580                     ; 811 				disp_status_curr_only();
3582  042b cd0000        	call	_disp_status_curr_only
3585  042e 2013          	jra	L3631
3586  0430               L7531:
3587                     ; 813 			else if( key == 3 )	{	goto SetupEntry;	}
3589  0430 a103          	cp	a,#3
3590  0432 260f          	jrne	L3631
3592  0434               L356:
3593                     ; 751 SetupEntry:				
3593                     ; 752 						if( uiInfo.cntlMode == 0 )
3595  0434 c60003        	ld	a,_uiInfo+3
3596  0437 2703cc0398    	jrne	L3131
3597                     ; 753 							__s = 4;
3599  043c 35040000      	mov	___s,#4
3601  0440 cc039c        	jra	L5131
3602  0443               L3631:
3603                     ; 814 			else if( key == 4 )
3605                     ; 817 			if( uiInfo.enc != 0 )
3607  0443 c60000        	ld	a,_uiInfo
3608  0446 2603cc089a    	jreq	L3731
3609                     ; 819 				__sUp = 0;
3611  044b 725f0000      	clr	___sUp
3612                     ; 820 				_dsCount = 0;
3614  044f 725f0000      	clr	__dsCount
3615  0453 cc089a        	jra	L3731
3616  0456               L147:
3617                     ; 824 	else if( __s == 1 ) // 설정 난방수 모드
3619  0456 a101          	cp	a,#1
3620  0458 2703cc053a    	jrne	L5731
3621                     ; 827 		if( _dsCount == 0 )
3623  045d c60000        	ld	a,__dsCount
3624  0460 263c          	jrne	L7731
3625                     ; 829 			lcd_clear(0);
3627  0462 cd0000        	call	_lcd_clear
3629                     ; 830 			__sInfo = 1;
3631  0465 35010000      	mov	___sInfo,#1
3632                     ; 831 			lcd_disp_info(__sInfo, 0, 0);
3634  0469 4b00          	push	#0
3635  046b ae0100        	ldw	x,#256
3636  046e cd0000        	call	_lcd_disp_info
3638  0471 84            	pop	a
3639                     ; 832 			UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _boiler_water_heat);
3641  0472 c60000        	ld	a,_debug_br
3642  0475 a5f0          	bcp	a,#240
3643  0477 2603          	jrne	L623
3644  0479 4f            	clr	a
3645  047a 2007          	jra	L033
3646  047c               L623:
3647  047c c60002        	ld	a,__boiler_water_heat
3648  047f cd08ed        	call	LC021
3649  0482 9f            	ld	a,xl
3650  0483               L033:
3651  0483 cd08e0        	call	LC020
3652  0486 2603          	jrne	L433
3653  0488 4f            	clr	a
3654  0489 2007          	jra	L633
3655  048b               L433:
3656  048b c60002        	ld	a,__boiler_water_heat
3657  048e cd08ed        	call	LC021
3658  0491 97            	ld	xl,a
3659  0492               L633:
3660  0492 cd08f9        	call	LC023
3662                     ; 834 			lcd_disp_info_shower(0x08, 0);
3665  0495 ae0800        	ldw	x,#2048
3666  0498 cd0912        	call	LC026
3667                     ; 838 			_pre_boiler_water_heat = _boiler_water_heat;	
3670  049b cc089a        	jra	L3731
3671  049e               L7731:
3672                     ; 840 		else if( _dsCount == 1 )
3674  049e 4a            	dec	a
3675  049f 26fa          	jrne	L3731
3676                     ; 842 			if( key == KEY_ROOM )		{	EXIT_HOST(0);	}
3678  04a1 7b05          	ld	a,(OFST+1,sp)
3679  04a3 a101          	cp	a,#1
3680  04a5 2605          	jrne	L5041
3683  04a7 cd08d0        	call	LC019
3686  04aa 203e          	jra	L7041
3687  04ac               L5041:
3688                     ; 843 			else if( key == KEY_YB )	{	EXIT_HOST(0);}
3690  04ac a102          	cp	a,#2
3691  04ae 2605          	jrne	L1141
3694  04b0 cd08d0        	call	LC019
3697  04b3 2035          	jra	L7041
3698  04b5               L1141:
3699                     ; 844 			else if( key == KEY_NO )	{	EXIT_HOST(0); }
3701  04b5 a104          	cp	a,#4
3702  04b7 2605          	jrne	L5141
3705  04b9 cd08d0        	call	LC019
3708  04bc 202c          	jra	L7041
3709  04be               L5141:
3710                     ; 845 			else if( key == KEY_ONOFF )	{EXIT_HOST(0); __s = 2;}
3712  04be a108          	cp	a,#8
3713  04c0 2616          	jrne	L1241
3716  04c2 cd091e        	call	LC027
3720  04c5 4b00          	push	#0
3721  04c7 c60000        	ld	a,___sInfo
3722  04ca ae0001        	ldw	x,#1
3723  04cd 95            	ld	xh,a
3724  04ce cd0000        	call	_lcd_disp_info
3726  04d1 35020000      	mov	___s,#2
3727  04d5 84            	pop	a
3732  04d6 2012          	jra	L7041
3733  04d8               L1241:
3734                     ; 846 			else if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
3736  04d8 a110          	cp	a,#16
3737  04da 2606          	jrne	L5241
3740  04dc 35400000      	mov	_uiInfo,#64
3742  04e0 2008          	jra	L7041
3743  04e2               L5241:
3744                     ; 847 			else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
3746  04e2 a120          	cp	a,#32
3747  04e4 2604          	jrne	L7041
3750  04e6 35010000      	mov	_uiInfo,#1
3751  04ea               L7041:
3752                     ; 849 			i = _boiler_water_heat;
3754  04ea c60002        	ld	a,__boiler_water_heat
3755  04ed 6b04          	ld	(OFST+0,sp),a
3757                     ; 850 			if( uiInfo.enc != 0 )
3759  04ef 725d0000      	tnz	_uiInfo
3760  04f3 2706          	jreq	L3341
3761                     ; 852 				_boiler_water_heat = ENC_MOVE_0_HEAT(i);
3763  04f5 cd0000        	call	_ENC_MOVE_0_HEAT
3765  04f8 c70002        	ld	__boiler_water_heat,a
3766  04fb               L3341:
3767                     ; 854 			if( _dsPrev != i )
3769  04fb c60000        	ld	a,__dsPrev
3770  04fe 1104          	cp	a,(OFST+0,sp)
3771  0500 2728          	jreq	L5341
3772                     ; 857 				_dsPrev = i;
3774  0502 7b04          	ld	a,(OFST+0,sp)
3775  0504 c70000        	ld	__dsPrev,a
3776                     ; 858 				UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _dsPrev);
3778  0507 c60000        	ld	a,_debug_br
3779  050a a5f0          	bcp	a,#240
3780  050c 2603          	jrne	L663
3781  050e 4f            	clr	a
3782  050f 2007          	jra	L073
3783  0511               L663:
3784  0511 c60000        	ld	a,__dsPrev
3785  0514 cd08ed        	call	LC021
3786  0517 9f            	ld	a,xl
3787  0518               L073:
3788  0518 cd08e0        	call	LC020
3789  051b 2603          	jrne	L473
3790  051d 4f            	clr	a
3791  051e 2007          	jra	L673
3792  0520               L473:
3793  0520 c60000        	ld	a,__dsPrev
3794  0523 cd08ed        	call	LC021
3795  0526 97            	ld	xl,a
3796  0527               L673:
3797  0527 cd08f9        	call	LC023
3800  052a               L5341:
3801                     ; 861 			if( _key_min == KEY_BOILER_FADE )
3803  052a c60000        	ld	a,__key_min
3804  052d a10a          	cp	a,#10
3805  052f 2703cc089a    	jrne	L3731
3806                     ; 864 				EXIT_HOST(0);
3808  0534 cd08d0        	call	LC019
3810  0537 cc089a        	jra	L3731
3811  053a               L5731:
3812                     ; 868 	else if( __s == 2 ) // 설정 온수 모드
3814  053a a102          	cp	a,#2
3815  053c 2703cc062b    	jrne	L3441
3816                     ; 871 		if( _dsCount == 0 )
3818  0541 c60000        	ld	a,__dsCount
3819  0544 2644          	jrne	L5441
3820                     ; 873 			lcd_clear(0);
3822  0546 cd0000        	call	_lcd_clear
3824                     ; 874 			__sInfo = 2;
3826  0549 35020000      	mov	___sInfo,#2
3827                     ; 875 			lcd_disp_info(__sInfo, 0, 0);
3829  054d 4b00          	push	#0
3830  054f ae0200        	ldw	x,#512
3831  0552 cd0000        	call	_lcd_disp_info
3833  0555 84            	pop	a
3834                     ; 876 			UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _boiler_water_shower);
3836  0556 c60000        	ld	a,_debug_br
3837  0559 a5f0          	bcp	a,#240
3838  055b 2603          	jrne	L214
3839  055d 4f            	clr	a
3840  055e 2007          	jra	L414
3841  0560               L214:
3842  0560 c60001        	ld	a,__boiler_water_shower
3843  0563 cd08ed        	call	LC021
3844  0566 9f            	ld	a,xl
3845  0567               L414:
3846  0567 cd08e0        	call	LC020
3847  056a 2603          	jrne	L024
3848  056c 4f            	clr	a
3849  056d 2007          	jra	L224
3850  056f               L024:
3851  056f c60001        	ld	a,__boiler_water_shower
3852  0572 cd08ed        	call	LC021
3853  0575 97            	ld	xl,a
3854  0576               L224:
3855  0576 cd08f9        	call	LC023
3857                     ; 878 			lcd_disp_info_shower(0x80, 0);
3860  0579 ae8000        	ldw	x,#32768
3861  057c cd0912        	call	LC026
3862                     ; 882 			__boiler_shower[4] = 0;
3864  057f 725f000f      	clr	___boiler_shower+4
3865                     ; 883 			__boiler_shower[5] = 1;
3867  0583 35010010      	mov	___boiler_shower+5,#1
3868                     ; 885 			_pre_boiler_water_shower = _boiler_water_shower;
3871  0587 cc089a        	jra	L3731
3872  058a               L5441:
3873                     ; 887 		else if( _dsCount == 1 )
3875  058a 4a            	dec	a
3876  058b 26fa          	jrne	L3731
3877                     ; 889 			if( key == KEY_ROOM )		{	goto RETURN_ENTRY;	}
3879  058d 7b05          	ld	a,(OFST+1,sp)
3880  058f a101          	cp	a,#1
3881  0591 276c          	jreq	L556
3884                     ; 890 			else if( key == KEY_YB )	{	goto RETURN_ENTRY;	}
3886  0593 a102          	cp	a,#2
3887  0595 2768          	jreq	L556
3890                     ; 891 			else if( key == KEY_NO )	{goto RETURN_ENTRY;}
3892  0597 a104          	cp	a,#4
3893  0599 2764          	jreq	L556
3896                     ; 892 			else if( key == KEY_ONOFF )	{	//file_update2(0);
3898  059b a108          	cp	a,#8
3899  059d 2760          	jreq	L556
3900                     ; 893 																		goto RETURN_ENTRY;
3902                     ; 899 			else if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
3904  059f a110          	cp	a,#16
3905  05a1 2606          	jrne	L3741
3908  05a3 35400000      	mov	_uiInfo,#64
3910  05a7 2008          	jra	L5541
3911  05a9               L3741:
3912                     ; 900 			else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
3914  05a9 a120          	cp	a,#32
3915  05ab 2604          	jrne	L5541
3918  05ad 35010000      	mov	_uiInfo,#1
3919  05b1               L5541:
3920                     ; 902 			i = _boiler_water_shower;
3922  05b1 c60001        	ld	a,__boiler_water_shower
3923  05b4 6b04          	ld	(OFST+0,sp),a
3925                     ; 903 			if( uiInfo.enc != 0 )
3927  05b6 725d0000      	tnz	_uiInfo
3928  05ba 2706          	jreq	L1051
3929                     ; 905 				_boiler_water_shower = ENC_MOVE_0_SHOWER(i);
3931  05bc cd0000        	call	_ENC_MOVE_0_SHOWER
3933  05bf c70001        	ld	__boiler_water_shower,a
3934  05c2               L1051:
3935                     ; 907 			if( _dsPrev != i )
3937  05c2 c60000        	ld	a,__dsPrev
3938  05c5 1104          	cp	a,(OFST+0,sp)
3939  05c7 2728          	jreq	L3051
3940                     ; 910 				_dsPrev = i;
3942  05c9 7b04          	ld	a,(OFST+0,sp)
3943  05cb c70000        	ld	__dsPrev,a
3944                     ; 911 				UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _dsPrev);
3946  05ce c60000        	ld	a,_debug_br
3947  05d1 a5f0          	bcp	a,#240
3948  05d3 2603          	jrne	L234
3949  05d5 4f            	clr	a
3950  05d6 2007          	jra	L434
3951  05d8               L234:
3952  05d8 c60000        	ld	a,__dsPrev
3953  05db cd08ed        	call	LC021
3954  05de 9f            	ld	a,xl
3955  05df               L434:
3956  05df cd08e0        	call	LC020
3957  05e2 2603          	jrne	L044
3958  05e4 4f            	clr	a
3959  05e5 2007          	jra	L244
3960  05e7               L044:
3961  05e7 c60000        	ld	a,__dsPrev
3962  05ea cd08ed        	call	LC021
3963  05ed 97            	ld	xl,a
3964  05ee               L244:
3965  05ee cd08f9        	call	LC023
3968  05f1               L3051:
3969                     ; 914 			if (__boiler_shower[5] == 0x80 ) {
3971  05f1 c60010        	ld	a,___boiler_shower+5
3972  05f4 a180          	cp	a,#128
3973  05f6 2707          	jreq	L556
3974                     ; 915 				goto RETURN_ENTRY;
3976                     ; 918 			if( _key_min == KEY_BOILER_FADE )
3978  05f8 c60000        	ld	a,__key_min
3979  05fb a10a          	cp	a,#10
3980  05fd 2688          	jrne	L3731
3981  05ff               L556:
3982                     ; 920 RETURN_ENTRY:
3982                     ; 921 
3982                     ; 922 				if (_pre_boiler_water_heat != _boiler_water_heat) {
3984  05ff 7b03          	ld	a,(OFST-1,sp)
3985  0601 c10002        	cp	a,__boiler_water_heat
3986  0604 270a          	jreq	L1151
3987                     ; 923 					FW_B_HEAT(_boiler_water_heat);
3989  0606 c60002        	ld	a,__boiler_water_heat
3990  0609 ae2600        	ldw	x,#9728
3991  060c 97            	ld	xl,a
3992  060d cd0000        	call	_file_write
3994  0610               L1151:
3995                     ; 926 				if (_pre_boiler_water_shower != _boiler_water_shower) {
3997  0610 7b02          	ld	a,(OFST-2,sp)
3998  0612 c10001        	cp	a,__boiler_water_shower
3999  0615 270a          	jreq	L3151
4000                     ; 927 					FW_B_SHOWER(_boiler_water_shower);
4002  0617 c60001        	ld	a,__boiler_water_shower
4003  061a ae2500        	ldw	x,#9472
4004  061d 97            	ld	xl,a
4005  061e cd0000        	call	_file_write
4007  0621               L3151:
4008                     ; 931 				__boiler_shower[5] = 0;
4010  0621 725f0010      	clr	___boiler_shower+5
4011                     ; 932 				EXIT_HOST(0);
4013  0625 cd08d0        	call	LC019
4015  0628 cc089a        	jra	L3731
4016  062b               L3441:
4017                     ; 936 	else if( __s == 4 )
4019  062b a104          	cp	a,#4
4020  062d 27f9          	jreq	L3731
4022                     ; 950 	} else if (__s == 5){
4024  062f a105          	cp	a,#5
4025  0631 2658          	jrne	L3251
4026                     ; 951 		__sUp = 0;
4028  0633 725f0000      	clr	___sUp
4029                     ; 953 		switch (_disp_mode) {
4031  0637 c60005        	ld	a,__disp_mode
4033                     ; 958 		case 0x10:	__sUp = 2;	break;
4034  063a 4a            	dec	a
4035  063b 2711          	jreq	L756
4036  063d 4a            	dec	a
4037  063e 2713          	jreq	L166
4038  0640 a002          	sub	a,#2
4039  0642 2715          	jreq	L366
4040  0644 a004          	sub	a,#4
4041  0646 2717          	jreq	L566
4042  0648 a008          	sub	a,#8
4043  064a 2719          	jreq	L766
4044  064c 201b          	jra	L7251
4045  064e               L756:
4046                     ; 954 		case 0x01:	__sUp = 0;	break;
4048  064e c70000        	ld	___sUp,a
4051  0651 2016          	jra	L7251
4052  0653               L166:
4053                     ; 955 		case 0x02:	__sUp = 3;	break;
4055  0653 35030000      	mov	___sUp,#3
4058  0657 2010          	jra	L7251
4059  0659               L366:
4060                     ; 956 		case 0x04:	__sUp = 4;	break;
4062  0659 35040000      	mov	___sUp,#4
4065  065d 200a          	jra	L7251
4066  065f               L566:
4067                     ; 957 		case 0x08:	__sUp = 1;	break;
4069  065f 35010000      	mov	___sUp,#1
4072  0663 2004          	jra	L7251
4073  0665               L766:
4074                     ; 958 		case 0x10:	__sUp = 2;	break;
4076  0665 35020000      	mov	___sUp,#2
4079  0669               L7251:
4080                     ; 960 		__sDn = 0xff;
4082  0669 35ff0000      	mov	___sDn,#255
4083                     ; 961 		disp_status_loop_init();
4085  066d cd0000        	call	_disp_status_loop_init
4087                     ; 962 		_dsCount = 1;
4089  0670 35010000      	mov	__dsCount,#1
4090                     ; 963 		__s = 0;
4092  0674 725f0000      	clr	___s
4093                     ; 964 		_key_blink = 1;
4095  0678 3501002d      	mov	__key_blink,#1
4096                     ; 965 		_key_sec = _key_min = _key_hour = 0;
4098  067c 725f0000      	clr	__key_hour
4099  0680 725f0000      	clr	__key_min
4100  0684 725f0000      	clr	__key_sec
4102  0688 cc089a        	jra	L3731
4103  068b               L3251:
4104                     ; 967 	else if( __s == 101 )// remote
4106  068b a165          	cp	a,#101
4107  068d 26f9          	jrne	L3731
4108                     ; 969 		if( _dsCount == 0 )
4110  068f c60000        	ld	a,__dsCount
4111  0692 2664          	jrne	L5351
4112                     ; 971 			lcd_clear(0);
4114  0694 cd0000        	call	_lcd_clear
4116                     ; 972 			_remote = 1;
4118  0697 35010004      	mov	__remote,#1
4119                     ; 974 			j = uiInfo.cnt + uiInfo.cnt_sub;
4121  069b c60005        	ld	a,_uiInfo+5
4122  069e cb0006        	add	a,_uiInfo+6
4123  06a1 6b04          	ld	(OFST+0,sp),a
4125                     ; 975 			__sRoom = (uiInfo.id_rc + 1) % j;
4127  06a3 c60001        	ld	a,_uiInfo+1
4129  06a6               L176:
4130  06a6 5f            	clrw	x
4131  06a7 97            	ld	xl,a
4132  06a8 5c            	incw	x
4133  06a9 7b04          	ld	a,(OFST+0,sp)
4134  06ab 905f          	clrw	y
4135  06ad 9097          	ld	yl,a
4136  06af cd0000        	call	c_idiv
4137  06b2 93            	ldw	x,y
4138  06b3 cd0905        	call	LC025
4139  06b6 2605          	jrne	L7351
4140                     ; 979 				__sRoom = (__sRoom + 1) % j;
4142  06b8 c60000        	ld	a,___sRoom
4144                     ; 980 				goto _OneMore2;
4146  06bb 20e9          	jra	L176
4147  06bd               L7351:
4148                     ; 983 			j = __sRoom;
4150                     ; 984 _RemoteEntry:
4150                     ; 985 			if( __sRoom == uiInfo.id_rc )
4152  06bd c60000        	ld	a,___sRoom
4153  06c0 c10001        	cp	a,_uiInfo+1
4154  06c3 2612          	jrne	L1451
4155  06c5               L576:
4156                     ; 987 _RemoteExit:				
4156                     ; 988 				_remote = 0;
4158  06c5 725f0004      	clr	__remote
4159                     ; 989 				__s = 0;
4161  06c9 725f0000      	clr	___s
4162                     ; 990 				_dsCount = 0;
4164  06cd 725f0000      	clr	__dsCount
4165                     ; 991 				lcd_blink_clear();
4167  06d1 cd0000        	call	_lcd_blink_clear
4169                     ; 992 				return;
4171  06d4 cc08cd        	jra	L1102
4172  06d7               L1451:
4173                     ; 994 			lcd_clear_rid();
4175  06d7 cd0000        	call	_lcd_clear_rid
4177                     ; 995 			lcd_blink_itemRoom(__sRoom, 1);
4179  06da c60000        	ld	a,___sRoom
4180  06dd ae0001        	ldw	x,#1
4181  06e0 95            	ld	xh,a
4182  06e1 cd0000        	call	_lcd_blink_itemRoom
4184                     ; 996 			disp_status_remote_message(REMOTE_MODE); //모드 변경
4186  06e4 c60000        	ld	a,___sRoom
4187  06e7 cd08f3        	call	LC022
4188  06ea cd0000        	call	_disp_status_remote_message
4190                     ; 997 			_dsCount = 1;
4192  06ed 35010000      	mov	__dsCount,#1
4193                     ; 998 			_subRemote = 1;
4195  06f1 35010000      	mov	__subRemote,#1
4197  06f5 cc089a        	jra	L3731
4198  06f8               L5351:
4199                     ; 1000 		else if( _dsCount == 1 )//remote 첫화면
4201  06f8 a101          	cp	a,#1
4202  06fa 2703cc0884    	jrne	L5451
4203                     ; 1002 			if ( key == KEY_PLUS) 
4205  06ff 7b05          	ld	a,(OFST+1,sp)
4206  0701 a110          	cp	a,#16
4207  0703 2606          	jrne	L7451
4208                     ; 1004 				uiInfo.enc = ENC_UP;
4210  0705 35400000      	mov	_uiInfo,#64
4212  0709 2008          	jra	L1551
4213  070b               L7451:
4214                     ; 1006 			else if ( key == KEY_MINUS) 
4216  070b a120          	cp	a,#32
4217  070d 2604          	jrne	L1551
4218                     ; 1008 				uiInfo.enc = ENC_DN;
4220  070f 35010000      	mov	_uiInfo,#1
4221  0713               L1551:
4222                     ; 1011 			j = __sRoom;
4224  0713 c60000        	ld	a,___sRoom
4225  0716 6b04          	ld	(OFST+0,sp),a
4227                     ; 1012 			if( REMOTE_MODEi(j) == 0x01 )		{	_subRemote = 1; disp_status_loop_remote_N(j);	}
4229  0718 cd08f3        	call	LC022
4230  071b 4a            	dec	a
4231  071c 260b          	jrne	L5551
4234  071e 35010000      	mov	__subRemote,#1
4237  0722 7b04          	ld	a,(OFST+0,sp)
4238  0724 cd0000        	call	_disp_status_loop_remote_N
4241  0727 204e          	jra	L7551
4242  0729               L5551:
4243                     ; 1013 			else if( REMOTE_MODEi(j) == 0x08 )	{	_subRemote = 8;	disp_status_loop_remote_Y(j);	}
4245  0729 7b04          	ld	a,(OFST+0,sp)
4246  072b cd08f3        	call	LC022
4247  072e a108          	cp	a,#8
4248  0730 260b          	jrne	L1651
4251  0732 35080000      	mov	__subRemote,#8
4254  0736 7b04          	ld	a,(OFST+0,sp)
4255  0738 cd0000        	call	_disp_status_loop_remote_Y
4258  073b 203a          	jra	L7551
4259  073d               L1651:
4260                     ; 1014 			else if( REMOTE_MODEi(j) == 0x10 )	{	_subRemote = 10; disp_status_loop_remote_B(j);	}
4262  073d 7b04          	ld	a,(OFST+0,sp)
4263  073f cd08f3        	call	LC022
4264  0742 a110          	cp	a,#16
4265  0744 260b          	jrne	L5651
4268  0746 350a0000      	mov	__subRemote,#10
4271  074a 7b04          	ld	a,(OFST+0,sp)
4272  074c cd0000        	call	_disp_status_loop_remote_B
4275  074f 2026          	jra	L7551
4276  0751               L5651:
4277                     ; 1015 			else if( REMOTE_MODEi(j) == 0x04 )	{	_subRemote = 4; disp_status_loop_remote_J(j);	}
4279  0751 7b04          	ld	a,(OFST+0,sp)
4280  0753 cd08f3        	call	LC022
4281  0756 a104          	cp	a,#4
4282  0758 260b          	jrne	L1751
4285  075a 35040000      	mov	__subRemote,#4
4288  075e 7b04          	ld	a,(OFST+0,sp)
4289  0760 cd0000        	call	_disp_status_loop_remote_J
4292  0763 2012          	jra	L7551
4293  0765               L1751:
4294                     ; 1016 			else if( REMOTE_MODEi(j) == 0x02 )	{	_subRemote = 2; disp_status_loop_remote_O(j);	}
4296  0765 7b04          	ld	a,(OFST+0,sp)
4297  0767 cd08f3        	call	LC022
4298  076a a102          	cp	a,#2
4299  076c 2609          	jrne	L7551
4302  076e 35020000      	mov	__subRemote,#2
4305  0772 7b04          	ld	a,(OFST+0,sp)
4306  0774 cd0000        	call	_disp_status_loop_remote_O
4308  0777               L7551:
4309                     ; 1018 			if (_subRemote == 1) // remote 난방  
4311  0777 c60000        	ld	a,__subRemote
4312  077a a101          	cp	a,#1
4313  077c 2633          	jrne	L7751
4314                     ; 1020 				if( key == KEY_ROOM )	
4316  077e 7b05          	ld	a,(OFST+1,sp)
4317  0780 a101          	cp	a,#1
4318                     ; 1022 					_dsCount = 2;
4320  0782 2737          	jreq	LC017
4321                     ; 1024 				else if( key == KEY_YB )
4323  0784 a102          	cp	a,#2
4324  0786 2609          	jrne	L5061
4325                     ; 1027 					REMOTE_MODEi(j) = 0x08;
4327  0788 7b04          	ld	a,(OFST+0,sp)
4328  078a 5f            	clrw	x
4329  078b 97            	ld	xl,a
4330  078c a608          	ld	a,#8
4332  078e cc0877        	jp	LC015
4333  0791               L5061:
4334                     ; 1030 				else if( key == KEY_NO )
4336  0791 a104          	cp	a,#4
4337  0793 2612          	jrne	L1161
4338                     ; 1033 					uiInfo.tempSetup[j] = 20;
4340  0795 7b04          	ld	a,(OFST+0,sp)
4341  0797 5f            	clrw	x
4342  0798 97            	ld	xl,a
4343  0799 a614          	ld	a,#20
4344  079b d7003d        	ld	(_uiInfo+61,x),a
4345                     ; 1034 					REMOTE_MODEi(j) = 0x02;
4347  079e 5f            	clrw	x
4348  079f 7b04          	ld	a,(OFST+0,sp)
4349  07a1 97            	ld	xl,a
4350  07a2 a602          	ld	a,#2
4352  07a4 cc0877        	jp	LC015
4353  07a7               L1161:
4354                     ; 1037 				else if( key == KEY_ONOFF )	
4356  07a7 a108          	cp	a,#8
4357  07a9 2703cc087a    	jrne	L5671
4358                     ; 1039 					_dsPrev = 0xff;
4359                     ; 1040 					REMOTE_MODEi(j) = 0x04;
4361  07ae cc086d        	jp	LC016
4362                     ; 1050 				else if ( key == KEY_PLUS) {}
4365                     ; 1051 				else if ( key == KEY_MINUS) {}
4367  07b1               L7751:
4368                     ; 1053 			else if (_subRemote == 8) // remote 예약
4370  07b1 a108          	cp	a,#8
4371  07b3 2631          	jrne	L1361
4372                     ; 1055 				if( key == KEY_ROOM )	
4374  07b5 7b05          	ld	a,(OFST+1,sp)
4375  07b7 a101          	cp	a,#1
4376  07b9 2607          	jrne	L3361
4377                     ; 1057 					_dsCount = 2;
4379  07bb               LC017:
4384  07bb 35020000      	mov	__dsCount,#2
4386  07bf cc087a        	jra	L5671
4387  07c2               L3361:
4388                     ; 1059 				else if( key == KEY_YB )
4390  07c2 a102          	cp	a,#2
4391  07c4 260d          	jrne	L7361
4392                     ; 1061 					_dsPrev = 0xff;
4394  07c6 35ff0000      	mov	__dsPrev,#255
4395                     ; 1063 					REMOTE_MODEi(j) = 0x10;
4397  07ca 5f            	clrw	x
4398  07cb 7b04          	ld	a,(OFST+0,sp)
4399  07cd 97            	ld	xl,a
4400  07ce a610          	ld	a,#16
4402  07d0 cc0877        	jp	LC015
4403  07d3               L7361:
4404                     ; 1066 				else if( key == KEY_NO )
4406  07d3 a104          	cp	a,#4
4407  07d5 2608          	jrne	L3461
4408                     ; 1069 					REMOTE_MODEi(j) = 0x01;
4410  07d7 7b04          	ld	a,(OFST+0,sp)
4411  07d9 cd0900        	call	LC024
4413  07dc cc0877        	jp	LC015
4414  07df               L3461:
4415                     ; 1072 				else if( key == KEY_ONOFF )	
4417  07df a108          	cp	a,#8
4418  07e1 26dc          	jrne	L5671
4419                     ; 1074 					_dsPrev = 0xff;
4420                     ; 1075 					REMOTE_MODEi(j) = 0x04;
4422  07e3 cc086d        	jp	LC016
4423                     ; 1077 				else if ( key == KEY_PLUS) {}
4426                     ; 1078 				else if ( key == KEY_MINUS) {}
4428  07e6               L1361:
4429                     ; 1080 			else if (_subRemote == 10) // remote 반복
4431  07e6 a10a          	cp	a,#10
4432  07e8 2627          	jrne	L3661
4433                     ; 1082 				if( key == KEY_ROOM )	
4435  07ea 7b05          	ld	a,(OFST+1,sp)
4436  07ec a101          	cp	a,#1
4437                     ; 1084 					_dsCount = 2;
4439  07ee 27cb          	jreq	LC017
4440                     ; 1086 				else if( key == KEY_YB )
4442  07f0 a102          	cp	a,#2
4443  07f2 260c          	jrne	L1761
4444                     ; 1088 					_dsPrev = 0xff;
4446  07f4 35ff0000      	mov	__dsPrev,#255
4447                     ; 1090 					REMOTE_MODEi(j) = 0x08;
4449  07f8 5f            	clrw	x
4450  07f9 7b04          	ld	a,(OFST+0,sp)
4451  07fb 97            	ld	xl,a
4452  07fc a608          	ld	a,#8
4454  07fe 2077          	jp	LC015
4455  0800               L1761:
4456                     ; 1093 				else if( key == KEY_NO )
4458  0800 a104          	cp	a,#4
4459  0802 2607          	jrne	L5761
4460                     ; 1096 					REMOTE_MODEi(j) = 0x01;
4462  0804 7b04          	ld	a,(OFST+0,sp)
4463  0806 cd0900        	call	LC024
4465  0809 206c          	jp	LC015
4466  080b               L5761:
4467                     ; 1099 				else if( key == KEY_ONOFF )	
4469  080b a108          	cp	a,#8
4470  080d 266b          	jrne	L5671
4471                     ; 1101 					_dsPrev = 0xff;
4472                     ; 1102 					REMOTE_MODEi(j) = 0x04;
4474  080f 205c          	jp	LC016
4475                     ; 1104 				else if ( key == KEY_PLUS) {}
4478                     ; 1105 				else if ( key == KEY_MINUS) {}
4480  0811               L3661:
4481                     ; 1107 			else if (_subRemote == 4) // remote 정지
4483  0811 a104          	cp	a,#4
4484  0813 262c          	jrne	L5171
4485                     ; 1109 				if( key == KEY_ROOM )	
4487  0815 7b05          	ld	a,(OFST+1,sp)
4488  0817 a101          	cp	a,#1
4489                     ; 1111 					_dsCount = 2;
4491  0819 27a0          	jreq	LC017
4492                     ; 1113 				else if( key == KEY_YB )
4494  081b a102          	cp	a,#2
4495  081d 260c          	jrne	L3271
4496                     ; 1115 					_dsPrev = 0xff;
4498  081f 35ff0000      	mov	__dsPrev,#255
4499                     ; 1117 					REMOTE_MODEi(j) = 0x08;
4501  0823 5f            	clrw	x
4502  0824 7b04          	ld	a,(OFST+0,sp)
4503  0826 97            	ld	xl,a
4504  0827 a608          	ld	a,#8
4506  0829 204c          	jp	LC015
4507  082b               L3271:
4508                     ; 1120 				else if( key == KEY_NO )
4510  082b a104          	cp	a,#4
4511  082d 2607          	jrne	L7271
4512                     ; 1123 					REMOTE_MODEi(j) = 0x01;
4514  082f 7b04          	ld	a,(OFST+0,sp)
4515  0831 cd0900        	call	LC024
4517  0834 2041          	jp	LC015
4518  0836               L7271:
4519                     ; 1126 				else if( key == KEY_ONOFF )	
4521  0836 a108          	cp	a,#8
4522  0838 2640          	jrne	L5671
4523                     ; 1128 					REMOTE_MODEi(j) = 0x01;
4525  083a 7b04          	ld	a,(OFST+0,sp)
4526  083c cd0900        	call	LC024
4528  083f 2036          	jp	LC015
4529                     ; 1130 				else if ( key == KEY_PLUS) {}
4532                     ; 1131 				else if ( key == KEY_MINUS) {}
4534  0841               L5171:
4535                     ; 1133 			else if (_subRemote == 2) // remote 외출
4537  0841 a102          	cp	a,#2
4538  0843 2635          	jrne	L5671
4539                     ; 1135 				if( key == KEY_ROOM )	
4541  0845 7b05          	ld	a,(OFST+1,sp)
4542  0847 a101          	cp	a,#1
4543                     ; 1137 					_dsCount = 2;
4545  0849 2603cc07bb    	jreq	LC017
4546                     ; 1139 				else if( key == KEY_YB )
4548  084e a102          	cp	a,#2
4549  0850 260c          	jrne	L5571
4550                     ; 1142 					_dsPrev = 0xff;
4552  0852 35ff0000      	mov	__dsPrev,#255
4553                     ; 1143 					REMOTE_MODEi(j) = 0x08;
4555  0856 5f            	clrw	x
4556  0857 7b04          	ld	a,(OFST+0,sp)
4557  0859 97            	ld	xl,a
4558  085a a608          	ld	a,#8
4560  085c 2019          	jp	LC015
4561  085e               L5571:
4562                     ; 1146 				else if( key == KEY_NO )
4564  085e a104          	cp	a,#4
4565  0860 2607          	jrne	L1671
4566                     ; 1149 					REMOTE_MODEi(j) = 0x01;
4568  0862 7b04          	ld	a,(OFST+0,sp)
4569  0864 cd0900        	call	LC024
4571  0867 200e          	jp	LC015
4572  0869               L1671:
4573                     ; 1152 				else if( key == KEY_ONOFF )	
4575  0869 a108          	cp	a,#8
4576  086b 260d          	jrne	L5671
4577                     ; 1154 					_dsPrev = 0xff;
4579                     ; 1155 					REMOTE_MODEi(j) = 0x04;
4581  086d               LC016:
4585  086d 35ff0000      	mov	__dsPrev,#255
4589  0871 5f            	clrw	x
4590  0872 7b04          	ld	a,(OFST+0,sp)
4591  0874 97            	ld	xl,a
4592  0875 a604          	ld	a,#4
4593  0877               LC015:
4594  0877 d70045        	ld	(_uiInfo+69,x),a
4596  087a               L5671:
4597                     ; 1157 				else if ( key == KEY_PLUS) {}
4600                     ; 1158 				else if ( key == KEY_MINUS) {}
4602                     ; 1161 			if( _key_min == KEY_BLINK_FADE )
4604  087a c60000        	ld	a,__key_min
4605  087d a10a          	cp	a,#10
4606  087f 2619          	jrne	L3731
4607                     ; 1163 				goto _RemoteExit;
4609  0881 cc06c5        	jra	L576
4610  0884               L5451:
4611                     ; 1166 		else if (_dsCount == 2) 
4613  0884 a102          	cp	a,#2
4614  0886 2612          	jrne	L3731
4615  0888               L776:
4616                     ; 1168 _OneMore:			
4616                     ; 1169 			j = 8;
4618                     ; 1170 			__sRoom = (__sRoom + 1) % j;
4620  0888 c60000        	ld	a,___sRoom
4621  088b 5f            	clrw	x
4622  088c 97            	ld	xl,a
4623  088d 5c            	incw	x
4624  088e a608          	ld	a,#8
4625  0890 cd0000        	call	c_smodx
4627  0893 ad70          	call	LC025
4628  0895 27f1          	jreq	L776
4629                     ; 1173 				goto _OneMore;
4631                     ; 1175 			if( __sRoom != 0 ) {
4633                     ; 1177 				j = __sRoom - 1;
4635  0897 cc06bd        	jra	L7351
4636  089a               L3731:
4637                     ; 1202 	if (packet_changed == 1) {
4639  089a c60000        	ld	a,_packet_changed
4640  089d 4a            	dec	a
4641  089e 262d          	jrne	L1102
4642                     ; 1203 		__s = 0;
4644  08a0 c70000        	ld	___s,a
4645                     ; 1204 		_dsCount = 10;
4647  08a3 350a0000      	mov	__dsCount,#10
4648                     ; 1205 		switch (_disp_mode2) {
4650  08a7 c60006        	ld	a,__disp_mode2
4652                     ; 1209 			case 0x40:	__sUp = 5;	break;
4653  08aa 4a            	dec	a
4654  08ab 270d          	jreq	L107
4655  08ad 4a            	dec	a
4656  08ae 270f          	jreq	L307
4657  08b0 a002          	sub	a,#2
4658  08b2 2711          	jreq	L507
4659  08b4 a03c          	sub	a,#60
4660  08b6 270d          	jreq	L507
4661  08b8 200f          	jra	L5102
4662  08ba               L107:
4663                     ; 1206 			case 0x01:	_dsCount = 0;	break;
4665  08ba c70000        	ld	__dsCount,a
4668  08bd 200a          	jra	L5102
4669  08bf               L307:
4670                     ; 1207 			case 0x02:  __sUp = 16;  break;
4672  08bf 35100000      	mov	___sUp,#16
4675  08c3 2004          	jra	L5102
4676  08c5               L507:
4677                     ; 1208 			case 0x04:  __sUp = 5;	break;
4680                     ; 1209 			case 0x40:	__sUp = 5;	break;
4683  08c5 35050000      	mov	___sUp,#5
4686  08c9               L5102:
4687                     ; 1211 		packet_changed = 0;
4689  08c9 725f0000      	clr	_packet_changed
4690  08cd               L1102:
4691                     ; 1213 }
4694  08cd 5b05          	addw	sp,#5
4695  08cf 81            	ret	
4696  08d0               LC019:
4697  08d0 ad4c          	call	LC027
4699                     ; 842 			if( key == KEY_ROOM )		{	EXIT_HOST(0);	}
4701  08d2 4b00          	push	#0
4702  08d4 c60000        	ld	a,___sInfo
4703  08d7 ae0001        	ldw	x,#1
4704  08da 95            	ld	xh,a
4705  08db cd0000        	call	_lcd_disp_info
4707  08de 84            	pop	a
4708  08df 81            	ret	
4709  08e0               LC020:
4710  08e0 ae0200        	ldw	x,#512
4711  08e3 97            	ld	xl,a
4712  08e4 cd0000        	call	_lcd_disp_n
4714                     ; 911 				UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _dsPrev);
4716  08e7 c60000        	ld	a,_debug_br
4717  08ea a5f0          	bcp	a,#240
4718  08ec 81            	ret	
4719  08ed               LC021:
4720  08ed 5f            	clrw	x
4721  08ee 97            	ld	xl,a
4722  08ef a60a          	ld	a,#10
4723  08f1 62            	div	x,a
4724  08f2 81            	ret	
4725  08f3               LC022:
4726  08f3 5f            	clrw	x
4727  08f4 97            	ld	xl,a
4728  08f5 d60045        	ld	a,(_uiInfo+69,x)
4729  08f8 81            	ret	
4730  08f9               LC023:
4731  08f9 ae0300        	ldw	x,#768
4732  08fc 97            	ld	xl,a
4733  08fd cc0000        	jp	_lcd_disp_n
4734  0900               LC024:
4735  0900 5f            	clrw	x
4736  0901 97            	ld	xl,a
4737  0902 a601          	ld	a,#1
4738  0904 81            	ret	
4739  0905               LC025:
4740  0905 01            	rrwa	x,a
4741  0906 c70000        	ld	___sRoom,a
4742                     ; 976 _OneMore2:			
4742                     ; 977 			if( packet_buf[__sRoom] == ui_timeout )
4744  0909 5f            	clrw	x
4745  090a 97            	ld	xl,a
4746  090b d60000        	ld	a,(_packet_buf,x)
4747  090e c10000        	cp	a,_ui_timeout
4748  0911 81            	ret	
4749  0912               LC026:
4750  0912 cd0000        	call	_lcd_disp_info_shower
4752                     ; 879 			_dsCount = 1;
4754  0915 35010000      	mov	__dsCount,#1
4755                     ; 880 			_dsPrev = 0xff;
4757  0919 35ff0000      	mov	__dsPrev,#255
4758  091d 81            	ret	
4759  091e               LC027:
4760  091e 725f0000      	clr	___s
4761                     ; 842 			if( key == KEY_ROOM )		{	EXIT_HOST(0);	}
4763  0922 725f0000      	clr	__dsCount
4766  0926 35ff0000      	mov	__dsPrev,#255
4769  092a cc0000        	jp	_lcd_blink_clear
4892                     	switch	.bss
4893  0000               __key_time_event:
4894  0000 000000        	ds.b	3
4895                     	xdef	__key_time_event
4896                     	xref	_func_rc_setting
4897                     	xdef	_disp_rid_info
4898                     	xref	_ui_timeout
4899                     	xref	_packet_buf
4900                     	xdef	_disp_status_loop_host_Out_Long
4901                     	xdef	_disp_status_loop_host_Out
4902                     	xdef	_disp_status_loop_host_Off
4903                     	xdef	_disp_status_loop_remote_B
4904                     	xdef	_disp_status_loop_remote_O
4905                     	xdef	_disp_status_loop_remote_J
4906                     	xdef	_disp_status_loop_remote_Y
4907                     	xdef	_disp_status_loop_remote_N
4908                     	xdef	_disp_status_remote_message
4909                     	xdef	_ENC_MOVE_0_HEAT
4910                     	xdef	_ENC_MOVE_0_SHOWER
4911                     	xdef	_rn_real_shower_water
4912                     	xdef	_rn_real_heat_water
4913                     	xref	_debug_br
4914                     	xref	_start_flag
4915                     	xref	_dr_mode_out
4916                     	xref	_packet_changed
4917                     	xref	_getHexToBin
4918                     	xref	__rcLED
4919                     	xref	__disp_temp
4920  0003               __remote_buf:
4921  0003 000000000000  	ds.b	8
4922                     	xdef	__remote_buf
4923                     	xdef	__remote
4924                     	xdef	__boiler_fire
4925                     	xdef	__boiler_type
4926                     	xdef	__boiler_water_heat
4927                     	xdef	__boiler_water_shower
4928  000b               ___boiler_shower:
4929  000b 000000000000  	ds.b	10
4930                     	xdef	___boiler_shower
4931                     	xdef	__disp_status_loop_host_boiler
4932                     	xref	__updateCount
4933                     	xref	__updateBit
4934                     	xref	__updateTimer
4935                     	xdef	__key_blink
4936                     	xref	__key_hour
4937                     	xref	__key_min
4938                     	xref	__key_sec
4939                     	xdef	__disp_mode2
4940                     	xdef	__disp_mode
4941                     	xref	_disp_status_curr_only
4942                     	xref	_disp_status_loop_init
4943                     	xdef	_disp_status_loop_host_B
4944                     	xdef	_disp_status_loop_host_Y
4945                     	xdef	_disp_status_loop_host_N
4946                     	xref	_disp_status_loop_messageDn
4947                     	xref	_disp_status_loop_message
4948                     	xref	__subRemote
4949                     	xref	__dsPrev
4950                     	xref	__dsCount
4951                     	xdef	_disp_status_loop_host
4952                     	xref	___sRoom
4953                     	xref	___sInfo
4954                     	xref	___sDn
4955                     	xref	___sUp
4956                     	xref	___s
4957                     	xref	_lcd_disp_info
4958                     	xref	_lcd_disp_info_shower
4959                     	xref	_ui_disp_reserve_setup
4960                     	xref	_ui_disp_repeat_setup
4961                     	xref	_ui_disp_clear_tSetup
4962                     	xref	___ui_disp_temp_c
4963                     	xref	_ui_disp_temp_curr
4964                     	xref	_ui_disp_temp_setup
4965                     	xref	_lcd_clear_rid_n
4966                     	xref	_lcd_blink_itemRoom
4967                     	xref	_lcd_blink_item
4968                     	xref	_lcd_blink_clear
4969                     	xref	_lcd_disp_rid
4970                     	xref	_lcd_disp_n
4971                     	xref	_lcd_clear
4972                     	xref	_lcd_clear_rid
4973                     	xref	_lcd_clear_btn
4974                     	xref	_iLF_DEF
4975                     	xref	_bLF_DEF
4976                     	xref	_uiInfo
4977                     	xref	_file_write
4978                     	xref	___timer1s
4979                     	xref.b	c_x
4999                     	xref	c_idiv
5000                     	xref	c_smodx
5001                     	end
