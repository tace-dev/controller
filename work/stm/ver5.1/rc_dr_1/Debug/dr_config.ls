   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     	switch	.data
  22  0000               __config_data_59ae:
  23  0000 04            	dc.b	4
  24  0001 39            	dc.b	57
  25  0002 4f            	dc.b	79
  26  0003 3f            	dc.b	63
  27  0004 46            	dc.b	70
  28  0005 04            	dc.b	4
  29  0006 01            	dc.b	1
  30  0007 01            	dc.b	1
  31  0008 02            	dc.b	2
  32  0009 02            	dc.b	2
  33  000a 03            	dc.b	3
  34  000b 03            	dc.b	3
  35  000c 04            	dc.b	4
  36  000d 04            	dc.b	4
  37  000e 01            	dc.b	1
  38  000f 80            	dc.b	128
  39  0010 00            	dc.b	0
  40  0011 00            	dc.b	0
  41  0012               __config_data_59be:
  42  0012 04            	dc.b	4
  43  0013 47            	dc.b	71
  44  0014 49            	dc.b	73
  45  0015 44            	dc.b	68
  46  0016 37            	dc.b	55
  47  0017 04            	dc.b	4
  48  0018 01            	dc.b	1
  49  0019 01            	dc.b	1
  50  001a 02            	dc.b	2
  51  001b 02            	dc.b	2
  52  001c 03            	dc.b	3
  53  001d 03            	dc.b	3
  54  001e 04            	dc.b	4
  55  001f 04            	dc.b	4
  56  0020 01            	dc.b	1
  57  0021 78            	dc.b	120
  58  0022 00            	dc.b	0
  59  0023 00            	dc.b	0
  60  0024               __config_data_8ae1:
  61  0024 04            	dc.b	4
  62  0025 64            	dc.b	100
  63  0026 5f            	dc.b	95
  64  0027 43            	dc.b	67
  65  0028 4b            	dc.b	75
  66  0029 04            	dc.b	4
  67  002a 01            	dc.b	1
  68  002b 01            	dc.b	1
  69  002c 02            	dc.b	2
  70  002d 02            	dc.b	2
  71  002e 03            	dc.b	3
  72  002f 03            	dc.b	3
  73  0030 04            	dc.b	4
  74  0031 04            	dc.b	4
  75  0032 01            	dc.b	1
  76  0033 b5            	dc.b	181
  77  0034 00            	dc.b	0
  78  0035 00            	dc.b	0
  79  0036               __config_data_8be0:
  80  0036 05            	dc.b	5
  81  0037 5d            	dc.b	93
  82  0038 58            	dc.b	88
  83  0039 3e            	dc.b	62
  84  003a 49            	dc.b	73
  85  003b 52            	dc.b	82
  86  003c 04            	dc.b	4
  87  003d 01            	dc.b	1
  88  003e 01            	dc.b	1
  89  003f 02            	dc.b	2
  90  0040 02            	dc.b	2
  91  0041 03            	dc.b	3
  92  0042 02            	dc.b	2
  93  0043 04            	dc.b	4
  94  0044 03            	dc.b	3
  95  0045 05            	dc.b	5
  96  0046 04            	dc.b	4
  97  0047 01            	dc.b	1
  98  0048 b5            	dc.b	181
  99  0049 00            	dc.b	0
 100  004a 00            	dc.b	0
 101                     .const:	section	.text
 102  0000               __config:
 103  0000 37            	dc.b	55
 104  0001 38            	dc.b	56
 105  0002 18            	dc.b	24
 106  0003               __c1_a:
 107  0003 35            	dc.b	53
 108  0004 25            	dc.b	37
 109  0005 15            	dc.b	21
 110  0006 26            	dc.b	38
 111  0007 36            	dc.b	54
 112  0008 16            	dc.b	22
 113  0009               __c1_b:
 114  0009 36            	dc.b	54
 115  000a 16            	dc.b	22
 116  000b 26            	dc.b	38
 117  000c 15            	dc.b	21
 118  000d 05            	dc.b	5
 119  000e               __c2_a:
 120  000e 0d            	dc.b	13
 121  000f 1d            	dc.b	29
 122  0010 2d            	dc.b	45
 123  0011 1e            	dc.b	30
 124  0012 0e            	dc.b	14
 125  0013 2e            	dc.b	46
 126  0014               __c2_b:
 127  0014 0e            	dc.b	14
 128  0015 2e            	dc.b	46
 129  0016 1e            	dc.b	30
 130  0017 2d            	dc.b	45
 131  0018 3d            	dc.b	61
 132  0019               __c2_e:
 133  0019 0e            	dc.b	14
 134  001a 2e            	dc.b	46
 135  001b 1e            	dc.b	30
 136  001c 0d            	dc.b	13
 137  001d 3d            	dc.b	61
 138  001e               __c3_b:
 139  001e 0c            	dc.b	12
 140  001f 2c            	dc.b	44
 141  0020 1c            	dc.b	28
 142  0021 2b            	dc.b	43
 143  0022 3b            	dc.b	59
 144  0023               __c3_e:
 145  0023 0c            	dc.b	12
 146  0024 2c            	dc.b	44
 147  0025 1c            	dc.b	28
 148  0026 0b            	dc.b	11
 149  0027 3b            	dc.b	59
 198                     ; 145 LCD_DISP_FUNC(config_title, 3, _config)
 200                     	switch	.text
 201  0000               _config_title:
 203  0000 89            	pushw	x
 204       00000002      OFST:	set	2
 209  0001 cd0000        	call	_lcd_clear_n
 212  0004 4f            	clr	a
 213  0005 6b02          	ld	(OFST+0,sp),a
 214  0007               L72:
 217  0007 5f            	clrw	x
 218  0008 97            	ld	xl,a
 219  0009 d60000        	ld	a,(__config,x)
 220  000c 6b01          	ld	(OFST-1,sp),a
 223  000e 5f            	clrw	x
 224  000f 97            	ld	xl,a
 225  0010 d60000        	ld	a,(_iLF_DEF,x)
 226  0013 5f            	clrw	x
 227  0014 97            	ld	xl,a
 228  0015 7b01          	ld	a,(OFST-1,sp)
 229  0017 905f          	clrw	y
 230  0019 9097          	ld	yl,a
 231  001b d6540c        	ld	a,(21516,x)
 232  001e 90da0000      	or	a,(_bLF_DEF,y)
 233  0022 d7540c        	ld	(21516,x),a
 236  0025 0c02          	inc	(OFST+0,sp)
 239  0027 7b02          	ld	a,(OFST+0,sp)
 240  0029 a103          	cp	a,#3
 241  002b 25da          	jrult	L72
 245  002d 85            	popw	x
 246  002e 81            	ret	
 249                     	switch	.data
 250  004b               __config_id:
 251  004b 01            	dc.b	1
 299                     ; 149 void	config_disp_c1(uint8_t i, uint8_t c)
 299                     ; 150 {
 300                     	switch	.text
 301  002f               _config_disp_c1:
 303  002f 89            	pushw	x
 304  0030 88            	push	a
 305       00000001      OFST:	set	1
 308                     ; 152 	if( c=='A' )
 310  0031 9f            	ld	a,xl
 311  0032 a141          	cp	a,#65
 312  0034 2623          	jrne	L55
 313                     ; 154 		for( j=0; j<6; j++ )	LCD_BIT_SET(_c1_a[j]);
 315  0036 4f            	clr	a
 316  0037 6b01          	ld	(OFST+0,sp),a
 317  0039               L75:
 320  0039 5f            	clrw	x
 321  003a 97            	ld	xl,a
 322  003b d60003        	ld	a,(__c1_a,x)
 323  003e 5f            	clrw	x
 324  003f 97            	ld	xl,a
 325  0040 d60000        	ld	a,(_iLF_DEF,x)
 326  0043 5f            	clrw	x
 327  0044 97            	ld	xl,a
 328  0045 7b01          	ld	a,(OFST+0,sp)
 329  0047 905f          	clrw	y
 330  0049 9097          	ld	yl,a
 331  004b 90d60003      	ld	a,(__c1_a,y)
 332  004f ad34          	call	LC001
 335  0051 0c01          	inc	(OFST+0,sp)
 338  0053 7b01          	ld	a,(OFST+0,sp)
 339  0055 a106          	cp	a,#6
 340  0057 25e0          	jrult	L75
 341  0059               L55:
 342                     ; 156 	if( c=='B' )
 344  0059 7b03          	ld	a,(OFST+2,sp)
 345  005b a142          	cp	a,#66
 346  005d 2623          	jrne	L56
 347                     ; 158 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c1_b[j]);
 349  005f 4f            	clr	a
 350  0060 6b01          	ld	(OFST+0,sp),a
 351  0062               L76:
 354  0062 5f            	clrw	x
 355  0063 97            	ld	xl,a
 356  0064 d60009        	ld	a,(__c1_b,x)
 357  0067 5f            	clrw	x
 358  0068 97            	ld	xl,a
 359  0069 d60000        	ld	a,(_iLF_DEF,x)
 360  006c 5f            	clrw	x
 361  006d 97            	ld	xl,a
 362  006e 7b01          	ld	a,(OFST+0,sp)
 363  0070 905f          	clrw	y
 364  0072 9097          	ld	yl,a
 365  0074 90d60009      	ld	a,(__c1_b,y)
 366  0078 ad0b          	call	LC001
 369  007a 0c01          	inc	(OFST+0,sp)
 372  007c 7b01          	ld	a,(OFST+0,sp)
 373  007e a105          	cp	a,#5
 374  0080 25e0          	jrult	L76
 375  0082               L56:
 376                     ; 160 }
 379  0082 5b03          	addw	sp,#3
 380  0084 81            	ret	
 381  0085               LC001:
 382  0085 905f          	clrw	y
 383  0087 9097          	ld	yl,a
 384  0089 d6540c        	ld	a,(21516,x)
 385  008c 90da0000      	or	a,(_bLF_DEF,y)
 386  0090 d7540c        	ld	(21516,x),a
 387  0093 81            	ret	
 438                     ; 162 void	config_disp_c2(uint8_t i, uint8_t c)
 438                     ; 163 {
 439                     	switch	.text
 440  0094               _config_disp_c2:
 442  0094 89            	pushw	x
 443  0095 88            	push	a
 444       00000001      OFST:	set	1
 447                     ; 165 	if( c=='A' )
 449  0096 9f            	ld	a,xl
 450  0097 a141          	cp	a,#65
 451  0099 261e          	jrne	L511
 452                     ; 167 		for( j=0; j<6; j++ )	LCD_BIT_SET(_c2_a[j]);
 454  009b 4f            	clr	a
 455  009c 6b01          	ld	(OFST+0,sp),a
 456  009e               L711:
 459  009e 5f            	clrw	x
 460  009f 97            	ld	xl,a
 461  00a0 d6000e        	ld	a,(__c2_a,x)
 462  00a3 ad6e          	call	LC003
 463  00a5 7b01          	ld	a,(OFST+0,sp)
 464  00a7 905f          	clrw	y
 465  00a9 9097          	ld	yl,a
 466  00ab 90d6000e      	ld	a,(__c2_a,y)
 467  00af ad53          	call	LC002
 470  00b1 0c01          	inc	(OFST+0,sp)
 473  00b3 7b01          	ld	a,(OFST+0,sp)
 474  00b5 a106          	cp	a,#6
 475  00b7 25e5          	jrult	L711
 476  00b9               L511:
 477                     ; 169 	if( c=='B' )
 479  00b9 7b03          	ld	a,(OFST+2,sp)
 480  00bb a142          	cp	a,#66
 481  00bd 2620          	jrne	L521
 482                     ; 171 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c2_b[j]);
 484  00bf 4f            	clr	a
 485  00c0 6b01          	ld	(OFST+0,sp),a
 486  00c2               L721:
 489  00c2 5f            	clrw	x
 490  00c3 97            	ld	xl,a
 491  00c4 d60014        	ld	a,(__c2_b,x)
 492  00c7 ad4a          	call	LC003
 493  00c9 7b01          	ld	a,(OFST+0,sp)
 494  00cb 905f          	clrw	y
 495  00cd 9097          	ld	yl,a
 496  00cf 90d60014      	ld	a,(__c2_b,y)
 497  00d3 ad2f          	call	LC002
 500  00d5 0c01          	inc	(OFST+0,sp)
 503  00d7 7b01          	ld	a,(OFST+0,sp)
 504  00d9 a105          	cp	a,#5
 505  00db 25e5          	jrult	L721
 506  00dd 7b03          	ld	a,(OFST+2,sp)
 507  00df               L521:
 508                     ; 173 	if( c=='E' )
 510  00df a145          	cp	a,#69
 511  00e1 261e          	jrne	L531
 512                     ; 175 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c2_e[j]);
 514  00e3 4f            	clr	a
 515  00e4 6b01          	ld	(OFST+0,sp),a
 516  00e6               L731:
 519  00e6 5f            	clrw	x
 520  00e7 97            	ld	xl,a
 521  00e8 d60019        	ld	a,(__c2_e,x)
 522  00eb ad26          	call	LC003
 523  00ed 7b01          	ld	a,(OFST+0,sp)
 524  00ef 905f          	clrw	y
 525  00f1 9097          	ld	yl,a
 526  00f3 90d60019      	ld	a,(__c2_e,y)
 527  00f7 ad0b          	call	LC002
 530  00f9 0c01          	inc	(OFST+0,sp)
 533  00fb 7b01          	ld	a,(OFST+0,sp)
 534  00fd a105          	cp	a,#5
 535  00ff 25e5          	jrult	L731
 536  0101               L531:
 537                     ; 177 }
 540  0101 5b03          	addw	sp,#3
 541  0103 81            	ret	
 542  0104               LC002:
 543  0104 905f          	clrw	y
 544  0106 9097          	ld	yl,a
 545  0108 d6540c        	ld	a,(21516,x)
 546  010b 90da0000      	or	a,(_bLF_DEF,y)
 547  010f d7540c        	ld	(21516,x),a
 548  0112 81            	ret	
 549  0113               LC003:
 550  0113 5f            	clrw	x
 551  0114 97            	ld	xl,a
 552  0115 d60000        	ld	a,(_iLF_DEF,x)
 553  0118 5f            	clrw	x
 554  0119 97            	ld	xl,a
 555  011a 81            	ret	
 605                     ; 179 void	config_disp_c3(uint8_t i, uint8_t c)
 605                     ; 180 {
 606                     	switch	.text
 607  011b               _config_disp_c3:
 609  011b 89            	pushw	x
 610  011c 88            	push	a
 611       00000001      OFST:	set	1
 614                     ; 182 	if( c=='B' )
 616  011d 9f            	ld	a,xl
 617  011e a142          	cp	a,#66
 618  0120 2623          	jrne	L561
 619                     ; 184 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c3_b[j]);
 621  0122 4f            	clr	a
 622  0123 6b01          	ld	(OFST+0,sp),a
 623  0125               L761:
 626  0125 5f            	clrw	x
 627  0126 97            	ld	xl,a
 628  0127 d6001e        	ld	a,(__c3_b,x)
 629  012a 5f            	clrw	x
 630  012b 97            	ld	xl,a
 631  012c d60000        	ld	a,(_iLF_DEF,x)
 632  012f 5f            	clrw	x
 633  0130 97            	ld	xl,a
 634  0131 7b01          	ld	a,(OFST+0,sp)
 635  0133 905f          	clrw	y
 636  0135 9097          	ld	yl,a
 637  0137 90d6001e      	ld	a,(__c3_b,y)
 638  013b ad34          	call	LC004
 641  013d 0c01          	inc	(OFST+0,sp)
 644  013f 7b01          	ld	a,(OFST+0,sp)
 645  0141 a105          	cp	a,#5
 646  0143 25e0          	jrult	L761
 647  0145               L561:
 648                     ; 186 	if( c=='E' )
 650  0145 7b03          	ld	a,(OFST+2,sp)
 651  0147 a145          	cp	a,#69
 652  0149 2623          	jrne	L571
 653                     ; 188 		for( j=0; j<5; j++ )	LCD_BIT_SET(_c3_e[j]);
 655  014b 4f            	clr	a
 656  014c 6b01          	ld	(OFST+0,sp),a
 657  014e               L771:
 660  014e 5f            	clrw	x
 661  014f 97            	ld	xl,a
 662  0150 d60023        	ld	a,(__c3_e,x)
 663  0153 5f            	clrw	x
 664  0154 97            	ld	xl,a
 665  0155 d60000        	ld	a,(_iLF_DEF,x)
 666  0158 5f            	clrw	x
 667  0159 97            	ld	xl,a
 668  015a 7b01          	ld	a,(OFST+0,sp)
 669  015c 905f          	clrw	y
 670  015e 9097          	ld	yl,a
 671  0160 90d60023      	ld	a,(__c3_e,y)
 672  0164 ad0b          	call	LC004
 675  0166 0c01          	inc	(OFST+0,sp)
 678  0168 7b01          	ld	a,(OFST+0,sp)
 679  016a a105          	cp	a,#5
 680  016c 25e0          	jrult	L771
 681  016e               L571:
 682                     ; 190 }
 685  016e 5b03          	addw	sp,#3
 686  0170 81            	ret	
 687  0171               LC004:
 688  0171 905f          	clrw	y
 689  0173 9097          	ld	yl,a
 690  0175 d6540c        	ld	a,(21516,x)
 691  0178 90da0000      	or	a,(_bLF_DEF,y)
 692  017c d7540c        	ld	(21516,x),a
 693  017f 81            	ret	
 737                     ; 192 void	config_disp_item(uint8_t i, uint8_t j)
 737                     ; 193 {
 738                     	switch	.text
 739  0180               _config_disp_item:
 741  0180 89            	pushw	x
 742  0181 88            	push	a
 743       00000001      OFST:	set	1
 746                     ; 195 	for(k=0; k<4; k++)
 748  0182 4f            	clr	a
 749  0183 6b01          	ld	(OFST+0,sp),a
 750  0185               L322:
 751                     ; 196 		lcd_clear_npos(k, 0);
 753  0185 5f            	clrw	x
 754  0186 95            	ld	xh,a
 755  0187 cd0000        	call	_lcd_clear_npos
 757                     ; 195 	for(k=0; k<4; k++)
 759  018a 0c01          	inc	(OFST+0,sp)
 762  018c 7b01          	ld	a,(OFST+0,sp)
 763  018e a104          	cp	a,#4
 764  0190 25f3          	jrult	L322
 765                     ; 271 	if( i==1 )
 767  0192 7b02          	ld	a,(OFST+1,sp)
 768  0194 a101          	cp	a,#1
 769  0196 2607          	jrne	L132
 770                     ; 274 		lcd_disp_n(0, 5);
 772  0198 ad45          	call	LC007
 774                     ; 276 		config_disp_c2(0, 'A');
 776  019a ae0041        	ldw	x,#65
 778                     ; 277 		config_disp_c3(0, 'E');
 781  019d 2009          	jp	LC006
 782  019f               L132:
 783                     ; 279 	else if( i==2 )
 785  019f a102          	cp	a,#2
 786  01a1 2610          	jrne	L532
 787                     ; 282 		lcd_disp_n(0, 5);
 789  01a3 ad3a          	call	LC007
 791                     ; 284 		config_disp_c2(0, 'B');
 793  01a5 ae0042        	ldw	x,#66
 795                     ; 285 		config_disp_c3(0, 'E');
 797  01a8               LC006:
 798  01a8 cd0094        	call	_config_disp_c2
 800  01ab ae0045        	ldw	x,#69
 801  01ae cd011b        	call	_config_disp_c3
 804  01b1 2029          	jra	L332
 805  01b3               L532:
 806                     ; 287 	else if( i==3 )
 808  01b3 a103          	cp	a,#3
 809  01b5 2610          	jrne	L142
 810                     ; 290 		lcd_disp_n(0, 8);
 812  01b7 ae0008        	ldw	x,#8
 813  01ba cd0000        	call	_lcd_disp_n
 815                     ; 291 		config_disp_c1(0, 'A');
 817  01bd ae0041        	ldw	x,#65
 818  01c0 ad29          	call	LC008
 820                     ; 293 		lcd_disp_n(3, 1);
 822  01c2 ae0301        	ldw	x,#769
 825  01c5 2012          	jp	LC005
 826  01c7               L142:
 827                     ; 295 	else if( i==4 )
 829  01c7 a104          	cp	a,#4
 830  01c9 2611          	jrne	L332
 831                     ; 298 		lcd_disp_n(0, 8);
 833  01cb ae0008        	ldw	x,#8
 834  01ce cd0000        	call	_lcd_disp_n
 836                     ; 299 		config_disp_c1(0, 'B');
 838  01d1 ae0042        	ldw	x,#66
 839  01d4 ad15          	call	LC008
 841                     ; 301 		lcd_disp_n(3, 0);
 843  01d6 ae0300        	ldw	x,#768
 844  01d9               LC005:
 845  01d9 cd0000        	call	_lcd_disp_n
 847  01dc               L332:
 848                     ; 303 }
 851  01dc 5b03          	addw	sp,#3
 852  01de 81            	ret	
 853  01df               LC007:
 854  01df ae0005        	ldw	x,#5
 855  01e2 cd0000        	call	_lcd_disp_n
 857                     ; 275 		lcd_disp_n(1, 9);
 859  01e5 ae0109        	ldw	x,#265
 860  01e8 cc0000        	jp	_lcd_disp_n
 861  01eb               LC008:
 862  01eb cd002f        	call	_config_disp_c1
 864                     ; 300 		config_disp_c2(0, 'E');
 866  01ee ae0045        	ldw	x,#69
 867  01f1 cc0094        	jp	_config_disp_c2
 956                     ; 305 uint8_t		config_disp(uint8_t key, uint8_t next)
 956                     ; 306 {
 957                     	switch	.text
 958  01f4               _config_disp:
 960  01f4 89            	pushw	x
 961  01f5 5206          	subw	sp,#6
 962       00000006      OFST:	set	6
 965                     ; 312 	if( _dsCount == 0 )
 967  01f7 c60000        	ld	a,__dsCount
 968  01fa 2611          	jrne	L103
 969                     ; 314 		lcd_clear(0);
 971  01fc cd0000        	call	_lcd_clear
 973                     ; 315 		config_title();
 975  01ff cd0000        	call	_config_title
 977                     ; 316 		_dsCount = 1;
 979  0202 35010000      	mov	__dsCount,#1
 980                     ; 317 		uiInfo._t = _config_id;
 982  0206 55004b005f    	mov	_uiInfo+95,__config_id
 984  020b 203f          	jra	L303
 985  020d               L103:
 986                     ; 321 		i = _config_id;
 988  020d c6004b        	ld	a,__config_id
 989  0210 6b06          	ld	(OFST+0,sp),a
 990                     ; 322 		if( uiInfo.enc != 0 )
 992  0212 c60000        	ld	a,_uiInfo
 993  0215 2724          	jreq	L503
 994                     ; 324 			if( (uiInfo.enc & 0x40) == 0 )
 996  0217 a540          	bcp	a,#64
 997  0219 260d          	jrne	L703
 998                     ; 326 				if( i==1 )	i = 4;
1000  021b 7b06          	ld	a,(OFST+0,sp)
1001  021d 4a            	dec	a
1002  021e 2604          	jrne	L113
1005  0220 a604          	ld	a,#4
1007  0222 200c          	jp	LC009
1008  0224               L113:
1009                     ; 328 					i--;
1011  0224 0a06          	dec	(OFST+0,sp)
1012  0226 200e          	jra	L513
1013  0228               L703:
1014                     ; 332 				if( i==4 )	i = 1;
1016  0228 7b06          	ld	a,(OFST+0,sp)
1017  022a a104          	cp	a,#4
1018  022c 2606          	jrne	L713
1021  022e a601          	ld	a,#1
1022  0230               LC009:
1023  0230 6b06          	ld	(OFST+0,sp),a
1025  0232 2002          	jra	L513
1026  0234               L713:
1027                     ; 334 					i++;
1029  0234 0c06          	inc	(OFST+0,sp)
1030  0236               L513:
1031                     ; 336 			_config_id = i;
1033  0236 7b06          	ld	a,(OFST+0,sp)
1034  0238 c7004b        	ld	__config_id,a
1035  023b               L503:
1036                     ; 338 		if( _dsPrev != i )
1038  023b c60000        	ld	a,__dsPrev
1039  023e 1106          	cp	a,(OFST+0,sp)
1040  0240 270a          	jreq	L303
1041                     ; 340 			_dsPrev = i;
1043  0242 7b06          	ld	a,(OFST+0,sp)
1044  0244 c70000        	ld	__dsPrev,a
1045                     ; 341 			config_disp_item(i, 0);
1047  0247 5f            	clrw	x
1048  0248 95            	ld	xh,a
1049  0249 cd0180        	call	_config_disp_item
1051  024c               L303:
1052                     ; 344 	if( key == 3 )		
1054  024c 7b07          	ld	a,(OFST+1,sp)
1055  024e a103          	cp	a,#3
1056  0250 2703cc0326    	jrne	L523
1057                     ; 346 		if( _config_id == 1 )		p = _config_data_59ae;
1059  0255 c6004b        	ld	a,__config_id
1060  0258 a101          	cp	a,#1
1061  025a 2605          	jrne	L723
1064  025c ae0000        	ldw	x,#__config_data_59ae
1066  025f 2019          	jp	LC010
1067  0261               L723:
1068                     ; 347 		else if( _config_id == 2 )	p = _config_data_59be;
1070  0261 a102          	cp	a,#2
1071  0263 2605          	jrne	L333
1074  0265 ae0012        	ldw	x,#__config_data_59be
1076  0268 2010          	jp	LC010
1077  026a               L333:
1078                     ; 348 		else if( _config_id == 3 )	p = _config_data_8ae1;
1080  026a a103          	cp	a,#3
1081  026c 2605          	jrne	L733
1084  026e ae0024        	ldw	x,#__config_data_8ae1
1086  0271 2007          	jp	LC010
1087  0273               L733:
1088                     ; 349 		else if( _config_id == 4 )	p = _config_data_8be0;
1090  0273 a104          	cp	a,#4
1091  0275 2605          	jrne	L133
1094  0277 ae0036        	ldw	x,#__config_data_8be0
1095  027a               LC010:
1096  027a 1f04          	ldw	(OFST-2,sp),x
1097  027c               L133:
1098                     ; 361 		j = 0;
1100  027c 4f            	clr	a
1101  027d 6b03          	ld	(OFST-3,sp),a
1102                     ; 362 		uiInfo.valve = p[j++];
1104  027f 5f            	clrw	x
1105  0280 0c03          	inc	(OFST-3,sp)
1106  0282 97            	ld	xl,a
1107  0283 72fb04        	addw	x,(OFST-2,sp)
1108  0286 f6            	ld	a,(x)
1109  0287 c7000a        	ld	_uiInfo+10,a
1110                     ; 363 		for( i=0; i<uiInfo.valve; i++ )
1112  028a 0f06          	clr	(OFST+0,sp)
1114  028c 2014          	jra	L153
1115  028e               L543:
1116                     ; 365 			uiInfo.valve_len[i] = p[j++];
1118  028e 5f            	clrw	x
1119  028f 97            	ld	xl,a
1120  0290 7b03          	ld	a,(OFST-3,sp)
1121  0292 0c03          	inc	(OFST-3,sp)
1122  0294 905f          	clrw	y
1123  0296 9097          	ld	yl,a
1124  0298 72f904        	addw	y,(OFST-2,sp)
1125  029b 90f6          	ld	a,(y)
1126  029d d70015        	ld	(_uiInfo+21,x),a
1127                     ; 363 		for( i=0; i<uiInfo.valve; i++ )
1129  02a0 0c06          	inc	(OFST+0,sp)
1130  02a2               L153:
1133  02a2 7b06          	ld	a,(OFST+0,sp)
1134  02a4 c1000a        	cp	a,_uiInfo+10
1135  02a7 25e5          	jrult	L543
1136                     ; 367 		uiInfo.cnt = p[j++];
1138  02a9 7b03          	ld	a,(OFST-3,sp)
1139  02ab 0c03          	inc	(OFST-3,sp)
1140  02ad 5f            	clrw	x
1141  02ae 97            	ld	xl,a
1142  02af 72fb04        	addw	x,(OFST-2,sp)
1143  02b2 f6            	ld	a,(x)
1144  02b3 c70005        	ld	_uiInfo+5,a
1145                     ; 368 		for( i=0; i<uiInfo.valve; i++ )
1147  02b6 0f06          	clr	(OFST+0,sp)
1149  02b8 2022          	jra	L163
1150  02ba               L553:
1151                     ; 370 			m = p[j++];	//	valve
1153  02ba 0c03          	inc	(OFST-3,sp)
1154  02bc 5f            	clrw	x
1155  02bd 97            	ld	xl,a
1156  02be 72fb04        	addw	x,(OFST-2,sp)
1157  02c1 f6            	ld	a,(x)
1158  02c2 6b01          	ld	(OFST-5,sp),a
1159                     ; 371 			n = p[j++];	//	id
1161  02c4 7b03          	ld	a,(OFST-3,sp)
1162  02c6 0c03          	inc	(OFST-3,sp)
1163  02c8 5f            	clrw	x
1164  02c9 97            	ld	xl,a
1165  02ca 72fb04        	addw	x,(OFST-2,sp)
1166  02cd f6            	ld	a,(x)
1167  02ce 6b02          	ld	(OFST-4,sp),a
1168                     ; 372 			uiInfo.valve_rc[m-1] = n;
1170  02d0 5f            	clrw	x
1171  02d1 7b01          	ld	a,(OFST-5,sp)
1172  02d3 97            	ld	xl,a
1173  02d4 5a            	decw	x
1174  02d5 7b02          	ld	a,(OFST-4,sp)
1175  02d7 d7001d        	ld	(_uiInfo+29,x),a
1176                     ; 368 		for( i=0; i<uiInfo.valve; i++ )
1178  02da 0c06          	inc	(OFST+0,sp)
1179  02dc               L163:
1182  02dc 7b06          	ld	a,(OFST+0,sp)
1183  02de c1000a        	cp	a,_uiInfo+10
1184  02e1 7b03          	ld	a,(OFST-3,sp)
1185  02e3 25d5          	jrult	L553
1186                     ; 374 		uiInfo.lpmType = p[j++];	//0, 8, 10, 15, 20
1188  02e5 0c03          	inc	(OFST-3,sp)
1189  02e7 5f            	clrw	x
1190  02e8 97            	ld	xl,a
1191  02e9 72fb04        	addw	x,(OFST-2,sp)
1192  02ec f6            	ld	a,(x)
1193  02ed c70013        	ld	_uiInfo+19,a
1194                     ; 375 		uiInfo.houseCapa = p[j++];	//	HouseCapa
1196  02f0 7b03          	ld	a,(OFST-3,sp)
1197  02f2 0c03          	inc	(OFST-3,sp)
1198  02f4 5f            	clrw	x
1199  02f5 97            	ld	xl,a
1200  02f6 72fb04        	addw	x,(OFST-2,sp)
1201  02f9 f6            	ld	a,(x)
1202  02fa c70010        	ld	_uiInfo+16,a
1203                     ; 376 		uiInfo.cntlMode = p[j++];	//0 local, 1 each
1205  02fd 7b03          	ld	a,(OFST-3,sp)
1206  02ff 0c03          	inc	(OFST-3,sp)
1207  0301 5f            	clrw	x
1208  0302 97            	ld	xl,a
1209  0303 72fb04        	addw	x,(OFST-2,sp)
1210  0306 f6            	ld	a,(x)
1211  0307 c70003        	ld	_uiInfo+3,a
1212                     ; 377 		uiInfo.poType = p[j++];		//0 xe10, ...
1214  030a 7b03          	ld	a,(OFST-3,sp)
1215  030c 0c03          	inc	(OFST-3,sp)
1216  030e 5f            	clrw	x
1217  030f 97            	ld	xl,a
1218  0310 72fb04        	addw	x,(OFST-2,sp)
1219  0313 f6            	ld	a,(x)
1220  0314 c7000f        	ld	_uiInfo+15,a
1221                     ; 379 		STATUS_NEXT(next);	
1223  0317 7b08          	ld	a,(OFST+2,sp)
1224  0319 c70000        	ld	__ds,a
1227  031c 725f0000      	clr	__dsCount
1230  0320 35ff0000      	mov	__dsPrev,#255
1233  0324 2008          	jra	L563
1234  0326               L523:
1235                     ; 381 	else if( key == 2 )
1237  0326 a102          	cp	a,#2
1238  0328 2604          	jrne	L563
1239                     ; 383 		return 1;
1241  032a a601          	ld	a,#1
1243  032c 2001          	jra	L27
1244  032e               L563:
1245                     ; 385 	return 0;
1247  032e 4f            	clr	a
1249  032f               L27:
1251  032f 5b08          	addw	sp,#8
1252  0331 81            	ret	
1255                     	switch	.data
1256  004c               __d_cursor:
1257  004c 00            	dc.b	0
1258  004d               __d_buf:
1259  004d 01            	dc.b	1
1260  004e 01            	dc.b	1
1261  004f 01            	dc.b	1
1262  0050 01            	dc.b	1
1316                     ; 391 void	config_disp2(uint8_t key, uint8_t next)
1316                     ; 392 {
1317                     	switch	.text
1318  0332               _config_disp2:
1320  0332 89            	pushw	x
1321  0333 88            	push	a
1322       00000001      OFST:	set	1
1325                     ; 398 	if( _dsCount == 0 )
1327  0334 c60000        	ld	a,__dsCount
1328  0337 261a          	jrne	L114
1329                     ; 400 		lcd_clear(0);
1331  0339 cd0000        	call	_lcd_clear
1333                     ; 401 		lcd_blink_npos_clear();
1335  033c cd03c6        	call	LC012
1337                     ; 403 		lcd_disp_n(_d_cursor, _d_buf[_d_cursor]);
1339  033f cd03cf        	call	LC013
1340  0342 d6004d        	ld	a,(__d_buf,x)
1341  0345 97            	ld	xl,a
1342  0346 c6004c        	ld	a,__d_cursor
1343  0349 95            	ld	xh,a
1344  034a cd0000        	call	_lcd_disp_n
1346                     ; 404 		_dsCount = 1;
1348  034d 35010000      	mov	__dsCount,#1
1350  0351 2046          	jra	L314
1351  0353               L114:
1352                     ; 408 		i = _d_buf[_d_cursor];
1354  0353 ad7a          	call	LC013
1355  0355 d6004d        	ld	a,(__d_buf,x)
1356  0358 6b01          	ld	(OFST+0,sp),a
1357                     ; 409 		if( uiInfo.enc != 0 )
1359  035a c60000        	ld	a,_uiInfo
1360  035d 2726          	jreq	L514
1361                     ; 411 			if( (uiInfo.enc & 0x40) == 0 )
1363  035f a540          	bcp	a,#64
1364  0361 260d          	jrne	L714
1365                     ; 413 				if( i==1 )	i = 9;
1367  0363 7b01          	ld	a,(OFST+0,sp)
1368  0365 4a            	dec	a
1369  0366 2604          	jrne	L124
1372  0368 a609          	ld	a,#9
1374  036a 200c          	jp	LC011
1375  036c               L124:
1376                     ; 415 					i--;
1378  036c 0a01          	dec	(OFST+0,sp)
1379  036e 200e          	jra	L524
1380  0370               L714:
1381                     ; 419 				if( i==9 )	i = 1;
1383  0370 7b01          	ld	a,(OFST+0,sp)
1384  0372 a109          	cp	a,#9
1385  0374 2606          	jrne	L724
1388  0376 a601          	ld	a,#1
1389  0378               LC011:
1390  0378 6b01          	ld	(OFST+0,sp),a
1392  037a 2002          	jra	L524
1393  037c               L724:
1394                     ; 421 					i++;
1396  037c 0c01          	inc	(OFST+0,sp)
1397  037e               L524:
1398                     ; 423 			_d_buf[_d_cursor] = i;
1400  037e ad4f          	call	LC013
1401  0380 7b01          	ld	a,(OFST+0,sp)
1402  0382 d7004d        	ld	(__d_buf,x),a
1403  0385               L514:
1404                     ; 425 		if( _dsPrev != i )
1406  0385 c60000        	ld	a,__dsPrev
1407  0388 1101          	cp	a,(OFST+0,sp)
1408  038a 270d          	jreq	L314
1409                     ; 427 			_dsPrev = i;
1411  038c 7b01          	ld	a,(OFST+0,sp)
1412  038e c70000        	ld	__dsPrev,a
1413                     ; 428 			lcd_disp_n(_d_cursor, i);
1415  0391 97            	ld	xl,a
1416  0392 c6004c        	ld	a,__d_cursor
1417  0395 95            	ld	xh,a
1418  0396 cd0000        	call	_lcd_disp_n
1420  0399               L314:
1421                     ; 431 	if( key == 1 )		
1423  0399 7b02          	ld	a,(OFST+1,sp)
1424  039b a101          	cp	a,#1
1425  039d 2613          	jrne	L534
1426                     ; 433 		_d_cursor++;
1428  039f 725c004c      	inc	__d_cursor
1429                     ; 434 		if( _d_cursor == 4 )
1431  03a3 c6004c        	ld	a,__d_cursor
1432  03a6 a104          	cp	a,#4
1433  03a8 2604          	jrne	L734
1434                     ; 435 			_d_cursor = 0;
1436  03aa 725f004c      	clr	__d_cursor
1437  03ae               L734:
1438                     ; 436 		lcd_blink_npos_clear();
1440  03ae ad16          	call	LC012
1442                     ; 437 		lcd_blink_npos(_d_cursor);
1443  03b0 2011          	jra	L144
1444  03b2               L534:
1445                     ; 439 	else if( key == 4 )
1447  03b2 a104          	cp	a,#4
1448  03b4 260d          	jrne	L144
1449                     ; 441 		STATUS_NEXT(next);	
1451  03b6 7b03          	ld	a,(OFST+2,sp)
1452  03b8 c70000        	ld	__ds,a
1455  03bb 725f0000      	clr	__dsCount
1458  03bf 35ff0000      	mov	__dsPrev,#255
1460  03c3               L144:
1461                     ; 443 }
1464  03c3 5b03          	addw	sp,#3
1465  03c5 81            	ret	
1466  03c6               LC012:
1467  03c6 cd0000        	call	_lcd_blink_npos_clear
1469                     ; 437 		lcd_blink_npos(_d_cursor);
1471  03c9 c6004c        	ld	a,__d_cursor
1472  03cc cc0000        	jp	_lcd_blink_npos
1473  03cf               LC013:
1474  03cf c6004c        	ld	a,__d_cursor
1475  03d2 5f            	clrw	x
1476  03d3 97            	ld	xl,a
1477  03d4 81            	ret	
1636                     	xdef	_config_disp2
1637                     	xdef	__d_buf
1638                     	xdef	__d_cursor
1639                     	xdef	_config_disp
1640                     	xdef	_config_disp_item
1641                     	xdef	_config_disp_c3
1642                     	xdef	_config_disp_c2
1643                     	xdef	_config_disp_c1
1644                     	xdef	__config_id
1645                     	xdef	_config_title
1646                     	xdef	__c3_e
1647                     	xdef	__c3_b
1648                     	xdef	__c2_e
1649                     	xdef	__c2_b
1650                     	xdef	__c2_a
1651                     	xdef	__c1_b
1652                     	xdef	__c1_a
1653                     	xdef	__config
1654                     	xdef	__config_data_8be0
1655                     	xdef	__config_data_8ae1
1656                     	xdef	__config_data_59be
1657                     	xdef	__config_data_59ae
1658                     	xref	__dsPrev
1659                     	xref	__dsCount
1660                     	xref	__ds
1661                     	xref	_lcd_blink_npos
1662                     	xref	_lcd_blink_npos_clear
1663                     	xref	_lcd_clear_npos
1664                     	xref	_lcd_disp_n
1665                     	xref	_lcd_clear
1666                     	xref	_lcd_clear_n
1667                     	xref	_iLF_DEF
1668                     	xref	_bLF_DEF
1669                     	xref	_uiInfo
1688                     	end
