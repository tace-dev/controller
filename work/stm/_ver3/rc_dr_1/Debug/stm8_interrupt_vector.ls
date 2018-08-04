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
 490                     ; 142 INTERRUPT_HANDLER(EXTI5_IRQHandler,13) 
 490                     ; 143 { 
 491                     .text:	section	.text,new
 492  0000               f_EXTI5_IRQHandler:
 496                     ; 146 }
 499  0000 80            	iret	
 521                     ; 153 INTERRUPT_HANDLER(EXTI6_IRQHandler,14) 
 521                     ; 154 { 
 522                     .text:	section	.text,new
 523  0000               f_EXTI6_IRQHandler:
 527                     ; 155 }
 530  0000 80            	iret	
 552                     ; 162 INTERRUPT_HANDLER(EXTI7_IRQHandler,15) 
 552                     ; 163 { 
 553                     .text:	section	.text,new
 554  0000               f_EXTI7_IRQHandler:
 558                     ; 164 }
 561  0000 80            	iret	
 583                     ; 171 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16) { }
 584                     .text:	section	.text,new
 585  0000               f_LCD_AES_IRQHandler:
 592  0000 80            	iret	
 615                     ; 178 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17) { }
 616                     .text:	section	.text,new
 617  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 624  0000 80            	iret	
 647                     ; 188 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18) 
 647                     ; 189 {
 648                     .text:	section	.text,new
 649  0000               f_ADC1_COMP_IRQHandler:
 653                     ; 197 }
 656  0000 80            	iret	
 682                     ; 204 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19) 
 682                     ; 205 {
 683                     .text:	section	.text,new
 684  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 686  0000 8a            	push	cc
 687  0001 84            	pop	a
 688  0002 a4bf          	and	a,#191
 689  0004 88            	push	a
 690  0005 86            	pop	cc
 691  0006 3b0002        	push	c_x+2
 692  0009 be00          	ldw	x,c_x
 693  000b 89            	pushw	x
 694  000c 3b0002        	push	c_y+2
 695  000f be00          	ldw	x,c_y
 696  0011 89            	pushw	x
 699                     ; 206 	timer2_UpdateCb();
 701  0012 cd0000        	call	_timer2_UpdateCb
 703                     ; 207 	TIM2_ClearITPendingBit(TIM2_IT_Update);
 705  0015 a601          	ld	a,#1
 706  0017 cd0000        	call	_TIM2_ClearITPendingBit
 708                     ; 208 }
 711  001a 85            	popw	x
 712  001b bf00          	ldw	c_y,x
 713  001d 320002        	pop	c_y+2
 714  0020 85            	popw	x
 715  0021 bf00          	ldw	c_x,x
 716  0023 320002        	pop	c_x+2
 717  0026 80            	iret	
 740                     ; 215 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20) 
 740                     ; 216 {
 741                     .text:	section	.text,new
 742  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 746                     ; 217 }
 749  0000 80            	iret	
 773                     ; 224 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21) { }
 774                     .text:	section	.text,new
 775  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 782  0000 80            	iret	
 805                     ; 231 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22) { }
 806                     .text:	section	.text,new
 807  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 814  0000 80            	iret	
 839                     ; 238 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23) 
 839                     ; 239 {
 840                     .text:	section	.text,new
 841  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 843  0000 8a            	push	cc
 844  0001 84            	pop	a
 845  0002 a4bf          	and	a,#191
 846  0004 88            	push	a
 847  0005 86            	pop	cc
 848  0006 3b0002        	push	c_x+2
 849  0009 be00          	ldw	x,c_x
 850  000b 89            	pushw	x
 851  000c 3b0002        	push	c_y+2
 852  000f be00          	ldw	x,c_y
 853  0011 89            	pushw	x
 856                     ; 240 	encoder_irq();
 858  0012 cd0000        	call	_encoder_irq
 860                     ; 241 	TIM1_ClearFlag(TIM1_FLAG_Trigger);
 862  0015 ae0040        	ldw	x,#64
 863  0018 cd0000        	call	_TIM1_ClearFlag
 865                     ; 242 }
 868  001b 85            	popw	x
 869  001c bf00          	ldw	c_y,x
 870  001e 320002        	pop	c_y+2
 871  0021 85            	popw	x
 872  0022 bf00          	ldw	c_x,x
 873  0024 320002        	pop	c_x+2
 874  0027 80            	iret	
 899                     ; 249 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 899                     ; 250 {
 900                     .text:	section	.text,new
 901  0000               f_TIM1_CC_IRQHandler:
 903  0000 8a            	push	cc
 904  0001 84            	pop	a
 905  0002 a4bf          	and	a,#191
 906  0004 88            	push	a
 907  0005 86            	pop	cc
 908  0006 3b0002        	push	c_x+2
 909  0009 be00          	ldw	x,c_x
 910  000b 89            	pushw	x
 911  000c 3b0002        	push	c_y+2
 912  000f be00          	ldw	x,c_y
 913  0011 89            	pushw	x
 916                     ; 253 	timer2CiCb();
 918  0012 cd0000        	call	_timer2CiCb
 920                     ; 254 	TIM1_ClearFlag(TIM1_FLAG_CC3);
 922  0015 ae0008        	ldw	x,#8
 923  0018 cd0000        	call	_TIM1_ClearFlag
 925                     ; 255 	TIM1_ClearITPendingBit(TIM1_FLAG_CC3);
 927  001b a608          	ld	a,#8
 928  001d cd0000        	call	_TIM1_ClearITPendingBit
 930                     ; 256 }
 933  0020 85            	popw	x
 934  0021 bf00          	ldw	c_y,x
 935  0023 320002        	pop	c_y+2
 936  0026 85            	popw	x
 937  0027 bf00          	ldw	c_x,x
 938  0029 320002        	pop	c_x+2
 939  002c 80            	iret	
 964                     ; 263 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25) 
 964                     ; 264 {
 965                     .text:	section	.text,new
 966  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 968  0000 8a            	push	cc
 969  0001 84            	pop	a
 970  0002 a4bf          	and	a,#191
 971  0004 88            	push	a
 972  0005 86            	pop	cc
 973  0006 3b0002        	push	c_x+2
 974  0009 be00          	ldw	x,c_x
 975  000b 89            	pushw	x
 976  000c 3b0002        	push	c_y+2
 977  000f be00          	ldw	x,c_y
 978  0011 89            	pushw	x
 981                     ; 265 	timer4_UpdateCb();
 983  0012 cd0000        	call	_timer4_UpdateCb
 985                     ; 266 	TIM4_ClearITPendingBit(TIM4_IT_Update);
 987  0015 a601          	ld	a,#1
 988  0017 cd0000        	call	_TIM4_ClearITPendingBit
 990                     ; 267 }
 993  001a 85            	popw	x
 994  001b bf00          	ldw	c_y,x
 995  001d 320002        	pop	c_y+2
 996  0020 85            	popw	x
 997  0021 bf00          	ldw	c_x,x
 998  0023 320002        	pop	c_x+2
 999  0026 80            	iret	
