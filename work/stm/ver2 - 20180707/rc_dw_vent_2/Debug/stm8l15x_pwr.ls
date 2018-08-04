   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 79 void PWR_DeInit(void)
  50                     ; 80 {
  51                     .text:	section	.text,new
  52  0000               f_PWR_DeInit:
  56                     ; 81   PWR->CSR1 = PWR_CSR1_PVDIF;
  58  0000 352050b2      	mov	20658,#32
  59                     ; 82   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  61  0004 725f50b3      	clr	20659
  62                     ; 83 }
  65  0008 87            	retf	
 161                     ; 99 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 161                     ; 100 {
 162                     .text:	section	.text,new
 163  0000               f_PWR_PVDLevelConfig:
 165  0000 88            	push	a
 166       00000000      OFST:	set	0
 169                     ; 102   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 171                     ; 105   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 173  0001 c650b2        	ld	a,20658
 174  0004 a4f1          	and	a,#241
 175  0006 c750b2        	ld	20658,a
 176                     ; 108   PWR->CSR1 |= PWR_PVDLevel;
 178  0009 c650b2        	ld	a,20658
 179  000c 1a01          	or	a,(OFST+1,sp)
 180  000e c750b2        	ld	20658,a
 181                     ; 110 }
 184  0011 84            	pop	a
 185  0012 87            	retf	
 239                     ; 118 void PWR_PVDCmd(FunctionalState NewState)
 239                     ; 119 {
 240                     .text:	section	.text,new
 241  0000               f_PWR_PVDCmd:
 245                     ; 121   assert_param(IS_FUNCTIONAL_STATE(NewState));
 247                     ; 123   if (NewState != DISABLE)
 249  0000 4d            	tnz	a
 250  0001 2705          	jreq	L111
 251                     ; 126     PWR->CSR1 |= PWR_CSR1_PVDE;
 253  0003 721050b2      	bset	20658,#0
 256  0007 87            	retf	
 257  0008               L111:
 258                     ; 131     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 260  0008 721150b2      	bres	20658,#0
 261                     ; 133 }
 264  000c 87            	retf	
 298                     ; 168 void PWR_FastWakeUpCmd(FunctionalState NewState)
 298                     ; 169 {
 299                     .text:	section	.text,new
 300  0000               f_PWR_FastWakeUpCmd:
 304                     ; 171   assert_param(IS_FUNCTIONAL_STATE(NewState));
 306                     ; 173   if (NewState != DISABLE)
 308  0000 4d            	tnz	a
 309  0001 2705          	jreq	L331
 310                     ; 176     PWR->CSR2 |= PWR_CSR2_FWU;
 312  0003 721450b3      	bset	20659,#2
 315  0007 87            	retf	
 316  0008               L331:
 317                     ; 181     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 319  0008 721550b3      	bres	20659,#2
 320                     ; 183 }
 323  000c 87            	retf	
 358                     ; 191 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 358                     ; 192 {
 359                     .text:	section	.text,new
 360  0000               f_PWR_UltraLowPowerCmd:
 364                     ; 194   assert_param(IS_FUNCTIONAL_STATE(NewState));
 366                     ; 196   if (NewState != DISABLE)
 368  0000 4d            	tnz	a
 369  0001 2705          	jreq	L551
 370                     ; 199     PWR->CSR2 |= PWR_CSR2_ULP;
 372  0003 721250b3      	bset	20659,#1
 375  0007 87            	retf	
 376  0008               L551:
 377                     ; 204     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 379  0008 721350b3      	bres	20659,#1
 380                     ; 206 }
 383  000c 87            	retf	
 417                     ; 229 void PWR_PVDITConfig(FunctionalState NewState)
 417                     ; 230 {
 418                     .text:	section	.text,new
 419  0000               f_PWR_PVDITConfig:
 423                     ; 232   assert_param(IS_FUNCTIONAL_STATE(NewState));
 425                     ; 234   if (NewState != DISABLE)
 427  0000 4d            	tnz	a
 428  0001 2705          	jreq	L771
 429                     ; 237     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 431  0003 721850b2      	bset	20658,#4
 434  0007 87            	retf	
 435  0008               L771:
 436                     ; 242     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 438  0008 721950b2      	bres	20658,#4
 439                     ; 244 }
 442  000c 87            	retf	
 534                     ; 258 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 534                     ; 259 {
 535                     .text:	section	.text,new
 536  0000               f_PWR_GetFlagStatus:
 538  0000 88            	push	a
 539  0001 88            	push	a
 540       00000001      OFST:	set	1
 543                     ; 260   FlagStatus bitstatus = RESET;
 545                     ; 263   assert_param(IS_PWR_FLAG(PWR_FLAG));
 547                     ; 265   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 549  0002 a501          	bcp	a,#1
 550  0004 2709          	jreq	L742
 551                     ; 267     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 553  0006 720150b302    	btjf	20659,#0,L152
 554                     ; 269       bitstatus = SET;
 556  000b 2009          	jpf	LC002
 557  000d               L152:
 558                     ; 273       bitstatus = RESET;
 559  000d 200b          	jpf	L752
 560  000f               L742:
 561                     ; 278     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 563  000f c650b2        	ld	a,20658
 564  0012 1502          	bcp	a,(OFST+1,sp)
 565  0014 2704          	jreq	L752
 566                     ; 280       bitstatus = SET;
 568  0016               LC002:
 570  0016 a601          	ld	a,#1
 572  0018 2001          	jra	L552
 573  001a               L752:
 574                     ; 284       bitstatus = RESET;
 577  001a 4f            	clr	a
 578  001b               L552:
 579                     ; 289   return((FlagStatus)bitstatus);
 583  001b 85            	popw	x
 584  001c 87            	retf	
 606                     ; 297 void PWR_PVDClearFlag(void)
 606                     ; 298 {
 607                     .text:	section	.text,new
 608  0000               f_PWR_PVDClearFlag:
 612                     ; 300   PWR->CSR1 |= PWR_CSR1_PVDIF;
 614  0000 721a50b2      	bset	20658,#5
 615                     ; 301 }
 618  0004 87            	retf	
 667                     ; 308 ITStatus PWR_PVDGetITStatus(void)
 667                     ; 309 {
 668                     .text:	section	.text,new
 669  0000               f_PWR_PVDGetITStatus:
 671  0000 89            	pushw	x
 672       00000002      OFST:	set	2
 675                     ; 310   ITStatus bitstatus = RESET;
 677                     ; 312   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 681                     ; 314   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 683  0001 c650b2        	ld	a,20658
 684  0004 a420          	and	a,#32
 685  0006 6b01          	ld	(OFST-1,sp),a
 686                     ; 315   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 688  0008 c650b2        	ld	a,20658
 689  000b a410          	and	a,#16
 690  000d 6b02          	ld	(OFST+0,sp),a
 691                     ; 317   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 693  000f 7b01          	ld	a,(OFST-1,sp)
 694  0011 2708          	jreq	L513
 696  0013 7b02          	ld	a,(OFST+0,sp)
 697  0015 2704          	jreq	L513
 698                     ; 319     bitstatus = (ITStatus)SET;
 700  0017 a601          	ld	a,#1
 702  0019 2001          	jra	L713
 703  001b               L513:
 704                     ; 323     bitstatus = (ITStatus)RESET;
 706  001b 4f            	clr	a
 707  001c               L713:
 708                     ; 325   return ((ITStatus)bitstatus);
 712  001c 85            	popw	x
 713  001d 87            	retf	
 736                     ; 333 void PWR_PVDClearITPendingBit(void)
 736                     ; 334 {
 737                     .text:	section	.text,new
 738  0000               f_PWR_PVDClearITPendingBit:
 742                     ; 336   PWR->CSR1 |= PWR_CSR1_PVDIF;
 744  0000 721a50b2      	bset	20658,#5
 745                     ; 337 }
 748  0004 87            	retf	
 760                     	xdef	f_PWR_PVDClearITPendingBit
 761                     	xdef	f_PWR_PVDClearFlag
 762                     	xdef	f_PWR_GetFlagStatus
 763                     	xdef	f_PWR_PVDGetITStatus
 764                     	xdef	f_PWR_PVDITConfig
 765                     	xdef	f_PWR_UltraLowPowerCmd
 766                     	xdef	f_PWR_FastWakeUpCmd
 767                     	xdef	f_PWR_PVDCmd
 768                     	xdef	f_PWR_PVDLevelConfig
 769                     	xdef	f_PWR_DeInit
 788                     	end
