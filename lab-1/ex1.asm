; z=1/(a*a+b*b-5)+2/(a*a-b*b+4)

assume cs:code, ds:data

data segment
a db 9
b db 7
z dw ?
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov al, a

	mov ah, 0

	mul a

	mov bx, ax

	mov al, b

	mov ah, 0

	mul b

	add ax, bx

	sub ax, 5

	mov bx, ax
	
	mov ax, 1

	mov dx, 0

	div bx

	mov z, ax

	; pana aici am facut 1/(a*a+b*b-5) si rezultatul l-am salvat in z

	mov al, a

	mov ah, 0

	mul a

	mov bx, ax

	mov al, b

	mov ah, 0

	mul b
	
	sub bx, ax

	add bx, 4

	mov ax, 2

	mov dx, 0

	div bx

	add z, ax

; Terminarea programului
mov ax, 4c00h
int 21h
code ends

end start