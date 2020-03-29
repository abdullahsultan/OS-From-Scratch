; load DH sectors to ES : BX from drive DL
disk_load :
push dx
; Store DX on stack so later we can recall
; how many sectors were request to be read ,
; even if it is altered in the meantime
mov ah , 0 x02
; BIOS read sector function
mov al , dh
; Read DH sectors
mov ch , 0 x00
; Select cylinder 0
mov dh , 0 x00
; Select head 0
mov cl , 0 x02
; Start reading from second sector ( i.e.
; after the boot sector )
int 0 x13
; BIOS interrupt
jc disk_error ; Jump if error ( i.e. carry flag set )
pop dx
cmp dh , al
jne disk_error
ret ; Restore DX from the stack
; if AL ( sectors read ) != DH ( sectors expected )
;display error message
disk_error :
mov bx , DISK_E RROR_MS G
call print_string
jmp $
; Variables
DISK _ERROR_M SG
db " Disk read error ! " , 0
