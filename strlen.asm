default rel
bits 64

global strlen:function

section .text
strlen:
	xor rcx, rcx
	mov rax, rcx
	jmp .loop

.loop:
	cmp rdi, 0
	je .end
	cmp byte [rdi + rax], 0
	je .end
	inc rax
	jmp .loop

.end:
	leave
	ret
