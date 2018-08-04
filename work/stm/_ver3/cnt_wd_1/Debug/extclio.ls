   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  69                     ; 33 void hn_clio_make_checkSum(void) {
  71                     .text:	section	.text,new
  72  0000               _hn_clio_make_checkSum:
  74  0000 89            	pushw	x
  75       00000002      OFST:	set	2
  78                     ; 37 	s = 0;
  80  0001 0f01          	clr	(OFST-1,sp)
  81                     ; 38 	for (i = 0 ; i < 24 ; i++) {
  83  0003 4f            	clr	a
  84  0004 6b02          	ld	(OFST+0,sp),a
  85  0006               L72:
  86                     ; 39 		s ^= _ua.r[i];
  88  0006 5f            	clrw	x
  89  0007 97            	ld	xl,a
  90  0008 7b01          	ld	a,(OFST-1,sp)
  91  000a d80054        	xor	a,(__ua+84,x)
  92  000d 6b01          	ld	(OFST-1,sp),a
  93                     ; 38 	for (i = 0 ; i < 24 ; i++) {
  95  000f 0c02          	inc	(OFST+0,sp)
  98  0011 7b02          	ld	a,(OFST+0,sp)
  99  0013 a118          	cp	a,#24
 100  0015 25ef          	jrult	L72
 101                     ; 42 	_ua.r[24] = s;
 103  0017 7b01          	ld	a,(OFST-1,sp)
 104  0019 c7006c        	ld	__ua+108,a
 105                     ; 43 }
 108  001c 85            	popw	x
 109  001d 81            	ret	
 147                     ; 45 void hn_clio_ptc_make(void) {
 148                     .text:	section	.text,new
 149  0000               _hn_clio_ptc_make:
 151  0000 88            	push	a
 152       00000001      OFST:	set	1
 155                     ; 48 	for (i = 0 ; i < 26 ; i++) {
 157  0001 4f            	clr	a
 158  0002 6b01          	ld	(OFST+0,sp),a
 159  0004               L76:
 160                     ; 49 		switch (i) {
 163                     ; 76 				break;
 164  0004 4a            	dec	a
 165  0005 271a          	jreq	L53
 166  0007 a003          	sub	a,#3
 167  0009 271e          	jreq	L73
 168  000b a011          	sub	a,#17
 169  000d 2741          	jreq	L14
 170  000f 4a            	dec	a
 171  0010 2747          	jreq	L34
 172  0012 4a            	dec	a
 173  0013 274d          	jreq	L54
 174  0015 4a            	dec	a
 175  0016 2756          	jreq	L74
 176                     ; 74 			default:
 176                     ; 75 				_ua.r[i] = _ua.b[i];
 178  0018 7b01          	ld	a,(OFST+0,sp)
 179  001a 5f            	clrw	x
 180  001b 97            	ld	xl,a
 181  001c d60004        	ld	a,(__ua+4,x)
 182                     ; 76 				break;
 184  001f 2048          	jp	LC001
 185  0021               L53:
 186                     ; 50 			case 1:
 186                     ; 51 				_ua.r[i] = 0x10;
 188  0021 7b01          	ld	a,(OFST+0,sp)
 189  0023 5f            	clrw	x
 190  0024 97            	ld	xl,a
 191  0025 a610          	ld	a,#16
 192                     ; 52 				break;
 194  0027 2040          	jp	LC001
 195  0029               L73:
 196                     ; 53 			case 4:
 196                     ; 54 				_ua.r[i] = 0x00;
 198  0029 7b01          	ld	a,(OFST+0,sp)
 199  002b 5f            	clrw	x
 200  002c 97            	ld	xl,a
 201  002d 724f0054      	clr	(__ua+84,x)
 202                     ; 56 				if (funcInfo.error_type == ERROR_TYPE_BOILER) {
 204  0031 c60009        	ld	a,_funcInfo+9
 205  0034 a101          	cp	a,#1
 206  0036 260b          	jrne	L101
 207                     ; 57 					_ua.r[i] = funcInfo.error + 70;
 209  0038 7b01          	ld	a,(OFST+0,sp)
 210  003a 5f            	clrw	x
 211  003b 97            	ld	xl,a
 212  003c c60008        	ld	a,_funcInfo+8
 213  003f ab46          	add	a,#70
 215  0041 2026          	jp	LC001
 216  0043               L101:
 217                     ; 58 				} else if (funcInfo.error_type == ERROR_TYPE_CNT) {
 219  0043 a102          	cp	a,#2
 220  0045 262a          	jrne	L77
 221                     ; 59 					_ua.r[i] = funcInfo.error;
 223  0047 7b01          	ld	a,(OFST+0,sp)
 224  0049 5f            	clrw	x
 225  004a 97            	ld	xl,a
 226  004b c60008        	ld	a,_funcInfo+8
 227  004e 2019          	jp	LC001
 228  0050               L14:
 229                     ; 62 			case 21:
 229                     ; 63 				_ua.r[i] = bData1_r;
 231  0050 7b01          	ld	a,(OFST+0,sp)
 232  0052 5f            	clrw	x
 233  0053 97            	ld	xl,a
 234  0054 c60002        	ld	a,_bData1_r
 235                     ; 64 				break;
 237  0057 2010          	jp	LC001
 238  0059               L34:
 239                     ; 65 			case 22:
 239                     ; 66 				_ua.r[i] = bData2_r;
 241  0059 7b01          	ld	a,(OFST+0,sp)
 242  005b 5f            	clrw	x
 243  005c 97            	ld	xl,a
 244  005d c60001        	ld	a,_bData2_r
 245                     ; 67 				break;
 247  0060 2007          	jp	LC001
 248  0062               L54:
 249                     ; 68 			case 23:
 249                     ; 69 				_ua.r[i] = bData3_r;
 251  0062 7b01          	ld	a,(OFST+0,sp)
 252  0064 5f            	clrw	x
 253  0065 97            	ld	xl,a
 254  0066 c60000        	ld	a,_bData3_r
 255  0069               LC001:
 256  0069 d70054        	ld	(__ua+84,x),a
 257                     ; 70 				break;
 259  006c 2003          	jra	L77
 260  006e               L74:
 261                     ; 71 			case 24:
 261                     ; 72 				hn_clio_make_checkSum();
 263  006e cd0000        	call	_hn_clio_make_checkSum
 265                     ; 73 				break;
 267  0071               L77:
 268                     ; 48 	for (i = 0 ; i < 26 ; i++) {
 270  0071 0c01          	inc	(OFST+0,sp)
 273  0073 7b01          	ld	a,(OFST+0,sp)
 274  0075 a11a          	cp	a,#26
 275  0077 258b          	jrult	L76
 276                     ; 80 	CLIO_SEND
 278  0079 351a0003      	mov	__ua+3,#26
 281  007d 350100a4      	mov	__ua+164,#1
 284  0081 350500a5      	mov	__ua+165,#5
 285                     ; 81 }
 288  0085 84            	pop	a
 289  0086 81            	ret	
 330                     ; 85 uint8_t hn_clio_check_checkSum(void) {
 331                     .text:	section	.text,new
 332  0000               _hn_clio_check_checkSum:
 334  0000 89            	pushw	x
 335       00000002      OFST:	set	2
 338                     ; 89 	s = 0;
 340  0001 0f01          	clr	(OFST-1,sp)
 341                     ; 90 	for (i = 0 ; i < 24 ; i++) {
 343  0003 4f            	clr	a
 344  0004 6b02          	ld	(OFST+0,sp),a
 345  0006               L521:
 346                     ; 91 		s ^= _ua.b[i];
 348  0006 5f            	clrw	x
 349  0007 97            	ld	xl,a
 350  0008 7b01          	ld	a,(OFST-1,sp)
 351  000a d80004        	xor	a,(__ua+4,x)
 352  000d 6b01          	ld	(OFST-1,sp),a
 353                     ; 90 	for (i = 0 ; i < 24 ; i++) {
 355  000f 0c02          	inc	(OFST+0,sp)
 358  0011 7b02          	ld	a,(OFST+0,sp)
 359  0013 a118          	cp	a,#24
 360  0015 25ef          	jrult	L521
 361                     ; 94 	if (s == _ua.b[24]) {
 363  0017 7b01          	ld	a,(OFST-1,sp)
 364  0019 c1001c        	cp	a,__ua+28
 365  001c 2604          	jrne	L331
 366                     ; 95 		return 1;
 368  001e a601          	ld	a,#1
 370  0020 2001          	jra	L41
 371  0022               L331:
 372                     ; 98 	return 0;
 374  0022 4f            	clr	a
 376  0023               L41:
 378  0023 85            	popw	x
 379  0024 81            	ret	
 466                     ; 101 void hn_clio_ptc_check_rc(void) {
 467                     .text:	section	.text,new
 468  0000               _hn_clio_ptc_check_rc:
 470  0000 5207          	subw	sp,#7
 471       00000007      OFST:	set	7
 474                     ; 110 	mode = _ua.b[3];
 476                     ; 111 	op = _ua.b[4];
 478  0002 c60008        	ld	a,__ua+8
 479  0005 6b02          	ld	(OFST-5,sp),a
 480                     ; 113 	opv = 0;
 482  0007 0f03          	clr	(OFST-4,sp)
 483                     ; 114 	for (i = 0 ; i < 8 ; i++) {
 485  0009 4f            	clr	a
 486  000a 6b07          	ld	(OFST+0,sp),a
 487  000c               L561:
 488                     ; 115 		isOp = getHexToBin(op, i);
 490  000c 97            	ld	xl,a
 491  000d 7b02          	ld	a,(OFST-5,sp)
 492  000f 95            	ld	xh,a
 493  0010 cd0000        	call	_getHexToBin
 495  0013 6b06          	ld	(OFST-1,sp),a
 496                     ; 116 		if (isOp == 1) {
 498  0015 4a            	dec	a
 499  0016 2603          	jrne	L371
 500                     ; 117 			opv = 1;
 502  0018 4c            	inc	a
 503  0019 6b03          	ld	(OFST-4,sp),a
 504  001b               L371:
 505                     ; 120 		if (_ua.b[5 + i + 8] == 0x00) {
 507  001b 7b07          	ld	a,(OFST+0,sp)
 508  001d 5f            	clrw	x
 509  001e 97            	ld	xl,a
 510  001f 724d0011      	tnz	(__ua+17,x)
 511                     ; 121 			currt = 0x00;
 514  0023 270a          	jreq	L771
 515                     ; 123 			currt = CHANGE_TEMP(_ua.b[5 + i + 8]);
 517  0025 5f            	clrw	x
 518  0026 97            	ld	xl,a
 519  0027 d60011        	ld	a,(__ua+17,x)
 520  002a cd0000        	call	_hn_ptc_16To10
 522  002d 7b07          	ld	a,(OFST+0,sp)
 523  002f               L771:
 524                     ; 126 		if (_ua.b[5 + i] == 0x00) {
 526  002f 5f            	clrw	x
 527  0030 97            	ld	xl,a
 528  0031 d60009        	ld	a,(__ua+9,x)
 529                     ; 127 			setupt = 0x00;
 532  0034 270f          	jreq	L502
 533                     ; 129 			if (isOp == 1) {
 535  0036 7b06          	ld	a,(OFST-1,sp)
 536  0038 4a            	dec	a
 537  0039 260a          	jrne	L502
 538                     ; 130 				setupt = CHANGE_TEMP(_ua.b[5 + i]);
 540  003b 7b07          	ld	a,(OFST+0,sp)
 541  003d 5f            	clrw	x
 542  003e 97            	ld	xl,a
 543  003f d60009        	ld	a,(__ua+9,x)
 544  0042 cd0000        	call	_hn_ptc_16To10
 547  0045               L502:
 548                     ; 132 				setupt = 0x00;
 550                     ; 136 		packet_buf[i] = 0;
 552  0045 7b07          	ld	a,(OFST+0,sp)
 553  0047 5f            	clrw	x
 554  0048 97            	ld	xl,a
 555  0049 724f0000      	clr	(_packet_buf,x)
 556                     ; 138 		func_cnt_calcInfo(i + 1, 
 556                     ; 139 											((isOp == 1) ? MODE_HOT : MODE_STOP), 
 556                     ; 140 											0x30, 
 556                     ; 141 											((isOp == 1) ? 0x40 : 0x10));
 558  004d 7b06          	ld	a,(OFST-1,sp)
 559  004f 4a            	dec	a
 560  0050 2604          	jrne	L03
 561  0052 a640          	ld	a,#64
 562  0054 2002          	jra	L23
 563  0056               L03:
 564  0056 a610          	ld	a,#16
 565  0058               L23:
 566  0058 88            	push	a
 567  0059 4b30          	push	#48
 568  005b 7b08          	ld	a,(OFST+1,sp)
 569  005d 4a            	dec	a
 570  005e 2603          	jrne	L43
 571  0060 4c            	inc	a
 572  0061 2002          	jra	L63
 573  0063               L43:
 574  0063 a604          	ld	a,#4
 575  0065               L63:
 576  0065 97            	ld	xl,a
 577  0066 7b09          	ld	a,(OFST+2,sp)
 578  0068 4c            	inc	a
 579  0069 95            	ld	xh,a
 580  006a cd0000        	call	_func_cnt_calcInfo
 582  006d 85            	popw	x
 583                     ; 143 		rcInfo.mode[i] = (isOp == 1) ? MODE_HOT : MODE_STOP;
 585  006e 7b07          	ld	a,(OFST+0,sp)
 586  0070 5f            	clrw	x
 587  0071 97            	ld	xl,a
 588  0072 89            	pushw	x
 589  0073 7b08          	ld	a,(OFST+1,sp)
 590  0075 4a            	dec	a
 591  0076 2603          	jrne	L04
 592  0078 4c            	inc	a
 593  0079 2002          	jra	L24
 594  007b               L04:
 595  007b a604          	ld	a,#4
 596  007d               L24:
 597  007d 85            	popw	x
 598  007e d70010        	ld	(_rcInfo+16,x),a
 599                     ; 144 		rcInfo.curr_temp[i] = 0x30;
 601  0081 5f            	clrw	x
 602  0082 7b07          	ld	a,(OFST+0,sp)
 603  0084 97            	ld	xl,a
 604  0085 a630          	ld	a,#48
 605  0087 d70000        	ld	(_rcInfo,x),a
 606                     ; 145 		rcInfo.setup_temp[i] = ((isOp == 1) ? 0x40 : 0x10);
 608  008a 5f            	clrw	x
 609  008b 7b07          	ld	a,(OFST+0,sp)
 610  008d 97            	ld	xl,a
 611  008e 89            	pushw	x
 612  008f 7b08          	ld	a,(OFST+1,sp)
 613  0091 4a            	dec	a
 614  0092 2604          	jrne	L44
 615  0094 a640          	ld	a,#64
 616  0096 2002          	jra	L64
 617  0098               L44:
 618  0098 a610          	ld	a,#16
 619  009a               L64:
 620  009a 85            	popw	x
 621  009b d70008        	ld	(_rcInfo+8,x),a
 622                     ; 114 	for (i = 0 ; i < 8 ; i++) {
 624  009e 0c07          	inc	(OFST+0,sp)
 627  00a0 7b07          	ld	a,(OFST+0,sp)
 628  00a2 a108          	cp	a,#8
 629  00a4 2403cc000c    	jrult	L561
 630                     ; 148 	bData1_b = opv == 1 ? (_ua.b[21] | 0x0C) : _ua.b[21];
 632  00a9 7b03          	ld	a,(OFST-4,sp)
 633  00ab 4a            	dec	a
 634  00ac 2607          	jrne	L05
 635  00ae c60019        	ld	a,__ua+25
 636  00b1 aa0c          	or	a,#12
 637  00b3 2003          	jra	L25
 638  00b5               L05:
 639  00b5 c60019        	ld	a,__ua+25
 640  00b8               L25:
 641  00b8 c70005        	ld	_bData1_b,a
 642                     ; 149 	bData2_b = _ua.b[22];
 644  00bb 55001a0004    	mov	_bData2_b,__ua+26
 645                     ; 150 	bData3_b = _ua.b[23];
 647  00c0 55001b0003    	mov	_bData3_b,__ua+27
 648                     ; 152 	if (funcInfo.error_type != ERROR_TYPE_NONE) {
 650  00c5 c60009        	ld	a,_funcInfo+9
 651  00c8 2708          	jreq	L112
 652                     ; 153 		if (_ua.b[21] == 0x00) {
 654  00ca c60019        	ld	a,__ua+25
 655  00cd 2603          	jrne	L112
 656                     ; 155 			func_cnt_errorReset();
 658  00cf cd0000        	call	_func_cnt_errorReset
 660  00d2               L112:
 661                     ; 159 	hn_clio_ptc_make();
 663  00d2 cd0000        	call	_hn_clio_ptc_make
 665                     ; 160 }
 668  00d5 5b07          	addw	sp,#7
 669  00d7 81            	ret	
 701                     ; 162 void hn_clio_ptc_check(void) {	
 702                     .text:	section	.text,new
 703  0000               _hn_clio_ptc_check:
 707                     ; 163 	if (hn_buf_count == 15) {
 709  0000 c60000        	ld	a,_hn_buf_count
 710  0003 a10f          	cp	a,#15
 711  0005 2604          	jrne	L522
 712                     ; 164 		hn_buf_count = 0;
 714  0007 725f0000      	clr	_hn_buf_count
 715  000b               L522:
 716                     ; 167 	if (_ua.b[0] != 0x7E) {
 718  000b c60004        	ld	a,__ua+4
 719  000e a17e          	cp	a,#126
 720  0010 2702          	jreq	L722
 721                     ; 168 		hn_buf_error[hn_buf_count++] = 1;
 723  0012 2033          	jp	LC002
 724  0014               L722:
 725                     ; 172 	if (_ua.b[25] != 0xAA) {
 727  0014 c6001d        	ld	a,__ua+29
 728  0017 a1aa          	cp	a,#170
 729  0019 2702          	jreq	L132
 730                     ; 173 		hn_buf_error[hn_buf_count++] = 1;
 732  001b 202a          	jp	LC002
 733  001d               L132:
 734                     ; 177 	if (hn_clio_check_checkSum() != 1) {
 736  001d cd0000        	call	_hn_clio_check_checkSum
 738  0020 4a            	dec	a
 739  0021 2706          	jreq	L332
 740                     ; 178 		hn_error_checksum = 1;
 742  0023 35010000      	mov	_hn_error_checksum,#1
 743                     ; 179 		hn_buf_error[hn_buf_count++] = 1;
 745  0027 201e          	jp	LC002
 746  0029               L332:
 747                     ; 183 	hn_error_checksum = 0;
 749  0029 c70000        	ld	_hn_error_checksum,a
 750                     ; 184 	hn_type = HN_TYPE_CLIO;
 752  002c 35020000      	mov	_hn_type,#2
 753                     ; 185 	hn_connect = 0;
 755  0030 c70000        	ld	_hn_connect,a
 756                     ; 186 	hn_buf_error[hn_buf_count++] = 0;
 758  0033 c60000        	ld	a,_hn_buf_count
 759  0036 725c0000      	inc	_hn_buf_count
 760  003a 5f            	clrw	x
 761  003b 97            	ld	xl,a
 762                     ; 188 	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크
 764  003c 35010000      	mov	_ext_hn_error,#1
 765  0040 724f0000      	clr	(_hn_buf_error,x)
 766                     ; 190 	hn_clio_ptc_check_rc();
 769                     ; 191 }
 772  0044 cc0000        	jp	_hn_clio_ptc_check_rc
 773  0047               LC002:
 774  0047 c60000        	ld	a,_hn_buf_count
 775  004a 725c0000      	inc	_hn_buf_count
 776  004e 5f            	clrw	x
 777  004f 97            	ld	xl,a
 778  0050 a601          	ld	a,#1
 779  0052 d70000        	ld	(_hn_buf_error,x),a
 780                     ; 180 		return;
 783  0055 81            	ret	
 824                     ; 194 void hn_clio_make_checkSum_KD(void) {
 825                     .text:	section	.text,new
 826  0000               _hn_clio_make_checkSum_KD:
 828  0000 89            	pushw	x
 829       00000002      OFST:	set	2
 832                     ; 198 	s = 0;
 834  0001 0f01          	clr	(OFST-1,sp)
 835                     ; 199 	for (i = 0 ; i < 13 ; i++) {
 837  0003 4f            	clr	a
 838  0004 6b02          	ld	(OFST+0,sp),a
 839  0006               L352:
 840                     ; 200 		s ^= _ua.r[i];
 842  0006 5f            	clrw	x
 843  0007 97            	ld	xl,a
 844  0008 7b01          	ld	a,(OFST-1,sp)
 845  000a d80054        	xor	a,(__ua+84,x)
 846  000d 6b01          	ld	(OFST-1,sp),a
 847                     ; 199 	for (i = 0 ; i < 13 ; i++) {
 849  000f 0c02          	inc	(OFST+0,sp)
 852  0011 7b02          	ld	a,(OFST+0,sp)
 853  0013 a10d          	cp	a,#13
 854  0015 25ef          	jrult	L352
 855                     ; 203 	_ua.r[13] = s;
 857  0017 7b01          	ld	a,(OFST-1,sp)
 858  0019 c70061        	ld	__ua+97,a
 859                     ; 204 }
 862  001c 85            	popw	x
 863  001d 81            	ret	
 896                     ; 207 uint8_t hn_clio_temp_format_KD(uint8_t temp) {	
 897                     .text:	section	.text,new
 898  0000               _hn_clio_temp_format_KD:
 902                     ; 208 	return temp / 2;
 904  0000 5f            	clrw	x
 905  0001 97            	ld	xl,a
 906  0002 57            	sraw	x
 907  0003 9f            	ld	a,xl
 910  0004 81            	ret	
 948                     ; 211 void hn_clio_ptc_make_KD(void) {
 949                     .text:	section	.text,new
 950  0000               _hn_clio_ptc_make_KD:
 952  0000 5203          	subw	sp,#3
 953       00000003      OFST:	set	3
 956                     ; 212 	uint8_t i = 0;
 958                     ; 214 	_ua.r[0] = 0x77;
 960  0002 35770054      	mov	__ua+84,#119
 961                     ; 215 	_ua.r[1] = 0x18;
 963  0006 35180055      	mov	__ua+85,#24
 964                     ; 216 	_ua.r[2] = 0x43;
 966  000a 35430056      	mov	__ua+86,#67
 967                     ; 217 	_ua.r[3] = 0x00;
 969  000e 725f0057      	clr	__ua+87
 970                     ; 218 	_ua.r[3] = _kdInfo.boiler_state_error 
 970                     ; 219 						| ((_kdInfo.boiler_state_heat == 1) ? 0 : _kdInfo.boiler_state_shower << 1) 
 970                     ; 220 						| _kdInfo.boiler_state_heat << 2
 970                     ; 221 						| _kdInfo.boiler_state_use_shower << 5;
 972  0012 c6000f        	ld	a,__kdInfo+15
 973  0015 97            	ld	xl,a
 974  0016 a620          	ld	a,#32
 975  0018 42            	mul	x,a
 976  0019 9f            	ld	a,xl
 977  001a 6b02          	ld	(OFST-1,sp),a
 978  001c c6000c        	ld	a,__kdInfo+12
 979  001f 48            	sll	a
 980  0020 48            	sll	a
 981  0021 6b01          	ld	(OFST-2,sp),a
 982  0023 c6000c        	ld	a,__kdInfo+12
 983  0026 4a            	dec	a
 984  0027 2704          	jreq	L67
 985  0029 c6000d        	ld	a,__kdInfo+13
 986  002c 48            	sll	a
 987  002d               L67:
 988  002d ca000b        	or	a,__kdInfo+11
 989  0030 1a01          	or	a,(OFST-2,sp)
 990  0032 1a02          	or	a,(OFST-1,sp)
 991  0034 c70057        	ld	__ua+87,a
 992                     ; 223 	if (funcInfo.error_type == ERROR_TYPE_BOILER && funcInfo.error != 0) {
 994  0037 c60009        	ld	a,_funcInfo+9
 995  003a 4a            	dec	a
 996  003b 260c          	jrne	L113
 998  003d c60008        	ld	a,_funcInfo+8
 999  0040 2707          	jreq	L113
1000                     ; 224 		_ua.r[4] = funcInfo.error + 70;
1002  0042 ab46          	add	a,#70
1003  0044 c70058        	ld	__ua+88,a
1005  0047 2005          	jra	L313
1006  0049               L113:
1007                     ; 225 	} else if (funcInfo.error_type == ERROR_TYPE_CNT && funcInfo.error != 0) {
1010                     ; 226 		_ua.r[4] = funcInfo.error;
1012                     ; 228 		_ua.r[4] = funcInfo.error;
1015  0049 5500080058    	mov	__ua+88,_funcInfo+8
1016  004e               L313:
1017                     ; 231 	_ua.r[5] = hn_clio_temp_format_KD(_kdInfo.curr_water_heat);
1019  004e c60013        	ld	a,__kdInfo+19
1020  0051 cd0000        	call	_hn_clio_temp_format_KD
1022  0054 c70059        	ld	__ua+89,a
1023                     ; 233 	for (i = 6 ; i < 13 ; i++) {
1025  0057 a606          	ld	a,#6
1026  0059 6b03          	ld	(OFST+0,sp),a
1027  005b               L123:
1028                     ; 234 		_ua.r[i] = 0x00;
1030  005b 5f            	clrw	x
1031  005c 97            	ld	xl,a
1032  005d 724f0054      	clr	(__ua+84,x)
1033                     ; 233 	for (i = 6 ; i < 13 ; i++) {
1035  0061 0c03          	inc	(OFST+0,sp)
1038  0063 7b03          	ld	a,(OFST+0,sp)
1039  0065 a10d          	cp	a,#13
1040  0067 25f2          	jrult	L123
1041                     ; 245 	_ua.r[14] = 0xE7;
1043  0069 35e70062      	mov	__ua+98,#231
1044                     ; 247 	hn_clio_make_checkSum_KD();
1046  006d cd0000        	call	_hn_clio_make_checkSum_KD
1048                     ; 249 	CLIO_SEND_KD
1050  0070 350f0003      	mov	__ua+3,#15
1053  0074 350100a4      	mov	__ua+164,#1
1056  0078 350500a5      	mov	__ua+165,#5
1057                     ; 250 }
1060  007c 5b03          	addw	sp,#3
1061  007e 81            	ret	
1102                     ; 252 uint8_t hn_clio_check_checkSum_KD(void) {
1103                     .text:	section	.text,new
1104  0000               _hn_clio_check_checkSum_KD:
1106  0000 89            	pushw	x
1107       00000002      OFST:	set	2
1110                     ; 256 	s = 0;
1112  0001 0f01          	clr	(OFST-1,sp)
1113                     ; 257 	for (i = 0 ; i < 13 ; i++) {
1115  0003 4f            	clr	a
1116  0004 6b02          	ld	(OFST+0,sp),a
1117  0006               L543:
1118                     ; 258 		s ^= _ua.b[i];
1120  0006 5f            	clrw	x
1121  0007 97            	ld	xl,a
1122  0008 7b01          	ld	a,(OFST-1,sp)
1123  000a d80004        	xor	a,(__ua+4,x)
1124  000d 6b01          	ld	(OFST-1,sp),a
1125                     ; 257 	for (i = 0 ; i < 13 ; i++) {
1127  000f 0c02          	inc	(OFST+0,sp)
1130  0011 7b02          	ld	a,(OFST+0,sp)
1131  0013 a10d          	cp	a,#13
1132  0015 25ef          	jrult	L543
1133                     ; 261 	if (s == _ua.b[13]) {
1135  0017 7b01          	ld	a,(OFST-1,sp)
1136  0019 c10011        	cp	a,__ua+17
1137  001c 2604          	jrne	L353
1138                     ; 262 		return 1;
1140  001e a601          	ld	a,#1
1142  0020 2001          	jra	L601
1143  0022               L353:
1144                     ; 265 	return 0;
1146  0022 4f            	clr	a
1148  0023               L601:
1150  0023 85            	popw	x
1151  0024 81            	ret	
1207                     ; 268 void hn_clio_ptc_check_rc_KD(void) {
1208                     .text:	section	.text,new
1209  0000               _hn_clio_ptc_check_rc_KD:
1211  0000 5203          	subw	sp,#3
1212       00000003      OFST:	set	3
1215                     ; 269 	uint8_t open = 0;
1217                     ; 273 	open = _ua.b[2];
1219  0002 c60006        	ld	a,__ua+6
1220  0005 6b01          	ld	(OFST-2,sp),a
1221                     ; 275 	hnInfo_clio.boiler_on_off = (_ua.b[3] & 0x01);
1223  0007 c60007        	ld	a,__ua+7
1224  000a a401          	and	a,#1
1225  000c c70006        	ld	_hnInfo_clio,a
1226                     ; 276 	hnInfo_clio.boiler_mode_shower = (_ua.b[3] & 0x10) >> 4;
1228  000f c60007        	ld	a,__ua+7
1229  0012 4e            	swap	a
1230  0013 a401          	and	a,#1
1231  0015 c70007        	ld	_hnInfo_clio+1,a
1232                     ; 277 	hnInfo_clio.boiler_warm_up = (_ua.b[3] & 0x20) >> 5;
1234  0018 c60007        	ld	a,__ua+7
1235  001b 4e            	swap	a
1236  001c a402          	and	a,#2
1237  001e 44            	srl	a
1238  001f c70008        	ld	_hnInfo_clio+2,a
1239                     ; 278 	hnInfo_clio.boiler_water_heat = _ua.b[4];
1241  0022 5500080009    	mov	_hnInfo_clio+3,__ua+8
1242                     ; 279 	hnInfo_clio.boiler_water_shower = _ua.b[5];
1244                     ; 281 	for (i = 0 ; i < 8 ; i++) {
1246  0027 4f            	clr	a
1247  0028 550009000a    	mov	_hnInfo_clio+4,__ua+9
1248  002d 6b03          	ld	(OFST+0,sp),a
1249  002f               L573:
1250                     ; 282 		packet_buf[i] = 0;
1252  002f 5f            	clrw	x
1253  0030 97            	ld	xl,a
1254  0031 724f0000      	clr	(_packet_buf,x)
1255                     ; 283 		isOp = getHexToBin(open, i);
1257  0035 97            	ld	xl,a
1258  0036 7b01          	ld	a,(OFST-2,sp)
1259  0038 95            	ld	xh,a
1260  0039 cd0000        	call	_getHexToBin
1262                     ; 284 		if (hnInfo_clio.boiler_on_off == 0) {
1264  003c 725d0006      	tnz	_hnInfo_clio
1265  0040 2601          	jrne	L304
1266                     ; 285 			isOp = 0;
1268  0042 4f            	clr	a
1269  0043               L304:
1270  0043 6b02          	ld	(OFST-1,sp),a
1271                     ; 288 		func_cnt_calcInfo(i + 1, 
1271                     ; 289 											((isOp == 1) ? MODE_HOT : MODE_STOP), 
1271                     ; 290 											0x30, 
1271                     ; 291 											((isOp == 1) ? 0x40 : 0x10));
1273  0045 4a            	dec	a
1274  0046 2604          	jrne	L611
1275  0048 a640          	ld	a,#64
1276  004a 2002          	jra	L021
1277  004c               L611:
1278  004c a610          	ld	a,#16
1279  004e               L021:
1280  004e 88            	push	a
1281  004f 4b30          	push	#48
1282  0051 7b04          	ld	a,(OFST+1,sp)
1283  0053 4a            	dec	a
1284  0054 2603          	jrne	L221
1285  0056 4c            	inc	a
1286  0057 2002          	jra	L421
1287  0059               L221:
1288  0059 a604          	ld	a,#4
1289  005b               L421:
1290  005b 97            	ld	xl,a
1291  005c 7b05          	ld	a,(OFST+2,sp)
1292  005e 4c            	inc	a
1293  005f 95            	ld	xh,a
1294  0060 cd0000        	call	_func_cnt_calcInfo
1296  0063 85            	popw	x
1297                     ; 293 		rcInfo.mode[i] = (isOp == 1) ? MODE_HOT : MODE_STOP;
1299  0064 7b03          	ld	a,(OFST+0,sp)
1300  0066 5f            	clrw	x
1301  0067 97            	ld	xl,a
1302  0068 89            	pushw	x
1303  0069 7b04          	ld	a,(OFST+1,sp)
1304  006b 4a            	dec	a
1305  006c 2603          	jrne	L621
1306  006e 4c            	inc	a
1307  006f 2002          	jra	L031
1308  0071               L621:
1309  0071 a604          	ld	a,#4
1310  0073               L031:
1311  0073 85            	popw	x
1312  0074 d70010        	ld	(_rcInfo+16,x),a
1313                     ; 294 		rcInfo.curr_temp[i] = 0x30;
1315  0077 5f            	clrw	x
1316  0078 7b03          	ld	a,(OFST+0,sp)
1317  007a 97            	ld	xl,a
1318  007b a630          	ld	a,#48
1319  007d d70000        	ld	(_rcInfo,x),a
1320                     ; 295 		rcInfo.setup_temp[i] = ((isOp == 1) ? 0x40 : 0x10);
1322  0080 5f            	clrw	x
1323  0081 7b03          	ld	a,(OFST+0,sp)
1324  0083 97            	ld	xl,a
1325  0084 89            	pushw	x
1326  0085 7b04          	ld	a,(OFST+1,sp)
1327  0087 4a            	dec	a
1328  0088 2604          	jrne	L231
1329  008a a640          	ld	a,#64
1330  008c 2002          	jra	L431
1331  008e               L231:
1332  008e a610          	ld	a,#16
1333  0090               L431:
1334  0090 85            	popw	x
1335  0091 d70008        	ld	(_rcInfo+8,x),a
1336                     ; 281 	for (i = 0 ; i < 8 ; i++) {
1338  0094 0c03          	inc	(OFST+0,sp)
1341  0096 7b03          	ld	a,(OFST+0,sp)
1342  0098 a108          	cp	a,#8
1343  009a 2593          	jrult	L573
1344                     ; 298 	if (hnInfo_clio.boiler_on_off == 0) {
1346  009c c60006        	ld	a,_hnInfo_clio
1347  009f 2608          	jrne	L504
1348                     ; 299 		if (funcInfo.error_type != 0) {
1350  00a1 c60009        	ld	a,_funcInfo+9
1351  00a4 2703          	jreq	L504
1352                     ; 300 				func_cnt_errorReset();
1354  00a6 cd0000        	call	_func_cnt_errorReset
1356  00a9               L504:
1357                     ; 304 	hn_clio_ptc_make_KD();
1359  00a9 cd0000        	call	_hn_clio_ptc_make_KD
1361                     ; 305 }
1364  00ac 5b03          	addw	sp,#3
1365  00ae 81            	ret	
1397                     ; 307 void hn_clio_ptc_check_KD(void) {	
1398                     .text:	section	.text,new
1399  0000               _hn_clio_ptc_check_KD:
1403                     ; 308 	if (hn_buf_count == 15) {
1405  0000 c60000        	ld	a,_hn_buf_count
1406  0003 a10f          	cp	a,#15
1407  0005 2604          	jrne	L124
1408                     ; 309 		hn_buf_count = 0;
1410  0007 725f0000      	clr	_hn_buf_count
1411  000b               L124:
1412                     ; 312 	if (_ua.b[0] != 0x77) {
1414  000b c60004        	ld	a,__ua+4
1415  000e a177          	cp	a,#119
1416  0010 2702          	jreq	L324
1417                     ; 313 		hn_buf_error[hn_buf_count++] = 1;
1419  0012 2038          	jp	LC004
1420  0014               L324:
1421                     ; 317 	if (_ua.b[14] != 0xE7) {
1423  0014 c60012        	ld	a,__ua+18
1424  0017 a1e7          	cp	a,#231
1425  0019 2702          	jreq	L524
1426                     ; 318 		hn_buf_error[hn_buf_count++] = 1;
1428  001b 202f          	jp	LC004
1429  001d               L524:
1430                     ; 322 	if (_ua.b[1] != 0x81) {
1432  001d c60005        	ld	a,__ua+5
1433  0020 a181          	cp	a,#129
1434  0022 2702          	jreq	L724
1435                     ; 323 		hn_buf_error[hn_buf_count++] = 1;
1437  0024 2026          	jp	LC004
1438  0026               L724:
1439                     ; 327 	if (hn_clio_check_checkSum_KD() != 1) {
1441  0026 cd0000        	call	_hn_clio_check_checkSum_KD
1443  0029 4a            	dec	a
1444  002a 2706          	jreq	L134
1445                     ; 328 		hn_error_checksum = 1;
1447  002c 35010000      	mov	_hn_error_checksum,#1
1448                     ; 329 		hn_buf_error[hn_buf_count++] = 1;
1450  0030 201a          	jp	LC004
1451  0032               L134:
1452                     ; 333 	hn_error_checksum = 0;
1454  0032 c70000        	ld	_hn_error_checksum,a
1455                     ; 334 	hn_type = HN_TYPE_CLIO_KD;
1457  0035 35030000      	mov	_hn_type,#3
1458                     ; 335 	hn_connect = 0;
1460  0039 c70000        	ld	_hn_connect,a
1461                     ; 336 	hn_buf_error[hn_buf_count++] = 0;
1463  003c c60000        	ld	a,_hn_buf_count
1464  003f 725c0000      	inc	_hn_buf_count
1465  0043 5f            	clrw	x
1466  0044 97            	ld	xl,a
1467  0045 724f0000      	clr	(_hn_buf_error,x)
1468                     ; 338 	hn_clio_ptc_check_rc_KD();
1471                     ; 339 }
1474  0049 cc0000        	jp	_hn_clio_ptc_check_rc_KD
1475  004c               LC004:
1476  004c c60000        	ld	a,_hn_buf_count
1477  004f 725c0000      	inc	_hn_buf_count
1478  0053 5f            	clrw	x
1479  0054 97            	ld	xl,a
1480  0055 a601          	ld	a,#1
1481  0057 d70000        	ld	(_hn_buf_error,x),a
1482                     ; 330 		return;
1485  005a 81            	ret	
1595                     	xdef	_hn_clio_ptc_check_rc_KD
1596                     	xdef	_hn_clio_check_checkSum_KD
1597                     	xdef	_hn_clio_ptc_make_KD
1598                     	xdef	_hn_clio_temp_format_KD
1599                     	xdef	_hn_clio_make_checkSum_KD
1600                     	xdef	_hn_clio_ptc_check_rc
1601                     	xdef	_hn_clio_check_checkSum
1602                     	xdef	_hn_clio_ptc_make
1603                     	xdef	_hn_clio_make_checkSum
1604                     	switch	.bss
1605  0000               _bData3_r:
1606  0000 00            	ds.b	1
1607                     	xdef	_bData3_r
1608  0001               _bData2_r:
1609  0001 00            	ds.b	1
1610                     	xdef	_bData2_r
1611  0002               _bData1_r:
1612  0002 00            	ds.b	1
1613                     	xdef	_bData1_r
1614  0003               _bData3_b:
1615  0003 00            	ds.b	1
1616                     	xdef	_bData3_b
1617  0004               _bData2_b:
1618  0004 00            	ds.b	1
1619                     	xdef	_bData2_b
1620  0005               _bData1_b:
1621  0005 00            	ds.b	1
1622                     	xdef	_bData1_b
1623                     	xref	_packet_buf
1624                     	xref	__kdInfo
1625                     	xref	_func_cnt_errorReset
1626                     	xref	_func_cnt_calcInfo
1627                     	xref	_rcInfo
1628                     	xref	_funcInfo
1629                     	xref	__ua
1630                     	xdef	_hn_clio_ptc_check_KD
1631                     	xdef	_hn_clio_ptc_check
1632                     	xref	_hn_ptc_16To10
1633                     	xref	_getHexToBin
1634  0006               _hnInfo_clio:
1635  0006 0000000000    	ds.b	5
1636                     	xdef	_hnInfo_clio
1637                     	xref	_hn_buf_count
1638                     	xref	_hn_buf_error
1639                     	xref	_hn_error_checksum
1640                     	xref	_hn_type
1641                     	xref	_hn_connect
1642                     	xref	_ext_hn_error
1662                     	end
