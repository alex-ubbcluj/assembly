assume cs:code, ds:data

data segment
sir db 100, ?, 100 dup (?)
lungime dw ?
diferenta db 0
newline db 10, 13, '$'
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov ah, 0ah
	mov dx, offset sir
	int 21h
	
	mov al, byte ptr sir[1]
	mov ah, 0
	mov lungime, ax
	
	mov si, 2
	mov di, 0
	procesare_sir:
		cmp byte ptr sir[si], ','
		je pozitia_urmatoare
		mov al, byte ptr sir[si]
		sub al, '0'
		sub diferenta, al
		
	pozitia_urmatoare:
		add si, 1
		add di, 1
		cmp di, lungime
		jb procesare_sir
	
	mov ah, 02h
	mov dl, newline
	int 21h
	
	mov ah, 02h
	mov dl, diferenta
	add dl, '0'
	int 21h

mov ax, 4c00h
int 21h
code ends

end start