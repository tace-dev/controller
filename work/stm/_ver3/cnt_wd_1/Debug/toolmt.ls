   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               __ts:
  25  0000 00            	dc.b	0
  26  0001               __ts2:
  27  0001 00            	dc.b	0
  28  0002               __tsSize:
  29  0002 08            	dc.b	8
  30  0003               __tsCurr:
  31  0003 00            	dc.b	0
  32  0004               __tsCurrClear:
  33  0004 00            	dc.b	0
  34  0005               __tsId:
  35  0005 00            	dc.b	0
  36  0006               __tsCapa:
  37  0006 00            	dc.b	0
  38  0007               __tsCntlHead:
  39  0007 00            	dc.b	0
  40  0008               __tsCntlTail:
  41  0008 00            	dc.b	0
  42  0009               _tsPos:
  43  0009 00            	dc.b	0
  44  000a               _tsid:
  45  000a 00            	dc.b	0
  92                     ; 31 void	toolSetPos(uint8_t pos, uint8_t id)
  92                     ; 32 {
  94                     .text:	section	.text,new
  95  0000               _toolSetPos:
  99                     ; 33 	tsPos = pos;
 101  0000 9e            	ld	a,xh
 102  0001 c70009        	ld	_tsPos,a
 103                     ; 34 	tsid = id;
 105  0004 9f            	ld	a,xl
 106  0005 c7000a        	ld	_tsid,a
 107                     ; 35 }
 110  0008 81            	ret	
 194                     ; 37 void	toolSetPush(uint8_t id, uint8_t capa, uint8_t cntl)
 194                     ; 38 {
 195                     .text:	section	.text,new
 196  0000               _toolSetPush:
 198  0000 89            	pushw	x
 199  0001 5207          	subw	sp,#7
 200       00000007      OFST:	set	7
 203                     ; 44 	i = id << 12;
 205  0003 9e            	ld	a,xh
 206  0004 4e            	swap	a
 207  0005 a4f0          	and	a,#240
 208  0007 5f            	clrw	x
 209  0008 95            	ld	xh,a
 210  0009 1f02          	ldw	(OFST-5,sp),x
 211                     ; 45 	i |= cntl << 8;
 213  000b 5f            	clrw	x
 214  000c 7b0c          	ld	a,(OFST+5,sp)
 215  000e 97            	ld	xl,a
 216  000f 7b03          	ld	a,(OFST-4,sp)
 217  0011 01            	rrwa	x,a
 218  0012 1a02          	or	a,(OFST-5,sp)
 219  0014 01            	rrwa	x,a
 220  0015 1f02          	ldw	(OFST-5,sp),x
 221                     ; 46 	i |= capa;
 223  0017 5f            	clrw	x
 224  0018 7b09          	ld	a,(OFST+2,sp)
 225  001a 97            	ld	xl,a
 226  001b 01            	rrwa	x,a
 227  001c 1a03          	or	a,(OFST-4,sp)
 228  001e 01            	rrwa	x,a
 229  001f 1a02          	or	a,(OFST-5,sp)
 230  0021 01            	rrwa	x,a
 231  0022 1f02          	ldw	(OFST-5,sp),x
 232                     ; 48 	switch( cntl )
 234  0024 7b0c          	ld	a,(OFST+5,sp)
 236                     ; 54 	default:
 236                     ; 55 		goto SET_ENTRY;
 237  0026 4a            	dec	a
 238  0027 2720          	jreq	L17
 239  0029 a00c          	sub	a,#12
 240  002b 271c          	jreq	L17
 241  002d 4a            	dec	a
 242  002e 2719          	jreq	L17
 243  0030               L33:
 244                     ; 71 SET_ENTRY:	
 244                     ; 72 	_tsCntl[_tsCntlHead++] = i;
 246  0030 c60007        	ld	a,__tsCntlHead
 247  0033 5f            	clrw	x
 248  0034 97            	ld	xl,a
 249  0035 58            	sllw	x
 250  0036 1602          	ldw	y,(OFST-5,sp)
 251  0038 df0000        	ldw	(__tsCntl,x),y
 252                     ; 73 	if( _tsCntlHead == TOOL_SIZE )
 254  003b 4c            	inc	a
 255  003c c70007        	ld	__tsCntlHead,a
 256  003f a130          	cp	a,#48
 257  0041 2641          	jrne	L701
 258                     ; 74 		_tsCntlHead = 0;
 260  0043 725f0007      	clr	__tsCntlHead
 261  0047 203b          	jra	L701
 262                     ; 50 	case	TS_CLOSE:
 262                     ; 51 	case	TS_CLOSE_2P:
 262                     ; 52 	case	TS_CLOSE_TAB:
 262                     ; 53 		break;
 264  0049               L17:
 265                     ; 58 	tail = _tsCntlTail;
 267  0049 c60008        	ld	a,__tsCntlTail
 268  004c 6b07          	ld	(OFST+0,sp),a
 269                     ; 59 	head = _tsCntlHead;
 271  004e c60007        	ld	a,__tsCntlHead
 272  0051 6b01          	ld	(OFST-6,sp),a
 274  0053 2027          	jra	L77
 275  0055               L37:
 276                     ; 62 		id16 = _tsCntl[tail];
 278  0055 5f            	clrw	x
 279  0056 97            	ld	xl,a
 280  0057 58            	sllw	x
 281  0058 de0000        	ldw	x,(__tsCntl,x)
 282  005b 1f05          	ldw	(OFST-2,sp),x
 283                     ; 63 		_i = (id16>>12) & 0xff;
 285  005d 01            	rrwa	x,a
 286  005e 9f            	ld	a,xl
 287  005f 4e            	swap	a
 288  0060 a40f          	and	a,#15
 289  0062 6b04          	ld	(OFST-3,sp),a
 290                     ; 64 		if( _i == id )
 292  0064 1108          	cp	a,(OFST+1,sp)
 293  0066 260a          	jrne	L301
 294                     ; 65 			_tsCntl[tail] = 0;
 296  0068 7b07          	ld	a,(OFST+0,sp)
 297  006a 5f            	clrw	x
 298  006b 97            	ld	xl,a
 299  006c 58            	sllw	x
 300  006d 905f          	clrw	y
 301  006f df0000        	ldw	(__tsCntl,x),y
 302  0072               L301:
 303                     ; 66 		tail++;
 305  0072 0c07          	inc	(OFST+0,sp)
 306                     ; 67 		if( tail == TOOL_SIZE )
 308  0074 7b07          	ld	a,(OFST+0,sp)
 309  0076 a130          	cp	a,#48
 310  0078 2602          	jrne	L77
 311                     ; 68 			tail = 0;
 313  007a 0f07          	clr	(OFST+0,sp)
 314  007c               L77:
 315                     ; 60 	while( tail != head )
 317  007c 7b07          	ld	a,(OFST+0,sp)
 318  007e 1101          	cp	a,(OFST-6,sp)
 319  0080 26d3          	jrne	L37
 320  0082 20ac          	jra	L33
 321  0084               L701:
 322                     ; 75 }
 325  0084 5b09          	addw	sp,#9
 326  0086 81            	ret	
 360                     ; 77 uint16_t	toolSetPop(void)
 360                     ; 78 {
 361                     .text:	section	.text,new
 362  0000               _toolSetPop:
 364  0000 89            	pushw	x
 365       00000002      OFST:	set	2
 368                     ; 80 	i = _tsCntl[_tsCntlTail++];
 370  0001 c60008        	ld	a,__tsCntlTail
 371  0004 5f            	clrw	x
 372  0005 97            	ld	xl,a
 373  0006 58            	sllw	x
 374                     ; 81 	if( _tsCntlTail == TOOL_SIZE )
 376  0007 4c            	inc	a
 377  0008 de0000        	ldw	x,(__tsCntl,x)
 378  000b c70008        	ld	__tsCntlTail,a
 379  000e a130          	cp	a,#48
 380  0010 2604          	jrne	L521
 381                     ; 82 		_tsCntlTail = 0;	
 383  0012 725f0008      	clr	__tsCntlTail
 384  0016               L521:
 385                     ; 83 	return i;
 389  0016 5b02          	addw	sp,#2
 390  0018 81            	ret	
 423                     ; 89 void	toolMtSetSize(uint8_t i) 	{ _tsSize = i; }
 424                     .text:	section	.text,new
 425  0000               _toolMtSetSize:
 431  0000 c70002        	ld	__tsSize,a
 435  0003 81            	ret	
 459                     ; 95 uint8_t	timeGetCurrent(void)
 459                     ; 96 {
 460                     .text:	section	.text,new
 461  0000               _timeGetCurrent:
 465                     ; 97 	return __timer1s;
 467  0000 c60000        	ld	a,___timer1s
 470  0003 81            	ret	
 509                     ; 100 uint8_t	timeGetDiff(uint8_t curr, uint8_t t)
 509                     ; 101 {
 510                     .text:	section	.text,new
 511  0000               _timeGetDiff:
 513  0000 89            	pushw	x
 514       00000000      OFST:	set	0
 517                     ; 102 	if( curr > t )
 519  0001 9f            	ld	a,xl
 520  0002 1101          	cp	a,(OFST+1,sp)
 521  0004 2406          	jruge	L171
 522                     ; 103 		return curr-t;
 524  0006 9f            	ld	a,xl
 525  0007 1001          	sub	a,(OFST+1,sp)
 526  0009 40            	neg	a
 528  000a 2006          	jra	L02
 529  000c               L171:
 530                     ; 104 	return curr+60 - t;
 532  000c 7b01          	ld	a,(OFST+1,sp)
 533  000e ab3c          	add	a,#60
 534  0010 1002          	sub	a,(OFST+2,sp)
 536  0012               L02:
 538  0012 85            	popw	x
 539  0013 81            	ret	
 542                     	switch	.data
 543  000b               __mt_timer0:
 544  000b 00            	dc.b	0
 565                     ; 118 void	toolMt2Operate(void)
 565                     ; 119 {
 566                     .text:	section	.text,new
 567  0000               _toolMt2Operate:
 571                     ; 222 }
 574  0000 81            	ret	
 597                     ; 226 uint8_t	toolMtTab(void)
 597                     ; 227 {
 598                     .text:	section	.text,new
 599  0000               _toolMtTab:
 603                     ; 322 }
 606  0000 81            	ret	
 643                     ; 332 void	toolErrorClear(void)
 643                     ; 333 {
 644                     .text:	section	.text,new
 645  0000               _toolErrorClear:
 647  0000 88            	push	a
 648       00000001      OFST:	set	1
 651                     ; 335 	for( i=0; i<TBL_V_SIZE; i++ )
 653  0001 4f            	clr	a
 654  0002 6b01          	ld	(OFST+0,sp),a
 655  0004               L722:
 656                     ; 337 		__mt_closeError[i] = 0;
 658  0004 5f            	clrw	x
 659  0005 97            	ld	xl,a
 660  0006 724f0000      	clr	(___mt_closeError,x)
 661                     ; 338 		vtbl.openCount[i] = 0;
 663  000a 5f            	clrw	x
 664  000b 97            	ld	xl,a
 665  000c 724f0060      	clr	(_vtbl+96,x)
 666                     ; 339 		vtbl.openCount2[i] = 0;
 668  0010 5f            	clrw	x
 669  0011 97            	ld	xl,a
 670  0012 724f0070      	clr	(_vtbl+112,x)
 671                     ; 335 	for( i=0; i<TBL_V_SIZE; i++ )
 673  0016 0c01          	inc	(OFST+0,sp)
 676  0018 7b01          	ld	a,(OFST+0,sp)
 677  001a a110          	cp	a,#16
 678  001c 25e6          	jrult	L722
 679                     ; 342 	for( i=0; i<PACKET_SIZE; i++ )
 681  001e 4f            	clr	a
 682  001f 6b01          	ld	(OFST+0,sp),a
 683  0021               L532:
 684                     ; 343 		packet_buf[i] = 0;
 686  0021 5f            	clrw	x
 687  0022 97            	ld	xl,a
 688  0023 724f0000      	clr	(_packet_buf,x)
 689                     ; 342 	for( i=0; i<PACKET_SIZE; i++ )
 691  0027 0c01          	inc	(OFST+0,sp)
 694  0029 7b01          	ld	a,(OFST+0,sp)
 695  002b a110          	cp	a,#16
 696  002d 25f2          	jrult	L532
 697                     ; 345 	vtbl._result2 = 0;
 699  002f 725f0098      	clr	_vtbl+152
 700                     ; 346 	_tsCntlTail = _tsCntlHead;
 702                     ; 347 }
 705  0033 84            	pop	a
 706  0034 5500070008    	mov	__tsCntlTail,__tsCntlHead
 707  0039 81            	ret	
 745                     ; 349 void	toolErrorCheck(void)
 745                     ; 350 {
 746                     .text:	section	.text,new
 747  0000               _toolErrorCheck:
 749  0000 88            	push	a
 750       00000001      OFST:	set	1
 753                     ; 352 	if( cntGetType() == 0 )	
 755  0001 cd0000        	call	_cntGetType
 757  0004 4d            	tnz	a
 758  0005 2703cc00dd    	jrne	L752
 759                     ; 354 		for( i=0; i<TBL_V_SIZE/2; i++ )
 761  000a 6b01          	ld	(OFST+0,sp),a
 762  000c               L162:
 763                     ; 357 			if( funcInfo.valve_rc[i] == 0 )
 765  000c 5f            	clrw	x
 766  000d 97            	ld	xl,a
 767  000e 724d0014      	tnz	(_funcInfo+20,x)
 768  0012 275d          	jreq	L362
 769                     ; 358 				continue;
 771                     ; 360 			if( __mt_closeError[i] == 100 )
 773  0014 cd0126        	call	LC004
 774  0017 a164          	cp	a,#100
 775  0019 260f          	jrne	L172
 776                     ; 362 				func_cnt_error(ERROR_TYPE_CNT, 10 + (i+1));
 778  001b 7b01          	ld	a,(OFST+0,sp)
 779  001d ab0b          	add	a,#11
 780  001f cd012c        	call	LC005
 782                     ; 363 				__mt_closeError[i] = 101;
 784  0022 7b01          	ld	a,(OFST+0,sp)
 785  0024 5f            	clrw	x
 786  0025 97            	ld	xl,a
 787  0026 a665          	ld	a,#101
 789  0028 2044          	jp	LC001
 790  002a               L172:
 791                     ; 365 			else if( __mt_closeError[i] == 200 )
 793  002a 7b01          	ld	a,(OFST+0,sp)
 794  002c cd0126        	call	LC004
 795  002f a1c8          	cp	a,#200
 796  0031 260f          	jrne	L572
 797                     ; 367 				func_cnt_error(ERROR_TYPE_CNT, 50 + (i+1));
 799  0033 7b01          	ld	a,(OFST+0,sp)
 800  0035 ab33          	add	a,#51
 801  0037 cd012c        	call	LC005
 803                     ; 368 				__mt_closeError[i] = 105;
 805  003a 7b01          	ld	a,(OFST+0,sp)
 806  003c 5f            	clrw	x
 807  003d 97            	ld	xl,a
 808  003e a669          	ld	a,#105
 810  0040 202c          	jp	LC001
 811  0042               L572:
 812                     ; 370 			else if( __mt_closeError[i] == 210 )
 814  0042 7b01          	ld	a,(OFST+0,sp)
 815  0044 cd0126        	call	LC004
 816  0047 a1d2          	cp	a,#210
 817  0049 260e          	jrne	L103
 818                     ; 373 				func_cnt_error(ERROR_TYPE_CNT, /*30 + (i+1)*/19);
 820  004b ae0213        	ldw	x,#531
 821  004e cd0000        	call	_func_cnt_error
 823                     ; 374 				__mt_closeError[i] = 106;
 825  0051 7b01          	ld	a,(OFST+0,sp)
 826  0053 5f            	clrw	x
 827  0054 97            	ld	xl,a
 828  0055 a66a          	ld	a,#106
 830  0057 2015          	jp	LC001
 831  0059               L103:
 832                     ; 376 			else if( __mt_closeError[i] == 220 )
 834  0059 7b01          	ld	a,(OFST+0,sp)
 835  005b cd0126        	call	LC004
 836  005e a1dc          	cp	a,#220
 837  0060 260f          	jrne	L362
 838                     ; 379 				func_cnt_error(ERROR_TYPE_CNT, 5);
 840  0062 ae0205        	ldw	x,#517
 841  0065 cd0000        	call	_func_cnt_error
 843                     ; 380 				__mt_closeError[i] = 108;
 845  0068 7b01          	ld	a,(OFST+0,sp)
 846  006a 5f            	clrw	x
 847  006b 97            	ld	xl,a
 848  006c a66c          	ld	a,#108
 849  006e               LC001:
 850  006e d70000        	ld	(___mt_closeError,x),a
 851  0071               L362:
 852                     ; 354 		for( i=0; i<TBL_V_SIZE/2; i++ )
 854  0071 0c01          	inc	(OFST+0,sp)
 857  0073 7b01          	ld	a,(OFST+0,sp)
 858  0075 a108          	cp	a,#8
 859  0077 2593          	jrult	L162
 860                     ; 383 		if( funcInfo.boiler_type == 1 /*vtbl.cntlMode != 0 && funcInfo.lpmType != 0*/ )
 862  0079 c60005        	ld	a,_funcInfo+5
 863  007c 4a            	dec	a
 864  007d 2703cc0124    	jrne	L723
 865                     ; 385 			if( __mt_closeError[funcInfo.valve] == 100 )
 867  0082 c6000d        	ld	a,_funcInfo+13
 868  0085 cd0126        	call	LC004
 869  0088 a164          	cp	a,#100
 870  008a 260f          	jrne	L113
 871                     ; 387 				func_cnt_error(ERROR_TYPE_CNT, 20 + funcInfo.valve);
 873  008c c6000d        	ld	a,_funcInfo+13
 874  008f ab14          	add	a,#20
 875  0091 cd012c        	call	LC005
 877                     ; 388 				__mt_closeError[funcInfo.valve] = 102;
 879  0094 cd0133        	call	LC006
 880  0097 a666          	ld	a,#102
 882  0099 203d          	jp	LC002
 883  009b               L113:
 884                     ; 390 			else if( __mt_closeError[funcInfo.valve] == 200 )
 886  009b c6000d        	ld	a,_funcInfo+13
 887  009e cd0126        	call	LC004
 888  00a1 a1c8          	cp	a,#200
 889  00a3 260b          	jrne	L513
 890                     ; 392 				func_cnt_error(ERROR_TYPE_CNT, 30 + funcInfo.valve);
 892  00a5 c6000d        	ld	a,_funcInfo+13
 893  00a8 ab1e          	add	a,#30
 894  00aa 97            	ld	xl,a
 895  00ab a602          	ld	a,#2
 896  00ad 95            	ld	xh,a
 898                     ; 393 				__mt_closeError[funcInfo.valve] = 106;
 900  00ae 200c          	jp	LC003
 901  00b0               L513:
 902                     ; 395 			else if( __mt_closeError[funcInfo.valve] == 210 )
 904  00b0 c6000d        	ld	a,_funcInfo+13
 905  00b3 ad71          	call	LC004
 906  00b5 a1d2          	cp	a,#210
 907  00b7 260c          	jrne	L123
 908                     ; 397 				func_cnt_error(ERROR_TYPE_CNT, /*30 + (i+1)*/19);
 910  00b9 ae0213        	ldw	x,#531
 912                     ; 398 				__mt_closeError[funcInfo.valve] = 106;
 914  00bc               LC003:
 915  00bc cd0000        	call	_func_cnt_error
 917  00bf ad72          	call	LC006
 918  00c1 a66a          	ld	a,#106
 920  00c3 2013          	jp	LC002
 921  00c5               L123:
 922                     ; 400 			else if( __mt_closeError[funcInfo.valve] == 220 )
 924  00c5 c6000d        	ld	a,_funcInfo+13
 925  00c8 ad5c          	call	LC004
 926  00ca a1dc          	cp	a,#220
 927  00cc 2656          	jrne	L723
 928                     ; 402 				func_cnt_error(ERROR_TYPE_CNT, 5);
 930  00ce ae0205        	ldw	x,#517
 931  00d1 cd0000        	call	_func_cnt_error
 933                     ; 403 				__mt_closeError[funcInfo.valve] = 108;
 935  00d4 ad5d          	call	LC006
 936  00d6 a66c          	ld	a,#108
 937  00d8               LC002:
 938  00d8 d70000        	ld	(___mt_closeError,x),a
 939  00db 2047          	jra	L723
 940  00dd               L752:
 941                     ; 409 		for( i=0; i<funcInfo2.valve; i++ )
 943  00dd 0f01          	clr	(OFST+0,sp)
 945  00df 2017          	jra	L533
 946  00e1               L133:
 947                     ; 411 			if( __mt_closeError[i] == 100 )
 949  00e1 ad43          	call	LC004
 950  00e3 a164          	cp	a,#100
 951  00e5 260f          	jrne	L143
 952                     ; 413 				func_cnt_error(ERROR_TYPE_CNT, 20 + (i+1));
 954  00e7 7b01          	ld	a,(OFST+0,sp)
 955  00e9 ab15          	add	a,#21
 956  00eb ad3f          	call	LC005
 958                     ; 414 				__mt_closeError[i] = 103;
 960  00ed 7b01          	ld	a,(OFST+0,sp)
 961  00ef 5f            	clrw	x
 962  00f0 97            	ld	xl,a
 963  00f1 a667          	ld	a,#103
 964  00f3 d70000        	ld	(___mt_closeError,x),a
 965  00f6               L143:
 966                     ; 409 		for( i=0; i<funcInfo2.valve; i++ )
 968  00f6 0c01          	inc	(OFST+0,sp)
 969  00f8               L533:
 972  00f8 7b01          	ld	a,(OFST+0,sp)
 973  00fa c1000d        	cp	a,_funcInfo2+13
 974  00fd 25e2          	jrult	L133
 975                     ; 417 		if( vtbl.cntlMode != 0 && funcInfo2.lpmType != 0 )
 977  00ff 725d009c      	tnz	_vtbl+156
 978  0103 271f          	jreq	L723
 980  0105 725d000c      	tnz	_funcInfo2+12
 981  0109 2719          	jreq	L723
 982                     ; 419 			if( __mt_closeError[i+1] == 100 )
 984  010b 5f            	clrw	x
 985  010c 97            	ld	xl,a
 986  010d d60001        	ld	a,(___mt_closeError+1,x)
 987  0110 a164          	cp	a,#100
 988  0112 2610          	jrne	L723
 989                     ; 421 				func_cnt_error(ERROR_TYPE_CNT, 20 + (funcInfo2.valve + 1));
 991  0114 c6000d        	ld	a,_funcInfo2+13
 992  0117 ab15          	add	a,#21
 993  0119 ad11          	call	LC005
 995                     ; 422 				__mt_closeError[i+1] = 104;
 997  011b 7b01          	ld	a,(OFST+0,sp)
 998  011d 5f            	clrw	x
 999  011e 97            	ld	xl,a
1000  011f a668          	ld	a,#104
1001  0121 d70001        	ld	(___mt_closeError+1,x),a
1002  0124               L723:
1003                     ; 426 }
1006  0124 84            	pop	a
1007  0125 81            	ret	
1008  0126               LC004:
1009  0126 5f            	clrw	x
1010  0127 97            	ld	xl,a
1011  0128 d60000        	ld	a,(___mt_closeError,x)
1012  012b 81            	ret	
1013  012c               LC005:
1014  012c 97            	ld	xl,a
1015  012d a602          	ld	a,#2
1016  012f 95            	ld	xh,a
1017  0130 cc0000        	jp	_func_cnt_error
1018  0133               LC006:
1019  0133 c6000d        	ld	a,_funcInfo+13
1020  0136 5f            	clrw	x
1021  0137 97            	ld	xl,a
1022  0138 81            	ret	
1025                     	switch	.data
1026  000c               _p3pushFlag:
1027  000c 00            	dc.b	0
1057                     ; 436 void	_plc_toolMtLoop(uint16_t i)
1057                     ; 437 {
1058                     .text:	section	.text,new
1059  0000               __plc_toolMtLoop:
1063                     ; 480 }
1066  0000 81            	ret	
1069                     	switch	.data
1070  000d               __plc_run:
1071  000d 00            	dc.b	0
1159                     ; 485 void	toolMtLoop(uint8_t cmd)
1159                     ; 486 {
1160                     .text:	section	.text,new
1161  0000               _toolMtLoop:
1163  0000 5206          	subw	sp,#6
1164       00000006      OFST:	set	6
1167                     ; 493 	toolErrorCheck();
1169  0002 cd0000        	call	_toolErrorCheck
1171                     ; 494 	if( __mt_enable == 1 )
1173  0005 c60000        	ld	a,___mt_enable
1174  0008 4a            	dec	a
1175  0009 2708          	jreq	L421
1176                     ; 495 		return;
1178                     ; 498 	if( _tsCntlTail == _tsCntlHead )
1180  000b c60008        	ld	a,__tsCntlTail
1181  000e c10007        	cp	a,__tsCntlHead
1182  0011 2603          	jrne	L714
1183                     ; 499 		return;
1184  0013               L421:
1187  0013 5b06          	addw	sp,#6
1188  0015 81            	ret	
1189  0016               L714:
1190                     ; 501 	if(	p3pushFlag == 1 )
1192  0016 c6000c        	ld	a,_p3pushFlag
1193  0019 4a            	dec	a
1194  001a 27f7          	jreq	L421
1195                     ; 504 		return;
1197                     ; 507 	i = toolSetPop();
1199  001c cd0000        	call	_toolSetPop
1201  001f 1f05          	ldw	(OFST-1,sp),x
1202                     ; 508 	if( i == 0 )
1204  0021 27f0          	jreq	L421
1205                     ; 509 		return;
1207                     ; 521 	capa = (uint8_t)(i&0xff);
1209  0023 7b06          	ld	a,(OFST+0,sp)
1210  0025 6b01          	ld	(OFST-5,sp),a
1211                     ; 522 	id = (uint8_t)((i>>12)&0xff);
1213  0027 01            	rrwa	x,a
1214  0028 9f            	ld	a,xl
1215  0029 4e            	swap	a
1216  002a a40f          	and	a,#15
1217  002c 6b04          	ld	(OFST-2,sp),a
1218                     ; 523 	cntl = (uint8_t)((i>>8)&0x0f);
1220  002e 7b05          	ld	a,(OFST-1,sp)
1221  0030 a40f          	and	a,#15
1222  0032 6b03          	ld	(OFST-3,sp),a
1223                     ; 524 	id += 1;
1225  0034 0c04          	inc	(OFST-2,sp)
1226                     ; 525 	__mt_closeflag = 0;
1228  0036 725f0000      	clr	___mt_closeflag
1229                     ; 527 		j = cntGetType() == 0 ? funcInfo.valve : funcInfo2.valve;
1231  003a cd0000        	call	_cntGetType
1233  003d 4d            	tnz	a
1234  003e 2605          	jrne	L07
1235  0040 c6000d        	ld	a,_funcInfo+13
1236  0043 2003          	jra	L47
1237  0045               L07:
1238  0045 c6000d        	ld	a,_funcInfo2+13
1239  0048               L47:
1240  0048 6b02          	ld	(OFST-4,sp),a
1241                     ; 528 		if( j == 0 )
1243  004a 270d          	jreq	L363
1244                     ; 538 			if( mt_plc_mode == 111 )
1246  004c c60000        	ld	a,_mt_plc_mode
1247  004f a16f          	cp	a,#111
1248  0051 260d          	jrne	L724
1249                     ; 542 				if( id > j )
1251  0053 7b04          	ld	a,(OFST-2,sp)
1252  0055 1102          	cp	a,(OFST-4,sp)
1253  0057 2307          	jrule	L724
1254                     ; 544 					goto PLC_ENTRY;
1255  0059               L363:
1256                     ; 530 PLC_ENTRY:
1256                     ; 531 			//	PLC Only
1256                     ; 532 //			__mt_enable = 1;
1256                     ; 533 			_plc_toolMtLoop(i);
1258  0059 1e05          	ldw	x,(OFST-1,sp)
1259  005b cd0000        	call	__plc_toolMtLoop
1261                     ; 534 			return;
1263  005e 20b3          	jra	L421
1264  0060               L724:
1265                     ; 554 	capaStep = MT_STEP(capa);
1267  0060 7b01          	ld	a,(OFST-5,sp)
1268  0062 97            	ld	xl,a
1269  0063 a60c          	ld	a,#12
1270  0065 42            	mul	x,a
1271  0066 1f05          	ldw	(OFST-1,sp),x
1272                     ; 556 	if( cntl == TS_CLOSE )
1274  0068 7b03          	ld	a,(OFST-3,sp)
1275  006a a101          	cp	a,#1
1276                     ; 558 		__mt_closeflag = 1;
1277                     ; 559 		__mt_closereset = 1;
1278                     ; 560 		mt_run(id, 0, MT_CLOSE_OFFSET);
1281  006c 2704          	jreq	LC012
1282                     ; 570 	else if( cntl == TS_CLOSE_2P )	
1284  006e a10d          	cp	a,#13
1285  0070 260d          	jrne	L344
1286                     ; 572 		__mt_closeflag = 1;
1288                     ; 573 		__mt_closereset = 1;
1290  0072               LC012:
1292  0072 35010000      	mov	___mt_closeflag,#1
1294  0076 35010000      	mov	___mt_closereset,#1
1295                     ; 574 		mt_run(id, 0, MT_CLOSE_OFFSET);
1297  007a               LC011:
1300  007a ae0a5a        	ldw	x,#2650
1303  007d 2028          	jp	LC010
1304  007f               L344:
1305                     ; 576 	else if( cntl == TS_CLOSE_TAB )	{	mt_run(id, 0, MT_CLOSE_OFFSET);}
1307  007f a10e          	cp	a,#14
1311  0081 27f7          	jreq	LC011
1312                     ; 577 	else if( cntl == TS_OPEN )		{	mt_run(id, 1, MT_OPEN_OFFSET);	}
1314  0083 a102          	cp	a,#2
1315  0085 2605          	jrne	L354
1318  0087 ae0960        	ldw	x,#2400
1321  008a 2045          	jp	LC008
1322  008c               L354:
1323                     ; 578 	else if( cntl == TS_CNTL )
1325  008c a103          	cp	a,#3
1326  008e 2783          	jreq	L421
1328                     ; 581 	else if( cntl == TS_CNTL_PLUS )
1330  0090 a104          	cp	a,#4
1331  0092 260f          	jrne	L364
1332                     ; 583 		__mt_overrun = 1;
1334  0094 35010000      	mov	___mt_overrun,#1
1335                     ; 584 		__mt_overrunCount = MT_OVERRUN_OFFSET;
1337  0098 353c0000      	mov	___mt_overrunCount,#60
1338                     ; 585 		i = MT_OVERRUN_OFFSET + capaStep;
1340  009c 1c003c        	addw	x,#60
1341  009f               LC009:
1342  009f 1f05          	ldw	(OFST-1,sp),x
1343                     ; 586 		mt_run(id, 1, i);
1346  00a1 202e          	jp	LC008
1347  00a3               L364:
1348                     ; 588 	else if( cntl == TS_CNTL_MINUS )
1350  00a3 a105          	cp	a,#5
1351  00a5 2604          	jrne	L764
1352                     ; 590 		mt_run(id, 0, capaStep);
1354  00a7               LC010:
1357  00a7 89            	pushw	x
1358  00a8 5f            	clrw	x
1361  00a9 202a          	jp	LC007
1362  00ab               L764:
1363                     ; 592 	else if( cntl == TS_CNTL_OPEN )
1365  00ab a106          	cp	a,#6
1366  00ad 2610          	jrne	L374
1367                     ; 594 		__mt_overrun = 1;
1369  00af 35010000      	mov	___mt_overrun,#1
1370                     ; 595 		__mt_overrunCount = MT_OVERRUN_OFFSET;
1372  00b3 353c0000      	mov	___mt_overrunCount,#60
1373                     ; 596 		i = MT_OVERRUN_BASE - capaStep;
1375  00b7 ae099c        	ldw	x,#2460
1376  00ba 72f005        	subw	x,(OFST-1,sp)
1377                     ; 597 		mt_run(id, 1, i);
1380  00bd 20e0          	jp	LC009
1381  00bf               L374:
1382                     ; 599 	else if( cntl == TS_CNTL_MOVE )
1384  00bf a108          	cp	a,#8
1385  00c1 260a          	jrne	L774
1386                     ; 601 		i = MT_OPEN_OFFSET - capaStep;
1388  00c3 ae0960        	ldw	x,#2400
1389  00c6 72f005        	subw	x,(OFST-1,sp)
1390  00c9 1f05          	ldw	(OFST-1,sp),x
1391                     ; 602 		mt_run(id, 0, i);
1394  00cb 20da          	jp	LC010
1395  00cd               L774:
1396                     ; 604 	else if( cntl == TS_CNTL_LARGE )
1398  00cd a10a          	cp	a,#10
1399  00cf 260e          	jrne	L305
1400                     ; 606 		mt_run(id, 1, capaStep);
1402  00d1               LC008:
1405  00d1 89            	pushw	x
1406  00d2 ae0001        	ldw	x,#1
1408  00d5               LC007:
1409  00d5 7b06          	ld	a,(OFST+0,sp)
1410  00d7 95            	ld	xh,a
1411  00d8 cd0000        	call	_mt_run
1412  00db 85            	popw	x
1414  00dc cc0013        	jra	L421
1415  00df               L305:
1416                     ; 608 	else if( cntl == TS_CNTL_SMALL )
1418  00df a10b          	cp	a,#11
1419  00e1 26f9          	jrne	L421
1420                     ; 610 		mt_run(id, 0, capaStep);
1422                     ; 612 }
1424  00e3 20c2          	jp	LC010
1557                     	xdef	__plc_run
1558                     	xref	_mt_plc_mode
1559                     	xdef	__plc_toolMtLoop
1560                     	xdef	_p3pushFlag
1561                     	xdef	_toolErrorCheck
1562                     	xref	_packet_buf
1563                     	xref	___mt_overrunCount
1564                     	xref	___mt_overrun
1565                     	xref	___mt_closereset
1566                     	xref	___mt_closeflag
1567                     	xdef	__mt_timer0
1568                     	xdef	_timeGetDiff
1569                     	xdef	_timeGetCurrent
1570                     	xdef	_toolSetPos
1571                     	xdef	_tsid
1572                     	xdef	_tsPos
1573                     	switch	.bss
1574  0000               __tsCntl:
1575  0000 000000000000  	ds.b	96
1576                     	xdef	__tsCntl
1577                     	xdef	__tsCntlTail
1578                     	xdef	__tsCntlHead
1579  0060               __tsMotor:
1580  0060 000000000000  	ds.b	8
1581                     	xdef	__tsMotor
1582                     	xdef	__tsCapa
1583                     	xdef	__tsId
1584                     	xdef	__tsCurrClear
1585                     	xdef	__tsCurr
1586                     	xdef	__tsSize
1587                     	xdef	__ts2
1588                     	xdef	__ts
1589                     	xref	_cntGetType
1590                     	xref	_func_cnt_error
1591                     	xref	_funcInfo2
1592                     	xref	_funcInfo
1593                     	xref	_vtbl
1594                     	xdef	_toolErrorClear
1595                     	xdef	_toolSetPop
1596                     	xdef	_toolSetPush
1597                     	xdef	_toolMtSetSize
1598                     	xref	_mt_run
1599                     	xdef	_toolMt2Operate
1600                     	xdef	_toolMtTab
1601                     	xdef	_toolMtLoop
1602                     	xref	___mt_closeError
1603                     	xref	___mt_enable
1604                     	xref	___timer1s
1624                     	end
