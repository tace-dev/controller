   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 139 void DAC_DeInit(void)
  50                     ; 140 {
  52                     .text:	section	.text,new
  53  0000               _DAC_DeInit:
  57                     ; 142   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  59  0000 725f5380      	clr	21376
  60                     ; 143   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  62  0004 725f5381      	clr	21377
  63                     ; 146   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  65  0008 725f5382      	clr	21378
  66                     ; 147   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  68  000c 725f5383      	clr	21379
  69                     ; 150   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  71  0010 725f5384      	clr	21380
  72                     ; 153   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  74  0014 35ff5385      	mov	21381,#255
  75                     ; 156   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  77  0018 725f5388      	clr	21384
  78                     ; 157   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  80  001c 725f5389      	clr	21385
  81                     ; 158   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  83  0020 725f538c      	clr	21388
  84                     ; 159   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  86  0024 725f538d      	clr	21389
  87                     ; 160   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  89  0028 725f5390      	clr	21392
  90                     ; 163   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  92  002c 725f5394      	clr	21396
  93                     ; 164   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  95  0030 725f5395      	clr	21397
  96                     ; 165   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  98  0034 725f5398      	clr	21400
  99                     ; 166   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
 101  0038 725f5399      	clr	21401
 102                     ; 167   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
 104  003c 725f539c      	clr	21404
 105                     ; 170   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 107  0040 725f53a0      	clr	21408
 108                     ; 171   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 110  0044 725f53a1      	clr	21409
 111                     ; 172   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 113  0048 725f53a2      	clr	21410
 114                     ; 173   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 116  004c 725f53a3      	clr	21411
 117                     ; 176   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 119  0050 725f53a4      	clr	21412
 120                     ; 177   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 122  0054 725f53a5      	clr	21413
 123                     ; 178   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 125  0058 725f53a6      	clr	21414
 126                     ; 179   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 128  005c 725f53a7      	clr	21415
 129                     ; 182   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 131  0060 725f53a8      	clr	21416
 132                     ; 183   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 134  0064 725f53a9      	clr	21417
 135                     ; 184 }
 138  0068 81            	ret	
 293                     ; 205 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 293                     ; 206               DAC_Trigger_TypeDef DAC_Trigger,
 293                     ; 207               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 293                     ; 208 {
 294                     .text:	section	.text,new
 295  0000               _DAC_Init:
 297  0000 89            	pushw	x
 298  0001 5203          	subw	sp,#3
 299       00000003      OFST:	set	3
 302                     ; 209   uint8_t tmpreg = 0;
 304                     ; 210   uint16_t tmpreg2 = 0;
 306                     ; 213   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 308                     ; 214   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 310                     ; 215   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 312                     ; 218   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 314  0003 9e            	ld	a,xh
 315  0004 48            	sll	a
 316  0005 5f            	clrw	x
 317  0006 97            	ld	xl,a
 318  0007 1f01          	ldw	(OFST-2,sp),x
 320                     ; 219   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 322  0009 d65380        	ld	a,(21376,x)
 324                     ; 222   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 326  000c a4c1          	and	a,#193
 328                     ; 225   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 330  000e 1a08          	or	a,(OFST+5,sp)
 331  0010 6b03          	ld	(OFST+0,sp),a
 333                     ; 229   if (DAC_Trigger != DAC_Trigger_None)
 335  0012 7b05          	ld	a,(OFST+2,sp)
 336  0014 a130          	cp	a,#48
 337  0016 2706          	jreq	L111
 338                     ; 232     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 340  0018 aa04          	or	a,#4
 341  001a 1a03          	or	a,(OFST+0,sp)
 342  001c 6b03          	ld	(OFST+0,sp),a
 344  001e               L111:
 345                     ; 236   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 347  001e 7b03          	ld	a,(OFST+0,sp)
 348  0020 d75380        	ld	(21376,x),a
 349                     ; 237 }
 352  0023 5b05          	addw	sp,#5
 353  0025 81            	ret	
 425                     ; 251 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 425                     ; 252 {
 426                     .text:	section	.text,new
 427  0000               _DAC_Cmd:
 429  0000 89            	pushw	x
 430  0001 89            	pushw	x
 431       00000002      OFST:	set	2
 434                     ; 253   uint16_t cr1addr = 0;
 436                     ; 255   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 438                     ; 256   assert_param(IS_FUNCTIONAL_STATE(NewState));
 440                     ; 259   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 442  0002 9e            	ld	a,xh
 443  0003 48            	sll	a
 444  0004 5f            	clrw	x
 445  0005 97            	ld	xl,a
 446  0006 1c5380        	addw	x,#21376
 447  0009 1f01          	ldw	(OFST-1,sp),x
 449                     ; 261   if (NewState != DISABLE)
 451  000b 7b04          	ld	a,(OFST+2,sp)
 452  000d 2705          	jreq	L741
 453                     ; 264     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 455  000f f6            	ld	a,(x)
 456  0010 aa01          	or	a,#1
 458  0012 2003          	jra	L151
 459  0014               L741:
 460                     ; 269     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 462  0014 f6            	ld	a,(x)
 463  0015 a4fe          	and	a,#254
 464  0017               L151:
 465  0017 f7            	ld	(x),a
 466                     ; 271 }
 469  0018 5b04          	addw	sp,#4
 470  001a 81            	ret	
 516                     ; 283 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 516                     ; 284 {
 517                     .text:	section	.text,new
 518  0000               _DAC_SoftwareTriggerCmd:
 520  0000 89            	pushw	x
 521       00000000      OFST:	set	0
 524                     ; 286   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 526                     ; 287   assert_param(IS_FUNCTIONAL_STATE(NewState));
 528                     ; 289   if (NewState != DISABLE)
 530  0001 9f            	ld	a,xl
 531  0002 4d            	tnz	a
 532  0003 2711          	jreq	L571
 533                     ; 292     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 535  0005 9e            	ld	a,xh
 536  0006 5f            	clrw	x
 537  0007 97            	ld	xl,a
 538  0008 a601          	ld	a,#1
 539  000a 5d            	tnzw	x
 540  000b 2704          	jreq	L41
 541  000d               L61:
 542  000d 48            	sll	a
 543  000e 5a            	decw	x
 544  000f 26fc          	jrne	L61
 545  0011               L41:
 546  0011 ca5384        	or	a,21380
 548  0014 2011          	jra	L771
 549  0016               L571:
 550                     ; 297     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 552  0016 7b01          	ld	a,(OFST+1,sp)
 553  0018 5f            	clrw	x
 554  0019 97            	ld	xl,a
 555  001a a601          	ld	a,#1
 556  001c 5d            	tnzw	x
 557  001d 2704          	jreq	L02
 558  001f               L22:
 559  001f 48            	sll	a
 560  0020 5a            	decw	x
 561  0021 26fc          	jrne	L22
 562  0023               L02:
 563  0023 43            	cpl	a
 564  0024 c45384        	and	a,21380
 565  0027               L771:
 566  0027 c75384        	ld	21380,a
 567                     ; 299 }
 570  002a 85            	popw	x
 571  002b 81            	ret	
 607                     ; 308 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 607                     ; 309 {
 608                     .text:	section	.text,new
 609  0000               _DAC_DualSoftwareTriggerCmd:
 613                     ; 311   assert_param(IS_FUNCTIONAL_STATE(NewState));
 615                     ; 313   if (NewState != DISABLE)
 617  0000 4d            	tnz	a
 618  0001 2707          	jreq	L712
 619                     ; 316     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 621  0003 c65384        	ld	a,21380
 622  0006 aa03          	or	a,#3
 624  0008 2005          	jra	L122
 625  000a               L712:
 626                     ; 321     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 628  000a c65384        	ld	a,21380
 629  000d a4fc          	and	a,#252
 630  000f               L122:
 631  000f c75384        	ld	21380,a
 632                     ; 323 }
 635  0012 81            	ret	
 718                     ; 339 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 718                     ; 340                            DAC_Wave_TypeDef DAC_Wave,
 718                     ; 341                            FunctionalState NewState)
 718                     ; 342 {
 719                     .text:	section	.text,new
 720  0000               _DAC_WaveGenerationCmd:
 722  0000 89            	pushw	x
 723  0001 88            	push	a
 724       00000001      OFST:	set	1
 727                     ; 343   uint8_t tmpreg = 0;
 729                     ; 346   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 731                     ; 347   assert_param(IS_DAC_WAVE(DAC_Wave));
 733                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 735                     ; 351   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 737  0002 9e            	ld	a,xh
 738  0003 48            	sll	a
 739  0004 5f            	clrw	x
 740  0005 97            	ld	xl,a
 741  0006 d65380        	ld	a,(21376,x)
 742  0009 a43f          	and	a,#63
 744                     ; 353   if (NewState != DISABLE)
 746  000b 0d06          	tnz	(OFST+5,sp)
 747  000d 2702          	jreq	L362
 748                     ; 355     tmpreg |= (uint8_t)(DAC_Wave);
 750  000f 1a03          	or	a,(OFST+2,sp)
 752  0011               L362:
 753  0011 6b01          	ld	(OFST+0,sp),a
 754                     ; 359   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 756  0013 7b02          	ld	a,(OFST+1,sp)
 757  0015 48            	sll	a
 758  0016 5f            	clrw	x
 759  0017 97            	ld	xl,a
 760  0018 7b01          	ld	a,(OFST+0,sp)
 761  001a d75380        	ld	(21376,x),a
 762                     ; 361 }
 765  001d 5b03          	addw	sp,#3
 766  001f 81            	ret	
 928                     ; 385 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 928                     ; 386 {
 929                     .text:	section	.text,new
 930  0000               _DAC_SetNoiseWaveLFSR:
 932  0000 89            	pushw	x
 933  0001 5203          	subw	sp,#3
 934       00000003      OFST:	set	3
 937                     ; 387   uint8_t tmpreg = 0;
 939                     ; 388   uint16_t cr2addr = 0;
 941                     ; 391   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 943                     ; 392   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 945                     ; 395   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 947  0003 9e            	ld	a,xh
 948  0004 48            	sll	a
 949  0005 5f            	clrw	x
 950  0006 97            	ld	xl,a
 951  0007 1c5381        	addw	x,#21377
 952  000a 1f02          	ldw	(OFST-1,sp),x
 954                     ; 396   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 956  000c f6            	ld	a,(x)
 957  000d a4f0          	and	a,#240
 958  000f 6b01          	ld	(OFST-2,sp),a
 960                     ; 399   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 962  0011 1a05          	or	a,(OFST+2,sp)
 963  0013 f7            	ld	(x),a
 964                     ; 400 }
 967  0014 5b05          	addw	sp,#5
 968  0016 81            	ret	
