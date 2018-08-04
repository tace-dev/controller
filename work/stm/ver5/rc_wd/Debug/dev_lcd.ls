   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  58                     ; 8 void	lcd_blink(uint8_t mode)
  58                     ; 9 {
  60                     	switch	.text
  61  0000               _lcd_blink:
  65                     ; 30 }
  68  0000 81            	ret	
  71                     .const:	section	.text
  72  0000               _bLF_DEF:
  73  0000 01            	dc.b	1
  74  0001 02            	dc.b	2
  75  0002 04            	dc.b	4
  76  0003 08            	dc.b	8
  77  0004 10            	dc.b	16
  78  0005 20            	dc.b	32
  79  0006 40            	dc.b	64
  80  0007 80            	dc.b	128
  81  0008 02            	dc.b	2
  82  0009 04            	dc.b	4
  83  000a 08            	dc.b	8
  84  000b 10            	dc.b	16
  85  000c 20            	dc.b	32
  86  000d 40            	dc.b	64
  87  000e 80            	dc.b	128
  88  000f 01            	dc.b	1
  89  0010 10            	dc.b	16
  90  0011 20            	dc.b	32
  91  0012 40            	dc.b	64
  92  0013 80            	dc.b	128
  93  0014 01            	dc.b	1
  94  0015 02            	dc.b	2
  95  0016 04            	dc.b	4
  96  0017 08            	dc.b	8
  97  0018 20            	dc.b	32
  98  0019 40            	dc.b	64
  99  001a 80            	dc.b	128
 100  001b 01            	dc.b	1
 101  001c 02            	dc.b	2
 102  001d 04            	dc.b	4
 103  001e 08            	dc.b	8
 104  001f 10            	dc.b	16
 105  0020 01            	dc.b	1
 106  0021 02            	dc.b	2
 107  0022 04            	dc.b	4
 108  0023 08            	dc.b	8
 109  0024 10            	dc.b	16
 110  0025 20            	dc.b	32
 111  0026 40            	dc.b	64
 112  0027 80            	dc.b	128
 113  0028 02            	dc.b	2
 114  0029 04            	dc.b	4
 115  002a 08            	dc.b	8
 116  002b 10            	dc.b	16
 117  002c 20            	dc.b	32
 118  002d 40            	dc.b	64
 119  002e 80            	dc.b	128
 120  002f 01            	dc.b	1
 121  0030 10            	dc.b	16
 122  0031 20            	dc.b	32
 123  0032 40            	dc.b	64
 124  0033 80            	dc.b	128
 125  0034 01            	dc.b	1
 126  0035 02            	dc.b	2
 127  0036 04            	dc.b	4
 128  0037 08            	dc.b	8
 129  0038 20            	dc.b	32
 130  0039 40            	dc.b	64
 131  003a 80            	dc.b	128
 132  003b 01            	dc.b	1
 133  003c 02            	dc.b	2
 134  003d 04            	dc.b	4
 135  003e 08            	dc.b	8
 136  003f 10            	dc.b	16
 137  0040               _iLF_DEF:
 138  0040 00            	dc.b	0
 139  0041 00            	dc.b	0
 140  0042 00            	dc.b	0
 141  0043 00            	dc.b	0
 142  0044 00            	dc.b	0
 143  0045 00            	dc.b	0
 144  0046 00            	dc.b	0
 145  0047 00            	dc.b	0
 146  0048 01            	dc.b	1
 147  0049 01            	dc.b	1
 148  004a 01            	dc.b	1
 149  004b 01            	dc.b	1
 150  004c 01            	dc.b	1
 151  004d 01            	dc.b	1
 152  004e 01            	dc.b	1
 153  004f 02            	dc.b	2
 154  0050 03            	dc.b	3
 155  0051 03            	dc.b	3
 156  0052 03            	dc.b	3
 157  0053 03            	dc.b	3
 158  0054 04            	dc.b	4
 159  0055 04            	dc.b	4
 160  0056 04            	dc.b	4
 161  0057 04            	dc.b	4
 162  0058 04            	dc.b	4
 163  0059 04            	dc.b	4
 164  005a 04            	dc.b	4
 165  005b 05            	dc.b	5
 166  005c 05            	dc.b	5
 167  005d 05            	dc.b	5
 168  005e 05            	dc.b	5
 169  005f 05            	dc.b	5
 170  0060 07            	dc.b	7
 171  0061 07            	dc.b	7
 172  0062 07            	dc.b	7
 173  0063 07            	dc.b	7
 174  0064 07            	dc.b	7
 175  0065 07            	dc.b	7
 176  0066 07            	dc.b	7
 177  0067 07            	dc.b	7
 178  0068 08            	dc.b	8
 179  0069 08            	dc.b	8
 180  006a 08            	dc.b	8
 181  006b 08            	dc.b	8
 182  006c 08            	dc.b	8
 183  006d 08            	dc.b	8
 184  006e 08            	dc.b	8
 185  006f 09            	dc.b	9
 186  0070 0a            	dc.b	10
 187  0071 0a            	dc.b	10
 188  0072 0a            	dc.b	10
 189  0073 0a            	dc.b	10
 190  0074 0b            	dc.b	11
 191  0075 0b            	dc.b	11
 192  0076 0b            	dc.b	11
 193  0077 0b            	dc.b	11
 194  0078 0b            	dc.b	11
 195  0079 0b            	dc.b	11
 196  007a 0b            	dc.b	11
 197  007b 0c            	dc.b	12
 198  007c 0c            	dc.b	12
 199  007d 0c            	dc.b	12
 200  007e 0c            	dc.b	12
 201  007f 0c            	dc.b	12
 202  0080               __na:
 203  0080 02            	dc.b	2
 204  0081 13            	dc.b	19
 205  0082 33            	dc.b	51
 206  0083 32            	dc.b	50
 207  0084 22            	dc.b	34
 208  0085 12            	dc.b	18
 209  0086 00            	dc.b	0
 210  0087 13            	dc.b	19
 211  0088 33            	dc.b	51
 212  0089 00            	dc.b	0
 213  008a 00            	dc.b	0
 214  008b 00            	dc.b	0
 215  008c 00            	dc.b	0
 216  008d 00            	dc.b	0
 217  008e 02            	dc.b	2
 218  008f 13            	dc.b	19
 219  0090 23            	dc.b	35
 220  0091 22            	dc.b	34
 221  0092 32            	dc.b	50
 222  0093 00            	dc.b	0
 223  0094 00            	dc.b	0
 224  0095 02            	dc.b	2
 225  0096 13            	dc.b	19
 226  0097 23            	dc.b	35
 227  0098 33            	dc.b	51
 228  0099 32            	dc.b	50
 229  009a 00            	dc.b	0
 230  009b 00            	dc.b	0
 231  009c 12            	dc.b	18
 232  009d 23            	dc.b	35
 233  009e 13            	dc.b	19
 234  009f 33            	dc.b	51
 235  00a0 00            	dc.b	0
 236  00a1 00            	dc.b	0
 237  00a2 00            	dc.b	0
 238  00a3 02            	dc.b	2
 239  00a4 12            	dc.b	18
 240  00a5 23            	dc.b	35
 241  00a6 33            	dc.b	51
 242  00a7 32            	dc.b	50
 243  00a8 00            	dc.b	0
 244  00a9 00            	dc.b	0
 245  00aa 12            	dc.b	18
 246  00ab 23            	dc.b	35
 247  00ac 22            	dc.b	34
 248  00ad 32            	dc.b	50
 249  00ae 33            	dc.b	51
 250  00af 02            	dc.b	2
 251  00b0 00            	dc.b	0
 252  00b1 02            	dc.b	2
 253  00b2 13            	dc.b	19
 254  00b3 33            	dc.b	51
 255  00b4 00            	dc.b	0
 256  00b5 00            	dc.b	0
 257  00b6 00            	dc.b	0
 258  00b7 00            	dc.b	0
 259  00b8 02            	dc.b	2
 260  00b9 13            	dc.b	19
 261  00ba 33            	dc.b	51
 262  00bb 32            	dc.b	50
 263  00bc 22            	dc.b	34
 264  00bd 12            	dc.b	18
 265  00be 23            	dc.b	35
 266  00bf 02            	dc.b	2
 267  00c0 12            	dc.b	18
 268  00c1 23            	dc.b	35
 269  00c2 13            	dc.b	19
 270  00c3 33            	dc.b	51
 271  00c4 32            	dc.b	50
 272  00c5 00            	dc.b	0
 273  00c6               __nb:
 274  00c6 04            	dc.b	4
 275  00c7 15            	dc.b	21
 276  00c8 35            	dc.b	53
 277  00c9 34            	dc.b	52
 278  00ca 24            	dc.b	36
 279  00cb 14            	dc.b	20
 280  00cc 00            	dc.b	0
 281  00cd 15            	dc.b	21
 282  00ce 35            	dc.b	53
 283  00cf 00            	dc.b	0
 284  00d0 00            	dc.b	0
 285  00d1 00            	dc.b	0
 286  00d2 00            	dc.b	0
 287  00d3 00            	dc.b	0
 288  00d4 04            	dc.b	4
 289  00d5 15            	dc.b	21
 290  00d6 25            	dc.b	37
 291  00d7 24            	dc.b	36
 292  00d8 34            	dc.b	52
 293  00d9 00            	dc.b	0
 294  00da 00            	dc.b	0
 295  00db 04            	dc.b	4
 296  00dc 15            	dc.b	21
 297  00dd 25            	dc.b	37
 298  00de 35            	dc.b	53
 299  00df 34            	dc.b	52
 300  00e0 00            	dc.b	0
 301  00e1 00            	dc.b	0
 302  00e2 14            	dc.b	20
 303  00e3 25            	dc.b	37
 304  00e4 15            	dc.b	21
 305  00e5 35            	dc.b	53
 306  00e6 00            	dc.b	0
 307  00e7 00            	dc.b	0
 308  00e8 00            	dc.b	0
 309  00e9 04            	dc.b	4
 310  00ea 14            	dc.b	20
 311  00eb 25            	dc.b	37
 312  00ec 35            	dc.b	53
 313  00ed 34            	dc.b	52
 314  00ee 00            	dc.b	0
 315  00ef 00            	dc.b	0
 316  00f0 14            	dc.b	20
 317  00f1 25            	dc.b	37
 318  00f2 24            	dc.b	36
 319  00f3 34            	dc.b	52
 320  00f4 35            	dc.b	53
 321  00f5 04            	dc.b	4
 322  00f6 00            	dc.b	0
 323  00f7 04            	dc.b	4
 324  00f8 15            	dc.b	21
 325  00f9 35            	dc.b	53
 326  00fa 00            	dc.b	0
 327  00fb 00            	dc.b	0
 328  00fc 00            	dc.b	0
 329  00fd 00            	dc.b	0
 330  00fe 04            	dc.b	4
 331  00ff 15            	dc.b	21
 332  0100 35            	dc.b	53
 333  0101 34            	dc.b	52
 334  0102 24            	dc.b	36
 335  0103 14            	dc.b	20
 336  0104 25            	dc.b	37
 337  0105 04            	dc.b	4
 338  0106 14            	dc.b	20
 339  0107 25            	dc.b	37
 340  0108 15            	dc.b	21
 341  0109 35            	dc.b	53
 342  010a 34            	dc.b	52
 343  010b 00            	dc.b	0
 344  010c               __nc:
 345  010c 07            	dc.b	7
 346  010d 18            	dc.b	24
 347  010e 38            	dc.b	56
 348  010f 37            	dc.b	55
 349  0110 27            	dc.b	39
 350  0111 17            	dc.b	23
 351  0112 00            	dc.b	0
 352  0113 18            	dc.b	24
 353  0114 38            	dc.b	56
 354  0115 00            	dc.b	0
 355  0116 00            	dc.b	0
 356  0117 00            	dc.b	0
 357  0118 00            	dc.b	0
 358  0119 00            	dc.b	0
 359  011a 07            	dc.b	7
 360  011b 18            	dc.b	24
 361  011c 28            	dc.b	40
 362  011d 27            	dc.b	39
 363  011e 37            	dc.b	55
 364  011f 00            	dc.b	0
 365  0120 00            	dc.b	0
 366  0121 07            	dc.b	7
 367  0122 18            	dc.b	24
 368  0123 28            	dc.b	40
 369  0124 38            	dc.b	56
 370  0125 37            	dc.b	55
 371  0126 00            	dc.b	0
 372  0127 00            	dc.b	0
 373  0128 17            	dc.b	23
 374  0129 28            	dc.b	40
 375  012a 18            	dc.b	24
 376  012b 38            	dc.b	56
 377  012c 00            	dc.b	0
 378  012d 00            	dc.b	0
 379  012e 00            	dc.b	0
 380  012f 07            	dc.b	7
 381  0130 17            	dc.b	23
 382  0131 28            	dc.b	40
 383  0132 38            	dc.b	56
 384  0133 37            	dc.b	55
 385  0134 00            	dc.b	0
 386  0135 00            	dc.b	0
 387  0136 17            	dc.b	23
 388  0137 28            	dc.b	40
 389  0138 27            	dc.b	39
 390  0139 37            	dc.b	55
 391  013a 38            	dc.b	56
 392  013b 07            	dc.b	7
 393  013c 00            	dc.b	0
 394  013d 07            	dc.b	7
 395  013e 18            	dc.b	24
 396  013f 38            	dc.b	56
 397  0140 00            	dc.b	0
 398  0141 00            	dc.b	0
 399  0142 00            	dc.b	0
 400  0143 00            	dc.b	0
 401  0144 07            	dc.b	7
 402  0145 18            	dc.b	24
 403  0146 38            	dc.b	56
 404  0147 37            	dc.b	55
 405  0148 27            	dc.b	39
 406  0149 17            	dc.b	23
 407  014a 28            	dc.b	40
 408  014b 07            	dc.b	7
 409  014c 17            	dc.b	23
 410  014d 28            	dc.b	40
 411  014e 18            	dc.b	24
 412  014f 38            	dc.b	56
 413  0150 37            	dc.b	55
 414  0151 00            	dc.b	0
 415  0152               __nd:
 416  0152 09            	dc.b	9
 417  0153 1a            	dc.b	26
 418  0154 3a            	dc.b	58
 419  0155 39            	dc.b	57
 420  0156 29            	dc.b	41
 421  0157 19            	dc.b	25
 422  0158 00            	dc.b	0
 423  0159 1a            	dc.b	26
 424  015a 3a            	dc.b	58
 425  015b 00            	dc.b	0
 426  015c 00            	dc.b	0
 427  015d 00            	dc.b	0
 428  015e 00            	dc.b	0
 429  015f 00            	dc.b	0
 430  0160 09            	dc.b	9
 431  0161 1a            	dc.b	26
 432  0162 2a            	dc.b	42
 433  0163 29            	dc.b	41
 434  0164 39            	dc.b	57
 435  0165 00            	dc.b	0
 436  0166 00            	dc.b	0
 437  0167 09            	dc.b	9
 438  0168 1a            	dc.b	26
 439  0169 2a            	dc.b	42
 440  016a 3a            	dc.b	58
 441  016b 39            	dc.b	57
 442  016c 00            	dc.b	0
 443  016d 00            	dc.b	0
 444  016e 19            	dc.b	25
 445  016f 2a            	dc.b	42
 446  0170 1a            	dc.b	26
 447  0171 3a            	dc.b	58
 448  0172 00            	dc.b	0
 449  0173 00            	dc.b	0
 450  0174 00            	dc.b	0
 451  0175 09            	dc.b	9
 452  0176 19            	dc.b	25
 453  0177 2a            	dc.b	42
 454  0178 3a            	dc.b	58
 455  0179 39            	dc.b	57
 456  017a 00            	dc.b	0
 457  017b 00            	dc.b	0
 458  017c 19            	dc.b	25
 459  017d 2a            	dc.b	42
 460  017e 29            	dc.b	41
 461  017f 39            	dc.b	57
 462  0180 3a            	dc.b	58
 463  0181 09            	dc.b	9
 464  0182 00            	dc.b	0
 465  0183 09            	dc.b	9
 466  0184 1a            	dc.b	26
 467  0185 3a            	dc.b	58
 468  0186 00            	dc.b	0
 469  0187 00            	dc.b	0
 470  0188 00            	dc.b	0
 471  0189 00            	dc.b	0
 472  018a 09            	dc.b	9
 473  018b 1a            	dc.b	26
 474  018c 3a            	dc.b	58
 475  018d 39            	dc.b	57
 476  018e 29            	dc.b	41
 477  018f 19            	dc.b	25
 478  0190 2a            	dc.b	42
 479  0191 09            	dc.b	9
 480  0192 19            	dc.b	25
 481  0193 2a            	dc.b	42
 482  0194 1a            	dc.b	26
 483  0195 3a            	dc.b	58
 484  0196 39            	dc.b	57
 485  0197 00            	dc.b	0
 486  0198               __nerr:
 487  0198 02            	dc.b	2
 488  0199 12            	dc.b	18
 489  019a 22            	dc.b	34
 490  019b 32            	dc.b	50
 491  019c 23            	dc.b	35
 492  019d 24            	dc.b	36
 493  019e 25            	dc.b	37
 494  019f               __nerrBr:
 495  019f 33            	dc.b	51
 496  01a0 12            	dc.b	18
 497  01a1 22            	dc.b	34
 498  01a2 32            	dc.b	50
 499  01a3 23            	dc.b	35
 500  01a4 24            	dc.b	36
 501  01a5 25            	dc.b	37
 502  01a6               __nm:
 503  01a6 22            	dc.b	34
 504  01a7 23            	dc.b	35
 505  01a8 33            	dc.b	51
 506  01a9               __ncnt:
 507  01a9 23            	dc.b	35
 508  01aa 22            	dc.b	34
 509  01ab 32            	dc.b	50
 510  01ac 24            	dc.b	36
 511  01ad 25            	dc.b	37
 512  01ae 35            	dc.b	53
 513  01af               __nvalve:
 514  01af 33            	dc.b	51
 515  01b0 22            	dc.b	34
 516  01b1 32            	dc.b	50
 517  01b2 24            	dc.b	36
 518  01b3 25            	dc.b	37
 519  01b4 35            	dc.b	53
 520  01b5               __n:
 521  01b5 02            	dc.b	2
 522  01b6 13            	dc.b	19
 523  01b7 33            	dc.b	51
 524  01b8 32            	dc.b	50
 525  01b9 22            	dc.b	34
 526  01ba 12            	dc.b	18
 527  01bb 23            	dc.b	35
 528  01bc 04            	dc.b	4
 529  01bd 15            	dc.b	21
 530  01be 35            	dc.b	53
 531  01bf 34            	dc.b	52
 532  01c0 24            	dc.b	36
 533  01c1 14            	dc.b	20
 534  01c2 25            	dc.b	37
 535  01c3 07            	dc.b	7
 536  01c4 18            	dc.b	24
 537  01c5 38            	dc.b	56
 538  01c6 37            	dc.b	55
 539  01c7 27            	dc.b	39
 540  01c8 17            	dc.b	23
 541  01c9 28            	dc.b	40
 542  01ca 09            	dc.b	9
 543  01cb 1a            	dc.b	26
 544  01cc 3a            	dc.b	58
 545  01cd 39            	dc.b	57
 546  01ce 29            	dc.b	41
 547  01cf 19            	dc.b	25
 548  01d0 2a            	dc.b	42
 549  01d1 06            	dc.b	6
 550  01d2 1b            	dc.b	27
 551  01d3 36            	dc.b	54
 552  01d4 3b            	dc.b	59
 553  01d5 26            	dc.b	38
 554  01d6 2b            	dc.b	43
 555  01d7 16            	dc.b	22
 556  01d8               __nid:
 557  01d8 33            	dc.b	51
 558  01d9 15            	dc.b	21
 559  01da 35            	dc.b	53
 560  01db 25            	dc.b	37
 561  01dc 24            	dc.b	36
 562  01dd 34            	dc.b	52
 563  01de               __info:
 564  01de 05            	dc.b	5
 565  01df 0a            	dc.b	10
 566  01e0 0b            	dc.b	11
 567  01e1               __rid:
 568  01e1 0e            	dc.b	14
 569  01e2 0f            	dc.b	15
 570  01e3 1e            	dc.b	30
 571  01e4 1f            	dc.b	31
 572  01e5 2e            	dc.b	46
 573  01e6 2f            	dc.b	47
 574  01e7 3e            	dc.b	62
 575  01e8 3f            	dc.b	63
 576  01e9 3d            	dc.b	61
 577  01ea 3c            	dc.b	60
 578  01eb 2d            	dc.b	45
 579  01ec 2c            	dc.b	44
 580  01ed 1d            	dc.b	29
 581  01ee 1c            	dc.b	28
 582  01ef 0d            	dc.b	13
 583  01f0 0c            	dc.b	12
 584  01f1               __bL:
 585  01f1 12            	dc.b	18
 586  01f2 22            	dc.b	34
 587  01f3 23            	dc.b	35
 588  01f4 32            	dc.b	50
 589  01f5 33            	dc.b	51
 590  01f6 14            	dc.b	20
 591  01f7 24            	dc.b	36
 592  01f8 34            	dc.b	52
 593  01f9               __btn:
 594  01f9 11            	dc.b	17
 595  01fa 21            	dc.b	33
 596  01fb 31            	dc.b	49
 597  01fc 10            	dc.b	16
 598  01fd 20            	dc.b	32
 599  01fe               __cc:
 600  01fe 23            	dc.b	35
 601  01ff 22            	dc.b	34
 602  0200 32            	dc.b	50
 603  0201 1b            	dc.b	27
 604  0202               __cntl_on:
 605  0202 28            	dc.b	40
 606  0203 27            	dc.b	39
 607  0204 38            	dc.b	56
 608  0205 37            	dc.b	55
 609  0206 09            	dc.b	9
 610  0207 29            	dc.b	41
 611  0208 2a            	dc.b	42
 612  0209 19            	dc.b	25
 613  020a               __cntl_po:
 614  020a 07            	dc.b	7
 615  020b 18            	dc.b	24
 616  020c 17            	dc.b	23
 617  020d 28            	dc.b	40
 618  020e 27            	dc.b	39
 619  020f 2a            	dc.b	42
 620  0210 29            	dc.b	41
 621  0211 3a            	dc.b	58
 622  0212 39            	dc.b	57
 623  0213               __hcLocal:
 624  0213 17            	dc.b	23
 625  0214 27            	dc.b	39
 626  0215 37            	dc.b	55
 627  0216 2a            	dc.b	42
 628  0217 29            	dc.b	41
 629  0218 39            	dc.b	57
 630  0219 3a            	dc.b	58
 631  021a               __hcEach:
 632  021a 07            	dc.b	7
 633  021b 17            	dc.b	23
 634  021c 28            	dc.b	40
 635  021d 27            	dc.b	39
 636  021e 37            	dc.b	55
 637  021f 09            	dc.b	9
 638  0220 19            	dc.b	25
 639  0221 29            	dc.b	41
 640  0222 1a            	dc.b	26
 641  0223 2a            	dc.b	42
 642  0224 3a            	dc.b	58
 643  0225               __run:
 644  0225 22            	dc.b	34
 645  0226 23            	dc.b	35
 646  0227 24            	dc.b	36
 647  0228 34            	dc.b	52
 648  0229 35            	dc.b	53
 649  022a 27            	dc.b	39
 650  022b 28            	dc.b	40
 651  022c 38            	dc.b	56
 652  022d               __hc:
 653  022d 12            	dc.b	18
 654  022e 22            	dc.b	34
 655  022f 23            	dc.b	35
 656  0230 32            	dc.b	50
 657  0231 25            	dc.b	37
 658  0232 14            	dc.b	20
 659  0233 15            	dc.b	21
 660  0234 35            	dc.b	53
 661  0235               __link:
 662  0235 12            	dc.b	18
 663  0236 22            	dc.b	34
 664  0237 32            	dc.b	50
 665  0238 24            	dc.b	36
 666  0239 25            	dc.b	37
 667  023a 35            	dc.b	53
 668  023b               __cntl_op:
 669  023b 23            	dc.b	35
 670  023c 22            	dc.b	34
 671  023d 33            	dc.b	51
 672  023e 32            	dc.b	50
 673  023f 04            	dc.b	4
 674  0240 15            	dc.b	21
 675  0241 14            	dc.b	20
 676  0242 25            	dc.b	37
 677  0243 24            	dc.b	36
 678  0244               __cntl_2motor:
 679  0244 07            	dc.b	7
 680  0245 18            	dc.b	24
 681  0246 37            	dc.b	55
 682  0247 28            	dc.b	40
 683  0248 27            	dc.b	39
 684  0249 2a            	dc.b	42
 685  024a 29            	dc.b	41
 686  024b 09            	dc.b	9
 687  024c 19            	dc.b	25
 688  024d 1a            	dc.b	26
 689  024e               __cntl_tab:
 690  024e 07            	dc.b	7
 691  024f 17            	dc.b	23
 692  0250 27            	dc.b	39
 693  0251 2a            	dc.b	42
 694  0252 29            	dc.b	41
 695  0253 19            	dc.b	25
 696  0254 39            	dc.b	57
 697  0255 3a            	dc.b	58
 698  0256               __mir1:
 699  0256 18            	dc.b	24
 700  0257 38            	dc.b	56
 701  0258 27            	dc.b	39
 702  0259 28            	dc.b	40
 703  025a 37            	dc.b	55
 704  025b 1a            	dc.b	26
 705  025c 3a            	dc.b	58
 706  025d               __mir2:
 707  025d 18            	dc.b	24
 708  025e 38            	dc.b	56
 709  025f 27            	dc.b	39
 710  0260 28            	dc.b	40
 711  0261 37            	dc.b	55
 712  0262 09            	dc.b	9
 713  0263 1a            	dc.b	26
 714  0264 2a            	dc.b	42
 715  0265 29            	dc.b	41
 716  0266 39            	dc.b	57
 717  0267               __freset:
 718  0267 07            	dc.b	7
 719  0268 17            	dc.b	23
 720  0269 27            	dc.b	39
 721  026a 28            	dc.b	40
 722  026b 2a            	dc.b	42
 723  026c 29            	dc.b	41
 724  026d               __len:
 725  026d 12            	dc.b	18
 726  026e 22            	dc.b	34
 727  026f 32            	dc.b	50
 728  0270               __po_type:
 729  0270 25            	dc.b	37
 730  0271 24            	dc.b	36
 731  0272 35            	dc.b	53
 732  0273 34            	dc.b	52
 733  0274 02            	dc.b	2
 734  0275 13            	dc.b	19
 735  0276 12            	dc.b	18
 736  0277 23            	dc.b	35
 737  0278 22            	dc.b	34
 738  0279               __po_type_xl:
 739  0279 19            	dc.b	25
 740  027a 29            	dc.b	41
 741  027b 39            	dc.b	57
 742  027c 17            	dc.b	23
 743  027d 18            	dc.b	24
 744  027e 38            	dc.b	56
 745  027f 28            	dc.b	40
 746  0280 27            	dc.b	39
 747  0281               __po_type_pb:
 748  0281 2a            	dc.b	42
 749  0282 29            	dc.b	41
 750  0283 3a            	dc.b	58
 751  0284 39            	dc.b	57
 752  0285 19            	dc.b	25
 753  0286 07            	dc.b	7
 754  0287 18            	dc.b	24
 755  0288 17            	dc.b	23
 756  0289 28            	dc.b	40
 757  028a 27            	dc.b	39
 758  028b               __temp_offset:
 759  028b 23            	dc.b	35
 760  028c 22            	dc.b	34
 761  028d 32            	dc.b	50
 762  028e 12            	dc.b	18
 763  028f               __lpm:
 764  028f 12            	dc.b	18
 765  0290 22            	dc.b	34
 766  0291 32            	dc.b	50
 767  0292 24            	dc.b	36
 768  0293 25            	dc.b	37
 769  0294 04            	dc.b	4
 770  0295 14            	dc.b	20
 771  0296 15            	dc.b	21
 772  0297               __cnt_host:
 773  0297 18            	dc.b	24
 774  0298 38            	dc.b	56
 775  0299 27            	dc.b	39
 776  029a 28            	dc.b	40
 777  029b 17            	dc.b	23
 778  029c 2a            	dc.b	42
 779  029d 3a            	dc.b	58
 780  029e 29            	dc.b	41
 781  029f 39            	dc.b	57
 782  02a0               __cnt_sub:
 783  02a0 07            	dc.b	7
 784  02a1 38            	dc.b	56
 785  02a2 17            	dc.b	23
 786  02a3 28            	dc.b	40
 787  02a4 37            	dc.b	55
 788  02a5 29            	dc.b	41
 789  02a6 39            	dc.b	57
 790  02a7 3a            	dc.b	58
 791  02a8               __plc:
 792  02a8 02            	dc.b	2
 793  02a9 13            	dc.b	19
 794  02aa 12            	dc.b	18
 795  02ab 22            	dc.b	34
 796  02ac 23            	dc.b	35
 797  02ad 24            	dc.b	36
 798  02ae 34            	dc.b	52
 799  02af 14            	dc.b	20
 800  02b0 07            	dc.b	7
 801  02b1 17            	dc.b	23
 802  02b2 27            	dc.b	39
 803  02b3 37            	dc.b	55
 843                     ; 318 LCD_DISP_FUNC_1(lcd_disp_plc, 12, _plc)
 844                     	switch	.text
 845  0001               _lcd_disp_plc:
 847  0001 89            	pushw	x
 848       00000002      OFST:	set	2
 851  0002 4f            	clr	a
 852  0003 6b02          	ld	(OFST+0,sp),a
 853  0005               L34:
 856  0005 5f            	clrw	x
 857  0006 97            	ld	xl,a
 858  0007 d602a8        	ld	a,(__plc,x)
 859  000a 6b01          	ld	(OFST-1,sp),a
 862  000c 5f            	clrw	x
 863  000d 97            	ld	xl,a
 864  000e d60040        	ld	a,(_iLF_DEF,x)
 865  0011 5f            	clrw	x
 866  0012 97            	ld	xl,a
 867  0013 7b01          	ld	a,(OFST-1,sp)
 868  0015 905f          	clrw	y
 869  0017 9097          	ld	yl,a
 870  0019 d6540c        	ld	a,(21516,x)
 871  001c 90da0000      	or	a,(_bLF_DEF,y)
 872  0020 d7540c        	ld	(21516,x),a
 875  0023 0c02          	inc	(OFST+0,sp)
 878  0025 7b02          	ld	a,(OFST+0,sp)
 879  0027 a10c          	cp	a,#12
 880  0029 25da          	jrult	L34
 884  002b 85            	popw	x
 885  002c 81            	ret	
 927                     ; 320 LCD_DISP_FUNC_1(lcd_disp_cnt_host, 9, _cnt_host)
 928                     	switch	.text
 929  002d               _lcd_disp_cnt_host:
 931  002d 89            	pushw	x
 932       00000002      OFST:	set	2
 935  002e 4f            	clr	a
 936  002f 6b02          	ld	(OFST+0,sp),a
 937  0031               L76:
 940  0031 5f            	clrw	x
 941  0032 97            	ld	xl,a
 942  0033 d60297        	ld	a,(__cnt_host,x)
 943  0036 6b01          	ld	(OFST-1,sp),a
 946  0038 5f            	clrw	x
 947  0039 97            	ld	xl,a
 948  003a d60040        	ld	a,(_iLF_DEF,x)
 949  003d 5f            	clrw	x
 950  003e 97            	ld	xl,a
 951  003f 7b01          	ld	a,(OFST-1,sp)
 952  0041 905f          	clrw	y
 953  0043 9097          	ld	yl,a
 954  0045 d6540c        	ld	a,(21516,x)
 955  0048 90da0000      	or	a,(_bLF_DEF,y)
 956  004c d7540c        	ld	(21516,x),a
 959  004f 0c02          	inc	(OFST+0,sp)
 962  0051 7b02          	ld	a,(OFST+0,sp)
 963  0053 a109          	cp	a,#9
 964  0055 25da          	jrult	L76
 968  0057 85            	popw	x
 969  0058 81            	ret	
