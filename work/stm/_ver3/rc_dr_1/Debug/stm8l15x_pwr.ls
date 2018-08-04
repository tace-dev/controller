   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 79 void PWR_DeInit(void)
  50                     ; 80 {
  52                     .text:	section	.text,new
  53  0000               _PWR_DeInit:
  57                     ; 81   PWR->CSR1 = PWR_CSR1_PVDIF;
  59  0000 352050b2      	mov	20658,#32
  60                     ; 82   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  62  0004 725f50b3      	clr	20659
  63                     ; 83 }
  66  0008 81            	ret	
 163                     ; 99 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 163                     ; 100 {
 164                     .text:	section	.text,new
 165  0000               _PWR_PVDLevelConfig:
 167  0000 88            	push	a
 168       00000000      OFST:	set	0
 171                     ; 102   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 173                     ; 105   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 175  0001 c650b2        	ld	a,20658
 176  0004 a4f1          	and	a,#241
 177  0006 c750b2        	ld	20658,a
 178                     ; 108   PWR->CSR1 |= PWR_PVDLevel;
 180  0009 c650b2        	ld	a,20658
 181  000c 1a01          	or	a,(OFST+1,sp)
 182  000e c750b2        	ld	20658,a
 183                     ; 110 }
 186  0011 84            	pop	a
 187  0012 81            	ret	
 242                     ; 118 void PWR_PVDCmd(FunctionalState NewState)
 242                     ; 119 {
 243                     .text:	section	.text,new
 244  0000               _PWR_PVDCmd:
 248                     ; 121   assert_param(IS_FUNCTIONAL_STATE(NewState));
 250                     ; 123   if (NewState != DISABLE)
 252  0000 4d            	tnz	a
 253  0001 2705          	jreq	L111
 254                     ; 126     PWR->CSR1 |= PWR_CSR1_PVDE;
 256  0003 721050b2      	bset	20658,#0
 259  0007 81            	ret	
 260  0008               L111:
 261                     ; 131     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 263  0008 721150b2      	bres	20658,#0
 264                     ; 133 }
 267  000c 81            	ret	
 302                     ; 168 void PWR_FastWakeUpCmd(FunctionalState NewState)
 302                     ; 169 {
 303                     .text:	section	.text,new
 304  0000               _PWR_FastWakeUpCmd:
 308                     ; 171   assert_param(IS_FUNCTIONAL_STATE(NewState));
 310                     ; 173   if (NewState != DISABLE)
 312  0000 4d            	tnz	a
 313  0001 2705          	jreq	L331
 314                     ; 176     PWR->CSR2 |= PWR_CSR2_FWU;
 316  0003 721450b3      	bset	20659,#2
 319  0007 81            	ret	
 320  0008               L331:
 321                     ; 181     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 323  0008 721550b3      	bres	20659,#2
 324                     ; 183 }
 327  000c 81            	ret	
 363                     ; 191 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 363                     ; 192 {
 364                     .text:	section	.text,new
 365  0000               _PWR_UltraLowPowerCmd:
 369                     ; 194   assert_param(IS_FUNCTIONAL_STATE(NewState));
 371                     ; 196   if (NewState != DISABLE)
 373  0000 4d            	tnz	a
 374  0001 2705          	jreq	L551
 375                     ; 199     PWR->CSR2 |= PWR_CSR2_ULP;
 377  0003 721250b3      	bset	20659,#1
 380  0007 81            	ret	
 381  0008               L551:
 382                     ; 204     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 384  0008 721350b3      	bres	20659,#1
 385                     ; 206 }
 388  000c 81            	ret	
 423                     ; 229 void PWR_PVDITConfig(FunctionalState NewState)
 423                     ; 230 {
 424                     .text:	section	.text,new
 425  0000               _PWR_PVDITConfig:
 429                     ; 232   assert_param(IS_FUNCTIONAL_STATE(NewState));
 431                     ; 234   if (NewState != DISABLE)
 433  0000 4d            	tnz	a
 434  0001 2705          	jreq	L771
 435                     ; 237     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 437  0003 721850b2      	bset	20658,#4
 440  0007 81            	ret	
 441  0008               L771:
 442                     ; 242     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 444  0008 721950b2      	bres	20658,#4
 445                     ; 244 }
 448  000c 81            	ret	
 541                     ; 258 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 541                     ; 259 {
 542                     .text:	section	.text,new
 543  0000               _PWR_GetFlagStatus:
 545  0000 88            	push	a
 546  0001 88            	push	a
 547       00000001      OFST:	set	1
 550                     ; 260   FlagStatus bitstatus = RESET;
 552                     ; 263   assert_param(IS_PWR_FLAG(PWR_FLAG));
 554                     ; 265   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 556  0002 a501          	bcp	a,#1
 557  0004 2709          	jreq	L742
 558                     ; 267     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 560  0006 720150b302    	btjf	20659,#0,L152
 561                     ; 269       bitstatus = SET;
 563  000b 2009          	jp	LC002
 564  000d               L152:
 565                     ; 273       bitstatus = RESET;
 566  000d 200b          	jp	L752
 567  000f               L742:
 568                     ; 278     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 570  000f c650b2        	ld	a,20658
 571  0012 1502          	bcp	a,(OFST+1,sp)
 572  0014 2704          	jreq	L752
 573                     ; 280       bitstatus = SET;
 575  0016               LC002:
 577  0016 a601          	ld	a,#1
 579  0018 2001          	jra	L552
 580  001a               L752:
 581                     ; 284       bitstatus = RESET;
 584  001a 4f            	clr	a
 585  001b               L552:
 586                     ; 289   return((FlagStatus)bitstatus);
 590  001b 85            	popw	x
 591  001c 81            	ret	
 614                     ; 297 void PWR_PVDClearFlag(void)
 614                     ; 298 {
 615                     .text:	section	.text,new
 616  0000               _PWR_PVDClearFlag:
 620                     ; 300   PWR->CSR1 |= PWR_CSR1_PVDIF;
 622  0000 721a50b2      	bset	20658,#5
 623                     ; 301 }
 626  0004 81            	ret	
 676                     ; 308 ITStatus PWR_PVDGetITStatus(void)
 676                     ; 309 {
 677                     .text:	section	.text,new
 678  0000               _PWR_PVDGetITStatus:
 680  0000 89            	pushw	x
 681       00000002      OFST:	set	2
 684                     ; 310   ITStatus bitstatus = RESET;
 686                     ; 312   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 690                     ; 314   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 692  0001 c650b2        	ld	a,20658
 693  0004 a420          	and	a,#32
 694  0006 6b01          	ld	(OFST-1,sp),a
 695                     ; 315   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 697  0008 c650b2        	ld	a,20658
 698  000b a410          	and	a,#16
 699  000d 6b02          	ld	(OFST+0,sp),a
 700                     ; 317   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 702  000f 7b01          	ld	a,(OFST-1,sp)
 703  0011 2708          	jreq	L513
 705  0013 7b02          	ld	a,(OFST+0,sp)
 706  0015 2704          	jreq	L513
 707                     ; 319     bitstatus = (ITStatus)SET;
 709  0017 a601          	ld	a,#1
 711  0019 2001          	jra	L713
 712  001b               L513:
 713                     ; 323     bitstatus = (ITStatus)RESET;
 715  001b 4f            	clr	a
 716  001c               L713:
 717                     ; 325   return ((ITStatus)bitstatus);
 721  001c 85            	popw	x
 722  001d 81            	ret	
 746                     ; 333 void PWR_PVDClearITPendingBit(void)
 746                     ; 334 {
 747                     .text:	section	.text,new
 748  0000               _PWR_PVDClearITPendingBit:
 752                     ; 336   PWR->CSR1 |= PWR_CSR1_PVDIF;
 754  0000 721a50b2      	bset	20658,#5
 755                     ; 337 }
 758  0004 81            	ret	
 771                     	xdef	_PWR_PVDClearITPendingBit
 772                     	xdef	_PWR_PVDClearFlag
 773                     	xdef	_PWR_GetFlagStatus
 774                     	xdef	_PWR_PVDGetITStatus
 775                     	xdef	_PWR_PVDITConfig
 776                     	xdef	_PWR_UltraLowPowerCmd
 777                     	xdef	_PWR_FastWakeUpCmd
 778                     	xdef	_PWR_PVDCmd
 779                     	xdef	_PWR_PVDLevelConfig
 780                     	xdef	_PWR_DeInit
 799                     	end
