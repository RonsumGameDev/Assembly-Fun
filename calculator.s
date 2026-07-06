.global _start
.intel_syntax noprefix

.section .text
_start:

	//This part prints the prompt that requests to enter the text
	mov rax, 1
	mov rdi, 1
	lea rsi, [rip + prompt_text]
	mov rdx, 18
	syscall

	//Get the input
	mov rax, 0
	mov rdi, 0
	lea rsi, [rip + number1]
	mov rdx, 32
	syscall

	//After read syscall, rax contains the number of bytes read, so r8 preserves that so we don't read all 32 bytes every time.
	mov r8, rax

	//Check the input
	mov rax, 1
	mov rdi, 1
	lea rsi, [rip + number1]
	mov rdx, r8
	syscall	


	//Prompt another input
	mov rax, 1
	mov rdi, 1
	lea rsi, [rip + prompt_text]
	mov rdx, 18
	syscall

	//Get another number
	mov rax, 0
	mov rdi, 0
	lea rsi, [rip + number2]
	mov rdx, 32
	syscall

	//After read syscall, rax routine 
	mov r9, rax

	//Check the Input
	mov rax, 1
	mov rdi, 1
	lea rsi, [rip + number2]
	mov rdx, r9
	syscall

	//String -> Number
	xor rax, rax
	lea rsi, [rip + number1]
	
	convert_loop:
		movzx rbx, byte ptr [rsi]
		cmp bl, 10
		je done1
	
		sub bl, '0'
		imul rax, rax, 10
		add rax, rbx

		inc rsi
		jmp convert_loop


	done1:
		mov r10, rax
	xor rax, rax
	lea rsi, [rip + number2]
	
	convert_loop_2:
		movzx rbx, byte ptr [rsi]
		cmp bl, 10
		je done2

		sub bl, '0'
		imul rax, rax, 10
		add rax, rbx
		
		inc rsi
		jmp convert_loop_2

	done2:
		mov r11, rax

	add r10, r11


	mov rax, r10
	mov rcx, 10
	
	lea rsi, [rip + result + 31]
	mov byte ptr [rsi], 10
	dec rsi

	xor r12, r12

	itoa_loop:
		xor rdx, rdx
		div rcx
		
		add dl, '0'
		mov [rsi], dl
		
		dec rsi
		inc r12
		
		test rax, rax
		jnz itoa_loop

	inc rsi

	mov r13, rsi

	mov rax, 1
	mov rdi, 1
	lea rsi, [rip + result_text]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, r13 
	mov rdx, r12
	inc rdx
	syscall
	
	//Exit
	mov rax, 60
	mov rdi, 0
	syscall

.section .data
prompt_text:
	.asciz "Enter the number: " 
	
result_text:
	.asciz "Result: "

.section .bss
number1:
	.skip 32

number2:
	.skip 32

result:
	.skip 32
