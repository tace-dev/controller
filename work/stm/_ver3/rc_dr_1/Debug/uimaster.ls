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
 145                     ; 60 	if( (debug_br>>4) != 3 )
 147  0004 c60000        	ld	a,_debug_br
 148  0007 4e            	swap	a
 149  0008 a40f          	and	a,#15
 150  000a 5f            	clrw	x
 151  000b 97            	ld	xl,a
 152  000c a30003        	cpw	x,#3
 153  000f 2726          	jreq	L13
 154                     ; 62 		i = _boiler_water_shower;
 156  0011 c60001        	ld	a,__boiler_water_shower
 157  0014 6b02          	ld	(OFST+0,sp),a
 158                     ; 63 		ENC_MOVE_0(35, 85, 1);
 160  0016 720c00000c    	btjt	_uiInfo,#6,L33
 163  001b a124          	cp	a,#36
 164  001d 2404          	jruge	L53
 167  001f a655          	ld	a,#85
 169  0021 200a          	jp	LC001
 170  0023               L53:
 173  0023 0a02          	dec	(OFST+0,sp)
 174  0025 200c          	jra	L14
 175  0027               L33:
 178  0027 a155          	cp	a,#85
 179  0029 2506          	jrult	L34
 182  002b a623          	ld	a,#35
 183  002d               LC001:
 184  002d 6b02          	ld	(OFST+0,sp),a
 186  002f 2002          	jra	L14
 187  0031               L34:
 190  0031 0c02          	inc	(OFST+0,sp)
 191  0033               L14:
 192                     ; 64 		return i;		
 195  0033 7b02          	ld	a,(OFST+0,sp)
 197  0035 203a          	jra	L6
 198  0037               L13:
 199                     ; 67 	for (i = 0 ; i < 16 ; i++) {
 201  0037 4f            	clr	a
 202  0038 6b02          	ld	(OFST+0,sp),a
 203  003a               L74:
 204                     ; 68 		if (rn_real_shower_water[i] == temp) {
 206  003a 5f            	clrw	x
 207  003b 97            	ld	xl,a
 208  003c d6001d        	ld	a,(_rn_real_shower_water,x)
 209  003f 1103          	cp	a,(OFST+1,sp)
 210  0041 2606          	jrne	L55
 211                     ; 69 			num = i;
 213  0043 7b02          	ld	a,(OFST+0,sp)
 214  0045 6b01          	ld	(OFST-1,sp),a
 215                     ; 70 			break;
 217  0047 200a          	jra	L35
 218  0049               L55:
 219                     ; 67 	for (i = 0 ; i < 16 ; i++) {
 221  0049 0c02          	inc	(OFST+0,sp)
 224  004b 7b02          	ld	a,(OFST+0,sp)
 225  004d a110          	cp	a,#16
 226  004f 25e9          	jrult	L74
 227  0051 7b01          	ld	a,(OFST-1,sp)
 228  0053               L35:
 229                     ; 74 	if( (uiInfo.enc & 0x40) == 0 ) {
 231  0053 720c000006    	btjt	_uiInfo,#6,L75
 232                     ; 75 		if (num == 0) {
 234                     ; 77 			num = 0;
 236  0058 270a          	jreq	LC002
 237                     ; 79 			num--;
 239  005a 0a01          	dec	(OFST-1,sp)
 240  005c 200c          	jra	L56
 241  005e               L75:
 242                     ; 83 		if (num == 15) {
 244  005e a10f          	cp	a,#15
 245  0060 2606          	jrne	L76
 246                     ; 85 			num = 15;
 248  0062 a60f          	ld	a,#15
 249  0064               LC002:
 251  0064 6b01          	ld	(OFST-1,sp),a
 253  0066 2002          	jra	L56
 254  0068               L76:
 255                     ; 87 			num++;
 257  0068 0c01          	inc	(OFST-1,sp)
 258  006a               L56:
 259                     ; 91 	return rn_real_shower_water[num];
 261  006a 7b01          	ld	a,(OFST-1,sp)
 262  006c 5f            	clrw	x
 263  006d 97            	ld	xl,a
 264  006e d6001d        	ld	a,(_rn_real_shower_water,x)
 266  0071               L6:
 268  0071 5b03          	addw	sp,#3
 269  0073 81            	ret	
 319                     ; 94 uint8_t	ENC_MOVE_0_HEAT(uint8_t temp)
 319                     ; 95 {
 320                     .text:	section	.text,new
 321  0000               _ENC_MOVE_0_HEAT:
 323  0000 88            	push	a
 324  0001 89            	pushw	x
 325       00000002      OFST:	set	2
 328                     ; 96 	uint8_t num = 0;
 330  0002 0f01          	clr	(OFST-1,sp)
 331                     ; 100 	if( (debug_br>>4) != 3 )
 333  0004 c60000        	ld	a,_debug_br
 334  0007 4e            	swap	a
 335  0008 a40f          	and	a,#15
 336  000a 5f            	clrw	x
 337  000b 97            	ld	xl,a
 338  000c a30003        	cpw	x,#3
 339  000f 2722          	jreq	L311
 340                     ; 102 		i = _boiler_water_heat;
 342  0011 c60002        	ld	a,__boiler_water_heat
 343  0014 6b02          	ld	(OFST+0,sp),a
 344                     ; 103 		ENC_MOVE_0(40, 85, 5);
 346  0016 720c00000c    	btjt	_uiInfo,#6,L511
 349  001b a129          	cp	a,#41
 350  001d 2404          	jruge	L711
 353  001f a655          	ld	a,#85
 355  0021 204a          	jra	L21
 356  0023               L711:
 359  0023 a005          	sub	a,#5
 360  0025 2046          	jra	L21
 361  0027               L511:
 364  0027 a155          	cp	a,#85
 365  0029 2504          	jrult	L521
 368  002b a628          	ld	a,#40
 370  002d 203e          	jra	L21
 371  002f               L521:
 374  002f ab05          	add	a,#5
 375                     ; 104 		return i;		
 379  0031 203a          	jra	L21
 380  0033               L311:
 381                     ; 107 	for (i = 0 ; i < 22 ; i++) {
 383  0033 4f            	clr	a
 384  0034 6b02          	ld	(OFST+0,sp),a
 385  0036               L131:
 386                     ; 108 		if (rn_real_heat_water[i] == temp) {
 388  0036 5f            	clrw	x
 389  0037 97            	ld	xl,a
 390  0038 d60007        	ld	a,(_rn_real_heat_water,x)
 391  003b 1103          	cp	a,(OFST+1,sp)
 392  003d 2606          	jrne	L731
 393                     ; 109 			num = i;
 395  003f 7b02          	ld	a,(OFST+0,sp)
 396  0041 6b01          	ld	(OFST-1,sp),a
 397                     ; 110 			break;
 399  0043 200a          	jra	L531
 400  0045               L731:
 401                     ; 107 	for (i = 0 ; i < 22 ; i++) {
 403  0045 0c02          	inc	(OFST+0,sp)
 406  0047 7b02          	ld	a,(OFST+0,sp)
 407  0049 a116          	cp	a,#22
 408  004b 25e9          	jrult	L131
 409  004d 7b01          	ld	a,(OFST-1,sp)
 410  004f               L531:
 411                     ; 114 	if( (uiInfo.enc & 0x40) == 0 ) {
 413  004f 720c000006    	btjt	_uiInfo,#6,L141
 414                     ; 115 		if (num == 0) {
 416                     ; 117 			num = 0;
 418  0054 270a          	jreq	LC003
 419                     ; 119 			num--;
 421  0056 0a01          	dec	(OFST-1,sp)
 422  0058 200c          	jra	L741
 423  005a               L141:
 424                     ; 123 		if (num == 21) {
 426  005a a115          	cp	a,#21
 427  005c 2606          	jrne	L151
 428                     ; 125 			num = 21;
 430  005e a615          	ld	a,#21
 431  0060               LC003:
 433  0060 6b01          	ld	(OFST-1,sp),a
 435  0062 2002          	jra	L741
 436  0064               L151:
 437                     ; 127 			num++;
 439  0064 0c01          	inc	(OFST-1,sp)
 440  0066               L741:
 441                     ; 131 	return rn_real_heat_water[num];
 443  0066 7b01          	ld	a,(OFST-1,sp)
 444  0068 5f            	clrw	x
 445  0069 97            	ld	xl,a
 446  006a d60007        	ld	a,(_rn_real_heat_water,x)
 448  006d               L21:
 450  006d 5b03          	addw	sp,#3
 451  006f 81            	ret	
 487                     ; 135 void	disp_status_remote_message(uint8_t i)
 487                     ; 136 {
 488                     .text:	section	.text,new
 489  0000               _disp_status_remote_message:
 491  0000 88            	push	a
 492       00000000      OFST:	set	0
 495                     ; 137 	lcd_clear_btn();
 497  0001 cd0000        	call	_lcd_clear_btn
 499                     ; 140 	if( i == 0x01 )			{	/*LCD_BIT_SET(bP12);*/	/*	(0)난방*/	}
 501  0004 7b01          	ld	a,(OFST+1,sp)
 502  0006 a101          	cp	a,#1
 503  0008 2739          	jreq	L371
 505                     ; 141 	else if( i == 0x02 )	{	LCD_BIT_SET(bP13);	/*	(1)외출*/	}
 507  000a a102          	cp	a,#2
 508  000c 260a          	jrne	L571
 511  000e c60010        	ld	a,_iLF_DEF+16
 512  0011 ad32          	call	LC005
 513  0013 ca0010        	or	a,_bLF_DEF+16
 515  0016 2028          	jp	LC004
 516  0018               L571:
 517                     ; 142 	else if( i == 0x04 )	{	LCD_BIT_SET(bP11);	/*	(2)정지*/	}
 519  0018 a104          	cp	a,#4
 520  001a 260a          	jrne	L102
 523  001c c60030        	ld	a,_iLF_DEF+48
 524  001f ad24          	call	LC005
 525  0021 ca0030        	or	a,_bLF_DEF+48
 527  0024 201a          	jp	LC004
 528  0026               L102:
 529                     ; 143 	else if( i == 0x08 )	{	LCD_BIT_SET(bP10);	/*	(2)예약*/	}
 531  0026 a108          	cp	a,#8
 532  0028 260a          	jrne	L502
 535  002a c6003a        	ld	a,_iLF_DEF+58
 536  002d ad16          	call	LC005
 537  002f ca003a        	or	a,_bLF_DEF+58
 539  0032 200c          	jp	LC004
 540  0034               L502:
 541                     ; 144 	else if( i == 0x10 )	{	LCD_BIT_SET(bP9);	/*	(2)반복*/	}
 543  0034 a110          	cp	a,#16
 544  0036 260b          	jrne	L371
 547  0038 c60031        	ld	a,_iLF_DEF+49
 548  003b ad08          	call	LC005
 549  003d ca0031        	or	a,_bLF_DEF+49
 550  0040               LC004:
 551  0040 d7540c        	ld	(21516,x),a
 552  0043               L371:
 553                     ; 145 }
 556  0043 84            	pop	a
 557  0044 81            	ret	
 558  0045               LC005:
 559  0045 5f            	clrw	x
 560  0046 97            	ld	xl,a
 561  0047 d6540c        	ld	a,(21516,x)
 562  004a 81            	ret	
 618                     ; 147 uint8_t		disp_status_loop_remote_N(uint8_t key)
 618                     ; 148 {
 619                     .text:	section	.text,new
 620  0000               _disp_status_loop_remote_N:
 622  0000 88            	push	a
 623  0001 89            	pushw	x
 624       00000002      OFST:	set	2
 627                     ; 150 	uint8_t	j = 0;
 629  0002 0f01          	clr	(OFST-1,sp)
 630                     ; 151 	i = uiInfo.tempSetup[key];
 632  0004 5f            	clrw	x
 633  0005 97            	ld	xl,a
 634  0006 d6003d        	ld	a,(_uiInfo+61,x)
 635  0009 6b02          	ld	(OFST+0,sp),a
 636                     ; 153 	if (i == 0) {
 638  000b 260d          	jrne	L332
 639                     ; 154 		i = 10;
 641  000d a60a          	ld	a,#10
 642  000f 6b02          	ld	(OFST+0,sp),a
 643                     ; 155 		uiInfo.tempSetup[key] = i;
 645  0011 5f            	clrw	x
 646  0012 7b03          	ld	a,(OFST+1,sp)
 647  0014 97            	ld	xl,a
 648  0015 a60a          	ld	a,#10
 649  0017 d7003d        	ld	(_uiInfo+61,x),a
 650  001a               L332:
 651                     ; 158 	if( uiInfo.enc != 0 )
 653  001a c60000        	ld	a,_uiInfo
 654  001d 2727          	jreq	L532
 655                     ; 160 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
 657  001f a540          	bcp	a,#64
 658  0021 2604          	jrne	L22
 659  0023 a6fe          	ld	a,#254
 660  0025 2002          	jra	L42
 661  0027               L22:
 662  0027 a602          	ld	a,#2
 663  0029               L42:
 664  0029 1b02          	add	a,(OFST+0,sp)
 665                     ; 161 		if( i<=10 )	i = 10;
 667  002b a10b          	cp	a,#11
 668  002d 2402          	jruge	L732
 671  002f a60a          	ld	a,#10
 672  0031               L732:
 673                     ; 162 		if( i>=80 )	i = 80;
 675  0031 a150          	cp	a,#80
 676  0033 2502          	jrult	L142
 679  0035 a650          	ld	a,#80
 680  0037               L142:
 681  0037 6b02          	ld	(OFST+0,sp),a
 682                     ; 163 		uiInfo.tempSetup[key] = i;
 684  0039 5f            	clrw	x
 685  003a 7b03          	ld	a,(OFST+1,sp)
 686  003c 97            	ld	xl,a
 687  003d 7b02          	ld	a,(OFST+0,sp)
 688  003f d7003d        	ld	(_uiInfo+61,x),a
 689                     ; 164 		j = 1;
 691  0042 a601          	ld	a,#1
 692  0044 6b01          	ld	(OFST-1,sp),a
 693  0046               L532:
 694                     ; 166 	if( _dsPrev != i )
 696  0046 c60000        	ld	a,__dsPrev
 697  0049 1102          	cp	a,(OFST+0,sp)
 698  004b 2756          	jreq	L342
 699                     ; 168 		lcd_clear(0);
 701  004d 4f            	clr	a
 702  004e cd0000        	call	_lcd_clear
 704                     ; 169 		disp_status_remote_message(0x01);
 706  0051 a601          	ld	a,#1
 707  0053 cd0000        	call	_disp_status_remote_message
 709                     ; 170 		_dsPrev = i;
 711  0056 7b02          	ld	a,(OFST+0,sp)
 712  0058 c70000        	ld	__dsPrev,a
 713                     ; 171 		LCD_BIT_SET(bP19);	
 715  005b 5f            	clrw	x
 716  005c c60029        	ld	a,_iLF_DEF+41
 717  005f 97            	ld	xl,a
 718  0060 d6540c        	ld	a,(21516,x)
 719  0063 ca0029        	or	a,_bLF_DEF+41
 720  0066 d7540c        	ld	(21516,x),a
 721                     ; 172 		LCD_BIT_SET(bP20);
 723  0069 c60039        	ld	a,_iLF_DEF+57
 724  006c ad3a          	call	LC006
 725  006e ca0039        	or	a,_bLF_DEF+57
 726  0071 d7540c        	ld	(21516,x),a
 727                     ; 173 		LCD_BIT_SET(bP15);	
 729  0074 c6003f        	ld	a,_iLF_DEF+63
 730  0077 ad2f          	call	LC006
 731  0079 ca003f        	or	a,_bLF_DEF+63
 732  007c d7540c        	ld	(21516,x),a
 733                     ; 174 		LCD_BIT_SET(bP14);
 735  007f c60000        	ld	a,_iLF_DEF
 736  0082 ad24          	call	LC006
 737  0084 ca0000        	or	a,_bLF_DEF
 738  0087 d7540c        	ld	(21516,x),a
 739                     ; 175 		__ui_disp_temp_c(3);//도씨 표시
 741  008a a603          	ld	a,#3
 742  008c cd0000        	call	___ui_disp_temp_c
 744                     ; 176 		ui_disp_temp_setup(uiInfo.tempSetup[key]);
 746  008f 7b03          	ld	a,(OFST+1,sp)
 747  0091 5f            	clrw	x
 748  0092 97            	ld	xl,a
 749  0093 d6003d        	ld	a,(_uiInfo+61,x)
 750  0096 cd0000        	call	_ui_disp_temp_setup
 752                     ; 177 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
 754  0099 7b03          	ld	a,(OFST+1,sp)
 755  009b 5f            	clrw	x
 756  009c 97            	ld	xl,a
 757  009d d60035        	ld	a,(_uiInfo+53,x)
 758  00a0 cd0000        	call	_ui_disp_temp_curr
 760  00a3               L342:
 761                     ; 180 	return j;
 763  00a3 7b01          	ld	a,(OFST-1,sp)
 766  00a5 5b03          	addw	sp,#3
 767  00a7 81            	ret	
 768  00a8               LC006:
 769  00a8 5f            	clrw	x
 770  00a9 97            	ld	xl,a
 771  00aa d6540c        	ld	a,(21516,x)
 772  00ad 81            	ret	
 828                     ; 183 uint8_t	disp_status_loop_remote_Y(uint8_t key)
 828                     ; 184 {
 829                     .text:	section	.text,new
 830  0000               _disp_status_loop_remote_Y:
 832  0000 88            	push	a
 833  0001 89            	pushw	x
 834       00000002      OFST:	set	2
 837                     ; 186 	uint8_t	j = 0;
 839  0002 0f01          	clr	(OFST-1,sp)
 840                     ; 187 	i = uiInfo.remote_time[key];
 842  0004 5f            	clrw	x
 843  0005 97            	ld	xl,a
 844  0006 d6004d        	ld	a,(_uiInfo+77,x)
 845  0009 6b02          	ld	(OFST+0,sp),a
 846                     ; 189 	if (i == 0) {
 848  000b 260d          	jrne	L562
 849                     ; 190 		i = 2;
 851  000d a602          	ld	a,#2
 852  000f 6b02          	ld	(OFST+0,sp),a
 853                     ; 191 		uiInfo.remote_time[key] = i;
 855  0011 5f            	clrw	x
 856  0012 7b03          	ld	a,(OFST+1,sp)
 857  0014 97            	ld	xl,a
 858  0015 a602          	ld	a,#2
 859  0017 d7004d        	ld	(_uiInfo+77,x),a
 860  001a               L562:
 861                     ; 194 	if( uiInfo.enc != 0 )
 863  001a c60000        	ld	a,_uiInfo
 864  001d 2727          	jreq	L762
 865                     ; 196 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
 867  001f a540          	bcp	a,#64
 868  0021 2604          	jrne	L24
 869  0023 a6fe          	ld	a,#254
 870  0025 2002          	jra	L44
 871  0027               L24:
 872  0027 a602          	ld	a,#2
 873  0029               L44:
 874  0029 1b02          	add	a,(OFST+0,sp)
 875                     ; 197 		if( i<=2 )	i = 2;
 877  002b a103          	cp	a,#3
 878  002d 2402          	jruge	L172
 881  002f a602          	ld	a,#2
 882  0031               L172:
 883                     ; 198 		if( i>=48 )	i = 48;
 885  0031 a130          	cp	a,#48
 886  0033 2502          	jrult	L372
 889  0035 a630          	ld	a,#48
 890  0037               L372:
 891  0037 6b02          	ld	(OFST+0,sp),a
 892                     ; 199 		uiInfo.remote_time[key] = i;
 894  0039 5f            	clrw	x
 895  003a 7b03          	ld	a,(OFST+1,sp)
 896  003c 97            	ld	xl,a
 897  003d 7b02          	ld	a,(OFST+0,sp)
 898  003f d7004d        	ld	(_uiInfo+77,x),a
 899                     ; 200 		j = 1;
 901  0042 a601          	ld	a,#1
 902  0044 6b01          	ld	(OFST-1,sp),a
 903  0046               L762:
 904                     ; 203 	if( _dsPrev != i )
 906  0046 c60000        	ld	a,__dsPrev
 907  0049 1102          	cp	a,(OFST+0,sp)
 908  004b 274d          	jreq	L572
 909                     ; 205 		lcd_clear(0);
 911  004d 4f            	clr	a
 912  004e cd0000        	call	_lcd_clear
 914                     ; 206 		disp_status_remote_message(0x08);
 916  0051 a608          	ld	a,#8
 917  0053 cd0000        	call	_disp_status_remote_message
 919                     ; 207 		_dsPrev = i;
 921  0056 7b02          	ld	a,(OFST+0,sp)
 922  0058 c70000        	ld	__dsPrev,a
 923                     ; 208 		LCD_BIT_SET(bP19);	
 925  005b 5f            	clrw	x
 926  005c c60029        	ld	a,_iLF_DEF+41
 927  005f 97            	ld	xl,a
 928  0060 d6540c        	ld	a,(21516,x)
 929  0063 ca0029        	or	a,_bLF_DEF+41
 930  0066 d7540c        	ld	(21516,x),a
 931                     ; 209 		LCD_BIT_SET(bP20);
 933  0069 c60039        	ld	a,_iLF_DEF+57
 934  006c 5f            	clrw	x
 935  006d 97            	ld	xl,a
 936  006e d6540c        	ld	a,(21516,x)
 937  0071 ca0039        	or	a,_bLF_DEF+57
 938  0074 d7540c        	ld	(21516,x),a
 939                     ; 210 		__ui_disp_temp_c(1);//도씨 표시
 941  0077 a601          	ld	a,#1
 942  0079 cd0000        	call	___ui_disp_temp_c
 944                     ; 211 		LCD_BIT_SET(bS2d);
 946  007c c6001a        	ld	a,_iLF_DEF+26
 947  007f 5f            	clrw	x
 948  0080 97            	ld	xl,a
 949  0081 d6540c        	ld	a,(21516,x)
 950  0084 ca001a        	or	a,_bLF_DEF+26
 951  0087 d7540c        	ld	(21516,x),a
 952                     ; 212 		ui_disp_temp_curr(uiInfo.tCurr);
 954  008a c60002        	ld	a,_uiInfo+2
 955  008d cd0000        	call	_ui_disp_temp_curr
 957                     ; 213 		ui_disp_reserve_setup(uiInfo.remote_time[key]);		
 959  0090 7b03          	ld	a,(OFST+1,sp)
 960  0092 5f            	clrw	x
 961  0093 97            	ld	xl,a
 962  0094 d6004d        	ld	a,(_uiInfo+77,x)
 963  0097 cd0000        	call	_ui_disp_reserve_setup
 965  009a               L572:
 966                     ; 216 	return j;
 968  009a 7b01          	ld	a,(OFST-1,sp)
 971  009c 5b03          	addw	sp,#3
 972  009e 81            	ret	
1008                     ; 219 uint8_t		disp_status_loop_remote_J(uint8_t key)
1008                     ; 220 {
1009                     .text:	section	.text,new
1010  0000               _disp_status_loop_remote_J:
1012  0000 88            	push	a
1013       00000000      OFST:	set	0
1016                     ; 222 	if (_dsPrev != 0xFE ) {
1018  0001 c60000        	ld	a,__dsPrev
1019  0004 a1fe          	cp	a,#254
1020  0006 270d          	jreq	L313
1021                     ; 223 		_dsPrev = 0xFE;
1023  0008 35fe0000      	mov	__dsPrev,#254
1024                     ; 225 		lcd_clear(0);
1026  000c 4f            	clr	a
1027  000d cd0000        	call	_lcd_clear
1029                     ; 226 		disp_status_remote_message(0x04);
1031  0010 a604          	ld	a,#4
1032  0012 cd0000        	call	_disp_status_remote_message
1034  0015               L313:
1035                     ; 230 	return key;
1037  0015 7b01          	ld	a,(OFST+1,sp)
1040  0017 5b01          	addw	sp,#1
1041  0019 81            	ret	
1084                     ; 233 uint8_t		disp_status_loop_remote_O(uint8_t key)
1084                     ; 234 {
1085                     .text:	section	.text,new
1086  0000               _disp_status_loop_remote_O:
1088  0000 88            	push	a
1089       00000000      OFST:	set	0
1092                     ; 236 	if (_dsPrev != 0xFE ) {
1094  0001 c60000        	ld	a,__dsPrev
1095  0004 a1fe          	cp	a,#254
1096  0006 2742          	jreq	L133
1097                     ; 237 		_dsPrev = 0xFE;
1099  0008 35fe0000      	mov	__dsPrev,#254
1100                     ; 239 		lcd_clear(0);
1102  000c 4f            	clr	a
1103  000d cd0000        	call	_lcd_clear
1105                     ; 240 		disp_status_remote_message(0x02);
1107  0010 a602          	ld	a,#2
1108  0012 cd0000        	call	_disp_status_remote_message
1110                     ; 242 		LCD_BIT_SET(bP19);	
1112  0015 c60029        	ld	a,_iLF_DEF+41
1113  0018 5f            	clrw	x
1114  0019 97            	ld	xl,a
1115  001a d6540c        	ld	a,(21516,x)
1116  001d ca0029        	or	a,_bLF_DEF+41
1117  0020 d7540c        	ld	(21516,x),a
1118                     ; 243 		LCD_BIT_SET(bP20);
1120  0023 c60039        	ld	a,_iLF_DEF+57
1121  0026 5f            	clrw	x
1122  0027 97            	ld	xl,a
1123  0028 d6540c        	ld	a,(21516,x)
1124  002b ca0039        	or	a,_bLF_DEF+57
1125  002e d7540c        	ld	(21516,x),a
1126                     ; 244 		__ui_disp_temp_c(3);
1128  0031 a603          	ld	a,#3
1129  0033 cd0000        	call	___ui_disp_temp_c
1131                     ; 245 		ui_disp_clear_tSetup(1);
1133  0036 a601          	ld	a,#1
1134  0038 cd0000        	call	_ui_disp_clear_tSetup
1136                     ; 246 		ui_disp_temp_curr(uiInfo.tempCurr[key]);
1138  003b 7b01          	ld	a,(OFST+1,sp)
1139  003d 5f            	clrw	x
1140  003e 97            	ld	xl,a
1141  003f d60035        	ld	a,(_uiInfo+53,x)
1142  0042 cd0000        	call	_ui_disp_temp_curr
1144                     ; 247 		ui_disp_temp_setup(30);
1146  0045 a61e          	ld	a,#30
1147  0047 cd0000        	call	_ui_disp_temp_setup
1149  004a               L133:
1150                     ; 250 	return key;
1152  004a 7b01          	ld	a,(OFST+1,sp)
1155  004c 5b01          	addw	sp,#1
1156  004e 81            	ret	
1212                     ; 253 uint8_t		disp_status_loop_remote_B(uint8_t key)
1212                     ; 254 {
1213                     .text:	section	.text,new
1214  0000               _disp_status_loop_remote_B:
1216  0000 88            	push	a
1217  0001 89            	pushw	x
1218       00000002      OFST:	set	2
1221                     ; 256 	uint8_t	j = 0;
1223  0002 0f01          	clr	(OFST-1,sp)
1224                     ; 257 	i = uiInfo.remote_banb[key];
1226  0004 5f            	clrw	x
1227  0005 97            	ld	xl,a
1228  0006 d60055        	ld	a,(_uiInfo+85,x)
1229  0009 6b02          	ld	(OFST+0,sp),a
1230                     ; 259 	if (i == 0) {
1232  000b 260d          	jrne	L353
1233                     ; 260 		i = 10;
1235  000d a60a          	ld	a,#10
1236  000f 6b02          	ld	(OFST+0,sp),a
1237                     ; 261 		uiInfo.remote_banb[key] = i;
1239  0011 5f            	clrw	x
1240  0012 7b03          	ld	a,(OFST+1,sp)
1241  0014 97            	ld	xl,a
1242  0015 a60a          	ld	a,#10
1243  0017 d70055        	ld	(_uiInfo+85,x),a
1244  001a               L353:
1245                     ; 264 	if( uiInfo.enc != 0 )
1247  001a c60000        	ld	a,_uiInfo
1248  001d 2725          	jreq	L553
1249                     ; 269 		i += (uiInfo.enc&0x40)==0 ? -10 : 10;
1251  001f a540          	bcp	a,#64
1252  0021 2604          	jrne	L601
1253  0023 a6f6          	ld	a,#246
1254  0025 2002          	jra	L011
1255  0027               L601:
1256  0027 a60a          	ld	a,#10
1257  0029               L011:
1258  0029 1b02          	add	a,(OFST+0,sp)
1259                     ; 270 		if( i==0 )	i = 50;
1261  002b 2602          	jrne	L753
1264  002d a632          	ld	a,#50
1265  002f               L753:
1266                     ; 271 		if( i==60 )	i = 10;
1268  002f a13c          	cp	a,#60
1269  0031 2602          	jrne	L163
1272  0033 a60a          	ld	a,#10
1273  0035               L163:
1274  0035 6b02          	ld	(OFST+0,sp),a
1275                     ; 272 		uiInfo.remote_banb[key] = i;
1277  0037 5f            	clrw	x
1278  0038 7b03          	ld	a,(OFST+1,sp)
1279  003a 97            	ld	xl,a
1280  003b 7b02          	ld	a,(OFST+0,sp)
1281  003d d70055        	ld	(_uiInfo+85,x),a
1282                     ; 273 		j = 1;
1284  0040 a601          	ld	a,#1
1285  0042 6b01          	ld	(OFST-1,sp),a
1286  0044               L553:
1287                     ; 275 	if( _dsPrev != i )
1289  0044 c60000        	ld	a,__dsPrev
1290  0047 1102          	cp	a,(OFST+0,sp)
1291  0049 2744          	jreq	L363
1292                     ; 277 		_dsPrev = i;
1294  004b 7b02          	ld	a,(OFST+0,sp)
1295  004d c70000        	ld	__dsPrev,a
1296                     ; 279 		lcd_clear(0);
1298  0050 4f            	clr	a
1299  0051 cd0000        	call	_lcd_clear
1301                     ; 280 		disp_status_remote_message(0x10);
1303  0054 a610          	ld	a,#16
1304  0056 cd0000        	call	_disp_status_remote_message
1306                     ; 282 		LCD_BIT_SET(bP19);	
1308  0059 c60029        	ld	a,_iLF_DEF+41
1309  005c ad36          	call	LC007
1310  005e ca0029        	or	a,_bLF_DEF+41
1311  0061 d7540c        	ld	(21516,x),a
1312                     ; 283 		LCD_BIT_SET(bP20);
1314  0064 c60039        	ld	a,_iLF_DEF+57
1315  0067 ad2b          	call	LC007
1316  0069 ca0039        	or	a,_bLF_DEF+57
1317  006c d7540c        	ld	(21516,x),a
1318                     ; 284 		LCD_BIT_SET(bS1);
1320  006f c6002a        	ld	a,_iLF_DEF+42
1321  0072 ad20          	call	LC007
1322  0074 ca002a        	or	a,_bLF_DEF+42
1323  0077 d7540c        	ld	(21516,x),a
1324                     ; 285 		__ui_disp_temp_c(1);
1326  007a a601          	ld	a,#1
1327  007c cd0000        	call	___ui_disp_temp_c
1329                     ; 286 		ui_disp_temp_curr(uiInfo.tCurr);
1331  007f c60002        	ld	a,_uiInfo+2
1332  0082 cd0000        	call	_ui_disp_temp_curr
1334                     ; 287 		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
1336  0085 7b03          	ld	a,(OFST+1,sp)
1337  0087 5f            	clrw	x
1338  0088 97            	ld	xl,a
1339  0089 d60055        	ld	a,(_uiInfo+85,x)
1340  008c cd0000        	call	_ui_disp_repeat_setup
1342  008f               L363:
1343                     ; 289 	return j;
1345  008f 7b01          	ld	a,(OFST-1,sp)
1348  0091 5b03          	addw	sp,#3
1349  0093 81            	ret	
1350  0094               LC007:
1351  0094 5f            	clrw	x
1352  0095 97            	ld	xl,a
1353  0096 d6540c        	ld	a,(21516,x)
1354  0099 81            	ret	
1403                     ; 292 uint8_t		disp_status_loop_host_Off(uint8_t key)
1403                     ; 293 {
1404                     .text:	section	.text,new
1405  0000               _disp_status_loop_host_Off:
1407  0000 89            	pushw	x
1408       00000002      OFST:	set	2
1411                     ; 295 	uint8_t	j = 0;
1413  0001 0f01          	clr	(OFST-1,sp)
1414                     ; 296 	i = uiInfo.tSetup;
1416  0003 c6000e        	ld	a,_uiInfo+14
1417  0006 6b02          	ld	(OFST+0,sp),a
1418                     ; 297 	if( uiInfo.enc != 0 )
1420  0008 c60000        	ld	a,_uiInfo
1421  000b 271e          	jreq	L504
1422                     ; 300 		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
1424  000d a540          	bcp	a,#64
1425  000f 2604          	jrne	L621
1426  0011 a6ff          	ld	a,#255
1427  0013 2002          	jra	L031
1428  0015               L621:
1429  0015 a601          	ld	a,#1
1430  0017               L031:
1431  0017 1b02          	add	a,(OFST+0,sp)
1432                     ; 301 		if( i<=10 )	i = 10;
1434  0019 a10b          	cp	a,#11
1435  001b 2402          	jruge	L704
1438  001d a60a          	ld	a,#10
1439  001f               L704:
1440                     ; 302 		if( i>=80 )	i = 80;
1442  001f a150          	cp	a,#80
1443  0021 2502          	jrult	L114
1446  0023 a650          	ld	a,#80
1447  0025               L114:
1448  0025 6b02          	ld	(OFST+0,sp),a
1449                     ; 305 		j = 1;
1451  0027 a601          	ld	a,#1
1452  0029 6b01          	ld	(OFST-1,sp),a
1453  002b               L504:
1454                     ; 307 	if( _dsPrev != i )
1456  002b c60000        	ld	a,__dsPrev
1457  002e 1102          	cp	a,(OFST+0,sp)
1458  0030 2705          	jreq	L314
1459                     ; 309 		_dsPrev = i;
1461  0032 7b02          	ld	a,(OFST+0,sp)
1462  0034 c70000        	ld	__dsPrev,a
1463  0037               L314:
1464                     ; 315 	return j;
1466  0037 7b01          	ld	a,(OFST-1,sp)
1469  0039 85            	popw	x
1470  003a 81            	ret	
1526                     ; 318 uint8_t		disp_status_loop_host_Out(uint8_t key)
1526                     ; 319 {
1527                     .text:	section	.text,new
1528  0000               _disp_status_loop_host_Out:
1530  0000 89            	pushw	x
1531       00000002      OFST:	set	2
1534                     ; 321 	uint8_t	j = 0;
1536  0001 0f01          	clr	(OFST-1,sp)
1537                     ; 322 	i = uiInfo.tSetup;
1539  0003 c6000e        	ld	a,_uiInfo+14
1540  0006 6b02          	ld	(OFST+0,sp),a
1541                     ; 323 	if( uiInfo.enc != 0 )
1543  0008 c60000        	ld	a,_uiInfo
1544  000b 2704          	jreq	L534
1545                     ; 331 		j = 1;
1547  000d a601          	ld	a,#1
1548  000f 6b01          	ld	(OFST-1,sp),a
1549  0011               L534:
1550                     ; 333 	if( _dsPrev != i )
1552  0011 c60000        	ld	a,__dsPrev
1553  0014 1102          	cp	a,(OFST+0,sp)
1554  0016 272d          	jreq	L734
1555                     ; 335 		_dsPrev = i;
1557  0018 7b02          	ld	a,(OFST+0,sp)
1558  001a c70000        	ld	__dsPrev,a
1559                     ; 337 		if (dr_mode_out == 0) {
1561  001d c60000        	ld	a,_dr_mode_out
1562  0020 2605          	jrne	L144
1563                     ; 338 			lcd_blink_item(bP13);
1565  0022 a610          	ld	a,#16
1566  0024 cd0000        	call	_lcd_blink_item
1568  0027               L144:
1569                     ; 341 		LCD_BIT_SET(bP0);	
1571  0027 c60019        	ld	a,_iLF_DEF+25
1572  002a 5f            	clrw	x
1573  002b 97            	ld	xl,a
1574  002c d6540c        	ld	a,(21516,x)
1575  002f ca0019        	or	a,_bLF_DEF+25
1576  0032 d7540c        	ld	(21516,x),a
1577                     ; 342 		ui_disp_temp_curr(uiInfo.tCurr);
1579  0035 c60002        	ld	a,_uiInfo+2
1580  0038 cd0000        	call	_ui_disp_temp_curr
1582                     ; 346 		ui_disp_temp_setup(30);
1584  003b a61e          	ld	a,#30
1585  003d cd0000        	call	_ui_disp_temp_setup
1587                     ; 347 		__ui_disp_temp_c(3);//도씨 표시
1589  0040 a603          	ld	a,#3
1590  0042 cd0000        	call	___ui_disp_temp_c
1592  0045               L734:
1593                     ; 353 	return j;
1595  0045 7b01          	ld	a,(OFST-1,sp)
1598  0047 85            	popw	x
1599  0048 81            	ret	
1649                     ; 356 uint8_t		disp_status_loop_host_Out_Long(uint8_t key)
1649                     ; 357 {
1650                     .text:	section	.text,new
1651  0000               _disp_status_loop_host_Out_Long:
1653  0000 89            	pushw	x
1654       00000002      OFST:	set	2
1657                     ; 359 	uint8_t	j = 0;
1659  0001 0f01          	clr	(OFST-1,sp)
1660                     ; 360 	i = uiInfo.tSetup;
1662  0003 c6000e        	ld	a,_uiInfo+14
1663  0006 6b02          	ld	(OFST+0,sp),a
1664                     ; 361 	if( uiInfo.enc != 0 )
1666  0008 c60000        	ld	a,_uiInfo
1667  000b 2704          	jreq	L364
1668                     ; 369 		j = 1;
1670  000d a601          	ld	a,#1
1671  000f 6b01          	ld	(OFST-1,sp),a
1672  0011               L364:
1673                     ; 371 	if( _dsPrev != i )
1675  0011 c60000        	ld	a,__dsPrev
1676  0014 1102          	cp	a,(OFST+0,sp)
1677  0016 270b          	jreq	L564
1678                     ; 373 		_dsPrev = i;
1680  0018 7b02          	ld	a,(OFST+0,sp)
1681  001a c70000        	ld	__dsPrev,a
1682                     ; 375 		ui_disp_temp_curr(uiInfo.tCurr);
1684  001d c60002        	ld	a,_uiInfo+2
1685  0020 cd0000        	call	_ui_disp_temp_curr
1687  0023               L564:
1688                     ; 378 	return j;
1690  0023 7b01          	ld	a,(OFST-1,sp)
1693  0025 85            	popw	x
1694  0026 81            	ret	
1751                     ; 381 uint8_t		disp_status_loop_host_N(uint8_t key)
1751                     ; 382 {
1752                     .text:	section	.text,new
1753  0000               _disp_status_loop_host_N:
1755  0000 89            	pushw	x
1756       00000002      OFST:	set	2
1759                     ; 384 	uint8_t	j = 0;
1761  0001 0f01          	clr	(OFST-1,sp)
1762                     ; 385 	i = uiInfo.tSetup;
1764  0003 c6000e        	ld	a,_uiInfo+14
1765  0006 6b02          	ld	(OFST+0,sp),a
1766                     ; 386 	if( uiInfo.enc != 0 )
1768  0008 c60000        	ld	a,_uiInfo
1769  000b 2721          	jreq	L705
1770                     ; 389 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1772  000d a540          	bcp	a,#64
1773  000f 2604          	jrne	L251
1774  0011 a6fe          	ld	a,#254
1775  0013 2002          	jra	L451
1776  0015               L251:
1777  0015 a602          	ld	a,#2
1778  0017               L451:
1779  0017 1b02          	add	a,(OFST+0,sp)
1780                     ; 390 		if( i<=10 )	i = 10;
1782  0019 a10b          	cp	a,#11
1783  001b 2402          	jruge	L115
1786  001d a60a          	ld	a,#10
1787  001f               L115:
1788                     ; 391 		if( i>=80 )	i = 80;
1790  001f a150          	cp	a,#80
1791  0021 2502          	jrult	L315
1794  0023 a650          	ld	a,#80
1795  0025               L315:
1796  0025 6b02          	ld	(OFST+0,sp),a
1797                     ; 392 		uiInfo.tSetup = i;
1799  0027 c7000e        	ld	_uiInfo+14,a
1800                     ; 394 		j = 1;
1802  002a a601          	ld	a,#1
1803  002c 6b01          	ld	(OFST-1,sp),a
1804  002e               L705:
1805                     ; 396 	if( _dsPrev != i )
1807  002e c60000        	ld	a,__dsPrev
1808  0031 1102          	cp	a,(OFST+0,sp)
1809  0033 272c          	jreq	L515
1810                     ; 398 		_dsPrev = i;
1812  0035 7b02          	ld	a,(OFST+0,sp)
1813  0037 c70000        	ld	__dsPrev,a
1814                     ; 400 		LCD_BIT_SET(bP0);	
1816  003a 5f            	clrw	x
1817  003b c60019        	ld	a,_iLF_DEF+25
1818  003e 97            	ld	xl,a
1819  003f d6540c        	ld	a,(21516,x)
1820  0042 ca0019        	or	a,_bLF_DEF+25
1821  0045 d7540c        	ld	(21516,x),a
1822                     ; 401 		ui_disp_temp_setup(uiInfo.tSetup);
1824  0048 c6000e        	ld	a,_uiInfo+14
1825  004b cd0000        	call	_ui_disp_temp_setup
1827                     ; 402 		ui_disp_temp_curr(uiInfo.tCurr);
1829  004e c60002        	ld	a,_uiInfo+2
1830  0051 cd0000        	call	_ui_disp_temp_curr
1832                     ; 403 		UPDATE_BIT(BIT_TSETUP);
1834  0054 72140000      	bset	__updateBit,#2
1837  0058 5500000000    	mov	__updateTimer,___timer1s
1840  005d 35050000      	mov	__updateCount,#5
1842  0061               L515:
1843                     ; 405 	return j;
1845  0061 7b01          	ld	a,(OFST-1,sp)
1848  0063 85            	popw	x
1849  0064 81            	ret	
1906                     ; 408 uint8_t	disp_status_loop_host_Y(uint8_t key)
1906                     ; 409 {
1907                     .text:	section	.text,new
1908  0000               _disp_status_loop_host_Y:
1910  0000 89            	pushw	x
1911       00000002      OFST:	set	2
1914                     ; 411 	uint8_t	j = 0;
1916  0001 0f01          	clr	(OFST-1,sp)
1917                     ; 412 	i = uiInfo.reserve;
1919  0003 c6000d        	ld	a,_uiInfo+13
1920  0006 6b02          	ld	(OFST+0,sp),a
1921                     ; 413 	if( uiInfo.enc != 0 )
1923  0008 c60000        	ld	a,_uiInfo
1924  000b 2721          	jreq	L735
1925                     ; 416 		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
1927  000d a540          	bcp	a,#64
1928  000f 2604          	jrne	L461
1929  0011 a6fe          	ld	a,#254
1930  0013 2002          	jra	L661
1931  0015               L461:
1932  0015 a602          	ld	a,#2
1933  0017               L661:
1934  0017 1b02          	add	a,(OFST+0,sp)
1935                     ; 417 		if( i<=2 )	i = 2;
1937  0019 a103          	cp	a,#3
1938  001b 2402          	jruge	L145
1941  001d a602          	ld	a,#2
1942  001f               L145:
1943                     ; 418 		if( i>=48 )	i = 48;
1945  001f a130          	cp	a,#48
1946  0021 2502          	jrult	L345
1949  0023 a630          	ld	a,#48
1950  0025               L345:
1951  0025 6b02          	ld	(OFST+0,sp),a
1952                     ; 419 		uiInfo.reserve = i;
1954  0027 c7000d        	ld	_uiInfo+13,a
1955                     ; 421 		j = 1;
1957  002a a601          	ld	a,#1
1958  002c 6b01          	ld	(OFST-1,sp),a
1959  002e               L735:
1960                     ; 423 	if( _dsPrev != i )
1962  002e c60000        	ld	a,__dsPrev
1963  0031 1102          	cp	a,(OFST+0,sp)
1964  0033 272c          	jreq	L545
1965                     ; 425 		_dsPrev = i;
1967  0035 7b02          	ld	a,(OFST+0,sp)
1968  0037 c70000        	ld	__dsPrev,a
1969                     ; 426 		LCD_BIT_SET(bP0);	
1971  003a 5f            	clrw	x
1972  003b c60019        	ld	a,_iLF_DEF+25
1973  003e 97            	ld	xl,a
1974  003f d6540c        	ld	a,(21516,x)
1975  0042 ca0019        	or	a,_bLF_DEF+25
1976  0045 d7540c        	ld	(21516,x),a
1977                     ; 427 		ui_disp_temp_curr(uiInfo.tCurr);
1979  0048 c60002        	ld	a,_uiInfo+2
1980  004b cd0000        	call	_ui_disp_temp_curr
1982                     ; 428 		ui_disp_reserve_setup(uiInfo.reserve);
1984  004e c6000d        	ld	a,_uiInfo+13
1985  0051 cd0000        	call	_ui_disp_reserve_setup
1987                     ; 429 		UPDATE_BIT(BIT_RESERVE);
1989  0054 72120000      	bset	__updateBit,#1
1992  0058 5500000000    	mov	__updateTimer,___timer1s
1995  005d 35050000      	mov	__updateCount,#5
1997  0061               L545:
1998                     ; 431 	return j;
2000  0061 7b01          	ld	a,(OFST-1,sp)
2003  0063 85            	popw	x
2004  0064 81            	ret	
2061                     ; 434 uint8_t		disp_status_loop_host_B(uint8_t key)
2061                     ; 435 {
2062                     .text:	section	.text,new
2063  0000               _disp_status_loop_host_B:
2065  0000 89            	pushw	x
2066       00000002      OFST:	set	2
2069                     ; 437 	uint8_t	j = 0;
2071  0001 0f01          	clr	(OFST-1,sp)
2072                     ; 438 	i = uiInfo.repeat;
2074  0003 c6000c        	ld	a,_uiInfo+12
2075  0006 6b02          	ld	(OFST+0,sp),a
2076                     ; 439 	if( uiInfo.enc != 0 )
2078  0008 c60000        	ld	a,_uiInfo
2079  000b 271f          	jreq	L765
2080                     ; 442 		i += (uiInfo.enc&0x40)==0 ? -10 : 10;
2082  000d a540          	bcp	a,#64
2083  000f 2604          	jrne	L671
2084  0011 a6f6          	ld	a,#246
2085  0013 2002          	jra	L002
2086  0015               L671:
2087  0015 a60a          	ld	a,#10
2088  0017               L002:
2089  0017 1b02          	add	a,(OFST+0,sp)
2090                     ; 443 		if( i==0 )	i = 50;
2092  0019 2602          	jrne	L175
2095  001b a632          	ld	a,#50
2096  001d               L175:
2097                     ; 444 		if( i==60 )	i = 10;
2099  001d a13c          	cp	a,#60
2100  001f 2602          	jrne	L375
2103  0021 a60a          	ld	a,#10
2104  0023               L375:
2105  0023 6b02          	ld	(OFST+0,sp),a
2106                     ; 445 		uiInfo.repeat = i;
2108  0025 c7000c        	ld	_uiInfo+12,a
2109                     ; 447 		j = 1;
2111  0028 a601          	ld	a,#1
2112  002a 6b01          	ld	(OFST-1,sp),a
2113  002c               L765:
2114                     ; 449 	if( _dsPrev != i )
2116  002c c60000        	ld	a,__dsPrev
2117  002f 1102          	cp	a,(OFST+0,sp)
2118  0031 272c          	jreq	L575
2119                     ; 451 		_dsPrev = i;
2121  0033 7b02          	ld	a,(OFST+0,sp)
2122  0035 c70000        	ld	__dsPrev,a
2123                     ; 452 		LCD_BIT_SET(bP0);	
2125  0038 5f            	clrw	x
2126  0039 c60019        	ld	a,_iLF_DEF+25
2127  003c 97            	ld	xl,a
2128  003d d6540c        	ld	a,(21516,x)
2129  0040 ca0019        	or	a,_bLF_DEF+25
2130  0043 d7540c        	ld	(21516,x),a
2131                     ; 453 		ui_disp_temp_curr(uiInfo.tCurr);
2133  0046 c60002        	ld	a,_uiInfo+2
2134  0049 cd0000        	call	_ui_disp_temp_curr
2136                     ; 454 		ui_disp_repeat_setup(uiInfo.repeat);
2138  004c c6000c        	ld	a,_uiInfo+12
2139  004f cd0000        	call	_ui_disp_repeat_setup
2141                     ; 455 		UPDATE_BIT(BIT_REPEAT);
2143  0052 72100000      	bset	__updateBit,#0
2146  0056 5500000000    	mov	__updateTimer,___timer1s
2149  005b 35050000      	mov	__updateCount,#5
2151  005f               L575:
2152                     ; 457 	return j;
2154  005f 7b01          	ld	a,(OFST-1,sp)
2157  0061 85            	popw	x
2158  0062 81            	ret	
2161                     	switch	.data
2162  002d               __key_blink:
2163  002d 00            	dc.b	0
2214                     ; 464 void	disp_rid_info(void)
2214                     ; 465 {
2215                     .text:	section	.text,new
2216  0000               _disp_rid_info:
2218  0000 5203          	subw	sp,#3
2219       00000003      OFST:	set	3
2222                     ; 471 	j = uiInfo.cnt + uiInfo.cnt_sub;
2224  0002 c60005        	ld	a,_uiInfo+5
2225  0005 cb0006        	add	a,_uiInfo+6
2226  0008 6b01          	ld	(OFST-2,sp),a
2227                     ; 472 	for( i=1; i<j; i++ )
2229  000a a601          	ld	a,#1
2230  000c 6b03          	ld	(OFST+0,sp),a
2232  000e 203a          	jra	L326
2233  0010               L716:
2234                     ; 474 		if( i >= 7 )
2236  0010 a107          	cp	a,#7
2237  0012 2503          	jrult	L726
2238                     ; 475 			break;
2239  0014               L526:
2240                     ; 484 }
2243  0014 5b03          	addw	sp,#3
2244  0016 81            	ret	
2245  0017               L726:
2246                     ; 477 		if( packet_buf[i] != ui_timeout ){
2248  0017 5f            	clrw	x
2249  0018 97            	ld	xl,a
2250  0019 d60000        	ld	a,(_packet_buf,x)
2251  001c c10000        	cp	a,_ui_timeout
2252  001f 271b          	jreq	L136
2253                     ; 478 			led = getHexToBin(_rcLED, i);
2255  0021 7b03          	ld	a,(OFST+0,sp)
2256  0023 97            	ld	xl,a
2257  0024 c60000        	ld	a,__rcLED
2258  0027 95            	ld	xh,a
2259  0028 cd0000        	call	_getHexToBin
2261  002b 6b02          	ld	(OFST-1,sp),a
2262                     ; 479 			lcd_disp_rid(i + 1, led, 1);
2264  002d 4b01          	push	#1
2265  002f 7b03          	ld	a,(OFST+0,sp)
2266  0031 97            	ld	xl,a
2267  0032 7b04          	ld	a,(OFST+1,sp)
2268  0034 4c            	inc	a
2269  0035 95            	ld	xh,a
2270  0036 cd0000        	call	_lcd_disp_rid
2272  0039 84            	pop	a
2274  003a 200a          	jra	L336
2275  003c               L136:
2276                     ; 482 			lcd_clear_rid_n(i + 1, 1);
2278  003c ae0001        	ldw	x,#1
2279  003f 7b03          	ld	a,(OFST+0,sp)
2280  0041 4c            	inc	a
2281  0042 95            	ld	xh,a
2282  0043 cd0000        	call	_lcd_clear_rid_n
2284  0046               L336:
2285                     ; 472 	for( i=1; i<j; i++ )
2287  0046 0c03          	inc	(OFST+0,sp)
2288  0048 7b03          	ld	a,(OFST+0,sp)
2289  004a               L326:
2292  004a 1101          	cp	a,(OFST-2,sp)
2293  004c 25c2          	jrult	L716
2294  004e 20c4          	jra	L526
2330                     ; 495 void	_disp_status_loop_host_boiler(uint8_t id)
2330                     ; 496 {
2331                     .text:	section	.text,new
2332  0000               __disp_status_loop_host_boiler:
2336                     ; 497 	uiInfo.opMode = (id==0) ? 7 : __boiler_shower[3];
2338  0000 4d            	tnz	a
2339  0001 2604          	jrne	L022
2340  0003 a607          	ld	a,#7
2341  0005 2003          	jra	L222
2342  0007               L022:
2343  0007 c6000e        	ld	a,___boiler_shower+3
2344  000a               L222:
2345  000a c70007        	ld	_uiInfo+7,a
2346                     ; 498 	func_rc_setting();
2349                     ; 499 }
2352  000d cc0000        	jp	_func_rc_setting
2477                     ; 503 void	disp_status_loop_host(uint8_t key)
2477                     ; 504 {
2478                     .text:	section	.text,new
2479  0000               _disp_status_loop_host:
2481  0000 88            	push	a
2482  0001 5204          	subw	sp,#4
2483       00000004      OFST:	set	4
2486                     ; 505 	uint8_t	i = 0;
2488  0003 0f04          	clr	(OFST+0,sp)
2489                     ; 506 	uint8_t	j = 0;
2491                     ; 507 	uint8_t	k = 0;
2493  0005 0f01          	clr	(OFST-3,sp)
2494                     ; 509 	uint8_t _pre_boiler_water_shower = 0;
2496  0007 0f02          	clr	(OFST-2,sp)
2497                     ; 510 	uint8_t _pre_boiler_water_heat = 0;	
2499  0009 0f03          	clr	(OFST-1,sp)
2500                     ; 512 	if (_remote == 0) {
2502  000b c60004        	ld	a,__remote
2503  000e 2603          	jrne	L737
2504                     ; 513 		disp_rid_info();
2506  0010 cd0000        	call	_disp_rid_info
2508  0013               L737:
2509                     ; 516 	if( __s == 0 )  // 일반 모드
2511  0013 c60000        	ld	a,___s
2512  0016 2703cc0458    	jrne	L147
2513                     ; 518 		if( _dsCount == 0 )
2515  001b c60000        	ld	a,__dsCount
2516  001e 2618          	jrne	L347
2517                     ; 520 			_dsCount = 10;
2519  0020 350a0000      	mov	__dsCount,#10
2520                     ; 524 			if (start_flag == 0) {
2522  0024 725d0000      	tnz	_start_flag
2523  0028 2603          	jrne	L547
2524                     ; 525 				__sUp = 0;
2526  002a c70000        	ld	___sUp,a
2527  002d               L547:
2528                     ; 527 			start_flag = 0;
2530  002d 725f0000      	clr	_start_flag
2531                     ; 529 			__sDn = 0xff;
2533  0031 35ff0000      	mov	___sDn,#255
2535  0035 cc089c        	jra	L3731
2536  0038               L347:
2537                     ; 532 		} else if (_dsCount == 9) {
2539  0038 a109          	cp	a,#9
2540  003a 260e          	jrne	L157
2541                     ; 533 			_dsCount = 1;
2543  003c 35010000      	mov	__dsCount,#1
2544                     ; 534 			__sDn = 0xff;
2546  0040 35ff0000      	mov	___sDn,#255
2547                     ; 535 			disp_status_loop_init();
2549  0044 cd0000        	call	_disp_status_loop_init
2552  0047 cc089c        	jra	L3731
2553  004a               L157:
2554                     ; 537 		else if( _dsCount == 10 )
2556  004a a10a          	cp	a,#10
2557  004c 2703cc00ce    	jrne	L557
2558                     ; 539 			if (key==200) _GOTO(17)  // out long
2560  0051 7b05          	ld	a,(OFST+1,sp)
2561  0053 a1c8          	cp	a,#200
2562  0055 2608          	jrne	L757
2565  0057 35110000      	mov	___sUp,#17
2568  005b 350a0000      	mov	__dsCount,#10
2569  005f               L757:
2570                     ; 542 			if( __sUp == 0 )		_dsCount = 15;	//	N
2572  005f c60000        	ld	a,___sUp
2573  0062 2606          	jrne	L167
2576  0064 350f0000      	mov	__dsCount,#15
2578  0068 205e          	jra	L367
2579  006a               L167:
2580                     ; 543 			else if( __sUp == 1 )	_dsCount = 35;	//	Y
2582  006a a101          	cp	a,#1
2583  006c 2606          	jrne	L567
2586  006e 35230000      	mov	__dsCount,#35
2588  0072 2054          	jra	L367
2589  0074               L567:
2590                     ; 544 			else if( __sUp == 2 )	_dsCount = 25;	//	B
2592  0074 a102          	cp	a,#2
2593  0076 2606          	jrne	L177
2596  0078 35190000      	mov	__dsCount,#25
2598  007c 204a          	jra	L367
2599  007e               L177:
2600                     ; 545 			else if( __sUp == 5 )	{_dsCount = 45; _key_time_event[0] = 0; }	//	off
2602  007e a105          	cp	a,#5
2603  0080 260a          	jrne	L577
2606  0082 352d0000      	mov	__dsCount,#45
2609  0086 725f0000      	clr	__key_time_event
2611  008a 203c          	jra	L367
2612  008c               L577:
2613                     ; 546 			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //	out
2615  008c a110          	cp	a,#16
2616  008e 260a          	jrne	L1001
2619  0090 35100000      	mov	__dsCount,#16
2622  0094 35080000      	mov	___sUp,#8
2624  0098 202e          	jra	L367
2625  009a               L1001:
2626                     ; 547 			else if( __sUp == 101 )	{	_dsCount = 0;	__s = 101; }
2628  009a a165          	cp	a,#101
2629  009c 260a          	jrne	L5001
2632  009e 725f0000      	clr	__dsCount
2635  00a2 35650000      	mov	___s,#101
2637  00a6 2020          	jra	L367
2638  00a8               L5001:
2639                     ; 548 			else if( __sUp == 20 )	{	
2641  00a8 a114          	cp	a,#20
2642  00aa 260a          	jrne	L1101
2643                     ; 550 			_dsCount = 0; 
2645  00ac 725f0000      	clr	__dsCount
2646                     ; 551 			__s = 1;} // setting
2648  00b0 35010000      	mov	___s,#1
2650  00b4 2012          	jra	L367
2651  00b6               L1101:
2652                     ; 552 			else if( __sUp == 17 )	{_dsCount = 17; _dsPrev = 0xff;}	//	Out long
2654  00b6 a111          	cp	a,#17
2655  00b8 260a          	jrne	L5101
2658  00ba 35110000      	mov	__dsCount,#17
2661  00be 35ff0000      	mov	__dsPrev,#255
2663  00c2 2004          	jra	L367
2664  00c4               L5101:
2665                     ; 554 				_dsCount = 1;
2667  00c4 35010000      	mov	__dsCount,#1
2668  00c8               L367:
2669                     ; 555 			disp_status_loop_init();
2671  00c8 cd0000        	call	_disp_status_loop_init
2674  00cb cc089c        	jra	L3731
2675  00ce               L557:
2676                     ; 560 		else if( _dsCount == 15 )			//	N/Out
2678  00ce a10f          	cp	a,#15
2679  00d0 2665          	jrne	L3201
2680                     ; 562 			if( key==1 )		_GOTO(101)	//	TBD//Remote
2682  00d2 7b05          	ld	a,(OFST+1,sp)
2683  00d4 a101          	cp	a,#1
2684  00d6 260a          	jrne	L5201
2687  00d8 35650000      	mov	___sUp,#101
2690  00dc 350a0000      	mov	__dsCount,#10
2692  00e0 2040          	jra	L7201
2693  00e2               L5201:
2694                     ; 563 			else if( key==2 )	_GOTO2(1, 0)	//	Y/B
2696  00e2 a102          	cp	a,#2
2697  00e4 260e          	jrne	L1301
2700  00e6 35010000      	mov	___sUp,#1
2703  00ea 350a0000      	mov	__dsCount,#10
2707  00ee 725f0000      	clr	___sDn
2709  00f2 202e          	jra	L7201
2710  00f4               L1301:
2711                     ; 564 			else if( key==4 ) _GOTO(16)	//	Out
2713  00f4 a104          	cp	a,#4
2714  00f6 260a          	jrne	L5301
2717  00f8 35100000      	mov	___sUp,#16
2720  00fc 350a0000      	mov	__dsCount,#10
2722  0100 2020          	jra	L7201
2723  0102               L5301:
2724                     ; 565 			else if( key==8 )	_GOTO(5)	//	Off
2726  0102 a108          	cp	a,#8
2727  0104 260a          	jrne	L1401
2730  0106 35050000      	mov	___sUp,#5
2733  010a 350a0000      	mov	__dsCount,#10
2735  010e 2012          	jra	L7201
2736  0110               L1401:
2737                     ; 566 			else if( key==16 )	_DN
2739  0110 a110          	cp	a,#16
2740  0112 2606          	jrne	L5401
2743  0114 35400000      	mov	_uiInfo,#64
2745  0118 2008          	jra	L7201
2746  011a               L5401:
2747                     ; 567 			else if( key==32 )	_UP
2749  011a a120          	cp	a,#32
2750  011c 2604          	jrne	L7201
2753  011e 35010000      	mov	_uiInfo,#1
2754  0122               L7201:
2755                     ; 569 			_disp_temp = 1;
2757  0122 35010000      	mov	__disp_temp,#1
2758                     ; 570 			i = disp_status_loop_host_N(key);
2760  0126 7b05          	ld	a,(OFST+1,sp)
2761  0128 cd0000        	call	_disp_status_loop_host_N
2763  012b 6b04          	ld	(OFST+0,sp),a
2764                     ; 571 			if( i==1 )
2766  012d 4a            	dec	a
2767  012e 269b          	jrne	L3731
2768                     ; 572 				_key_blink = 1;
2770  0130 3501002d      	mov	__key_blink,#1
2771  0134 cc089c        	jra	L3731
2772  0137               L3201:
2773                     ; 574 		else if( _dsCount == 16 )			//	OUT
2775  0137 a110          	cp	a,#16
2776  0139 2641          	jrne	L7501
2777                     ; 576 			if( key==1 )		_GOTO(101)	//	TBD//Y
2779  013b 7b05          	ld	a,(OFST+1,sp)
2780  013d a101          	cp	a,#1
2781  013f 2606          	jrne	L1601
2784  0141 35650000      	mov	___sUp,#101
2787  0145 201c          	jp	LC008
2788  0147               L1601:
2789                     ; 577 			else if( key==2 )	_GOTO(1)	//	Y
2791  0147 a102          	cp	a,#2
2792  0149 2606          	jrne	L5601
2795  014b 35010000      	mov	___sUp,#1
2798  014f 2012          	jp	LC008
2799  0151               L5601:
2800                     ; 578 			else if( key==4 )	_GOTO(0)	//	N
2802  0151 a104          	cp	a,#4
2803  0153 2606          	jrne	L1701
2806  0155 725f0000      	clr	___sUp
2809  0159 2008          	jp	LC008
2810  015b               L1701:
2811                     ; 579 			else if( key==8 )	_GOTO(5)	//	Off
2813  015b a108          	cp	a,#8
2814  015d 2608          	jrne	L3601
2817  015f 35050000      	mov	___sUp,#5
2820  0163               LC008:
2824  0163 350a0000      	mov	__dsCount,#10
2825  0167               L3601:
2826                     ; 581 			_disp_temp = 1;
2828  0167 35010000      	mov	__disp_temp,#1
2829                     ; 582 			i = disp_status_loop_host_Out(key);
2831  016b 7b05          	ld	a,(OFST+1,sp)
2832  016d cd0000        	call	_disp_status_loop_host_Out
2834  0170 6b04          	ld	(OFST+0,sp),a
2835                     ; 583 			if( i==1 )
2837  0172 4a            	dec	a
2838  0173 26bf          	jrne	L3731
2839                     ; 584 				_key_blink = 1;
2841  0175 3501002d      	mov	__key_blink,#1
2842  0179 cc089c        	jra	L3731
2843  017c               L7501:
2844                     ; 586 		else if (_dsCount == 17) {
2846  017c a111          	cp	a,#17
2847  017e 260f          	jrne	L3011
2848                     ; 587 			dr_mode_out = 0;
2850  0180 725f0000      	clr	_dr_mode_out
2851                     ; 590 			_GOTO(16);
2853  0184 35100000      	mov	___sUp,#16
2856  0188 350a0000      	mov	__dsCount,#10
2859  018c cc089c        	jra	L3731
2860  018f               L3011:
2861                     ; 615 		else if( _dsCount == 25 )			//	B
2863  018f a119          	cp	a,#25
2864  0191 2665          	jrne	L7011
2865                     ; 617 			if( key==1 )		_GOTO(101)	//	Y
2867  0193 7b05          	ld	a,(OFST+1,sp)
2868  0195 a101          	cp	a,#1
2869  0197 260a          	jrne	L1111
2872  0199 35650000      	mov	___sUp,#101
2875  019d 350a0000      	mov	__dsCount,#10
2877  01a1 2040          	jra	L3111
2878  01a3               L1111:
2879                     ; 618 			else if( key==2 )	
2881  01a3 a102          	cp	a,#2
2882  01a5 260e          	jrne	L5111
2883                     ; 620 				__sDn = 0;
2885  01a7 725f0000      	clr	___sDn
2886                     ; 621 				_GOTO(1)	//	Y
2888  01ab 35010000      	mov	___sUp,#1
2891  01af 350a0000      	mov	__dsCount,#10
2893  01b3 202e          	jra	L3111
2894  01b5               L5111:
2895                     ; 623 			else if( key==4 )	_GOTO(0)	//	N
2897  01b5 a104          	cp	a,#4
2898  01b7 260a          	jrne	L1211
2901  01b9 725f0000      	clr	___sUp
2904  01bd 350a0000      	mov	__dsCount,#10
2906  01c1 2020          	jra	L3111
2907  01c3               L1211:
2908                     ; 624 			else if( key==8 )	_GOTO(5)	//	Off
2910  01c3 a108          	cp	a,#8
2911  01c5 260a          	jrne	L5211
2914  01c7 35050000      	mov	___sUp,#5
2917  01cb 350a0000      	mov	__dsCount,#10
2919  01cf 2012          	jra	L3111
2920  01d1               L5211:
2921                     ; 625 			else if( key==16 )	_DN
2923  01d1 a110          	cp	a,#16
2924  01d3 2606          	jrne	L1311
2927  01d5 35400000      	mov	_uiInfo,#64
2929  01d9 2008          	jra	L3111
2930  01db               L1311:
2931                     ; 626 			else if( key==32 )	_UP
2933  01db a120          	cp	a,#32
2934  01dd 2604          	jrne	L3111
2937  01df 35010000      	mov	_uiInfo,#1
2938  01e3               L3111:
2939                     ; 630 			_disp_temp = 1;
2941  01e3 35010000      	mov	__disp_temp,#1
2942                     ; 631 			i = disp_status_loop_host_B(key);
2944  01e7 7b05          	ld	a,(OFST+1,sp)
2945  01e9 cd0000        	call	_disp_status_loop_host_B
2947  01ec 6b04          	ld	(OFST+0,sp),a
2948                     ; 632 			if( i==1 )
2950  01ee 4a            	dec	a
2951  01ef 269b          	jrne	L3731
2952                     ; 633 				_key_blink = 1;
2954  01f1 3501002d      	mov	__key_blink,#1
2955  01f5 cc089c        	jra	L3731
2956  01f8               L7011:
2957                     ; 635 		else if( _dsCount == 35 )			//	Y
2959  01f8 a123          	cp	a,#35
2960  01fa 2665          	jrne	L3411
2961                     ; 637 			if( key==1 )		_GOTO(101)	//	N
2963  01fc 7b05          	ld	a,(OFST+1,sp)
2964  01fe a101          	cp	a,#1
2965  0200 260a          	jrne	L5411
2968  0202 35650000      	mov	___sUp,#101
2971  0206 350a0000      	mov	__dsCount,#10
2973  020a 2040          	jra	L7411
2974  020c               L5411:
2975                     ; 638 			else if( key==2 )	
2977  020c a102          	cp	a,#2
2978  020e 260e          	jrne	L1511
2979                     ; 640 				__sDn = 1;
2981  0210 35010000      	mov	___sDn,#1
2982                     ; 641 				_GOTO(2)	//	B
2984  0214 35020000      	mov	___sUp,#2
2987  0218 350a0000      	mov	__dsCount,#10
2989  021c 202e          	jra	L7411
2990  021e               L1511:
2991                     ; 643 			else if( key==4 )	_GOTO(0)	//	N
2993  021e a104          	cp	a,#4
2994  0220 260a          	jrne	L5511
2997  0222 725f0000      	clr	___sUp
3000  0226 350a0000      	mov	__dsCount,#10
3002  022a 2020          	jra	L7411
3003  022c               L5511:
3004                     ; 644 			else if( key==8 )	_GOTO(5)	//	Off
3006  022c a108          	cp	a,#8
3007  022e 260a          	jrne	L1611
3010  0230 35050000      	mov	___sUp,#5
3013  0234 350a0000      	mov	__dsCount,#10
3015  0238 2012          	jra	L7411
3016  023a               L1611:
3017                     ; 645 			else if( key==16 )	_DN
3019  023a a110          	cp	a,#16
3020  023c 2606          	jrne	L5611
3023  023e 35400000      	mov	_uiInfo,#64
3025  0242 2008          	jra	L7411
3026  0244               L5611:
3027                     ; 646 			else if( key==32 )	_UP
3029  0244 a120          	cp	a,#32
3030  0246 2604          	jrne	L7411
3033  0248 35010000      	mov	_uiInfo,#1
3034  024c               L7411:
3035                     ; 647 			_disp_temp = 1;
3037  024c 35010000      	mov	__disp_temp,#1
3038                     ; 648 			i = disp_status_loop_host_Y(key);
3040  0250 7b05          	ld	a,(OFST+1,sp)
3041  0252 cd0000        	call	_disp_status_loop_host_Y
3043  0255 6b04          	ld	(OFST+0,sp),a
3044                     ; 649 			if( i==1 )
3046  0257 4a            	dec	a
3047  0258 269b          	jrne	L3731
3048                     ; 650 				_key_blink = 1;
3050  025a 3501002d      	mov	__key_blink,#1
3051  025e cc089c        	jra	L3731
3052  0261               L3411:
3053                     ; 652 		else if( _dsCount == 45 )			//	off
3055  0261 a12d          	cp	a,#45
3056  0263 2676          	jrne	L7711
3057                     ; 654 			if (_key_time_event[0] == 0) 
3059  0265 c60000        	ld	a,__key_time_event
3060  0268 260e          	jrne	L1021
3061                     ; 656 				_key_time_event[0] = 1;
3063  026a 35010000      	mov	__key_time_event,#1
3064                     ; 657 				_key_time_event[1] = __timer1s;
3066  026e 5500000001    	mov	__key_time_event+1,___timer1s
3067                     ; 658 				_key_time_event[2] = 0;
3069  0273 c70002        	ld	__key_time_event+2,a
3071  0276 201f          	jra	L3021
3072  0278               L1021:
3073                     ; 660 			else if (_key_time_event[0] == 1)
3075  0278 4a            	dec	a
3076  0279 261c          	jrne	L3021
3077                     ; 662 				if (_key_time_event[1] != __timer1s) {
3079  027b c60001        	ld	a,__key_time_event+1
3080  027e c10000        	cp	a,___timer1s
3081  0281 2709          	jreq	L7021
3082                     ; 663 					_key_time_event[1] = __timer1s;
3084  0283 5500000001    	mov	__key_time_event+1,___timer1s
3085                     ; 664 					_key_time_event[2]++;
3087  0288 725c0002      	inc	__key_time_event+2
3088  028c               L7021:
3089                     ; 667 				if (_key_time_event[2] == 10) {
3091  028c c60002        	ld	a,__key_time_event+2
3092  028f a10a          	cp	a,#10
3093  0291 2604          	jrne	L3021
3094                     ; 668 					_key_time_event[0] = 2;
3096  0293 35020000      	mov	__key_time_event,#2
3097  0297               L3021:
3098                     ; 673 			if( key==1 )		_GOTO(101)	//	TBD
3100  0297 7b05          	ld	a,(OFST+1,sp)
3101  0299 a101          	cp	a,#1
3102  029b 2606          	jrne	L3121
3105  029d 35650000      	mov	___sUp,#101
3108  02a1 2023          	jp	LC009
3109  02a3               L3121:
3110                     ; 674 			else if( key==2 )	_GOTO(1)	//	Y
3112  02a3 a102          	cp	a,#2
3113  02a5 2606          	jrne	L7121
3116  02a7 35010000      	mov	___sUp,#1
3119  02ab 2019          	jp	LC009
3120  02ad               L7121:
3121                     ; 675 			else if( key==4 )	_GOTO(0)	//	N
3123  02ad a104          	cp	a,#4
3124  02af 2606          	jrne	L3221
3127  02b1               LC010:
3129  02b1 725f0000      	clr	___sUp
3132  02b5 200f          	jp	LC009
3133  02b7               L3221:
3134                     ; 676 			else if( key==8 )	
3136  02b7 a108          	cp	a,#8
3137  02b9 2611          	jrne	L5121
3138                     ; 678 				if (_key_time_event[0] == 2) 
3140  02bb c60000        	ld	a,__key_time_event
3141  02be a102          	cp	a,#2
3142                     ; 680 					 _GOTO(0)				//	on
3145  02c0 27ef          	jreq	LC010
3146                     ; 684 					_GOTO(20)       // 	setting
3148  02c2 35140000      	mov	___sUp,#20
3151  02c6               LC009:
3156  02c6 350a0000      	mov	__dsCount,#10
3157  02ca 7b05          	ld	a,(OFST+1,sp)
3158  02cc               L5121:
3159                     ; 688 			i = disp_status_loop_host_Off(key);
3161  02cc cd0000        	call	_disp_status_loop_host_Off
3163  02cf 6b04          	ld	(OFST+0,sp),a
3164                     ; 689 			if( i==1 )
3166  02d1 4a            	dec	a
3167  02d2 268a          	jrne	L3731
3168                     ; 690 				_key_blink = 1;
3170  02d4 3501002d      	mov	__key_blink,#1
3171  02d8 cc089c        	jra	L3731
3172  02db               L7711:
3173                     ; 692 		else if( _dsCount == 11 )
3175  02db a10b          	cp	a,#11
3176  02dd 2617          	jrne	L1421
3177                     ; 694 			_dsCount = 2;
3179  02df 35020000      	mov	__dsCount,#2
3180                     ; 695 			__sUp = 0xff;
3182  02e3 35ff0000      	mov	___sUp,#255
3183                     ; 696 			disp_status_loop_init();
3185  02e7 cd0000        	call	_disp_status_loop_init
3187                     ; 697 			disp_status_loop_messageDn(__sDn);
3189  02ea c60000        	ld	a,___sDn
3190  02ed cd0000        	call	_disp_status_loop_messageDn
3192                     ; 698 			disp_status_curr_only();
3194  02f0 cd0000        	call	_disp_status_curr_only
3197  02f3 cc089c        	jra	L3731
3198  02f6               L1421:
3199                     ; 700 		else if( _dsCount == 1 )
3201  02f6 a101          	cp	a,#1
3202  02f8 2703cc0402    	jrne	L5421
3203                     ; 705 			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
3205  02fd c60000        	ld	a,___sUp
3206  0300 2607          	jrne	L7421
3209  0302 7b05          	ld	a,(OFST+1,sp)
3210  0304 cd0000        	call	_disp_status_loop_host_N
3213  0307 2014          	jp	LC011
3214  0309               L7421:
3215                     ; 706 			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
3217  0309 a101          	cp	a,#1
3218  030b 2607          	jrne	L3521
3221  030d 7b05          	ld	a,(OFST+1,sp)
3222  030f cd0000        	call	_disp_status_loop_host_Y
3225  0312 2009          	jp	LC011
3226  0314               L3521:
3227                     ; 707 			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
3229  0314 a102          	cp	a,#2
3230  0316 2607          	jrne	L1521
3233  0318 7b05          	ld	a,(OFST+1,sp)
3234  031a cd0000        	call	_disp_status_loop_host_B
3236  031d               LC011:
3237  031d 6b04          	ld	(OFST+0,sp),a
3238  031f               L1521:
3239                     ; 709 			if( i==1 )
3241  031f 7b04          	ld	a,(OFST+0,sp)
3242  0321 4a            	dec	a
3243  0322 2604          	jrne	L1621
3244                     ; 710 				_key_blink = 1;
3246  0324 4c            	inc	a
3247  0325 c7002d        	ld	__key_blink,a
3248  0328               L1621:
3249                     ; 713 			_disp_temp = __sUp==0 ? 1 : 0;
3251  0328 c60000        	ld	a,___sUp
3252  032b 2603          	jrne	L462
3253  032d 4c            	inc	a
3254  032e 2001          	jra	L662
3255  0330               L462:
3256  0330 4f            	clr	a
3257  0331               L662:
3258  0331 c70000        	ld	__disp_temp,a
3259                     ; 714 			if( _disp_temp == 0 && _key_blink == 0 )
3261  0334 261c          	jrne	L3621
3263  0336 c6002d        	ld	a,__key_blink
3264  0339 2617          	jrne	L3621
3265                     ; 716 				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
3267  033b c60000        	ld	a,___sUp
3268  033e a101          	cp	a,#1
3269  0340 270c          	jreq	L7621
3271  0342 a102          	cp	a,#2
3272  0344 2708          	jreq	L7621
3274  0346 a105          	cp	a,#5
3275  0348 2704          	jreq	L7621
3277  034a a108          	cp	a,#8
3278  034c 2604          	jrne	L3621
3279  034e               L7621:
3280                     ; 717 					_disp_temp = 1;
3282  034e 35010000      	mov	__disp_temp,#1
3283  0352               L3621:
3284                     ; 720 			if( key == 1 )
3286  0352 7b05          	ld	a,(OFST+1,sp)
3287  0354 a101          	cp	a,#1
3288  0356 2611          	jrne	L5721
3289                     ; 722 				__sUp = (__sUp+1) % 3;
3291  0358 c60000        	ld	a,___sUp
3292  035b 5f            	clrw	x
3293  035c 97            	ld	xl,a
3294  035d 5c            	incw	x
3295  035e a603          	ld	a,#3
3296  0360 cd0000        	call	c_smodx
3298  0363 01            	rrwa	x,a
3299  0364 c70000        	ld	___sUp,a
3300  0367 206c          	jra	L156
3301  0369               L5721:
3302                     ; 733 			else if( key == 2 )
3304  0369 a102          	cp	a,#2
3305  036b 261c          	jrne	L1031
3306                     ; 735 				__sUp = 0xff;
3308  036d 35ff0000      	mov	___sUp,#255
3309                     ; 736 				__sDn = 0;
3311  0371 725f0000      	clr	___sDn
3312                     ; 737 				disp_status_loop_messageDn(__sDn);
3314  0375 4f            	clr	a
3315  0376 cd0000        	call	_disp_status_loop_messageDn
3317                     ; 738 				disp_status_curr_only();
3319  0379 cd0000        	call	_disp_status_curr_only
3321                     ; 739 				lcd_blink_clear();
3323  037c cd0000        	call	_lcd_blink_clear
3325                     ; 740 				_dsCount = 2;
3327  037f 35020000      	mov	__dsCount,#2
3328                     ; 741 				_dsPrev = 0xff;
3330  0383 35ff0000      	mov	__dsPrev,#255
3331                     ; 743 				_key_blink = 0;
3333  0387 201c          	jp	LC012
3334  0389               L1031:
3335                     ; 745 			else if( key == 3 )
3337  0389 a103          	cp	a,#3
3338  038b 265d          	jrne	L5031
3339                     ; 747 				if( __sUp == 0 )
3341  038d c60000        	ld	a,___sUp
3342  0390 2635          	jrne	L7031
3343                     ; 749 					if( _key_blink == 0 )
3345  0392 c6002d        	ld	a,__key_blink
3346  0395 260b          	jrne	L7131
3347  0397 cc0436        	jra	L356
3348  039a               L3131:
3349                     ; 755 							__s = 1;
3351  039a 35010000      	mov	___s,#1
3352  039e               L5131:
3353                     ; 756 						_dsCount = 0;
3355  039e 725f0000      	clr	__dsCount
3356  03a2               L7131:
3357                     ; 769 				disp_status_loop_init();
3360  03a2 cd0000        	call	_disp_status_loop_init
3362                     ; 771 				_key_blink = 0;
3364  03a5               LC012:
3367  03a5 725f002d      	clr	__key_blink
3369  03a9               L7721:
3370                     ; 788 			if( _key_blink == 1 )
3372  03a9 c6002d        	ld	a,__key_blink
3373  03ac 4a            	dec	a
3374  03ad 2703cc089c    	jrne	L3731
3375                     ; 790 				if( _key_sec >= KEY_BLINK_FADE )
3377  03b2 c60000        	ld	a,__key_sec
3378  03b5 a10a          	cp	a,#10
3379  03b7 25f6          	jrult	L3731
3380                     ; 793 					lcd_blink_clear();
3382  03b9 cd0000        	call	_lcd_blink_clear
3384                     ; 794 					_key_blink = 0;
3386  03bc 725f002d      	clr	__key_blink
3387                     ; 795 					_dsCount = 10;
3389  03c0 350a0000      	mov	__dsCount,#10
3390  03c4 cc089c        	jra	L3731
3391  03c7               L7031:
3392                     ; 759 				else if( __sUp == 1 )	
3394  03c7 a101          	cp	a,#1
3395                     ; 761 					if( _key_blink != 1 )
3396                     ; 762 						goto SetupEntry2;
3398  03c9 2704          	jreq	LC014
3399                     ; 764 				else if( __sUp == 2 )	
3401  03cb a102          	cp	a,#2
3402  03cd 26d3          	jrne	L7131
3403                     ; 766 					if( _key_blink != 1 )
3405  03cf               LC014:
3407  03cf c6002d        	ld	a,__key_blink
3408  03d2 4a            	dec	a
3409  03d3 27cd          	jreq	L7131
3410                     ; 767 						goto SetupEntry2;
3411  03d5               L156:
3412                     ; 723 SetupEntry2:				
3412                     ; 724 //				if( __sUp == 0 )		i = bS6;
3412                     ; 725 //				else if( __sUp == 1 )	i = bS7;
3412                     ; 726 //				else					i = bS8;
3412                     ; 727 				lcd_blink_item(i);
3414  03d5 7b04          	ld	a,(OFST+0,sp)
3415  03d7 cd0000        	call	_lcd_blink_item
3417                     ; 728 				disp_status_loop_message(__sUp);
3419  03da c60000        	ld	a,___sUp
3420  03dd cd0000        	call	_disp_status_loop_message
3422                     ; 729 				_dsPrev = 0xff;
3424  03e0 35ff0000      	mov	__dsPrev,#255
3425                     ; 731 				_key_blink = 1;
3427  03e4 3501002d      	mov	__key_blink,#1
3429  03e8 20bf          	jra	L7721
3430  03ea               L5031:
3431                     ; 773 			else if( key == 4 )
3433  03ea a104          	cp	a,#4
3434  03ec 26bb          	jrne	L7721
3435                     ; 775 				if( _key_blink == 1 )
3437  03ee c6002d        	ld	a,__key_blink
3438  03f1 4a            	dec	a
3439                     ; 778 					disp_status_loop_init();
3441                     ; 779 					_key_blink = 0;
3443  03f2 27ae          	jreq	L7131
3444                     ; 783 					__s = 3;
3446  03f4 35030000      	mov	___s,#3
3447                     ; 784 					_dsCount = 0;
3449  03f8 725f0000      	clr	__dsCount
3450                     ; 785 					_dsPrev = 0xff;
3452  03fc 35ff0000      	mov	__dsPrev,#255
3453  0400 20a7          	jra	L7721
3454  0402               L5421:
3455                     ; 799 		else if( _dsCount == 2 )
3457  0402 a102          	cp	a,#2
3458  0404 26be          	jrne	L3731
3459                     ; 801 			_disp_temp = 1;
3461  0406 35010000      	mov	__disp_temp,#1
3462                     ; 802 			if( key == 1 )
3464  040a 7b05          	ld	a,(OFST+1,sp)
3465  040c a101          	cp	a,#1
3466  040e 260a          	jrne	L3531
3467                     ; 804 				__sUp = 0;
3469  0410 725f0000      	clr	___sUp
3470                     ; 805 				_dsCount = 0;
3472  0414 725f0000      	clr	__dsCount
3474  0418 202b          	jra	L3631
3475  041a               L3531:
3476                     ; 807 			else if( key == 2 )
3478  041a a102          	cp	a,#2
3479  041c 2614          	jrne	L7531
3480                     ; 809 				__sDn = __sDn==0 ? 1 : 0;
3482  041e c60000        	ld	a,___sDn
3483  0421 2603          	jrne	L013
3484  0423 4c            	inc	a
3485  0424 2001          	jra	L213
3486  0426               L013:
3487  0426 4f            	clr	a
3488  0427               L213:
3489  0427 c70000        	ld	___sDn,a
3490                     ; 810 				disp_status_loop_messageDn(__sDn);
3492  042a cd0000        	call	_disp_status_loop_messageDn
3494                     ; 811 				disp_status_curr_only();
3496  042d cd0000        	call	_disp_status_curr_only
3499  0430 2013          	jra	L3631
3500  0432               L7531:
3501                     ; 813 			else if( key == 3 )	{	goto SetupEntry;	}
3503  0432 a103          	cp	a,#3
3504  0434 260f          	jrne	L3631
3506  0436               L356:
3507                     ; 751 SetupEntry:				
3507                     ; 752 						if( uiInfo.cntlMode == 0 )
3509  0436 c60003        	ld	a,_uiInfo+3
3510  0439 2703cc039a    	jrne	L3131
3511                     ; 753 							__s = 4;
3513  043e 35040000      	mov	___s,#4
3515  0442 cc039e        	jra	L5131
3516  0445               L3631:
3517                     ; 814 			else if( key == 4 )
3519                     ; 817 			if( uiInfo.enc != 0 )
3521  0445 c60000        	ld	a,_uiInfo
3522  0448 2603cc089c    	jreq	L3731
3523                     ; 819 				__sUp = 0;
3525  044d 725f0000      	clr	___sUp
3526                     ; 820 				_dsCount = 0;
3528  0451 725f0000      	clr	__dsCount
3529  0455 cc089c        	jra	L3731
3530  0458               L147:
3531                     ; 824 	else if( __s == 1 ) // 설정 난방수 모드
3533  0458 a101          	cp	a,#1
3534  045a 2703cc053c    	jrne	L5731
3535                     ; 827 		if( _dsCount == 0 )
3537  045f c60000        	ld	a,__dsCount
3538  0462 263c          	jrne	L7731
3539                     ; 829 			lcd_clear(0);
3541  0464 cd0000        	call	_lcd_clear
3543                     ; 830 			__sInfo = 1;
3545  0467 35010000      	mov	___sInfo,#1
3546                     ; 831 			lcd_disp_info(__sInfo, 0, 0);
3548  046b 4b00          	push	#0
3549  046d ae0100        	ldw	x,#256
3550  0470 cd0000        	call	_lcd_disp_info
3552  0473 84            	pop	a
3553                     ; 832 			UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _boiler_water_heat);
3555  0474 c60000        	ld	a,_debug_br
3556  0477 a5f0          	bcp	a,#240
3557  0479 2603          	jrne	L623
3558  047b 4f            	clr	a
3559  047c 2007          	jra	L033
3560  047e               L623:
3561  047e c60002        	ld	a,__boiler_water_heat
3562  0481 cd08ef        	call	LC021
3563  0484 9f            	ld	a,xl
3564  0485               L033:
3565  0485 cd08e2        	call	LC020
3566  0488 2603          	jrne	L433
3567  048a 4f            	clr	a
3568  048b 2007          	jra	L633
3569  048d               L433:
3570  048d c60002        	ld	a,__boiler_water_heat
3571  0490 cd08ef        	call	LC021
3572  0493 97            	ld	xl,a
3573  0494               L633:
3574  0494 cd08fb        	call	LC023
3576                     ; 834 			lcd_disp_info_shower(0x08, 0);
3579  0497 ae0800        	ldw	x,#2048
3580  049a cd0914        	call	LC026
3581                     ; 838 			_pre_boiler_water_heat = _boiler_water_heat;	
3584  049d cc089c        	jra	L3731
3585  04a0               L7731:
3586                     ; 840 		else if( _dsCount == 1 )
3588  04a0 4a            	dec	a
3589  04a1 26fa          	jrne	L3731
3590                     ; 842 			if( key == KEY_ROOM )		{	EXIT_HOST(0);	}
3592  04a3 7b05          	ld	a,(OFST+1,sp)
3593  04a5 a101          	cp	a,#1
3594  04a7 2605          	jrne	L5041
3597  04a9 cd08d2        	call	LC019
3600  04ac 203e          	jra	L7041
3601  04ae               L5041:
3602                     ; 843 			else if( key == KEY_YB )	{	EXIT_HOST(0);}
3604  04ae a102          	cp	a,#2
3605  04b0 2605          	jrne	L1141
3608  04b2 cd08d2        	call	LC019
3611  04b5 2035          	jra	L7041
3612  04b7               L1141:
3613                     ; 844 			else if( key == KEY_NO )	{	EXIT_HOST(0); }
3615  04b7 a104          	cp	a,#4
3616  04b9 2605          	jrne	L5141
3619  04bb cd08d2        	call	LC019
3622  04be 202c          	jra	L7041
3623  04c0               L5141:
3624                     ; 845 			else if( key == KEY_ONOFF )	{EXIT_HOST(0); __s = 2;}
3626  04c0 a108          	cp	a,#8
3627  04c2 2616          	jrne	L1241
3630  04c4 cd0920        	call	LC027
3634  04c7 4b00          	push	#0
3635  04c9 ae0001        	ldw	x,#1
3636  04cc c60000        	ld	a,___sInfo
3637  04cf 95            	ld	xh,a
3638  04d0 cd0000        	call	_lcd_disp_info
3640  04d3 35020000      	mov	___s,#2
3641  04d7 84            	pop	a
3646  04d8 2012          	jra	L7041
3647  04da               L1241:
3648                     ; 846 			else if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
3650  04da a110          	cp	a,#16
3651  04dc 2606          	jrne	L5241
3654  04de 35400000      	mov	_uiInfo,#64
3656  04e2 2008          	jra	L7041
3657  04e4               L5241:
3658                     ; 847 			else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
3660  04e4 a120          	cp	a,#32
3661  04e6 2604          	jrne	L7041
3664  04e8 35010000      	mov	_uiInfo,#1
3665  04ec               L7041:
3666                     ; 849 			i = _boiler_water_heat;
3668  04ec c60002        	ld	a,__boiler_water_heat
3669  04ef 6b04          	ld	(OFST+0,sp),a
3670                     ; 850 			if( uiInfo.enc != 0 )
3672  04f1 725d0000      	tnz	_uiInfo
3673  04f5 2706          	jreq	L3341
3674                     ; 852 				_boiler_water_heat = ENC_MOVE_0_HEAT(i);
3676  04f7 cd0000        	call	_ENC_MOVE_0_HEAT
3678  04fa c70002        	ld	__boiler_water_heat,a
3679  04fd               L3341:
3680                     ; 854 			if( _dsPrev != i )
3682  04fd c60000        	ld	a,__dsPrev
3683  0500 1104          	cp	a,(OFST+0,sp)
3684  0502 2728          	jreq	L5341
3685                     ; 857 				_dsPrev = i;
3687  0504 7b04          	ld	a,(OFST+0,sp)
3688  0506 c70000        	ld	__dsPrev,a
3689                     ; 858 				UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _dsPrev);
3691  0509 c60000        	ld	a,_debug_br
3692  050c a5f0          	bcp	a,#240
3693  050e 2603          	jrne	L663
3694  0510 4f            	clr	a
3695  0511 2007          	jra	L073
3696  0513               L663:
3697  0513 c60000        	ld	a,__dsPrev
3698  0516 cd08ef        	call	LC021
3699  0519 9f            	ld	a,xl
3700  051a               L073:
3701  051a cd08e2        	call	LC020
3702  051d 2603          	jrne	L473
3703  051f 4f            	clr	a
3704  0520 2007          	jra	L673
3705  0522               L473:
3706  0522 c60000        	ld	a,__dsPrev
3707  0525 cd08ef        	call	LC021
3708  0528 97            	ld	xl,a
3709  0529               L673:
3710  0529 cd08fb        	call	LC023
3713  052c               L5341:
3714                     ; 861 			if( _key_min == KEY_BOILER_FADE )
3716  052c c60000        	ld	a,__key_min
3717  052f a10a          	cp	a,#10
3718  0531 2703cc089c    	jrne	L3731
3719                     ; 864 				EXIT_HOST(0);
3721  0536 cd08d2        	call	LC019
3723  0539 cc089c        	jra	L3731
3724  053c               L5731:
3725                     ; 868 	else if( __s == 2 ) // 설정 온수 모드
3727  053c a102          	cp	a,#2
3728  053e 2703cc062d    	jrne	L3441
3729                     ; 871 		if( _dsCount == 0 )
3731  0543 c60000        	ld	a,__dsCount
3732  0546 2644          	jrne	L5441
3733                     ; 873 			lcd_clear(0);
3735  0548 cd0000        	call	_lcd_clear
3737                     ; 874 			__sInfo = 2;
3739  054b 35020000      	mov	___sInfo,#2
3740                     ; 875 			lcd_disp_info(__sInfo, 0, 0);
3742  054f 4b00          	push	#0
3743  0551 ae0200        	ldw	x,#512
3744  0554 cd0000        	call	_lcd_disp_info
3746  0557 84            	pop	a
3747                     ; 876 			UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _boiler_water_shower);
3749  0558 c60000        	ld	a,_debug_br
3750  055b a5f0          	bcp	a,#240
3751  055d 2603          	jrne	L214
3752  055f 4f            	clr	a
3753  0560 2007          	jra	L414
3754  0562               L214:
3755  0562 c60001        	ld	a,__boiler_water_shower
3756  0565 cd08ef        	call	LC021
3757  0568 9f            	ld	a,xl
3758  0569               L414:
3759  0569 cd08e2        	call	LC020
3760  056c 2603          	jrne	L024
3761  056e 4f            	clr	a
3762  056f 2007          	jra	L224
3763  0571               L024:
3764  0571 c60001        	ld	a,__boiler_water_shower
3765  0574 cd08ef        	call	LC021
3766  0577 97            	ld	xl,a
3767  0578               L224:
3768  0578 cd08fb        	call	LC023
3770                     ; 878 			lcd_disp_info_shower(0x80, 0);
3773  057b ae8000        	ldw	x,#32768
3774  057e cd0914        	call	LC026
3775                     ; 882 			__boiler_shower[4] = 0;
3777  0581 725f000f      	clr	___boiler_shower+4
3778                     ; 883 			__boiler_shower[5] = 1;
3780  0585 35010010      	mov	___boiler_shower+5,#1
3781                     ; 885 			_pre_boiler_water_shower = _boiler_water_shower;
3784  0589 cc089c        	jra	L3731
3785  058c               L5441:
3786                     ; 887 		else if( _dsCount == 1 )
3788  058c 4a            	dec	a
3789  058d 26fa          	jrne	L3731
3790                     ; 889 			if( key == KEY_ROOM )		{	goto RETURN_ENTRY;	}
3792  058f 7b05          	ld	a,(OFST+1,sp)
3793  0591 a101          	cp	a,#1
3794  0593 276c          	jreq	L556
3797                     ; 890 			else if( key == KEY_YB )	{	goto RETURN_ENTRY;	}
3799  0595 a102          	cp	a,#2
3800  0597 2768          	jreq	L556
3803                     ; 891 			else if( key == KEY_NO )	{goto RETURN_ENTRY;}
3805  0599 a104          	cp	a,#4
3806  059b 2764          	jreq	L556
3809                     ; 892 			else if( key == KEY_ONOFF )	{	//file_update2(0);
3811  059d a108          	cp	a,#8
3812  059f 2760          	jreq	L556
3813                     ; 893 																		goto RETURN_ENTRY;
3815                     ; 899 			else if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
3817  05a1 a110          	cp	a,#16
3818  05a3 2606          	jrne	L3741
3821  05a5 35400000      	mov	_uiInfo,#64
3823  05a9 2008          	jra	L5541
3824  05ab               L3741:
3825                     ; 900 			else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
3827  05ab a120          	cp	a,#32
3828  05ad 2604          	jrne	L5541
3831  05af 35010000      	mov	_uiInfo,#1
3832  05b3               L5541:
3833                     ; 902 			i = _boiler_water_shower;
3835  05b3 c60001        	ld	a,__boiler_water_shower
3836  05b6 6b04          	ld	(OFST+0,sp),a
3837                     ; 903 			if( uiInfo.enc != 0 )
3839  05b8 725d0000      	tnz	_uiInfo
3840  05bc 2706          	jreq	L1051
3841                     ; 905 				_boiler_water_shower = ENC_MOVE_0_SHOWER(i);
3843  05be cd0000        	call	_ENC_MOVE_0_SHOWER
3845  05c1 c70001        	ld	__boiler_water_shower,a
3846  05c4               L1051:
3847                     ; 907 			if( _dsPrev != i )
3849  05c4 c60000        	ld	a,__dsPrev
3850  05c7 1104          	cp	a,(OFST+0,sp)
3851  05c9 2728          	jreq	L3051
3852                     ; 910 				_dsPrev = i;
3854  05cb 7b04          	ld	a,(OFST+0,sp)
3855  05cd c70000        	ld	__dsPrev,a
3856                     ; 911 				UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _dsPrev);
3858  05d0 c60000        	ld	a,_debug_br
3859  05d3 a5f0          	bcp	a,#240
3860  05d5 2603          	jrne	L234
3861  05d7 4f            	clr	a
3862  05d8 2007          	jra	L434
3863  05da               L234:
3864  05da c60000        	ld	a,__dsPrev
3865  05dd cd08ef        	call	LC021
3866  05e0 9f            	ld	a,xl
3867  05e1               L434:
3868  05e1 cd08e2        	call	LC020
3869  05e4 2603          	jrne	L044
3870  05e6 4f            	clr	a
3871  05e7 2007          	jra	L244
3872  05e9               L044:
3873  05e9 c60000        	ld	a,__dsPrev
3874  05ec cd08ef        	call	LC021
3875  05ef 97            	ld	xl,a
3876  05f0               L244:
3877  05f0 cd08fb        	call	LC023
3880  05f3               L3051:
3881                     ; 914 			if (__boiler_shower[5] == 0x80 ) {
3883  05f3 c60010        	ld	a,___boiler_shower+5
3884  05f6 a180          	cp	a,#128
3885  05f8 2707          	jreq	L556
3886                     ; 915 				goto RETURN_ENTRY;
3888                     ; 918 			if( _key_min == KEY_BOILER_FADE )
3890  05fa c60000        	ld	a,__key_min
3891  05fd a10a          	cp	a,#10
3892  05ff 2688          	jrne	L3731
3893  0601               L556:
3894                     ; 920 RETURN_ENTRY:
3894                     ; 921 
3894                     ; 922 				if (_pre_boiler_water_heat != _boiler_water_heat) {
3896  0601 7b03          	ld	a,(OFST-1,sp)
3897  0603 c10002        	cp	a,__boiler_water_heat
3898  0606 270a          	jreq	L1151
3899                     ; 923 					FW_B_HEAT(_boiler_water_heat);
3901  0608 c60002        	ld	a,__boiler_water_heat
3902  060b 97            	ld	xl,a
3903  060c a626          	ld	a,#38
3904  060e 95            	ld	xh,a
3905  060f cd0000        	call	_file_write
3907  0612               L1151:
3908                     ; 926 				if (_pre_boiler_water_shower != _boiler_water_shower) {
3910  0612 7b02          	ld	a,(OFST-2,sp)
3911  0614 c10001        	cp	a,__boiler_water_shower
3912  0617 270a          	jreq	L3151
3913                     ; 927 					FW_B_SHOWER(_boiler_water_shower);
3915  0619 c60001        	ld	a,__boiler_water_shower
3916  061c 97            	ld	xl,a
3917  061d a625          	ld	a,#37
3918  061f 95            	ld	xh,a
3919  0620 cd0000        	call	_file_write
3921  0623               L3151:
3922                     ; 931 				__boiler_shower[5] = 0;
3924  0623 725f0010      	clr	___boiler_shower+5
3925                     ; 932 				EXIT_HOST(0);
3927  0627 cd08d2        	call	LC019
3929  062a cc089c        	jra	L3731
3930  062d               L3441:
3931                     ; 936 	else if( __s == 4 )
3933  062d a104          	cp	a,#4
3934  062f 27f9          	jreq	L3731
3936                     ; 950 	} else if (__s == 5){
3938  0631 a105          	cp	a,#5
3939  0633 2658          	jrne	L3251
3940                     ; 951 		__sUp = 0;
3942  0635 725f0000      	clr	___sUp
3943                     ; 953 		switch (_disp_mode) {
3945  0639 c60005        	ld	a,__disp_mode
3947                     ; 958 		case 0x10:	__sUp = 2;	break;
3948  063c 4a            	dec	a
3949  063d 2711          	jreq	L756
3950  063f 4a            	dec	a
3951  0640 2713          	jreq	L166
3952  0642 a002          	sub	a,#2
3953  0644 2715          	jreq	L366
3954  0646 a004          	sub	a,#4
3955  0648 2717          	jreq	L566
3956  064a a008          	sub	a,#8
3957  064c 2719          	jreq	L766
3958  064e 201b          	jra	L7251
3959  0650               L756:
3960                     ; 954 		case 0x01:	__sUp = 0;	break;
3962  0650 c70000        	ld	___sUp,a
3965  0653 2016          	jra	L7251
3966  0655               L166:
3967                     ; 955 		case 0x02:	__sUp = 3;	break;
3969  0655 35030000      	mov	___sUp,#3
3972  0659 2010          	jra	L7251
3973  065b               L366:
3974                     ; 956 		case 0x04:	__sUp = 4;	break;
3976  065b 35040000      	mov	___sUp,#4
3979  065f 200a          	jra	L7251
3980  0661               L566:
3981                     ; 957 		case 0x08:	__sUp = 1;	break;
3983  0661 35010000      	mov	___sUp,#1
3986  0665 2004          	jra	L7251
3987  0667               L766:
3988                     ; 958 		case 0x10:	__sUp = 2;	break;
3990  0667 35020000      	mov	___sUp,#2
3993  066b               L7251:
3994                     ; 960 		__sDn = 0xff;
3996  066b 35ff0000      	mov	___sDn,#255
3997                     ; 961 		disp_status_loop_init();
3999  066f cd0000        	call	_disp_status_loop_init
4001                     ; 962 		_dsCount = 1;
4003  0672 35010000      	mov	__dsCount,#1
4004                     ; 963 		__s = 0;
4006  0676 725f0000      	clr	___s
4007                     ; 964 		_key_blink = 1;
4009  067a 3501002d      	mov	__key_blink,#1
4010                     ; 965 		_key_sec = _key_min = _key_hour = 0;
4012  067e 725f0000      	clr	__key_hour
4013  0682 725f0000      	clr	__key_min
4014  0686 725f0000      	clr	__key_sec
4016  068a cc089c        	jra	L3731
4017  068d               L3251:
4018                     ; 967 	else if( __s == 101 )// remote
4020  068d a165          	cp	a,#101
4021  068f 26f9          	jrne	L3731
4022                     ; 969 		if( _dsCount == 0 )
4024  0691 c60000        	ld	a,__dsCount
4025  0694 2664          	jrne	L5351
4026                     ; 971 			lcd_clear(0);
4028  0696 cd0000        	call	_lcd_clear
4030                     ; 972 			_remote = 1;
4032  0699 35010004      	mov	__remote,#1
4033                     ; 974 			j = uiInfo.cnt + uiInfo.cnt_sub;
4035  069d c60005        	ld	a,_uiInfo+5
4036  06a0 cb0006        	add	a,_uiInfo+6
4037  06a3 6b04          	ld	(OFST+0,sp),a
4038                     ; 975 			__sRoom = (uiInfo.id_rc + 1) % j;
4040  06a5 c60001        	ld	a,_uiInfo+1
4042  06a8               L176:
4043  06a8 5f            	clrw	x
4044  06a9 97            	ld	xl,a
4045  06aa 5c            	incw	x
4046  06ab 7b04          	ld	a,(OFST+0,sp)
4047  06ad 905f          	clrw	y
4048  06af 9097          	ld	yl,a
4049  06b1 cd0000        	call	c_idiv
4050  06b4 93            	ldw	x,y
4051  06b5 cd0907        	call	LC025
4052  06b8 2605          	jrne	L7351
4053                     ; 979 				__sRoom = (__sRoom + 1) % j;
4055  06ba c60000        	ld	a,___sRoom
4057                     ; 980 				goto _OneMore2;
4059  06bd 20e9          	jra	L176
4060  06bf               L7351:
4061                     ; 983 			j = __sRoom;
4063                     ; 984 _RemoteEntry:
4063                     ; 985 			if( __sRoom == uiInfo.id_rc )
4065  06bf c60000        	ld	a,___sRoom
4066  06c2 c10001        	cp	a,_uiInfo+1
4067  06c5 2612          	jrne	L1451
4068  06c7               L576:
4069                     ; 987 _RemoteExit:				
4069                     ; 988 				_remote = 0;
4071  06c7 725f0004      	clr	__remote
4072                     ; 989 				__s = 0;
4074  06cb 725f0000      	clr	___s
4075                     ; 990 				_dsCount = 0;
4077  06cf 725f0000      	clr	__dsCount
4078                     ; 991 				lcd_blink_clear();
4080  06d3 cd0000        	call	_lcd_blink_clear
4082                     ; 992 				return;
4084  06d6 cc08cf        	jra	L1102
4085  06d9               L1451:
4086                     ; 994 			lcd_clear_rid();
4088  06d9 cd0000        	call	_lcd_clear_rid
4090                     ; 995 			lcd_blink_itemRoom(__sRoom, 1);
4092  06dc ae0001        	ldw	x,#1
4093  06df c60000        	ld	a,___sRoom
4094  06e2 95            	ld	xh,a
4095  06e3 cd0000        	call	_lcd_blink_itemRoom
4097                     ; 996 			disp_status_remote_message(REMOTE_MODE); //모드 변경
4099  06e6 c60000        	ld	a,___sRoom
4100  06e9 cd08f5        	call	LC022
4101  06ec cd0000        	call	_disp_status_remote_message
4103                     ; 997 			_dsCount = 1;
4105  06ef 35010000      	mov	__dsCount,#1
4106                     ; 998 			_subRemote = 1;
4108  06f3 35010000      	mov	__subRemote,#1
4110  06f7 cc089c        	jra	L3731
4111  06fa               L5351:
4112                     ; 1000 		else if( _dsCount == 1 )//remote 첫화면
4114  06fa a101          	cp	a,#1
4115  06fc 2703cc0886    	jrne	L5451
4116                     ; 1002 			if ( key == KEY_PLUS) 
4118  0701 7b05          	ld	a,(OFST+1,sp)
4119  0703 a110          	cp	a,#16
4120  0705 2606          	jrne	L7451
4121                     ; 1004 				uiInfo.enc = ENC_UP;
4123  0707 35400000      	mov	_uiInfo,#64
4125  070b 2008          	jra	L1551
4126  070d               L7451:
4127                     ; 1006 			else if ( key == KEY_MINUS) 
4129  070d a120          	cp	a,#32
4130  070f 2604          	jrne	L1551
4131                     ; 1008 				uiInfo.enc = ENC_DN;
4133  0711 35010000      	mov	_uiInfo,#1
4134  0715               L1551:
4135                     ; 1011 			j = __sRoom;
4137  0715 c60000        	ld	a,___sRoom
4138  0718 6b04          	ld	(OFST+0,sp),a
4139                     ; 1012 			if( REMOTE_MODEi(j) == 0x01 )		{	_subRemote = 1; disp_status_loop_remote_N(j);	}
4141  071a cd08f5        	call	LC022
4142  071d 4a            	dec	a
4143  071e 260b          	jrne	L5551
4146  0720 35010000      	mov	__subRemote,#1
4149  0724 7b04          	ld	a,(OFST+0,sp)
4150  0726 cd0000        	call	_disp_status_loop_remote_N
4153  0729 204e          	jra	L7551
4154  072b               L5551:
4155                     ; 1013 			else if( REMOTE_MODEi(j) == 0x08 )	{	_subRemote = 8;	disp_status_loop_remote_Y(j);	}
4157  072b 7b04          	ld	a,(OFST+0,sp)
4158  072d cd08f5        	call	LC022
4159  0730 a108          	cp	a,#8
4160  0732 260b          	jrne	L1651
4163  0734 35080000      	mov	__subRemote,#8
4166  0738 7b04          	ld	a,(OFST+0,sp)
4167  073a cd0000        	call	_disp_status_loop_remote_Y
4170  073d 203a          	jra	L7551
4171  073f               L1651:
4172                     ; 1014 			else if( REMOTE_MODEi(j) == 0x10 )	{	_subRemote = 10; disp_status_loop_remote_B(j);	}
4174  073f 7b04          	ld	a,(OFST+0,sp)
4175  0741 cd08f5        	call	LC022
4176  0744 a110          	cp	a,#16
4177  0746 260b          	jrne	L5651
4180  0748 350a0000      	mov	__subRemote,#10
4183  074c 7b04          	ld	a,(OFST+0,sp)
4184  074e cd0000        	call	_disp_status_loop_remote_B
4187  0751 2026          	jra	L7551
4188  0753               L5651:
4189                     ; 1015 			else if( REMOTE_MODEi(j) == 0x04 )	{	_subRemote = 4; disp_status_loop_remote_J(j);	}
4191  0753 7b04          	ld	a,(OFST+0,sp)
4192  0755 cd08f5        	call	LC022
4193  0758 a104          	cp	a,#4
4194  075a 260b          	jrne	L1751
4197  075c 35040000      	mov	__subRemote,#4
4200  0760 7b04          	ld	a,(OFST+0,sp)
4201  0762 cd0000        	call	_disp_status_loop_remote_J
4204  0765 2012          	jra	L7551
4205  0767               L1751:
4206                     ; 1016 			else if( REMOTE_MODEi(j) == 0x02 )	{	_subRemote = 2; disp_status_loop_remote_O(j);	}
4208  0767 7b04          	ld	a,(OFST+0,sp)
4209  0769 cd08f5        	call	LC022
4210  076c a102          	cp	a,#2
4211  076e 2609          	jrne	L7551
4214  0770 35020000      	mov	__subRemote,#2
4217  0774 7b04          	ld	a,(OFST+0,sp)
4218  0776 cd0000        	call	_disp_status_loop_remote_O
4220  0779               L7551:
4221                     ; 1018 			if (_subRemote == 1) // remote 난방  
4223  0779 c60000        	ld	a,__subRemote
4224  077c a101          	cp	a,#1
4225  077e 2633          	jrne	L7751
4226                     ; 1020 				if( key == KEY_ROOM )	
4228  0780 7b05          	ld	a,(OFST+1,sp)
4229  0782 a101          	cp	a,#1
4230                     ; 1022 					_dsCount = 2;
4232  0784 2737          	jreq	LC017
4233                     ; 1024 				else if( key == KEY_YB )
4235  0786 a102          	cp	a,#2
4236  0788 2609          	jrne	L5061
4237                     ; 1027 					REMOTE_MODEi(j) = 0x08;
4239  078a 7b04          	ld	a,(OFST+0,sp)
4240  078c 5f            	clrw	x
4241  078d 97            	ld	xl,a
4242  078e a608          	ld	a,#8
4244  0790 cc0879        	jp	LC015
4245  0793               L5061:
4246                     ; 1030 				else if( key == KEY_NO )
4248  0793 a104          	cp	a,#4
4249  0795 2612          	jrne	L1161
4250                     ; 1033 					uiInfo.tempSetup[j] = 20;
4252  0797 7b04          	ld	a,(OFST+0,sp)
4253  0799 5f            	clrw	x
4254  079a 97            	ld	xl,a
4255  079b a614          	ld	a,#20
4256  079d d7003d        	ld	(_uiInfo+61,x),a
4257                     ; 1034 					REMOTE_MODEi(j) = 0x02;
4259  07a0 5f            	clrw	x
4260  07a1 7b04          	ld	a,(OFST+0,sp)
4261  07a3 97            	ld	xl,a
4262  07a4 a602          	ld	a,#2
4264  07a6 cc0879        	jp	LC015
4265  07a9               L1161:
4266                     ; 1037 				else if( key == KEY_ONOFF )	
4268  07a9 a108          	cp	a,#8
4269  07ab 2703cc087c    	jrne	L5671
4270                     ; 1039 					_dsPrev = 0xff;
4271                     ; 1040 					REMOTE_MODEi(j) = 0x04;
4273  07b0 cc086f        	jp	LC016
4274                     ; 1050 				else if ( key == KEY_PLUS) {}
4277                     ; 1051 				else if ( key == KEY_MINUS) {}
4279  07b3               L7751:
4280                     ; 1053 			else if (_subRemote == 8) // remote 예약
4282  07b3 a108          	cp	a,#8
4283  07b5 2631          	jrne	L1361
4284                     ; 1055 				if( key == KEY_ROOM )	
4286  07b7 7b05          	ld	a,(OFST+1,sp)
4287  07b9 a101          	cp	a,#1
4288  07bb 2607          	jrne	L3361
4289                     ; 1057 					_dsCount = 2;
4291  07bd               LC017:
4296  07bd 35020000      	mov	__dsCount,#2
4298  07c1 cc087c        	jra	L5671
4299  07c4               L3361:
4300                     ; 1059 				else if( key == KEY_YB )
4302  07c4 a102          	cp	a,#2
4303  07c6 260d          	jrne	L7361
4304                     ; 1061 					_dsPrev = 0xff;
4306  07c8 35ff0000      	mov	__dsPrev,#255
4307                     ; 1063 					REMOTE_MODEi(j) = 0x10;
4309  07cc 5f            	clrw	x
4310  07cd 7b04          	ld	a,(OFST+0,sp)
4311  07cf 97            	ld	xl,a
4312  07d0 a610          	ld	a,#16
4314  07d2 cc0879        	jp	LC015
4315  07d5               L7361:
4316                     ; 1066 				else if( key == KEY_NO )
4318  07d5 a104          	cp	a,#4
4319  07d7 2608          	jrne	L3461
4320                     ; 1069 					REMOTE_MODEi(j) = 0x01;
4322  07d9 7b04          	ld	a,(OFST+0,sp)
4323  07db cd0902        	call	LC024
4325  07de cc0879        	jp	LC015
4326  07e1               L3461:
4327                     ; 1072 				else if( key == KEY_ONOFF )	
4329  07e1 a108          	cp	a,#8
4330  07e3 26dc          	jrne	L5671
4331                     ; 1074 					_dsPrev = 0xff;
4332                     ; 1075 					REMOTE_MODEi(j) = 0x04;
4334  07e5 cc086f        	jp	LC016
4335                     ; 1077 				else if ( key == KEY_PLUS) {}
4338                     ; 1078 				else if ( key == KEY_MINUS) {}
4340  07e8               L1361:
4341                     ; 1080 			else if (_subRemote == 10) // remote 반복
4343  07e8 a10a          	cp	a,#10
4344  07ea 2627          	jrne	L3661
4345                     ; 1082 				if( key == KEY_ROOM )	
4347  07ec 7b05          	ld	a,(OFST+1,sp)
4348  07ee a101          	cp	a,#1
4349                     ; 1084 					_dsCount = 2;
4351  07f0 27cb          	jreq	LC017
4352                     ; 1086 				else if( key == KEY_YB )
4354  07f2 a102          	cp	a,#2
4355  07f4 260c          	jrne	L1761
4356                     ; 1088 					_dsPrev = 0xff;
4358  07f6 35ff0000      	mov	__dsPrev,#255
4359                     ; 1090 					REMOTE_MODEi(j) = 0x08;
4361  07fa 5f            	clrw	x
4362  07fb 7b04          	ld	a,(OFST+0,sp)
4363  07fd 97            	ld	xl,a
4364  07fe a608          	ld	a,#8
4366  0800 2077          	jp	LC015
4367  0802               L1761:
4368                     ; 1093 				else if( key == KEY_NO )
4370  0802 a104          	cp	a,#4
4371  0804 2607          	jrne	L5761
4372                     ; 1096 					REMOTE_MODEi(j) = 0x01;
4374  0806 7b04          	ld	a,(OFST+0,sp)
4375  0808 cd0902        	call	LC024
4377  080b 206c          	jp	LC015
4378  080d               L5761:
4379                     ; 1099 				else if( key == KEY_ONOFF )	
4381  080d a108          	cp	a,#8
4382  080f 266b          	jrne	L5671
4383                     ; 1101 					_dsPrev = 0xff;
4384                     ; 1102 					REMOTE_MODEi(j) = 0x04;
4386  0811 205c          	jp	LC016
4387                     ; 1104 				else if ( key == KEY_PLUS) {}
4390                     ; 1105 				else if ( key == KEY_MINUS) {}
4392  0813               L3661:
4393                     ; 1107 			else if (_subRemote == 4) // remote 정지
4395  0813 a104          	cp	a,#4
4396  0815 262c          	jrne	L5171
4397                     ; 1109 				if( key == KEY_ROOM )	
4399  0817 7b05          	ld	a,(OFST+1,sp)
4400  0819 a101          	cp	a,#1
4401                     ; 1111 					_dsCount = 2;
4403  081b 27a0          	jreq	LC017
4404                     ; 1113 				else if( key == KEY_YB )
4406  081d a102          	cp	a,#2
4407  081f 260c          	jrne	L3271
4408                     ; 1115 					_dsPrev = 0xff;
4410  0821 35ff0000      	mov	__dsPrev,#255
4411                     ; 1117 					REMOTE_MODEi(j) = 0x08;
4413  0825 5f            	clrw	x
4414  0826 7b04          	ld	a,(OFST+0,sp)
4415  0828 97            	ld	xl,a
4416  0829 a608          	ld	a,#8
4418  082b 204c          	jp	LC015
4419  082d               L3271:
4420                     ; 1120 				else if( key == KEY_NO )
4422  082d a104          	cp	a,#4
4423  082f 2607          	jrne	L7271
4424                     ; 1123 					REMOTE_MODEi(j) = 0x01;
4426  0831 7b04          	ld	a,(OFST+0,sp)
4427  0833 cd0902        	call	LC024
4429  0836 2041          	jp	LC015
4430  0838               L7271:
4431                     ; 1126 				else if( key == KEY_ONOFF )	
4433  0838 a108          	cp	a,#8
4434  083a 2640          	jrne	L5671
4435                     ; 1128 					REMOTE_MODEi(j) = 0x01;
4437  083c 7b04          	ld	a,(OFST+0,sp)
4438  083e cd0902        	call	LC024
4440  0841 2036          	jp	LC015
4441                     ; 1130 				else if ( key == KEY_PLUS) {}
4444                     ; 1131 				else if ( key == KEY_MINUS) {}
4446  0843               L5171:
4447                     ; 1133 			else if (_subRemote == 2) // remote 외출
4449  0843 a102          	cp	a,#2
4450  0845 2635          	jrne	L5671
4451                     ; 1135 				if( key == KEY_ROOM )	
4453  0847 7b05          	ld	a,(OFST+1,sp)
4454  0849 a101          	cp	a,#1
4455                     ; 1137 					_dsCount = 2;
4457  084b 2603cc07bd    	jreq	LC017
4458                     ; 1139 				else if( key == KEY_YB )
4460  0850 a102          	cp	a,#2
4461  0852 260c          	jrne	L5571
4462                     ; 1142 					_dsPrev = 0xff;
4464  0854 35ff0000      	mov	__dsPrev,#255
4465                     ; 1143 					REMOTE_MODEi(j) = 0x08;
4467  0858 5f            	clrw	x
4468  0859 7b04          	ld	a,(OFST+0,sp)
4469  085b 97            	ld	xl,a
4470  085c a608          	ld	a,#8
4472  085e 2019          	jp	LC015
4473  0860               L5571:
4474                     ; 1146 				else if( key == KEY_NO )
4476  0860 a104          	cp	a,#4
4477  0862 2607          	jrne	L1671
4478                     ; 1149 					REMOTE_MODEi(j) = 0x01;
4480  0864 7b04          	ld	a,(OFST+0,sp)
4481  0866 cd0902        	call	LC024
4483  0869 200e          	jp	LC015
4484  086b               L1671:
4485                     ; 1152 				else if( key == KEY_ONOFF )	
4487  086b a108          	cp	a,#8
4488  086d 260d          	jrne	L5671
4489                     ; 1154 					_dsPrev = 0xff;
4491                     ; 1155 					REMOTE_MODEi(j) = 0x04;
4493  086f               LC016:
4497  086f 35ff0000      	mov	__dsPrev,#255
4501  0873 5f            	clrw	x
4502  0874 7b04          	ld	a,(OFST+0,sp)
4503  0876 97            	ld	xl,a
4504  0877 a604          	ld	a,#4
4505  0879               LC015:
4506  0879 d70045        	ld	(_uiInfo+69,x),a
4508  087c               L5671:
4509                     ; 1157 				else if ( key == KEY_PLUS) {}
4512                     ; 1158 				else if ( key == KEY_MINUS) {}
4514                     ; 1161 			if( _key_min == KEY_BLINK_FADE )
4516  087c c60000        	ld	a,__key_min
4517  087f a10a          	cp	a,#10
4518  0881 2619          	jrne	L3731
4519                     ; 1163 				goto _RemoteExit;
4521  0883 cc06c7        	jra	L576
4522  0886               L5451:
4523                     ; 1166 		else if (_dsCount == 2) 
4525  0886 a102          	cp	a,#2
4526  0888 2612          	jrne	L3731
4527  088a               L776:
4528                     ; 1168 _OneMore:			
4528                     ; 1169 			j = 8;
4530                     ; 1170 			__sRoom = (__sRoom + 1) % j;
4532  088a c60000        	ld	a,___sRoom
4533  088d 5f            	clrw	x
4534  088e 97            	ld	xl,a
4535  088f 5c            	incw	x
4536  0890 a608          	ld	a,#8
4537  0892 cd0000        	call	c_smodx
4539  0895 ad70          	call	LC025
4540  0897 27f1          	jreq	L776
4541                     ; 1173 				goto _OneMore;
4543                     ; 1175 			if( __sRoom != 0 ) {
4545                     ; 1177 				j = __sRoom - 1;
4547  0899 cc06bf        	jra	L7351
4548  089c               L3731:
4549                     ; 1202 	if (packet_changed == 1) {
4551  089c c60000        	ld	a,_packet_changed
4552  089f 4a            	dec	a
4553  08a0 262d          	jrne	L1102
4554                     ; 1203 		__s = 0;
4556  08a2 c70000        	ld	___s,a
4557                     ; 1204 		_dsCount = 10;
4559  08a5 350a0000      	mov	__dsCount,#10
4560                     ; 1205 		switch (_disp_mode2) {
4562  08a9 c60006        	ld	a,__disp_mode2
4564                     ; 1209 			case 0x40:	__sUp = 5;	break;
4565  08ac 4a            	dec	a
4566  08ad 270d          	jreq	L107
4567  08af 4a            	dec	a
4568  08b0 270f          	jreq	L307
4569  08b2 a002          	sub	a,#2
4570  08b4 2711          	jreq	L507
4571  08b6 a03c          	sub	a,#60
4572  08b8 270d          	jreq	L507
4573  08ba 200f          	jra	L5102
4574  08bc               L107:
4575                     ; 1206 			case 0x01:	_dsCount = 0;	break;
4577  08bc c70000        	ld	__dsCount,a
4580  08bf 200a          	jra	L5102
4581  08c1               L307:
4582                     ; 1207 			case 0x02:  __sUp = 16;  break;
4584  08c1 35100000      	mov	___sUp,#16
4587  08c5 2004          	jra	L5102
4588  08c7               L507:
4589                     ; 1208 			case 0x04:  __sUp = 5;	break;
4592                     ; 1209 			case 0x40:	__sUp = 5;	break;
4595  08c7 35050000      	mov	___sUp,#5
4598  08cb               L5102:
4599                     ; 1211 		packet_changed = 0;
4601  08cb 725f0000      	clr	_packet_changed
4602  08cf               L1102:
4603                     ; 1213 }
4606  08cf 5b05          	addw	sp,#5
4607  08d1 81            	ret	
4608  08d2               LC019:
4609  08d2 ad4c          	call	LC027
4611                     ; 842 			if( key == KEY_ROOM )		{	EXIT_HOST(0);	}
4613  08d4 4b00          	push	#0
4614  08d6 ae0001        	ldw	x,#1
4615  08d9 c60000        	ld	a,___sInfo
4616  08dc 95            	ld	xh,a
4617  08dd cd0000        	call	_lcd_disp_info
4619  08e0 84            	pop	a
4620  08e1 81            	ret	
4621  08e2               LC020:
4622  08e2 97            	ld	xl,a
4623  08e3 a602          	ld	a,#2
4624  08e5 95            	ld	xh,a
4625  08e6 cd0000        	call	_lcd_disp_n
4627                     ; 832 			UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _boiler_water_heat);
4629  08e9 c60000        	ld	a,_debug_br
4630  08ec a5f0          	bcp	a,#240
4631  08ee 81            	ret	
4632  08ef               LC021:
4633  08ef 5f            	clrw	x
4634  08f0 97            	ld	xl,a
4635  08f1 a60a          	ld	a,#10
4636  08f3 62            	div	x,a
4637  08f4 81            	ret	
4638  08f5               LC022:
4639  08f5 5f            	clrw	x
4640  08f6 97            	ld	xl,a
4641  08f7 d60045        	ld	a,(_uiInfo+69,x)
4642  08fa 81            	ret	
4643  08fb               LC023:
4644  08fb 97            	ld	xl,a
4645  08fc a603          	ld	a,#3
4646  08fe 95            	ld	xh,a
4647  08ff cc0000        	jp	_lcd_disp_n
4648  0902               LC024:
4649  0902 5f            	clrw	x
4650  0903 97            	ld	xl,a
4651  0904 a601          	ld	a,#1
4652  0906 81            	ret	
4653  0907               LC025:
4654  0907 01            	rrwa	x,a
4655  0908 c70000        	ld	___sRoom,a
4656                     ; 976 _OneMore2:			
4656                     ; 977 			if( packet_buf[__sRoom] == ui_timeout )
4658  090b 5f            	clrw	x
4659  090c 97            	ld	xl,a
4660  090d d60000        	ld	a,(_packet_buf,x)
4661  0910 c10000        	cp	a,_ui_timeout
4662  0913 81            	ret	
4663  0914               LC026:
4664  0914 cd0000        	call	_lcd_disp_info_shower
4666                     ; 879 			_dsCount = 1;
4668  0917 35010000      	mov	__dsCount,#1
4669                     ; 880 			_dsPrev = 0xff;
4671  091b 35ff0000      	mov	__dsPrev,#255
4672  091f 81            	ret	
4673  0920               LC027:
4674  0920 725f0000      	clr	___s
4675                     ; 842 			if( key == KEY_ROOM )		{	EXIT_HOST(0);	}
4677  0924 725f0000      	clr	__dsCount
4680  0928 35ff0000      	mov	__dsPrev,#255
4683  092c cc0000        	jp	_lcd_blink_clear
4806                     	switch	.bss
4807  0000               __key_time_event:
4808  0000 000000        	ds.b	3
4809                     	xdef	__key_time_event
4810                     	xref	_func_rc_setting
4811                     	xdef	_disp_rid_info
4812                     	xref	_ui_timeout
4813                     	xref	_packet_buf
4814                     	xdef	_disp_status_loop_host_Out_Long
4815                     	xdef	_disp_status_loop_host_Out
4816                     	xdef	_disp_status_loop_host_Off
4817                     	xdef	_disp_status_loop_remote_B
4818                     	xdef	_disp_status_loop_remote_O
4819                     	xdef	_disp_status_loop_remote_J
4820                     	xdef	_disp_status_loop_remote_Y
4821                     	xdef	_disp_status_loop_remote_N
4822                     	xdef	_disp_status_remote_message
4823                     	xdef	_ENC_MOVE_0_HEAT
4824                     	xdef	_ENC_MOVE_0_SHOWER
4825                     	xdef	_rn_real_shower_water
4826                     	xdef	_rn_real_heat_water
4827                     	xref	_debug_br
4828                     	xref	_start_flag
4829                     	xref	_dr_mode_out
4830                     	xref	_packet_changed
4831                     	xref	_getHexToBin
4832                     	xref	__rcLED
4833                     	xref	__disp_temp
4834  0003               __remote_buf:
4835  0003 000000000000  	ds.b	8
4836                     	xdef	__remote_buf
4837                     	xdef	__remote
4838                     	xdef	__boiler_fire
4839                     	xdef	__boiler_type
4840                     	xdef	__boiler_water_heat
4841                     	xdef	__boiler_water_shower
4842  000b               ___boiler_shower:
4843  000b 000000000000  	ds.b	10
4844                     	xdef	___boiler_shower
4845                     	xdef	__disp_status_loop_host_boiler
4846                     	xref	__updateCount
4847                     	xref	__updateBit
4848                     	xref	__updateTimer
4849                     	xdef	__key_blink
4850                     	xref	__key_hour
4851                     	xref	__key_min
4852                     	xref	__key_sec
4853                     	xdef	__disp_mode2
4854                     	xdef	__disp_mode
4855                     	xref	_disp_status_curr_only
4856                     	xref	_disp_status_loop_init
4857                     	xdef	_disp_status_loop_host_B
4858                     	xdef	_disp_status_loop_host_Y
4859                     	xdef	_disp_status_loop_host_N
4860                     	xref	_disp_status_loop_messageDn
4861                     	xref	_disp_status_loop_message
4862                     	xref	__subRemote
4863                     	xref	__dsPrev
4864                     	xref	__dsCount
4865                     	xdef	_disp_status_loop_host
4866                     	xref	___sRoom
4867                     	xref	___sInfo
4868                     	xref	___sDn
4869                     	xref	___sUp
4870                     	xref	___s
4871                     	xref	_lcd_disp_info
4872                     	xref	_lcd_disp_info_shower
4873                     	xref	_ui_disp_reserve_setup
4874                     	xref	_ui_disp_repeat_setup
4875                     	xref	_ui_disp_clear_tSetup
4876                     	xref	___ui_disp_temp_c
4877                     	xref	_ui_disp_temp_curr
4878                     	xref	_ui_disp_temp_setup
4879                     	xref	_lcd_clear_rid_n
4880                     	xref	_lcd_blink_itemRoom
4881                     	xref	_lcd_blink_item
4882                     	xref	_lcd_blink_clear
4883                     	xref	_lcd_disp_rid
4884                     	xref	_lcd_disp_n
4885                     	xref	_lcd_clear
4886                     	xref	_lcd_clear_rid
4887                     	xref	_lcd_clear_btn
4888                     	xref	_iLF_DEF
4889                     	xref	_bLF_DEF
4890                     	xref	_uiInfo
4891                     	xref	_file_write
4892                     	xref	___timer1s
4893                     	xref.b	c_x
4913                     	xref	c_idiv
4914                     	xref	c_smodx
4915                     	end
