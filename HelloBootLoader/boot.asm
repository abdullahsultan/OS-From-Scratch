; Read some sectors from the boot disk using our disk_read function
org 0x7c00
mov [ BOOT_DRIVE ] , dl ; BIOS stores our boot drive in DL , so it ’s
; best to remember this for later.
mov bp , 0x8000
mov sp , bp
; Here we set our stack safely out of the
; way , at 0 x8000
mov bx , 0x9000
; Load 5 sectors to 0 x0000 ( ES ):0 x9000 ( BX )
mov dh , 5
; from the boot disk.
mov dl , [ BOOT_DRIVE ]
call disk_load
mov si , [0x9000 ]
call print_string
; Print out the first loaded word , which
; we expect to be 0 xdada , stored
; at address 0 x9000
mov si , [0x9000 + 512] ; Also , print the first word from the
call print_string
; 2 nd loaded sector : should be 0 xface
mov si , DONE
call print_string

jmp $


DONE  db " DONE!" , 0
%include"print_string.asm"
%include"disk_load.asm"

BOOT_DRIVE : db 0
; Bootsector padding
times 510 -( $ - $$ ) db 0
dw 0xaa55
; We know that BIOS will load only the first 512 - byte sector from the disk ,
; so if we purposely add a few more sectors to our code by repeating some
; familiar numbers , we can prove to ourselfs that we actually loaded those
; additional two sectors from the disk we booted from.
times 256 dw 0xdada
times 256 dw 0xface
