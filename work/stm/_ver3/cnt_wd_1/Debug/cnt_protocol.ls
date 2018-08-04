   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _ptc_sub_control:
  25  0000 00            	dc.b	0
  57                     ; 46 void cnt_ptc_baseSet(void) {
  59                     .text:	section	.text,new
  60  0000               _cnt_ptc_baseSet:
  64                     ; 47 	cnt_ptc_id_count = 1;
  66  0000 35010010      	mov	_cnt_ptc_id_count,#1
  67                     ; 48 	cnt_check_state = STATE_NORMAL;
  69  0004 3501000f      	mov	_cnt_check_state,#1
  70                     ; 50 	if (funcInfo.cnt == 0) {
  72  0008 c6008e        	ld	a,_funcInfo+11
  73  000b 2604          	jrne	L12
  74                     ; 51 		funcInfo.cnt = 8;
  76  000d 3508008e      	mov	_funcInfo+11,#8
  77  0011               L12:
  78                     ; 53 }
  81  0011 81            	ret	
 130                     ; 55 void makeChecksum(uint8_t *buf) {
 131                     .text:	section	.text,new
 132  0000               _makeChecksum:
 134  0000 89            	pushw	x
 135  0001 89            	pushw	x
 136       00000002      OFST:	set	2
 139                     ; 59 	s = 0;
 141  0002 0f01          	clr	(OFST-1,sp)
 142                     ; 60 	for (i = 0 ; i < 7 ; i++) {
 144  0004 0f02          	clr	(OFST+0,sp)
 145  0006               L54:
 146                     ; 61 		s += buf[i];
 148  0006 7b03          	ld	a,(OFST+1,sp)
 149  0008 97            	ld	xl,a
 150  0009 7b04          	ld	a,(OFST+2,sp)
 151  000b 1b02          	add	a,(OFST+0,sp)
 152  000d 2401          	jrnc	L01
 153  000f 5c            	incw	x
 154  0010               L01:
 155  0010 02            	rlwa	x,a
 156  0011 7b01          	ld	a,(OFST-1,sp)
 157  0013 fb            	add	a,(x)
 158  0014 6b01          	ld	(OFST-1,sp),a
 159                     ; 60 	for (i = 0 ; i < 7 ; i++) {
 161  0016 0c02          	inc	(OFST+0,sp)
 164  0018 7b02          	ld	a,(OFST+0,sp)
 165  001a a107          	cp	a,#7
 166  001c 25e8          	jrult	L54
 167                     ; 63 	buf[7] = s;
 169  001e 1e03          	ldw	x,(OFST+1,sp)
 170  0020 7b01          	ld	a,(OFST-1,sp)
 171  0022 e707          	ld	(7,x),a
 172                     ; 64 }
 175  0024 5b04          	addw	sp,#4
 176  0026 81            	ret	
 215                     ; 67 void cnt_ptc_make_setting(uint8_t *buf) {
 216                     .text:	section	.text,new
 217  0000               _cnt_ptc_make_setting:
 219  0000 89            	pushw	x
 220       00000000      OFST:	set	0
 223                     ; 68 	buf[0] = BYTE_START_CNT_SETTING | curr_setting_page;
 225  0001 c6000e        	ld	a,_curr_setting_page
 226  0004 1e01          	ldw	x,(OFST+1,sp)
 227  0006 aa30          	or	a,#48
 228  0008 f7            	ld	(x),a
 229                     ; 69 	buf[1] = 0x00;
 231  0009 6f01          	clr	(1,x)
 232                     ; 70 	buf[2] = funcInfo.boiler_water_shower;
 234  000b c60084        	ld	a,_funcInfo+1
 235  000e e702          	ld	(2,x),a
 236                     ; 71 	buf[3] = funcInfo.boiler_water_heat;
 238  0010 c60085        	ld	a,_funcInfo+2
 239  0013 e703          	ld	(3,x),a
 240                     ; 72 	buf[4] = (funcInfo.error << 2) | funcInfo.boiler_state;
 242  0015 c6008b        	ld	a,_funcInfo+8
 243  0018 48            	sll	a
 244  0019 48            	sll	a
 245  001a ca0083        	or	a,_funcInfo
 246  001d e704          	ld	(4,x),a
 247                     ; 73 	buf[5] = funcInfo.error;
 249  001f c6008b        	ld	a,_funcInfo+8
 250  0022 e705          	ld	(5,x),a
 251                     ; 74 	buf[6] = funcInfo.version << 1 | 
 251                     ; 75 					 funcInfo.subrcLock;
 253  0024 c60089        	ld	a,_funcInfo+6
 254  0027 48            	sll	a
 255  0028 ca008a        	or	a,_funcInfo+7
 256  002b e706          	ld	(6,x),a
 257                     ; 77 	makeChecksum(buf);
 259  002d cd0000        	call	_makeChecksum
 261                     ; 78 }
 264  0030 85            	popw	x
 265  0031 81            	ret	
 304                     ; 81 void cnt_ptc_make_mirror(uint8_t *buf) {
 305                     .text:	section	.text,new
 306  0000               _cnt_ptc_make_mirror:
 308  0000 89            	pushw	x
 309  0001 89            	pushw	x
 310       00000002      OFST:	set	2
 313                     ; 82 	buf[0] = BYTE_START_CNT_MIRROR | curr_mirror_page;
 315  0002 c6000d        	ld	a,_curr_mirror_page
 316  0005 1e03          	ldw	x,(OFST+1,sp)
 317  0007 aa20          	or	a,#32
 318  0009 f7            	ld	(x),a
 319                     ; 83 	switch (curr_mirror_page) {
 321  000a c6000d        	ld	a,_curr_mirror_page
 323                     ; 123 		break;
 324  000d 270c          	jreq	L17
 325  000f 4a            	dec	a
 326  0010 2768          	jreq	L37
 327  0012 4a            	dec	a
 328  0013 2603cc00a6    	jreq	L57
 329  0018 cc00d2        	jra	L711
 330  001b               L17:
 331                     ; 84 		case 0:
 331                     ; 85 			buf[1] = ((funcInfo.boiler_type& 0x01) << 7) | funcInfo.lpmType;
 333  001b c60088        	ld	a,_funcInfo+5
 334  001e a401          	and	a,#1
 335  0020 97            	ld	xl,a
 336  0021 a680          	ld	a,#128
 337  0023 42            	mul	x,a
 338  0024 9f            	ld	a,xl
 339  0025 1e03          	ldw	x,(OFST+1,sp)
 340  0027 ca008f        	or	a,_funcInfo+12
 341  002a e701          	ld	(1,x),a
 342                     ; 86 			buf[2] = ((funcInfo.relay & 0x01) << 7) | (funcInfo.cnt & 0x07) << 4 | funcInfo.valve;
 344  002c c6008e        	ld	a,_funcInfo+11
 345  002f a407          	and	a,#7
 346  0031 cd00d8        	call	LC002
 347  0034 6b02          	ld	(OFST+0,sp),a
 348  0036 c6008d        	ld	a,_funcInfo+10
 349  0039 a401          	and	a,#1
 350  003b 97            	ld	xl,a
 351  003c a680          	ld	a,#128
 352  003e 42            	mul	x,a
 353  003f 9f            	ld	a,xl
 354  0040 1a02          	or	a,(OFST+0,sp)
 355  0042 1e03          	ldw	x,(OFST+1,sp)
 356  0044 ca0090        	or	a,_funcInfo+13
 357  0047 e702          	ld	(2,x),a
 358                     ; 87 			buf[3] = funcInfo.boiler_water_shower;
 360  0049 c60084        	ld	a,_funcInfo+1
 361  004c e703          	ld	(3,x),a
 362                     ; 88 			buf[4] = funcInfo.houseCapa;
 364  004e c60091        	ld	a,_funcInfo+14
 365  0051 e704          	ld	(4,x),a
 366                     ; 89 			buf[5] = funcInfo.boiler_water_heat;
 368  0053 c60085        	ld	a,_funcInfo+2
 369  0056 e705          	ld	(5,x),a
 370                     ; 90 			buf[6] = 	0x00 << 7 
 370                     ; 91 								| (funcInfo.subrcLock << 6) 
 370                     ; 92 								| (funcInfo.poType << 4) 
 370                     ; 93 								| (funcInfo.cntlMode << 3) 
 370                     ; 94 								| funcInfo.opMode;
 372  0058 c60093        	ld	a,_funcInfo+16
 373  005b 48            	sll	a
 374  005c 48            	sll	a
 375  005d 48            	sll	a
 376  005e 6b02          	ld	(OFST+0,sp),a
 377  0060 c60092        	ld	a,_funcInfo+15
 378  0063 ad73          	call	LC002
 379  0065 6b01          	ld	(OFST-1,sp),a
 380  0067 c6008a        	ld	a,_funcInfo+7
 381  006a 97            	ld	xl,a
 382  006b a640          	ld	a,#64
 383  006d 42            	mul	x,a
 384  006e 9f            	ld	a,xl
 385  006f 1a01          	or	a,(OFST-1,sp)
 386  0071 1a02          	or	a,(OFST+0,sp)
 387  0073 ca0094        	or	a,_funcInfo+17
 388  0076 1e03          	ldw	x,(OFST+1,sp)
 389                     ; 95 		break;
 391  0078 2056          	jp	LC001
 392  007a               L37:
 393                     ; 96 		case 1:
 393                     ; 97 			buf[1] = 0x00 << 7 
 393                     ; 98 							 | (funcInfo.valve_rc[0] << 4) 
 393                     ; 99 							 | 0x00 << 3 
 393                     ; 100 							 | funcInfo.valve_rc[1];
 395  007a c60097        	ld	a,_funcInfo+20
 396  007d ad59          	call	LC002
 397  007f 1e03          	ldw	x,(OFST+1,sp)
 398  0081 ca0098        	or	a,_funcInfo+21
 399  0084 e701          	ld	(1,x),a
 400                     ; 101 			buf[2] = 0x00 << 7 
 400                     ; 102 							 | (funcInfo.valve_rc[2] << 4) 
 400                     ; 103 							 | 0x00 << 3 
 400                     ; 104 							 | funcInfo.valve_rc[3];
 402  0086 c60099        	ld	a,_funcInfo+22
 403  0089 ad4d          	call	LC002
 404  008b 1e03          	ldw	x,(OFST+1,sp)
 405  008d ca009a        	or	a,_funcInfo+23
 406  0090 e702          	ld	(2,x),a
 407                     ; 105 			buf[3] = funcInfo.valve_len[0];
 409  0092 c6009f        	ld	a,_funcInfo+28
 410  0095 e703          	ld	(3,x),a
 411                     ; 106 			buf[4] = funcInfo.valve_len[1];
 413  0097 c600a0        	ld	a,_funcInfo+29
 414  009a e704          	ld	(4,x),a
 415                     ; 107 			buf[5] = funcInfo.valve_len[2];
 417  009c c600a1        	ld	a,_funcInfo+30
 418  009f e705          	ld	(5,x),a
 419                     ; 108 			buf[6] = funcInfo.valve_len[3];
 421  00a1 c600a2        	ld	a,_funcInfo+31
 422                     ; 109 		break;
 424  00a4 202a          	jp	LC001
 425  00a6               L57:
 426                     ; 110 		case 2:
 426                     ; 111 			buf[1] = 0x00 << 7 
 426                     ; 112 							 | (funcInfo.valve_rc[4] << 4) 
 426                     ; 113 							 | 0x00 << 3 
 426                     ; 114 							 | funcInfo.valve_rc[5];
 428  00a6 c6009b        	ld	a,_funcInfo+24
 429  00a9 ad2d          	call	LC002
 430  00ab 1e03          	ldw	x,(OFST+1,sp)
 431  00ad ca009c        	or	a,_funcInfo+25
 432  00b0 e701          	ld	(1,x),a
 433                     ; 115 			buf[2] = 0x00 << 7 
 433                     ; 116 							 | (funcInfo.valve_rc[6] << 4) 
 433                     ; 117 							 | 0x00 << 3 
 433                     ; 118 							 | funcInfo.valve_rc[7];
 435  00b2 c6009d        	ld	a,_funcInfo+26
 436  00b5 ad21          	call	LC002
 437  00b7 1e03          	ldw	x,(OFST+1,sp)
 438  00b9 ca009e        	or	a,_funcInfo+27
 439  00bc e702          	ld	(2,x),a
 440                     ; 119 			buf[3] = funcInfo.valve_len[4];
 442  00be c600a3        	ld	a,_funcInfo+32
 443  00c1 e703          	ld	(3,x),a
 444                     ; 120 			buf[4] = funcInfo.valve_len[5];
 446  00c3 c600a4        	ld	a,_funcInfo+33
 447  00c6 e704          	ld	(4,x),a
 448                     ; 121 			buf[5] = funcInfo.valve_len[6];
 450  00c8 c600a5        	ld	a,_funcInfo+34
 451  00cb e705          	ld	(5,x),a
 452                     ; 122 			buf[6] = funcInfo.valve_len[7];
 454  00cd c600a6        	ld	a,_funcInfo+35
 455  00d0               LC001:
 456  00d0 e706          	ld	(6,x),a
 457                     ; 123 		break;
 459  00d2               L711:
 460                     ; 126 	makeChecksum(buf);
 462  00d2 cd0000        	call	_makeChecksum
 464                     ; 127 }
 467  00d5 5b04          	addw	sp,#4
 468  00d7 81            	ret	
 469  00d8               LC002:
 470  00d8 97            	ld	xl,a
 471  00d9 a610          	ld	a,#16
 472  00db 42            	mul	x,a
 473  00dc 9f            	ld	a,xl
 474  00dd 81            	ret	
 513                     ; 130 void cnt_ptc_make_mirror_sub(uint8_t *buf) {
 514                     .text:	section	.text,new
 515  0000               _cnt_ptc_make_mirror_sub:
 517  0000 89            	pushw	x
 518  0001 89            	pushw	x
 519       00000002      OFST:	set	2
 522                     ; 131 	buf[0] = BYTE_START_CNT_SETTING | curr_mirror_page;
 524  0002 c6000d        	ld	a,_curr_mirror_page
 525  0005 1e03          	ldw	x,(OFST+1,sp)
 526  0007 aa30          	or	a,#48
 527  0009 f7            	ld	(x),a
 528                     ; 132 	switch (curr_mirror_page) {
 530  000a c6000d        	ld	a,_curr_mirror_page
 532                     ; 172 		break;
 533  000d 270c          	jreq	L121
 534  000f 4a            	dec	a
 535  0010 2768          	jreq	L321
 536  0012 4a            	dec	a
 537  0013 2603cc00aa    	jreq	L521
 538  0018 cc00da        	jra	L741
 539  001b               L121:
 540                     ; 133 		case 0:
 540                     ; 134 			buf[1] = ((funcInfo2.boiler_type & 0x01) << 7) | funcInfo2.lpmType;
 542  001b c60063        	ld	a,_funcInfo2+5
 543  001e a401          	and	a,#1
 544  0020 97            	ld	xl,a
 545  0021 a680          	ld	a,#128
 546  0023 42            	mul	x,a
 547  0024 9f            	ld	a,xl
 548  0025 1e03          	ldw	x,(OFST+1,sp)
 549  0027 ca006a        	or	a,_funcInfo2+12
 550  002a e701          	ld	(1,x),a
 551                     ; 135 			buf[2] = ((funcInfo2.relay & 0x01) << 7) | funcInfo2.cnt << 4 | funcInfo2.valve;
 553  002c c60069        	ld	a,_funcInfo2+11
 554  002f cd00e0        	call	LC004
 555  0032 6b02          	ld	(OFST+0,sp),a
 556  0034 c60068        	ld	a,_funcInfo2+10
 557  0037 a401          	and	a,#1
 558  0039 97            	ld	xl,a
 559  003a a680          	ld	a,#128
 560  003c 42            	mul	x,a
 561  003d 9f            	ld	a,xl
 562  003e 1a02          	or	a,(OFST+0,sp)
 563  0040 1e03          	ldw	x,(OFST+1,sp)
 564  0042 ca006b        	or	a,_funcInfo2+13
 565  0045 e702          	ld	(2,x),a
 566                     ; 136 			buf[3] = funcInfo2.boiler_water_shower;
 568  0047 c6005f        	ld	a,_funcInfo2+1
 569  004a e703          	ld	(3,x),a
 570                     ; 137 			buf[4] = funcInfo2.houseCapa;
 572  004c c6006c        	ld	a,_funcInfo2+14
 573  004f e704          	ld	(4,x),a
 574                     ; 138 			buf[5] = funcInfo2.boiler_water_heat;
 576  0051 c60060        	ld	a,_funcInfo2+2
 577  0054 e705          	ld	(5,x),a
 578                     ; 139 			buf[6] = 	0x01 << 7 
 578                     ; 140 								| (funcInfo2.subrcLock << 6) 
 578                     ; 141 								| (funcInfo2.poType << 4) 
 578                     ; 142 								| (funcInfo2.cntlMode << 3) 
 578                     ; 143 								| funcInfo2.opMode;
 580  0056 c6006e        	ld	a,_funcInfo2+16
 581  0059 48            	sll	a
 582  005a 48            	sll	a
 583  005b 48            	sll	a
 584  005c 6b02          	ld	(OFST+0,sp),a
 585  005e c6006d        	ld	a,_funcInfo2+15
 586  0061 ad7d          	call	LC004
 587  0063 6b01          	ld	(OFST-1,sp),a
 588  0065 c60065        	ld	a,_funcInfo2+7
 589  0068 97            	ld	xl,a
 590  0069 a640          	ld	a,#64
 591  006b 42            	mul	x,a
 592  006c 9f            	ld	a,xl
 593  006d aa80          	or	a,#128
 594  006f 1a01          	or	a,(OFST-1,sp)
 595  0071 1a02          	or	a,(OFST+0,sp)
 596  0073 ca006f        	or	a,_funcInfo2+17
 597  0076 1e03          	ldw	x,(OFST+1,sp)
 598                     ; 144 		break;
 600  0078 205e          	jp	LC003
 601  007a               L321:
 602                     ; 145 		case 1:
 602                     ; 146 			buf[1] = 0x01 << 7 
 602                     ; 147 							 | (funcInfo2.valve_rc[0] << 4) 
 602                     ; 148 							 | 0x01 << 3 
 602                     ; 149 							 | funcInfo2.valve_rc[1];
 604  007a c60072        	ld	a,_funcInfo2+20
 605  007d ad61          	call	LC004
 606  007f aa88          	or	a,#136
 607  0081 1e03          	ldw	x,(OFST+1,sp)
 608  0083 ca0073        	or	a,_funcInfo2+21
 609  0086 e701          	ld	(1,x),a
 610                     ; 150 			buf[2] = 0x01 << 7 
 610                     ; 151 							 | (funcInfo2.valve_rc[2] << 4) 
 610                     ; 152 							 | 0x01 << 3 
 610                     ; 153 							 | funcInfo2.valve_rc[3];
 612  0088 c60074        	ld	a,_funcInfo2+22
 613  008b ad53          	call	LC004
 614  008d aa88          	or	a,#136
 615  008f 1e03          	ldw	x,(OFST+1,sp)
 616  0091 ca0075        	or	a,_funcInfo2+23
 617  0094 e702          	ld	(2,x),a
 618                     ; 154 			buf[3] = funcInfo2.valve_len[0];
 620  0096 c6007a        	ld	a,_funcInfo2+28
 621  0099 e703          	ld	(3,x),a
 622                     ; 155 			buf[4] = funcInfo2.valve_len[1];
 624  009b c6007b        	ld	a,_funcInfo2+29
 625  009e e704          	ld	(4,x),a
 626                     ; 156 			buf[5] = funcInfo2.valve_len[2];
 628  00a0 c6007c        	ld	a,_funcInfo2+30
 629  00a3 e705          	ld	(5,x),a
 630                     ; 157 			buf[6] = funcInfo2.valve_len[3];
 632  00a5 c6007d        	ld	a,_funcInfo2+31
 633                     ; 158 		break;
 635  00a8 202e          	jp	LC003
 636  00aa               L521:
 637                     ; 159 		case 2:
 637                     ; 160 			buf[1] = 0x01 << 7 
 637                     ; 161 							 | (funcInfo2.valve_rc[4] << 4) 
 637                     ; 162 							 | 0x01 << 3 
 637                     ; 163 							 | funcInfo2.valve_rc[5];
 639  00aa c60076        	ld	a,_funcInfo2+24
 640  00ad ad31          	call	LC004
 641  00af aa88          	or	a,#136
 642  00b1 1e03          	ldw	x,(OFST+1,sp)
 643  00b3 ca0077        	or	a,_funcInfo2+25
 644  00b6 e701          	ld	(1,x),a
 645                     ; 164 			buf[2] = 0x01 << 7 
 645                     ; 165 							 | (funcInfo2.valve_rc[6] << 4) 
 645                     ; 166 							 | 0x01 << 3 
 645                     ; 167 							 | funcInfo2.valve_rc[7];
 647  00b8 c60078        	ld	a,_funcInfo2+26
 648  00bb ad23          	call	LC004
 649  00bd aa88          	or	a,#136
 650  00bf 1e03          	ldw	x,(OFST+1,sp)
 651  00c1 ca0079        	or	a,_funcInfo2+27
 652  00c4 e702          	ld	(2,x),a
 653                     ; 168 			buf[3] = funcInfo2.valve_len[4];
 655  00c6 c6007e        	ld	a,_funcInfo2+32
 656  00c9 e703          	ld	(3,x),a
 657                     ; 169 			buf[4] = funcInfo2.valve_len[5];
 659  00cb c6007f        	ld	a,_funcInfo2+33
 660  00ce e704          	ld	(4,x),a
 661                     ; 170 			buf[5] = funcInfo2.valve_len[6];
 663  00d0 c60080        	ld	a,_funcInfo2+34
 664  00d3 e705          	ld	(5,x),a
 665                     ; 171 			buf[6] = funcInfo2.valve_len[7];
 667  00d5 c60081        	ld	a,_funcInfo2+35
 668  00d8               LC003:
 669  00d8 e706          	ld	(6,x),a
 670                     ; 172 		break;
 672  00da               L741:
 673                     ; 175 	makeChecksum(buf);
 675  00da cd0000        	call	_makeChecksum
 677                     ; 176 }
 680  00dd 5b04          	addw	sp,#4
 681  00df 81            	ret	
 682  00e0               LC004:
 683  00e0 97            	ld	xl,a
 684  00e1 a610          	ld	a,#16
 685  00e3 42            	mul	x,a
 686  00e4 9f            	ld	a,xl
 687  00e5 81            	ret	
 736                     ; 178 uint8_t cnt_getErrorCount(uint8_t *buf) {
 737                     .text:	section	.text,new
 738  0000               _cnt_getErrorCount:
 740  0000 89            	pushw	x
 741  0001 89            	pushw	x
 742       00000002      OFST:	set	2
 745                     ; 179 	uint8_t count = 0x00;
 747  0002 0f01          	clr	(OFST-1,sp)
 748                     ; 182 	for (i = 0 ; i < 15 ; i++) {
 750  0004 0f02          	clr	(OFST+0,sp)
 751  0006               L371:
 752                     ; 183 		if (buf[i] == 0) {
 754  0006 7b03          	ld	a,(OFST+1,sp)
 755  0008 97            	ld	xl,a
 756  0009 7b04          	ld	a,(OFST+2,sp)
 757  000b 1b02          	add	a,(OFST+0,sp)
 758  000d 2401          	jrnc	L03
 759  000f 5c            	incw	x
 760  0010               L03:
 761  0010 02            	rlwa	x,a
 762  0011 f6            	ld	a,(x)
 763  0012 2602          	jrne	L102
 764                     ; 184 			count++;
 766  0014 0c01          	inc	(OFST-1,sp)
 767  0016               L102:
 768                     ; 182 	for (i = 0 ; i < 15 ; i++) {
 770  0016 0c02          	inc	(OFST+0,sp)
 773  0018 7b02          	ld	a,(OFST+0,sp)
 774  001a a10f          	cp	a,#15
 775  001c 25e8          	jrult	L371
 776                     ; 188 	return count;
 778  001e 7b01          	ld	a,(OFST-1,sp)
 781  0020 5b04          	addw	sp,#4
 782  0022 81            	ret	
 846                     ; 191 void cnt_ptc_make_normal(uint8_t *buf) {
 847                     .text:	section	.text,new
 848  0000               _cnt_ptc_make_normal:
 850  0000 89            	pushw	x
 851  0001 89            	pushw	x
 852       00000002      OFST:	set	2
 855                     ; 195 	rc_total_count = 0;
 857                     ; 197 	buf[0] = BYTE_START_CNT_NORMAL | cnt_ptc_id_count;
 859  0002 c60010        	ld	a,_cnt_ptc_id_count
 860  0005 1e03          	ldw	x,(OFST+1,sp)
 861  0007 aa70          	or	a,#112
 862  0009 f7            	ld	(x),a
 863                     ; 199 	if (cnt_ptc_id_count != 0x09) {
 865  000a c60010        	ld	a,_cnt_ptc_id_count
 866  000d a109          	cp	a,#9
 867  000f 276b          	jreq	L522
 868                     ; 200 		buf[1] = funcInfo.rcLED | funcInfo.sub_rcLED;
 870  0011 c60095        	ld	a,_funcInfo+18
 871  0014 ca0096        	or	a,_funcInfo+19
 872  0017 e701          	ld	(1,x),a
 873                     ; 201 		buf[2] = funcInfo.boiler_water_shower;
 875  0019 c60084        	ld	a,_funcInfo+1
 876  001c e702          	ld	(2,x),a
 877                     ; 202 		buf[3] = funcInfo.boiler_water_heat;
 879  001e c60085        	ld	a,_funcInfo+2
 880  0021 e703          	ld	(3,x),a
 881                     ; 203 		buf[4] = 0x00;
 883  0023 6f04          	clr	(4,x)
 884                     ; 205 		if (msg_hn == 1) {
 886  0025 c6000a        	ld	a,_msg_hn
 887  0028 4a            	dec	a
 888  0029 2616          	jrne	L722
 889                     ; 206 			buf[1] = 0x10 | hnCnt.id;
 891  002b c60039        	ld	a,_hnCnt
 892  002e aa10          	or	a,#16
 893  0030 e701          	ld	(1,x),a
 894                     ; 207 			buf[2] = hnCnt.mode;
 896  0032 c6003a        	ld	a,_hnCnt+1
 897  0035 e702          	ld	(2,x),a
 898                     ; 208 			buf[3] = hnCnt.setup_temp;
 900  0037 c6003b        	ld	a,_hnCnt+2
 901  003a e703          	ld	(3,x),a
 902                     ; 209 			buf[4] = hnCnt.comm << 7;
 904  003c c6003c        	ld	a,_hnCnt+3
 906  003f 2005          	jra	L132
 907  0041               L722:
 908                     ; 211 			buf[4] = (funcInfo.cntlMode & 0x01) << 7;
 910  0041 c60093        	ld	a,_funcInfo+16
 911  0044 a401          	and	a,#1
 912  0046               L132:
 913  0046 97            	ld	xl,a
 914  0047 a680          	ld	a,#128
 915  0049 42            	mul	x,a
 916  004a 9f            	ld	a,xl
 917  004b 1e03          	ldw	x,(OFST+1,sp)
 918  004d e704          	ld	(4,x),a
 919                     ; 214 		buf[4] |= ((funcInfo.error_type & 0x03) << 2) | funcInfo.boiler_state;
 921  004f c6008c        	ld	a,_funcInfo+9
 922  0052 a403          	and	a,#3
 923  0054 48            	sll	a
 924  0055 48            	sll	a
 925  0056 ca0083        	or	a,_funcInfo
 926  0059 ea04          	or	a,(4,x)
 927  005b e704          	ld	(4,x),a
 928                     ; 215 		buf[5] = funcInfo.error;
 930  005d c6008b        	ld	a,_funcInfo+8
 931  0060 e705          	ld	(5,x),a
 932                     ; 216 		buf[6] = msg_hn << 7 | 
 932                     ; 217 						 funcInfo.version << 1 | 
 932                     ; 218 						 funcInfo.subrcLock;
 934  0062 c60089        	ld	a,_funcInfo+6
 935  0065 48            	sll	a
 936  0066 6b01          	ld	(OFST-1,sp),a
 937  0068 c6000a        	ld	a,_msg_hn
 938  006b 97            	ld	xl,a
 939  006c a680          	ld	a,#128
 940  006e 42            	mul	x,a
 941  006f 9f            	ld	a,xl
 942  0070 1a01          	or	a,(OFST-1,sp)
 943  0072 1e03          	ldw	x,(OFST+1,sp)
 944  0074 ca008a        	or	a,_funcInfo+7
 945  0077 e706          	ld	(6,x),a
 947  0079 cc0170        	jra	L332
 948  007c               L522:
 949                     ; 221 		if (br_type == BR_TYPE_NONE) {
 951  007c c60000        	ld	a,_br_type
 952  007f 260e          	jrne	L532
 953                     ; 222 			if (br_error_checksum == 1) {
 955  0081 c60000        	ld	a,_br_error_checksum
 956  0084 4a            	dec	a
 957  0085 2604          	jrne	L732
 958                     ; 223 				buf[1] = 0x0E;
 960  0087 a60e          	ld	a,#14
 962  0089 2032          	jp	LC005
 963  008b               L732:
 964                     ; 225 				buf[1] = 0x0F;
 966  008b a60f          	ld	a,#15
 967  008d 202e          	jp	LC005
 968  008f               L532:
 969                     ; 227 		} else if (br_type == BR_TYPE_KR) {
 971  008f a101          	cp	a,#1
 972  0091 260a          	jrne	L542
 973                     ; 228 			buf[1] = 0x10 | cnt_getErrorCount(br_buf_error);
 975  0093 ae0000        	ldw	x,#_br_buf_error
 976  0096 cd0000        	call	_cnt_getErrorCount
 978  0099 aa10          	or	a,#16
 980  009b 201e          	jp	LC006
 981  009d               L542:
 982                     ; 229 		} else if (br_type == BR_TYPE_KD){
 984  009d a102          	cp	a,#2
 985  009f 260a          	jrne	L152
 986                     ; 230 			buf[1] = 0x20 | cnt_getErrorCount(br_buf_error);
 988  00a1 ae0000        	ldw	x,#_br_buf_error
 989  00a4 cd0000        	call	_cnt_getErrorCount
 991  00a7 aa20          	or	a,#32
 993  00a9 2010          	jp	LC006
 994  00ab               L152:
 995                     ; 231 		} else if (br_type == BR_TYPE_RN) {
 997  00ab a103          	cp	a,#3
 998                     ; 232 			buf[1] = 0x30 | cnt_getErrorCount(br_buf_error);
1001  00ad 2704          	jreq	LC007
1002                     ; 233 		} else if (br_type == BR_TYPE_DW) {
1004  00af a104          	cp	a,#4
1005  00b1 260c          	jrne	L342
1006                     ; 234 			buf[1] = 0x30 | cnt_getErrorCount(br_buf_error);
1009  00b3               LC007:
1011  00b3 ae0000        	ldw	x,#_br_buf_error
1012  00b6 cd0000        	call	_cnt_getErrorCount
1013  00b9 aa30          	or	a,#48
1014  00bb               LC006:
1015  00bb 1e03          	ldw	x,(OFST+1,sp)
1016  00bd               LC005:
1017  00bd e701          	ld	(1,x),a
1018  00bf               L342:
1019                     ; 237 		if (hn_type == HN_TYPE_NONE) {
1021  00bf c60000        	ld	a,_hn_type
1022  00c2 2612          	jrne	L362
1023                     ; 238 			if (hn_error_checksum == 1) {
1025  00c4 c60000        	ld	a,_hn_error_checksum
1026  00c7 4a            	dec	a
1027  00c8 2606          	jrne	L562
1028                     ; 239 				buf[2] = 0x0E;
1030  00ca 1e03          	ldw	x,(OFST+1,sp)
1031  00cc a60e          	ld	a,#14
1033  00ce 205a          	jp	LC008
1034  00d0               L562:
1035                     ; 241 				buf[2] = 0x0F;
1037  00d0 1e03          	ldw	x,(OFST+1,sp)
1038  00d2 a60f          	ld	a,#15
1039  00d4 2054          	jp	LC008
1040  00d6               L362:
1041                     ; 243 		} else if (hn_type == HN_TYPE_COMMAX){
1043  00d6 a101          	cp	a,#1
1044  00d8 260a          	jrne	L372
1045                     ; 244 			buf[2] = 0x10 | cnt_getErrorCount(hn_buf_error);
1047  00da ae0000        	ldw	x,#_hn_buf_error
1048  00dd cd0000        	call	_cnt_getErrorCount
1050  00e0 aa10          	or	a,#16
1052  00e2 2044          	jp	LC009
1053  00e4               L372:
1054                     ; 245 		} else if (hn_type == HN_TYPE_CLIO) {
1056  00e4 a102          	cp	a,#2
1057  00e6 260a          	jrne	L772
1058                     ; 246 			buf[2] = 0x20 | cnt_getErrorCount(hn_buf_error);
1060  00e8 ae0000        	ldw	x,#_hn_buf_error
1061  00eb cd0000        	call	_cnt_getErrorCount
1063  00ee aa20          	or	a,#32
1065  00f0 2036          	jp	LC009
1066  00f2               L772:
1067                     ; 247 		} else if (hn_type == HN_TYPE_CLIO_KD) {
1069  00f2 a103          	cp	a,#3
1070  00f4 260a          	jrne	L303
1071                     ; 248 			buf[2] = 0x30 | cnt_getErrorCount(hn_buf_error);
1073  00f6 ae0000        	ldw	x,#_hn_buf_error
1074  00f9 cd0000        	call	_cnt_getErrorCount
1076  00fc aa30          	or	a,#48
1078  00fe 2028          	jp	LC009
1079  0100               L303:
1080                     ; 249 		} else if (hn_type == HN_TYPE_KOCOM) {
1082  0100 a104          	cp	a,#4
1083  0102 260a          	jrne	L703
1084                     ; 250 			buf[2] = 0x40 | cnt_getErrorCount(hn_buf_error);
1086  0104 ae0000        	ldw	x,#_hn_buf_error
1087  0107 cd0000        	call	_cnt_getErrorCount
1089  010a aa40          	or	a,#64
1091  010c 201a          	jp	LC009
1092  010e               L703:
1093                     ; 251 		} else if (hn_type == HN_TYPE_HYUNDAI) {
1095  010e a105          	cp	a,#5
1096  0110 260a          	jrne	L313
1097                     ; 252 			buf[2] = 0x50 | cnt_getErrorCount(hn_buf_error);
1099  0112 ae0000        	ldw	x,#_hn_buf_error
1100  0115 cd0000        	call	_cnt_getErrorCount
1102  0118 aa50          	or	a,#80
1104  011a 200c          	jp	LC009
1105  011c               L313:
1106                     ; 253 		} else if (hn_type == HN_TYPE_SEOUL) {
1108  011c a106          	cp	a,#6
1109  011e 260c          	jrne	L172
1110                     ; 254 			buf[2] = 0x60 | cnt_getErrorCount(hn_buf_error);
1112  0120 ae0000        	ldw	x,#_hn_buf_error
1113  0123 cd0000        	call	_cnt_getErrorCount
1115  0126 aa60          	or	a,#96
1116  0128               LC009:
1117  0128 1e03          	ldw	x,(OFST+1,sp)
1118  012a               LC008:
1119  012a e702          	ld	(2,x),a
1120  012c               L172:
1121                     ; 257 		buf[3] = 0x00;
1123  012c 1e03          	ldw	x,(OFST+1,sp)
1124                     ; 258 		buf[4] = 0x00;
1126  012e 6f04          	clr	(4,x)
1127  0130 6f03          	clr	(3,x)
1128                     ; 259 		buf[5] = 0x00;
1130  0132 6f05          	clr	(5,x)
1131                     ; 260 		buf[6] = 0x00;
1133  0134 6f06          	clr	(6,x)
1134                     ; 262 		if (hn_type == HN_TYPE_CLIO || hn_type == HN_TYPE_CLIO_KD) {
1136  0136 c60000        	ld	a,_hn_type
1137  0139 a102          	cp	a,#2
1138  013b 2704          	jreq	L323
1140  013d a103          	cp	a,#3
1141  013f 262f          	jrne	L332
1142  0141               L323:
1143                     ; 263 			buf[5] = 0x01;
1145  0141 a601          	ld	a,#1
1146  0143 e705          	ld	(5,x),a
1147                     ; 265 			for (i = 0 ; i < 8 ; i++) {
1149  0145 4f            	clr	a
1150  0146 6b02          	ld	(OFST+0,sp),a
1151  0148               L523:
1152                     ; 266 				if (rcInfo.mode[i] != MODE_STOP) {
1154  0148 5f            	clrw	x
1155  0149 97            	ld	xl,a
1156  014a d6004e        	ld	a,(_rcInfo+16,x)
1157  014d a104          	cp	a,#4
1158  014f 2717          	jreq	L333
1159                     ; 267 					buf[6] |= (0x01 << i);
1161  0151 1e03          	ldw	x,(OFST+1,sp)
1162  0153 7b02          	ld	a,(OFST+0,sp)
1163  0155 905f          	clrw	y
1164  0157 9097          	ld	yl,a
1165  0159 a601          	ld	a,#1
1166  015b 905d          	tnzw	y
1167  015d 2705          	jreq	L06
1168  015f               L26:
1169  015f 48            	sll	a
1170  0160 905a          	decw	y
1171  0162 26fb          	jrne	L26
1172  0164               L06:
1173  0164 ea06          	or	a,(6,x)
1174  0166 e706          	ld	(6,x),a
1175  0168               L333:
1176                     ; 265 			for (i = 0 ; i < 8 ; i++) {
1178  0168 0c02          	inc	(OFST+0,sp)
1181  016a 7b02          	ld	a,(OFST+0,sp)
1182  016c a108          	cp	a,#8
1183  016e 25d8          	jrult	L523
1184  0170               L332:
1185                     ; 273 	makeChecksum(buf);
1187  0170 1e03          	ldw	x,(OFST+1,sp)
1188  0172 cd0000        	call	_makeChecksum
1190                     ; 275 	cnt_ptc_id_count++;
1192  0175 725c0010      	inc	_cnt_ptc_id_count
1193                     ; 277 	rc_total_count = funcInfo.cnt + funcInfo2.cnt;
1195  0179 c6008e        	ld	a,_funcInfo+11
1196  017c cb0069        	add	a,_funcInfo2+11
1197  017f 6b02          	ld	(OFST+0,sp),a
1198                     ; 279 	if (cnt_ptc_id_count == rc_total_count + 1) {
1200  0181 5f            	clrw	x
1201  0182 c60010        	ld	a,_cnt_ptc_id_count
1202  0185 97            	ld	xl,a
1203  0186 7b02          	ld	a,(OFST+0,sp)
1204  0188 905f          	clrw	y
1205  018a 9097          	ld	yl,a
1206  018c bf00          	ldw	c_x,x
1207  018e 905c          	incw	y
1208  0190 90b300        	cpw	y,c_x
1209  0193 2604          	jrne	L533
1210                     ; 280 		cnt_ptc_id_count = 0x09;
1212  0195 35090010      	mov	_cnt_ptc_id_count,#9
1213  0199               L533:
1214                     ; 283 	if (cnt_ptc_id_count == 0x0A) {
1216  0199 c60010        	ld	a,_cnt_ptc_id_count
1217  019c a10a          	cp	a,#10
1218  019e 2604          	jrne	L733
1219                     ; 284 		cnt_ptc_id_count = 1;
1221  01a0 35010010      	mov	_cnt_ptc_id_count,#1
1222  01a4               L733:
1223                     ; 286 }
1226  01a4 5b04          	addw	sp,#4
1227  01a6 81            	ret	
1268                     ; 288 void cnt_ptc_make(uint8_t *buf) {	
1269                     .text:	section	.text,new
1270  0000               _cnt_ptc_make:
1272  0000 89            	pushw	x
1273       00000000      OFST:	set	0
1276                     ; 289 	switch (cnt_check_state) {
1278  0001 c6000f        	ld	a,_cnt_check_state
1280                     ; 313 		default:
1280                     ; 314 			break;
1281  0004 4a            	dec	a
1282  0005 2733          	jreq	L773
1283  0007 4a            	dec	a
1284  0008 2737          	jreq	L543
1285  000a 4a            	dec	a
1286  000b 272d          	jreq	L773
1287  000d 4a            	dec	a
1288  000e 2711          	jreq	L343
1289  0010 4a            	dec	a
1290  0011 2727          	jreq	L773
1291  0013 4a            	dec	a
1292  0014 2724          	jreq	L773
1293  0016 4a            	dec	a
1294  0017 2721          	jreq	L773
1295  0019 4a            	dec	a
1296  001a 271e          	jreq	L773
1297  001c 4a            	dec	a
1298  001d 2627          	jrne	L173
1299                     ; 290 		case STATE_SUBRC:
1299                     ; 291 		case STATE_COMMAND_HOTWATER:
1299                     ; 292 		case STATE_COMMAND_RESET:
1299                     ; 293 		case STATE_COMMAND_FACTORY:
1299                     ; 294 		case STATE_ERROR_RECOVER:
1299                     ; 295 		case STATE_ERROR:
1299                     ; 296 		case STATE_NORMAL:
1299                     ; 297 			cnt_ptc_make_normal(buf);
1301                     ; 298 			break;
1303  001f 2019          	jp	L773
1304  0021               L343:
1305                     ; 299 		case STATE_COMMAND_MIRROR:
1305                     ; 300 		
1305                     ; 301 			if (mirror_type == 0x01){
1307  0021 c6000b        	ld	a,_mirror_type
1308  0024 a101          	cp	a,#1
1309  0026 2607          	jrne	L373
1310                     ; 302 				cnt_ptc_make_mirror(buf);
1312  0028 1e01          	ldw	x,(OFST+1,sp)
1313  002a cd0000        	call	_cnt_ptc_make_mirror
1316  002d 2017          	jra	L173
1317  002f               L373:
1318                     ; 303 			} else if (mirror_type == 0x02){
1320  002f a102          	cp	a,#2
1321  0031 2607          	jrne	L773
1322                     ; 304 				cnt_ptc_make_mirror_sub(buf);
1324  0033 1e01          	ldw	x,(OFST+1,sp)
1325  0035 cd0000        	call	_cnt_ptc_make_mirror_sub
1328  0038 200c          	jra	L173
1329  003a               L773:
1330                     ; 306 				cnt_ptc_make_normal(buf);
1333  003a 1e01          	ldw	x,(OFST+1,sp)
1334  003c cd0000        	call	_cnt_ptc_make_normal
1336  003f 2005          	jra	L173
1337  0041               L543:
1338                     ; 310 		case STATE_SETTING:
1338                     ; 311 			cnt_ptc_make_setting(buf);
1340  0041 1e01          	ldw	x,(OFST+1,sp)
1341  0043 cd0000        	call	_cnt_ptc_make_setting
1343                     ; 312 			break;
1345                     ; 313 		default:
1345                     ; 314 			break;
1347  0046               L173:
1348                     ; 316 }
1351  0046 85            	popw	x
1352  0047 81            	ret	
1400                     ; 320 void cnt_ptc_check_normal_command(uint8_t *buf) {
1401                     .text:	section	.text,new
1402  0000               _cnt_ptc_check_normal_command:
1404  0000 89            	pushw	x
1405  0001 88            	push	a
1406       00000001      OFST:	set	1
1409                     ; 323 	mode = buf[2];
1411  0002 e602          	ld	a,(2,x)
1412  0004 6b01          	ld	(OFST+0,sp),a
1413                     ; 324 	switch (mode) {
1416                     ; 343 			break;
1417  0006 4a            	dec	a
1418  0007 2711          	jreq	L304
1419  0009 4a            	dec	a
1420  000a 271b          	jreq	L504
1421  000c a002          	sub	a,#2
1422  000e 2724          	jreq	L704
1423  0010 a004          	sub	a,#4
1424  0012 272d          	jreq	L114
1425                     ; 341 		default:
1425                     ; 342 			cnt_check_state = STATE_NORMAL;
1427  0014 3501000f      	mov	_cnt_check_state,#1
1428                     ; 343 			break;
1430  0018 2032          	jra	L734
1431  001a               L304:
1432                     ; 325 		case COMMAND_MODE_MIRROR:
1432                     ; 326 			func_cnt_mirror(buf[3]);
1434  001a 1e02          	ldw	x,(OFST+1,sp)
1435  001c e603          	ld	a,(3,x)
1436  001e cd0000        	call	_func_cnt_mirror
1438                     ; 327 			cnt_check_state = STATE_COMMAND_MIRROR;
1440  0021 3504000f      	mov	_cnt_check_state,#4
1441                     ; 328 			break;
1443  0025 2025          	jra	L734
1444  0027               L504:
1445                     ; 329 		case COMMAND_MODE_HOTWATER:
1445                     ; 330 			func_cnt_hotwater(buf[3]);
1447  0027 1e02          	ldw	x,(OFST+1,sp)
1448  0029 e603          	ld	a,(3,x)
1449  002b cd0000        	call	_func_cnt_hotwater
1451                     ; 331 			cnt_check_state = STATE_COMMAND_HOTWATER;
1453  002e 3505000f      	mov	_cnt_check_state,#5
1454                     ; 332 			break;
1456  0032 2018          	jra	L734
1457  0034               L704:
1458                     ; 333 		case COMMAND_MODE_RESET:
1458                     ; 334 			func_cnt_reset(buf[3]);
1460  0034 1e02          	ldw	x,(OFST+1,sp)
1461  0036 e603          	ld	a,(3,x)
1462  0038 cd0000        	call	_func_cnt_reset
1464                     ; 335 			cnt_check_state = STATE_COMMAND_RESET;
1466  003b 3506000f      	mov	_cnt_check_state,#6
1467                     ; 336 			break;
1469  003f 200b          	jra	L734
1470  0041               L114:
1471                     ; 337 		case COMMAND_MODE_FACTORY:
1471                     ; 338 			func_cnt_factory(buf[3]);
1473  0041 1e02          	ldw	x,(OFST+1,sp)
1474  0043 e603          	ld	a,(3,x)
1475  0045 cd0000        	call	_func_cnt_factory
1477                     ; 339 			cnt_check_state = STATE_COMMAND_FACTORY;
1479  0048 3507000f      	mov	_cnt_check_state,#7
1480                     ; 340 			break;
1482  004c               L734:
1483                     ; 345 }
1486  004c 5b03          	addw	sp,#3
1487  004e 81            	ret	
1555                     ; 348 void cnt_ptc_check_homenet(uint8_t *buf) {
1556                     .text:	section	.text,new
1557  0000               _cnt_ptc_check_homenet:
1559  0000 89            	pushw	x
1560  0001 89            	pushw	x
1561       00000002      OFST:	set	2
1564                     ; 354 	id = buf[0] & 0x0F;
1566  0002 f6            	ld	a,(x)
1567  0003 a40f          	and	a,#15
1568  0005 6b02          	ld	(OFST+0,sp),a
1569                     ; 355 	mode = buf[1];
1571  0007 e601          	ld	a,(1,x)
1572  0009 6b01          	ld	(OFST-1,sp),a
1573                     ; 356 	if (msg_hn == 1) {
1575  000b c6000a        	ld	a,_msg_hn
1576  000e 4a            	dec	a
1577  000f 260e          	jrne	L611
1578                     ; 357 		if (hnCnt.id != id) {
1580  0011 c60039        	ld	a,_hnCnt
1581  0014 1102          	cp	a,(OFST+0,sp)
1582  0016 2607          	jrne	L611
1583                     ; 358 			return;
1585                     ; 361 		if (hnCnt.mode != mode) {
1587  0018 c6003a        	ld	a,_hnCnt+1
1588  001b 1101          	cp	a,(OFST-1,sp)
1589  001d 2703          	jreq	L374
1590                     ; 362 			return;
1591  001f               L611:
1594  001f 5b04          	addw	sp,#4
1595  0021 81            	ret	
1596  0022               L374:
1597                     ; 365 		if (mode != MODE_OUT && mode != MODE_STOP) {
1599  0022 7b01          	ld	a,(OFST-1,sp)
1600  0024 a102          	cp	a,#2
1601  0026 2713          	jreq	L574
1603  0028 a104          	cp	a,#4
1604  002a 270f          	jreq	L574
1605                     ; 366 			if (hnCnt.setup_temp != 0xFF) {
1607  002c c6003b        	ld	a,_hnCnt+2
1608  002f 4c            	inc	a
1609  0030 2709          	jreq	L574
1610                     ; 367 				if (hnCnt.setup_temp != buf[3]) {
1612  0032 1e03          	ldw	x,(OFST+1,sp)
1613  0034 e603          	ld	a,(3,x)
1614  0036 c1003b        	cp	a,_hnCnt+2
1615  0039 26e4          	jrne	L611
1616                     ; 368 					return;
1618  003b               L574:
1619                     ; 374 		if (msg_hn_more == 1) {
1621  003b c60009        	ld	a,_msg_hn_more
1622  003e 4a            	dec	a
1623  003f 263f          	jrne	LC011
1624                     ; 375 			isChange = 0;
1626  0041 6b01          	ld	(OFST-1,sp),a
1627                     ; 377 			for (i = 0 ; i < 8 ; i++) {
1629  0043 6b02          	ld	(OFST+0,sp),a
1630  0045               L505:
1631                     ; 378 				if (hnCnts[i].isChange == 1) {
1633  0045 97            	ld	xl,a
1634  0046 a605          	ld	a,#5
1635  0048 42            	mul	x,a
1636  0049 d60015        	ld	a,(_hnCnts+4,x)
1637  004c 4a            	dec	a
1638  004d 2622          	jrne	L315
1639                     ; 379 					hnCnt.id = hnCnts[i].id;
1641  004f d60011        	ld	a,(_hnCnts,x)
1642  0052 c70039        	ld	_hnCnt,a
1643                     ; 380 					hnCnt.comm = hnCnts[i].comm;
1645  0055 d60014        	ld	a,(_hnCnts+3,x)
1646  0058 c7003c        	ld	_hnCnt+3,a
1647                     ; 381 					hnCnt.mode = hnCnts[i].mode;
1649  005b d60012        	ld	a,(_hnCnts+1,x)
1650  005e c7003a        	ld	_hnCnt+1,a
1651                     ; 382 					hnCnt.setup_temp = hnCnts[i].setup_temp;
1653  0061 d60013        	ld	a,(_hnCnts+2,x)
1654  0064 c7003b        	ld	_hnCnt+2,a
1655                     ; 383 					hnCnts[i].isChange = 0;
1657  0067 724f0015      	clr	(_hnCnts+4,x)
1658                     ; 384 					isChange = 1;
1660  006b a601          	ld	a,#1
1661  006d 6b01          	ld	(OFST-1,sp),a
1662                     ; 385 					break;
1664  006f 2008          	jra	L115
1665  0071               L315:
1666                     ; 377 			for (i = 0 ; i < 8 ; i++) {
1668  0071 0c02          	inc	(OFST+0,sp)
1671  0073 7b02          	ld	a,(OFST+0,sp)
1672  0075 a108          	cp	a,#8
1673  0077 25cc          	jrult	L505
1674  0079               L115:
1675                     ; 389 			if (isChange == 0) {
1677  0079 7b01          	ld	a,(OFST-1,sp)
1678  007b 26a2          	jrne	L611
1679                     ; 390 				msg_hn_more = 0;
1681  007d c70009        	ld	_msg_hn_more,a
1682                     ; 391 				msg_hn = 0;
1684  0080               LC011:
1686  0080 725f000a      	clr	_msg_hn
1687  0084 2099          	jra	L611
1688                     ; 394 			msg_hn = 0;
1689                     ; 397 }
1740                     ; 400 void cnt_ptc_check_shower(void) {
1741                     .text:	section	.text,new
1742  0000               _cnt_ptc_check_shower:
1744  0000 5203          	subw	sp,#3
1745       00000003      OFST:	set	3
1748                     ; 402 	uint8_t checker = 0;
1750  0002 0f01          	clr	(OFST-2,sp)
1751                     ; 403 	uint8_t temp = 0;
1753  0004 0f02          	clr	(OFST-1,sp)
1754                     ; 405 	for (i = 0 ; i < 8 ; i++) {
1756  0006 4f            	clr	a
1757  0007 6b03          	ld	(OFST+0,sp),a
1758  0009               L145:
1759                     ; 406 		if (__mode_shower[i] != 0) {
1761  0009 5f            	clrw	x
1762  000a 97            	ld	xl,a
1763  000b d60001        	ld	a,(___mode_shower,x)
1764  000e 2718          	jreq	L745
1765                     ; 407 			checker = 1;
1767  0010 a601          	ld	a,#1
1768  0012 6b01          	ld	(OFST-2,sp),a
1769                     ; 408 			if (temp < __mode_shower[i]) {
1771  0014 5f            	clrw	x
1772  0015 7b03          	ld	a,(OFST+0,sp)
1773  0017 97            	ld	xl,a
1774  0018 d60001        	ld	a,(___mode_shower,x)
1775  001b 1102          	cp	a,(OFST-1,sp)
1776  001d 2309          	jrule	L745
1777                     ; 409 				temp = __mode_shower[i];
1779  001f 7b03          	ld	a,(OFST+0,sp)
1780  0021 5f            	clrw	x
1781  0022 97            	ld	xl,a
1782  0023 d60001        	ld	a,(___mode_shower,x)
1783  0026 6b02          	ld	(OFST-1,sp),a
1784  0028               L745:
1785                     ; 405 	for (i = 0 ; i < 8 ; i++) {
1787  0028 0c03          	inc	(OFST+0,sp)
1790  002a 7b03          	ld	a,(OFST+0,sp)
1791  002c a108          	cp	a,#8
1792  002e 25d9          	jrult	L145
1793                     ; 414 	_is_shower = checker;
1795  0030 7b01          	ld	a,(OFST-2,sp)
1796  0032 c70000        	ld	__is_shower,a
1797                     ; 415 	funcInfo.boiler_set_water_shower = temp;
1799  0035 7b02          	ld	a,(OFST-1,sp)
1800  0037 c70086        	ld	_funcInfo+3,a
1801                     ; 416 }
1804  003a 5b03          	addw	sp,#3
1805  003c 81            	ret	
1863                     ; 419 void cnt_ptc_check_normal(uint8_t *buf) {
1864                     .text:	section	.text,new
1865  0000               _cnt_ptc_check_normal:
1867  0000 89            	pushw	x
1868  0001 89            	pushw	x
1869       00000002      OFST:	set	2
1872                     ; 423 	id = buf[0] & 0x0F;
1874  0002 f6            	ld	a,(x)
1875  0003 a40f          	and	a,#15
1876  0005 6b02          	ld	(OFST+0,sp),a
1877                     ; 424 	mode = buf[1];
1879  0007 e601          	ld	a,(1,x)
1880  0009 6b01          	ld	(OFST-1,sp),a
1881                     ; 425 	packet_buf[id - 1] = 0; 
1883  000b 5f            	clrw	x
1884  000c 7b02          	ld	a,(OFST+0,sp)
1885  000e 97            	ld	xl,a
1886  000f 5a            	decw	x
1887  0010 724f0000      	clr	(_packet_buf,x)
1888                     ; 427 	switch (mode) {
1890  0014 7b01          	ld	a,(OFST-1,sp)
1892                     ; 453 			break;
1893  0016 4a            	dec	a
1894  0017 2719          	jreq	L355
1895  0019 4a            	dec	a
1896  001a 2716          	jreq	L355
1897  001c a002          	sub	a,#2
1898  001e 2712          	jreq	L355
1899  0020 a004          	sub	a,#4
1900  0022 270e          	jreq	L355
1901  0024 a008          	sub	a,#8
1902  0026 270a          	jreq	L355
1903  0028 a010          	sub	a,#16
1904  002a 273b          	jreq	L555
1905                     ; 451 		default:
1905                     ; 452 			cnt_check_state = STATE_NORMAL;
1907  002c 3501000f      	mov	_cnt_check_state,#1
1908                     ; 453 			break;
1910  0030 203a          	jra	L506
1911  0032               L355:
1912                     ; 428 		case MODE_HOT:
1912                     ; 429 		case MODE_OUT:
1912                     ; 430 		case MODE_STOP:
1912                     ; 431 		case MODE_RESERVE:
1912                     ; 432 		case MODE_REPEAT:
1912                     ; 433 			func_cnt_calcInfo(id, mode, buf[2], buf[3]);
1914  0032 1e03          	ldw	x,(OFST+1,sp)
1915  0034 e603          	ld	a,(3,x)
1916  0036 88            	push	a
1917  0037 1e04          	ldw	x,(OFST+2,sp)
1918  0039 e602          	ld	a,(2,x)
1919  003b 88            	push	a
1920  003c 7b03          	ld	a,(OFST+1,sp)
1921  003e 97            	ld	xl,a
1922  003f 7b04          	ld	a,(OFST+2,sp)
1923  0041 95            	ld	xh,a
1924  0042 cd0000        	call	_func_cnt_calcInfo
1926  0045 3501000f      	mov	_cnt_check_state,#1
1927  0049 85            	popw	x
1928                     ; 434 			cnt_check_state = STATE_NORMAL;
1930                     ; 439 			if ((id - 1) == 0) {
1932  004a 7b02          	ld	a,(OFST+0,sp)
1933  004c 5f            	clrw	x
1934  004d 97            	ld	xl,a
1935  004e 5a            	decw	x
1936  004f 261b          	jrne	L506
1937                     ; 440 				_is_shower = (buf[6] & 0x01);
1939  0051 1e03          	ldw	x,(OFST+1,sp)
1940  0053 e606          	ld	a,(6,x)
1941  0055 a401          	and	a,#1
1942  0057 c70000        	ld	__is_shower,a
1943                     ; 441 				funcInfo.boiler_set_water_shower = (buf[6] >> 1);
1945  005a e606          	ld	a,(6,x)
1946  005c 44            	srl	a
1947  005d c70086        	ld	_funcInfo+3,a
1948                     ; 442 				funcInfo.boiler_set_water_heat = buf[4];
1950  0060 e604          	ld	a,(4,x)
1951  0062 c70087        	ld	_funcInfo+4,a
1952  0065 2005          	jra	L506
1953  0067               L555:
1954                     ; 448 		case MODE_COMMAND:
1954                     ; 449 			cnt_ptc_check_normal_command(buf);
1956  0067 1e03          	ldw	x,(OFST+1,sp)
1957  0069 cd0000        	call	_cnt_ptc_check_normal_command
1959                     ; 450 			break;
1961  006c               L506:
1962                     ; 456 	rcInfo.mode[id - 1] = mode;
1964  006c 7b02          	ld	a,(OFST+0,sp)
1965  006e 5f            	clrw	x
1966  006f 97            	ld	xl,a
1967  0070 5a            	decw	x
1968  0071 7b01          	ld	a,(OFST-1,sp)
1969  0073 d7004e        	ld	(_rcInfo+16,x),a
1970                     ; 457 	rcInfo.curr_temp[id - 1] = buf[2];
1972  0076 5f            	clrw	x
1973  0077 7b02          	ld	a,(OFST+0,sp)
1974  0079 97            	ld	xl,a
1975  007a 1603          	ldw	y,(OFST+1,sp)
1976  007c 5a            	decw	x
1977  007d 90e602        	ld	a,(2,y)
1978  0080 d7003e        	ld	(_rcInfo,x),a
1979                     ; 458 	rcInfo.setup_temp[id - 1] = buf[3];
1981  0083 5f            	clrw	x
1982  0084 7b02          	ld	a,(OFST+0,sp)
1983  0086 97            	ld	xl,a
1984  0087 5a            	decw	x
1985  0088 90e603        	ld	a,(3,y)
1986  008b d70046        	ld	(_rcInfo+8,x),a
1987                     ; 460 	cnt_ptc_check_homenet(buf);
1989  008e 1e03          	ldw	x,(OFST+1,sp)
1990  0090 cd0000        	call	_cnt_ptc_check_homenet
1992                     ; 461 }
1995  0093 5b04          	addw	sp,#4
1996  0095 81            	ret	
2021                     ; 463 uint8_t cnt_ptc_getCheckState(void) {
2022                     .text:	section	.text,new
2023  0000               _cnt_ptc_getCheckState:
2027                     ; 464 	return cnt_check_state;
2029  0000 c6000f        	ld	a,_cnt_check_state
2032  0003 81            	ret	
2271                     ; 467 void   copy_funcInfo(uint8_t page)
2271                     ; 468 {
2272                     .text:	section	.text,new
2273  0000               _copy_funcInfo:
2275  0000 88            	push	a
2276  0001 5204          	subw	sp,#4
2277       00000004      OFST:	set	4
2280                     ; 472    p = cntGetType()==0 ? &funcInfo : &funcInfo2;
2282  0003 cd0000        	call	_cntGetType
2284  0006 4d            	tnz	a
2285  0007 2605          	jrne	L631
2286  0009 ae0083        	ldw	x,#_funcInfo
2287  000c 2003          	jra	L241
2288  000e               L631:
2289  000e ae005e        	ldw	x,#_funcInfo2
2290  0011               L241:
2291  0011 1f01          	ldw	(OFST-3,sp),x
2292                     ; 473    for( i=0; i<TBL_V_SIZE/2; i++ )
2294  0013 4f            	clr	a
2295  0014 6b04          	ld	(OFST+0,sp),a
2296  0016               L537:
2297                     ; 475       vtbl.coil[i] = funcInfo.valve_len[i];
2299  0016 5f            	clrw	x
2300  0017 97            	ld	xl,a
2301  0018 d6009f        	ld	a,(_funcInfo+28,x)
2302  001b d70010        	ld	(_vtbl+16,x),a
2303                     ; 476       vtbl.valve2rc[i] = funcInfo.valve_rc[i];
2305  001e 5f            	clrw	x
2306  001f 7b04          	ld	a,(OFST+0,sp)
2307  0021 97            	ld	xl,a
2308  0022 d60097        	ld	a,(_funcInfo+20,x)
2309  0025 d70050        	ld	(_vtbl+80,x),a
2310                     ; 477       if( i >= funcInfo.valve )
2312  0028 7b04          	ld	a,(OFST+0,sp)
2313  002a c10090        	cp	a,_funcInfo+13
2314  002d 2506          	jrult	L347
2315                     ; 478          vtbl.coil[i] = 0;
2317  002f 5f            	clrw	x
2318  0030 97            	ld	xl,a
2319  0031 724f0010      	clr	(_vtbl+16,x)
2320  0035               L347:
2321                     ; 473    for( i=0; i<TBL_V_SIZE/2; i++ )
2323  0035 0c04          	inc	(OFST+0,sp)
2326  0037 7b04          	ld	a,(OFST+0,sp)
2327  0039 a108          	cp	a,#8
2328  003b 25d9          	jrult	L537
2329                     ; 480    for( i=0; i<TBL_V_SIZE/2; i++ )
2331  003d 4f            	clr	a
2332  003e 6b04          	ld	(OFST+0,sp),a
2333  0040               L547:
2334                     ; 482       k = TBL_V_SIZE/2 + i;
2336  0040 ab08          	add	a,#8
2337  0042 6b03          	ld	(OFST-1,sp),a
2338                     ; 483       vtbl.coil[k] = funcInfo2.valve_len[i];
2340  0044 5f            	clrw	x
2341  0045 97            	ld	xl,a
2342  0046 7b04          	ld	a,(OFST+0,sp)
2343  0048 905f          	clrw	y
2344  004a 9097          	ld	yl,a
2345  004c 90d6007a      	ld	a,(_funcInfo2+28,y)
2346  0050 d70010        	ld	(_vtbl+16,x),a
2347                     ; 484       vtbl.valve2rc[k] = funcInfo2.valve_rc[i];
2349  0053 5f            	clrw	x
2350  0054 7b03          	ld	a,(OFST-1,sp)
2351  0056 97            	ld	xl,a
2352  0057 7b04          	ld	a,(OFST+0,sp)
2353  0059 905f          	clrw	y
2354  005b 9097          	ld	yl,a
2355  005d 90d60072      	ld	a,(_funcInfo2+20,y)
2356  0061 d70050        	ld	(_vtbl+80,x),a
2357                     ; 485       if( i >= funcInfo2.valve )
2359  0064 7b04          	ld	a,(OFST+0,sp)
2360  0066 c1006b        	cp	a,_funcInfo2+13
2361  0069 2508          	jrult	L357
2362                     ; 486          vtbl.coil[k] = 0;
2364  006b 7b03          	ld	a,(OFST-1,sp)
2365  006d 5f            	clrw	x
2366  006e 97            	ld	xl,a
2367  006f 724f0010      	clr	(_vtbl+16,x)
2368  0073               L357:
2369                     ; 480    for( i=0; i<TBL_V_SIZE/2; i++ )
2371  0073 0c04          	inc	(OFST+0,sp)
2374  0075 7b04          	ld	a,(OFST+0,sp)
2375  0077 a108          	cp	a,#8
2376  0079 25c5          	jrult	L547
2377                     ; 488    for( i=0; i<TBL_V_SIZE; i++ )
2379  007b 4f            	clr	a
2380  007c 6b04          	ld	(OFST+0,sp),a
2381  007e               L557:
2382                     ; 490       if( vtbl.valve2rc[i] == 0 )
2384  007e 5f            	clrw	x
2385  007f 97            	ld	xl,a
2386  0080 724d0050      	tnz	(_vtbl+80,x)
2387  0084 2612          	jrne	L367
2388                     ; 492          vtbl.curr[i] = 0;
2390  0086 5f            	clrw	x
2391  0087 97            	ld	xl,a
2392  0088 724f0020      	clr	(_vtbl+32,x)
2393                     ; 493          vtbl.setup[i] = 0;
2395  008c 5f            	clrw	x
2396  008d 97            	ld	xl,a
2397  008e 724f0030      	clr	(_vtbl+48,x)
2398                     ; 494          vtbl.coil[i] = 0;
2400  0092 5f            	clrw	x
2401  0093 97            	ld	xl,a
2402  0094 724f0010      	clr	(_vtbl+16,x)
2403  0098               L367:
2404                     ; 488    for( i=0; i<TBL_V_SIZE; i++ )
2406  0098 0c04          	inc	(OFST+0,sp)
2409  009a 7b04          	ld	a,(OFST+0,sp)
2410  009c a110          	cp	a,#16
2411  009e 25de          	jrult	L557
2412                     ; 498    if( vtbl.ii[0] != 0x80 )
2414  00a0 c60080        	ld	a,_vtbl+128
2415  00a3 a180          	cp	a,#128
2416  00a5 272a          	jreq	L567
2417                     ; 500       vtbl.ii[0] = page==0 ? 0x80 : 0;
2419  00a7 7b05          	ld	a,(OFST+1,sp)
2420  00a9 2604          	jrne	L441
2421  00ab a680          	ld	a,#128
2422  00ad 2001          	jra	L641
2423  00af               L441:
2424  00af 4f            	clr	a
2425  00b0               L641:
2426  00b0 c70080        	ld	_vtbl+128,a
2427                     ; 502       if( p->opMode == 7 )
2429  00b3 1e01          	ldw	x,(OFST-3,sp)
2430  00b5 e611          	ld	a,(17,x)
2431  00b7 a107          	cp	a,#7
2432  00b9 260a          	jrne	L767
2433                     ; 504          vtbl.ii[0] = 0;
2435  00bb 725f0080      	clr	_vtbl+128
2436                     ; 505          vtbl.ii[2] = 0xff;
2438  00bf 35ff0082      	mov	_vtbl+130,#255
2440  00c3 200c          	jra	L567
2441  00c5               L767:
2442                     ; 507       else if( vtbl.ii[2] == 0xff )
2444  00c5 c60082        	ld	a,_vtbl+130
2445  00c8 4c            	inc	a
2446  00c9 2606          	jrne	L567
2447                     ; 509          vtbl.ii[0] = 0;
2449  00cb c70080        	ld	_vtbl+128,a
2450                     ; 510          vtbl.ii[2] = 0;
2452  00ce c70082        	ld	_vtbl+130,a
2453  00d1               L567:
2454                     ; 514    vtbl.ii[1] = vtbl.valveCnt > p->valve ? vtbl.valveCnt : 0;
2456  00d1 1e01          	ldw	x,(OFST-3,sp)
2457  00d3 e60d          	ld	a,(13,x)
2458  00d5 c1009a        	cp	a,_vtbl+154
2459  00d8 2405          	jruge	L051
2460  00da c6009a        	ld	a,_vtbl+154
2461  00dd 2001          	jra	L251
2462  00df               L051:
2463  00df 4f            	clr	a
2464  00e0               L251:
2465  00e0 c70081        	ld	_vtbl+129,a
2466                     ; 516    vtbl.valveCnt = p->valve;
2468  00e3 e60d          	ld	a,(13,x)
2469  00e5 c7009a        	ld	_vtbl+154,a
2470                     ; 517    vtbl.max = p->houseCapa;
2472  00e8 e60e          	ld	a,(14,x)
2473  00ea c70096        	ld	_vtbl+150,a
2474                     ; 518    vtbl.cntlMode = funcInfo.cntlMode;
2476  00ed 550093009c    	mov	_vtbl+156,_funcInfo+16
2477                     ; 519 }
2480  00f2 5b05          	addw	sp,#5
2481  00f4 81            	ret	
2484                     	switch	.data
2485  0001               __flash_save_enable:
2486  0001 00            	dc.b	0
2487  0002               __flash_save_count:
2488  0002 00            	dc.b	0
2489  0003               __flash_save_timer:
2490  0003 00            	dc.b	0
2520                     ; 534 void	_flash_saveCb(void)
2520                     ; 535 {
2521                     .text:	section	.text,new
2522  0000               __flash_saveCb:
2526                     ; 536 	if( _flash_save_enable != 1 )
2528  0000 c60001        	ld	a,__flash_save_enable
2529  0003 4a            	dec	a
2530  0004 2701          	jreq	L5001
2531                     ; 537 		return;
2534  0006 81            	ret	
2535  0007               L5001:
2536                     ; 539 	if( _flash_save_timer != 0 )
2538  0007 c60003        	ld	a,__flash_save_timer
2539  000a 2705          	jreq	L7001
2540                     ; 541 		_flash_save_timer--;
2542  000c 725a0003      	dec	__flash_save_timer
2543                     ; 542 		return;
2546  0010 81            	ret	
2547  0011               L7001:
2548                     ; 544 	_flash_save_enable = 0;
2550  0011 c70001        	ld	__flash_save_enable,a
2551                     ; 547 	UART1_DeInit();
2553  0014 cd0000        	call	_UART1_DeInit
2555                     ; 548 	UART3_DeInit();
2557  0017 cd0000        	call	_UART3_DeInit
2559                     ; 550 	if( (_flash_save_count & 0x80) != 0 )
2561  001a 720f000278    	btjf	__flash_save_count,#7,L1101
2562                     ; 552 		FW_B_TYPE(funcInfo.boiler_type);
2564  001f c60088        	ld	a,_funcInfo+5
2565  0022 97            	ld	xl,a
2566  0023 a63e          	ld	a,#62
2567  0025 95            	ld	xh,a
2568  0026 cd0000        	call	_file_write
2570                     ; 553 		FW_LPM(funcInfo.lpmType);
2572  0029 c6008f        	ld	a,_funcInfo+12
2573  002c 97            	ld	xl,a
2574  002d a63c          	ld	a,#60
2575  002f 95            	ld	xh,a
2576  0030 cd0000        	call	_file_write
2578                     ; 554 		FW_CNT(funcInfo.cnt);
2580  0033 c6008e        	ld	a,_funcInfo+11
2581  0036 97            	ld	xl,a
2582  0037 a620          	ld	a,#32
2583  0039 95            	ld	xh,a
2584  003a cd0000        	call	_file_write
2586                     ; 555 		FW_VALVE(funcInfo.valve);
2588  003d c60090        	ld	a,_funcInfo+13
2589  0040 97            	ld	xl,a
2590  0041 a623          	ld	a,#35
2591  0043 95            	ld	xh,a
2592  0044 cd0000        	call	_file_write
2594                     ; 556 		FW_B_SHOWER(funcInfo.boiler_set_water_shower);
2596  0047 c60086        	ld	a,_funcInfo+3
2597  004a 97            	ld	xl,a
2598  004b a63a          	ld	a,#58
2599  004d 95            	ld	xh,a
2600  004e cd0000        	call	_file_write
2602                     ; 557 		FW_HOUSECAPA(funcInfo.houseCapa);
2604  0051 c60091        	ld	a,_funcInfo+14
2605  0054 97            	ld	xl,a
2606  0055 a628          	ld	a,#40
2607  0057 95            	ld	xh,a
2608  0058 cd0000        	call	_file_write
2610                     ; 558 		FW_B_HEAT(funcInfo.boiler_set_water_heat);
2612  005b c60087        	ld	a,_funcInfo+4
2613  005e 97            	ld	xl,a
2614  005f a63b          	ld	a,#59
2615  0061 95            	ld	xh,a
2616  0062 cd0000        	call	_file_write
2618                     ; 559 		FW_SUBRCLOCK(funcInfo.subrcLock);
2620  0065 c6008a        	ld	a,_funcInfo+7
2621  0068 97            	ld	xl,a
2622  0069 a63d          	ld	a,#61
2623  006b 95            	ld	xh,a
2624  006c cd0000        	call	_file_write
2626                     ; 560 		FW_POTYPE(funcInfo.poType);
2628  006f c60092        	ld	a,_funcInfo+15
2629  0072 97            	ld	xl,a
2630  0073 a627          	ld	a,#39
2631  0075 95            	ld	xh,a
2632  0076 cd0000        	call	_file_write
2634                     ; 561 		FW_CNT_MODE(funcInfo.cntlMode);
2636  0079 c60093        	ld	a,_funcInfo+16
2637  007c 97            	ld	xl,a
2638  007d a622          	ld	a,#34
2639  007f 95            	ld	xh,a
2640  0080 cd0000        	call	_file_write
2642                     ; 562 		FW_OPMODE(funcInfo.opMode);
2644  0083 c60094        	ld	a,_funcInfo+17
2645  0086 97            	ld	xl,a
2646  0087 a621          	ld	a,#33
2647  0089 95            	ld	xh,a
2648  008a cd0000        	call	_file_write
2650                     ; 563 		FW_PLC(funcInfo.plc);
2652  008d c600a7        	ld	a,_funcInfo+36
2653  0090 97            	ld	xl,a
2654  0091 a649          	ld	a,#73
2655  0093 95            	ld	xh,a
2656  0094 cd0000        	call	_file_write
2658  0097               L1101:
2659                     ; 565 	if( (_flash_save_count & 0x40) != 0 )
2661  0097 720d000278    	btjf	__flash_save_count,#6,L3101
2662                     ; 567 		FW2_B_TYPE(funcInfo2.boiler_type);
2664  009c c60063        	ld	a,_funcInfo2+5
2665  009f 97            	ld	xl,a
2666  00a0 a6a2          	ld	a,#162
2667  00a2 95            	ld	xh,a
2668  00a3 cd0000        	call	_file_write
2670                     ; 568 		FW2_LPM(funcInfo2.lpmType);
2672  00a6 c6006a        	ld	a,_funcInfo2+12
2673  00a9 97            	ld	xl,a
2674  00aa a6a0          	ld	a,#160
2675  00ac 95            	ld	xh,a
2676  00ad cd0000        	call	_file_write
2678                     ; 569 		FW2_CNT(funcInfo2.cnt);
2680  00b0 c60069        	ld	a,_funcInfo2+11
2681  00b3 97            	ld	xl,a
2682  00b4 a684          	ld	a,#132
2683  00b6 95            	ld	xh,a
2684  00b7 cd0000        	call	_file_write
2686                     ; 570 		FW2_VALVE(funcInfo2.valve);
2688  00ba c6006b        	ld	a,_funcInfo2+13
2689  00bd 97            	ld	xl,a
2690  00be a687          	ld	a,#135
2691  00c0 95            	ld	xh,a
2692  00c1 cd0000        	call	_file_write
2694                     ; 571 		FW2_B_SHOWER(funcInfo2.boiler_set_water_shower);
2696  00c4 c60061        	ld	a,_funcInfo2+3
2697  00c7 97            	ld	xl,a
2698  00c8 a69e          	ld	a,#158
2699  00ca 95            	ld	xh,a
2700  00cb cd0000        	call	_file_write
2702                     ; 572 		FW2_HOUSECAPA(funcInfo2.houseCapa);
2704  00ce c6006c        	ld	a,_funcInfo2+14
2705  00d1 97            	ld	xl,a
2706  00d2 a68c          	ld	a,#140
2707  00d4 95            	ld	xh,a
2708  00d5 cd0000        	call	_file_write
2710                     ; 573 		FW2_B_HEAT(funcInfo2.boiler_set_water_heat);
2712  00d8 c60062        	ld	a,_funcInfo2+4
2713  00db 97            	ld	xl,a
2714  00dc a69f          	ld	a,#159
2715  00de 95            	ld	xh,a
2716  00df cd0000        	call	_file_write
2718                     ; 574 		FW2_SUBRCLOCK(funcInfo2.subrcLock);
2720  00e2 c60065        	ld	a,_funcInfo2+7
2721  00e5 97            	ld	xl,a
2722  00e6 a6a1          	ld	a,#161
2723  00e8 95            	ld	xh,a
2724  00e9 cd0000        	call	_file_write
2726                     ; 575 		FW2_POTYPE(funcInfo2.poType);
2728  00ec c6006d        	ld	a,_funcInfo2+15
2729  00ef 97            	ld	xl,a
2730  00f0 a68b          	ld	a,#139
2731  00f2 95            	ld	xh,a
2732  00f3 cd0000        	call	_file_write
2734                     ; 576 		FW2_CNT_MODE(funcInfo2.cntlMode);
2736  00f6 c6006e        	ld	a,_funcInfo2+16
2737  00f9 97            	ld	xl,a
2738  00fa a686          	ld	a,#134
2739  00fc 95            	ld	xh,a
2740  00fd cd0000        	call	_file_write
2742                     ; 577 		FW2_OPMODE(funcInfo2.opMode);
2744  0100 c6006f        	ld	a,_funcInfo2+17
2745  0103 97            	ld	xl,a
2746  0104 a685          	ld	a,#133
2747  0106 95            	ld	xh,a
2748  0107 cd0000        	call	_file_write
2750                     ; 578 		FW2_PLC(funcInfo2.plc);
2752  010a c60082        	ld	a,_funcInfo2+36
2753  010d 97            	ld	xl,a
2754  010e a6ad          	ld	a,#173
2755  0110 95            	ld	xh,a
2756  0111 cd0000        	call	_file_write
2758  0114               L3101:
2759                     ; 580 	if( (_flash_save_count & 0x20) != 0 )
2761  0114 720b000250    	btjf	__flash_save_count,#5,L5101
2762                     ; 582 		FW_VRC_1(funcInfo.valve_rc[0]);
2764  0119 c60097        	ld	a,_funcInfo+20
2765  011c 97            	ld	xl,a
2766  011d a632          	ld	a,#50
2767  011f 95            	ld	xh,a
2768  0120 cd0000        	call	_file_write
2770                     ; 583 		FW_VRC_2(funcInfo.valve_rc[1]);
2772  0123 c60098        	ld	a,_funcInfo+21
2773  0126 97            	ld	xl,a
2774  0127 a633          	ld	a,#51
2775  0129 95            	ld	xh,a
2776  012a cd0000        	call	_file_write
2778                     ; 584 		FW_VRC_3(funcInfo.valve_rc[2]);
2780  012d c60099        	ld	a,_funcInfo+22
2781  0130 97            	ld	xl,a
2782  0131 a634          	ld	a,#52
2783  0133 95            	ld	xh,a
2784  0134 cd0000        	call	_file_write
2786                     ; 585 		FW_VRC_4(funcInfo.valve_rc[3]);
2788  0137 c6009a        	ld	a,_funcInfo+23
2789  013a 97            	ld	xl,a
2790  013b a635          	ld	a,#53
2791  013d 95            	ld	xh,a
2792  013e cd0000        	call	_file_write
2794                     ; 586 		FW_VL_1(funcInfo.valve_len[0]);
2796  0141 c6009f        	ld	a,_funcInfo+28
2797  0144 97            	ld	xl,a
2798  0145 a62a          	ld	a,#42
2799  0147 95            	ld	xh,a
2800  0148 cd0000        	call	_file_write
2802                     ; 587 		FW_VL_2(funcInfo.valve_len[1]);
2804  014b c600a0        	ld	a,_funcInfo+29
2805  014e 97            	ld	xl,a
2806  014f a62b          	ld	a,#43
2807  0151 95            	ld	xh,a
2808  0152 cd0000        	call	_file_write
2810                     ; 588 		FW_VL_3(funcInfo.valve_len[2]);
2812  0155 c600a1        	ld	a,_funcInfo+30
2813  0158 97            	ld	xl,a
2814  0159 a62c          	ld	a,#44
2815  015b 95            	ld	xh,a
2816  015c cd0000        	call	_file_write
2818                     ; 589 		FW_VL_4(funcInfo.valve_len[3]);
2820  015f c600a2        	ld	a,_funcInfo+31
2821  0162 97            	ld	xl,a
2822  0163 a62d          	ld	a,#45
2823  0165 95            	ld	xh,a
2824  0166 cd0000        	call	_file_write
2826  0169               L5101:
2827                     ; 591 	if( (_flash_save_count & 0x10) != 0 )
2829  0169 7209000250    	btjf	__flash_save_count,#4,L7101
2830                     ; 593 		FW2_VRC_1(funcInfo2.valve_rc[0]);
2832  016e c60072        	ld	a,_funcInfo2+20
2833  0171 97            	ld	xl,a
2834  0172 a696          	ld	a,#150
2835  0174 95            	ld	xh,a
2836  0175 cd0000        	call	_file_write
2838                     ; 594 		FW2_VRC_2(funcInfo2.valve_rc[1]);
2840  0178 c60073        	ld	a,_funcInfo2+21
2841  017b 97            	ld	xl,a
2842  017c a697          	ld	a,#151
2843  017e 95            	ld	xh,a
2844  017f cd0000        	call	_file_write
2846                     ; 595 		FW2_VRC_3(funcInfo2.valve_rc[2]);
2848  0182 c60074        	ld	a,_funcInfo2+22
2849  0185 97            	ld	xl,a
2850  0186 a698          	ld	a,#152
2851  0188 95            	ld	xh,a
2852  0189 cd0000        	call	_file_write
2854                     ; 596 		FW2_VRC_4(funcInfo2.valve_rc[3]);
2856  018c c60075        	ld	a,_funcInfo2+23
2857  018f 97            	ld	xl,a
2858  0190 a699          	ld	a,#153
2859  0192 95            	ld	xh,a
2860  0193 cd0000        	call	_file_write
2862                     ; 597 		FW2_VL_1(funcInfo2.valve_len[0]);
2864  0196 c6007a        	ld	a,_funcInfo2+28
2865  0199 97            	ld	xl,a
2866  019a a68e          	ld	a,#142
2867  019c 95            	ld	xh,a
2868  019d cd0000        	call	_file_write
2870                     ; 598 		FW2_VL_2(funcInfo2.valve_len[1]);
2872  01a0 c6007b        	ld	a,_funcInfo2+29
2873  01a3 97            	ld	xl,a
2874  01a4 a68f          	ld	a,#143
2875  01a6 95            	ld	xh,a
2876  01a7 cd0000        	call	_file_write
2878                     ; 599 		FW2_VL_3(funcInfo2.valve_len[2]);
2880  01aa c6007c        	ld	a,_funcInfo2+30
2881  01ad 97            	ld	xl,a
2882  01ae a690          	ld	a,#144
2883  01b0 95            	ld	xh,a
2884  01b1 cd0000        	call	_file_write
2886                     ; 600 		FW2_VL_4(funcInfo2.valve_len[3]);
2888  01b4 c6007d        	ld	a,_funcInfo2+31
2889  01b7 97            	ld	xl,a
2890  01b8 a691          	ld	a,#145
2891  01ba 95            	ld	xh,a
2892  01bb cd0000        	call	_file_write
2894  01be               L7101:
2895                     ; 602 	if( (_flash_save_count & 0x08) != 0 )
2897  01be 7207000250    	btjf	__flash_save_count,#3,L1201
2898                     ; 604 		FW_VRC_5(funcInfo.valve_rc[4]);
2900  01c3 c6009b        	ld	a,_funcInfo+24
2901  01c6 97            	ld	xl,a
2902  01c7 a636          	ld	a,#54
2903  01c9 95            	ld	xh,a
2904  01ca cd0000        	call	_file_write
2906                     ; 605 		FW_VRC_6(funcInfo.valve_rc[5]);
2908  01cd c6009c        	ld	a,_funcInfo+25
2909  01d0 97            	ld	xl,a
2910  01d1 a637          	ld	a,#55
2911  01d3 95            	ld	xh,a
2912  01d4 cd0000        	call	_file_write
2914                     ; 606 		FW_VRC_7(funcInfo.valve_rc[6]);
2916  01d7 c6009d        	ld	a,_funcInfo+26
2917  01da 97            	ld	xl,a
2918  01db a638          	ld	a,#56
2919  01dd 95            	ld	xh,a
2920  01de cd0000        	call	_file_write
2922                     ; 607 		FW_VRC_8(funcInfo.valve_rc[7]);
2924  01e1 c6009e        	ld	a,_funcInfo+27
2925  01e4 97            	ld	xl,a
2926  01e5 a639          	ld	a,#57
2927  01e7 95            	ld	xh,a
2928  01e8 cd0000        	call	_file_write
2930                     ; 608 		FW_VL_5(funcInfo.valve_len[4]);
2932  01eb c600a3        	ld	a,_funcInfo+32
2933  01ee 97            	ld	xl,a
2934  01ef a62e          	ld	a,#46
2935  01f1 95            	ld	xh,a
2936  01f2 cd0000        	call	_file_write
2938                     ; 609 		FW_VL_6(funcInfo.valve_len[5]);
2940  01f5 c600a4        	ld	a,_funcInfo+33
2941  01f8 97            	ld	xl,a
2942  01f9 a62f          	ld	a,#47
2943  01fb 95            	ld	xh,a
2944  01fc cd0000        	call	_file_write
2946                     ; 610 		FW_VL_7(funcInfo.valve_len[6]);
2948  01ff c600a5        	ld	a,_funcInfo+34
2949  0202 97            	ld	xl,a
2950  0203 a630          	ld	a,#48
2951  0205 95            	ld	xh,a
2952  0206 cd0000        	call	_file_write
2954                     ; 611 		FW_VL_8(funcInfo.valve_len[7]);
2956  0209 c600a6        	ld	a,_funcInfo+35
2957  020c 97            	ld	xl,a
2958  020d a631          	ld	a,#49
2959  020f 95            	ld	xh,a
2960  0210 cd0000        	call	_file_write
2962  0213               L1201:
2963                     ; 613 	if( (_flash_save_count & 0x04) != 0 )
2965  0213 7205000250    	btjf	__flash_save_count,#2,L3201
2966                     ; 615 		FW2_VRC_5(funcInfo2.valve_rc[4]);
2968  0218 c60076        	ld	a,_funcInfo2+24
2969  021b 97            	ld	xl,a
2970  021c a69a          	ld	a,#154
2971  021e 95            	ld	xh,a
2972  021f cd0000        	call	_file_write
2974                     ; 616 		FW2_VRC_6(funcInfo2.valve_rc[5]);
2976  0222 c60077        	ld	a,_funcInfo2+25
2977  0225 97            	ld	xl,a
2978  0226 a69b          	ld	a,#155
2979  0228 95            	ld	xh,a
2980  0229 cd0000        	call	_file_write
2982                     ; 617 		FW2_VRC_7(funcInfo2.valve_rc[6]);
2984  022c c60078        	ld	a,_funcInfo2+26
2985  022f 97            	ld	xl,a
2986  0230 a69c          	ld	a,#156
2987  0232 95            	ld	xh,a
2988  0233 cd0000        	call	_file_write
2990                     ; 618 		FW2_VRC_8(funcInfo2.valve_rc[7]);
2992  0236 c60079        	ld	a,_funcInfo2+27
2993  0239 97            	ld	xl,a
2994  023a a69d          	ld	a,#157
2995  023c 95            	ld	xh,a
2996  023d cd0000        	call	_file_write
2998                     ; 619 		FW2_VL_5(funcInfo2.valve_len[4]);
3000  0240 c6007e        	ld	a,_funcInfo2+32
3001  0243 97            	ld	xl,a
3002  0244 a692          	ld	a,#146
3003  0246 95            	ld	xh,a
3004  0247 cd0000        	call	_file_write
3006                     ; 620 		FW2_VL_6(funcInfo2.valve_len[5]);
3008  024a c6007f        	ld	a,_funcInfo2+33
3009  024d 97            	ld	xl,a
3010  024e a693          	ld	a,#147
3011  0250 95            	ld	xh,a
3012  0251 cd0000        	call	_file_write
3014                     ; 621 		FW2_VL_7(funcInfo2.valve_len[6]);
3016  0254 c60080        	ld	a,_funcInfo2+34
3017  0257 97            	ld	xl,a
3018  0258 a694          	ld	a,#148
3019  025a 95            	ld	xh,a
3020  025b cd0000        	call	_file_write
3022                     ; 622 		FW2_VL_8(funcInfo2.valve_len[7]);
3024  025e c60081        	ld	a,_funcInfo2+35
3025  0261 97            	ld	xl,a
3026  0262 a695          	ld	a,#149
3027  0264 95            	ld	xh,a
3028  0265 cd0000        	call	_file_write
3030  0268               L3201:
3031                     ; 625 	_flash_save_count = 0;
3033  0268 725f0002      	clr	__flash_save_count
3034                     ; 627 	systemUart();
3037                     ; 628 }
3040  026c cc0000        	jp	_systemUart
3083                     ; 630 void cnt_ptc_save_flash(uint8_t b0, uint8_t page) {
3084                     .text:	section	.text,new
3085  0000               _cnt_ptc_save_flash:
3087  0000 89            	pushw	x
3088       00000000      OFST:	set	0
3091                     ; 631 	switch (page) {
3093  0001 9f            	ld	a,xl
3095                     ; 732 			break;
3096  0002 4d            	tnz	a
3097  0003 2708          	jreq	L5201
3098  0005 4a            	dec	a
3099  0006 2717          	jreq	L7201
3100  0008 4a            	dec	a
3101  0009 2726          	jreq	L1301
3102  000b 203c          	jra	L3501
3103  000d               L5201:
3104                     ; 632 		case 0:
3104                     ; 633 			if (((b0 & 0x80) >> 7) == 0) {
3106  000d 7b01          	ld	a,(OFST+1,sp)
3107  000f ad3f          	call	LC013
3108  0011 2606          	jrne	L5501
3109                     ; 634 				_flash_save_count |= 0x80;
3111  0013 721e0002      	bset	__flash_save_count,#7
3112                     ; 635 				FLASH_SET_TIMESTAMP
3115  0017 2028          	jp	LC012
3116  0019               L5501:
3117                     ; 671 				_flash_save_count |= 0x40;
3119  0019 721c0002      	bset	__flash_save_count,#6
3120                     ; 672 				FLASH_SET_TIMESTAMP
3122  001d 2022          	jp	LC012
3123  001f               L7201:
3124                     ; 675 		case 1:
3124                     ; 676 			if (((b0 & 0x80) >> 7) == 0) {
3126  001f 7b01          	ld	a,(OFST+1,sp)
3127  0021 ad2d          	call	LC013
3128  0023 2606          	jrne	L1601
3129                     ; 677 				_flash_save_count |= 0x20;
3131  0025 721a0002      	bset	__flash_save_count,#5
3132                     ; 678 				FLASH_SET_TIMESTAMP
3135  0029 2016          	jp	LC012
3136  002b               L1601:
3137                     ; 690 				_flash_save_count |= 0x10;
3139  002b 72180002      	bset	__flash_save_count,#4
3140                     ; 691 				FLASH_SET_TIMESTAMP
3142  002f 2010          	jp	LC012
3143  0031               L1301:
3144                     ; 704 		case 2:
3144                     ; 705 			if (((b0 & 0x80) >> 7) == 0) {
3146  0031 7b01          	ld	a,(OFST+1,sp)
3147  0033 ad1b          	call	LC013
3148  0035 2606          	jrne	L5601
3149                     ; 706 				_flash_save_count |= 0x08;
3151  0037 72160002      	bset	__flash_save_count,#3
3152                     ; 707 				FLASH_SET_TIMESTAMP
3155  003b 2004          	jp	LC012
3156  003d               L5601:
3157                     ; 719 				_flash_save_count |= 0x04;
3159  003d 72140002      	bset	__flash_save_count,#2
3160                     ; 720 				FLASH_SET_TIMESTAMP
3164  0041               LC012:
3170  0041 35010003      	mov	__flash_save_timer,#1
3176  0045 35010001      	mov	__flash_save_enable,#1
3177  0049               L3501:
3178                     ; 736 	copy_funcInfo(page);
3180  0049 7b02          	ld	a,(OFST+2,sp)
3181  004b cd0000        	call	_copy_funcInfo
3183                     ; 737 }
3186  004e 85            	popw	x
3187  004f 81            	ret	
3188  0050               LC013:
3189  0050 49            	rlc	a
3190  0051 4f            	clr	a
3191  0052 49            	rlc	a
3192  0053 5f            	clrw	x
3193  0054 97            	ld	xl,a
3194  0055 5d            	tnzw	x
3195  0056 81            	ret	
3270                     ; 747 void cnt_ptc_check_setting(uint8_t *buf) {
3271                     .text:	section	.text,new
3272  0000               _cnt_ptc_check_setting:
3274  0000 89            	pushw	x
3275  0001 5205          	subw	sp,#5
3276       00000005      OFST:	set	5
3279                     ; 752 	page = buf[0] & 0x0F;
3281  0003 f6            	ld	a,(x)
3282  0004 a40f          	and	a,#15
3283  0006 6b01          	ld	(OFST-4,sp),a
3284                     ; 753 	packet_buf[0] = 0; 
3286  0008 725f0000      	clr	_packet_buf
3287                     ; 755 	switch (page) {
3290                     ; 895 		break;
3291  000c 4d            	tnz	a
3292  000d 270f          	jreq	L1701
3293  000f 4a            	dec	a
3294  0010 2603cc00cc    	jreq	L3701
3295  0015 4a            	dec	a
3296  0016 2603cc0170    	jreq	L5701
3297  001b cc0212        	jra	L3311
3298  001e               L1701:
3299                     ; 756 	case 0:
3299                     ; 757 		mode = buf[6];
3301  001e 1e06          	ldw	x,(OFST+1,sp)
3302  0020 e606          	ld	a,(6,x)
3303  0022 6b02          	ld	(OFST-3,sp),a
3304                     ; 758 		p = (((mode & 0x80) >> 7) == 0) ? &funcInfo : &funcInfo2;
3306  0024 cd0225        	call	LC014
3307  0027 5d            	tnzw	x
3308  0028 2605          	jrne	L253
3309  002a ae0083        	ldw	x,#_funcInfo
3310  002d 2003          	jra	L453
3311  002f               L253:
3312  002f ae005e        	ldw	x,#_funcInfo2
3313  0032               L453:
3314  0032 1f04          	ldw	(OFST-1,sp),x
3315                     ; 759 		p->boiler_type = (buf[1] & 0x80) >> 7;
3317  0034 1e06          	ldw	x,(OFST+1,sp)
3318  0036 e601          	ld	a,(1,x)
3319  0038 49            	rlc	a
3320  0039 4f            	clr	a
3321  003a 1e04          	ldw	x,(OFST-1,sp)
3322  003c 49            	rlc	a
3323  003d e705          	ld	(5,x),a
3324                     ; 760 		p->plc = (buf[1] & 0x70) >> 4;
3326  003f 1e06          	ldw	x,(OFST+1,sp)
3327  0041 e601          	ld	a,(1,x)
3328  0043 4e            	swap	a
3329  0044 1e04          	ldw	x,(OFST-1,sp)
3330  0046 a407          	and	a,#7
3331  0048 e724          	ld	(36,x),a
3332                     ; 761 		p->lpmType = buf[1] & 0x0F;
3334  004a 1e06          	ldw	x,(OFST+1,sp)
3335  004c e601          	ld	a,(1,x)
3336  004e 1e04          	ldw	x,(OFST-1,sp)
3337  0050 a40f          	and	a,#15
3338  0052 e70c          	ld	(12,x),a
3339                     ; 762 		p->relay = (buf[2] & 0x80) >> 7;
3341  0054 1e06          	ldw	x,(OFST+1,sp)
3342  0056 e602          	ld	a,(2,x)
3343  0058 49            	rlc	a
3344  0059 4f            	clr	a
3345  005a 1e04          	ldw	x,(OFST-1,sp)
3346  005c 49            	rlc	a
3347  005d e70a          	ld	(10,x),a
3348                     ; 763 		p->cnt = (buf[2] & 0x70) >> 4;
3350  005f 1e06          	ldw	x,(OFST+1,sp)
3351  0061 e602          	ld	a,(2,x)
3352  0063 4e            	swap	a
3353  0064 1e04          	ldw	x,(OFST-1,sp)
3354  0066 a407          	and	a,#7
3355  0068 e70b          	ld	(11,x),a
3356                     ; 764 		p->valve = buf[2] & 0x0F;
3358  006a 1e06          	ldw	x,(OFST+1,sp)
3359  006c e602          	ld	a,(2,x)
3360  006e 1e04          	ldw	x,(OFST-1,sp)
3361  0070 a40f          	and	a,#15
3362  0072 e70d          	ld	(13,x),a
3363                     ; 767 		if (buf[3] != 0) {														// 2015.11.02 온수 설정 일반 패킷으로 변경
3365  0074 1e06          	ldw	x,(OFST+1,sp)
3366  0076 e603          	ld	a,(3,x)
3367  0078 270e          	jreq	L5311
3368                     ; 768 			if (p->boiler_set_water_shower == 0x00) {
3370  007a 1e04          	ldw	x,(OFST-1,sp)
3371  007c e603          	ld	a,(3,x)
3372  007e 2608          	jrne	L5311
3373                     ; 769 				p->boiler_set_water_shower = buf[3];
3375  0080 1e06          	ldw	x,(OFST+1,sp)
3376  0082 e603          	ld	a,(3,x)
3377  0084 1e04          	ldw	x,(OFST-1,sp)
3378  0086 e703          	ld	(3,x),a
3379  0088               L5311:
3380                     ; 773 		p->houseCapa = buf[4];
3382  0088 1e06          	ldw	x,(OFST+1,sp)
3383  008a e604          	ld	a,(4,x)
3384  008c 1e04          	ldw	x,(OFST-1,sp)
3385  008e e70e          	ld	(14,x),a
3386                     ; 775 		if (buf[5] != 0) {														// 2015.11.02 난방수  설정 일반 패킷으로 변경
3388  0090 1e06          	ldw	x,(OFST+1,sp)
3389  0092 e605          	ld	a,(5,x)
3390  0094 2706          	jreq	L1411
3391                     ; 776 		p->boiler_set_water_heat = buf[5];
3393  0096 1e04          	ldw	x,(OFST-1,sp)
3394  0098 e704          	ld	(4,x),a
3395  009a 1e06          	ldw	x,(OFST+1,sp)
3396  009c               L1411:
3397                     ; 779 		p->subrcLock = (buf[6] & 0x40) >> 6;
3399  009c e606          	ld	a,(6,x)
3400  009e 4e            	swap	a
3401  009f a404          	and	a,#4
3402  00a1 44            	srl	a
3403  00a2 1e04          	ldw	x,(OFST-1,sp)
3404  00a4 44            	srl	a
3405  00a5 e707          	ld	(7,x),a
3406                     ; 780 		p->poType = (buf[6] & 0x30) >> 4;
3408  00a7 1e06          	ldw	x,(OFST+1,sp)
3409  00a9 e606          	ld	a,(6,x)
3410  00ab 4e            	swap	a
3411  00ac 1e04          	ldw	x,(OFST-1,sp)
3412  00ae a403          	and	a,#3
3413  00b0 e70f          	ld	(15,x),a
3414                     ; 781 		p->cntlMode = (buf[6] & 0x08) >> 3;
3416  00b2 1e06          	ldw	x,(OFST+1,sp)
3417  00b4 e606          	ld	a,(6,x)
3418  00b6 a408          	and	a,#8
3419  00b8 44            	srl	a
3420  00b9 44            	srl	a
3421  00ba 1e04          	ldw	x,(OFST-1,sp)
3422  00bc 44            	srl	a
3423  00bd e710          	ld	(16,x),a
3424                     ; 782 		p->opMode = buf[6] & 0x07;
3426  00bf 1e06          	ldw	x,(OFST+1,sp)
3427  00c1 e606          	ld	a,(6,x)
3428  00c3 1e04          	ldw	x,(OFST-1,sp)
3429  00c5 a407          	and	a,#7
3430  00c7 e711          	ld	(17,x),a
3431                     ; 812 		break;
3433  00c9 cc0212        	jra	L3311
3434  00cc               L3701:
3435                     ; 813 	case 1:
3435                     ; 814 		mode = buf[1];
3437  00cc 1e06          	ldw	x,(OFST+1,sp)
3438  00ce e601          	ld	a,(1,x)
3439  00d0 6b02          	ld	(OFST-3,sp),a
3440                     ; 815 		p = (((mode & 0x80) >> 7) == 0) ? &funcInfo : &funcInfo2;
3442  00d2 cd0225        	call	LC014
3443  00d5 5d            	tnzw	x
3444  00d6 2605          	jrne	L653
3445  00d8 ae0083        	ldw	x,#_funcInfo
3446  00db 2003          	jra	L063
3447  00dd               L653:
3448  00dd ae005e        	ldw	x,#_funcInfo2
3449  00e0               L063:
3450  00e0 1f04          	ldw	(OFST-1,sp),x
3451                     ; 816 		p->valve_rc[0] = (buf[1] & 0x70) >> 4;
3453  00e2 1e06          	ldw	x,(OFST+1,sp)
3454  00e4 e601          	ld	a,(1,x)
3455  00e6 4e            	swap	a
3456  00e7 1e04          	ldw	x,(OFST-1,sp)
3457  00e9 a407          	and	a,#7
3458  00eb e714          	ld	(20,x),a
3459                     ; 817 		p->valve_rc[1] = (buf[1] & 0x07);
3461  00ed 1e06          	ldw	x,(OFST+1,sp)
3462  00ef e601          	ld	a,(1,x)
3463  00f1 1e04          	ldw	x,(OFST-1,sp)
3464  00f3 a407          	and	a,#7
3465  00f5 e715          	ld	(21,x),a
3466                     ; 818 		p->valve_rc[2] = (buf[2] & 0x70) >> 4;
3468  00f7 1e06          	ldw	x,(OFST+1,sp)
3469  00f9 e602          	ld	a,(2,x)
3470  00fb 4e            	swap	a
3471  00fc 1e04          	ldw	x,(OFST-1,sp)
3472  00fe a407          	and	a,#7
3473  0100 e716          	ld	(22,x),a
3474                     ; 819 		p->valve_rc[3] = (buf[2] & 0x07);
3476  0102 1e06          	ldw	x,(OFST+1,sp)
3477  0104 e602          	ld	a,(2,x)
3478  0106 1e04          	ldw	x,(OFST-1,sp)
3479  0108 a407          	and	a,#7
3480  010a e717          	ld	(23,x),a
3481                     ; 820 		p->valve_len[0] = buf[3];
3483  010c 1e06          	ldw	x,(OFST+1,sp)
3484  010e e603          	ld	a,(3,x)
3485  0110 1e04          	ldw	x,(OFST-1,sp)
3486  0112 e71c          	ld	(28,x),a
3487                     ; 821 		p->valve_len[1] = buf[4];
3489  0114 1e06          	ldw	x,(OFST+1,sp)
3490  0116 e604          	ld	a,(4,x)
3491  0118 1e04          	ldw	x,(OFST-1,sp)
3492  011a e71d          	ld	(29,x),a
3493                     ; 822 		p->valve_len[2] = buf[5];
3495  011c 1e06          	ldw	x,(OFST+1,sp)
3496  011e e605          	ld	a,(5,x)
3497  0120 1e04          	ldw	x,(OFST-1,sp)
3498  0122 e71e          	ld	(30,x),a
3499                     ; 823 		p->valve_len[3] = buf[6];
3501  0124 1e06          	ldw	x,(OFST+1,sp)
3502  0126 e606          	ld	a,(6,x)
3503  0128 1e04          	ldw	x,(OFST-1,sp)
3504  012a e71f          	ld	(31,x),a
3505                     ; 825 		if (((mode & 0x80) >> 7) == 1) {
3507  012c 7b02          	ld	a,(OFST-3,sp)
3508  012e cd0225        	call	LC014
3509  0131 a30001        	cpw	x,#1
3510  0134 2693          	jrne	L3311
3511                     ; 826 			for (i = 0 ; i < 4 ; i++) {
3513  0136 0f03          	clr	(OFST-2,sp)
3514  0138               L5411:
3515                     ; 827 				if (p->valve_rc[i] == 0 && p->valve_len[i] != 0) {
3517  0138 7b04          	ld	a,(OFST-1,sp)
3518  013a 97            	ld	xl,a
3519  013b 7b05          	ld	a,(OFST+0,sp)
3520  013d 1b03          	add	a,(OFST-2,sp)
3521  013f 2401          	jrnc	L263
3522  0141 5c            	incw	x
3523  0142               L263:
3524  0142 02            	rlwa	x,a
3525  0143 e614          	ld	a,(20,x)
3526  0145 261e          	jrne	L3511
3528  0147 7b04          	ld	a,(OFST-1,sp)
3529  0149 97            	ld	xl,a
3530  014a 7b05          	ld	a,(OFST+0,sp)
3531  014c 1b03          	add	a,(OFST-2,sp)
3532  014e 2401          	jrnc	L463
3533  0150 5c            	incw	x
3534  0151               L463:
3535  0151 02            	rlwa	x,a
3536  0152 e61c          	ld	a,(28,x)
3537  0154 270f          	jreq	L3511
3538                     ; 828 					p->valve_rc[i] = 8;
3540  0156 7b04          	ld	a,(OFST-1,sp)
3541  0158 97            	ld	xl,a
3542  0159 7b05          	ld	a,(OFST+0,sp)
3543  015b 1b03          	add	a,(OFST-2,sp)
3544  015d 2401          	jrnc	L663
3545  015f 5c            	incw	x
3546  0160               L663:
3547  0160 02            	rlwa	x,a
3548  0161 a608          	ld	a,#8
3549  0163 e714          	ld	(20,x),a
3550  0165               L3511:
3551                     ; 826 			for (i = 0 ; i < 4 ; i++) {
3553  0165 0c03          	inc	(OFST-2,sp)
3556  0167 7b03          	ld	a,(OFST-2,sp)
3557  0169 a104          	cp	a,#4
3558  016b 25cb          	jrult	L5411
3559  016d cc0212        	jra	L3311
3560  0170               L5701:
3561                     ; 854 	case 2:
3561                     ; 855 		mode = buf[1];
3563  0170 1e06          	ldw	x,(OFST+1,sp)
3564  0172 e601          	ld	a,(1,x)
3565  0174 6b02          	ld	(OFST-3,sp),a
3566                     ; 856 		p = (((mode & 0x80) >> 7) == 0) ? &funcInfo : &funcInfo2;
3568  0176 cd0225        	call	LC014
3569  0179 5d            	tnzw	x
3570  017a 2605          	jrne	L073
3571  017c ae0083        	ldw	x,#_funcInfo
3572  017f 2003          	jra	L273
3573  0181               L073:
3574  0181 ae005e        	ldw	x,#_funcInfo2
3575  0184               L273:
3576  0184 1f04          	ldw	(OFST-1,sp),x
3577                     ; 857 		p->valve_rc[4] = (buf[1] & 0x70) >> 4;
3579  0186 1e06          	ldw	x,(OFST+1,sp)
3580  0188 e601          	ld	a,(1,x)
3581  018a 4e            	swap	a
3582  018b 1e04          	ldw	x,(OFST-1,sp)
3583  018d a407          	and	a,#7
3584  018f e718          	ld	(24,x),a
3585                     ; 858 		p->valve_rc[5] = (buf[1] & 0x07);
3587  0191 1e06          	ldw	x,(OFST+1,sp)
3588  0193 e601          	ld	a,(1,x)
3589  0195 1e04          	ldw	x,(OFST-1,sp)
3590  0197 a407          	and	a,#7
3591  0199 e719          	ld	(25,x),a
3592                     ; 859 		p->valve_rc[6] = (buf[2] & 0x70) >> 4;
3594  019b 1e06          	ldw	x,(OFST+1,sp)
3595  019d e602          	ld	a,(2,x)
3596  019f 4e            	swap	a
3597  01a0 1e04          	ldw	x,(OFST-1,sp)
3598  01a2 a407          	and	a,#7
3599  01a4 e71a          	ld	(26,x),a
3600                     ; 860 		p->valve_rc[7] = (buf[2] & 0x07);
3602  01a6 1e06          	ldw	x,(OFST+1,sp)
3603  01a8 e602          	ld	a,(2,x)
3604  01aa 1e04          	ldw	x,(OFST-1,sp)
3605  01ac a407          	and	a,#7
3606  01ae e71b          	ld	(27,x),a
3607                     ; 861 		p->valve_len[4] = buf[3];
3609  01b0 1e06          	ldw	x,(OFST+1,sp)
3610  01b2 e603          	ld	a,(3,x)
3611  01b4 1e04          	ldw	x,(OFST-1,sp)
3612  01b6 e720          	ld	(32,x),a
3613                     ; 862 		p->valve_len[5] = buf[4];
3615  01b8 1e06          	ldw	x,(OFST+1,sp)
3616  01ba e604          	ld	a,(4,x)
3617  01bc 1e04          	ldw	x,(OFST-1,sp)
3618  01be e721          	ld	(33,x),a
3619                     ; 863 		p->valve_len[6] = buf[5];
3621  01c0 1e06          	ldw	x,(OFST+1,sp)
3622  01c2 e605          	ld	a,(5,x)
3623  01c4 1e04          	ldw	x,(OFST-1,sp)
3624  01c6 e722          	ld	(34,x),a
3625                     ; 864 		p->valve_len[7] = buf[6];
3627  01c8 1e06          	ldw	x,(OFST+1,sp)
3628  01ca e606          	ld	a,(6,x)
3629  01cc 1e04          	ldw	x,(OFST-1,sp)
3630  01ce e723          	ld	(35,x),a
3631                     ; 866 		if (((mode & 0x80) >> 7) == 1) {
3633  01d0 7b02          	ld	a,(OFST-3,sp)
3634  01d2 ad51          	call	LC014
3635  01d4 a30001        	cpw	x,#1
3636  01d7 2639          	jrne	L3311
3637                     ; 867 			for (i = 4 ; i < 8 ; i++) {
3639  01d9 a604          	ld	a,#4
3640  01db 6b03          	ld	(OFST-2,sp),a
3641  01dd               L7511:
3642                     ; 868 				if (p->valve_rc[i] == 0 && p->valve_len[i] != 0) {
3644  01dd 7b04          	ld	a,(OFST-1,sp)
3645  01df 97            	ld	xl,a
3646  01e0 7b05          	ld	a,(OFST+0,sp)
3647  01e2 1b03          	add	a,(OFST-2,sp)
3648  01e4 2401          	jrnc	L473
3649  01e6 5c            	incw	x
3650  01e7               L473:
3651  01e7 02            	rlwa	x,a
3652  01e8 e614          	ld	a,(20,x)
3653  01ea 261e          	jrne	L5611
3655  01ec 7b04          	ld	a,(OFST-1,sp)
3656  01ee 97            	ld	xl,a
3657  01ef 7b05          	ld	a,(OFST+0,sp)
3658  01f1 1b03          	add	a,(OFST-2,sp)
3659  01f3 2401          	jrnc	L673
3660  01f5 5c            	incw	x
3661  01f6               L673:
3662  01f6 02            	rlwa	x,a
3663  01f7 e61c          	ld	a,(28,x)
3664  01f9 270f          	jreq	L5611
3665                     ; 869 					p->valve_rc[i] = 8;
3667  01fb 7b04          	ld	a,(OFST-1,sp)
3668  01fd 97            	ld	xl,a
3669  01fe 7b05          	ld	a,(OFST+0,sp)
3670  0200 1b03          	add	a,(OFST-2,sp)
3671  0202 2401          	jrnc	L004
3672  0204 5c            	incw	x
3673  0205               L004:
3674  0205 02            	rlwa	x,a
3675  0206 a608          	ld	a,#8
3676  0208 e714          	ld	(20,x),a
3677  020a               L5611:
3678                     ; 867 			for (i = 4 ; i < 8 ; i++) {
3680  020a 0c03          	inc	(OFST-2,sp)
3683  020c 7b03          	ld	a,(OFST-2,sp)
3684  020e a108          	cp	a,#8
3685  0210 25cb          	jrult	L7511
3686  0212               L3311:
3687                     ; 898 	curr_setting_page = page;
3689  0212 7b01          	ld	a,(OFST-4,sp)
3690  0214 c7000e        	ld	_curr_setting_page,a
3691                     ; 899 	cnt_check_state = STATE_SETTING;
3693  0217 3502000f      	mov	_cnt_check_state,#2
3694                     ; 900 	cnt_ptc_save_flash(mode, page );
3696  021b 97            	ld	xl,a
3697  021c 7b02          	ld	a,(OFST-3,sp)
3698  021e 95            	ld	xh,a
3699  021f cd0000        	call	_cnt_ptc_save_flash
3701                     ; 901 }
3704  0222 5b07          	addw	sp,#7
3705  0224 81            	ret	
3706  0225               LC014:
3707  0225 49            	rlc	a
3708  0226 4f            	clr	a
3709  0227 49            	rlc	a
3710  0228 5f            	clrw	x
3711  0229 97            	ld	xl,a
3712  022a 81            	ret	
3750                     ; 903 void cnt_ptc_check_subrc(uint8_t *buf) {
3751                     .text:	section	.text,new
3752  0000               _cnt_ptc_check_subrc:
3756                     ; 904 	packet_buf[0] = 0; 
3758  0000 725f0000      	clr	_packet_buf
3759                     ; 905 	cnt_check_state = STATE_NORMAL;
3761  0004 3501000f      	mov	_cnt_check_state,#1
3762                     ; 906 }
3765  0008 81            	ret	
3827                     ; 908 void cnt_ptc_check_error(uint8_t *buf) {
3828                     .text:	section	.text,new
3829  0000               _cnt_ptc_check_error:
3831  0000 5203          	subw	sp,#3
3832       00000003      OFST:	set	3
3835                     ; 913 	id = buf[0] & 0x0F;
3837  0002 f6            	ld	a,(x)
3838  0003 a40f          	and	a,#15
3839  0005 6b01          	ld	(OFST-2,sp),a
3840                     ; 914 	code = buf[1];
3842  0007 e601          	ld	a,(1,x)
3843  0009 6b02          	ld	(OFST-1,sp),a
3844                     ; 915 	recover = buf[2];
3846  000b e602          	ld	a,(2,x)
3847  000d 6b03          	ld	(OFST+0,sp),a
3848                     ; 916 	packet_buf[id - 1] = 0; 
3850  000f 5f            	clrw	x
3851  0010 7b01          	ld	a,(OFST-2,sp)
3852  0012 97            	ld	xl,a
3853  0013 5a            	decw	x
3854  0014 724f0000      	clr	(_packet_buf,x)
3855                     ; 918 	if (funcInfo.error == 0) {
3857  0018 c6008b        	ld	a,_funcInfo+8
3858  001b 260d          	jrne	L1321
3859                     ; 919 		cnt_check_state = STATE_ERROR;
3861  001d 3508000f      	mov	_cnt_check_state,#8
3862                     ; 920 		func_cnt_error(ERROR_TYPE_RC, code);
3864  0021 7b02          	ld	a,(OFST-1,sp)
3865  0023 97            	ld	xl,a
3866  0024 a603          	ld	a,#3
3867  0026 95            	ld	xh,a
3868  0027 cd0000        	call	_func_cnt_error
3870  002a               L1321:
3871                     ; 923 	if (recover != 0) {
3873  002a 7b03          	ld	a,(OFST+0,sp)
3874  002c 2703          	jreq	L3321
3875                     ; 925 		func_cnt_errorReset();
3877  002e cd0000        	call	_func_cnt_errorReset
3879  0031               L3321:
3880                     ; 927 }
3883  0031 5b03          	addw	sp,#3
3884  0033 81            	ret	
3924                     ; 929 void cnt_ptc_check_mirror(uint8_t *buf) {
3925                     .text:	section	.text,new
3926  0000               _cnt_ptc_check_mirror:
3928       00000000      OFST:	set	0
3931                     ; 930 	packet_buf[0] = 0;
3933  0000 725f0000      	clr	_packet_buf
3934  0004 89            	pushw	x
3935                     ; 932 	if (cnt_check_state != STATE_COMMAND_MIRROR) {
3937  0005 c6000f        	ld	a,_cnt_check_state
3938  0008 a104          	cp	a,#4
3939  000a 2706          	jreq	L3521
3940                     ; 933 		cnt_check_state = STATE_NORMAL;
3942  000c 3501000f      	mov	_cnt_check_state,#1
3943                     ; 934 		return;
3945  0010 201c          	jra	L7521
3946  0012               L3521:
3947                     ; 937 	if ((buf[0] & 0x0F) == curr_mirror_page ) {
3949  0012 1e01          	ldw	x,(OFST+1,sp)
3950  0014 f6            	ld	a,(x)
3951  0015 a40f          	and	a,#15
3952  0017 c1000d        	cp	a,_curr_mirror_page
3953  001a 2608          	jrne	L5521
3954                     ; 938 		cnt_check_state = STATE_COMMAND_MIRROR;
3956  001c 3504000f      	mov	_cnt_check_state,#4
3957                     ; 939 		curr_mirror_page++;
3959  0020 725c000d      	inc	_curr_mirror_page
3960  0024               L5521:
3961                     ; 942 	if (curr_mirror_page > MAX_MIRROR_PAGE) {
3963  0024 c6000d        	ld	a,_curr_mirror_page
3964  0027 a103          	cp	a,#3
3965  0029 2503          	jrult	L7521
3966                     ; 943 		func_cnt_endMirror();
3968  002b cd0000        	call	_func_cnt_endMirror
3970  002e               L7521:
3971                     ; 945 }
3974  002e 85            	popw	x
3975  002f 81            	ret	
3978                     	switch	.data
3979  0004               __sub_cnt_ready:
3980  0004 00            	dc.b	0
4027                     ; 949 void cnt_ptc_check_subcnt(uint8_t *buf) {
4028                     .text:	section	.text,new
4029  0000               _cnt_ptc_check_subcnt:
4031  0000 89            	pushw	x
4032  0001 88            	push	a
4033       00000001      OFST:	set	1
4036                     ; 953 	num = buf[0] & 0x0F;
4038  0002 f6            	ld	a,(x)
4039  0003 a40f          	and	a,#15
4040  0005 6b01          	ld	(OFST+0,sp),a
4041                     ; 955 	cnt_check_state = STATE_NORMAL;
4043  0007 3501000f      	mov	_cnt_check_state,#1
4044                     ; 957 	if (num != 0x09) {
4046  000b a109          	cp	a,#9
4047  000d 2625          	jrne	L3031
4048                     ; 958 		return;
4050                     ; 965 	_ioMaster[1] = 0;
4052  000f 725f0001      	clr	__ioMaster+1
4053                     ; 966 	ext_sub_ready = 1;
4055  0013 35010000      	mov	_ext_sub_ready,#1
4056                     ; 968 	_sub_cnt_ready = 1;
4058  0017 35010004      	mov	__sub_cnt_ready,#1
4059                     ; 969 	funcInfo.sub_rcLED = buf[1];
4061  001b 1e02          	ldw	x,(OFST+1,sp)
4062  001d e601          	ld	a,(1,x)
4063  001f c70096        	ld	_funcInfo+19,a
4064                     ; 971 	if (buf[2] != 0x00 && buf[3] != 0x00) {
4066  0022 e602          	ld	a,(2,x)
4067  0024 270e          	jreq	L3031
4069  0026 e603          	ld	a,(3,x)
4070  0028 270a          	jreq	L3031
4071                     ; 972 		func_cnt_error(buf[2], buf[3]);
4073  002a 1602          	ldw	y,(OFST+1,sp)
4074  002c 97            	ld	xl,a
4075  002d 90e602        	ld	a,(2,y)
4076  0030 95            	ld	xh,a
4077  0031 cd0000        	call	_func_cnt_error
4079  0034               L3031:
4080                     ; 974 }
4083  0034 5b03          	addw	sp,#3
4084  0036 81            	ret	
4121                     ; 977 void cnt_ptc_make_cnt(uint8_t *buf) {
4122                     .text:	section	.text,new
4123  0000               _cnt_ptc_make_cnt:
4127                     ; 978 		buf[0] = BYTE_START_SUB_CNT_NORMAL | 0x09;
4129  0000 a699          	ld	a,#153
4130  0002 f7            	ld	(x),a
4131                     ; 979 		buf[1] = funcInfo.rcLED;
4133  0003 c60095        	ld	a,_funcInfo+18
4134  0006 e701          	ld	(1,x),a
4135                     ; 980 		buf[2] = funcInfo.error_type;
4137  0008 c6008c        	ld	a,_funcInfo+9
4138  000b e702          	ld	(2,x),a
4139                     ; 981 		buf[3] = funcInfo.error;
4141  000d c6008b        	ld	a,_funcInfo+8
4142  0010 e703          	ld	(3,x),a
4143                     ; 982 		buf[4] = 0x00;
4145  0012 6f04          	clr	(4,x)
4146                     ; 983 		buf[5] = 0x00;
4148  0014 6f05          	clr	(5,x)
4149                     ; 984 		buf[6] = 0x00;
4151  0016 6f06          	clr	(6,x)
4152                     ; 986 		makeChecksum(buf);
4155                     ; 987 }
4158  0018 cc0000        	jp	_makeChecksum
4223                     ; 990 void cnt_ptc_check_cnt(uint8_t *buf) {
4224                     .text:	section	.text,new
4225  0000               _cnt_ptc_check_cnt:
4227  0000 89            	pushw	x
4228  0001 89            	pushw	x
4229       00000002      OFST:	set	2
4232                     ; 995 	num = buf[0] & 0x0F;
4234  0002 f6            	ld	a,(x)
4235  0003 a40f          	and	a,#15
4236  0005 6b01          	ld	(OFST-1,sp),a
4237                     ; 997 	if (num != 0x09) {
4239  0007 a109          	cp	a,#9
4240  0009 2703cc0091    	jrne	L274
4241                     ; 998 		return;
4243                     ; 1001 	ptc_sub_control = buf[5];
4245  000e 1e03          	ldw	x,(OFST+1,sp)
4246  0010 e605          	ld	a,(5,x)
4247  0012 c70000        	ld	_ptc_sub_control,a
4248                     ; 1003 	if (ptc_sub_control == 1) {
4250  0015 4a            	dec	a
4251  0016 266b          	jrne	L1531
4252                     ; 1004 		for (i = 0 ; i < 8 ; i++) {
4254  0018 6b02          	ld	(OFST+0,sp),a
4255  001a               L3531:
4256                     ; 1005 			packet_buf[i] = 0;
4258  001a 5f            	clrw	x
4259  001b 97            	ld	xl,a
4260  001c 724f0000      	clr	(_packet_buf,x)
4261                     ; 1006 			isOp = getHexToBin(buf[6], i);
4263  0020 1603          	ldw	y,(OFST+1,sp)
4264  0022 97            	ld	xl,a
4265  0023 90e606        	ld	a,(6,y)
4266  0026 95            	ld	xh,a
4267  0027 cd0000        	call	_getHexToBin
4269  002a 6b01          	ld	(OFST-1,sp),a
4270                     ; 1007 			func_cnt_calcInfo(i + 1, 
4270                     ; 1008 											((isOp == 1) ? MODE_HOT : MODE_STOP), 
4270                     ; 1009 											0x30, 
4270                     ; 1010 											((isOp == 1) ? 0x40 : 0x10));
4272  002c 4a            	dec	a
4273  002d 2604          	jrne	L244
4274  002f a640          	ld	a,#64
4275  0031 2002          	jra	L444
4276  0033               L244:
4277  0033 a610          	ld	a,#16
4278  0035               L444:
4279  0035 88            	push	a
4280  0036 4b30          	push	#48
4281  0038 7b03          	ld	a,(OFST+1,sp)
4282  003a 4a            	dec	a
4283  003b 2603          	jrne	L644
4284  003d 4c            	inc	a
4285  003e 2002          	jra	L054
4286  0040               L644:
4287  0040 a604          	ld	a,#4
4288  0042               L054:
4289  0042 97            	ld	xl,a
4290  0043 7b04          	ld	a,(OFST+2,sp)
4291  0045 4c            	inc	a
4292  0046 95            	ld	xh,a
4293  0047 cd0000        	call	_func_cnt_calcInfo
4295  004a 85            	popw	x
4296                     ; 1012 			rcInfo.mode[i] = (isOp == 1) ? MODE_HOT : MODE_STOP;
4298  004b 7b02          	ld	a,(OFST+0,sp)
4299  004d 5f            	clrw	x
4300  004e 97            	ld	xl,a
4301  004f 89            	pushw	x
4302  0050 7b03          	ld	a,(OFST+1,sp)
4303  0052 4a            	dec	a
4304  0053 2603          	jrne	L254
4305  0055 4c            	inc	a
4306  0056 2002          	jra	L454
4307  0058               L254:
4308  0058 a604          	ld	a,#4
4309  005a               L454:
4310  005a 85            	popw	x
4311  005b d7004e        	ld	(_rcInfo+16,x),a
4312                     ; 1013 			rcInfo.curr_temp[i] = 0x30;
4314  005e 5f            	clrw	x
4315  005f 7b02          	ld	a,(OFST+0,sp)
4316  0061 97            	ld	xl,a
4317  0062 a630          	ld	a,#48
4318  0064 d7003e        	ld	(_rcInfo,x),a
4319                     ; 1014 			rcInfo.setup_temp[i] = ((isOp == 1) ? 0x40 : 0x10);
4321  0067 5f            	clrw	x
4322  0068 7b02          	ld	a,(OFST+0,sp)
4323  006a 97            	ld	xl,a
4324  006b 89            	pushw	x
4325  006c 7b03          	ld	a,(OFST+1,sp)
4326  006e 4a            	dec	a
4327  006f 2604          	jrne	L654
4328  0071 a640          	ld	a,#64
4329  0073 2002          	jra	L064
4330  0075               L654:
4331  0075 a610          	ld	a,#16
4332  0077               L064:
4333  0077 85            	popw	x
4334  0078 d70046        	ld	(_rcInfo+8,x),a
4335                     ; 1004 		for (i = 0 ; i < 8 ; i++) {
4337  007b 0c02          	inc	(OFST+0,sp)
4340  007d 7b02          	ld	a,(OFST+0,sp)
4341  007f a108          	cp	a,#8
4342  0081 2597          	jrult	L3531
4343  0083               L1531:
4344                     ; 1018 	cnt_ptc_make_cnt(iouart_getBuffer());
4346  0083 cd0000        	call	_iouart_getBuffer
4348  0086 cd0000        	call	_cnt_ptc_make_cnt
4350                     ; 1019 	iouart_Set_Packet(60);
4352  0089 a63c          	ld	a,#60
4353  008b cd0000        	call	_iouart_Set_Packet
4355                     ; 1020 	iouart_Pkt_Start();
4357  008e cd0000        	call	_iouart_Pkt_Start
4359                     ; 1021 }
4360  0091               L274:
4363  0091 5b04          	addw	sp,#4
4364  0093 81            	ret	
4413                     ; 1023 void cnt_ptc_check(uint8_t *buf) {
4414                     .text:	section	.text,new
4415  0000               _cnt_ptc_check:
4417  0000 89            	pushw	x
4418  0001 88            	push	a
4419       00000001      OFST:	set	1
4422                     ; 1026 	start = buf[0] & 0xF0;
4424  0002 f6            	ld	a,(x)
4425  0003 a4f0          	and	a,#240
4426  0005 6b01          	ld	(OFST+0,sp),a
4427                     ; 1027 	switch (start) {
4430                     ; 1048 		default:
4430                     ; 1049 		break;
4431  0007 a040          	sub	a,#64
4432  0009 2737          	jreq	L1731
4433  000b a010          	sub	a,#16
4434  000d 2717          	jreq	L3631
4435  000f a010          	sub	a,#16
4436  0011 271a          	jreq	L5631
4437  0013 a030          	sub	a,#48
4438  0015 2732          	jreq	L3731
4439  0017 a050          	sub	a,#80
4440  0019 2719          	jreq	L7631
4441  001b a010          	sub	a,#16
4442  001d 262f          	jrne	L1241
4443                     ; 1028 		case BYTE_START_RC_NORMAL:
4443                     ; 1029 			cnt_ptc_check_normal(buf);
4445  001f 1e02          	ldw	x,(OFST+1,sp)
4446  0021 cd0000        	call	_cnt_ptc_check_normal
4448                     ; 1030 			break;
4450  0024 2028          	jra	L1241
4451  0026               L3631:
4452                     ; 1031 		case BYTE_START_RC_SETTING:
4452                     ; 1032 			cnt_ptc_check_setting(buf);
4454  0026 1e02          	ldw	x,(OFST+1,sp)
4455  0028 cd0000        	call	_cnt_ptc_check_setting
4457                     ; 1033 			break;
4459  002b 2021          	jra	L1241
4460  002d               L5631:
4461                     ; 1034 		case BYTE_START_RC_SUBRC:
4461                     ; 1035 			cnt_ptc_check_subrc(buf);
4463  002d 1e02          	ldw	x,(OFST+1,sp)
4464  002f cd0000        	call	_cnt_ptc_check_subrc
4466                     ; 1036 			break;
4468  0032 201a          	jra	L1241
4469  0034               L7631:
4470                     ; 1037 		case BYTE_START_RC_ERROR:
4470                     ; 1038 			if (cnt_check_state != STATE_ERROR_RECOVER) {
4472  0034 c6000f        	ld	a,_cnt_check_state
4473  0037 a109          	cp	a,#9
4474  0039 2713          	jreq	L1241
4475                     ; 1039 				cnt_ptc_check_error(buf);
4477  003b 1e02          	ldw	x,(OFST+1,sp)
4478  003d cd0000        	call	_cnt_ptc_check_error
4480  0040 200c          	jra	L1241
4481  0042               L1731:
4482                     ; 1042 		case BYTE_START_RC_MIRROR:
4482                     ; 1043 			cnt_ptc_check_mirror(buf);
4484  0042 1e02          	ldw	x,(OFST+1,sp)
4485  0044 cd0000        	call	_cnt_ptc_check_mirror
4487                     ; 1044 			break;
4489  0047 2005          	jra	L1241
4490  0049               L3731:
4491                     ; 1045 		case BYTE_START_SUB_CNT_NORMAL:
4491                     ; 1046 			cnt_ptc_check_subcnt(buf);
4493  0049 1e02          	ldw	x,(OFST+1,sp)
4494  004b cd0000        	call	_cnt_ptc_check_subcnt
4496                     ; 1047 			break;
4498                     ; 1048 		default:
4498                     ; 1049 		break;
4500  004e               L1241:
4501                     ; 1051 }
4504  004e 5b03          	addw	sp,#3
4505  0050 81            	ret	
4552                     ; 1053 void	sub_cnt_ptc_check(uint8_t *buf)
4552                     ; 1054 {
4553                     .text:	section	.text,new
4554  0000               _sub_cnt_ptc_check:
4556  0000 89            	pushw	x
4557  0001 88            	push	a
4558       00000001      OFST:	set	1
4561                     ; 1057 	start = buf[0] & 0xF0;
4563  0002 f6            	ld	a,(x)
4564  0003 a4f0          	and	a,#240
4565  0005 6b01          	ld	(OFST+0,sp),a
4566                     ; 1058 	switch (start) {
4569                     ; 1073 		default:
4569                     ; 1074 		break;
4570  0007 a050          	sub	a,#80
4571  0009 2713          	jreq	L7241
4572  000b a020          	sub	a,#32
4573  000d 2724          	jreq	L3341
4574  000f a070          	sub	a,#112
4575  0011 2712          	jreq	L1341
4576  0013 a010          	sub	a,#16
4577  0015 2621          	jrne	L1641
4578                     ; 1059 		case BYTE_START_RC_NORMAL:
4578                     ; 1060 			cnt_ptc_check_normal(buf);
4580  0017 1e02          	ldw	x,(OFST+1,sp)
4581  0019 cd0000        	call	_cnt_ptc_check_normal
4583                     ; 1061 			break;
4585  001c 201a          	jra	L1641
4586  001e               L7241:
4587                     ; 1062 		case BYTE_START_RC_SETTING:
4587                     ; 1063 			cnt_ptc_check_setting(buf);
4589  001e 1e02          	ldw	x,(OFST+1,sp)
4590  0020 cd0000        	call	_cnt_ptc_check_setting
4592                     ; 1064 			break;
4594  0023 2013          	jra	L1641
4595  0025               L1341:
4596                     ; 1065 		case BYTE_START_RC_ERROR:
4596                     ; 1066 			if (cnt_check_state != STATE_ERROR_RECOVER) {
4598  0025 c6000f        	ld	a,_cnt_check_state
4599  0028 a109          	cp	a,#9
4600  002a 270c          	jreq	L1641
4601                     ; 1067 				cnt_ptc_check_error(buf);
4603  002c 1e02          	ldw	x,(OFST+1,sp)
4604  002e cd0000        	call	_cnt_ptc_check_error
4606  0031 2005          	jra	L1641
4607  0033               L3341:
4608                     ; 1070 		case BYTE_START_CNT_NORMAL:
4608                     ; 1071 			cnt_ptc_check_cnt(buf);
4610  0033 1e02          	ldw	x,(OFST+1,sp)
4611  0035 cd0000        	call	_cnt_ptc_check_cnt
4613                     ; 1072 			break;
4615                     ; 1073 		default:
4615                     ; 1074 		break;
4617  0038               L1641:
4618                     ; 1076 }
4621  0038 5b03          	addw	sp,#3
4622  003a 81            	ret	
4886                     	xdef	_sub_cnt_ptc_check
4887                     	xdef	_cnt_ptc_check_cnt
4888                     	xdef	_cnt_ptc_make_cnt
4889                     	xdef	_cnt_ptc_check_subcnt
4890                     	xdef	__sub_cnt_ready
4891                     	xdef	_cnt_ptc_check_mirror
4892                     	xdef	_cnt_ptc_check_error
4893                     	xdef	_cnt_ptc_check_subrc
4894                     	xdef	_cnt_ptc_check_setting
4895                     	xref	_ext_sub_ready
4896                     	xref	__ioMaster
4897                     	xdef	_cnt_ptc_save_flash
4898                     	xdef	__flash_saveCb
4899                     	xdef	__flash_save_timer
4900                     	xdef	__flash_save_count
4901                     	xdef	__flash_save_enable
4902                     	xdef	_copy_funcInfo
4903                     	xdef	_cnt_ptc_check_normal
4904                     	xdef	_cnt_ptc_check_shower
4905                     	xdef	_cnt_ptc_check_homenet
4906                     	xdef	_cnt_ptc_check_normal_command
4907                     	xdef	_cnt_ptc_make_normal
4908                     	xdef	_cnt_getErrorCount
4909                     	xdef	_cnt_ptc_make_mirror_sub
4910                     	xdef	_cnt_ptc_make_mirror
4911                     	xdef	_cnt_ptc_make_setting
4912                     	xdef	_makeChecksum
4913                     	xref	_packet_buf
4914                     	switch	.bss
4915  0000               __is_shower:
4916  0000 00            	ds.b	1
4917                     	xdef	__is_shower
4918  0001               ___mode_shower:
4919  0001 000000000000  	ds.b	8
4920                     	xdef	___mode_shower
4921  0009               _msg_hn_more:
4922  0009 00            	ds.b	1
4923                     	xdef	_msg_hn_more
4924  000a               _msg_hn:
4925  000a 00            	ds.b	1
4926                     	xdef	_msg_hn
4927                     	xdef	_ptc_sub_control
4928  000b               _mirror_type:
4929  000b 00            	ds.b	1
4930                     	xdef	_mirror_type
4931  000c               _curr_subCnt_page:
4932  000c 00            	ds.b	1
4933                     	xdef	_curr_subCnt_page
4934  000d               _curr_mirror_page:
4935  000d 00            	ds.b	1
4936                     	xdef	_curr_mirror_page
4937  000e               _curr_setting_page:
4938  000e 00            	ds.b	1
4939                     	xdef	_curr_setting_page
4940  000f               _cnt_check_state:
4941  000f 00            	ds.b	1
4942                     	xdef	_cnt_check_state
4943  0010               _cnt_ptc_id_count:
4944  0010 00            	ds.b	1
4945                     	xdef	_cnt_ptc_id_count
4946                     	xref	_getHexToBin
4947                     	xref	_hn_buf_error
4948                     	xref	_hn_error_checksum
4949                     	xref	_hn_type
4950                     	xref	_br_buf_error
4951                     	xref	_br_error_checksum
4952                     	xref	_br_type
4953                     	xref	_cntGetType
4954                     	xref	_func_cnt_error
4955                     	xref	_func_cnt_errorReset
4956                     	xref	_func_cnt_reset
4957                     	xref	_func_cnt_hotwater
4958                     	xref	_func_cnt_endMirror
4959                     	xref	_func_cnt_mirror
4960                     	xref	_func_cnt_factory
4961                     	xref	_func_cnt_calcInfo
4962  0011               _hnCnts:
4963  0011 000000000000  	ds.b	40
4964                     	xdef	_hnCnts
4965  0039               _hnCnt:
4966  0039 0000000000    	ds.b	5
4967                     	xdef	_hnCnt
4968  003e               _rcInfo:
4969  003e 000000000000  	ds.b	32
4970                     	xdef	_rcInfo
4971  005e               _funcInfo2:
4972  005e 000000000000  	ds.b	37
4973                     	xdef	_funcInfo2
4974  0083               _funcInfo:
4975  0083 000000000000  	ds.b	37
4976                     	xdef	_funcInfo
4977                     	xref	_vtbl
4978                     	xdef	_cnt_ptc_getCheckState
4979                     	xdef	_cnt_ptc_check
4980                     	xdef	_cnt_ptc_make
4981                     	xdef	_cnt_ptc_baseSet
4982                     	xref	_file_write
4983                     	xref	_systemUart
4984                     	xref	_iouart_getBuffer
4985                     	xref	_iouart_Pkt_Start
4986                     	xref	_iouart_Set_Packet
4987                     	xref	_UART3_DeInit
4988                     	xref	_UART1_DeInit
4989                     	xref.b	c_x
5009                     	end
