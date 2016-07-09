
 


; metrowerks sample code



;	interrupt vectors for MC56F801x





	section interrupt_routines
	org	p:
	
MC56F801x_intRoutine:
	debughlt
	nop
	nop
	rti


; illegal instruction interrupt

MC56F801x_illegal:
	debughlt	
	nop
	nop
	rti


; hardware stack overflow interrupt 
	
MC56F801x_HWSOverflow:
	debughlt	
	nop
	nop
	rti
	
	
; misaligned long word access interrupt
	
MC56F801x_misalign:
	debughlt	                     
	nop
	nop
	rti


 ; PLL lost of lock interrupt
 
MC56F801x_PLL:
	debughlt	                    
	nop
	nop 
	rti
	
	
    endsec
    
    
    
    
	section interrupt_vectors
	org	p:
	
	global	FMC56F801x_intVec



FMC56F801x_intVec:

	jsr >Finit_MC56F801x_        ; RESET                                           ($00)
	jsr >MC56F801x_intRoutine    ; COP Watchdog reset                              ($02)
	jsr >MC56F801x_illegal       ; illegal instruction                             ($04)
	jsr >MC56F801x_intRoutine    ; software interrupt 3                            ($06)
	jsr >MC56F801x_HWSOverflow   ; hardware stack overflow                         ($08)
	jsr >MC56F801x_misalign      ; misaligned long word access                     ($0A)
	jsr >MC56F801x_intRoutine    ; EOnCE step counter                              ($0C)
	jsr >MC56F801x_intRoutine    ; EOnCE breakpoint unit 0                         ($0E)
	jsr >MC56F801x_intRoutine    ; EOnCE trace buffer                              ($10)
	jsr >MC56F801x_intRoutine    ; EOnCE transmit register empty                   ($12)
	jsr >MC56F801x_intRoutine    ; EOnCE receive register full                     ($14)
	jsr >MC56F801x_intRoutine    ; software interrupt 2                            ($16)
	jsr >MC56F801x_intRoutine    ; software interrupt 1                            ($18)
	jsr >MC56F801x_intRoutine    ; software interrupt 0                            ($1A)
	jsr >MC56F801x_intRoutine    ; reserved                                        ($1C)
	jsr >MC56F801x_intRoutine    ; reserved                                        ($1E)
	jsr >MC56F801x_intRoutine    ; Low Voltage Detector (power sense)              ($20)
	jsr >MC56F801x_PLL           ; PLL                                             ($22)
	jsr >MC56F801x_intRoutine    ; HFM Error Interrupt                             ($24)
	jsr >MC56F801x_intRoutine    ; HFM Command Complete                            ($26)
	jsr >MC56F801x_intRoutine    ; HFM Command, Data, and Address Buffers Empty    ($28)
	jsr >MC56F801x_intRoutine    ; reserved                                        ($2A)
	jsr >MC56F801x_intRoutine    ; GPIO D                                          ($2C)
	jsr >MC56F801x_intRoutine    ; GPIO C                                          ($2E)
	jsr >MC56F801x_intRoutine    ; GPIO B                                          ($30)
	jsr >MC56F801x_intRoutine    ; GPIO A                                          ($32)
	jsr >MC56F801x_intRoutine    ; SPI Receiver Full                               ($34)
	jsr >MC56F801x_intRoutine    ; SPI Transmtter Empty                            ($36)
	jsr >MC56F801x_intRoutine    ; SCI Transmitter Empty                           ($38)
	jsr >MC56F801x_intRoutine    ; SCI Transmitter Idle                            ($3A)
	jsr >MC56F801x_intRoutine    ; SCI Reserved                                    ($3C)
	jsr >MC56F801x_intRoutine    ; SCI Receiver Error                              ($3E)
	jsr >MC56F801x_intRoutine    ; SCI Receiver Full                               ($40)
	jsr >MC56F801x_intRoutine    ; I2C Arbitration Lost                            ($42)
	jsr >MC56F801x_intRoutine    ; I2C Byte Transfer                               ($44)
	jsr >MC56F801x_intRoutine    ; I2C Address Detect                              ($46)
	jsr >MC56F801x_intRoutine    ; Timer Channel 0                                 ($48)
	jsr >MC56F801x_intRoutine    ; Timer Channel 1                                 ($4A)
	jsr >MC56F801x_intRoutine    ; Timer Channel 2                                 ($4C)
	jsr >MC56F801x_intRoutine    ; Timer Channel 3                                 ($4E)
	jsr >MC56F801x_intRoutine    ; ADCA Conversion Complete                        ($50)
	jsr >MC56F801x_intRoutine    ; ADCB Conversion Complete                        ($52)
	jsr >MC56F801x_intRoutine    ; ADC Zero Crossing or Limit Error                ($54)
	jsr >MC56F801x_intRoutine    ; Reload PWM                                      ($56)
	jsr >MC56F801x_intRoutine    ; PWM fault                                       ($58)
	jsr >MC56F801x_intRoutine    ; SW interrupt Low Priority                       ($5A)
	
	
	endsec	

	end


