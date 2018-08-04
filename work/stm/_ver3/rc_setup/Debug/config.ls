   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     	switch	.data
  20  0000               __config_data_1:
  21  0000 04            	dc.b	4
  22  0001 48            	dc.b	72
  23  0002 3e            	dc.b	62
  24  0003 4c            	dc.b	76
  25  0004 2a            	dc.b	42
  26  0005 04            	dc.b	4
  27  0006 01            	dc.b	1
  28  0007 01            	dc.b	1
  29  0008 02            	dc.b	2
  30  0009 02            	dc.b	2
  31  000a 03            	dc.b	3
  32  000b 03            	dc.b	3
  33  000c 04            	dc.b	4
  34  000d 04            	dc.b	4
  35  000e 01            	dc.b	1
  36  000f 64            	dc.b	100
  37  0010 01            	dc.b	1
  38  0011 00            	dc.b	0
  39  0012               __config_data_2:
  40  0012 04            	dc.b	4
  41  0013 63            	dc.b	99
  42  0014 5e            	dc.b	94
  43  0015 4c            	dc.b	76
  44  0016 65            	dc.b	101
  45  0017 04            	dc.b	4
  46  0018 01            	dc.b	1
  47  0019 01            	dc.b	1
  48  001a 02            	dc.b	2
  49  001b 02            	dc.b	2
  50  001c 03            	dc.b	3
  51  001d 03            	dc.b	3
  52  001e 04            	dc.b	4
  53  001f 04            	dc.b	4
  54  0020 01            	dc.b	1
  55  0021 64            	dc.b	100
  56  0022 01            	dc.b	1
  57  0023 00            	dc.b	0
  58  0024               __config_data_3:
  59  0024 03            	dc.b	3
  60  0025 6d            	dc.b	109
  61  0026 77            	dc.b	119
  62  0027 4a            	dc.b	74
  63  0028 33            	dc.b	51
  64  0029 03            	dc.b	3
  65  002a 01            	dc.b	1
  66  002b 01            	dc.b	1
  67  002c 02            	dc.b	2
  68  002d 02            	dc.b	2
  69  002e 03            	dc.b	3
  70  002f 03            	dc.b	3
  71  0030 04            	dc.b	4
  72  0031 04            	dc.b	4
  73  0032 01            	dc.b	1
  74  0033 b5            	dc.b	181
  75  0034 01            	dc.b	1
  76  0035 00            	dc.b	0
  77                     .const:	section	.text
  78  0000               __config:
  79  0000 02            	dc.b	2
  80  0001 12            	dc.b	18
  81  0002 22            	dc.b	34
  82  0003               __c1_a:
  83  0003 04            	dc.b	4
  84  0004 15            	dc.b	21
  85  0005 35            	dc.b	53
  86  0006 25            	dc.b	37
  87  0007 14            	dc.b	20
  88  0008 24            	dc.b	36
  89  0009               __c1_b:
  90  0009 14            	dc.b	20
  91  000a 24            	dc.b	36
  92  000b 25            	dc.b	37
  93  000c 35            	dc.b	53
  94  000d 34            	dc.b	52
  95  000e               __c2_a:
  96  000e 07            	dc.b	7
  97  000f 18            	dc.b	24
  98  0010 38            	dc.b	56
  99  0011 28            	dc.b	40
 100  0012 17            	dc.b	23
 101  0013 27            	dc.b	39
 102  0014               __c2_b:
 103  0014 17            	dc.b	23
 104  0015 27            	dc.b	39
 105  0016 28            	dc.b	40
 106  0017 38            	dc.b	56
 107  0018 37            	dc.b	55
 108  0019               __c2_e:
 109  0019 17            	dc.b	23
 110  001a 27            	dc.b	39
 111  001b 28            	dc.b	40
 112  001c 07            	dc.b	7
 113  001d 37            	dc.b	55
 114  001e               __c2_d:
 115  001e 18            	dc.b	24
 116  001f 27            	dc.b	39
 117  0020 28            	dc.b	40
 118  0021 38            	dc.b	56
 119  0022 37            	dc.b	55
 120  0023               __c3_b:
 121  0023 19            	dc.b	25
 122  0024 29            	dc.b	41
 123  0025 2a            	dc.b	42
 124  0026 3a            	dc.b	58
 125  0027 39            	dc.b	57
 126  0028               __c3_e:
 127  0028 19            	dc.b	25
 128  0029 29            	dc.b	41
 129  002a 2a            	dc.b	42
 130  002b 09            	dc.b	9
 131  002c 39            	dc.b	57
 180                     ; 118 LCD_DISP_FUNC(config_title, 3, _config)
 182                     .text:	section	.text,new
 183  0000               _config_title:
 185  0000 89            	pushw	x
 186       00000002      OFST:	set	2
 191  0001 cd0000        	call	_lcd_clear_n
 194  0004 0f02          	clr	(OFST+0,sp)
 195  0006               L72:
 198  0006 7b02          	ld	a,(OFST+0,sp)
 199  0008 5f            	clrw	x
 200  0009 97            	ld	xl,a
 201  000a d60000        	ld	a,(__config,x)
 202  000d 6b01          	ld	(OFST-1,sp),a
 205  000f 7b01          	ld	a,(OFST-1,sp)
 206  0011 5f            	clrw	x
 207  0012 97            	ld	xl,a
 208  0013 d60000        	ld	a,(_iLF_DEF,x)
 209  0016 5f            	clrw	x
 210  0017 97            	ld	xl,a
 211  0018 7b01          	ld	a,(OFST-1,sp)
 212  001a 905f          	clrw	y
 213  001c 9097          	ld	yl,a
 214  001e d6540c        	ld	a,(21516,x)
 215  0021 90da0000      	or	a,(_bLF_DEF,y)
 216  0025 d7540c        	ld	(21516,x),a
 219  0028 0c02          	inc	(OFST+0,sp)
 222  002a 7b02          	ld	a,(OFST+0,sp)
 223  002c a103          	cp	a,#3
 224  002e 25d6          	jrult	L72
 228  0030 85            	popw	x
 229  0031 81            	ret
 232                     	switch	.data
 233  0036               __config_id:
 234  0036 01            	dc.b	1
 282                     ; 122 void	config_disp_c1(uint8_t i, uint8_t c)
 282                     ; 123 {
 283                     .text:	section	.text,new
 284  0000               _config_disp_c1:
 286  0000 89            	pushw	x
 287  0001 88            	push	a
 288       00000001      OFST:	set	1
 291                     ; 125 	if( c=='A' )
 293  0002 9f            	ld	a,xl
 294  0003 a141          	cp	a,#65
 295  0005 2630          	jrne	L55
 296                     ; 127 		for( j=0; j<6; j++ )	LCD_BIT_SET(_c1_a[j]);
 298  0007 0f01          	clr	(OFST+0,sp)
 299  0009               L75:
 302  0009 7b01          	ld	a,(OFST+0,sp)
 303  000b 5f            	clrw	x
 304  000c 97            	ld	xl,a
 305  000d d60003        	ld	a,(__c1_a,x)
 306  0010 5f            	clrw	x
 307  0011 97            	ld	xl,a
 308  0012 d60000        	ld	a,(_iLF_DEF,x)
 309  0015 5f            	clrw	x
 310  0016 97            	ld	xl,a
 311  0017 7b01          	ld	a,(OFST+0,sp)
 312  0019 905f          	clrw	y
 313  001b 9097          	ld	yl,a
 314  001d 90d60003      	ld	a,(__c1_a,y)
 315  0021 905f          	clrw	y
 316  0023 9097          	ld	yl,a
 317  0025 d6540c        	ld	a,(21516,x)
 318  0028 90da0000      	or	a,(_bLF_DEF,y)
 319  002c d7540c        	ld	(21516,x),a
 322  002f 0c01          	inc	(OFST+0,sp)
 325  0031 7b01          	ld	a,(OFST+0,sp)
 326  0033 a106          	cp	a,#6
 327  0035 25d2          	jrult	L75
 328  0037               L55:
 329                     ; 129 	if( c=='B' )
 331  0037 7b03          	ld	a,(OFST+2,sp)
 332  0039 a142          	cp	a,#66
 333  003b 2630          	jrne	L56
 334                     ; 131 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c1_b[j]);
 336  003d 0f01          	clr	(OFST+0,sp)
 337  003f               L76:
 340  003f 7b01          	ld	a,(OFST+0,sp)
 341  0041 5f            	clrw	x
 342  0042 97            	ld	xl,a
 343  0043 d60009        	ld	a,(__c1_b,x)
 344  0046 5f            	clrw	x
 345  0047 97            	ld	xl,a
 346  0048 d60000        	ld	a,(_iLF_DEF,x)
 347  004b 5f            	clrw	x
 348  004c 97            	ld	xl,a
 349  004d 7b01          	ld	a,(OFST+0,sp)
 350  004f 905f          	clrw	y
 351  0051 9097          	ld	yl,a
 352  0053 90d60009      	ld	a,(__c1_b,y)
 353  0057 905f          	clrw	y
 354  0059 9097          	ld	yl,a
 355  005b d6540c        	ld	a,(21516,x)
 356  005e 90da0000      	or	a,(_bLF_DEF,y)
 357  0062 d7540c        	ld	(21516,x),a
 360  0065 0c01          	inc	(OFST+0,sp)
 363  0067 7b01          	ld	a,(OFST+0,sp)
 364  0069 a105          	cp	a,#5
 365  006b 25d2          	jrult	L76
 366  006d               L56:
 367                     ; 133 }
 370  006d 5b03          	addw	sp,#3
 371  006f 81            	ret
 423                     ; 135 void	config_disp_c2(uint8_t i, uint8_t c)
 423                     ; 136 {
 424                     .text:	section	.text,new
 425  0000               _config_disp_c2:
 427  0000 89            	pushw	x
 428  0001 88            	push	a
 429       00000001      OFST:	set	1
 432                     ; 138 	if( c=='A' )
 434  0002 9f            	ld	a,xl
 435  0003 a141          	cp	a,#65
 436  0005 2630          	jrne	L511
 437                     ; 140 		for( j=0; j<6; j++ )	LCD_BIT_SET(_c2_a[j]);
 439  0007 0f01          	clr	(OFST+0,sp)
 440  0009               L711:
 443  0009 7b01          	ld	a,(OFST+0,sp)
 444  000b 5f            	clrw	x
 445  000c 97            	ld	xl,a
 446  000d d6000e        	ld	a,(__c2_a,x)
 447  0010 5f            	clrw	x
 448  0011 97            	ld	xl,a
 449  0012 d60000        	ld	a,(_iLF_DEF,x)
 450  0015 5f            	clrw	x
 451  0016 97            	ld	xl,a
 452  0017 7b01          	ld	a,(OFST+0,sp)
 453  0019 905f          	clrw	y
 454  001b 9097          	ld	yl,a
 455  001d 90d6000e      	ld	a,(__c2_a,y)
 456  0021 905f          	clrw	y
 457  0023 9097          	ld	yl,a
 458  0025 d6540c        	ld	a,(21516,x)
 459  0028 90da0000      	or	a,(_bLF_DEF,y)
 460  002c d7540c        	ld	(21516,x),a
 463  002f 0c01          	inc	(OFST+0,sp)
 466  0031 7b01          	ld	a,(OFST+0,sp)
 467  0033 a106          	cp	a,#6
 468  0035 25d2          	jrult	L711
 469  0037               L511:
 470                     ; 142 	if( c=='B' )
 472  0037 7b03          	ld	a,(OFST+2,sp)
 473  0039 a142          	cp	a,#66
 474  003b 2630          	jrne	L521
 475                     ; 144 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c2_b[j]);
 477  003d 0f01          	clr	(OFST+0,sp)
 478  003f               L721:
 481  003f 7b01          	ld	a,(OFST+0,sp)
 482  0041 5f            	clrw	x
 483  0042 97            	ld	xl,a
 484  0043 d60014        	ld	a,(__c2_b,x)
 485  0046 5f            	clrw	x
 486  0047 97            	ld	xl,a
 487  0048 d60000        	ld	a,(_iLF_DEF,x)
 488  004b 5f            	clrw	x
 489  004c 97            	ld	xl,a
 490  004d 7b01          	ld	a,(OFST+0,sp)
 491  004f 905f          	clrw	y
 492  0051 9097          	ld	yl,a
 493  0053 90d60014      	ld	a,(__c2_b,y)
 494  0057 905f          	clrw	y
 495  0059 9097          	ld	yl,a
 496  005b d6540c        	ld	a,(21516,x)
 497  005e 90da0000      	or	a,(_bLF_DEF,y)
 498  0062 d7540c        	ld	(21516,x),a
 501  0065 0c01          	inc	(OFST+0,sp)
 504  0067 7b01          	ld	a,(OFST+0,sp)
 505  0069 a105          	cp	a,#5
 506  006b 25d2          	jrult	L721
 507  006d               L521:
 508                     ; 146 	if( c=='E' )
 510  006d 7b03          	ld	a,(OFST+2,sp)
 511  006f a145          	cp	a,#69
 512  0071 2630          	jrne	L531
 513                     ; 148 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c2_e[j]);
 515  0073 0f01          	clr	(OFST+0,sp)
 516  0075               L731:
 519  0075 7b01          	ld	a,(OFST+0,sp)
 520  0077 5f            	clrw	x
 521  0078 97            	ld	xl,a
 522  0079 d60019        	ld	a,(__c2_e,x)
 523  007c 5f            	clrw	x
 524  007d 97            	ld	xl,a
 525  007e d60000        	ld	a,(_iLF_DEF,x)
 526  0081 5f            	clrw	x
 527  0082 97            	ld	xl,a
 528  0083 7b01          	ld	a,(OFST+0,sp)
 529  0085 905f          	clrw	y
 530  0087 9097          	ld	yl,a
 531  0089 90d60019      	ld	a,(__c2_e,y)
 532  008d 905f          	clrw	y
 533  008f 9097          	ld	yl,a
 534  0091 d6540c        	ld	a,(21516,x)
 535  0094 90da0000      	or	a,(_bLF_DEF,y)
 536  0098 d7540c        	ld	(21516,x),a
 539  009b 0c01          	inc	(OFST+0,sp)
 542  009d 7b01          	ld	a,(OFST+0,sp)
 543  009f a105          	cp	a,#5
 544  00a1 25d2          	jrult	L731
 545  00a3               L531:
 546                     ; 150 	if( c=='D' )
 548  00a3 7b03          	ld	a,(OFST+2,sp)
 549  00a5 a144          	cp	a,#68
 550  00a7 2630          	jrne	L541
 551                     ; 152 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c2_d[j]);
 553  00a9 0f01          	clr	(OFST+0,sp)
 554  00ab               L741:
 557  00ab 7b01          	ld	a,(OFST+0,sp)
 558  00ad 5f            	clrw	x
 559  00ae 97            	ld	xl,a
 560  00af d6001e        	ld	a,(__c2_d,x)
 561  00b2 5f            	clrw	x
 562  00b3 97            	ld	xl,a
 563  00b4 d60000        	ld	a,(_iLF_DEF,x)
 564  00b7 5f            	clrw	x
 565  00b8 97            	ld	xl,a
 566  00b9 7b01          	ld	a,(OFST+0,sp)
 567  00bb 905f          	clrw	y
 568  00bd 9097          	ld	yl,a
 569  00bf 90d6001e      	ld	a,(__c2_d,y)
 570  00c3 905f          	clrw	y
 571  00c5 9097          	ld	yl,a
 572  00c7 d6540c        	ld	a,(21516,x)
 573  00ca 90da0000      	or	a,(_bLF_DEF,y)
 574  00ce d7540c        	ld	(21516,x),a
 577  00d1 0c01          	inc	(OFST+0,sp)
 580  00d3 7b01          	ld	a,(OFST+0,sp)
 581  00d5 a105          	cp	a,#5
 582  00d7 25d2          	jrult	L741
 583  00d9               L541:
 584                     ; 154 }
 587  00d9 5b03          	addw	sp,#3
 588  00db 81            	ret
 638                     ; 156 void	config_disp_c3(uint8_t i, uint8_t c)
 638                     ; 157 {
 639                     .text:	section	.text,new
 640  0000               _config_disp_c3:
 642  0000 89            	pushw	x
 643  0001 88            	push	a
 644       00000001      OFST:	set	1
 647                     ; 159 	if( c=='B' )
 649  0002 9f            	ld	a,xl
 650  0003 a142          	cp	a,#66
 651  0005 2630          	jrne	L571
 652                     ; 161 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c3_b[j]);
 654  0007 0f01          	clr	(OFST+0,sp)
 655  0009               L771:
 658  0009 7b01          	ld	a,(OFST+0,sp)
 659  000b 5f            	clrw	x
 660  000c 97            	ld	xl,a
 661  000d d60023        	ld	a,(__c3_b,x)
 662  0010 5f            	clrw	x
 663  0011 97            	ld	xl,a
 664  0012 d60000        	ld	a,(_iLF_DEF,x)
 665  0015 5f            	clrw	x
 666  0016 97            	ld	xl,a
 667  0017 7b01          	ld	a,(OFST+0,sp)
 668  0019 905f          	clrw	y
 669  001b 9097          	ld	yl,a
 670  001d 90d60023      	ld	a,(__c3_b,y)
 671  0021 905f          	clrw	y
 672  0023 9097          	ld	yl,a
 673  0025 d6540c        	ld	a,(21516,x)
 674  0028 90da0000      	or	a,(_bLF_DEF,y)
 675  002c d7540c        	ld	(21516,x),a
 678  002f 0c01          	inc	(OFST+0,sp)
 681  0031 7b01          	ld	a,(OFST+0,sp)
 682  0033 a105          	cp	a,#5
 683  0035 25d2          	jrult	L771
 684  0037               L571:
 685                     ; 163 	if( c=='E' )
 687  0037 7b03          	ld	a,(OFST+2,sp)
 688  0039 a145          	cp	a,#69
 689  003b 2630          	jrne	L502
 690                     ; 165 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c3_e[j]);
 692  003d 0f01          	clr	(OFST+0,sp)
 693  003f               L702:
 696  003f 7b01          	ld	a,(OFST+0,sp)
 697  0041 5f            	clrw	x
 698  0042 97            	ld	xl,a
 699  0043 d60028        	ld	a,(__c3_e,x)
 700  0046 5f            	clrw	x
 701  0047 97            	ld	xl,a
 702  0048 d60000        	ld	a,(_iLF_DEF,x)
 703  004b 5f            	clrw	x
 704  004c 97            	ld	xl,a
 705  004d 7b01          	ld	a,(OFST+0,sp)
 706  004f 905f          	clrw	y
 707  0051 9097          	ld	yl,a
 708  0053 90d60028      	ld	a,(__c3_e,y)
 709  0057 905f          	clrw	y
 710  0059 9097          	ld	yl,a
 711  005b d6540c        	ld	a,(21516,x)
 712  005e 90da0000      	or	a,(_bLF_DEF,y)
 713  0062 d7540c        	ld	(21516,x),a
 716  0065 0c01          	inc	(OFST+0,sp)
 719  0067 7b01          	ld	a,(OFST+0,sp)
 720  0069 a105          	cp	a,#5
 721  006b 25d2          	jrult	L702
 722  006d               L502:
 723                     ; 167 }
 726  006d 5b03          	addw	sp,#3
 727  006f 81            	ret
 769                     ; 169 void	config_disp_item(uint8_t i, uint8_t j)
 769                     ; 170 {
 770                     .text:	section	.text,new
 771  0000               _config_disp_item:
 773  0000 89            	pushw	x
 774  0001 88            	push	a
 775       00000001      OFST:	set	1
 778                     ; 172 	for(k=0; k<4; k++)
 780  0002 0f01          	clr	(OFST+0,sp)
 781  0004               L332:
 782                     ; 173 		lcd_clear_npos(k, 0);
 784  0004 5f            	clrw	x
 785  0005 7b01          	ld	a,(OFST+0,sp)
 786  0007 95            	ld	xh,a
 787  0008 cd0000        	call	_lcd_clear_npos
 789                     ; 172 	for(k=0; k<4; k++)
 791  000b 0c01          	inc	(OFST+0,sp)
 794  000d 7b01          	ld	a,(OFST+0,sp)
 795  000f a104          	cp	a,#4
 796  0011 25f1          	jrult	L332
 797                     ; 175 	if( i==1 )
 799  0013 7b02          	ld	a,(OFST+1,sp)
 800  0015 a101          	cp	a,#1
 801  0017 2614          	jrne	L142
 802                     ; 178 		lcd_disp_n(0, 5);
 804  0019 ae0005        	ldw	x,#5
 805  001c cd0000        	call	_lcd_disp_n
 807                     ; 179 		lcd_disp_n(1, 9);
 809  001f ae0109        	ldw	x,#265
 810  0022 cd0000        	call	_lcd_disp_n
 812                     ; 180 		config_disp_c2(0, 'A');
 814  0025 ae0041        	ldw	x,#65
 815  0028 cd0000        	call	_config_disp_c2
 818  002b 2032          	jra	L342
 819  002d               L142:
 820                     ; 183 	else if( i==2 )
 822  002d 7b02          	ld	a,(OFST+1,sp)
 823  002f a102          	cp	a,#2
 824  0031 2614          	jrne	L542
 825                     ; 186 		lcd_disp_n(0, 8);
 827  0033 ae0008        	ldw	x,#8
 828  0036 cd0000        	call	_lcd_disp_n
 830                     ; 187 		lcd_disp_n(1, 4);
 832  0039 ae0104        	ldw	x,#260
 833  003c cd0000        	call	_lcd_disp_n
 835                     ; 188 		config_disp_c2(0, 'A');
 837  003f ae0041        	ldw	x,#65
 838  0042 cd0000        	call	_config_disp_c2
 841  0045 2018          	jra	L342
 842  0047               L542:
 843                     ; 191 	else if( i==3 )
 845  0047 7b02          	ld	a,(OFST+1,sp)
 846  0049 a103          	cp	a,#3
 847  004b 2612          	jrne	L342
 848                     ; 194 		lcd_disp_n(0, 8);
 850  004d ae0008        	ldw	x,#8
 851  0050 cd0000        	call	_lcd_disp_n
 853                     ; 195 		lcd_disp_n(1, 4);
 855  0053 ae0104        	ldw	x,#260
 856  0056 cd0000        	call	_lcd_disp_n
 858                     ; 196 		config_disp_c2(0, 'D');
 860  0059 ae0044        	ldw	x,#68
 861  005c cd0000        	call	_config_disp_c2
 863  005f               L342:
 864                     ; 234 }
 867  005f 5b03          	addw	sp,#3
 868  0061 81            	ret
 955                     ; 236 uint8_t		config_disp(uint8_t key, uint8_t next)
 955                     ; 237 {
 956                     .text:	section	.text,new
 957  0000               _config_disp:
 959  0000 89            	pushw	x
 960  0001 5206          	subw	sp,#6
 961       00000006      OFST:	set	6
 964                     ; 243 	if( _dsCount == 0 )
 966  0003 725d0000      	tnz	__dsCount
 967  0007 260f          	jrne	L503
 968                     ; 245 		lcd_clear(0);
 970  0009 4f            	clr	a
 971  000a cd0000        	call	_lcd_clear
 973                     ; 247 		_dsCount = 1;
 975  000d 35010000      	mov	__dsCount,#1
 976                     ; 248 		uiInfo._t = _config_id;
 978  0011 550036005f    	mov	_uiInfo+95,__config_id
 980  0016 2048          	jra	L703
 981  0018               L503:
 982                     ; 252 		i = _config_id;
 984  0018 c60036        	ld	a,__config_id
 985  001b 6b06          	ld	(OFST+0,sp),a
 986                     ; 253 		if( uiInfo.enc != 0 )
 988  001d 725d0000      	tnz	_uiInfo
 989  0021 272a          	jreq	L113
 990                     ; 255 			if( (uiInfo.enc & 0x40) == 0 )
 992  0023 c60000        	ld	a,_uiInfo
 993  0026 a540          	bcp	a,#64
 994  0028 2610          	jrne	L313
 995                     ; 257 				if( i==1 )	i = SETUP_SIZE;
 997  002a 7b06          	ld	a,(OFST+0,sp)
 998  002c a101          	cp	a,#1
 999  002e 2606          	jrne	L513
1002  0030 a603          	ld	a,#3
1003  0032 6b06          	ld	(OFST+0,sp),a
1005  0034 2012          	jra	L123
1006  0036               L513:
1007                     ; 259 					i--;
1009  0036 0a06          	dec	(OFST+0,sp)
1010  0038 200e          	jra	L123
1011  003a               L313:
1012                     ; 263 				if( i==SETUP_SIZE )	i = 1;
1014  003a 7b06          	ld	a,(OFST+0,sp)
1015  003c a103          	cp	a,#3
1016  003e 2606          	jrne	L323
1019  0040 a601          	ld	a,#1
1020  0042 6b06          	ld	(OFST+0,sp),a
1022  0044 2002          	jra	L123
1023  0046               L323:
1024                     ; 265 					i++;
1026  0046 0c06          	inc	(OFST+0,sp)
1027  0048               L123:
1028                     ; 267 			_config_id = i;
1030  0048 7b06          	ld	a,(OFST+0,sp)
1031  004a c70036        	ld	__config_id,a
1032  004d               L113:
1033                     ; 269 		if( _dsPrev != i )
1035  004d c60000        	ld	a,__dsPrev
1036  0050 1106          	cp	a,(OFST+0,sp)
1037  0052 270c          	jreq	L703
1038                     ; 271 			_dsPrev = i;
1040  0054 7b06          	ld	a,(OFST+0,sp)
1041  0056 c70000        	ld	__dsPrev,a
1042                     ; 272 			config_disp_item(i, 0);
1044  0059 5f            	clrw	x
1045  005a 7b06          	ld	a,(OFST+0,sp)
1046  005c 95            	ld	xh,a
1047  005d cd0000        	call	_config_disp_item
1049  0060               L703:
1050                     ; 275 	if( key == 3 )		
1052  0060 7b07          	ld	a,(OFST+1,sp)
1053  0062 a103          	cp	a,#3
1054  0064 2703          	jreq	L22
1055  0066 cc0154        	jp	L133
1056  0069               L22:
1057                     ; 278 		if( _config_id == 1 )		p = _config_data_1;
1059  0069 c60036        	ld	a,__config_id
1060  006c a101          	cp	a,#1
1061  006e 2607          	jrne	L333
1064  0070 ae0000        	ldw	x,#__config_data_1
1065  0073 1f04          	ldw	(OFST-2,sp),x
1067  0075 201a          	jra	L533
1068  0077               L333:
1069                     ; 279 		else if( _config_id == 2 )	p = _config_data_2;
1071  0077 c60036        	ld	a,__config_id
1072  007a a102          	cp	a,#2
1073  007c 2607          	jrne	L733
1076  007e ae0012        	ldw	x,#__config_data_2
1077  0081 1f04          	ldw	(OFST-2,sp),x
1079  0083 200c          	jra	L533
1080  0085               L733:
1081                     ; 280 		else if( _config_id == 3 )	p = _config_data_3;
1083  0085 c60036        	ld	a,__config_id
1084  0088 a103          	cp	a,#3
1085  008a 2605          	jrne	L533
1088  008c ae0024        	ldw	x,#__config_data_3
1089  008f 1f04          	ldw	(OFST-2,sp),x
1090  0091               L533:
1091                     ; 288 		j = 0;
1093  0091 0f03          	clr	(OFST-3,sp)
1094                     ; 289 		uiInfo.valve = p[j++];
1096  0093 7b03          	ld	a,(OFST-3,sp)
1097  0095 97            	ld	xl,a
1098  0096 0c03          	inc	(OFST-3,sp)
1099  0098 9f            	ld	a,xl
1100  0099 5f            	clrw	x
1101  009a 97            	ld	xl,a
1102  009b 72fb04        	addw	x,(OFST-2,sp)
1103  009e f6            	ld	a,(x)
1104  009f c7000a        	ld	_uiInfo+10,a
1105                     ; 290 		for( i=0; i<uiInfo.valve; i++ )
1107  00a2 0f06          	clr	(OFST+0,sp)
1109  00a4 201a          	jra	L153
1110  00a6               L543:
1111                     ; 292 			uiInfo.valve_len[i] = p[j++];
1113  00a6 7b06          	ld	a,(OFST+0,sp)
1114  00a8 5f            	clrw	x
1115  00a9 97            	ld	xl,a
1116  00aa 7b03          	ld	a,(OFST-3,sp)
1117  00ac 9097          	ld	yl,a
1118  00ae 0c03          	inc	(OFST-3,sp)
1119  00b0 909f          	ld	a,yl
1120  00b2 905f          	clrw	y
1121  00b4 9097          	ld	yl,a
1122  00b6 72f904        	addw	y,(OFST-2,sp)
1123  00b9 90f6          	ld	a,(y)
1124  00bb d70015        	ld	(_uiInfo+21,x),a
1125                     ; 290 		for( i=0; i<uiInfo.valve; i++ )
1127  00be 0c06          	inc	(OFST+0,sp)
1128  00c0               L153:
1131  00c0 7b06          	ld	a,(OFST+0,sp)
1132  00c2 c1000a        	cp	a,_uiInfo+10
1133  00c5 25df          	jrult	L543
1134                     ; 294 		uiInfo.cnt = p[j++];
1136  00c7 7b03          	ld	a,(OFST-3,sp)
1137  00c9 97            	ld	xl,a
1138  00ca 0c03          	inc	(OFST-3,sp)
1139  00cc 9f            	ld	a,xl
1140  00cd 5f            	clrw	x
1141  00ce 97            	ld	xl,a
1142  00cf 72fb04        	addw	x,(OFST-2,sp)
1143  00d2 f6            	ld	a,(x)
1144  00d3 c70005        	ld	_uiInfo+5,a
1145                     ; 295 		for( i=0; i<uiInfo.valve; i++ )
1147  00d6 0f06          	clr	(OFST+0,sp)
1149  00d8 2028          	jra	L163
1150  00da               L553:
1151                     ; 297 			m = p[j++];	//	valve
1153  00da 7b03          	ld	a,(OFST-3,sp)
1154  00dc 97            	ld	xl,a
1155  00dd 0c03          	inc	(OFST-3,sp)
1156  00df 9f            	ld	a,xl
1157  00e0 5f            	clrw	x
1158  00e1 97            	ld	xl,a
1159  00e2 72fb04        	addw	x,(OFST-2,sp)
1160  00e5 f6            	ld	a,(x)
1161  00e6 6b01          	ld	(OFST-5,sp),a
1162                     ; 298 			n = p[j++];	//	id
1164  00e8 7b03          	ld	a,(OFST-3,sp)
1165  00ea 97            	ld	xl,a
1166  00eb 0c03          	inc	(OFST-3,sp)
1167  00ed 9f            	ld	a,xl
1168  00ee 5f            	clrw	x
1169  00ef 97            	ld	xl,a
1170  00f0 72fb04        	addw	x,(OFST-2,sp)
1171  00f3 f6            	ld	a,(x)
1172  00f4 6b02          	ld	(OFST-4,sp),a
1173                     ; 299 			uiInfo.valve_rc[m-1] = n;
1175  00f6 7b01          	ld	a,(OFST-5,sp)
1176  00f8 5f            	clrw	x
1177  00f9 97            	ld	xl,a
1178  00fa 5a            	decw	x
1179  00fb 7b02          	ld	a,(OFST-4,sp)
1180  00fd d7001d        	ld	(_uiInfo+29,x),a
1181                     ; 295 		for( i=0; i<uiInfo.valve; i++ )
1183  0100 0c06          	inc	(OFST+0,sp)
1184  0102               L163:
1187  0102 7b06          	ld	a,(OFST+0,sp)
1188  0104 c1000a        	cp	a,_uiInfo+10
1189  0107 25d1          	jrult	L553
1190                     ; 301 		uiInfo.lpmType = p[j++];	//0, 8, 10, 15, 20
1192  0109 7b03          	ld	a,(OFST-3,sp)
1193  010b 97            	ld	xl,a
1194  010c 0c03          	inc	(OFST-3,sp)
1195  010e 9f            	ld	a,xl
1196  010f 5f            	clrw	x
1197  0110 97            	ld	xl,a
1198  0111 72fb04        	addw	x,(OFST-2,sp)
1199  0114 f6            	ld	a,(x)
1200  0115 c70013        	ld	_uiInfo+19,a
1201                     ; 302 		uiInfo.houseCapa = p[j++];	//	HouseCapa
1203  0118 7b03          	ld	a,(OFST-3,sp)
1204  011a 97            	ld	xl,a
1205  011b 0c03          	inc	(OFST-3,sp)
1206  011d 9f            	ld	a,xl
1207  011e 5f            	clrw	x
1208  011f 97            	ld	xl,a
1209  0120 72fb04        	addw	x,(OFST-2,sp)
1210  0123 f6            	ld	a,(x)
1211  0124 c70010        	ld	_uiInfo+16,a
1212                     ; 303 		uiInfo.cntlMode = p[j++];	//0 local, 1 each
1214  0127 7b03          	ld	a,(OFST-3,sp)
1215  0129 97            	ld	xl,a
1216  012a 0c03          	inc	(OFST-3,sp)
1217  012c 9f            	ld	a,xl
1218  012d 5f            	clrw	x
1219  012e 97            	ld	xl,a
1220  012f 72fb04        	addw	x,(OFST-2,sp)
1221  0132 f6            	ld	a,(x)
1222  0133 c70003        	ld	_uiInfo+3,a
1223                     ; 304 		uiInfo.poType = p[j++];		//0 xe10, ...
1225  0136 7b03          	ld	a,(OFST-3,sp)
1226  0138 97            	ld	xl,a
1227  0139 0c03          	inc	(OFST-3,sp)
1228  013b 9f            	ld	a,xl
1229  013c 5f            	clrw	x
1230  013d 97            	ld	xl,a
1231  013e 72fb04        	addw	x,(OFST-2,sp)
1232  0141 f6            	ld	a,(x)
1233  0142 c7000f        	ld	_uiInfo+15,a
1234                     ; 306 		STATUS_NEXT(next);	
1236  0145 7b08          	ld	a,(OFST+2,sp)
1237  0147 c70000        	ld	__ds,a
1240  014a 725f0000      	clr	__dsCount
1243  014e 35ff0000      	mov	__dsPrev,#255
1246  0152 200a          	jra	L563
1247  0154               L133:
1248                     ; 308 	else if( key == 2 )
1250  0154 7b07          	ld	a,(OFST+1,sp)
1251  0156 a102          	cp	a,#2
1252  0158 2604          	jrne	L563
1253                     ; 310 		return 1;
1255  015a a601          	ld	a,#1
1257  015c 2001          	jra	L02
1258  015e               L563:
1259                     ; 312 	return 0;
1261  015e 4f            	clr	a
1263  015f               L02:
1265  015f 5b08          	addw	sp,#8
1266  0161 81            	ret
1269                     	switch	.data
1270  0037               __d_cursor:
1271  0037 00            	dc.b	0
1272  0038               __d_buf:
1273  0038 01            	dc.b	1
1274  0039 01            	dc.b	1
1275  003a 01            	dc.b	1
1276  003b 01            	dc.b	1
1330                     ; 318 void	config_disp2(uint8_t key, uint8_t next)
1330                     ; 319 {
1331                     .text:	section	.text,new
1332  0000               _config_disp2:
1334  0000 89            	pushw	x
1335  0001 88            	push	a
1336       00000001      OFST:	set	1
1339                     ; 325 	if( _dsCount == 0 )
1341  0002 725d0000      	tnz	__dsCount
1342  0006 2623          	jrne	L114
1343                     ; 327 		lcd_clear(0);
1345  0008 4f            	clr	a
1346  0009 cd0000        	call	_lcd_clear
1348                     ; 328 		lcd_blink_npos_clear();
1350  000c cd0000        	call	_lcd_blink_npos_clear
1352                     ; 329 		lcd_blink_npos(_d_cursor);
1354  000f c60037        	ld	a,__d_cursor
1355  0012 cd0000        	call	_lcd_blink_npos
1357                     ; 330 		lcd_disp_n(_d_cursor, _d_buf[_d_cursor]);
1359  0015 c60037        	ld	a,__d_cursor
1360  0018 5f            	clrw	x
1361  0019 97            	ld	xl,a
1362  001a d60038        	ld	a,(__d_buf,x)
1363  001d 97            	ld	xl,a
1364  001e c60037        	ld	a,__d_cursor
1365  0021 95            	ld	xh,a
1366  0022 cd0000        	call	_lcd_disp_n
1368                     ; 331 		_dsCount = 1;
1370  0025 35010000      	mov	__dsCount,#1
1372  0029 2055          	jra	L314
1373  002b               L114:
1374                     ; 335 		i = _d_buf[_d_cursor];
1376  002b c60037        	ld	a,__d_cursor
1377  002e 5f            	clrw	x
1378  002f 97            	ld	xl,a
1379  0030 d60038        	ld	a,(__d_buf,x)
1380  0033 6b01          	ld	(OFST+0,sp),a
1381                     ; 336 		if( uiInfo.enc != 0 )
1383  0035 725d0000      	tnz	_uiInfo
1384  0039 272f          	jreq	L514
1385                     ; 338 			if( (uiInfo.enc & 0x40) == 0 )
1387  003b c60000        	ld	a,_uiInfo
1388  003e a540          	bcp	a,#64
1389  0040 2610          	jrne	L714
1390                     ; 340 				if( i==1 )	i = 9;
1392  0042 7b01          	ld	a,(OFST+0,sp)
1393  0044 a101          	cp	a,#1
1394  0046 2606          	jrne	L124
1397  0048 a609          	ld	a,#9
1398  004a 6b01          	ld	(OFST+0,sp),a
1400  004c 2012          	jra	L524
1401  004e               L124:
1402                     ; 342 					i--;
1404  004e 0a01          	dec	(OFST+0,sp)
1405  0050 200e          	jra	L524
1406  0052               L714:
1407                     ; 346 				if( i==9 )	i = 1;
1409  0052 7b01          	ld	a,(OFST+0,sp)
1410  0054 a109          	cp	a,#9
1411  0056 2606          	jrne	L724
1414  0058 a601          	ld	a,#1
1415  005a 6b01          	ld	(OFST+0,sp),a
1417  005c 2002          	jra	L524
1418  005e               L724:
1419                     ; 348 					i++;
1421  005e 0c01          	inc	(OFST+0,sp)
1422  0060               L524:
1423                     ; 350 			_d_buf[_d_cursor] = i;
1425  0060 c60037        	ld	a,__d_cursor
1426  0063 5f            	clrw	x
1427  0064 97            	ld	xl,a
1428  0065 7b01          	ld	a,(OFST+0,sp)
1429  0067 d70038        	ld	(__d_buf,x),a
1430  006a               L514:
1431                     ; 352 		if( _dsPrev != i )
1433  006a c60000        	ld	a,__dsPrev
1434  006d 1101          	cp	a,(OFST+0,sp)
1435  006f 270f          	jreq	L314
1436                     ; 354 			_dsPrev = i;
1438  0071 7b01          	ld	a,(OFST+0,sp)
1439  0073 c70000        	ld	__dsPrev,a
1440                     ; 355 			lcd_disp_n(_d_cursor, i);
1442  0076 7b01          	ld	a,(OFST+0,sp)
1443  0078 97            	ld	xl,a
1444  0079 c60037        	ld	a,__d_cursor
1445  007c 95            	ld	xh,a
1446  007d cd0000        	call	_lcd_disp_n
1448  0080               L314:
1449                     ; 358 	if( key == 1 )		
1451  0080 7b02          	ld	a,(OFST+1,sp)
1452  0082 a101          	cp	a,#1
1453  0084 261a          	jrne	L534
1454                     ; 360 		_d_cursor++;
1456  0086 725c0037      	inc	__d_cursor
1457                     ; 361 		if( _d_cursor == 4 )
1459  008a c60037        	ld	a,__d_cursor
1460  008d a104          	cp	a,#4
1461  008f 2604          	jrne	L734
1462                     ; 362 			_d_cursor = 0;
1464  0091 725f0037      	clr	__d_cursor
1465  0095               L734:
1466                     ; 363 		lcd_blink_npos_clear();
1468  0095 cd0000        	call	_lcd_blink_npos_clear
1470                     ; 364 		lcd_blink_npos(_d_cursor);
1472  0098 c60037        	ld	a,__d_cursor
1473  009b cd0000        	call	_lcd_blink_npos
1476  009e 2013          	jra	L144
1477  00a0               L534:
1478                     ; 366 	else if( key == 4 )
1480  00a0 7b02          	ld	a,(OFST+1,sp)
1481  00a2 a104          	cp	a,#4
1482  00a4 260d          	jrne	L144
1483                     ; 368 		STATUS_NEXT(next);	
1485  00a6 7b03          	ld	a,(OFST+2,sp)
1486  00a8 c70000        	ld	__ds,a
1489  00ab 725f0000      	clr	__dsCount
1492  00af 35ff0000      	mov	__dsPrev,#255
1494  00b3               L144:
1495                     ; 370 }
1498  00b3 5b03          	addw	sp,#3
1499  00b5 81            	ret
1658                     	xdef	_config_disp2
1659                     	xdef	__d_buf
1660                     	xdef	__d_cursor
1661                     	xdef	_config_disp
1662                     	xdef	_config_disp_item
1663                     	xdef	_config_disp_c3
1664                     	xdef	_config_disp_c2
1665                     	xdef	_config_disp_c1
1666                     	xdef	__config_id
1667                     	xdef	_config_title
1668                     	xdef	__c3_e
1669                     	xdef	__c3_b
1670                     	xdef	__c2_d
1671                     	xdef	__c2_e
1672                     	xdef	__c2_b
1673                     	xdef	__c2_a
1674                     	xdef	__c1_b
1675                     	xdef	__c1_a
1676                     	xdef	__config
1677                     	xdef	__config_data_3
1678                     	xdef	__config_data_2
1679                     	xdef	__config_data_1
1680                     	xref	__dsPrev
1681                     	xref	__dsCount
1682                     	xref	__ds
1683                     	xref	_lcd_blink_npos
1684                     	xref	_lcd_blink_npos_clear
1685                     	xref	_lcd_clear_npos
1686                     	xref	_lcd_disp_n
1687                     	xref	_lcd_clear
1688                     	xref	_lcd_clear_n
1689                     	xref	_iLF_DEF
1690                     	xref	_bLF_DEF
1691                     	xref	_uiInfo
1710                     	end
