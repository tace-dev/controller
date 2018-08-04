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
  80                     ; 13 	if (i == 1) {
  82                     ; 18 }
  85  000d 84            	pop	a
  86  000e 81            	ret	
 118                     ; 20 void	ui_disp_set_tSetup(uint8_t i)
 118                     ; 21 {
 119                     .text:	section	.text,new
 120  0000               _ui_disp_set_tSetup:
 124                     ; 24 }
 127  0000 81            	ret	
 161                     ; 26 void	__ui_disp_temp_c(uint8_t i)
 161                     ; 27 {
 162                     .text:	section	.text,new
 163  0000               ___ui_disp_temp_c:
 165  0000 88            	push	a
 166       00000000      OFST:	set	0
 169                     ; 28 	LCD_BIT_CLEAR(bDP1);
 171  0001 c60006        	ld	a,_iLF_DEF+6
 172  0004 5f            	clrw	x
 173  0005 97            	ld	xl,a
 174  0006 c60006        	ld	a,_bLF_DEF+6
 175  0009 43            	cpl	a
 176  000a d4540c        	and	a,(21516,x)
 177  000d d7540c        	ld	(21516,x),a
 178                     ; 29 	LCD_BIT_CLEAR(bDP2);
 180  0010 c6000a        	ld	a,_iLF_DEF+10
 181  0013 5f            	clrw	x
 182  0014 97            	ld	xl,a
 183  0015 c6000a        	ld	a,_bLF_DEF+10
 184  0018 43            	cpl	a
 185  0019 d4540c        	and	a,(21516,x)
 186  001c d7540c        	ld	(21516,x),a
 187                     ; 30 	if( i&0x01 )
 189  001f 7b01          	ld	a,(OFST+1,sp)
 190  0021 a501          	bcp	a,#1
 191  0023 2710          	jreq	L75
 192                     ; 32 		LCD_BIT_SET(bDP1);
 194  0025 c60006        	ld	a,_iLF_DEF+6
 195  0028 5f            	clrw	x
 196  0029 97            	ld	xl,a
 197  002a d6540c        	ld	a,(21516,x)
 198  002d ca0006        	or	a,_bLF_DEF+6
 199  0030 d7540c        	ld	(21516,x),a
 200  0033 7b01          	ld	a,(OFST+1,sp)
 201  0035               L75:
 202                     ; 34 	if( i&0x02 )
 204  0035 a502          	bcp	a,#2
 205  0037 270e          	jreq	L16
 206                     ; 36 		LCD_BIT_SET(bDP2);
 208  0039 c6000a        	ld	a,_iLF_DEF+10
 209  003c 5f            	clrw	x
 210  003d 97            	ld	xl,a
 211  003e d6540c        	ld	a,(21516,x)
 212  0041 ca000a        	or	a,_bLF_DEF+10
 213  0044 d7540c        	ld	(21516,x),a
 214  0047               L16:
 215                     ; 38 }
 218  0047 84            	pop	a
 219  0048 81            	ret	
 253                     ; 40 void	ui_disp_temp_c(uint8_t i)
 253                     ; 41 {
 254                     .text:	section	.text,new
 255  0000               _ui_disp_temp_c:
 259                     ; 42 	if( i == 0 )
 261  0000 4d            	tnz	a
 262  0001 261d          	jrne	L77
 263                     ; 44 		LCD_BIT_CLEAR(bDP1);
 265  0003 c60006        	ld	a,_iLF_DEF+6
 266  0006 5f            	clrw	x
 267  0007 97            	ld	xl,a
 268  0008 c60006        	ld	a,_bLF_DEF+6
 269  000b 43            	cpl	a
 270  000c d4540c        	and	a,(21516,x)
 271  000f d7540c        	ld	(21516,x),a
 272                     ; 45 		LCD_BIT_CLEAR(bDP2);
 274  0012 c6000a        	ld	a,_iLF_DEF+10
 275  0015 5f            	clrw	x
 276  0016 97            	ld	xl,a
 277  0017 c6000a        	ld	a,_bLF_DEF+10
 278  001a 43            	cpl	a
 279  001b d4540c        	and	a,(21516,x)
 281  001e 2019          	jra	L101
 282  0020               L77:
 283                     ; 49 		LCD_BIT_SET(bDP1);
 285  0020 c60006        	ld	a,_iLF_DEF+6
 286  0023 5f            	clrw	x
 287  0024 97            	ld	xl,a
 288  0025 d6540c        	ld	a,(21516,x)
 289  0028 ca0006        	or	a,_bLF_DEF+6
 290  002b d7540c        	ld	(21516,x),a
 291                     ; 50 		LCD_BIT_SET(bDP2);
 293  002e c6000a        	ld	a,_iLF_DEF+10
 294  0031 5f            	clrw	x
 295  0032 97            	ld	xl,a
 296  0033 d6540c        	ld	a,(21516,x)
 297  0036 ca000a        	or	a,_bLF_DEF+10
 298  0039               L101:
 299  0039 d7540c        	ld	(21516,x),a
 300                     ; 52 }
 303  003c 81            	ret	
 336                     ; 54 void	ui_disp_temp_mark(uint8_t i)
 336                     ; 55 {
 337                     .text:	section	.text,new
 338  0000               _ui_disp_temp_mark:
 340  0000 88            	push	a
 341       00000000      OFST:	set	0
 344                     ; 56 	if( i == 0 )
 346  0001 4d            	tnz	a
 348                     ; 67 	ui_disp_temp_c(i);
 350  0002 7b01          	ld	a,(OFST+1,sp)
 351  0004 cd0000        	call	_ui_disp_temp_c
 353                     ; 69 }
 356  0007 84            	pop	a
 357  0008 81            	ret	
 404                     ; 71 void	ui_disp_temp_setup(uint8_t i)
 404                     ; 72 {
 405                     .text:	section	.text,new
 406  0000               _ui_disp_temp_setup:
 408  0000 89            	pushw	x
 409       00000002      OFST:	set	2
 412                     ; 74 	a = i/2;
 414  0001 5f            	clrw	x
 415  0002 97            	ld	xl,a
 416  0003 57            	sraw	x
 417  0004 01            	rrwa	x,a
 418  0005 6b02          	ld	(OFST+0,sp),a
 419  0007 02            	rlwa	x,a
 420                     ; 75 	b = i%2;
 422  0008 a401          	and	a,#1
 423  000a 6b01          	ld	(OFST-1,sp),a
 424                     ; 76 	lcd_disp_n(2, a/10);
 426  000c 5f            	clrw	x
 427  000d 7b02          	ld	a,(OFST+0,sp)
 428  000f 97            	ld	xl,a
 429  0010 a60a          	ld	a,#10
 430  0012 62            	div	x,a
 431  0013 a602          	ld	a,#2
 432  0015 95            	ld	xh,a
 433  0016 cd0000        	call	_lcd_disp_n
 435                     ; 77 	lcd_disp_n(3, a%10);
 437  0019 7b02          	ld	a,(OFST+0,sp)
 438  001b 5f            	clrw	x
 439  001c 97            	ld	xl,a
 440  001d a60a          	ld	a,#10
 441  001f 62            	div	x,a
 442  0020 97            	ld	xl,a
 443  0021 a603          	ld	a,#3
 444  0023 95            	ld	xh,a
 445  0024 cd0000        	call	_lcd_disp_n
 447                     ; 80 	if( b != 0 )
 449  0027 0d01          	tnz	(OFST-1,sp)
 451                     ; 90 }
 454  0029 85            	popw	x
 455  002a 81            	ret	
 502                     ; 92 void	ui_disp_temp_curr(uint8_t i)
 502                     ; 93 {
 503                     .text:	section	.text,new
 504  0000               _ui_disp_temp_curr:
 506  0000 89            	pushw	x
 507       00000002      OFST:	set	2
 510                     ; 95 	a = i/2;
 512  0001 5f            	clrw	x
 513  0002 97            	ld	xl,a
 514  0003 57            	sraw	x
 515  0004 01            	rrwa	x,a
 516  0005 6b02          	ld	(OFST+0,sp),a
 517  0007 02            	rlwa	x,a
 518                     ; 96 	b = i%2;
 520  0008 a401          	and	a,#1
 521  000a 6b01          	ld	(OFST-1,sp),a
 522                     ; 97 	lcd_disp_n(0, a/10);
 524  000c 5f            	clrw	x
 525  000d 7b02          	ld	a,(OFST+0,sp)
 526  000f 97            	ld	xl,a
 527  0010 a60a          	ld	a,#10
 528  0012 62            	div	x,a
 529  0013 4f            	clr	a
 530  0014 95            	ld	xh,a
 531  0015 cd0000        	call	_lcd_disp_n
 533                     ; 98 	lcd_disp_n(1, a%10);
 535  0018 7b02          	ld	a,(OFST+0,sp)
 536  001a 5f            	clrw	x
 537  001b 97            	ld	xl,a
 538  001c a60a          	ld	a,#10
 539  001e 62            	div	x,a
 540  001f 97            	ld	xl,a
 541  0020 a601          	ld	a,#1
 542  0022 95            	ld	xh,a
 543  0023 cd0000        	call	_lcd_disp_n
 545                     ; 101 	if( b != 0 )
 547  0026 0d01          	tnz	(OFST-1,sp)
 549                     ; 111 }
 552  0028 85            	popw	x
 553  0029 81            	ret	
 587                     ; 114 void	ui_disp_repeat_setup(uint8_t i)
 587                     ; 115 {
 588                     .text:	section	.text,new
 589  0000               _ui_disp_repeat_setup:
 591  0000 88            	push	a
 592       00000000      OFST:	set	0
 595                     ; 125 	lcd_disp_n(2, i/10);
 597  0001 5f            	clrw	x
 598  0002 97            	ld	xl,a
 599  0003 a60a          	ld	a,#10
 600  0005 62            	div	x,a
 601  0006 a602          	ld	a,#2
 602  0008 95            	ld	xh,a
 603  0009 cd0000        	call	_lcd_disp_n
 605                     ; 126 	lcd_disp_n(3, i%10);
 607  000c 7b01          	ld	a,(OFST+1,sp)
 608  000e 5f            	clrw	x
 609  000f 97            	ld	xl,a
 610  0010 a60a          	ld	a,#10
 611  0012 62            	div	x,a
 612  0013 97            	ld	xl,a
 613  0014 a603          	ld	a,#3
 614  0016 95            	ld	xh,a
 615  0017 cd0000        	call	_lcd_disp_n
 617                     ; 129 }
 620  001a 84            	pop	a
 621  001b 81            	ret	
 669                     ; 131 void	ui_disp_reserve_setup(uint8_t i)
 669                     ; 132 {
 670                     .text:	section	.text,new
 671  0000               _ui_disp_reserve_setup:
 673  0000 89            	pushw	x
 674       00000002      OFST:	set	2
 677                     ; 143 	a = i/2;
 679  0001 5f            	clrw	x
 680  0002 97            	ld	xl,a
 681  0003 57            	sraw	x
 682  0004 01            	rrwa	x,a
 683  0005 6b02          	ld	(OFST+0,sp),a
 684                     ; 144 	b = i%2;
 686                     ; 145 	lcd_disp_n(2, a/10);
 688  0007 90ae000a      	ldw	y,#10
 689  000b 5f            	clrw	x
 690  000c 4d            	tnz	a
 691  000d 2a01          	jrpl	L25
 692  000f 5a            	decw	x
 693  0010               L25:
 694  0010 02            	rlwa	x,a
 695  0011 cd0000        	call	c_idiv
 697  0014 a602          	ld	a,#2
 698  0016 95            	ld	xh,a
 699  0017 cd0000        	call	_lcd_disp_n
 701                     ; 146 	lcd_disp_n(3, a%10);
 703  001a 7b02          	ld	a,(OFST+0,sp)
 704  001c 90ae000a      	ldw	y,#10
 705  0020 5f            	clrw	x
 706  0021 4d            	tnz	a
 707  0022 2a01          	jrpl	L65
 708  0024 5a            	decw	x
 709  0025               L65:
 710  0025 02            	rlwa	x,a
 711  0026 cd0000        	call	c_idiv
 713  0029 909f          	ld	a,yl
 714  002b 97            	ld	xl,a
 715  002c a603          	ld	a,#3
 716  002e 95            	ld	xh,a
 717  002f cd0000        	call	_lcd_disp_n
 719                     ; 149 }
 722  0032 85            	popw	x
 723  0033 81            	ret	
 736                     	xdef	_ui_disp_reserve_setup
 737                     	xdef	_ui_disp_repeat_setup
 738                     	xdef	_ui_disp_set_tSetup
 739                     	xdef	_ui_disp_clear_tSetup
 740                     	xdef	___ui_disp_temp_c
 741                     	xdef	_ui_disp_temp_mark
 742                     	xdef	_ui_disp_temp_c
 743                     	xdef	_ui_disp_temp_curr
 744                     	xdef	_ui_disp_temp_setup
 745                     	xref	_lcd_clear_npos
 746                     	xref	_lcd_disp_n
 747                     	xref	_iLF_DEF
 748                     	xref	_bLF_DEF
 767                     	xref	c_idiv
 768                     	end
