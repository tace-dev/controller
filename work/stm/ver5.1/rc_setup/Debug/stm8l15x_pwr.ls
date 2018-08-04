   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 79 void PWR_DeInit(void)
  47                     ; 80 {
  49                     .text:	section	.text,new
  50  0000               _PWR_DeInit:
  54                     ; 81   PWR->CSR1 = PWR_CSR1_PVDIF;
  56  0000 352050b2      	mov	20658,#32
  57                     ; 82   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  59  0004 725f50b3      	clr	20659
  60                     ; 83 }
  63  0008 81            	ret
 160                     ; 99 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 160                     ; 100 {
 161                     .text:	section	.text,new
 162  0000               _PWR_PVDLevelConfig:
 164  0000 88            	push	a
 165       00000000      OFST:	set	0
 168                     ; 102   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 170                     ; 105   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 172  0001 c650b2        	ld	a,20658
 173  0004 a4f1          	and	a,#241
 174  0006 c750b2        	ld	20658,a
 175                     ; 108   PWR->CSR1 |= PWR_PVDLevel;
 177  0009 c650b2        	ld	a,20658
 178  000c 1a01          	or	a,(OFST+1,sp)
 179  000e c750b2        	ld	20658,a
 180                     ; 110 }
 183  0011 84            	pop	a
 184  0012 81            	ret
 239                     ; 118 void PWR_PVDCmd(FunctionalState NewState)
 239                     ; 119 {
 240                     .text:	section	.text,new
 241  0000               _PWR_PVDCmd:
 245                     ; 121   assert_param(IS_FUNCTIONAL_STATE(NewState));
 247                     ; 123   if (NewState != DISABLE)
 249  0000 4d            	tnz	a
 250  0001 2706          	jreq	L111
 251                     ; 126     PWR->CSR1 |= PWR_CSR1_PVDE;
 253  0003 721050b2      	bset	20658,#0
 255  0007 2004          	jra	L311
 256  0009               L111:
 257                     ; 131     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 259  0009 721150b2      	bres	20658,#0
 260  000d               L311:
 261                     ; 133 }
 264  000d 81            	ret
 299                     ; 168 void PWR_FastWakeUpCmd(FunctionalState NewState)
 299                     ; 169 {
 300                     .text:	section	.text,new
 301  0000               _PWR_FastWakeUpCmd:
 305                     ; 171   assert_param(IS_FUNCTIONAL_STATE(NewState));
 307                     ; 173   if (NewState != DISABLE)
 309  0000 4d            	tnz	a
 310  0001 2706          	jreq	L331
 311                     ; 176     PWR->CSR2 |= PWR_CSR2_FWU;
 313  0003 721450b3      	bset	20659,#2
 315  0007 2004          	jra	L531
 316  0009               L331:
 317                     ; 181     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 319  0009 721550b3      	bres	20659,#2
 320  000d               L531:
 321                     ; 183 }
 324  000d 81            	ret
 360                     ; 191 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 360                     ; 192 {
 361                     .text:	section	.text,new
 362  0000               _PWR_UltraLowPowerCmd:
 366                     ; 194   assert_param(IS_FUNCTIONAL_STATE(NewState));
 368                     ; 196   if (NewState != DISABLE)
 370  0000 4d            	tnz	a
 371  0001 2706          	jreq	L551
 372                     ; 199     PWR->CSR2 |= PWR_CSR2_ULP;
 374  0003 721250b3      	bset	20659,#1
 376  0007 2004          	jra	L751
 377  0009               L551:
 378                     ; 204     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 380  0009 721350b3      	bres	20659,#1
 381  000d               L751:
 382                     ; 206 }
 385  000d 81            	ret
 420                     ; 229 void PWR_PVDITConfig(FunctionalState NewState)
 420                     ; 230 {
 421                     .text:	section	.text,new
 422  0000               _PWR_PVDITConfig:
 426                     ; 232   assert_param(IS_FUNCTIONAL_STATE(NewState));
 428                     ; 234   if (NewState != DISABLE)
 430  0000 4d            	tnz	a
 431  0001 2706          	jreq	L771
 432                     ; 237     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 434  0003 721850b2      	bset	20658,#4
 436  0007 2004          	jra	L102
 437  0009               L771:
 438                     ; 242     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 440  0009 721950b2      	bres	20658,#4
 441  000d               L102:
 442                     ; 244 }
 445  000d 81            	ret
 538                     ; 258 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 538                     ; 259 {
 539                     .text:	section	.text,new
 540  0000               _PWR_GetFlagStatus:
 542  0000 88            	push	a
 543  0001 88            	push	a
 544       00000001      OFST:	set	1
 547                     ; 260   FlagStatus bitstatus = RESET;
 549                     ; 263   assert_param(IS_PWR_FLAG(PWR_FLAG));
 551                     ; 265   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 553  0002 a501          	bcp	a,#1
 554  0004 2711          	jreq	L742
 555                     ; 267     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 557  0006 c650b3        	ld	a,20659
 558  0009 a501          	bcp	a,#1
 559  000b 2706          	jreq	L152
 560                     ; 269       bitstatus = SET;
 562  000d a601          	ld	a,#1
 563  000f 6b01          	ld	(OFST+0,sp),a
 565  0011 2013          	jra	L552
 566  0013               L152:
 567                     ; 273       bitstatus = RESET;
 569  0013 0f01          	clr	(OFST+0,sp)
 570  0015 200f          	jra	L552
 571  0017               L742:
 572                     ; 278     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 574  0017 c650b2        	ld	a,20658
 575  001a 1502          	bcp	a,(OFST+1,sp)
 576  001c 2706          	jreq	L752
 577                     ; 280       bitstatus = SET;
 579  001e a601          	ld	a,#1
 580  0020 6b01          	ld	(OFST+0,sp),a
 582  0022 2002          	jra	L552
 583  0024               L752:
 584                     ; 284       bitstatus = RESET;
 586  0024 0f01          	clr	(OFST+0,sp)
 587  0026               L552:
 588                     ; 289   return((FlagStatus)bitstatus);
 590  0026 7b01          	ld	a,(OFST+0,sp)
 593  0028 85            	popw	x
 594  0029 81            	ret
 617                     ; 297 void PWR_PVDClearFlag(void)
 617                     ; 298 {
 618                     .text:	section	.text,new
 619  0000               _PWR_PVDClearFlag:
 623                     ; 300   PWR->CSR1 |= PWR_CSR1_PVDIF;
 625  0000 721a50b2      	bset	20658,#5
 626                     ; 301 }
 629  0004 81            	ret
 679                     ; 308 ITStatus PWR_PVDGetITStatus(void)
 679                     ; 309 {
 680                     .text:	section	.text,new
 681  0000               _PWR_PVDGetITStatus:
 683  0000 89            	pushw	x
 684       00000002      OFST:	set	2
 687                     ; 310   ITStatus bitstatus = RESET;
 689                     ; 312   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 693                     ; 314   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 695  0001 c650b2        	ld	a,20658
 696  0004 a420          	and	a,#32
 697  0006 6b01          	ld	(OFST-1,sp),a
 698                     ; 315   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 700  0008 c650b2        	ld	a,20658
 701  000b a410          	and	a,#16
 702  000d 6b02          	ld	(OFST+0,sp),a
 703                     ; 317   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 705  000f 0d01          	tnz	(OFST-1,sp)
 706  0011 270a          	jreq	L513
 708  0013 0d02          	tnz	(OFST+0,sp)
 709  0015 2706          	jreq	L513
 710                     ; 319     bitstatus = (ITStatus)SET;
 712  0017 a601          	ld	a,#1
 713  0019 6b02          	ld	(OFST+0,sp),a
 715  001b 2002          	jra	L713
 716  001d               L513:
 717                     ; 323     bitstatus = (ITStatus)RESET;
 719  001d 0f02          	clr	(OFST+0,sp)
 720  001f               L713:
 721                     ; 325   return ((ITStatus)bitstatus);
 723  001f 7b02          	ld	a,(OFST+0,sp)
 726  0021 85            	popw	x
 727  0022 81            	ret
 751                     ; 333 void PWR_PVDClearITPendingBit(void)
 751                     ; 334 {
 752                     .text:	section	.text,new
 753  0000               _PWR_PVDClearITPendingBit:
 757                     ; 336   PWR->CSR1 |= PWR_CSR1_PVDIF;
 759  0000 721a50b2      	bset	20658,#5
 760                     ; 337 }
 763  0004 81            	ret
 776                     	xdef	_PWR_PVDClearITPendingBit
 777                     	xdef	_PWR_PVDClearFlag
 778                     	xdef	_PWR_GetFlagStatus
 779                     	xdef	_PWR_PVDGetITStatus
 780                     	xdef	_PWR_PVDITConfig
 781                     	xdef	_PWR_UltraLowPowerCmd
 782                     	xdef	_PWR_FastWakeUpCmd
 783                     	xdef	_PWR_PVDCmd
 784                     	xdef	_PWR_PVDLevelConfig
 785                     	xdef	_PWR_DeInit
 804                     	end
