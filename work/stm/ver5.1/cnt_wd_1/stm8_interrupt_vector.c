#include "stdafx.h"

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

#ifdef _COSMIC_
/*
*/
@far @interrupt void NonHandledInterrupt(void) { }

@far @interrupt void TRAP_IRQHandler(void) { }
#else /*_RAISONANCE_*/

/**
  * @brief  TRAP interrupt routine
  */
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler) { }
#endif /*_COSMIC_*/

/**
  * @brief  Top Level Interrupt routine
  */
INTERRUPT_HANDLER(TLI_IRQHandler, 0) { }

/**
  * @brief  Auto Wake Up Interrupt routine
  */
INTERRUPT_HANDLER(AWU_IRQHandler, 1)	{ }

/**
  * @brief  Clock Controller Interrupt routine
  */
INTERRUPT_HANDLER(CLK_IRQHandler, 2) { }

/**
  * @brief  External Interrupt PORTA Interrupt routine
  */
INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{	
#if defined (_CAPTURE_)
	gpio_portCbA();
#endif	//	_CAPTURE
}

/**
  * @brief  External Interrupt PORTB Interrupt routine
  */
INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
{
#if defined (_CAPTURE_)
	gpio_portCbB();
#endif	//	_CAPTURE
}

/**
  * @brief  External Interrupt PORTC Interrupt routine
  */
INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
{
}

/**
  * @brief  External Interrupt PORTD Interrupt routine
  */
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
}

/**
  * @brief  External Interrupt PORTE Interrupt routine
  */
INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
{
}
#ifdef STM8S903
/**
  * @brief  External Interrupt PORTF Interrupt routine
  */
 INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
{
}
#endif /*STM8S903*/

#ifdef STM8S208
/**
  * @brief  CAN RX Interrupt routine
  */
 INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8) { }

/**
  * @brief  CAN TX Interrupt routine
  */
 INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9) { }
#endif /*STM8S208 || STM8AF52Ax */

/**
  * @brief  SPI Interrupt routine
  */
INTERRUPT_HANDLER(SPI_IRQHandler, 10) { }

/**
  * @brief  Timer1 Update/Overflow/Trigger/Break Interrupt routine
  */
INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11) 
{ 
}

/**
  * @brief  Timer1 Capture/Compare Interrupt routine
  */
INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12) 
{ 
#if defined (_CNV_) || defined (_WOODANG_CNT_)
	timer1CiCb();
	TIM1_ClearFlag(TIM1_FLAG_CC2);
	TIM1_ClearITPendingBit(TIM1_FLAG_CC2);
#endif
}

#ifdef STM8S903
/**
  * @brief  Timer5 Update/Overflow/Break/Trigger Interrupt routine
  */
 INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13) { }
/**
  * @brief  Timer5 Capture/Compare Interrupt routine
  */
 INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14) { }

#else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */

void uart_Tx_timing(void);
/**
  * @brief  Timer2 Update/Overflow/Break Interrupt routine
  */
 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
{
/*
*/
#if defined (_CNV_) || defined (_WOODANG_CNT_)
/*
	timer2_UpdateCb();
	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
*/
#endif
//#if defined (_CAPTURE_)
//	timer2_UpdateCb();
//	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
//#endif	//	_CAPTURE_
}

/**
  * @brief  Timer2 Capture/Compare Interrupt routine
  */
 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
{
#if defined (_CNV_) || defined (_WOODANG_CNT_)
	timer2CiCb();
	TIM2_ClearFlag(TIM2_FLAG_CC2);
	TIM2_ClearITPendingBit(TIM2_FLAG_CC2);
#endif
}
#endif /*STM8S903*/

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \
    defined(STM8S005) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8AF626x)
/**
  * @brief  Timer3 Update/Overflow/Break Interrupt routine
  */
 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
{
}

/**
  * @brief  Timer3 Capture/Compare Interrupt routine
  */
 INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
{
//	swuart_Rx_timing();
}
#endif /*STM8S208, STM8S207 or STM8S105 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \
    defined(STM8S003) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8S903)
/**
  * @brief  UART1 TX Interrupt routine
  */
 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
{
	uart1_tx_irq();
}

