;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
	    mov.w   #0006h,&2000h;moves 6 to 2000h memory
            mov.w   #0009h,&2002h;moves 9 to 2002h memory
            clr.w   &2006h; clears 2006h memory
            clr.w   &2008h;clears 2008h memory
            mov.w   &2002h,&2004h; moves whatever is in 2002h to 2004h memory
            add.w   &2000h,&2004h; adds whatever is in 2000h to 2004h memory
            cmp.w   #000Ah,&2004h; comparing Ah to whatever is on 2004h memory
            jhs Greater ; checks if 2004h is greater than Ah
            jlo Less ; checks if 2004h is less that Ah
Greater:
            mov.w   &2000h,&2008h; if it is greater, the output will be included in 2008h
            jmp $;
Less:
            mov.w   &2002h,&2006h; if less, the output will be included in 2006h
            jmp $;
                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
