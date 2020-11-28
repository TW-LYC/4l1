#include "function.h"
//R=0.005
//A=R
//V=47/(47+100)=0.3197
//REFV=2.0V

#define VOL10_AD(vol)			((vol)*47ul*512/147/100)
#define CUR10_AD(a)				((a)*256ul/100/10)

//#################################################################################
#define AD_VOL_2_5V				VOL10_AD(275)
#define AD_VOL_3_0V				VOL10_AD(320)
#define AD_CUR_4A				CUR10_AD(60)
#define AD_CUR_25A				CUR10_AD(250)
//#################################################################################

__V bit bTime10ms = 0;
__V u8 gTimeCntFor10ms ;
__V u8  bakPORTA;

__V bit gIsCupOk = 0;
__V bit gbCupEvent = 0;
__V bit gbLedWait = 0; 
__V bit gbOcp = 0; 
__V bit gbUcp = 0;

bit gbKeyClick = 0;
bit gbKeyDouClick = 0;

//Fun_t gFun;
WorkMode		gFun_workMode;
u8						gFun_workTimeCntFor1s;
u16 					gFun_workTimeCnt;
u8  					gFun_adcIndex;
u8  					gFun_adcChIndex;
u16 					gFun_adcBuffer;
u16 					gFun_adcBufferSum;
u16					gFun_adCurrent;
u16					gFun_adBatVol;
u8  					gFun_batVolState;
u8  					gFun_motoCurrState;
u8  					gFun_adcDealDelay;
u8  					gFun_ocpTimeCnt;
u8  					gFun_ucpTimeCnt;

u8  					gFun_keyTimeCnt;
u8  					gFun_keyIdleCnt;

ChrState			gFun_chrState;
u8					gFun_cupchrCodeBuff;
u8					gFun_cupchrCode;
u8					gFun_cupchrState;
u8					gFun_cupchrTimeCnt;

u8					gFun_ledCnt_1hz;
u8					gFun_ledCnt_2hz;
LedMode			gFun_ledMode;
u16					gFun_ledTimeCnt;
u16					gFun_ledStopCnt;

void LED_SetMode(LedMode mode);
void FUN_EnterWorkMode(void);

/*********************************************************************************
*********************************************************************************/
void DelayUs(u8 time)
{
	while(time--)
	{
		NOP();
	}
}  

/*********************************************************************************
*********************************************************************************/
void CUP_CHR_Driver(void)
{
	u8 cupchrStateCode = 0;
    //if (BAT_IS_CHR()) cupchrStateCode|=(1<<0); //ʹ��PA6 PA7
	//if (BAT_IS_STD()) cupchrStateCode|=(1<<1);
	if (BAT_IS_CHR_D()) cupchrStateCode|=(1<<0); //ʹ��PA0 PA1 �����
	if (BAT_IS_STD_D()) cupchrStateCode|=(1<<1);
	
	if (cupchrStateCode == 0x03) { //���״̬��ͬʱΪ����ΪͬʱΪ��
		cupchrStateCode = 0;
	}
	
	if (CUP_IS_EXIST()) cupchrStateCode|=(1<<2);

    if (cupchrStateCode != gFun_cupchrCodeBuff) {
		gFun_cupchrTimeCnt = 0;
           gFun_cupchrCodeBuff = cupchrStateCode;
	} else {
		if (gFun_cupchrTimeCnt < 10) {
				gFun_cupchrTimeCnt++;
		} else {
			if (gFun_cupchrCodeBuff &(1<<2)) {
				if (gIsCupOk==0) {	
                    DelayUs(10000);
                    if (gIsCupOk==0) {	
					gIsCupOk = 1;
                    gbCupEvent = 1;
                    }
                }
			} else {
                if (gIsCupOk) {	
					gIsCupOk = 0;
                    gbCupEvent = 1;
                }
			}				
			gFun_chrState = gFun_cupchrCodeBuff &0x03;
			
		}
	}

}
 //
 
