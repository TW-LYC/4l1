/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_adc.h
* @author  wangxq
* @version v1.0.1
* @date    2020-04-23
* @brief   
*******************************************************************************
* @attention
*
* #include "mcu_adc.h"
*
*******************************************************************************
*/
#include "global.h"
#ifndef __MCU_ADC__H
#define __MCU_ADC__H


extern void MCU_AdcInit(void);
extern u16 MCU_GetAd(u8 ch);
extern void ADC_Driver(void);
extern void ADC_Sample(unsigned char adch);
#endif //__MCU_ADC__H
