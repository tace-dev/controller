   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  59                     ; 8 void	lcd_blink(uint8_t mode)
  59                     ; 9 {
  61                     .text:	section	.text,new
  62  0000               _lcd_blink:
  66                     ; 30 }
  69  0000 81            	ret	
  72                     .const:	section	.text
  73  0000               _bLF_DEF:
  74  0000 01            	dc.b	1
  75  0001 02            	dc.b	2
  76  0002 04            	dc.b	4
  77  0003 08            	dc.b	8
  78  0004 10            	dc.b	16
  79  0005 20            	dc.b	32
  80  0006 40            	dc.b	64
  81  0007 80            	dc.b	128
  82  0008 02            	dc.b	2
  83  0009 04            	dc.b	4
  84  000a 08            	dc.b	8
  85  000b 10            	dc.b	16
  86  000c 20            	dc.b	32
  87  000d 40            	dc.b	64
  88  000e 80            	dc.b	128
  89  000f 01            	dc.b	1
  90  0010 10            	dc.b	16
  91  0011 20            	dc.b	32
  92  0012 40            	dc.b	64
  93  0013 80            	dc.b	128
  94  0014 01            	dc.b	1
  95  0015 02            	dc.b	2
  96  0016 04            	dc.b	4
  97  0017 08            	dc.b	8
  98  0018 20            	dc.b	32
  99  0019 40            	dc.b	64
 100  001a 80            	dc.b	128
 101  001b 01            	dc.b	1
 102  001c 02            	dc.b	2
 103  001d 04            	dc.b	4
 104  001e 08            	dc.b	8
 105  001f 10            	dc.b	16
 106  0020 01            	dc.b	1
 107  0021 02            	dc.b	2
 108  0022 04            	dc.b	4
 109  0023 08            	dc.b	8
 110  0024 10            	dc.b	16
 111  0025 20            	dc.b	32
 112  0026 40            	dc.b	64
 113  0027 80            	dc.b	128
 114  0028 02            	dc.b	2
 115  0029 04            	dc.b	4
 116  002a 08            	dc.b	8
 117  002b 10            	dc.b	16
 118  002c 20            	dc.b	32
 119  002d 40            	dc.b	64
 120  002e 80            	dc.b	128
 121  002f 01            	dc.b	1
 122  0030 10            	dc.b	16
 123  0031 20            	dc.b	32
 124  0032 40            	dc.b	64
 125  0033 80            	dc.b	128
 126  0034 01            	dc.b	1
 127  0035 02            	dc.b	2
 128  0036 04            	dc.b	4
 129  0037 08            	dc.b	8
 130  0038 20            	dc.b	32
 131  0039 40            	dc.b	64
 132  003a 80            	dc.b	128
 133  003b 01            	dc.b	1
 134  003c 02            	dc.b	2
 135  003d 04            	dc.b	4
 136  003e 08            	dc.b	8
 137  003f 10            	dc.b	16
 138  0040               _iLF_DEF:
 139  0040 00            	dc.b	0
 140  0041 00            	dc.b	0
 141  0042 00            	dc.b	0
 142  0043 00            	dc.b	0
 143  0044 00            	dc.b	0
 144  0045 00            	dc.b	0
 145  0046 00            	dc.b	0
 146  0047 00            	dc.b	0
 147  0048 01            	dc.b	1
 148  0049 01            	dc.b	1
 149  004a 01            	dc.b	1
 150  004b 01            	dc.b	1
 151  004c 01            	dc.b	1
 152  004d 01            	dc.b	1
 153  004e 01            	dc.b	1
 154  004f 02            	dc.b	2
 155  0050 03            	dc.b	3
 156  0051 03            	dc.b	3
 157  0052 03            	dc.b	3
 158  0053 03            	dc.b	3
 159  0054 04            	dc.b	4
 160  0055 04            	dc.b	4
 161  0056 04            	dc.b	4
 162  0057 04            	dc.b	4
 163  0058 04            	dc.b	4
 164  0059 04            	dc.b	4
 165  005a 04            	dc.b	4
 166  005b 05            	dc.b	5
 167  005c 05            	dc.b	5
 168  005d 05            	dc.b	5
 169  005e 05            	dc.b	5
 170  005f 05            	dc.b	5
 171  0060 07            	dc.b	7
 172  0061 07            	dc.b	7
 173  0062 07            	dc.b	7
 174  0063 07            	dc.b	7
 175  0064 07            	dc.b	7
 176  0065 07            	dc.b	7
 177  0066 07            	dc.b	7
 178  0067 07            	dc.b	7
 179  0068 08            	dc.b	8
 180  0069 08            	dc.b	8
 181  006a 08            	dc.b	8
 182  006b 08            	dc.b	8
 183  006c 08            	dc.b	8
 184  006d 08            	dc.b	8
 185  006e 08            	dc.b	8
 186  006f 09            	dc.b	9
 187  0070 0a            	dc.b	10
 188  0071 0a            	dc.b	10
 189  0072 0a            	dc.b	10
 190  0073 0a            	dc.b	10
 191  0074 0b            	dc.b	11
 192  0075 0b            	dc.b	11
 193  0076 0b            	dc.b	11
 194  0077 0b            	dc.b	11
 195  0078 0b            	dc.b	11
 196  0079 0b            	dc.b	11
 197  007a 0b            	dc.b	11
 198  007b 0c            	dc.b	12
 199  007c 0c            	dc.b	12
 200  007d 0c            	dc.b	12
 201  007e 0c            	dc.b	12
 202  007f 0c            	dc.b	12
 203  0080               __na:
 204  0080 37            	dc.b	55
 205  0081 27            	dc.b	39
 206  0082 17            	dc.b	23
 207  0083 07            	dc.b	7
 208  0084 18            	dc.b	24
 209  0085 38            	dc.b	56
 210  0086 00            	dc.b	0
 211  0087 27            	dc.b	39
 212  0088 17            	dc.b	23
 213  0089 00            	dc.b	0
 214  008a 00            	dc.b	0
 215  008b 00            	dc.b	0
 216  008c 00            	dc.b	0
 217  008d 00            	dc.b	0
 218  008e 37            	dc.b	55
 219  008f 27            	dc.b	39
 220  0090 28            	dc.b	40
 221  0091 18            	dc.b	24
 222  0092 07            	dc.b	7
 223  0093 00            	dc.b	0
 224  0094 00            	dc.b	0
 225  0095 37            	dc.b	55
 226  0096 27            	dc.b	39
 227  0097 28            	dc.b	40
 228  0098 17            	dc.b	23
 229  0099 07            	dc.b	7
 230  009a 00            	dc.b	0
 231  009b 00            	dc.b	0
 232  009c 38            	dc.b	56
 233  009d 28            	dc.b	40
 234  009e 27            	dc.b	39
 235  009f 17            	dc.b	23
 236  00a0 00            	dc.b	0
 237  00a1 00            	dc.b	0
 238  00a2 00            	dc.b	0
 239  00a3 37            	dc.b	55
 240  00a4 38            	dc.b	56
 241  00a5 28            	dc.b	40
 242  00a6 17            	dc.b	23
 243  00a7 07            	dc.b	7
 244  00a8 00            	dc.b	0
 245  00a9 00            	dc.b	0
 246  00aa 38            	dc.b	56
 247  00ab 28            	dc.b	40
 248  00ac 18            	dc.b	24
 249  00ad 07            	dc.b	7
 250  00ae 17            	dc.b	23
 251  00af 37            	dc.b	55
 252  00b0 00            	dc.b	0
 253  00b1 37            	dc.b	55
 254  00b2 27            	dc.b	39
 255  00b3 17            	dc.b	23
 256  00b4 00            	dc.b	0
 257  00b5 00            	dc.b	0
 258  00b6 00            	dc.b	0
 259  00b7 00            	dc.b	0
 260  00b8 37            	dc.b	55
 261  00b9 27            	dc.b	39
 262  00ba 17            	dc.b	23
 263  00bb 07            	dc.b	7
 264  00bc 18            	dc.b	24
 265  00bd 38            	dc.b	56
 266  00be 28            	dc.b	40
 267  00bf 37            	dc.b	55
 268  00c0 38            	dc.b	56
 269  00c1 28            	dc.b	40
 270  00c2 27            	dc.b	39
 271  00c3 17            	dc.b	23
 272  00c4 07            	dc.b	7
 273  00c5 00            	dc.b	0
 274  00c6               __nb:
 275  00c6 35            	dc.b	53
 276  00c7 25            	dc.b	37
 277  00c8 15            	dc.b	21
 278  00c9 05            	dc.b	5
 279  00ca 16            	dc.b	22
 280  00cb 36            	dc.b	54
 281  00cc 00            	dc.b	0
 282  00cd 25            	dc.b	37
 283  00ce 15            	dc.b	21
 284  00cf 00            	dc.b	0
 285  00d0 00            	dc.b	0
 286  00d1 00            	dc.b	0
 287  00d2 00            	dc.b	0
 288  00d3 00            	dc.b	0
 289  00d4 35            	dc.b	53
 290  00d5 25            	dc.b	37
 291  00d6 26            	dc.b	38
 292  00d7 16            	dc.b	22
 293  00d8 05            	dc.b	5
 294  00d9 00            	dc.b	0
 295  00da 00            	dc.b	0
 296  00db 35            	dc.b	53
 297  00dc 25            	dc.b	37
 298  00dd 26            	dc.b	38
 299  00de 15            	dc.b	21
 300  00df 05            	dc.b	5
 301  00e0 00            	dc.b	0
 302  00e1 00            	dc.b	0
 303  00e2 36            	dc.b	54
 304  00e3 26            	dc.b	38
 305  00e4 25            	dc.b	37
 306  00e5 15            	dc.b	21
 307  00e6 00            	dc.b	0
 308  00e7 00            	dc.b	0
 309  00e8 00            	dc.b	0
 310  00e9 35            	dc.b	53
 311  00ea 36            	dc.b	54
 312  00eb 26            	dc.b	38
 313  00ec 15            	dc.b	21
 314  00ed 05            	dc.b	5
 315  00ee 00            	dc.b	0
 316  00ef 00            	dc.b	0
 317  00f0 36            	dc.b	54
 318  00f1 26            	dc.b	38
 319  00f2 16            	dc.b	22
 320  00f3 05            	dc.b	5
 321  00f4 15            	dc.b	21
 322  00f5 35            	dc.b	53
 323  00f6 00            	dc.b	0
 324  00f7 35            	dc.b	53
 325  00f8 25            	dc.b	37
 326  00f9 15            	dc.b	21
 327  00fa 00            	dc.b	0
 328  00fb 00            	dc.b	0
 329  00fc 00            	dc.b	0
 330  00fd 00            	dc.b	0
 331  00fe 35            	dc.b	53
 332  00ff 25            	dc.b	37
 333  0100 15            	dc.b	21
 334  0101 05            	dc.b	5
 335  0102 16            	dc.b	22
 336  0103 36            	dc.b	54
 337  0104 26            	dc.b	38
 338  0105 35            	dc.b	53
 339  0106 36            	dc.b	54
 340  0107 26            	dc.b	38
 341  0108 25            	dc.b	37
 342  0109 15            	dc.b	21
 343  010a 05            	dc.b	5
 344  010b 00            	dc.b	0
 345  010c               __nc:
 346  010c 0d            	dc.b	13
 347  010d 1d            	dc.b	29
 348  010e 2d            	dc.b	45
 349  010f 3d            	dc.b	61
 350  0110 2e            	dc.b	46
 351  0111 0e            	dc.b	14
 352  0112 00            	dc.b	0
 353  0113 1d            	dc.b	29
 354  0114 2d            	dc.b	45
 355  0115 00            	dc.b	0
 356  0116 00            	dc.b	0
 357  0117 00            	dc.b	0
 358  0118 00            	dc.b	0
 359  0119 00            	dc.b	0
 360  011a 0d            	dc.b	13
 361  011b 1d            	dc.b	29
 362  011c 1e            	dc.b	30
 363  011d 2e            	dc.b	46
 364  011e 3d            	dc.b	61
 365  011f 00            	dc.b	0
 366  0120 00            	dc.b	0
 367  0121 0d            	dc.b	13
 368  0122 1d            	dc.b	29
 369  0123 1e            	dc.b	30
 370  0124 2d            	dc.b	45
 371  0125 3d            	dc.b	61
 372  0126 00            	dc.b	0
 373  0127 00            	dc.b	0
 374  0128 0e            	dc.b	14
 375  0129 1e            	dc.b	30
 376  012a 1d            	dc.b	29
 377  012b 2d            	dc.b	45
 378  012c 00            	dc.b	0
 379  012d 00            	dc.b	0
 380  012e 00            	dc.b	0
 381  012f 0d            	dc.b	13
 382  0130 0e            	dc.b	14
 383  0131 1e            	dc.b	30
 384  0132 2d            	dc.b	45
 385  0133 3d            	dc.b	61
 386  0134 00            	dc.b	0
 387  0135 00            	dc.b	0
 388  0136 0e            	dc.b	14
 389  0137 1e            	dc.b	30
 390  0138 2e            	dc.b	46
 391  0139 3d            	dc.b	61
 392  013a 2d            	dc.b	45
 393  013b 0d            	dc.b	13
 394  013c 00            	dc.b	0
 395  013d 0d            	dc.b	13
 396  013e 1d            	dc.b	29
 397  013f 2d            	dc.b	45
 398  0140 00            	dc.b	0
 399  0141 00            	dc.b	0
 400  0142 00            	dc.b	0
 401  0143 00            	dc.b	0
 402  0144 0d            	dc.b	13
 403  0145 1d            	dc.b	29
 404  0146 2d            	dc.b	45
 405  0147 3d            	dc.b	61
 406  0148 2e            	dc.b	46
 407  0149 0e            	dc.b	14
 408  014a 1e            	dc.b	30
 409  014b 0d            	dc.b	13
 410  014c 0e            	dc.b	14
 411  014d 1e            	dc.b	30
 412  014e 1d            	dc.b	29
 413  014f 2d            	dc.b	45
 414  0150 3d            	dc.b	61
 415  0151 00            	dc.b	0
 416  0152               __nd:
 417  0152 0b            	dc.b	11
 418  0153 1b            	dc.b	27
 419  0154 2b            	dc.b	43
 420  0155 3b            	dc.b	59
 421  0156 2c            	dc.b	44
 422  0157 0c            	dc.b	12
 423  0158 00            	dc.b	0
 424  0159 1b            	dc.b	27
 425  015a 2b            	dc.b	43
 426  015b 00            	dc.b	0
 427  015c 00            	dc.b	0
 428  015d 00            	dc.b	0
 429  015e 00            	dc.b	0
 430  015f 00            	dc.b	0
 431  0160 0b            	dc.b	11
 432  0161 1b            	dc.b	27
 433  0162 1c            	dc.b	28
 434  0163 2c            	dc.b	44
 435  0164 3b            	dc.b	59
 436  0165 00            	dc.b	0
 437  0166 00            	dc.b	0
 438  0167 0b            	dc.b	11
 439  0168 1b            	dc.b	27
 440  0169 1c            	dc.b	28
 441  016a 2b            	dc.b	43
 442  016b 3b            	dc.b	59
 443  016c 00            	dc.b	0
 444  016d 00            	dc.b	0
 445  016e 0c            	dc.b	12
 446  016f 1c            	dc.b	28
 447  0170 1b            	dc.b	27
 448  0171 2b            	dc.b	43
 449  0172 00            	dc.b	0
 450  0173 00            	dc.b	0
 451  0174 00            	dc.b	0
 452  0175 0b            	dc.b	11
 453  0176 0c            	dc.b	12
 454  0177 1c            	dc.b	28
 455  0178 2b            	dc.b	43
 456  0179 3b            	dc.b	59
 457  017a 00            	dc.b	0
 458  017b 00            	dc.b	0
 459  017c 0c            	dc.b	12
 460  017d 1c            	dc.b	28
 461  017e 2c            	dc.b	44
 462  017f 3b            	dc.b	59
 463  0180 2b            	dc.b	43
 464  0181 0b            	dc.b	11
 465  0182 00            	dc.b	0
 466  0183 0b            	dc.b	11
 467  0184 1b            	dc.b	27
 468  0185 2b            	dc.b	43
 469  0186 00            	dc.b	0
 470  0187 00            	dc.b	0
 471  0188 00            	dc.b	0
 472  0189 00            	dc.b	0
 473  018a 0b            	dc.b	11
 474  018b 1b            	dc.b	27
 475  018c 2b            	dc.b	43
 476  018d 3b            	dc.b	59
 477  018e 2c            	dc.b	44
 478  018f 0c            	dc.b	12
 479  0190 1c            	dc.b	28
 480  0191 0b            	dc.b	11
 481  0192 0c            	dc.b	12
 482  0193 1c            	dc.b	28
 483  0194 1b            	dc.b	27
 484  0195 2b            	dc.b	43
 485  0196 3b            	dc.b	59
 486  0197 00            	dc.b	0
 487  0198               __nerr:
 488  0198 37            	dc.b	55
 489  0199 38            	dc.b	56
 490  019a 18            	dc.b	24
 491  019b 07            	dc.b	7
 492  019c 28            	dc.b	40
 493  019d 16            	dc.b	22
 494  019e 26            	dc.b	38
 495  019f               __nerrBr:
 496  019f 17            	dc.b	23
 497  01a0 38            	dc.b	56
 498  01a1 18            	dc.b	24
 499  01a2 07            	dc.b	7
 500  01a3 28            	dc.b	40
 501  01a4 16            	dc.b	22
 502  01a5 26            	dc.b	38
 503  01a6               __nm:
 504  01a6 18            	dc.b	24
 505  01a7 28            	dc.b	40
 506  01a8 17            	dc.b	23
 507  01a9               __ncnt:
 508  01a9 28            	dc.b	40
 509  01aa 18            	dc.b	24
 510  01ab 07            	dc.b	7
 511  01ac 16            	dc.b	22
 512  01ad 26            	dc.b	38
 513  01ae 15            	dc.b	21
 514  01af               __nvalve:
 515  01af 17            	dc.b	23
 516  01b0 18            	dc.b	24
 517  01b1 07            	dc.b	7
 518  01b2 16            	dc.b	22
 519  01b3 26            	dc.b	38
 520  01b4 15            	dc.b	21
 521  01b5               __n:
 522  01b5 37            	dc.b	55
 523  01b6 27            	dc.b	39
 524  01b7 17            	dc.b	23
 525  01b8 07            	dc.b	7
 526  01b9 18            	dc.b	24
 527  01ba 38            	dc.b	56
 528  01bb 28            	dc.b	40
 529  01bc 35            	dc.b	53
 530  01bd 25            	dc.b	37
 531  01be 15            	dc.b	21
 532  01bf 05            	dc.b	5
 533  01c0 16            	dc.b	22
 534  01c1 36            	dc.b	54
 535  01c2 26            	dc.b	38
 536  01c3 0d            	dc.b	13
 537  01c4 1d            	dc.b	29
 538  01c5 2d            	dc.b	45
 539  01c6 3d            	dc.b	61
 540  01c7 2e            	dc.b	46
 541  01c8 0e            	dc.b	14
 542  01c9 1e            	dc.b	30
 543  01ca 0b            	dc.b	11
 544  01cb 1b            	dc.b	27
 545  01cc 2b            	dc.b	43
 546  01cd 3b            	dc.b	59
 547  01ce 2c            	dc.b	44
 548  01cf 0c            	dc.b	12
 549  01d0 1c            	dc.b	28
 550  01d1               __nid:
 551  01d1 17            	dc.b	23
 552  01d2 25            	dc.b	37
 553  01d3 15            	dc.b	21
 554  01d4 26            	dc.b	38
 555  01d5 16            	dc.b	22
 556  01d6 05            	dc.b	5
 557  01d7               __info:
 558  01d7 1f            	dc.b	31
 559  01d8 2f            	dc.b	47
 560  01d9 0f            	dc.b	15
 561  01da               __rid:
 562  01da 34            	dc.b	52
 563  01db 33            	dc.b	51
 564  01dc 24            	dc.b	36
 565  01dd 23            	dc.b	35
 566  01de 14            	dc.b	20
 567  01df 13            	dc.b	19
 568  01e0 04            	dc.b	4
 569  01e1 03            	dc.b	3
 570  01e2 01            	dc.b	1
 571  01e3 02            	dc.b	2
 572  01e4 11            	dc.b	17
 573  01e5 12            	dc.b	18
 574  01e6 21            	dc.b	33
 575  01e7 22            	dc.b	34
 576  01e8               __bL:
 577  01e8 38            	dc.b	56
 578  01e9 18            	dc.b	24
 579  01ea 28            	dc.b	40
 580  01eb 07            	dc.b	7
 581  01ec 17            	dc.b	23
 582  01ed 36            	dc.b	54
 583  01ee 16            	dc.b	22
 584  01ef 05            	dc.b	5
 585  01f0               __btn:
 586  01f0 31            	dc.b	49
 587  01f1 3a            	dc.b	58
 588  01f2 30            	dc.b	48
 589  01f3 20            	dc.b	32
 590  01f4 10            	dc.b	16
 591  01f5               __cc:
 592  01f5 29            	dc.b	41
 593  01f6               __cntl_on:
 594  01f6 1e            	dc.b	30
 595  01f7 2e            	dc.b	46
 596  01f8 2d            	dc.b	45
 597  01f9 3d            	dc.b	61
 598  01fa 0b            	dc.b	11
 599  01fb 2c            	dc.b	44
 600  01fc 1c            	dc.b	28
 601  01fd 0c            	dc.b	12
 602  01fe               __cntl_po:
 603  01fe 0d            	dc.b	13
 604  01ff 1d            	dc.b	29
 605  0200 0e            	dc.b	14
 606  0201 1e            	dc.b	30
 607  0202 2e            	dc.b	46
 608  0203 1c            	dc.b	28
 609  0204 2c            	dc.b	44
 610  0205 2b            	dc.b	43
 611  0206 3b            	dc.b	59
 612  0207               __hcLocal:
 613  0207 0e            	dc.b	14
 614  0208 2e            	dc.b	46
 615  0209 3d            	dc.b	61
 616  020a 1c            	dc.b	28
 617  020b 2c            	dc.b	44
 618  020c 3b            	dc.b	59
 619  020d 2b            	dc.b	43
 620  020e               __hcEach:
 621  020e 0d            	dc.b	13
 622  020f 0e            	dc.b	14
 623  0210 1e            	dc.b	30
 624  0211 2e            	dc.b	46
 625  0212 3d            	dc.b	61
 626  0213 0b            	dc.b	11
 627  0214 0c            	dc.b	12
 628  0215 2c            	dc.b	44
 629  0216 1b            	dc.b	27
 630  0217 1c            	dc.b	28
 631  0218 2b            	dc.b	43
 632  0219               __run:
 633  0219 18            	dc.b	24
 634  021a 28            	dc.b	40
 635  021b 16            	dc.b	22
 636  021c 05            	dc.b	5
 637  021d 15            	dc.b	21
 638  021e 2e            	dc.b	46
 639  021f 1e            	dc.b	30
 640  0220 2d            	dc.b	45
 641  0221               __hc:
 642  0221 38            	dc.b	56
 643  0222 18            	dc.b	24
 644  0223 28            	dc.b	40
 645  0224 07            	dc.b	7
 646  0225 26            	dc.b	38
 647  0226 36            	dc.b	54
 648  0227 25            	dc.b	37
 649  0228 15            	dc.b	21
 650  0229               __link:
 651  0229 38            	dc.b	56
 652  022a 18            	dc.b	24
 653  022b 07            	dc.b	7
 654  022c 16            	dc.b	22
 655  022d 26            	dc.b	38
 656  022e 15            	dc.b	21
 657  022f               __cntl_op:
 658  022f 28            	dc.b	40
 659  0230 18            	dc.b	24
 660  0231 17            	dc.b	23
 661  0232 07            	dc.b	7
 662  0233 35            	dc.b	53
 663  0234 25            	dc.b	37
 664  0235 36            	dc.b	54
 665  0236 26            	dc.b	38
 666  0237 16            	dc.b	22
 667  0238               __cntl_2motor:
 668  0238 0d            	dc.b	13
 669  0239 1d            	dc.b	29
 670  023a 3d            	dc.b	61
 671  023b 1e            	dc.b	30
 672  023c 2e            	dc.b	46
 673  023d 1c            	dc.b	28
 674  023e 2c            	dc.b	44
 675  023f 0b            	dc.b	11
 676  0240 0c            	dc.b	12
 677  0241 1b            	dc.b	27
 678  0242               __cntl_tab:
 679  0242 0d            	dc.b	13
 680  0243 0e            	dc.b	14
 681  0244 2e            	dc.b	46
 682  0245 1c            	dc.b	28
 683  0246 2c            	dc.b	44
 684  0247 0c            	dc.b	12
 685  0248 3b            	dc.b	59
 686  0249 2b            	dc.b	43
 687  024a               __mir1:
 688  024a 1d            	dc.b	29
 689  024b 2d            	dc.b	45
 690  024c 2e            	dc.b	46
 691  024d 1e            	dc.b	30
 692  024e 3d            	dc.b	61
 693  024f 1b            	dc.b	27
 694  0250 2b            	dc.b	43
 695  0251               __mir2:
 696  0251 1d            	dc.b	29
 697  0252 2d            	dc.b	45
 698  0253 2e            	dc.b	46
 699  0254 1e            	dc.b	30
 700  0255 3d            	dc.b	61
 701  0256 0b            	dc.b	11
 702  0257 1b            	dc.b	27
 703  0258 1c            	dc.b	28
 704  0259 2c            	dc.b	44
 705  025a 3b            	dc.b	59
 706  025b               __freset:
 707  025b 0d            	dc.b	13
 708  025c 0e            	dc.b	14
 709  025d 2e            	dc.b	46
 710  025e 1e            	dc.b	30
 711  025f 1c            	dc.b	28
 712  0260 2c            	dc.b	44
 713  0261               __len:
 714  0261 38            	dc.b	56
 715  0262 18            	dc.b	24
 716  0263 07            	dc.b	7
 717  0264               __po_type:
 718  0264 26            	dc.b	38
 719  0265 16            	dc.b	22
 720  0266 15            	dc.b	21
 721  0267 05            	dc.b	5
 722  0268 37            	dc.b	55
 723  0269 27            	dc.b	39
 724  026a 38            	dc.b	56
 725  026b 28            	dc.b	40
 726  026c 18            	dc.b	24
 727  026d               __po_type_xl:
 728  026d 0c            	dc.b	12
 729  026e 2c            	dc.b	44
 730  026f 3b            	dc.b	59
 731  0270 0e            	dc.b	14
 732  0271 1d            	dc.b	29
 733  0272 2d            	dc.b	45
 734  0273 1e            	dc.b	30
 735  0274 2e            	dc.b	46
 736  0275               __po_type_pb:
 737  0275 1c            	dc.b	28
 738  0276 2c            	dc.b	44
 739  0277 2b            	dc.b	43
 740  0278 3b            	dc.b	59
 741  0279 0c            	dc.b	12
 742  027a 0d            	dc.b	13
 743  027b 1d            	dc.b	29
 744  027c 0e            	dc.b	14
 745  027d 1e            	dc.b	30
 746  027e 2e            	dc.b	46
 747  027f               __temp_offset:
 748  027f 28            	dc.b	40
 749  0280 18            	dc.b	24
 750  0281 07            	dc.b	7
 751  0282 38            	dc.b	56
 752  0283               __lpm:
 753  0283 38            	dc.b	56
 754  0284 18            	dc.b	24
 755  0285 07            	dc.b	7
 756  0286 16            	dc.b	22
 757  0287 26            	dc.b	38
 758  0288 35            	dc.b	53
 759  0289 36            	dc.b	54
 760  028a 25            	dc.b	37
 761  028b               __cnt_host:
 762  028b 1d            	dc.b	29
 763  028c 2d            	dc.b	45
 764  028d 2e            	dc.b	46
 765  028e 1e            	dc.b	30
 766  028f 0e            	dc.b	14
 767  0290 1c            	dc.b	28
 768  0291 2b            	dc.b	43
 769  0292 2c            	dc.b	44
 770  0293 3b            	dc.b	59
 771  0294               __cnt_sub:
 772  0294 0d            	dc.b	13
 773  0295 2d            	dc.b	45
 774  0296 0e            	dc.b	14
 775  0297 1e            	dc.b	30
 776  0298 3d            	dc.b	61
 777  0299 2c            	dc.b	44
 778  029a 3b            	dc.b	59
 779  029b 2b            	dc.b	43
 780  029c               __plc:
 781  029c 37            	dc.b	55
 782  029d 27            	dc.b	39
 783  029e 38            	dc.b	56
 784  029f 18            	dc.b	24
 785  02a0 28            	dc.b	40
 786  02a1 16            	dc.b	22
 787  02a2 05            	dc.b	5
 788  02a3 36            	dc.b	54
 789  02a4 0d            	dc.b	13
 790  02a5 0e            	dc.b	14
 791  02a6 2e            	dc.b	46
 792  02a7 3d            	dc.b	61
 832                     ; 318 LCD_DISP_FUNC_1(lcd_disp_plc, 12, _plc)
 833                     .text:	section	.text,new
 834  0000               _lcd_disp_plc:
 836  0000 89            	pushw	x
 837       00000002      OFST:	set	2
 840  0001 4f            	clr	a
 841  0002 6b02          	ld	(OFST+0,sp),a
 842  0004               L34:
 845  0004 5f            	clrw	x
 846  0005 97            	ld	xl,a
 847  0006 d6029c        	ld	a,(__plc,x)
 848  0009 6b01          	ld	(OFST-1,sp),a
 851  000b 5f            	clrw	x
 852  000c 97            	ld	xl,a
 853  000d d60040        	ld	a,(_iLF_DEF,x)
 854  0010 5f            	clrw	x
 855  0011 97            	ld	xl,a
 856  0012 7b01          	ld	a,(OFST-1,sp)
 857  0014 905f          	clrw	y
 858  0016 9097          	ld	yl,a
 859  0018 d6540c        	ld	a,(21516,x)
 860  001b 90da0000      	or	a,(_bLF_DEF,y)
 861  001f d7540c        	ld	(21516,x),a
 864  0022 0c02          	inc	(OFST+0,sp)
 867  0024 7b02          	ld	a,(OFST+0,sp)
 868  0026 a10c          	cp	a,#12
 869  0028 25da          	jrult	L34
 873  002a 85            	popw	x
 874  002b 81            	ret	
 916                     ; 320 LCD_DISP_FUNC_1(lcd_disp_cnt_host, 9, _cnt_host)
 917                     .text:	section	.text,new
 918  0000               _lcd_disp_cnt_host:
 920  0000 89            	pushw	x
 921       00000002      OFST:	set	2
 924  0001 4f            	clr	a
 925  0002 6b02          	ld	(OFST+0,sp),a
 926  0004               L76:
 929  0004 5f            	clrw	x
 930  0005 97            	ld	xl,a
 931  0006 d6028b        	ld	a,(__cnt_host,x)
 932  0009 6b01          	ld	(OFST-1,sp),a
 935  000b 5f            	clrw	x
 936  000c 97            	ld	xl,a
 937  000d d60040        	ld	a,(_iLF_DEF,x)
 938  0010 5f            	clrw	x
 939  0011 97            	ld	xl,a
 940  0012 7b01          	ld	a,(OFST-1,sp)
 941  0014 905f          	clrw	y
 942  0016 9097          	ld	yl,a
 943  0018 d6540c        	ld	a,(21516,x)
 944  001b 90da0000      	or	a,(_bLF_DEF,y)
 945  001f d7540c        	ld	(21516,x),a
 948  0022 0c02          	inc	(OFST+0,sp)
 951  0024 7b02          	ld	a,(OFST+0,sp)
 952  0026 a109          	cp	a,#9
 953  0028 25da          	jrult	L76
 957  002a 85            	popw	x
 958  002b 81            	ret	
