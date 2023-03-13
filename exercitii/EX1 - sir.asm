assume cs: code, ds: data

data segment
n dw 0
n_string db 4, ?, 4 dup (?)
nr_cifre dw ?
sir db 257 dup (?)
trei db 3
zece db 10
data ends

code segment
start:

mov ax, data
mov ds, ax
	
	mov ah, 0ah
	mov dx, offset n_string
	int 21h
	
	mov al, byte ptr n_string[1]
	mov ah, 0
	mov nr_cifre, ax
	
	mov si, 2
	mov di, 0
	
	creare_nr:
		mov al, byte ptr n_string[si]
		mov ah, 0
		sub ax, '0'
		add n, ax
		add di, 1
		cmp di, nr_cifre
		je creare_sir
		mov ax, n
		imul zece
		mov n, ax
		add si, 1
		jmp creare_nr

	creare_sir:
		mov si, 0
		repeta:
			cmp n, 0
			je afisare
			mov al, trei
			mov byte ptr sir[si], al
			add byte ptr sir[si], '0'
			add trei, 3
			sub n, 1
			add si, 1
			jmp repeta
			
	afisare:
		mov byte ptr sir[si], '$'
		mov ah, 09h
		mov dx, offset sir
		int 21h
	
mov ax, 4c00h
int 21h
code ends

end start