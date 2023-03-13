; z=(a*3+b*b*5)/(a*a+a*b)-a-b

assume cs:code, ds:data

data segment
a db 8
b db 6
z dw ?
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov al, 3
	
	mov ah, 0

	mul a

	mov bx, ax

	mov al, b

	mov ah, 0

	mul b

	mov cl, 5

	mov ch, 0

	mul cx

	add ax, bx

	mov z, ax

	; pana aici am facut (a*3+b*b*5) si rezultatul l-am salvat in z

	mov al, a

	mov ah, 0

	mul a

	mov bx, ax

	mov al, a

	mov ah, 0

	mul b

	add ax, bx

	mov bx, ax

	; pana aici am facut (a*a+a*b) si rezultatul l-am salvat in bx

	mov ax, z

	mov dx, 0

	div bx
	
	mov bl, a

	mov bh, 0

	sub ax, bx

	mov bl, b

	mov bh, 0

	sub ax, bx

	mov z, ax

; Terminarea programului
mov ax, 4c00h
int 21h
code ends

end start