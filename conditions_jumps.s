.global _start
.intel_syntax noprefix

.section .data

equal_msg:
	.asciz "Numbers are equal\n"

not_equal_msg:
	.asciz "Numbers are not equal\n"

.section .text

_start:
	mov rax, 5
	mov rbx, 5

	cmp rax, rbx
	je equal

not_equal:
	mov rax, 1
	mov rdi, 1
	lea rsi, [not_equal_msg]
	mov rdx, 25
	syscall

	jmp exit

equal:
	mov rax, 1
	mov rdi, 1
	lea rsi, [equal_msg]
	mov rdx, 20
	syscall

exit:
	mov rax, 60
	xor rdi, rdi
	syscall


