   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  44                     ; 50 void SPI_DeInit(void)
  44                     ; 51 {
  46                     	switch	.text
  47  0000               _SPI_DeInit:
  51                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  53  0000 725f5200      	clr	20992
  54                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  56  0004 725f5201      	clr	20993
  57                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  59  0008 725f5202      	clr	20994
  60                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  62  000c 35025203      	mov	20995,#2
  63                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  65  0010 35075205      	mov	20997,#7
  66                     ; 57 }
  69  0014 81            	ret
 386                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 386                     ; 79 {
 387                     	switch	.text
 388  0015               _SPI_Init:
 390  0015 89            	pushw	x
 391  0016 88            	push	a
 392       00000001      OFST:	set	1
 395                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 397  0017 9e            	ld	a,xh
 398  0018 4d            	tnz	a
 399  0019 2705          	jreq	L21
 400  001b 9e            	ld	a,xh
 401  001c a180          	cp	a,#128
 402  001e 2603          	jrne	L01
 403  0020               L21:
 404  0020 4f            	clr	a
 405  0021 2010          	jra	L41
 406  0023               L01:
 407  0023 ae0051        	ldw	x,#81
 408  0026 89            	pushw	x
 409  0027 ae0000        	ldw	x,#0
 410  002a 89            	pushw	x
 411  002b ae0000        	ldw	x,#L302
 412  002e cd0000        	call	_assert_failed
 414  0031 5b04          	addw	sp,#4
 415  0033               L41:
 416                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 418  0033 0d03          	tnz	(OFST+2,sp)
 419  0035 272a          	jreq	L02
 420  0037 7b03          	ld	a,(OFST+2,sp)
 421  0039 a108          	cp	a,#8
 422  003b 2724          	jreq	L02
 423  003d 7b03          	ld	a,(OFST+2,sp)
 424  003f a110          	cp	a,#16
 425  0041 271e          	jreq	L02
 426  0043 7b03          	ld	a,(OFST+2,sp)
 427  0045 a118          	cp	a,#24
 428  0047 2718          	jreq	L02
 429  0049 7b03          	ld	a,(OFST+2,sp)
 430  004b a120          	cp	a,#32
 431  004d 2712          	jreq	L02
 432  004f 7b03          	ld	a,(OFST+2,sp)
 433  0051 a128          	cp	a,#40
 434  0053 270c          	jreq	L02
 435  0055 7b03          	ld	a,(OFST+2,sp)
 436  0057 a130          	cp	a,#48
 437  0059 2706          	jreq	L02
 438  005b 7b03          	ld	a,(OFST+2,sp)
 439  005d a138          	cp	a,#56
 440  005f 2603          	jrne	L61
 441  0061               L02:
 442  0061 4f            	clr	a
 443  0062 2010          	jra	L22
 444  0064               L61:
 445  0064 ae0052        	ldw	x,#82
 446  0067 89            	pushw	x
 447  0068 ae0000        	ldw	x,#0
 448  006b 89            	pushw	x
 449  006c ae0000        	ldw	x,#L302
 450  006f cd0000        	call	_assert_failed
 452  0072 5b04          	addw	sp,#4
 453  0074               L22:
 454                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 456  0074 7b06          	ld	a,(OFST+5,sp)
 457  0076 a104          	cp	a,#4
 458  0078 2704          	jreq	L62
 459  007a 0d06          	tnz	(OFST+5,sp)
 460  007c 2603          	jrne	L42
 461  007e               L62:
 462  007e 4f            	clr	a
 463  007f 2010          	jra	L03
 464  0081               L42:
 465  0081 ae0053        	ldw	x,#83
 466  0084 89            	pushw	x
 467  0085 ae0000        	ldw	x,#0
 468  0088 89            	pushw	x
 469  0089 ae0000        	ldw	x,#L302
 470  008c cd0000        	call	_assert_failed
 472  008f 5b04          	addw	sp,#4
 473  0091               L03:
 474                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 476  0091 0d07          	tnz	(OFST+6,sp)
 477  0093 2706          	jreq	L43
 478  0095 7b07          	ld	a,(OFST+6,sp)
 479  0097 a102          	cp	a,#2
 480  0099 2603          	jrne	L23
 481  009b               L43:
 482  009b 4f            	clr	a
 483  009c 2010          	jra	L63
 484  009e               L23:
 485  009e ae0054        	ldw	x,#84
 486  00a1 89            	pushw	x
 487  00a2 ae0000        	ldw	x,#0
 488  00a5 89            	pushw	x
 489  00a6 ae0000        	ldw	x,#L302
 490  00a9 cd0000        	call	_assert_failed
 492  00ac 5b04          	addw	sp,#4
 493  00ae               L63:
 494                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 496  00ae 0d08          	tnz	(OFST+7,sp)
 497  00b0 2706          	jreq	L24
 498  00b2 7b08          	ld	a,(OFST+7,sp)
 499  00b4 a101          	cp	a,#1
 500  00b6 2603          	jrne	L04
 501  00b8               L24:
 502  00b8 4f            	clr	a
 503  00b9 2010          	jra	L44
 504  00bb               L04:
 505  00bb ae0055        	ldw	x,#85
 506  00be 89            	pushw	x
 507  00bf ae0000        	ldw	x,#0
 508  00c2 89            	pushw	x
 509  00c3 ae0000        	ldw	x,#L302
 510  00c6 cd0000        	call	_assert_failed
 512  00c9 5b04          	addw	sp,#4
 513  00cb               L44:
 514                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 516  00cb 0d09          	tnz	(OFST+8,sp)
 517  00cd 2712          	jreq	L05
 518  00cf 7b09          	ld	a,(OFST+8,sp)
 519  00d1 a104          	cp	a,#4
 520  00d3 270c          	jreq	L05
 521  00d5 7b09          	ld	a,(OFST+8,sp)
 522  00d7 a180          	cp	a,#128
 523  00d9 2706          	jreq	L05
 524  00db 7b09          	ld	a,(OFST+8,sp)
 525  00dd a1c0          	cp	a,#192
 526  00df 2603          	jrne	L64
 527  00e1               L05:
 528  00e1 4f            	clr	a
 529  00e2 2010          	jra	L25
 530  00e4               L64:
 531  00e4 ae0056        	ldw	x,#86
 532  00e7 89            	pushw	x
 533  00e8 ae0000        	ldw	x,#0
 534  00eb 89            	pushw	x
 535  00ec ae0000        	ldw	x,#L302
 536  00ef cd0000        	call	_assert_failed
 538  00f2 5b04          	addw	sp,#4
 539  00f4               L25:
 540                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 542  00f4 7b0a          	ld	a,(OFST+9,sp)
 543  00f6 a102          	cp	a,#2
 544  00f8 2704          	jreq	L65
 545  00fa 0d0a          	tnz	(OFST+9,sp)
 546  00fc 2603          	jrne	L45
 547  00fe               L65:
 548  00fe 4f            	clr	a
 549  00ff 2010          	jra	L06
 550  0101               L45:
 551  0101 ae0057        	ldw	x,#87
 552  0104 89            	pushw	x
 553  0105 ae0000        	ldw	x,#0
 554  0108 89            	pushw	x
 555  0109 ae0000        	ldw	x,#L302
 556  010c cd0000        	call	_assert_failed
 558  010f 5b04          	addw	sp,#4
 559  0111               L06:
 560                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 562  0111 0d0b          	tnz	(OFST+10,sp)
 563  0113 2703          	jreq	L26
 564  0115 4f            	clr	a
 565  0116 2010          	jra	L46
 566  0118               L26:
 567  0118 ae0058        	ldw	x,#88
 568  011b 89            	pushw	x
 569  011c ae0000        	ldw	x,#0
 570  011f 89            	pushw	x
 571  0120 ae0000        	ldw	x,#L302
 572  0123 cd0000        	call	_assert_failed
 574  0126 5b04          	addw	sp,#4
 575  0128               L46:
 576                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 576                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 578  0128 7b07          	ld	a,(OFST+6,sp)
 579  012a 1a08          	or	a,(OFST+7,sp)
 580  012c 6b01          	ld	(OFST+0,sp),a
 582  012e 7b02          	ld	a,(OFST+1,sp)
 583  0130 1a03          	or	a,(OFST+2,sp)
 584  0132 1a01          	or	a,(OFST+0,sp)
 585  0134 c75200        	ld	20992,a
 586                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 588  0137 7b09          	ld	a,(OFST+8,sp)
 589  0139 1a0a          	or	a,(OFST+9,sp)
 590  013b c75201        	ld	20993,a
 591                     ; 97   if (Mode == SPI_MODE_MASTER)
 593  013e 7b06          	ld	a,(OFST+5,sp)
 594  0140 a104          	cp	a,#4
 595  0142 2606          	jrne	L502
 596                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 598  0144 72105201      	bset	20993,#0
 600  0148 2004          	jra	L702
 601  014a               L502:
 602                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 604  014a 72115201      	bres	20993,#0
 605  014e               L702:
 606                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 608  014e c65200        	ld	a,20992
 609  0151 1a06          	or	a,(OFST+5,sp)
 610  0153 c75200        	ld	20992,a
 611                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 613  0156 7b0b          	ld	a,(OFST+10,sp)
 614  0158 c75205        	ld	20997,a
 615                     ; 111 }
 618  015b 5b03          	addw	sp,#3
 619  015d 81            	ret
 675                     ; 119 void SPI_Cmd(FunctionalState NewState)
 675                     ; 120 {
 676                     	switch	.text
 677  015e               _SPI_Cmd:
 679  015e 88            	push	a
 680       00000000      OFST:	set	0
 683                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 685  015f 4d            	tnz	a
 686  0160 2704          	jreq	L27
 687  0162 a101          	cp	a,#1
 688  0164 2603          	jrne	L07
 689  0166               L27:
 690  0166 4f            	clr	a
 691  0167 2010          	jra	L47
 692  0169               L07:
 693  0169 ae007a        	ldw	x,#122
 694  016c 89            	pushw	x
 695  016d ae0000        	ldw	x,#0
 696  0170 89            	pushw	x
 697  0171 ae0000        	ldw	x,#L302
 698  0174 cd0000        	call	_assert_failed
 700  0177 5b04          	addw	sp,#4
 701  0179               L47:
 702                     ; 124   if (NewState != DISABLE)
 704  0179 0d01          	tnz	(OFST+1,sp)
 705  017b 2706          	jreq	L732
 706                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 708  017d 721c5200      	bset	20992,#6
 710  0181 2004          	jra	L142
 711  0183               L732:
 712                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 714  0183 721d5200      	bres	20992,#6
 715  0187               L142:
 716                     ; 132 }
 719  0187 84            	pop	a
 720  0188 81            	ret
 830                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 830                     ; 142 {
 831                     	switch	.text
 832  0189               _SPI_ITConfig:
 834  0189 89            	pushw	x
 835  018a 88            	push	a
 836       00000001      OFST:	set	1
 839                     ; 143   uint8_t itpos = 0;
 841                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 843  018b 9e            	ld	a,xh
 844  018c a117          	cp	a,#23
 845  018e 270f          	jreq	L201
 846  0190 9e            	ld	a,xh
 847  0191 a106          	cp	a,#6
 848  0193 270a          	jreq	L201
 849  0195 9e            	ld	a,xh
 850  0196 a105          	cp	a,#5
 851  0198 2705          	jreq	L201
 852  019a 9e            	ld	a,xh
 853  019b a134          	cp	a,#52
 854  019d 2603          	jrne	L001
 855  019f               L201:
 856  019f 4f            	clr	a
 857  01a0 2010          	jra	L401
 858  01a2               L001:
 859  01a2 ae0091        	ldw	x,#145
 860  01a5 89            	pushw	x
 861  01a6 ae0000        	ldw	x,#0
 862  01a9 89            	pushw	x
 863  01aa ae0000        	ldw	x,#L302
 864  01ad cd0000        	call	_assert_failed
 866  01b0 5b04          	addw	sp,#4
 867  01b2               L401:
 868                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 870  01b2 0d03          	tnz	(OFST+2,sp)
 871  01b4 2706          	jreq	L011
 872  01b6 7b03          	ld	a,(OFST+2,sp)
 873  01b8 a101          	cp	a,#1
 874  01ba 2603          	jrne	L601
 875  01bc               L011:
 876  01bc 4f            	clr	a
 877  01bd 2010          	jra	L211
 878  01bf               L601:
 879  01bf ae0092        	ldw	x,#146
 880  01c2 89            	pushw	x
 881  01c3 ae0000        	ldw	x,#0
 882  01c6 89            	pushw	x
 883  01c7 ae0000        	ldw	x,#L302
 884  01ca cd0000        	call	_assert_failed
 886  01cd 5b04          	addw	sp,#4
 887  01cf               L211:
 888                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 890  01cf 7b02          	ld	a,(OFST+1,sp)
 891  01d1 a40f          	and	a,#15
 892  01d3 5f            	clrw	x
 893  01d4 97            	ld	xl,a
 894  01d5 a601          	ld	a,#1
 895  01d7 5d            	tnzw	x
 896  01d8 2704          	jreq	L411
 897  01da               L611:
 898  01da 48            	sll	a
 899  01db 5a            	decw	x
 900  01dc 26fc          	jrne	L611
 901  01de               L411:
 902  01de 6b01          	ld	(OFST+0,sp),a
 904                     ; 151   if (NewState != DISABLE)
 906  01e0 0d03          	tnz	(OFST+2,sp)
 907  01e2 270a          	jreq	L313
 908                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 910  01e4 c65202        	ld	a,20994
 911  01e7 1a01          	or	a,(OFST+0,sp)
 912  01e9 c75202        	ld	20994,a
 914  01ec 2009          	jra	L513
 915  01ee               L313:
 916                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 918  01ee 7b01          	ld	a,(OFST+0,sp)
 919  01f0 43            	cpl	a
 920  01f1 c45202        	and	a,20994
 921  01f4 c75202        	ld	20994,a
 922  01f7               L513:
 923                     ; 159 }
 926  01f7 5b03          	addw	sp,#3
 927  01f9 81            	ret
 961                     ; 166 void SPI_SendData(uint8_t Data)
 961                     ; 167 {
 962                     	switch	.text
 963  01fa               _SPI_SendData:
 967                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 969  01fa c75204        	ld	20996,a
 970                     ; 169 }
 973  01fd 81            	ret
 996                     ; 176 uint8_t SPI_ReceiveData(void)
 996                     ; 177 {
 997                     	switch	.text
 998  01fe               _SPI_ReceiveData:
1002                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
1004  01fe c65204        	ld	a,20996
1007  0201 81            	ret
1044                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
1044                     ; 188 {
1045                     	switch	.text
1046  0202               _SPI_NSSInternalSoftwareCmd:
1048  0202 88            	push	a
1049       00000000      OFST:	set	0
1052                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1054  0203 4d            	tnz	a
1055  0204 2704          	jreq	L031
1056  0206 a101          	cp	a,#1
1057  0208 2603          	jrne	L621
1058  020a               L031:
1059  020a 4f            	clr	a
1060  020b 2010          	jra	L231
1061  020d               L621:
1062  020d ae00be        	ldw	x,#190
1063  0210 89            	pushw	x
1064  0211 ae0000        	ldw	x,#0
1065  0214 89            	pushw	x
1066  0215 ae0000        	ldw	x,#L302
1067  0218 cd0000        	call	_assert_failed
1069  021b 5b04          	addw	sp,#4
1070  021d               L231:
1071                     ; 192   if (NewState != DISABLE)
1073  021d 0d01          	tnz	(OFST+1,sp)
1074  021f 2706          	jreq	L363
1075                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1077  0221 72105201      	bset	20993,#0
1079  0225 2004          	jra	L563
1080  0227               L363:
1081                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1083  0227 72115201      	bres	20993,#0
1084  022b               L563:
1085                     ; 200 }
1088  022b 84            	pop	a
1089  022c 81            	ret
1112                     ; 207 void SPI_TransmitCRC(void)
1112                     ; 208 {
1113                     	switch	.text
1114  022d               _SPI_TransmitCRC:
1118                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1120  022d 72185201      	bset	20993,#4
1121                     ; 210 }
1124  0231 81            	ret
1161                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
1161                     ; 219 {
1162                     	switch	.text
1163  0232               _SPI_CalculateCRCCmd:
1165  0232 88            	push	a
1166       00000000      OFST:	set	0
1169                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1171  0233 4d            	tnz	a
1172  0234 2704          	jreq	L241
1173  0236 a101          	cp	a,#1
1174  0238 2603          	jrne	L041
1175  023a               L241:
1176  023a 4f            	clr	a
1177  023b 2010          	jra	L441
1178  023d               L041:
1179  023d ae00dd        	ldw	x,#221
1180  0240 89            	pushw	x
1181  0241 ae0000        	ldw	x,#0
1182  0244 89            	pushw	x
1183  0245 ae0000        	ldw	x,#L302
1184  0248 cd0000        	call	_assert_failed
1186  024b 5b04          	addw	sp,#4
1187  024d               L441:
1188                     ; 223   if (NewState != DISABLE)
1190  024d 0d01          	tnz	(OFST+1,sp)
1191  024f 2706          	jreq	L514
1192                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1194  0251 721a5201      	bset	20993,#5
1196  0255 2004          	jra	L714
1197  0257               L514:
1198                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1200  0257 721b5201      	bres	20993,#5
1201  025b               L714:
1202                     ; 231 }
1205  025b 84            	pop	a
1206  025c 81            	ret
1271                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1271                     ; 239 {
1272                     	switch	.text
1273  025d               _SPI_GetCRC:
1275  025d 88            	push	a
1276  025e 88            	push	a
1277       00000001      OFST:	set	1
1280                     ; 240   uint8_t crcreg = 0;
1282                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1284  025f a101          	cp	a,#1
1285  0261 2703          	jreq	L251
1286  0263 4d            	tnz	a
1287  0264 2603          	jrne	L051
1288  0266               L251:
1289  0266 4f            	clr	a
1290  0267 2010          	jra	L451
1291  0269               L051:
1292  0269 ae00f3        	ldw	x,#243
1293  026c 89            	pushw	x
1294  026d ae0000        	ldw	x,#0
1295  0270 89            	pushw	x
1296  0271 ae0000        	ldw	x,#L302
1297  0274 cd0000        	call	_assert_failed
1299  0277 5b04          	addw	sp,#4
1300  0279               L451:
1301                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1303  0279 0d02          	tnz	(OFST+1,sp)
1304  027b 2707          	jreq	L354
1305                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1307  027d c65207        	ld	a,20999
1308  0280 6b01          	ld	(OFST+0,sp),a
1311  0282 2005          	jra	L554
1312  0284               L354:
1313                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1315  0284 c65206        	ld	a,20998
1316  0287 6b01          	ld	(OFST+0,sp),a
1318  0289               L554:
1319                     ; 255   return crcreg;
1321  0289 7b01          	ld	a,(OFST+0,sp)
1324  028b 85            	popw	x
1325  028c 81            	ret
1350                     ; 263 void SPI_ResetCRC(void)
1350                     ; 264 {
1351                     	switch	.text
1352  028d               _SPI_ResetCRC:
1356                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1358  028d a601          	ld	a,#1
1359  028f ada1          	call	_SPI_CalculateCRCCmd
1361                     ; 270   SPI_Cmd(ENABLE);
1363  0291 a601          	ld	a,#1
1364  0293 cd015e        	call	_SPI_Cmd
1366                     ; 271 }
1369  0296 81            	ret
1393                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1393                     ; 279 {
1394                     	switch	.text
1395  0297               _SPI_GetCRCPolynomial:
1399                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1401  0297 c65205        	ld	a,20997
1404  029a 81            	ret
1461                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1461                     ; 289 {
1462                     	switch	.text
1463  029b               _SPI_BiDirectionalLineConfig:
1465  029b 88            	push	a
1466       00000000      OFST:	set	0
1469                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1471  029c 4d            	tnz	a
1472  029d 2704          	jreq	L661
1473  029f a101          	cp	a,#1
1474  02a1 2603          	jrne	L461
1475  02a3               L661:
1476  02a3 4f            	clr	a
1477  02a4 2010          	jra	L071
1478  02a6               L461:
1479  02a6 ae0123        	ldw	x,#291
1480  02a9 89            	pushw	x
1481  02aa ae0000        	ldw	x,#0
1482  02ad 89            	pushw	x
1483  02ae ae0000        	ldw	x,#L302
1484  02b1 cd0000        	call	_assert_failed
1486  02b4 5b04          	addw	sp,#4
1487  02b6               L071:
1488                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1490  02b6 0d01          	tnz	(OFST+1,sp)
1491  02b8 2706          	jreq	L525
1492                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1494  02ba 721c5201      	bset	20993,#6
1496  02be 2004          	jra	L725
1497  02c0               L525:
1498                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1500  02c0 721d5201      	bres	20993,#6
1501  02c4               L725:
1502                     ; 301 }
1505  02c4 84            	pop	a
1506  02c5 81            	ret
1628                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1628                     ; 312 {
1629                     	switch	.text
1630  02c6               _SPI_GetFlagStatus:
1632  02c6 88            	push	a
1633  02c7 88            	push	a
1634       00000001      OFST:	set	1
1637                     ; 313   FlagStatus status = RESET;
1639                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1641  02c8 a140          	cp	a,#64
1642  02ca 2718          	jreq	L671
1643  02cc a120          	cp	a,#32
1644  02ce 2714          	jreq	L671
1645  02d0 a110          	cp	a,#16
1646  02d2 2710          	jreq	L671
1647  02d4 a108          	cp	a,#8
1648  02d6 270c          	jreq	L671
1649  02d8 a102          	cp	a,#2
1650  02da 2708          	jreq	L671
1651  02dc a101          	cp	a,#1
1652  02de 2704          	jreq	L671
1653  02e0 a180          	cp	a,#128
1654  02e2 2603          	jrne	L471
1655  02e4               L671:
1656  02e4 4f            	clr	a
1657  02e5 2010          	jra	L002
1658  02e7               L471:
1659  02e7 ae013b        	ldw	x,#315
1660  02ea 89            	pushw	x
1661  02eb ae0000        	ldw	x,#0
1662  02ee 89            	pushw	x
1663  02ef ae0000        	ldw	x,#L302
1664  02f2 cd0000        	call	_assert_failed
1666  02f5 5b04          	addw	sp,#4
1667  02f7               L002:
1668                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1670  02f7 c65203        	ld	a,20995
1671  02fa 1502          	bcp	a,(OFST+1,sp)
1672  02fc 2706          	jreq	L506
1673                     ; 320     status = SET; /* SPI_FLAG is set */
1675  02fe a601          	ld	a,#1
1676  0300 6b01          	ld	(OFST+0,sp),a
1679  0302 2002          	jra	L706
1680  0304               L506:
1681                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1683  0304 0f01          	clr	(OFST+0,sp)
1685  0306               L706:
1686                     ; 328   return status;
1688  0306 7b01          	ld	a,(OFST+0,sp)
1691  0308 85            	popw	x
1692  0309 81            	ret
1728                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1728                     ; 347 {
1729                     	switch	.text
1730  030a               _SPI_ClearFlag:
1732  030a 88            	push	a
1733       00000000      OFST:	set	0
1736                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1738  030b a110          	cp	a,#16
1739  030d 2704          	jreq	L602
1740  030f a108          	cp	a,#8
1741  0311 2603          	jrne	L402
1742  0313               L602:
1743  0313 4f            	clr	a
1744  0314 2010          	jra	L012
1745  0316               L402:
1746  0316 ae015c        	ldw	x,#348
1747  0319 89            	pushw	x
1748  031a ae0000        	ldw	x,#0
1749  031d 89            	pushw	x
1750  031e ae0000        	ldw	x,#L302
1751  0321 cd0000        	call	_assert_failed
1753  0324 5b04          	addw	sp,#4
1754  0326               L012:
1755                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1757  0326 7b01          	ld	a,(OFST+1,sp)
1758  0328 43            	cpl	a
1759  0329 c75203        	ld	20995,a
1760                     ; 351 }
1763  032c 84            	pop	a
1764  032d 81            	ret
1847                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1847                     ; 367 {
1848                     	switch	.text
1849  032e               _SPI_GetITStatus:
1851  032e 88            	push	a
1852  032f 89            	pushw	x
1853       00000002      OFST:	set	2
1856                     ; 368   ITStatus pendingbitstatus = RESET;
1858                     ; 369   uint8_t itpos = 0;
1860                     ; 370   uint8_t itmask1 = 0;
1862                     ; 371   uint8_t itmask2 = 0;
1864                     ; 372   uint8_t enablestatus = 0;
1866                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1868  0330 a165          	cp	a,#101
1869  0332 2714          	jreq	L612
1870  0334 a155          	cp	a,#85
1871  0336 2710          	jreq	L612
1872  0338 a145          	cp	a,#69
1873  033a 270c          	jreq	L612
1874  033c a134          	cp	a,#52
1875  033e 2708          	jreq	L612
1876  0340 a117          	cp	a,#23
1877  0342 2704          	jreq	L612
1878  0344 a106          	cp	a,#6
1879  0346 2603          	jrne	L412
1880  0348               L612:
1881  0348 4f            	clr	a
1882  0349 2010          	jra	L022
1883  034b               L412:
1884  034b ae0175        	ldw	x,#373
1885  034e 89            	pushw	x
1886  034f ae0000        	ldw	x,#0
1887  0352 89            	pushw	x
1888  0353 ae0000        	ldw	x,#L302
1889  0356 cd0000        	call	_assert_failed
1891  0359 5b04          	addw	sp,#4
1892  035b               L022:
1893                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1895  035b 7b03          	ld	a,(OFST+1,sp)
1896  035d a40f          	and	a,#15
1897  035f 5f            	clrw	x
1898  0360 97            	ld	xl,a
1899  0361 a601          	ld	a,#1
1900  0363 5d            	tnzw	x
1901  0364 2704          	jreq	L222
1902  0366               L422:
1903  0366 48            	sll	a
1904  0367 5a            	decw	x
1905  0368 26fc          	jrne	L422
1906  036a               L222:
1907  036a 6b01          	ld	(OFST-1,sp),a
1909                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1911  036c 7b03          	ld	a,(OFST+1,sp)
1912  036e 4e            	swap	a
1913  036f a40f          	and	a,#15
1914  0371 6b02          	ld	(OFST+0,sp),a
1916                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1918  0373 7b02          	ld	a,(OFST+0,sp)
1919  0375 5f            	clrw	x
1920  0376 97            	ld	xl,a
1921  0377 a601          	ld	a,#1
1922  0379 5d            	tnzw	x
1923  037a 2704          	jreq	L622
1924  037c               L032:
1925  037c 48            	sll	a
1926  037d 5a            	decw	x
1927  037e 26fc          	jrne	L032
1928  0380               L622:
1929  0380 6b02          	ld	(OFST+0,sp),a
1931                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1933  0382 c65203        	ld	a,20995
1934  0385 1402          	and	a,(OFST+0,sp)
1935  0387 6b02          	ld	(OFST+0,sp),a
1937                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1939  0389 c65202        	ld	a,20994
1940  038c 1501          	bcp	a,(OFST-1,sp)
1941  038e 270a          	jreq	L176
1943  0390 0d02          	tnz	(OFST+0,sp)
1944  0392 2706          	jreq	L176
1945                     ; 387     pendingbitstatus = SET;
1947  0394 a601          	ld	a,#1
1948  0396 6b02          	ld	(OFST+0,sp),a
1951  0398 2002          	jra	L376
1952  039a               L176:
1953                     ; 392     pendingbitstatus = RESET;
1955  039a 0f02          	clr	(OFST+0,sp)
1957  039c               L376:
1958                     ; 395   return  pendingbitstatus;
1960  039c 7b02          	ld	a,(OFST+0,sp)
1963  039e 5b03          	addw	sp,#3
1964  03a0 81            	ret
2010                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
2010                     ; 413 {
2011                     	switch	.text
2012  03a1               _SPI_ClearITPendingBit:
2014  03a1 88            	push	a
2015  03a2 88            	push	a
2016       00000001      OFST:	set	1
2019                     ; 414   uint8_t itpos = 0;
2021                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
2023  03a3 a145          	cp	a,#69
2024  03a5 2704          	jreq	L632
2025  03a7 a134          	cp	a,#52
2026  03a9 2603          	jrne	L432
2027  03ab               L632:
2028  03ab 4f            	clr	a
2029  03ac 2010          	jra	L042
2030  03ae               L432:
2031  03ae ae019f        	ldw	x,#415
2032  03b1 89            	pushw	x
2033  03b2 ae0000        	ldw	x,#0
2034  03b5 89            	pushw	x
2035  03b6 ae0000        	ldw	x,#L302
2036  03b9 cd0000        	call	_assert_failed
2038  03bc 5b04          	addw	sp,#4
2039  03be               L042:
2040                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2042  03be 7b02          	ld	a,(OFST+1,sp)
2043  03c0 a4f0          	and	a,#240
2044  03c2 4e            	swap	a
2045  03c3 a40f          	and	a,#15
2046  03c5 5f            	clrw	x
2047  03c6 97            	ld	xl,a
2048  03c7 a601          	ld	a,#1
2049  03c9 5d            	tnzw	x
2050  03ca 2704          	jreq	L242
2051  03cc               L442:
2052  03cc 48            	sll	a
2053  03cd 5a            	decw	x
2054  03ce 26fc          	jrne	L442
2055  03d0               L242:
2056  03d0 6b01          	ld	(OFST+0,sp),a
2058                     ; 422   SPI->SR = (uint8_t)(~itpos);
2060  03d2 7b01          	ld	a,(OFST+0,sp)
2061  03d4 43            	cpl	a
2062  03d5 c75203        	ld	20995,a
2063                     ; 424 }
2066  03d8 85            	popw	x
2067  03d9 81            	ret
2080                     	xdef	_SPI_ClearITPendingBit
2081                     	xdef	_SPI_GetITStatus
2082                     	xdef	_SPI_ClearFlag
2083                     	xdef	_SPI_GetFlagStatus
2084                     	xdef	_SPI_BiDirectionalLineConfig
2085                     	xdef	_SPI_GetCRCPolynomial
2086                     	xdef	_SPI_ResetCRC
2087                     	xdef	_SPI_GetCRC
2088                     	xdef	_SPI_CalculateCRCCmd
2089                     	xdef	_SPI_TransmitCRC
2090                     	xdef	_SPI_NSSInternalSoftwareCmd
2091                     	xdef	_SPI_ReceiveData
2092                     	xdef	_SPI_SendData
2093                     	xdef	_SPI_ITConfig
2094                     	xdef	_SPI_Cmd
2095                     	xdef	_SPI_Init
2096                     	xdef	_SPI_DeInit
2097                     	xref	_assert_failed
2098                     .const:	section	.text
2099  0000               L302:
2100  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
2101  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
2102  0024 72697665725c  	dc.b	"river\src\stm8s_sp"
2103  0036 692e6300      	dc.b	"i.c",0
2123                     	end
