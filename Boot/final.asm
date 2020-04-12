
BEGIN_PM:

        mov ebx, MSG_PROT_MODE
        call print_string_pm

        call KERNEL_OFFSET

        jmp $

    BOOT_DRIVE  db 0
    MSG_PROT_MODE db "in 32-bit", 0
    MSG_LOAD_KERNEL db "LoadingKERNEL,Press any Key", 0
    ;MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
; Bootsector padding

times 510-($-$$) db 0
dw 0xaa55
