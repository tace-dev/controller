   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               __fs:
  24  0000 00            	dc.b	0
  25  0001               __fs2:
  26  0001 00            	dc.b	0
  80                     ; 78 void	factory2wire(void)
  80                     ; 79 {
  82                     .text:	section	.text,new
  83  0000               _factory2wire:
  85  0000 5203          	subw	sp,#3
  86       00000003      OFST:	set	3
  89                     ; 82 	if( _io_head != _io_tail )
  91  0002 c60000        	ld	a,__io_head
  92  0005 c10000        	cp	a,__io_tail
  93  0008 272c          	jreq	L13
  94                     ; 84 		i = iouart_Ready();
  96  000a cd0000        	call	_iouart_Ready
  98  000d 6b01          	ld	(OFST-2,sp),a
  99                     ; 85 		if( i==1 )
 101  000f 4a            	dec	a
 102  0010 2624          	jrne	L13
 103                     ; 87 			p = iouart_getBuffer();
 105  0012 cd0000        	call	_iouart_getBuffer
 107  0015 1f02          	ldw	(OFST-1,sp),x
 108                     ; 88 			p[0] = 0x0;
 110  0017 7f            	clr	(x)
 111                     ; 89 			p[1] = 0x1;
 113  0018 a601          	ld	a,#1
 114  001a e701          	ld	(1,x),a
 115                     ; 90 			p[2] = 0x2;
 117  001c 4c            	inc	a
 118  001d e702          	ld	(2,x),a
 119                     ; 91 			p[3] = 0x3;
 121  001f 4c            	inc	a
 122  0020 e703          	ld	(3,x),a
 123                     ; 92 			p[4] = 0x4;
 125  0022 4c            	inc	a
 126  0023 e704          	ld	(4,x),a
 127                     ; 93 			p[5] = 0x5;
 129  0025 4c            	inc	a
 130  0026 e705          	ld	(5,x),a
 131                     ; 94 			p[6] = 0x6;
 133  0028 4c            	inc	a
 134  0029 e706          	ld	(6,x),a
 135                     ; 95 			p[7] = 0x15;
 137  002b a615          	ld	a,#21
 138  002d e707          	ld	(7,x),a
 139                     ; 96 			iouart_Set_Packet(0);
 141  002f 4f            	clr	a
 142  0030 cd0000        	call	_iouart_Set_Packet
 144                     ; 97 			iouart_Pkt_Start();
 146  0033 cd0000        	call	_iouart_Pkt_Start
 148  0036               L13:
 149                     ; 132 }
 152  0036 5b03          	addw	sp,#3
 153  0038 81            	ret	
 187                     ; 545 void	_factoryCntl(uint8_t i)
 187                     ; 546 {
 188                     .text:	section	.text,new
 189  0000               __factoryCntl:
 191  0000 88            	push	a
 192       00000000      OFST:	set	0
 195                     ; 553 	lcd_disp_n(0, i);
 197  0001 97            	ld	xl,a
 198  0002 4f            	clr	a
 199  0003 95            	ld	xh,a
 200  0004 cd0000        	call	_lcd_disp_n
 202                     ; 554 	lcd_disp_n(1, i);
 204  0007 7b01          	ld	a,(OFST+1,sp)
 205  0009 97            	ld	xl,a
 206  000a a601          	ld	a,#1
 207  000c 95            	ld	xh,a
 208  000d cd0000        	call	_lcd_disp_n
 210                     ; 555 	_fs = 2;
 212  0010 35020000      	mov	__fs,#2
 213                     ; 557 }
 216  0014 84            	pop	a
 217  0015 81            	ret	
 220                     	switch	.data
 221  0002               ___enc:
 222  0002 01            	dc.b	1
 223  0003               ___lcd:
 224  0003 00            	dc.b	0
 225  0004               ___lcdi:
 226  0004 00            	dc.b	0
 227  0005               __key_first:
 228  0005 00            	dc.b	0
 287                     ; 698 void	factoryDw(void)
 287                     ; 699 {
 288                     .text:	section	.text,new
 289  0000               _factoryDw:
 291  0000 89            	pushw	x
 292       00000002      OFST:	set	2
 295                     ; 707 	if( _fs == 0 )
 297  0001 c60000        	ld	a,__fs
 298  0004 260f          	jrne	L76
 299                     ; 709 		_fs = 1;
 301  0006 35010000      	mov	__fs,#1
 302                     ; 710 		__f[0] = __timer1s;
 304  000a 5500000000    	mov	___f,___timer1s
 305                     ; 712 		lcd_disp_all();
 307  000f cd0000        	call	_lcd_disp_all
 310  0012 cc0151        	jra	L17
 311  0015               L76:
 312                     ; 714 	else if( _fs == 1 )
 314  0015 a101          	cp	a,#1
 315  0017 2703cc0116    	jrne	L37
 316                     ; 716 		key = 0;
 318  001c 0f02          	clr	(OFST+0,sp)
 320  001e cc00b0        	jra	L101
 321  0021               L57:
 322                     ; 719 			i = uart1_get();
 324  0021 cd0000        	call	_uart1_get
 326  0024 6b01          	ld	(OFST-1,sp),a
 327                     ; 720 			if( i != 0xff )
 329  0026 4c            	inc	a
 330  0027 2603cc00ad    	jreq	L501
 331                     ; 722 				tc[tci] = i;
 333  002c c60000        	ld	a,_tci
 334  002f 5f            	clrw	x
 335  0030 97            	ld	xl,a
 336  0031 7b01          	ld	a,(OFST-1,sp)
 337  0033 d70000        	ld	(_tc,x),a
 338                     ; 723 				tci = tci==0 ? 1 : 0;
 340  0036 c60000        	ld	a,_tci
 341  0039 2603          	jrne	L23
 342  003b 4c            	inc	a
 343  003c 2001          	jra	L43
 344  003e               L23:
 345  003e 4f            	clr	a
 346  003f               L43:
 347  003f c70000        	ld	_tci,a
 348                     ; 724 				if( tci != 0 )
 350  0042 266c          	jrne	L101
 351                     ; 725 					continue;
 353                     ; 727 				i = tc[0] + tc[1];
 355  0044 c60000        	ld	a,_tc
 356  0047 cb0001        	add	a,_tc+1
 357  004a 6b01          	ld	(OFST-1,sp),a
 358                     ; 728 				if( i != 0xff )
 360  004c 4c            	inc	a
 361  004d 2661          	jrne	L101
 362                     ; 729 					continue;
 364                     ; 731 				key = _touchKey(0, 0x01, 0x01);
 366  004f 4b01          	push	#1
 367  0051 ae0001        	ldw	x,#1
 368  0054 cd0000        	call	__touchKey
 370  0057 5b01          	addw	sp,#1
 371  0059 6b02          	ld	(OFST+0,sp),a
 372                     ; 732 				key |= _touchKey(1, 0x02, 0x04);
 374  005b 4b04          	push	#4
 375  005d ae0102        	ldw	x,#258
 376  0060 cd0000        	call	__touchKey
 378  0063 5b01          	addw	sp,#1
 379  0065 1a02          	or	a,(OFST+0,sp)
 380  0067 6b02          	ld	(OFST+0,sp),a
 381                     ; 733 				key |= _touchKey(2, 0x04, 0x10);
 383  0069 4b10          	push	#16
 384  006b ae0204        	ldw	x,#516
 385  006e cd0000        	call	__touchKey
 387  0071 5b01          	addw	sp,#1
 388  0073 1a02          	or	a,(OFST+0,sp)
 389  0075 6b02          	ld	(OFST+0,sp),a
 390                     ; 734 				key |= _touchKey(3, 0x08, 0x02);
 392  0077 4b02          	push	#2
 393  0079 ae0308        	ldw	x,#776
 394  007c cd0000        	call	__touchKey
 396  007f 5b01          	addw	sp,#1
 397  0081 1a02          	or	a,(OFST+0,sp)
 398  0083 6b02          	ld	(OFST+0,sp),a
 399                     ; 735 				key |= _touchKey(4, 0x10, 0x08);
 401  0085 4b08          	push	#8
 402  0087 ae0410        	ldw	x,#1040
 403  008a cd0000        	call	__touchKey
 405  008d 5b01          	addw	sp,#1
 406  008f 1a02          	or	a,(OFST+0,sp)
 407  0091 6b02          	ld	(OFST+0,sp),a
 408                     ; 736 				key |= _touchKey(5, 0x20, 0x20);
 410  0093 4b20          	push	#32
 411  0095 ae0520        	ldw	x,#1312
 412  0098 cd0000        	call	__touchKey
 414  009b 5b01          	addw	sp,#1
 415  009d 1a02          	or	a,(OFST+0,sp)
 416  009f 6b02          	ld	(OFST+0,sp),a
 417                     ; 737 				if( _tcKey == 0 )
 419  00a1 c60000        	ld	a,__tcKey
 420  00a4 270a          	jreq	L101
 421                     ; 738 					continue;
 423                     ; 741 				_tctimer100ms[0] = __timer1s;
 425  00a6 5500000000    	mov	__tctimer100ms,___timer1s
 427  00ab 2003          	jra	L101
 428  00ad               L501:
 429                     ; 744 				tci = 0;
 431  00ad c70000        	ld	_tci,a
 432  00b0               L101:
 433                     ; 717 		while( _uart1_rx_tail != _uart1_rx_head )
 435  00b0 c60000        	ld	a,__uart1_rx_tail
 436  00b3 c10000        	cp	a,__uart1_rx_head
 437  00b6 2703cc0021    	jrne	L57
 438                     ; 746 		if( _tctimer100ms[0] != __timer1s )
 440  00bb c60000        	ld	a,__tctimer100ms
 441  00be c10000        	cp	a,___timer1s
 442  00c1 2713          	jreq	L711
 443                     ; 748 			_tctimer100ms[0] = __timer1s;
 445  00c3 5500000000    	mov	__tctimer100ms,___timer1s
 446                     ; 749 			if( _key_first == 1 )
 448  00c8 c60005        	ld	a,__key_first
 449  00cb 4a            	dec	a
 450  00cc 2605          	jrne	L121
 451                     ; 750 				lcd_clear(0);
 453  00ce cd0000        	call	_lcd_clear
 456  00d1 2003          	jra	L711
 457  00d3               L121:
 458                     ; 752 				lcd_disp_all();
 460  00d3 cd0000        	call	_lcd_disp_all
 462  00d6               L711:
 463                     ; 756 		if( key != 0 )
 465  00d6 7b02          	ld	a,(OFST+0,sp)
 466  00d8 2777          	jreq	L17
 467                     ; 758 			lcd_clear(0);
 469  00da 4f            	clr	a
 470  00db cd0000        	call	_lcd_clear
 472                     ; 759 			if( key == 1 )	_fs = 10;
 474  00de 7b02          	ld	a,(OFST+0,sp)
 475  00e0 a101          	cp	a,#1
 476  00e2 2604          	jrne	L721
 479  00e4 350a0000      	mov	__fs,#10
 480  00e8               L721:
 481                     ; 760 			if( key == 2 )	_fs = 11;
 483  00e8 a102          	cp	a,#2
 484  00ea 2604          	jrne	L131
 487  00ec 350b0000      	mov	__fs,#11
 488  00f0               L131:
 489                     ; 761 			if( key == 4 )	_fs = 12;
 491  00f0 a104          	cp	a,#4
 492  00f2 2604          	jrne	L331
 495  00f4 350c0000      	mov	__fs,#12
 496  00f8               L331:
 497                     ; 762 			if( key == 8 )	_fs = 13;
 499  00f8 a108          	cp	a,#8
 500  00fa 2604          	jrne	L531
 503  00fc 350d0000      	mov	__fs,#13
 504  0100               L531:
 505                     ; 763 			if( key == 16 )	_fs = 14;
 507  0100 a110          	cp	a,#16
 508  0102 2604          	jrne	L731
 511  0104 350e0000      	mov	__fs,#14
 512  0108               L731:
 513                     ; 764 			if( key == 32 )	_fs = 15;
 515  0108 a120          	cp	a,#32
 516  010a 2604          	jrne	L141
 519  010c 350f0000      	mov	__fs,#15
 520  0110               L141:
 521                     ; 765 			_key_first = 1;
 523  0110 35010005      	mov	__key_first,#1
 524  0114 203b          	jra	L17
 525  0116               L37:
 526                     ; 768 	else if( _fs == 2 )
 528  0116 a102          	cp	a,#2
 529  0118 2606          	jrne	L541
 530                     ; 770 		_fs = 1;
 532  011a 35010000      	mov	__fs,#1
 534  011e 2031          	jra	L17
 535  0120               L541:
 536                     ; 772 	else if( _fs == 10 )	_factoryCntl(1);
 538  0120 a10a          	cp	a,#10
 539  0122 2604          	jrne	L151
 542  0124 a601          	ld	a,#1
 545  0126 2026          	jp	LC001
 546  0128               L151:
 547                     ; 773 	else if( _fs == 11 )	_factoryCntl(2);
 549  0128 a10b          	cp	a,#11
 550  012a 2604          	jrne	L551
 553  012c a602          	ld	a,#2
 556  012e 201e          	jp	LC001
 557  0130               L551:
 558                     ; 774 	else if( _fs == 12 )	_factoryCntl(3);
 560  0130 a10c          	cp	a,#12
 561  0132 2604          	jrne	L161
 564  0134 a603          	ld	a,#3
 567  0136 2016          	jp	LC001
 568  0138               L161:
 569                     ; 775 	else if( _fs == 13 )	_factoryCntl(4);
 571  0138 a10d          	cp	a,#13
 572  013a 2604          	jrne	L561
 575  013c a604          	ld	a,#4
 578  013e 200e          	jp	LC001
 579  0140               L561:
 580                     ; 776 	else if( _fs == 14 )	_factoryCntl(5);
 582  0140 a10e          	cp	a,#14
 583  0142 2604          	jrne	L171
 586  0144 a605          	ld	a,#5
 589  0146 2006          	jp	LC001
 590  0148               L171:
 591                     ; 777 	else if( _fs == 15 )	_factoryCntl(6);
 593  0148 a10f          	cp	a,#15
 594  014a 2605          	jrne	L17
 597  014c a606          	ld	a,#6
 598  014e               LC001:
 599  014e cd0000        	call	__factoryCntl
 601  0151               L17:
 602                     ; 778 	if( (__timer100ms%2) == __lcdi )
 604  0151 c60000        	ld	a,___timer100ms
 605  0154 a401          	and	a,#1
 606  0156 c10004        	cp	a,___lcdi
 607  0159 262c          	jrne	L771
 608                     ; 780 		__lcdi = __timer100ms%2;
 610  015b c60000        	ld	a,___timer100ms
 611  015e a401          	and	a,#1
 612  0160 c70004        	ld	___lcdi,a
 613                     ; 781 		if( __lcd == 0 )
 615  0163 c60003        	ld	a,___lcd
 616  0166 2613          	jrne	L102
 617                     ; 783 			__lcd = 1;
 619  0168 35010003      	mov	___lcd,#1
 620                     ; 784 			_backlight++;
 622  016c 725c0000      	inc	__backlight
 623                     ; 785 			if( _backlight == 24 )
 625  0170 c60000        	ld	a,__backlight
 626  0173 a118          	cp	a,#24
 627  0175 2604          	jrne	L102
 628                     ; 786 				_backlight = 12;
 630  0177 350c0000      	mov	__backlight,#12
 631  017b               L102:
 632                     ; 788 		i = adcGet(1);
 634  017b a601          	ld	a,#1
 635  017d cd0000        	call	_adcGet
 637  0180 6b01          	ld	(OFST-1,sp),a
 638                     ; 789 		ui_disp_temp_setup(i);
 640  0182 cd0000        	call	_ui_disp_temp_setup
 643  0185 2004          	jra	L502
 644  0187               L771:
 645                     ; 792 		__lcd = 0;
 647  0187 725f0003      	clr	___lcd
 648  018b               L502:
 649                     ; 794 	factory2wire();
 651  018b cd0000        	call	_factory2wire
 653                     ; 795 }
 656  018e 85            	popw	x
 657  018f 81            	ret	
 691                     ; 820 uint8_t factory(uint8_t mode)
 691                     ; 821 {
 692                     .text:	section	.text,new
 693  0000               _factory:
 697                     ; 822 	timerCalc();
 699  0000 cd0000        	call	_timerCalc
 701                     ; 837 	factoryDw();
 704                     ; 840 }
 707  0003 cc0000        	jp	_factoryDw
 774                     	xdef	_factory
 775                     	xdef	_factoryDw
 776                     	xref	__tctimer100ms
 777                     	xref	__uart1_rx_tail
 778                     	xref	__uart1_rx_head
 779                     	xref	__touchKey
 780                     	xref	__tcKey
 781                     	xref	_tci
 782                     	xref	_tc
 783                     	xref	__backlight
 784                     	xref	_lcd_disp_all
 785                     	xdef	__key_first
 786                     	xdef	___lcdi
 787                     	xdef	___lcd
 788                     	xdef	___enc
 789                     	xref	_ui_disp_temp_setup
 790                     	xref	_lcd_clear
 791                     	xdef	__factoryCntl
 792                     	xdef	_factory2wire
 793                     	xdef	__fs2
 794                     	xdef	__fs
 795                     	switch	.bss
 796  0000               ___f:
 797  0000 000000000000  	ds.b	8
 798                     	xdef	___f
 799                     	xref	_lcd_disp_n
 800                     	xref	_timerCalc
 801                     	xref	___timer1s
 802                     	xref	___timer100ms
 803                     	xref	_uart1_get
 804                     	xref	_iouart_getBuffer
 805                     	xref	_iouart_Ready
 806                     	xref	__io_tail
 807                     	xref	__io_head
 808                     	xref	_iouart_Pkt_Start
 809                     	xref	_iouart_Set_Packet
 810                     	xref	_adcGet
 830                     	end
