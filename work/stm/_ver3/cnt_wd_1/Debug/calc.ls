   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _tbl_coil_trans:
  25  0000 00            	dc.b	0
  26  0001 00            	dc.b	0
  27  0002 00            	dc.b	0
  28  0003 00            	dc.b	0
  29  0004 00            	dc.b	0
  30  0005 00            	dc.b	0
  31  0006 00            	dc.b	0
  32  0007 00            	dc.b	0
  33  0008 00            	dc.b	0
  34  0009 00            	dc.b	0
  35  000a 00            	dc.b	0
  36  000b 00            	dc.b	0
  37  000c 00            	dc.b	0
  38  000d 00            	dc.b	0
  39  000e 00            	dc.b	0
  40  000f 00            	dc.b	0
  41  0010               _tbl_temp:
  42  0010 00            	dc.b	0
  43  0011 00            	dc.b	0
  44  0012 00            	dc.b	0
  45  0013 00            	dc.b	0
  46  0014 00            	dc.b	0
  47  0015 00            	dc.b	0
  48  0016 00            	dc.b	0
  49  0017 00            	dc.b	0
  50  0018 00            	dc.b	0
  51  0019 00            	dc.b	0
  52  001a 00            	dc.b	0
  53  001b 00            	dc.b	0
  54  001c 00            	dc.b	0
  55  001d 00            	dc.b	0
  56  001e 00            	dc.b	0
  57  001f 00            	dc.b	0
  58                     .const:	section	.text
  59  0000               _tbl_sqrt:
  60  0000 ff            	dc.b	255
  61  0001 ff            	dc.b	255
  62  0002 ff            	dc.b	255
  63  0003 ff            	dc.b	255
  64  0004 ff            	dc.b	255
  65  0005 ff            	dc.b	255
  66  0006 ff            	dc.b	255
  67  0007 ff            	dc.b	255
  68  0008 ff            	dc.b	255
  69  0009 ff            	dc.b	255
  70  000a ff            	dc.b	255
  71  000b ff            	dc.b	255
  72  000c ff            	dc.b	255
  73  000d ff            	dc.b	255
  74  000e ff            	dc.b	255
  75  000f fa            	dc.b	250
  76  0010 f3            	dc.b	243
  77  0011 ec            	dc.b	236
  78  0012 e5            	dc.b	229
  79  0013 e0            	dc.b	224
  80  0014 da            	dc.b	218
  81  0015 d5            	dc.b	213
  82  0016 d1            	dc.b	209
  83  0017 cc            	dc.b	204
  84  0018 c8            	dc.b	200
  85  0019 c4            	dc.b	196
  86  001a c0            	dc.b	192
  87  001b bd            	dc.b	189
  88  001c ba            	dc.b	186
  89  001d b7            	dc.b	183
  90  001e b4            	dc.b	180
  91  001f b1            	dc.b	177
  92  0020 ae            	dc.b	174
  93  0021 ab            	dc.b	171
  94  0022 a9            	dc.b	169
  95  0023 a7            	dc.b	167
  96  0024 a4            	dc.b	164
  97  0025 a2            	dc.b	162
  98  0026 a0            	dc.b	160
  99  0027 9e            	dc.b	158
 100  0028 9c            	dc.b	156
 101  0029 9a            	dc.b	154
 102  002a 98            	dc.b	152
 103  002b 97            	dc.b	151
 104  002c 95            	dc.b	149
 105  002d 93            	dc.b	147
 106  002e 92            	dc.b	146
 107  002f 90            	dc.b	144
 108  0030 8f            	dc.b	143
 109  0031 8d            	dc.b	141
 110  0032 8c            	dc.b	140
 111  0033 8b            	dc.b	139
 112  0034 89            	dc.b	137
 113  0035 88            	dc.b	136
 114  0036 87            	dc.b	135
 115  0037 86            	dc.b	134
 116  0038 84            	dc.b	132
 117  0039 83            	dc.b	131
 118  003a 82            	dc.b	130
 119  003b 81            	dc.b	129
 120  003c 80            	dc.b	128
 121  003d 7f            	dc.b	127
 122  003e 7e            	dc.b	126
 123  003f 7d            	dc.b	125
 124  0040 7c            	dc.b	124
 125  0041 7b            	dc.b	123
 126  0042 7a            	dc.b	122
 127  0043 79            	dc.b	121
 128  0044 78            	dc.b	120
 129  0045 78            	dc.b	120
 130  0046 77            	dc.b	119
 131  0047 76            	dc.b	118
 132  0048 75            	dc.b	117
 133  0049 74            	dc.b	116
 134  004a 73            	dc.b	115
 135  004b 73            	dc.b	115
 136  004c 72            	dc.b	114
 137  004d 71            	dc.b	113
 138  004e 71            	dc.b	113
 139  004f 70            	dc.b	112
 140  0050 6f            	dc.b	111
 141  0051 6e            	dc.b	110
 142  0052 6e            	dc.b	110
 143  0053 6d            	dc.b	109
 144  0054 6c            	dc.b	108
 145  0055 6c            	dc.b	108
 146  0056 6b            	dc.b	107
 147  0057 6b            	dc.b	107
 148  0058 6a            	dc.b	106
 149  0059 69            	dc.b	105
 150  005a 69            	dc.b	105
 151  005b 68            	dc.b	104
 152  005c 68            	dc.b	104
 153  005d 67            	dc.b	103
 154  005e 67            	dc.b	103
 155  005f 66            	dc.b	102
 156  0060 66            	dc.b	102
 157  0061 65            	dc.b	101
 158  0062 65            	dc.b	101
 159  0063 64            	dc.b	100
 160  0064 64            	dc.b	100
 161  0065               _tbl_predict:
 162  0065 00            	dc.b	0
 163  0066 2d            	dc.b	45
 164  0067 2d            	dc.b	45
 165  0068 2e            	dc.b	46
 166  0069 2e            	dc.b	46
 167  006a 2f            	dc.b	47
 168  006b 30            	dc.b	48
 169  006c 30            	dc.b	48
 170  006d 32            	dc.b	50
 171  006e 33            	dc.b	51
 172  006f 34            	dc.b	52
 173  0070 35            	dc.b	53
 174  0071 37            	dc.b	55
 175  0072 39            	dc.b	57
 176  0073 3b            	dc.b	59
 177  0074 3d            	dc.b	61
 178  0075 3f            	dc.b	63
 179  0076 42            	dc.b	66
 180  0077 44            	dc.b	68
 181  0078 47            	dc.b	71
 182  0079 4a            	dc.b	74
 183  007a 4c            	dc.b	76
 184  007b 4f            	dc.b	79
 185  007c 51            	dc.b	81
 186  007d 54            	dc.b	84
 187  007e 56            	dc.b	86
 188  007f 58            	dc.b	88
 189  0080 5a            	dc.b	90
 190  0081 5d            	dc.b	93
 191  0082 5f            	dc.b	95
 192  0083 61            	dc.b	97
 193  0084 63            	dc.b	99
 194  0085 65            	dc.b	101
 195  0086 67            	dc.b	103
 196  0087 69            	dc.b	105
 197  0088 6b            	dc.b	107
 198  0089 6d            	dc.b	109
 199  008a 70            	dc.b	112
 200  008b 72            	dc.b	114
 201  008c 74            	dc.b	116
 202  008d 76            	dc.b	118
 203  008e 78            	dc.b	120
 204  008f 7a            	dc.b	122
 205  0090 7c            	dc.b	124
 206  0091 7e            	dc.b	126
 207  0092 80            	dc.b	128
 208  0093 82            	dc.b	130
 209  0094 84            	dc.b	132
 210  0095 86            	dc.b	134
 211  0096 88            	dc.b	136
 212  0097 8a            	dc.b	138
 213  0098 8c            	dc.b	140
 214  0099 8d            	dc.b	141
 215  009a 8f            	dc.b	143
 216  009b 91            	dc.b	145
 217  009c 93            	dc.b	147
 218  009d 95            	dc.b	149
 219  009e 97            	dc.b	151
 220  009f 98            	dc.b	152
 221  00a0 9a            	dc.b	154
 222  00a1 9c            	dc.b	156
 223  00a2 9e            	dc.b	158
 224  00a3 9f            	dc.b	159
 225  00a4 a1            	dc.b	161
 226  00a5 a2            	dc.b	162
 227  00a6 a4            	dc.b	164
 228  00a7 a5            	dc.b	165
 229  00a8 a7            	dc.b	167
 230  00a9 a8            	dc.b	168
 231  00aa a9            	dc.b	169
 232  00ab ab            	dc.b	171
 233  00ac ac            	dc.b	172
 234  00ad ad            	dc.b	173
 235  00ae ae            	dc.b	174
 236  00af b0            	dc.b	176
 237  00b0 b1            	dc.b	177
 238  00b1 b2            	dc.b	178
 239  00b2 b3            	dc.b	179
 240  00b3 b4            	dc.b	180
 241  00b4 b5            	dc.b	181
 242  00b5 b6            	dc.b	182
 243  00b6 b7            	dc.b	183
 244  00b7 b8            	dc.b	184
 245  00b8 b9            	dc.b	185
 246  00b9 ba            	dc.b	186
 247  00ba bb            	dc.b	187
 248  00bb bc            	dc.b	188
 249  00bc bd            	dc.b	189
 250  00bd be            	dc.b	190
 251  00be bf            	dc.b	191
 252  00bf c0            	dc.b	192
 253  00c0 c1            	dc.b	193
 254  00c1 c2            	dc.b	194
 255  00c2 c2            	dc.b	194
 256  00c3 c3            	dc.b	195
 257  00c4 c4            	dc.b	196
 258  00c5 c5            	dc.b	197
 259  00c6 c6            	dc.b	198
 260  00c7 c6            	dc.b	198
 261  00c8 c7            	dc.b	199
 262  00c9 c8            	dc.b	200
 263  00ca               _tbl_predict2:
 264  00ca 2d            	dc.b	45
 265  00cb 2d            	dc.b	45
 266  00cc 2d            	dc.b	45
 267  00cd 2d            	dc.b	45
 268  00ce 2d            	dc.b	45
 269  00cf 2d            	dc.b	45
 270  00d0 2d            	dc.b	45
 271  00d1 2d            	dc.b	45
 272  00d2 2d            	dc.b	45
 273  00d3 2e            	dc.b	46
 274  00d4 2e            	dc.b	46
 275  00d5 2f            	dc.b	47
 276  00d6 2f            	dc.b	47
 277  00d7 2f            	dc.b	47
 278  00d8 30            	dc.b	48
 279  00d9 31            	dc.b	49
 280  00da 31            	dc.b	49
 281  00db 32            	dc.b	50
 282  00dc 32            	dc.b	50
 283  00dd 33            	dc.b	51
 284  00de 34            	dc.b	52
 285  00df 34            	dc.b	52
 286  00e0 35            	dc.b	53
 287  00e1 36            	dc.b	54
 288  00e2 36            	dc.b	54
 289  00e3 37            	dc.b	55
 290  00e4 37            	dc.b	55
 291  00e5 38            	dc.b	56
 292  00e6 39            	dc.b	57
 293  00e7 39            	dc.b	57
 294  00e8 3a            	dc.b	58
 295  00e9 3b            	dc.b	59
 296  00ea 3b            	dc.b	59
 297  00eb 3c            	dc.b	60
 298  00ec 3d            	dc.b	61
 299  00ed 3e            	dc.b	62
 300  00ee 3f            	dc.b	63
 301  00ef 40            	dc.b	64
 302  00f0 41            	dc.b	65
 303  00f1 42            	dc.b	66
 304  00f2 43            	dc.b	67
 305  00f3 44            	dc.b	68
 306  00f4 45            	dc.b	69
 307  00f5 47            	dc.b	71
 308  00f6 48            	dc.b	72
 309  00f7 49            	dc.b	73
 310  00f8 4a            	dc.b	74
 311  00f9 4c            	dc.b	76
 312  00fa 4d            	dc.b	77
 313  00fb 4e            	dc.b	78
 314  00fc 4f            	dc.b	79
 315  00fd 51            	dc.b	81
 316  00fe 52            	dc.b	82
 317  00ff 54            	dc.b	84
 318  0100 55            	dc.b	85
 319  0101 57            	dc.b	87
 320  0102 58            	dc.b	88
 321  0103 5a            	dc.b	90
 322  0104 5b            	dc.b	91
 323  0105 5d            	dc.b	93
 324  0106 5e            	dc.b	94
 325  0107 60            	dc.b	96
 326  0108 61            	dc.b	97
 327  0109 63            	dc.b	99
 328  010a 64            	dc.b	100
 329  010b 66            	dc.b	102
 330  010c 67            	dc.b	103
 331  010d 69            	dc.b	105
 332  010e 6b            	dc.b	107
 333  010f 6c            	dc.b	108
 334  0110 6e            	dc.b	110
 335  0111 6f            	dc.b	111
 336  0112 71            	dc.b	113
 337  0113 73            	dc.b	115
 338  0114 74            	dc.b	116
 339  0115 76            	dc.b	118
 340  0116 78            	dc.b	120
 341  0117 7a            	dc.b	122
 342  0118 7c            	dc.b	124
 343  0119 7e            	dc.b	126
 344  011a 80            	dc.b	128
 345  011b 82            	dc.b	130
 346  011c 84            	dc.b	132
 347  011d 87            	dc.b	135
 348  011e 89            	dc.b	137
 349  011f 8c            	dc.b	140
 350  0120 8f            	dc.b	143
 351  0121 91            	dc.b	145
 352  0122 94            	dc.b	148
 353  0123 97            	dc.b	151
 354  0124 9a            	dc.b	154
 355  0125 9e            	dc.b	158
 356  0126 a1            	dc.b	161
 357  0127 a5            	dc.b	165
 358  0128 a9            	dc.b	169
 359  0129 ad            	dc.b	173
 360  012a b2            	dc.b	178
 361  012b b7            	dc.b	183
 362  012c bc            	dc.b	188
 363  012d c2            	dc.b	194
 364  012e c8            	dc.b	200
 412                     ; 95 uint16_t	calc_make_normal_long(void)
 412                     ; 96 {
 414                     .text:	section	.text,new
 415  0000               _calc_make_normal_long:
 417  0000 5203          	subw	sp,#3
 418       00000003      OFST:	set	3
 421                     ; 98 	uint16_t	s = 0;
 423  0002 5f            	clrw	x
 424  0003 1f01          	ldw	(OFST-2,sp),x
 425                     ; 99 	for( i=0; i<TBL_SIZE; i++ )
 427  0005 4f            	clr	a
 428  0006 6b03          	ld	(OFST+0,sp),a
 429  0008               L72:
 430                     ; 101 		vtbl._r[i] = (uint8_t)((uint16_t)vtbl.coil[i] * (uint16_t)tbl_temp[i] / 100);
 432  0008 5f            	clrw	x
 433  0009 97            	ld	xl,a
 434  000a 89            	pushw	x
 435  000b 7b05          	ld	a,(OFST+2,sp)
 436  000d 5f            	clrw	x
 437  000e 97            	ld	xl,a
 438  000f d60010        	ld	a,(_vtbl+16,x)
 439  0012 5f            	clrw	x
 440  0013 97            	ld	xl,a
 441  0014 7b05          	ld	a,(OFST+2,sp)
 442  0016 905f          	clrw	y
 443  0018 9097          	ld	yl,a
 444  001a 90d60010      	ld	a,(_tbl_temp,y)
 445  001e 905f          	clrw	y
 446  0020 9097          	ld	yl,a
 447  0022 cd0000        	call	c_imul
 449  0025 a664          	ld	a,#100
 450  0027 62            	div	x,a
 451  0028 9f            	ld	a,xl
 452  0029 85            	popw	x
 453  002a d70086        	ld	(_vtbl+134,x),a
 454                     ; 102 		s += vtbl._r[i];
 456  002d 5f            	clrw	x
 457  002e 7b03          	ld	a,(OFST+0,sp)
 458  0030 97            	ld	xl,a
 459  0031 d60086        	ld	a,(_vtbl+134,x)
 460  0034 1b02          	add	a,(OFST-1,sp)
 461  0036 6b02          	ld	(OFST-1,sp),a
 462  0038 2402          	jrnc	L6
 463  003a 0c01          	inc	(OFST-2,sp)
 464  003c               L6:
 465                     ; 99 	for( i=0; i<TBL_SIZE; i++ )
 467  003c 0c03          	inc	(OFST+0,sp)
 470  003e 7b03          	ld	a,(OFST+0,sp)
 471  0040 a110          	cp	a,#16
 472  0042 25c4          	jrult	L72
 473                     ; 104 	return s;
 475  0044 1e01          	ldw	x,(OFST-2,sp)
 478  0046 5b03          	addw	sp,#3
 479  0048 81            	ret	
 519                     ; 107 uint8_t	calc_get_max_id(void)
 519                     ; 108 {
 520                     .text:	section	.text,new
 521  0000               _calc_get_max_id:
 523  0000 89            	pushw	x
 524       00000002      OFST:	set	2
 527                     ; 110 	uint8_t j = 0;
 529  0001 0f01          	clr	(OFST-1,sp)
 530                     ; 111 	for( i=1; i<TBL_SIZE; i++ )
 532  0003 a601          	ld	a,#1
 533  0005 6b02          	ld	(OFST+0,sp),a
 534  0007               L35:
 535                     ; 113 		if( vtbl.coil[j] < vtbl.coil[i] )
 537  0007 5f            	clrw	x
 538  0008 97            	ld	xl,a
 539  0009 7b01          	ld	a,(OFST-1,sp)
 540  000b 905f          	clrw	y
 541  000d 9097          	ld	yl,a
 542  000f 90d60010      	ld	a,(_vtbl+16,y)
 543  0013 d10010        	cp	a,(_vtbl+16,x)
 544  0016 2404          	jruge	L16
 545                     ; 114 			j = i;
 547  0018 7b02          	ld	a,(OFST+0,sp)
 548  001a 6b01          	ld	(OFST-1,sp),a
 549  001c               L16:
 550                     ; 111 	for( i=1; i<TBL_SIZE; i++ )
 552  001c 0c02          	inc	(OFST+0,sp)
 555  001e 7b02          	ld	a,(OFST+0,sp)
 556  0020 a110          	cp	a,#16
 557  0022 25e3          	jrult	L35
 558                     ; 116 	return j;
 560  0024 7b01          	ld	a,(OFST-1,sp)
 563  0026 85            	popw	x
 564  0027 81            	ret	
 604                     ; 119 uint8_t	calc_get_max_id2(void)
 604                     ; 120 {
 605                     .text:	section	.text,new
 606  0000               _calc_get_max_id2:
 608  0000 89            	pushw	x
 609       00000002      OFST:	set	2
 612                     ; 122 	uint8_t j = 0;
 614  0001 0f01          	clr	(OFST-1,sp)
 615                     ; 123 	for( i=1; i<TBL_SIZE; i++ )
 617  0003 a601          	ld	a,#1
 618  0005 6b02          	ld	(OFST+0,sp),a
 619  0007               L101:
 620                     ; 125 		if( vtbl._r[j] < vtbl._r[i] )
 622  0007 5f            	clrw	x
 623  0008 97            	ld	xl,a
 624  0009 7b01          	ld	a,(OFST-1,sp)
 625  000b 905f          	clrw	y
 626  000d 9097          	ld	yl,a
 627  000f 90d60086      	ld	a,(_vtbl+134,y)
 628  0013 d10086        	cp	a,(_vtbl+134,x)
 629  0016 2404          	jruge	L701
 630                     ; 126 			j = i;
 632  0018 7b02          	ld	a,(OFST+0,sp)
 633  001a 6b01          	ld	(OFST-1,sp),a
 634  001c               L701:
 635                     ; 123 	for( i=1; i<TBL_SIZE; i++ )
 637  001c 0c02          	inc	(OFST+0,sp)
 640  001e 7b02          	ld	a,(OFST+0,sp)
 641  0020 a110          	cp	a,#16
 642  0022 25e3          	jrult	L101
 643                     ; 128 	return j;
 645  0024 7b01          	ld	a,(OFST-1,sp)
 648  0026 85            	popw	x
 649  0027 81            	ret	
 706                     ; 131 uint16_t	calc_trans_long(void)
 706                     ; 132 {
 707                     .text:	section	.text,new
 708  0000               _calc_trans_long:
 710  0000 5205          	subw	sp,#5
 711       00000005      OFST:	set	5
 714                     ; 136 	uint16_t s = 0;
 716  0002 5f            	clrw	x
 717  0003 1f01          	ldw	(OFST-4,sp),x
 718                     ; 137 	k = calc_get_max_id();
 720  0005 cd0000        	call	_calc_get_max_id
 722                     ; 138 	k = vtbl.coil[k];
 724  0008 5f            	clrw	x
 725  0009 97            	ld	xl,a
 726  000a d60010        	ld	a,(_vtbl+16,x)
 727  000d 6b03          	ld	(OFST-2,sp),a
 728                     ; 139 	for( i=0; i<TBL_SIZE; i++ )
 730  000f 4f            	clr	a
 731  0010 6b05          	ld	(OFST+0,sp),a
 732  0012               L331:
 733                     ; 141 		sqr = (uint8_t)((uint16_t)vtbl.coil[i] * 100 / k);
 735  0012 5f            	clrw	x
 736  0013 97            	ld	xl,a
 737  0014 d60010        	ld	a,(_vtbl+16,x)
 738  0017 5f            	clrw	x
 739  0018 97            	ld	xl,a
 740  0019 90ae0064      	ldw	y,#100
 741  001d cd0000        	call	c_imul
 743  0020 7b03          	ld	a,(OFST-2,sp)
 744  0022 62            	div	x,a
 745  0023 9f            	ld	a,xl
 746  0024 6b04          	ld	(OFST-1,sp),a
 747                     ; 142 		tbl_coil_trans[i] = tbl_sqrt[sqr];
 749  0026 5f            	clrw	x
 750  0027 7b05          	ld	a,(OFST+0,sp)
 751  0029 97            	ld	xl,a
 752  002a 7b04          	ld	a,(OFST-1,sp)
 753  002c 905f          	clrw	y
 754  002e 9097          	ld	yl,a
 755  0030 90d60000      	ld	a,(_tbl_sqrt,y)
 756  0034 d70000        	ld	(_tbl_coil_trans,x),a
 757                     ; 143 		s += vtbl.coil[i];
 759  0037 5f            	clrw	x
 760  0038 7b05          	ld	a,(OFST+0,sp)
 761  003a 97            	ld	xl,a
 762  003b d60010        	ld	a,(_vtbl+16,x)
 763  003e 1b02          	add	a,(OFST-3,sp)
 764  0040 6b02          	ld	(OFST-3,sp),a
 765  0042 2402          	jrnc	L02
 766  0044 0c01          	inc	(OFST-4,sp)
 767  0046               L02:
 768                     ; 139 	for( i=0; i<TBL_SIZE; i++ )
 770  0046 0c05          	inc	(OFST+0,sp)
 773  0048 7b05          	ld	a,(OFST+0,sp)
 774  004a a110          	cp	a,#16
 775  004c 25c4          	jrult	L331
 776                     ; 145 	return s;	
 778  004e 1e01          	ldw	x,(OFST-4,sp)
 781  0050 5b05          	addw	sp,#5
 782  0052 81            	ret	
 831                     ; 148 void	calc_trans_long2(void)
 831                     ; 149 {
 832                     .text:	section	.text,new
 833  0000               _calc_trans_long2:
 835  0000 5203          	subw	sp,#3
 836       00000003      OFST:	set	3
 839                     ; 153 	j = calc_get_max_id2();
 841  0002 cd0000        	call	_calc_get_max_id2
 843  0005 6b01          	ld	(OFST-2,sp),a
 844                     ; 154 	k = vtbl._r[j];
 846  0007 ad6c          	call	LC002
 847  0009 6b02          	ld	(OFST-1,sp),a
 848                     ; 155 	for( i=0; i<TBL_SIZE; i++ )
 850  000b 4f            	clr	a
 851  000c 6b03          	ld	(OFST+0,sp),a
 852  000e               L161:
 853                     ; 157 		vtbl._r[i] = (uint8_t)((uint16_t)vtbl._r[i] * 100 / k);
 855  000e 5f            	clrw	x
 856  000f 97            	ld	xl,a
 857  0010 89            	pushw	x
 858  0011 7b05          	ld	a,(OFST+2,sp)
 859  0013 ad55          	call	LC001
 861  0015 7b04          	ld	a,(OFST+1,sp)
 862  0017 62            	div	x,a
 863  0018 9f            	ld	a,xl
 864  0019 85            	popw	x
 865  001a d70086        	ld	(_vtbl+134,x),a
 866                     ; 155 	for( i=0; i<TBL_SIZE; i++ )
 868  001d 0c03          	inc	(OFST+0,sp)
 871  001f 7b03          	ld	a,(OFST+0,sp)
 872  0021 a110          	cp	a,#16
 873  0023 25e9          	jrult	L161
 874                     ; 159 	for( i=0; i<TBL_SIZE; i++ )
 876  0025 4f            	clr	a
 877  0026 6b03          	ld	(OFST+0,sp),a
 878  0028               L761:
 879                     ; 161 		vtbl._r[i] = (uint8_t)((uint16_t)vtbl._r[i] * 100 / tbl_coil_trans[i]);
 881  0028 5f            	clrw	x
 882  0029 97            	ld	xl,a
 883  002a 89            	pushw	x
 884  002b 7b05          	ld	a,(OFST+2,sp)
 885  002d ad3b          	call	LC001
 887  002f 7b05          	ld	a,(OFST+2,sp)
 888  0031 905f          	clrw	y
 889  0033 9097          	ld	yl,a
 890  0035 90d60000      	ld	a,(_tbl_coil_trans,y)
 891  0039 62            	div	x,a
 892  003a 9f            	ld	a,xl
 893  003b 85            	popw	x
 894  003c d70086        	ld	(_vtbl+134,x),a
 895                     ; 159 	for( i=0; i<TBL_SIZE; i++ )
 897  003f 0c03          	inc	(OFST+0,sp)
 900  0041 7b03          	ld	a,(OFST+0,sp)
 901  0043 a110          	cp	a,#16
 902  0045 25e1          	jrult	L761
 903                     ; 163 	k = vtbl._r[j];
 905  0047 7b01          	ld	a,(OFST-2,sp)
 906  0049 ad2a          	call	LC002
 907  004b 6b02          	ld	(OFST-1,sp),a
 908                     ; 164 	for( i=0; i<TBL_SIZE; i++ )
 910  004d 4f            	clr	a
 911  004e 6b03          	ld	(OFST+0,sp),a
 912  0050               L571:
 913                     ; 166 		vtbl._r[i] = (uint8_t)((uint16_t)vtbl._r[i] * 100 / k);
 915  0050 5f            	clrw	x
 916  0051 97            	ld	xl,a
 917  0052 89            	pushw	x
 918  0053 7b05          	ld	a,(OFST+2,sp)
 919  0055 ad13          	call	LC001
 921  0057 7b04          	ld	a,(OFST+1,sp)
 922  0059 62            	div	x,a
 923  005a 9f            	ld	a,xl
 924  005b 85            	popw	x
 925  005c d70086        	ld	(_vtbl+134,x),a
 926                     ; 164 	for( i=0; i<TBL_SIZE; i++ )
 928  005f 0c03          	inc	(OFST+0,sp)
 931  0061 7b03          	ld	a,(OFST+0,sp)
 932  0063 a110          	cp	a,#16
 933  0065 25e9          	jrult	L571
 934                     ; 168 }
 937  0067 5b03          	addw	sp,#3
 938  0069 81            	ret	
 939  006a               LC001:
 940  006a ad09          	call	LC002
 941  006c 5f            	clrw	x
 942  006d 97            	ld	xl,a
 943  006e 90ae0064      	ldw	y,#100
 944  0072 cc0000        	jp	c_imul
 945  0075               LC002:
 946  0075 5f            	clrw	x
 947  0076 97            	ld	xl,a
 948  0077 d60086        	ld	a,(_vtbl+134,x)
 949  007a 81            	ret	
 952                     	switch	.data
 953  0020               ___sol:
 954  0020 00            	dc.b	0
1013                     ; 172 uint8_t	calc_final(void)
1013                     ; 173 {
1014                     .text:	section	.text,new
1015  0000               _calc_final:
1017  0000 5210          	subw	sp,#16
1018       00000010      OFST:	set	16
1021                     ; 179 	i16 = calc_trans_long();
1023  0002 cd0000        	call	_calc_trans_long
1025  0005 1f0e          	ldw	(OFST-2,sp),x
1026                     ; 180 	j16 = calc_make_normal_long();
1028  0007 cd0000        	call	_calc_make_normal_long
1030  000a cd0000        	call	c_uitolx
1032  000d 96            	ldw	x,sp
1033  000e 1c000a        	addw	x,#OFST-6
1034  0011 cd0000        	call	c_rtol
1036                     ; 181 	j16 = j16/2;
1038  0014 040a          	srl	(OFST-6,sp)
1039  0016 060b          	rrc	(OFST-5,sp)
1040  0018 060c          	rrc	(OFST-4,sp)
1041  001a 060d          	rrc	(OFST-3,sp)
1042                     ; 182 	i16 = (uint16_t)(j16 * vtbl.max / i16); 
1044  001c 1e0e          	ldw	x,(OFST-2,sp)
1045  001e cd0000        	call	c_uitolx
1047  0021 96            	ldw	x,sp
1048  0022 1c0005        	addw	x,#OFST-11
1049  0025 cd0000        	call	c_rtol
1051  0028 5500960003    	mov	c_lreg+3,_vtbl+150
1052  002d 3f02          	clr	c_lreg+2
1053  002f 3f01          	clr	c_lreg+1
1054  0031 3f00          	clr	c_lreg
1055  0033 96            	ldw	x,sp
1056  0034 5c            	incw	x
1057  0035 cd0000        	call	c_rtol
1059  0038 96            	ldw	x,sp
1060  0039 1c000a        	addw	x,#OFST-6
1061  003c cd0000        	call	c_ltor
1063  003f 96            	ldw	x,sp
1064  0040 5c            	incw	x
1065  0041 cd0000        	call	c_lmul
1067  0044 96            	ldw	x,sp
1068  0045 1c0005        	addw	x,#OFST-11
1069  0048 cd0000        	call	c_ludv
1071  004b be02          	ldw	x,c_lreg+2
1072  004d 1f0e          	ldw	(OFST-2,sp),x
1073                     ; 183 	calc_trans_long2();
1075  004f cd0000        	call	_calc_trans_long2
1077                     ; 184 	for( i=0; i<TBL_SIZE; i++ )
1079  0052 4f            	clr	a
1080  0053 6b10          	ld	(OFST+0,sp),a
1081  0055               L522:
1082                     ; 186 		if( vtbl._r[i] != 0 )
1084  0055 5f            	clrw	x
1085  0056 97            	ld	xl,a
1086  0057 724d0086      	tnz	(_vtbl+134,x)
1087  005b 2721          	jreq	L332
1088                     ; 189 			if( funcInfo.opMode == 0 )
1090  005d 725d0011      	tnz	_funcInfo+17
1091  0061 2606          	jrne	L532
1092                     ; 190 				vtbl._r[i] = 200;
1094  0063 5f            	clrw	x
1095  0064 97            	ld	xl,a
1096  0065 a6c8          	ld	a,#200
1098  0067 2012          	jp	LC003
1099  0069               L532:
1100                     ; 192 				vtbl._r[i] = tbl_predict2[vtbl._r[i]];
1102  0069 5f            	clrw	x
1103  006a 97            	ld	xl,a
1104  006b 905f          	clrw	y
1105  006d 9097          	ld	yl,a
1106  006f 90d60086      	ld	a,(_vtbl+134,y)
1107  0073 905f          	clrw	y
1108  0075 9097          	ld	yl,a
1109  0077 90d600ca      	ld	a,(_tbl_predict2,y)
1110  007b               LC003:
1111  007b d70086        	ld	(_vtbl+134,x),a
1112  007e               L332:
1113                     ; 184 	for( i=0; i<TBL_SIZE; i++ )
1115  007e 0c10          	inc	(OFST+0,sp)
1118  0080 7b10          	ld	a,(OFST+0,sp)
1119  0082 a110          	cp	a,#16
1120  0084 25cf          	jrult	L522
1121                     ; 195 	i16 &= 0xff;
1123  0086 0f0e          	clr	(OFST-2,sp)
1124                     ; 196 	__sol = tbl_predict[i16];
1126  0088 1e0e          	ldw	x,(OFST-2,sp)
1127  008a d60065        	ld	a,(_tbl_predict,x)
1128  008d c70020        	ld	___sol,a
1129                     ; 199 	if( __sol != 0 )
1131  0090 2709          	jreq	L142
1132                     ; 204 		j = 32;
1134                     ; 205 		if( __sol < j )
1136  0092 a120          	cp	a,#32
1137  0094 2405          	jruge	L142
1138                     ; 206 			__sol = j;
1140  0096 a620          	ld	a,#32
1141  0098 c70020        	ld	___sol,a
1142  009b               L142:
1143                     ; 209 	return __sol;
1147  009b 5b10          	addw	sp,#16
1148  009d 81            	ret	
1220                     	xdef	_calc_final
1221                     	xdef	___sol
1222                     	xdef	_calc_trans_long2
1223                     	xdef	_calc_trans_long
1224                     	xdef	_calc_get_max_id2
1225                     	xdef	_calc_get_max_id
1226                     	xdef	_calc_make_normal_long
1227                     	xdef	_tbl_predict2
1228                     	xdef	_tbl_predict
1229                     	xdef	_tbl_sqrt
1230                     	xdef	_tbl_temp
1231                     	xdef	_tbl_coil_trans
1232                     	xref	_funcInfo
1233                     	xref	_vtbl
1234                     	xref.b	c_lreg
1235                     	xref.b	c_x
1254                     	xref	c_ludv
1255                     	xref	c_lmul
1256                     	xref	c_ltor
1257                     	xref	c_rtol
1258                     	xref	c_uitolx
1259                     	xref	c_imul
1260                     	end
