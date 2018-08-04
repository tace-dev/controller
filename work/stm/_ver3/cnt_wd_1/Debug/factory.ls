   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               __fs:
  25  0000 00            	dc.b	0
  26  0001               __fs2:
  27  0001 00            	dc.b	0
  84                     ; 83 void	factory2wire(void)
  84                     ; 84 {
  86                     .text:	section	.text,new
  87  0000               _factory2wire:
  89  0000 5203          	subw	sp,#3
  90       00000003      OFST:	set	3
  93                     ; 87 	if( _io_head != _io_tail )
  95  0002 c60000        	ld	a,__io_head
  96  0005 c10000        	cp	a,__io_tail
  97  0008 272c          	jreq	L53
  98                     ; 89 		i = iouart_Ready();
 100  000a cd0000        	call	_iouart_Ready
 102  000d 6b01          	ld	(OFST-2,sp),a
 103                     ; 90 		if( i==1 )
 105  000f 4a            	dec	a
 106  0010 2624          	jrne	L53
 107                     ; 92 			p = iouart_getBuffer();
 109  0012 cd0000        	call	_iouart_getBuffer
 111  0015 1f02          	ldw	(OFST-1,sp),x
 112                     ; 93 			p[0] = 0x0;
 114  0017 7f            	clr	(x)
 115                     ; 94 			p[1] = 0x1;
 117  0018 a601          	ld	a,#1
 118  001a e701          	ld	(1,x),a
 119                     ; 95 			p[2] = 0x2;
 121  001c 4c            	inc	a
 122  001d e702          	ld	(2,x),a
 123                     ; 96 			p[3] = 0x3;
 125  001f 4c            	inc	a
 126  0020 e703          	ld	(3,x),a
 127                     ; 97 			p[4] = 0x4;
 129  0022 4c            	inc	a
 130  0023 e704          	ld	(4,x),a
 131                     ; 98 			p[5] = 0x5;
 133  0025 4c            	inc	a
 134  0026 e705          	ld	(5,x),a
 135                     ; 99 			p[6] = 0x6;
 137  0028 4c            	inc	a
 138  0029 e706          	ld	(6,x),a
 139                     ; 100 			p[7] = 0x15;
 141  002b a615          	ld	a,#21
 142  002d e707          	ld	(7,x),a
 143                     ; 101 			iouart_Set_Packet(0);
 145  002f 4f            	clr	a
 146  0030 cd0000        	call	_iouart_Set_Packet
 148                     ; 102 			iouart_Pkt_Start();
 150  0033 cd0000        	call	_iouart_Pkt_Start
 152  0036               L53:
 153                     ; 133 		if( _io9d_head != 0 )
 155  0036 c60000        	ld	a,__io9d_head
 156  0039 2720          	jreq	L73
 157                     ; 135 			i++;
 159  003b 0c01          	inc	(OFST-2,sp)
 160                     ; 137 			_io9d_head = 0;
 162  003d 725f0000      	clr	__io9d_head
 163                     ; 139 				__ff[0] = __timer1s;
 165  0041 5500000000    	mov	___ff,___timer1s
 166                     ; 140 				__ff[1]++;
 168  0046 725c0001      	inc	___ff+1
 169                     ; 141 				if( __ff[1] >= 10 )
 171  004a c60001        	ld	a,___ff+1
 172  004d a10a          	cp	a,#10
 173  004f 25e5          	jrult	L53
 174                     ; 143 					__ff[1] = 0;
 176  0051 725f0001      	clr	___ff+1
 177                     ; 144 					D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);
 179  0055 90125000      	bcpl	20480,#1
 180  0059 20db          	jra	L53
 181  005b               L73:
 182                     ; 153 }
 185  005b 5b03          	addw	sp,#3
 186  005d 81            	ret	
 189                     	switch	.data
 190  0002               __fa:
 191  0002 00            	dc.b	0
 192  0003               __fb:
 193  0003 00            	dc.b	0
 194  0004               __fc:
 195  0004 00            	dc.b	0
 218                     ; 175 void	__func(void)
 218                     ; 176 {
 219                     .text:	section	.text,new
 220  0000               ___func:
 224                     ; 177 	_fs = 2;
 226  0000 35020000      	mov	__fs,#2
 227                     ; 178 	_fc = 10;
 229  0004 350a0004      	mov	__fc,#10
 230                     ; 179 }
 233  0008 81            	ret	
 257                     ; 181 void	__func1(void)
 257                     ; 182 {
 258                     .text:	section	.text,new
 259  0000               ___func1:
 263                     ; 183 	_fs = 1;
 265  0000 35010000      	mov	__fs,#1
 266                     ; 184 }
 269  0004 81            	ret	
 292                     ; 186 void	factoryMtOff(void)
 292                     ; 187 {
 293                     .text:	section	.text,new
 294  0000               _factoryMtOff:
 298                     ; 188 	D_IO_LOW(IO_M1, IO_M1p);
 300  0000 7213501e      	bres	20510,#1
 301                     ; 189 	D_IO_LOW(IO_M2, IO_M2p);
 303  0004 7211501e      	bres	20510,#0
 304                     ; 190 	D_IO_LOW(IO_M3, IO_M3p);
 306  0008 721f500a      	bres	20490,#7
 307                     ; 191 	D_IO_LOW(IO_M4, IO_M4p);
 309  000c 721d500a      	bres	20490,#6
 310                     ; 192 	D_IO_LOW(IO_M5, IO_M5p);
 312  0010 721b500a      	bres	20490,#5
 313                     ; 193 	D_IO_LOW(IO_M6, IO_M6p);
 315  0014 7219500a      	bres	20490,#4
 316                     ; 194 	D_IO_LOW(IO_M7, IO_M7p);
 318  0018 7217500a      	bres	20490,#3
 319                     ; 195 	D_IO_LOW(IO_M8, IO_M8p);
 321  001c 721b5014      	bres	20500,#5
 322                     ; 197 	D_IO_LOW(IO_MV, IO_V1p);
 324  0020 72175014      	bres	20500,#3
 325                     ; 198 	D_IO_LOW(IO_MV, IO_V2p);
 327  0024 72155014      	bres	20500,#2
 328                     ; 199 	D_IO_LOW(IO_MV, IO_V3p);
 330  0028 72135014      	bres	20500,#1
 331                     ; 200 	D_IO_LOW(IO_MV, IO_V4p);
 333  002c 72115014      	bres	20500,#0
 334                     ; 201 }
 337  0030 81            	ret	
 360                     ; 203 void	factoryMtOn(void)
 360                     ; 204 {
 361                     .text:	section	.text,new
 362  0000               _factoryMtOn:
 366                     ; 205 	D_IO_HIGH(IO_M1, IO_M1p);
 368  0000 7212501e      	bset	20510,#1
 369                     ; 206 	D_IO_HIGH(IO_M2, IO_M2p);
 371  0004 7210501e      	bset	20510,#0
 372                     ; 207 	D_IO_HIGH(IO_M3, IO_M3p);
 374  0008 721e500a      	bset	20490,#7
 375                     ; 208 	D_IO_HIGH(IO_M4, IO_M4p);
 377  000c 721c500a      	bset	20490,#6
 378                     ; 209 	D_IO_HIGH(IO_M5, IO_M5p);
 380  0010 721a500a      	bset	20490,#5
 381                     ; 210 	D_IO_HIGH(IO_M6, IO_M6p);
 383  0014 7218500a      	bset	20490,#4
 384                     ; 211 	D_IO_HIGH(IO_M7, IO_M7p);
 386  0018 7216500a      	bset	20490,#3
 387                     ; 212 	D_IO_HIGH(IO_M8, IO_M8p);
 389  001c 721a5014      	bset	20500,#5
 390                     ; 214 	D_IO_LOW(IO_MV, IO_V1p);
 392  0020 72175014      	bres	20500,#3
 393                     ; 215 	D_IO_LOW(IO_MV, IO_V2p);
 395  0024 72155014      	bres	20500,#2
 396                     ; 216 	D_IO_LOW(IO_MV, IO_V3p);
 398  0028 72135014      	bres	20500,#1
 399                     ; 217 	D_IO_LOW(IO_MV, IO_V4p);
 401  002c 72115014      	bres	20500,#0
 402                     ; 218 }
 405  0030 81            	ret	
 428                     ; 220 void	factoryMtSetLow(void)
 428                     ; 221 {
 429                     .text:	section	.text,new
 430  0000               _factoryMtSetLow:
 434                     ; 222 	D_IO_HIGH(IO_M1, IO_M1p);
 436  0000 7212501e      	bset	20510,#1
 437                     ; 223 	D_IO_HIGH(IO_M2, IO_M2p);
 439  0004 7210501e      	bset	20510,#0
 440                     ; 224 	D_IO_HIGH(IO_M3, IO_M3p);
 442  0008 721e500a      	bset	20490,#7
 443                     ; 225 	D_IO_HIGH(IO_M4, IO_M4p);
 445  000c 721c500a      	bset	20490,#6
 446                     ; 226 }
 449  0010 81            	ret	
 472                     ; 228 void	factoryMtSetHigh(void)
 472                     ; 229 {
 473                     .text:	section	.text,new
 474  0000               _factoryMtSetHigh:
 478                     ; 230 	D_IO_HIGH(IO_M5, IO_M5p);
 480  0000 721a500a      	bset	20490,#5
 481                     ; 231 	D_IO_HIGH(IO_M6, IO_M6p);
 483  0004 7218500a      	bset	20490,#4
 484                     ; 232 	D_IO_HIGH(IO_M7, IO_M7p);
 486  0008 7216500a      	bset	20490,#3
 487                     ; 233 	D_IO_HIGH(IO_M8, IO_M8p);
 489  000c 721a5014      	bset	20500,#5
 490                     ; 234 }
 493  0010 81            	ret	
 496                     	switch	.data
 497  0005               __mi:
 498  0005 00            	dc.b	0
 499  0006               __aa:
 500  0006 00            	dc.b	0
 501  0007               __bb:
 502  0007 00            	dc.b	0
 582                     ; 239 void	factoryCntl(void)
 582                     ; 240 {
 583                     .text:	section	.text,new
 584  0000               _factoryCntl:
 586  0000 5203          	subw	sp,#3
 587       00000003      OFST:	set	3
 590                     ; 247 	if( _fs == 0 )
 592  0002 c60000        	ld	a,__fs
 593  0005 260f          	jrne	L351
 594                     ; 249 		_fs = 1;
 596  0007 35010000      	mov	__fs,#1
 597                     ; 250 		mt_clear(0);
 599  000b cd0000        	call	_mt_clear
 601                     ; 251 		__f[0] = __timer1s;
 603  000e 5500000002    	mov	___f,___timer1s
 605  0013 cc01c9        	jra	L551
 606  0016               L351:
 607                     ; 253 	else if( _fs == 4 )
 609  0016 a104          	cp	a,#4
 610                     ; 255 		i = 0;
 613  0018 27f9          	jreq	L551
 614                     ; 257 	else if( _fs == 1 )
 616  001a a101          	cp	a,#1
 617  001c 2703cc011a    	jrne	L361
 618                     ; 259 		if( __f[0] != (__timer100ms/2) )//&& __f[3] != 0 )
 620  0021 c60000        	ld	a,___timer100ms
 621  0024 5f            	clrw	x
 622  0025 97            	ld	xl,a
 623  0026 57            	sraw	x
 624  0027 c60002        	ld	a,___f
 625  002a 905f          	clrw	y
 626  002c 9097          	ld	yl,a
 627  002e 90bf00        	ldw	c_y,y
 628  0031 b300          	cpw	x,c_y
 629  0033 2603cc00c0    	jreq	L561
 630                     ; 261 			__f[0] = __timer100ms/2;
 632  0038 c60000        	ld	a,___timer100ms
 633  003b 5f            	clrw	x
 634  003c 97            	ld	xl,a
 635  003d 57            	sraw	x
 636  003e 01            	rrwa	x,a
 637  003f c70002        	ld	___f,a
 638                     ; 264 				_mi++;
 640  0042 725c0005      	inc	__mi
 641                     ; 265 				if( _mi == 33 )
 643  0046 c60005        	ld	a,__mi
 644  0049 a121          	cp	a,#33
 645  004b 2604          	jrne	L761
 646                     ; 266 					_mi = 1;
 648  004d 35010005      	mov	__mi,#1
 649  0051               L761:
 650                     ; 269 				_fa++;
 652  0051 725c0002      	inc	__fa
 653                     ; 271 				factoryMtOff();
 655  0055 cd0000        	call	_factoryMtOff
 657                     ; 273 				i = _fa % /*8*/4;
 659                     ; 274 j = i;
 661                     ; 275 _aa++;
 663  0058 725c0006      	inc	__aa
 664                     ; 276 a = _aa%8;
 666  005c c60006        	ld	a,__aa
 667  005f a407          	and	a,#7
 668  0061 6b03          	ld	(OFST+0,sp),a
 669                     ; 277 b = _aa%4;
 671  0063 c60006        	ld	a,__aa
 672  0066 a403          	and	a,#3
 673                     ; 279 D_IO_HIGH(IO_MV, IO_V1p);	
 675  0068 72165014      	bset	20500,#3
 676                     ; 280 D_IO_HIGH(IO_MV, IO_V2p);	
 678  006c 72145014      	bset	20500,#2
 679                     ; 281 D_IO_HIGH(IO_MV, IO_V3p);	
 681  0070 72125014      	bset	20500,#1
 682                     ; 282 D_IO_HIGH(IO_MV, IO_V4p);	
 684  0074 72105014      	bset	20500,#0
 685                     ; 284 if( a == 0 ){	D_IO_HIGH(IO_M1, IO_M1p);}
 687  0078 7b03          	ld	a,(OFST+0,sp)
 688  007a 2604          	jrne	L171
 691  007c 7212501e      	bset	20510,#1
 692  0080               L171:
 693                     ; 285 if( a == 1 ){	D_IO_HIGH(IO_M2, IO_M2p);}
 695  0080 a101          	cp	a,#1
 696  0082 2604          	jrne	L371
 699  0084 7210501e      	bset	20510,#0
 700  0088               L371:
 701                     ; 286 if( a == 2 ){	D_IO_HIGH(IO_M3, IO_M3p);}
 703  0088 a102          	cp	a,#2
 704  008a 2604          	jrne	L571
 707  008c 721e500a      	bset	20490,#7
 708  0090               L571:
 709                     ; 287 if( a == 3 ){	D_IO_HIGH(IO_M4, IO_M4p);}
 711  0090 a103          	cp	a,#3
 712  0092 2604          	jrne	L771
 715  0094 721c500a      	bset	20490,#6
 716  0098               L771:
 717                     ; 288 if( a == 4 ){	D_IO_HIGH(IO_M5, IO_M5p);}
 719  0098 a104          	cp	a,#4
 720  009a 2604          	jrne	L102
 723  009c 721a500a      	bset	20490,#5
 724  00a0               L102:
 725                     ; 289 if( a == 5 ){	D_IO_HIGH(IO_M6, IO_M6p);}
 727  00a0 a105          	cp	a,#5
 728  00a2 2604          	jrne	L302
 731  00a4 7218500a      	bset	20490,#4
 732  00a8               L302:
 733                     ; 290 if( a == 6 ){	D_IO_HIGH(IO_M7, IO_M7p);}
 735  00a8 a106          	cp	a,#6
 736  00aa 2604          	jrne	L502
 739  00ac 7216500a      	bset	20490,#3
 740  00b0               L502:
 741                     ; 291 if( a == 7 ){	D_IO_HIGH(IO_M8, IO_M8p);}
 743  00b0 a107          	cp	a,#7
 744  00b2 2604          	jrne	L702
 747  00b4 721a5014      	bset	20500,#5
 748  00b8               L702:
 749                     ; 292 				relayCntl((_fa%2));
 751  00b8 c60002        	ld	a,__fa
 752  00bb a401          	and	a,#1
 753  00bd cd0000        	call	_relayCntl
 755  00c0               L561:
 756                     ; 298 		__f[3] = 0;
 758  00c0 725f0005      	clr	___f+3
 759                     ; 302 		i = MT_READ(IO_B1, IO_B1p);
 761  00c4 cd0226        	call	LC001
 762  00c7 6b03          	ld	(OFST+0,sp),a
 763                     ; 303 		if( i == 0 )	__func();
 765  00c9 2603          	jrne	L112
 768  00cb cd0000        	call	___func
 770  00ce               L112:
 771                     ; 304 		i = MT_READ(IO_B2, IO_B2p);
 773  00ce cd0231        	call	LC002
 774  00d1 6b03          	ld	(OFST+0,sp),a
 775                     ; 305 		if( i == 0 )	__func();
 777  00d3 2603          	jrne	L312
 780  00d5 cd0000        	call	___func
 782  00d8               L312:
 783                     ; 306 		i = MT_READ(IO_B3, IO_B3p);
 785  00d8 cd023c        	call	LC003
 786  00db 6b03          	ld	(OFST+0,sp),a
 787                     ; 307 		if( i == 0 )	__func();
 789  00dd 2603          	jrne	L512
 792  00df cd0000        	call	___func
 794  00e2               L512:
 795                     ; 308 		i = MT_READ(IO_B4, IO_B4p);
 797  00e2 cd0247        	call	LC004
 798  00e5 6b03          	ld	(OFST+0,sp),a
 799                     ; 309 		if( i == 0 )	__func();
 801  00e7 2603          	jrne	L712
 804  00e9 cd0000        	call	___func
 806  00ec               L712:
 807                     ; 310 		i = MT_READ(IO_B5, IO_B5p);
 809  00ec cd0252        	call	LC005
 810  00ef 6b03          	ld	(OFST+0,sp),a
 811                     ; 311 		if( i == 0 )	__func();
 813  00f1 2603          	jrne	L122
 816  00f3 cd0000        	call	___func
 818  00f6               L122:
 819                     ; 312 		i = MT_READ(IO_B6, IO_B6p);
 821  00f6 cd025d        	call	LC006
 822  00f9 6b03          	ld	(OFST+0,sp),a
 823                     ; 313 		if( i == 0 )	__func();
 825  00fb 2603          	jrne	L322
 828  00fd cd0000        	call	___func
 830  0100               L322:
 831                     ; 314 		i = MT_READ(IO_B7, IO_B7p);
 833  0100 cd0268        	call	LC007
 834  0103 6b03          	ld	(OFST+0,sp),a
 835                     ; 315 		if( i == 0 )	__func();
 837  0105 2603          	jrne	L522
 840  0107 cd0000        	call	___func
 842  010a               L522:
 843                     ; 316 		i = MT_READ(IO_B8, IO_B8p);
 845  010a cd0273        	call	LC008
 846  010d 6b03          	ld	(OFST+0,sp),a
 847                     ; 317 		if( i == 0 )	__func();
 849  010f 2703cc01c9    	jrne	L551
 852  0114 cd0000        	call	___func
 854  0117 cc01c9        	jra	L551
 855  011a               L361:
 856                     ; 319 	else if( _fs == 2 )
 858  011a a102          	cp	a,#2
 859  011c 26f9          	jrne	L551
 860                     ; 321 		if( __f[0] != (__timer100ms) )//&& __f[3] != 0 )
 862  011e c60002        	ld	a,___f
 863  0121 c10000        	cp	a,___timer100ms
 864  0124 2603cc01c5    	jreq	L532
 865                     ; 323 			if( __f[1] == 0 )
 867  0129 c60003        	ld	a,___f+1
 868  012c 26e9          	jrne	L551
 869                     ; 325 				__f[1] = 1;
 871  012e 35010003      	mov	___f+1,#1
 872                     ; 326 				__f[0] = __timer100ms%8;
 874  0132 c60000        	ld	a,___timer100ms
 875  0135 a407          	and	a,#7
 876  0137 c70002        	ld	___f,a
 877                     ; 328 				__f[3] = 0;
 879  013a 725f0005      	clr	___f+3
 880                     ; 329 				factoryMtOff();
 882  013e cd0000        	call	_factoryMtOff
 884                     ; 331 				i = MT_READ(IO_B1, IO_B1p);
 886  0141 cd0226        	call	LC001
 887  0144 6b03          	ld	(OFST+0,sp),a
 888                     ; 332 				if( i == 1 )
 890  0146 4a            	dec	a
 891  0147 2607          	jrne	L142
 892                     ; 334 					D_IO_HIGH(IO_MV, IO_V1p);	
 894  0149 72165014      	bset	20500,#3
 895                     ; 335 					factoryMtSetLow();
 897  014d cd0000        	call	_factoryMtSetLow
 899  0150               L142:
 900                     ; 337 				i = MT_READ(IO_B2, IO_B2p);
 902  0150 cd0231        	call	LC002
 903  0153 6b03          	ld	(OFST+0,sp),a
 904                     ; 338 				if( i == 1 )
 906  0155 4a            	dec	a
 907  0156 2607          	jrne	L342
 908                     ; 340 					D_IO_HIGH(IO_MV, IO_V2p);	
 910  0158 72145014      	bset	20500,#2
 911                     ; 341 					factoryMtSetLow();
 913  015c cd0000        	call	_factoryMtSetLow
 915  015f               L342:
 916                     ; 343 				i = MT_READ(IO_B3, IO_B3p);
 918  015f cd023c        	call	LC003
 919  0162 6b03          	ld	(OFST+0,sp),a
 920                     ; 344 				if( i == 1 )
 922  0164 4a            	dec	a
 923  0165 2607          	jrne	L542
 924                     ; 346 					D_IO_HIGH(IO_MV, IO_V3p);	
 926  0167 72125014      	bset	20500,#1
 927                     ; 347 					factoryMtSetLow();
 929  016b cd0000        	call	_factoryMtSetLow
 931  016e               L542:
 932                     ; 349 				i = MT_READ(IO_B4, IO_B4p);
 934  016e cd0247        	call	LC004
 935  0171 6b03          	ld	(OFST+0,sp),a
 936                     ; 350 				if( i == 1 )
 938  0173 4a            	dec	a
 939  0174 2607          	jrne	L742
 940                     ; 352 					D_IO_HIGH(IO_MV, IO_V4p);	
 942  0176 72105014      	bset	20500,#0
 943                     ; 353 					factoryMtSetLow();
 945  017a cd0000        	call	_factoryMtSetLow
 947  017d               L742:
 948                     ; 355 				i = MT_READ(IO_B5, IO_B5p);
 950  017d cd0252        	call	LC005
 951  0180 6b03          	ld	(OFST+0,sp),a
 952                     ; 356 				if( i == 1 )
 954  0182 4a            	dec	a
 955  0183 2607          	jrne	L152
 956                     ; 358 					D_IO_HIGH(IO_MV, IO_V4p);	
 958  0185 72105014      	bset	20500,#0
 959                     ; 359 					factoryMtSetHigh();
 961  0189 cd0000        	call	_factoryMtSetHigh
 963  018c               L152:
 964                     ; 361 				i = MT_READ(IO_B6, IO_B6p);
 966  018c cd025d        	call	LC006
 967  018f 6b03          	ld	(OFST+0,sp),a
 968                     ; 362 				if( i == 1 )
 970  0191 4a            	dec	a
 971  0192 2607          	jrne	L352
 972                     ; 364 					D_IO_HIGH(IO_MV, IO_V3p);	
 974  0194 72125014      	bset	20500,#1
 975                     ; 365 					factoryMtSetHigh();
 977  0198 cd0000        	call	_factoryMtSetHigh
 979  019b               L352:
 980                     ; 367 				i = MT_READ(IO_B7, IO_B7p);
 982  019b cd0268        	call	LC007
 983  019e 6b03          	ld	(OFST+0,sp),a
 984                     ; 368 				if( i == 1 )
 986  01a0 4a            	dec	a
 987  01a1 2607          	jrne	L552
 988                     ; 370 					D_IO_HIGH(IO_MV, IO_V2p);	
 990  01a3 72145014      	bset	20500,#2
 991                     ; 371 					factoryMtSetHigh();
 993  01a7 cd0000        	call	_factoryMtSetHigh
 995  01aa               L552:
 996                     ; 373 				i = MT_READ(IO_B8, IO_B8p);
 998  01aa cd0273        	call	LC008
 999  01ad 6b03          	ld	(OFST+0,sp),a
1000                     ; 374 				if( i == 1 )
1002  01af 4a            	dec	a
1003  01b0 2607          	jrne	L752
1004                     ; 376 					D_IO_HIGH(IO_MV, IO_V1p);	
1006  01b2 72165014      	bset	20500,#3
1007                     ; 377 					factoryMtSetHigh();
1009  01b6 cd0000        	call	_factoryMtSetHigh
1011  01b9               L752:
1012                     ; 379 				_fc--;
1014  01b9 725a0004      	dec	__fc
1015                     ; 380 				if( _fc == 0 )
1017  01bd 260a          	jrne	L551
1018                     ; 381 					_fs = 1;
1020  01bf 35010000      	mov	__fs,#1
1021  01c3 2004          	jra	L551
1022  01c5               L532:
1023                     ; 385 			__f[1] = 0;
1025  01c5 725f0003      	clr	___f+1
1026  01c9               L551:
1027                     ; 388 	factory2wire();
1029  01c9 cd0000        	call	_factory2wire
1031                     ; 389 	if( (__timer100ms%2) == 0 )
1033  01cc 7200000009    	btjt	___timer100ms,#0,L562
1034                     ; 390 		uart3_tx_put("A", 1);
1036  01d1 4b01          	push	#1
1037  01d3 ae0002        	ldw	x,#L762
1038  01d6 cd0000        	call	_uart3_tx_put
1040  01d9 84            	pop	a
1041  01da               L562:
1042                     ; 392 	if( uart3_Ready() == 1 )
1044  01da cd0000        	call	_uart3_Ready
1046  01dd 4a            	dec	a
1047  01de 2612          	jrne	L172
1048                     ; 394 		ch = uart3_get();
1050  01e0 cd0000        	call	_uart3_get
1052  01e3 6b03          	ld	(OFST+0,sp),a
1053                     ; 395 		if( ch == 'A' )
1055  01e5 a141          	cp	a,#65
1056  01e7 2609          	jrne	L172
1057                     ; 397 			__f[4] = __timer100ms;
1059  01e9 5500000006    	mov	___f+4,___timer100ms
1060                     ; 398 			_fs2 = 2;
1062  01ee 35020001      	mov	__fs2,#2
1063  01f2               L172:
1064                     ; 404 	if( uart1_Ready() == 1 )
1066  01f2 cd0000        	call	_uart1_Ready
1068  01f5 4a            	dec	a
1069  01f6 2605          	jrne	L572
1070                     ; 406 		ch = uart1_get();
1072  01f8 cd0000        	call	_uart1_get
1074  01fb 6b03          	ld	(OFST+0,sp),a
1075                     ; 407 		if( ch == 'B' )	
1077  01fd               L572:
1078                     ; 414 	if( _fs2 == 2 )
1080  01fd c60001        	ld	a,__fs2
1081  0200 a102          	cp	a,#2
1082  0202 260e          	jrne	L103
1083                     ; 416 		if( __f[4] != __timer100ms ){	_fs2 = 3;	}		
1085  0204 c60006        	ld	a,___f+4
1086  0207 c10000        	cp	a,___timer100ms
1087  020a 2717          	jreq	L703
1090  020c 35030001      	mov	__fs2,#3
1091  0210 2011          	jra	L703
1092  0212               L103:
1093                     ; 418 	else if( _fs2 == 3 )
1095  0212 a103          	cp	a,#3
1096  0214 260d          	jrne	L703
1097                     ; 420 		uart3_tx_put("B", 1);
1099  0216 4b01          	push	#1
1100  0218 ae0000        	ldw	x,#L113
1101  021b cd0000        	call	_uart3_tx_put
1103  021e 35040001      	mov	__fs2,#4
1104  0222 84            	pop	a
1105                     ; 421 		_fs2 = 4;
1108  0223               L703:
1109                     ; 423 	else if( _fs2 == 4 )
1111                     ; 458 }
1114  0223 5b03          	addw	sp,#3
1115  0225 81            	ret	
1116  0226               LC001:
1117  0226 4b20          	push	#32
1118  0228 ae5005        	ldw	x,#20485
1119  022b cd0000        	call	_GPIO_ReadInputPin
1121  022e 5b01          	addw	sp,#1
1122  0230 81            	ret	
1123  0231               LC002:
1124  0231 4b10          	push	#16
1125  0233 ae5005        	ldw	x,#20485
1126  0236 cd0000        	call	_GPIO_ReadInputPin
1128  0239 5b01          	addw	sp,#1
1129  023b 81            	ret	
1130  023c               LC003:
1131  023c 4b08          	push	#8
1132  023e ae5005        	ldw	x,#20485
1133  0241 cd0000        	call	_GPIO_ReadInputPin
1135  0244 5b01          	addw	sp,#1
1136  0246 81            	ret	
1137  0247               LC004:
1138  0247 4b04          	push	#4
1139  0249 ae5005        	ldw	x,#20485
1140  024c cd0000        	call	_GPIO_ReadInputPin
1142  024f 5b01          	addw	sp,#1
1143  0251 81            	ret	
1144  0252               LC005:
1145  0252 4b02          	push	#2
1146  0254 ae5005        	ldw	x,#20485
1147  0257 cd0000        	call	_GPIO_ReadInputPin
1149  025a 5b01          	addw	sp,#1
1150  025c 81            	ret	
1151  025d               LC006:
1152  025d 4b01          	push	#1
1153  025f ae5005        	ldw	x,#20485
1154  0262 cd0000        	call	_GPIO_ReadInputPin
1156  0265 5b01          	addw	sp,#1
1157  0267 81            	ret	
1158  0268               LC007:
1159  0268 4b80          	push	#128
1160  026a ae5014        	ldw	x,#20500
1161  026d cd0000        	call	_GPIO_ReadInputPin
1163  0270 5b01          	addw	sp,#1
1164  0272 81            	ret	
1165  0273               LC008:
1166  0273 4b40          	push	#64
1167  0275 ae5014        	ldw	x,#20500
1168  0278 cd0000        	call	_GPIO_ReadInputPin
1170  027b 5b01          	addw	sp,#1
1171  027d 81            	ret	
1203                     ; 566 void	_factoryCntl(uint8_t i)
1203                     ; 567 {
1204                     .text:	section	.text,new
1205  0000               __factoryCntl:
1209                     ; 578 }
1212  0000 81            	ret	
1246                     ; 841 uint8_t factory(uint8_t mode)
1246                     ; 842 {
1247                     .text:	section	.text,new
1248  0000               _factory:
1252                     ; 843 	timerCalc();
1254  0000 cd0000        	call	_timerCalc
1256                     ; 846 	factoryCntl();
1259                     ; 861 }
1262  0003 cc0000        	jp	_factoryCntl
1353                     	xdef	_factory
1354                     	xdef	__factoryCntl
1355                     	xdef	_factoryCntl
1356                     	xdef	__bb
1357                     	xdef	__aa
1358                     	xdef	__mi
1359                     	xdef	_factoryMtSetHigh
1360                     	xdef	_factoryMtSetLow
1361                     	xdef	_factoryMtOn
1362                     	xdef	_factoryMtOff
1363                     	xdef	___func1
1364                     	xdef	___func
1365                     	xdef	__fc
1366                     	xdef	__fb
1367                     	xdef	__fa
1368                     	xref	_relayCntl
1369                     	xdef	_factory2wire
1370                     	switch	.bss
1371  0000               ___ff:
1372  0000 0000          	ds.b	2
1373                     	xdef	___ff
1374                     	xref	__io9d_head
1375                     	xdef	__fs2
1376                     	xdef	__fs
1377  0002               ___f:
1378  0002 000000000000  	ds.b	8
1379                     	xdef	___f
1380                     	xref	_mt_clear
1381                     	xref	_timerCalc
1382                     	xref	___timer1s
1383                     	xref	___timer100ms
1384                     	xref	_uart3_get
1385                     	xref	_uart3_tx_put
1386                     	xref	_uart3_Ready
1387                     	xref	_uart1_get
1388                     	xref	_uart1_Ready
1389                     	xref	_iouart_getBuffer
1390                     	xref	_iouart_Ready
1391                     	xref	__io_tail
1392                     	xref	__io_head
1393                     	xref	_iouart_Pkt_Start
1394                     	xref	_iouart_Set_Packet
1395                     	xref	_GPIO_ReadInputPin
1396                     .const:	section	.text
1397  0000               L113:
1398  0000 4200          	dc.b	"B",0
1399  0002               L762:
1400  0002 4100          	dc.b	"A",0
1401                     	xref.b	c_y
1421                     	end
