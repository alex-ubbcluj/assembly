assume cs:code, ds:data

data segment
sir db 100, ?, 100 dup (?)
lungime dw ?
spatii dw 0
zece dw 10
newline db 10, 13, '$'
data ends

code segment
start:
mov ax, data
mov ds, ax

	mov ah, 0ah
	mov dx, offset sir
	int 21h
	
	mov ah, 02h
	mov dl, newline
	int 21h
	
	mov al, byte ptr sir[1]
	mov ah, 0
	mov lungime, ax
	
	mov si, 2
	mov di, 0
	repeta:
		cmp byte ptr sir[si], ' '
		jne pozitia_urmatoare
		add spatii, 1
		
	pozitia_urmatoare:
		add si, 1
		add di, 1
		cmp di, lungime
		jne repeta

	mov cx, 0
	mov ax, spatii
	repeta_stiva:
		mov dx, 0
		div zece
		push dx
		inc cx
		cmp ax, 0
		jne repeta_stiva
		
	repeta_afisare:
		pop dx
		add dx, '0'
		mov ah, 02h
		int 21h
	loop repeta_afisare

mov ax, 4c00h
int 21h
code ends

end start