/*********************************************************************************
*********************************************************************************/
u16 GetAd (u8 ch)
{ 	
	u8  i;
	u8  ADCON0Buff; 
	u16  tBuffer = 0;
	u16  ADC_DATA=0;
	 
	ADCON0Buff = ADCON0 & 0B10100011; 	//���ͨ��ֵ
	ch <<=2;              
	ADCON0Buff |=  ch;   			//(BIT4-BIT2)CHS=100,ѡ��AN4ͨ��      
	ADCON0 = ADCON0Buff; 				//���¼���ͨ��ֵ
    DelayUs(20); 
	
	GO_DONE = 1;             			//����ADC 
	while( GO_DONE==1 );    			//�ȴ�ADCת�����
	
	GO_DONE = 1;             			//����ADC 
	while( GO_DONE==1 );    			//�ȴ�ADCת�����
	
	ADC_DATA =  ADRESH;
	ADC_DATA <<=8;
	ADC_DATA |= ADRESL;      			//10Bit ADCֵ����
	tBuffer =  ADC_DATA;
	return  tBuffer;
}
//

/*********************************************************************************
*********************************************************************************/
void MCU_EnterSleep(void)
{
    MCU_SleepConfig(1);
	SLEEP(); //˯��ָ��
	DelayUs(1000);
	MCU_SleepConfig(0);	
	gFun_keyIdleCnt = 255;
}
//

/*********************************************************************************
*********************************************************************************/
void MCU_SleepConfig(u8 isSleep)
{
	/*								����	����
	PIN_CHR_S1_D	RA0		����	����	����		
	PIN_CHR_S2_D	RA1		����	����	����
	PIN_HALL		RA2		����	����	����
	PIN_KEY			RA3		����	����	����
	PIN_MOTO		RA4		
	PIN_CHR_S2		RA6		����	����	����
	PIN_CHR_S1		RA7		����	����	����
	PIN_CURR		RC0		
	PIN_VOL			RC1		
	PIN_LED_B		RC2
	PIN_LED_R		RC3
	*/
	if (isSleep){
		ADON  = 0;             //����ADC
		IOCA  = 0B11001111;    //ʹ��PA2��ƽ�仯�ж�
		//        76543210
		PORTA = 0B11001111;		
		TRISA = 0B11001111;    //RA������� 0-��� 1-����
		WPUA  = 0B11001000;    //RA�˿��������� 1-������ 0-������										
		//        76543210
		PORTC = 0B00010011;    //PC4=1 //��ֹ��ص�ѹ���
		TRISC = 0B00000011;    //RC������� 0-��� 1-����  
		WPUC  = 0B00000000;    //RC�˿��������� 1-������ 0-������	
		
		DelayUs(1000);
		PAIE  = 1;             //ʹ��PA INT�ж�
		PAIF  = 0;   	       //��PA INT�жϱ�־λ
	} else {
		ADON  = 1;             //ʹ��ADC
		PAIE  = 0;             //ʧ��PA INT�ж�
		PAIF  = 0;   	       //��PA INT�жϱ�־λ
		IOCA  = 0B00000000;    //ʹ��PA2��ƽ�仯�ж�
		//        76543210
		PORTA = 0B11001111;		
		TRISA = 0B11001111;    //RA������� 0-��� 1-����
		WPUA  = 0B11001000;    //RA�˿��������� 1-������ 0-������										
		//        76543210
		PORTC = 0B00000011;    //PC4=0 //������ص�ѹ���
		TRISC = 0B00000011;    //RC������� 0-��� 1-����   
		WPUC  = 0B00000000;    //RC�˿��������� 1-������ 0-������	
	}
}
//

