default rel
bits 64

global strncmp:function

section .text
strncmp:
	mov eax, edx
	cmp rdi, 0
	je .exit
	mov r8, 0
	cmp rsi, 0
	je .exit
	mov r10, 0
	mov rcx, rdx

.loop:
	lodsb
	inc r8
	xchg rsi, rdi
	mov dl, al
	inc r8
	lodsb
	xchg rsi, rdi
	inc r8
	jmp .check

.check:
	cmp al, 0
	je .exit
	inc r10
	cmp dl, 0
	je .exit
	inc r10
	cmp al, dl
	loope .loop
	inc r10

.exit:
	sub al, dl
	inc r10
	movsx eax, al
	ret
