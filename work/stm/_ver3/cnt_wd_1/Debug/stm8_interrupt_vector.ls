   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  53                     ; 13 @far @interrupt void NonHandledInterrupt(void) { }
  54                     .text:	section	.text,new
  55  0000               f_NonHandledInterrupt:
  62  0000 80            	iret	
  84                     ; 15 @far @interrupt void TRAP_IRQHandler(void) { }
  85                     .text:	section	.text,new
  86  0000               f_TRAP_IRQHandler:
  93  0000 80            	iret	
 115                     ; 27 INTERRUPT_HANDLER(TLI_IRQHandler, 0) { }
 116                     .text:	section	.text,new
 117  0000               f_TLI_IRQHandler:
 124  0000 80            	iret	
 146                     ; 32 INTERRUPT_HANDLER(AWU_IRQHandler, 1)	{ }
 147                     .text:	section	.text,new
 148  0000               f_AWU_IRQHandler:
 155  0000 80            	iret	
 177                     ; 37 INTERRUPT_HANDLER(CLK_IRQHandler, 2) { }
 178                     .text:	section	.text,new
 179  0000               f_CLK_IRQHandler:
 186  0000 80            	iret	
 209                     ; 42 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 209                     ; 43 {	
 210                     .text:	section	.text,new
 211  0000               f_EXTI_PORTA_IRQHandler:
 215                     ; 47 }
 218  0000 80            	iret	
 241                     ; 52 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 241                     ; 53 {
 242                     .text:	section	.text,new
 243  0000               f_EXTI_PORTB_IRQHandler:
 247                     ; 57 }
 250  0000 80            	iret	
 273                     ; 62 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 273                     ; 63 {
 274                     .text:	section	.text,new
 275  0000               f_EXTI_PORTC_IRQHandler:
 279                     ; 64 }
 282  0000 80            	iret	
 305                     ; 69 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 305                     ; 70 {
 306                     .text:	section	.text,new
 307  0000               f_EXTI_PORTD_IRQHandler:
 311                     ; 71 }
 314  0000 80            	iret	
 337                     ; 76 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 337                     ; 77 {
 338                     .text:	section	.text,new
 339  0000               f_EXTI_PORTE_IRQHandler:
 343                     ; 78 }
 346  0000 80            	iret	
 368                     ; 103 INTERRUPT_HANDLER(SPI_IRQHandler, 10) { }
 369                     .text:	section	.text,new
 370  0000               f_SPI_IRQHandler:
 377  0000 80            	iret	
 400                     ; 108 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11) 
 400                     ; 109 { 
 401                     .text:	section	.text,new
 402  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 406                     ; 110 }
 409  0000 80            	iret	
 435                     ; 115 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12) 
 435                     ; 116 { 
 436                     .text:	section	.text,new
 437  0000               f_TIM1_CAP_COM_IRQHandler:
 439  0000 8a            	push	cc
 440  0001 84            	pop	a
 441  0002 a4bf          	and	a,#191
 442  0004 88            	push	a
 443  0005 86            	pop	cc
 444  0006 3b0002        	push	c_x+2
 445  0009 be00          	ldw	x,c_x
 446  000b 89            	pushw	x
 447  000c 3b0002        	push	c_y+2
 448  000f be00          	ldw	x,c_y
 449  0011 89            	pushw	x
 452                     ; 118 	timer1CiCb();
 454  0012 cd0000        	call	_timer1CiCb
 456                     ; 119 	TIM1_ClearFlag(TIM1_FLAG_CC2);
 458  0015 ae0004        	ldw	x,#4
 459  0018 cd0000        	call	_TIM1_ClearFlag
 461                     ; 120 	TIM1_ClearITPendingBit(TIM1_FLAG_CC2);
 463  001b a604          	ld	a,#4
 464  001d cd0000        	call	_TIM1_ClearITPendingBit
 466                     ; 122 }
 469  0020 85            	popw	x
 470  0021 bf00          	ldw	c_y,x
 471  0023 320002        	pop	c_y+2
 472  0026 85            	popw	x
 473  0027 bf00          	ldw	c_x,x
 474  0029 320002        	pop	c_x+2
 475  002c 80            	iret	
 498                     ; 140  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 498                     ; 141 {
 499                     .text:	section	.text,new
 500  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 504                     ; 154 }
 507  0000 80            	iret	
 533                     ; 159  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 533                     ; 160 {
 534                     .text:	section	.text,new
 535  0000               f_TIM2_CAP_COM_IRQHandler:
 537  0000 8a            	push	cc
 538  0001 84            	pop	a
 539  0002 a4bf          	and	a,#191
 540  0004 88            	push	a
 541  0005 86            	pop	cc
 542  0006 3b0002        	push	c_x+2
 543  0009 be00          	ldw	x,c_x
 544  000b 89            	pushw	x
 545  000c 3b0002        	push	c_y+2
 546  000f be00          	ldw	x,c_y
 547  0011 89            	pushw	x
 550                     ; 162 	timer2CiCb();
 552  0012 cd0000        	call	_timer2CiCb
 554                     ; 163 	TIM2_ClearFlag(TIM2_FLAG_CC2);
 556  0015 ae0004        	ldw	x,#4
 557  0018 cd0000        	call	_TIM2_ClearFlag
 559                     ; 164 	TIM2_ClearITPendingBit(TIM2_FLAG_CC2);
 561  001b a604          	ld	a,#4
 562  001d cd0000        	call	_TIM2_ClearITPendingBit
 564                     ; 166 }
 567  0020 85            	popw	x
 568  0021 bf00          	ldw	c_y,x
 569  0023 320002        	pop	c_y+2
 570  0026 85            	popw	x
 571  0027 bf00          	ldw	c_x,x
 572  0029 320002        	pop	c_x+2
 573  002c 80            	iret	
 596                     ; 174  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 596                     ; 175 {
 597                     .text:	section	.text,new
 598  0000               f_TIM3_UPD_OVF_BRK_IRQHandler:
 602                     ; 176 }
 605  0000 80            	iret	
 628                     ; 181  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 628                     ; 182 {
 629                     .text:	section	.text,new
 630  0000               f_TIM3_CAP_COM_IRQHandler:
 634                     ; 184 }
 637  0000 80            	iret	
 661                     ; 192  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 661                     ; 193 {
 662                     .text:	section	.text,new
 663  0000               f_UART1_TX_IRQHandler:
 665  0000 8a            	push	cc
 666  0001 84            	pop	a
 667  0002 a4bf          	and	a,#191
 668  0004 88            	push	a
 669  0005 86            	pop	cc
 670  0006 3b0002        	push	c_x+2
 671  0009 be00          	ldw	x,c_x
 672  000b 89            	pushw	x
 673  000c 3b0002        	push	c_y+2
 674  000f be00          	ldw	x,c_y
 675  0011 89            	pushw	x
 678                     ; 194 	uart1_tx_irq();
 680  0012 cd0000        	call	_uart1_tx_irq
 682                     ; 195 }
 685  0015 85            	popw	x
 686  0016 bf00          	ldw	c_y,x
 687  0018 320002        	pop	c_y+2
 688  001b 85            	popw	x
 689  001c bf00          	ldw	c_x,x
 690  001e 320002        	pop	c_x+2
 691  0021 80            	iret	
 715                     ; 200  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 715                     ; 201 {
 716                     .text:	section	.text,new
 717  0000               f_UART1_RX_IRQHandler:
 719  0000 8a            	push	cc
 720  0001 84            	pop	a
 721  0002 a4bf          	and	a,#191
 722  0004 88            	push	a
 723  0005 86            	pop	cc
 724  0006 3b0002        	push	c_x+2
 725  0009 be00          	ldw	x,c_x
 726  000b 89            	pushw	x
 727  000c 3b0002        	push	c_y+2
 728  000f be00          	ldw	x,c_y
 729  0011 89            	pushw	x
 732                     ; 202 	uart1_rx_irq();
 734  0012 cd0000        	call	_uart1_rx_irq
 736                     ; 203 }
 739  0015 85            	popw	x
 740  0016 bf00          	ldw	c_y,x
 741  0018 320002        	pop	c_y+2
 742  001b 85            	popw	x
 743  001c bf00          	ldw	c_x,x
 744  001e 320002        	pop	c_x+2
 745  0021 80            	iret	
 767                     ; 209 INTERRUPT_HANDLER(I2C_IRQHandler, 19) { }
 768                     .text:	section	.text,new
 769  0000               f_I2C_IRQHandler:
 776  0000 80            	iret	
 800                     ; 227  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 800                     ; 228 {
 801                     .text:	section	.text,new
 802  0000               f_UART3_TX_IRQHandler:
 804  0000 8a            	push	cc
 805  0001 84            	pop	a
 806  0002 a4bf          	and	a,#191
 807  0004 88            	push	a
 808  0005 86            	pop	cc
 809  0006 3b0002        	push	c_x+2
 810  0009 be00          	ldw	x,c_x
 811  000b 89            	pushw	x
 812  000c 3b0002        	push	c_y+2
 813  000f be00          	ldw	x,c_y
 814  0011 89            	pushw	x
 817                     ; 229 	uart3_tx_irq();
 819  0012 cd0000        	call	_uart3_tx_irq
 821                     ; 230 }
 824  0015 85            	popw	x
 825  0016 bf00          	ldw	c_y,x
 826  0018 320002        	pop	c_y+2
 827  001b 85            	popw	x
 828  001c bf00          	ldw	c_x,x
 829  001e 320002        	pop	c_x+2
 830  0021 80            	iret	
 854                     ; 235  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 854                     ; 236 {
 855                     .text:	section	.text,new
 856  0000               f_UART3_RX_IRQHandler:
 858  0000 8a            	push	cc
 859  0001 84            	pop	a
 860  0002 a4bf          	and	a,#191
 861  0004 88            	push	a
 862  0005 86            	pop	cc
 863  0006 3b0002        	push	c_x+2
 864  0009 be00          	ldw	x,c_x
 865  000b 89            	pushw	x
 866  000c 3b0002        	push	c_y+2
 867  000f be00          	ldw	x,c_y
 868  0011 89            	pushw	x
 871                     ; 237 	uart3_rx_irq();
 873  0012 cd0000        	call	_uart3_rx_irq
 875                     ; 238 }
 878  0015 85            	popw	x
 879  0016 bf00          	ldw	c_y,x
 880  0018 320002        	pop	c_y+2
 881  001b 85            	popw	x
 882  001c bf00          	ldw	c_x,x
 883  001e 320002        	pop	c_x+2
 884  0021 80            	iret	
 906                     ; 245  INTERRUPT_HANDLER(ADC2_IRQHandler, 22) { }
 907                     .text:	section	.text,new
 908  0000               f_ADC2_IRQHandler:
 915  0000 80            	iret	
 940                     ; 262  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) 
 940                     ; 263 { 
 941                     .text:	section	.text,new
 942  0000               f_TIM4_UPD_OVF_IRQHandler:
 944  0000 8a            	push	cc
 945  0001 84            	pop	a
 946  0002 a4bf          	and	a,#191
 947  0004 88            	push	a
 948  0005 86            	pop	cc
 949  0006 3b0002        	push	c_x+2
 950  0009 be00          	ldw	x,c_x
 951  000b 89            	pushw	x
 952  000c 3b0002        	push	c_y+2
 953  000f be00          	ldw	x,c_y
 954  0011 89            	pushw	x
 957                     ; 265 	timer4_UpdateCb();
 959  0012 cd0000        	call	_timer4_UpdateCb
 961                     ; 266 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 963  0015 a601          	ld	a,#1
 964  0017 cd0000        	call	_TIM4_ClearITPendingBit
 966                     ; 268 }
 969  001a 85            	popw	x
 970  001b bf00          	ldw	c_y,x
 971  001d 320002        	pop	c_y+2
 972  0020 85            	popw	x
 973  0021 bf00          	ldw	c_x,x
 974  0023 320002        	pop	c_x+2
 975  0026 80            	iret	
 998                     ; 274 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24) { }
 999                     .text:	section	.text,new
