/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_config.h
* @author  wangxq
* @version v1.0.1
* @date    2020-04-23
* @brief   
*******************************************************************************
* @attention
*
* #include "mcu_config.h"
*
*******************************************************************************
*/
#include "global.h"
#ifndef __MCU_CONFIG__H
#define __MCU_CONFIG__H

#include "mcu_timer.h"
#include "mcu_gpio.h"
#include "mcu_int.h"
#include "mcu_pwm.h"
#include "mcu_adc.h"

extern void MCU_Config(void);


#endif //__MCU_CONFIG__H
