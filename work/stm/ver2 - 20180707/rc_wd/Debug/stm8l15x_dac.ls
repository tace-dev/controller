   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 139 void DAC_DeInit(void)
  49                     ; 140 {
  51                     	switch	.text
  52  0000               _DAC_DeInit:
  56                     ; 142   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  58  0000 725f5380      	clr	21376
  59                     ; 143   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  61  0004 725f5381      	clr	21377
  62                     ; 146   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  64  0008 725f5382      	clr	21378
  65                     ; 147   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  67  000c 725f5383      	clr	21379
  68                     ; 150   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  70  0010 725f5384      	clr	21380
  71                     ; 153   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  73  0014 35ff5385      	mov	21381,#255
  74                     ; 156   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  76  0018 725f5388      	clr	21384
  77                     ; 157   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  79  001c 725f5389      	clr	21385
  80                     ; 158   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  82  0020 725f538c      	clr	21388
  83                     ; 159   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  85  0024 725f538d      	clr	21389
  86                     ; 160   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  88  0028 725f5390      	clr	21392
  89                     ; 163   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  91  002c 725f5394      	clr	21396
  92                     ; 164   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  94  0030 725f5395      	clr	21397
  95                     ; 165   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  97  0034 725f5398      	clr	21400
  98                     ; 166   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
 100  0038 725f5399      	clr	21401
 101                     ; 167   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
 103  003c 725f539c      	clr	21404
 104                     ; 170   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 106  0040 725f53a0      	clr	21408
 107                     ; 171   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 109  0044 725f53a1      	clr	21409
 110                     ; 172   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 112  0048 725f53a2      	clr	21410
 113                     ; 173   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 115  004c 725f53a3      	clr	21411
 116                     ; 176   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 118  0050 725f53a4      	clr	21412
 119                     ; 177   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 121  0054 725f53a5      	clr	21413
 122                     ; 178   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 124  0058 725f53a6      	clr	21414
 125                     ; 179   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 127  005c 725f53a7      	clr	21415
 128                     ; 182   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 130  0060 725f53a8      	clr	21416
 131                     ; 183   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 133  0064 725f53a9      	clr	21417
 134                     ; 184 }
 137  0068 81            	ret	
 292                     ; 205 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 292                     ; 206               DAC_Trigger_TypeDef DAC_Trigger,
 292                     ; 207               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 292                     ; 208 {
 293                     	switch	.text
 294  0069               _DAC_Init:
 296  0069 89            	pushw	x
 297  006a 5203          	subw	sp,#3
 298       00000003      OFST:	set	3
 301                     ; 209   uint8_t tmpreg = 0;
 303                     ; 210   uint16_t tmpreg2 = 0;
 305                     ; 213   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 307                     ; 214   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 309                     ; 215   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 311                     ; 218   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 313  006c 9e            	ld	a,xh
 314  006d 48            	sll	a
 315  006e 5f            	clrw	x
 316  006f 97            	ld	xl,a
 317  0070 1f01          	ldw	(OFST-2,sp),x
 318                     ; 219   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 320  0072 d65380        	ld	a,(21376,x)
 321                     ; 222   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 323  0075 a4c1          	and	a,#193
 324                     ; 225   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 326  0077 1a08          	or	a,(OFST+5,sp)
 327  0079 6b03          	ld	(OFST+0,sp),a
 328                     ; 229   if (DAC_Trigger != DAC_Trigger_None)
 330  007b 7b05          	ld	a,(OFST+2,sp)
 331  007d a130          	cp	a,#48
 332  007f 2706          	jreq	L111
 333                     ; 232     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 335  0081 aa04          	or	a,#4
 336  0083 1a03          	or	a,(OFST+0,sp)
 337  0085 6b03          	ld	(OFST+0,sp),a
 338  0087               L111:
 339                     ; 236   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 341  0087 7b03          	ld	a,(OFST+0,sp)
 342  0089 d75380        	ld	(21376,x),a
 343                     ; 237 }
 346  008c 5b05          	addw	sp,#5
 347  008e 81            	ret	
 419                     ; 251 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 419                     ; 252 {
 420                     	switch	.text
 421  008f               _DAC_Cmd:
 423  008f 89            	pushw	x
 424  0090 89            	pushw	x
 425       00000002      OFST:	set	2
 428                     ; 253   uint16_t cr1addr = 0;
 430                     ; 255   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 432                     ; 256   assert_param(IS_FUNCTIONAL_STATE(NewState));
 434                     ; 259   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 436  0091 9e            	ld	a,xh
 437  0092 48            	sll	a
 438  0093 5f            	clrw	x
 439  0094 97            	ld	xl,a
 440  0095 1c5380        	addw	x,#21376
 441  0098 1f01          	ldw	(OFST-1,sp),x
 442                     ; 261   if (NewState != DISABLE)
 444  009a 7b04          	ld	a,(OFST+2,sp)
 445  009c 2705          	jreq	L741
 446                     ; 264     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 448  009e f6            	ld	a,(x)
 449  009f aa01          	or	a,#1
 451  00a1 2003          	jra	L151
 452  00a3               L741:
 453                     ; 269     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 455  00a3 f6            	ld	a,(x)
 456  00a4 a4fe          	and	a,#254
 457  00a6               L151:
 458  00a6 f7            	ld	(x),a
 459                     ; 271 }
 462  00a7 5b04          	addw	sp,#4
 463  00a9 81            	ret	
 509                     ; 283 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 509                     ; 284 {
 510                     	switch	.text
 511  00aa               _DAC_SoftwareTriggerCmd:
 513  00aa 89            	pushw	x
 514       00000000      OFST:	set	0
 517                     ; 286   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 519                     ; 287   assert_param(IS_FUNCTIONAL_STATE(NewState));
 521                     ; 289   if (NewState != DISABLE)
 523  00ab 9f            	ld	a,xl
 524  00ac 4d            	tnz	a
 525  00ad 2711          	jreq	L571
 526                     ; 292     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 528  00af 9e            	ld	a,xh
 529  00b0 5f            	clrw	x
 530  00b1 97            	ld	xl,a
 531  00b2 a601          	ld	a,#1
 532  00b4 5d            	tnzw	x
 533  00b5 2704          	jreq	L41
 534  00b7               L61:
 535  00b7 48            	sll	a
 536  00b8 5a            	decw	x
 537  00b9 26fc          	jrne	L61
 538  00bb               L41:
 539  00bb ca5384        	or	a,21380
 541  00be 2011          	jra	L771
 542  00c0               L571:
 543                     ; 297     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 545  00c0 7b01          	ld	a,(OFST+1,sp)
 546  00c2 5f            	clrw	x
 547  00c3 97            	ld	xl,a
 548  00c4 a601          	ld	a,#1
 549  00c6 5d            	tnzw	x
 550  00c7 2704          	jreq	L02
 551  00c9               L22:
 552  00c9 48            	sll	a
 553  00ca 5a            	decw	x
 554  00cb 26fc          	jrne	L22
 555  00cd               L02:
 556  00cd 43            	cpl	a
 557  00ce c45384        	and	a,21380
 558  00d1               L771:
 559  00d1 c75384        	ld	21380,a
 560                     ; 299 }
 563  00d4 85            	popw	x
 564  00d5 81            	ret	
 600                     ; 308 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 600                     ; 309 {
 601                     	switch	.text
 602  00d6               _DAC_DualSoftwareTriggerCmd:
 606                     ; 311   assert_param(IS_FUNCTIONAL_STATE(NewState));
 608                     ; 313   if (NewState != DISABLE)
 610  00d6 4d            	tnz	a
 611  00d7 2707          	jreq	L712
 612                     ; 316     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 614  00d9 c65384        	ld	a,21380
 615  00dc aa03          	or	a,#3
 617  00de 2005          	jra	L122
 618  00e0               L712:
 619                     ; 321     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 621  00e0 c65384        	ld	a,21380
 622  00e3 a4fc          	and	a,#252
 623  00e5               L122:
 624  00e5 c75384        	ld	21380,a
 625                     ; 323 }
 628  00e8 81            	ret	
 711                     ; 339 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 711                     ; 340                            DAC_Wave_TypeDef DAC_Wave,
 711                     ; 341                            FunctionalState NewState)
 711                     ; 342 {
 712                     	switch	.text
 713  00e9               _DAC_WaveGenerationCmd:
 715  00e9 89            	pushw	x
 716  00ea 88            	push	a
 717       00000001      OFST:	set	1
 720                     ; 343   uint8_t tmpreg = 0;
 722                     ; 346   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 724                     ; 347   assert_param(IS_DAC_WAVE(DAC_Wave));
 726                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 728                     ; 351   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 730  00eb 9e            	ld	a,xh
 731  00ec 48            	sll	a
 732  00ed 5f            	clrw	x
 733  00ee 97            	ld	xl,a
 734  00ef d65380        	ld	a,(21376,x)
 735  00f2 a43f          	and	a,#63
 736                     ; 353   if (NewState != DISABLE)
 738  00f4 0d06          	tnz	(OFST+5,sp)
 739  00f6 2702          	jreq	L362
 740                     ; 355     tmpreg |= (uint8_t)(DAC_Wave);
 742  00f8 1a03          	or	a,(OFST+2,sp)
 743  00fa               L362:
 744  00fa 6b01          	ld	(OFST+0,sp),a
 745                     ; 359   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 747  00fc 7b02          	ld	a,(OFST+1,sp)
 748  00fe 48            	sll	a
 749  00ff 5f            	clrw	x
 750  0100 97            	ld	xl,a
 751  0101 7b01          	ld	a,(OFST+0,sp)
 752  0103 d75380        	ld	(21376,x),a
 753                     ; 361 }
 756  0106 5b03          	addw	sp,#3
 757  0108 81            	ret	
 919                     ; 385 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 919                     ; 386 {
 920                     	switch	.text
 921  0109               _DAC_SetNoiseWaveLFSR:
 923  0109 89            	pushw	x
 924  010a 5203          	subw	sp,#3
 925       00000003      OFST:	set	3
 928                     ; 387   uint8_t tmpreg = 0;
 930                     ; 388   uint16_t cr2addr = 0;
 932                     ; 391   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 934                     ; 392   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 936                     ; 395   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 938  010c 9e            	ld	a,xh
 939  010d 48            	sll	a
 940  010e 5f            	clrw	x
 941  010f 97            	ld	xl,a
 942  0110 1c5381        	addw	x,#21377
 943  0113 1f02          	ldw	(OFST-1,sp),x
 944                     ; 396   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 946  0115 f6            	ld	a,(x)
 947  0116 a4f0          	and	a,#240
 948  0118 6b01          	ld	(OFST-2,sp),a
 949                     ; 399   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 951  011a 1a05          	or	a,(OFST+2,sp)
 952  011c f7            	ld	(x),a
 953                     ; 400 }
 956  011d 5b05          	addw	sp,#5
 957  011f 81            	ret	
