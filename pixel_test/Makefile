test.bin: test.asm
	nasm -o test.bin test.asm

.PHONEY: build
build:
	dd if=test.bin of=test.img bs=512 count=1 conv=notrunc

.PHONEY: run
run:
	bochs -f bochsrc
