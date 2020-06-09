default rel
bits 64

global strlen:function

section .text
strlen:
	push ebp
	mov ebp, esp
	push edi

	mov edi, [ebp+8]
	xor al, al
	cld

.loop:
	scasb
	jne .loop

	mov eax, edi
	dec eax
	sub eax, [ebp+8]

	pop edi
	leave
	ret
