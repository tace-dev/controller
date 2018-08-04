   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     .const:	section	.text
  22  0000               ___CharTable:
  23  0000 303132333435  	dc.b	"0123456789ABCDEF",0
  91                     ; 6 uint8_t	*_i2a(uint16_t i)
  91                     ; 7 {
  93                     	switch	.text
  94  0000               __i2a:
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
 199  0074 81            	ret	
 241                     ; 30 uint8_t	_strlen(uint8_t *p)
 241                     ; 31 {
 242                     	switch	.text
 243  0075               __strlen:
 245  0075 89            	pushw	x
 246  0076 88            	push	a
 247       00000001      OFST:	set	1
 250                     ; 32 	uint8_t	i=0;
 252  0077 0f01          	clr	(OFST+0,sp)
 253  0079 1e02          	ldw	x,(OFST+1,sp)
 254  007b               L37:
 255                     ; 35 		if( *p == 0 )
 257  007b f6            	ld	a,(x)
 258  007c 2605          	jrne	L77
 259                     ; 36 			return i;
 261  007e 7b01          	ld	a,(OFST+0,sp)
 264  0080 5b03          	addw	sp,#3
 265  0082 81            	ret	
 266  0083               L77:
 267                     ; 37 		i++;
 269  0083 0c01          	inc	(OFST+0,sp)
 270                     ; 38 		p++;
 272  0085 5c            	incw	x
 273  0086 1f02          	ldw	(OFST+1,sp),x
 275  0088 20f1          	jra	L37
 339                     ; 42 void	disp_int(uint8_t ch)
 339                     ; 43 {
 340                     	switch	.text
 341  008a               _disp_int:
 343  008a 88            	push	a
 344  008b 5205          	subw	sp,#5
 345       00000005      OFST:	set	5
 348                     ; 47 	j = 0;
 350  008d 0f01          	clr	(OFST-4,sp)
 351                     ; 48 	i = ch / 100;
 353  008f 5f            	clrw	x
 354  0090 97            	ld	xl,a
 355  0091 a664          	ld	a,#100
 356  0093 62            	div	x,a
 357  0094 9f            	ld	a,xl
 358  0095 6b05          	ld	(OFST+0,sp),a
 359                     ; 49 	if( i != 0 )
 361  0097 2712          	jreq	L131
 362                     ; 51 		buf[0] = '0' + i;
 364  0099 ab30          	add	a,#48
 365  009b 6b02          	ld	(OFST-3,sp),a
 366                     ; 52 		DISP(buf, 1);
 368  009d 4b01          	push	#1
 369  009f 96            	ldw	x,sp
 370  00a0 1c0003        	addw	x,#OFST-2
 371  00a3 cd0000        	call	_uart1_tx_put
 373  00a6 84            	pop	a
 374                     ; 53 		j = 1;
 376  00a7 a601          	ld	a,#1
 377  00a9 6b01          	ld	(OFST-4,sp),a
 379  00ab               L131:
 380                     ; 60 	k = ch % 100;
 382  00ab 7b06          	ld	a,(OFST+1,sp)
 383  00ad 5f            	clrw	x
 384  00ae 97            	ld	xl,a
 385  00af a664          	ld	a,#100
 386  00b1 62            	div	x,a
 387                     ; 61 	i = k / 10; 
 389  00b2 5f            	clrw	x
 390  00b3 97            	ld	xl,a
 391  00b4 a60a          	ld	a,#10
 392  00b6 62            	div	x,a
 393  00b7 9f            	ld	a,xl
 394  00b8 6b05          	ld	(OFST+0,sp),a
 395                     ; 62 	if( i != 0 )
 397  00ba 2704          	jreq	L331
 398                     ; 64 		buf[0] = '0' + i;
 400  00bc ab30          	add	a,#48
 401                     ; 65 		DISP(buf, 1);
 403                     ; 66 		j = 1;
 406  00be 2007          	jp	LC001
 407  00c0               L331:
 408                     ; 68 	else if( j == 1 )
 410  00c0 7b01          	ld	a,(OFST-4,sp)
 411  00c2 4a            	dec	a
 412  00c3 260e          	jrne	L531
 413                     ; 70 		buf[0] = '0';
 415  00c5 a630          	ld	a,#48
 416                     ; 71 		DISP(buf, 1);
 419  00c7               LC001:
 420  00c7 6b02          	ld	(OFST-3,sp),a
 422  00c9 4b01          	push	#1
 423  00cb 96            	ldw	x,sp
 424  00cc 1c0003        	addw	x,#OFST-2
 425  00cf cd0000        	call	_uart1_tx_put
 426  00d2 84            	pop	a
 427  00d3               L531:
 428                     ; 73 	i = ch % 10;
 430  00d3 7b06          	ld	a,(OFST+1,sp)
 431  00d5 5f            	clrw	x
 432  00d6 97            	ld	xl,a
 433  00d7 a60a          	ld	a,#10
 434  00d9 62            	div	x,a
 435  00da 6b05          	ld	(OFST+0,sp),a
 436                     ; 74 	buf[0] = '0' + i;
 438  00dc ab30          	add	a,#48
 439  00de 6b02          	ld	(OFST-3,sp),a
 440                     ; 75 	DISP(buf, 1);
 442  00e0 4b01          	push	#1
 443  00e2 96            	ldw	x,sp
 444  00e3 1c0003        	addw	x,#OFST-2
 445  00e6 cd0000        	call	_uart1_tx_put
 447  00e9 84            	pop	a
 448                     ; 76 	DISP(" ", 1);
 450  00ea 4b01          	push	#1
 451  00ec ae0011        	ldw	x,#L141
 452  00ef cd0000        	call	_uart1_tx_put
 454  00f2 84            	pop	a
 455                     ; 77 }
 458  00f3 5b06          	addw	sp,#6
 459  00f5 81            	ret	
 523                     ; 79 void	disp_int16(uint16_t ch)
 523                     ; 80 {
 524                     	switch	.text
 525  00f6               _disp_int16:
 527  00f6 89            	pushw	x
 528  00f7 5207          	subw	sp,#7
 529       00000007      OFST:	set	7
 532                     ; 85 	j = 0;
 534  00f9 0f03          	clr	(OFST-4,sp)
 535                     ; 86 	i = ch / 10000;
 537  00fb 90ae2710      	ldw	y,#10000
 538  00ff 65            	divw	x,y
 539  0100 01            	rrwa	x,a
 540  0101 6b04          	ld	(OFST-3,sp),a
 541  0103 02            	rlwa	x,a
 542                     ; 87 	if( i != 0 )
 544  0104 0d04          	tnz	(OFST-3,sp)
 545  0106 2714          	jreq	L171
 546                     ; 89 		buf[0] = '0' + i;
 548  0108 7b04          	ld	a,(OFST-3,sp)
 549  010a ab30          	add	a,#48
 550  010c 6b05          	ld	(OFST-2,sp),a
 551                     ; 90 		DISP(buf, 1);
 553  010e 4b01          	push	#1
 554  0110 96            	ldw	x,sp
 555  0111 1c0006        	addw	x,#OFST-1
 556  0114 cd0000        	call	_uart1_tx_put
 558  0117 84            	pop	a
 559                     ; 91 		j = 1;
 561  0118 a601          	ld	a,#1
 562  011a 6b03          	ld	(OFST-4,sp),a
 563  011c               L171:
 564                     ; 93 	k = ch % 10000;
 566  011c 1e08          	ldw	x,(OFST+1,sp)
 567  011e 90ae2710      	ldw	y,#10000
 568  0122 65            	divw	x,y
 569  0123 93            	ldw	x,y
 570  0124 1f01          	ldw	(OFST-6,sp),x
 571                     ; 94 	i = k / 1000;
 573  0126 90ae03e8      	ldw	y,#1000
 574  012a 65            	divw	x,y
 575  012b 01            	rrwa	x,a
 576  012c 6b04          	ld	(OFST-3,sp),a
 577                     ; 95 	if( i != 0 )
 579  012e 2714          	jreq	L371
 580                     ; 97 		buf[0] = '0' + i;
 582  0130 ab30          	add	a,#48
 583  0132 6b05          	ld	(OFST-2,sp),a
 584                     ; 98 		DISP(buf, 1);
 586  0134 4b01          	push	#1
 587  0136 96            	ldw	x,sp
 588  0137 1c0006        	addw	x,#OFST-1
 589  013a cd0000        	call	_uart1_tx_put
 591  013d 84            	pop	a
 592                     ; 99 		j = 1;
 594  013e a601          	ld	a,#1
 595  0140 6b03          	ld	(OFST-4,sp),a
 597  0142 2013          	jra	L571
 598  0144               L371:
 599                     ; 101 	else if( j == 1 )
 601  0144 7b03          	ld	a,(OFST-4,sp)
 602  0146 4a            	dec	a
 603  0147 260e          	jrne	L571
 604                     ; 103 		buf[0] = '0';
 606  0149 a630          	ld	a,#48
 607  014b 6b05          	ld	(OFST-2,sp),a
 608                     ; 104 		DISP(buf, 1);
 610  014d 4b01          	push	#1
 611  014f 96            	ldw	x,sp
 612  0150 1c0006        	addw	x,#OFST-1
 613  0153 cd0000        	call	_uart1_tx_put
 615  0156 84            	pop	a
 616  0157               L571:
 617                     ; 106 	k = ch % 1000;
 619  0157 1e08          	ldw	x,(OFST+1,sp)
 620  0159 90ae03e8      	ldw	y,#1000
 621  015d 65            	divw	x,y
 622  015e 93            	ldw	x,y
 623  015f 1f01          	ldw	(OFST-6,sp),x
 624                     ; 107 	i = k / 100;
 626  0161 a664          	ld	a,#100
 627  0163 62            	div	x,a
 628  0164 01            	rrwa	x,a
 629  0165 6b04          	ld	(OFST-3,sp),a
 630                     ; 108 	if( i != 0 )
 632  0167 2714          	jreq	L102
 633                     ; 110 		buf[0] = '0' + i;
 635  0169 ab30          	add	a,#48
 636  016b 6b05          	ld	(OFST-2,sp),a
 637                     ; 111 		DISP(buf, 1);
 639  016d 4b01          	push	#1
 640  016f 96            	ldw	x,sp
 641  0170 1c0006        	addw	x,#OFST-1
 642  0173 cd0000        	call	_uart1_tx_put
 644  0176 84            	pop	a
 645                     ; 112 		j = 1;
 647  0177 a601          	ld	a,#1
 648  0179 6b03          	ld	(OFST-4,sp),a
 650  017b 2013          	jra	L302
 651  017d               L102:
 652                     ; 114 	else if( j == 1 )
 654  017d 7b03          	ld	a,(OFST-4,sp)
 655  017f 4a            	dec	a
 656  0180 260e          	jrne	L302
 657                     ; 116 		buf[0] = '0';
 659  0182 a630          	ld	a,#48
 660  0184 6b05          	ld	(OFST-2,sp),a
 661                     ; 117 		DISP(buf, 1);
 663  0186 4b01          	push	#1
 664  0188 96            	ldw	x,sp
 665  0189 1c0006        	addw	x,#OFST-1
 666  018c cd0000        	call	_uart1_tx_put
 668  018f 84            	pop	a
 669  0190               L302:
 670                     ; 119 	k = ch % 100;
 672  0190 1e08          	ldw	x,(OFST+1,sp)
 673  0192 a664          	ld	a,#100
 674  0194 62            	div	x,a
 675  0195 5f            	clrw	x
 676  0196 97            	ld	xl,a
 677  0197 1f01          	ldw	(OFST-6,sp),x
 678                     ; 120 	i = k / 10; 
 680  0199 a60a          	ld	a,#10
 681  019b 62            	div	x,a
 682  019c 01            	rrwa	x,a
 683  019d 6b04          	ld	(OFST-3,sp),a
 684                     ; 121 	if( i != 0 )
 686  019f 2704          	jreq	L702
 687                     ; 123 		buf[0] = '0' + i;
 689  01a1 ab30          	add	a,#48
 690                     ; 124 		DISP(buf, 1);
 692                     ; 125 		j = 1;
 695  01a3 2007          	jp	LC002
 696  01a5               L702:
 697                     ; 127 	else if( j == 1 )
 699  01a5 7b03          	ld	a,(OFST-4,sp)
 700  01a7 4a            	dec	a
 701  01a8 260e          	jrne	L112
 702                     ; 129 		buf[0] = '0';
 704  01aa a630          	ld	a,#48
 705                     ; 130 		DISP(buf, 1);
 708  01ac               LC002:
 709  01ac 6b05          	ld	(OFST-2,sp),a
 711  01ae 4b01          	push	#1
 712  01b0 96            	ldw	x,sp
 713  01b1 1c0006        	addw	x,#OFST-1
 714  01b4 cd0000        	call	_uart1_tx_put
 715  01b7 84            	pop	a
 716  01b8               L112:
 717                     ; 132 	i = ch % 10;
 719  01b8 1e08          	ldw	x,(OFST+1,sp)
 720  01ba a60a          	ld	a,#10
 721  01bc 62            	div	x,a
 722  01bd 5f            	clrw	x
 723  01be 97            	ld	xl,a
 724  01bf 01            	rrwa	x,a
 725  01c0 6b04          	ld	(OFST-3,sp),a
 726                     ; 133 	buf[0] = '0' + i;
 728  01c2 ab30          	add	a,#48
 729  01c4 6b05          	ld	(OFST-2,sp),a
 730                     ; 134 	DISP(buf, 1);
 732  01c6 4b01          	push	#1
 733  01c8 96            	ldw	x,sp
 734  01c9 1c0006        	addw	x,#OFST-1
 735  01cc cd0000        	call	_uart1_tx_put
 737  01cf 84            	pop	a
 738                     ; 135 	DISP(" ", 1);
 740  01d0 4b01          	push	#1
 741  01d2 ae0011        	ldw	x,#L141
 742  01d5 cd0000        	call	_uart1_tx_put
 744  01d8 84            	pop	a
 745                     ; 136 }
 748  01d9 5b09          	addw	sp,#9
 749  01db 81            	ret	
 807                     ; 138 void	disp_char(uint8_t ch)
 807                     ; 139 {
 808                     	switch	.text
 809  01dc               _disp_char:
 811  01dc 88            	push	a
 812  01dd 5205          	subw	sp,#5
 813       00000005      OFST:	set	5
 816                     ; 142 	uint8_t s = 0;
 818  01df 0f01          	clr	(OFST-4,sp)
 819                     ; 144 	i = (ch>>4) & 0x0f;
 821  01e1 4e            	swap	a
 822  01e2 a40f          	and	a,#15
 823  01e4 6b05          	ld	(OFST+0,sp),a
 824                     ; 145 	if( i == 0 )
 826  01e6 2605          	jrne	L142
 827                     ; 146 		s = 1;
 829  01e8 4c            	inc	a
 830  01e9 6b01          	ld	(OFST-4,sp),a
 831  01eb 7b05          	ld	a,(OFST+0,sp)
 832  01ed               L142:
 833                     ; 147 	buf[0] = __CharTable[i];
 835  01ed 5f            	clrw	x
 836  01ee 97            	ld	xl,a
 837  01ef d60000        	ld	a,(___CharTable,x)
 838  01f2 6b02          	ld	(OFST-3,sp),a
 839                     ; 149 	i = ch & 0x0f;
 841  01f4 7b06          	ld	a,(OFST+1,sp)
 842  01f6 a40f          	and	a,#15
 843  01f8 6b05          	ld	(OFST+0,sp),a
 844                     ; 150 	buf[1] = __CharTable[i];
 846  01fa 5f            	clrw	x
 847  01fb 97            	ld	xl,a
 848  01fc d60000        	ld	a,(___CharTable,x)
 849  01ff 6b03          	ld	(OFST-2,sp),a
 850                     ; 151 	buf[2] = ' ';
 852  0201 a620          	ld	a,#32
 853  0203 6b04          	ld	(OFST-1,sp),a
 854                     ; 152 	if( s == 1 )
 856  0205 7b01          	ld	a,(OFST-4,sp)
 857  0207 4a            	dec	a
 858  0208 2608          	jrne	L342
 859                     ; 153 		DISP(&buf[1], 2);
 861  020a 4b02          	push	#2
 862  020c 96            	ldw	x,sp
 863  020d 1c0004        	addw	x,#OFST-1
 866  0210 2006          	jra	L542
 867  0212               L342:
 868                     ; 155 		DISP(buf, 3);
 870  0212 4b03          	push	#3
 871  0214 96            	ldw	x,sp
 872  0215 1c0003        	addw	x,#OFST-2
 874  0218               L542:
 875  0218 cd0000        	call	_uart1_tx_put
 876  021b 84            	pop	a
 877                     ; 156 }
 880  021c 5b06          	addw	sp,#6
 881  021e 81            	ret	
 907                     ; 181 void	clockConfig(void)
 907                     ; 182 {
 908                     	switch	.text
 909  021f               _clockConfig:
 913                     ; 186 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1); // CLK_PRESCALER_HSIDIV1
 915  021f 4f            	clr	a
 916  0220 cd0000        	call	_CLK_SYSCLKDivConfig
 918                     ; 187 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 920  0223 a601          	ld	a,#1
 921  0225 cd0000        	call	_CLK_SYSCLKSourceConfig
 924  0228               L162:
 925                     ; 189 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
 927  0228 cd0000        	call	_CLK_GetSYSCLKSource
 929  022b 4a            	dec	a
 930  022c 26fa          	jrne	L162
 931                     ; 202 }
 934  022e 81            	ret	
 969                     	switch	.bss
 970  0000               __i2aBuf:
 971  0000 000000000000  	ds.b	6
 972                     	xdef	__i2aBuf
 973                     	xdef	___CharTable
 974                     	xdef	__strlen
 975                     	xdef	__i2a
 976                     	xdef	_disp_int16
 977                     	xdef	_disp_int
 978                     	xdef	_disp_char
 979                     	xdef	_clockConfig
 980                     	xref	_uart1_tx_put
 981                     	xref	_CLK_SYSCLKDivConfig
 982                     	xref	_CLK_GetSYSCLKSource
 983                     	xref	_CLK_SYSCLKSourceConfig
 984                     	switch	.const
 985  0011               L141:
 986  0011 2000          	dc.b	" ",0
 987                     	xref.b	c_y
1007                     	end
