   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
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
 319                     ; 219   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 321  0009 d65380        	ld	a,(21376,x)
 322                     ; 222   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 324  000c a4c1          	and	a,#193
 325                     ; 225   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 327  000e 1a08          	or	a,(OFST+5,sp)
 328  0010 6b03          	ld	(OFST+0,sp),a
 329                     ; 229   if (DAC_Trigger != DAC_Trigger_None)
 331  0012 7b05          	ld	a,(OFST+2,sp)
 332  0014 a130          	cp	a,#48
 333  0016 2706          	jreq	L111
 334                     ; 232     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 336  0018 aa04          	or	a,#4
 337  001a 1a03          	or	a,(OFST+0,sp)
 338  001c 6b03          	ld	(OFST+0,sp),a
 339  001e               L111:
 340                     ; 236   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 342  001e 7b03          	ld	a,(OFST+0,sp)
 343  0020 d75380        	ld	(21376,x),a
 344                     ; 237 }
 347  0023 5b05          	addw	sp,#5
 348  0025 81            	ret	
 420                     ; 251 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 420                     ; 252 {
 421                     .text:	section	.text,new
 422  0000               _DAC_Cmd:
 424  0000 89            	pushw	x
 425  0001 89            	pushw	x
 426       00000002      OFST:	set	2
 429                     ; 253   uint16_t cr1addr = 0;
 431                     ; 255   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 433                     ; 256   assert_param(IS_FUNCTIONAL_STATE(NewState));
 435                     ; 259   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 437  0002 9e            	ld	a,xh
 438  0003 48            	sll	a
 439  0004 5f            	clrw	x
 440  0005 97            	ld	xl,a
 441  0006 1c5380        	addw	x,#21376
 442  0009 1f01          	ldw	(OFST-1,sp),x
 443                     ; 261   if (NewState != DISABLE)
 445  000b 7b04          	ld	a,(OFST+2,sp)
 446  000d 2705          	jreq	L741
 447                     ; 264     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 449  000f f6            	ld	a,(x)
 450  0010 aa01          	or	a,#1
 452  0012 2003          	jra	L151
 453  0014               L741:
 454                     ; 269     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 456  0014 f6            	ld	a,(x)
 457  0015 a4fe          	and	a,#254
 458  0017               L151:
 459  0017 f7            	ld	(x),a
 460                     ; 271 }
 463  0018 5b04          	addw	sp,#4
 464  001a 81            	ret	
 510                     ; 283 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 510                     ; 284 {
 511                     .text:	section	.text,new
 512  0000               _DAC_SoftwareTriggerCmd:
 514  0000 89            	pushw	x
 515       00000000      OFST:	set	0
 518                     ; 286   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 520                     ; 287   assert_param(IS_FUNCTIONAL_STATE(NewState));
 522                     ; 289   if (NewState != DISABLE)
 524  0001 9f            	ld	a,xl
 525  0002 4d            	tnz	a
 526  0003 2711          	jreq	L571
 527                     ; 292     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 529  0005 9e            	ld	a,xh
 530  0006 5f            	clrw	x
 531  0007 97            	ld	xl,a
 532  0008 a601          	ld	a,#1
 533  000a 5d            	tnzw	x
 534  000b 2704          	jreq	L41
 535  000d               L61:
 536  000d 48            	sll	a
 537  000e 5a            	decw	x
 538  000f 26fc          	jrne	L61
 539  0011               L41:
 540  0011 ca5384        	or	a,21380
 542  0014 2011          	jra	L771
 543  0016               L571:
 544                     ; 297     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 546  0016 7b01          	ld	a,(OFST+1,sp)
 547  0018 5f            	clrw	x
 548  0019 97            	ld	xl,a
 549  001a a601          	ld	a,#1
 550  001c 5d            	tnzw	x
 551  001d 2704          	jreq	L02
 552  001f               L22:
 553  001f 48            	sll	a
 554  0020 5a            	decw	x
 555  0021 26fc          	jrne	L22
 556  0023               L02:
 557  0023 43            	cpl	a
 558  0024 c45384        	and	a,21380
 559  0027               L771:
 560  0027 c75384        	ld	21380,a
 561                     ; 299 }
 564  002a 85            	popw	x
 565  002b 81            	ret	
 601                     ; 308 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 601                     ; 309 {
 602                     .text:	section	.text,new
 603  0000               _DAC_DualSoftwareTriggerCmd:
 607                     ; 311   assert_param(IS_FUNCTIONAL_STATE(NewState));
 609                     ; 313   if (NewState != DISABLE)
 611  0000 4d            	tnz	a
 612  0001 2707          	jreq	L712
 613                     ; 316     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 615  0003 c65384        	ld	a,21380
 616  0006 aa03          	or	a,#3
 618  0008 2005          	jra	L122
 619  000a               L712:
 620                     ; 321     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 622  000a c65384        	ld	a,21380
 623  000d a4fc          	and	a,#252
 624  000f               L122:
 625  000f c75384        	ld	21380,a
 626                     ; 323 }
 629  0012 81            	ret	
 712                     ; 339 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 712                     ; 340                            DAC_Wave_TypeDef DAC_Wave,
 712                     ; 341                            FunctionalState NewState)
 712                     ; 342 {
 713                     .text:	section	.text,new
 714  0000               _DAC_WaveGenerationCmd:
 716  0000 89            	pushw	x
 717  0001 88            	push	a
 718       00000001      OFST:	set	1
 721                     ; 343   uint8_t tmpreg = 0;
 723                     ; 346   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 725                     ; 347   assert_param(IS_DAC_WAVE(DAC_Wave));
 727                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 729                     ; 351   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 731  0002 9e            	ld	a,xh
 732  0003 48            	sll	a
 733  0004 5f            	clrw	x
 734  0005 97            	ld	xl,a
 735  0006 d65380        	ld	a,(21376,x)
 736  0009 a43f          	and	a,#63
 737                     ; 353   if (NewState != DISABLE)
 739  000b 0d06          	tnz	(OFST+5,sp)
 740  000d 2702          	jreq	L362
 741                     ; 355     tmpreg |= (uint8_t)(DAC_Wave);
 743  000f 1a03          	or	a,(OFST+2,sp)
 744  0011               L362:
 745  0011 6b01          	ld	(OFST+0,sp),a
 746                     ; 359   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 748  0013 7b02          	ld	a,(OFST+1,sp)
 749  0015 48            	sll	a
 750  0016 5f            	clrw	x
 751  0017 97            	ld	xl,a
 752  0018 7b01          	ld	a,(OFST+0,sp)
 753  001a d75380        	ld	(21376,x),a
 754                     ; 361 }
 757  001d 5b03          	addw	sp,#3
 758  001f 81            	ret	
 920                     ; 385 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 920                     ; 386 {
 921                     .text:	section	.text,new
 922  0000               _DAC_SetNoiseWaveLFSR:
 924  0000 89            	pushw	x
 925  0001 5203          	subw	sp,#3
 926       00000003      OFST:	set	3
 929                     ; 387   uint8_t tmpreg = 0;
 931                     ; 388   uint16_t cr2addr = 0;
 933                     ; 391   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 935                     ; 392   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 937                     ; 395   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 939  0003 9e            	ld	a,xh
 940  0004 48            	sll	a
 941  0005 5f            	clrw	x
 942  0006 97            	ld	xl,a
 943  0007 1c5381        	addw	x,#21377
 944  000a 1f02          	ldw	(OFST-1,sp),x
 945                     ; 396   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 947  000c f6            	ld	a,(x)
 948  000d a4f0          	and	a,#240
 949  000f 6b01          	ld	(OFST-2,sp),a
 950                     ; 399   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 952  0011 1a05          	or	a,(OFST+2,sp)
 953  0013 f7            	ld	(x),a
 954                     ; 400 }
 957  0014 5b05          	addw	sp,#5
 958  0016 81            	ret	
