section code align=16 vstart=0x7c00
main:

; one sector
mov dx, 0x01f2
mov al, 0x01
out dx, al

; LBA28:0x0000:0000:0000:00e0
mov dx, 0x01f3
mov al, 0x00
out dx, al
mov dx, 0x01f4
out dx, al
mov dx, 0x01f5
out dx, al
mov dx, 0x01f6
mov al, 0xe0
out dx, al

; read disk
mov dx, 0x01f7
mov al, 0x20
out dx, al

; wait for disk
mov dx, 0x01f7
	.waits:
	in al, dx
	and al, 0x88
	cmp al, 0x08
	jnz .waits

; display buf
mov bx, 0xb800
mov ds, bx
mov bx, 0x00

;read and display
mov cx, 256
mov dx, 0x01f0
	.readw:
	in ax, dx
  mov byte [bx], al
	add bx, 0x02
	mov byte [bx], ah
	add bx, 0x02
  cmp ax, 0x00
  je .end
	loop .readw

	.end:
jmp $

times 510-($-$$) db 0
		 db 0x55,0xaa
