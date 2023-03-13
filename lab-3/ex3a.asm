; Se dau doua siruri de octeti S1 si S2 de aceeasi lungime
; Sa se construiasca sirul D astfel:
; fiecare element de pe pozitiile pare din D este suma elementelor de pe pozitiile corespunzatoare din S1 si S2
; fiecare element de pe pozitiile impare este diferenta elementelor de pe pozitiile corespunzatoare din S1 si S2

assume cs:code, ds:data

data segment
S1 db 1, 2, 3, 4
len equ $ - S1
S2 db 5, 6, 7, 8
D db len dup (?)
data ends

code segment
start:

mov ax, data
mov ds, ax

	mov si, 0
	
	repeta:
		mov ax, si
		mov dx, 0
		mov bx, 2
		div bx
		cmp dx, 1
		je pozitie_impara
		
		pozitie_para:
			mov al, byte ptr S1[si]
			mov ah, 0
			mov bl, byte ptr S2[si]
			mov bh, 0
			add ax, bx
			mov byte ptr D[si], al
		
		jmp pozitia_urmatoare
		
		pozitie_impara:
			mov al, byte ptr S1[si]
			mov ah, 0
			mov bl, byte ptr S2[si]
			mov bh, 0
			sub ax, bx
			mov byte ptr D[si], al
			
		pozitia_urmatoare:
			add si, 1
			cmp si, len
			jne repeta
		
; Terminarea programului
mov ax, 4c00h
int 21h
code ends

end start