1121                     ; 424 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1121                     ; 425 {
1122                     .text:	section	.text,new
1123  0000               _DAC_SetTriangleWaveAmplitude:
1125  0000 89            	pushw	x
1126  0001 5203          	subw	sp,#3
1127       00000003      OFST:	set	3
1130                     ; 426   uint8_t tmpreg = 0;
1132                     ; 427   uint16_t cr2addr = 0;
1134                     ; 430   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1136                     ; 431   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1138                     ; 435   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1140  0003 9e            	ld	a,xh
1141  0004 48            	sll	a
1142  0005 5f            	clrw	x
1143  0006 97            	ld	xl,a
1144  0007 1c5381        	addw	x,#21377
1145  000a 1f02          	ldw	(OFST-1,sp),x
1146                     ; 436   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1148  000c f6            	ld	a,(x)
1149  000d a4f0          	and	a,#240
1150  000f 6b01          	ld	(OFST-2,sp),a
1151                     ; 439   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1153  0011 1a05          	or	a,(OFST+2,sp)
1154  0013 f7            	ld	(x),a
1155                     ; 440 }
1158  0014 5b05          	addw	sp,#5
1159  0016 81            	ret	
1229                     ; 452 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1229                     ; 453 {
1230                     .text:	section	.text,new
1231  0000               _DAC_SetChannel1Data:
1233  0000 88            	push	a
1234       00000000      OFST:	set	0
1237                     ; 455   assert_param(IS_DAC_ALIGN(DAC_Align));
1239                     ; 457   if (DAC_Align != DAC_Align_8b_R)
1241  0001 a108          	cp	a,#8
1242  0003 2712          	jreq	L364
1243                     ; 460     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1245  0005 5f            	clrw	x
1246  0006 97            	ld	xl,a
1247  0007 7b04          	ld	a,(OFST+4,sp)
1248  0009 d75388        	ld	(21384,x),a
1249                     ; 461     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1251  000c 5f            	clrw	x
1252  000d 7b01          	ld	a,(OFST+1,sp)
1253  000f 97            	ld	xl,a
1254  0010 7b05          	ld	a,(OFST+5,sp)
1255  0012 d75389        	ld	(21385,x),a
1257  0015 2005          	jra	L564
1258  0017               L364:
1259                     ; 466     assert_param(IS_DAC_DATA_08R(DAC_Data));
1261                     ; 469     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1263  0017 7b05          	ld	a,(OFST+5,sp)
1264  0019 c75390        	ld	21392,a
1265  001c               L564:
1266                     ; 471 }
1269  001c 84            	pop	a
1270  001d 81            	ret	
1313                     ; 483 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1313                     ; 484 {
1314                     .text:	section	.text,new
1315  0000               _DAC_SetChannel2Data:
1317  0000 88            	push	a
1318       00000000      OFST:	set	0
1321                     ; 486   assert_param(IS_DAC_ALIGN(DAC_Align));
1323                     ; 488   if (DAC_Align != DAC_Align_8b_R)
1325  0001 a108          	cp	a,#8
1326  0003 2712          	jreq	L705
1327                     ; 491     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1329  0005 5f            	clrw	x
1330  0006 97            	ld	xl,a
1331  0007 7b04          	ld	a,(OFST+4,sp)
1332  0009 d75394        	ld	(21396,x),a
1333                     ; 492     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1335  000c 5f            	clrw	x
1336  000d 7b01          	ld	a,(OFST+1,sp)
1337  000f 97            	ld	xl,a
1338  0010 7b05          	ld	a,(OFST+5,sp)
1339  0012 d75395        	ld	(21397,x),a
1341  0015 2005          	jra	L115
1342  0017               L705:
1343                     ; 497     assert_param(IS_DAC_DATA_08R(DAC_Data));
1345                     ; 500     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1347  0017 7b05          	ld	a,(OFST+5,sp)
1348  0019 c7539c        	ld	21404,a
1349  001c               L115:
1350                     ; 502 }
1353  001c 84            	pop	a
1354  001d 81            	ret	
1411                     ; 519 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1411                     ; 520 {
1412                     .text:	section	.text,new
1413  0000               _DAC_SetDualChannelData:
1415  0000 88            	push	a
1416  0001 89            	pushw	x
1417       00000002      OFST:	set	2
1420                     ; 521   uint16_t dchxrdhrhaddr = 0;
1422                     ; 524   assert_param(IS_DAC_ALIGN(DAC_Align));
1424                     ; 526   if (DAC_Align != DAC_Align_8b_R)
1426  0002 a108          	cp	a,#8
1427  0004 271e          	jreq	L735
1428                     ; 529     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1430  0006 a653          	ld	a,#83
1431  0008 97            	ld	xl,a
1432  0009 a6a0          	ld	a,#160
1433  000b 1b03          	add	a,(OFST+1,sp)
1434  000d 2401          	jrnc	L24
1435  000f 5c            	incw	x
1436  0010               L24:
1437  0010 02            	rlwa	x,a
1438  0011 1f01          	ldw	(OFST-1,sp),x
1439                     ; 532     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1441  0013 7b08          	ld	a,(OFST+6,sp)
1442  0015 f7            	ld	(x),a
1443                     ; 533     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1445  0016 7b09          	ld	a,(OFST+7,sp)
1446  0018 e701          	ld	(1,x),a
1447                     ; 534     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1449  001a 7b06          	ld	a,(OFST+4,sp)
1450  001c e702          	ld	(2,x),a
1451                     ; 535     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1453  001e 7b07          	ld	a,(OFST+5,sp)
1454  0020 e703          	ld	(3,x),a
1456  0022 200a          	jra	L145
1457  0024               L735:
1458                     ; 540     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1460                     ; 543     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1462  0024 7b09          	ld	a,(OFST+7,sp)
1463  0026 c753a8        	ld	21416,a
1464                     ; 544     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1466  0029 7b07          	ld	a,(OFST+5,sp)
1467  002b c753a9        	ld	21417,a
1468  002e               L145:
1469                     ; 546 }
1472  002e 5b03          	addw	sp,#3
1473  0030 81            	ret	
1523                     ; 556 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1523                     ; 557 {
1524                     .text:	section	.text,new
1525  0000               _DAC_GetDataOutputValue:
1527  0000 89            	pushw	x
1528       00000002      OFST:	set	2
1531                     ; 558   uint16_t outputdata = 0;
1533                     ; 559   uint16_t tmp = 0;
1535                     ; 562   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1537                     ; 564   if ( DAC_Channel ==  DAC_Channel_1)
1539  0001 4d            	tnz	a
1540  0002 260d          	jrne	L565
1541                     ; 567     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1543  0004 c653ac        	ld	a,21420
1544  0007 97            	ld	xl,a
1545  0008 4f            	clr	a
1546  0009 02            	rlwa	x,a
1547  000a 1f01          	ldw	(OFST-1,sp),x
1548                     ; 568     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1550  000c c653ad        	ld	a,21421
1552  000f 200b          	jra	L765
1553  0011               L565:
1554                     ; 573     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1556  0011 c653b0        	ld	a,21424
1557  0014 97            	ld	xl,a
1558  0015 4f            	clr	a
1559  0016 02            	rlwa	x,a
1560  0017 1f01          	ldw	(OFST-1,sp),x
1561                     ; 574     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1563  0019 c653b1        	ld	a,21425
1564  001c               L765:
1565  001c 5f            	clrw	x
1566  001d 97            	ld	xl,a
1567  001e 01            	rrwa	x,a
1568  001f 1a02          	or	a,(OFST+0,sp)
1569  0021 01            	rrwa	x,a
1570  0022 1a01          	or	a,(OFST-1,sp)
1571  0024 01            	rrwa	x,a
1572                     ; 578   return (uint16_t)outputdata;
1576  0025 5b02          	addw	sp,#2
1577  0027 81            	ret	
1629                     ; 610 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1629                     ; 611 {
1630                     .text:	section	.text,new
1631  0000               _DAC_DMACmd:
1633  0000 89            	pushw	x
1634  0001 89            	pushw	x
1635       00000002      OFST:	set	2
1638                     ; 612   uint16_t cr2addr = 0;
1640                     ; 615   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1642                     ; 616   assert_param(IS_FUNCTIONAL_STATE(NewState));
1644                     ; 619   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1646  0002 9e            	ld	a,xh
1647  0003 48            	sll	a
1648  0004 5f            	clrw	x
1649  0005 97            	ld	xl,a
1650  0006 1c5381        	addw	x,#21377
1651  0009 1f01          	ldw	(OFST-1,sp),x
1652                     ; 621   if (NewState != DISABLE)
1654  000b 7b04          	ld	a,(OFST+2,sp)
1655  000d 2705          	jreq	L516
1656                     ; 624     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1658  000f f6            	ld	a,(x)
1659  0010 aa10          	or	a,#16
1661  0012 2003          	jra	L716
1662  0014               L516:
1663                     ; 629     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1665  0014 f6            	ld	a,(x)
1666  0015 a4ef          	and	a,#239
1667  0017               L716:
1668  0017 f7            	ld	(x),a
1669                     ; 631 }
1672  0018 5b04          	addw	sp,#4
1673  001a 81            	ret	
1748                     ; 664 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1748                     ; 665 {
1749                     .text:	section	.text,new
1750  0000               _DAC_ITConfig:
1752  0000 89            	pushw	x
1753  0001 89            	pushw	x
1754       00000002      OFST:	set	2
1757                     ; 666   uint16_t cr2addr = 0;
1759                     ; 669   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1761                     ; 670   assert_param(IS_FUNCTIONAL_STATE(NewState));
1763                     ; 671   assert_param(IS_DAC_IT(DAC_IT));
1765                     ; 674   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1767  0002 9e            	ld	a,xh
1768  0003 48            	sll	a
1769  0004 5f            	clrw	x
1770  0005 97            	ld	xl,a
1771  0006 1c5381        	addw	x,#21377
1772  0009 1f01          	ldw	(OFST-1,sp),x
1773                     ; 676   if (NewState != DISABLE)
1775  000b 7b07          	ld	a,(OFST+5,sp)
1776  000d 2705          	jreq	L756
1777                     ; 679     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1779  000f f6            	ld	a,(x)
1780  0010 1a04          	or	a,(OFST+2,sp)
1782  0012 2004          	jra	L166
1783  0014               L756:
1784                     ; 684     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1786  0014 7b04          	ld	a,(OFST+2,sp)
1787  0016 43            	cpl	a
1788  0017 f4            	and	a,(x)
1789  0018               L166:
1790  0018 f7            	ld	(x),a
1791                     ; 686 }
1794  0019 5b04          	addw	sp,#4
1795  001b 81            	ret	
1891                     ; 701 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1891                     ; 702 {
1892                     .text:	section	.text,new
1893  0000               _DAC_GetFlagStatus:
1895  0000 89            	pushw	x
1896  0001 88            	push	a
1897       00000001      OFST:	set	1
1900                     ; 703   FlagStatus flagstatus = RESET;
1902                     ; 704   uint8_t flag = 0;
1904                     ; 707   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1906                     ; 708   assert_param(IS_DAC_FLAG(DAC_FLAG));
1908                     ; 710   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1910  0002 9e            	ld	a,xh
1911  0003 5f            	clrw	x
1912  0004 97            	ld	xl,a
1913  0005 7b03          	ld	a,(OFST+2,sp)
1914  0007 5d            	tnzw	x
1915  0008 2704          	jreq	L45
1916  000a               L65:
1917  000a 48            	sll	a
1918  000b 5a            	decw	x
1919  000c 26fc          	jrne	L65
1920  000e               L45:
1921  000e 6b01          	ld	(OFST+0,sp),a
1922                     ; 713   if ((DAC->SR & flag ) != (uint8_t)RESET)
1924  0010 c65385        	ld	a,21381
1925  0013 1501          	bcp	a,(OFST+0,sp)
1926  0015 2704          	jreq	L137
1927                     ; 716     flagstatus = SET;
1929  0017 a601          	ld	a,#1
1931  0019 2001          	jra	L337
1932  001b               L137:
1933                     ; 721     flagstatus = RESET;
1935  001b 4f            	clr	a
1936  001c               L337:
1937                     ; 725   return  flagstatus;
1941  001c 5b03          	addw	sp,#3
1942  001e 81            	ret	
1994                     ; 739 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1994                     ; 740 {
1995                     .text:	section	.text,new
1996  0000               _DAC_ClearFlag:
1998  0000 89            	pushw	x
1999  0001 88            	push	a
2000       00000001      OFST:	set	1
2003                     ; 741   uint8_t flag = 0;
2005                     ; 744   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2007                     ; 745   assert_param(IS_DAC_FLAG(DAC_FLAG));
2009                     ; 748   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2011  0002 9e            	ld	a,xh
2012  0003 5f            	clrw	x
2013  0004 97            	ld	xl,a
2014  0005 7b03          	ld	a,(OFST+2,sp)
2015  0007 5d            	tnzw	x
2016  0008 2704          	jreq	L26
2017  000a               L46:
2018  000a 48            	sll	a
2019  000b 5a            	decw	x
2020  000c 26fc          	jrne	L46
2021  000e               L26:
2022                     ; 751   DAC->SR = (uint8_t)(~flag);
2024  000e 43            	cpl	a
2025  000f c75385        	ld	21381,a
2026                     ; 752 }
2029  0012 5b03          	addw	sp,#3
2030  0014 81            	ret	
2107                     ; 767 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2107                     ; 768 {
2108                     .text:	section	.text,new
2109  0000               _DAC_GetITStatus:
2111  0000 89            	pushw	x
2112  0001 89            	pushw	x
2113       00000002      OFST:	set	2
2116                     ; 769   ITStatus itstatus = RESET;
2118                     ; 770   uint8_t enablestatus = 0;
2120                     ; 771   uint8_t flagstatus = 0;
2122                     ; 772   uint8_t tempreg = 0;
2124                     ; 775   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2126                     ; 776   assert_param(IS_DAC_IT(DAC_IT));
2128                     ; 779   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2130  0002 9e            	ld	a,xh
2131  0003 48            	sll	a
2132  0004 48            	sll	a
2133  0005 5f            	clrw	x
2134  0006 97            	ld	xl,a
2135  0007 d65381        	ld	a,(21377,x)
2136  000a 6b02          	ld	(OFST+0,sp),a
2137                     ; 780   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2139  000c 5f            	clrw	x
2140  000d 7b03          	ld	a,(OFST+1,sp)
2141  000f 97            	ld	xl,a
2142  0010 7b04          	ld	a,(OFST+2,sp)
2143  0012 5d            	tnzw	x
2144  0013 2704          	jreq	L07
2145  0015               L27:
2146  0015 48            	sll	a
2147  0016 5a            	decw	x
2148  0017 26fc          	jrne	L27
2149  0019               L07:
2150  0019 1402          	and	a,(OFST+0,sp)
2151  001b 6b01          	ld	(OFST-1,sp),a
2152                     ; 781   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2154  001d a605          	ld	a,#5
2155  001f 1003          	sub	a,(OFST+1,sp)
2156  0021 5f            	clrw	x
2157  0022 97            	ld	xl,a
2158  0023 7b04          	ld	a,(OFST+2,sp)
2159  0025 5d            	tnzw	x
2160  0026 2704          	jreq	L47
2161  0028               L67:
2162  0028 44            	srl	a
2163  0029 5a            	decw	x
2164  002a 26fc          	jrne	L67
2165  002c               L47:
2166  002c c45385        	and	a,21381
2167  002f 6b02          	ld	(OFST+0,sp),a
2168                     ; 784   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2170  0031 2708          	jreq	L5101
2172  0033 7b01          	ld	a,(OFST-1,sp)
2173  0035 2704          	jreq	L5101
2174                     ; 787     itstatus = SET;
2176  0037 a601          	ld	a,#1
2178  0039 2001          	jra	L7101
2179  003b               L5101:
2180                     ; 792     itstatus = RESET;
2182  003b 4f            	clr	a
2183  003c               L7101:
2184                     ; 796   return  itstatus;
2188  003c 5b04          	addw	sp,#4
2189  003e 81            	ret	
2235                     ; 810 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2235                     ; 811 {
2236                     .text:	section	.text,new
2237  0000               _DAC_ClearITPendingBit:
2239  0000 89            	pushw	x
2240       00000000      OFST:	set	0
2243                     ; 813   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2245                     ; 814   assert_param(IS_DAC_IT(DAC_IT));
2247                     ; 817   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2249  0001 9e            	ld	a,xh
2250  0002 a005          	sub	a,#5
2251  0004 40            	neg	a
2252  0005 5f            	clrw	x
2253  0006 97            	ld	xl,a
2254  0007 7b02          	ld	a,(OFST+2,sp)
2255  0009 5d            	tnzw	x
2256  000a 2704          	jreq	L201
2257  000c               L401:
2258  000c 44            	srl	a
2259  000d 5a            	decw	x
2260  000e 26fc          	jrne	L401
2261  0010               L201:
2262  0010 43            	cpl	a
2263  0011 c75385        	ld	21381,a
2264                     ; 818 }
2267  0014 85            	popw	x
2268  0015 81            	ret	
2281                     	xdef	_DAC_ClearITPendingBit
2282                     	xdef	_DAC_GetITStatus
2283                     	xdef	_DAC_ClearFlag
2284                     	xdef	_DAC_GetFlagStatus
2285                     	xdef	_DAC_ITConfig
2286                     	xdef	_DAC_DMACmd
2287                     	xdef	_DAC_GetDataOutputValue
2288                     	xdef	_DAC_SetDualChannelData
2289                     	xdef	_DAC_SetChannel2Data
2290                     	xdef	_DAC_SetChannel1Data
2291                     	xdef	_DAC_SetTriangleWaveAmplitude
2292                     	xdef	_DAC_SetNoiseWaveLFSR
2293                     	xdef	_DAC_WaveGenerationCmd
2294                     	xdef	_DAC_DualSoftwareTriggerCmd
2295                     	xdef	_DAC_SoftwareTriggerCmd
2296                     	xdef	_DAC_Cmd
2297                     	xdef	_DAC_Init
2298                     	xdef	_DAC_DeInit
2317                     	end
