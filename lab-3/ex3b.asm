; Se da un sir A de cuvinte. Construiti doua siruri de octeti:
; B1 contine ca elemente partea superioara a cuvintelor din A
; B2 contine ca elemente partea inferioara a cuvintelor din A

assume cs:code, ds:data

data segment
A dw 1a2bh, 3d4ch, 2c1ah, 5b3dh
len equ ($ - A) / 2
B1 db len dup (?)
B2 db len dup (?)
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov si, 0
	mov di, 0

	repeta:
		mov ax, word ptr A[si]
		mov byte ptr B1[di], ah
		mov byte ptr B2[di], al
		add si, 2
		add di, 1
		cmp si, (len * 2)
		jne repeta

; Terminarea programului
mov ax, 4c00h
int 21h
code ends

end start