/**
  * @brief  UART1 RX Interrupt routine
  */
 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
{
	uart1_rx_irq();
}
#endif /*STM8S105*/

/**
  * @brief  I2C Interrupt routine
  */
INTERRUPT_HANDLER(I2C_IRQHandler, 19) { }

#if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)
/**
  * @brief  UART2 TX interrupt routine.
  */
 INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20) { }

/**
  * @brief  UART2 RX interrupt routine.
  */
 INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21) { }
#endif /* STM8S105*/

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
/**
  * @brief  UART3 TX interrupt routine.
  */
 INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
{
	uart3_tx_irq();
}

/**
  * @brief  UART3 RX interrupt routine.
  */
 INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
{
	uart3_rx_irq();
}
#endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
/**
  * @brief  ADC2 interrupt routine.
  */
 INTERRUPT_HANDLER(ADC2_IRQHandler, 22) { }
#else /*STM8S105, STM8S103 or STM8S903 or STM8AF626x */
/**
  * @brief  ADC1 interrupt routine.
  */
 INTERRUPT_HANDLER(ADC1_IRQHandler, 22) { }
#endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */

#ifdef STM8S903
/**
  * @brief  Timer6 Update/Overflow/Trigger Interrupt routine
  */
INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23) { }
#else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */
/**
  * @brief  Timer4 Update/Overflow Interrupt routine
  */
 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) 
{ 
#if defined (_CNV_) || defined (_WOODANG_CNT_)
	timer4_UpdateCb();
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
#endif	//	_CAPTURE_
}
#endif /*STM8S903*/

/**
  * @brief  Eeprom EEC Interrupt routine
  */
INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24) { }

extern void _stext();     /* startup routine */

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* RESET */
	{0x82, (interrupt_handler_t)TRAP_IRQHandler}, /* TRAP - Software interrupt */
	{0x82, (interrupt_handler_t)TLI_IRQHandler}, /* irq0 - External Top Level interrupt (TLI) */
	{0x82, (interrupt_handler_t)AWU_IRQHandler}, /* irq1 - Auto Wake Up from Halt interrupt */
	{0x82, (interrupt_handler_t)CLK_IRQHandler}, /* irq2 - Clock Controller interrupt */
	{0x82, (interrupt_handler_t)EXTI_PORTA_IRQHandler}, /* irq3 - External interrupt 0 (GPIOA) */
	{0x82, (interrupt_handler_t)EXTI_PORTB_IRQHandler}, /* irq4 - External interrupt 1 (GPIOB) */
	{0x82, (interrupt_handler_t)EXTI_PORTC_IRQHandler}, /* irq5 - External interrupt 2 (GPIOC) */
	{0x82, (interrupt_handler_t)EXTI_PORTD_IRQHandler}, /* irq6 - External interrupt 3 (GPIOD) */
	{0x82, (interrupt_handler_t)EXTI_PORTE_IRQHandler}, /* irq7 - External interrupt 4 (GPIOE) */
	
#if defined (STM8S208) || defined (STM8AF52Ax)
	{0x82, (interrupt_handler_t)CAN_RX_IRQHandler}, /* irq8 - CAN Rx interrupt */
	{0x82, (interrupt_handler_t)CAN_TX_IRQHandler}, /* irq9 - CAN Tx/ER/SC interrupt */
#elif defined (STM8S903)
	{0x82, (interrupt_handler_t)EXTI_PORTF_IRQHandler}, /* irq8 - External interrupt 5 (GPIOF) */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq9 - Reserved */
#else /*STM8S207, STM8S105 or STM8AF62Ax or STM8AF626x*/
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq8 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq9 - Reserved */
#endif /* STM8S208 or STM8AF52Ax */
	{0x82, (interrupt_handler_t)SPI_IRQHandler}, /* irq10 - SPI End of transfer interrupt */
	{0x82, (interrupt_handler_t)TIM1_UPD_OVF_TRG_BRK_IRQHandler}, /* irq11 - TIM1 Update/Overflow/Trigger/Break interrupt */
	{0x82, (interrupt_handler_t)TIM1_CAP_COM_IRQHandler}, /* irq12 - TIM1 Capture/Compare interrupt */
  