1120                     ; 424 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1120                     ; 425 {
1121                     	switch	.text
1122  0120               _DAC_SetTriangleWaveAmplitude:
1124  0120 89            	pushw	x
1125  0121 5203          	subw	sp,#3
1126       00000003      OFST:	set	3
1129                     ; 426   uint8_t tmpreg = 0;
1131                     ; 427   uint16_t cr2addr = 0;
1133                     ; 430   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1135                     ; 431   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1137                     ; 435   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1139  0123 9e            	ld	a,xh
1140  0124 48            	sll	a
1141  0125 5f            	clrw	x
1142  0126 97            	ld	xl,a
1143  0127 1c5381        	addw	x,#21377
1144  012a 1f02          	ldw	(OFST-1,sp),x
1145                     ; 436   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1147  012c f6            	ld	a,(x)
1148  012d a4f0          	and	a,#240
1149  012f 6b01          	ld	(OFST-2,sp),a
1150                     ; 439   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1152  0131 1a05          	or	a,(OFST+2,sp)
1153  0133 f7            	ld	(x),a
1154                     ; 440 }
1157  0134 5b05          	addw	sp,#5
1158  0136 81            	ret	
1228                     ; 452 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1228                     ; 453 {
1229                     	switch	.text
1230  0137               _DAC_SetChannel1Data:
1232  0137 88            	push	a
1233       00000000      OFST:	set	0
1236                     ; 455   assert_param(IS_DAC_ALIGN(DAC_Align));
1238                     ; 457   if (DAC_Align != DAC_Align_8b_R)
1240  0138 a108          	cp	a,#8
1241  013a 2712          	jreq	L364
1242                     ; 460     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1244  013c 5f            	clrw	x
1245  013d 97            	ld	xl,a
1246  013e 7b04          	ld	a,(OFST+4,sp)
1247  0140 d75388        	ld	(21384,x),a
1248                     ; 461     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1250  0143 5f            	clrw	x
1251  0144 7b01          	ld	a,(OFST+1,sp)
1252  0146 97            	ld	xl,a
1253  0147 7b05          	ld	a,(OFST+5,sp)
1254  0149 d75389        	ld	(21385,x),a
1256  014c 2005          	jra	L564
1257  014e               L364:
1258                     ; 466     assert_param(IS_DAC_DATA_08R(DAC_Data));
1260                     ; 469     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1262  014e 7b05          	ld	a,(OFST+5,sp)
1263  0150 c75390        	ld	21392,a
1264  0153               L564:
1265                     ; 471 }
1268  0153 84            	pop	a
1269  0154 81            	ret	
1312                     ; 483 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1312                     ; 484 {
1313                     	switch	.text
1314  0155               _DAC_SetChannel2Data:
1316  0155 88            	push	a
1317       00000000      OFST:	set	0
1320                     ; 486   assert_param(IS_DAC_ALIGN(DAC_Align));
1322                     ; 488   if (DAC_Align != DAC_Align_8b_R)
1324  0156 a108          	cp	a,#8
1325  0158 2712          	jreq	L705
1326                     ; 491     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1328  015a 5f            	clrw	x
1329  015b 97            	ld	xl,a
1330  015c 7b04          	ld	a,(OFST+4,sp)
1331  015e d75394        	ld	(21396,x),a
1332                     ; 492     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1334  0161 5f            	clrw	x
1335  0162 7b01          	ld	a,(OFST+1,sp)
1336  0164 97            	ld	xl,a
1337  0165 7b05          	ld	a,(OFST+5,sp)
1338  0167 d75395        	ld	(21397,x),a
1340  016a 2005          	jra	L115
1341  016c               L705:
1342                     ; 497     assert_param(IS_DAC_DATA_08R(DAC_Data));
1344                     ; 500     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1346  016c 7b05          	ld	a,(OFST+5,sp)
1347  016e c7539c        	ld	21404,a
1348  0171               L115:
1349                     ; 502 }
1352  0171 84            	pop	a
1353  0172 81            	ret	
1410                     ; 519 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1410                     ; 520 {
1411                     	switch	.text
1412  0173               _DAC_SetDualChannelData:
1414  0173 88            	push	a
1415  0174 89            	pushw	x
1416       00000002      OFST:	set	2
1419                     ; 521   uint16_t dchxrdhrhaddr = 0;
1421                     ; 524   assert_param(IS_DAC_ALIGN(DAC_Align));
1423                     ; 526   if (DAC_Align != DAC_Align_8b_R)
1425  0175 a108          	cp	a,#8
1426  0177 271e          	jreq	L735
1427                     ; 529     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1429  0179 a653          	ld	a,#83
1430  017b 97            	ld	xl,a
1431  017c a6a0          	ld	a,#160
1432  017e 1b03          	add	a,(OFST+1,sp)
1433  0180 2401          	jrnc	L24
1434  0182 5c            	incw	x
1435  0183               L24:
1436  0183 02            	rlwa	x,a
1437  0184 1f01          	ldw	(OFST-1,sp),x
1438                     ; 532     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1440  0186 7b08          	ld	a,(OFST+6,sp)
1441  0188 f7            	ld	(x),a
1442                     ; 533     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1444  0189 7b09          	ld	a,(OFST+7,sp)
1445  018b e701          	ld	(1,x),a
1446                     ; 534     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1448  018d 7b06          	ld	a,(OFST+4,sp)
1449  018f e702          	ld	(2,x),a
1450                     ; 535     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1452  0191 7b07          	ld	a,(OFST+5,sp)
1453  0193 e703          	ld	(3,x),a
1455  0195 200a          	jra	L145
1456  0197               L735:
1457                     ; 540     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1459                     ; 543     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1461  0197 7b09          	ld	a,(OFST+7,sp)
1462  0199 c753a8        	ld	21416,a
1463                     ; 544     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1465  019c 7b07          	ld	a,(OFST+5,sp)
1466  019e c753a9        	ld	21417,a
1467  01a1               L145:
1468                     ; 546 }
1471  01a1 5b03          	addw	sp,#3
1472  01a3 81            	ret	
1522                     ; 556 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1522                     ; 557 {
1523                     	switch	.text
1524  01a4               _DAC_GetDataOutputValue:
1526  01a4 89            	pushw	x
1527       00000002      OFST:	set	2
1530                     ; 558   uint16_t outputdata = 0;
1532                     ; 559   uint16_t tmp = 0;
1534                     ; 562   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1536                     ; 564   if ( DAC_Channel ==  DAC_Channel_1)
1538  01a5 4d            	tnz	a
1539  01a6 260d          	jrne	L565
1540                     ; 567     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1542  01a8 c653ac        	ld	a,21420
1543  01ab 97            	ld	xl,a
1544  01ac 4f            	clr	a
1545  01ad 02            	rlwa	x,a
1546  01ae 1f01          	ldw	(OFST-1,sp),x
1547                     ; 568     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1549  01b0 c653ad        	ld	a,21421
1551  01b3 200b          	jra	L765
1552  01b5               L565:
1553                     ; 573     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1555  01b5 c653b0        	ld	a,21424
1556  01b8 97            	ld	xl,a
1557  01b9 4f            	clr	a
1558  01ba 02            	rlwa	x,a
1559  01bb 1f01          	ldw	(OFST-1,sp),x
1560                     ; 574     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1562  01bd c653b1        	ld	a,21425
1563  01c0               L765:
1564  01c0 5f            	clrw	x
1565  01c1 97            	ld	xl,a
1566  01c2 01            	rrwa	x,a
1567  01c3 1a02          	or	a,(OFST+0,sp)
1568  01c5 01            	rrwa	x,a
1569  01c6 1a01          	or	a,(OFST-1,sp)
1570  01c8 01            	rrwa	x,a
1571                     ; 578   return (uint16_t)outputdata;
1575  01c9 5b02          	addw	sp,#2
1576  01cb 81            	ret	
1628                     ; 610 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1628                     ; 611 {
1629                     	switch	.text
1630  01cc               _DAC_DMACmd:
1632  01cc 89            	pushw	x
1633  01cd 89            	pushw	x
1634       00000002      OFST:	set	2
1637                     ; 612   uint16_t cr2addr = 0;
1639                     ; 615   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1641                     ; 616   assert_param(IS_FUNCTIONAL_STATE(NewState));
1643                     ; 619   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1645  01ce 9e            	ld	a,xh
1646  01cf 48            	sll	a
1647  01d0 5f            	clrw	x
1648  01d1 97            	ld	xl,a
1649  01d2 1c5381        	addw	x,#21377
1650  01d5 1f01          	ldw	(OFST-1,sp),x
1651                     ; 621   if (NewState != DISABLE)
1653  01d7 7b04          	ld	a,(OFST+2,sp)
1654  01d9 2705          	jreq	L516
1655                     ; 624     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1657  01db f6            	ld	a,(x)
1658  01dc aa10          	or	a,#16
1660  01de 2003          	jra	L716
1661  01e0               L516:
1662                     ; 629     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1664  01e0 f6            	ld	a,(x)
1665  01e1 a4ef          	and	a,#239
1666  01e3               L716:
1667  01e3 f7            	ld	(x),a
1668                     ; 631 }
1671  01e4 5b04          	addw	sp,#4
1672  01e6 81            	ret	
1747                     ; 664 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1747                     ; 665 {
1748                     	switch	.text
1749  01e7               _DAC_ITConfig:
1751  01e7 89            	pushw	x
1752  01e8 89            	pushw	x
1753       00000002      OFST:	set	2
1756                     ; 666   uint16_t cr2addr = 0;
1758                     ; 669   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1760                     ; 670   assert_param(IS_FUNCTIONAL_STATE(NewState));
1762                     ; 671   assert_param(IS_DAC_IT(DAC_IT));
1764                     ; 674   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1766  01e9 9e            	ld	a,xh
1767  01ea 48            	sll	a
1768  01eb 5f            	clrw	x
1769  01ec 97            	ld	xl,a
1770  01ed 1c5381        	addw	x,#21377
1771  01f0 1f01          	ldw	(OFST-1,sp),x
1772                     ; 676   if (NewState != DISABLE)
1774  01f2 7b07          	ld	a,(OFST+5,sp)
1775  01f4 2705          	jreq	L756
1776                     ; 679     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1778  01f6 f6            	ld	a,(x)
1779  01f7 1a04          	or	a,(OFST+2,sp)
1781  01f9 2004          	jra	L166
1782  01fb               L756:
1783                     ; 684     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1785  01fb 7b04          	ld	a,(OFST+2,sp)
1786  01fd 43            	cpl	a
1787  01fe f4            	and	a,(x)
1788  01ff               L166:
1789  01ff f7            	ld	(x),a
1790                     ; 686 }
1793  0200 5b04          	addw	sp,#4
1794  0202 81            	ret	
1890                     ; 701 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1890                     ; 702 {
1891                     	switch	.text
1892  0203               _DAC_GetFlagStatus:
1894  0203 89            	pushw	x
1895  0204 88            	push	a
1896       00000001      OFST:	set	1
1899                     ; 703   FlagStatus flagstatus = RESET;
1901                     ; 704   uint8_t flag = 0;
1903                     ; 707   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1905                     ; 708   assert_param(IS_DAC_FLAG(DAC_FLAG));
1907                     ; 710   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1909  0205 9e            	ld	a,xh
1910  0206 5f            	clrw	x
1911  0207 97            	ld	xl,a
1912  0208 7b03          	ld	a,(OFST+2,sp)
1913  020a 5d            	tnzw	x
1914  020b 2704          	jreq	L45
1915  020d               L65:
1916  020d 48            	sll	a
1917  020e 5a            	decw	x
1918  020f 26fc          	jrne	L65
1919  0211               L45:
1920  0211 6b01          	ld	(OFST+0,sp),a
1921                     ; 713   if ((DAC->SR & flag ) != (uint8_t)RESET)
1923  0213 c65385        	ld	a,21381
1924  0216 1501          	bcp	a,(OFST+0,sp)
1925  0218 2704          	jreq	L137
1926                     ; 716     flagstatus = SET;
1928  021a a601          	ld	a,#1
1930  021c 2001          	jra	L337
1931  021e               L137:
1932                     ; 721     flagstatus = RESET;
1934  021e 4f            	clr	a
1935  021f               L337:
1936                     ; 725   return  flagstatus;
1940  021f 5b03          	addw	sp,#3
1941  0221 81            	ret	
1993                     ; 739 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1993                     ; 740 {
1994                     	switch	.text
1995  0222               _DAC_ClearFlag:
1997  0222 89            	pushw	x
1998  0223 88            	push	a
1999       00000001      OFST:	set	1
2002                     ; 741   uint8_t flag = 0;
2004                     ; 744   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2006                     ; 745   assert_param(IS_DAC_FLAG(DAC_FLAG));
2008                     ; 748   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2010  0224 9e            	ld	a,xh
2011  0225 5f            	clrw	x
2012  0226 97            	ld	xl,a
2013  0227 7b03          	ld	a,(OFST+2,sp)
2014  0229 5d            	tnzw	x
2015  022a 2704          	jreq	L26
2016  022c               L46:
2017  022c 48            	sll	a
2018  022d 5a            	decw	x
2019  022e 26fc          	jrne	L46
2020  0230               L26:
2021                     ; 751   DAC->SR = (uint8_t)(~flag);
2023  0230 43            	cpl	a
2024  0231 c75385        	ld	21381,a
2025                     ; 752 }
2028  0234 5b03          	addw	sp,#3
2029  0236 81            	ret	
2106                     ; 767 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2106                     ; 768 {
2107                     	switch	.text
2108  0237               _DAC_GetITStatus:
2110  0237 89            	pushw	x
2111  0238 89            	pushw	x
2112       00000002      OFST:	set	2
2115                     ; 769   ITStatus itstatus = RESET;
2117                     ; 770   uint8_t enablestatus = 0;
2119                     ; 771   uint8_t flagstatus = 0;
2121                     ; 772   uint8_t tempreg = 0;
2123                     ; 775   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2125                     ; 776   assert_param(IS_DAC_IT(DAC_IT));
2127                     ; 779   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2129  0239 9e            	ld	a,xh
2130  023a 48            	sll	a
2131  023b 48            	sll	a
2132  023c 5f            	clrw	x
2133  023d 97            	ld	xl,a
2134  023e d65381        	ld	a,(21377,x)
2135  0241 6b02          	ld	(OFST+0,sp),a
2136                     ; 780   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2138  0243 5f            	clrw	x
2139  0244 7b03          	ld	a,(OFST+1,sp)
2140  0246 97            	ld	xl,a
2141  0247 7b04          	ld	a,(OFST+2,sp)
2142  0249 5d            	tnzw	x
2143  024a 2704          	jreq	L07
2144  024c               L27:
2145  024c 48            	sll	a
2146  024d 5a            	decw	x
2147  024e 26fc          	jrne	L27
2148  0250               L07:
2149  0250 1402          	and	a,(OFST+0,sp)
2150  0252 6b01          	ld	(OFST-1,sp),a
2151                     ; 781   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2153  0254 a605          	ld	a,#5
2154  0256 1003          	sub	a,(OFST+1,sp)
2155  0258 5f            	clrw	x
2156  0259 97            	ld	xl,a
2157  025a 7b04          	ld	a,(OFST+2,sp)
2158  025c 5d            	tnzw	x
2159  025d 2704          	jreq	L47
2160  025f               L67:
2161  025f 44            	srl	a
2162  0260 5a            	decw	x
2163  0261 26fc          	jrne	L67
2164  0263               L47:
2165  0263 c45385        	and	a,21381
2166  0266 6b02          	ld	(OFST+0,sp),a
2167                     ; 784   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2169  0268 2708          	jreq	L5101
2171  026a 7b01          	ld	a,(OFST-1,sp)
2172  026c 2704          	jreq	L5101
2173                     ; 787     itstatus = SET;
2175  026e a601          	ld	a,#1
2177  0270 2001          	jra	L7101
2178  0272               L5101:
2179                     ; 792     itstatus = RESET;
2181  0272 4f            	clr	a
2182  0273               L7101:
2183                     ; 796   return  itstatus;
2187  0273 5b04          	addw	sp,#4
2188  0275 81            	ret	
2234                     ; 810 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2234                     ; 811 {
2235                     	switch	.text
2236  0276               _DAC_ClearITPendingBit:
2238  0276 89            	pushw	x
2239       00000000      OFST:	set	0
2242                     ; 813   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2244                     ; 814   assert_param(IS_DAC_IT(DAC_IT));
2246                     ; 817   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2248  0277 9e            	ld	a,xh
2249  0278 a005          	sub	a,#5
2250  027a 40            	neg	a
2251  027b 5f            	clrw	x
2252  027c 97            	ld	xl,a
2253  027d 7b02          	ld	a,(OFST+2,sp)
2254  027f 5d            	tnzw	x
2255  0280 2704          	jreq	L201
2256  0282               L401:
2257  0282 44            	srl	a
2258  0283 5a            	decw	x
2259  0284 26fc          	jrne	L401
2260  0286               L201:
2261  0286 43            	cpl	a
2262  0287 c75385        	ld	21381,a
2263                     ; 818 }
2266  028a 85            	popw	x
2267  028b 81            	ret	
2280                     	xdef	_DAC_ClearITPendingBit
2281                     	xdef	_DAC_GetITStatus
2282                     	xdef	_DAC_ClearFlag
2283                     	xdef	_DAC_GetFlagStatus
2284                     	xdef	_DAC_ITConfig
2285                     	xdef	_DAC_DMACmd
2286                     	xdef	_DAC_GetDataOutputValue
2287                     	xdef	_DAC_SetDualChannelData
2288                     	xdef	_DAC_SetChannel2Data
2289                     	xdef	_DAC_SetChannel1Data
2290                     	xdef	_DAC_SetTriangleWaveAmplitude
2291                     	xdef	_DAC_SetNoiseWaveLFSR
2292                     	xdef	_DAC_WaveGenerationCmd
2293                     	xdef	_DAC_DualSoftwareTriggerCmd
2294                     	xdef	_DAC_SoftwareTriggerCmd
2295                     	xdef	_DAC_Cmd
2296                     	xdef	_DAC_Init
2297                     	xdef	_DAC_DeInit
2316                     	end