1000  0000               f_EEPROM_EEC_IRQHandler:
1007  0000 80            	iret	
1009                     .const:	section	.text
1010  0000               __vectab:
1011  0000 82            	dc.b	130
1013  0001 00            	dc.b	page(__stext)
1014  0002 0000          	dc.w	__stext
1015  0004 82            	dc.b	130
1017  0005 00            	dc.b	page(f_TRAP_IRQHandler)
1018  0006 0000          	dc.w	f_TRAP_IRQHandler
1019  0008 82            	dc.b	130
1021  0009 00            	dc.b	page(f_TLI_IRQHandler)
1022  000a 0000          	dc.w	f_TLI_IRQHandler
1023  000c 82            	dc.b	130
1025  000d 00            	dc.b	page(f_AWU_IRQHandler)
1026  000e 0000          	dc.w	f_AWU_IRQHandler
1027  0010 82            	dc.b	130
1029  0011 00            	dc.b	page(f_CLK_IRQHandler)
1030  0012 0000          	dc.w	f_CLK_IRQHandler
1031  0014 82            	dc.b	130
1033  0015 00            	dc.b	page(f_EXTI_PORTA_IRQHandler)
1034  0016 0000          	dc.w	f_EXTI_PORTA_IRQHandler
1035  0018 82            	dc.b	130
1037  0019 00            	dc.b	page(f_EXTI_PORTB_IRQHandler)
1038  001a 0000          	dc.w	f_EXTI_PORTB_IRQHandler
1039  001c 82            	dc.b	130
1041  001d 00            	dc.b	page(f_EXTI_PORTC_IRQHandler)
1042  001e 0000          	dc.w	f_EXTI_PORTC_IRQHandler
1043  0020 82            	dc.b	130
1045  0021 00            	dc.b	page(f_EXTI_PORTD_IRQHandler)
1046  0022 0000          	dc.w	f_EXTI_PORTD_IRQHandler
1047  0024 82            	dc.b	130
1049  0025 00            	dc.b	page(f_EXTI_PORTE_IRQHandler)
1050  0026 0000          	dc.w	f_EXTI_PORTE_IRQHandler
1051  0028 82            	dc.b	130
1053  0029 00            	dc.b	page(f_NonHandledInterrupt)
1054  002a 0000          	dc.w	f_NonHandledInterrupt
1055  002c 82            	dc.b	130
1057  002d 00            	dc.b	page(f_NonHandledInterrupt)
1058  002e 0000          	dc.w	f_NonHandledInterrupt
1059  0030 82            	dc.b	130
1061  0031 00            	dc.b	page(f_SPI_IRQHandler)
1062  0032 0000          	dc.w	f_SPI_IRQHandler
1063  0034 82            	dc.b	130
1065  0035 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_BRK_IRQHandler)
1066  0036 0000          	dc.w	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1067  0038 82            	dc.b	130
1069  0039 00            	dc.b	page(f_TIM1_CAP_COM_IRQHandler)
1070  003a 0000          	dc.w	f_TIM1_CAP_COM_IRQHandler
1071  003c 82            	dc.b	130
1073  003d 00            	dc.b	page(f_TIM2_UPD_OVF_BRK_IRQHandler)
1074  003e 0000          	dc.w	f_TIM2_UPD_OVF_BRK_IRQHandler
1075  0040 82            	dc.b	130
1077  0041 00            	dc.b	page(f_TIM2_CAP_COM_IRQHandler)
1078  0042 0000          	dc.w	f_TIM2_CAP_COM_IRQHandler
1079  0044 82            	dc.b	130
1081  0045 00            	dc.b	page(f_TIM3_UPD_OVF_BRK_IRQHandler)
1082  0046 0000          	dc.w	f_TIM3_UPD_OVF_BRK_IRQHandler
1083  0048 82            	dc.b	130
1085  0049 00            	dc.b	page(f_TIM3_CAP_COM_IRQHandler)
1086  004a 0000          	dc.w	f_TIM3_CAP_COM_IRQHandler
1087  004c 82            	dc.b	130
1089  004d 00            	dc.b	page(f_UART1_TX_IRQHandler)
1090  004e 0000          	dc.w	f_UART1_TX_IRQHandler
1091  0050 82            	dc.b	130
1093  0051 00            	dc.b	page(f_UART1_RX_IRQHandler)
1094  0052 0000          	dc.w	f_UART1_RX_IRQHandler
1095  0054 82            	dc.b	130
1097  0055 00            	dc.b	page(f_I2C_IRQHandler)
1098  0056 0000          	dc.w	f_I2C_IRQHandler
1099  0058 82            	dc.b	130
1101  0059 00            	dc.b	page(f_UART3_TX_IRQHandler)
1102  005a 0000          	dc.w	f_UART3_TX_IRQHandler
1103  005c 82            	dc.b	130
1105  005d 00            	dc.b	page(f_UART3_RX_IRQHandler)
1106  005e 0000          	dc.w	f_UART3_RX_IRQHandler
1107  0060 82            	dc.b	130
1109  0061 00            	dc.b	page(f_ADC2_IRQHandler)
1110  0062 0000          	dc.w	f_ADC2_IRQHandler
1111  0064 82            	dc.b	130
1113  0065 00            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
1114  0066 0000          	dc.w	f_TIM4_UPD_OVF_IRQHandler
1115  0068 82            	dc.b	130
1117  0069 00            	dc.b	page(f_EEPROM_EEC_IRQHandler)
1118  006a 0000          	dc.w	f_EEPROM_EEC_IRQHandler
1119  006c 82            	dc.b	130
1121  006d 00            	dc.b	page(f_NonHandledInterrupt)
1122  006e 0000          	dc.w	f_NonHandledInterrupt
1123  0070 82            	dc.b	130
1125  0071 00            	dc.b	page(f_NonHandledInterrupt)
1126  0072 0000          	dc.w	f_NonHandledInterrupt
1127  0074 82            	dc.b	130
1129  0075 00            	dc.b	page(f_NonHandledInterrupt)
1130  0076 0000          	dc.w	f_NonHandledInterrupt
1131  0078 82            	dc.b	130
1133  0079 00            	dc.b	page(f_NonHandledInterrupt)
1134  007a 0000          	dc.w	f_NonHandledInterrupt
1135  007c 82            	dc.b	130
1137  007d 00            	dc.b	page(f_NonHandledInterrupt)
1138  007e 0000          	dc.w	f_NonHandledInterrupt
1189                     	xdef	__vectab
1190                     	xref	__stext
1191                     	xdef	f_EEPROM_EEC_IRQHandler
1192                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1193                     	xdef	f_ADC2_IRQHandler
1194                     	xdef	f_UART3_RX_IRQHandler
1195                     	xdef	f_UART3_TX_IRQHandler
1196                     	xdef	f_I2C_IRQHandler
1197                     	xdef	f_UART1_RX_IRQHandler
1198                     	xdef	f_UART1_TX_IRQHandler
1199                     	xdef	f_TIM3_CAP_COM_IRQHandler
1200                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1201                     	xdef	f_TIM2_CAP_COM_IRQHandler
1202                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1203                     	xdef	f_TIM1_CAP_COM_IRQHandler
1204                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1205                     	xdef	f_SPI_IRQHandler
1206                     	xdef	f_EXTI_PORTE_IRQHandler
1207                     	xdef	f_EXTI_PORTD_IRQHandler
1208                     	xdef	f_EXTI_PORTC_IRQHandler
1209                     	xdef	f_EXTI_PORTB_IRQHandler
1210                     	xdef	f_EXTI_PORTA_IRQHandler
1211                     	xdef	f_CLK_IRQHandler
1212                     	xdef	f_AWU_IRQHandler
1213                     	xdef	f_TLI_IRQHandler
1214                     	xdef	f_TRAP_IRQHandler
1215                     	xdef	f_NonHandledInterrupt
1216                     	xref	_timer1CiCb
1217                     	xref	_timer2CiCb
1218                     	xref	_timer4_UpdateCb
1219                     	xref	_uart3_rx_irq
1220                     	xref	_uart3_tx_irq
1221                     	xref	_uart1_rx_irq
1222                     	xref	_uart1_tx_irq
1223                     	xref	_TIM4_ClearITPendingBit
1224                     	xref	_TIM2_ClearITPendingBit
1225                     	xref	_TIM2_ClearFlag
1226                     	xref	_TIM1_ClearITPendingBit
1227                     	xref	_TIM1_ClearFlag
1228                     	xref.b	c_x
1229                     	xref.b	c_y
1248                     	end
