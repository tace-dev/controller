   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  56                     ; 8 void	lcd_blink(uint8_t mode)
  56                     ; 9 {
  58                     .text:	section	.text,new
  59  0000               _lcd_blink:
  63                     ; 30 }
  66  0000 81            	ret
  69                     .const:	section	.text
  70  0000               _bLF_DEF:
  71  0000 01            	dc.b	1
  72  0001 02            	dc.b	2
  73  0002 04            	dc.b	4
  74  0003 08            	dc.b	8
  75  0004 10            	dc.b	16
  76  0005 20            	dc.b	32
  77  0006 40            	dc.b	64
  78  0007 80            	dc.b	128
  79  0008 02            	dc.b	2
  80  0009 04            	dc.b	4
  81  000a 08            	dc.b	8
  82  000b 10            	dc.b	16
  83  000c 20            	dc.b	32
  84  000d 40            	dc.b	64
  85  000e 80            	dc.b	128
  86  000f 01            	dc.b	1
  87  0010 10            	dc.b	16
  88  0011 20            	dc.b	32
  89  0012 40            	dc.b	64
  90  0013 80            	dc.b	128
  91  0014 01            	dc.b	1
  92  0015 02            	dc.b	2
  93  0016 04            	dc.b	4
  94  0017 08            	dc.b	8
  95  0018 20            	dc.b	32
  96  0019 40            	dc.b	64
  97  001a 80            	dc.b	128
  98  001b 01            	dc.b	1
  99  001c 02            	dc.b	2
 100  001d 04            	dc.b	4
 101  001e 08            	dc.b	8
 102  001f 10            	dc.b	16
 103  0020 01            	dc.b	1
 104  0021 02            	dc.b	2
 105  0022 04            	dc.b	4
 106  0023 08            	dc.b	8
 107  0024 10            	dc.b	16
 108  0025 20            	dc.b	32
 109  0026 40            	dc.b	64
 110  0027 80            	dc.b	128
 111  0028 02            	dc.b	2
 112  0029 04            	dc.b	4
 113  002a 08            	dc.b	8
 114  002b 10            	dc.b	16
 115  002c 20            	dc.b	32
 116  002d 40            	dc.b	64
 117  002e 80            	dc.b	128
 118  002f 01            	dc.b	1
 119  0030 10            	dc.b	16
 120  0031 20            	dc.b	32
 121  0032 40            	dc.b	64
 122  0033 80            	dc.b	128
 123  0034 01            	dc.b	1
 124  0035 02            	dc.b	2
 125  0036 04            	dc.b	4
 126  0037 08            	dc.b	8
 127  0038 20            	dc.b	32
 128  0039 40            	dc.b	64
 129  003a 80            	dc.b	128
 130  003b 01            	dc.b	1
 131  003c 02            	dc.b	2
 132  003d 04            	dc.b	4
 133  003e 08            	dc.b	8
 134  003f 10            	dc.b	16
 135  0040               _iLF_DEF:
 136  0040 00            	dc.b	0
 137  0041 00            	dc.b	0
 138  0042 00            	dc.b	0
 139  0043 00            	dc.b	0
 140  0044 00            	dc.b	0
 141  0045 00            	dc.b	0
 142  0046 00            	dc.b	0
 143  0047 00            	dc.b	0
 144  0048 01            	dc.b	1
 145  0049 01            	dc.b	1
 146  004a 01            	dc.b	1
 147  004b 01            	dc.b	1
 148  004c 01            	dc.b	1
 149  004d 01            	dc.b	1
 150  004e 01            	dc.b	1
 151  004f 02            	dc.b	2
 152  0050 03            	dc.b	3
 153  0051 03            	dc.b	3
 154  0052 03            	dc.b	3
 155  0053 03            	dc.b	3
 156  0054 04            	dc.b	4
 157  0055 04            	dc.b	4
 158  0056 04            	dc.b	4
 159  0057 04            	dc.b	4
 160  0058 04            	dc.b	4
 161  0059 04            	dc.b	4
 162  005a 04            	dc.b	4
 163  005b 05            	dc.b	5
 164  005c 05            	dc.b	5
 165  005d 05            	dc.b	5
 166  005e 05            	dc.b	5
 167  005f 05            	dc.b	5
 168  0060 07            	dc.b	7
 169  0061 07            	dc.b	7
 170  0062 07            	dc.b	7
 171  0063 07            	dc.b	7
 172  0064 07            	dc.b	7
 173  0065 07            	dc.b	7
 174  0066 07            	dc.b	7
 175  0067 07            	dc.b	7
 176  0068 08            	dc.b	8
 177  0069 08            	dc.b	8
 178  006a 08            	dc.b	8
 179  006b 08            	dc.b	8
 180  006c 08            	dc.b	8
 181  006d 08            	dc.b	8
 182  006e 08            	dc.b	8
 183  006f 09            	dc.b	9
 184  0070 0a            	dc.b	10
 185  0071 0a            	dc.b	10
 186  0072 0a            	dc.b	10
 187  0073 0a            	dc.b	10
 188  0074 0b            	dc.b	11
 189  0075 0b            	dc.b	11
 190  0076 0b            	dc.b	11
 191  0077 0b            	dc.b	11
 192  0078 0b            	dc.b	11
 193  0079 0b            	dc.b	11
 194  007a 0b            	dc.b	11
 195  007b 0c            	dc.b	12
 196  007c 0c            	dc.b	12
 197  007d 0c            	dc.b	12
 198  007e 0c            	dc.b	12
 199  007f 0c            	dc.b	12
 200  0080               __na:
 201  0080 02            	dc.b	2
 202  0081 13            	dc.b	19
 203  0082 33            	dc.b	51
 204  0083 32            	dc.b	50
 205  0084 22            	dc.b	34
 206  0085 12            	dc.b	18
 207  0086 00            	dc.b	0
 208  0087 13            	dc.b	19
 209  0088 33            	dc.b	51
 210  0089 00            	dc.b	0
 211  008a 00            	dc.b	0
 212  008b 00            	dc.b	0
 213  008c 00            	dc.b	0
 214  008d 00            	dc.b	0
 215  008e 02            	dc.b	2
 216  008f 13            	dc.b	19
 217  0090 23            	dc.b	35
 218  0091 22            	dc.b	34
 219  0092 32            	dc.b	50
 220  0093 00            	dc.b	0
 221  0094 00            	dc.b	0
 222  0095 02            	dc.b	2
 223  0096 13            	dc.b	19
 224  0097 23            	dc.b	35
 225  0098 33            	dc.b	51
 226  0099 32            	dc.b	50
 227  009a 00            	dc.b	0
 228  009b 00            	dc.b	0
 229  009c 12            	dc.b	18
 230  009d 23            	dc.b	35
 231  009e 13            	dc.b	19
 232  009f 33            	dc.b	51
 233  00a0 00            	dc.b	0
 234  00a1 00            	dc.b	0
 235  00a2 00            	dc.b	0
 236  00a3 02            	dc.b	2
 237  00a4 12            	dc.b	18
 238  00a5 23            	dc.b	35
 239  00a6 33            	dc.b	51
 240  00a7 32            	dc.b	50
 241  00a8 00            	dc.b	0
 242  00a9 00            	dc.b	0
 243  00aa 12            	dc.b	18
 244  00ab 23            	dc.b	35
 245  00ac 22            	dc.b	34
 246  00ad 32            	dc.b	50
 247  00ae 33            	dc.b	51
 248  00af 02            	dc.b	2
 249  00b0 00            	dc.b	0
 250  00b1 02            	dc.b	2
 251  00b2 13            	dc.b	19
 252  00b3 33            	dc.b	51
 253  00b4 00            	dc.b	0
 254  00b5 00            	dc.b	0
 255  00b6 00            	dc.b	0
 256  00b7 00            	dc.b	0
 257  00b8 02            	dc.b	2
 258  00b9 13            	dc.b	19
 259  00ba 33            	dc.b	51
 260  00bb 32            	dc.b	50
 261  00bc 22            	dc.b	34
 262  00bd 12            	dc.b	18
 263  00be 23            	dc.b	35
 264  00bf 02            	dc.b	2
 265  00c0 12            	dc.b	18
 266  00c1 23            	dc.b	35
 267  00c2 13            	dc.b	19
 268  00c3 33            	dc.b	51
 269  00c4 32            	dc.b	50
 270  00c5 00            	dc.b	0
 271  00c6               __nb:
 272  00c6 04            	dc.b	4
 273  00c7 15            	dc.b	21
 274  00c8 35            	dc.b	53
 275  00c9 34            	dc.b	52
 276  00ca 24            	dc.b	36
 277  00cb 14            	dc.b	20
 278  00cc 00            	dc.b	0
 279  00cd 15            	dc.b	21
 280  00ce 35            	dc.b	53
 281  00cf 00            	dc.b	0
 282  00d0 00            	dc.b	0
 283  00d1 00            	dc.b	0
 284  00d2 00            	dc.b	0
 285  00d3 00            	dc.b	0
 286  00d4 04            	dc.b	4
 287  00d5 15            	dc.b	21
 288  00d6 25            	dc.b	37
 289  00d7 24            	dc.b	36
 290  00d8 34            	dc.b	52
 291  00d9 00            	dc.b	0
 292  00da 00            	dc.b	0
 293  00db 04            	dc.b	4
 294  00dc 15            	dc.b	21
 295  00dd 25            	dc.b	37
 296  00de 35            	dc.b	53
 297  00df 34            	dc.b	52
 298  00e0 00            	dc.b	0
 299  00e1 00            	dc.b	0
 300  00e2 14            	dc.b	20
 301  00e3 25            	dc.b	37
 302  00e4 15            	dc.b	21
 303  00e5 35            	dc.b	53
 304  00e6 00            	dc.b	0
 305  00e7 00            	dc.b	0
 306  00e8 00            	dc.b	0
 307  00e9 04            	dc.b	4
 308  00ea 14            	dc.b	20
 309  00eb 25            	dc.b	37
 310  00ec 35            	dc.b	53
 311  00ed 34            	dc.b	52
 312  00ee 00            	dc.b	0
 313  00ef 00            	dc.b	0
 314  00f0 14            	dc.b	20
 315  00f1 25            	dc.b	37
 316  00f2 24            	dc.b	36
 317  00f3 34            	dc.b	52
 318  00f4 35            	dc.b	53
 319  00f5 04            	dc.b	4
 320  00f6 00            	dc.b	0
 321  00f7 04            	dc.b	4
 322  00f8 15            	dc.b	21
 323  00f9 35            	dc.b	53
 324  00fa 00            	dc.b	0
 325  00fb 00            	dc.b	0
 326  00fc 00            	dc.b	0
 327  00fd 00            	dc.b	0
 328  00fe 04            	dc.b	4
 329  00ff 15            	dc.b	21
 330  0100 35            	dc.b	53
 331  0101 34            	dc.b	52
 332  0102 24            	dc.b	36
 333  0103 14            	dc.b	20
 334  0104 25            	dc.b	37
 335  0105 04            	dc.b	4
 336  0106 14            	dc.b	20
 337  0107 25            	dc.b	37
 338  0108 15            	dc.b	21
 339  0109 35            	dc.b	53
 340  010a 34            	dc.b	52
 341  010b 00            	dc.b	0
 342  010c               __nc:
 343  010c 07            	dc.b	7
 344  010d 18            	dc.b	24
 345  010e 38            	dc.b	56
 346  010f 37            	dc.b	55
 347  0110 27            	dc.b	39
 348  0111 17            	dc.b	23
 349  0112 00            	dc.b	0
 350  0113 18            	dc.b	24
 351  0114 38            	dc.b	56
 352  0115 00            	dc.b	0
 353  0116 00            	dc.b	0
 354  0117 00            	dc.b	0
 355  0118 00            	dc.b	0
 356  0119 00            	dc.b	0
 357  011a 07            	dc.b	7
 358  011b 18            	dc.b	24
 359  011c 28            	dc.b	40
 360  011d 27            	dc.b	39
 361  011e 37            	dc.b	55
 362  011f 00            	dc.b	0
 363  0120 00            	dc.b	0
 364  0121 07            	dc.b	7
 365  0122 18            	dc.b	24
 366  0123 28            	dc.b	40
 367  0124 38            	dc.b	56
 368  0125 37            	dc.b	55
 369  0126 00            	dc.b	0
 370  0127 00            	dc.b	0
 371  0128 17            	dc.b	23
 372  0129 28            	dc.b	40
 373  012a 18            	dc.b	24
 374  012b 38            	dc.b	56
 375  012c 00            	dc.b	0
 376  012d 00            	dc.b	0
 377  012e 00            	dc.b	0
 378  012f 07            	dc.b	7
 379  0130 17            	dc.b	23
 380  0131 28            	dc.b	40
 381  0132 38            	dc.b	56
 382  0133 37            	dc.b	55
 383  0134 00            	dc.b	0
 384  0135 00            	dc.b	0
 385  0136 17            	dc.b	23
 386  0137 28            	dc.b	40
 387  0138 27            	dc.b	39
 388  0139 37            	dc.b	55
 389  013a 38            	dc.b	56
 390  013b 07            	dc.b	7
 391  013c 00            	dc.b	0
 392  013d 07            	dc.b	7
 393  013e 18            	dc.b	24
 394  013f 38            	dc.b	56
 395  0140 00            	dc.b	0
 396  0141 00            	dc.b	0
 397  0142 00            	dc.b	0
 398  0143 00            	dc.b	0
 399  0144 07            	dc.b	7
 400  0145 18            	dc.b	24
 401  0146 38            	dc.b	56
 402  0147 37            	dc.b	55
 403  0148 27            	dc.b	39
 404  0149 17            	dc.b	23
 405  014a 28            	dc.b	40
 406  014b 07            	dc.b	7
 407  014c 17            	dc.b	23
 408  014d 28            	dc.b	40
 409  014e 18            	dc.b	24
 410  014f 38            	dc.b	56
 411  0150 37            	dc.b	55
 412  0151 00            	dc.b	0
 413  0152               __nd:
 414  0152 09            	dc.b	9
 415  0153 1a            	dc.b	26
 416  0154 3a            	dc.b	58
 417  0155 39            	dc.b	57
 418  0156 29            	dc.b	41
 419  0157 19            	dc.b	25
 420  0158 00            	dc.b	0
 421  0159 1a            	dc.b	26
 422  015a 3a            	dc.b	58
 423  015b 00            	dc.b	0
 424  015c 00            	dc.b	0
 425  015d 00            	dc.b	0
 426  015e 00            	dc.b	0
 427  015f 00            	dc.b	0
 428  0160 09            	dc.b	9
 429  0161 1a            	dc.b	26
 430  0162 2a            	dc.b	42
 431  0163 29            	dc.b	41
 432  0164 39            	dc.b	57
 433  0165 00            	dc.b	0
 434  0166 00            	dc.b	0
 435  0167 09            	dc.b	9
 436  0168 1a            	dc.b	26
 437  0169 2a            	dc.b	42
 438  016a 3a            	dc.b	58
 439  016b 39            	dc.b	57
 440  016c 00            	dc.b	0
 441  016d 00            	dc.b	0
 442  016e 19            	dc.b	25
 443  016f 2a            	dc.b	42
 444  0170 1a            	dc.b	26
 445  0171 3a            	dc.b	58
 446  0172 00            	dc.b	0
 447  0173 00            	dc.b	0
 448  0174 00            	dc.b	0
 449  0175 09            	dc.b	9
 450  0176 19            	dc.b	25
 451  0177 2a            	dc.b	42
 452  0178 3a            	dc.b	58
 453  0179 39            	dc.b	57
 454  017a 00            	dc.b	0
 455  017b 00            	dc.b	0
 456  017c 19            	dc.b	25
 457  017d 2a            	dc.b	42
 458  017e 29            	dc.b	41
 459  017f 39            	dc.b	57
 460  0180 3a            	dc.b	58
 461  0181 09            	dc.b	9
 462  0182 00            	dc.b	0
 463  0183 09            	dc.b	9
 464  0184 1a            	dc.b	26
 465  0185 3a            	dc.b	58
 466  0186 00            	dc.b	0
 467  0187 00            	dc.b	0
 468  0188 00            	dc.b	0
 469  0189 00            	dc.b	0
 470  018a 09            	dc.b	9
 471  018b 1a            	dc.b	26
 472  018c 3a            	dc.b	58
 473  018d 39            	dc.b	57
 474  018e 29            	dc.b	41
 475  018f 19            	dc.b	25
 476  0190 2a            	dc.b	42
 477  0191 09            	dc.b	9
 478  0192 19            	dc.b	25
 479  0193 2a            	dc.b	42
 480  0194 1a            	dc.b	26
 481  0195 3a            	dc.b	58
 482  0196 39            	dc.b	57
 483  0197 00            	dc.b	0
 484  0198               __nerr:
 485  0198 02            	dc.b	2
 486  0199 12            	dc.b	18
 487  019a 22            	dc.b	34
 488  019b 32            	dc.b	50
 489  019c 23            	dc.b	35
 490  019d 24            	dc.b	36
 491  019e 25            	dc.b	37
 492  019f               __nerrBr:
 493  019f 33            	dc.b	51
 494  01a0 12            	dc.b	18
 495  01a1 22            	dc.b	34
 496  01a2 32            	dc.b	50
 497  01a3 23            	dc.b	35
 498  01a4 24            	dc.b	36
 499  01a5 25            	dc.b	37
 500  01a6               __nm:
 501  01a6 22            	dc.b	34
 502  01a7 23            	dc.b	35
 503  01a8 33            	dc.b	51
 504  01a9               __ncnt:
 505  01a9 23            	dc.b	35
 506  01aa 22            	dc.b	34
 507  01ab 32            	dc.b	50
 508  01ac 24            	dc.b	36
 509  01ad 25            	dc.b	37
 510  01ae 35            	dc.b	53
 511  01af               __nvalve:
 512  01af 33            	dc.b	51
 513  01b0 22            	dc.b	34
 514  01b1 32            	dc.b	50
 515  01b2 24            	dc.b	36
 516  01b3 25            	dc.b	37
 517  01b4 35            	dc.b	53
 518  01b5               __n:
 519  01b5 02            	dc.b	2
 520  01b6 13            	dc.b	19
 521  01b7 33            	dc.b	51
 522  01b8 32            	dc.b	50
 523  01b9 22            	dc.b	34
 524  01ba 12            	dc.b	18
 525  01bb 23            	dc.b	35
 526  01bc 04            	dc.b	4
 527  01bd 15            	dc.b	21
 528  01be 35            	dc.b	53
 529  01bf 34            	dc.b	52
 530  01c0 24            	dc.b	36
 531  01c1 14            	dc.b	20
 532  01c2 25            	dc.b	37
 533  01c3 07            	dc.b	7
 534  01c4 18            	dc.b	24
 535  01c5 38            	dc.b	56
 536  01c6 37            	dc.b	55
 537  01c7 27            	dc.b	39
 538  01c8 17            	dc.b	23
 539  01c9 28            	dc.b	40
 540  01ca 09            	dc.b	9
 541  01cb 1a            	dc.b	26
 542  01cc 3a            	dc.b	58
 543  01cd 39            	dc.b	57
 544  01ce 29            	dc.b	41
 545  01cf 19            	dc.b	25
 546  01d0 2a            	dc.b	42
 547  01d1 06            	dc.b	6
 548  01d2 1b            	dc.b	27
 549  01d3 36            	dc.b	54
 550  01d4 3b            	dc.b	59
 551  01d5 26            	dc.b	38
 552  01d6 2b            	dc.b	43
 553  01d7 16            	dc.b	22
 554  01d8               __nid:
 555  01d8 33            	dc.b	51
 556  01d9 15            	dc.b	21
 557  01da 35            	dc.b	53
 558  01db 25            	dc.b	37
 559  01dc 24            	dc.b	36
 560  01dd 34            	dc.b	52
 561  01de               __info:
 562  01de 05            	dc.b	5
 563  01df 0a            	dc.b	10
 564  01e0 0b            	dc.b	11
 565  01e1               __rid:
 566  01e1 0e            	dc.b	14
 567  01e2 0f            	dc.b	15
 568  01e3 1e            	dc.b	30
 569  01e4 1f            	dc.b	31
 570  01e5 2e            	dc.b	46
 571  01e6 2f            	dc.b	47
 572  01e7 3e            	dc.b	62
 573  01e8 3f            	dc.b	63
 574  01e9 3d            	dc.b	61
 575  01ea 3c            	dc.b	60
 576  01eb 2d            	dc.b	45
 577  01ec 2c            	dc.b	44
 578  01ed 1d            	dc.b	29
 579  01ee 1c            	dc.b	28
 580  01ef 0d            	dc.b	13
 581  01f0 0c            	dc.b	12
 582  01f1               __bL:
 583  01f1 12            	dc.b	18
 584  01f2 22            	dc.b	34
 585  01f3 23            	dc.b	35
 586  01f4 32            	dc.b	50
 587  01f5 33            	dc.b	51
 588  01f6 14            	dc.b	20
 589  01f7 24            	dc.b	36
 590  01f8 34            	dc.b	52
 591  01f9               __btn:
 592  01f9 11            	dc.b	17
 593  01fa 21            	dc.b	33
 594  01fb 31            	dc.b	49
 595  01fc 10            	dc.b	16
 596  01fd 20            	dc.b	32
 597  01fe               __cc:
 598  01fe 23            	dc.b	35
 599  01ff 22            	dc.b	34
 600  0200 32            	dc.b	50
 601  0201 1b            	dc.b	27
 602  0202               __cntl_on:
 603  0202 28            	dc.b	40
 604  0203 27            	dc.b	39
 605  0204 38            	dc.b	56
 606  0205 37            	dc.b	55
 607  0206 09            	dc.b	9
 608  0207 29            	dc.b	41
 609  0208 2a            	dc.b	42
 610  0209 19            	dc.b	25
 611  020a               __cntl_po:
 612  020a 07            	dc.b	7
 613  020b 18            	dc.b	24
 614  020c 17            	dc.b	23
 615  020d 28            	dc.b	40
 616  020e 27            	dc.b	39
 617  020f 2a            	dc.b	42
 618  0210 29            	dc.b	41
 619  0211 3a            	dc.b	58
 620  0212 39            	dc.b	57
 621  0213               __hcLocal:
 622  0213 17            	dc.b	23
 623  0214 27            	dc.b	39
 624  0215 37            	dc.b	55
 625  0216 2a            	dc.b	42
 626  0217 29            	dc.b	41
 627  0218 39            	dc.b	57
 628  0219 3a            	dc.b	58
 629  021a               __hcEach:
 630  021a 07            	dc.b	7
 631  021b 17            	dc.b	23
 632  021c 28            	dc.b	40
 633  021d 27            	dc.b	39
 634  021e 37            	dc.b	55
 635  021f 09            	dc.b	9
 636  0220 19            	dc.b	25
 637  0221 29            	dc.b	41
 638  0222 1a            	dc.b	26
 639  0223 2a            	dc.b	42
 640  0224 3a            	dc.b	58
 641  0225               __run:
 642  0225 22            	dc.b	34
 643  0226 23            	dc.b	35
 644  0227 24            	dc.b	36
 645  0228 34            	dc.b	52
 646  0229 35            	dc.b	53
 647  022a 27            	dc.b	39
 648  022b 28            	dc.b	40
 649  022c 38            	dc.b	56
 650  022d               __hc:
 651  022d 12            	dc.b	18
 652  022e 22            	dc.b	34
 653  022f 23            	dc.b	35
 654  0230 32            	dc.b	50
 655  0231 25            	dc.b	37
 656  0232 14            	dc.b	20
 657  0233 15            	dc.b	21
 658  0234 35            	dc.b	53
 659  0235               __link:
 660  0235 12            	dc.b	18
 661  0236 22            	dc.b	34
 662  0237 32            	dc.b	50
 663  0238 24            	dc.b	36
 664  0239 25            	dc.b	37
 665  023a 35            	dc.b	53
 666  023b               __cntl_op:
 667  023b 23            	dc.b	35
 668  023c 22            	dc.b	34
 669  023d 33            	dc.b	51
 670  023e 32            	dc.b	50
 671  023f 04            	dc.b	4
 672  0240 15            	dc.b	21
 673  0241 14            	dc.b	20
 674  0242 25            	dc.b	37
 675  0243 24            	dc.b	36
 676  0244               __cntl_2motor:
 677  0244 07            	dc.b	7
 678  0245 18            	dc.b	24
 679  0246 37            	dc.b	55
 680  0247 28            	dc.b	40
 681  0248 27            	dc.b	39
 682  0249 2a            	dc.b	42
 683  024a 29            	dc.b	41
 684  024b 09            	dc.b	9
 685  024c 19            	dc.b	25
 686  024d 1a            	dc.b	26
 687  024e               __cntl_tab:
 688  024e 07            	dc.b	7
 689  024f 17            	dc.b	23
 690  0250 27            	dc.b	39
 691  0251 2a            	dc.b	42
 692  0252 29            	dc.b	41
 693  0253 19            	dc.b	25
 694  0254 39            	dc.b	57
 695  0255 3a            	dc.b	58
 696  0256               __mir1:
 697  0256 18            	dc.b	24
 698  0257 38            	dc.b	56
 699  0258 27            	dc.b	39
 700  0259 28            	dc.b	40
 701  025a 37            	dc.b	55
 702  025b 1a            	dc.b	26
 703  025c 3a            	dc.b	58
 704  025d               __mir2:
 705  025d 18            	dc.b	24
 706  025e 38            	dc.b	56
 707  025f 27            	dc.b	39
 708  0260 28            	dc.b	40
 709  0261 37            	dc.b	55
 710  0262 09            	dc.b	9
 711  0263 1a            	dc.b	26
 712  0264 2a            	dc.b	42
 713  0265 29            	dc.b	41
 714  0266 39            	dc.b	57
 715  0267               __freset:
 716  0267 07            	dc.b	7
 717  0268 17            	dc.b	23
 718  0269 27            	dc.b	39
 719  026a 28            	dc.b	40
 720  026b 2a            	dc.b	42
 721  026c 29            	dc.b	41
 722  026d               __len:
 723  026d 12            	dc.b	18
 724  026e 22            	dc.b	34
 725  026f 32            	dc.b	50
 726  0270               __po_type:
 727  0270 25            	dc.b	37
 728  0271 24            	dc.b	36
 729  0272 35            	dc.b	53
 730  0273 34            	dc.b	52
 731  0274 02            	dc.b	2
 732  0275 13            	dc.b	19
 733  0276 12            	dc.b	18
 734  0277 23            	dc.b	35
 735  0278 22            	dc.b	34
 736  0279               __po_type_xl:
 737  0279 19            	dc.b	25
 738  027a 29            	dc.b	41
 739  027b 39            	dc.b	57
 740  027c 17            	dc.b	23
 741  027d 18            	dc.b	24
 742  027e 38            	dc.b	56
 743  027f 28            	dc.b	40
 744  0280 27            	dc.b	39
 745  0281               __po_type_pb:
 746  0281 2a            	dc.b	42
 747  0282 29            	dc.b	41
 748  0283 3a            	dc.b	58
 749  0284 39            	dc.b	57
 750  0285 19            	dc.b	25
 751  0286 07            	dc.b	7
 752  0287 18            	dc.b	24
 753  0288 17            	dc.b	23
 754  0289 28            	dc.b	40
 755  028a 27            	dc.b	39
 756  028b               __temp_offset:
 757  028b 23            	dc.b	35
 758  028c 22            	dc.b	34
 759  028d 32            	dc.b	50
 760  028e 12            	dc.b	18
 761  028f               __lpm:
 762  028f 12            	dc.b	18
 763  0290 22            	dc.b	34
 764  0291 32            	dc.b	50
 765  0292 24            	dc.b	36
 766  0293 25            	dc.b	37
 767  0294 04            	dc.b	4
 768  0295 14            	dc.b	20
 769  0296 15            	dc.b	21
 770  0297               __cnt_host:
 771  0297 18            	dc.b	24
 772  0298 38            	dc.b	56
 773  0299 27            	dc.b	39
 774  029a 28            	dc.b	40
 775  029b 17            	dc.b	23
 776  029c 2a            	dc.b	42
 777  029d 3a            	dc.b	58
 778  029e 29            	dc.b	41
 779  029f 39            	dc.b	57
 780  02a0               __cnt_sub:
 781  02a0 07            	dc.b	7
 782  02a1 38            	dc.b	56
 783  02a2 17            	dc.b	23
 784  02a3 28            	dc.b	40
 785  02a4 37            	dc.b	55
 786  02a5 29            	dc.b	41
 787  02a6 39            	dc.b	57
 788  02a7 3a            	dc.b	58
 789  02a8               __plc:
 790  02a8 02            	dc.b	2
 791  02a9 13            	dc.b	19
 792  02aa 12            	dc.b	18
 793  02ab 22            	dc.b	34
 794  02ac 23            	dc.b	35
 795  02ad 24            	dc.b	36
 796  02ae 34            	dc.b	52
 797  02af 14            	dc.b	20
 798  02b0 07            	dc.b	7
 799  02b1 17            	dc.b	23
 800  02b2 27            	dc.b	39
 801  02b3 37            	dc.b	55
 841                     ; 318 LCD_DISP_FUNC_1(lcd_disp_plc, 12, _plc)
 842                     .text:	section	.text,new
 843  0000               _lcd_disp_plc:
 845  0000 89            	pushw	x
 846       00000002      OFST:	set	2
 849  0001 0f02          	clr	(OFST+0,sp)
 850  0003               L34:
 853  0003 7b02          	ld	a,(OFST+0,sp)
 854  0005 5f            	clrw	x
 855  0006 97            	ld	xl,a
 856  0007 d602a8        	ld	a,(__plc,x)
 857  000a 6b01          	ld	(OFST-1,sp),a
 860  000c 7b01          	ld	a,(OFST-1,sp)
 861  000e 5f            	clrw	x
 862  000f 97            	ld	xl,a
 863  0010 d60040        	ld	a,(_iLF_DEF,x)
 864  0013 5f            	clrw	x
 865  0014 97            	ld	xl,a
 866  0015 7b01          	ld	a,(OFST-1,sp)
 867  0017 905f          	clrw	y
 868  0019 9097          	ld	yl,a
 869  001b d6540c        	ld	a,(21516,x)
 870  001e 90da0000      	or	a,(_bLF_DEF,y)
 871  0022 d7540c        	ld	(21516,x),a
 874  0025 0c02          	inc	(OFST+0,sp)
 877  0027 7b02          	ld	a,(OFST+0,sp)
 878  0029 a10c          	cp	a,#12
 879  002b 25d6          	jrult	L34
 883  002d 85            	popw	x
 884  002e 81            	ret
 926                     ; 320 LCD_DISP_FUNC_1(lcd_disp_cnt_host, 9, _cnt_host)
 927                     .text:	section	.text,new
 928  0000               _lcd_disp_cnt_host:
 930  0000 89            	pushw	x
 931       00000002      OFST:	set	2
 934  0001 0f02          	clr	(OFST+0,sp)
 935  0003               L76:
 938  0003 7b02          	ld	a,(OFST+0,sp)
 939  0005 5f            	clrw	x
 940  0006 97            	ld	xl,a
 941  0007 d60297        	ld	a,(__cnt_host,x)
 942  000a 6b01          	ld	(OFST-1,sp),a
 945  000c 7b01          	ld	a,(OFST-1,sp)
 946  000e 5f            	clrw	x
 947  000f 97            	ld	xl,a
 948  0010 d60040        	ld	a,(_iLF_DEF,x)
 949  0013 5f            	clrw	x
 950  0014 97            	ld	xl,a
 951  0015 7b01          	ld	a,(OFST-1,sp)
 952  0017 905f          	clrw	y
 953  0019 9097          	ld	yl,a
 954  001b d6540c        	ld	a,(21516,x)
 955  001e 90da0000      	or	a,(_bLF_DEF,y)
 956  0022 d7540c        	ld	(21516,x),a
 959  0025 0c02          	inc	(OFST+0,sp)
 962  0027 7b02          	ld	a,(OFST+0,sp)
 963  0029 a109          	cp	a,#9
 964  002b 25d6          	jrult	L76
 968  002d 85            	popw	x
 969  002e 81            	ret
