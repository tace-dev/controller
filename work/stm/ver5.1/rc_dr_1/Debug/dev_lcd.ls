   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
 832                     ; 414 LCD_DISP_FUNC_1(lcd_disp_plc, 12, _plc)
 833                     .text:	section	.text,new
 834  0000               _lcd_disp_plc:
 836  0000 89            	pushw	x
 837       00000002      OFST:	set	2
 840  0001 4f            	clr	a
 841  0002 6b02          	ld	(OFST+0,sp),a
 843  0004               L34:
 846  0004 5f            	clrw	x
 847  0005 97            	ld	xl,a
 848  0006 d6029c        	ld	a,(__plc,x)
 849  0009 6b01          	ld	(OFST-1,sp),a
 853  000b 5f            	clrw	x
 854  000c 97            	ld	xl,a
 855  000d d60040        	ld	a,(_iLF_DEF,x)
 856  0010 5f            	clrw	x
 857  0011 97            	ld	xl,a
 858  0012 7b01          	ld	a,(OFST-1,sp)
 859  0014 905f          	clrw	y
 860  0016 9097          	ld	yl,a
 861  0018 d6540c        	ld	a,(21516,x)
 862  001b 90da0000      	or	a,(_bLF_DEF,y)
 863  001f d7540c        	ld	(21516,x),a
 866  0022 0c02          	inc	(OFST+0,sp)
 870  0024 7b02          	ld	a,(OFST+0,sp)
 871  0026 a10c          	cp	a,#12
 872  0028 25da          	jrult	L34
 876  002a 85            	popw	x
 877  002b 81            	ret	
 919                     ; 416 LCD_DISP_FUNC_1(lcd_disp_cnt_host, 9, _cnt_host)
 920                     .text:	section	.text,new
 921  0000               _lcd_disp_cnt_host:
 923  0000 89            	pushw	x
 924       00000002      OFST:	set	2
 927  0001 4f            	clr	a
 928  0002 6b02          	ld	(OFST+0,sp),a
 930  0004               L76:
 933  0004 5f            	clrw	x
 934  0005 97            	ld	xl,a
 935  0006 d6028b        	ld	a,(__cnt_host,x)
 936  0009 6b01          	ld	(OFST-1,sp),a
 940  000b 5f            	clrw	x
 941  000c 97            	ld	xl,a
 942  000d d60040        	ld	a,(_iLF_DEF,x)
 943  0010 5f            	clrw	x
 944  0011 97            	ld	xl,a
 945  0012 7b01          	ld	a,(OFST-1,sp)
 946  0014 905f          	clrw	y
 947  0016 9097          	ld	yl,a
 948  0018 d6540c        	ld	a,(21516,x)
 949  001b 90da0000      	or	a,(_bLF_DEF,y)
 950  001f d7540c        	ld	(21516,x),a
 953  0022 0c02          	inc	(OFST+0,sp)
 957  0024 7b02          	ld	a,(OFST+0,sp)
 958  0026 a109          	cp	a,#9
 959  0028 25da          	jrult	L76
 963  002a 85            	popw	x
 964  002b 81            	ret	
