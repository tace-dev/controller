   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  83                     ; 33 void hn_seoul_make_checkSum(uint8_t num, uint8_t val) {
  85                     .text:	section	.text,new
  86  0000               _hn_seoul_make_checkSum:
  88  0000 89            	pushw	x
  89  0001 89            	pushw	x
  90       00000002      OFST:	set	2
  93                     ; 37 	s = 0;
  95  0002 0f01          	clr	(OFST-1,sp)
  96                     ; 38 	for (i = 0 ; i < num ; i++) {
  98  0004 0f02          	clr	(OFST+0,sp)
 100  0006 200b          	jra	L73
 101  0008               L33:
 102                     ; 39 		s ^= _ua.r[i];
 104  0008 5f            	clrw	x
 105  0009 97            	ld	xl,a
 106  000a 7b01          	ld	a,(OFST-1,sp)
 107  000c d80054        	xor	a,(__ua+84,x)
 108  000f 6b01          	ld	(OFST-1,sp),a
 109                     ; 38 	for (i = 0 ; i < num ; i++) {
 111  0011 0c02          	inc	(OFST+0,sp)
 112  0013               L73:
 115  0013 7b02          	ld	a,(OFST+0,sp)
 116  0015 1103          	cp	a,(OFST+1,sp)
 117  0017 25ef          	jrult	L33
 118                     ; 42 	s = s & 0x7F;
 120  0019 7b01          	ld	a,(OFST-1,sp)
 121  001b a47f          	and	a,#127
 122  001d 6b01          	ld	(OFST-1,sp),a
 123                     ; 44 	_ua.r[val] = s;
 125  001f 5f            	clrw	x
 126  0020 7b04          	ld	a,(OFST+2,sp)
 127  0022 97            	ld	xl,a
 128  0023 7b01          	ld	a,(OFST-1,sp)
 129  0025 d70054        	ld	(__ua+84,x),a
 130                     ; 45 }
 133  0028 5b04          	addw	sp,#4
 134  002a 81            	ret	
 176                     ; 47 uint8_t hn_seoul_check_room_state(uint8_t room) {
 177                     .text:	section	.text,new
 178  0000               _hn_seoul_check_room_state:
 180  0000 88            	push	a
 181  0001 88            	push	a
 182       00000001      OFST:	set	1
 185                     ; 48 	uint8_t temp = (funcInfo.rcLED | funcInfo.sub_rcLED);
 187  0002 c60012        	ld	a,_funcInfo+18
 188  0005 ca0013        	or	a,_funcInfo+19
 189  0008 6b01          	ld	(OFST+0,sp),a
 190                     ; 50 	return getHexToBin(temp , room);
 192  000a 7b02          	ld	a,(OFST+1,sp)
 193  000c 97            	ld	xl,a
 194  000d 7b01          	ld	a,(OFST+0,sp)
 195  000f 95            	ld	xh,a
 196  0010 cd0000        	call	_getHexToBin
 200  0013 85            	popw	x
 201  0014 81            	ret	
 242                     ; 53 uint8_t hn_seoul_check_boiler(void) {
 243                     .text:	section	.text,new
 244  0000               _hn_seoul_check_boiler:
 246  0000 89            	pushw	x
 247       00000002      OFST:	set	2
 250                     ; 57 	val = 0;
 252  0001 0f01          	clr	(OFST-1,sp)
 253                     ; 58 	for (i = 0 ; i < 8 ; i++) {
 255  0003 4f            	clr	a
 256  0004 6b02          	ld	(OFST+0,sp),a
 257  0006               L77:
 258                     ; 59 		if (hn_seoul_check_room_state(i) == 1) {
 260  0006 cd0000        	call	_hn_seoul_check_room_state
 262  0009 4a            	dec	a
 263  000a 2603          	jrne	L501
 264                     ; 60 			val = 1;
 266  000c 4c            	inc	a
 267                     ; 61 			break;
 269  000d 200a          	jra	L301
 270  000f               L501:
 271                     ; 58 	for (i = 0 ; i < 8 ; i++) {
 273  000f 0c02          	inc	(OFST+0,sp)
 276  0011 7b02          	ld	a,(OFST+0,sp)
 277  0013 a108          	cp	a,#8
 278  0015 25ef          	jrult	L77
 279  0017 7b01          	ld	a,(OFST-1,sp)
 280  0019               L301:
 281                     ; 65 	return val;
 285  0019 85            	popw	x
 286  001a 81            	ret	
 327                     ; 68 uint8_t hn_seoul_check_error(void) {
 328                     .text:	section	.text,new
 329  0000               _hn_seoul_check_error:
 331  0000 89            	pushw	x
 332       00000002      OFST:	set	2
 335                     ; 69 	uint8_t error = funcInfo.error;
 337  0001 c60008        	ld	a,_funcInfo+8
 338  0004 6b02          	ld	(OFST+0,sp),a
 339                     ; 70 	uint8_t error_type = funcInfo.error_type;
 341  0006 c60009        	ld	a,_funcInfo+9
 342  0009 6b01          	ld	(OFST-1,sp),a
 343                     ; 72 	if (error == 0x00 && error_type == 0x00) {
 345  000b 7b02          	ld	a,(OFST+0,sp)
 346  000d 2605          	jrne	L521
 348  000f 0d01          	tnz	(OFST-1,sp)
 349  0011 2601          	jrne	L521
 350                     ; 73 		return 0xFF;
 352  0013 4a            	dec	a
 354  0014               L521:
 355                     ; 75 		return error;
 359  0014 85            	popw	x
 360  0015 81            	ret	
 386                     ; 79 void hn_seoul_ptc_make_init(void) {
 387                     .text:	section	.text,new
 388  0000               _hn_seoul_ptc_make_init:
 392                     ; 80 	_ua.r[0] = SEOUL_ACK;
 394  0000 35b00054      	mov	__ua+84,#176
 395                     ; 81 	_ua.r[1] = SEOUL_DATA_INIT;
 397  0004 355a0055      	mov	__ua+85,#90
 398                     ; 82 	_ua.r[2] = 0x00;
 400  0008 725f0056      	clr	__ua+86
 401                     ; 84 	hn_seoul_make_checkSum(3, 3);
 403  000c ae0303        	ldw	x,#771
 404  000f cd0000        	call	_hn_seoul_make_checkSum
 406                     ; 86 	SEOUL_SEND(4);
 408  0012 35040003      	mov	__ua+3,#4
 411  0016 350100a4      	mov	__ua+164,#1
 414  001a 350500a5      	mov	__ua+165,#5
 415                     ; 87 }
 419  001e 81            	ret	
 445                     ; 89 void hn_seoul_ptc_make_free(void) {
 446                     .text:	section	.text,new
 447  0000               _hn_seoul_ptc_make_free:
 451                     ; 90 	_ua.r[0] = SEOUL_ACK;
 453  0000 35b00054      	mov	__ua+84,#176
 454                     ; 91 	_ua.r[1] = SEOUL_DATA_FREE;
 456  0004 35410055      	mov	__ua+85,#65
 457                     ; 92 	_ua.r[2] = 0x00;
 459  0008 725f0056      	clr	__ua+86
 460                     ; 94 	hn_seoul_make_checkSum(3, 3);
 462  000c ae0303        	ldw	x,#771
 463  000f cd0000        	call	_hn_seoul_make_checkSum
 465                     ; 96 	SEOUL_SEND(4);
 467  0012 35040003      	mov	__ua+3,#4
 470  0016 350100a4      	mov	__ua+164,#1
 473  001a 350500a5      	mov	__ua+165,#5
 474                     ; 97 }
 478  001e 81            	ret	
 539                     ; 99 void hn_seoul_ptc_make_onoff_state(void) {
 540                     .text:	section	.text,new
 541  0000               _hn_seoul_ptc_make_onoff_state:
 543  0000 5203          	subw	sp,#3
 544       00000003      OFST:	set	3
 547                     ; 105 	id = _ua.b[2];
 549  0002 c60006        	ld	a,__ua+6
 550  0005 6b03          	ld	(OFST+0,sp),a
 551                     ; 106 	_ua.r[0] = SEOUL_ACK;
 553  0007 35b00054      	mov	__ua+84,#176
 554                     ; 107 	_ua.r[1] = SEOUL_DATA_HEAT_ONOFF_STATE;
 556  000b 357c0055      	mov	__ua+85,#124
 557                     ; 108 	_ua.r[2] = id;
 559  000f c70056        	ld	__ua+86,a
 560                     ; 109 	if (id == 0x0B) {
 562  0012 a10b          	cp	a,#11
 563  0014 2608          	jrne	L371
 564                     ; 110 		_ua.r[3] = hn_seoul_check_boiler();
 566  0016 cd0000        	call	_hn_seoul_check_boiler
 568  0019 c70057        	ld	__ua+87,a
 569                     ; 111 		_ua.r[4] = 0x00;
 570                     ; 112 		_ua.r[5] = 0x00;
 572  001c 201d          	jp	LC001
 573  001e               L371:
 574                     ; 113 	} else if (id == 0x15) {
 576  001e a115          	cp	a,#21
 577  0020 2611          	jrne	L771
 578                     ; 114 		_ua.r[3] = _is_shower;
 580  0022 5500000057    	mov	__ua+87,__is_shower
 581                     ; 115 		_ua.r[4] = funcInfo.boiler_set_water_shower;
 583  0027 5500030058    	mov	__ua+88,_funcInfo+3
 584                     ; 116 		_ua.r[5] = funcInfo.boiler_water_shower;
 586  002c 5500010059    	mov	__ua+89,_funcInfo+1
 588  0031 204e          	jra	L571
 589  0033               L771:
 590                     ; 118 		if (id > 7) {
 592  0033 a108          	cp	a,#8
 593  0035 250e          	jrult	L302
 594                     ; 119 			_ua.r[3] = 0x00;
 596  0037 725f0057      	clr	__ua+87
 597                     ; 120 			_ua.r[4] = 0x00;
 599                     ; 121 			_ua.r[5] = 0x00;
 601  003b               LC001:
 603  003b 725f0058      	clr	__ua+88
 605  003f 725f0059      	clr	__ua+89
 607  0043 203c          	jra	L571
 608  0045               L302:
 609                     ; 123 			curTemp = rcInfo.curr_temp[id - 1] / 2;
 611  0045 5f            	clrw	x
 612  0046 97            	ld	xl,a
 613  0047 5a            	decw	x
 614  0048 d60000        	ld	a,(_rcInfo,x)
 615  004b 5f            	clrw	x
 616  004c 97            	ld	xl,a
 617  004d 57            	sraw	x
 618  004e 01            	rrwa	x,a
 619  004f 6b01          	ld	(OFST-2,sp),a
 620                     ; 124 			setTemp = rcInfo.setup_temp[id - 1] / 2;
 622  0051 5f            	clrw	x
 623  0052 7b03          	ld	a,(OFST+0,sp)
 624  0054 97            	ld	xl,a
 625  0055 5a            	decw	x
 626  0056 d60008        	ld	a,(_rcInfo+8,x)
 627  0059 5f            	clrw	x
 628  005a 97            	ld	xl,a
 629  005b 57            	sraw	x
 630  005c 01            	rrwa	x,a
 631  005d 6b02          	ld	(OFST-1,sp),a
 632                     ; 125 			rcMode = rcInfo.mode[id - 1];
 634  005f 5f            	clrw	x
 635  0060 7b03          	ld	a,(OFST+0,sp)
 636  0062 97            	ld	xl,a
 637  0063 5a            	decw	x
 638  0064 d60010        	ld	a,(_rcInfo+16,x)
 639  0067 6b03          	ld	(OFST+0,sp),a
 640                     ; 127 			if (rcMode == MODE_STOP || rcMode == MODE_OUT) {
 642  0069 a104          	cp	a,#4
 643  006b 2704          	jreq	L112
 645  006d a102          	cp	a,#2
 646  006f 262b          	jrne	L702
 647  0071               L112:
 648                     ; 128 				rcMode = 0;
 650  0071 4f            	clr	a
 652  0072               L312:
 653  0072 6b03          	ld	(OFST+0,sp),a
 654                     ; 132 			_ua.r[3] = rcMode;
 656  0074 c70057        	ld	__ua+87,a
 657                     ; 133 			_ua.r[4] = setTemp;
 659  0077 7b02          	ld	a,(OFST-1,sp)
 660  0079 c70058        	ld	__ua+88,a
 661                     ; 134 			_ua.r[5] = curTemp;
 663  007c 7b01          	ld	a,(OFST-2,sp)
 664  007e c70059        	ld	__ua+89,a
 665  0081               L571:
 666                     ; 138 	_ua.r[6] = hn_seoul_check_error();  // error
 668  0081 cd0000        	call	_hn_seoul_check_error
 670  0084 c7005a        	ld	__ua+90,a
 671                     ; 140 	hn_seoul_make_checkSum(7, 7);
 673  0087 ae0707        	ldw	x,#1799
 674  008a cd0000        	call	_hn_seoul_make_checkSum
 676                     ; 142 	SEOUL_SEND(8);
 678  008d 35080003      	mov	__ua+3,#8
 681  0091 350100a4      	mov	__ua+164,#1
 684  0095 350500a5      	mov	__ua+165,#5
 685                     ; 143 }
 689  0099 5b03          	addw	sp,#3
 690  009b 81            	ret	
 691  009c               L702:
 692                     ; 130 				rcMode = 1;
 694  009c a601          	ld	a,#1
 695  009e 20d2          	jra	L312
 748                     ; 146 void hn_seoul_ptc_make_onoff_cntl(void) {
 749                     .text:	section	.text,new
 750  0000               _hn_seoul_ptc_make_onoff_cntl:
 752  0000 5203          	subw	sp,#3
 753       00000003      OFST:	set	3
 756                     ; 151 	id = _ua.b[2];
 758  0002 c60006        	ld	a,__ua+6
 759  0005 6b03          	ld	(OFST+0,sp),a
 760                     ; 152 	_ua.r[0] = SEOUL_ACK;
 762  0007 35b00054      	mov	__ua+84,#176
 763                     ; 153 	_ua.r[1] = SEOUL_DATA_HEAT_ONOFF_CNTL;
 765  000b 357d0055      	mov	__ua+85,#125
 766                     ; 154 	_ua.r[2] = id;
 768  000f c70056        	ld	__ua+86,a
 769                     ; 156 	if (id == 0x0B) {
 771  0012 a10b          	cp	a,#11
 772                     ; 158 		_ua.r[3] = 0x00;
 773                     ; 161 		_ua.r[4] = 0x00;
 774                     ; 162 		_ua.r[5] = 0x00;
 776  0014 273a          	jreq	LC003
 777                     ; 163 	} else if (id == 0x15) {
 779  0016 a115          	cp	a,#21
 780                     ; 165 		_ua.r[3] = 0x00;
 781                     ; 168 		_ua.r[4] = 0x00;
 782                     ; 169 		_ua.r[5] = 0x00;
 784  0018 2736          	jreq	LC003
 785                     ; 170 	} else if(id == 0) {
 787  001a 7b03          	ld	a,(OFST+0,sp)
 788  001c 262e          	jrne	L542
 789                     ; 172 		curTemp = rcInfo.curr_temp[id - 1] / 2;
 791  001e cd00ac        	call	LC005
 792  0021 6b01          	ld	(OFST-2,sp),a
 793                     ; 173 		setTemp = rcInfo.setup_temp[id - 1] / 2;
 795  0023 5f            	clrw	x
 796  0024 7b03          	ld	a,(OFST+0,sp)
 797  0026 cd00b7        	call	LC006
 798  0029 6b02          	ld	(OFST-1,sp),a
 799                     ; 175 		_ua.r[3] = _ua.b[3];
 801  002b 5500070057    	mov	__ua+87,__ua+7
 802                     ; 176 		_ua.r[4] = setTemp;
 804  0030 c70058        	ld	__ua+88,a
 805                     ; 177 		_ua.r[5] = curTemp;
 807  0033 7b01          	ld	a,(OFST-2,sp)
 808  0035 c70059        	ld	__ua+89,a
 809                     ; 179 		hnCnt.id = 1;
 811  0038 a601          	ld	a,#1
 812  003a c70000        	ld	_hnCnt,a
 813                     ; 180 		hnCnt.comm = 0;
 815  003d 725f0003      	clr	_hnCnt+3
 816                     ; 181 		msg_hn = 1;
 818  0041 c70000        	ld	_msg_hn,a
 819                     ; 183 		hnCnt.mode = (_ua.r[3] == 0) ? MODE_OUT : MODE_HOT;
 821  0044 725d0057      	tnz	__ua+87
 822  0048 2640          	jrne	L05
 823                     ; 184 		hnCnt.setup_temp = 0xFF;
 825  004a 203d          	jp	LC004
 826  004c               L542:
 827                     ; 186 		if (id > 7) {
 829  004c a108          	cp	a,#8
 830  004e 250e          	jrult	L152
 831                     ; 187 			_ua.r[3] = 0x00;
 833                     ; 188 			_ua.r[4] = 0x00;
 835                     ; 189 			_ua.r[5] = 0x00;
 837  0050               LC003:
 840  0050 725f0057      	clr	__ua+87
 843  0054 725f0058      	clr	__ua+88
 846  0058 725f0059      	clr	__ua+89
 848  005c 2033          	jra	L732
 849  005e               L152:
 850                     ; 191 			curTemp = rcInfo.curr_temp[id - 1] / 2;
 852  005e ad4c          	call	LC005
 853  0060 6b01          	ld	(OFST-2,sp),a
 854                     ; 192 			setTemp = rcInfo.setup_temp[id - 1] / 2;
 856  0062 5f            	clrw	x
 857  0063 7b03          	ld	a,(OFST+0,sp)
 858  0065 ad50          	call	LC006
 859  0067 6b02          	ld	(OFST-1,sp),a
 860                     ; 194 			_ua.r[3] = _ua.b[3];
 862  0069 5500070057    	mov	__ua+87,__ua+7
 863                     ; 195 			_ua.r[4] = setTemp;
 865  006e c70058        	ld	__ua+88,a
 866                     ; 196 			_ua.r[5] = curTemp;
 868  0071 7b01          	ld	a,(OFST-2,sp)
 869  0073 c70059        	ld	__ua+89,a
 870                     ; 198 			hnCnt.id = id;
 872  0076 7b03          	ld	a,(OFST+0,sp)
 873  0078 c70000        	ld	_hnCnt,a
 874                     ; 199 			hnCnt.comm = 1;  // 개별 조절
 876  007b a601          	ld	a,#1
 877  007d c70003        	ld	_hnCnt+3,a
 878                     ; 200 			msg_hn = 1;
 880  0080 c70000        	ld	_msg_hn,a
 881                     ; 201 			hnCnt.mode = (_ua.r[3] == 0) ? MODE_OUT : MODE_HOT;
 883  0083 725d0057      	tnz	__ua+87
 884  0087 2601          	jrne	L05
 885  0089               LC004:
 886  0089 4c            	inc	a
 887  008a               L05:
 888                     ; 202 			hnCnt.setup_temp = 0xFF;
 890  008a c70001        	ld	_hnCnt+1,a
 892  008d 35ff0002      	mov	_hnCnt+2,#255
 893  0091               L732:
 894                     ; 206 	_ua.r[6] = hn_seoul_check_error();  // error
 896  0091 cd0000        	call	_hn_seoul_check_error
 898  0094 c7005a        	ld	__ua+90,a
 899                     ; 208 	hn_seoul_make_checkSum(7, 7);
 901  0097 ae0707        	ldw	x,#1799
 902  009a cd0000        	call	_hn_seoul_make_checkSum
 904                     ; 210 	SEOUL_SEND(8);
 906  009d 35080003      	mov	__ua+3,#8
 909  00a1 350100a4      	mov	__ua+164,#1
 912  00a5 350500a5      	mov	__ua+165,#5
 913                     ; 211 }
 917  00a9 5b03          	addw	sp,#3
 918  00ab 81            	ret	
 919  00ac               LC005:
 920  00ac 5f            	clrw	x
 921  00ad 97            	ld	xl,a
 922  00ae 5a            	decw	x
 923  00af d60000        	ld	a,(_rcInfo,x)
 924  00b2 5f            	clrw	x
 925  00b3 97            	ld	xl,a
 926  00b4 57            	sraw	x
 927  00b5 01            	rrwa	x,a
 928  00b6 81            	ret	
 929  00b7               LC006:
 930  00b7 97            	ld	xl,a
 931  00b8 5a            	decw	x
 932  00b9 d60008        	ld	a,(_rcInfo+8,x)
 933  00bc 5f            	clrw	x
 934  00bd 97            	ld	xl,a
 935  00be 57            	sraw	x
 936  00bf 01            	rrwa	x,a
 937  00c0 81            	ret	
 988                     ; 213 void hn_seoul_ptc_make_temp_state(void) {
 989                     .text:	section	.text,new
 990  0000               _hn_seoul_ptc_make_temp_state:
 992  0000 5203          	subw	sp,#3
 993       00000003      OFST:	set	3
 996                     ; 218 	id = _ua.b[2];
 998  0002 c60006        	ld	a,__ua+6
 999  0005 6b03          	ld	(OFST+0,sp),a
1000                     ; 219 	curTemp = rcInfo.curr_temp[id - 1] / 2;
1002                     ; 220 	setTemp = rcInfo.setup_temp[id - 1] / 2;
1004  0007 5f            	clrw	x
1005  0008 97            	ld	xl,a
1006  0009 5a            	decw	x
1007  000a d60008        	ld	a,(_rcInfo+8,x)
1008  000d 5f            	clrw	x
1009  000e 97            	ld	xl,a
1010  000f 57            	sraw	x
1011  0010 01            	rrwa	x,a
1012  0011 6b02          	ld	(OFST-1,sp),a
1013                     ; 222 	_ua.r[0] = SEOUL_ACK;
1015  0013 35b00054      	mov	__ua+84,#176
1016                     ; 223 	_ua.r[1] = SEOUL_DATA_HEAT_TEMP_STATE;
1018  0017 357e0055      	mov	__ua+85,#126
1019                     ; 224 	_ua.r[2] = id;
1021  001b 7b03          	ld	a,(OFST+0,sp)
1022  001d c70056        	ld	__ua+86,a
1023                     ; 225 	_ua.r[3] = setTemp;
1025  0020 7b02          	ld	a,(OFST-1,sp)
1026  0022 c70057        	ld	__ua+87,a
1027                     ; 226 	_ua.r[4] = 0x00;
1029  0025 725f0058      	clr	__ua+88
1030                     ; 227 	_ua.r[5] = 0x00;
1032  0029 725f0059      	clr	__ua+89
1033                     ; 229 	_ua.r[6] = hn_seoul_check_error();  // error
1035  002d cd0000        	call	_hn_seoul_check_error
1037  0030 c7005a        	ld	__ua+90,a
1038                     ; 231 	hn_seoul_make_checkSum(7, 7);
1040  0033 ae0707        	ldw	x,#1799
1041  0036 cd0000        	call	_hn_seoul_make_checkSum
1043                     ; 233 	SEOUL_SEND(8);
1045  0039 35080003      	mov	__ua+3,#8
1048  003d 350100a4      	mov	__ua+164,#1
1051  0041 350500a5      	mov	__ua+165,#5
1052                     ; 234 }
1056  0045 5b03          	addw	sp,#3
1057  0047 81            	ret	
1096                     ; 236 void hn_seoul_ptc_make_temp_cntl(void) {
1097                     .text:	section	.text,new
1098  0000               _hn_seoul_ptc_make_temp_cntl:
1100  0000 88            	push	a
1101       00000001      OFST:	set	1
1104                     ; 239 	id = _ua.b[2];
1106  0001 c60006        	ld	a,__ua+6
1107  0004 6b01          	ld	(OFST+0,sp),a
1108                     ; 241 	_ua.r[0] = SEOUL_ACK;
1110  0006 35b00054      	mov	__ua+84,#176
1111                     ; 242 	_ua.r[1] = SEOUL_DATA_HEAT_TEMP_CNTL;
1113  000a 357f0055      	mov	__ua+85,#127
1114                     ; 243 	_ua.r[2] = id;
1116  000e c70056        	ld	__ua+86,a
1117                     ; 244 	_ua.r[3] = _ua.b[3];
1119  0011 5500070057    	mov	__ua+87,__ua+7
1120                     ; 245 	_ua.r[4] = 0x00;
1122  0016 725f0058      	clr	__ua+88
1123                     ; 246 	_ua.r[5] = 0x00;
1125  001a 725f0059      	clr	__ua+89
1126                     ; 248 	_ua.r[6] = hn_seoul_check_error();  // error
1128  001e cd0000        	call	_hn_seoul_check_error
1130  0021 c7005a        	ld	__ua+90,a
1131                     ; 250 	hn_seoul_make_checkSum(7, 7);
1133  0024 ae0707        	ldw	x,#1799
1134  0027 cd0000        	call	_hn_seoul_make_checkSum
1136                     ; 252 	SEOUL_SEND(8);
1138  002a 35080003      	mov	__ua+3,#8
1141  002e 350100a4      	mov	__ua+164,#1
1144  0032 350500a5      	mov	__ua+165,#5
1145                     ; 254 	if (id == 0x15) {
1148  0036 7b01          	ld	a,(OFST+0,sp)
1149  0038 a115          	cp	a,#21
1150  003a 2607          	jrne	L113
1151                     ; 255 		funcInfo.boiler_set_water_shower = _ua.b[3];
1153  003c 5500070003    	mov	_funcInfo+3,__ua+7
1154                     ; 256 		return;
1157  0041 84            	pop	a
1158  0042 81            	ret	
1159  0043               L113:
1160                     ; 259 	hnCnt.id = id;
1162  0043 c70000        	ld	_hnCnt,a
1163                     ; 260 	hnCnt.comm = 0;
1165  0046 725f0003      	clr	_hnCnt+3
1166                     ; 261 	msg_hn = 1;
1168  004a 35010000      	mov	_msg_hn,#1
1169                     ; 262 	hnCnt.mode = MODE_HOT;
1171  004e 35010001      	mov	_hnCnt+1,#1
1172                     ; 263 	hnCnt.setup_temp = _ua.b[3] * 2;
1174  0052 c60007        	ld	a,__ua+7
1175  0055 48            	sll	a
1176  0056 c70002        	ld	_hnCnt+2,a
1177                     ; 264 }
1180  0059 84            	pop	a
1181  005a 81            	ret	
1209                     ; 266 void hn_seoul_ptc_make_bath_state(void) {
1210                     .text:	section	.text,new
1211  0000               _hn_seoul_ptc_make_bath_state:
1215                     ; 268 	_ua.r[0] = SEOUL_ACK;
1217  0000 35b00054      	mov	__ua+84,#176
1218                     ; 269 	_ua.r[1] = SEOUL_DATA_BATH_STATE;
1220  0004 35560055      	mov	__ua+85,#86
1221                     ; 270 	_ua.r[2] = _is_shower;
1223  0008 5500000056    	mov	__ua+86,__is_shower
1224                     ; 271 	_ua.r[3] = 0x00;
1226  000d 725f0057      	clr	__ua+87
1227                     ; 272 	_ua.r[4] = 0x00;
1229  0011 725f0058      	clr	__ua+88
1230                     ; 273 	_ua.r[5] = 0x00;
1232  0015 725f0059      	clr	__ua+89
1233                     ; 274 	_ua.r[6] = hn_seoul_check_error();  // error
1235  0019 cd0000        	call	_hn_seoul_check_error
1237  001c c7005a        	ld	__ua+90,a
1238                     ; 276 	hn_seoul_make_checkSum(7, 7);
1240  001f ae0707        	ldw	x,#1799
1241  0022 cd0000        	call	_hn_seoul_make_checkSum
1243                     ; 277 	SEOUL_SEND(8);
1245  0025 35080003      	mov	__ua+3,#8
1248  0029 350100a4      	mov	__ua+164,#1
1251  002d 350500a5      	mov	__ua+165,#5
1252                     ; 278 }
1256  0031 81            	ret	
1284                     ; 280 void hn_seoul_ptc_make_bath_cntl(void) {
1285                     .text:	section	.text,new
1286  0000               _hn_seoul_ptc_make_bath_cntl:
1290                     ; 281 	_is_shower = _ua.b[2];
1292  0000 5500060000    	mov	__is_shower,__ua+6
1293                     ; 283 	_ua.r[0] = SEOUL_ACK;
1295  0005 35b00054      	mov	__ua+84,#176
1296                     ; 284 	_ua.r[1] = SEOUL_DATA_BATH_CNTL;
1298  0009 35570055      	mov	__ua+85,#87
1299                     ; 285 	_ua.r[2] = _is_shower;
1301  000d 5500000056    	mov	__ua+86,__is_shower
1302                     ; 286 	_ua.r[3] = 0x00;
1304  0012 725f0057      	clr	__ua+87
1305                     ; 287 	_ua.r[4] = 0x00;
1307  0016 725f0058      	clr	__ua+88
1308                     ; 288 	_ua.r[5] = 0x00;
1310  001a 725f0059      	clr	__ua+89
1311                     ; 289 	_ua.r[6] = hn_seoul_check_error();  // error
1313  001e cd0000        	call	_hn_seoul_check_error
1315  0021 c7005a        	ld	__ua+90,a
1316                     ; 291 	hn_seoul_make_checkSum(7, 7);
1318  0024 ae0707        	ldw	x,#1799
1319  0027 cd0000        	call	_hn_seoul_make_checkSum
1321                     ; 292 	SEOUL_SEND(8);
1323  002a 35080003      	mov	__ua+3,#8
1326  002e 350100a4      	mov	__ua+164,#1
1329  0032 350500a5      	mov	__ua+165,#5
1330                     ; 293 }
1334  0036 81            	ret	
1362                     ; 295 void hn_seoul_ptc_make_bath_temp_state(void) {
1363                     .text:	section	.text,new
1364  0000               _hn_seoul_ptc_make_bath_temp_state:
1368                     ; 296 	_ua.r[0] = SEOUL_ACK;
1370  0000 35b00054      	mov	__ua+84,#176
1371                     ; 297 	_ua.r[1] = SEOUL_DATA_HEAT_TEMP_STATE;
1373  0004 357e0055      	mov	__ua+85,#126
1374                     ; 298 	_ua.r[2] = funcInfo.boiler_water_shower;
1376  0008 5500010056    	mov	__ua+86,_funcInfo+1
1377                     ; 299 	_ua.r[3] = 0x00;
1379  000d 725f0057      	clr	__ua+87
1380                     ; 300 	_ua.r[4] = 0x00;
1382  0011 725f0058      	clr	__ua+88
1383                     ; 301 	_ua.r[5] = 0x00;
1385  0015 725f0059      	clr	__ua+89
1386                     ; 302 	_ua.r[6] = hn_seoul_check_error();  // error
1388  0019 cd0000        	call	_hn_seoul_check_error
1390  001c c7005a        	ld	__ua+90,a
1391                     ; 304 	hn_seoul_make_checkSum(7, 7);
1393  001f ae0707        	ldw	x,#1799
1394  0022 cd0000        	call	_hn_seoul_make_checkSum
1396                     ; 305 	SEOUL_SEND(8);
1398  0025 35080003      	mov	__ua+3,#8
1401  0029 350100a4      	mov	__ua+164,#1
1404  002d 350500a5      	mov	__ua+165,#5
1405                     ; 307 }
1409  0031 81            	ret	
1437                     ; 309 void hn_seoul_ptc_make_bath_temp_cntl(void) {
1438                     .text:	section	.text,new
1439  0000               _hn_seoul_ptc_make_bath_temp_cntl:
1443                     ; 310 	funcInfo.boiler_set_water_shower = _ua.b[2];
1445  0000 5500060003    	mov	_funcInfo+3,__ua+6
1446                     ; 312 	_ua.r[0] = SEOUL_ACK;
1448  0005 35b00054      	mov	__ua+84,#176
1449                     ; 313 	_ua.r[1] = SEOUL_DATA_HEAT_TEMP_CNTL;
1451  0009 357f0055      	mov	__ua+85,#127
1452                     ; 314 	_ua.r[2] = funcInfo.boiler_set_water_shower;
1454  000d 5500030056    	mov	__ua+86,_funcInfo+3
1455                     ; 315 	_ua.r[3] = 0x00;
1457  0012 725f0057      	clr	__ua+87
1458                     ; 316 	_ua.r[4] = 0x00;
1460  0016 725f0058      	clr	__ua+88
1461                     ; 317 	_ua.r[5] = 0x00;
1463  001a 725f0059      	clr	__ua+89
1464                     ; 318 	_ua.r[6] = hn_seoul_check_error();  // error
1466  001e cd0000        	call	_hn_seoul_check_error
1468  0021 c7005a        	ld	__ua+90,a
1469                     ; 320 	hn_seoul_make_checkSum(7, 7);
1471  0024 ae0707        	ldw	x,#1799
1472  0027 cd0000        	call	_hn_seoul_make_checkSum
1474                     ; 321 	SEOUL_SEND(8);
1476  002a 35080003      	mov	__ua+3,#8
1479  002e 350100a4      	mov	__ua+164,#1
1482  0032 350500a5      	mov	__ua+165,#5
1483                     ; 322 }
1487  0036 81            	ret	
1530                     ; 324 void hn_seoul_ptc_make(void) {
1531                     .text:	section	.text,new
1532  0000               _hn_seoul_ptc_make:
1534  0000 88            	push	a
1535       00000001      OFST:	set	1
1538                     ; 326 	mode = _ua.b[1];
1540  0001 c60005        	ld	a,__ua+5
1541  0004 6b01          	ld	(OFST+0,sp),a
1542                     ; 328 	switch (mode) {
1545                     ; 358 	break;
1546  0006 a041          	sub	a,#65
1547  0008 2726          	jreq	L553
1548  000a a009          	sub	a,#9
1549  000c 2745          	jreq	L373
1550  000e 4a            	dec	a
1551  000f 2747          	jreq	L573
1552  0011 a00b          	sub	a,#11
1553  0013 2734          	jreq	L763
1554  0015 4a            	dec	a
1555  0016 2736          	jreq	L173
1556  0018 a003          	sub	a,#3
1557  001a 270f          	jreq	L353
1558  001c a022          	sub	a,#34
1559  001e 2715          	jreq	L753
1560  0020 4a            	dec	a
1561  0021 2717          	jreq	L163
1562  0023 4a            	dec	a
1563  0024 2719          	jreq	L363
1564  0026 4a            	dec	a
1565  0027 271b          	jreq	L563
1566  0029 2030          	jra	L514
1567  002b               L353:
1568                     ; 329 	case SEOUL_DATA_INIT: 	
1568                     ; 330 		hn_seoul_ptc_make_init();			
1570  002b cd0000        	call	_hn_seoul_ptc_make_init
1572                     ; 331 		break;   
1574  002e 202b          	jra	L514
1575  0030               L553:
1576                     ; 332 	case SEOUL_DATA_FREE:				
1576                     ; 333 		hn_seoul_ptc_make_free();	
1578  0030 cd0000        	call	_hn_seoul_ptc_make_free
1580                     ; 334 		break;
1582  0033 2026          	jra	L514
1583  0035               L753:
1584                     ; 335 	case SEOUL_DATA_HEAT_ONOFF_STATE:				// 난방/온수 on/off 상태요구 
1584                     ; 336 		hn_seoul_ptc_make_onoff_state();
1586  0035 cd0000        	call	_hn_seoul_ptc_make_onoff_state
1588                     ; 337 	break;
1590  0038 2021          	jra	L514
1591  003a               L163:
1592                     ; 338 	case SEOUL_DATA_HEAT_ONOFF_CNTL:				// 난방/온수 on/off 제어 
1592                     ; 339 		hn_seoul_ptc_make_onoff_cntl();
1594  003a cd0000        	call	_hn_seoul_ptc_make_onoff_cntl
1596                     ; 340 	break;
1598  003d 201c          	jra	L514
1599  003f               L363:
1600                     ; 341 	case SEOUL_DATA_HEAT_TEMP_STATE:				// 난방/온수 온도뉵纘쩔峨� 
1600                     ; 342 		hn_seoul_ptc_make_temp_state();
1602  003f cd0000        	call	_hn_seoul_ptc_make_temp_state
1604                     ; 343 	break;
1606  0042 2017          	jra	L514
1607  0044               L563:
1608                     ; 344 	case SEOUL_DATA_HEAT_TEMP_CNTL: 				// 난방/온수 온도단계 제어
1608                     ; 345 		hn_seoul_ptc_make_temp_cntl();
1610  0044 cd0000        	call	_hn_seoul_ptc_make_temp_cntl
1612                     ; 346 	break;
1614  0047 2012          	jra	L514
1615  0049               L763:
1616                     ; 347 	case SEOUL_DATA_BATH_STATE: 						// 온수기능 상태요구 
1616                     ; 348 		hn_seoul_ptc_make_bath_state();
1618  0049 cd0000        	call	_hn_seoul_ptc_make_bath_state
1620                     ; 349 	break;
1622  004c 200d          	jra	L514
1623  004e               L173:
1624                     ; 350 	case SEOUL_DATA_BATH_CNTL: 							// 온수기능 제어
1624                     ; 351 		hn_seoul_ptc_make_bath_cntl();
1626  004e cd0000        	call	_hn_seoul_ptc_make_bath_cntl
1628                     ; 352 	break;
1630  0051 2008          	jra	L514
1631  0053               L373:
1632                     ; 353 	case SEOUL_DATA_BATH_TEMP_STATE: 				// 온수기능 온도상태 요구
1632                     ; 354 		hn_seoul_ptc_make_bath_temp_state();
1634  0053 cd0000        	call	_hn_seoul_ptc_make_bath_temp_state
1636                     ; 355 	break;
1638  0056 2003          	jra	L514
1639  0058               L573:
1640                     ; 356 	case SEOUL_DATA_BATH_TEMP_CNTL: 				// 온수기능 온도제어
1640                     ; 357 		hn_seoul_ptc_make_bath_temp_cntl();
1642  0058 cd0000        	call	_hn_seoul_ptc_make_bath_temp_cntl
1644                     ; 358 	break;
1646  005b               L514:
1647                     ; 360 }
1650  005b 84            	pop	a
1651  005c 81            	ret	
1706                     ; 364 uint8_t hn_seoul_check_checkSum(uint8_t num, uint8_t val) {
1707                     .text:	section	.text,new
1708  0000               _hn_seoul_check_checkSum:
1710  0000 89            	pushw	x
1711  0001 89            	pushw	x
1712       00000002      OFST:	set	2
1715                     ; 368 	s = 0;
1717  0002 0f01          	clr	(OFST-1,sp)
1718                     ; 369 	for (i = 0 ; i < num ; i++) {
1720  0004 0f02          	clr	(OFST+0,sp)
1722  0006 200b          	jra	L544
1723  0008               L144:
1724                     ; 370 		s ^= _ua.b[i];
1726  0008 5f            	clrw	x
1727  0009 97            	ld	xl,a
1728  000a 7b01          	ld	a,(OFST-1,sp)
1729  000c d80004        	xor	a,(__ua+4,x)
1730  000f 6b01          	ld	(OFST-1,sp),a
1731                     ; 369 	for (i = 0 ; i < num ; i++) {
1733  0011 0c02          	inc	(OFST+0,sp)
1734  0013               L544:
1737  0013 7b02          	ld	a,(OFST+0,sp)
1738  0015 1103          	cp	a,(OFST+1,sp)
1739  0017 25ef          	jrult	L144
1740                     ; 373 	s = s & 0x7F;
1742  0019 7b01          	ld	a,(OFST-1,sp)
1743  001b a47f          	and	a,#127
1744  001d 6b01          	ld	(OFST-1,sp),a
1745                     ; 375 	if (s == _ua.b[val]) {
1747  001f 5f            	clrw	x
1748  0020 7b04          	ld	a,(OFST+2,sp)
1749  0022 97            	ld	xl,a
1750  0023 d60004        	ld	a,(__ua+4,x)
1751  0026 1101          	cp	a,(OFST-1,sp)
1752  0028 2604          	jrne	L154
1753                     ; 376 		return 1;
1755  002a a601          	ld	a,#1
1757  002c 2001          	jra	L451
1758  002e               L154:
1759                     ; 379 	return 0;
1761  002e 4f            	clr	a
1763  002f               L451:
1765  002f 5b04          	addw	sp,#4
1766  0031 81            	ret	
1798                     ; 382 uint8_t hn_seoul_ptc_base_check(void){
1799                     .text:	section	.text,new
1800  0000               _hn_seoul_ptc_base_check:
1804                     ; 383 	if (hn_buf_count == 15) {
1806  0000 c60000        	ld	a,_hn_buf_count
1807  0003 a10f          	cp	a,#15
1808  0005 2604          	jrne	L364
1809                     ; 384 		hn_buf_count = 0;
1811  0007 725f0000      	clr	_hn_buf_count
1812  000b               L364:
1813                     ; 387 	if (_ua.b[0] != 0xAE) {
1815  000b c60004        	ld	a,__ua+4
1816  000e a1ae          	cp	a,#174
1817  0010 2702          	jreq	L564
1818                     ; 388 		hn_buf_error[hn_buf_count++] = 1;
1820  0012 203b          	jp	LC007
1821  0014               L564:
1822                     ; 392 	if (_ua.i == 4) {
1824  0014 c60002        	ld	a,__ua+2
1825  0017 a104          	cp	a,#4
1826  0019 260f          	jrne	L764
1827                     ; 393 		if (hn_seoul_check_checkSum(3, 3) == 0) {
1829  001b ae0303        	ldw	x,#771
1830  001e cd0000        	call	_hn_seoul_check_checkSum
1832  0021 4d            	tnz	a
1833  0022 2615          	jrne	L374
1834                     ; 394 			hn_error_checksum = 1;
1836  0024 35010000      	mov	_hn_error_checksum,#1
1837                     ; 395 			hn_buf_error[hn_buf_count++] = 1;
1839  0028 2025          	jp	LC007
1840  002a               L764:
1841                     ; 399 		if (hn_seoul_check_checkSum(7, 7) == 0) {
1843  002a ae0707        	ldw	x,#1799
1844  002d cd0000        	call	_hn_seoul_check_checkSum
1846  0030 4d            	tnz	a
1847  0031 2606          	jrne	L374
1848                     ; 400 			hn_error_checksum = 1;
1850  0033 35010000      	mov	_hn_error_checksum,#1
1851                     ; 401 			hn_buf_error[hn_buf_count++] = 1;
1853  0037 2016          	jp	LC007
1854  0039               L374:
1855                     ; 406 	hn_error_checksum = 0;
1857  0039 725f0000      	clr	_hn_error_checksum
1858                     ; 407 	hn_type = HN_TYPE_SEOUL;
1860  003d 35060000      	mov	_hn_type,#6
1861                     ; 408 	hn_connect = 0;
1863  0041 725f0000      	clr	_hn_connect
1864                     ; 409 	hn_buf_error[hn_buf_count++] = 0;
1866  0045 ad0f          	call	LC008
1867  0047 724f0000      	clr	(_hn_buf_error,x)
1868  004b c70000        	ld	_ext_hn_error,a
1869                     ; 413 	return 1;
1873  004e 81            	ret	
1874  004f               LC007:
1875  004f ad05          	call	LC008
1876  0051 d70000        	ld	(_hn_buf_error,x),a
1877                     ; 389 		return 0;
1879  0054 4f            	clr	a
1882  0055 81            	ret	
1883  0056               LC008:
1884  0056 c60000        	ld	a,_hn_buf_count
1885  0059 725c0000      	inc	_hn_buf_count
1886  005d 5f            	clrw	x
1887  005e 97            	ld	xl,a
1888                     ; 411 	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크
1890  005f a601          	ld	a,#1
1891  0061 81            	ret	
1916                     ; 416 void hn_seoul_ptc_check (void) {
1917                     .text:	section	.text,new
1918  0000               _hn_seoul_ptc_check:
1922                     ; 418 	if (hn_seoul_ptc_base_check() == 0) {
1924  0000 cd0000        	call	_hn_seoul_ptc_base_check
1926  0003 4d            	tnz	a
1927  0004 2601          	jrne	L705
1928                     ; 419 		return;
1931  0006 81            	ret	
1932  0007               L705:
1933                     ; 422 	hn_seoul_ptc_make();
1936                     ; 424 }
1939  0007 cc0000        	jp	_hn_seoul_ptc_make
1952                     	xdef	_hn_seoul_ptc_base_check
1953                     	xdef	_hn_seoul_check_checkSum
1954                     	xdef	_hn_seoul_ptc_make
1955                     	xdef	_hn_seoul_ptc_make_bath_temp_cntl
1956                     	xdef	_hn_seoul_ptc_make_bath_temp_state
1957                     	xdef	_hn_seoul_ptc_make_bath_cntl
1958                     	xdef	_hn_seoul_ptc_make_bath_state
1959                     	xdef	_hn_seoul_ptc_make_temp_cntl
1960                     	xdef	_hn_seoul_ptc_make_temp_state
1961                     	xdef	_hn_seoul_ptc_make_onoff_cntl
1962                     	xdef	_hn_seoul_ptc_make_onoff_state
1963                     	xdef	_hn_seoul_ptc_make_free
1964                     	xdef	_hn_seoul_ptc_make_init
1965                     	xdef	_hn_seoul_check_error
1966                     	xdef	_hn_seoul_check_boiler
1967                     	xdef	_hn_seoul_check_room_state
1968                     	xdef	_hn_seoul_make_checkSum
1969                     	xref	__is_shower
1970                     	xref	_msg_hn
1971                     	xref	_hnCnt
1972                     	xref	_rcInfo
1973                     	xref	_funcInfo
1974                     	xref	__ua
1975                     	xdef	_hn_seoul_ptc_check
1976                     	xref	_getHexToBin
1977                     	xref	_hn_buf_count
1978                     	xref	_hn_buf_error
1979                     	xref	_hn_error_checksum
1980                     	xref	_hn_type
1981                     	xref	_hn_connect
1982                     	xref	_ext_hn_error
2001                     	end
