   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  59                     ; 8 void	lcd_blink(uint8_t mode)
  59                     ; 9 {
  60                     .text:	section	.text,new
  61  0000               f_lcd_blink:
  65                     ; 30 }
  68  0000 87            	retf	
  70                     .const:	section	.text
  71  0000               _bLF_DEF:
  72  0000 01            	dc.b	1
  73  0001 02            	dc.b	2
  74  0002 04            	dc.b	4
  75  0003 08            	dc.b	8
  76  0004 10            	dc.b	16
  77  0005 20            	dc.b	32
  78  0006 40            	dc.b	64
  79  0007 80            	dc.b	128
  80  0008 01            	dc.b	1
  81  0009 02            	dc.b	2
  82  000a 04            	dc.b	4
  83  000b 08            	dc.b	8
  84  000c 10            	dc.b	16
  85  000d 20            	dc.b	32
  86  000e 40            	dc.b	64
  87  000f 80            	dc.b	128
  88  0010 01            	dc.b	1
  89  0011 02            	dc.b	2
  90  0012 04            	dc.b	4
  91  0013 08            	dc.b	8
  92  0014 10            	dc.b	16
  93  0015 20            	dc.b	32
  94  0016 40            	dc.b	64
  95  0017 80            	dc.b	128
  96  0018 01            	dc.b	1
  97  0019 02            	dc.b	2
  98  001a 04            	dc.b	4
  99  001b 08            	dc.b	8
 100  001c 10            	dc.b	16
 101  001d 20            	dc.b	32
 102  001e 40            	dc.b	64
 103  001f 80            	dc.b	128
 104  0020 01            	dc.b	1
 105  0021 02            	dc.b	2
 106  0022 04            	dc.b	4
 107  0023 08            	dc.b	8
 108  0024 10            	dc.b	16
 109  0025 20            	dc.b	32
 110  0026 40            	dc.b	64
 111  0027 80            	dc.b	128
 112  0028 01            	dc.b	1
 113  0029 02            	dc.b	2
 114  002a 04            	dc.b	4
 115  002b 08            	dc.b	8
 116  002c 10            	dc.b	16
 117  002d 20            	dc.b	32
 118  002e 40            	dc.b	64
 119  002f 80            	dc.b	128
 120  0030 01            	dc.b	1
 121  0031 02            	dc.b	2
 122  0032 04            	dc.b	4
 123  0033 08            	dc.b	8
 124  0034 10            	dc.b	16
 125  0035 20            	dc.b	32
 126  0036 40            	dc.b	64
 127  0037 80            	dc.b	128
 128  0038 01            	dc.b	1
 129  0039 02            	dc.b	2
 130  003a 04            	dc.b	4
 131  003b 08            	dc.b	8
 132  003c 10            	dc.b	16
 133  003d 20            	dc.b	32
 134  003e 40            	dc.b	64
 135  003f 80            	dc.b	128
 136  0040 01            	dc.b	1
 137  0041 02            	dc.b	2
 138  0042 04            	dc.b	4
 139  0043 08            	dc.b	8
 140  0044 10            	dc.b	16
 141  0045 20            	dc.b	32
 142  0046 40            	dc.b	64
 143  0047 80            	dc.b	128
 144  0048               _iLF_DEF:
 145  0048 00            	dc.b	0
 146  0049 00            	dc.b	0
 147  004a 00            	dc.b	0
 148  004b 00            	dc.b	0
 149  004c 00            	dc.b	0
 150  004d 00            	dc.b	0
 151  004e 00            	dc.b	0
 152  004f 00            	dc.b	0
 153  0050 01            	dc.b	1
 154  0051 01            	dc.b	1
 155  0052 01            	dc.b	1
 156  0053 01            	dc.b	1
 157  0054 01            	dc.b	1
 158  0055 01            	dc.b	1
 159  0056 01            	dc.b	1
 160  0057 01            	dc.b	1
 161  0058 02            	dc.b	2
 162  0059 03            	dc.b	3
 163  005a 03            	dc.b	3
 164  005b 03            	dc.b	3
 165  005c 03            	dc.b	3
 166  005d 04            	dc.b	4
 167  005e 04            	dc.b	4
 168  005f 04            	dc.b	4
 169  0060 04            	dc.b	4
 170  0061 04            	dc.b	4
 171  0062 04            	dc.b	4
 172  0063 04            	dc.b	4
 173  0064 04            	dc.b	4
 174  0065 05            	dc.b	5
 175  0066 05            	dc.b	5
 176  0067 05            	dc.b	5
 177  0068 05            	dc.b	5
 178  0069 05            	dc.b	5
 179  006a 07            	dc.b	7
 180  006b 07            	dc.b	7
 181  006c 07            	dc.b	7
 182  006d 07            	dc.b	7
 183  006e 07            	dc.b	7
 184  006f 07            	dc.b	7
 185  0070 07            	dc.b	7
 186  0071 07            	dc.b	7
 187  0072 08            	dc.b	8
 188  0073 08            	dc.b	8
 189  0074 08            	dc.b	8
 190  0075 08            	dc.b	8
 191  0076 08            	dc.b	8
 192  0077 08            	dc.b	8
 193  0078 08            	dc.b	8
 194  0079 08            	dc.b	8
 195  007a 09            	dc.b	9
 196  007b 0a            	dc.b	10
 197  007c 0a            	dc.b	10
 198  007d 0a            	dc.b	10
 199  007e 0a            	dc.b	10
 200  007f 0b            	dc.b	11
 201  0080 0b            	dc.b	11
 202  0081 0b            	dc.b	11
 203  0082 0b            	dc.b	11
 204  0083 0b            	dc.b	11
 205  0084 0b            	dc.b	11
 206  0085 0b            	dc.b	11
 207  0086 0b            	dc.b	11
 208  0087 0c            	dc.b	12
 209  0088 0c            	dc.b	12
 210  0089 0c            	dc.b	12
 211  008a 0c            	dc.b	12
 212  008b 0c            	dc.b	12
 213  008c               __na:
 214  008c 01            	dc.b	1
 215  008d               __nb:
 216  008d 03            	dc.b	3
 217  008e 15            	dc.b	21
 218  008f 3b            	dc.b	59
 219  0090 3c            	dc.b	60
 220  0091 29            	dc.b	41
 221  0092 16            	dc.b	22
 222  0093 00            	dc.b	0
 223  0094 15            	dc.b	21
 224  0095 3b            	dc.b	59
 225  0096 00            	dc.b	0
 226  0097 00            	dc.b	0
 227  0098 00            	dc.b	0
 228  0099 00            	dc.b	0
 229  009a 00            	dc.b	0
 230  009b 03            	dc.b	3
 231  009c 15            	dc.b	21
 232  009d 28            	dc.b	40
 233  009e 29            	dc.b	41
 234  009f 3c            	dc.b	60
 235  00a0 00            	dc.b	0
 236  00a1 00            	dc.b	0
 237  00a2 03            	dc.b	3
 238  00a3 15            	dc.b	21
 239  00a4 28            	dc.b	40
 240  00a5 3b            	dc.b	59
 241  00a6 3c            	dc.b	60
 242  00a7 00            	dc.b	0
 243  00a8 00            	dc.b	0
 244  00a9 16            	dc.b	22
 245  00aa 28            	dc.b	40
 246  00ab 15            	dc.b	21
 247  00ac 3b            	dc.b	59
 248  00ad 00            	dc.b	0
 249  00ae 00            	dc.b	0
 250  00af 00            	dc.b	0
 251  00b0 03            	dc.b	3
 252  00b1 16            	dc.b	22
 253  00b2 28            	dc.b	40
 254  00b3 3b            	dc.b	59
 255  00b4 3c            	dc.b	60
 256  00b5 00            	dc.b	0
 257  00b6 00            	dc.b	0
 258  00b7 16            	dc.b	22
 259  00b8 28            	dc.b	40
 260  00b9 29            	dc.b	41
 261  00ba 3c            	dc.b	60
 262  00bb 3b            	dc.b	59
 263  00bc 03            	dc.b	3
 264  00bd 00            	dc.b	0
 265  00be 03            	dc.b	3
 266  00bf 15            	dc.b	21
 267  00c0 3b            	dc.b	59
 268  00c1 00            	dc.b	0
 269  00c2 00            	dc.b	0
 270  00c3 00            	dc.b	0
 271  00c4 00            	dc.b	0
 272  00c5 03            	dc.b	3
 273  00c6 15            	dc.b	21
 274  00c7 3b            	dc.b	59
 275  00c8 3c            	dc.b	60
 276  00c9 29            	dc.b	41
 277  00ca 16            	dc.b	22
 278  00cb 28            	dc.b	40
 279  00cc 03            	dc.b	3
 280  00cd 16            	dc.b	22
 281  00ce 28            	dc.b	40
 282  00cf 15            	dc.b	21
 283  00d0 3b            	dc.b	59
 284  00d1 3c            	dc.b	60
 285  00d2 00            	dc.b	0
 286  00d3               __nc:
 287  00d3 01            	dc.b	1
 288  00d4 13            	dc.b	19
 289  00d5 39            	dc.b	57
 290  00d6 3a            	dc.b	58
 291  00d7 27            	dc.b	39
 292  00d8 14            	dc.b	20
 293  00d9 00            	dc.b	0
 294  00da 13            	dc.b	19
 295  00db 39            	dc.b	57
 296  00dc 00            	dc.b	0
 297  00dd 00            	dc.b	0
 298  00de 00            	dc.b	0
 299  00df 00            	dc.b	0
 300  00e0 00            	dc.b	0
 301  00e1 01            	dc.b	1
 302  00e2 13            	dc.b	19
 303  00e3 26            	dc.b	38
 304  00e4 27            	dc.b	39
 305  00e5 3a            	dc.b	58
 306  00e6 00            	dc.b	0
 307  00e7 00            	dc.b	0
 308  00e8 01            	dc.b	1
 309  00e9 13            	dc.b	19
 310  00ea 26            	dc.b	38
 311  00eb 39            	dc.b	57
 312  00ec 3a            	dc.b	58
 313  00ed 00            	dc.b	0
 314  00ee 00            	dc.b	0
 315  00ef 14            	dc.b	20
 316  00f0 26            	dc.b	38
 317  00f1 13            	dc.b	19
 318  00f2 39            	dc.b	57
 319  00f3 00            	dc.b	0
 320  00f4 00            	dc.b	0
 321  00f5 00            	dc.b	0
 322  00f6 01            	dc.b	1
 323  00f7 14            	dc.b	20
 324  00f8 26            	dc.b	38
 325  00f9 39            	dc.b	57
 326  00fa 3a            	dc.b	58
 327  00fb 00            	dc.b	0
 328  00fc 00            	dc.b	0
 329  00fd 14            	dc.b	20
 330  00fe 26            	dc.b	38
 331  00ff 27            	dc.b	39
 332  0100 3a            	dc.b	58
 333  0101 39            	dc.b	57
 334  0102 01            	dc.b	1
 335  0103 00            	dc.b	0
 336  0104 01            	dc.b	1
 337  0105 13            	dc.b	19
 338  0106 39            	dc.b	57
 339  0107 00            	dc.b	0
 340  0108 00            	dc.b	0
 341  0109 00            	dc.b	0
 342  010a 00            	dc.b	0
 343  010b 01            	dc.b	1
 344  010c 13            	dc.b	19
 345  010d 39            	dc.b	57
 346  010e 3a            	dc.b	58
 347  010f 27            	dc.b	39
 348  0110 14            	dc.b	20
 349  0111 26            	dc.b	38
 350  0112 01            	dc.b	1
 351  0113 14            	dc.b	20
 352  0114 26            	dc.b	38
 353  0115 13            	dc.b	19
 354  0116 39            	dc.b	57
 355  0117 3a            	dc.b	58
 356  0118 00            	dc.b	0
 357  0119               __nd:
 358  0119 12            	dc.b	18
 359  011a 24            	dc.b	36
 360  011b 4a            	dc.b	74
 361  011c 4b            	dc.b	75
 362  011d 38            	dc.b	56
 363  011e 25            	dc.b	37
 364  011f 00            	dc.b	0
 365  0120 24            	dc.b	36
 366  0121 4a            	dc.b	74
 367  0122 00            	dc.b	0
 368  0123 00            	dc.b	0
 369  0124 00            	dc.b	0
 370  0125 00            	dc.b	0
 371  0126 00            	dc.b	0
 372  0127 12            	dc.b	18
 373  0128 24            	dc.b	36
 374  0129 37            	dc.b	55
 375  012a 38            	dc.b	56
 376  012b 4b            	dc.b	75
 377  012c 00            	dc.b	0
 378  012d 00            	dc.b	0
 379  012e 12            	dc.b	18
 380  012f 24            	dc.b	36
 381  0130 37            	dc.b	55
 382  0131 4a            	dc.b	74
 383  0132 4b            	dc.b	75
 384  0133 00            	dc.b	0
 385  0134 00            	dc.b	0
 386  0135 25            	dc.b	37
 387  0136 37            	dc.b	55
 388  0137 24            	dc.b	36
 389  0138 4a            	dc.b	74
 390  0139 00            	dc.b	0
 391  013a 00            	dc.b	0
 392  013b 00            	dc.b	0
 393  013c 12            	dc.b	18
 394  013d 25            	dc.b	37
 395  013e 37            	dc.b	55
 396  013f 4a            	dc.b	74
 397  0140 4b            	dc.b	75
 398  0141 00            	dc.b	0
 399  0142 00            	dc.b	0
 400  0143 25            	dc.b	37
 401  0144 37            	dc.b	55
 402  0145 38            	dc.b	56
 403  0146 4b            	dc.b	75
 404  0147 4a            	dc.b	74
 405  0148 12            	dc.b	18
 406  0149 00            	dc.b	0
 407  014a 12            	dc.b	18
 408  014b 24            	dc.b	36
 409  014c 4a            	dc.b	74
 410  014d 00            	dc.b	0
 411  014e 00            	dc.b	0
 412  014f 00            	dc.b	0
 413  0150 00            	dc.b	0
 414  0151 12            	dc.b	18
 415  0152 24            	dc.b	36
 416  0153 4a            	dc.b	74
 417  0154 4b            	dc.b	75
 418  0155 38            	dc.b	56
 419  0156 25            	dc.b	37
 420  0157 37            	dc.b	55
 421  0158 12            	dc.b	18
 422  0159 25            	dc.b	37
 423  015a 37            	dc.b	55
 424  015b 24            	dc.b	36
 425  015c 4a            	dc.b	74
 426  015d 4b            	dc.b	75
 427  015e 00            	dc.b	0
 428  015f               __nerr:
 429  015f 05            	dc.b	5
 430  0160 18            	dc.b	24
 431  0161 2b            	dc.b	43
 432  0162 3e            	dc.b	62
 433  0163 2a            	dc.b	42
 434  0164 29            	dc.b	41
 435  0165 28            	dc.b	40
 436  0166               __nerrBr:
 437  0166 3d            	dc.b	61
 438  0167 18            	dc.b	24
 439  0168 2b            	dc.b	43
 440  0169 3e            	dc.b	62
 441  016a 2a            	dc.b	42
 442  016b 29            	dc.b	41
 443  016c 28            	dc.b	40
 444  016d               __nm:
 445  016d 2b            	dc.b	43
 446  016e 2a            	dc.b	42
 447  016f 3d            	dc.b	61
 448  0170               __ncnt:
 449  0170 2a            	dc.b	42
 450  0171 2b            	dc.b	43
 451  0172 3e            	dc.b	62
 452  0173 29            	dc.b	41
 453  0174 28            	dc.b	40
 454  0175 3b            	dc.b	59
 455  0176               __nvalve:
 456  0176 3d            	dc.b	61
 457  0177 2b            	dc.b	43
 458  0178 3e            	dc.b	62
 459  0179 29            	dc.b	41
 460  017a 28            	dc.b	40
 461  017b 3b            	dc.b	59
 462  017c               __n:
 463  017c 05            	dc.b	5
 464  017d 17            	dc.b	23
 465  017e 3d            	dc.b	61
 466  017f 3e            	dc.b	62
 467  0180 2b            	dc.b	43
 468  0181 18            	dc.b	24
 469  0182 2a            	dc.b	42
 470  0183 03            	dc.b	3
 471  0184 15            	dc.b	21
 472  0185 3b            	dc.b	59
 473  0186 3c            	dc.b	60
 474  0187 29            	dc.b	41
 475  0188 16            	dc.b	22
 476  0189 28            	dc.b	40
 477  018a 12            	dc.b	18
 478  018b 24            	dc.b	36
 479  018c 4a            	dc.b	74
 480  018d 4b            	dc.b	75
 481  018e 38            	dc.b	56
 482  018f 25            	dc.b	37
 483  0190 37            	dc.b	55
 484  0191 10            	dc.b	16
 485  0192 22            	dc.b	34
 486  0193 48            	dc.b	72
 487  0194 49            	dc.b	73
 488  0195 36            	dc.b	54
 489  0196 23            	dc.b	35
 490  0197 35            	dc.b	53
 491  0198 01            	dc.b	1
 492  0199 13            	dc.b	19
 493  019a 39            	dc.b	57
 494  019b 3a            	dc.b	58
 495  019c 27            	dc.b	39
 496  019d 14            	dc.b	20
 497  019e 26            	dc.b	38
 498  019f 0e            	dc.b	14
 499  01a0 20            	dc.b	32
 500  01a1 46            	dc.b	70
 501  01a2 47            	dc.b	71
 502  01a3 34            	dc.b	52
 503  01a4 21            	dc.b	33
 504  01a5 33            	dc.b	51
 505  01a6               __nid:
 506  01a6 3d            	dc.b	61
 507  01a7 15            	dc.b	21
 508  01a8 3b            	dc.b	59
 509  01a9 28            	dc.b	40
 510  01aa 29            	dc.b	41
 511  01ab 3c            	dc.b	60
 512  01ac               __info:
 513  01ac 02            	dc.b	2
 514  01ad 43            	dc.b	67
 515  01ae 45            	dc.b	69
 516  01af               __rid:
 517  01af 1a            	dc.b	26
 518  01b0 2d            	dc.b	45
 519  01b1 1b            	dc.b	27
 520  01b2 2e            	dc.b	46
 521  01b3 1c            	dc.b	28
 522  01b4 2f            	dc.b	47
 523  01b5 1d            	dc.b	29
 524  01b6 30            	dc.b	48
 525  01b7 1e            	dc.b	30
 526  01b8 31            	dc.b	49
 527  01b9 1f            	dc.b	31
 528  01ba 32            	dc.b	50
 529  01bb 11            	dc.b	17
 530  01bc 11            	dc.b	17
 531  01bd 11            	dc.b	17
 532  01be 11            	dc.b	17
 533  01bf               __bL:
 534  01bf 18            	dc.b	24
 535  01c0 2b            	dc.b	43
 536  01c1 2a            	dc.b	42
 537  01c2 3e            	dc.b	62
 538  01c3 3d            	dc.b	61
 539  01c4 16            	dc.b	22
 540  01c5 29            	dc.b	41
 541  01c6 3c            	dc.b	60
 542  01c7               __btn:
 543  01c7 19            	dc.b	25
 544  01c8 41            	dc.b	65
 545  01c9 42            	dc.b	66
 546  01ca 06            	dc.b	6
 547  01cb 06            	dc.b	6
 548  01cc               __cc:
 549  01cc 04            	dc.b	4
 550  01cd               __cntl_on:
 551  01cd 37            	dc.b	55
 552  01ce 38            	dc.b	56
 553  01cf 4a            	dc.b	74
 554  01d0 4b            	dc.b	75
 555  01d1 10            	dc.b	16
 556  01d2 36            	dc.b	54
 557  01d3 35            	dc.b	53
 558  01d4 23            	dc.b	35
 559  01d5               __cntl_po:
 560  01d5 12            	dc.b	18
 561  01d6 24            	dc.b	36
 562  01d7 25            	dc.b	37
 563  01d8 37            	dc.b	55
 564  01d9 38            	dc.b	56
 565  01da 35            	dc.b	53
 566  01db 36            	dc.b	54
 567  01dc 48            	dc.b	72
 568  01dd 49            	dc.b	73
 569  01de               __hcLocal:
 570  01de 25            	dc.b	37
 571  01df 38            	dc.b	56
 572  01e0 4b            	dc.b	75
 573  01e1 35            	dc.b	53
 574  01e2 36            	dc.b	54
 575  01e3 49            	dc.b	73
 576  01e4 48            	dc.b	72
 577  01e5               __hcEach:
 578  01e5 12            	dc.b	18
 579  01e6 25            	dc.b	37
 580  01e7 37            	dc.b	55
 581  01e8 38            	dc.b	56
 582  01e9 4b            	dc.b	75
 583  01ea 10            	dc.b	16
 584  01eb 23            	dc.b	35
 585  01ec 36            	dc.b	54
 586  01ed 22            	dc.b	34
 587  01ee 35            	dc.b	53
 588  01ef 48            	dc.b	72
 589  01f0               __run:
 590  01f0 2b            	dc.b	43
 591  01f1 2a            	dc.b	42
 592  01f2 29            	dc.b	41
 593  01f3 3c            	dc.b	60
 594  01f4 3b            	dc.b	59
 595  01f5 27            	dc.b	39
 596  01f6 26            	dc.b	38
 597  01f7 39            	dc.b	57
 598  01f8               __hc:
 599  01f8 18            	dc.b	24
 600  01f9 2b            	dc.b	43
 601  01fa 2a            	dc.b	42
 602  01fb 3e            	dc.b	62
 603  01fc 28            	dc.b	40
 604  01fd 16            	dc.b	22
 605  01fe 15            	dc.b	21
 606  01ff 3b            	dc.b	59
 607  0200               __link:
 608  0200 18            	dc.b	24
 609  0201 2b            	dc.b	43
 610  0202 3e            	dc.b	62
 611  0203 29            	dc.b	41
 612  0204 28            	dc.b	40
 613  0205 3b            	dc.b	59
 614  0206               __cntl_op:
 615  0206 2a            	dc.b	42
 616  0207 2b            	dc.b	43
 617  0208 3d            	dc.b	61
 618  0209 3e            	dc.b	62
 619  020a 03            	dc.b	3
 620  020b 15            	dc.b	21
 621  020c 16            	dc.b	22
 622  020d 28            	dc.b	40
 623  020e 29            	dc.b	41
 624  020f               __cntl_2motor:
 625  020f 01            	dc.b	1
 626  0210 13            	dc.b	19
 627  0211 3a            	dc.b	58
 628  0212 26            	dc.b	38
 629  0213 27            	dc.b	39
 630  0214 37            	dc.b	55
 631  0215 38            	dc.b	56
 632  0216 12            	dc.b	18
 633  0217 25            	dc.b	37
 634  0218 24            	dc.b	36
 635  0219               __cntl_tab:
 636  0219 01            	dc.b	1
 637  021a 14            	dc.b	20
 638  021b 27            	dc.b	39
 639  021c 37            	dc.b	55
 640  021d 38            	dc.b	56
 641  021e 25            	dc.b	37
 642  021f 4b            	dc.b	75
 643  0220 4a            	dc.b	74
 644  0221               __mir1:
 645  0221 13            	dc.b	19
 646  0222 39            	dc.b	57
 647  0223 27            	dc.b	39
 648  0224 26            	dc.b	38
 649  0225 3a            	dc.b	58
 650  0226 24            	dc.b	36
 651  0227 4a            	dc.b	74
 652  0228               __mir2:
 653  0228 13            	dc.b	19
 654  0229 39            	dc.b	57
 655  022a 27            	dc.b	39
 656  022b 26            	dc.b	38
 657  022c 3a            	dc.b	58
 658  022d 12            	dc.b	18
 659  022e 24            	dc.b	36
 660  022f 37            	dc.b	55
 661  0230 38            	dc.b	56
 662  0231 4b            	dc.b	75
 663  0232               __freset:
 664  0232 01            	dc.b	1
 665  0233 14            	dc.b	20
 666  0234 27            	dc.b	39
 667  0235 26            	dc.b	38
 668  0236 37            	dc.b	55
 669  0237 38            	dc.b	56
 670  0238               __len:
 671  0238 18            	dc.b	24
 672  0239 2b            	dc.b	43
 673  023a 3e            	dc.b	62
 674  023b               __po_type:
 675  023b 28            	dc.b	40
 676  023c 29            	dc.b	41
 677  023d 3b            	dc.b	59
 678  023e 3c            	dc.b	60
 679  023f 05            	dc.b	5
 680  0240 17            	dc.b	23
 681  0241 18            	dc.b	24
 682  0242 2a            	dc.b	42
 683  0243 2b            	dc.b	43
 684  0244               __po_type_xl:
 685  0244 25            	dc.b	37
 686  0245 38            	dc.b	56
 687  0246 4b            	dc.b	75
 688  0247 14            	dc.b	20
 689  0248 13            	dc.b	19
 690  0249 39            	dc.b	57
 691  024a 26            	dc.b	38
 692  024b 27            	dc.b	39
 693  024c               __po_type_pb:
 694  024c 37            	dc.b	55
 695  024d 38            	dc.b	56
 696  024e 4a            	dc.b	74
 697  024f 4b            	dc.b	75
 698  0250 25            	dc.b	37
 699  0251 01            	dc.b	1
 700  0252 13            	dc.b	19
 701  0253 14            	dc.b	20
 702  0254 26            	dc.b	38
 703  0255 27            	dc.b	39
 704  0256               __temp_offset:
 705  0256 2a            	dc.b	42
 706  0257 2b            	dc.b	43
 707  0258 3e            	dc.b	62
 708  0259 18            	dc.b	24
 709  025a               __lpm:
 710  025a 18            	dc.b	24
 711  025b 2b            	dc.b	43
 712  025c 3e            	dc.b	62
 713  025d 29            	dc.b	41
 714  025e 28            	dc.b	40
 715  025f 03            	dc.b	3
 716  0260 16            	dc.b	22
 717  0261 15            	dc.b	21
 718  0262               __cnt_host:
 719  0262 13            	dc.b	19
 720  0263 39            	dc.b	57
 721  0264 27            	dc.b	39
 722  0265 26            	dc.b	38
 723  0266 14            	dc.b	20
 724  0267 37            	dc.b	55
 725  0268 4a            	dc.b	74
 726  0269 38            	dc.b	56
 727  026a 4b            	dc.b	75
 728  026b               __cnt_sub:
 729  026b 01            	dc.b	1
 730  026c 39            	dc.b	57
 731  026d 14            	dc.b	20
 732  026e 26            	dc.b	38
 733  026f 3a            	dc.b	58
 734  0270 38            	dc.b	56
 735  0271 4b            	dc.b	75
 736  0272 4a            	dc.b	74
 737  0273               __plc:
 738  0273 05            	dc.b	5
 739  0274 17            	dc.b	23
 740  0275 18            	dc.b	24
 741  0276 2b            	dc.b	43
 742  0277 2a            	dc.b	42
 743  0278 29            	dc.b	41
 744  0279 3c            	dc.b	60
 745  027a 16            	dc.b	22
 746  027b 01            	dc.b	1
 747  027c 14            	dc.b	20
 748  027d 27            	dc.b	39
 749  027e 3a            	dc.b	58
 789                     ; 372 LCD_DISP_FUNC_1(lcd_disp_plc, 12, _plc)
 790                     .text:	section	.text,new
 791  0000               f_lcd_disp_plc:
 793  0000 89            	pushw	x
 794       00000002      OFST:	set	2
 797  0001 4f            	clr	a
 798  0002 6b02          	ld	(OFST+0,sp),a
 799  0004               L34:
 802  0004 5f            	clrw	x
 803  0005 97            	ld	xl,a
 804  0006 d60273        	ld	a,(__plc,x)
 805  0009 6b01          	ld	(OFST-1,sp),a
 808  000b 5f            	clrw	x
 809  000c 97            	ld	xl,a
 810  000d d60048        	ld	a,(_iLF_DEF,x)
 811  0010 5f            	clrw	x
 812  0011 97            	ld	xl,a
 813  0012 7b01          	ld	a,(OFST-1,sp)
 814  0014 905f          	clrw	y
 815  0016 9097          	ld	yl,a
 816  0018 d6540c        	ld	a,(21516,x)
 817  001b 90da0000      	or	a,(_bLF_DEF,y)
 818  001f d7540c        	ld	(21516,x),a
 821  0022 0c02          	inc	(OFST+0,sp)
 824  0024 7b02          	ld	a,(OFST+0,sp)
 825  0026 a10c          	cp	a,#12
 826  0028 25da          	jrult	L34
 830  002a 85            	popw	x
 831  002b 87            	retf	
 872                     ; 374 LCD_DISP_FUNC_1(lcd_disp_cnt_host, 9, _cnt_host)
 873                     .text:	section	.text,new
 874  0000               f_lcd_disp_cnt_host:
 876  0000 89            	pushw	x
 877       00000002      OFST:	set	2
 880  0001 4f            	clr	a
 881  0002 6b02          	ld	(OFST+0,sp),a
 882  0004               L76:
 885  0004 5f            	clrw	x
 886  0005 97            	ld	xl,a
 887  0006 d60262        	ld	a,(__cnt_host,x)
 888  0009 6b01          	ld	(OFST-1,sp),a
 891  000b 5f            	clrw	x
 892  000c 97            	ld	xl,a
 893  000d d60048        	ld	a,(_iLF_DEF,x)
 894  0010 5f            	clrw	x
 895  0011 97            	ld	xl,a
 896  0012 7b01          	ld	a,(OFST-1,sp)
 897  0014 905f          	clrw	y
 898  0016 9097          	ld	yl,a
 899  0018 d6540c        	ld	a,(21516,x)
 900  001b 90da0000      	or	a,(_bLF_DEF,y)
 901  001f d7540c        	ld	(21516,x),a
 904  0022 0c02          	inc	(OFST+0,sp)
 907  0024 7b02          	ld	a,(OFST+0,sp)
 908  0026 a109          	cp	a,#9
 909  0028 25da          	jrult	L76
 913  002a 85            	popw	x
 914  002b 87            	retf	
 955                     ; 375 LCD_DISP_FUNC_1(lcd_disp_cnt_sub, 8, _cnt_sub)
 956                     .text:	section	.text,new
 957  0000               f_lcd_disp_cnt_sub:
 959  0000 89            	pushw	x
 960       00000002      OFST:	set	2
 963  0001 4f            	clr	a
 964  0002 6b02          	ld	(OFST+0,sp),a
 965  0004               L311:
 968  0004 5f            	clrw	x
 969  0005 97            	ld	xl,a
 970  0006 d6026b        	ld	a,(__cnt_sub,x)
 971  0009 6b01          	ld	(OFST-1,sp),a
 974  000b 5f            	clrw	x
 975  000c 97            	ld	xl,a
 976  000d d60048        	ld	a,(_iLF_DEF,x)
 977  0010 5f            	clrw	x
 978  0011 97            	ld	xl,a
 979  0012 7b01          	ld	a,(OFST-1,sp)
 980  0014 905f          	clrw	y
 981  0016 9097          	ld	yl,a
 982  0018 d6540c        	ld	a,(21516,x)
 983  001b 90da0000      	or	a,(_bLF_DEF,y)
 984  001f d7540c        	ld	(21516,x),a
 987  0022 0c02          	inc	(OFST+0,sp)
 990  0024 7b02          	ld	a,(OFST+0,sp)
 991  0026 a108          	cp	a,#8
 992  0028 25da          	jrult	L311
 996  002a 85            	popw	x
 997  002b 87            	retf	
