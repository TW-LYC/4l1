/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_config.c
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
#include "mcu_config.h"
	

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
/*void SysDelay(void)
{
	#define SYS_DELAY 		(500)	//500ms
    __V u32 i,j;
    for(i=0;i<SYS_DELAY;i++) {
    	for(j=0;j<200;j++) {
    		_nop_();
    	}
		CLR_WDT();
    }
}
//
*/

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_PoweronConfig(void)
{
	//振荡器控制寄存器 OSCCON(8FH)
	//Bit6~Bit4 IRCF<2:0>: 内部振荡器分频选择位。
	//            111= FSYS = FOSC /1
	//            110= FSYS = FOSC /2（默认）
	//            101= FSYS = FOSC /4
	//            100= FSYS = FOSC /8
	//            011= FSYS = FOSC /16
	//            010= FSYS = FOSC /32
	//            001= FSYS = FOSC /64
	//            000= FSYS = 32kHz（LFINTOSC）。
	//Bit0      SCS: 系统时钟选择位。
	//            1= 内部振荡器用作系统时钟。
	//            0= 时钟源由CONFIG定义。
	#define FSYS_DIV_1	(7<<4)
	#define FSYS_DIV_2	(6<<4)
	#define FSYS_DIV_4	(5<<4)
	#define FSYS_DIV_8	(4<<4)
	#define FSYS_DIV_16	(3<<4)
	#define FSYS_DIV_32	(2<<4)
	#define FSYS_DIV_64	(1<<4)
	#define FSYS_32K	(0<<4)
	#define FSYS_IRC	(1<<0)
	#define FSYS_CONFIG	(0<<0)
	OSCCON = FSYS_DIV_1 | FSYS_IRC;
	
	//看门狗定时器控制寄存器 WDTCON(105H)
	//Bit0 SWDTEN: 软件使能或禁止看门狗定时器位。
	//             1= 使能 WDT。
	//             0= 禁止 WDT（复位值）。
	#define SWD_EN		(1<<0)
	//WDTCON = SWD_EN;
	
	//预分频器 OPTION_REG(81H)
	//Bit6 INTEDG: 触发中断的边沿选择位。
	//               1= INT 引脚上升沿触发中断。
	//               0= INT 引脚下降沿触发中断。
	//Bit5 T0CS:TIMER0 时钟源选择位。
	//               0=内部指令周期时钟（FSYS/4）。
	//               1=T0CKI 引脚上的跳变沿。
	//Bit4 T0SE:TIMER0 时钟源边沿选择位。
	//               0=在 T0CKI 引脚信号从低电平跳变到高电平时递增。
	//               1=在 T0CKI 引脚信号从高电平跳变到低电平时递增。
	//Bit3 PSA:预分频器分配位。
	//               0=预分频器分配给 TIMER0 模块。
	//               1=预分频器分配给 WDT。
	//Bit2~Bit0 PS2~PS0: 预分频参数配置位。
	//               PS2 PS1 PS0 TMR0分频比 WDT分频比
	//               0   0   0       1:2       1:1
	//               0   0   1       1:4       1:2
	//               0   1   0       1:8       1:4
	//               0   1   1       1:16      1:8
	//               1   0   0       1:32      1:16
	//               1   0   1       1:64      1:32
	//               1   1   0       1:128     1:64
	//               1   1   1       1:256     1:128
	#define INTEDG_UP			(1<<6)
	#define INTEDG_DOWN			(0<<6)
	#define T0_CLK_FSYS_DIV4	(0<<5)
	#define T0_CLK_GPIO_IN		(1<<5)
	#define T0_CLK_GPIO_UP		(0<<4)
	#define T0_CLK_GPIO_DOWN	(1<<4)
	#define PS_T0_DIV2			(0<<0)
	#define PS_T0_DIV4			(1<<0)
	#define PS_T0_DIV8			(2<<0)
	#define PS_T0_DIV16			(3<<0)
	#define PS_T0_DIV32			(4<<0)
	#define PS_T0_DIV64			(5<<0)
	#define PS_T0_DIV128		(6<<0)
	#define PS_T0_DIV256		(7<<0)
	#define PS_WDT_DIV1			(0<<0)
	#define PS_WDT_DIV2			(1<<0)
	#define PS_WDT_DIV4			(2<<0)
	#define PS_WDT_DIV8			(3<<0)
	#define PS_WDT_DIV16		(4<<0)
	#define PS_WDT_DIV32		(5<<0)
	#define PS_WDT_DIV64		(6<<0)
	#define PS_WDT_DIV128		(7<<0)
	#define PS_SEL_T0			(0<<3)
	#define PS_SEL_WDT			(1<<3)
	
	OPTION_REG = PS_WDT_DIV128 | PS_SEL_WDT;
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_Config(void)
{
	__delay_ms(100);
	MCU_PoweronConfig();

	MCU_GpioInit();
	MCU_TimerInit();
	MCU_IntInit();
	MCU_PwmInit();
	MCU_AdcInit();

}
//
