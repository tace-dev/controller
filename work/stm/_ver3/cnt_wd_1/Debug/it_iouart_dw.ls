   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               __io9d_head:
  25  0000 00            	dc.b	0
  26  0001               ____k_9d:
  27  0001 00            	dc.b	0
  28  0002               __u9dSendWait:
  29  0002 0000          	dc.w	0
  30  0004               __u9dIdle:
  31  0004 00            	dc.b	0
  32  0005               __u9d_i1:
  33  0005 00            	dc.b	0
  34  0006               __u9d_i2:
  35  0006 00            	dc.b	0
  36  0007               __u9ds:
  37  0007 00            	dc.b	0
  38  0008               __u9dsi:
  39  0008 00            	dc.b	0
  40  0009               _dw_s:
  41  0009 00            	dc.b	0
  42  000a               _dw_i:
  43  000a 00            	dc.b	0
  44  000b               _dw_ready:
  45  000b 00            	dc.b	0
  75                     ; 42 uint8_t	iouart9d_ReadyBuf(void)
  75                     ; 43 {
  77                     .text:	section	.text,new
  78  0000               _iouart9d_ReadyBuf:
  82                     ; 44 	return dw_ready == 1 ? 1 : 0;
  84  0000 c6000b        	ld	a,_dw_ready
  85  0003 4a            	dec	a
  86  0004 2602          	jrne	L6
  87  0006 4c            	inc	a
  89  0007 81            	ret	
  90  0008               L6:
  91  0008 4f            	clr	a
  94  0009 81            	ret	
 134                     ; 47 void	__timer1CiCb_Dw(void)
 134                     ; 48 {
 135                     .text:	section	.text,new
 136  0000               ___timer1CiCb_Dw:
 138  0000 88            	push	a
 139       00000001      OFST:	set	1
 142                     ; 51 	if( _u9dIdle != 0 )
 144  0001 725d0004      	tnz	__u9dIdle
 145  0005 2702          	jreq	L53
 146                     ; 52 		return;
 149  0007 84            	pop	a
 150  0008 81            	ret	
 151  0009               L53:
 152                     ; 54 	i = GPIO_ReadInputData(D_IOUART9d_READ_PORT);
 154  0009 ae500f        	ldw	x,#20495
 155  000c cd0000        	call	_GPIO_ReadInputData
 157                     ; 55 	i = i & D_IOUART9d_READ_PIN;
 159  000f a401          	and	a,#1
 160  0011 6b01          	ld	(OFST+0,sp),a
 161                     ; 58 	if( dw_s == 0 )
 163  0013 c60009        	ld	a,_dw_s
 164  0016 2619          	jrne	L73
 165                     ; 60 		if( i == 0 )
 167  0018 7b01          	ld	a,(OFST+0,sp)
 168  001a 2602          	jrne	L14
 169                     ; 61 			return;
 172  001c 84            	pop	a
 173  001d 81            	ret	
 174  001e               L14:
 175                     ; 63 		___k_9d = 1;
 177  001e 35010001      	mov	____k_9d,#1
 178                     ; 64 		_io9d_head = 0;
 180  0022 725f0000      	clr	__io9d_head
 181                     ; 65 		dw_s = 10;
 183  0026 350a0009      	mov	_dw_s,#10
 184                     ; 66 		dw_ready = 0;
 186  002a 725f000b      	clr	_dw_ready
 188  002e cc00cb        	jra	L34
 189  0031               L73:
 190                     ; 68 	else if( dw_s == 10 )
 192  0031 a10a          	cp	a,#10
 193  0033 261c          	jrne	L54
 194                     ; 70 		___k_9d++;
 196  0035 725c0001      	inc	____k_9d
 197                     ; 71 		if( i == 1 )
 199  0039 7b01          	ld	a,(OFST+0,sp)
 200  003b 4a            	dec	a
 201  003c 2602          	jrne	L74
 202                     ; 72 			return;
 205  003e 84            	pop	a
 206  003f 81            	ret	
 207  0040               L74:
 208                     ; 74 		dw_s = ___k_9d > 130 ? 9 : 0;
 210  0040 c60001        	ld	a,____k_9d
 211  0043 a183          	cp	a,#131
 212  0045 2504          	jrult	L61
 213  0047 a609          	ld	a,#9
 214  0049 2001          	jra	L02
 215  004b               L61:
 216  004b 4f            	clr	a
 217  004c               L02:
 218  004c c70009        	ld	_dw_s,a
 220  004f 207a          	jra	L34
 221  0051               L54:
 222                     ; 76 	else if( dw_s == 9 )
 224  0051 a109          	cp	a,#9
 225  0053 2610          	jrne	L35
 226                     ; 79 		if( i == 0 )
 228  0055 7b01          	ld	a,(OFST+0,sp)
 229  0057 2602          	jrne	L55
 230                     ; 80 			return;
 233  0059 84            	pop	a
 234  005a 81            	ret	
 235  005b               L55:
 236                     ; 81 		dw_s = 1;
 238  005b 35010009      	mov	_dw_s,#1
 239                     ; 82 		___k_9d = 1;
 241  005f 35010001      	mov	____k_9d,#1
 243  0063 2066          	jra	L34
 244  0065               L35:
 245                     ; 84 	else if( dw_s == 1 )
 247  0065 a101          	cp	a,#1
 248  0067 2641          	jrne	L16
 249                     ; 87 		___k_9d++;
 251  0069 725c0001      	inc	____k_9d
 252                     ; 88 		if( i != 0 )
 254  006d 7b01          	ld	a,(OFST+0,sp)
 255  006f 2702          	jreq	L36
 256                     ; 89 			return;
 259  0071 84            	pop	a
 260  0072 81            	ret	
 261  0073               L36:
 262                     ; 91 		_io9d_buf[_io9d_head++] = ___k_9d;
 264  0073 c60000        	ld	a,__io9d_head
 265  0076 725c0000      	inc	__io9d_head
 266  007a 5f            	clrw	x
 267  007b 97            	ld	xl,a
 268  007c c60001        	ld	a,____k_9d
 269  007f d70010        	ld	(__io9d_buf,x),a
 270                     ; 92 		if( _io9d_head == 4 )
 272  0082 c60000        	ld	a,__io9d_head
 273  0085 a104          	cp	a,#4
 274  0087 260a          	jrne	L56
 275                     ; 94 			dw_s = 0;
 277  0089 725f0009      	clr	_dw_s
 278                     ; 95 			dw_ready = 1;
 280  008d 3501000b      	mov	_dw_ready,#1
 281                     ; 96 			return;
 284  0091 84            	pop	a
 285  0092 81            	ret	
 286  0093               L56:
 287                     ; 98 		if( _io9d_head == _IO9d_BUF_SIZE )
 289  0093 c60000        	ld	a,__io9d_head
 290  0096 a130          	cp	a,#48
 291  0098 2606          	jrne	L76
 292                     ; 100 			dw_s = 0;
 294  009a 725f0009      	clr	_dw_s
 295                     ; 101 			return;
 298  009e 84            	pop	a
 299  009f 81            	ret	
 300  00a0               L76:
 301                     ; 103 		dw_s = 2;
 303  00a0 35020009      	mov	_dw_s,#2
 304                     ; 104 		dw_i = 0;
 306  00a4 725f000a      	clr	_dw_i
 308  00a8 2021          	jra	L34
 309  00aa               L16:
 310                     ; 106 	else if( dw_s == 2 )
 312  00aa a102          	cp	a,#2
 313  00ac 261d          	jrne	L34
 314                     ; 109 		if( i != 0 )
 316  00ae 7b01          	ld	a,(OFST+0,sp)
 317  00b0 270a          	jreq	L57
 318                     ; 111 			dw_s = 1;
 320  00b2 35010009      	mov	_dw_s,#1
 321                     ; 112 			___k_9d = 1;
 323  00b6 35010001      	mov	____k_9d,#1
 324                     ; 113 			return;
 327  00ba 84            	pop	a
 328  00bb 81            	ret	
 329  00bc               L57:
 330                     ; 115 		dw_i++;
 332  00bc 725c000a      	inc	_dw_i
 333                     ; 116 		if( dw_i > 200 )
 335  00c0 c6000a        	ld	a,_dw_i
 336  00c3 a1c9          	cp	a,#201
 337  00c5 2504          	jrult	L34
 338                     ; 117 			dw_s = 0;
 340  00c7 725f0009      	clr	_dw_s
 341  00cb               L34:
 342                     ; 119 }
 345  00cb 84            	pop	a
 346  00cc 81            	ret	
 369                     ; 121 void	iouart9d_Open(void)
 369                     ; 122 {
 370                     .text:	section	.text,new
 371  0000               _iouart9d_Open:
 375                     ; 123 }
 378  0000 81            	ret	
 403                     ; 125 uint8_t	*iouart9d_getBuffer(void)
 403                     ; 126 {
 404                     .text:	section	.text,new
 405  0000               _iouart9d_getBuffer:
 409                     ; 127 	return _u9dTxBuf;
 411  0000 ae000b        	ldw	x,#__u9dTxBuf
 414  0003 81            	ret	
 440                     ; 130 uint8_t	*iouart9d_getReadBuffer(void)
 440                     ; 131 {
 441                     .text:	section	.text,new
 442  0000               _iouart9d_getReadBuffer:
 446                     ; 132 	return _uBuf9d;
 448  0000 ae0000        	ldw	x,#__uBuf9d
 451  0003 81            	ret	
 485                     ; 135 void	iouart9d_Set_Packet(uint8_t wait)
 485                     ; 136 {
 486                     .text:	section	.text,new
 487  0000               _iouart9d_Set_Packet:
 491                     ; 137 	_u9dSendWait = wait;
 493  0000 5f            	clrw	x
 494  0001 97            	ld	xl,a
 495  0002 cf0002        	ldw	__u9dSendWait,x
 496                     ; 138 }
 499  0005 81            	ret	
 526                     ; 140 void	iouart9d_Pkt_Start(void)
 526                     ; 141 {
 527                     .text:	section	.text,new
 528  0000               _iouart9d_Pkt_Start:
 532                     ; 142 	_u9ds = 0;
 534  0000 725f0007      	clr	__u9ds
 535                     ; 143 	_u9d_i1 = 0;
 537  0004 725f0005      	clr	__u9d_i1
 538                     ; 144 	_u9d_i2 = 0;
 540  0008 725f0006      	clr	__u9d_i2
 541                     ; 145 	_u9dIdle = 1;	//	Busy
 543  000c 35010004      	mov	__u9dIdle,#1
 544                     ; 146 }
 547  0010 81            	ret	
 597                     ; 148 uint8_t	_iouart9d_getCh(void)
 597                     ; 149 {
 598                     .text:	section	.text,new
 599  0000               __iouart9d_getCh:
 601  0000 89            	pushw	x
 602       00000002      OFST:	set	2
 605                     ; 151 	i = _u9d_i2/8;
 607  0001 c60006        	ld	a,__u9d_i2
 608  0004 5f            	clrw	x
 609  0005 97            	ld	xl,a
 610  0006 57            	sraw	x
 611  0007 57            	sraw	x
 612  0008 57            	sraw	x
 613  0009 01            	rrwa	x,a
 614  000a 6b01          	ld	(OFST-1,sp),a
 615                     ; 152 	j = _u9d_i2%8;
 617  000c c60006        	ld	a,__u9d_i2
 618  000f a407          	and	a,#7
 619  0011 6b02          	ld	(OFST+0,sp),a
 620                     ; 153 	t = _u9dTxBuf[i] & __iBitTable[j];
 622  0013 5f            	clrw	x
 623  0014 7b01          	ld	a,(OFST-1,sp)
 624  0016 97            	ld	xl,a
 625  0017 7b02          	ld	a,(OFST+0,sp)
 626  0019 905f          	clrw	y
 627  001b 9097          	ld	yl,a
 628  001d 90d60000      	ld	a,(___iBitTable,y)
 629  0021 d4000b        	and	a,(__u9dTxBuf,x)
 630  0024 6b02          	ld	(OFST+0,sp),a
 631                     ; 154 	_u9d_i2++;
 633  0026 725c0006      	inc	__u9d_i2
 634                     ; 155 	if( t != 0 )
 636  002a 7b02          	ld	a,(OFST+0,sp)
 637  002c 2706          	jreq	L571
 638                     ; 157 		_u9d_i1 = 20;
 640  002e 35140005      	mov	__u9d_i1,#20
 642  0032 2004          	jra	L771
 643  0034               L571:
 644                     ; 161 		_u9d_i1 = 60;
 646  0034 353c0005      	mov	__u9d_i1,#60
 647  0038               L771:
 648                     ; 163 	return t;
 652  0038 85            	popw	x
 653  0039 81            	ret	
 681                     ; 166 uint8_t	iouart9d_Write(void)
 681                     ; 167 {
 682                     .text:	section	.text,new
 683  0000               _iouart9d_Write:
 687                     ; 169 	if( _u9ds == 0 )
 689  0000 725d0007      	tnz	__u9ds
 690  0004 260f          	jrne	L112
 691                     ; 171 		D_IOUART9d_HIGH;
 693  0006 7214500f      	bset	20495,#2
 694                     ; 172 		_u9ds = 1;
 696  000a 35010007      	mov	__u9ds,#1
 697                     ; 173 		_u9d_i1 = 140;	//	7ms
 699  000e 358c0005      	mov	__u9d_i1,#140
 701  0012 cc00c4        	jra	L312
 702  0015               L112:
 703                     ; 175 	else if( _u9ds == 1 )
 705  0015 c60007        	ld	a,__u9ds
 706  0018 4a            	dec	a
 707  0019 2619          	jrne	L512
 708                     ; 177 		_u9d_i1--;
 710  001b 725a0005      	dec	__u9d_i1
 711                     ; 178 		if( _u9d_i1 == 0 )
 713  001f 725d0005      	tnz	__u9d_i1
 714  0023 26ed          	jrne	L312
 715                     ; 180 			D_IOUART9d_LOW;
 717  0025 7215500f      	bres	20495,#2
 718                     ; 181 			_u9ds = 11;
 720  0029 350b0007      	mov	__u9ds,#11
 721                     ; 182 			_u9d_i1 = 40;	//	2ms
 723  002d 35280005      	mov	__u9d_i1,#40
 724  0031 cc00c4        	jra	L312
 725  0034               L512:
 726                     ; 185 	else if( _u9ds == 11 )
 728  0034 c60007        	ld	a,__u9ds
 729  0037 a10b          	cp	a,#11
 730  0039 2617          	jrne	L322
 731                     ; 187 		_u9d_i1--;
 733  003b 725a0005      	dec	__u9d_i1
 734                     ; 188 		if( _u9d_i1 == 0 )
 736  003f 725d0005      	tnz	__u9d_i1
 737  0043 267f          	jrne	L312
 738                     ; 190 			_iouart9d_getCh();
 740  0045 cd0000        	call	__iouart9d_getCh
 742                     ; 191 			D_IOUART9d_HIGH;
 744  0048 7214500f      	bset	20495,#2
 745                     ; 192 			_u9ds = 9;
 747  004c 35090007      	mov	__u9ds,#9
 748  0050 2072          	jra	L312
 749  0052               L322:
 750                     ; 195 	else if( _u9ds == 9 )
 752  0052 c60007        	ld	a,__u9ds
 753  0055 a109          	cp	a,#9
 754  0057 2618          	jrne	L132
 755                     ; 197 		_u9d_i1--;
 757  0059 725a0005      	dec	__u9d_i1
 758                     ; 198 		if( _u9d_i1 == 0 )
 760  005d 725d0005      	tnz	__u9d_i1
 761  0061 2661          	jrne	L312
 762                     ; 200 			D_IOUART9d_LOW;
 764  0063 7215500f      	bres	20495,#2
 765                     ; 201 			_u9ds = 91;
 767  0067 355b0007      	mov	__u9ds,#91
 768                     ; 202 			_u9d_i1 = 40;
 770  006b 35280005      	mov	__u9d_i1,#40
 771  006f 2053          	jra	L312
 772  0071               L132:
 773                     ; 205 	else if( _u9ds == 91 )
 775  0071 c60007        	ld	a,__u9ds
 776  0074 a15b          	cp	a,#91
 777                     ; 207 		_u9d_i1--;
 778                     ; 208 		if( _u9d_i1 == 0 )
 779                     ; 210 			_iouart9d_getCh();
 781                     ; 211 			D_IOUART9d_HIGH;
 782                     ; 212 			_u9ds = 2;
 783  0076 2737          	jreq	LC001
 784                     ; 215 	else if( _u9ds == 2 )
 786  0078 c60007        	ld	a,__u9ds
 787  007b a102          	cp	a,#2
 788  007d 2629          	jrne	L542
 789                     ; 217 		_u9d_i1--;
 791  007f 725a0005      	dec	__u9d_i1
 792                     ; 218 		if( _u9d_i1 == 0 )
 794  0083 725d0005      	tnz	__u9d_i1
 795  0087 263b          	jrne	L312
 796                     ; 220 			D_IOUART9d_LOW;
 798  0089 7215500f      	bres	20495,#2
 799                     ; 221 			_u9ds = 10;
 801  008d 350a0007      	mov	__u9ds,#10
 802                     ; 222 			_u9d_i1 = 40;
 804  0091 35280005      	mov	__u9d_i1,#40
 805                     ; 223 			if( (_u9d_i2/8) >= 3 )
 807  0095 c60006        	ld	a,__u9d_i2
 808  0098 5f            	clrw	x
 809  0099 97            	ld	xl,a
 810  009a 57            	sraw	x
 811  009b 57            	sraw	x
 812  009c 57            	sraw	x
 813  009d a30003        	cpw	x,#3
 814  00a0 2f22          	jrslt	L312
 815                     ; 226 				_u9dIdle = 0;
 817  00a2 725f0004      	clr	__u9dIdle
 818  00a6 201c          	jra	L312
 819  00a8               L542:
 820                     ; 230 	else if( _u9ds == 10 )
 822  00a8 c60007        	ld	a,__u9ds
 823  00ab a10a          	cp	a,#10
 824  00ad 2615          	jrne	L312
 825                     ; 232 		_u9d_i1--;
 827                     ; 233 		if( _u9d_i1 == 0 )
 829                     ; 235 			_iouart9d_getCh();
 832                     ; 236 			D_IOUART9d_HIGH;
 834                     ; 237 			_u9ds = 2;
 836  00af               LC001:
 838  00af 725a0005      	dec	__u9d_i1
 840  00b3 725d0005      	tnz	__u9d_i1
 841  00b7 260b          	jrne	L312
 843  00b9 cd0000        	call	__iouart9d_getCh
 845  00bc 7214500f      	bset	20495,#2
 847  00c0 35020007      	mov	__u9ds,#2
 848  00c4               L312:
 849                     ; 243 	return 0;
 851  00c4 4f            	clr	a
 854  00c5 81            	ret	
 887                     ; 246 uint8_t	dw_parity(void)
 887                     ; 247 {
 888                     .text:	section	.text,new
 889  0000               _dw_parity:
 891  0000 88            	push	a
 892       00000001      OFST:	set	1
 895                     ; 249 	i = _uBuf9d[0];
 897  0001 c60000        	ld	a,__uBuf9d
 898                     ; 250 	i += _uBuf9d[1];
 900  0004 cb0001        	add	a,__uBuf9d+1
 901  0007 4c            	inc	a
 902  0008 6b01          	ld	(OFST+0,sp),a
 903                     ; 251 	i += 1;
 905                     ; 252 	return i == _uBuf9d[2] ? 0 : 1;
 907  000a c10002        	cp	a,__uBuf9d+2
 908  000d 2603          	jrne	L05
 909  000f 4f            	clr	a
 910  0010 2002          	jra	L25
 911  0012               L05:
 912  0012 a601          	ld	a,#1
 913  0014               L25:
 916  0014 5b01          	addw	sp,#1
 917  0016 81            	ret	
 960                     ; 255 void	dw_parity_make(void)
 960                     ; 256 {
 961                     .text:	section	.text,new
 962  0000               _dw_parity_make:
 964       00000003      OFST:	set	3
 967                     ; 257 	uint8_t	*p = _u9dTxBuf;
 969  0000 ae000b        	ldw	x,#__u9dTxBuf
 970  0003 5203          	subw	sp,#3
 971                     ; 259 	i = p[0];
 973  0005 f6            	ld	a,(x)
 974                     ; 260 	i += p[1];
 976  0006 eb01          	add	a,(1,x)
 977  0008 4c            	inc	a
 978                     ; 261 	i += 1;
 980                     ; 262 	p[2] = i;
 982  0009 e702          	ld	(2,x),a
 983                     ; 263 }
 986  000b 5b03          	addw	sp,#3
 987  000d 81            	ret	
1053                     ; 265 uint8_t		iouart9d_Ready(void)
1053                     ; 266 {	
1054                     .text:	section	.text,new
1055  0000               _iouart9d_Ready:
1057  0000 5205          	subw	sp,#5
1058       00000005      OFST:	set	5
1061                     ; 272 	j = 0;
1063  0002 0f01          	clr	(OFST-4,sp)
1064                     ; 273 	_ubit9 = _uData9 = _uByte9 = 0;
1066  0004 0f02          	clr	(OFST-3,sp)
1067  0006 0f03          	clr	(OFST-2,sp)
1068  0008 0f04          	clr	(OFST-1,sp)
1069  000a 7b01          	ld	a,(OFST-4,sp)
1070  000c               L143:
1071                     ; 276 		i = _io9d_buf[j++];
1073  000c 0c01          	inc	(OFST-4,sp)
1074  000e 5f            	clrw	x
1075  000f 97            	ld	xl,a
1076  0010 d60010        	ld	a,(__io9d_buf,x)
1077  0013 6b05          	ld	(OFST+0,sp),a
1078                     ; 277 		if( i >= 100 )
1080  0015 a164          	cp	a,#100
1081  0017 250b          	jrult	L543
1082                     ; 278 			_uData9 |= __iBitTable[_ubit9];
1084  0019 7b04          	ld	a,(OFST-1,sp)
1085  001b 5f            	clrw	x
1086  001c 97            	ld	xl,a
1087  001d 7b03          	ld	a,(OFST-2,sp)
1088  001f da0000        	or	a,(___iBitTable,x)
1089  0022 6b03          	ld	(OFST-2,sp),a
1090  0024               L543:
1091                     ; 279 		_ubit9++;
1093  0024 0c04          	inc	(OFST-1,sp)
1094                     ; 280 		if( _ubit9 == 8 )
1096  0026 7b04          	ld	a,(OFST-1,sp)
1097  0028 a108          	cp	a,#8
1098  002a 2639          	jrne	L743
1099                     ; 282 			_ubit9 = 0;
1101  002c 0f04          	clr	(OFST-1,sp)
1102                     ; 283 			_uBuf9d[_uByte9++] = _uData9;
1104  002e 7b02          	ld	a,(OFST-3,sp)
1105  0030 0c02          	inc	(OFST-3,sp)
1106  0032 5f            	clrw	x
1107  0033 97            	ld	xl,a
1108  0034 7b03          	ld	a,(OFST-2,sp)
1109  0036 d70000        	ld	(__uBuf9d,x),a
1110                     ; 284 			_uData9 = 0;
1112  0039 0f03          	clr	(OFST-2,sp)
1113                     ; 285 			if( _uByte9 == 3 )
1115  003b 7b02          	ld	a,(OFST-3,sp)
1116  003d a103          	cp	a,#3
1117  003f 2624          	jrne	L743
1118                     ; 287 				dw_ready = 0;
1120  0041 725f000b      	clr	_dw_ready
1121                     ; 288 				if( dw_parity() == 0 )
1123  0045 cd0000        	call	_dw_parity
1125  0048 4d            	tnz	a
1126  0049 2616          	jrne	L353
1127                     ; 290 					for( i=0; i<3; i++ )
1129  004b 6b05          	ld	(OFST+0,sp),a
1130  004d               L553:
1131                     ; 291 						_u9dpacket[i] = _uBuf9d[i];
1133  004d 5f            	clrw	x
1134  004e 97            	ld	xl,a
1135  004f d60000        	ld	a,(__uBuf9d,x)
1136  0052 d70006        	ld	(__u9dpacket,x),a
1137                     ; 290 					for( i=0; i<3; i++ )
1139  0055 0c05          	inc	(OFST+0,sp)
1142  0057 7b05          	ld	a,(OFST+0,sp)
1143  0059 a103          	cp	a,#3
1144  005b 25f0          	jrult	L553
1145                     ; 292 					return 1;
1147  005d a601          	ld	a,#1
1149  005f 2001          	jra	L26
1150  0061               L353:
1151                     ; 294 				return 0;// 
1154  0061 4f            	clr	a
1156  0062               L26:
1158  0062 5b05          	addw	sp,#5
1159  0064 81            	ret	
1160  0065               L743:
1161                     ; 297 		if( j>=40 )
1163  0065 7b01          	ld	a,(OFST-4,sp)
1164  0067 a128          	cp	a,#40
1165  0069 25a1          	jrult	L143
1166                     ; 298 			return 0;
1168  006b 20f4          	jp	L353
1316                     	xdef	_iouart9d_Ready
1317                     	xdef	_dw_parity_make
1318                     	xdef	_dw_parity
1319                     	xdef	_iouart9d_Write
1320                     	xdef	__iouart9d_getCh
1321                     	xdef	_iouart9d_Pkt_Start
1322                     	xdef	_iouart9d_Set_Packet
1323                     	xdef	_iouart9d_getReadBuffer
1324                     	xdef	_iouart9d_getBuffer
1325                     	xdef	_iouart9d_Open
1326                     	xdef	___timer1CiCb_Dw
1327                     	xdef	_iouart9d_ReadyBuf
1328                     	xdef	_dw_ready
1329                     	xdef	_dw_i
1330                     	xdef	_dw_s
1331                     	switch	.bss
1332  0000               __uBuf9d:
1333  0000 000000000000  	ds.b	6
1334                     	xdef	__uBuf9d
1335                     	xref	___iBitTable
1336                     	xdef	__u9dsi
1337                     	xdef	__u9ds
1338  0006               __u9dpacket:
1339  0006 0000000000    	ds.b	5
1340                     	xdef	__u9dpacket
1341                     	xdef	__u9d_i2
1342                     	xdef	__u9d_i1
1343  000b               __u9dTxBuf:
1344  000b 0000000000    	ds.b	5
1345                     	xdef	__u9dTxBuf
1346                     	xdef	__u9dIdle
1347                     	xdef	__u9dSendWait
1348                     	xdef	____k_9d
1349                     	xdef	__io9d_head
1350  0010               __io9d_buf:
1351  0010 000000000000  	ds.b	48
1352                     	xdef	__io9d_buf
1353                     	xref	_GPIO_ReadInputData
1373                     	end
