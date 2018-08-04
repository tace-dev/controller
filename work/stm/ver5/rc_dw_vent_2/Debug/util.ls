   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     .const:	section	.text
  23  0000               ___CharTable:
  24  0000 303132333435  	dc.b	"0123456789ABCDEF",0
  92                     ; 6 uint8_t	*_i2a(uint16_t i)
  92                     ; 7 {
  93                     .text:	section	.text,new
  94  0000               f__i2a:
  96  0000 89            	pushw	x
  97  0001 5204          	subw	sp,#4
  98       00000004      OFST:	set	4
 101                     ; 9 	uint8_t	len=0;
 103  0003 0f03          	clr	(OFST-1,sp)
 104  0005 1e05          	ldw	x,(OFST+1,sp)
 105  0007               L53:
 106                     ; 12 		k = i%10;
 108  0007 a60a          	ld	a,#10
 109  0009 62            	div	x,a
 110  000a 5f            	clrw	x
 111  000b 97            	ld	xl,a
 112  000c 01            	rrwa	x,a
 113  000d 6b02          	ld	(OFST-2,sp),a
 114                     ; 13 		i = i/10;
 116  000f a60a          	ld	a,#10
 117  0011 1e05          	ldw	x,(OFST+1,sp)
 118  0013 62            	div	x,a
 119  0014 1f05          	ldw	(OFST+1,sp),x
 120                     ; 14 		_i2aBuf[len] = '0' + k;
 122  0016 5f            	clrw	x
 123  0017 7b03          	ld	a,(OFST-1,sp)
 124  0019 97            	ld	xl,a
 125  001a 7b02          	ld	a,(OFST-2,sp)
 126  001c ab30          	add	a,#48
 127  001e d70000        	ld	(__i2aBuf,x),a
 128                     ; 15 		len++;
 130  0021 0c03          	inc	(OFST-1,sp)
 131                     ; 16 		if( i==0 )
 133  0023 1e05          	ldw	x,(OFST+1,sp)
 134  0025 26e0          	jrne	L53
 135                     ; 17 			break;
 136                     ; 19 	for( j=0; j<len/2; j++ )
 138  0027 0f04          	clr	(OFST+0,sp)
 140  0029 202a          	jra	L74
 141  002b               L34:
 142                     ; 21 		n = len-1-j;
 144  002b 7b03          	ld	a,(OFST-1,sp)
 145  002d 4a            	dec	a
 146  002e 1004          	sub	a,(OFST+0,sp)
 147  0030 6b01          	ld	(OFST-3,sp),a
 148                     ; 22 		k = _i2aBuf[n];
 150  0032 5f            	clrw	x
 151  0033 97            	ld	xl,a
 152  0034 d60000        	ld	a,(__i2aBuf,x)
 153  0037 6b02          	ld	(OFST-2,sp),a
 154                     ; 23 		_i2aBuf[n] = _i2aBuf[j];
 156  0039 5f            	clrw	x
 157  003a 7b01          	ld	a,(OFST-3,sp)
 158  003c 97            	ld	xl,a
 159  003d 7b04          	ld	a,(OFST+0,sp)
 160  003f 905f          	clrw	y
 161  0041 9097          	ld	yl,a
 162  0043 90d60000      	ld	a,(__i2aBuf,y)
 163  0047 d70000        	ld	(__i2aBuf,x),a
 164                     ; 24 		_i2aBuf[j] = k;
 166  004a 5f            	clrw	x
 167  004b 7b04          	ld	a,(OFST+0,sp)
 168  004d 97            	ld	xl,a
 169  004e 7b02          	ld	a,(OFST-2,sp)
 170  0050 d70000        	ld	(__i2aBuf,x),a
 171                     ; 19 	for( j=0; j<len/2; j++ )
 173  0053 0c04          	inc	(OFST+0,sp)
 174  0055               L74:
 177  0055 7b03          	ld	a,(OFST-1,sp)
 178  0057 5f            	clrw	x
 179  0058 97            	ld	xl,a
 180  0059 57            	sraw	x
 181  005a 7b04          	ld	a,(OFST+0,sp)
 182  005c 905f          	clrw	y
 183  005e 9097          	ld	yl,a
 184  0060 90bf00        	ldw	c_y,y
 185  0063 b300          	cpw	x,c_y
 186  0065 2cc4          	jrsgt	L34
 187                     ; 26 	_i2aBuf[len] = 0;
 189  0067 7b03          	ld	a,(OFST-1,sp)
 190  0069 5f            	clrw	x
 191  006a 97            	ld	xl,a
 192  006b 724f0000      	clr	(__i2aBuf,x)
 193                     ; 27 	return _i2aBuf;
 195  006f ae0000        	ldw	x,#__i2aBuf
 198  0072 5b06          	addw	sp,#6
 199  0074 87            	retf	
 240                     ; 30 uint8_t	_strlen(uint8_t *p)
 240                     ; 31 {
 241                     .text:	section	.text,new
 242  0000               f__strlen:
 244  0000 89            	pushw	x
 245  0001 88            	push	a
 246       00000001      OFST:	set	1
 249                     ; 32 	uint8_t	i=0;
 251  0002 0f01          	clr	(OFST+0,sp)
 252  0004 1e02          	ldw	x,(OFST+1,sp)
 253  0006               L37:
 254                     ; 35 		if( *p == 0 )
 256  0006 f6            	ld	a,(x)
 257  0007 2605          	jrne	L77
 258                     ; 36 			return i;
 260  0009 7b01          	ld	a,(OFST+0,sp)
 263  000b 5b03          	addw	sp,#3
 264  000d 87            	retf	
 265  000e               L77:
 266                     ; 37 		i++;
 268  000e 0c01          	inc	(OFST+0,sp)
 269                     ; 38 		p++;
 271  0010 5c            	incw	x
 272  0011 1f02          	ldw	(OFST+1,sp),x
 274  0013 20f1          	jra	L37
 337                     ; 42 void	disp_int(uint8_t ch)
 337                     ; 43 {
 338                     .text:	section	.text,new
 339  0000               f_disp_int:
 341  0000 88            	push	a
 342  0001 5205          	subw	sp,#5
 343       00000005      OFST:	set	5
 346                     ; 47 	j = 0;
 348  0003 0f01          	clr	(OFST-4,sp)
 349                     ; 48 	i = ch / 100;
 351  0005 5f            	clrw	x
 352  0006 97            	ld	xl,a
 353  0007 a664          	ld	a,#100
 354  0009 62            	div	x,a
 355  000a 9f            	ld	a,xl
 356  000b 6b05          	ld	(OFST+0,sp),a
 357                     ; 49 	if( i != 0 )
 359  000d 2713          	jreq	L131
 360                     ; 51 		buf[0] = '0' + i;
 362  000f ab30          	add	a,#48
 363  0011 6b02          	ld	(OFST-3,sp),a
 364                     ; 52 		DISP(buf, 1);
 366  0013 4b01          	push	#1
 367  0015 96            	ldw	x,sp
 368  0016 1c0003        	addw	x,#OFST-2
 369  0019 8d000000      	callf	f_uart1_tx_put
 371  001d 84            	pop	a
 372                     ; 53 		j = 1;
 374  001e a601          	ld	a,#1
 375  0020 6b01          	ld	(OFST-4,sp),a
 377  0022               L131:
 378                     ; 60 	k = ch % 100;
 380  0022 7b06          	ld	a,(OFST+1,sp)
 381  0024 5f            	clrw	x
 382  0025 97            	ld	xl,a
 383  0026 a664          	ld	a,#100
 384  0028 62            	div	x,a
 385                     ; 61 	i = k / 10; 
 387  0029 5f            	clrw	x
 388  002a 97            	ld	xl,a
 389  002b a60a          	ld	a,#10
 390  002d 62            	div	x,a
 391  002e 9f            	ld	a,xl
 392  002f 6b05          	ld	(OFST+0,sp),a
 393                     ; 62 	if( i != 0 )
 395  0031 2704          	jreq	L331
 396                     ; 64 		buf[0] = '0' + i;
 398  0033 ab30          	add	a,#48
 399                     ; 65 		DISP(buf, 1);
 401                     ; 66 		j = 1;
 404  0035 2007          	jpf	LC001
 405  0037               L331:
 406                     ; 68 	else if( j == 1 )
 408  0037 7b01          	ld	a,(OFST-4,sp)
 409  0039 4a            	dec	a
 410  003a 260f          	jrne	L531
 411                     ; 70 		buf[0] = '0';
 413  003c a630          	ld	a,#48
 414                     ; 71 		DISP(buf, 1);
 417  003e               LC001:
 418  003e 6b02          	ld	(OFST-3,sp),a
 420  0040 4b01          	push	#1
 421  0042 96            	ldw	x,sp
 422  0043 1c0003        	addw	x,#OFST-2
 423  0046 8d000000      	callf	f_uart1_tx_put
 424  004a 84            	pop	a
 425  004b               L531:
 426                     ; 73 	i = ch % 10;
 428  004b 7b06          	ld	a,(OFST+1,sp)
 429  004d 5f            	clrw	x
 430  004e 97            	ld	xl,a
 431  004f a60a          	ld	a,#10
 432  0051 62            	div	x,a
 433  0052 6b05          	ld	(OFST+0,sp),a
 434                     ; 74 	buf[0] = '0' + i;
 436  0054 ab30          	add	a,#48
 437  0056 6b02          	ld	(OFST-3,sp),a
 438                     ; 75 	DISP(buf, 1);
 440  0058 4b01          	push	#1
 441  005a 96            	ldw	x,sp
 442  005b 1c0003        	addw	x,#OFST-2
 443  005e 8d000000      	callf	f_uart1_tx_put
 445  0062 84            	pop	a
 446                     ; 76 	DISP(" ", 1);
 448  0063 4b01          	push	#1
 449  0065 ae0011        	ldw	x,#L141
 450  0068 8d000000      	callf	f_uart1_tx_put
 452  006c 84            	pop	a
 453                     ; 77 }
 456  006d 5b06          	addw	sp,#6
 457  006f 87            	retf	
 520                     ; 79 void	disp_int16(uint16_t ch)
 520                     ; 80 {
 521                     .text:	section	.text,new
 522  0000               f_disp_int16:
 524  0000 89            	pushw	x
 525  0001 5207          	subw	sp,#7
 526       00000007      OFST:	set	7
 529                     ; 85 	j = 0;
 531  0003 0f03          	clr	(OFST-4,sp)
 532                     ; 86 	i = ch / 10000;
 534  0005 90ae2710      	ldw	y,#10000
 535  0009 65            	divw	x,y
 536  000a 01            	rrwa	x,a
 537  000b 6b04          	ld	(OFST-3,sp),a
 538  000d 02            	rlwa	x,a
 539                     ; 87 	if( i != 0 )
 541  000e 0d04          	tnz	(OFST-3,sp)
 542  0010 2715          	jreq	L171
 543                     ; 89 		buf[0] = '0' + i;
 545  0012 7b04          	ld	a,(OFST-3,sp)
 546  0014 ab30          	add	a,#48
 547  0016 6b05          	ld	(OFST-2,sp),a
 548                     ; 90 		DISP(buf, 1);
 550  0018 4b01          	push	#1
 551  001a 96            	ldw	x,sp
 552  001b 1c0006        	addw	x,#OFST-1
 553  001e 8d000000      	callf	f_uart1_tx_put
 555  0022 84            	pop	a
 556                     ; 91 		j = 1;
 558  0023 a601          	ld	a,#1
 559  0025 6b03          	ld	(OFST-4,sp),a
 560  0027               L171:
 561                     ; 93 	k = ch % 10000;
 563  0027 1e08          	ldw	x,(OFST+1,sp)
 564  0029 90ae2710      	ldw	y,#10000
 565  002d 65            	divw	x,y
 566  002e 93            	ldw	x,y
 567  002f 1f01          	ldw	(OFST-6,sp),x
 568                     ; 94 	i = k / 1000;
 570  0031 90ae03e8      	ldw	y,#1000
 571  0035 65            	divw	x,y
 572  0036 01            	rrwa	x,a
 573  0037 6b04          	ld	(OFST-3,sp),a
 574                     ; 95 	if( i != 0 )
 576  0039 2715          	jreq	L371
 577                     ; 97 		buf[0] = '0' + i;
 579  003b ab30          	add	a,#48
 580  003d 6b05          	ld	(OFST-2,sp),a
 581                     ; 98 		DISP(buf, 1);
 583  003f 4b01          	push	#1
 584  0041 96            	ldw	x,sp
 585  0042 1c0006        	addw	x,#OFST-1
 586  0045 8d000000      	callf	f_uart1_tx_put
 588  0049 84            	pop	a
 589                     ; 99 		j = 1;
 591  004a a601          	ld	a,#1
 592  004c 6b03          	ld	(OFST-4,sp),a
 594  004e 2014          	jra	L571
 595  0050               L371:
 596                     ; 101 	else if( j == 1 )
 598  0050 7b03          	ld	a,(OFST-4,sp)
 599  0052 4a            	dec	a
 600  0053 260f          	jrne	L571
 601                     ; 103 		buf[0] = '0';
 603  0055 a630          	ld	a,#48
 604  0057 6b05          	ld	(OFST-2,sp),a
 605                     ; 104 		DISP(buf, 1);
 607  0059 4b01          	push	#1
 608  005b 96            	ldw	x,sp
 609  005c 1c0006        	addw	x,#OFST-1
 610  005f 8d000000      	callf	f_uart1_tx_put
 612  0063 84            	pop	a
 613  0064               L571:
 614                     ; 106 	k = ch % 1000;
 616  0064 1e08          	ldw	x,(OFST+1,sp)
 617  0066 90ae03e8      	ldw	y,#1000
 618  006a 65            	divw	x,y
 619  006b 93            	ldw	x,y
 620  006c 1f01          	ldw	(OFST-6,sp),x
 621                     ; 107 	i = k / 100;
 623  006e a664          	ld	a,#100
 624  0070 62            	div	x,a
 625  0071 01            	rrwa	x,a
 626  0072 6b04          	ld	(OFST-3,sp),a
 627                     ; 108 	if( i != 0 )
 629  0074 2715          	jreq	L102
 630                     ; 110 		buf[0] = '0' + i;
 632  0076 ab30          	add	a,#48
 633  0078 6b05          	ld	(OFST-2,sp),a
 634                     ; 111 		DISP(buf, 1);
 636  007a 4b01          	push	#1
 637  007c 96            	ldw	x,sp
 638  007d 1c0006        	addw	x,#OFST-1
 639  0080 8d000000      	callf	f_uart1_tx_put
 641  0084 84            	pop	a
 642                     ; 112 		j = 1;
 644  0085 a601          	ld	a,#1
 645  0087 6b03          	ld	(OFST-4,sp),a
 647  0089 2014          	jra	L302
 648  008b               L102:
 649                     ; 114 	else if( j == 1 )
 651  008b 7b03          	ld	a,(OFST-4,sp)
 652  008d 4a            	dec	a
 653  008e 260f          	jrne	L302
 654                     ; 116 		buf[0] = '0';
 656  0090 a630          	ld	a,#48
 657  0092 6b05          	ld	(OFST-2,sp),a
 658                     ; 117 		DISP(buf, 1);
 660  0094 4b01          	push	#1
 661  0096 96            	ldw	x,sp
 662  0097 1c0006        	addw	x,#OFST-1
 663  009a 8d000000      	callf	f_uart1_tx_put
 665  009e 84            	pop	a
 666  009f               L302:
 667                     ; 119 	k = ch % 100;
 669  009f 1e08          	ldw	x,(OFST+1,sp)
 670  00a1 a664          	ld	a,#100
 671  00a3 62            	div	x,a
 672  00a4 5f            	clrw	x
 673  00a5 97            	ld	xl,a
 674  00a6 1f01          	ldw	(OFST-6,sp),x
 675                     ; 120 	i = k / 10; 
 677  00a8 a60a          	ld	a,#10
 678  00aa 62            	div	x,a
 679  00ab 01            	rrwa	x,a
 680  00ac 6b04          	ld	(OFST-3,sp),a
 681                     ; 121 	if( i != 0 )
 683  00ae 2704          	jreq	L702
 684                     ; 123 		buf[0] = '0' + i;
 686  00b0 ab30          	add	a,#48
 687                     ; 124 		DISP(buf, 1);
 689                     ; 125 		j = 1;
 692  00b2 2007          	jpf	LC002
 693  00b4               L702:
 694                     ; 127 	else if( j == 1 )
 696  00b4 7b03          	ld	a,(OFST-4,sp)
 697  00b6 4a            	dec	a
 698  00b7 260f          	jrne	L112
 699                     ; 129 		buf[0] = '0';
 701  00b9 a630          	ld	a,#48
 702                     ; 130 		DISP(buf, 1);
 705  00bb               LC002:
 706  00bb 6b05          	ld	(OFST-2,sp),a
 708  00bd 4b01          	push	#1
 709  00bf 96            	ldw	x,sp
 710  00c0 1c0006        	addw	x,#OFST-1
 711  00c3 8d000000      	callf	f_uart1_tx_put
 712  00c7 84            	pop	a
 713  00c8               L112:
 714                     ; 132 	i = ch % 10;
 716  00c8 1e08          	ldw	x,(OFST+1,sp)
 717  00ca a60a          	ld	a,#10
 718  00cc 62            	div	x,a
 719  00cd 5f            	clrw	x
 720  00ce 97            	ld	xl,a
 721  00cf 01            	rrwa	x,a
 722  00d0 6b04          	ld	(OFST-3,sp),a
 723                     ; 133 	buf[0] = '0' + i;
 725  00d2 ab30          	add	a,#48
 726  00d4 6b05          	ld	(OFST-2,sp),a
 727                     ; 134 	DISP(buf, 1);
 729  00d6 4b01          	push	#1
 730  00d8 96            	ldw	x,sp
 731  00d9 1c0006        	addw	x,#OFST-1
 732  00dc 8d000000      	callf	f_uart1_tx_put
 734  00e0 84            	pop	a
 735                     ; 135 	DISP(" ", 1);
 737  00e1 4b01          	push	#1
 738  00e3 ae0011        	ldw	x,#L141
 739  00e6 8d000000      	callf	f_uart1_tx_put
 741  00ea 84            	pop	a
 742                     ; 136 }
 745  00eb 5b09          	addw	sp,#9
 746  00ed 87            	retf	
 803                     ; 138 void	disp_char(uint8_t ch)
 803                     ; 139 {
 804                     .text:	section	.text,new
 805  0000               f_disp_char:
 807  0000 88            	push	a
 808  0001 5205          	subw	sp,#5
 809       00000005      OFST:	set	5
 812                     ; 142 	uint8_t s = 0;
 814  0003 0f01          	clr	(OFST-4,sp)
 815                     ; 144 	i = (ch>>4) & 0x0f;
 817  0005 4e            	swap	a
 818  0006 a40f          	and	a,#15
 819  0008 6b05          	ld	(OFST+0,sp),a
 820                     ; 145 	if( i == 0 )
 822  000a 2605          	jrne	L142
 823                     ; 146 		s = 1;
 825  000c 4c            	inc	a
 826  000d 6b01          	ld	(OFST-4,sp),a
 827  000f 7b05          	ld	a,(OFST+0,sp)
 828  0011               L142:
 829                     ; 147 	buf[0] = __CharTable[i];
 831  0011 5f            	clrw	x
 832  0012 97            	ld	xl,a
 833  0013 d60000        	ld	a,(___CharTable,x)
 834  0016 6b02          	ld	(OFST-3,sp),a
 835                     ; 149 	i = ch & 0x0f;
 837  0018 7b06          	ld	a,(OFST+1,sp)
 838  001a a40f          	and	a,#15
 839  001c 6b05          	ld	(OFST+0,sp),a
 840                     ; 150 	buf[1] = __CharTable[i];
 842  001e 5f            	clrw	x
 843  001f 97            	ld	xl,a
 844  0020 d60000        	ld	a,(___CharTable,x)
 845  0023 6b03          	ld	(OFST-2,sp),a
 846                     ; 151 	buf[2] = ' ';
 848  0025 a620          	ld	a,#32
 849  0027 6b04          	ld	(OFST-1,sp),a
 850                     ; 152 	if( s == 1 )
 852  0029 7b01          	ld	a,(OFST-4,sp)
 853  002b 4a            	dec	a
 854  002c 2608          	jrne	L342
 855                     ; 153 		DISP(&buf[1], 2);
 857  002e 4b02          	push	#2
 858  0030 96            	ldw	x,sp
 859  0031 1c0004        	addw	x,#OFST-1
 862  0034 2006          	jra	L542
 863  0036               L342:
 864                     ; 155 		DISP(buf, 3);
 866  0036 4b03          	push	#3
 867  0038 96            	ldw	x,sp
 868  0039 1c0003        	addw	x,#OFST-2
 870  003c               L542:
 871  003c 8d000000      	callf	f_uart1_tx_put
 872  0040 84            	pop	a
 873                     ; 156 }
 876  0041 5b06          	addw	sp,#6
 877  0043 87            	retf	
 902                     ; 181 void	clockConfig(void)
 902                     ; 182 {
 903                     .text:	section	.text,new
 904  0000               f_clockConfig:
 908                     ; 195 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1); // CLK_PRESCALER_HSIDIV1
 910  0000 4f            	clr	a
 911  0001 8d000000      	callf	f_CLK_SYSCLKDivConfig
 913                     ; 196 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 915  0005 a601          	ld	a,#1
 916  0007 8d000000      	callf	f_CLK_SYSCLKSourceConfig
 919  000b               L162:
 920                     ; 198 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
 922  000b 8d000000      	callf	f_CLK_GetSYSCLKSource
 924  000f 4a            	dec	a
 925  0010 26f9          	jrne	L162
 926                     ; 212 }
 929  0012 87            	retf	
 963                     	switch	.bss
 964  0000               __i2aBuf:
 965  0000 000000000000  	ds.b	6
 966                     	xdef	__i2aBuf
 967                     	xdef	___CharTable
 968                     	xdef	f__strlen
 969                     	xdef	f__i2a
 970                     	xdef	f_disp_int16
 971                     	xdef	f_disp_int
 972                     	xdef	f_disp_char
 973                     	xdef	f_clockConfig
 974                     	xref	f_uart1_tx_put
 975                     	xref	f_CLK_SYSCLKDivConfig
 976                     	xref	f_CLK_GetSYSCLKSource
 977                     	xref	f_CLK_SYSCLKSourceConfig
 978                     	switch	.const
 979  0011               L141:
 980  0011 2000          	dc.b	" ",0
 981                     	xref.b	c_y
1001                     	end
