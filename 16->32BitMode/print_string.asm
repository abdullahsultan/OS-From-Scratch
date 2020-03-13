bits 16

print_string:
      mov ah,0x0e
      add bx,0x7c00
      mov al,[bx]
      int 0x10
      ret
