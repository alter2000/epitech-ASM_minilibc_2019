default rel
bits 64

global strlen:function

section .text
strlen:
	push rbp
	mov ebp, esp
	push rdi

	mov edi, [ebp+8]
	xor al, al
	cld

.loop:
	scasb
	jne .loop

	mov eax, edi
	dec eax
	sub eax, [ebp+8]

	pop rdi
	leave
	ret
