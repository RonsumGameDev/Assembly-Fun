.global _start
.intel_syntax noprefix

.section .bss
buffer:
	.skip 64
.section .text

_start:
	mov rax, 0
	mov rdi, 0
	lea rsi, [buffer]
	mov rdx, 64
	syscall

	mov rdx, rax

	mov rax, 1
	mov rdi, 1
	lea rsi, [buffer]
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
	
