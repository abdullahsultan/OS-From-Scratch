bits 16
; Switch to protected mode
switch_to_pm:
mov ah,0x0e
mov al,'H'
int 0x10

cli

lgdt [gdt_descriptor]

mov eax, cr0
or eax, 0x1
mov cr0, eax

jmp CODE_SEG : init_pm

bits 32
; Initialise registers and the stack once in PM.
init_pm:
  mov ax, DATA_SEG
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  mov ebp, 0x90000
  mov esp, ebp
  call BEGIN_PM

BEGIN_PM:

        mov ebx, MSG_PROT_MODE
        call print_string_pm
        jmp $


    ;MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
    MSG_PROT_MODE db "Successfully landed in 32-bit Protected Mode", 0
; Bootsector padding
