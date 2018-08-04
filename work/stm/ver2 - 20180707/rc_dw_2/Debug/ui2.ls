   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  61                     ; 5 void	ui_disp_clear_tSetup(uint8_t i)
  61                     ; 6 {
  63                     .text:	section	.text,new
  64  0000               _ui_disp_clear_tSetup:
  66  0000 88            	push	a
  67       00000000      OFST:	set	0
  70                     ; 7 	lcd_clear_npos(2, 0);
  72  0001 ae0200        	ldw	x,#512
  73  0004 cd0000        	call	_lcd_clear_npos
  75                     ; 8 	lcd_clear_npos(3, 0);
  77  0007 ae0300        	ldw	x,#768
  78  000a cd0000        	call	_lcd_clear_npos
  80                     ; 9 	lcd_clear_npos(5, 0);
  82  000d ae0500        	ldw	x,#1280
  83  0010 cd0000        	call	_lcd_clear_npos
  85                     ; 14 	if (i == 1) {
  87                     ; 19 }
  90  0013 84            	pop	a
  91  0014 81            	ret	
 123                     ; 21 void	ui_disp_set_tSetup(uint8_t i)
 123                     ; 22 {
 124                     .text:	section	.text,new
 125  0000               _ui_disp_set_tSetup:
 129                     ; 25 }
 132  0000 81            	ret	
 166                     ; 27 void	__ui_disp_temp_c(uint8_t i)
 166                     ; 28 {
 167                     .text:	section	.text,new
 168  0000               ___ui_disp_temp_c:
 170  0000 88            	push	a
 171       00000000      OFST:	set	0
 174                     ; 29 	LCD_BIT_CLEAR(bT3);
 176  0001 c60000        	ld	a,_iLF_DEF
 177  0004 5f            	clrw	x
 178  0005 97            	ld	xl,a
 179  0006 c60000        	ld	a,_bLF_DEF
 180  0009 43            	cpl	a
 181  000a d4540c        	and	a,(21516,x)
 182  000d d7540c        	ld	(21516,x),a
 183                     ; 30 	LCD_BIT_CLEAR(bT5);
 185  0010 c6000d        	ld	a,_iLF_DEF+13
 186  0013 5f            	clrw	x
 187  0014 97            	ld	xl,a
 188  0015 c6000d        	ld	a,_bLF_DEF+13
 189  0018 43            	cpl	a
 190  0019 d4540c        	and	a,(21516,x)
 191  001c d7540c        	ld	(21516,x),a
 192                     ; 31 	if( i&0x01 )
 194  001f 7b01          	ld	a,(OFST+1,sp)
 195  0021 a501          	bcp	a,#1
 196  0023 2710          	jreq	L75
 197                     ; 33 		LCD_BIT_SET(bT3);
 199  0025 c60000        	ld	a,_iLF_DEF
 200  0028 5f            	clrw	x
 201  0029 97            	ld	xl,a
 202  002a d6540c        	ld	a,(21516,x)
 203  002d ca0000        	or	a,_bLF_DEF
 204  0030 d7540c        	ld	(21516,x),a
 205  0033 7b01          	ld	a,(OFST+1,sp)
 206  0035               L75:
 207                     ; 35 	if( i&0x02 )
 209  0035 a502          	bcp	a,#2
 210  0037 270e          	jreq	L16
 211                     ; 37 		LCD_BIT_SET(bT5);
 213  0039 c6000d        	ld	a,_iLF_DEF+13
 214  003c 5f            	clrw	x
 215  003d 97            	ld	xl,a
 216  003e d6540c        	ld	a,(21516,x)
 217  0041 ca000d        	or	a,_bLF_DEF+13
 218  0044 d7540c        	ld	(21516,x),a
 219  0047               L16:
 220                     ; 39 }
 223  0047 84            	pop	a
 224  0048 81            	ret	
 258                     ; 41 void	ui_disp_temp_c(uint8_t i)
 258                     ; 42 {
 259                     .text:	section	.text,new
 260  0000               _ui_disp_temp_c:
 264                     ; 43 	if( i == 0 )
 266  0000 4d            	tnz	a
 267  0001 261d          	jrne	L77
 268                     ; 45 		LCD_BIT_CLEAR(bT3);
 270  0003 c60000        	ld	a,_iLF_DEF
 271  0006 5f            	clrw	x
 272  0007 97            	ld	xl,a
 273  0008 c60000        	ld	a,_bLF_DEF
 274  000b 43            	cpl	a
 275  000c d4540c        	and	a,(21516,x)
 276  000f d7540c        	ld	(21516,x),a
 277                     ; 46 		LCD_BIT_CLEAR(bT5);
 279  0012 c6000d        	ld	a,_iLF_DEF+13
 280  0015 5f            	clrw	x
 281  0016 97            	ld	xl,a
 282  0017 c6000d        	ld	a,_bLF_DEF+13
 283  001a 43            	cpl	a
 284  001b d4540c        	and	a,(21516,x)
 286  001e 2019          	jra	L101
 287  0020               L77:
 288                     ; 50 		LCD_BIT_SET(bT3);
 290  0020 c60000        	ld	a,_iLF_DEF
 291  0023 5f            	clrw	x
 292  0024 97            	ld	xl,a
 293  0025 d6540c        	ld	a,(21516,x)
 294  0028 ca0000        	or	a,_bLF_DEF
 295  002b d7540c        	ld	(21516,x),a
 296                     ; 51 		LCD_BIT_SET(bT5);
 298  002e c6000d        	ld	a,_iLF_DEF+13
 299  0031 5f            	clrw	x
 300  0032 97            	ld	xl,a
 301  0033 d6540c        	ld	a,(21516,x)
 302  0036 ca000d        	or	a,_bLF_DEF+13
 303  0039               L101:
 304  0039 d7540c        	ld	(21516,x),a
 305                     ; 53 }
 308  003c 81            	ret	
 341                     ; 55 void	ui_disp_temp_mark(uint8_t i)
 341                     ; 56 {
 342                     .text:	section	.text,new
 343  0000               _ui_disp_temp_mark:
 345  0000 88            	push	a
 346       00000000      OFST:	set	0
 349                     ; 57 	if( i == 0 )
 351  0001 4d            	tnz	a
 353                     ; 68 	ui_disp_temp_c(i);
 355  0002 7b01          	ld	a,(OFST+1,sp)
 356  0004 cd0000        	call	_ui_disp_temp_c
 358                     ; 70 }
 361  0007 84            	pop	a
 362  0008 81            	ret	
 412                     ; 72 void	ui_disp_temp_setup(uint8_t i)
 412                     ; 73 {
 413                     .text:	section	.text,new
 414  0000               _ui_disp_temp_setup:
 416  0000 89            	pushw	x
 417       00000002      OFST:	set	2
 420                     ; 75 	a = i/2;
 422  0001 5f            	clrw	x
 423  0002 97            	ld	xl,a
 424  0003 57            	sraw	x
 425  0004 01            	rrwa	x,a
 426  0005 6b02          	ld	(OFST+0,sp),a
 427  0007 02            	rlwa	x,a
 428                     ; 76 	b = i%2;
 430  0008 a401          	and	a,#1
 431  000a 6b01          	ld	(OFST-1,sp),a
 432                     ; 77 	lcd_clear_npos(5, 0);
 434  000c ae0500        	ldw	x,#1280
 435  000f cd0000        	call	_lcd_clear_npos
 437                     ; 78 	LCD_BIT_CLEAR(bP2);
 439  0012 c60044        	ld	a,_iLF_DEF+68
 440  0015 5f            	clrw	x
 441  0016 97            	ld	xl,a
 442  0017 c60044        	ld	a,_bLF_DEF+68
 443  001a 43            	cpl	a
 444  001b d4540c        	and	a,(21516,x)
 445  001e d7540c        	ld	(21516,x),a
 446                     ; 79 	lcd_disp_n(2, a/10);
 448  0021 7b02          	ld	a,(OFST+0,sp)
 449  0023 5f            	clrw	x
 450  0024 97            	ld	xl,a
 451  0025 a60a          	ld	a,#10
 452  0027 62            	div	x,a
 453  0028 a602          	ld	a,#2
 454  002a 95            	ld	xh,a
 455  002b cd0000        	call	_lcd_disp_n
 457                     ; 80 	lcd_disp_n(3, a%10);
 459  002e 7b02          	ld	a,(OFST+0,sp)
 460  0030 5f            	clrw	x
 461  0031 97            	ld	xl,a
 462  0032 a60a          	ld	a,#10
 463  0034 62            	div	x,a
 464  0035 97            	ld	xl,a
 465  0036 a603          	ld	a,#3
 466  0038 95            	ld	xh,a
 467  0039 cd0000        	call	_lcd_disp_n
 469                     ; 82 	if( b != 0 )
 471  003c 7b01          	ld	a,(OFST-1,sp)
 472  003e 2714          	jreq	L541
 473                     ; 84 		lcd_disp_n(5, 5);
 475  0040 ae0505        	ldw	x,#1285
 476  0043 cd0000        	call	_lcd_disp_n
 478                     ; 85 		LCD_BIT_SET(bP2);
 480  0046 c60044        	ld	a,_iLF_DEF+68
 481  0049 5f            	clrw	x
 482  004a 97            	ld	xl,a
 483  004b d6540c        	ld	a,(21516,x)
 484  004e ca0044        	or	a,_bLF_DEF+68
 485  0051 d7540c        	ld	(21516,x),a
 487  0054               L541:
 488                     ; 91 }
 491  0054 85            	popw	x
 492  0055 81            	ret	
 542                     ; 93 void	ui_disp_temp_curr(uint8_t i)
 542                     ; 94 {
 543                     .text:	section	.text,new
 544  0000               _ui_disp_temp_curr:
 546  0000 89            	pushw	x
 547       00000002      OFST:	set	2
 550                     ; 96 	a = i/2;
 552  0001 5f            	clrw	x
 553  0002 97            	ld	xl,a
 554  0003 57            	sraw	x
 555  0004 01            	rrwa	x,a
 556  0005 6b02          	ld	(OFST+0,sp),a
 557  0007 02            	rlwa	x,a
 558                     ; 97 	b = i%2;
 560  0008 a401          	and	a,#1
 561  000a 6b01          	ld	(OFST-1,sp),a
 562                     ; 98 	lcd_clear_npos(4, 0);
 564  000c ae0400        	ldw	x,#1024
 565  000f cd0000        	call	_lcd_clear_npos
 567                     ; 99 	lcd_clear_npos(0, 0);
 569  0012 5f            	clrw	x
 570  0013 cd0000        	call	_lcd_clear_npos
 572                     ; 100 	LCD_BIT_CLEAR(bP1);
 574  0016 c60040        	ld	a,_iLF_DEF+64
 575  0019 5f            	clrw	x
 576  001a 97            	ld	xl,a
 577  001b c60040        	ld	a,_bLF_DEF+64
 578  001e 43            	cpl	a
 579  001f d4540c        	and	a,(21516,x)
 580  0022 d7540c        	ld	(21516,x),a
 581                     ; 101 	if( (a/10) != 0 )
 583  0025 7b02          	ld	a,(OFST+0,sp)
 584  0027 5f            	clrw	x
 585  0028 97            	ld	xl,a
 586  0029 a60a          	ld	a,#10
 587  002b cd0000        	call	c_sdivx
 589  002e 5d            	tnzw	x
 590  002f 270c          	jreq	L761
 591                     ; 103 		lcd_disp_n(0, a/10);
 593  0031 7b02          	ld	a,(OFST+0,sp)
 594  0033 5f            	clrw	x
 595  0034 97            	ld	xl,a
 596  0035 a60a          	ld	a,#10
 597  0037 62            	div	x,a
 598  0038 4f            	clr	a
 599  0039 95            	ld	xh,a
 600  003a cd0000        	call	_lcd_disp_n
 602  003d               L761:
 603                     ; 105 	lcd_disp_n(1, a%10);
 605  003d 7b02          	ld	a,(OFST+0,sp)
 606  003f 5f            	clrw	x
 607  0040 97            	ld	xl,a
 608  0041 a60a          	ld	a,#10
 609  0043 62            	div	x,a
 610  0044 97            	ld	xl,a
 611  0045 a601          	ld	a,#1
 612  0047 95            	ld	xh,a
 613  0048 cd0000        	call	_lcd_disp_n
 615                     ; 107 	if( b != 0 )
 617  004b 7b01          	ld	a,(OFST-1,sp)
 618  004d 2714          	jreq	L371
 619                     ; 109 		lcd_disp_n(4, 5);
 621  004f ae0405        	ldw	x,#1029
 622  0052 cd0000        	call	_lcd_disp_n
 624                     ; 110 		LCD_BIT_SET(bP1);
 626  0055 c60040        	ld	a,_iLF_DEF+64
 627  0058 5f            	clrw	x
 628  0059 97            	ld	xl,a
 629  005a d6540c        	ld	a,(21516,x)
 630  005d ca0040        	or	a,_bLF_DEF+64
 631  0060 d7540c        	ld	(21516,x),a
 633  0063               L371:
 634                     ; 116 }
 637  0063 85            	popw	x
 638  0064 81            	ret	
 672                     ; 119 void	ui_disp_repeat_setup(uint8_t i)
 672                     ; 120 {
 673                     .text:	section	.text,new
 674  0000               _ui_disp_repeat_setup:
 676  0000 88            	push	a
 677       00000000      OFST:	set	0
 680                     ; 130 	lcd_disp_n(2, i/10);
 682  0001 5f            	clrw	x
 683  0002 97            	ld	xl,a
 684  0003 a60a          	ld	a,#10
 685  0005 62            	div	x,a
 686  0006 a602          	ld	a,#2
 687  0008 95            	ld	xh,a
 688  0009 cd0000        	call	_lcd_disp_n
 690                     ; 131 	lcd_disp_n(3, i%10);
 692  000c 7b01          	ld	a,(OFST+1,sp)
 693  000e 5f            	clrw	x
 694  000f 97            	ld	xl,a
 695  0010 a60a          	ld	a,#10
 696  0012 62            	div	x,a
 697  0013 97            	ld	xl,a
 698  0014 a603          	ld	a,#3
 699  0016 95            	ld	xh,a
 700  0017 cd0000        	call	_lcd_disp_n
 702                     ; 134 }
 705  001a 84            	pop	a
 706  001b 81            	ret	
 754                     ; 136 void	ui_disp_reserve_setup(uint8_t i)
 754                     ; 137 {
 755                     .text:	section	.text,new
 756  0000               _ui_disp_reserve_setup:
 758  0000 89            	pushw	x
 759       00000002      OFST:	set	2
 762                     ; 148 	a = i/2;
 764  0001 5f            	clrw	x
 765  0002 97            	ld	xl,a
 766  0003 57            	sraw	x
 767  0004 01            	rrwa	x,a
 768  0005 6b02          	ld	(OFST+0,sp),a
 769                     ; 149 	b = i%2;
 771                     ; 150 	lcd_disp_n(2, a/10);
 773  0007 90ae000a      	ldw	y,#10
 774  000b 5f            	clrw	x
 775  000c 4d            	tnz	a
 776  000d 2a01          	jrpl	L66
 777  000f 5a            	decw	x
 778  0010               L66:
 779  0010 02            	rlwa	x,a
 780  0011 cd0000        	call	c_idiv
 782  0014 a602          	ld	a,#2
 783  0016 95            	ld	xh,a
 784  0017 cd0000        	call	_lcd_disp_n
 786                     ; 151 	lcd_disp_n(3, a%10);
 788  001a 7b02          	ld	a,(OFST+0,sp)
 789  001c 90ae000a      	ldw	y,#10
 790  0020 5f            	clrw	x
 791  0021 4d            	tnz	a
 792  0022 2a01          	jrpl	L27
 793  0024 5a            	decw	x
 794  0025               L27:
 795  0025 02            	rlwa	x,a
 796  0026 cd0000        	call	c_idiv
 798  0029 909f          	ld	a,yl
 799  002b 97            	ld	xl,a
 800  002c a603          	ld	a,#3
 801  002e 95            	ld	xh,a
 802  002f cd0000        	call	_lcd_disp_n
 804                     ; 154 }
 807  0032 85            	popw	x
 808  0033 81            	ret	
 821                     	xdef	_ui_disp_reserve_setup
 822                     	xdef	_ui_disp_repeat_setup
 823                     	xdef	_ui_disp_set_tSetup
 824                     	xdef	_ui_disp_clear_tSetup
 825                     	xdef	___ui_disp_temp_c
 826                     	xdef	_ui_disp_temp_mark
 827                     	xdef	_ui_disp_temp_c
 828                     	xdef	_ui_disp_temp_curr
 829                     	xdef	_ui_disp_temp_setup
 830                     	xref	_lcd_clear_npos
 831                     	xref	_lcd_disp_n
 832                     	xref	_iLF_DEF
 833                     	xref	_bLF_DEF
 834                     	xref.b	c_x
 853                     	xref	c_idiv
 854                     	xref	c_sdivx
 855                     	end
