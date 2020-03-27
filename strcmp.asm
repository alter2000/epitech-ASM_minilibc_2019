default rel
global strcmp:function

section .text
strcmp:
.loop:
	cmp byte [rsi], 0
	jz .end
	repne cmpsb
	jz .loop

.end:
	mov rax, [rdi]
	sub rax, [rsi]
	ret
