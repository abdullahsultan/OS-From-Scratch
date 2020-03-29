; A boot sector that enters 32-bit protected mode.

BITS 16

ORG 0x7C00

start:
        mov bp, 0x9000 ; Set the stack.
        mov sp, bp

        mov si,MSG_REAL_MODE
        call print_string

        mov ah,0x0e
        mov al, 'X'
        int 0x10

        mov ah,00h
        int 16h

        call switch_to_pm ; Note that we never return from here.
        jmp $
        MSG_REAL_MODE db "Started in 16-bit Real Mode", 0

%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"
%include "final.asm"



bits 32
