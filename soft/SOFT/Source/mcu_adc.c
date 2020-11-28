/* Copyright (c) all rights reserved
*******************************************************************************
* @file    mcu_adc.c
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
#include "global.h"
#include "mcu_adc.h"
#include "struct.h"

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_AdcInit(void)
{
	//AD ���ƼĴ��� ADCON0(1FH)
	//	Bit7~Bit6 ADCS<1:0>: ADת��ʱ��ѡ��λ��
	//		00= FSYS/8
	//		01= FSYS/16
	//		10= FSYS/32
	//		11= FRC����ר�õ��ڲ���������Ƶ�����Ϊ32KHz��ʱ�ӣ�
	//	Bit5~Bit2 CHS<3:0>: ģ��ͨ��ѡ��λ��
	//		0000= ����
	//		0001= AN1
	//		0010= AN2
	//		0011= AN3
	//		0100= AN4
	//		0101= AN5
	//		0110= AN6
	//		0111= AN7
	//		1000= AN8
	//		1001= AN9
	//		1010= AN10
	//		1011= AN11
	//		1100= AN12
	//		1101= AN13
	//		1110= OPA0O/OPA1O
	//		1111= �ڲ���׼��ѹ1.2V
	//	Bit1 GO/DONE: ADת��״̬λ��
	//		1= ADת�����ڽ��С�����λ��1����ADת������ADת������Ժ󣬸�λ��Ӳ���Զ����㡣
	//		0= ADת�����/���ڽ����С�
	//	Bit0 ADON: ADCʹ��λ��
	//		1= ʹ��ADC��
	//		0= ��ֹADC�������Ĺ�������
	
	//AD ���ݼĴ�����λ ADCON1(9FH)
	//	Bit7 ADFM: ADת�������ʽѡ��λ��
	//		1= �Ҷ��룻(�Ҷ���ֻ��10λAD)
	//		0= ����롣
	//	Bit6~Bit3 δ�ã���Ϊ0��
	//	Bit2 LDO_EN: �ڲ��ο���ѹʹ��λ��
	//		1= ʹ��ADC�ڲ�LDO�ο���ѹ��
	//		��ѡ���ڲ�LDO���ο���ѹʱ�� ADC�����Ч����Ϊ8λ��
	//		0= VDD��ΪADC�ο���ѹ��
	//	Bit1 δ��
	//	Bit0 LDO_SEL: LDO�ο���ѹѡ��λ��
	//		0= 2.4V
	//		1= 2.0V
	
	//AD ���ݼĴ�����λ ADRESH(1EH)[7:0]�� ADFM=0 //ADRES<11:4>: ADC����Ĵ���λ��12λת������ĸ�8λ��
	//AD ���ݼĴ�����λ ADRESL(9EH)[7:4]�� ADFM=0 //ADRES<3:0>: ADC����Ĵ���λ�� 12λת������ĵ�4λ��
	//AD ���ݼĴ�����λ ADRESH(1EH)[1:0]�� ADFM=1 //ADRES<11:10>: ADC����Ĵ���λ�� 12λת������ĸ�2λ��
	//AD ���ݼĴ�����λ ADRESL(9EH)[7:0]�� ADFM=1 //ADRES<9:2>: ADC����Ĵ���λ��12λת������ĵ�9-2λ
	//--------------------------------------ADCON0
	#define AD_CLK_DIV8			(0<<6)
	#define AD_CLK_DIV16		(1<<6)
	#define AD_CLK_DIV32		(2<<6)
	#define AD_CLK_32K			(3<<6)
	#define AD_CHS(n)			((n)<<2)
	#define AD_CH_OP			AD_CHS(14)
	#define AD_CH_REF1_2V		AD_CHS(15)
	#define AD_DONE				(1<<1)
	#define IS_AD_DONE()		(ADCON0&(AD_DONE))
	#define AD_ON				(1<<0)
	//--------------------------------------ADCON1
	#define AD_AIGN_RIGHT		(1<<7)
	#define AD_AIGN_LEFT		(0<<7)
	#define AD_REFV_LDO			(1<<2)
	#define AD_REFV_VDD			(0<<2)
	#define AD_LDO_2_0V			(1<<0)
	#define AD_LDO_2_4V			(0<<0)
	
	ADCON0 = AD_CLK_DIV16 | AD_ON;
//	ADCON1 = AD_AIGN_LEFT | AD_REFV_VDD;
	ADCON1 = AD_AIGN_LEFT | AD_REFV_LDO | AD_LDO_2_0V;
}
//


/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void ADC_Sample(unsigned char adch)
{
	static unsigned long adsum = 0;
	static unsigned int admin = 0,admax = 0;
	static unsigned char adtimes = 0;
	volatile unsigned int ad_temp;

	ADCON1 = 0B00000100;						//�����,ѡ���ڲ�2.4V��AD��׼
	ADCON0 = 0X41 | (adch << 2);	//ѡ��16��Ƶ��ѡ��ADͨ��
	asm("nop");
	asm("nop");
	GODONE = 1;						//��ʼת��

	unsigned char i = 0;
	while(GODONE)
	{
		if(0 == (--i))
			return;
	}
	
	ad_temp=(ADRESH<<4)+(ADRESL>>4);	//����12λADֵ
	
	if(0 == admax)
	{
		admax = ad_temp;
		admin = ad_temp;
	}
	else if(ad_temp > admax)
		admax = ad_temp;				//AD�������ֵ
	else if(ad_temp < admin)
		admin = ad_temp;				//AD������Сֵ
	
	adsum += ad_temp;
	if(++adtimes >= 10)
	{
		adsum -= admax;
		if(adsum >= admin)	adsum -= admin;
			else	adsum = 0;
		
		adc.adcBufferTemp = adsum >> 3;		//8��ƽ��ֵ��Ϊ���ս��
		
		adsum = 0;
		admin = 0;
		admax = 0;
		adtimes = 0;
	}
}
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void ADC_Driver(void)
{
	u8 i;
	if (adc.chIndex > 3){
		adc.chIndex = 0;
	}
	
	switch (adc.chIndex)
	{
	case 0: 
		adc.chAisle = ADCH_BAT_V;
		TRISA2 = 1;
		ANSEL |=0X04;
		break;//---ADCH_BAT_V
	case 1:
		TRISA4 = 1;
		ANSEL |=0X08;
		adc.chAisle = ADCH_MID_V2;
		break;//---ADCH_MID_V2
	case 2: 
		TRISA5 = 1;
		ANSEL |=0X20;
		adc.chAisle = ADCH_BAT_I;
		break;//---ADCH_BAT_I
	case 3: 
		TRISB1 = 1;
		ANSELH |=0X01;
		adc.chAisle = ADCH_CHR_I;
		break;//---ADCH_CHR_I
	default:break;
	}
	
	for (i = 0; i < 10; i++){
		if (i < 2){
			adc.adcBufferTemp = 0;
			ADC_Sample(adc.chAisle);
		}else{
			ADC_Sample(adc.chAisle);
		}
	}
	if (++adc.index >= 16){
		adc.index = 0;
		switch (adc.chIndex)
		{
		case 0: 
            adc.aVolTemp = ((u32)adc.adcBufferTemp*3532)/10000-3;
			adc.batTotal = ((u32)adc.adcBufferTemp*3532)/10000-3;
			adc.aVolBank = adc.aVolTemp;
            //  adc.aVol = adc.temp1/5-77;

            if (adc.volCnt>10 || adc.volCnt<1){
                adc.volCnt = 5;
            }
            if (adc.aVolTemp > adc.aVolBank){
                adc.volCnt++;
            }else if(adc.aVolTemp < adc.aVolBank){
                adc.volCnt--;
            }
		//	adc.batV1 = adc.adcBuffer-3;
			break;//---ADCH_BAT_V
		case 1: 
			adc.batV2 = ((u32)adc.adcBufferTemp*3532)/10000-3;
			break;//---ADCH_MID_V2
		case 2: 
			adc.batILoad= adc.adcBufferTemp;
			break;//---ADCH_BAT_I
		case 3: 
//			adc.adcBuffer = (adc.adcBufferTemp*197)+900;
//			adc.batChar = adc.adcBuffer/100-9;
			adc.adcBuffer = (adc.adcBufferTemp*277)+1000;
			adc.batCharBank = adc.adcBuffer/100-5;
			adc.batChar = adc.batCharBank/2;
////			adc.batChar = adc.adcBufferTemp;
			break;//---ADCH_CHR_I
		default:break;
		}	
		adc.chIndex++;	
	}
	adc.batV1 = adc.batTotal-adc.batV2;
	ANSEL = 0x00;
	ANSELH = 0x00;

	
}
//
