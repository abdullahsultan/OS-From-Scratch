C_SOURCES = $( wildcard ../Kernel/*.c ../Drivers/*.c )
HEADERS = $( wildcard ../Kernel/*.h ../Drivers/*.h )
OBJ = $ { C_SOURCES : .c = .o }
all : os-image
run : all
		dd if=os-image of=/dev/sdb
os-image : boot_sect.bin kernel.bin
				cat $^ > os-image
kernel.bin : kernel_entry.o fnl.o
					ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary

fnl.o : kernel.o screen.o low_level.o
					gcc -m32 -o $@ $^ #$@ = fnl.o $^ = targets

%.o : ../Kernel/%.c ${C_SOURCES}
					gcc -m32 -ffreestanding -c $< -o $@
%.o : ../Drivers/%.c ${HEADERS}
					gcc -m32 -ffreestanding -c $< -o $@
# Assemble the kernel_entry .
#%.o : ../Boot/%.asm
#				nasm $< -f elf -o $@
kernel_entry.o : ../Boot/kernel_entry.asm
				nasm -f elf $< -o $@
#%.bin : ../Boot/%.asm
#				nasm $< -f bin -I 'Boot/' -o $@
boot_sect.bin : ../Boot/main.asm
				nasm $< -f bin -I '../Boot/' -o $@
clean :
		rm -fr *.bin *.dis *.o os-image
		rm -fr ../Kernel/*.o ../Boot/*.bin ../Drivers/*.o
