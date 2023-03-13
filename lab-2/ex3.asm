; Sa se inlocuiasca primii trei biti ai cuvantului B cu ultimii trei biti ai octetului A

assume cs:code, ds:data

data segment
a db 0b2h
b dw 0f0fh
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov cl, 5
	
	shr a, cl
	
	mov cl, 3
	
	shr b, cl
	
	shl b, cl
	
	mov al, a
	
	mov ah, 0
	
	or b, ax

; Terminarea programului
mov ax, 4c00h
int 21h
code ends

end start