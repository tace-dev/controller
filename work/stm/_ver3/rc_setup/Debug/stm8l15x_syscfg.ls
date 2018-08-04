   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 116 void SYSCFG_RIDeInit(void)
  47                     ; 117 {
  49                     .text:	section	.text,new
  50  0000               _SYSCFG_RIDeInit:
  54                     ; 118   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  56  0000 725f5431      	clr	21553
  57                     ; 119   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  59  0004 725f5432      	clr	21554
  60                     ; 120   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  62  0008 725f5439      	clr	21561
  63                     ; 121   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  65  000c 725f543a      	clr	21562
  66                     ; 122   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  68  0010 725f543b      	clr	21563
  69                     ; 123   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  71  0014 725f5457      	clr	21591
  72                     ; 124   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  74  0018 725f543d      	clr	21565
  75                     ; 125   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  77  001c 725f543e      	clr	21566
  78                     ; 126   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  80  0020 725f543f      	clr	21567
  81                     ; 127 }
  84  0024 81            	ret
 343                     ; 139 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 343                     ; 140                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 343                     ; 141 {
 344                     .text:	section	.text,new
 345  0000               _SYSCFG_RITIMInputCaptureConfig:
 347  0000 89            	pushw	x
 348       00000000      OFST:	set	0
 351                     ; 143   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 353                     ; 144   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 355                     ; 147   if (RI_InputCapture == RI_InputCapture_IC2)
 357  0001 9e            	ld	a,xh
 358  0002 a102          	cp	a,#2
 359  0004 2606          	jrne	L531
 360                     ; 150     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 362  0006 9f            	ld	a,xl
 363  0007 c75431        	ld	21553,a
 365  000a 2005          	jra	L731
 366  000c               L531:
 367                     ; 156     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 369  000c 7b02          	ld	a,(OFST+2,sp)
 370  000e c75432        	ld	21554,a
 371  0011               L731:
 372                     ; 158 }
 375  0011 85            	popw	x
 376  0012 81            	ret
 554                     ; 181 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 554                     ; 182                                  FunctionalState NewState)
 554                     ; 183 {
 555                     .text:	section	.text,new
 556  0000               _SYSCFG_RIAnalogSwitchConfig:
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
 581  000d 0d04          	tnz	(OFST+2,sp)
 582  000f 2730          	jreq	L532
 583                     ; 198     if (AnalogSwitchRegister == (uint8_t) 0x10)
 585  0011 7b01          	ld	a,(OFST-1,sp)
 586  0013 a110          	cp	a,#16
 587  0015 2615          	jrne	L732
 588                     ; 201       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 590  0017 7b02          	ld	a,(OFST+0,sp)
 591  0019 5f            	clrw	x
 592  001a 97            	ld	xl,a
 593  001b a601          	ld	a,#1
 594  001d 5d            	tnzw	x
 595  001e 2704          	jreq	L21
 596  0020               L41:
 597  0020 48            	sll	a
 598  0021 5a            	decw	x
 599  0022 26fc          	jrne	L41
 600  0024               L21:
 601  0024 ca543d        	or	a,21565
 602  0027 c7543d        	ld	21565,a
 604  002a 2045          	jra	L342
 605  002c               L732:
 606                     ; 206       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 608  002c 7b02          	ld	a,(OFST+0,sp)
 609  002e 5f            	clrw	x
 610  002f 97            	ld	xl,a
 611  0030 a601          	ld	a,#1
 612  0032 5d            	tnzw	x
 613  0033 2704          	jreq	L61
 614  0035               L02:
 615  0035 48            	sll	a
 616  0036 5a            	decw	x
 617  0037 26fc          	jrne	L02
 618  0039               L61:
 619  0039 ca543e        	or	a,21566
 620  003c c7543e        	ld	21566,a
 621  003f 2030          	jra	L342
 622  0041               L532:
 623                     ; 211     if (AnalogSwitchRegister == (uint8_t) 0x10)
 625  0041 7b01          	ld	a,(OFST-1,sp)
 626  0043 a110          	cp	a,#16
 627  0045 2616          	jrne	L542
 628                     ; 214       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 630  0047 7b02          	ld	a,(OFST+0,sp)
 631  0049 5f            	clrw	x
 632  004a 97            	ld	xl,a
 633  004b a601          	ld	a,#1
 634  004d 5d            	tnzw	x
 635  004e 2704          	jreq	L22
 636  0050               L42:
 637  0050 48            	sll	a
 638  0051 5a            	decw	x
 639  0052 26fc          	jrne	L42
 640  0054               L22:
 641  0054 43            	cpl	a
 642  0055 c4543d        	and	a,21565
 643  0058 c7543d        	ld	21565,a
 645  005b 2014          	jra	L342
 646  005d               L542:
 647                     ; 219       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 649  005d 7b02          	ld	a,(OFST+0,sp)
 650  005f 5f            	clrw	x
 651  0060 97            	ld	xl,a
 652  0061 a601          	ld	a,#1
 653  0063 5d            	tnzw	x
 654  0064 2704          	jreq	L62
 655  0066               L03:
 656  0066 48            	sll	a
 657  0067 5a            	decw	x
 658  0068 26fc          	jrne	L03
 659  006a               L62:
 660  006a 43            	cpl	a
 661  006b c4543e        	and	a,21566
 662  006e c7543e        	ld	21566,a
 663  0071               L342:
 664                     ; 222 }
 667  0071 5b04          	addw	sp,#4
 668  0073 81            	ret
 930                     ; 231 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 930                     ; 232                              FunctionalState NewState)
 930                     ; 233 {
 931                     .text:	section	.text,new
 932  0000               _SYSCFG_RIIOSwitchConfig:
 934  0000 89            	pushw	x
 935  0001 89            	pushw	x
 936       00000002      OFST:	set	2
 939                     ; 234   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
 941                     ; 237   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 943                     ; 238   assert_param(IS_FUNCTIONAL_STATE(NewState));
 945                     ; 241   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 947  0002 9e            	ld	a,xh
 948  0003 a40f          	and	a,#15
 949  0005 6b02          	ld	(OFST+0,sp),a
 950                     ; 244   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 952  0007 7b03          	ld	a,(OFST+1,sp)
 953  0009 a4f0          	and	a,#240
 954  000b 6b01          	ld	(OFST-1,sp),a
 955                     ; 247   if (IOSwitchRegsiter == (uint8_t) 0x10)
 957  000d 7b01          	ld	a,(OFST-1,sp)
 958  000f a110          	cp	a,#16
 959  0011 2633          	jrne	L373
 960                     ; 249     if (NewState != DISABLE)
 962  0013 0d04          	tnz	(OFST+2,sp)
 963  0015 2717          	jreq	L573
 964                     ; 252       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 966  0017 7b02          	ld	a,(OFST+0,sp)
 967  0019 5f            	clrw	x
 968  001a 97            	ld	xl,a
 969  001b a601          	ld	a,#1
 970  001d 5d            	tnzw	x
 971  001e 2704          	jreq	L43
 972  0020               L63:
 973  0020 48            	sll	a
 974  0021 5a            	decw	x
 975  0022 26fc          	jrne	L63
 976  0024               L43:
 977  0024 ca5439        	or	a,21561
 978  0027 c75439        	ld	21561,a
 980  002a acdd00dd      	jpf	L104
 981  002e               L573:
 982                     ; 257       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 984  002e 7b02          	ld	a,(OFST+0,sp)
 985  0030 5f            	clrw	x
 986  0031 97            	ld	xl,a
 987  0032 a601          	ld	a,#1
 988  0034 5d            	tnzw	x
 989  0035 2704          	jreq	L04
 990  0037               L24:
 991  0037 48            	sll	a
 992  0038 5a            	decw	x
 993  0039 26fc          	jrne	L24
 994  003b               L04:
 995  003b 43            	cpl	a
 996  003c c45439        	and	a,21561
 997  003f c75439        	ld	21561,a
 998  0042 acdd00dd      	jpf	L104
 999  0046               L373:
1000                     ; 262   else if (IOSwitchRegsiter == (uint8_t) 0x20)
1002  0046 7b01          	ld	a,(OFST-1,sp)
1003  0048 a120          	cp	a,#32
1004  004a 262f          	jrne	L304
1005                     ; 264     if (NewState != DISABLE)
1007  004c 0d04          	tnz	(OFST+2,sp)
1008  004e 2715          	jreq	L504
1009                     ; 267       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1011  0050 7b02          	ld	a,(OFST+0,sp)
1012  0052 5f            	clrw	x
1013  0053 97            	ld	xl,a
1014  0054 a601          	ld	a,#1
1015  0056 5d            	tnzw	x
1016  0057 2704          	jreq	L44
1017  0059               L64:
1018  0059 48            	sll	a
1019  005a 5a            	decw	x
1020  005b 26fc          	jrne	L64
1021  005d               L44:
1022  005d ca543a        	or	a,21562
1023  0060 c7543a        	ld	21562,a
1025  0063 2078          	jra	L104
1026  0065               L504:
1027                     ; 272       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1029  0065 7b02          	ld	a,(OFST+0,sp)
1030  0067 5f            	clrw	x
1031  0068 97            	ld	xl,a
1032  0069 a601          	ld	a,#1
1033  006b 5d            	tnzw	x
1034  006c 2704          	jreq	L05
1035  006e               L25:
1036  006e 48            	sll	a
1037  006f 5a            	decw	x
1038  0070 26fc          	jrne	L25
1039  0072               L05:
1040  0072 43            	cpl	a
1041  0073 c4543a        	and	a,21562
1042  0076 c7543a        	ld	21562,a
1043  0079 2062          	jra	L104
1044  007b               L304:
1045                     ; 277   else if (IOSwitchRegsiter == (uint8_t) 0x30)
1047  007b 7b01          	ld	a,(OFST-1,sp)
1048  007d a130          	cp	a,#48
1049  007f 262f          	jrne	L314
1050                     ; 279     if (NewState != DISABLE)
1052  0081 0d04          	tnz	(OFST+2,sp)
1053  0083 2715          	jreq	L514
1054                     ; 282       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1056  0085 7b02          	ld	a,(OFST+0,sp)
1057  0087 5f            	clrw	x
1058  0088 97            	ld	xl,a
1059  0089 a601          	ld	a,#1
1060  008b 5d            	tnzw	x
1061  008c 2704          	jreq	L45
1062  008e               L65:
1063  008e 48            	sll	a
1064  008f 5a            	decw	x
1065  0090 26fc          	jrne	L65
1066  0092               L45:
1067  0092 ca543b        	or	a,21563
1068  0095 c7543b        	ld	21563,a
1070  0098 2043          	jra	L104
1071  009a               L514:
1072                     ; 287       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1074  009a 7b02          	ld	a,(OFST+0,sp)
1075  009c 5f            	clrw	x
1076  009d 97            	ld	xl,a
1077  009e a601          	ld	a,#1
1078  00a0 5d            	tnzw	x
1079  00a1 2704          	jreq	L06
1080  00a3               L26:
1081  00a3 48            	sll	a
1082  00a4 5a            	decw	x
1083  00a5 26fc          	jrne	L26
1084  00a7               L06:
1085  00a7 43            	cpl	a
1086  00a8 c4543b        	and	a,21563
1087  00ab c7543b        	ld	21563,a
1088  00ae 202d          	jra	L104
1089  00b0               L314:
1090                     ; 294     if (NewState != DISABLE)
1092  00b0 0d04          	tnz	(OFST+2,sp)
1093  00b2 2715          	jreq	L324
1094                     ; 297       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1096  00b4 7b02          	ld	a,(OFST+0,sp)
1097  00b6 5f            	clrw	x
1098  00b7 97            	ld	xl,a
1099  00b8 a601          	ld	a,#1
1100  00ba 5d            	tnzw	x
1101  00bb 2704          	jreq	L46
1102  00bd               L66:
1103  00bd 48            	sll	a
1104  00be 5a            	decw	x
1105  00bf 26fc          	jrne	L66
1106  00c1               L46:
1107  00c1 ca5457        	or	a,21591
1108  00c4 c75457        	ld	21591,a
1110  00c7 2014          	jra	L104
1111  00c9               L324:
1112                     ; 302       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1114  00c9 7b02          	ld	a,(OFST+0,sp)
1115  00cb 5f            	clrw	x
1116  00cc 97            	ld	xl,a
1117  00cd a601          	ld	a,#1
1118  00cf 5d            	tnzw	x
1119  00d0 2704          	jreq	L07
1120  00d2               L27:
1121  00d2 48            	sll	a
1122  00d3 5a            	decw	x
1123  00d4 26fc          	jrne	L27
1124  00d6               L07:
1125  00d6 43            	cpl	a
1126  00d7 c45457        	and	a,21591
1127  00da c75457        	ld	21591,a
1128  00dd               L104:
1129                     ; 305 }
1132  00dd 5b04          	addw	sp,#4
1133  00df 81            	ret
1213                     ; 317 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1213                     ; 318 {
1214                     .text:	section	.text,new
1215  0000               _SYSCFG_RIResistorConfig:
1217  0000 89            	pushw	x
1218       00000000      OFST:	set	0
1221                     ; 320   assert_param(IS_RI_RESISTOR(RI_Resistor));
1223                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
1225                     ; 323   if (NewState != DISABLE)
1227  0001 9f            	ld	a,xl
1228  0002 4d            	tnz	a
1229  0003 2709          	jreq	L564
1230                     ; 326     RI->RCR |= (uint8_t) RI_Resistor;
1232  0005 9e            	ld	a,xh
1233  0006 ca543f        	or	a,21567
1234  0009 c7543f        	ld	21567,a
1236  000c 2009          	jra	L764
1237  000e               L564:
1238                     ; 331     RI->RCR &= (uint8_t) (~RI_Resistor);
1240  000e 7b01          	ld	a,(OFST+1,sp)
1241  0010 43            	cpl	a
1242  0011 c4543f        	and	a,21567
1243  0014 c7543f        	ld	21567,a
1244  0017               L764:
1245                     ; 333 }
1248  0017 85            	popw	x
1249  0018 81            	ret
1272                     ; 365 void SYSCFG_REMAPDeInit(void)
1272                     ; 366 {
1273                     .text:	section	.text,new
1274  0000               _SYSCFG_REMAPDeInit:
1278                     ; 368   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1280  0000 350c509e      	mov	20638,#12
1281                     ; 371   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1283  0004 725f509f      	clr	20639
1284                     ; 374   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1286  0008 725f509d      	clr	20637
1287                     ; 375 }
1290  000c 81            	ret
1506                     ; 408 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1506                     ; 409 {
1507                     .text:	section	.text,new
1508  0000               _SYSCFG_REMAPPinConfig:
1510  0000 89            	pushw	x
1511  0001 88            	push	a
1512       00000001      OFST:	set	1
1515                     ; 410   uint8_t regindex = 0;
1517                     ; 412   assert_param(IS_REMAP_PIN(REMAP_Pin));
1519                     ; 413   assert_param(IS_FUNCTIONAL_STATE(NewState));
1521                     ; 416   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1523  0002 9e            	ld	a,xh
1524  0003 6b01          	ld	(OFST+0,sp),a
1525                     ; 419   if (regindex == 0x01)
1527  0005 7b01          	ld	a,(OFST+0,sp)
1528  0007 a101          	cp	a,#1
1529  0009 261e          	jrne	L106
1530                     ; 421     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1532  000b 9f            	ld	a,xl
1533  000c 97            	ld	xl,a
1534  000d a610          	ld	a,#16
1535  000f 42            	mul	x,a
1536  0010 9f            	ld	a,xl
1537  0011 aa0f          	or	a,#15
1538  0013 c4509e        	and	a,20638
1539  0016 c7509e        	ld	20638,a
1540                     ; 422     if (NewState != DISABLE)
1542  0019 0d06          	tnz	(OFST+5,sp)
1543  001b 2742          	jreq	L506
1544                     ; 424       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1546  001d 7b03          	ld	a,(OFST+2,sp)
1547  001f a4f0          	and	a,#240
1548  0021 ca509e        	or	a,20638
1549  0024 c7509e        	ld	20638,a
1550  0027 2036          	jra	L506
1551  0029               L106:
1552                     ; 428   else if (regindex == 0x02)
1554  0029 7b01          	ld	a,(OFST+0,sp)
1555  002b a102          	cp	a,#2
1556  002d 2619          	jrne	L706
1557                     ; 430     if (NewState != DISABLE)
1559  002f 0d06          	tnz	(OFST+5,sp)
1560  0031 270a          	jreq	L116
1561                     ; 432       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1563  0033 c6509f        	ld	a,20639
1564  0036 1a03          	or	a,(OFST+2,sp)
1565  0038 c7509f        	ld	20639,a
1567  003b 2022          	jra	L506
1568  003d               L116:
1569                     ; 436       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1571  003d 7b03          	ld	a,(OFST+2,sp)
1572  003f 43            	cpl	a
1573  0040 c4509f        	and	a,20639
1574  0043 c7509f        	ld	20639,a
1575  0046 2017          	jra	L506
1576  0048               L706:
1577                     ; 442     if (NewState != DISABLE)
1579  0048 0d06          	tnz	(OFST+5,sp)
1580  004a 270a          	jreq	L716
1581                     ; 444       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1583  004c c6509d        	ld	a,20637
1584  004f 1a03          	or	a,(OFST+2,sp)
1585  0051 c7509d        	ld	20637,a
1587  0054 2009          	jra	L506
1588  0056               L716:
1589                     ; 448       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1591  0056 7b03          	ld	a,(OFST+2,sp)
1592  0058 43            	cpl	a
1593  0059 c4509d        	and	a,20637
1594  005c c7509d        	ld	20637,a
1595  005f               L506:
1596                     ; 451 }
1599  005f 5b03          	addw	sp,#3
1600  0061 81            	ret
1706                     ; 467 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1706                     ; 468 {
1707                     .text:	section	.text,new
1708  0000               _SYSCFG_REMAPDMAChannelConfig:
1710  0000 88            	push	a
1711       00000000      OFST:	set	0
1714                     ; 470   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1716                     ; 473   if ((REMAP_DMAChannel & 0xF0) != RESET)
1718  0001 a5f0          	bcp	a,#240
1719  0003 270a          	jreq	L566
1720                     ; 476     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1722  0005 c6509e        	ld	a,20638
1723  0008 a4f3          	and	a,#243
1724  000a c7509e        	ld	20638,a
1726  000d 2008          	jra	L766
1727  000f               L566:
1728                     ; 482     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1730  000f c6509e        	ld	a,20638
1731  0012 a4fc          	and	a,#252
1732  0014 c7509e        	ld	20638,a
1733  0017               L766:
1734                     ; 485   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1736  0017 7b01          	ld	a,(OFST+1,sp)
1737  0019 a40f          	and	a,#15
1738  001b ca509e        	or	a,20638
1739  001e c7509e        	ld	20638,a
1740                     ; 486 }
1743  0021 84            	pop	a
1744  0022 81            	ret
1757                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1758                     	xdef	_SYSCFG_REMAPPinConfig
1759                     	xdef	_SYSCFG_REMAPDeInit
1760                     	xdef	_SYSCFG_RIResistorConfig
1761                     	xdef	_SYSCFG_RIIOSwitchConfig
1762                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1763                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1764                     	xdef	_SYSCFG_RIDeInit
1783                     	end
