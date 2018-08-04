   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 79 void PWR_DeInit(void)
  49                     ; 80 {
  51                     	switch	.text
  52  0000               _PWR_DeInit:
  56                     ; 81   PWR->CSR1 = PWR_CSR1_PVDIF;
  58  0000 352050b2      	mov	20658,#32
  59                     ; 82   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  61  0004 725f50b3      	clr	20659
  62                     ; 83 }
  65  0008 81            	ret	
 162                     ; 99 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 162                     ; 100 {
 163                     	switch	.text
 164  0009               _PWR_PVDLevelConfig:
 166  0009 88            	push	a
 167       00000000      OFST:	set	0
 170                     ; 102   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 172                     ; 105   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 174  000a c650b2        	ld	a,20658
 175  000d a4f1          	and	a,#241
 176  000f c750b2        	ld	20658,a
 177                     ; 108   PWR->CSR1 |= PWR_PVDLevel;
 179  0012 c650b2        	ld	a,20658
 180  0015 1a01          	or	a,(OFST+1,sp)
 181  0017 c750b2        	ld	20658,a
 182                     ; 110 }
 185  001a 84            	pop	a
 186  001b 81            	ret	
 241                     ; 118 void PWR_PVDCmd(FunctionalState NewState)
 241                     ; 119 {
 242                     	switch	.text
 243  001c               _PWR_PVDCmd:
 247                     ; 121   assert_param(IS_FUNCTIONAL_STATE(NewState));
 249                     ; 123   if (NewState != DISABLE)
 251  001c 4d            	tnz	a
 252  001d 2705          	jreq	L111
 253                     ; 126     PWR->CSR1 |= PWR_CSR1_PVDE;
 255  001f 721050b2      	bset	20658,#0
 258  0023 81            	ret	
 259  0024               L111:
 260                     ; 131     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 262  0024 721150b2      	bres	20658,#0
 263                     ; 133 }
 266  0028 81            	ret	
 301                     ; 168 void PWR_FastWakeUpCmd(FunctionalState NewState)
 301                     ; 169 {
 302                     	switch	.text
 303  0029               _PWR_FastWakeUpCmd:
 307                     ; 171   assert_param(IS_FUNCTIONAL_STATE(NewState));
 309                     ; 173   if (NewState != DISABLE)
 311  0029 4d            	tnz	a
 312  002a 2705          	jreq	L331
 313                     ; 176     PWR->CSR2 |= PWR_CSR2_FWU;
 315  002c 721450b3      	bset	20659,#2
 318  0030 81            	ret	
 319  0031               L331:
 320                     ; 181     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 322  0031 721550b3      	bres	20659,#2
 323                     ; 183 }
 326  0035 81            	ret	
 362                     ; 191 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 362                     ; 192 {
 363                     	switch	.text
 364  0036               _PWR_UltraLowPowerCmd:
 368                     ; 194   assert_param(IS_FUNCTIONAL_STATE(NewState));
 370                     ; 196   if (NewState != DISABLE)
 372  0036 4d            	tnz	a
 373  0037 2705          	jreq	L551
 374                     ; 199     PWR->CSR2 |= PWR_CSR2_ULP;
 376  0039 721250b3      	bset	20659,#1
 379  003d 81            	ret	
 380  003e               L551:
 381                     ; 204     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 383  003e 721350b3      	bres	20659,#1
 384                     ; 206 }
 387  0042 81            	ret	
 422                     ; 229 void PWR_PVDITConfig(FunctionalState NewState)
 422                     ; 230 {
 423                     	switch	.text
 424  0043               _PWR_PVDITConfig:
 428                     ; 232   assert_param(IS_FUNCTIONAL_STATE(NewState));
 430                     ; 234   if (NewState != DISABLE)
 432  0043 4d            	tnz	a
 433  0044 2705          	jreq	L771
 434                     ; 237     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 436  0046 721850b2      	bset	20658,#4
 439  004a 81            	ret	
 440  004b               L771:
 441                     ; 242     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 443  004b 721950b2      	bres	20658,#4
 444                     ; 244 }
 447  004f 81            	ret	
 540                     ; 258 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 540                     ; 259 {
 541                     	switch	.text
 542  0050               _PWR_GetFlagStatus:
 544  0050 88            	push	a
 545  0051 88            	push	a
 546       00000001      OFST:	set	1
 549                     ; 260   FlagStatus bitstatus = RESET;
 551                     ; 263   assert_param(IS_PWR_FLAG(PWR_FLAG));
 553                     ; 265   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 555  0052 a501          	bcp	a,#1
 556  0054 2709          	jreq	L742
 557                     ; 267     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 559  0056 720150b302    	btjf	20659,#0,L152
 560                     ; 269       bitstatus = SET;
 562  005b 2009          	jp	LC002
 563  005d               L152:
 564                     ; 273       bitstatus = RESET;
 565  005d 200b          	jp	L752
 566  005f               L742:
 567                     ; 278     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 569  005f c650b2        	ld	a,20658
 570  0062 1502          	bcp	a,(OFST+1,sp)
 571  0064 2704          	jreq	L752
 572                     ; 280       bitstatus = SET;
 574  0066               LC002:
 576  0066 a601          	ld	a,#1
 578  0068 2001          	jra	L552
 579  006a               L752:
 580                     ; 284       bitstatus = RESET;
 583  006a 4f            	clr	a
 584  006b               L552:
 585                     ; 289   return((FlagStatus)bitstatus);
 589  006b 85            	popw	x
 590  006c 81            	ret	
 613                     ; 297 void PWR_PVDClearFlag(void)
 613                     ; 298 {
 614                     	switch	.text
 615  006d               _PWR_PVDClearFlag:
 619                     ; 300   PWR->CSR1 |= PWR_CSR1_PVDIF;
 621  006d 721a50b2      	bset	20658,#5
 622                     ; 301 }
 625  0071 81            	ret	
 675                     ; 308 ITStatus PWR_PVDGetITStatus(void)
 675                     ; 309 {
 676                     	switch	.text
 677  0072               _PWR_PVDGetITStatus:
 679  0072 89            	pushw	x
 680       00000002      OFST:	set	2
 683                     ; 310   ITStatus bitstatus = RESET;
 685                     ; 312   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 689                     ; 314   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 691  0073 c650b2        	ld	a,20658
 692  0076 a420          	and	a,#32
 693  0078 6b01          	ld	(OFST-1,sp),a
 694                     ; 315   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 696  007a c650b2        	ld	a,20658
 697  007d a410          	and	a,#16
 698  007f 6b02          	ld	(OFST+0,sp),a
 699                     ; 317   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 701  0081 7b01          	ld	a,(OFST-1,sp)
 702  0083 2708          	jreq	L513
 704  0085 7b02          	ld	a,(OFST+0,sp)
 705  0087 2704          	jreq	L513
 706                     ; 319     bitstatus = (ITStatus)SET;
 708  0089 a601          	ld	a,#1
 710  008b 2001          	jra	L713
 711  008d               L513:
 712                     ; 323     bitstatus = (ITStatus)RESET;
 714  008d 4f            	clr	a
 715  008e               L713:
 716                     ; 325   return ((ITStatus)bitstatus);
 720  008e 85            	popw	x
 721  008f 81            	ret	
 745                     ; 333 void PWR_PVDClearITPendingBit(void)
 745                     ; 334 {
 746                     	switch	.text
 747  0090               _PWR_PVDClearITPendingBit:
 751                     ; 336   PWR->CSR1 |= PWR_CSR1_PVDIF;
 753  0090 721a50b2      	bset	20658,#5
 754                     ; 337 }
 757  0094 81            	ret	
 770                     	xdef	_PWR_PVDClearITPendingBit
 771                     	xdef	_PWR_PVDClearFlag
 772                     	xdef	_PWR_GetFlagStatus
 773                     	xdef	_PWR_PVDGetITStatus
 774                     	xdef	_PWR_PVDITConfig
 775                     	xdef	_PWR_UltraLowPowerCmd
 776                     	xdef	_PWR_FastWakeUpCmd
 777                     	xdef	_PWR_PVDCmd
 778                     	xdef	_PWR_PVDLevelConfig
 779                     	xdef	_PWR_DeInit
 798                     	end
