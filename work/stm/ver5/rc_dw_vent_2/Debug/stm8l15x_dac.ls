   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 139 void DAC_DeInit(void)
  50                     ; 140 {
  51                     .text:	section	.text,new
  52  0000               f_DAC_DeInit:
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
 137  0068 87            	retf	
 291                     ; 205 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 291                     ; 206               DAC_Trigger_TypeDef DAC_Trigger,
 291                     ; 207               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 291                     ; 208 {
 292                     .text:	section	.text,new
 293  0000               f_DAC_Init:
 295  0000 89            	pushw	x
 296  0001 5203          	subw	sp,#3
 297       00000003      OFST:	set	3
 300                     ; 209   uint8_t tmpreg = 0;
 302                     ; 210   uint16_t tmpreg2 = 0;
 304                     ; 213   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 306                     ; 214   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 308                     ; 215   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 310                     ; 218   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 312  0003 9e            	ld	a,xh
 313  0004 48            	sll	a
 314  0005 5f            	clrw	x
 315  0006 97            	ld	xl,a
 316  0007 1f01          	ldw	(OFST-2,sp),x
 317                     ; 219   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 319  0009 d65380        	ld	a,(21376,x)
 320                     ; 222   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 322  000c a4c1          	and	a,#193
 323                     ; 225   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 325  000e 1a09          	or	a,(OFST+6,sp)
 326  0010 6b03          	ld	(OFST+0,sp),a
 327                     ; 229   if (DAC_Trigger != DAC_Trigger_None)
 329  0012 7b05          	ld	a,(OFST+2,sp)
 330  0014 a130          	cp	a,#48
 331  0016 2706          	jreq	L111
 332                     ; 232     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 334  0018 aa04          	or	a,#4
 335  001a 1a03          	or	a,(OFST+0,sp)
 336  001c 6b03          	ld	(OFST+0,sp),a
 337  001e               L111:
 338                     ; 236   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 340  001e 7b03          	ld	a,(OFST+0,sp)
 341  0020 d75380        	ld	(21376,x),a
 342                     ; 237 }
 345  0023 5b05          	addw	sp,#5
 346  0025 87            	retf	
 417                     ; 251 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 417                     ; 252 {
 418                     .text:	section	.text,new
 419  0000               f_DAC_Cmd:
 421  0000 89            	pushw	x
 422  0001 89            	pushw	x
 423       00000002      OFST:	set	2
 426                     ; 253   uint16_t cr1addr = 0;
 428                     ; 255   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 430                     ; 256   assert_param(IS_FUNCTIONAL_STATE(NewState));
 432                     ; 259   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 434  0002 9e            	ld	a,xh
 435  0003 48            	sll	a
 436  0004 5f            	clrw	x
 437  0005 97            	ld	xl,a
 438  0006 1c5380        	addw	x,#21376
 439  0009 1f01          	ldw	(OFST-1,sp),x
 440                     ; 261   if (NewState != DISABLE)
 442  000b 7b04          	ld	a,(OFST+2,sp)
 443  000d 2705          	jreq	L741
 444                     ; 264     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 446  000f f6            	ld	a,(x)
 447  0010 aa01          	or	a,#1
 449  0012 2003          	jra	L151
 450  0014               L741:
 451                     ; 269     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 453  0014 f6            	ld	a,(x)
 454  0015 a4fe          	and	a,#254
 455  0017               L151:
 456  0017 f7            	ld	(x),a
 457                     ; 271 }
 460  0018 5b04          	addw	sp,#4
 461  001a 87            	retf	
 506                     ; 283 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 506                     ; 284 {
 507                     .text:	section	.text,new
 508  0000               f_DAC_SoftwareTriggerCmd:
 510  0000 89            	pushw	x
 511       00000000      OFST:	set	0
 514                     ; 286   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 516                     ; 287   assert_param(IS_FUNCTIONAL_STATE(NewState));
 518                     ; 289   if (NewState != DISABLE)
 520  0001 9f            	ld	a,xl
 521  0002 4d            	tnz	a
 522  0003 2711          	jreq	L571
 523                     ; 292     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 525  0005 9e            	ld	a,xh
 526  0006 5f            	clrw	x
 527  0007 97            	ld	xl,a
 528  0008 a601          	ld	a,#1
 529  000a 5d            	tnzw	x
 530  000b 2704          	jreq	L41
 531  000d               L61:
 532  000d 48            	sll	a
 533  000e 5a            	decw	x
 534  000f 26fc          	jrne	L61
 535  0011               L41:
 536  0011 ca5384        	or	a,21380
 538  0014 2011          	jra	L771
 539  0016               L571:
 540                     ; 297     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 542  0016 7b01          	ld	a,(OFST+1,sp)
 543  0018 5f            	clrw	x
 544  0019 97            	ld	xl,a
 545  001a a601          	ld	a,#1
 546  001c 5d            	tnzw	x
 547  001d 2704          	jreq	L02
 548  001f               L22:
 549  001f 48            	sll	a
 550  0020 5a            	decw	x
 551  0021 26fc          	jrne	L22
 552  0023               L02:
 553  0023 43            	cpl	a
 554  0024 c45384        	and	a,21380
 555  0027               L771:
 556  0027 c75384        	ld	21380,a
 557                     ; 299 }
 560  002a 85            	popw	x
 561  002b 87            	retf	
 596                     ; 308 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 596                     ; 309 {
 597                     .text:	section	.text,new
 598  0000               f_DAC_DualSoftwareTriggerCmd:
 602                     ; 311   assert_param(IS_FUNCTIONAL_STATE(NewState));
 604                     ; 313   if (NewState != DISABLE)
 606  0000 4d            	tnz	a
 607  0001 2707          	jreq	L712
 608                     ; 316     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 610  0003 c65384        	ld	a,21380
 611  0006 aa03          	or	a,#3
 613  0008 2005          	jra	L122
 614  000a               L712:
 615                     ; 321     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 617  000a c65384        	ld	a,21380
 618  000d a4fc          	and	a,#252
 619  000f               L122:
 620  000f c75384        	ld	21380,a
 621                     ; 323 }
 624  0012 87            	retf	
 706                     ; 339 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 706                     ; 340                            DAC_Wave_TypeDef DAC_Wave,
 706                     ; 341                            FunctionalState NewState)
 706                     ; 342 {
 707                     .text:	section	.text,new
 708  0000               f_DAC_WaveGenerationCmd:
 710  0000 89            	pushw	x
 711  0001 88            	push	a
 712       00000001      OFST:	set	1
 715                     ; 343   uint8_t tmpreg = 0;
 717                     ; 346   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 719                     ; 347   assert_param(IS_DAC_WAVE(DAC_Wave));
 721                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 723                     ; 351   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 725  0002 9e            	ld	a,xh
 726  0003 48            	sll	a
 727  0004 5f            	clrw	x
 728  0005 97            	ld	xl,a
 729  0006 d65380        	ld	a,(21376,x)
 730  0009 a43f          	and	a,#63
 731                     ; 353   if (NewState != DISABLE)
 733  000b 0d07          	tnz	(OFST+6,sp)
 734  000d 2702          	jreq	L362
 735                     ; 355     tmpreg |= (uint8_t)(DAC_Wave);
 737  000f 1a03          	or	a,(OFST+2,sp)
 738  0011               L362:
 739  0011 6b01          	ld	(OFST+0,sp),a
 740                     ; 359   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 742  0013 7b02          	ld	a,(OFST+1,sp)
 743  0015 48            	sll	a
 744  0016 5f            	clrw	x
 745  0017 97            	ld	xl,a
 746  0018 7b01          	ld	a,(OFST+0,sp)
 747  001a d75380        	ld	(21376,x),a
 748                     ; 361 }
 751  001d 5b03          	addw	sp,#3
 752  001f 87            	retf	
 913                     ; 385 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 913                     ; 386 {
 914                     .text:	section	.text,new
 915  0000               f_DAC_SetNoiseWaveLFSR:
 917  0000 89            	pushw	x
 918  0001 5203          	subw	sp,#3
 919       00000003      OFST:	set	3
 922                     ; 387   uint8_t tmpreg = 0;
 924                     ; 388   uint16_t cr2addr = 0;
 926                     ; 391   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 928                     ; 392   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 930                     ; 395   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 932  0003 9e            	ld	a,xh
 933  0004 48            	sll	a
 934  0005 5f            	clrw	x
 935  0006 97            	ld	xl,a
 936  0007 1c5381        	addw	x,#21377
 937  000a 1f02          	ldw	(OFST-1,sp),x
 938                     ; 396   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 940  000c f6            	ld	a,(x)
 941  000d a4f0          	and	a,#240
 942  000f 6b01          	ld	(OFST-2,sp),a
 943                     ; 399   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 945  0011 1a05          	or	a,(OFST+2,sp)
 946  0013 f7            	ld	(x),a
 947                     ; 400 }
 950  0014 5b05          	addw	sp,#5
 951  0016 87            	retf	
