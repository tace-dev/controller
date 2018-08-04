   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  49                     ; 19 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  49                     ; 20 {
  50                     .text:	section	.text,new
  51  0000               f_NonHandledInterrupt:
  55                     ; 24 }
  58  0000 80            	iret
  80                     ; 34 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler) { }
  81                     .text:	section	.text,new
  82  0000               f_TRAP_IRQHandler:
  89  0000 80            	iret
 111                     ; 41 INTERRUPT_HANDLER(FLASH_IRQHandler,1) { }
 112                     .text:	section	.text,new
 113  0000               f_FLASH_IRQHandler:
 120  0000 80            	iret
 143                     ; 48 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2) { }
 144                     .text:	section	.text,new
 145  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 152  0000 80            	iret
 175                     ; 55 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3) { }
 176                     .text:	section	.text,new
 177  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 184  0000 80            	iret
 207                     ; 62 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4) { }
 208                     .text:	section	.text,new
 209  0000               f_RTC_CSSLSE_IRQHandler:
 216  0000 80            	iret
 239                     ; 69 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5) 
 239                     ; 70 {
 240                     .text:	section	.text,new
 241  0000               f_EXTIE_F_PVD_IRQHandler:
 245                     ; 71 }
 248  0000 80            	iret
 270                     ; 78 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6) 
 270                     ; 79 {
 271                     .text:	section	.text,new
 272  0000               f_EXTIB_G_IRQHandler:
 276                     ; 80 }
 279  0000 80            	iret
 301                     ; 87 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7) 
 301                     ; 88 {
 302                     .text:	section	.text,new
 303  0000               f_EXTID_H_IRQHandler:
 307                     ; 89 }
 310  0000 80            	iret
 332                     ; 96 INTERRUPT_HANDLER(EXTI0_IRQHandler,8) 
 332                     ; 97 { 
 333                     .text:	section	.text,new
 334  0000               f_EXTI0_IRQHandler:
 338                     ; 98 }
 341  0000 80            	iret
 363                     ; 105 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 363                     ; 106 { 
 364                     .text:	section	.text,new
 365  0000               f_EXTI1_IRQHandler:
 369                     ; 107 }
 372  0000 80            	iret
 394                     ; 115 INTERRUPT_HANDLER(EXTI2_IRQHandler,10) 
 394                     ; 116 { 
 395                     .text:	section	.text,new
 396  0000               f_EXTI2_IRQHandler:
 400                     ; 117 }
 403  0000 80            	iret
 425                     ; 124 INTERRUPT_HANDLER(EXTI3_IRQHandler,11) 
 425                     ; 125 { 
 426                     .text:	section	.text,new
 427  0000               f_EXTI3_IRQHandler:
 431                     ; 126 }
 434  0000 80            	iret
 456                     ; 133 INTERRUPT_HANDLER(EXTI4_IRQHandler,12) 
 456                     ; 134 { 
 457                     .text:	section	.text,new
 458  0000               f_EXTI4_IRQHandler:
 462                     ; 135 }
 465  0000 80            	iret
 489                     ; 142 INTERRUPT_HANDLER(EXTI5_IRQHandler,13) 
 489                     ; 143 { 
 490                     .text:	section	.text,new
 491  0000               f_EXTI5_IRQHandler:
 493  0000 8a            	push	cc
 494  0001 84            	pop	a
 495  0002 a4bf          	and	a,#191
 496  0004 88            	push	a
 497  0005 86            	pop	cc
 498  0006 3b0002        	push	c_x+2
 499  0009 be00          	ldw	x,c_x
 500  000b 89            	pushw	x
 501  000c 3b0002        	push	c_y+2
 502  000f be00          	ldw	x,c_y
 503  0011 89            	pushw	x
 506                     ; 144 	timer2CiCb();
 508  0012 cd0000        	call	_timer2CiCb
 510                     ; 145 	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
 512  0015 ae0020        	ldw	x,#32
 513  0018 cd0000        	call	_EXTI_ClearITPendingBit
 515                     ; 146 }
 518  001b 85            	popw	x
 519  001c bf00          	ldw	c_y,x
 520  001e 320002        	pop	c_y+2
 521  0021 85            	popw	x
 522  0022 bf00          	ldw	c_x,x
 523  0024 320002        	pop	c_x+2
 524  0027 80            	iret
 546                     ; 153 INTERRUPT_HANDLER(EXTI6_IRQHandler,14) 
 546                     ; 154 { 
 547                     .text:	section	.text,new
 548  0000               f_EXTI6_IRQHandler:
 552                     ; 155 }
 555  0000 80            	iret
 577                     ; 162 INTERRUPT_HANDLER(EXTI7_IRQHandler,15) 
 577                     ; 163 { 
 578                     .text:	section	.text,new
 579  0000               f_EXTI7_IRQHandler:
 583                     ; 164 }
 586  0000 80            	iret
 608                     ; 171 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16) { }
 609                     .text:	section	.text,new
 610  0000               f_LCD_AES_IRQHandler:
 617  0000 80            	iret
 640                     ; 178 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17) { }
 641                     .text:	section	.text,new
 642  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 649  0000 80            	iret
 672                     ; 188 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18) 
 672                     ; 189 {
 673                     .text:	section	.text,new
 674  0000               f_ADC1_COMP_IRQHandler:
 678                     ; 197 }
 681  0000 80            	iret
 707                     ; 204 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19) 
 707                     ; 205 {
 708                     .text:	section	.text,new
 709  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 711  0000 8a            	push	cc
 712  0001 84            	pop	a
 713  0002 a4bf          	and	a,#191
 714  0004 88            	push	a
 715  0005 86            	pop	cc
 716  0006 3b0002        	push	c_x+2
 717  0009 be00          	ldw	x,c_x
 718  000b 89            	pushw	x
 719  000c 3b0002        	push	c_y+2
 720  000f be00          	ldw	x,c_y
 721  0011 89            	pushw	x
 724                     ; 206 	timer2_UpdateCb();
 726  0012 cd0000        	call	_timer2_UpdateCb
 728                     ; 207 	TIM2_ClearITPendingBit(TIM2_IT_Update);
 730  0015 a601          	ld	a,#1
 731  0017 cd0000        	call	_TIM2_ClearITPendingBit
 733                     ; 208 }
 736  001a 85            	popw	x
 737  001b bf00          	ldw	c_y,x
 738  001d 320002        	pop	c_y+2
 739  0020 85            	popw	x
 740  0021 bf00          	ldw	c_x,x
 741  0023 320002        	pop	c_x+2
 742  0026 80            	iret
 765                     ; 215 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20) 
 765                     ; 216 {
 766                     .text:	section	.text,new
 767  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 771                     ; 217 }
 774  0000 80            	iret
 798                     ; 224 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21) { }
 799                     .text:	section	.text,new
 800  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 807  0000 80            	iret
 830                     ; 231 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22) { }
 831                     .text:	section	.text,new
 832  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 839  0000 80            	iret
 864                     ; 238 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23) 
 864                     ; 239 {
 865                     .text:	section	.text,new
 866  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 868  0000 8a            	push	cc
 869  0001 84            	pop	a
 870  0002 a4bf          	and	a,#191
 871  0004 88            	push	a
 872  0005 86            	pop	cc
 873  0006 3b0002        	push	c_x+2
 874  0009 be00          	ldw	x,c_x
 875  000b 89            	pushw	x
 876  000c 3b0002        	push	c_y+2
 877  000f be00          	ldw	x,c_y
 878  0011 89            	pushw	x
 881                     ; 240 	encoder_irq();
 883  0012 cd0000        	call	_encoder_irq
 885                     ; 241 	TIM1_ClearFlag(TIM1_FLAG_Trigger);
 887  0015 ae0040        	ldw	x,#64
 888  0018 cd0000        	call	_TIM1_ClearFlag
 890                     ; 242 }
 893  001b 85            	popw	x
 894  001c bf00          	ldw	c_y,x
 895  001e 320002        	pop	c_y+2
 896  0021 85            	popw	x
 897  0022 bf00          	ldw	c_x,x
 898  0024 320002        	pop	c_x+2
 899  0027 80            	iret
 924                     ; 255 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 924                     ; 256 {
 925                     .text:	section	.text,new
 926  0000               f_TIM1_CC_IRQHandler:
 928  0000 8a            	push	cc
 929  0001 84            	pop	a
 930  0002 a4bf          	and	a,#191
 931  0004 88            	push	a
 932  0005 86            	pop	cc
 933  0006 3b0002        	push	c_x+2
 934  0009 be00          	ldw	x,c_x
 935  000b 89            	pushw	x
 936  000c 3b0002        	push	c_y+2
 937  000f be00          	ldw	x,c_y
 938  0011 89            	pushw	x
 941                     ; 257 	timer2CiCb();
 943  0012 cd0000        	call	_timer2CiCb
 945                     ; 258 	TIM1_ClearFlag(TIM1_FLAG_CC3);
 947  0015 ae0008        	ldw	x,#8
 948  0018 cd0000        	call	_TIM1_ClearFlag
 950                     ; 259 	TIM1_ClearITPendingBit(TIM1_FLAG_CC3);
 952  001b a608          	ld	a,#8
 953  001d cd0000        	call	_TIM1_ClearITPendingBit
 955                     ; 260 }
 958  0020 85            	popw	x
 959  0021 bf00          	ldw	c_y,x
 960  0023 320002        	pop	c_y+2
 961  0026 85            	popw	x
 962  0027 bf00          	ldw	c_x,x
 963  0029 320002        	pop	c_x+2
 964  002c 80            	iret
 989                     ; 267 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25) 
 989                     ; 268 {
 990                     .text:	section	.text,new
 991  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 993  0000 8a            	push	cc
 994  0001 84            	pop	a
 995  0002 a4bf          	and	a,#191
 996  0004 88            	push	a
 997  0005 86            	pop	cc
 998  0006 3b0002        	push	c_x+2
 999  0009 be00          	ldw	x,c_x
1000  000b 89            	pushw	x
1001  000c 3b0002        	push	c_y+2
1002  000f be00          	ldw	x,c_y
1003  0011 89            	pushw	x
1006                     ; 269 	timer4_UpdateCb();
1008  0012 cd0000        	call	_timer4_UpdateCb
1010                     ; 270 	TIM4_ClearITPendingBit(TIM4_IT_Update);
1012  0015 a601          	ld	a,#1
1013  0017 cd0000        	call	_TIM4_ClearITPendingBit
1015                     ; 271 }
1018  001a 85            	popw	x
1019  001b bf00          	ldw	c_y,x
1020  001d 320002        	pop	c_y+2
1021  0020 85            	popw	x
1022  0021 bf00          	ldw	c_x,x
1023  0023 320002        	pop	c_x+2
1024  0026 80            	iret
1046                     ; 278 INTERRUPT_HANDLER(SPI1_IRQHandler,26) { }
1047                     .text:	section	.text,new
1048  0000               f_SPI1_IRQHandler:
1055  0000 80            	iret
1080                     ; 285 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27) 
1080                     ; 286 {
1081                     .text:	section	.text,new
1082  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1084  0000 8a            	push	cc
1085  0001 84            	pop	a
1086  0002 a4bf          	and	a,#191
1087  0004 88            	push	a
1088  0005 86            	pop	cc
1089  0006 3b0002        	push	c_x+2
1090  0009 be00          	ldw	x,c_x
1091  000b 89            	pushw	x
1092  000c 3b0002        	push	c_y+2
1093  000f be00          	ldw	x,c_y
1094  0011 89            	pushw	x
1097                     ; 287 	uart1_tx_irq();
1099  0012 cd0000        	call	_uart1_tx_irq
1101                     ; 288 }
1104  0015 85            	popw	x
1105  0016 bf00          	ldw	c_y,x
1106  0018 320002        	pop	c_y+2
1107  001b 85            	popw	x
1108  001c bf00          	ldw	c_x,x
1109  001e 320002        	pop	c_x+2
1110  0021 80            	iret
1134                     ; 295 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28) 
1134                     ; 296 {
1135                     .text:	section	.text,new
1136  0000               f_USART1_RX_TIM5_CC_IRQHandler:
1138  0000 8a            	push	cc
1139  0001 84            	pop	a
1140  0002 a4bf          	and	a,#191
1141  0004 88            	push	a
1142  0005 86            	pop	cc
1143  0006 3b0002        	push	c_x+2
1144  0009 be00          	ldw	x,c_x
1145  000b 89            	pushw	x
1146  000c 3b0002        	push	c_y+2
1147  000f be00          	ldw	x,c_y
1148  0011 89            	pushw	x
1151                     ; 297 	uart1_rx_irq();
1153  0012 cd0000        	call	_uart1_rx_irq
1155                     ; 298 }
1158  0015 85            	popw	x
1159  0016 bf00          	ldw	c_y,x
1160  0018 320002        	pop	c_y+2
1161  001b 85            	popw	x
1162  001c bf00          	ldw	c_x,x
1163  001e 320002        	pop	c_x+2
1164  0021 80            	iret
1187                     ; 305 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29) { }
1188                     .text:	section	.text,new
1189  0000               f_I2C1_SPI2_IRQHandler:
1196  0000 80            	iret
1198                     .const:	section	.text
1199  0000               __vectab:
1200  0000 82            	dc.b	130
1202  0001 00            	dc.b	page(__stext)
1203  0002 0000          	dc.w	__stext
1204  0004 82            	dc.b	130
1206  0005 00            	dc.b	page(f_TRAP_IRQHandler)
1207  0006 0000          	dc.w	f_TRAP_IRQHandler
1208  0008 82            	dc.b	130
1210  0009 00            	dc.b	page(f_NonHandledInterrupt)
1211  000a 0000          	dc.w	f_NonHandledInterrupt
1212  000c 82            	dc.b	130
1214  000d 00            	dc.b	page(f_FLASH_IRQHandler)
1215  000e 0000          	dc.w	f_FLASH_IRQHandler
1216  0010 82            	dc.b	130
1218  0011 00            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
1219  0012 0000          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
1220  0014 82            	dc.b	130
1222  0015 00            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
1223  0016 0000          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
1224  0018 82            	dc.b	130
1226  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
1227  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
1228  001c 82            	dc.b	130
1230  001d 00            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
1231  001e 0000          	dc.w	f_EXTIE_F_PVD_IRQHandler
1232  0020 82            	dc.b	130
1234  0021 00            	dc.b	page(f_EXTIB_G_IRQHandler)
1235  0022 0000          	dc.w	f_EXTIB_G_IRQHandler
1236  0024 82            	dc.b	130
1238  0025 00            	dc.b	page(f_EXTID_H_IRQHandler)
1239  0026 0000          	dc.w	f_EXTID_H_IRQHandler
1240  0028 82            	dc.b	130
1242  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
1243  002a 0000          	dc.w	f_EXTI0_IRQHandler
1244  002c 82            	dc.b	130
1246  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
1247  002e 0000          	dc.w	f_EXTI1_IRQHandler
1248  0030 82            	dc.b	130
1250  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
1251  0032 0000          	dc.w	f_EXTI2_IRQHandler
1252  0034 82            	dc.b	130
1254  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
1255  0036 0000          	dc.w	f_EXTI3_IRQHandler
1256  0038 82            	dc.b	130
1258  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
1259  003a 0000          	dc.w	f_EXTI4_IRQHandler
1260  003c 82            	dc.b	130
1262  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
1263  003e 0000          	dc.w	f_EXTI5_IRQHandler
1264  0040 82            	dc.b	130
1266  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
1267  0042 0000          	dc.w	f_EXTI6_IRQHandler
1268  0044 82            	dc.b	130
1270  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
1271  0046 0000          	dc.w	f_EXTI7_IRQHandler
1272  0048 82            	dc.b	130
1274  0049 00            	dc.b	page(f_LCD_AES_IRQHandler)
1275  004a 0000          	dc.w	f_LCD_AES_IRQHandler
1276  004c 82            	dc.b	130
1278  004d 00            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
1279  004e 0000          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1280  0050 82            	dc.b	130
1282  0051 00            	dc.b	page(f_ADC1_COMP_IRQHandler)
1283  0052 0000          	dc.w	f_ADC1_COMP_IRQHandler
1284  0054 82            	dc.b	130
1286  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
1287  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1288  0058 82            	dc.b	130
1290  0059 00            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
1291  005a 0000          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
1292  005c 82            	dc.b	130
1294  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
1295  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1296  0060 82            	dc.b	130
1298  0061 00            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
1299  0062 0000          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
1300  0064 82            	dc.b	130
1302  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
1303  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1304  0068 82            	dc.b	130
1306  0069 00            	dc.b	page(f_TIM1_CC_IRQHandler)
1307  006a 0000          	dc.w	f_TIM1_CC_IRQHandler
1308  006c 82            	dc.b	130
1310  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
1311  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
1312  0070 82            	dc.b	130
1314  0071 00            	dc.b	page(f_SPI1_IRQHandler)
1315  0072 0000          	dc.w	f_SPI1_IRQHandler
1316  0074 82            	dc.b	130
1318  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
1319  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1320  0078 82            	dc.b	130
1322  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
1323  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
1324  007c 82            	dc.b	130
1326  007d 00            	dc.b	page(f_I2C1_SPI2_IRQHandler)
1327  007e 0000          	dc.w	f_I2C1_SPI2_IRQHandler
1378                     	xdef	__vectab
1379                     	xref	__stext
1380                     	xdef	f_I2C1_SPI2_IRQHandler
1381                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1382                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1383                     	xdef	f_SPI1_IRQHandler
1384                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1385                     	xdef	f_TIM1_CC_IRQHandler
1386                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1387                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1388                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1389                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1390                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1391                     	xdef	f_ADC1_COMP_IRQHandler
1392                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1393                     	xdef	f_LCD_AES_IRQHandler
1394                     	xdef	f_EXTI7_IRQHandler
1395                     	xdef	f_EXTI6_IRQHandler
1396                     	xdef	f_EXTI5_IRQHandler
1397                     	xdef	f_EXTI4_IRQHandler
1398                     	xdef	f_EXTI3_IRQHandler
1399                     	xdef	f_EXTI2_IRQHandler
1400                     	xdef	f_EXTI1_IRQHandler
1401                     	xdef	f_EXTI0_IRQHandler
1402                     	xdef	f_EXTID_H_IRQHandler
1403                     	xdef	f_EXTIB_G_IRQHandler
1404                     	xdef	f_EXTIE_F_PVD_IRQHandler
1405                     	xdef	f_RTC_CSSLSE_IRQHandler
1406                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1407                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1408                     	xdef	f_FLASH_IRQHandler
1409                     	xdef	f_TRAP_IRQHandler
1410                     	xdef	f_NonHandledInterrupt
1411                     	xref	_timer2CiCb
1412                     	xref	_timer4_UpdateCb
1413                     	xref	_uart1_rx_irq
1414                     	xref	_uart1_tx_irq
1415                     	xref	_timer2_UpdateCb
1416                     	xref	_encoder_irq
1417                     	xref	_TIM4_ClearITPendingBit
1418                     	xref	_TIM2_ClearITPendingBit
1419                     	xref	_TIM1_ClearITPendingBit
1420                     	xref	_TIM1_ClearFlag
1421                     	xref	_EXTI_ClearITPendingBit
1422                     	xref.b	c_x
1423                     	xref.b	c_y
1442                     	end
