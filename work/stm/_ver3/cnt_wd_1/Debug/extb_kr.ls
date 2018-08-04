   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _kr_error_reset:
  25  0000 00            	dc.b	0
  26  0001               _kr_error_reset_count:
  27  0001 02            	dc.b	2
  74                     ; 28 uint8_t br_kr_check_checkSum(void) {
  76                     .text:	section	.text,new
  77  0000               _br_kr_check_checkSum:
  79  0000 89            	pushw	x
  80       00000002      OFST:	set	2
  83                     ; 32 	s = 0;
  85  0001 0f01          	clr	(OFST-1,sp)
  86                     ; 33 	for (i = 0 ; i < 4 ; i++) {
  88  0003 4f            	clr	a
  89  0004 6b02          	ld	(OFST+0,sp),a
  90  0006               L72:
  91                     ; 34 		s ^= _ub.b[i];
  93  0006 5f            	clrw	x
  94  0007 97            	ld	xl,a
  95  0008 7b01          	ld	a,(OFST-1,sp)
  96  000a d80004        	xor	a,(__ub+4,x)
  97  000d 6b01          	ld	(OFST-1,sp),a
  98                     ; 33 	for (i = 0 ; i < 4 ; i++) {
 100  000f 0c02          	inc	(OFST+0,sp)
 103  0011 7b02          	ld	a,(OFST+0,sp)
 104  0013 a104          	cp	a,#4
 105  0015 25ef          	jrult	L72
 106                     ; 37 	if (s == _ub.b[4]) {
 108  0017 7b01          	ld	a,(OFST-1,sp)
 109  0019 c10008        	cp	a,__ub+8
 110  001c 2604          	jrne	L53
 111                     ; 38 		return 1;
 113  001e a601          	ld	a,#1
 115  0020 2001          	jra	L6
 116  0022               L53:
 117                     ; 41 	return 0;
 119  0022 4f            	clr	a
 121  0023               L6:
 123  0023 85            	popw	x
 124  0024 81            	ret	
 171                     ; 44 uint8_t br_kr_ptc_change_BCD(uint8_t val) {
 172                     .text:	section	.text,new
 173  0000               _br_kr_ptc_change_BCD:
 175  0000 88            	push	a
 176  0001 89            	pushw	x
 177       00000002      OFST:	set	2
 180                     ; 48 	a = val / 10;
 182  0002 5f            	clrw	x
 183  0003 97            	ld	xl,a
 184  0004 a60a          	ld	a,#10
 185  0006 62            	div	x,a
 186  0007 9f            	ld	a,xl
 187  0008 6b01          	ld	(OFST-1,sp),a
 188                     ; 49 	b = val % 10;
 190  000a 5f            	clrw	x
 191  000b 7b03          	ld	a,(OFST+1,sp)
 192  000d 97            	ld	xl,a
 193  000e a60a          	ld	a,#10
 194  0010 62            	div	x,a
 195  0011 6b02          	ld	(OFST+0,sp),a
 196                     ; 51 	return (a << 4) | b;
 198  0013 7b01          	ld	a,(OFST-1,sp)
 199  0015 97            	ld	xl,a
 200  0016 a610          	ld	a,#16
 201  0018 42            	mul	x,a
 202  0019 9f            	ld	a,xl
 203  001a 1a02          	or	a,(OFST+0,sp)
 206  001c 5b03          	addw	sp,#3
 207  001e 81            	ret	
 254                     ; 54 uint8_t br_kr_ptc_change_BCDToHex(uint8_t val) {
 255                     .text:	section	.text,new
 256  0000               _br_kr_ptc_change_BCDToHex:
 258  0000 88            	push	a
 259  0001 89            	pushw	x
 260       00000002      OFST:	set	2
 263                     ; 58 	a = (val & 0xF0) >> 4;
 265  0002 4e            	swap	a
 266  0003 a40f          	and	a,#15
 267  0005 6b01          	ld	(OFST-1,sp),a
 268                     ; 59 	b = (val & 0x0F);
 270  0007 7b03          	ld	a,(OFST+1,sp)
 271  0009 a40f          	and	a,#15
 272  000b 6b02          	ld	(OFST+0,sp),a
 273                     ; 61 	return b + (a * 10);
 275  000d 7b01          	ld	a,(OFST-1,sp)
 276  000f 97            	ld	xl,a
 277  0010 a60a          	ld	a,#10
 278  0012 42            	mul	x,a
 279  0013 9f            	ld	a,xl
 280  0014 1b02          	add	a,(OFST+0,sp)
 283  0016 5b03          	addw	sp,#3
 284  0018 81            	ret	
 314                     ; 64 uint8_t br_kr_ptc_baseCheck(void) {
 315                     .text:	section	.text,new
 316  0000               _br_kr_ptc_baseCheck:
 320                     ; 65 	if (br_buf_count == 15) {
 322  0000 c60000        	ld	a,_br_buf_count
 323  0003 a10f          	cp	a,#15
 324  0005 2604          	jrne	L701
 325                     ; 66 		br_buf_count = 0;
 327  0007 725f0000      	clr	_br_buf_count
 328  000b               L701:
 329                     ; 69 	if(_ub.b[0] != 0x02) {
 331  000b c60004        	ld	a,__ub+4
 332  000e a102          	cp	a,#2
 333  0010 2702          	jreq	L111
 334                     ; 70 		br_buf_error[br_buf_count++] = 1;
 336  0012 2022          	jp	LC001
 337  0014               L111:
 338                     ; 74 	if(_ub.b[5] != 0x03) {
 340  0014 c60009        	ld	a,__ub+9
 341  0017 a103          	cp	a,#3
 342  0019 2702          	jreq	L311
 343                     ; 75 		br_buf_error[br_buf_count++] = 1;
 345  001b 2019          	jp	LC001
 346  001d               L311:
 347                     ; 79 	if (br_kr_check_checkSum() != 1) {
 349  001d cd0000        	call	_br_kr_check_checkSum
 351  0020 4a            	dec	a
 352  0021 2706          	jreq	L511
 353                     ; 80 		br_error_checksum = 1;
 355  0023 35010000      	mov	_br_error_checksum,#1
 356                     ; 81 		br_buf_error[br_buf_count++] = 1;
 358  0027 200d          	jp	LC001
 359  0029               L511:
 360                     ; 85 	br_error_checksum = 0;
 362  0029 c70000        	ld	_br_error_checksum,a
 363                     ; 86 	br_buf_error[br_buf_count++] = 0;
 365  002c ad0f          	call	LC002
 366  002e 724f0000      	clr	(_br_buf_error,x)
 367  0032 c70000        	ld	_ext_br_error,a
 368                     ; 89 	return 1;
 372  0035 81            	ret	
 373  0036               LC001:
 374  0036 ad05          	call	LC002
 375  0038 d70000        	ld	(_br_buf_error,x),a
 376                     ; 71 		return 0;
 378  003b 4f            	clr	a
 381  003c 81            	ret	
 382  003d               LC002:
 383  003d c60000        	ld	a,_br_buf_count
 384  0040 725c0000      	inc	_br_buf_count
 385  0044 5f            	clrw	x
 386  0045 97            	ld	xl,a
 387                     ; 88 	ext_br_error = 1;  							// 2015.11.03 보일러 정상 패킷 체크
 389  0046 a601          	ld	a,#1
 390  0048 81            	ret	
 424                     ; 91 void br_kr_ptc_check(void) {
 425                     .text:	section	.text,new
 426  0000               _br_kr_ptc_check:
 430                     ; 92 	if(br_kr_ptc_baseCheck() == 0) {
 432  0000 cd0000        	call	_br_kr_ptc_baseCheck
 434  0003 4d            	tnz	a
 435  0004 2601          	jrne	L721
 436                     ; 93 		return;
 439  0006 81            	ret	
 440  0007               L721:
 441                     ; 96 	br_type = BR_TYPE_KR;
 443  0007 35010000      	mov	_br_type,#1
 444                     ; 97 	br_connect = 0;
 446  000b 725f0000      	clr	_br_connect
 447                     ; 99 	bData1_r = _ub.b[1];
 449  000f 5500050000    	mov	_bData1_r,__ub+5
 450                     ; 100 	bData2_r = _ub.b[2];
 452  0014 5500060000    	mov	_bData2_r,__ub+6
 453                     ; 101 	bData3_r = _ub.b[3];
 455  0019 c60007        	ld	a,__ub+7
 456  001c c70000        	ld	_bData3_r,a
 457                     ; 103 	if (_ub.b[3] != 0x00) {
 459  001f 2710          	jreq	L131
 460                     ; 104 		if (funcInfo.error_type == ERROR_TYPE_NONE) {
 462  0021 725d0009      	tnz	_funcInfo+9
 463  0025 2613          	jrne	L531
 464                     ; 105 			func_cnt_error(ERROR_TYPE_BOILER, br_kr_ptc_change_BCDToHex(_ub.b[3]));
 466  0027 cd0000        	call	_br_kr_ptc_change_BCDToHex
 468  002a 97            	ld	xl,a
 469  002b a601          	ld	a,#1
 470  002d 95            	ld	xh,a
 473  002e cc0000        	jp	_func_cnt_error
 474  0031               L131:
 475                     ; 108 		if (funcInfo.error_type == ERROR_TYPE_BOILER) {
 477  0031 c60009        	ld	a,_funcInfo+9
 478  0034 4a            	dec	a
 479  0035 2603          	jrne	L531
 480                     ; 110 			func_cnt_errorReset();
 482  0037 cd0000        	call	_func_cnt_errorReset
 484  003a               L531:
 485                     ; 113 }
 488  003a 81            	ret	
 522                     ; 115 void br_kr_ptc_check_clio(void) {
 523                     .text:	section	.text,new
 524  0000               _br_kr_ptc_check_clio:
 528                     ; 116 	if(br_kr_ptc_baseCheck() == 0) {
 530  0000 cd0000        	call	_br_kr_ptc_baseCheck
 532  0003 4d            	tnz	a
 533  0004 2601          	jrne	L151
 534                     ; 117 		return;
 537  0006 81            	ret	
 538  0007               L151:
 539                     ; 120 	br_type = BR_TYPE_KR;
 541  0007 35010000      	mov	_br_type,#1
 542                     ; 121 	br_connect = 0;
 544  000b 725f0000      	clr	_br_connect
 545                     ; 123 	bData1_r = _ub.b[1];
 547  000f 5500050000    	mov	_bData1_r,__ub+5
 548                     ; 124 	bData2_r = _ub.b[2];
 550  0014 5500060000    	mov	_bData2_r,__ub+6
 551                     ; 125 	bData3_r = _ub.b[3];
 553  0019 c60007        	ld	a,__ub+7
 554  001c c70000        	ld	_bData3_r,a
 555                     ; 127 	if (_ub.b[3] != 0x00) {
 557  001f 270d          	jreq	L351
 558                     ; 128 		if (funcInfo.error_type == ERROR_TYPE_NONE) {
 560  0021 725d0009      	tnz	_funcInfo+9
 561  0025 2610          	jrne	L751
 562                     ; 129 			func_cnt_error(ERROR_TYPE_BOILER, _ub.b[3]);
 564  0027 97            	ld	xl,a
 565  0028 a601          	ld	a,#1
 566  002a 95            	ld	xh,a
 569  002b cc0000        	jp	_func_cnt_error
 570  002e               L351:
 571                     ; 132 		if (funcInfo.error_type == ERROR_TYPE_BOILER) {
 573  002e c60009        	ld	a,_funcInfo+9
 574  0031 4a            	dec	a
 575  0032 2603          	jrne	L751
 576                     ; 134 			func_cnt_errorReset();
 578  0034 cd0000        	call	_func_cnt_errorReset
 580  0037               L751:
 581                     ; 137 }
 584  0037 81            	ret	
 625                     ; 139 void br_kr_make_checkSum(void) {
 626                     .text:	section	.text,new
 627  0000               _br_kr_make_checkSum:
 629  0000 89            	pushw	x
 630       00000002      OFST:	set	2
 633                     ; 143 	s = 0;
 635  0001 0f01          	clr	(OFST-1,sp)
 636                     ; 144 	for (i = 0 ; i < 4 ; i++) {
 638  0003 4f            	clr	a
 639  0004 6b02          	ld	(OFST+0,sp),a
 640  0006               L102:
 641                     ; 145 		s ^= _ub.r[i];
 643  0006 5f            	clrw	x
 644  0007 97            	ld	xl,a
 645  0008 7b01          	ld	a,(OFST-1,sp)
 646  000a d80054        	xor	a,(__ub+84,x)
 647  000d 6b01          	ld	(OFST-1,sp),a
 648                     ; 144 	for (i = 0 ; i < 4 ; i++) {
 650  000f 0c02          	inc	(OFST+0,sp)
 653  0011 7b02          	ld	a,(OFST+0,sp)
 654  0013 a104          	cp	a,#4
 655  0015 25ef          	jrult	L102
 656                     ; 148 	_ub.r[4] = s;
 658  0017 7b01          	ld	a,(OFST-1,sp)
 659  0019 c70058        	ld	__ub+88,a
 660                     ; 150 }
 663  001c 85            	popw	x
 664  001d 81            	ret	
 713                     ; 152 uint8_t br_kr_ptc_openValve(void) {
 714                     .text:	section	.text,new
 715  0000               _br_kr_ptc_openValve:
 717  0000 5203          	subw	sp,#3
 718       00000003      OFST:	set	3
 721                     ; 153 	uint8_t i = 0;
 723                     ; 154 	uint8_t co = 0;
 725  0002 0f01          	clr	(OFST-2,sp)
 726                     ; 155 	uint8_t open = 0;
 728                     ; 156 	open = funcInfo.rcLED | funcInfo.sub_rcLED;
 730  0004 c60012        	ld	a,_funcInfo+18
 731  0007 ca0013        	or	a,_funcInfo+19
 732  000a 6b02          	ld	(OFST-1,sp),a
 733                     ; 158 	for (i = 0 ; i < 8 ; i++) {
 735  000c 4f            	clr	a
 736  000d 6b03          	ld	(OFST+0,sp),a
 737  000f               L722:
 738                     ; 159 		if (br_getHexToBin(open, i)) {
 740  000f 97            	ld	xl,a
 741  0010 7b02          	ld	a,(OFST-1,sp)
 742  0012 95            	ld	xh,a
 743  0013 cd0000        	call	_br_getHexToBin
 745  0016 4d            	tnz	a
 746  0017 2702          	jreq	L532
 747                     ; 160 			co++;
 749  0019 0c01          	inc	(OFST-2,sp)
 750  001b               L532:
 751                     ; 158 	for (i = 0 ; i < 8 ; i++) {
 753  001b 0c03          	inc	(OFST+0,sp)
 756  001d 7b03          	ld	a,(OFST+0,sp)
 757  001f a108          	cp	a,#8
 758  0021 25ec          	jrult	L722
 759                     ; 164 	return co;
 761  0023 7b01          	ld	a,(OFST-2,sp)
 764  0025 5b03          	addw	sp,#3
 765  0027 81            	ret	
 826                     ; 169 void br_kr_ptc_make(void) {
 827                     .text:	section	.text,new
 828  0000               _br_kr_ptc_make:
 830  0000 88            	push	a
 831       00000001      OFST:	set	1
 834                     ; 171 	uint8_t val = 0;
 836                     ; 175 	open = br_kr_ptc_openValve();
 838  0001 cd0000        	call	_br_kr_ptc_openValve
 840  0004 6b01          	ld	(OFST+0,sp),a
 841                     ; 177 	if (open == 1) {
 843  0006 a101          	cp	a,#1
 844  0008 2604          	jrne	L162
 845                     ; 178 		val = 0x24;
 847  000a a624          	ld	a,#36
 849  000c 200a          	jp	LC003
 850  000e               L162:
 851                     ; 179 	} else if (open == 2 || open == 3) {
 853  000e a102          	cp	a,#2
 854  0010 2704          	jreq	L762
 856  0012 a103          	cp	a,#3
 857  0014 261d          	jrne	L562
 858  0016               L762:
 859                     ; 180 		val = 0x14;
 861  0016 a614          	ld	a,#20
 862  0018               LC003:
 863  0018 6b01          	ld	(OFST+0,sp),a
 865  001a               L362:
 866                     ; 195 	_ub.r[0] = 0x02;
 868  001a 35020054      	mov	__ub+84,#2
 869                     ; 197 	if (kr_error_reset == 1) {
 871  001e c60000        	ld	a,_kr_error_reset
 872  0021 4a            	dec	a
 873  0022 2625          	jrne	L772
 874                     ; 198 		if (kr_error_reset_count == 0) {
 876  0024 725d0001      	tnz	_kr_error_reset_count
 877  0028 2615          	jrne	L103
 878                     ; 199 			kr_error_reset = 0;
 880  002a c70000        	ld	_kr_error_reset,a
 881                     ; 200 			kr_error_reset_count = ERROR_RESET_COUNT;
 883  002d 35020001      	mov	_kr_error_reset_count,#2
 885  0031 201a          	jra	L503
 886  0033               L562:
 887                     ; 181 	} else if (open >= 4) {
 889  0033 a104          	cp	a,#4
 890  0035 2504          	jrult	L372
 891                     ; 182 		val = 0x0C;
 893  0037 a60c          	ld	a,#12
 895  0039 20dd          	jp	LC003
 896  003b               L372:
 897                     ; 184 		val = 0x00;
 899  003b 0f01          	clr	(OFST+0,sp)
 900  003d 20db          	jra	L362
 901  003f               L103:
 902                     ; 202 			kr_error_reset_count--;
 904  003f 725a0001      	dec	_kr_error_reset_count
 905                     ; 203 			_ub.r[1] = 	0x00;
 907  0043 725f0055      	clr	__ub+85
 908  0047 2004          	jra	L503
 909  0049               L772:
 910                     ; 206 		_ub.r[1] = 	0x80;
 912  0049 35800055      	mov	__ub+85,#128
 913  004d               L503:
 914                     ; 209 	_ub.r[1] |= (_is_shower == 1 ? 0x40 : 0x00);
 916  004d c60000        	ld	a,__is_shower
 917  0050 4a            	dec	a
 918  0051 2604          	jrne	L45
 919  0053 a640          	ld	a,#64
 920  0055 2001          	jra	L65
 921  0057               L45:
 922  0057 4f            	clr	a
 923  0058               L65:
 924  0058 ca0055        	or	a,__ub+85
 925                     ; 210 	_ub.r[1] |=	val;
 927  005b 1a01          	or	a,(OFST+0,sp)
 928  005d c70055        	ld	__ub+85,a
 929                     ; 211 	if( val == 0 )
 931  0060 7b01          	ld	a,(OFST+0,sp)
 932  0062 260e          	jrne	L703
 933                     ; 213 		_ub.r[1] &= 0x7f;
 935  0064 721f0055      	bres	__ub+85,#7
 936                     ; 214 		if( _is_shower == 1 )
 938  0068 c60000        	ld	a,__is_shower
 939  006b 4a            	dec	a
 940  006c 2604          	jrne	L703
 941                     ; 215 			_ub.r[1] |= 0x80;
 943  006e 721e0055      	bset	__ub+85,#7
 944  0072               L703:
 945                     ; 217 	set_heat = funcInfo.boiler_set_water_heat;
 947  0072 c60004        	ld	a,_funcInfo+4
 948                     ; 219 	if (set_heat < 45) {
 950  0075 a12d          	cp	a,#45
 951  0077 2402          	jruge	L313
 952                     ; 220 		set_heat = 45;
 954  0079 a62d          	ld	a,#45
 955  007b               L313:
 956                     ; 223 	if (set_heat > 85) {
 958  007b a156          	cp	a,#86
 959  007d 2502          	jrult	L513
 960                     ; 224 		set_heat = 85;
 962  007f a655          	ld	a,#85
 963  0081               L513:
 964  0081 6b01          	ld	(OFST+0,sp),a
 965                     ; 227 	_ub.r[2] = br_kr_ptc_change_BCD(set_heat);       // 40~80 이나 귀뚜라미는 45~85 임
 967  0083 cd0000        	call	_br_kr_ptc_change_BCD
 969  0086 c70056        	ld	__ub+86,a
 970                     ; 229 	set_water = funcInfo.boiler_set_water_shower;	// 40~70 이나 귀뚜라미는 35~60 임
 972  0089 c60003        	ld	a,_funcInfo+3
 973                     ; 231 	if (set_water < 35) {
 975  008c a123          	cp	a,#35
 976  008e 2402          	jruge	L713
 977                     ; 232 		set_water = 35;
 979  0090 a623          	ld	a,#35
 980  0092               L713:
 981  0092 6b01          	ld	(OFST+0,sp),a
 982                     ; 240 	_ub.r[3] = br_kr_ptc_change_BCD(set_water);				
 984  0094 cd0000        	call	_br_kr_ptc_change_BCD
 986  0097 c70057        	ld	__ub+87,a
 987                     ; 241 	br_kr_make_checkSum();
 989  009a cd0000        	call	_br_kr_make_checkSum
 991                     ; 242 	_ub.r[5] = 0x03;
 993  009d 35030059      	mov	__ub+89,#3
 994                     ; 244 	BR_KR_SEND
 996  00a1 35060003      	mov	__ub+3,#6
 999  00a5 350100a4      	mov	__ub+164,#1
1002  00a9 351400a5      	mov	__ub+165,#20
1003                     ; 245 }
1006  00ad 84            	pop	a
1007  00ae 81            	ret	
1031                     ; 247 void br_kr_error_reset(void) {
1032                     .text:	section	.text,new
1033  0000               _br_kr_error_reset:
1037                     ; 248 	kr_error_reset = 1;
1039  0000 35010000      	mov	_kr_error_reset,#1
1040                     ; 249 }
1043  0004 81            	ret	
1089                     ; 251 void br_kr_ptc_make_clio(void) {
1090                     .text:	section	.text,new
1091  0000               _br_kr_ptc_make_clio:
1093  0000 88            	push	a
1094       00000001      OFST:	set	1
1097                     ; 253 	uint8_t val = 0;
1099                     ; 254 	open = br_kr_ptc_openValve();
1101  0001 cd0000        	call	_br_kr_ptc_openValve
1103  0004 6b01          	ld	(OFST+0,sp),a
1104                     ; 256 	if (open == 1) {
1106  0006 a101          	cp	a,#1
1107  0008 2604          	jrne	L743
1108                     ; 257 		val = 0x24;
1110  000a a624          	ld	a,#36
1112  000c 200a          	jp	LC004
1113  000e               L743:
1114                     ; 258 	} else if (open == 2 || open == 3) {
1116  000e a102          	cp	a,#2
1117  0010 2704          	jreq	L553
1119  0012 a103          	cp	a,#3
1120  0014 2631          	jrne	L353
1121  0016               L553:
1122                     ; 259 		val = 0x14;
1124  0016 a614          	ld	a,#20
1125  0018               LC004:
1126  0018 6b01          	ld	(OFST+0,sp),a
1128  001a               L153:
1129                     ; 266 	_ub.r[0] = 0x02;
1131  001a 35020054      	mov	__ub+84,#2
1132                     ; 267 	_ub.r[1] = (bData1_b & 0xC3) | val;
1134  001e c60000        	ld	a,_bData1_b
1135  0021 a4c3          	and	a,#195
1136  0023 1a01          	or	a,(OFST+0,sp)
1137  0025 c70055        	ld	__ub+85,a
1138                     ; 268 	_ub.r[2] = bData2_b;
1140  0028 5500000056    	mov	__ub+86,_bData2_b
1141                     ; 269 	_ub.r[3] = bData3_b;
1143  002d 5500000057    	mov	__ub+87,_bData3_b
1144                     ; 270 	br_kr_make_checkSum();
1146  0032 cd0000        	call	_br_kr_make_checkSum
1148                     ; 271 	_ub.r[5] = 0x03;
1150  0035 35030059      	mov	__ub+89,#3
1151                     ; 273 	BR_KR_SEND
1153  0039 35060003      	mov	__ub+3,#6
1156  003d 350100a4      	mov	__ub+164,#1
1159  0041 351400a5      	mov	__ub+165,#20
1160                     ; 274 }
1163  0045 84            	pop	a
1164  0046 81            	ret	
1165  0047               L353:
1166                     ; 260 	} else if (open >= 4) {
1168  0047 a104          	cp	a,#4
1169  0049 2504          	jrult	L163
1170                     ; 261 		val = 0x0C;
1172  004b a60c          	ld	a,#12
1174  004d 20c9          	jp	LC004
1175  004f               L163:
1176                     ; 263 		val = 0x00;
1178  004f 0f01          	clr	(OFST+0,sp)
1179  0051 20c7          	jra	L153
1204                     ; 276 void br_kr_ptc_close_clio(void) {
1205                     .text:	section	.text,new
1206  0000               _br_kr_ptc_close_clio:
1210                     ; 277 	bData1_b = 0x80;
1212  0000 35800000      	mov	_bData1_b,#128
1213                     ; 278 }
1216  0004 81            	ret	
1241                     ; 280 void br_kr_ptc_open_clio(void) {
1242                     .text:	section	.text,new
1243  0000               _br_kr_ptc_open_clio:
1247                     ; 281 	bData1_b = bData1_b | 0x0C;
1249  0000 c60000        	ld	a,_bData1_b
1250  0003 aa0c          	or	a,#12
1251  0005 c70000        	ld	_bData1_b,a
1252                     ; 282 }
1255  0008 81            	ret	
1285                     	xdef	_br_kr_ptc_open_clio
1286                     	xdef	_br_kr_ptc_openValve
1287                     	xdef	_br_kr_make_checkSum
1288                     	xdef	_br_kr_ptc_baseCheck
1289                     	xdef	_br_kr_ptc_change_BCDToHex
1290                     	xdef	_br_kr_ptc_change_BCD
1291                     	xdef	_br_kr_check_checkSum
1292                     	xdef	_kr_error_reset_count
1293                     	xdef	_kr_error_reset
1294                     	xref	__is_shower
1295                     	xref	_bData3_r
1296                     	xref	_bData2_r
1297                     	xref	_bData1_r
1298                     	xref	_bData3_b
1299                     	xref	_bData2_b
1300                     	xref	_bData1_b
1301                     	xdef	_br_kr_ptc_close_clio
1302                     	xdef	_br_kr_ptc_make_clio
1303                     	xdef	_br_kr_error_reset
1304                     	xdef	_br_kr_ptc_make
1305                     	xdef	_br_kr_ptc_check_clio
1306                     	xdef	_br_kr_ptc_check
1307                     	xref	_br_getHexToBin
1308                     	xref	_br_buf_count
1309                     	xref	_br_buf_error
1310                     	xref	_br_error_checksum
1311                     	xref	_br_type
1312                     	xref	_br_connect
1313                     	xref	_func_cnt_error
1314                     	xref	_func_cnt_errorReset
1315                     	xref	_funcInfo
1316                     	xref	__ub
1317                     	xref	_ext_br_error
1336                     	end
