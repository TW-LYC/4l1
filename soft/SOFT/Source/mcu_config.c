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
	//�������ƼĴ��� OSCCON(8FH)
	//Bit6~Bit4 IRCF<2:0>: �ڲ�������Ƶѡ��λ��
	//            111= FSYS = FOSC /1
	//            110= FSYS = FOSC /2��Ĭ�ϣ�
	//            101= FSYS = FOSC /4
	//            100= FSYS = FOSC /8
	//            011= FSYS = FOSC /16
	//            010= FSYS = FOSC /32
	//            001= FSYS = FOSC /64
	//            000= FSYS = 32kHz��LFINTOSC����
	//Bit0      SCS: ϵͳʱ��ѡ��λ��
	//            1= �ڲ���������ϵͳʱ�ӡ�
	//            0= ʱ��Դ��CONFIG���塣
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
	
	//���Ź���ʱ�����ƼĴ��� WDTCON(105H)
	//Bit0 SWDTEN: ���ʹ�ܻ��ֹ���Ź���ʱ��λ��
	//             1= ʹ�� WDT��
	//             0= ��ֹ WDT����λֵ����
	#define SWD_EN		(1<<0)
	//WDTCON = SWD_EN;
	
	//Ԥ��Ƶ�� OPTION_REG(81H)
	//Bit6 INTEDG: �����жϵı���ѡ��λ��
	//               1= INT ���������ش����жϡ�
	//               0= INT �����½��ش����жϡ�
	//Bit5 T0CS:TIMER0 ʱ��Դѡ��λ��
	//               0=�ڲ�ָ������ʱ�ӣ�FSYS/4����
	//               1=T0CKI �����ϵ������ء�
	//Bit4 T0SE:TIMER0 ʱ��Դ����ѡ��λ��
	//               0=�� T0CKI �����źŴӵ͵�ƽ���䵽�ߵ�ƽʱ������
	//               1=�� T0CKI �����źŴӸߵ�ƽ���䵽�͵�ƽʱ������
	//Bit3 PSA:Ԥ��Ƶ������λ��
	//               0=Ԥ��Ƶ������� TIMER0 ģ�顣
	//               1=Ԥ��Ƶ������� WDT��
	//Bit2~Bit0 PS2~PS0: Ԥ��Ƶ��������λ��
	//               PS2 PS1 PS0 TMR0��Ƶ�� WDT��Ƶ��
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
