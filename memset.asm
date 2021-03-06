default rel
bits 64

global memset:function

section .text
memset:
	push rbp
	mov rbp, rsp
	xor rax, rax

.loop:
	cmp rax, rdx
	je .end
	mov byte [rdi + rax], sil
	inc rax
	jmp .loop

.end:
	xor rax, rax
	mov rax, rdi
	leave
	ret