bit bkeyCode = 0;
bit bkeyBuff = 0;
bit bkeyTemp = 0;
bit bkeyUp = 0;
bit bkeyDou = 0;
/*********************************************************************************
*********************************************************************************/
void KEY_Driver(void) //��˫��
{
	if ( KEY_IS_GET() ) bkeyTemp = 1;
	else bkeyTemp = 0;
	
	if (gbLedWait) {
		gFun_keyTimeCnt = 0;	//LED����ʾ���������ܰ���
		return;
	}
	
	if (bkeyTemp != bkeyBuff) {
		gFun_keyTimeCnt = 0;	
        bkeyBuff = bkeyTemp;
	} else {
		if (gFun_keyTimeCnt < 5) {
			gFun_keyTimeCnt++;
		} else {
			if (bkeyBuff != bkeyCode) { //�б䶯
				bkeyCode = bkeyBuff;
                bkeyUp = 0;
                if (bkeyBuff) {
					//----����
                    if (gFun_keyIdleCnt <20) {
						gbKeyDouClick = 1;	
                        bkeyDou = 1;
					}  else {
						bkeyDou = 0;
					}
				} else {
                    //----�ͷ�
                    if (bkeyDou==0)
						bkeyUp = 1; 
                    gFun_keyIdleCnt = 0;
				}
			}
		}
	}
    if (bkeyCode==0) {
		if (gFun_keyIdleCnt < 255) {
			gFun_keyIdleCnt++;
		}
        if (bkeyUp) {
            if (gFun_keyIdleCnt > 25) {
				bkeyUp = 0;
				gbKeyClick = 1;	
			}
        }
    } 
    
}
//

/*********************************************************************************
*********************************************************************************/
void ADC_Driver(void)
{
    if (gFun_adcChIndex == 0) {
		gFun_adcBuffer = GetAd(4); 	//ͨ��2ADֵ //��������
	} else {
		gFun_adcBuffer = GetAd(5); 	//ͨ��2ADֵ //��ص�ѹ
	} 
    gFun_adcBufferSum += gFun_adcBuffer;
	if (++gFun_adcIndex >= 64) {
        gFun_adcIndex = 0;
        gFun_adcBuffer = gFun_adcBufferSum>>6;
		if (gFun_adcChIndex == 0) {
			gFun_adcChIndex = 1;
			gFun_adCurrent = gFun_adcBuffer;
		} else {
            gFun_adcChIndex = 0;
            gFun_adBatVol = gFun_adcBuffer;
		}
		gFun_adcBufferSum = 0;
	}
}


/*********************************************************************************
*********************************************************************************/
void ADC_Deal(void)
{
	//#define AD_VOL_2_5V	403
	//#define AD_VOL_3_0V	490
	//#define AD_CUR_4A		10
	//#define AD_CUR_25A	65
     if (gFun_workMode == WM_Sleep) {
		gFun_ucpTimeCnt = 0;
		gFun_ocpTimeCnt = 0;
     } else {
		if (gFun_adcDealDelay < 10) {
			gFun_adcDealDelay++;
			return;
		} else {
			gFun_adcDealDelay = 0;
		}
		 //-----100ms����һ��  

		if (gFun_adBatVol < AD_VOL_2_5V) {
			gFun_batVolState = 0; //<2.5v
		} else if (gFun_adBatVol < AD_VOL_3_0V) {
			gFun_batVolState = 1;//2.5v~3.0v		
		} else {
			gFun_batVolState = 2;//>3.0v			
		}
		//4A == 11
		//25A == 65
 //       gFun_adCurrent = CUR10_AD(80);//----------------------------------debug ��������
//        gFun_adCurrent = CUR10_AD(400);//----------------------------------debug ����

		if (gFun_workMode == WM_Work) {
			if (gFun_adCurrent < AD_CUR_4A) {
				gFun_motoCurrState = 0;//<4A
				if (gFun_ocpTimeCnt) 
					gFun_ocpTimeCnt--;
				if (gFun_ucpTimeCnt < 255) 
					gFun_ucpTimeCnt++;
			} else if (gFun_adCurrent < AD_CUR_25A) {
				gFun_motoCurrState = 1;//4A~25A	
				if (gFun_ocpTimeCnt) 
					gFun_ocpTimeCnt--;
				if (gFun_ucpTimeCnt) 
					gFun_ucpTimeCnt--;
			} else {
				gFun_motoCurrState = 2;//>25A	
				if (gFun_ocpTimeCnt < 255) 
					gFun_ocpTimeCnt++;
			   if (gFun_ucpTimeCnt) 
					gFun_ucpTimeCnt--;
			}
			if (gFun_ocpTimeCnt >= 2) {
				gbOcp = 1; 
			}
			if (gFun_ucpTimeCnt >= 50) {
				gbUcp = 1;
			}
		} else {
			gFun_ucpTimeCnt = 0;
			gFun_ocpTimeCnt = 0;
		}
		/*
		switch(gFun_batVolState)
		{
		case 0:  break;//<2.5v
		case 1:  break;//2.5v~3.0v
		case 2:  
		default: break;//>3.0v	   
		}
		
		switch(gFun_motoCurrState)
		{
		
		case 0:break;//<4A	
		case 1:break;//4A~25A
		case 2:  
		default:break;//>2.5A   
		}*/
	}
		

}
//

