; Se da un sir de litere mari si mici.
; Sa se afiseze literele mici pe ecran si
; sa se afiseze numarul acestor litere pe ecran

assume cs:code, ds:data

data segment
S db 'AabcBdXzZ'
len equ $ - S
rez db (len + 1) dup (?)
cnt db 0
newline db 10, 13, '$'
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov si, 0
	mov di, 0
	
	repeta:
		mov al, byte ptr S[si]
		mov ah, 0
		cmp al, 'Z'
		jbe pozitia_urmatoare
		mov byte ptr rez[di], al
		add di, 1
		add cnt, 1
		
		pozitia_urmatoare:
			add si, 1
			cmp si, len
			jne repeta

	; afisare litere mici
	mov byte ptr rez[di], '$'
	mov ah, 09h
	mov dx, offset rez
	int 21h

	; newline
	mov ah, 09h
	mov dx, offset newline
	int 21h

	; afisare numar litere
	mov cx, 0
	mov al, cnt
	mov ah, 0
	mov bl, 10
	mov bh, 0
	
	repeta_pune_pe_stiva:
		mov dx, 0
		div bx
		push dx
		inc cx
		cmp ax, 0
		jne repeta_pune_pe_stiva
		
	repeta_afisare_cifre:
		pop dx
		mov ah, 02h
		add dl, '0'
		int 21h
	loop repeta_afisare_cifre

; Terminarea programului
mov ax, 4c00h
int 21h
code ends

end start