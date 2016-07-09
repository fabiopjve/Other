  
   


; metrowerks sample code



; 01x freq trim code



CLKGEN      EQU $00F0F0
OSCTL       EQU $00F0F5 ; CLKGEN + 5  ; osc control register

FM_BASE     EQU $00F400 
FMOPT1      EQU $00F41B ; FM_BASE + 1B  Reserved for trim cap setting 
                        ; of the relaxation oscillator 
                        ; (on chips other than 56835/836/837/838)

	section utility


	org	p:

	
	GLOBAL F__trim

	SUBROUTINE "F__trim",F__trim,F__trimEND-F__trim


F__trim:

; get trim value and set trim reg
	
	move.l   #OSCTL,R1    ; set R1 and R0 to OSCTL
	move.l   #OSCTL,R0
	move.w   X:(R0),A     ; set A to current OSCT value
	move.w   #-1024,B     ; set B to mask
	and.w    A,B          ; mask A
	move.l   #FMOPT1,R0   ; set R0 to factory-flashed trim value
	move.w   X:(R0),A     ; set A
	or.w     B,A          ; or A and B to get full OSCTL value
	move.w   A1,X:(R1)    ; set OSCTL

	rts 

F__trimEND:

	endsec
	end
	
	
	