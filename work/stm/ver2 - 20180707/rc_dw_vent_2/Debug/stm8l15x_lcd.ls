   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  59                     ; 118 void LCD_DeInit(void)
  59                     ; 119 {
  60                     .text:	section	.text,new
  61  0000               f_LCD_DeInit:
  63  0000 88            	push	a
  64       00000001      OFST:	set	1
  67                     ; 120   uint8_t counter = 0;
  69                     ; 122   LCD->CR1 = LCD_CR1_RESET_VALUE;
  71  0001 725f5400      	clr	21504
  72                     ; 123   LCD->CR2 = LCD_CR2_RESET_VALUE;
  74  0005 725f5401      	clr	21505
  75                     ; 124   LCD->CR3 = LCD_CR3_RESET_VALUE;
  77  0009 725f5402      	clr	21506
  78                     ; 125   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  80  000d 725f5403      	clr	21507
  81                     ; 127   for (counter = 0;counter < 0x05; counter++)
  83  0011 4f            	clr	a
  84  0012 6b01          	ld	(OFST+0,sp),a
  85  0014               L52:
  86                     ; 129     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  88  0014 5f            	clrw	x
  89  0015 97            	ld	xl,a
  90  0016 724f5404      	clr	(21508,x)
  91                     ; 127   for (counter = 0;counter < 0x05; counter++)
  93  001a 0c01          	inc	(OFST+0,sp)
  96  001c 7b01          	ld	a,(OFST+0,sp)
  97  001e a105          	cp	a,#5
  98  0020 25f2          	jrult	L52
  99                     ; 132   for (counter = 0;counter < 0x16; counter++)
 101  0022 4f            	clr	a
 102  0023 6b01          	ld	(OFST+0,sp),a
 103  0025               L33:
 104                     ; 134     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 106  0025 5f            	clrw	x
 107  0026 97            	ld	xl,a
 108  0027 724f540c      	clr	(21516,x)
 109                     ; 132   for (counter = 0;counter < 0x16; counter++)
 111  002b 0c01          	inc	(OFST+0,sp)
 114  002d 7b01          	ld	a,(OFST+0,sp)
 115  002f a116          	cp	a,#22
 116  0031 25f2          	jrult	L33
 117                     ; 137   LCD->CR4 = LCD_CR4_RESET_VALUE;
 119  0033 725f542f      	clr	21551
 120                     ; 139 }
 123  0037 84            	pop	a
 124  0038 87            	retf	
 526                     ; 197 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 526                     ; 198               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 526                     ; 199               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 526                     ; 200 {
 527                     .text:	section	.text,new
 528  0000               f_LCD_Init:
 530  0000 89            	pushw	x
 531       00000000      OFST:	set	0
 534                     ; 202   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 536                     ; 203   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 538                     ; 204   assert_param(IS_LCD_DUTY(LCD_Duty));
 540                     ; 205   assert_param(IS_LCD_BIAS(LCD_Bias));
 542                     ; 206   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 544                     ; 208   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 546  0001 c65403        	ld	a,21507
 547  0004 a40f          	and	a,#15
 548  0006 c75403        	ld	21507,a
 549                     ; 209   LCD->FRQ |= LCD_Prescaler;
 551  0009 9e            	ld	a,xh
 552  000a ca5403        	or	a,21507
 553  000d c75403        	ld	21507,a
 554                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 556  0010 c65403        	ld	a,21507
 557  0013 a4f0          	and	a,#240
 558  0015 c75403        	ld	21507,a
 559                     ; 212   LCD->FRQ |= LCD_Divider;
 561  0018 9f            	ld	a,xl
 562  0019 ca5403        	or	a,21507
 563  001c c75403        	ld	21507,a
 564                     ; 215   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 566  001f c65400        	ld	a,21504
 567  0022 a4f9          	and	a,#249
 568  0024 c75400        	ld	21504,a
 569                     ; 216   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 571  0027 7213542f      	bres	21551,#1
 572                     ; 218   if (LCD_Duty == LCD_Duty_1_8)
 574  002b 7b06          	ld	a,(OFST+6,sp)
 575  002d a120          	cp	a,#32
 576  002f 260b          	jrne	L742
 577                     ; 220     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 579  0031 4e            	swap	a
 580  0032 a40f          	and	a,#15
 581  0034 ca542f        	or	a,21551
 582  0037 c7542f        	ld	21551,a
 584  003a 2004          	jra	L152
 585  003c               L742:
 586                     ; 224     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 588  003c 8d710071      	callf	LC001
 589  0040               L152:
 590                     ; 228   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 592  0040 72115400      	bres	21504,#0
 593                     ; 229   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 595  0044 7211542f      	bres	21551,#0
 596                     ; 231   if (LCD_Bias == LCD_Bias_1_4)
 598  0048 7b07          	ld	a,(OFST+7,sp)
 599  004a a110          	cp	a,#16
 600  004c 2611          	jrne	L352
 601                     ; 233     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 603  004e 8d710071      	callf	LC001
 604                     ; 234     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 606  0052 7b07          	ld	a,(OFST+7,sp)
 607  0054 4e            	swap	a
 608  0055 a40f          	and	a,#15
 609  0057 ca542f        	or	a,21551
 610  005a c7542f        	ld	21551,a
 612  005d 2004          	jra	L552
 613  005f               L352:
 614                     ; 238     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 616  005f 8d710071      	callf	LC001
 617  0063               L552:
 618                     ; 241   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 620  0063 72115401      	bres	21505,#0
 621                     ; 242   LCD->CR2 |= LCD_VoltageSource;
 623  0067 c65401        	ld	a,21505
 624  006a 1a08          	or	a,(OFST+8,sp)
 625  006c c75401        	ld	21505,a
 626                     ; 244 }
 629  006f 85            	popw	x
 630  0070 87            	retf	
 631  0071               LC001:
 632  0071 a40f          	and	a,#15
 633  0073 ca5400        	or	a,21504
 634  0076 c75400        	ld	21504,a
 635  0079 87            	retf	
 731                     ; 259 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 731                     ; 260 {
 732                     .text:	section	.text,new
 733  0000               f_LCD_PortMaskConfig:
 735  0000 89            	pushw	x
 736       00000000      OFST:	set	0
 739                     ; 262   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 741                     ; 265   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 743  0001 9e            	ld	a,xh
 744  0002 5f            	clrw	x
 745  0003 97            	ld	xl,a
 746  0004 7b02          	ld	a,(OFST+2,sp)
 747  0006 d75404        	ld	(21508,x),a
 748                     ; 267 }
 751  0009 85            	popw	x
 752  000a 87            	retf	
 806                     ; 276 void LCD_Cmd(FunctionalState NewState)
 806                     ; 277 {
 807                     .text:	section	.text,new
 808  0000               f_LCD_Cmd:
 812                     ; 279   assert_param(IS_FUNCTIONAL_STATE(NewState));
 814                     ; 281   if (NewState != DISABLE)
 816  0000 4d            	tnz	a
 817  0001 2705          	jreq	L543
 818                     ; 283     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 820  0003 721c5402      	bset	21506,#6
 823  0007 87            	retf	
 824  0008               L543:
 825                     ; 287     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 827  0008 721d5402      	bres	21506,#6
 828                     ; 289 }
 831  000c 87            	retf	
 865                     ; 302 void LCD_HighDriveCmd(FunctionalState NewState)
 865                     ; 303 {
 866                     .text:	section	.text,new
 867  0000               f_LCD_HighDriveCmd:
 871                     ; 305   assert_param(IS_FUNCTIONAL_STATE(NewState));
 873                     ; 307   if (NewState != DISABLE)
 875  0000 4d            	tnz	a
 876  0001 2705          	jreq	L763
 877                     ; 309     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 879  0003 72185401      	bset	21505,#4
 882  0007 87            	retf	
 883  0008               L763:
 884                     ; 313     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 886  0008 72195401      	bres	21505,#4
 887                     ; 315 }
 890  000c 87            	retf	
 996                     ; 332 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
 996                     ; 333 {
 997                     .text:	section	.text,new
 998  0000               f_LCD_PulseOnDurationConfig:
1000  0000 88            	push	a
1001       00000000      OFST:	set	0
1004                     ; 335   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1006                     ; 337   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1008  0001 c65401        	ld	a,21505
1009  0004 a41f          	and	a,#31
1010  0006 c75401        	ld	21505,a
1011                     ; 338   LCD->CR2 |= LCD_PulseOnDuration;
1013  0009 c65401        	ld	a,21505
1014  000c 1a01          	or	a,(OFST+1,sp)
1015  000e c75401        	ld	21505,a
1016                     ; 339 }
1019  0011 84            	pop	a
1020  0012 87            	retf	
1116                     ; 355 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1116                     ; 356 {
1117                     .text:	section	.text,new
1118  0000               f_LCD_DeadTimeConfig:
1120  0000 88            	push	a
1121       00000000      OFST:	set	0
1124                     ; 358   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1126                     ; 360   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1128  0001 c65402        	ld	a,21506
1129  0004 a4f8          	and	a,#248
1130  0006 c75402        	ld	21506,a
1131                     ; 362   LCD->CR3 |= LCD_DeadTime;
1133  0009 c65402        	ld	a,21506
1134  000c 1a01          	or	a,(OFST+1,sp)
1135  000e c75402        	ld	21506,a
1136                     ; 364 }
1139  0011 84            	pop	a
1140  0012 87            	retf	
1291                     ; 388 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1291                     ; 389 {
1292                     .text:	section	.text,new
1293  0000               f_LCD_BlinkConfig:
1297                     ; 391   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1299                     ; 392   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1301                     ; 394   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1303  0000 c65400        	ld	a,21504
1304  0003 a43f          	and	a,#63
1305  0005 c75400        	ld	21504,a
1306                     ; 395   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1308  0008 9e            	ld	a,xh
1309  0009 ca5400        	or	a,21504
1310  000c c75400        	ld	21504,a
1311                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1313  000f c65400        	ld	a,21504
1314  0012 a4c7          	and	a,#199
1315  0014 c75400        	ld	21504,a
1316                     ; 398   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1318  0017 9f            	ld	a,xl
1319  0018 ca5400        	or	a,21504
1320  001b c75400        	ld	21504,a
1321                     ; 400 }
1324  001e 87            	retf	
1428                     ; 416 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1428                     ; 417 {
1429                     .text:	section	.text,new
1430  0000               f_LCD_ContrastConfig:
1432  0000 88            	push	a
1433       00000000      OFST:	set	0
1436                     ; 419   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1438                     ; 421   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1440  0001 c65401        	ld	a,21505
1441  0004 a4f1          	and	a,#241
1442  0006 c75401        	ld	21505,a
1443                     ; 422   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1445  0009 c65401        	ld	a,21505
1446  000c 1a01          	or	a,(OFST+1,sp)
1447  000e c75401        	ld	21505,a
1448                     ; 424 }
1451  0011 84            	pop	a
1452  0012 87            	retf	
1653                     ; 471 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1653                     ; 472 {
1654                     .text:	section	.text,new
1655  0000               f_LCD_WriteRAM:
1657  0000 89            	pushw	x
1658       00000000      OFST:	set	0
1661                     ; 474   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1663                     ; 477   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1665  0001 9e            	ld	a,xh
1666  0002 5f            	clrw	x
1667  0003 97            	ld	xl,a
1668  0004 7b02          	ld	a,(OFST+2,sp)
1669  0006 d7540c        	ld	(21516,x),a
1670                     ; 479 }
1673  0009 85            	popw	x
1674  000a 87            	retf	
1730                     ; 489 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1730                     ; 490 {
1731                     .text:	section	.text,new
1732  0000               f_LCD_PageSelect:
1736                     ; 492   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1738                     ; 494   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1740  0000 7215542f      	bres	21551,#2
1741                     ; 495   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1743  0004 ca542f        	or	a,21551
1744  0007 c7542f        	ld	21551,a
1745                     ; 497 }
1748  000a 87            	retf	
1782                     ; 522 void LCD_ITConfig(FunctionalState NewState)
1782                     ; 523 {
1783                     .text:	section	.text,new
1784  0000               f_LCD_ITConfig:
1788                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1790                     ; 527   if (NewState != DISABLE)
1792  0000 4d            	tnz	a
1793  0001 2705          	jreq	L767
1794                     ; 529     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1796  0003 721a5402      	bset	21506,#5
1799  0007 87            	retf	
1800  0008               L767:
1801                     ; 533     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1803  0008 721b5402      	bres	21506,#5
1804                     ; 536 }
1807  000c 87            	retf	
1862                     ; 543 FlagStatus LCD_GetFlagStatus(void)
1862                     ; 544 {
1863                     .text:	section	.text,new
1864  0000               f_LCD_GetFlagStatus:
1866  0000 88            	push	a
1867       00000001      OFST:	set	1
1870                     ; 545   FlagStatus status = RESET;
1872                     ; 548   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1874  0001 7209540204    	btjf	21506,#4,L1201
1875                     ; 550     status = SET; /* Flag is set */
1877  0006 a601          	ld	a,#1
1879  0008 2001          	jra	L3201
1880  000a               L1201:
1881                     ; 554     status = RESET; /* Flag is reset*/
1883  000a 4f            	clr	a
1884  000b               L3201:
1885                     ; 557   return status;
1889  000b 5b01          	addw	sp,#1
1890  000d 87            	retf	
1912                     ; 566 void LCD_ClearFlag(void)
1912                     ; 567 {
1913                     .text:	section	.text,new
1914  0000               f_LCD_ClearFlag:
1918                     ; 569   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1920  0000 72165402      	bset	21506,#3
1921                     ; 571 }
1924  0004 87            	retf	
1966                     ; 579 ITStatus LCD_GetITStatus(void)
1966                     ; 580 {
1967                     .text:	section	.text,new
1968  0000               f_LCD_GetITStatus:
1970  0000 88            	push	a
1971       00000001      OFST:	set	1
1974                     ; 581   ITStatus pendingbitstatus = RESET;
1976                     ; 582   uint8_t enablestatus = 0;
1978                     ; 584   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
1980  0001 c65402        	ld	a,21506
1981  0004 a420          	and	a,#32
1982  0006 6b01          	ld	(OFST+0,sp),a
1983                     ; 586   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
1985  0008 7209540206    	btjf	21506,#4,L5501
1987  000d 2704          	jreq	L5501
1988                     ; 589     pendingbitstatus = SET;
1990  000f a601          	ld	a,#1
1992  0011 2001          	jra	L7501
1993  0013               L5501:
1994                     ; 594     pendingbitstatus = RESET;
1996  0013 4f            	clr	a
1997  0014               L7501:
1998                     ; 597   return  pendingbitstatus;
2002  0014 5b01          	addw	sp,#1
2003  0016 87            	retf	
2026                     ; 606 void LCD_ClearITPendingBit(void)
2026                     ; 607 {
2027                     .text:	section	.text,new
2028  0000               f_LCD_ClearITPendingBit:
2032                     ; 609   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2034  0000 72165402      	bset	21506,#3
2035                     ; 611 }
2038  0004 87            	retf	
2050                     	xdef	f_LCD_ClearITPendingBit
2051                     	xdef	f_LCD_GetITStatus
2052                     	xdef	f_LCD_ClearFlag
2053                     	xdef	f_LCD_GetFlagStatus
2054                     	xdef	f_LCD_ITConfig
2055                     	xdef	f_LCD_PageSelect
2056                     	xdef	f_LCD_WriteRAM
2057                     	xdef	f_LCD_ContrastConfig
2058                     	xdef	f_LCD_BlinkConfig
2059                     	xdef	f_LCD_DeadTimeConfig
2060                     	xdef	f_LCD_PulseOnDurationConfig
2061                     	xdef	f_LCD_HighDriveCmd
2062                     	xdef	f_LCD_Cmd
2063                     	xdef	f_LCD_PortMaskConfig
2064                     	xdef	f_LCD_Init
2065                     	xdef	f_LCD_DeInit
2084                     	end
