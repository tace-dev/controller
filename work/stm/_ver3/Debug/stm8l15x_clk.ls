   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  21                     .const:	section	.text
  22  0000               _SYSDivFactor:
  23  0000 01            	dc.b	1
  24  0001 02            	dc.b	2
  25  0002 04            	dc.b	4
  26  0003 08            	dc.b	8
  27  0004 10            	dc.b	16
  56                     ; 117 void CLK_DeInit(void)
  56                     ; 118 {
  58                     	switch	.text
  59  0000               _CLK_DeInit:
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
 114  0040 81            	ret	
 169                     ; 157 void CLK_HSICmd(FunctionalState NewState)
 169                     ; 158 {
 170                     	switch	.text
 171  0041               _CLK_HSICmd:
 175                     ; 160   assert_param(IS_FUNCTIONAL_STATE(NewState));
 177                     ; 162   if (NewState != DISABLE)
 179  0041 4d            	tnz	a
 180  0042 2705          	jreq	L74
 181                     ; 165     CLK->ICKCR |= CLK_ICKCR_HSION;
 183  0044 721050c2      	bset	20674,#0
 186  0048 81            	ret	
 187  0049               L74:
 188                     ; 170     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 190  0049 721150c2      	bres	20674,#0
 191                     ; 172 }
 194  004d 81            	ret	
 228                     ; 185 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 228                     ; 186 {
 229                     	switch	.text
 230  004e               _CLK_AdjustHSICalibrationValue:
 234                     ; 188   CLK->HSIUNLCKR = 0xAC;
 236  004e 35ac50ce      	mov	20686,#172
 237                     ; 189   CLK->HSIUNLCKR = 0x35;
 239  0052 353550ce      	mov	20686,#53
 240                     ; 192   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 242  0056 c750cd        	ld	20685,a
 243                     ; 193 }
 246  0059 81            	ret	
 281                     ; 209 void CLK_LSICmd(FunctionalState NewState)
 281                     ; 210 {
 282                     	switch	.text
 283  005a               _CLK_LSICmd:
 287                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 289                     ; 215   if (NewState != DISABLE)
 291  005a 4d            	tnz	a
 292  005b 2705          	jreq	L501
 293                     ; 218     CLK->ICKCR |= CLK_ICKCR_LSION;
 295  005d 721450c2      	bset	20674,#2
 298  0061 81            	ret	
 299  0062               L501:
 300                     ; 223     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 302  0062 721550c2      	bres	20674,#2
 303                     ; 225 }
 306  0066 81            	ret	
 368                     ; 246 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 368                     ; 247 {
 369                     	switch	.text
 370  0067               _CLK_HSEConfig:
 374                     ; 249   assert_param(IS_CLK_HSE(CLK_HSE));
 376                     ; 253   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 378  0067 721150c6      	bres	20678,#0
 379                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 381  006b 721950c6      	bres	20678,#4
 382                     ; 259   CLK->ECKCR |= (uint8_t)CLK_HSE;
 384  006f ca50c6        	or	a,20678
 385  0072 c750c6        	ld	20678,a
 386                     ; 260 }
 389  0075 81            	ret	
 451                     ; 277 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 451                     ; 278 {
 452                     	switch	.text
 453  0076               _CLK_LSEConfig:
 457                     ; 280   assert_param(IS_CLK_LSE(CLK_LSE));
 459                     ; 284   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 461  0076 721550c6      	bres	20678,#2
 462                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 464  007a 721b50c6      	bres	20678,#5
 465                     ; 290   CLK->ECKCR |= (uint8_t)CLK_LSE;
 467  007e ca50c6        	or	a,20678
 468  0081 c750c6        	ld	20678,a
 469                     ; 292 }
 472  0084 81            	ret	
 496                     ; 303 void CLK_ClockSecuritySystemEnable(void)
 496                     ; 304 {
 497                     	switch	.text
 498  0085               _CLK_ClockSecuritySystemEnable:
 502                     ; 306   CLK->CSSR |= CLK_CSSR_CSSEN;
 504  0085 721050ca      	bset	20682,#0
 505                     ; 307 }
 508  0089 81            	ret	
 544                     ; 314 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 544                     ; 315 {
 545                     	switch	.text
 546  008a               _CLK_ClockSecuritySytemDeglitchCmd:
 550                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 552                     ; 319   if (NewState != DISABLE)
 554  008a 4d            	tnz	a
 555  008b 2705          	jreq	L712
 556                     ; 322     CLK->CSSR |= CLK_CSSR_CSSDGON;
 558  008d 721850ca      	bset	20682,#4
 561  0091 81            	ret	
 562  0092               L712:
 563                     ; 327     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 565  0092 721950ca      	bres	20682,#4
 566                     ; 329 }
 569  0096 81            	ret	
 710                     ; 353 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 710                     ; 354 {
 711                     	switch	.text
 712  0097               _CLK_CCOConfig:
 714  0097 89            	pushw	x
 715       00000000      OFST:	set	0
 718                     ; 356   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 720                     ; 357   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 722                     ; 360   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 724  0098 9f            	ld	a,xl
 725  0099 1a01          	or	a,(OFST+1,sp)
 726  009b c750c5        	ld	20677,a
 727                     ; 361 }
 730  009e 85            	popw	x
 731  009f 81            	ret	
 805                     ; 413 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 805                     ; 414 {
 806                     	switch	.text
 807  00a0               _CLK_SYSCLKSourceConfig:
 811                     ; 416   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 813                     ; 419   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 815  00a0 c750c8        	ld	20680,a
 816                     ; 420 }
 819  00a3 81            	ret	
 844                     ; 432 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 844                     ; 433 {
 845                     	switch	.text
 846  00a4               _CLK_GetSYSCLKSource:
 850                     ; 434   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 852  00a4 c650c7        	ld	a,20679
 855  00a7 81            	ret	
 919                     ; 475 uint32_t CLK_GetClockFreq(void)
 919                     ; 476 {
 920                     	switch	.text
 921  00a8               _CLK_GetClockFreq:
 923  00a8 5209          	subw	sp,#9
 924       00000009      OFST:	set	9
 927                     ; 477   uint32_t clockfrequency = 0;
 929                     ; 478   uint32_t sourcefrequency = 0;
 931  00aa 5f            	clrw	x
 932  00ab 1f07          	ldw	(OFST-2,sp),x
 933  00ad 1f05          	ldw	(OFST-4,sp),x
 934                     ; 479   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 936                     ; 480   uint8_t tmp = 0, presc = 0;
 940                     ; 483   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 942  00af c650c7        	ld	a,20679
 943  00b2 6b09          	ld	(OFST+0,sp),a
 944                     ; 485   if ( clocksource == CLK_SYSCLKSource_HSI)
 946  00b4 a101          	cp	a,#1
 947                     ; 487     sourcefrequency = HSI_VALUE;
 949  00b6 2710          	jreq	LC002
 950                     ; 489   else if ( clocksource == CLK_SYSCLKSource_LSI)
 952  00b8 a102          	cp	a,#2
 953  00ba 2608          	jrne	L104
 954                     ; 491     sourcefrequency = LSI_VALUE;
 956  00bc ae9470        	ldw	x,#38000
 957  00bf 1f07          	ldw	(OFST-2,sp),x
 958  00c1 5f            	clrw	x
 960  00c2 200c          	jp	LC001
 961  00c4               L104:
 962                     ; 493   else if ( clocksource == CLK_SYSCLKSource_HSE)
 964  00c4 a104          	cp	a,#4
 965  00c6 260a          	jrne	L504
 966                     ; 495     sourcefrequency = HSE_VALUE;
 968  00c8               LC002:
 970  00c8 ae2400        	ldw	x,#9216
 971  00cb 1f07          	ldw	(OFST-2,sp),x
 972  00cd ae00f4        	ldw	x,#244
 973  00d0               LC001:
 974  00d0 1f05          	ldw	(OFST-4,sp),x
 976  00d2               L504:
 977                     ; 499     clockfrequency = LSE_VALUE;
 979                     ; 503   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 981  00d2 c650c0        	ld	a,20672
 982  00d5 a407          	and	a,#7
 983                     ; 504   presc = SYSDivFactor[tmp];
 985  00d7 5f            	clrw	x
 986  00d8 97            	ld	xl,a
 987  00d9 d60000        	ld	a,(_SYSDivFactor,x)
 988  00dc 6b09          	ld	(OFST+0,sp),a
 989                     ; 507   clockfrequency = sourcefrequency / presc;
 991  00de b703          	ld	c_lreg+3,a
 992  00e0 3f02          	clr	c_lreg+2
 993  00e2 3f01          	clr	c_lreg+1
 994  00e4 3f00          	clr	c_lreg
 995  00e6 96            	ldw	x,sp
 996  00e7 5c            	incw	x
 997  00e8 cd0000        	call	c_rtol
 999  00eb 96            	ldw	x,sp
1000  00ec 1c0005        	addw	x,#OFST-4
1001  00ef cd0000        	call	c_ltor
1003  00f2 96            	ldw	x,sp
1004  00f3 5c            	incw	x
1005  00f4 cd0000        	call	c_ludv
1007  00f7 96            	ldw	x,sp
1008  00f8 1c0005        	addw	x,#OFST-4
1009  00fb cd0000        	call	c_rtol
1011                     ; 509   return((uint32_t)clockfrequency);
1013  00fe 96            	ldw	x,sp
1014  00ff 1c0005        	addw	x,#OFST-4
1015  0102 cd0000        	call	c_ltor
1019  0105 5b09          	addw	sp,#9
1020  0107 81            	ret	
1118                     ; 525 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1118                     ; 526 {
1119                     	switch	.text
1120  0108               _CLK_SYSCLKDivConfig:
1124                     ; 528   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1126                     ; 530   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1128  0108 c750c0        	ld	20672,a
1129                     ; 531 }
1132  010b 81            	ret	
1168                     ; 538 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1168                     ; 539 {
1169                     	switch	.text
1170  010c               _CLK_SYSCLKSourceSwitchCmd:
1174                     ; 541   assert_param(IS_FUNCTIONAL_STATE(NewState));
1176                     ; 543   if (NewState != DISABLE)
1178  010c 4d            	tnz	a
1179  010d 2705          	jreq	L174
1180                     ; 546     CLK->SWCR |= CLK_SWCR_SWEN;
1182  010f 721250c9      	bset	20681,#1
1185  0113 81            	ret	
1186  0114               L174:
1187                     ; 551     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1189  0114 721350c9      	bres	20681,#1
1190                     ; 553 }
1193  0118 81            	ret	
1339                     ; 613 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1339                     ; 614 {
1340                     	switch	.text
1341  0119               _CLK_RTCClockConfig:
1343  0119 89            	pushw	x
1344       00000000      OFST:	set	0
1347                     ; 616   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1349                     ; 617   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1351                     ; 620   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1353  011a 9f            	ld	a,xl
1354  011b 1a01          	or	a,(OFST+1,sp)
1355  011d c750c1        	ld	20673,a
1356                     ; 621 }
1359  0120 85            	popw	x
1360  0121 81            	ret	
1426                     ; 632 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1426                     ; 633 {
1427                     	switch	.text
1428  0122               _CLK_BEEPClockConfig:
1432                     ; 635   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1434                     ; 638   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1436  0122 c750cb        	ld	20683,a
1437                     ; 640 }
1440  0125 81            	ret	
1663                     ; 674 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1663                     ; 675 {
1664                     	switch	.text
1665  0126               _CLK_PeripheralClockConfig:
1667  0126 89            	pushw	x
1668  0127 88            	push	a
1669       00000001      OFST:	set	1
1672                     ; 676   uint8_t reg = 0;
1674                     ; 679   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1676                     ; 680   assert_param(IS_FUNCTIONAL_STATE(NewState));
1678                     ; 683   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1680  0128 9e            	ld	a,xh
1681  0129 a4f0          	and	a,#240
1682  012b 6b01          	ld	(OFST+0,sp),a
1683                     ; 685   if ( reg == 0x00)
1685  012d 2629          	jrne	L117
1686                     ; 687     if (NewState != DISABLE)
1688  012f 7b03          	ld	a,(OFST+2,sp)
1689  0131 2712          	jreq	L317
1690                     ; 690       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1692  0133 7b02          	ld	a,(OFST+1,sp)
1693  0135 ad72          	call	LC005
1694  0137 2704          	jreq	L64
1695  0139               L05:
1696  0139 48            	sll	a
1697  013a 5a            	decw	x
1698  013b 26fc          	jrne	L05
1699  013d               L64:
1700  013d ca50c3        	or	a,20675
1701  0140 c750c3        	ld	20675,a
1703  0143 2061          	jra	L717
1704  0145               L317:
1705                     ; 695       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1707  0145 7b02          	ld	a,(OFST+1,sp)
1708  0147 ad60          	call	LC005
1709  0149 2704          	jreq	L25
1710  014b               L45:
1711  014b 48            	sll	a
1712  014c 5a            	decw	x
1713  014d 26fc          	jrne	L45
1714  014f               L25:
1715  014f 43            	cpl	a
1716  0150 c450c3        	and	a,20675
1717  0153 c750c3        	ld	20675,a
1718  0156 204e          	jra	L717
1719  0158               L117:
1720                     ; 698   else if (reg == 0x10)
1722  0158 a110          	cp	a,#16
1723  015a 2626          	jrne	L127
1724                     ; 700     if (NewState != DISABLE)
1726  015c 7b03          	ld	a,(OFST+2,sp)
1727  015e 270f          	jreq	L327
1728                     ; 703       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1730  0160 7b02          	ld	a,(OFST+1,sp)
1731  0162 ad45          	call	LC005
1732  0164 2704          	jreq	L65
1733  0166               L06:
1734  0166 48            	sll	a
1735  0167 5a            	decw	x
1736  0168 26fc          	jrne	L06
1737  016a               L65:
1738  016a ca50c4        	or	a,20676
1740  016d 200e          	jp	LC004
1741  016f               L327:
1742                     ; 708       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1744  016f 7b02          	ld	a,(OFST+1,sp)
1745  0171 ad36          	call	LC005
1746  0173 2704          	jreq	L26
1747  0175               L46:
1748  0175 48            	sll	a
1749  0176 5a            	decw	x
1750  0177 26fc          	jrne	L46
1751  0179               L26:
1752  0179 43            	cpl	a
1753  017a c450c4        	and	a,20676
1754  017d               LC004:
1755  017d c750c4        	ld	20676,a
1756  0180 2024          	jra	L717
1757  0182               L127:
1758                     ; 713     if (NewState != DISABLE)
1760  0182 7b03          	ld	a,(OFST+2,sp)
1761  0184 270f          	jreq	L137
1762                     ; 716       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1764  0186 7b02          	ld	a,(OFST+1,sp)
1765  0188 ad1f          	call	LC005
1766  018a 2704          	jreq	L66
1767  018c               L07:
1768  018c 48            	sll	a
1769  018d 5a            	decw	x
1770  018e 26fc          	jrne	L07
1771  0190               L66:
1772  0190 ca50d0        	or	a,20688
1774  0193 200e          	jp	LC003
1775  0195               L137:
1776                     ; 721       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1778  0195 7b02          	ld	a,(OFST+1,sp)
1779  0197 ad10          	call	LC005
1780  0199 2704          	jreq	L27
1781  019b               L47:
1782  019b 48            	sll	a
1783  019c 5a            	decw	x
1784  019d 26fc          	jrne	L47
1785  019f               L27:
1786  019f 43            	cpl	a
1787  01a0 c450d0        	and	a,20688
1788  01a3               LC003:
1789  01a3 c750d0        	ld	20688,a
1790  01a6               L717:
1791                     ; 724 }
1794  01a6 5b03          	addw	sp,#3
1795  01a8 81            	ret	
1796  01a9               LC005:
1797  01a9 a40f          	and	a,#15
1798  01ab 5f            	clrw	x
1799  01ac 97            	ld	xl,a
1800  01ad a601          	ld	a,#1
1801  01af 5d            	tnzw	x
1802  01b0 81            	ret	
1826                     ; 762 void CLK_LSEClockSecuritySystemEnable(void)
1826                     ; 763 {
1827                     	switch	.text
1828  01b1               _CLK_LSEClockSecuritySystemEnable:
1832                     ; 765   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1834  01b1 72105190      	bset	20880,#0
1835                     ; 766 }
1838  01b5 81            	ret	
1862                     ; 774 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1862                     ; 775 {
1863                     	switch	.text
1864  01b6               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1868                     ; 777   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1870  01b6 72125190      	bset	20880,#1
1871                     ; 778 }
1874  01ba 81            	ret	
1949                     ; 804 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1949                     ; 805 {
1950                     	switch	.text
1951  01bb               _CLK_HaltConfig:
1953  01bb 89            	pushw	x
1954       00000000      OFST:	set	0
1957                     ; 807   assert_param(IS_CLK_HALT(CLK_Halt));
1959                     ; 808   assert_param(IS_FUNCTIONAL_STATE(NewState));
1961                     ; 810   if (NewState != DISABLE)
1963  01bc 9f            	ld	a,xl
1964  01bd 4d            	tnz	a
1965  01be 2706          	jreq	L1101
1966                     ; 812     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1968  01c0 9e            	ld	a,xh
1969  01c1 ca50c2        	or	a,20674
1971  01c4 2006          	jra	L3101
1972  01c6               L1101:
1973                     ; 816     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1975  01c6 7b01          	ld	a,(OFST+1,sp)
1976  01c8 43            	cpl	a
1977  01c9 c450c2        	and	a,20674
1978  01cc               L3101:
1979  01cc c750c2        	ld	20674,a
1980                     ; 818 }
1983  01cf 85            	popw	x
1984  01d0 81            	ret	
2020                     ; 828 void CLK_MainRegulatorCmd(FunctionalState NewState)
2020                     ; 829 {
2021                     	switch	.text
2022  01d1               _CLK_MainRegulatorCmd:
2026                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2028                     ; 833   if (NewState != DISABLE)
2030  01d1 4d            	tnz	a
2031  01d2 2705          	jreq	L3301
2032                     ; 836     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2034  01d4 721350cf      	bres	20687,#1
2037  01d8 81            	ret	
2038  01d9               L3301:
2039                     ; 841     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2041  01d9 721250cf      	bset	20687,#1
2042                     ; 843 }
2045  01dd 81            	ret	
2117                     ; 872 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2117                     ; 873 {
2118                     	switch	.text
2119  01de               _CLK_ITConfig:
2121  01de 89            	pushw	x
2122       00000000      OFST:	set	0
2125                     ; 876   assert_param(IS_CLK_IT(CLK_IT));
2127                     ; 877   assert_param(IS_FUNCTIONAL_STATE(NewState));
2129                     ; 879   if (NewState != DISABLE)
2131  01df 9f            	ld	a,xl
2132  01e0 4d            	tnz	a
2133  01e1 271d          	jreq	L3701
2134                     ; 881     if (CLK_IT == CLK_IT_SWIF)
2136  01e3 9e            	ld	a,xh
2137  01e4 a11c          	cp	a,#28
2138  01e6 2606          	jrne	L5701
2139                     ; 884       CLK->SWCR |= CLK_SWCR_SWIEN;
2141  01e8 721450c9      	bset	20681,#2
2143  01ec 202c          	jra	L5011
2144  01ee               L5701:
2145                     ; 886     else if (CLK_IT == CLK_IT_LSECSSF)
2147  01ee 7b01          	ld	a,(OFST+1,sp)
2148  01f0 a12c          	cp	a,#44
2149  01f2 2606          	jrne	L1011
2150                     ; 889       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2152  01f4 72145190      	bset	20880,#2
2154  01f8 2020          	jra	L5011
2155  01fa               L1011:
2156                     ; 894       CLK->CSSR |= CLK_CSSR_CSSDIE;
2158  01fa 721450ca      	bset	20682,#2
2159  01fe 201a          	jra	L5011
2160  0200               L3701:
2161                     ; 899     if (CLK_IT == CLK_IT_SWIF)
2163  0200 7b01          	ld	a,(OFST+1,sp)
2164  0202 a11c          	cp	a,#28
2165  0204 2606          	jrne	L7011
2166                     ; 902       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2168  0206 721550c9      	bres	20681,#2
2170  020a 200e          	jra	L5011
2171  020c               L7011:
2172                     ; 904     else if (CLK_IT == CLK_IT_LSECSSF)
2174  020c a12c          	cp	a,#44
2175  020e 2606          	jrne	L3111
2176                     ; 907       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2178  0210 72155190      	bres	20880,#2
2180  0214 2004          	jra	L5011
2181  0216               L3111:
2182                     ; 912       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2184  0216 721550ca      	bres	20682,#2
2185  021a               L5011:
2186                     ; 915 }
2189  021a 85            	popw	x
2190  021b 81            	ret	
2409                     ; 942 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2409                     ; 943 {
2410                     	switch	.text
2411  021c               _CLK_GetFlagStatus:
2413  021c 88            	push	a
2414  021d 89            	pushw	x
2415       00000002      OFST:	set	2
2418                     ; 944   uint8_t reg = 0;
2420                     ; 945   uint8_t pos = 0;
2422                     ; 946   FlagStatus bitstatus = RESET;
2424                     ; 949   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2426                     ; 952   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2428  021e a4f0          	and	a,#240
2429  0220 6b02          	ld	(OFST+0,sp),a
2430                     ; 955   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2432  0222 7b03          	ld	a,(OFST+1,sp)
2433  0224 a40f          	and	a,#15
2434  0226 6b01          	ld	(OFST-1,sp),a
2435                     ; 957   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2437  0228 7b02          	ld	a,(OFST+0,sp)
2438  022a 2605          	jrne	L7221
2439                     ; 959     reg = CLK->CRTCR;
2441  022c c650c1        	ld	a,20673
2443  022f 2042          	jra	L1321
2444  0231               L7221:
2445                     ; 961   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2447  0231 a110          	cp	a,#16
2448  0233 2605          	jrne	L3321
2449                     ; 963     reg = CLK->ICKCR;
2451  0235 c650c2        	ld	a,20674
2453  0238 2039          	jra	L1321
2454  023a               L3321:
2455                     ; 965   else if (reg == 0x20) /* The flag to check is in CCOR register */
2457  023a a120          	cp	a,#32
2458  023c 2605          	jrne	L7321
2459                     ; 967     reg = CLK->CCOR;
2461  023e c650c5        	ld	a,20677
2463  0241 2030          	jra	L1321
2464  0243               L7321:
2465                     ; 969   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2467  0243 a130          	cp	a,#48
2468  0245 2605          	jrne	L3421
2469                     ; 971     reg = CLK->ECKCR;
2471  0247 c650c6        	ld	a,20678
2473  024a 2027          	jra	L1321
2474  024c               L3421:
2475                     ; 973   else if (reg == 0x40) /* The flag to check is in SWCR register */
2477  024c a140          	cp	a,#64
2478  024e 2605          	jrne	L7421
2479                     ; 975     reg = CLK->SWCR;
2481  0250 c650c9        	ld	a,20681
2483  0253 201e          	jra	L1321
2484  0255               L7421:
2485                     ; 977   else if (reg == 0x50) /* The flag to check is in CSSR register */
2487  0255 a150          	cp	a,#80
2488  0257 2605          	jrne	L3521
2489                     ; 979     reg = CLK->CSSR;
2491  0259 c650ca        	ld	a,20682
2493  025c 2015          	jra	L1321
2494  025e               L3521:
2495                     ; 981   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2497  025e a170          	cp	a,#112
2498  0260 2605          	jrne	L7521
2499                     ; 983     reg = CLK->REGCSR;
2501  0262 c650cf        	ld	a,20687
2503  0265 200c          	jra	L1321
2504  0267               L7521:
2505                     ; 985   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2507  0267 a180          	cp	a,#128
2508  0269 2605          	jrne	L3621
2509                     ; 987     reg = CSSLSE->CSR;
2511  026b c65190        	ld	a,20880
2513  026e 2003          	jra	L1321
2514  0270               L3621:
2515                     ; 991     reg = CLK->CBEEPR;
2517  0270 c650cb        	ld	a,20683
2518  0273               L1321:
2519  0273 6b02          	ld	(OFST+0,sp),a
2520                     ; 995   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2522  0275 5f            	clrw	x
2523  0276 7b01          	ld	a,(OFST-1,sp)
2524  0278 97            	ld	xl,a
2525  0279 a601          	ld	a,#1
2526  027b 5d            	tnzw	x
2527  027c 2704          	jreq	L211
2528  027e               L411:
2529  027e 48            	sll	a
2530  027f 5a            	decw	x
2531  0280 26fc          	jrne	L411
2532  0282               L211:
2533  0282 1402          	and	a,(OFST+0,sp)
2534  0284 2702          	jreq	L7621
2535                     ; 997     bitstatus = SET;
2537  0286 a601          	ld	a,#1
2539  0288               L7621:
2540                     ; 1001     bitstatus = RESET;
2542                     ; 1005   return((FlagStatus)bitstatus);
2546  0288 5b03          	addw	sp,#3
2547  028a 81            	ret	
2570                     ; 1013 void CLK_ClearFlag(void)
2570                     ; 1014 {
2571                     	switch	.text
2572  028b               _CLK_ClearFlag:
2576                     ; 1017   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2578  028b 72175190      	bres	20880,#3
2579                     ; 1018 }
2582  028f 81            	ret	
2628                     ; 1029 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2628                     ; 1030 {
2629                     	switch	.text
2630  0290               _CLK_GetITStatus:
2632  0290 88            	push	a
2633  0291 88            	push	a
2634       00000001      OFST:	set	1
2637                     ; 1032   ITStatus bitstatus = RESET;
2639                     ; 1035   assert_param(IS_CLK_IT(CLK_IT));
2641                     ; 1037   if (CLK_IT == CLK_IT_SWIF)
2643  0292 a11c          	cp	a,#28
2644  0294 2605          	jrne	L5231
2645                     ; 1040     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2647  0296 c450c9        	and	a,20681
2648                     ; 1042       bitstatus = SET;
2650  0299 200b          	jp	LC008
2651                     ; 1046       bitstatus = RESET;
2652  029b               L5231:
2653                     ; 1049   else if (CLK_IT == CLK_IT_LSECSSF)
2655  029b 7b02          	ld	a,(OFST+1,sp)
2656  029d a12c          	cp	a,#44
2657  029f 260d          	jrne	L5331
2658                     ; 1052     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2660  02a1 c65190        	ld	a,20880
2661  02a4 1402          	and	a,(OFST+1,sp)
2662  02a6               LC008:
2663  02a6 a10c          	cp	a,#12
2664  02a8 260d          	jrne	L5431
2665                     ; 1054       bitstatus = SET;
2667  02aa               LC007:
2670  02aa a601          	ld	a,#1
2672  02ac 200a          	jra	L3331
2673                     ; 1058       bitstatus = RESET;
2674  02ae               L5331:
2675                     ; 1064     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2677  02ae c650ca        	ld	a,20682
2678  02b1 1402          	and	a,(OFST+1,sp)
2679  02b3 a10c          	cp	a,#12
2680                     ; 1066       bitstatus = SET;
2682  02b5 27f3          	jreq	LC007
2683  02b7               L5431:
2684                     ; 1070       bitstatus = RESET;
2688  02b7 4f            	clr	a
2689  02b8               L3331:
2690                     ; 1075   return bitstatus;
2694  02b8 85            	popw	x
2695  02b9 81            	ret	
2731                     ; 1086 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2731                     ; 1087 {
2732                     	switch	.text
2733  02ba               _CLK_ClearITPendingBit:
2737                     ; 1090   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2739                     ; 1092   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2741  02ba a4f0          	and	a,#240
2742  02bc a120          	cp	a,#32
2743  02be 2605          	jrne	L7631
2744                     ; 1095     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2746  02c0 72175190      	bres	20880,#3
2749  02c4 81            	ret	
2750  02c5               L7631:
2751                     ; 1100     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2753  02c5 721750c9      	bres	20681,#3
2754                     ; 1102 }
2757  02c9 81            	ret	
2782                     	xdef	_SYSDivFactor
2783                     	xdef	_CLK_ClearITPendingBit
2784                     	xdef	_CLK_GetITStatus
2785                     	xdef	_CLK_ClearFlag
2786                     	xdef	_CLK_GetFlagStatus
2787                     	xdef	_CLK_ITConfig
2788                     	xdef	_CLK_MainRegulatorCmd
2789                     	xdef	_CLK_HaltConfig
2790                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2791                     	xdef	_CLK_LSEClockSecuritySystemEnable
2792                     	xdef	_CLK_PeripheralClockConfig
2793                     	xdef	_CLK_BEEPClockConfig
2794                     	xdef	_CLK_RTCClockConfig
2795                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2796                     	xdef	_CLK_SYSCLKDivConfig
2797                     	xdef	_CLK_GetClockFreq
2798                     	xdef	_CLK_GetSYSCLKSource
2799                     	xdef	_CLK_SYSCLKSourceConfig
2800                     	xdef	_CLK_CCOConfig
2801                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2802                     	xdef	_CLK_ClockSecuritySystemEnable
2803                     	xdef	_CLK_LSEConfig
2804                     	xdef	_CLK_HSEConfig
2805                     	xdef	_CLK_LSICmd
2806                     	xdef	_CLK_AdjustHSICalibrationValue
2807                     	xdef	_CLK_HSICmd
2808                     	xdef	_CLK_DeInit
2809                     	xref.b	c_lreg
2810                     	xref.b	c_x
2829                     	xref	c_ludv
2830                     	xref	c_rtol
2831                     	xref	c_ltor
2832                     	end
