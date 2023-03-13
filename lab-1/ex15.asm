; z=((a+b*c-d)/f+h)/g

assume cs:code, ds:data

data segment
a db 5
b db 3
c db 9
d db 7
f db 2
g db 3
h db 4
z dw ?
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov al, b

	mov ah, 0

	mul c

	mov bl, a

	mov bh, 0

	add ax, bx

	mov bl, d

	mov bh, 0

	sub ax, bx

	; pana aici am facut (a+b*c-d) si rezultatul l-am salvat in ax

	mov dx, 0

	div f

	mov ah, 0

	mov bl, h

	mov bh, 0

	add ax, bx

	mov dx, 0

	div g

	mov ah, 0

	mov z, ax

; Terminarea programului
mov ax, 4c00h
int 21h
code ends

end start