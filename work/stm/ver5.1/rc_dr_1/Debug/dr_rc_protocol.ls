   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  72                     ; 60 uint8_t getHexToBin(uint8_t hex, uint8_t idx)
  72                     ; 61 {
  74                     	switch	.text
  75  0000               _getHexToBin:
  77  0000 89            	pushw	x
  78  0001 88            	push	a
  79       00000001      OFST:	set	1
  82                     ; 62 	uint8_t p = 0x80;
  84                     ; 63 	p = p >> (0x08 - (idx + 0x01));
  86  0002 9f            	ld	a,xl
  87  0003 a007          	sub	a,#7
  88  0005 40            	neg	a
  89  0006 5f            	clrw	x
  90  0007 97            	ld	xl,a
  91  0008 a680          	ld	a,#128
  92  000a 5d            	tnzw	x
  93  000b 2704          	jreq	L6
  94  000d               L01:
  95  000d 44            	srl	a
  96  000e 5a            	decw	x
  97  000f 26fc          	jrne	L01
  98  0011               L6:
  99  0011 6b01          	ld	(OFST+0,sp),a
 100                     ; 65 	if (hex & p)
 102  0013 7b02          	ld	a,(OFST+1,sp)
 103  0015 1501          	bcp	a,(OFST+0,sp)
 104  0017 2704          	jreq	L13
 105                     ; 67 		return 1;
 107  0019 a601          	ld	a,#1
 109  001b 2001          	jra	L21
 110  001d               L13:
 111                     ; 71 		return 0;
 113  001d 4f            	clr	a
 115  001e               L21:
 117  001e 5b03          	addw	sp,#3
 118  0020 81            	ret	
 153                     ; 75 void rc_ptc_baseSet(void) {
 154                     	switch	.text
 155  0021               _rc_ptc_baseSet:
 157  0021 88            	push	a
 158       00000001      OFST:	set	1
 161                     ; 77 	state_check = RC_STATE_NORMAL;
 163  0022 3501000b      	mov	_state_check,#1
 164                     ; 78 	set_changed = 0;
 166  0026 725f000c      	clr	_set_changed
 167                     ; 80 	for (i = 0 ; i < 8 ; i++) {
 169  002a 4f            	clr	a
 170  002b 6b01          	ld	(OFST+0,sp),a
 171  002d               L15:
 172                     ; 81 		rcSubDataInfo.mode_heat[i] = 0xAA;
 174  002d 5f            	clrw	x
 175  002e 97            	ld	xl,a
 176  002f a6aa          	ld	a,#170
 177  0031 d70025        	ld	(_rcSubDataInfo+16,x),a
 178                     ; 82 		rcSubDataInfo.cur_temp[i] = 0xAA;
 180  0034 5f            	clrw	x
 181  0035 7b01          	ld	a,(OFST+0,sp)
 182  0037 97            	ld	xl,a
 183  0038 a6aa          	ld	a,#170
 184  003a d70015        	ld	(_rcSubDataInfo,x),a
 185                     ; 83 		rcSubDataInfo.set_temp[i] = 0xAA;
 187  003d 5f            	clrw	x
 188  003e 7b01          	ld	a,(OFST+0,sp)
 189  0040 97            	ld	xl,a
 190  0041 a6aa          	ld	a,#170
 191  0043 d7001d        	ld	(_rcSubDataInfo+8,x),a
 192                     ; 84 		rcSubDataInfo.time[i] = 0xAA;
 194  0046 5f            	clrw	x
 195  0047 7b01          	ld	a,(OFST+0,sp)
 196  0049 97            	ld	xl,a
 197  004a a6aa          	ld	a,#170
 198  004c d70035        	ld	(_rcSubDataInfo+32,x),a
 199                     ; 85 		rcSubDataInfo.banb[i] = 0xAA;
 201  004f 5f            	clrw	x
 202  0050 7b01          	ld	a,(OFST+0,sp)
 203  0052 97            	ld	xl,a
 204  0053 a6aa          	ld	a,#170
 205  0055 d7003d        	ld	(_rcSubDataInfo+40,x),a
 206                     ; 80 	for (i = 0 ; i < 8 ; i++) {
 208  0058 0c01          	inc	(OFST+0,sp)
 211  005a 7b01          	ld	a,(OFST+0,sp)
 212  005c a108          	cp	a,#8
 213  005e 25cd          	jrult	L15
 214                     ; 87 }
 217  0060 84            	pop	a
 218  0061 81            	ret	
 256                     ; 89 void rc_ptc_check_master(uint8_t *buf) {
 257                     	switch	.text
 258  0062               _rc_ptc_check_master:
 260  0062 89            	pushw	x
 261       00000000      OFST:	set	0
 264                     ; 90 	if (buf[1] != 0x00) {
 266  0063 e601          	ld	a,(1,x)
 267  0065 2618          	jrne	L02
 268                     ; 91 		return;
 270                     ; 98 	boiler_info.state = buf[4] & 0x03;
 272  0067 1e01          	ldw	x,(OFST+1,sp)
 273  0069 e604          	ld	a,(4,x)
 274  006b a403          	and	a,#3
 275  006d c70012        	ld	_boiler_info,a
 276                     ; 99 	boiler_info.hotwater = buf[2];
 278  0070 e602          	ld	a,(2,x)
 279  0072 c70013        	ld	_boiler_info+1,a
 280                     ; 100 	boiler_info.heatwater = buf[3];
 282  0075 e603          	ld	a,(3,x)
 283  0077 c70014        	ld	_boiler_info+2,a
 284                     ; 102 	_boiler_fire = boiler_info.state;
 286  007a 5500120000    	mov	__boiler_fire,_boiler_info
 287                     ; 103 }
 288  007f               L02:
 291  007f 85            	popw	x
 292  0080 81            	ret	
 340                     ; 106 void rc_ptc_check_homenet(uint8_t *buf) {
 341                     	switch	.text
 342  0081               _rc_ptc_check_homenet:
 344  0081 89            	pushw	x
 345  0082 88            	push	a
 346       00000001      OFST:	set	1
 349                     ; 109 	if (getHexToBin(buf[6], 7) == 0) {
 351  0083 1602          	ldw	y,(OFST+1,sp)
 352  0085 ae0007        	ldw	x,#7
 353  0088 90e606        	ld	a,(6,y)
 354  008b 95            	ld	xh,a
 355  008c cd0000        	call	_getHexToBin
 357  008f 4d            	tnz	a
 358  0090 270d          	jreq	L62
 359                     ; 110 		return;
 361                     ; 113 	id = buf[1] & 0x0F;
 363  0092 1e02          	ldw	x,(OFST+1,sp)
 364  0094 e601          	ld	a,(1,x)
 365  0096 a40f          	and	a,#15
 366  0098 6b01          	ld	(OFST+0,sp),a
 367                     ; 115 	if (id != uiInfo.id) {
 369  009a c10004        	cp	a,_uiInfo+4
 370  009d 2703          	jreq	L121
 371                     ; 116 		return;
 372  009f               L62:
 375  009f 5b03          	addw	sp,#3
 376  00a1 81            	ret	
 377  00a2               L121:
 378                     ; 119 	packet_changed = 1;
 380  00a2 35010005      	mov	_packet_changed,#1
 381                     ; 121 	if (_remote == 0) {
 383  00a6 c60000        	ld	a,__remote
 384  00a9 26f4          	jrne	L62
 385                     ; 122 		_disp_mode2 = buf[2];
 387  00ab e602          	ld	a,(2,x)
 388  00ad c70000        	ld	__disp_mode2,a
 389                     ; 124 		if (buf[2] == RC_MODE_HEAT) {
 391  00b0 4a            	dec	a
 392  00b1 26ec          	jrne	L62
 393                     ; 125 			if (buf[3] != 0xFF) {
 395  00b3 e603          	ld	a,(3,x)
 396  00b5 a1ff          	cp	a,#255
 397  00b7 27e6          	jreq	L62
 398                     ; 126 				uiInfo.tSetup = buf[3];
 400  00b9 c7000e        	ld	_uiInfo+14,a
 401                     ; 130 }
 403  00bc 20e1          	jra	L62
 460                     ; 133 void rc_ptc_check_normal(uint8_t *buf) {
 461                     	switch	.text
 462  00be               _rc_ptc_check_normal:
 464  00be 89            	pushw	x
 465  00bf 88            	push	a
 466       00000001      OFST:	set	1
 469                     ; 134 	uint8_t start = buf[0] & 0x0F;
 471  00c0 f6            	ld	a,(x)
 472  00c1 a40f          	and	a,#15
 473  00c3 6b01          	ld	(OFST+0,sp),a
 474                     ; 136 	if (start == 0x0F) {
 476  00c5 a10f          	cp	a,#15
 477  00c7 2607          	jrne	L151
 478                     ; 137 		state_check = RC_STATE_FACTORY;
 480  00c9 3505000b      	mov	_state_check,#5
 481                     ; 138 		return;
 483  00cd cc017b        	jra	L771
 484  00d0               L151:
 485                     ; 141 	if (start == uiInfo.id) {
 487  00d0 c10004        	cp	a,_uiInfo+4
 488  00d3 260d          	jrne	L351
 489                     ; 142 		packet_buf[start - 1] = 0;
 491  00d5 5f            	clrw	x
 492  00d6 97            	ld	xl,a
 493  00d7 5a            	decw	x
 494                     ; 143 		state_check = RC_STATE_NORMAL;
 496  00d8 3501000b      	mov	_state_check,#1
 497  00dc 724f0000      	clr	(_packet_buf,x)
 499  00e0 2004          	jra	L551
 500  00e2               L351:
 501                     ; 145 		state_check = RC_STATE_NONE;
 503  00e2 725f000b      	clr	_state_check
 504  00e6               L551:
 505                     ; 148 	if (uiInfo.mode == SETTING_MODE_MASTER) {
 507  00e6 c60008        	ld	a,_uiInfo+8
 508  00e9 4a            	dec	a
 509  00ea 2605          	jrne	L751
 510                     ; 149 		rc_ptc_check_master(buf);
 512  00ec 1e02          	ldw	x,(OFST+1,sp)
 513  00ee cd0062        	call	_rc_ptc_check_master
 515  00f1               L751:
 516                     ; 152 	if ( _remote == 0 && _backup_backlight == 0) {
 518  00f1 c60000        	ld	a,__remote
 519  00f4 2646          	jrne	L161
 521  00f6 c60000        	ld	a,__backup_backlight
 522  00f9 2641          	jrne	L161
 523                     ; 153 		if (getHexToBin(buf[6], 7) == 0) {
 525  00fb 1602          	ldw	y,(OFST+1,sp)
 526  00fd ae0007        	ldw	x,#7
 527  0100 90e606        	ld	a,(6,y)
 528  0103 95            	ld	xh,a
 529  0104 cd0000        	call	_getHexToBin
 531  0107 4d            	tnz	a
 532  0108 2632          	jrne	L161
 533                     ; 154 			_rcLED = buf[1];
 535  010a 1e02          	ldw	x,(OFST+1,sp)
 536  010c e601          	ld	a,(1,x)
 537  010e c70003        	ld	__rcLED,a
 538                     ; 156 			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
 540  0111 c60004        	ld	a,_uiInfo+4
 541  0114 4a            	dec	a
 542  0115 1602          	ldw	y,(OFST+1,sp)
 543  0117 97            	ld	xl,a
 544  0118 90e601        	ld	a,(1,y)
 545  011b 95            	ld	xh,a
 546  011c cd0000        	call	_getHexToBin
 548  011f 4a            	dec	a
 549  0120 260b          	jrne	L561
 550                     ; 157 				D_IO_LOW(D_LED_PORT, D_LED_PIN);
 552  0122 7211500a      	bres	20490,#0
 553                     ; 158 				lcd_disp_rid(uiInfo.id, 1, 0);
 555  0126 4b00          	push	#0
 556  0128 ae0001        	ldw	x,#1
 559  012b 2007          	jp	LC001
 560  012d               L561:
 561                     ; 160 				D_IO_HIGH(D_LED_PORT, D_LED_PIN);
 563  012d 7210500a      	bset	20490,#0
 564                     ; 161 				lcd_disp_rid(uiInfo.id, 0, 0);
 566  0131 4b00          	push	#0
 567  0133 5f            	clrw	x
 569  0134               LC001:
 570  0134 c60004        	ld	a,_uiInfo+4
 571  0137 95            	ld	xh,a
 572  0138 cd0000        	call	_lcd_disp_rid
 573  013b 84            	pop	a
 574  013c               L161:
 575                     ; 166 	rc_ptc_check_homenet(buf);
 577  013c 1e02          	ldw	x,(OFST+1,sp)
 578  013e cd0081        	call	_rc_ptc_check_homenet
 580                     ; 168 	_version = buf[6] >> 1;
 582  0141 1e02          	ldw	x,(OFST+1,sp)
 583  0143 e606          	ld	a,(6,x)
 584  0145 44            	srl	a
 585  0146 c70008        	ld	__version,a
 586                     ; 170 	if (mode_recover == 0) {
 588  0149 c6000f        	ld	a,_mode_recover
 589  014c 2615          	jrne	L171
 590                     ; 171 		error_type = buf[4] >> 2;
 592  014e e604          	ld	a,(4,x)
 593  0150 44            	srl	a
 594  0151 44            	srl	a
 595  0152 c70009        	ld	_error_type,a
 596                     ; 173 		if (error_type != 0) {
 598  0155 2707          	jreq	L371
 599                     ; 174 			error = buf[5];
 601  0157 e605          	ld	a,(5,x)
 602  0159 c7000a        	ld	_error,a
 604  015c 201d          	jra	L771
 605  015e               L371:
 606                     ; 176 			error = 0;
 608  015e c7000a        	ld	_error,a
 609  0161 2018          	jra	L771
 610  0163               L171:
 611                     ; 179 		if ((buf[4] >> 2) == 0 && buf[5] == 0) {
 613  0163 e604          	ld	a,(4,x)
 614  0165 44            	srl	a
 615  0166 44            	srl	a
 616  0167 5f            	clrw	x
 617  0168 97            	ld	xl,a
 618  0169 5d            	tnzw	x
 619  016a 260f          	jrne	L771
 621  016c 1e02          	ldw	x,(OFST+1,sp)
 622  016e e605          	ld	a,(5,x)
 623  0170 2609          	jrne	L771
 624                     ; 180 			error_type = 0;
 626  0172 c70009        	ld	_error_type,a
 627                     ; 181 			error = 0;
 629  0175 c7000a        	ld	_error,a
 630                     ; 182 			mode_recover = 0;
 632  0178 c7000f        	ld	_mode_recover,a
 633  017b               L771:
 634                     ; 189 }
 637  017b 5b03          	addw	sp,#3
 638  017d 81            	ret	
 686                     ; 192 void rc_ptc_check_setting(uint8_t *buf) {
 687                     	switch	.text
 688  017e               _rc_ptc_check_setting:
 690  017e 88            	push	a
 691       00000001      OFST:	set	1
 694                     ; 193 	uint8_t page = buf[0] & 0x0F;
 696  017f f6            	ld	a,(x)
 697  0180 a40f          	and	a,#15
 698  0182 6b01          	ld	(OFST+0,sp),a
 699                     ; 195 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 701  0184 c60008        	ld	a,_uiInfo+8
 702  0187 4a            	dec	a
 703  0188 2702          	jreq	L322
 704                     ; 196 		return;
 707  018a 84            	pop	a
 708  018b 81            	ret	
 709  018c               L322:
 710                     ; 199 	state_check = RC_STATE_SETTING;
 712  018c 3502000b      	mov	_state_check,#2
 713                     ; 201 	if (cur_set_page == page) {
 715  0190 c60007        	ld	a,_cur_set_page
 716  0193 1101          	cp	a,(OFST+0,sp)
 717  0195 2607          	jrne	L522
 718                     ; 202 		cur_set_page++;
 720  0197 725c0007      	inc	_cur_set_page
 721  019b c60007        	ld	a,_cur_set_page
 722  019e               L522:
 723                     ; 205 	if (cur_set_page == MAX_SETTING_PAGE) {
 725  019e a103          	cp	a,#3
 726  01a0 2613          	jrne	L722
 727                     ; 206 		set_changed = 0;
 729  01a2 725f000c      	clr	_set_changed
 730                     ; 207 		cur_set_page = 0;
 732  01a6 725f0007      	clr	_cur_set_page
 733                     ; 209 		func_rc_settingCb(1);
 735  01aa a601          	ld	a,#1
 736  01ac cd0000        	call	_func_rc_settingCb
 738                     ; 210 		state_check = RC_STATE_NORMAL;
 740  01af 3501000b      	mov	_state_check,#1
 742  01b3 2004          	jra	L132
 743  01b5               L722:
 744                     ; 212 		func_rc_settingCb(0);
 746  01b5 4f            	clr	a
 747  01b6 cd0000        	call	_func_rc_settingCb
 749  01b9               L132:
 750                     ; 214 }
 753  01b9 84            	pop	a
 754  01ba 81            	ret	
 811                     ; 217 void rc_ptc_check_rc(uint8_t *buf) {
 812                     	switch	.text
 813  01bb               _rc_ptc_check_rc:
 815  01bb 89            	pushw	x
 816  01bc 89            	pushw	x
 817       00000002      OFST:	set	2
 820                     ; 221 	st = (buf[0] & 0x0F) - 1;
 822  01bd f6            	ld	a,(x)
 823  01be a40f          	and	a,#15
 824  01c0 4a            	dec	a
 825  01c1 6b02          	ld	(OFST+0,sp),a
 826                     ; 223 	if (uiInfo.mode != SETTING_MODE_MASTER) {
 828  01c3 c60008        	ld	a,_uiInfo+8
 829  01c6 4a            	dec	a
 830  01c7 272e          	jreq	L103
 831                     ; 224 		if (st == 0) {
 833  01c9 7b02          	ld	a,(OFST+0,sp)
 834  01cb 2703cc025a    	jrne	L46
 835                     ; 225 			if (buf[1] == RC_MODE_OUT) {
 837  01d0 e601          	ld	a,(1,x)
 838  01d2 a102          	cp	a,#2
 839  01d4 2604          	jrne	L503
 840                     ; 226 				_disp_mode2 = RC_MODE_OUT;
 842  01d6 35020000      	mov	__disp_mode2,#2
 843  01da               L503:
 844                     ; 229 			if (buf[1] != RC_MODE_OUT && _disp_mode2 == RC_MODE_OUT) {
 846  01da 1e03          	ldw	x,(OFST+1,sp)
 847  01dc e601          	ld	a,(1,x)
 848  01de a102          	cp	a,#2
 849  01e0 2778          	jreq	L46
 851  01e2 c60000        	ld	a,__disp_mode2
 852  01e5 a102          	cp	a,#2
 853  01e7 2671          	jrne	L46
 854                     ; 230 				packet_changed = 1;
 856  01e9 35010005      	mov	_packet_changed,#1
 857                     ; 231 				_disp_mode2 = FW_GET_DISPMODE;
 859  01ed a629          	ld	a,#41
 860  01ef cd0000        	call	_file_read
 862  01f2 c70000        	ld	__disp_mode2,a
 863                     ; 234 		return;
 865  01f5 2063          	jra	L46
 866  01f7               L103:
 867                     ; 237 	k = 0;
 869  01f7 6b01          	ld	(OFST-1,sp),a
 870                     ; 239 	packet_buf[st] = 0;
 872  01f9 5f            	clrw	x
 873  01fa 7b02          	ld	a,(OFST+0,sp)
 874  01fc 97            	ld	xl,a
 875  01fd 724f0000      	clr	(_packet_buf,x)
 876                     ; 241 	if (_remote == 0) {
 878  0201 725d0000      	tnz	__remote
 879  0205 2703cc02e5    	jrne	L113
 880                     ; 242 		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
 882  020a 5f            	clrw	x
 883  020b 97            	ld	xl,a
 884  020c d60025        	ld	a,(_rcSubDataInfo+16,x)
 885  020f 4c            	inc	a
 886  0210 264b          	jrne	L313
 887                     ; 243 			if (uiInfo.remote_mode[st] != buf[1]) {
 889  0212 7b02          	ld	a,(OFST+0,sp)
 890  0214 5f            	clrw	x
 891  0215 97            	ld	xl,a
 892  0216 d60045        	ld	a,(_uiInfo+69,x)
 893  0219 1e03          	ldw	x,(OFST+1,sp)
 894  021b e101          	cp	a,(1,x)
 895                     ; 244 				k = 1;
 897  021d 2632          	jrne	LC002
 898                     ; 247 				switch (buf[1]) {
 900  021f e601          	ld	a,(1,x)
 902                     ; 266 						break;
 903  0221 4a            	dec	a
 904  0222 270a          	jreq	L332
 905  0224 a007          	sub	a,#7
 906  0226 2713          	jreq	L142
 907  0228 a008          	sub	a,#8
 908  022a 2718          	jreq	L342
 909  022c 2027          	jra	L713
 910  022e               L332:
 911                     ; 248 					case RC_MODE_HEAT:
 911                     ; 249 						if (uiInfo.tempSetup[st] != buf[3]) {
 913  022e 7b02          	ld	a,(OFST+0,sp)
 914  0230 5f            	clrw	x
 915  0231 97            	ld	xl,a
 916  0232 d6003d        	ld	a,(_uiInfo+61,x)
 917  0235 1e03          	ldw	x,(OFST+1,sp)
 918  0237 e103          	cp	a,(3,x)
 919                     ; 250 							k = 1;
 920  0239 2014          	jp	LC003
 921                     ; 253 					case RC_MODE_OUT:
 921                     ; 254 						break;
 923                     ; 255 					case RC_MODE_STOP:
 923                     ; 256 						break;
 925  023b               L142:
 926                     ; 257 					case RC_MODE_RESERVE:
 926                     ; 258 						if (uiInfo.remote_time[st] != buf[5]) {
 928  023b 7b02          	ld	a,(OFST+0,sp)
 929  023d 5f            	clrw	x
 930  023e 97            	ld	xl,a
 931  023f d6004d        	ld	a,(_uiInfo+77,x)
 932                     ; 259 							k = 1;
 933  0242 2007          	jp	LC004
 934  0244               L342:
 935                     ; 262 					case RC_MODE_REPEAT:
 935                     ; 263 						if (uiInfo.remote_banb[st] != buf[5]) {
 937  0244 7b02          	ld	a,(OFST+0,sp)
 938  0246 5f            	clrw	x
 939  0247 97            	ld	xl,a
 940  0248 d60055        	ld	a,(_uiInfo+85,x)
 941  024b               LC004:
 942  024b 1e03          	ldw	x,(OFST+1,sp)
 943  024d e105          	cp	a,(5,x)
 944  024f               LC003:
 945  024f 2704          	jreq	L713
 946                     ; 264 							k = 1;
 948  0251               LC002:
 952  0251 a601          	ld	a,#1
 953  0253 6b01          	ld	(OFST-1,sp),a
 954  0255               L713:
 955                     ; 270 			if (k == 1) {
 957  0255 7b01          	ld	a,(OFST-1,sp)
 958  0257 4a            	dec	a
 959  0258 2603          	jrne	L313
 960                     ; 271 				return;
 961  025a               L46:
 964  025a 5b04          	addw	sp,#4
 965  025c 81            	ret	
 966  025d               L313:
 967                     ; 275 		rcSubDataInfo.mode_heat[st] = buf[1];
 969  025d 7b02          	ld	a,(OFST+0,sp)
 970  025f 5f            	clrw	x
 971  0260 1603          	ldw	y,(OFST+1,sp)
 972  0262 97            	ld	xl,a
 973  0263 90e601        	ld	a,(1,y)
 974  0266 d70025        	ld	(_rcSubDataInfo+16,x),a
 975                     ; 276 		rcSubDataInfo.cur_temp[st] = buf[2];
 977  0269 5f            	clrw	x
 978  026a 7b02          	ld	a,(OFST+0,sp)
 979  026c 97            	ld	xl,a
 980  026d 90e602        	ld	a,(2,y)
 981  0270 d70015        	ld	(_rcSubDataInfo,x),a
 982                     ; 278 		uiInfo.remote_mode[st] = buf[1];
 984  0273 5f            	clrw	x
 985  0274 7b02          	ld	a,(OFST+0,sp)
 986  0276 97            	ld	xl,a
 987  0277 90e601        	ld	a,(1,y)
 988  027a d70045        	ld	(_uiInfo+69,x),a
 989                     ; 279 		uiInfo.tempCurr[st] = buf[2];
 991  027d 5f            	clrw	x
 992  027e 7b02          	ld	a,(OFST+0,sp)
 993  0280 97            	ld	xl,a
 994  0281 90e602        	ld	a,(2,y)
 995  0284 d70035        	ld	(_uiInfo+53,x),a
 996                     ; 281 		switch (buf[1]) {
 998  0287 1e03          	ldw	x,(OFST+1,sp)
 999  0289 e601          	ld	a,(1,x)
1001                     ; 297 				break;
1002  028b 4a            	dec	a
1003  028c 270a          	jreq	L542
1004  028e a007          	sub	a,#7
1005  0290 271c          	jreq	L352
1006  0292 a008          	sub	a,#8
1007  0294 272e          	jreq	L552
1008  0296 2040          	jra	L733
1009  0298               L542:
1010                     ; 282 			case RC_MODE_HEAT:
1010                     ; 283 				rcSubDataInfo.set_temp[st] = buf[3];
1012  0298 7b02          	ld	a,(OFST+0,sp)
1013  029a 5f            	clrw	x
1014  029b 97            	ld	xl,a
1015  029c 90e603        	ld	a,(3,y)
1016  029f d7001d        	ld	(_rcSubDataInfo+8,x),a
1017                     ; 284 				uiInfo.tempSetup[st] = buf[3];
1019  02a2 5f            	clrw	x
1020  02a3 7b02          	ld	a,(OFST+0,sp)
1021  02a5 97            	ld	xl,a
1022  02a6 90e603        	ld	a,(3,y)
1023  02a9 d7003d        	ld	(_uiInfo+61,x),a
1024                     ; 285 				break;
1026  02ac 202a          	jra	L733
1027                     ; 286 			case RC_MODE_OUT:
1027                     ; 287 				break;
1029                     ; 288 			case RC_MODE_STOP:
1029                     ; 289 				break;
1031  02ae               L352:
1032                     ; 290 			case RC_MODE_RESERVE:
1032                     ; 291 				rcSubDataInfo.time[st] = buf[5];
1034  02ae 7b02          	ld	a,(OFST+0,sp)
1035  02b0 5f            	clrw	x
1036  02b1 97            	ld	xl,a
1037  02b2 90e605        	ld	a,(5,y)
1038  02b5 d70035        	ld	(_rcSubDataInfo+32,x),a
1039                     ; 292 				uiInfo.remote_time[st] = buf[5];
1041  02b8 5f            	clrw	x
1042  02b9 7b02          	ld	a,(OFST+0,sp)
1043  02bb 97            	ld	xl,a
1044  02bc 90e605        	ld	a,(5,y)
1045  02bf d7004d        	ld	(_uiInfo+77,x),a
1046                     ; 293 				break;
1048  02c2 2014          	jra	L733
1049  02c4               L552:
1050                     ; 294 			case RC_MODE_REPEAT:
1050                     ; 295 				rcSubDataInfo.banb[st] = buf[5];
1052  02c4 7b02          	ld	a,(OFST+0,sp)
1053  02c6 5f            	clrw	x
1054  02c7 97            	ld	xl,a
1055  02c8 90e605        	ld	a,(5,y)
1056  02cb d7003d        	ld	(_rcSubDataInfo+40,x),a
1057                     ; 296 				uiInfo.remote_banb[st] = buf[5];
1059  02ce 5f            	clrw	x
1060  02cf 7b02          	ld	a,(OFST+0,sp)
1061  02d1 97            	ld	xl,a
1062  02d2 90e605        	ld	a,(5,y)
1063  02d5 d70055        	ld	(_uiInfo+85,x),a
1064                     ; 297 				break;
1066  02d8               L733:
1067                     ; 300 		disp_char(uiInfo.remote_mode[st]);
1069  02d8 7b02          	ld	a,(OFST+0,sp)
1070  02da 5f            	clrw	x
1071  02db 97            	ld	xl,a
1072  02dc d60045        	ld	a,(_uiInfo+69,x)
1073  02df cd0000        	call	_disp_char
1076  02e2 cc025a        	jra	L46
1077  02e5               L113:
1078                     ; 304 		rcSubDataInfo.mode_heat[st] = 0xFF;
1080  02e5 5f            	clrw	x
1081  02e6 97            	ld	xl,a
1082  02e7 a6ff          	ld	a,#255
1083  02e9 d70025        	ld	(_rcSubDataInfo+16,x),a
1084                     ; 305 		rcSubDataInfo.cur_temp[st] = buf[2];
1086  02ec 5f            	clrw	x
1087  02ed 7b02          	ld	a,(OFST+0,sp)
1088  02ef 1603          	ldw	y,(OFST+1,sp)
1089  02f1 97            	ld	xl,a
1090  02f2 90e602        	ld	a,(2,y)
1091  02f5 d70015        	ld	(_rcSubDataInfo,x),a
1092                     ; 306 		rcSubDataInfo.set_temp[st] = 0xFF;
1094  02f8 5f            	clrw	x
1095  02f9 7b02          	ld	a,(OFST+0,sp)
1096  02fb 97            	ld	xl,a
1097  02fc a6ff          	ld	a,#255
1098  02fe d7001d        	ld	(_rcSubDataInfo+8,x),a
1099                     ; 307 		rcSubDataInfo.time[st] = 0xFF;
1101  0301 5f            	clrw	x
1102  0302 7b02          	ld	a,(OFST+0,sp)
1103  0304 97            	ld	xl,a
1104  0305 a6ff          	ld	a,#255
1105  0307 d70035        	ld	(_rcSubDataInfo+32,x),a
1106                     ; 308 		rcSubDataInfo.banb[st] = 0xFF;
1108  030a 5f            	clrw	x
1109  030b 7b02          	ld	a,(OFST+0,sp)
1110  030d 97            	ld	xl,a
1111  030e a6ff          	ld	a,#255
1112  0310 d7003d        	ld	(_rcSubDataInfo+40,x),a
1113                     ; 310 }
1115  0313 cc025a        	jra	L46
1161                     ; 313 void rc_ptc_check_subrc(uint8_t *buf) {
1162                     	switch	.text
1163  0316               _rc_ptc_check_subrc:
1165  0316 89            	pushw	x
1166  0317 88            	push	a
1167       00000001      OFST:	set	1
1170                     ; 314 	uint8_t start = buf[0] & 0x0F;
1172  0318 f6            	ld	a,(x)
1173  0319 a40f          	and	a,#15
1174  031b 6b01          	ld	(OFST+0,sp),a
1175                     ; 316 	state_check = RC_STATE_NONE;
1177  031d 725f000b      	clr	_state_check
1178                     ; 318 	if (uiInfo.mode == SETTING_MODE_MASTER) {
1180  0321 c60008        	ld	a,_uiInfo+8
1181  0324 4a            	dec	a
1182  0325 2707          	jreq	L07
1183                     ; 319 		return;
1185                     ; 322 	if (start != uiInfo.id) {
1187  0327 7b01          	ld	a,(OFST+0,sp)
1188  0329 c10004        	cp	a,_uiInfo+4
1189  032c 2703          	jreq	L563
1190                     ; 323 		return;
1191  032e               L07:
1194  032e 5b03          	addw	sp,#3
1195  0330 81            	ret	
1196  0331               L563:
1197                     ; 326 	packet_changed = 1;	
1199  0331 35010005      	mov	_packet_changed,#1
1200                     ; 327 	_disp_mode2 = buf[1];
1202  0335 1e02          	ldw	x,(OFST+1,sp)
1203  0337 e601          	ld	a,(1,x)
1204  0339 c70000        	ld	__disp_mode2,a
1205                     ; 329 	if (_disp_mode2 == RC_MODE_HEAT) {
1207  033c a101          	cp	a,#1
1208  033e 2608          	jrne	L763
1209                     ; 330 		uiInfo.tSetup = buf[3];
1211  0340 e603          	ld	a,(3,x)
1212  0342 c7000e        	ld	_uiInfo+14,a
1213  0345 c60000        	ld	a,__disp_mode2
1214  0348               L763:
1215                     ; 333 	if (_disp_mode2 == RC_MODE_RESERVE) {
1217  0348 a108          	cp	a,#8
1218  034a 2607          	jrne	L173
1219                     ; 334 		uiInfo.reserve = buf[5];
1221  034c e605          	ld	a,(5,x)
1222  034e c7000d        	ld	_uiInfo+13,a
1224  0351 20db          	jra	L07
1225  0353               L173:
1226                     ; 335 	} else if (_disp_mode2 == RC_MODE_REPEAT){
1228  0353 a110          	cp	a,#16
1229  0355 26d7          	jrne	L07
1230                     ; 336 		uiInfo.repeat = buf[5];
1232  0357 e605          	ld	a,(5,x)
1233  0359 c7000c        	ld	_uiInfo+12,a
1234                     ; 338 }
1236  035c 20d0          	jra	L07
1292                     ; 340 void rc_ptc_check_mirror(uint8_t *buf) {
1293                     	switch	.text
1294  035e               _rc_ptc_check_mirror:
1296  035e 89            	pushw	x
1297       00000001      OFST:	set	1
1300                     ; 344 	state_check = RC_STATE_NONE;
1302  035f 725f000b      	clr	_state_check
1303  0363 88            	push	a
1304                     ; 346 	if (uiInfo.mode != SETTING_MODE_MASTER) {
1306  0364 c60008        	ld	a,_uiInfo+8
1307  0367 a101          	cp	a,#1
1308  0369 2703cc04cd    	jrne	L334
1309                     ; 347 		return;
1311                     ; 350 	page = buf[0] & 0x0F;
1313  036e 1e02          	ldw	x,(OFST+1,sp)
1314  0370 f6            	ld	a,(x)
1315  0371 a40f          	and	a,#15
1316  0373 6b01          	ld	(OFST+0,sp),a
1317                     ; 351 	cur_mirror_page = page;
1319  0375 c70006        	ld	_cur_mirror_page,a
1320                     ; 352 	state_check = RC_STATE_MIRROR;
1322  0378 3506000b      	mov	_state_check,#6
1323                     ; 354 	switch(page) {
1326                     ; 423 			break;
1327  037c 270f          	jreq	L773
1328  037e 4a            	dec	a
1329  037f 2603cc0405    	jreq	L104
1330  0384 4a            	dec	a
1331  0385 2603cc046d    	jreq	L304
1332  038a cc04cd        	jra	L334
1333  038d               L773:
1334                     ; 355 		case 0:
1334                     ; 356 			mode = (buf[6] & 0x80) >> 7;
1336  038d e606          	ld	a,(6,x)
1337  038f 49            	rlc	a
1338  0390 4f            	clr	a
1339  0391 49            	rlc	a
1340  0392 6b01          	ld	(OFST+0,sp),a
1341                     ; 357 			if (mode == CNT_MODE_MAIN) {
1343  0394 2656          	jrne	L534
1344                     ; 358 				_boiler_type = (buf[1] & 0x80) >> 7;
1346  0396 cd04dc        	call	LC007
1347  0399 c70000        	ld	__boiler_type,a
1348                     ; 359 				uiInfo.lpmType = (buf[1] & 0x0F);
1350  039c e601          	ld	a,(1,x)
1351  039e a40f          	and	a,#15
1352  03a0 c70013        	ld	_uiInfo+19,a
1353                     ; 360 				uiInfo.cnt = (buf[2] & 0xF0) >> 4;
1355  03a3 e602          	ld	a,(2,x)
1356  03a5 4e            	swap	a
1357  03a6 a40f          	and	a,#15
1358  03a8 c70005        	ld	_uiInfo+5,a
1359                     ; 361 				uiInfo.valve = buf[2] & 0x0F;
1361  03ab e602          	ld	a,(2,x)
1362  03ad a40f          	and	a,#15
1363  03af c7000a        	ld	_uiInfo+10,a
1364                     ; 362 				_boiler_water_shower = buf[3];
1366  03b2 e603          	ld	a,(3,x)
1367  03b4 c70000        	ld	__boiler_water_shower,a
1368                     ; 363 				uiInfo.houseCapa = buf[4];
1370  03b7 e604          	ld	a,(4,x)
1371  03b9 c70010        	ld	_uiInfo+16,a
1372                     ; 364 				_boiler_water_heat = buf[5] ;
1374  03bc e605          	ld	a,(5,x)
1375  03be c70000        	ld	__boiler_water_heat,a
1376                     ; 365 				uiInfo.controlMode = mode;
1378  03c1 7b01          	ld	a,(OFST+0,sp)
1379  03c3 c70009        	ld	_uiInfo+9,a
1380                     ; 366 				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
1382  03c6 e606          	ld	a,(6,x)
1383  03c8 4e            	swap	a
1384  03c9 a404          	and	a,#4
1385  03cb 44            	srl	a
1386  03cc 44            	srl	a
1387  03cd c7005d        	ld	_uiInfo+93,a
1388                     ; 367 				uiInfo.poType = (buf[6] & 0x30) >> 4;
1390  03d0 e606          	ld	a,(6,x)
1391  03d2 4e            	swap	a
1392  03d3 a403          	and	a,#3
1393  03d5 c7000f        	ld	_uiInfo+15,a
1394                     ; 368 				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
1396  03d8 e606          	ld	a,(6,x)
1397  03da a408          	and	a,#8
1398  03dc 44            	srl	a
1399  03dd 44            	srl	a
1400  03de 44            	srl	a
1401  03df c70003        	ld	_uiInfo+3,a
1402                     ; 369 				uiInfo.opMode = buf[6] & 0x07;
1404  03e2 e606          	ld	a,(6,x)
1405  03e4 a407          	and	a,#7
1406  03e6 c70007        	ld	_uiInfo+7,a
1408  03e9 cc04cd        	jra	L334
1409  03ec               L534:
1410                     ; 371 				uiInfo.lpmType_sub = (buf[1] & 0x0F);
1412  03ec e601          	ld	a,(1,x)
1413  03ee a40f          	and	a,#15
1414  03f0 c70014        	ld	_uiInfo+20,a
1415                     ; 372 				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
1417  03f3 e602          	ld	a,(2,x)
1418  03f5 4e            	swap	a
1419  03f6 a40f          	and	a,#15
1420  03f8 c70006        	ld	_uiInfo+6,a
1421                     ; 373 				uiInfo.valve_sub = buf[2] & 0x0F;
1423  03fb e602          	ld	a,(2,x)
1424  03fd a40f          	and	a,#15
1425  03ff c7000b        	ld	_uiInfo+11,a
1426  0402 cc04cd        	jra	L334
1427  0405               L104:
1428                     ; 376 		case 1:
1428                     ; 377 			mode = (buf[1] & 0x80) >> 7;
1430  0405 cd04dc        	call	LC007
1431  0408 6b01          	ld	(OFST+0,sp),a
1432                     ; 378 			if (mode == CNT_MODE_MAIN) {
1434  040a 2631          	jrne	L144
1435                     ; 379 				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
1437  040c cd04d0        	call	LC005
1438  040f c7001d        	ld	_uiInfo+29,a
1439                     ; 380 				uiInfo.valve_rc[1] = buf[1] & 0x07;
1441  0412 e601          	ld	a,(1,x)
1442  0414 a407          	and	a,#7
1443  0416 c7001e        	ld	_uiInfo+30,a
1444                     ; 381 				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
1446  0419 cd04d6        	call	LC006
1447  041c c7001f        	ld	_uiInfo+31,a
1448                     ; 382 				uiInfo.valve_rc[3] = buf[2] & 0x07;
1450  041f e602          	ld	a,(2,x)
1451  0421 a407          	and	a,#7
1452  0423 c70020        	ld	_uiInfo+32,a
1453                     ; 384 				uiInfo.valve_len[0] = buf[3];
1455  0426 e603          	ld	a,(3,x)
1456  0428 c70015        	ld	_uiInfo+21,a
1457                     ; 385 				uiInfo.valve_len[1] = buf[4];
1459  042b e604          	ld	a,(4,x)
1460  042d c70016        	ld	_uiInfo+22,a
1461                     ; 386 				uiInfo.valve_len[2] = buf[5];
1463  0430 e605          	ld	a,(5,x)
1464  0432 c70017        	ld	_uiInfo+23,a
1465                     ; 387 				uiInfo.valve_len[3] = buf[6];
1467  0435 e606          	ld	a,(6,x)
1468  0437 c70018        	ld	_uiInfo+24,a
1470  043a cc04cd        	jra	L334
1471  043d               L144:
1472                     ; 389 				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
1474  043d cd04d0        	call	LC005
1475  0440 c7002d        	ld	_uiInfo+45,a
1476                     ; 390 				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
1478  0443 e601          	ld	a,(1,x)
1479  0445 a407          	and	a,#7
1480  0447 c7002e        	ld	_uiInfo+46,a
1481                     ; 391 				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
1483  044a cd04d6        	call	LC006
1484  044d c7002f        	ld	_uiInfo+47,a
1485                     ; 392 				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
1487  0450 e602          	ld	a,(2,x)
1488  0452 a407          	and	a,#7
1489  0454 c70030        	ld	_uiInfo+48,a
1490                     ; 394 				uiInfo.valve_sub_len[0] = buf[3];
1492  0457 e603          	ld	a,(3,x)
1493  0459 c70025        	ld	_uiInfo+37,a
1494                     ; 395 				uiInfo.valve_sub_len[1] = buf[4];
1496  045c e604          	ld	a,(4,x)
1497  045e c70026        	ld	_uiInfo+38,a
1498                     ; 396 				uiInfo.valve_sub_len[2] = buf[5];
1500  0461 e605          	ld	a,(5,x)
1501  0463 c70027        	ld	_uiInfo+39,a
1502                     ; 397 				uiInfo.valve_sub_len[3] = buf[6];
1504  0466 e606          	ld	a,(6,x)
1505  0468 c70028        	ld	_uiInfo+40,a
1506  046b 2060          	jra	L334
1507  046d               L304:
1508                     ; 400 		case 2:
1508                     ; 401 			mode = (buf[1] & 0x80) >> 7;
1510  046d ad6d          	call	LC007
1511  046f 6b01          	ld	(OFST+0,sp),a
1512                     ; 402 			if (mode == CNT_MODE_MAIN) {
1514  0471 262e          	jrne	L544
1515                     ; 403 				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
1517  0473 ad5b          	call	LC005
1518  0475 c70021        	ld	_uiInfo+33,a
1519                     ; 404 				uiInfo.valve_rc[5] = buf[1] & 0x07;
1521  0478 e601          	ld	a,(1,x)
1522  047a a407          	and	a,#7
1523  047c c70022        	ld	_uiInfo+34,a
1524                     ; 405 				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
1526  047f ad55          	call	LC006
1527  0481 c70023        	ld	_uiInfo+35,a
1528                     ; 406 				uiInfo.valve_rc[7] = buf[2] & 0x07;
1530  0484 e602          	ld	a,(2,x)
1531  0486 a407          	and	a,#7
1532  0488 c70024        	ld	_uiInfo+36,a
1533                     ; 408 				uiInfo.valve_len[4] = buf[3];
1535  048b e603          	ld	a,(3,x)
1536  048d c70019        	ld	_uiInfo+25,a
1537                     ; 409 				uiInfo.valve_len[5] = buf[4];
1539  0490 e604          	ld	a,(4,x)
1540  0492 c7001a        	ld	_uiInfo+26,a
1541                     ; 410 				uiInfo.valve_len[6] = buf[5];
1543  0495 e605          	ld	a,(5,x)
1544  0497 c7001b        	ld	_uiInfo+27,a
1545                     ; 411 				uiInfo.valve_len[7] = buf[6];
1547  049a e606          	ld	a,(6,x)
1548  049c c7001c        	ld	_uiInfo+28,a
1550  049f 202c          	jra	L334
1551  04a1               L544:
1552                     ; 413 				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
1554  04a1 ad2d          	call	LC005
1555  04a3 c70031        	ld	_uiInfo+49,a
1556                     ; 414 				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
1558  04a6 e601          	ld	a,(1,x)
1559  04a8 a407          	and	a,#7
1560  04aa c70032        	ld	_uiInfo+50,a
1561                     ; 415 				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
1563  04ad ad27          	call	LC006
1564  04af c70033        	ld	_uiInfo+51,a
1565                     ; 416 				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
1567  04b2 e602          	ld	a,(2,x)
1568  04b4 a407          	and	a,#7
1569  04b6 c70034        	ld	_uiInfo+52,a
1570                     ; 418 				uiInfo.valve_sub_len[4] = buf[3];
1572  04b9 e603          	ld	a,(3,x)
1573  04bb c70029        	ld	_uiInfo+41,a
1574                     ; 419 				uiInfo.valve_sub_len[5] = buf[4];
1576  04be e604          	ld	a,(4,x)
1577  04c0 c7002a        	ld	_uiInfo+42,a
1578                     ; 420 				uiInfo.valve_sub_len[6] = buf[5];
1580  04c3 e605          	ld	a,(5,x)
1581  04c5 c7002b        	ld	_uiInfo+43,a
1582                     ; 421 				uiInfo.valve_sub_len[7] = buf[6];
1584  04c8 e606          	ld	a,(6,x)
1585  04ca c7002c        	ld	_uiInfo+44,a
1586  04cd               L334:
1587                     ; 425 }
1590  04cd 5b03          	addw	sp,#3
1591  04cf 81            	ret	
1592  04d0               LC005:
1593  04d0 e601          	ld	a,(1,x)
1594  04d2 4e            	swap	a
1595  04d3 a407          	and	a,#7
1596  04d5 81            	ret	
1597  04d6               LC006:
1598  04d6 e602          	ld	a,(2,x)
1599  04d8 4e            	swap	a
1600  04d9 a407          	and	a,#7
1601  04db 81            	ret	
1602  04dc               LC007:
1603  04dc e601          	ld	a,(1,x)
1604  04de 49            	rlc	a
1605  04df 4f            	clr	a
1606  04e0 49            	rlc	a
1607  04e1 81            	ret	
1656                     ; 427 void rc_ptc_check(uint8_t *buf) {
1657                     	switch	.text
1658  04e2               _rc_ptc_check:
1660  04e2 89            	pushw	x
1661  04e3 88            	push	a
1662       00000001      OFST:	set	1
1665                     ; 429 	start = buf[0] & 0xF0;
1667  04e4 f6            	ld	a,(x)
1668  04e5 a4f0          	and	a,#240
1669  04e7 6b01          	ld	(OFST+0,sp),a
1670                     ; 430 	switch(start) {
1673                     ; 450 			break;
1674  04e9 a020          	sub	a,#32
1675  04eb 2738          	jreq	L164
1676  04ed a010          	sub	a,#16
1677  04ef 271f          	jreq	L354
1678  04f1 a030          	sub	a,#48
1679  04f3 2729          	jreq	L754
1680  04f5 a010          	sub	a,#16
1681  04f7 2710          	jreq	L154
1682  04f9 a080          	sub	a,#128
1683  04fb 271a          	jreq	L554
1684                     ; 446 		default:
1684                     ; 447 			state_check = RC_STATE_ERROR;
1686  04fd 3504000b      	mov	_state_check,#4
1687                     ; 448 			disp_char(buf[0]);
1689  0501 1e02          	ldw	x,(OFST+1,sp)
1690  0503 f6            	ld	a,(x)
1691  0504 cd0000        	call	_disp_char
1693                     ; 450 			break;
1695  0507 2021          	jra	L705
1696  0509               L154:
1697                     ; 431 		case BYTE_START_CNT_NORMAL:
1697                     ; 432 			rc_ptc_check_normal(buf);
1699  0509 1e02          	ldw	x,(OFST+1,sp)
1700  050b cd00be        	call	_rc_ptc_check_normal
1702                     ; 433 			break;
1704  050e 201a          	jra	L705
1705  0510               L354:
1706                     ; 434 		case BYTE_START_CNT_SETTING:
1706                     ; 435 			rc_ptc_check_setting(buf);
1708  0510 1e02          	ldw	x,(OFST+1,sp)
1709  0512 cd017e        	call	_rc_ptc_check_setting
1711                     ; 436 			break;
1713  0515 2013          	jra	L705
1714  0517               L554:
1715                     ; 437 		case BYTE_START_RC_NORMAL:
1715                     ; 438 			rc_ptc_check_rc(buf);
1717  0517 1e02          	ldw	x,(OFST+1,sp)
1718  0519 cd01bb        	call	_rc_ptc_check_rc
1720                     ; 439 			break;
1722  051c 200c          	jra	L705
1723  051e               L754:
1724                     ; 440 		case BYTE_START_RC_SUBRC:
1724                     ; 441 			rc_ptc_check_subrc(buf);
1726  051e 1e02          	ldw	x,(OFST+1,sp)
1727  0520 cd0316        	call	_rc_ptc_check_subrc
1729                     ; 442 			break;
1731  0523 2005          	jra	L705
1732  0525               L164:
1733                     ; 443 		case BYTE_START_CNT_MIRROR:
1733                     ; 444 			rc_ptc_check_mirror(buf);
1735  0525 1e02          	ldw	x,(OFST+1,sp)
1736  0527 cd035e        	call	_rc_ptc_check_mirror
1738                     ; 445 			break;
1740  052a               L705:
1741                     ; 452 }
1744  052a 5b03          	addw	sp,#3
1745  052c 81            	ret	
1778                     ; 454 void setSettingChange(uint8_t ch) {
1779                     	switch	.text
1780  052d               _setSettingChange:
1784                     ; 455 	set_changed = ch;
1786  052d c7000c        	ld	_set_changed,a
1787                     ; 456 }
1790  0530 81            	ret	
1814                     ; 458 uint8_t getSettingChange(void) {
1815                     	switch	.text
1816  0531               _getSettingChange:
1820                     ; 459 	return set_changed;
1822  0531 c6000c        	ld	a,_set_changed
1825  0534 81            	ret	
1849                     ; 462 uint8_t getState_check(void) {
1850                     	switch	.text
1851  0535               _getState_check:
1855                     ; 463 	return state_check;
1857  0535 c6000b        	ld	a,_state_check
1860  0538 81            	ret	
1893                     ; 466 void setState_check(uint8_t st) {
1894                     	switch	.text
1895  0539               _setState_check:
1899                     ; 467 	state_check = st;
1901  0539 c7000b        	ld	_state_check,a
1902                     ; 468 }
1905  053c 81            	ret	
1962                     ; 470 void makeChecksum(uint8_t *buf) {
1963                     	switch	.text
1964  053d               _makeChecksum:
1966  053d 89            	pushw	x
1967  053e 89            	pushw	x
1968       00000002      OFST:	set	2
1971                     ; 475 	s = 0;
1973  053f 0f01          	clr	(OFST-1,sp)
1974                     ; 476 	for (i = 0 ; i < 7 ; i++) {
1976  0541 0f02          	clr	(OFST+0,sp)
1977  0543               L506:
1978                     ; 477 		s += buf[i];
1980  0543 7b03          	ld	a,(OFST+1,sp)
1981  0545 97            	ld	xl,a
1982  0546 7b04          	ld	a,(OFST+2,sp)
1983  0548 1b02          	add	a,(OFST+0,sp)
1984  054a 2401          	jrnc	L621
1985  054c 5c            	incw	x
1986  054d               L621:
1987  054d 02            	rlwa	x,a
1988  054e 7b01          	ld	a,(OFST-1,sp)
1989  0550 fb            	add	a,(x)
1990  0551 6b01          	ld	(OFST-1,sp),a
1991                     ; 476 	for (i = 0 ; i < 7 ; i++) {
1993  0553 0c02          	inc	(OFST+0,sp)
1996  0555 7b02          	ld	a,(OFST+0,sp)
1997  0557 a107          	cp	a,#7
1998  0559 25e8          	jrult	L506
1999                     ; 479 	buf[7] = s;
2001  055b 1e03          	ldw	x,(OFST+1,sp)
2002  055d 7b01          	ld	a,(OFST-1,sp)
2003  055f e707          	ld	(7,x),a
2004                     ; 481 	for( j=0; j<8; j++ )
2006  0561 0f02          	clr	(OFST+0,sp)
2007  0563               L316:
2008                     ; 482 		disp_char(buf[j]);
2010  0563 7b03          	ld	a,(OFST+1,sp)
2011  0565 97            	ld	xl,a
2012  0566 7b04          	ld	a,(OFST+2,sp)
2013  0568 1b02          	add	a,(OFST+0,sp)
2014  056a 2401          	jrnc	L231
2015  056c 5c            	incw	x
2016  056d               L231:
2017  056d 02            	rlwa	x,a
2018  056e f6            	ld	a,(x)
2019  056f cd0000        	call	_disp_char
2021                     ; 481 	for( j=0; j<8; j++ )
2023  0572 0c02          	inc	(OFST+0,sp)
2026  0574 7b02          	ld	a,(OFST+0,sp)
2027  0576 a108          	cp	a,#8
2028  0578 25e9          	jrult	L316
2029                     ; 485 }
2032  057a 5b04          	addw	sp,#4
2033  057c 81            	ret	
2087                     ; 487 void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
2088                     	switch	.text
2089  057d               _rc_ptc_make_baseSetting:
2091  057d 89            	pushw	x
2092  057e 5203          	subw	sp,#3
2093       00000003      OFST:	set	3
2096                     ; 488 	switch (page) {
2098  0580 7b08          	ld	a,(OFST+5,sp)
2100                     ; 578 		break;
2101  0582 270f          	jreq	L126
2102  0584 4a            	dec	a
2103  0585 2603cc061e    	jreq	L326
2104  058a 4a            	dec	a
2105  058b 2603cc06c4    	jreq	L526
2106  0590 cc0762        	jra	L356
2107  0593               L126:
2108                     ; 489 		case 0:
2108                     ; 490 			if (mode == CNT_MODE_MAIN) {
2110  0593 7b09          	ld	a,(OFST+6,sp)
2111  0595 2619          	jrne	L556
2112                     ; 491 				buf[1] = (_boiler_type << 7) 
2112                     ; 492 									| (uiInfo.lpmType);
2114  0597 c60000        	ld	a,__boiler_type
2115  059a cd0765        	call	LC010
2116  059d 1e04          	ldw	x,(OFST+1,sp)
2117  059f ca0013        	or	a,_uiInfo+19
2118  05a2 e701          	ld	(1,x),a
2119                     ; 493 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2119                     ; 494 									| ((uiInfo.cnt & 0x07) << 4) 
2119                     ; 495 									| (uiInfo.valve & 0x0F);
2121  05a4 c6000a        	ld	a,_uiInfo+10
2122  05a7 a40f          	and	a,#15
2123  05a9 6b03          	ld	(OFST+0,sp),a
2124  05ab c60005        	ld	a,_uiInfo+5
2125                     ; 496 				buf[3] = _boiler_water_shower;
2126                     ; 497 				buf[4] = uiInfo.houseCapa;
2127                     ; 498 				buf[5] = _boiler_water_heat;
2128                     ; 499 				buf[6] = 	(mode << 7) 
2128                     ; 500 									| (uiInfo.subRCLock << 6) 
2128                     ; 501 									| ((uiInfo.poType & 0x01) << 4) 
2128                     ; 502 									| ((uiInfo.cntlMode & 0x01) << 3) 
2128                     ; 503 									| uiInfo.opMode;
2130  05ae 2017          	jp	LC009
2131  05b0               L556:
2132                     ; 505 				buf[1] = (_boiler_type << 7) 
2132                     ; 506 									| (uiInfo.lpmType_sub);
2134  05b0 c60000        	ld	a,__boiler_type
2135  05b3 cd0765        	call	LC010
2136  05b6 1e04          	ldw	x,(OFST+1,sp)
2137  05b8 ca0014        	or	a,_uiInfo+20
2138  05bb e701          	ld	(1,x),a
2139                     ; 507 				buf[2] = ((uiInfo.relay & 0x01) << 7) 
2139                     ; 508 									| ((uiInfo.cnt_sub & 0x07) << 4) 
2139                     ; 509 									| (uiInfo.valve_sub & 0x0F);
2141  05bd c6000b        	ld	a,_uiInfo+11
2142  05c0 a40f          	and	a,#15
2143  05c2 6b03          	ld	(OFST+0,sp),a
2144  05c4 c60006        	ld	a,_uiInfo+6
2145                     ; 510 				buf[3] = _boiler_water_shower;
2147                     ; 511 				buf[4] = uiInfo.houseCapa;
2149                     ; 512 				buf[5] = _boiler_water_heat;
2151                     ; 513 				buf[6] = 	(mode << 7) 
2151                     ; 514 									| (uiInfo.subRCLock << 6) 
2151                     ; 515 									| ((uiInfo.poType & 0x01) << 4) 
2151                     ; 516 									| ((uiInfo.cntlMode & 0x01) << 3) 
2151                     ; 517 									| uiInfo.opMode;
2153  05c7               LC009:
2154  05c7 a407          	and	a,#7
2155  05c9 cd076b        	call	LC011
2156  05cc 6b02          	ld	(OFST-1,sp),a
2157  05ce c6005e        	ld	a,_uiInfo+94
2158  05d1 a401          	and	a,#1
2159  05d3 cd0765        	call	LC010
2160  05d6 1a02          	or	a,(OFST-1,sp)
2161  05d8 1e04          	ldw	x,(OFST+1,sp)
2162  05da 1a03          	or	a,(OFST+0,sp)
2163  05dc e702          	ld	(2,x),a
2165  05de c60000        	ld	a,__boiler_water_shower
2166  05e1 e703          	ld	(3,x),a
2168  05e3 c60010        	ld	a,_uiInfo+16
2169  05e6 e704          	ld	(4,x),a
2171  05e8 c60000        	ld	a,__boiler_water_heat
2172  05eb e705          	ld	(5,x),a
2174  05ed c60003        	ld	a,_uiInfo+3
2175  05f0 a401          	and	a,#1
2176  05f2 48            	sll	a
2177  05f3 48            	sll	a
2178  05f4 48            	sll	a
2179  05f5 6b03          	ld	(OFST+0,sp),a
2180  05f7 c6000f        	ld	a,_uiInfo+15
2181  05fa a401          	and	a,#1
2182  05fc cd076b        	call	LC011
2183  05ff 6b02          	ld	(OFST-1,sp),a
2184  0601 c6005d        	ld	a,_uiInfo+93
2185  0604 97            	ld	xl,a
2186  0605 a640          	ld	a,#64
2187  0607 42            	mul	x,a
2188  0608 9f            	ld	a,xl
2189  0609 6b01          	ld	(OFST-2,sp),a
2190  060b 7b09          	ld	a,(OFST+6,sp)
2191  060d cd0765        	call	LC010
2192  0610 1a01          	or	a,(OFST-2,sp)
2193  0612 1a02          	or	a,(OFST-1,sp)
2194  0614 1a03          	or	a,(OFST+0,sp)
2195  0616 ca0007        	or	a,_uiInfo+7
2196  0619 1e04          	ldw	x,(OFST+1,sp)
2197  061b cc0760        	jp	LC008
2198  061e               L326:
2199                     ; 520 		case 1:
2199                     ; 521 			if (mode == CNT_MODE_MAIN) {
2201  061e 7b09          	ld	a,(OFST+6,sp)
2202  0620 2651          	jrne	L166
2203                     ; 522 				buf[1] = mode << 7 
2203                     ; 523 							 | (uiInfo.valve_rc[0] << 4)
2203                     ; 524 							 | mode << 3 
2203                     ; 525 							 | uiInfo.valve_rc[1];
2205  0622 48            	sll	a
2206  0623 48            	sll	a
2207  0624 48            	sll	a
2208  0625 6b03          	ld	(OFST+0,sp),a
2209  0627 c6001d        	ld	a,_uiInfo+29
2210  062a cd076b        	call	LC011
2211  062d 6b02          	ld	(OFST-1,sp),a
2212  062f 7b09          	ld	a,(OFST+6,sp)
2213  0631 cd0765        	call	LC010
2214  0634 1a02          	or	a,(OFST-1,sp)
2215  0636 1a03          	or	a,(OFST+0,sp)
2216  0638 1e04          	ldw	x,(OFST+1,sp)
2217  063a ca001e        	or	a,_uiInfo+30
2218  063d e701          	ld	(1,x),a
2219                     ; 526 				buf[2] = mode << 7 
2219                     ; 527 							 | (uiInfo.valve_rc[2] << 4)
2219                     ; 528 							 | mode << 3 
2219                     ; 529 							 | uiInfo.valve_rc[3];
2221  063f 7b09          	ld	a,(OFST+6,sp)
2222  0641 48            	sll	a
2223  0642 48            	sll	a
2224  0643 48            	sll	a
2225  0644 6b03          	ld	(OFST+0,sp),a
2226  0646 c6001f        	ld	a,_uiInfo+31
2227  0649 cd076b        	call	LC011
2228  064c 6b02          	ld	(OFST-1,sp),a
2229  064e 7b09          	ld	a,(OFST+6,sp)
2230  0650 cd0765        	call	LC010
2231  0653 1a02          	or	a,(OFST-1,sp)
2232  0655 1a03          	or	a,(OFST+0,sp)
2233  0657 1e04          	ldw	x,(OFST+1,sp)
2234  0659 ca0020        	or	a,_uiInfo+32
2235  065c e702          	ld	(2,x),a
2236                     ; 530 				buf[3] = uiInfo.valve_len[0];
2238  065e c60015        	ld	a,_uiInfo+21
2239  0661 e703          	ld	(3,x),a
2240                     ; 531 				buf[4] = uiInfo.valve_len[1];
2242  0663 c60016        	ld	a,_uiInfo+22
2243  0666 e704          	ld	(4,x),a
2244                     ; 532 				buf[5] = uiInfo.valve_len[2];
2246  0668 c60017        	ld	a,_uiInfo+23
2247  066b e705          	ld	(5,x),a
2248                     ; 533 				buf[6] = uiInfo.valve_len[3];
2250  066d c60018        	ld	a,_uiInfo+24
2252  0670 cc0760        	jp	LC008
2253  0673               L166:
2254                     ; 535 				buf[1] = mode << 7 
2254                     ; 536 							 | (uiInfo.valve_sub_rc[0] << 4)
2254                     ; 537 							 | mode << 3 
2254                     ; 538 							 | uiInfo.valve_sub_rc[1];
2256  0673 48            	sll	a
2257  0674 48            	sll	a
2258  0675 48            	sll	a
2259  0676 6b03          	ld	(OFST+0,sp),a
2260  0678 c6002d        	ld	a,_uiInfo+45
2261  067b cd076b        	call	LC011
2262  067e 6b02          	ld	(OFST-1,sp),a
2263  0680 7b09          	ld	a,(OFST+6,sp)
2264  0682 cd0765        	call	LC010
2265  0685 1a02          	or	a,(OFST-1,sp)
2266  0687 1a03          	or	a,(OFST+0,sp)
2267  0689 1e04          	ldw	x,(OFST+1,sp)
2268  068b ca002e        	or	a,_uiInfo+46
2269  068e e701          	ld	(1,x),a
2270                     ; 539 				buf[2] = mode << 7 
2270                     ; 540 							 | (uiInfo.valve_sub_rc[2] << 4)
2270                     ; 541 							 | mode << 3 
2270                     ; 542 							 | uiInfo.valve_sub_rc[3];
2272  0690 7b09          	ld	a,(OFST+6,sp)
2273  0692 48            	sll	a
2274  0693 48            	sll	a
2275  0694 48            	sll	a
2276  0695 6b03          	ld	(OFST+0,sp),a
2277  0697 c6002f        	ld	a,_uiInfo+47
2278  069a cd076b        	call	LC011
2279  069d 6b02          	ld	(OFST-1,sp),a
2280  069f 7b09          	ld	a,(OFST+6,sp)
2281  06a1 cd0765        	call	LC010
2282  06a4 1a02          	or	a,(OFST-1,sp)
2283  06a6 1a03          	or	a,(OFST+0,sp)
2284  06a8 1e04          	ldw	x,(OFST+1,sp)
2285  06aa ca0030        	or	a,_uiInfo+48
2286  06ad e702          	ld	(2,x),a
2287                     ; 543 				buf[3] = uiInfo.valve_sub_len[0];
2289  06af c60025        	ld	a,_uiInfo+37
2290  06b2 e703          	ld	(3,x),a
2291                     ; 544 				buf[4] = uiInfo.valve_sub_len[1];
2293  06b4 c60026        	ld	a,_uiInfo+38
2294  06b7 e704          	ld	(4,x),a
2295                     ; 545 				buf[5] = uiInfo.valve_sub_len[2];
2297  06b9 c60027        	ld	a,_uiInfo+39
2298  06bc e705          	ld	(5,x),a
2299                     ; 546 				buf[6] = uiInfo.valve_sub_len[3];
2301  06be c60028        	ld	a,_uiInfo+40
2302  06c1 cc0760        	jp	LC008
2303  06c4               L526:
2304                     ; 549 		case 2:
2304                     ; 550 			if (mode == CNT_MODE_MAIN) {
2306  06c4 7b09          	ld	a,(OFST+6,sp)
2307  06c6 264e          	jrne	L566
2308                     ; 551 				buf[1] = mode << 7 
2308                     ; 552 							 | (uiInfo.valve_rc[4] << 4) 
2308                     ; 553 							 | mode << 3 
2308                     ; 554 							 | uiInfo.valve_rc[5];
2310  06c8 48            	sll	a
2311  06c9 48            	sll	a
2312  06ca 48            	sll	a
2313  06cb 6b03          	ld	(OFST+0,sp),a
2314  06cd c60021        	ld	a,_uiInfo+33
2315  06d0 cd076b        	call	LC011
2316  06d3 6b02          	ld	(OFST-1,sp),a
2317  06d5 7b09          	ld	a,(OFST+6,sp)
2318  06d7 cd0765        	call	LC010
2319  06da 1a02          	or	a,(OFST-1,sp)
2320  06dc 1a03          	or	a,(OFST+0,sp)
2321  06de 1e04          	ldw	x,(OFST+1,sp)
2322  06e0 ca0022        	or	a,_uiInfo+34
2323  06e3 e701          	ld	(1,x),a
2324                     ; 555 				buf[2] = mode << 7 
2324                     ; 556 							 | (uiInfo.valve_rc[6] << 4) 
2324                     ; 557 							 | mode << 3 
2324                     ; 558 							 | uiInfo.valve_rc[7];
2326  06e5 7b09          	ld	a,(OFST+6,sp)
2327  06e7 48            	sll	a
2328  06e8 48            	sll	a
2329  06e9 48            	sll	a
2330  06ea 6b03          	ld	(OFST+0,sp),a
2331  06ec c60023        	ld	a,_uiInfo+35
2332  06ef ad7a          	call	LC011
2333  06f1 6b02          	ld	(OFST-1,sp),a
2334  06f3 7b09          	ld	a,(OFST+6,sp)
2335  06f5 ad6e          	call	LC010
2336  06f7 1a02          	or	a,(OFST-1,sp)
2337  06f9 1a03          	or	a,(OFST+0,sp)
2338  06fb 1e04          	ldw	x,(OFST+1,sp)
2339  06fd ca0024        	or	a,_uiInfo+36
2340  0700 e702          	ld	(2,x),a
2341                     ; 559 				buf[3] = uiInfo.valve_len[4];
2343  0702 c60019        	ld	a,_uiInfo+25
2344  0705 e703          	ld	(3,x),a
2345                     ; 560 				buf[4] = uiInfo.valve_len[5];
2347  0707 c6001a        	ld	a,_uiInfo+26
2348  070a e704          	ld	(4,x),a
2349                     ; 561 				buf[5] = uiInfo.valve_len[6];
2351  070c c6001b        	ld	a,_uiInfo+27
2352  070f e705          	ld	(5,x),a
2353                     ; 562 				buf[6] = uiInfo.valve_len[7];
2355  0711 c6001c        	ld	a,_uiInfo+28
2357  0714 204a          	jp	LC008
2358  0716               L566:
2359                     ; 564 				buf[1] = mode << 7 
2359                     ; 565 							 | (uiInfo.valve_sub_rc[4] << 4) 
2359                     ; 566 							 | mode << 3 
2359                     ; 567 							 | uiInfo.valve_sub_rc[5];
2361  0716 48            	sll	a
2362  0717 48            	sll	a
2363  0718 48            	sll	a
2364  0719 6b03          	ld	(OFST+0,sp),a
2365  071b c60031        	ld	a,_uiInfo+49
2366  071e ad4b          	call	LC011
2367  0720 6b02          	ld	(OFST-1,sp),a
2368  0722 7b09          	ld	a,(OFST+6,sp)
2369  0724 ad3f          	call	LC010
2370  0726 1a02          	or	a,(OFST-1,sp)
2371  0728 1a03          	or	a,(OFST+0,sp)
2372  072a 1e04          	ldw	x,(OFST+1,sp)
2373  072c ca0032        	or	a,_uiInfo+50
2374  072f e701          	ld	(1,x),a
2375                     ; 568 				buf[2] = mode << 7 
2375                     ; 569 							 | (uiInfo.valve_sub_rc[6] << 4) 
2375                     ; 570 							 | mode << 3 
2375                     ; 571 							 | uiInfo.valve_sub_rc[7];
2377  0731 7b09          	ld	a,(OFST+6,sp)
2378  0733 48            	sll	a
2379  0734 48            	sll	a
2380  0735 48            	sll	a
2381  0736 6b03          	ld	(OFST+0,sp),a
2382  0738 c60033        	ld	a,_uiInfo+51
2383  073b ad2e          	call	LC011
2384  073d 6b02          	ld	(OFST-1,sp),a
2385  073f 7b09          	ld	a,(OFST+6,sp)
2386  0741 ad22          	call	LC010
2387  0743 1a02          	or	a,(OFST-1,sp)
2388  0745 1a03          	or	a,(OFST+0,sp)
2389  0747 1e04          	ldw	x,(OFST+1,sp)
2390  0749 ca0034        	or	a,_uiInfo+52
2391  074c e702          	ld	(2,x),a
2392                     ; 572 				buf[3] = uiInfo.valve_sub_len[4];
2394  074e c60029        	ld	a,_uiInfo+41
2395  0751 e703          	ld	(3,x),a
2396                     ; 573 				buf[4] = uiInfo.valve_sub_len[5];
2398  0753 c6002a        	ld	a,_uiInfo+42
2399  0756 e704          	ld	(4,x),a
2400                     ; 574 				buf[5] = uiInfo.valve_sub_len[6];
2402  0758 c6002b        	ld	a,_uiInfo+43
2403  075b e705          	ld	(5,x),a
2404                     ; 575 				buf[6] = uiInfo.valve_sub_len[7];
2406  075d c6002c        	ld	a,_uiInfo+44
2407  0760               LC008:
2408  0760 e706          	ld	(6,x),a
2409  0762               L356:
2410                     ; 580 }
2413  0762 5b05          	addw	sp,#5
2414  0764 81            	ret	
2415  0765               LC010:
2416  0765 97            	ld	xl,a
2417  0766 a680          	ld	a,#128
2418  0768 42            	mul	x,a
2419  0769 9f            	ld	a,xl
2420  076a 81            	ret	
2421  076b               LC011:
2422  076b 97            	ld	xl,a
2423  076c a610          	ld	a,#16
2424  076e 42            	mul	x,a
2425  076f 9f            	ld	a,xl
2426  0770 81            	ret	
2473                     ; 583 void rc_ptc_make_setting(uint8_t *buf) {
2474                     	switch	.text
2475  0771               _rc_ptc_make_setting:
2477  0771 89            	pushw	x
2478  0772 88            	push	a
2479       00000001      OFST:	set	1
2482                     ; 585 	uint8_t mode = uiInfo.controlMode;
2484  0773 c60009        	ld	a,_uiInfo+9
2485  0776 6b01          	ld	(OFST+0,sp),a
2486                     ; 587 	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
2488  0778 c60007        	ld	a,_cur_set_page
2489  077b 1e02          	ldw	x,(OFST+1,sp)
2490  077d aa50          	or	a,#80
2491  077f f7            	ld	(x),a
2492                     ; 589 	rc_ptc_make_baseSetting(buf, cur_set_page, mode);
2494  0780 7b01          	ld	a,(OFST+0,sp)
2495  0782 88            	push	a
2496  0783 3b0007        	push	_cur_set_page
2497  0786 1e04          	ldw	x,(OFST+3,sp)
2498  0788 cd057d        	call	_rc_ptc_make_baseSetting
2500  078b 85            	popw	x
2501                     ; 591 	makeChecksum(buf);
2503  078c 1e02          	ldw	x,(OFST+1,sp)
2504  078e cd053d        	call	_makeChecksum
2506                     ; 592 }
2509  0791 5b03          	addw	sp,#3
2510  0793 81            	ret	
2554                     ; 595 void rc_ptc_make_normal(uint8_t *buf) {
2555                     	switch	.text
2556  0794               _rc_ptc_make_normal:
2558  0794 89            	pushw	x
2559       00000000      OFST:	set	0
2562                     ; 596 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
2564  0795 c60004        	ld	a,_uiInfo+4
2565  0798 1e01          	ldw	x,(OFST+1,sp)
2566  079a aaf0          	or	a,#240
2567  079c f7            	ld	(x),a
2568                     ; 597 	buf[1] = _disp_mode2;
2570  079d c60000        	ld	a,__disp_mode2
2571  07a0 e701          	ld	(1,x),a
2572                     ; 598 	buf[2] = uiInfo.tCurr;
2574  07a2 c60002        	ld	a,_uiInfo+2
2575  07a5 e702          	ld	(2,x),a
2576                     ; 599 	buf[3] = 0x00;
2578  07a7 6f03          	clr	(3,x)
2579                     ; 600 	buf[4] = 0x00;
2581  07a9 6f04          	clr	(4,x)
2582                     ; 601 	buf[5] = 0x00;
2584  07ab 6f05          	clr	(5,x)
2585                     ; 602 	buf[6] = 0x00;
2587  07ad 6f06          	clr	(6,x)
2588                     ; 604 	switch(buf[1]) {
2590  07af e601          	ld	a,(1,x)
2592                     ; 621 		default:
2592                     ; 622 			break;
2593  07b1 4a            	dec	a
2594  07b2 270a          	jreq	L117
2595  07b4 a007          	sub	a,#7
2596  07b6 271b          	jreq	L717
2597  07b8 a008          	sub	a,#8
2598  07ba 2709          	jreq	L517
2599  07bc 201a          	jra	L347
2600  07be               L117:
2601                     ; 605 		case RC_MODE_HEAT:
2601                     ; 606 			buf[3] = uiInfo.tSetup;
2603  07be c6000e        	ld	a,_uiInfo+14
2604  07c1 e703          	ld	(3,x),a
2605                     ; 607 			break;
2607  07c3 2013          	jra	L347
2608                     ; 608 		case RC_MODE_OUT:
2608                     ; 609 		case RC_MODE_STOP:
2608                     ; 610 			break;
2610  07c5               L517:
2611                     ; 611 		case RC_MODE_REPEAT:
2611                     ; 612 			if(_timFlag == 0) {
2613  07c5 c60000        	ld	a,__timFlag
2614  07c8 2604          	jrne	L547
2615                     ; 613 				buf[3] = MAX_REPEAT_TEMP;
2617  07ca a650          	ld	a,#80
2618  07cc e703          	ld	(3,x),a
2619  07ce               L547:
2620                     ; 616 			buf[5] = uiInfo.repeat;
2622  07ce c6000c        	ld	a,_uiInfo+12
2623                     ; 617 			break;
2625  07d1 2003          	jp	LC012
2626  07d3               L717:
2627                     ; 618 		case RC_MODE_RESERVE:
2627                     ; 619 			buf[5] = uiInfo.reserve;
2629  07d3 c6000d        	ld	a,_uiInfo+13
2630  07d6               LC012:
2631  07d6 e705          	ld	(5,x),a
2632                     ; 620 			break;
2634                     ; 621 		default:
2634                     ; 622 			break;
2636  07d8               L347:
2637                     ; 625 	makeChecksum(buf);
2639  07d8 cd053d        	call	_makeChecksum
2641                     ; 627 	if (disp_mode_preview != _disp_mode2){
2643  07db c60002        	ld	a,_disp_mode_preview
2644  07de c10000        	cp	a,__disp_mode2
2645  07e1 271e          	jreq	L747
2646                     ; 628 		if (uiInfo.mode == SETTING_MODE_SUB) {
2648  07e3 c60008        	ld	a,_uiInfo+8
2649  07e6 2607          	jrne	L157
2650                     ; 629 			if (_disp_mode2 != RC_MODE_OUT) {
2652  07e8 c60000        	ld	a,__disp_mode2
2653  07eb a102          	cp	a,#2
2654  07ed 2712          	jreq	L747
2655                     ; 630 				UPDATE_BIT(BIT_DISPMODE);
2658                     ; 631 				disp_mode_preview = _disp_mode2;
2660  07ef               L157:
2661                     ; 634 			UPDATE_BIT(BIT_DISPMODE);
2667                     ; 635 			disp_mode_preview = _disp_mode2;
2671  07ef 72160000      	bset	__updateBit,#3
2673  07f3 5500000000    	mov	__updateTimer,___timer1s
2675  07f8 35050000      	mov	__updateCount,#5
2677  07fc 5500000002    	mov	_disp_mode_preview,__disp_mode2
2678  0801               L747:
2679                     ; 638 }
2682  0801 85            	popw	x
2683  0802 81            	ret	
2735                     ; 641 uint8_t rc_ptc_check_subRC(void) {
2736                     	switch	.text
2737  0803               _rc_ptc_check_subRC:
2739  0803 89            	pushw	x
2740       00000002      OFST:	set	2
2743                     ; 646 	if (_remote == 1) {
2745  0804 c60000        	ld	a,__remote
2746  0807 4a            	dec	a
2747  0808 2603          	jrne	L7001
2748                     ; 647 		return 0xFF;
2750  080a 4a            	dec	a
2753  080b 85            	popw	x
2754  080c 81            	ret	
2755  080d               L7001:
2756                     ; 650 	ch = 0;
2758  080d 0f01          	clr	(OFST-1,sp)
2759                     ; 651 	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
2761  080f cd0954        	call	LC015
2762  0812 d60025        	ld	a,(_rcSubDataInfo+16,x)
2763  0815 4c            	inc	a
2764  0816 2704          	jreq	L1101
2765                     ; 652 		ch = 1;
2767  0818 a601          	ld	a,#1
2768  081a 6b01          	ld	(OFST-1,sp),a
2769  081c               L1101:
2770                     ; 655 	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
2772  081c c60004        	ld	a,_uiInfo+4
2773  081f 5f            	clrw	x
2774  0820 97            	ld	xl,a
2775  0821 5a            	decw	x
2776  0822 c60000        	ld	a,__disp_mode2
2777  0825 d70025        	ld	(_rcSubDataInfo+16,x),a
2778                     ; 656 	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
2780  0828 cd0954        	call	LC015
2781  082b c60002        	ld	a,_uiInfo+2
2782  082e d70015        	ld	(_rcSubDataInfo,x),a
2783                     ; 657 	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
2785  0831 cd0954        	call	LC015
2786  0834 c6000e        	ld	a,_uiInfo+14
2787  0837 d7001d        	ld	(_rcSubDataInfo+8,x),a
2788                     ; 658 	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
2790  083a cd0954        	call	LC015
2791  083d c6000d        	ld	a,_uiInfo+13
2792  0840 d70035        	ld	(_rcSubDataInfo+32,x),a
2793                     ; 659 	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
2795  0843 cd0954        	call	LC015
2796  0846 c6000c        	ld	a,_uiInfo+12
2797  0849 d7003d        	ld	(_rcSubDataInfo+40,x),a
2798                     ; 661 	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
2800  084c cd0954        	call	LC015
2801  084f c60000        	ld	a,__disp_mode2
2802  0852 d70045        	ld	(_uiInfo+69,x),a
2803                     ; 662 	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
2805  0855 cd0954        	call	LC015
2806  0858 c60002        	ld	a,_uiInfo+2
2807  085b d70035        	ld	(_uiInfo+53,x),a
2808                     ; 663 	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
2810  085e cd0954        	call	LC015
2811  0861 c6000e        	ld	a,_uiInfo+14
2812  0864 d7003d        	ld	(_uiInfo+61,x),a
2813                     ; 664 	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
2815  0867 cd0954        	call	LC015
2816  086a c6000d        	ld	a,_uiInfo+13
2817  086d d7004d        	ld	(_uiInfo+77,x),a
2818                     ; 665 	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
2820  0870 cd0954        	call	LC015
2821  0873 c6000c        	ld	a,_uiInfo+12
2822  0876 d70055        	ld	(_uiInfo+85,x),a
2823                     ; 667 	if (ch == 0) {
2825  0879 7b01          	ld	a,(OFST-1,sp)
2826  087b 2603          	jrne	L3101
2827                     ; 669 		return 0xFF;
2829  087d 4a            	dec	a
2832  087e 85            	popw	x
2833  087f 81            	ret	
2834  0880               L3101:
2835                     ; 672 	num = 0xFF;
2837  0880 a6ff          	ld	a,#255
2838  0882 6b01          	ld	(OFST-1,sp),a
2839                     ; 673 	for (i = 0 ; i < 8 ; i++) {
2841  0884 4f            	clr	a
2842  0885 6b02          	ld	(OFST+0,sp),a
2843  0887               L5101:
2844                     ; 674 		if (rcSubDataInfo.set_temp[i] == 0xAA) {
2846  0887 5f            	clrw	x
2847  0888 97            	ld	xl,a
2848  0889 d6001d        	ld	a,(_rcSubDataInfo+8,x)
2849  088c a1aa          	cp	a,#170
2850  088e 2756          	jreq	L7101
2851                     ; 675 			continue;
2853                     ; 678 		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
2855  0890 7b02          	ld	a,(OFST+0,sp)
2856  0892 cd095b        	call	LC016
2857  0895 90d60045      	ld	a,(_uiInfo+69,y)
2858  0899 d10025        	cp	a,(_rcSubDataInfo+16,x)
2859  089c 2706          	jreq	L5201
2860                     ; 679 			num = i;
2862  089e 7b02          	ld	a,(OFST+0,sp)
2863  08a0 6b01          	ld	(OFST-1,sp),a
2864                     ; 680 			break;
2866  08a2 204c          	jra	L1201
2867  08a4               L5201:
2868                     ; 683 		switch (rcSubDataInfo.mode_heat[i]) {
2870  08a4 7b02          	ld	a,(OFST+0,sp)
2871  08a6 5f            	clrw	x
2872  08a7 97            	ld	xl,a
2873  08a8 d60025        	ld	a,(_rcSubDataInfo+16,x)
2875                     ; 701 				break;
2876  08ab 4a            	dec	a
2877  08ac 270a          	jreq	L757
2878  08ae a007          	sub	a,#7
2879  08b0 2722          	jreq	L567
2880  08b2 a008          	sub	a,#8
2881  08b4 2710          	jreq	L367
2882  08b6 202e          	jra	L7101
2883  08b8               L757:
2884                     ; 684 			case RC_MODE_HEAT:
2884                     ; 685 				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
2886  08b8 7b02          	ld	a,(OFST+0,sp)
2887  08ba cd095b        	call	LC016
2888  08bd 90d6003d      	ld	a,(_uiInfo+61,y)
2889  08c1 d1001d        	cp	a,(_rcSubDataInfo+8,x)
2890                     ; 686 					num = i;
2891  08c4 201a          	jp	LC014
2892                     ; 689 			case RC_MODE_OUT:
2892                     ; 690 			case RC_MODE_STOP:
2892                     ; 691 				break;
2894  08c6               L367:
2895                     ; 692 			case RC_MODE_REPEAT:
2895                     ; 693 				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
2897  08c6 7b02          	ld	a,(OFST+0,sp)
2898  08c8 cd095b        	call	LC016
2899  08cb 90d60055      	ld	a,(_uiInfo+85,y)
2900  08cf d1003d        	cp	a,(_rcSubDataInfo+40,x)
2901                     ; 694 					num = i;
2902  08d2 200c          	jp	LC014
2903  08d4               L567:
2904                     ; 697 			case RC_MODE_RESERVE:
2904                     ; 698 				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
2906  08d4 7b02          	ld	a,(OFST+0,sp)
2907  08d6 cd095b        	call	LC016
2908  08d9 90d6004d      	ld	a,(_uiInfo+77,y)
2909  08dd d10035        	cp	a,(_rcSubDataInfo+32,x)
2910                     ; 699 					num = i;
2912  08e0               LC014:
2913  08e0 2704          	jreq	L7101
2916  08e2 7b02          	ld	a,(OFST+0,sp)
2917  08e4 6b01          	ld	(OFST-1,sp),a
2918  08e6               L7101:
2919                     ; 673 	for (i = 0 ; i < 8 ; i++) {
2921  08e6 0c02          	inc	(OFST+0,sp)
2924  08e8 7b02          	ld	a,(OFST+0,sp)
2925  08ea a108          	cp	a,#8
2926  08ec 2599          	jrult	L5101
2927  08ee 7b01          	ld	a,(OFST-1,sp)
2928  08f0               L1201:
2929                     ; 705 	if (num == 0xFF) {
2931  08f0 a1ff          	cp	a,#255
2932  08f2 260a          	jrne	L1401
2933                     ; 706 		ret_count = MAX_REPEAT_ERROR_COUNT;
2935  08f4 35050001      	mov	_ret_count,#5
2936                     ; 707 		cur_src = 0;
2938  08f8 725f0000      	clr	_cur_src
2939                     ; 708 		return num;
2942  08fc 2054          	jra	L251
2943  08fe               L1401:
2944                     ; 711 	if (cur_src == num) {
2946  08fe c60000        	ld	a,_cur_src
2947  0901 1101          	cp	a,(OFST-1,sp)
2948  0903 2642          	jrne	L3401
2949                     ; 712 		ret_count--;
2951  0905 725a0001      	dec	_ret_count
2952                     ; 714 		if (ret_count == 0) {
2954  0909 2645          	jrne	L7401
2955                     ; 715 			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
2957  090b 7b01          	ld	a,(OFST-1,sp)
2958  090d 5f            	clrw	x
2959  090e 97            	ld	xl,a
2960  090f d60045        	ld	a,(_uiInfo+69,x)
2961  0912 d70025        	ld	(_rcSubDataInfo+16,x),a
2962                     ; 716 			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
2964  0915 5f            	clrw	x
2965  0916 7b01          	ld	a,(OFST-1,sp)
2966  0918 97            	ld	xl,a
2967  0919 d60035        	ld	a,(_uiInfo+53,x)
2968  091c d70015        	ld	(_rcSubDataInfo,x),a
2969                     ; 717 			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
2971  091f 5f            	clrw	x
2972  0920 7b01          	ld	a,(OFST-1,sp)
2973  0922 97            	ld	xl,a
2974  0923 d6003d        	ld	a,(_uiInfo+61,x)
2975  0926 d7001d        	ld	(_rcSubDataInfo+8,x),a
2976                     ; 718 			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
2978  0929 5f            	clrw	x
2979  092a 7b01          	ld	a,(OFST-1,sp)
2980  092c 97            	ld	xl,a
2981  092d d6004d        	ld	a,(_uiInfo+77,x)
2982  0930 d70035        	ld	(_rcSubDataInfo+32,x),a
2983                     ; 719 			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
2985  0933 5f            	clrw	x
2986  0934 7b01          	ld	a,(OFST-1,sp)
2987  0936 97            	ld	xl,a
2988  0937 d60055        	ld	a,(_uiInfo+85,x)
2989  093a d7003d        	ld	(_rcSubDataInfo+40,x),a
2990                     ; 721 			ret_count = MAX_REPEAT_ERROR_COUNT;
2992  093d 35050001      	mov	_ret_count,#5
2993                     ; 722 			num = 0xFF;
2995  0941 a6ff          	ld	a,#255
2996  0943 6b01          	ld	(OFST-1,sp),a
2997  0945 2009          	jra	L7401
2998  0947               L3401:
2999                     ; 725 		cur_src = num;
3001  0947 7b01          	ld	a,(OFST-1,sp)
3002  0949 c70000        	ld	_cur_src,a
3003                     ; 726 		ret_count = MAX_REPEAT_ERROR_COUNT;
3005  094c 35050001      	mov	_ret_count,#5
3006  0950               L7401:
3007                     ; 729 	return num;
3009  0950 7b01          	ld	a,(OFST-1,sp)
3011  0952               L251:
3013  0952 85            	popw	x
3014  0953 81            	ret	
3015  0954               LC015:
3016  0954 5f            	clrw	x
3017  0955 c60004        	ld	a,_uiInfo+4
3018  0958 97            	ld	xl,a
3019  0959 5a            	decw	x
3020  095a 81            	ret	
3021  095b               LC016:
3022  095b 5f            	clrw	x
3023  095c 97            	ld	xl,a
3024  095d 905f          	clrw	y
3025  095f 9097          	ld	yl,a
3026  0961 81            	ret	
3070                     ; 733 void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
3071                     	switch	.text
3072  0962               _rc_ptc_make_subRC:
3074  0962 89            	pushw	x
3075       00000000      OFST:	set	0
3078                     ; 734 	buf[0] = BYTE_START_RC_SUBRC | num + 1;
3080  0963 7b05          	ld	a,(OFST+5,sp)
3081  0965 4c            	inc	a
3082  0966 1e01          	ldw	x,(OFST+1,sp)
3083  0968 aa60          	or	a,#96
3084  096a f7            	ld	(x),a
3085                     ; 735 	buf[1] = uiInfo.remote_mode[num];
3087  096b 5f            	clrw	x
3088  096c 7b05          	ld	a,(OFST+5,sp)
3089  096e 97            	ld	xl,a
3090  096f d60045        	ld	a,(_uiInfo+69,x)
3091  0972 1e01          	ldw	x,(OFST+1,sp)
3092                     ; 736 	buf[2] = 0x00;
3094  0974 6f02          	clr	(2,x)
3095  0976 e701          	ld	(1,x),a
3096                     ; 737 	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
3098  0978 5f            	clrw	x
3099  0979 7b05          	ld	a,(OFST+5,sp)
3100  097b 97            	ld	xl,a
3101  097c d60045        	ld	a,(_uiInfo+69,x)
3102  097f 4a            	dec	a
3103  0980 260d          	jrne	L1701
3104                     ; 738 		buf[3] = uiInfo.tempSetup[num];
3106  0982 7b05          	ld	a,(OFST+5,sp)
3107  0984 5f            	clrw	x
3108  0985 97            	ld	xl,a
3109  0986 d6003d        	ld	a,(_uiInfo+61,x)
3110  0989 1e01          	ldw	x,(OFST+1,sp)
3111  098b e703          	ld	(3,x),a
3113  098d 2004          	jra	L3701
3114  098f               L1701:
3115                     ; 740 		buf[3] = 0x00;
3117  098f 1e01          	ldw	x,(OFST+1,sp)
3118  0991 6f03          	clr	(3,x)
3119  0993               L3701:
3120                     ; 743 	buf[4] = 0x00;
3122  0993 6f04          	clr	(4,x)
3123                     ; 745 	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
3125  0995 5f            	clrw	x
3126  0996 7b05          	ld	a,(OFST+5,sp)
3127  0998 97            	ld	xl,a
3128  0999 d60045        	ld	a,(_uiInfo+69,x)
3129  099c a110          	cp	a,#16
3130  099e 2609          	jrne	L5701
3131                     ; 746 		buf[5] = uiInfo.remote_banb[num];
3133  09a0 7b05          	ld	a,(OFST+5,sp)
3134  09a2 5f            	clrw	x
3135  09a3 97            	ld	xl,a
3136  09a4 d60055        	ld	a,(_uiInfo+85,x)
3138  09a7 2012          	jp	LC017
3139  09a9               L5701:
3140                     ; 747 	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
3142  09a9 7b05          	ld	a,(OFST+5,sp)
3143  09ab 5f            	clrw	x
3144  09ac 97            	ld	xl,a
3145  09ad d60045        	ld	a,(_uiInfo+69,x)
3146  09b0 a108          	cp	a,#8
3147  09b2 260d          	jrne	L1011
3148                     ; 748 		buf[5] = uiInfo.remote_time[num];
3150  09b4 7b05          	ld	a,(OFST+5,sp)
3151  09b6 5f            	clrw	x
3152  09b7 97            	ld	xl,a
3153  09b8 d6004d        	ld	a,(_uiInfo+77,x)
3154  09bb               LC017:
3155  09bb 1e01          	ldw	x,(OFST+1,sp)
3156  09bd e705          	ld	(5,x),a
3158  09bf 2004          	jra	L7701
3159  09c1               L1011:
3160                     ; 750 		buf[5] = 0x00;
3162  09c1 1e01          	ldw	x,(OFST+1,sp)
3163  09c3 6f05          	clr	(5,x)
3164  09c5               L7701:
3165                     ; 753 	buf[6] = 0x00;
3167  09c5 6f06          	clr	(6,x)
3168                     ; 755 	makeChecksum(buf);
3170  09c7 cd053d        	call	_makeChecksum
3172                     ; 756 }
3175  09ca 85            	popw	x
3176  09cb 81            	ret	
3215                     ; 758 void rc_ptc_make_error(uint8_t *buf) {
3216                     	switch	.text
3217  09cc               _rc_ptc_make_error:
3219  09cc 89            	pushw	x
3220       00000000      OFST:	set	0
3223                     ; 759 	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
3225  09cd c60004        	ld	a,_uiInfo+4
3226  09d0 1e01          	ldw	x,(OFST+1,sp)
3227  09d2 aae0          	or	a,#224
3228  09d4 f7            	ld	(x),a
3229                     ; 760 	buf[1] = error;
3231  09d5 c6000a        	ld	a,_error
3232  09d8 e701          	ld	(1,x),a
3233                     ; 761 	buf[2] = mode_recover;
3235  09da c6000f        	ld	a,_mode_recover
3236  09dd e702          	ld	(2,x),a
3237                     ; 762 	buf[3] = 0x00;
3239  09df 6f03          	clr	(3,x)
3240                     ; 763 	buf[4] = 0x00;
3242  09e1 6f04          	clr	(4,x)
3243                     ; 764 	buf[5] = 0x00;
3245  09e3 6f05          	clr	(5,x)
3246                     ; 765 	buf[6] = 0x00;
3248  09e5 6f06          	clr	(6,x)
3249                     ; 767 	makeChecksum(buf);
3251  09e7 cd053d        	call	_makeChecksum
3253                     ; 768 }
3256  09ea 85            	popw	x
3257  09eb 81            	ret	
3294                     ; 770 void rc_ptc_make_command(uint8_t *buf) {
3295                     	switch	.text
3296  09ec               _rc_ptc_make_command:
3298  09ec 89            	pushw	x
3299       00000000      OFST:	set	0
3302                     ; 771 	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
3304  09ed c60004        	ld	a,_uiInfo+4
3305  09f0 1e01          	ldw	x,(OFST+1,sp)
3306  09f2 aaf0          	or	a,#240
3307  09f4 f7            	ld	(x),a
3308                     ; 772 	buf[1] = 0x20;
3310  09f5 a620          	ld	a,#32
3311  09f7 e701          	ld	(1,x),a
3312                     ; 773 	buf[2] = 0x00;
3314  09f9 6f02          	clr	(2,x)
3315                     ; 774 	buf[3] = 0x00;
3317  09fb 6f03          	clr	(3,x)
3318                     ; 775 	buf[4] = 0x00;
3320  09fd 6f04          	clr	(4,x)
3321                     ; 776 	buf[5] = 0x00;
3323  09ff 6f05          	clr	(5,x)
3324                     ; 777 	buf[6] = 0x00;
3326  0a01 6f06          	clr	(6,x)
3327                     ; 778 }
3330  0a03 85            	popw	x
3331  0a04 81            	ret	
3383                     ; 788 void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
3383                     ; 789 {
3384                     	switch	.text
3385  0a05               _rc_ptc_make_command_packet:
3387  0a05 89            	pushw	x
3388       00000000      OFST:	set	0
3391                     ; 790 	rc_ptc_make_command(buf);
3393  0a06 ade4          	call	_rc_ptc_make_command
3395                     ; 791 	switch( cmd )
3397  0a08 7b05          	ld	a,(OFST+5,sp)
3399                     ; 818 		break;
3400  0a0a 4a            	dec	a
3401  0a0b 270c          	jreq	L1411
3402  0a0d a003          	sub	a,#3
3403  0a0f 270d          	jreq	L3411
3404  0a11 4a            	dec	a
3405  0a12 2710          	jreq	L5411
3406  0a14 4a            	dec	a
3407  0a15 2713          	jreq	L7411
3408  0a17 201b          	jra	L5711
3409  0a19               L1411:
3410                     ; 793 	case PKT_CMD_MIRROR:
3410                     ; 794 		buf[2] = COMMAND_MODE_MIRROR;
3412  0a19 1e01          	ldw	x,(OFST+1,sp)
3413  0a1b 4c            	inc	a
3414                     ; 795 		buf[3] = p1;
3415                     ; 796 		break;
3417  0a1c 2010          	jp	LC018
3418  0a1e               L3411:
3419                     ; 807 	case PKT_CMD_FACTORY:
3419                     ; 808 		buf[2] = COMMAND_MODE_FACTORY;
3421  0a1e 1e01          	ldw	x,(OFST+1,sp)
3422  0a20 a608          	ld	a,#8
3423                     ; 809 		buf[3] = p1;
3424                     ; 810 		break;
3426  0a22 200a          	jp	LC018
3427  0a24               L5411:
3428                     ; 811 	case PKT_CMD_RESET:
3428                     ; 812 		buf[2] = COMMAND_MODE_RESET;
3430  0a24 1e01          	ldw	x,(OFST+1,sp)
3431  0a26 a604          	ld	a,#4
3432                     ; 813 		buf[3] = p1;
3433                     ; 814 		break;
3435  0a28 2004          	jp	LC018
3436  0a2a               L7411:
3437                     ; 815 	case PKT_CMD_BOILER_HOT_MODE:
3437                     ; 816 		buf[2] = COMMAND_MODE_HOTWATER;
3439  0a2a 1e01          	ldw	x,(OFST+1,sp)
3440  0a2c a602          	ld	a,#2
3441                     ; 817 		buf[3] = p1;
3443  0a2e               LC018:
3444  0a2e e702          	ld	(2,x),a
3448  0a30 7b06          	ld	a,(OFST+6,sp)
3449  0a32 e703          	ld	(3,x),a
3450                     ; 818 		break;
3452  0a34               L5711:
3453                     ; 821 	makeChecksum(buf);
3455  0a34 1e01          	ldw	x,(OFST+1,sp)
3456  0a36 cd053d        	call	_makeChecksum
3458                     ; 822 }
3461  0a39 85            	popw	x
3462  0a3a 81            	ret	
3508                     ; 858 void rc_ptc_make_mirror(uint8_t *buf) {
3509                     	switch	.text
3510  0a3b               _rc_ptc_make_mirror:
3512  0a3b 89            	pushw	x
3513  0a3c 88            	push	a
3514       00000001      OFST:	set	1
3517                     ; 860 	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
3519  0a3d c60006        	ld	a,_cur_mirror_page
3520  0a40 1e02          	ldw	x,(OFST+1,sp)
3521  0a42 aa40          	or	a,#64
3522  0a44 f7            	ld	(x),a
3523                     ; 862 	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
3525  0a45 c60011        	ld	a,_mode_mirror
3526  0a48 4a            	dec	a
3527  0a49 2702          	jreq	L002
3528  0a4b a601          	ld	a,#1
3529  0a4d               L002:
3530  0a4d 6b01          	ld	(OFST+0,sp),a
3531                     ; 863 	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
3533  0a4f 88            	push	a
3534  0a50 3b0006        	push	_cur_mirror_page
3535  0a53 1e04          	ldw	x,(OFST+3,sp)
3536  0a55 cd057d        	call	_rc_ptc_make_baseSetting
3538  0a58 85            	popw	x
3539                     ; 865 	makeChecksum(buf);
3541  0a59 1e02          	ldw	x,(OFST+1,sp)
3542  0a5b cd053d        	call	_makeChecksum
3544                     ; 867 	if (cur_mirror_page == 2) {
3546  0a5e c60006        	ld	a,_cur_mirror_page
3547  0a61 a102          	cp	a,#2
3548  0a63 2608          	jrne	L7121
3549                     ; 868 		cur_mirror_page = 0;
3551  0a65 725f0006      	clr	_cur_mirror_page
3552                     ; 869 		mode_mirror = 1;
3554  0a69 35010011      	mov	_mode_mirror,#1
3555  0a6d               L7121:
3556                     ; 871 }
3559  0a6d 5b03          	addw	sp,#3
3560  0a6f 81            	ret	
3618                     ; 873 void rc_ptc_make(uint8_t *buf) {
3619                     	switch	.text
3620  0a70               _rc_ptc_make:
3622  0a70 89            	pushw	x
3623  0a71 88            	push	a
3624       00000001      OFST:	set	1
3627                     ; 877 	if (error != 0 && error_type != 0) {
3629  0a72 c6000a        	ld	a,_error
3630  0a75 2705          	jreq	L5421
3632  0a77 c60009        	ld	a,_error_type
3633                     ; 878 		rc_ptc_make_error(buf);
3635                     ; 879 		return;
3637  0a7a 2608          	jrne	LC019
3638  0a7c               L5421:
3639                     ; 881 		if (mode_recover == 1) {
3641  0a7c c6000f        	ld	a,_mode_recover
3642  0a7f 4a            	dec	a
3643  0a80 2608          	jrne	L7421
3644                     ; 882 			rc_ptc_make_error(buf);
3646  0a82 1e02          	ldw	x,(OFST+1,sp)
3647  0a84               LC019:
3649  0a84 cd09cc        	call	_rc_ptc_make_error
3651                     ; 883 			return;
3652  0a87               L242:
3655  0a87 5b03          	addw	sp,#3
3656  0a89 81            	ret	
3657  0a8a               L7421:
3658                     ; 887 	switch (uiInfo.mode) {
3660  0a8a c60008        	ld	a,_uiInfo+8
3662                     ; 935 			break;
3663  0a8d 276a          	jreq	LC020
3664  0a8f 4a            	dec	a
3665  0a90 26f5          	jrne	L242
3666                     ; 888 		case SETTING_MODE_MASTER:
3666                     ; 889 			
3666                     ; 890 			if (getSettingChange() == 1) {
3668  0a92 cd0531        	call	_getSettingChange
3670  0a95 4a            	dec	a
3671  0a96 2607          	jrne	L7521
3672                     ; 891 				rc_ptc_make_setting(buf);
3674  0a98 1e02          	ldw	x,(OFST+1,sp)
3675  0a9a cd0771        	call	_rc_ptc_make_setting
3677                     ; 892 				return;
3679  0a9d 20e8          	jra	L242
3680  0a9f               L7521:
3681                     ; 896 			if (mode_mirror != 0) {
3683  0a9f c60011        	ld	a,_mode_mirror
3684  0aa2 270d          	jreq	L1621
3685                     ; 897 				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
3687  0aa4 3b0011        	push	_mode_mirror
3688  0aa7 4b01          	push	#1
3689  0aa9 1e04          	ldw	x,(OFST+3,sp)
3690  0aab cd0a05        	call	_rc_ptc_make_command_packet
3692  0aae 85            	popw	x
3693                     ; 898 				return;
3695  0aaf 20d6          	jra	L242
3696  0ab1               L1621:
3697                     ; 901 			if (mode_factory != 0) {
3699  0ab1 c60010        	ld	a,_mode_factory
3700  0ab4 2711          	jreq	L3621
3701                     ; 903 				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
3703  0ab6 3b0010        	push	_mode_factory
3704  0ab9 4b04          	push	#4
3705  0abb 1e04          	ldw	x,(OFST+3,sp)
3706  0abd cd0a05        	call	_rc_ptc_make_command_packet
3708  0ac0 725f0010      	clr	_mode_factory
3709  0ac4 85            	popw	x
3710                     ; 904 				mode_factory = 0;
3712                     ; 905 				return;
3714  0ac5 20c0          	jra	L242
3715  0ac7               L3621:
3716                     ; 908 			if (mode_hotwater != 0) {
3718  0ac7 c6000e        	ld	a,_mode_hotwater
3719  0aca 270d          	jreq	L5621
3720                     ; 910 				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
3722  0acc 3b000e        	push	_mode_hotwater
3723  0acf 4b06          	push	#6
3724  0ad1 1e04          	ldw	x,(OFST+3,sp)
3725  0ad3 cd0a05        	call	_rc_ptc_make_command_packet
3727  0ad6 85            	popw	x
3728                     ; 911 				return;
3730  0ad7 20ae          	jra	L242
3731  0ad9               L5621:
3732                     ; 914 			if (mode_reset != 0) {
3734  0ad9 c6000d        	ld	a,_mode_reset
3735  0adc 270d          	jreq	L7621
3736                     ; 916 				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
3738  0ade 3b000d        	push	_mode_reset
3739  0ae1 4b05          	push	#5
3740  0ae3 1e04          	ldw	x,(OFST+3,sp)
3741  0ae5 cd0a05        	call	_rc_ptc_make_command_packet
3743  0ae8 85            	popw	x
3744                     ; 917 				return;
3746  0ae9 209c          	jra	L242
3747  0aeb               L7621:
3748                     ; 921 			num = rc_ptc_check_subRC();
3750  0aeb cd0803        	call	_rc_ptc_check_subRC
3752  0aee 6b01          	ld	(OFST+0,sp),a
3753                     ; 922 			if ( num == 0xFF) {
3755  0af0 4c            	inc	a
3756                     ; 923 				rc_ptc_make_normal(buf);
3758                     ; 924 				return;
3760  0af1 2706          	jreq	LC020
3761                     ; 927 			if (_remote == 1) {
3763  0af3 c60000        	ld	a,__remote
3764  0af6 4a            	dec	a
3765  0af7 2607          	jrne	L3721
3766                     ; 928 				rc_ptc_make_normal(buf);
3768  0af9               LC020:
3771  0af9 1e02          	ldw	x,(OFST+1,sp)
3772  0afb cd0794        	call	_rc_ptc_make_normal
3775  0afe 2087          	jra	L242
3776  0b00               L3721:
3777                     ; 930 				rc_ptc_make_subRC(buf, num);
3779  0b00 7b01          	ld	a,(OFST+0,sp)
3780  0b02 88            	push	a
3781  0b03 1e03          	ldw	x,(OFST+2,sp)
3782  0b05 cd0962        	call	_rc_ptc_make_subRC
3784  0b08 84            	pop	a
3785  0b09 cc0a87        	jra	L242
3786                     ; 933 		case SETTING_MODE_SUB:
3786                     ; 934 			rc_ptc_make_normal(buf);
3788                     ; 935 			break;
3790                     ; 937 }
4047                     	xdef	_rc_ptc_make_command_packet
4048                     	xdef	_rc_ptc_make_command
4049                     	xdef	_rc_ptc_make_error
4050                     	xdef	_rc_ptc_check_subRC
4051                     	xdef	_rc_ptc_make_baseSetting
4052                     	xdef	_makeChecksum
4053                     	xdef	_rc_ptc_check_mirror
4054                     	xdef	_rc_ptc_check_subrc
4055                     	xdef	_rc_ptc_check_rc
4056                     	xdef	_rc_ptc_check_setting
4057                     	xdef	_rc_ptc_check_normal
4058                     	xdef	_rc_ptc_check_homenet
4059                     	xdef	_rc_ptc_check_master
4060                     	switch	.bss
4061  0000               _cur_src:
4062  0000 00            	ds.b	1
4063                     	xdef	_cur_src
4064  0001               _ret_count:
4065  0001 00            	ds.b	1
4066                     	xdef	_ret_count
4067  0002               _disp_mode_preview:
4068  0002 00            	ds.b	1
4069                     	xdef	_disp_mode_preview
4070  0003               __rcLED:
4071  0003 00            	ds.b	1
4072                     	xdef	__rcLED
4073  0004               _test_count:
4074  0004 00            	ds.b	1
4075                     	xdef	_test_count
4076  0005               _packet_changed:
4077  0005 00            	ds.b	1
4078                     	xdef	_packet_changed
4079  0006               _cur_mirror_page:
4080  0006 00            	ds.b	1
4081                     	xdef	_cur_mirror_page
4082  0007               _cur_set_page:
4083  0007 00            	ds.b	1
4084                     	xdef	_cur_set_page
4085  0008               __version:
4086  0008 00            	ds.b	1
4087                     	xdef	__version
4088  0009               _error_type:
4089  0009 00            	ds.b	1
4090                     	xdef	_error_type
4091  000a               _error:
4092  000a 00            	ds.b	1
4093                     	xdef	_error
4094  000b               _state_check:
4095  000b 00            	ds.b	1
4096                     	xdef	_state_check
4097                     	xref	__backup_backlight
4098                     	xref	_packet_buf
4099                     	xref	__boiler_fire
4100                     	xref	__boiler_water_heat
4101                     	xref	__boiler_type
4102                     	xref	__boiler_water_shower
4103                     	xref	__timFlag
4104                     	xref	__remote
4105                     	xref	_func_rc_settingCb
4106                     	xref	__updateCount
4107                     	xref	__updateBit
4108                     	xref	__updateTimer
4109                     	xref	__disp_mode2
4110                     	xref	_lcd_disp_rid
4111                     	xref	_uiInfo
4112                     	xdef	_rc_ptc_make_mirror
4113                     	xdef	_rc_ptc_make
4114                     	xdef	_rc_ptc_make_subRC
4115                     	xdef	_rc_ptc_make_setting
4116                     	xdef	_rc_ptc_make_normal
4117                     	xdef	_setState_check
4118                     	xdef	_getState_check
4119                     	xdef	_getSettingChange
4120                     	xdef	_setSettingChange
4121                     	xdef	_rc_ptc_check
4122                     	xdef	_rc_ptc_baseSet
4123                     	xdef	_getHexToBin
4124  000c               _set_changed:
4125  000c 00            	ds.b	1
4126                     	xdef	_set_changed
4127  000d               _mode_reset:
4128  000d 00            	ds.b	1
4129                     	xdef	_mode_reset
4130  000e               _mode_hotwater:
4131  000e 00            	ds.b	1
4132                     	xdef	_mode_hotwater
4133  000f               _mode_recover:
4134  000f 00            	ds.b	1
4135                     	xdef	_mode_recover
4136  0010               _mode_factory:
4137  0010 00            	ds.b	1
4138                     	xdef	_mode_factory
4139  0011               _mode_mirror:
4140  0011 00            	ds.b	1
4141                     	xdef	_mode_mirror
4142  0012               _boiler_info:
4143  0012 000000        	ds.b	3
4144                     	xdef	_boiler_info
4145  0015               _rcSubDataInfo:
4146  0015 000000000000  	ds.b	48
4147                     	xdef	_rcSubDataInfo
4148                     	xref	_file_read
4149                     	xref	_disp_char
4150                     	xref	___timer1s
4170                     	end
