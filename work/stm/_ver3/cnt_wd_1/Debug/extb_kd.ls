   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _kd_error_reset:
  25  0000 00            	dc.b	0
  71                     ; 21 void br_kd_makeChecksum(void) {
  73                     .text:	section	.text,new
  74  0000               _br_kd_makeChecksum:
  76  0000 89            	pushw	x
  77       00000002      OFST:	set	2
  80                     ; 25 	s = 0;
  82  0001 0f01          	clr	(OFST-1,sp)
  83                     ; 26 	for (i = 1 ; i < 15 ; i++) {
  85  0003 a601          	ld	a,#1
  86  0005 6b02          	ld	(OFST+0,sp),a
  87  0007               L72:
  88                     ; 27 		s += _ub.r[i];
  90  0007 5f            	clrw	x
  91  0008 97            	ld	xl,a
  92  0009 7b01          	ld	a,(OFST-1,sp)
  93  000b db0054        	add	a,(__ub+84,x)
  94  000e 6b01          	ld	(OFST-1,sp),a
  95                     ; 26 	for (i = 1 ; i < 15 ; i++) {
  97  0010 0c02          	inc	(OFST+0,sp)
 100  0012 7b02          	ld	a,(OFST+0,sp)
 101  0014 a10f          	cp	a,#15
 102  0016 25ef          	jrult	L72
 103                     ; 29 	_ub.r[15] = s;
 105  0018 7b01          	ld	a,(OFST-1,sp)
 106  001a c70063        	ld	__ub+99,a
 107                     ; 30 }
 110  001d 85            	popw	x
 111  001e 81            	ret	
 152                     ; 32 uint8_t br_kd_check_checkSum(void) {
 153                     .text:	section	.text,new
 154  0000               _br_kd_check_checkSum:
 156  0000 89            	pushw	x
 157       00000002      OFST:	set	2
 160                     ; 36 	s = 0;
 162  0001 0f01          	clr	(OFST-1,sp)
 163                     ; 37 	for (i = 1 ; i < 15 ; i++) {
 165  0003 a601          	ld	a,#1
 166  0005 6b02          	ld	(OFST+0,sp),a
 167  0007               L35:
 168                     ; 38 		s += _ub.b[i];
 170  0007 5f            	clrw	x
 171  0008 97            	ld	xl,a
 172  0009 7b01          	ld	a,(OFST-1,sp)
 173  000b db0004        	add	a,(__ub+4,x)
 174  000e 6b01          	ld	(OFST-1,sp),a
 175                     ; 37 	for (i = 1 ; i < 15 ; i++) {
 177  0010 0c02          	inc	(OFST+0,sp)
 180  0012 7b02          	ld	a,(OFST+0,sp)
 181  0014 a10f          	cp	a,#15
 182  0016 25ef          	jrult	L35
 183                     ; 41 	if (s == _ub.b[15]) {
 185  0018 7b01          	ld	a,(OFST-1,sp)
 186  001a c10013        	cp	a,__ub+19
 187  001d 2604          	jrne	L16
 188                     ; 42 		return 1;
 190  001f a601          	ld	a,#1
 192  0021 2001          	jra	L01
 193  0023               L16:
 194                     ; 45 	return 0;
 196  0023 4f            	clr	a
 198  0024               L01:
 200  0024 85            	popw	x
 201  0025 81            	ret	
 230                     ; 48 uint8_t br_kd_baseCheck(void) {
 231                     .text:	section	.text,new
 232  0000               _br_kd_baseCheck:
 236                     ; 49 	if (br_buf_count == 15) {
 238  0000 c60000        	ld	a,_br_buf_count
 239  0003 a10f          	cp	a,#15
 240  0005 2604          	jrne	L37
 241                     ; 50 		br_buf_count = 0;
 243  0007 725f0000      	clr	_br_buf_count
 244  000b               L37:
 245                     ; 53 	if(_ub.b[0] != 0x02) {
 247  000b c60004        	ld	a,__ub+4
 248  000e a102          	cp	a,#2
 249  0010 2702          	jreq	L57
 250                     ; 54 		br_buf_error[br_buf_count++] = 1;
 252  0012 2031          	jp	LC001
 253  0014               L57:
 254                     ; 58 	if(_ub.b[16] != 0x03) {
 256  0014 c60014        	ld	a,__ub+20
 257  0017 a103          	cp	a,#3
 258  0019 2702          	jreq	L77
 259                     ; 59 		br_buf_error[br_buf_count++] = 1;
 261  001b 2028          	jp	LC001
 262  001d               L77:
 263                     ; 63 	if(_ub.b[2] != 0x01) {
 265  001d c60006        	ld	a,__ub+6
 266  0020 4a            	dec	a
 267  0021 2702          	jreq	L101
 268                     ; 64 		br_buf_error[br_buf_count++] = 1;
 270  0023 2020          	jp	LC001
 271  0025               L101:
 272                     ; 68 	if(_ub.b[3] != 0x00) {
 274  0025 c60007        	ld	a,__ub+7
 275  0028 2702          	jreq	L301
 276                     ; 69 		br_buf_error[br_buf_count++] = 1;
 278  002a 2019          	jp	LC001
 279  002c               L301:
 280                     ; 73 	if (br_kd_check_checkSum() != 1) {
 282  002c cd0000        	call	_br_kd_check_checkSum
 284  002f 4a            	dec	a
 285  0030 2706          	jreq	L501
 286                     ; 74 		br_error_checksum = 1;
 288  0032 35010000      	mov	_br_error_checksum,#1
 289                     ; 75 		return 0;
 291  0036 4f            	clr	a
 294  0037 81            	ret	
 295  0038               L501:
 296                     ; 78 	br_error_checksum = 0;
 298  0038 c70000        	ld	_br_error_checksum,a
 299                     ; 79 	br_buf_error[br_buf_count++] = 0;
 301  003b ad0f          	call	LC002
 302  003d 724f0000      	clr	(_br_buf_error,x)
 303  0041 c70000        	ld	_ext_br_error,a
 304                     ; 83 	return 1;
 308  0044 81            	ret	
 309  0045               LC001:
 310  0045 ad05          	call	LC002
 311  0047 d70000        	ld	(_br_buf_error,x),a
 312                     ; 55 		return 0;
 314  004a 4f            	clr	a
 317  004b 81            	ret	
 318  004c               LC002:
 319  004c c60000        	ld	a,_br_buf_count
 320  004f 725c0000      	inc	_br_buf_count
 321  0053 5f            	clrw	x
 322  0054 97            	ld	xl,a
 323                     ; 81 	ext_br_error = 1;  							// 2015.11.03 보일러 정상 패킷 체크
 325  0055 a601          	ld	a,#1
 326  0057 81            	ret	
 374                     ; 87 uint8_t br_kd_temp_format_wd(uint8_t temp) {
 375                     .text:	section	.text,new
 376  0000               _br_kd_temp_format_wd:
 378  0000 88            	push	a
 379  0001 88            	push	a
 380       00000001      OFST:	set	1
 383                     ; 88 	uint8_t real = 0;
 385                     ; 89 	uint8_t add = 0;
 387  0002 0f01          	clr	(OFST+0,sp)
 388                     ; 91 	if (br_getHexToBin(temp, 7) == 1) {
 390  0004 ae0007        	ldw	x,#7
 391  0007 95            	ld	xh,a
 392  0008 cd0000        	call	_br_getHexToBin
 394  000b 4a            	dec	a
 395  000c 2603          	jrne	L721
 396                     ; 92 		add = 1;
 398  000e 4c            	inc	a
 399  000f 6b01          	ld	(OFST+0,sp),a
 400  0011               L721:
 401                     ; 95 	real = ((temp & 0x7F) * 2) + add; 
 403  0011 7b02          	ld	a,(OFST+1,sp)
 404  0013 a47f          	and	a,#127
 405  0015 48            	sll	a
 406  0016 1b01          	add	a,(OFST+0,sp)
 407                     ; 96 	return real;
 411  0018 85            	popw	x
 412  0019 81            	ret	
 459                     ; 100 uint8_t br_kd_temp_format_kd(uint8_t temp) {
 460                     .text:	section	.text,new
 461  0000               _br_kd_temp_format_kd:
 463  0000 88            	push	a
 464  0001 89            	pushw	x
 465       00000002      OFST:	set	2
 468                     ; 101 	uint8_t real = 0;
 470                     ; 102 	uint8_t add = 0;
 472                     ; 104 	add = temp % 2;
 474  0002 a401          	and	a,#1
 475                     ; 106 	real = (temp / 2) | (add << 7); 
 477  0004 97            	ld	xl,a
 478  0005 a680          	ld	a,#128
 479  0007 42            	mul	x,a
 480  0008 9f            	ld	a,xl
 481  0009 6b01          	ld	(OFST-1,sp),a
 482  000b 5f            	clrw	x
 483  000c 7b03          	ld	a,(OFST+1,sp)
 484  000e 97            	ld	xl,a
 485  000f 57            	sraw	x
 486  0010 01            	rrwa	x,a
 487  0011 1a01          	or	a,(OFST-1,sp)
 488                     ; 107 	return real;
 492  0013 5b03          	addw	sp,#3
 493  0015 81            	ret	
 541                     ; 110 uint8_t br_kd_isvalveOpen(void) {
 542                     .text:	section	.text,new
 543  0000               _br_kd_isvalveOpen:
 545  0000 5203          	subw	sp,#3
 546       00000003      OFST:	set	3
 549                     ; 113 	uint8_t led = funcInfo.rcLED | funcInfo.sub_rcLED;
 551  0002 c60012        	ld	a,_funcInfo+18
 552  0005 ca0013        	or	a,_funcInfo+19
 553  0008 6b01          	ld	(OFST-2,sp),a
 554                     ; 115 	result = 0;
 556  000a 0f02          	clr	(OFST-1,sp)
 557                     ; 116 	for (i = 0 ; i < 8 ; i++) {
 559  000c 4f            	clr	a
 560  000d 6b03          	ld	(OFST+0,sp),a
 561  000f               L171:
 562                     ; 117 		if (br_getHexToBin(led, i) == 1) {
 564  000f 97            	ld	xl,a
 565  0010 7b01          	ld	a,(OFST-2,sp)
 566  0012 95            	ld	xh,a
 567  0013 cd0000        	call	_br_getHexToBin
 569  0016 4a            	dec	a
 570  0017 2603          	jrne	L771
 571                     ; 118 			result = 1;
 573  0019 4c            	inc	a
 574                     ; 119 			break;
 576  001a 200a          	jra	L571
 577  001c               L771:
 578                     ; 116 	for (i = 0 ; i < 8 ; i++) {
 580  001c 0c03          	inc	(OFST+0,sp)
 583  001e 7b03          	ld	a,(OFST+0,sp)
 584  0020 a108          	cp	a,#8
 585  0022 25eb          	jrult	L171
 586  0024 7b02          	ld	a,(OFST-1,sp)
 587  0026               L571:
 588                     ; 123 	return result;
 592  0026 5b03          	addw	sp,#3
 593  0028 81            	ret	
 642                     ; 126 uint8_t br_kd_valveOpen_count(void) {
 643                     .text:	section	.text,new
 644  0000               _br_kd_valveOpen_count:
 646  0000 5203          	subw	sp,#3
 647       00000003      OFST:	set	3
 650                     ; 129 	uint8_t led = funcInfo.rcLED | funcInfo.sub_rcLED;
 652  0002 c60012        	ld	a,_funcInfo+18
 653  0005 ca0013        	or	a,_funcInfo+19
 654  0008 6b01          	ld	(OFST-2,sp),a
 655                     ; 131 	result = 0;
 657  000a 0f02          	clr	(OFST-1,sp)
 658                     ; 132 	for (i = 0 ; i < 8 ; i++) {
 660  000c 4f            	clr	a
 661  000d 6b03          	ld	(OFST+0,sp),a
 662  000f               L122:
 663                     ; 133 		if (br_getHexToBin(led, i) == 1) {
 665  000f 97            	ld	xl,a
 666  0010 7b01          	ld	a,(OFST-2,sp)
 667  0012 95            	ld	xh,a
 668  0013 cd0000        	call	_br_getHexToBin
 670  0016 4a            	dec	a
 671  0017 2602          	jrne	L722
 672                     ; 134 			result += 1;
 674  0019 0c02          	inc	(OFST-1,sp)
 675  001b               L722:
 676                     ; 132 	for (i = 0 ; i < 8 ; i++) {
 678  001b 0c03          	inc	(OFST+0,sp)
 681  001d 7b03          	ld	a,(OFST+0,sp)
 682  001f a108          	cp	a,#8
 683  0021 25ec          	jrult	L122
 684                     ; 138 	return result;
 686  0023 7b02          	ld	a,(OFST-1,sp)
 689  0025 5b03          	addw	sp,#3
 690  0027 81            	ret	
 740                     ; 141 uint8_t br_kd_make(void) {
 741                     .text:	section	.text,new
 742  0000               _br_kd_make:
 744  0000 5203          	subw	sp,#3
 745       00000003      OFST:	set	3
 748                     ; 142 	uint8_t led = funcInfo.rcLED | funcInfo.sub_rcLED;
 750  0002 c60012        	ld	a,_funcInfo+18
 751  0005 ca0013        	or	a,_funcInfo+19
 752  0008 6b02          	ld	(OFST-1,sp),a
 753                     ; 145 	_ub.r[0] = 0x02;
 755  000a 35020054      	mov	__ub+84,#2
 756                     ; 146 	_ub.r[1] = 0x10;
 758  000e 35100055      	mov	__ub+85,#16
 759                     ; 147 	_ub.r[2] = 0x10;
 761  0012 35100056      	mov	__ub+86,#16
 762                     ; 148 	_ub.r[3] = 0x00;
 764  0016 725f0057      	clr	__ub+87
 765                     ; 149 	_ub.r[4] = 0x10;
 767  001a 35100058      	mov	__ub+88,#16
 768                     ; 151 	if (funcInfo.error_type == ERROR_TYPE_CNT) {
 770  001e c60009        	ld	a,_funcInfo+9
 771  0021 a102          	cp	a,#2
 772  0023 2611          	jrne	L742
 773                     ; 152 		_ub.r[5] = 0x01 | (br_kd_isvalveOpen() << 4);
 775  0025 cd0000        	call	_br_kd_isvalveOpen
 777  0028 cd012c        	call	LC003
 778  002b aa01          	or	a,#1
 779  002d c70059        	ld	__ub+89,a
 780                     ; 153 		_ub.r[6] = 0x10;
 782  0030 3510005a      	mov	__ub+90,#16
 784  0034 200d          	jra	L152
 785  0036               L742:
 786                     ; 155 		_ub.r[5] = 0x00 | (br_kd_isvalveOpen() << 4);
 788  0036 cd0000        	call	_br_kd_isvalveOpen
 790  0039 cd012c        	call	LC003
 791  003c c70059        	ld	__ub+89,a
 792                     ; 156 		_ub.r[6] = 0x00;
 794  003f 725f005a      	clr	__ub+90
 795  0043               L152:
 796                     ; 159 	_ub.r[7] = 0xFE;
 798  0043 35fe005b      	mov	__ub+91,#254
 799                     ; 161 	if ( hn_type == HN_TYPE_CLIO_KD ) {
 801  0047 c60000        	ld	a,_hn_type
 802  004a a103          	cp	a,#3
 803  004c 2621          	jrne	L352
 804                     ; 162 		_ub.r[8] = hnInfo_clio.boiler_on_off;
 806  004e 550000005c    	mov	__ub+92,_hnInfo_clio
 807                     ; 163 		_ub.r[8] = _ub.r[8] | hnInfo_clio.boiler_mode_shower << 4;
 809  0053 c60001        	ld	a,_hnInfo_clio+1
 810  0056 cd012c        	call	LC003
 811  0059 ca005c        	or	a,__ub+92
 812  005c c7005c        	ld	__ub+92,a
 813                     ; 164 		_ub.r[8] = _ub.r[8] | hnInfo_clio.boiler_warm_up << 5;
 815  005f c60002        	ld	a,_hnInfo_clio+2
 816  0062 97            	ld	xl,a
 817  0063 a620          	ld	a,#32
 818  0065 42            	mul	x,a
 819  0066 9f            	ld	a,xl
 820  0067 ca005c        	or	a,__ub+92
 821  006a c7005c        	ld	__ub+92,a
 823  006d 2011          	jra	L552
 824  006f               L352:
 825                     ; 166 		if (rcInfo.mode[0] == MODE_OUT) {
 827  006f c60010        	ld	a,_rcInfo+16
 828  0072 a102          	cp	a,#2
 829  0074 2606          	jrne	L752
 830                     ; 167 			_ub.r[8] = 0x01;
 832  0076 3501005c      	mov	__ub+92,#1
 834  007a 2004          	jra	L552
 835  007c               L752:
 836                     ; 169 			_ub.r[8] = 0x00;
 838  007c 725f005c      	clr	__ub+92
 839  0080               L552:
 840                     ; 173 	if (hn_type == HN_TYPE_CLIO_KD) {
 842  0080 c60000        	ld	a,_hn_type
 843  0083 a103          	cp	a,#3
 844  0085 261c          	jrne	L362
 845                     ; 174 		if (kd_error_reset == 1) {
 847  0087 c60000        	ld	a,_kd_error_reset
 848  008a 4a            	dec	a
 849  008b 2607          	jrne	L562
 850                     ; 175 			_ub.r[8] = _ub.r[8] | (0x01 << 1);
 852  008d 7212005c      	bset	__ub+92,#1
 853                     ; 176 			kd_error_reset = 0;
 855  0091 c70000        	ld	_kd_error_reset,a
 856  0094               L562:
 857                     ; 179 		_ub.r[8] = _ub.r[8] 
 857                     ; 180 							| (br_kd_isvalveOpen() << 2) 
 857                     ; 181 							| (0x01 << 3);	
 859  0094 cd0000        	call	_br_kd_isvalveOpen
 861  0097 48            	sll	a
 862  0098 48            	sll	a
 863  0099 ca005c        	or	a,__ub+92
 864  009c aa08          	or	a,#8
 865  009e c7005c        	ld	__ub+92,a
 867  00a1 2023          	jra	L762
 868  00a3               L362:
 869                     ; 184 		_ub.r[8] = 0x01 
 869                     ; 185 		           | (br_kd_isvalveOpen() << 2)
 869                     ; 186 							 | (0x01 << 3)
 869                     ; 187 							 | (_is_shower << 5);	
 871  00a3 c60000        	ld	a,__is_shower
 872  00a6 97            	ld	xl,a
 873  00a7 a620          	ld	a,#32
 874  00a9 42            	mul	x,a
 875  00aa 9f            	ld	a,xl
 876  00ab 6b01          	ld	(OFST-2,sp),a
 877  00ad cd0000        	call	_br_kd_isvalveOpen
 879  00b0 48            	sll	a
 880  00b1 48            	sll	a
 881  00b2 aa09          	or	a,#9
 882  00b4 1a01          	or	a,(OFST-2,sp)
 883  00b6 c7005c        	ld	__ub+92,a
 884                     ; 189 		if (kd_error_reset == 1) {
 886  00b9 c60000        	ld	a,_kd_error_reset
 887  00bc 4a            	dec	a
 888  00bd 2607          	jrne	L762
 889                     ; 190 			_ub.r[8] = _ub.r[8] | (0x01 << 1);
 891  00bf 7212005c      	bset	__ub+92,#1
 892                     ; 191 			kd_error_reset = 0;
 894  00c3 c70000        	ld	_kd_error_reset,a
 895  00c6               L762:
 896                     ; 195 	_ub.r[9] = 0xFE;
 898  00c6 35fe005d      	mov	__ub+93,#254
 899                     ; 197 	if (hn_type == HN_TYPE_CLIO_KD) {
 901  00ca c60000        	ld	a,_hn_type
 902  00cd a103          	cp	a,#3
 903  00cf 260c          	jrne	L372
 904                     ; 198 		_ub.r[10] = hnInfo_clio.boiler_water_heat;
 906  00d1 550003005e    	mov	__ub+94,_hnInfo_clio+3
 907                     ; 199 		_ub.r[11] = hnInfo_clio.boiler_water_shower;
 909  00d6 550004005f    	mov	__ub+95,_hnInfo_clio+4
 911  00db 2026          	jra	L572
 912  00dd               L372:
 913                     ; 201 		setTemp = funcInfo.boiler_set_water_heat;
 915  00dd c60004        	ld	a,_funcInfo+4
 916                     ; 203 		if (setTemp < KD_MIN_HEAT) {
 918  00e0 a11e          	cp	a,#30
 919  00e2 2402          	jruge	L772
 920                     ; 204 			setTemp = KD_MIN_HEAT;
 922  00e4 a61e          	ld	a,#30
 923  00e6               L772:
 924                     ; 207 		if (setTemp > KD_MAX_HEAT) {
 926  00e6 a13d          	cp	a,#61
 927  00e8 2502          	jrult	L103
 928                     ; 208 			setTemp = KD_MAX_HEAT;
 930  00ea a63c          	ld	a,#60
 931  00ec               L103:
 932                     ; 211 		_ub.r[10] = setTemp;
 934  00ec c7005e        	ld	__ub+94,a
 935                     ; 213 		setTemp = funcInfo.boiler_set_water_shower;
 937  00ef c60003        	ld	a,_funcInfo+3
 938                     ; 215 		if (setTemp < KD_MIN_SHOWER) {
 940  00f2 a11e          	cp	a,#30
 941  00f4 2402          	jruge	L303
 942                     ; 216 			setTemp = KD_MIN_SHOWER;
 944  00f6 a61e          	ld	a,#30
 945  00f8               L303:
 946                     ; 219 		if (setTemp > KD_MAX_SHOWER) {
 948  00f8 a13d          	cp	a,#61
 949  00fa 2502          	jrult	L503
 950                     ; 220 			setTemp = KD_MAX_SHOWER;
 952  00fc a63c          	ld	a,#60
 953  00fe               L503:
 954  00fe 6b03          	ld	(OFST+0,sp),a
 955                     ; 222 		_ub.r[11] = setTemp;
 957  0100 c7005f        	ld	__ub+95,a
 958  0103               L572:
 959                     ; 225 	_ub.r[12] = funcInfo.valve + funcInfo2.valve;
 961  0103 c6000d        	ld	a,_funcInfo+13
 962  0106 cb000d        	add	a,_funcInfo2+13
 963  0109 c70060        	ld	__ub+96,a
 964                     ; 226 	_ub.r[13] = br_kd_valveOpen_count();
 966  010c cd0000        	call	_br_kd_valveOpen_count
 968  010f c70061        	ld	__ub+97,a
 969                     ; 227 	_ub.r[14] = 0xFE;
 971  0112 35fe0062      	mov	__ub+98,#254
 972                     ; 228 	_ub.r[16] = 0x03;
 974  0116 35030064      	mov	__ub+100,#3
 975                     ; 229 	br_kd_makeChecksum();
 977  011a cd0000        	call	_br_kd_makeChecksum
 979                     ; 231 	BR_KD_SEND
 981  011d 35110003      	mov	__ub+3,#17
 984  0121 350100a4      	mov	__ub+164,#1
 987  0125 350a00a5      	mov	__ub+165,#10
 988                     ; 232 }
 991  0129 5b03          	addw	sp,#3
 992  012b 81            	ret	
 993  012c               LC003:
 994  012c 97            	ld	xl,a
 995  012d a610          	ld	a,#16
 996  012f 42            	mul	x,a
 997  0130 9f            	ld	a,xl
 998  0131 81            	ret	
1022                     ; 234 void br_kd_error_reset(void) {
1023                     .text:	section	.text,new
1024  0000               _br_kd_error_reset:
1028                     ; 235 	kd_error_reset = 1;
1030  0000 35010000      	mov	_kd_error_reset,#1
1031                     ; 236 }
1034  0004 81            	ret	
1068                     ; 238 void br_kd_ptc_check(void) {
1069                     .text:	section	.text,new
1070  0000               _br_kd_ptc_check:
1074                     ; 239 	if(br_kd_baseCheck() == 0) {
1076  0000 cd0000        	call	_br_kd_baseCheck
1078  0003 4d            	tnz	a
1079  0004 2601          	jrne	L723
1080                     ; 240 		return;
1083  0006 81            	ret	
1084  0007               L723:
1085                     ; 243 	br_type = BR_TYPE_KD;
1087  0007 35020000      	mov	_br_type,#2
1088                     ; 244 	br_connect = 0;
1090  000b 725f0000      	clr	_br_connect
1091                     ; 246 	_kdInfo.func_water_cnt = br_getHexToBin(_ub.b[4], 0);
1093  000f 5f            	clrw	x
1094  0010 cd00d9        	call	LC004
1096  0013 c70000        	ld	__kdInfo,a
1097                     ; 247 	_kdInfo.func_warm_up = br_getHexToBin(_ub.b[4], 1);
1099  0016 ae0001        	ldw	x,#1
1100  0019 cd00d9        	call	LC004
1102  001c c70001        	ld	__kdInfo+1,a
1103                     ; 248 	_kdInfo.func_water_heat_cnt = br_getHexToBin(_ub.b[4], 2);
1105  001f ae0002        	ldw	x,#2
1106  0022 cd00d9        	call	LC004
1108  0025 c70002        	ld	__kdInfo+2,a
1109                     ; 249 	_kdInfo.func_heat_mode = br_getHexToBin(_ub.b[4], 3);
1111  0028 ae0003        	ldw	x,#3
1112  002b cd00d9        	call	LC004
1114  002e c70003        	ld	__kdInfo+3,a
1115                     ; 250 	_kdInfo.func_water_shower_unit = br_getHexToBin(_ub.b[4], 4);
1117  0031 ae0004        	ldw	x,#4
1118  0034 cd00d9        	call	LC004
1120  0037 c70004        	ld	__kdInfo+4,a
1121                     ; 251 	_kdInfo.func_water_heat_unit = br_getHexToBin(_ub.b[4], 5);
1123  003a ae0005        	ldw	x,#5
1124  003d cd00d9        	call	LC004
1126  0040 c70005        	ld	__kdInfo+5,a
1127                     ; 252 	_kdInfo.func_heat_capacity = br_getHexToBin(_ub.b[4], 6);
1129  0043 ae0006        	ldw	x,#6
1130  0046 cd00d9        	call	LC004
1132  0049 c70006        	ld	__kdInfo+6,a
1133                     ; 254 	_kdInfo.water_heat_min =  br_kd_temp_format_wd(_ub.b[5]);
1135  004c c60009        	ld	a,__ub+9
1136  004f cd0000        	call	_br_kd_temp_format_wd
1138  0052 c70007        	ld	__kdInfo+7,a
1139                     ; 255 	_kdInfo.water_heat_max =  br_kd_temp_format_wd(_ub.b[6]);
1141  0055 c6000a        	ld	a,__ub+10
1142  0058 cd0000        	call	_br_kd_temp_format_wd
1144  005b c70008        	ld	__kdInfo+8,a
1145                     ; 257 	_kdInfo.water_shower_min =  br_kd_temp_format_wd(_ub.b[7]);
1147  005e c6000b        	ld	a,__ub+11
1148  0061 cd0000        	call	_br_kd_temp_format_wd
1150  0064 c70009        	ld	__kdInfo+9,a
1151                     ; 258 	_kdInfo.water_shower_max =  br_kd_temp_format_wd(_ub.b[8]);
1153  0067 c6000c        	ld	a,__ub+12
1154  006a cd0000        	call	_br_kd_temp_format_wd
1156  006d c7000a        	ld	__kdInfo+10,a
1157                     ; 260 	_kdInfo.boiler_state_error = br_getHexToBin(_ub.b[10], 0);
1159  0070 5f            	clrw	x
1160  0071 ad6d          	call	LC005
1162  0073 c7000b        	ld	__kdInfo+11,a
1163                     ; 261 	_kdInfo.boiler_state_heat = br_getHexToBin(_ub.b[10], 1);
1165  0076 ae0001        	ldw	x,#1
1166  0079 ad65          	call	LC005
1168  007b c7000c        	ld	__kdInfo+12,a
1169                     ; 262 	_kdInfo.boiler_state_shower = br_getHexToBin(_ub.b[10], 2);
1171  007e ae0002        	ldw	x,#2
1172  0081 ad5d          	call	LC005
1174  0083 c7000d        	ld	__kdInfo+13,a
1175                     ; 263 	_kdInfo.boiler_state_heat = br_getHexToBin(_ub.b[10], 3);
1177  0086 ae0003        	ldw	x,#3
1178  0089 ad55          	call	LC005
1180  008b c7000c        	ld	__kdInfo+12,a
1181                     ; 264 	_kdInfo.boiler_state_use_shower = br_getHexToBin(_ub.b[10], 5);
1183  008e ae0005        	ldw	x,#5
1184  0091 ad4d          	call	LC005
1186  0093 c7000f        	ld	__kdInfo+15,a
1187                     ; 265 	_kdInfo.boiler_state_ice = br_getHexToBin(_ub.b[10], 6);
1189  0096 ae0006        	ldw	x,#6
1190  0099 ad45          	call	LC005
1192  009b c70010        	ld	__kdInfo+16,a
1193                     ; 266 	_kdInfo.boiler_state_warm_up = br_getHexToBin(_ub.b[10], 7);
1195  009e ae0007        	ldw	x,#7
1196  00a1 ad3d          	call	LC005
1198  00a3 c70011        	ld	__kdInfo+17,a
1199                     ; 268 	_kdInfo.curr_water_heat = br_kd_temp_format_wd(_ub.b[11]);
1201  00a6 c6000f        	ld	a,__ub+15
1202  00a9 cd0000        	call	_br_kd_temp_format_wd
1204  00ac c70013        	ld	__kdInfo+19,a
1205                     ; 269 	_kdInfo.curr_water_shower = br_kd_temp_format_wd(_ub.b[12]);
1207  00af c60010        	ld	a,__ub+16
1208  00b2 cd0000        	call	_br_kd_temp_format_wd
1210  00b5 c70014        	ld	__kdInfo+20,a
1211                     ; 271 	_kdInfo.boiler_error = _ub.b[13];
1213  00b8 c60011        	ld	a,__ub+17
1214  00bb c70012        	ld	__kdInfo+18,a
1215                     ; 273 	if (_kdInfo.boiler_state_error != 0) {
1217  00be 725d000b      	tnz	__kdInfo+11
1218  00c2 2709          	jreq	L133
1219                     ; 274 		func_cnt_error(ERROR_TYPE_BOILER, _kdInfo.boiler_error);
1221  00c4 97            	ld	xl,a
1222  00c5 a601          	ld	a,#1
1223  00c7 95            	ld	xh,a
1224  00c8 cd0000        	call	_func_cnt_error
1227  00cb 2009          	jra	L333
1228  00cd               L133:
1229                     ; 276 		if (funcInfo.error_type == ERROR_TYPE_BOILER) {
1231  00cd c60009        	ld	a,_funcInfo+9
1232  00d0 4a            	dec	a
1233  00d1 2603          	jrne	L333
1234                     ; 277 			func_cnt_errorReset();
1236  00d3 cd0000        	call	_func_cnt_errorReset
1238  00d6               L333:
1239                     ; 281 	br_kd_make();
1242                     ; 282 }
1245  00d6 cc0000        	jp	_br_kd_make
1246  00d9               LC004:
1247  00d9 c60008        	ld	a,__ub+8
1248  00dc 95            	ld	xh,a
1249  00dd cc0000        	jp	_br_getHexToBin
1250  00e0               LC005:
1251  00e0 c6000e        	ld	a,__ub+14
1252  00e3 95            	ld	xh,a
1253  00e4 cc0000        	jp	_br_getHexToBin
1445                     	xdef	_br_kd_make
1446                     	xdef	_br_kd_valveOpen_count
1447                     	xdef	_br_kd_isvalveOpen
1448                     	xdef	_br_kd_temp_format_kd
1449                     	xdef	_br_kd_temp_format_wd
1450                     	xdef	_br_kd_baseCheck
1451                     	xdef	_br_kd_check_checkSum
1452                     	xdef	_br_kd_makeChecksum
1453                     	xdef	_kd_error_reset
1454                     	xref	__is_shower
1455                     	xref	_hnInfo_clio
1456                     	xref	_hn_type
1457                     	xdef	_br_kd_error_reset
1458                     	xdef	_br_kd_ptc_check
1459                     	xref	_br_getHexToBin
1460                     	switch	.bss
1461  0000               __kdInfo:
1462  0000 000000000000  	ds.b	21
1463                     	xdef	__kdInfo
1464                     	xref	_br_buf_count
1465                     	xref	_br_buf_error
1466                     	xref	_br_error_checksum
1467                     	xref	_br_type
1468                     	xref	_br_connect
1469                     	xref	_func_cnt_error
1470                     	xref	_func_cnt_errorReset
1471                     	xref	_rcInfo
1472                     	xref	_funcInfo2
1473                     	xref	_funcInfo
1474                     	xref	__ub
1475                     	xref	_ext_br_error
1495                     	end
