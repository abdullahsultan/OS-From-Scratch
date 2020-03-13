
BEGIN_PM:

        mov ebx, MSG_PROT_MODE
        call print_string_pm
        jmp $


    ;MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
    MSG_PROT_MODE db "Successfully landed in 32-bit Protected Mode", 0
    MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
; Bootsector padding

times 510-($-$$) db 0
dw 0xaa55
