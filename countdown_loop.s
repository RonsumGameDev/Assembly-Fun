.global _start
.intel_syntax noprefix 

.section .data

newline:
	.asciz "\n"

.section .bss

digit:
	.skip 1

.section .text

_start:
	mov rbx, 5

loop_start:
	mov rax, rbx
	add al, '0'

	mov byte ptr [digit], al

	mov rax, 1
	mov rdi, 1
	lea rsi, [digit]
	mov rdx, 1
	syscall

	mov rax, 1
	mov rdi, 1
	lea rsi, [newline]
	mov rdx, 1
	syscall

	dec rbx
	

	cmp rbx, 0
	jne loop_start

	mov rax, 60
	xor rdi, rdi
	syscall

