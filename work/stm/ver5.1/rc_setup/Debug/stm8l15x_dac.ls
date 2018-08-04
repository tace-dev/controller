   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 139 void DAC_DeInit(void)
  47                     ; 140 {
  49                     .text:	section	.text,new
  50  0000               _DAC_DeInit:
  54                     ; 142   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  56  0000 725f5380      	clr	21376
  57                     ; 143   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  59  0004 725f5381      	clr	21377
  60                     ; 146   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  62  0008 725f5382      	clr	21378
  63                     ; 147   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  65  000c 725f5383      	clr	21379
  66                     ; 150   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  68  0010 725f5384      	clr	21380
  69                     ; 153   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  71  0014 35ff5385      	mov	21381,#255
  72                     ; 156   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  74  0018 725f5388      	clr	21384
  75                     ; 157   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  77  001c 725f5389      	clr	21385
  78                     ; 158   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  80  0020 725f538c      	clr	21388
  81                     ; 159   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  83  0024 725f538d      	clr	21389
  84                     ; 160   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  86  0028 725f5390      	clr	21392
  87                     ; 163   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  89  002c 725f5394      	clr	21396
  90                     ; 164   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  92  0030 725f5395      	clr	21397
  93                     ; 165   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  95  0034 725f5398      	clr	21400
  96                     ; 166   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  98  0038 725f5399      	clr	21401
  99                     ; 167   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
 101  003c 725f539c      	clr	21404
 102                     ; 170   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 104  0040 725f53a0      	clr	21408
 105                     ; 171   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 107  0044 725f53a1      	clr	21409
 108                     ; 172   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 110  0048 725f53a2      	clr	21410
 111                     ; 173   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 113  004c 725f53a3      	clr	21411
 114                     ; 176   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 116  0050 725f53a4      	clr	21412
 117                     ; 177   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 119  0054 725f53a5      	clr	21413
 120                     ; 178   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 122  0058 725f53a6      	clr	21414
 123                     ; 179   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 125  005c 725f53a7      	clr	21415
 126                     ; 182   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 128  0060 725f53a8      	clr	21416
 129                     ; 183   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 131  0064 725f53a9      	clr	21417
 132                     ; 184 }
 135  0068 81            	ret
 290                     ; 205 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 290                     ; 206               DAC_Trigger_TypeDef DAC_Trigger,
 290                     ; 207               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 290                     ; 208 {
 291                     .text:	section	.text,new
 292  0000               _DAC_Init:
 294  0000 89            	pushw	x
 295  0001 5203          	subw	sp,#3
 296       00000003      OFST:	set	3
 299                     ; 209   uint8_t tmpreg = 0;
 301                     ; 210   uint16_t tmpreg2 = 0;
 303                     ; 213   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 305                     ; 214   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 307                     ; 215   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 309                     ; 218   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 311  0003 9e            	ld	a,xh
 312  0004 48            	sll	a
 313  0005 5f            	clrw	x
 314  0006 97            	ld	xl,a
 315  0007 1f01          	ldw	(OFST-2,sp),x
 316                     ; 219   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 318  0009 1e01          	ldw	x,(OFST-2,sp)
 319  000b d65380        	ld	a,(21376,x)
 320  000e 6b03          	ld	(OFST+0,sp),a
 321                     ; 222   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 323  0010 7b03          	ld	a,(OFST+0,sp)
 324  0012 a4c1          	and	a,#193
 325  0014 6b03          	ld	(OFST+0,sp),a
 326                     ; 225   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 328  0016 7b03          	ld	a,(OFST+0,sp)
 329  0018 1a08          	or	a,(OFST+5,sp)
 330  001a 6b03          	ld	(OFST+0,sp),a
 331                     ; 229   if (DAC_Trigger != DAC_Trigger_None)
 333  001c 7b05          	ld	a,(OFST+2,sp)
 334  001e a130          	cp	a,#48
 335  0020 2708          	jreq	L111
 336                     ; 232     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 338  0022 7b05          	ld	a,(OFST+2,sp)
 339  0024 aa04          	or	a,#4
 340  0026 1a03          	or	a,(OFST+0,sp)
 341  0028 6b03          	ld	(OFST+0,sp),a
 342  002a               L111:
 343                     ; 236   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 345  002a 7b03          	ld	a,(OFST+0,sp)
 346  002c 1e01          	ldw	x,(OFST-2,sp)
 347  002e d75380        	ld	(21376,x),a
 348                     ; 237 }
 351  0031 5b05          	addw	sp,#5
 352  0033 81            	ret
 424                     ; 251 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 424                     ; 252 {
 425                     .text:	section	.text,new
 426  0000               _DAC_Cmd:
 428  0000 89            	pushw	x
 429  0001 89            	pushw	x
 430       00000002      OFST:	set	2
 433                     ; 253   uint16_t cr1addr = 0;
 435                     ; 255   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 437                     ; 256   assert_param(IS_FUNCTIONAL_STATE(NewState));
 439                     ; 259   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 441  0002 9e            	ld	a,xh
 442  0003 48            	sll	a
 443  0004 5f            	clrw	x
 444  0005 97            	ld	xl,a
 445  0006 1c5380        	addw	x,#21376
 446  0009 1f01          	ldw	(OFST-1,sp),x
 447                     ; 261   if (NewState != DISABLE)
 449  000b 0d04          	tnz	(OFST+2,sp)
 450  000d 2708          	jreq	L741
 451                     ; 264     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 453  000f 1e01          	ldw	x,(OFST-1,sp)
 454  0011 f6            	ld	a,(x)
 455  0012 aa01          	or	a,#1
 456  0014 f7            	ld	(x),a
 458  0015 2006          	jra	L151
 459  0017               L741:
 460                     ; 269     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 462  0017 1e01          	ldw	x,(OFST-1,sp)
 463  0019 f6            	ld	a,(x)
 464  001a a4fe          	and	a,#254
 465  001c f7            	ld	(x),a
 466  001d               L151:
 467                     ; 271 }
 470  001d 5b04          	addw	sp,#4
 471  001f 81            	ret
 517                     ; 283 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 517                     ; 284 {
 518                     .text:	section	.text,new
 519  0000               _DAC_SoftwareTriggerCmd:
 521  0000 89            	pushw	x
 522       00000000      OFST:	set	0
 525                     ; 286   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 527                     ; 287   assert_param(IS_FUNCTIONAL_STATE(NewState));
 529                     ; 289   if (NewState != DISABLE)
 531  0001 9f            	ld	a,xl
 532  0002 4d            	tnz	a
 533  0003 2714          	jreq	L571
 534                     ; 292     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 536  0005 9e            	ld	a,xh
 537  0006 5f            	clrw	x
 538  0007 97            	ld	xl,a
 539  0008 a601          	ld	a,#1
 540  000a 5d            	tnzw	x
 541  000b 2704          	jreq	L41
 542  000d               L61:
 543  000d 48            	sll	a
 544  000e 5a            	decw	x
 545  000f 26fc          	jrne	L61
 546  0011               L41:
 547  0011 ca5384        	or	a,21380
 548  0014 c75384        	ld	21380,a
 550  0017 2014          	jra	L771
 551  0019               L571:
 552                     ; 297     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 554  0019 7b01          	ld	a,(OFST+1,sp)
 555  001b 5f            	clrw	x
 556  001c 97            	ld	xl,a
 557  001d a601          	ld	a,#1
 558  001f 5d            	tnzw	x
 559  0020 2704          	jreq	L02
 560  0022               L22:
 561  0022 48            	sll	a
 562  0023 5a            	decw	x
 563  0024 26fc          	jrne	L22
 564  0026               L02:
 565  0026 43            	cpl	a
 566  0027 c45384        	and	a,21380
 567  002a c75384        	ld	21380,a
 568  002d               L771:
 569                     ; 299 }
 572  002d 85            	popw	x
 573  002e 81            	ret
 609                     ; 308 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 609                     ; 309 {
 610                     .text:	section	.text,new
 611  0000               _DAC_DualSoftwareTriggerCmd:
 615                     ; 311   assert_param(IS_FUNCTIONAL_STATE(NewState));
 617                     ; 313   if (NewState != DISABLE)
 619  0000 4d            	tnz	a
 620  0001 270a          	jreq	L712
 621                     ; 316     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 623  0003 c65384        	ld	a,21380
 624  0006 aa03          	or	a,#3
 625  0008 c75384        	ld	21380,a
 627  000b 2008          	jra	L122
 628  000d               L712:
 629                     ; 321     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 631  000d c65384        	ld	a,21380
 632  0010 a4fc          	and	a,#252
 633  0012 c75384        	ld	21380,a
 634  0015               L122:
 635                     ; 323 }
 638  0015 81            	ret
 721                     ; 339 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 721                     ; 340                            DAC_Wave_TypeDef DAC_Wave,
 721                     ; 341                            FunctionalState NewState)
 721                     ; 342 {
 722                     .text:	section	.text,new
 723  0000               _DAC_WaveGenerationCmd:
 725  0000 89            	pushw	x
 726  0001 88            	push	a
 727       00000001      OFST:	set	1
 730                     ; 343   uint8_t tmpreg = 0;
 732                     ; 346   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 734                     ; 347   assert_param(IS_DAC_WAVE(DAC_Wave));
 736                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 738                     ; 351   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 740  0002 9e            	ld	a,xh
 741  0003 48            	sll	a
 742  0004 5f            	clrw	x
 743  0005 97            	ld	xl,a
 744  0006 d65380        	ld	a,(21376,x)
 745  0009 a43f          	and	a,#63
 746  000b 6b01          	ld	(OFST+0,sp),a
 747                     ; 353   if (NewState != DISABLE)
 749  000d 0d06          	tnz	(OFST+5,sp)
 750  000f 2706          	jreq	L362
 751                     ; 355     tmpreg |= (uint8_t)(DAC_Wave);
 753  0011 7b01          	ld	a,(OFST+0,sp)
 754  0013 1a03          	or	a,(OFST+2,sp)
 755  0015 6b01          	ld	(OFST+0,sp),a
 756  0017               L362:
 757                     ; 359   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 759  0017 7b02          	ld	a,(OFST+1,sp)
 760  0019 48            	sll	a
 761  001a 5f            	clrw	x
 762  001b 97            	ld	xl,a
 763  001c 7b01          	ld	a,(OFST+0,sp)
 764  001e d75380        	ld	(21376,x),a
 765                     ; 361 }
 768  0021 5b03          	addw	sp,#3
 769  0023 81            	ret
 931                     ; 385 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 931                     ; 386 {
 932                     .text:	section	.text,new
 933  0000               _DAC_SetNoiseWaveLFSR:
 935  0000 89            	pushw	x
 936  0001 5203          	subw	sp,#3
 937       00000003      OFST:	set	3
 940                     ; 387   uint8_t tmpreg = 0;
 942                     ; 388   uint16_t cr2addr = 0;
 944                     ; 391   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 946                     ; 392   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 948                     ; 395   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 950  0003 9e            	ld	a,xh
 951  0004 48            	sll	a
 952  0005 5f            	clrw	x
 953  0006 97            	ld	xl,a
 954  0007 1c5381        	addw	x,#21377
 955  000a 1f02          	ldw	(OFST-1,sp),x
 956                     ; 396   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 958  000c 1e02          	ldw	x,(OFST-1,sp)
 959  000e f6            	ld	a,(x)
 960  000f a4f0          	and	a,#240
 961  0011 6b01          	ld	(OFST-2,sp),a
 962                     ; 399   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 964  0013 7b01          	ld	a,(OFST-2,sp)
 965  0015 1a05          	or	a,(OFST+2,sp)
 966  0017 1e02          	ldw	x,(OFST-1,sp)
 967  0019 f7            	ld	(x),a
 968                     ; 400 }
 971  001a 5b05          	addw	sp,#5
 972  001c 81            	ret
