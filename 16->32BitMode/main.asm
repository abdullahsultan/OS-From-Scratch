; A boot sector that enters 32-bit protected mode.

BITS 16

ORG 0x7C00

start:
        mov bp, 0x9000 ; Set the stack.
        mov sp, bp

        mov  bx, MSG_REAL_MODE
        call print_string
        MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
        call switch_to_pm ; Note that we never return from here.
        jmp $

%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"

;bits 32
times 510-($-$$) db 0
dw 0xaa55