1113                     ; 424 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1113                     ; 425 {
1114                     .text:	section	.text,new
1115  0000               f_DAC_SetTriangleWaveAmplitude:
1117  0000 89            	pushw	x
1118  0001 5203          	subw	sp,#3
1119       00000003      OFST:	set	3
1122                     ; 426   uint8_t tmpreg = 0;
1124                     ; 427   uint16_t cr2addr = 0;
1126                     ; 430   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1128                     ; 431   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1130                     ; 435   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1132  0003 9e            	ld	a,xh
1133  0004 48            	sll	a
1134  0005 5f            	clrw	x
1135  0006 97            	ld	xl,a
1136  0007 1c5381        	addw	x,#21377
1137  000a 1f02          	ldw	(OFST-1,sp),x
1138                     ; 436   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1140  000c f6            	ld	a,(x)
1141  000d a4f0          	and	a,#240
1142  000f 6b01          	ld	(OFST-2,sp),a
1143                     ; 439   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1145  0011 1a05          	or	a,(OFST+2,sp)
1146  0013 f7            	ld	(x),a
1147                     ; 440 }
1150  0014 5b05          	addw	sp,#5
1151  0016 87            	retf	
1220                     ; 452 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1220                     ; 453 {
1221                     .text:	section	.text,new
1222  0000               f_DAC_SetChannel1Data:
1224  0000 88            	push	a
1225       00000000      OFST:	set	0
1228                     ; 455   assert_param(IS_DAC_ALIGN(DAC_Align));
1230                     ; 457   if (DAC_Align != DAC_Align_8b_R)
1232  0001 a108          	cp	a,#8
1233  0003 2712          	jreq	L364
1234                     ; 460     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1236  0005 5f            	clrw	x
1237  0006 97            	ld	xl,a
1238  0007 7b05          	ld	a,(OFST+5,sp)
1239  0009 d75388        	ld	(21384,x),a
1240                     ; 461     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1242  000c 5f            	clrw	x
1243  000d 7b01          	ld	a,(OFST+1,sp)
1244  000f 97            	ld	xl,a
1245  0010 7b06          	ld	a,(OFST+6,sp)
1246  0012 d75389        	ld	(21385,x),a
1248  0015 2005          	jra	L564
1249  0017               L364:
1250                     ; 466     assert_param(IS_DAC_DATA_08R(DAC_Data));
1252                     ; 469     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1254  0017 7b06          	ld	a,(OFST+6,sp)
1255  0019 c75390        	ld	21392,a
1256  001c               L564:
1257                     ; 471 }
1260  001c 84            	pop	a
1261  001d 87            	retf	
1303                     ; 483 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1303                     ; 484 {
1304                     .text:	section	.text,new
1305  0000               f_DAC_SetChannel2Data:
1307  0000 88            	push	a
1308       00000000      OFST:	set	0
1311                     ; 486   assert_param(IS_DAC_ALIGN(DAC_Align));
1313                     ; 488   if (DAC_Align != DAC_Align_8b_R)
1315  0001 a108          	cp	a,#8
1316  0003 2712          	jreq	L705
1317                     ; 491     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1319  0005 5f            	clrw	x
1320  0006 97            	ld	xl,a
1321  0007 7b05          	ld	a,(OFST+5,sp)
1322  0009 d75394        	ld	(21396,x),a
1323                     ; 492     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1325  000c 5f            	clrw	x
1326  000d 7b01          	ld	a,(OFST+1,sp)
1327  000f 97            	ld	xl,a
1328  0010 7b06          	ld	a,(OFST+6,sp)
1329  0012 d75395        	ld	(21397,x),a
1331  0015 2005          	jra	L115
1332  0017               L705:
1333                     ; 497     assert_param(IS_DAC_DATA_08R(DAC_Data));
1335                     ; 500     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1337  0017 7b06          	ld	a,(OFST+6,sp)
1338  0019 c7539c        	ld	21404,a
1339  001c               L115:
1340                     ; 502 }
1343  001c 84            	pop	a
1344  001d 87            	retf	
1400                     ; 519 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1400                     ; 520 {
1401                     .text:	section	.text,new
1402  0000               f_DAC_SetDualChannelData:
1404  0000 88            	push	a
1405  0001 89            	pushw	x
1406       00000002      OFST:	set	2
1409                     ; 521   uint16_t dchxrdhrhaddr = 0;
1411                     ; 524   assert_param(IS_DAC_ALIGN(DAC_Align));
1413                     ; 526   if (DAC_Align != DAC_Align_8b_R)
1415  0002 a108          	cp	a,#8
1416  0004 271e          	jreq	L735
1417                     ; 529     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1419  0006 a653          	ld	a,#83
1420  0008 97            	ld	xl,a
1421  0009 a6a0          	ld	a,#160
1422  000b 1b03          	add	a,(OFST+1,sp)
1423  000d 2401          	jrnc	L24
1424  000f 5c            	incw	x
1425  0010               L24:
1426  0010 02            	rlwa	x,a
1427  0011 1f01          	ldw	(OFST-1,sp),x
1428                     ; 532     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1430  0013 7b09          	ld	a,(OFST+7,sp)
1431  0015 f7            	ld	(x),a
1432                     ; 533     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1434  0016 7b0a          	ld	a,(OFST+8,sp)
1435  0018 e701          	ld	(1,x),a
1436                     ; 534     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1438  001a 7b07          	ld	a,(OFST+5,sp)
1439  001c e702          	ld	(2,x),a
1440                     ; 535     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1442  001e 7b08          	ld	a,(OFST+6,sp)
1443  0020 e703          	ld	(3,x),a
1445  0022 200a          	jra	L145
1446  0024               L735:
1447                     ; 540     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1449                     ; 543     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1451  0024 7b0a          	ld	a,(OFST+8,sp)
1452  0026 c753a8        	ld	21416,a
1453                     ; 544     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1455  0029 7b08          	ld	a,(OFST+6,sp)
1456  002b c753a9        	ld	21417,a
1457  002e               L145:
1458                     ; 546 }
1461  002e 5b03          	addw	sp,#3
1462  0030 87            	retf	
1511                     ; 556 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1511                     ; 557 {
1512                     .text:	section	.text,new
1513  0000               f_DAC_GetDataOutputValue:
1515  0000 89            	pushw	x
1516       00000002      OFST:	set	2
1519                     ; 558   uint16_t outputdata = 0;
1521                     ; 559   uint16_t tmp = 0;
1523                     ; 562   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1525                     ; 564   if ( DAC_Channel ==  DAC_Channel_1)
1527  0001 4d            	tnz	a
1528  0002 260d          	jrne	L565
1529                     ; 567     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1531  0004 c653ac        	ld	a,21420
1532  0007 97            	ld	xl,a
1533  0008 4f            	clr	a
1534  0009 02            	rlwa	x,a
1535  000a 1f01          	ldw	(OFST-1,sp),x
1536                     ; 568     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1538  000c c653ad        	ld	a,21421
1540  000f 200b          	jra	L765
1541  0011               L565:
1542                     ; 573     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1544  0011 c653b0        	ld	a,21424
1545  0014 97            	ld	xl,a
1546  0015 4f            	clr	a
1547  0016 02            	rlwa	x,a
1548  0017 1f01          	ldw	(OFST-1,sp),x
1549                     ; 574     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1551  0019 c653b1        	ld	a,21425
1552  001c               L765:
1553  001c 5f            	clrw	x
1554  001d 97            	ld	xl,a
1555  001e 01            	rrwa	x,a
1556  001f 1a02          	or	a,(OFST+0,sp)
1557  0021 01            	rrwa	x,a
1558  0022 1a01          	or	a,(OFST-1,sp)
1559  0024 01            	rrwa	x,a
1560                     ; 578   return (uint16_t)outputdata;
1564  0025 5b02          	addw	sp,#2
1565  0027 87            	retf	
1616                     ; 610 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1616                     ; 611 {
1617                     .text:	section	.text,new
1618  0000               f_DAC_DMACmd:
1620  0000 89            	pushw	x
1621  0001 89            	pushw	x
1622       00000002      OFST:	set	2
1625                     ; 612   uint16_t cr2addr = 0;
1627                     ; 615   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1629                     ; 616   assert_param(IS_FUNCTIONAL_STATE(NewState));
1631                     ; 619   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1633  0002 9e            	ld	a,xh
1634  0003 48            	sll	a
1635  0004 5f            	clrw	x
1636  0005 97            	ld	xl,a
1637  0006 1c5381        	addw	x,#21377
1638  0009 1f01          	ldw	(OFST-1,sp),x
1639                     ; 621   if (NewState != DISABLE)
1641  000b 7b04          	ld	a,(OFST+2,sp)
1642  000d 2705          	jreq	L516
1643                     ; 624     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1645  000f f6            	ld	a,(x)
1646  0010 aa10          	or	a,#16
1648  0012 2003          	jra	L716
1649  0014               L516:
1650                     ; 629     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1652  0014 f6            	ld	a,(x)
1653  0015 a4ef          	and	a,#239
1654  0017               L716:
1655  0017 f7            	ld	(x),a
1656                     ; 631 }
1659  0018 5b04          	addw	sp,#4
1660  001a 87            	retf	
1734                     ; 664 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1734                     ; 665 {
1735                     .text:	section	.text,new
1736  0000               f_DAC_ITConfig:
1738  0000 89            	pushw	x
1739  0001 89            	pushw	x
1740       00000002      OFST:	set	2
1743                     ; 666   uint16_t cr2addr = 0;
1745                     ; 669   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1747                     ; 670   assert_param(IS_FUNCTIONAL_STATE(NewState));
1749                     ; 671   assert_param(IS_DAC_IT(DAC_IT));
1751                     ; 674   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1753  0002 9e            	ld	a,xh
1754  0003 48            	sll	a
1755  0004 5f            	clrw	x
1756  0005 97            	ld	xl,a
1757  0006 1c5381        	addw	x,#21377
1758  0009 1f01          	ldw	(OFST-1,sp),x
1759                     ; 676   if (NewState != DISABLE)
1761  000b 7b08          	ld	a,(OFST+6,sp)
1762  000d 2705          	jreq	L756
1763                     ; 679     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1765  000f f6            	ld	a,(x)
1766  0010 1a04          	or	a,(OFST+2,sp)
1768  0012 2004          	jra	L166
1769  0014               L756:
1770                     ; 684     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1772  0014 7b04          	ld	a,(OFST+2,sp)
1773  0016 43            	cpl	a
1774  0017 f4            	and	a,(x)
1775  0018               L166:
1776  0018 f7            	ld	(x),a
1777                     ; 686 }
1780  0019 5b04          	addw	sp,#4
1781  001b 87            	retf	
1876                     ; 701 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1876                     ; 702 {
1877                     .text:	section	.text,new
1878  0000               f_DAC_GetFlagStatus:
1880  0000 89            	pushw	x
1881  0001 88            	push	a
1882       00000001      OFST:	set	1
1885                     ; 703   FlagStatus flagstatus = RESET;
1887                     ; 704   uint8_t flag = 0;
1889                     ; 707   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1891                     ; 708   assert_param(IS_DAC_FLAG(DAC_FLAG));
1893                     ; 710   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1895  0002 9e            	ld	a,xh
1896  0003 5f            	clrw	x
1897  0004 97            	ld	xl,a
1898  0005 7b03          	ld	a,(OFST+2,sp)
1899  0007 5d            	tnzw	x
1900  0008 2704          	jreq	L45
1901  000a               L65:
1902  000a 48            	sll	a
1903  000b 5a            	decw	x
1904  000c 26fc          	jrne	L65
1905  000e               L45:
1906  000e 6b01          	ld	(OFST+0,sp),a
1907                     ; 713   if ((DAC->SR & flag ) != (uint8_t)RESET)
1909  0010 c65385        	ld	a,21381
1910  0013 1501          	bcp	a,(OFST+0,sp)
1911  0015 2704          	jreq	L137
1912                     ; 716     flagstatus = SET;
1914  0017 a601          	ld	a,#1
1916  0019 2001          	jra	L337
1917  001b               L137:
1918                     ; 721     flagstatus = RESET;
1920  001b 4f            	clr	a
1921  001c               L337:
1922                     ; 725   return  flagstatus;
1926  001c 5b03          	addw	sp,#3
1927  001e 87            	retf	
1978                     ; 739 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1978                     ; 740 {
1979                     .text:	section	.text,new
1980  0000               f_DAC_ClearFlag:
1982  0000 89            	pushw	x
1983  0001 88            	push	a
1984       00000001      OFST:	set	1
1987                     ; 741   uint8_t flag = 0;
1989                     ; 744   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1991                     ; 745   assert_param(IS_DAC_FLAG(DAC_FLAG));
1993                     ; 748   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1995  0002 9e            	ld	a,xh
1996  0003 5f            	clrw	x
1997  0004 97            	ld	xl,a
1998  0005 7b03          	ld	a,(OFST+2,sp)
1999  0007 5d            	tnzw	x
2000  0008 2704          	jreq	L26
2001  000a               L46:
2002  000a 48            	sll	a
2003  000b 5a            	decw	x
2004  000c 26fc          	jrne	L46
2005  000e               L26:
2006                     ; 751   DAC->SR = (uint8_t)(~flag);
2008  000e 43            	cpl	a
2009  000f c75385        	ld	21381,a
2010                     ; 752 }
2013  0012 5b03          	addw	sp,#3
2014  0014 87            	retf	
2090                     ; 767 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2090                     ; 768 {
2091                     .text:	section	.text,new
2092  0000               f_DAC_GetITStatus:
2094  0000 89            	pushw	x
2095  0001 89            	pushw	x
2096       00000002      OFST:	set	2
2099                     ; 769   ITStatus itstatus = RESET;
2101                     ; 770   uint8_t enablestatus = 0;
2103                     ; 771   uint8_t flagstatus = 0;
2105                     ; 772   uint8_t tempreg = 0;
2107                     ; 775   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2109                     ; 776   assert_param(IS_DAC_IT(DAC_IT));
2111                     ; 779   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2113  0002 9e            	ld	a,xh
2114  0003 48            	sll	a
2115  0004 48            	sll	a
2116  0005 5f            	clrw	x
2117  0006 97            	ld	xl,a
2118  0007 d65381        	ld	a,(21377,x)
2119  000a 6b02          	ld	(OFST+0,sp),a
2120                     ; 780   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2122  000c 5f            	clrw	x
2123  000d 7b03          	ld	a,(OFST+1,sp)
2124  000f 97            	ld	xl,a
2125  0010 7b04          	ld	a,(OFST+2,sp)
2126  0012 5d            	tnzw	x
2127  0013 2704          	jreq	L07
2128  0015               L27:
2129  0015 48            	sll	a
2130  0016 5a            	decw	x
2131  0017 26fc          	jrne	L27
2132  0019               L07:
2133  0019 1402          	and	a,(OFST+0,sp)
2134  001b 6b01          	ld	(OFST-1,sp),a
2135                     ; 781   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2137  001d a605          	ld	a,#5
2138  001f 1003          	sub	a,(OFST+1,sp)
2139  0021 5f            	clrw	x
2140  0022 97            	ld	xl,a
2141  0023 7b04          	ld	a,(OFST+2,sp)
2142  0025 5d            	tnzw	x
2143  0026 2704          	jreq	L47
2144  0028               L67:
2145  0028 44            	srl	a
2146  0029 5a            	decw	x
2147  002a 26fc          	jrne	L67
2148  002c               L47:
2149  002c c45385        	and	a,21381
2150  002f 6b02          	ld	(OFST+0,sp),a
2151                     ; 784   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2153  0031 2708          	jreq	L5101
2155  0033 7b01          	ld	a,(OFST-1,sp)
2156  0035 2704          	jreq	L5101
2157                     ; 787     itstatus = SET;
2159  0037 a601          	ld	a,#1
2161  0039 2001          	jra	L7101
2162  003b               L5101:
2163                     ; 792     itstatus = RESET;
2165  003b 4f            	clr	a
2166  003c               L7101:
2167                     ; 796   return  itstatus;
2171  003c 5b04          	addw	sp,#4
2172  003e 87            	retf	
2217                     ; 810 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2217                     ; 811 {
2218                     .text:	section	.text,new
2219  0000               f_DAC_ClearITPendingBit:
2221  0000 89            	pushw	x
2222       00000000      OFST:	set	0
2225                     ; 813   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2227                     ; 814   assert_param(IS_DAC_IT(DAC_IT));
2229                     ; 817   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2231  0001 9e            	ld	a,xh
2232  0002 a005          	sub	a,#5
2233  0004 40            	neg	a
2234  0005 5f            	clrw	x
2235  0006 97            	ld	xl,a
2236  0007 7b02          	ld	a,(OFST+2,sp)
2237  0009 5d            	tnzw	x
2238  000a 2704          	jreq	L201
2239  000c               L401:
2240  000c 44            	srl	a
2241  000d 5a            	decw	x
2242  000e 26fc          	jrne	L401
2243  0010               L201:
2244  0010 43            	cpl	a
2245  0011 c75385        	ld	21381,a
2246                     ; 818 }
2249  0014 85            	popw	x
2250  0015 87            	retf	
2262                     	xdef	f_DAC_ClearITPendingBit
2263                     	xdef	f_DAC_GetITStatus
2264                     	xdef	f_DAC_ClearFlag
2265                     	xdef	f_DAC_GetFlagStatus
2266                     	xdef	f_DAC_ITConfig
2267                     	xdef	f_DAC_DMACmd
2268                     	xdef	f_DAC_GetDataOutputValue
2269                     	xdef	f_DAC_SetDualChannelData
2270                     	xdef	f_DAC_SetChannel2Data
2271                     	xdef	f_DAC_SetChannel1Data
2272                     	xdef	f_DAC_SetTriangleWaveAmplitude
2273                     	xdef	f_DAC_SetNoiseWaveLFSR
2274                     	xdef	f_DAC_WaveGenerationCmd
2275                     	xdef	f_DAC_DualSoftwareTriggerCmd
2276                     	xdef	f_DAC_SoftwareTriggerCmd
2277                     	xdef	f_DAC_Cmd
2278                     	xdef	f_DAC_Init
2279                     	xdef	f_DAC_DeInit
2298                     	end