#ifdef STM8S903
	{0x82, (interrupt_handler_t)TIM5_UPD_OVF_BRK_TRG_IRQHandler}, /* irq13 - TIM5 Update/Overflow/Break/Trigger interrupt  */
	{0x82, (interrupt_handler_t)TIM5_CAP_COM_IRQHandler}, /* irq14 - TIM5 Capture/Compare interrupt */
	
#else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF62Ax or STM8AF52Ax or STM8AF626x*/
	{0x82, (interrupt_handler_t)TIM2_UPD_OVF_BRK_IRQHandler}, /* irq13 - TIM2 Update/Overflow/Break interrupt  */
	{0x82, (interrupt_handler_t)TIM2_CAP_COM_IRQHandler}, /* irq14 - TIM2 Capture/Compare interrupt */
#endif /*STM8S903*/
	
#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \
    defined(STM8S005) ||  defined(STM8AF52Ax) || defined(STM8AF62Ax) || defined(STM8AF626x)
	{0x82, (interrupt_handler_t)TIM3_UPD_OVF_BRK_IRQHandler}, /* irq15 - TIM3 Update/Overflow/Break interrupt */
	{0x82, (interrupt_handler_t)TIM3_CAP_COM_IRQHandler}, /* irq16 - TIM3 Capture/Compare interrupt */
#else
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq15 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq16 - Reserved */
#endif /*STM8S208, STM8S207, STM8S105 or STM8AF62Ax or STM8AF52Ax or STM8AF626x*/
	
#if defined (STM8S105) || defined (STM8S005) || defined(STM8AF626x)
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq17 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq18 - Reserved */
#else
	{0x82, (interrupt_handler_t)UART1_TX_IRQHandler}, /* irq17 - UART1 Tx complete interrupt */
	{0x82, (interrupt_handler_t)UART1_RX_IRQHandler}, /* irq18 - UART1 Rx interrupt */
#endif /*STM8S105 or STM8AF626x */
	{0x82, (interrupt_handler_t)I2C_IRQHandler}, /* irq19 - I2C interrupt */

#if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || defined(STM8AF62Ax)

	{0x82, (interrupt_handler_t)UART3_TX_IRQHandler}, /* irq20 - UART3 Tx interrupt */
	{0x82, (interrupt_handler_t)UART3_RX_IRQHandler}, /* irq21 - UART3 Rx interrupt */
#elif defined (STM8S105) || defined (STM8S005) || defined (STM8AF626x)
	{0x82, (interrupt_handler_t)UART2_TX_IRQHandler}, /* irq20 - UART2 Tx interrupt */
	{0x82, (interrupt_handler_t)UART2_RX_IRQHandler}, /* irq21 - UART2 Rx interrupt */

#else /* STM8S103, STM8S903 */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq20 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq21 - Reserved */
#endif /* STM8S208, STM8S207, STM8AF52Ax or STM8AF62Ax */

#if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || defined(STM8AF62Ax)
	{0x82, (interrupt_handler_t)ADC2_IRQHandler}, /* irq22 - ADC2 end of conversion interrupt */
#else /* STM8S105, STM8S103, STM8S903 */
	{0x82, (interrupt_handler_t)ADC1_IRQHandler}, /* irq22 - ADC1 end of conversion/Analog watchdog interrupts */

#endif /* STM8S208, STM8S207, STM8AF52Ax or STM8AF62Ax */

#ifdef STM8S903
	{0x82, (interrupt_handler_t)TIM6_UPD_OVF_TRG_IRQHandler}, /* irq23 - TIM6 Update/Overflow/Trigger interrupt */
#else
	{0x82, (interrupt_handler_t)TIM4_UPD_OVF_IRQHandler}, /* irq23 - TIM4 Update/Overflow interrupt */
#endif /*STM8S903*/
	{0x82, (interrupt_handler_t)EEPROM_EEC_IRQHandler},  /* irq24 - FLASH interrupt */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq25 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq26 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq27 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq28 - Reserved */
	{0x82, (interrupt_handler_t)NonHandledInterrupt}, /* irq29 - Reserved */

};

