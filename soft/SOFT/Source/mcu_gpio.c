/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_gpio.c
* @author  wangxq
* @version v1.0.1
* @date    2020-04-23
* @brief   
*******************************************************************************
* @attention
*
*
*
*******************************************************************************
*/
#include "mcu_gpio.h"
/******************************************************************************
* name		: 
* function	: 
******************************************************************************/
void MCU_GpioInit(void)
{

	//說明:
	//MotoRCC;偵測過流
	//C-1偵測電池電流
	//===================================================================================================================
	//            PWM          moto1        moto-cc      adc3.7v      sw1          adc7.4V      G            motor2                              
	//------------7------------6------------5------------4------------3------------2------------1------------0------------
	PORTA  = BIT8(1,           0,           0,           0,           1,           0,           1,           0);
	TRISA  = BIT8(IO___IN,     IO__OUT,		IO___IN,     IO___IN,     IO___IN,     IO___IN,     IO__OUT,     IO__OUT);
	WPUA   = BIT8(IO_NOPU,     IO_NOPU,     IO_NOPU,     IO_NOPU,     IO___PU,     IO_NOPU,     IO_NOPU,     IO_NOPU);
	WPDA   = BIT8(IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO___PD);
	IOCA   = BIT8(IO_NOIT,     IO_NOIT,     IO_NOIT,     IO_NOIT,     IO___OC,     IO_NOIT,     IO_NOIT,     IO_NOIT); 
	ANSEL  = BIT8(IO_NAIN,     IO_NAIN,     IO__AIN,     IO__AIN,     IO_NAIN,     IO__AIN,     IO_NAIN,     IO_NAIN); 
	//===================================================================================================================
	//                                      SW2          R                                      C-1          USB-IN
	//------------7------------6------------5------------4------------3------------2------------1------------0------------
	PORTB  = BIT8(0,           0,           1,           1,           0,           0,           0,           1);
	TRISB  = BIT8(IO__OUT,     IO__OUT,		IO___IN,     IO__OUT,     IO__OUT,     IO__OUT,     IO___IN,     IO___IN);
	WPUB   = BIT8(IO_NOPU,     IO_NOPU,     IO___PU,     IO_NOPU,     IO_NOPU,     IO_NOPU,     IO_NOPU,     IO___PU);
	WPDB   = BIT8(IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD);
	IOCB   = BIT8(IO_NOIT,     IO_NOIT,     IO___OC,     IO_NOIT,     IO_NOIT,     IO_NOIT,     IO_NOIT,     IO___OC); 
	ANSELH = BIT8(IO_NAIN,     IO_NAIN,     IO_NAIN,     IO_NAIN,     IO_NAIN,     IO_NAIN,     IO__AIN,     IO_NAIN); 
	//===================================================================================================================
	
	
}
//

/******************************************************************************
* name		: 
* function	: 
******************************************************************************/
void MCU_GpioSetToSleep(void)
{

	//說明:
	//MotoRCC;偵測過流
	//C-1偵測電池電流
	//===================================================================================================================
	//            PWM          moto1        moto-cc      adc3.7v      sw1          adc7.4V      G            motor2                              
	//------------7------------6------------5------------4------------3------------2------------1------------0------------
	PORTA  = BIT8(1,           0,           0,           0,           1,           0,           1,           0);
	TRISA  = BIT8(IO___IN,     IO__OUT,		IO___IN,     IO___IN,     IO___IN,     IO___IN,     IO__OUT,     IO__OUT);
	WPUA   = BIT8(IO_NOPU,     IO_NOPU,     IO_NOPU,     IO_NOPU,     IO___PU,     IO_NOPU,     IO_NOPU,     IO_NOPU);
	WPDA   = BIT8(IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO___PD);
	IOCA   = BIT8(IO_NOIT,     IO_NOIT,     IO_NOIT,     IO_NOIT,     IO___OC,     IO_NOIT,     IO_NOIT,     IO_NOIT); 
	ANSEL  = BIT8(IO_NAIN,     IO_NAIN,     IO__AIN,     IO__AIN,     IO_NAIN,     IO__AIN,     IO_NAIN,     IO_NAIN); 
	//===================================================================================================================
	//                                      SW2          R                                      C-1          USB-IN
	//------------7------------6------------5------------4------------3------------2------------1------------0------------
	PORTB  = BIT8(0,           0,           1,           1,           0,           0,           0,           1);
	TRISB  = BIT8(IO__OUT,     IO__OUT,		IO___IN,     IO__OUT,     IO__OUT,     IO__OUT,     IO___IN,     IO___IN);
	WPUB   = BIT8(IO_NOPU,     IO_NOPU,     IO___PU,     IO_NOPU,     IO_NOPU,     IO_NOPU,     IO_NOPU,     IO___PU);
	WPDB   = BIT8(IO_NOPD,     IO_NOPD,     IO_NOPD,     IO_NOPD,     IO___PD,     IO_NOPD,     IO_NOPD,     IO_NOPD);
	IOCB   = BIT8(IO_NOIT,     IO_NOIT,     IO___OC,     IO_NOIT,     IO_NOIT,     IO_NOIT,     IO_NOIT,     IO___OC); 
	ANSELH = BIT8(IO_NAIN,     IO_NAIN,     IO_NAIN,     IO_NAIN,     IO_NAIN,     IO_NAIN,     IO__AIN,     IO_NAIN); 
	//===================================================================================================================
	
}
//
