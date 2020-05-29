default rel
bits 64

global strcasecmp:function

section .text
strcasecmp:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rbx, rbx

.main_loop:
	mov byte al, [rdi]
	mov byte bl, [rsi]
	cmp bl, 0
	je .sub
	cmp al, 0
	je .sub
	cmp al, bl
	jne .lookahead
	inc rdi
	inc rsi
	jmp .main_loop

.lookahead:
	cmp byte al, 'z'
	jle .lowercase
	cmp byte bl, 'z'
	jle .lowercase
	jmp .uppercase

.lowercase:
	;; 'a' - 1
	cmp byte al, 96
	jg .toupper
	cmp byte bl, 96
	jg .tolower
	jmp .uppercase

.toupper:
	;; diff 'a' - 'A'
	sub al, 32
	jmp .lowercase

.tolower:
	sub bl, 32
	jmp .lowercase

.uppercase:
	cmp al, bl
	jne .sub
	inc rdi
	inc rsi
	jmp .main_loop

.sub:
	sub rax, rbx

end:
	leave
	ret
