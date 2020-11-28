
/* Copyright (c) all rights reserved
*******************************************************************************
* @file    function.c
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

#include "function.h"
#include "function_work.h"
#include "mcu_config.h"
#include "global.h"
#include "var_define.h"
#include "struct.h"
//R=0.005 //MOTO-I
//A=R
//V=100/(499+100)=0.1669 //BAT-V
//REFV=2.0V

#define VOL10_AD(vol)			((vol)*100ul*2048/599/10)
#define CUR10_AD(a)				((a)*256ul/100/10)
#define CHRI_AD(ma)				((ma)*128ul/625)	//0.05R->0.1R

//#################################################################################
#define AD_VOL_2_5V				VOL10_AD(25)
#define AD_VOL_3_0V				VOL10_AD(30)
#define AD_CUR_2_8A				CUR10_AD(28)
#define AD_CUR_4A				CUR10_AD(40)
#define AD_CUR_25A				CUR10_AD(250)
//#################################################################################
u16                   adStart5sCnt = 0;
u16					  firstSleepTimeCnt = 0;
bit					  firstSleepIndex = 0;
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void DelayUs(u8 time)
{
	while(time--)
	{
		NOP();
	}
}  
//
u8  keyTemp = 0;
bit keyDouble = 0;
u8  KeyTime = 0;
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void KEY_Driver(void) //单双击
{
	//---KEY-SW1處理
	if (key.sw1Temp > 250){
		key.sw1Temp = 250;
	}
	
	
	if (KEYSW1_IS_GET() && KEYSW2_NOT_GET() && timer.ledStopCnt==0){
		key.sw1Temp++;
		if (key.sw1Temp == 2){
			key.sw1Index = 1;
			sleep10sTimeCnt = 0;
		}
	}else{
		key.sw1Temp = 0;
		key.sw1Index = 0;
	}
	
	
	//---KEY-SW2處理
	if (key.sw2Temp > 250){
		key.sw2Temp = 250;
	}
	if (KEYSW2_IS_GET() && KEYSW1_NOT_GET() && timer.ledStopCnt==0){
		key.sw2Temp++;
		sleep10sTimeCnt = 0;
		if (key.sw2Temp == 2){
			key.sw2Index = 1;
			if (workMode != WM_Standby){ //---未接通SW1進入待機便按下SW2欲啟動
				ledMode = LM_Red_1HZ_3T;
			}
		}
	}else{
		key.sw2Index = 0;
	}
	if (KEYSW2_NOT_GET()){
		key.sw2Temp = 0;
	}
	
}
//
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void KEY_WorkDriver(void) 
{
	if (key.sw1Index == 1){ //---按下時開始計時
		timer.sw1Cnt++;

	}else{
		timer.sw1Cnt = 0;
		
	}
	if (timer.sw1Cnt>300 && workMode==WM_Poweroff){  //---藍燈點亮
		timer.stanbyCnt = 0;
		work.inWorkIndex = 1;
		ledMode = LM_white_On;
		workMode = WM_Standby;
	}	

	
}
bit usbIndex;
bit cupIndex;
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void CUP_USB_Driver(void)
{	
	//---USB標誌位處理
	if (IS_USB_IN() && 1==usbIndex){
		charDisplayCnt = 100;
		usbIndex = 0;
		workMode = WM_Charge; //---切換到充電模式
		timer.ledStopTime = 0;
		ledMode = LM_Red_On;
		charPeriod = 0;  //從充電模式0開始
	}else if (IS_USB_NOT() && 0==usbIndex){
		usbIndex = 1;
		workMode = WM_Standby;
	}else{

	}
	/**/

}
//

bit gbLed1hz = 0;
bit gbLed2hz = 0;
bit gbLedEnd = 0;

