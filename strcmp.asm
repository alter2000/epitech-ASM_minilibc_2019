global strcmp:function

section .text
strcmp:
	push rbp
	mov rbp, rsp
	mov qword [rbp-0x8], rdi
	mov qword [rbp-0x10], rsi
	jmp .loop

.init:
	mov rax, qword [rbp-0x8]
	movzx eax, byte [rax]
	test al, al
	jne .inc

.fail:
	mov eax, 0
	jmp .exit

.inc:
	add qword [rbp-0x8], 1
	add qword [rbp-0x10], 1
	jmp .init

.loop:
	mov rax, qword [rbp-0x8]
	movzx edx, byte [rax]
	mov rax, qword [rbp-0x10]
	movzx eax, byte [rax]
	cmp dl, al
	je .init

	mov rax, qword [rbp-0x8]
	movzx eax, byte [rax]
	movzx edx, al
	mov rax, qword [rbp-0x10]
	movzx eax, byte [rax]
	movzx eax, al
	sub edx, eax
	mov eax, edx

.exit:
	pop rbp
	ret
