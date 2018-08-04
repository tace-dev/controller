   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  69                     ; 16 void hn_commax_make_checkSum(void) {
  71                     .text:	section	.text,new
  72  0000               _hn_commax_make_checkSum:
  74  0000 89            	pushw	x
  75       00000002      OFST:	set	2
  78                     ; 20 	s = 0;
  80  0001 0f01          	clr	(OFST-1,sp)
  81                     ; 21 	for (i = 0 ; i < 7 ; i++) {
  83  0003 4f            	clr	a
  84  0004 6b02          	ld	(OFST+0,sp),a
  85  0006               L72:
  86                     ; 22 		s += _ua.r[i];
  88  0006 5f            	clrw	x
  89  0007 97            	ld	xl,a
  90  0008 7b01          	ld	a,(OFST-1,sp)
  91  000a db0054        	add	a,(__ua+84,x)
  92  000d 6b01          	ld	(OFST-1,sp),a
  93                     ; 21 	for (i = 0 ; i < 7 ; i++) {
  95  000f 0c02          	inc	(OFST+0,sp)
  98  0011 7b02          	ld	a,(OFST+0,sp)
  99  0013 a107          	cp	a,#7
 100  0015 25ef          	jrult	L72
 101                     ; 25 	_ua.r[7] = s;
 103  0017 7b01          	ld	a,(OFST-1,sp)
 104  0019 c7005b        	ld	__ua+91,a
 105                     ; 26 }
 108  001c 85            	popw	x
 109  001d 81            	ret	
 146                     ; 28 void hn_commax_ptc_make_cnt_mainrc(void) {
 147                     .text:	section	.text,new
 148  0000               _hn_commax_ptc_make_cnt_mainrc:
 150  0000 89            	pushw	x
 151       00000002      OFST:	set	2
 154                     ; 31 	powertOn = 1;
 156  0001 a601          	ld	a,#1
 157  0003 6b02          	ld	(OFST+0,sp),a
 158                     ; 32 	if (packet_buf[0] == PACKET_ERROR_COUNT) {
 160  0005 c60000        	ld	a,_packet_buf
 161  0008 a11e          	cp	a,#30
 162  000a 2602          	jrne	L15
 163                     ; 33 		powertOn = 0;
 165  000c 0f02          	clr	(OFST+0,sp)
 166  000e               L15:
 167                     ; 36 	_ua.r[0] = 0x85;
 169  000e 35850054      	mov	__ua+84,#133
 170                     ; 37 	_ua.r[1] = (powertOn << 7) | (hnCnt.mode == MODE_OUT ? 1 : (1 << 1));
 172  0012 c60001        	ld	a,_hnCnt+1
 173  0015 a102          	cp	a,#2
 174  0017 2604          	jrne	L01
 175  0019 a601          	ld	a,#1
 176  001b 2002          	jra	L21
 177  001d               L01:
 178  001d a602          	ld	a,#2
 179  001f               L21:
 180  001f 6b01          	ld	(OFST-1,sp),a
 181  0021 7b02          	ld	a,(OFST+0,sp)
 182  0023 97            	ld	xl,a
 183  0024 a680          	ld	a,#128
 184  0026 42            	mul	x,a
 185  0027 9f            	ld	a,xl
 186  0028 1a01          	or	a,(OFST-1,sp)
 187  002a c70055        	ld	__ua+85,a
 188                     ; 38 	_ua.r[2] = 0x01;
 190  002d 35010056      	mov	__ua+86,#1
 191                     ; 39 	_ua.r[3] = 0x00;
 193  0031 725f0057      	clr	__ua+87
 194                     ; 40 	_ua.r[4] = 0x00;
 196  0035 725f0058      	clr	__ua+88
 197                     ; 41 	_ua.r[5] = 0x00;
 199  0039 725f0059      	clr	__ua+89
 200                     ; 42 	_ua.r[6] = 0x00;
 202  003d 725f005a      	clr	__ua+90
 203                     ; 44 	hn_commax_make_checkSum();
 205  0041 cd0000        	call	_hn_commax_make_checkSum
 207                     ; 45 }
 210  0044 85            	popw	x
 211  0045 81            	ret	
 291                     ; 47 void hn_commax_ptc_make_cnt_subrc(uint8_t id) {
 292                     .text:	section	.text,new
 293  0000               _hn_commax_ptc_make_cnt_subrc:
 295  0000 88            	push	a
 296  0001 5207          	subw	sp,#7
 297       00000007      OFST:	set	7
 300                     ; 55 	heatOn = 1;
 302  0003 a601          	ld	a,#1
 303  0005 6b04          	ld	(OFST-3,sp),a
 304                     ; 56 	if ( 	rcInfo.mode[id - 1] == MODE_STOP || 
 304                     ; 57 				rcInfo.mode[id - 1] == MODE_OUT ) {
 306  0007 5f            	clrw	x
 307  0008 7b08          	ld	a,(OFST+1,sp)
 308  000a cd00b1        	call	LC001
 309  000d a104          	cp	a,#4
 310  000f 270a          	jreq	L501
 312  0011 7b08          	ld	a,(OFST+1,sp)
 313  0013 5f            	clrw	x
 314  0014 cd00b1        	call	LC001
 315  0017 a102          	cp	a,#2
 316  0019 2602          	jrne	L301
 317  001b               L501:
 318                     ; 58 		heatOn = 0;
 320  001b 0f04          	clr	(OFST-3,sp)
 321  001d               L301:
 322                     ; 61 	mode = rcInfo.mode[id - 1] == MODE_OUT ? 1 : 0;
 324  001d 7b08          	ld	a,(OFST+1,sp)
 325  001f 5f            	clrw	x
 326  0020 cd00b1        	call	LC001
 327  0023 a102          	cp	a,#2
 328  0025 2604          	jrne	L02
 329  0027 a601          	ld	a,#1
 330  0029 2001          	jra	L22
 331  002b               L02:
 332  002b 4f            	clr	a
 333  002c               L22:
 334  002c 6b02          	ld	(OFST-5,sp),a
 335                     ; 62 	powertOn = 1;
 337  002e a601          	ld	a,#1
 338  0030 6b05          	ld	(OFST-2,sp),a
 339                     ; 63 	error_type = hn_make_errorCode();
 341  0032 cd0000        	call	_hn_make_errorCode
 343  0035 6b03          	ld	(OFST-4,sp),a
 344                     ; 64 	curTemp = rcInfo.curr_temp[id - 1] / 2;
 346  0037 5f            	clrw	x
 347  0038 7b08          	ld	a,(OFST+1,sp)
 348  003a 97            	ld	xl,a
 349  003b 5a            	decw	x
 350  003c d60000        	ld	a,(_rcInfo,x)
 351  003f 5f            	clrw	x
 352  0040 97            	ld	xl,a
 353  0041 57            	sraw	x
 354  0042 01            	rrwa	x,a
 355  0043 6b06          	ld	(OFST-1,sp),a
 356                     ; 65 	setTemp = rcInfo.setup_temp[id - 1] / 2;
 358  0045 5f            	clrw	x
 359  0046 7b08          	ld	a,(OFST+1,sp)
 360  0048 97            	ld	xl,a
 361  0049 5a            	decw	x
 362  004a d60008        	ld	a,(_rcInfo+8,x)
 363  004d 5f            	clrw	x
 364  004e 97            	ld	xl,a
 365  004f 57            	sraw	x
 366  0050 01            	rrwa	x,a
 367  0051 6b07          	ld	(OFST+0,sp),a
 368                     ; 67 	if (packet_buf[id - 1] == PACKET_ERROR_COUNT) {
 370  0053 5f            	clrw	x
 371  0054 7b08          	ld	a,(OFST+1,sp)
 372  0056 97            	ld	xl,a
 373  0057 5a            	decw	x
 374  0058 d60000        	ld	a,(_packet_buf,x)
 375  005b a11e          	cp	a,#30
 376  005d 2602          	jrne	L701
 377                     ; 68 		powertOn = 0;
 379  005f 0f05          	clr	(OFST-2,sp)
 380  0061               L701:
 381                     ; 71 	_ua.r[0] = 0x84;
 383  0061 35840054      	mov	__ua+84,#132
 384                     ; 72 	_ua.r[1] = (powertOn << 7) | (mode << 2) | heatOn;
 386  0065 7b02          	ld	a,(OFST-5,sp)
 387  0067 48            	sll	a
 388  0068 48            	sll	a
 389  0069 6b01          	ld	(OFST-6,sp),a
 390  006b 7b05          	ld	a,(OFST-2,sp)
 391  006d 97            	ld	xl,a
 392  006e a680          	ld	a,#128
 393  0070 42            	mul	x,a
 394  0071 9f            	ld	a,xl
 395  0072 1a01          	or	a,(OFST-6,sp)
 396  0074 1a04          	or	a,(OFST-3,sp)
 397  0076 c70055        	ld	__ua+85,a
 398                     ; 73 	_ua.r[2] = id;
 400  0079 7b08          	ld	a,(OFST+1,sp)
 401  007b c70056        	ld	__ua+86,a
 402                     ; 74 	_ua.r[3] = ((curTemp / 10) << 4) | (curTemp % 10);
 404  007e 5f            	clrw	x
 405  007f 7b06          	ld	a,(OFST-1,sp)
 406  0081 97            	ld	xl,a
 407  0082 a60a          	ld	a,#10
 408  0084 62            	div	x,a
 409  0085 6b01          	ld	(OFST-6,sp),a
 410  0087 a610          	ld	a,#16
 411  0089 42            	mul	x,a
 412  008a 9f            	ld	a,xl
 413  008b 1a01          	or	a,(OFST-6,sp)
 414  008d c70057        	ld	__ua+87,a
 415                     ; 75 	_ua.r[4] = ((setTemp / 10) << 4) | (setTemp % 10);
 417  0090 5f            	clrw	x
 418  0091 7b07          	ld	a,(OFST+0,sp)
 419  0093 97            	ld	xl,a
 420  0094 a60a          	ld	a,#10
 421  0096 62            	div	x,a
 422  0097 6b01          	ld	(OFST-6,sp),a
 423  0099 a610          	ld	a,#16
 424  009b 42            	mul	x,a
 425  009c 9f            	ld	a,xl
 426  009d 1a01          	or	a,(OFST-6,sp)
 427  009f c70058        	ld	__ua+88,a
 428                     ; 76 	_ua.r[5] = 0x00;
 430  00a2 725f0059      	clr	__ua+89
 431                     ; 77 	_ua.r[6] = error_type;
 433  00a6 7b03          	ld	a,(OFST-4,sp)
 434  00a8 c7005a        	ld	__ua+90,a
 435                     ; 79 	hn_commax_make_checkSum();
 437  00ab cd0000        	call	_hn_commax_make_checkSum
 439                     ; 80 }
 442  00ae 5b08          	addw	sp,#8
 443  00b0 81            	ret	
 444  00b1               LC001:
 445  00b1 97            	ld	xl,a
 446  00b2 5a            	decw	x
 447  00b3 d60010        	ld	a,(_rcInfo+16,x)
 448  00b6 81            	ret	
 528                     ; 82 void hn_commax_ptc_make_rcstate(uint8_t id) {
 529                     .text:	section	.text,new
 530  0000               _hn_commax_ptc_make_rcstate:
 532  0000 88            	push	a
 533  0001 5207          	subw	sp,#7
 534       00000007      OFST:	set	7
 537                     ; 90 	heatOn = 1;
 539  0003 a601          	ld	a,#1
 540  0005 6b04          	ld	(OFST-3,sp),a
 541                     ; 91 	if ( 	rcInfo.mode[id - 1] == MODE_STOP || 
 541                     ; 92 				rcInfo.mode[id - 1] == MODE_OUT ) {
 543  0007 5f            	clrw	x
 544  0008 7b08          	ld	a,(OFST+1,sp)
 545  000a cd00b1        	call	LC002
 546  000d a104          	cp	a,#4
 547  000f 270a          	jreq	L341
 549  0011 7b08          	ld	a,(OFST+1,sp)
 550  0013 5f            	clrw	x
 551  0014 cd00b1        	call	LC002
 552  0017 a102          	cp	a,#2
 553  0019 2602          	jrne	L141
 554  001b               L341:
 555                     ; 93 		heatOn = 0;
 557  001b 0f04          	clr	(OFST-3,sp)
 558  001d               L141:
 559                     ; 96 	mode = rcInfo.mode[id - 1] == MODE_OUT ? 1 : 0;
 561  001d 7b08          	ld	a,(OFST+1,sp)
 562  001f 5f            	clrw	x
 563  0020 cd00b1        	call	LC002
 564  0023 a102          	cp	a,#2
 565  0025 2604          	jrne	L23
 566  0027 a601          	ld	a,#1
 567  0029 2001          	jra	L43
 568  002b               L23:
 569  002b 4f            	clr	a
 570  002c               L43:
 571  002c 6b02          	ld	(OFST-5,sp),a
 572                     ; 97 	powertOn = 1;
 574  002e a601          	ld	a,#1
 575  0030 6b05          	ld	(OFST-2,sp),a
 576                     ; 98 	error_type = hn_make_errorCode();
 578  0032 cd0000        	call	_hn_make_errorCode
 580  0035 6b03          	ld	(OFST-4,sp),a
 581                     ; 99 	curTemp = rcInfo.curr_temp[id - 1] / 2;
 583  0037 5f            	clrw	x
 584  0038 7b08          	ld	a,(OFST+1,sp)
 585  003a 97            	ld	xl,a
 586  003b 5a            	decw	x
 587  003c d60000        	ld	a,(_rcInfo,x)
 588  003f 5f            	clrw	x
 589  0040 97            	ld	xl,a
 590  0041 57            	sraw	x
 591  0042 01            	rrwa	x,a
 592  0043 6b06          	ld	(OFST-1,sp),a
 593                     ; 100 	setTemp = rcInfo.setup_temp[id - 1] / 2;
 595  0045 5f            	clrw	x
 596  0046 7b08          	ld	a,(OFST+1,sp)
 597  0048 97            	ld	xl,a
 598  0049 5a            	decw	x
 599  004a d60008        	ld	a,(_rcInfo+8,x)
 600  004d 5f            	clrw	x
 601  004e 97            	ld	xl,a
 602  004f 57            	sraw	x
 603  0050 01            	rrwa	x,a
 604  0051 6b07          	ld	(OFST+0,sp),a
 605                     ; 103 	if (packet_buf[id - 1] == PACKET_ERROR_COUNT) {
 607  0053 5f            	clrw	x
 608  0054 7b08          	ld	a,(OFST+1,sp)
 609  0056 97            	ld	xl,a
 610  0057 5a            	decw	x
 611  0058 d60000        	ld	a,(_packet_buf,x)
 612  005b a11e          	cp	a,#30
 613  005d 2602          	jrne	L541
 614                     ; 104 		powertOn = 0;
 616  005f 0f05          	clr	(OFST-2,sp)
 617  0061               L541:
 618                     ; 107 	_ua.r[0] = 0x82;
 620  0061 35820054      	mov	__ua+84,#130
 621                     ; 108 	_ua.r[1] = (powertOn << 7) | (mode << 2) | heatOn ;
 623  0065 7b02          	ld	a,(OFST-5,sp)
 624  0067 48            	sll	a
 625  0068 48            	sll	a
 626  0069 6b01          	ld	(OFST-6,sp),a
 627  006b 7b05          	ld	a,(OFST-2,sp)
 628  006d 97            	ld	xl,a
 629  006e a680          	ld	a,#128
 630  0070 42            	mul	x,a
 631  0071 9f            	ld	a,xl
 632  0072 1a01          	or	a,(OFST-6,sp)
 633  0074 1a04          	or	a,(OFST-3,sp)
 634  0076 c70055        	ld	__ua+85,a
 635                     ; 109 	_ua.r[2] = id;
 637  0079 7b08          	ld	a,(OFST+1,sp)
 638  007b c70056        	ld	__ua+86,a
 639                     ; 110 	_ua.r[3] = ((curTemp / 10) << 4) | (curTemp % 10);
 641  007e 5f            	clrw	x
 642  007f 7b06          	ld	a,(OFST-1,sp)
 643  0081 97            	ld	xl,a
 644  0082 a60a          	ld	a,#10
 645  0084 62            	div	x,a
 646  0085 6b01          	ld	(OFST-6,sp),a
 647  0087 a610          	ld	a,#16
 648  0089 42            	mul	x,a
 649  008a 9f            	ld	a,xl
 650  008b 1a01          	or	a,(OFST-6,sp)
 651  008d c70057        	ld	__ua+87,a
 652                     ; 111 	_ua.r[4] = ((setTemp / 10) << 4) | (setTemp % 10);
 654  0090 5f            	clrw	x
 655  0091 7b07          	ld	a,(OFST+0,sp)
 656  0093 97            	ld	xl,a
 657  0094 a60a          	ld	a,#10
 658  0096 62            	div	x,a
 659  0097 6b01          	ld	(OFST-6,sp),a
 660  0099 a610          	ld	a,#16
 661  009b 42            	mul	x,a
 662  009c 9f            	ld	a,xl
 663  009d 1a01          	or	a,(OFST-6,sp)
 664  009f c70058        	ld	__ua+88,a
 665                     ; 112 	_ua.r[5] = 0x00;
 667  00a2 725f0059      	clr	__ua+89
 668                     ; 113 	_ua.r[6] = error_type;
 670  00a6 7b03          	ld	a,(OFST-4,sp)
 671  00a8 c7005a        	ld	__ua+90,a
 672                     ; 115 	hn_commax_make_checkSum();
 674  00ab cd0000        	call	_hn_commax_make_checkSum
 676                     ; 116 }
 679  00ae 5b08          	addw	sp,#8
 680  00b0 81            	ret	
 681  00b1               LC002:
 682  00b1 97            	ld	xl,a
 683  00b2 5a            	decw	x
 684  00b3 d60010        	ld	a,(_rcInfo+16,x)
 685  00b6 81            	ret	
 712                     ; 118 void hn_commax_ptc_make_cnt_init(void) {
 713                     .text:	section	.text,new
 714  0000               _hn_commax_ptc_make_cnt_init:
 718                     ; 119 	_ua.r[0] = 0x8F;
 720  0000 358f0054      	mov	__ua+84,#143
 721                     ; 120 	_ua.r[1] = 0x01;  // 귀뚜라미
 723  0004 35010055      	mov	__ua+85,#1
 724                     ; 121 	_ua.r[2] = 0x03;
 726  0008 35030056      	mov	__ua+86,#3
 727                     ; 122 	_ua.r[3] = 0x05;
 729  000c 35050057      	mov	__ua+87,#5
 730                     ; 123 	_ua.r[4] = 0x40;
 732  0010 35400058      	mov	__ua+88,#64
 733                     ; 124 	_ua.r[5] = funcInfo.cnt;
 735  0014 55000b0059    	mov	__ua+89,_funcInfo+11
 736                     ; 125 	_ua.r[6] = 0x00;
 738  0019 725f005a      	clr	__ua+90
 739                     ; 127 	hn_commax_make_checkSum();
 742                     ; 128 }
 745  001d cc0000        	jp	_hn_commax_make_checkSum
 786                     ; 132 uint8_t hn_commax_check_checkSum(void) {
 787                     .text:	section	.text,new
 788  0000               _hn_commax_check_checkSum:
 790  0000 89            	pushw	x
 791       00000002      OFST:	set	2
 794                     ; 136 	s = 0;
 796  0001 0f01          	clr	(OFST-1,sp)
 797                     ; 137 	for (i = 0 ; i < 7 ; i++) {
 799  0003 4f            	clr	a
 800  0004 6b02          	ld	(OFST+0,sp),a
 801  0006               L571:
 802                     ; 138 		s += _ua.b[i];
 804  0006 5f            	clrw	x
 805  0007 97            	ld	xl,a
 806  0008 7b01          	ld	a,(OFST-1,sp)
 807  000a db0004        	add	a,(__ua+4,x)
 808  000d 6b01          	ld	(OFST-1,sp),a
 809                     ; 137 	for (i = 0 ; i < 7 ; i++) {
 811  000f 0c02          	inc	(OFST+0,sp)
 814  0011 7b02          	ld	a,(OFST+0,sp)
 815  0013 a107          	cp	a,#7
 816  0015 25ef          	jrult	L571
 817                     ; 141 	if (s == _ua.b[7]) {
 819  0017 7b01          	ld	a,(OFST-1,sp)
 820  0019 c1000b        	cp	a,__ua+11
 821  001c 2604          	jrne	L302
 822                     ; 142 		return 1;
 824  001e a601          	ld	a,#1
 826  0020 2001          	jra	L05
 827  0022               L302:
 828                     ; 145 	return 0;
 830  0022 4f            	clr	a
 832  0023               L05:
 834  0023 85            	popw	x
 835  0024 81            	ret	
 886                     ; 148 void hn_commax_ptc_check_cnt_mainrc(void) {
 887                     .text:	section	.text,new
 888  0000               _hn_commax_ptc_check_cnt_mainrc:
 890  0000 89            	pushw	x
 891       00000002      OFST:	set	2
 894                     ; 153 	id = 0x01;
 896  0001 a601          	ld	a,#1
 897  0003 6b01          	ld	(OFST-1,sp),a
 898                     ; 154 	mode = _ua.b[2];
 900  0005 c60006        	ld	a,__ua+6
 901  0008 6b02          	ld	(OFST+0,sp),a
 902                     ; 156 	if (mode == 0x01) {
 904  000a 4a            	dec	a
 905  000b 260a          	jrne	L522
 906                     ; 157 		rc_mode = MODE_OUT;
 908  000d a602          	ld	a,#2
 909  000f 6b02          	ld	(OFST+0,sp),a
 910                     ; 158 		hnCnt.setup_temp = 0;
 912  0011 725f0002      	clr	_hnCnt+2
 914  0015 2008          	jra	L722
 915  0017               L522:
 916                     ; 160 		rc_mode = MODE_HOT;
 918  0017 a601          	ld	a,#1
 919  0019 6b02          	ld	(OFST+0,sp),a
 920                     ; 161 		hnCnt.setup_temp = 0xFF;		
 922  001b 35ff0002      	mov	_hnCnt+2,#255
 923  001f               L722:
 924                     ; 164 	hnCnt.mode = rc_mode;
 926  001f c70001        	ld	_hnCnt+1,a
 927                     ; 165 	hnCnt.id = id;
 929  0022 7b01          	ld	a,(OFST-1,sp)
 930  0024 c70000        	ld	_hnCnt,a
 931                     ; 167 	msg_hn = 1;
 933  0027 35010000      	mov	_msg_hn,#1
 934                     ; 169 	hn_commax_ptc_make_cnt_mainrc();
 936  002b cd0000        	call	_hn_commax_ptc_make_cnt_mainrc
 938                     ; 170 	COMMAX_SEND
 940  002e 35080003      	mov	__ua+3,#8
 943  0032 350100a4      	mov	__ua+164,#1
 946  0036 351400a5      	mov	__ua+165,#20
 947                     ; 171 }
 950  003a 85            	popw	x
 951  003b 81            	ret	
1017                     ; 173 void hn_commax_ptc_check_cnt_subrc(void) {
1018                     .text:	section	.text,new
1019  0000               _hn_commax_ptc_check_cnt_subrc:
1021  0000 5203          	subw	sp,#3
1022       00000003      OFST:	set	3
1025                     ; 180 	id = _ua.b[1];
1027  0002 c60005        	ld	a,__ua+5
1028  0005 6b01          	ld	(OFST-2,sp),a
1029                     ; 181 	mode = _ua.b[2];
1031  0007 c60006        	ld	a,__ua+6
1032  000a 6b02          	ld	(OFST-1,sp),a
1033                     ; 182 	comm = _ua.b[3];
1035  000c c60007        	ld	a,__ua+7
1036  000f 6b03          	ld	(OFST+0,sp),a
1037                     ; 184 	if (mode == 0x03) {
1039  0011 7b02          	ld	a,(OFST-1,sp)
1040  0013 a103          	cp	a,#3
1041  0015 260c          	jrne	L552
1042                     ; 185 		rc_mode = MODE_HOT;
1044  0017 a601          	ld	a,#1
1045  0019 6b02          	ld	(OFST-1,sp),a
1046                     ; 186 		set_temp = hn_ptc_16To10(comm) * 2;
1048  001b 7b03          	ld	a,(OFST+0,sp)
1049  001d cd0000        	call	_hn_ptc_16To10
1051  0020 48            	sll	a
1053  0021 2014          	jp	LC003
1054  0023               L552:
1055                     ; 188 		if ((comm & 0x01) == 0) {
1057  0023 7b03          	ld	a,(OFST+0,sp)
1058  0025 a501          	bcp	a,#1
1059  0027 2608          	jrne	L162
1060                     ; 189 			rc_mode = MODE_STOP;
1062  0029 a604          	ld	a,#4
1063  002b 6b02          	ld	(OFST-1,sp),a
1064                     ; 190 			set_temp = 0;
1066  002d 0f03          	clr	(OFST+0,sp)
1068  002f 2008          	jra	L752
1069  0031               L162:
1070                     ; 192 			rc_mode = MODE_HOT;
1072  0031 a601          	ld	a,#1
1073  0033 6b02          	ld	(OFST-1,sp),a
1074                     ; 193 			set_temp = 0xFF;
1076  0035 a6ff          	ld	a,#255
1077  0037               LC003:
1078  0037 6b03          	ld	(OFST+0,sp),a
1079  0039               L752:
1080                     ; 197 	hnCnt.mode = rc_mode;
1082  0039 7b02          	ld	a,(OFST-1,sp)
1083  003b c70001        	ld	_hnCnt+1,a
1084                     ; 198 	hnCnt.id = id;
1086  003e 7b01          	ld	a,(OFST-2,sp)
1087  0040 c70000        	ld	_hnCnt,a
1088                     ; 199 	hnCnt.setup_temp = set_temp;
1090  0043 7b03          	ld	a,(OFST+0,sp)
1091  0045 c70002        	ld	_hnCnt+2,a
1092                     ; 201 	msg_hn = 1;
1094  0048 35010000      	mov	_msg_hn,#1
1095                     ; 203 	hn_commax_ptc_make_cnt_subrc(id);
1097  004c 7b01          	ld	a,(OFST-2,sp)
1098  004e cd0000        	call	_hn_commax_ptc_make_cnt_subrc
1100                     ; 204 	COMMAX_SEND
1102  0051 35080003      	mov	__ua+3,#8
1105  0055 350100a4      	mov	__ua+164,#1
1108  0059 351400a5      	mov	__ua+165,#20
1109                     ; 205 }
1112  005d 5b03          	addw	sp,#3
1113  005f 81            	ret	
1148                     ; 207 void hn_commax_ptc_check_rcstate(void) {
1149                     .text:	section	.text,new
1150  0000               _hn_commax_ptc_check_rcstate:
1152  0000 88            	push	a
1153       00000001      OFST:	set	1
1156                     ; 209 	id = _ua.b[1];
1158  0001 c60005        	ld	a,__ua+5
1159  0004 6b01          	ld	(OFST+0,sp),a
1160                     ; 211 	hn_commax_ptc_make_rcstate(id);
1162  0006 cd0000        	call	_hn_commax_ptc_make_rcstate
1164                     ; 212 	COMMAX_SEND
1166  0009 35080003      	mov	__ua+3,#8
1169  000d 350100a4      	mov	__ua+164,#1
1172  0011 351400a5      	mov	__ua+165,#20
1173                     ; 213 }
1176  0015 84            	pop	a
1177  0016 81            	ret	
1203                     ; 215 void hn_commax_ptc_check_cnt_init(void) {
1204                     .text:	section	.text,new
1205  0000               _hn_commax_ptc_check_cnt_init:
1209                     ; 217 	hn_commax_ptc_make_cnt_init();
1211  0000 cd0000        	call	_hn_commax_ptc_make_cnt_init
1213                     ; 218 	COMMAX_SEND
1215  0003 35080003      	mov	__ua+3,#8
1218  0007 350100a4      	mov	__ua+164,#1
1221  000b 351400a5      	mov	__ua+165,#20
1222                     ; 219 }
1225  000f 81            	ret	
1261                     ; 221 void hn_commax_ptc_check(void) {
1262                     .text:	section	.text,new
1263  0000               _hn_commax_ptc_check:
1267                     ; 222 	if (hn_buf_count == 15) {
1269  0000 c60000        	ld	a,_hn_buf_count
1270  0003 a10f          	cp	a,#15
1271  0005 2604          	jrne	L333
1272                     ; 223 		hn_buf_count = 0;
1274  0007 725f0000      	clr	_hn_buf_count
1275  000b               L333:
1276                     ; 226 	if (hn_commax_check_checkSum() != 1) {
1278  000b cd0000        	call	_hn_commax_check_checkSum
1280  000e 4a            	dec	a
1281  000f 270c          	jreq	L533
1282                     ; 227 		hn_error_checksum = 1;
1284  0011 35010000      	mov	_hn_error_checksum,#1
1285                     ; 228 		hn_buf_error[hn_buf_count++] = 1;
1287  0015 ad4b          	call	LC004
1288  0017 a601          	ld	a,#1
1289  0019 d70000        	ld	(_hn_buf_error,x),a
1290                     ; 229 		return;
1293  001c 81            	ret	
1294  001d               L533:
1295                     ; 232 	hn_error_checksum = 0;
1297  001d c70000        	ld	_hn_error_checksum,a
1298                     ; 233 	hn_type = HN_TYPE_COMMAX;
1300  0020 35010000      	mov	_hn_type,#1
1301                     ; 234 	hn_connect = 0;
1303  0024 c70000        	ld	_hn_connect,a
1304                     ; 236 	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크
1306  0027 35010000      	mov	_ext_hn_error,#1
1307                     ; 238 	switch(_ua.b[0]) {
1309  002b c60004        	ld	a,__ua+4
1311                     ; 255 		default:
1311                     ; 256 			
1311                     ; 257 			break;
1312  002e a002          	sub	a,#2
1313  0030 270c          	jreq	L113
1314  0032 a002          	sub	a,#2
1315  0034 2711          	jreq	L313
1316  0036 4a            	dec	a
1317  0037 2717          	jreq	L513
1318  0039 a00a          	sub	a,#10
1319  003b 271c          	jreq	L713
1321  003d 81            	ret	
1322  003e               L113:
1323                     ; 239 		case 0x02:
1323                     ; 240 			hn_buf_error[hn_buf_count++] = 0;
1325  003e ad22          	call	LC004
1326  0040 724f0000      	clr	(_hn_buf_error,x)
1327                     ; 241 			hn_commax_ptc_check_rcstate();
1330                     ; 242 			break;
1333  0044 cc0000        	jp	_hn_commax_ptc_check_rcstate
1334  0047               L313:
1335                     ; 243 		case 0x04:
1335                     ; 244 			hn_buf_error[hn_buf_count++] = 0;
1337  0047 ad19          	call	LC004
1338  0049 724f0000      	clr	(_hn_buf_error,x)
1339                     ; 245 			hn_commax_ptc_check_cnt_subrc();
1342                     ; 246 			break;
1345  004d cc0000        	jp	_hn_commax_ptc_check_cnt_subrc
1346  0050               L513:
1347                     ; 247 		case 0x05:
1347                     ; 248 			hn_buf_error[hn_buf_count++] = 0;
1349  0050 ad10          	call	LC004
1350  0052 724f0000      	clr	(_hn_buf_error,x)
1351                     ; 249 			hn_commax_ptc_check_cnt_mainrc();
1354                     ; 250 			break;
1357  0056 cc0000        	jp	_hn_commax_ptc_check_cnt_mainrc
1358  0059               L713:
1359                     ; 251 		case 0x0F:
1359                     ; 252 			hn_buf_error[hn_buf_count++] = 0;
1361  0059 ad07          	call	LC004
1362  005b 724f0000      	clr	(_hn_buf_error,x)
1363                     ; 253 			hn_commax_ptc_check_cnt_init();
1366                     ; 254 			break;
1368                     ; 255 		default:
1368                     ; 256 			
1368                     ; 257 			break;
1370                     ; 259 }
1373  005f cc0000        	jp	_hn_commax_ptc_check_cnt_init
1374  0062               LC004:
1375  0062 c60000        	ld	a,_hn_buf_count
1376  0065 725c0000      	inc	_hn_buf_count
1377  0069 5f            	clrw	x
1378  006a 97            	ld	xl,a
1379  006b 81            	ret	
1392                     	xdef	_hn_commax_ptc_check_cnt_init
1393                     	xdef	_hn_commax_ptc_check_rcstate
1394                     	xdef	_hn_commax_ptc_check_cnt_subrc
1395                     	xdef	_hn_commax_ptc_check_cnt_mainrc
1396                     	xdef	_hn_commax_check_checkSum
1397                     	xdef	_hn_commax_ptc_make_cnt_init
1398                     	xdef	_hn_commax_ptc_make_rcstate
1399                     	xdef	_hn_commax_ptc_make_cnt_subrc
1400                     	xdef	_hn_commax_ptc_make_cnt_mainrc
1401                     	xdef	_hn_commax_make_checkSum
1402                     	xref	_packet_buf
1403                     	xref	_msg_hn
1404                     	xref	_hnCnt
1405                     	xref	_rcInfo
1406                     	xref	_funcInfo
1407                     	xref	__ua
1408                     	xdef	_hn_commax_ptc_check
1409                     	xref	_hn_ptc_16To10
1410                     	xref	_hn_make_errorCode
1411                     	xref	_hn_buf_count
1412                     	xref	_hn_buf_error
1413                     	xref	_hn_error_checksum
1414                     	xref	_hn_type
1415                     	xref	_hn_connect
1416                     	xref	_ext_hn_error
1435                     	end
