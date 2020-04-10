bits 16

print_string:

      mov ah, 0x0e

      loop:
      	lodsb

      	cmp al, 0
      	je done_sxt

      	int 0x10

      	jmp loop

      done_sxt:
      	ret
