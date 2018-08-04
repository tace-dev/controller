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
 852  0216 cd0c39        	call	_func_rc_settingCb
 854                     ; 260 		state_check = RC_STATE_NORMAL;
 856  0219 3501000b      	mov	_state_check,#1
 858  021d 2004          	jra	L352
 859  021f               L152:
 860                     ; 262 		func_rc_settingCb(0);
 862  021f 4f            	clr	a
 863  0220 cd0c39        	call	_func_rc_settingCb
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
 968                     ; 285 			if (dr_mode_out == 0) {
 970  024e c60002        	ld	a,_dr_mode_out
 971  0251 26e4          	jrne	L201
 972                     ; 286 				if (_disp_mode2 == RC_MODE_OUT) {
 974  0253 c60000        	ld	a,__disp_mode2
 975  0256 a102          	cp	a,#2
 976  0258 267b          	jrne	L201
 977                     ; 287 					if (buf[1] != RC_MODE_OUT) {
 979  025a 1e03          	ldw	x,(OFST+1,sp)
 980  025c e601          	ld	a,(1,x)
 981  025e a102          	cp	a,#2
 982  0260 2705          	jreq	L533
 983                     ; 288 						packet_changed = 1;
 985  0262 cd0391        	call	LC006
 986                     ; 290 						_disp_mode2 = FW_GET_DISPMODE;
 987  0265 206e          	jra	L201
 988  0267               L533:
 989                     ; 292 						if((buf[5] & 0x01) != 0)  {
 991  0267 e605          	ld	a,(5,x)
 992  0269 a501          	bcp	a,#1
 993  026b 2768          	jreq	L201
 994                     ; 293 							packet_changed = 1;
 996  026d cd0391        	call	LC006
 997                     ; 301 		return;
 999  0270 2063          	jra	L201
1000  0272               L323:
1001                     ; 304 	k = 0;
1003  0272 6b01          	ld	(OFST-1,sp),a
1004                     ; 306 	packet_buf[st] = 0;
1006  0274 5f            	clrw	x
1007  0275 7b02          	ld	a,(OFST+0,sp)
1008  0277 97            	ld	xl,a
1009  0278 724f0000      	clr	(_packet_buf,x)
1010                     ; 308 	if (_remote == 0) {
1012  027c 725d0000      	tnz	__remote
1013  0280 2703cc0360    	jrne	L343
1014                     ; 309 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
1016  0285 5f            	clrw	x
1017  0286 97            	ld	xl,a
1018  0287 d60025        	ld	a,(_rcSubDataInfo+16,x)
1019  028a 4c            	inc	a
1020  028b 264b          	jrne	L543
1021                     ; 310 			if (uiInfo.remote_mode[st] != buf[1]) {
1023  028d 7b02          	ld	a,(OFST+0,sp)
1024  028f 5f            	clrw	x
1025  0290 97            	ld	xl,a
1026  0291 d60045        	ld	a,(_uiInfo+69,x)
1027  0294 1e03          	ldw	x,(OFST+1,sp)
1028  0296 e101          	cp	a,(1,x)
1029                     ; 311 				k = 1;
1031  0298 2632          	jrne	LC003
1032                     ; 314 				switch (buf[1]) {
1034  029a e601          	ld	a,(1,x)
1036                     ; 333 						break;
1037  029c 4a            	dec	a
1038  029d 270a          	jreq	L552
1039  029f a007          	sub	a,#7
1040  02a1 2713          	jreq	L362
1041  02a3 a008          	sub	a,#8
1042  02a5 2718          	jreq	L562
1043  02a7 2027          	jra	L153
1044  02a9               L552:
1045                     ; 315 					case RC_MODE_HEAT:
1045                     ; 316 						if (uiInfo.tempSetup[st] != buf[3]) {
1047  02a9 7b02          	ld	a,(OFST+0,sp)
1048  02ab 5f            	clrw	x
1049  02ac 97            	ld	xl,a
1050  02ad d6003d        	ld	a,(_uiInfo+61,x)
1051  02b0 1e03          	ldw	x,(OFST+1,sp)
1052  02b2 e103          	cp	a,(3,x)
1053                     ; 317 							k = 1;
1054  02b4 2014          	jp	LC004
1055                     ; 320 					case RC_MODE_OUT:
1055                     ; 321 						break;
1057                     ; 322 					case RC_MODE_STOP:
1057                     ; 323 						break;
1059  02b6               L362:
1060                     ; 324 					case RC_MODE_RESERVE:
1060                     ; 325 						if (uiInfo.remote_time[st] != buf[5]) {
1062  02b6 7b02          	ld	a,(OFST+0,sp)
1063  02b8 5f            	clrw	x
1064  02b9 97            	ld	xl,a
1065  02ba d6004d        	ld	a,(_uiInfo+77,x)
1066                     ; 326 							k = 1;
1067  02bd 2007          	jp	LC005
1068  02bf               L562:
1069                     ; 329 					case RC_MODE_REPEAT:
1069                     ; 330 						if (uiInfo.remote_banb[st] != buf[5]) {
1071  02bf 7b02          	ld	a,(OFST+0,sp)
1072  02c1 5f            	clrw	x
1073  02c2 97            	ld	xl,a
1074  02c3 d60055        	ld	a,(_uiInfo+85,x)
1075  02c6               LC005:
1076  02c6 1e03          	ldw	x,(OFST+1,sp)
1077  02c8 e105          	cp	a,(5,x)
1078  02ca               LC004:
1079  02ca 2704          	jreq	L153
1080                     ; 331 							k = 1;
1082  02cc               LC003:
1086  02cc a601          	ld	a,#1
1087  02ce 6b01          	ld	(OFST-1,sp),a
1088  02d0               L153:
1089                     ; 337 			if (k == 1) {
1091  02d0 7b01          	ld	a,(OFST-1,sp)
1092  02d2 4a            	dec	a
1093  02d3 2603          	jrne	L543
1094                     ; 338 				return;
1095  02d5               L201:
1098  02d5 5b04          	addw	sp,#4
1099  02d7 81            	ret	
1100  02d8               L543:
1101                     ; 342 		rcSubDataInfo.mode_heat[st] = buf[1];
1103  02d8 7b02          	ld	a,(OFST+0,sp)
1104  02da 5f            	clrw	x
1105  02db 1603          	ldw	y,(OFST+1,sp)
1106  02dd 97            	ld	xl,a
1107  02de 90e601        	ld	a,(1,y)
1108  02e1 d70025        	ld	(_rcSubDataInfo+16,x),a
1109                     ; 343 		rcSubDataInfo.cur_temp[st] = buf[2];
1111  02e4 5f            	clrw	x
1112  02e5 7b02          	ld	a,(OFST+0,sp)
1113  02e7 97            	ld	xl,a
1114  02e8 90e602        	ld	a,(2,y)
1115  02eb d70015        	ld	(_rcSubDataInfo,x),a
1116                     ; 345 		uiInfo.remote_mode[st] = buf[1];
1118  02ee 5f            	clrw	x
1119  02ef 7b02          	ld	a,(OFST+0,sp)
1120  02f1 97            	ld	xl,a
1121  02f2 90e601        	ld	a,(1,y)
1122  02f5 d70045        	ld	(_uiInfo+69,x),a
1123                     ; 346 		uiInfo.tempCurr[st] = buf[2];
1125  02f8 5f            	clrw	x
1126  02f9 7b02          	ld	a,(OFST+0,sp)
1127  02fb 97            	ld	xl,a
1128  02fc 90e602        	ld	a,(2,y)
1129  02ff d70035        	ld	(_uiInfo+53,x),a
1130                     ; 348 		switch (buf[1]) {
1132  0302 1e03          	ldw	x,(OFST+1,sp)
1133  0304 e601          	ld	a,(1,x)
1135                     ; 364 				break;
1136  0306 4a            	dec	a
1137  0307 270a          	jreq	L762
1138  0309 a007          	sub	a,#7
1139  030b 271c          	jreq	L572
1140  030d a008          	sub	a,#8
1141  030f 272e          	jreq	L772
1142  0311 2040          	jra	L173
1143  0313               L762:
1144                     ; 349 			case RC_MODE_HEAT:
1144                     ; 350 				rcSubDataInfo.set_temp[st] = buf[3];
1146  0313 7b02          	ld	a,(OFST+0,sp)
1147  0315 5f            	clrw	x
1148  0316 97            	ld	xl,a
1149  0317 90e603        	ld	a,(3,y)
1150  031a d7001d        	ld	(_rcSubDataInfo+8,x),a
1151                     ; 351 				uiInfo.tempSetup[st] = buf[3];
1153  031d 5f            	clrw	x
1154  031e 7b02          	ld	a,(OFST+0,sp)
1155  0320 97            	ld	xl,a
1156  0321 90e603        	ld	a,(3,y)
1157  0324 d7003d        	ld	(_uiInfo+61,x),a
1158                     ; 352 				break;
1160  0327 202a          	jra	L173
1161                     ; 353 			case RC_MODE_OUT:
1161                     ; 354 				break;
1163                     ; 355 			case RC_MODE_STOP:
1163                     ; 356 				break;
1165  0329               L572:
1166                     ; 357 			case RC_MODE_RESERVE:
1166                     ; 358 				rcSubDataInfo.time[st] = buf[5];
1168  0329 7b02          	ld	a,(OFST+0,sp)
1169  032b 5f            	clrw	x
1170  032c 97            	ld	xl,a
1171  032d 90e605        	ld	a,(5,y)
1172  0330 d70035        	ld	(_rcSubDataInfo+32,x),a
1173                     ; 359 				uiInfo.remote_time[st] = buf[5];
1175  0333 5f            	clrw	x
1176  0334 7b02          	ld	a,(OFST+0,sp)
1177  0336 97            	ld	xl,a
1178  0337 90e605        	ld	a,(5,y)
1179  033a d7004d        	ld	(_uiInfo+77,x),a
1180                     ; 360 				break;
1182  033d 2014          	jra	L173
1183  033f               L772:
1184                     ; 361 			case RC_MODE_REPEAT:
1184                     ; 362 				rcSubDataInfo.banb[st] = buf[5];
1186  033f 7b02          	ld	a,(OFST+0,sp)
1187  0341 5f            	clrw	x
1188  0342 97            	ld	xl,a
1189  0343 90e605        	ld	a,(5,y)
1190  0346 d7003d        	ld	(_rcSubDataInfo+40,x),a
1191                     ; 363 				uiInfo.remote_banb[st] = buf[5];
1193  0349 5f            	clrw	x
1194  034a 7b02          	ld	a,(OFST+0,sp)
1195  034c 97            	ld	xl,a
1196  034d 90e605        	ld	a,(5,y)
1197  0350 d70055        	ld	(_uiInfo+85,x),a
1198                     ; 364 				break;
1200  0353               L173:
1201                     ; 367 		disp_char(uiInfo.remote_mode[st]);
1203  0353 7b02          	ld	a,(OFST+0,sp)
1204  0355 5f            	clrw	x
1205  0356 97            	ld	xl,a
1206  0357 d60045        	ld	a,(_uiInfo+69,x)
1207  035a cd0000        	call	_disp_char
1210  035d cc02d5        	jra	L201
1211  0360               L343:
1212                     ; 371 		rcSubDataInfo.mode_heat[st] = 0xFF;
1214  0360 5f            	clrw	x
1215  0361 97            	ld	xl,a
1216  0362 a6ff          	ld	a,#255
1217  0364 d70025        	ld	(_rcSubDataInfo+16,x),a
1218                     ; 372 		rcSubDataInfo.cur_temp[st] = buf[2];
1220  0367 5f            	clrw	x
1221  0368 7b02          	ld	a,(OFST+0,sp)
1222  036a 1603          	ldw	y,(OFST+1,sp)
1223  036c 97            	ld	xl,a
1224  036d 90e602        	ld	a,(2,y)
1225  0370 d70015        	ld	(_rcSubDataInfo,x),a
1226                     ; 373 		rcSubDataInfo.set_temp[st] = 0xFF;
1228  0373 5f            	clrw	x
1229  0374 7b02          	ld	a,(OFST+0,sp)
1230  0376 97            	ld	xl,a
1231  0377 a6ff          	ld	a,#255
1232  0379 d7001d        	ld	(_rcSubDataInfo+8,x),a
1233                     ; 374 		rcSubDataInfo.time[st] = 0xFF;
1235  037c 5f            	clrw	x
1236  037d 7b02          	ld	a,(OFST+0,sp)
1237  037f 97            	ld	xl,a
1238  0380 a6ff          	ld	a,#255
1239  0382 d70035        	ld	(_rcSubDataInfo+32,x),a
1240                     ; 375 		rcSubDataInfo.banb[st] = 0xFF;
1242  0385 5f            	clrw	x
1243  0386 7b02          	ld	a,(OFST+0,sp)
1244  0388 97            	ld	xl,a
1245  0389 a6ff          	ld	a,#255
1246  038b d7003d        	ld	(_rcSubDataInfo+40,x),a
1247                     ; 377 }
1249  038e cc02d5        	jra	L201
1250  0391               LC006:
1251  0391 35010005      	mov	_packet_changed,#1
1252                     ; 294 							dr_mode_out = 1;
1254  0395 35010002      	mov	_dr_mode_out,#1
1255                     ; 295 							_disp_mode2 = FW_GET_DISPMODE;
1257  0399 a629          	ld	a,#41
1258  039b cd0000        	call	_file_read
1260  039e c70000        	ld	__disp_mode2,a
1261  03a1 81            	ret	
1307                     ; 380 void rc_ptc_check_subrc(uint8_t *buf) {
1308                     	switch	.text
1309  03a2               _rc_ptc_check_subrc:
1311  03a2 89            	pushw	x
1312  03a3 88            	push	a
1313       00000001      OFST:	set	1
1316                     ; 381 	uint8_t start = buf[0] & 0x0F;
1318  03a4 f6            	ld	a,(x)
1319  03a5 a40f          	and	a,#15
1320  03a7 6b01          	ld	(OFST+0,sp),a
1321                     ; 383 	state_check = RC_STATE_NONE;
1323  03a9 725f000b      	clr	_state_check
1324                     ; 385 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1326  03ad c60008        	ld	a,_uiInfo+8
1327  03b0 4a            	dec	a
1328  03b1 2707          	jreq	L601
1329                     ; 386 		return;
1331                     ; 389 	if (start != uiInfo.id) {
1333  03b3 7b01          	ld	a,(OFST+0,sp)
1334  03b5 c10004        	cp	a,_uiInfo+4
1335  03b8 2703          	jreq	L524
1336                     ; 390 		return;
1337  03ba               L601:
1340  03ba 5b03          	addw	sp,#3
1341  03bc 81            	ret	
1342  03bd               L524:
1343                     ; 393 	packet_changed = 1;	
1345  03bd 35010005      	mov	_packet_changed,#1
1346                     ; 394 	_disp_mode2 = buf[1];
1348  03c1 1e02          	ldw	x,(OFST+1,sp)
1349  03c3 e601          	ld	a,(1,x)
1350  03c5 c70000        	ld	__disp_mode2,a
1351                     ; 396 	switch(_disp_mode2)
1354                     ; 400 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1355  03c8 4a            	dec	a
1356  03c9 270a          	jreq	L573
1357  03cb a007          	sub	a,#7
1358  03cd 270d          	jreq	L773
1359  03cf a008          	sub	a,#8
1360  03d1 2710          	jreq	L104
1361  03d3 20e5          	jra	L601
1362  03d5               L573:
1363                     ; 398 	case RC_MODE_HEAT:		uiInfo.tSetup = buf[3];	break;
1365  03d5 e603          	ld	a,(3,x)
1366  03d7 c7000e        	ld	_uiInfo+14,a
1369  03da 20de          	jra	L601
1370  03dc               L773:
1371                     ; 399 	case RC_MODE_RESERVE:	uiInfo.reserve = buf[5];	break;
1373  03dc e605          	ld	a,(5,x)
1374  03de c7000d        	ld	_uiInfo+13,a
1377  03e1 20d7          	jra	L601
1378  03e3               L104:
1379                     ; 400 	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
1381  03e3 e605          	ld	a,(5,x)
1382  03e5 c7000c        	ld	_uiInfo+12,a
1385                     ; 402 }
1387  03e8 20d0          	jra	L601
1450                     ; 404 void rc_ptc_check_mirror(uint8_t *buf) {
1451                     	switch	.text
1452  03ea               _rc_ptc_check_mirror:
1454  03ea 89            	pushw	x
1455       00000001      OFST:	set	1
1458                     ; 409 	state_check = RC_STATE_NONE;
1460  03eb 725f000b      	clr	_state_check
1461  03ef 88            	push	a
1462                     ; 411 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1464  03f0 c60008        	ld	a,_uiInfo+8
1465  03f3 a101          	cp	a,#1
1466  03f5 2703cc059f    	jrne	L174
1467                     ; 412 		return;
1469                     ; 415 	page = buf[0] & 0x0F;
1471  03fa 1e02          	ldw	x,(OFST+1,sp)
1472  03fc f6            	ld	a,(x)
1473  03fd a40f          	and	a,#15
1474  03ff 6b01          	ld	(OFST+0,sp),a
1475                     ; 416 	cur_mirror_page = page;
1477  0401 c70006        	ld	_cur_mirror_page,a
1478                     ; 417 	state_check = RC_STATE_MIRROR;
1480  0404 3506000b      	mov	_state_check,#6
1481                     ; 419 	switch(page) {
1484                     ; 500 			break;
1485  0408 270f          	jreq	L334
1486  040a 4a            	dec	a
1487  040b 2603cc048f    	jreq	L534
1488  0410 4a            	dec	a
1489  0411 2603cc051a    	jreq	L734
1490  0416 cc059f        	jra	L174
1491  0419               L334:
1492                     ; 420 		case 0:
1492                     ; 421 			mode = (buf[6] & 0x80) >> 7;
1494  0419 e606          	ld	a,(6,x)
1495  041b 49            	rlc	a
1496  041c 4f            	clr	a
1497  041d 49            	rlc	a
1498  041e 6b01          	ld	(OFST+0,sp),a
1499                     ; 422 			if (mode == CNT_MODE_MAIN) {
1501  0420 2654          	jrne	L374
1502                     ; 423 				_boiler_type = (buf[1] & 0x80) >> 7;
1504  0422 cd05ae        	call	LC009
1505  0425 c70000        	ld	__boiler_type,a
1506                     ; 424 				uiInfo.lpmType = (buf[1] & 0x0F);
1508  0428 e601          	ld	a,(1,x)
1509  042a a40f          	and	a,#15
1510  042c c70013        	ld	_uiInfo+19,a
1511                     ; 425 				uiInfo.cnt = (buf[2] & 0x70) >> 4;
1513  042f cd05a2        	call	LC007
1514  0432 c70005        	ld	_uiInfo+5,a
1515                     ; 426 				uiInfo.valve = buf[2] & 0x0F;
1517  0435 e602          	ld	a,(2,x)
1518  0437 a40f          	and	a,#15
1519  0439 c7000a        	ld	_uiInfo+10,a
1520                     ; 427 				_boiler_water_shower = buf[3];
1522  043c e603          	ld	a,(3,x)
1523  043e c70000        	ld	__boiler_water_shower,a
1524                     ; 428 				uiInfo.houseCapa = buf[4];
1526  0441 e604          	ld	a,(4,x)
1527  0443 c70010        	ld	_uiInfo+16,a
1528                     ; 429 				_boiler_water_heat = buf[5] ;
1530  0446 e605          	ld	a,(5,x)
1531  0448 c70000        	ld	__boiler_water_heat,a
1532                     ; 430 				uiInfo.controlMode = mode;
1534  044b 7b01          	ld	a,(OFST+0,sp)
1535  044d c70009        	ld	_uiInfo+9,a
1536                     ; 431 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1538  0450 e606          	ld	a,(6,x)
1539  0452 4e            	swap	a
1540  0453 a404          	and	a,#4
1541  0455 44            	srl	a
1542  0456 44            	srl	a
1543  0457 c7005d        	ld	_uiInfo+93,a
1544                     ; 432 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1546  045a e606          	ld	a,(6,x)
1547  045c 4e            	swap	a
1548  045d a403          	and	a,#3
1549  045f c7000f        	ld	_uiInfo+15,a
1550                     ; 433 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1552  0462 e606          	ld	a,(6,x)
1553  0464 a408          	and	a,#8
1554  0466 44            	srl	a
1555  0467 44            	srl	a
1556  0468 44            	srl	a
1557  0469 c70003        	ld	_uiInfo+3,a
1558                     ; 434 				uiInfo.opMode = buf[6] & 0x07;
1560  046c e606          	ld	a,(6,x)
1561  046e a407          	and	a,#7
1562  0470 c70007        	ld	_uiInfo+7,a
1564  0473 cc059f        	jra	L174
1565  0476               L374:
1566                     ; 436 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1568  0476 e601          	ld	a,(1,x)
1569  0478 a40f          	and	a,#15
1570  047a c70014        	ld	_uiInfo+20,a
1571                     ; 437 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1573  047d e602          	ld	a,(2,x)
1574  047f 4e            	swap	a
1575  0480 a40f          	and	a,#15
1576  0482 c70006        	ld	_uiInfo+6,a
1577                     ; 438 				uiInfo.valve_sub = buf[2] & 0x0F;
1579  0485 e602          	ld	a,(2,x)
1580  0487 a40f          	and	a,#15
1581  0489 c7000b        	ld	_uiInfo+11,a
1582  048c cc059f        	jra	L174
1583  048f               L534:
1584                     ; 441 		case 1:
1584                     ; 442 			mode = (buf[1] & 0x80) >> 7;
1586  048f cd05ae        	call	LC009
1587  0492 6b01          	ld	(OFST+0,sp),a
1588                     ; 443 			if (mode == CNT_MODE_MAIN) {
1590  0494 2631          	jrne	L774
1591                     ; 444 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1593  0496 cd05a8        	call	LC008
1594  0499 c7001d        	ld	_uiInfo+29,a
1595                     ; 445 				uiInfo.valve_rc[1] = buf[1] & 0x07;
1597  049c e601          	ld	a,(1,x)
1598  049e a407          	and	a,#7
1599  04a0 c7001e        	ld	_uiInfo+30,a
1600                     ; 446 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
1602  04a3 cd05a2        	call	LC007
1603  04a6 c7001f        	ld	_uiInfo+31,a
1604                     ; 447 				uiInfo.valve_rc[3] = buf[2] & 0x07;
1606  04a9 e602          	ld	a,(2,x)
1607  04ab a407          	and	a,#7
1608  04ad c70020        	ld	_uiInfo+32,a
1609                     ; 449 				uiInfo.valve_len[0] = buf[3];
1611  04b0 e603          	ld	a,(3,x)
1612  04b2 c70015        	ld	_uiInfo+21,a
1613                     ; 450 				uiInfo.valve_len[1] = buf[4];
1615  04b5 e604          	ld	a,(4,x)
1616  04b7 c70016        	ld	_uiInfo+22,a
1617                     ; 451 				uiInfo.valve_len[2] = buf[5];
1619  04ba e605          	ld	a,(5,x)
1620  04bc c70017        	ld	_uiInfo+23,a
1621                     ; 452 				uiInfo.valve_len[3] = buf[6];
1623  04bf e606          	ld	a,(6,x)
1624  04c1 c70018        	ld	_uiInfo+24,a
1626  04c4 cc059f        	jra	L174
1627  04c7               L774:
1628                     ; 454 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
1630  04c7 cd05a8        	call	LC008
1631  04ca c7002d        	ld	_uiInfo+45,a
1632                     ; 455 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
1634  04cd e601          	ld	a,(1,x)
1635  04cf a407          	and	a,#7
1636  04d1 c7002e        	ld	_uiInfo+46,a
1637                     ; 456 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
1639  04d4 cd05a2        	call	LC007
1640  04d7 c7002f        	ld	_uiInfo+47,a
1641                     ; 457 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
1643  04da e602          	ld	a,(2,x)
1644  04dc a407          	and	a,#7
1645  04de c70030        	ld	_uiInfo+48,a
1646                     ; 459 				uiInfo.valve_sub_len[0] = buf[3];
1648  04e1 e603          	ld	a,(3,x)
1649  04e3 c70025        	ld	_uiInfo+37,a
1650                     ; 460 				uiInfo.valve_sub_len[1] = buf[4];
1652  04e6 e604          	ld	a,(4,x)
1653  04e8 c70026        	ld	_uiInfo+38,a
1654                     ; 461 				uiInfo.valve_sub_len[2] = buf[5];
1656  04eb e605          	ld	a,(5,x)
1657  04ed c70027        	ld	_uiInfo+39,a
1658                     ; 462 				uiInfo.valve_sub_len[3] = buf[6];
1660  04f0 e606          	ld	a,(6,x)
1661  04f2 c70028        	ld	_uiInfo+40,a
1662                     ; 464 				for (i = 0 ; i < 4 ; i++) {
1664  04f5 4f            	clr	a
1665  04f6 6b01          	ld	(OFST+0,sp),a
1666  04f8               L305:
1667                     ; 465 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1669  04f8 5f            	clrw	x
1670  04f9 97            	ld	xl,a
1671  04fa 724d002d      	tnz	(_uiInfo+45,x)
1672  04fe 260f          	jrne	L115
1674  0500 5f            	clrw	x
1675  0501 97            	ld	xl,a
1676  0502 724d0025      	tnz	(_uiInfo+37,x)
1677  0506 2707          	jreq	L115
1678                     ; 466 						uiInfo.valve_sub_rc[i] = 8;
1680  0508 5f            	clrw	x
1681  0509 97            	ld	xl,a
1682  050a a608          	ld	a,#8
1683  050c d7002d        	ld	(_uiInfo+45,x),a
1684  050f               L115:
1685                     ; 464 				for (i = 0 ; i < 4 ; i++) {
1687  050f 0c01          	inc	(OFST+0,sp)
1690  0511 7b01          	ld	a,(OFST+0,sp)
1691  0513 a104          	cp	a,#4
1692  0515 25e1          	jrult	L305
1693  0517 cc059f        	jra	L174
1694  051a               L734:
1695                     ; 471 		case 2:
1695                     ; 472 			mode = (buf[1] & 0x80) >> 7;
1697  051a cd05ae        	call	LC009
1698  051d 6b01          	ld	(OFST+0,sp),a
1699                     ; 473 			if (mode == CNT_MODE_MAIN) {
1701  051f 262f          	jrne	L315
1702                     ; 474 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
1704  0521 cd05a8        	call	LC008
1705  0524 c70021        	ld	_uiInfo+33,a
1706                     ; 475 				uiInfo.valve_rc[5] = buf[1] & 0x07;
1708  0527 e601          	ld	a,(1,x)
1709  0529 a407          	and	a,#7
1710  052b c70022        	ld	_uiInfo+34,a
1711                     ; 476 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
1713  052e ad72          	call	LC007
1714  0530 c70023        	ld	_uiInfo+35,a
1715                     ; 477 				uiInfo.valve_rc[7] = buf[2] & 0x07;
1717  0533 e602          	ld	a,(2,x)
1718  0535 a407          	and	a,#7
1719  0537 c70024        	ld	_uiInfo+36,a
1720                     ; 479 				uiInfo.valve_len[4] = buf[3];
1722  053a e603          	ld	a,(3,x)
1723  053c c70019        	ld	_uiInfo+25,a
1724                     ; 480 				uiInfo.valve_len[5] = buf[4];
1726  053f e604          	ld	a,(4,x)
1727  0541 c7001a        	ld	_uiInfo+26,a
1728                     ; 481 				uiInfo.valve_len[6] = buf[5];
1730  0544 e605          	ld	a,(5,x)
1731  0546 c7001b        	ld	_uiInfo+27,a
1732                     ; 482 				uiInfo.valve_len[7] = buf[6];
1734  0549 e606          	ld	a,(6,x)
1735  054b c7001c        	ld	_uiInfo+28,a
1737  054e 204f          	jra	L174
1738  0550               L315:
1739                     ; 484 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
1741  0550 ad56          	call	LC008
1742  0552 c70031        	ld	_uiInfo+49,a
1743                     ; 485 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
1745  0555 e601          	ld	a,(1,x)
1746  0557 a407          	and	a,#7
1747  0559 c70032        	ld	_uiInfo+50,a
1748                     ; 486 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
1750  055c ad44          	call	LC007
1751  055e c70033        	ld	_uiInfo+51,a
1752                     ; 487 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
1754  0561 e602          	ld	a,(2,x)
1755  0563 a407          	and	a,#7
1756  0565 c70034        	ld	_uiInfo+52,a
1757                     ; 489 				uiInfo.valve_sub_len[4] = buf[3];
1759  0568 e603          	ld	a,(3,x)
1760  056a c70029        	ld	_uiInfo+41,a
1761                     ; 490 				uiInfo.valve_sub_len[5] = buf[4];
1763  056d e604          	ld	a,(4,x)
1764  056f c7002a        	ld	_uiInfo+42,a
1765                     ; 491 				uiInfo.valve_sub_len[6] = buf[5];
1767  0572 e605          	ld	a,(5,x)
1768  0574 c7002b        	ld	_uiInfo+43,a
1769                     ; 492 				uiInfo.valve_sub_len[7] = buf[6];
1771  0577 e606          	ld	a,(6,x)
1772  0579 c7002c        	ld	_uiInfo+44,a
1773                     ; 494 				for (i = 4 ; i < 8 ; i++) {
1775  057c a604          	ld	a,#4
1776  057e 6b01          	ld	(OFST+0,sp),a
1777  0580               L715:
1778                     ; 495 					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
1780  0580 5f            	clrw	x
1781  0581 97            	ld	xl,a
1782  0582 724d002d      	tnz	(_uiInfo+45,x)
1783  0586 260f          	jrne	L525
1785  0588 5f            	clrw	x
1786  0589 97            	ld	xl,a
1787  058a 724d0025      	tnz	(_uiInfo+37,x)
1788  058e 2707          	jreq	L525
1789                     ; 496 						uiInfo.valve_sub_rc[i] = 8;
1791  0590 5f            	clrw	x
1792  0591 97            	ld	xl,a
1793  0592 a608          	ld	a,#8
1794  0594 d7002d        	ld	(_uiInfo+45,x),a
1795  0597               L525:
1796                     ; 494 				for (i = 4 ; i < 8 ; i++) {
1798  0597 0c01          	inc	(OFST+0,sp)
1801  0599 7b01          	ld	a,(OFST+0,sp)
1802  059b a108          	cp	a,#8
1803  059d 25e1          	jrult	L715
1804  059f               L174:
1805                     ; 502 }
1808  059f 5b03          	addw	sp,#3
1809  05a1 81            	ret	
1810  05a2               LC007:
1811  05a2 e602          	ld	a,(2,x)
1812  05a4 4e            	swap	a
1813  05a5 a407          	and	a,#7
1814  05a7 81            	ret	
1815  05a8               LC008:
1816  05a8 e601          	ld	a,(1,x)
1817  05aa 4e            	swap	a
1818  05ab a407          	and	a,#7
1819  05ad 81            	ret	
1820  05ae               LC009:
1821  05ae e601          	ld	a,(1,x)
1822  05b0 49            	rlc	a
1823  05b1 4f            	clr	a
1824  05b2 49            	rlc	a
1825  05b3 81            	ret	
1874                     ; 504 void rc_ptc_check(uint8_t *buf) {
1875                     	switch	.text
1876  05b4               _rc_ptc_check:
1878  05b4 89            	pushw	x
1879  05b5 88            	push	a
1880       00000001      OFST:	set	1
1883                     ; 506 	start = buf[0] & 0xF0;
1885  05b6 f6            	ld	a,(x)
1886  05b7 a4f0          	and	a,#240
1887  05b9 6b01          	ld	(OFST+0,sp),a
1888                     ; 508 	switch(start) {
1891                     ; 528 			break;
1892  05bb a020          	sub	a,#32
1893  05bd 2738          	jreq	L735
1894  05bf a010          	sub	a,#16
1895  05c1 271f          	jreq	L135
1896  05c3 a030          	sub	a,#48
1897  05c5 2729          	jreq	L535
1898  05c7 a010          	sub	a,#16
1899  05c9 2710          	jreq	L725
1900  05cb a080          	sub	a,#128
1901  05cd 271a          	jreq	L335
1902                     ; 524 		default:
1902                     ; 525 			state_check = RC_STATE_ERROR;
1904  05cf 3504000b      	mov	_state_check,#4
1905                     ; 526 			disp_char(buf[0]);
1907  05d3 1e02          	ldw	x,(OFST+1,sp)
1908  05d5 f6            	ld	a,(x)
1909  05d6 cd0000        	call	_disp_char
1911                     ; 528 			break;
1913  05d9 2021          	jra	L565
1914  05db               L725:
1915                     ; 509 		case BYTE_START_CNT_NORMAL:
1915                     ; 510 			rc_ptc_check_normal(buf);
1917  05db 1e02          	ldw	x,(OFST+1,sp)
1918  05dd cd00f8        	call	_rc_ptc_check_normal
1920                     ; 511 			break;
1922  05e0 201a          	jra	L565
1923  05e2               L135:
1924                     ; 512 		case BYTE_START_CNT_SETTING:
1924                     ; 513 			rc_ptc_check_setting(buf);
1926  05e2 1e02          	ldw	x,(OFST+1,sp)
1927  05e4 cd01e8        	call	_rc_ptc_check_setting
1929                     ; 514 			break;
1931  05e7 2013          	jra	L565
1932  05e9               L335:
1933                     ; 515 		case BYTE_START_RC_NORMAL:
1933                     ; 516 			rc_ptc_check_rc(buf);
1935  05e9 1e02          	ldw	x,(OFST+1,sp)
1936  05eb cd0225        	call	_rc_ptc_check_rc
1938                     ; 517 			break;
1940  05ee 200c          	jra	L565
1941  05f0               L535:
1942                     ; 518 		case BYTE_START_RC_SUBRC:
1942                     ; 519 			rc_ptc_check_subrc(buf);
1944  05f0 1e02          	ldw	x,(OFST+1,sp)
1945  05f2 cd03a2        	call	_rc_ptc_check_subrc
1947                     ; 520 			break;
1949  05f5 2005          	jra	L565
1950  05f7               L735:
1951                     ; 521 		case BYTE_START_CNT_MIRROR:
1951                     ; 522 			rc_ptc_check_mirror(buf);
1953  05f7 1e02          	ldw	x,(OFST+1,sp)
1954  05f9 cd03ea        	call	_rc_ptc_check_mirror
1956                     ; 523 			break;
1958  05fc               L565:
1959                     ; 530 }
1962  05fc 5b03          	addw	sp,#3
1963  05fe 81            	ret	
1996                     ; 532 void setSettingChange(uint8_t ch) {
1997                     	switch	.text
1998  05ff               _setSettingChange:
2002                     ; 533 	set_changed = ch;
2004  05ff c7000c        	ld	_set_changed,a
2005                     ; 534 }
2008  0602 81            	ret	
2032                     ; 536 uint8_t getSettingChange(void) {
2033                     	switch	.text
2034  0603               _getSettingChange:
2038                     ; 537 	return set_changed;
2040  0603 c6000c        	ld	a,_set_changed
2043  0606 81            	ret	
2067                     ; 540 uint8_t getState_check(void) {
2068                     	switch	.text
2069  0607               _getState_check:
2073                     ; 541 	return state_check;
2075  0607 c6000b        	ld	a,_state_check
2078  060a 81            	ret	
2111                     ; 544 void setState_check(uint8_t st) {
2112                     	switch	.text
2113  060b               _setState_check:
2117                     ; 545 	state_check = st;
2119  060b c7000b        	ld	_state_check,a
2120                     ; 546 }
2123  060e 81            	ret	
2172                     ; 548 void makeChecksum(uint8_t *buf) {
2173                     	switch	.text
2174  060f               _makeChecksum:
2176  060f 89            	pushw	x
2177  0610 89            	pushw	x
2178       00000002      OFST:	set	2
2181                     ; 553 	s = 0;
2183  0611 0f01          	clr	(OFST-1,sp)
2184                     ; 554 	for (i = 0 ; i < 7 ; i++) {
2186  0613 0f02          	clr	(OFST+0,sp)
2187  0615               L166:
2188                     ; 555 		s += buf[i];
2190  0615 7b03          	ld	a,(OFST+1,sp)
2191  0617 97            	ld	xl,a
2192  0618 7b04          	ld	a,(OFST+2,sp)
2193  061a 1b02          	add	a,(OFST+0,sp)
2194  061c 2401          	jrnc	L441
2195  061e 5c            	incw	x
2196  061f               L441:
2197  061f 02            	rlwa	x,a
2198  0620 7b01          	ld	a,(OFST-1,sp)
2199  0622 fb            	add	a,(x)
2200  0623 6b01          	ld	(OFST-1,sp),a
2201                     ; 554 	for (i = 0 ; i < 7 ; i++) {
2203  0625 0c02          	inc	(OFST+0,sp)
2206  0627 7b02          	ld	a,(OFST+0,sp)
2207  0629 a107          	cp	a,#7
2208  062b 25e8          	jrult	L166
2209                     ; 557 	buf[7] = s;
2211  062d 1e03          	ldw	x,(OFST+1,sp)
2212  062f 7b01          	ld	a,(OFST-1,sp)
2213  0631 e707          	ld	(7,x),a
2214                     ; 563 }
2217  0633 5b04          	addw	sp,#4
2218  0635 81            	ret	
2272                     ; 565 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2273                     	switch	.text
2274  0636               _rc_ptc_make_baseSetting:
2276  0636 89            	pushw	x
2277  0637 5203          	subw	sp,#3
2278       00000003      OFST:	set	3
2281                     ; 566 	switch (page) {
2283  0639 7b08          	ld	a,(OFST+5,sp)
2285                     ; 657 		break;
2286  063b 270f          	jreq	L766
2287  063d 4a            	dec	a
2288  063e 2603cc06e3    	jreq	L176
2289  0643 4a            	dec	a
2290  0644 2603cc0789    	jreq	L376
2291  0649 cc0827        	jra	L127
2292  064c               L766:
2293                     ; 567 		case 0:
2293                     ; 568 			if (mode == CNT_MODE_MAIN) {
2295  064c 7b09          	ld	a,(OFST+6,sp)
2296  064e 2625          	jrne	L327
2297                     ; 569 				buf[1] = (_boiler_type << 7)
2297                     ; 570 									| ((uiInfo.plc & 0x07) << 4)
2297                     ; 571 									| (uiInfo.lpmType);
2299  0650 c60064        	ld	a,_uiInfo+100
2300  0653 a407          	and	a,#7
2301  0655 cd0830        	call	LC013
2302  0658 6b03          	ld	(OFST+0,sp),a
2303  065a c60000        	ld	a,__boiler_type
2304  065d cd082a        	call	LC012
2305  0660 1a03          	or	a,(OFST+0,sp)
2306  0662 1e04          	ldw	x,(OFST+1,sp)
2307  0664 ca0013        	or	a,_uiInfo+19
2308  0667 e701          	ld	(1,x),a
2309                     ; 572 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2309                     ; 573 									| ((uiInfo.cnt & 0x07) << 4) 
2309                     ; 574 									| (uiInfo.valve & 0x0F);
2311  0669 c6000a        	ld	a,_uiInfo+10
2312  066c a40f          	and	a,#15
2313  066e 6b03          	ld	(OFST+0,sp),a
2314  0670 c60005        	ld	a,_uiInfo+5
2315                     ; 575 				buf[3] = _boiler_water_shower;
2316                     ; 576 				buf[4] = uiInfo.houseCapa;
2317                     ; 577 				buf[5] = _boiler_water_heat;
2318                     ; 578 				buf[6] = 	(mode << 7) 
2318                     ; 579 									| (uiInfo.subRCLock << 6) 
2318                     ; 580 									| ((uiInfo.poType & 0x01) << 4) 
2318                     ; 581 									| ((uiInfo.cntlMode & 0x01) << 3) 
2318                     ; 582 									| uiInfo.opMode;
2320  0673 2017          	jp	LC011
2321  0675               L327:
2322                     ; 584 				buf[1] = (_boiler_type << 7) 
2322                     ; 585 									| (uiInfo.lpmType_sub);
2324  0675 c60000        	ld	a,__boiler_type
2325  0678 cd082a        	call	LC012
2326  067b 1e04          	ldw	x,(OFST+1,sp)
2327  067d ca0014        	or	a,_uiInfo+20
2328  0680 e701          	ld	(1,x),a
2329                     ; 586 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2329                     ; 587 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2329                     ; 588 									| (uiInfo.valve_sub & 0x0F);
2331  0682 c6000b        	ld	a,_uiInfo+11
2332  0685 a40f          	and	a,#15
2333  0687 6b03          	ld	(OFST+0,sp),a
2334  0689 c60006        	ld	a,_uiInfo+6
2335                     ; 589 				buf[3] = _boiler_water_shower;
2337                     ; 590 				buf[4] = uiInfo.houseCapa;
2339                     ; 591 				buf[5] = _boiler_water_heat;
2341                     ; 592 				buf[6] = 	(mode << 7) 
2341                     ; 593 									| (uiInfo.subRCLock << 6) 
2341                     ; 594 									| ((uiInfo.poType & 0x01) << 4) 
2341                     ; 595 									| ((uiInfo.cntlMode & 0x01) << 3) 
2341                     ; 596 									| uiInfo.opMode;
2343  068c               LC011:
2344  068c a407          	and	a,#7
2345  068e cd0830        	call	LC013
2346  0691 6b02          	ld	(OFST-1,sp),a
2347  0693 c6005e        	ld	a,_uiInfo+94
2348  0696 a401          	and	a,#1
2349  0698 cd082a        	call	LC012
2350  069b 1a02          	or	a,(OFST-1,sp)
2351  069d 1e04          	ldw	x,(OFST+1,sp)
2352  069f 1a03          	or	a,(OFST+0,sp)
2353  06a1 e702          	ld	(2,x),a
2355  06a3 c60000        	ld	a,__boiler_water_shower
2356  06a6 e703          	ld	(3,x),a
2358  06a8 c60010        	ld	a,_uiInfo+16
2359  06ab e704          	ld	(4,x),a
2361  06ad c60000        	ld	a,__boiler_water_heat
2362  06b0 e705          	ld	(5,x),a
2364  06b2 c60003        	ld	a,_uiInfo+3
2365  06b5 a401          	and	a,#1
2366  06b7 48            	sll	a
2367  06b8 48            	sll	a
2368  06b9 48            	sll	a
2369  06ba 6b03          	ld	(OFST+0,sp),a
2370  06bc c6000f        	ld	a,_uiInfo+15
2371  06bf a401          	and	a,#1
2372  06c1 cd0830        	call	LC013
2373  06c4 6b02          	ld	(OFST-1,sp),a
2374  06c6 c6005d        	ld	a,_uiInfo+93
2375  06c9 97            	ld	xl,a
2376  06ca a640          	ld	a,#64
2377  06cc 42            	mul	x,a
2378  06cd 9f            	ld	a,xl
2379  06ce 6b01          	ld	(OFST-2,sp),a
2380  06d0 7b09          	ld	a,(OFST+6,sp)
2381  06d2 cd082a        	call	LC012
2382  06d5 1a01          	or	a,(OFST-2,sp)
2383  06d7 1a02          	or	a,(OFST-1,sp)
2384  06d9 1a03          	or	a,(OFST+0,sp)
2385  06db ca0007        	or	a,_uiInfo+7
2386  06de 1e04          	ldw	x,(OFST+1,sp)
2387  06e0 cc0825        	jp	LC010
2388  06e3               L176:
2389                     ; 599 		case 1:
2389                     ; 600 			if (mode == CNT_MODE_MAIN) {
2391  06e3 7b09          	ld	a,(OFST+6,sp)
2392  06e5 2651          	jrne	L727
2393                     ; 601 				buf[1] = mode << 7 
2393                     ; 602 							 | (uiInfo.valve_rc[0] << 4)
2393                     ; 603 							 | mode << 3 
2393                     ; 604 							 | uiInfo.valve_rc[1];
2395  06e7 48            	sll	a
2396  06e8 48            	sll	a
2397  06e9 48            	sll	a
2398  06ea 6b03          	ld	(OFST+0,sp),a
2399  06ec c6001d        	ld	a,_uiInfo+29
2400  06ef cd0830        	call	LC013
2401  06f2 6b02          	ld	(OFST-1,sp),a
2402  06f4 7b09          	ld	a,(OFST+6,sp)
2403  06f6 cd082a        	call	LC012
2404  06f9 1a02          	or	a,(OFST-1,sp)
2405  06fb 1a03          	or	a,(OFST+0,sp)
2406  06fd 1e04          	ldw	x,(OFST+1,sp)
2407  06ff ca001e        	or	a,_uiInfo+30
2408  0702 e701          	ld	(1,x),a
2409                     ; 605 				buf[2] = mode << 7 
2409                     ; 606 							 | (uiInfo.valve_rc[2] << 4)
2409                     ; 607 							 | mode << 3 
2409                     ; 608 							 | uiInfo.valve_rc[3];
2411  0704 7b09          	ld	a,(OFST+6,sp)
2412  0706 48            	sll	a
2413  0707 48            	sll	a
2414  0708 48            	sll	a
2415  0709 6b03          	ld	(OFST+0,sp),a
2416  070b c6001f        	ld	a,_uiInfo+31
2417  070e cd0830        	call	LC013
2418  0711 6b02          	ld	(OFST-1,sp),a
2419  0713 7b09          	ld	a,(OFST+6,sp)
2420  0715 cd082a        	call	LC012
2421  0718 1a02          	or	a,(OFST-1,sp)
2422  071a 1a03          	or	a,(OFST+0,sp)
2423  071c 1e04          	ldw	x,(OFST+1,sp)
2424  071e ca0020        	or	a,_uiInfo+32
2425  0721 e702          	ld	(2,x),a
2426                     ; 609 				buf[3] = uiInfo.valve_len[0];
2428  0723 c60015        	ld	a,_uiInfo+21
2429  0726 e703          	ld	(3,x),a
2430                     ; 610 				buf[4] = uiInfo.valve_len[1];
2432  0728 c60016        	ld	a,_uiInfo+22
2433  072b e704          	ld	(4,x),a
2434                     ; 611 				buf[5] = uiInfo.valve_len[2];
2436  072d c60017        	ld	a,_uiInfo+23
2437  0730 e705          	ld	(5,x),a
2438                     ; 612 				buf[6] = uiInfo.valve_len[3];
2440  0732 c60018        	ld	a,_uiInfo+24
2442  0735 cc0825        	jp	LC010
2443  0738               L727:
2444                     ; 614 				buf[1] = mode << 7 
2444                     ; 615 							 | (uiInfo.valve_sub_rc[0] << 4)
2444                     ; 616 							 | mode << 3 
2444                     ; 617 							 | uiInfo.valve_sub_rc[1];
2446  0738 48            	sll	a
2447  0739 48            	sll	a
2448  073a 48            	sll	a
2449  073b 6b03          	ld	(OFST+0,sp),a
2450  073d c6002d        	ld	a,_uiInfo+45
2451  0740 cd0830        	call	LC013
2452  0743 6b02          	ld	(OFST-1,sp),a
2453  0745 7b09          	ld	a,(OFST+6,sp)
2454  0747 cd082a        	call	LC012
2455  074a 1a02          	or	a,(OFST-1,sp)
2456  074c 1a03          	or	a,(OFST+0,sp)
2457  074e 1e04          	ldw	x,(OFST+1,sp)
2458  0750 ca002e        	or	a,_uiInfo+46
2459  0753 e701          	ld	(1,x),a
2460                     ; 618 				buf[2] = mode << 7 
2460                     ; 619 							 | (uiInfo.valve_sub_rc[2] << 4)
2460                     ; 620 							 | mode << 3 
2460                     ; 621 							 | uiInfo.valve_sub_rc[3];
2462  0755 7b09          	ld	a,(OFST+6,sp)
2463  0757 48            	sll	a
2464  0758 48            	sll	a
2465  0759 48            	sll	a
2466  075a 6b03          	ld	(OFST+0,sp),a
2467  075c c6002f        	ld	a,_uiInfo+47
2468  075f cd0830        	call	LC013
2469  0762 6b02          	ld	(OFST-1,sp),a
2470  0764 7b09          	ld	a,(OFST+6,sp)
2471  0766 cd082a        	call	LC012
2472  0769 1a02          	or	a,(OFST-1,sp)
2473  076b 1a03          	or	a,(OFST+0,sp)
2474  076d 1e04          	ldw	x,(OFST+1,sp)
2475  076f ca0030        	or	a,_uiInfo+48
2476  0772 e702          	ld	(2,x),a
2477                     ; 622 				buf[3] = uiInfo.valve_sub_len[0];
2479  0774 c60025        	ld	a,_uiInfo+37
2480  0777 e703          	ld	(3,x),a
2481                     ; 623 				buf[4] = uiInfo.valve_sub_len[1];
2483  0779 c60026        	ld	a,_uiInfo+38
2484  077c e704          	ld	(4,x),a
2485                     ; 624 				buf[5] = uiInfo.valve_sub_len[2];
2487  077e c60027        	ld	a,_uiInfo+39
2488  0781 e705          	ld	(5,x),a
2489                     ; 625 				buf[6] = uiInfo.valve_sub_len[3];
2491  0783 c60028        	ld	a,_uiInfo+40
2492  0786 cc0825        	jp	LC010
2493  0789               L376:
2494                     ; 628 		case 2:
2494                     ; 629 			if (mode == CNT_MODE_MAIN) {
2496  0789 7b09          	ld	a,(OFST+6,sp)
2497  078b 264e          	jrne	L337
2498                     ; 630 				buf[1] = mode << 7 
2498                     ; 631 							 | (uiInfo.valve_rc[4] << 4) 
2498                     ; 632 							 | mode << 3 
2498                     ; 633 							 | uiInfo.valve_rc[5];
2500  078d 48            	sll	a
2501  078e 48            	sll	a
2502  078f 48            	sll	a
2503  0790 6b03          	ld	(OFST+0,sp),a
2504  0792 c60021        	ld	a,_uiInfo+33
2505  0795 cd0830        	call	LC013
2506  0798 6b02          	ld	(OFST-1,sp),a
2507  079a 7b09          	ld	a,(OFST+6,sp)
2508  079c cd082a        	call	LC012
2509  079f 1a02          	or	a,(OFST-1,sp)
2510  07a1 1a03          	or	a,(OFST+0,sp)
2511  07a3 1e04          	ldw	x,(OFST+1,sp)
2512  07a5 ca0022        	or	a,_uiInfo+34
2513  07a8 e701          	ld	(1,x),a
2514                     ; 634 				buf[2] = mode << 7 
2514                     ; 635 							 | (uiInfo.valve_rc[6] << 4) 
2514                     ; 636 							 | mode << 3 
2514                     ; 637 							 | uiInfo.valve_rc[7];
2516  07aa 7b09          	ld	a,(OFST+6,sp)
2517  07ac 48            	sll	a
2518  07ad 48            	sll	a
2519  07ae 48            	sll	a
2520  07af 6b03          	ld	(OFST+0,sp),a
2521  07b1 c60023        	ld	a,_uiInfo+35
2522  07b4 ad7a          	call	LC013
2523  07b6 6b02          	ld	(OFST-1,sp),a
2524  07b8 7b09          	ld	a,(OFST+6,sp)
2525  07ba ad6e          	call	LC012
2526  07bc 1a02          	or	a,(OFST-1,sp)
2527  07be 1a03          	or	a,(OFST+0,sp)
2528  07c0 1e04          	ldw	x,(OFST+1,sp)
2529  07c2 ca0024        	or	a,_uiInfo+36
2530  07c5 e702          	ld	(2,x),a
2531                     ; 638 				buf[3] = uiInfo.valve_len[4];
2533  07c7 c60019        	ld	a,_uiInfo+25
2534  07ca e703          	ld	(3,x),a
2535                     ; 639 				buf[4] = uiInfo.valve_len[5];
2537  07cc c6001a        	ld	a,_uiInfo+26
2538  07cf e704          	ld	(4,x),a
2539                     ; 640 				buf[5] = uiInfo.valve_len[6];
2541  07d1 c6001b        	ld	a,_uiInfo+27
2542  07d4 e705          	ld	(5,x),a
2543                     ; 641 				buf[6] = uiInfo.valve_len[7];
2545  07d6 c6001c        	ld	a,_uiInfo+28
2547  07d9 204a          	jp	LC010
2548  07db               L337:
2549                     ; 643 				buf[1] = mode << 7 
2549                     ; 644 							 | (uiInfo.valve_sub_rc[4] << 4) 
2549                     ; 645 							 | mode << 3 
2549                     ; 646 							 | uiInfo.valve_sub_rc[5];
2551  07db 48            	sll	a
2552  07dc 48            	sll	a
2553  07dd 48            	sll	a
2554  07de 6b03          	ld	(OFST+0,sp),a
2555  07e0 c60031        	ld	a,_uiInfo+49
2556  07e3 ad4b          	call	LC013
2557  07e5 6b02          	ld	(OFST-1,sp),a
2558  07e7 7b09          	ld	a,(OFST+6,sp)
2559  07e9 ad3f          	call	LC012
2560  07eb 1a02          	or	a,(OFST-1,sp)
2561  07ed 1a03          	or	a,(OFST+0,sp)
2562  07ef 1e04          	ldw	x,(OFST+1,sp)
2563  07f1 ca0032        	or	a,_uiInfo+50
2564  07f4 e701          	ld	(1,x),a
2565                     ; 647 				buf[2] = mode << 7 
2565                     ; 648 							 | (uiInfo.valve_sub_rc[6] << 4) 
2565                     ; 649 							 | mode << 3 
2565                     ; 650 							 | uiInfo.valve_sub_rc[7];
2567  07f6 7b09          	ld	a,(OFST+6,sp)
2568  07f8 48            	sll	a
2569  07f9 48            	sll	a
2570  07fa 48            	sll	a
2571  07fb 6b03          	ld	(OFST+0,sp),a
2572  07fd c60033        	ld	a,_uiInfo+51
2573  0800 ad2e          	call	LC013
2574  0802 6b02          	ld	(OFST-1,sp),a
2575  0804 7b09          	ld	a,(OFST+6,sp)
2576  0806 ad22          	call	LC012
2577  0808 1a02          	or	a,(OFST-1,sp)
2578  080a 1a03          	or	a,(OFST+0,sp)
2579  080c 1e04          	ldw	x,(OFST+1,sp)
2580  080e ca0034        	or	a,_uiInfo+52
2581  0811 e702          	ld	(2,x),a
2582                     ; 651 				buf[3] = uiInfo.valve_sub_len[4];
2584  0813 c60029        	ld	a,_uiInfo+41
2585  0816 e703          	ld	(3,x),a
2586                     ; 652 				buf[4] = uiInfo.valve_sub_len[5];
2588  0818 c6002a        	ld	a,_uiInfo+42
2589  081b e704          	ld	(4,x),a
2590                     ; 653 				buf[5] = uiInfo.valve_sub_len[6];
2592  081d c6002b        	ld	a,_uiInfo+43
2593  0820 e705          	ld	(5,x),a
2594                     ; 654 				buf[6] = uiInfo.valve_sub_len[7];
2596  0822 c6002c        	ld	a,_uiInfo+44
2597  0825               LC010:
2598  0825 e706          	ld	(6,x),a
2599  0827               L127:
2600                     ; 659 }
2603  0827 5b05          	addw	sp,#5
2604  0829 81            	ret	
2605  082a               LC012:
2606  082a 97            	ld	xl,a
2607  082b a680          	ld	a,#128
2608  082d 42            	mul	x,a
2609  082e 9f            	ld	a,xl
2610  082f 81            	ret	
2611  0830               LC013:
2612  0830 97            	ld	xl,a
2613  0831 a610          	ld	a,#16
2614  0833 42            	mul	x,a
2615  0834 9f            	ld	a,xl
2616  0835 81            	ret	
2663                     ; 662 void rc_ptc_make_setting(uint8_t *buf) {
2664                     	switch	.text
2665  0836               _rc_ptc_make_setting:
2667  0836 89            	pushw	x
2668  0837 88            	push	a
2669       00000001      OFST:	set	1
2672                     ; 664 	uint8_t mode = uiInfo.controlMode;
2674  0838 c60009        	ld	a,_uiInfo+9
2675  083b 6b01          	ld	(OFST+0,sp),a
2676                     ; 666 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
2678  083d c60007        	ld	a,_cur_set_page
2679  0840 1e02          	ldw	x,(OFST+1,sp)
2680  0842 aa50          	or	a,#80
2681  0844 f7            	ld	(x),a
2682                     ; 668 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
2684  0845 7b01          	ld	a,(OFST+0,sp)
2685  0847 88            	push	a
2686  0848 3b0007        	push	_cur_set_page
2687  084b 1e04          	ldw	x,(OFST+3,sp)
2688  084d cd0636        	call	_rc_ptc_make_baseSetting
2690  0850 85            	popw	x
2691                     ; 670 	makeChecksum(buf);
2693  0851 1e02          	ldw	x,(OFST+1,sp)
2694  0853 cd060f        	call	_makeChecksum
2696                     ; 671 }
2699  0856 5b03          	addw	sp,#3
2700  0858 81            	ret	
2703                     	switch	.data
2704  0004               _dr_out_count:
2705  0004 01            	dc.b	1
2752                     ; 677 void rc_ptc_make_normal(uint8_t *buf) {
2753                     	switch	.text
2754  0859               _rc_ptc_make_normal:
2756  0859 89            	pushw	x
2757       00000000      OFST:	set	0
2760                     ; 679 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
2762  085a c60004        	ld	a,_uiInfo+4
2763  085d 1e01          	ldw	x,(OFST+1,sp)
2764  085f aaf0          	or	a,#240
2765  0861 f7            	ld	(x),a
2766                     ; 680 	buf[1] = _disp_mode2;
2768  0862 c60000        	ld	a,__disp_mode2
2769  0865 e701          	ld	(1,x),a
2770                     ; 681 	buf[2] = uiInfo.tCurr;
2772  0867 c60002        	ld	a,_uiInfo+2
2773  086a e702          	ld	(2,x),a
2774                     ; 682 	buf[3] = 0x00;
2776  086c 6f03          	clr	(3,x)
2777                     ; 683 	buf[4] = 0x00;
2779  086e 6f04          	clr	(4,x)
2780                     ; 684 	buf[5] = 0x00;
2782  0870 6f05          	clr	(5,x)
2783                     ; 685 	buf[6] = 0x00;
2785  0872 6f06          	clr	(6,x)
2786                     ; 687 	if (uiInfo.mode == SETTING_MODE_MASTER) {
2788  0874 c60008        	ld	a,_uiInfo+8
2789  0877 4a            	dec	a
2790  0878 2619          	jrne	L1101
2791                     ; 688 		buf[4] = _boiler_water_heat;
2793  087a c60000        	ld	a,__boiler_water_heat
2794  087d e704          	ld	(4,x),a
2795                     ; 689 		buf[6] = __boiler_shower[5] == 1 ? 1 : 0; // 온수모드   
2797  087f c60005        	ld	a,___boiler_shower+5
2798  0882 4a            	dec	a
2799  0883 2603          	jrne	L061
2800  0885 4c            	inc	a
2801  0886 2001          	jra	L261
2802  0888               L061:
2803  0888 4f            	clr	a
2804  0889               L261:
2805  0889 e706          	ld	(6,x),a
2806                     ; 690 		buf[6] |= (_boiler_water_shower << 1);					// 온수
2808  088b c60000        	ld	a,__boiler_water_shower
2809  088e 48            	sll	a
2810  088f ea06          	or	a,(6,x)
2811  0891 e706          	ld	(6,x),a
2812  0893               L1101:
2813                     ; 693 	switch(buf[1]) {
2815  0893 e601          	ld	a,(1,x)
2817                     ; 728 		default:
2817                     ; 729 			break;
2818  0895 4a            	dec	a
2819  0896 270d          	jreq	L757
2820  0898 4a            	dec	a
2821  0899 2711          	jreq	L167
2822  089b a006          	sub	a,#6
2823  089d 2720          	jreq	L767
2824  089f a008          	sub	a,#8
2825  08a1 270e          	jreq	L567
2826  08a3 201f          	jra	L5101
2827  08a5               L757:
2828                     ; 694 		case RC_MODE_HEAT:
2828                     ; 695 			buf[3] = uiInfo.tSetup;
2830  08a5 c6000e        	ld	a,_uiInfo+14
2831  08a8 e703          	ld	(3,x),a
2832                     ; 696 			break;
2834  08aa 2018          	jra	L5101
2835  08ac               L167:
2836                     ; 697 		case RC_MODE_OUT:
2836                     ; 698 			buf[5] = dr_mode_out;
2838  08ac c60002        	ld	a,_dr_mode_out
2839                     ; 714 			break;
2841  08af 2011          	jp	LC014
2842                     ; 715 		case RC_MODE_STOP:
2842                     ; 716 			break;
2844  08b1               L567:
2845                     ; 717 		case RC_MODE_REPEAT:
2845                     ; 718 			if(_timFlag == 0) {
2847  08b1 c60000        	ld	a,__timFlag
2848  08b4 2604          	jrne	L7101
2849                     ; 719 				buf[3] = MAX_REPEAT_TEMP;
2851  08b6 a650          	ld	a,#80
2852  08b8 e703          	ld	(3,x),a
2853  08ba               L7101:
2854                     ; 722 			buf[5] = uiInfo.repeat;
2856  08ba c6000c        	ld	a,_uiInfo+12
2857                     ; 724 			break;
2859  08bd 2003          	jp	LC014
2860  08bf               L767:
2861                     ; 725 		case RC_MODE_RESERVE:
2861                     ; 726 			buf[5] = uiInfo.reserve;
2863  08bf c6000d        	ld	a,_uiInfo+13
2864  08c2               LC014:
2865  08c2 e705          	ld	(5,x),a
2866                     ; 727 			break;
2868                     ; 728 		default:
2868                     ; 729 			break;
2870  08c4               L5101:
2871                     ; 732 	makeChecksum(buf);
2873  08c4 1e01          	ldw	x,(OFST+1,sp)
2874  08c6 cd060f        	call	_makeChecksum
2876                     ; 734 	if (disp_mode_preview != _disp_mode2){
2878  08c9 c60002        	ld	a,_disp_mode_preview
2879  08cc c10000        	cp	a,__disp_mode2
2880  08cf 2712          	jreq	L1201
2881                     ; 735 		if (uiInfo.mode == SETTING_MODE_SUB) {
2883                     ; 737 				UPDATE_BIT(BIT_DISPMODE);
2886                     ; 738 				disp_mode_preview = _disp_mode2;
2889                     ; 741 			UPDATE_BIT(BIT_DISPMODE);
2895                     ; 742 			disp_mode_preview = _disp_mode2;
2899  08d1 72160000      	bset	__updateBit,#3
2901  08d5 5500000000    	mov	__updateTimer,___timer1s
2903  08da 35050000      	mov	__updateCount,#5
2905  08de 5500000002    	mov	_disp_mode_preview,__disp_mode2
2906  08e3               L1201:
2907                     ; 746 	only_one++;
2909  08e3 725c0003      	inc	_only_one
2910                     ; 747 }
2913  08e7 85            	popw	x
2914  08e8 81            	ret	
2966                     ; 750 uint8_t rc_ptc_check_subRC(void) {
2967                     	switch	.text
2968  08e9               _rc_ptc_check_subRC:
2970  08e9 89            	pushw	x
2971       00000002      OFST:	set	2
2974                     ; 755 	if (_remote == 1) {
2976  08ea c60000        	ld	a,__remote
2977  08ed 4a            	dec	a
2978  08ee 2603          	jrne	L7501
2979                     ; 756 		return 0xFF;
2981  08f0 4a            	dec	a
2984  08f1 85            	popw	x
2985  08f2 81            	ret	
2986  08f3               L7501:
2987                     ; 759 	ch = 0;
2989  08f3 0f01          	clr	(OFST-1,sp)
2990                     ; 760 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
2992  08f5 cd0a3a        	call	LC017
2993  08f8 d60025        	ld	a,(_rcSubDataInfo+16,x)
2994  08fb 4c            	inc	a
2995  08fc 2704          	jreq	L1601
2996                     ; 761 		ch = 1;
2998  08fe a601          	ld	a,#1
2999  0900 6b01          	ld	(OFST-1,sp),a
3000  0902               L1601:
3001                     ; 764 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
3003  0902 c60004        	ld	a,_uiInfo+4
3004  0905 5f            	clrw	x
3005  0906 97            	ld	xl,a
3006  0907 5a            	decw	x
3007  0908 c60000        	ld	a,__disp_mode2
3008  090b d70025        	ld	(_rcSubDataInfo+16,x),a
3009                     ; 765 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
3011  090e cd0a3a        	call	LC017
3012  0911 c60002        	ld	a,_uiInfo+2
3013  0914 d70015        	ld	(_rcSubDataInfo,x),a
3014                     ; 766 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
3016  0917 cd0a3a        	call	LC017
3017  091a c6000e        	ld	a,_uiInfo+14
3018  091d d7001d        	ld	(_rcSubDataInfo+8,x),a
3019                     ; 767 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
3021  0920 cd0a3a        	call	LC017
3022  0923 c6000d        	ld	a,_uiInfo+13
3023  0926 d70035        	ld	(_rcSubDataInfo+32,x),a
3024                     ; 768 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
3026  0929 cd0a3a        	call	LC017
3027  092c c6000c        	ld	a,_uiInfo+12
3028  092f d7003d        	ld	(_rcSubDataInfo+40,x),a
3029                     ; 770 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
3031  0932 cd0a3a        	call	LC017
3032  0935 c60000        	ld	a,__disp_mode2
3033  0938 d70045        	ld	(_uiInfo+69,x),a
3034                     ; 771 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
3036  093b cd0a3a        	call	LC017
3037  093e c60002        	ld	a,_uiInfo+2
3038  0941 d70035        	ld	(_uiInfo+53,x),a
3039                     ; 772 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
3041  0944 cd0a3a        	call	LC017
3042  0947 c6000e        	ld	a,_uiInfo+14
3043  094a d7003d        	ld	(_uiInfo+61,x),a
3044                     ; 773 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
3046  094d cd0a3a        	call	LC017
3047  0950 c6000d        	ld	a,_uiInfo+13
3048  0953 d7004d        	ld	(_uiInfo+77,x),a
3049                     ; 774 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
3051  0956 cd0a3a        	call	LC017
3052  0959 c6000c        	ld	a,_uiInfo+12
3053  095c d70055        	ld	(_uiInfo+85,x),a
3054                     ; 776 	if (ch == 0) {
3056  095f 7b01          	ld	a,(OFST-1,sp)
3057  0961 2603          	jrne	L3601
3058                     ; 778 		return 0xFF;
3060  0963 4a            	dec	a
3063  0964 85            	popw	x
3064  0965 81            	ret	
3065  0966               L3601:
3066                     ; 781 	num = 0xFF;
3068  0966 a6ff          	ld	a,#255
3069  0968 6b01          	ld	(OFST-1,sp),a
3070                     ; 782 	for (i = 0 ; i < 8 ; i++) {
3072  096a 4f            	clr	a
3073  096b 6b02          	ld	(OFST+0,sp),a
3074  096d               L5601:
3075                     ; 783 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
3077  096d 5f            	clrw	x
3078  096e 97            	ld	xl,a
3079  096f d6001d        	ld	a,(_rcSubDataInfo+8,x)
3080  0972 a1aa          	cp	a,#170
3081  0974 2756          	jreq	L7601
3082                     ; 784 			continue;
3084                     ; 787 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
3086  0976 7b02          	ld	a,(OFST+0,sp)
3087  0978 cd0a41        	call	LC018
3088  097b 90d60045      	ld	a,(_uiInfo+69,y)
3089  097f d10025        	cp	a,(_rcSubDataInfo+16,x)
3090  0982 2706          	jreq	L5701
3091                     ; 788 			num = i;
3093  0984 7b02          	ld	a,(OFST+0,sp)
3094  0986 6b01          	ld	(OFST-1,sp),a
3095                     ; 789 			break;
3097  0988 204c          	jra	L1701
3098  098a               L5701:
3099                     ; 792 		switch (rcSubDataInfo.mode_heat[i]) {
3101  098a 7b02          	ld	a,(OFST+0,sp)
3102  098c 5f            	clrw	x
3103  098d 97            	ld	xl,a
3104  098e d60025        	ld	a,(_rcSubDataInfo+16,x)
3106                     ; 810 				break;
3107  0991 4a            	dec	a
3108  0992 270a          	jreq	L7201
3109  0994 a007          	sub	a,#7
3110  0996 2722          	jreq	L5301
3111  0998 a008          	sub	a,#8
3112  099a 2710          	jreq	L3301
3113  099c 202e          	jra	L7601
3114  099e               L7201:
3115                     ; 793 			case RC_MODE_HEAT:
3115                     ; 794 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
3117  099e 7b02          	ld	a,(OFST+0,sp)
3118  09a0 cd0a41        	call	LC018
3119  09a3 90d6003d      	ld	a,(_uiInfo+61,y)
3120  09a7 d1001d        	cp	a,(_rcSubDataInfo+8,x)
3121                     ; 795 					num = i;
3122  09aa 201a          	jp	LC016
3123                     ; 798 			case RC_MODE_OUT:
3123                     ; 799 			case RC_MODE_STOP:
3123                     ; 800 				break;
3125  09ac               L3301:
3126                     ; 801 			case RC_MODE_REPEAT:
3126                     ; 802 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
3128  09ac 7b02          	ld	a,(OFST+0,sp)
3129  09ae cd0a41        	call	LC018
3130  09b1 90d60055      	ld	a,(_uiInfo+85,y)
3131  09b5 d1003d        	cp	a,(_rcSubDataInfo+40,x)
3132                     ; 803 					num = i;
3133  09b8 200c          	jp	LC016
3134  09ba               L5301:
3135                     ; 806 			case RC_MODE_RESERVE:
3135                     ; 807 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
3137  09ba 7b02          	ld	a,(OFST+0,sp)
3138  09bc cd0a41        	call	LC018
3139  09bf 90d6004d      	ld	a,(_uiInfo+77,y)
3140  09c3 d10035        	cp	a,(_rcSubDataInfo+32,x)
3141                     ; 808 					num = i;
3143  09c6               LC016:
3144  09c6 2704          	jreq	L7601
3147  09c8 7b02          	ld	a,(OFST+0,sp)
3148  09ca 6b01          	ld	(OFST-1,sp),a
3149  09cc               L7601:
3150                     ; 782 	for (i = 0 ; i < 8 ; i++) {
3152  09cc 0c02          	inc	(OFST+0,sp)
3155  09ce 7b02          	ld	a,(OFST+0,sp)
3156  09d0 a108          	cp	a,#8
3157  09d2 2599          	jrult	L5601
3158  09d4 7b01          	ld	a,(OFST-1,sp)
3159  09d6               L1701:
3160                     ; 814 	if (num == 0xFF) {
3162  09d6 a1ff          	cp	a,#255
3163  09d8 260a          	jrne	L1111
3164                     ; 815 		ret_count = MAX_REPEAT_ERROR_COUNT;
3166  09da 35050001      	mov	_ret_count,#5
3167                     ; 816 		cur_src = 0;
3169  09de 725f0000      	clr	_cur_src
3170                     ; 817 		return num;
3173  09e2 2054          	jra	L071
3174  09e4               L1111:
3175                     ; 820 	if (cur_src == num) {
3177  09e4 c60000        	ld	a,_cur_src
3178  09e7 1101          	cp	a,(OFST-1,sp)
3179  09e9 2642          	jrne	L3111
3180                     ; 821 		ret_count--;
3182  09eb 725a0001      	dec	_ret_count
3183                     ; 823 		if (ret_count == 0) {
3185  09ef 2645          	jrne	L7111
3186                     ; 824 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
3188  09f1 7b01          	ld	a,(OFST-1,sp)
3189  09f3 5f            	clrw	x
3190  09f4 97            	ld	xl,a
3191  09f5 d60045        	ld	a,(_uiInfo+69,x)
3192  09f8 d70025        	ld	(_rcSubDataInfo+16,x),a
3193                     ; 825 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
3195  09fb 5f            	clrw	x
3196  09fc 7b01          	ld	a,(OFST-1,sp)
3197  09fe 97            	ld	xl,a
3198  09ff d60035        	ld	a,(_uiInfo+53,x)
3199  0a02 d70015        	ld	(_rcSubDataInfo,x),a
3200                     ; 826 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
3202  0a05 5f            	clrw	x
3203  0a06 7b01          	ld	a,(OFST-1,sp)
3204  0a08 97            	ld	xl,a
3205  0a09 d6003d        	ld	a,(_uiInfo+61,x)
3206  0a0c d7001d        	ld	(_rcSubDataInfo+8,x),a
3207                     ; 827 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
3209  0a0f 5f            	clrw	x
3210  0a10 7b01          	ld	a,(OFST-1,sp)
3211  0a12 97            	ld	xl,a
3212  0a13 d6004d        	ld	a,(_uiInfo+77,x)
3213  0a16 d70035        	ld	(_rcSubDataInfo+32,x),a
3214                     ; 828 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
3216  0a19 5f            	clrw	x
3217  0a1a 7b01          	ld	a,(OFST-1,sp)
3218  0a1c 97            	ld	xl,a
3219  0a1d d60055        	ld	a,(_uiInfo+85,x)
3220  0a20 d7003d        	ld	(_rcSubDataInfo+40,x),a
3221                     ; 830 			ret_count = MAX_REPEAT_ERROR_COUNT;
3223  0a23 35050001      	mov	_ret_count,#5
3224                     ; 831 			num = 0xFF;
3226  0a27 a6ff          	ld	a,#255
3227  0a29 6b01          	ld	(OFST-1,sp),a
3228  0a2b 2009          	jra	L7111
3229  0a2d               L3111:
3230                     ; 834 		cur_src = num;
3232  0a2d 7b01          	ld	a,(OFST-1,sp)
3233  0a2f c70000        	ld	_cur_src,a
3234                     ; 835 		ret_count = MAX_REPEAT_ERROR_COUNT;
3236  0a32 35050001      	mov	_ret_count,#5
3237  0a36               L7111:
3238                     ; 838 	return num;
3240  0a36 7b01          	ld	a,(OFST-1,sp)
3242  0a38               L071:
3244  0a38 85            	popw	x
3245  0a39 81            	ret	
3246  0a3a               LC017:
3247  0a3a 5f            	clrw	x
3248  0a3b c60004        	ld	a,_uiInfo+4
3249  0a3e 97            	ld	xl,a
3250  0a3f 5a            	decw	x
3251  0a40 81            	ret	
3252  0a41               LC018:
3253  0a41 5f            	clrw	x
3254  0a42 97            	ld	xl,a
3255  0a43 905f          	clrw	y
3256  0a45 9097          	ld	yl,a
3257  0a47 81            	ret	
3301                     ; 842 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3302                     	switch	.text
3303  0a48               _rc_ptc_make_subRC:
3305  0a48 89            	pushw	x
3306       00000000      OFST:	set	0
3309                     ; 843 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3311  0a49 7b05          	ld	a,(OFST+5,sp)
3312  0a4b 4c            	inc	a
3313  0a4c 1e01          	ldw	x,(OFST+1,sp)
3314  0a4e aa60          	or	a,#96
3315  0a50 f7            	ld	(x),a
3316                     ; 844 	buf[1] = uiInfo.remote_mode[num];
3318  0a51 5f            	clrw	x
3319  0a52 7b05          	ld	a,(OFST+5,sp)
3320  0a54 97            	ld	xl,a
3321  0a55 d60045        	ld	a,(_uiInfo+69,x)
3322  0a58 1e01          	ldw	x,(OFST+1,sp)
3323                     ; 845 	buf[2] = 0x00;
3325  0a5a 6f02          	clr	(2,x)
3326  0a5c e701          	ld	(1,x),a
3327                     ; 846 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3329  0a5e 5f            	clrw	x
3330  0a5f 7b05          	ld	a,(OFST+5,sp)
3331  0a61 97            	ld	xl,a
3332  0a62 d60045        	ld	a,(_uiInfo+69,x)
3333  0a65 4a            	dec	a
3334  0a66 260d          	jrne	L1411
3335                     ; 847 		buf[3] = uiInfo.tempSetup[num];
3337  0a68 7b05          	ld	a,(OFST+5,sp)
3338  0a6a 5f            	clrw	x
3339  0a6b 97            	ld	xl,a
3340  0a6c d6003d        	ld	a,(_uiInfo+61,x)
3341  0a6f 1e01          	ldw	x,(OFST+1,sp)
3342  0a71 e703          	ld	(3,x),a
3344  0a73 2004          	jra	L3411
3345  0a75               L1411:
3346                     ; 849 		buf[3] = 0x00;
3348  0a75 1e01          	ldw	x,(OFST+1,sp)
3349  0a77 6f03          	clr	(3,x)
3350  0a79               L3411:
3351                     ; 852 	buf[4] = 0x00;
3353  0a79 6f04          	clr	(4,x)
3354                     ; 854 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3356  0a7b 5f            	clrw	x
3357  0a7c 7b05          	ld	a,(OFST+5,sp)
3358  0a7e 97            	ld	xl,a
3359  0a7f d60045        	ld	a,(_uiInfo+69,x)
3360  0a82 a110          	cp	a,#16
3361  0a84 2609          	jrne	L5411
3362                     ; 855 		buf[5] = uiInfo.remote_banb[num];
3364  0a86 7b05          	ld	a,(OFST+5,sp)
3365  0a88 5f            	clrw	x
3366  0a89 97            	ld	xl,a
3367  0a8a d60055        	ld	a,(_uiInfo+85,x)
3369  0a8d 2012          	jp	LC019
3370  0a8f               L5411:
3371                     ; 856 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3373  0a8f 7b05          	ld	a,(OFST+5,sp)
3374  0a91 5f            	clrw	x
3375  0a92 97            	ld	xl,a
3376  0a93 d60045        	ld	a,(_uiInfo+69,x)
3377  0a96 a108          	cp	a,#8
3378  0a98 260d          	jrne	L1511
3379                     ; 857 		buf[5] = uiInfo.remote_time[num];
3381  0a9a 7b05          	ld	a,(OFST+5,sp)
3382  0a9c 5f            	clrw	x
3383  0a9d 97            	ld	xl,a
3384  0a9e d6004d        	ld	a,(_uiInfo+77,x)
3385  0aa1               LC019:
3386  0aa1 1e01          	ldw	x,(OFST+1,sp)
3387  0aa3 e705          	ld	(5,x),a
3389  0aa5 2004          	jra	L7411
3390  0aa7               L1511:
3391                     ; 859 		buf[5] = 0x00;
3393  0aa7 1e01          	ldw	x,(OFST+1,sp)
3394  0aa9 6f05          	clr	(5,x)
3395  0aab               L7411:
3396                     ; 862 	buf[6] = 0x00;
3398  0aab 6f06          	clr	(6,x)
3399                     ; 864 	makeChecksum(buf);
3401  0aad cd060f        	call	_makeChecksum
3403                     ; 865 }
3406  0ab0 85            	popw	x
3407  0ab1 81            	ret	
3446                     ; 867 void rc_ptc_make_error(uint8_t *buf) {
3447                     	switch	.text
3448  0ab2               _rc_ptc_make_error:
3450  0ab2 89            	pushw	x
3451       00000000      OFST:	set	0
3454                     ; 868 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3456  0ab3 c60004        	ld	a,_uiInfo+4
3457  0ab6 1e01          	ldw	x,(OFST+1,sp)
3458  0ab8 aae0          	or	a,#224
3459  0aba f7            	ld	(x),a
3460                     ; 869 	buf[1] = error;
3462  0abb c6000a        	ld	a,_error
3463  0abe e701          	ld	(1,x),a
3464                     ; 870 	buf[2] = mode_recover;
3466  0ac0 c6000f        	ld	a,_mode_recover
3467  0ac3 e702          	ld	(2,x),a
3468                     ; 871 	buf[3] = 0x00;
3470  0ac5 6f03          	clr	(3,x)
3471                     ; 872 	buf[4] = 0x00;
3473  0ac7 6f04          	clr	(4,x)
3474                     ; 873 	buf[5] = 0x00;
3476  0ac9 6f05          	clr	(5,x)
3477                     ; 874 	buf[6] = 0x00;
3479  0acb 6f06          	clr	(6,x)
3480                     ; 876 	makeChecksum(buf);
3482  0acd cd060f        	call	_makeChecksum
3484                     ; 877 }
3487  0ad0 85            	popw	x
3488  0ad1 81            	ret	
3525                     ; 879 void rc_ptc_make_command(uint8_t *buf) {
3526                     	switch	.text
3527  0ad2               _rc_ptc_make_command:
3529  0ad2 89            	pushw	x
3530       00000000      OFST:	set	0
3533                     ; 880 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3535  0ad3 c60004        	ld	a,_uiInfo+4
3536  0ad6 1e01          	ldw	x,(OFST+1,sp)
3537  0ad8 aaf0          	or	a,#240
3538  0ada f7            	ld	(x),a
3539                     ; 881 	buf[1] = 0x20;
3541  0adb a620          	ld	a,#32
3542  0add e701          	ld	(1,x),a
3543                     ; 882 	buf[2] = 0x00;
3545  0adf 6f02          	clr	(2,x)
3546                     ; 883 	buf[3] = 0x00;
3548  0ae1 6f03          	clr	(3,x)
3549                     ; 884 	buf[4] = 0x00;
3551  0ae3 6f04          	clr	(4,x)
3552                     ; 885 	buf[5] = 0x00;
3554  0ae5 6f05          	clr	(5,x)
3555                     ; 886 	buf[6] = 0x00;
3557  0ae7 6f06          	clr	(6,x)
3558                     ; 887 }
3561  0ae9 85            	popw	x
3562  0aea 81            	ret	
3614                     ; 897 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
3614                     ; 898 {
3615                     	switch	.text
3616  0aeb               _rc_ptc_make_command_packet:
3618  0aeb 89            	pushw	x
3619       00000000      OFST:	set	0
3622                     ; 899 	rc_ptc_make_command(buf);
3624  0aec ade4          	call	_rc_ptc_make_command
3626                     ; 900 	switch( cmd )
3628  0aee 7b05          	ld	a,(OFST+5,sp)
3630                     ; 927 		break;
3631  0af0 4a            	dec	a
3632  0af1 270c          	jreq	L1121
3633  0af3 a003          	sub	a,#3
3634  0af5 270d          	jreq	L3121
3635  0af7 4a            	dec	a
3636  0af8 2710          	jreq	L5121
3637  0afa 4a            	dec	a
3638  0afb 2713          	jreq	L7121
3639  0afd 201b          	jra	L5421
3640  0aff               L1121:
3641                     ; 902 	case PKT_CMD_MIRROR:
3641                     ; 903 		buf[2] = COMMAND_MODE_MIRROR;
3643  0aff 1e01          	ldw	x,(OFST+1,sp)
3644  0b01 4c            	inc	a
3645                     ; 904 		buf[3] = p1;
3646                     ; 905 		break;
3648  0b02 2010          	jp	LC020
3649  0b04               L3121:
3650                     ; 916 	case PKT_CMD_FACTORY:
3650                     ; 917 		buf[2] = COMMAND_MODE_FACTORY;
3652  0b04 1e01          	ldw	x,(OFST+1,sp)
3653  0b06 a608          	ld	a,#8
3654                     ; 918 		buf[3] = p1;
3655                     ; 919 		break;
3657  0b08 200a          	jp	LC020
3658  0b0a               L5121:
3659                     ; 920 	case PKT_CMD_RESET:
3659                     ; 921 		buf[2] = COMMAND_MODE_RESET;
3661  0b0a 1e01          	ldw	x,(OFST+1,sp)
3662  0b0c a604          	ld	a,#4
3663                     ; 922 		buf[3] = p1;
3664                     ; 923 		break;
3666  0b0e 2004          	jp	LC020
3667  0b10               L7121:
3668                     ; 924 	case PKT_CMD_BOILER_HOT_MODE:
3668                     ; 925 		buf[2] = COMMAND_MODE_HOTWATER;
3670  0b10 1e01          	ldw	x,(OFST+1,sp)
3671  0b12 a602          	ld	a,#2
3672                     ; 926 		buf[3] = p1;
3674  0b14               LC020:
3675  0b14 e702          	ld	(2,x),a
3679  0b16 7b06          	ld	a,(OFST+6,sp)
3680  0b18 e703          	ld	(3,x),a
3681                     ; 927 		break;
3683  0b1a               L5421:
3684                     ; 930 	makeChecksum(buf);
3686  0b1a 1e01          	ldw	x,(OFST+1,sp)
3687  0b1c cd060f        	call	_makeChecksum
3689                     ; 931 }
3692  0b1f 85            	popw	x
3693  0b20 81            	ret	
3739                     ; 967 void rc_ptc_make_mirror(uint8_t *buf) {
3740                     	switch	.text
3741  0b21               _rc_ptc_make_mirror:
3743  0b21 89            	pushw	x
3744  0b22 88            	push	a
3745       00000001      OFST:	set	1
3748                     ; 969 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
3750  0b23 c60006        	ld	a,_cur_mirror_page
3751  0b26 1e02          	ldw	x,(OFST+1,sp)
3752  0b28 aa40          	or	a,#64
3753  0b2a f7            	ld	(x),a
3754                     ; 971 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
3756  0b2b c60011        	ld	a,_mode_mirror
3757  0b2e 4a            	dec	a
3758  0b2f 2702          	jreq	L612
3759  0b31 a601          	ld	a,#1
3760  0b33               L612:
3761  0b33 6b01          	ld	(OFST+0,sp),a
3762                     ; 972 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
3764  0b35 88            	push	a
3765  0b36 3b0006        	push	_cur_mirror_page
3766  0b39 1e04          	ldw	x,(OFST+3,sp)
3767  0b3b cd0636        	call	_rc_ptc_make_baseSetting
3769  0b3e 85            	popw	x
3770                     ; 974 	makeChecksum(buf);
3772  0b3f 1e02          	ldw	x,(OFST+1,sp)
3773  0b41 cd060f        	call	_makeChecksum
3775                     ; 976 	if (cur_mirror_page == 2) {
3777  0b44 c60006        	ld	a,_cur_mirror_page
3778  0b47 a102          	cp	a,#2
3779  0b49 2608          	jrne	L7621
3780                     ; 977 		cur_mirror_page = 0;
3782  0b4b 725f0006      	clr	_cur_mirror_page
3783                     ; 978 		mode_mirror = 0;
3785  0b4f 725f0011      	clr	_mode_mirror
3786  0b53               L7621:
3787                     ; 980 }
3790  0b53 5b03          	addw	sp,#3
3791  0b55 81            	ret	
3849                     ; 982 void rc_ptc_make(uint8_t *buf) {
3850                     	switch	.text
3851  0b56               _rc_ptc_make:
3853  0b56 89            	pushw	x
3854  0b57 88            	push	a
3855       00000001      OFST:	set	1
3858                     ; 986 	if (error != 0 && error_type != 0) {
3860  0b58 c6000a        	ld	a,_error
3861  0b5b 2705          	jreq	L5131
3863  0b5d c60009        	ld	a,_error_type
3864                     ; 987 		rc_ptc_make_error(buf);
3866                     ; 988 		return;
3868  0b60 2608          	jrne	LC021
3869  0b62               L5131:
3870                     ; 990 		if (mode_recover == 1) {
3872  0b62 c6000f        	ld	a,_mode_recover
3873  0b65 4a            	dec	a
3874  0b66 2608          	jrne	L7131
3875                     ; 991 			rc_ptc_make_error(buf);
3877  0b68 1e02          	ldw	x,(OFST+1,sp)
3878  0b6a               LC021:
3880  0b6a cd0ab2        	call	_rc_ptc_make_error
3882                     ; 992 			return;
3883  0b6d               L062:
3886  0b6d 5b03          	addw	sp,#3
3887  0b6f 81            	ret	
3888  0b70               L7131:
3889                     ; 996 	switch (uiInfo.mode) {
3891  0b70 c60008        	ld	a,_uiInfo+8
3893                     ; 1044 			break;
3894  0b73 276a          	jreq	LC022
3895  0b75 4a            	dec	a
3896  0b76 26f5          	jrne	L062
3897                     ; 997 		case SETTING_MODE_MASTER:
3897                     ; 998 			
3897                     ; 999 			if (getSettingChange() == 1) {
3899  0b78 cd0603        	call	_getSettingChange
3901  0b7b 4a            	dec	a
3902  0b7c 2607          	jrne	L7231
3903                     ; 1000 				rc_ptc_make_setting(buf);
3905  0b7e 1e02          	ldw	x,(OFST+1,sp)
3906  0b80 cd0836        	call	_rc_ptc_make_setting
3908                     ; 1001 				return;
3910  0b83 20e8          	jra	L062
3911  0b85               L7231:
3912                     ; 1005 			if (mode_mirror != 0) {
3914  0b85 c60011        	ld	a,_mode_mirror
3915  0b88 270d          	jreq	L1331
3916                     ; 1006 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
3918  0b8a 3b0011        	push	_mode_mirror
3919  0b8d 4b01          	push	#1
3920  0b8f 1e04          	ldw	x,(OFST+3,sp)
3921  0b91 cd0aeb        	call	_rc_ptc_make_command_packet
3923  0b94 85            	popw	x
3924                     ; 1007 				return;
3926  0b95 20d6          	jra	L062
3927  0b97               L1331:
3928                     ; 1010 			if (mode_factory != 0) {
3930  0b97 c60010        	ld	a,_mode_factory
3931  0b9a 2711          	jreq	L3331
3932                     ; 1012 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
3934  0b9c 3b0010        	push	_mode_factory
3935  0b9f 4b04          	push	#4
3936  0ba1 1e04          	ldw	x,(OFST+3,sp)
3937  0ba3 cd0aeb        	call	_rc_ptc_make_command_packet
3939  0ba6 725f0010      	clr	_mode_factory
3940  0baa 85            	popw	x
3941                     ; 1013 				mode_factory = 0;
3943                     ; 1014 				return;
3945  0bab 20c0          	jra	L062
3946  0bad               L3331:
3947                     ; 1017 			if (mode_hotwater != 0) {
3949  0bad c6000e        	ld	a,_mode_hotwater
3950  0bb0 270d          	jreq	L5331
3951                     ; 1019 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
3953  0bb2 3b000e        	push	_mode_hotwater
3954  0bb5 4b06          	push	#6
3955  0bb7 1e04          	ldw	x,(OFST+3,sp)
3956  0bb9 cd0aeb        	call	_rc_ptc_make_command_packet
3958  0bbc 85            	popw	x
3959                     ; 1020 				return;
3961  0bbd 20ae          	jra	L062
3962  0bbf               L5331:
3963                     ; 1023 			if (mode_reset != 0) {
3965  0bbf c6000d        	ld	a,_mode_reset
3966  0bc2 270d          	jreq	L7331
3967                     ; 1025 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
3969  0bc4 3b000d        	push	_mode_reset
3970  0bc7 4b05          	push	#5
3971  0bc9 1e04          	ldw	x,(OFST+3,sp)
3972  0bcb cd0aeb        	call	_rc_ptc_make_command_packet
3974  0bce 85            	popw	x
3975                     ; 1026 				return;
3977  0bcf 209c          	jra	L062
3978  0bd1               L7331:
3979                     ; 1030 			num = rc_ptc_check_subRC();
3981  0bd1 cd08e9        	call	_rc_ptc_check_subRC
3983  0bd4 6b01          	ld	(OFST+0,sp),a
3984                     ; 1031 			if ( num == 0xFF) {
3986  0bd6 4c            	inc	a
3987                     ; 1032 				rc_ptc_make_normal(buf);
3989                     ; 1033 				return;
3991  0bd7 2706          	jreq	LC022
3992                     ; 1036 			if (_remote == 1) {
3994  0bd9 c60000        	ld	a,__remote
3995  0bdc 4a            	dec	a
3996  0bdd 2607          	jrne	L3431
3997                     ; 1037 				rc_ptc_make_normal(buf);
3999  0bdf               LC022:
4002  0bdf 1e02          	ldw	x,(OFST+1,sp)
4003  0be1 cd0859        	call	_rc_ptc_make_normal
4006  0be4 2087          	jra	L062
4007  0be6               L3431:
4008                     ; 1039 				rc_ptc_make_subRC(buf, num);
4010  0be6 7b01          	ld	a,(OFST+0,sp)
4011  0be8 88            	push	a
4012  0be9 1e03          	ldw	x,(OFST+2,sp)
4013  0beb cd0a48        	call	_rc_ptc_make_subRC
4015  0bee 84            	pop	a
4016  0bef cc0b6d        	jra	L062
4017                     ; 1042 		case SETTING_MODE_SUB:
4017                     ; 1043 			rc_ptc_make_normal(buf);
4019                     ; 1044 			break;
4021                     ; 1046 }
4065                     ; 1049 void func_rc_command(uint8_t com1, uint8_t com2) {
4066                     	switch	.text
4067  0bf2               _func_rc_command:
4069  0bf2 89            	pushw	x
4070       00000000      OFST:	set	0
4073                     ; 1050 	mode_mirror = 0;
4075  0bf3 725f0011      	clr	_mode_mirror
4076                     ; 1051 	mode_factory = 0;
4078  0bf7 725f0010      	clr	_mode_factory
4079                     ; 1052 	mode_hotwater = 0;
4081  0bfb 725f000e      	clr	_mode_hotwater
4082                     ; 1053 	mode_reset = 0;
4084  0bff 725f000d      	clr	_mode_reset
4085                     ; 1055 	switch(com1) {
4087  0c03 9e            	ld	a,xh
4089                     ; 1067 			break;
4090  0c04 4a            	dec	a
4091  0c05 270d          	jreq	L7431
4092  0c07 4a            	dec	a
4093  0c08 2711          	jreq	L1531
4094  0c0a a002          	sub	a,#2
4095  0c0c 2714          	jreq	L3531
4096  0c0e a004          	sub	a,#4
4097  0c10 2717          	jreq	L5531
4098  0c12 201a          	jra	L7731
4099  0c14               L7431:
4100                     ; 1056 		case COMMAND_MODE_MIRROR:
4100                     ; 1057 			mode_mirror = com2;
4102  0c14 7b02          	ld	a,(OFST+2,sp)
4103  0c16 c70011        	ld	_mode_mirror,a
4104                     ; 1058 			break;
4106  0c19 2013          	jra	L7731
4107  0c1b               L1531:
4108                     ; 1059 		case COMMAND_MODE_HOTWATER:
4108                     ; 1060 			mode_hotwater = com2;
4110  0c1b 7b02          	ld	a,(OFST+2,sp)
4111  0c1d c7000e        	ld	_mode_hotwater,a
4112                     ; 1061 			break;
4114  0c20 200c          	jra	L7731
4115  0c22               L3531:
4116                     ; 1062 		case COMMAND_MODE_RESET:
4116                     ; 1063 			mode_reset = com2;
4118  0c22 7b02          	ld	a,(OFST+2,sp)
4119  0c24 c7000d        	ld	_mode_reset,a
4120                     ; 1064 			break;
4122  0c27 2005          	jra	L7731
4123  0c29               L5531:
4124                     ; 1065 		case COMMAND_MODE_FACTORY:
4124                     ; 1066 			mode_factory = com2;
4126  0c29 7b02          	ld	a,(OFST+2,sp)
4127  0c2b c70010        	ld	_mode_factory,a
4128                     ; 1067 			break;
4130  0c2e               L7731:
4131                     ; 1069 }
4134  0c2e 85            	popw	x
4135  0c2f 81            	ret	
4168                     ; 1071 void func_rc_recover(uint8_t com) {
4169                     	switch	.text
4170  0c30               _func_rc_recover:
4174                     ; 1072 	mode_recover = com;
4176  0c30 c7000f        	ld	_mode_recover,a
4177                     ; 1073 }
4180  0c33 81            	ret	
4204                     ; 1075 void func_rc_setting(void) {
4205                     	switch	.text
4206  0c34               _func_rc_setting:
4210                     ; 1076 	setSettingChange(1);
4212  0c34 a601          	ld	a,#1
4214                     ; 1077 }
4217  0c36 cc05ff        	jp	_setSettingChange
4220                     	switch	.data
4221  0005               ___func_rc_settingCb:
4222  0005 00            	dc.b	0
4253                     ; 1081 void func_rc_settingCb(uint8_t ch) {
4254                     	switch	.text
4255  0c39               _func_rc_settingCb:
4259                     ; 1082 	__func_rc_settingCb = ch;
4261  0c39 c70005        	ld	___func_rc_settingCb,a
4262                     ; 1083 }
4265  0c3c 81            	ret	
4564                     	xdef	___func_rc_settingCb
4565                     	xdef	_rc_ptc_make_command_packet
4566                     	xdef	_rc_ptc_make_command
4567                     	xdef	_rc_ptc_make_error
4568                     	xdef	_rc_ptc_check_subRC
4569                     	xdef	_dr_out_count
4570                     	xdef	_rc_ptc_make_baseSetting
4571                     	xdef	_makeChecksum
4572                     	xdef	_rc_ptc_check_mirror
4573                     	xdef	_rc_ptc_check_subrc
4574                     	xdef	_rc_ptc_check_rc
4575                     	xdef	_rc_ptc_check_setting
4576                     	xdef	_rc_ptc_check_normal
4577                     	xdef	_rc_ptc_check_homenet
4578                     	xdef	_rc_ptc_check_master
4579                     	xdef	_only_one
4580                     	xdef	_dr_mode_out
4581                     	switch	.bss
4582  0000               _cur_src:
4583  0000 00            	ds.b	1
4584                     	xdef	_cur_src
4585  0001               _ret_count:
4586  0001 00            	ds.b	1
4587                     	xdef	_ret_count
4588  0002               _disp_mode_preview:
4589  0002 00            	ds.b	1
4590                     	xdef	_disp_mode_preview
4591  0003               __rcLED:
4592  0003 00            	ds.b	1
4593                     	xdef	__rcLED
4594  0004               _test_count:
4595  0004 00            	ds.b	1
4596                     	xdef	_test_count
4597  0005               _packet_changed:
4598  0005 00            	ds.b	1
4599                     	xdef	_packet_changed
4600  0006               _cur_mirror_page:
4601  0006 00            	ds.b	1
4602                     	xdef	_cur_mirror_page
4603  0007               _cur_set_page:
4604  0007 00            	ds.b	1
4605                     	xdef	_cur_set_page
4606  0008               __version:
4607  0008 00            	ds.b	1
4608                     	xdef	__version
4609  0009               _error_type:
4610  0009 00            	ds.b	1
4611                     	xdef	_error_type
4612  000a               _error:
4613  000a 00            	ds.b	1
4614                     	xdef	_error
4615                     	xdef	_debug_br
4616                     	xdef	_debug_hn
4617  000b               _state_check:
4618  000b 00            	ds.b	1
4619                     	xdef	_state_check
4620                     	xref	__backup_backlight
4621                     	xref	_packet_buf
4622                     	xref	__boiler_fire
4623                     	xref	__boiler_type
4624                     	xref	__timFlag
4625                     	xref	__remote
4626                     	xref	__boiler_water_heat
4627                     	xref	__boiler_water_shower
4628                     	xref	___boiler_shower
4629                     	xref	__updateCount
4630                     	xref	__updateBit
4631                     	xref	__updateTimer
4632                     	xref	__disp_mode2
4633                     	xref	_lcd_disp_rid
4634                     	xref	_uiInfo
4635                     	xdef	_func_rc_settingCb
4636                     	xdef	_func_rc_setting
4637                     	xdef	_func_rc_recover
4638                     	xdef	_func_rc_command
4639                     	xdef	_rc_ptc_make_mirror
4640                     	xdef	_rc_ptc_make
4641                     	xdef	_rc_ptc_make_subRC
4642                     	xdef	_rc_ptc_make_setting
4643                     	xdef	_rc_ptc_make_normal
4644                     	xdef	_setState_check
4645                     	xdef	_getState_check
4646                     	xdef	_getSettingChange
4647                     	xdef	_setSettingChange
4648                     	xdef	_rc_ptc_check
4649                     	xdef	_rc_ptc_baseSet
4650                     	xdef	_getHexToBin
4651  000c               _set_changed:
4652  000c 00            	ds.b	1
4653                     	xdef	_set_changed
4654  000d               _mode_reset:
4655  000d 00            	ds.b	1
4656                     	xdef	_mode_reset
4657  000e               _mode_hotwater:
4658  000e 00            	ds.b	1
4659                     	xdef	_mode_hotwater
4660  000f               _mode_recover:
4661  000f 00            	ds.b	1
4662                     	xdef	_mode_recover
4663  0010               _mode_factory:
4664  0010 00            	ds.b	1
4665                     	xdef	_mode_factory
4666  0011               _mode_mirror:
4667  0011 00            	ds.b	1
4668                     	xdef	_mode_mirror
4669  0012               _boiler_info:
4670  0012 000000        	ds.b	3
4671                     	xdef	_boiler_info
4672  0015               _rcSubDataInfo:
4673  0015 000000000000  	ds.b	48
4674                     	xdef	_rcSubDataInfo
4675                     	xref	_file_read
4676                     	xref	_disp_char
4677                     	xref	___timer1s
4697                     	end
