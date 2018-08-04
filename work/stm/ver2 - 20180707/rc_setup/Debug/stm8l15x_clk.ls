   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  19                     .const:	section	.text
  20  0000               _SYSDivFactor:
  21  0000 01            	dc.b	1
  22  0001 02            	dc.b	2
  23  0002 04            	dc.b	4
  24  0003 08            	dc.b	8
  25  0004 10            	dc.b	16
  54                     ; 117 void CLK_DeInit(void)
  54                     ; 118 {
  56                     .text:	section	.text,new
  57  0000               _CLK_DeInit:
  61                     ; 119   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  63  0000 351150c2      	mov	20674,#17
  64                     ; 120   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  66  0004 725f50c6      	clr	20678
  67                     ; 121   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  69  0008 725f50c1      	clr	20673
  70                     ; 122   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  72  000c 725f50cb      	clr	20683
  73                     ; 123   CLK->SWR  = CLK_SWR_RESET_VALUE;
  75  0010 350150c8      	mov	20680,#1
  76                     ; 124   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  78  0014 725f50c9      	clr	20681
  79                     ; 125   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  81  0018 350350c0      	mov	20672,#3
  82                     ; 126   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  84  001c 725f50c3      	clr	20675
  85                     ; 127   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  87  0020 358050c4      	mov	20676,#128
  88                     ; 128   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  90  0024 725f50d0      	clr	20688
  91                     ; 129   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  93  0028 725f50ca      	clr	20682
  94                     ; 130   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  96  002c 725f50c5      	clr	20677
  97                     ; 131   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  99  0030 725f50cd      	clr	20685
 100                     ; 132   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
 102  0034 725f50cc      	clr	20684
 103                     ; 133   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 105  0038 725f50ce      	clr	20686
 106                     ; 134   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 108  003c 35b950cf      	mov	20687,#185
 109                     ; 135 }
 112  0040 81            	ret
 167                     ; 157 void CLK_HSICmd(FunctionalState NewState)
 167                     ; 158 {
 168                     .text:	section	.text,new
 169  0000               _CLK_HSICmd:
 173                     ; 160   assert_param(IS_FUNCTIONAL_STATE(NewState));
 175                     ; 162   if (NewState != DISABLE)
 177  0000 4d            	tnz	a
 178  0001 2706          	jreq	L74
 179                     ; 165     CLK->ICKCR |= CLK_ICKCR_HSION;
 181  0003 721050c2      	bset	20674,#0
 183  0007 2004          	jra	L15
 184  0009               L74:
 185                     ; 170     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 187  0009 721150c2      	bres	20674,#0
 188  000d               L15:
 189                     ; 172 }
 192  000d 81            	ret
 226                     ; 185 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 226                     ; 186 {
 227                     .text:	section	.text,new
 228  0000               _CLK_AdjustHSICalibrationValue:
 232                     ; 188   CLK->HSIUNLCKR = 0xAC;
 234  0000 35ac50ce      	mov	20686,#172
 235                     ; 189   CLK->HSIUNLCKR = 0x35;
 237  0004 353550ce      	mov	20686,#53
 238                     ; 192   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 240  0008 c750cd        	ld	20685,a
 241                     ; 193 }
 244  000b 81            	ret
 279                     ; 209 void CLK_LSICmd(FunctionalState NewState)
 279                     ; 210 {
 280                     .text:	section	.text,new
 281  0000               _CLK_LSICmd:
 285                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 287                     ; 215   if (NewState != DISABLE)
 289  0000 4d            	tnz	a
 290  0001 2706          	jreq	L501
 291                     ; 218     CLK->ICKCR |= CLK_ICKCR_LSION;
 293  0003 721450c2      	bset	20674,#2
 295  0007 2004          	jra	L701
 296  0009               L501:
 297                     ; 223     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 299  0009 721550c2      	bres	20674,#2
 300  000d               L701:
 301                     ; 225 }
 304  000d 81            	ret
 366                     ; 246 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 366                     ; 247 {
 367                     .text:	section	.text,new
 368  0000               _CLK_HSEConfig:
 372                     ; 249   assert_param(IS_CLK_HSE(CLK_HSE));
 374                     ; 253   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 376  0000 721150c6      	bres	20678,#0
 377                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 379  0004 721950c6      	bres	20678,#4
 380                     ; 259   CLK->ECKCR |= (uint8_t)CLK_HSE;
 382  0008 ca50c6        	or	a,20678
 383  000b c750c6        	ld	20678,a
 384                     ; 260 }
 387  000e 81            	ret
 449                     ; 277 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 449                     ; 278 {
 450                     .text:	section	.text,new
 451  0000               _CLK_LSEConfig:
 455                     ; 280   assert_param(IS_CLK_LSE(CLK_LSE));
 457                     ; 284   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 459  0000 721550c6      	bres	20678,#2
 460                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 462  0004 721b50c6      	bres	20678,#5
 463                     ; 290   CLK->ECKCR |= (uint8_t)CLK_LSE;
 465  0008 ca50c6        	or	a,20678
 466  000b c750c6        	ld	20678,a
 467                     ; 292 }
 470  000e 81            	ret
 494                     ; 303 void CLK_ClockSecuritySystemEnable(void)
 494                     ; 304 {
 495                     .text:	section	.text,new
 496  0000               _CLK_ClockSecuritySystemEnable:
 500                     ; 306   CLK->CSSR |= CLK_CSSR_CSSEN;
 502  0000 721050ca      	bset	20682,#0
 503                     ; 307 }
 506  0004 81            	ret
 542                     ; 314 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 542                     ; 315 {
 543                     .text:	section	.text,new
 544  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 548                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 550                     ; 319   if (NewState != DISABLE)
 552  0000 4d            	tnz	a
 553  0001 2706          	jreq	L712
 554                     ; 322     CLK->CSSR |= CLK_CSSR_CSSDGON;
 556  0003 721850ca      	bset	20682,#4
 558  0007 2004          	jra	L122
 559  0009               L712:
 560                     ; 327     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 562  0009 721950ca      	bres	20682,#4
 563  000d               L122:
 564                     ; 329 }
 567  000d 81            	ret
 708                     ; 353 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 708                     ; 354 {
 709                     .text:	section	.text,new
 710  0000               _CLK_CCOConfig:
 712  0000 89            	pushw	x
 713       00000000      OFST:	set	0
 716                     ; 356   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 718                     ; 357   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 720                     ; 360   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 722  0001 9f            	ld	a,xl
 723  0002 1a01          	or	a,(OFST+1,sp)
 724  0004 c750c5        	ld	20677,a
 725                     ; 361 }
 728  0007 85            	popw	x
 729  0008 81            	ret
 803                     ; 413 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 803                     ; 414 {
 804                     .text:	section	.text,new
 805  0000               _CLK_SYSCLKSourceConfig:
 809                     ; 416   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 811                     ; 419   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 813  0000 c750c8        	ld	20680,a
 814                     ; 420 }
 817  0003 81            	ret
 842                     ; 432 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 842                     ; 433 {
 843                     .text:	section	.text,new
 844  0000               _CLK_GetSYSCLKSource:
 848                     ; 434   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 850  0000 c650c7        	ld	a,20679
 853  0003 81            	ret
 917                     ; 475 uint32_t CLK_GetClockFreq(void)
 917                     ; 476 {
 918                     .text:	section	.text,new
 919  0000               _CLK_GetClockFreq:
 921  0000 5209          	subw	sp,#9
 922       00000009      OFST:	set	9
 925                     ; 477   uint32_t clockfrequency = 0;
 927                     ; 478   uint32_t sourcefrequency = 0;
 929  0002 ae0000        	ldw	x,#0
 930  0005 1f07          	ldw	(OFST-2,sp),x
 931  0007 ae0000        	ldw	x,#0
 932  000a 1f05          	ldw	(OFST-4,sp),x
 933                     ; 479   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 935                     ; 480   uint8_t tmp = 0, presc = 0;
 939                     ; 483   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 941  000c c650c7        	ld	a,20679
 942  000f 6b09          	ld	(OFST+0,sp),a
 943                     ; 485   if ( clocksource == CLK_SYSCLKSource_HSI)
 945  0011 7b09          	ld	a,(OFST+0,sp)
 946  0013 a101          	cp	a,#1
 947  0015 260c          	jrne	L573
 948                     ; 487     sourcefrequency = HSI_VALUE;
 950  0017 ae2400        	ldw	x,#9216
 951  001a 1f07          	ldw	(OFST-2,sp),x
 952  001c ae00f4        	ldw	x,#244
 953  001f 1f05          	ldw	(OFST-4,sp),x
 955  0021 2022          	jra	L773
 956  0023               L573:
 957                     ; 489   else if ( clocksource == CLK_SYSCLKSource_LSI)
 959  0023 7b09          	ld	a,(OFST+0,sp)
 960  0025 a102          	cp	a,#2
 961  0027 260c          	jrne	L104
 962                     ; 491     sourcefrequency = LSI_VALUE;
 964  0029 ae9470        	ldw	x,#38000
 965  002c 1f07          	ldw	(OFST-2,sp),x
 966  002e ae0000        	ldw	x,#0
 967  0031 1f05          	ldw	(OFST-4,sp),x
 969  0033 2010          	jra	L773
 970  0035               L104:
 971                     ; 493   else if ( clocksource == CLK_SYSCLKSource_HSE)
 973  0035 7b09          	ld	a,(OFST+0,sp)
 974  0037 a104          	cp	a,#4
 975  0039 260a          	jrne	L504
 976                     ; 495     sourcefrequency = HSE_VALUE;
 978  003b ae2400        	ldw	x,#9216
 979  003e 1f07          	ldw	(OFST-2,sp),x
 980  0040 ae00f4        	ldw	x,#244
 981  0043 1f05          	ldw	(OFST-4,sp),x
 983  0045               L504:
 984                     ; 499     clockfrequency = LSE_VALUE;
 986  0045               L773:
 987                     ; 503   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 989  0045 c650c0        	ld	a,20672
 990  0048 a407          	and	a,#7
 991  004a 6b09          	ld	(OFST+0,sp),a
 992                     ; 504   presc = SYSDivFactor[tmp];
 994  004c 7b09          	ld	a,(OFST+0,sp)
 995  004e 5f            	clrw	x
 996  004f 97            	ld	xl,a
 997  0050 d60000        	ld	a,(_SYSDivFactor,x)
 998  0053 6b09          	ld	(OFST+0,sp),a
 999                     ; 507   clockfrequency = sourcefrequency / presc;
1001  0055 7b09          	ld	a,(OFST+0,sp)
1002  0057 b703          	ld	c_lreg+3,a
1003  0059 3f02          	clr	c_lreg+2
1004  005b 3f01          	clr	c_lreg+1
1005  005d 3f00          	clr	c_lreg
1006  005f 96            	ldw	x,sp
1007  0060 1c0001        	addw	x,#OFST-8
1008  0063 cd0000        	call	c_rtol
1010  0066 96            	ldw	x,sp
1011  0067 1c0005        	addw	x,#OFST-4
1012  006a cd0000        	call	c_ltor
1014  006d 96            	ldw	x,sp
1015  006e 1c0001        	addw	x,#OFST-8
1016  0071 cd0000        	call	c_ludv
1018  0074 96            	ldw	x,sp
1019  0075 1c0005        	addw	x,#OFST-4
1020  0078 cd0000        	call	c_rtol
1022                     ; 509   return((uint32_t)clockfrequency);
1024  007b 96            	ldw	x,sp
1025  007c 1c0005        	addw	x,#OFST-4
1026  007f cd0000        	call	c_ltor
1030  0082 5b09          	addw	sp,#9
1031  0084 81            	ret
1129                     ; 525 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1129                     ; 526 {
1130                     .text:	section	.text,new
1131  0000               _CLK_SYSCLKDivConfig:
1135                     ; 528   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1137                     ; 530   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1139  0000 c750c0        	ld	20672,a
1140                     ; 531 }
1143  0003 81            	ret
1179                     ; 538 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1179                     ; 539 {
1180                     .text:	section	.text,new
1181  0000               _CLK_SYSCLKSourceSwitchCmd:
1185                     ; 541   assert_param(IS_FUNCTIONAL_STATE(NewState));
1187                     ; 543   if (NewState != DISABLE)
1189  0000 4d            	tnz	a
1190  0001 2706          	jreq	L174
1191                     ; 546     CLK->SWCR |= CLK_SWCR_SWEN;
1193  0003 721250c9      	bset	20681,#1
1195  0007 2004          	jra	L374
1196  0009               L174:
1197                     ; 551     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1199  0009 721350c9      	bres	20681,#1
1200  000d               L374:
1201                     ; 553 }
1204  000d 81            	ret
1350                     ; 613 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1350                     ; 614 {
1351                     .text:	section	.text,new
1352  0000               _CLK_RTCClockConfig:
1354  0000 89            	pushw	x
1355       00000000      OFST:	set	0
1358                     ; 616   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1360                     ; 617   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1362                     ; 620   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1364  0001 9f            	ld	a,xl
1365  0002 1a01          	or	a,(OFST+1,sp)
1366  0004 c750c1        	ld	20673,a
1367                     ; 621 }
1370  0007 85            	popw	x
1371  0008 81            	ret
1437                     ; 632 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1437                     ; 633 {
1438                     .text:	section	.text,new
1439  0000               _CLK_BEEPClockConfig:
1443                     ; 635   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1445                     ; 638   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1447  0000 c750cb        	ld	20683,a
1448                     ; 640 }
1451  0003 81            	ret
1674                     ; 674 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1674                     ; 675 {
1675                     .text:	section	.text,new
1676  0000               _CLK_PeripheralClockConfig:
1678  0000 89            	pushw	x
1679  0001 88            	push	a
1680       00000001      OFST:	set	1
1683                     ; 676   uint8_t reg = 0;
1685                     ; 679   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1687                     ; 680   assert_param(IS_FUNCTIONAL_STATE(NewState));
1689                     ; 683   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1691  0002 9e            	ld	a,xh
1692  0003 a4f0          	and	a,#240
1693  0005 6b01          	ld	(OFST+0,sp),a
1694                     ; 685   if ( reg == 0x00)
1696  0007 0d01          	tnz	(OFST+0,sp)
1697  0009 2635          	jrne	L117
1698                     ; 687     if (NewState != DISABLE)
1700  000b 0d03          	tnz	(OFST+2,sp)
1701  000d 2719          	jreq	L317
1702                     ; 690       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1704  000f 7b02          	ld	a,(OFST+1,sp)
1705  0011 a40f          	and	a,#15
1706  0013 5f            	clrw	x
1707  0014 97            	ld	xl,a
1708  0015 a601          	ld	a,#1
1709  0017 5d            	tnzw	x
1710  0018 2704          	jreq	L64
1711  001a               L05:
1712  001a 48            	sll	a
1713  001b 5a            	decw	x
1714  001c 26fc          	jrne	L05
1715  001e               L64:
1716  001e ca50c3        	or	a,20675
1717  0021 c750c3        	ld	20675,a
1719  0024 acaa00aa      	jpf	L717
1720  0028               L317:
1721                     ; 695       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1723  0028 7b02          	ld	a,(OFST+1,sp)
1724  002a a40f          	and	a,#15
1725  002c 5f            	clrw	x
1726  002d 97            	ld	xl,a
1727  002e a601          	ld	a,#1
1728  0030 5d            	tnzw	x
1729  0031 2704          	jreq	L25
1730  0033               L45:
1731  0033 48            	sll	a
1732  0034 5a            	decw	x
1733  0035 26fc          	jrne	L45
1734  0037               L25:
1735  0037 43            	cpl	a
1736  0038 c450c3        	and	a,20675
1737  003b c750c3        	ld	20675,a
1738  003e 206a          	jra	L717
1739  0040               L117:
1740                     ; 698   else if (reg == 0x10)
1742  0040 7b01          	ld	a,(OFST+0,sp)
1743  0042 a110          	cp	a,#16
1744  0044 2633          	jrne	L127
1745                     ; 700     if (NewState != DISABLE)
1747  0046 0d03          	tnz	(OFST+2,sp)
1748  0048 2717          	jreq	L327
1749                     ; 703       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1751  004a 7b02          	ld	a,(OFST+1,sp)
1752  004c a40f          	and	a,#15
1753  004e 5f            	clrw	x
1754  004f 97            	ld	xl,a
1755  0050 a601          	ld	a,#1
1756  0052 5d            	tnzw	x
1757  0053 2704          	jreq	L65
1758  0055               L06:
1759  0055 48            	sll	a
1760  0056 5a            	decw	x
1761  0057 26fc          	jrne	L06
1762  0059               L65:
1763  0059 ca50c4        	or	a,20676
1764  005c c750c4        	ld	20676,a
1766  005f 2049          	jra	L717
1767  0061               L327:
1768                     ; 708       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1770  0061 7b02          	ld	a,(OFST+1,sp)
1771  0063 a40f          	and	a,#15
1772  0065 5f            	clrw	x
1773  0066 97            	ld	xl,a
1774  0067 a601          	ld	a,#1
1775  0069 5d            	tnzw	x
1776  006a 2704          	jreq	L26
1777  006c               L46:
1778  006c 48            	sll	a
1779  006d 5a            	decw	x
1780  006e 26fc          	jrne	L46
1781  0070               L26:
1782  0070 43            	cpl	a
1783  0071 c450c4        	and	a,20676
1784  0074 c750c4        	ld	20676,a
1785  0077 2031          	jra	L717
1786  0079               L127:
1787                     ; 713     if (NewState != DISABLE)
1789  0079 0d03          	tnz	(OFST+2,sp)
1790  007b 2717          	jreq	L137
1791                     ; 716       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1793  007d 7b02          	ld	a,(OFST+1,sp)
1794  007f a40f          	and	a,#15
1795  0081 5f            	clrw	x
1796  0082 97            	ld	xl,a
1797  0083 a601          	ld	a,#1
1798  0085 5d            	tnzw	x
1799  0086 2704          	jreq	L66
1800  0088               L07:
1801  0088 48            	sll	a
1802  0089 5a            	decw	x
1803  008a 26fc          	jrne	L07
1804  008c               L66:
1805  008c ca50d0        	or	a,20688
1806  008f c750d0        	ld	20688,a
1808  0092 2016          	jra	L717
1809  0094               L137:
1810                     ; 721       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1812  0094 7b02          	ld	a,(OFST+1,sp)
1813  0096 a40f          	and	a,#15
1814  0098 5f            	clrw	x
1815  0099 97            	ld	xl,a
1816  009a a601          	ld	a,#1
1817  009c 5d            	tnzw	x
1818  009d 2704          	jreq	L27
1819  009f               L47:
1820  009f 48            	sll	a
1821  00a0 5a            	decw	x
1822  00a1 26fc          	jrne	L47
1823  00a3               L27:
1824  00a3 43            	cpl	a
1825  00a4 c450d0        	and	a,20688
1826  00a7 c750d0        	ld	20688,a
1827  00aa               L717:
1828                     ; 724 }
1831  00aa 5b03          	addw	sp,#3
1832  00ac 81            	ret
1856                     ; 762 void CLK_LSEClockSecuritySystemEnable(void)
1856                     ; 763 {
1857                     .text:	section	.text,new
1858  0000               _CLK_LSEClockSecuritySystemEnable:
1862                     ; 765   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1864  0000 72105190      	bset	20880,#0
1865                     ; 766 }
1868  0004 81            	ret
1892                     ; 774 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1892                     ; 775 {
1893                     .text:	section	.text,new
1894  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1898                     ; 777   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1900  0000 72125190      	bset	20880,#1
1901                     ; 778 }
1904  0004 81            	ret
1979                     ; 804 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1979                     ; 805 {
1980                     .text:	section	.text,new
1981  0000               _CLK_HaltConfig:
1983  0000 89            	pushw	x
1984       00000000      OFST:	set	0
1987                     ; 807   assert_param(IS_CLK_HALT(CLK_Halt));
1989                     ; 808   assert_param(IS_FUNCTIONAL_STATE(NewState));
1991                     ; 810   if (NewState != DISABLE)
1993  0001 9f            	ld	a,xl
1994  0002 4d            	tnz	a
1995  0003 2709          	jreq	L1101
1996                     ; 812     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1998  0005 9e            	ld	a,xh
1999  0006 ca50c2        	or	a,20674
2000  0009 c750c2        	ld	20674,a
2002  000c 2009          	jra	L3101
2003  000e               L1101:
2004                     ; 816     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2006  000e 7b01          	ld	a,(OFST+1,sp)
2007  0010 43            	cpl	a
2008  0011 c450c2        	and	a,20674
2009  0014 c750c2        	ld	20674,a
2010  0017               L3101:
2011                     ; 818 }
2014  0017 85            	popw	x
2015  0018 81            	ret
2051                     ; 828 void CLK_MainRegulatorCmd(FunctionalState NewState)
2051                     ; 829 {
2052                     .text:	section	.text,new
2053  0000               _CLK_MainRegulatorCmd:
2057                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2059                     ; 833   if (NewState != DISABLE)
2061  0000 4d            	tnz	a
2062  0001 2706          	jreq	L3301
2063                     ; 836     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2065  0003 721350cf      	bres	20687,#1
2067  0007 2004          	jra	L5301
2068  0009               L3301:
2069                     ; 841     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2071  0009 721250cf      	bset	20687,#1
2072  000d               L5301:
2073                     ; 843 }
2076  000d 81            	ret
2148                     ; 872 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2148                     ; 873 {
2149                     .text:	section	.text,new
2150  0000               _CLK_ITConfig:
2152  0000 89            	pushw	x
2153       00000000      OFST:	set	0
2156                     ; 876   assert_param(IS_CLK_IT(CLK_IT));
2158                     ; 877   assert_param(IS_FUNCTIONAL_STATE(NewState));
2160                     ; 879   if (NewState != DISABLE)
2162  0001 9f            	ld	a,xl
2163  0002 4d            	tnz	a
2164  0003 271d          	jreq	L3701
2165                     ; 881     if (CLK_IT == CLK_IT_SWIF)
2167  0005 9e            	ld	a,xh
2168  0006 a11c          	cp	a,#28
2169  0008 2606          	jrne	L5701
2170                     ; 884       CLK->SWCR |= CLK_SWCR_SWIEN;
2172  000a 721450c9      	bset	20681,#2
2174  000e 202e          	jra	L5011
2175  0010               L5701:
2176                     ; 886     else if (CLK_IT == CLK_IT_LSECSSF)
2178  0010 7b01          	ld	a,(OFST+1,sp)
2179  0012 a12c          	cp	a,#44
2180  0014 2606          	jrne	L1011
2181                     ; 889       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2183  0016 72145190      	bset	20880,#2
2185  001a 2022          	jra	L5011
2186  001c               L1011:
2187                     ; 894       CLK->CSSR |= CLK_CSSR_CSSDIE;
2189  001c 721450ca      	bset	20682,#2
2190  0020 201c          	jra	L5011
2191  0022               L3701:
2192                     ; 899     if (CLK_IT == CLK_IT_SWIF)
2194  0022 7b01          	ld	a,(OFST+1,sp)
2195  0024 a11c          	cp	a,#28
2196  0026 2606          	jrne	L7011
2197                     ; 902       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2199  0028 721550c9      	bres	20681,#2
2201  002c 2010          	jra	L5011
2202  002e               L7011:
2203                     ; 904     else if (CLK_IT == CLK_IT_LSECSSF)
2205  002e 7b01          	ld	a,(OFST+1,sp)
2206  0030 a12c          	cp	a,#44
2207  0032 2606          	jrne	L3111
2208                     ; 907       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2210  0034 72155190      	bres	20880,#2
2212  0038 2004          	jra	L5011
2213  003a               L3111:
2214                     ; 912       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2216  003a 721550ca      	bres	20682,#2
2217  003e               L5011:
2218                     ; 915 }
2221  003e 85            	popw	x
2222  003f 81            	ret
2441                     ; 942 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2441                     ; 943 {
2442                     .text:	section	.text,new
2443  0000               _CLK_GetFlagStatus:
2445  0000 88            	push	a
2446  0001 89            	pushw	x
2447       00000002      OFST:	set	2
2450                     ; 944   uint8_t reg = 0;
2452                     ; 945   uint8_t pos = 0;
2454                     ; 946   FlagStatus bitstatus = RESET;
2456                     ; 949   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2458                     ; 952   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2460  0002 a4f0          	and	a,#240
2461  0004 6b02          	ld	(OFST+0,sp),a
2462                     ; 955   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2464  0006 7b03          	ld	a,(OFST+1,sp)
2465  0008 a40f          	and	a,#15
2466  000a 6b01          	ld	(OFST-1,sp),a
2467                     ; 957   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2469  000c 0d02          	tnz	(OFST+0,sp)
2470  000e 2607          	jrne	L7221
2471                     ; 959     reg = CLK->CRTCR;
2473  0010 c650c1        	ld	a,20673
2474  0013 6b02          	ld	(OFST+0,sp),a
2476  0015 2060          	jra	L1321
2477  0017               L7221:
2478                     ; 961   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2480  0017 7b02          	ld	a,(OFST+0,sp)
2481  0019 a110          	cp	a,#16
2482  001b 2607          	jrne	L3321
2483                     ; 963     reg = CLK->ICKCR;
2485  001d c650c2        	ld	a,20674
2486  0020 6b02          	ld	(OFST+0,sp),a
2488  0022 2053          	jra	L1321
2489  0024               L3321:
2490                     ; 965   else if (reg == 0x20) /* The flag to check is in CCOR register */
2492  0024 7b02          	ld	a,(OFST+0,sp)
2493  0026 a120          	cp	a,#32
2494  0028 2607          	jrne	L7321
2495                     ; 967     reg = CLK->CCOR;
2497  002a c650c5        	ld	a,20677
2498  002d 6b02          	ld	(OFST+0,sp),a
2500  002f 2046          	jra	L1321
2501  0031               L7321:
2502                     ; 969   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2504  0031 7b02          	ld	a,(OFST+0,sp)
2505  0033 a130          	cp	a,#48
2506  0035 2607          	jrne	L3421
2507                     ; 971     reg = CLK->ECKCR;
2509  0037 c650c6        	ld	a,20678
2510  003a 6b02          	ld	(OFST+0,sp),a
2512  003c 2039          	jra	L1321
2513  003e               L3421:
2514                     ; 973   else if (reg == 0x40) /* The flag to check is in SWCR register */
2516  003e 7b02          	ld	a,(OFST+0,sp)
2517  0040 a140          	cp	a,#64
2518  0042 2607          	jrne	L7421
2519                     ; 975     reg = CLK->SWCR;
2521  0044 c650c9        	ld	a,20681
2522  0047 6b02          	ld	(OFST+0,sp),a
2524  0049 202c          	jra	L1321
2525  004b               L7421:
2526                     ; 977   else if (reg == 0x50) /* The flag to check is in CSSR register */
2528  004b 7b02          	ld	a,(OFST+0,sp)
2529  004d a150          	cp	a,#80
2530  004f 2607          	jrne	L3521
2531                     ; 979     reg = CLK->CSSR;
2533  0051 c650ca        	ld	a,20682
2534  0054 6b02          	ld	(OFST+0,sp),a
2536  0056 201f          	jra	L1321
2537  0058               L3521:
2538                     ; 981   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2540  0058 7b02          	ld	a,(OFST+0,sp)
2541  005a a170          	cp	a,#112
2542  005c 2607          	jrne	L7521
2543                     ; 983     reg = CLK->REGCSR;
2545  005e c650cf        	ld	a,20687
2546  0061 6b02          	ld	(OFST+0,sp),a
2548  0063 2012          	jra	L1321
2549  0065               L7521:
2550                     ; 985   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2552  0065 7b02          	ld	a,(OFST+0,sp)
2553  0067 a180          	cp	a,#128
2554  0069 2607          	jrne	L3621
2555                     ; 987     reg = CSSLSE->CSR;
2557  006b c65190        	ld	a,20880
2558  006e 6b02          	ld	(OFST+0,sp),a
2560  0070 2005          	jra	L1321
2561  0072               L3621:
2562                     ; 991     reg = CLK->CBEEPR;
2564  0072 c650cb        	ld	a,20683
2565  0075 6b02          	ld	(OFST+0,sp),a
2566  0077               L1321:
2567                     ; 995   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2569  0077 7b01          	ld	a,(OFST-1,sp)
2570  0079 5f            	clrw	x
2571  007a 97            	ld	xl,a
2572  007b a601          	ld	a,#1
2573  007d 5d            	tnzw	x
2574  007e 2704          	jreq	L211
2575  0080               L411:
2576  0080 48            	sll	a
2577  0081 5a            	decw	x
2578  0082 26fc          	jrne	L411
2579  0084               L211:
2580  0084 1402          	and	a,(OFST+0,sp)
2581  0086 2706          	jreq	L7621
2582                     ; 997     bitstatus = SET;
2584  0088 a601          	ld	a,#1
2585  008a 6b02          	ld	(OFST+0,sp),a
2587  008c 2002          	jra	L1721
2588  008e               L7621:
2589                     ; 1001     bitstatus = RESET;
2591  008e 0f02          	clr	(OFST+0,sp)
2592  0090               L1721:
2593                     ; 1005   return((FlagStatus)bitstatus);
2595  0090 7b02          	ld	a,(OFST+0,sp)
2598  0092 5b03          	addw	sp,#3
2599  0094 81            	ret
2622                     ; 1013 void CLK_ClearFlag(void)
2622                     ; 1014 {
2623                     .text:	section	.text,new
2624  0000               _CLK_ClearFlag:
2628                     ; 1017   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2630  0000 72175190      	bres	20880,#3
2631                     ; 1018 }
2634  0004 81            	ret
2680                     ; 1029 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2680                     ; 1030 {
2681                     .text:	section	.text,new
2682  0000               _CLK_GetITStatus:
2684  0000 88            	push	a
2685  0001 88            	push	a
2686       00000001      OFST:	set	1
2689                     ; 1032   ITStatus bitstatus = RESET;
2691                     ; 1035   assert_param(IS_CLK_IT(CLK_IT));
2693                     ; 1037   if (CLK_IT == CLK_IT_SWIF)
2695  0002 a11c          	cp	a,#28
2696  0004 2611          	jrne	L5231
2697                     ; 1040     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2699  0006 c450c9        	and	a,20681
2700  0009 a10c          	cp	a,#12
2701  000b 2606          	jrne	L7231
2702                     ; 1042       bitstatus = SET;
2704  000d a601          	ld	a,#1
2705  000f 6b01          	ld	(OFST+0,sp),a
2707  0011 202e          	jra	L3331
2708  0013               L7231:
2709                     ; 1046       bitstatus = RESET;
2711  0013 0f01          	clr	(OFST+0,sp)
2712  0015 202a          	jra	L3331
2713  0017               L5231:
2714                     ; 1049   else if (CLK_IT == CLK_IT_LSECSSF)
2716  0017 7b02          	ld	a,(OFST+1,sp)
2717  0019 a12c          	cp	a,#44
2718  001b 2613          	jrne	L5331
2719                     ; 1052     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2721  001d c65190        	ld	a,20880
2722  0020 1402          	and	a,(OFST+1,sp)
2723  0022 a10c          	cp	a,#12
2724  0024 2606          	jrne	L7331
2725                     ; 1054       bitstatus = SET;
2727  0026 a601          	ld	a,#1
2728  0028 6b01          	ld	(OFST+0,sp),a
2730  002a 2015          	jra	L3331
2731  002c               L7331:
2732                     ; 1058       bitstatus = RESET;
2734  002c 0f01          	clr	(OFST+0,sp)
2735  002e 2011          	jra	L3331
2736  0030               L5331:
2737                     ; 1064     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2739  0030 c650ca        	ld	a,20682
2740  0033 1402          	and	a,(OFST+1,sp)
2741  0035 a10c          	cp	a,#12
2742  0037 2606          	jrne	L5431
2743                     ; 1066       bitstatus = SET;
2745  0039 a601          	ld	a,#1
2746  003b 6b01          	ld	(OFST+0,sp),a
2748  003d 2002          	jra	L3331
2749  003f               L5431:
2750                     ; 1070       bitstatus = RESET;
2752  003f 0f01          	clr	(OFST+0,sp)
2753  0041               L3331:
2754                     ; 1075   return bitstatus;
2756  0041 7b01          	ld	a,(OFST+0,sp)
2759  0043 85            	popw	x
2760  0044 81            	ret
2796                     ; 1086 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2796                     ; 1087 {
2797                     .text:	section	.text,new
2798  0000               _CLK_ClearITPendingBit:
2802                     ; 1090   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2804                     ; 1092   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2806  0000 a4f0          	and	a,#240
2807  0002 a120          	cp	a,#32
2808  0004 2606          	jrne	L7631
2809                     ; 1095     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2811  0006 72175190      	bres	20880,#3
2813  000a 2004          	jra	L1731
2814  000c               L7631:
2815                     ; 1100     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2817  000c 721750c9      	bres	20681,#3
2818  0010               L1731:
2819                     ; 1102 }
2822  0010 81            	ret
2847                     	xdef	_SYSDivFactor
2848                     	xdef	_CLK_ClearITPendingBit
2849                     	xdef	_CLK_GetITStatus
2850                     	xdef	_CLK_ClearFlag
2851                     	xdef	_CLK_GetFlagStatus
2852                     	xdef	_CLK_ITConfig
2853                     	xdef	_CLK_MainRegulatorCmd
2854                     	xdef	_CLK_HaltConfig
2855                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2856                     	xdef	_CLK_LSEClockSecuritySystemEnable
2857                     	xdef	_CLK_PeripheralClockConfig
2858                     	xdef	_CLK_BEEPClockConfig
2859                     	xdef	_CLK_RTCClockConfig
2860                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2861                     	xdef	_CLK_SYSCLKDivConfig
2862                     	xdef	_CLK_GetClockFreq
2863                     	xdef	_CLK_GetSYSCLKSource
2864                     	xdef	_CLK_SYSCLKSourceConfig
2865                     	xdef	_CLK_CCOConfig
2866                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2867                     	xdef	_CLK_ClockSecuritySystemEnable
2868                     	xdef	_CLK_LSEConfig
2869                     	xdef	_CLK_HSEConfig
2870                     	xdef	_CLK_LSICmd
2871                     	xdef	_CLK_AdjustHSICalibrationValue
2872                     	xdef	_CLK_HSICmd
2873                     	xdef	_CLK_DeInit
2874                     	xref.b	c_lreg
2875                     	xref.b	c_x
2894                     	xref	c_ludv
2895                     	xref	c_rtol
2896                     	xref	c_ltor
2897                     	end
