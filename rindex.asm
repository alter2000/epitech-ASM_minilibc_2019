default rel
bits 64

global rindex:function

section .text
rindex:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rbx, rbx
	mov rbx, rsi

.loop:
	cmp byte [rdi], 0
	je .end
	cmp byte [rdi], bl
	je .continue
	inc edi
	jmp .loop

.continue:
	xor rax, rax
	mov rax, rdi
	inc edi
	jmp .loop

.end:
	leave
	ret
