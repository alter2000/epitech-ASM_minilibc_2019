global strchr:function

strchr:
	push rbp
	mov rbp, rsp
	xor rax, rax

.loop:
	cmp byte [rdi], 0
	je .out
	cmp byte [rdi], sil
	je .rep
	inc rdi
	jmp .loop

.out:
	xor rax, rax
	jmp .end

.rep:
	mov rax, rdi

.end:
	leave
	ret