1021                     ; 274 INTERRUPT_HANDLER(SPI1_IRQHandler,26) { }
1022                     .text:	section	.text,new
1023  0000               f_SPI1_IRQHandler:
1030  0000 80            	iret	
1055                     ; 281 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27) 
1055                     ; 282 {
1056                     .text:	section	.text,new
1057  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1059  0000 8a            	push	cc
1060  0001 84            	pop	a
1061  0002 a4bf          	and	a,#191
1062  0004 88            	push	a
1063  0005 86            	pop	cc
1064  0006 3b0002        	push	c_x+2
1065  0009 be00          	ldw	x,c_x
1066  000b 89            	pushw	x
1067  000c 3b0002        	push	c_y+2
1068  000f be00          	ldw	x,c_y
1069  0011 89            	pushw	x
1072                     ; 283 	uart1_tx_irq();
1074  0012 cd0000        	call	_uart1_tx_irq
1076                     ; 284 }
1079  0015 85            	popw	x
1080  0016 bf00          	ldw	c_y,x
1081  0018 320002        	pop	c_y+2
1082  001b 85            	popw	x
1083  001c bf00          	ldw	c_x,x
1084  001e 320002        	pop	c_x+2
1085  0021 80            	iret	
1110                     ; 291 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28) 
1110                     ; 292 {
1111                     .text:	section	.text,new
1112  0000               f_USART1_RX_TIM5_CC_IRQHandler:
1114  0000 8a            	push	cc
1115  0001 84            	pop	a
1116  0002 a4bf          	and	a,#191
1117  0004 88            	push	a
1118  0005 86            	pop	cc
1119  0006 3b0002        	push	c_x+2
1120  0009 be00          	ldw	x,c_x
1121  000b 89            	pushw	x
1122  000c 3b0002        	push	c_y+2
1123  000f be00          	ldw	x,c_y
1124  0011 89            	pushw	x
1127                     ; 293 	uart1_rx_irq();
1129  0012 cd0000        	call	_uart1_rx_irq
1131                     ; 294 	USART_ClearITPendingBit(USART1, USART_FLAG_RXNE);
1133  0015 ae0020        	ldw	x,#32
1134  0018 89            	pushw	x
1135  0019 ae5230        	ldw	x,#21040
1136  001c cd0000        	call	_USART_ClearITPendingBit
1138  001f 85            	popw	x
1139                     ; 295 }
1142  0020 85            	popw	x
1143  0021 bf00          	ldw	c_y,x
1144  0023 320002        	pop	c_y+2
1145  0026 85            	popw	x
1146  0027 bf00          	ldw	c_x,x
1147  0029 320002        	pop	c_x+2
1148  002c 80            	iret	
1171                     ; 302 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29) { }
1172                     .text:	section	.text,new
1173  0000               f_I2C1_SPI2_IRQHandler:
1180  0000 80            	iret	
1182                     .const:	section	.text
1183  0000               __vectab:
1184  0000 82            	dc.b	130
1186  0001 00            	dc.b	page(__stext)
1187  0002 0000          	dc.w	__stext
1188  0004 82            	dc.b	130
1190  0005 00            	dc.b	page(f_TRAP_IRQHandler)
1191  0006 0000          	dc.w	f_TRAP_IRQHandler
1192  0008 82            	dc.b	130
1194  0009 00            	dc.b	page(f_NonHandledInterrupt)
1195  000a 0000          	dc.w	f_NonHandledInterrupt
1196  000c 82            	dc.b	130
1198  000d 00            	dc.b	page(f_FLASH_IRQHandler)
1199  000e 0000          	dc.w	f_FLASH_IRQHandler
1200  0010 82            	dc.b	130
1202  0011 00            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
1203  0012 0000          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
1204  0014 82            	dc.b	130
1206  0015 00            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
1207  0016 0000          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
1208  0018 82            	dc.b	130
1210  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
1211  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
1212  001c 82            	dc.b	130
1214  001d 00            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
1215  001e 0000          	dc.w	f_EXTIE_F_PVD_IRQHandler
1216  0020 82            	dc.b	130
1218  0021 00            	dc.b	page(f_EXTIB_G_IRQHandler)
1219  0022 0000          	dc.w	f_EXTIB_G_IRQHandler
1220  0024 82            	dc.b	130
1222  0025 00            	dc.b	page(f_EXTID_H_IRQHandler)
1223  0026 0000          	dc.w	f_EXTID_H_IRQHandler
1224  0028 82            	dc.b	130
1226  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
1227  002a 0000          	dc.w	f_EXTI0_IRQHandler
1228  002c 82            	dc.b	130
1230  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
1231  002e 0000          	dc.w	f_EXTI1_IRQHandler
1232  0030 82            	dc.b	130
1234  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
1235  0032 0000          	dc.w	f_EXTI2_IRQHandler
1236  0034 82            	dc.b	130
1238  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
1239  0036 0000          	dc.w	f_EXTI3_IRQHandler
1240  0038 82            	dc.b	130
1242  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
1243  003a 0000          	dc.w	f_EXTI4_IRQHandler
1244  003c 82            	dc.b	130
1246  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
1247  003e 0000          	dc.w	f_EXTI5_IRQHandler
1248  0040 82            	dc.b	130
1250  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
1251  0042 0000          	dc.w	f_EXTI6_IRQHandler
1252  0044 82            	dc.b	130
1254  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
1255  0046 0000          	dc.w	f_EXTI7_IRQHandler
1256  0048 82            	dc.b	130
1258  0049 00            	dc.b	page(f_LCD_AES_IRQHandler)
1259  004a 0000          	dc.w	f_LCD_AES_IRQHandler
1260  004c 82            	dc.b	130
1262  004d 00            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
1263  004e 0000          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1264  0050 82            	dc.b	130
1266  0051 00            	dc.b	page(f_ADC1_COMP_IRQHandler)
1267  0052 0000          	dc.w	f_ADC1_COMP_IRQHandler
1268  0054 82            	dc.b	130
1270  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
1271  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1272  0058 82            	dc.b	130
1274  0059 00            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
1275  005a 0000          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
1276  005c 82            	dc.b	130
1278  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
1279  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1280  0060 82            	dc.b	130
1282  0061 00            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
1283  0062 0000          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
1284  0064 82            	dc.b	130
1286  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
1287  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1288  0068 82            	dc.b	130
1290  0069 00            	dc.b	page(f_TIM1_CC_IRQHandler)
1291  006a 0000          	dc.w	f_TIM1_CC_IRQHandler
1292  006c 82            	dc.b	130
1294  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
1295  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
1296  0070 82            	dc.b	130
1298  0071 00            	dc.b	page(f_SPI1_IRQHandler)
1299  0072 0000          	dc.w	f_SPI1_IRQHandler
1300  0074 82            	dc.b	130
1302  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
1303  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1304  0078 82            	dc.b	130
1306  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
1307  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
1308  007c 82            	dc.b	130
1310  007d 00            	dc.b	page(f_I2C1_SPI2_IRQHandler)
1311  007e 0000          	dc.w	f_I2C1_SPI2_IRQHandler
1362                     	xdef	__vectab
1363                     	xref	__stext
1364                     	xdef	f_I2C1_SPI2_IRQHandler
1365                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1366                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1367                     	xdef	f_SPI1_IRQHandler
1368                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1369                     	xdef	f_TIM1_CC_IRQHandler
1370                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1371                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1372                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1373                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1374                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1375                     	xdef	f_ADC1_COMP_IRQHandler
1376                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1377                     	xdef	f_LCD_AES_IRQHandler
1378                     	xdef	f_EXTI7_IRQHandler
1379                     	xdef	f_EXTI6_IRQHandler
1380                     	xdef	f_EXTI5_IRQHandler
1381                     	xdef	f_EXTI4_IRQHandler
1382                     	xdef	f_EXTI3_IRQHandler
1383                     	xdef	f_EXTI2_IRQHandler
1384                     	xdef	f_EXTI1_IRQHandler
1385                     	xdef	f_EXTI0_IRQHandler
1386                     	xdef	f_EXTID_H_IRQHandler
1387                     	xdef	f_EXTIB_G_IRQHandler
1388                     	xdef	f_EXTIE_F_PVD_IRQHandler
1389                     	xdef	f_RTC_CSSLSE_IRQHandler
1390                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1391                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1392                     	xdef	f_FLASH_IRQHandler
1393                     	xdef	f_TRAP_IRQHandler
1394                     	xdef	f_NonHandledInterrupt
1395                     	xref	_timer2CiCb
1396                     	xref	_timer4_UpdateCb
1397                     	xref	_uart1_rx_irq
1398                     	xref	_uart1_tx_irq
1399                     	xref	_timer2_UpdateCb
1400                     	xref	_encoder_irq
1401                     	xref	_USART_ClearITPendingBit
1402                     	xref	_TIM4_ClearITPendingBit
1403                     	xref	_TIM2_ClearITPendingBit
1404                     	xref	_TIM1_ClearITPendingBit
1405                     	xref	_TIM1_ClearFlag
1406                     	xref.b	c_x
1407                     	xref.b	c_y
1426                     	end
