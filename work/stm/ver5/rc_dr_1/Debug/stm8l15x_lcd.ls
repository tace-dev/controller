   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  59                     ; 118 void LCD_DeInit(void)
  59                     ; 119 {
  61                     .text:	section	.text,new
  62  0000               _LCD_DeInit:
  64  0000 88            	push	a
  65       00000001      OFST:	set	1
  68                     ; 120   uint8_t counter = 0;
  70                     ; 122   LCD->CR1 = LCD_CR1_RESET_VALUE;
  72  0001 725f5400      	clr	21504
  73                     ; 123   LCD->CR2 = LCD_CR2_RESET_VALUE;
  75  0005 725f5401      	clr	21505
  76                     ; 124   LCD->CR3 = LCD_CR3_RESET_VALUE;
  78  0009 725f5402      	clr	21506
  79                     ; 125   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  81  000d 725f5403      	clr	21507
  82                     ; 127   for (counter = 0;counter < 0x05; counter++)
  84  0011 4f            	clr	a
  85  0012 6b01          	ld	(OFST+0,sp),a
  87  0014               L52:
  88                     ; 129     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  90  0014 5f            	clrw	x
  91  0015 97            	ld	xl,a
  92  0016 724f5404      	clr	(21508,x)
  93                     ; 127   for (counter = 0;counter < 0x05; counter++)
  95  001a 0c01          	inc	(OFST+0,sp)
  99  001c 7b01          	ld	a,(OFST+0,sp)
 100  001e a105          	cp	a,#5
 101  0020 25f2          	jrult	L52
 102                     ; 132   for (counter = 0;counter < 0x16; counter++)
 104  0022 4f            	clr	a
 105  0023 6b01          	ld	(OFST+0,sp),a
 107  0025               L33:
 108                     ; 134     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 110  0025 5f            	clrw	x
 111  0026 97            	ld	xl,a
 112  0027 724f540c      	clr	(21516,x)
 113                     ; 132   for (counter = 0;counter < 0x16; counter++)
 115  002b 0c01          	inc	(OFST+0,sp)
 119  002d 7b01          	ld	a,(OFST+0,sp)
 120  002f a116          	cp	a,#22
 121  0031 25f2          	jrult	L33
 122                     ; 137   LCD->CR4 = LCD_CR4_RESET_VALUE;
 124  0033 725f542f      	clr	21551
 125                     ; 139 }
 128  0037 84            	pop	a
 129  0038 81            	ret	
 532                     ; 197 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 532                     ; 198               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 532                     ; 199               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 532                     ; 200 {
 533                     .text:	section	.text,new
 534  0000               _LCD_Init:
 536       fffffffe      OFST: set -2
 539                     ; 202   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 541                     ; 203   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 543                     ; 204   assert_param(IS_LCD_DUTY(LCD_Duty));
 545                     ; 205   assert_param(IS_LCD_BIAS(LCD_Bias));
 547                     ; 206   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 549                     ; 208   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 551  0000 c65403        	ld	a,21507
 552  0003 a40f          	and	a,#15
 553  0005 c75403        	ld	21507,a
 554                     ; 209   LCD->FRQ |= LCD_Prescaler;
 556  0008 9e            	ld	a,xh
 557  0009 ca5403        	or	a,21507
 558  000c c75403        	ld	21507,a
 559                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 561  000f c65403        	ld	a,21507
 562  0012 a4f0          	and	a,#240
 563  0014 c75403        	ld	21507,a
 564                     ; 212   LCD->FRQ |= LCD_Divider;
 566  0017 9f            	ld	a,xl
 567  0018 ca5403        	or	a,21507
 568  001b c75403        	ld	21507,a
 569                     ; 215   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 571  001e c65400        	ld	a,21504
 572  0021 a4f9          	and	a,#249
 573  0023 c75400        	ld	21504,a
 574                     ; 216   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 576  0026 7213542f      	bres	21551,#1
 577                     ; 218   if (LCD_Duty == LCD_Duty_1_8)
 579  002a 7b03          	ld	a,(OFST+5,sp)
 580  002c a120          	cp	a,#32
 581  002e 2604          	jrne	L742
 582                     ; 220     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 584  0030 ad32          	call	LC002
 586  0032 2002          	jra	L152
 587  0034               L742:
 588                     ; 224     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 590  0034 ad25          	call	LC001
 591  0036               L152:
 592                     ; 228   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 594  0036 72115400      	bres	21504,#0
 595                     ; 229   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 597  003a 7211542f      	bres	21551,#0
 598                     ; 231   if (LCD_Bias == LCD_Bias_1_4)
 600  003e 7b04          	ld	a,(OFST+6,sp)
 601  0040 a110          	cp	a,#16
 602  0042 2608          	jrne	L352
 603                     ; 233     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 605  0044 ad15          	call	LC001
 606                     ; 234     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 608  0046 7b04          	ld	a,(OFST+6,sp)
 609  0048 ad1a          	call	LC002
 611  004a 2002          	jra	L552
 612  004c               L352:
 613                     ; 238     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 615  004c ad0d          	call	LC001
 616  004e               L552:
 617                     ; 241   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 619  004e 72115401      	bres	21505,#0
 620                     ; 242   LCD->CR2 |= LCD_VoltageSource;
 622  0052 c65401        	ld	a,21505
 623  0055 1a05          	or	a,(OFST+7,sp)
 624  0057 c75401        	ld	21505,a
 625                     ; 244 }
 628  005a 81            	ret	
 629  005b               LC001:
 630  005b a40f          	and	a,#15
 631  005d ca5400        	or	a,21504
 632  0060 c75400        	ld	21504,a
 633  0063 81            	ret	
 634  0064               LC002:
 635  0064 4e            	swap	a
 636  0065 a40f          	and	a,#15
 637  0067 ca542f        	or	a,21551
 638  006a c7542f        	ld	21551,a
 639  006d 81            	ret	
 736                     ; 259 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 736                     ; 260 {
 737                     .text:	section	.text,new
 738  0000               _LCD_PortMaskConfig:
 740  0000 89            	pushw	x
 741       00000000      OFST:	set	0
 744                     ; 262   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 746                     ; 265   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 748  0001 9e            	ld	a,xh
 749  0002 5f            	clrw	x
 750  0003 97            	ld	xl,a
 751  0004 7b02          	ld	a,(OFST+2,sp)
 752  0006 d75404        	ld	(21508,x),a
 753                     ; 267 }
 756  0009 85            	popw	x
 757  000a 81            	ret	
 812                     ; 276 void LCD_Cmd(FunctionalState NewState)
 812                     ; 277 {
 813                     .text:	section	.text,new
 814  0000               _LCD_Cmd:
 818                     ; 279   assert_param(IS_FUNCTIONAL_STATE(NewState));
 820                     ; 281   if (NewState != DISABLE)
 822  0000 4d            	tnz	a
 823  0001 2705          	jreq	L543
 824                     ; 283     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 826  0003 721c5402      	bset	21506,#6
 829  0007 81            	ret	
 830  0008               L543:
 831                     ; 287     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 833  0008 721d5402      	bres	21506,#6
 834                     ; 289 }
 837  000c 81            	ret	
 872                     ; 302 void LCD_HighDriveCmd(FunctionalState NewState)
 872                     ; 303 {
 873                     .text:	section	.text,new
 874  0000               _LCD_HighDriveCmd:
 878                     ; 305   assert_param(IS_FUNCTIONAL_STATE(NewState));
 880                     ; 307   if (NewState != DISABLE)
 882  0000 4d            	tnz	a
 883  0001 2705          	jreq	L763
 884                     ; 309     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 886  0003 72185401      	bset	21505,#4
 889  0007 81            	ret	
 890  0008               L763:
 891                     ; 313     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 893  0008 72195401      	bres	21505,#4
 894                     ; 315 }
 897  000c 81            	ret	
