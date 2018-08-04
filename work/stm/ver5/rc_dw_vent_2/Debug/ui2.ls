   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  61                     ; 5 void	ui_disp_clear_tSetup(uint8_t i)
  61                     ; 6 {
  62                     .text:	section	.text,new
  63  0000               f_ui_disp_clear_tSetup:
  65  0000 88            	push	a
  66       00000000      OFST:	set	0
  69                     ; 7 	lcd_clear_npos(2, 0);
  71  0001 ae0200        	ldw	x,#512
  72  0004 8d000000      	callf	f_lcd_clear_npos
  74                     ; 8 	lcd_clear_npos(3, 0);
  76  0008 ae0300        	ldw	x,#768
  77  000b 8d000000      	callf	f_lcd_clear_npos
  79                     ; 9 	lcd_clear_npos(5, 0);
  81  000f ae0500        	ldw	x,#1280
  82  0012 8d000000      	callf	f_lcd_clear_npos
  84                     ; 14 	if (i == 1) {
  86                     ; 19 }
  89  0016 84            	pop	a
  90  0017 87            	retf	
 121                     ; 21 void	ui_disp_set_tSetup(uint8_t i)
 121                     ; 22 {
 122                     .text:	section	.text,new
 123  0000               f_ui_disp_set_tSetup:
 127                     ; 25 }
 130  0000 87            	retf	
 163                     ; 27 void	__ui_disp_temp_c(uint8_t i)
 163                     ; 28 {
 164                     .text:	section	.text,new
 165  0000               f___ui_disp_temp_c:
 167  0000 88            	push	a
 168       00000000      OFST:	set	0
 171                     ; 29 	LCD_BIT_CLEAR(bT3);
 173  0001 c60000        	ld	a,_iLF_DEF
 174  0004 5f            	clrw	x
 175  0005 97            	ld	xl,a
 176  0006 c60000        	ld	a,_bLF_DEF
 177  0009 43            	cpl	a
 178  000a d4540c        	and	a,(21516,x)
 179  000d d7540c        	ld	(21516,x),a
 180                     ; 30 	LCD_BIT_CLEAR(bT5);
 182  0010 c6000d        	ld	a,_iLF_DEF+13
 183  0013 5f            	clrw	x
 184  0014 97            	ld	xl,a
 185  0015 c6000d        	ld	a,_bLF_DEF+13
 186  0018 43            	cpl	a
 187  0019 d4540c        	and	a,(21516,x)
 188  001c d7540c        	ld	(21516,x),a
 189                     ; 31 	if( i&0x01 )
 191  001f 7b01          	ld	a,(OFST+1,sp)
 192  0021 a501          	bcp	a,#1
 193  0023 2710          	jreq	L75
 194                     ; 33 		LCD_BIT_SET(bT3);
 196  0025 c60000        	ld	a,_iLF_DEF
 197  0028 5f            	clrw	x
 198  0029 97            	ld	xl,a
 199  002a d6540c        	ld	a,(21516,x)
 200  002d ca0000        	or	a,_bLF_DEF
 201  0030 d7540c        	ld	(21516,x),a
 202  0033 7b01          	ld	a,(OFST+1,sp)
 203  0035               L75:
 204                     ; 35 	if( i&0x02 )
 206  0035 a502          	bcp	a,#2
 207  0037 270e          	jreq	L16
 208                     ; 37 		LCD_BIT_SET(bT5);
 210  0039 c6000d        	ld	a,_iLF_DEF+13
 211  003c 5f            	clrw	x
 212  003d 97            	ld	xl,a
 213  003e d6540c        	ld	a,(21516,x)
 214  0041 ca000d        	or	a,_bLF_DEF+13
 215  0044 d7540c        	ld	(21516,x),a
 216  0047               L16:
 217                     ; 39 }
 220  0047 84            	pop	a
 221  0048 87            	retf	
 254                     ; 41 void	ui_disp_temp_c(uint8_t i)
 254                     ; 42 {
 255                     .text:	section	.text,new
 256  0000               f_ui_disp_temp_c:
 260                     ; 43 	if( i == 0 )
 262  0000 4d            	tnz	a
 263  0001 261d          	jrne	L77
 264                     ; 45 		LCD_BIT_CLEAR(bT3);
 266  0003 c60000        	ld	a,_iLF_DEF
 267  0006 5f            	clrw	x
 268  0007 97            	ld	xl,a
 269  0008 c60000        	ld	a,_bLF_DEF
 270  000b 43            	cpl	a
 271  000c d4540c        	and	a,(21516,x)
 272  000f d7540c        	ld	(21516,x),a
 273                     ; 46 		LCD_BIT_CLEAR(bT5);
 275  0012 c6000d        	ld	a,_iLF_DEF+13
 276  0015 5f            	clrw	x
 277  0016 97            	ld	xl,a
 278  0017 c6000d        	ld	a,_bLF_DEF+13
 279  001a 43            	cpl	a
 280  001b d4540c        	and	a,(21516,x)
 282  001e 2019          	jra	L101
 283  0020               L77:
 284                     ; 50 		LCD_BIT_SET(bT3);
 286  0020 c60000        	ld	a,_iLF_DEF
 287  0023 5f            	clrw	x
 288  0024 97            	ld	xl,a
 289  0025 d6540c        	ld	a,(21516,x)
 290  0028 ca0000        	or	a,_bLF_DEF
 291  002b d7540c        	ld	(21516,x),a
 292                     ; 51 		LCD_BIT_SET(bT5);
 294  002e c6000d        	ld	a,_iLF_DEF+13
 295  0031 5f            	clrw	x
 296  0032 97            	ld	xl,a
 297  0033 d6540c        	ld	a,(21516,x)
 298  0036 ca000d        	or	a,_bLF_DEF+13
 299  0039               L101:
 300  0039 d7540c        	ld	(21516,x),a
 301                     ; 53 }
 304  003c 87            	retf	
 336                     ; 55 void	ui_disp_temp_mark(uint8_t i)
 336                     ; 56 {
 337                     .text:	section	.text,new
 338  0000               f_ui_disp_temp_mark:
 340  0000 88            	push	a
 341       00000000      OFST:	set	0
 344                     ; 57 	if( i == 0 )
 346  0001 4d            	tnz	a
 348                     ; 68 	ui_disp_temp_c(i);
 350  0002 7b01          	ld	a,(OFST+1,sp)
 351  0004 8d000000      	callf	f_ui_disp_temp_c
 353                     ; 70 }
 356  0008 84            	pop	a
 357  0009 87            	retf	
 406                     ; 72 void	ui_disp_temp_setup(uint8_t i)
 406                     ; 73 {
 407                     .text:	section	.text,new
 408  0000               f_ui_disp_temp_setup:
 410  0000 89            	pushw	x
 411       00000002      OFST:	set	2
 414                     ; 75 	a = i/2;
 416  0001 5f            	clrw	x
 417  0002 97            	ld	xl,a
 418  0003 57            	sraw	x
 419  0004 01            	rrwa	x,a
 420  0005 6b02          	ld	(OFST+0,sp),a
 421  0007 02            	rlwa	x,a
 422                     ; 76 	b = i%2;
 424  0008 a401          	and	a,#1
 425  000a 6b01          	ld	(OFST-1,sp),a
 426                     ; 77 	lcd_clear_npos(5, 0);
 428  000c ae0500        	ldw	x,#1280
 429  000f 8d000000      	callf	f_lcd_clear_npos
 431                     ; 78 	LCD_BIT_CLEAR(bP2);
 433  0013 c60044        	ld	a,_iLF_DEF+68
 434  0016 5f            	clrw	x
 435  0017 97            	ld	xl,a
 436  0018 c60044        	ld	a,_bLF_DEF+68
 437  001b 43            	cpl	a
 438  001c d4540c        	and	a,(21516,x)
 439  001f d7540c        	ld	(21516,x),a
 440                     ; 79 	lcd_disp_n(2, a/10);
 442  0022 7b02          	ld	a,(OFST+0,sp)
 443  0024 5f            	clrw	x
 444  0025 97            	ld	xl,a
 445  0026 a60a          	ld	a,#10
 446  0028 62            	div	x,a
 447  0029 a602          	ld	a,#2
 448  002b 95            	ld	xh,a
 449  002c 8d000000      	callf	f_lcd_disp_n
 451                     ; 80 	lcd_disp_n(3, a%10);
 453  0030 7b02          	ld	a,(OFST+0,sp)
 454  0032 5f            	clrw	x
 455  0033 97            	ld	xl,a
 456  0034 a60a          	ld	a,#10
 457  0036 62            	div	x,a
 458  0037 97            	ld	xl,a
 459  0038 a603          	ld	a,#3
 460  003a 95            	ld	xh,a
 461  003b 8d000000      	callf	f_lcd_disp_n
 463                     ; 82 	if( b != 0 )
 465  003f 7b01          	ld	a,(OFST-1,sp)
 466  0041 2715          	jreq	L541
 467                     ; 84 		lcd_disp_n(5, 5);
 469  0043 ae0505        	ldw	x,#1285
 470  0046 8d000000      	callf	f_lcd_disp_n
 472                     ; 85 		LCD_BIT_SET(bP2);
 474  004a c60044        	ld	a,_iLF_DEF+68
 475  004d 5f            	clrw	x
 476  004e 97            	ld	xl,a
 477  004f d6540c        	ld	a,(21516,x)
 478  0052 ca0044        	or	a,_bLF_DEF+68
 479  0055 d7540c        	ld	(21516,x),a
 481  0058               L541:
 482                     ; 91 }
 485  0058 85            	popw	x
 486  0059 87            	retf	
 535                     ; 93 void	ui_disp_temp_curr(uint8_t i)
 535                     ; 94 {
 536                     .text:	section	.text,new
 537  0000               f_ui_disp_temp_curr:
 539  0000 89            	pushw	x
 540       00000002      OFST:	set	2
 543                     ; 96 	a = i/2;
 545  0001 5f            	clrw	x
 546  0002 97            	ld	xl,a
 547  0003 57            	sraw	x
 548  0004 01            	rrwa	x,a
 549  0005 6b02          	ld	(OFST+0,sp),a
 550  0007 02            	rlwa	x,a
 551                     ; 97 	b = i%2;
 553  0008 a401          	and	a,#1
 554  000a 6b01          	ld	(OFST-1,sp),a
 555                     ; 98 	lcd_clear_npos(4, 0);
 557  000c ae0400        	ldw	x,#1024
 558  000f 8d000000      	callf	f_lcd_clear_npos
 560                     ; 99 	lcd_clear_npos(0, 0);
 562  0013 5f            	clrw	x
 563  0014 8d000000      	callf	f_lcd_clear_npos
 565                     ; 100 	LCD_BIT_CLEAR(bP1);
 567  0018 c60040        	ld	a,_iLF_DEF+64
 568  001b 5f            	clrw	x
 569  001c 97            	ld	xl,a
 570  001d c60040        	ld	a,_bLF_DEF+64
 571  0020 43            	cpl	a
 572  0021 d4540c        	and	a,(21516,x)
 573  0024 d7540c        	ld	(21516,x),a
 574                     ; 101 	if( (a/10) != 0 )
 576  0027 7b02          	ld	a,(OFST+0,sp)
 577  0029 5f            	clrw	x
 578  002a 97            	ld	xl,a
 579  002b a60a          	ld	a,#10
 580  002d 8d000000      	callf	d_sdivx
 582  0031 5d            	tnzw	x
 583  0032 270d          	jreq	L761
 584                     ; 103 		lcd_disp_n(0, a/10);
 586  0034 7b02          	ld	a,(OFST+0,sp)
 587  0036 5f            	clrw	x
 588  0037 97            	ld	xl,a
 589  0038 a60a          	ld	a,#10
 590  003a 62            	div	x,a
 591  003b 4f            	clr	a
 592  003c 95            	ld	xh,a
 593  003d 8d000000      	callf	f_lcd_disp_n
 595  0041               L761:
 596                     ; 105 	lcd_disp_n(1, a%10);
 598  0041 7b02          	ld	a,(OFST+0,sp)
 599  0043 5f            	clrw	x
 600  0044 97            	ld	xl,a
 601  0045 a60a          	ld	a,#10
 602  0047 62            	div	x,a
 603  0048 97            	ld	xl,a
 604  0049 a601          	ld	a,#1
 605  004b 95            	ld	xh,a
 606  004c 8d000000      	callf	f_lcd_disp_n
 608                     ; 107 	if( b != 0 )
 610  0050 7b01          	ld	a,(OFST-1,sp)
 611  0052 2715          	jreq	L371
 612                     ; 109 		lcd_disp_n(4, 5);
 614  0054 ae0405        	ldw	x,#1029
 615  0057 8d000000      	callf	f_lcd_disp_n
 617                     ; 110 		LCD_BIT_SET(bP1);
 619  005b c60040        	ld	a,_iLF_DEF+64
 620  005e 5f            	clrw	x
 621  005f 97            	ld	xl,a
 622  0060 d6540c        	ld	a,(21516,x)
 623  0063 ca0040        	or	a,_bLF_DEF+64
 624  0066 d7540c        	ld	(21516,x),a
 626  0069               L371:
 627                     ; 116 }
 630  0069 85            	popw	x
 631  006a 87            	retf	
 664                     ; 119 void	ui_disp_repeat_setup(uint8_t i)
 664                     ; 120 {
 665                     .text:	section	.text,new
 666  0000               f_ui_disp_repeat_setup:
 668  0000 88            	push	a
 669       00000000      OFST:	set	0
 672                     ; 130 	lcd_disp_n(2, i/10);
 674  0001 5f            	clrw	x
 675  0002 97            	ld	xl,a
 676  0003 a60a          	ld	a,#10
 677  0005 62            	div	x,a
 678  0006 a602          	ld	a,#2
 679  0008 95            	ld	xh,a
 680  0009 8d000000      	callf	f_lcd_disp_n
 682                     ; 131 	lcd_disp_n(3, i%10);
 684  000d 7b01          	ld	a,(OFST+1,sp)
 685  000f 5f            	clrw	x
 686  0010 97            	ld	xl,a
 687  0011 a60a          	ld	a,#10
 688  0013 62            	div	x,a
 689  0014 97            	ld	xl,a
 690  0015 a603          	ld	a,#3
 691  0017 95            	ld	xh,a
 692  0018 8d000000      	callf	f_lcd_disp_n
 694                     ; 134 }
 697  001c 84            	pop	a
 698  001d 87            	retf	
 745                     ; 136 void	ui_disp_reserve_setup(uint8_t i)
 745                     ; 137 {
 746                     .text:	section	.text,new
 747  0000               f_ui_disp_reserve_setup:
 749  0000 89            	pushw	x
 750       00000002      OFST:	set	2
 753                     ; 148 	a = i/2;
 755  0001 5f            	clrw	x
 756  0002 97            	ld	xl,a
 757  0003 57            	sraw	x
 758  0004 01            	rrwa	x,a
 759  0005 6b02          	ld	(OFST+0,sp),a
 760                     ; 149 	b = i%2;
 762                     ; 150 	lcd_disp_n(2, a/10);
 764  0007 90ae000a      	ldw	y,#10
 765  000b 5f            	clrw	x
 766  000c 4d            	tnz	a
 767  000d 2a01          	jrpl	L66
 768  000f 5a            	decw	x
 769  0010               L66:
 770  0010 02            	rlwa	x,a
 771  0011 8d000000      	callf	d_idiv
 773  0015 a602          	ld	a,#2
 774  0017 95            	ld	xh,a
 775  0018 8d000000      	callf	f_lcd_disp_n
 777                     ; 151 	lcd_disp_n(3, a%10);
 779  001c 7b02          	ld	a,(OFST+0,sp)
 780  001e 90ae000a      	ldw	y,#10
 781  0022 5f            	clrw	x
 782  0023 4d            	tnz	a
 783  0024 2a01          	jrpl	L27
 784  0026 5a            	decw	x
 785  0027               L27:
 786  0027 02            	rlwa	x,a
 787  0028 8d000000      	callf	d_idiv
 789  002c 909f          	ld	a,yl
 790  002e 97            	ld	xl,a
 791  002f a603          	ld	a,#3
 792  0031 95            	ld	xh,a
 793  0032 8d000000      	callf	f_lcd_disp_n
 795                     ; 154 }
 798  0036 85            	popw	x
 799  0037 87            	retf	
 811                     	xdef	f_ui_disp_reserve_setup
 812                     	xdef	f_ui_disp_repeat_setup
 813                     	xdef	f_ui_disp_set_tSetup
 814                     	xdef	f_ui_disp_clear_tSetup
 815                     	xdef	f___ui_disp_temp_c
 816                     	xdef	f_ui_disp_temp_mark
 817                     	xdef	f_ui_disp_temp_c
 818                     	xdef	f_ui_disp_temp_curr
 819                     	xdef	f_ui_disp_temp_setup
 820                     	xref	f_lcd_clear_npos
 821                     	xref	f_lcd_disp_n
 822                     	xref	_iLF_DEF
 823                     	xref	_bLF_DEF
 824                     	xref.b	c_x
 843                     	xref	d_idiv
 844                     	xref	d_sdivx
 845                     	end
