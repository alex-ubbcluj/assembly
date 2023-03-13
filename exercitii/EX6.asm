assume cs:code, ds:data

data segment
caracter db ?
sir_initial db 20, ?, 20 dup (?)
lungime dw ?
sir_final db 20, ?, 20 dup (?)
newline db 10, 13, '$'
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov ah, 0ah
	mov dx, offset sir_initial
	int 21h
	
	mov ah, 0
	mov al, byte ptr sir_initial[1]
	mov lungime, ax
	
	mov ah, 02h
	mov dl, newline
	int 21h
	
	mov ah, 01h
	mov al, 0
	int 21h
	
	mov caracter, al
	
	mov si, 2
	mov di, 0
	repeta:
		mov al, byte ptr sir_initial[si]
		cmp al, caracter
		je inlocuieste_caracter
		
		add al, 32
		cmp al, caracter
		je inlocuieste_caracter

		sub al, 32
		cmp al, caracter
		je inlocuieste_caracter
		
		mov bl, caracter
		cmp al, bl
		je inlocuieste_caracter
		
		add bl, 32
		cmp al, bl
		je inlocuieste_caracter

		sub bl, 32
		cmp al, bl
		je inlocuieste_caracter
		
		jmp copiaza_sir
		
	inlocuieste_caracter:
		mov al, '%'
		mov byte ptr sir_final[di], al
		jmp pozitia_urmatoare
		
	copiaza_sir:
		mov al, byte ptr sir_initial[si]
		mov byte ptr sir_final[di], al
		
	pozitia_urmatoare:
		inc si
		inc di
		cmp di, lungime
		jne repeta

	mov al, '$'
	mov byte ptr sir_final[di], al
	
	mov ah, 02h
	mov dl, newline
	int 21h
	
	mov ah, 09h
	mov dx, offset sir_final
	int 21h
	
	mov ah, 02h
	mov dl, newline
	int 21h

mov ax, 4c00h
int 21h
code ends

end start