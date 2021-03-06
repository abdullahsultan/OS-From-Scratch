; A boot sector that enters 32-bit protected mode.

BITS 16

ORG 0x7C00

KERNEL_OFFSET equ 0x1000

        mov [BOOT_DRIVE],dl

        mov bp, 0x1000 ; Set the stack.
        mov sp, bp

        mov si,MSG_REAL_MODE
        call print_string

        mov ah,00h ;Funcgtion to wait for keystroke
        int 16h ;Keyboard Interupt

        call load_kernel

        call switch_to_pm ; Note that we never return from here.
        jmp $

        MSG_REAL_MODE db "In 16-bit, Press any key", 0

%include "print_string.asm"
%include "disk_load.asm"
%include "gdt.asm"
%include "load_kernel.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"
%include "final.asm"

bits 32
