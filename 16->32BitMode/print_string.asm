bits 16

print_string:
      add bx, 0x7c00
      mov al,[bx]
      int 0x10
	    ret
