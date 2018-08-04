   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 116 void SYSCFG_RIDeInit(void)
  49                     ; 117 {
  51                     	switch	.text
  52  0000               _SYSCFG_RIDeInit:
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
  86  0024 81            	ret	
 345                     ; 139 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 345                     ; 140                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 345                     ; 141 {
 346                     	switch	.text
 347  0025               _SYSCFG_RITIMInputCaptureConfig:
 349  0025 89            	pushw	x
 350       00000000      OFST:	set	0
 353                     ; 143   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 355                     ; 144   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 357                     ; 147   if (RI_InputCapture == RI_InputCapture_IC2)
 359  0026 9e            	ld	a,xh
 360  0027 a102          	cp	a,#2
 361  0029 2606          	jrne	L531
 362                     ; 150     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 364  002b 9f            	ld	a,xl
 365  002c c75431        	ld	21553,a
 367  002f 2005          	jra	L731
 368  0031               L531:
 369                     ; 156     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 371  0031 7b02          	ld	a,(OFST+2,sp)
 372  0033 c75432        	ld	21554,a
 373  0036               L731:
 374                     ; 158 }
 377  0036 85            	popw	x
 378  0037 81            	ret	
 556                     ; 181 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 556                     ; 182                                  FunctionalState NewState)
 556                     ; 183 {
 557                     	switch	.text
 558  0038               _SYSCFG_RIAnalogSwitchConfig:
 560  0038 89            	pushw	x
 561  0039 89            	pushw	x
 562       00000002      OFST:	set	2
 565                     ; 184   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 567                     ; 187   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 569                     ; 188   assert_param(IS_FUNCTIONAL_STATE(NewState));
 571                     ; 191   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 573  003a 9e            	ld	a,xh
 574  003b a4f0          	and	a,#240
 575  003d 6b01          	ld	(OFST-1,sp),a
 576                     ; 194   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 578  003f 7b03          	ld	a,(OFST+1,sp)
 579  0041 a40f          	and	a,#15
 580  0043 6b02          	ld	(OFST+0,sp),a
 581                     ; 196   if (NewState != DISABLE)
 583  0045 7b04          	ld	a,(OFST+2,sp)
 584  0047 2724          	jreq	L532
 585                     ; 198     if (AnalogSwitchRegister == (uint8_t) 0x10)
 587  0049 7b01          	ld	a,(OFST-1,sp)
 588  004b a110          	cp	a,#16
 589  004d 260f          	jrne	L732
 590                     ; 201       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 592  004f 7b02          	ld	a,(OFST+0,sp)
 593  0051 ad47          	call	LC003
 594  0053 2704          	jreq	L21
 595  0055               L41:
 596  0055 48            	sll	a
 597  0056 5a            	decw	x
 598  0057 26fc          	jrne	L41
 599  0059               L21:
 600  0059 ca543d        	or	a,21565
 602  005c 2023          	jp	LC002
 603  005e               L732:
 604                     ; 206       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 606  005e 7b02          	ld	a,(OFST+0,sp)
 607  0060 ad38          	call	LC003
 608  0062 2704          	jreq	L61
 609  0064               L02:
 610  0064 48            	sll	a
 611  0065 5a            	decw	x
 612  0066 26fc          	jrne	L02
 613  0068               L61:
 614  0068 ca543e        	or	a,21566
 615  006b 2027          	jp	LC001
 616  006d               L532:
 617                     ; 211     if (AnalogSwitchRegister == (uint8_t) 0x10)
 619  006d 7b01          	ld	a,(OFST-1,sp)
 620  006f a110          	cp	a,#16
 621  0071 2613          	jrne	L542
 622                     ; 214       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 624  0073 7b02          	ld	a,(OFST+0,sp)
 625  0075 ad23          	call	LC003
 626  0077 2704          	jreq	L22
 627  0079               L42:
 628  0079 48            	sll	a
 629  007a 5a            	decw	x
 630  007b 26fc          	jrne	L42
 631  007d               L22:
 632  007d 43            	cpl	a
 633  007e c4543d        	and	a,21565
 634  0081               LC002:
 635  0081 c7543d        	ld	21565,a
 637  0084 2011          	jra	L342
 638  0086               L542:
 639                     ; 219       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 641  0086 7b02          	ld	a,(OFST+0,sp)
 642  0088 ad10          	call	LC003
 643  008a 2704          	jreq	L62
 644  008c               L03:
 645  008c 48            	sll	a
 646  008d 5a            	decw	x
 647  008e 26fc          	jrne	L03
 648  0090               L62:
 649  0090 43            	cpl	a
 650  0091 c4543e        	and	a,21566
 651  0094               LC001:
 652  0094 c7543e        	ld	21566,a
 653  0097               L342:
 654                     ; 222 }
 657  0097 5b04          	addw	sp,#4
 658  0099 81            	ret	
 659  009a               LC003:
 660  009a 5f            	clrw	x
 661  009b 97            	ld	xl,a
 662  009c a601          	ld	a,#1
 663  009e 5d            	tnzw	x
 664  009f 81            	ret	
 926                     ; 231 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 926                     ; 232                              FunctionalState NewState)
 926                     ; 233 {
 927                     	switch	.text
 928  00a0               _SYSCFG_RIIOSwitchConfig:
 930  00a0 89            	pushw	x
 931  00a1 89            	pushw	x
 932       00000002      OFST:	set	2
 935                     ; 234   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
 937                     ; 237   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 939                     ; 238   assert_param(IS_FUNCTIONAL_STATE(NewState));
 941                     ; 241   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 943  00a2 9e            	ld	a,xh
 944  00a3 a40f          	and	a,#15
 945  00a5 6b02          	ld	(OFST+0,sp),a
 946                     ; 244   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 948  00a7 7b03          	ld	a,(OFST+1,sp)
 949  00a9 a4f0          	and	a,#240
 950  00ab 6b01          	ld	(OFST-1,sp),a
 951                     ; 247   if (IOSwitchRegsiter == (uint8_t) 0x10)
 953  00ad a110          	cp	a,#16
 954  00af 262c          	jrne	L373
 955                     ; 249     if (NewState != DISABLE)
 957  00b1 7b04          	ld	a,(OFST+2,sp)
 958  00b3 2714          	jreq	L573
 959                     ; 252       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 961  00b5 7b02          	ld	a,(OFST+0,sp)
 962  00b7 cd015b        	call	LC006
 963  00ba 2704          	jreq	L43
 964  00bc               L63:
 965  00bc 48            	sll	a
 966  00bd 5a            	decw	x
 967  00be 26fc          	jrne	L63
 968  00c0               L43:
 969  00c0 ca5439        	or	a,21561
 970  00c3 c75439        	ld	21561,a
 972  00c6 cc0158        	jra	L104
 973  00c9               L573:
 974                     ; 257       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 976  00c9 7b02          	ld	a,(OFST+0,sp)
 977  00cb cd015b        	call	LC006
 978  00ce 2704          	jreq	L04
 979  00d0               L24:
 980  00d0 48            	sll	a
 981  00d1 5a            	decw	x
 982  00d2 26fc          	jrne	L24
 983  00d4               L04:
 984  00d4 43            	cpl	a
 985  00d5 c45439        	and	a,21561
 986  00d8 c75439        	ld	21561,a
 987  00db 207b          	jra	L104
 988  00dd               L373:
 989                     ; 262   else if (IOSwitchRegsiter == (uint8_t) 0x20)
 991  00dd a120          	cp	a,#32
 992  00df 2629          	jrne	L304
 993                     ; 264     if (NewState != DISABLE)
 995  00e1 7b04          	ld	a,(OFST+2,sp)
 996  00e3 2712          	jreq	L504
 997                     ; 267       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 999  00e5 7b02          	ld	a,(OFST+0,sp)
1000  00e7 ad72          	call	LC006
1001  00e9 2704          	jreq	L44
1002  00eb               L64:
1003  00eb 48            	sll	a
1004  00ec 5a            	decw	x
1005  00ed 26fc          	jrne	L64
1006  00ef               L44:
1007  00ef ca543a        	or	a,21562
1008  00f2 c7543a        	ld	21562,a
1010  00f5 2061          	jra	L104
1011  00f7               L504:
1012                     ; 272       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1014  00f7 7b02          	ld	a,(OFST+0,sp)
1015  00f9 ad60          	call	LC006
1016  00fb 2704          	jreq	L05
1017  00fd               L25:
1018  00fd 48            	sll	a
1019  00fe 5a            	decw	x
1020  00ff 26fc          	jrne	L25
1021  0101               L05:
1022  0101 43            	cpl	a
1023  0102 c4543a        	and	a,21562
1024  0105 c7543a        	ld	21562,a
1025  0108 204e          	jra	L104
1026  010a               L304:
1027                     ; 277   else if (IOSwitchRegsiter == (uint8_t) 0x30)
1029  010a a130          	cp	a,#48
1030  010c 2626          	jrne	L314
1031                     ; 279     if (NewState != DISABLE)
1033  010e 7b04          	ld	a,(OFST+2,sp)
1034  0110 270f          	jreq	L514
1035                     ; 282       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1037  0112 7b02          	ld	a,(OFST+0,sp)
1038  0114 ad45          	call	LC006
1039  0116 2704          	jreq	L45
1040  0118               L65:
1041  0118 48            	sll	a
1042  0119 5a            	decw	x
1043  011a 26fc          	jrne	L65
1044  011c               L45:
1045  011c ca543b        	or	a,21563
1047  011f 200e          	jp	LC005
1048  0121               L514:
1049                     ; 287       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1051  0121 7b02          	ld	a,(OFST+0,sp)
1052  0123 ad36          	call	LC006
1053  0125 2704          	jreq	L06
1054  0127               L26:
1055  0127 48            	sll	a
1056  0128 5a            	decw	x
1057  0129 26fc          	jrne	L26
1058  012b               L06:
1059  012b 43            	cpl	a
1060  012c c4543b        	and	a,21563
1061  012f               LC005:
1062  012f c7543b        	ld	21563,a
1063  0132 2024          	jra	L104
1064  0134               L314:
1065                     ; 294     if (NewState != DISABLE)
1067  0134 7b04          	ld	a,(OFST+2,sp)
1068  0136 270f          	jreq	L324
1069                     ; 297       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1071  0138 7b02          	ld	a,(OFST+0,sp)
1072  013a ad1f          	call	LC006
1073  013c 2704          	jreq	L46
1074  013e               L66:
1075  013e 48            	sll	a
1076  013f 5a            	decw	x
1077  0140 26fc          	jrne	L66
1078  0142               L46:
1079  0142 ca5457        	or	a,21591
1081  0145 200e          	jp	LC004
1082  0147               L324:
1083                     ; 302       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1085  0147 7b02          	ld	a,(OFST+0,sp)
1086  0149 ad10          	call	LC006
1087  014b 2704          	jreq	L07
1088  014d               L27:
1089  014d 48            	sll	a
1090  014e 5a            	decw	x
1091  014f 26fc          	jrne	L27
1092  0151               L07:
1093  0151 43            	cpl	a
1094  0152 c45457        	and	a,21591
1095  0155               LC004:
1096  0155 c75457        	ld	21591,a
1097  0158               L104:
1098                     ; 305 }
1101  0158 5b04          	addw	sp,#4
1102  015a 81            	ret	
1103  015b               LC006:
1104  015b 5f            	clrw	x
1105  015c 97            	ld	xl,a
1106  015d a601          	ld	a,#1
1107  015f 5d            	tnzw	x
1108  0160 81            	ret	
1188                     ; 317 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1188                     ; 318 {
1189                     	switch	.text
1190  0161               _SYSCFG_RIResistorConfig:
1192  0161 89            	pushw	x
1193       00000000      OFST:	set	0
1196                     ; 320   assert_param(IS_RI_RESISTOR(RI_Resistor));
1198                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
1200                     ; 323   if (NewState != DISABLE)
1202  0162 9f            	ld	a,xl
1203  0163 4d            	tnz	a
1204  0164 2706          	jreq	L564
1205                     ; 326     RI->RCR |= (uint8_t) RI_Resistor;
1207  0166 9e            	ld	a,xh
1208  0167 ca543f        	or	a,21567
1210  016a 2006          	jra	L764
1211  016c               L564:
1212                     ; 331     RI->RCR &= (uint8_t) (~RI_Resistor);
1214  016c 7b01          	ld	a,(OFST+1,sp)
1215  016e 43            	cpl	a
1216  016f c4543f        	and	a,21567
1217  0172               L764:
1218  0172 c7543f        	ld	21567,a
1219                     ; 333 }
1222  0175 85            	popw	x
1223  0176 81            	ret	
1246                     ; 365 void SYSCFG_REMAPDeInit(void)
1246                     ; 366 {
1247                     	switch	.text
1248  0177               _SYSCFG_REMAPDeInit:
1252                     ; 368   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1254  0177 350c509e      	mov	20638,#12
1255                     ; 371   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1257  017b 725f509f      	clr	20639
1258                     ; 374   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1260  017f 725f509d      	clr	20637
1261                     ; 375 }
1264  0183 81            	ret	
1480                     ; 408 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1480                     ; 409 {
1481                     	switch	.text
1482  0184               _SYSCFG_REMAPPinConfig:
1484  0184 89            	pushw	x
1485  0185 88            	push	a
1486       00000001      OFST:	set	1
1489                     ; 410   uint8_t regindex = 0;
1491                     ; 412   assert_param(IS_REMAP_PIN(REMAP_Pin));
1493                     ; 413   assert_param(IS_FUNCTIONAL_STATE(NewState));
1495                     ; 416   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1497  0186 9e            	ld	a,xh
1498  0187 6b01          	ld	(OFST+0,sp),a
1499                     ; 419   if (regindex == 0x01)
1501  0189 a101          	cp	a,#1
1502  018b 261c          	jrne	L106
1503                     ; 421     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1505  018d a610          	ld	a,#16
1506  018f 42            	mul	x,a
1507  0190 9f            	ld	a,xl
1508  0191 aa0f          	or	a,#15
1509  0193 c4509e        	and	a,20638
1510  0196 c7509e        	ld	20638,a
1511                     ; 422     if (NewState != DISABLE)
1513  0199 7b06          	ld	a,(OFST+5,sp)
1514  019b 273a          	jreq	L506
1515                     ; 424       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1517  019d 7b03          	ld	a,(OFST+2,sp)
1518  019f a4f0          	and	a,#240
1519  01a1 ca509e        	or	a,20638
1520  01a4 c7509e        	ld	20638,a
1521  01a7 202e          	jra	L506
1522  01a9               L106:
1523                     ; 428   else if (regindex == 0x02)
1525  01a9 a102          	cp	a,#2
1526  01ab 2616          	jrne	L706
1527                     ; 430     if (NewState != DISABLE)
1529  01ad 7b06          	ld	a,(OFST+5,sp)
1530  01af 2707          	jreq	L116
1531                     ; 432       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1533  01b1 c6509f        	ld	a,20639
1534  01b4 1a03          	or	a,(OFST+2,sp)
1536  01b6 2006          	jp	LC008
1537  01b8               L116:
1538                     ; 436       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1540  01b8 7b03          	ld	a,(OFST+2,sp)
1541  01ba 43            	cpl	a
1542  01bb c4509f        	and	a,20639
1543  01be               LC008:
1544  01be c7509f        	ld	20639,a
1545  01c1 2014          	jra	L506
1546  01c3               L706:
1547                     ; 442     if (NewState != DISABLE)
1549  01c3 7b06          	ld	a,(OFST+5,sp)
1550  01c5 2707          	jreq	L716
1551                     ; 444       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1553  01c7 c6509d        	ld	a,20637
1554  01ca 1a03          	or	a,(OFST+2,sp)
1556  01cc 2006          	jp	LC007
1557  01ce               L716:
1558                     ; 448       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1560  01ce 7b03          	ld	a,(OFST+2,sp)
1561  01d0 43            	cpl	a
1562  01d1 c4509d        	and	a,20637
1563  01d4               LC007:
1564  01d4 c7509d        	ld	20637,a
1565  01d7               L506:
1566                     ; 451 }
1569  01d7 5b03          	addw	sp,#3
1570  01d9 81            	ret	
1676                     ; 467 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1676                     ; 468 {
1677                     	switch	.text
1678  01da               _SYSCFG_REMAPDMAChannelConfig:
1680  01da 88            	push	a
1681       00000000      OFST:	set	0
1684                     ; 470   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1686                     ; 473   if ((REMAP_DMAChannel & 0xF0) != RESET)
1688  01db a5f0          	bcp	a,#240
1689  01dd 2707          	jreq	L566
1690                     ; 476     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1692  01df c6509e        	ld	a,20638
1693  01e2 a4f3          	and	a,#243
1695  01e4 2005          	jra	L766
1696  01e6               L566:
1697                     ; 482     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1699  01e6 c6509e        	ld	a,20638
1700  01e9 a4fc          	and	a,#252
1701  01eb               L766:
1702  01eb c7509e        	ld	20638,a
1703                     ; 485   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1705  01ee 7b01          	ld	a,(OFST+1,sp)
1706  01f0 a40f          	and	a,#15
1707  01f2 ca509e        	or	a,20638
1708  01f5 c7509e        	ld	20638,a
1709                     ; 486 }
1712  01f8 84            	pop	a
1713  01f9 81            	ret	
1726                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1727                     	xdef	_SYSCFG_REMAPPinConfig
1728                     	xdef	_SYSCFG_REMAPDeInit
1729                     	xdef	_SYSCFG_RIResistorConfig
1730                     	xdef	_SYSCFG_RIIOSwitchConfig
1731                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1732                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1733                     	xdef	_SYSCFG_RIDeInit
1752                     	end
