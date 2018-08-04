   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 116 void SYSCFG_RIDeInit(void)
  50                     ; 117 {
  51                     .text:	section	.text,new
  52  0000               f_SYSCFG_RIDeInit:
  56                     ; 118   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  58  0000 725f5431      	clr	21553
  59                     ; 119   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  61  0004 725f5432      	clr	21554
  62                     ; 120   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  64  0008 725f5439      	clr	21561
  65                     ; 121   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  67  000c 725f543a      	clr	21562
  68                     ; 122   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  70  0010 725f543b      	clr	21563
  71                     ; 123   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  73  0014 725f5457      	clr	21591
  74                     ; 124   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  76  0018 725f543d      	clr	21565
  77                     ; 125   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  79  001c 725f543e      	clr	21566
  80                     ; 126   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  82  0020 725f543f      	clr	21567
  83                     ; 127 }
  86  0024 87            	retf	
 344                     ; 139 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 344                     ; 140                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 344                     ; 141 {
 345                     .text:	section	.text,new
 346  0000               f_SYSCFG_RITIMInputCaptureConfig:
 348  0000 89            	pushw	x
 349       00000000      OFST:	set	0
 352                     ; 143   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 354                     ; 144   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 356                     ; 147   if (RI_InputCapture == RI_InputCapture_IC2)
 358  0001 9e            	ld	a,xh
 359  0002 a102          	cp	a,#2
 360  0004 2606          	jrne	L531
 361                     ; 150     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 363  0006 9f            	ld	a,xl
 364  0007 c75431        	ld	21553,a
 366  000a 2005          	jra	L731
 367  000c               L531:
 368                     ; 156     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 370  000c 7b02          	ld	a,(OFST+2,sp)
 371  000e c75432        	ld	21554,a
 372  0011               L731:
 373                     ; 158 }
 376  0011 85            	popw	x
 377  0012 87            	retf	
 554                     ; 181 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 554                     ; 182                                  FunctionalState NewState)
 554                     ; 183 {
 555                     .text:	section	.text,new
 556  0000               f_SYSCFG_RIAnalogSwitchConfig:
 558  0000 89            	pushw	x
 559  0001 89            	pushw	x
 560       00000002      OFST:	set	2
 563                     ; 184   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 565                     ; 187   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 567                     ; 188   assert_param(IS_FUNCTIONAL_STATE(NewState));
 569                     ; 191   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 571  0002 9e            	ld	a,xh
 572  0003 a4f0          	and	a,#240
 573  0005 6b01          	ld	(OFST-1,sp),a
 574                     ; 194   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 576  0007 7b03          	ld	a,(OFST+1,sp)
 577  0009 a40f          	and	a,#15
 578  000b 6b02          	ld	(OFST+0,sp),a
 579                     ; 196   if (NewState != DISABLE)
 581  000d 7b04          	ld	a,(OFST+2,sp)
 582  000f 2728          	jreq	L532
 583                     ; 198     if (AnalogSwitchRegister == (uint8_t) 0x10)
 585  0011 7b01          	ld	a,(OFST-1,sp)
 586  0013 a110          	cp	a,#16
 587  0015 2611          	jrne	L732
 588                     ; 201       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 590  0017 7b02          	ld	a,(OFST+0,sp)
 591  0019 8d6a006a      	callf	LC003
 592  001d 2704          	jreq	L21
 593  001f               L41:
 594  001f 48            	sll	a
 595  0020 5a            	decw	x
 596  0021 26fc          	jrne	L41
 597  0023               L21:
 598  0023 ca543d        	or	a,21565
 600  0026 2027          	jpf	LC002
 601  0028               L732:
 602                     ; 206       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 604  0028 7b02          	ld	a,(OFST+0,sp)
 605  002a 8d6a006a      	callf	LC003
 606  002e 2704          	jreq	L61
 607  0030               L02:
 608  0030 48            	sll	a
 609  0031 5a            	decw	x
 610  0032 26fc          	jrne	L02
 611  0034               L61:
 612  0034 ca543e        	or	a,21566
 613  0037 202b          	jpf	LC001
 614  0039               L532:
 615                     ; 211     if (AnalogSwitchRegister == (uint8_t) 0x10)
 617  0039 7b01          	ld	a,(OFST-1,sp)
 618  003b a110          	cp	a,#16
 619  003d 2615          	jrne	L542
 620                     ; 214       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 622  003f 7b02          	ld	a,(OFST+0,sp)
 623  0041 8d6a006a      	callf	LC003
 624  0045 2704          	jreq	L22
 625  0047               L42:
 626  0047 48            	sll	a
 627  0048 5a            	decw	x
 628  0049 26fc          	jrne	L42
 629  004b               L22:
 630  004b 43            	cpl	a
 631  004c c4543d        	and	a,21565
 632  004f               LC002:
 633  004f c7543d        	ld	21565,a
 635  0052 2013          	jra	L342
 636  0054               L542:
 637                     ; 219       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 639  0054 7b02          	ld	a,(OFST+0,sp)
 640  0056 8d6a006a      	callf	LC003
 641  005a 2704          	jreq	L62
 642  005c               L03:
 643  005c 48            	sll	a
 644  005d 5a            	decw	x
 645  005e 26fc          	jrne	L03
 646  0060               L62:
 647  0060 43            	cpl	a
 648  0061 c4543e        	and	a,21566
 649  0064               LC001:
 650  0064 c7543e        	ld	21566,a
 651  0067               L342:
 652                     ; 222 }
 655  0067 5b04          	addw	sp,#4
 656  0069 87            	retf	
 657  006a               LC003:
 658  006a 5f            	clrw	x
 659  006b 97            	ld	xl,a
 660  006c a601          	ld	a,#1
 661  006e 5d            	tnzw	x
 662  006f 87            	retf	
 923                     ; 231 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 923                     ; 232                              FunctionalState NewState)
 923                     ; 233 {
 924                     .text:	section	.text,new
 925  0000               f_SYSCFG_RIIOSwitchConfig:
 927  0000 89            	pushw	x
 928  0001 89            	pushw	x
 929       00000002      OFST:	set	2
 932                     ; 234   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
 934                     ; 237   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 936                     ; 238   assert_param(IS_FUNCTIONAL_STATE(NewState));
 938                     ; 241   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 940  0002 9e            	ld	a,xh
 941  0003 a40f          	and	a,#15
 942  0005 6b02          	ld	(OFST+0,sp),a
 943                     ; 244   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 945  0007 7b03          	ld	a,(OFST+1,sp)
 946  0009 a4f0          	and	a,#240
 947  000b 6b01          	ld	(OFST-1,sp),a
 948                     ; 247   if (IOSwitchRegsiter == (uint8_t) 0x10)
 950  000d a110          	cp	a,#16
 951  000f 2631          	jrne	L373
 952                     ; 249     if (NewState != DISABLE)
 954  0011 7b04          	ld	a,(OFST+2,sp)
 955  0013 2716          	jreq	L573
 956                     ; 252       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 958  0015 7b02          	ld	a,(OFST+0,sp)
 959  0017 8dcc00cc      	callf	LC006
 960  001b 2704          	jreq	L43
 961  001d               L63:
 962  001d 48            	sll	a
 963  001e 5a            	decw	x
 964  001f 26fc          	jrne	L63
 965  0021               L43:
 966  0021 ca5439        	or	a,21561
 967  0024 c75439        	ld	21561,a
 969  0027 acc900c9      	jra	L104
 970  002b               L573:
 971                     ; 257       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 973  002b 7b02          	ld	a,(OFST+0,sp)
 974  002d 8dcc00cc      	callf	LC006
 975  0031 2704          	jreq	L04
 976  0033               L24:
 977  0033 48            	sll	a
 978  0034 5a            	decw	x
 979  0035 26fc          	jrne	L24
 980  0037               L04:
 981  0037 43            	cpl	a
 982  0038 c45439        	and	a,21561
 983  003b c75439        	ld	21561,a
 984  003e acc900c9      	jra	L104
 985  0042               L373:
 986                     ; 262   else if (IOSwitchRegsiter == (uint8_t) 0x20)
 988  0042 a120          	cp	a,#32
 989  0044 262d          	jrne	L304
 990                     ; 264     if (NewState != DISABLE)
 992  0046 7b04          	ld	a,(OFST+2,sp)
 993  0048 2714          	jreq	L504
 994                     ; 267       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 996  004a 7b02          	ld	a,(OFST+0,sp)
 997  004c 8dcc00cc      	callf	LC006
 998  0050 2704          	jreq	L44
 999  0052               L64:
1000  0052 48            	sll	a
1001  0053 5a            	decw	x
1002  0054 26fc          	jrne	L64
1003  0056               L44:
1004  0056 ca543a        	or	a,21562
1005  0059 c7543a        	ld	21562,a
1007  005c 206b          	jra	L104
1008  005e               L504:
1009                     ; 272       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1011  005e 7b02          	ld	a,(OFST+0,sp)
1012  0060 8dcc00cc      	callf	LC006
1013  0064 2704          	jreq	L05
1014  0066               L25:
1015  0066 48            	sll	a
1016  0067 5a            	decw	x
1017  0068 26fc          	jrne	L25
1018  006a               L05:
1019  006a 43            	cpl	a
1020  006b c4543a        	and	a,21562
1021  006e c7543a        	ld	21562,a
1022  0071 2056          	jra	L104
1023  0073               L304:
1024                     ; 277   else if (IOSwitchRegsiter == (uint8_t) 0x30)
1026  0073 a130          	cp	a,#48
1027  0075 262a          	jrne	L314
1028                     ; 279     if (NewState != DISABLE)
1030  0077 7b04          	ld	a,(OFST+2,sp)
1031  0079 2711          	jreq	L514
1032                     ; 282       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1034  007b 7b02          	ld	a,(OFST+0,sp)
1035  007d 8dcc00cc      	callf	LC006
1036  0081 2704          	jreq	L45
1037  0083               L65:
1038  0083 48            	sll	a
1039  0084 5a            	decw	x
1040  0085 26fc          	jrne	L65
1041  0087               L45:
1042  0087 ca543b        	or	a,21563
1044  008a 2010          	jpf	LC005
1045  008c               L514:
1046                     ; 287       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1048  008c 7b02          	ld	a,(OFST+0,sp)
1049  008e 8dcc00cc      	callf	LC006
1050  0092 2704          	jreq	L06
1051  0094               L26:
1052  0094 48            	sll	a
1053  0095 5a            	decw	x
1054  0096 26fc          	jrne	L26
1055  0098               L06:
1056  0098 43            	cpl	a
1057  0099 c4543b        	and	a,21563
1058  009c               LC005:
1059  009c c7543b        	ld	21563,a
1060  009f 2028          	jra	L104
1061  00a1               L314:
1062                     ; 294     if (NewState != DISABLE)
1064  00a1 7b04          	ld	a,(OFST+2,sp)
1065  00a3 2711          	jreq	L324
1066                     ; 297       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1068  00a5 7b02          	ld	a,(OFST+0,sp)
1069  00a7 8dcc00cc      	callf	LC006
1070  00ab 2704          	jreq	L46
1071  00ad               L66:
1072  00ad 48            	sll	a
1073  00ae 5a            	decw	x
1074  00af 26fc          	jrne	L66
1075  00b1               L46:
1076  00b1 ca5457        	or	a,21591
1078  00b4 2010          	jpf	LC004
1079  00b6               L324:
1080                     ; 302       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1082  00b6 7b02          	ld	a,(OFST+0,sp)
1083  00b8 8dcc00cc      	callf	LC006
1084  00bc 2704          	jreq	L07
1085  00be               L27:
1086  00be 48            	sll	a
1087  00bf 5a            	decw	x
1088  00c0 26fc          	jrne	L27
1089  00c2               L07:
1090  00c2 43            	cpl	a
1091  00c3 c45457        	and	a,21591
1092  00c6               LC004:
1093  00c6 c75457        	ld	21591,a
1094  00c9               L104:
1095                     ; 305 }
1098  00c9 5b04          	addw	sp,#4
1099  00cb 87            	retf	
1100  00cc               LC006:
1101  00cc 5f            	clrw	x
1102  00cd 97            	ld	xl,a
1103  00ce a601          	ld	a,#1
1104  00d0 5d            	tnzw	x
1105  00d1 87            	retf	
1184                     ; 317 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1184                     ; 318 {
1185                     .text:	section	.text,new
1186  0000               f_SYSCFG_RIResistorConfig:
1188  0000 89            	pushw	x
1189       00000000      OFST:	set	0
1192                     ; 320   assert_param(IS_RI_RESISTOR(RI_Resistor));
1194                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
1196                     ; 323   if (NewState != DISABLE)
1198  0001 9f            	ld	a,xl
1199  0002 4d            	tnz	a
1200  0003 2706          	jreq	L564
1201                     ; 326     RI->RCR |= (uint8_t) RI_Resistor;
1203  0005 9e            	ld	a,xh
1204  0006 ca543f        	or	a,21567
1206  0009 2006          	jra	L764
1207  000b               L564:
1208                     ; 331     RI->RCR &= (uint8_t) (~RI_Resistor);
1210  000b 7b01          	ld	a,(OFST+1,sp)
1211  000d 43            	cpl	a
1212  000e c4543f        	and	a,21567
1213  0011               L764:
1214  0011 c7543f        	ld	21567,a
1215                     ; 333 }
1218  0014 85            	popw	x
1219  0015 87            	retf	
1241                     ; 365 void SYSCFG_REMAPDeInit(void)
1241                     ; 366 {
1242                     .text:	section	.text,new
1243  0000               f_SYSCFG_REMAPDeInit:
1247                     ; 368   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1249  0000 350c509e      	mov	20638,#12
1250                     ; 371   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1252  0004 725f509f      	clr	20639
1253                     ; 374   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1255  0008 725f509d      	clr	20637
1256                     ; 375 }
1259  000c 87            	retf	
1474                     ; 408 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1474                     ; 409 {
1475                     .text:	section	.text,new
1476  0000               f_SYSCFG_REMAPPinConfig:
1478  0000 89            	pushw	x
1479  0001 88            	push	a
1480       00000001      OFST:	set	1
1483                     ; 410   uint8_t regindex = 0;
1485                     ; 412   assert_param(IS_REMAP_PIN(REMAP_Pin));
1487                     ; 413   assert_param(IS_FUNCTIONAL_STATE(NewState));
1489                     ; 416   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1491  0002 9e            	ld	a,xh
1492  0003 6b01          	ld	(OFST+0,sp),a
1493                     ; 419   if (regindex == 0x01)
1495  0005 a101          	cp	a,#1
1496  0007 261c          	jrne	L106
1497                     ; 421     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1499  0009 a610          	ld	a,#16
1500  000b 42            	mul	x,a
1501  000c 9f            	ld	a,xl
1502  000d aa0f          	or	a,#15
1503  000f c4509e        	and	a,20638
1504  0012 c7509e        	ld	20638,a
1505                     ; 422     if (NewState != DISABLE)
1507  0015 7b07          	ld	a,(OFST+6,sp)
1508  0017 273a          	jreq	L506
1509                     ; 424       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1511  0019 7b03          	ld	a,(OFST+2,sp)
1512  001b a4f0          	and	a,#240
1513  001d ca509e        	or	a,20638
1514  0020 c7509e        	ld	20638,a
1515  0023 202e          	jra	L506
1516  0025               L106:
1517                     ; 428   else if (regindex == 0x02)
1519  0025 a102          	cp	a,#2
1520  0027 2616          	jrne	L706
1521                     ; 430     if (NewState != DISABLE)
1523  0029 7b07          	ld	a,(OFST+6,sp)
1524  002b 2707          	jreq	L116
1525                     ; 432       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1527  002d c6509f        	ld	a,20639
1528  0030 1a03          	or	a,(OFST+2,sp)
1530  0032 2006          	jpf	LC008
1531  0034               L116:
1532                     ; 436       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1534  0034 7b03          	ld	a,(OFST+2,sp)
1535  0036 43            	cpl	a
1536  0037 c4509f        	and	a,20639
1537  003a               LC008:
1538  003a c7509f        	ld	20639,a
1539  003d 2014          	jra	L506
1540  003f               L706:
1541                     ; 442     if (NewState != DISABLE)
1543  003f 7b07          	ld	a,(OFST+6,sp)
1544  0041 2707          	jreq	L716
1545                     ; 444       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1547  0043 c6509d        	ld	a,20637
1548  0046 1a03          	or	a,(OFST+2,sp)
1550  0048 2006          	jpf	LC007
1551  004a               L716:
1552                     ; 448       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1554  004a 7b03          	ld	a,(OFST+2,sp)
1555  004c 43            	cpl	a
1556  004d c4509d        	and	a,20637
1557  0050               LC007:
1558  0050 c7509d        	ld	20637,a
1559  0053               L506:
1560                     ; 451 }
1563  0053 5b03          	addw	sp,#3
1564  0055 87            	retf	
1669                     ; 467 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1669                     ; 468 {
1670                     .text:	section	.text,new
1671  0000               f_SYSCFG_REMAPDMAChannelConfig:
1673  0000 88            	push	a
1674       00000000      OFST:	set	0
1677                     ; 470   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1679                     ; 473   if ((REMAP_DMAChannel & 0xF0) != RESET)
1681  0001 a5f0          	bcp	a,#240
1682  0003 2707          	jreq	L566
1683                     ; 476     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1685  0005 c6509e        	ld	a,20638
1686  0008 a4f3          	and	a,#243
1688  000a 2005          	jra	L766
1689  000c               L566:
1690                     ; 482     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1692  000c c6509e        	ld	a,20638
1693  000f a4fc          	and	a,#252
1694  0011               L766:
1695  0011 c7509e        	ld	20638,a
1696                     ; 485   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1698  0014 7b01          	ld	a,(OFST+1,sp)
1699  0016 a40f          	and	a,#15
1700  0018 ca509e        	or	a,20638
1701  001b c7509e        	ld	20638,a
1702                     ; 486 }
1705  001e 84            	pop	a
1706  001f 87            	retf	
1718                     	xdef	f_SYSCFG_REMAPDMAChannelConfig
1719                     	xdef	f_SYSCFG_REMAPPinConfig
1720                     	xdef	f_SYSCFG_REMAPDeInit
1721                     	xdef	f_SYSCFG_RIResistorConfig
1722                     	xdef	f_SYSCFG_RIIOSwitchConfig
1723                     	xdef	f_SYSCFG_RIAnalogSwitchConfig
1724                     	xdef	f_SYSCFG_RITIMInputCaptureConfig
1725                     	xdef	f_SYSCFG_RIDeInit
1744                     	end