/*********************************************************************************
*********************************************************************************/
void FUN_Init(void)
{
	//memset((u8*)&gFun,0,sizeof(Fun_t));
	gFun_keyIdleCnt = 255;
}
//


bit gbLed1hz = 0;
bit gbLed2hz = 0;
bit gbLedEnd = 0;
/*********************************************************************************
*********************************************************************************/
void LED_SetMode(LedMode mode)
{
    if (gFun_ledMode != mode && gFun_ledStopCnt==0) {
		gFun_ledMode = mode;
		gFun_ledCnt_1hz = 0;
		gFun_ledCnt_2hz = 0;
		gbLed1hz = 1;
		gbLed2hz = 1;
        gFun_ledTimeCnt = 0;
        gbLedWait = 0;
        if (mode==LM_Red_1HZ_3T || mode==LM_Blue_1HZ_3T) {
			gFun_ledStopCnt = 300;
		} else if (mode==LM_Red_1HZ_10T) {
            gFun_ledStopCnt = 1000;
			gbLedWait = 1; //������Ҫ�ȴ�������
        } else if (mode==LM_Red_2HZ_10T) {
            gFun_ledStopCnt = 500;
			gbLedWait = 1; //������Ҫ�ȴ�������
        } else if (mode==LM_RedBlue_1HZ_1T) {
            gFun_ledStopCnt = 100;
			gbLedWait = 1; //������Ҫ�ȴ�������
		} else {
			gFun_ledStopCnt = 0;		
		}
	}
    
}
//

/*********************************************************************************
*********************************************************************************/
void LED_Display(void)
{
    if (++gFun_ledCnt_1hz >=50) { //500ms
		gFun_ledCnt_1hz = 0;
        gbLed1hz = ~gbLed1hz;
	} 
    if (++gFun_ledCnt_2hz >=25) { //250ms
		gFun_ledCnt_2hz = 0;
        gbLed2hz = ~gbLed2hz;
	} 
    if (gFun_ledStopCnt !=0) {
		if (gFun_ledTimeCnt <65535) 
			gFun_ledTimeCnt++;
		if (gFun_ledTimeCnt >= gFun_ledStopCnt) {
			gFun_ledMode = 0;
            gFun_ledTimeCnt = 0;
            gFun_ledStopCnt = 0;
            gbLedEnd = 1;
			gbLedWait = 0;
		} 
	}
	if(gFun_ledMode!=LM_Off){//�����̖�\���Єt
		gFun_workTimeCnt = 0;	 //����˯�ߕr�g
	}
    switch(gFun_ledMode) {
    case LM_Off:							//������
        LEDR_OFF();	
        LEDB_OFF();	
		break;
    case LM_Red_On:					//��Ƴ���
		LEDR_ON();
        LEDB_OFF();
		break;
    case LM_Blue_On:					//���Ƴ��� 
		LEDR_OFF();
		LEDB_ON();
		break;
    case LM_Red_1HZ_3T:				//�����˸3�� 1Hz 
		if (gbLed1hz){
			LEDR_ON();
		} else {
			LEDR_OFF();
		}
        LEDB_OFF();
		break;
    case LM_Blue_1HZ_3T:            //������˸3�� 1Hz
		LEDR_OFF();
		if (gbLed1hz){
			LEDB_ON();
		} else {
			LEDB_OFF();
		}
		break;
    case LM_Red_1HZ_10T:           //�����˸10�� 1Hz
		if (gbLed1hz){
			LEDR_ON();
		} else {
			LEDR_OFF();
		}
        LEDB_OFF();
		break;
	case LM_Red_2HZ_10T:           //�����˸10�� 2Hz
		if (gbLed2hz){
			LEDR_ON();
		} else {
			LEDR_OFF();
		}
        LEDB_OFF();
		break;
	case LM_RedBlue_1HZ_1T:       //����������˸1�� 1Hz     
		if (gbLed1hz){
			LEDR_ON();
            LEDB_OFF();
		} else {
			LEDR_OFF();
            LEDB_ON();
		}
		break;
    default:break; 
	}
    

}
//

