global strlen:function

	bits 64
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
	ret