1135                     ; 424 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1135                     ; 425 {
1136                     .text:	section	.text,new
1137  0000               _DAC_SetTriangleWaveAmplitude:
1139  0000 89            	pushw	x
1140  0001 5203          	subw	sp,#3
1141       00000003      OFST:	set	3
1144                     ; 426   uint8_t tmpreg = 0;
1146                     ; 427   uint16_t cr2addr = 0;
1148                     ; 430   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1150                     ; 431   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1152                     ; 435   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1154  0003 9e            	ld	a,xh
1155  0004 48            	sll	a
1156  0005 5f            	clrw	x
1157  0006 97            	ld	xl,a
1158  0007 1c5381        	addw	x,#21377
1159  000a 1f02          	ldw	(OFST-1,sp),x
1160                     ; 436   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1162  000c 1e02          	ldw	x,(OFST-1,sp)
1163  000e f6            	ld	a,(x)
1164  000f a4f0          	and	a,#240
1165  0011 6b01          	ld	(OFST-2,sp),a
1166                     ; 439   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1168  0013 7b01          	ld	a,(OFST-2,sp)
1169  0015 1a05          	or	a,(OFST+2,sp)
1170  0017 1e02          	ldw	x,(OFST-1,sp)
1171  0019 f7            	ld	(x),a
1172                     ; 440 }
1175  001a 5b05          	addw	sp,#5
1176  001c 81            	ret
1246                     ; 452 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1246                     ; 453 {
1247                     .text:	section	.text,new
1248  0000               _DAC_SetChannel1Data:
1250  0000 88            	push	a
1251       00000000      OFST:	set	0
1254                     ; 455   assert_param(IS_DAC_ALIGN(DAC_Align));
1256                     ; 457   if (DAC_Align != DAC_Align_8b_R)
1258  0001 a108          	cp	a,#8
1259  0003 2712          	jreq	L364
1260                     ; 460     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1262  0005 5f            	clrw	x
1263  0006 97            	ld	xl,a
1264  0007 7b04          	ld	a,(OFST+4,sp)
1265  0009 d75388        	ld	(21384,x),a
1266                     ; 461     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1268  000c 7b01          	ld	a,(OFST+1,sp)
1269  000e 5f            	clrw	x
1270  000f 97            	ld	xl,a
1271  0010 7b05          	ld	a,(OFST+5,sp)
1272  0012 d75389        	ld	(21385,x),a
1274  0015 2005          	jra	L564
1275  0017               L364:
1276                     ; 466     assert_param(IS_DAC_DATA_08R(DAC_Data));
1278                     ; 469     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1280  0017 7b05          	ld	a,(OFST+5,sp)
1281  0019 c75390        	ld	21392,a
1282  001c               L564:
1283                     ; 471 }
1286  001c 84            	pop	a
1287  001d 81            	ret
1330                     ; 483 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1330                     ; 484 {
1331                     .text:	section	.text,new
1332  0000               _DAC_SetChannel2Data:
1334  0000 88            	push	a
1335       00000000      OFST:	set	0
1338                     ; 486   assert_param(IS_DAC_ALIGN(DAC_Align));
1340                     ; 488   if (DAC_Align != DAC_Align_8b_R)
1342  0001 a108          	cp	a,#8
1343  0003 2712          	jreq	L705
1344                     ; 491     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1346  0005 5f            	clrw	x
1347  0006 97            	ld	xl,a
1348  0007 7b04          	ld	a,(OFST+4,sp)
1349  0009 d75394        	ld	(21396,x),a
1350                     ; 492     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1352  000c 7b01          	ld	a,(OFST+1,sp)
1353  000e 5f            	clrw	x
1354  000f 97            	ld	xl,a
1355  0010 7b05          	ld	a,(OFST+5,sp)
1356  0012 d75395        	ld	(21397,x),a
1358  0015 2005          	jra	L115
1359  0017               L705:
1360                     ; 497     assert_param(IS_DAC_DATA_08R(DAC_Data));
1362                     ; 500     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1364  0017 7b05          	ld	a,(OFST+5,sp)
1365  0019 c7539c        	ld	21404,a
1366  001c               L115:
1367                     ; 502 }
1370  001c 84            	pop	a
1371  001d 81            	ret
1428                     ; 519 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1428                     ; 520 {
1429                     .text:	section	.text,new
1430  0000               _DAC_SetDualChannelData:
1432  0000 88            	push	a
1433  0001 89            	pushw	x
1434       00000002      OFST:	set	2
1437                     ; 521   uint16_t dchxrdhrhaddr = 0;
1439                     ; 524   assert_param(IS_DAC_ALIGN(DAC_Align));
1441                     ; 526   if (DAC_Align != DAC_Align_8b_R)
1443  0002 a108          	cp	a,#8
1444  0004 2727          	jreq	L735
1445                     ; 529     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1447  0006 a653          	ld	a,#83
1448  0008 97            	ld	xl,a
1449  0009 a6a0          	ld	a,#160
1450  000b 1b03          	add	a,(OFST+1,sp)
1451  000d 2401          	jrnc	L24
1452  000f 5c            	incw	x
1453  0010               L24:
1454  0010 02            	rlwa	x,a
1455  0011 1f01          	ldw	(OFST-1,sp),x
1456  0013 01            	rrwa	x,a
1457                     ; 532     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1459  0014 7b08          	ld	a,(OFST+6,sp)
1460  0016 1e01          	ldw	x,(OFST-1,sp)
1461  0018 f7            	ld	(x),a
1462                     ; 533     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1464  0019 7b09          	ld	a,(OFST+7,sp)
1465  001b 1e01          	ldw	x,(OFST-1,sp)
1466  001d e701          	ld	(1,x),a
1467                     ; 534     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1469  001f 7b06          	ld	a,(OFST+4,sp)
1470  0021 1e01          	ldw	x,(OFST-1,sp)
1471  0023 e702          	ld	(2,x),a
1472                     ; 535     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1474  0025 7b07          	ld	a,(OFST+5,sp)
1475  0027 1e01          	ldw	x,(OFST-1,sp)
1476  0029 e703          	ld	(3,x),a
1478  002b 200a          	jra	L145
1479  002d               L735:
1480                     ; 540     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1482                     ; 543     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1484  002d 7b09          	ld	a,(OFST+7,sp)
1485  002f c753a8        	ld	21416,a
1486                     ; 544     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1488  0032 7b07          	ld	a,(OFST+5,sp)
1489  0034 c753a9        	ld	21417,a
1490  0037               L145:
1491                     ; 546 }
1494  0037 5b03          	addw	sp,#3
1495  0039 81            	ret
1545                     ; 556 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1545                     ; 557 {
1546                     .text:	section	.text,new
1547  0000               _DAC_GetDataOutputValue:
1549  0000 89            	pushw	x
1550       00000002      OFST:	set	2
1553                     ; 558   uint16_t outputdata = 0;
1555                     ; 559   uint16_t tmp = 0;
1557                     ; 562   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1559                     ; 564   if ( DAC_Channel ==  DAC_Channel_1)
1561  0001 4d            	tnz	a
1562  0002 2619          	jrne	L565
1563                     ; 567     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1565  0004 c653ac        	ld	a,21420
1566  0007 5f            	clrw	x
1567  0008 97            	ld	xl,a
1568  0009 4f            	clr	a
1569  000a 02            	rlwa	x,a
1570  000b 1f01          	ldw	(OFST-1,sp),x
1571                     ; 568     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1573  000d c653ad        	ld	a,21421
1574  0010 5f            	clrw	x
1575  0011 97            	ld	xl,a
1576  0012 01            	rrwa	x,a
1577  0013 1a02          	or	a,(OFST+0,sp)
1578  0015 01            	rrwa	x,a
1579  0016 1a01          	or	a,(OFST-1,sp)
1580  0018 01            	rrwa	x,a
1581  0019 1f01          	ldw	(OFST-1,sp),x
1583  001b 2017          	jra	L765
1584  001d               L565:
1585                     ; 573     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1587  001d c653b0        	ld	a,21424
1588  0020 5f            	clrw	x
1589  0021 97            	ld	xl,a
1590  0022 4f            	clr	a
1591  0023 02            	rlwa	x,a
1592  0024 1f01          	ldw	(OFST-1,sp),x
1593                     ; 574     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1595  0026 c653b1        	ld	a,21425
1596  0029 5f            	clrw	x
1597  002a 97            	ld	xl,a
1598  002b 01            	rrwa	x,a
1599  002c 1a02          	or	a,(OFST+0,sp)
1600  002e 01            	rrwa	x,a
1601  002f 1a01          	or	a,(OFST-1,sp)
1602  0031 01            	rrwa	x,a
1603  0032 1f01          	ldw	(OFST-1,sp),x
1604  0034               L765:
1605                     ; 578   return (uint16_t)outputdata;
1607  0034 1e01          	ldw	x,(OFST-1,sp)
1610  0036 5b02          	addw	sp,#2
1611  0038 81            	ret
1663                     ; 610 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1663                     ; 611 {
1664                     .text:	section	.text,new
1665  0000               _DAC_DMACmd:
1667  0000 89            	pushw	x
1668  0001 89            	pushw	x
1669       00000002      OFST:	set	2
1672                     ; 612   uint16_t cr2addr = 0;
1674                     ; 615   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1676                     ; 616   assert_param(IS_FUNCTIONAL_STATE(NewState));
1678                     ; 619   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1680  0002 9e            	ld	a,xh
1681  0003 48            	sll	a
1682  0004 5f            	clrw	x
1683  0005 97            	ld	xl,a
1684  0006 1c5381        	addw	x,#21377
1685  0009 1f01          	ldw	(OFST-1,sp),x
1686                     ; 621   if (NewState != DISABLE)
1688  000b 0d04          	tnz	(OFST+2,sp)
1689  000d 2708          	jreq	L516
1690                     ; 624     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1692  000f 1e01          	ldw	x,(OFST-1,sp)
1693  0011 f6            	ld	a,(x)
1694  0012 aa10          	or	a,#16
1695  0014 f7            	ld	(x),a
1697  0015 2006          	jra	L716
1698  0017               L516:
1699                     ; 629     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1701  0017 1e01          	ldw	x,(OFST-1,sp)
1702  0019 f6            	ld	a,(x)
1703  001a a4ef          	and	a,#239
1704  001c f7            	ld	(x),a
1705  001d               L716:
1706                     ; 631 }
1709  001d 5b04          	addw	sp,#4
1710  001f 81            	ret
1785                     ; 664 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1785                     ; 665 {
1786                     .text:	section	.text,new
1787  0000               _DAC_ITConfig:
1789  0000 89            	pushw	x
1790  0001 89            	pushw	x
1791       00000002      OFST:	set	2
1794                     ; 666   uint16_t cr2addr = 0;
1796                     ; 669   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1798                     ; 670   assert_param(IS_FUNCTIONAL_STATE(NewState));
1800                     ; 671   assert_param(IS_DAC_IT(DAC_IT));
1802                     ; 674   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1804  0002 9e            	ld	a,xh
1805  0003 48            	sll	a
1806  0004 5f            	clrw	x
1807  0005 97            	ld	xl,a
1808  0006 1c5381        	addw	x,#21377
1809  0009 1f01          	ldw	(OFST-1,sp),x
1810                     ; 676   if (NewState != DISABLE)
1812  000b 0d07          	tnz	(OFST+5,sp)
1813  000d 2708          	jreq	L756
1814                     ; 679     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1816  000f 1e01          	ldw	x,(OFST-1,sp)
1817  0011 f6            	ld	a,(x)
1818  0012 1a04          	or	a,(OFST+2,sp)
1819  0014 f7            	ld	(x),a
1821  0015 2007          	jra	L166
1822  0017               L756:
1823                     ; 684     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1825  0017 1e01          	ldw	x,(OFST-1,sp)
1826  0019 7b04          	ld	a,(OFST+2,sp)
1827  001b 43            	cpl	a
1828  001c f4            	and	a,(x)
1829  001d f7            	ld	(x),a
1830  001e               L166:
1831                     ; 686 }
1834  001e 5b04          	addw	sp,#4
1835  0020 81            	ret
1931                     ; 701 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1931                     ; 702 {
1932                     .text:	section	.text,new
1933  0000               _DAC_GetFlagStatus:
1935  0000 89            	pushw	x
1936  0001 88            	push	a
1937       00000001      OFST:	set	1
1940                     ; 703   FlagStatus flagstatus = RESET;
1942                     ; 704   uint8_t flag = 0;
1944                     ; 707   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1946                     ; 708   assert_param(IS_DAC_FLAG(DAC_FLAG));
1948                     ; 710   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1950  0002 9e            	ld	a,xh
1951  0003 5f            	clrw	x
1952  0004 97            	ld	xl,a
1953  0005 7b03          	ld	a,(OFST+2,sp)
1954  0007 5d            	tnzw	x
1955  0008 2704          	jreq	L45
1956  000a               L65:
1957  000a 48            	sll	a
1958  000b 5a            	decw	x
1959  000c 26fc          	jrne	L65
1960  000e               L45:
1961  000e 6b01          	ld	(OFST+0,sp),a
1962                     ; 713   if ((DAC->SR & flag ) != (uint8_t)RESET)
1964  0010 c65385        	ld	a,21381
1965  0013 1501          	bcp	a,(OFST+0,sp)
1966  0015 2706          	jreq	L137
1967                     ; 716     flagstatus = SET;
1969  0017 a601          	ld	a,#1
1970  0019 6b01          	ld	(OFST+0,sp),a
1972  001b 2002          	jra	L337
1973  001d               L137:
1974                     ; 721     flagstatus = RESET;
1976  001d 0f01          	clr	(OFST+0,sp)
1977  001f               L337:
1978                     ; 725   return  flagstatus;
1980  001f 7b01          	ld	a,(OFST+0,sp)
1983  0021 5b03          	addw	sp,#3
1984  0023 81            	ret
2036                     ; 739 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2036                     ; 740 {
2037                     .text:	section	.text,new
2038  0000               _DAC_ClearFlag:
2040  0000 89            	pushw	x
2041  0001 88            	push	a
2042       00000001      OFST:	set	1
2045                     ; 741   uint8_t flag = 0;
2047                     ; 744   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2049                     ; 745   assert_param(IS_DAC_FLAG(DAC_FLAG));
2051                     ; 748   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2053  0002 9e            	ld	a,xh
2054  0003 5f            	clrw	x
2055  0004 97            	ld	xl,a
2056  0005 7b03          	ld	a,(OFST+2,sp)
2057  0007 5d            	tnzw	x
2058  0008 2704          	jreq	L26
2059  000a               L46:
2060  000a 48            	sll	a
2061  000b 5a            	decw	x
2062  000c 26fc          	jrne	L46
2063  000e               L26:
2064  000e 6b01          	ld	(OFST+0,sp),a
2065                     ; 751   DAC->SR = (uint8_t)(~flag);
2067  0010 7b01          	ld	a,(OFST+0,sp)
2068  0012 43            	cpl	a
2069  0013 c75385        	ld	21381,a
2070                     ; 752 }
2073  0016 5b03          	addw	sp,#3
2074  0018 81            	ret
2151                     ; 767 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2151                     ; 768 {
2152                     .text:	section	.text,new
2153  0000               _DAC_GetITStatus:
2155  0000 89            	pushw	x
2156  0001 89            	pushw	x
2157       00000002      OFST:	set	2
2160                     ; 769   ITStatus itstatus = RESET;
2162                     ; 770   uint8_t enablestatus = 0;
2164                     ; 771   uint8_t flagstatus = 0;
2166                     ; 772   uint8_t tempreg = 0;
2168                     ; 775   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2170                     ; 776   assert_param(IS_DAC_IT(DAC_IT));
2172                     ; 779   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2174  0002 9e            	ld	a,xh
2175  0003 48            	sll	a
2176  0004 48            	sll	a
2177  0005 5f            	clrw	x
2178  0006 97            	ld	xl,a
2179  0007 d65381        	ld	a,(21377,x)
2180  000a 6b02          	ld	(OFST+0,sp),a
2181                     ; 780   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2183  000c 7b03          	ld	a,(OFST+1,sp)
2184  000e 5f            	clrw	x
2185  000f 97            	ld	xl,a
2186  0010 7b04          	ld	a,(OFST+2,sp)
2187  0012 5d            	tnzw	x
2188  0013 2704          	jreq	L07
2189  0015               L27:
2190  0015 48            	sll	a
2191  0016 5a            	decw	x
2192  0017 26fc          	jrne	L27
2193  0019               L07:
2194  0019 1402          	and	a,(OFST+0,sp)
2195  001b 6b01          	ld	(OFST-1,sp),a
2196                     ; 781   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2198  001d a605          	ld	a,#5
2199  001f 1003          	sub	a,(OFST+1,sp)
2200  0021 5f            	clrw	x
2201  0022 97            	ld	xl,a
2202  0023 7b04          	ld	a,(OFST+2,sp)
2203  0025 5d            	tnzw	x
2204  0026 2704          	jreq	L47
2205  0028               L67:
2206  0028 44            	srl	a
2207  0029 5a            	decw	x
2208  002a 26fc          	jrne	L67
2209  002c               L47:
2210  002c c45385        	and	a,21381
2211  002f 6b02          	ld	(OFST+0,sp),a
2212                     ; 784   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2214  0031 0d02          	tnz	(OFST+0,sp)
2215  0033 270a          	jreq	L5101
2217  0035 0d01          	tnz	(OFST-1,sp)
2218  0037 2706          	jreq	L5101
2219                     ; 787     itstatus = SET;
2221  0039 a601          	ld	a,#1
2222  003b 6b02          	ld	(OFST+0,sp),a
2224  003d 2002          	jra	L7101
2225  003f               L5101:
2226                     ; 792     itstatus = RESET;
2228  003f 0f02          	clr	(OFST+0,sp)
2229  0041               L7101:
2230                     ; 796   return  itstatus;
2232  0041 7b02          	ld	a,(OFST+0,sp)
2235  0043 5b04          	addw	sp,#4
2236  0045 81            	ret
2282                     ; 810 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2282                     ; 811 {
2283                     .text:	section	.text,new
2284  0000               _DAC_ClearITPendingBit:
2286  0000 89            	pushw	x
2287       00000000      OFST:	set	0
2290                     ; 813   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2292                     ; 814   assert_param(IS_DAC_IT(DAC_IT));
2294                     ; 817   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2296  0001 9e            	ld	a,xh
2297  0002 a005          	sub	a,#5
2298  0004 40            	neg	a
2299  0005 5f            	clrw	x
2300  0006 97            	ld	xl,a
2301  0007 7b02          	ld	a,(OFST+2,sp)
2302  0009 5d            	tnzw	x
2303  000a 2704          	jreq	L201
2304  000c               L401:
2305  000c 44            	srl	a
2306  000d 5a            	decw	x
2307  000e 26fc          	jrne	L401
2308  0010               L201:
2309  0010 43            	cpl	a
2310  0011 c75385        	ld	21381,a
2311                     ; 818 }
2314  0014 85            	popw	x
2315  0015 81            	ret
2328                     	xdef	_DAC_ClearITPendingBit
2329                     	xdef	_DAC_GetITStatus
2330                     	xdef	_DAC_ClearFlag
2331                     	xdef	_DAC_GetFlagStatus
2332                     	xdef	_DAC_ITConfig
2333                     	xdef	_DAC_DMACmd
2334                     	xdef	_DAC_GetDataOutputValue
2335                     	xdef	_DAC_SetDualChannelData
2336                     	xdef	_DAC_SetChannel2Data
2337                     	xdef	_DAC_SetChannel1Data
2338                     	xdef	_DAC_SetTriangleWaveAmplitude
2339                     	xdef	_DAC_SetNoiseWaveLFSR
2340                     	xdef	_DAC_WaveGenerationCmd
2341                     	xdef	_DAC_DualSoftwareTriggerCmd
2342                     	xdef	_DAC_SoftwareTriggerCmd
2343                     	xdef	_DAC_Cmd
2344                     	xdef	_DAC_Init
2345                     	xdef	_DAC_DeInit
2364                     	end
