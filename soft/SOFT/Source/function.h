/* Copyright (c) all rights reserved
*******************************************************************************
* @file    function.h
* @author  wangxq
* @version v1.0.1
* @date    2020-04-23
* @brief   
*******************************************************************************
* @attention
*
* #include "function.h"
*
*******************************************************************************
*/
#include "global.h"
#ifndef __FUNCTION__H
#define __FUNCTION__H

//-------------------------------------------------------------
extern bit cupIndex;
//-------------------------------------------------------------

extern void FUN_Init(void);
extern void FUN_Driver(void);
extern void CUP_USB_Driver(void);
extern void KEY_Driver(void);
extern void KEY_WorkDriver(void);
extern void MCU_SleepConfig(u8 isSleep);
extern void MCU_EnterSleep(void);

extern void ADC_Deal(void);
extern void BAT_Init(void);
extern void BAT_Driver(void);

extern void LED_Display(void);
extern void Move_Function(void);
#endif //__FUNCTION__H
