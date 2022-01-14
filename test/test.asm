mov ax, 0xb800
mov ds, ax

mov byte [0x00], 'H'
mov byte [0x02], 'e'
mov byte [0x04], 'l'
mov byte [0x06], 'l'
mov byte [0x08], 'o'
mov byte [0x0a], ','
mov byte [0x0c], 'W'
mov byte [0x0e], 'a'
mov byte [0x10], 'n'
mov byte [0x12], 'g'
mov byte [0x14], 'B'
mov byte [0x16], 'X'
mov byte [0x18], ' '
mov byte [0x1a], 'O'
mov byte [0x1c], 'S'
mov byte [0x1e], '!'

jmp $

times 510-($-$$) db 0
		 db 0x55,0xaa
