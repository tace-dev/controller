   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               _debug_hn:
  23  0000 00            	dc.b	0
  24  0001               _debug_br:
  25  0001 00            	dc.b	0
  26  0002               _dr_mode_out:
  27  0002 01            	dc.b	1
  28  0003               _only_one:
  29  0003 00            	dc.b	0
  81                     ; 69 uint8_t getHexToBin(uint8_t hex, uint8_t idx)
  81                     ; 70 {
  83                     	switch	.text
  84  0000               _getHexToBin:
  86  0000 89            	pushw	x
  87  0001 88            	push	a
  88       00000001      OFST:	set	1
  91                     ; 71 	uint8_t p = 0x80;
  93                     ; 72 	p = p >> (0x08 - (idx + 0x01));
  95  0002 9f            	ld	a,xl
  96  0003 a007          	sub	a,#7
  97  0005 40            	neg	a
  98  0006 5f            	clrw	x
  99  0007 97            	ld	xl,a
 100  0008 a680          	ld	a,#128
 101  000a 5d            	tnzw	x
 102  000b 2704          	jreq	L6
 103  000d               L01:
 104  000d 44            	srl	a
 105  000e 5a            	decw	x
 106  000f 26fc          	jrne	L01
 107  0011               L6:
 108  0011 6b01          	ld	(OFST+0,sp),a
 109                     ; 74 	if (hex & p)
 111  0013 7b02          	ld	a,(OFST+1,sp)
 112  0015 1501          	bcp	a,(OFST+0,sp)
 113  0017 2704          	jreq	L13
 114                     ; 76 		return 1;
 116  0019 a601          	ld	a,#1
 118  001b 2001          	jra	L21
 119  001d               L13:
 120                     ; 80 		return 0;
 122  001d 4f            	clr	a
 124  001e               L21:
 126  001e 5b03          	addw	sp,#3
 127  0020 81            	ret	
 162                     ; 84 void rc_ptc_baseSet(void) {
 163                     	switch	.text
 164  0021               _rc_ptc_baseSet:
 166  0021 88            	push	a
 167       00000001      OFST:	set	1
 170                     ; 86 	state_check = RC_STATE_NORMAL;
 172  0022 3501000b      	mov	_state_check,#1
 173                     ; 87 	set_changed = 0;
 175  0026 725f000c      	clr	_set_changed
 176                     ; 89 	for (i = 0 ; i < 8 ; i++) {
 178  002a 4f            	clr	a
 179  002b 6b01          	ld	(OFST+0,sp),a
 180  002d               L15:
 181                     ; 90 		rcSubDataInfo.mode_heat[i] = 0xAA;
 183  002d 5f            	clrw	x
 184  002e 97            	ld	xl,a
 185  002f a6aa          	ld	a,#170
 186  0031 d70025        	ld	(_rcSubDataInfo+16,x),a
 187                     ; 91 		rcSubDataInfo.cur_temp[i] = 0xAA;
 189  0034 5f            	clrw	x
 190  0035 7b01          	ld	a,(OFST+0,sp)
 191  0037 97            	ld	xl,a
 192  0038 a6aa          	ld	a,#170
 193  003a d70015        	ld	(_rcSubDataInfo,x),a
 194                     ; 92 		rcSubDataInfo.set_temp[i] = 0xAA;
 196  003d 5f            	clrw	x
 197  003e 7b01          	ld	a,(OFST+0,sp)
 198  0040 97            	ld	xl,a
 199  0041 a6aa          	ld	a,#170
 200  0043 d7001d        	ld	(_rcSubDataInfo+8,x),a
 201                     ; 93 		rcSubDataInfo.time[i] = 0xAA;
 203  0046 5f            	clrw	x
 204  0047 7b01          	ld	a,(OFST+0,sp)
 205  0049 97            	ld	xl,a
 206  004a a6aa          	ld	a,#170
 207  004c d70035        	ld	(_rcSubDataInfo+32,x),a
 208                     ; 94 		rcSubDataInfo.banb[i] = 0xAA;
 210  004f 5f            	clrw	x
 211  0050 7b01          	ld	a,(OFST+0,sp)
 212  0052 97            	ld	xl,a
 213  0053 a6aa          	ld	a,#170
 214  0055 d7003d        	ld	(_rcSubDataInfo+40,x),a
 215                     ; 89 	for (i = 0 ; i < 8 ; i++) {
 217  0058 0c01          	inc	(OFST+0,sp)
 220  005a 7b01          	ld	a,(OFST+0,sp)
 221  005c a108          	cp	a,#8
 222  005e 25cd          	jrult	L15
 223                     ; 96 }
 226  0060 84            	pop	a
 227  0061 81            	ret	
 267                     ; 98 void rc_ptc_check_master(uint8_t *buf) {
 268                     	switch	.text
 269  0062               _rc_ptc_check_master:
 271  0062 89            	pushw	x
 272       00000000      OFST:	set	0
 275                     ; 99 	if (buf[1] != 0x00) {
 277  0063 e601          	ld	a,(1,x)
 278  0065 260e          	jrne	L42
 279                     ; 100 		return;
 281                     ; 107 	if (getHexToBin(buf[6], 7) == 1) {  // H/N 패킷
 283  0067 1601          	ldw	y,(OFST+1,sp)
 284  0069 ae0007        	ldw	x,#7
 285  006c 90e606        	ld	a,(6,y)
 286  006f 95            	ld	xh,a
 287  0070 ad8e          	call	_getHexToBin
 289  0072 4a            	dec	a
 290  0073 2602          	jrne	L77
 291                     ; 108 		return;
 292  0075               L42:
 295  0075 85            	popw	x
 296  0076 81            	ret	
 297  0077               L77:
 298                     ; 111 	boiler_info.state = buf[4] & 0x03;
 300  0077 1e01          	ldw	x,(OFST+1,sp)
 301  0079 e604          	ld	a,(4,x)
 302  007b a403          	and	a,#3
 303  007d c70012        	ld	_boiler_info,a
 304                     ; 112 	boiler_info.hotwater = buf[2];
 306  0080 e602          	ld	a,(2,x)
 307  0082 c70013        	ld	_boiler_info+1,a
 308                     ; 113 	boiler_info.heatwater = buf[3];
 310  0085 e603          	ld	a,(3,x)
 311  0087 c70014        	ld	_boiler_info+2,a
 312                     ; 115 	uiInfo.cntlMode = getHexToBin(buf[4], 7);
 314  008a 1601          	ldw	y,(OFST+1,sp)
 315  008c ae0007        	ldw	x,#7
 316  008f 90e604        	ld	a,(4,y)
 317  0092 95            	ld	xh,a
 318  0093 cd0000        	call	_getHexToBin
 320  0096 c70003        	ld	_uiInfo+3,a
 321                     ; 117 	_boiler_fire = boiler_info.state;
 323  0099 5500120000    	mov	__boiler_fire,_boiler_info
 324                     ; 119 }
 326  009e 20d5          	jra	L42
 382                     ; 122 void rc_ptc_check_homenet(uint8_t *buf) {
 383                     	switch	.text
 384  00a0               _rc_ptc_check_homenet:
 386  00a0 89            	pushw	x
 387  00a1 88            	push	a
 388       00000001      OFST:	set	1
 391                     ; 126 	if (getHexToBin(buf[6], 7) == 0) { // 일반 패킷
 393  00a2 1602          	ldw	y,(OFST+1,sp)
 394  00a4 ae0007        	ldw	x,#7
 395  00a7 90e606        	ld	a,(6,y)
 396  00aa 95            	ld	xh,a
 397  00ab cd0000        	call	_getHexToBin
 399  00ae 4d            	tnz	a
 400  00af 270d          	jreq	L23
 401                     ; 127 		return;
 403                     ; 130 	id = buf[1] & 0x0F;
 405  00b1 1e02          	ldw	x,(OFST+1,sp)
 406  00b3 e601          	ld	a,(1,x)
 407  00b5 a40f          	and	a,#15
 408  00b7 6b01          	ld	(OFST+0,sp),a
 409                     ; 132 	if (id != uiInfo.id) {
 411  00b9 c10004        	cp	a,_uiInfo+4
 412  00bc 2703          	jreq	L521
 413                     ; 133 		return;
 414  00be               L23:
 417  00be 5b03          	addw	sp,#3
 418  00c0 81            	ret	
 419  00c1               L521:
 420                     ; 136 	packet_changed = 1;
 422  00c1 35010005      	mov	_packet_changed,#1
 423                     ; 138 	if (_remote == 0) {
 425  00c5 c60000        	ld	a,__remote
 426  00c8 26f4          	jrne	L23
 427                     ; 139 		_disp_mode2 = buf[2];
 429  00ca e602          	ld	a,(2,x)
 430  00cc c70000        	ld	__disp_mode2,a
 431                     ; 141 		if (buf[2] == RC_MODE_HEAT) {
 433  00cf a101          	cp	a,#1
 434  00d1 260b          	jrne	L131
 435                     ; 142 			if (buf[3] != 0xFF) {
 437  00d3 e603          	ld	a,(3,x)
 438  00d5 a1ff          	cp	a,#255
 439  00d7 27e5          	jreq	L23
 440                     ; 143 				uiInfo.tSetup = buf[3];
 442  00d9 c7000e        	ld	_uiInfo+14,a
 443  00dc 20e0          	jra	L23
 444  00de               L131:
 445                     ; 145 		} else if (buf[2] == RC_MODE_OUT) {
 447  00de a102          	cp	a,#2
 448  00e0 26dc          	jrne	L23
 449                     ; 146 			out_mode = (buf[4] & 0xF0) >> 7;
 451  00e2 e604          	ld	a,(4,x)
 452  00e4 49            	rlc	a
 453  00e5 4f            	clr	a
 454  00e6 49            	rlc	a
 455  00e7 6b01          	ld	(OFST+0,sp),a
 456                     ; 147 			if (out_mode == 1) {
 458  00e9 4a            	dec	a
 459  00ea 2606          	jrne	L141
 460                     ; 148 				dr_mode_out = 1;   // 개별외출
 462  00ec 35010002      	mov	_dr_mode_out,#1
 464  00f0 20cc          	jra	L23
 465  00f2               L141:
 466                     ; 150 				dr_mode_out = 0;   // 전체 외출
 468  00f2 725f0002      	clr	_dr_mode_out
 469                     ; 154 }
 471  00f6 20c6          	jra	L23
 531                     ; 157 void rc_ptc_check_normal(uint8_t *buf) {
 532                     	switch	.text
 533  00f8               _rc_ptc_check_normal:
 535  00f8 89            	pushw	x
 536  00f9 88            	push	a
 537       00000001      OFST:	set	1
 540                     ; 158 	uint8_t start = buf[0] & 0x0F;
 542  00fa f6            	ld	a,(x)
 543  00fb a40f          	and	a,#15
 544  00fd 6b01          	ld	(OFST+0,sp),a
 545                     ; 160 	if (start == 0x0F) {
 547  00ff a10f          	cp	a,#15
 548  0101 2606          	jrne	L561
 549                     ; 161 		state_check = RC_STATE_FACTORY;
 551  0103 3505000b      	mov	_state_check,#5
 552                     ; 162 		return;
 554  0107 2032          	jra	L26
 555  0109               L561:
 556                     ; 165 	if (start == 0x01 || start == 0x09) {
 558  0109 a101          	cp	a,#1
 559  010b 2704          	jreq	L171
 561  010d a109          	cp	a,#9
 562  010f 2604          	jrne	L761
 563  0111               L171:
 564                     ; 166 		only_one = 0;
 566  0111 725f0003      	clr	_only_one
 567  0115               L761:
 568                     ; 169 	if (start == uiInfo.id) {
 570  0115 c10004        	cp	a,_uiInfo+4
 571  0118 260d          	jrne	L371
 572                     ; 170 		packet_buf[start - 1] = 0;
 574  011a 5f            	clrw	x
 575  011b 97            	ld	xl,a
 576  011c 5a            	decw	x
 577                     ; 171 		state_check = RC_STATE_NORMAL;
 579  011d 3501000b      	mov	_state_check,#1
 580  0121 724f0000      	clr	(_packet_buf,x)
 582  0125 2004          	jra	L571
 583  0127               L371:
 584                     ; 173 		state_check = RC_STATE_NONE;
 586  0127 725f000b      	clr	_state_check
 587  012b               L571:
 588                     ; 176 	if (start == 0x09 ) {
 590  012b a109          	cp	a,#9
 591  012d 260f          	jrne	L771
 592                     ; 177 		debug_hn = buf[2];
 594  012f 1e02          	ldw	x,(OFST+1,sp)
 595  0131 e602          	ld	a,(2,x)
 596  0133 c70000        	ld	_debug_hn,a
 597                     ; 178 		debug_br = buf[1];
 599  0136 e601          	ld	a,(1,x)
 600  0138 c70001        	ld	_debug_br,a
 601                     ; 179 		return;
 602  013b               L26:
 605  013b 5b03          	addw	sp,#3
 606  013d 81            	ret	
 607  013e               L771:
 608                     ; 182 	if (uiInfo.mode == SETTING_MODE_MASTER) {
 610  013e c60008        	ld	a,_uiInfo+8
 611  0141 4a            	dec	a
 612  0142 2605          	jrne	L102
 613                     ; 183 		rc_ptc_check_master(buf);
 615  0144 1e02          	ldw	x,(OFST+1,sp)
 616  0146 cd0062        	call	_rc_ptc_check_master
 618  0149               L102:
 619                     ; 186 	if ( _remote == 0 && _backup_backlight == 0) {
 621  0149 c60000        	ld	a,__remote
 622  014c 2658          	jrne	L302
 624  014e c60000        	ld	a,__backup_backlight
 625  0151 2653          	jrne	L302
 626                     ; 187 		if (getHexToBin(buf[6], 7) == 0) {
 628  0153 1602          	ldw	y,(OFST+1,sp)
 629  0155 ae0007        	ldw	x,#7
 630  0158 90e606        	ld	a,(6,y)
 631  015b 95            	ld	xh,a
 632  015c cd0000        	call	_getHexToBin
 634  015f 4d            	tnz	a
 635  0160 2644          	jrne	L302
 636                     ; 188 			_rcLED = buf[1];
 638  0162 1e02          	ldw	x,(OFST+1,sp)
 639  0164 e601          	ld	a,(1,x)
 640  0166 c70003        	ld	__rcLED,a
 641                     ; 190 			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
 643  0169 c60004        	ld	a,_uiInfo+4
 644  016c 4a            	dec	a
 645  016d 1602          	ldw	y,(OFST+1,sp)
 646  016f 97            	ld	xl,a
 647  0170 90e601        	ld	a,(1,y)
 648  0173 95            	ld	xh,a
 649  0174 cd0000        	call	_getHexToBin
 651  0177 4a            	dec	a
 652  0178 2614          	jrne	L702
 653                     ; 192 				D_IO_LOW(D_LED_PORT, D_LED_PIN);
 655  017a 7211500a      	bres	20490,#0
 656                     ; 195 				lcd_disp_rid(uiInfo.id, 1, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 658  017e c60008        	ld	a,_uiInfo+8
 659  0181 4a            	dec	a
 660  0182 2603          	jrne	L64
 661  0184 4c            	inc	a
 662  0185 2001          	jra	L05
 663  0187               L64:
 664  0187 4f            	clr	a
 665  0188               L05:
 666  0188 88            	push	a
 667  0189 ae0001        	ldw	x,#1
 670  018c 2010          	jp	LC002
 671  018e               L702:
 672                     ; 203 				D_IO_HIGH(D_LED_PORT, D_LED_PIN);
 674  018e 7210500a      	bset	20490,#0
 675                     ; 206 				lcd_disp_rid(uiInfo.id, 0, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
 677  0192 c60008        	ld	a,_uiInfo+8
 678  0195 4a            	dec	a
 679  0196 2603          	jrne	L45
 680  0198 4c            	inc	a
 681  0199 2001          	jra	L65
 682  019b               L45:
 683  019b 4f            	clr	a
 684  019c               L65:
 685  019c 88            	push	a
 686  019d 5f            	clrw	x
 688  019e               LC002:
 689  019e c60004        	ld	a,_uiInfo+4
 690  01a1 95            	ld	xh,a
 691  01a2 cd0000        	call	_lcd_disp_rid
 692  01a5 84            	pop	a
 693  01a6               L302:
 694                     ; 216 	rc_ptc_check_homenet(buf);
 696  01a6 1e02          	ldw	x,(OFST+1,sp)
 697  01a8 cd00a0        	call	_rc_ptc_check_homenet
 699                     ; 218 	_version = buf[6] >> 1;
 701  01ab 1e02          	ldw	x,(OFST+1,sp)
 702  01ad e606          	ld	a,(6,x)
 703  01af 44            	srl	a
 704  01b0 c70008        	ld	__version,a
 705                     ; 220 	if (mode_recover == 0) {
 707  01b3 c6000f        	ld	a,_mode_recover
 708  01b6 2613          	jrne	L312
 709                     ; 221 		error_type = (buf[4] & 0x0F) >> 2;
 711  01b8 e604          	ld	a,(4,x)
 712  01ba a40c          	and	a,#12
 713  01bc 44            	srl	a
 714  01bd 44            	srl	a
 715  01be c70009        	ld	_error_type,a
 716                     ; 223 		if (error_type != 0) {
 718  01c1 2702          	jreq	L512
 719                     ; 224 			error = buf[5];
 721  01c3 e605          	ld	a,(5,x)
 723  01c5               L512:
 724                     ; 226 			error = 0;
 726  01c5 c7000a        	ld	_error,a
 727  01c8 cc013b        	jra	L26
 728  01cb               L312:
 729                     ; 229 		if (((buf[4]& 0x0F) >> 2) == 0 && buf[5] == 0) {
 731  01cb e604          	ld	a,(4,x)
 732  01cd a40c          	and	a,#12
 733  01cf 44            	srl	a
 734  01d0 44            	srl	a
 735  01d1 5f            	clrw	x
 736  01d2 97            	ld	xl,a
 737  01d3 5d            	tnzw	x
 738  01d4 26f2          	jrne	L26
 740  01d6 1e02          	ldw	x,(OFST+1,sp)
 741  01d8 e605          	ld	a,(5,x)
 742  01da 26ec          	jrne	L26
 743                     ; 230 			error_type = 0;
 745  01dc c70009        	ld	_error_type,a
 746                     ; 231 			error = 0;
 748  01df c7000a        	ld	_error,a
 749                     ; 232 			mode_recover = 0;
 751  01e2 c7000f        	ld	_mode_recover,a
 752                     ; 239 }
 754  01e5 cc013b        	jra	L26
 802                     ; 242 void rc_ptc_check_setting(uint8_t *buf) {
 803                     	switch	.text
 804  01e8               _rc_ptc_check_setting:
 806  01e8 88            	push	a
 807       00000001      OFST:	set	1
 810                     ; 243 	uint8_t page = buf[0] & 0x0F;
 812  01e9 f6            	ld	a,(x)
 813  01ea a40f          	and	a,#15
 814  01ec 6b01          	ld	(OFST+0,sp),a
 815                     ; 245 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 817  01ee c60008        	ld	a,_uiInfo+8
 818  01f1 4a            	dec	a
 819  01f2 2702          	jreq	L542
 820                     ; 246 		return;
 823  01f4 84            	pop	a
 824  01f5 81            	ret	
 825  01f6               L542:
 826                     ; 249 	state_check = RC_STATE_SETTING;
 828  01f6 3502000b      	mov	_state_check,#2
 829                     ; 251 	if (cur_set_page == page) {
 831  01fa c60007        	ld	a,_cur_set_page
 832  01fd 1101          	cp	a,(OFST+0,sp)
 833  01ff 2607          	jrne	L742
 834                     ; 252 		cur_set_page++;
 836  0201 725c0007      	inc	_cur_set_page
 837  0205 c60007        	ld	a,_cur_set_page
 838  0208               L742:
 839                     ; 255 	if (cur_set_page == MAX_SETTING_PAGE) { 
 841  0208 a103          	cp	a,#3
 842  020a 2613          	jrne	L152
 843                     ; 256 		set_changed = 0;
 845  020c 725f000c      	clr	_set_changed
 846                     ; 257 		cur_set_page = 0;
 848  0210 725f0007      	clr	_cur_set_page
 849                     ; 259 		func_rc_settingCb(1);
 851  0214 a601          	ld	a,#1
 852  0216 cd0c52        	call	_func_rc_settingCb
 854                     ; 260 		state_check = RC_STATE_NORMAL;
 856  0219 3501000b      	mov	_state_check,#1
 858  021d 2004          	jra	L352
 859  021f               L152:
 860                     ; 262 		func_rc_settingCb(0);
 862  021f 4f            	clr	a
 863  0220 cd0c52        	call	_func_rc_settingCb
 865  0223               L352:
 866                     ; 264 }
 869  0223 84            	pop	a
 870  0224 81            	ret	
 928                     ; 267 void rc_ptc_check_rc(uint8_t *buf) {
 929                     	switch	.text
 930  0225               _rc_ptc_check_rc:
 932  0225 89            	pushw	x
 933  0226 89            	pushw	x
 934       00000002      OFST:	set	2
 937                     ; 271 	st = (buf[0] & 0x0F) - 1;
 939  0227 f6            	ld	a,(x)
 940  0228 a40f          	and	a,#15
 941  022a 4a            	dec	a
 942  022b 6b02          	ld	(OFST+0,sp),a
 943                     ; 273 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 945  022d c60008        	ld	a,_uiInfo+8
 946  0230 4a            	dec	a
 947  0231 273f          	jreq	L323
 948                     ; 274 		if (st == 0) {
 950  0233 7b02          	ld	a,(OFST+0,sp)
 951  0235 2703cc02d5    	jrne	L201
 952                     ; 275 			if (buf[1] == RC_MODE_OUT && (buf[5] & 0x01)  == 0) {
 954  023a e601          	ld	a,(1,x)
 955  023c a102          	cp	a,#2
 956  023e 260e          	jrne	L723
 958  0240 e605          	ld	a,(5,x)
 959  0242 a501          	bcp	a,#1
 960  0244 2608          	jrne	L723
 961                     ; 276 				_disp_mode2 = RC_MODE_OUT;
 963  0246 35020000      	mov	__disp_mode2,#2
 964                     ; 277 				dr_mode_out = 0;
 966  024a 725f0002      	clr	_dr_mode_out
 967  024e               L723:
 968                     ; 284 			if (dr_mode_out == 0) {
 970  024e c60002        	ld	a,_dr_mode_out
 971  0251 26e4          	jrne	L201
 972                     ; 285 				if (_disp_mode2 == RC_MODE_OUT) {
 974  0253 c60000        	ld	a,__disp_mode2
 975  0256 a102          	cp	a,#2
 976  0258 267b          	jrne	L201
 977                     ; 286 					if (buf[1] != RC_MODE_OUT) {
 979  025a 1e03          	ldw	x,(OFST+1,sp)
 980  025c e601          	ld	a,(1,x)
 981  025e a102          	cp	a,#2
 982  0260 2705          	jreq	L533
 983                     ; 287 						packet_changed = 1;
 985  0262 cd0391        	call	LC006
 986                     ; 289 						_disp_mode2 = FW_GET_DISPMODE;
 987  0265 206e          	jra	L201
 988  0267               L533:
 989                     ; 291 						if((buf[5] & 0x01) != 0)  {
 991  0267 e605          	ld	a,(5,x)
 992  0269 a501          	bcp	a,#1
 993  026b 2768          	jreq	L201
 994                     ; 292 							packet_changed = 1;
 996  026d cd0391        	call	LC006
 997                     ; 300 		return;
 999  0270 2063          	jra	L201
1000  0272               L323:
1001                     ; 303 	k = 0;
1003  0272 6b01          	ld	(OFST-1,sp),a
1004                     ; 305 	packet_buf[st] = 0;
1006  0274 5f            	clrw	x
1007  0275 7b02          	ld	a,(OFST+0,sp)
1008  0277 97            	ld	xl,a
1009  0278 724f0000      	clr	(_packet_buf,x)
1010                     ; 307 	if (_remote == 0) {
1012  027c 725d0000      	tnz	__remote
1013  0280 2703cc0360    	jrne	L343
1014                     ; 308 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
1016  0285 5f            	clrw	x
1017  0286 97            	ld	xl,a
1018  0287 d60025        	ld	a,(_rcSubDataInfo+16,x)
1019  028a 4c            	inc	a
1020  028b 264b          	jrne	L543
1021                     ; 309 			if (uiInfo.remote_mode[st] != buf[1]) {
1023  028d 7b02          	ld	a,(OFST+0,sp)
1024  028f 5f            	clrw	x
1025  0290 97            	ld	xl,a
1026  0291 d60045        	ld	a,(_uiInfo+69,x)
1027  0294 1e03          	ldw	x,(OFST+1,sp)
1028  0296 e101          	cp	a,(1,x)
1029                     ; 310 				k = 1;
1031  0298 2632          	jrne	LC003
1032                     ; 313 				switch (buf[1]) {
1034  029a e601          	ld	a,(1,x)
1036                     ; 332 						break;
1037  029c 4a            	dec	a
1038  029d 270a          	jreq	L552
1039  029f a007          	sub	a,#7
1040  02a1 2713          	jreq	L362
1041  02a3 a008          	sub	a,#8
1042  02a5 2718          	jreq	L562
1043  02a7 2027          	jra	L153
1044  02a9               L552:
1045                     ; 314 					case RC_MODE_HEAT:
1045                     ; 315 						if (uiInfo.tempSetup[st] != buf[3]) {
1047  02a9 7b02          	ld	a,(OFST+0,sp)
1048  02ab 5f            	clrw	x
1049  02ac 97            	ld	xl,a
1050  02ad d6003d        	ld	a,(_uiInfo+61,x)
1051  02b0 1e03          	ldw	x,(OFST+1,sp)
1052  02b2 e103          	cp	a,(3,x)
1053                     ; 316 							k = 1;
1054  02b4 2014          	jp	LC004
1055                     ; 319 					case RC_MODE_OUT:
1055                     ; 320 						break;
1057                     ; 321 					case RC_MODE_STOP:
1057                     ; 322 						break;
1059  02b6               L362:
1060                     ; 323 					case RC_MODE_RESERVE:
1060                     ; 324 						if (uiInfo.remote_time[st] != buf[5]) {
1062  02b6 7b02          	ld	a,(OFST+0,sp)
1063  02b8 5f            	clrw	x
1064  02b9 97            	ld	xl,a
1065  02ba d6004d        	ld	a,(_uiInfo+77,x)
1066                     ; 325 							k = 1;
1067  02bd 2007          	jp	LC005
1068  02bf               L562:
1069                     ; 328 					case RC_MODE_REPEAT:
1069                     ; 329 						if (uiInfo.remote_banb[st] != buf[5]) {
1071  02bf 7b02          	ld	a,(OFST+0,sp)
1072  02c1 5f            	clrw	x
1073  02c2 97            	ld	xl,a
1074  02c3 d60055        	ld	a,(_uiInfo+85,x)
1075  02c6               LC005:
1076  02c6 1e03          	ldw	x,(OFST+1,sp)
1077  02c8 e105          	cp	a,(5,x)
1078  02ca               LC004:
1079  02ca 2704          	jreq	L153
1080                     ; 330 							k = 1;
1082  02cc               LC003:
1086  02cc a601          	ld	a,#1
1087  02ce 6b01          	ld	(OFST-1,sp),a
1088  02d0               L153:
1089                     ; 336 			if (k == 1) {
1091  02d0 7b01          	ld	a,(OFST-1,sp)
1092  02d2 4a            	dec	a
1093  02d3 2603          	jrne	L543
1094                     ; 337 				return;
1095  02d5               L201:
1098  02d5 5b04          	addw	sp,#4
1099  02d7 81            	ret	
1100  02d8               L543:
1101                     ; 341 		rcSubDataInfo.mode_heat[st] = buf[1];
1103  02d8 7b02          	ld	a,(OFST+0,sp)
1104  02da 5f            	clrw	x
1105  02db 1603          	ldw	y,(OFST+1,sp)
1106  02dd 97            	ld	xl,a
1107  02de 90e601        	ld	a,(1,y)
1108  02e1 d70025        	ld	(_rcSubDataInfo+16,x),a
1109                     ; 342 		rcSubDataInfo.cur_temp[st] = buf[2];
1111  02e4 5f            	clrw	x
1112  02e5 7b02          	ld	a,(OFST+0,sp)
1113  02e7 97            	ld	xl,a
1114  02e8 90e602        	ld	a,(2,y)
1115  02eb d70015        	ld	(_rcSubDataInfo,x),a
1116                     ; 344 		uiInfo.remote_mode[st] = buf[1];
1118  02ee 5f            	clrw	x
1119  02ef 7b02          	ld	a,(OFST+0,sp)
1120  02f1 97            	ld	xl,a
1121  02f2 90e601        	ld	a,(1,y)
1122  02f5 d70045        	ld	(_uiInfo+69,x),a
1123                     ; 345 		uiInfo.tempCurr[st] = buf[2];
1125  02f8 5f            	clrw	x
1126  02f9 7b02          	ld	a,(OFST+0,sp)
1127  02fb 97            	ld	xl,a
1128  02fc 90e602        	ld	a,(2,y)
1129  02ff d70035        	ld	(_uiInfo+53,x),a
1130                     ; 347 		switch (buf[1]) {
1132  0302 1e03          	ldw	x,(OFST+1,sp)
1133  0304 e601          	ld	a,(1,x)
1135                     ; 363 				break;
1136  0306 4a            	dec	a
1137  0307 270a          	jreq	L762
1138  0309 a007          	sub	a,#7
1139  030b 271c          	jreq	L572
1140  030d a008          	sub	a,#8
1141  030f 272e          	jreq	L772
1142  0311 2040          	jra	L173
1143  0313               L762:
1144                     ; 348 			case RC_MODE_HEAT:
1144                     ; 349 				rcSubDataInfo.set_temp[st] = buf[3];
1146  0313 7b02          	ld	a,(OFST+0,sp)
1147  0315 5f            	clrw	x
1148  0316 97            	ld	xl,a
1149  0317 90e603        	ld	a,(3,y)
1150  031a d7001d        	ld	(_rcSubDataInfo+8,x),a
1151                     ; 350 				uiInfo.tempSetup[st] = buf[3];
1153  031d 5f            	clrw	x
1154  031e 7b02          	ld	a,(OFST+0,sp)
1155  0320 97            	ld	xl,a
1156  0321 90e603        	ld	a,(3,y)
1157  0324 d7003d        	ld	(_uiInfo+61,x),a
1158                     ; 351 				break;
1160  0327 202a          	jra	L173
1161                     ; 352 			case RC_MODE_OUT:
1161                     ; 353 				break;
1163                     ; 354 			case RC_MODE_STOP:
1163                     ; 355 				break;
1165  0329               L572:
1166                     ; 356 			case RC_MODE_RESERVE:
1166                     ; 357 				rcSubDataInfo.time[st] = buf[5];
1168  0329 7b02          	ld	a,(OFST+0,sp)
1169  032b 5f            	clrw	x
1170  032c 97            	ld	xl,a
1171  032d 90e605        	ld	a,(5,y)
1172  0330 d70035        	ld	(_rcSubDataInfo+32,x),a
1173                     ; 358 				uiInfo.remote_time[st] = buf[5];
1175  0333 5f            	clrw	x
1176  0334 7b02          	ld	a,(OFST+0,sp)
1177  0336 97            	ld	xl,a
1178  0337 90e605        	ld	a,(5,y)
1179  033a d7004d        	ld	(_uiInfo+77,x),a
1180                     ; 359 				break;
1182  033d 2014          	jra	L173
1183  033f               L772:
1184                     ; 360 			case RC_MODE_REPEAT:
1184                     ; 361 				rcSubDataInfo.banb[st] = buf[5];
1186  033f 7b02          	ld	a,(OFST+0,sp)
1187  0341 5f            	clrw	x
1188  0342 97            	ld	xl,a
1189  0343 90e605        	ld	a,(5,y)
1190  0346 d7003d        	ld	(_rcSubDataInfo+40,x),a
1191                     ; 362 				uiInfo.remote_banb[st] = buf[5];
1193  0349 5f            	clrw	x
1194  034a 7b02          	ld	a,(OFST+0,sp)
1195  034c 97            	ld	xl,a
1196  034d 90e605        	ld	a,(5,y)
1197  0350 d70055        	ld	(_uiInfo+85,x),a
1198                     ; 363 				break;
1200  0353               L173:
1201                     ; 366 		disp_char(uiInfo.remote_mode[st]);
1203  0353 7b02          	ld	a,(OFST+0,sp)
1204  0355 5f            	clrw	x
1205  0356 97            	ld	xl,a
1206  0357 d60045        	ld	a,(_uiInfo+69,x)
1207  035a cd0000        	call	_disp_char
1210  035d cc02d5        	jra	L201
1211  0360               L343:
1212                     ; 370 		rcSubDataInfo.mode_heat[st] = 0xFF;
1214  0360 5f            	clrw	x
1215  0361 97            	ld	xl,a
1216  0362 a6ff          	ld	a,#255
1217  0364 d70025        	ld	(_rcSubDataInfo+16,x),a
1218                     ; 371 		rcSubDataInfo.cur_temp[st] = buf[2];
1220  0367 5f            	clrw	x
1221  0368 7b02          	ld	a,(OFST+0,sp)
1222  036a 1603          	ldw	y,(OFST+1,sp)
1223  036c 97            	ld	xl,a
1224  036d 90e602        	ld	a,(2,y)
1225  0370 d70015        	ld	(_rcSubDataInfo,x),a
1226                     ; 372 		rcSubDataInfo.set_temp[st] = 0xFF;
1228  0373 5f            	clrw	x
1229  0374 7b02          	ld	a,(OFST+0,sp)
1230  0376 97            	ld	xl,a
1231  0377 a6ff          	ld	a,#255
1232  0379 d7001d        	ld	(_rcSubDataInfo+8,x),a
1233                     ; 373 		rcSubDataInfo.time[st] = 0xFF;
1235  037c 5f            	clrw	x
1236  037d 7b02          	ld	a,(OFST+0,sp)
1237  037f 97            	ld	xl,a
1238  0380 a6ff          	ld	a,#255
1239  0382 d70035        	ld	(_rcSubDataInfo+32,x),a
1240                     ; 374 		rcSubDataInfo.banb[st] = 0xFF;
1242  0385 5f            	clrw	x
1243  0386 7b02          	ld	a,(OFST+0,sp)
1244  0388 97            	ld	xl,a
1245  0389 a6ff          	ld	a,#255
1246  038b d7003d        	ld	(_rcSubDataInfo+40,x),a
1247                     ; 376 }
1249  038e cc02d5        	jra	L201
1250  0391               LC006:
1251  0391 35010005      	mov	_packet_changed,#1
1252                     ; 293 							dr_mode_out = 1;
1254  0395 35010002      	mov	_dr_mode_out,#1
1255                     ; 294 							_disp_mode2 = FW_GET_DISPMODE;
1257  0399 a629          	ld	a,#41
1258  039b cd0000        	call	_file_read
1260  039e c70000        	ld	__disp_mode2,a
1261  03a1 81            	ret	
1307                     ; 379 void rc_ptc_check_subrc(uint8_t *buf) {
1308                     	switch	.text
1309  03a2               _rc_ptc_check_subrc:
1311  03a2 89            	pushw	x
1312  03a3 88            	push	a
1313       00000001      OFST:	set	1
1316                     ; 380 	uint8_t start = buf[0] & 0x0F;
1318  03a4 f6            	ld	a,(x)
1319  03a5 a40f          	and	a,#15
1320  03a7 6b01          	ld	(OFST+0,sp),a
1321                     ; 382 	state_check = RC_STATE_NONE;
1323  03a9 725f000b      	clr	_state_check
1324                     ; 384 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1326  03ad c60008        	ld	a,_uiInfo+8
1327  03b0 4a            	dec	a
1328  03b1 2707          	jreq	L601
1329                     ; 385 		return;
1331                     ; 388 	if (start != uiInfo.id) {
1333  03b3 7b01          	ld	a,(OFST+0,sp)
1334  03b5 c10004        	cp	a,_uiInfo+4
1335  03b8 2703          	jreq	L714
1336                     ; 389 		return;
1337  03ba               L601:
1340  03ba 5b03          	addw	sp,#3
1341  03bc 81            	ret	
1342  03bd               L714:
1343                     ; 392 	packet_changed = 1;	
1345  03bd 35010005      	mov	_packet_changed,#1
1346                     ; 393 	_disp_mode2 = buf[1];
1348  03c1 1e02          	ldw	x,(OFST+1,sp)
1349  03c3 e601          	ld	a,(1,x)
1350  03c5 c70000        	ld	__disp_mode2,a
1351                     ; 395 	if (_disp_mode2 == RC_MODE_HEAT) {
1353  03c8 a101          	cp	a,#1
1354  03ca 2608          	jrne	L124
1355                     ; 396 		uiInfo.tSetup = buf[3];
1357  03cc e603          	ld	a,(3,x)
1358  03ce c7000e        	ld	_uiInfo+14,a
1359  03d1 c60000        	ld	a,__disp_mode2
1360  03d4               L124:
1361                     ; 399 	if (_disp_mode2 == RC_MODE_RESERVE) {
1363  03d4 a108          	cp	a,#8
1364  03d6 2607          	jrne	L324
1365                     ; 400 		uiInfo.reserve = buf[5];
1367  03d8 e605          	ld	a,(5,x)
1368  03da c7000d        	ld	_uiInfo+13,a
1370  03dd 20db          	jra	L601
1371  03df               L324:
1372                     ; 401 	} else if (_disp_mode2 == RC_MODE_REPEAT){
1374  03df a110          	cp	a,#16
1375  03e1 26d7          	jrne	L601
1376                     ; 402 		uiInfo.repeat = buf[5];
1378  03e3 e605          	ld	a,(5,x)
1379  03e5 c7000c        	ld	_uiInfo+12,a
1380                     ; 404 }
1382  03e8 20d0          	jra	L601
1445                     ; 406 void rc_ptc_check_mirror(uint8_t *buf) {
1446                     	switch	.text
1447  03ea               _rc_ptc_check_mirror:
1449  03ea 89            	pushw	x
1450       00000001      OFST:	set	1
1453                     ; 411 	state_check = RC_STATE_NONE;
1455  03eb 725f000b      	clr	_state_check
1456  03ef 88            	push	a
1457                     ; 413 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1459  03f0 c60008        	ld	a,_uiInfo+8
1460  03f3 a101          	cp	a,#1
1461  03f5 2703cc059f    	jrne	L764
1462                     ; 414 		return;
1464                     ; 417 	page = buf[0] & 0x0F;
1466  03fa 1e02          	ldw	x,(OFST+1,sp)
1467  03fc f6            	ld	a,(x)
1468  03fd a40f          	and	a,#15
1469  03ff 6b01          	ld	(OFST+0,sp),a
1470                     ; 418 	cur_mirror_page = page;
1472  0401 c70006        	ld	_cur_mirror_page,a
1473                     ; 419 	state_check = RC_STATE_MIRROR;
1475  0404 3506000b      	mov	_state_check,#6
1476                     ; 421 	switch(page) {
1479                     ; 502 			break;
1480  0408 270f          	jreq	L134
1481  040a 4a            	dec	a
1482  040b 2603cc048f    	jreq	L334
1483  0410 4a            	dec	a
1484  0411 2603cc051a    	jreq	L534
1485  0416 cc059f        	jra	L764
1486  0419               L134:
1487                     ; 422 		case 0:
1487                     ; 423 			mode = (buf[6] & 0x80) >> 7;
1489  0419 e606          	ld	a,(6,x)
1490  041b 49            	rlc	a
1491  041c 4f            	clr	a
1492  041d 49            	rlc	a
1493  041e 6b01          	ld	(OFST+0,sp),a
1494                     ; 424 			if (mode == CNT_MODE_MAIN) {
1496  0420 2654          	jrne	L174
1497                     ; 425 				_boiler_type = (buf[1] & 0x80) >> 7;
1499  0422 cd05ae        	call	LC009
1500  0425 c70000        	ld	__boiler_type,a
1501                     ; 426 				uiInfo.lpmType = (buf[1] & 0x0F);
1503  0428 e601          	ld	a,(1,x)
1504  042a a40f          	and	a,#15
1505  042c c70013        	ld	_uiInfo+19,a
1506                     ; 427 				uiInfo.cnt = (buf[2] & 0x70) >> 4;
1508  042f cd05a2        	call	LC007
1509  0432 c70005        	ld	_uiInfo+5,a
1510                     ; 428 				uiInfo.valve = buf[2] & 0x0F;
1512  0435 e602          	ld	a,(2,x)
1513  0437 a40f          	and	a,#15
1514  0439 c7000a        	ld	_uiInfo+10,a
1515                     ; 429 				_boiler_water_shower = buf[3];
1517  043c e603          	ld	a,(3,x)
1518  043e c70000        	ld	__boiler_water_shower,a
1519                     ; 430 				uiInfo.houseCapa = buf[4];
1521  0441 e604          	ld	a,(4,x)
1522  0443 c70010        	ld	_uiInfo+16,a
1523                     ; 431 				_boiler_water_heat = buf[5] ;
1525  0446 e605          	ld	a,(5,x)
1526  0448 c70000        	ld	__boiler_water_heat,a
1527                     ; 432 				uiInfo.controlMode = mode;
1529  044b 7b01          	ld	a,(OFST+0,sp)
1530  044d c70009        	ld	_uiInfo+9,a
1531                     ; 433 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1533  0450 e606          	ld	a,(6,x)
1534  0452 4e            	swap	a
1535  0453 a404          	and	a,#4
1536  0455 44            	srl	a
1537  0456 44            	srl	a
1538  0457 c7005d        	ld	_uiInfo+93,a
1539                     ; 434 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1541  045a e606          	ld	a,(6,x)
1542  045c 4e            	swap	a
1543  045d a403          	and	a,#3
1544  045f c7000f        	ld	_uiInfo+15,a
1545                     ; 435 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1547  0462 e606          	ld	a,(6,x)
1548  0464 a408          	and	a,#8
1549  0466 44            	srl	a
1550  0467 44            	srl	a
1551  0468 44            	srl	a
1552  0469 c70003        	ld	_uiInfo+3,a
1553                     ; 436 				uiInfo.opMode = buf[6] & 0x07;
1555  046c e606          	ld	a,(6,x)
1556  046e a407          	and	a,#7
1557  0470 c70007        	ld	_uiInfo+7,a
1559  0473 cc059f        	jra	L764
1560  0476               L174:
1561                     ; 438 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1563  0476 e601          	ld	a,(1,x)
1564  0478 a40f          	and	a,#15
1565  047a c70014        	ld	_uiInfo+20,a
1566                     ; 439 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1568  047d e602          	ld	a,(2,x)
1569  047f 4e            	swap	a
1570  0480 a40f          	and	a,#15
1571  0482 c70006        	ld	_uiInfo+6,a
1572                     ; 440 				uiInfo.valve_sub = buf[2] & 0x0F;
1574  0485 e602          	ld	a,(2,x)
1575  0487 a40f          	and	a,#15
1576  0489 c7000b        	ld	_uiInfo+11,a
1577  048c cc059f        	jra	L764
1578  048f               L334:
1579                     ; 443 		case 1:
1579                     ; 444 			mode = (buf[1] & 0x80) >> 7;
1581  048f cd05ae        	call	LC009
1582  0492 6b01          	ld	(OFST+0,sp),a
1583                     ; 445 			if (mode == CNT_MODE_MAIN) {
1585  0494 2631          	jrne	L574
1586                     ; 446 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1588  0496 cd05a8        	call	LC008
1589  0499 c7001d        	ld	_uiInfo+29,a
1590                     ; 447 				uiInfo.valve_rc[1] = buf[1] & 0x07;
1592  049c e601          	ld	a,(1,x)
1593  049e a407          	and	a,#7
1594  04a0 c7001e        	ld	_uiInfo+30,a
1595                     ; 448 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
1597  04a3 cd05a2        	call	LC007
1598  04a6 c7001f        	ld	_uiInfo+31,a
1599                     ; 449 				uiInfo.valve_rc[3] = buf[2] & 0x07;
1601  04a9 e602          	ld	a,(2,x)
1602  04ab a407          	and	a,#7
1603  04ad c70020        	ld	_uiInfo+32,a
1604                     ; 451 				uiInfo.valve_len[0] = buf[3];
1606  04b0 e603          	ld	a,(3,x)
1607  04b2 c70015        	ld	_uiInfo+21,a
1608                     ; 452 				uiInfo.valve_len[1] = buf[4];
1610  04b5 e604          	ld	a,(4,x)
1611  04b7 c70016        	ld	_uiInfo+22,a
1612                     ; 453 				uiInfo.valve_len[2] = buf[5];
1614  04ba e605          	ld	a,(5,x)
1615  04bc c70017        	ld	_uiInfo+23,a
1616                     ; 454 				uiInfo.valve_len[3] = buf[6];
1618  04bf e606          	ld	a,(6,x)
1619  04c1 c70018        	ld	_uiInfo+24,a
1621  04c4 cc059f        	jra	L764
1622  04c7               L574:
1623                     ; 456 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
1625  04c7 cd05a8        	call	LC008
1626  04ca c7002d        	ld	_uiInfo+45,a
1627                     ; 457 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
1629  04cd e601          	ld	a,(1,x)
1630  04cf a407          	and	a,#7
1631  04d1 c7002e        	ld	_uiInfo+46,a
1632                     ; 458 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
1634  04d4 cd05a2        	call	LC007
1635  04d7 c7002f        	ld	_uiInfo+47,a
1636                     ; 459 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
1638  04da e602          	ld	a,(2,x)
1639  04dc a407          	and	a,#7
1640  04de c70030        	ld	_uiInfo+48,a
1641                     ; 461 				uiInfo.valve_sub_len[0] = buf[3];
1643  04e1 e603          	ld	a,(3,x)
1644  04e3 c70025        	ld	_uiInfo+37,a
1645                     ; 462 				uiInfo.valve_sub_len[1] = buf[4];
1647  04e6 e604          	ld	a,(4,x)
1648  04e8 c70026        	ld	_uiInfo+38,a
1649                     ; 463 				uiInfo.valve_sub_len[2] = buf[5];
1651  04eb e605          	ld	a,(5,x)
1652  04ed c70027        	ld	_uiInfo+39,a
1653                     ; 464 				uiInfo.valve_sub_len[3] = buf[6];
1655  04f0 e606          	ld	a,(6,x)
1656  04f2 c70028        	ld	_uiInfo+40,a
1657                     ; 466 				for (i = 0 ; i < 4 ; i++) {
1659  04f5 4f            	clr	a
1660  04f6 6b01          	ld	(OFST+0,sp),a
1661  04f8               L105:
1662                     ; 467 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1664  04f8 5f            	clrw	x
1665  04f9 97            	ld	xl,a
1666  04fa 724d002d      	tnz	(_uiInfo+45,x)
1667  04fe 260f          	jrne	L705
1669  0500 5f            	clrw	x
1670  0501 97            	ld	xl,a
1671  0502 724d0025      	tnz	(_uiInfo+37,x)
1672  0506 2707          	jreq	L705
1673                     ; 468 						uiInfo.valve_sub_rc[i] = 8;
1675  0508 5f            	clrw	x
1676  0509 97            	ld	xl,a
1677  050a a608          	ld	a,#8
1678  050c d7002d        	ld	(_uiInfo+45,x),a
1679  050f               L705:
1680                     ; 466 				for (i = 0 ; i < 4 ; i++) {
1682  050f 0c01          	inc	(OFST+0,sp)
1685  0511 7b01          	ld	a,(OFST+0,sp)
1686  0513 a104          	cp	a,#4
1687  0515 25e1          	jrult	L105
1688  0517 cc059f        	jra	L764
1689  051a               L534:
1690                     ; 473 		case 2:
1690                     ; 474 			mode = (buf[1] & 0x80) >> 7;
1692  051a cd05ae        	call	LC009
1693  051d 6b01          	ld	(OFST+0,sp),a
1694                     ; 475 			if (mode == CNT_MODE_MAIN) {
1696  051f 262f          	jrne	L115
1697                     ; 476 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
1699  0521 cd05a8        	call	LC008
1700  0524 c70021        	ld	_uiInfo+33,a
1701                     ; 477 				uiInfo.valve_rc[5] = buf[1] & 0x07;
1703  0527 e601          	ld	a,(1,x)
1704  0529 a407          	and	a,#7
1705  052b c70022        	ld	_uiInfo+34,a
1706                     ; 478 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
1708  052e ad72          	call	LC007
1709  0530 c70023        	ld	_uiInfo+35,a
1710                     ; 479 				uiInfo.valve_rc[7] = buf[2] & 0x07;
1712  0533 e602          	ld	a,(2,x)
1713  0535 a407          	and	a,#7
1714  0537 c70024        	ld	_uiInfo+36,a
1715                     ; 481 				uiInfo.valve_len[4] = buf[3];
1717  053a e603          	ld	a,(3,x)
1718  053c c70019        	ld	_uiInfo+25,a
1719                     ; 482 				uiInfo.valve_len[5] = buf[4];
1721  053f e604          	ld	a,(4,x)
1722  0541 c7001a        	ld	_uiInfo+26,a
1723                     ; 483 				uiInfo.valve_len[6] = buf[5];
1725  0544 e605          	ld	a,(5,x)
1726  0546 c7001b        	ld	_uiInfo+27,a
1727                     ; 484 				uiInfo.valve_len[7] = buf[6];
1729  0549 e606          	ld	a,(6,x)
1730  054b c7001c        	ld	_uiInfo+28,a
1732  054e 204f          	jra	L764
1733  0550               L115:
1734                     ; 486 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
1736  0550 ad56          	call	LC008
1737  0552 c70031        	ld	_uiInfo+49,a
1738                     ; 487 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
1740  0555 e601          	ld	a,(1,x)
1741  0557 a407          	and	a,#7
1742  0559 c70032        	ld	_uiInfo+50,a
1743                     ; 488 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
1745  055c ad44          	call	LC007
1746  055e c70033        	ld	_uiInfo+51,a
1747                     ; 489 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
1749  0561 e602          	ld	a,(2,x)
1750  0563 a407          	and	a,#7
1751  0565 c70034        	ld	_uiInfo+52,a
1752                     ; 491 				uiInfo.valve_sub_len[4] = buf[3];
1754  0568 e603          	ld	a,(3,x)
1755  056a c70029        	ld	_uiInfo+41,a
1756                     ; 492 				uiInfo.valve_sub_len[5] = buf[4];
1758  056d e604          	ld	a,(4,x)
1759  056f c7002a        	ld	_uiInfo+42,a
1760                     ; 493 				uiInfo.valve_sub_len[6] = buf[5];
1762  0572 e605          	ld	a,(5,x)
1763  0574 c7002b        	ld	_uiInfo+43,a
1764                     ; 494 				uiInfo.valve_sub_len[7] = buf[6];
1766  0577 e606          	ld	a,(6,x)
1767  0579 c7002c        	ld	_uiInfo+44,a
1768                     ; 496 				for (i = 4 ; i < 8 ; i++) {
1770  057c a604          	ld	a,#4
1771  057e 6b01          	ld	(OFST+0,sp),a
1772  0580               L515:
1773                     ; 497 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1775  0580 5f            	clrw	x
1776  0581 97            	ld	xl,a
1777  0582 724d002d      	tnz	(_uiInfo+45,x)
1778  0586 260f          	jrne	L325
1780  0588 5f            	clrw	x
1781  0589 97            	ld	xl,a
1782  058a 724d0025      	tnz	(_uiInfo+37,x)
1783  058e 2707          	jreq	L325
1784                     ; 498 						uiInfo.valve_sub_rc[i] = 8;
1786  0590 5f            	clrw	x
1787  0591 97            	ld	xl,a
1788  0592 a608          	ld	a,#8
1789  0594 d7002d        	ld	(_uiInfo+45,x),a
1790  0597               L325:
1791                     ; 496 				for (i = 4 ; i < 8 ; i++) {
1793  0597 0c01          	inc	(OFST+0,sp)
1796  0599 7b01          	ld	a,(OFST+0,sp)
1797  059b a108          	cp	a,#8
1798  059d 25e1          	jrult	L515
1799  059f               L764:
1800                     ; 504 }
1803  059f 5b03          	addw	sp,#3
1804  05a1 81            	ret	
1805  05a2               LC007:
1806  05a2 e602          	ld	a,(2,x)
1807  05a4 4e            	swap	a
1808  05a5 a407          	and	a,#7
1809  05a7 81            	ret	
1810  05a8               LC008:
1811  05a8 e601          	ld	a,(1,x)
1812  05aa 4e            	swap	a
1813  05ab a407          	and	a,#7
1814  05ad 81            	ret	
1815  05ae               LC009:
1816  05ae e601          	ld	a,(1,x)
1817  05b0 49            	rlc	a
1818  05b1 4f            	clr	a
1819  05b2 49            	rlc	a
1820  05b3 81            	ret	
1869                     ; 506 void rc_ptc_check(uint8_t *buf) {
1870                     	switch	.text
1871  05b4               _rc_ptc_check:
1873  05b4 89            	pushw	x
1874  05b5 88            	push	a
1875       00000001      OFST:	set	1
1878                     ; 508 	start = buf[0] & 0xF0;
1880  05b6 f6            	ld	a,(x)
1881  05b7 a4f0          	and	a,#240
1882  05b9 6b01          	ld	(OFST+0,sp),a
1883                     ; 510 	switch(start) {
1886                     ; 530 			break;
1887  05bb a020          	sub	a,#32
1888  05bd 2738          	jreq	L535
1889  05bf a010          	sub	a,#16
1890  05c1 271f          	jreq	L725
1891  05c3 a030          	sub	a,#48
1892  05c5 2729          	jreq	L335
1893  05c7 a010          	sub	a,#16
1894  05c9 2710          	jreq	L525
1895  05cb a080          	sub	a,#128
1896  05cd 271a          	jreq	L135
1897                     ; 526 		default:
1897                     ; 527 			state_check = RC_STATE_ERROR;
1899  05cf 3504000b      	mov	_state_check,#4
1900                     ; 528 			disp_char(buf[0]);
1902  05d3 1e02          	ldw	x,(OFST+1,sp)
1903  05d5 f6            	ld	a,(x)
1904  05d6 cd0000        	call	_disp_char
1906                     ; 530 			break;
1908  05d9 2021          	jra	L365
1909  05db               L525:
1910                     ; 511 		case BYTE_START_CNT_NORMAL:
1910                     ; 512 			rc_ptc_check_normal(buf);
1912  05db 1e02          	ldw	x,(OFST+1,sp)
1913  05dd cd00f8        	call	_rc_ptc_check_normal
1915                     ; 513 			break;
1917  05e0 201a          	jra	L365
1918  05e2               L725:
1919                     ; 514 		case BYTE_START_CNT_SETTING:
1919                     ; 515 			rc_ptc_check_setting(buf);
1921  05e2 1e02          	ldw	x,(OFST+1,sp)
1922  05e4 cd01e8        	call	_rc_ptc_check_setting
1924                     ; 516 			break;
1926  05e7 2013          	jra	L365
1927  05e9               L135:
1928                     ; 517 		case BYTE_START_RC_NORMAL:
1928                     ; 518 			rc_ptc_check_rc(buf);
1930  05e9 1e02          	ldw	x,(OFST+1,sp)
1931  05eb cd0225        	call	_rc_ptc_check_rc
1933                     ; 519 			break;
1935  05ee 200c          	jra	L365
1936  05f0               L335:
1937                     ; 520 		case BYTE_START_RC_SUBRC:
1937                     ; 521 			rc_ptc_check_subrc(buf);
1939  05f0 1e02          	ldw	x,(OFST+1,sp)
1940  05f2 cd03a2        	call	_rc_ptc_check_subrc
1942                     ; 522 			break;
1944  05f5 2005          	jra	L365
1945  05f7               L535:
1946                     ; 523 		case BYTE_START_CNT_MIRROR:
1946                     ; 524 			rc_ptc_check_mirror(buf);
1948  05f7 1e02          	ldw	x,(OFST+1,sp)
1949  05f9 cd03ea        	call	_rc_ptc_check_mirror
1951                     ; 525 			break;
1953  05fc               L365:
1954                     ; 532 }
1957  05fc 5b03          	addw	sp,#3
1958  05fe 81            	ret	
1991                     ; 534 void setSettingChange(uint8_t ch) {
1992                     	switch	.text
1993  05ff               _setSettingChange:
1997                     ; 535 	set_changed = ch;
1999  05ff c7000c        	ld	_set_changed,a
2000                     ; 536 }
2003  0602 81            	ret	
2027                     ; 538 uint8_t getSettingChange(void) {
2028                     	switch	.text
2029  0603               _getSettingChange:
2033                     ; 539 	return set_changed;
2035  0603 c6000c        	ld	a,_set_changed
2038  0606 81            	ret	
2062                     ; 542 uint8_t getState_check(void) {
2063                     	switch	.text
2064  0607               _getState_check:
2068                     ; 543 	return state_check;
2070  0607 c6000b        	ld	a,_state_check
2073  060a 81            	ret	
2106                     ; 546 void setState_check(uint8_t st) {
2107                     	switch	.text
2108  060b               _setState_check:
2112                     ; 547 	state_check = st;
2114  060b c7000b        	ld	_state_check,a
2115                     ; 548 }
2118  060e 81            	ret	
2175                     ; 550 void makeChecksum(uint8_t *buf) {
2176                     	switch	.text
2177  060f               _makeChecksum:
2179  060f 89            	pushw	x
2180  0610 89            	pushw	x
2181       00000002      OFST:	set	2
2184                     ; 555 	s = 0;
2186  0611 0f01          	clr	(OFST-1,sp)
2187                     ; 556 	for (i = 0 ; i < 7 ; i++) {
2189  0613 0f02          	clr	(OFST+0,sp)
2190  0615               L166:
2191                     ; 557 		s += buf[i];
2193  0615 7b03          	ld	a,(OFST+1,sp)
2194  0617 97            	ld	xl,a
2195  0618 7b04          	ld	a,(OFST+2,sp)
2196  061a 1b02          	add	a,(OFST+0,sp)
2197  061c 2401          	jrnc	L441
2198  061e 5c            	incw	x
2199  061f               L441:
2200  061f 02            	rlwa	x,a
2201  0620 7b01          	ld	a,(OFST-1,sp)
2202  0622 fb            	add	a,(x)
2203  0623 6b01          	ld	(OFST-1,sp),a
2204                     ; 556 	for (i = 0 ; i < 7 ; i++) {
2206  0625 0c02          	inc	(OFST+0,sp)
2209  0627 7b02          	ld	a,(OFST+0,sp)
2210  0629 a107          	cp	a,#7
2211  062b 25e8          	jrult	L166
2212                     ; 559 	buf[7] = s;
2214  062d 1e03          	ldw	x,(OFST+1,sp)
2215  062f 7b01          	ld	a,(OFST-1,sp)
2216  0631 e707          	ld	(7,x),a
2217                     ; 561 	for( j=0; j<8; j++ )
2219  0633 0f02          	clr	(OFST+0,sp)
2220  0635               L766:
2221                     ; 562 		disp_char(buf[j]);
2223  0635 7b03          	ld	a,(OFST+1,sp)
2224  0637 97            	ld	xl,a
2225  0638 7b04          	ld	a,(OFST+2,sp)
2226  063a 1b02          	add	a,(OFST+0,sp)
2227  063c 2401          	jrnc	L051
2228  063e 5c            	incw	x
2229  063f               L051:
2230  063f 02            	rlwa	x,a
2231  0640 f6            	ld	a,(x)
2232  0641 cd0000        	call	_disp_char
2234                     ; 561 	for( j=0; j<8; j++ )
2236  0644 0c02          	inc	(OFST+0,sp)
2239  0646 7b02          	ld	a,(OFST+0,sp)
2240  0648 a108          	cp	a,#8
2241  064a 25e9          	jrult	L766
2242                     ; 565 }
2245  064c 5b04          	addw	sp,#4
2246  064e 81            	ret	
2300                     ; 567 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2301                     	switch	.text
2302  064f               _rc_ptc_make_baseSetting:
2304  064f 89            	pushw	x
2305  0650 5203          	subw	sp,#3
2306       00000003      OFST:	set	3
2309                     ; 568 	switch (page) {
2311  0652 7b08          	ld	a,(OFST+5,sp)
2313                     ; 659 		break;
2314  0654 270f          	jreq	L576
2315  0656 4a            	dec	a
2316  0657 2603cc06fc    	jreq	L776
2317  065c 4a            	dec	a
2318  065d 2603cc07a2    	jreq	L107
2319  0662 cc0840        	jra	L727
2320  0665               L576:
2321                     ; 569 		case 0:
2321                     ; 570 			if (mode == CNT_MODE_MAIN) {
2323  0665 7b09          	ld	a,(OFST+6,sp)
2324  0667 2625          	jrne	L137
2325                     ; 571 				buf[1] = (_boiler_type << 7)
2325                     ; 572 									| ((uiInfo.plc & 0x07) << 4)
2325                     ; 573 									| (uiInfo.lpmType);
2327  0669 c60064        	ld	a,_uiInfo+100
2328  066c a407          	and	a,#7
2329  066e cd0849        	call	LC013
2330  0671 6b03          	ld	(OFST+0,sp),a
2331  0673 c60000        	ld	a,__boiler_type
2332  0676 cd0843        	call	LC012
2333  0679 1a03          	or	a,(OFST+0,sp)
2334  067b 1e04          	ldw	x,(OFST+1,sp)
2335  067d ca0013        	or	a,_uiInfo+19
2336  0680 e701          	ld	(1,x),a
2337                     ; 574 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2337                     ; 575 									| ((uiInfo.cnt & 0x07) << 4) 
2337                     ; 576 									| (uiInfo.valve & 0x0F);
2339  0682 c6000a        	ld	a,_uiInfo+10
2340  0685 a40f          	and	a,#15
2341  0687 6b03          	ld	(OFST+0,sp),a
2342  0689 c60005        	ld	a,_uiInfo+5
2343                     ; 577 				buf[3] = _boiler_water_shower;
2344                     ; 578 				buf[4] = uiInfo.houseCapa;
2345                     ; 579 				buf[5] = _boiler_water_heat;
2346                     ; 580 				buf[6] = 	(mode << 7) 
2346                     ; 581 									| (uiInfo.subRCLock << 6) 
2346                     ; 582 									| ((uiInfo.poType & 0x01) << 4) 
2346                     ; 583 									| ((uiInfo.cntlMode & 0x01) << 3) 
2346                     ; 584 									| uiInfo.opMode;
2348  068c 2017          	jp	LC011
2349  068e               L137:
2350                     ; 586 				buf[1] = (_boiler_type << 7) 
2350                     ; 587 									| (uiInfo.lpmType_sub);
2352  068e c60000        	ld	a,__boiler_type
2353  0691 cd0843        	call	LC012
2354  0694 1e04          	ldw	x,(OFST+1,sp)
2355  0696 ca0014        	or	a,_uiInfo+20
2356  0699 e701          	ld	(1,x),a
2357                     ; 588 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2357                     ; 589 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2357                     ; 590 									| (uiInfo.valve_sub & 0x0F);
2359  069b c6000b        	ld	a,_uiInfo+11
2360  069e a40f          	and	a,#15
2361  06a0 6b03          	ld	(OFST+0,sp),a
2362  06a2 c60006        	ld	a,_uiInfo+6
2363                     ; 591 				buf[3] = _boiler_water_shower;
2365                     ; 592 				buf[4] = uiInfo.houseCapa;
2367                     ; 593 				buf[5] = _boiler_water_heat;
2369                     ; 594 				buf[6] = 	(mode << 7) 
2369                     ; 595 									| (uiInfo.subRCLock << 6) 
2369                     ; 596 									| ((uiInfo.poType & 0x01) << 4) 
2369                     ; 597 									| ((uiInfo.cntlMode & 0x01) << 3) 
2369                     ; 598 									| uiInfo.opMode;
2371  06a5               LC011:
2372  06a5 a407          	and	a,#7
2373  06a7 cd0849        	call	LC013
2374  06aa 6b02          	ld	(OFST-1,sp),a
2375  06ac c6005e        	ld	a,_uiInfo+94
2376  06af a401          	and	a,#1
2377  06b1 cd0843        	call	LC012
2378  06b4 1a02          	or	a,(OFST-1,sp)
2379  06b6 1e04          	ldw	x,(OFST+1,sp)
2380  06b8 1a03          	or	a,(OFST+0,sp)
2381  06ba e702          	ld	(2,x),a
2383  06bc c60000        	ld	a,__boiler_water_shower
2384  06bf e703          	ld	(3,x),a
2386  06c1 c60010        	ld	a,_uiInfo+16
2387  06c4 e704          	ld	(4,x),a
2389  06c6 c60000        	ld	a,__boiler_water_heat
2390  06c9 e705          	ld	(5,x),a
2392  06cb c60003        	ld	a,_uiInfo+3
2393  06ce a401          	and	a,#1
2394  06d0 48            	sll	a
2395  06d1 48            	sll	a
2396  06d2 48            	sll	a
2397  06d3 6b03          	ld	(OFST+0,sp),a
2398  06d5 c6000f        	ld	a,_uiInfo+15
2399  06d8 a401          	and	a,#1
2400  06da cd0849        	call	LC013
2401  06dd 6b02          	ld	(OFST-1,sp),a
2402  06df c6005d        	ld	a,_uiInfo+93
2403  06e2 97            	ld	xl,a
2404  06e3 a640          	ld	a,#64
2405  06e5 42            	mul	x,a
2406  06e6 9f            	ld	a,xl
2407  06e7 6b01          	ld	(OFST-2,sp),a
2408  06e9 7b09          	ld	a,(OFST+6,sp)
2409  06eb cd0843        	call	LC012
2410  06ee 1a01          	or	a,(OFST-2,sp)
2411  06f0 1a02          	or	a,(OFST-1,sp)
2412  06f2 1a03          	or	a,(OFST+0,sp)
2413  06f4 ca0007        	or	a,_uiInfo+7
2414  06f7 1e04          	ldw	x,(OFST+1,sp)
2415  06f9 cc083e        	jp	LC010
2416  06fc               L776:
2417                     ; 601 		case 1:
2417                     ; 602 			if (mode == CNT_MODE_MAIN) {
2419  06fc 7b09          	ld	a,(OFST+6,sp)
2420  06fe 2651          	jrne	L537
2421                     ; 603 				buf[1] = mode << 7 
2421                     ; 604 							 | (uiInfo.valve_rc[0] << 4)
2421                     ; 605 							 | mode << 3 
2421                     ; 606 							 | uiInfo.valve_rc[1];
2423  0700 48            	sll	a
2424  0701 48            	sll	a
2425  0702 48            	sll	a
2426  0703 6b03          	ld	(OFST+0,sp),a
2427  0705 c6001d        	ld	a,_uiInfo+29
2428  0708 cd0849        	call	LC013
2429  070b 6b02          	ld	(OFST-1,sp),a
2430  070d 7b09          	ld	a,(OFST+6,sp)
2431  070f cd0843        	call	LC012
2432  0712 1a02          	or	a,(OFST-1,sp)
2433  0714 1a03          	or	a,(OFST+0,sp)
2434  0716 1e04          	ldw	x,(OFST+1,sp)
2435  0718 ca001e        	or	a,_uiInfo+30
2436  071b e701          	ld	(1,x),a
2437                     ; 607 				buf[2] = mode << 7 
2437                     ; 608 							 | (uiInfo.valve_rc[2] << 4)
2437                     ; 609 							 | mode << 3 
2437                     ; 610 							 | uiInfo.valve_rc[3];
2439  071d 7b09          	ld	a,(OFST+6,sp)
2440  071f 48            	sll	a
2441  0720 48            	sll	a
2442  0721 48            	sll	a
2443  0722 6b03          	ld	(OFST+0,sp),a
2444  0724 c6001f        	ld	a,_uiInfo+31
2445  0727 cd0849        	call	LC013
2446  072a 6b02          	ld	(OFST-1,sp),a
2447  072c 7b09          	ld	a,(OFST+6,sp)
2448  072e cd0843        	call	LC012
2449  0731 1a02          	or	a,(OFST-1,sp)
2450  0733 1a03          	or	a,(OFST+0,sp)
2451  0735 1e04          	ldw	x,(OFST+1,sp)
2452  0737 ca0020        	or	a,_uiInfo+32
2453  073a e702          	ld	(2,x),a
2454                     ; 611 				buf[3] = uiInfo.valve_len[0];
2456  073c c60015        	ld	a,_uiInfo+21
2457  073f e703          	ld	(3,x),a
2458                     ; 612 				buf[4] = uiInfo.valve_len[1];
2460  0741 c60016        	ld	a,_uiInfo+22
2461  0744 e704          	ld	(4,x),a
2462                     ; 613 				buf[5] = uiInfo.valve_len[2];
2464  0746 c60017        	ld	a,_uiInfo+23
2465  0749 e705          	ld	(5,x),a
2466                     ; 614 				buf[6] = uiInfo.valve_len[3];
2468  074b c60018        	ld	a,_uiInfo+24
2470  074e cc083e        	jp	LC010
2471  0751               L537:
2472                     ; 616 				buf[1] = mode << 7 
2472                     ; 617 							 | (uiInfo.valve_sub_rc[0] << 4)
2472                     ; 618 							 | mode << 3 
2472                     ; 619 							 | uiInfo.valve_sub_rc[1];
2474  0751 48            	sll	a
2475  0752 48            	sll	a
2476  0753 48            	sll	a
2477  0754 6b03          	ld	(OFST+0,sp),a
2478  0756 c6002d        	ld	a,_uiInfo+45
2479  0759 cd0849        	call	LC013
2480  075c 6b02          	ld	(OFST-1,sp),a
2481  075e 7b09          	ld	a,(OFST+6,sp)
2482  0760 cd0843        	call	LC012
2483  0763 1a02          	or	a,(OFST-1,sp)
2484  0765 1a03          	or	a,(OFST+0,sp)
2485  0767 1e04          	ldw	x,(OFST+1,sp)
2486  0769 ca002e        	or	a,_uiInfo+46
2487  076c e701          	ld	(1,x),a
2488                     ; 620 				buf[2] = mode << 7 
2488                     ; 621 							 | (uiInfo.valve_sub_rc[2] << 4)
2488                     ; 622 							 | mode << 3 
2488                     ; 623 							 | uiInfo.valve_sub_rc[3];
2490  076e 7b09          	ld	a,(OFST+6,sp)
2491  0770 48            	sll	a
2492  0771 48            	sll	a
2493  0772 48            	sll	a
2494  0773 6b03          	ld	(OFST+0,sp),a
2495  0775 c6002f        	ld	a,_uiInfo+47
2496  0778 cd0849        	call	LC013
2497  077b 6b02          	ld	(OFST-1,sp),a
2498  077d 7b09          	ld	a,(OFST+6,sp)
2499  077f cd0843        	call	LC012
2500  0782 1a02          	or	a,(OFST-1,sp)
2501  0784 1a03          	or	a,(OFST+0,sp)
2502  0786 1e04          	ldw	x,(OFST+1,sp)
2503  0788 ca0030        	or	a,_uiInfo+48
2504  078b e702          	ld	(2,x),a
2505                     ; 624 				buf[3] = uiInfo.valve_sub_len[0];
2507  078d c60025        	ld	a,_uiInfo+37
2508  0790 e703          	ld	(3,x),a
2509                     ; 625 				buf[4] = uiInfo.valve_sub_len[1];
2511  0792 c60026        	ld	a,_uiInfo+38
2512  0795 e704          	ld	(4,x),a
2513                     ; 626 				buf[5] = uiInfo.valve_sub_len[2];
2515  0797 c60027        	ld	a,_uiInfo+39
2516  079a e705          	ld	(5,x),a
2517                     ; 627 				buf[6] = uiInfo.valve_sub_len[3];
2519  079c c60028        	ld	a,_uiInfo+40
2520  079f cc083e        	jp	LC010
2521  07a2               L107:
2522                     ; 630 		case 2:
2522                     ; 631 			if (mode == CNT_MODE_MAIN) {
2524  07a2 7b09          	ld	a,(OFST+6,sp)
2525  07a4 264e          	jrne	L147
2526                     ; 632 				buf[1] = mode << 7 
2526                     ; 633 							 | (uiInfo.valve_rc[4] << 4) 
2526                     ; 634 							 | mode << 3 
2526                     ; 635 							 | uiInfo.valve_rc[5];
2528  07a6 48            	sll	a
2529  07a7 48            	sll	a
2530  07a8 48            	sll	a
2531  07a9 6b03          	ld	(OFST+0,sp),a
2532  07ab c60021        	ld	a,_uiInfo+33
2533  07ae cd0849        	call	LC013
2534  07b1 6b02          	ld	(OFST-1,sp),a
2535  07b3 7b09          	ld	a,(OFST+6,sp)
2536  07b5 cd0843        	call	LC012
2537  07b8 1a02          	or	a,(OFST-1,sp)
2538  07ba 1a03          	or	a,(OFST+0,sp)
2539  07bc 1e04          	ldw	x,(OFST+1,sp)
2540  07be ca0022        	or	a,_uiInfo+34
2541  07c1 e701          	ld	(1,x),a
2542                     ; 636 				buf[2] = mode << 7 
2542                     ; 637 							 | (uiInfo.valve_rc[6] << 4) 
2542                     ; 638 							 | mode << 3 
2542                     ; 639 							 | uiInfo.valve_rc[7];
2544  07c3 7b09          	ld	a,(OFST+6,sp)
2545  07c5 48            	sll	a
2546  07c6 48            	sll	a
2547  07c7 48            	sll	a
2548  07c8 6b03          	ld	(OFST+0,sp),a
2549  07ca c60023        	ld	a,_uiInfo+35
2550  07cd ad7a          	call	LC013
2551  07cf 6b02          	ld	(OFST-1,sp),a
2552  07d1 7b09          	ld	a,(OFST+6,sp)
2553  07d3 ad6e          	call	LC012
2554  07d5 1a02          	or	a,(OFST-1,sp)
2555  07d7 1a03          	or	a,(OFST+0,sp)
2556  07d9 1e04          	ldw	x,(OFST+1,sp)
2557  07db ca0024        	or	a,_uiInfo+36
2558  07de e702          	ld	(2,x),a
2559                     ; 640 				buf[3] = uiInfo.valve_len[4];
2561  07e0 c60019        	ld	a,_uiInfo+25
2562  07e3 e703          	ld	(3,x),a
2563                     ; 641 				buf[4] = uiInfo.valve_len[5];
2565  07e5 c6001a        	ld	a,_uiInfo+26
2566  07e8 e704          	ld	(4,x),a
2567                     ; 642 				buf[5] = uiInfo.valve_len[6];
2569  07ea c6001b        	ld	a,_uiInfo+27
2570  07ed e705          	ld	(5,x),a
2571                     ; 643 				buf[6] = uiInfo.valve_len[7];
2573  07ef c6001c        	ld	a,_uiInfo+28
2575  07f2 204a          	jp	LC010
2576  07f4               L147:
2577                     ; 645 				buf[1] = mode << 7 
2577                     ; 646 							 | (uiInfo.valve_sub_rc[4] << 4) 
2577                     ; 647 							 | mode << 3 
2577                     ; 648 							 | uiInfo.valve_sub_rc[5];
2579  07f4 48            	sll	a
2580  07f5 48            	sll	a
2581  07f6 48            	sll	a
2582  07f7 6b03          	ld	(OFST+0,sp),a
2583  07f9 c60031        	ld	a,_uiInfo+49
2584  07fc ad4b          	call	LC013
2585  07fe 6b02          	ld	(OFST-1,sp),a
2586  0800 7b09          	ld	a,(OFST+6,sp)
2587  0802 ad3f          	call	LC012
2588  0804 1a02          	or	a,(OFST-1,sp)
2589  0806 1a03          	or	a,(OFST+0,sp)
2590  0808 1e04          	ldw	x,(OFST+1,sp)
2591  080a ca0032        	or	a,_uiInfo+50
2592  080d e701          	ld	(1,x),a
2593                     ; 649 				buf[2] = mode << 7 
2593                     ; 650 							 | (uiInfo.valve_sub_rc[6] << 4) 
2593                     ; 651 							 | mode << 3 
2593                     ; 652 							 | uiInfo.valve_sub_rc[7];
2595  080f 7b09          	ld	a,(OFST+6,sp)
2596  0811 48            	sll	a
2597  0812 48            	sll	a
2598  0813 48            	sll	a
2599  0814 6b03          	ld	(OFST+0,sp),a
2600  0816 c60033        	ld	a,_uiInfo+51
2601  0819 ad2e          	call	LC013
2602  081b 6b02          	ld	(OFST-1,sp),a
2603  081d 7b09          	ld	a,(OFST+6,sp)
2604  081f ad22          	call	LC012
2605  0821 1a02          	or	a,(OFST-1,sp)
2606  0823 1a03          	or	a,(OFST+0,sp)
2607  0825 1e04          	ldw	x,(OFST+1,sp)
2608  0827 ca0034        	or	a,_uiInfo+52
2609  082a e702          	ld	(2,x),a
2610                     ; 653 				buf[3] = uiInfo.valve_sub_len[4];
2612  082c c60029        	ld	a,_uiInfo+41
2613  082f e703          	ld	(3,x),a
2614                     ; 654 				buf[4] = uiInfo.valve_sub_len[5];
2616  0831 c6002a        	ld	a,_uiInfo+42
2617  0834 e704          	ld	(4,x),a
2618                     ; 655 				buf[5] = uiInfo.valve_sub_len[6];
2620  0836 c6002b        	ld	a,_uiInfo+43
2621  0839 e705          	ld	(5,x),a
2622                     ; 656 				buf[6] = uiInfo.valve_sub_len[7];
2624  083b c6002c        	ld	a,_uiInfo+44
2625  083e               LC010:
2626  083e e706          	ld	(6,x),a
2627  0840               L727:
2628                     ; 661 }
2631  0840 5b05          	addw	sp,#5
2632  0842 81            	ret	
2633  0843               LC012:
2634  0843 97            	ld	xl,a
2635  0844 a680          	ld	a,#128
2636  0846 42            	mul	x,a
2637  0847 9f            	ld	a,xl
2638  0848 81            	ret	
2639  0849               LC013:
2640  0849 97            	ld	xl,a
2641  084a a610          	ld	a,#16
2642  084c 42            	mul	x,a
2643  084d 9f            	ld	a,xl
2644  084e 81            	ret	
2691                     ; 664 void rc_ptc_make_setting(uint8_t *buf) {
2692                     	switch	.text
2693  084f               _rc_ptc_make_setting:
2695  084f 89            	pushw	x
2696  0850 88            	push	a
2697       00000001      OFST:	set	1
2700                     ; 666 	uint8_t mode = uiInfo.controlMode;
2702  0851 c60009        	ld	a,_uiInfo+9
2703  0854 6b01          	ld	(OFST+0,sp),a
2704                     ; 668 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
2706  0856 c60007        	ld	a,_cur_set_page
2707  0859 1e02          	ldw	x,(OFST+1,sp)
2708  085b aa50          	or	a,#80
2709  085d f7            	ld	(x),a
2710                     ; 670 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
2712  085e 7b01          	ld	a,(OFST+0,sp)
2713  0860 88            	push	a
2714  0861 3b0007        	push	_cur_set_page
2715  0864 1e04          	ldw	x,(OFST+3,sp)
2716  0866 cd064f        	call	_rc_ptc_make_baseSetting
2718  0869 85            	popw	x
2719                     ; 672 	makeChecksum(buf);
2721  086a 1e02          	ldw	x,(OFST+1,sp)
2722  086c cd060f        	call	_makeChecksum
2724                     ; 673 }
2727  086f 5b03          	addw	sp,#3
2728  0871 81            	ret	
2731                     	switch	.data
2732  0004               _dr_out_count:
2733  0004 01            	dc.b	1
2780                     ; 679 void rc_ptc_make_normal(uint8_t *buf) {
2781                     	switch	.text
2782  0872               _rc_ptc_make_normal:
2784  0872 89            	pushw	x
2785       00000000      OFST:	set	0
2788                     ; 681 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
2790  0873 c60004        	ld	a,_uiInfo+4
2791  0876 1e01          	ldw	x,(OFST+1,sp)
2792  0878 aaf0          	or	a,#240
2793  087a f7            	ld	(x),a
2794                     ; 682 	buf[1] = _disp_mode2;
2796  087b c60000        	ld	a,__disp_mode2
2797  087e e701          	ld	(1,x),a
2798                     ; 683 	buf[2] = uiInfo.tCurr;
2800  0880 c60002        	ld	a,_uiInfo+2
2801  0883 e702          	ld	(2,x),a
2802                     ; 684 	buf[3] = 0x00;
2804  0885 6f03          	clr	(3,x)
2805                     ; 685 	buf[4] = 0x00;
2807  0887 6f04          	clr	(4,x)
2808                     ; 686 	buf[5] = 0x00;
2810  0889 6f05          	clr	(5,x)
2811                     ; 687 	buf[6] = 0x00;
2813  088b 6f06          	clr	(6,x)
2814                     ; 689 	if (uiInfo.mode == SETTING_MODE_MASTER) {
2816  088d c60008        	ld	a,_uiInfo+8
2817  0890 4a            	dec	a
2818  0891 2619          	jrne	L7101
2819                     ; 690 		buf[4] = _boiler_water_heat;
2821  0893 c60000        	ld	a,__boiler_water_heat
2822  0896 e704          	ld	(4,x),a
2823                     ; 691 		buf[6] = __boiler_shower[5] == 1 ? 1 : 0; // 온수모드   
2825  0898 c60005        	ld	a,___boiler_shower+5
2826  089b 4a            	dec	a
2827  089c 2603          	jrne	L461
2828  089e 4c            	inc	a
2829  089f 2001          	jra	L661
2830  08a1               L461:
2831  08a1 4f            	clr	a
2832  08a2               L661:
2833  08a2 e706          	ld	(6,x),a
2834                     ; 692 		buf[6] |= (_boiler_water_shower << 1);					// 온수
2836  08a4 c60000        	ld	a,__boiler_water_shower
2837  08a7 48            	sll	a
2838  08a8 ea06          	or	a,(6,x)
2839  08aa e706          	ld	(6,x),a
2840  08ac               L7101:
2841                     ; 695 	switch(buf[1]) {
2843  08ac e601          	ld	a,(1,x)
2845                     ; 730 		default:
2845                     ; 731 			break;
2846  08ae 4a            	dec	a
2847  08af 270d          	jreq	L567
2848  08b1 4a            	dec	a
2849  08b2 2711          	jreq	L767
2850  08b4 a006          	sub	a,#6
2851  08b6 2720          	jreq	L577
2852  08b8 a008          	sub	a,#8
2853  08ba 270e          	jreq	L377
2854  08bc 201f          	jra	L3201
2855  08be               L567:
2856                     ; 696 		case RC_MODE_HEAT:
2856                     ; 697 			buf[3] = uiInfo.tSetup;
2858  08be c6000e        	ld	a,_uiInfo+14
2859  08c1 e703          	ld	(3,x),a
2860                     ; 698 			break;
2862  08c3 2018          	jra	L3201
2863  08c5               L767:
2864                     ; 699 		case RC_MODE_OUT:
2864                     ; 700 			buf[5] = dr_mode_out;
2866  08c5 c60002        	ld	a,_dr_mode_out
2867                     ; 716 			break;
2869  08c8 2011          	jp	LC014
2870                     ; 717 		case RC_MODE_STOP:
2870                     ; 718 			break;
2872  08ca               L377:
2873                     ; 719 		case RC_MODE_REPEAT:
2873                     ; 720 			if(_timFlag == 0) {
2875  08ca c60000        	ld	a,__timFlag
2876  08cd 2604          	jrne	L5201
2877                     ; 721 				buf[3] = MAX_REPEAT_TEMP;
2879  08cf a650          	ld	a,#80
2880  08d1 e703          	ld	(3,x),a
2881  08d3               L5201:
2882                     ; 724 			buf[5] = uiInfo.repeat;
2884  08d3 c6000c        	ld	a,_uiInfo+12
2885                     ; 726 			break;
2887  08d6 2003          	jp	LC014
2888  08d8               L577:
2889                     ; 727 		case RC_MODE_RESERVE:
2889                     ; 728 			buf[5] = uiInfo.reserve;
2891  08d8 c6000d        	ld	a,_uiInfo+13
2892  08db               LC014:
2893  08db e705          	ld	(5,x),a
2894                     ; 729 			break;
2896                     ; 730 		default:
2896                     ; 731 			break;
2898  08dd               L3201:
2899                     ; 734 	makeChecksum(buf);
2901  08dd 1e01          	ldw	x,(OFST+1,sp)
2902  08df cd060f        	call	_makeChecksum
2904                     ; 736 	if (disp_mode_preview != _disp_mode2){
2906  08e2 c60002        	ld	a,_disp_mode_preview
2907  08e5 c10000        	cp	a,__disp_mode2
2908  08e8 2712          	jreq	L7201
2909                     ; 737 		if (uiInfo.mode == SETTING_MODE_SUB) {
2911                     ; 739 				UPDATE_BIT(BIT_DISPMODE);
2914                     ; 740 				disp_mode_preview = _disp_mode2;
2917                     ; 743 			UPDATE_BIT(BIT_DISPMODE);
2923                     ; 744 			disp_mode_preview = _disp_mode2;
2927  08ea 72160000      	bset	__updateBit,#3
2929  08ee 5500000000    	mov	__updateTimer,___timer1s
2931  08f3 35050000      	mov	__updateCount,#5
2933  08f7 5500000002    	mov	_disp_mode_preview,__disp_mode2
2934  08fc               L7201:
2935                     ; 748 	only_one++;
2937  08fc 725c0003      	inc	_only_one
2938                     ; 749 }
2941  0900 85            	popw	x
2942  0901 81            	ret	
2994                     ; 752 uint8_t rc_ptc_check_subRC(void) {
2995                     	switch	.text
2996  0902               _rc_ptc_check_subRC:
2998  0902 89            	pushw	x
2999       00000002      OFST:	set	2
3002                     ; 757 	if (_remote == 1) {
3004  0903 c60000        	ld	a,__remote
3005  0906 4a            	dec	a
3006  0907 2603          	jrne	L5601
3007                     ; 758 		return 0xFF;
3009  0909 4a            	dec	a
3012  090a 85            	popw	x
3013  090b 81            	ret	
3014  090c               L5601:
3015                     ; 761 	ch = 0;
3017  090c 0f01          	clr	(OFST-1,sp)
3018                     ; 762 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
3020  090e cd0a53        	call	LC017
3021  0911 d60025        	ld	a,(_rcSubDataInfo+16,x)
3022  0914 4c            	inc	a
3023  0915 2704          	jreq	L7601
3024                     ; 763 		ch = 1;
3026  0917 a601          	ld	a,#1
3027  0919 6b01          	ld	(OFST-1,sp),a
3028  091b               L7601:
3029                     ; 766 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
3031  091b c60004        	ld	a,_uiInfo+4
3032  091e 5f            	clrw	x
3033  091f 97            	ld	xl,a
3034  0920 5a            	decw	x
3035  0921 c60000        	ld	a,__disp_mode2
3036  0924 d70025        	ld	(_rcSubDataInfo+16,x),a
3037                     ; 767 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
3039  0927 cd0a53        	call	LC017
3040  092a c60002        	ld	a,_uiInfo+2
3041  092d d70015        	ld	(_rcSubDataInfo,x),a
3042                     ; 768 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
3044  0930 cd0a53        	call	LC017
3045  0933 c6000e        	ld	a,_uiInfo+14
3046  0936 d7001d        	ld	(_rcSubDataInfo+8,x),a
3047                     ; 769 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
3049  0939 cd0a53        	call	LC017
3050  093c c6000d        	ld	a,_uiInfo+13
3051  093f d70035        	ld	(_rcSubDataInfo+32,x),a
3052                     ; 770 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
3054  0942 cd0a53        	call	LC017
3055  0945 c6000c        	ld	a,_uiInfo+12
3056  0948 d7003d        	ld	(_rcSubDataInfo+40,x),a
3057                     ; 772 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
3059  094b cd0a53        	call	LC017
3060  094e c60000        	ld	a,__disp_mode2
3061  0951 d70045        	ld	(_uiInfo+69,x),a
3062                     ; 773 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
3064  0954 cd0a53        	call	LC017
3065  0957 c60002        	ld	a,_uiInfo+2
3066  095a d70035        	ld	(_uiInfo+53,x),a
3067                     ; 774 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
3069  095d cd0a53        	call	LC017
3070  0960 c6000e        	ld	a,_uiInfo+14
3071  0963 d7003d        	ld	(_uiInfo+61,x),a
3072                     ; 775 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
3074  0966 cd0a53        	call	LC017
3075  0969 c6000d        	ld	a,_uiInfo+13
3076  096c d7004d        	ld	(_uiInfo+77,x),a
3077                     ; 776 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
3079  096f cd0a53        	call	LC017
3080  0972 c6000c        	ld	a,_uiInfo+12
3081  0975 d70055        	ld	(_uiInfo+85,x),a
3082                     ; 778 	if (ch == 0) {
3084  0978 7b01          	ld	a,(OFST-1,sp)
3085  097a 2603          	jrne	L1701
3086                     ; 780 		return 0xFF;
3088  097c 4a            	dec	a
3091  097d 85            	popw	x
3092  097e 81            	ret	
3093  097f               L1701:
3094                     ; 783 	num = 0xFF;
3096  097f a6ff          	ld	a,#255
3097  0981 6b01          	ld	(OFST-1,sp),a
3098                     ; 784 	for (i = 0 ; i < 8 ; i++) {
3100  0983 4f            	clr	a
3101  0984 6b02          	ld	(OFST+0,sp),a
3102  0986               L3701:
3103                     ; 785 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
3105  0986 5f            	clrw	x
3106  0987 97            	ld	xl,a
3107  0988 d6001d        	ld	a,(_rcSubDataInfo+8,x)
3108  098b a1aa          	cp	a,#170
3109  098d 2756          	jreq	L5701
3110                     ; 786 			continue;
3112                     ; 789 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
3114  098f 7b02          	ld	a,(OFST+0,sp)
3115  0991 cd0a5a        	call	LC018
3116  0994 90d60045      	ld	a,(_uiInfo+69,y)
3117  0998 d10025        	cp	a,(_rcSubDataInfo+16,x)
3118  099b 2706          	jreq	L3011
3119                     ; 790 			num = i;
3121  099d 7b02          	ld	a,(OFST+0,sp)
3122  099f 6b01          	ld	(OFST-1,sp),a
3123                     ; 791 			break;
3125  09a1 204c          	jra	L7701
3126  09a3               L3011:
3127                     ; 794 		switch (rcSubDataInfo.mode_heat[i]) {
3129  09a3 7b02          	ld	a,(OFST+0,sp)
3130  09a5 5f            	clrw	x
3131  09a6 97            	ld	xl,a
3132  09a7 d60025        	ld	a,(_rcSubDataInfo+16,x)
3134                     ; 812 				break;
3135  09aa 4a            	dec	a
3136  09ab 270a          	jreq	L5301
3137  09ad a007          	sub	a,#7
3138  09af 2722          	jreq	L3401
3139  09b1 a008          	sub	a,#8
3140  09b3 2710          	jreq	L1401
3141  09b5 202e          	jra	L5701
3142  09b7               L5301:
3143                     ; 795 			case RC_MODE_HEAT:
3143                     ; 796 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
3145  09b7 7b02          	ld	a,(OFST+0,sp)
3146  09b9 cd0a5a        	call	LC018
3147  09bc 90d6003d      	ld	a,(_uiInfo+61,y)
3148  09c0 d1001d        	cp	a,(_rcSubDataInfo+8,x)
3149                     ; 797 					num = i;
3150  09c3 201a          	jp	LC016
3151                     ; 800 			case RC_MODE_OUT:
3151                     ; 801 			case RC_MODE_STOP:
3151                     ; 802 				break;
3153  09c5               L1401:
3154                     ; 803 			case RC_MODE_REPEAT:
3154                     ; 804 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
3156  09c5 7b02          	ld	a,(OFST+0,sp)
3157  09c7 cd0a5a        	call	LC018
3158  09ca 90d60055      	ld	a,(_uiInfo+85,y)
3159  09ce d1003d        	cp	a,(_rcSubDataInfo+40,x)
3160                     ; 805 					num = i;
3161  09d1 200c          	jp	LC016
3162  09d3               L3401:
3163                     ; 808 			case RC_MODE_RESERVE:
3163                     ; 809 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
3165  09d3 7b02          	ld	a,(OFST+0,sp)
3166  09d5 cd0a5a        	call	LC018
3167  09d8 90d6004d      	ld	a,(_uiInfo+77,y)
3168  09dc d10035        	cp	a,(_rcSubDataInfo+32,x)
3169                     ; 810 					num = i;
3171  09df               LC016:
3172  09df 2704          	jreq	L5701
3175  09e1 7b02          	ld	a,(OFST+0,sp)
3176  09e3 6b01          	ld	(OFST-1,sp),a
3177  09e5               L5701:
3178                     ; 784 	for (i = 0 ; i < 8 ; i++) {
3180  09e5 0c02          	inc	(OFST+0,sp)
3183  09e7 7b02          	ld	a,(OFST+0,sp)
3184  09e9 a108          	cp	a,#8
3185  09eb 2599          	jrult	L3701
3186  09ed 7b01          	ld	a,(OFST-1,sp)
3187  09ef               L7701:
3188                     ; 816 	if (num == 0xFF) {
3190  09ef a1ff          	cp	a,#255
3191  09f1 260a          	jrne	L7111
3192                     ; 817 		ret_count = MAX_REPEAT_ERROR_COUNT;
3194  09f3 35050001      	mov	_ret_count,#5
3195                     ; 818 		cur_src = 0;
3197  09f7 725f0000      	clr	_cur_src
3198                     ; 819 		return num;
3201  09fb 2054          	jra	L471
3202  09fd               L7111:
3203                     ; 822 	if (cur_src == num) {
3205  09fd c60000        	ld	a,_cur_src
3206  0a00 1101          	cp	a,(OFST-1,sp)
3207  0a02 2642          	jrne	L1211
3208                     ; 823 		ret_count--;
3210  0a04 725a0001      	dec	_ret_count
3211                     ; 825 		if (ret_count == 0) {
3213  0a08 2645          	jrne	L5211
3214                     ; 826 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
3216  0a0a 7b01          	ld	a,(OFST-1,sp)
3217  0a0c 5f            	clrw	x
3218  0a0d 97            	ld	xl,a
3219  0a0e d60045        	ld	a,(_uiInfo+69,x)
3220  0a11 d70025        	ld	(_rcSubDataInfo+16,x),a
3221                     ; 827 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
3223  0a14 5f            	clrw	x
3224  0a15 7b01          	ld	a,(OFST-1,sp)
3225  0a17 97            	ld	xl,a
3226  0a18 d60035        	ld	a,(_uiInfo+53,x)
3227  0a1b d70015        	ld	(_rcSubDataInfo,x),a
3228                     ; 828 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
3230  0a1e 5f            	clrw	x
3231  0a1f 7b01          	ld	a,(OFST-1,sp)
3232  0a21 97            	ld	xl,a
3233  0a22 d6003d        	ld	a,(_uiInfo+61,x)
3234  0a25 d7001d        	ld	(_rcSubDataInfo+8,x),a
3235                     ; 829 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
3237  0a28 5f            	clrw	x
3238  0a29 7b01          	ld	a,(OFST-1,sp)
3239  0a2b 97            	ld	xl,a
3240  0a2c d6004d        	ld	a,(_uiInfo+77,x)
3241  0a2f d70035        	ld	(_rcSubDataInfo+32,x),a
3242                     ; 830 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
3244  0a32 5f            	clrw	x
3245  0a33 7b01          	ld	a,(OFST-1,sp)
3246  0a35 97            	ld	xl,a
3247  0a36 d60055        	ld	a,(_uiInfo+85,x)
3248  0a39 d7003d        	ld	(_rcSubDataInfo+40,x),a
3249                     ; 832 			ret_count = MAX_REPEAT_ERROR_COUNT;
3251  0a3c 35050001      	mov	_ret_count,#5
3252                     ; 833 			num = 0xFF;
3254  0a40 a6ff          	ld	a,#255
3255  0a42 6b01          	ld	(OFST-1,sp),a
3256  0a44 2009          	jra	L5211
3257  0a46               L1211:
3258                     ; 836 		cur_src = num;
3260  0a46 7b01          	ld	a,(OFST-1,sp)
3261  0a48 c70000        	ld	_cur_src,a
3262                     ; 837 		ret_count = MAX_REPEAT_ERROR_COUNT;
3264  0a4b 35050001      	mov	_ret_count,#5
3265  0a4f               L5211:
3266                     ; 840 	return num;
3268  0a4f 7b01          	ld	a,(OFST-1,sp)
3270  0a51               L471:
3272  0a51 85            	popw	x
3273  0a52 81            	ret	
3274  0a53               LC017:
3275  0a53 5f            	clrw	x
3276  0a54 c60004        	ld	a,_uiInfo+4
3277  0a57 97            	ld	xl,a
3278  0a58 5a            	decw	x
3279  0a59 81            	ret	
3280  0a5a               LC018:
3281  0a5a 5f            	clrw	x
3282  0a5b 97            	ld	xl,a
3283  0a5c 905f          	clrw	y
3284  0a5e 9097          	ld	yl,a
3285  0a60 81            	ret	
3329                     ; 844 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3330                     	switch	.text
3331  0a61               _rc_ptc_make_subRC:
3333  0a61 89            	pushw	x
3334       00000000      OFST:	set	0
3337                     ; 845 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3339  0a62 7b05          	ld	a,(OFST+5,sp)
3340  0a64 4c            	inc	a
3341  0a65 1e01          	ldw	x,(OFST+1,sp)
3342  0a67 aa60          	or	a,#96
3343  0a69 f7            	ld	(x),a
3344                     ; 846 	buf[1] = uiInfo.remote_mode[num];
3346  0a6a 5f            	clrw	x
3347  0a6b 7b05          	ld	a,(OFST+5,sp)
3348  0a6d 97            	ld	xl,a
3349  0a6e d60045        	ld	a,(_uiInfo+69,x)
3350  0a71 1e01          	ldw	x,(OFST+1,sp)
3351                     ; 847 	buf[2] = 0x00;
3353  0a73 6f02          	clr	(2,x)
3354  0a75 e701          	ld	(1,x),a
3355                     ; 848 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3357  0a77 5f            	clrw	x
3358  0a78 7b05          	ld	a,(OFST+5,sp)
3359  0a7a 97            	ld	xl,a
3360  0a7b d60045        	ld	a,(_uiInfo+69,x)
3361  0a7e 4a            	dec	a
3362  0a7f 260d          	jrne	L7411
3363                     ; 849 		buf[3] = uiInfo.tempSetup[num];
3365  0a81 7b05          	ld	a,(OFST+5,sp)
3366  0a83 5f            	clrw	x
3367  0a84 97            	ld	xl,a
3368  0a85 d6003d        	ld	a,(_uiInfo+61,x)
3369  0a88 1e01          	ldw	x,(OFST+1,sp)
3370  0a8a e703          	ld	(3,x),a
3372  0a8c 2004          	jra	L1511
3373  0a8e               L7411:
3374                     ; 851 		buf[3] = 0x00;
3376  0a8e 1e01          	ldw	x,(OFST+1,sp)
3377  0a90 6f03          	clr	(3,x)
3378  0a92               L1511:
3379                     ; 854 	buf[4] = 0x00;
3381  0a92 6f04          	clr	(4,x)
3382                     ; 856 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3384  0a94 5f            	clrw	x
3385  0a95 7b05          	ld	a,(OFST+5,sp)
3386  0a97 97            	ld	xl,a
3387  0a98 d60045        	ld	a,(_uiInfo+69,x)
3388  0a9b a110          	cp	a,#16
3389  0a9d 2609          	jrne	L3511
3390                     ; 857 		buf[5] = uiInfo.remote_banb[num];
3392  0a9f 7b05          	ld	a,(OFST+5,sp)
3393  0aa1 5f            	clrw	x
3394  0aa2 97            	ld	xl,a
3395  0aa3 d60055        	ld	a,(_uiInfo+85,x)
3397  0aa6 2012          	jp	LC019
3398  0aa8               L3511:
3399                     ; 858 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3401  0aa8 7b05          	ld	a,(OFST+5,sp)
3402  0aaa 5f            	clrw	x
3403  0aab 97            	ld	xl,a
3404  0aac d60045        	ld	a,(_uiInfo+69,x)
3405  0aaf a108          	cp	a,#8
3406  0ab1 260d          	jrne	L7511
3407                     ; 859 		buf[5] = uiInfo.remote_time[num];
3409  0ab3 7b05          	ld	a,(OFST+5,sp)
3410  0ab5 5f            	clrw	x
3411  0ab6 97            	ld	xl,a
3412  0ab7 d6004d        	ld	a,(_uiInfo+77,x)
3413  0aba               LC019:
3414  0aba 1e01          	ldw	x,(OFST+1,sp)
3415  0abc e705          	ld	(5,x),a
3417  0abe 2004          	jra	L5511
3418  0ac0               L7511:
3419                     ; 861 		buf[5] = 0x00;
3421  0ac0 1e01          	ldw	x,(OFST+1,sp)
3422  0ac2 6f05          	clr	(5,x)
3423  0ac4               L5511:
3424                     ; 864 	buf[6] = 0x00;
3426  0ac4 6f06          	clr	(6,x)
3427                     ; 866 	makeChecksum(buf);
3429  0ac6 cd060f        	call	_makeChecksum
3431                     ; 867 }
3434  0ac9 85            	popw	x
3435  0aca 81            	ret	
3474                     ; 869 void rc_ptc_make_error(uint8_t *buf) {
3475                     	switch	.text
3476  0acb               _rc_ptc_make_error:
3478  0acb 89            	pushw	x
3479       00000000      OFST:	set	0
3482                     ; 870 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3484  0acc c60004        	ld	a,_uiInfo+4
3485  0acf 1e01          	ldw	x,(OFST+1,sp)
3486  0ad1 aae0          	or	a,#224
3487  0ad3 f7            	ld	(x),a
3488                     ; 871 	buf[1] = error;
3490  0ad4 c6000a        	ld	a,_error
3491  0ad7 e701          	ld	(1,x),a
3492                     ; 872 	buf[2] = mode_recover;
3494  0ad9 c6000f        	ld	a,_mode_recover
3495  0adc e702          	ld	(2,x),a
3496                     ; 873 	buf[3] = 0x00;
3498  0ade 6f03          	clr	(3,x)
3499                     ; 874 	buf[4] = 0x00;
3501  0ae0 6f04          	clr	(4,x)
3502                     ; 875 	buf[5] = 0x00;
3504  0ae2 6f05          	clr	(5,x)
3505                     ; 876 	buf[6] = 0x00;
3507  0ae4 6f06          	clr	(6,x)
3508                     ; 878 	makeChecksum(buf);
3510  0ae6 cd060f        	call	_makeChecksum
3512                     ; 879 }
3515  0ae9 85            	popw	x
3516  0aea 81            	ret	
3553                     ; 881 void rc_ptc_make_command(uint8_t *buf) {
3554                     	switch	.text
3555  0aeb               _rc_ptc_make_command:
3557  0aeb 89            	pushw	x
3558       00000000      OFST:	set	0
3561                     ; 882 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3563  0aec c60004        	ld	a,_uiInfo+4
3564  0aef 1e01          	ldw	x,(OFST+1,sp)
3565  0af1 aaf0          	or	a,#240
3566  0af3 f7            	ld	(x),a
3567                     ; 883 	buf[1] = 0x20;
3569  0af4 a620          	ld	a,#32
3570  0af6 e701          	ld	(1,x),a
3571                     ; 884 	buf[2] = 0x00;
3573  0af8 6f02          	clr	(2,x)
3574                     ; 885 	buf[3] = 0x00;
3576  0afa 6f03          	clr	(3,x)
3577                     ; 886 	buf[4] = 0x00;
3579  0afc 6f04          	clr	(4,x)
3580                     ; 887 	buf[5] = 0x00;
3582  0afe 6f05          	clr	(5,x)
3583                     ; 888 	buf[6] = 0x00;
3585  0b00 6f06          	clr	(6,x)
3586                     ; 889 }
3589  0b02 85            	popw	x
3590  0b03 81            	ret	
3642                     ; 899 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
3642                     ; 900 {
3643                     	switch	.text
3644  0b04               _rc_ptc_make_command_packet:
3646  0b04 89            	pushw	x
3647       00000000      OFST:	set	0
3650                     ; 901 	rc_ptc_make_command(buf);
3652  0b05 ade4          	call	_rc_ptc_make_command
3654                     ; 902 	switch( cmd )
3656  0b07 7b05          	ld	a,(OFST+5,sp)
3658                     ; 929 		break;
3659  0b09 4a            	dec	a
3660  0b0a 270c          	jreq	L7121
3661  0b0c a003          	sub	a,#3
3662  0b0e 270d          	jreq	L1221
3663  0b10 4a            	dec	a
3664  0b11 2710          	jreq	L3221
3665  0b13 4a            	dec	a
3666  0b14 2713          	jreq	L5221
3667  0b16 201b          	jra	L3521
3668  0b18               L7121:
3669                     ; 904 	case PKT_CMD_MIRROR:
3669                     ; 905 		buf[2] = COMMAND_MODE_MIRROR;
3671  0b18 1e01          	ldw	x,(OFST+1,sp)
3672  0b1a 4c            	inc	a
3673                     ; 906 		buf[3] = p1;
3674                     ; 907 		break;
3676  0b1b 2010          	jp	LC020
3677  0b1d               L1221:
3678                     ; 918 	case PKT_CMD_FACTORY:
3678                     ; 919 		buf[2] = COMMAND_MODE_FACTORY;
3680  0b1d 1e01          	ldw	x,(OFST+1,sp)
3681  0b1f a608          	ld	a,#8
3682                     ; 920 		buf[3] = p1;
3683                     ; 921 		break;
3685  0b21 200a          	jp	LC020
3686  0b23               L3221:
3687                     ; 922 	case PKT_CMD_RESET:
3687                     ; 923 		buf[2] = COMMAND_MODE_RESET;
3689  0b23 1e01          	ldw	x,(OFST+1,sp)
3690  0b25 a604          	ld	a,#4
3691                     ; 924 		buf[3] = p1;
3692                     ; 925 		break;
3694  0b27 2004          	jp	LC020
3695  0b29               L5221:
3696                     ; 926 	case PKT_CMD_BOILER_HOT_MODE:
3696                     ; 927 		buf[2] = COMMAND_MODE_HOTWATER;
3698  0b29 1e01          	ldw	x,(OFST+1,sp)
3699  0b2b a602          	ld	a,#2
3700                     ; 928 		buf[3] = p1;
3702  0b2d               LC020:
3703  0b2d e702          	ld	(2,x),a
3707  0b2f 7b06          	ld	a,(OFST+6,sp)
3708  0b31 e703          	ld	(3,x),a
3709                     ; 929 		break;
3711  0b33               L3521:
3712                     ; 932 	makeChecksum(buf);
3714  0b33 1e01          	ldw	x,(OFST+1,sp)
3715  0b35 cd060f        	call	_makeChecksum
3717                     ; 933 }
3720  0b38 85            	popw	x
3721  0b39 81            	ret	
3767                     ; 969 void rc_ptc_make_mirror(uint8_t *buf) {
3768                     	switch	.text
3769  0b3a               _rc_ptc_make_mirror:
3771  0b3a 89            	pushw	x
3772  0b3b 88            	push	a
3773       00000001      OFST:	set	1
3776                     ; 971 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
3778  0b3c c60006        	ld	a,_cur_mirror_page
3779  0b3f 1e02          	ldw	x,(OFST+1,sp)
3780  0b41 aa40          	or	a,#64
3781  0b43 f7            	ld	(x),a
3782                     ; 973 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
3784  0b44 c60011        	ld	a,_mode_mirror
3785  0b47 4a            	dec	a
3786  0b48 2702          	jreq	L222
3787  0b4a a601          	ld	a,#1
3788  0b4c               L222:
3789  0b4c 6b01          	ld	(OFST+0,sp),a
3790                     ; 974 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
3792  0b4e 88            	push	a
3793  0b4f 3b0006        	push	_cur_mirror_page
3794  0b52 1e04          	ldw	x,(OFST+3,sp)
3795  0b54 cd064f        	call	_rc_ptc_make_baseSetting
3797  0b57 85            	popw	x
3798                     ; 976 	makeChecksum(buf);
3800  0b58 1e02          	ldw	x,(OFST+1,sp)
3801  0b5a cd060f        	call	_makeChecksum
3803                     ; 978 	if (cur_mirror_page == 2) {
3805  0b5d c60006        	ld	a,_cur_mirror_page
3806  0b60 a102          	cp	a,#2
3807  0b62 2608          	jrne	L5721
3808                     ; 979 		cur_mirror_page = 0;
3810  0b64 725f0006      	clr	_cur_mirror_page
3811                     ; 980 		mode_mirror = 0;
3813  0b68 725f0011      	clr	_mode_mirror
3814  0b6c               L5721:
3815                     ; 982 }
3818  0b6c 5b03          	addw	sp,#3
3819  0b6e 81            	ret	
3877                     ; 984 void rc_ptc_make(uint8_t *buf) {
3878                     	switch	.text
3879  0b6f               _rc_ptc_make:
3881  0b6f 89            	pushw	x
3882  0b70 88            	push	a
3883       00000001      OFST:	set	1
3886                     ; 988 	if (error != 0 && error_type != 0) {
3888  0b71 c6000a        	ld	a,_error
3889  0b74 2705          	jreq	L3231
3891  0b76 c60009        	ld	a,_error_type
3892                     ; 989 		rc_ptc_make_error(buf);
3894                     ; 990 		return;
3896  0b79 2608          	jrne	LC021
3897  0b7b               L3231:
3898                     ; 992 		if (mode_recover == 1) {
3900  0b7b c6000f        	ld	a,_mode_recover
3901  0b7e 4a            	dec	a
3902  0b7f 2608          	jrne	L5231
3903                     ; 993 			rc_ptc_make_error(buf);
3905  0b81 1e02          	ldw	x,(OFST+1,sp)
3906  0b83               LC021:
3908  0b83 cd0acb        	call	_rc_ptc_make_error
3910                     ; 994 			return;
3911  0b86               L462:
3914  0b86 5b03          	addw	sp,#3
3915  0b88 81            	ret	
3916  0b89               L5231:
3917                     ; 998 	switch (uiInfo.mode) {
3919  0b89 c60008        	ld	a,_uiInfo+8
3921                     ; 1046 			break;
3922  0b8c 276a          	jreq	LC022
3923  0b8e 4a            	dec	a
3924  0b8f 26f5          	jrne	L462
3925                     ; 999 		case SETTING_MODE_MASTER:
3925                     ; 1000 			
3925                     ; 1001 			if (getSettingChange() == 1) {
3927  0b91 cd0603        	call	_getSettingChange
3929  0b94 4a            	dec	a
3930  0b95 2607          	jrne	L5331
3931                     ; 1002 				rc_ptc_make_setting(buf);
3933  0b97 1e02          	ldw	x,(OFST+1,sp)
3934  0b99 cd084f        	call	_rc_ptc_make_setting
3936                     ; 1003 				return;
3938  0b9c 20e8          	jra	L462
3939  0b9e               L5331:
3940                     ; 1007 			if (mode_mirror != 0) {
3942  0b9e c60011        	ld	a,_mode_mirror
3943  0ba1 270d          	jreq	L7331
3944                     ; 1008 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
3946  0ba3 3b0011        	push	_mode_mirror
3947  0ba6 4b01          	push	#1
3948  0ba8 1e04          	ldw	x,(OFST+3,sp)
3949  0baa cd0b04        	call	_rc_ptc_make_command_packet
3951  0bad 85            	popw	x
3952                     ; 1009 				return;
3954  0bae 20d6          	jra	L462
3955  0bb0               L7331:
3956                     ; 1012 			if (mode_factory != 0) {
3958  0bb0 c60010        	ld	a,_mode_factory
3959  0bb3 2711          	jreq	L1431
3960                     ; 1014 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
3962  0bb5 3b0010        	push	_mode_factory
3963  0bb8 4b04          	push	#4
3964  0bba 1e04          	ldw	x,(OFST+3,sp)
3965  0bbc cd0b04        	call	_rc_ptc_make_command_packet
3967  0bbf 725f0010      	clr	_mode_factory
3968  0bc3 85            	popw	x
3969                     ; 1015 				mode_factory = 0;
3971                     ; 1016 				return;
3973  0bc4 20c0          	jra	L462
3974  0bc6               L1431:
3975                     ; 1019 			if (mode_hotwater != 0) {
3977  0bc6 c6000e        	ld	a,_mode_hotwater
3978  0bc9 270d          	jreq	L3431
3979                     ; 1021 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
3981  0bcb 3b000e        	push	_mode_hotwater
3982  0bce 4b06          	push	#6
3983  0bd0 1e04          	ldw	x,(OFST+3,sp)
3984  0bd2 cd0b04        	call	_rc_ptc_make_command_packet
3986  0bd5 85            	popw	x
3987                     ; 1022 				return;
3989  0bd6 20ae          	jra	L462
3990  0bd8               L3431:
3991                     ; 1025 			if (mode_reset != 0) {
3993  0bd8 c6000d        	ld	a,_mode_reset
3994  0bdb 270d          	jreq	L5431
3995                     ; 1027 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
3997  0bdd 3b000d        	push	_mode_reset
3998  0be0 4b05          	push	#5
3999  0be2 1e04          	ldw	x,(OFST+3,sp)
4000  0be4 cd0b04        	call	_rc_ptc_make_command_packet
4002  0be7 85            	popw	x
4003                     ; 1028 				return;
4005  0be8 209c          	jra	L462
4006  0bea               L5431:
4007                     ; 1032 			num = rc_ptc_check_subRC();
4009  0bea cd0902        	call	_rc_ptc_check_subRC
4011  0bed 6b01          	ld	(OFST+0,sp),a
4012                     ; 1033 			if ( num == 0xFF) {
4014  0bef 4c            	inc	a
4015                     ; 1034 				rc_ptc_make_normal(buf);
4017                     ; 1035 				return;
4019  0bf0 2706          	jreq	LC022
4020                     ; 1038 			if (_remote == 1) {
4022  0bf2 c60000        	ld	a,__remote
4023  0bf5 4a            	dec	a
4024  0bf6 2607          	jrne	L1531
4025                     ; 1039 				rc_ptc_make_normal(buf);
4027  0bf8               LC022:
4030  0bf8 1e02          	ldw	x,(OFST+1,sp)
4031  0bfa cd0872        	call	_rc_ptc_make_normal
4034  0bfd 2087          	jra	L462
4035  0bff               L1531:
4036                     ; 1041 				rc_ptc_make_subRC(buf, num);
4038  0bff 7b01          	ld	a,(OFST+0,sp)
4039  0c01 88            	push	a
4040  0c02 1e03          	ldw	x,(OFST+2,sp)
4041  0c04 cd0a61        	call	_rc_ptc_make_subRC
4043  0c07 84            	pop	a
4044  0c08 cc0b86        	jra	L462
4045                     ; 1044 		case SETTING_MODE_SUB:
4045                     ; 1045 			rc_ptc_make_normal(buf);
4047                     ; 1046 			break;
4049                     ; 1048 }
4093                     ; 1051 void func_rc_command(uint8_t com1, uint8_t com2) {
4094                     	switch	.text
4095  0c0b               _func_rc_command:
4097  0c0b 89            	pushw	x
4098       00000000      OFST:	set	0
4101                     ; 1052 	mode_mirror = 0;
4103  0c0c 725f0011      	clr	_mode_mirror
4104                     ; 1053 	mode_factory = 0;
4106  0c10 725f0010      	clr	_mode_factory
4107                     ; 1054 	mode_hotwater = 0;
4109  0c14 725f000e      	clr	_mode_hotwater
4110                     ; 1055 	mode_reset = 0;
4112  0c18 725f000d      	clr	_mode_reset
4113                     ; 1057 	switch(com1) {
4115  0c1c 9e            	ld	a,xh
4117                     ; 1069 			break;
4118  0c1d 4a            	dec	a
4119  0c1e 270d          	jreq	L5531
4120  0c20 4a            	dec	a
4121  0c21 2711          	jreq	L7531
4122  0c23 a002          	sub	a,#2
4123  0c25 2714          	jreq	L1631
4124  0c27 a004          	sub	a,#4
4125  0c29 2717          	jreq	L3631
4126  0c2b 201a          	jra	L5041
4127  0c2d               L5531:
4128                     ; 1058 		case COMMAND_MODE_MIRROR:
4128                     ; 1059 			mode_mirror = com2;
4130  0c2d 7b02          	ld	a,(OFST+2,sp)
4131  0c2f c70011        	ld	_mode_mirror,a
4132                     ; 1060 			break;
4134  0c32 2013          	jra	L5041
4135  0c34               L7531:
4136                     ; 1061 		case COMMAND_MODE_HOTWATER:
4136                     ; 1062 			mode_hotwater = com2;
4138  0c34 7b02          	ld	a,(OFST+2,sp)
4139  0c36 c7000e        	ld	_mode_hotwater,a
4140                     ; 1063 			break;
4142  0c39 200c          	jra	L5041
4143  0c3b               L1631:
4144                     ; 1064 		case COMMAND_MODE_RESET:
4144                     ; 1065 			mode_reset = com2;
4146  0c3b 7b02          	ld	a,(OFST+2,sp)
4147  0c3d c7000d        	ld	_mode_reset,a
4148                     ; 1066 			break;
4150  0c40 2005          	jra	L5041
4151  0c42               L3631:
4152                     ; 1067 		case COMMAND_MODE_FACTORY:
4152                     ; 1068 			mode_factory = com2;
4154  0c42 7b02          	ld	a,(OFST+2,sp)
4155  0c44 c70010        	ld	_mode_factory,a
4156                     ; 1069 			break;
4158  0c47               L5041:
4159                     ; 1071 }
4162  0c47 85            	popw	x
4163  0c48 81            	ret	
4196                     ; 1073 void func_rc_recover(uint8_t com) {
4197                     	switch	.text
4198  0c49               _func_rc_recover:
4202                     ; 1074 	mode_recover = com;
4204  0c49 c7000f        	ld	_mode_recover,a
4205                     ; 1075 }
4208  0c4c 81            	ret	
4232                     ; 1077 void func_rc_setting(void) {
4233                     	switch	.text
4234  0c4d               _func_rc_setting:
4238                     ; 1078 	setSettingChange(1);
4240  0c4d a601          	ld	a,#1
4242                     ; 1079 }
4245  0c4f cc05ff        	jp	_setSettingChange
4248                     	switch	.data
4249  0005               ___func_rc_settingCb:
4250  0005 00            	dc.b	0
4281                     ; 1083 void func_rc_settingCb(uint8_t ch) {
4282                     	switch	.text
4283  0c52               _func_rc_settingCb:
4287                     ; 1084 	__func_rc_settingCb = ch;
4289  0c52 c70005        	ld	___func_rc_settingCb,a
4290                     ; 1085 }
4293  0c55 81            	ret	
4592                     	xdef	___func_rc_settingCb
4593                     	xdef	_rc_ptc_make_command_packet
4594                     	xdef	_rc_ptc_make_command
4595                     	xdef	_rc_ptc_make_error
4596                     	xdef	_rc_ptc_check_subRC
4597                     	xdef	_dr_out_count
4598                     	xdef	_rc_ptc_make_baseSetting
4599                     	xdef	_makeChecksum
4600                     	xdef	_rc_ptc_check_mirror
4601                     	xdef	_rc_ptc_check_subrc
4602                     	xdef	_rc_ptc_check_rc
4603                     	xdef	_rc_ptc_check_setting
4604                     	xdef	_rc_ptc_check_normal
4605                     	xdef	_rc_ptc_check_homenet
4606                     	xdef	_rc_ptc_check_master
4607                     	xdef	_only_one
4608                     	xdef	_dr_mode_out
4609                     	switch	.bss
4610  0000               _cur_src:
4611  0000 00            	ds.b	1
4612                     	xdef	_cur_src
4613  0001               _ret_count:
4614  0001 00            	ds.b	1
4615                     	xdef	_ret_count
4616  0002               _disp_mode_preview:
4617  0002 00            	ds.b	1
4618                     	xdef	_disp_mode_preview
4619  0003               __rcLED:
4620  0003 00            	ds.b	1
4621                     	xdef	__rcLED
4622  0004               _test_count:
4623  0004 00            	ds.b	1
4624                     	xdef	_test_count
4625  0005               _packet_changed:
4626  0005 00            	ds.b	1
4627                     	xdef	_packet_changed
4628  0006               _cur_mirror_page:
4629  0006 00            	ds.b	1
4630                     	xdef	_cur_mirror_page
4631  0007               _cur_set_page:
4632  0007 00            	ds.b	1
4633                     	xdef	_cur_set_page
4634  0008               __version:
4635  0008 00            	ds.b	1
4636                     	xdef	__version
4637  0009               _error_type:
4638  0009 00            	ds.b	1
4639                     	xdef	_error_type
4640  000a               _error:
4641  000a 00            	ds.b	1
4642                     	xdef	_error
4643                     	xdef	_debug_br
4644                     	xdef	_debug_hn
4645  000b               _state_check:
4646  000b 00            	ds.b	1
4647                     	xdef	_state_check
4648                     	xref	__backup_backlight
4649                     	xref	_packet_buf
4650                     	xref	__boiler_fire
4651                     	xref	__boiler_type
4652                     	xref	__timFlag
4653                     	xref	__remote
4654                     	xref	__boiler_water_heat
4655                     	xref	__boiler_water_shower
4656                     	xref	___boiler_shower
4657                     	xref	__updateCount
4658                     	xref	__updateBit
4659                     	xref	__updateTimer
4660                     	xref	__disp_mode2
4661                     	xref	_lcd_disp_rid
4662                     	xref	_uiInfo
4663                     	xdef	_func_rc_settingCb
4664                     	xdef	_func_rc_setting
4665                     	xdef	_func_rc_recover
4666                     	xdef	_func_rc_command
4667                     	xdef	_rc_ptc_make_mirror
4668                     	xdef	_rc_ptc_make
4669                     	xdef	_rc_ptc_make_subRC
4670                     	xdef	_rc_ptc_make_setting
4671                     	xdef	_rc_ptc_make_normal
4672                     	xdef	_setState_check
4673                     	xdef	_getState_check
4674                     	xdef	_getSettingChange
4675                     	xdef	_setSettingChange
4676                     	xdef	_rc_ptc_check
4677                     	xdef	_rc_ptc_baseSet
4678                     	xdef	_getHexToBin
4679  000c               _set_changed:
4680  000c 00            	ds.b	1
4681                     	xdef	_set_changed
4682  000d               _mode_reset:
4683  000d 00            	ds.b	1
4684                     	xdef	_mode_reset
4685  000e               _mode_hotwater:
4686  000e 00            	ds.b	1
4687                     	xdef	_mode_hotwater
4688  000f               _mode_recover:
4689  000f 00            	ds.b	1
4690                     	xdef	_mode_recover
4691  0010               _mode_factory:
4692  0010 00            	ds.b	1
4693                     	xdef	_mode_factory
4694  0011               _mode_mirror:
4695  0011 00            	ds.b	1
4696                     	xdef	_mode_mirror
4697  0012               _boiler_info:
4698  0012 000000        	ds.b	3
4699                     	xdef	_boiler_info
4700  0015               _rcSubDataInfo:
4701  0015 000000000000  	ds.b	48
4702                     	xdef	_rcSubDataInfo
4703                     	xref	_file_read
4704                     	xref	_disp_char
4705                     	xref	___timer1s
4725                     	end