1038                     ; 377 LCD_DISP_FUNC_1(lcd_disp_mir1, 7, _mir1)
1039                     .text:	section	.text,new
1040  0000               f_lcd_disp_mir1:
1042  0000 89            	pushw	x
1043       00000002      OFST:	set	2
1046  0001 4f            	clr	a
1047  0002 6b02          	ld	(OFST+0,sp),a
1048  0004               L731:
1051  0004 5f            	clrw	x
1052  0005 97            	ld	xl,a
1053  0006 d60221        	ld	a,(__mir1,x)
1054  0009 6b01          	ld	(OFST-1,sp),a
1057  000b 5f            	clrw	x
1058  000c 97            	ld	xl,a
1059  000d d60048        	ld	a,(_iLF_DEF,x)
1060  0010 5f            	clrw	x
1061  0011 97            	ld	xl,a
1062  0012 7b01          	ld	a,(OFST-1,sp)
1063  0014 905f          	clrw	y
1064  0016 9097          	ld	yl,a
1065  0018 d6540c        	ld	a,(21516,x)
1066  001b 90da0000      	or	a,(_bLF_DEF,y)
1067  001f d7540c        	ld	(21516,x),a
1070  0022 0c02          	inc	(OFST+0,sp)
1073  0024 7b02          	ld	a,(OFST+0,sp)
1074  0026 a107          	cp	a,#7
1075  0028 25da          	jrult	L731
1079  002a 85            	popw	x
1080  002b 87            	retf	
1121                     ; 378 LCD_DISP_FUNC_1(lcd_disp_mir2, 10, _mir2)
1122                     .text:	section	.text,new
1123  0000               f_lcd_disp_mir2:
1125  0000 89            	pushw	x
1126       00000002      OFST:	set	2
1129  0001 4f            	clr	a
1130  0002 6b02          	ld	(OFST+0,sp),a
1131  0004               L361:
1134  0004 5f            	clrw	x
1135  0005 97            	ld	xl,a
1136  0006 d60228        	ld	a,(__mir2,x)
1137  0009 6b01          	ld	(OFST-1,sp),a
1140  000b 5f            	clrw	x
1141  000c 97            	ld	xl,a
1142  000d d60048        	ld	a,(_iLF_DEF,x)
1143  0010 5f            	clrw	x
1144  0011 97            	ld	xl,a
1145  0012 7b01          	ld	a,(OFST-1,sp)
1146  0014 905f          	clrw	y
1147  0016 9097          	ld	yl,a
1148  0018 d6540c        	ld	a,(21516,x)
1149  001b 90da0000      	or	a,(_bLF_DEF,y)
1150  001f d7540c        	ld	(21516,x),a
1153  0022 0c02          	inc	(OFST+0,sp)
1156  0024 7b02          	ld	a,(OFST+0,sp)
1157  0026 a10a          	cp	a,#10
1158  0028 25da          	jrult	L361
1162  002a 85            	popw	x
1163  002b 87            	retf	
1204                     ; 379 LCD_DISP_FUNC_1(lcd_disp_freset, 6, _freset)
1205                     .text:	section	.text,new
1206  0000               f_lcd_disp_freset:
1208  0000 89            	pushw	x
1209       00000002      OFST:	set	2
1212  0001 4f            	clr	a
1213  0002 6b02          	ld	(OFST+0,sp),a
1214  0004               L702:
1217  0004 5f            	clrw	x
1218  0005 97            	ld	xl,a
1219  0006 d60232        	ld	a,(__freset,x)
1220  0009 6b01          	ld	(OFST-1,sp),a
1223  000b 5f            	clrw	x
1224  000c 97            	ld	xl,a
1225  000d d60048        	ld	a,(_iLF_DEF,x)
1226  0010 5f            	clrw	x
1227  0011 97            	ld	xl,a
1228  0012 7b01          	ld	a,(OFST-1,sp)
1229  0014 905f          	clrw	y
1230  0016 9097          	ld	yl,a
1231  0018 d6540c        	ld	a,(21516,x)
1232  001b 90da0000      	or	a,(_bLF_DEF,y)
1233  001f d7540c        	ld	(21516,x),a
1236  0022 0c02          	inc	(OFST+0,sp)
1239  0024 7b02          	ld	a,(OFST+0,sp)
1240  0026 a106          	cp	a,#6
1241  0028 25da          	jrult	L702
1245  002a 85            	popw	x
1246  002b 87            	retf	
1288                     ; 381 LCD_DISP_FUNC(lcd_disp_backlight, 8, _bL)
1289                     .text:	section	.text,new
1290  0000               f_lcd_disp_backlight:
1292  0000 89            	pushw	x
1293       00000002      OFST:	set	2
1298  0001 8d000000      	callf	f_lcd_clear_n
1301  0005 4f            	clr	a
1302  0006 6b02          	ld	(OFST+0,sp),a
1303  0008               L332:
1306  0008 5f            	clrw	x
1307  0009 97            	ld	xl,a
1308  000a d601bf        	ld	a,(__bL,x)
1309  000d 6b01          	ld	(OFST-1,sp),a
1312  000f 5f            	clrw	x
1313  0010 97            	ld	xl,a
1314  0011 d60048        	ld	a,(_iLF_DEF,x)
1315  0014 5f            	clrw	x
1316  0015 97            	ld	xl,a
1317  0016 7b01          	ld	a,(OFST-1,sp)
1318  0018 905f          	clrw	y
1319  001a 9097          	ld	yl,a
1320  001c d6540c        	ld	a,(21516,x)
1321  001f 90da0000      	or	a,(_bLF_DEF,y)
1322  0023 d7540c        	ld	(21516,x),a
1325  0026 0c02          	inc	(OFST+0,sp)
1328  0028 7b02          	ld	a,(OFST+0,sp)
1329  002a a108          	cp	a,#8
1330  002c 25da          	jrult	L332
1334  002e 85            	popw	x
1335  002f 87            	retf	
1377                     ; 383 LCD_DISP_FUNC(lcd_disp_setup_lpm, 8, _lpm)
1378                     .text:	section	.text,new
1379  0000               f_lcd_disp_setup_lpm:
1381  0000 89            	pushw	x
1382       00000002      OFST:	set	2
1387  0001 8d000000      	callf	f_lcd_clear_n
1390  0005 4f            	clr	a
1391  0006 6b02          	ld	(OFST+0,sp),a
1392  0008               L752:
1395  0008 5f            	clrw	x
1396  0009 97            	ld	xl,a
1397  000a d6025a        	ld	a,(__lpm,x)
1398  000d 6b01          	ld	(OFST-1,sp),a
1401  000f 5f            	clrw	x
1402  0010 97            	ld	xl,a
1403  0011 d60048        	ld	a,(_iLF_DEF,x)
1404  0014 5f            	clrw	x
1405  0015 97            	ld	xl,a
1406  0016 7b01          	ld	a,(OFST-1,sp)
1407  0018 905f          	clrw	y
1408  001a 9097          	ld	yl,a
1409  001c d6540c        	ld	a,(21516,x)
1410  001f 90da0000      	or	a,(_bLF_DEF,y)
1411  0023 d7540c        	ld	(21516,x),a
1414  0026 0c02          	inc	(OFST+0,sp)
1417  0028 7b02          	ld	a,(OFST+0,sp)
1418  002a a108          	cp	a,#8
1419  002c 25da          	jrult	L752
1423  002e 85            	popw	x
1424  002f 87            	retf	
1467                     ; 384 LCD_DISP_FUNC(lcd_disp_setup_temp_offset, 4, _temp_offset)
1468                     .text:	section	.text,new
1469  0000               f_lcd_disp_setup_temp_offset:
1471  0000 89            	pushw	x
1472       00000002      OFST:	set	2
1477  0001 8d000000      	callf	f_lcd_clear_n
1480  0005 4f            	clr	a
1481  0006 6b02          	ld	(OFST+0,sp),a
1482  0008               L303:
1485  0008 5f            	clrw	x
1486  0009 97            	ld	xl,a
1487  000a d60256        	ld	a,(__temp_offset,x)
1488  000d 6b01          	ld	(OFST-1,sp),a
1491  000f 5f            	clrw	x
1492  0010 97            	ld	xl,a
1493  0011 d60048        	ld	a,(_iLF_DEF,x)
1494  0014 5f            	clrw	x
1495  0015 97            	ld	xl,a
1496  0016 7b01          	ld	a,(OFST-1,sp)
1497  0018 905f          	clrw	y
1498  001a 9097          	ld	yl,a
1499  001c d6540c        	ld	a,(21516,x)
1500  001f 90da0000      	or	a,(_bLF_DEF,y)
1501  0023 d7540c        	ld	(21516,x),a
1504  0026 0c02          	inc	(OFST+0,sp)
1507  0028 7b02          	ld	a,(OFST+0,sp)
1508  002a a104          	cp	a,#4
1509  002c 25da          	jrult	L303
1513  002e 85            	popw	x
1514  002f 87            	retf	
1557                     ; 386 LCD_DISP_FUNC(lcd_disp_setup_po_type, 9, _po_type)
1558                     .text:	section	.text,new
1559  0000               f_lcd_disp_setup_po_type:
1561  0000 89            	pushw	x
1562       00000002      OFST:	set	2
1567  0001 8d000000      	callf	f_lcd_clear_n
1570  0005 4f            	clr	a
1571  0006 6b02          	ld	(OFST+0,sp),a
1572  0008               L723:
1575  0008 5f            	clrw	x
1576  0009 97            	ld	xl,a
1577  000a d6023b        	ld	a,(__po_type,x)
1578  000d 6b01          	ld	(OFST-1,sp),a
1581  000f 5f            	clrw	x
1582  0010 97            	ld	xl,a
1583  0011 d60048        	ld	a,(_iLF_DEF,x)
1584  0014 5f            	clrw	x
1585  0015 97            	ld	xl,a
1586  0016 7b01          	ld	a,(OFST-1,sp)
1587  0018 905f          	clrw	y
1588  001a 9097          	ld	yl,a
1589  001c d6540c        	ld	a,(21516,x)
1590  001f 90da0000      	or	a,(_bLF_DEF,y)
1591  0023 d7540c        	ld	(21516,x),a
1594  0026 0c02          	inc	(OFST+0,sp)
1597  0028 7b02          	ld	a,(OFST+0,sp)
1598  002a a109          	cp	a,#9
1599  002c 25da          	jrult	L723
1603  002e 85            	popw	x
1604  002f 87            	retf	
1646                     ; 387 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_xl, 8, _po_type_xl)
1647                     .text:	section	.text,new
1648  0000               f_lcd_disp_setup_po_type_xl:
1650  0000 89            	pushw	x
1651       00000002      OFST:	set	2
1654  0001 4f            	clr	a
1655  0002 6b02          	ld	(OFST+0,sp),a
1656  0004               L353:
1659  0004 5f            	clrw	x
1660  0005 97            	ld	xl,a
1661  0006 d60244        	ld	a,(__po_type_xl,x)
1662  0009 6b01          	ld	(OFST-1,sp),a
1665  000b 5f            	clrw	x
1666  000c 97            	ld	xl,a
1667  000d d60048        	ld	a,(_iLF_DEF,x)
1668  0010 5f            	clrw	x
1669  0011 97            	ld	xl,a
1670  0012 7b01          	ld	a,(OFST-1,sp)
1671  0014 905f          	clrw	y
1672  0016 9097          	ld	yl,a
1673  0018 d6540c        	ld	a,(21516,x)
1674  001b 90da0000      	or	a,(_bLF_DEF,y)
1675  001f d7540c        	ld	(21516,x),a
1678  0022 0c02          	inc	(OFST+0,sp)
1681  0024 7b02          	ld	a,(OFST+0,sp)
1682  0026 a108          	cp	a,#8
1683  0028 25da          	jrult	L353
1687  002a 85            	popw	x
1688  002b 87            	retf	
1730                     ; 388 LCD_DISP_FUNC_1(lcd_disp_setup_po_type_pb, 10, _po_type_pb)
1731                     .text:	section	.text,new
1732  0000               f_lcd_disp_setup_po_type_pb:
1734  0000 89            	pushw	x
1735       00000002      OFST:	set	2
1738  0001 4f            	clr	a
1739  0002 6b02          	ld	(OFST+0,sp),a
1740  0004               L773:
1743  0004 5f            	clrw	x
1744  0005 97            	ld	xl,a
1745  0006 d6024c        	ld	a,(__po_type_pb,x)
1746  0009 6b01          	ld	(OFST-1,sp),a
1749  000b 5f            	clrw	x
1750  000c 97            	ld	xl,a
1751  000d d60048        	ld	a,(_iLF_DEF,x)
1752  0010 5f            	clrw	x
1753  0011 97            	ld	xl,a
1754  0012 7b01          	ld	a,(OFST-1,sp)
1755  0014 905f          	clrw	y
1756  0016 9097          	ld	yl,a
1757  0018 d6540c        	ld	a,(21516,x)
1758  001b 90da0000      	or	a,(_bLF_DEF,y)
1759  001f d7540c        	ld	(21516,x),a
1762  0022 0c02          	inc	(OFST+0,sp)
1765  0024 7b02          	ld	a,(OFST+0,sp)
1766  0026 a10a          	cp	a,#10
1767  0028 25da          	jrult	L773
1771  002a 85            	popw	x
1772  002b 87            	retf	
1814                     ; 392 LCD_DISP_FUNC(lcd_disp_setup_len, 3, _len)
1815                     .text:	section	.text,new
1816  0000               f_lcd_disp_setup_len:
1818  0000 89            	pushw	x
1819       00000002      OFST:	set	2
1824  0001 8d000000      	callf	f_lcd_clear_n
1827  0005 4f            	clr	a
1828  0006 6b02          	ld	(OFST+0,sp),a
1829  0008               L324:
1832  0008 5f            	clrw	x
1833  0009 97            	ld	xl,a
1834  000a d60238        	ld	a,(__len,x)
1835  000d 6b01          	ld	(OFST-1,sp),a
1838  000f 5f            	clrw	x
1839  0010 97            	ld	xl,a
1840  0011 d60048        	ld	a,(_iLF_DEF,x)
1841  0014 5f            	clrw	x
1842  0015 97            	ld	xl,a
1843  0016 7b01          	ld	a,(OFST-1,sp)
1844  0018 905f          	clrw	y
1845  001a 9097          	ld	yl,a
1846  001c d6540c        	ld	a,(21516,x)
1847  001f 90da0000      	or	a,(_bLF_DEF,y)
1848  0023 d7540c        	ld	(21516,x),a
1851  0026 0c02          	inc	(OFST+0,sp)
1854  0028 7b02          	ld	a,(OFST+0,sp)
1855  002a a103          	cp	a,#3
1856  002c 25da          	jrult	L324
1860  002e 85            	popw	x
1861  002f 87            	retf	
1904                     ; 393 LCD_DISP_FUNC(lcd_disp_setup_cntl_op, 9, _cntl_op)
1905                     .text:	section	.text,new
1906  0000               f_lcd_disp_setup_cntl_op:
1908  0000 89            	pushw	x
1909       00000002      OFST:	set	2
1914  0001 8d000000      	callf	f_lcd_clear_n
1917  0005 4f            	clr	a
1918  0006 6b02          	ld	(OFST+0,sp),a
1919  0008               L744:
1922  0008 5f            	clrw	x
1923  0009 97            	ld	xl,a
1924  000a d60206        	ld	a,(__cntl_op,x)
1925  000d 6b01          	ld	(OFST-1,sp),a
1928  000f 5f            	clrw	x
1929  0010 97            	ld	xl,a
1930  0011 d60048        	ld	a,(_iLF_DEF,x)
1931  0014 5f            	clrw	x
1932  0015 97            	ld	xl,a
1933  0016 7b01          	ld	a,(OFST-1,sp)
1934  0018 905f          	clrw	y
1935  001a 9097          	ld	yl,a
1936  001c d6540c        	ld	a,(21516,x)
1937  001f 90da0000      	or	a,(_bLF_DEF,y)
1938  0023 d7540c        	ld	(21516,x),a
1941  0026 0c02          	inc	(OFST+0,sp)
1944  0028 7b02          	ld	a,(OFST+0,sp)
1945  002a a109          	cp	a,#9
1946  002c 25da          	jrult	L744
1950  002e 85            	popw	x
1951  002f 87            	retf	
1993                     ; 394 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_on, 8, _cntl_on)
1994                     .text:	section	.text,new
1995  0000               f_lcd_disp_setup_cntl_on:
1997  0000 89            	pushw	x
1998       00000002      OFST:	set	2
2001  0001 4f            	clr	a
2002  0002 6b02          	ld	(OFST+0,sp),a
2003  0004               L374:
2006  0004 5f            	clrw	x
2007  0005 97            	ld	xl,a
2008  0006 d601cd        	ld	a,(__cntl_on,x)
2009  0009 6b01          	ld	(OFST-1,sp),a
2012  000b 5f            	clrw	x
2013  000c 97            	ld	xl,a
2014  000d d60048        	ld	a,(_iLF_DEF,x)
2015  0010 5f            	clrw	x
2016  0011 97            	ld	xl,a
2017  0012 7b01          	ld	a,(OFST-1,sp)
2018  0014 905f          	clrw	y
2019  0016 9097          	ld	yl,a
2020  0018 d6540c        	ld	a,(21516,x)
2021  001b 90da0000      	or	a,(_bLF_DEF,y)
2022  001f d7540c        	ld	(21516,x),a
2025  0022 0c02          	inc	(OFST+0,sp)
2028  0024 7b02          	ld	a,(OFST+0,sp)
2029  0026 a108          	cp	a,#8
2030  0028 25da          	jrult	L374
2034  002a 85            	popw	x
2035  002b 87            	retf	
2077                     ; 395 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_po, 9, _cntl_po)
2078                     .text:	section	.text,new
2079  0000               f_lcd_disp_setup_cntl_po:
2081  0000 89            	pushw	x
2082       00000002      OFST:	set	2
2085  0001 4f            	clr	a
2086  0002 6b02          	ld	(OFST+0,sp),a
2087  0004               L715:
2090  0004 5f            	clrw	x
2091  0005 97            	ld	xl,a
2092  0006 d601d5        	ld	a,(__cntl_po,x)
2093  0009 6b01          	ld	(OFST-1,sp),a
2096  000b 5f            	clrw	x
2097  000c 97            	ld	xl,a
2098  000d d60048        	ld	a,(_iLF_DEF,x)
2099  0010 5f            	clrw	x
2100  0011 97            	ld	xl,a
2101  0012 7b01          	ld	a,(OFST-1,sp)
2102  0014 905f          	clrw	y
2103  0016 9097          	ld	yl,a
2104  0018 d6540c        	ld	a,(21516,x)
2105  001b 90da0000      	or	a,(_bLF_DEF,y)
2106  001f d7540c        	ld	(21516,x),a
2109  0022 0c02          	inc	(OFST+0,sp)
2112  0024 7b02          	ld	a,(OFST+0,sp)
2113  0026 a109          	cp	a,#9
2114  0028 25da          	jrult	L715
2118  002a 85            	popw	x
2119  002b 87            	retf	
2161                     ; 396 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_2motor, 10, _cntl_2motor)
2162                     .text:	section	.text,new
2163  0000               f_lcd_disp_setup_cntl_2motor:
2165  0000 89            	pushw	x
2166       00000002      OFST:	set	2
2169  0001 4f            	clr	a
2170  0002 6b02          	ld	(OFST+0,sp),a
2171  0004               L345:
2174  0004 5f            	clrw	x
2175  0005 97            	ld	xl,a
2176  0006 d6020f        	ld	a,(__cntl_2motor,x)
2177  0009 6b01          	ld	(OFST-1,sp),a
2180  000b 5f            	clrw	x
2181  000c 97            	ld	xl,a
2182  000d d60048        	ld	a,(_iLF_DEF,x)
2183  0010 5f            	clrw	x
2184  0011 97            	ld	xl,a
2185  0012 7b01          	ld	a,(OFST-1,sp)
2186  0014 905f          	clrw	y
2187  0016 9097          	ld	yl,a
2188  0018 d6540c        	ld	a,(21516,x)
2189  001b 90da0000      	or	a,(_bLF_DEF,y)
2190  001f d7540c        	ld	(21516,x),a
2193  0022 0c02          	inc	(OFST+0,sp)
2196  0024 7b02          	ld	a,(OFST+0,sp)
2197  0026 a10a          	cp	a,#10
2198  0028 25da          	jrult	L345
2202  002a 85            	popw	x
2203  002b 87            	retf	
2245                     ; 397 LCD_DISP_FUNC_1(lcd_disp_setup_cntl_tab, 8, _cntl_tab)
2246                     .text:	section	.text,new
2247  0000               f_lcd_disp_setup_cntl_tab:
2249  0000 89            	pushw	x
2250       00000002      OFST:	set	2
2253  0001 4f            	clr	a
2254  0002 6b02          	ld	(OFST+0,sp),a
2255  0004               L765:
2258  0004 5f            	clrw	x
2259  0005 97            	ld	xl,a
2260  0006 d60219        	ld	a,(__cntl_tab,x)
2261  0009 6b01          	ld	(OFST-1,sp),a
2264  000b 5f            	clrw	x
2265  000c 97            	ld	xl,a
2266  000d d60048        	ld	a,(_iLF_DEF,x)
2267  0010 5f            	clrw	x
2268  0011 97            	ld	xl,a
2269  0012 7b01          	ld	a,(OFST-1,sp)
2270  0014 905f          	clrw	y
2271  0016 9097          	ld	yl,a
2272  0018 d6540c        	ld	a,(21516,x)
2273  001b 90da0000      	or	a,(_bLF_DEF,y)
2274  001f d7540c        	ld	(21516,x),a
2277  0022 0c02          	inc	(OFST+0,sp)
2280  0024 7b02          	ld	a,(OFST+0,sp)
2281  0026 a108          	cp	a,#8
2282  0028 25da          	jrult	L765
2286  002a 85            	popw	x
2287  002b 87            	retf	
2329                     ; 399 LCD_DISP_FUNC(lcd_disp_setup_c, 1, _cc)
2330                     .text:	section	.text,new
2331  0000               f_lcd_disp_setup_c:
2333  0000 89            	pushw	x
2334       00000002      OFST:	set	2
2339  0001 8d000000      	callf	f_lcd_clear_n
2342  0005 0f02          	clr	(OFST+0,sp)
2343  0007               L316:
2346  0007 7b02          	ld	a,(OFST+0,sp)
2347  0009 5f            	clrw	x
2348  000a 97            	ld	xl,a
2349  000b d601cc        	ld	a,(__cc,x)
2350  000e 6b01          	ld	(OFST-1,sp),a
2353  0010 5f            	clrw	x
2354  0011 97            	ld	xl,a
2355  0012 d60048        	ld	a,(_iLF_DEF,x)
2356  0015 5f            	clrw	x
2357  0016 97            	ld	xl,a
2358  0017 7b01          	ld	a,(OFST-1,sp)
2359  0019 905f          	clrw	y
2360  001b 9097          	ld	yl,a
2361  001d d6540c        	ld	a,(21516,x)
2362  0020 90da0000      	or	a,(_bLF_DEF,y)
2363  0024 d7540c        	ld	(21516,x),a
2366  0027 0c02          	inc	(OFST+0,sp)
2369  0029 27dc          	jreq	L316
2373  002b 85            	popw	x
2374  002c 87            	retf	
2417                     ; 401 LCD_DISP_FUNC(lcd_disp_setup_link, 6, _link)
2418                     .text:	section	.text,new
2419  0000               f_lcd_disp_setup_link:
2421  0000 89            	pushw	x
2422       00000002      OFST:	set	2
2427  0001 8d000000      	callf	f_lcd_clear_n
2430  0005 4f            	clr	a
2431  0006 6b02          	ld	(OFST+0,sp),a
2432  0008               L736:
2435  0008 5f            	clrw	x
2436  0009 97            	ld	xl,a
2437  000a d60200        	ld	a,(__link,x)
2438  000d 6b01          	ld	(OFST-1,sp),a
2441  000f 5f            	clrw	x
2442  0010 97            	ld	xl,a
2443  0011 d60048        	ld	a,(_iLF_DEF,x)
2444  0014 5f            	clrw	x
2445  0015 97            	ld	xl,a
2446  0016 7b01          	ld	a,(OFST-1,sp)
2447  0018 905f          	clrw	y
2448  001a 9097          	ld	yl,a
2449  001c d6540c        	ld	a,(21516,x)
2450  001f 90da0000      	or	a,(_bLF_DEF,y)
2451  0023 d7540c        	ld	(21516,x),a
2454  0026 0c02          	inc	(OFST+0,sp)
2457  0028 7b02          	ld	a,(OFST+0,sp)
2458  002a a106          	cp	a,#6
2459  002c 25da          	jrult	L736
2463  002e 85            	popw	x
2464  002f 87            	retf	
2506                     ; 403 LCD_DISP_FUNC(lcd_disp_setup_run, 8, _run)
2507                     .text:	section	.text,new
2508  0000               f_lcd_disp_setup_run:
2510  0000 89            	pushw	x
2511       00000002      OFST:	set	2
2516  0001 8d000000      	callf	f_lcd_clear_n
2519  0005 4f            	clr	a
2520  0006 6b02          	ld	(OFST+0,sp),a
2521  0008               L366:
2524  0008 5f            	clrw	x
2525  0009 97            	ld	xl,a
2526  000a d601f0        	ld	a,(__run,x)
2527  000d 6b01          	ld	(OFST-1,sp),a
2530  000f 5f            	clrw	x
2531  0010 97            	ld	xl,a
2532  0011 d60048        	ld	a,(_iLF_DEF,x)
2533  0014 5f            	clrw	x
2534  0015 97            	ld	xl,a
2535  0016 7b01          	ld	a,(OFST-1,sp)
2536  0018 905f          	clrw	y
2537  001a 9097          	ld	yl,a
2538  001c d6540c        	ld	a,(21516,x)
2539  001f 90da0000      	or	a,(_bLF_DEF,y)
2540  0023 d7540c        	ld	(21516,x),a
2543  0026 0c02          	inc	(OFST+0,sp)
2546  0028 7b02          	ld	a,(OFST+0,sp)
2547  002a a108          	cp	a,#8
2548  002c 25da          	jrult	L366
2552  002e 85            	popw	x
2553  002f 87            	retf	
2595                     ; 405 LCD_DISP_FUNC_1(lcd_disp_setup_mode_local, 7, _hcLocal)
2596                     .text:	section	.text,new
2597  0000               f_lcd_disp_setup_mode_local:
2599  0000 89            	pushw	x
2600       00000002      OFST:	set	2
2603  0001 4f            	clr	a
2604  0002 6b02          	ld	(OFST+0,sp),a
2605  0004               L707:
2608  0004 5f            	clrw	x
2609  0005 97            	ld	xl,a
2610  0006 d601de        	ld	a,(__hcLocal,x)
2611  0009 6b01          	ld	(OFST-1,sp),a
2614  000b 5f            	clrw	x
2615  000c 97            	ld	xl,a
2616  000d d60048        	ld	a,(_iLF_DEF,x)
2617  0010 5f            	clrw	x
2618  0011 97            	ld	xl,a
2619  0012 7b01          	ld	a,(OFST-1,sp)
2620  0014 905f          	clrw	y
2621  0016 9097          	ld	yl,a
2622  0018 d6540c        	ld	a,(21516,x)
2623  001b 90da0000      	or	a,(_bLF_DEF,y)
2624  001f d7540c        	ld	(21516,x),a
2627  0022 0c02          	inc	(OFST+0,sp)
2630  0024 7b02          	ld	a,(OFST+0,sp)
2631  0026 a107          	cp	a,#7
2632  0028 25da          	jrult	L707
2636  002a 85            	popw	x
2637  002b 87            	retf	
2679                     ; 406 LCD_DISP_FUNC_1(lcd_disp_setup_mode_each, 11, _hcEach)
2680                     .text:	section	.text,new
2681  0000               f_lcd_disp_setup_mode_each:
2683  0000 89            	pushw	x
2684       00000002      OFST:	set	2
2687  0001 4f            	clr	a
2688  0002 6b02          	ld	(OFST+0,sp),a
2689  0004               L337:
2692  0004 5f            	clrw	x
2693  0005 97            	ld	xl,a
2694  0006 d601e5        	ld	a,(__hcEach,x)
2695  0009 6b01          	ld	(OFST-1,sp),a
2698  000b 5f            	clrw	x
2699  000c 97            	ld	xl,a
2700  000d d60048        	ld	a,(_iLF_DEF,x)
2701  0010 5f            	clrw	x
2702  0011 97            	ld	xl,a
2703  0012 7b01          	ld	a,(OFST-1,sp)
2704  0014 905f          	clrw	y
2705  0016 9097          	ld	yl,a
2706  0018 d6540c        	ld	a,(21516,x)
2707  001b 90da0000      	or	a,(_bLF_DEF,y)
2708  001f d7540c        	ld	(21516,x),a
2711  0022 0c02          	inc	(OFST+0,sp)
2714  0024 7b02          	ld	a,(OFST+0,sp)
2715  0026 a10b          	cp	a,#11
2716  0028 25da          	jrult	L337
2720  002a 85            	popw	x
2721  002b 87            	retf	
2764                     ; 407 LCD_DISP_FUNC(lcd_disp_setup_mode, 8, _hc)
2765                     .text:	section	.text,new
2766  0000               f_lcd_disp_setup_mode:
2768  0000 89            	pushw	x
2769       00000002      OFST:	set	2
2774  0001 8d000000      	callf	f_lcd_clear_n
2777  0005 4f            	clr	a
2778  0006 6b02          	ld	(OFST+0,sp),a
2779  0008               L757:
2782  0008 5f            	clrw	x
2783  0009 97            	ld	xl,a
2784  000a d601f8        	ld	a,(__hc,x)
2785  000d 6b01          	ld	(OFST-1,sp),a
2788  000f 5f            	clrw	x
2789  0010 97            	ld	xl,a
2790  0011 d60048        	ld	a,(_iLF_DEF,x)
2791  0014 5f            	clrw	x
2792  0015 97            	ld	xl,a
2793  0016 7b01          	ld	a,(OFST-1,sp)
2794  0018 905f          	clrw	y
2795  001a 9097          	ld	yl,a
2796  001c d6540c        	ld	a,(21516,x)
2797  001f 90da0000      	or	a,(_bLF_DEF,y)
2798  0023 d7540c        	ld	(21516,x),a
2801  0026 0c02          	inc	(OFST+0,sp)
2804  0028 7b02          	ld	a,(OFST+0,sp)
2805  002a a108          	cp	a,#8
2806  002c 25da          	jrult	L757
2810  002e 85            	popw	x
2811  002f 87            	retf	
2853                     ; 409 LCD_DISP_FUNC(lcd_disp_setup_id, 6, _nid)
2854                     .text:	section	.text,new
2855  0000               f_lcd_disp_setup_id:
2857  0000 89            	pushw	x
2858       00000002      OFST:	set	2
2863  0001 8d000000      	callf	f_lcd_clear_n
2866  0005 4f            	clr	a
2867  0006 6b02          	ld	(OFST+0,sp),a
2868  0008               L3001:
2871  0008 5f            	clrw	x
2872  0009 97            	ld	xl,a
2873  000a d601a6        	ld	a,(__nid,x)
2874  000d 6b01          	ld	(OFST-1,sp),a
2877  000f 5f            	clrw	x
2878  0010 97            	ld	xl,a
2879  0011 d60048        	ld	a,(_iLF_DEF,x)
2880  0014 5f            	clrw	x
2881  0015 97            	ld	xl,a
2882  0016 7b01          	ld	a,(OFST-1,sp)
2883  0018 905f          	clrw	y
2884  001a 9097          	ld	yl,a
2885  001c d6540c        	ld	a,(21516,x)
2886  001f 90da0000      	or	a,(_bLF_DEF,y)
2887  0023 d7540c        	ld	(21516,x),a
2890  0026 0c02          	inc	(OFST+0,sp)
2893  0028 7b02          	ld	a,(OFST+0,sp)
2894  002a a106          	cp	a,#6
2895  002c 25da          	jrult	L3001
2899  002e 85            	popw	x
2900  002f 87            	retf	
2942                     ; 410 LCD_DISP_FUNC(lcd_disp_setup_m, 3, _nm)
2943                     .text:	section	.text,new
2944  0000               f_lcd_disp_setup_m:
2946  0000 89            	pushw	x
2947       00000002      OFST:	set	2
2952  0001 8d000000      	callf	f_lcd_clear_n
2955  0005 4f            	clr	a
2956  0006 6b02          	ld	(OFST+0,sp),a
2957  0008               L7201:
2960  0008 5f            	clrw	x
2961  0009 97            	ld	xl,a
2962  000a d6016d        	ld	a,(__nm,x)
2963  000d 6b01          	ld	(OFST-1,sp),a
2966  000f 5f            	clrw	x
2967  0010 97            	ld	xl,a
2968  0011 d60048        	ld	a,(_iLF_DEF,x)
2969  0014 5f            	clrw	x
2970  0015 97            	ld	xl,a
2971  0016 7b01          	ld	a,(OFST-1,sp)
2972  0018 905f          	clrw	y
2973  001a 9097          	ld	yl,a
2974  001c d6540c        	ld	a,(21516,x)
2975  001f 90da0000      	or	a,(_bLF_DEF,y)
2976  0023 d7540c        	ld	(21516,x),a
2979  0026 0c02          	inc	(OFST+0,sp)
2982  0028 7b02          	ld	a,(OFST+0,sp)
2983  002a a103          	cp	a,#3
2984  002c 25da          	jrult	L7201
2988  002e 85            	popw	x
2989  002f 87            	retf	
3031                     ; 411 LCD_DISP_FUNC(lcd_disp_setup_cnt, 6, _ncnt)
3032                     .text:	section	.text,new
3033  0000               f_lcd_disp_setup_cnt:
3035  0000 89            	pushw	x
3036       00000002      OFST:	set	2
3041  0001 8d000000      	callf	f_lcd_clear_n
3044  0005 4f            	clr	a
3045  0006 6b02          	ld	(OFST+0,sp),a
3046  0008               L3501:
3049  0008 5f            	clrw	x
3050  0009 97            	ld	xl,a
3051  000a d60170        	ld	a,(__ncnt,x)
3052  000d 6b01          	ld	(OFST-1,sp),a
3055  000f 5f            	clrw	x
3056  0010 97            	ld	xl,a
3057  0011 d60048        	ld	a,(_iLF_DEF,x)
3058  0014 5f            	clrw	x
3059  0015 97            	ld	xl,a
3060  0016 7b01          	ld	a,(OFST-1,sp)
3061  0018 905f          	clrw	y
3062  001a 9097          	ld	yl,a
3063  001c d6540c        	ld	a,(21516,x)
3064  001f 90da0000      	or	a,(_bLF_DEF,y)
3065  0023 d7540c        	ld	(21516,x),a
3068  0026 0c02          	inc	(OFST+0,sp)
3071  0028 7b02          	ld	a,(OFST+0,sp)
3072  002a a106          	cp	a,#6
3073  002c 25da          	jrult	L3501
3077  002e 85            	popw	x
3078  002f 87            	retf	
3121                     ; 412 LCD_DISP_FUNC(lcd_disp_setup_valve, 6, _nvalve)
3122                     .text:	section	.text,new
3123  0000               f_lcd_disp_setup_valve:
3125  0000 89            	pushw	x
3126       00000002      OFST:	set	2
3131  0001 8d000000      	callf	f_lcd_clear_n
3134  0005 4f            	clr	a
3135  0006 6b02          	ld	(OFST+0,sp),a
3136  0008               L7701:
3139  0008 5f            	clrw	x
3140  0009 97            	ld	xl,a
3141  000a d60176        	ld	a,(__nvalve,x)
3142  000d 6b01          	ld	(OFST-1,sp),a
3145  000f 5f            	clrw	x
3146  0010 97            	ld	xl,a
3147  0011 d60048        	ld	a,(_iLF_DEF,x)
3148  0014 5f            	clrw	x
3149  0015 97            	ld	xl,a
3150  0016 7b01          	ld	a,(OFST-1,sp)
3151  0018 905f          	clrw	y
3152  001a 9097          	ld	yl,a
3153  001c d6540c        	ld	a,(21516,x)
3154  001f 90da0000      	or	a,(_bLF_DEF,y)
3155  0023 d7540c        	ld	(21516,x),a
3158  0026 0c02          	inc	(OFST+0,sp)
3161  0028 7b02          	ld	a,(OFST+0,sp)
3162  002a a106          	cp	a,#6
3163  002c 25da          	jrult	L7701
3167  002e 85            	popw	x
3168  002f 87            	retf	
3210                     ; 414 LCD_CLEAR_FUNC(lcd_clear_backlight, 8, _bL)
3211                     .text:	section	.text,new
3212  0000               f_lcd_clear_backlight:
3214  0000 89            	pushw	x
3215       00000002      OFST:	set	2
3218  0001 4f            	clr	a
3219  0002 6b02          	ld	(OFST+0,sp),a
3220  0004               L3211:
3223  0004 5f            	clrw	x
3224  0005 97            	ld	xl,a
3225  0006 d601bf        	ld	a,(__bL,x)
3226  0009 6b01          	ld	(OFST-1,sp),a
3229  000b 5f            	clrw	x
3230  000c 97            	ld	xl,a
3231  000d d60048        	ld	a,(_iLF_DEF,x)
3232  0010 5f            	clrw	x
3233  0011 97            	ld	xl,a
3234  0012 7b01          	ld	a,(OFST-1,sp)
3235  0014 905f          	clrw	y
3236  0016 9097          	ld	yl,a
3237  0018 90d60000      	ld	a,(_bLF_DEF,y)
3238  001c 43            	cpl	a
3239  001d d4540c        	and	a,(21516,x)
3240  0020 d7540c        	ld	(21516,x),a
3243  0023 0c02          	inc	(OFST+0,sp)
3246  0025 7b02          	ld	a,(OFST+0,sp)
3247  0027 a108          	cp	a,#8
3248  0029 25d9          	jrult	L3211
3252  002b 85            	popw	x
3253  002c 87            	retf	
3294                     ; 415 LCD_CLEAR_FUNC(lcd_clear_c, 4, _cc)
3295                     .text:	section	.text,new
3296  0000               f_lcd_clear_c:
3298  0000 89            	pushw	x
3299       00000002      OFST:	set	2
3302  0001 4f            	clr	a
3303  0002 6b02          	ld	(OFST+0,sp),a
3304  0004               L7411:
3307  0004 5f            	clrw	x
3308  0005 97            	ld	xl,a
3309  0006 d601cc        	ld	a,(__cc,x)
3310  0009 6b01          	ld	(OFST-1,sp),a
3313  000b 5f            	clrw	x
3314  000c 97            	ld	xl,a
3315  000d d60048        	ld	a,(_iLF_DEF,x)
3316  0010 5f            	clrw	x
3317  0011 97            	ld	xl,a
3318  0012 7b01          	ld	a,(OFST-1,sp)
3319  0014 905f          	clrw	y
3320  0016 9097          	ld	yl,a
3321  0018 90d60000      	ld	a,(_bLF_DEF,y)
3322  001c 43            	cpl	a
3323  001d d4540c        	and	a,(21516,x)
3324  0020 d7540c        	ld	(21516,x),a
3327  0023 0c02          	inc	(OFST+0,sp)
3330  0025 7b02          	ld	a,(OFST+0,sp)
3331  0027 a104          	cp	a,#4
3332  0029 25d9          	jrult	L7411
3336  002b 85            	popw	x
3337  002c 87            	retf	
3378                     ; 417 LCD_CLEAR_FUNC(lcd_clear_btn, 5, _btn)
3379                     .text:	section	.text,new
3380  0000               f_lcd_clear_btn:
3382  0000 89            	pushw	x
3383       00000002      OFST:	set	2
3386  0001 4f            	clr	a
3387  0002 6b02          	ld	(OFST+0,sp),a
3388  0004               L3711:
3391  0004 5f            	clrw	x
3392  0005 97            	ld	xl,a
3393  0006 d601c7        	ld	a,(__btn,x)
3394  0009 6b01          	ld	(OFST-1,sp),a
3397  000b 5f            	clrw	x
3398  000c 97            	ld	xl,a
3399  000d d60048        	ld	a,(_iLF_DEF,x)
3400  0010 5f            	clrw	x
3401  0011 97            	ld	xl,a
3402  0012 7b01          	ld	a,(OFST-1,sp)
3403  0014 905f          	clrw	y
3404  0016 9097          	ld	yl,a
3405  0018 90d60000      	ld	a,(_bLF_DEF,y)
3406  001c 43            	cpl	a
3407  001d d4540c        	and	a,(21516,x)
3408  0020 d7540c        	ld	(21516,x),a
3411  0023 0c02          	inc	(OFST+0,sp)
3414  0025 7b02          	ld	a,(OFST+0,sp)
3415  0027 a105          	cp	a,#5
3416  0029 25d9          	jrult	L3711
3420  002b 85            	popw	x
3421  002c 87            	retf	
3462                     ; 418 LCD_CLEAR_FUNC(lcd_clear_run, 8, _run)
3463                     .text:	section	.text,new
3464  0000               f_lcd_clear_run:
3466  0000 89            	pushw	x
3467       00000002      OFST:	set	2
3470  0001 4f            	clr	a
3471  0002 6b02          	ld	(OFST+0,sp),a
3472  0004               L7121:
3475  0004 5f            	clrw	x
3476  0005 97            	ld	xl,a
3477  0006 d601f0        	ld	a,(__run,x)
3478  0009 6b01          	ld	(OFST-1,sp),a
3481  000b 5f            	clrw	x
3482  000c 97            	ld	xl,a
3483  000d d60048        	ld	a,(_iLF_DEF,x)
3484  0010 5f            	clrw	x
3485  0011 97            	ld	xl,a
3486  0012 7b01          	ld	a,(OFST-1,sp)
3487  0014 905f          	clrw	y
3488  0016 9097          	ld	yl,a
3489  0018 90d60000      	ld	a,(_bLF_DEF,y)
3490  001c 43            	cpl	a
3491  001d d4540c        	and	a,(21516,x)
3492  0020 d7540c        	ld	(21516,x),a
3495  0023 0c02          	inc	(OFST+0,sp)
3498  0025 7b02          	ld	a,(OFST+0,sp)
3499  0027 a108          	cp	a,#8
3500  0029 25d9          	jrult	L7121
3504  002b 85            	popw	x
3505  002c 87            	retf	
3546                     ; 419 LCD_CLEAR_FUNC(lcd_clear_mode, 8, _hc)
3547                     .text:	section	.text,new
3548  0000               f_lcd_clear_mode:
3550  0000 89            	pushw	x
3551       00000002      OFST:	set	2
3554  0001 4f            	clr	a
3555  0002 6b02          	ld	(OFST+0,sp),a
3556  0004               L3421:
3559  0004 5f            	clrw	x
3560  0005 97            	ld	xl,a
3561  0006 d601f8        	ld	a,(__hc,x)
3562  0009 6b01          	ld	(OFST-1,sp),a
3565  000b 5f            	clrw	x
3566  000c 97            	ld	xl,a
3567  000d d60048        	ld	a,(_iLF_DEF,x)
3568  0010 5f            	clrw	x
3569  0011 97            	ld	xl,a
3570  0012 7b01          	ld	a,(OFST-1,sp)
3571  0014 905f          	clrw	y
3572  0016 9097          	ld	yl,a
3573  0018 90d60000      	ld	a,(_bLF_DEF,y)
3574  001c 43            	cpl	a
3575  001d d4540c        	and	a,(21516,x)
3576  0020 d7540c        	ld	(21516,x),a
3579  0023 0c02          	inc	(OFST+0,sp)
3582  0025 7b02          	ld	a,(OFST+0,sp)
3583  0027 a108          	cp	a,#8
3584  0029 25d9          	jrult	L3421
3588  002b 85            	popw	x
3589  002c 87            	retf	
3630                     ; 421 LCD_CLEAR_FUNC(lcd_clear_info, 3, _info)
3631                     .text:	section	.text,new
3632  0000               f_lcd_clear_info:
3634  0000 89            	pushw	x
3635       00000002      OFST:	set	2
3638  0001 4f            	clr	a
3639  0002 6b02          	ld	(OFST+0,sp),a
3640  0004               L7621:
3643  0004 5f            	clrw	x
3644  0005 97            	ld	xl,a
3645  0006 d601ac        	ld	a,(__info,x)
3646  0009 6b01          	ld	(OFST-1,sp),a
3649  000b 5f            	clrw	x
3650  000c 97            	ld	xl,a
3651  000d d60048        	ld	a,(_iLF_DEF,x)
3652  0010 5f            	clrw	x
3653  0011 97            	ld	xl,a
3654  0012 7b01          	ld	a,(OFST-1,sp)
3655  0014 905f          	clrw	y
3656  0016 9097          	ld	yl,a
3657  0018 90d60000      	ld	a,(_bLF_DEF,y)
3658  001c 43            	cpl	a
3659  001d d4540c        	and	a,(21516,x)
3660  0020 d7540c        	ld	(21516,x),a
3663  0023 0c02          	inc	(OFST+0,sp)
3666  0025 7b02          	ld	a,(OFST+0,sp)
3667  0027 a103          	cp	a,#3
3668  0029 25d9          	jrult	L7621
3672  002b 85            	popw	x
3673  002c 87            	retf	
3714                     ; 429 LCD_CLEAR_FUNC(lcd_clear_rid, 16, _rid)
3715                     .text:	section	.text,new
3716  0000               f_lcd_clear_rid:
3718  0000 89            	pushw	x
3719       00000002      OFST:	set	2
3722  0001 4f            	clr	a
3723  0002 6b02          	ld	(OFST+0,sp),a
3724  0004               L3131:
3727  0004 5f            	clrw	x
3728  0005 97            	ld	xl,a
3729  0006 d601af        	ld	a,(__rid,x)
3730  0009 6b01          	ld	(OFST-1,sp),a
3733  000b 5f            	clrw	x
3734  000c 97            	ld	xl,a
3735  000d d60048        	ld	a,(_iLF_DEF,x)
3736  0010 5f            	clrw	x
3737  0011 97            	ld	xl,a
3738  0012 7b01          	ld	a,(OFST-1,sp)
3739  0014 905f          	clrw	y
3740  0016 9097          	ld	yl,a
3741  0018 90d60000      	ld	a,(_bLF_DEF,y)
3742  001c 43            	cpl	a
3743  001d d4540c        	and	a,(21516,x)
3744  0020 d7540c        	ld	(21516,x),a
3747  0023 0c02          	inc	(OFST+0,sp)
3750  0025 7b02          	ld	a,(OFST+0,sp)
3751  0027 a110          	cp	a,#16
3752  0029 25d9          	jrult	L3131
3756  002b 85            	popw	x
3757  002c 87            	retf	
3798                     ; 430 LCD_CLEAR_FUNC(lcd_clear_n, 35, _n)
3799                     .text:	section	.text,new
3800  0000               f_lcd_clear_n:
3802  0000 89            	pushw	x
3803       00000002      OFST:	set	2
3806  0001 4f            	clr	a
3807  0002 6b02          	ld	(OFST+0,sp),a
3808  0004               L7331:
3811  0004 5f            	clrw	x
3812  0005 97            	ld	xl,a
3813  0006 d6017c        	ld	a,(__n,x)
3814  0009 6b01          	ld	(OFST-1,sp),a
3817  000b 5f            	clrw	x
3818  000c 97            	ld	xl,a
3819  000d d60048        	ld	a,(_iLF_DEF,x)
3820  0010 5f            	clrw	x
3821  0011 97            	ld	xl,a
3822  0012 7b01          	ld	a,(OFST-1,sp)
3823  0014 905f          	clrw	y
3824  0016 9097          	ld	yl,a
3825  0018 90d60000      	ld	a,(_bLF_DEF,y)
3826  001c 43            	cpl	a
3827  001d d4540c        	and	a,(21516,x)
3828  0020 d7540c        	ld	(21516,x),a
3831  0023 0c02          	inc	(OFST+0,sp)
3834  0025 7b02          	ld	a,(OFST+0,sp)
3835  0027 a123          	cp	a,#35
3836  0029 25d9          	jrult	L7331
3840  002b 85            	popw	x
3841  002c 87            	retf	
3882                     ; 432 LCD_CLEAR_FUNC(lcd_clear_m, 3, _nm)
3883                     .text:	section	.text,new
3884  0000               f_lcd_clear_m:
3886  0000 89            	pushw	x
3887       00000002      OFST:	set	2
3890  0001 4f            	clr	a
3891  0002 6b02          	ld	(OFST+0,sp),a
3892  0004               L3631:
3895  0004 5f            	clrw	x
3896  0005 97            	ld	xl,a
3897  0006 d6016d        	ld	a,(__nm,x)
3898  0009 6b01          	ld	(OFST-1,sp),a
3901  000b 5f            	clrw	x
3902  000c 97            	ld	xl,a
3903  000d d60048        	ld	a,(_iLF_DEF,x)
3904  0010 5f            	clrw	x
3905  0011 97            	ld	xl,a
3906  0012 7b01          	ld	a,(OFST-1,sp)
3907  0014 905f          	clrw	y
3908  0016 9097          	ld	yl,a
3909  0018 90d60000      	ld	a,(_bLF_DEF,y)
3910  001c 43            	cpl	a
3911  001d d4540c        	and	a,(21516,x)
3912  0020 d7540c        	ld	(21516,x),a
3915  0023 0c02          	inc	(OFST+0,sp)
3918  0025 7b02          	ld	a,(OFST+0,sp)
3919  0027 a103          	cp	a,#3
3920  0029 25d9          	jrult	L3631
3924  002b 85            	popw	x
3925  002c 87            	retf	
3966                     ; 433 LCD_CLEAR_FUNC(lcd_clear_cnt, 6, _ncnt)
3967                     .text:	section	.text,new
3968  0000               f_lcd_clear_cnt:
3970  0000 89            	pushw	x
3971       00000002      OFST:	set	2
3974  0001 4f            	clr	a
3975  0002 6b02          	ld	(OFST+0,sp),a
3976  0004               L7041:
3979  0004 5f            	clrw	x
3980  0005 97            	ld	xl,a
3981  0006 d60170        	ld	a,(__ncnt,x)
3982  0009 6b01          	ld	(OFST-1,sp),a
3985  000b 5f            	clrw	x
3986  000c 97            	ld	xl,a
3987  000d d60048        	ld	a,(_iLF_DEF,x)
3988  0010 5f            	clrw	x
3989  0011 97            	ld	xl,a
3990  0012 7b01          	ld	a,(OFST-1,sp)
3991  0014 905f          	clrw	y
3992  0016 9097          	ld	yl,a
3993  0018 90d60000      	ld	a,(_bLF_DEF,y)
3994  001c 43            	cpl	a
3995  001d d4540c        	and	a,(21516,x)
3996  0020 d7540c        	ld	(21516,x),a
3999  0023 0c02          	inc	(OFST+0,sp)
4002  0025 7b02          	ld	a,(OFST+0,sp)
4003  0027 a106          	cp	a,#6
4004  0029 25d9          	jrult	L7041
4008  002b 85            	popw	x
4009  002c 87            	retf	
4057                     ; 435 void	lcd_clear_npos(uint8_t pos, uint8_t type)
4057                     ; 436 {
4058                     .text:	section	.text,new
4059  0000               f_lcd_clear_npos:
4061  0000 89            	pushw	x
4062  0001 89            	pushw	x
4063       00000002      OFST:	set	2
4066                     ; 438 	pos = pos*7;
4068  0002 ae0007        	ldw	x,#7
4069  0005 7b03          	ld	a,(OFST+1,sp)
4070  0007 42            	mul	x,a
4071  0008 9f            	ld	a,xl
4072  0009 6b03          	ld	(OFST+1,sp),a
4073                     ; 439 	for( i=0; i<7; i++ )
4075  000b 0f01          	clr	(OFST-1,sp)
4076  000d               L5341:
4077                     ; 441 		j = _n[pos++];
4079  000d 7b03          	ld	a,(OFST+1,sp)
4080  000f 0c03          	inc	(OFST+1,sp)
4081  0011 5f            	clrw	x
4082  0012 97            	ld	xl,a
4083  0013 d6017c        	ld	a,(__n,x)
4084  0016 6b02          	ld	(OFST+0,sp),a
4085                     ; 442 		LCD_BIT_CLEAR(j);
4087  0018 5f            	clrw	x
4088  0019 97            	ld	xl,a
4089  001a d60048        	ld	a,(_iLF_DEF,x)
4090  001d 5f            	clrw	x
4091  001e 97            	ld	xl,a
4092  001f 7b02          	ld	a,(OFST+0,sp)
4093  0021 905f          	clrw	y
4094  0023 9097          	ld	yl,a
4095  0025 90d60000      	ld	a,(_bLF_DEF,y)
4096  0029 43            	cpl	a
4097  002a d4540c        	and	a,(21516,x)
4098  002d d7540c        	ld	(21516,x),a
4099                     ; 439 	for( i=0; i<7; i++ )
4101  0030 0c01          	inc	(OFST-1,sp)
4104  0032 7b01          	ld	a,(OFST-1,sp)
4105  0034 a107          	cp	a,#7
4106  0036 25d5          	jrult	L5341
4107                     ; 444 }
4110  0038 5b04          	addw	sp,#4
4111  003a 87            	retf	
4142                     ; 446 void	lcd_disp_all(void)
4142                     ; 447 {
4143                     .text:	section	.text,new
4144  0000               f_lcd_disp_all:
4146  0000 88            	push	a
4147       00000001      OFST:	set	1
4150                     ; 449 	for( i=0; i<15; i++ )
4152  0001 4f            	clr	a
4153  0002 6b01          	ld	(OFST+0,sp),a
4154  0004               L7541:
4155                     ; 450 		LCD->RAM[i] = 0xff;
4157  0004 5f            	clrw	x
4158  0005 97            	ld	xl,a
4159  0006 a6ff          	ld	a,#255
4160  0008 d7540c        	ld	(21516,x),a
4161                     ; 449 	for( i=0; i<15; i++ )
4163  000b 0c01          	inc	(OFST+0,sp)
4166  000d 7b01          	ld	a,(OFST+0,sp)
4167  000f a10f          	cp	a,#15
4168  0011 25f1          	jrult	L7541
4169                     ; 451 }
4172  0013 84            	pop	a
4173  0014 87            	retf	
4211                     ; 453 void	lcd_clear(uint8_t type)
4211                     ; 454 {
4212                     .text:	section	.text,new
4213  0000               f_lcd_clear:
4215  0000 88            	push	a
4216       00000001      OFST:	set	1
4219                     ; 456 	for( i=0; i<15; i++ )
4221  0001 4f            	clr	a
4222  0002 6b01          	ld	(OFST+0,sp),a
4223  0004               L3051:
4224                     ; 457 		LCD->RAM[i] = 0;
4226  0004 5f            	clrw	x
4227  0005 97            	ld	xl,a
4228  0006 724f540c      	clr	(21516,x)
4229                     ; 456 	for( i=0; i<15; i++ )
4231  000a 0c01          	inc	(OFST+0,sp)
4234  000c 7b01          	ld	a,(OFST+0,sp)
4235  000e a10f          	cp	a,#15
4236  0010 25f2          	jrult	L3051
4237                     ; 458 }
4240  0012 84            	pop	a
4241  0013 87            	retf	
4287                     ; 460 uint8_t	*lcd_get_npos(uint8_t i)
4287                     ; 461 {
4288                     .text:	section	.text,new
4289  0000               f_lcd_get_npos:
4291  0000 89            	pushw	x
4292       00000002      OFST:	set	2
4295                     ; 463 	switch( i )
4298                     ; 476 	case 3:	p = _nd;	break;
4299  0001 4d            	tnz	a
4300  0002 270d          	jreq	L1151
4301  0004 4a            	dec	a
4302  0005 270f          	jreq	L3151
4303  0007 4a            	dec	a
4304  0008 2711          	jreq	L5151
4305  000a 4a            	dec	a
4306  000b 2713          	jreq	L7151
4307  000d 1e01          	ldw	x,(OFST-1,sp)
4308  000f 2012          	jra	LC001
4309  0011               L1151:
4310                     ; 473 	case 0:	p = _na;	break;
4312  0011 ae008c        	ldw	x,#__na
4315  0014 200d          	jpf	LC001
4316  0016               L3151:
4317                     ; 474 	case 1:	p = _nb;	break;
4319  0016 ae008d        	ldw	x,#__nb
4322  0019 2008          	jpf	LC001
4323  001b               L5151:
4324                     ; 475 	case 2:	p = _nc;	break;
4326  001b ae00d3        	ldw	x,#__nc
4329  001e 2003          	jpf	LC001
4330  0020               L7151:
4331                     ; 476 	case 3:	p = _nd;	break;
4333  0020 ae0119        	ldw	x,#__nd
4334  0023               LC001:
4337                     ; 479 	return p;
4341  0023 5b02          	addw	sp,#2
4342  0025 87            	retf	
4408                     ; 482 void	lcd_disp_n(uint8_t pos, uint8_t n)
4408                     ; 483 {
4409                     .text:	section	.text,new
4410  0000               f_lcd_disp_n:
4412  0000 89            	pushw	x
4413  0001 5204          	subw	sp,#4
4414       00000004      OFST:	set	4
4417                     ; 487 	lcd_clear_npos(pos, 0);
4419  0003 5f            	clrw	x
4420  0004 7b05          	ld	a,(OFST+1,sp)
4421  0006 95            	ld	xh,a
4422  0007 8d000000      	callf	f_lcd_clear_npos
4424                     ; 488 	p = lcd_get_npos(pos);
4426  000b 7b05          	ld	a,(OFST+1,sp)
4427  000d 8d000000      	callf	f_lcd_get_npos
4429  0011 1f02          	ldw	(OFST-2,sp),x
4430                     ; 489 	p = p+n*7;
4432  0013 7b06          	ld	a,(OFST+2,sp)
4433  0015 97            	ld	xl,a
4434  0016 a607          	ld	a,#7
4435  0018 42            	mul	x,a
4436  0019 72fb02        	addw	x,(OFST-2,sp)
4437  001c 1f02          	ldw	(OFST-2,sp),x
4438                     ; 490 	for( i=0; i<7; i++ )
4440  001e 0f04          	clr	(OFST+0,sp)
4441  0020               L3751:
4442                     ; 492 		if( p[i] != 0 )
4444  0020 7b02          	ld	a,(OFST-2,sp)
4445  0022 97            	ld	xl,a
4446  0023 7b03          	ld	a,(OFST-1,sp)
4447  0025 1b04          	add	a,(OFST+0,sp)
4448  0027 2401          	jrnc	L471
4449  0029 5c            	incw	x
4450  002a               L471:
4451  002a 02            	rlwa	x,a
4452  002b f6            	ld	a,(x)
4453  002c 2725          	jreq	L1061
4454                     ; 494 			j = p[i];
4456  002e 7b02          	ld	a,(OFST-2,sp)
4457  0030 97            	ld	xl,a
4458  0031 7b03          	ld	a,(OFST-1,sp)
4459  0033 1b04          	add	a,(OFST+0,sp)
4460  0035 2401          	jrnc	L671
4461  0037 5c            	incw	x
4462  0038               L671:
4463  0038 02            	rlwa	x,a
4464  0039 f6            	ld	a,(x)
4465  003a 6b01          	ld	(OFST-3,sp),a
4466                     ; 495 			LCD_BIT_SET(j);
4468  003c 5f            	clrw	x
4469  003d 97            	ld	xl,a
4470  003e d60048        	ld	a,(_iLF_DEF,x)
4471  0041 5f            	clrw	x
4472  0042 97            	ld	xl,a
4473  0043 7b01          	ld	a,(OFST-3,sp)
4474  0045 905f          	clrw	y
4475  0047 9097          	ld	yl,a
4476  0049 d6540c        	ld	a,(21516,x)
4477  004c 90da0000      	or	a,(_bLF_DEF,y)
4478  0050 d7540c        	ld	(21516,x),a
4479  0053               L1061:
4480                     ; 490 	for( i=0; i<7; i++ )
4482  0053 0c04          	inc	(OFST+0,sp)
4485  0055 7b04          	ld	a,(OFST+0,sp)
4486  0057 a107          	cp	a,#7
4487  0059 25c5          	jrult	L3751
4488                     ; 498 }
4491  005b 5b06          	addw	sp,#6
4492  005d 87            	retf	
4548                     ; 502 void	lcd_disp_err(uint8_t n)
4548                     ; 503 {
4549                     .text:	section	.text,new
4550  0000               f_lcd_disp_err:
4552  0000 88            	push	a
4553  0001 5204          	subw	sp,#4
4554       00000004      OFST:	set	4
4557                     ; 506 	LCD_CE;
4559  0003 72165402      	bset	21506,#3
4560                     ; 507 	lcd_clear_n();
4562  0007 8d000000      	callf	f_lcd_clear_n
4564                     ; 508 	p = error_type==1 ? _nerrBr : _nerr;
4566  000b c60000        	ld	a,_error_type
4567  000e 4a            	dec	a
4568  000f 2605          	jrne	L402
4569  0011 ae0166        	ldw	x,#__nerrBr
4570  0014 2003          	jra	L602
4571  0016               L402:
4572  0016 ae015f        	ldw	x,#__nerr
4573  0019               L602:
4574  0019 1f02          	ldw	(OFST-2,sp),x
4575                     ; 509 	for( i=0; i<7; i++ )
4577  001b 0f04          	clr	(OFST+0,sp)
4578  001d               L7261:
4579                     ; 511 		LCD_BIT_SET(p[i]);
4581  001d 7b02          	ld	a,(OFST-2,sp)
4582  001f 97            	ld	xl,a
4583  0020 7b03          	ld	a,(OFST-1,sp)
4584  0022 1b04          	add	a,(OFST+0,sp)
4585  0024 2401          	jrnc	L012
4586  0026 5c            	incw	x
4587  0027               L012:
4588  0027 02            	rlwa	x,a
4589  0028 f6            	ld	a,(x)
4590  0029 5f            	clrw	x
4591  002a 97            	ld	xl,a
4592  002b d60000        	ld	a,(_bLF_DEF,x)
4593  002e 6b01          	ld	(OFST-3,sp),a
4594  0030 7b02          	ld	a,(OFST-2,sp)
4595  0032 97            	ld	xl,a
4596  0033 7b03          	ld	a,(OFST-1,sp)
4597  0035 1b04          	add	a,(OFST+0,sp)
4598  0037 2401          	jrnc	L212
4599  0039 5c            	incw	x
4600  003a               L212:
4601  003a 02            	rlwa	x,a
4602  003b f6            	ld	a,(x)
4603  003c 5f            	clrw	x
4604  003d 97            	ld	xl,a
4605  003e d60048        	ld	a,(_iLF_DEF,x)
4606  0041 5f            	clrw	x
4607  0042 97            	ld	xl,a
4608  0043 d6540c        	ld	a,(21516,x)
4609  0046 1a01          	or	a,(OFST-3,sp)
4610  0048 d7540c        	ld	(21516,x),a
4611                     ; 509 	for( i=0; i<7; i++ )
4613  004b 0c04          	inc	(OFST+0,sp)
4616  004d 7b04          	ld	a,(OFST+0,sp)
4617  004f a107          	cp	a,#7
4618  0051 25ca          	jrult	L7261
4619                     ; 513 	if( uiInfo.mode == 1 )
4621  0053 c60008        	ld	a,_uiInfo+8
4622  0056 4a            	dec	a
4623  0057 2706          	jreq	L3061
4624                     ; 522 		if( n==30 )
4626  0059 7b05          	ld	a,(OFST+1,sp)
4627  005b a11e          	cp	a,#30
4628  005d 261d          	jrne	L7361
4629                     ; 523 			goto Print;
4630  005f               L3061:
4631                     ; 515 Print:		
4631                     ; 516 //		LCD_BIT_SET(bCOL);
4631                     ; 517 		lcd_disp_n(2, n/10);
4633  005f 7b05          	ld	a,(OFST+1,sp)
4634  0061 5f            	clrw	x
4635  0062 97            	ld	xl,a
4636  0063 a60a          	ld	a,#10
4637  0065 62            	div	x,a
4638  0066 a602          	ld	a,#2
4639  0068 95            	ld	xh,a
4640  0069 8d000000      	callf	f_lcd_disp_n
4642                     ; 518 		lcd_disp_n(3, n%10);
4644  006d 7b05          	ld	a,(OFST+1,sp)
4645  006f 5f            	clrw	x
4646  0070 97            	ld	xl,a
4647  0071 a60a          	ld	a,#10
4648  0073 62            	div	x,a
4649  0074 97            	ld	xl,a
4650  0075 a603          	ld	a,#3
4651  0077 95            	ld	xh,a
4652  0078 8d000000      	callf	f_lcd_disp_n
4655  007c               L7361:
4656                     ; 525 }
4659  007c 5b05          	addw	sp,#5
4660  007e 87            	retf	
4716                     ; 527 void	lcd_disp_rid(uint8_t id, uint8_t mode, uint8_t multi)
4716                     ; 528 {
4717                     .text:	section	.text,new
4718  0000               f_lcd_disp_rid:
4720  0000 89            	pushw	x
4721  0001 88            	push	a
4722       00000001      OFST:	set	1
4725                     ; 533 	LCD_CE;
4727  0002 72165402      	bset	21506,#3
4728                     ; 534 	if( multi == 0 )
4730  0006 7b07          	ld	a,(OFST+6,sp)
4731  0008 2604          	jrne	L5661
4732                     ; 540 		lcd_clear_rid();
4734  000a 8d000000      	callf	f_lcd_clear_rid
4736  000e               L5661:
4737                     ; 543 	if( id != 0 )
4739  000e 7b02          	ld	a,(OFST+1,sp)
4740  0010 2702          	jreq	L7661
4741                     ; 544 		id -= 1;
4743  0012 0a02          	dec	(OFST+1,sp)
4744  0014               L7661:
4745                     ; 560 	if( mode != 0 )
4747  0014 7b03          	ld	a,(OFST+2,sp)
4748  0016 271d          	jreq	L1761
4749                     ; 562 		j = _rid[id*2+1];
4751  0018 7b02          	ld	a,(OFST+1,sp)
4752  001a 5f            	clrw	x
4753  001b 97            	ld	xl,a
4754  001c 58            	sllw	x
4755  001d d601b0        	ld	a,(__rid+1,x)
4756  0020 6b01          	ld	(OFST+0,sp),a
4757                     ; 563 		LCD_BIT_SET(j);
4759  0022 8d750075      	callf	LC002
4760  0026 7b01          	ld	a,(OFST+0,sp)
4761  0028 905f          	clrw	y
4762  002a 9097          	ld	yl,a
4763  002c d6540c        	ld	a,(21516,x)
4764  002f 90da0000      	or	a,(_bLF_DEF,y)
4766  0033 201c          	jra	L3761
4767  0035               L1761:
4768                     ; 565 		j = _rid[id*2+1];
4770  0035 7b02          	ld	a,(OFST+1,sp)
4771  0037 5f            	clrw	x
4772  0038 97            	ld	xl,a
4773  0039 58            	sllw	x
4774  003a d601b0        	ld	a,(__rid+1,x)
4775  003d 6b01          	ld	(OFST+0,sp),a
4776                     ; 566 		LCD_BIT_CLEAR(j);
4778  003f 8d750075      	callf	LC002
4779  0043 7b01          	ld	a,(OFST+0,sp)
4780  0045 905f          	clrw	y
4781  0047 9097          	ld	yl,a
4782  0049 90d60000      	ld	a,(_bLF_DEF,y)
4783  004d 43            	cpl	a
4784  004e d4540c        	and	a,(21516,x)
4785  0051               L3761:
4786  0051 d7540c        	ld	(21516,x),a
4787                     ; 568 	j = _rid[id*2];
4789  0054 7b02          	ld	a,(OFST+1,sp)
4790  0056 5f            	clrw	x
4791  0057 97            	ld	xl,a
4792  0058 58            	sllw	x
4793  0059 d601af        	ld	a,(__rid,x)
4794  005c 6b01          	ld	(OFST+0,sp),a
4795                     ; 569 	LCD_BIT_SET(j);
4797  005e 8d750075      	callf	LC002
4798  0062 7b01          	ld	a,(OFST+0,sp)
4799  0064 905f          	clrw	y
4800  0066 9097          	ld	yl,a
4801  0068 d6540c        	ld	a,(21516,x)
4802  006b 90da0000      	or	a,(_bLF_DEF,y)
4803  006f d7540c        	ld	(21516,x),a
4804                     ; 571 }
4807  0072 5b03          	addw	sp,#3
4808  0074 87            	retf	
4809  0075               LC002:
4810  0075 5f            	clrw	x
4811  0076 97            	ld	xl,a
4812  0077 d60048        	ld	a,(_iLF_DEF,x)
4813  007a 5f            	clrw	x
4814  007b 97            	ld	xl,a
4815  007c 87            	retf	
4863                     ; 574 void	lcd_clear_rid_n(uint8_t id, uint8_t mode)
4863                     ; 575 {
4864                     .text:	section	.text,new
4865  0000               f_lcd_clear_rid_n:
4867  0000 89            	pushw	x
4868  0001 88            	push	a
4869       00000001      OFST:	set	1
4872                     ; 577 	LCD_CE;
4874  0002 72165402      	bset	21506,#3
4875                     ; 579 	if( id != 0 )
4877  0006 9e            	ld	a,xh
4878  0007 4d            	tnz	a
4879  0008 2702          	jreq	L5171
4880                     ; 580 		id -= 1;
4882  000a 0a02          	dec	(OFST+1,sp)
4883  000c               L5171:
4884                     ; 582 	if( mode != 0 )
4886  000c 7b03          	ld	a,(OFST+2,sp)
4887  000e 2717          	jreq	L7171
4888                     ; 584 		j = _rid[id*2+1];
4890  0010 7b02          	ld	a,(OFST+1,sp)
4891  0012 5f            	clrw	x
4892  0013 97            	ld	xl,a
4893  0014 58            	sllw	x
4894  0015 d601b0        	ld	a,(__rid+1,x)
4895  0018 6b01          	ld	(OFST+0,sp),a
4896                     ; 585 		LCD_BIT_CLEAR(j);
4898  001a 5f            	clrw	x
4899  001b 97            	ld	xl,a
4900  001c d60048        	ld	a,(_iLF_DEF,x)
4901  001f 5f            	clrw	x
4902  0020 97            	ld	xl,a
4903  0021 7b01          	ld	a,(OFST+0,sp)
4904  0023 8d410041      	callf	LC003
4905  0027               L7171:
4906                     ; 587 	j = _rid[id*2];
4908  0027 7b02          	ld	a,(OFST+1,sp)
4909  0029 5f            	clrw	x
4910  002a 97            	ld	xl,a
4911  002b 58            	sllw	x
4912  002c d601af        	ld	a,(__rid,x)
4913  002f 6b01          	ld	(OFST+0,sp),a
4914                     ; 588 	LCD_BIT_CLEAR(j);
4916  0031 5f            	clrw	x
4917  0032 97            	ld	xl,a
4918  0033 d60048        	ld	a,(_iLF_DEF,x)
4919  0036 5f            	clrw	x
4920  0037 97            	ld	xl,a
4921  0038 7b01          	ld	a,(OFST+0,sp)
4922  003a 8d410041      	callf	LC003
4923                     ; 589 }
4926  003e 5b03          	addw	sp,#3
4927  0040 87            	retf	
4928  0041               LC003:
4929  0041 905f          	clrw	y
4930  0043 9097          	ld	yl,a
4931  0045 90d60000      	ld	a,(_bLF_DEF,y)
4932  0049 43            	cpl	a
4933  004a d4540c        	and	a,(21516,x)
4934  004d d7540c        	ld	(21516,x),a
4935  0050 87            	retf	
4975                     ; 590 void	lcd_disp_cmd(uint8_t cmd, uint8_t mode, uint8_t multi)
4975                     ; 591 {
4976                     .text:	section	.text,new
4977  0000               f_lcd_disp_cmd:
4979  0000 88            	push	a
4980       00000001      OFST:	set	1
4983                     ; 593 	LCD_CE;
4985  0001 72165402      	bset	21506,#3
4986                     ; 603 	LCD_BIT_SET(j);
4988  0005 7b01          	ld	a,(OFST+0,sp)
4989  0007 5f            	clrw	x
4990  0008 97            	ld	xl,a
4991  0009 d60048        	ld	a,(_iLF_DEF,x)
4992  000c 5f            	clrw	x
4993  000d 97            	ld	xl,a
4994  000e 7b01          	ld	a,(OFST+0,sp)
4995  0010 905f          	clrw	y
4996  0012 9097          	ld	yl,a
4997  0014 d6540c        	ld	a,(21516,x)
4998  0017 90da0000      	or	a,(_bLF_DEF,y)
4999  001b d7540c        	ld	(21516,x),a
5000                     ; 604 }
5003  001e 84            	pop	a
5004  001f 87            	retf	
5038                     ; 606 void	lcd_disp_info_fire(uint8_t mode)
5038                     ; 607 {
5039                     .text:	section	.text,new
5040  0000               f_lcd_disp_info_fire:
5044                     ; 608 	if( mode == 0 )
5046  0000 4d            	tnz	a
5047  0001 2605          	jrne	L3571
5048                     ; 609 		LCD_BIT_CLEAR(_info[0]);
5050  0003 7215540c      	bres	21516,#2
5053  0007 87            	retf	
5054  0008               L3571:
5055                     ; 611 		LCD_BIT_SET(_info[0]);
5057  0008 7214540c      	bset	21516,#2
5058                     ; 612 }
5061  000c 87            	retf	
5096                     ; 614 void	lcd_disp_info_shower(uint8_t mode, uint8_t para)
5096                     ; 615 {
5097                     .text:	section	.text,new
5098  0000               f_lcd_disp_info_shower:
5100  0000 89            	pushw	x
5101       00000000      OFST:	set	0
5104                     ; 616 	if( (mode & 0x80) != 0 )
5106  0001 9e            	ld	a,xh
5107  0002 a580          	bcp	a,#128
5108  0004 2704          	jreq	L3771
5109                     ; 617 		lcd_blink_item(_info[2]);
5111  0006 a645          	ld	a,#69
5114  0008 2008          	jpf	LC004
5115  000a               L3771:
5116                     ; 619 	else if( (mode &0x08) != 0 )
5118  000a 7b01          	ld	a,(OFST+1,sp)
5119  000c a508          	bcp	a,#8
5120  000e 2708          	jreq	L7771
5121                     ; 620 		lcd_blink_item(_info[1]);
5123  0010 a643          	ld	a,#67
5124  0012               LC004:
5125  0012 8d000000      	callf	f_lcd_blink_item
5128  0016 2004          	jra	L5771
5129  0018               L7771:
5130                     ; 622 		lcd_blink_clear();
5132  0018 8d000000      	callf	f_lcd_blink_clear
5134  001c               L5771:
5135                     ; 624 }
5138  001c 85            	popw	x
5139  001d 87            	retf	
5195                     ; 626 void	lcd_disp_info(uint8_t info, uint8_t mode, uint8_t multi)
5195                     ; 627 {
5196                     .text:	section	.text,new
5197  0000               f_lcd_disp_info:
5199  0000 89            	pushw	x
5200  0001 88            	push	a
5201       00000001      OFST:	set	1
5204                     ; 629 	LCD_CE;
5206  0002 72165402      	bset	21506,#3
5207                     ; 630 	if( multi == 0 )
5209  0006 7b07          	ld	a,(OFST+6,sp)
5210  0008 2604          	jrne	L5202
5211                     ; 631 		lcd_clear_info();
5213  000a 8d000000      	callf	f_lcd_clear_info
5215  000e               L5202:
5216                     ; 636 	j = _info[info];
5218  000e 7b02          	ld	a,(OFST+1,sp)
5219  0010 5f            	clrw	x
5220  0011 97            	ld	xl,a
5221  0012 d601ac        	ld	a,(__info,x)
5222  0015 6b01          	ld	(OFST+0,sp),a
5223                     ; 637 	if( mode == 1 )
5225  0017 7b03          	ld	a,(OFST+2,sp)
5226  0019 4a            	dec	a
5227  001a 2619          	jrne	L7202
5228                     ; 638 		LCD_BIT_CLEAR(j);
5230  001c 7b01          	ld	a,(OFST+0,sp)
5231  001e 5f            	clrw	x
5232  001f 97            	ld	xl,a
5233  0020 d60048        	ld	a,(_iLF_DEF,x)
5234  0023 5f            	clrw	x
5235  0024 97            	ld	xl,a
5236  0025 7b01          	ld	a,(OFST+0,sp)
5237  0027 905f          	clrw	y
5238  0029 9097          	ld	yl,a
5239  002b 90d60000      	ld	a,(_bLF_DEF,y)
5240  002f 43            	cpl	a
5241  0030 d4540c        	and	a,(21516,x)
5243  0033 2016          	jra	L1302
5244  0035               L7202:
5245                     ; 640 		LCD_BIT_SET(j);
5247  0035 7b01          	ld	a,(OFST+0,sp)
5248  0037 5f            	clrw	x
5249  0038 97            	ld	xl,a
5250  0039 d60048        	ld	a,(_iLF_DEF,x)
5251  003c 5f            	clrw	x
5252  003d 97            	ld	xl,a
5253  003e 7b01          	ld	a,(OFST+0,sp)
5254  0040 905f          	clrw	y
5255  0042 9097          	ld	yl,a
5256  0044 d6540c        	ld	a,(21516,x)
5257  0047 90da0000      	or	a,(_bLF_DEF,y)
5258  004b               L1302:
5259  004b d7540c        	ld	(21516,x),a
5260                     ; 641 }
5263  004e 5b03          	addw	sp,#3
5264  0050 87            	retf	
5266                     	switch	.data
5267  0000               ___i:
5268  0000 00            	dc.b	0
5308                     ; 655 void	lcd_disp(uint8_t id, uint8_t enable)
5308                     ; 656 {
5309                     .text:	section	.text,new
5310  0000               f_lcd_disp:
5312  0000 89            	pushw	x
5313       00000000      OFST:	set	0
5316                     ; 659 	LCD_CE;
5318  0001 72165402      	bset	21506,#3
5319                     ; 660 	if( enable == 1 )
5321  0005 9f            	ld	a,xl
5322  0006 4a            	dec	a
5323  0007 262f          	jrne	L1502
5324                     ; 662 		lcd_clear(0);
5326  0009 8d000000      	callf	f_lcd_clear
5328                     ; 663 		__i = (__i+1) % 10;
5330  000d c60000        	ld	a,___i
5331  0010 5f            	clrw	x
5332  0011 97            	ld	xl,a
5333  0012 5c            	incw	x
5334  0013 a60a          	ld	a,#10
5335  0015 8d000000      	callf	d_smodx
5337  0019 01            	rrwa	x,a
5338  001a c70000        	ld	___i,a
5339                     ; 664 		lcd_disp_n(0, __i);
5341  001d 97            	ld	xl,a
5342  001e 4f            	clr	a
5343  001f 8d430043      	callf	LC005
5344  0023 a601          	ld	a,#1
5345  0025 8d430043      	callf	LC005
5346  0029 a602          	ld	a,#2
5347  002b 8d430043      	callf	LC005
5348  002f a603          	ld	a,#3
5349  0031 95            	ld	xh,a
5350  0032 8d000000      	callf	f_lcd_disp_n
5352                     ; 667 		lcd_disp_n(3, __i);
5353  0036 2009          	jra	L3502
5354  0038               L1502:
5355                     ; 671 		LCD->RAM[LCD_RAMRegister_1] &= (uint8_t)(~id);
5357  0038 7b01          	ld	a,(OFST+1,sp)
5358  003a 43            	cpl	a
5359  003b c4540d        	and	a,21517
5360  003e c7540d        	ld	21517,a
5361  0041               L3502:
5362                     ; 673 }
5365  0041 85            	popw	x
5366  0042 87            	retf	
5367  0043               LC005:
5368  0043 95            	ld	xh,a
5369  0044 8d000000      	callf	f_lcd_disp_n
5371                     ; 665 		lcd_disp_n(1, __i);
5373  0048 c60000        	ld	a,___i
5374  004b 97            	ld	xl,a
5375  004c 87            	retf	
5406                     ; 675 void	lcd_init(void)
5406                     ; 676 {
5407                     .text:	section	.text,new
5408  0000               f_lcd_init:
5410  0000 88            	push	a
5411       00000001      OFST:	set	1
5414                     ; 678 	LCD_CE;
5416  0001 72165402      	bset	21506,#3
5417                     ; 679 	for( i=0; i<15; i++ )
5419  0005 4f            	clr	a
5420  0006 6b01          	ld	(OFST+0,sp),a
5421  0008               L1702:
5422                     ; 680 		LCD->RAM[i] = 0xff;
5424  0008 5f            	clrw	x
5425  0009 97            	ld	xl,a
5426  000a a6ff          	ld	a,#255
5427  000c d7540c        	ld	(21516,x),a
5428                     ; 679 	for( i=0; i<15; i++ )
5430  000f 0c01          	inc	(OFST+0,sp)
5433  0011 7b01          	ld	a,(OFST+0,sp)
5434  0013 a10f          	cp	a,#15
5435  0015 25f1          	jrult	L1702
5436                     ; 681 }
5439  0017 84            	pop	a
5440  0018 87            	retf	
5471                     ; 685 void	lcd_cntl(uint8_t cmd, uint8_t param)
5471                     ; 686 {
5472                     .text:	section	.text,new
5473  0000               f_lcd_cntl:
5477                     ; 705 }
5480  0000 87            	retf	
5502                     ; 707 void	systemLcdClear(void)
5502                     ; 708 {
5503                     .text:	section	.text,new
5504  0000               f_systemLcdClear:
5508                     ; 709 	LCD->CR1 = LCD_CR1_RESET_VALUE;
5510  0000 725f5400      	clr	21504
5511                     ; 710 	LCD->CR2 = LCD_CR2_RESET_VALUE;
5513  0004 725f5401      	clr	21505
5514                     ; 711 	LCD->CR3 = LCD_CR3_RESET_VALUE;
5516  0008 725f5402      	clr	21506
5517                     ; 712 	LCD->FRQ = LCD_FRQ_RESET_VALUE;
5519  000c 725f5403      	clr	21507
5520                     ; 714 	LCD->CR4 = LCD_CR4_RESET_VALUE;
5522  0010 725f542f      	clr	21551
5523                     ; 715 }
5526  0014 87            	retf	
5559                     ; 752 void	systemLcd(void)
5559                     ; 753 {
5560                     .text:	section	.text,new
5561  0000               f_systemLcd:
5565                     ; 754 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
5567  0000 ae1301        	ldw	x,#4865
5568  0003 8d000000      	callf	f_CLK_PeripheralClockConfig
5570                     ; 755 	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
5572  0007 ae0400        	ldw	x,#1024
5573  000a 8d000000      	callf	f_CLK_RTCClockConfig
5575                     ; 756 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
5577  000e ae1201        	ldw	x,#4609
5578  0011 8d000000      	callf	f_CLK_PeripheralClockConfig
5580                     ; 758 	systemLcdClear();
5582  0015 8d000000      	callf	f_systemLcdClear
5584                     ; 760 	LCD_Init(
5584                     ; 761 		LCD_Prescaler_2, 
5584                     ; 762 		LCD_Divider_18, 
5584                     ; 763 		LCD_Duty_1_4,
5584                     ; 764 		LCD_Bias_1_3, 
5584                     ; 765 #if defined (_RC_DR_) || defined (_RC_DW_)
5584                     ; 766 		LCD_VoltageSource_External
5584                     ; 767 #else
5584                     ; 768 		LCD_VoltageSource_Internal
5584                     ; 769 #endif
5584                     ; 770 		);
5586  0019 4b00          	push	#0
5587  001b 4b00          	push	#0
5588  001d 4b06          	push	#6
5589  001f ae1002        	ldw	x,#4098
5590  0022 8d000000      	callf	f_LCD_Init
5592  0026 5b03          	addw	sp,#3
5593                     ; 783 	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
5595  0028 ae00ff        	ldw	x,#255
5596  002b 8d000000      	callf	f_LCD_PortMaskConfig
5598                     ; 784 	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF);	//	s8 Skip
5600  002f ae01ff        	ldw	x,#511
5601  0032 8d000000      	callf	f_LCD_PortMaskConfig
5603                     ; 785 	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x03);
5605  0036 ae0203        	ldw	x,#515
5606  0039 8d000000      	callf	f_LCD_PortMaskConfig
5608                     ; 786 	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);	//	seg24/seg20/seg17/seg16
5610  003d ae0300        	ldw	x,#768
5611  0040 8d000000      	callf	f_LCD_PortMaskConfig
5613                     ; 800 	LCD_HighDriveCmd(ENABLE);
5615  0044 a601          	ld	a,#1
5616  0046 8d000000      	callf	f_LCD_HighDriveCmd
5618                     ; 801 	LCD_ContrastConfig(LCD_Contrast_Level_7);
5620  004a a60e          	ld	a,#14
5621  004c 8d000000      	callf	f_LCD_ContrastConfig
5623                     ; 802 	LCD_DeadTimeConfig(LCD_DeadTime_0);
5625  0050 4f            	clr	a
5626  0051 8d000000      	callf	f_LCD_DeadTimeConfig
5628                     ; 803 	LCD_PulseOnDurationConfig(LCD_PulseOnDuration_0);
5630  0055 4f            	clr	a
5631  0056 8d000000      	callf	f_LCD_PulseOnDurationConfig
5633                     ; 812 	lcd_init();
5635  005a 8d000000      	callf	f_lcd_init
5637                     ; 814 	LCD_Cmd(ENABLE); 
5639  005e a601          	ld	a,#1
5641                     ; 815 }
5644  0060 ac000000      	jpf	f_LCD_Cmd
5646                     	switch	.data
5647  0001               __blink_timer:
5648  0001 05            	dc.b	5
5649  0002               __blinkFlag:
5650  0002 00            	dc.b	0
5651  0003               __blinkId:
5652  0003 ff            	dc.b	255
5653  0004               __blink:
5654  0004 00            	dc.b	0
5655  0005               __blinkFlag2:
5656  0005 00            	dc.b	0
5657  0006               __blinkId2:
5658  0006 ff            	dc.b	255
5659  0007               __blinkId2b:
5660  0007 ff            	dc.b	255
5661  0008               __blink2:
5662  0008 00            	dc.b	0
5663  0009               __blinkNpos:
5664  0009 00            	dc.b	0
5665  000a               __blinkFlag3:
5666  000a 00            	dc.b	0
5667  000b               __blinkId3:
5668  000b ff            	dc.b	255
5669  000c               __blink3:
5670  000c 00            	dc.b	0
5693                     ; 832 void	lcd_blink_npos_clear(void)
5693                     ; 833 {
5694                     .text:	section	.text,new
5695  0000               f_lcd_blink_npos_clear:
5699                     ; 834 	_blinkNpos = 0;
5701  0000 725f0009      	clr	__blinkNpos
5702                     ; 835 }
5705  0004 87            	retf	
5737                     ; 837 void	lcd_blink_npos(uint8_t i)
5737                     ; 838 {
5738                     .text:	section	.text,new
5739  0000               f_lcd_blink_npos:
5743                     ; 839 	_blinkNpos = i + 1;
5745  0000 4c            	inc	a
5746  0001 c70009        	ld	__blinkNpos,a
5747                     ; 840 }
5750  0004 87            	retf	
5775                     ; 842 void	lcd_blink_clear(void)
5775                     ; 843 {
5776                     .text:	section	.text,new
5777  0000               f_lcd_blink_clear:
5781                     ; 844 	_blinkId = 0;
5783  0000 725f0003      	clr	__blinkId
5784                     ; 845 	_blinkId2 = 0;
5786  0004 725f0006      	clr	__blinkId2
5787                     ; 846 	_blinkId2b = 0;
5789  0008 725f0007      	clr	__blinkId2b
5790                     ; 847 }
5793  000c 87            	retf	
5826                     ; 849 void	lcd_blink_item(uint8_t i)
5826                     ; 850 {
5827                     .text:	section	.text,new
5828  0000               f_lcd_blink_item:
5832                     ; 851 	_blinkId = i;
5834  0000 c70003        	ld	__blinkId,a
5835                     ; 852 	_blink = 0;
5837  0003 725f0004      	clr	__blink
5838                     ; 853 }
5841  0007 87            	retf	
5866                     ; 855 void	lcd_blink_clearRoom(void)
5866                     ; 856 {
5867                     .text:	section	.text,new
5868  0000               f_lcd_blink_clearRoom:
5872                     ; 857 	_blinkId2 = 0;
5874  0000 725f0006      	clr	__blinkId2
5875                     ; 858 	_blinkId2b = 0;
5877  0004 725f0007      	clr	__blinkId2b
5878                     ; 859 }
5881  0008 87            	retf	
5923                     ; 861 void	lcd_blink_itemRoom(uint8_t i, uint8_t imode)
5923                     ; 862 {
5924                     .text:	section	.text,new
5925  0000               f_lcd_blink_itemRoom:
5927  0000 89            	pushw	x
5928       00000000      OFST:	set	0
5931                     ; 863 	_blinkId2 = _rid[i*2];
5933  0001 9e            	ld	a,xh
5934  0002 5f            	clrw	x
5935  0003 97            	ld	xl,a
5936  0004 58            	sllw	x
5937  0005 d601af        	ld	a,(__rid,x)
5938  0008 c70006        	ld	__blinkId2,a
5939                     ; 864 	if( imode != 0 )
5941  000b 7b02          	ld	a,(OFST+2,sp)
5942  000d 270b          	jreq	L1322
5943                     ; 865 		_blinkId2b = _rid[i*2+1];
5945  000f 7b01          	ld	a,(OFST+1,sp)
5946  0011 5f            	clrw	x
5947  0012 97            	ld	xl,a
5948  0013 58            	sllw	x
5949  0014 d601b0        	ld	a,(__rid+1,x)
5950  0017 c70007        	ld	__blinkId2b,a
5951  001a               L1322:
5952                     ; 866 	_blink2 = 0;
5954  001a 725f0008      	clr	__blink2
5955                     ; 867 }
5958  001e 85            	popw	x
5959  001f 87            	retf	
6015                     ; 869 void	lcd_blinkCb(void)
6015                     ; 870 {
6016                     .text:	section	.text,new
6017  0000               f_lcd_blinkCb:
6019  0000 5204          	subw	sp,#4
6020       00000004      OFST:	set	4
6023                     ; 873 	if( _blink_timer == 0 )
6025  0002 c60001        	ld	a,__blink_timer
6026  0005 2604ac7a017a  	jreq	L3332
6027                     ; 874 		return;
6029                     ; 876 	if( (__timer100ms%_blink_timer) == 0 )
6031  000b c60000        	ld	a,___timer100ms
6032  000e 5f            	clrw	x
6033  000f 97            	ld	xl,a
6034  0010 c60001        	ld	a,__blink_timer
6035  0013 905f          	clrw	y
6036  0015 9097          	ld	yl,a
6037  0017 8d000000      	callf	d_idiv
6039  001b 905d          	tnzw	y
6040  001d 2704ac6e016e  	jrne	L5522
6041                     ; 878 		if( _blinkFlag == 0 )
6043  0023 c60002        	ld	a,__blinkFlag
6044  0026 262f          	jrne	L7522
6045                     ; 880 			_blinkFlag = 1;
6047  0028 35010002      	mov	__blinkFlag,#1
6048                     ; 881 			if( _blinkId != 0 )
6050  002c c60003        	ld	a,__blinkId
6051  002f 2726          	jreq	L7522
6052                     ; 883 				if( _blink != 0 )
6054  0031 725d0004      	tnz	__blink
6055  0035 2711          	jreq	L3622
6056                     ; 885 					LCD_BIT_CLEAR(_blinkId);
6058  0037 8d7d017d      	callf	LC006
6059  003b c60003        	ld	a,__blinkId
6060  003e 8d850185      	callf	LC007
6061                     ; 886 					_blink = 0;
6063  0042 725f0004      	clr	__blink
6065  0046 200f          	jra	L7522
6066  0048               L3622:
6067                     ; 890 					LCD_BIT_SET(_blinkId);
6069  0048 8d7d017d      	callf	LC006
6070  004c c60003        	ld	a,__blinkId
6071  004f 8d950195      	callf	LC008
6072                     ; 891 					_blink = 1;
6074  0053 35010004      	mov	__blink,#1
6075  0057               L7522:
6076                     ; 895 		if( _blinkFlag2 == 0 )
6078  0057 c60005        	ld	a,__blinkFlag2
6079  005a 2654          	jrne	L7622
6080                     ; 897 			_blinkFlag2 = 1;
6082  005c 35010005      	mov	__blinkFlag2,#1
6083                     ; 898 			if( _blinkId2 != 0 )
6085  0060 c60006        	ld	a,__blinkId2
6086  0063 274b          	jreq	L7622
6087                     ; 900 				if( _blink2 != 0 )
6089  0065 c60008        	ld	a,__blink2
6090  0068 2724          	jreq	L3722
6091                     ; 902 					if( _blinkId2b != 0 )
6093  006a c60007        	ld	a,__blinkId2b
6094  006d 270b          	jreq	L5722
6095                     ; 903 						LCD_BIT_CLEAR(_blinkId2b);
6097  006f 8d7d017d      	callf	LC006
6098  0073 c60007        	ld	a,__blinkId2b
6099  0076 8d850185      	callf	LC007
6100  007a               L5722:
6101                     ; 904 					LCD_BIT_CLEAR(_blinkId2);
6103  007a c60006        	ld	a,__blinkId2
6104  007d 8d7d017d      	callf	LC006
6105  0081 c60006        	ld	a,__blinkId2
6106  0084 8d850185      	callf	LC007
6107                     ; 905 					_blink2 = 0;
6109  0088 725f0008      	clr	__blink2
6111  008c 2022          	jra	L7622
6112  008e               L3722:
6113                     ; 909 					if( _blinkId2b != 0 )
6115  008e c60007        	ld	a,__blinkId2b
6116  0091 270b          	jreq	L1032
6117                     ; 910 						LCD_BIT_SET(_blinkId2b);
6119  0093 8d7d017d      	callf	LC006
6120  0097 c60007        	ld	a,__blinkId2b
6121  009a 8d950195      	callf	LC008
6122  009e               L1032:
6123                     ; 911 					LCD_BIT_SET(_blinkId2);
6125  009e c60006        	ld	a,__blinkId2
6126  00a1 8d7d017d      	callf	LC006
6127  00a5 c60006        	ld	a,__blinkId2
6128  00a8 8d950195      	callf	LC008
6129                     ; 912 					_blink2 = 1;
6131  00ac 35010008      	mov	__blink2,#1
6132  00b0               L7622:
6133                     ; 916 		if( _blinkFlag3 == 0 )
6135  00b0 c6000a        	ld	a,__blinkFlag3
6136  00b3 2704ac7a017a  	jrne	L3332
6137                     ; 918 			_blinkFlag3 = 1;
6139  00b9 3501000a      	mov	__blinkFlag3,#1
6140                     ; 919 			if( _blinkNpos != 0 )
6142  00bd 725d0009      	tnz	__blinkNpos
6143  00c1 27f2          	jreq	L3332
6144                     ; 921 				p = lcd_get_npos(0);
6146  00c3 8d000000      	callf	f_lcd_get_npos
6148  00c7 1f02          	ldw	(OFST-2,sp),x
6149                     ; 922 				p = p+(_blinkNpos-1)*7;
6151  00c9 c60009        	ld	a,__blinkNpos
6152  00cc 97            	ld	xl,a
6153  00cd a607          	ld	a,#7
6154  00cf 42            	mul	x,a
6155  00d0 1d0007        	subw	x,#7
6156  00d3 72fb02        	addw	x,(OFST-2,sp)
6157  00d6 1f02          	ldw	(OFST-2,sp),x
6158                     ; 923 				if( _blinkId3 != 0 )
6160  00d8 c6000b        	ld	a,__blinkId3
6161  00db 2748          	jreq	L7032
6162                     ; 925 					for( i=0; i<7; i++ )
6164  00dd 0f04          	clr	(OFST+0,sp)
6165  00df               L1132:
6166                     ; 927 						if( p[i] != 0 )
6168  00df 7b02          	ld	a,(OFST-2,sp)
6169  00e1 97            	ld	xl,a
6170  00e2 7b03          	ld	a,(OFST-1,sp)
6171  00e4 1b04          	add	a,(OFST+0,sp)
6172  00e6 2401          	jrnc	L053
6173  00e8 5c            	incw	x
6174  00e9               L053:
6175  00e9 02            	rlwa	x,a
6176  00ea f6            	ld	a,(x)
6177  00eb 272a          	jreq	L7132
6178                     ; 928 							LCD_BIT_CLEAR(p[i]);
6180  00ed 7b02          	ld	a,(OFST-2,sp)
6181  00ef 97            	ld	xl,a
6182  00f0 7b03          	ld	a,(OFST-1,sp)
6183  00f2 1b04          	add	a,(OFST+0,sp)
6184  00f4 2401          	jrnc	L253
6185  00f6 5c            	incw	x
6186  00f7               L253:
6187  00f7 02            	rlwa	x,a
6188  00f8 f6            	ld	a,(x)
6189  00f9 8d7d017d      	callf	LC006
6190  00fd 89            	pushw	x
6191  00fe 7b04          	ld	a,(OFST+0,sp)
6192  0100 97            	ld	xl,a
6193  0101 7b05          	ld	a,(OFST+1,sp)
6194  0103 1b06          	add	a,(OFST+2,sp)
6195  0105 2401          	jrnc	L453
6196  0107 5c            	incw	x
6197  0108               L453:
6198  0108 02            	rlwa	x,a
6199  0109 f6            	ld	a,(x)
6200  010a 5f            	clrw	x
6201  010b 97            	ld	xl,a
6202  010c d60000        	ld	a,(_bLF_DEF,x)
6203  010f 43            	cpl	a
6204  0110 85            	popw	x
6205  0111 d4540c        	and	a,(21516,x)
6206  0114 d7540c        	ld	(21516,x),a
6207  0117               L7132:
6208                     ; 925 					for( i=0; i<7; i++ )
6210  0117 0c04          	inc	(OFST+0,sp)
6213  0119 7b04          	ld	a,(OFST+0,sp)
6214  011b a107          	cp	a,#7
6215  011d 25c0          	jrult	L1132
6216                     ; 930 					_blinkId3 = 0;
6218  011f 725f000b      	clr	__blinkId3
6220  0123 2055          	jra	L3332
6221  0125               L7032:
6222                     ; 934 					for( i=0; i<7; i++ )
6224  0125 6b04          	ld	(OFST+0,sp),a
6225  0127               L3232:
6226                     ; 936 						if( p[i] != 0 )
6228  0127 7b02          	ld	a,(OFST-2,sp)
6229  0129 97            	ld	xl,a
6230  012a 7b03          	ld	a,(OFST-1,sp)
6231  012c 1b04          	add	a,(OFST+0,sp)
6232  012e 2401          	jrnc	L653
6233  0130 5c            	incw	x
6234  0131               L653:
6235  0131 02            	rlwa	x,a
6236  0132 f6            	ld	a,(x)
6237  0133 272b          	jreq	L1332
6238                     ; 937 							LCD_BIT_SET(p[i]);
6240  0135 7b02          	ld	a,(OFST-2,sp)
6241  0137 97            	ld	xl,a
6242  0138 7b03          	ld	a,(OFST-1,sp)
6243  013a 1b04          	add	a,(OFST+0,sp)
6244  013c 2401          	jrnc	L063
6245  013e 5c            	incw	x
6246  013f               L063:
6247  013f 02            	rlwa	x,a
6248  0140 f6            	ld	a,(x)
6249  0141 5f            	clrw	x
6250  0142 97            	ld	xl,a
6251  0143 d60000        	ld	a,(_bLF_DEF,x)
6252  0146 6b01          	ld	(OFST-3,sp),a
6253  0148 7b02          	ld	a,(OFST-2,sp)
6254  014a 97            	ld	xl,a
6255  014b 7b03          	ld	a,(OFST-1,sp)
6256  014d 1b04          	add	a,(OFST+0,sp)
6257  014f 2401          	jrnc	L263
6258  0151 5c            	incw	x
6259  0152               L263:
6260  0152 02            	rlwa	x,a
6261  0153 f6            	ld	a,(x)
6262  0154 8d7d017d      	callf	LC006
6263  0158 d6540c        	ld	a,(21516,x)
6264  015b 1a01          	or	a,(OFST-3,sp)
6265  015d d7540c        	ld	(21516,x),a
6266  0160               L1332:
6267                     ; 934 					for( i=0; i<7; i++ )
6269  0160 0c04          	inc	(OFST+0,sp)
6272  0162 7b04          	ld	a,(OFST+0,sp)
6273  0164 a107          	cp	a,#7
6274  0166 25bf          	jrult	L3232
6275                     ; 939 					_blinkId3 = 1;
6277  0168 3501000b      	mov	__blinkId3,#1
6278  016c 200c          	jra	L3332
6279  016e               L5522:
6280                     ; 946 		_blinkFlag = 0;
6282  016e 725f0002      	clr	__blinkFlag
6283                     ; 947 		_blinkFlag2 = 0;
6285  0172 725f0005      	clr	__blinkFlag2
6286                     ; 948 		_blinkFlag3 = 0;
6288  0176 725f000a      	clr	__blinkFlag3
6289  017a               L3332:
6290                     ; 950 }
6293  017a 5b04          	addw	sp,#4
6294  017c 87            	retf	
6295  017d               LC006:
6296  017d 5f            	clrw	x
6297  017e 97            	ld	xl,a
6298  017f d60048        	ld	a,(_iLF_DEF,x)
6299  0182 5f            	clrw	x
6300  0183 97            	ld	xl,a
6301  0184 87            	retf	
6302  0185               LC007:
6303  0185 905f          	clrw	y
6304  0187 9097          	ld	yl,a
6305  0189 90d60000      	ld	a,(_bLF_DEF,y)
6306  018d 43            	cpl	a
6307  018e d4540c        	and	a,(21516,x)
6308  0191 d7540c        	ld	(21516,x),a
6309  0194 87            	retf	
6310  0195               LC008:
6311  0195 905f          	clrw	y
6312  0197 9097          	ld	yl,a
6313  0199 d6540c        	ld	a,(21516,x)
6314  019c 90da0000      	or	a,(_bLF_DEF,y)
6315  01a0 d7540c        	ld	(21516,x),a
6316  01a3 87            	retf	
6821                     	xdef	__blink3
6822                     	xdef	__blinkId3
6823                     	xdef	__blinkFlag3
6824                     	xdef	__blinkNpos
6825                     	xdef	__blink2
6826                     	xdef	__blinkId2b
6827                     	xdef	__blinkId2
6828                     	xdef	__blinkFlag2
6829                     	xdef	__blink
6830                     	xdef	__blinkId
6831                     	xdef	__blinkFlag
6832                     	xdef	__blink_timer
6833                     	xdef	f_systemLcdClear
6834                     	xdef	f_lcd_init
6835                     	xdef	___i
6836                     	xdef	f_lcd_disp_cmd
6837                     	xref	_error_type
6838                     	xdef	f_lcd_get_npos
6839                     	xdef	f_lcd_disp_all
6840                     	xdef	f_lcd_clear_cnt
6841                     	xdef	f_lcd_clear_m
6842                     	xdef	f_lcd_clear_info
6843                     	xdef	__plc
6844                     	xdef	__cnt_sub
6845                     	xdef	__cnt_host
6846                     	xdef	__lpm
6847                     	xdef	__temp_offset
6848                     	xdef	__po_type_pb
6849                     	xdef	__po_type_xl
6850                     	xdef	__po_type
6851                     	xdef	__len
6852                     	xdef	__freset
6853                     	xdef	__mir2
6854                     	xdef	__mir1
6855                     	xdef	__cntl_tab
6856                     	xdef	__cntl_2motor
6857                     	xdef	__cntl_op
6858                     	xdef	__link
6859                     	xdef	__hc
6860                     	xdef	__run
6861                     	xdef	__hcEach
6862                     	xdef	__hcLocal
6863                     	xdef	__cntl_po
6864                     	xdef	__cntl_on
6865                     	xdef	__cc
6866                     	xdef	__btn
6867                     	xdef	__bL
6868                     	xdef	__info
6869                     	xdef	__nid
6870                     	xdef	__n
6871                     	xdef	__nvalve
6872                     	xdef	__ncnt
6873                     	xdef	__nm
6874                     	xdef	__nerrBr
6875                     	xdef	__nerr
6876                     	xdef	__nd
6877                     	xdef	__nc
6878                     	xdef	__nb
6879                     	xdef	__na
6880                     	xdef	f_lcd_blink_npos
6881                     	xdef	f_lcd_blink_npos_clear
6882                     	xdef	f_lcd_disp_info
6883                     	xdef	f_lcd_disp_info_fire
6884                     	xdef	f_lcd_disp_info_shower
6885                     	xdef	f_lcd_clear_rid_n
6886                     	xdef	f_lcd_blinkCb
6887                     	xdef	f_lcd_blink_itemRoom
6888                     	xdef	f_lcd_blink_item
6889                     	xdef	f_lcd_blink_clearRoom
6890                     	xdef	f_lcd_blink_clear
6891                     	xdef	f_lcd_clear_npos
6892                     	xdef	f_lcd_disp_rid
6893                     	xdef	f_lcd_disp_err
6894                     	xdef	f_lcd_disp_n
6895                     	xdef	f_lcd_clear
6896                     	xdef	f_lcd_disp_setup_mode_each
6897                     	xdef	f_lcd_disp_setup_mode_local
6898                     	xdef	f_lcd_disp_setup_valve
6899                     	xdef	f_lcd_disp_setup_cnt
6900                     	xdef	f_lcd_disp_setup_m
6901                     	xdef	f_lcd_disp_setup_id
6902                     	xdef	f_lcd_disp_setup_mode
6903                     	xdef	f_lcd_disp_setup_run
6904                     	xdef	f_lcd_disp_setup_c
6905                     	xdef	f_lcd_disp_setup_link
6906                     	xdef	f_lcd_disp_plc
6907                     	xdef	f_lcd_disp_cnt_sub
6908                     	xdef	f_lcd_disp_cnt_host
6909                     	xdef	f_lcd_disp_freset
6910                     	xdef	f_lcd_disp_mir2
6911                     	xdef	f_lcd_disp_mir1
6912                     	xdef	f_lcd_disp_setup_cntl_tab
6913                     	xdef	f_lcd_disp_setup_cntl_2motor
6914                     	xdef	f_lcd_disp_setup_cntl_po
6915                     	xdef	f_lcd_disp_setup_cntl_on
6916                     	xdef	f_lcd_disp_setup_cntl_op
6917                     	xdef	f_lcd_disp_setup_len
6918                     	xdef	f_lcd_disp_setup_po_type_pb
6919                     	xdef	f_lcd_disp_setup_po_type_xl
6920                     	xdef	f_lcd_disp_setup_po_type
6921                     	xdef	f_lcd_disp_setup_temp_offset
6922                     	xdef	f_lcd_disp_setup_lpm
6923                     	xdef	f_lcd_disp_backlight
6924                     	xdef	f_lcd_clear_rid
6925                     	xdef	f_lcd_clear_run
6926                     	xdef	f_lcd_clear_mode
6927                     	xdef	f_lcd_clear_n
6928                     	xdef	f_lcd_clear_c
6929                     	xdef	f_lcd_clear_btn
6930                     	xdef	f_lcd_clear_backlight
6931                     	xdef	__rid
6932                     	xdef	_iLF_DEF
6933                     	xdef	_bLF_DEF
6934                     	xref	_uiInfo
6935                     	xref	___timer100ms
6936                     	xdef	f_lcd_cntl
6937                     	xdef	f_lcd_disp
6938                     	xdef	f_lcd_blink
6939                     	xdef	f_systemLcd
6940                     	xref	f_LCD_ContrastConfig
6941                     	xref	f_LCD_DeadTimeConfig
6942                     	xref	f_LCD_PulseOnDurationConfig
6943                     	xref	f_LCD_HighDriveCmd
6944                     	xref	f_LCD_Cmd
6945                     	xref	f_LCD_PortMaskConfig
6946                     	xref	f_LCD_Init
6947                     	xref	f_CLK_PeripheralClockConfig
6948                     	xref	f_CLK_RTCClockConfig
6949                     	xref.b	c_x
6968                     	xref	d_idiv
6969                     	xref	d_smodx
6970                     	end
