   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  52                     ; 19 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  52                     ; 20 {
  53                     .text:	section	.text,new
  54  0000               f_NonHandledInterrupt:
  58                     ; 24 }
  61  0000 80            	iret	
  83                     ; 34 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler) { }
  84                     .text:	section	.text,new
  85  0000               f_TRAP_IRQHandler:
  92  0000 80            	iret	
 114                     ; 41 INTERRUPT_HANDLER(FLASH_IRQHandler,1) { }
 115                     .text:	section	.text,new
 116  0000               f_FLASH_IRQHandler:
 123  0000 80            	iret	
 146                     ; 48 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2) { }
 147                     .text:	section	.text,new
 148  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 155  0000 80            	iret	
 178                     ; 55 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3) { }
 179                     .text:	section	.text,new
 180  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 187  0000 80            	iret	
 210                     ; 62 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4) { }
 211                     .text:	section	.text,new
 212  0000               f_RTC_CSSLSE_IRQHandler:
 219  0000 80            	iret	
 242                     ; 69 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5) 
 242                     ; 70 {
 243                     .text:	section	.text,new
 244  0000               f_EXTIE_F_PVD_IRQHandler:
 248                     ; 71 }
 251  0000 80            	iret	
 273                     ; 78 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6) 
 273                     ; 79 {
 274                     .text:	section	.text,new
 275  0000               f_EXTIB_G_IRQHandler:
 279                     ; 80 }
 282  0000 80            	iret	
 304                     ; 87 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7) 
 304                     ; 88 {
 305                     .text:	section	.text,new
 306  0000               f_EXTID_H_IRQHandler:
 310                     ; 89 }
 313  0000 80            	iret	
 335                     ; 96 INTERRUPT_HANDLER(EXTI0_IRQHandler,8) 
 335                     ; 97 { 
 336                     .text:	section	.text,new
 337  0000               f_EXTI0_IRQHandler:
 341                     ; 98 }
 344  0000 80            	iret	
 366                     ; 105 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 366                     ; 106 { 
 367                     .text:	section	.text,new
 368  0000               f_EXTI1_IRQHandler:
 372                     ; 107 }
 375  0000 80            	iret	
 397                     ; 115 INTERRUPT_HANDLER(EXTI2_IRQHandler,10) 
 397                     ; 116 { 
 398                     .text:	section	.text,new
 399  0000               f_EXTI2_IRQHandler:
 403                     ; 117 }
 406  0000 80            	iret	
 428                     ; 124 INTERRUPT_HANDLER(EXTI3_IRQHandler,11) 
 428                     ; 125 { 
 429                     .text:	section	.text,new
 430  0000               f_EXTI3_IRQHandler:
 434                     ; 126 }
 437  0000 80            	iret	
 459                     ; 133 INTERRUPT_HANDLER(EXTI4_IRQHandler,12) 
 459                     ; 134 { 
 460                     .text:	section	.text,new
 461  0000               f_EXTI4_IRQHandler:
 465                     ; 135 }
 468  0000 80            	iret	
 492                     ; 142 INTERRUPT_HANDLER(EXTI5_IRQHandler,13) 
 492                     ; 143 { 
 493                     .text:	section	.text,new
 494  0000               f_EXTI5_IRQHandler:
 496  0000 8a            	push	cc
 497  0001 84            	pop	a
 498  0002 a4bf          	and	a,#191
 499  0004 88            	push	a
 500  0005 86            	pop	cc
 501  0006 3b0002        	push	c_x+2
 502  0009 be00          	ldw	x,c_x
 503  000b 89            	pushw	x
 504  000c 3b0002        	push	c_y+2
 505  000f be00          	ldw	x,c_y
 506  0011 89            	pushw	x
 509                     ; 144 	timer2CiCb();
 511  0012 cd0000        	call	_timer2CiCb
 513                     ; 145 	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
 515  0015 ae0020        	ldw	x,#32
 516  0018 cd0000        	call	_EXTI_ClearITPendingBit
 518                     ; 146 }
 521  001b 85            	popw	x
 522  001c bf00          	ldw	c_y,x
 523  001e 320002        	pop	c_y+2
 524  0021 85            	popw	x
 525  0022 bf00          	ldw	c_x,x
 526  0024 320002        	pop	c_x+2
 527  0027 80            	iret	
 549                     ; 153 INTERRUPT_HANDLER(EXTI6_IRQHandler,14) 
 549                     ; 154 { 
 550                     .text:	section	.text,new
 551  0000               f_EXTI6_IRQHandler:
 555                     ; 155 }
 558  0000 80            	iret	
 580                     ; 162 INTERRUPT_HANDLER(EXTI7_IRQHandler,15) 
 580                     ; 163 { 
 581                     .text:	section	.text,new
 582  0000               f_EXTI7_IRQHandler:
 586                     ; 164 }
 589  0000 80            	iret	
 611                     ; 171 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16) { }
 612                     .text:	section	.text,new
 613  0000               f_LCD_AES_IRQHandler:
 620  0000 80            	iret	
 643                     ; 178 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17) { }
 644                     .text:	section	.text,new
 645  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 652  0000 80            	iret	
 675                     ; 188 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18) 
 675                     ; 189 {
 676                     .text:	section	.text,new
 677  0000               f_ADC1_COMP_IRQHandler:
 681                     ; 197 }
 684  0000 80            	iret	
 710                     ; 204 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19) 
 710                     ; 205 {
 711                     .text:	section	.text,new
 712  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 714  0000 8a            	push	cc
 715  0001 84            	pop	a
 716  0002 a4bf          	and	a,#191
 717  0004 88            	push	a
 718  0005 86            	pop	cc
 719  0006 3b0002        	push	c_x+2
 720  0009 be00          	ldw	x,c_x
 721  000b 89            	pushw	x
 722  000c 3b0002        	push	c_y+2
 723  000f be00          	ldw	x,c_y
 724  0011 89            	pushw	x
 727                     ; 206 	timer2_UpdateCb();
 729  0012 cd0000        	call	_timer2_UpdateCb
 731                     ; 207 	TIM2_ClearITPendingBit(TIM2_IT_Update);
 733  0015 a601          	ld	a,#1
 734  0017 cd0000        	call	_TIM2_ClearITPendingBit
 736                     ; 208 }
 739  001a 85            	popw	x
 740  001b bf00          	ldw	c_y,x
 741  001d 320002        	pop	c_y+2
 742  0020 85            	popw	x
 743  0021 bf00          	ldw	c_x,x
 744  0023 320002        	pop	c_x+2
 745  0026 80            	iret	
 768                     ; 215 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20) 
 768                     ; 216 {
 769                     .text:	section	.text,new
 770  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 774                     ; 217 }
 777  0000 80            	iret	
 801                     ; 224 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21) { }
 802                     .text:	section	.text,new
 803  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 810  0000 80            	iret	
 833                     ; 231 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22) { }
 834                     .text:	section	.text,new
 835  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 842  0000 80            	iret	
 867                     ; 238 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23) 
 867                     ; 239 {
 868                     .text:	section	.text,new
 869  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 871  0000 8a            	push	cc
 872  0001 84            	pop	a
 873  0002 a4bf          	and	a,#191
 874  0004 88            	push	a
 875  0005 86            	pop	cc
 876  0006 3b0002        	push	c_x+2
 877  0009 be00          	ldw	x,c_x
 878  000b 89            	pushw	x
 879  000c 3b0002        	push	c_y+2
 880  000f be00          	ldw	x,c_y
 881  0011 89            	pushw	x
 884                     ; 240 	encoder_irq();
 886  0012 cd0000        	call	_encoder_irq
 888                     ; 241 	TIM1_ClearFlag(TIM1_FLAG_Trigger);
 890  0015 ae0040        	ldw	x,#64
 891  0018 cd0000        	call	_TIM1_ClearFlag
 893                     ; 242 }
 896  001b 85            	popw	x
 897  001c bf00          	ldw	c_y,x
 898  001e 320002        	pop	c_y+2
 899  0021 85            	popw	x
 900  0022 bf00          	ldw	c_x,x
 901  0024 320002        	pop	c_x+2
 902  0027 80            	iret	
 927                     ; 249 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 927                     ; 250 {
 928                     .text:	section	.text,new
 929  0000               f_TIM1_CC_IRQHandler:
 931  0000 8a            	push	cc
 932  0001 84            	pop	a
 933  0002 a4bf          	and	a,#191
 934  0004 88            	push	a
 935  0005 86            	pop	cc
 936  0006 3b0002        	push	c_x+2
 937  0009 be00          	ldw	x,c_x
 938  000b 89            	pushw	x
 939  000c 3b0002        	push	c_y+2
 940  000f be00          	ldw	x,c_y
 941  0011 89            	pushw	x
 944                     ; 251 	timer2CiCb();
 946  0012 cd0000        	call	_timer2CiCb
 948                     ; 252 	TIM1_ClearFlag(TIM1_FLAG_CC3);
 950  0015 ae0008        	ldw	x,#8
 951  0018 cd0000        	call	_TIM1_ClearFlag
 953                     ; 253 	TIM1_ClearITPendingBit(TIM1_FLAG_CC3);
 955  001b a608          	ld	a,#8
 956  001d cd0000        	call	_TIM1_ClearITPendingBit
 958                     ; 254 }
 961  0020 85            	popw	x
 962  0021 bf00          	ldw	c_y,x
 963  0023 320002        	pop	c_y+2
 964  0026 85            	popw	x
 965  0027 bf00          	ldw	c_x,x
 966  0029 320002        	pop	c_x+2
 967  002c 80            	iret	
 992                     ; 261 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25) 
 992                     ; 262 {
 993                     .text:	section	.text,new
 994  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 996  0000 8a            	push	cc
 997  0001 84            	pop	a
 998  0002 a4bf          	and	a,#191
 999  0004 88            	push	a
1000  0005 86            	pop	cc
1001  0006 3b0002        	push	c_x+2
1002  0009 be00          	ldw	x,c_x
1003  000b 89            	pushw	x
1004  000c 3b0002        	push	c_y+2
1005  000f be00          	ldw	x,c_y
1006  0011 89            	pushw	x
1009                     ; 263 	timer4_UpdateCb();
1011  0012 cd0000        	call	_timer4_UpdateCb
1013                     ; 264 	TIM4_ClearITPendingBit(TIM4_IT_Update);
1015  0015 a601          	ld	a,#1
1016  0017 cd0000        	call	_TIM4_ClearITPendingBit
1018                     ; 265 }
1021  001a 85            	popw	x
1022  001b bf00          	ldw	c_y,x
1023  001d 320002        	pop	c_y+2
1024  0020 85            	popw	x
1025  0021 bf00          	ldw	c_x,x
1026  0023 320002        	pop	c_x+2
1027  0026 80            	iret	
1049                     ; 272 INTERRUPT_HANDLER(SPI1_IRQHandler,26) { }
1050                     .text:	section	.text,new
1051  0000               f_SPI1_IRQHandler:
1058  0000 80            	iret	
1083                     ; 279 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27) 
1083                     ; 280 {
1084                     .text:	section	.text,new
1085  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1087  0000 8a            	push	cc
1088  0001 84            	pop	a
1089  0002 a4bf          	and	a,#191
1090  0004 88            	push	a
1091  0005 86            	pop	cc
1092  0006 3b0002        	push	c_x+2
1093  0009 be00          	ldw	x,c_x
1094  000b 89            	pushw	x
1095  000c 3b0002        	push	c_y+2
1096  000f be00          	ldw	x,c_y
1097  0011 89            	pushw	x
1100                     ; 281 	uart1_tx_irq();
1102  0012 cd0000        	call	_uart1_tx_irq
1104                     ; 282 }
1107  0015 85            	popw	x
1108  0016 bf00          	ldw	c_y,x
1109  0018 320002        	pop	c_y+2
1110  001b 85            	popw	x
1111  001c bf00          	ldw	c_x,x
1112  001e 320002        	pop	c_x+2
1113  0021 80            	iret	
1138                     ; 289 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28) 
1138                     ; 290 {
1139                     .text:	section	.text,new
1140  0000               f_USART1_RX_TIM5_CC_IRQHandler:
1142  0000 8a            	push	cc
1143  0001 84            	pop	a
1144  0002 a4bf          	and	a,#191
1145  0004 88            	push	a
1146  0005 86            	pop	cc
1147  0006 3b0002        	push	c_x+2
1148  0009 be00          	ldw	x,c_x
1149  000b 89            	pushw	x
1150  000c 3b0002        	push	c_y+2
1151  000f be00          	ldw	x,c_y
1152  0011 89            	pushw	x
1155                     ; 291 	uart1_rx_irq();
1157  0012 cd0000        	call	_uart1_rx_irq
1159                     ; 292 	USART_ClearITPendingBit(USART1, USART_FLAG_RXNE);
1161  0015 ae0020        	ldw	x,#32
1162  0018 89            	pushw	x
1163  0019 ae5230        	ldw	x,#21040
1164  001c cd0000        	call	_USART_ClearITPendingBit
1166  001f 85            	popw	x
1167                     ; 293 }
1170  0020 85            	popw	x
1171  0021 bf00          	ldw	c_y,x
1172  0023 320002        	pop	c_y+2
1173  0026 85            	popw	x
1174  0027 bf00          	ldw	c_x,x
1175  0029 320002        	pop	c_x+2
1176  002c 80            	iret	
1199                     ; 300 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29) { }
1200                     .text:	section	.text,new
1201  0000               f_I2C1_SPI2_IRQHandler:
1208  0000 80            	iret	
1210                     .const:	section	.text
1211  0000               __vectab:
1212  0000 82            	dc.b	130
1214  0001 00            	dc.b	page(__stext)
1215  0002 0000          	dc.w	__stext
1216  0004 82            	dc.b	130
1218  0005 00            	dc.b	page(f_TRAP_IRQHandler)
1219  0006 0000          	dc.w	f_TRAP_IRQHandler
1220  0008 82            	dc.b	130
1222  0009 00            	dc.b	page(f_NonHandledInterrupt)
1223  000a 0000          	dc.w	f_NonHandledInterrupt
1224  000c 82            	dc.b	130
1226  000d 00            	dc.b	page(f_FLASH_IRQHandler)
1227  000e 0000          	dc.w	f_FLASH_IRQHandler
1228  0010 82            	dc.b	130
1230  0011 00            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
1231  0012 0000          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
1232  0014 82            	dc.b	130
1234  0015 00            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
1235  0016 0000          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
1236  0018 82            	dc.b	130
1238  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
1239  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
1240  001c 82            	dc.b	130
1242  001d 00            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
1243  001e 0000          	dc.w	f_EXTIE_F_PVD_IRQHandler
1244  0020 82            	dc.b	130
1246  0021 00            	dc.b	page(f_EXTIB_G_IRQHandler)
1247  0022 0000          	dc.w	f_EXTIB_G_IRQHandler
1248  0024 82            	dc.b	130
1250  0025 00            	dc.b	page(f_EXTID_H_IRQHandler)
1251  0026 0000          	dc.w	f_EXTID_H_IRQHandler
1252  0028 82            	dc.b	130
1254  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
1255  002a 0000          	dc.w	f_EXTI0_IRQHandler
1256  002c 82            	dc.b	130
1258  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
1259  002e 0000          	dc.w	f_EXTI1_IRQHandler
1260  0030 82            	dc.b	130
1262  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
1263  0032 0000          	dc.w	f_EXTI2_IRQHandler
1264  0034 82            	dc.b	130
1266  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
1267  0036 0000          	dc.w	f_EXTI3_IRQHandler
1268  0038 82            	dc.b	130
1270  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
1271  003a 0000          	dc.w	f_EXTI4_IRQHandler
1272  003c 82            	dc.b	130
1274  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
1275  003e 0000          	dc.w	f_EXTI5_IRQHandler
1276  0040 82            	dc.b	130
1278  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
1279  0042 0000          	dc.w	f_EXTI6_IRQHandler
1280  0044 82            	dc.b	130
1282  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
1283  0046 0000          	dc.w	f_EXTI7_IRQHandler
1284  0048 82            	dc.b	130
1286  0049 00            	dc.b	page(f_LCD_AES_IRQHandler)
1287  004a 0000          	dc.w	f_LCD_AES_IRQHandler
1288  004c 82            	dc.b	130
1290  004d 00            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
1291  004e 0000          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1292  0050 82            	dc.b	130
1294  0051 00            	dc.b	page(f_ADC1_COMP_IRQHandler)
1295  0052 0000          	dc.w	f_ADC1_COMP_IRQHandler
1296  0054 82            	dc.b	130
1298  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
1299  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1300  0058 82            	dc.b	130
1302  0059 00            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
1303  005a 0000          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
1304  005c 82            	dc.b	130
1306  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
1307  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1308  0060 82            	dc.b	130
1310  0061 00            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
1311  0062 0000          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
1312  0064 82            	dc.b	130
1314  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
1315  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1316  0068 82            	dc.b	130
1318  0069 00            	dc.b	page(f_TIM1_CC_IRQHandler)
1319  006a 0000          	dc.w	f_TIM1_CC_IRQHandler
1320  006c 82            	dc.b	130
1322  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
1323  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
1324  0070 82            	dc.b	130
1326  0071 00            	dc.b	page(f_SPI1_IRQHandler)
1327  0072 0000          	dc.w	f_SPI1_IRQHandler
1328  0074 82            	dc.b	130
1330  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
1331  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1332  0078 82            	dc.b	130
1334  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
1335  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
1336  007c 82            	dc.b	130
1338  007d 00            	dc.b	page(f_I2C1_SPI2_IRQHandler)
1339  007e 0000          	dc.w	f_I2C1_SPI2_IRQHandler
1390                     	xdef	__vectab
1391                     	xref	__stext
1392                     	xdef	f_I2C1_SPI2_IRQHandler
1393                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1394                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1395                     	xdef	f_SPI1_IRQHandler
1396                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1397                     	xdef	f_TIM1_CC_IRQHandler
1398                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1399                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1400                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1401                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1402                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1403                     	xdef	f_ADC1_COMP_IRQHandler
1404                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1405                     	xdef	f_LCD_AES_IRQHandler
1406                     	xdef	f_EXTI7_IRQHandler
1407                     	xdef	f_EXTI6_IRQHandler
1408                     	xdef	f_EXTI5_IRQHandler
1409                     	xdef	f_EXTI4_IRQHandler
1410                     	xdef	f_EXTI3_IRQHandler
1411                     	xdef	f_EXTI2_IRQHandler
1412                     	xdef	f_EXTI1_IRQHandler
1413                     	xdef	f_EXTI0_IRQHandler
1414                     	xdef	f_EXTID_H_IRQHandler
1415                     	xdef	f_EXTIB_G_IRQHandler
1416                     	xdef	f_EXTIE_F_PVD_IRQHandler
1417                     	xdef	f_RTC_CSSLSE_IRQHandler
1418                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1419                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1420                     	xdef	f_FLASH_IRQHandler
1421                     	xdef	f_TRAP_IRQHandler
1422                     	xdef	f_NonHandledInterrupt
1423                     	xref	_timer2CiCb
1424                     	xref	_timer4_UpdateCb
1425                     	xref	_uart1_rx_irq
1426                     	xref	_uart1_tx_irq
1427                     	xref	_timer2_UpdateCb
1428                     	xref	_encoder_irq
1429                     	xref	_USART_ClearITPendingBit
1430                     	xref	_TIM4_ClearITPendingBit
1431                     	xref	_TIM2_ClearITPendingBit
1432                     	xref	_TIM1_ClearITPendingBit
1433                     	xref	_TIM1_ClearFlag
1434                     	xref	_EXTI_ClearITPendingBit
1435                     	xref.b	c_x
1436                     	xref.b	c_y
1455                     	end