1006                     ; 417 LCD_DISP_FUNC_1(lcd_disp_cnt_sub, 8, _cnt_sub)
1007                     .text:	section	.text,new
1008  0000               _lcd_disp_cnt_sub:
1010  0000 89            	pushw	x
1011       00000002      OFST:	set	2
1014  0001 4f            	clr	a
1015  0002 6b02          	ld	(OFST+0,sp),a
1017  0004               L311:
1020  0004 5f            	clrw	x
1021  0005 97            	ld	xl,a
1022  0006 d60294        	ld	a,(__cnt_sub,x)
1023  0009 6b01          	ld	(OFST-1,sp),a
1027  000b 5f            	clrw	x
1028  000c 97            	ld	xl,a
1029  000d d60040        	ld	a,(_iLF_DEF,x)
1030  0010 5f            	clrw	x
1031  0011 97            	ld	xl,a
1032  0012 7b01          	ld	a,(OFST-1,sp)
1033  0014 905f          	clrw	y
1034  0016 9097          	ld	yl,a
1035  0018 d6540c        	ld	a,(21516,x)
1036  001b 90da0000      	or	a,(_bLF_DEF,y)
1037  001f d7540c        	ld	(21516,x),a
1040  0022 0c02          	inc	(OFST+0,sp)
1044  0024 7b02          	ld	a,(OFST+0,sp)
1045  0026 a108          	cp	a,#8
1046  0028 25da          	jrult	L311
1050  002a 85            	popw	x
1051  002b 81            	ret	
1093                     ; 419 LCD_DISP_FUNC_1(lcd_disp_mir1, 7, _mir1)
1094                     .text:	section	.text,new
1095  0000               _lcd_disp_mir1:
1097  0000 89            	pushw	x
1098       00000002      OFST:	set	2
1101  0001 4f            	clr	a
1102  0002 6b02          	ld	(OFST+0,sp),a
1104  0004               L731:
1107  0004 5f            	clrw	x
1108  0005 97            	ld	xl,a
1109  0006 d6024a        	ld	a,(__mir1,x)
1110  0009 6b01          	ld	(OFST-1,sp),a
1114  000b 5f            	clrw	x
1115  000c 97            	ld	xl,a
1116  000d d60040        	ld	a,(_iLF_DEF,x)
1117  0010 5f            	clrw	x
1118  0011 97            	ld	xl,a
1119  0012 7b01          	ld	a,(OFST-1,sp)
1120  0014 905f          	clrw	y
1121  0016 9097          	ld	yl,a
1122  0018 d6540c        	ld	a,(21516,x)
1123  001b 90da0000      	or	a,(_bLF_DEF,y)
1124  001f d7540c        	ld	(21516,x),a
1127  0022 0c02          	inc	(OFST+0,sp)
1131  0024 7b02          	ld	a,(OFST+0,sp)
1132  0026 a107          	cp	a,#7
1133  0028 25da          	jrult	L731
1137  002a 85            	popw	x
1138  002b 81            	ret	
1180                     ; 420 LCD_DISP_FUNC_1(lcd_disp_mir2, 10, _mir2)
1181                     .text:	section	.text,new
1182  0000               _lcd_disp_mir2:
1184  0000 89            	pushw	x
1185       00000002      OFST:	set	2
1188  0001 4f            	clr	a
1189  0002 6b02          	ld	(OFST+0,sp),a
1191  0004               L361:
1194  0004 5f            	clrw	x
1195  0005 97            	ld	xl,a
1196  0006 d60251        	ld	a,(__mir2,x)
1197  0009 6b01          	ld	(OFST-1,sp),a
1201  000b 5f            	clrw	x
1202  000c 97            	ld	xl,a
1203  000d d60040        	ld	a,(_iLF_DEF,x)
1204  0010 5f            	clrw	x
1205  0011 97            	ld	xl,a
1206  0012 7b01          	ld	a,(OFST-1,sp)
1207  0014 905f          	clrw	y
1208  0016 9097          	ld	yl,a
1209  0018 d6540c        	ld	a,(21516,x)
1210  001b 90da0000      	or	a,(_bLF_DEF,y)
1211  001f d7540c        	ld	(21516,x),a
1214  0022 0c02          	inc	(OFST+0,sp)
1218  0024 7b02          	ld	a,(OFST+0,sp)
1219  0026 a10a          	cp	a,#10
1220  0028 25da          	jrult	L361
1224  002a 85            	popw	x
1225  002b 81            	ret	
1267                     ; 421 LCD_DISP_FUNC_1(lcd_disp_freset, 6, _freset)
1268                     .text:	section	.text,new
1269  0000               _lcd_disp_freset:
1271  0000 89            	pushw	x
1272       00000002      OFST:	set	2
1275  0001 4f            	clr	a
1276  0002 6b02          	ld	(OFST+0,sp),a
1278  0004               L702:
1281  0004 5f            	clrw	x
1282  0005 97            	ld	xl,a
1283  0006 d6025b        	ld	a,(__freset,x)
1284  0009 6b01          	ld	(OFST-1,sp),a
1288  000b 5f            	clrw	x
1289  000c 97            	ld	xl,a
1290  000d d60040        	ld	a,(_iLF_DEF,x)
1291  0010 5f            	clrw	x
1292  0011 97            	ld	xl,a
1293  0012 7b01          	ld	a,(OFST-1,sp)
1294  0014 905f          	clrw	y
1295  0016 9097          	ld	yl,a
1296  0018 d6540c        	ld	a,(21516,x)
1297  001b 90da0000      	or	a,(_bLF_DEF,y)
1298  001f d7540c        	ld	(21516,x),a
1301  0022 0c02          	inc	(OFST+0,sp)
1305  0024 7b02          	ld	a,(OFST+0,sp)
1306  0026 a106          	cp	a,#6
1307  0028 25da          	jrult	L702
1311  002a 85            	popw	x
1312  002b 81            	ret	
1355                     ; 423 LCD_DISP_FUNC(lcd_disp_backlight, 8, _bL)
1356                     .text:	section	.text,new
1357  0000               _lcd_disp_backlight:
1359  0000 89            	pushw	x
1360       00000002      OFST:	set	2
1365  0001 cd0000        	call	_lcd_clear_n
1368  0004 4f            	clr	a
1369  0005 6b02          	ld	(OFST+0,sp),a
1371  0007               L332:
1374  0007 5f            	clrw	x
1375  0008 97            	ld	xl,a
1376  0009 d601e8        	ld	a,(__bL,x)
1377  000c 6b01          	ld	(OFST-1,sp),a
1381  000e 5f            	clrw	x
1382  000f 97            	ld	xl,a
1383  0010 d60040        	ld	a,(_iLF_DEF,x)
1384  0013 5f            	clrw	x
1385  0014 97            	ld	xl,a
1386  0015 7b01          	ld	a,(OFST-1,sp)
1387  0017 905f          	clrw	y
1388  0019 9097          	ld	yl,a
1389  001b d6540c        	ld	a,(21516,x)
1390  001e 90da0000      	or	a,(_bLF_DEF,y)
1391  0022 d7540c        	ld	(21516,x),a
1394  0025 0c02          	inc	(OFST+0,sp)
1398  0027 7b02          	ld	a,(OFST+0,sp)
1399  0029 a108          	cp	a,#8
1400  002b 25da          	jrult	L332
1404  002d 85            	popw	x
1405  002e 81            	ret	
1448                     ; 425 LCD_DISP_FUNC(lcd_disp_setup_lpm, 8, _lpm)
1449                     .text:	section	.text,new
1450  0000               _lcd_disp_setup_lpm:
1452  0000 89            	pushw	x
1453       00000002      OFST:	set	2
1458  0001 cd0000        	call	_lcd_clear_n
1461  0004 4f            	clr	a
1462  0005 6b02          	ld	(OFST+0,sp),a
1464  0007               L752:
1467  0007 5f            	clrw	x
1468  0008 97            	ld	xl,a
1469  0009 d60283        	ld	a,(__lpm,x)
1470  000c 6b01          	ld	(OFST-1,sp),a
1474  000e 5f            	clrw	x
1475  000f 97            	ld	xl,a
1476  0010 d60040        	ld	a,(_iLF_DEF,x)
1477  0013 5f            	clrw	x
1478  0014 97            	ld	xl,a
1479  0015 7b01          	ld	a,(OFST-1,sp)
1480  0017 905f          	clrw	y
1481  0019 9097          	ld	yl,a
1482  001b d6540c        	ld	a,(21516,x)
1483  001e 90da0000      	or	a,(_bLF_DEF,y)
1484  0022 d7540c        	ld	(21516,x),a
1487  0025 0c02          	inc	(OFST+0,sp)
1491  0027 7b02          	ld	a,(OFST+0,sp)
1492  0029 a108          	cp	a,#8
1493  002b 25da          	jrult	L752
1497  002d 85            	popw	x
1498  002e 81            	ret	
1542                     ; 426 LCD_DISP_FUNC(lcd_disp_setup_temp_offset, 4, _temp_offset)
1543                     .text:	section	.text,new
1544  0000               _lcd_disp_setup_temp_offset:
1546  0000 89            	pushw	x
1547       00000002      OFST:	set	2
1552  0001 cd0000        	call	_lcd_clear_n
1555  0004 4f            	clr	a
1556  0005 6b02          	ld	(OFST+0,sp),a
1558  0007               L303:
1561  0007 5f            	clrw	x
1562  0008 97            	ld	xl,a
1563  0009 d6027f        	ld	a,(__temp_offset,x)
1564  000c 6b01          	ld	(OFST-1,sp),a
1568  000e 5f            	clrw	x
1569  000f 97            	ld	xl,a
1570  0010 d60040        	ld	a,(_iLF_DEF,x)
1571  0013 5f            	clrw	x
1572  0014 97            	ld	xl,a
1573  0015 7b01          	ld	a,(OFST-1,sp)
1574  0017 905f          	clrw	y
1575  0019 9097          	ld	yl,a
1576  001b d6540c        	ld	a,(21516,x)
1577  001e 90da0000      	or	a,(_bLF_DEF,y)
1578  0022 d7540c        	ld	(21516,x),a
1581  0025 0c02          	inc	(OFST+0,sp)
1585  0027 7b02          	ld	a,(OFST+0,sp)
1586  0029 a104          	cp	a,#4
1587  002b 25da          	jrult	L303
1591  002d 85            	popw	x
1592  002e 81            	ret	
1636                     ; 428 LCD_DISP_FUNC(lcd_disp_setup_po_type, 9, _po_type)
1637                     .text:	section	.text,new
1638  0000               _lcd_disp_setup_po_type:
1640  0000 89            	pushw	x
1641       00000002      OFST:	set	2
1646  0001 cd0000        	call	_lcd_clear_n
1649  0004 4f            	clr	a
1650  0005 6b02          	ld	(OFST+0,sp),a
1652  0007               L723:
1655  0007 5f            	clrw	x
1656  0008 97            	ld	xl,a
1657  0009 d60264        	ld	a,(__po_type,x)
1658  000c 6b01          	ld	(OFST-1,sp),a
1662  000e 5f            	clrw	x
1663  000f 97            	ld	xl,a
1664  0010 d60040        	ld	a,(_iLF_DEF,x)
1665  0013 5f            	clrw	x
1666  0014 97            	ld	xl,a
1667  0015 7b01          	ld	a,(OFST-1,sp)
1668  0017 905f          	clrw	y
1669  0019 9097          	ld	yl,a
1670  001b d6540c        	ld	a,(21516,x)
1671  001e 90da0000      	or	a,(_bLF_DEF,y)
1672  0022 d7540c        	ld	(21516,x),a
1675  0025 0c02          	inc	(OFST+0,sp)
1679  0027 7b02          	ld	a,(OFST+0,sp)
1680  0029 a109          	cp	a,#9
1681  002b 25da          	jrult	L723
1685  002d 85            	popw	x
1686  002e 81            	ret	
1729                     ; 429 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_xl, 8, _po_type_xl)
1730                     .text:	section	.text,new
1731  0000               _lcd_disp_setup_po_type_xl:
1733  0000 89            	pushw	x
1734       00000002      OFST:	set	2
1737  0001 4f            	clr	a
1738  0002 6b02          	ld	(OFST+0,sp),a
1740  0004               L353:
1743  0004 5f            	clrw	x
1744  0005 97            	ld	xl,a
1745  0006 d6026d        	ld	a,(__po_type_xl,x)
1746  0009 6b01          	ld	(OFST-1,sp),a
1750  000b 5f            	clrw	x
1751  000c 97            	ld	xl,a
1752  000d d60040        	ld	a,(_iLF_DEF,x)
1753  0010 5f            	clrw	x
1754  0011 97            	ld	xl,a
1755  0012 7b01          	ld	a,(OFST-1,sp)
1756  0014 905f          	clrw	y
1757  0016 9097          	ld	yl,a
1758  0018 d6540c        	ld	a,(21516,x)
1759  001b 90da0000      	or	a,(_bLF_DEF,y)
1760  001f d7540c        	ld	(21516,x),a
1763  0022 0c02          	inc	(OFST+0,sp)
1767  0024 7b02          	ld	a,(OFST+0,sp)
1768  0026 a108          	cp	a,#8
1769  0028 25da          	jrult	L353
1773  002a 85            	popw	x
1774  002b 81            	ret	
1817                     ; 430 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_pb, 10, _po_type_pb)
1818                     .text:	section	.text,new
1819  0000               _lcd_disp_setup_po_type_pb:
1821  0000 89            	pushw	x
1822       00000002      OFST:	set	2
1825  0001 4f            	clr	a
1826  0002 6b02          	ld	(OFST+0,sp),a
1828  0004               L773:
1831  0004 5f            	clrw	x
1832  0005 97            	ld	xl,a
1833  0006 d60275        	ld	a,(__po_type_pb,x)
1834  0009 6b01          	ld	(OFST-1,sp),a
1838  000b 5f            	clrw	x
1839  000c 97            	ld	xl,a
1840  000d d60040        	ld	a,(_iLF_DEF,x)
1841  0010 5f            	clrw	x
1842  0011 97            	ld	xl,a
1843  0012 7b01          	ld	a,(OFST-1,sp)
1844  0014 905f          	clrw	y
1845  0016 9097          	ld	yl,a
1846  0018 d6540c        	ld	a,(21516,x)
1847  001b 90da0000      	or	a,(_bLF_DEF,y)
1848  001f d7540c        	ld	(21516,x),a
1851  0022 0c02          	inc	(OFST+0,sp)
1855  0024 7b02          	ld	a,(OFST+0,sp)
1856  0026 a10a          	cp	a,#10
1857  0028 25da          	jrult	L773
1861  002a 85            	popw	x
1862  002b 81            	ret	
1905                     ; 434 LCD_DISP_FUNC(lcd_disp_setup_len, 3, _len)
1906                     .text:	section	.text,new
1907  0000               _lcd_disp_setup_len:
1909  0000 89            	pushw	x
1910       00000002      OFST:	set	2
1915  0001 cd0000        	call	_lcd_clear_n
1918  0004 4f            	clr	a
1919  0005 6b02          	ld	(OFST+0,sp),a
1921  0007               L324:
1924  0007 5f            	clrw	x
1925  0008 97            	ld	xl,a
1926  0009 d60261        	ld	a,(__len,x)
1927  000c 6b01          	ld	(OFST-1,sp),a
1931  000e 5f            	clrw	x
1932  000f 97            	ld	xl,a
1933  0010 d60040        	ld	a,(_iLF_DEF,x)
1934  0013 5f            	clrw	x
1935  0014 97            	ld	xl,a
1936  0015 7b01          	ld	a,(OFST-1,sp)
1937  0017 905f          	clrw	y
1938  0019 9097          	ld	yl,a
1939  001b d6540c        	ld	a,(21516,x)
1940  001e 90da0000      	or	a,(_bLF_DEF,y)
1941  0022 d7540c        	ld	(21516,x),a
1944  0025 0c02          	inc	(OFST+0,sp)
1948  0027 7b02          	ld	a,(OFST+0,sp)
1949  0029 a103          	cp	a,#3
1950  002b 25da          	jrult	L324
1954  002d 85            	popw	x
1955  002e 81            	ret	
1999                     ; 435 LCD_DISP_FUNC(lcd_disp_setup_cntl_op, 9, _cntl_op)
2000                     .text:	section	.text,new
2001  0000               _lcd_disp_setup_cntl_op:
2003  0000 89            	pushw	x
2004       00000002      OFST:	set	2
2009  0001 cd0000        	call	_lcd_clear_n
2012  0004 4f            	clr	a
2013  0005 6b02          	ld	(OFST+0,sp),a
2015  0007               L744:
2018  0007 5f            	clrw	x
2019  0008 97            	ld	xl,a
2020  0009 d6022f        	ld	a,(__cntl_op,x)
2021  000c 6b01          	ld	(OFST-1,sp),a
2025  000e 5f            	clrw	x
2026  000f 97            	ld	xl,a
2027  0010 d60040        	ld	a,(_iLF_DEF,x)
2028  0013 5f            	clrw	x
2029  0014 97            	ld	xl,a
2030  0015 7b01          	ld	a,(OFST-1,sp)
2031  0017 905f          	clrw	y
2032  0019 9097          	ld	yl,a
2033  001b d6540c        	ld	a,(21516,x)
2034  001e 90da0000      	or	a,(_bLF_DEF,y)
2035  0022 d7540c        	ld	(21516,x),a
2038  0025 0c02          	inc	(OFST+0,sp)
2042  0027 7b02          	ld	a,(OFST+0,sp)
2043  0029 a109          	cp	a,#9
2044  002b 25da          	jrult	L744
2048  002d 85            	popw	x
2049  002e 81            	ret	
2092                     ; 436 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_on, 8, _cntl_on)
2093                     .text:	section	.text,new
2094  0000               _lcd_disp_setup_cntl_on:
2096  0000 89            	pushw	x
2097       00000002      OFST:	set	2
2100  0001 4f            	clr	a
2101  0002 6b02          	ld	(OFST+0,sp),a
2103  0004               L374:
2106  0004 5f            	clrw	x
2107  0005 97            	ld	xl,a
2108  0006 d601f6        	ld	a,(__cntl_on,x)
2109  0009 6b01          	ld	(OFST-1,sp),a
2113  000b 5f            	clrw	x
2114  000c 97            	ld	xl,a
2115  000d d60040        	ld	a,(_iLF_DEF,x)
2116  0010 5f            	clrw	x
2117  0011 97            	ld	xl,a
2118  0012 7b01          	ld	a,(OFST-1,sp)
2119  0014 905f          	clrw	y
2120  0016 9097          	ld	yl,a
2121  0018 d6540c        	ld	a,(21516,x)
2122  001b 90da0000      	or	a,(_bLF_DEF,y)
2123  001f d7540c        	ld	(21516,x),a
2126  0022 0c02          	inc	(OFST+0,sp)
2130  0024 7b02          	ld	a,(OFST+0,sp)
2131  0026 a108          	cp	a,#8
2132  0028 25da          	jrult	L374
2136  002a 85            	popw	x
2137  002b 81            	ret	
2180                     ; 437 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_po, 9, _cntl_po)
2181                     .text:	section	.text,new
2182  0000               _lcd_disp_setup_cntl_po:
2184  0000 89            	pushw	x
2185       00000002      OFST:	set	2
2188  0001 4f            	clr	a
2189  0002 6b02          	ld	(OFST+0,sp),a
2191  0004               L715:
2194  0004 5f            	clrw	x
2195  0005 97            	ld	xl,a
2196  0006 d601fe        	ld	a,(__cntl_po,x)
2197  0009 6b01          	ld	(OFST-1,sp),a
2201  000b 5f            	clrw	x
2202  000c 97            	ld	xl,a
2203  000d d60040        	ld	a,(_iLF_DEF,x)
2204  0010 5f            	clrw	x
2205  0011 97            	ld	xl,a
2206  0012 7b01          	ld	a,(OFST-1,sp)
2207  0014 905f          	clrw	y
2208  0016 9097          	ld	yl,a
2209  0018 d6540c        	ld	a,(21516,x)
2210  001b 90da0000      	or	a,(_bLF_DEF,y)
2211  001f d7540c        	ld	(21516,x),a
2214  0022 0c02          	inc	(OFST+0,sp)
2218  0024 7b02          	ld	a,(OFST+0,sp)
2219  0026 a109          	cp	a,#9
2220  0028 25da          	jrult	L715
2224  002a 85            	popw	x
2225  002b 81            	ret	
2268                     ; 438 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_2motor, 10, _cntl_2motor)
2269                     .text:	section	.text,new
2270  0000               _lcd_disp_setup_cntl_2motor:
2272  0000 89            	pushw	x
2273       00000002      OFST:	set	2
2276  0001 4f            	clr	a
2277  0002 6b02          	ld	(OFST+0,sp),a
2279  0004               L345:
2282  0004 5f            	clrw	x
2283  0005 97            	ld	xl,a
2284  0006 d60238        	ld	a,(__cntl_2motor,x)
2285  0009 6b01          	ld	(OFST-1,sp),a
2289  000b 5f            	clrw	x
2290  000c 97            	ld	xl,a
2291  000d d60040        	ld	a,(_iLF_DEF,x)
2292  0010 5f            	clrw	x
2293  0011 97            	ld	xl,a
2294  0012 7b01          	ld	a,(OFST-1,sp)
2295  0014 905f          	clrw	y
2296  0016 9097          	ld	yl,a
2297  0018 d6540c        	ld	a,(21516,x)
2298  001b 90da0000      	or	a,(_bLF_DEF,y)
2299  001f d7540c        	ld	(21516,x),a
2302  0022 0c02          	inc	(OFST+0,sp)
2306  0024 7b02          	ld	a,(OFST+0,sp)
2307  0026 a10a          	cp	a,#10
2308  0028 25da          	jrult	L345
2312  002a 85            	popw	x
2313  002b 81            	ret	
2356                     ; 439 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_tab, 8, _cntl_tab)
2357                     .text:	section	.text,new
2358  0000               _lcd_disp_setup_cntl_tab:
2360  0000 89            	pushw	x
2361       00000002      OFST:	set	2
2364  0001 4f            	clr	a
2365  0002 6b02          	ld	(OFST+0,sp),a
2367  0004               L765:
2370  0004 5f            	clrw	x
2371  0005 97            	ld	xl,a
2372  0006 d60242        	ld	a,(__cntl_tab,x)
2373  0009 6b01          	ld	(OFST-1,sp),a
2377  000b 5f            	clrw	x
2378  000c 97            	ld	xl,a
2379  000d d60040        	ld	a,(_iLF_DEF,x)
2380  0010 5f            	clrw	x
2381  0011 97            	ld	xl,a
2382  0012 7b01          	ld	a,(OFST-1,sp)
2383  0014 905f          	clrw	y
2384  0016 9097          	ld	yl,a
2385  0018 d6540c        	ld	a,(21516,x)
2386  001b 90da0000      	or	a,(_bLF_DEF,y)
2387  001f d7540c        	ld	(21516,x),a
2390  0022 0c02          	inc	(OFST+0,sp)
2394  0024 7b02          	ld	a,(OFST+0,sp)
2395  0026 a108          	cp	a,#8
2396  0028 25da          	jrult	L765
2400  002a 85            	popw	x
2401  002b 81            	ret	
2444                     ; 441 LCD_DISP_FUNC(lcd_disp_setup_c, 1, _cc)
2445                     .text:	section	.text,new
2446  0000               _lcd_disp_setup_c:
2448  0000 89            	pushw	x
2449       00000002      OFST:	set	2
2454  0001 cd0000        	call	_lcd_clear_n
2457  0004 0f02          	clr	(OFST+0,sp)
2459  0006               L316:
2462  0006 7b02          	ld	a,(OFST+0,sp)
2463  0008 5f            	clrw	x
2464  0009 97            	ld	xl,a
2465  000a d601f5        	ld	a,(__cc,x)
2466  000d 6b01          	ld	(OFST-1,sp),a
2470  000f 5f            	clrw	x
2471  0010 97            	ld	xl,a
2472  0011 d60040        	ld	a,(_iLF_DEF,x)
2473  0014 5f            	clrw	x
2474  0015 97            	ld	xl,a
2475  0016 7b01          	ld	a,(OFST-1,sp)
2476  0018 905f          	clrw	y
2477  001a 9097          	ld	yl,a
2478  001c d6540c        	ld	a,(21516,x)
2479  001f 90da0000      	or	a,(_bLF_DEF,y)
2480  0023 d7540c        	ld	(21516,x),a
2483  0026 0c02          	inc	(OFST+0,sp)
2487  0028 27dc          	jreq	L316
2491  002a 85            	popw	x
2492  002b 81            	ret	
2536                     ; 443 LCD_DISP_FUNC(lcd_disp_setup_link, 6, _link)
2537                     .text:	section	.text,new
2538  0000               _lcd_disp_setup_link:
2540  0000 89            	pushw	x
2541       00000002      OFST:	set	2
2546  0001 cd0000        	call	_lcd_clear_n
2549  0004 4f            	clr	a
2550  0005 6b02          	ld	(OFST+0,sp),a
2552  0007               L736:
2555  0007 5f            	clrw	x
2556  0008 97            	ld	xl,a
2557  0009 d60229        	ld	a,(__link,x)
2558  000c 6b01          	ld	(OFST-1,sp),a
2562  000e 5f            	clrw	x
2563  000f 97            	ld	xl,a
2564  0010 d60040        	ld	a,(_iLF_DEF,x)
2565  0013 5f            	clrw	x
2566  0014 97            	ld	xl,a
2567  0015 7b01          	ld	a,(OFST-1,sp)
2568  0017 905f          	clrw	y
2569  0019 9097          	ld	yl,a
2570  001b d6540c        	ld	a,(21516,x)
2571  001e 90da0000      	or	a,(_bLF_DEF,y)
2572  0022 d7540c        	ld	(21516,x),a
2575  0025 0c02          	inc	(OFST+0,sp)
2579  0027 7b02          	ld	a,(OFST+0,sp)
2580  0029 a106          	cp	a,#6
2581  002b 25da          	jrult	L736
2585  002d 85            	popw	x
2586  002e 81            	ret	
2629                     ; 445 LCD_DISP_FUNC(lcd_disp_setup_run, 8, _run)
2630                     .text:	section	.text,new
2631  0000               _lcd_disp_setup_run:
2633  0000 89            	pushw	x
2634       00000002      OFST:	set	2
2639  0001 cd0000        	call	_lcd_clear_n
2642  0004 4f            	clr	a
2643  0005 6b02          	ld	(OFST+0,sp),a
2645  0007               L366:
2648  0007 5f            	clrw	x
2649  0008 97            	ld	xl,a
2650  0009 d60219        	ld	a,(__run,x)
2651  000c 6b01          	ld	(OFST-1,sp),a
2655  000e 5f            	clrw	x
2656  000f 97            	ld	xl,a
2657  0010 d60040        	ld	a,(_iLF_DEF,x)
2658  0013 5f            	clrw	x
2659  0014 97            	ld	xl,a
2660  0015 7b01          	ld	a,(OFST-1,sp)
2661  0017 905f          	clrw	y
2662  0019 9097          	ld	yl,a
2663  001b d6540c        	ld	a,(21516,x)
2664  001e 90da0000      	or	a,(_bLF_DEF,y)
2665  0022 d7540c        	ld	(21516,x),a
2668  0025 0c02          	inc	(OFST+0,sp)
2672  0027 7b02          	ld	a,(OFST+0,sp)
2673  0029 a108          	cp	a,#8
2674  002b 25da          	jrult	L366
2678  002d 85            	popw	x
2679  002e 81            	ret	
2722                     ; 447 LCD_DISP_FUNC_1(lcd_disp_setup_mode_local, 7, _hcLocal)
2723                     .text:	section	.text,new
2724  0000               _lcd_disp_setup_mode_local:
2726  0000 89            	pushw	x
2727       00000002      OFST:	set	2
2730  0001 4f            	clr	a
2731  0002 6b02          	ld	(OFST+0,sp),a
2733  0004               L707:
2736  0004 5f            	clrw	x
2737  0005 97            	ld	xl,a
2738  0006 d60207        	ld	a,(__hcLocal,x)
2739  0009 6b01          	ld	(OFST-1,sp),a
2743  000b 5f            	clrw	x
2744  000c 97            	ld	xl,a
2745  000d d60040        	ld	a,(_iLF_DEF,x)
2746  0010 5f            	clrw	x
2747  0011 97            	ld	xl,a
2748  0012 7b01          	ld	a,(OFST-1,sp)
2749  0014 905f          	clrw	y
2750  0016 9097          	ld	yl,a
2751  0018 d6540c        	ld	a,(21516,x)
2752  001b 90da0000      	or	a,(_bLF_DEF,y)
2753  001f d7540c        	ld	(21516,x),a
2756  0022 0c02          	inc	(OFST+0,sp)
2760  0024 7b02          	ld	a,(OFST+0,sp)
2761  0026 a107          	cp	a,#7
2762  0028 25da          	jrult	L707
2766  002a 85            	popw	x
2767  002b 81            	ret	
2810                     ; 448 LCD_DISP_FUNC_1(lcd_disp_setup_mode_each, 11, _hcEach)
2811                     .text:	section	.text,new
2812  0000               _lcd_disp_setup_mode_each:
2814  0000 89            	pushw	x
2815       00000002      OFST:	set	2
2818  0001 4f            	clr	a
2819  0002 6b02          	ld	(OFST+0,sp),a
2821  0004               L337:
2824  0004 5f            	clrw	x
2825  0005 97            	ld	xl,a
2826  0006 d6020e        	ld	a,(__hcEach,x)
2827  0009 6b01          	ld	(OFST-1,sp),a
2831  000b 5f            	clrw	x
2832  000c 97            	ld	xl,a
2833  000d d60040        	ld	a,(_iLF_DEF,x)
2834  0010 5f            	clrw	x
2835  0011 97            	ld	xl,a
2836  0012 7b01          	ld	a,(OFST-1,sp)
2837  0014 905f          	clrw	y
2838  0016 9097          	ld	yl,a
2839  0018 d6540c        	ld	a,(21516,x)
2840  001b 90da0000      	or	a,(_bLF_DEF,y)
2841  001f d7540c        	ld	(21516,x),a
2844  0022 0c02          	inc	(OFST+0,sp)
2848  0024 7b02          	ld	a,(OFST+0,sp)
2849  0026 a10b          	cp	a,#11
2850  0028 25da          	jrult	L337
2854  002a 85            	popw	x
2855  002b 81            	ret	
2899                     ; 449 LCD_DISP_FUNC(lcd_disp_setup_mode, 8, _hc)
2900                     .text:	section	.text,new
2901  0000               _lcd_disp_setup_mode:
2903  0000 89            	pushw	x
2904       00000002      OFST:	set	2
2909  0001 cd0000        	call	_lcd_clear_n
2912  0004 4f            	clr	a
2913  0005 6b02          	ld	(OFST+0,sp),a
2915  0007               L757:
2918  0007 5f            	clrw	x
2919  0008 97            	ld	xl,a
2920  0009 d60221        	ld	a,(__hc,x)
2921  000c 6b01          	ld	(OFST-1,sp),a
2925  000e 5f            	clrw	x
2926  000f 97            	ld	xl,a
2927  0010 d60040        	ld	a,(_iLF_DEF,x)
2928  0013 5f            	clrw	x
2929  0014 97            	ld	xl,a
2930  0015 7b01          	ld	a,(OFST-1,sp)
2931  0017 905f          	clrw	y
2932  0019 9097          	ld	yl,a
2933  001b d6540c        	ld	a,(21516,x)
2934  001e 90da0000      	or	a,(_bLF_DEF,y)
2935  0022 d7540c        	ld	(21516,x),a
2938  0025 0c02          	inc	(OFST+0,sp)
2942  0027 7b02          	ld	a,(OFST+0,sp)
2943  0029 a108          	cp	a,#8
2944  002b 25da          	jrult	L757
2948  002d 85            	popw	x
2949  002e 81            	ret	
2992                     ; 451 LCD_DISP_FUNC(lcd_disp_setup_id, 6, _nid)
2993                     .text:	section	.text,new
2994  0000               _lcd_disp_setup_id:
2996  0000 89            	pushw	x
2997       00000002      OFST:	set	2
3002  0001 cd0000        	call	_lcd_clear_n
3005  0004 4f            	clr	a
3006  0005 6b02          	ld	(OFST+0,sp),a
3008  0007               L3001:
3011  0007 5f            	clrw	x
3012  0008 97            	ld	xl,a
3013  0009 d601d1        	ld	a,(__nid,x)
3014  000c 6b01          	ld	(OFST-1,sp),a
3018  000e 5f            	clrw	x
3019  000f 97            	ld	xl,a
3020  0010 d60040        	ld	a,(_iLF_DEF,x)
3021  0013 5f            	clrw	x
3022  0014 97            	ld	xl,a
3023  0015 7b01          	ld	a,(OFST-1,sp)
3024  0017 905f          	clrw	y
3025  0019 9097          	ld	yl,a
3026  001b d6540c        	ld	a,(21516,x)
3027  001e 90da0000      	or	a,(_bLF_DEF,y)
3028  0022 d7540c        	ld	(21516,x),a
3031  0025 0c02          	inc	(OFST+0,sp)
3035  0027 7b02          	ld	a,(OFST+0,sp)
3036  0029 a106          	cp	a,#6
3037  002b 25da          	jrult	L3001
3041  002d 85            	popw	x
3042  002e 81            	ret	
3085                     ; 452 LCD_DISP_FUNC(lcd_disp_setup_m, 3, _nm)
3086                     .text:	section	.text,new
3087  0000               _lcd_disp_setup_m:
3089  0000 89            	pushw	x
3090       00000002      OFST:	set	2
3095  0001 cd0000        	call	_lcd_clear_n
3098  0004 4f            	clr	a
3099  0005 6b02          	ld	(OFST+0,sp),a
3101  0007               L7201:
3104  0007 5f            	clrw	x
3105  0008 97            	ld	xl,a
3106  0009 d601a6        	ld	a,(__nm,x)
3107  000c 6b01          	ld	(OFST-1,sp),a
3111  000e 5f            	clrw	x
3112  000f 97            	ld	xl,a
3113  0010 d60040        	ld	a,(_iLF_DEF,x)
3114  0013 5f            	clrw	x
3115  0014 97            	ld	xl,a
3116  0015 7b01          	ld	a,(OFST-1,sp)
3117  0017 905f          	clrw	y
3118  0019 9097          	ld	yl,a
3119  001b d6540c        	ld	a,(21516,x)
3120  001e 90da0000      	or	a,(_bLF_DEF,y)
3121  0022 d7540c        	ld	(21516,x),a
3124  0025 0c02          	inc	(OFST+0,sp)
3128  0027 7b02          	ld	a,(OFST+0,sp)
3129  0029 a103          	cp	a,#3
3130  002b 25da          	jrult	L7201
3134  002d 85            	popw	x
3135  002e 81            	ret	
3178                     ; 453 LCD_DISP_FUNC(lcd_disp_setup_cnt, 6, _ncnt)
3179                     .text:	section	.text,new
3180  0000               _lcd_disp_setup_cnt:
3182  0000 89            	pushw	x
3183       00000002      OFST:	set	2
3188  0001 cd0000        	call	_lcd_clear_n
3191  0004 4f            	clr	a
3192  0005 6b02          	ld	(OFST+0,sp),a
3194  0007               L3501:
3197  0007 5f            	clrw	x
3198  0008 97            	ld	xl,a
3199  0009 d601a9        	ld	a,(__ncnt,x)
3200  000c 6b01          	ld	(OFST-1,sp),a
3204  000e 5f            	clrw	x
3205  000f 97            	ld	xl,a
3206  0010 d60040        	ld	a,(_iLF_DEF,x)
3207  0013 5f            	clrw	x
3208  0014 97            	ld	xl,a
3209  0015 7b01          	ld	a,(OFST-1,sp)
3210  0017 905f          	clrw	y
3211  0019 9097          	ld	yl,a
3212  001b d6540c        	ld	a,(21516,x)
3213  001e 90da0000      	or	a,(_bLF_DEF,y)
3214  0022 d7540c        	ld	(21516,x),a
3217  0025 0c02          	inc	(OFST+0,sp)
3221  0027 7b02          	ld	a,(OFST+0,sp)
3222  0029 a106          	cp	a,#6
3223  002b 25da          	jrult	L3501
3227  002d 85            	popw	x
3228  002e 81            	ret	
3272                     ; 454 LCD_DISP_FUNC(lcd_disp_setup_valve, 6, _nvalve)
3273                     .text:	section	.text,new
3274  0000               _lcd_disp_setup_valve:
3276  0000 89            	pushw	x
3277       00000002      OFST:	set	2
3282  0001 cd0000        	call	_lcd_clear_n
3285  0004 4f            	clr	a
3286  0005 6b02          	ld	(OFST+0,sp),a
3288  0007               L7701:
3291  0007 5f            	clrw	x
3292  0008 97            	ld	xl,a
3293  0009 d601af        	ld	a,(__nvalve,x)
3294  000c 6b01          	ld	(OFST-1,sp),a
3298  000e 5f            	clrw	x
3299  000f 97            	ld	xl,a
3300  0010 d60040        	ld	a,(_iLF_DEF,x)
3301  0013 5f            	clrw	x
3302  0014 97            	ld	xl,a
3303  0015 7b01          	ld	a,(OFST-1,sp)
3304  0017 905f          	clrw	y
3305  0019 9097          	ld	yl,a
3306  001b d6540c        	ld	a,(21516,x)
3307  001e 90da0000      	or	a,(_bLF_DEF,y)
3308  0022 d7540c        	ld	(21516,x),a
3311  0025 0c02          	inc	(OFST+0,sp)
3315  0027 7b02          	ld	a,(OFST+0,sp)
3316  0029 a106          	cp	a,#6
3317  002b 25da          	jrult	L7701
3321  002d 85            	popw	x
3322  002e 81            	ret	
3365                     ; 456 LCD_CLEAR_FUNC(lcd_clear_backlight, 8, _bL)
3366                     .text:	section	.text,new
3367  0000               _lcd_clear_backlight:
3369  0000 89            	pushw	x
3370       00000002      OFST:	set	2
3373  0001 4f            	clr	a
3374  0002 6b02          	ld	(OFST+0,sp),a
3376  0004               L3211:
3379  0004 5f            	clrw	x
3380  0005 97            	ld	xl,a
3381  0006 d601e8        	ld	a,(__bL,x)
3382  0009 6b01          	ld	(OFST-1,sp),a
3386  000b 5f            	clrw	x
3387  000c 97            	ld	xl,a
3388  000d d60040        	ld	a,(_iLF_DEF,x)
3389  0010 5f            	clrw	x
3390  0011 97            	ld	xl,a
3391  0012 7b01          	ld	a,(OFST-1,sp)
3392  0014 905f          	clrw	y
3393  0016 9097          	ld	yl,a
3394  0018 90d60000      	ld	a,(_bLF_DEF,y)
3395  001c 43            	cpl	a
3396  001d d4540c        	and	a,(21516,x)
3397  0020 d7540c        	ld	(21516,x),a
3400  0023 0c02          	inc	(OFST+0,sp)
3404  0025 7b02          	ld	a,(OFST+0,sp)
3405  0027 a108          	cp	a,#8
3406  0029 25d9          	jrult	L3211
3410  002b 85            	popw	x
3411  002c 81            	ret	
3453                     ; 457 LCD_CLEAR_FUNC(lcd_clear_c, 4, _cc)
3454                     .text:	section	.text,new
3455  0000               _lcd_clear_c:
3457  0000 89            	pushw	x
3458       00000002      OFST:	set	2
3461  0001 4f            	clr	a
3462  0002 6b02          	ld	(OFST+0,sp),a
3464  0004               L7411:
3467  0004 5f            	clrw	x
3468  0005 97            	ld	xl,a
3469  0006 d601f5        	ld	a,(__cc,x)
3470  0009 6b01          	ld	(OFST-1,sp),a
3474  000b 5f            	clrw	x
3475  000c 97            	ld	xl,a
3476  000d d60040        	ld	a,(_iLF_DEF,x)
3477  0010 5f            	clrw	x
3478  0011 97            	ld	xl,a
3479  0012 7b01          	ld	a,(OFST-1,sp)
3480  0014 905f          	clrw	y
3481  0016 9097          	ld	yl,a
3482  0018 90d60000      	ld	a,(_bLF_DEF,y)
3483  001c 43            	cpl	a
3484  001d d4540c        	and	a,(21516,x)
3485  0020 d7540c        	ld	(21516,x),a
3488  0023 0c02          	inc	(OFST+0,sp)
3492  0025 7b02          	ld	a,(OFST+0,sp)
3493  0027 a104          	cp	a,#4
3494  0029 25d9          	jrult	L7411
3498  002b 85            	popw	x
3499  002c 81            	ret	
3541                     ; 461 LCD_CLEAR_FUNC(lcd_clear_btn, 5, _btn)
3542                     .text:	section	.text,new
3543  0000               _lcd_clear_btn:
3545  0000 89            	pushw	x
3546       00000002      OFST:	set	2
3549  0001 4f            	clr	a
3550  0002 6b02          	ld	(OFST+0,sp),a
3552  0004               L3711:
3555  0004 5f            	clrw	x
3556  0005 97            	ld	xl,a
3557  0006 d601f0        	ld	a,(__btn,x)
3558  0009 6b01          	ld	(OFST-1,sp),a
3562  000b 5f            	clrw	x
3563  000c 97            	ld	xl,a
3564  000d d60040        	ld	a,(_iLF_DEF,x)
3565  0010 5f            	clrw	x
3566  0011 97            	ld	xl,a
3567  0012 7b01          	ld	a,(OFST-1,sp)
3568  0014 905f          	clrw	y
3569  0016 9097          	ld	yl,a
3570  0018 90d60000      	ld	a,(_bLF_DEF,y)
3571  001c 43            	cpl	a
3572  001d d4540c        	and	a,(21516,x)
3573  0020 d7540c        	ld	(21516,x),a
3576  0023 0c02          	inc	(OFST+0,sp)
3580  0025 7b02          	ld	a,(OFST+0,sp)
3581  0027 a105          	cp	a,#5
3582  0029 25d9          	jrult	L3711
3586  002b 85            	popw	x
3587  002c 81            	ret	
3629                     ; 463 LCD_CLEAR_FUNC(lcd_clear_run, 8, _run)
3630                     .text:	section	.text,new
3631  0000               _lcd_clear_run:
3633  0000 89            	pushw	x
3634       00000002      OFST:	set	2
3637  0001 4f            	clr	a
3638  0002 6b02          	ld	(OFST+0,sp),a
3640  0004               L7121:
3643  0004 5f            	clrw	x
3644  0005 97            	ld	xl,a
3645  0006 d60219        	ld	a,(__run,x)
3646  0009 6b01          	ld	(OFST-1,sp),a
3650  000b 5f            	clrw	x
3651  000c 97            	ld	xl,a
3652  000d d60040        	ld	a,(_iLF_DEF,x)
3653  0010 5f            	clrw	x
3654  0011 97            	ld	xl,a
3655  0012 7b01          	ld	a,(OFST-1,sp)
3656  0014 905f          	clrw	y
3657  0016 9097          	ld	yl,a
3658  0018 90d60000      	ld	a,(_bLF_DEF,y)
3659  001c 43            	cpl	a
3660  001d d4540c        	and	a,(21516,x)
3661  0020 d7540c        	ld	(21516,x),a
3664  0023 0c02          	inc	(OFST+0,sp)
3668  0025 7b02          	ld	a,(OFST+0,sp)
3669  0027 a108          	cp	a,#8
3670  0029 25d9          	jrult	L7121
3674  002b 85            	popw	x
3675  002c 81            	ret	
3717                     ; 464 LCD_CLEAR_FUNC(lcd_clear_mode, 8, _hc)
3718                     .text:	section	.text,new
3719  0000               _lcd_clear_mode:
3721  0000 89            	pushw	x
3722       00000002      OFST:	set	2
3725  0001 4f            	clr	a
3726  0002 6b02          	ld	(OFST+0,sp),a
3728  0004               L3421:
3731  0004 5f            	clrw	x
3732  0005 97            	ld	xl,a
3733  0006 d60221        	ld	a,(__hc,x)
3734  0009 6b01          	ld	(OFST-1,sp),a
3738  000b 5f            	clrw	x
3739  000c 97            	ld	xl,a
3740  000d d60040        	ld	a,(_iLF_DEF,x)
3741  0010 5f            	clrw	x
3742  0011 97            	ld	xl,a
3743  0012 7b01          	ld	a,(OFST-1,sp)
3744  0014 905f          	clrw	y
3745  0016 9097          	ld	yl,a
3746  0018 90d60000      	ld	a,(_bLF_DEF,y)
3747  001c 43            	cpl	a
3748  001d d4540c        	and	a,(21516,x)
3749  0020 d7540c        	ld	(21516,x),a
3752  0023 0c02          	inc	(OFST+0,sp)
3756  0025 7b02          	ld	a,(OFST+0,sp)
3757  0027 a108          	cp	a,#8
3758  0029 25d9          	jrult	L3421
3762  002b 85            	popw	x
3763  002c 81            	ret	
3805                     ; 466 LCD_CLEAR_FUNC(lcd_clear_info, 3, _info)
3806                     .text:	section	.text,new
3807  0000               _lcd_clear_info:
3809  0000 89            	pushw	x
3810       00000002      OFST:	set	2
3813  0001 4f            	clr	a
3814  0002 6b02          	ld	(OFST+0,sp),a
3816  0004               L7621:
3819  0004 5f            	clrw	x
3820  0005 97            	ld	xl,a
3821  0006 d601d7        	ld	a,(__info,x)
3822  0009 6b01          	ld	(OFST-1,sp),a
3826  000b 5f            	clrw	x
3827  000c 97            	ld	xl,a
3828  000d d60040        	ld	a,(_iLF_DEF,x)
3829  0010 5f            	clrw	x
3830  0011 97            	ld	xl,a
3831  0012 7b01          	ld	a,(OFST-1,sp)
3832  0014 905f          	clrw	y
3833  0016 9097          	ld	yl,a
3834  0018 90d60000      	ld	a,(_bLF_DEF,y)
3835  001c 43            	cpl	a
3836  001d d4540c        	and	a,(21516,x)
3837  0020 d7540c        	ld	(21516,x),a
3840  0023 0c02          	inc	(OFST+0,sp)
3844  0025 7b02          	ld	a,(OFST+0,sp)
3845  0027 a103          	cp	a,#3
3846  0029 25d9          	jrult	L7621
3850  002b 85            	popw	x
3851  002c 81            	ret	
3893                     ; 468 LCD_CLEAR_FUNC(lcd_clear_rid, 14, _rid)
3894                     .text:	section	.text,new
3895  0000               _lcd_clear_rid:
3897  0000 89            	pushw	x
3898       00000002      OFST:	set	2
3901  0001 4f            	clr	a
3902  0002 6b02          	ld	(OFST+0,sp),a
3904  0004               L3131:
3907  0004 5f            	clrw	x
3908  0005 97            	ld	xl,a
3909  0006 d601da        	ld	a,(__rid,x)
3910  0009 6b01          	ld	(OFST-1,sp),a
3914  000b 5f            	clrw	x
3915  000c 97            	ld	xl,a
3916  000d d60040        	ld	a,(_iLF_DEF,x)
3917  0010 5f            	clrw	x
3918  0011 97            	ld	xl,a
3919  0012 7b01          	ld	a,(OFST-1,sp)
3920  0014 905f          	clrw	y
3921  0016 9097          	ld	yl,a
3922  0018 90d60000      	ld	a,(_bLF_DEF,y)
3923  001c 43            	cpl	a
3924  001d d4540c        	and	a,(21516,x)
3925  0020 d7540c        	ld	(21516,x),a
3928  0023 0c02          	inc	(OFST+0,sp)
3932  0025 7b02          	ld	a,(OFST+0,sp)
3933  0027 a10e          	cp	a,#14
3934  0029 25d9          	jrult	L3131
3938  002b 85            	popw	x
3939  002c 81            	ret	
3981                     ; 469 LCD_CLEAR_FUNC(lcd_clear_n, 28, _n)
3982                     .text:	section	.text,new
3983  0000               _lcd_clear_n:
3985  0000 89            	pushw	x
3986       00000002      OFST:	set	2
3989  0001 4f            	clr	a
3990  0002 6b02          	ld	(OFST+0,sp),a
3992  0004               L7331:
3995  0004 5f            	clrw	x
3996  0005 97            	ld	xl,a
3997  0006 d601b5        	ld	a,(__n,x)
3998  0009 6b01          	ld	(OFST-1,sp),a
4002  000b 5f            	clrw	x
4003  000c 97            	ld	xl,a
4004  000d d60040        	ld	a,(_iLF_DEF,x)
4005  0010 5f            	clrw	x
4006  0011 97            	ld	xl,a
4007  0012 7b01          	ld	a,(OFST-1,sp)
4008  0014 905f          	clrw	y
4009  0016 9097          	ld	yl,a
4010  0018 90d60000      	ld	a,(_bLF_DEF,y)
4011  001c 43            	cpl	a
4012  001d d4540c        	and	a,(21516,x)
4013  0020 d7540c        	ld	(21516,x),a
4016  0023 0c02          	inc	(OFST+0,sp)
4020  0025 7b02          	ld	a,(OFST+0,sp)
4021  0027 a11c          	cp	a,#28
4022  0029 25d9          	jrult	L7331
4026  002b 85            	popw	x
4027  002c 81            	ret	
4069                     ; 480 LCD_CLEAR_FUNC(lcd_clear_m, 3, _nm)
4070                     .text:	section	.text,new
4071  0000               _lcd_clear_m:
4073  0000 89            	pushw	x
4074       00000002      OFST:	set	2
4077  0001 4f            	clr	a
4078  0002 6b02          	ld	(OFST+0,sp),a
4080  0004               L3631:
4083  0004 5f            	clrw	x
4084  0005 97            	ld	xl,a
4085  0006 d601a6        	ld	a,(__nm,x)
4086  0009 6b01          	ld	(OFST-1,sp),a
4090  000b 5f            	clrw	x
4091  000c 97            	ld	xl,a
4092  000d d60040        	ld	a,(_iLF_DEF,x)
4093  0010 5f            	clrw	x
4094  0011 97            	ld	xl,a
4095  0012 7b01          	ld	a,(OFST-1,sp)
4096  0014 905f          	clrw	y
4097  0016 9097          	ld	yl,a
4098  0018 90d60000      	ld	a,(_bLF_DEF,y)
4099  001c 43            	cpl	a
4100  001d d4540c        	and	a,(21516,x)
4101  0020 d7540c        	ld	(21516,x),a
4104  0023 0c02          	inc	(OFST+0,sp)
4108  0025 7b02          	ld	a,(OFST+0,sp)
4109  0027 a103          	cp	a,#3
4110  0029 25d9          	jrult	L3631
4114  002b 85            	popw	x
4115  002c 81            	ret	
4157                     ; 481 LCD_CLEAR_FUNC(lcd_clear_cnt, 6, _ncnt)
4158                     .text:	section	.text,new
4159  0000               _lcd_clear_cnt:
4161  0000 89            	pushw	x
4162       00000002      OFST:	set	2
4165  0001 4f            	clr	a
4166  0002 6b02          	ld	(OFST+0,sp),a
4168  0004               L7041:
4171  0004 5f            	clrw	x
4172  0005 97            	ld	xl,a
4173  0006 d601a9        	ld	a,(__ncnt,x)
4174  0009 6b01          	ld	(OFST-1,sp),a
4178  000b 5f            	clrw	x
4179  000c 97            	ld	xl,a
4180  000d d60040        	ld	a,(_iLF_DEF,x)
4181  0010 5f            	clrw	x
4182  0011 97            	ld	xl,a
4183  0012 7b01          	ld	a,(OFST-1,sp)
4184  0014 905f          	clrw	y
4185  0016 9097          	ld	yl,a
4186  0018 90d60000      	ld	a,(_bLF_DEF,y)
4187  001c 43            	cpl	a
4188  001d d4540c        	and	a,(21516,x)
4189  0020 d7540c        	ld	(21516,x),a
4192  0023 0c02          	inc	(OFST+0,sp)
4196  0025 7b02          	ld	a,(OFST+0,sp)
4197  0027 a106          	cp	a,#6
4198  0029 25d9          	jrult	L7041
4202  002b 85            	popw	x
4203  002c 81            	ret	
4252                     ; 483 void	lcd_clear_npos(uint8_t pos, uint8_t type)
4252                     ; 484 {
4253                     .text:	section	.text,new
4254  0000               _lcd_clear_npos:
4256  0000 89            	pushw	x
4257  0001 89            	pushw	x
4258       00000002      OFST:	set	2
4261                     ; 486 	pos = pos*7;
4263  0002 ae0007        	ldw	x,#7
4264  0005 7b03          	ld	a,(OFST+1,sp)
4265  0007 42            	mul	x,a
4266  0008 9f            	ld	a,xl
4267  0009 6b03          	ld	(OFST+1,sp),a
4268                     ; 487 	for( i=0; i<7; i++ )
4270  000b 0f01          	clr	(OFST-1,sp)
4272  000d               L5341:
4273                     ; 489 		j = _n[pos++];
4275  000d 7b03          	ld	a,(OFST+1,sp)
4276  000f 0c03          	inc	(OFST+1,sp)
4277  0011 5f            	clrw	x
4278  0012 97            	ld	xl,a
4279  0013 d601b5        	ld	a,(__n,x)
4280  0016 6b02          	ld	(OFST+0,sp),a
4282                     ; 490 		LCD_BIT_CLEAR(j);
4284  0018 5f            	clrw	x
4285  0019 97            	ld	xl,a
4286  001a d60040        	ld	a,(_iLF_DEF,x)
4287  001d 5f            	clrw	x
4288  001e 97            	ld	xl,a
4289  001f 7b02          	ld	a,(OFST+0,sp)
4290  0021 905f          	clrw	y
4291  0023 9097          	ld	yl,a
4292  0025 90d60000      	ld	a,(_bLF_DEF,y)
4293  0029 43            	cpl	a
4294  002a d4540c        	and	a,(21516,x)
4295  002d d7540c        	ld	(21516,x),a
4296                     ; 487 	for( i=0; i<7; i++ )
4298  0030 0c01          	inc	(OFST-1,sp)
4302  0032 7b01          	ld	a,(OFST-1,sp)
4303  0034 a107          	cp	a,#7
4304  0036 25d5          	jrult	L5341
4305                     ; 492 }
4308  0038 5b04          	addw	sp,#4
4309  003a 81            	ret	
4341                     ; 494 void	lcd_disp_all(void)
4341                     ; 495 {
4342                     .text:	section	.text,new
4343  0000               _lcd_disp_all:
4345  0000 88            	push	a
4346       00000001      OFST:	set	1
4349                     ; 497 	for( i=0; i<15; i++ )
4351  0001 4f            	clr	a
4352  0002 6b01          	ld	(OFST+0,sp),a
4354  0004               L7541:
4355                     ; 498 		LCD->RAM[i] = 0xff;
4357  0004 5f            	clrw	x
4358  0005 97            	ld	xl,a
4359  0006 a6ff          	ld	a,#255
4360  0008 d7540c        	ld	(21516,x),a
4361                     ; 497 	for( i=0; i<15; i++ )
4363  000b 0c01          	inc	(OFST+0,sp)
4367  000d 7b01          	ld	a,(OFST+0,sp)
4368  000f a10f          	cp	a,#15
4369  0011 25f1          	jrult	L7541
4370                     ; 499 }
4373  0013 84            	pop	a
4374  0014 81            	ret	
4413                     ; 501 void	lcd_clear(uint8_t type)
4413                     ; 502 {
4414                     .text:	section	.text,new
4415  0000               _lcd_clear:
4417  0000 88            	push	a
4418       00000001      OFST:	set	1
4421                     ; 504 	for( i=0; i<15; i++ )
4423  0001 4f            	clr	a
4424  0002 6b01          	ld	(OFST+0,sp),a
4426  0004               L3051:
4427                     ; 505 		LCD->RAM[i] = 0;
4429  0004 5f            	clrw	x
4430  0005 97            	ld	xl,a
4431  0006 724f540c      	clr	(21516,x)
4432                     ; 504 	for( i=0; i<15; i++ )
4434  000a 0c01          	inc	(OFST+0,sp)
4438  000c 7b01          	ld	a,(OFST+0,sp)
4439  000e a10f          	cp	a,#15
4440  0010 25f2          	jrult	L3051
4441                     ; 509 }
4444  0012 84            	pop	a
4445  0013 81            	ret	
4492                     ; 511 uint8_t	*lcd_get_npos(uint8_t i)
4492                     ; 512 {
4493                     .text:	section	.text,new
4494  0000               _lcd_get_npos:
4496  0000 89            	pushw	x
4497       00000002      OFST:	set	2
4500                     ; 514 	switch( i )
4503                     ; 527 	case 3:	p = _nd;	break;
4504  0001 4d            	tnz	a
4505  0002 270d          	jreq	L1151
4506  0004 4a            	dec	a
4507  0005 270f          	jreq	L3151
4508  0007 4a            	dec	a
4509  0008 2711          	jreq	L5151
4510  000a 4a            	dec	a
4511  000b 2713          	jreq	L7151
4512  000d 1e01          	ldw	x,(OFST-1,sp)
4513  000f 2012          	jra	LC001
4514  0011               L1151:
4515                     ; 524 	case 0:	p = _na;	break;
4517  0011 ae0080        	ldw	x,#__na
4520  0014 200d          	jp	LC001
4521  0016               L3151:
4522                     ; 525 	case 1:	p = _nb;	break;
4524  0016 ae00c6        	ldw	x,#__nb
4527  0019 2008          	jp	LC001
4528  001b               L5151:
4529                     ; 526 	case 2:	p = _nc;	break;
4531  001b ae010c        	ldw	x,#__nc
4534  001e 2003          	jp	LC001
4535  0020               L7151:
4536                     ; 527 	case 3:	p = _nd;	break;
4538  0020 ae0152        	ldw	x,#__nd
4539  0023               LC001:
4543                     ; 530 	return p;
4547  0023 5b02          	addw	sp,#2
4548  0025 81            	ret	
4615                     ; 533 void	lcd_disp_n(uint8_t pos, uint8_t n)
4615                     ; 534 {
4616                     .text:	section	.text,new
4617  0000               _lcd_disp_n:
4619  0000 89            	pushw	x
4620  0001 5204          	subw	sp,#4
4621       00000004      OFST:	set	4
4624                     ; 538 	lcd_clear_npos(pos, 0);
4626  0003 9e            	ld	a,xh
4627  0004 5f            	clrw	x
4628  0005 95            	ld	xh,a
4629  0006 cd0000        	call	_lcd_clear_npos
4631                     ; 539 	p = lcd_get_npos(pos);
4633  0009 7b05          	ld	a,(OFST+1,sp)
4634  000b cd0000        	call	_lcd_get_npos
4636  000e 1f02          	ldw	(OFST-2,sp),x
4638                     ; 540 	p = p+n*7;
4640  0010 7b06          	ld	a,(OFST+2,sp)
4641  0012 97            	ld	xl,a
4642  0013 a607          	ld	a,#7
4643  0015 42            	mul	x,a
4644  0016 72fb02        	addw	x,(OFST-2,sp)
4645  0019 1f02          	ldw	(OFST-2,sp),x
4647                     ; 541 	for( i=0; i<7; i++ )
4649  001b 0f04          	clr	(OFST+0,sp)
4651  001d               L3751:
4652                     ; 543 		if( p[i] != 0 )
4654  001d 7b02          	ld	a,(OFST-2,sp)
4655  001f 97            	ld	xl,a
4656  0020 7b03          	ld	a,(OFST-1,sp)
4657  0022 1b04          	add	a,(OFST+0,sp)
4658  0024 2401          	jrnc	L471
4659  0026 5c            	incw	x
4660  0027               L471:
4661  0027 02            	rlwa	x,a
4662  0028 f6            	ld	a,(x)
4663  0029 2725          	jreq	L1061
4664                     ; 545 			j = p[i];
4666  002b 7b02          	ld	a,(OFST-2,sp)
4667  002d 97            	ld	xl,a
4668  002e 7b03          	ld	a,(OFST-1,sp)
4669  0030 1b04          	add	a,(OFST+0,sp)
4670  0032 2401          	jrnc	L671
4671  0034 5c            	incw	x
4672  0035               L671:
4673  0035 02            	rlwa	x,a
4674  0036 f6            	ld	a,(x)
4675  0037 6b01          	ld	(OFST-3,sp),a
4677                     ; 546 			LCD_BIT_SET(j);
4679  0039 5f            	clrw	x
4680  003a 97            	ld	xl,a
4681  003b d60040        	ld	a,(_iLF_DEF,x)
4682  003e 5f            	clrw	x
4683  003f 97            	ld	xl,a
4684  0040 7b01          	ld	a,(OFST-3,sp)
4685  0042 905f          	clrw	y
4686  0044 9097          	ld	yl,a
4687  0046 d6540c        	ld	a,(21516,x)
4688  0049 90da0000      	or	a,(_bLF_DEF,y)
4689  004d d7540c        	ld	(21516,x),a
4690  0050               L1061:
4691                     ; 541 	for( i=0; i<7; i++ )
4693  0050 0c04          	inc	(OFST+0,sp)
4697  0052 7b04          	ld	a,(OFST+0,sp)
4698  0054 a107          	cp	a,#7
4699  0056 25c5          	jrult	L3751
4700                     ; 549 }
4703  0058 5b06          	addw	sp,#6
4704  005a 81            	ret	
4761                     ; 553 void	lcd_disp_err(uint8_t n)
4761                     ; 554 {
4762                     .text:	section	.text,new
4763  0000               _lcd_disp_err:
4765  0000 88            	push	a
4766  0001 5204          	subw	sp,#4
4767       00000004      OFST:	set	4
4770                     ; 557 	LCD_CE;
4772  0003 72165402      	bset	21506,#3
4773                     ; 558 	lcd_clear_n();
4775  0007 cd0000        	call	_lcd_clear_n
4777                     ; 559 	p = error_type==1 ? _nerrBr : _nerr;
4779  000a c60000        	ld	a,_error_type
4780  000d 4a            	dec	a
4781  000e 2605          	jrne	L402
4782  0010 ae019f        	ldw	x,#__nerrBr
4783  0013 2003          	jra	L602
4784  0015               L402:
4785  0015 ae0198        	ldw	x,#__nerr
4786  0018               L602:
4787  0018 1f02          	ldw	(OFST-2,sp),x
4789                     ; 560 	for( i=0; i<7; i++ )
4791  001a 0f04          	clr	(OFST+0,sp)
4793  001c               L7261:
4794                     ; 562 		LCD_BIT_SET(p[i]);
4796  001c 7b02          	ld	a,(OFST-2,sp)
4797  001e 97            	ld	xl,a
4798  001f 7b03          	ld	a,(OFST-1,sp)
4799  0021 1b04          	add	a,(OFST+0,sp)
4800  0023 2401          	jrnc	L012
4801  0025 5c            	incw	x
4802  0026               L012:
4803  0026 02            	rlwa	x,a
4804  0027 f6            	ld	a,(x)
4805  0028 5f            	clrw	x
4806  0029 97            	ld	xl,a
4807  002a d60000        	ld	a,(_bLF_DEF,x)
4808  002d 6b01          	ld	(OFST-3,sp),a
4810  002f 7b02          	ld	a,(OFST-2,sp)
4811  0031 97            	ld	xl,a
4812  0032 7b03          	ld	a,(OFST-1,sp)
4813  0034 1b04          	add	a,(OFST+0,sp)
4814  0036 2401          	jrnc	L212
4815  0038 5c            	incw	x
4816  0039               L212:
4817  0039 02            	rlwa	x,a
4818  003a f6            	ld	a,(x)
4819  003b 5f            	clrw	x
4820  003c 97            	ld	xl,a
4821  003d d60040        	ld	a,(_iLF_DEF,x)
4822  0040 5f            	clrw	x
4823  0041 97            	ld	xl,a
4824  0042 d6540c        	ld	a,(21516,x)
4825  0045 1a01          	or	a,(OFST-3,sp)
4826  0047 d7540c        	ld	(21516,x),a
4827                     ; 560 	for( i=0; i<7; i++ )
4829  004a 0c04          	inc	(OFST+0,sp)
4833  004c 7b04          	ld	a,(OFST+0,sp)
4834  004e a107          	cp	a,#7
4835  0050 25ca          	jrult	L7261
4836                     ; 564 	if( uiInfo.mode == 1 )
4838  0052 c60008        	ld	a,_uiInfo+8
4839  0055 4a            	dec	a
4840  0056 2706          	jreq	L3061
4841                     ; 573 		if( n==30 )
4843  0058 7b05          	ld	a,(OFST+1,sp)
4844  005a a11e          	cp	a,#30
4845  005c 261d          	jrne	L7361
4846                     ; 574 			goto Print;
4847  005e               L3061:
4848                     ; 566 Print:		
4848                     ; 567 //		LCD_BIT_SET(bCOL);
4848                     ; 568 		lcd_disp_n(2, n/10);
4850  005e 7b05          	ld	a,(OFST+1,sp)
4851  0060 5f            	clrw	x
4852  0061 97            	ld	xl,a
4853  0062 a60a          	ld	a,#10
4854  0064 62            	div	x,a
4855  0065 9f            	ld	a,xl
4856  0066 ae0200        	ldw	x,#512
4857  0069 97            	ld	xl,a
4858  006a cd0000        	call	_lcd_disp_n
4860                     ; 569 		lcd_disp_n(3, n%10);
4862  006d 7b05          	ld	a,(OFST+1,sp)
4863  006f 5f            	clrw	x
4864  0070 97            	ld	xl,a
4865  0071 a60a          	ld	a,#10
4866  0073 62            	div	x,a
4867  0074 ae0300        	ldw	x,#768
4868  0077 97            	ld	xl,a
4869  0078 cd0000        	call	_lcd_disp_n
4872  007b               L7361:
4873                     ; 576 }
4876  007b 5b05          	addw	sp,#5
4877  007d 81            	ret	
4934                     ; 578 void	lcd_disp_rid(uint8_t id, uint8_t mode, uint8_t multi)
4934                     ; 579 {
4935                     .text:	section	.text,new
4936  0000               _lcd_disp_rid:
4938  0000 89            	pushw	x
4939  0001 88            	push	a
4940       00000001      OFST:	set	1
4943                     ; 584 	LCD_CE;
4945  0002 72165402      	bset	21506,#3
4946                     ; 585 	if( multi == 0 )
4948  0006 7b06          	ld	a,(OFST+5,sp)
4949  0008 2603          	jrne	L5661
4950                     ; 591 		lcd_clear_rid();
4952  000a cd0000        	call	_lcd_clear_rid
4954  000d               L5661:
4955                     ; 594 	if( id != 0 )
4957  000d 7b02          	ld	a,(OFST+1,sp)
4958  000f 2702          	jreq	L7661
4959                     ; 595 		id -= 1;
4961  0011 0a02          	dec	(OFST+1,sp)
4962  0013               L7661:
4963                     ; 611 	if( mode != 0 )
4965  0013 7b03          	ld	a,(OFST+2,sp)
4966  0015 2712          	jreq	L1761
4967                     ; 613 		j = _rid[id*2+1];
4969  0017 7b02          	ld	a,(OFST+1,sp)
4970  0019 5f            	clrw	x
4971  001a 97            	ld	xl,a
4972  001b 58            	sllw	x
4973  001c d601db        	ld	a,(__rid+1,x)
4974  001f 6b01          	ld	(OFST+0,sp),a
4976                     ; 614 		LCD_BIT_SET(j);
4978  0021 ad39          	call	LC002
4979  0023 7b01          	ld	a,(OFST+0,sp)
4980  0025 ad3d          	call	LC003
4982  0027 201a          	jra	L3761
4983  0029               L1761:
4984                     ; 616 		j = _rid[id*2+1];
4986  0029 7b02          	ld	a,(OFST+1,sp)
4987  002b 5f            	clrw	x
4988  002c 97            	ld	xl,a
4989  002d 58            	sllw	x
4990  002e d601db        	ld	a,(__rid+1,x)
4991  0031 6b01          	ld	(OFST+0,sp),a
4993                     ; 617 		LCD_BIT_CLEAR(j);
4995  0033 ad27          	call	LC002
4996  0035 7b01          	ld	a,(OFST+0,sp)
4997  0037 905f          	clrw	y
4998  0039 9097          	ld	yl,a
4999  003b 90d60000      	ld	a,(_bLF_DEF,y)
5000  003f 43            	cpl	a
5001  0040 d4540c        	and	a,(21516,x)
5002  0043               L3761:
5003  0043 d7540c        	ld	(21516,x),a
5004                     ; 619 	j = _rid[id*2];
5006  0046 7b02          	ld	a,(OFST+1,sp)
5007  0048 5f            	clrw	x
5008  0049 97            	ld	xl,a
5009  004a 58            	sllw	x
5010  004b d601da        	ld	a,(__rid,x)
5011  004e 6b01          	ld	(OFST+0,sp),a
5013                     ; 620 	LCD_BIT_SET(j);
5015  0050 ad0a          	call	LC002
5016  0052 7b01          	ld	a,(OFST+0,sp)
5017  0054 ad0e          	call	LC003
5018  0056 d7540c        	ld	(21516,x),a
5019                     ; 622 }
5022  0059 5b03          	addw	sp,#3
5023  005b 81            	ret	
5024  005c               LC002:
5025  005c 5f            	clrw	x
5026  005d 97            	ld	xl,a
5027  005e d60040        	ld	a,(_iLF_DEF,x)
5028  0061 5f            	clrw	x
5029  0062 97            	ld	xl,a
5030  0063 81            	ret	
5031  0064               LC003:
5032  0064 905f          	clrw	y
5033  0066 9097          	ld	yl,a
5034  0068 d6540c        	ld	a,(21516,x)
5035  006b 90da0000      	or	a,(_bLF_DEF,y)
5036  006f 81            	ret	
5085                     ; 625 void	lcd_clear_rid_n(uint8_t id, uint8_t mode)
5085                     ; 626 {
5086                     .text:	section	.text,new
5087  0000               _lcd_clear_rid_n:
5089  0000 89            	pushw	x
5090  0001 88            	push	a
5091       00000001      OFST:	set	1
5094                     ; 628 	LCD_CE;
5096  0002 72165402      	bset	21506,#3
5097                     ; 630 	if( id != 0 )
5099  0006 9e            	ld	a,xh
5100  0007 4d            	tnz	a
5101  0008 2702          	jreq	L5171
5102                     ; 631 		id -= 1;
5104  000a 0a02          	dec	(OFST+1,sp)
5105  000c               L5171:
5106                     ; 633 	if( mode != 0 )
5108  000c 7b03          	ld	a,(OFST+2,sp)
5109  000e 2715          	jreq	L7171
5110                     ; 635 		j = _rid[id*2+1];
5112  0010 7b02          	ld	a,(OFST+1,sp)
5113  0012 5f            	clrw	x
5114  0013 97            	ld	xl,a
5115  0014 58            	sllw	x
5116  0015 d601db        	ld	a,(__rid+1,x)
5117  0018 6b01          	ld	(OFST+0,sp),a
5119                     ; 636 		LCD_BIT_CLEAR(j);
5121  001a 5f            	clrw	x
5122  001b 97            	ld	xl,a
5123  001c d60040        	ld	a,(_iLF_DEF,x)
5124  001f 5f            	clrw	x
5125  0020 97            	ld	xl,a
5126  0021 7b01          	ld	a,(OFST+0,sp)
5127  0023 ad18          	call	LC004
5128  0025               L7171:
5129                     ; 638 	j = _rid[id*2];
5131  0025 7b02          	ld	a,(OFST+1,sp)
5132  0027 5f            	clrw	x
5133  0028 97            	ld	xl,a
5134  0029 58            	sllw	x
5135  002a d601da        	ld	a,(__rid,x)
5136  002d 6b01          	ld	(OFST+0,sp),a
5138                     ; 639 	LCD_BIT_CLEAR(j);
5140  002f 5f            	clrw	x
5141  0030 97            	ld	xl,a
5142  0031 d60040        	ld	a,(_iLF_DEF,x)
5143  0034 5f            	clrw	x
5144  0035 97            	ld	xl,a
5145  0036 7b01          	ld	a,(OFST+0,sp)
5146  0038 ad03          	call	LC004
5147                     ; 640 }
5150  003a 5b03          	addw	sp,#3
5151  003c 81            	ret	
5152  003d               LC004:
5153  003d 905f          	clrw	y
5154  003f 9097          	ld	yl,a
5155  0041 90d60000      	ld	a,(_bLF_DEF,y)
5156  0045 43            	cpl	a
5157  0046 d4540c        	and	a,(21516,x)
5158  0049 d7540c        	ld	(21516,x),a
5159  004c 81            	ret	
5200                     ; 641 void	lcd_disp_cmd(uint8_t cmd, uint8_t mode, uint8_t multi)
5200                     ; 642 {
5201                     .text:	section	.text,new
5202  0000               _lcd_disp_cmd:
5204  0000 88            	push	a
5205       00000001      OFST:	set	1
5208                     ; 644 	LCD_CE;
5210  0001 72165402      	bset	21506,#3
5211                     ; 654 	LCD_BIT_SET(j);
5213  0005 5f            	clrw	x
5214  0006 97            	ld	xl,a
5215  0007 d60040        	ld	a,(_iLF_DEF,x)
5216  000a 5f            	clrw	x
5217  000b 97            	ld	xl,a
5218  000c 7b01          	ld	a,(OFST+0,sp)
5219  000e 905f          	clrw	y
5220  0010 9097          	ld	yl,a
5221  0012 d6540c        	ld	a,(21516,x)
5222  0015 90da0000      	or	a,(_bLF_DEF,y)
5223  0019 d7540c        	ld	(21516,x),a
5224                     ; 655 }
5227  001c 84            	pop	a
5228  001d 81            	ret	
5263                     ; 657 void	lcd_disp_info_fire(uint8_t mode)
5263                     ; 658 {
5264                     .text:	section	.text,new
5265  0000               _lcd_disp_info_fire:
5269                     ; 659 	if( mode == 0 )
5271  0000 4d            	tnz	a
5272  0001 2605          	jrne	L3571
5273                     ; 660 		LCD_BIT_CLEAR(_info[0]);
5275  0003 72195411      	bres	21521,#4
5278  0007 81            	ret	
5279  0008               L3571:
5280                     ; 662 		LCD_BIT_SET(_info[0]);
5282  0008 72185411      	bset	21521,#4
5283                     ; 663 }
5286  000c 81            	ret	
5322                     ; 665 void	lcd_disp_info_shower(uint8_t mode, uint8_t para)
5322                     ; 666 {
5323                     .text:	section	.text,new
5324  0000               _lcd_disp_info_shower:
5326  0000 89            	pushw	x
5327       00000000      OFST:	set	0
5330                     ; 667 	if( (mode & 0x80) != 0 )
5332  0001 9e            	ld	a,xh
5333  0002 a580          	bcp	a,#128
5334  0004 2704          	jreq	L3771
5335                     ; 668 		lcd_blink_item(_info[2]);
5337  0006 a60f          	ld	a,#15
5340  0008 2008          	jp	LC005
5341  000a               L3771:
5342                     ; 670 	else if( (mode &0x08) != 0 )
5344  000a 7b01          	ld	a,(OFST+1,sp)
5345  000c a508          	bcp	a,#8
5346  000e 2707          	jreq	L7771
5347                     ; 671 		lcd_blink_item(_info[1]);
5349  0010 a62f          	ld	a,#47
5350  0012               LC005:
5351  0012 cd0000        	call	_lcd_blink_item
5354  0015 2003          	jra	L5771
5355  0017               L7771:
5356                     ; 673 		lcd_blink_clear();
5358  0017 cd0000        	call	_lcd_blink_clear
5360  001a               L5771:
5361                     ; 675 }
5364  001a 85            	popw	x
5365  001b 81            	ret	
5424                     ; 677 void	lcd_disp_info(uint8_t info, uint8_t mode, uint8_t multi)
5424                     ; 678 {
5425                     .text:	section	.text,new
5426  0000               _lcd_disp_info:
5428  0000 89            	pushw	x
5429  0001 88            	push	a
5430       00000001      OFST:	set	1
5433                     ; 680 	LCD_CE;
5435  0002 72165402      	bset	21506,#3
5436                     ; 681 	if( multi == 0 )
5438  0006 7b06          	ld	a,(OFST+5,sp)
5439  0008 2603          	jrne	L5202
5440                     ; 682 		lcd_clear_info();
5442  000a cd0000        	call	_lcd_clear_info
5444  000d               L5202:
5445                     ; 687 	j = _info[info];
5447  000d 7b02          	ld	a,(OFST+1,sp)
5448  000f 5f            	clrw	x
5449  0010 97            	ld	xl,a
5450  0011 d601d7        	ld	a,(__info,x)
5451  0014 6b01          	ld	(OFST+0,sp),a
5453                     ; 688 	if( mode == 1 )
5455  0016 7b03          	ld	a,(OFST+2,sp)
5456  0018 4a            	dec	a
5457  0019 2619          	jrne	L7202
5458                     ; 689 		LCD_BIT_CLEAR(j);
5460  001b 7b01          	ld	a,(OFST+0,sp)
5461  001d 5f            	clrw	x
5462  001e 97            	ld	xl,a
5463  001f d60040        	ld	a,(_iLF_DEF,x)
5464  0022 5f            	clrw	x
5465  0023 97            	ld	xl,a
5466  0024 7b01          	ld	a,(OFST+0,sp)
5467  0026 905f          	clrw	y
5468  0028 9097          	ld	yl,a
5469  002a 90d60000      	ld	a,(_bLF_DEF,y)
5470  002e 43            	cpl	a
5471  002f d4540c        	and	a,(21516,x)
5473  0032 2016          	jra	L1302
5474  0034               L7202:
5475                     ; 691 		LCD_BIT_SET(j);
5477  0034 7b01          	ld	a,(OFST+0,sp)
5478  0036 5f            	clrw	x
5479  0037 97            	ld	xl,a
5480  0038 d60040        	ld	a,(_iLF_DEF,x)
5481  003b 5f            	clrw	x
5482  003c 97            	ld	xl,a
5483  003d 7b01          	ld	a,(OFST+0,sp)
5484  003f 905f          	clrw	y
5485  0041 9097          	ld	yl,a
5486  0043 d6540c        	ld	a,(21516,x)
5487  0046 90da0000      	or	a,(_bLF_DEF,y)
5488  004a               L1302:
5489  004a d7540c        	ld	(21516,x),a
5490                     ; 693 	if( _key_blink == 1 )
5492  004d c60000        	ld	a,__key_blink
5493  0050 4a            	dec	a
5494  0051 2605          	jrne	L3302
5495                     ; 694 		lcd_blink_item(j);
5497  0053 7b01          	ld	a,(OFST+0,sp)
5498  0055 cd0000        	call	_lcd_blink_item
5500  0058               L3302:
5501                     ; 696 }
5504  0058 5b03          	addw	sp,#3
5505  005a 81            	ret	
5508                     	switch	.data
5509  0000               ___i:
5510  0000 00            	dc.b	0
5550                     ; 710 void	lcd_disp(uint8_t id, uint8_t enable)
5550                     ; 711 {
5551                     .text:	section	.text,new
5552  0000               _lcd_disp:
5554  0000 89            	pushw	x
5555       00000000      OFST:	set	0
5558                     ; 714 	LCD_CE;
5560  0001 72165402      	bset	21506,#3
5561                     ; 715 	if( enable == 1 )
5563  0005 9f            	ld	a,xl
5564  0006 4a            	dec	a
5565  0007 2628          	jrne	L3502
5566                     ; 717 		lcd_clear(0);
5568  0009 cd0000        	call	_lcd_clear
5570                     ; 718 		__i = (__i+1) % 10;
5572  000c c60000        	ld	a,___i
5573  000f 5f            	clrw	x
5574  0010 97            	ld	xl,a
5575  0011 5c            	incw	x
5576  0012 a60a          	ld	a,#10
5577  0014 cd0000        	call	c_smodx
5579  0017 01            	rrwa	x,a
5580  0018 c70000        	ld	___i,a
5581                     ; 719 		lcd_disp_n(0, __i);
5583  001b 5f            	clrw	x
5584  001c ad1e          	call	LC006
5585  001e ae0100        	ldw	x,#256
5586  0021 ad19          	call	LC006
5587  0023 ae0200        	ldw	x,#512
5588  0026 ad14          	call	LC006
5589  0028 ae0300        	ldw	x,#768
5590  002b 97            	ld	xl,a
5591  002c cd0000        	call	_lcd_disp_n
5593                     ; 722 		lcd_disp_n(3, __i);
5594  002f 2009          	jra	L5502
5595  0031               L3502:
5596                     ; 726 		LCD->RAM[LCD_RAMRegister_1] &= (uint8_t)(~id);
5598  0031 7b01          	ld	a,(OFST+1,sp)
5599  0033 43            	cpl	a
5600  0034 c4540d        	and	a,21517
5601  0037 c7540d        	ld	21517,a
5602  003a               L5502:
5603                     ; 728 }
5606  003a 85            	popw	x
5607  003b 81            	ret	
5608  003c               LC006:
5609  003c 97            	ld	xl,a
5610  003d cd0000        	call	_lcd_disp_n
5612                     ; 722 		lcd_disp_n(3, __i);
5614  0040 c60000        	ld	a,___i
5615  0043 81            	ret	
5647                     ; 730 void	lcd_init(void)
5647                     ; 731 {
5648                     .text:	section	.text,new
5649  0000               _lcd_init:
5651  0000 88            	push	a
5652       00000001      OFST:	set	1
5655                     ; 733 	LCD_CE;
5657  0001 72165402      	bset	21506,#3
5658                     ; 734 	for( i=0; i<15; i++ )
5660  0005 4f            	clr	a
5661  0006 6b01          	ld	(OFST+0,sp),a
5663  0008               L3702:
5664                     ; 735 		LCD->RAM[i] = 0xff;
5666  0008 5f            	clrw	x
5667  0009 97            	ld	xl,a
5668  000a a6ff          	ld	a,#255
5669  000c d7540c        	ld	(21516,x),a
5670                     ; 734 	for( i=0; i<15; i++ )
5672  000f 0c01          	inc	(OFST+0,sp)
5676  0011 7b01          	ld	a,(OFST+0,sp)
5677  0013 a10f          	cp	a,#15
5678  0015 25f1          	jrult	L3702
5679                     ; 736 }
5682  0017 84            	pop	a
5683  0018 81            	ret	
5715                     ; 740 void	lcd_cntl(uint8_t cmd, uint8_t param)
5715                     ; 741 {
5716                     .text:	section	.text,new
5717  0000               _lcd_cntl:
5721                     ; 760 }
5724  0000 81            	ret	
5747                     ; 762 void	systemLcdClear(void)
5747                     ; 763 {
5748                     .text:	section	.text,new
5749  0000               _systemLcdClear:
5753                     ; 764 	LCD->CR1 = LCD_CR1_RESET_VALUE;
5755  0000 725f5400      	clr	21504
5756                     ; 765 	LCD->CR2 = LCD_CR2_RESET_VALUE;
5758  0004 725f5401      	clr	21505
5759                     ; 766 	LCD->CR3 = LCD_CR3_RESET_VALUE;
5761  0008 725f5402      	clr	21506
5762                     ; 767 	LCD->FRQ = LCD_FRQ_RESET_VALUE;
5764  000c 725f5403      	clr	21507
5765                     ; 769 	LCD->CR4 = LCD_CR4_RESET_VALUE;
5767  0010 725f542f      	clr	21551
5768                     ; 770 }
5771  0014 81            	ret	
5805                     ; 807 void	systemLcd(void)
5805                     ; 808 {
5806                     .text:	section	.text,new
5807  0000               _systemLcd:
5811                     ; 809 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
5813  0000 ae1301        	ldw	x,#4865
5814  0003 cd0000        	call	_CLK_PeripheralClockConfig
5816                     ; 810 	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
5818  0006 ae0400        	ldw	x,#1024
5819  0009 cd0000        	call	_CLK_RTCClockConfig
5821                     ; 811 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
5823  000c ae1201        	ldw	x,#4609
5824  000f cd0000        	call	_CLK_PeripheralClockConfig
5826                     ; 813 	systemLcdClear();
5828  0012 cd0000        	call	_systemLcdClear
5830                     ; 815 	LCD_Init(
5830                     ; 816 		LCD_Prescaler_2, 
5830                     ; 817 		LCD_Divider_18, 
5830                     ; 818 		LCD_Duty_1_4,
5830                     ; 819 		LCD_Bias_1_3, 
5830                     ; 820 #if defined (_RC_DR_) || defined (_RC_DW_)
5830                     ; 821 		LCD_VoltageSource_External
5830                     ; 822 #else
5830                     ; 823 		LCD_VoltageSource_Internal
5830                     ; 824 #endif
5830                     ; 825 		);
5832  0015 4b01          	push	#1
5833  0017 4b00          	push	#0
5834  0019 4b06          	push	#6
5835  001b ae1002        	ldw	x,#4098
5836  001e cd0000        	call	_LCD_Init
5838  0021 5b03          	addw	sp,#3
5839                     ; 828 	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
5841  0023 ae00ff        	ldw	x,#255
5842  0026 cd0000        	call	_LCD_PortMaskConfig
5844                     ; 829 	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFE);	//	s8 Skip
5846  0029 ae01fe        	ldw	x,#510
5847  002c cd0000        	call	_LCD_PortMaskConfig
5849                     ; 830 	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x01);
5851  002f ae0201        	ldw	x,#513
5852  0032 cd0000        	call	_LCD_PortMaskConfig
5854                     ; 831 	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);	//	seg24/seg20/seg17/seg16
5856  0035 ae0300        	ldw	x,#768
5857  0038 cd0000        	call	_LCD_PortMaskConfig
5859                     ; 850 	LCD_HighDriveCmd(ENABLE);
5861  003b a601          	ld	a,#1
5862  003d cd0000        	call	_LCD_HighDriveCmd
5864                     ; 851 	LCD_ContrastConfig(LCD_Contrast_Level_7);
5866  0040 a60e          	ld	a,#14
5867  0042 cd0000        	call	_LCD_ContrastConfig
5869                     ; 852 	LCD_DeadTimeConfig(LCD_DeadTime_0);
5871  0045 4f            	clr	a
5872  0046 cd0000        	call	_LCD_DeadTimeConfig
5874                     ; 853 	LCD_PulseOnDurationConfig(LCD_PulseOnDuration_0);
5876  0049 4f            	clr	a
5877  004a cd0000        	call	_LCD_PulseOnDurationConfig
5879                     ; 867 	lcd_init();
5881  004d cd0000        	call	_lcd_init
5883                     ; 869 	LCD_Cmd(ENABLE); 
5885  0050 a601          	ld	a,#1
5887                     ; 870 }
5890  0052 cc0000        	jp	_LCD_Cmd
5893                     	switch	.data
5894  0001               __blink_timer:
5895  0001 05            	dc.b	5
5896  0002               __blinkFlag:
5897  0002 00            	dc.b	0
5898  0003               __blinkId:
5899  0003 ff            	dc.b	255
5900  0004               __blink:
5901  0004 00            	dc.b	0
5902  0005               __blinkFlag2:
5903  0005 00            	dc.b	0
5904  0006               __blinkId2:
5905  0006 ff            	dc.b	255
5906  0007               __blinkId2b:
5907  0007 ff            	dc.b	255
5908  0008               __blink2:
5909  0008 00            	dc.b	0
5910  0009               __blinkNpos:
5911  0009 00            	dc.b	0
5912  000a               __blinkFlag3:
5913  000a 00            	dc.b	0
5914  000b               __blinkId3:
5915  000b ff            	dc.b	255
5916  000c               __blink3:
5917  000c 00            	dc.b	0
5940                     ; 887 void	lcd_blink_npos_clear(void)
5940                     ; 888 {
5941                     .text:	section	.text,new
5942  0000               _lcd_blink_npos_clear:
5946                     ; 889 	_blinkNpos = 0;
5948  0000 725f0009      	clr	__blinkNpos
5949                     ; 890 }
5952  0004 81            	ret	
5985                     ; 892 void	lcd_blink_npos(uint8_t i)
5985                     ; 893 {
5986                     .text:	section	.text,new
5987  0000               _lcd_blink_npos:
5991                     ; 894 	_blinkNpos = i + 1;
5993  0000 4c            	inc	a
5994  0001 c70009        	ld	__blinkNpos,a
5995                     ; 895 }
5998  0004 81            	ret	
6024                     ; 897 void	lcd_blink_clear(void)
6024                     ; 898 {
6025                     .text:	section	.text,new
6026  0000               _lcd_blink_clear:
6030                     ; 899 	_blinkId = 0;
6032  0000 725f0003      	clr	__blinkId
6033                     ; 900 	_blinkId2 = 0;
6035  0004 725f0006      	clr	__blinkId2
6036                     ; 901 	_blinkId2b = 0;
6038  0008 725f0007      	clr	__blinkId2b
6039                     ; 902 }
6042  000c 81            	ret	
6076                     ; 904 void	lcd_blink_item(uint8_t i)
6076                     ; 905 {
6077                     .text:	section	.text,new
6078  0000               _lcd_blink_item:
6082                     ; 906 	_blinkId = i;
6084  0000 c70003        	ld	__blinkId,a
6085                     ; 907 	_blink = 0;
6087  0003 725f0004      	clr	__blink
6088                     ; 908 }
6091  0007 81            	ret	
6117                     ; 910 void	lcd_blink_clearRoom(void)
6117                     ; 911 {
6118                     .text:	section	.text,new
6119  0000               _lcd_blink_clearRoom:
6123                     ; 912 	_blinkId2 = 0;
6125  0000 725f0006      	clr	__blinkId2
6126                     ; 913 	_blinkId2b = 0;
6128  0004 725f0007      	clr	__blinkId2b
6129                     ; 914 }
6132  0008 81            	ret	
6175                     ; 916 void	lcd_blink_itemRoom(uint8_t i, uint8_t imode)
6175                     ; 917 {
6176                     .text:	section	.text,new
6177  0000               _lcd_blink_itemRoom:
6179  0000 89            	pushw	x
6180       00000000      OFST:	set	0
6183                     ; 918 	_blinkId2 = _rid[i*2];
6185  0001 9e            	ld	a,xh
6186  0002 5f            	clrw	x
6187  0003 97            	ld	xl,a
6188  0004 58            	sllw	x
6189  0005 d601da        	ld	a,(__rid,x)
6190  0008 c70006        	ld	__blinkId2,a
6191                     ; 919 	if( imode != 0 )
6193  000b 7b02          	ld	a,(OFST+2,sp)
6194  000d 270b          	jreq	L3322
6195                     ; 920 		_blinkId2b = _rid[i*2+1];
6197  000f 7b01          	ld	a,(OFST+1,sp)
6198  0011 5f            	clrw	x
6199  0012 97            	ld	xl,a
6200  0013 58            	sllw	x
6201  0014 d601db        	ld	a,(__rid+1,x)
6202  0017 c70007        	ld	__blinkId2b,a
6203  001a               L3322:
6204                     ; 921 	_blink2 = 0;
6206  001a 725f0008      	clr	__blink2
6207                     ; 922 }
6210  001e 85            	popw	x
6211  001f 81            	ret	
6268                     ; 924 void	lcd_blinkCb(void)
6268                     ; 925 {
6269                     .text:	section	.text,new
6270  0000               _lcd_blinkCb:
6272  0000 5204          	subw	sp,#4
6273       00000004      OFST:	set	4
6276                     ; 928 	if( _blink_timer == 0 )
6278  0002 c60001        	ld	a,__blink_timer
6279  0005 2603cc0165    	jreq	L5332
6280                     ; 929 		return;
6282                     ; 931 	if( (__timer100ms%_blink_timer) == 0 )
6284  000a c60000        	ld	a,___timer100ms
6285  000d 5f            	clrw	x
6286  000e 97            	ld	xl,a
6287  000f c60001        	ld	a,__blink_timer
6288  0012 905f          	clrw	y
6289  0014 9097          	ld	yl,a
6290  0016 cd0000        	call	c_idiv
6292  0019 905d          	tnzw	y
6293  001b 2703cc0159    	jrne	L7522
6294                     ; 933 		if( _blinkFlag == 0 )
6296  0020 c60002        	ld	a,__blinkFlag
6297  0023 262b          	jrne	L1622
6298                     ; 935 			_blinkFlag = 1;
6300  0025 35010002      	mov	__blinkFlag,#1
6301                     ; 936 			if( _blinkId != 0 )
6303  0029 c60003        	ld	a,__blinkId
6304  002c 2722          	jreq	L1622
6305                     ; 938 				if( _blink != 0 )
6307  002e 725d0004      	tnz	__blink
6308  0032 270f          	jreq	L5622
6309                     ; 940 					LCD_BIT_CLEAR(_blinkId);
6311  0034 cd0168        	call	LC007
6312  0037 c60003        	ld	a,__blinkId
6313  003a cd0170        	call	LC008
6314                     ; 941 					_blink = 0;
6316  003d 725f0004      	clr	__blink
6318  0041 200d          	jra	L1622
6319  0043               L5622:
6320                     ; 945 					LCD_BIT_SET(_blinkId);
6322  0043 cd0168        	call	LC007
6323  0046 c60003        	ld	a,__blinkId
6324  0049 cd0180        	call	LC009
6325                     ; 946 					_blink = 1;
6327  004c 35010004      	mov	__blink,#1
6328  0050               L1622:
6329                     ; 950 		if( _blinkFlag2 == 0 )
6331  0050 c60005        	ld	a,__blinkFlag2
6332  0053 264c          	jrne	L1722
6333                     ; 952 			_blinkFlag2 = 1;
6335  0055 35010005      	mov	__blinkFlag2,#1
6336                     ; 953 			if( _blinkId2 != 0 )
6338  0059 c60006        	ld	a,__blinkId2
6339  005c 2743          	jreq	L1722
6340                     ; 955 				if( _blink2 != 0 )
6342  005e c60008        	ld	a,__blink2
6343  0061 2720          	jreq	L5722
6344                     ; 957 					if( _blinkId2b != 0 )
6346  0063 c60007        	ld	a,__blinkId2b
6347  0066 2709          	jreq	L7722
6348                     ; 958 						LCD_BIT_CLEAR(_blinkId2b);
6350  0068 cd0168        	call	LC007
6351  006b c60007        	ld	a,__blinkId2b
6352  006e cd0170        	call	LC008
6353  0071               L7722:
6354                     ; 959 					LCD_BIT_CLEAR(_blinkId2);
6356  0071 c60006        	ld	a,__blinkId2
6357  0074 cd0168        	call	LC007
6358  0077 c60006        	ld	a,__blinkId2
6359  007a cd0170        	call	LC008
6360                     ; 960 					_blink2 = 0;
6362  007d 725f0008      	clr	__blink2
6364  0081 201e          	jra	L1722
6365  0083               L5722:
6366                     ; 964 					if( _blinkId2b != 0 )
6368  0083 c60007        	ld	a,__blinkId2b
6369  0086 2709          	jreq	L3032
6370                     ; 965 						LCD_BIT_SET(_blinkId2b);
6372  0088 cd0168        	call	LC007
6373  008b c60007        	ld	a,__blinkId2b
6374  008e cd0180        	call	LC009
6375  0091               L3032:
6376                     ; 966 					LCD_BIT_SET(_blinkId2);
6378  0091 c60006        	ld	a,__blinkId2
6379  0094 cd0168        	call	LC007
6380  0097 c60006        	ld	a,__blinkId2
6381  009a cd0180        	call	LC009
6382                     ; 967 					_blink2 = 1;
6384  009d 35010008      	mov	__blink2,#1
6385  00a1               L1722:
6386                     ; 971 		if( _blinkFlag3 == 0 )
6388  00a1 c6000a        	ld	a,__blinkFlag3
6389  00a4 2703cc0165    	jrne	L5332
6390                     ; 973 			_blinkFlag3 = 1;
6392  00a9 3501000a      	mov	__blinkFlag3,#1
6393                     ; 974 			if( _blinkNpos != 0 )
6395  00ad 725d0009      	tnz	__blinkNpos
6396  00b1 27f3          	jreq	L5332
6397                     ; 976 				p = lcd_get_npos(0);
6399  00b3 cd0000        	call	_lcd_get_npos
6401  00b6 1f02          	ldw	(OFST-2,sp),x
6403                     ; 977 				p = p+(_blinkNpos-1)*7;
6405  00b8 c60009        	ld	a,__blinkNpos
6406  00bb 97            	ld	xl,a
6407  00bc a607          	ld	a,#7
6408  00be 42            	mul	x,a
6409  00bf 1d0007        	subw	x,#7
6410  00c2 72fb02        	addw	x,(OFST-2,sp)
6411  00c5 1f02          	ldw	(OFST-2,sp),x
6413                     ; 978 				if( _blinkId3 != 0 )
6415  00c7 c6000b        	ld	a,__blinkId3
6416  00ca 2746          	jreq	L1132
6417                     ; 980 					for( i=0; i<7; i++ )
6419  00cc 0f04          	clr	(OFST+0,sp)
6421  00ce               L3132:
6422                     ; 982 						if( p[i] != 0 )
6424  00ce 7b02          	ld	a,(OFST-2,sp)
6425  00d0 97            	ld	xl,a
6426  00d1 7b03          	ld	a,(OFST-1,sp)
6427  00d3 1b04          	add	a,(OFST+0,sp)
6428  00d5 2401          	jrnc	L253
6429  00d7 5c            	incw	x
6430  00d8               L253:
6431  00d8 02            	rlwa	x,a
6432  00d9 f6            	ld	a,(x)
6433  00da 2728          	jreq	L1232
6434                     ; 983 							LCD_BIT_CLEAR(p[i]);
6436  00dc 7b02          	ld	a,(OFST-2,sp)
6437  00de 97            	ld	xl,a
6438  00df 7b03          	ld	a,(OFST-1,sp)
6439  00e1 1b04          	add	a,(OFST+0,sp)
6440  00e3 2401          	jrnc	L453
6441  00e5 5c            	incw	x
6442  00e6               L453:
6443  00e6 02            	rlwa	x,a
6444  00e7 f6            	ld	a,(x)
6445  00e8 ad7e          	call	LC007
6446  00ea 89            	pushw	x
6447  00eb 7b04          	ld	a,(OFST+0,sp)
6448  00ed 97            	ld	xl,a
6449  00ee 7b05          	ld	a,(OFST+1,sp)
6450  00f0 1b06          	add	a,(OFST+2,sp)
6451  00f2 2401          	jrnc	L653
6452  00f4 5c            	incw	x
6453  00f5               L653:
6454  00f5 02            	rlwa	x,a
6455  00f6 f6            	ld	a,(x)
6456  00f7 5f            	clrw	x
6457  00f8 97            	ld	xl,a
6458  00f9 d60000        	ld	a,(_bLF_DEF,x)
6459  00fc 43            	cpl	a
6460  00fd 85            	popw	x
6461  00fe d4540c        	and	a,(21516,x)
6462  0101 d7540c        	ld	(21516,x),a
6463  0104               L1232:
6464                     ; 980 					for( i=0; i<7; i++ )
6466  0104 0c04          	inc	(OFST+0,sp)
6470  0106 7b04          	ld	a,(OFST+0,sp)
6471  0108 a107          	cp	a,#7
6472  010a 25c2          	jrult	L3132
6473                     ; 985 					_blinkId3 = 0;
6475  010c 725f000b      	clr	__blinkId3
6477  0110 2053          	jra	L5332
6478  0112               L1132:
6479                     ; 989 					for( i=0; i<7; i++ )
6481  0112 6b04          	ld	(OFST+0,sp),a
6483  0114               L5232:
6484                     ; 991 						if( p[i] != 0 )
6486  0114 7b02          	ld	a,(OFST-2,sp)
6487  0116 97            	ld	xl,a
6488  0117 7b03          	ld	a,(OFST-1,sp)
6489  0119 1b04          	add	a,(OFST+0,sp)
6490  011b 2401          	jrnc	L063
6491  011d 5c            	incw	x
6492  011e               L063:
6493  011e 02            	rlwa	x,a
6494  011f f6            	ld	a,(x)
6495  0120 2729          	jreq	L3332
6496                     ; 992 							LCD_BIT_SET(p[i]);
6498  0122 7b02          	ld	a,(OFST-2,sp)
6499  0124 97            	ld	xl,a
6500  0125 7b03          	ld	a,(OFST-1,sp)
6501  0127 1b04          	add	a,(OFST+0,sp)
6502  0129 2401          	jrnc	L263
6503  012b 5c            	incw	x
6504  012c               L263:
6505  012c 02            	rlwa	x,a
6506  012d f6            	ld	a,(x)
6507  012e 5f            	clrw	x
6508  012f 97            	ld	xl,a
6509  0130 d60000        	ld	a,(_bLF_DEF,x)
6510  0133 6b01          	ld	(OFST-3,sp),a
6512  0135 7b02          	ld	a,(OFST-2,sp)
6513  0137 97            	ld	xl,a
6514  0138 7b03          	ld	a,(OFST-1,sp)
6515  013a 1b04          	add	a,(OFST+0,sp)
6516  013c 2401          	jrnc	L463
6517  013e 5c            	incw	x
6518  013f               L463:
6519  013f 02            	rlwa	x,a
6520  0140 f6            	ld	a,(x)
6521  0141 ad25          	call	LC007
6522  0143 d6540c        	ld	a,(21516,x)
6523  0146 1a01          	or	a,(OFST-3,sp)
6524  0148 d7540c        	ld	(21516,x),a
6525  014b               L3332:
6526                     ; 989 					for( i=0; i<7; i++ )
6528  014b 0c04          	inc	(OFST+0,sp)
6532  014d 7b04          	ld	a,(OFST+0,sp)
6533  014f a107          	cp	a,#7
6534  0151 25c1          	jrult	L5232
6535                     ; 994 					_blinkId3 = 1;
6537  0153 3501000b      	mov	__blinkId3,#1
6538  0157 200c          	jra	L5332
6539  0159               L7522:
6540                     ; 1001 		_blinkFlag = 0;
6542  0159 725f0002      	clr	__blinkFlag
6543                     ; 1002 		_blinkFlag2 = 0;
6545  015d 725f0005      	clr	__blinkFlag2
6546                     ; 1003 		_blinkFlag3 = 0;
6548  0161 725f000a      	clr	__blinkFlag3
6549  0165               L5332:
6550                     ; 1005 }
6553  0165 5b04          	addw	sp,#4
6554  0167 81            	ret	
6555  0168               LC007:
6556  0168 5f            	clrw	x
6557  0169 97            	ld	xl,a
6558  016a d60040        	ld	a,(_iLF_DEF,x)
6559  016d 5f            	clrw	x
6560  016e 97            	ld	xl,a
6561  016f 81            	ret	
6562  0170               LC008:
6563  0170 905f          	clrw	y
6564  0172 9097          	ld	yl,a
6565  0174 90d60000      	ld	a,(_bLF_DEF,y)
6566  0178 43            	cpl	a
6567  0179 d4540c        	and	a,(21516,x)
6568  017c d7540c        	ld	(21516,x),a
6569  017f 81            	ret	
6570  0180               LC009:
6571  0180 905f          	clrw	y
6572  0182 9097          	ld	yl,a
6573  0184 d6540c        	ld	a,(21516,x)
6574  0187 90da0000      	or	a,(_bLF_DEF,y)
6575  018b d7540c        	ld	(21516,x),a
6576  018e 81            	ret	
7082                     	xdef	__blink3
7083                     	xdef	__blinkId3
7084                     	xdef	__blinkFlag3
7085                     	xdef	__blinkNpos
7086                     	xdef	__blink2
7087                     	xdef	__blinkId2b
7088                     	xdef	__blinkId2
7089                     	xdef	__blinkFlag2
7090                     	xdef	__blink
7091                     	xdef	__blinkId
7092                     	xdef	__blinkFlag
7093                     	xdef	__blink_timer
7094                     	xdef	_systemLcdClear
7095                     	xdef	_lcd_init
7096                     	xdef	___i
7097                     	xdef	_lcd_disp_cmd
7098                     	xref	_error_type
7099                     	xdef	_lcd_get_npos
7100                     	xdef	_lcd_clear_cnt
7101                     	xdef	_lcd_clear_m
7102                     	xdef	_lcd_clear_info
7103                     	xdef	__plc
7104                     	xdef	__cnt_sub
7105                     	xdef	__cnt_host
7106                     	xdef	__lpm
7107                     	xdef	__temp_offset
7108                     	xdef	__po_type_pb
7109                     	xdef	__po_type_xl
7110                     	xdef	__po_type
7111                     	xdef	__len
7112                     	xdef	__freset
7113                     	xdef	__mir2
7114                     	xdef	__mir1
7115                     	xdef	__cntl_tab
7116                     	xdef	__cntl_2motor
7117                     	xdef	__cntl_op
7118                     	xdef	__link
7119                     	xdef	__hc
7120                     	xdef	__run
7121                     	xdef	__hcEach
7122                     	xdef	__hcLocal
7123                     	xdef	__cntl_po
7124                     	xdef	__cntl_on
7125                     	xdef	__cc
7126                     	xdef	__btn
7127                     	xdef	__bL
7128                     	xdef	__info
7129                     	xdef	__nid
7130                     	xdef	__n
7131                     	xdef	__nvalve
7132                     	xdef	__ncnt
7133                     	xdef	__nm
7134                     	xdef	__nerrBr
7135                     	xdef	__nerr
7136                     	xdef	__nd
7137                     	xdef	__nc
7138                     	xdef	__nb
7139                     	xdef	__na
7140                     	xref	__key_blink
7141                     	xdef	_lcd_disp_all
7142                     	xdef	_lcd_blink_npos
7143                     	xdef	_lcd_blink_npos_clear
7144                     	xdef	_lcd_disp_info
7145                     	xdef	_lcd_disp_info_fire
7146                     	xdef	_lcd_disp_info_shower
7147                     	xdef	_lcd_clear_rid_n
7148                     	xdef	_lcd_blinkCb
7149                     	xdef	_lcd_blink_itemRoom
7150                     	xdef	_lcd_blink_item
7151                     	xdef	_lcd_blink_clearRoom
7152                     	xdef	_lcd_blink_clear
7153                     	xdef	_lcd_clear_npos
7154                     	xdef	_lcd_disp_rid
7155                     	xdef	_lcd_disp_err
7156                     	xdef	_lcd_disp_n
7157                     	xdef	_lcd_clear
7158                     	xdef	_lcd_disp_setup_mode_each
7159                     	xdef	_lcd_disp_setup_mode_local
7160                     	xdef	_lcd_disp_setup_valve
7161                     	xdef	_lcd_disp_setup_cnt
7162                     	xdef	_lcd_disp_setup_m
7163                     	xdef	_lcd_disp_setup_id
7164                     	xdef	_lcd_disp_setup_mode
7165                     	xdef	_lcd_disp_setup_run
7166                     	xdef	_lcd_disp_setup_c
7167                     	xdef	_lcd_disp_setup_link
7168                     	xdef	_lcd_disp_plc
7169                     	xdef	_lcd_disp_cnt_sub
7170                     	xdef	_lcd_disp_cnt_host
7171                     	xdef	_lcd_disp_freset
7172                     	xdef	_lcd_disp_mir2
7173                     	xdef	_lcd_disp_mir1
7174                     	xdef	_lcd_disp_setup_cntl_tab
7175                     	xdef	_lcd_disp_setup_cntl_2motor
7176                     	xdef	_lcd_disp_setup_cntl_po
7177                     	xdef	_lcd_disp_setup_cntl_on
7178                     	xdef	_lcd_disp_setup_cntl_op
7179                     	xdef	_lcd_disp_setup_len
7180                     	xdef	_lcd_disp_setup_po_type_pb
7181                     	xdef	_lcd_disp_setup_po_type_xl
7182                     	xdef	_lcd_disp_setup_po_type
7183                     	xdef	_lcd_disp_setup_temp_offset
7184                     	xdef	_lcd_disp_setup_lpm
7185                     	xdef	_lcd_disp_backlight
7186                     	xdef	_lcd_clear_rid
7187                     	xdef	_lcd_clear_run
7188                     	xdef	_lcd_clear_mode
7189                     	xdef	_lcd_clear_n
7190                     	xdef	_lcd_clear_c
7191                     	xdef	_lcd_clear_btn
7192                     	xdef	_lcd_clear_backlight
7193                     	xdef	__rid
7194                     	xdef	_iLF_DEF
7195                     	xdef	_bLF_DEF
7196                     	xref	_uiInfo
7197                     	xref	___timer100ms
7198                     	xdef	_lcd_cntl
7199                     	xdef	_lcd_disp
7200                     	xdef	_lcd_blink
7201                     	xdef	_systemLcd
7202                     	xref	_LCD_ContrastConfig
7203                     	xref	_LCD_DeadTimeConfig
7204                     	xref	_LCD_PulseOnDurationConfig
7205                     	xref	_LCD_HighDriveCmd
7206                     	xref	_LCD_Cmd
7207                     	xref	_LCD_PortMaskConfig
7208                     	xref	_LCD_Init
7209                     	xref	_CLK_PeripheralClockConfig
7210                     	xref	_CLK_RTCClockConfig
7211                     	xref.b	c_x
7230                     	xref	c_idiv
7231                     	xref	c_smodx
7232                     	end
