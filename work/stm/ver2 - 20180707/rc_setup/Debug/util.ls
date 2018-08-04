   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     .const:	section	.text
  20  0000               ___CharTable:
  21  0000 303132333435  	dc.b	"0123456789ABCDEF",0
  89                     ; 6 uint8_t	*_i2a(uint16_t i)
  89                     ; 7 {
  91                     .text:	section	.text,new
  92  0000               __i2a:
  94  0000 89            	pushw	x
  95  0001 5204          	subw	sp,#4
  96       00000004      OFST:	set	4
  99                     ; 9 	uint8_t	len=0;
 101  0003 0f03          	clr	(OFST-1,sp)
 102  0005               L53:
 103                     ; 12 		k = i%10;
 105  0005 1e05          	ldw	x,(OFST+1,sp)
 106  0007 a60a          	ld	a,#10
 107  0009 62            	div	x,a
 108  000a 5f            	clrw	x
 109  000b 97            	ld	xl,a
 110  000c 01            	rrwa	x,a
 111  000d 6b02          	ld	(OFST-2,sp),a
 112  000f 02            	rlwa	x,a
 113                     ; 13 		i = i/10;
 115  0010 1e05          	ldw	x,(OFST+1,sp)
 116  0012 a60a          	ld	a,#10
 117  0014 62            	div	x,a
 118  0015 1f05          	ldw	(OFST+1,sp),x
 119                     ; 14 		_i2aBuf[len] = '0' + k;
 121  0017 7b03          	ld	a,(OFST-1,sp)
 122  0019 5f            	clrw	x
 123  001a 97            	ld	xl,a
 124  001b 7b02          	ld	a,(OFST-2,sp)
 125  001d ab30          	add	a,#48
 126  001f d70000        	ld	(__i2aBuf,x),a
 127                     ; 15 		len++;
 129  0022 0c03          	inc	(OFST-1,sp)
 130                     ; 16 		if( i==0 )
 132  0024 1e05          	ldw	x,(OFST+1,sp)
 133  0026 26dd          	jrne	L53
 134                     ; 17 			break;
 135                     ; 19 	for( j=0; j<len/2; j++ )
 137  0028 0f04          	clr	(OFST+0,sp)
 139  002a 202c          	jra	L74
 140  002c               L34:
 141                     ; 21 		n = len-1-j;
 143  002c 7b03          	ld	a,(OFST-1,sp)
 144  002e 4a            	dec	a
 145  002f 1004          	sub	a,(OFST+0,sp)
 146  0031 6b01          	ld	(OFST-3,sp),a
 147                     ; 22 		k = _i2aBuf[n];
 149  0033 7b01          	ld	a,(OFST-3,sp)
 150  0035 5f            	clrw	x
 151  0036 97            	ld	xl,a
 152  0037 d60000        	ld	a,(__i2aBuf,x)
 153  003a 6b02          	ld	(OFST-2,sp),a
 154                     ; 23 		_i2aBuf[n] = _i2aBuf[j];
 156  003c 7b01          	ld	a,(OFST-3,sp)
 157  003e 5f            	clrw	x
 158  003f 97            	ld	xl,a
 159  0040 7b04          	ld	a,(OFST+0,sp)
 160  0042 905f          	clrw	y
 161  0044 9097          	ld	yl,a
 162  0046 90d60000      	ld	a,(__i2aBuf,y)
 163  004a d70000        	ld	(__i2aBuf,x),a
 164                     ; 24 		_i2aBuf[j] = k;
 166  004d 7b04          	ld	a,(OFST+0,sp)
 167  004f 5f            	clrw	x
 168  0050 97            	ld	xl,a
 169  0051 7b02          	ld	a,(OFST-2,sp)
 170  0053 d70000        	ld	(__i2aBuf,x),a
 171                     ; 19 	for( j=0; j<len/2; j++ )
 173  0056 0c04          	inc	(OFST+0,sp)
 174  0058               L74:
 177  0058 9c            	rvf
 178  0059 7b03          	ld	a,(OFST-1,sp)
 179  005b 5f            	clrw	x
 180  005c 97            	ld	xl,a
 181  005d 57            	sraw	x
 182  005e 7b04          	ld	a,(OFST+0,sp)
 183  0060 905f          	clrw	y
 184  0062 9097          	ld	yl,a
 185  0064 90bf00        	ldw	c_y,y
 186  0067 b300          	cpw	x,c_y
 187  0069 2cc1          	jrsgt	L34
 188                     ; 26 	_i2aBuf[len] = 0;
 190  006b 7b03          	ld	a,(OFST-1,sp)
 191  006d 5f            	clrw	x
 192  006e 97            	ld	xl,a
 193  006f 724f0000      	clr	(__i2aBuf,x)
 194                     ; 27 	return _i2aBuf;
 196  0073 ae0000        	ldw	x,#__i2aBuf
 199  0076 5b06          	addw	sp,#6
 200  0078 81            	ret
 242                     ; 30 uint8_t	_strlen(uint8_t *p)
 242                     ; 31 {
 243                     .text:	section	.text,new
 244  0000               __strlen:
 246  0000 89            	pushw	x
 247  0001 88            	push	a
 248       00000001      OFST:	set	1
 251                     ; 32 	uint8_t	i=0;
 253  0002 0f01          	clr	(OFST+0,sp)
 254  0004               L37:
 255                     ; 35 		if( *p == 0 )
 257  0004 1e02          	ldw	x,(OFST+1,sp)
 258  0006 7d            	tnz	(x)
 259  0007 2605          	jrne	L77
 260                     ; 36 			return i;
 262  0009 7b01          	ld	a,(OFST+0,sp)
 265  000b 5b03          	addw	sp,#3
 266  000d 81            	ret
 267  000e               L77:
 268                     ; 37 		i++;
 270  000e 0c01          	inc	(OFST+0,sp)
 271                     ; 38 		p++;
 273  0010 1e02          	ldw	x,(OFST+1,sp)
 274  0012 1c0001        	addw	x,#1
 275  0015 1f02          	ldw	(OFST+1,sp),x
 277  0017 20eb          	jra	L37
 341                     ; 42 void	disp_int(uint8_t ch)
 341                     ; 43 {
 342                     .text:	section	.text,new
 343  0000               _disp_int:
 345  0000 88            	push	a
 346  0001 5205          	subw	sp,#5
 347       00000005      OFST:	set	5
 350                     ; 47 	j = 0;
 352  0003 0f01          	clr	(OFST-4,sp)
 353                     ; 48 	i = ch / 100;
 355  0005 5f            	clrw	x
 356  0006 97            	ld	xl,a
 357  0007 a664          	ld	a,#100
 358  0009 62            	div	x,a
 359  000a 9f            	ld	a,xl
 360  000b 6b05          	ld	(OFST+0,sp),a
 361                     ; 49 	if( i != 0 )
 363  000d 0d05          	tnz	(OFST+0,sp)
 364  000f 2714          	jreq	L131
 365                     ; 51 		buf[0] = '0' + i;
 367  0011 7b05          	ld	a,(OFST+0,sp)
 368  0013 ab30          	add	a,#48
 369  0015 6b02          	ld	(OFST-3,sp),a
 370                     ; 52 		DISP(buf, 1);
 372  0017 4b01          	push	#1
 373  0019 96            	ldw	x,sp
 374  001a 1c0003        	addw	x,#OFST-2
 375  001d cd0000        	call	_uart1_tx_put
 377  0020 84            	pop	a
 378                     ; 53 		j = 1;
 380  0021 a601          	ld	a,#1
 381  0023 6b01          	ld	(OFST-4,sp),a
 383  0025               L131:
 384                     ; 60 	k = ch % 100;
 386  0025 7b06          	ld	a,(OFST+1,sp)
 387  0027 5f            	clrw	x
 388  0028 97            	ld	xl,a
 389  0029 a664          	ld	a,#100
 390  002b 62            	div	x,a
 391  002c 5f            	clrw	x
 392  002d 97            	ld	xl,a
 393  002e 9f            	ld	a,xl
 394  002f 6b05          	ld	(OFST+0,sp),a
 395                     ; 61 	i = k / 10; 
 397  0031 7b05          	ld	a,(OFST+0,sp)
 398  0033 5f            	clrw	x
 399  0034 97            	ld	xl,a
 400  0035 a60a          	ld	a,#10
 401  0037 62            	div	x,a
 402  0038 9f            	ld	a,xl
 403  0039 6b05          	ld	(OFST+0,sp),a
 404                     ; 62 	if( i != 0 )
 406  003b 0d05          	tnz	(OFST+0,sp)
 407  003d 2712          	jreq	L331
 408                     ; 64 		buf[0] = '0' + i;
 410  003f 7b05          	ld	a,(OFST+0,sp)
 411  0041 ab30          	add	a,#48
 412  0043 6b02          	ld	(OFST-3,sp),a
 413                     ; 65 		DISP(buf, 1);
 415  0045 4b01          	push	#1
 416  0047 96            	ldw	x,sp
 417  0048 1c0003        	addw	x,#OFST-2
 418  004b cd0000        	call	_uart1_tx_put
 420  004e 84            	pop	a
 421                     ; 66 		j = 1;
 424  004f 2014          	jra	L531
 425  0051               L331:
 426                     ; 68 	else if( j == 1 )
 428  0051 7b01          	ld	a,(OFST-4,sp)
 429  0053 a101          	cp	a,#1
 430  0055 260e          	jrne	L531
 431                     ; 70 		buf[0] = '0';
 433  0057 a630          	ld	a,#48
 434  0059 6b02          	ld	(OFST-3,sp),a
 435                     ; 71 		DISP(buf, 1);
 437  005b 4b01          	push	#1
 438  005d 96            	ldw	x,sp
 439  005e 1c0003        	addw	x,#OFST-2
 440  0061 cd0000        	call	_uart1_tx_put
 442  0064 84            	pop	a
 443  0065               L531:
 444                     ; 73 	i = ch % 10;
 446  0065 7b06          	ld	a,(OFST+1,sp)
 447  0067 5f            	clrw	x
 448  0068 97            	ld	xl,a
 449  0069 a60a          	ld	a,#10
 450  006b 62            	div	x,a
 451  006c 5f            	clrw	x
 452  006d 97            	ld	xl,a
 453  006e 9f            	ld	a,xl
 454  006f 6b05          	ld	(OFST+0,sp),a
 455                     ; 74 	buf[0] = '0' + i;
 457  0071 7b05          	ld	a,(OFST+0,sp)
 458  0073 ab30          	add	a,#48
 459  0075 6b02          	ld	(OFST-3,sp),a
 460                     ; 75 	DISP(buf, 1);
 462  0077 4b01          	push	#1
 463  0079 96            	ldw	x,sp
 464  007a 1c0003        	addw	x,#OFST-2
 465  007d cd0000        	call	_uart1_tx_put
 467  0080 84            	pop	a
 468                     ; 76 	DISP(" ", 1);
 470  0081 4b01          	push	#1
 471  0083 ae0011        	ldw	x,#L141
 472  0086 cd0000        	call	_uart1_tx_put
 474  0089 84            	pop	a
 475                     ; 77 }
 478  008a 5b06          	addw	sp,#6
 479  008c 81            	ret
 543                     ; 79 void	disp_int16(uint16_t ch)
 543                     ; 80 {
 544                     .text:	section	.text,new
 545  0000               _disp_int16:
 547  0000 89            	pushw	x
 548  0001 5207          	subw	sp,#7
 549       00000007      OFST:	set	7
 552                     ; 85 	j = 0;
 554  0003 0f03          	clr	(OFST-4,sp)
 555                     ; 86 	i = ch / 10000;
 557  0005 90ae2710      	ldw	y,#10000
 558  0009 65            	divw	x,y
 559  000a 01            	rrwa	x,a
 560  000b 6b04          	ld	(OFST-3,sp),a
 561  000d 02            	rlwa	x,a
 562                     ; 87 	if( i != 0 )
 564  000e 0d04          	tnz	(OFST-3,sp)
 565  0010 2714          	jreq	L171
 566                     ; 89 		buf[0] = '0' + i;
 568  0012 7b04          	ld	a,(OFST-3,sp)
 569  0014 ab30          	add	a,#48
 570  0016 6b05          	ld	(OFST-2,sp),a
 571                     ; 90 		DISP(buf, 1);
 573  0018 4b01          	push	#1
 574  001a 96            	ldw	x,sp
 575  001b 1c0006        	addw	x,#OFST-1
 576  001e cd0000        	call	_uart1_tx_put
 578  0021 84            	pop	a
 579                     ; 91 		j = 1;
 581  0022 a601          	ld	a,#1
 582  0024 6b03          	ld	(OFST-4,sp),a
 583  0026               L171:
 584                     ; 93 	k = ch % 10000;
 586  0026 1e08          	ldw	x,(OFST+1,sp)
 587  0028 90ae2710      	ldw	y,#10000
 588  002c 65            	divw	x,y
 589  002d 51            	exgw	x,y
 590  002e 1f01          	ldw	(OFST-6,sp),x
 591                     ; 94 	i = k / 1000;
 593  0030 1e01          	ldw	x,(OFST-6,sp)
 594  0032 90ae03e8      	ldw	y,#1000
 595  0036 65            	divw	x,y
 596  0037 01            	rrwa	x,a
 597  0038 6b04          	ld	(OFST-3,sp),a
 598  003a 02            	rlwa	x,a
 599                     ; 95 	if( i != 0 )
 601  003b 0d04          	tnz	(OFST-3,sp)
 602  003d 2716          	jreq	L371
 603                     ; 97 		buf[0] = '0' + i;
 605  003f 7b04          	ld	a,(OFST-3,sp)
 606  0041 ab30          	add	a,#48
 607  0043 6b05          	ld	(OFST-2,sp),a
 608                     ; 98 		DISP(buf, 1);
 610  0045 4b01          	push	#1
 611  0047 96            	ldw	x,sp
 612  0048 1c0006        	addw	x,#OFST-1
 613  004b cd0000        	call	_uart1_tx_put
 615  004e 84            	pop	a
 616                     ; 99 		j = 1;
 618  004f a601          	ld	a,#1
 619  0051 6b03          	ld	(OFST-4,sp),a
 621  0053 2014          	jra	L571
 622  0055               L371:
 623                     ; 101 	else if( j == 1 )
 625  0055 7b03          	ld	a,(OFST-4,sp)
 626  0057 a101          	cp	a,#1
 627  0059 260e          	jrne	L571
 628                     ; 103 		buf[0] = '0';
 630  005b a630          	ld	a,#48
 631  005d 6b05          	ld	(OFST-2,sp),a
 632                     ; 104 		DISP(buf, 1);
 634  005f 4b01          	push	#1
 635  0061 96            	ldw	x,sp
 636  0062 1c0006        	addw	x,#OFST-1
 637  0065 cd0000        	call	_uart1_tx_put
 639  0068 84            	pop	a
 640  0069               L571:
 641                     ; 106 	k = ch % 1000;
 643  0069 1e08          	ldw	x,(OFST+1,sp)
 644  006b 90ae03e8      	ldw	y,#1000
 645  006f 65            	divw	x,y
 646  0070 51            	exgw	x,y
 647  0071 1f01          	ldw	(OFST-6,sp),x
 648                     ; 107 	i = k / 100;
 650  0073 1e01          	ldw	x,(OFST-6,sp)
 651  0075 a664          	ld	a,#100
 652  0077 62            	div	x,a
 653  0078 01            	rrwa	x,a
 654  0079 6b04          	ld	(OFST-3,sp),a
 655  007b 02            	rlwa	x,a
 656                     ; 108 	if( i != 0 )
 658  007c 0d04          	tnz	(OFST-3,sp)
 659  007e 2716          	jreq	L102
 660                     ; 110 		buf[0] = '0' + i;
 662  0080 7b04          	ld	a,(OFST-3,sp)
 663  0082 ab30          	add	a,#48
 664  0084 6b05          	ld	(OFST-2,sp),a
 665                     ; 111 		DISP(buf, 1);
 667  0086 4b01          	push	#1
 668  0088 96            	ldw	x,sp
 669  0089 1c0006        	addw	x,#OFST-1
 670  008c cd0000        	call	_uart1_tx_put
 672  008f 84            	pop	a
 673                     ; 112 		j = 1;
 675  0090 a601          	ld	a,#1
 676  0092 6b03          	ld	(OFST-4,sp),a
 678  0094 2014          	jra	L302
 679  0096               L102:
 680                     ; 114 	else if( j == 1 )
 682  0096 7b03          	ld	a,(OFST-4,sp)
 683  0098 a101          	cp	a,#1
 684  009a 260e          	jrne	L302
 685                     ; 116 		buf[0] = '0';
 687  009c a630          	ld	a,#48
 688  009e 6b05          	ld	(OFST-2,sp),a
 689                     ; 117 		DISP(buf, 1);
 691  00a0 4b01          	push	#1
 692  00a2 96            	ldw	x,sp
 693  00a3 1c0006        	addw	x,#OFST-1
 694  00a6 cd0000        	call	_uart1_tx_put
 696  00a9 84            	pop	a
 697  00aa               L302:
 698                     ; 119 	k = ch % 100;
 700  00aa 1e08          	ldw	x,(OFST+1,sp)
 701  00ac a664          	ld	a,#100
 702  00ae 62            	div	x,a
 703  00af 5f            	clrw	x
 704  00b0 97            	ld	xl,a
 705  00b1 1f01          	ldw	(OFST-6,sp),x
 706                     ; 120 	i = k / 10; 
 708  00b3 1e01          	ldw	x,(OFST-6,sp)
 709  00b5 a60a          	ld	a,#10
 710  00b7 62            	div	x,a
 711  00b8 01            	rrwa	x,a
 712  00b9 6b04          	ld	(OFST-3,sp),a
 713  00bb 02            	rlwa	x,a
 714                     ; 121 	if( i != 0 )
 716  00bc 0d04          	tnz	(OFST-3,sp)
 717  00be 2712          	jreq	L702
 718                     ; 123 		buf[0] = '0' + i;
 720  00c0 7b04          	ld	a,(OFST-3,sp)
 721  00c2 ab30          	add	a,#48
 722  00c4 6b05          	ld	(OFST-2,sp),a
 723                     ; 124 		DISP(buf, 1);
 725  00c6 4b01          	push	#1
 726  00c8 96            	ldw	x,sp
 727  00c9 1c0006        	addw	x,#OFST-1
 728  00cc cd0000        	call	_uart1_tx_put
 730  00cf 84            	pop	a
 731                     ; 125 		j = 1;
 734  00d0 2014          	jra	L112
 735  00d2               L702:
 736                     ; 127 	else if( j == 1 )
 738  00d2 7b03          	ld	a,(OFST-4,sp)
 739  00d4 a101          	cp	a,#1
 740  00d6 260e          	jrne	L112
 741                     ; 129 		buf[0] = '0';
 743  00d8 a630          	ld	a,#48
 744  00da 6b05          	ld	(OFST-2,sp),a
 745                     ; 130 		DISP(buf, 1);
 747  00dc 4b01          	push	#1
 748  00de 96            	ldw	x,sp
 749  00df 1c0006        	addw	x,#OFST-1
 750  00e2 cd0000        	call	_uart1_tx_put
 752  00e5 84            	pop	a
 753  00e6               L112:
 754                     ; 132 	i = ch % 10;
 756  00e6 1e08          	ldw	x,(OFST+1,sp)
 757  00e8 a60a          	ld	a,#10
 758  00ea 62            	div	x,a
 759  00eb 5f            	clrw	x
 760  00ec 97            	ld	xl,a
 761  00ed 01            	rrwa	x,a
 762  00ee 6b04          	ld	(OFST-3,sp),a
 763  00f0 02            	rlwa	x,a
 764                     ; 133 	buf[0] = '0' + i;
 766  00f1 7b04          	ld	a,(OFST-3,sp)
 767  00f3 ab30          	add	a,#48
 768  00f5 6b05          	ld	(OFST-2,sp),a
 769                     ; 134 	DISP(buf, 1);
 771  00f7 4b01          	push	#1
 772  00f9 96            	ldw	x,sp
 773  00fa 1c0006        	addw	x,#OFST-1
 774  00fd cd0000        	call	_uart1_tx_put
 776  0100 84            	pop	a
 777                     ; 135 	DISP(" ", 1);
 779  0101 4b01          	push	#1
 780  0103 ae0011        	ldw	x,#L141
 781  0106 cd0000        	call	_uart1_tx_put
 783  0109 84            	pop	a
 784                     ; 136 }
 787  010a 5b09          	addw	sp,#9
 788  010c 81            	ret
 846                     ; 138 void	disp_char(uint8_t ch)
 846                     ; 139 {
 847                     .text:	section	.text,new
 848  0000               _disp_char:
 850  0000 88            	push	a
 851  0001 5205          	subw	sp,#5
 852       00000005      OFST:	set	5
 855                     ; 142 	uint8_t s = 0;
 857  0003 0f01          	clr	(OFST-4,sp)
 858                     ; 144 	i = (ch>>4) & 0x0f;
 860  0005 4e            	swap	a
 861  0006 a40f          	and	a,#15
 862  0008 6b05          	ld	(OFST+0,sp),a
 863                     ; 145 	if( i == 0 )
 865  000a 0d05          	tnz	(OFST+0,sp)
 866  000c 2604          	jrne	L142
 867                     ; 146 		s = 1;
 869  000e a601          	ld	a,#1
 870  0010 6b01          	ld	(OFST-4,sp),a
 871  0012               L142:
 872                     ; 147 	buf[0] = __CharTable[i];
 874  0012 7b05          	ld	a,(OFST+0,sp)
 875  0014 5f            	clrw	x
 876  0015 97            	ld	xl,a
 877  0016 d60000        	ld	a,(___CharTable,x)
 878  0019 6b02          	ld	(OFST-3,sp),a
 879                     ; 149 	i = ch & 0x0f;
 881  001b 7b06          	ld	a,(OFST+1,sp)
 882  001d a40f          	and	a,#15
 883  001f 6b05          	ld	(OFST+0,sp),a
 884                     ; 150 	buf[1] = __CharTable[i];
 886  0021 7b05          	ld	a,(OFST+0,sp)
 887  0023 5f            	clrw	x
 888  0024 97            	ld	xl,a
 889  0025 d60000        	ld	a,(___CharTable,x)
 890  0028 6b03          	ld	(OFST-2,sp),a
 891                     ; 151 	buf[2] = ' ';
 893  002a a620          	ld	a,#32
 894  002c 6b04          	ld	(OFST-1,sp),a
 895                     ; 152 	if( s == 1 )
 897  002e 7b01          	ld	a,(OFST-4,sp)
 898  0030 a101          	cp	a,#1
 899  0032 260c          	jrne	L342
 900                     ; 153 		DISP(&buf[1], 2);
 902  0034 4b02          	push	#2
 903  0036 96            	ldw	x,sp
 904  0037 1c0004        	addw	x,#OFST-1
 905  003a cd0000        	call	_uart1_tx_put
 907  003d 84            	pop	a
 909  003e 200a          	jra	L542
 910  0040               L342:
 911                     ; 155 		DISP(buf, 3);
 913  0040 4b03          	push	#3
 914  0042 96            	ldw	x,sp
 915  0043 1c0003        	addw	x,#OFST-2
 916  0046 cd0000        	call	_uart1_tx_put
 918  0049 84            	pop	a
 919  004a               L542:
 920                     ; 156 }
 923  004a 5b06          	addw	sp,#6
 924  004c 81            	ret
 950                     ; 181 void	clockConfig(void)
 950                     ; 182 {
 951                     .text:	section	.text,new
 952  0000               _clockConfig:
 956                     ; 186 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1); // CLK_PRESCALER_HSIDIV1
 958  0000 4f            	clr	a
 959  0001 cd0000        	call	_CLK_SYSCLKDivConfig
 961                     ; 187 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 963  0004 a601          	ld	a,#1
 964  0006 cd0000        	call	_CLK_SYSCLKSourceConfig
 967  0009               L162:
 968                     ; 189 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
 970  0009 cd0000        	call	_CLK_GetSYSCLKSource
 972  000c a101          	cp	a,#1
 973  000e 26f9          	jrne	L162
 974                     ; 202 }
 977  0010 81            	ret
1012                     	switch	.bss
1013  0000               __i2aBuf:
1014  0000 000000000000  	ds.b	6
1015                     	xdef	__i2aBuf
1016                     	xdef	___CharTable
1017                     	xdef	__strlen
1018                     	xdef	__i2a
1019                     	xdef	_disp_int16
1020                     	xdef	_disp_int
1021                     	xdef	_disp_char
1022                     	xdef	_clockConfig
1023                     	xref	_uart1_tx_put
1024                     	xref	_CLK_SYSCLKDivConfig
1025                     	xref	_CLK_GetSYSCLKSource
1026                     	xref	_CLK_SYSCLKSourceConfig
1027                     	switch	.const
1028  0011               L141:
1029  0011 2000          	dc.b	" ",0
1030                     	xref.b	c_y
1050                     	end
