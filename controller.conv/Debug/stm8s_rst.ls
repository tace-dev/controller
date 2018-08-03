   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
 118                     ; 48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 118                     ; 49 {
 120                     	switch	.text
 121  0000               _RST_GetFlagStatus:
 125                     ; 51     assert_param(IS_RST_FLAG_OK(RST_Flag));
 127                     ; 55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 129  0000 c450b3        	and	a,20659
 132  0003 81            	ret
 167                     ; 64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 167                     ; 65 {
 168                     	switch	.text
 169  0004               _RST_ClearFlag:
 173                     ; 67     assert_param(IS_RST_FLAG_OK(RST_Flag));
 175                     ; 69     RST->SR = (uint8_t)RST_Flag;
 177  0004 c750b3        	ld	20659,a
 178                     ; 70 }
 181  0007 81            	ret
 194                     	xdef	_RST_ClearFlag
 195                     	xdef	_RST_GetFlagStatus
 214                     	end
