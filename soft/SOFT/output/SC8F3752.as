opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8F3752
opt include "C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\include\sc8f3752.cgen.inc"
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
	FNCALL	_main,_ADC_Driver
	FNCALL	_main,_CUP_USB_Driver
	FNCALL	_main,_KEY_Driver
	FNCALL	_main,_KEY_WorkDriver
	FNCALL	_main,_LED_Display
	FNCALL	_main,_MCU_Config
	FNCALL	_main,_MCU_PwmInit
	FNCALL	_main,_Run_State
	FNCALL	_Run_State,_Charge
	FNCALL	_Run_State,_Motor_OFF
	FNCALL	_Run_State,_Sleep
	FNCALL	_Run_State,_Standby
	FNCALL	_Run_State,_Work
	FNCALL	_Work,_Motor_OFF
	FNCALL	_Work,_Motor_ON
	FNCALL	_Standby,_Motor_OFF
	FNCALL	_Sleep,_MCU_EnterSleep
	FNCALL	_MCU_EnterSleep,_MCU_Config
	FNCALL	_MCU_EnterSleep,_MCU_GpioSetToSleep
	FNCALL	_MCU_Config,_MCU_AdcInit
	FNCALL	_MCU_Config,_MCU_GpioInit
	FNCALL	_MCU_Config,_MCU_IntInit
	FNCALL	_MCU_Config,_MCU_PoweronConfig
	FNCALL	_MCU_Config,_MCU_PwmInit
	FNCALL	_MCU_Config,_MCU_TimerInit
	FNCALL	_MCU_TimerInit,_MCU_Timer0_Init
	FNCALL	_MCU_TimerInit,_MCU_Timer1_Init
	FNCALL	_MCU_TimerInit,_MCU_Timer2_Init
	FNCALL	_Charge,_Motor_OFF
	FNCALL	_ADC_Driver,_ADC_Sample
	FNCALL	_ADC_Driver,___lldiv
	FNCALL	_ADC_Driver,___lmul
	FNCALL	_ADC_Driver,___lwdiv
	FNCALL	_ADC_Driver,___wmul
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_gbBatCharge
	global	_gbUsbPlugInEvent
	global	_gbTime10ms
	global	_gbLed2hz
	global	_gbLed1hz
	global	_usbIndex
	global	_gbLedWait
	global	_gbCupEvent
	global	_gIsCupOk
	global	_gIsCharging
	global	_gbitChrPwmDuty
	global	_gbUsbPlugIn
	global	_gbUcp
	global	_gbOcp
	global	_adc
	global	_key
	global	ADC_Sample@admax
	global	ADC_Sample@admin
	global	_charDisplayCnt
	global	_work
	global	_sleep10sTimeCnt
	global	ADC_Sample@adtimes
	global	_gTimeCntFor10ms
	global	_pwmTarget
	global	_charPeriod
	global	_ledMode
	global	_workMode
	global	_timer
	global	ADC_Sample@adsum
	global	_led
	global	_pwmMsCnt
	global	_ADCON0
psect	text0,local,class=CODE,delta=2,merge=1
global __ptext0
__ptext0:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_T2CON
_T2CON	set	18
	global	_TMR2
_TMR2	set	17
	global	_PIR2
_PIR2	set	13
	global	_PIR1
_PIR1	set	12
	global	_INTCON
_INTCON	set	11
	global	_WPDB
_WPDB	set	8
	global	_WPDA
_WPDA	set	7
	global	_PORTB
_PORTB	set	6
	global	_PORTA
_PORTA	set	5
	global	_TMR0
_TMR0	set	1
	global	_GODONE
_GODONE	set	249
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR2IF
_TMR2IF	set	97
	global	_RAIF
_RAIF	set	103
	global	_RBIF
_RBIF	set	88
	global	_T0IF
_T0IF	set	90
	global	_RBIE
_RBIE	set	91
	global	_T0IE
_T0IE	set	93
	global	_PEIE
_PEIE	set	94
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA3
_RA3	set	43
	global	_RA6
_RA6	set	46
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_IOCB
_IOCB	set	150
	global	_WPUB
_WPUB	set	149
	global	_PR2
_PR2	set	146
	global	_OSCCON
_OSCCON	set	143
	global	_PIE2
_PIE2	set	141
	global	_PIE1
_PIE1	set	140
	global	_IOCA
_IOCA	set	135
	global	_TRISB
_TRISB	set	134
	global	_TRISA
_TRISA	set	133
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TMR2IE
_TMR2IE	set	1121
	global	_RAIE
_RAIE	set	1127
	global	_TRISB1
_TRISB1	set	1073
	global	_TRISA2
_TRISA2	set	1066
	global	_TRISA4
_TRISA4	set	1068
	global	_TRISA5
_TRISA5	set	1069
	global	_TRISA7
_TRISA7	set	1071
	global	_PWMD23H
_PWMD23H	set	285
	global	_PWMCON0
_PWMCON0	set	263
	global	_WDTCON
_WDTCON	set	261
	global	_PWMD2L
_PWMD2L	set	405
	global	_PWMTH
_PWMTH	set	400
	global	_PWMTL
_PWMTL	set	399
	global	_WPUA
_WPUA	set	398
	global	_ANSELH
_ANSELH	set	393
	global	_ANSEL
_ANSEL	set	392
; #config settings
	file	"SC8F3752.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bitbssCOMMON,class=COMMON,bit,space=1,noexec
global __pbitbssCOMMON
__pbitbssCOMMON:
_gbBatCharge:
       ds      1

_gbUsbPlugInEvent:
       ds      1

_gbTime10ms:
       ds      1

_gbLed2hz:
       ds      1

_gbLed1hz:
       ds      1

_usbIndex:
       ds      1

_gbLedWait:
       ds      1

_gbCupEvent:
       ds      1

_gIsCupOk:
       ds      1

_gIsCharging:
       ds      1

_gbitChrPwmDuty:
       ds      1

_gbUsbPlugIn:
       ds      1

_gbUcp:
       ds      1

_gbOcp:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_adc:
       ds      27

_key:
       ds      5

ADC_Sample@admax:
       ds      2

ADC_Sample@admin:
       ds      2

_charDisplayCnt:
       ds      2

_work:
       ds      2

_sleep10sTimeCnt:
       ds      2

ADC_Sample@adtimes:
       ds      1

_gTimeCntFor10ms:
       ds      1

_pwmTarget:
       ds      1

_charPeriod:
       ds      1

_ledMode:
       ds      1

_workMode:
       ds      1

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_timer:
       ds      16

ADC_Sample@adsum:
       ds      4

_led:
       ds      3

_pwmMsCnt:
       ds      2

	file	"SC8F3752.as"
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
	clrf	((__pbitbssCOMMON/8)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+030h)
	fcall	clear_ram0
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+019h)
	fcall	clear_ram0
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_MCU_GpioSetToSleep:	; 1 bytes @ 0x0
?_MCU_Config:	; 1 bytes @ 0x0
?_Standby:	; 1 bytes @ 0x0
?_Work:	; 1 bytes @ 0x0
?_Sleep:	; 1 bytes @ 0x0
?_Charge:	; 1 bytes @ 0x0
?_ADC_Driver:	; 1 bytes @ 0x0
?_MCU_PwmInit:	; 1 bytes @ 0x0
?_MCU_GpioInit:	; 1 bytes @ 0x0
?_MCU_TimerInit:	; 1 bytes @ 0x0
?_MCU_IntInit:	; 1 bytes @ 0x0
?_KEY_Driver:	; 1 bytes @ 0x0
?_KEY_WorkDriver:	; 1 bytes @ 0x0
?_CUP_USB_Driver:	; 1 bytes @ 0x0
?_LED_Display:	; 1 bytes @ 0x0
?_MCU_EnterSleep:	; 1 bytes @ 0x0
?_Motor_ON:	; 1 bytes @ 0x0
?_Motor_OFF:	; 1 bytes @ 0x0
?_Run_State:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_MCU_AdcInit:	; 1 bytes @ 0x0
?_ADC_Sample:	; 1 bytes @ 0x0
?_MCU_PoweronConfig:	; 1 bytes @ 0x0
?_ISR:	; 1 bytes @ 0x0
??_ISR:	; 1 bytes @ 0x0
?_MCU_Timer0_Init:	; 1 bytes @ 0x0
?_MCU_Timer1_Init:	; 1 bytes @ 0x0
?_MCU_Timer2_Init:	; 1 bytes @ 0x0
	ds	2
??_MCU_GpioSetToSleep:	; 1 bytes @ 0x2
??_MCU_Config:	; 1 bytes @ 0x2
??_Standby:	; 1 bytes @ 0x2
??_Work:	; 1 bytes @ 0x2
??_Charge:	; 1 bytes @ 0x2
??_MCU_PwmInit:	; 1 bytes @ 0x2
??_MCU_GpioInit:	; 1 bytes @ 0x2
??_MCU_TimerInit:	; 1 bytes @ 0x2
??_MCU_IntInit:	; 1 bytes @ 0x2
??_KEY_Driver:	; 1 bytes @ 0x2
??_KEY_WorkDriver:	; 1 bytes @ 0x2
??_CUP_USB_Driver:	; 1 bytes @ 0x2
??_LED_Display:	; 1 bytes @ 0x2
??_Motor_ON:	; 1 bytes @ 0x2
??_Motor_OFF:	; 1 bytes @ 0x2
??_MCU_AdcInit:	; 1 bytes @ 0x2
??_ADC_Sample:	; 1 bytes @ 0x2
??_MCU_PoweronConfig:	; 1 bytes @ 0x2
??_MCU_Timer0_Init:	; 1 bytes @ 0x2
??_MCU_Timer1_Init:	; 1 bytes @ 0x2
??_MCU_Timer2_Init:	; 1 bytes @ 0x2
	global	?___wmul
?___wmul:	; 2 bytes @ 0x2
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x2
	global	?___lmul
?___lmul:	; 4 bytes @ 0x2
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x2
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x2
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x2
	ds	2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x4
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x4
	ds	1
??_Sleep:	; 1 bytes @ 0x5
??_MCU_EnterSleep:	; 1 bytes @ 0x5
??_Run_State:	; 1 bytes @ 0x5
	ds	1
??___wmul:	; 1 bytes @ 0x6
??___lwdiv:	; 1 bytes @ 0x6
	global	ADC_Sample@adch
ADC_Sample@adch:	; 1 bytes @ 0x6
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x6
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x6
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x6
	ds	1
	global	ADC_Sample@i
ADC_Sample@i:	; 1 bytes @ 0x7
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x8
	global	ADC_Sample@ad_temp
ADC_Sample@ad_temp:	; 2 bytes @ 0x8
	ds	2
??_main:	; 1 bytes @ 0xA
??___lmul:	; 1 bytes @ 0xA
??___lldiv:	; 1 bytes @ 0xA
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x0
	ds	4
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x4
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x4
	ds	4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x8
	ds	4
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0xC
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0x10
	ds	1
??_ADC_Driver:	; 1 bytes @ 0x11
	ds	2
	global	ADC_Driver@i
