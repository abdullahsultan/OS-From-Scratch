bits 32
; Define some constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
 pusha
 mov edx, VIDEO_MEMORY 

print_string_pm_loop:
 mov al, [ebx] 
 mov ah, WHITE_ON_BLACK 

cmp al, 0 ; if (al == 0), at end of string , so
je done ; jump to done
mov [edx], ax ; Store char and attributes at current
              ; character cell.
add ebx, 1 ; Increment EBX to the next char in string.
add edx, 2 ; Move to next character cell in vid mem.

jmp print_string_pm_loop  ; loop around to print the next char.
done :
    popa
    ret
