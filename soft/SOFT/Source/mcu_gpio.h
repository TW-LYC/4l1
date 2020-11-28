/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_gpio.h
* @author  wangxq
* @version v1.0.1
* @date    2020-04-23
* @brief   
*******************************************************************************
* @attention
*
* #include "mcu_gpio.h"
*
*******************************************************************************
*/
#include "global.h"
#ifndef __MCU_GPIO__H
#define __MCU_GPIO__H
//-----------------------------------------------------------------------------
#define BIT8(v7,v6,v5,v4,v3,v2,v1,v0) ( ((v7)<<7) | ((v6)<<6) | ((v5)<<5) | ((v4)<<4) | ((v3)<<3) | ((v2)<<2) | ((v1)<<1) | (v0))
#define IO___IN	1	//输入
#define IO__OUT	0
#define IO___PU	1	//上拉	
#define IO_NOPU	0
#define IO___PD	1	//下拉
#define IO_NOPD	0
#define IO__INT 1	//中断
#define IO_NOIT 0
#define IO___WU	1	//唤醒
#define IO_NOWU	0
#define IO__AIN 1	//模拟输入
#define IO_NAIN 0
#define IO___OC 1	//开漏输出
#define IO_NOOC 0

//-----------------------------------------------------------------------------
extern void MCU_GpioInit(void);
extern void MCU_GpioSetToSleep(void);
//-----------------------------------------------------------------------------

#endif //__MCU_GPIO__H
