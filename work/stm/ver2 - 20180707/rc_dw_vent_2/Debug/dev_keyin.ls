   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               __key_sec:
  24  0000 00            	dc.b	0
  25  0001               __key_min:
  26  0001 00            	dc.b	0
  27  0002               __key_hour:
  28  0002 00            	dc.b	0
  29  0003               ___key2:
  30  0003 00            	dc.b	0
  31  0004               ___key_2:
  32  0004 00            	dc.b	0
  33  0005               __key_continue:
  34  0005 00            	dc.b	0
  97                     	xdef	__key_continue
  98                     	xdef	___key_2
  99                     	xdef	___key2
 100                     	xdef	__key_hour
 101                     	xdef	__key_min
 102                     	xdef	__key_sec
 121                     	end
