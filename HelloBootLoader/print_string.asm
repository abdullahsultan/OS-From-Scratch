bits 16

print_string:

      mov ah, 0x0e

      loop:
      	; Load a byte from SI into AL
      	; and then increase SI.
      	lodsb
      	; If AL contains a null-terminating
      	; character, then stop printing.
      	cmp al, 0
      	je done_sxt

      	int 0x10

      	jmp loop

      done_sxt:
      	; Return control to the caller.
      	ret