1011                     ; 321 LCD_DISP_FUNC_1(lcd_disp_cnt_sub, 8, _cnt_sub)
1012                     	switch	.text
1013  0059               _lcd_disp_cnt_sub:
1015  0059 89            	pushw	x
1016       00000002      OFST:	set	2
1019  005a 4f            	clr	a
1020  005b 6b02          	ld	(OFST+0,sp),a
1021  005d               L311:
1024  005d 5f            	clrw	x
1025  005e 97            	ld	xl,a
1026  005f d602a0        	ld	a,(__cnt_sub,x)
1027  0062 6b01          	ld	(OFST-1,sp),a
1030  0064 5f            	clrw	x
1031  0065 97            	ld	xl,a
1032  0066 d60040        	ld	a,(_iLF_DEF,x)
1033  0069 5f            	clrw	x
1034  006a 97            	ld	xl,a
1035  006b 7b01          	ld	a,(OFST-1,sp)
1036  006d 905f          	clrw	y
1037  006f 9097          	ld	yl,a
1038  0071 d6540c        	ld	a,(21516,x)
1039  0074 90da0000      	or	a,(_bLF_DEF,y)
1040  0078 d7540c        	ld	(21516,x),a
1043  007b 0c02          	inc	(OFST+0,sp)
1046  007d 7b02          	ld	a,(OFST+0,sp)
1047  007f a108          	cp	a,#8
1048  0081 25da          	jrult	L311
1052  0083 85            	popw	x
1053  0084 81            	ret	
1095                     ; 323 LCD_DISP_FUNC_1(lcd_disp_mir1, 7, _mir1)
1096                     	switch	.text
1097  0085               _lcd_disp_mir1:
1099  0085 89            	pushw	x
1100       00000002      OFST:	set	2
1103  0086 4f            	clr	a
1104  0087 6b02          	ld	(OFST+0,sp),a
1105  0089               L731:
1108  0089 5f            	clrw	x
1109  008a 97            	ld	xl,a
1110  008b d60256        	ld	a,(__mir1,x)
1111  008e 6b01          	ld	(OFST-1,sp),a
1114  0090 5f            	clrw	x
1115  0091 97            	ld	xl,a
1116  0092 d60040        	ld	a,(_iLF_DEF,x)
1117  0095 5f            	clrw	x
1118  0096 97            	ld	xl,a
1119  0097 7b01          	ld	a,(OFST-1,sp)
1120  0099 905f          	clrw	y
1121  009b 9097          	ld	yl,a
1122  009d d6540c        	ld	a,(21516,x)
1123  00a0 90da0000      	or	a,(_bLF_DEF,y)
1124  00a4 d7540c        	ld	(21516,x),a
1127  00a7 0c02          	inc	(OFST+0,sp)
1130  00a9 7b02          	ld	a,(OFST+0,sp)
1131  00ab a107          	cp	a,#7
1132  00ad 25da          	jrult	L731
1136  00af 85            	popw	x
1137  00b0 81            	ret	
1179                     ; 324 LCD_DISP_FUNC_1(lcd_disp_mir2, 10, _mir2)
1180                     	switch	.text
1181  00b1               _lcd_disp_mir2:
1183  00b1 89            	pushw	x
1184       00000002      OFST:	set	2
1187  00b2 4f            	clr	a
1188  00b3 6b02          	ld	(OFST+0,sp),a
1189  00b5               L361:
1192  00b5 5f            	clrw	x
1193  00b6 97            	ld	xl,a
1194  00b7 d6025d        	ld	a,(__mir2,x)
1195  00ba 6b01          	ld	(OFST-1,sp),a
1198  00bc 5f            	clrw	x
1199  00bd 97            	ld	xl,a
1200  00be d60040        	ld	a,(_iLF_DEF,x)
1201  00c1 5f            	clrw	x
1202  00c2 97            	ld	xl,a
1203  00c3 7b01          	ld	a,(OFST-1,sp)
1204  00c5 905f          	clrw	y
1205  00c7 9097          	ld	yl,a
1206  00c9 d6540c        	ld	a,(21516,x)
1207  00cc 90da0000      	or	a,(_bLF_DEF,y)
1208  00d0 d7540c        	ld	(21516,x),a
1211  00d3 0c02          	inc	(OFST+0,sp)
1214  00d5 7b02          	ld	a,(OFST+0,sp)
1215  00d7 a10a          	cp	a,#10
1216  00d9 25da          	jrult	L361
1220  00db 85            	popw	x
1221  00dc 81            	ret	
1263                     ; 325 LCD_DISP_FUNC_1(lcd_disp_freset, 6, _freset)
1264                     	switch	.text
1265  00dd               _lcd_disp_freset:
1267  00dd 89            	pushw	x
1268       00000002      OFST:	set	2
1271  00de 4f            	clr	a
1272  00df 6b02          	ld	(OFST+0,sp),a
1273  00e1               L702:
1276  00e1 5f            	clrw	x
1277  00e2 97            	ld	xl,a
1278  00e3 d60267        	ld	a,(__freset,x)
1279  00e6 6b01          	ld	(OFST-1,sp),a
1282  00e8 5f            	clrw	x
1283  00e9 97            	ld	xl,a
1284  00ea d60040        	ld	a,(_iLF_DEF,x)
1285  00ed 5f            	clrw	x
1286  00ee 97            	ld	xl,a
1287  00ef 7b01          	ld	a,(OFST-1,sp)
1288  00f1 905f          	clrw	y
1289  00f3 9097          	ld	yl,a
1290  00f5 d6540c        	ld	a,(21516,x)
1291  00f8 90da0000      	or	a,(_bLF_DEF,y)
1292  00fc d7540c        	ld	(21516,x),a
1295  00ff 0c02          	inc	(OFST+0,sp)
1298  0101 7b02          	ld	a,(OFST+0,sp)
1299  0103 a106          	cp	a,#6
1300  0105 25da          	jrult	L702
1304  0107 85            	popw	x
1305  0108 81            	ret	
1348                     ; 327 LCD_DISP_FUNC(lcd_disp_backlight, 8, _bL)
1349                     	switch	.text
1350  0109               _lcd_disp_backlight:
1352  0109 89            	pushw	x
1353       00000002      OFST:	set	2
1358  010a cd05d9        	call	_lcd_clear_n
1361  010d 4f            	clr	a
1362  010e 6b02          	ld	(OFST+0,sp),a
1363  0110               L332:
1366  0110 5f            	clrw	x
1367  0111 97            	ld	xl,a
1368  0112 d601f1        	ld	a,(__bL,x)
1369  0115 6b01          	ld	(OFST-1,sp),a
1372  0117 5f            	clrw	x
1373  0118 97            	ld	xl,a
1374  0119 d60040        	ld	a,(_iLF_DEF,x)
1375  011c 5f            	clrw	x
1376  011d 97            	ld	xl,a
1377  011e 7b01          	ld	a,(OFST-1,sp)
1378  0120 905f          	clrw	y
1379  0122 9097          	ld	yl,a
1380  0124 d6540c        	ld	a,(21516,x)
1381  0127 90da0000      	or	a,(_bLF_DEF,y)
1382  012b d7540c        	ld	(21516,x),a
1385  012e 0c02          	inc	(OFST+0,sp)
1388  0130 7b02          	ld	a,(OFST+0,sp)
1389  0132 a108          	cp	a,#8
1390  0134 25da          	jrult	L332
1394  0136 85            	popw	x
1395  0137 81            	ret	
1438                     ; 329 LCD_DISP_FUNC(lcd_disp_setup_lpm, 8, _lpm)
1439                     	switch	.text
1440  0138               _lcd_disp_setup_lpm:
1442  0138 89            	pushw	x
1443       00000002      OFST:	set	2
1448  0139 cd05d9        	call	_lcd_clear_n
1451  013c 4f            	clr	a
1452  013d 6b02          	ld	(OFST+0,sp),a
1453  013f               L752:
1456  013f 5f            	clrw	x
1457  0140 97            	ld	xl,a
1458  0141 d6028f        	ld	a,(__lpm,x)
1459  0144 6b01          	ld	(OFST-1,sp),a
1462  0146 5f            	clrw	x
1463  0147 97            	ld	xl,a
1464  0148 d60040        	ld	a,(_iLF_DEF,x)
1465  014b 5f            	clrw	x
1466  014c 97            	ld	xl,a
1467  014d 7b01          	ld	a,(OFST-1,sp)
1468  014f 905f          	clrw	y
1469  0151 9097          	ld	yl,a
1470  0153 d6540c        	ld	a,(21516,x)
1471  0156 90da0000      	or	a,(_bLF_DEF,y)
1472  015a d7540c        	ld	(21516,x),a
1475  015d 0c02          	inc	(OFST+0,sp)
1478  015f 7b02          	ld	a,(OFST+0,sp)
1479  0161 a108          	cp	a,#8
1480  0163 25da          	jrult	L752
1484  0165 85            	popw	x
1485  0166 81            	ret	
1529                     ; 330 LCD_DISP_FUNC(lcd_disp_setup_temp_offset, 4, _temp_offset)
1530                     	switch	.text
1531  0167               _lcd_disp_setup_temp_offset:
1533  0167 89            	pushw	x
1534       00000002      OFST:	set	2
1539  0168 cd05d9        	call	_lcd_clear_n
1542  016b 4f            	clr	a
1543  016c 6b02          	ld	(OFST+0,sp),a
1544  016e               L303:
1547  016e 5f            	clrw	x
1548  016f 97            	ld	xl,a
1549  0170 d6028b        	ld	a,(__temp_offset,x)
1550  0173 6b01          	ld	(OFST-1,sp),a
1553  0175 5f            	clrw	x
1554  0176 97            	ld	xl,a
1555  0177 d60040        	ld	a,(_iLF_DEF,x)
1556  017a 5f            	clrw	x
1557  017b 97            	ld	xl,a
1558  017c 7b01          	ld	a,(OFST-1,sp)
1559  017e 905f          	clrw	y
1560  0180 9097          	ld	yl,a
1561  0182 d6540c        	ld	a,(21516,x)
1562  0185 90da0000      	or	a,(_bLF_DEF,y)
1563  0189 d7540c        	ld	(21516,x),a
1566  018c 0c02          	inc	(OFST+0,sp)
1569  018e 7b02          	ld	a,(OFST+0,sp)
1570  0190 a104          	cp	a,#4
1571  0192 25da          	jrult	L303
1575  0194 85            	popw	x
1576  0195 81            	ret	
1620                     ; 332 LCD_DISP_FUNC(lcd_disp_setup_po_type, 9, _po_type)
1621                     	switch	.text
1622  0196               _lcd_disp_setup_po_type:
1624  0196 89            	pushw	x
1625       00000002      OFST:	set	2
1630  0197 cd05d9        	call	_lcd_clear_n
1633  019a 4f            	clr	a
1634  019b 6b02          	ld	(OFST+0,sp),a
1635  019d               L723:
1638  019d 5f            	clrw	x
1639  019e 97            	ld	xl,a
1640  019f d60270        	ld	a,(__po_type,x)
1641  01a2 6b01          	ld	(OFST-1,sp),a
1644  01a4 5f            	clrw	x
1645  01a5 97            	ld	xl,a
1646  01a6 d60040        	ld	a,(_iLF_DEF,x)
1647  01a9 5f            	clrw	x
1648  01aa 97            	ld	xl,a
1649  01ab 7b01          	ld	a,(OFST-1,sp)
1650  01ad 905f          	clrw	y
1651  01af 9097          	ld	yl,a
1652  01b1 d6540c        	ld	a,(21516,x)
1653  01b4 90da0000      	or	a,(_bLF_DEF,y)
1654  01b8 d7540c        	ld	(21516,x),a
1657  01bb 0c02          	inc	(OFST+0,sp)
1660  01bd 7b02          	ld	a,(OFST+0,sp)
1661  01bf a109          	cp	a,#9
1662  01c1 25da          	jrult	L723
1666  01c3 85            	popw	x
1667  01c4 81            	ret	
1710                     ; 333 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_xl, 8, _po_type_xl)
1711                     	switch	.text
1712  01c5               _lcd_disp_setup_po_type_xl:
1714  01c5 89            	pushw	x
1715       00000002      OFST:	set	2
1718  01c6 4f            	clr	a
1719  01c7 6b02          	ld	(OFST+0,sp),a
1720  01c9               L353:
1723  01c9 5f            	clrw	x
1724  01ca 97            	ld	xl,a
1725  01cb d60279        	ld	a,(__po_type_xl,x)
1726  01ce 6b01          	ld	(OFST-1,sp),a
1729  01d0 5f            	clrw	x
1730  01d1 97            	ld	xl,a
1731  01d2 d60040        	ld	a,(_iLF_DEF,x)
1732  01d5 5f            	clrw	x
1733  01d6 97            	ld	xl,a
1734  01d7 7b01          	ld	a,(OFST-1,sp)
1735  01d9 905f          	clrw	y
1736  01db 9097          	ld	yl,a
1737  01dd d6540c        	ld	a,(21516,x)
1738  01e0 90da0000      	or	a,(_bLF_DEF,y)
1739  01e4 d7540c        	ld	(21516,x),a
1742  01e7 0c02          	inc	(OFST+0,sp)
1745  01e9 7b02          	ld	a,(OFST+0,sp)
1746  01eb a108          	cp	a,#8
1747  01ed 25da          	jrult	L353
1751  01ef 85            	popw	x
1752  01f0 81            	ret	
1795                     ; 334 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_pb, 10, _po_type_pb)
1796                     	switch	.text
1797  01f1               _lcd_disp_setup_po_type_pb:
1799  01f1 89            	pushw	x
1800       00000002      OFST:	set	2
1803  01f2 4f            	clr	a
1804  01f3 6b02          	ld	(OFST+0,sp),a
1805  01f5               L773:
1808  01f5 5f            	clrw	x
1809  01f6 97            	ld	xl,a
1810  01f7 d60281        	ld	a,(__po_type_pb,x)
1811  01fa 6b01          	ld	(OFST-1,sp),a
1814  01fc 5f            	clrw	x
1815  01fd 97            	ld	xl,a
1816  01fe d60040        	ld	a,(_iLF_DEF,x)
1817  0201 5f            	clrw	x
1818  0202 97            	ld	xl,a
1819  0203 7b01          	ld	a,(OFST-1,sp)
1820  0205 905f          	clrw	y
1821  0207 9097          	ld	yl,a
1822  0209 d6540c        	ld	a,(21516,x)
1823  020c 90da0000      	or	a,(_bLF_DEF,y)
1824  0210 d7540c        	ld	(21516,x),a
1827  0213 0c02          	inc	(OFST+0,sp)
1830  0215 7b02          	ld	a,(OFST+0,sp)
1831  0217 a10a          	cp	a,#10
1832  0219 25da          	jrult	L773
1836  021b 85            	popw	x
1837  021c 81            	ret	
1880                     ; 338 LCD_DISP_FUNC(lcd_disp_setup_len, 3, _len)
1881                     	switch	.text
1882  021d               _lcd_disp_setup_len:
1884  021d 89            	pushw	x
1885       00000002      OFST:	set	2
1890  021e cd05d9        	call	_lcd_clear_n
1893  0221 4f            	clr	a
1894  0222 6b02          	ld	(OFST+0,sp),a
1895  0224               L324:
1898  0224 5f            	clrw	x
1899  0225 97            	ld	xl,a
1900  0226 d6026d        	ld	a,(__len,x)
1901  0229 6b01          	ld	(OFST-1,sp),a
1904  022b 5f            	clrw	x
1905  022c 97            	ld	xl,a
1906  022d d60040        	ld	a,(_iLF_DEF,x)
1907  0230 5f            	clrw	x
1908  0231 97            	ld	xl,a
1909  0232 7b01          	ld	a,(OFST-1,sp)
1910  0234 905f          	clrw	y
1911  0236 9097          	ld	yl,a
1912  0238 d6540c        	ld	a,(21516,x)
1913  023b 90da0000      	or	a,(_bLF_DEF,y)
1914  023f d7540c        	ld	(21516,x),a
1917  0242 0c02          	inc	(OFST+0,sp)
1920  0244 7b02          	ld	a,(OFST+0,sp)
1921  0246 a103          	cp	a,#3
1922  0248 25da          	jrult	L324
1926  024a 85            	popw	x
1927  024b 81            	ret	
1971                     ; 339 LCD_DISP_FUNC(lcd_disp_setup_cntl_op, 9, _cntl_op)
1972                     	switch	.text
1973  024c               _lcd_disp_setup_cntl_op:
1975  024c 89            	pushw	x
1976       00000002      OFST:	set	2
1981  024d cd05d9        	call	_lcd_clear_n
1984  0250 4f            	clr	a
1985  0251 6b02          	ld	(OFST+0,sp),a
1986  0253               L744:
1989  0253 5f            	clrw	x
1990  0254 97            	ld	xl,a
1991  0255 d6023b        	ld	a,(__cntl_op,x)
1992  0258 6b01          	ld	(OFST-1,sp),a
1995  025a 5f            	clrw	x
1996  025b 97            	ld	xl,a
1997  025c d60040        	ld	a,(_iLF_DEF,x)
1998  025f 5f            	clrw	x
1999  0260 97            	ld	xl,a
2000  0261 7b01          	ld	a,(OFST-1,sp)
2001  0263 905f          	clrw	y
2002  0265 9097          	ld	yl,a
2003  0267 d6540c        	ld	a,(21516,x)
2004  026a 90da0000      	or	a,(_bLF_DEF,y)
2005  026e d7540c        	ld	(21516,x),a
2008  0271 0c02          	inc	(OFST+0,sp)
2011  0273 7b02          	ld	a,(OFST+0,sp)
2012  0275 a109          	cp	a,#9
2013  0277 25da          	jrult	L744
2017  0279 85            	popw	x
2018  027a 81            	ret	
2061                     ; 340 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_on, 8, _cntl_on)
2062                     	switch	.text
2063  027b               _lcd_disp_setup_cntl_on:
2065  027b 89            	pushw	x
2066       00000002      OFST:	set	2
2069  027c 4f            	clr	a
2070  027d 6b02          	ld	(OFST+0,sp),a
2071  027f               L374:
2074  027f 5f            	clrw	x
2075  0280 97            	ld	xl,a
2076  0281 d60202        	ld	a,(__cntl_on,x)
2077  0284 6b01          	ld	(OFST-1,sp),a
2080  0286 5f            	clrw	x
2081  0287 97            	ld	xl,a
2082  0288 d60040        	ld	a,(_iLF_DEF,x)
2083  028b 5f            	clrw	x
2084  028c 97            	ld	xl,a
2085  028d 7b01          	ld	a,(OFST-1,sp)
2086  028f 905f          	clrw	y
2087  0291 9097          	ld	yl,a
2088  0293 d6540c        	ld	a,(21516,x)
2089  0296 90da0000      	or	a,(_bLF_DEF,y)
2090  029a d7540c        	ld	(21516,x),a
2093  029d 0c02          	inc	(OFST+0,sp)
2096  029f 7b02          	ld	a,(OFST+0,sp)
2097  02a1 a108          	cp	a,#8
2098  02a3 25da          	jrult	L374
2102  02a5 85            	popw	x
2103  02a6 81            	ret	
2146                     ; 341 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_po, 9, _cntl_po)
2147                     	switch	.text
2148  02a7               _lcd_disp_setup_cntl_po:
2150  02a7 89            	pushw	x
2151       00000002      OFST:	set	2
2154  02a8 4f            	clr	a
2155  02a9 6b02          	ld	(OFST+0,sp),a
2156  02ab               L715:
2159  02ab 5f            	clrw	x
2160  02ac 97            	ld	xl,a
2161  02ad d6020a        	ld	a,(__cntl_po,x)
2162  02b0 6b01          	ld	(OFST-1,sp),a
2165  02b2 5f            	clrw	x
2166  02b3 97            	ld	xl,a
2167  02b4 d60040        	ld	a,(_iLF_DEF,x)
2168  02b7 5f            	clrw	x
2169  02b8 97            	ld	xl,a
2170  02b9 7b01          	ld	a,(OFST-1,sp)
2171  02bb 905f          	clrw	y
2172  02bd 9097          	ld	yl,a
2173  02bf d6540c        	ld	a,(21516,x)
2174  02c2 90da0000      	or	a,(_bLF_DEF,y)
2175  02c6 d7540c        	ld	(21516,x),a
2178  02c9 0c02          	inc	(OFST+0,sp)
2181  02cb 7b02          	ld	a,(OFST+0,sp)
2182  02cd a109          	cp	a,#9
2183  02cf 25da          	jrult	L715
2187  02d1 85            	popw	x
2188  02d2 81            	ret	
2231                     ; 342 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_2motor, 10, _cntl_2motor)
2232                     	switch	.text
2233  02d3               _lcd_disp_setup_cntl_2motor:
2235  02d3 89            	pushw	x
2236       00000002      OFST:	set	2
2239  02d4 4f            	clr	a
2240  02d5 6b02          	ld	(OFST+0,sp),a
2241  02d7               L345:
2244  02d7 5f            	clrw	x
2245  02d8 97            	ld	xl,a
2246  02d9 d60244        	ld	a,(__cntl_2motor,x)
2247  02dc 6b01          	ld	(OFST-1,sp),a
2250  02de 5f            	clrw	x
2251  02df 97            	ld	xl,a
2252  02e0 d60040        	ld	a,(_iLF_DEF,x)
2253  02e3 5f            	clrw	x
2254  02e4 97            	ld	xl,a
2255  02e5 7b01          	ld	a,(OFST-1,sp)
2256  02e7 905f          	clrw	y
2257  02e9 9097          	ld	yl,a
2258  02eb d6540c        	ld	a,(21516,x)
2259  02ee 90da0000      	or	a,(_bLF_DEF,y)
2260  02f2 d7540c        	ld	(21516,x),a
2263  02f5 0c02          	inc	(OFST+0,sp)
2266  02f7 7b02          	ld	a,(OFST+0,sp)
2267  02f9 a10a          	cp	a,#10
2268  02fb 25da          	jrult	L345
2272  02fd 85            	popw	x
2273  02fe 81            	ret	
2316                     ; 343 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_tab, 8, _cntl_tab)
2317                     	switch	.text
2318  02ff               _lcd_disp_setup_cntl_tab:
2320  02ff 89            	pushw	x
2321       00000002      OFST:	set	2
2324  0300 4f            	clr	a
2325  0301 6b02          	ld	(OFST+0,sp),a
2326  0303               L765:
2329  0303 5f            	clrw	x
2330  0304 97            	ld	xl,a
2331  0305 d6024e        	ld	a,(__cntl_tab,x)
2332  0308 6b01          	ld	(OFST-1,sp),a
2335  030a 5f            	clrw	x
2336  030b 97            	ld	xl,a
2337  030c d60040        	ld	a,(_iLF_DEF,x)
2338  030f 5f            	clrw	x
2339  0310 97            	ld	xl,a
2340  0311 7b01          	ld	a,(OFST-1,sp)
2341  0313 905f          	clrw	y
2342  0315 9097          	ld	yl,a
2343  0317 d6540c        	ld	a,(21516,x)
2344  031a 90da0000      	or	a,(_bLF_DEF,y)
2345  031e d7540c        	ld	(21516,x),a
2348  0321 0c02          	inc	(OFST+0,sp)
2351  0323 7b02          	ld	a,(OFST+0,sp)
2352  0325 a108          	cp	a,#8
2353  0327 25da          	jrult	L765
2357  0329 85            	popw	x
2358  032a 81            	ret	
2401                     ; 345 LCD_DISP_FUNC(lcd_disp_setup_c, 1, _cc)
2402                     	switch	.text
2403  032b               _lcd_disp_setup_c:
2405  032b 89            	pushw	x
2406       00000002      OFST:	set	2
2411  032c cd05d9        	call	_lcd_clear_n
2414  032f 0f02          	clr	(OFST+0,sp)
2415  0331               L316:
2418  0331 7b02          	ld	a,(OFST+0,sp)
2419  0333 5f            	clrw	x
2420  0334 97            	ld	xl,a
2421  0335 d601fe        	ld	a,(__cc,x)
2422  0338 6b01          	ld	(OFST-1,sp),a
2425  033a 5f            	clrw	x
2426  033b 97            	ld	xl,a
2427  033c d60040        	ld	a,(_iLF_DEF,x)
2428  033f 5f            	clrw	x
2429  0340 97            	ld	xl,a
2430  0341 7b01          	ld	a,(OFST-1,sp)
2431  0343 905f          	clrw	y
2432  0345 9097          	ld	yl,a
2433  0347 d6540c        	ld	a,(21516,x)
2434  034a 90da0000      	or	a,(_bLF_DEF,y)
2435  034e d7540c        	ld	(21516,x),a
2438  0351 0c02          	inc	(OFST+0,sp)
2441  0353 27dc          	jreq	L316
2445  0355 85            	popw	x
2446  0356 81            	ret	
2490                     ; 347 LCD_DISP_FUNC(lcd_disp_setup_link, 6, _link)
2491                     	switch	.text
2492  0357               _lcd_disp_setup_link:
2494  0357 89            	pushw	x
2495       00000002      OFST:	set	2
2500  0358 cd05d9        	call	_lcd_clear_n
2503  035b 4f            	clr	a
2504  035c 6b02          	ld	(OFST+0,sp),a
2505  035e               L736:
2508  035e 5f            	clrw	x
2509  035f 97            	ld	xl,a
2510  0360 d60235        	ld	a,(__link,x)
2511  0363 6b01          	ld	(OFST-1,sp),a
2514  0365 5f            	clrw	x
2515  0366 97            	ld	xl,a
2516  0367 d60040        	ld	a,(_iLF_DEF,x)
2517  036a 5f            	clrw	x
2518  036b 97            	ld	xl,a
2519  036c 7b01          	ld	a,(OFST-1,sp)
2520  036e 905f          	clrw	y
2521  0370 9097          	ld	yl,a
2522  0372 d6540c        	ld	a,(21516,x)
2523  0375 90da0000      	or	a,(_bLF_DEF,y)
2524  0379 d7540c        	ld	(21516,x),a
2527  037c 0c02          	inc	(OFST+0,sp)
2530  037e 7b02          	ld	a,(OFST+0,sp)
2531  0380 a106          	cp	a,#6
2532  0382 25da          	jrult	L736
2536  0384 85            	popw	x
2537  0385 81            	ret	
2580                     ; 349 LCD_DISP_FUNC(lcd_disp_setup_run, 8, _run)
2581                     	switch	.text
2582  0386               _lcd_disp_setup_run:
2584  0386 89            	pushw	x
2585       00000002      OFST:	set	2
2590  0387 cd05d9        	call	_lcd_clear_n
2593  038a 4f            	clr	a
2594  038b 6b02          	ld	(OFST+0,sp),a
2595  038d               L366:
2598  038d 5f            	clrw	x
2599  038e 97            	ld	xl,a
2600  038f d60225        	ld	a,(__run,x)
2601  0392 6b01          	ld	(OFST-1,sp),a
2604  0394 5f            	clrw	x
2605  0395 97            	ld	xl,a
2606  0396 d60040        	ld	a,(_iLF_DEF,x)
2607  0399 5f            	clrw	x
2608  039a 97            	ld	xl,a
2609  039b 7b01          	ld	a,(OFST-1,sp)
2610  039d 905f          	clrw	y
2611  039f 9097          	ld	yl,a
2612  03a1 d6540c        	ld	a,(21516,x)
2613  03a4 90da0000      	or	a,(_bLF_DEF,y)
2614  03a8 d7540c        	ld	(21516,x),a
2617  03ab 0c02          	inc	(OFST+0,sp)
2620  03ad 7b02          	ld	a,(OFST+0,sp)
2621  03af a108          	cp	a,#8
2622  03b1 25da          	jrult	L366
2626  03b3 85            	popw	x
2627  03b4 81            	ret	
2670                     ; 351 LCD_DISP_FUNC_1(lcd_disp_setup_mode_local, 7, _hcLocal)
2671                     	switch	.text
2672  03b5               _lcd_disp_setup_mode_local:
2674  03b5 89            	pushw	x
2675       00000002      OFST:	set	2
2678  03b6 4f            	clr	a
2679  03b7 6b02          	ld	(OFST+0,sp),a
2680  03b9               L707:
2683  03b9 5f            	clrw	x
2684  03ba 97            	ld	xl,a
2685  03bb d60213        	ld	a,(__hcLocal,x)
2686  03be 6b01          	ld	(OFST-1,sp),a
2689  03c0 5f            	clrw	x
2690  03c1 97            	ld	xl,a
2691  03c2 d60040        	ld	a,(_iLF_DEF,x)
2692  03c5 5f            	clrw	x
2693  03c6 97            	ld	xl,a
2694  03c7 7b01          	ld	a,(OFST-1,sp)
2695  03c9 905f          	clrw	y
2696  03cb 9097          	ld	yl,a
2697  03cd d6540c        	ld	a,(21516,x)
2698  03d0 90da0000      	or	a,(_bLF_DEF,y)
2699  03d4 d7540c        	ld	(21516,x),a
2702  03d7 0c02          	inc	(OFST+0,sp)
2705  03d9 7b02          	ld	a,(OFST+0,sp)
2706  03db a107          	cp	a,#7
2707  03dd 25da          	jrult	L707
2711  03df 85            	popw	x
2712  03e0 81            	ret	
2755                     ; 352 LCD_DISP_FUNC_1(lcd_disp_setup_mode_each, 11, _hcEach)
2756                     	switch	.text
2757  03e1               _lcd_disp_setup_mode_each:
2759  03e1 89            	pushw	x
2760       00000002      OFST:	set	2
2763  03e2 4f            	clr	a
2764  03e3 6b02          	ld	(OFST+0,sp),a
2765  03e5               L337:
2768  03e5 5f            	clrw	x
2769  03e6 97            	ld	xl,a
2770  03e7 d6021a        	ld	a,(__hcEach,x)
2771  03ea 6b01          	ld	(OFST-1,sp),a
2774  03ec 5f            	clrw	x
2775  03ed 97            	ld	xl,a
2776  03ee d60040        	ld	a,(_iLF_DEF,x)
2777  03f1 5f            	clrw	x
2778  03f2 97            	ld	xl,a
2779  03f3 7b01          	ld	a,(OFST-1,sp)
2780  03f5 905f          	clrw	y
2781  03f7 9097          	ld	yl,a
2782  03f9 d6540c        	ld	a,(21516,x)
2783  03fc 90da0000      	or	a,(_bLF_DEF,y)
2784  0400 d7540c        	ld	(21516,x),a
2787  0403 0c02          	inc	(OFST+0,sp)
2790  0405 7b02          	ld	a,(OFST+0,sp)
2791  0407 a10b          	cp	a,#11
2792  0409 25da          	jrult	L337
2796  040b 85            	popw	x
2797  040c 81            	ret	
2841                     ; 353 LCD_DISP_FUNC(lcd_disp_setup_mode, 8, _hc)
2842                     	switch	.text
2843  040d               _lcd_disp_setup_mode:
2845  040d 89            	pushw	x
2846       00000002      OFST:	set	2
2851  040e cd05d9        	call	_lcd_clear_n
2854  0411 4f            	clr	a
2855  0412 6b02          	ld	(OFST+0,sp),a
2856  0414               L757:
2859  0414 5f            	clrw	x
2860  0415 97            	ld	xl,a
2861  0416 d6022d        	ld	a,(__hc,x)
2862  0419 6b01          	ld	(OFST-1,sp),a
2865  041b 5f            	clrw	x
2866  041c 97            	ld	xl,a
2867  041d d60040        	ld	a,(_iLF_DEF,x)
2868  0420 5f            	clrw	x
2869  0421 97            	ld	xl,a
2870  0422 7b01          	ld	a,(OFST-1,sp)
2871  0424 905f          	clrw	y
2872  0426 9097          	ld	yl,a
2873  0428 d6540c        	ld	a,(21516,x)
2874  042b 90da0000      	or	a,(_bLF_DEF,y)
2875  042f d7540c        	ld	(21516,x),a
2878  0432 0c02          	inc	(OFST+0,sp)
2881  0434 7b02          	ld	a,(OFST+0,sp)
2882  0436 a108          	cp	a,#8
2883  0438 25da          	jrult	L757
2887  043a 85            	popw	x
2888  043b 81            	ret	
2931                     ; 355 LCD_DISP_FUNC(lcd_disp_setup_id, 6, _nid)
2932                     	switch	.text
2933  043c               _lcd_disp_setup_id:
2935  043c 89            	pushw	x
2936       00000002      OFST:	set	2
2941  043d cd05d9        	call	_lcd_clear_n
2944  0440 4f            	clr	a
2945  0441 6b02          	ld	(OFST+0,sp),a
2946  0443               L3001:
2949  0443 5f            	clrw	x
2950  0444 97            	ld	xl,a
2951  0445 d601d8        	ld	a,(__nid,x)
2952  0448 6b01          	ld	(OFST-1,sp),a
2955  044a 5f            	clrw	x
2956  044b 97            	ld	xl,a
2957  044c d60040        	ld	a,(_iLF_DEF,x)
2958  044f 5f            	clrw	x
2959  0450 97            	ld	xl,a
2960  0451 7b01          	ld	a,(OFST-1,sp)
2961  0453 905f          	clrw	y
2962  0455 9097          	ld	yl,a
2963  0457 d6540c        	ld	a,(21516,x)
2964  045a 90da0000      	or	a,(_bLF_DEF,y)
2965  045e d7540c        	ld	(21516,x),a
2968  0461 0c02          	inc	(OFST+0,sp)
2971  0463 7b02          	ld	a,(OFST+0,sp)
2972  0465 a106          	cp	a,#6
2973  0467 25da          	jrult	L3001
2977  0469 85            	popw	x
2978  046a 81            	ret	
3021                     ; 356 LCD_DISP_FUNC(lcd_disp_setup_m, 3, _nm)
3022                     	switch	.text
3023  046b               _lcd_disp_setup_m:
3025  046b 89            	pushw	x
3026       00000002      OFST:	set	2
3031  046c cd05d9        	call	_lcd_clear_n
3034  046f 4f            	clr	a
3035  0470 6b02          	ld	(OFST+0,sp),a
3036  0472               L7201:
3039  0472 5f            	clrw	x
3040  0473 97            	ld	xl,a
3041  0474 d601a6        	ld	a,(__nm,x)
3042  0477 6b01          	ld	(OFST-1,sp),a
3045  0479 5f            	clrw	x
3046  047a 97            	ld	xl,a
3047  047b d60040        	ld	a,(_iLF_DEF,x)
3048  047e 5f            	clrw	x
3049  047f 97            	ld	xl,a
3050  0480 7b01          	ld	a,(OFST-1,sp)
3051  0482 905f          	clrw	y
3052  0484 9097          	ld	yl,a
3053  0486 d6540c        	ld	a,(21516,x)
3054  0489 90da0000      	or	a,(_bLF_DEF,y)
3055  048d d7540c        	ld	(21516,x),a
3058  0490 0c02          	inc	(OFST+0,sp)
3061  0492 7b02          	ld	a,(OFST+0,sp)
3062  0494 a103          	cp	a,#3
3063  0496 25da          	jrult	L7201
3067  0498 85            	popw	x
3068  0499 81            	ret	
3111                     ; 357 LCD_DISP_FUNC(lcd_disp_setup_cnt, 6, _ncnt)
3112                     	switch	.text
3113  049a               _lcd_disp_setup_cnt:
3115  049a 89            	pushw	x
3116       00000002      OFST:	set	2
3121  049b cd05d9        	call	_lcd_clear_n
3124  049e 4f            	clr	a
3125  049f 6b02          	ld	(OFST+0,sp),a
3126  04a1               L3501:
3129  04a1 5f            	clrw	x
3130  04a2 97            	ld	xl,a
3131  04a3 d601a9        	ld	a,(__ncnt,x)
3132  04a6 6b01          	ld	(OFST-1,sp),a
3135  04a8 5f            	clrw	x
3136  04a9 97            	ld	xl,a
3137  04aa d60040        	ld	a,(_iLF_DEF,x)
3138  04ad 5f            	clrw	x
3139  04ae 97            	ld	xl,a
3140  04af 7b01          	ld	a,(OFST-1,sp)
3141  04b1 905f          	clrw	y
3142  04b3 9097          	ld	yl,a
3143  04b5 d6540c        	ld	a,(21516,x)
3144  04b8 90da0000      	or	a,(_bLF_DEF,y)
3145  04bc d7540c        	ld	(21516,x),a
3148  04bf 0c02          	inc	(OFST+0,sp)
3151  04c1 7b02          	ld	a,(OFST+0,sp)
3152  04c3 a106          	cp	a,#6
3153  04c5 25da          	jrult	L3501
3157  04c7 85            	popw	x
3158  04c8 81            	ret	
3202                     ; 358 LCD_DISP_FUNC(lcd_disp_setup_valve, 6, _nvalve)
3203                     	switch	.text
3204  04c9               _lcd_disp_setup_valve:
3206  04c9 89            	pushw	x
3207       00000002      OFST:	set	2
3212  04ca cd05d9        	call	_lcd_clear_n
3215  04cd 4f            	clr	a
3216  04ce 6b02          	ld	(OFST+0,sp),a
3217  04d0               L7701:
3220  04d0 5f            	clrw	x
3221  04d1 97            	ld	xl,a
3222  04d2 d601af        	ld	a,(__nvalve,x)
3223  04d5 6b01          	ld	(OFST-1,sp),a
3226  04d7 5f            	clrw	x
3227  04d8 97            	ld	xl,a
3228  04d9 d60040        	ld	a,(_iLF_DEF,x)
3229  04dc 5f            	clrw	x
3230  04dd 97            	ld	xl,a
3231  04de 7b01          	ld	a,(OFST-1,sp)
3232  04e0 905f          	clrw	y
3233  04e2 9097          	ld	yl,a
3234  04e4 d6540c        	ld	a,(21516,x)
3235  04e7 90da0000      	or	a,(_bLF_DEF,y)
3236  04eb d7540c        	ld	(21516,x),a
3239  04ee 0c02          	inc	(OFST+0,sp)
3242  04f0 7b02          	ld	a,(OFST+0,sp)
3243  04f2 a106          	cp	a,#6
3244  04f4 25da          	jrult	L7701
3248  04f6 85            	popw	x
3249  04f7 81            	ret	
3292                     ; 360 LCD_CLEAR_FUNC(lcd_clear_backlight, 8, _bL)
3293                     	switch	.text
3294  04f8               _lcd_clear_backlight:
3296  04f8 89            	pushw	x
3297       00000002      OFST:	set	2
3300  04f9 4f            	clr	a
3301  04fa 6b02          	ld	(OFST+0,sp),a
3302  04fc               L3211:
3305  04fc 5f            	clrw	x
3306  04fd 97            	ld	xl,a
3307  04fe d601f1        	ld	a,(__bL,x)
3308  0501 6b01          	ld	(OFST-1,sp),a
3311  0503 5f            	clrw	x
3312  0504 97            	ld	xl,a
3313  0505 d60040        	ld	a,(_iLF_DEF,x)
3314  0508 5f            	clrw	x
3315  0509 97            	ld	xl,a
3316  050a 7b01          	ld	a,(OFST-1,sp)
3317  050c 905f          	clrw	y
3318  050e 9097          	ld	yl,a
3319  0510 90d60000      	ld	a,(_bLF_DEF,y)
3320  0514 43            	cpl	a
3321  0515 d4540c        	and	a,(21516,x)
3322  0518 d7540c        	ld	(21516,x),a
3325  051b 0c02          	inc	(OFST+0,sp)
3328  051d 7b02          	ld	a,(OFST+0,sp)
3329  051f a108          	cp	a,#8
3330  0521 25d9          	jrult	L3211
3334  0523 85            	popw	x
3335  0524 81            	ret	
3377                     ; 361 LCD_CLEAR_FUNC(lcd_clear_c, 4, _cc)
3378                     	switch	.text
3379  0525               _lcd_clear_c:
3381  0525 89            	pushw	x
3382       00000002      OFST:	set	2
3385  0526 4f            	clr	a
3386  0527 6b02          	ld	(OFST+0,sp),a
3387  0529               L7411:
3390  0529 5f            	clrw	x
3391  052a 97            	ld	xl,a
3392  052b d601fe        	ld	a,(__cc,x)
3393  052e 6b01          	ld	(OFST-1,sp),a
3396  0530 5f            	clrw	x
3397  0531 97            	ld	xl,a
3398  0532 d60040        	ld	a,(_iLF_DEF,x)
3399  0535 5f            	clrw	x
3400  0536 97            	ld	xl,a
3401  0537 7b01          	ld	a,(OFST-1,sp)
3402  0539 905f          	clrw	y
3403  053b 9097          	ld	yl,a
3404  053d 90d60000      	ld	a,(_bLF_DEF,y)
3405  0541 43            	cpl	a
3406  0542 d4540c        	and	a,(21516,x)
3407  0545 d7540c        	ld	(21516,x),a
3410  0548 0c02          	inc	(OFST+0,sp)
3413  054a 7b02          	ld	a,(OFST+0,sp)
3414  054c a104          	cp	a,#4
3415  054e 25d9          	jrult	L7411
3419  0550 85            	popw	x
3420  0551 81            	ret	
3462                     ; 363 LCD_CLEAR_FUNC(lcd_clear_btn, 5, _btn)
3463                     	switch	.text
3464  0552               _lcd_clear_btn:
3466  0552 89            	pushw	x
3467       00000002      OFST:	set	2
3470  0553 4f            	clr	a
3471  0554 6b02          	ld	(OFST+0,sp),a
3472  0556               L3711:
3475  0556 5f            	clrw	x
3476  0557 97            	ld	xl,a
3477  0558 d601f9        	ld	a,(__btn,x)
3478  055b 6b01          	ld	(OFST-1,sp),a
3481  055d 5f            	clrw	x
3482  055e 97            	ld	xl,a
3483  055f d60040        	ld	a,(_iLF_DEF,x)
3484  0562 5f            	clrw	x
3485  0563 97            	ld	xl,a
3486  0564 7b01          	ld	a,(OFST-1,sp)
3487  0566 905f          	clrw	y
3488  0568 9097          	ld	yl,a
3489  056a 90d60000      	ld	a,(_bLF_DEF,y)
3490  056e 43            	cpl	a
3491  056f d4540c        	and	a,(21516,x)
3492  0572 d7540c        	ld	(21516,x),a
3495  0575 0c02          	inc	(OFST+0,sp)
3498  0577 7b02          	ld	a,(OFST+0,sp)
3499  0579 a105          	cp	a,#5
3500  057b 25d9          	jrult	L3711
3504  057d 85            	popw	x
3505  057e 81            	ret	
3547                     ; 364 LCD_CLEAR_FUNC(lcd_clear_run, 8, _run)
3548                     	switch	.text
3549  057f               _lcd_clear_run:
3551  057f 89            	pushw	x
3552       00000002      OFST:	set	2
3555  0580 4f            	clr	a
3556  0581 6b02          	ld	(OFST+0,sp),a
3557  0583               L7121:
3560  0583 5f            	clrw	x
3561  0584 97            	ld	xl,a
3562  0585 d60225        	ld	a,(__run,x)
3563  0588 6b01          	ld	(OFST-1,sp),a
3566  058a 5f            	clrw	x
3567  058b 97            	ld	xl,a
3568  058c d60040        	ld	a,(_iLF_DEF,x)
3569  058f 5f            	clrw	x
3570  0590 97            	ld	xl,a
3571  0591 7b01          	ld	a,(OFST-1,sp)
3572  0593 905f          	clrw	y
3573  0595 9097          	ld	yl,a
3574  0597 90d60000      	ld	a,(_bLF_DEF,y)
3575  059b 43            	cpl	a
3576  059c d4540c        	and	a,(21516,x)
3577  059f d7540c        	ld	(21516,x),a
3580  05a2 0c02          	inc	(OFST+0,sp)
3583  05a4 7b02          	ld	a,(OFST+0,sp)
3584  05a6 a108          	cp	a,#8
3585  05a8 25d9          	jrult	L7121
3589  05aa 85            	popw	x
3590  05ab 81            	ret	
3632                     ; 365 LCD_CLEAR_FUNC(lcd_clear_mode, 8, _hc)
3633                     	switch	.text
3634  05ac               _lcd_clear_mode:
3636  05ac 89            	pushw	x
3637       00000002      OFST:	set	2
3640  05ad 4f            	clr	a
3641  05ae 6b02          	ld	(OFST+0,sp),a
3642  05b0               L3421:
3645  05b0 5f            	clrw	x
3646  05b1 97            	ld	xl,a
3647  05b2 d6022d        	ld	a,(__hc,x)
3648  05b5 6b01          	ld	(OFST-1,sp),a
3651  05b7 5f            	clrw	x
3652  05b8 97            	ld	xl,a
3653  05b9 d60040        	ld	a,(_iLF_DEF,x)
3654  05bc 5f            	clrw	x
3655  05bd 97            	ld	xl,a
3656  05be 7b01          	ld	a,(OFST-1,sp)
3657  05c0 905f          	clrw	y
3658  05c2 9097          	ld	yl,a
3659  05c4 90d60000      	ld	a,(_bLF_DEF,y)
3660  05c8 43            	cpl	a
3661  05c9 d4540c        	and	a,(21516,x)
3662  05cc d7540c        	ld	(21516,x),a
3665  05cf 0c02          	inc	(OFST+0,sp)
3668  05d1 7b02          	ld	a,(OFST+0,sp)
3669  05d3 a108          	cp	a,#8
3670  05d5 25d9          	jrult	L3421
3674  05d7 85            	popw	x
3675  05d8 81            	ret	
3717                     ; 366 LCD_CLEAR_FUNC(lcd_clear_n, 35, _n)
3718                     	switch	.text
3719  05d9               _lcd_clear_n:
3721  05d9 89            	pushw	x
3722       00000002      OFST:	set	2
3725  05da 4f            	clr	a
3726  05db 6b02          	ld	(OFST+0,sp),a
3727  05dd               L7621:
3730  05dd 5f            	clrw	x
3731  05de 97            	ld	xl,a
3732  05df d601b5        	ld	a,(__n,x)
3733  05e2 6b01          	ld	(OFST-1,sp),a
3736  05e4 5f            	clrw	x
3737  05e5 97            	ld	xl,a
3738  05e6 d60040        	ld	a,(_iLF_DEF,x)
3739  05e9 5f            	clrw	x
3740  05ea 97            	ld	xl,a
3741  05eb 7b01          	ld	a,(OFST-1,sp)
3742  05ed 905f          	clrw	y
3743  05ef 9097          	ld	yl,a
3744  05f1 90d60000      	ld	a,(_bLF_DEF,y)
3745  05f5 43            	cpl	a
3746  05f6 d4540c        	and	a,(21516,x)
3747  05f9 d7540c        	ld	(21516,x),a
3750  05fc 0c02          	inc	(OFST+0,sp)
3753  05fe 7b02          	ld	a,(OFST+0,sp)
3754  0600 a123          	cp	a,#35
3755  0602 25d9          	jrult	L7621
3759  0604 85            	popw	x
3760  0605 81            	ret	
3802                     ; 368 LCD_CLEAR_FUNC(lcd_clear_info, 3, _info)
3803                     	switch	.text
3804  0606               _lcd_clear_info:
3806  0606 89            	pushw	x
3807       00000002      OFST:	set	2
3810  0607 4f            	clr	a
3811  0608 6b02          	ld	(OFST+0,sp),a
3812  060a               L3131:
3815  060a 5f            	clrw	x
3816  060b 97            	ld	xl,a
3817  060c d601de        	ld	a,(__info,x)
3818  060f 6b01          	ld	(OFST-1,sp),a
3821  0611 5f            	clrw	x
3822  0612 97            	ld	xl,a
3823  0613 d60040        	ld	a,(_iLF_DEF,x)
3824  0616 5f            	clrw	x
3825  0617 97            	ld	xl,a
3826  0618 7b01          	ld	a,(OFST-1,sp)
3827  061a 905f          	clrw	y
3828  061c 9097          	ld	yl,a
3829  061e 90d60000      	ld	a,(_bLF_DEF,y)
3830  0622 43            	cpl	a
3831  0623 d4540c        	and	a,(21516,x)
3832  0626 d7540c        	ld	(21516,x),a
3835  0629 0c02          	inc	(OFST+0,sp)
3838  062b 7b02          	ld	a,(OFST+0,sp)
3839  062d a103          	cp	a,#3
3840  062f 25d9          	jrult	L3131
3844  0631 85            	popw	x
3845  0632 81            	ret	
3887                     ; 374 LCD_CLEAR_FUNC(lcd_clear_rid, 16, _rid)
3888                     	switch	.text
3889  0633               _lcd_clear_rid:
3891  0633 89            	pushw	x
3892       00000002      OFST:	set	2
3895  0634 4f            	clr	a
3896  0635 6b02          	ld	(OFST+0,sp),a
3897  0637               L7331:
3900  0637 5f            	clrw	x
3901  0638 97            	ld	xl,a
3902  0639 d601e1        	ld	a,(__rid,x)
3903  063c 6b01          	ld	(OFST-1,sp),a
3906  063e 5f            	clrw	x
3907  063f 97            	ld	xl,a
3908  0640 d60040        	ld	a,(_iLF_DEF,x)
3909  0643 5f            	clrw	x
3910  0644 97            	ld	xl,a
3911  0645 7b01          	ld	a,(OFST-1,sp)
3912  0647 905f          	clrw	y
3913  0649 9097          	ld	yl,a
3914  064b 90d60000      	ld	a,(_bLF_DEF,y)
3915  064f 43            	cpl	a
3916  0650 d4540c        	and	a,(21516,x)
3917  0653 d7540c        	ld	(21516,x),a
3920  0656 0c02          	inc	(OFST+0,sp)
3923  0658 7b02          	ld	a,(OFST+0,sp)
3924  065a a110          	cp	a,#16
3925  065c 25d9          	jrult	L7331
3929  065e 85            	popw	x
3930  065f 81            	ret	
3972                     ; 376 LCD_CLEAR_FUNC(lcd_clear_m, 3, _nm)
3973                     	switch	.text
3974  0660               _lcd_clear_m:
3976  0660 89            	pushw	x
3977       00000002      OFST:	set	2
3980  0661 4f            	clr	a
3981  0662 6b02          	ld	(OFST+0,sp),a
3982  0664               L3631:
3985  0664 5f            	clrw	x
3986  0665 97            	ld	xl,a
3987  0666 d601a6        	ld	a,(__nm,x)
3988  0669 6b01          	ld	(OFST-1,sp),a
3991  066b 5f            	clrw	x
3992  066c 97            	ld	xl,a
3993  066d d60040        	ld	a,(_iLF_DEF,x)
3994  0670 5f            	clrw	x
3995  0671 97            	ld	xl,a
3996  0672 7b01          	ld	a,(OFST-1,sp)
3997  0674 905f          	clrw	y
3998  0676 9097          	ld	yl,a
3999  0678 90d60000      	ld	a,(_bLF_DEF,y)
4000  067c 43            	cpl	a
4001  067d d4540c        	and	a,(21516,x)
4002  0680 d7540c        	ld	(21516,x),a
4005  0683 0c02          	inc	(OFST+0,sp)
4008  0685 7b02          	ld	a,(OFST+0,sp)
4009  0687 a103          	cp	a,#3
4010  0689 25d9          	jrult	L3631
4014  068b 85            	popw	x
4015  068c 81            	ret	
4057                     ; 377 LCD_CLEAR_FUNC(lcd_clear_cnt, 6, _ncnt)
4058                     	switch	.text
4059  068d               _lcd_clear_cnt:
4061  068d 89            	pushw	x
4062       00000002      OFST:	set	2
4065  068e 4f            	clr	a
4066  068f 6b02          	ld	(OFST+0,sp),a
4067  0691               L7041:
4070  0691 5f            	clrw	x
4071  0692 97            	ld	xl,a
4072  0693 d601a9        	ld	a,(__ncnt,x)
4073  0696 6b01          	ld	(OFST-1,sp),a
4076  0698 5f            	clrw	x
4077  0699 97            	ld	xl,a
4078  069a d60040        	ld	a,(_iLF_DEF,x)
4079  069d 5f            	clrw	x
4080  069e 97            	ld	xl,a
4081  069f 7b01          	ld	a,(OFST-1,sp)
4082  06a1 905f          	clrw	y
4083  06a3 9097          	ld	yl,a
4084  06a5 90d60000      	ld	a,(_bLF_DEF,y)
4085  06a9 43            	cpl	a
4086  06aa d4540c        	and	a,(21516,x)
4087  06ad d7540c        	ld	(21516,x),a
4090  06b0 0c02          	inc	(OFST+0,sp)
4093  06b2 7b02          	ld	a,(OFST+0,sp)
4094  06b4 a106          	cp	a,#6
4095  06b6 25d9          	jrult	L7041
4099  06b8 85            	popw	x
4100  06b9 81            	ret	
4149                     ; 379 void	lcd_clear_npos(uint8_t pos, uint8_t type)
4149                     ; 380 {
4150                     	switch	.text
4151  06ba               _lcd_clear_npos:
4153  06ba 89            	pushw	x
4154  06bb 89            	pushw	x
4155       00000002      OFST:	set	2
4158                     ; 382 	pos = pos*7;
4160  06bc ae0007        	ldw	x,#7
4161  06bf 7b03          	ld	a,(OFST+1,sp)
4162  06c1 42            	mul	x,a
4163  06c2 9f            	ld	a,xl
4164  06c3 6b03          	ld	(OFST+1,sp),a
4165                     ; 383 	for( i=0; i<7; i++ )
4167  06c5 0f01          	clr	(OFST-1,sp)
4168  06c7               L5341:
4169                     ; 385 		j = _n[pos++];
4171  06c7 7b03          	ld	a,(OFST+1,sp)
4172  06c9 0c03          	inc	(OFST+1,sp)
4173  06cb 5f            	clrw	x
4174  06cc 97            	ld	xl,a
4175  06cd d601b5        	ld	a,(__n,x)
4176  06d0 6b02          	ld	(OFST+0,sp),a
4177                     ; 386 		LCD_BIT_CLEAR(j);
4179  06d2 5f            	clrw	x
4180  06d3 97            	ld	xl,a
4181  06d4 d60040        	ld	a,(_iLF_DEF,x)
4182  06d7 5f            	clrw	x
4183  06d8 97            	ld	xl,a
4184  06d9 7b02          	ld	a,(OFST+0,sp)
4185  06db 905f          	clrw	y
4186  06dd 9097          	ld	yl,a
4187  06df 90d60000      	ld	a,(_bLF_DEF,y)
4188  06e3 43            	cpl	a
4189  06e4 d4540c        	and	a,(21516,x)
4190  06e7 d7540c        	ld	(21516,x),a
4191                     ; 383 	for( i=0; i<7; i++ )
4193  06ea 0c01          	inc	(OFST-1,sp)
4196  06ec 7b01          	ld	a,(OFST-1,sp)
4197  06ee a107          	cp	a,#7
4198  06f0 25d5          	jrult	L5341
4199                     ; 388 }
4202  06f2 5b04          	addw	sp,#4
4203  06f4 81            	ret	
4235                     ; 390 void	lcd_disp_all(void)
4235                     ; 391 {
4236                     	switch	.text
4237  06f5               _lcd_disp_all:
4239  06f5 88            	push	a
4240       00000001      OFST:	set	1
4243                     ; 393 	for( i=0; i<15; i++ )
4245  06f6 4f            	clr	a
4246  06f7 6b01          	ld	(OFST+0,sp),a
4247  06f9               L7541:
4248                     ; 394 		LCD->RAM[i] = 0xff;
4250  06f9 5f            	clrw	x
4251  06fa 97            	ld	xl,a
4252  06fb a6ff          	ld	a,#255
4253  06fd d7540c        	ld	(21516,x),a
4254                     ; 393 	for( i=0; i<15; i++ )
4256  0700 0c01          	inc	(OFST+0,sp)
4259  0702 7b01          	ld	a,(OFST+0,sp)
4260  0704 a10f          	cp	a,#15
4261  0706 25f1          	jrult	L7541
4262                     ; 395 }
4265  0708 84            	pop	a
4266  0709 81            	ret	
4305                     ; 397 void	lcd_clear(uint8_t type)
4305                     ; 398 {
4306                     	switch	.text
4307  070a               _lcd_clear:
4309  070a 88            	push	a
4310       00000001      OFST:	set	1
4313                     ; 400 	for( i=0; i<15; i++ )
4315  070b 4f            	clr	a
4316  070c 6b01          	ld	(OFST+0,sp),a
4317  070e               L3051:
4318                     ; 401 		LCD->RAM[i] = 0;
4320  070e 5f            	clrw	x
4321  070f 97            	ld	xl,a
4322  0710 724f540c      	clr	(21516,x)
4323                     ; 400 	for( i=0; i<15; i++ )
4325  0714 0c01          	inc	(OFST+0,sp)
4328  0716 7b01          	ld	a,(OFST+0,sp)
4329  0718 a10f          	cp	a,#15
4330  071a 25f2          	jrult	L3051
4331                     ; 402 }
4334  071c 84            	pop	a
4335  071d 81            	ret	
4382                     ; 404 uint8_t	*lcd_get_npos(uint8_t i)
4382                     ; 405 {
4383                     	switch	.text
4384  071e               _lcd_get_npos:
4386  071e 89            	pushw	x
4387       00000002      OFST:	set	2
4390                     ; 407 	switch( i )
4393                     ; 420 	case 3:	p = _nd;	break;
4394  071f 4d            	tnz	a
4395  0720 270d          	jreq	L1151
4396  0722 4a            	dec	a
4397  0723 270f          	jreq	L3151
4398  0725 4a            	dec	a
4399  0726 2711          	jreq	L5151
4400  0728 4a            	dec	a
4401  0729 2713          	jreq	L7151
4402  072b 1e01          	ldw	x,(OFST-1,sp)
4403  072d 2012          	jra	LC001
4404  072f               L1151:
4405                     ; 417 	case 0:	p = _na;	break;
4407  072f ae0080        	ldw	x,#__na
4410  0732 200d          	jp	LC001
4411  0734               L3151:
4412                     ; 418 	case 1:	p = _nb;	break;
4414  0734 ae00c6        	ldw	x,#__nb
4417  0737 2008          	jp	LC001
4418  0739               L5151:
4419                     ; 419 	case 2:	p = _nc;	break;
4421  0739 ae010c        	ldw	x,#__nc
4424  073c 2003          	jp	LC001
4425  073e               L7151:
4426                     ; 420 	case 3:	p = _nd;	break;
4428  073e ae0152        	ldw	x,#__nd
4429  0741               LC001:
4432                     ; 423 	return p;
4436  0741 5b02          	addw	sp,#2
4437  0743 81            	ret	
4504                     ; 426 void	lcd_disp_n(uint8_t pos, uint8_t n)
4504                     ; 427 {
4505                     	switch	.text
4506  0744               _lcd_disp_n:
4508  0744 89            	pushw	x
4509  0745 5204          	subw	sp,#4
4510       00000004      OFST:	set	4
4513                     ; 431 	lcd_clear_npos(pos, 0);
4515  0747 5f            	clrw	x
4516  0748 7b05          	ld	a,(OFST+1,sp)
4517  074a 95            	ld	xh,a
4518  074b cd06ba        	call	_lcd_clear_npos
4520                     ; 432 	p = lcd_get_npos(pos);
4522  074e 7b05          	ld	a,(OFST+1,sp)
4523  0750 adcc          	call	_lcd_get_npos
4525  0752 1f02          	ldw	(OFST-2,sp),x
4526                     ; 433 	p = p+n*7;
4528  0754 7b06          	ld	a,(OFST+2,sp)
4529  0756 97            	ld	xl,a
4530  0757 a607          	ld	a,#7
4531  0759 42            	mul	x,a
4532  075a 72fb02        	addw	x,(OFST-2,sp)
4533  075d 1f02          	ldw	(OFST-2,sp),x
4534                     ; 434 	for( i=0; i<7; i++ )
4536  075f 0f04          	clr	(OFST+0,sp)
4537  0761               L3751:
4538                     ; 436 		if( p[i] != 0 )
4540  0761 7b02          	ld	a,(OFST-2,sp)
4541  0763 97            	ld	xl,a
4542  0764 7b03          	ld	a,(OFST-1,sp)
4543  0766 1b04          	add	a,(OFST+0,sp)
4544  0768 2401          	jrnc	L471
4545  076a 5c            	incw	x
4546  076b               L471:
4547  076b 02            	rlwa	x,a
4548  076c f6            	ld	a,(x)
4549  076d 2725          	jreq	L1061
4550                     ; 438 			j = p[i];
4552  076f 7b02          	ld	a,(OFST-2,sp)
4553  0771 97            	ld	xl,a
4554  0772 7b03          	ld	a,(OFST-1,sp)
4555  0774 1b04          	add	a,(OFST+0,sp)
4556  0776 2401          	jrnc	L671
4557  0778 5c            	incw	x
4558  0779               L671:
4559  0779 02            	rlwa	x,a
4560  077a f6            	ld	a,(x)
4561  077b 6b01          	ld	(OFST-3,sp),a
4562                     ; 439 			LCD_BIT_SET(j);
4564  077d 5f            	clrw	x
4565  077e 97            	ld	xl,a
4566  077f d60040        	ld	a,(_iLF_DEF,x)
4567  0782 5f            	clrw	x
4568  0783 97            	ld	xl,a
4569  0784 7b01          	ld	a,(OFST-3,sp)
4570  0786 905f          	clrw	y
4571  0788 9097          	ld	yl,a
4572  078a d6540c        	ld	a,(21516,x)
4573  078d 90da0000      	or	a,(_bLF_DEF,y)
4574  0791 d7540c        	ld	(21516,x),a
4575  0794               L1061:
4576                     ; 434 	for( i=0; i<7; i++ )
4578  0794 0c04          	inc	(OFST+0,sp)
4581  0796 7b04          	ld	a,(OFST+0,sp)
4582  0798 a107          	cp	a,#7
4583  079a 25c5          	jrult	L3751
4584                     ; 442 }
4587  079c 5b06          	addw	sp,#6
4588  079e 81            	ret	
4645                     ; 446 void	lcd_disp_err(uint8_t n)
4645                     ; 447 {
4646                     	switch	.text
4647  079f               _lcd_disp_err:
4649  079f 88            	push	a
4650  07a0 5204          	subw	sp,#4
4651       00000004      OFST:	set	4
4654                     ; 450 	LCD_CE;
4656  07a2 72165402      	bset	21506,#3
4657                     ; 451 	lcd_clear_n();
4659  07a6 cd05d9        	call	_lcd_clear_n
4661                     ; 452 	p = error_type==1 ? _nerrBr : _nerr;
4663  07a9 c60000        	ld	a,_error_type
4664  07ac 4a            	dec	a
4665  07ad 2605          	jrne	L402
4666  07af ae019f        	ldw	x,#__nerrBr
4667  07b2 2003          	jra	L602
4668  07b4               L402:
4669  07b4 ae0198        	ldw	x,#__nerr
4670  07b7               L602:
4671  07b7 1f02          	ldw	(OFST-2,sp),x
4672                     ; 453 	for( i=0; i<7; i++ )
4674  07b9 0f04          	clr	(OFST+0,sp)
4675  07bb               L7261:
4676                     ; 455 		LCD_BIT_SET(p[i]);
4678  07bb 7b02          	ld	a,(OFST-2,sp)
4679  07bd 97            	ld	xl,a
4680  07be 7b03          	ld	a,(OFST-1,sp)
4681  07c0 1b04          	add	a,(OFST+0,sp)
4682  07c2 2401          	jrnc	L012
4683  07c4 5c            	incw	x
4684  07c5               L012:
4685  07c5 02            	rlwa	x,a
4686  07c6 f6            	ld	a,(x)
4687  07c7 5f            	clrw	x
4688  07c8 97            	ld	xl,a
4689  07c9 d60000        	ld	a,(_bLF_DEF,x)
4690  07cc 6b01          	ld	(OFST-3,sp),a
4691  07ce 7b02          	ld	a,(OFST-2,sp)
4692  07d0 97            	ld	xl,a
4693  07d1 7b03          	ld	a,(OFST-1,sp)
4694  07d3 1b04          	add	a,(OFST+0,sp)
4695  07d5 2401          	jrnc	L212
4696  07d7 5c            	incw	x
4697  07d8               L212:
4698  07d8 02            	rlwa	x,a
4699  07d9 f6            	ld	a,(x)
4700  07da 5f            	clrw	x
4701  07db 97            	ld	xl,a
4702  07dc d60040        	ld	a,(_iLF_DEF,x)
4703  07df 5f            	clrw	x
4704  07e0 97            	ld	xl,a
4705  07e1 d6540c        	ld	a,(21516,x)
4706  07e4 1a01          	or	a,(OFST-3,sp)
4707  07e6 d7540c        	ld	(21516,x),a
4708                     ; 453 	for( i=0; i<7; i++ )
4710  07e9 0c04          	inc	(OFST+0,sp)
4713  07eb 7b04          	ld	a,(OFST+0,sp)
4714  07ed a107          	cp	a,#7
4715  07ef 25ca          	jrult	L7261
4716                     ; 457 	if( uiInfo.mode == 1 )
4718  07f1 c60008        	ld	a,_uiInfo+8
4719  07f4 4a            	dec	a
4720  07f5 2706          	jreq	L3061
4721                     ; 466 		if( n==30 )
4723  07f7 7b05          	ld	a,(OFST+1,sp)
4724  07f9 a11e          	cp	a,#30
4725  07fb 261b          	jrne	L7361
4726                     ; 467 			goto Print;
4727  07fd               L3061:
4728                     ; 459 Print:		
4728                     ; 460 //		LCD_BIT_SET(bCOL);
4728                     ; 461 		lcd_disp_n(2, n/10);
4730  07fd 7b05          	ld	a,(OFST+1,sp)
4731  07ff 5f            	clrw	x
4732  0800 97            	ld	xl,a
4733  0801 a60a          	ld	a,#10
4734  0803 62            	div	x,a
4735  0804 a602          	ld	a,#2
4736  0806 95            	ld	xh,a
4737  0807 cd0744        	call	_lcd_disp_n
4739                     ; 462 		lcd_disp_n(3, n%10);
4741  080a 7b05          	ld	a,(OFST+1,sp)
4742  080c 5f            	clrw	x
4743  080d 97            	ld	xl,a
4744  080e a60a          	ld	a,#10
4745  0810 62            	div	x,a
4746  0811 97            	ld	xl,a
4747  0812 a603          	ld	a,#3
4748  0814 95            	ld	xh,a
4749  0815 cd0744        	call	_lcd_disp_n
4752  0818               L7361:
4753                     ; 469 }
4756  0818 5b05          	addw	sp,#5
4757  081a 81            	ret	
4814                     ; 471 void	lcd_disp_rid(uint8_t id, uint8_t mode, uint8_t multi)
4814                     ; 472 {
4815                     	switch	.text
4816  081b               _lcd_disp_rid:
4818  081b 89            	pushw	x
4819  081c 88            	push	a
4820       00000001      OFST:	set	1
4823                     ; 477 	LCD_CE;
4825  081d 72165402      	bset	21506,#3
4826                     ; 478 	if( multi == 0 )
4828  0821 7b06          	ld	a,(OFST+5,sp)
4829  0823 2603          	jrne	L5661
4830                     ; 484 		lcd_clear_rid();
4832  0825 cd0633        	call	_lcd_clear_rid
4834  0828               L5661:
4835                     ; 487 	if( id != 0 )
4837  0828 7b02          	ld	a,(OFST+1,sp)
4838  082a 2702          	jreq	L7661
4839                     ; 488 		id -= 1;
4841  082c 0a02          	dec	(OFST+1,sp)
4842  082e               L7661:
4843                     ; 504 	if( mode != 0 )
4845  082e 7b03          	ld	a,(OFST+2,sp)
4846  0830 2712          	jreq	L1761
4847                     ; 506 		j = _rid[id*2+1];
4849  0832 7b02          	ld	a,(OFST+1,sp)
4850  0834 5f            	clrw	x
4851  0835 97            	ld	xl,a
4852  0836 58            	sllw	x
4853  0837 d601e2        	ld	a,(__rid+1,x)
4854  083a 6b01          	ld	(OFST+0,sp),a
4855                     ; 507 		LCD_BIT_SET(j);
4857  083c ad39          	call	LC002
4858  083e 7b01          	ld	a,(OFST+0,sp)
4859  0840 ad3d          	call	LC003
4861  0842 201a          	jra	L3761
4862  0844               L1761:
4863                     ; 509 		j = _rid[id*2+1];
4865  0844 7b02          	ld	a,(OFST+1,sp)
4866  0846 5f            	clrw	x
4867  0847 97            	ld	xl,a
4868  0848 58            	sllw	x
4869  0849 d601e2        	ld	a,(__rid+1,x)
4870  084c 6b01          	ld	(OFST+0,sp),a
4871                     ; 510 		LCD_BIT_CLEAR(j);
4873  084e ad27          	call	LC002
4874  0850 7b01          	ld	a,(OFST+0,sp)
4875  0852 905f          	clrw	y
4876  0854 9097          	ld	yl,a
4877  0856 90d60000      	ld	a,(_bLF_DEF,y)
4878  085a 43            	cpl	a
4879  085b d4540c        	and	a,(21516,x)
4880  085e               L3761:
4881  085e d7540c        	ld	(21516,x),a
4882                     ; 512 	j = _rid[id*2];
4884  0861 7b02          	ld	a,(OFST+1,sp)
4885  0863 5f            	clrw	x
4886  0864 97            	ld	xl,a
4887  0865 58            	sllw	x
4888  0866 d601e1        	ld	a,(__rid,x)
4889  0869 6b01          	ld	(OFST+0,sp),a
4890                     ; 513 	LCD_BIT_SET(j);
4892  086b ad0a          	call	LC002
4893  086d 7b01          	ld	a,(OFST+0,sp)
4894  086f ad0e          	call	LC003
4895  0871 d7540c        	ld	(21516,x),a
4896                     ; 515 }
4899  0874 5b03          	addw	sp,#3
4900  0876 81            	ret	
4901  0877               LC002:
4902  0877 5f            	clrw	x
4903  0878 97            	ld	xl,a
4904  0879 d60040        	ld	a,(_iLF_DEF,x)
4905  087c 5f            	clrw	x
4906  087d 97            	ld	xl,a
4907  087e 81            	ret	
4908  087f               LC003:
4909  087f 905f          	clrw	y
4910  0881 9097          	ld	yl,a
4911  0883 d6540c        	ld	a,(21516,x)
4912  0886 90da0000      	or	a,(_bLF_DEF,y)
4913  088a 81            	ret	
4962                     ; 518 void	lcd_clear_rid_n(uint8_t id, uint8_t mode)
4962                     ; 519 {
4963                     	switch	.text
4964  088b               _lcd_clear_rid_n:
4966  088b 89            	pushw	x
4967  088c 88            	push	a
4968       00000001      OFST:	set	1
4971                     ; 521 	LCD_CE;
4973  088d 72165402      	bset	21506,#3
4974                     ; 523 	if( id != 0 )
4976  0891 9e            	ld	a,xh
4977  0892 4d            	tnz	a
4978  0893 2702          	jreq	L5171
4979                     ; 524 		id -= 1;
4981  0895 0a02          	dec	(OFST+1,sp)
4982  0897               L5171:
4983                     ; 526 	if( mode != 0 )
4985  0897 7b03          	ld	a,(OFST+2,sp)
4986  0899 2715          	jreq	L7171
4987                     ; 528 		j = _rid[id*2+1];
4989  089b 7b02          	ld	a,(OFST+1,sp)
4990  089d 5f            	clrw	x
4991  089e 97            	ld	xl,a
4992  089f 58            	sllw	x
4993  08a0 d601e2        	ld	a,(__rid+1,x)
4994  08a3 6b01          	ld	(OFST+0,sp),a
4995                     ; 529 		LCD_BIT_CLEAR(j);
4997  08a5 5f            	clrw	x
4998  08a6 97            	ld	xl,a
4999  08a7 d60040        	ld	a,(_iLF_DEF,x)
5000  08aa 5f            	clrw	x
5001  08ab 97            	ld	xl,a
5002  08ac 7b01          	ld	a,(OFST+0,sp)
5003  08ae ad18          	call	LC004
5004  08b0               L7171:
5005                     ; 531 	j = _rid[id*2];
5007  08b0 7b02          	ld	a,(OFST+1,sp)
5008  08b2 5f            	clrw	x
5009  08b3 97            	ld	xl,a
5010  08b4 58            	sllw	x
5011  08b5 d601e1        	ld	a,(__rid,x)
5012  08b8 6b01          	ld	(OFST+0,sp),a
5013                     ; 532 	LCD_BIT_CLEAR(j);
5015  08ba 5f            	clrw	x
5016  08bb 97            	ld	xl,a
5017  08bc d60040        	ld	a,(_iLF_DEF,x)
5018  08bf 5f            	clrw	x
5019  08c0 97            	ld	xl,a
5020  08c1 7b01          	ld	a,(OFST+0,sp)
5021  08c3 ad03          	call	LC004
5022                     ; 533 }
5025  08c5 5b03          	addw	sp,#3
5026  08c7 81            	ret	
5027  08c8               LC004:
5028  08c8 905f          	clrw	y
5029  08ca 9097          	ld	yl,a
5030  08cc 90d60000      	ld	a,(_bLF_DEF,y)
5031  08d0 43            	cpl	a
5032  08d1 d4540c        	and	a,(21516,x)
5033  08d4 d7540c        	ld	(21516,x),a
5034  08d7 81            	ret	
5075                     ; 534 void	lcd_disp_cmd(uint8_t cmd, uint8_t mode, uint8_t multi)
5075                     ; 535 {
5076                     	switch	.text
5077  08d8               _lcd_disp_cmd:
5079  08d8 88            	push	a
5080       00000001      OFST:	set	1
5083                     ; 537 	LCD_CE;
5085  08d9 72165402      	bset	21506,#3
5086                     ; 547 	LCD_BIT_SET(j);
5088  08dd 7b01          	ld	a,(OFST+0,sp)
5089  08df 5f            	clrw	x
5090  08e0 97            	ld	xl,a
5091  08e1 d60040        	ld	a,(_iLF_DEF,x)
5092  08e4 5f            	clrw	x
5093  08e5 97            	ld	xl,a
5094  08e6 7b01          	ld	a,(OFST+0,sp)
5095  08e8 905f          	clrw	y
5096  08ea 9097          	ld	yl,a
5097  08ec d6540c        	ld	a,(21516,x)
5098  08ef 90da0000      	or	a,(_bLF_DEF,y)
5099  08f3 d7540c        	ld	(21516,x),a
5100                     ; 548 }
5103  08f6 84            	pop	a
5104  08f7 81            	ret	
5139                     ; 550 void	lcd_disp_info_fire(uint8_t mode)
5139                     ; 551 {
5140                     	switch	.text
5141  08f8               _lcd_disp_info_fire:
5145                     ; 552 	if( mode == 0 )
5147  08f8 4d            	tnz	a
5148  08f9 2605          	jrne	L3571
5149                     ; 553 		LCD_BIT_CLEAR(_info[0]);
5151  08fb 721b540c      	bres	21516,#5
5154  08ff 81            	ret	
5155  0900               L3571:
5156                     ; 555 		LCD_BIT_SET(_info[0]);
5158  0900 721a540c      	bset	21516,#5
5159                     ; 556 }
5162  0904 81            	ret	
5198                     ; 558 void	lcd_disp_info_shower(uint8_t mode, uint8_t para)
5198                     ; 559 {
5199                     	switch	.text
5200  0905               _lcd_disp_info_shower:
5202  0905 89            	pushw	x
5203       00000000      OFST:	set	0
5206                     ; 560 	if( (mode & 0x80) != 0 )
5208  0906 9e            	ld	a,xh
5209  0907 a580          	bcp	a,#128
5210  0909 2704          	jreq	L3771
5211                     ; 561 		lcd_blink_item(_info[2]);
5213  090b a60b          	ld	a,#11
5216  090d 2008          	jp	LC005
5217  090f               L3771:
5218                     ; 563 	else if( (mode &0x08) != 0 )
5220  090f 7b01          	ld	a,(OFST+1,sp)
5221  0911 a508          	bcp	a,#8
5222  0913 2707          	jreq	L7771
5223                     ; 564 		lcd_blink_item(_info[1]);
5225  0915 a60a          	ld	a,#10
5226  0917               LC005:
5227  0917 cd0a49        	call	_lcd_blink_item
5230  091a 2003          	jra	L5771
5231  091c               L7771:
5232                     ; 566 		lcd_blink_clear();
5234  091c cd0a3c        	call	_lcd_blink_clear
5236  091f               L5771:
5237                     ; 568 }
5240  091f 85            	popw	x
5241  0920 81            	ret	
5298                     ; 570 void	lcd_disp_info(uint8_t info, uint8_t mode, uint8_t multi)
5298                     ; 571 {
5299                     	switch	.text
5300  0921               _lcd_disp_info:
5302  0921 89            	pushw	x
5303  0922 88            	push	a
5304       00000001      OFST:	set	1
5307                     ; 573 	LCD_CE;
5309  0923 72165402      	bset	21506,#3
5310                     ; 574 	if( multi == 0 )
5312  0927 7b06          	ld	a,(OFST+5,sp)
5313  0929 2603          	jrne	L5202
5314                     ; 575 		lcd_clear_info();
5316  092b cd0606        	call	_lcd_clear_info
5318  092e               L5202:
5319                     ; 580 	j = _info[info];
5321  092e 7b02          	ld	a,(OFST+1,sp)
5322  0930 5f            	clrw	x
5323  0931 97            	ld	xl,a
5324  0932 d601de        	ld	a,(__info,x)
5325  0935 6b01          	ld	(OFST+0,sp),a
5326                     ; 581 	if( mode == 1 )
5328  0937 7b03          	ld	a,(OFST+2,sp)
5329  0939 4a            	dec	a
5330  093a 2619          	jrne	L7202
5331                     ; 582 		LCD_BIT_CLEAR(j);
5333  093c 7b01          	ld	a,(OFST+0,sp)
5334  093e 5f            	clrw	x
5335  093f 97            	ld	xl,a
5336  0940 d60040        	ld	a,(_iLF_DEF,x)
5337  0943 5f            	clrw	x
5338  0944 97            	ld	xl,a
5339  0945 7b01          	ld	a,(OFST+0,sp)
5340  0947 905f          	clrw	y
5341  0949 9097          	ld	yl,a
5342  094b 90d60000      	ld	a,(_bLF_DEF,y)
5343  094f 43            	cpl	a
5344  0950 d4540c        	and	a,(21516,x)
5346  0953 2016          	jra	L1302
5347  0955               L7202:
5348                     ; 584 		LCD_BIT_SET(j);
5350  0955 7b01          	ld	a,(OFST+0,sp)
5351  0957 5f            	clrw	x
5352  0958 97            	ld	xl,a
5353  0959 d60040        	ld	a,(_iLF_DEF,x)
5354  095c 5f            	clrw	x
5355  095d 97            	ld	xl,a
5356  095e 7b01          	ld	a,(OFST+0,sp)
5357  0960 905f          	clrw	y
5358  0962 9097          	ld	yl,a
5359  0964 d6540c        	ld	a,(21516,x)
5360  0967 90da0000      	or	a,(_bLF_DEF,y)
5361  096b               L1302:
5362  096b d7540c        	ld	(21516,x),a
5363                     ; 585 }
5366  096e 5b03          	addw	sp,#3
5367  0970 81            	ret	
5370                     	switch	.data
5371  0000               ___i:
5372  0000 00            	dc.b	0
5412                     ; 599 void	lcd_disp(uint8_t id, uint8_t enable)
5412                     ; 600 {
5413                     	switch	.text
5414  0971               _lcd_disp:
5416  0971 89            	pushw	x
5417       00000000      OFST:	set	0
5420                     ; 603 	LCD_CE;
5422  0972 72165402      	bset	21506,#3
5423                     ; 604 	if( enable == 1 )
5425  0976 9f            	ld	a,xl
5426  0977 4a            	dec	a
5427  0978 2626          	jrne	L1502
5428                     ; 606 		lcd_clear(0);
5430  097a cd070a        	call	_lcd_clear
5432                     ; 607 		__i = (__i+1) % 10;
5434  097d c60000        	ld	a,___i
5435  0980 5f            	clrw	x
5436  0981 97            	ld	xl,a
5437  0982 5c            	incw	x
5438  0983 a60a          	ld	a,#10
5439  0985 cd0000        	call	c_smodx
5441  0988 01            	rrwa	x,a
5442  0989 c70000        	ld	___i,a
5443                     ; 608 		lcd_disp_n(0, __i);
5445  098c 97            	ld	xl,a
5446  098d 4f            	clr	a
5447  098e ad1b          	call	LC006
5448  0990 a601          	ld	a,#1
5449  0992 ad17          	call	LC006
5450  0994 a602          	ld	a,#2
5451  0996 ad13          	call	LC006
5452  0998 a603          	ld	a,#3
5453  099a 95            	ld	xh,a
5454  099b cd0744        	call	_lcd_disp_n
5456                     ; 611 		lcd_disp_n(3, __i);
5457  099e 2009          	jra	L3502
5458  09a0               L1502:
5459                     ; 615 		LCD->RAM[LCD_RAMRegister_1] &= (uint8_t)(~id);
5461  09a0 7b01          	ld	a,(OFST+1,sp)
5462  09a2 43            	cpl	a
5463  09a3 c4540d        	and	a,21517
5464  09a6 c7540d        	ld	21517,a
5465  09a9               L3502:
5466                     ; 617 }
5469  09a9 85            	popw	x
5470  09aa 81            	ret	
5471  09ab               LC006:
5472  09ab 95            	ld	xh,a
5473  09ac cd0744        	call	_lcd_disp_n
5475                     ; 609 		lcd_disp_n(1, __i);
5477  09af c60000        	ld	a,___i
5478  09b2 97            	ld	xl,a
5479  09b3 81            	ret	
5511                     ; 619 void	lcd_init(void)
5511                     ; 620 {
5512                     	switch	.text
5513  09b4               _lcd_init:
5515  09b4 88            	push	a
5516       00000001      OFST:	set	1
5519                     ; 622 	LCD_CE;
5521  09b5 72165402      	bset	21506,#3
5522                     ; 623 	for( i=0; i<15; i++ )
5524  09b9 4f            	clr	a
5525  09ba 6b01          	ld	(OFST+0,sp),a
5526  09bc               L1702:
5527                     ; 624 		LCD->RAM[i] = 0xff;
5529  09bc 5f            	clrw	x
5530  09bd 97            	ld	xl,a
5531  09be a6ff          	ld	a,#255
5532  09c0 d7540c        	ld	(21516,x),a
5533                     ; 623 	for( i=0; i<15; i++ )
5535  09c3 0c01          	inc	(OFST+0,sp)
5538  09c5 7b01          	ld	a,(OFST+0,sp)
5539  09c7 a10f          	cp	a,#15
5540  09c9 25f1          	jrult	L1702
5541                     ; 625 }
5544  09cb 84            	pop	a
5545  09cc 81            	ret	
5577                     ; 629 void	lcd_cntl(uint8_t cmd, uint8_t param)
5577                     ; 630 {
5578                     	switch	.text
5579  09cd               _lcd_cntl:
5583                     ; 649 }
5586  09cd 81            	ret	
5609                     ; 651 void	systemLcdClear(void)
5609                     ; 652 {
5610                     	switch	.text
5611  09ce               _systemLcdClear:
5615                     ; 653 	LCD->CR1 = LCD_CR1_RESET_VALUE;
5617  09ce 725f5400      	clr	21504
5618                     ; 654 	LCD->CR2 = LCD_CR2_RESET_VALUE;
5620  09d2 725f5401      	clr	21505
5621                     ; 655 	LCD->CR3 = LCD_CR3_RESET_VALUE;
5623  09d6 725f5402      	clr	21506
5624                     ; 656 	LCD->FRQ = LCD_FRQ_RESET_VALUE;
5626  09da 725f5403      	clr	21507
5627                     ; 658 	LCD->CR4 = LCD_CR4_RESET_VALUE;
5629  09de 725f542f      	clr	21551
5630                     ; 659 }
5633  09e2 81            	ret	
5666                     ; 696 void	systemLcd(void)
5666                     ; 697 {
5667                     	switch	.text
5668  09e3               _systemLcd:
5672                     ; 698 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
5674  09e3 ae1301        	ldw	x,#4865
5675  09e6 cd0000        	call	_CLK_PeripheralClockConfig
5677                     ; 699 	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
5679  09e9 ae0400        	ldw	x,#1024
5680  09ec cd0000        	call	_CLK_RTCClockConfig
5682                     ; 700 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
5684  09ef ae1201        	ldw	x,#4609
5685  09f2 cd0000        	call	_CLK_PeripheralClockConfig
5687                     ; 702 	systemLcdClear();
5689  09f5 add7          	call	_systemLcdClear
5691                     ; 704 	LCD_Init(
5691                     ; 705 		LCD_Prescaler_2, 
5691                     ; 706 		LCD_Divider_18, 
5691                     ; 707 		LCD_Duty_1_4,
5691                     ; 708 		LCD_Bias_1_3, 
5691                     ; 709 #if defined (_RC_DR_) || defined (_RC_DW_)
5691                     ; 710 		LCD_VoltageSource_External
5691                     ; 711 #else
5691                     ; 712 		LCD_VoltageSource_Internal
5691                     ; 713 #endif
5691                     ; 714 		);
5693  09f7 4b00          	push	#0
5694  09f9 4b00          	push	#0
5695  09fb 4b06          	push	#6
5696  09fd ae1002        	ldw	x,#4098
5697  0a00 cd0000        	call	_LCD_Init
5699  0a03 5b03          	addw	sp,#3
5700                     ; 727 	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
5702  0a05 ae00ff        	ldw	x,#255
5703  0a08 cd0000        	call	_LCD_PortMaskConfig
5705                     ; 728 	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFE);	//	s8 Skip
5707  0a0b ae01fe        	ldw	x,#510
5708  0a0e cd0000        	call	_LCD_PortMaskConfig
5710                     ; 729 	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x01);	//	
5712  0a11 ae0201        	ldw	x,#513
5713  0a14 cd0000        	call	_LCD_PortMaskConfig
5715                     ; 730 	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);
5717  0a17 ae0300        	ldw	x,#768
5718  0a1a cd0000        	call	_LCD_PortMaskConfig
5720                     ; 739 	LCD_ContrastConfig(LCD_Contrast_Level_7);
5722  0a1d a60e          	ld	a,#14
5723  0a1f cd0000        	call	_LCD_ContrastConfig
5725                     ; 740 	LCD_DeadTimeConfig(LCD_DeadTime_0);
5727  0a22 4f            	clr	a
5728  0a23 cd0000        	call	_LCD_DeadTimeConfig
5730                     ; 741 	LCD_PulseOnDurationConfig(LCD_PulseOnDuration_1);
5732  0a26 a620          	ld	a,#32
5733  0a28 cd0000        	call	_LCD_PulseOnDurationConfig
5735                     ; 746 	lcd_init();
5737  0a2b ad87          	call	_lcd_init
5739                     ; 748 	LCD_Cmd(ENABLE); 
5741  0a2d a601          	ld	a,#1
5743                     ; 749 }
5746  0a2f cc0000        	jp	_LCD_Cmd
5749                     	switch	.data
5750  0001               __blink_timer:
5751  0001 05            	dc.b	5
5752  0002               __blinkFlag:
5753  0002 00            	dc.b	0
5754  0003               __blinkId:
5755  0003 ff            	dc.b	255
5756  0004               __blink:
5757  0004 00            	dc.b	0
5758  0005               __blinkFlag2:
5759  0005 00            	dc.b	0
5760  0006               __blinkId2:
5761  0006 ff            	dc.b	255
5762  0007               __blinkId2b:
5763  0007 ff            	dc.b	255
5764  0008               __blink2:
5765  0008 00            	dc.b	0
5766  0009               __blinkNpos:
5767  0009 00            	dc.b	0
5768  000a               __blinkFlag3:
5769  000a 00            	dc.b	0
5770  000b               __blinkId3:
5771  000b ff            	dc.b	255
5772  000c               __blink3:
5773  000c 00            	dc.b	0
5796                     ; 766 void	lcd_blink_npos_clear(void)
5796                     ; 767 {
5797                     	switch	.text
5798  0a32               _lcd_blink_npos_clear:
5802                     ; 768 	_blinkNpos = 0;
5804  0a32 725f0009      	clr	__blinkNpos
5805                     ; 769 }
5808  0a36 81            	ret	
5841                     ; 771 void	lcd_blink_npos(uint8_t i)
5841                     ; 772 {
5842                     	switch	.text
5843  0a37               _lcd_blink_npos:
5847                     ; 773 	_blinkNpos = i + 1;
5849  0a37 4c            	inc	a
5850  0a38 c70009        	ld	__blinkNpos,a
5851                     ; 774 }
5854  0a3b 81            	ret	
5880                     ; 776 void	lcd_blink_clear(void)
5880                     ; 777 {
5881                     	switch	.text
5882  0a3c               _lcd_blink_clear:
5886                     ; 778 	_blinkId = 0;
5888  0a3c 725f0003      	clr	__blinkId
5889                     ; 779 	_blinkId2 = 0;
5891  0a40 725f0006      	clr	__blinkId2
5892                     ; 780 	_blinkId2b = 0;
5894  0a44 725f0007      	clr	__blinkId2b
5895                     ; 781 }
5898  0a48 81            	ret	
5932                     ; 783 void	lcd_blink_item(uint8_t i)
5932                     ; 784 {
5933                     	switch	.text
5934  0a49               _lcd_blink_item:
5938                     ; 785 	_blinkId = i;
5940  0a49 c70003        	ld	__blinkId,a
5941                     ; 786 	_blink = 0;
5943  0a4c 725f0004      	clr	__blink
5944                     ; 787 }
5947  0a50 81            	ret	
5973                     ; 789 void	lcd_blink_clearRoom(void)
5973                     ; 790 {
5974                     	switch	.text
5975  0a51               _lcd_blink_clearRoom:
5979                     ; 791 	_blinkId2 = 0;
5981  0a51 725f0006      	clr	__blinkId2
5982                     ; 792 	_blinkId2b = 0;
5984  0a55 725f0007      	clr	__blinkId2b
5985                     ; 793 }
5988  0a59 81            	ret	
6031                     ; 795 void	lcd_blink_itemRoom(uint8_t i, uint8_t imode)
6031                     ; 796 {
6032                     	switch	.text
6033  0a5a               _lcd_blink_itemRoom:
6035  0a5a 89            	pushw	x
6036       00000000      OFST:	set	0
6039                     ; 797 	_blinkId2 = _rid[i*2];
6041  0a5b 9e            	ld	a,xh
6042  0a5c 5f            	clrw	x
6043  0a5d 97            	ld	xl,a
6044  0a5e 58            	sllw	x
6045  0a5f d601e1        	ld	a,(__rid,x)
6046  0a62 c70006        	ld	__blinkId2,a
6047                     ; 798 	if( imode != 0 )
6049  0a65 7b02          	ld	a,(OFST+2,sp)
6050  0a67 270b          	jreq	L1322
6051                     ; 799 		_blinkId2b = _rid[i*2+1];
6053  0a69 7b01          	ld	a,(OFST+1,sp)
6054  0a6b 5f            	clrw	x
6055  0a6c 97            	ld	xl,a
6056  0a6d 58            	sllw	x
6057  0a6e d601e2        	ld	a,(__rid+1,x)
6058  0a71 c70007        	ld	__blinkId2b,a
6059  0a74               L1322:
6060                     ; 800 	_blink2 = 0;
6062  0a74 725f0008      	clr	__blink2
6063                     ; 801 }
6066  0a78 85            	popw	x
6067  0a79 81            	ret	
6124                     ; 803 void	lcd_blinkCb(void)
6124                     ; 804 {
6125                     	switch	.text
6126  0a7a               _lcd_blinkCb:
6128  0a7a 5204          	subw	sp,#4
6129       00000004      OFST:	set	4
6132                     ; 807 	if( _blink_timer == 0 )
6134  0a7c c60001        	ld	a,__blink_timer
6135  0a7f 2603cc0bdf    	jreq	L3332
6136                     ; 808 		return;
6138                     ; 810 	if( (__timer100ms%_blink_timer) == 0 )
6140  0a84 c60000        	ld	a,___timer100ms
6141  0a87 5f            	clrw	x
6142  0a88 97            	ld	xl,a
6143  0a89 c60001        	ld	a,__blink_timer
6144  0a8c 905f          	clrw	y
6145  0a8e 9097          	ld	yl,a
6146  0a90 cd0000        	call	c_idiv
6148  0a93 905d          	tnzw	y
6149  0a95 2703cc0bd3    	jrne	L5522
6150                     ; 812 		if( _blinkFlag == 0 )
6152  0a9a c60002        	ld	a,__blinkFlag
6153  0a9d 262b          	jrne	L7522
6154                     ; 814 			_blinkFlag = 1;
6156  0a9f 35010002      	mov	__blinkFlag,#1
6157                     ; 815 			if( _blinkId != 0 )
6159  0aa3 c60003        	ld	a,__blinkId
6160  0aa6 2722          	jreq	L7522
6161                     ; 817 				if( _blink != 0 )
6163  0aa8 725d0004      	tnz	__blink
6164  0aac 270f          	jreq	L3622
6165                     ; 819 					LCD_BIT_CLEAR(_blinkId);
6167  0aae cd0be2        	call	LC007
6168  0ab1 c60003        	ld	a,__blinkId
6169  0ab4 cd0bea        	call	LC008
6170                     ; 820 					_blink = 0;
6172  0ab7 725f0004      	clr	__blink
6174  0abb 200d          	jra	L7522
6175  0abd               L3622:
6176                     ; 824 					LCD_BIT_SET(_blinkId);
6178  0abd cd0be2        	call	LC007
6179  0ac0 c60003        	ld	a,__blinkId
6180  0ac3 cd0bfa        	call	LC009
6181                     ; 825 					_blink = 1;
6183  0ac6 35010004      	mov	__blink,#1
6184  0aca               L7522:
6185                     ; 829 		if( _blinkFlag2 == 0 )
6187  0aca c60005        	ld	a,__blinkFlag2
6188  0acd 264c          	jrne	L7622
6189                     ; 831 			_blinkFlag2 = 1;
6191  0acf 35010005      	mov	__blinkFlag2,#1
6192                     ; 832 			if( _blinkId2 != 0 )
6194  0ad3 c60006        	ld	a,__blinkId2
6195  0ad6 2743          	jreq	L7622
6196                     ; 834 				if( _blink2 != 0 )
6198  0ad8 c60008        	ld	a,__blink2
6199  0adb 2720          	jreq	L3722
6200                     ; 836 					if( _blinkId2b != 0 )
6202  0add c60007        	ld	a,__blinkId2b
6203  0ae0 2709          	jreq	L5722
6204                     ; 837 						LCD_BIT_CLEAR(_blinkId2b);
6206  0ae2 cd0be2        	call	LC007
6207  0ae5 c60007        	ld	a,__blinkId2b
6208  0ae8 cd0bea        	call	LC008
6209  0aeb               L5722:
6210                     ; 838 					LCD_BIT_CLEAR(_blinkId2);
6212  0aeb c60006        	ld	a,__blinkId2
6213  0aee cd0be2        	call	LC007
6214  0af1 c60006        	ld	a,__blinkId2
6215  0af4 cd0bea        	call	LC008
6216                     ; 839 					_blink2 = 0;
6218  0af7 725f0008      	clr	__blink2
6220  0afb 201e          	jra	L7622
6221  0afd               L3722:
6222                     ; 843 					if( _blinkId2b != 0 )
6224  0afd c60007        	ld	a,__blinkId2b
6225  0b00 2709          	jreq	L1032
6226                     ; 844 						LCD_BIT_SET(_blinkId2b);
6228  0b02 cd0be2        	call	LC007
6229  0b05 c60007        	ld	a,__blinkId2b
6230  0b08 cd0bfa        	call	LC009
6231  0b0b               L1032:
6232                     ; 845 					LCD_BIT_SET(_blinkId2);
6234  0b0b c60006        	ld	a,__blinkId2
6235  0b0e cd0be2        	call	LC007
6236  0b11 c60006        	ld	a,__blinkId2
6237  0b14 cd0bfa        	call	LC009
6238                     ; 846 					_blink2 = 1;
6240  0b17 35010008      	mov	__blink2,#1
6241  0b1b               L7622:
6242                     ; 850 		if( _blinkFlag3 == 0 )
6244  0b1b c6000a        	ld	a,__blinkFlag3
6245  0b1e 2703cc0bdf    	jrne	L3332
6246                     ; 852 			_blinkFlag3 = 1;
6248  0b23 3501000a      	mov	__blinkFlag3,#1
6249                     ; 853 			if( _blinkNpos != 0 )
6251  0b27 725d0009      	tnz	__blinkNpos
6252  0b2b 27f3          	jreq	L3332
6253                     ; 855 				p = lcd_get_npos(0);
6255  0b2d cd071e        	call	_lcd_get_npos
6257  0b30 1f02          	ldw	(OFST-2,sp),x
6258                     ; 856 				p = p+(_blinkNpos-1)*7;
6260  0b32 c60009        	ld	a,__blinkNpos
6261  0b35 97            	ld	xl,a
6262  0b36 a607          	ld	a,#7
6263  0b38 42            	mul	x,a
6264  0b39 1d0007        	subw	x,#7
6265  0b3c 72fb02        	addw	x,(OFST-2,sp)
6266  0b3f 1f02          	ldw	(OFST-2,sp),x
6267                     ; 857 				if( _blinkId3 != 0 )
6269  0b41 c6000b        	ld	a,__blinkId3
6270  0b44 2746          	jreq	L7032
6271                     ; 859 					for( i=0; i<7; i++ )
6273  0b46 0f04          	clr	(OFST+0,sp)
6274  0b48               L1132:
6275                     ; 861 						if( p[i] != 0 )
6277  0b48 7b02          	ld	a,(OFST-2,sp)
6278  0b4a 97            	ld	xl,a
6279  0b4b 7b03          	ld	a,(OFST-1,sp)
6280  0b4d 1b04          	add	a,(OFST+0,sp)
6281  0b4f 2401          	jrnc	L643
6282  0b51 5c            	incw	x
6283  0b52               L643:
6284  0b52 02            	rlwa	x,a
6285  0b53 f6            	ld	a,(x)
6286  0b54 2728          	jreq	L7132
6287                     ; 862 							LCD_BIT_CLEAR(p[i]);
6289  0b56 7b02          	ld	a,(OFST-2,sp)
6290  0b58 97            	ld	xl,a
6291  0b59 7b03          	ld	a,(OFST-1,sp)
6292  0b5b 1b04          	add	a,(OFST+0,sp)
6293  0b5d 2401          	jrnc	L053
6294  0b5f 5c            	incw	x
6295  0b60               L053:
6296  0b60 02            	rlwa	x,a
6297  0b61 f6            	ld	a,(x)
6298  0b62 ad7e          	call	LC007
6299  0b64 89            	pushw	x
6300  0b65 7b04          	ld	a,(OFST+0,sp)
6301  0b67 97            	ld	xl,a
6302  0b68 7b05          	ld	a,(OFST+1,sp)
6303  0b6a 1b06          	add	a,(OFST+2,sp)
6304  0b6c 2401          	jrnc	L253
6305  0b6e 5c            	incw	x
6306  0b6f               L253:
6307  0b6f 02            	rlwa	x,a
6308  0b70 f6            	ld	a,(x)
6309  0b71 5f            	clrw	x
6310  0b72 97            	ld	xl,a
6311  0b73 d60000        	ld	a,(_bLF_DEF,x)
6312  0b76 43            	cpl	a
6313  0b77 85            	popw	x
6314  0b78 d4540c        	and	a,(21516,x)
6315  0b7b d7540c        	ld	(21516,x),a
6316  0b7e               L7132:
6317                     ; 859 					for( i=0; i<7; i++ )
6319  0b7e 0c04          	inc	(OFST+0,sp)
6322  0b80 7b04          	ld	a,(OFST+0,sp)
6323  0b82 a107          	cp	a,#7
6324  0b84 25c2          	jrult	L1132
6325                     ; 864 					_blinkId3 = 0;
6327  0b86 725f000b      	clr	__blinkId3
6329  0b8a 2053          	jra	L3332
6330  0b8c               L7032:
6331                     ; 868 					for( i=0; i<7; i++ )
6333  0b8c 6b04          	ld	(OFST+0,sp),a
6334  0b8e               L3232:
6335                     ; 870 						if( p[i] != 0 )
6337  0b8e 7b02          	ld	a,(OFST-2,sp)
6338  0b90 97            	ld	xl,a
6339  0b91 7b03          	ld	a,(OFST-1,sp)
6340  0b93 1b04          	add	a,(OFST+0,sp)
6341  0b95 2401          	jrnc	L453
6342  0b97 5c            	incw	x
6343  0b98               L453:
6344  0b98 02            	rlwa	x,a
6345  0b99 f6            	ld	a,(x)
6346  0b9a 2729          	jreq	L1332
6347                     ; 871 							LCD_BIT_SET(p[i]);
6349  0b9c 7b02          	ld	a,(OFST-2,sp)
6350  0b9e 97            	ld	xl,a
6351  0b9f 7b03          	ld	a,(OFST-1,sp)
6352  0ba1 1b04          	add	a,(OFST+0,sp)
6353  0ba3 2401          	jrnc	L653
6354  0ba5 5c            	incw	x
6355  0ba6               L653:
6356  0ba6 02            	rlwa	x,a
6357  0ba7 f6            	ld	a,(x)
6358  0ba8 5f            	clrw	x
6359  0ba9 97            	ld	xl,a
6360  0baa d60000        	ld	a,(_bLF_DEF,x)
6361  0bad 6b01          	ld	(OFST-3,sp),a
6362  0baf 7b02          	ld	a,(OFST-2,sp)
6363  0bb1 97            	ld	xl,a
6364  0bb2 7b03          	ld	a,(OFST-1,sp)
6365  0bb4 1b04          	add	a,(OFST+0,sp)
6366  0bb6 2401          	jrnc	L063
6367  0bb8 5c            	incw	x
6368  0bb9               L063:
6369  0bb9 02            	rlwa	x,a
6370  0bba f6            	ld	a,(x)
6371  0bbb ad25          	call	LC007
6372  0bbd d6540c        	ld	a,(21516,x)
6373  0bc0 1a01          	or	a,(OFST-3,sp)
6374  0bc2 d7540c        	ld	(21516,x),a
6375  0bc5               L1332:
6376                     ; 868 					for( i=0; i<7; i++ )
6378  0bc5 0c04          	inc	(OFST+0,sp)
6381  0bc7 7b04          	ld	a,(OFST+0,sp)
6382  0bc9 a107          	cp	a,#7
6383  0bcb 25c1          	jrult	L3232
6384                     ; 873 					_blinkId3 = 1;
6386  0bcd 3501000b      	mov	__blinkId3,#1
6387  0bd1 200c          	jra	L3332
6388  0bd3               L5522:
6389                     ; 880 		_blinkFlag = 0;
6391  0bd3 725f0002      	clr	__blinkFlag
6392                     ; 881 		_blinkFlag2 = 0;
6394  0bd7 725f0005      	clr	__blinkFlag2
6395                     ; 882 		_blinkFlag3 = 0;
6397  0bdb 725f000a      	clr	__blinkFlag3
6398  0bdf               L3332:
6399                     ; 884 }
6402  0bdf 5b04          	addw	sp,#4
6403  0be1 81            	ret	
6404  0be2               LC007:
6405  0be2 5f            	clrw	x
6406  0be3 97            	ld	xl,a
6407  0be4 d60040        	ld	a,(_iLF_DEF,x)
6408  0be7 5f            	clrw	x
6409  0be8 97            	ld	xl,a
6410  0be9 81            	ret	
6411  0bea               LC008:
6412  0bea 905f          	clrw	y
6413  0bec 9097          	ld	yl,a
6414  0bee 90d60000      	ld	a,(_bLF_DEF,y)
6415  0bf2 43            	cpl	a
6416  0bf3 d4540c        	and	a,(21516,x)
6417  0bf6 d7540c        	ld	(21516,x),a
6418  0bf9 81            	ret	
6419  0bfa               LC009:
6420  0bfa 905f          	clrw	y
6421  0bfc 9097          	ld	yl,a
6422  0bfe d6540c        	ld	a,(21516,x)
6423  0c01 90da0000      	or	a,(_bLF_DEF,y)
6424  0c05 d7540c        	ld	(21516,x),a
6425  0c08 81            	ret	
6931                     	xdef	__blink3
6932                     	xdef	__blinkId3
6933                     	xdef	__blinkFlag3
6934                     	xdef	__blinkNpos
6935                     	xdef	__blink2
6936                     	xdef	__blinkId2b
6937                     	xdef	__blinkId2
6938                     	xdef	__blinkFlag2
6939                     	xdef	__blink
6940                     	xdef	__blinkId
6941                     	xdef	__blinkFlag
6942                     	xdef	__blink_timer
6943                     	xdef	_systemLcdClear
6944                     	xdef	_lcd_init
6945                     	xdef	___i
6946                     	xdef	_lcd_disp_cmd
6947                     	xref	_error_type
6948                     	xdef	_lcd_get_npos
6949                     	xdef	_lcd_disp_all
6950                     	xdef	_lcd_clear_cnt
6951                     	xdef	_lcd_clear_m
6952                     	xdef	_lcd_clear_info
6953                     	xdef	__plc
6954                     	xdef	__cnt_sub
6955                     	xdef	__cnt_host
6956                     	xdef	__lpm
6957                     	xdef	__temp_offset
6958                     	xdef	__po_type_pb
6959                     	xdef	__po_type_xl
6960                     	xdef	__po_type
6961                     	xdef	__len
6962                     	xdef	__freset
6963                     	xdef	__mir2
6964                     	xdef	__mir1
6965                     	xdef	__cntl_tab
6966                     	xdef	__cntl_2motor
6967                     	xdef	__cntl_op
6968                     	xdef	__link
6969                     	xdef	__hc
6970                     	xdef	__run
6971                     	xdef	__hcEach
6972                     	xdef	__hcLocal
6973                     	xdef	__cntl_po
6974                     	xdef	__cntl_on
6975                     	xdef	__cc
6976                     	xdef	__btn
6977                     	xdef	__bL
6978                     	xdef	__info
6979                     	xdef	__nid
6980                     	xdef	__n
6981                     	xdef	__nvalve
6982                     	xdef	__ncnt
6983                     	xdef	__nm
6984                     	xdef	__nerrBr
6985                     	xdef	__nerr
6986                     	xdef	__nd
6987                     	xdef	__nc
6988                     	xdef	__nb
6989                     	xdef	__na
6990                     	xdef	_lcd_blink_npos
6991                     	xdef	_lcd_blink_npos_clear
6992                     	xdef	_lcd_disp_info
6993                     	xdef	_lcd_disp_info_fire
6994                     	xdef	_lcd_disp_info_shower
6995                     	xdef	_lcd_clear_rid_n
6996                     	xdef	_lcd_blinkCb
6997                     	xdef	_lcd_blink_itemRoom
6998                     	xdef	_lcd_blink_item
6999                     	xdef	_lcd_blink_clearRoom
7000                     	xdef	_lcd_blink_clear
7001                     	xdef	_lcd_clear_npos
7002                     	xdef	_lcd_disp_rid
7003                     	xdef	_lcd_disp_err
7004                     	xdef	_lcd_disp_n
7005                     	xdef	_lcd_clear
7006                     	xdef	_lcd_disp_setup_mode_each
7007                     	xdef	_lcd_disp_setup_mode_local
7008                     	xdef	_lcd_disp_setup_valve
7009                     	xdef	_lcd_disp_setup_cnt
7010                     	xdef	_lcd_disp_setup_m
7011                     	xdef	_lcd_disp_setup_id
7012                     	xdef	_lcd_disp_setup_mode
7013                     	xdef	_lcd_disp_setup_run
7014                     	xdef	_lcd_disp_setup_c
7015                     	xdef	_lcd_disp_setup_link
7016                     	xdef	_lcd_disp_plc
7017                     	xdef	_lcd_disp_cnt_sub
7018                     	xdef	_lcd_disp_cnt_host
7019                     	xdef	_lcd_disp_freset
7020                     	xdef	_lcd_disp_mir2
7021                     	xdef	_lcd_disp_mir1
7022                     	xdef	_lcd_disp_setup_cntl_tab
7023                     	xdef	_lcd_disp_setup_cntl_2motor
7024                     	xdef	_lcd_disp_setup_cntl_po
7025                     	xdef	_lcd_disp_setup_cntl_on
7026                     	xdef	_lcd_disp_setup_cntl_op
7027                     	xdef	_lcd_disp_setup_len
7028                     	xdef	_lcd_disp_setup_po_type_pb
7029                     	xdef	_lcd_disp_setup_po_type_xl
7030                     	xdef	_lcd_disp_setup_po_type
7031                     	xdef	_lcd_disp_setup_temp_offset
7032                     	xdef	_lcd_disp_setup_lpm
7033                     	xdef	_lcd_disp_backlight
7034                     	xdef	_lcd_clear_rid
7035                     	xdef	_lcd_clear_run
7036                     	xdef	_lcd_clear_mode
7037                     	xdef	_lcd_clear_n
7038                     	xdef	_lcd_clear_c
7039                     	xdef	_lcd_clear_btn
7040                     	xdef	_lcd_clear_backlight
7041                     	xdef	__rid
7042                     	xdef	_iLF_DEF
7043                     	xdef	_bLF_DEF
7044                     	xref	_uiInfo
7045                     	xref	___timer100ms
7046                     	xdef	_lcd_cntl
7047                     	xdef	_lcd_disp
7048                     	xdef	_lcd_blink
7049                     	xdef	_systemLcd
7050                     	xref	_LCD_ContrastConfig
7051                     	xref	_LCD_DeadTimeConfig
7052                     	xref	_LCD_PulseOnDurationConfig
7053                     	xref	_LCD_Cmd
7054                     	xref	_LCD_PortMaskConfig
7055                     	xref	_LCD_Init
7056                     	xref	_CLK_PeripheralClockConfig
7057                     	xref	_CLK_RTCClockConfig
7058                     	xref.b	c_x
7077                     	xref	c_idiv
7078                     	xref	c_smodx
7079                     	end
