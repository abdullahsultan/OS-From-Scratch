; A boot sector that enters 32-bit protected mode.
[org 0x7c00]
        mov bp, 0x9000 ; Set the stack.
        mov sp, bp

        mov bx, MSG_REAL_MODE
        call print_string

        call switch_to_pm ; Note that we never return from here.
        jmp $

%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"

[bits 32]
