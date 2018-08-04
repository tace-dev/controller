   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     .const:	section	.text
  23  0000               ___CharTable:
  24  0000 303132333435  	dc.b	"0123456789ABCDEF",0
  92                     ; 6 uint8_t	*_i2a(uint16_t i)
  92                     ; 7 {
  94                     .text:	section	.text,new
  95  0000               __i2a:
  97  0000 89            	pushw	x
  98  0001 5204          	subw	sp,#4
  99       00000004      OFST:	set	4
 102                     ; 9 	uint8_t	len=0;
 104  0003 0f03          	clr	(OFST-1,sp)
 105  0005 1e05          	ldw	x,(OFST+1,sp)
 106  0007               L53:
 107                     ; 12 		k = i%10;
 109  0007 a60a          	ld	a,#10
 110  0009 62            	div	x,a
 111  000a 5f            	clrw	x
 112  000b 97            	ld	xl,a
 113  000c 01            	rrwa	x,a
 114  000d 6b02          	ld	(OFST-2,sp),a
 115                     ; 13 		i = i/10;
 117  000f a60a          	ld	a,#10
 118  0011 1e05          	ldw	x,(OFST+1,sp)
 119  0013 62            	div	x,a
 120  0014 1f05          	ldw	(OFST+1,sp),x
 121                     ; 14 		_i2aBuf[len] = '0' + k;
 123  0016 5f            	clrw	x
 124  0017 7b03          	ld	a,(OFST-1,sp)
 125  0019 97            	ld	xl,a
 126  001a 7b02          	ld	a,(OFST-2,sp)
 127  001c ab30          	add	a,#48
 128  001e d70000        	ld	(__i2aBuf,x),a
 129                     ; 15 		len++;
 131  0021 0c03          	inc	(OFST-1,sp)
 132                     ; 16 		if( i==0 )
 134  0023 1e05          	ldw	x,(OFST+1,sp)
 135  0025 26e0          	jrne	L53
 136                     ; 17 			break;
 137                     ; 19 	for( j=0; j<len/2; j++ )
 139  0027 0f04          	clr	(OFST+0,sp)
 141  0029 202a          	jra	L74
 142  002b               L34:
 143                     ; 21 		n = len-1-j;
 145  002b 7b03          	ld	a,(OFST-1,sp)
 146  002d 4a            	dec	a
 147  002e 1004          	sub	a,(OFST+0,sp)
 148  0030 6b01          	ld	(OFST-3,sp),a
 149                     ; 22 		k = _i2aBuf[n];
 151  0032 5f            	clrw	x
 152  0033 97            	ld	xl,a
 153  0034 d60000        	ld	a,(__i2aBuf,x)
 154  0037 6b02          	ld	(OFST-2,sp),a
 155                     ; 23 		_i2aBuf[n] = _i2aBuf[j];
 157  0039 5f            	clrw	x
 158  003a 7b01          	ld	a,(OFST-3,sp)
 159  003c 97            	ld	xl,a
 160  003d 7b04          	ld	a,(OFST+0,sp)
 161  003f 905f          	clrw	y
 162  0041 9097          	ld	yl,a
 163  0043 90d60000      	ld	a,(__i2aBuf,y)
 164  0047 d70000        	ld	(__i2aBuf,x),a
 165                     ; 24 		_i2aBuf[j] = k;
 167  004a 5f            	clrw	x
 168  004b 7b04          	ld	a,(OFST+0,sp)
 169  004d 97            	ld	xl,a
 170  004e 7b02          	ld	a,(OFST-2,sp)
 171  0050 d70000        	ld	(__i2aBuf,x),a
 172                     ; 19 	for( j=0; j<len/2; j++ )
 174  0053 0c04          	inc	(OFST+0,sp)
 175  0055               L74:
 178  0055 7b03          	ld	a,(OFST-1,sp)
 179  0057 5f            	clrw	x
 180  0058 97            	ld	xl,a
 181  0059 57            	sraw	x
 182  005a 7b04          	ld	a,(OFST+0,sp)
 183  005c 905f          	clrw	y
 184  005e 9097          	ld	yl,a
 185  0060 90bf00        	ldw	c_y,y
 186  0063 b300          	cpw	x,c_y
 187  0065 2cc4          	jrsgt	L34
 188                     ; 26 	_i2aBuf[len] = 0;
 190  0067 7b03          	ld	a,(OFST-1,sp)
 191  0069 5f            	clrw	x
 192  006a 97            	ld	xl,a
 193  006b 724f0000      	clr	(__i2aBuf,x)
 194                     ; 27 	return _i2aBuf;
 196  006f ae0000        	ldw	x,#__i2aBuf
 199  0072 5b06          	addw	sp,#6
 200  0074 81            	ret	
 242                     ; 30 uint8_t	_strlen(uint8_t *p)
 242                     ; 31 {
 243                     .text:	section	.text,new
 244  0000               __strlen:
 246  0000 89            	pushw	x
 247  0001 88            	push	a
 248       00000001      OFST:	set	1
 251                     ; 32 	uint8_t	i=0;
 253  0002 0f01          	clr	(OFST+0,sp)
 254  0004 1e02          	ldw	x,(OFST+1,sp)
 255  0006               L37:
 256                     ; 35 		if( *p == 0 )
 258  0006 f6            	ld	a,(x)
 259  0007 2605          	jrne	L77
 260                     ; 36 			return i;
 262  0009 7b01          	ld	a,(OFST+0,sp)
 265  000b 5b03          	addw	sp,#3
 266  000d 81            	ret	
 267  000e               L77:
 268                     ; 37 		i++;
 270  000e 0c01          	inc	(OFST+0,sp)
 271                     ; 38 		p++;
 273  0010 5c            	incw	x
 274  0011 1f02          	ldw	(OFST+1,sp),x
 276  0013 20f1          	jra	L37
 340                     ; 42 void	disp_int(uint8_t ch)
 340                     ; 43 {
 341                     .text:	section	.text,new
 342  0000               _disp_int:
 344  0000 88            	push	a
 345  0001 5205          	subw	sp,#5
 346       00000005      OFST:	set	5
 349                     ; 47 	j = 0;
 351  0003 0f01          	clr	(OFST-4,sp)
 352                     ; 48 	i = ch / 100;
 354  0005 5f            	clrw	x
 355  0006 97            	ld	xl,a
 356  0007 a664          	ld	a,#100
 357  0009 62            	div	x,a
 358  000a 9f            	ld	a,xl
 359  000b 6b05          	ld	(OFST+0,sp),a
 360                     ; 49 	if( i != 0 )
 362  000d 2712          	jreq	L131
 363                     ; 51 		buf[0] = '0' + i;
 365  000f ab30          	add	a,#48
 366  0011 6b02          	ld	(OFST-3,sp),a
 367                     ; 52 		DISP(buf, 1);
 369  0013 4b01          	push	#1
 370  0015 96            	ldw	x,sp
 371  0016 1c0003        	addw	x,#OFST-2
 372  0019 cd0000        	call	_uart1_tx_put
 374  001c 84            	pop	a
 375                     ; 53 		j = 1;
 377  001d a601          	ld	a,#1
 378  001f 6b01          	ld	(OFST-4,sp),a
 380  0021               L131:
 381                     ; 60 	k = ch % 100;
 383  0021 7b06          	ld	a,(OFST+1,sp)
 384  0023 5f            	clrw	x
 385  0024 97            	ld	xl,a
 386  0025 a664          	ld	a,#100
 387  0027 62            	div	x,a
 388                     ; 61 	i = k / 10; 
 390  0028 5f            	clrw	x
 391  0029 97            	ld	xl,a
 392  002a a60a          	ld	a,#10
 393  002c 62            	div	x,a
 394  002d 9f            	ld	a,xl
 395  002e 6b05          	ld	(OFST+0,sp),a
 396                     ; 62 	if( i != 0 )
 398  0030 2704          	jreq	L331
 399                     ; 64 		buf[0] = '0' + i;
 401  0032 ab30          	add	a,#48
 402                     ; 65 		DISP(buf, 1);
 404                     ; 66 		j = 1;
 407  0034 2007          	jp	LC001
 408  0036               L331:
 409                     ; 68 	else if( j == 1 )
 411  0036 7b01          	ld	a,(OFST-4,sp)
 412  0038 4a            	dec	a
 413  0039 260e          	jrne	L531
 414                     ; 70 		buf[0] = '0';
 416  003b a630          	ld	a,#48
 417                     ; 71 		DISP(buf, 1);
 420  003d               LC001:
 421  003d 6b02          	ld	(OFST-3,sp),a
 423  003f 4b01          	push	#1
 424  0041 96            	ldw	x,sp
 425  0042 1c0003        	addw	x,#OFST-2
 426  0045 cd0000        	call	_uart1_tx_put
 427  0048 84            	pop	a
 428  0049               L531:
 429                     ; 73 	i = ch % 10;
 431  0049 7b06          	ld	a,(OFST+1,sp)
 432  004b 5f            	clrw	x
 433  004c 97            	ld	xl,a
 434  004d a60a          	ld	a,#10
 435  004f 62            	div	x,a
 436  0050 6b05          	ld	(OFST+0,sp),a
 437                     ; 74 	buf[0] = '0' + i;
 439  0052 ab30          	add	a,#48
 440  0054 6b02          	ld	(OFST-3,sp),a
 441                     ; 75 	DISP(buf, 1);
 443  0056 4b01          	push	#1
 444  0058 96            	ldw	x,sp
 445  0059 1c0003        	addw	x,#OFST-2
 446  005c cd0000        	call	_uart1_tx_put
 448  005f 84            	pop	a
 449                     ; 76 	DISP(" ", 1);
 451  0060 4b01          	push	#1
 452  0062 ae0011        	ldw	x,#L141
 453  0065 cd0000        	call	_uart1_tx_put
 455  0068 84            	pop	a
 456                     ; 77 }
 459  0069 5b06          	addw	sp,#6
 460  006b 81            	ret	
 524                     ; 79 void	disp_int16(uint16_t ch)
 524                     ; 80 {
 525                     .text:	section	.text,new
 526  0000               _disp_int16:
 528  0000 89            	pushw	x
 529  0001 5207          	subw	sp,#7
 530       00000007      OFST:	set	7
 533                     ; 85 	j = 0;
 535  0003 0f03          	clr	(OFST-4,sp)
 536                     ; 86 	i = ch / 10000;
 538  0005 90ae2710      	ldw	y,#10000
 539  0009 65            	divw	x,y
 540  000a 01            	rrwa	x,a
 541  000b 6b04          	ld	(OFST-3,sp),a
 542  000d 02            	rlwa	x,a
 543                     ; 87 	if( i != 0 )
 545  000e 0d04          	tnz	(OFST-3,sp)
 546  0010 2714          	jreq	L171
 547                     ; 89 		buf[0] = '0' + i;
 549  0012 7b04          	ld	a,(OFST-3,sp)
 550  0014 ab30          	add	a,#48
 551  0016 6b05          	ld	(OFST-2,sp),a
 552                     ; 90 		DISP(buf, 1);
 554  0018 4b01          	push	#1
 555  001a 96            	ldw	x,sp
 556  001b 1c0006        	addw	x,#OFST-1
 557  001e cd0000        	call	_uart1_tx_put
 559  0021 84            	pop	a
 560                     ; 91 		j = 1;
 562  0022 a601          	ld	a,#1
 563  0024 6b03          	ld	(OFST-4,sp),a
 564  0026               L171:
 565                     ; 93 	k = ch % 10000;
 567  0026 1e08          	ldw	x,(OFST+1,sp)
 568  0028 90ae2710      	ldw	y,#10000
 569  002c 65            	divw	x,y
 570  002d 93            	ldw	x,y
 571  002e 1f01          	ldw	(OFST-6,sp),x
 572                     ; 94 	i = k / 1000;
 574  0030 90ae03e8      	ldw	y,#1000
 575  0034 65            	divw	x,y
 576  0035 01            	rrwa	x,a
 577  0036 6b04          	ld	(OFST-3,sp),a
 578                     ; 95 	if( i != 0 )
 580  0038 2714          	jreq	L371
 581                     ; 97 		buf[0] = '0' + i;
 583  003a ab30          	add	a,#48
 584  003c 6b05          	ld	(OFST-2,sp),a
 585                     ; 98 		DISP(buf, 1);
 587  003e 4b01          	push	#1
 588  0040 96            	ldw	x,sp
 589  0041 1c0006        	addw	x,#OFST-1
 590  0044 cd0000        	call	_uart1_tx_put
 592  0047 84            	pop	a
 593                     ; 99 		j = 1;
 595  0048 a601          	ld	a,#1
 596  004a 6b03          	ld	(OFST-4,sp),a
 598  004c 2013          	jra	L571
 599  004e               L371:
 600                     ; 101 	else if( j == 1 )
 602  004e 7b03          	ld	a,(OFST-4,sp)
 603  0050 4a            	dec	a
 604  0051 260e          	jrne	L571
 605                     ; 103 		buf[0] = '0';
 607  0053 a630          	ld	a,#48
 608  0055 6b05          	ld	(OFST-2,sp),a
 609                     ; 104 		DISP(buf, 1);
 611  0057 4b01          	push	#1
 612  0059 96            	ldw	x,sp
 613  005a 1c0006        	addw	x,#OFST-1
 614  005d cd0000        	call	_uart1_tx_put
 616  0060 84            	pop	a
 617  0061               L571:
 618                     ; 106 	k = ch % 1000;
 620  0061 1e08          	ldw	x,(OFST+1,sp)
 621  0063 90ae03e8      	ldw	y,#1000
 622  0067 65            	divw	x,y
 623  0068 93            	ldw	x,y
 624  0069 1f01          	ldw	(OFST-6,sp),x
 625                     ; 107 	i = k / 100;
 627  006b a664          	ld	a,#100
 628  006d 62            	div	x,a
 629  006e 01            	rrwa	x,a
 630  006f 6b04          	ld	(OFST-3,sp),a
 631                     ; 108 	if( i != 0 )
 633  0071 2714          	jreq	L102
 634                     ; 110 		buf[0] = '0' + i;
 636  0073 ab30          	add	a,#48
 637  0075 6b05          	ld	(OFST-2,sp),a
 638                     ; 111 		DISP(buf, 1);
 640  0077 4b01          	push	#1
 641  0079 96            	ldw	x,sp
 642  007a 1c0006        	addw	x,#OFST-1
 643  007d cd0000        	call	_uart1_tx_put
 645  0080 84            	pop	a
 646                     ; 112 		j = 1;
 648  0081 a601          	ld	a,#1
 649  0083 6b03          	ld	(OFST-4,sp),a
 651  0085 2013          	jra	L302
 652  0087               L102:
 653                     ; 114 	else if( j == 1 )
 655  0087 7b03          	ld	a,(OFST-4,sp)
 656  0089 4a            	dec	a
 657  008a 260e          	jrne	L302
 658                     ; 116 		buf[0] = '0';
 660  008c a630          	ld	a,#48
 661  008e 6b05          	ld	(OFST-2,sp),a
 662                     ; 117 		DISP(buf, 1);
 664  0090 4b01          	push	#1
 665  0092 96            	ldw	x,sp
 666  0093 1c0006        	addw	x,#OFST-1
 667  0096 cd0000        	call	_uart1_tx_put
 669  0099 84            	pop	a
 670  009a               L302:
 671                     ; 119 	k = ch % 100;
 673  009a 1e08          	ldw	x,(OFST+1,sp)
 674  009c a664          	ld	a,#100
 675  009e 62            	div	x,a
 676  009f 5f            	clrw	x
 677  00a0 97            	ld	xl,a
 678  00a1 1f01          	ldw	(OFST-6,sp),x
 679                     ; 120 	i = k / 10; 
 681  00a3 a60a          	ld	a,#10
 682  00a5 62            	div	x,a
 683  00a6 01            	rrwa	x,a
 684  00a7 6b04          	ld	(OFST-3,sp),a
 685                     ; 121 	if( i != 0 )
 687  00a9 2704          	jreq	L702
 688                     ; 123 		buf[0] = '0' + i;
 690  00ab ab30          	add	a,#48
 691                     ; 124 		DISP(buf, 1);
 693                     ; 125 		j = 1;
 696  00ad 2007          	jp	LC002
 697  00af               L702:
 698                     ; 127 	else if( j == 1 )
 700  00af 7b03          	ld	a,(OFST-4,sp)
 701  00b1 4a            	dec	a
 702  00b2 260e          	jrne	L112
 703                     ; 129 		buf[0] = '0';
 705  00b4 a630          	ld	a,#48
 706                     ; 130 		DISP(buf, 1);
 709  00b6               LC002:
 710  00b6 6b05          	ld	(OFST-2,sp),a
 712  00b8 4b01          	push	#1
 713  00ba 96            	ldw	x,sp
 714  00bb 1c0006        	addw	x,#OFST-1
 715  00be cd0000        	call	_uart1_tx_put
 716  00c1 84            	pop	a
 717  00c2               L112:
 718                     ; 132 	i = ch % 10;
 720  00c2 1e08          	ldw	x,(OFST+1,sp)
 721  00c4 a60a          	ld	a,#10
 722  00c6 62            	div	x,a
 723  00c7 5f            	clrw	x
 724  00c8 97            	ld	xl,a
 725  00c9 01            	rrwa	x,a
 726  00ca 6b04          	ld	(OFST-3,sp),a
 727                     ; 133 	buf[0] = '0' + i;
 729  00cc ab30          	add	a,#48
 730  00ce 6b05          	ld	(OFST-2,sp),a
 731                     ; 134 	DISP(buf, 1);
 733  00d0 4b01          	push	#1
 734  00d2 96            	ldw	x,sp
 735  00d3 1c0006        	addw	x,#OFST-1
 736  00d6 cd0000        	call	_uart1_tx_put
 738  00d9 84            	pop	a
 739                     ; 135 	DISP(" ", 1);
 741  00da 4b01          	push	#1
 742  00dc ae0011        	ldw	x,#L141
 743  00df cd0000        	call	_uart1_tx_put
 745  00e2 84            	pop	a
 746                     ; 136 }
 749  00e3 5b09          	addw	sp,#9
 750  00e5 81            	ret	
 808                     ; 138 void	disp_char(uint8_t ch)
 808                     ; 139 {
 809                     .text:	section	.text,new
 810  0000               _disp_char:
 812  0000 88            	push	a
 813  0001 5205          	subw	sp,#5
 814       00000005      OFST:	set	5
 817                     ; 142 	uint8_t s = 0;
 819  0003 0f01          	clr	(OFST-4,sp)
 820                     ; 144 	i = (ch>>4) & 0x0f;
 822  0005 4e            	swap	a
 823  0006 a40f          	and	a,#15
 824  0008 6b05          	ld	(OFST+0,sp),a
 825                     ; 145 	if( i == 0 )
 827  000a 2605          	jrne	L142
 828                     ; 146 		s = 1;
 830  000c 4c            	inc	a
 831  000d 6b01          	ld	(OFST-4,sp),a
 832  000f 7b05          	ld	a,(OFST+0,sp)
 833  0011               L142:
 834                     ; 147 	buf[0] = __CharTable[i];
 836  0011 5f            	clrw	x
 837  0012 97            	ld	xl,a
 838  0013 d60000        	ld	a,(___CharTable,x)
 839  0016 6b02          	ld	(OFST-3,sp),a
 840                     ; 149 	i = ch & 0x0f;
 842  0018 7b06          	ld	a,(OFST+1,sp)
 843  001a a40f          	and	a,#15
 844  001c 6b05          	ld	(OFST+0,sp),a
 845                     ; 150 	buf[1] = __CharTable[i];
 847  001e 5f            	clrw	x
 848  001f 97            	ld	xl,a
 849  0020 d60000        	ld	a,(___CharTable,x)
 850  0023 6b03          	ld	(OFST-2,sp),a
 851                     ; 151 	buf[2] = ' ';
 853  0025 a620          	ld	a,#32
 854  0027 6b04          	ld	(OFST-1,sp),a
 855                     ; 152 	if( s == 1 )
 857  0029 7b01          	ld	a,(OFST-4,sp)
 858  002b 4a            	dec	a
 859  002c 2608          	jrne	L342
 860                     ; 153 		DISP(&buf[1], 2);
 862  002e 4b02          	push	#2
 863  0030 96            	ldw	x,sp
 864  0031 1c0004        	addw	x,#OFST-1
 867  0034 2006          	jra	L542
 868  0036               L342:
 869                     ; 155 		DISP(buf, 3);
 871  0036 4b03          	push	#3
 872  0038 96            	ldw	x,sp
 873  0039 1c0003        	addw	x,#OFST-2
 875  003c               L542:
 876  003c cd0000        	call	_uart1_tx_put
 877  003f 84            	pop	a
 878                     ; 156 }
 881  0040 5b06          	addw	sp,#6
 882  0042 81            	ret	
 908                     ; 181 void	clockConfig(void)
 908                     ; 182 {
 909                     .text:	section	.text,new
 910  0000               _clockConfig:
 914                     ; 186 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1); // CLK_PRESCALER_HSIDIV1
 916  0000 4f            	clr	a
 917  0001 cd0000        	call	_CLK_SYSCLKDivConfig
 919                     ; 187 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 921  0004 a601          	ld	a,#1
 922  0006 cd0000        	call	_CLK_SYSCLKSourceConfig
 925  0009               L162:
 926                     ; 189 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
 928  0009 cd0000        	call	_CLK_GetSYSCLKSource
 930  000c 4a            	dec	a
 931  000d 26fa          	jrne	L162
 932                     ; 202 }
 935  000f 81            	ret	
 970                     	switch	.bss
 971  0000               __i2aBuf:
 972  0000 000000000000  	ds.b	6
 973                     	xdef	__i2aBuf
 974                     	xdef	___CharTable
 975                     	xdef	__strlen
 976                     	xdef	__i2a
 977                     	xdef	_disp_int16
 978                     	xdef	_disp_int
 979                     	xdef	_disp_char
 980                     	xdef	_clockConfig
 981                     	xref	_uart1_tx_put
 982                     	xref	_CLK_SYSCLKDivConfig
 983                     	xref	_CLK_GetSYSCLKSource
 984                     	xref	_CLK_SYSCLKSourceConfig
 985                     	switch	.const
 986  0011               L141:
 987  0011 2000          	dc.b	" ",0
 988                     	xref.b	c_y
1008                     	end
