   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  51                     ; 19 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  51                     ; 20 {
  52                     	switch	.text
  53  0000               f_NonHandledInterrupt:
  57                     ; 24 }
  60  0000 80            	iret	
  82                     ; 34 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler) { }
  83                     	switch	.text
  84  0001               f_TRAP_IRQHandler:
  91  0001 80            	iret	
 113                     ; 41 INTERRUPT_HANDLER(FLASH_IRQHandler,1) { }
 114                     	switch	.text
 115  0002               f_FLASH_IRQHandler:
 122  0002 80            	iret	
 145                     ; 48 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2) { }
 146                     	switch	.text
 147  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 154  0003 80            	iret	
 177                     ; 55 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3) { }
 178                     	switch	.text
 179  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 186  0004 80            	iret	
 209                     ; 62 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4) { }
 210                     	switch	.text
 211  0005               f_RTC_CSSLSE_IRQHandler:
 218  0005 80            	iret	
 241                     ; 69 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5) 
 241                     ; 70 {
 242                     	switch	.text
 243  0006               f_EXTIE_F_PVD_IRQHandler:
 247                     ; 71 }
 250  0006 80            	iret	
 272                     ; 78 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6) 
 272                     ; 79 {
 273                     	switch	.text
 274  0007               f_EXTIB_G_IRQHandler:
 278                     ; 80 }
 281  0007 80            	iret	
 303                     ; 87 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7) 
 303                     ; 88 {
 304                     	switch	.text
 305  0008               f_EXTID_H_IRQHandler:
 309                     ; 89 }
 312  0008 80            	iret	
 334                     ; 96 INTERRUPT_HANDLER(EXTI0_IRQHandler,8) 
 334                     ; 97 { 
 335                     	switch	.text
 336  0009               f_EXTI0_IRQHandler:
 340                     ; 98 }
 343  0009 80            	iret	
 365                     ; 105 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 365                     ; 106 { 
 366                     	switch	.text
 367  000a               f_EXTI1_IRQHandler:
 371                     ; 107 }
 374  000a 80            	iret	
 396                     ; 115 INTERRUPT_HANDLER(EXTI2_IRQHandler,10) 
 396                     ; 116 { 
 397                     	switch	.text
 398  000b               f_EXTI2_IRQHandler:
 402                     ; 117 }
 405  000b 80            	iret	
 427                     ; 124 INTERRUPT_HANDLER(EXTI3_IRQHandler,11) 
 427                     ; 125 { 
 428                     	switch	.text
 429  000c               f_EXTI3_IRQHandler:
 433                     ; 126 }
 436  000c 80            	iret	
 458                     ; 133 INTERRUPT_HANDLER(EXTI4_IRQHandler,12) 
 458                     ; 134 { 
 459                     	switch	.text
 460  000d               f_EXTI4_IRQHandler:
 464                     ; 135 }
 467  000d 80            	iret	
 491                     ; 142 INTERRUPT_HANDLER(EXTI5_IRQHandler,13) 
 491                     ; 143 { 
 492                     	switch	.text
 493  000e               f_EXTI5_IRQHandler:
 495  000e 8a            	push	cc
 496  000f 84            	pop	a
 497  0010 a4bf          	and	a,#191
 498  0012 88            	push	a
 499  0013 86            	pop	cc
 500  0014 3b0002        	push	c_x+2
 501  0017 be00          	ldw	x,c_x
 502  0019 89            	pushw	x
 503  001a 3b0002        	push	c_y+2
 504  001d be00          	ldw	x,c_y
 505  001f 89            	pushw	x
 508                     ; 144 	timer2CiCb();
 510  0020 cd0000        	call	_timer2CiCb
 512                     ; 145 	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
 514  0023 ae0020        	ldw	x,#32
 515  0026 cd0000        	call	_EXTI_ClearITPendingBit
 517                     ; 146 }
 520  0029 85            	popw	x
 521  002a bf00          	ldw	c_y,x
 522  002c 320002        	pop	c_y+2
 523  002f 85            	popw	x
 524  0030 bf00          	ldw	c_x,x
 525  0032 320002        	pop	c_x+2
 526  0035 80            	iret	
 548                     ; 153 INTERRUPT_HANDLER(EXTI6_IRQHandler,14) 
 548                     ; 154 { 
 549                     	switch	.text
 550  0036               f_EXTI6_IRQHandler:
 554                     ; 155 }
 557  0036 80            	iret	
 579                     ; 162 INTERRUPT_HANDLER(EXTI7_IRQHandler,15) 
 579                     ; 163 { 
 580                     	switch	.text
 581  0037               f_EXTI7_IRQHandler:
 585                     ; 164 }
 588  0037 80            	iret	
 610                     ; 171 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16) { }
 611                     	switch	.text
 612  0038               f_LCD_AES_IRQHandler:
 619  0038 80            	iret	
 642                     ; 178 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17) { }
 643                     	switch	.text
 644  0039               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 651  0039 80            	iret	
 674                     ; 188 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18) 
 674                     ; 189 {
 675                     	switch	.text
 676  003a               f_ADC1_COMP_IRQHandler:
 680                     ; 197 }
 683  003a 80            	iret	
 709                     ; 204 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19) 
 709                     ; 205 {
 710                     	switch	.text
 711  003b               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 713  003b 8a            	push	cc
 714  003c 84            	pop	a
 715  003d a4bf          	and	a,#191
 716  003f 88            	push	a
 717  0040 86            	pop	cc
 718  0041 3b0002        	push	c_x+2
 719  0044 be00          	ldw	x,c_x
 720  0046 89            	pushw	x
 721  0047 3b0002        	push	c_y+2
 722  004a be00          	ldw	x,c_y
 723  004c 89            	pushw	x
 726                     ; 206 	timer2_UpdateCb();
 728  004d cd0000        	call	_timer2_UpdateCb
 730                     ; 207 	TIM2_ClearITPendingBit(TIM2_IT_Update);
 732  0050 a601          	ld	a,#1
 733  0052 cd0000        	call	_TIM2_ClearITPendingBit
 735                     ; 208 }
 738  0055 85            	popw	x
 739  0056 bf00          	ldw	c_y,x
 740  0058 320002        	pop	c_y+2
 741  005b 85            	popw	x
 742  005c bf00          	ldw	c_x,x
 743  005e 320002        	pop	c_x+2
 744  0061 80            	iret	
 767                     ; 215 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20) 
 767                     ; 216 {
 768                     	switch	.text
 769  0062               f_TIM2_CC_USART2_RX_IRQHandler:
 773                     ; 217 }
 776  0062 80            	iret	
 800                     ; 224 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21) { }
 801                     	switch	.text
 802  0063               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 809  0063 80            	iret	
 832                     ; 231 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22) { }
 833                     	switch	.text
 834  0064               f_TIM3_CC_USART3_RX_IRQHandler:
 841  0064 80            	iret	
 866                     ; 238 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23) 
 866                     ; 239 {
 867                     	switch	.text
 868  0065               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 870  0065 8a            	push	cc
 871  0066 84            	pop	a
 872  0067 a4bf          	and	a,#191
 873  0069 88            	push	a
 874  006a 86            	pop	cc
 875  006b 3b0002        	push	c_x+2
 876  006e be00          	ldw	x,c_x
 877  0070 89            	pushw	x
 878  0071 3b0002        	push	c_y+2
 879  0074 be00          	ldw	x,c_y
 880  0076 89            	pushw	x
 883                     ; 240 	encoder_irq();
 885  0077 cd0000        	call	_encoder_irq
 887                     ; 241 	TIM1_ClearFlag(TIM1_FLAG_Trigger);
 889  007a ae0040        	ldw	x,#64
 890  007d cd0000        	call	_TIM1_ClearFlag
 892                     ; 242 }
 895  0080 85            	popw	x
 896  0081 bf00          	ldw	c_y,x
 897  0083 320002        	pop	c_y+2
 898  0086 85            	popw	x
 899  0087 bf00          	ldw	c_x,x
 900  0089 320002        	pop	c_x+2
 901  008c 80            	iret	
 926                     ; 255 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 926                     ; 256 {
 927                     	switch	.text
 928  008d               f_TIM1_CC_IRQHandler:
 930  008d 8a            	push	cc
 931  008e 84            	pop	a
 932  008f a4bf          	and	a,#191
 933  0091 88            	push	a
 934  0092 86            	pop	cc
 935  0093 3b0002        	push	c_x+2
 936  0096 be00          	ldw	x,c_x
 937  0098 89            	pushw	x
 938  0099 3b0002        	push	c_y+2
 939  009c be00          	ldw	x,c_y
 940  009e 89            	pushw	x
 943                     ; 257 	timer2CiCb();
 945  009f cd0000        	call	_timer2CiCb
 947                     ; 258 	TIM1_ClearFlag(TIM1_FLAG_CC3);
 949  00a2 ae0008        	ldw	x,#8
 950  00a5 cd0000        	call	_TIM1_ClearFlag
 952                     ; 259 	TIM1_ClearITPendingBit(TIM1_FLAG_CC3);
 954  00a8 a608          	ld	a,#8
 955  00aa cd0000        	call	_TIM1_ClearITPendingBit
 957                     ; 260 }
 960  00ad 85            	popw	x
 961  00ae bf00          	ldw	c_y,x
 962  00b0 320002        	pop	c_y+2
 963  00b3 85            	popw	x
 964  00b4 bf00          	ldw	c_x,x
 965  00b6 320002        	pop	c_x+2
 966  00b9 80            	iret	
 991                     ; 267 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25) 
 991                     ; 268 {
 992                     	switch	.text
 993  00ba               f_TIM4_UPD_OVF_TRG_IRQHandler:
 995  00ba 8a            	push	cc
 996  00bb 84            	pop	a
 997  00bc a4bf          	and	a,#191
 998  00be 88            	push	a
 999  00bf 86            	pop	cc
1000  00c0 3b0002        	push	c_x+2
1001  00c3 be00          	ldw	x,c_x
1002  00c5 89            	pushw	x
1003  00c6 3b0002        	push	c_y+2
1004  00c9 be00          	ldw	x,c_y
1005  00cb 89            	pushw	x
1008                     ; 269 	timer4_UpdateCb();
1010  00cc cd0000        	call	_timer4_UpdateCb
1012                     ; 270 	TIM4_ClearITPendingBit(TIM4_IT_Update);
1014  00cf a601          	ld	a,#1
1015  00d1 cd0000        	call	_TIM4_ClearITPendingBit
1017                     ; 271 }
1020  00d4 85            	popw	x
1021  00d5 bf00          	ldw	c_y,x
1022  00d7 320002        	pop	c_y+2
1023  00da 85            	popw	x
1024  00db bf00          	ldw	c_x,x
1025  00dd 320002        	pop	c_x+2
1026  00e0 80            	iret	
1048                     ; 278 INTERRUPT_HANDLER(SPI1_IRQHandler,26) { }
1049                     	switch	.text
1050  00e1               f_SPI1_IRQHandler:
1057  00e1 80            	iret	
1082                     ; 285 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27) 
1082                     ; 286 {
1083                     	switch	.text
1084  00e2               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1086  00e2 8a            	push	cc
1087  00e3 84            	pop	a
1088  00e4 a4bf          	and	a,#191
1089  00e6 88            	push	a
1090  00e7 86            	pop	cc
1091  00e8 3b0002        	push	c_x+2
1092  00eb be00          	ldw	x,c_x
1093  00ed 89            	pushw	x
1094  00ee 3b0002        	push	c_y+2
1095  00f1 be00          	ldw	x,c_y
1096  00f3 89            	pushw	x
1099                     ; 287 	uart1_tx_irq();
1101  00f4 cd0000        	call	_uart1_tx_irq
1103                     ; 288 }
1106  00f7 85            	popw	x
1107  00f8 bf00          	ldw	c_y,x
1108  00fa 320002        	pop	c_y+2
1109  00fd 85            	popw	x
1110  00fe bf00          	ldw	c_x,x
1111  0100 320002        	pop	c_x+2
1112  0103 80            	iret	
1136                     ; 295 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28) 
1136                     ; 296 {
1137                     	switch	.text
1138  0104               f_USART1_RX_TIM5_CC_IRQHandler:
1140  0104 8a            	push	cc
1141  0105 84            	pop	a
1142  0106 a4bf          	and	a,#191
1143  0108 88            	push	a
1144  0109 86            	pop	cc
1145  010a 3b0002        	push	c_x+2
1146  010d be00          	ldw	x,c_x
1147  010f 89            	pushw	x
1148  0110 3b0002        	push	c_y+2
1149  0113 be00          	ldw	x,c_y
1150  0115 89            	pushw	x
1153                     ; 297 	uart1_rx_irq();
1155  0116 cd0000        	call	_uart1_rx_irq
1157                     ; 298 }
1160  0119 85            	popw	x
1161  011a bf00          	ldw	c_y,x
1162  011c 320002        	pop	c_y+2
1163  011f 85            	popw	x
1164  0120 bf00          	ldw	c_x,x
1165  0122 320002        	pop	c_x+2
1166  0125 80            	iret	
1189                     ; 305 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29) { }
1190                     	switch	.text
1191  0126               f_I2C1_SPI2_IRQHandler:
1198  0126 80            	iret	
1200                     .const:	section	.text
1201  0000               __vectab:
1202  0000 82            	dc.b	130
1204  0001 00            	dc.b	page(__stext)
1205  0002 0000          	dc.w	__stext
1206  0004 82            	dc.b	130
1208  0005 01            	dc.b	page(f_TRAP_IRQHandler)
1209  0006 0001          	dc.w	f_TRAP_IRQHandler
1210  0008 82            	dc.b	130
1212  0009 00            	dc.b	page(f_NonHandledInterrupt)
1213  000a 0000          	dc.w	f_NonHandledInterrupt
1214  000c 82            	dc.b	130
1216  000d 02            	dc.b	page(f_FLASH_IRQHandler)
1217  000e 0002          	dc.w	f_FLASH_IRQHandler
1218  0010 82            	dc.b	130
1220  0011 03            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
1221  0012 0003          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
1222  0014 82            	dc.b	130
1224  0015 04            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
1225  0016 0004          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
1226  0018 82            	dc.b	130
1228  0019 05            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
1229  001a 0005          	dc.w	f_RTC_CSSLSE_IRQHandler
1230  001c 82            	dc.b	130
1232  001d 06            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
1233  001e 0006          	dc.w	f_EXTIE_F_PVD_IRQHandler
1234  0020 82            	dc.b	130
1236  0021 07            	dc.b	page(f_EXTIB_G_IRQHandler)
1237  0022 0007          	dc.w	f_EXTIB_G_IRQHandler
1238  0024 82            	dc.b	130
1240  0025 08            	dc.b	page(f_EXTID_H_IRQHandler)
1241  0026 0008          	dc.w	f_EXTID_H_IRQHandler
1242  0028 82            	dc.b	130
1244  0029 09            	dc.b	page(f_EXTI0_IRQHandler)
1245  002a 0009          	dc.w	f_EXTI0_IRQHandler
1246  002c 82            	dc.b	130
1248  002d 0a            	dc.b	page(f_EXTI1_IRQHandler)
1249  002e 000a          	dc.w	f_EXTI1_IRQHandler
1250  0030 82            	dc.b	130
1252  0031 0b            	dc.b	page(f_EXTI2_IRQHandler)
1253  0032 000b          	dc.w	f_EXTI2_IRQHandler
1254  0034 82            	dc.b	130
1256  0035 0c            	dc.b	page(f_EXTI3_IRQHandler)
1257  0036 000c          	dc.w	f_EXTI3_IRQHandler
1258  0038 82            	dc.b	130
1260  0039 0d            	dc.b	page(f_EXTI4_IRQHandler)
1261  003a 000d          	dc.w	f_EXTI4_IRQHandler
1262  003c 82            	dc.b	130
1264  003d 0e            	dc.b	page(f_EXTI5_IRQHandler)
1265  003e 000e          	dc.w	f_EXTI5_IRQHandler
1266  0040 82            	dc.b	130
1268  0041 36            	dc.b	page(f_EXTI6_IRQHandler)
1269  0042 0036          	dc.w	f_EXTI6_IRQHandler
1270  0044 82            	dc.b	130
1272  0045 37            	dc.b	page(f_EXTI7_IRQHandler)
1273  0046 0037          	dc.w	f_EXTI7_IRQHandler
1274  0048 82            	dc.b	130
1276  0049 38            	dc.b	page(f_LCD_AES_IRQHandler)
1277  004a 0038          	dc.w	f_LCD_AES_IRQHandler
1278  004c 82            	dc.b	130
1280  004d 39            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
1281  004e 0039          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1282  0050 82            	dc.b	130
1284  0051 3a            	dc.b	page(f_ADC1_COMP_IRQHandler)
1285  0052 003a          	dc.w	f_ADC1_COMP_IRQHandler
1286  0054 82            	dc.b	130
1288  0055 3b            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
1289  0056 003b          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1290  0058 82            	dc.b	130
1292  0059 62            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
1293  005a 0062          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
1294  005c 82            	dc.b	130
1296  005d 63            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
1297  005e 0063          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1298  0060 82            	dc.b	130
1300  0061 64            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
1301  0062 0064          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
1302  0064 82            	dc.b	130
1304  0065 65            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
1305  0066 0065          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1306  0068 82            	dc.b	130
1308  0069 8d            	dc.b	page(f_TIM1_CC_IRQHandler)
1309  006a 008d          	dc.w	f_TIM1_CC_IRQHandler
1310  006c 82            	dc.b	130
1312  006d ba            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
1313  006e 00ba          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
1314  0070 82            	dc.b	130
1316  0071 e1            	dc.b	page(f_SPI1_IRQHandler)
1317  0072 00e1          	dc.w	f_SPI1_IRQHandler
1318  0074 82            	dc.b	130
1320  0075 e2            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
1321  0076 00e2          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1322  0078 82            	dc.b	130
1324  0079 04            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
1325  007a 0104          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
1326  007c 82            	dc.b	130
1328  007d 26            	dc.b	page(f_I2C1_SPI2_IRQHandler)
1329  007e 0126          	dc.w	f_I2C1_SPI2_IRQHandler
1380                     	xdef	__vectab
1381                     	xref	__stext
1382                     	xdef	f_I2C1_SPI2_IRQHandler
1383                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1384                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1385                     	xdef	f_SPI1_IRQHandler
1386                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1387                     	xdef	f_TIM1_CC_IRQHandler
1388                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1389                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1390                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1391                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1392                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1393                     	xdef	f_ADC1_COMP_IRQHandler
1394                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1395                     	xdef	f_LCD_AES_IRQHandler
1396                     	xdef	f_EXTI7_IRQHandler
1397                     	xdef	f_EXTI6_IRQHandler
1398                     	xdef	f_EXTI5_IRQHandler
1399                     	xdef	f_EXTI4_IRQHandler
1400                     	xdef	f_EXTI3_IRQHandler
1401                     	xdef	f_EXTI2_IRQHandler
1402                     	xdef	f_EXTI1_IRQHandler
1403                     	xdef	f_EXTI0_IRQHandler
1404                     	xdef	f_EXTID_H_IRQHandler
1405                     	xdef	f_EXTIB_G_IRQHandler
1406                     	xdef	f_EXTIE_F_PVD_IRQHandler
1407                     	xdef	f_RTC_CSSLSE_IRQHandler
1408                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1409                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1410                     	xdef	f_FLASH_IRQHandler
1411                     	xdef	f_TRAP_IRQHandler
1412                     	xdef	f_NonHandledInterrupt
1413                     	xref	_timer2CiCb
1414                     	xref	_timer4_UpdateCb
1415                     	xref	_uart1_rx_irq
1416                     	xref	_uart1_tx_irq
1417                     	xref	_timer2_UpdateCb
1418                     	xref	_encoder_irq
1419                     	xref	_TIM4_ClearITPendingBit
1420                     	xref	_TIM2_ClearITPendingBit
1421                     	xref	_TIM1_ClearITPendingBit
1422                     	xref	_TIM1_ClearFlag
1423                     	xref	_EXTI_ClearITPendingBit
1424                     	xref.b	c_x
1425                     	xref.b	c_y
1444                     	end