1131                     ; 424 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1131                     ; 425 {
1132                     .text:	section	.text,new
1133  0000               _DAC_SetTriangleWaveAmplitude:
1135  0000 89            	pushw	x
1136  0001 5203          	subw	sp,#3
1137       00000003      OFST:	set	3
1140                     ; 426   uint8_t tmpreg = 0;
1142                     ; 427   uint16_t cr2addr = 0;
1144                     ; 430   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1146                     ; 431   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1148                     ; 435   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1150  0003 9e            	ld	a,xh
1151  0004 48            	sll	a
1152  0005 5f            	clrw	x
1153  0006 97            	ld	xl,a
1154  0007 1c5381        	addw	x,#21377
1155  000a 1f02          	ldw	(OFST-1,sp),x
1157                     ; 436   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1159  000c f6            	ld	a,(x)
1160  000d a4f0          	and	a,#240
1161  000f 6b01          	ld	(OFST-2,sp),a
1163                     ; 439   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1165  0011 1a05          	or	a,(OFST+2,sp)
1166  0013 f7            	ld	(x),a
1167                     ; 440 }
1170  0014 5b05          	addw	sp,#5
1171  0016 81            	ret	
1241                     ; 452 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1241                     ; 453 {
1242                     .text:	section	.text,new
1243  0000               _DAC_SetChannel1Data:
1245  0000 88            	push	a
1246       00000000      OFST:	set	0
1249                     ; 455   assert_param(IS_DAC_ALIGN(DAC_Align));
1251                     ; 457   if (DAC_Align != DAC_Align_8b_R)
1253  0001 a108          	cp	a,#8
1254  0003 2712          	jreq	L364
1255                     ; 460     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1257  0005 5f            	clrw	x
1258  0006 97            	ld	xl,a
1259  0007 7b04          	ld	a,(OFST+4,sp)
1260  0009 d75388        	ld	(21384,x),a
1261                     ; 461     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1263  000c 5f            	clrw	x
1264  000d 7b01          	ld	a,(OFST+1,sp)
1265  000f 97            	ld	xl,a
1266  0010 7b05          	ld	a,(OFST+5,sp)
1267  0012 d75389        	ld	(21385,x),a
1269  0015 2005          	jra	L564
1270  0017               L364:
1271                     ; 466     assert_param(IS_DAC_DATA_08R(DAC_Data));
1273                     ; 469     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1275  0017 7b05          	ld	a,(OFST+5,sp)
1276  0019 c75390        	ld	21392,a
1277  001c               L564:
1278                     ; 471 }
1281  001c 84            	pop	a
1282  001d 81            	ret	
1325                     ; 483 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1325                     ; 484 {
1326                     .text:	section	.text,new
1327  0000               _DAC_SetChannel2Data:
1329  0000 88            	push	a
1330       00000000      OFST:	set	0
1333                     ; 486   assert_param(IS_DAC_ALIGN(DAC_Align));
1335                     ; 488   if (DAC_Align != DAC_Align_8b_R)
1337  0001 a108          	cp	a,#8
1338  0003 2712          	jreq	L705
1339                     ; 491     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1341  0005 5f            	clrw	x
1342  0006 97            	ld	xl,a
1343  0007 7b04          	ld	a,(OFST+4,sp)
1344  0009 d75394        	ld	(21396,x),a
1345                     ; 492     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1347  000c 5f            	clrw	x
1348  000d 7b01          	ld	a,(OFST+1,sp)
1349  000f 97            	ld	xl,a
1350  0010 7b05          	ld	a,(OFST+5,sp)
1351  0012 d75395        	ld	(21397,x),a
1353  0015 2005          	jra	L115
1354  0017               L705:
1355                     ; 497     assert_param(IS_DAC_DATA_08R(DAC_Data));
1357                     ; 500     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1359  0017 7b05          	ld	a,(OFST+5,sp)
1360  0019 c7539c        	ld	21404,a
1361  001c               L115:
1362                     ; 502 }
1365  001c 84            	pop	a
1366  001d 81            	ret	
1423                     ; 519 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1423                     ; 520 {
1424                     .text:	section	.text,new
1425  0000               _DAC_SetDualChannelData:
1427  0000 88            	push	a
1428  0001 89            	pushw	x
1429       00000002      OFST:	set	2
1432                     ; 521   uint16_t dchxrdhrhaddr = 0;
1434                     ; 524   assert_param(IS_DAC_ALIGN(DAC_Align));
1436                     ; 526   if (DAC_Align != DAC_Align_8b_R)
1438  0002 a108          	cp	a,#8
1439  0004 271e          	jreq	L735
1440                     ; 529     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1442  0006 a653          	ld	a,#83
1443  0008 97            	ld	xl,a
1444  0009 a6a0          	ld	a,#160
1445  000b 1b03          	add	a,(OFST+1,sp)
1446  000d 2401          	jrnc	L24
1447  000f 5c            	incw	x
1448  0010               L24:
1449  0010 02            	rlwa	x,a
1450  0011 1f01          	ldw	(OFST-1,sp),x
1452                     ; 532     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1454  0013 7b08          	ld	a,(OFST+6,sp)
1455  0015 f7            	ld	(x),a
1456                     ; 533     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1458  0016 7b09          	ld	a,(OFST+7,sp)
1459  0018 e701          	ld	(1,x),a
1460                     ; 534     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1462  001a 7b06          	ld	a,(OFST+4,sp)
1463  001c e702          	ld	(2,x),a
1464                     ; 535     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1466  001e 7b07          	ld	a,(OFST+5,sp)
1467  0020 e703          	ld	(3,x),a
1469  0022 200a          	jra	L145
1470  0024               L735:
1471                     ; 540     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1473                     ; 543     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1475  0024 7b09          	ld	a,(OFST+7,sp)
1476  0026 c753a8        	ld	21416,a
1477                     ; 544     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1479  0029 7b07          	ld	a,(OFST+5,sp)
1480  002b c753a9        	ld	21417,a
1481  002e               L145:
1482                     ; 546 }
1485  002e 5b03          	addw	sp,#3
1486  0030 81            	ret	
1536                     ; 556 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1536                     ; 557 {
1537                     .text:	section	.text,new
1538  0000               _DAC_GetDataOutputValue:
1540  0000 89            	pushw	x
1541       00000002      OFST:	set	2
1544                     ; 558   uint16_t outputdata = 0;
1546                     ; 559   uint16_t tmp = 0;
1548                     ; 562   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1550                     ; 564   if ( DAC_Channel ==  DAC_Channel_1)
1552  0001 4d            	tnz	a
1553  0002 260d          	jrne	L565
1554                     ; 567     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1556  0004 c653ac        	ld	a,21420
1557  0007 97            	ld	xl,a
1558  0008 4f            	clr	a
1559  0009 02            	rlwa	x,a
1560  000a 1f01          	ldw	(OFST-1,sp),x
1562                     ; 568     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1564  000c c653ad        	ld	a,21421
1566  000f 200b          	jra	L765
1567  0011               L565:
1568                     ; 573     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1570  0011 c653b0        	ld	a,21424
1571  0014 97            	ld	xl,a
1572  0015 4f            	clr	a
1573  0016 02            	rlwa	x,a
1574  0017 1f01          	ldw	(OFST-1,sp),x
1576                     ; 574     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1578  0019 c653b1        	ld	a,21425
1579  001c               L765:
1580  001c 5f            	clrw	x
1581  001d 97            	ld	xl,a
1582  001e 01            	rrwa	x,a
1583  001f 1a02          	or	a,(OFST+0,sp)
1584  0021 01            	rrwa	x,a
1585  0022 1a01          	or	a,(OFST-1,sp)
1586  0024 01            	rrwa	x,a
1588                     ; 578   return (uint16_t)outputdata;
1592  0025 5b02          	addw	sp,#2
1593  0027 81            	ret	
1645                     ; 610 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1645                     ; 611 {
1646                     .text:	section	.text,new
1647  0000               _DAC_DMACmd:
1649  0000 89            	pushw	x
1650  0001 89            	pushw	x
1651       00000002      OFST:	set	2
1654                     ; 612   uint16_t cr2addr = 0;
1656                     ; 615   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1658                     ; 616   assert_param(IS_FUNCTIONAL_STATE(NewState));
1660                     ; 619   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1662  0002 9e            	ld	a,xh
1663  0003 48            	sll	a
1664  0004 5f            	clrw	x
1665  0005 97            	ld	xl,a
1666  0006 1c5381        	addw	x,#21377
1667  0009 1f01          	ldw	(OFST-1,sp),x
1669                     ; 621   if (NewState != DISABLE)
1671  000b 7b04          	ld	a,(OFST+2,sp)
1672  000d 2705          	jreq	L516
1673                     ; 624     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1675  000f f6            	ld	a,(x)
1676  0010 aa10          	or	a,#16
1678  0012 2003          	jra	L716
1679  0014               L516:
1680                     ; 629     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1682  0014 f6            	ld	a,(x)
1683  0015 a4ef          	and	a,#239
1684  0017               L716:
1685  0017 f7            	ld	(x),a
1686                     ; 631 }
1689  0018 5b04          	addw	sp,#4
1690  001a 81            	ret	
1765                     ; 664 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1765                     ; 665 {
1766                     .text:	section	.text,new
1767  0000               _DAC_ITConfig:
1769  0000 89            	pushw	x
1770  0001 89            	pushw	x
1771       00000002      OFST:	set	2
1774                     ; 666   uint16_t cr2addr = 0;
1776                     ; 669   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1778                     ; 670   assert_param(IS_FUNCTIONAL_STATE(NewState));
1780                     ; 671   assert_param(IS_DAC_IT(DAC_IT));
1782                     ; 674   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1784  0002 9e            	ld	a,xh
1785  0003 48            	sll	a
1786  0004 5f            	clrw	x
1787  0005 97            	ld	xl,a
1788  0006 1c5381        	addw	x,#21377
1789  0009 1f01          	ldw	(OFST-1,sp),x
1791                     ; 676   if (NewState != DISABLE)
1793  000b 7b07          	ld	a,(OFST+5,sp)
1794  000d 2705          	jreq	L756
1795                     ; 679     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1797  000f f6            	ld	a,(x)
1798  0010 1a04          	or	a,(OFST+2,sp)
1800  0012 2004          	jra	L166
1801  0014               L756:
1802                     ; 684     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1804  0014 7b04          	ld	a,(OFST+2,sp)
1805  0016 43            	cpl	a
1806  0017 f4            	and	a,(x)
1807  0018               L166:
1808  0018 f7            	ld	(x),a
1809                     ; 686 }
1812  0019 5b04          	addw	sp,#4
1813  001b 81            	ret	
1909                     ; 701 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1909                     ; 702 {
1910                     .text:	section	.text,new
1911  0000               _DAC_GetFlagStatus:
1913  0000 89            	pushw	x
1914  0001 88            	push	a
1915       00000001      OFST:	set	1
1918                     ; 703   FlagStatus flagstatus = RESET;
1920                     ; 704   uint8_t flag = 0;
1922                     ; 707   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1924                     ; 708   assert_param(IS_DAC_FLAG(DAC_FLAG));
1926                     ; 710   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1928  0002 9e            	ld	a,xh
1929  0003 5f            	clrw	x
1930  0004 97            	ld	xl,a
1931  0005 7b03          	ld	a,(OFST+2,sp)
1932  0007 5d            	tnzw	x
1933  0008 2704          	jreq	L45
1934  000a               L65:
1935  000a 48            	sll	a
1936  000b 5a            	decw	x
1937  000c 26fc          	jrne	L65
1938  000e               L45:
1939  000e 6b01          	ld	(OFST+0,sp),a
1941                     ; 713   if ((DAC->SR & flag ) != (uint8_t)RESET)
1943  0010 c65385        	ld	a,21381
1944  0013 1501          	bcp	a,(OFST+0,sp)
1945  0015 2704          	jreq	L137
1946                     ; 716     flagstatus = SET;
1948  0017 a601          	ld	a,#1
1951  0019 2001          	jra	L337
1952  001b               L137:
1953                     ; 721     flagstatus = RESET;
1955  001b 4f            	clr	a
1957  001c               L337:
1958                     ; 725   return  flagstatus;
1962  001c 5b03          	addw	sp,#3
1963  001e 81            	ret	
2015                     ; 739 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2015                     ; 740 {
2016                     .text:	section	.text,new
2017  0000               _DAC_ClearFlag:
2019  0000 89            	pushw	x
2020  0001 88            	push	a
2021       00000001      OFST:	set	1
2024                     ; 741   uint8_t flag = 0;
2026                     ; 744   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2028                     ; 745   assert_param(IS_DAC_FLAG(DAC_FLAG));
2030                     ; 748   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2032  0002 9e            	ld	a,xh
2033  0003 5f            	clrw	x
2034  0004 97            	ld	xl,a
2035  0005 7b03          	ld	a,(OFST+2,sp)
2036  0007 5d            	tnzw	x
2037  0008 2704          	jreq	L26
2038  000a               L46:
2039  000a 48            	sll	a
2040  000b 5a            	decw	x
2041  000c 26fc          	jrne	L46
2042  000e               L26:
2044                     ; 751   DAC->SR = (uint8_t)(~flag);
2046  000e 43            	cpl	a
2047  000f c75385        	ld	21381,a
2048                     ; 752 }
2051  0012 5b03          	addw	sp,#3
2052  0014 81            	ret	
2129                     ; 767 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2129                     ; 768 {
2130                     .text:	section	.text,new
2131  0000               _DAC_GetITStatus:
2133  0000 89            	pushw	x
2134  0001 89            	pushw	x
2135       00000002      OFST:	set	2
2138                     ; 769   ITStatus itstatus = RESET;
2140                     ; 770   uint8_t enablestatus = 0;
2142                     ; 771   uint8_t flagstatus = 0;
2144                     ; 772   uint8_t tempreg = 0;
2146                     ; 775   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2148                     ; 776   assert_param(IS_DAC_IT(DAC_IT));
2150                     ; 779   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2152  0002 9e            	ld	a,xh
2153  0003 48            	sll	a
2154  0004 48            	sll	a
2155  0005 5f            	clrw	x
2156  0006 97            	ld	xl,a
2157  0007 d65381        	ld	a,(21377,x)
2158  000a 6b02          	ld	(OFST+0,sp),a
2160                     ; 780   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2162  000c 5f            	clrw	x
2163  000d 7b03          	ld	a,(OFST+1,sp)
2164  000f 97            	ld	xl,a
2165  0010 7b04          	ld	a,(OFST+2,sp)
2166  0012 5d            	tnzw	x
2167  0013 2704          	jreq	L07
2168  0015               L27:
2169  0015 48            	sll	a
2170  0016 5a            	decw	x
2171  0017 26fc          	jrne	L27
2172  0019               L07:
2173  0019 1402          	and	a,(OFST+0,sp)
2174  001b 6b01          	ld	(OFST-1,sp),a
2176                     ; 781   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2178  001d a605          	ld	a,#5
2179  001f 1003          	sub	a,(OFST+1,sp)
2180  0021 5f            	clrw	x
2181  0022 97            	ld	xl,a
2182  0023 7b04          	ld	a,(OFST+2,sp)
2183  0025 5d            	tnzw	x
2184  0026 2704          	jreq	L47
2185  0028               L67:
2186  0028 44            	srl	a
2187  0029 5a            	decw	x
2188  002a 26fc          	jrne	L67
2189  002c               L47:
2190  002c c45385        	and	a,21381
2191  002f 6b02          	ld	(OFST+0,sp),a
2193                     ; 784   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2195  0031 2708          	jreq	L5101
2197  0033 7b01          	ld	a,(OFST-1,sp)
2198  0035 2704          	jreq	L5101
2199                     ; 787     itstatus = SET;
2201  0037 a601          	ld	a,#1
2204  0039 2001          	jra	L7101
2205  003b               L5101:
2206                     ; 792     itstatus = RESET;
2208  003b 4f            	clr	a
2210  003c               L7101:
2211                     ; 796   return  itstatus;
2215  003c 5b04          	addw	sp,#4
2216  003e 81            	ret	
2262                     ; 810 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2262                     ; 811 {
2263                     .text:	section	.text,new
2264  0000               _DAC_ClearITPendingBit:
2266  0000 89            	pushw	x
2267       00000000      OFST:	set	0
2270                     ; 813   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2272                     ; 814   assert_param(IS_DAC_IT(DAC_IT));
2274                     ; 817   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2276  0001 9e            	ld	a,xh
2277  0002 a005          	sub	a,#5
2278  0004 40            	neg	a
2279  0005 5f            	clrw	x
2280  0006 97            	ld	xl,a
2281  0007 7b02          	ld	a,(OFST+2,sp)
2282  0009 5d            	tnzw	x
2283  000a 2704          	jreq	L201
2284  000c               L401:
2285  000c 44            	srl	a
2286  000d 5a            	decw	x
2287  000e 26fc          	jrne	L401
2288  0010               L201:
2289  0010 43            	cpl	a
2290  0011 c75385        	ld	21381,a
2291                     ; 818 }
2294  0014 85            	popw	x
2295  0015 81            	ret	
2308                     	xdef	_DAC_ClearITPendingBit
2309                     	xdef	_DAC_GetITStatus
2310                     	xdef	_DAC_ClearFlag
2311                     	xdef	_DAC_GetFlagStatus
2312                     	xdef	_DAC_ITConfig
2313                     	xdef	_DAC_DMACmd
2314                     	xdef	_DAC_GetDataOutputValue
2315                     	xdef	_DAC_SetDualChannelData
2316                     	xdef	_DAC_SetChannel2Data
2317                     	xdef	_DAC_SetChannel1Data
2318                     	xdef	_DAC_SetTriangleWaveAmplitude
2319                     	xdef	_DAC_SetNoiseWaveLFSR
2320                     	xdef	_DAC_WaveGenerationCmd
2321                     	xdef	_DAC_DualSoftwareTriggerCmd
2322                     	xdef	_DAC_SoftwareTriggerCmd
2323                     	xdef	_DAC_Cmd
2324                     	xdef	_DAC_Init
2325                     	xdef	_DAC_DeInit
2344                     	end
