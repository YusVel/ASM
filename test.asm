global get_valid_int
section .date
	main_massage db "Enter N (from 0 to n^64-1): "
	main_massage_size equ ($-main_massage)
	error_massage db "Error! Enter N again: "
	error_massage_size equ ($-error_massage)
section .bss
	input_massage resb 32
	input_massage_size equ ($-input_massage)
	pointer db ?
section .text

get_valid_int:
	mov rsi, main_massage
	mov rdx, main_massage_size
	call stdout  ; вывод сообщения 
	call stdin	; ввод сообщения 
	mov rsi, error_massage
	mov rdx, error_massage_size
	call stdout 
	call stdin	; ввод сообщения 
	ret
	
stdout:
	mov rdi, 1
	mov rax, 1
	syscall
	ret
stdin:
	mov rbx, 0x0
	mov rcx, input_massage
	mov rdx, input_massage_size
	mov rax, 0x0
	syscall
	ret