//bit gbCupCnt;
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void LED_Display(void)
{
	/**/
	if (led.tempBank != ledMode){
		gbLed1hz = 0;
		gbLed2hz = 0;
		timer.ledStopCnt = 0;
		
	}
	led.tempBank = ledMode;
//-----------------------------------------------------------------------------
	if (ledMode == LM_Off){
		timer.ledStopTime = 0;
	}else if (ledMode == LM_Redwhite_1HZ_1T){
		timer.ledStopTime = 100;
	}else if(ledMode==LM_white_1Hz_3T || ledMode==LM_Red_1HZ_3T){
		timer.ledStopTime = 300;
	}else if(ledMode == LM_white_1Hz_3T){
		timer.ledStopTime = 300;
	}else if(ledMode == LM_Red_2HZ_10T){
		timer.ledStopTime = 500;
	}else if(ledMode == LM_Red_1HZ_10T){
		timer.ledStopTime = 1000;
	}

//-----------------------------------------------------------------------------
	if (timer.ledStopTime != timer.ledStopCnt){
		if (timer.ledStopTime > timer.ledStopCnt){
			timer.ledStopCnt++;
		}
	}else{
		if (timer.ledStopTime!=0 && timer.ledStopCnt!=0){
			timer.ledStopTime == 0;
			timer.ledStopCnt == 0;
			ledMode = LM_Off; 
		}
		
	}

//-----------------------------------------------------------------------------
	if (++led.flicker1hzCnt > 50){
		led.flicker1hzCnt = 0;
		gbLed1hz =~ gbLed1hz;
	}

	if (++led.flicker2hzCnt > 25){
		led.flicker2hzCnt = 0;
		gbLed2hz =~ gbLed2hz;
	}
//-----------------------------------------------------------------------------

    switch(ledMode) {
    case LM_Off:							//不亮灯
	//	gbCupCnt=0;
        LEDR_OFF();	
        LEDB_OFF();	
		break;
    case LM_Red_On:					//红灯常亮
		LEDR_ON();
        LEDB_OFF();
		break;
    case LM_white_On:					//蓝灯常亮 
		LEDR_OFF();
		LEDB_ON();
		break;
    case LM_white_1Hz:					//蘭登閃爍
		LEDR_OFF();
		if (gbLed1hz) {                 //
			LEDB_ON();
		} else {
			LEDB_OFF();
		}
		break;
	case LM_white_2Hz:           		//蓝灯闪烁 
		LEDR_OFF();
		if (gbLed2hz) {                 //---太快改為1HZ
			LEDB_ON();
		} else {
			LEDB_OFF();
		}
		break;
	case LM_white_1Hz_3T:           		//蓝灯闪烁 
		LEDR_OFF();
		if (gbLed1hz) {                 //---太快改為1HZ
			LEDB_ON();
		} else {
			LEDB_OFF();
		}
		break;
    case LM_Red_1HZ_3T:				//红灯闪烁3次 1Hz 
		if (gbLed1hz){
			LEDR_ON();
		} else {
			LEDR_OFF();
		}
        LEDB_OFF();
		break;
    case LM_white_1HZ_5T:            //蓝灯闪烁3次 1Hz
		LEDR_OFF();
		if (gbLed2hz){
			LEDB_ON();
		} else {
			LEDB_OFF();
		}
		break;
    case LM_Red_1HZ_10T:           //红灯闪烁10次 1Hz
		if (gbLed1hz){
			LEDR_ON();
		} else {
			LEDR_OFF();
		}
        LEDB_OFF();
		break;
	case LM_Red_2HZ_10T:           //红灯闪烁10次 2Hz
		if (gbLed2hz){
			LEDR_ON();
		} else {
			LEDR_OFF();
//			LEDR_ON();
		}
        LEDB_OFF();
		break;
	case LM_Redwhite_1HZ_1T:       //红蓝交替闪烁1次 1Hz     
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



/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void ADC_Deal(void)
{
     if (workMode == WM_Sleep) {
		gFun_ucpTimeCnt = 0;
		gFun_ocpTimeCnt = 0;
     } else {
		if (gFun_adcDealDelay < 10) {
			gFun_adcDealDelay++;
			return;
		} else {
			gFun_adcDealDelay = 0;
		}
		//-----100ms进入一次  

		if (gFun_batVol<550 || gFun_batMidVol2<250 || gFun_batMidVol3<250 || (gFun_batVol-gFun_batMidVol)<250) {      //550
			gFun_batVolState = 0;
		} else if (gFun_batVol<600 || gFun_batMidVol2<300 || gFun_batMidVol3<300 || (gFun_batVol-gFun_batMidVol2-gFun_batMidVol3)<300) { //600
			gFun_batVolState = 1;
		} else if (gFun_batVol < 700) { //700
			gFun_batVolState = 2;	
		} else {
			gFun_batVolState = 3;		
		}
		//4A == 11
		//25A == 65
//		gFun_adBatCur = CUR10_AD(80);//----------------------------------debug 正常电流
//      gFun_adBatCur = CUR10_AD(400);//----------------------------------debug 过流

		if (workMode == WM_Work) {
/*			if (gFun_batCur < 28 && adStart5sCnt<=700) { //2.8A  3.5
				gFun_motoCurrState = 0;
				if (gFun_ocpTimeCnt) 
					gFun_ocpTimeCnt--;
				if (gFun_ucpTimeCnt < 255) 
					gFun_ucpTimeCnt++;
			} else*/ if (gFun_batCur < 255) { //23.5A  
				gFun_motoCurrState = 1;	
				if (gFun_ocpTimeCnt) 
					gFun_ocpTimeCnt--;
				if (gFun_ucpTimeCnt) 
					gFun_ucpTimeCnt--;
			} else {
				gFun_motoCurrState = 2;	
				if (gFun_ocpTimeCnt < 255) 
					gFun_ocpTimeCnt++;
			   if (gFun_ucpTimeCnt) 
					gFun_ucpTimeCnt--;
			}
			if (gFun_ocpTimeCnt >= 1) {
				gbOcp = 1; 
			}
			if (gFun_ucpTimeCnt >= 50) {
				gbUcp = 1;
			}
		} else {
			gFun_ucpTimeCnt = 0;
			gFun_ocpTimeCnt = 0;
		}
		
	}	
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void BAT_Init(void)
{
	
}
//
#define CHR_PWM_DUTY_MAX	130
#define CHR_PWM_DUTY_START	0

bit isErrorNeg;
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void PwmDutyDriver(void)
{
	u16 currError = 0;
	u8 tOut;
	isErrorNeg = 0;
	if (gBat_chrPwmDuty > CHR_PWM_DUTY_MAX){
		gBat_chrPwmDuty = CHR_PWM_DUTY_MAX;
	}
	if (gFun_chrUsbCur > 1500) {
		gBat_chrPwmDuty = 0;
	}
	if (gBat_chrPwmAimCur <= 50) {
		gBat_chrPwmDuty = 0;
	} else {
		if (gBat_chrPwmAimCur < gFun_chrUsbCur) {
			isErrorNeg = 1;
			currError = gFun_chrUsbCur - gBat_chrPwmAimCur;
		} else {
			isErrorNeg = 0;
			currError = gBat_chrPwmAimCur - gFun_chrUsbCur; 
		}
		if (currError < 80){
			NOP();
			tOut = 0;
			gBat_chrPwmDelay = 200;
		} else {
			if (currError > 900){//900
				tOut = 3; 
				gBat_chrPwmDelay = 30; // 1/10
			} else if (currError > 800){
				tOut = 2;
				gBat_chrPwmDelay = 40; // 1/20
			} else if (currError > 650){
				tOut = 1;
				gBat_chrPwmDelay = 40; // 1/40
			} else if (currError > 500){
				tOut = 1;
				gBat_chrPwmDelay = 80; // 1/80
			} else if (currError > 350){
				tOut = 1;
				gBat_chrPwmDelay = 130; // 1/130
			} else { //50-350
				tOut = 1;
				gBat_chrPwmDelay = 200; // 1/200
			}
		}
		
		if (isErrorNeg && gBat_chrPwmDuty < tOut) {
			gBat_chrPwmDuty = 0;
		} else {
			if (isErrorNeg) {
				gBat_chrPwmDuty -= tOut;
			} else {
				gBat_chrPwmDuty += tOut;
			}
			if (gBat_chrPwmDuty > CHR_PWM_DUTY_MAX) {
				gBat_chrPwmDuty = CHR_PWM_DUTY_MAX;
			}
		}
	}
}
//


/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void BAT_Driver(void)
{
	/*__V bit gbUsbPlugIn = 0;
	__V bit gbUsbPlugInEvent = 0;
	__V bit gbBatCharge = 0;*/
	if (gbUsbPlugIn==0) {
		gBat_chrState = CS_ChrNull;
		gBat_chrPwmDuty = 0;
		gbitChrPwmDuty = 0;
		gBat_chrCvDelayCnt = 0;
		gBat_chrPwmDelay = 200;
		MCU_PWM2_SetDuty(0);
	} else {
		NOP();
		switch(gBat_chrState)
		{
		case CS_ChrNull 		: //= 0,
			if (gFun_batVol > 845) {  //偏差，多加5
				gBat_chrState = CS_ChrEnd;
				gBat_chrPwmAimCur = 0;
			} else {
				gBat_chrPwmDuty = CHR_PWM_DUTY_START;
				gBat_chrState = CS_ChrPre;
			}
			break;
		case CS_ChrPre			: //= 1,
			gBat_chrPwmAimCur = 500; //500mA电流充电//电压低之后ADC测不准
			if (gFun_batVol > 560){
				gBat_chrCvDelayCnt = 0;
				gBat_chrState = CS_ChrCC;
			}
			break;
		case CS_ChrCC			: //= 2,
			gBat_chrPwmAimCur = 1050; //1000mA电流充电
			if (gFun_batVol>840 || gFun_batMidVol>420 || (gFun_batVol-gFun_batMidVol)>420){   //830
				gBat_chrPwmAimCur = 1000;
				gBat_chrState = CS_ChrCV;
			}
			break;
		case CS_ChrCV			: //= 3,
			if (++gBat_chrCvDelayCnt >= 50){
				gBat_chrCvDelayCnt = 0;
				if (gFun_batVol>840 || gFun_batMidVol>420 || (gFun_batVol-gFun_batMidVol)>420) {   // 830
					if (gBat_chrPwmAimCur > 200) {
						gBat_chrPwmAimCur -= 100;
					} else {
						gBat_chrState = CS_ChrEnd; //充满时，电流小于100mA //gFun_chrUsbCur
					}
				}
			}
				
			break;
		case CS_ChrEnd			: //= 4,
			if (gFun_batVol < 820 && gFun_batMidVol<400 && (gFun_batVol-gFun_batMidVol)<400) {   //810
				gBat_chrCvDelayCnt = 0;
				gBat_chrState = CS_ChrCV; //电压下降后，重新进入充电
			}
			break;
		case CS_ChrError		: //= 5,
			break;
		}
	}
	if (gBat_chrState >= CS_ChrPre && gBat_chrState <= CS_ChrCV) {
		gIsCharging = 1;
		if (gFun_batMidVol > 425 || gFun_batVol > 425 + gFun_batMidVol) {
			gBat_chrState = CS_ChrEnd;
		}
	} else {
		gIsCharging = 0;
	}
	if (gbitChrPwmDuty) {
		gbitChrPwmDuty = 0;
		PwmDutyDriver();
	}
	//gBat_chrPwmDuty = 40; //debug----------------------------固定一个占空比
	if (gIsCharging){
		if (++gBat_chrPwmDelayCnt >= gBat_chrPwmDelay) { //充电PWM调整间隔
			gBat_chrPwmDelayCnt = 0;
			gbitChrPwmDuty = 1;
		}
		MCU_PWM2_SetDuty(gBat_chrPwmDuty);
	} else {
		gBat_chrPwmDelayCnt = 0;
		MCU_PWM2_SetDuty(0);
	}
	/*
	双节电压：
	[0.0V-2.0V]充电电流为Icc/20
	[2.0V-5.6V]充电电流为Icc/10
	[5.6V-8.4V]CC 
	[8.4V-8.6V]CV 100MA结束充电
	[8.4->8.2V]重新充电
	
	gBat_chrPwmDuty;
	gBat_chrPwmDelayCnt; 
	gBat_chrPwmAimCur;
	CHR_PWM_DUTY_MAX
	*/
	//CHRI_AD(ma)
	if (gFun_adBatCur || gFun_chrBatCur || gFun_batVol || gFun_chrUsbCur || gFun_adMidVol2 || gFun_adMidVol3 || gFun_batMidVol) {
		NOP();
	} 
		
	
	
	
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void MCU_EnterSleep(void)
{
	INTCON = 0;				//关闭所有中断
	OPTION_REG = 0;
	ADCON0 = 0;
	ADCON1 = 0; 			//这个一定要关掉
	PWMCON0 = 0;
	WDTCON = 0;				//关闭WDT
	PWMCON0 = 0x00;
	/*//-------76543210
	IOCA = 0b00000011; 		//A0-CUP A1-KEY 
	//-------76543210 
	IOCB = 0b00010000; 		//B4-USB
	*/
	MCU_GpioSetToSleep();
	/**/
	PEIE = 1;				//打开外设中断
	RAIE = 1;				//打开电平中断
	RBIE = 1;				//打开电平中断
	GIE = 1;
//	MCU_GpioSetToSleep();
	PORTA;					//读PORTA值并锁存
	PORTB;					//读PORTB值并锁存
	RAIF = 0;				//清中断标志
	RBIF = 0;				//清中断标志

	asm("clrwdt");
	asm("sleep");
	asm("nop");
	
	MCU_Config();
//	MCU_GpioInit();
	gFun_keyIdleCnt = 255;
	GIE = 1;
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void FUN_EnterStandby(void)
{
	workMode = WM_Standby;
	gFun_workTimeCnt = 0;
	gbOcp = 0; 
	gbUcp = 0; 
	gbWorkLowVol = 0;
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void FUN_EnterWorkMode(void)
{
    workMode = WM_Work;
    gFun_workTimeCnt = 0;
	gFun_workTimeCntFor1s = 0;
	if (gFun_batVol<650 || gFun_batMidVol<325 || (gFun_batVol-gFun_batMidVol)<325) { //700
//		gbWorkLowVol = 1;
	}
}
//







/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void FUN_Init(void)
{
	BAT_Init();
//	MCU_PWM2_SetDuty(0);
	gFun_keyIdleCnt = 255;
	
	//MCU_EnterSleep();	//debug---------------------------------------------
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void FUN_Driver(void)
{
/*	if (workMode == WM_Error) {
        if (gbLedEnd) {		
			FUN_EnterStandby();
		} else {
			LED_SetMode(LM_Redwhite_1HZ_1T);
		}
	} else */ if (workMode == WM_Standby) {	
        LED_SetMode(LM_Off);
        if (gbKeyDouClick) {
			if (gIsCupOk) {
				if (gFun_batVol > 900 && gFun_batMidVol2>300 && gFun_batMidVol3>300 && (gFun_batVol-gFun_batMidVol2-gFun_batMidVol3)>300) {    //大於6V&3V才進入工作
					FUN_EnterWorkMode();
				} else {
					LED_SetMode(LM_Red_1HZ_10T);
				}
			} else {
				LED_SetMode(LM_Red_1HZ_3T);
			}
		}
		/**/
		if (gbCupEvent && gIsCupOk) {
			gFun_ledStopCnt = 0;
			LED_SetMode(LM_white_1HZ_5T); //杯進入藍閃3次
		} 
		if(gbCupEvent && !gIsCupOk){	//杯移出紅閃3次
			gFun_ledStopCnt = 0;
			LED_SetMode(LM_Red_1HZ_3T);
		}
		
		if (gBat_chrState == 0 && gbLedWait==0) {
			if (++gFun_workTimeCnt > 100*10) {
				gFun_workTimeCnt = 0;
				MCU_EnterSleep();//----------------------进入休眠
			} else if (++firstSleepTimeCnt>100*1 && firstSleepIndex==0){ //----------初次上電三秒後進入休眠
				firstSleepIndex = 1;
				MCU_EnterSleep();//----------------------进入休眠
			}
		} else {
			gFun_workTimeCnt = 0;
		}
	} else  if (workMode == WM_Work) {
		if (gbWorkLowVol) {
			LED_SetMode(LM_white_2Hz);
		} else {
			LED_SetMode(LM_white_On);
		}
		if (gbKeyClick) {
            FUN_EnterStandby();
		}
		if (gIsCupOk==0) {
			LED_SetMode(LM_Red_1HZ_3T);
			FUN_EnterStandby();
		}
	} else  if (workMode == WM_Sleep) {	
        LED_SetMode(LM_Off);
	} else  if (workMode == WM_Charge) {
        if (gIsCharging){
			LED_SetMode(LM_Red_On);
		} else  if (gBat_chrState == CS_ChrEnd){
			LED_SetMode(LM_white_On);
		} else {
			FUN_EnterStandby();//退出充电模式
		}
	}
	if (workMode != WM_Charge) {
		if (gbUsbPlugIn) { //gBat_chrState > 0
			workMode = WM_Charge;	
		} 
	}

	if (workMode == WM_Work) {
		adStart5sCnt++;
		MOTO_ON();
		if (++gFun_workTimeCntFor1s >=100) {
			gFun_workTimeCntFor1s = 0;
			if (gFun_workTimeCnt<65535)
				gFun_workTimeCnt++;
			if (gFun_workTimeCnt >= 40){
				FUN_EnterStandby();//工作超时
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
		adStart5sCnt = 0;
		MOTO_OFF();
	}
    //-----------
    gbLedEnd = 0;
	gbCupEvent = 0;
	gbKeyClick = 0;
    gbKeyDouClick = 0;
}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/

//gbCupCnt = 0;
void Move_Function(void)
{
	/*
		if (!gbCupCnt && IS_CUP_OK()) {	//
			gbCupCnt=1;
			LED_SetMode(LM_white_1HZ_5T); //杯進入藍閃3次
		} 
		if(!gbCupCnt && IS_CUP_NOT()){	//
			gbCupCnt=1;
			LED_SetMode(LM_Red_1HZ_3T);//杯移出紅閃3次
		}
		*/
}
//