; load_kernel
bits 16

load_kernel :
mov si , MSG_LOAD_KERNEL
call print_string

mov ah,00h ;Funcgtion to wait for keystroke
int 16h ;Keyboard Interupt

mov bx , KERNEL_OFFSET
mov dh , 15
mov dl , [ BOOT_DRIVE ]
call disk_load
ret
