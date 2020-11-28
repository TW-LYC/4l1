/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_int.c
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
#include "mcu_int.h"

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_IntInit(void)
{
	//�жϿ��ƼĴ��� INTCON (0BH)
	//	Bit7 GIE: ȫ���ж�����λ��
	//	Bit6 PEIE: �����ж�����λ��
	//	Bit5 T0IE: TIMER0����ж�����λ��
	//	Bit4 INTE: INT�ⲿ�ж�����λ��
	//	Bit3 RBIE: PORTB��ƽ�仯�ж�����λ��1����IOCB �Ĵ���Ҳ����ʹ�ܣ���Ӧ�Ŀ���������Ϊ����̬
	//	Bit2 T0IF: TIMER0����жϱ�־λ��2������������������㣩��λ����ʹ TMR0 �����ı�,��Ҫ�ֶ�����
	//	Bit1 INTF: INT�ⲿ�жϱ�־λ����������������㣩
	//	Bit0 RBIF: PORTB��ƽ�仯�жϱ�־λ��
	//		1= PORTB�˿���������һ�����ŵĵ�ƽ״̬�����˸ı䣨������������㣩 ��
	//		0= û��һ��PORTBͨ��I/O���ŵ�״̬�����˸ı䡣
	#define G_IE			(1<<7)
	#define PE_IE			(1<<6)
	#define T0_IE			(1<<5)
	#define IN_TE			(1<<4)
	#define RB_IE			(1<<3)
	#define T0_IF			(1<<2)
	#define IN_TF			(1<<1)
	#define RB_IF			(1<<0)
	INTCON = PE_IE;
	
	//�����ж�����Ĵ��� PIE1(8CH)
	//	Bit7 RAIE: PORTA��ƽ�仯�ж�����λ��
	//	Bit6 ADIE: ADת������ADC���ж�����λ��
	//	Bit5~Bit4 ����
	//	Bit3 EEIE: EEDATAд�ж�����λ��
	//	Bit2 PWMIE: PWM�ж�����λ��
	//	Bit1 TMR2IE: TIMER2��PR2ƥ���ж�����λ��
	//	Bit0 TMR1IE: TIMER1����ж�����λ��
	#define RA_IE			(1<<7)
	#define AD_IE			(1<<6)
	#define EE_IE			(1<<3)
	#define PWM_IE			(1<<2)
	#define T2_IE			(1<<1)
	#define T1_IE			(1<<0)
	PIE1 = T2_IE;
	
	//�����ж�����Ĵ��� PIE2(8DH)
	//	Bit7~Bit1 δ�á�
	//	Bit0 LVDIE: LVD�ж�����λ��
	#define LVD_IE			(1<<0)
	PIE2 = 0;
	
	//�����ж�����Ĵ��� PIR1(0CH)
	//Bit7 RAIF: PORTA��ƽ�仯�жϱ�־λ��
	//Bit6 ADIF: ADת�����жϱ�־λ��
	//	1= ADת����ɣ�������������㣩��
	//	0= ADת��δ��ɻ���δ������
	//Bit5~Bit4 ����
	//Bit3 EEIF: ����EEPROMд�����жϱ�־λ��
	//	1= д������ɣ�������������㣩��
	//	0= д����δ��ɻ���δ������
	//Bit2 PWMIF: PWM�жϱ�־λ����������������㣩
	//Bit1 TMR2IF: TIMER2��PR2ƥ���жϱ�־λ����������������㣩
	//Bit1 TMR1IF: TIMER1��PR1ƥ���жϱ�־λ����������������㣩****����������Ѹ�
	#define RA_IF				(1<<7)
	#define AD_IF				(1<<6)
	#define EE_IF				(1<<3)
	#define PWM_IF				(1<<2)
	#define T2_IF				(1<<1)
	#define T1_IF				(1<<0)
	PIR1 = 0;
	
	//�����ж�����Ĵ��� PIR2(0DH)
	#define LVD_IF			(1<<0)
	PIR2 = 0;
	
	
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void interrupt ISR(void)
{
	if (T0IE && T0IF)
	{
		T0IF = 0;//�ڴ˼���TMR0 �жϷ���
	}
	if (TMR1IE && TMR1IF)
	{
		TMR1IF = 0;//�ڴ˼���TMR1 �жϷ���
	}
	
	if(TMR2IF)
	{
		TMR2IF = 0;
		//--------------------------------------100us
	//	PIN_TP1 = ~PIN_TP1;
	
		if (++gTimeCntFor10ms >= 100) {
			gTimeCntFor10ms = 0;
			gbTime10ms = 1;
			
		}

	}
	if(RAIF || RBIF)
	{
		RAIF = 0;
		RBIF = 0;
	}
}
//