/*********************************************************************************
*********************************************************************************/
void FUN_EnterStandby(void)
{
	gFun_workMode = WM_Standby;
	gFun_workTimeCnt = 0;
	gbOcp = 0; 
	gbUcp = 0; 
}
//

/*********************************************************************************
*********************************************************************************/
void FUN_EnterWorkMode(void)
{
    gFun_workMode = WM_Work;
    gFun_workTimeCnt = 0;
	gFun_workTimeCntFor1s = 0;
}
//

/*********************************************************************************
*********************************************************************************/
void FUN_Driver(void)
{
	if (gFun_workMode == WM_Error) {
        if (gbLedEnd) {		
			FUN_EnterStandby();
		} else {
			LED_SetMode(LM_RedBlue_1HZ_1T);
		}
	} else  if (gFun_workMode == WM_Standby) {	
        LED_SetMode(LM_Off);
        if (gbKeyDouClick) {
			if (gIsCupOk) {
				if (gFun_adBatVol > AD_VOL_3_0V) {
					FUN_EnterWorkMode();
				} else {
					LED_SetMode(LM_Red_1HZ_10T);
				}
			} else {
				LED_SetMode(LM_Red_1HZ_3T);
			}
		}
		if (gbCupEvent && gIsCupOk) {
			LED_SetMode(LM_Blue_1HZ_3T);
		}
        if(gbCupEvent && !gIsCupOk){
           LED_SetMode(LM_Red_1HZ_3T); 
				} 
		if (gFun_chrState == 0 && gbLedWait==0&&gFun_ledMode==1) {
			if (++gFun_workTimeCnt > 100*15) {
				gFun_workTimeCnt = 0;
				MCU_EnterSleep();//----------------------��������
			}
		} else {
			gFun_workTimeCnt = 0;
		}
	} else  if (gFun_workMode == WM_Work) {
        LED_SetMode(LM_Blue_On);
		if (gbKeyClick) {
            FUN_EnterStandby();
		}
		if (gIsCupOk==0) {
			LED_SetMode(LM_Red_1HZ_3T);
			FUN_EnterStandby();
		}
	} else  if (gFun_workMode == WM_Sleep) {	
        LED_SetMode(LM_Off);
	} else  if (gFun_workMode == WM_Charge) {
        if (gFun_chrState == CS_Charge){
			LED_SetMode(LM_Red_On);
		} else  if (gFun_chrState == CS_End){
			LED_SetMode(LM_Blue_On);
		} else {
			FUN_EnterStandby();//�˳����ģʽ
		}
	}
	if (gFun_workMode != WM_Charge) {
		if (gFun_chrState > 0) {
			gFun_workMode = WM_Charge;	
		} 
	}

	if (gFun_workMode == WM_Work) {
		MOTO_ON();
		if (++gFun_workTimeCntFor1s >=100) {
			gFun_workTimeCntFor1s = 0;
			if (gFun_workTimeCnt<65535)
				gFun_workTimeCnt++;
			if (gFun_workTimeCnt >= 40){
				FUN_EnterStandby();//������ʱ
			}
		}
		if (gbOcp || gbUcp || gFun_batVolState == 0) {
			if (gbOcp) {
				LED_SetMode(LM_Red_2HZ_10T);
			} else { 
				if (gFun_batVolState == 0){
					LED_SetMode(LM_Red_1HZ_10T);
				}
            }
			FUN_EnterStandby();
		}
		
	} else {
		MOTO_OFF();
	}
    //-----------
    gbLedEnd = 0;
	gbCupEvent = 0;
	gbKeyClick = 0;
    gbKeyDouClick = 0;
}
//