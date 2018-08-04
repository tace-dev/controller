   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  64                     ; 16 void rc_lse_ptc_check_normal(uint8_t *buf) {
  66                     	switch	.text
  67  0000               _rc_lse_ptc_check_normal:
  71                     ; 17 	if ((buf[0] & 0x0F) != uiInfo.id) {
  73  0000 f6            	ld	a,(x)
  74  0001 a40f          	and	a,#15
  75  0003 c10004        	cp	a,_uiInfo+4
  76  0006 2704          	jreq	L72
  77                     ; 18 		setLSEState_check(RC_LSE_STATE_NONE);
  79  0008 4f            	clr	a
  81                     ; 19 		return;
  84  0009 cc00cf        	jp	_setLSEState_check
  85  000c               L72:
  86                     ; 22 	setLSEState_check(RC_LSE_STATE_NORMAL);
  88  000c a601          	ld	a,#1
  90                     ; 24 }
  93  000e cc00cf        	jp	_setLSEState_check
 131                     ; 27 void rc_lse_ptc_check_rc(uint8_t *buf) {
 132                     	switch	.text
 133  0011               _rc_lse_ptc_check_rc:
 137                     ; 28 	if (uiInfo.mode == SETTING_MODE_MASTER) {
 139  0011 c60008        	ld	a,_uiInfo+8
 140  0014 4a            	dec	a
 141  0015 2601          	jrne	L74
 142                     ; 29 		return;
 145  0017 81            	ret	
 146  0018               L74:
 147                     ; 32 	setLSEState_check(RC_LSE_STATE_NONE);
 149  0018 4f            	clr	a
 151                     ; 34 }
 154  0019 cc00cf        	jp	_setLSEState_check
 191                     ; 37 void rc_lse_ptc_check_cnt(uint8_t *buf) {
 192                     	switch	.text
 193  001c               _rc_lse_ptc_check_cnt:
 197                     ; 38 	setLSEState_check(RC_LSE_STATE_NONE);
 199  001c 4f            	clr	a
 201                     ; 39 }
 204  001d cc00cf        	jp	_setLSEState_check
 256                     ; 42 void rc_lse_ptc_check(uint8_t *buf) {
 257                     	switch	.text
 258  0020               _rc_lse_ptc_check:
 260  0020 89            	pushw	x
 261  0021 89            	pushw	x
 262       00000002      OFST:	set	2
 265                     ; 45 	start = buf[0] & 0xF0;
 267  0022 f6            	ld	a,(x)
 268  0023 a4f0          	and	a,#240
 269  0025 6b01          	ld	(OFST-1,sp),a
 270                     ; 46 	end = buf[0] & 0x0F;
 272  0027 f6            	ld	a,(x)
 273  0028 a40f          	and	a,#15
 274  002a 6b02          	ld	(OFST+0,sp),a
 275                     ; 48 	if (start == BYTE_START_LSE_CNT_NORMAL) {
 277  002c 7b01          	ld	a,(OFST-1,sp)
 278  002e 2604          	jrne	L111
 279                     ; 49 		rc_lse_ptc_check_normal(buf);
 281  0030 adce          	call	_rc_lse_ptc_check_normal
 284  0032 200e          	jra	L311
 285  0034               L111:
 286                     ; 50 	} else if (end == BYTE_START_LSE_CNT_REQ) {
 288  0034 7b02          	ld	a,(OFST+0,sp)
 289  0036 2606          	jrne	L511
 290                     ; 51 		rc_lse_ptc_check_cnt(buf);
 292  0038 1e03          	ldw	x,(OFST+1,sp)
 293  003a ade0          	call	_rc_lse_ptc_check_cnt
 296  003c 2004          	jra	L311
 297  003e               L511:
 298                     ; 53 		rc_lse_ptc_check_rc(buf);
 300  003e 1e03          	ldw	x,(OFST+1,sp)
 301  0040 adcf          	call	_rc_lse_ptc_check_rc
 303  0042               L311:
 304                     ; 55 }
 307  0042 5b04          	addw	sp,#4
 308  0044 81            	ret	
 357                     ; 57 void makeLSEChecksum(uint8_t *buf) {
 358                     	switch	.text
 359  0045               _makeLSEChecksum:
 361  0045 89            	pushw	x
 362  0046 89            	pushw	x
 363       00000002      OFST:	set	2
 366                     ; 62 	s = 0;
 368  0047 0f01          	clr	(OFST-1,sp)
 369                     ; 63 	for (i = 0 ; i < 7 ; i++) {
 371  0049 0f02          	clr	(OFST+0,sp)
 372  004b               L341:
 373                     ; 64 		s += buf[i];
 375  004b 7b03          	ld	a,(OFST+1,sp)
 376  004d 97            	ld	xl,a
 377  004e 7b04          	ld	a,(OFST+2,sp)
 378  0050 1b02          	add	a,(OFST+0,sp)
 379  0052 2401          	jrnc	L43
 380  0054 5c            	incw	x
 381  0055               L43:
 382  0055 02            	rlwa	x,a
 383  0056 7b01          	ld	a,(OFST-1,sp)
 384  0058 fb            	add	a,(x)
 385  0059 6b01          	ld	(OFST-1,sp),a
 386                     ; 63 	for (i = 0 ; i < 7 ; i++) {
 388  005b 0c02          	inc	(OFST+0,sp)
 391  005d 7b02          	ld	a,(OFST+0,sp)
 392  005f a107          	cp	a,#7
 393  0061 25e8          	jrult	L341
 394                     ; 66 	buf[7] = s;
 396  0063 1e03          	ldw	x,(OFST+1,sp)
 397  0065 7b01          	ld	a,(OFST-1,sp)
 398  0067 e707          	ld	(7,x),a
 399                     ; 71 }
 402  0069 5b04          	addw	sp,#4
 403  006b 81            	ret	
 436                     ; 73 uint8_t rc_lse_heatMode(void) {
 437                     	switch	.text
 438  006c               _rc_lse_heatMode:
 440  006c 88            	push	a
 441       00000001      OFST:	set	1
 444                     ; 76 	switch (_disp_mode2) {
 446  006d c60000        	ld	a,__disp_mode2
 448                     ; 85 			break;
 449  0070 4a            	dec	a
 450  0071 2711          	jreq	LC001
 451  0073 4a            	dec	a
 452  0074 2708          	jreq	L351
 453  0076 a002          	sub	a,#2
 454  0078 2708          	jreq	L551
 455  007a 7b01          	ld	a,(OFST+0,sp)
 456  007c 2006          	jra	LC001
 457                     ; 77 		case RC_MODE_HEAT:
 457                     ; 78 			val = 0x00;
 458                     ; 79 			break;
 460  007e               L351:
 461                     ; 80 		case RC_MODE_OUT:
 461                     ; 81 			val = 0x04;
 463  007e a604          	ld	a,#4
 464                     ; 82 			break;
 466  0080 2002          	jp	LC001
 467  0082               L551:
 468                     ; 83 		case RC_MODE_STOP: 
 468                     ; 84 			val = 0x03;
 470  0082 a603          	ld	a,#3
 471  0084               LC001:
 473                     ; 85 			break;
 475                     ; 88 	return val;
 479  0084 5b01          	addw	sp,#1
 480  0086 81            	ret	
 519                     ; 91 void rc_lse_ptc_make_normal(uint8_t *buf) {
 520                     	switch	.text
 521  0087               _rc_lse_ptc_make_normal:
 523  0087 89            	pushw	x
 524  0088 88            	push	a
 525       00000001      OFST:	set	1
 528                     ; 92 	buf[0] = 0x80 | 
 528                     ; 93 					 (rc_lse_heatMode() << 4) |
 528                     ; 94 					 (uiInfo.id & 0x0F);
 530  0089 c60004        	ld	a,_uiInfo+4
 531  008c a40f          	and	a,#15
 532  008e 6b01          	ld	(OFST+0,sp),a
 533  0090 adda          	call	_rc_lse_heatMode
 535  0092 97            	ld	xl,a
 536  0093 a610          	ld	a,#16
 537  0095 42            	mul	x,a
 538  0096 9f            	ld	a,xl
 539  0097 aa80          	or	a,#128
 540  0099 1e02          	ldw	x,(OFST+1,sp)
 541  009b 1a01          	or	a,(OFST+0,sp)
 542  009d f7            	ld	(x),a
 543                     ; 95 	if (uiInfo.tCurr < uiInfo.tSetup) {
 545  009e c60002        	ld	a,_uiInfo+2
 546  00a1 c1000e        	cp	a,_uiInfo+14
 547  00a4 2407          	jruge	L512
 548                     ; 96 		buf[1] = 0x80;
 550  00a6 a680          	ld	a,#128
 551  00a8 e701          	ld	(1,x),a
 552  00aa c60002        	ld	a,_uiInfo+2
 553  00ad               L512:
 554                     ; 99 	buf[2] = uiInfo.tCurr;
 556  00ad e702          	ld	(2,x),a
 557                     ; 100 	buf[3] = uiInfo.tSetup;
 559  00af c6000e        	ld	a,_uiInfo+14
 560  00b2 e703          	ld	(3,x),a
 561                     ; 101 	buf[4] = 0x00;
 563  00b4 6f04          	clr	(4,x)
 564                     ; 102 	buf[5] = 0x00;
 566  00b6 6f05          	clr	(5,x)
 567                     ; 103 	buf[6] = 0x00;
 569  00b8 6f06          	clr	(6,x)
 570                     ; 105 	makeLSEChecksum(buf);
 572  00ba ad89          	call	_makeLSEChecksum
 574                     ; 106 }
 577  00bc 5b03          	addw	sp,#3
 578  00be 81            	ret	
 615                     ; 108 void rc_lse_ptc_make(uint8_t *buf) {
 616                     	switch	.text
 617  00bf               _rc_lse_ptc_make:
 619  00bf 89            	pushw	x
 620       00000000      OFST:	set	0
 623                     ; 109 	if (getLSEState_check() == RC_LSE_STATE_NORMAL) {
 625  00c0 ad09          	call	_getLSEState_check
 627  00c2 4a            	dec	a
 628  00c3 2604          	jrne	L532
 629                     ; 110 		rc_lse_ptc_make_normal(buf);
 631  00c5 1e01          	ldw	x,(OFST+1,sp)
 632  00c7 adbe          	call	_rc_lse_ptc_make_normal
 634                     ; 111 		return;
 636  00c9               L532:
 637                     ; 113 }
 640  00c9 85            	popw	x
 641  00ca 81            	ret	
 665                     ; 118 uint8_t getLSEState_check(void) {
 666                     	switch	.text
 667  00cb               _getLSEState_check:
 671                     ; 119 	return lse_state_check;
 673  00cb c60000        	ld	a,_lse_state_check
 676  00ce 81            	ret	
 709                     ; 122 void setLSEState_check(uint8_t st) {
 710                     	switch	.text
 711  00cf               _setLSEState_check:
 715                     ; 123 	lse_state_check = st;
 717  00cf c70000        	ld	_lse_state_check,a
 718                     ; 124 }
 721  00d2 81            	ret	
 743                     	xdef	_rc_lse_ptc_make_normal
 744                     	xdef	_rc_lse_heatMode
 745                     	xdef	_makeLSEChecksum
 746                     	xdef	_rc_lse_ptc_check_cnt
 747                     	xdef	_rc_lse_ptc_check_rc
 748                     	xdef	_rc_lse_ptc_check_normal
 749                     	switch	.bss
 750  0000               _lse_state_check:
 751  0000 00            	ds.b	1
 752                     	xdef	_lse_state_check
 753                     	xref	__disp_mode2
 754                     	xref	_uiInfo
 755                     	xdef	_rc_lse_ptc_make
 756                     	xdef	_setLSEState_check
 757                     	xdef	_getLSEState_check
 758                     	xdef	_rc_lse_ptc_check
 778                     	end
