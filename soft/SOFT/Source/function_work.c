#include "function_work.h"
#include "function.h"
#include "global.h"
#include "mcu_pwm.h"
#include "struct.h"
//-----------------------------------------------------------------------------
void Standby(void);
void Work(void);
void Sleep(void);
void Charge(void);
//-----------------------------------------------------------------------------
u16 sleep10sTimeCnt;
u16 motorWorkTimeCnt;
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void Soft_ON(void)
{
    /*
    soft.pwmCycle = 200;
    soft.pwmValue++;
    if (soft.pwmValue != soft.pwmCycle){
        if (soft.pwmValue > soft.pwmCycle){
            Motor_ON();
        }else{
            Motor_OFF();
        }
    }
    
    times++;
  	if(times>100){//PWM周期
	times=0;
	}

  if(times<PWMValue){//PWM周期
		led=0;//on status
	}
  else{
	led=1;//off status
	}
        

    */
}
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void Motor_ON(void)
{
    MOTO1_ON();
    MOTO2_ON();
}
//
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void Motor_OFF(void)
{
    MOTO1_OFF();
    MOTO2_OFF();
}
//
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void Run_State(void)
{
    if (workMode == WM_Work ||workMode == WM_Charge || gFun_ledStopCnt!=0){
        sleep10sTimeCnt = 0;
    }
    
    switch (workMode)
    {
            case WM_Poweroff:
                Motor_OFF();
                //---10秒後進入睡眠
                if (++sleep10sTimeCnt > 2000){
                    sleep10sTimeCnt = 0;
                    workMode = WM_Sleep;
                }
                break;
            case WM_Standby:
                Standby();
                break;
            case WM_Work:
                Work();
                break;
            case WM_Sleep:
                Sleep();
                break;
            case WM_Charge:
                Charge();
                break;
            default:break;
    }
}

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void Standby(void)
{

    Motor_OFF();
    timer.work = 0;//工作時間清零

    //---10秒後進入睡眠
    if (++sleep10sTimeCnt > 2000){
        sleep10sTimeCnt = 0;
        workMode = WM_Sleep;
    }
//-----------------------------------------------------------------------------
    if (++timer.stanbyCnt>500 && ledMode!=LM_Red_1HZ_10T){
        timer.stanbyCnt = 0;
        workMode = WM_Poweroff;
        ledMode = LM_Off;
        timer.low6_4v3sCnt = 0;
    }else{
        if (key.sw2Index == 1){
            if (work.inWorkIndex == 1){
//                adc.batTotal = 590; //test
                if (adc.batTotal > 600){//---馬達未工作時低於6V
                    workMode = WM_Work;
                }else{
                    ledMode = LM_Red_1HZ_10T;
                }
            }
        }
    }
        

}
//

/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void Work(void)
{

    //adc.batTotal = 630;//test
    if (adc.batTotal > 550){
        timer.work++;
        if (++timer.work < 36000){ //--快兩倍??
            if (KEYSW2_IS_GET() && timer.ledStopCnt==0){
                timer.workStopCnt = 0;
                Motor_ON();            
                ledMode = LM_white_On;
                if (adc.batTotal<640 && adc.batILoad <=210){ //---30%保護提示
                    if (++timer.low6_4v3sCnt > 300){
                        ledMode = LM_white_1Hz;
                    }
                }
                if (adc.batILoad >= 216){  //---堵轉
                    if (++work.motorLock >= 200){  //---連續持續判斷兩秒
                        work.motorLock = 0;
                        workMode = WM_Poweroff;
                        ledMode = LM_Red_2HZ_10T;
                        Motor_OFF();                        
                    }
                }
                if (KEYSW1_IS_GET() && timer.ledStopCnt==0){
                    work.motorLock = 0;
                    workMode = WM_Poweroff;
                    ledMode = LM_Red_1HZ_3T;
                    Motor_OFF();
                }
                
            }else{
                timer.work = 0;
                work.motorLock = 0;
                Motor_OFF();    
                ledMode = LM_white_On; 
                if (++timer.workStopCnt > 500){
                    ledMode = LM_Off;
                    workMode = WM_Standby;
                    work.inWorkIndex = 0;
                }
            }
        }else{
            Motor_OFF();
            workMode = WM_Standby;
            ledMode = LM_Off;
            timer.work = 0;
            work.inWorkIndex = 0;
        }
        /**/
    //    adc.batTotal=620;//test
    
    }else{
        ledMode = LM_Red_1HZ_10T;
        workMode = WM_Poweroff;
        Motor_OFF();
//        timer.work = 0;
//        work.inWorkIndex = 0;
    }
    
   
}
//
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void Sleep(void)
{
    MCU_EnterSleep();
    workMode = WM_Poweroff;
}
u8 pwmTarget;
u16 pwmMsCnt;
u8 charPeriod;
bit charIndex;
u16 charDisplayCnt;
/******************************************************************************
* name		: 
* function	:
******************************************************************************/
void Charge(void)
{
    Motor_OFF();


        if(pwmTarget == adc.batChar){ //---如果達到充電電流了則鎖住
        //    charIndex = 1;
            charDisplayCnt = 100;
        }            
    /*
    if (charIndex==0){

    }else{
        if (++pwmMsCnt>1000){  //---鎖住後10秒打開檢查一次
            charIndex = 0;
        } 
    }
    */

    switch (charPeriod)
    {
    case 0:
        if (adc.batTotal<600){
            // || adc.batV1<300 || adc.batV2<300
            pwmTarget = 20;
            ledMode = LM_Red_On;
        }else{
            charPeriod++;
//            charDisplayCnt = 500;
        }
        break;
    case 1:
        if (adc.batTotal<800){
            // || adc.batV1<400 || adc.batV1<400
            pwmTarget = 100;
            ledMode = LM_Red_On;
        }else{
            charPeriod++;
//            charDisplayCnt = 500;
        }
        break;
    case 2:
        if (adc.batTotal<820){
            // || adc.batV1<410 || adc.batV2<410
            pwmTarget = 50;
            ledMode = LM_Red_On;
        }else{
            charPeriod++;
//            charDisplayCnt = 500;
        }
        break; 
    case 3:
        if (adc.batTotal<835){
            // || adc.batV1<420 || adc.batV2<420
            pwmTarget = 30;
            ledMode = LM_white_On;
        }else{
            charPeriod++;
//            charDisplayCnt = 500;
        }
        break; 
    case 4:
    /*
        if(adc.batTotal <= 820){
            // || adc.batV1<410 || adc.batV2<410
        //    charPeriod = 0;
//            charDisplayCnt = 500;
            pwmTarget = 50;
            ledMode = LM_Red_On;
			asm("nop");
        }else*/ 
        if (adc.batTotal>=840){
            // || adc.batV1>=420 || adc.batV2>=420
            pwmTarget = 0;
            adc.pwmDuty = 0;
            adc.batChar = 0;
            ledMode = LM_white_On;
        }

        break; 
    default:break;
    }
/*
    if (adc.batV1<=100 || adc.batV2<=100 || adc.batV1>=460 || adc.batV2>=460){ //---如果單節電池偵測異常則不充電
        pwmTarget = 0;
        adc.pwmDuty = 0;
    }
*/    
        if (++pwmMsCnt >= charDisplayCnt){
            pwmMsCnt = 0;
            if (pwmTarget != adc.batChar){
                if (pwmTarget > adc.batChar){
                    adc.pwmDuty++;
                }else{
                    if (adc.pwmDuty != 0){
                        adc.pwmDuty--;
                    }
                }
            } 
        }

    if (adc.batChar > 150){
        adc.pwmDuty = 0;
    }
  
    
}