ADC_Driver@i:	; 1 bytes @ 0x13
	ds	1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         73
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     10      12
;!    BANK0            80     20      68
;!    BANK1            80      0      25
;!    BANK3            88      0       0
;!    BANK2            80      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    _MCU_EnterSleep->_MCU_Config
;!    _ADC_Driver->_ADC_Sample
;!    _ADC_Driver->___lmul
;!    ___lldiv->___lmul
;!
;!Critical Paths under _ISR in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_ADC_Driver
;!    _ADC_Driver->___lldiv
;!    ___lldiv->___lmul
;!
;!Critical Paths under _ISR in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0    1626
;!                         _ADC_Driver
;!                     _CUP_USB_Driver
;!                         _KEY_Driver
;!                     _KEY_WorkDriver
;!                        _LED_Display
;!                         _MCU_Config
;!                        _MCU_PwmInit
;!                          _Run_State
;! ---------------------------------------------------------------------------------
;! (1) _Run_State                                            0     0      0       0
;!                             _Charge
;!                          _Motor_OFF
;!                              _Sleep
;!                            _Standby
;!                               _Work
;! ---------------------------------------------------------------------------------
;! (2) _Work                                                 0     0      0       0
;!                          _Motor_OFF
;!                           _Motor_ON
;! ---------------------------------------------------------------------------------
;! (3) _Motor_ON                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _Standby                                              0     0      0       0
;!                          _Motor_OFF
;! ---------------------------------------------------------------------------------
;! (2) _Sleep                                                0     0      0       0
;!                     _MCU_EnterSleep
;! ---------------------------------------------------------------------------------
;! (3) _MCU_EnterSleep                                       0     0      0       0
;!                         _MCU_Config
;!                 _MCU_GpioSetToSleep
;! ---------------------------------------------------------------------------------
;! (4) _MCU_GpioSetToSleep                                   0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _MCU_Config                                           3     3      0       0
;!                                              2 COMMON     3     3      0
;!                        _MCU_AdcInit
;!                       _MCU_GpioInit
;!                        _MCU_IntInit
;!                  _MCU_PoweronConfig
;!                        _MCU_PwmInit
;!                      _MCU_TimerInit
;! ---------------------------------------------------------------------------------
;! (5) _MCU_TimerInit                                        0     0      0       0
;!                    _MCU_Timer0_Init
;!                    _MCU_Timer1_Init
;!                    _MCU_Timer2_Init
;! ---------------------------------------------------------------------------------
;! (6) _MCU_Timer2_Init                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (6) _MCU_Timer1_Init                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (6) _MCU_Timer0_Init                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (5) _MCU_PwmInit                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (5) _MCU_PoweronConfig                                    0     0      0       0
;! ---------------------------------------------------------------------------------
;! (5) _MCU_IntInit                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (5) _MCU_GpioInit                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! (5) _MCU_AdcInit                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _Charge                                               2     2      0       0
;!                                              2 COMMON     2     2      0
;!                          _Motor_OFF
;! ---------------------------------------------------------------------------------
;! (3) _Motor_OFF                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LED_Display                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _KEY_WorkDriver                                       0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _KEY_Driver                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _CUP_USB_Driver                                       0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _ADC_Driver                                           3     3      0    1626
;!                                             17 BANK0      3     3      0
;!                         _ADC_Sample
;!                            ___lldiv
;!                             ___lmul
;!                            ___lwdiv
;!                             ___wmul
;! ---------------------------------------------------------------------------------
;! (2) ___wmul                                               6     2      4     198
;!                                              2 COMMON     6     2      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4     268
;!                                              2 COMMON     7     3      4
;! ---------------------------------------------------------------------------------
;! (2) ___lmul                                              12     4      8     410
;!                                              2 COMMON     8     0      8
;!                                              0 BANK0      4     4      0
;! ---------------------------------------------------------------------------------
;! (2) ___lldiv                                             13     5      8     480
;!                                              4 BANK0     13     5      8
;!                             ___lmul (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _ADC_Sample                                           8     8      0     202
;!                                              2 COMMON     8     8      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (7) _ISR                                                  2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 7
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _ADC_Driver
;!     _ADC_Sample
;!     ___lldiv
;!       ___lmul (ARG)
;!     ___lmul
;!     ___lwdiv
;!     ___wmul
;!   _CUP_USB_Driver
;!   _KEY_Driver
;!   _KEY_WorkDriver
;!   _LED_Display
;!   _MCU_Config
;!     _MCU_AdcInit
;!     _MCU_GpioInit
;!     _MCU_IntInit
;!     _MCU_PoweronConfig
;!     _MCU_PwmInit
;!     _MCU_TimerInit
;!       _MCU_Timer0_Init
;!       _MCU_Timer1_Init
;!       _MCU_Timer2_Init
;!   _MCU_PwmInit
;!   _Run_State
;!     _Charge
;!       _Motor_OFF
;!     _Motor_OFF
;!     _Sleep
;!       _MCU_EnterSleep
;!         _MCU_Config
;!           _MCU_AdcInit
;!           _MCU_GpioInit
;!           _MCU_IntInit
;!           _MCU_PoweronConfig
;!           _MCU_PwmInit
;!           _MCU_TimerInit
;!             _MCU_Timer0_Init
;!             _MCU_Timer1_Init
;!             _MCU_Timer2_Init
;!         _MCU_GpioSetToSleep
;!     _Standby
;!       _Motor_OFF
;!     _Work
;!       _Motor_OFF
;!       _Motor_ON
;!
;! _ISR (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       2       0       14.3%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      A       C       1       85.7%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!ABS                  0      0      69       3        0.0%
;!BITBANK0            50      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BANK0               50     14      44       5       85.0%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!BANK1               50      0      19       7       31.3%
;!BITBANK3            58      0       0       8        0.0%
;!BANK3               58      0       0       9        0.0%
;!BITBANK2            50      0       0      10        0.0%
;!BANK2               50      0       0      11        0.0%
;!DATA                 0      0      69      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 25 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_ADC_Driver
;;		_CUP_USB_Driver
;;		_KEY_Driver
;;		_KEY_WorkDriver
;;		_LED_Display
;;		_MCU_Config
;;		_MCU_PwmInit
;;		_Run_State
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\main.c"
	line	25
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\main.c"
	line	25
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	28
	
l8143:	
;main.c: 28: MCU_Config();
	fcall	_MCU_Config
	line	30
	
l8145:	
;main.c: 30: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	32
	
l8147:	
;main.c: 32: ledMode = LM_Redwhite_1HZ_1T;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ledMode)
	line	35
	
l8149:	
;main.c: 34: {
;main.c: 35: if (gbTime10ms) {
	btfss	(_gbTime10ms/8),(_gbTime10ms)&7
	goto	u2111
	goto	u2110
u2111:
	goto	l8149
u2110:
	line	36
	
l8151:	
;main.c: 36: gbTime10ms = 0;
	bcf	(_gbTime10ms/8),(_gbTime10ms)&7
	line	37
# 37 "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\main.c"
clrwdt ;# 
psect	maintext
	line	41
;main.c: 41: if ((RB0==1)){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(48/8),(48)&7	;volatile
	goto	u2121
	goto	u2120
u2121:
	goto	l8155
u2120:
	line	42
	
l8153:	
;main.c: 42: KEY_Driver();
	fcall	_KEY_Driver
	line	43
;main.c: 43: KEY_WorkDriver();
	fcall	_KEY_WorkDriver
	line	45
	
l8155:	
;main.c: 44: }
;main.c: 45: Run_State();
	fcall	_Run_State
	line	46
	
l8157:	
;main.c: 46: ADC_Driver();
	fcall	_ADC_Driver
	line	47
;main.c: 47: CUP_USB_Driver();
	fcall	_CUP_USB_Driver
	line	48
	
l8159:	
;main.c: 48: LED_Display();
	fcall	_LED_Display
	line	49
	
l8161:	
;main.c: 49: MCU_PwmInit();
	fcall	_MCU_PwmInit
	goto	l8149
	global	start
	ljmp	start
	opt stack 0
	line	53
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Run_State

;; *************** function _Run_State *****************
;; Defined at:
;;		line 70 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_Charge
;;		_Motor_OFF
;;		_Sleep
;;		_Standby
;;		_Work
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	70
global __ptext1
__ptext1:	;psect for function _Run_State
psect	text1
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	70
	global	__size_of_Run_State
	__size_of_Run_State	equ	__end_of_Run_State-_Run_State
	
_Run_State:	
;incstack = 0
	opt	stack 1
; Regs used in _Run_State: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	72
	
l7931:	
;function_work.c: 72: if (workMode == WM_Work ||workMode == WM_Charge || gFun_ledStopCnt!=0){
		movlw	2
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((_workMode)),w
	btfsc	status,2
	goto	u1901
	goto	u1900
u1901:
	goto	l7937
u1900:
	
l7933:	
		movlw	4
	xorwf	((_workMode)),w
	btfsc	status,2
	goto	u1911
	goto	u1910
u1911:
	goto	l7937
u1910:
	goto	l7957
	line	73
	
l7937:	
;function_work.c: 73: sleep10sTimeCnt = 0;
	clrf	(_sleep10sTimeCnt)
	clrf	(_sleep10sTimeCnt+1)
	goto	l7957
	line	79
	
l7939:	
;function_work.c: 79: Motor_OFF();
	fcall	_Motor_OFF
	line	81
	
l7941:	
;function_work.c: 81: if (++sleep10sTimeCnt > 2000){
	incf	(_sleep10sTimeCnt),f
	skipnz
	incf	(_sleep10sTimeCnt+1),f
	movlw	07h
	subwf	((_sleep10sTimeCnt+1)),w
	movlw	0D1h
	skipnz
	subwf	((_sleep10sTimeCnt)),w
	skipc
	goto	u1921
	goto	u1920
u1921:
	goto	l1668
u1920:
	line	82
	
l7943:	
;function_work.c: 82: sleep10sTimeCnt = 0;
	clrf	(_sleep10sTimeCnt)
	clrf	(_sleep10sTimeCnt+1)
	line	83
	
l7945:	
;function_work.c: 83: workMode = WM_Sleep;
	movlw	low(03h)
	movwf	(_workMode)
	goto	l1668
	line	87
	
l7947:	
;function_work.c: 87: Standby();
	fcall	_Standby
	line	88
;function_work.c: 88: break;
	goto	l1668
	line	90
	
l7949:	
;function_work.c: 90: Work();
	fcall	_Work
	line	91
;function_work.c: 91: break;
	goto	l1668
	line	93
	
l7951:	
;function_work.c: 93: Sleep();
	fcall	_Sleep
	line	94
;function_work.c: 94: break;
	goto	l1668
	line	96
	
l7953:	
;function_work.c: 96: Charge();
	fcall	_Charge
	line	97
;function_work.c: 97: break;
	goto	l1668
	line	76
	
l7957:	
	movf	(_workMode),w
	; Switch size 1, requested type "speed"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           17     7 (fixed)
; simple_byte           16     9 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	5
	subwf	fsr,w
skipnc
goto l1668
movlw high(S8223)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S8223)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S8223:
	ljmp	l7939
	ljmp	l7947
	ljmp	l7949
	ljmp	l7951
	ljmp	l7953
psect	text1

	line	100
	
l1668:	
	return
	opt stack 0
GLOBAL	__end_of_Run_State
	__end_of_Run_State:
	signat	_Run_State,89
	global	_Work

;; *************** function _Work *****************
;; Defined at:
;;		line 144 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Motor_OFF
;;		_Motor_ON
;; This function is called by:
;;		_Run_State
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	144
global __ptext2
__ptext2:	;psect for function _Work
psect	text2
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	144
	global	__size_of_Work
	__size_of_Work	equ	__end_of_Work-_Work
	
_Work:	
;incstack = 0
	opt	stack 4
; Regs used in _Work: [wreg+status,2+status,0+pclath+cstack]
	line	148
	
l7503:	
;function_work.c: 148: if (adc.batTotal > 550){
	movlw	02h
	bcf	status, 5	;RP0=0, select bank0
	subwf	1+(_adc)+08h,w
	movlw	027h
	skipnz
	subwf	0+(_adc)+08h,w
	skipc
	goto	u1011
	goto	u1010
u1011:
	goto	l7567
u1010:
	line	149
	
l7505:	
;function_work.c: 149: timer.work++;
	bsf	status, 5	;RP0=1, select bank1
	incf	0+(_timer)^080h+06h,f
	skipnz
	incf	1+(_timer)^080h+06h,f
	line	150
	
l7507:	
;function_work.c: 150: if (++timer.work < 36000){
	incf	0+(_timer)^080h+06h,f
	skipnz
	incf	1+(_timer)^080h+06h,f
	movlw	08Ch
	subwf	(1+(_timer)^080h+06h),w
	movlw	0A0h
	skipnz
	subwf	(0+(_timer)^080h+06h),w
	skipnc
	goto	u1021
	goto	u1020
u1021:
	goto	l7557
u1020:
	line	151
	
l7509:	
;function_work.c: 151: if ((RB5==0) && timer.ledStopCnt==0){
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(53/8),(53)&7	;volatile
	goto	u1031
	goto	u1030
u1031:
	goto	l7545
u1030:
	
l7511:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_timer)^080h+0Ch),w
iorwf	(1+(_timer)^080h+0Ch),w
	btfss	status,2
	goto	u1041
	goto	u1040
u1041:
	goto	l7545
u1040:
	line	152
	
l7513:	
;function_work.c: 152: timer.workStopCnt = 0;
	clrf	0+(_timer)^080h+08h
	clrf	1+(_timer)^080h+08h
	line	153
	
l7515:	
;function_work.c: 153: Motor_ON();
	fcall	_Motor_ON
	line	154
	
l7517:	
;function_work.c: 154: ledMode = LM_white_On;
	movlw	low(02h)
	movwf	(_ledMode)
	line	155
	
l7519:	
;function_work.c: 155: if (adc.batTotal<640 && adc.batILoad <=210){
	movlw	02h
	subwf	1+(_adc)+08h,w
	movlw	080h
	skipnz
	subwf	0+(_adc)+08h,w
	skipnc
	goto	u1051
	goto	u1050
u1051:
	goto	l1684
u1050:
	
l7521:	
	movlw	0
	subwf	1+(_adc)+0Eh,w
	movlw	0D3h
	skipnz
	subwf	0+(_adc)+0Eh,w
	skipnc
	goto	u1061
	goto	u1060
u1061:
	goto	l1684
u1060:
	line	156
	
l7523:	
;function_work.c: 156: if (++timer.low6_4v3sCnt > 300){
	bsf	status, 5	;RP0=1, select bank1
	incf	0+(_timer)^080h+0Eh,f
	skipnz
	incf	1+(_timer)^080h+0Eh,f
	movlw	01h
	subwf	(1+(_timer)^080h+0Eh),w
	movlw	02Dh
	skipnz
	subwf	(0+(_timer)^080h+0Eh),w
	skipc
	goto	u1071
	goto	u1070
u1071:
	goto	l1684
u1070:
	line	157
	
l7525:	
;function_work.c: 157: ledMode = LM_white_1Hz;
	movlw	low(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ledMode)
	line	159
	
l1684:	
	line	160
;function_work.c: 158: }
;function_work.c: 159: }
;function_work.c: 160: if (adc.batILoad >= 216){
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	subwf	1+(_adc)+0Eh,w
	movlw	0D8h
	skipnz
	subwf	0+(_adc)+0Eh,w
	skipc
	goto	u1081
	goto	u1080
u1081:
	goto	l7535
u1080:
	line	161
	
l7527:	
;function_work.c: 161: if (++work.motorLock >= 200){
	movlw	low(0C8h)
	incf	0+(_work)+01h,f
	subwf	(0+(_work)+01h),w
	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l7535
u1090:
	line	162
	
l7529:	
;function_work.c: 162: work.motorLock = 0;
	clrf	0+(_work)+01h
	line	163
;function_work.c: 163: workMode = WM_Poweroff;
	clrf	(_workMode)
	line	164
	
l7531:	
;function_work.c: 164: ledMode = LM_Red_2HZ_10T;
	movlw	low(09h)
	movwf	(_ledMode)
	line	165
	
l7533:	
;function_work.c: 165: Motor_OFF();
	fcall	_Motor_OFF
	line	168
	
l7535:	
;function_work.c: 166: }
;function_work.c: 167: }
;function_work.c: 168: if ((RA3==0) && timer.ledStopCnt==0){
	btfsc	(43/8),(43)&7	;volatile
	goto	u1101
	goto	u1100
u1101:
	goto	l1691
u1100:
	
l7537:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_timer)^080h+0Ch),w
iorwf	(1+(_timer)^080h+0Ch),w
	btfss	status,2
	goto	u1111
	goto	u1110
u1111:
	goto	l1691
u1110:
	line	169
	
l7539:	
;function_work.c: 169: work.motorLock = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	0+(_work)+01h
	line	170
;function_work.c: 170: workMode = WM_Poweroff;
	clrf	(_workMode)
	line	171
	
l7541:	
;function_work.c: 171: ledMode = LM_Red_1HZ_3T;
	movlw	low(06h)
	movwf	(_ledMode)
	line	172
	
l7543:	
;function_work.c: 172: Motor_OFF();
	fcall	_Motor_OFF
	goto	l1693
	line	176
	
l7545:	
;function_work.c: 176: timer.work = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+06h
	clrf	1+(_timer)^080h+06h
	line	177
;function_work.c: 177: work.motorLock = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	0+(_work)+01h
	line	178
	
l7547:	
;function_work.c: 178: Motor_OFF();
	fcall	_Motor_OFF
	line	179
	
l7549:	
;function_work.c: 179: ledMode = LM_white_On;
	movlw	low(02h)
	movwf	(_ledMode)
	line	180
	
l7551:	
;function_work.c: 180: if (++timer.workStopCnt > 500){
	bsf	status, 5	;RP0=1, select bank1
	incf	0+(_timer)^080h+08h,f
	skipnz
	incf	1+(_timer)^080h+08h,f
	movlw	01h
	subwf	(1+(_timer)^080h+08h),w
	movlw	0F5h
	skipnz
	subwf	(0+(_timer)^080h+08h),w
	skipc
	goto	u1121
	goto	u1120
u1121:
	goto	l1691
u1120:
	line	181
	
l7553:	
;function_work.c: 181: ledMode = LM_Off;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ledMode)
	line	182
	
l7555:	
;function_work.c: 182: workMode = WM_Standby;
	clrf	(_workMode)
	incf	(_workMode),f
	line	183
;function_work.c: 183: work.inWorkIndex = 0;
	clrf	(_work)
	goto	l1693
	line	187
	
l7557:	
;function_work.c: 187: Motor_OFF();
	fcall	_Motor_OFF
	line	188
	
l7559:	
;function_work.c: 188: workMode = WM_Standby;
	clrf	(_workMode)
	incf	(_workMode),f
	line	189
	
l7561:	
;function_work.c: 189: ledMode = LM_Off;
	clrf	(_ledMode)
	line	190
	
l7563:	
;function_work.c: 190: timer.work = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+06h
	clrf	1+(_timer)^080h+06h
	line	191
	
l7565:	
;function_work.c: 191: work.inWorkIndex = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_work)
	goto	l1693
	line	192
	
l1691:	
	line	196
;function_work.c: 192: }
;function_work.c: 196: }else{
	goto	l1693
	line	197
	
l7567:	
;function_work.c: 197: ledMode = LM_Red_1HZ_10T;
	movlw	low(08h)
	movwf	(_ledMode)
	line	198
	
l7569:	
;function_work.c: 198: workMode = WM_Poweroff;
	clrf	(_workMode)
	goto	l7543
	line	205
	
l1693:	
	return
	opt stack 0
GLOBAL	__end_of_Work
	__end_of_Work:
	signat	_Work,89
	global	_Motor_ON

;; *************** function _Motor_ON *****************
;; Defined at:
;;		line 50 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Work
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	50
global __ptext3
__ptext3:	;psect for function _Motor_ON
psect	text3
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	50
	global	__size_of_Motor_ON
	__size_of_Motor_ON	equ	__end_of_Motor_ON-_Motor_ON
	
_Motor_ON:	
;incstack = 0
	opt	stack 4
; Regs used in _Motor_ON: []
	line	52
	
l7473:	
;function_work.c: 52: RA6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7	;volatile
	line	53
;function_work.c: 53: RA0=1;
	bsf	(40/8),(40)&7	;volatile
	line	54
	
l1650:	
	return
	opt stack 0
GLOBAL	__end_of_Motor_ON
	__end_of_Motor_ON:
	signat	_Motor_ON,89
	global	_Standby

;; *************** function _Standby *****************
;; Defined at:
;;		line 106 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Motor_OFF
;; This function is called by:
;;		_Run_State
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	106
global __ptext4
__ptext4:	;psect for function _Standby
psect	text4
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	106
	global	__size_of_Standby
	__size_of_Standby	equ	__end_of_Standby-_Standby
	
_Standby:	
;incstack = 0
	opt	stack 4
; Regs used in _Standby: [wreg+status,2+status,0+pclath+cstack]
	line	109
	
l7477:	
;function_work.c: 109: Motor_OFF();
	fcall	_Motor_OFF
	line	110
	
l7479:	
;function_work.c: 110: timer.work = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+06h
	clrf	1+(_timer)^080h+06h
	line	113
	
l7481:	
;function_work.c: 113: if (++sleep10sTimeCnt > 2000){
	bcf	status, 5	;RP0=0, select bank0
	incf	(_sleep10sTimeCnt),f
	skipnz
	incf	(_sleep10sTimeCnt+1),f
	movlw	07h
	subwf	((_sleep10sTimeCnt+1)),w
	movlw	0D1h
	skipnz
	subwf	((_sleep10sTimeCnt)),w
	skipc
	goto	u951
	goto	u950
u951:
	goto	l7487
u950:
	line	114
	
l7483:	
;function_work.c: 114: sleep10sTimeCnt = 0;
	clrf	(_sleep10sTimeCnt)
	clrf	(_sleep10sTimeCnt+1)
	line	115
	
l7485:	
;function_work.c: 115: workMode = WM_Sleep;
	movlw	low(03h)
	movwf	(_workMode)
	line	118
	
l7487:	
;function_work.c: 116: }
;function_work.c: 118: if (++timer.stanbyCnt>500 && ledMode!=LM_Red_1HZ_10T){
	bsf	status, 5	;RP0=1, select bank1
	incf	0+(_timer)^080h+04h,f
	skipnz
	incf	1+(_timer)^080h+04h,f
	movlw	01h
	subwf	(1+(_timer)^080h+04h),w
	movlw	0F5h
	skipnz
	subwf	(0+(_timer)^080h+04h),w
	skipc
	goto	u961
	goto	u960
u961:
	goto	l7493
u960:
	
l7489:	
		movlw	8
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((_ledMode)),w
	btfsc	status,2
	goto	u971
	goto	u970
u971:
	goto	l7493
u970:
	line	119
	
l7491:	
;function_work.c: 119: timer.stanbyCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+04h
	clrf	1+(_timer)^080h+04h
	line	120
;function_work.c: 120: workMode = WM_Poweroff;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_workMode)
	line	121
;function_work.c: 121: ledMode = LM_Off;
	clrf	(_ledMode)
	line	122
;function_work.c: 122: timer.low6_4v3sCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+0Eh
	clrf	1+(_timer)^080h+0Eh
	line	123
;function_work.c: 123: }else{
	goto	l1678
	line	124
	
l7493:	
;function_work.c: 124: if (key.sw2Index == 1){
	bcf	status, 5	;RP0=0, select bank0
		decf	(0+(_key)+03h),w
	btfss	status,2
	goto	u981
	goto	u980
u981:
	goto	l1678
u980:
	line	125
	
l7495:	
;function_work.c: 125: if (work.inWorkIndex == 1){
		decf	((_work)),w
	btfss	status,2
	goto	u991
	goto	u990
u991:
	goto	l1678
u990:
	line	127
	
l7497:	
;function_work.c: 127: if (adc.batTotal > 600){
	movlw	02h
	subwf	1+(_adc)+08h,w
	movlw	059h
	skipnz
	subwf	0+(_adc)+08h,w
	skipc
	goto	u1001
	goto	u1000
u1001:
	goto	l7501
u1000:
	line	128
	
l7499:	
;function_work.c: 128: workMode = WM_Work;
	movlw	low(02h)
	movwf	(_workMode)
	line	129
;function_work.c: 129: }else{
	goto	l1678
	line	130
	
l7501:	
;function_work.c: 130: ledMode = LM_Red_1HZ_10T;
	movlw	low(08h)
	movwf	(_ledMode)
	line	137
	
l1678:	
	return
	opt stack 0
GLOBAL	__end_of_Standby
	__end_of_Standby:
	signat	_Standby,89
	global	_Sleep

;; *************** function _Sleep *****************
;; Defined at:
;;		line 211 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_MCU_EnterSleep
;; This function is called by:
;;		_Run_State
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	211
global __ptext5
__ptext5:	;psect for function _Sleep
psect	text5
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	211
	global	__size_of_Sleep
	__size_of_Sleep	equ	__end_of_Sleep-_Sleep
	
_Sleep:	
;incstack = 0
	opt	stack 1
; Regs used in _Sleep: [wreg+status,2+status,0+pclath+cstack]
	line	213
	
l7573:	
;function_work.c: 213: MCU_EnterSleep();
	fcall	_MCU_EnterSleep
	line	214
	
l7575:	
;function_work.c: 214: workMode = WM_Poweroff;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_workMode)
	line	215
	
l1696:	
	return
	opt stack 0
GLOBAL	__end_of_Sleep
	__end_of_Sleep:
	signat	_Sleep,89
	global	_MCU_EnterSleep

;; *************** function _MCU_EnterSleep *****************
;; Defined at:
;;		line 566 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_MCU_Config
;;		_MCU_GpioSetToSleep
;; This function is called by:
;;		_Sleep
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
	line	566
global __ptext6
__ptext6:	;psect for function _MCU_EnterSleep
psect	text6
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
	line	566
	global	__size_of_MCU_EnterSleep
	__size_of_MCU_EnterSleep	equ	__end_of_MCU_EnterSleep-_MCU_EnterSleep
	
_MCU_EnterSleep:	
;incstack = 0
	opt	stack 1
; Regs used in _MCU_EnterSleep: [wreg+status,2+status,0+pclath+cstack]
	line	568
	
l7449:	
;function.c: 568: INTCON = 0;
	clrf	(11)	;volatile
	line	569
;function.c: 569: OPTION_REG = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(129)^080h	;volatile
	line	570
;function.c: 570: ADCON0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(31)	;volatile
	line	571
;function.c: 571: ADCON1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	572
;function.c: 572: PWMCON0 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(263)^0100h	;volatile
	line	573
;function.c: 573: WDTCON = 0;
	clrf	(261)^0100h	;volatile
	line	574
;function.c: 574: PWMCON0 = 0x00;
	clrf	(263)^0100h	;volatile
	line	580
	
l7451:	
;function.c: 580: MCU_GpioSetToSleep();
	fcall	_MCU_GpioSetToSleep
	line	582
	
l7453:	
;function.c: 582: PEIE = 1;
	bsf	(94/8),(94)&7	;volatile
	line	583
	
l7455:	
;function.c: 583: RAIE = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1127/8)^080h,(1127)&7	;volatile
	line	584
	
l7457:	
;function.c: 584: RBIE = 1;
	bsf	(91/8),(91)&7	;volatile
	line	585
	
l7459:	
;function.c: 585: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	587
	
l7461:	
;function.c: 587: PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	588
	
l7463:	
;function.c: 588: PORTB;
	movf	(6),w	;volatile
	line	589
	
l7465:	
;function.c: 589: RAIF = 0;
	bcf	(103/8),(103)&7	;volatile
	line	590
	
l7467:	
;function.c: 590: RBIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	592
# 592 "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
clrwdt ;# 
	line	593
# 593 "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
sleep ;# 
	line	594
# 594 "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
nop ;# 
psect	text6
	line	596
	
l7469:	
;function.c: 598: gFun_keyIdleCnt = 255;
	fcall	_MCU_Config
	line	599
	
l7471:	
;function.c: 599: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	600
	
l934:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_EnterSleep
	__end_of_MCU_EnterSleep:
	signat	_MCU_EnterSleep,89
	global	_MCU_GpioSetToSleep

;; *************** function _MCU_GpioSetToSleep *****************
;; Defined at:
;;		line 54 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_gpio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/200
;;		On exit  : 300/300
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_EnterSleep
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_gpio.c"
	line	54
global __ptext7
__ptext7:	;psect for function _MCU_GpioSetToSleep
psect	text7
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_gpio.c"
	line	54
	global	__size_of_MCU_GpioSetToSleep
	__size_of_MCU_GpioSetToSleep	equ	__end_of_MCU_GpioSetToSleep-_MCU_GpioSetToSleep
	
_MCU_GpioSetToSleep:	
;incstack = 0
	opt	stack 3
; Regs used in _MCU_GpioSetToSleep: [wreg]
	line	63
	
l7433:	
;mcu_gpio.c: 63: PORTA = ( ((1)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((1)<<3) | ((0)<<2) | ((1)<<1) | (0));
	movlw	low(08Ah)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	64
;mcu_gpio.c: 64: TRISA = ( ((1)<<7) | ((0)<<6) | ((1)<<5) | ((1)<<4) | ((1)<<3) | ((1)<<2) | ((0)<<1) | (0));
	movlw	low(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	65
;mcu_gpio.c: 65: WPUA = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((1)<<3) | ((0)<<2) | ((0)<<1) | (0));
	movlw	low(08h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	66
;mcu_gpio.c: 66: WPDA = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (1));
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	67
;mcu_gpio.c: 67: IOCA = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((1)<<3) | ((0)<<2) | ((0)<<1) | (0));
	movlw	low(08h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	68
;mcu_gpio.c: 68: ANSEL = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((1)<<4) | ((0)<<3) | ((1)<<2) | ((0)<<1) | (0));
	movlw	low(034h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(392)^0180h	;volatile
	line	72
;mcu_gpio.c: 72: PORTB = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((1)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (1));
	movlw	low(031h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	73
;mcu_gpio.c: 73: TRISB = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((1)<<1) | (1));
	movlw	low(023h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	74
;mcu_gpio.c: 74: WPUB = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (1));
	movlw	low(021h)
	movwf	(149)^080h	;volatile
	line	75
;mcu_gpio.c: 75: WPDB = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((1)<<3) | ((0)<<2) | ((0)<<1) | (0));
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(8)	;volatile
	line	76
;mcu_gpio.c: 76: IOCB = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (1));
	movlw	low(021h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	77
;mcu_gpio.c: 77: ANSELH = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((1)<<1) | (0));
	movlw	low(02h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(393)^0180h	;volatile
	line	80
	
l4450:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_GpioSetToSleep
	__end_of_MCU_GpioSetToSleep:
	signat	_MCU_GpioSetToSleep,89
	global	_MCU_Config

;; *************** function _MCU_Config *****************
;; Defined at:
;;		line 130 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_config.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_MCU_AdcInit
;;		_MCU_GpioInit
;;		_MCU_IntInit
;;		_MCU_PoweronConfig
;;		_MCU_PwmInit
;;		_MCU_TimerInit
;; This function is called by:
;;		_MCU_EnterSleep
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_config.c"
	line	130
global __ptext8
__ptext8:	;psect for function _MCU_Config
psect	text8
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_config.c"
	line	130
	global	__size_of_MCU_Config
	__size_of_MCU_Config	equ	__end_of_MCU_Config-_MCU_Config
	
_MCU_Config:	
;incstack = 0
	opt	stack 1
; Regs used in _MCU_Config: [wreg+status,2+status,0+pclath+cstack]
	line	132
	
l7435:	
;mcu_config.c: 132: _delay((unsigned long)((100)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw  3
movwf	((??_MCU_Config+0)+0+2),f
movlw	8
movwf	((??_MCU_Config+0)+0+1),f
	movlw	119
movwf	((??_MCU_Config+0)+0),f
	u2137:
decfsz	((??_MCU_Config+0)+0),f
	goto	u2137
	decfsz	((??_MCU_Config+0)+0+1),f
	goto	u2137
	decfsz	((??_MCU_Config+0)+0+2),f
	goto	u2137
opt asmopt_pop

	line	133
	
l7437:	
;mcu_config.c: 133: MCU_PoweronConfig();
	fcall	_MCU_PoweronConfig
	line	135
	
l7439:	
;mcu_config.c: 135: MCU_GpioInit();
	fcall	_MCU_GpioInit
	line	136
	
l7441:	
;mcu_config.c: 136: MCU_TimerInit();
	fcall	_MCU_TimerInit
	line	137
	
l7443:	
;mcu_config.c: 137: MCU_IntInit();
	fcall	_MCU_IntInit
	line	138
	
l7445:	
;mcu_config.c: 138: MCU_PwmInit();
	fcall	_MCU_PwmInit
	line	139
	
l7447:	
;mcu_config.c: 139: MCU_AdcInit();
	fcall	_MCU_AdcInit
	line	141
	
l3820:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_Config
	__end_of_MCU_Config:
	signat	_MCU_Config,89
	global	_MCU_TimerInit

;; *************** function _MCU_TimerInit *****************
;; Defined at:
;;		line 144 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/300
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_MCU_Timer0_Init
;;		_MCU_Timer1_Init
;;		_MCU_Timer2_Init
;; This function is called by:
;;		_MCU_Config
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
	line	144
global __ptext9
__ptext9:	;psect for function _MCU_TimerInit
psect	text9
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
	line	144
	global	__size_of_MCU_TimerInit
	__size_of_MCU_TimerInit	equ	__end_of_MCU_TimerInit-_MCU_TimerInit
	
_MCU_TimerInit:	
;incstack = 0
	opt	stack 1
; Regs used in _MCU_TimerInit: [wreg+status,2+status,0+pclath+cstack]
	line	146
	
l7421:	
;mcu_timer.c: 146: MCU_Timer0_Init();
	fcall	_MCU_Timer0_Init
	line	147
;mcu_timer.c: 147: MCU_Timer1_Init();
	fcall	_MCU_Timer1_Init
	line	148
	
l7423:	
;mcu_timer.c: 148: MCU_Timer2_Init();
	fcall	_MCU_Timer2_Init
	line	149
	
l6362:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_TimerInit
	__end_of_MCU_TimerInit:
	signat	_MCU_TimerInit,89
	global	_MCU_Timer2_Init

;; *************** function _MCU_Timer2_Init *****************
;; Defined at:
;;		line 79 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_TimerInit
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	line	79
global __ptext10
__ptext10:	;psect for function _MCU_Timer2_Init
psect	text10
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
	line	79
	global	__size_of_MCU_Timer2_Init
	__size_of_MCU_Timer2_Init	equ	__end_of_MCU_Timer2_Init-_MCU_Timer2_Init
	
_MCU_Timer2_Init:	
;incstack = 0
	opt	stack 1
; Regs used in _MCU_Timer2_Init: [wreg]
	line	128
	
l7395:	
# 128 "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
nop ;# 
	line	129
# 129 "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
clrwdt ;# 
psect	text10
	line	130
;mcu_timer.c: 130: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7	;volatile
	line	131
;mcu_timer.c: 131: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7	;volatile
	line	132
	
l7397:	
;mcu_timer.c: 132: T2CON = (0 <<3) | (1<<0) | (1<<2);
	movlw	low(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	133
;mcu_timer.c: 133: PR2 = 100;
	movlw	low(064h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	134
;mcu_timer.c: 134: TMR2 = 1;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(17)	;volatile
	line	135
;mcu_timer.c: 135: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	137
	
l6359:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_Timer2_Init
	__end_of_MCU_Timer2_Init:
	signat	_MCU_Timer2_Init,89
	global	_MCU_Timer1_Init

;; *************** function _MCU_Timer1_Init *****************
;; Defined at:
;;		line 34 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_TimerInit
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	line	34
global __ptext11
__ptext11:	;psect for function _MCU_Timer1_Init
psect	text11
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
	line	34
	global	__size_of_MCU_Timer1_Init
	__size_of_MCU_Timer1_Init	equ	__end_of_MCU_Timer1_Init-_MCU_Timer1_Init
	
_MCU_Timer1_Init:	
;incstack = 0
	opt	stack 1
; Regs used in _MCU_Timer1_Init: []
	line	72
	
l6356:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_Timer1_Init
	__end_of_MCU_Timer1_Init:
	signat	_MCU_Timer1_Init,89
	global	_MCU_Timer0_Init

;; *************** function _MCU_Timer0_Init *****************
;; Defined at:
;;		line 21 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 300/300
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_TimerInit
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=0
	line	21
global __ptext12
__ptext12:	;psect for function _MCU_Timer0_Init
psect	text12
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_timer.c"
	line	21
	global	__size_of_MCU_Timer0_Init
	__size_of_MCU_Timer0_Init	equ	__end_of_MCU_Timer0_Init-_MCU_Timer0_Init
	
_MCU_Timer0_Init:	
;incstack = 0
	opt	stack 1
; Regs used in _MCU_Timer0_Init: [status,2]
	line	26
	
l7393:	
;mcu_timer.c: 26: TMR0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(1)	;volatile
	line	27
	
l6353:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_Timer0_Init
	__end_of_MCU_Timer0_Init:
	signat	_MCU_Timer0_Init,89
	global	_MCU_PwmInit

;; *************** function _MCU_PwmInit *****************
;; Defined at:
;;		line 23 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_MCU_Config
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_pwm.c"
	line	23
global __ptext13
__ptext13:	;psect for function _MCU_PwmInit
psect	text13
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_pwm.c"
	line	23
	global	__size_of_MCU_PwmInit
	__size_of_MCU_PwmInit	equ	__end_of_MCU_PwmInit-_MCU_PwmInit
	
_MCU_PwmInit:	
;incstack = 0
	opt	stack 2
; Regs used in _MCU_PwmInit: [wreg+status,2]
	line	25
	
l7399:	
;mcu_pwm.c: 25: TRISA7 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1071/8)^080h,(1071)&7	;volatile
	line	26
	
l7401:	
;mcu_pwm.c: 26: PWMCON0 = 0b00000100;
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(263)^0100h	;volatile
	line	27
;mcu_pwm.c: 27: PWMTL = 128;
	movlw	low(080h)
	bsf	status, 5	;RP0=1, select bank3
	movwf	(399)^0180h	;volatile
	line	28
	
l7403:	
;mcu_pwm.c: 28: PWMTH = 0x00;
	clrf	(400)^0180h	;volatile
	line	29
	
l7405:	
;mcu_pwm.c: 29: PWMD2L = adc.pwmDuty;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_adc)+015h,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(405)^0180h	;volatile
	line	30
;mcu_pwm.c: 30: PWMD23H = 0;
	bcf	status, 5	;RP0=0, select bank2
	clrf	(285)^0100h	;volatile
	line	31
	
l7407:	
;mcu_pwm.c: 31: TRISA7 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1071/8)^080h,(1071)&7	;volatile
	line	32
	
l5722:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_PwmInit
	__end_of_MCU_PwmInit:
	signat	_MCU_PwmInit,89
	global	_MCU_PoweronConfig

;; *************** function _MCU_PoweronConfig *****************
;; Defined at:
;;		line 40 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_config.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_Config
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_config.c"
	line	40
global __ptext14
__ptext14:	;psect for function _MCU_PoweronConfig
psect	text14
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_config.c"
	line	40
	global	__size_of_MCU_PoweronConfig
	__size_of_MCU_PoweronConfig	equ	__end_of_MCU_PoweronConfig-_MCU_PoweronConfig
	
_MCU_PoweronConfig:	
;incstack = 0
	opt	stack 2
; Regs used in _MCU_PoweronConfig: [wreg]
	line	65
	
l7411:	
;mcu_config.c: 65: OSCCON = (7<<4) | (1<<0);
	movlw	low(071h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	122
;mcu_config.c: 122: OPTION_REG = (7<<0) | (1<<3);
	movlw	low(0Fh)
	movwf	(129)^080h	;volatile
	line	123
	
l3817:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_PoweronConfig
	__end_of_MCU_PoweronConfig:
	signat	_MCU_PoweronConfig,89
	global	_MCU_IntInit

;; *************** function _MCU_IntInit *****************
;; Defined at:
;;		line 21 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_int.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_Config
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_int.c"
	line	21
global __ptext15
__ptext15:	;psect for function _MCU_IntInit
psect	text15
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_int.c"
	line	21
	global	__size_of_MCU_IntInit
	__size_of_MCU_IntInit	equ	__end_of_MCU_IntInit-_MCU_IntInit
	
_MCU_IntInit:	
;incstack = 0
	opt	stack 2
; Regs used in _MCU_IntInit: [wreg+status,2]
	line	42
	
l7425:	
;mcu_int.c: 42: INTCON = (1<<6);
	movlw	low(040h)
	movwf	(11)	;volatile
	line	58
;mcu_int.c: 58: PIE1 = (1<<1);
	movlw	low(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(140)^080h	;volatile
	line	64
	
l7427:	
;mcu_int.c: 64: PIE2 = 0;
	clrf	(141)^080h	;volatile
	line	84
	
l7429:	
;mcu_int.c: 84: PIR1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	88
	
l7431:	
;mcu_int.c: 88: PIR2 = 0;
	clrf	(13)	;volatile
	line	91
	
l5081:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_IntInit
	__end_of_MCU_IntInit:
	signat	_MCU_IntInit,89
	global	_MCU_GpioInit

;; *************** function _MCU_GpioInit *****************
;; Defined at:
;;		line 20 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_gpio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/300
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_Config
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_gpio.c"
	line	20
global __ptext16
__ptext16:	;psect for function _MCU_GpioInit
psect	text16
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_gpio.c"
	line	20
	global	__size_of_MCU_GpioInit
	__size_of_MCU_GpioInit	equ	__end_of_MCU_GpioInit-_MCU_GpioInit
	
_MCU_GpioInit:	
;incstack = 0
	opt	stack 2
; Regs used in _MCU_GpioInit: [wreg+status,2]
	line	29
	
l7413:	
;mcu_gpio.c: 29: PORTA = ( ((1)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((1)<<3) | ((0)<<2) | ((1)<<1) | (0));
	movlw	low(08Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	30
;mcu_gpio.c: 30: TRISA = ( ((1)<<7) | ((0)<<6) | ((1)<<5) | ((1)<<4) | ((1)<<3) | ((1)<<2) | ((0)<<1) | (0));
	movlw	low(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	31
;mcu_gpio.c: 31: WPUA = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((1)<<3) | ((0)<<2) | ((0)<<1) | (0));
	movlw	low(08h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	32
;mcu_gpio.c: 32: WPDA = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (1));
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	33
;mcu_gpio.c: 33: IOCA = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((1)<<3) | ((0)<<2) | ((0)<<1) | (0));
	movlw	low(08h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	34
;mcu_gpio.c: 34: ANSEL = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((1)<<4) | ((0)<<3) | ((1)<<2) | ((0)<<1) | (0));
	movlw	low(034h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(392)^0180h	;volatile
	line	38
;mcu_gpio.c: 38: PORTB = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((1)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (1));
	movlw	low(031h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	39
;mcu_gpio.c: 39: TRISB = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((1)<<1) | (1));
	movlw	low(023h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	40
;mcu_gpio.c: 40: WPUB = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (1));
	movlw	low(021h)
	movwf	(149)^080h	;volatile
	line	41
	
l7415:	
;mcu_gpio.c: 41: WPDB = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (0));
	bcf	status, 5	;RP0=0, select bank0
	clrf	(8)	;volatile
	line	42
	
l7417:	
;mcu_gpio.c: 42: IOCB = ( ((0)<<7) | ((0)<<6) | ((1)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((0)<<1) | (1));
	movlw	low(021h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	43
	
l7419:	
;mcu_gpio.c: 43: ANSELH = ( ((0)<<7) | ((0)<<6) | ((0)<<5) | ((0)<<4) | ((0)<<3) | ((0)<<2) | ((1)<<1) | (0));
	movlw	low(02h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(393)^0180h	;volatile
	line	47
	
l4447:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_GpioInit
	__end_of_MCU_GpioInit:
	signat	_MCU_GpioInit,89
	global	_MCU_AdcInit

;; *************** function _MCU_AdcInit *****************
;; Defined at:
;;		line 23 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MCU_Config
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
	line	23
global __ptext17
__ptext17:	;psect for function _MCU_AdcInit
psect	text17
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
	line	23
	global	__size_of_MCU_AdcInit
	__size_of_MCU_AdcInit	equ	__end_of_MCU_AdcInit-_MCU_AdcInit
	
_MCU_AdcInit:	
;incstack = 0
	opt	stack 2
; Regs used in _MCU_AdcInit: [wreg]
	line	92
	
l7409:	
;mcu_adc.c: 92: ADCON0 = (1<<6) | (1<<0);
	movlw	low(041h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	94
;mcu_adc.c: 94: ADCON1 = (0<<7) | (1<<2) | (1<<0);
	movlw	low(05h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	95
	
l3126:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_AdcInit
	__end_of_MCU_AdcInit:
	signat	_MCU_AdcInit,89
	global	_Charge

;; *************** function _Charge *****************
;; Defined at:
;;		line 225 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Motor_OFF
;; This function is called by:
;;		_Run_State
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	225
global __ptext18
__ptext18:	;psect for function _Charge
psect	text18
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	225
	global	__size_of_Charge
	__size_of_Charge	equ	__end_of_Charge-_Charge
	
_Charge:	
;incstack = 0
	opt	stack 4
; Regs used in _Charge: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	227
	
l7577:	
;function_work.c: 227: Motor_OFF();
	fcall	_Motor_OFF
	line	230
	
l7579:	
;function_work.c: 230: if(pwmTarget == adc.batChar){
	movf	(_pwmTarget),w
	movwf	(??_Charge+0)+0
	clrf	(??_Charge+0)+0+1
	movf	1+(_adc)+010h,w
	xorwf	1+(??_Charge+0)+0,w
	skipz
	goto	u1135
	movf	0+(_adc)+010h,w
	xorwf	0+(??_Charge+0)+0,w
u1135:

	skipz
	goto	u1131
	goto	u1130
u1131:
	goto	l7621
u1130:
	line	232
	
l7581:	
;function_work.c: 232: charDisplayCnt = 100;
	movlw	064h
	movwf	(_charDisplayCnt)
	clrf	(_charDisplayCnt+1)
	goto	l7621
	line	247
	
l7583:	
;function_work.c: 247: if (adc.batTotal<600){
	movlw	02h
	subwf	1+(_adc)+08h,w
	movlw	058h
	skipnz
	subwf	0+(_adc)+08h,w
	skipnc
	goto	u1141
	goto	u1140
u1141:
	goto	l7589
u1140:
	line	249
	
l7585:	
;function_work.c: 249: pwmTarget = 20;
	movlw	low(014h)
	movwf	(_pwmTarget)
	line	250
	
l7587:	
;function_work.c: 250: ledMode = LM_Red_On;
	clrf	(_ledMode)
	incf	(_ledMode),f
	line	251
;function_work.c: 251: }else{
	goto	l7623
	line	252
	
l7589:	
;function_work.c: 252: charPeriod++;
	incf	(_charPeriod),f
	goto	l7623
	line	257
	
l7591:	
;function_work.c: 257: if (adc.batTotal<800){
	movlw	03h
	subwf	1+(_adc)+08h,w
	movlw	020h
	skipnz
	subwf	0+(_adc)+08h,w
	skipnc
	goto	u1151
	goto	u1150
u1151:
	goto	l7589
u1150:
	line	259
	
l7593:	
;function_work.c: 259: pwmTarget = 100;
	movlw	low(064h)
	movwf	(_pwmTarget)
	goto	l7587
	line	267
	
l7599:	
;function_work.c: 267: if (adc.batTotal<820){
	movlw	03h
	subwf	1+(_adc)+08h,w
	movlw	034h
	skipnz
	subwf	0+(_adc)+08h,w
	skipnc
	goto	u1161
	goto	u1160
u1161:
	goto	l7589
u1160:
	line	269
	
l7601:	
;function_work.c: 269: pwmTarget = 50;
	movlw	low(032h)
	movwf	(_pwmTarget)
	goto	l7587
	line	277
	
l7607:	
;function_work.c: 277: if (adc.batTotal<835){
	movlw	03h
	subwf	1+(_adc)+08h,w
	movlw	043h
	skipnz
	subwf	0+(_adc)+08h,w
	skipnc
	goto	u1171
	goto	u1170
u1171:
	goto	l7589
u1170:
	line	279
	
l7609:	
;function_work.c: 279: pwmTarget = 30;
	movlw	low(01Eh)
	movwf	(_pwmTarget)
	line	280
;function_work.c: 280: ledMode = LM_white_On;
	movlw	low(02h)
	movwf	(_ledMode)
	line	281
;function_work.c: 281: }else{
	goto	l7623
	line	296
	
l7613:	
;function_work.c: 296: if (adc.batTotal>=840){
	movlw	03h
	subwf	1+(_adc)+08h,w
	movlw	048h
	skipnz
	subwf	0+(_adc)+08h,w
	skipc
	goto	u1181
	goto	u1180
u1181:
	goto	l7623
u1180:
	line	298
	
l7615:	
;function_work.c: 298: pwmTarget = 0;
	clrf	(_pwmTarget)
	line	299
;function_work.c: 299: adc.pwmDuty = 0;
	clrf	0+(_adc)+015h
	line	300
;function_work.c: 300: adc.batChar = 0;
	clrf	0+(_adc)+010h
	clrf	1+(_adc)+010h
	line	301
	
l7617:	
;function_work.c: 301: ledMode = LM_white_On;
	movlw	low(02h)
	movwf	(_ledMode)
	goto	l7623
	line	244
	
l7621:	
	movf	(_charPeriod),w
	; Switch size 1, requested type "speed"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           17     7 (fixed)
; simple_byte           16     9 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	5
	subwf	fsr,w
skipnc
goto l7623
movlw high(S8225)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S8225)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S8225:
	ljmp	l7583
	ljmp	l7591
	ljmp	l7599
	ljmp	l7607
	ljmp	l7613
psect	text18

	line	313
	
l7623:	
;function_work.c: 313: if (++pwmMsCnt >= charDisplayCnt){
	bsf	status, 5	;RP0=1, select bank1
	incf	(_pwmMsCnt)^080h,f
	skipnz
	incf	(_pwmMsCnt+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	(_charDisplayCnt+1),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	((_pwmMsCnt+1)^080h),w
	skipz
	goto	u1195
	bcf	status, 5	;RP0=0, select bank0
	movf	(_charDisplayCnt),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	((_pwmMsCnt)^080h),w
u1195:
	skipc
	goto	u1191
	goto	u1190
u1191:
	goto	l7637
u1190:
	line	314
	
l7625:	
;function_work.c: 314: pwmMsCnt = 0;
	clrf	(_pwmMsCnt)^080h
	clrf	(_pwmMsCnt+1)^080h
	line	315
	
l7627:	
;function_work.c: 315: if (pwmTarget != adc.batChar){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_pwmTarget),w
	movwf	(??_Charge+0)+0
	clrf	(??_Charge+0)+0+1
	movf	1+(_adc)+010h,w
	xorwf	1+(??_Charge+0)+0,w
	skipz
	goto	u1205
	movf	0+(_adc)+010h,w
	xorwf	0+(??_Charge+0)+0,w
u1205:

	skipnz
	goto	u1201
	goto	u1200
u1201:
	goto	l7637
u1200:
	line	316
	
l7629:	
;function_work.c: 316: if (pwmTarget > adc.batChar){
	movf	(_pwmTarget),w
	movwf	(??_Charge+0)+0
	clrf	(??_Charge+0)+0+1
	movf	1+(??_Charge+0)+0,w
	subwf	1+(_adc)+010h,w
	skipz
	goto	u1215
	movf	0+(??_Charge+0)+0,w
	subwf	0+(_adc)+010h,w
u1215:
	skipnc
	goto	u1211
	goto	u1210
u1211:
	goto	l7633
u1210:
	line	317
	
l7631:	
;function_work.c: 317: adc.pwmDuty++;
	incf	0+(_adc)+015h,f
	line	318
;function_work.c: 318: }else{
	goto	l7637
	line	319
	
l7633:	
;function_work.c: 319: if (adc.pwmDuty != 0){
	movf	(0+(_adc)+015h),w
	btfsc	status,2
	goto	u1221
	goto	u1220
u1221:
	goto	l1728
u1220:
	line	320
	
l7635:	
;function_work.c: 320: adc.pwmDuty--;
	decf	0+(_adc)+015h,f
	goto	l7637
	line	323
	
l1728:	
	line	326
	
l7637:	
;function_work.c: 321: }
;function_work.c: 322: }
;function_work.c: 323: }
;function_work.c: 324: }
;function_work.c: 326: if (adc.batChar > 150){
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	subwf	1+(_adc)+010h,w
	movlw	097h
	skipnz
	subwf	0+(_adc)+010h,w
	skipc
	goto	u1231
	goto	u1230
u1231:
	goto	l1733
u1230:
	line	327
	
l7639:	
;function_work.c: 327: adc.pwmDuty = 0;
	clrf	0+(_adc)+015h
	line	331
	
l1733:	
	return
	opt stack 0
GLOBAL	__end_of_Charge
	__end_of_Charge:
	signat	_Charge,89
	global	_Motor_OFF

;; *************** function _Motor_OFF *****************
;; Defined at:
;;		line 60 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Run_State
;;		_Standby
;;		_Work
;;		_Charge
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	line	60
global __ptext19
__ptext19:	;psect for function _Motor_OFF
psect	text19
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function_work.c"
	line	60
	global	__size_of_Motor_OFF
	__size_of_Motor_OFF	equ	__end_of_Motor_OFF-_Motor_OFF
	
_Motor_OFF:	
;incstack = 0
	opt	stack 4
; Regs used in _Motor_OFF: []
	line	62
	
l7475:	
;function_work.c: 62: RA6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7	;volatile
	line	63
;function_work.c: 63: RA6=0;
	bcf	(46/8),(46)&7	;volatile
	line	64
	
l1653:	
	return
	opt stack 0
GLOBAL	__end_of_Motor_OFF
	__end_of_Motor_OFF:
	signat	_Motor_OFF,89
	global	_LED_Display

;; *************** function _LED_Display *****************
;; Defined at:
;;		line 161 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
	line	161
global __ptext20
__ptext20:	;psect for function _LED_Display
psect	text20
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
	line	161
	global	__size_of_LED_Display
	__size_of_LED_Display	equ	__end_of_LED_Display-_LED_Display
	
_LED_Display:	
;incstack = 0
	opt	stack 6
; Regs used in _LED_Display: [wreg-fsr0h+status,2+status,0]
	line	164
	
l7851:	
;function.c: 164: if (led.tempBank != ledMode){
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_led)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	xorwf	(_ledMode),w
	skipnz
	goto	u1681
	goto	u1680
u1681:
	goto	l7857
u1680:
	line	165
	
l7853:	
;function.c: 165: gbLed1hz = 0;
	bcf	(_gbLed1hz/8),(_gbLed1hz)&7
	line	166
;function.c: 166: gbLed2hz = 0;
	bcf	(_gbLed2hz/8),(_gbLed2hz)&7
	line	167
	
l7855:	
;function.c: 167: timer.ledStopCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+0Ch
	clrf	1+(_timer)^080h+0Ch
	line	170
	
l7857:	
;function.c: 169: }
;function.c: 170: led.tempBank = ledMode;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ledMode),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_led)^080h+02h
	line	172
	
l7859:	
;function.c: 172: if (ledMode == LM_Off){
	bcf	status, 5	;RP0=0, select bank0
	movf	((_ledMode)),w
	btfss	status,2
	goto	u1691
	goto	u1690
u1691:
	goto	l7863
u1690:
	line	173
	
l7861:	
;function.c: 173: timer.ledStopTime = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+0Ah
	clrf	1+(_timer)^080h+0Ah
	line	174
;function.c: 174: }else if (ledMode == LM_Redwhite_1HZ_1T){
	goto	l787
	
l7863:	
		movlw	10
	xorwf	((_ledMode)),w
	btfss	status,2
	goto	u1701
	goto	u1700
u1701:
	goto	l7867
u1700:
	line	175
	
l7865:	
;function.c: 175: timer.ledStopTime = 100;
	movlw	064h
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_timer)^080h+0Ah
	clrf	1+(_timer)^080h+0Ah
	line	176
;function.c: 176: }else if(ledMode==LM_white_1Hz_3T || ledMode==LM_Red_1HZ_3T){
	goto	l787
	
l7867:	
		movlw	5
	xorwf	((_ledMode)),w
	btfsc	status,2
	goto	u1711
	goto	u1710
u1711:
	goto	l7871
u1710:
	
l7869:	
		movlw	6
	xorwf	((_ledMode)),w
	btfss	status,2
	goto	u1721
	goto	u1720
u1721:
	goto	l7873
u1720:
	line	177
	
l7871:	
;function.c: 177: timer.ledStopTime = 300;
	movlw	02Ch
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_timer)^080h+0Ah
	movlw	01h
	movwf	(0+(_timer)^080h+0Ah)+1
	line	178
;function.c: 178: }else if(ledMode == LM_white_1Hz_3T){
	goto	l787
	
l7873:	
		movlw	5
	xorwf	((_ledMode)),w
	btfss	status,2
	goto	u1731
	goto	u1730
u1731:
	goto	l7877
u1730:
	goto	l7871
	line	180
	
l7877:	
		movlw	9
	xorwf	((_ledMode)),w
	btfss	status,2
	goto	u1741
	goto	u1740
u1741:
	goto	l7881
u1740:
	line	181
	
l7879:	
;function.c: 181: timer.ledStopTime = 500;
	movlw	0F4h
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_timer)^080h+0Ah
	movlw	01h
	movwf	(0+(_timer)^080h+0Ah)+1
	line	182
;function.c: 182: }else if(ledMode == LM_Red_1HZ_10T){
	goto	l787
	
l7881:	
		movlw	8
	xorwf	((_ledMode)),w
	btfss	status,2
	goto	u1751
	goto	u1750
u1751:
	goto	l793
u1750:
	line	183
	
l7883:	
;function.c: 183: timer.ledStopTime = 1000;
	movlw	0E8h
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_timer)^080h+0Ah
	movlw	03h
	movwf	(0+(_timer)^080h+0Ah)+1
	goto	l787
	line	187
	
l793:	
	
l787:	
;function.c: 184: }
;function.c: 187: if (timer.ledStopTime != timer.ledStopCnt){
	bsf	status, 5	;RP0=1, select bank1
	movf	1+(_timer)^080h+0Ch,w
	xorwf	1+(_timer)^080h+0Ah,w
	skipz
	goto	u1765
	movf	0+(_timer)^080h+0Ch,w
	xorwf	0+(_timer)^080h+0Ah,w
u1765:

	skipnz
	goto	u1761
	goto	u1760
u1761:
	goto	l7889
u1760:
	line	188
	
l7885:	
;function.c: 188: if (timer.ledStopTime > timer.ledStopCnt){
	movf	1+(_timer)^080h+0Ah,w
	subwf	1+(_timer)^080h+0Ch,w
	skipz
	goto	u1775
	movf	0+(_timer)^080h+0Ah,w
	subwf	0+(_timer)^080h+0Ch,w
u1775:
	skipnc
	goto	u1771
	goto	u1770
u1771:
	goto	l7895
u1770:
	line	189
	
l7887:	
;function.c: 189: timer.ledStopCnt++;
	incf	0+(_timer)^080h+0Ch,f
	skipnz
	incf	1+(_timer)^080h+0Ch,f
	goto	l7895
	line	192
	
l7889:	
;function.c: 192: if (timer.ledStopTime!=0 && timer.ledStopCnt!=0){
	movf	(0+(_timer)^080h+0Ah),w
iorwf	(1+(_timer)^080h+0Ah),w
	btfsc	status,2
	goto	u1781
	goto	u1780
u1781:
	goto	l7895
u1780:
	
l7891:	
	movf	(0+(_timer)^080h+0Ch),w
iorwf	(1+(_timer)^080h+0Ch),w
	btfsc	status,2
	goto	u1791
	goto	u1790
u1791:
	goto	l7895
u1790:
	line	195
	
l7893:	
;function.c: 195: ledMode = LM_Off;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ledMode)
	line	201
	
l7895:	
;function.c: 196: }
;function.c: 198: }
;function.c: 201: if (++led.flicker1hzCnt > 50){
	movlw	low(033h)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_led)^080h,f
	subwf	((_led)^080h),w
	skipc
	goto	u1801
	goto	u1800
u1801:
	goto	l7901
u1800:
	line	202
	
l7897:	
;function.c: 202: led.flicker1hzCnt = 0;
	clrf	(_led)^080h
	line	203
	
l7899:	
;function.c: 203: gbLed1hz =~ gbLed1hz;
	movlw	1<<((_gbLed1hz)&7)
	xorwf	((_gbLed1hz)/8),f
	line	206
	
l7901:	
;function.c: 204: }
;function.c: 206: if (++led.flicker2hzCnt > 25){
	movlw	low(01Ah)
	incf	0+(_led)^080h+01h,f
	subwf	(0+(_led)^080h+01h),w
	skipc
	goto	u1811
	goto	u1810
u1811:
	goto	l7925
u1810:
	line	207
	
l7903:	
;function.c: 207: led.flicker2hzCnt = 0;
	clrf	0+(_led)^080h+01h
	line	208
	
l7905:	
;function.c: 208: gbLed2hz =~ gbLed2hz;
	movlw	1<<((_gbLed2hz)&7)
	xorwf	((_gbLed2hz)/8),f
	goto	l7925
	line	213
;function.c: 213: case LM_Off:
	
l806:	
	line	215
;function.c: 215: RB4=1;
	bsf	(52/8),(52)&7	;volatile
	line	216
;function.c: 216: RA1=1;
	bsf	(41/8),(41)&7	;volatile
	line	217
;function.c: 217: break;
	goto	l835
	line	218
;function.c: 218: case LM_Red_On:
	
l808:	
	line	219
;function.c: 219: RB4=0;
	bcf	(52/8),(52)&7	;volatile
	line	220
;function.c: 220: RA1=1;
	bsf	(41/8),(41)&7	;volatile
	line	221
;function.c: 221: break;
	goto	l835
	line	222
;function.c: 222: case LM_white_On:
	
l809:	
	line	223
;function.c: 223: RB4=1;
	bsf	(52/8),(52)&7	;volatile
	line	224
;function.c: 224: RA1=0;
	bcf	(41/8),(41)&7	;volatile
	line	225
;function.c: 225: break;
	goto	l835
	line	226
;function.c: 226: case LM_white_1Hz:
	
l810:	
	line	227
;function.c: 227: RB4=1;
	bsf	(52/8),(52)&7	;volatile
	line	228
;function.c: 228: if (gbLed1hz) {
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1821
	goto	u1820
u1821:
	goto	l811
u1820:
	line	229
	
l7907:	
;function.c: 229: RA1=0;
	bcf	(41/8),(41)&7	;volatile
	line	230
;function.c: 230: } else {
	goto	l835
	
l811:	
	line	231
;function.c: 231: RA1=1;
	bsf	(41/8),(41)&7	;volatile
	goto	l835
	line	234
;function.c: 234: case LM_white_2Hz:
	
l813:	
	line	235
;function.c: 235: RB4=1;
	bsf	(52/8),(52)&7	;volatile
	line	236
;function.c: 236: if (gbLed2hz) {
	btfss	(_gbLed2hz/8),(_gbLed2hz)&7
	goto	u1831
	goto	u1830
u1831:
	goto	l811
u1830:
	goto	l7907
	line	242
;function.c: 242: case LM_white_1Hz_3T:
	
l816:	
	line	243
;function.c: 243: RB4=1;
	bsf	(52/8),(52)&7	;volatile
	line	244
;function.c: 244: if (gbLed1hz) {
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1841
	goto	u1840
u1841:
	goto	l811
u1840:
	goto	l7907
	line	250
;function.c: 250: case LM_Red_1HZ_3T:
	
l819:	
	line	251
;function.c: 251: if (gbLed1hz){
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1851
	goto	u1850
u1851:
	goto	l820
u1850:
	line	252
	
l7913:	
;function.c: 252: RB4=0;
	bcf	(52/8),(52)&7	;volatile
	line	253
;function.c: 253: } else {
	goto	l811
	
l820:	
	line	254
;function.c: 254: RB4=1;
	bsf	(52/8),(52)&7	;volatile
	goto	l811
	line	258
;function.c: 258: case LM_white_1HZ_5T:
	
l822:	
	line	259
;function.c: 259: RB4=1;
	bsf	(52/8),(52)&7	;volatile
	line	260
;function.c: 260: if (gbLed2hz){
	btfss	(_gbLed2hz/8),(_gbLed2hz)&7
	goto	u1861
	goto	u1860
u1861:
	goto	l811
u1860:
	goto	l7907
	line	266
;function.c: 266: case LM_Red_1HZ_10T:
	
l825:	
	line	267
;function.c: 267: if (gbLed1hz){
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1871
	goto	u1870
u1871:
	goto	l820
u1870:
	goto	l7913
	line	274
;function.c: 274: case LM_Red_2HZ_10T:
	
l828:	
	line	275
;function.c: 275: if (gbLed2hz){
	btfss	(_gbLed2hz/8),(_gbLed2hz)&7
	goto	u1881
	goto	u1880
u1881:
	goto	l820
u1880:
	goto	l7913
	line	283
;function.c: 283: case LM_Redwhite_1HZ_1T:
	
l831:	
	line	284
;function.c: 284: if (gbLed1hz){
	btfss	(_gbLed1hz/8),(_gbLed1hz)&7
	goto	u1891
	goto	u1890
u1891:
	goto	l809
u1890:
	goto	l808
	line	212
	
l7925:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ledMode),w
	; Switch size 1, requested type "speed"
; Number of cases is 11, Range of values is 0 to 10
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           29     7 (fixed)
; simple_byte           34    18 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	11
	subwf	fsr,w
skipnc
goto l835
movlw high(S8227)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S8227)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S8227:
	ljmp	l806
	ljmp	l808
	ljmp	l809
	ljmp	l810
	ljmp	l813
	ljmp	l816
	ljmp	l819
	ljmp	l822
	ljmp	l825
	ljmp	l828
	ljmp	l831
psect	text20

	line	296
	
l835:	
	return
	opt stack 0
GLOBAL	__end_of_LED_Display
	__end_of_LED_Display:
	signat	_LED_Display,89
	global	_KEY_WorkDriver

;; *************** function _KEY_WorkDriver *****************
;; Defined at:
;;		line 107 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=0
	line	107
global __ptext21
__ptext21:	;psect for function _KEY_WorkDriver
psect	text21
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
	line	107
	global	__size_of_KEY_WorkDriver
	__size_of_KEY_WorkDriver	equ	__end_of_KEY_WorkDriver-_KEY_WorkDriver
	
_KEY_WorkDriver:	
;incstack = 0
	opt	stack 6
; Regs used in _KEY_WorkDriver: [wreg+status,2+status,0]
	line	109
	
l7815:	
;function.c: 109: if (key.sw1Index == 1){
		decf	(0+(_key)+01h),w
	btfss	status,2
	goto	u1611
	goto	u1610
u1611:
	goto	l7819
u1610:
	line	110
	
l7817:	
;function.c: 110: timer.sw1Cnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	skipnz
	incf	(_timer+1)^080h,f
	line	112
;function.c: 112: }else{
	goto	l7821
	line	113
	
l7819:	
;function.c: 113: timer.sw1Cnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_timer)^080h
	clrf	(_timer+1)^080h
	line	116
	
l7821:	
;function.c: 115: }
;function.c: 116: if (timer.sw1Cnt>300 && workMode==WM_Poweroff){
	movlw	01h
	subwf	(_timer+1)^080h,w
	movlw	02Dh
	skipnz
	subwf	(_timer)^080h,w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l765
u1620:
	
l7823:	
	bcf	status, 5	;RP0=0, select bank0
	movf	((_workMode)),w
	btfss	status,2
	goto	u1631
	goto	u1630
u1631:
	goto	l765
u1630:
	line	117
	
l7825:	
;function.c: 117: timer.stanbyCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+04h
	clrf	1+(_timer)^080h+04h
	line	118
	
l7827:	
;function.c: 118: work.inWorkIndex = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_work)
	incf	(_work),f
	line	119
	
l7829:	
;function.c: 119: ledMode = LM_white_On;
	movlw	low(02h)
	movwf	(_ledMode)
	line	120
	
l7831:	
;function.c: 120: workMode = WM_Standby;
	clrf	(_workMode)
	incf	(_workMode),f
	line	124
	
l765:	
	return
	opt stack 0
GLOBAL	__end_of_KEY_WorkDriver
	__end_of_KEY_WorkDriver:
	signat	_KEY_WorkDriver,89
	global	_KEY_Driver

;; *************** function _KEY_Driver *****************
;; Defined at:
;;		line 61 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=0
	line	61
global __ptext22
__ptext22:	;psect for function _KEY_Driver
psect	text22
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
	line	61
	global	__size_of_KEY_Driver
	__size_of_KEY_Driver	equ	__end_of_KEY_Driver-_KEY_Driver
	
_KEY_Driver:	
;incstack = 0
	opt	stack 6
; Regs used in _KEY_Driver: [wreg+status,2+status,0]
	line	64
	
l7767:	
;function.c: 64: if (key.sw1Temp > 250){
	movlw	low(0FBh)
	subwf	(_key),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l7771
u1490:
	line	65
	
l7769:	
;function.c: 65: key.sw1Temp = 250;
	movlw	low(0FAh)
	movwf	(_key)
	line	69
	
l7771:	
;function.c: 66: }
;function.c: 69: if ((RA3==0) && (RB5==1) && timer.ledStopCnt==0){
	btfsc	(43/8),(43)&7	;volatile
	goto	u1501
	goto	u1500
u1501:
	goto	l7785
u1500:
	
l7773:	
	btfss	(53/8),(53)&7	;volatile
	goto	u1511
	goto	u1510
u1511:
	goto	l7785
u1510:
	
l7775:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_timer)^080h+0Ch),w
iorwf	(1+(_timer)^080h+0Ch),w
	btfss	status,2
	goto	u1521
	goto	u1520
u1521:
	goto	l7785
u1520:
	line	70
	
l7777:	
;function.c: 70: key.sw1Temp++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_key),f
	line	71
	
l7779:	
;function.c: 71: if (key.sw1Temp == 2){
		movlw	2
	xorwf	((_key)),w
	btfss	status,2
	goto	u1531
	goto	u1530
u1531:
	goto	l7787
u1530:
	line	72
	
l7781:	
;function.c: 72: key.sw1Index = 1;
	clrf	0+(_key)+01h
	incf	0+(_key)+01h,f
	line	73
	
l7783:	
;function.c: 73: sleep10sTimeCnt = 0;
	clrf	(_sleep10sTimeCnt)
	clrf	(_sleep10sTimeCnt+1)
	goto	l7787
	line	76
	
l7785:	
;function.c: 76: key.sw1Temp = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_key)
	line	77
;function.c: 77: key.sw1Index = 0;
	clrf	0+(_key)+01h
	line	82
	
l7787:	
;function.c: 78: }
;function.c: 82: if (key.sw2Temp > 250){
	movlw	low(0FBh)
	subwf	0+(_key)+02h,w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l7791
u1540:
	line	83
	
l7789:	
;function.c: 83: key.sw2Temp = 250;
	movlw	low(0FAh)
	movwf	0+(_key)+02h
	line	85
	
l7791:	
;function.c: 84: }
;function.c: 85: if ((RB5==0) && (RA3==1) && timer.ledStopCnt==0){
	btfsc	(53/8),(53)&7	;volatile
	goto	u1551
	goto	u1550
u1551:
	goto	l7809
u1550:
	
l7793:	
	btfss	(43/8),(43)&7	;volatile
	goto	u1561
	goto	u1560
u1561:
	goto	l7809
u1560:
	
l7795:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(0+(_timer)^080h+0Ch),w
iorwf	(1+(_timer)^080h+0Ch),w
	btfss	status,2
	goto	u1571
	goto	u1570
u1571:
	goto	l7809
u1570:
	line	86
	
l7797:	
;function.c: 86: key.sw2Temp++;
	bcf	status, 5	;RP0=0, select bank0
	incf	0+(_key)+02h,f
	line	87
	
l7799:	
;function.c: 87: sleep10sTimeCnt = 0;
	clrf	(_sleep10sTimeCnt)
	clrf	(_sleep10sTimeCnt+1)
	line	88
	
l7801:	
;function.c: 88: if (key.sw2Temp == 2){
		movlw	2
	xorwf	(0+(_key)+02h),w
	btfss	status,2
	goto	u1581
	goto	u1580
u1581:
	goto	l7811
u1580:
	line	89
	
l7803:	
;function.c: 89: key.sw2Index = 1;
	clrf	0+(_key)+03h
	incf	0+(_key)+03h,f
	line	90
	
l7805:	
;function.c: 90: if (workMode != WM_Standby){
		decf	((_workMode)),w
	btfsc	status,2
	goto	u1591
	goto	u1590
u1591:
	goto	l7811
u1590:
	line	91
	
l7807:	
;function.c: 91: ledMode = LM_Red_1HZ_3T;
	movlw	low(06h)
	movwf	(_ledMode)
	goto	l7811
	line	95
	
l7809:	
;function.c: 95: key.sw2Index = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	0+(_key)+03h
	line	97
	
l7811:	
;function.c: 96: }
;function.c: 97: if ((RB5==1)){
	btfss	(53/8),(53)&7	;volatile
	goto	u1601
	goto	u1600
u1601:
	goto	l759
u1600:
	line	98
	
l7813:	
;function.c: 98: key.sw2Temp = 0;
	clrf	0+(_key)+02h
	line	101
	
l759:	
	return
	opt stack 0
GLOBAL	__end_of_KEY_Driver
	__end_of_KEY_Driver:
	signat	_KEY_Driver,89
	global	_CUP_USB_Driver

;; *************** function _CUP_USB_Driver *****************
;; Defined at:
;;		line 131 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 300/300
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	line	131
global __ptext23
__ptext23:	;psect for function _CUP_USB_Driver
psect	text23
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\function.c"
	line	131
	global	__size_of_CUP_USB_Driver
	__size_of_CUP_USB_Driver	equ	__end_of_CUP_USB_Driver-_CUP_USB_Driver
	
_CUP_USB_Driver:	
;incstack = 0
	opt	stack 6
; Regs used in _CUP_USB_Driver: [wreg+status,2]
	line	134
	
l7833:	
;function.c: 134: if ((RB0==0) && 1==usbIndex){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7	;volatile
	goto	u1641
	goto	u1640
u1641:
	goto	l772
u1640:
	
l7835:	
	btfss	(_usbIndex/8),(_usbIndex)&7
	goto	u1651
	goto	u1650
u1651:
	goto	l772
u1650:
	line	135
	
l7837:	
;function.c: 135: charDisplayCnt = 100;
	movlw	064h
	movwf	(_charDisplayCnt)
	clrf	(_charDisplayCnt+1)
	line	136
	
l7839:	
;function.c: 136: usbIndex = 0;
	bcf	(_usbIndex/8),(_usbIndex)&7
	line	137
;function.c: 137: workMode = WM_Charge;
	movlw	low(04h)
	movwf	(_workMode)
	line	138
	
l7841:	
;function.c: 138: timer.ledStopTime = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_timer)^080h+0Ah
	clrf	1+(_timer)^080h+0Ah
	line	139
	
l7843:	
;function.c: 139: ledMode = LM_Red_On;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ledMode)
	incf	(_ledMode),f
	line	140
	
l7845:	
;function.c: 140: charPeriod = 0;
	clrf	(_charPeriod)
	line	141
;function.c: 141: }else if ((RB0==1) && 0==usbIndex){
	goto	l776
	
l772:	
	btfss	(48/8),(48)&7	;volatile
	goto	u1661
	goto	u1660
u1661:
	goto	l776
u1660:
	
l7847:	
	btfsc	(_usbIndex/8),(_usbIndex)&7
	goto	u1671
	goto	u1670
u1671:
	goto	l776
u1670:
	line	142
	
l7849:	
;function.c: 142: usbIndex = 1;
	bsf	(_usbIndex/8),(_usbIndex)&7
	line	143
;function.c: 143: workMode = WM_Standby;
	clrf	(_workMode)
	incf	(_workMode),f
	line	149
;function.c: 144: }else{
	
l776:	
	return
	opt stack 0
GLOBAL	__end_of_CUP_USB_Driver
	__end_of_CUP_USB_Driver:
	signat	_CUP_USB_Driver,89
	global	_ADC_Driver

;; *************** function _ADC_Driver *****************
;; Defined at:
;;		line 154 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   19[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 300/300
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_ADC_Sample
;;		___lldiv
;;		___lmul
;;		___lwdiv
;;		___wmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
	line	154
global __ptext24
__ptext24:	;psect for function _ADC_Driver
psect	text24
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
	line	154
	global	__size_of_ADC_Driver
	__size_of_ADC_Driver	equ	__end_of_ADC_Driver-_ADC_Driver
	
_ADC_Driver:	
;incstack = 0
	opt	stack 5
; Regs used in _ADC_Driver: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	157
	
l7963:	
;mcu_adc.c: 156: u8 i;
;mcu_adc.c: 157: if (adc.chIndex > 3){
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(_adc)+02h,w
	skipc
	goto	u1931
	goto	u1930
u1931:
	goto	l7981
u1930:
	line	158
	
l7965:	
;mcu_adc.c: 158: adc.chIndex = 0;
	clrf	0+(_adc)+02h
	goto	l7981
	line	164
	
l7967:	
;mcu_adc.c: 164: adc.chAisle = 2;
	movlw	low(02h)
	movwf	0+(_adc)+01h
	line	165
	
l7969:	
;mcu_adc.c: 165: TRISA2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1066/8)^080h,(1066)&7	;volatile
	line	166
	
l7971:	
;mcu_adc.c: 166: ANSEL |=0X04;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(392)^0180h+(2/8),(2)&7	;volatile
	line	167
;mcu_adc.c: 167: break;
	goto	l7983
	line	168
;mcu_adc.c: 168: case 1:
	
l3156:	
	line	169
;mcu_adc.c: 169: TRISA4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1068/8)^080h,(1068)&7	;volatile
	line	170
;mcu_adc.c: 170: ANSEL |=0X08;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(392)^0180h+(3/8),(3)&7	;volatile
	line	171
	
l7973:	
;mcu_adc.c: 171: adc.chAisle = 4;
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_adc)+01h
	line	172
;mcu_adc.c: 172: break;
	goto	l7983
	line	173
;mcu_adc.c: 173: case 2:
	
l3157:	
	line	174
;mcu_adc.c: 174: TRISA5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1069/8)^080h,(1069)&7	;volatile
	line	175
;mcu_adc.c: 175: ANSEL |=0X20;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(392)^0180h+(5/8),(5)&7	;volatile
	line	176
	
l7975:	
;mcu_adc.c: 176: adc.chAisle = 5;
	movlw	low(05h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_adc)+01h
	line	177
;mcu_adc.c: 177: break;
	goto	l7983
	line	178
;mcu_adc.c: 178: case 3:
	
l3158:	
	line	179
;mcu_adc.c: 179: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1073/8)^080h,(1073)&7	;volatile
	line	180
;mcu_adc.c: 180: ANSELH |=0X01;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(393)^0180h+(0/8),(0)&7	;volatile
	line	181
	
l7977:	
;mcu_adc.c: 181: adc.chAisle = 12;
	movlw	low(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_adc)+01h
	line	182
;mcu_adc.c: 182: break;
	goto	l7983
	line	161
	
l7981:	
	movf	0+(_adc)+02h,w
	; Switch size 1, requested type "speed"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l7967
	xorlw	1^0	; case 1
	skipnz
	goto	l3156
	xorlw	2^1	; case 2
	skipnz
	goto	l3157
	xorlw	3^2	; case 3
	skipnz
	goto	l3158
	goto	l7983
	opt asmopt_pop

	line	186
	
l7983:	
;mcu_adc.c: 186: for (i = 0; i < 10; i++){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(ADC_Driver@i)
	line	187
	
l7989:	
;mcu_adc.c: 187: if (i < 2){
	movlw	low(02h)
	subwf	(ADC_Driver@i),w
	skipnc
	goto	u1941
	goto	u1940
u1941:
	goto	l7995
u1940:
	line	188
	
l7991:	
;mcu_adc.c: 188: adc.adcBufferTemp = 0;
	clrf	0+(_adc)+05h
	clrf	1+(_adc)+05h
	line	189
	
l7993:	
;mcu_adc.c: 189: ADC_Sample(adc.chAisle);
	movf	0+(_adc)+01h,w
	fcall	_ADC_Sample
	line	190
;mcu_adc.c: 190: }else{
	goto	l7997
	line	191
	
l7995:	
;mcu_adc.c: 191: ADC_Sample(adc.chAisle);
	movf	0+(_adc)+01h,w
	fcall	_ADC_Sample
	line	186
	
l7997:	
	incf	(ADC_Driver@i),f
	
l7999:	
	movlw	low(0Ah)
	subwf	(ADC_Driver@i),w
	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l7989
u1950:
	line	194
	
l8001:	
;mcu_adc.c: 192: }
;mcu_adc.c: 193: }
;mcu_adc.c: 194: if (++adc.index >= 16){
	movlw	low(010h)
	incf	(_adc),f
	subwf	((_adc)),w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l8035
u1960:
	line	195
	
l8003:	
;mcu_adc.c: 195: adc.index = 0;
	clrf	(_adc)
	line	196
;mcu_adc.c: 196: switch (adc.chIndex)
	goto	l8031
	line	199
	
l8005:	
;mcu_adc.c: 199: adc.aVolTemp = ((u32)adc.adcBufferTemp*3532)/10000-3;
	movlw	0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	027h
	movwf	(___lldiv@divisor+1)
	movlw	010h
	movwf	(___lldiv@divisor)

	movf	0+(_adc)+05h,w
	movwf	(___lmul@multiplier)
	movf	1+(_adc)+05h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	0Dh
	movwf	(___lmul@multiplicand+1)
	movlw	0CCh
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(0+(?___lldiv)),w
	addlw	low(0FFFDh)
	movwf	0+(_adc)+016h
	movf	(1+(?___lldiv)),w
	skipnc
	addlw	1
	addlw	high(0FFFDh)
	movwf	1+0+(_adc)+016h
	line	200
;mcu_adc.c: 200: adc.batTotal = ((u32)adc.adcBufferTemp*3532)/10000-3;
	movlw	0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	027h
	movwf	(___lldiv@divisor+1)
	movlw	010h
	movwf	(___lldiv@divisor)

	movf	0+(_adc)+05h,w
	movwf	(___lmul@multiplier)
	movf	1+(_adc)+05h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	0Dh
	movwf	(___lmul@multiplicand+1)
	movlw	0CCh
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(0+(?___lldiv)),w
	addlw	low(0FFFDh)
	movwf	0+(_adc)+08h
	movf	(1+(?___lldiv)),w
	skipnc
	addlw	1
	addlw	high(0FFFDh)
	movwf	1+0+(_adc)+08h
	line	201
	
l8007:	
;mcu_adc.c: 201: adc.aVolBank = adc.aVolTemp;
	movf	1+(_adc)+016h,w
	movwf	1+(_adc)+019h
	movf	0+(_adc)+016h,w
	movwf	0+(_adc)+019h
	line	204
	
l8009:	
;mcu_adc.c: 204: if (adc.volCnt>10 || adc.volCnt<1){
	movlw	low(0Bh)
	subwf	0+(_adc)+018h,w
	skipnc
	goto	u1971
	goto	u1970
u1971:
	goto	l8013
u1970:
	
l8011:	
	movf	(0+(_adc)+018h),w
	btfss	status,2
	goto	u1981
	goto	u1980
u1981:
	goto	l3167
u1980:
	line	205
	
l8013:	
;mcu_adc.c: 205: adc.volCnt = 5;
	movlw	low(05h)
	movwf	0+(_adc)+018h
	line	206
	
l3167:	
	line	207
;mcu_adc.c: 206: }
;mcu_adc.c: 207: if (adc.aVolTemp > adc.aVolBank){
	movf	1+(_adc)+016h,w
	subwf	1+(_adc)+019h,w
	skipz
	goto	u1995
	movf	0+(_adc)+016h,w
	subwf	0+(_adc)+019h,w
u1995:
	skipnc
	goto	u1991
	goto	u1990
u1991:
	goto	l8017
u1990:
	line	208
	
l8015:	
;mcu_adc.c: 208: adc.volCnt++;
	incf	0+(_adc)+018h,f
	line	209
;mcu_adc.c: 209: }else if(adc.aVolTemp < adc.aVolBank){
	goto	l8033
	
l8017:	
	movf	1+(_adc)+019h,w
	subwf	1+(_adc)+016h,w
	skipz
	goto	u2005
	movf	0+(_adc)+019h,w
	subwf	0+(_adc)+016h,w
u2005:
	skipnc
	goto	u2001
	goto	u2000
u2001:
	goto	l8033
u2000:
	line	210
	
l8019:	
;mcu_adc.c: 210: adc.volCnt--;
	decf	0+(_adc)+018h,f
	goto	l8033
	line	215
	
l8021:	
;mcu_adc.c: 215: adc.batV2 = ((u32)adc.adcBufferTemp*3532)/10000-3;
	movlw	0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	027h
	movwf	(___lldiv@divisor+1)
	movlw	010h
	movwf	(___lldiv@divisor)

	movf	0+(_adc)+05h,w
	movwf	(___lmul@multiplier)
	movf	1+(_adc)+05h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	0Dh
	movwf	(___lmul@multiplicand+1)
	movlw	0CCh
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(0+(?___lldiv)),w
	addlw	low(0FFFDh)
	movwf	0+(_adc)+0Ch
	movf	(1+(?___lldiv)),w
	skipnc
	addlw	1
	addlw	high(0FFFDh)
	movwf	1+0+(_adc)+0Ch
	line	216
;mcu_adc.c: 216: break;
	goto	l8033
	line	218
	
l8023:	
;mcu_adc.c: 218: adc.batILoad= adc.adcBufferTemp;
	movf	1+(_adc)+05h,w
	movwf	1+(_adc)+0Eh
	movf	0+(_adc)+05h,w
	movwf	0+(_adc)+0Eh
	line	219
;mcu_adc.c: 219: break;
	goto	l8033
	line	223
	
l8025:	
;mcu_adc.c: 223: adc.adcBuffer = (adc.adcBufferTemp*277)+1000;
	movf	1+(_adc)+05h,w
	movwf	(___wmul@multiplier+1)
	movf	0+(_adc)+05h,w
	movwf	(___wmul@multiplier)
	movlw	015h
	movwf	(___wmul@multiplicand)
	movlw	01h
	movwf	((___wmul@multiplicand))+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addlw	low(03E8h)
	movwf	0+(_adc)+03h
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(03E8h)
	movwf	1+0+(_adc)+03h
	line	224
;mcu_adc.c: 224: adc.batCharBank = adc.adcBuffer/100-5;
	movlw	064h
	movwf	(___lwdiv@divisor)
	clrf	(___lwdiv@divisor+1)
	movf	1+(_adc)+03h,w
	movwf	(___lwdiv@dividend+1)
	movf	0+(_adc)+03h,w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(0FFFBh)
	movwf	0+(_adc)+012h
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(0FFFBh)
	movwf	1+0+(_adc)+012h
	line	225
	
l8027:	
;mcu_adc.c: 225: adc.batChar = adc.batCharBank/2;
	movlw	low(012h)
	addlw	low(_adc|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_ADC_Driver+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADC_Driver+0)+0+1
	clrc
	rrf	(??_ADC_Driver+0)+1,f
	rrf	(??_ADC_Driver+0)+0,f
	movf	0+(??_ADC_Driver+0)+0,w
	movwf	0+(_adc)+010h
	movf	1+(??_ADC_Driver+0)+0,w
	movwf	1+(_adc)+010h
	line	227
;mcu_adc.c: 227: break;
	goto	l8033
	line	196
	
l8031:	
	movf	0+(_adc)+02h,w
	; Switch size 1, requested type "speed"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l8005
	xorlw	1^0	; case 1
	skipnz
	goto	l8021
	xorlw	2^1	; case 2
	skipnz
	goto	l8023
	xorlw	3^2	; case 3
	skipnz
	goto	l8025
	goto	l8033
	opt asmopt_pop

	line	230
	
l8033:	
;mcu_adc.c: 230: adc.chIndex++;
	incf	0+(_adc)+02h,f
	line	232
	
l8035:	
;mcu_adc.c: 231: }
;mcu_adc.c: 232: adc.batV1 = adc.batTotal-adc.batV2;
	movf	0+(_adc)+0Ch,w
	subwf	0+(_adc)+08h,w
	movwf	0+(_adc)+0Ah
	movf	1+(_adc)+0Ch,w
	skipc
	incf	1+(_adc)+0Ch,w
	subwf	1+(_adc)+08h,w
	movwf	1+0+(_adc)+0Ah
	line	233
	
l8037:	
;mcu_adc.c: 233: ANSEL = 0x00;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	234
	
l8039:	
;mcu_adc.c: 234: ANSELH = 0x00;
	clrf	(393)^0180h	;volatile
	line	237
	
l3178:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Driver
	__end_of_ADC_Driver:
	signat	_ADC_Driver,89
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    2[COMMON] unsigned int 
;;  multiplicand    2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    6[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADC_Driver
;; This function uses a non-reentrant model
;;
psect	text25,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\Umul16.c"
	line	15
global __ptext25
__ptext25:	;psect for function ___wmul
psect	text25
	file	"C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
;incstack = 0
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	43
	
l7687:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	45
	
l7689:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u1361
	goto	u1360
u1361:
	goto	l7693
u1360:
	line	46
	
l7691:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	47
	
l7693:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	48
	
l7695:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	49
	
l7697:	
	movf	((___wmul@multiplier)),w
iorwf	((___wmul@multiplier+1)),w
	btfss	status,2
	goto	u1371
	goto	u1370
u1371:
	goto	l7689
u1370:
	line	52
	
l7699:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	53
	
l6380:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    2[COMMON] unsigned int 
;;  dividend        2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[COMMON] unsigned int 
;;  counter         1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADC_Driver
;; This function uses a non-reentrant model
;;
psect	text26,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\lwdiv.c"
	line	6
global __ptext26
__ptext26:	;psect for function ___lwdiv
psect	text26
	file	"C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l7741:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l7743:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u1451
	goto	u1450
u1451:
	goto	l7763
u1450:
	line	16
	
l7745:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l7749
	line	18
	
l7747:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
l7749:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u1461
	goto	u1460
u1461:
	goto	l7747
u1460:
	line	22
	
l7751:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
l7753:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u1475
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u1475:
	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l7759
u1470:
	line	24
	
l7755:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l7757:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
l7759:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
l7761:	
	decfsz	(___lwdiv@counter),f
	goto	u1481
	goto	u1480
u1481:
	goto	l7751
u1480:
	line	30
	
l7763:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
l6722:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    2[COMMON] unsigned long 
;;  multiplicand    4    6[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    0[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    2[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         8       4       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADC_Driver
;; This function uses a non-reentrant model
;;
psect	text27,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\Umul32.c"
	line	15
global __ptext27
__ptext27:	;psect for function ___lmul
psect	text27
	file	"C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 5
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
l7703:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
l6389:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u1381
	goto	u1380
u1381:
	goto	l7707
u1380:
	line	122
	
l7705:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1391
	addwf	(___lmul@product+1),f
u1391:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1392
	addwf	(___lmul@product+2),f
u1392:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1393
	addwf	(___lmul@product+3),f
u1393:

	line	123
	
l7707:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
l7709:	
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	125
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l6389
u1400:
	line	128
	
l7711:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
l6392:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 6 in file "C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    4[BANK0 ] unsigned long 
;;  dividend        4    8[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   12[BANK0 ] unsigned long 
;;  counter         1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    4[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADC_Driver
;; This function uses a non-reentrant model
;;
psect	text28,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\lldiv.c"
	line	6
global __ptext28
__ptext28:	;psect for function ___lldiv
psect	text28
	file	"C:\Program Files (x86)\SCMCU_IDE_V2.00.07\data\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 5
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
l7715:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
l7717:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u1411
	goto	u1410
u1411:
	goto	l7737
u1410:
	line	16
	
l7719:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	l7723
	line	18
	
l7721:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
l7723:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u1421
	goto	u1420
u1421:
	goto	l7721
u1420:
	line	22
	
l7725:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
l7727:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u1435
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u1435
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u1435
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u1435:
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l7733
u1430:
	line	24
	
l7729:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	25
	
l7731:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
l7733:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
l7735:	
	decfsz	(___lldiv@counter),f
	goto	u1441
	goto	u1440
u1441:
	goto	l7725
u1440:
	line	30
	
l7737:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
l6669:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_ADC_Sample

;; *************** function _ADC_Sample *****************
;; Defined at:
;;		line 103 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    6[COMMON] unsigned char 
;;  ad_temp         2    8[COMMON] volatile unsigned int 
;;  i               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADC_Driver
;; This function uses a non-reentrant model
;;
psect	text29,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
	line	103
global __ptext29
__ptext29:	;psect for function _ADC_Sample
psect	text29
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
	line	103
	global	__size_of_ADC_Sample
	__size_of_ADC_Sample	equ	__end_of_ADC_Sample-_ADC_Sample
	
_ADC_Sample:	
;incstack = 0
	opt	stack 5
; Regs used in _ADC_Sample: [wreg+status,2+status,0]
;ADC_Sample@adch stored from wreg
	movwf	(ADC_Sample@adch)
	line	110
	
l7645:	
;mcu_adc.c: 105: static unsigned long adsum = 0;
;mcu_adc.c: 106: static unsigned int admin = 0,admax = 0;
;mcu_adc.c: 107: static unsigned char adtimes = 0;
;mcu_adc.c: 108: volatile unsigned int ad_temp;
;mcu_adc.c: 110: ADCON1 = 0B00000100;
	movlw	low(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	111
	
l7647:	
;mcu_adc.c: 111: ADCON0 = 0X41 | (adch << 2);
	movf	(ADC_Sample@adch),w
	movwf	(??_ADC_Sample+0)+0
	movlw	(02h)-1
u1245:
	clrc
	rlf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u1245
	clrc
	rlf	(??_ADC_Sample+0)+0,w
	iorlw	041h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	112
# 112 "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
nop ;# 
	line	113
# 113 "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_adc.c"
nop ;# 
psect	text29
	line	114
	
l7649:	
;mcu_adc.c: 114: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7	;volatile
	line	116
	
l7651:	
;mcu_adc.c: 116: unsigned char i = 0;
	clrf	(ADC_Sample@i)
	line	117
;mcu_adc.c: 117: while(GODONE)
	goto	l3137
	
l3138:	
	line	119
;mcu_adc.c: 118: {
;mcu_adc.c: 119: if(0 == (--i))
	decfsz	(ADC_Sample@i),f
	goto	u1251
	goto	u1250
u1251:
	goto	l3137
u1250:
	goto	l3140
	line	121
	
l3137:	
	line	117
	btfsc	(249/8),(249)&7	;volatile
	goto	u1261
	goto	u1260
u1261:
	goto	l3138
u1260:
	line	123
	
l7655:	
;mcu_adc.c: 121: }
;mcu_adc.c: 123: ad_temp=(ADRESH<<4)+(ADRESL>>4);
	movf	(30),w	;volatile
	movwf	(ADC_Sample@ad_temp)	;volatile
	clrf	(ADC_Sample@ad_temp+1)	;volatile
	swapf	(ADC_Sample@ad_temp),f	;volatile
	swapf	(ADC_Sample@ad_temp+1),f	;volatile
	movlw	0f0h
	andwf	(ADC_Sample@ad_temp+1),f	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	andlw	0fh
	iorwf	(ADC_Sample@ad_temp+1),f	;volatile
	movlw	0f0h
	andwf	(ADC_Sample@ad_temp),f	;volatile
	
l7657:	
	bsf	status, 5	;RP0=1, select bank1
	swapf	(158)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	addwf	(ADC_Sample@ad_temp),f	;volatile
	skipnc
	incf	(ADC_Sample@ad_temp+1),f	;volatile
	line	125
	
l7659:	
;mcu_adc.c: 125: if(0 == admax)
	bcf	status, 5	;RP0=0, select bank0
	movf	((ADC_Sample@admax)),w
iorwf	((ADC_Sample@admax+1)),w
	btfss	status,2
	goto	u1271
	goto	u1270
u1271:
	goto	l7663
u1270:
	line	127
	
l7661:	
;mcu_adc.c: 126: {
;mcu_adc.c: 127: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)
	line	128
;mcu_adc.c: 128: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)
	line	129
;mcu_adc.c: 129: }
	goto	l3143
	line	130
	
l7663:	
;mcu_adc.c: 130: else if(ad_temp > admax)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	subwf	(ADC_Sample@admax+1),w
	skipz
	goto	u1285
	movf	(ADC_Sample@ad_temp),w	;volatile
	subwf	(ADC_Sample@admax),w
u1285:
	skipnc
	goto	u1281
	goto	u1280
u1281:
	goto	l7667
u1280:
	line	131
	
l7665:	
;mcu_adc.c: 131: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)
	goto	l3143
	line	132
	
l7667:	
;mcu_adc.c: 132: else if(ad_temp < admin)
	movf	(ADC_Sample@admin+1),w
	subwf	(ADC_Sample@ad_temp+1),w	;volatile
	skipz
	goto	u1295
	movf	(ADC_Sample@admin),w
	subwf	(ADC_Sample@ad_temp),w	;volatile
u1295:
	skipnc
	goto	u1291
	goto	u1290
u1291:
	goto	l3143
u1290:
	line	133
	
l7669:	
;mcu_adc.c: 133: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)
	line	135
	
l3143:	
;mcu_adc.c: 135: adsum += ad_temp;
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(ADC_Sample@adsum)^080h,f
	movf	1+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1301
	addwf	(ADC_Sample@adsum+1)^080h,f
u1301:
	movf	2+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1302
	addwf	(ADC_Sample@adsum+2)^080h,f
u1302:
	movf	3+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1303
	addwf	(ADC_Sample@adsum+3)^080h,f
u1303:

	line	136
	
l7671:	
;mcu_adc.c: 136: if(++adtimes >= 10)
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	incf	(ADC_Sample@adtimes),f
	subwf	((ADC_Sample@adtimes)),w
	skipc
	goto	u1311
	goto	u1310
u1311:
	goto	l3140
u1310:
	line	138
	
l7673:	
;mcu_adc.c: 137: {
;mcu_adc.c: 138: adsum -= admax;
	movf	(ADC_Sample@admax),w
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admax+1),w
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(ADC_Sample@adsum)^080h,f
	movf	1+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	1+(??_ADC_Sample+0)+0,w
	goto	u1325
	goto	u1326
u1325:
	subwf	(ADC_Sample@adsum+1)^080h,f
u1326:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u1327
	goto	u1328
u1327:
	subwf	(ADC_Sample@adsum+2)^080h,f
u1328:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u1329
	goto	u1320
u1329:
	subwf	(ADC_Sample@adsum+3)^080h,f
u1320:

	line	139
;mcu_adc.c: 139: if(adsum >= admin) adsum -= admin;
	bcf	status, 5	;RP0=0, select bank0
	movf	(ADC_Sample@admin),w
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	3+(??_ADC_Sample+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(ADC_Sample@adsum+3)^080h,w
	skipz
	goto	u1335
	movf	2+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+2)^080h,w
	skipz
	goto	u1335
	movf	1+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+1)^080h,w
	skipz
	goto	u1335
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum)^080h,w
u1335:
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l3148
u1330:
	
l7675:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(ADC_Sample@admin),w
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(ADC_Sample@adsum)^080h,f
	movf	1+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	1+(??_ADC_Sample+0)+0,w
	goto	u1345
	goto	u1346
u1345:
	subwf	(ADC_Sample@adsum+1)^080h,f
u1346:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u1347
	goto	u1348
u1347:
	subwf	(ADC_Sample@adsum+2)^080h,f
u1348:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u1349
	goto	u1340
u1349:
	subwf	(ADC_Sample@adsum+3)^080h,f
u1340:

	goto	l7677
	line	140
	
l3148:	
;mcu_adc.c: 140: else adsum = 0;
	clrf	(ADC_Sample@adsum)^080h
	clrf	(ADC_Sample@adsum+1)^080h
	clrf	(ADC_Sample@adsum+2)^080h
	clrf	(ADC_Sample@adsum+3)^080h
	line	142
	
l7677:	
;mcu_adc.c: 142: adc.adcBufferTemp = adsum >> 3;
	movf	(ADC_Sample@adsum)^080h,w
	movwf	(??_ADC_Sample+0)+0
	movf	(ADC_Sample@adsum+1)^080h,w
	movwf	((??_ADC_Sample+0)+0+1)
	movf	(ADC_Sample@adsum+2)^080h,w
	movwf	((??_ADC_Sample+0)+0+2)
	movf	(ADC_Sample@adsum+3)^080h,w
	movwf	((??_ADC_Sample+0)+0+3)
	movlw	03h
u1355:
	clrc
	rrf	(??_ADC_Sample+0)+3,f
	rrf	(??_ADC_Sample+0)+2,f
	rrf	(??_ADC_Sample+0)+1,f
	rrf	(??_ADC_Sample+0)+0,f
u1350:
	addlw	-1
	skipz
	goto	u1355
	movf	1+(??_ADC_Sample+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(_adc)+05h
	movf	0+(??_ADC_Sample+0)+0,w
	movwf	0+(_adc)+05h
	line	144
	
l7679:	
;mcu_adc.c: 144: adsum = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(ADC_Sample@adsum)^080h
	clrf	(ADC_Sample@adsum+1)^080h
	clrf	(ADC_Sample@adsum+2)^080h
	clrf	(ADC_Sample@adsum+3)^080h
	line	145
	
l7681:	
;mcu_adc.c: 145: admin = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@admin)
	clrf	(ADC_Sample@admin+1)
	line	146
	
l7683:	
;mcu_adc.c: 146: admax = 0;
	clrf	(ADC_Sample@admax)
	clrf	(ADC_Sample@admax+1)
	line	147
	
l7685:	
;mcu_adc.c: 147: adtimes = 0;
	clrf	(ADC_Sample@adtimes)
	line	149
	
l3140:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Sample
	__end_of_ADC_Sample:
	signat	_ADC_Sample,4217
	global	_ISR

;; *************** function _ISR *****************
;; Defined at:
;;		line 98 in file "F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_int.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text30,local,class=CODE,delta=2,merge=1,group=0
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_int.c"
	line	98
global __ptext30
__ptext30:	;psect for function _ISR
psect	text30
	file	"F:\data\о�lSCMCU\JBQ-B04L1\soft\SOFT\Source\mcu_int.c"
	line	98
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
;incstack = 0
	opt	stack 1
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text30
	line	100
	
i1l8061:	
;mcu_int.c: 100: if (T0IE && T0IF)
	btfss	(93/8),(93)&7	;volatile
	goto	u203_21
	goto	u203_20
u203_21:
	goto	i1l5086
u203_20:
	
i1l8063:	
	btfss	(90/8),(90)&7	;volatile
	goto	u204_21
	goto	u204_20
u204_21:
	goto	i1l5086
u204_20:
	line	102
	
i1l8065:	
;mcu_int.c: 101: {
;mcu_int.c: 102: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	103
	
i1l5086:	
	line	104
;mcu_int.c: 103: }
;mcu_int.c: 104: if (TMR1IE && TMR1IF)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1120/8)^080h,(1120)&7	;volatile
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l5087
u205_20:
	
i1l8067:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7	;volatile
	goto	u206_21
	goto	u206_20
u206_21:
	goto	i1l5087
u206_20:
	line	106
	
i1l8069:	
;mcu_int.c: 105: {
;mcu_int.c: 106: TMR1IF = 0;
	bcf	(96/8),(96)&7	;volatile
	line	107
	
i1l5087:	
	line	109
;mcu_int.c: 107: }
;mcu_int.c: 109: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7	;volatile
	goto	u207_21
	goto	u207_20
u207_21:
	goto	i1l8079
u207_20:
	line	111
	
i1l8071:	
;mcu_int.c: 110: {
;mcu_int.c: 111: TMR2IF = 0;
	bcf	(97/8),(97)&7	;volatile
	line	115
	
i1l8073:	
;mcu_int.c: 115: if (++gTimeCntFor10ms >= 100) {
	movlw	low(064h)
	incf	(_gTimeCntFor10ms),f	;volatile
	subwf	((_gTimeCntFor10ms)),w	;volatile
	skipc
	goto	u208_21
	goto	u208_20
u208_21:
	goto	i1l8079
u208_20:
	line	116
	
i1l8075:	
;mcu_int.c: 116: gTimeCntFor10ms = 0;
	clrf	(_gTimeCntFor10ms)	;volatile
	line	117
	
i1l8077:	
;mcu_int.c: 117: gbTime10ms = 1;
	bsf	(_gbTime10ms/8),(_gbTime10ms)&7
	line	122
	
i1l8079:	
;mcu_int.c: 119: }
;mcu_int.c: 121: }
;mcu_int.c: 122: if(RAIF || RBIF)
	btfsc	(103/8),(103)&7	;volatile
	goto	u209_21
	goto	u209_20
u209_21:
	goto	i1l5092
u209_20:
	
i1l8081:	
	btfss	(88/8),(88)&7	;volatile
	goto	u210_21
	goto	u210_20
u210_21:
	goto	i1l5093
u210_20:
	
i1l5092:	
	line	124
;mcu_int.c: 123: {
;mcu_int.c: 124: RAIF = 0;
	bcf	(103/8),(103)&7	;volatile
	line	125
;mcu_int.c: 125: RBIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	127
	
i1l5093:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
	signat	_ISR,89
global	___latbits
___latbits	equ	1
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
