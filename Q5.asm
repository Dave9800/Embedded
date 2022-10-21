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
;-----------------------------------------------------------------------------
	mov.w #00FDh, R4
	mov.w #00FDh, R5

	cmp R4, R5

	jge greater_equal;
	jl less
	jmp $;

less:
	call #less_function;
	jmp $;

greater_equal:
	jeq equal
	call #greater_function;

less_function:
    mov.w #000Ah, &2000h
    mov.w #000Bh, &2001h
    mov.w #000Ch, &2002h
    mov.w #000Dh, &2003h
    mov.w #000Eh, &2004h
    add #1h, R4;
    ret;

equal:
	jmp $;

greater_function:
	mov.w #000Ah, &2010h
	mov.w #000Bh, &2009h
	mov.w #000Ch, &2008h
	mov.w #000Dh, &2007h
	mov.w #000Eh, &2006h
	sub #1h, R4;
	ret;



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
            
