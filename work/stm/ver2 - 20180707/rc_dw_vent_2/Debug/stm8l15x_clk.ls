   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     .const:	section	.text
  23  0000               _SYSDivFactor:
  24  0000 01            	dc.b	1
  25  0001 02            	dc.b	2
  26  0002 04            	dc.b	4
  27  0003 08            	dc.b	8
  28  0004 10            	dc.b	16
  57                     ; 117 void CLK_DeInit(void)
  57                     ; 118 {
  58                     .text:	section	.text,new
  59  0000               f_CLK_DeInit:
  63                     ; 119   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  65  0000 351150c2      	mov	20674,#17
  66                     ; 120   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  68  0004 725f50c6      	clr	20678
  69                     ; 121   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  71  0008 725f50c1      	clr	20673
  72                     ; 122   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  74  000c 725f50cb      	clr	20683
  75                     ; 123   CLK->SWR  = CLK_SWR_RESET_VALUE;
  77  0010 350150c8      	mov	20680,#1
  78                     ; 124   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  80  0014 725f50c9      	clr	20681
  81                     ; 125   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  83  0018 350350c0      	mov	20672,#3
  84                     ; 126   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  86  001c 725f50c3      	clr	20675
  87                     ; 127   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  89  0020 358050c4      	mov	20676,#128
  90                     ; 128   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  92  0024 725f50d0      	clr	20688
  93                     ; 129   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  95  0028 725f50ca      	clr	20682
  96                     ; 130   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  98  002c 725f50c5      	clr	20677
  99                     ; 131   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 101  0030 725f50cd      	clr	20685
 102                     ; 132   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
 104  0034 725f50cc      	clr	20684
 105                     ; 133   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 107  0038 725f50ce      	clr	20686
 108                     ; 134   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 110  003c 35b950cf      	mov	20687,#185
 111                     ; 135 }
 114  0040 87            	retf	
 168                     ; 157 void CLK_HSICmd(FunctionalState NewState)
 168                     ; 158 {
 169                     .text:	section	.text,new
 170  0000               f_CLK_HSICmd:
 174                     ; 160   assert_param(IS_FUNCTIONAL_STATE(NewState));
 176                     ; 162   if (NewState != DISABLE)
 178  0000 4d            	tnz	a
 179  0001 2705          	jreq	L74
 180                     ; 165     CLK->ICKCR |= CLK_ICKCR_HSION;
 182  0003 721050c2      	bset	20674,#0
 185  0007 87            	retf	
 186  0008               L74:
 187                     ; 170     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 189  0008 721150c2      	bres	20674,#0
 190                     ; 172 }
 193  000c 87            	retf	
 226                     ; 185 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 226                     ; 186 {
 227                     .text:	section	.text,new
 228  0000               f_CLK_AdjustHSICalibrationValue:
 232                     ; 188   CLK->HSIUNLCKR = 0xAC;
 234  0000 35ac50ce      	mov	20686,#172
 235                     ; 189   CLK->HSIUNLCKR = 0x35;
 237  0004 353550ce      	mov	20686,#53
 238                     ; 192   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 240  0008 c750cd        	ld	20685,a
 241                     ; 193 }
 244  000b 87            	retf	
 278                     ; 209 void CLK_LSICmd(FunctionalState NewState)
 278                     ; 210 {
 279                     .text:	section	.text,new
 280  0000               f_CLK_LSICmd:
 284                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 286                     ; 215   if (NewState != DISABLE)
 288  0000 4d            	tnz	a
 289  0001 2705          	jreq	L501
 290                     ; 218     CLK->ICKCR |= CLK_ICKCR_LSION;
 292  0003 721450c2      	bset	20674,#2
 295  0007 87            	retf	
 296  0008               L501:
 297                     ; 223     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 299  0008 721550c2      	bres	20674,#2
 300                     ; 225 }
 303  000c 87            	retf	
 364                     ; 246 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 364                     ; 247 {
 365                     .text:	section	.text,new
 366  0000               f_CLK_HSEConfig:
 370                     ; 249   assert_param(IS_CLK_HSE(CLK_HSE));
 372                     ; 253   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 374  0000 721150c6      	bres	20678,#0
 375                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 377  0004 721950c6      	bres	20678,#4
 378                     ; 259   CLK->ECKCR |= (uint8_t)CLK_HSE;
 380  0008 ca50c6        	or	a,20678
 381  000b c750c6        	ld	20678,a
 382                     ; 260 }
 385  000e 87            	retf	
 446                     ; 277 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 446                     ; 278 {
 447                     .text:	section	.text,new
 448  0000               f_CLK_LSEConfig:
 452                     ; 280   assert_param(IS_CLK_LSE(CLK_LSE));
 454                     ; 284   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 456  0000 721550c6      	bres	20678,#2
 457                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 459  0004 721b50c6      	bres	20678,#5
 460                     ; 290   CLK->ECKCR |= (uint8_t)CLK_LSE;
 462  0008 ca50c6        	or	a,20678
 463  000b c750c6        	ld	20678,a
 464                     ; 292 }
 467  000e 87            	retf	
 490                     ; 303 void CLK_ClockSecuritySystemEnable(void)
 490                     ; 304 {
 491                     .text:	section	.text,new
 492  0000               f_CLK_ClockSecuritySystemEnable:
 496                     ; 306   CLK->CSSR |= CLK_CSSR_CSSEN;
 498  0000 721050ca      	bset	20682,#0
 499                     ; 307 }
 502  0004 87            	retf	
 537                     ; 314 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 537                     ; 315 {
 538                     .text:	section	.text,new
 539  0000               f_CLK_ClockSecuritySytemDeglitchCmd:
 543                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 545                     ; 319   if (NewState != DISABLE)
 547  0000 4d            	tnz	a
 548  0001 2705          	jreq	L712
 549                     ; 322     CLK->CSSR |= CLK_CSSR_CSSDGON;
 551  0003 721850ca      	bset	20682,#4
 554  0007 87            	retf	
 555  0008               L712:
 556                     ; 327     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 558  0008 721950ca      	bres	20682,#4
 559                     ; 329 }
 562  000c 87            	retf	
 702                     ; 353 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 702                     ; 354 {
 703                     .text:	section	.text,new
 704  0000               f_CLK_CCOConfig:
 706  0000 89            	pushw	x
 707       00000000      OFST:	set	0
 710                     ; 356   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 712                     ; 357   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 714                     ; 360   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 716  0001 9f            	ld	a,xl
 717  0002 1a01          	or	a,(OFST+1,sp)
 718  0004 c750c5        	ld	20677,a
 719                     ; 361 }
 722  0007 85            	popw	x
 723  0008 87            	retf	
 796                     ; 413 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 796                     ; 414 {
 797                     .text:	section	.text,new
 798  0000               f_CLK_SYSCLKSourceConfig:
 802                     ; 416   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 804                     ; 419   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 806  0000 c750c8        	ld	20680,a
 807                     ; 420 }
 810  0003 87            	retf	
 834                     ; 432 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 834                     ; 433 {
 835                     .text:	section	.text,new
 836  0000               f_CLK_GetSYSCLKSource:
 840                     ; 434   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 842  0000 c650c7        	ld	a,20679
 845  0003 87            	retf	
 908                     ; 475 uint32_t CLK_GetClockFreq(void)
 908                     ; 476 {
 909                     .text:	section	.text,new
 910  0000               f_CLK_GetClockFreq:
 912  0000 5209          	subw	sp,#9
 913       00000009      OFST:	set	9
 916                     ; 477   uint32_t clockfrequency = 0;
 918                     ; 478   uint32_t sourcefrequency = 0;
 920  0002 5f            	clrw	x
 921  0003 1f07          	ldw	(OFST-2,sp),x
 922  0005 1f05          	ldw	(OFST-4,sp),x
 923                     ; 479   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 925                     ; 480   uint8_t tmp = 0, presc = 0;
 929                     ; 483   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 931  0007 c650c7        	ld	a,20679
 932  000a 6b09          	ld	(OFST+0,sp),a
 933                     ; 485   if ( clocksource == CLK_SYSCLKSource_HSI)
 935  000c a101          	cp	a,#1
 936                     ; 487     sourcefrequency = HSI_VALUE;
 938  000e 2710          	jreq	LC002
 939                     ; 489   else if ( clocksource == CLK_SYSCLKSource_LSI)
 941  0010 a102          	cp	a,#2
 942  0012 2608          	jrne	L104
 943                     ; 491     sourcefrequency = LSI_VALUE;
 945  0014 ae9470        	ldw	x,#38000
 946  0017 1f07          	ldw	(OFST-2,sp),x
 947  0019 5f            	clrw	x
 949  001a 200c          	jpf	LC001
 950  001c               L104:
 951                     ; 493   else if ( clocksource == CLK_SYSCLKSource_HSE)
 953  001c a104          	cp	a,#4
 954  001e 260a          	jrne	L504
 955                     ; 495     sourcefrequency = HSE_VALUE;
 957  0020               LC002:
 959  0020 ae2400        	ldw	x,#9216
 960  0023 1f07          	ldw	(OFST-2,sp),x
 961  0025 ae00f4        	ldw	x,#244
 962  0028               LC001:
 963  0028 1f05          	ldw	(OFST-4,sp),x
 965  002a               L504:
 966                     ; 499     clockfrequency = LSE_VALUE;
 968                     ; 503   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 970  002a c650c0        	ld	a,20672
 971  002d a407          	and	a,#7
 972                     ; 504   presc = SYSDivFactor[tmp];
 974  002f 5f            	clrw	x
 975  0030 97            	ld	xl,a
 976  0031 d60000        	ld	a,(_SYSDivFactor,x)
 977  0034 6b09          	ld	(OFST+0,sp),a
 978                     ; 507   clockfrequency = sourcefrequency / presc;
 980  0036 b703          	ld	c_lreg+3,a
 981  0038 3f02          	clr	c_lreg+2
 982  003a 3f01          	clr	c_lreg+1
 983  003c 3f00          	clr	c_lreg
 984  003e 96            	ldw	x,sp
 985  003f 5c            	incw	x
 986  0040 8d000000      	callf	d_rtol
 988  0044 96            	ldw	x,sp
 989  0045 1c0005        	addw	x,#OFST-4
 990  0048 8d000000      	callf	d_ltor
 992  004c 96            	ldw	x,sp
 993  004d 5c            	incw	x
 994  004e 8d000000      	callf	d_ludv
 996  0052 96            	ldw	x,sp
 997  0053 1c0005        	addw	x,#OFST-4
 998  0056 8d000000      	callf	d_rtol
1000                     ; 509   return((uint32_t)clockfrequency);
1002  005a 96            	ldw	x,sp
1003  005b 1c0005        	addw	x,#OFST-4
1004  005e 8d000000      	callf	d_ltor
1008  0062 5b09          	addw	sp,#9
1009  0064 87            	retf	
1106                     ; 525 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1106                     ; 526 {
1107                     .text:	section	.text,new
1108  0000               f_CLK_SYSCLKDivConfig:
1112                     ; 528   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1114                     ; 530   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1116  0000 c750c0        	ld	20672,a
1117                     ; 531 }
1120  0003 87            	retf	
1155                     ; 538 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1155                     ; 539 {
1156                     .text:	section	.text,new
1157  0000               f_CLK_SYSCLKSourceSwitchCmd:
1161                     ; 541   assert_param(IS_FUNCTIONAL_STATE(NewState));
1163                     ; 543   if (NewState != DISABLE)
1165  0000 4d            	tnz	a
1166  0001 2705          	jreq	L174
1167                     ; 546     CLK->SWCR |= CLK_SWCR_SWEN;
1169  0003 721250c9      	bset	20681,#1
1172  0007 87            	retf	
1173  0008               L174:
1174                     ; 551     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1176  0008 721350c9      	bres	20681,#1
1177                     ; 553 }
1180  000c 87            	retf	
1325                     ; 613 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1325                     ; 614 {
1326                     .text:	section	.text,new
1327  0000               f_CLK_RTCClockConfig:
1329  0000 89            	pushw	x
1330       00000000      OFST:	set	0
1333                     ; 616   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1335                     ; 617   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1337                     ; 620   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1339  0001 9f            	ld	a,xl
1340  0002 1a01          	or	a,(OFST+1,sp)
1341  0004 c750c1        	ld	20673,a
1342                     ; 621 }
1345  0007 85            	popw	x
1346  0008 87            	retf	
1411                     ; 632 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1411                     ; 633 {
1412                     .text:	section	.text,new
1413  0000               f_CLK_BEEPClockConfig:
1417                     ; 635   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1419                     ; 638   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1421  0000 c750cb        	ld	20683,a
1422                     ; 640 }
1425  0003 87            	retf	
1647                     ; 674 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1647                     ; 675 {
1648                     .text:	section	.text,new
1649  0000               f_CLK_PeripheralClockConfig:
1651  0000 89            	pushw	x
1652  0001 88            	push	a
1653       00000001      OFST:	set	1
1656                     ; 676   uint8_t reg = 0;
1658                     ; 679   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1660                     ; 680   assert_param(IS_FUNCTIONAL_STATE(NewState));
1662                     ; 683   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1664  0002 9e            	ld	a,xh
1665  0003 a4f0          	and	a,#240
1666  0005 6b01          	ld	(OFST+0,sp),a
1667                     ; 685   if ( reg == 0x00)
1669  0007 262d          	jrne	L117
1670                     ; 687     if (NewState != DISABLE)
1672  0009 7b03          	ld	a,(OFST+2,sp)
1673  000b 2714          	jreq	L317
1674                     ; 690       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1676  000d 7b02          	ld	a,(OFST+1,sp)
1677  000f 8d8f008f      	callf	LC005
1678  0013 2704          	jreq	L64
1679  0015               L05:
1680  0015 48            	sll	a
1681  0016 5a            	decw	x
1682  0017 26fc          	jrne	L05
1683  0019               L64:
1684  0019 ca50c3        	or	a,20675
1685  001c c750c3        	ld	20675,a
1687  001f 206b          	jra	L717
1688  0021               L317:
1689                     ; 695       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1691  0021 7b02          	ld	a,(OFST+1,sp)
1692  0023 8d8f008f      	callf	LC005
1693  0027 2704          	jreq	L25
1694  0029               L45:
1695  0029 48            	sll	a
1696  002a 5a            	decw	x
1697  002b 26fc          	jrne	L45
1698  002d               L25:
1699  002d 43            	cpl	a
1700  002e c450c3        	and	a,20675
1701  0031 c750c3        	ld	20675,a
1702  0034 2056          	jra	L717
1703  0036               L117:
1704                     ; 698   else if (reg == 0x10)
1706  0036 a110          	cp	a,#16
1707  0038 262a          	jrne	L127
1708                     ; 700     if (NewState != DISABLE)
1710  003a 7b03          	ld	a,(OFST+2,sp)
1711  003c 2711          	jreq	L327
1712                     ; 703       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1714  003e 7b02          	ld	a,(OFST+1,sp)
1715  0040 8d8f008f      	callf	LC005
1716  0044 2704          	jreq	L65
1717  0046               L06:
1718  0046 48            	sll	a
1719  0047 5a            	decw	x
1720  0048 26fc          	jrne	L06
1721  004a               L65:
1722  004a ca50c4        	or	a,20676
1724  004d 2010          	jpf	LC004
1725  004f               L327:
1726                     ; 708       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1728  004f 7b02          	ld	a,(OFST+1,sp)
1729  0051 8d8f008f      	callf	LC005
1730  0055 2704          	jreq	L26
1731  0057               L46:
1732  0057 48            	sll	a
1733  0058 5a            	decw	x
1734  0059 26fc          	jrne	L46
1735  005b               L26:
1736  005b 43            	cpl	a
1737  005c c450c4        	and	a,20676
1738  005f               LC004:
1739  005f c750c4        	ld	20676,a
1740  0062 2028          	jra	L717
1741  0064               L127:
1742                     ; 713     if (NewState != DISABLE)
1744  0064 7b03          	ld	a,(OFST+2,sp)
1745  0066 2711          	jreq	L137
1746                     ; 716       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1748  0068 7b02          	ld	a,(OFST+1,sp)
1749  006a 8d8f008f      	callf	LC005
1750  006e 2704          	jreq	L66
1751  0070               L07:
1752  0070 48            	sll	a
1753  0071 5a            	decw	x
1754  0072 26fc          	jrne	L07
1755  0074               L66:
1756  0074 ca50d0        	or	a,20688
1758  0077 2010          	jpf	LC003
1759  0079               L137:
1760                     ; 721       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1762  0079 7b02          	ld	a,(OFST+1,sp)
1763  007b 8d8f008f      	callf	LC005
1764  007f 2704          	jreq	L27
1765  0081               L47:
1766  0081 48            	sll	a
1767  0082 5a            	decw	x
1768  0083 26fc          	jrne	L47
1769  0085               L27:
1770  0085 43            	cpl	a
1771  0086 c450d0        	and	a,20688
1772  0089               LC003:
1773  0089 c750d0        	ld	20688,a
1774  008c               L717:
1775                     ; 724 }
1778  008c 5b03          	addw	sp,#3
1779  008e 87            	retf	
1780  008f               LC005:
1781  008f a40f          	and	a,#15
1782  0091 5f            	clrw	x
1783  0092 97            	ld	xl,a
1784  0093 a601          	ld	a,#1
1785  0095 5d            	tnzw	x
1786  0096 87            	retf	
1809                     ; 762 void CLK_LSEClockSecuritySystemEnable(void)
1809                     ; 763 {
1810                     .text:	section	.text,new
1811  0000               f_CLK_LSEClockSecuritySystemEnable:
1815                     ; 765   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1817  0000 72105190      	bset	20880,#0
1818                     ; 766 }
1821  0004 87            	retf	
1844                     ; 774 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1844                     ; 775 {
1845                     .text:	section	.text,new
1846  0000               f_CLK_RTCCLKSwitchOnLSEFailureEnable:
1850                     ; 777   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1852  0000 72125190      	bset	20880,#1
1853                     ; 778 }
1856  0004 87            	retf	
1930                     ; 804 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1930                     ; 805 {
1931                     .text:	section	.text,new
1932  0000               f_CLK_HaltConfig:
1934  0000 89            	pushw	x
1935       00000000      OFST:	set	0
1938                     ; 807   assert_param(IS_CLK_HALT(CLK_Halt));
1940                     ; 808   assert_param(IS_FUNCTIONAL_STATE(NewState));
1942                     ; 810   if (NewState != DISABLE)
1944  0001 9f            	ld	a,xl
1945  0002 4d            	tnz	a
1946  0003 2706          	jreq	L1101
1947                     ; 812     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1949  0005 9e            	ld	a,xh
1950  0006 ca50c2        	or	a,20674
1952  0009 2006          	jra	L3101
1953  000b               L1101:
1954                     ; 816     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1956  000b 7b01          	ld	a,(OFST+1,sp)
1957  000d 43            	cpl	a
1958  000e c450c2        	and	a,20674
1959  0011               L3101:
1960  0011 c750c2        	ld	20674,a
1961                     ; 818 }
1964  0014 85            	popw	x
1965  0015 87            	retf	
2000                     ; 828 void CLK_MainRegulatorCmd(FunctionalState NewState)
2000                     ; 829 {
2001                     .text:	section	.text,new
2002  0000               f_CLK_MainRegulatorCmd:
2006                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2008                     ; 833   if (NewState != DISABLE)
2010  0000 4d            	tnz	a
2011  0001 2705          	jreq	L3301
2012                     ; 836     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2014  0003 721350cf      	bres	20687,#1
2017  0007 87            	retf	
2018  0008               L3301:
2019                     ; 841     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2021  0008 721250cf      	bset	20687,#1
2022                     ; 843 }
2025  000c 87            	retf	
2096                     ; 872 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2096                     ; 873 {
2097                     .text:	section	.text,new
2098  0000               f_CLK_ITConfig:
2100  0000 89            	pushw	x
2101       00000000      OFST:	set	0
2104                     ; 876   assert_param(IS_CLK_IT(CLK_IT));
2106                     ; 877   assert_param(IS_FUNCTIONAL_STATE(NewState));
2108                     ; 879   if (NewState != DISABLE)
2110  0001 9f            	ld	a,xl
2111  0002 4d            	tnz	a
2112  0003 271d          	jreq	L3701
2113                     ; 881     if (CLK_IT == CLK_IT_SWIF)
2115  0005 9e            	ld	a,xh
2116  0006 a11c          	cp	a,#28
2117  0008 2606          	jrne	L5701
2118                     ; 884       CLK->SWCR |= CLK_SWCR_SWIEN;
2120  000a 721450c9      	bset	20681,#2
2122  000e 202c          	jra	L5011
2123  0010               L5701:
2124                     ; 886     else if (CLK_IT == CLK_IT_LSECSSF)
2126  0010 7b01          	ld	a,(OFST+1,sp)
2127  0012 a12c          	cp	a,#44
2128  0014 2606          	jrne	L1011
2129                     ; 889       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2131  0016 72145190      	bset	20880,#2
2133  001a 2020          	jra	L5011
2134  001c               L1011:
2135                     ; 894       CLK->CSSR |= CLK_CSSR_CSSDIE;
2137  001c 721450ca      	bset	20682,#2
2138  0020 201a          	jra	L5011
2139  0022               L3701:
2140                     ; 899     if (CLK_IT == CLK_IT_SWIF)
2142  0022 7b01          	ld	a,(OFST+1,sp)
2143  0024 a11c          	cp	a,#28
2144  0026 2606          	jrne	L7011
2145                     ; 902       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2147  0028 721550c9      	bres	20681,#2
2149  002c 200e          	jra	L5011
2150  002e               L7011:
2151                     ; 904     else if (CLK_IT == CLK_IT_LSECSSF)
2153  002e a12c          	cp	a,#44
2154  0030 2606          	jrne	L3111
2155                     ; 907       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2157  0032 72155190      	bres	20880,#2
2159  0036 2004          	jra	L5011
2160  0038               L3111:
2161                     ; 912       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2163  0038 721550ca      	bres	20682,#2
2164  003c               L5011:
2165                     ; 915 }
2168  003c 85            	popw	x
2169  003d 87            	retf	
2387                     ; 942 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2387                     ; 943 {
2388                     .text:	section	.text,new
2389  0000               f_CLK_GetFlagStatus:
2391  0000 88            	push	a
2392  0001 89            	pushw	x
2393       00000002      OFST:	set	2
2396                     ; 944   uint8_t reg = 0;
2398                     ; 945   uint8_t pos = 0;
2400                     ; 946   FlagStatus bitstatus = RESET;
2402                     ; 949   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2404                     ; 952   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2406  0002 a4f0          	and	a,#240
2407  0004 6b02          	ld	(OFST+0,sp),a
2408                     ; 955   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2410  0006 7b03          	ld	a,(OFST+1,sp)
2411  0008 a40f          	and	a,#15
2412  000a 6b01          	ld	(OFST-1,sp),a
2413                     ; 957   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2415  000c 7b02          	ld	a,(OFST+0,sp)
2416  000e 2605          	jrne	L7221
2417                     ; 959     reg = CLK->CRTCR;
2419  0010 c650c1        	ld	a,20673
2421  0013 2042          	jra	L1321
2422  0015               L7221:
2423                     ; 961   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2425  0015 a110          	cp	a,#16
2426  0017 2605          	jrne	L3321
2427                     ; 963     reg = CLK->ICKCR;
2429  0019 c650c2        	ld	a,20674
2431  001c 2039          	jra	L1321
2432  001e               L3321:
2433                     ; 965   else if (reg == 0x20) /* The flag to check is in CCOR register */
2435  001e a120          	cp	a,#32
2436  0020 2605          	jrne	L7321
2437                     ; 967     reg = CLK->CCOR;
2439  0022 c650c5        	ld	a,20677
2441  0025 2030          	jra	L1321
2442  0027               L7321:
2443                     ; 969   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2445  0027 a130          	cp	a,#48
2446  0029 2605          	jrne	L3421
2447                     ; 971     reg = CLK->ECKCR;
2449  002b c650c6        	ld	a,20678
2451  002e 2027          	jra	L1321
2452  0030               L3421:
2453                     ; 973   else if (reg == 0x40) /* The flag to check is in SWCR register */
2455  0030 a140          	cp	a,#64
2456  0032 2605          	jrne	L7421
2457                     ; 975     reg = CLK->SWCR;
2459  0034 c650c9        	ld	a,20681
2461  0037 201e          	jra	L1321
2462  0039               L7421:
2463                     ; 977   else if (reg == 0x50) /* The flag to check is in CSSR register */
2465  0039 a150          	cp	a,#80
2466  003b 2605          	jrne	L3521
2467                     ; 979     reg = CLK->CSSR;
2469  003d c650ca        	ld	a,20682
2471  0040 2015          	jra	L1321
2472  0042               L3521:
2473                     ; 981   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2475  0042 a170          	cp	a,#112
2476  0044 2605          	jrne	L7521
2477                     ; 983     reg = CLK->REGCSR;
2479  0046 c650cf        	ld	a,20687
2481  0049 200c          	jra	L1321
2482  004b               L7521:
2483                     ; 985   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2485  004b a180          	cp	a,#128
2486  004d 2605          	jrne	L3621
2487                     ; 987     reg = CSSLSE->CSR;
2489  004f c65190        	ld	a,20880
2491  0052 2003          	jra	L1321
2492  0054               L3621:
2493                     ; 991     reg = CLK->CBEEPR;
2495  0054 c650cb        	ld	a,20683
2496  0057               L1321:
2497  0057 6b02          	ld	(OFST+0,sp),a
2498                     ; 995   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2500  0059 5f            	clrw	x
2501  005a 7b01          	ld	a,(OFST-1,sp)
2502  005c 97            	ld	xl,a
2503  005d a601          	ld	a,#1
2504  005f 5d            	tnzw	x
2505  0060 2704          	jreq	L211
2506  0062               L411:
2507  0062 48            	sll	a
2508  0063 5a            	decw	x
2509  0064 26fc          	jrne	L411
2510  0066               L211:
2511  0066 1402          	and	a,(OFST+0,sp)
2512  0068 2702          	jreq	L7621
2513                     ; 997     bitstatus = SET;
2515  006a a601          	ld	a,#1
2517  006c               L7621:
2518                     ; 1001     bitstatus = RESET;
2520                     ; 1005   return((FlagStatus)bitstatus);
2524  006c 5b03          	addw	sp,#3
2525  006e 87            	retf	
2547                     ; 1013 void CLK_ClearFlag(void)
2547                     ; 1014 {
2548                     .text:	section	.text,new
2549  0000               f_CLK_ClearFlag:
2553                     ; 1017   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2555  0000 72175190      	bres	20880,#3
2556                     ; 1018 }
2559  0004 87            	retf	
2604                     ; 1029 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2604                     ; 1030 {
2605                     .text:	section	.text,new
2606  0000               f_CLK_GetITStatus:
2608  0000 88            	push	a
2609  0001 88            	push	a
2610       00000001      OFST:	set	1
2613                     ; 1032   ITStatus bitstatus = RESET;
2615                     ; 1035   assert_param(IS_CLK_IT(CLK_IT));
2617                     ; 1037   if (CLK_IT == CLK_IT_SWIF)
2619  0002 a11c          	cp	a,#28
2620  0004 2605          	jrne	L5231
2621                     ; 1040     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2623  0006 c450c9        	and	a,20681
2624                     ; 1042       bitstatus = SET;
2626  0009 200b          	jpf	LC008
2627                     ; 1046       bitstatus = RESET;
2628  000b               L5231:
2629                     ; 1049   else if (CLK_IT == CLK_IT_LSECSSF)
2631  000b 7b02          	ld	a,(OFST+1,sp)
2632  000d a12c          	cp	a,#44
2633  000f 260d          	jrne	L5331
2634                     ; 1052     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2636  0011 c65190        	ld	a,20880
2637  0014 1402          	and	a,(OFST+1,sp)
2638  0016               LC008:
2639  0016 a10c          	cp	a,#12
2640  0018 260d          	jrne	L5431
2641                     ; 1054       bitstatus = SET;
2643  001a               LC007:
2646  001a a601          	ld	a,#1
2648  001c 200a          	jra	L3331
2649                     ; 1058       bitstatus = RESET;
2650  001e               L5331:
2651                     ; 1064     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2653  001e c650ca        	ld	a,20682
2654  0021 1402          	and	a,(OFST+1,sp)
2655  0023 a10c          	cp	a,#12
2656                     ; 1066       bitstatus = SET;
2658  0025 27f3          	jreq	LC007
2659  0027               L5431:
2660                     ; 1070       bitstatus = RESET;
2664  0027 4f            	clr	a
2665  0028               L3331:
2666                     ; 1075   return bitstatus;
2670  0028 85            	popw	x
2671  0029 87            	retf	
2706                     ; 1086 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2706                     ; 1087 {
2707                     .text:	section	.text,new
2708  0000               f_CLK_ClearITPendingBit:
2712                     ; 1090   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2714                     ; 1092   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2716  0000 a4f0          	and	a,#240
2717  0002 a120          	cp	a,#32
2718  0004 2605          	jrne	L7631
2719                     ; 1095     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2721  0006 72175190      	bres	20880,#3
2724  000a 87            	retf	
2725  000b               L7631:
2726                     ; 1100     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2728  000b 721750c9      	bres	20681,#3
2729                     ; 1102 }
2732  000f 87            	retf	
2756                     	xdef	_SYSDivFactor
2757                     	xdef	f_CLK_ClearITPendingBit
2758                     	xdef	f_CLK_GetITStatus
2759                     	xdef	f_CLK_ClearFlag
2760                     	xdef	f_CLK_GetFlagStatus
2761                     	xdef	f_CLK_ITConfig
2762                     	xdef	f_CLK_MainRegulatorCmd
2763                     	xdef	f_CLK_HaltConfig
2764                     	xdef	f_CLK_RTCCLKSwitchOnLSEFailureEnable
2765                     	xdef	f_CLK_LSEClockSecuritySystemEnable
2766                     	xdef	f_CLK_PeripheralClockConfig
2767                     	xdef	f_CLK_BEEPClockConfig
2768                     	xdef	f_CLK_RTCClockConfig
2769                     	xdef	f_CLK_SYSCLKSourceSwitchCmd
2770                     	xdef	f_CLK_SYSCLKDivConfig
2771                     	xdef	f_CLK_GetClockFreq
2772                     	xdef	f_CLK_GetSYSCLKSource
2773                     	xdef	f_CLK_SYSCLKSourceConfig
2774                     	xdef	f_CLK_CCOConfig
2775                     	xdef	f_CLK_ClockSecuritySytemDeglitchCmd
2776                     	xdef	f_CLK_ClockSecuritySystemEnable
2777                     	xdef	f_CLK_LSEConfig
2778                     	xdef	f_CLK_HSEConfig
2779                     	xdef	f_CLK_LSICmd
2780                     	xdef	f_CLK_AdjustHSICalibrationValue
2781                     	xdef	f_CLK_HSICmd
2782                     	xdef	f_CLK_DeInit
2783                     	xref.b	c_lreg
2784                     	xref.b	c_x
2803                     	xref	d_ludv
2804                     	xref	d_rtol
2805                     	xref	d_ltor
2806                     	end