1004                     ; 332 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1004                     ; 333 {
1005                     .text:	section	.text,new
1006  0000               _LCD_PulseOnDurationConfig:
1008  0000 88            	push	a
1009       00000000      OFST:	set	0
1012                     ; 335   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1014                     ; 337   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1016  0001 c65401        	ld	a,21505
1017  0004 a41f          	and	a,#31
1018  0006 c75401        	ld	21505,a
1019                     ; 338   LCD->CR2 |= LCD_PulseOnDuration;
1021  0009 c65401        	ld	a,21505
1022  000c 1a01          	or	a,(OFST+1,sp)
1023  000e c75401        	ld	21505,a
1024                     ; 339 }
1027  0011 84            	pop	a
1028  0012 81            	ret	
1125                     ; 355 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1125                     ; 356 {
1126                     .text:	section	.text,new
1127  0000               _LCD_DeadTimeConfig:
1129  0000 88            	push	a
1130       00000000      OFST:	set	0
1133                     ; 358   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1135                     ; 360   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1137  0001 c65402        	ld	a,21506
1138  0004 a4f8          	and	a,#248
1139  0006 c75402        	ld	21506,a
1140                     ; 362   LCD->CR3 |= LCD_DeadTime;
1142  0009 c65402        	ld	a,21506
1143  000c 1a01          	or	a,(OFST+1,sp)
1144  000e c75402        	ld	21506,a
1145                     ; 364 }
1148  0011 84            	pop	a
1149  0012 81            	ret	
1301                     ; 388 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1301                     ; 389 {
1302                     .text:	section	.text,new
1303  0000               _LCD_BlinkConfig:
1307                     ; 391   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1309                     ; 392   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1311                     ; 394   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1313  0000 c65400        	ld	a,21504
1314  0003 a43f          	and	a,#63
1315  0005 c75400        	ld	21504,a
1316                     ; 395   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1318  0008 9e            	ld	a,xh
1319  0009 ca5400        	or	a,21504
1320  000c c75400        	ld	21504,a
1321                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1323  000f c65400        	ld	a,21504
1324  0012 a4c7          	and	a,#199
1325  0014 c75400        	ld	21504,a
1326                     ; 398   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1328  0017 9f            	ld	a,xl
1329  0018 ca5400        	or	a,21504
1330  001b c75400        	ld	21504,a
1331                     ; 400 }
1334  001e 81            	ret	
1439                     ; 416 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1439                     ; 417 {
1440                     .text:	section	.text,new
1441  0000               _LCD_ContrastConfig:
1443  0000 88            	push	a
1444       00000000      OFST:	set	0
1447                     ; 419   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1449                     ; 421   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1451  0001 c65401        	ld	a,21505
1452  0004 a4f1          	and	a,#241
1453  0006 c75401        	ld	21505,a
1454                     ; 422   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1456  0009 c65401        	ld	a,21505
1457  000c 1a01          	or	a,(OFST+1,sp)
1458  000e c75401        	ld	21505,a
1459                     ; 424 }
1462  0011 84            	pop	a
1463  0012 81            	ret	
1665                     ; 471 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1665                     ; 472 {
1666                     .text:	section	.text,new
1667  0000               _LCD_WriteRAM:
1669  0000 89            	pushw	x
1670       00000000      OFST:	set	0
1673                     ; 474   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1675                     ; 477   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1677  0001 9e            	ld	a,xh
1678  0002 5f            	clrw	x
1679  0003 97            	ld	xl,a
1680  0004 7b02          	ld	a,(OFST+2,sp)
1681  0006 d7540c        	ld	(21516,x),a
1682                     ; 479 }
1685  0009 85            	popw	x
1686  000a 81            	ret	
1743                     ; 489 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1743                     ; 490 {
1744                     .text:	section	.text,new
1745  0000               _LCD_PageSelect:
1749                     ; 492   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1751                     ; 494   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1753  0000 7215542f      	bres	21551,#2
1754                     ; 495   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1756  0004 ca542f        	or	a,21551
1757  0007 c7542f        	ld	21551,a
1758                     ; 497 }
1761  000a 81            	ret	
1796                     ; 522 void LCD_ITConfig(FunctionalState NewState)
1796                     ; 523 {
1797                     .text:	section	.text,new
1798  0000               _LCD_ITConfig:
1802                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1804                     ; 527   if (NewState != DISABLE)
1806  0000 4d            	tnz	a
1807  0001 2705          	jreq	L767
1808                     ; 529     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1810  0003 721a5402      	bset	21506,#5
1813  0007 81            	ret	
1814  0008               L767:
1815                     ; 533     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1817  0008 721b5402      	bres	21506,#5
1818                     ; 536 }
1821  000c 81            	ret	
1877                     ; 543 FlagStatus LCD_GetFlagStatus(void)
1877                     ; 544 {
1878                     .text:	section	.text,new
1879  0000               _LCD_GetFlagStatus:
1881       00000001      OFST:	set	1
1884                     ; 545   FlagStatus status = RESET;
1886                     ; 548   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1888  0000 7209540203    	btjf	21506,#4,L1201
1889                     ; 550     status = SET; /* Flag is set */
1891  0005 a601          	ld	a,#1
1895  0007 81            	ret	
1896  0008               L1201:
1897                     ; 554     status = RESET; /* Flag is reset*/
1899  0008 4f            	clr	a
1901                     ; 557   return status;
1905  0009 81            	ret	
1928                     ; 566 void LCD_ClearFlag(void)
1928                     ; 567 {
1929                     .text:	section	.text,new
1930  0000               _LCD_ClearFlag:
1934                     ; 569   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1936  0000 72165402      	bset	21506,#3
1937                     ; 571 }
1940  0004 81            	ret	
1983                     ; 579 ITStatus LCD_GetITStatus(void)
1983                     ; 580 {
1984                     .text:	section	.text,new
1985  0000               _LCD_GetITStatus:
1987       00000001      OFST:	set	1
1990                     ; 581   ITStatus pendingbitstatus = RESET;
1992                     ; 582   uint8_t enablestatus = 0;
1994                     ; 584   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
1996  0000 c65402        	ld	a,21506
1997  0003 a420          	and	a,#32
1999                     ; 586   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2001  0005 7209540205    	btjf	21506,#4,L5501
2003  000a 2703          	jreq	L5501
2004                     ; 589     pendingbitstatus = SET;
2006  000c a601          	ld	a,#1
2010  000e 81            	ret	
2011  000f               L5501:
2012                     ; 594     pendingbitstatus = RESET;
2014  000f 4f            	clr	a
2016                     ; 597   return  pendingbitstatus;
2020  0010 81            	ret	
2044                     ; 606 void LCD_ClearITPendingBit(void)
2044                     ; 607 {
2045                     .text:	section	.text,new
2046  0000               _LCD_ClearITPendingBit:
2050                     ; 609   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2052  0000 72165402      	bset	21506,#3
2053                     ; 611 }
2056  0004 81            	ret	
2069                     	xdef	_LCD_ClearITPendingBit
2070                     	xdef	_LCD_GetITStatus
2071                     	xdef	_LCD_ClearFlag
2072                     	xdef	_LCD_GetFlagStatus
2073                     	xdef	_LCD_ITConfig
2074                     	xdef	_LCD_PageSelect
2075                     	xdef	_LCD_WriteRAM
2076                     	xdef	_LCD_ContrastConfig
2077                     	xdef	_LCD_BlinkConfig
2078                     	xdef	_LCD_DeadTimeConfig
2079                     	xdef	_LCD_PulseOnDurationConfig
2080                     	xdef	_LCD_HighDriveCmd
2081                     	xdef	_LCD_Cmd
2082                     	xdef	_LCD_PortMaskConfig
2083                     	xdef	_LCD_Init
2084                     	xdef	_LCD_DeInit
2103                     	end
