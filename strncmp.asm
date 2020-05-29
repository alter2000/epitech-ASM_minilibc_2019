default rel
bits 64

global strncmp:function

section .text
strncmp:
.loop:
	cmp byte [rsi], 0
	jz .end
	repne cmpsb
	jz .loop

.end:
	mov rax, [rdi]
	sub rax, [rsi]
	ret
