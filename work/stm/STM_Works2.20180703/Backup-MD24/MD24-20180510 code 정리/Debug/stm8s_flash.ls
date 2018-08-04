   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  77                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  77                     ; 88 {
  79                     	switch	.text
  80  0000               _FLASH_Unlock:
  82  0000 88            	push	a
  83       00000000      OFST:	set	0
  86                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  88  0001 a1fd          	cp	a,#253
  89  0003 2704          	jreq	L01
  90  0005 a1f7          	cp	a,#247
  91  0007 2603          	jrne	L6
  92  0009               L01:
  93  0009 4f            	clr	a
  94  000a 2010          	jra	L21
  95  000c               L6:
  96  000c ae005a        	ldw	x,#90
  97  000f 89            	pushw	x
  98  0010 ae0000        	ldw	x,#0
  99  0013 89            	pushw	x
 100  0014 ae0010        	ldw	x,#L73
 101  0017 cd0000        	call	_assert_failed
 103  001a 5b04          	addw	sp,#4
 104  001c               L21:
 105                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 107  001c 7b01          	ld	a,(OFST+1,sp)
 108  001e a1fd          	cp	a,#253
 109  0020 260a          	jrne	L14
 110                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 112  0022 35565062      	mov	20578,#86
 113                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 115  0026 35ae5062      	mov	20578,#174
 117  002a 2008          	jra	L34
 118  002c               L14:
 119                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 121  002c 35ae5064      	mov	20580,#174
 122                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 124  0030 35565064      	mov	20580,#86
 125  0034               L34:
 126                     ; 104 }
 129  0034 84            	pop	a
 130  0035 81            	ret
 166                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 166                     ; 113 {
 167                     	switch	.text
 168  0036               _FLASH_Lock:
 170  0036 88            	push	a
 171       00000000      OFST:	set	0
 174                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 176  0037 a1fd          	cp	a,#253
 177  0039 2704          	jreq	L02
 178  003b a1f7          	cp	a,#247
 179  003d 2603          	jrne	L61
 180  003f               L02:
 181  003f 4f            	clr	a
 182  0040 2010          	jra	L22
 183  0042               L61:
 184  0042 ae0073        	ldw	x,#115
 185  0045 89            	pushw	x
 186  0046 ae0000        	ldw	x,#0
 187  0049 89            	pushw	x
 188  004a ae0010        	ldw	x,#L73
 189  004d cd0000        	call	_assert_failed
 191  0050 5b04          	addw	sp,#4
 192  0052               L22:
 193                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 195  0052 c6505f        	ld	a,20575
 196  0055 1401          	and	a,(OFST+1,sp)
 197  0057 c7505f        	ld	20575,a
 198                     ; 119 }
 201  005a 84            	pop	a
 202  005b 81            	ret
 225                     ; 126 void FLASH_DeInit(void)
 225                     ; 127 {
 226                     	switch	.text
 227  005c               _FLASH_DeInit:
 231                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 233  005c 725f505a      	clr	20570
 234                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 236  0060 725f505b      	clr	20571
 237                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 239  0064 35ff505c      	mov	20572,#255
 240                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 242  0068 7217505f      	bres	20575,#3
 243                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 245  006c 7213505f      	bres	20575,#1
 246                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 248  0070 c6505f        	ld	a,20575
 249                     ; 134 }
 252  0073 81            	ret
 308                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 308                     ; 143 {
 309                     	switch	.text
 310  0074               _FLASH_ITConfig:
 312  0074 88            	push	a
 313       00000000      OFST:	set	0
 316                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 318  0075 4d            	tnz	a
 319  0076 2704          	jreq	L23
 320  0078 a101          	cp	a,#1
 321  007a 2603          	jrne	L03
 322  007c               L23:
 323  007c 4f            	clr	a
 324  007d 2010          	jra	L43
 325  007f               L03:
 326  007f ae0091        	ldw	x,#145
 327  0082 89            	pushw	x
 328  0083 ae0000        	ldw	x,#0
 329  0086 89            	pushw	x
 330  0087 ae0010        	ldw	x,#L73
 331  008a cd0000        	call	_assert_failed
 333  008d 5b04          	addw	sp,#4
 334  008f               L43:
 335                     ; 147   if(NewState != DISABLE)
 337  008f 0d01          	tnz	(OFST+1,sp)
 338  0091 2706          	jreq	L121
 339                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 341  0093 7212505a      	bset	20570,#1
 343  0097 2004          	jra	L321
 344  0099               L121:
 345                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 347  0099 7213505a      	bres	20570,#1
 348  009d               L321:
 349                     ; 155 }
 352  009d 84            	pop	a
 353  009e 81            	ret
 388                     .const:	section	.text
 389  0000               L64:
 390  0000 00008000      	dc.l	32768
 391  0004               L05:
 392  0004 0000a000      	dc.l	40960
 393  0008               L25:
 394  0008 00004000      	dc.l	16384
 395  000c               L45:
 396  000c 00004280      	dc.l	17024
 397                     ; 164 void FLASH_EraseByte(uint32_t Address)
 397                     ; 165 {
 398                     	switch	.text
 399  009f               _FLASH_EraseByte:
 401       00000000      OFST:	set	0
 404                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 406  009f 96            	ldw	x,sp
 407  00a0 1c0003        	addw	x,#OFST+3
 408  00a3 cd0000        	call	c_ltor
 410  00a6 ae0000        	ldw	x,#L64
 411  00a9 cd0000        	call	c_lcmp
 413  00ac 250f          	jrult	L44
 414  00ae 96            	ldw	x,sp
 415  00af 1c0003        	addw	x,#OFST+3
 416  00b2 cd0000        	call	c_ltor
 418  00b5 ae0004        	ldw	x,#L05
 419  00b8 cd0000        	call	c_lcmp
 421  00bb 251e          	jrult	L24
 422  00bd               L44:
 423  00bd 96            	ldw	x,sp
 424  00be 1c0003        	addw	x,#OFST+3
 425  00c1 cd0000        	call	c_ltor
 427  00c4 ae0008        	ldw	x,#L25
 428  00c7 cd0000        	call	c_lcmp
 430  00ca 2512          	jrult	L04
 431  00cc 96            	ldw	x,sp
 432  00cd 1c0003        	addw	x,#OFST+3
 433  00d0 cd0000        	call	c_ltor
 435  00d3 ae000c        	ldw	x,#L45
 436  00d6 cd0000        	call	c_lcmp
 438  00d9 2403          	jruge	L04
 439  00db               L24:
 440  00db 4f            	clr	a
 441  00dc 2010          	jra	L65
 442  00de               L04:
 443  00de ae00a7        	ldw	x,#167
 444  00e1 89            	pushw	x
 445  00e2 ae0000        	ldw	x,#0
 446  00e5 89            	pushw	x
 447  00e6 ae0010        	ldw	x,#L73
 448  00e9 cd0000        	call	_assert_failed
 450  00ec 5b04          	addw	sp,#4
 451  00ee               L65:
 452                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 454  00ee 1e05          	ldw	x,(OFST+5,sp)
 455  00f0 7f            	clr	(x)
 456                     ; 171 }
 459  00f1 81            	ret
 503                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 503                     ; 182 {
 504                     	switch	.text
 505  00f2               _FLASH_ProgramByte:
 507       00000000      OFST:	set	0
 510                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 512  00f2 96            	ldw	x,sp
 513  00f3 1c0003        	addw	x,#OFST+3
 514  00f6 cd0000        	call	c_ltor
 516  00f9 ae0000        	ldw	x,#L64
 517  00fc cd0000        	call	c_lcmp
 519  00ff 250f          	jrult	L66
 520  0101 96            	ldw	x,sp
 521  0102 1c0003        	addw	x,#OFST+3
 522  0105 cd0000        	call	c_ltor
 524  0108 ae0004        	ldw	x,#L05
 525  010b cd0000        	call	c_lcmp
 527  010e 251e          	jrult	L46
 528  0110               L66:
 529  0110 96            	ldw	x,sp
 530  0111 1c0003        	addw	x,#OFST+3
 531  0114 cd0000        	call	c_ltor
 533  0117 ae0008        	ldw	x,#L25
 534  011a cd0000        	call	c_lcmp
 536  011d 2512          	jrult	L26
 537  011f 96            	ldw	x,sp
 538  0120 1c0003        	addw	x,#OFST+3
 539  0123 cd0000        	call	c_ltor
 541  0126 ae000c        	ldw	x,#L45
 542  0129 cd0000        	call	c_lcmp
 544  012c 2403          	jruge	L26
 545  012e               L46:
 546  012e 4f            	clr	a
 547  012f 2010          	jra	L07
 548  0131               L26:
 549  0131 ae00b8        	ldw	x,#184
 550  0134 89            	pushw	x
 551  0135 ae0000        	ldw	x,#0
 552  0138 89            	pushw	x
 553  0139 ae0010        	ldw	x,#L73
 554  013c cd0000        	call	_assert_failed
 556  013f 5b04          	addw	sp,#4
 557  0141               L07:
 558                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 560  0141 7b07          	ld	a,(OFST+7,sp)
 561  0143 1e05          	ldw	x,(OFST+5,sp)
 562  0145 f7            	ld	(x),a
 563                     ; 186 }
 566  0146 81            	ret
 601                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 601                     ; 196 {
 602                     	switch	.text
 603  0147               _FLASH_ReadByte:
 605       00000000      OFST:	set	0
 608                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 610  0147 96            	ldw	x,sp
 611  0148 1c0003        	addw	x,#OFST+3
 612  014b cd0000        	call	c_ltor
 614  014e ae0000        	ldw	x,#L64
 615  0151 cd0000        	call	c_lcmp
 617  0154 250f          	jrult	L001
 618  0156 96            	ldw	x,sp
 619  0157 1c0003        	addw	x,#OFST+3
 620  015a cd0000        	call	c_ltor
 622  015d ae0004        	ldw	x,#L05
 623  0160 cd0000        	call	c_lcmp
 625  0163 251e          	jrult	L67
 626  0165               L001:
 627  0165 96            	ldw	x,sp
 628  0166 1c0003        	addw	x,#OFST+3
 629  0169 cd0000        	call	c_ltor
 631  016c ae0008        	ldw	x,#L25
 632  016f cd0000        	call	c_lcmp
 634  0172 2512          	jrult	L47
 635  0174 96            	ldw	x,sp
 636  0175 1c0003        	addw	x,#OFST+3
 637  0178 cd0000        	call	c_ltor
 639  017b ae000c        	ldw	x,#L45
 640  017e cd0000        	call	c_lcmp
 642  0181 2403          	jruge	L47
 643  0183               L67:
 644  0183 4f            	clr	a
 645  0184 2010          	jra	L201
 646  0186               L47:
 647  0186 ae00c6        	ldw	x,#198
 648  0189 89            	pushw	x
 649  018a ae0000        	ldw	x,#0
 650  018d 89            	pushw	x
 651  018e ae0010        	ldw	x,#L73
 652  0191 cd0000        	call	_assert_failed
 654  0194 5b04          	addw	sp,#4
 655  0196               L201:
 656                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 658  0196 1e05          	ldw	x,(OFST+5,sp)
 659  0198 f6            	ld	a,(x)
 662  0199 81            	ret
 706                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 706                     ; 213 {
 707                     	switch	.text
 708  019a               _FLASH_ProgramWord:
 710       00000000      OFST:	set	0
 713                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 715  019a 96            	ldw	x,sp
 716  019b 1c0003        	addw	x,#OFST+3
 717  019e cd0000        	call	c_ltor
 719  01a1 ae0000        	ldw	x,#L64
 720  01a4 cd0000        	call	c_lcmp
 722  01a7 250f          	jrult	L211
 723  01a9 96            	ldw	x,sp
 724  01aa 1c0003        	addw	x,#OFST+3
 725  01ad cd0000        	call	c_ltor
 727  01b0 ae0004        	ldw	x,#L05
 728  01b3 cd0000        	call	c_lcmp
 730  01b6 251e          	jrult	L011
 731  01b8               L211:
 732  01b8 96            	ldw	x,sp
 733  01b9 1c0003        	addw	x,#OFST+3
 734  01bc cd0000        	call	c_ltor
 736  01bf ae0008        	ldw	x,#L25
 737  01c2 cd0000        	call	c_lcmp
 739  01c5 2512          	jrult	L601
 740  01c7 96            	ldw	x,sp
 741  01c8 1c0003        	addw	x,#OFST+3
 742  01cb cd0000        	call	c_ltor
 744  01ce ae000c        	ldw	x,#L45
 745  01d1 cd0000        	call	c_lcmp
 747  01d4 2403          	jruge	L601
 748  01d6               L011:
 749  01d6 4f            	clr	a
 750  01d7 2010          	jra	L411
 751  01d9               L601:
 752  01d9 ae00d7        	ldw	x,#215
 753  01dc 89            	pushw	x
 754  01dd ae0000        	ldw	x,#0
 755  01e0 89            	pushw	x
 756  01e1 ae0010        	ldw	x,#L73
 757  01e4 cd0000        	call	_assert_failed
 759  01e7 5b04          	addw	sp,#4
 760  01e9               L411:
 761                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 763  01e9 721c505b      	bset	20571,#6
 764                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 766  01ed 721d505c      	bres	20572,#6
 767                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 769  01f1 7b07          	ld	a,(OFST+7,sp)
 770  01f3 1e05          	ldw	x,(OFST+5,sp)
 771  01f5 f7            	ld	(x),a
 772                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 774  01f6 7b08          	ld	a,(OFST+8,sp)
 775  01f8 1e05          	ldw	x,(OFST+5,sp)
 776  01fa e701          	ld	(1,x),a
 777                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 779  01fc 7b09          	ld	a,(OFST+9,sp)
 780  01fe 1e05          	ldw	x,(OFST+5,sp)
 781  0200 e702          	ld	(2,x),a
 782                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 784  0202 7b0a          	ld	a,(OFST+10,sp)
 785  0204 1e05          	ldw	x,(OFST+5,sp)
 786  0206 e703          	ld	(3,x),a
 787                     ; 229 }
 790  0208 81            	ret
 836                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 836                     ; 238 {
 837                     	switch	.text
 838  0209               _FLASH_ProgramOptionByte:
 840  0209 89            	pushw	x
 841       00000000      OFST:	set	0
 844                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 846  020a a34800        	cpw	x,#18432
 847  020d 2508          	jrult	L021
 848  020f a34880        	cpw	x,#18560
 849  0212 2403          	jruge	L021
 850  0214 4f            	clr	a
 851  0215 2010          	jra	L221
 852  0217               L021:
 853  0217 ae00f0        	ldw	x,#240
 854  021a 89            	pushw	x
 855  021b ae0000        	ldw	x,#0
 856  021e 89            	pushw	x
 857  021f ae0010        	ldw	x,#L73
 858  0222 cd0000        	call	_assert_failed
 860  0225 5b04          	addw	sp,#4
 861  0227               L221:
 862                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 864  0227 721e505b      	bset	20571,#7
 865                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 867  022b 721f505c      	bres	20572,#7
 868                     ; 247   if(Address == 0x4800)
 870  022f 1e01          	ldw	x,(OFST+1,sp)
 871  0231 a34800        	cpw	x,#18432
 872  0234 2607          	jrne	L742
 873                     ; 250     *((NEAR uint8_t*)Address) = Data;
 875  0236 7b05          	ld	a,(OFST+5,sp)
 876  0238 1e01          	ldw	x,(OFST+1,sp)
 877  023a f7            	ld	(x),a
 879  023b 200c          	jra	L152
 880  023d               L742:
 881                     ; 255     *((NEAR uint8_t*)Address) = Data;
 883  023d 7b05          	ld	a,(OFST+5,sp)
 884  023f 1e01          	ldw	x,(OFST+1,sp)
 885  0241 f7            	ld	(x),a
 886                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 888  0242 7b05          	ld	a,(OFST+5,sp)
 889  0244 43            	cpl	a
 890  0245 1e01          	ldw	x,(OFST+1,sp)
 891  0247 e701          	ld	(1,x),a
 892  0249               L152:
 893                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 895  0249 a6fd          	ld	a,#253
 896  024b cd03dd        	call	_FLASH_WaitForLastOperation
 898                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 900  024e 721f505b      	bres	20571,#7
 901                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 903  0252 721e505c      	bset	20572,#7
 904                     ; 263 }
 907  0256 85            	popw	x
 908  0257 81            	ret
 945                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 945                     ; 271 {
 946                     	switch	.text
 947  0258               _FLASH_EraseOptionByte:
 949  0258 89            	pushw	x
 950       00000000      OFST:	set	0
 953                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 955  0259 a34800        	cpw	x,#18432
 956  025c 2508          	jrult	L621
 957  025e a34880        	cpw	x,#18560
 958  0261 2403          	jruge	L621
 959  0263 4f            	clr	a
 960  0264 2010          	jra	L031
 961  0266               L621:
 962  0266 ae0111        	ldw	x,#273
 963  0269 89            	pushw	x
 964  026a ae0000        	ldw	x,#0
 965  026d 89            	pushw	x
 966  026e ae0010        	ldw	x,#L73
 967  0271 cd0000        	call	_assert_failed
 969  0274 5b04          	addw	sp,#4
 970  0276               L031:
 971                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 973  0276 721e505b      	bset	20571,#7
 974                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 976  027a 721f505c      	bres	20572,#7
 977                     ; 280   if(Address == 0x4800)
 979  027e 1e01          	ldw	x,(OFST+1,sp)
 980  0280 a34800        	cpw	x,#18432
 981  0283 2605          	jrne	L172
 982                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 984  0285 1e01          	ldw	x,(OFST+1,sp)
 985  0287 7f            	clr	(x)
 987  0288 2009          	jra	L372
 988  028a               L172:
 989                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 991  028a 1e01          	ldw	x,(OFST+1,sp)
 992  028c 7f            	clr	(x)
 993                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 995  028d 1e01          	ldw	x,(OFST+1,sp)
 996  028f a6ff          	ld	a,#255
 997  0291 e701          	ld	(1,x),a
 998  0293               L372:
 999                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1001  0293 a6fd          	ld	a,#253
1002  0295 cd03dd        	call	_FLASH_WaitForLastOperation
1004                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1006  0298 721f505b      	bres	20571,#7
1007                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
1009  029c 721e505c      	bset	20572,#7
1010                     ; 296 }
1013  02a0 85            	popw	x
1014  02a1 81            	ret
1078                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1078                     ; 304 {
1079                     	switch	.text
1080  02a2               _FLASH_ReadOptionByte:
1082  02a2 89            	pushw	x
1083  02a3 5204          	subw	sp,#4
1084       00000004      OFST:	set	4
1087                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1089                     ; 306   uint16_t res_value = 0;
1091                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1093  02a5 a34800        	cpw	x,#18432
1094  02a8 2508          	jrult	L431
1095  02aa a34880        	cpw	x,#18560
1096  02ad 2403          	jruge	L431
1097  02af 4f            	clr	a
1098  02b0 2010          	jra	L631
1099  02b2               L431:
1100  02b2 ae0135        	ldw	x,#309
1101  02b5 89            	pushw	x
1102  02b6 ae0000        	ldw	x,#0
1103  02b9 89            	pushw	x
1104  02ba ae0010        	ldw	x,#L73
1105  02bd cd0000        	call	_assert_failed
1107  02c0 5b04          	addw	sp,#4
1108  02c2               L631:
1109                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1111  02c2 1e05          	ldw	x,(OFST+1,sp)
1112  02c4 f6            	ld	a,(x)
1113  02c5 6b02          	ld	(OFST-2,sp),a
1115                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1117  02c7 1e05          	ldw	x,(OFST+1,sp)
1118  02c9 e601          	ld	a,(1,x)
1119  02cb 6b01          	ld	(OFST-3,sp),a
1121                     ; 315   if(Address == 0x4800)	 
1123  02cd 1e05          	ldw	x,(OFST+1,sp)
1124  02cf a34800        	cpw	x,#18432
1125  02d2 2608          	jrne	L723
1126                     ; 317     res_value =	 value_optbyte;
1128  02d4 7b02          	ld	a,(OFST-2,sp)
1129  02d6 5f            	clrw	x
1130  02d7 97            	ld	xl,a
1131  02d8 1f03          	ldw	(OFST-1,sp),x
1134  02da 2023          	jra	L133
1135  02dc               L723:
1136                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1138  02dc 7b01          	ld	a,(OFST-3,sp)
1139  02de 43            	cpl	a
1140  02df 1102          	cp	a,(OFST-2,sp)
1141  02e1 2617          	jrne	L333
1142                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1144  02e3 7b02          	ld	a,(OFST-2,sp)
1145  02e5 5f            	clrw	x
1146  02e6 97            	ld	xl,a
1147  02e7 4f            	clr	a
1148  02e8 02            	rlwa	x,a
1149  02e9 1f03          	ldw	(OFST-1,sp),x
1151                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1153  02eb 7b01          	ld	a,(OFST-3,sp)
1154  02ed 5f            	clrw	x
1155  02ee 97            	ld	xl,a
1156  02ef 01            	rrwa	x,a
1157  02f0 1a04          	or	a,(OFST+0,sp)
1158  02f2 01            	rrwa	x,a
1159  02f3 1a03          	or	a,(OFST-1,sp)
1160  02f5 01            	rrwa	x,a
1161  02f6 1f03          	ldw	(OFST-1,sp),x
1164  02f8 2005          	jra	L133
1165  02fa               L333:
1166                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1168  02fa ae5555        	ldw	x,#21845
1169  02fd 1f03          	ldw	(OFST-1,sp),x
1171  02ff               L133:
1172                     ; 331   return(res_value);
1174  02ff 1e03          	ldw	x,(OFST-1,sp)
1177  0301 5b06          	addw	sp,#6
1178  0303 81            	ret
1253                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1253                     ; 341 {
1254                     	switch	.text
1255  0304               _FLASH_SetLowPowerMode:
1257  0304 88            	push	a
1258       00000000      OFST:	set	0
1261                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1263  0305 a104          	cp	a,#4
1264  0307 270b          	jreq	L441
1265  0309 a108          	cp	a,#8
1266  030b 2707          	jreq	L441
1267  030d 4d            	tnz	a
1268  030e 2704          	jreq	L441
1269  0310 a10c          	cp	a,#12
1270  0312 2603          	jrne	L241
1271  0314               L441:
1272  0314 4f            	clr	a
1273  0315 2010          	jra	L641
1274  0317               L241:
1275  0317 ae0157        	ldw	x,#343
1276  031a 89            	pushw	x
1277  031b ae0000        	ldw	x,#0
1278  031e 89            	pushw	x
1279  031f ae0010        	ldw	x,#L73
1280  0322 cd0000        	call	_assert_failed
1282  0325 5b04          	addw	sp,#4
1283  0327               L641:
1284                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1286  0327 c6505a        	ld	a,20570
1287  032a a4f3          	and	a,#243
1288  032c c7505a        	ld	20570,a
1289                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1291  032f c6505a        	ld	a,20570
1292  0332 1a01          	or	a,(OFST+1,sp)
1293  0334 c7505a        	ld	20570,a
1294                     ; 350 }
1297  0337 84            	pop	a
1298  0338 81            	ret
1357                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1357                     ; 359 {
1358                     	switch	.text
1359  0339               _FLASH_SetProgrammingTime:
1361  0339 88            	push	a
1362       00000000      OFST:	set	0
1365                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1367  033a 4d            	tnz	a
1368  033b 2704          	jreq	L451
1369  033d a101          	cp	a,#1
1370  033f 2603          	jrne	L251
1371  0341               L451:
1372  0341 4f            	clr	a
1373  0342 2010          	jra	L651
1374  0344               L251:
1375  0344 ae0169        	ldw	x,#361
1376  0347 89            	pushw	x
1377  0348 ae0000        	ldw	x,#0
1378  034b 89            	pushw	x
1379  034c ae0010        	ldw	x,#L73
1380  034f cd0000        	call	_assert_failed
1382  0352 5b04          	addw	sp,#4
1383  0354               L651:
1384                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1386  0354 7211505a      	bres	20570,#0
1387                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1389  0358 c6505a        	ld	a,20570
1390  035b 1a01          	or	a,(OFST+1,sp)
1391  035d c7505a        	ld	20570,a
1392                     ; 365 }
1395  0360 84            	pop	a
1396  0361 81            	ret
1421                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1421                     ; 373 {
1422                     	switch	.text
1423  0362               _FLASH_GetLowPowerMode:
1427                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1429  0362 c6505a        	ld	a,20570
1430  0365 a40c          	and	a,#12
1433  0367 81            	ret
1458                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1458                     ; 383 {
1459                     	switch	.text
1460  0368               _FLASH_GetProgrammingTime:
1464                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1466  0368 c6505a        	ld	a,20570
1467  036b a401          	and	a,#1
1470  036d 81            	ret
1504                     ; 392 uint32_t FLASH_GetBootSize(void)
1504                     ; 393 {
1505                     	switch	.text
1506  036e               _FLASH_GetBootSize:
1508  036e 5204          	subw	sp,#4
1509       00000004      OFST:	set	4
1512                     ; 394   uint32_t temp = 0;
1514                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1516  0370 c6505d        	ld	a,20573
1517  0373 5f            	clrw	x
1518  0374 97            	ld	xl,a
1519  0375 90ae0200      	ldw	y,#512
1520  0379 cd0000        	call	c_umul
1522  037c 96            	ldw	x,sp
1523  037d 1c0001        	addw	x,#OFST-3
1524  0380 cd0000        	call	c_rtol
1527                     ; 400   if(FLASH->FPR == 0xFF)
1529  0383 c6505d        	ld	a,20573
1530  0386 a1ff          	cp	a,#255
1531  0388 2611          	jrne	L554
1532                     ; 402     temp += 512;
1534  038a ae0200        	ldw	x,#512
1535  038d bf02          	ldw	c_lreg+2,x
1536  038f ae0000        	ldw	x,#0
1537  0392 bf00          	ldw	c_lreg,x
1538  0394 96            	ldw	x,sp
1539  0395 1c0001        	addw	x,#OFST-3
1540  0398 cd0000        	call	c_lgadd
1543  039b               L554:
1544                     ; 406   return(temp);
1546  039b 96            	ldw	x,sp
1547  039c 1c0001        	addw	x,#OFST-3
1548  039f cd0000        	call	c_ltor
1552  03a2 5b04          	addw	sp,#4
1553  03a4 81            	ret
1656                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1656                     ; 418 {
1657                     	switch	.text
1658  03a5               _FLASH_GetFlagStatus:
1660  03a5 88            	push	a
1661  03a6 88            	push	a
1662       00000001      OFST:	set	1
1665                     ; 419   FlagStatus status = RESET;
1667                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1669  03a7 a108          	cp	a,#8
1670  03a9 270c          	jreq	L271
1671  03ab a104          	cp	a,#4
1672  03ad 2708          	jreq	L271
1673  03af a102          	cp	a,#2
1674  03b1 2704          	jreq	L271
1675  03b3 a101          	cp	a,#1
1676  03b5 2603          	jrne	L071
1677  03b7               L271:
1678  03b7 4f            	clr	a
1679  03b8 2010          	jra	L471
1680  03ba               L071:
1681  03ba ae01a5        	ldw	x,#421
1682  03bd 89            	pushw	x
1683  03be ae0000        	ldw	x,#0
1684  03c1 89            	pushw	x
1685  03c2 ae0010        	ldw	x,#L73
1686  03c5 cd0000        	call	_assert_failed
1688  03c8 5b04          	addw	sp,#4
1689  03ca               L471:
1690                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1692  03ca c6505f        	ld	a,20575
1693  03cd 1502          	bcp	a,(OFST+1,sp)
1694  03cf 2706          	jreq	L525
1695                     ; 426     status = SET; /* FLASH_FLAG is set */
1697  03d1 a601          	ld	a,#1
1698  03d3 6b01          	ld	(OFST+0,sp),a
1701  03d5 2002          	jra	L725
1702  03d7               L525:
1703                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1705  03d7 0f01          	clr	(OFST+0,sp)
1707  03d9               L725:
1708                     ; 434   return status;
1710  03d9 7b01          	ld	a,(OFST+0,sp)
1713  03db 85            	popw	x
1714  03dc 81            	ret
1799                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1799                     ; 550 {
1800                     	switch	.text
1801  03dd               _FLASH_WaitForLastOperation:
1803  03dd 5203          	subw	sp,#3
1804       00000003      OFST:	set	3
1807                     ; 551   uint8_t flagstatus = 0x00;
1809  03df 0f03          	clr	(OFST+0,sp)
1811                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1813  03e1 aeffff        	ldw	x,#65535
1814  03e4 1f01          	ldw	(OFST-2,sp),x
1817  03e6 200e          	jra	L575
1818  03e8               L175:
1819                     ; 578     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1821  03e8 c6505f        	ld	a,20575
1822  03eb a405          	and	a,#5
1823  03ed 6b03          	ld	(OFST+0,sp),a
1825                     ; 579     timeout--;
1827  03ef 1e01          	ldw	x,(OFST-2,sp)
1828  03f1 1d0001        	subw	x,#1
1829  03f4 1f01          	ldw	(OFST-2,sp),x
1831  03f6               L575:
1832                     ; 576   while((flagstatus == 0x00) && (timeout != 0x00))
1834  03f6 0d03          	tnz	(OFST+0,sp)
1835  03f8 2604          	jrne	L106
1837  03fa 1e01          	ldw	x,(OFST-2,sp)
1838  03fc 26ea          	jrne	L175
1839  03fe               L106:
1840                     ; 583   if(timeout == 0x00 )
1842  03fe 1e01          	ldw	x,(OFST-2,sp)
1843  0400 2604          	jrne	L306
1844                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1846  0402 a602          	ld	a,#2
1847  0404 6b03          	ld	(OFST+0,sp),a
1849  0406               L306:
1850                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1852  0406 7b03          	ld	a,(OFST+0,sp)
1855  0408 5b03          	addw	sp,#3
1856  040a 81            	ret
1920                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1920                     ; 599 {
1921                     	switch	.text
1922  040b               _FLASH_EraseBlock:
1924  040b 89            	pushw	x
1925  040c 5206          	subw	sp,#6
1926       00000006      OFST:	set	6
1929                     ; 600   uint32_t startaddress = 0;
1931                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1933  040e 7b0b          	ld	a,(OFST+5,sp)
1934  0410 a1fd          	cp	a,#253
1935  0412 2706          	jreq	L402
1936  0414 7b0b          	ld	a,(OFST+5,sp)
1937  0416 a1f7          	cp	a,#247
1938  0418 2603          	jrne	L202
1939  041a               L402:
1940  041a 4f            	clr	a
1941  041b 2010          	jra	L602
1942  041d               L202:
1943  041d ae0262        	ldw	x,#610
1944  0420 89            	pushw	x
1945  0421 ae0000        	ldw	x,#0
1946  0424 89            	pushw	x
1947  0425 ae0010        	ldw	x,#L73
1948  0428 cd0000        	call	_assert_failed
1950  042b 5b04          	addw	sp,#4
1951  042d               L602:
1952                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1954  042d 7b0b          	ld	a,(OFST+5,sp)
1955  042f a1fd          	cp	a,#253
1956  0431 2626          	jrne	L736
1957                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1959  0433 1e07          	ldw	x,(OFST+1,sp)
1960  0435 a30080        	cpw	x,#128
1961  0438 2403          	jruge	L012
1962  043a 4f            	clr	a
1963  043b 2010          	jra	L212
1964  043d               L012:
1965  043d ae0265        	ldw	x,#613
1966  0440 89            	pushw	x
1967  0441 ae0000        	ldw	x,#0
1968  0444 89            	pushw	x
1969  0445 ae0010        	ldw	x,#L73
1970  0448 cd0000        	call	_assert_failed
1972  044b 5b04          	addw	sp,#4
1973  044d               L212:
1974                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1976  044d ae8000        	ldw	x,#32768
1977  0450 1f05          	ldw	(OFST-1,sp),x
1978  0452 ae0000        	ldw	x,#0
1979  0455 1f03          	ldw	(OFST-3,sp),x
1982  0457 2024          	jra	L146
1983  0459               L736:
1984                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1986  0459 1e07          	ldw	x,(OFST+1,sp)
1987  045b a3000a        	cpw	x,#10
1988  045e 2403          	jruge	L412
1989  0460 4f            	clr	a
1990  0461 2010          	jra	L612
1991  0463               L412:
1992  0463 ae026a        	ldw	x,#618
1993  0466 89            	pushw	x
1994  0467 ae0000        	ldw	x,#0
1995  046a 89            	pushw	x
1996  046b ae0010        	ldw	x,#L73
1997  046e cd0000        	call	_assert_failed
1999  0471 5b04          	addw	sp,#4
2000  0473               L612:
2001                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2003  0473 ae4000        	ldw	x,#16384
2004  0476 1f05          	ldw	(OFST-1,sp),x
2005  0478 ae0000        	ldw	x,#0
2006  047b 1f03          	ldw	(OFST-3,sp),x
2008  047d               L146:
2009                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2011  047d 1e07          	ldw	x,(OFST+1,sp)
2012  047f a640          	ld	a,#64
2013  0481 cd0000        	call	c_cmulx
2015  0484 96            	ldw	x,sp
2016  0485 1c0003        	addw	x,#OFST-3
2017  0488 cd0000        	call	c_ladd
2019  048b be02          	ldw	x,c_lreg+2
2020  048d 1f01          	ldw	(OFST-5,sp),x
2022                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
2024  048f 721a505b      	bset	20571,#5
2025                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2027  0493 721b505c      	bres	20572,#5
2028                     ; 636     *pwFlash = (uint32_t)0;
2030  0497 1e01          	ldw	x,(OFST-5,sp)
2031  0499 a600          	ld	a,#0
2032  049b e703          	ld	(3,x),a
2033  049d a600          	ld	a,#0
2034  049f e702          	ld	(2,x),a
2035  04a1 a600          	ld	a,#0
2036  04a3 e701          	ld	(1,x),a
2037  04a5 a600          	ld	a,#0
2038  04a7 f7            	ld	(x),a
2039                     ; 644 }
2042  04a8 5b08          	addw	sp,#8
2043  04aa 81            	ret
2148                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2148                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2148                     ; 657 {
2149                     	switch	.text
2150  04ab               _FLASH_ProgramBlock:
2152  04ab 89            	pushw	x
2153  04ac 5206          	subw	sp,#6
2154       00000006      OFST:	set	6
2157                     ; 658   uint16_t Count = 0;
2159                     ; 659   uint32_t startaddress = 0;
2161                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2163  04ae 7b0b          	ld	a,(OFST+5,sp)
2164  04b0 a1fd          	cp	a,#253
2165  04b2 2706          	jreq	L422
2166  04b4 7b0b          	ld	a,(OFST+5,sp)
2167  04b6 a1f7          	cp	a,#247
2168  04b8 2603          	jrne	L222
2169  04ba               L422:
2170  04ba 4f            	clr	a
2171  04bb 2010          	jra	L622
2172  04bd               L222:
2173  04bd ae0296        	ldw	x,#662
2174  04c0 89            	pushw	x
2175  04c1 ae0000        	ldw	x,#0
2176  04c4 89            	pushw	x
2177  04c5 ae0010        	ldw	x,#L73
2178  04c8 cd0000        	call	_assert_failed
2180  04cb 5b04          	addw	sp,#4
2181  04cd               L622:
2182                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2184  04cd 0d0c          	tnz	(OFST+6,sp)
2185  04cf 2706          	jreq	L232
2186  04d1 7b0c          	ld	a,(OFST+6,sp)
2187  04d3 a110          	cp	a,#16
2188  04d5 2603          	jrne	L032
2189  04d7               L232:
2190  04d7 4f            	clr	a
2191  04d8 2010          	jra	L432
2192  04da               L032:
2193  04da ae0297        	ldw	x,#663
2194  04dd 89            	pushw	x
2195  04de ae0000        	ldw	x,#0
2196  04e1 89            	pushw	x
2197  04e2 ae0010        	ldw	x,#L73
2198  04e5 cd0000        	call	_assert_failed
2200  04e8 5b04          	addw	sp,#4
2201  04ea               L432:
2202                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2204  04ea 7b0b          	ld	a,(OFST+5,sp)
2205  04ec a1fd          	cp	a,#253
2206  04ee 2626          	jrne	L517
2207                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2209  04f0 1e07          	ldw	x,(OFST+1,sp)
2210  04f2 a30080        	cpw	x,#128
2211  04f5 2403          	jruge	L632
2212  04f7 4f            	clr	a
2213  04f8 2010          	jra	L042
2214  04fa               L632:
2215  04fa ae029a        	ldw	x,#666
2216  04fd 89            	pushw	x
2217  04fe ae0000        	ldw	x,#0
2218  0501 89            	pushw	x
2219  0502 ae0010        	ldw	x,#L73
2220  0505 cd0000        	call	_assert_failed
2222  0508 5b04          	addw	sp,#4
2223  050a               L042:
2224                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2226  050a ae8000        	ldw	x,#32768
2227  050d 1f03          	ldw	(OFST-3,sp),x
2228  050f ae0000        	ldw	x,#0
2229  0512 1f01          	ldw	(OFST-5,sp),x
2232  0514 2024          	jra	L717
2233  0516               L517:
2234                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2236  0516 1e07          	ldw	x,(OFST+1,sp)
2237  0518 a3000a        	cpw	x,#10
2238  051b 2403          	jruge	L242
2239  051d 4f            	clr	a
2240  051e 2010          	jra	L442
2241  0520               L242:
2242  0520 ae029f        	ldw	x,#671
2243  0523 89            	pushw	x
2244  0524 ae0000        	ldw	x,#0
2245  0527 89            	pushw	x
2246  0528 ae0010        	ldw	x,#L73
2247  052b cd0000        	call	_assert_failed
2249  052e 5b04          	addw	sp,#4
2250  0530               L442:
2251                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2253  0530 ae4000        	ldw	x,#16384
2254  0533 1f03          	ldw	(OFST-3,sp),x
2255  0535 ae0000        	ldw	x,#0
2256  0538 1f01          	ldw	(OFST-5,sp),x
2258  053a               L717:
2259                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2261  053a 1e07          	ldw	x,(OFST+1,sp)
2262  053c a640          	ld	a,#64
2263  053e cd0000        	call	c_cmulx
2265  0541 96            	ldw	x,sp
2266  0542 1c0001        	addw	x,#OFST-5
2267  0545 cd0000        	call	c_lgadd
2270                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2272  0548 0d0c          	tnz	(OFST+6,sp)
2273  054a 260a          	jrne	L127
2274                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
2276  054c 7210505b      	bset	20571,#0
2277                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2279  0550 7211505c      	bres	20572,#0
2281  0554 2008          	jra	L327
2282  0556               L127:
2283                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
2285  0556 7218505b      	bset	20571,#4
2286                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2288  055a 7219505c      	bres	20572,#4
2289  055e               L327:
2290                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2292  055e 5f            	clrw	x
2293  055f 1f05          	ldw	(OFST-1,sp),x
2295  0561               L527:
2296                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2298  0561 1e0d          	ldw	x,(OFST+7,sp)
2299  0563 72fb05        	addw	x,(OFST-1,sp)
2300  0566 f6            	ld	a,(x)
2301  0567 1e03          	ldw	x,(OFST-3,sp)
2302  0569 72fb05        	addw	x,(OFST-1,sp)
2303  056c f7            	ld	(x),a
2304                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2306  056d 1e05          	ldw	x,(OFST-1,sp)
2307  056f 1c0001        	addw	x,#1
2308  0572 1f05          	ldw	(OFST-1,sp),x
2312  0574 1e05          	ldw	x,(OFST-1,sp)
2313  0576 a30040        	cpw	x,#64
2314  0579 25e6          	jrult	L527
2315                     ; 697 }
2318  057b 5b08          	addw	sp,#8
2319  057d 81            	ret
2332                     	xdef	_FLASH_WaitForLastOperation
2333                     	xdef	_FLASH_ProgramBlock
2334                     	xdef	_FLASH_EraseBlock
2335                     	xdef	_FLASH_GetFlagStatus
2336                     	xdef	_FLASH_GetBootSize
2337                     	xdef	_FLASH_GetProgrammingTime
2338                     	xdef	_FLASH_GetLowPowerMode
2339                     	xdef	_FLASH_SetProgrammingTime
2340                     	xdef	_FLASH_SetLowPowerMode
2341                     	xdef	_FLASH_EraseOptionByte
2342                     	xdef	_FLASH_ProgramOptionByte
2343                     	xdef	_FLASH_ReadOptionByte
2344                     	xdef	_FLASH_ProgramWord
2345                     	xdef	_FLASH_ReadByte
2346                     	xdef	_FLASH_ProgramByte
2347                     	xdef	_FLASH_EraseByte
2348                     	xdef	_FLASH_ITConfig
2349                     	xdef	_FLASH_DeInit
2350                     	xdef	_FLASH_Lock
2351                     	xdef	_FLASH_Unlock
2352                     	xref	_assert_failed
2353                     	switch	.const
2354  0010               L73:
2355  0010 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
2356  0022 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
2357  0034 72697665725c  	dc.b	"river\src\stm8s_fl"
2358  0046 6173682e6300  	dc.b	"ash.c",0
2359                     	xref.b	c_lreg
2360                     	xref.b	c_x
2361                     	xref.b	c_y
2381                     	xref	c_ladd
2382                     	xref	c_cmulx
2383                     	xref	c_lgadd
2384                     	xref	c_rtol
2385                     	xref	c_umul
2386                     	xref	c_lcmp
2387                     	xref	c_ltor
2388                     	end