1011                     ; 321 LCD_DISP_FUNC_1(lcd_disp_cnt_sub, 8, _cnt_sub)
1012                     .text:	section	.text,new
1013  0000               _lcd_disp_cnt_sub:
1015  0000 89            	pushw	x
1016       00000002      OFST:	set	2
1019  0001 0f02          	clr	(OFST+0,sp)
1020  0003               L311:
1023  0003 7b02          	ld	a,(OFST+0,sp)
1024  0005 5f            	clrw	x
1025  0006 97            	ld	xl,a
1026  0007 d602a0        	ld	a,(__cnt_sub,x)
1027  000a 6b01          	ld	(OFST-1,sp),a
1030  000c 7b01          	ld	a,(OFST-1,sp)
1031  000e 5f            	clrw	x
1032  000f 97            	ld	xl,a
1033  0010 d60040        	ld	a,(_iLF_DEF,x)
1034  0013 5f            	clrw	x
1035  0014 97            	ld	xl,a
1036  0015 7b01          	ld	a,(OFST-1,sp)
1037  0017 905f          	clrw	y
1038  0019 9097          	ld	yl,a
1039  001b d6540c        	ld	a,(21516,x)
1040  001e 90da0000      	or	a,(_bLF_DEF,y)
1041  0022 d7540c        	ld	(21516,x),a
1044  0025 0c02          	inc	(OFST+0,sp)
1047  0027 7b02          	ld	a,(OFST+0,sp)
1048  0029 a108          	cp	a,#8
1049  002b 25d6          	jrult	L311
1053  002d 85            	popw	x
1054  002e 81            	ret
1096                     ; 323 LCD_DISP_FUNC_1(lcd_disp_mir1, 7, _mir1)
1097                     .text:	section	.text,new
1098  0000               _lcd_disp_mir1:
1100  0000 89            	pushw	x
1101       00000002      OFST:	set	2
1104  0001 0f02          	clr	(OFST+0,sp)
1105  0003               L731:
1108  0003 7b02          	ld	a,(OFST+0,sp)
1109  0005 5f            	clrw	x
1110  0006 97            	ld	xl,a
1111  0007 d60256        	ld	a,(__mir1,x)
1112  000a 6b01          	ld	(OFST-1,sp),a
1115  000c 7b01          	ld	a,(OFST-1,sp)
1116  000e 5f            	clrw	x
1117  000f 97            	ld	xl,a
1118  0010 d60040        	ld	a,(_iLF_DEF,x)
1119  0013 5f            	clrw	x
1120  0014 97            	ld	xl,a
1121  0015 7b01          	ld	a,(OFST-1,sp)
1122  0017 905f          	clrw	y
1123  0019 9097          	ld	yl,a
1124  001b d6540c        	ld	a,(21516,x)
1125  001e 90da0000      	or	a,(_bLF_DEF,y)
1126  0022 d7540c        	ld	(21516,x),a
1129  0025 0c02          	inc	(OFST+0,sp)
1132  0027 7b02          	ld	a,(OFST+0,sp)
1133  0029 a107          	cp	a,#7
1134  002b 25d6          	jrult	L731
1138  002d 85            	popw	x
1139  002e 81            	ret
1181                     ; 324 LCD_DISP_FUNC_1(lcd_disp_mir2, 10, _mir2)
1182                     .text:	section	.text,new
1183  0000               _lcd_disp_mir2:
1185  0000 89            	pushw	x
1186       00000002      OFST:	set	2
1189  0001 0f02          	clr	(OFST+0,sp)
1190  0003               L361:
1193  0003 7b02          	ld	a,(OFST+0,sp)
1194  0005 5f            	clrw	x
1195  0006 97            	ld	xl,a
1196  0007 d6025d        	ld	a,(__mir2,x)
1197  000a 6b01          	ld	(OFST-1,sp),a
1200  000c 7b01          	ld	a,(OFST-1,sp)
1201  000e 5f            	clrw	x
1202  000f 97            	ld	xl,a
1203  0010 d60040        	ld	a,(_iLF_DEF,x)
1204  0013 5f            	clrw	x
1205  0014 97            	ld	xl,a
1206  0015 7b01          	ld	a,(OFST-1,sp)
1207  0017 905f          	clrw	y
1208  0019 9097          	ld	yl,a
1209  001b d6540c        	ld	a,(21516,x)
1210  001e 90da0000      	or	a,(_bLF_DEF,y)
1211  0022 d7540c        	ld	(21516,x),a
1214  0025 0c02          	inc	(OFST+0,sp)
1217  0027 7b02          	ld	a,(OFST+0,sp)
1218  0029 a10a          	cp	a,#10
1219  002b 25d6          	jrult	L361
1223  002d 85            	popw	x
1224  002e 81            	ret
1266                     ; 325 LCD_DISP_FUNC_1(lcd_disp_freset, 6, _freset)
1267                     .text:	section	.text,new
1268  0000               _lcd_disp_freset:
1270  0000 89            	pushw	x
1271       00000002      OFST:	set	2
1274  0001 0f02          	clr	(OFST+0,sp)
1275  0003               L702:
1278  0003 7b02          	ld	a,(OFST+0,sp)
1279  0005 5f            	clrw	x
1280  0006 97            	ld	xl,a
1281  0007 d60267        	ld	a,(__freset,x)
1282  000a 6b01          	ld	(OFST-1,sp),a
1285  000c 7b01          	ld	a,(OFST-1,sp)
1286  000e 5f            	clrw	x
1287  000f 97            	ld	xl,a
1288  0010 d60040        	ld	a,(_iLF_DEF,x)
1289  0013 5f            	clrw	x
1290  0014 97            	ld	xl,a
1291  0015 7b01          	ld	a,(OFST-1,sp)
1292  0017 905f          	clrw	y
1293  0019 9097          	ld	yl,a
1294  001b d6540c        	ld	a,(21516,x)
1295  001e 90da0000      	or	a,(_bLF_DEF,y)
1296  0022 d7540c        	ld	(21516,x),a
1299  0025 0c02          	inc	(OFST+0,sp)
1302  0027 7b02          	ld	a,(OFST+0,sp)
1303  0029 a106          	cp	a,#6
1304  002b 25d6          	jrult	L702
1308  002d 85            	popw	x
1309  002e 81            	ret
1352                     ; 327 LCD_DISP_FUNC(lcd_disp_backlight, 8, _bL)
1353                     .text:	section	.text,new
1354  0000               _lcd_disp_backlight:
1356  0000 89            	pushw	x
1357       00000002      OFST:	set	2
1362  0001 cd0000        	call	_lcd_clear_n
1365  0004 0f02          	clr	(OFST+0,sp)
1366  0006               L332:
1369  0006 7b02          	ld	a,(OFST+0,sp)
1370  0008 5f            	clrw	x
1371  0009 97            	ld	xl,a
1372  000a d601f1        	ld	a,(__bL,x)
1373  000d 6b01          	ld	(OFST-1,sp),a
1376  000f 7b01          	ld	a,(OFST-1,sp)
1377  0011 5f            	clrw	x
1378  0012 97            	ld	xl,a
1379  0013 d60040        	ld	a,(_iLF_DEF,x)
1380  0016 5f            	clrw	x
1381  0017 97            	ld	xl,a
1382  0018 7b01          	ld	a,(OFST-1,sp)
1383  001a 905f          	clrw	y
1384  001c 9097          	ld	yl,a
1385  001e d6540c        	ld	a,(21516,x)
1386  0021 90da0000      	or	a,(_bLF_DEF,y)
1387  0025 d7540c        	ld	(21516,x),a
1390  0028 0c02          	inc	(OFST+0,sp)
1393  002a 7b02          	ld	a,(OFST+0,sp)
1394  002c a108          	cp	a,#8
1395  002e 25d6          	jrult	L332
1399  0030 85            	popw	x
1400  0031 81            	ret
1443                     ; 329 LCD_DISP_FUNC(lcd_disp_setup_lpm, 8, _lpm)
1444                     .text:	section	.text,new
1445  0000               _lcd_disp_setup_lpm:
1447  0000 89            	pushw	x
1448       00000002      OFST:	set	2
1453  0001 cd0000        	call	_lcd_clear_n
1456  0004 0f02          	clr	(OFST+0,sp)
1457  0006               L752:
1460  0006 7b02          	ld	a,(OFST+0,sp)
1461  0008 5f            	clrw	x
1462  0009 97            	ld	xl,a
1463  000a d6028f        	ld	a,(__lpm,x)
1464  000d 6b01          	ld	(OFST-1,sp),a
1467  000f 7b01          	ld	a,(OFST-1,sp)
1468  0011 5f            	clrw	x
1469  0012 97            	ld	xl,a
1470  0013 d60040        	ld	a,(_iLF_DEF,x)
1471  0016 5f            	clrw	x
1472  0017 97            	ld	xl,a
1473  0018 7b01          	ld	a,(OFST-1,sp)
1474  001a 905f          	clrw	y
1475  001c 9097          	ld	yl,a
1476  001e d6540c        	ld	a,(21516,x)
1477  0021 90da0000      	or	a,(_bLF_DEF,y)
1478  0025 d7540c        	ld	(21516,x),a
1481  0028 0c02          	inc	(OFST+0,sp)
1484  002a 7b02          	ld	a,(OFST+0,sp)
1485  002c a108          	cp	a,#8
1486  002e 25d6          	jrult	L752
1490  0030 85            	popw	x
1491  0031 81            	ret
1535                     ; 330 LCD_DISP_FUNC(lcd_disp_setup_temp_offset, 4, _temp_offset)
1536                     .text:	section	.text,new
1537  0000               _lcd_disp_setup_temp_offset:
1539  0000 89            	pushw	x
1540       00000002      OFST:	set	2
1545  0001 cd0000        	call	_lcd_clear_n
1548  0004 0f02          	clr	(OFST+0,sp)
1549  0006               L303:
1552  0006 7b02          	ld	a,(OFST+0,sp)
1553  0008 5f            	clrw	x
1554  0009 97            	ld	xl,a
1555  000a d6028b        	ld	a,(__temp_offset,x)
1556  000d 6b01          	ld	(OFST-1,sp),a
1559  000f 7b01          	ld	a,(OFST-1,sp)
1560  0011 5f            	clrw	x
1561  0012 97            	ld	xl,a
1562  0013 d60040        	ld	a,(_iLF_DEF,x)
1563  0016 5f            	clrw	x
1564  0017 97            	ld	xl,a
1565  0018 7b01          	ld	a,(OFST-1,sp)
1566  001a 905f          	clrw	y
1567  001c 9097          	ld	yl,a
1568  001e d6540c        	ld	a,(21516,x)
1569  0021 90da0000      	or	a,(_bLF_DEF,y)
1570  0025 d7540c        	ld	(21516,x),a
1573  0028 0c02          	inc	(OFST+0,sp)
1576  002a 7b02          	ld	a,(OFST+0,sp)
1577  002c a104          	cp	a,#4
1578  002e 25d6          	jrult	L303
1582  0030 85            	popw	x
1583  0031 81            	ret
1627                     ; 332 LCD_DISP_FUNC(lcd_disp_setup_po_type, 9, _po_type)
1628                     .text:	section	.text,new
1629  0000               _lcd_disp_setup_po_type:
1631  0000 89            	pushw	x
1632       00000002      OFST:	set	2
1637  0001 cd0000        	call	_lcd_clear_n
1640  0004 0f02          	clr	(OFST+0,sp)
1641  0006               L723:
1644  0006 7b02          	ld	a,(OFST+0,sp)
1645  0008 5f            	clrw	x
1646  0009 97            	ld	xl,a
1647  000a d60270        	ld	a,(__po_type,x)
1648  000d 6b01          	ld	(OFST-1,sp),a
1651  000f 7b01          	ld	a,(OFST-1,sp)
1652  0011 5f            	clrw	x
1653  0012 97            	ld	xl,a
1654  0013 d60040        	ld	a,(_iLF_DEF,x)
1655  0016 5f            	clrw	x
1656  0017 97            	ld	xl,a
1657  0018 7b01          	ld	a,(OFST-1,sp)
1658  001a 905f          	clrw	y
1659  001c 9097          	ld	yl,a
1660  001e d6540c        	ld	a,(21516,x)
1661  0021 90da0000      	or	a,(_bLF_DEF,y)
1662  0025 d7540c        	ld	(21516,x),a
1665  0028 0c02          	inc	(OFST+0,sp)
1668  002a 7b02          	ld	a,(OFST+0,sp)
1669  002c a109          	cp	a,#9
1670  002e 25d6          	jrult	L723
1674  0030 85            	popw	x
1675  0031 81            	ret
1718                     ; 333 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_xl, 8, _po_type_xl)
1719                     .text:	section	.text,new
1720  0000               _lcd_disp_setup_po_type_xl:
1722  0000 89            	pushw	x
1723       00000002      OFST:	set	2
1726  0001 0f02          	clr	(OFST+0,sp)
1727  0003               L353:
1730  0003 7b02          	ld	a,(OFST+0,sp)
1731  0005 5f            	clrw	x
1732  0006 97            	ld	xl,a
1733  0007 d60279        	ld	a,(__po_type_xl,x)
1734  000a 6b01          	ld	(OFST-1,sp),a
1737  000c 7b01          	ld	a,(OFST-1,sp)
1738  000e 5f            	clrw	x
1739  000f 97            	ld	xl,a
1740  0010 d60040        	ld	a,(_iLF_DEF,x)
1741  0013 5f            	clrw	x
1742  0014 97            	ld	xl,a
1743  0015 7b01          	ld	a,(OFST-1,sp)
1744  0017 905f          	clrw	y
1745  0019 9097          	ld	yl,a
1746  001b d6540c        	ld	a,(21516,x)
1747  001e 90da0000      	or	a,(_bLF_DEF,y)
1748  0022 d7540c        	ld	(21516,x),a
1751  0025 0c02          	inc	(OFST+0,sp)
1754  0027 7b02          	ld	a,(OFST+0,sp)
1755  0029 a108          	cp	a,#8
1756  002b 25d6          	jrult	L353
1760  002d 85            	popw	x
1761  002e 81            	ret
1804                     ; 334 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_pb, 10, _po_type_pb)
1805                     .text:	section	.text,new
1806  0000               _lcd_disp_setup_po_type_pb:
1808  0000 89            	pushw	x
1809       00000002      OFST:	set	2
1812  0001 0f02          	clr	(OFST+0,sp)
1813  0003               L773:
1816  0003 7b02          	ld	a,(OFST+0,sp)
1817  0005 5f            	clrw	x
1818  0006 97            	ld	xl,a
1819  0007 d60281        	ld	a,(__po_type_pb,x)
1820  000a 6b01          	ld	(OFST-1,sp),a
1823  000c 7b01          	ld	a,(OFST-1,sp)
1824  000e 5f            	clrw	x
1825  000f 97            	ld	xl,a
1826  0010 d60040        	ld	a,(_iLF_DEF,x)
1827  0013 5f            	clrw	x
1828  0014 97            	ld	xl,a
1829  0015 7b01          	ld	a,(OFST-1,sp)
1830  0017 905f          	clrw	y
1831  0019 9097          	ld	yl,a
1832  001b d6540c        	ld	a,(21516,x)
1833  001e 90da0000      	or	a,(_bLF_DEF,y)
1834  0022 d7540c        	ld	(21516,x),a
1837  0025 0c02          	inc	(OFST+0,sp)
1840  0027 7b02          	ld	a,(OFST+0,sp)
1841  0029 a10a          	cp	a,#10
1842  002b 25d6          	jrult	L773
1846  002d 85            	popw	x
1847  002e 81            	ret
1890                     ; 338 LCD_DISP_FUNC(lcd_disp_setup_len, 3, _len)
1891                     .text:	section	.text,new
1892  0000               _lcd_disp_setup_len:
1894  0000 89            	pushw	x
1895       00000002      OFST:	set	2
1900  0001 cd0000        	call	_lcd_clear_n
1903  0004 0f02          	clr	(OFST+0,sp)
1904  0006               L324:
1907  0006 7b02          	ld	a,(OFST+0,sp)
1908  0008 5f            	clrw	x
1909  0009 97            	ld	xl,a
1910  000a d6026d        	ld	a,(__len,x)
1911  000d 6b01          	ld	(OFST-1,sp),a
1914  000f 7b01          	ld	a,(OFST-1,sp)
1915  0011 5f            	clrw	x
1916  0012 97            	ld	xl,a
1917  0013 d60040        	ld	a,(_iLF_DEF,x)
1918  0016 5f            	clrw	x
1919  0017 97            	ld	xl,a
1920  0018 7b01          	ld	a,(OFST-1,sp)
1921  001a 905f          	clrw	y
1922  001c 9097          	ld	yl,a
1923  001e d6540c        	ld	a,(21516,x)
1924  0021 90da0000      	or	a,(_bLF_DEF,y)
1925  0025 d7540c        	ld	(21516,x),a
1928  0028 0c02          	inc	(OFST+0,sp)
1931  002a 7b02          	ld	a,(OFST+0,sp)
1932  002c a103          	cp	a,#3
1933  002e 25d6          	jrult	L324
1937  0030 85            	popw	x
1938  0031 81            	ret
1982                     ; 339 LCD_DISP_FUNC(lcd_disp_setup_cntl_op, 9, _cntl_op)
1983                     .text:	section	.text,new
1984  0000               _lcd_disp_setup_cntl_op:
1986  0000 89            	pushw	x
1987       00000002      OFST:	set	2
1992  0001 cd0000        	call	_lcd_clear_n
1995  0004 0f02          	clr	(OFST+0,sp)
1996  0006               L744:
1999  0006 7b02          	ld	a,(OFST+0,sp)
2000  0008 5f            	clrw	x
2001  0009 97            	ld	xl,a
2002  000a d6023b        	ld	a,(__cntl_op,x)
2003  000d 6b01          	ld	(OFST-1,sp),a
2006  000f 7b01          	ld	a,(OFST-1,sp)
2007  0011 5f            	clrw	x
2008  0012 97            	ld	xl,a
2009  0013 d60040        	ld	a,(_iLF_DEF,x)
2010  0016 5f            	clrw	x
2011  0017 97            	ld	xl,a
2012  0018 7b01          	ld	a,(OFST-1,sp)
2013  001a 905f          	clrw	y
2014  001c 9097          	ld	yl,a
2015  001e d6540c        	ld	a,(21516,x)
2016  0021 90da0000      	or	a,(_bLF_DEF,y)
2017  0025 d7540c        	ld	(21516,x),a
2020  0028 0c02          	inc	(OFST+0,sp)
2023  002a 7b02          	ld	a,(OFST+0,sp)
2024  002c a109          	cp	a,#9
2025  002e 25d6          	jrult	L744
2029  0030 85            	popw	x
2030  0031 81            	ret
2073                     ; 340 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_on, 8, _cntl_on)
2074                     .text:	section	.text,new
2075  0000               _lcd_disp_setup_cntl_on:
2077  0000 89            	pushw	x
2078       00000002      OFST:	set	2
2081  0001 0f02          	clr	(OFST+0,sp)
2082  0003               L374:
2085  0003 7b02          	ld	a,(OFST+0,sp)
2086  0005 5f            	clrw	x
2087  0006 97            	ld	xl,a
2088  0007 d60202        	ld	a,(__cntl_on,x)
2089  000a 6b01          	ld	(OFST-1,sp),a
2092  000c 7b01          	ld	a,(OFST-1,sp)
2093  000e 5f            	clrw	x
2094  000f 97            	ld	xl,a
2095  0010 d60040        	ld	a,(_iLF_DEF,x)
2096  0013 5f            	clrw	x
2097  0014 97            	ld	xl,a
2098  0015 7b01          	ld	a,(OFST-1,sp)
2099  0017 905f          	clrw	y
2100  0019 9097          	ld	yl,a
2101  001b d6540c        	ld	a,(21516,x)
2102  001e 90da0000      	or	a,(_bLF_DEF,y)
2103  0022 d7540c        	ld	(21516,x),a
2106  0025 0c02          	inc	(OFST+0,sp)
2109  0027 7b02          	ld	a,(OFST+0,sp)
2110  0029 a108          	cp	a,#8
2111  002b 25d6          	jrult	L374
2115  002d 85            	popw	x
2116  002e 81            	ret
2159                     ; 341 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_po, 9, _cntl_po)
2160                     .text:	section	.text,new
2161  0000               _lcd_disp_setup_cntl_po:
2163  0000 89            	pushw	x
2164       00000002      OFST:	set	2
2167  0001 0f02          	clr	(OFST+0,sp)
2168  0003               L715:
2171  0003 7b02          	ld	a,(OFST+0,sp)
2172  0005 5f            	clrw	x
2173  0006 97            	ld	xl,a
2174  0007 d6020a        	ld	a,(__cntl_po,x)
2175  000a 6b01          	ld	(OFST-1,sp),a
2178  000c 7b01          	ld	a,(OFST-1,sp)
2179  000e 5f            	clrw	x
2180  000f 97            	ld	xl,a
2181  0010 d60040        	ld	a,(_iLF_DEF,x)
2182  0013 5f            	clrw	x
2183  0014 97            	ld	xl,a
2184  0015 7b01          	ld	a,(OFST-1,sp)
2185  0017 905f          	clrw	y
2186  0019 9097          	ld	yl,a
2187  001b d6540c        	ld	a,(21516,x)
2188  001e 90da0000      	or	a,(_bLF_DEF,y)
2189  0022 d7540c        	ld	(21516,x),a
2192  0025 0c02          	inc	(OFST+0,sp)
2195  0027 7b02          	ld	a,(OFST+0,sp)
2196  0029 a109          	cp	a,#9
2197  002b 25d6          	jrult	L715
2201  002d 85            	popw	x
2202  002e 81            	ret
2245                     ; 342 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_2motor, 10, _cntl_2motor)
2246                     .text:	section	.text,new
2247  0000               _lcd_disp_setup_cntl_2motor:
2249  0000 89            	pushw	x
2250       00000002      OFST:	set	2
2253  0001 0f02          	clr	(OFST+0,sp)
2254  0003               L345:
2257  0003 7b02          	ld	a,(OFST+0,sp)
2258  0005 5f            	clrw	x
2259  0006 97            	ld	xl,a
2260  0007 d60244        	ld	a,(__cntl_2motor,x)
2261  000a 6b01          	ld	(OFST-1,sp),a
2264  000c 7b01          	ld	a,(OFST-1,sp)
2265  000e 5f            	clrw	x
2266  000f 97            	ld	xl,a
2267  0010 d60040        	ld	a,(_iLF_DEF,x)
2268  0013 5f            	clrw	x
2269  0014 97            	ld	xl,a
2270  0015 7b01          	ld	a,(OFST-1,sp)
2271  0017 905f          	clrw	y
2272  0019 9097          	ld	yl,a
2273  001b d6540c        	ld	a,(21516,x)
2274  001e 90da0000      	or	a,(_bLF_DEF,y)
2275  0022 d7540c        	ld	(21516,x),a
2278  0025 0c02          	inc	(OFST+0,sp)
2281  0027 7b02          	ld	a,(OFST+0,sp)
2282  0029 a10a          	cp	a,#10
2283  002b 25d6          	jrult	L345
2287  002d 85            	popw	x
2288  002e 81            	ret
2331                     ; 343 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_tab, 8, _cntl_tab)
2332                     .text:	section	.text,new
2333  0000               _lcd_disp_setup_cntl_tab:
2335  0000 89            	pushw	x
2336       00000002      OFST:	set	2
2339  0001 0f02          	clr	(OFST+0,sp)
2340  0003               L765:
2343  0003 7b02          	ld	a,(OFST+0,sp)
2344  0005 5f            	clrw	x
2345  0006 97            	ld	xl,a
2346  0007 d6024e        	ld	a,(__cntl_tab,x)
2347  000a 6b01          	ld	(OFST-1,sp),a
2350  000c 7b01          	ld	a,(OFST-1,sp)
2351  000e 5f            	clrw	x
2352  000f 97            	ld	xl,a
2353  0010 d60040        	ld	a,(_iLF_DEF,x)
2354  0013 5f            	clrw	x
2355  0014 97            	ld	xl,a
2356  0015 7b01          	ld	a,(OFST-1,sp)
2357  0017 905f          	clrw	y
2358  0019 9097          	ld	yl,a
2359  001b d6540c        	ld	a,(21516,x)
2360  001e 90da0000      	or	a,(_bLF_DEF,y)
2361  0022 d7540c        	ld	(21516,x),a
2364  0025 0c02          	inc	(OFST+0,sp)
2367  0027 7b02          	ld	a,(OFST+0,sp)
2368  0029 a108          	cp	a,#8
2369  002b 25d6          	jrult	L765
2373  002d 85            	popw	x
2374  002e 81            	ret
2417                     ; 345 LCD_DISP_FUNC(lcd_disp_setup_c, 1, _cc)
2418                     .text:	section	.text,new
2419  0000               _lcd_disp_setup_c:
2421  0000 89            	pushw	x
2422       00000002      OFST:	set	2
2427  0001 cd0000        	call	_lcd_clear_n
2430  0004 0f02          	clr	(OFST+0,sp)
2431  0006               L316:
2434  0006 7b02          	ld	a,(OFST+0,sp)
2435  0008 5f            	clrw	x
2436  0009 97            	ld	xl,a
2437  000a d601fe        	ld	a,(__cc,x)
2438  000d 6b01          	ld	(OFST-1,sp),a
2441  000f 7b01          	ld	a,(OFST-1,sp)
2442  0011 5f            	clrw	x
2443  0012 97            	ld	xl,a
2444  0013 d60040        	ld	a,(_iLF_DEF,x)
2445  0016 5f            	clrw	x
2446  0017 97            	ld	xl,a
2447  0018 7b01          	ld	a,(OFST-1,sp)
2448  001a 905f          	clrw	y
2449  001c 9097          	ld	yl,a
2450  001e d6540c        	ld	a,(21516,x)
2451  0021 90da0000      	or	a,(_bLF_DEF,y)
2452  0025 d7540c        	ld	(21516,x),a
2455  0028 0c02          	inc	(OFST+0,sp)
2458  002a 0d02          	tnz	(OFST+0,sp)
2459  002c 27d8          	jreq	L316
2463  002e 85            	popw	x
2464  002f 81            	ret
2508                     ; 347 LCD_DISP_FUNC(lcd_disp_setup_link, 6, _link)
2509                     .text:	section	.text,new
2510  0000               _lcd_disp_setup_link:
2512  0000 89            	pushw	x
2513       00000002      OFST:	set	2
2518  0001 cd0000        	call	_lcd_clear_n
2521  0004 0f02          	clr	(OFST+0,sp)
2522  0006               L736:
2525  0006 7b02          	ld	a,(OFST+0,sp)
2526  0008 5f            	clrw	x
2527  0009 97            	ld	xl,a
2528  000a d60235        	ld	a,(__link,x)
2529  000d 6b01          	ld	(OFST-1,sp),a
2532  000f 7b01          	ld	a,(OFST-1,sp)
2533  0011 5f            	clrw	x
2534  0012 97            	ld	xl,a
2535  0013 d60040        	ld	a,(_iLF_DEF,x)
2536  0016 5f            	clrw	x
2537  0017 97            	ld	xl,a
2538  0018 7b01          	ld	a,(OFST-1,sp)
2539  001a 905f          	clrw	y
2540  001c 9097          	ld	yl,a
2541  001e d6540c        	ld	a,(21516,x)
2542  0021 90da0000      	or	a,(_bLF_DEF,y)
2543  0025 d7540c        	ld	(21516,x),a
2546  0028 0c02          	inc	(OFST+0,sp)
2549  002a 7b02          	ld	a,(OFST+0,sp)
2550  002c a106          	cp	a,#6
2551  002e 25d6          	jrult	L736
2555  0030 85            	popw	x
2556  0031 81            	ret
2599                     ; 349 LCD_DISP_FUNC(lcd_disp_setup_run, 8, _run)
2600                     .text:	section	.text,new
2601  0000               _lcd_disp_setup_run:
2603  0000 89            	pushw	x
2604       00000002      OFST:	set	2
2609  0001 cd0000        	call	_lcd_clear_n
2612  0004 0f02          	clr	(OFST+0,sp)
2613  0006               L366:
2616  0006 7b02          	ld	a,(OFST+0,sp)
2617  0008 5f            	clrw	x
2618  0009 97            	ld	xl,a
2619  000a d60225        	ld	a,(__run,x)
2620  000d 6b01          	ld	(OFST-1,sp),a
2623  000f 7b01          	ld	a,(OFST-1,sp)
2624  0011 5f            	clrw	x
2625  0012 97            	ld	xl,a
2626  0013 d60040        	ld	a,(_iLF_DEF,x)
2627  0016 5f            	clrw	x
2628  0017 97            	ld	xl,a
2629  0018 7b01          	ld	a,(OFST-1,sp)
2630  001a 905f          	clrw	y
2631  001c 9097          	ld	yl,a
2632  001e d6540c        	ld	a,(21516,x)
2633  0021 90da0000      	or	a,(_bLF_DEF,y)
2634  0025 d7540c        	ld	(21516,x),a
2637  0028 0c02          	inc	(OFST+0,sp)
2640  002a 7b02          	ld	a,(OFST+0,sp)
2641  002c a108          	cp	a,#8
2642  002e 25d6          	jrult	L366
2646  0030 85            	popw	x
2647  0031 81            	ret
2690                     ; 351 LCD_DISP_FUNC_1(lcd_disp_setup_mode_local, 7, _hcLocal)
2691                     .text:	section	.text,new
2692  0000               _lcd_disp_setup_mode_local:
2694  0000 89            	pushw	x
2695       00000002      OFST:	set	2
2698  0001 0f02          	clr	(OFST+0,sp)
2699  0003               L707:
2702  0003 7b02          	ld	a,(OFST+0,sp)
2703  0005 5f            	clrw	x
2704  0006 97            	ld	xl,a
2705  0007 d60213        	ld	a,(__hcLocal,x)
2706  000a 6b01          	ld	(OFST-1,sp),a
2709  000c 7b01          	ld	a,(OFST-1,sp)
2710  000e 5f            	clrw	x
2711  000f 97            	ld	xl,a
2712  0010 d60040        	ld	a,(_iLF_DEF,x)
2713  0013 5f            	clrw	x
2714  0014 97            	ld	xl,a
2715  0015 7b01          	ld	a,(OFST-1,sp)
2716  0017 905f          	clrw	y
2717  0019 9097          	ld	yl,a
2718  001b d6540c        	ld	a,(21516,x)
2719  001e 90da0000      	or	a,(_bLF_DEF,y)
2720  0022 d7540c        	ld	(21516,x),a
2723  0025 0c02          	inc	(OFST+0,sp)
2726  0027 7b02          	ld	a,(OFST+0,sp)
2727  0029 a107          	cp	a,#7
2728  002b 25d6          	jrult	L707
2732  002d 85            	popw	x
2733  002e 81            	ret
2776                     ; 352 LCD_DISP_FUNC_1(lcd_disp_setup_mode_each, 11, _hcEach)
2777                     .text:	section	.text,new
2778  0000               _lcd_disp_setup_mode_each:
2780  0000 89            	pushw	x
2781       00000002      OFST:	set	2
2784  0001 0f02          	clr	(OFST+0,sp)
2785  0003               L337:
2788  0003 7b02          	ld	a,(OFST+0,sp)
2789  0005 5f            	clrw	x
2790  0006 97            	ld	xl,a
2791  0007 d6021a        	ld	a,(__hcEach,x)
2792  000a 6b01          	ld	(OFST-1,sp),a
2795  000c 7b01          	ld	a,(OFST-1,sp)
2796  000e 5f            	clrw	x
2797  000f 97            	ld	xl,a
2798  0010 d60040        	ld	a,(_iLF_DEF,x)
2799  0013 5f            	clrw	x
2800  0014 97            	ld	xl,a
2801  0015 7b01          	ld	a,(OFST-1,sp)
2802  0017 905f          	clrw	y
2803  0019 9097          	ld	yl,a
2804  001b d6540c        	ld	a,(21516,x)
2805  001e 90da0000      	or	a,(_bLF_DEF,y)
2806  0022 d7540c        	ld	(21516,x),a
2809  0025 0c02          	inc	(OFST+0,sp)
2812  0027 7b02          	ld	a,(OFST+0,sp)
2813  0029 a10b          	cp	a,#11
2814  002b 25d6          	jrult	L337
2818  002d 85            	popw	x
2819  002e 81            	ret
2863                     ; 353 LCD_DISP_FUNC(lcd_disp_setup_mode, 8, _hc)
2864                     .text:	section	.text,new
2865  0000               _lcd_disp_setup_mode:
2867  0000 89            	pushw	x
2868       00000002      OFST:	set	2
2873  0001 cd0000        	call	_lcd_clear_n
2876  0004 0f02          	clr	(OFST+0,sp)
2877  0006               L757:
2880  0006 7b02          	ld	a,(OFST+0,sp)
2881  0008 5f            	clrw	x
2882  0009 97            	ld	xl,a
2883  000a d6022d        	ld	a,(__hc,x)
2884  000d 6b01          	ld	(OFST-1,sp),a
2887  000f 7b01          	ld	a,(OFST-1,sp)
2888  0011 5f            	clrw	x
2889  0012 97            	ld	xl,a
2890  0013 d60040        	ld	a,(_iLF_DEF,x)
2891  0016 5f            	clrw	x
2892  0017 97            	ld	xl,a
2893  0018 7b01          	ld	a,(OFST-1,sp)
2894  001a 905f          	clrw	y
2895  001c 9097          	ld	yl,a
2896  001e d6540c        	ld	a,(21516,x)
2897  0021 90da0000      	or	a,(_bLF_DEF,y)
2898  0025 d7540c        	ld	(21516,x),a
2901  0028 0c02          	inc	(OFST+0,sp)
2904  002a 7b02          	ld	a,(OFST+0,sp)
2905  002c a108          	cp	a,#8
2906  002e 25d6          	jrult	L757
2910  0030 85            	popw	x
2911  0031 81            	ret
2954                     ; 355 LCD_DISP_FUNC(lcd_disp_setup_id, 6, _nid)
2955                     .text:	section	.text,new
2956  0000               _lcd_disp_setup_id:
2958  0000 89            	pushw	x
2959       00000002      OFST:	set	2
2964  0001 cd0000        	call	_lcd_clear_n
2967  0004 0f02          	clr	(OFST+0,sp)
2968  0006               L3001:
2971  0006 7b02          	ld	a,(OFST+0,sp)
2972  0008 5f            	clrw	x
2973  0009 97            	ld	xl,a
2974  000a d601d8        	ld	a,(__nid,x)
2975  000d 6b01          	ld	(OFST-1,sp),a
2978  000f 7b01          	ld	a,(OFST-1,sp)
2979  0011 5f            	clrw	x
2980  0012 97            	ld	xl,a
2981  0013 d60040        	ld	a,(_iLF_DEF,x)
2982  0016 5f            	clrw	x
2983  0017 97            	ld	xl,a
2984  0018 7b01          	ld	a,(OFST-1,sp)
2985  001a 905f          	clrw	y
2986  001c 9097          	ld	yl,a
2987  001e d6540c        	ld	a,(21516,x)
2988  0021 90da0000      	or	a,(_bLF_DEF,y)
2989  0025 d7540c        	ld	(21516,x),a
2992  0028 0c02          	inc	(OFST+0,sp)
2995  002a 7b02          	ld	a,(OFST+0,sp)
2996  002c a106          	cp	a,#6
2997  002e 25d6          	jrult	L3001
3001  0030 85            	popw	x
3002  0031 81            	ret
3045                     ; 356 LCD_DISP_FUNC(lcd_disp_setup_m, 3, _nm)
3046                     .text:	section	.text,new
3047  0000               _lcd_disp_setup_m:
3049  0000 89            	pushw	x
3050       00000002      OFST:	set	2
3055  0001 cd0000        	call	_lcd_clear_n
3058  0004 0f02          	clr	(OFST+0,sp)
3059  0006               L7201:
3062  0006 7b02          	ld	a,(OFST+0,sp)
3063  0008 5f            	clrw	x
3064  0009 97            	ld	xl,a
3065  000a d601a6        	ld	a,(__nm,x)
3066  000d 6b01          	ld	(OFST-1,sp),a
3069  000f 7b01          	ld	a,(OFST-1,sp)
3070  0011 5f            	clrw	x
3071  0012 97            	ld	xl,a
3072  0013 d60040        	ld	a,(_iLF_DEF,x)
3073  0016 5f            	clrw	x
3074  0017 97            	ld	xl,a
3075  0018 7b01          	ld	a,(OFST-1,sp)
3076  001a 905f          	clrw	y
3077  001c 9097          	ld	yl,a
3078  001e d6540c        	ld	a,(21516,x)
3079  0021 90da0000      	or	a,(_bLF_DEF,y)
3080  0025 d7540c        	ld	(21516,x),a
3083  0028 0c02          	inc	(OFST+0,sp)
3086  002a 7b02          	ld	a,(OFST+0,sp)
3087  002c a103          	cp	a,#3
3088  002e 25d6          	jrult	L7201
3092  0030 85            	popw	x
3093  0031 81            	ret
3136                     ; 357 LCD_DISP_FUNC(lcd_disp_setup_cnt, 6, _ncnt)
3137                     .text:	section	.text,new
3138  0000               _lcd_disp_setup_cnt:
3140  0000 89            	pushw	x
3141       00000002      OFST:	set	2
3146  0001 cd0000        	call	_lcd_clear_n
3149  0004 0f02          	clr	(OFST+0,sp)
3150  0006               L3501:
3153  0006 7b02          	ld	a,(OFST+0,sp)
3154  0008 5f            	clrw	x
3155  0009 97            	ld	xl,a
3156  000a d601a9        	ld	a,(__ncnt,x)
3157  000d 6b01          	ld	(OFST-1,sp),a
3160  000f 7b01          	ld	a,(OFST-1,sp)
3161  0011 5f            	clrw	x
3162  0012 97            	ld	xl,a
3163  0013 d60040        	ld	a,(_iLF_DEF,x)
3164  0016 5f            	clrw	x
3165  0017 97            	ld	xl,a
3166  0018 7b01          	ld	a,(OFST-1,sp)
3167  001a 905f          	clrw	y
3168  001c 9097          	ld	yl,a
3169  001e d6540c        	ld	a,(21516,x)
3170  0021 90da0000      	or	a,(_bLF_DEF,y)
3171  0025 d7540c        	ld	(21516,x),a
3174  0028 0c02          	inc	(OFST+0,sp)
3177  002a 7b02          	ld	a,(OFST+0,sp)
3178  002c a106          	cp	a,#6
3179  002e 25d6          	jrult	L3501
3183  0030 85            	popw	x
3184  0031 81            	ret
3228                     ; 358 LCD_DISP_FUNC(lcd_disp_setup_valve, 6, _nvalve)
3229                     .text:	section	.text,new
3230  0000               _lcd_disp_setup_valve:
3232  0000 89            	pushw	x
3233       00000002      OFST:	set	2
3238  0001 cd0000        	call	_lcd_clear_n
3241  0004 0f02          	clr	(OFST+0,sp)
3242  0006               L7701:
3245  0006 7b02          	ld	a,(OFST+0,sp)
3246  0008 5f            	clrw	x
3247  0009 97            	ld	xl,a
3248  000a d601af        	ld	a,(__nvalve,x)
3249  000d 6b01          	ld	(OFST-1,sp),a
3252  000f 7b01          	ld	a,(OFST-1,sp)
3253  0011 5f            	clrw	x
3254  0012 97            	ld	xl,a
3255  0013 d60040        	ld	a,(_iLF_DEF,x)
3256  0016 5f            	clrw	x
3257  0017 97            	ld	xl,a
3258  0018 7b01          	ld	a,(OFST-1,sp)
3259  001a 905f          	clrw	y
3260  001c 9097          	ld	yl,a
3261  001e d6540c        	ld	a,(21516,x)
3262  0021 90da0000      	or	a,(_bLF_DEF,y)
3263  0025 d7540c        	ld	(21516,x),a
3266  0028 0c02          	inc	(OFST+0,sp)
3269  002a 7b02          	ld	a,(OFST+0,sp)
3270  002c a106          	cp	a,#6
3271  002e 25d6          	jrult	L7701
3275  0030 85            	popw	x
3276  0031 81            	ret
3319                     ; 360 LCD_CLEAR_FUNC(lcd_clear_backlight, 8, _bL)
3320                     .text:	section	.text,new
3321  0000               _lcd_clear_backlight:
3323  0000 89            	pushw	x
3324       00000002      OFST:	set	2
3327  0001 0f02          	clr	(OFST+0,sp)
3328  0003               L3211:
3331  0003 7b02          	ld	a,(OFST+0,sp)
3332  0005 5f            	clrw	x
3333  0006 97            	ld	xl,a
3334  0007 d601f1        	ld	a,(__bL,x)
3335  000a 6b01          	ld	(OFST-1,sp),a
3338  000c 7b01          	ld	a,(OFST-1,sp)
3339  000e 5f            	clrw	x
3340  000f 97            	ld	xl,a
3341  0010 d60040        	ld	a,(_iLF_DEF,x)
3342  0013 5f            	clrw	x
3343  0014 97            	ld	xl,a
3344  0015 7b01          	ld	a,(OFST-1,sp)
3345  0017 905f          	clrw	y
3346  0019 9097          	ld	yl,a
3347  001b 90d60000      	ld	a,(_bLF_DEF,y)
3348  001f 43            	cpl	a
3349  0020 d4540c        	and	a,(21516,x)
3350  0023 d7540c        	ld	(21516,x),a
3353  0026 0c02          	inc	(OFST+0,sp)
3356  0028 7b02          	ld	a,(OFST+0,sp)
3357  002a a108          	cp	a,#8
3358  002c 25d5          	jrult	L3211
3362  002e 85            	popw	x
3363  002f 81            	ret
3405                     ; 361 LCD_CLEAR_FUNC(lcd_clear_c, 4, _cc)
3406                     .text:	section	.text,new
3407  0000               _lcd_clear_c:
3409  0000 89            	pushw	x
3410       00000002      OFST:	set	2
3413  0001 0f02          	clr	(OFST+0,sp)
3414  0003               L7411:
3417  0003 7b02          	ld	a,(OFST+0,sp)
3418  0005 5f            	clrw	x
3419  0006 97            	ld	xl,a
3420  0007 d601fe        	ld	a,(__cc,x)
3421  000a 6b01          	ld	(OFST-1,sp),a
3424  000c 7b01          	ld	a,(OFST-1,sp)
3425  000e 5f            	clrw	x
3426  000f 97            	ld	xl,a
3427  0010 d60040        	ld	a,(_iLF_DEF,x)
3428  0013 5f            	clrw	x
3429  0014 97            	ld	xl,a
3430  0015 7b01          	ld	a,(OFST-1,sp)
3431  0017 905f          	clrw	y
3432  0019 9097          	ld	yl,a
3433  001b 90d60000      	ld	a,(_bLF_DEF,y)
3434  001f 43            	cpl	a
3435  0020 d4540c        	and	a,(21516,x)
3436  0023 d7540c        	ld	(21516,x),a
3439  0026 0c02          	inc	(OFST+0,sp)
3442  0028 7b02          	ld	a,(OFST+0,sp)
3443  002a a104          	cp	a,#4
3444  002c 25d5          	jrult	L7411
3448  002e 85            	popw	x
3449  002f 81            	ret
3491                     ; 363 LCD_CLEAR_FUNC(lcd_clear_btn, 5, _btn)
3492                     .text:	section	.text,new
3493  0000               _lcd_clear_btn:
3495  0000 89            	pushw	x
3496       00000002      OFST:	set	2
3499  0001 0f02          	clr	(OFST+0,sp)
3500  0003               L3711:
3503  0003 7b02          	ld	a,(OFST+0,sp)
3504  0005 5f            	clrw	x
3505  0006 97            	ld	xl,a
3506  0007 d601f9        	ld	a,(__btn,x)
3507  000a 6b01          	ld	(OFST-1,sp),a
3510  000c 7b01          	ld	a,(OFST-1,sp)
3511  000e 5f            	clrw	x
3512  000f 97            	ld	xl,a
3513  0010 d60040        	ld	a,(_iLF_DEF,x)
3514  0013 5f            	clrw	x
3515  0014 97            	ld	xl,a
3516  0015 7b01          	ld	a,(OFST-1,sp)
3517  0017 905f          	clrw	y
3518  0019 9097          	ld	yl,a
3519  001b 90d60000      	ld	a,(_bLF_DEF,y)
3520  001f 43            	cpl	a
3521  0020 d4540c        	and	a,(21516,x)
3522  0023 d7540c        	ld	(21516,x),a
3525  0026 0c02          	inc	(OFST+0,sp)
3528  0028 7b02          	ld	a,(OFST+0,sp)
3529  002a a105          	cp	a,#5
3530  002c 25d5          	jrult	L3711
3534  002e 85            	popw	x
3535  002f 81            	ret
3577                     ; 364 LCD_CLEAR_FUNC(lcd_clear_run, 8, _run)
3578                     .text:	section	.text,new
3579  0000               _lcd_clear_run:
3581  0000 89            	pushw	x
3582       00000002      OFST:	set	2
3585  0001 0f02          	clr	(OFST+0,sp)
3586  0003               L7121:
3589  0003 7b02          	ld	a,(OFST+0,sp)
3590  0005 5f            	clrw	x
3591  0006 97            	ld	xl,a
3592  0007 d60225        	ld	a,(__run,x)
3593  000a 6b01          	ld	(OFST-1,sp),a
3596  000c 7b01          	ld	a,(OFST-1,sp)
3597  000e 5f            	clrw	x
3598  000f 97            	ld	xl,a
3599  0010 d60040        	ld	a,(_iLF_DEF,x)
3600  0013 5f            	clrw	x
3601  0014 97            	ld	xl,a
3602  0015 7b01          	ld	a,(OFST-1,sp)
3603  0017 905f          	clrw	y
3604  0019 9097          	ld	yl,a
3605  001b 90d60000      	ld	a,(_bLF_DEF,y)
3606  001f 43            	cpl	a
3607  0020 d4540c        	and	a,(21516,x)
3608  0023 d7540c        	ld	(21516,x),a
3611  0026 0c02          	inc	(OFST+0,sp)
3614  0028 7b02          	ld	a,(OFST+0,sp)
3615  002a a108          	cp	a,#8
3616  002c 25d5          	jrult	L7121
3620  002e 85            	popw	x
3621  002f 81            	ret
3663                     ; 365 LCD_CLEAR_FUNC(lcd_clear_mode, 8, _hc)
3664                     .text:	section	.text,new
3665  0000               _lcd_clear_mode:
3667  0000 89            	pushw	x
3668       00000002      OFST:	set	2
3671  0001 0f02          	clr	(OFST+0,sp)
3672  0003               L3421:
3675  0003 7b02          	ld	a,(OFST+0,sp)
3676  0005 5f            	clrw	x
3677  0006 97            	ld	xl,a
3678  0007 d6022d        	ld	a,(__hc,x)
3679  000a 6b01          	ld	(OFST-1,sp),a
3682  000c 7b01          	ld	a,(OFST-1,sp)
3683  000e 5f            	clrw	x
3684  000f 97            	ld	xl,a
3685  0010 d60040        	ld	a,(_iLF_DEF,x)
3686  0013 5f            	clrw	x
3687  0014 97            	ld	xl,a
3688  0015 7b01          	ld	a,(OFST-1,sp)
3689  0017 905f          	clrw	y
3690  0019 9097          	ld	yl,a
3691  001b 90d60000      	ld	a,(_bLF_DEF,y)
3692  001f 43            	cpl	a
3693  0020 d4540c        	and	a,(21516,x)
3694  0023 d7540c        	ld	(21516,x),a
3697  0026 0c02          	inc	(OFST+0,sp)
3700  0028 7b02          	ld	a,(OFST+0,sp)
3701  002a a108          	cp	a,#8
3702  002c 25d5          	jrult	L3421
3706  002e 85            	popw	x
3707  002f 81            	ret
3749                     ; 366 LCD_CLEAR_FUNC(lcd_clear_n, 35, _n)
3750                     .text:	section	.text,new
3751  0000               _lcd_clear_n:
3753  0000 89            	pushw	x
3754       00000002      OFST:	set	2
3757  0001 0f02          	clr	(OFST+0,sp)
3758  0003               L7621:
3761  0003 7b02          	ld	a,(OFST+0,sp)
3762  0005 5f            	clrw	x
3763  0006 97            	ld	xl,a
3764  0007 d601b5        	ld	a,(__n,x)
3765  000a 6b01          	ld	(OFST-1,sp),a
3768  000c 7b01          	ld	a,(OFST-1,sp)
3769  000e 5f            	clrw	x
3770  000f 97            	ld	xl,a
3771  0010 d60040        	ld	a,(_iLF_DEF,x)
3772  0013 5f            	clrw	x
3773  0014 97            	ld	xl,a
3774  0015 7b01          	ld	a,(OFST-1,sp)
3775  0017 905f          	clrw	y
3776  0019 9097          	ld	yl,a
3777  001b 90d60000      	ld	a,(_bLF_DEF,y)
3778  001f 43            	cpl	a
3779  0020 d4540c        	and	a,(21516,x)
3780  0023 d7540c        	ld	(21516,x),a
3783  0026 0c02          	inc	(OFST+0,sp)
3786  0028 7b02          	ld	a,(OFST+0,sp)
3787  002a a123          	cp	a,#35
3788  002c 25d5          	jrult	L7621
3792  002e 85            	popw	x
3793  002f 81            	ret
3835                     ; 368 LCD_CLEAR_FUNC(lcd_clear_info, 3, _info)
3836                     .text:	section	.text,new
3837  0000               _lcd_clear_info:
3839  0000 89            	pushw	x
3840       00000002      OFST:	set	2
3843  0001 0f02          	clr	(OFST+0,sp)
3844  0003               L3131:
3847  0003 7b02          	ld	a,(OFST+0,sp)
3848  0005 5f            	clrw	x
3849  0006 97            	ld	xl,a
3850  0007 d601de        	ld	a,(__info,x)
3851  000a 6b01          	ld	(OFST-1,sp),a
3854  000c 7b01          	ld	a,(OFST-1,sp)
3855  000e 5f            	clrw	x
3856  000f 97            	ld	xl,a
3857  0010 d60040        	ld	a,(_iLF_DEF,x)
3858  0013 5f            	clrw	x
3859  0014 97            	ld	xl,a
3860  0015 7b01          	ld	a,(OFST-1,sp)
3861  0017 905f          	clrw	y
3862  0019 9097          	ld	yl,a
3863  001b 90d60000      	ld	a,(_bLF_DEF,y)
3864  001f 43            	cpl	a
3865  0020 d4540c        	and	a,(21516,x)
3866  0023 d7540c        	ld	(21516,x),a
3869  0026 0c02          	inc	(OFST+0,sp)
3872  0028 7b02          	ld	a,(OFST+0,sp)
3873  002a a103          	cp	a,#3
3874  002c 25d5          	jrult	L3131
3878  002e 85            	popw	x
3879  002f 81            	ret
3921                     ; 374 LCD_CLEAR_FUNC(lcd_clear_rid, 16, _rid)
3922                     .text:	section	.text,new
3923  0000               _lcd_clear_rid:
3925  0000 89            	pushw	x
3926       00000002      OFST:	set	2
3929  0001 0f02          	clr	(OFST+0,sp)
3930  0003               L7331:
3933  0003 7b02          	ld	a,(OFST+0,sp)
3934  0005 5f            	clrw	x
3935  0006 97            	ld	xl,a
3936  0007 d601e1        	ld	a,(__rid,x)
3937  000a 6b01          	ld	(OFST-1,sp),a
3940  000c 7b01          	ld	a,(OFST-1,sp)
3941  000e 5f            	clrw	x
3942  000f 97            	ld	xl,a
3943  0010 d60040        	ld	a,(_iLF_DEF,x)
3944  0013 5f            	clrw	x
3945  0014 97            	ld	xl,a
3946  0015 7b01          	ld	a,(OFST-1,sp)
3947  0017 905f          	clrw	y
3948  0019 9097          	ld	yl,a
3949  001b 90d60000      	ld	a,(_bLF_DEF,y)
3950  001f 43            	cpl	a
3951  0020 d4540c        	and	a,(21516,x)
3952  0023 d7540c        	ld	(21516,x),a
3955  0026 0c02          	inc	(OFST+0,sp)
3958  0028 7b02          	ld	a,(OFST+0,sp)
3959  002a a110          	cp	a,#16
3960  002c 25d5          	jrult	L7331
3964  002e 85            	popw	x
3965  002f 81            	ret
4007                     ; 376 LCD_CLEAR_FUNC(lcd_clear_m, 3, _nm)
4008                     .text:	section	.text,new
4009  0000               _lcd_clear_m:
4011  0000 89            	pushw	x
4012       00000002      OFST:	set	2
4015  0001 0f02          	clr	(OFST+0,sp)
4016  0003               L3631:
4019  0003 7b02          	ld	a,(OFST+0,sp)
4020  0005 5f            	clrw	x
4021  0006 97            	ld	xl,a
4022  0007 d601a6        	ld	a,(__nm,x)
4023  000a 6b01          	ld	(OFST-1,sp),a
4026  000c 7b01          	ld	a,(OFST-1,sp)
4027  000e 5f            	clrw	x
4028  000f 97            	ld	xl,a
4029  0010 d60040        	ld	a,(_iLF_DEF,x)
4030  0013 5f            	clrw	x
4031  0014 97            	ld	xl,a
4032  0015 7b01          	ld	a,(OFST-1,sp)
4033  0017 905f          	clrw	y
4034  0019 9097          	ld	yl,a
4035  001b 90d60000      	ld	a,(_bLF_DEF,y)
4036  001f 43            	cpl	a
4037  0020 d4540c        	and	a,(21516,x)
4038  0023 d7540c        	ld	(21516,x),a
4041  0026 0c02          	inc	(OFST+0,sp)
4044  0028 7b02          	ld	a,(OFST+0,sp)
4045  002a a103          	cp	a,#3
4046  002c 25d5          	jrult	L3631
4050  002e 85            	popw	x
4051  002f 81            	ret
4093                     ; 377 LCD_CLEAR_FUNC(lcd_clear_cnt, 6, _ncnt)
4094                     .text:	section	.text,new
4095  0000               _lcd_clear_cnt:
4097  0000 89            	pushw	x
4098       00000002      OFST:	set	2
4101  0001 0f02          	clr	(OFST+0,sp)
4102  0003               L7041:
4105  0003 7b02          	ld	a,(OFST+0,sp)
4106  0005 5f            	clrw	x
4107  0006 97            	ld	xl,a
4108  0007 d601a9        	ld	a,(__ncnt,x)
4109  000a 6b01          	ld	(OFST-1,sp),a
4112  000c 7b01          	ld	a,(OFST-1,sp)
4113  000e 5f            	clrw	x
4114  000f 97            	ld	xl,a
4115  0010 d60040        	ld	a,(_iLF_DEF,x)
4116  0013 5f            	clrw	x
4117  0014 97            	ld	xl,a
4118  0015 7b01          	ld	a,(OFST-1,sp)
4119  0017 905f          	clrw	y
4120  0019 9097          	ld	yl,a
4121  001b 90d60000      	ld	a,(_bLF_DEF,y)
4122  001f 43            	cpl	a
4123  0020 d4540c        	and	a,(21516,x)
4124  0023 d7540c        	ld	(21516,x),a
4127  0026 0c02          	inc	(OFST+0,sp)
4130  0028 7b02          	ld	a,(OFST+0,sp)
4131  002a a106          	cp	a,#6
4132  002c 25d5          	jrult	L7041
4136  002e 85            	popw	x
4137  002f 81            	ret
4186                     ; 379 void	lcd_clear_npos(uint8_t pos, uint8_t type)
4186                     ; 380 {
4187                     .text:	section	.text,new
4188  0000               _lcd_clear_npos:
4190  0000 89            	pushw	x
4191  0001 89            	pushw	x
4192       00000002      OFST:	set	2
4195                     ; 382 	pos = pos*7;
4197  0002 ae0007        	ldw	x,#7
4198  0005 7b03          	ld	a,(OFST+1,sp)
4199  0007 42            	mul	x,a
4200  0008 9f            	ld	a,xl
4201  0009 6b03          	ld	(OFST+1,sp),a
4202                     ; 383 	for( i=0; i<7; i++ )
4204  000b 0f01          	clr	(OFST-1,sp)
4205  000d               L5341:
4206                     ; 385 		j = _n[pos++];
4208  000d 7b03          	ld	a,(OFST+1,sp)
4209  000f 97            	ld	xl,a
4210  0010 0c03          	inc	(OFST+1,sp)
4211  0012 9f            	ld	a,xl
4212  0013 5f            	clrw	x
4213  0014 97            	ld	xl,a
4214  0015 d601b5        	ld	a,(__n,x)
4215  0018 6b02          	ld	(OFST+0,sp),a
4216                     ; 386 		LCD_BIT_CLEAR(j);
4218  001a 7b02          	ld	a,(OFST+0,sp)
4219  001c 5f            	clrw	x
4220  001d 97            	ld	xl,a
4221  001e d60040        	ld	a,(_iLF_DEF,x)
4222  0021 5f            	clrw	x
4223  0022 97            	ld	xl,a
4224  0023 7b02          	ld	a,(OFST+0,sp)
4225  0025 905f          	clrw	y
4226  0027 9097          	ld	yl,a
4227  0029 90d60000      	ld	a,(_bLF_DEF,y)
4228  002d 43            	cpl	a
4229  002e d4540c        	and	a,(21516,x)
4230  0031 d7540c        	ld	(21516,x),a
4231                     ; 383 	for( i=0; i<7; i++ )
4233  0034 0c01          	inc	(OFST-1,sp)
4236  0036 7b01          	ld	a,(OFST-1,sp)
4237  0038 a107          	cp	a,#7
4238  003a 25d1          	jrult	L5341
4239                     ; 388 }
4242  003c 5b04          	addw	sp,#4
4243  003e 81            	ret
4275                     ; 390 void	lcd_disp_all(void)
4275                     ; 391 {
4276                     .text:	section	.text,new
4277  0000               _lcd_disp_all:
4279  0000 88            	push	a
4280       00000001      OFST:	set	1
4283                     ; 393 	for( i=0; i<15; i++ )
4285  0001 0f01          	clr	(OFST+0,sp)
4286  0003               L7541:
4287                     ; 394 		LCD->RAM[i] = 0xff;
4289  0003 7b01          	ld	a,(OFST+0,sp)
4290  0005 5f            	clrw	x
4291  0006 97            	ld	xl,a
4292  0007 a6ff          	ld	a,#255
4293  0009 d7540c        	ld	(21516,x),a
4294                     ; 393 	for( i=0; i<15; i++ )
4296  000c 0c01          	inc	(OFST+0,sp)
4299  000e 7b01          	ld	a,(OFST+0,sp)
4300  0010 a10f          	cp	a,#15
4301  0012 25ef          	jrult	L7541
4302                     ; 395 }
4305  0014 84            	pop	a
4306  0015 81            	ret
4345                     ; 397 void	lcd_clear(uint8_t type)
4345                     ; 398 {
4346                     .text:	section	.text,new
4347  0000               _lcd_clear:
4349  0000 88            	push	a
4350       00000001      OFST:	set	1
4353                     ; 400 	for( i=0; i<15; i++ )
4355  0001 0f01          	clr	(OFST+0,sp)
4356  0003               L3051:
4357                     ; 401 		LCD->RAM[i] = 0;
4359  0003 7b01          	ld	a,(OFST+0,sp)
4360  0005 5f            	clrw	x
4361  0006 97            	ld	xl,a
4362  0007 724f540c      	clr	(21516,x)
4363                     ; 400 	for( i=0; i<15; i++ )
4365  000b 0c01          	inc	(OFST+0,sp)
4368  000d 7b01          	ld	a,(OFST+0,sp)
4369  000f a10f          	cp	a,#15
4370  0011 25f0          	jrult	L3051
4371                     ; 402 }
4374  0013 84            	pop	a
4375  0014 81            	ret
4422                     ; 404 uint8_t	*lcd_get_npos(uint8_t i)
4422                     ; 405 {
4423                     .text:	section	.text,new
4424  0000               _lcd_get_npos:
4426  0000 89            	pushw	x
4427       00000002      OFST:	set	2
4430                     ; 407 	switch( i )
4433                     ; 420 	case 3:	p = _nd;	break;
4434  0001 4d            	tnz	a
4435  0002 270b          	jreq	L1151
4436  0004 4a            	dec	a
4437  0005 270f          	jreq	L3151
4438  0007 4a            	dec	a
4439  0008 2713          	jreq	L5151
4440  000a 4a            	dec	a
4441  000b 2717          	jreq	L7151
4442  000d 201a          	jra	L3451
4443  000f               L1151:
4444                     ; 417 	case 0:	p = _na;	break;
4446  000f ae0080        	ldw	x,#__na
4447  0012 1f01          	ldw	(OFST-1,sp),x
4450  0014 2013          	jra	L3451
4451  0016               L3151:
4452                     ; 418 	case 1:	p = _nb;	break;
4454  0016 ae00c6        	ldw	x,#__nb
4455  0019 1f01          	ldw	(OFST-1,sp),x
4458  001b 200c          	jra	L3451
4459  001d               L5151:
4460                     ; 419 	case 2:	p = _nc;	break;
4462  001d ae010c        	ldw	x,#__nc
4463  0020 1f01          	ldw	(OFST-1,sp),x
4466  0022 2005          	jra	L3451
4467  0024               L7151:
4468                     ; 420 	case 3:	p = _nd;	break;
4470  0024 ae0152        	ldw	x,#__nd
4471  0027 1f01          	ldw	(OFST-1,sp),x
4474  0029               L3451:
4475                     ; 423 	return p;
4477  0029 1e01          	ldw	x,(OFST-1,sp)
4480  002b 5b02          	addw	sp,#2
4481  002d 81            	ret
4548                     ; 426 void	lcd_disp_n(uint8_t pos, uint8_t n)
4548                     ; 427 {
4549                     .text:	section	.text,new
4550  0000               _lcd_disp_n:
4552  0000 89            	pushw	x
4553  0001 5204          	subw	sp,#4
4554       00000004      OFST:	set	4
4557                     ; 431 	lcd_clear_npos(pos, 0);
4559  0003 5f            	clrw	x
4560  0004 7b05          	ld	a,(OFST+1,sp)
4561  0006 95            	ld	xh,a
4562  0007 cd0000        	call	_lcd_clear_npos
4564                     ; 432 	p = lcd_get_npos(pos);
4566  000a 7b05          	ld	a,(OFST+1,sp)
4567  000c cd0000        	call	_lcd_get_npos
4569  000f 1f02          	ldw	(OFST-2,sp),x
4570                     ; 433 	p = p+n*7;
4572  0011 7b06          	ld	a,(OFST+2,sp)
4573  0013 97            	ld	xl,a
4574  0014 a607          	ld	a,#7
4575  0016 42            	mul	x,a
4576  0017 72fb02        	addw	x,(OFST-2,sp)
4577  001a 1f02          	ldw	(OFST-2,sp),x
4578                     ; 434 	for( i=0; i<7; i++ )
4580  001c 0f04          	clr	(OFST+0,sp)
4581  001e               L3751:
4582                     ; 436 		if( p[i] != 0 )
4584  001e 7b02          	ld	a,(OFST-2,sp)
4585  0020 97            	ld	xl,a
4586  0021 7b03          	ld	a,(OFST-1,sp)
4587  0023 1b04          	add	a,(OFST+0,sp)
4588  0025 2401          	jrnc	L431
4589  0027 5c            	incw	x
4590  0028               L431:
4591  0028 02            	rlwa	x,a
4592  0029 7d            	tnz	(x)
4593  002a 2727          	jreq	L1061
4594                     ; 438 			j = p[i];
4596  002c 7b02          	ld	a,(OFST-2,sp)
4597  002e 97            	ld	xl,a
4598  002f 7b03          	ld	a,(OFST-1,sp)
4599  0031 1b04          	add	a,(OFST+0,sp)
4600  0033 2401          	jrnc	L631
4601  0035 5c            	incw	x
4602  0036               L631:
4603  0036 02            	rlwa	x,a
4604  0037 f6            	ld	a,(x)
4605  0038 6b01          	ld	(OFST-3,sp),a
4606                     ; 439 			LCD_BIT_SET(j);
4608  003a 7b01          	ld	a,(OFST-3,sp)
4609  003c 5f            	clrw	x
4610  003d 97            	ld	xl,a
4611  003e d60040        	ld	a,(_iLF_DEF,x)
4612  0041 5f            	clrw	x
4613  0042 97            	ld	xl,a
4614  0043 7b01          	ld	a,(OFST-3,sp)
4615  0045 905f          	clrw	y
4616  0047 9097          	ld	yl,a
4617  0049 d6540c        	ld	a,(21516,x)
4618  004c 90da0000      	or	a,(_bLF_DEF,y)
4619  0050 d7540c        	ld	(21516,x),a
4620  0053               L1061:
4621                     ; 434 	for( i=0; i<7; i++ )
4623  0053 0c04          	inc	(OFST+0,sp)
4626  0055 7b04          	ld	a,(OFST+0,sp)
4627  0057 a107          	cp	a,#7
4628  0059 25c3          	jrult	L3751
4629                     ; 442 }
4632  005b 5b06          	addw	sp,#6
4633  005d 81            	ret
4690                     ; 446 void	lcd_disp_err(uint8_t n)
4690                     ; 447 {
4691                     .text:	section	.text,new
4692  0000               _lcd_disp_err:
4694  0000 88            	push	a
4695  0001 5204          	subw	sp,#4
4696       00000004      OFST:	set	4
4699                     ; 450 	LCD_CE;
4701  0003 72165402      	bset	21506,#3
4702                     ; 451 	lcd_clear_n();
4704  0007 cd0000        	call	_lcd_clear_n
4706                     ; 452 	p = error_type==1 ? _nerrBr : _nerr;
4708  000a c60000        	ld	a,_error_type
4709  000d a101          	cp	a,#1
4710  000f 2605          	jrne	L241
4711  0011 ae019f        	ldw	x,#__nerrBr
4712  0014 2003          	jra	L441
4713  0016               L241:
4714  0016 ae0198        	ldw	x,#__nerr
4715  0019               L441:
4716  0019 1f02          	ldw	(OFST-2,sp),x
4717                     ; 453 	for( i=0; i<7; i++ )
4719  001b 0f04          	clr	(OFST+0,sp)
4720  001d               L7261:
4721                     ; 455 		LCD_BIT_SET(p[i]);
4723  001d 7b02          	ld	a,(OFST-2,sp)
4724  001f 97            	ld	xl,a
4725  0020 7b03          	ld	a,(OFST-1,sp)
4726  0022 1b04          	add	a,(OFST+0,sp)
4727  0024 2401          	jrnc	L641
4728  0026 5c            	incw	x
4729  0027               L641:
4730  0027 02            	rlwa	x,a
4731  0028 f6            	ld	a,(x)
4732  0029 5f            	clrw	x
4733  002a 97            	ld	xl,a
4734  002b d60000        	ld	a,(_bLF_DEF,x)
4735  002e 6b01          	ld	(OFST-3,sp),a
4736  0030 7b02          	ld	a,(OFST-2,sp)
4737  0032 97            	ld	xl,a
4738  0033 7b03          	ld	a,(OFST-1,sp)
4739  0035 1b04          	add	a,(OFST+0,sp)
4740  0037 2401          	jrnc	L051
4741  0039 5c            	incw	x
4742  003a               L051:
4743  003a 02            	rlwa	x,a
4744  003b f6            	ld	a,(x)
4745  003c 5f            	clrw	x
4746  003d 97            	ld	xl,a
4747  003e d60040        	ld	a,(_iLF_DEF,x)
4748  0041 5f            	clrw	x
4749  0042 97            	ld	xl,a
4750  0043 d6540c        	ld	a,(21516,x)
4751  0046 1a01          	or	a,(OFST-3,sp)
4752  0048 d7540c        	ld	(21516,x),a
4753                     ; 453 	for( i=0; i<7; i++ )
4755  004b 0c04          	inc	(OFST+0,sp)
4758  004d 7b04          	ld	a,(OFST+0,sp)
4759  004f a107          	cp	a,#7
4760  0051 25ca          	jrult	L7261
4761                     ; 457 	if( uiInfo.mode == 1 )
4763  0053 c60008        	ld	a,_uiInfo+8
4764  0056 a101          	cp	a,#1
4765  0058 2706          	jreq	L3061
4766                     ; 466 		if( n==30 )
4768  005a 7b05          	ld	a,(OFST+1,sp)
4769  005c a11e          	cp	a,#30
4770  005e 2620          	jrne	L7361
4771                     ; 467 			goto Print;
4772  0060               L3061:
4773                     ; 459 Print:		
4773                     ; 460 //		LCD_BIT_SET(bCOL);
4773                     ; 461 		lcd_disp_n(2, n/10);
4775  0060 7b05          	ld	a,(OFST+1,sp)
4776  0062 5f            	clrw	x
4777  0063 97            	ld	xl,a
4778  0064 a60a          	ld	a,#10
4779  0066 62            	div	x,a
4780  0067 9f            	ld	a,xl
4781  0068 97            	ld	xl,a
4782  0069 a602          	ld	a,#2
4783  006b 95            	ld	xh,a
4784  006c cd0000        	call	_lcd_disp_n
4786                     ; 462 		lcd_disp_n(3, n%10);
4788  006f 7b05          	ld	a,(OFST+1,sp)
4789  0071 5f            	clrw	x
4790  0072 97            	ld	xl,a
4791  0073 a60a          	ld	a,#10
4792  0075 62            	div	x,a
4793  0076 5f            	clrw	x
4794  0077 97            	ld	xl,a
4795  0078 9f            	ld	a,xl
4796  0079 97            	ld	xl,a
4797  007a a603          	ld	a,#3
4798  007c 95            	ld	xh,a
4799  007d cd0000        	call	_lcd_disp_n
4802  0080               L7361:
4803                     ; 469 }
4806  0080 5b05          	addw	sp,#5
4807  0082 81            	ret
4864                     ; 471 void	lcd_disp_rid(uint8_t id, uint8_t mode, uint8_t multi)
4864                     ; 472 {
4865                     .text:	section	.text,new
4866  0000               _lcd_disp_rid:
4868  0000 89            	pushw	x
4869  0001 88            	push	a
4870       00000001      OFST:	set	1
4873                     ; 477 	LCD_CE;
4875  0002 72165402      	bset	21506,#3
4876                     ; 478 	if( multi == 0 )
4878  0006 0d06          	tnz	(OFST+5,sp)
4879  0008 2603          	jrne	L5661
4880                     ; 484 		lcd_clear_rid();
4882  000a cd0000        	call	_lcd_clear_rid
4884  000d               L5661:
4885                     ; 487 	if( id != 0 )
4887  000d 0d02          	tnz	(OFST+1,sp)
4888  000f 2702          	jreq	L7661
4889                     ; 488 		id -= 1;
4891  0011 0a02          	dec	(OFST+1,sp)
4892  0013               L7661:
4893                     ; 504 	if( mode != 0 )
4895  0013 0d03          	tnz	(OFST+2,sp)
4896  0015 2725          	jreq	L1761
4897                     ; 506 		j = _rid[id*2+1];
4899  0017 7b02          	ld	a,(OFST+1,sp)
4900  0019 5f            	clrw	x
4901  001a 97            	ld	xl,a
4902  001b 58            	sllw	x
4903  001c d601e2        	ld	a,(__rid+1,x)
4904  001f 6b01          	ld	(OFST+0,sp),a
4905                     ; 507 		LCD_BIT_SET(j);
4907  0021 7b01          	ld	a,(OFST+0,sp)
4908  0023 5f            	clrw	x
4909  0024 97            	ld	xl,a
4910  0025 d60040        	ld	a,(_iLF_DEF,x)
4911  0028 5f            	clrw	x
4912  0029 97            	ld	xl,a
4913  002a 7b01          	ld	a,(OFST+0,sp)
4914  002c 905f          	clrw	y
4915  002e 9097          	ld	yl,a
4916  0030 d6540c        	ld	a,(21516,x)
4917  0033 90da0000      	or	a,(_bLF_DEF,y)
4918  0037 d7540c        	ld	(21516,x),a
4920  003a 2024          	jra	L3761
4921  003c               L1761:
4922                     ; 509 		j = _rid[id*2+1];
4924  003c 7b02          	ld	a,(OFST+1,sp)
4925  003e 5f            	clrw	x
4926  003f 97            	ld	xl,a
4927  0040 58            	sllw	x
4928  0041 d601e2        	ld	a,(__rid+1,x)
4929  0044 6b01          	ld	(OFST+0,sp),a
4930                     ; 510 		LCD_BIT_CLEAR(j);
4932  0046 7b01          	ld	a,(OFST+0,sp)
4933  0048 5f            	clrw	x
4934  0049 97            	ld	xl,a
4935  004a d60040        	ld	a,(_iLF_DEF,x)
4936  004d 5f            	clrw	x
4937  004e 97            	ld	xl,a
4938  004f 7b01          	ld	a,(OFST+0,sp)
4939  0051 905f          	clrw	y
4940  0053 9097          	ld	yl,a
4941  0055 90d60000      	ld	a,(_bLF_DEF,y)
4942  0059 43            	cpl	a
4943  005a d4540c        	and	a,(21516,x)
4944  005d d7540c        	ld	(21516,x),a
4945  0060               L3761:
4946                     ; 512 	j = _rid[id*2];
4948  0060 7b02          	ld	a,(OFST+1,sp)
4949  0062 5f            	clrw	x
4950  0063 97            	ld	xl,a
4951  0064 58            	sllw	x
4952  0065 d601e1        	ld	a,(__rid,x)
4953  0068 6b01          	ld	(OFST+0,sp),a
4954                     ; 513 	LCD_BIT_SET(j);
4956  006a 7b01          	ld	a,(OFST+0,sp)
4957  006c 5f            	clrw	x
4958  006d 97            	ld	xl,a
4959  006e d60040        	ld	a,(_iLF_DEF,x)
4960  0071 5f            	clrw	x
4961  0072 97            	ld	xl,a
4962  0073 7b01          	ld	a,(OFST+0,sp)
4963  0075 905f          	clrw	y
4964  0077 9097          	ld	yl,a
4965  0079 d6540c        	ld	a,(21516,x)
4966  007c 90da0000      	or	a,(_bLF_DEF,y)
4967  0080 d7540c        	ld	(21516,x),a
4968                     ; 515 }
4971  0083 5b03          	addw	sp,#3
4972  0085 81            	ret
5021                     ; 518 void	lcd_clear_rid_n(uint8_t id, uint8_t mode)
5021                     ; 519 {
5022                     .text:	section	.text,new
5023  0000               _lcd_clear_rid_n:
5025  0000 89            	pushw	x
5026  0001 88            	push	a
5027       00000001      OFST:	set	1
5030                     ; 521 	LCD_CE;
5032  0002 72165402      	bset	21506,#3
5033                     ; 523 	if( id != 0 )
5035  0006 9e            	ld	a,xh
5036  0007 4d            	tnz	a
5037  0008 2702          	jreq	L5171
5038                     ; 524 		id -= 1;
5040  000a 0a02          	dec	(OFST+1,sp)
5041  000c               L5171:
5042                     ; 526 	if( mode != 0 )
5044  000c 0d03          	tnz	(OFST+2,sp)
5045  000e 2724          	jreq	L7171
5046                     ; 528 		j = _rid[id*2+1];
5048  0010 7b02          	ld	a,(OFST+1,sp)
5049  0012 5f            	clrw	x
5050  0013 97            	ld	xl,a
5051  0014 58            	sllw	x
5052  0015 d601e2        	ld	a,(__rid+1,x)
5053  0018 6b01          	ld	(OFST+0,sp),a
5054                     ; 529 		LCD_BIT_CLEAR(j);
5056  001a 7b01          	ld	a,(OFST+0,sp)
5057  001c 5f            	clrw	x
5058  001d 97            	ld	xl,a
5059  001e d60040        	ld	a,(_iLF_DEF,x)
5060  0021 5f            	clrw	x
5061  0022 97            	ld	xl,a
5062  0023 7b01          	ld	a,(OFST+0,sp)
5063  0025 905f          	clrw	y
5064  0027 9097          	ld	yl,a
5065  0029 90d60000      	ld	a,(_bLF_DEF,y)
5066  002d 43            	cpl	a
5067  002e d4540c        	and	a,(21516,x)
5068  0031 d7540c        	ld	(21516,x),a
5069  0034               L7171:
5070                     ; 531 	j = _rid[id*2];
5072  0034 7b02          	ld	a,(OFST+1,sp)
5073  0036 5f            	clrw	x
5074  0037 97            	ld	xl,a
5075  0038 58            	sllw	x
5076  0039 d601e1        	ld	a,(__rid,x)
5077  003c 6b01          	ld	(OFST+0,sp),a
5078                     ; 532 	LCD_BIT_CLEAR(j);
5080  003e 7b01          	ld	a,(OFST+0,sp)
5081  0040 5f            	clrw	x
5082  0041 97            	ld	xl,a
5083  0042 d60040        	ld	a,(_iLF_DEF,x)
5084  0045 5f            	clrw	x
5085  0046 97            	ld	xl,a
5086  0047 7b01          	ld	a,(OFST+0,sp)
5087  0049 905f          	clrw	y
5088  004b 9097          	ld	yl,a
5089  004d 90d60000      	ld	a,(_bLF_DEF,y)
5090  0051 43            	cpl	a
5091  0052 d4540c        	and	a,(21516,x)
5092  0055 d7540c        	ld	(21516,x),a
5093                     ; 533 }
5096  0058 5b03          	addw	sp,#3
5097  005a 81            	ret
5138                     ; 534 void	lcd_disp_cmd(uint8_t cmd, uint8_t mode, uint8_t multi)
5138                     ; 535 {
5139                     .text:	section	.text,new
5140  0000               _lcd_disp_cmd:
5142  0000 88            	push	a
5143       00000001      OFST:	set	1
5146                     ; 537 	LCD_CE;
5148  0001 72165402      	bset	21506,#3
5149                     ; 547 	LCD_BIT_SET(j);
5151  0005 7b01          	ld	a,(OFST+0,sp)
5152  0007 5f            	clrw	x
5153  0008 97            	ld	xl,a
5154  0009 d60040        	ld	a,(_iLF_DEF,x)
5155  000c 5f            	clrw	x
5156  000d 97            	ld	xl,a
5157  000e 7b01          	ld	a,(OFST+0,sp)
5158  0010 905f          	clrw	y
5159  0012 9097          	ld	yl,a
5160  0014 d6540c        	ld	a,(21516,x)
5161  0017 90da0000      	or	a,(_bLF_DEF,y)
5162  001b d7540c        	ld	(21516,x),a
5163                     ; 548 }
5166  001e 84            	pop	a
5167  001f 81            	ret
5202                     ; 550 void	lcd_disp_info_fire(uint8_t mode)
5202                     ; 551 {
5203                     .text:	section	.text,new
5204  0000               _lcd_disp_info_fire:
5208                     ; 552 	if( mode == 0 )
5210  0000 4d            	tnz	a
5211  0001 2606          	jrne	L3571
5212                     ; 553 		LCD_BIT_CLEAR(_info[0]);
5214  0003 721b540c      	bres	21516,#5
5216  0007 2004          	jra	L5571
5217  0009               L3571:
5218                     ; 555 		LCD_BIT_SET(_info[0]);
5220  0009 721a540c      	bset	21516,#5
5221  000d               L5571:
5222                     ; 556 }
5225  000d 81            	ret
5261                     ; 558 void	lcd_disp_info_shower(uint8_t mode, uint8_t para)
5261                     ; 559 {
5262                     .text:	section	.text,new
5263  0000               _lcd_disp_info_shower:
5265  0000 89            	pushw	x
5266       00000000      OFST:	set	0
5269                     ; 560 	if( (mode & 0x80) != 0 )
5271  0001 9e            	ld	a,xh
5272  0002 a580          	bcp	a,#128
5273  0004 2707          	jreq	L3771
5274                     ; 561 		lcd_blink_item(_info[2]);
5276  0006 a60b          	ld	a,#11
5277  0008 cd0000        	call	_lcd_blink_item
5280  000b 2010          	jra	L5771
5281  000d               L3771:
5282                     ; 563 	else if( (mode &0x08) != 0 )
5284  000d 7b01          	ld	a,(OFST+1,sp)
5285  000f a508          	bcp	a,#8
5286  0011 2707          	jreq	L7771
5287                     ; 564 		lcd_blink_item(_info[1]);
5289  0013 a60a          	ld	a,#10
5290  0015 cd0000        	call	_lcd_blink_item
5293  0018 2003          	jra	L5771
5294  001a               L7771:
5295                     ; 566 		lcd_blink_clear();
5297  001a cd0000        	call	_lcd_blink_clear
5299  001d               L5771:
5300                     ; 568 }
5303  001d 85            	popw	x
5304  001e 81            	ret
5361                     ; 570 void	lcd_disp_info(uint8_t info, uint8_t mode, uint8_t multi)
5361                     ; 571 {
5362                     .text:	section	.text,new
5363  0000               _lcd_disp_info:
5365  0000 89            	pushw	x
5366  0001 88            	push	a
5367       00000001      OFST:	set	1
5370                     ; 573 	LCD_CE;
5372  0002 72165402      	bset	21506,#3
5373                     ; 574 	if( multi == 0 )
5375  0006 0d06          	tnz	(OFST+5,sp)
5376  0008 2603          	jrne	L5202
5377                     ; 575 		lcd_clear_info();
5379  000a cd0000        	call	_lcd_clear_info
5381  000d               L5202:
5382                     ; 580 	j = _info[info];
5384  000d 7b02          	ld	a,(OFST+1,sp)
5385  000f 5f            	clrw	x
5386  0010 97            	ld	xl,a
5387  0011 d601de        	ld	a,(__info,x)
5388  0014 6b01          	ld	(OFST+0,sp),a
5389                     ; 581 	if( mode == 1 )
5391  0016 7b03          	ld	a,(OFST+2,sp)
5392  0018 a101          	cp	a,#1
5393  001a 261c          	jrne	L7202
5394                     ; 582 		LCD_BIT_CLEAR(j);
5396  001c 7b01          	ld	a,(OFST+0,sp)
5397  001e 5f            	clrw	x
5398  001f 97            	ld	xl,a
5399  0020 d60040        	ld	a,(_iLF_DEF,x)
5400  0023 5f            	clrw	x
5401  0024 97            	ld	xl,a
5402  0025 7b01          	ld	a,(OFST+0,sp)
5403  0027 905f          	clrw	y
5404  0029 9097          	ld	yl,a
5405  002b 90d60000      	ld	a,(_bLF_DEF,y)
5406  002f 43            	cpl	a
5407  0030 d4540c        	and	a,(21516,x)
5408  0033 d7540c        	ld	(21516,x),a
5410  0036 2019          	jra	L1302
5411  0038               L7202:
5412                     ; 584 		LCD_BIT_SET(j);
5414  0038 7b01          	ld	a,(OFST+0,sp)
5415  003a 5f            	clrw	x
5416  003b 97            	ld	xl,a
5417  003c d60040        	ld	a,(_iLF_DEF,x)
5418  003f 5f            	clrw	x
5419  0040 97            	ld	xl,a
5420  0041 7b01          	ld	a,(OFST+0,sp)
5421  0043 905f          	clrw	y
5422  0045 9097          	ld	yl,a
5423  0047 d6540c        	ld	a,(21516,x)
5424  004a 90da0000      	or	a,(_bLF_DEF,y)
5425  004e d7540c        	ld	(21516,x),a
5426  0051               L1302:
5427                     ; 585 }
5430  0051 5b03          	addw	sp,#3
5431  0053 81            	ret
5434                     	switch	.data
5435  0000               ___i:
5436  0000 00            	dc.b	0
5476                     ; 599 void	lcd_disp(uint8_t id, uint8_t enable)
5476                     ; 600 {
5477                     .text:	section	.text,new
5478  0000               _lcd_disp:
5480  0000 89            	pushw	x
5481       00000000      OFST:	set	0
5484                     ; 603 	LCD_CE;
5486  0001 72165402      	bset	21506,#3
5487                     ; 604 	if( enable == 1 )
5489  0005 9f            	ld	a,xl
5490  0006 a101          	cp	a,#1
5491  0008 263d          	jrne	L1502
5492                     ; 606 		lcd_clear(0);
5494  000a 4f            	clr	a
5495  000b cd0000        	call	_lcd_clear
5497                     ; 607 		__i = (__i+1) % 10;
5499  000e c60000        	ld	a,___i
5500  0011 5f            	clrw	x
5501  0012 97            	ld	xl,a
5502  0013 5c            	incw	x
5503  0014 a60a          	ld	a,#10
5504  0016 cd0000        	call	c_smodx
5506  0019 01            	rrwa	x,a
5507  001a c70000        	ld	___i,a
5508  001d 02            	rlwa	x,a
5509                     ; 608 		lcd_disp_n(0, __i);
5511  001e c60000        	ld	a,___i
5512  0021 97            	ld	xl,a
5513  0022 4f            	clr	a
5514  0023 95            	ld	xh,a
5515  0024 cd0000        	call	_lcd_disp_n
5517                     ; 609 		lcd_disp_n(1, __i);
5519  0027 c60000        	ld	a,___i
5520  002a 97            	ld	xl,a
5521  002b a601          	ld	a,#1
5522  002d 95            	ld	xh,a
5523  002e cd0000        	call	_lcd_disp_n
5525                     ; 610 		lcd_disp_n(2, __i);
5527  0031 c60000        	ld	a,___i
5528  0034 97            	ld	xl,a
5529  0035 a602          	ld	a,#2
5530  0037 95            	ld	xh,a
5531  0038 cd0000        	call	_lcd_disp_n
5533                     ; 611 		lcd_disp_n(3, __i);
5535  003b c60000        	ld	a,___i
5536  003e 97            	ld	xl,a
5537  003f a603          	ld	a,#3
5538  0041 95            	ld	xh,a
5539  0042 cd0000        	call	_lcd_disp_n
5542  0045 2009          	jra	L3502
5543  0047               L1502:
5544                     ; 615 		LCD->RAM[LCD_RAMRegister_1] &= (uint8_t)(~id);
5546  0047 7b01          	ld	a,(OFST+1,sp)
5547  0049 43            	cpl	a
5548  004a c4540d        	and	a,21517
5549  004d c7540d        	ld	21517,a
5550  0050               L3502:
5551                     ; 617 }
5554  0050 85            	popw	x
5555  0051 81            	ret
5587                     ; 619 void	lcd_init(void)
5587                     ; 620 {
5588                     .text:	section	.text,new
5589  0000               _lcd_init:
5591  0000 88            	push	a
5592       00000001      OFST:	set	1
5595                     ; 622 	LCD_CE;
5597  0001 72165402      	bset	21506,#3
5598                     ; 623 	for( i=0; i<15; i++ )
5600  0005 0f01          	clr	(OFST+0,sp)
5601  0007               L1702:
5602                     ; 624 		LCD->RAM[i] = 0xff;
5604  0007 7b01          	ld	a,(OFST+0,sp)
5605  0009 5f            	clrw	x
5606  000a 97            	ld	xl,a
5607  000b a6ff          	ld	a,#255
5608  000d d7540c        	ld	(21516,x),a
5609                     ; 623 	for( i=0; i<15; i++ )
5611  0010 0c01          	inc	(OFST+0,sp)
5614  0012 7b01          	ld	a,(OFST+0,sp)
5615  0014 a10f          	cp	a,#15
5616  0016 25ef          	jrult	L1702
5617                     ; 625 }
5620  0018 84            	pop	a
5621  0019 81            	ret
5653                     ; 629 void	lcd_cntl(uint8_t cmd, uint8_t param)
5653                     ; 630 {
5654                     .text:	section	.text,new
5655  0000               _lcd_cntl:
5659                     ; 649 }
5662  0000 81            	ret
5685                     ; 651 void	systemLcdClear(void)
5685                     ; 652 {
5686                     .text:	section	.text,new
5687  0000               _systemLcdClear:
5691                     ; 653 	LCD->CR1 = LCD_CR1_RESET_VALUE;
5693  0000 725f5400      	clr	21504
5694                     ; 654 	LCD->CR2 = LCD_CR2_RESET_VALUE;
5696  0004 725f5401      	clr	21505
5697                     ; 655 	LCD->CR3 = LCD_CR3_RESET_VALUE;
5699  0008 725f5402      	clr	21506
5700                     ; 656 	LCD->FRQ = LCD_FRQ_RESET_VALUE;
5702  000c 725f5403      	clr	21507
5703                     ; 658 	LCD->CR4 = LCD_CR4_RESET_VALUE;
5705  0010 725f542f      	clr	21551
5706                     ; 659 }
5709  0014 81            	ret
5742                     ; 696 void	systemLcd(void)
5742                     ; 697 {
5743                     .text:	section	.text,new
5744  0000               _systemLcd:
5748                     ; 698 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
5750  0000 ae1301        	ldw	x,#4865
5751  0003 cd0000        	call	_CLK_PeripheralClockConfig
5753                     ; 699 	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
5755  0006 ae0400        	ldw	x,#1024
5756  0009 cd0000        	call	_CLK_RTCClockConfig
5758                     ; 700 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
5760  000c ae1201        	ldw	x,#4609
5761  000f cd0000        	call	_CLK_PeripheralClockConfig
5763                     ; 702 	systemLcdClear();
5765  0012 cd0000        	call	_systemLcdClear
5767                     ; 704 	LCD_Init(
5767                     ; 705 		LCD_Prescaler_2, 
5767                     ; 706 		LCD_Divider_18, 
5767                     ; 707 		LCD_Duty_1_4,
5767                     ; 708 		LCD_Bias_1_3, 
5767                     ; 709 #if defined (_RC_DR_) || defined (_RC_DW_)
5767                     ; 710 		LCD_VoltageSource_External
5767                     ; 711 #else
5767                     ; 712 		LCD_VoltageSource_Internal
5767                     ; 713 #endif
5767                     ; 714 		);
5769  0015 4b00          	push	#0
5770  0017 4b00          	push	#0
5771  0019 4b06          	push	#6
5772  001b ae1002        	ldw	x,#4098
5773  001e cd0000        	call	_LCD_Init
5775  0021 5b03          	addw	sp,#3
5776                     ; 727 	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
5778  0023 ae00ff        	ldw	x,#255
5779  0026 cd0000        	call	_LCD_PortMaskConfig
5781                     ; 728 	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFE);	//	s8 Skip
5783  0029 ae01fe        	ldw	x,#510
5784  002c cd0000        	call	_LCD_PortMaskConfig
5786                     ; 729 	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x01);	//	
5788  002f ae0201        	ldw	x,#513
5789  0032 cd0000        	call	_LCD_PortMaskConfig
5791                     ; 730 	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);
5793  0035 ae0300        	ldw	x,#768
5794  0038 cd0000        	call	_LCD_PortMaskConfig
5796                     ; 739 	LCD_ContrastConfig(LCD_Contrast_Level_7);
5798  003b a60e          	ld	a,#14
5799  003d cd0000        	call	_LCD_ContrastConfig
5801                     ; 740 	LCD_DeadTimeConfig(LCD_DeadTime_0);
5803  0040 4f            	clr	a
5804  0041 cd0000        	call	_LCD_DeadTimeConfig
5806                     ; 741 	LCD_PulseOnDurationConfig(LCD_PulseOnDuration_1);
5808  0044 a620          	ld	a,#32
5809  0046 cd0000        	call	_LCD_PulseOnDurationConfig
5811                     ; 746 	lcd_init();
5813  0049 cd0000        	call	_lcd_init
5815                     ; 748 	LCD_Cmd(ENABLE); 
5817  004c a601          	ld	a,#1
5818  004e cd0000        	call	_LCD_Cmd
5820                     ; 749 }
5823  0051 81            	ret
5826                     	switch	.data
5827  0001               __blink_timer:
5828  0001 05            	dc.b	5
5829  0002               __blinkFlag:
5830  0002 00            	dc.b	0
5831  0003               __blinkId:
5832  0003 ff            	dc.b	255
5833  0004               __blink:
5834  0004 00            	dc.b	0
5835  0005               __blinkFlag2:
5836  0005 00            	dc.b	0
5837  0006               __blinkId2:
5838  0006 ff            	dc.b	255
5839  0007               __blinkId2b:
5840  0007 ff            	dc.b	255
5841  0008               __blink2:
5842  0008 00            	dc.b	0
5843  0009               __blinkNpos:
5844  0009 00            	dc.b	0
5845  000a               __blinkFlag3:
5846  000a 00            	dc.b	0
5847  000b               __blinkId3:
5848  000b ff            	dc.b	255
5849  000c               __blink3:
5850  000c 00            	dc.b	0
5873                     ; 766 void	lcd_blink_npos_clear(void)
5873                     ; 767 {
5874                     .text:	section	.text,new
5875  0000               _lcd_blink_npos_clear:
5879                     ; 768 	_blinkNpos = 0;
5881  0000 725f0009      	clr	__blinkNpos
5882                     ; 769 }
5885  0004 81            	ret
5918                     ; 771 void	lcd_blink_npos(uint8_t i)
5918                     ; 772 {
5919                     .text:	section	.text,new
5920  0000               _lcd_blink_npos:
5924                     ; 773 	_blinkNpos = i + 1;
5926  0000 4c            	inc	a
5927  0001 c70009        	ld	__blinkNpos,a
5928                     ; 774 }
5931  0004 81            	ret
5957                     ; 776 void	lcd_blink_clear(void)
5957                     ; 777 {
5958                     .text:	section	.text,new
5959  0000               _lcd_blink_clear:
5963                     ; 778 	_blinkId = 0;
5965  0000 725f0003      	clr	__blinkId
5966                     ; 779 	_blinkId2 = 0;
5968  0004 725f0006      	clr	__blinkId2
5969                     ; 780 	_blinkId2b = 0;
5971  0008 725f0007      	clr	__blinkId2b
5972                     ; 781 }
5975  000c 81            	ret
6009                     ; 783 void	lcd_blink_item(uint8_t i)
6009                     ; 784 {
6010                     .text:	section	.text,new
6011  0000               _lcd_blink_item:
6015                     ; 785 	_blinkId = i;
6017  0000 c70003        	ld	__blinkId,a
6018                     ; 786 	_blink = 0;
6020  0003 725f0004      	clr	__blink
6021                     ; 787 }
6024  0007 81            	ret
6050                     ; 789 void	lcd_blink_clearRoom(void)
6050                     ; 790 {
6051                     .text:	section	.text,new
6052  0000               _lcd_blink_clearRoom:
6056                     ; 791 	_blinkId2 = 0;
6058  0000 725f0006      	clr	__blinkId2
6059                     ; 792 	_blinkId2b = 0;
6061  0004 725f0007      	clr	__blinkId2b
6062                     ; 793 }
6065  0008 81            	ret
6108                     ; 795 void	lcd_blink_itemRoom(uint8_t i, uint8_t imode)
6108                     ; 796 {
6109                     .text:	section	.text,new
6110  0000               _lcd_blink_itemRoom:
6112  0000 89            	pushw	x
6113       00000000      OFST:	set	0
6116                     ; 797 	_blinkId2 = _rid[i*2];
6118  0001 9e            	ld	a,xh
6119  0002 5f            	clrw	x
6120  0003 97            	ld	xl,a
6121  0004 58            	sllw	x
6122  0005 d601e1        	ld	a,(__rid,x)
6123  0008 c70006        	ld	__blinkId2,a
6124                     ; 798 	if( imode != 0 )
6126  000b 0d02          	tnz	(OFST+2,sp)
6127  000d 270b          	jreq	L1322
6128                     ; 799 		_blinkId2b = _rid[i*2+1];
6130  000f 7b01          	ld	a,(OFST+1,sp)
6131  0011 5f            	clrw	x
6132  0012 97            	ld	xl,a
6133  0013 58            	sllw	x
6134  0014 d601e2        	ld	a,(__rid+1,x)
6135  0017 c70007        	ld	__blinkId2b,a
6136  001a               L1322:
6137                     ; 800 	_blink2 = 0;
6139  001a 725f0008      	clr	__blink2
6140                     ; 801 }
6143  001e 85            	popw	x
6144  001f 81            	ret
6201                     ; 803 void	lcd_blinkCb(void)
6201                     ; 804 {
6202                     .text:	section	.text,new
6203  0000               _lcd_blinkCb:
6205  0000 5204          	subw	sp,#4
6206       00000004      OFST:	set	4
6209                     ; 807 	if( _blink_timer == 0 )
6211  0002 725d0001      	tnz	__blink_timer
6212  0006 2603          	jrne	L432
6213  0008 cc01eb        	jp	L232
6214  000b               L432:
6215                     ; 808 		return;
6217                     ; 810 	if( (__timer100ms%_blink_timer) == 0 )
6219  000b c60000        	ld	a,___timer100ms
6220  000e 5f            	clrw	x
6221  000f 97            	ld	xl,a
6222  0010 c60001        	ld	a,__blink_timer
6223  0013 905f          	clrw	y
6224  0015 9097          	ld	yl,a
6225  0017 cd0000        	call	c_idiv
6227  001a 51            	exgw	x,y
6228  001b a30000        	cpw	x,#0
6229  001e 2703          	jreq	L632
6230  0020 cc01df        	jp	L5522
6231  0023               L632:
6232                     ; 812 		if( _blinkFlag == 0 )
6234  0023 725d0002      	tnz	__blinkFlag
6235  0027 2651          	jrne	L7522
6236                     ; 814 			_blinkFlag = 1;
6238  0029 35010002      	mov	__blinkFlag,#1
6239                     ; 815 			if( _blinkId != 0 )
6241  002d 725d0003      	tnz	__blinkId
6242  0031 2747          	jreq	L7522
6243                     ; 817 				if( _blink != 0 )
6245  0033 725d0004      	tnz	__blink
6246  0037 2722          	jreq	L3622
6247                     ; 819 					LCD_BIT_CLEAR(_blinkId);
6249  0039 c60003        	ld	a,__blinkId
6250  003c 5f            	clrw	x
6251  003d 97            	ld	xl,a
6252  003e d60040        	ld	a,(_iLF_DEF,x)
6253  0041 5f            	clrw	x
6254  0042 97            	ld	xl,a
6255  0043 c60003        	ld	a,__blinkId
6256  0046 905f          	clrw	y
6257  0048 9097          	ld	yl,a
6258  004a 90d60000      	ld	a,(_bLF_DEF,y)
6259  004e 43            	cpl	a
6260  004f d4540c        	and	a,(21516,x)
6261  0052 d7540c        	ld	(21516,x),a
6262                     ; 820 					_blink = 0;
6264  0055 725f0004      	clr	__blink
6266  0059 201f          	jra	L7522
6267  005b               L3622:
6268                     ; 824 					LCD_BIT_SET(_blinkId);
6270  005b c60003        	ld	a,__blinkId
6271  005e 5f            	clrw	x
6272  005f 97            	ld	xl,a
6273  0060 d60040        	ld	a,(_iLF_DEF,x)
6274  0063 5f            	clrw	x
6275  0064 97            	ld	xl,a
6276  0065 c60003        	ld	a,__blinkId
6277  0068 905f          	clrw	y
6278  006a 9097          	ld	yl,a
6279  006c d6540c        	ld	a,(21516,x)
6280  006f 90da0000      	or	a,(_bLF_DEF,y)
6281  0073 d7540c        	ld	(21516,x),a
6282                     ; 825 					_blink = 1;
6284  0076 35010004      	mov	__blink,#1
6285  007a               L7522:
6286                     ; 829 		if( _blinkFlag2 == 0 )
6288  007a 725d0005      	tnz	__blinkFlag2
6289  007e 2703cc0117    	jrne	L7622
6290                     ; 831 			_blinkFlag2 = 1;
6292  0083 35010005      	mov	__blinkFlag2,#1
6293                     ; 832 			if( _blinkId2 != 0 )
6295  0087 725d0006      	tnz	__blinkId2
6296  008b 27f3          	jreq	L7622
6297                     ; 834 				if( _blink2 != 0 )
6299  008d 725d0008      	tnz	__blink2
6300  0091 2744          	jreq	L3722
6301                     ; 836 					if( _blinkId2b != 0 )
6303  0093 725d0007      	tnz	__blinkId2b
6304  0097 271c          	jreq	L5722
6305                     ; 837 						LCD_BIT_CLEAR(_blinkId2b);
6307  0099 c60007        	ld	a,__blinkId2b
6308  009c 5f            	clrw	x
6309  009d 97            	ld	xl,a
6310  009e d60040        	ld	a,(_iLF_DEF,x)
6311  00a1 5f            	clrw	x
6312  00a2 97            	ld	xl,a
6313  00a3 c60007        	ld	a,__blinkId2b
6314  00a6 905f          	clrw	y
6315  00a8 9097          	ld	yl,a
6316  00aa 90d60000      	ld	a,(_bLF_DEF,y)
6317  00ae 43            	cpl	a
6318  00af d4540c        	and	a,(21516,x)
6319  00b2 d7540c        	ld	(21516,x),a
6320  00b5               L5722:
6321                     ; 838 					LCD_BIT_CLEAR(_blinkId2);
6323  00b5 c60006        	ld	a,__blinkId2
6324  00b8 5f            	clrw	x
6325  00b9 97            	ld	xl,a
6326  00ba d60040        	ld	a,(_iLF_DEF,x)
6327  00bd 5f            	clrw	x
6328  00be 97            	ld	xl,a
6329  00bf c60006        	ld	a,__blinkId2
6330  00c2 905f          	clrw	y
6331  00c4 9097          	ld	yl,a
6332  00c6 90d60000      	ld	a,(_bLF_DEF,y)
6333  00ca 43            	cpl	a
6334  00cb d4540c        	and	a,(21516,x)
6335  00ce d7540c        	ld	(21516,x),a
6336                     ; 839 					_blink2 = 0;
6338  00d1 725f0008      	clr	__blink2
6340  00d5 2040          	jra	L7622
6341  00d7               L3722:
6342                     ; 843 					if( _blinkId2b != 0 )
6344  00d7 725d0007      	tnz	__blinkId2b
6345  00db 271b          	jreq	L1032
6346                     ; 844 						LCD_BIT_SET(_blinkId2b);
6348  00dd c60007        	ld	a,__blinkId2b
6349  00e0 5f            	clrw	x
6350  00e1 97            	ld	xl,a
6351  00e2 d60040        	ld	a,(_iLF_DEF,x)
6352  00e5 5f            	clrw	x
6353  00e6 97            	ld	xl,a
6354  00e7 c60007        	ld	a,__blinkId2b
6355  00ea 905f          	clrw	y
6356  00ec 9097          	ld	yl,a
6357  00ee d6540c        	ld	a,(21516,x)
6358  00f1 90da0000      	or	a,(_bLF_DEF,y)
6359  00f5 d7540c        	ld	(21516,x),a
6360  00f8               L1032:
6361                     ; 845 					LCD_BIT_SET(_blinkId2);
6363  00f8 c60006        	ld	a,__blinkId2
6364  00fb 5f            	clrw	x
6365  00fc 97            	ld	xl,a
6366  00fd d60040        	ld	a,(_iLF_DEF,x)
6367  0100 5f            	clrw	x
6368  0101 97            	ld	xl,a
6369  0102 c60006        	ld	a,__blinkId2
6370  0105 905f          	clrw	y
6371  0107 9097          	ld	yl,a
6372  0109 d6540c        	ld	a,(21516,x)
6373  010c 90da0000      	or	a,(_bLF_DEF,y)
6374  0110 d7540c        	ld	(21516,x),a
6375                     ; 846 					_blink2 = 1;
6377  0113 35010008      	mov	__blink2,#1
6378  0117               L7622:
6379                     ; 850 		if( _blinkFlag3 == 0 )
6381  0117 725d000a      	tnz	__blinkFlag3
6382  011b 2703          	jreq	L042
6383  011d cc01eb        	jp	L3332
6384  0120               L042:
6385                     ; 852 			_blinkFlag3 = 1;
6387  0120 3501000a      	mov	__blinkFlag3,#1
6388                     ; 853 			if( _blinkNpos != 0 )
6390  0124 725d0009      	tnz	__blinkNpos
6391  0128 2603          	jrne	L242
6392  012a cc01eb        	jp	L3332
6393  012d               L242:
6394                     ; 855 				p = lcd_get_npos(0);
6396  012d 4f            	clr	a
6397  012e cd0000        	call	_lcd_get_npos
6399  0131 1f02          	ldw	(OFST-2,sp),x
6400                     ; 856 				p = p+(_blinkNpos-1)*7;
6402  0133 c60009        	ld	a,__blinkNpos
6403  0136 97            	ld	xl,a
6404  0137 a607          	ld	a,#7
6405  0139 42            	mul	x,a
6406  013a 1d0007        	subw	x,#7
6407  013d 72fb02        	addw	x,(OFST-2,sp)
6408  0140 1f02          	ldw	(OFST-2,sp),x
6409                     ; 857 				if( _blinkId3 != 0 )
6411  0142 725d000b      	tnz	__blinkId3
6412  0146 274b          	jreq	L7032
6413                     ; 859 					for( i=0; i<7; i++ )
6415  0148 0f04          	clr	(OFST+0,sp)
6416  014a               L1132:
6417                     ; 861 						if( p[i] != 0 )
6419  014a 7b02          	ld	a,(OFST-2,sp)
6420  014c 97            	ld	xl,a
6421  014d 7b03          	ld	a,(OFST-1,sp)
6422  014f 1b04          	add	a,(OFST+0,sp)
6423  0151 2401          	jrnc	L612
6424  0153 5c            	incw	x
6425  0154               L612:
6426  0154 02            	rlwa	x,a
6427  0155 7d            	tnz	(x)
6428  0156 272d          	jreq	L7132
6429                     ; 862 							LCD_BIT_CLEAR(p[i]);
6431  0158 7b02          	ld	a,(OFST-2,sp)
6432  015a 97            	ld	xl,a
6433  015b 7b03          	ld	a,(OFST-1,sp)
6434  015d 1b04          	add	a,(OFST+0,sp)
6435  015f 2401          	jrnc	L022
6436  0161 5c            	incw	x
6437  0162               L022:
6438  0162 02            	rlwa	x,a
6439  0163 f6            	ld	a,(x)
6440  0164 5f            	clrw	x
6441  0165 97            	ld	xl,a
6442  0166 d60040        	ld	a,(_iLF_DEF,x)
6443  0169 5f            	clrw	x
6444  016a 97            	ld	xl,a
6445  016b 89            	pushw	x
6446  016c 7b04          	ld	a,(OFST+0,sp)
6447  016e 97            	ld	xl,a
6448  016f 7b05          	ld	a,(OFST+1,sp)
6449  0171 1b06          	add	a,(OFST+2,sp)
6450  0173 2401          	jrnc	L222
6451  0175 5c            	incw	x
6452  0176               L222:
6453  0176 02            	rlwa	x,a
6454  0177 f6            	ld	a,(x)
6455  0178 5f            	clrw	x
6456  0179 97            	ld	xl,a
6457  017a d60000        	ld	a,(_bLF_DEF,x)
6458  017d 43            	cpl	a
6459  017e 85            	popw	x
6460  017f d4540c        	and	a,(21516,x)
6461  0182 d7540c        	ld	(21516,x),a
6462  0185               L7132:
6463                     ; 859 					for( i=0; i<7; i++ )
6465  0185 0c04          	inc	(OFST+0,sp)
6468  0187 7b04          	ld	a,(OFST+0,sp)
6469  0189 a107          	cp	a,#7
6470  018b 25bd          	jrult	L1132
6471                     ; 864 					_blinkId3 = 0;
6473  018d 725f000b      	clr	__blinkId3
6475  0191 2058          	jra	L3332
6476  0193               L7032:
6477                     ; 868 					for( i=0; i<7; i++ )
6479  0193 0f04          	clr	(OFST+0,sp)
6480  0195               L3232:
6481                     ; 870 						if( p[i] != 0 )
6483  0195 7b02          	ld	a,(OFST-2,sp)
6484  0197 97            	ld	xl,a
6485  0198 7b03          	ld	a,(OFST-1,sp)
6486  019a 1b04          	add	a,(OFST+0,sp)
6487  019c 2401          	jrnc	L422
6488  019e 5c            	incw	x
6489  019f               L422:
6490  019f 02            	rlwa	x,a
6491  01a0 7d            	tnz	(x)
6492  01a1 272e          	jreq	L1332
6493                     ; 871 							LCD_BIT_SET(p[i]);
6495  01a3 7b02          	ld	a,(OFST-2,sp)
6496  01a5 97            	ld	xl,a
6497  01a6 7b03          	ld	a,(OFST-1,sp)
6498  01a8 1b04          	add	a,(OFST+0,sp)
6499  01aa 2401          	jrnc	L622
6500  01ac 5c            	incw	x
6501  01ad               L622:
6502  01ad 02            	rlwa	x,a
6503  01ae f6            	ld	a,(x)
6504  01af 5f            	clrw	x
6505  01b0 97            	ld	xl,a
6506  01b1 d60000        	ld	a,(_bLF_DEF,x)
6507  01b4 6b01          	ld	(OFST-3,sp),a
6508  01b6 7b02          	ld	a,(OFST-2,sp)
6509  01b8 97            	ld	xl,a
6510  01b9 7b03          	ld	a,(OFST-1,sp)
6511  01bb 1b04          	add	a,(OFST+0,sp)
6512  01bd 2401          	jrnc	L032
6513  01bf 5c            	incw	x
6514  01c0               L032:
6515  01c0 02            	rlwa	x,a
6516  01c1 f6            	ld	a,(x)
6517  01c2 5f            	clrw	x
6518  01c3 97            	ld	xl,a
6519  01c4 d60040        	ld	a,(_iLF_DEF,x)
6520  01c7 5f            	clrw	x
6521  01c8 97            	ld	xl,a
6522  01c9 d6540c        	ld	a,(21516,x)
6523  01cc 1a01          	or	a,(OFST-3,sp)
6524  01ce d7540c        	ld	(21516,x),a
6525  01d1               L1332:
6526                     ; 868 					for( i=0; i<7; i++ )
6528  01d1 0c04          	inc	(OFST+0,sp)
6531  01d3 7b04          	ld	a,(OFST+0,sp)
6532  01d5 a107          	cp	a,#7
6533  01d7 25bc          	jrult	L3232
6534                     ; 873 					_blinkId3 = 1;
6536  01d9 3501000b      	mov	__blinkId3,#1
6537  01dd 200c          	jra	L3332
6538  01df               L5522:
6539                     ; 880 		_blinkFlag = 0;
6541  01df 725f0002      	clr	__blinkFlag
6542                     ; 881 		_blinkFlag2 = 0;
6544  01e3 725f0005      	clr	__blinkFlag2
6545                     ; 882 		_blinkFlag3 = 0;
6547  01e7 725f000a      	clr	__blinkFlag3
6548  01eb               L3332:
6549                     ; 884 }
6550  01eb               L232:
6553  01eb 5b04          	addw	sp,#4
6554  01ed 81            	ret
7060                     	xdef	__blink3
7061                     	xdef	__blinkId3
7062                     	xdef	__blinkFlag3
7063                     	xdef	__blinkNpos
7064                     	xdef	__blink2
7065                     	xdef	__blinkId2b
7066                     	xdef	__blinkId2
7067                     	xdef	__blinkFlag2
7068                     	xdef	__blink
7069                     	xdef	__blinkId
7070                     	xdef	__blinkFlag
7071                     	xdef	__blink_timer
7072                     	xdef	_systemLcdClear
7073                     	xdef	_lcd_init
7074                     	xdef	___i
7075                     	xdef	_lcd_disp_cmd
7076                     	xref	_error_type
7077                     	xdef	_lcd_get_npos
7078                     	xdef	_lcd_disp_all
7079                     	xdef	_lcd_clear_cnt
7080                     	xdef	_lcd_clear_m
7081                     	xdef	_lcd_clear_info
7082                     	xdef	__plc
7083                     	xdef	__cnt_sub
7084                     	xdef	__cnt_host
7085                     	xdef	__lpm
7086                     	xdef	__temp_offset
7087                     	xdef	__po_type_pb
7088                     	xdef	__po_type_xl
7089                     	xdef	__po_type
7090                     	xdef	__len
7091                     	xdef	__freset
7092                     	xdef	__mir2
7093                     	xdef	__mir1
7094                     	xdef	__cntl_tab
7095                     	xdef	__cntl_2motor
7096                     	xdef	__cntl_op
7097                     	xdef	__link
7098                     	xdef	__hc
7099                     	xdef	__run
7100                     	xdef	__hcEach
7101                     	xdef	__hcLocal
7102                     	xdef	__cntl_po
7103                     	xdef	__cntl_on
7104                     	xdef	__cc
7105                     	xdef	__btn
7106                     	xdef	__bL
7107                     	xdef	__info
7108                     	xdef	__nid
7109                     	xdef	__n
7110                     	xdef	__nvalve
7111                     	xdef	__ncnt
7112                     	xdef	__nm
7113                     	xdef	__nerrBr
7114                     	xdef	__nerr
7115                     	xdef	__nd
7116                     	xdef	__nc
7117                     	xdef	__nb
7118                     	xdef	__na
7119                     	xdef	_lcd_blink_npos
7120                     	xdef	_lcd_blink_npos_clear
7121                     	xdef	_lcd_disp_info
7122                     	xdef	_lcd_disp_info_fire
7123                     	xdef	_lcd_disp_info_shower
7124                     	xdef	_lcd_clear_rid_n
7125                     	xdef	_lcd_blinkCb
7126                     	xdef	_lcd_blink_itemRoom
7127                     	xdef	_lcd_blink_item
7128                     	xdef	_lcd_blink_clearRoom
7129                     	xdef	_lcd_blink_clear
7130                     	xdef	_lcd_clear_npos
7131                     	xdef	_lcd_disp_rid
7132                     	xdef	_lcd_disp_err
7133                     	xdef	_lcd_disp_n
7134                     	xdef	_lcd_clear
7135                     	xdef	_lcd_disp_setup_mode_each
7136                     	xdef	_lcd_disp_setup_mode_local
7137                     	xdef	_lcd_disp_setup_valve
7138                     	xdef	_lcd_disp_setup_cnt
7139                     	xdef	_lcd_disp_setup_m
7140                     	xdef	_lcd_disp_setup_id
7141                     	xdef	_lcd_disp_setup_mode
7142                     	xdef	_lcd_disp_setup_run
7143                     	xdef	_lcd_disp_setup_c
7144                     	xdef	_lcd_disp_setup_link
7145                     	xdef	_lcd_disp_plc
7146                     	xdef	_lcd_disp_cnt_sub
7147                     	xdef	_lcd_disp_cnt_host
7148                     	xdef	_lcd_disp_freset
7149                     	xdef	_lcd_disp_mir2
7150                     	xdef	_lcd_disp_mir1
7151                     	xdef	_lcd_disp_setup_cntl_tab
7152                     	xdef	_lcd_disp_setup_cntl_2motor
7153                     	xdef	_lcd_disp_setup_cntl_po
7154                     	xdef	_lcd_disp_setup_cntl_on
7155                     	xdef	_lcd_disp_setup_cntl_op
7156                     	xdef	_lcd_disp_setup_len
7157                     	xdef	_lcd_disp_setup_po_type_pb
7158                     	xdef	_lcd_disp_setup_po_type_xl
7159                     	xdef	_lcd_disp_setup_po_type
7160                     	xdef	_lcd_disp_setup_temp_offset
7161                     	xdef	_lcd_disp_setup_lpm
7162                     	xdef	_lcd_disp_backlight
7163                     	xdef	_lcd_clear_rid
7164                     	xdef	_lcd_clear_run
7165                     	xdef	_lcd_clear_mode
7166                     	xdef	_lcd_clear_n
7167                     	xdef	_lcd_clear_c
7168                     	xdef	_lcd_clear_btn
7169                     	xdef	_lcd_clear_backlight
7170                     	xdef	__rid
7171                     	xdef	_iLF_DEF
7172                     	xdef	_bLF_DEF
7173                     	xref	_uiInfo
7174                     	xref	___timer100ms
7175                     	xdef	_lcd_cntl
7176                     	xdef	_lcd_disp
7177                     	xdef	_lcd_blink
7178                     	xdef	_systemLcd
7179                     	xref	_LCD_ContrastConfig
7180                     	xref	_LCD_DeadTimeConfig
7181                     	xref	_LCD_PulseOnDurationConfig
7182                     	xref	_LCD_Cmd
7183                     	xref	_LCD_PortMaskConfig
7184                     	xref	_LCD_Init
7185                     	xref	_CLK_PeripheralClockConfig
7186                     	xref	_CLK_RTCClockConfig
7187                     	xref.b	c_x
7206                     	xref	c_idiv
7207                     	xref	c_smodx
7208                     	end
