default rel
bits 64

global memmove:function

section .text
memmove:
	push rbp
	mov rbp, rsp
	mov rax, rdx
	sub rax, 1
	mov r9, -1
	mov r10, -1
	jmp .cond

.cond:
	cmp rdi, rsi
	jg .loop_in
	xor rax, rax
	mov r9, 1
	mov r10, rdx

.loop_in:
	cmp rax, r10
	jz .end
	mov r8b, [rsi + rax]
	mov [rdi + rax], r8b
	add rax, r9
	jmp .loop_in

.end:
	mov rax, rdi
	leave
	ret
