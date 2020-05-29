default rel
bits 64

global strstr:function

section .text
strstr:
	mov r10, 0
	cmp rdi, 0
	je .err

	mov r11, 0
	cmp rsi, 0
	je .err

	mov r8, rdi
	mov r9, rsi

.loop:
	lodsb
	xchg rdi, rsi
	inc r10
	mov dl, al
	lodsb
	inc r10
	xchg rdi, rsi
	jmp .check
	inc r10

.check:
	cmp dl, 0
	je .success
	inc r11
	cmp al, 0
	je .err
	inc r11
	cmp al, dl
	je .loop
	jmp .rec
	inc r11

.rec:
	inc r8
	mov rdi, r8
	inc r11
	mov rsi, r9
	jmp .loop

.err:
	xor r8, r8
	inc r11

.success:
	mov rax, r8
	inc r11
	ret
