   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 116 void SYSCFG_RIDeInit(void)
  50                     ; 117 {
  52                     .text:	section	.text,new
  53  0000               _SYSCFG_RIDeInit:
  57                     ; 118   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  59  0000 725f5431      	clr	21553
  60                     ; 119   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  62  0004 725f5432      	clr	21554
  63                     ; 120   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  65  0008 725f5439      	clr	21561
  66                     ; 121   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  68  000c 725f543a      	clr	21562
  69                     ; 122   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  71  0010 725f543b      	clr	21563
  72                     ; 123   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  74  0014 725f5457      	clr	21591
  75                     ; 124   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  77  0018 725f543d      	clr	21565
  78                     ; 125   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  80  001c 725f543e      	clr	21566
  81                     ; 126   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  83  0020 725f543f      	clr	21567
  84                     ; 127 }
  87  0024 81            	ret	
 346                     ; 139 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 346                     ; 140                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 346                     ; 141 {
 347                     .text:	section	.text,new
 348  0000               _SYSCFG_RITIMInputCaptureConfig:
 350  0000 89            	pushw	x
 351       00000000      OFST:	set	0
 354                     ; 143   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 356                     ; 144   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 358                     ; 147   if (RI_InputCapture == RI_InputCapture_IC2)
 360  0001 9e            	ld	a,xh
 361  0002 a102          	cp	a,#2
 362  0004 2606          	jrne	L531
 363                     ; 150     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 365  0006 9f            	ld	a,xl
 366  0007 c75431        	ld	21553,a
 368  000a 2005          	jra	L731
 369  000c               L531:
 370                     ; 156     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 372  000c 7b02          	ld	a,(OFST+2,sp)
 373  000e c75432        	ld	21554,a
 374  0011               L731:
 375                     ; 158 }
 378  0011 85            	popw	x
 379  0012 81            	ret	
 557                     ; 181 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 557                     ; 182                                  FunctionalState NewState)
 557                     ; 183 {
 558                     .text:	section	.text,new
 559  0000               _SYSCFG_RIAnalogSwitchConfig:
 561  0000 89            	pushw	x
 562  0001 89            	pushw	x
 563       00000002      OFST:	set	2
 566                     ; 184   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 568                     ; 187   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 570                     ; 188   assert_param(IS_FUNCTIONAL_STATE(NewState));
 572                     ; 191   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 574  0002 9e            	ld	a,xh
 575  0003 a4f0          	and	a,#240
 576  0005 6b01          	ld	(OFST-1,sp),a
 577                     ; 194   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 579  0007 7b03          	ld	a,(OFST+1,sp)
 580  0009 a40f          	and	a,#15
 581  000b 6b02          	ld	(OFST+0,sp),a
 582                     ; 196   if (NewState != DISABLE)
 584  000d 7b04          	ld	a,(OFST+2,sp)
 585  000f 2724          	jreq	L532
 586                     ; 198     if (AnalogSwitchRegister == (uint8_t) 0x10)
 588  0011 7b01          	ld	a,(OFST-1,sp)
 589  0013 a110          	cp	a,#16
 590  0015 260f          	jrne	L732
 591                     ; 201       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 593  0017 7b02          	ld	a,(OFST+0,sp)
 594  0019 ad47          	call	LC003
 595  001b 2704          	jreq	L21
 596  001d               L41:
 597  001d 48            	sll	a
 598  001e 5a            	decw	x
 599  001f 26fc          	jrne	L41
 600  0021               L21:
 601  0021 ca543d        	or	a,21565
 603  0024 2023          	jp	LC002
 604  0026               L732:
 605                     ; 206       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 607  0026 7b02          	ld	a,(OFST+0,sp)
 608  0028 ad38          	call	LC003
 609  002a 2704          	jreq	L61
 610  002c               L02:
 611  002c 48            	sll	a
 612  002d 5a            	decw	x
 613  002e 26fc          	jrne	L02
 614  0030               L61:
 615  0030 ca543e        	or	a,21566
 616  0033 2027          	jp	LC001
 617  0035               L532:
 618                     ; 211     if (AnalogSwitchRegister == (uint8_t) 0x10)
 620  0035 7b01          	ld	a,(OFST-1,sp)
 621  0037 a110          	cp	a,#16
 622  0039 2613          	jrne	L542
 623                     ; 214       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 625  003b 7b02          	ld	a,(OFST+0,sp)
 626  003d ad23          	call	LC003
 627  003f 2704          	jreq	L22
 628  0041               L42:
 629  0041 48            	sll	a
 630  0042 5a            	decw	x
 631  0043 26fc          	jrne	L42
 632  0045               L22:
 633  0045 43            	cpl	a
 634  0046 c4543d        	and	a,21565
 635  0049               LC002:
 636  0049 c7543d        	ld	21565,a
 638  004c 2011          	jra	L342
 639  004e               L542:
 640                     ; 219       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 642  004e 7b02          	ld	a,(OFST+0,sp)
 643  0050 ad10          	call	LC003
 644  0052 2704          	jreq	L62
 645  0054               L03:
 646  0054 48            	sll	a
 647  0055 5a            	decw	x
 648  0056 26fc          	jrne	L03
 649  0058               L62:
 650  0058 43            	cpl	a
 651  0059 c4543e        	and	a,21566
 652  005c               LC001:
 653  005c c7543e        	ld	21566,a
 654  005f               L342:
 655                     ; 222 }
 658  005f 5b04          	addw	sp,#4
 659  0061 81            	ret	
 660  0062               LC003:
 661  0062 5f            	clrw	x
 662  0063 97            	ld	xl,a
 663  0064 a601          	ld	a,#1
 664  0066 5d            	tnzw	x
 665  0067 81            	ret	
 927                     ; 231 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 927                     ; 232                              FunctionalState NewState)
 927                     ; 233 {
 928                     .text:	section	.text,new
 929  0000               _SYSCFG_RIIOSwitchConfig:
 931  0000 89            	pushw	x
 932  0001 89            	pushw	x
 933       00000002      OFST:	set	2
 936                     ; 234   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
 938                     ; 237   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 940                     ; 238   assert_param(IS_FUNCTIONAL_STATE(NewState));
 942                     ; 241   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 944  0002 9e            	ld	a,xh
 945  0003 a40f          	and	a,#15
 946  0005 6b02          	ld	(OFST+0,sp),a
 947                     ; 244   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 949  0007 7b03          	ld	a,(OFST+1,sp)
 950  0009 a4f0          	and	a,#240
 951  000b 6b01          	ld	(OFST-1,sp),a
 952                     ; 247   if (IOSwitchRegsiter == (uint8_t) 0x10)
 954  000d a110          	cp	a,#16
 955  000f 262c          	jrne	L373
 956                     ; 249     if (NewState != DISABLE)
 958  0011 7b04          	ld	a,(OFST+2,sp)
 959  0013 2714          	jreq	L573
 960                     ; 252       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 962  0015 7b02          	ld	a,(OFST+0,sp)
 963  0017 cd00bb        	call	LC006
 964  001a 2704          	jreq	L43
 965  001c               L63:
 966  001c 48            	sll	a
 967  001d 5a            	decw	x
 968  001e 26fc          	jrne	L63
 969  0020               L43:
 970  0020 ca5439        	or	a,21561
 971  0023 c75439        	ld	21561,a
 973  0026 cc00b8        	jra	L104
 974  0029               L573:
 975                     ; 257       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 977  0029 7b02          	ld	a,(OFST+0,sp)
 978  002b cd00bb        	call	LC006
 979  002e 2704          	jreq	L04
 980  0030               L24:
 981  0030 48            	sll	a
 982  0031 5a            	decw	x
 983  0032 26fc          	jrne	L24
 984  0034               L04:
 985  0034 43            	cpl	a
 986  0035 c45439        	and	a,21561
 987  0038 c75439        	ld	21561,a
 988  003b 207b          	jra	L104
 989  003d               L373:
 990                     ; 262   else if (IOSwitchRegsiter == (uint8_t) 0x20)
 992  003d a120          	cp	a,#32
 993  003f 2629          	jrne	L304
 994                     ; 264     if (NewState != DISABLE)
 996  0041 7b04          	ld	a,(OFST+2,sp)
 997  0043 2712          	jreq	L504
 998                     ; 267       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1000  0045 7b02          	ld	a,(OFST+0,sp)
1001  0047 ad72          	call	LC006
1002  0049 2704          	jreq	L44
1003  004b               L64:
1004  004b 48            	sll	a
1005  004c 5a            	decw	x
1006  004d 26fc          	jrne	L64
1007  004f               L44:
1008  004f ca543a        	or	a,21562
1009  0052 c7543a        	ld	21562,a
1011  0055 2061          	jra	L104
1012  0057               L504:
1013                     ; 272       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1015  0057 7b02          	ld	a,(OFST+0,sp)
1016  0059 ad60          	call	LC006
1017  005b 2704          	jreq	L05
1018  005d               L25:
1019  005d 48            	sll	a
1020  005e 5a            	decw	x
1021  005f 26fc          	jrne	L25
1022  0061               L05:
1023  0061 43            	cpl	a
1024  0062 c4543a        	and	a,21562
1025  0065 c7543a        	ld	21562,a
1026  0068 204e          	jra	L104
1027  006a               L304:
1028                     ; 277   else if (IOSwitchRegsiter == (uint8_t) 0x30)
1030  006a a130          	cp	a,#48
1031  006c 2626          	jrne	L314
1032                     ; 279     if (NewState != DISABLE)
1034  006e 7b04          	ld	a,(OFST+2,sp)
1035  0070 270f          	jreq	L514
1036                     ; 282       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1038  0072 7b02          	ld	a,(OFST+0,sp)
1039  0074 ad45          	call	LC006
1040  0076 2704          	jreq	L45
1041  0078               L65:
1042  0078 48            	sll	a
1043  0079 5a            	decw	x
1044  007a 26fc          	jrne	L65
1045  007c               L45:
1046  007c ca543b        	or	a,21563
1048  007f 200e          	jp	LC005
1049  0081               L514:
1050                     ; 287       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1052  0081 7b02          	ld	a,(OFST+0,sp)
1053  0083 ad36          	call	LC006
1054  0085 2704          	jreq	L06
1055  0087               L26:
1056  0087 48            	sll	a
1057  0088 5a            	decw	x
1058  0089 26fc          	jrne	L26
1059  008b               L06:
1060  008b 43            	cpl	a
1061  008c c4543b        	and	a,21563
1062  008f               LC005:
1063  008f c7543b        	ld	21563,a
1064  0092 2024          	jra	L104
1065  0094               L314:
1066                     ; 294     if (NewState != DISABLE)
1068  0094 7b04          	ld	a,(OFST+2,sp)
1069  0096 270f          	jreq	L324
1070                     ; 297       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1072  0098 7b02          	ld	a,(OFST+0,sp)
1073  009a ad1f          	call	LC006
1074  009c 2704          	jreq	L46
1075  009e               L66:
1076  009e 48            	sll	a
1077  009f 5a            	decw	x
1078  00a0 26fc          	jrne	L66
1079  00a2               L46:
1080  00a2 ca5457        	or	a,21591
1082  00a5 200e          	jp	LC004
1083  00a7               L324:
1084                     ; 302       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1086  00a7 7b02          	ld	a,(OFST+0,sp)
1087  00a9 ad10          	call	LC006
1088  00ab 2704          	jreq	L07
1089  00ad               L27:
1090  00ad 48            	sll	a
1091  00ae 5a            	decw	x
1092  00af 26fc          	jrne	L27
1093  00b1               L07:
1094  00b1 43            	cpl	a
1095  00b2 c45457        	and	a,21591
1096  00b5               LC004:
1097  00b5 c75457        	ld	21591,a
1098  00b8               L104:
1099                     ; 305 }
1102  00b8 5b04          	addw	sp,#4
1103  00ba 81            	ret	
1104  00bb               LC006:
1105  00bb 5f            	clrw	x
1106  00bc 97            	ld	xl,a
1107  00bd a601          	ld	a,#1
1108  00bf 5d            	tnzw	x
1109  00c0 81            	ret	
1189                     ; 317 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1189                     ; 318 {
1190                     .text:	section	.text,new
1191  0000               _SYSCFG_RIResistorConfig:
1193  0000 89            	pushw	x
1194       00000000      OFST:	set	0
1197                     ; 320   assert_param(IS_RI_RESISTOR(RI_Resistor));
1199                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
1201                     ; 323   if (NewState != DISABLE)
1203  0001 9f            	ld	a,xl
1204  0002 4d            	tnz	a
1205  0003 2706          	jreq	L564
1206                     ; 326     RI->RCR |= (uint8_t) RI_Resistor;
1208  0005 9e            	ld	a,xh
1209  0006 ca543f        	or	a,21567
1211  0009 2006          	jra	L764
1212  000b               L564:
1213                     ; 331     RI->RCR &= (uint8_t) (~RI_Resistor);
1215  000b 7b01          	ld	a,(OFST+1,sp)
1216  000d 43            	cpl	a
1217  000e c4543f        	and	a,21567
1218  0011               L764:
1219  0011 c7543f        	ld	21567,a
1220                     ; 333 }
1223  0014 85            	popw	x
1224  0015 81            	ret	
1247                     ; 365 void SYSCFG_REMAPDeInit(void)
1247                     ; 366 {
1248                     .text:	section	.text,new
1249  0000               _SYSCFG_REMAPDeInit:
1253                     ; 368   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1255  0000 350c509e      	mov	20638,#12
1256                     ; 371   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1258  0004 725f509f      	clr	20639
1259                     ; 374   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1261  0008 725f509d      	clr	20637
1262                     ; 375 }
1265  000c 81            	ret	
1481                     ; 408 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1481                     ; 409 {
1482                     .text:	section	.text,new
1483  0000               _SYSCFG_REMAPPinConfig:
1485  0000 89            	pushw	x
1486  0001 88            	push	a
1487       00000001      OFST:	set	1
1490                     ; 410   uint8_t regindex = 0;
1492                     ; 412   assert_param(IS_REMAP_PIN(REMAP_Pin));
1494                     ; 413   assert_param(IS_FUNCTIONAL_STATE(NewState));
1496                     ; 416   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1498  0002 9e            	ld	a,xh
1499  0003 6b01          	ld	(OFST+0,sp),a
1500                     ; 419   if (regindex == 0x01)
1502  0005 a101          	cp	a,#1
1503  0007 261c          	jrne	L106
1504                     ; 421     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1506  0009 a610          	ld	a,#16
1507  000b 42            	mul	x,a
1508  000c 9f            	ld	a,xl
1509  000d aa0f          	or	a,#15
1510  000f c4509e        	and	a,20638
1511  0012 c7509e        	ld	20638,a
1512                     ; 422     if (NewState != DISABLE)
1514  0015 7b06          	ld	a,(OFST+5,sp)
1515  0017 273a          	jreq	L506
1516                     ; 424       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1518  0019 7b03          	ld	a,(OFST+2,sp)
1519  001b a4f0          	and	a,#240
1520  001d ca509e        	or	a,20638
1521  0020 c7509e        	ld	20638,a
1522  0023 202e          	jra	L506
1523  0025               L106:
1524                     ; 428   else if (regindex == 0x02)
1526  0025 a102          	cp	a,#2
1527  0027 2616          	jrne	L706
1528                     ; 430     if (NewState != DISABLE)
1530  0029 7b06          	ld	a,(OFST+5,sp)
1531  002b 2707          	jreq	L116
1532                     ; 432       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1534  002d c6509f        	ld	a,20639
1535  0030 1a03          	or	a,(OFST+2,sp)
1537  0032 2006          	jp	LC008
1538  0034               L116:
1539                     ; 436       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1541  0034 7b03          	ld	a,(OFST+2,sp)
1542  0036 43            	cpl	a
1543  0037 c4509f        	and	a,20639
1544  003a               LC008:
1545  003a c7509f        	ld	20639,a
1546  003d 2014          	jra	L506
1547  003f               L706:
1548                     ; 442     if (NewState != DISABLE)
1550  003f 7b06          	ld	a,(OFST+5,sp)
1551  0041 2707          	jreq	L716
1552                     ; 444       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1554  0043 c6509d        	ld	a,20637
1555  0046 1a03          	or	a,(OFST+2,sp)
1557  0048 2006          	jp	LC007
1558  004a               L716:
1559                     ; 448       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1561  004a 7b03          	ld	a,(OFST+2,sp)
1562  004c 43            	cpl	a
1563  004d c4509d        	and	a,20637
1564  0050               LC007:
1565  0050 c7509d        	ld	20637,a
1566  0053               L506:
1567                     ; 451 }
1570  0053 5b03          	addw	sp,#3
1571  0055 81            	ret	
1677                     ; 467 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1677                     ; 468 {
1678                     .text:	section	.text,new
1679  0000               _SYSCFG_REMAPDMAChannelConfig:
1681  0000 88            	push	a
1682       00000000      OFST:	set	0
1685                     ; 470   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1687                     ; 473   if ((REMAP_DMAChannel & 0xF0) != RESET)
1689  0001 a5f0          	bcp	a,#240
1690  0003 2707          	jreq	L566
1691                     ; 476     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1693  0005 c6509e        	ld	a,20638
1694  0008 a4f3          	and	a,#243
1696  000a 2005          	jra	L766
1697  000c               L566:
1698                     ; 482     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1700  000c c6509e        	ld	a,20638
1701  000f a4fc          	and	a,#252
1702  0011               L766:
1703  0011 c7509e        	ld	20638,a
1704                     ; 485   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1706  0014 7b01          	ld	a,(OFST+1,sp)
1707  0016 a40f          	and	a,#15
1708  0018 ca509e        	or	a,20638
1709  001b c7509e        	ld	20638,a
1710                     ; 486 }
1713  001e 84            	pop	a
1714  001f 81            	ret	
1727                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1728                     	xdef	_SYSCFG_REMAPPinConfig
1729                     	xdef	_SYSCFG_REMAPDeInit
1730                     	xdef	_SYSCFG_RIResistorConfig
1731                     	xdef	_SYSCFG_RIIOSwitchConfig
1732                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1733                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1734                     	xdef	_SYSCFG_RIDeInit
1753                     	end