1000                     ; 321 LCD_DISP_FUNC_1(lcd_disp_cnt_sub, 8, _cnt_sub)
1001                     .text:	section	.text,new
1002  0000               _lcd_disp_cnt_sub:
1004  0000 89            	pushw	x
1005       00000002      OFST:	set	2
1008  0001 4f            	clr	a
1009  0002 6b02          	ld	(OFST+0,sp),a
1010  0004               L311:
1013  0004 5f            	clrw	x
1014  0005 97            	ld	xl,a
1015  0006 d60294        	ld	a,(__cnt_sub,x)
1016  0009 6b01          	ld	(OFST-1,sp),a
1019  000b 5f            	clrw	x
1020  000c 97            	ld	xl,a
1021  000d d60040        	ld	a,(_iLF_DEF,x)
1022  0010 5f            	clrw	x
1023  0011 97            	ld	xl,a
1024  0012 7b01          	ld	a,(OFST-1,sp)
1025  0014 905f          	clrw	y
1026  0016 9097          	ld	yl,a
1027  0018 d6540c        	ld	a,(21516,x)
1028  001b 90da0000      	or	a,(_bLF_DEF,y)
1029  001f d7540c        	ld	(21516,x),a
1032  0022 0c02          	inc	(OFST+0,sp)
1035  0024 7b02          	ld	a,(OFST+0,sp)
1036  0026 a108          	cp	a,#8
1037  0028 25da          	jrult	L311
1041  002a 85            	popw	x
1042  002b 81            	ret	
1084                     ; 323 LCD_DISP_FUNC_1(lcd_disp_mir1, 7, _mir1)
1085                     .text:	section	.text,new
1086  0000               _lcd_disp_mir1:
1088  0000 89            	pushw	x
1089       00000002      OFST:	set	2
1092  0001 4f            	clr	a
1093  0002 6b02          	ld	(OFST+0,sp),a
1094  0004               L731:
1097  0004 5f            	clrw	x
1098  0005 97            	ld	xl,a
1099  0006 d6024a        	ld	a,(__mir1,x)
1100  0009 6b01          	ld	(OFST-1,sp),a
1103  000b 5f            	clrw	x
1104  000c 97            	ld	xl,a
1105  000d d60040        	ld	a,(_iLF_DEF,x)
1106  0010 5f            	clrw	x
1107  0011 97            	ld	xl,a
1108  0012 7b01          	ld	a,(OFST-1,sp)
1109  0014 905f          	clrw	y
1110  0016 9097          	ld	yl,a
1111  0018 d6540c        	ld	a,(21516,x)
1112  001b 90da0000      	or	a,(_bLF_DEF,y)
1113  001f d7540c        	ld	(21516,x),a
1116  0022 0c02          	inc	(OFST+0,sp)
1119  0024 7b02          	ld	a,(OFST+0,sp)
1120  0026 a107          	cp	a,#7
1121  0028 25da          	jrult	L731
1125  002a 85            	popw	x
1126  002b 81            	ret	
1168                     ; 324 LCD_DISP_FUNC_1(lcd_disp_mir2, 10, _mir2)
1169                     .text:	section	.text,new
1170  0000               _lcd_disp_mir2:
1172  0000 89            	pushw	x
1173       00000002      OFST:	set	2
1176  0001 4f            	clr	a
1177  0002 6b02          	ld	(OFST+0,sp),a
1178  0004               L361:
1181  0004 5f            	clrw	x
1182  0005 97            	ld	xl,a
1183  0006 d60251        	ld	a,(__mir2,x)
1184  0009 6b01          	ld	(OFST-1,sp),a
1187  000b 5f            	clrw	x
1188  000c 97            	ld	xl,a
1189  000d d60040        	ld	a,(_iLF_DEF,x)
1190  0010 5f            	clrw	x
1191  0011 97            	ld	xl,a
1192  0012 7b01          	ld	a,(OFST-1,sp)
1193  0014 905f          	clrw	y
1194  0016 9097          	ld	yl,a
1195  0018 d6540c        	ld	a,(21516,x)
1196  001b 90da0000      	or	a,(_bLF_DEF,y)
1197  001f d7540c        	ld	(21516,x),a
1200  0022 0c02          	inc	(OFST+0,sp)
1203  0024 7b02          	ld	a,(OFST+0,sp)
1204  0026 a10a          	cp	a,#10
1205  0028 25da          	jrult	L361
1209  002a 85            	popw	x
1210  002b 81            	ret	
1252                     ; 325 LCD_DISP_FUNC_1(lcd_disp_freset, 6, _freset)
1253                     .text:	section	.text,new
1254  0000               _lcd_disp_freset:
1256  0000 89            	pushw	x
1257       00000002      OFST:	set	2
1260  0001 4f            	clr	a
1261  0002 6b02          	ld	(OFST+0,sp),a
1262  0004               L702:
1265  0004 5f            	clrw	x
1266  0005 97            	ld	xl,a
1267  0006 d6025b        	ld	a,(__freset,x)
1268  0009 6b01          	ld	(OFST-1,sp),a
1271  000b 5f            	clrw	x
1272  000c 97            	ld	xl,a
1273  000d d60040        	ld	a,(_iLF_DEF,x)
1274  0010 5f            	clrw	x
1275  0011 97            	ld	xl,a
1276  0012 7b01          	ld	a,(OFST-1,sp)
1277  0014 905f          	clrw	y
1278  0016 9097          	ld	yl,a
1279  0018 d6540c        	ld	a,(21516,x)
1280  001b 90da0000      	or	a,(_bLF_DEF,y)
1281  001f d7540c        	ld	(21516,x),a
1284  0022 0c02          	inc	(OFST+0,sp)
1287  0024 7b02          	ld	a,(OFST+0,sp)
1288  0026 a106          	cp	a,#6
1289  0028 25da          	jrult	L702
1293  002a 85            	popw	x
1294  002b 81            	ret	
1337                     ; 327 LCD_DISP_FUNC(lcd_disp_backlight, 8, _bL)
1338                     .text:	section	.text,new
1339  0000               _lcd_disp_backlight:
1341  0000 89            	pushw	x
1342       00000002      OFST:	set	2
1347  0001 cd0000        	call	_lcd_clear_n
1350  0004 4f            	clr	a
1351  0005 6b02          	ld	(OFST+0,sp),a
1352  0007               L332:
1355  0007 5f            	clrw	x
1356  0008 97            	ld	xl,a
1357  0009 d601e8        	ld	a,(__bL,x)
1358  000c 6b01          	ld	(OFST-1,sp),a
1361  000e 5f            	clrw	x
1362  000f 97            	ld	xl,a
1363  0010 d60040        	ld	a,(_iLF_DEF,x)
1364  0013 5f            	clrw	x
1365  0014 97            	ld	xl,a
1366  0015 7b01          	ld	a,(OFST-1,sp)
1367  0017 905f          	clrw	y
1368  0019 9097          	ld	yl,a
1369  001b d6540c        	ld	a,(21516,x)
1370  001e 90da0000      	or	a,(_bLF_DEF,y)
1371  0022 d7540c        	ld	(21516,x),a
1374  0025 0c02          	inc	(OFST+0,sp)
1377  0027 7b02          	ld	a,(OFST+0,sp)
1378  0029 a108          	cp	a,#8
1379  002b 25da          	jrult	L332
1383  002d 85            	popw	x
1384  002e 81            	ret	
1427                     ; 329 LCD_DISP_FUNC(lcd_disp_setup_lpm, 8, _lpm)
1428                     .text:	section	.text,new
1429  0000               _lcd_disp_setup_lpm:
1431  0000 89            	pushw	x
1432       00000002      OFST:	set	2
1437  0001 cd0000        	call	_lcd_clear_n
1440  0004 4f            	clr	a
1441  0005 6b02          	ld	(OFST+0,sp),a
1442  0007               L752:
1445  0007 5f            	clrw	x
1446  0008 97            	ld	xl,a
1447  0009 d60283        	ld	a,(__lpm,x)
1448  000c 6b01          	ld	(OFST-1,sp),a
1451  000e 5f            	clrw	x
1452  000f 97            	ld	xl,a
1453  0010 d60040        	ld	a,(_iLF_DEF,x)
1454  0013 5f            	clrw	x
1455  0014 97            	ld	xl,a
1456  0015 7b01          	ld	a,(OFST-1,sp)
1457  0017 905f          	clrw	y
1458  0019 9097          	ld	yl,a
1459  001b d6540c        	ld	a,(21516,x)
1460  001e 90da0000      	or	a,(_bLF_DEF,y)
1461  0022 d7540c        	ld	(21516,x),a
1464  0025 0c02          	inc	(OFST+0,sp)
1467  0027 7b02          	ld	a,(OFST+0,sp)
1468  0029 a108          	cp	a,#8
1469  002b 25da          	jrult	L752
1473  002d 85            	popw	x
1474  002e 81            	ret	
1518                     ; 330 LCD_DISP_FUNC(lcd_disp_setup_temp_offset, 4, _temp_offset)
1519                     .text:	section	.text,new
1520  0000               _lcd_disp_setup_temp_offset:
1522  0000 89            	pushw	x
1523       00000002      OFST:	set	2
1528  0001 cd0000        	call	_lcd_clear_n
1531  0004 4f            	clr	a
1532  0005 6b02          	ld	(OFST+0,sp),a
1533  0007               L303:
1536  0007 5f            	clrw	x
1537  0008 97            	ld	xl,a
1538  0009 d6027f        	ld	a,(__temp_offset,x)
1539  000c 6b01          	ld	(OFST-1,sp),a
1542  000e 5f            	clrw	x
1543  000f 97            	ld	xl,a
1544  0010 d60040        	ld	a,(_iLF_DEF,x)
1545  0013 5f            	clrw	x
1546  0014 97            	ld	xl,a
1547  0015 7b01          	ld	a,(OFST-1,sp)
1548  0017 905f          	clrw	y
1549  0019 9097          	ld	yl,a
1550  001b d6540c        	ld	a,(21516,x)
1551  001e 90da0000      	or	a,(_bLF_DEF,y)
1552  0022 d7540c        	ld	(21516,x),a
1555  0025 0c02          	inc	(OFST+0,sp)
1558  0027 7b02          	ld	a,(OFST+0,sp)
1559  0029 a104          	cp	a,#4
1560  002b 25da          	jrult	L303
1564  002d 85            	popw	x
1565  002e 81            	ret	
1609                     ; 332 LCD_DISP_FUNC(lcd_disp_setup_po_type, 9, _po_type)
1610                     .text:	section	.text,new
1611  0000               _lcd_disp_setup_po_type:
1613  0000 89            	pushw	x
1614       00000002      OFST:	set	2
1619  0001 cd0000        	call	_lcd_clear_n
1622  0004 4f            	clr	a
1623  0005 6b02          	ld	(OFST+0,sp),a
1624  0007               L723:
1627  0007 5f            	clrw	x
1628  0008 97            	ld	xl,a
1629  0009 d60264        	ld	a,(__po_type,x)
1630  000c 6b01          	ld	(OFST-1,sp),a
1633  000e 5f            	clrw	x
1634  000f 97            	ld	xl,a
1635  0010 d60040        	ld	a,(_iLF_DEF,x)
1636  0013 5f            	clrw	x
1637  0014 97            	ld	xl,a
1638  0015 7b01          	ld	a,(OFST-1,sp)
1639  0017 905f          	clrw	y
1640  0019 9097          	ld	yl,a
1641  001b d6540c        	ld	a,(21516,x)
1642  001e 90da0000      	or	a,(_bLF_DEF,y)
1643  0022 d7540c        	ld	(21516,x),a
1646  0025 0c02          	inc	(OFST+0,sp)
1649  0027 7b02          	ld	a,(OFST+0,sp)
1650  0029 a109          	cp	a,#9
1651  002b 25da          	jrult	L723
1655  002d 85            	popw	x
1656  002e 81            	ret	
1699                     ; 333 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_xl, 8, _po_type_xl)
1700                     .text:	section	.text,new
1701  0000               _lcd_disp_setup_po_type_xl:
1703  0000 89            	pushw	x
1704       00000002      OFST:	set	2
1707  0001 4f            	clr	a
1708  0002 6b02          	ld	(OFST+0,sp),a
1709  0004               L353:
1712  0004 5f            	clrw	x
1713  0005 97            	ld	xl,a
1714  0006 d6026d        	ld	a,(__po_type_xl,x)
1715  0009 6b01          	ld	(OFST-1,sp),a
1718  000b 5f            	clrw	x
1719  000c 97            	ld	xl,a
1720  000d d60040        	ld	a,(_iLF_DEF,x)
1721  0010 5f            	clrw	x
1722  0011 97            	ld	xl,a
1723  0012 7b01          	ld	a,(OFST-1,sp)
1724  0014 905f          	clrw	y
1725  0016 9097          	ld	yl,a
1726  0018 d6540c        	ld	a,(21516,x)
1727  001b 90da0000      	or	a,(_bLF_DEF,y)
1728  001f d7540c        	ld	(21516,x),a
1731  0022 0c02          	inc	(OFST+0,sp)
1734  0024 7b02          	ld	a,(OFST+0,sp)
1735  0026 a108          	cp	a,#8
1736  0028 25da          	jrult	L353
1740  002a 85            	popw	x
1741  002b 81            	ret	
1784                     ; 334 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_pb, 10, _po_type_pb)
1785                     .text:	section	.text,new
1786  0000               _lcd_disp_setup_po_type_pb:
1788  0000 89            	pushw	x
1789       00000002      OFST:	set	2
1792  0001 4f            	clr	a
1793  0002 6b02          	ld	(OFST+0,sp),a
1794  0004               L773:
1797  0004 5f            	clrw	x
1798  0005 97            	ld	xl,a
1799  0006 d60275        	ld	a,(__po_type_pb,x)
1800  0009 6b01          	ld	(OFST-1,sp),a
1803  000b 5f            	clrw	x
1804  000c 97            	ld	xl,a
1805  000d d60040        	ld	a,(_iLF_DEF,x)
1806  0010 5f            	clrw	x
1807  0011 97            	ld	xl,a
1808  0012 7b01          	ld	a,(OFST-1,sp)
1809  0014 905f          	clrw	y
1810  0016 9097          	ld	yl,a
1811  0018 d6540c        	ld	a,(21516,x)
1812  001b 90da0000      	or	a,(_bLF_DEF,y)
1813  001f d7540c        	ld	(21516,x),a
1816  0022 0c02          	inc	(OFST+0,sp)
1819  0024 7b02          	ld	a,(OFST+0,sp)
1820  0026 a10a          	cp	a,#10
1821  0028 25da          	jrult	L773
1825  002a 85            	popw	x
1826  002b 81            	ret	
1869                     ; 338 LCD_DISP_FUNC(lcd_disp_setup_len, 3, _len)
1870                     .text:	section	.text,new
1871  0000               _lcd_disp_setup_len:
1873  0000 89            	pushw	x
1874       00000002      OFST:	set	2
1879  0001 cd0000        	call	_lcd_clear_n
1882  0004 4f            	clr	a
1883  0005 6b02          	ld	(OFST+0,sp),a
1884  0007               L324:
1887  0007 5f            	clrw	x
1888  0008 97            	ld	xl,a
1889  0009 d60261        	ld	a,(__len,x)
1890  000c 6b01          	ld	(OFST-1,sp),a
1893  000e 5f            	clrw	x
1894  000f 97            	ld	xl,a
1895  0010 d60040        	ld	a,(_iLF_DEF,x)
1896  0013 5f            	clrw	x
1897  0014 97            	ld	xl,a
1898  0015 7b01          	ld	a,(OFST-1,sp)
1899  0017 905f          	clrw	y
1900  0019 9097          	ld	yl,a
1901  001b d6540c        	ld	a,(21516,x)
1902  001e 90da0000      	or	a,(_bLF_DEF,y)
1903  0022 d7540c        	ld	(21516,x),a
1906  0025 0c02          	inc	(OFST+0,sp)
1909  0027 7b02          	ld	a,(OFST+0,sp)
1910  0029 a103          	cp	a,#3
1911  002b 25da          	jrult	L324
1915  002d 85            	popw	x
1916  002e 81            	ret	
1960                     ; 339 LCD_DISP_FUNC(lcd_disp_setup_cntl_op, 9, _cntl_op)
1961                     .text:	section	.text,new
1962  0000               _lcd_disp_setup_cntl_op:
1964  0000 89            	pushw	x
1965       00000002      OFST:	set	2
1970  0001 cd0000        	call	_lcd_clear_n
1973  0004 4f            	clr	a
1974  0005 6b02          	ld	(OFST+0,sp),a
1975  0007               L744:
1978  0007 5f            	clrw	x
1979  0008 97            	ld	xl,a
1980  0009 d6022f        	ld	a,(__cntl_op,x)
1981  000c 6b01          	ld	(OFST-1,sp),a
1984  000e 5f            	clrw	x
1985  000f 97            	ld	xl,a
1986  0010 d60040        	ld	a,(_iLF_DEF,x)
1987  0013 5f            	clrw	x
1988  0014 97            	ld	xl,a
1989  0015 7b01          	ld	a,(OFST-1,sp)
1990  0017 905f          	clrw	y
1991  0019 9097          	ld	yl,a
1992  001b d6540c        	ld	a,(21516,x)
1993  001e 90da0000      	or	a,(_bLF_DEF,y)
1994  0022 d7540c        	ld	(21516,x),a
1997  0025 0c02          	inc	(OFST+0,sp)
2000  0027 7b02          	ld	a,(OFST+0,sp)
2001  0029 a109          	cp	a,#9
2002  002b 25da          	jrult	L744
2006  002d 85            	popw	x
2007  002e 81            	ret	
2050                     ; 340 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_on, 8, _cntl_on)
2051                     .text:	section	.text,new
2052  0000               _lcd_disp_setup_cntl_on:
2054  0000 89            	pushw	x
2055       00000002      OFST:	set	2
2058  0001 4f            	clr	a
2059  0002 6b02          	ld	(OFST+0,sp),a
2060  0004               L374:
2063  0004 5f            	clrw	x
2064  0005 97            	ld	xl,a
2065  0006 d601f6        	ld	a,(__cntl_on,x)
2066  0009 6b01          	ld	(OFST-1,sp),a
2069  000b 5f            	clrw	x
2070  000c 97            	ld	xl,a
2071  000d d60040        	ld	a,(_iLF_DEF,x)
2072  0010 5f            	clrw	x
2073  0011 97            	ld	xl,a
2074  0012 7b01          	ld	a,(OFST-1,sp)
2075  0014 905f          	clrw	y
2076  0016 9097          	ld	yl,a
2077  0018 d6540c        	ld	a,(21516,x)
2078  001b 90da0000      	or	a,(_bLF_DEF,y)
2079  001f d7540c        	ld	(21516,x),a
2082  0022 0c02          	inc	(OFST+0,sp)
2085  0024 7b02          	ld	a,(OFST+0,sp)
2086  0026 a108          	cp	a,#8
2087  0028 25da          	jrult	L374
2091  002a 85            	popw	x
2092  002b 81            	ret	
2135                     ; 341 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_po, 9, _cntl_po)
2136                     .text:	section	.text,new
2137  0000               _lcd_disp_setup_cntl_po:
2139  0000 89            	pushw	x
2140       00000002      OFST:	set	2
2143  0001 4f            	clr	a
2144  0002 6b02          	ld	(OFST+0,sp),a
2145  0004               L715:
2148  0004 5f            	clrw	x
2149  0005 97            	ld	xl,a
2150  0006 d601fe        	ld	a,(__cntl_po,x)
2151  0009 6b01          	ld	(OFST-1,sp),a
2154  000b 5f            	clrw	x
2155  000c 97            	ld	xl,a
2156  000d d60040        	ld	a,(_iLF_DEF,x)
2157  0010 5f            	clrw	x
2158  0011 97            	ld	xl,a
2159  0012 7b01          	ld	a,(OFST-1,sp)
2160  0014 905f          	clrw	y
2161  0016 9097          	ld	yl,a
2162  0018 d6540c        	ld	a,(21516,x)
2163  001b 90da0000      	or	a,(_bLF_DEF,y)
2164  001f d7540c        	ld	(21516,x),a
2167  0022 0c02          	inc	(OFST+0,sp)
2170  0024 7b02          	ld	a,(OFST+0,sp)
2171  0026 a109          	cp	a,#9
2172  0028 25da          	jrult	L715
2176  002a 85            	popw	x
2177  002b 81            	ret	
2220                     ; 342 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_2motor, 10, _cntl_2motor)
2221                     .text:	section	.text,new
2222  0000               _lcd_disp_setup_cntl_2motor:
2224  0000 89            	pushw	x
2225       00000002      OFST:	set	2
2228  0001 4f            	clr	a
2229  0002 6b02          	ld	(OFST+0,sp),a
2230  0004               L345:
2233  0004 5f            	clrw	x
2234  0005 97            	ld	xl,a
2235  0006 d60238        	ld	a,(__cntl_2motor,x)
2236  0009 6b01          	ld	(OFST-1,sp),a
2239  000b 5f            	clrw	x
2240  000c 97            	ld	xl,a
2241  000d d60040        	ld	a,(_iLF_DEF,x)
2242  0010 5f            	clrw	x
2243  0011 97            	ld	xl,a
2244  0012 7b01          	ld	a,(OFST-1,sp)
2245  0014 905f          	clrw	y
2246  0016 9097          	ld	yl,a
2247  0018 d6540c        	ld	a,(21516,x)
2248  001b 90da0000      	or	a,(_bLF_DEF,y)
2249  001f d7540c        	ld	(21516,x),a
2252  0022 0c02          	inc	(OFST+0,sp)
2255  0024 7b02          	ld	a,(OFST+0,sp)
2256  0026 a10a          	cp	a,#10
2257  0028 25da          	jrult	L345
2261  002a 85            	popw	x
2262  002b 81            	ret	
2305                     ; 343 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_tab, 8, _cntl_tab)
2306                     .text:	section	.text,new
2307  0000               _lcd_disp_setup_cntl_tab:
2309  0000 89            	pushw	x
2310       00000002      OFST:	set	2
2313  0001 4f            	clr	a
2314  0002 6b02          	ld	(OFST+0,sp),a
2315  0004               L765:
2318  0004 5f            	clrw	x
2319  0005 97            	ld	xl,a
2320  0006 d60242        	ld	a,(__cntl_tab,x)
2321  0009 6b01          	ld	(OFST-1,sp),a
2324  000b 5f            	clrw	x
2325  000c 97            	ld	xl,a
2326  000d d60040        	ld	a,(_iLF_DEF,x)
2327  0010 5f            	clrw	x
2328  0011 97            	ld	xl,a
2329  0012 7b01          	ld	a,(OFST-1,sp)
2330  0014 905f          	clrw	y
2331  0016 9097          	ld	yl,a
2332  0018 d6540c        	ld	a,(21516,x)
2333  001b 90da0000      	or	a,(_bLF_DEF,y)
2334  001f d7540c        	ld	(21516,x),a
2337  0022 0c02          	inc	(OFST+0,sp)
2340  0024 7b02          	ld	a,(OFST+0,sp)
2341  0026 a108          	cp	a,#8
2342  0028 25da          	jrult	L765
2346  002a 85            	popw	x
2347  002b 81            	ret	
2390                     ; 345 LCD_DISP_FUNC(lcd_disp_setup_c, 1, _cc)
2391                     .text:	section	.text,new
2392  0000               _lcd_disp_setup_c:
2394  0000 89            	pushw	x
2395       00000002      OFST:	set	2
2400  0001 cd0000        	call	_lcd_clear_n
2403  0004 0f02          	clr	(OFST+0,sp)
2404  0006               L316:
2407  0006 7b02          	ld	a,(OFST+0,sp)
2408  0008 5f            	clrw	x
2409  0009 97            	ld	xl,a
2410  000a d601f5        	ld	a,(__cc,x)
2411  000d 6b01          	ld	(OFST-1,sp),a
2414  000f 5f            	clrw	x
2415  0010 97            	ld	xl,a
2416  0011 d60040        	ld	a,(_iLF_DEF,x)
2417  0014 5f            	clrw	x
2418  0015 97            	ld	xl,a
2419  0016 7b01          	ld	a,(OFST-1,sp)
2420  0018 905f          	clrw	y
2421  001a 9097          	ld	yl,a
2422  001c d6540c        	ld	a,(21516,x)
2423  001f 90da0000      	or	a,(_bLF_DEF,y)
2424  0023 d7540c        	ld	(21516,x),a
2427  0026 0c02          	inc	(OFST+0,sp)
2430  0028 27dc          	jreq	L316
2434  002a 85            	popw	x
2435  002b 81            	ret	
2479                     ; 347 LCD_DISP_FUNC(lcd_disp_setup_link, 6, _link)
2480                     .text:	section	.text,new
2481  0000               _lcd_disp_setup_link:
2483  0000 89            	pushw	x
2484       00000002      OFST:	set	2
2489  0001 cd0000        	call	_lcd_clear_n
2492  0004 4f            	clr	a
2493  0005 6b02          	ld	(OFST+0,sp),a
2494  0007               L736:
2497  0007 5f            	clrw	x
2498  0008 97            	ld	xl,a
2499  0009 d60229        	ld	a,(__link,x)
2500  000c 6b01          	ld	(OFST-1,sp),a
2503  000e 5f            	clrw	x
2504  000f 97            	ld	xl,a
2505  0010 d60040        	ld	a,(_iLF_DEF,x)
2506  0013 5f            	clrw	x
2507  0014 97            	ld	xl,a
2508  0015 7b01          	ld	a,(OFST-1,sp)
2509  0017 905f          	clrw	y
2510  0019 9097          	ld	yl,a
2511  001b d6540c        	ld	a,(21516,x)
2512  001e 90da0000      	or	a,(_bLF_DEF,y)
2513  0022 d7540c        	ld	(21516,x),a
2516  0025 0c02          	inc	(OFST+0,sp)
2519  0027 7b02          	ld	a,(OFST+0,sp)
2520  0029 a106          	cp	a,#6
2521  002b 25da          	jrult	L736
2525  002d 85            	popw	x
2526  002e 81            	ret	
2569                     ; 349 LCD_DISP_FUNC(lcd_disp_setup_run, 8, _run)
2570                     .text:	section	.text,new
2571  0000               _lcd_disp_setup_run:
2573  0000 89            	pushw	x
2574       00000002      OFST:	set	2
2579  0001 cd0000        	call	_lcd_clear_n
2582  0004 4f            	clr	a
2583  0005 6b02          	ld	(OFST+0,sp),a
2584  0007               L366:
2587  0007 5f            	clrw	x
2588  0008 97            	ld	xl,a
2589  0009 d60219        	ld	a,(__run,x)
2590  000c 6b01          	ld	(OFST-1,sp),a
2593  000e 5f            	clrw	x
2594  000f 97            	ld	xl,a
2595  0010 d60040        	ld	a,(_iLF_DEF,x)
2596  0013 5f            	clrw	x
2597  0014 97            	ld	xl,a
2598  0015 7b01          	ld	a,(OFST-1,sp)
2599  0017 905f          	clrw	y
2600  0019 9097          	ld	yl,a
2601  001b d6540c        	ld	a,(21516,x)
2602  001e 90da0000      	or	a,(_bLF_DEF,y)
2603  0022 d7540c        	ld	(21516,x),a
2606  0025 0c02          	inc	(OFST+0,sp)
2609  0027 7b02          	ld	a,(OFST+0,sp)
2610  0029 a108          	cp	a,#8
2611  002b 25da          	jrult	L366
2615  002d 85            	popw	x
2616  002e 81            	ret	
2659                     ; 351 LCD_DISP_FUNC_1(lcd_disp_setup_mode_local, 7, _hcLocal)
2660                     .text:	section	.text,new
2661  0000               _lcd_disp_setup_mode_local:
2663  0000 89            	pushw	x
2664       00000002      OFST:	set	2
2667  0001 4f            	clr	a
2668  0002 6b02          	ld	(OFST+0,sp),a
2669  0004               L707:
2672  0004 5f            	clrw	x
2673  0005 97            	ld	xl,a
2674  0006 d60207        	ld	a,(__hcLocal,x)
2675  0009 6b01          	ld	(OFST-1,sp),a
2678  000b 5f            	clrw	x
2679  000c 97            	ld	xl,a
2680  000d d60040        	ld	a,(_iLF_DEF,x)
2681  0010 5f            	clrw	x
2682  0011 97            	ld	xl,a
2683  0012 7b01          	ld	a,(OFST-1,sp)
2684  0014 905f          	clrw	y
2685  0016 9097          	ld	yl,a
2686  0018 d6540c        	ld	a,(21516,x)
2687  001b 90da0000      	or	a,(_bLF_DEF,y)
2688  001f d7540c        	ld	(21516,x),a
2691  0022 0c02          	inc	(OFST+0,sp)
2694  0024 7b02          	ld	a,(OFST+0,sp)
2695  0026 a107          	cp	a,#7
2696  0028 25da          	jrult	L707
2700  002a 85            	popw	x
2701  002b 81            	ret	
2744                     ; 352 LCD_DISP_FUNC_1(lcd_disp_setup_mode_each, 11, _hcEach)
2745                     .text:	section	.text,new
2746  0000               _lcd_disp_setup_mode_each:
2748  0000 89            	pushw	x
2749       00000002      OFST:	set	2
2752  0001 4f            	clr	a
2753  0002 6b02          	ld	(OFST+0,sp),a
2754  0004               L337:
2757  0004 5f            	clrw	x
2758  0005 97            	ld	xl,a
2759  0006 d6020e        	ld	a,(__hcEach,x)
2760  0009 6b01          	ld	(OFST-1,sp),a
2763  000b 5f            	clrw	x
2764  000c 97            	ld	xl,a
2765  000d d60040        	ld	a,(_iLF_DEF,x)
2766  0010 5f            	clrw	x
2767  0011 97            	ld	xl,a
2768  0012 7b01          	ld	a,(OFST-1,sp)
2769  0014 905f          	clrw	y
2770  0016 9097          	ld	yl,a
2771  0018 d6540c        	ld	a,(21516,x)
2772  001b 90da0000      	or	a,(_bLF_DEF,y)
2773  001f d7540c        	ld	(21516,x),a
2776  0022 0c02          	inc	(OFST+0,sp)
2779  0024 7b02          	ld	a,(OFST+0,sp)
2780  0026 a10b          	cp	a,#11
2781  0028 25da          	jrult	L337
2785  002a 85            	popw	x
2786  002b 81            	ret	
2830                     ; 353 LCD_DISP_FUNC(lcd_disp_setup_mode, 8, _hc)
2831                     .text:	section	.text,new
2832  0000               _lcd_disp_setup_mode:
2834  0000 89            	pushw	x
2835       00000002      OFST:	set	2
2840  0001 cd0000        	call	_lcd_clear_n
2843  0004 4f            	clr	a
2844  0005 6b02          	ld	(OFST+0,sp),a
2845  0007               L757:
2848  0007 5f            	clrw	x
2849  0008 97            	ld	xl,a
2850  0009 d60221        	ld	a,(__hc,x)
2851  000c 6b01          	ld	(OFST-1,sp),a
2854  000e 5f            	clrw	x
2855  000f 97            	ld	xl,a
2856  0010 d60040        	ld	a,(_iLF_DEF,x)
2857  0013 5f            	clrw	x
2858  0014 97            	ld	xl,a
2859  0015 7b01          	ld	a,(OFST-1,sp)
2860  0017 905f          	clrw	y
2861  0019 9097          	ld	yl,a
2862  001b d6540c        	ld	a,(21516,x)
2863  001e 90da0000      	or	a,(_bLF_DEF,y)
2864  0022 d7540c        	ld	(21516,x),a
2867  0025 0c02          	inc	(OFST+0,sp)
2870  0027 7b02          	ld	a,(OFST+0,sp)
2871  0029 a108          	cp	a,#8
2872  002b 25da          	jrult	L757
2876  002d 85            	popw	x
2877  002e 81            	ret	
2920                     ; 355 LCD_DISP_FUNC(lcd_disp_setup_id, 6, _nid)
2921                     .text:	section	.text,new
2922  0000               _lcd_disp_setup_id:
2924  0000 89            	pushw	x
2925       00000002      OFST:	set	2
2930  0001 cd0000        	call	_lcd_clear_n
2933  0004 4f            	clr	a
2934  0005 6b02          	ld	(OFST+0,sp),a
2935  0007               L3001:
2938  0007 5f            	clrw	x
2939  0008 97            	ld	xl,a
2940  0009 d601d1        	ld	a,(__nid,x)
2941  000c 6b01          	ld	(OFST-1,sp),a
2944  000e 5f            	clrw	x
2945  000f 97            	ld	xl,a
2946  0010 d60040        	ld	a,(_iLF_DEF,x)
2947  0013 5f            	clrw	x
2948  0014 97            	ld	xl,a
2949  0015 7b01          	ld	a,(OFST-1,sp)
2950  0017 905f          	clrw	y
2951  0019 9097          	ld	yl,a
2952  001b d6540c        	ld	a,(21516,x)
2953  001e 90da0000      	or	a,(_bLF_DEF,y)
2954  0022 d7540c        	ld	(21516,x),a
2957  0025 0c02          	inc	(OFST+0,sp)
2960  0027 7b02          	ld	a,(OFST+0,sp)
2961  0029 a106          	cp	a,#6
2962  002b 25da          	jrult	L3001
2966  002d 85            	popw	x
2967  002e 81            	ret	
3010                     ; 356 LCD_DISP_FUNC(lcd_disp_setup_m, 3, _nm)
3011                     .text:	section	.text,new
3012  0000               _lcd_disp_setup_m:
3014  0000 89            	pushw	x
3015       00000002      OFST:	set	2
3020  0001 cd0000        	call	_lcd_clear_n
3023  0004 4f            	clr	a
3024  0005 6b02          	ld	(OFST+0,sp),a
3025  0007               L7201:
3028  0007 5f            	clrw	x
3029  0008 97            	ld	xl,a
3030  0009 d601a6        	ld	a,(__nm,x)
3031  000c 6b01          	ld	(OFST-1,sp),a
3034  000e 5f            	clrw	x
3035  000f 97            	ld	xl,a
3036  0010 d60040        	ld	a,(_iLF_DEF,x)
3037  0013 5f            	clrw	x
3038  0014 97            	ld	xl,a
3039  0015 7b01          	ld	a,(OFST-1,sp)
3040  0017 905f          	clrw	y
3041  0019 9097          	ld	yl,a
3042  001b d6540c        	ld	a,(21516,x)
3043  001e 90da0000      	or	a,(_bLF_DEF,y)
3044  0022 d7540c        	ld	(21516,x),a
3047  0025 0c02          	inc	(OFST+0,sp)
3050  0027 7b02          	ld	a,(OFST+0,sp)
3051  0029 a103          	cp	a,#3
3052  002b 25da          	jrult	L7201
3056  002d 85            	popw	x
3057  002e 81            	ret	
3100                     ; 357 LCD_DISP_FUNC(lcd_disp_setup_cnt, 6, _ncnt)
3101                     .text:	section	.text,new
3102  0000               _lcd_disp_setup_cnt:
3104  0000 89            	pushw	x
3105       00000002      OFST:	set	2
3110  0001 cd0000        	call	_lcd_clear_n
3113  0004 4f            	clr	a
3114  0005 6b02          	ld	(OFST+0,sp),a
3115  0007               L3501:
3118  0007 5f            	clrw	x
3119  0008 97            	ld	xl,a
3120  0009 d601a9        	ld	a,(__ncnt,x)
3121  000c 6b01          	ld	(OFST-1,sp),a
3124  000e 5f            	clrw	x
3125  000f 97            	ld	xl,a
3126  0010 d60040        	ld	a,(_iLF_DEF,x)
3127  0013 5f            	clrw	x
3128  0014 97            	ld	xl,a
3129  0015 7b01          	ld	a,(OFST-1,sp)
3130  0017 905f          	clrw	y
3131  0019 9097          	ld	yl,a
3132  001b d6540c        	ld	a,(21516,x)
3133  001e 90da0000      	or	a,(_bLF_DEF,y)
3134  0022 d7540c        	ld	(21516,x),a
3137  0025 0c02          	inc	(OFST+0,sp)
3140  0027 7b02          	ld	a,(OFST+0,sp)
3141  0029 a106          	cp	a,#6
3142  002b 25da          	jrult	L3501
3146  002d 85            	popw	x
3147  002e 81            	ret	
3191                     ; 358 LCD_DISP_FUNC(lcd_disp_setup_valve, 6, _nvalve)
3192                     .text:	section	.text,new
3193  0000               _lcd_disp_setup_valve:
3195  0000 89            	pushw	x
3196       00000002      OFST:	set	2
3201  0001 cd0000        	call	_lcd_clear_n
3204  0004 4f            	clr	a
3205  0005 6b02          	ld	(OFST+0,sp),a
3206  0007               L7701:
3209  0007 5f            	clrw	x
3210  0008 97            	ld	xl,a
3211  0009 d601af        	ld	a,(__nvalve,x)
3212  000c 6b01          	ld	(OFST-1,sp),a
3215  000e 5f            	clrw	x
3216  000f 97            	ld	xl,a
3217  0010 d60040        	ld	a,(_iLF_DEF,x)
3218  0013 5f            	clrw	x
3219  0014 97            	ld	xl,a
3220  0015 7b01          	ld	a,(OFST-1,sp)
3221  0017 905f          	clrw	y
3222  0019 9097          	ld	yl,a
3223  001b d6540c        	ld	a,(21516,x)
3224  001e 90da0000      	or	a,(_bLF_DEF,y)
3225  0022 d7540c        	ld	(21516,x),a
3228  0025 0c02          	inc	(OFST+0,sp)
3231  0027 7b02          	ld	a,(OFST+0,sp)
3232  0029 a106          	cp	a,#6
3233  002b 25da          	jrult	L7701
3237  002d 85            	popw	x
3238  002e 81            	ret	
3281                     ; 360 LCD_CLEAR_FUNC(lcd_clear_backlight, 8, _bL)
3282                     .text:	section	.text,new
3283  0000               _lcd_clear_backlight:
3285  0000 89            	pushw	x
3286       00000002      OFST:	set	2
3289  0001 4f            	clr	a
3290  0002 6b02          	ld	(OFST+0,sp),a
3291  0004               L3211:
3294  0004 5f            	clrw	x
3295  0005 97            	ld	xl,a
3296  0006 d601e8        	ld	a,(__bL,x)
3297  0009 6b01          	ld	(OFST-1,sp),a
3300  000b 5f            	clrw	x
3301  000c 97            	ld	xl,a
3302  000d d60040        	ld	a,(_iLF_DEF,x)
3303  0010 5f            	clrw	x
3304  0011 97            	ld	xl,a
3305  0012 7b01          	ld	a,(OFST-1,sp)
3306  0014 905f          	clrw	y
3307  0016 9097          	ld	yl,a
3308  0018 90d60000      	ld	a,(_bLF_DEF,y)
3309  001c 43            	cpl	a
3310  001d d4540c        	and	a,(21516,x)
3311  0020 d7540c        	ld	(21516,x),a
3314  0023 0c02          	inc	(OFST+0,sp)
3317  0025 7b02          	ld	a,(OFST+0,sp)
3318  0027 a108          	cp	a,#8
3319  0029 25d9          	jrult	L3211
3323  002b 85            	popw	x
3324  002c 81            	ret	
3366                     ; 361 LCD_CLEAR_FUNC(lcd_clear_c, 4, _cc)
3367                     .text:	section	.text,new
3368  0000               _lcd_clear_c:
3370  0000 89            	pushw	x
3371       00000002      OFST:	set	2
3374  0001 4f            	clr	a
3375  0002 6b02          	ld	(OFST+0,sp),a
3376  0004               L7411:
3379  0004 5f            	clrw	x
3380  0005 97            	ld	xl,a
3381  0006 d601f5        	ld	a,(__cc,x)
3382  0009 6b01          	ld	(OFST-1,sp),a
3385  000b 5f            	clrw	x
3386  000c 97            	ld	xl,a
3387  000d d60040        	ld	a,(_iLF_DEF,x)
3388  0010 5f            	clrw	x
3389  0011 97            	ld	xl,a
3390  0012 7b01          	ld	a,(OFST-1,sp)
3391  0014 905f          	clrw	y
3392  0016 9097          	ld	yl,a
3393  0018 90d60000      	ld	a,(_bLF_DEF,y)
3394  001c 43            	cpl	a
3395  001d d4540c        	and	a,(21516,x)
3396  0020 d7540c        	ld	(21516,x),a
3399  0023 0c02          	inc	(OFST+0,sp)
3402  0025 7b02          	ld	a,(OFST+0,sp)
3403  0027 a104          	cp	a,#4
3404  0029 25d9          	jrult	L7411
3408  002b 85            	popw	x
3409  002c 81            	ret	
3451                     ; 363 LCD_CLEAR_FUNC(lcd_clear_btn, 5, _btn)
3452                     .text:	section	.text,new
3453  0000               _lcd_clear_btn:
3455  0000 89            	pushw	x
3456       00000002      OFST:	set	2
3459  0001 4f            	clr	a
3460  0002 6b02          	ld	(OFST+0,sp),a
3461  0004               L3711:
3464  0004 5f            	clrw	x
3465  0005 97            	ld	xl,a
3466  0006 d601f0        	ld	a,(__btn,x)
3467  0009 6b01          	ld	(OFST-1,sp),a
3470  000b 5f            	clrw	x
3471  000c 97            	ld	xl,a
3472  000d d60040        	ld	a,(_iLF_DEF,x)
3473  0010 5f            	clrw	x
3474  0011 97            	ld	xl,a
3475  0012 7b01          	ld	a,(OFST-1,sp)
3476  0014 905f          	clrw	y
3477  0016 9097          	ld	yl,a
3478  0018 90d60000      	ld	a,(_bLF_DEF,y)
3479  001c 43            	cpl	a
3480  001d d4540c        	and	a,(21516,x)
3481  0020 d7540c        	ld	(21516,x),a
3484  0023 0c02          	inc	(OFST+0,sp)
3487  0025 7b02          	ld	a,(OFST+0,sp)
3488  0027 a105          	cp	a,#5
3489  0029 25d9          	jrult	L3711
3493  002b 85            	popw	x
3494  002c 81            	ret	
3536                     ; 364 LCD_CLEAR_FUNC(lcd_clear_run, 8, _run)
3537                     .text:	section	.text,new
3538  0000               _lcd_clear_run:
3540  0000 89            	pushw	x
3541       00000002      OFST:	set	2
3544  0001 4f            	clr	a
3545  0002 6b02          	ld	(OFST+0,sp),a
3546  0004               L7121:
3549  0004 5f            	clrw	x
3550  0005 97            	ld	xl,a
3551  0006 d60219        	ld	a,(__run,x)
3552  0009 6b01          	ld	(OFST-1,sp),a
3555  000b 5f            	clrw	x
3556  000c 97            	ld	xl,a
3557  000d d60040        	ld	a,(_iLF_DEF,x)
3558  0010 5f            	clrw	x
3559  0011 97            	ld	xl,a
3560  0012 7b01          	ld	a,(OFST-1,sp)
3561  0014 905f          	clrw	y
3562  0016 9097          	ld	yl,a
3563  0018 90d60000      	ld	a,(_bLF_DEF,y)
3564  001c 43            	cpl	a
3565  001d d4540c        	and	a,(21516,x)
3566  0020 d7540c        	ld	(21516,x),a
3569  0023 0c02          	inc	(OFST+0,sp)
3572  0025 7b02          	ld	a,(OFST+0,sp)
3573  0027 a108          	cp	a,#8
3574  0029 25d9          	jrult	L7121
3578  002b 85            	popw	x
3579  002c 81            	ret	
3621                     ; 365 LCD_CLEAR_FUNC(lcd_clear_mode, 8, _hc)
3622                     .text:	section	.text,new
3623  0000               _lcd_clear_mode:
3625  0000 89            	pushw	x
3626       00000002      OFST:	set	2
3629  0001 4f            	clr	a
3630  0002 6b02          	ld	(OFST+0,sp),a
3631  0004               L3421:
3634  0004 5f            	clrw	x
3635  0005 97            	ld	xl,a
3636  0006 d60221        	ld	a,(__hc,x)
3637  0009 6b01          	ld	(OFST-1,sp),a
3640  000b 5f            	clrw	x
3641  000c 97            	ld	xl,a
3642  000d d60040        	ld	a,(_iLF_DEF,x)
3643  0010 5f            	clrw	x
3644  0011 97            	ld	xl,a
3645  0012 7b01          	ld	a,(OFST-1,sp)
3646  0014 905f          	clrw	y
3647  0016 9097          	ld	yl,a
3648  0018 90d60000      	ld	a,(_bLF_DEF,y)
3649  001c 43            	cpl	a
3650  001d d4540c        	and	a,(21516,x)
3651  0020 d7540c        	ld	(21516,x),a
3654  0023 0c02          	inc	(OFST+0,sp)
3657  0025 7b02          	ld	a,(OFST+0,sp)
3658  0027 a108          	cp	a,#8
3659  0029 25d9          	jrult	L3421
3663  002b 85            	popw	x
3664  002c 81            	ret	
3706                     ; 366 LCD_CLEAR_FUNC(lcd_clear_n, 35, _n)
3707                     .text:	section	.text,new
3708  0000               _lcd_clear_n:
3710  0000 89            	pushw	x
3711       00000002      OFST:	set	2
3714  0001 4f            	clr	a
3715  0002 6b02          	ld	(OFST+0,sp),a
3716  0004               L7621:
3719  0004 5f            	clrw	x
3720  0005 97            	ld	xl,a
3721  0006 d601b5        	ld	a,(__n,x)
3722  0009 6b01          	ld	(OFST-1,sp),a
3725  000b 5f            	clrw	x
3726  000c 97            	ld	xl,a
3727  000d d60040        	ld	a,(_iLF_DEF,x)
3728  0010 5f            	clrw	x
3729  0011 97            	ld	xl,a
3730  0012 7b01          	ld	a,(OFST-1,sp)
3731  0014 905f          	clrw	y
3732  0016 9097          	ld	yl,a
3733  0018 90d60000      	ld	a,(_bLF_DEF,y)
3734  001c 43            	cpl	a
3735  001d d4540c        	and	a,(21516,x)
3736  0020 d7540c        	ld	(21516,x),a
3739  0023 0c02          	inc	(OFST+0,sp)
3742  0025 7b02          	ld	a,(OFST+0,sp)
3743  0027 a123          	cp	a,#35
3744  0029 25d9          	jrult	L7621
3748  002b 85            	popw	x
3749  002c 81            	ret	
3791                     ; 368 LCD_CLEAR_FUNC(lcd_clear_info, 3, _info)
3792                     .text:	section	.text,new
3793  0000               _lcd_clear_info:
3795  0000 89            	pushw	x
3796       00000002      OFST:	set	2
3799  0001 4f            	clr	a
3800  0002 6b02          	ld	(OFST+0,sp),a
3801  0004               L3131:
3804  0004 5f            	clrw	x
3805  0005 97            	ld	xl,a
3806  0006 d601d7        	ld	a,(__info,x)
3807  0009 6b01          	ld	(OFST-1,sp),a
3810  000b 5f            	clrw	x
3811  000c 97            	ld	xl,a
3812  000d d60040        	ld	a,(_iLF_DEF,x)
3813  0010 5f            	clrw	x
3814  0011 97            	ld	xl,a
3815  0012 7b01          	ld	a,(OFST-1,sp)
3816  0014 905f          	clrw	y
3817  0016 9097          	ld	yl,a
3818  0018 90d60000      	ld	a,(_bLF_DEF,y)
3819  001c 43            	cpl	a
3820  001d d4540c        	and	a,(21516,x)
3821  0020 d7540c        	ld	(21516,x),a
3824  0023 0c02          	inc	(OFST+0,sp)
3827  0025 7b02          	ld	a,(OFST+0,sp)
3828  0027 a103          	cp	a,#3
3829  0029 25d9          	jrult	L3131
3833  002b 85            	popw	x
3834  002c 81            	ret	
3876                     ; 370 LCD_CLEAR_FUNC(lcd_clear_rid, 14, _rid)
3877                     .text:	section	.text,new
3878  0000               _lcd_clear_rid:
3880  0000 89            	pushw	x
3881       00000002      OFST:	set	2
3884  0001 4f            	clr	a
3885  0002 6b02          	ld	(OFST+0,sp),a
3886  0004               L7331:
3889  0004 5f            	clrw	x
3890  0005 97            	ld	xl,a
3891  0006 d601da        	ld	a,(__rid,x)
3892  0009 6b01          	ld	(OFST-1,sp),a
3895  000b 5f            	clrw	x
3896  000c 97            	ld	xl,a
3897  000d d60040        	ld	a,(_iLF_DEF,x)
3898  0010 5f            	clrw	x
3899  0011 97            	ld	xl,a
3900  0012 7b01          	ld	a,(OFST-1,sp)
3901  0014 905f          	clrw	y
3902  0016 9097          	ld	yl,a
3903  0018 90d60000      	ld	a,(_bLF_DEF,y)
3904  001c 43            	cpl	a
3905  001d d4540c        	and	a,(21516,x)
3906  0020 d7540c        	ld	(21516,x),a
3909  0023 0c02          	inc	(OFST+0,sp)
3912  0025 7b02          	ld	a,(OFST+0,sp)
3913  0027 a10e          	cp	a,#14
3914  0029 25d9          	jrult	L7331
3918  002b 85            	popw	x
3919  002c 81            	ret	
3961                     ; 376 LCD_CLEAR_FUNC(lcd_clear_m, 3, _nm)
3962                     .text:	section	.text,new
3963  0000               _lcd_clear_m:
3965  0000 89            	pushw	x
3966       00000002      OFST:	set	2
3969  0001 4f            	clr	a
3970  0002 6b02          	ld	(OFST+0,sp),a
3971  0004               L3631:
3974  0004 5f            	clrw	x
3975  0005 97            	ld	xl,a
3976  0006 d601a6        	ld	a,(__nm,x)
3977  0009 6b01          	ld	(OFST-1,sp),a
3980  000b 5f            	clrw	x
3981  000c 97            	ld	xl,a
3982  000d d60040        	ld	a,(_iLF_DEF,x)
3983  0010 5f            	clrw	x
3984  0011 97            	ld	xl,a
3985  0012 7b01          	ld	a,(OFST-1,sp)
3986  0014 905f          	clrw	y
3987  0016 9097          	ld	yl,a
3988  0018 90d60000      	ld	a,(_bLF_DEF,y)
3989  001c 43            	cpl	a
3990  001d d4540c        	and	a,(21516,x)
3991  0020 d7540c        	ld	(21516,x),a
3994  0023 0c02          	inc	(OFST+0,sp)
3997  0025 7b02          	ld	a,(OFST+0,sp)
3998  0027 a103          	cp	a,#3
3999  0029 25d9          	jrult	L3631
4003  002b 85            	popw	x
4004  002c 81            	ret	
4046                     ; 377 LCD_CLEAR_FUNC(lcd_clear_cnt, 6, _ncnt)
4047                     .text:	section	.text,new
4048  0000               _lcd_clear_cnt:
4050  0000 89            	pushw	x
4051       00000002      OFST:	set	2
4054  0001 4f            	clr	a
4055  0002 6b02          	ld	(OFST+0,sp),a
4056  0004               L7041:
4059  0004 5f            	clrw	x
4060  0005 97            	ld	xl,a
4061  0006 d601a9        	ld	a,(__ncnt,x)
4062  0009 6b01          	ld	(OFST-1,sp),a
4065  000b 5f            	clrw	x
4066  000c 97            	ld	xl,a
4067  000d d60040        	ld	a,(_iLF_DEF,x)
4068  0010 5f            	clrw	x
4069  0011 97            	ld	xl,a
4070  0012 7b01          	ld	a,(OFST-1,sp)
4071  0014 905f          	clrw	y
4072  0016 9097          	ld	yl,a
4073  0018 90d60000      	ld	a,(_bLF_DEF,y)
4074  001c 43            	cpl	a
4075  001d d4540c        	and	a,(21516,x)
4076  0020 d7540c        	ld	(21516,x),a
4079  0023 0c02          	inc	(OFST+0,sp)
4082  0025 7b02          	ld	a,(OFST+0,sp)
4083  0027 a106          	cp	a,#6
4084  0029 25d9          	jrult	L7041
4088  002b 85            	popw	x
4089  002c 81            	ret	
4138                     ; 379 void	lcd_clear_npos(uint8_t pos, uint8_t type)
4138                     ; 380 {
4139                     .text:	section	.text,new
4140  0000               _lcd_clear_npos:
4142  0000 89            	pushw	x
4143  0001 89            	pushw	x
4144       00000002      OFST:	set	2
4147                     ; 382 	pos = pos*7;
4149  0002 ae0007        	ldw	x,#7
4150  0005 7b03          	ld	a,(OFST+1,sp)
4151  0007 42            	mul	x,a
4152  0008 9f            	ld	a,xl
4153  0009 6b03          	ld	(OFST+1,sp),a
4154                     ; 383 	for( i=0; i<7; i++ )
4156  000b 0f01          	clr	(OFST-1,sp)
4157  000d               L5341:
4158                     ; 385 		j = _n[pos++];
4160  000d 7b03          	ld	a,(OFST+1,sp)
4161  000f 0c03          	inc	(OFST+1,sp)
4162  0011 5f            	clrw	x
4163  0012 97            	ld	xl,a
4164  0013 d601b5        	ld	a,(__n,x)
4165  0016 6b02          	ld	(OFST+0,sp),a
4166                     ; 386 		LCD_BIT_CLEAR(j);
4168  0018 5f            	clrw	x
4169  0019 97            	ld	xl,a
4170  001a d60040        	ld	a,(_iLF_DEF,x)
4171  001d 5f            	clrw	x
4172  001e 97            	ld	xl,a
4173  001f 7b02          	ld	a,(OFST+0,sp)
4174  0021 905f          	clrw	y
4175  0023 9097          	ld	yl,a
4176  0025 90d60000      	ld	a,(_bLF_DEF,y)
4177  0029 43            	cpl	a
4178  002a d4540c        	and	a,(21516,x)
4179  002d d7540c        	ld	(21516,x),a
4180                     ; 383 	for( i=0; i<7; i++ )
4182  0030 0c01          	inc	(OFST-1,sp)
4185  0032 7b01          	ld	a,(OFST-1,sp)
4186  0034 a107          	cp	a,#7
4187  0036 25d5          	jrult	L5341
4188                     ; 388 }
4191  0038 5b04          	addw	sp,#4
4192  003a 81            	ret	
4224                     ; 390 void	lcd_disp_all(void)
4224                     ; 391 {
4225                     .text:	section	.text,new
4226  0000               _lcd_disp_all:
4228  0000 88            	push	a
4229       00000001      OFST:	set	1
4232                     ; 393 	for( i=0; i<15; i++ )
4234  0001 4f            	clr	a
4235  0002 6b01          	ld	(OFST+0,sp),a
4236  0004               L7541:
4237                     ; 394 		LCD->RAM[i] = 0xff;
4239  0004 5f            	clrw	x
4240  0005 97            	ld	xl,a
4241  0006 a6ff          	ld	a,#255
4242  0008 d7540c        	ld	(21516,x),a
4243                     ; 393 	for( i=0; i<15; i++ )
4245  000b 0c01          	inc	(OFST+0,sp)
4248  000d 7b01          	ld	a,(OFST+0,sp)
4249  000f a10f          	cp	a,#15
4250  0011 25f1          	jrult	L7541
4251                     ; 395 }
4254  0013 84            	pop	a
4255  0014 81            	ret	
4294                     ; 397 void	lcd_clear(uint8_t type)
4294                     ; 398 {
4295                     .text:	section	.text,new
4296  0000               _lcd_clear:
4298  0000 88            	push	a
4299       00000001      OFST:	set	1
4302                     ; 400 	for( i=0; i<15; i++ )
4304  0001 4f            	clr	a
4305  0002 6b01          	ld	(OFST+0,sp),a
4306  0004               L3051:
4307                     ; 401 		LCD->RAM[i] = 0;
4309  0004 5f            	clrw	x
4310  0005 97            	ld	xl,a
4311  0006 724f540c      	clr	(21516,x)
4312                     ; 400 	for( i=0; i<15; i++ )
4314  000a 0c01          	inc	(OFST+0,sp)
4317  000c 7b01          	ld	a,(OFST+0,sp)
4318  000e a10f          	cp	a,#15
4319  0010 25f2          	jrult	L3051
4320                     ; 402 }
4323  0012 84            	pop	a
4324  0013 81            	ret	
4371                     ; 404 uint8_t	*lcd_get_npos(uint8_t i)
4371                     ; 405 {
4372                     .text:	section	.text,new
4373  0000               _lcd_get_npos:
4375  0000 89            	pushw	x
4376       00000002      OFST:	set	2
4379                     ; 407 	switch( i )
4382                     ; 420 	case 3:	p = _nd;	break;
4383  0001 4d            	tnz	a
4384  0002 270d          	jreq	L1151
4385  0004 4a            	dec	a
4386  0005 270f          	jreq	L3151
4387  0007 4a            	dec	a
4388  0008 2711          	jreq	L5151
4389  000a 4a            	dec	a
4390  000b 2713          	jreq	L7151
4391  000d 1e01          	ldw	x,(OFST-1,sp)
4392  000f 2012          	jra	LC001
4393  0011               L1151:
4394                     ; 417 	case 0:	p = _na;	break;
4396  0011 ae0080        	ldw	x,#__na
4399  0014 200d          	jp	LC001
4400  0016               L3151:
4401                     ; 418 	case 1:	p = _nb;	break;
4403  0016 ae00c6        	ldw	x,#__nb
4406  0019 2008          	jp	LC001
4407  001b               L5151:
4408                     ; 419 	case 2:	p = _nc;	break;
4410  001b ae010c        	ldw	x,#__nc
4413  001e 2003          	jp	LC001
4414  0020               L7151:
4415                     ; 420 	case 3:	p = _nd;	break;
4417  0020 ae0152        	ldw	x,#__nd
4418  0023               LC001:
4421                     ; 423 	return p;
4425  0023 5b02          	addw	sp,#2
4426  0025 81            	ret	
4493                     ; 426 void	lcd_disp_n(uint8_t pos, uint8_t n)
4493                     ; 427 {
4494                     .text:	section	.text,new
4495  0000               _lcd_disp_n:
4497  0000 89            	pushw	x
4498  0001 5204          	subw	sp,#4
4499       00000004      OFST:	set	4
4502                     ; 431 	lcd_clear_npos(pos, 0);
4504  0003 5f            	clrw	x
4505  0004 7b05          	ld	a,(OFST+1,sp)
4506  0006 95            	ld	xh,a
4507  0007 cd0000        	call	_lcd_clear_npos
4509                     ; 432 	p = lcd_get_npos(pos);
4511  000a 7b05          	ld	a,(OFST+1,sp)
4512  000c cd0000        	call	_lcd_get_npos
4514  000f 1f02          	ldw	(OFST-2,sp),x
4515                     ; 433 	p = p+n*7;
4517  0011 7b06          	ld	a,(OFST+2,sp)
4518  0013 97            	ld	xl,a
4519  0014 a607          	ld	a,#7
4520  0016 42            	mul	x,a
4521  0017 72fb02        	addw	x,(OFST-2,sp)
4522  001a 1f02          	ldw	(OFST-2,sp),x
4523                     ; 434 	for( i=0; i<7; i++ )
4525  001c 0f04          	clr	(OFST+0,sp)
4526  001e               L3751:
4527                     ; 436 		if( p[i] != 0 )
4529  001e 7b02          	ld	a,(OFST-2,sp)
4530  0020 97            	ld	xl,a
4531  0021 7b03          	ld	a,(OFST-1,sp)
4532  0023 1b04          	add	a,(OFST+0,sp)
4533  0025 2401          	jrnc	L471
4534  0027 5c            	incw	x
4535  0028               L471:
4536  0028 02            	rlwa	x,a
4537  0029 f6            	ld	a,(x)
4538  002a 2725          	jreq	L1061
4539                     ; 438 			j = p[i];
4541  002c 7b02          	ld	a,(OFST-2,sp)
4542  002e 97            	ld	xl,a
4543  002f 7b03          	ld	a,(OFST-1,sp)
4544  0031 1b04          	add	a,(OFST+0,sp)
4545  0033 2401          	jrnc	L671
4546  0035 5c            	incw	x
4547  0036               L671:
4548  0036 02            	rlwa	x,a
4549  0037 f6            	ld	a,(x)
4550  0038 6b01          	ld	(OFST-3,sp),a
4551                     ; 439 			LCD_BIT_SET(j);
4553  003a 5f            	clrw	x
4554  003b 97            	ld	xl,a
4555  003c d60040        	ld	a,(_iLF_DEF,x)
4556  003f 5f            	clrw	x
4557  0040 97            	ld	xl,a
4558  0041 7b01          	ld	a,(OFST-3,sp)
4559  0043 905f          	clrw	y
4560  0045 9097          	ld	yl,a
4561  0047 d6540c        	ld	a,(21516,x)
4562  004a 90da0000      	or	a,(_bLF_DEF,y)
4563  004e d7540c        	ld	(21516,x),a
4564  0051               L1061:
4565                     ; 434 	for( i=0; i<7; i++ )
4567  0051 0c04          	inc	(OFST+0,sp)
4570  0053 7b04          	ld	a,(OFST+0,sp)
4571  0055 a107          	cp	a,#7
4572  0057 25c5          	jrult	L3751
4573                     ; 442 }
4576  0059 5b06          	addw	sp,#6
4577  005b 81            	ret	
4634                     ; 446 void	lcd_disp_err(uint8_t n)
4634                     ; 447 {
4635                     .text:	section	.text,new
4636  0000               _lcd_disp_err:
4638  0000 88            	push	a
4639  0001 5204          	subw	sp,#4
4640       00000004      OFST:	set	4
4643                     ; 450 	LCD_CE;
4645  0003 72165402      	bset	21506,#3
4646                     ; 451 	lcd_clear_n();
4648  0007 cd0000        	call	_lcd_clear_n
4650                     ; 452 	p = error_type==1 ? _nerrBr : _nerr;
4652  000a c60000        	ld	a,_error_type
4653  000d 4a            	dec	a
4654  000e 2605          	jrne	L402
4655  0010 ae019f        	ldw	x,#__nerrBr
4656  0013 2003          	jra	L602
4657  0015               L402:
4658  0015 ae0198        	ldw	x,#__nerr
4659  0018               L602:
4660  0018 1f02          	ldw	(OFST-2,sp),x
4661                     ; 453 	for( i=0; i<7; i++ )
4663  001a 0f04          	clr	(OFST+0,sp)
4664  001c               L7261:
4665                     ; 455 		LCD_BIT_SET(p[i]);
4667  001c 7b02          	ld	a,(OFST-2,sp)
4668  001e 97            	ld	xl,a
4669  001f 7b03          	ld	a,(OFST-1,sp)
4670  0021 1b04          	add	a,(OFST+0,sp)
4671  0023 2401          	jrnc	L012
4672  0025 5c            	incw	x
4673  0026               L012:
4674  0026 02            	rlwa	x,a
4675  0027 f6            	ld	a,(x)
4676  0028 5f            	clrw	x
4677  0029 97            	ld	xl,a
4678  002a d60000        	ld	a,(_bLF_DEF,x)
4679  002d 6b01          	ld	(OFST-3,sp),a
4680  002f 7b02          	ld	a,(OFST-2,sp)
4681  0031 97            	ld	xl,a
4682  0032 7b03          	ld	a,(OFST-1,sp)
4683  0034 1b04          	add	a,(OFST+0,sp)
4684  0036 2401          	jrnc	L212
4685  0038 5c            	incw	x
4686  0039               L212:
4687  0039 02            	rlwa	x,a
4688  003a f6            	ld	a,(x)
4689  003b 5f            	clrw	x
4690  003c 97            	ld	xl,a
4691  003d d60040        	ld	a,(_iLF_DEF,x)
4692  0040 5f            	clrw	x
4693  0041 97            	ld	xl,a
4694  0042 d6540c        	ld	a,(21516,x)
4695  0045 1a01          	or	a,(OFST-3,sp)
4696  0047 d7540c        	ld	(21516,x),a
4697                     ; 453 	for( i=0; i<7; i++ )
4699  004a 0c04          	inc	(OFST+0,sp)
4702  004c 7b04          	ld	a,(OFST+0,sp)
4703  004e a107          	cp	a,#7
4704  0050 25ca          	jrult	L7261
4705                     ; 457 	if( uiInfo.mode == 1 )
4707  0052 c60008        	ld	a,_uiInfo+8
4708  0055 4a            	dec	a
4709  0056 2706          	jreq	L3061
4710                     ; 466 		if( n==30 )
4712  0058 7b05          	ld	a,(OFST+1,sp)
4713  005a a11e          	cp	a,#30
4714  005c 261b          	jrne	L7361
4715                     ; 467 			goto Print;
4716  005e               L3061:
4717                     ; 459 Print:		
4717                     ; 460 //		LCD_BIT_SET(bCOL);
4717                     ; 461 		lcd_disp_n(2, n/10);
4719  005e 7b05          	ld	a,(OFST+1,sp)
4720  0060 5f            	clrw	x
4721  0061 97            	ld	xl,a
4722  0062 a60a          	ld	a,#10
4723  0064 62            	div	x,a
4724  0065 a602          	ld	a,#2
4725  0067 95            	ld	xh,a
4726  0068 cd0000        	call	_lcd_disp_n
4728                     ; 462 		lcd_disp_n(3, n%10);
4730  006b 7b05          	ld	a,(OFST+1,sp)
4731  006d 5f            	clrw	x
4732  006e 97            	ld	xl,a
4733  006f a60a          	ld	a,#10
4734  0071 62            	div	x,a
4735  0072 97            	ld	xl,a
4736  0073 a603          	ld	a,#3
4737  0075 95            	ld	xh,a
4738  0076 cd0000        	call	_lcd_disp_n
4741  0079               L7361:
4742                     ; 469 }
4745  0079 5b05          	addw	sp,#5
4746  007b 81            	ret	
4803                     ; 471 void	lcd_disp_rid(uint8_t id, uint8_t mode, uint8_t multi)
4803                     ; 472 {
4804                     .text:	section	.text,new
4805  0000               _lcd_disp_rid:
4807  0000 89            	pushw	x
4808  0001 88            	push	a
4809       00000001      OFST:	set	1
4812                     ; 477 	LCD_CE;
4814  0002 72165402      	bset	21506,#3
4815                     ; 478 	if( multi == 0 )
4817  0006 7b06          	ld	a,(OFST+5,sp)
4818  0008 2603          	jrne	L5661
4819                     ; 484 		lcd_clear_rid();
4821  000a cd0000        	call	_lcd_clear_rid
4823  000d               L5661:
4824                     ; 487 	if( id != 0 )
4826  000d 7b02          	ld	a,(OFST+1,sp)
4827  000f 2702          	jreq	L7661
4828                     ; 488 		id -= 1;
4830  0011 0a02          	dec	(OFST+1,sp)
4831  0013               L7661:
4832                     ; 504 	if( mode != 0 )
4834  0013 7b03          	ld	a,(OFST+2,sp)
4835  0015 2712          	jreq	L1761
4836                     ; 506 		j = _rid[id*2+1];
4838  0017 7b02          	ld	a,(OFST+1,sp)
4839  0019 5f            	clrw	x
4840  001a 97            	ld	xl,a
4841  001b 58            	sllw	x
4842  001c d601db        	ld	a,(__rid+1,x)
4843  001f 6b01          	ld	(OFST+0,sp),a
4844                     ; 507 		LCD_BIT_SET(j);
4846  0021 ad39          	call	LC002
4847  0023 7b01          	ld	a,(OFST+0,sp)
4848  0025 ad3d          	call	LC003
4850  0027 201a          	jra	L3761
4851  0029               L1761:
4852                     ; 509 		j = _rid[id*2+1];
4854  0029 7b02          	ld	a,(OFST+1,sp)
4855  002b 5f            	clrw	x
4856  002c 97            	ld	xl,a
4857  002d 58            	sllw	x
4858  002e d601db        	ld	a,(__rid+1,x)
4859  0031 6b01          	ld	(OFST+0,sp),a
4860                     ; 510 		LCD_BIT_CLEAR(j);
4862  0033 ad27          	call	LC002
4863  0035 7b01          	ld	a,(OFST+0,sp)
4864  0037 905f          	clrw	y
4865  0039 9097          	ld	yl,a
4866  003b 90d60000      	ld	a,(_bLF_DEF,y)
4867  003f 43            	cpl	a
4868  0040 d4540c        	and	a,(21516,x)
4869  0043               L3761:
4870  0043 d7540c        	ld	(21516,x),a
4871                     ; 512 	j = _rid[id*2];
4873  0046 7b02          	ld	a,(OFST+1,sp)
4874  0048 5f            	clrw	x
4875  0049 97            	ld	xl,a
4876  004a 58            	sllw	x
4877  004b d601da        	ld	a,(__rid,x)
4878  004e 6b01          	ld	(OFST+0,sp),a
4879                     ; 513 	LCD_BIT_SET(j);
4881  0050 ad0a          	call	LC002
4882  0052 7b01          	ld	a,(OFST+0,sp)
4883  0054 ad0e          	call	LC003
4884  0056 d7540c        	ld	(21516,x),a
4885                     ; 515 }
4888  0059 5b03          	addw	sp,#3
4889  005b 81            	ret	
4890  005c               LC002:
4891  005c 5f            	clrw	x
4892  005d 97            	ld	xl,a
4893  005e d60040        	ld	a,(_iLF_DEF,x)
4894  0061 5f            	clrw	x
4895  0062 97            	ld	xl,a
4896  0063 81            	ret	
4897  0064               LC003:
4898  0064 905f          	clrw	y
4899  0066 9097          	ld	yl,a
4900  0068 d6540c        	ld	a,(21516,x)
4901  006b 90da0000      	or	a,(_bLF_DEF,y)
4902  006f 81            	ret	
4951                     ; 518 void	lcd_clear_rid_n(uint8_t id, uint8_t mode)
4951                     ; 519 {
4952                     .text:	section	.text,new
4953  0000               _lcd_clear_rid_n:
4955  0000 89            	pushw	x
4956  0001 88            	push	a
4957       00000001      OFST:	set	1
4960                     ; 521 	LCD_CE;
4962  0002 72165402      	bset	21506,#3
4963                     ; 523 	if( id != 0 )
4965  0006 9e            	ld	a,xh
4966  0007 4d            	tnz	a
4967  0008 2702          	jreq	L5171
4968                     ; 524 		id -= 1;
4970  000a 0a02          	dec	(OFST+1,sp)
4971  000c               L5171:
4972                     ; 526 	if( mode != 0 )
4974  000c 7b03          	ld	a,(OFST+2,sp)
4975  000e 2715          	jreq	L7171
4976                     ; 528 		j = _rid[id*2+1];
4978  0010 7b02          	ld	a,(OFST+1,sp)
4979  0012 5f            	clrw	x
4980  0013 97            	ld	xl,a
4981  0014 58            	sllw	x
4982  0015 d601db        	ld	a,(__rid+1,x)
4983  0018 6b01          	ld	(OFST+0,sp),a
4984                     ; 529 		LCD_BIT_CLEAR(j);
4986  001a 5f            	clrw	x
4987  001b 97            	ld	xl,a
4988  001c d60040        	ld	a,(_iLF_DEF,x)
4989  001f 5f            	clrw	x
4990  0020 97            	ld	xl,a
4991  0021 7b01          	ld	a,(OFST+0,sp)
4992  0023 ad18          	call	LC004
4993  0025               L7171:
4994                     ; 531 	j = _rid[id*2];
4996  0025 7b02          	ld	a,(OFST+1,sp)
4997  0027 5f            	clrw	x
4998  0028 97            	ld	xl,a
4999  0029 58            	sllw	x
5000  002a d601da        	ld	a,(__rid,x)
5001  002d 6b01          	ld	(OFST+0,sp),a
5002                     ; 532 	LCD_BIT_CLEAR(j);
5004  002f 5f            	clrw	x
5005  0030 97            	ld	xl,a
5006  0031 d60040        	ld	a,(_iLF_DEF,x)
5007  0034 5f            	clrw	x
5008  0035 97            	ld	xl,a
5009  0036 7b01          	ld	a,(OFST+0,sp)
5010  0038 ad03          	call	LC004
5011                     ; 533 }
5014  003a 5b03          	addw	sp,#3
5015  003c 81            	ret	
5016  003d               LC004:
5017  003d 905f          	clrw	y
5018  003f 9097          	ld	yl,a
5019  0041 90d60000      	ld	a,(_bLF_DEF,y)
5020  0045 43            	cpl	a
5021  0046 d4540c        	and	a,(21516,x)
5022  0049 d7540c        	ld	(21516,x),a
5023  004c 81            	ret	
5064                     ; 534 void	lcd_disp_cmd(uint8_t cmd, uint8_t mode, uint8_t multi)
5064                     ; 535 {
5065                     .text:	section	.text,new
5066  0000               _lcd_disp_cmd:
5068  0000 88            	push	a
5069       00000001      OFST:	set	1
5072                     ; 537 	LCD_CE;
5074  0001 72165402      	bset	21506,#3
5075                     ; 547 	LCD_BIT_SET(j);
5077  0005 7b01          	ld	a,(OFST+0,sp)
5078  0007 5f            	clrw	x
5079  0008 97            	ld	xl,a
5080  0009 d60040        	ld	a,(_iLF_DEF,x)
5081  000c 5f            	clrw	x
5082  000d 97            	ld	xl,a
5083  000e 7b01          	ld	a,(OFST+0,sp)
5084  0010 905f          	clrw	y
5085  0012 9097          	ld	yl,a
5086  0014 d6540c        	ld	a,(21516,x)
5087  0017 90da0000      	or	a,(_bLF_DEF,y)
5088  001b d7540c        	ld	(21516,x),a
5089                     ; 548 }
5092  001e 84            	pop	a
5093  001f 81            	ret	
5128                     ; 550 void	lcd_disp_info_fire(uint8_t mode)
5128                     ; 551 {
5129                     .text:	section	.text,new
5130  0000               _lcd_disp_info_fire:
5134                     ; 552 	if( mode == 0 )
5136  0000 4d            	tnz	a
5137  0001 2605          	jrne	L3571
5138                     ; 553 		LCD_BIT_CLEAR(_info[0]);
5140  0003 72195411      	bres	21521,#4
5143  0007 81            	ret	
5144  0008               L3571:
5145                     ; 555 		LCD_BIT_SET(_info[0]);
5147  0008 72185411      	bset	21521,#4
5148                     ; 556 }
5151  000c 81            	ret	
5187                     ; 558 void	lcd_disp_info_shower(uint8_t mode, uint8_t para)
5187                     ; 559 {
5188                     .text:	section	.text,new
5189  0000               _lcd_disp_info_shower:
5191  0000 89            	pushw	x
5192       00000000      OFST:	set	0
5195                     ; 560 	if( (mode & 0x80) != 0 )
5197  0001 9e            	ld	a,xh
5198  0002 a580          	bcp	a,#128
5199  0004 2704          	jreq	L3771
5200                     ; 561 		lcd_blink_item(_info[2]);
5202  0006 a60f          	ld	a,#15
5205  0008 2008          	jp	LC005
5206  000a               L3771:
5207                     ; 563 	else if( (mode &0x08) != 0 )
5209  000a 7b01          	ld	a,(OFST+1,sp)
5210  000c a508          	bcp	a,#8
5211  000e 2707          	jreq	L7771
5212                     ; 564 		lcd_blink_item(_info[1]);
5214  0010 a62f          	ld	a,#47
5215  0012               LC005:
5216  0012 cd0000        	call	_lcd_blink_item
5219  0015 2003          	jra	L5771
5220  0017               L7771:
5221                     ; 566 		lcd_blink_clear();
5223  0017 cd0000        	call	_lcd_blink_clear
5225  001a               L5771:
5226                     ; 568 }
5229  001a 85            	popw	x
5230  001b 81            	ret	
5287                     ; 570 void	lcd_disp_info(uint8_t info, uint8_t mode, uint8_t multi)
5287                     ; 571 {
5288                     .text:	section	.text,new
5289  0000               _lcd_disp_info:
5291  0000 89            	pushw	x
5292  0001 88            	push	a
5293       00000001      OFST:	set	1
5296                     ; 573 	LCD_CE;
5298  0002 72165402      	bset	21506,#3
5299                     ; 574 	if( multi == 0 )
5301  0006 7b06          	ld	a,(OFST+5,sp)
5302  0008 2603          	jrne	L5202
5303                     ; 575 		lcd_clear_info();
5305  000a cd0000        	call	_lcd_clear_info
5307  000d               L5202:
5308                     ; 580 	j = _info[info];
5310  000d 7b02          	ld	a,(OFST+1,sp)
5311  000f 5f            	clrw	x
5312  0010 97            	ld	xl,a
5313  0011 d601d7        	ld	a,(__info,x)
5314  0014 6b01          	ld	(OFST+0,sp),a
5315                     ; 581 	if( mode == 1 )
5317  0016 7b03          	ld	a,(OFST+2,sp)
5318  0018 4a            	dec	a
5319  0019 2619          	jrne	L7202
5320                     ; 582 		LCD_BIT_CLEAR(j);
5322  001b 7b01          	ld	a,(OFST+0,sp)
5323  001d 5f            	clrw	x
5324  001e 97            	ld	xl,a
5325  001f d60040        	ld	a,(_iLF_DEF,x)
5326  0022 5f            	clrw	x
5327  0023 97            	ld	xl,a
5328  0024 7b01          	ld	a,(OFST+0,sp)
5329  0026 905f          	clrw	y
5330  0028 9097          	ld	yl,a
5331  002a 90d60000      	ld	a,(_bLF_DEF,y)
5332  002e 43            	cpl	a
5333  002f d4540c        	and	a,(21516,x)
5335  0032 2016          	jra	L1302
5336  0034               L7202:
5337                     ; 584 		LCD_BIT_SET(j);
5339  0034 7b01          	ld	a,(OFST+0,sp)
5340  0036 5f            	clrw	x
5341  0037 97            	ld	xl,a
5342  0038 d60040        	ld	a,(_iLF_DEF,x)
5343  003b 5f            	clrw	x
5344  003c 97            	ld	xl,a
5345  003d 7b01          	ld	a,(OFST+0,sp)
5346  003f 905f          	clrw	y
5347  0041 9097          	ld	yl,a
5348  0043 d6540c        	ld	a,(21516,x)
5349  0046 90da0000      	or	a,(_bLF_DEF,y)
5350  004a               L1302:
5351  004a d7540c        	ld	(21516,x),a
5352                     ; 585 }
5355  004d 5b03          	addw	sp,#3
5356  004f 81            	ret	
5359                     	switch	.data
5360  0000               ___i:
5361  0000 00            	dc.b	0
5401                     ; 599 void	lcd_disp(uint8_t id, uint8_t enable)
5401                     ; 600 {
5402                     .text:	section	.text,new
5403  0000               _lcd_disp:
5405  0000 89            	pushw	x
5406       00000000      OFST:	set	0
5409                     ; 603 	LCD_CE;
5411  0001 72165402      	bset	21506,#3
5412                     ; 604 	if( enable == 1 )
5414  0005 9f            	ld	a,xl
5415  0006 4a            	dec	a
5416  0007 2626          	jrne	L1502
5417                     ; 606 		lcd_clear(0);
5419  0009 cd0000        	call	_lcd_clear
5421                     ; 607 		__i = (__i+1) % 10;
5423  000c c60000        	ld	a,___i
5424  000f 5f            	clrw	x
5425  0010 97            	ld	xl,a
5426  0011 5c            	incw	x
5427  0012 a60a          	ld	a,#10
5428  0014 cd0000        	call	c_smodx
5430  0017 01            	rrwa	x,a
5431  0018 c70000        	ld	___i,a
5432                     ; 608 		lcd_disp_n(0, __i);
5434  001b 97            	ld	xl,a
5435  001c 4f            	clr	a
5436  001d ad1b          	call	LC006
5437  001f a601          	ld	a,#1
5438  0021 ad17          	call	LC006
5439  0023 a602          	ld	a,#2
5440  0025 ad13          	call	LC006
5441  0027 a603          	ld	a,#3
5442  0029 95            	ld	xh,a
5443  002a cd0000        	call	_lcd_disp_n
5445                     ; 611 		lcd_disp_n(3, __i);
5446  002d 2009          	jra	L3502
5447  002f               L1502:
5448                     ; 615 		LCD->RAM[LCD_RAMRegister_1] &= (uint8_t)(~id);
5450  002f 7b01          	ld	a,(OFST+1,sp)
5451  0031 43            	cpl	a
5452  0032 c4540d        	and	a,21517
5453  0035 c7540d        	ld	21517,a
5454  0038               L3502:
5455                     ; 617 }
5458  0038 85            	popw	x
5459  0039 81            	ret	
5460  003a               LC006:
5461  003a 95            	ld	xh,a
5462  003b cd0000        	call	_lcd_disp_n
5464                     ; 609 		lcd_disp_n(1, __i);
5466  003e c60000        	ld	a,___i
5467  0041 97            	ld	xl,a
5468  0042 81            	ret	
5500                     ; 619 void	lcd_init(void)
5500                     ; 620 {
5501                     .text:	section	.text,new
5502  0000               _lcd_init:
5504  0000 88            	push	a
5505       00000001      OFST:	set	1
5508                     ; 622 	LCD_CE;
5510  0001 72165402      	bset	21506,#3
5511                     ; 623 	for( i=0; i<15; i++ )
5513  0005 4f            	clr	a
5514  0006 6b01          	ld	(OFST+0,sp),a
5515  0008               L1702:
5516                     ; 624 		LCD->RAM[i] = 0xff;
5518  0008 5f            	clrw	x
5519  0009 97            	ld	xl,a
5520  000a a6ff          	ld	a,#255
5521  000c d7540c        	ld	(21516,x),a
5522                     ; 623 	for( i=0; i<15; i++ )
5524  000f 0c01          	inc	(OFST+0,sp)
5527  0011 7b01          	ld	a,(OFST+0,sp)
5528  0013 a10f          	cp	a,#15
5529  0015 25f1          	jrult	L1702
5530                     ; 625 }
5533  0017 84            	pop	a
5534  0018 81            	ret	
5566                     ; 629 void	lcd_cntl(uint8_t cmd, uint8_t param)
5566                     ; 630 {
5567                     .text:	section	.text,new
5568  0000               _lcd_cntl:
5572                     ; 649 }
5575  0000 81            	ret	
5598                     ; 651 void	systemLcdClear(void)
5598                     ; 652 {
5599                     .text:	section	.text,new
5600  0000               _systemLcdClear:
5604                     ; 653 	LCD->CR1 = LCD_CR1_RESET_VALUE;
5606  0000 725f5400      	clr	21504
5607                     ; 654 	LCD->CR2 = LCD_CR2_RESET_VALUE;
5609  0004 725f5401      	clr	21505
5610                     ; 655 	LCD->CR3 = LCD_CR3_RESET_VALUE;
5612  0008 725f5402      	clr	21506
5613                     ; 656 	LCD->FRQ = LCD_FRQ_RESET_VALUE;
5615  000c 725f5403      	clr	21507
5616                     ; 658 	LCD->CR4 = LCD_CR4_RESET_VALUE;
5618  0010 725f542f      	clr	21551
5619                     ; 659 }
5622  0014 81            	ret	
5656                     ; 696 void	systemLcd(void)
5656                     ; 697 {
5657                     .text:	section	.text,new
5658  0000               _systemLcd:
5662                     ; 698 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
5664  0000 ae1301        	ldw	x,#4865
5665  0003 cd0000        	call	_CLK_PeripheralClockConfig
5667                     ; 699 	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
5669  0006 ae0400        	ldw	x,#1024
5670  0009 cd0000        	call	_CLK_RTCClockConfig
5672                     ; 700 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
5674  000c ae1201        	ldw	x,#4609
5675  000f cd0000        	call	_CLK_PeripheralClockConfig
5677                     ; 702 	systemLcdClear();
5679  0012 cd0000        	call	_systemLcdClear
5681                     ; 704 	LCD_Init(
5681                     ; 705 		LCD_Prescaler_2, 
5681                     ; 706 		LCD_Divider_18, 
5681                     ; 707 		LCD_Duty_1_4,
5681                     ; 708 		LCD_Bias_1_3, 
5681                     ; 709 #if defined (_RC_DR_) || defined (_RC_DW_)
5681                     ; 710 		LCD_VoltageSource_External
5681                     ; 711 #else
5681                     ; 712 		LCD_VoltageSource_Internal
5681                     ; 713 #endif
5681                     ; 714 		);
5683  0015 4b01          	push	#1
5684  0017 4b00          	push	#0
5685  0019 4b06          	push	#6
5686  001b ae1002        	ldw	x,#4098
5687  001e cd0000        	call	_LCD_Init
5689  0021 5b03          	addw	sp,#3
5690                     ; 717 	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
5692  0023 ae00ff        	ldw	x,#255
5693  0026 cd0000        	call	_LCD_PortMaskConfig
5695                     ; 718 	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFE);	//	s8 Skip
5697  0029 ae01fe        	ldw	x,#510
5698  002c cd0000        	call	_LCD_PortMaskConfig
5700                     ; 719 	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x01);
5702  002f ae0201        	ldw	x,#513
5703  0032 cd0000        	call	_LCD_PortMaskConfig
5705                     ; 720 	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);	//	seg24/seg20/seg17/seg16
5707  0035 ae0300        	ldw	x,#768
5708  0038 cd0000        	call	_LCD_PortMaskConfig
5710                     ; 734 	LCD_HighDriveCmd(ENABLE);
5712  003b a601          	ld	a,#1
5713  003d cd0000        	call	_LCD_HighDriveCmd
5715                     ; 735 	LCD_ContrastConfig(LCD_Contrast_Level_7);
5717  0040 a60e          	ld	a,#14
5718  0042 cd0000        	call	_LCD_ContrastConfig
5720                     ; 736 	LCD_DeadTimeConfig(LCD_DeadTime_0);
5722  0045 4f            	clr	a
5723  0046 cd0000        	call	_LCD_DeadTimeConfig
5725                     ; 737 	LCD_PulseOnDurationConfig(LCD_PulseOnDuration_0);
5727  0049 4f            	clr	a
5728  004a cd0000        	call	_LCD_PulseOnDurationConfig
5730                     ; 746 	lcd_init();
5732  004d cd0000        	call	_lcd_init
5734                     ; 748 	LCD_Cmd(ENABLE); 
5736  0050 a601          	ld	a,#1
5738                     ; 749 }
5741  0052 cc0000        	jp	_LCD_Cmd
5744                     	switch	.data
5745  0001               __blink_timer:
5746  0001 05            	dc.b	5
5747  0002               __blinkFlag:
5748  0002 00            	dc.b	0
5749  0003               __blinkId:
5750  0003 ff            	dc.b	255
5751  0004               __blink:
5752  0004 00            	dc.b	0
5753  0005               __blinkFlag2:
5754  0005 00            	dc.b	0
5755  0006               __blinkId2:
5756  0006 ff            	dc.b	255
5757  0007               __blinkId2b:
5758  0007 ff            	dc.b	255
5759  0008               __blink2:
5760  0008 00            	dc.b	0
5761  0009               __blinkNpos:
5762  0009 00            	dc.b	0
5763  000a               __blinkFlag3:
5764  000a 00            	dc.b	0
5765  000b               __blinkId3:
5766  000b ff            	dc.b	255
5767  000c               __blink3:
5768  000c 00            	dc.b	0
5791                     ; 766 void	lcd_blink_npos_clear(void)
5791                     ; 767 {
5792                     .text:	section	.text,new
5793  0000               _lcd_blink_npos_clear:
5797                     ; 768 	_blinkNpos = 0;
5799  0000 725f0009      	clr	__blinkNpos
5800                     ; 769 }
5803  0004 81            	ret	
5836                     ; 771 void	lcd_blink_npos(uint8_t i)
5836                     ; 772 {
5837                     .text:	section	.text,new
5838  0000               _lcd_blink_npos:
5842                     ; 773 	_blinkNpos = i + 1;
5844  0000 4c            	inc	a
5845  0001 c70009        	ld	__blinkNpos,a
5846                     ; 774 }
5849  0004 81            	ret	
5875                     ; 776 void	lcd_blink_clear(void)
5875                     ; 777 {
5876                     .text:	section	.text,new
5877  0000               _lcd_blink_clear:
5881                     ; 778 	_blinkId = 0;
5883  0000 725f0003      	clr	__blinkId
5884                     ; 779 	_blinkId2 = 0;
5886  0004 725f0006      	clr	__blinkId2
5887                     ; 780 	_blinkId2b = 0;
5889  0008 725f0007      	clr	__blinkId2b
5890                     ; 781 }
5893  000c 81            	ret	
5927                     ; 783 void	lcd_blink_item(uint8_t i)
5927                     ; 784 {
5928                     .text:	section	.text,new
5929  0000               _lcd_blink_item:
5933                     ; 785 	_blinkId = i;
5935  0000 c70003        	ld	__blinkId,a
5936                     ; 786 	_blink = 0;
5938  0003 725f0004      	clr	__blink
5939                     ; 787 }
5942  0007 81            	ret	
5968                     ; 789 void	lcd_blink_clearRoom(void)
5968                     ; 790 {
5969                     .text:	section	.text,new
5970  0000               _lcd_blink_clearRoom:
5974                     ; 791 	_blinkId2 = 0;
5976  0000 725f0006      	clr	__blinkId2
5977                     ; 792 	_blinkId2b = 0;
5979  0004 725f0007      	clr	__blinkId2b
5980                     ; 793 }
5983  0008 81            	ret	
6026                     ; 795 void	lcd_blink_itemRoom(uint8_t i, uint8_t imode)
6026                     ; 796 {
6027                     .text:	section	.text,new
6028  0000               _lcd_blink_itemRoom:
6030  0000 89            	pushw	x
6031       00000000      OFST:	set	0
6034                     ; 797 	_blinkId2 = _rid[i*2];
6036  0001 9e            	ld	a,xh
6037  0002 5f            	clrw	x
6038  0003 97            	ld	xl,a
6039  0004 58            	sllw	x
6040  0005 d601da        	ld	a,(__rid,x)
6041  0008 c70006        	ld	__blinkId2,a
6042                     ; 798 	if( imode != 0 )
6044  000b 7b02          	ld	a,(OFST+2,sp)
6045  000d 270b          	jreq	L1322
6046                     ; 799 		_blinkId2b = _rid[i*2+1];
6048  000f 7b01          	ld	a,(OFST+1,sp)
6049  0011 5f            	clrw	x
6050  0012 97            	ld	xl,a
6051  0013 58            	sllw	x
6052  0014 d601db        	ld	a,(__rid+1,x)
6053  0017 c70007        	ld	__blinkId2b,a
6054  001a               L1322:
6055                     ; 800 	_blink2 = 0;
6057  001a 725f0008      	clr	__blink2
6058                     ; 801 }
6061  001e 85            	popw	x
6062  001f 81            	ret	
6119                     ; 803 void	lcd_blinkCb(void)
6119                     ; 804 {
6120                     .text:	section	.text,new
6121  0000               _lcd_blinkCb:
6123  0000 5204          	subw	sp,#4
6124       00000004      OFST:	set	4
6127                     ; 807 	if( _blink_timer == 0 )
6129  0002 c60001        	ld	a,__blink_timer
6130  0005 2603cc0165    	jreq	L3332
6131                     ; 808 		return;
6133                     ; 810 	if( (__timer100ms%_blink_timer) == 0 )
6135  000a c60000        	ld	a,___timer100ms
6136  000d 5f            	clrw	x
6137  000e 97            	ld	xl,a
6138  000f c60001        	ld	a,__blink_timer
6139  0012 905f          	clrw	y
6140  0014 9097          	ld	yl,a
6141  0016 cd0000        	call	c_idiv
6143  0019 905d          	tnzw	y
6144  001b 2703cc0159    	jrne	L5522
6145                     ; 812 		if( _blinkFlag == 0 )
6147  0020 c60002        	ld	a,__blinkFlag
6148  0023 262b          	jrne	L7522
6149                     ; 814 			_blinkFlag = 1;
6151  0025 35010002      	mov	__blinkFlag,#1
6152                     ; 815 			if( _blinkId != 0 )
6154  0029 c60003        	ld	a,__blinkId
6155  002c 2722          	jreq	L7522
6156                     ; 817 				if( _blink != 0 )
6158  002e 725d0004      	tnz	__blink
6159  0032 270f          	jreq	L3622
6160                     ; 819 					LCD_BIT_CLEAR(_blinkId);
6162  0034 cd0168        	call	LC007
6163  0037 c60003        	ld	a,__blinkId
6164  003a cd0170        	call	LC008
6165                     ; 820 					_blink = 0;
6167  003d 725f0004      	clr	__blink
6169  0041 200d          	jra	L7522
6170  0043               L3622:
6171                     ; 824 					LCD_BIT_SET(_blinkId);
6173  0043 cd0168        	call	LC007
6174  0046 c60003        	ld	a,__blinkId
6175  0049 cd0180        	call	LC009
6176                     ; 825 					_blink = 1;
6178  004c 35010004      	mov	__blink,#1
6179  0050               L7522:
6180                     ; 829 		if( _blinkFlag2 == 0 )
6182  0050 c60005        	ld	a,__blinkFlag2
6183  0053 264c          	jrne	L7622
6184                     ; 831 			_blinkFlag2 = 1;
6186  0055 35010005      	mov	__blinkFlag2,#1
6187                     ; 832 			if( _blinkId2 != 0 )
6189  0059 c60006        	ld	a,__blinkId2
6190  005c 2743          	jreq	L7622
6191                     ; 834 				if( _blink2 != 0 )
6193  005e c60008        	ld	a,__blink2
6194  0061 2720          	jreq	L3722
6195                     ; 836 					if( _blinkId2b != 0 )
6197  0063 c60007        	ld	a,__blinkId2b
6198  0066 2709          	jreq	L5722
6199                     ; 837 						LCD_BIT_CLEAR(_blinkId2b);
6201  0068 cd0168        	call	LC007
6202  006b c60007        	ld	a,__blinkId2b
6203  006e cd0170        	call	LC008
6204  0071               L5722:
6205                     ; 838 					LCD_BIT_CLEAR(_blinkId2);
6207  0071 c60006        	ld	a,__blinkId2
6208  0074 cd0168        	call	LC007
6209  0077 c60006        	ld	a,__blinkId2
6210  007a cd0170        	call	LC008
6211                     ; 839 					_blink2 = 0;
6213  007d 725f0008      	clr	__blink2
6215  0081 201e          	jra	L7622
6216  0083               L3722:
6217                     ; 843 					if( _blinkId2b != 0 )
6219  0083 c60007        	ld	a,__blinkId2b
6220  0086 2709          	jreq	L1032
6221                     ; 844 						LCD_BIT_SET(_blinkId2b);
6223  0088 cd0168        	call	LC007
6224  008b c60007        	ld	a,__blinkId2b
6225  008e cd0180        	call	LC009
6226  0091               L1032:
6227                     ; 845 					LCD_BIT_SET(_blinkId2);
6229  0091 c60006        	ld	a,__blinkId2
6230  0094 cd0168        	call	LC007
6231  0097 c60006        	ld	a,__blinkId2
6232  009a cd0180        	call	LC009
6233                     ; 846 					_blink2 = 1;
6235  009d 35010008      	mov	__blink2,#1
6236  00a1               L7622:
6237                     ; 850 		if( _blinkFlag3 == 0 )
6239  00a1 c6000a        	ld	a,__blinkFlag3
6240  00a4 2703cc0165    	jrne	L3332
6241                     ; 852 			_blinkFlag3 = 1;
6243  00a9 3501000a      	mov	__blinkFlag3,#1
6244                     ; 853 			if( _blinkNpos != 0 )
6246  00ad 725d0009      	tnz	__blinkNpos
6247  00b1 27f3          	jreq	L3332
6248                     ; 855 				p = lcd_get_npos(0);
6250  00b3 cd0000        	call	_lcd_get_npos
6252  00b6 1f02          	ldw	(OFST-2,sp),x
6253                     ; 856 				p = p+(_blinkNpos-1)*7;
6255  00b8 c60009        	ld	a,__blinkNpos
6256  00bb 97            	ld	xl,a
6257  00bc a607          	ld	a,#7
6258  00be 42            	mul	x,a
6259  00bf 1d0007        	subw	x,#7
6260  00c2 72fb02        	addw	x,(OFST-2,sp)
6261  00c5 1f02          	ldw	(OFST-2,sp),x
6262                     ; 857 				if( _blinkId3 != 0 )
6264  00c7 c6000b        	ld	a,__blinkId3
6265  00ca 2746          	jreq	L7032
6266                     ; 859 					for( i=0; i<7; i++ )
6268  00cc 0f04          	clr	(OFST+0,sp)
6269  00ce               L1132:
6270                     ; 861 						if( p[i] != 0 )
6272  00ce 7b02          	ld	a,(OFST-2,sp)
6273  00d0 97            	ld	xl,a
6274  00d1 7b03          	ld	a,(OFST-1,sp)
6275  00d3 1b04          	add	a,(OFST+0,sp)
6276  00d5 2401          	jrnc	L053
6277  00d7 5c            	incw	x
6278  00d8               L053:
6279  00d8 02            	rlwa	x,a
6280  00d9 f6            	ld	a,(x)
6281  00da 2728          	jreq	L7132
6282                     ; 862 							LCD_BIT_CLEAR(p[i]);
6284  00dc 7b02          	ld	a,(OFST-2,sp)
6285  00de 97            	ld	xl,a
6286  00df 7b03          	ld	a,(OFST-1,sp)
6287  00e1 1b04          	add	a,(OFST+0,sp)
6288  00e3 2401          	jrnc	L253
6289  00e5 5c            	incw	x
6290  00e6               L253:
6291  00e6 02            	rlwa	x,a
6292  00e7 f6            	ld	a,(x)
6293  00e8 ad7e          	call	LC007
6294  00ea 89            	pushw	x
6295  00eb 7b04          	ld	a,(OFST+0,sp)
6296  00ed 97            	ld	xl,a
6297  00ee 7b05          	ld	a,(OFST+1,sp)
6298  00f0 1b06          	add	a,(OFST+2,sp)
6299  00f2 2401          	jrnc	L453
6300  00f4 5c            	incw	x
6301  00f5               L453:
6302  00f5 02            	rlwa	x,a
6303  00f6 f6            	ld	a,(x)
6304  00f7 5f            	clrw	x
6305  00f8 97            	ld	xl,a
6306  00f9 d60000        	ld	a,(_bLF_DEF,x)
6307  00fc 43            	cpl	a
6308  00fd 85            	popw	x
6309  00fe d4540c        	and	a,(21516,x)
6310  0101 d7540c        	ld	(21516,x),a
6311  0104               L7132:
6312                     ; 859 					for( i=0; i<7; i++ )
6314  0104 0c04          	inc	(OFST+0,sp)
6317  0106 7b04          	ld	a,(OFST+0,sp)
6318  0108 a107          	cp	a,#7
6319  010a 25c2          	jrult	L1132
6320                     ; 864 					_blinkId3 = 0;
6322  010c 725f000b      	clr	__blinkId3
6324  0110 2053          	jra	L3332
6325  0112               L7032:
6326                     ; 868 					for( i=0; i<7; i++ )
6328  0112 6b04          	ld	(OFST+0,sp),a
6329  0114               L3232:
6330                     ; 870 						if( p[i] != 0 )
6332  0114 7b02          	ld	a,(OFST-2,sp)
6333  0116 97            	ld	xl,a
6334  0117 7b03          	ld	a,(OFST-1,sp)
6335  0119 1b04          	add	a,(OFST+0,sp)
6336  011b 2401          	jrnc	L653
6337  011d 5c            	incw	x
6338  011e               L653:
6339  011e 02            	rlwa	x,a
6340  011f f6            	ld	a,(x)
6341  0120 2729          	jreq	L1332
6342                     ; 871 							LCD_BIT_SET(p[i]);
6344  0122 7b02          	ld	a,(OFST-2,sp)
6345  0124 97            	ld	xl,a
6346  0125 7b03          	ld	a,(OFST-1,sp)
6347  0127 1b04          	add	a,(OFST+0,sp)
6348  0129 2401          	jrnc	L063
6349  012b 5c            	incw	x
6350  012c               L063:
6351  012c 02            	rlwa	x,a
6352  012d f6            	ld	a,(x)
6353  012e 5f            	clrw	x
6354  012f 97            	ld	xl,a
6355  0130 d60000        	ld	a,(_bLF_DEF,x)
6356  0133 6b01          	ld	(OFST-3,sp),a
6357  0135 7b02          	ld	a,(OFST-2,sp)
6358  0137 97            	ld	xl,a
6359  0138 7b03          	ld	a,(OFST-1,sp)
6360  013a 1b04          	add	a,(OFST+0,sp)
6361  013c 2401          	jrnc	L263
6362  013e 5c            	incw	x
6363  013f               L263:
6364  013f 02            	rlwa	x,a
6365  0140 f6            	ld	a,(x)
6366  0141 ad25          	call	LC007
6367  0143 d6540c        	ld	a,(21516,x)
6368  0146 1a01          	or	a,(OFST-3,sp)
6369  0148 d7540c        	ld	(21516,x),a
6370  014b               L1332:
6371                     ; 868 					for( i=0; i<7; i++ )
6373  014b 0c04          	inc	(OFST+0,sp)
6376  014d 7b04          	ld	a,(OFST+0,sp)
6377  014f a107          	cp	a,#7
6378  0151 25c1          	jrult	L3232
6379                     ; 873 					_blinkId3 = 1;
6381  0153 3501000b      	mov	__blinkId3,#1
6382  0157 200c          	jra	L3332
6383  0159               L5522:
6384                     ; 880 		_blinkFlag = 0;
6386  0159 725f0002      	clr	__blinkFlag
6387                     ; 881 		_blinkFlag2 = 0;
6389  015d 725f0005      	clr	__blinkFlag2
6390                     ; 882 		_blinkFlag3 = 0;
6392  0161 725f000a      	clr	__blinkFlag3
6393  0165               L3332:
6394                     ; 884 }
6397  0165 5b04          	addw	sp,#4
6398  0167 81            	ret	
6399  0168               LC007:
6400  0168 5f            	clrw	x
6401  0169 97            	ld	xl,a
6402  016a d60040        	ld	a,(_iLF_DEF,x)
6403  016d 5f            	clrw	x
6404  016e 97            	ld	xl,a
6405  016f 81            	ret	
6406  0170               LC008:
6407  0170 905f          	clrw	y
6408  0172 9097          	ld	yl,a
6409  0174 90d60000      	ld	a,(_bLF_DEF,y)
6410  0178 43            	cpl	a
6411  0179 d4540c        	and	a,(21516,x)
6412  017c d7540c        	ld	(21516,x),a
6413  017f 81            	ret	
6414  0180               LC009:
6415  0180 905f          	clrw	y
6416  0182 9097          	ld	yl,a
6417  0184 d6540c        	ld	a,(21516,x)
6418  0187 90da0000      	or	a,(_bLF_DEF,y)
6419  018b d7540c        	ld	(21516,x),a
6420  018e 81            	ret	
6926                     	xdef	__blink3
6927                     	xdef	__blinkId3
6928                     	xdef	__blinkFlag3
6929                     	xdef	__blinkNpos
6930                     	xdef	__blink2
6931                     	xdef	__blinkId2b
6932                     	xdef	__blinkId2
6933                     	xdef	__blinkFlag2
6934                     	xdef	__blink
6935                     	xdef	__blinkId
6936                     	xdef	__blinkFlag
6937                     	xdef	__blink_timer
6938                     	xdef	_systemLcdClear
6939                     	xdef	_lcd_init
6940                     	xdef	___i
6941                     	xdef	_lcd_disp_cmd
6942                     	xref	_error_type
6943                     	xdef	_lcd_get_npos
6944                     	xdef	_lcd_disp_all
6945                     	xdef	_lcd_clear_cnt
6946                     	xdef	_lcd_clear_m
6947                     	xdef	_lcd_clear_info
6948                     	xdef	__plc
6949                     	xdef	__cnt_sub
6950                     	xdef	__cnt_host
6951                     	xdef	__lpm
6952                     	xdef	__temp_offset
6953                     	xdef	__po_type_pb
6954                     	xdef	__po_type_xl
6955                     	xdef	__po_type
6956                     	xdef	__len
6957                     	xdef	__freset
6958                     	xdef	__mir2
6959                     	xdef	__mir1
6960                     	xdef	__cntl_tab
6961                     	xdef	__cntl_2motor
6962                     	xdef	__cntl_op
6963                     	xdef	__link
6964                     	xdef	__hc
6965                     	xdef	__run
6966                     	xdef	__hcEach
6967                     	xdef	__hcLocal
6968                     	xdef	__cntl_po
6969                     	xdef	__cntl_on
6970                     	xdef	__cc
6971                     	xdef	__btn
6972                     	xdef	__bL
6973                     	xdef	__info
6974                     	xdef	__nid
6975                     	xdef	__n
6976                     	xdef	__nvalve
6977                     	xdef	__ncnt
6978                     	xdef	__nm
6979                     	xdef	__nerrBr
6980                     	xdef	__nerr
6981                     	xdef	__nd
6982                     	xdef	__nc
6983                     	xdef	__nb
6984                     	xdef	__na
6985                     	xdef	_lcd_blink_npos
6986                     	xdef	_lcd_blink_npos_clear
6987                     	xdef	_lcd_disp_info
6988                     	xdef	_lcd_disp_info_fire
6989                     	xdef	_lcd_disp_info_shower
6990                     	xdef	_lcd_clear_rid_n
6991                     	xdef	_lcd_blinkCb
6992                     	xdef	_lcd_blink_itemRoom
6993                     	xdef	_lcd_blink_item
6994                     	xdef	_lcd_blink_clearRoom
6995                     	xdef	_lcd_blink_clear
6996                     	xdef	_lcd_clear_npos
6997                     	xdef	_lcd_disp_rid
6998                     	xdef	_lcd_disp_err
6999                     	xdef	_lcd_disp_n
7000                     	xdef	_lcd_clear
7001                     	xdef	_lcd_disp_setup_mode_each
7002                     	xdef	_lcd_disp_setup_mode_local
7003                     	xdef	_lcd_disp_setup_valve
7004                     	xdef	_lcd_disp_setup_cnt
7005                     	xdef	_lcd_disp_setup_m
7006                     	xdef	_lcd_disp_setup_id
7007                     	xdef	_lcd_disp_setup_mode
7008                     	xdef	_lcd_disp_setup_run
7009                     	xdef	_lcd_disp_setup_c
7010                     	xdef	_lcd_disp_setup_link
7011                     	xdef	_lcd_disp_plc
7012                     	xdef	_lcd_disp_cnt_sub
7013                     	xdef	_lcd_disp_cnt_host
7014                     	xdef	_lcd_disp_freset
7015                     	xdef	_lcd_disp_mir2
7016                     	xdef	_lcd_disp_mir1
7017                     	xdef	_lcd_disp_setup_cntl_tab
7018                     	xdef	_lcd_disp_setup_cntl_2motor
7019                     	xdef	_lcd_disp_setup_cntl_po
7020                     	xdef	_lcd_disp_setup_cntl_on
7021                     	xdef	_lcd_disp_setup_cntl_op
7022                     	xdef	_lcd_disp_setup_len
7023                     	xdef	_lcd_disp_setup_po_type_pb
7024                     	xdef	_lcd_disp_setup_po_type_xl
7025                     	xdef	_lcd_disp_setup_po_type
7026                     	xdef	_lcd_disp_setup_temp_offset
7027                     	xdef	_lcd_disp_setup_lpm
7028                     	xdef	_lcd_disp_backlight
7029                     	xdef	_lcd_clear_rid
7030                     	xdef	_lcd_clear_run
7031                     	xdef	_lcd_clear_mode
7032                     	xdef	_lcd_clear_n
7033                     	xdef	_lcd_clear_c
7034                     	xdef	_lcd_clear_btn
7035                     	xdef	_lcd_clear_backlight
7036                     	xdef	__rid
7037                     	xdef	_iLF_DEF
7038                     	xdef	_bLF_DEF
7039                     	xref	_uiInfo
7040                     	xref	___timer100ms
7041                     	xdef	_lcd_cntl
7042                     	xdef	_lcd_disp
7043                     	xdef	_lcd_blink
7044                     	xdef	_systemLcd
7045                     	xref	_LCD_ContrastConfig
7046                     	xref	_LCD_DeadTimeConfig
7047                     	xref	_LCD_PulseOnDurationConfig
7048                     	xref	_LCD_HighDriveCmd
7049                     	xref	_LCD_Cmd
7050                     	xref	_LCD_PortMaskConfig
7051                     	xref	_LCD_Init
7052                     	xref	_CLK_PeripheralClockConfig
7053                     	xref	_CLK_RTCClockConfig
7054                     	xref.b	c_x
7073                     	xref	c_idiv
7074                     	xref	c_smodx
7075                     	end
