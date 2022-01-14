section code align=16 vstart=0x7c00
main:

mov bx, 0x0000
mov ss, bx
mov sp, 0x0000

mov ah, 0x00
mov al, 0x04
int 10h

mov cx, 99 

.draw:
push cx

mov ax, cx
mov dl, 10
div dl

mov cl, al
mov dl, ah
mov ch, 0x00
mov dh, 0x00

mov ah, 0x0c
mov al, 0x02
mov bh, 0x00

int 10h

pop cx
dec cx
loop .draw

jmp $

times 510-($-$$) db 0
		 db 0x55,0xaa
