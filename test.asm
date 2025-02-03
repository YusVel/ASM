global get_valid_int
section .date
	main_massage db "Enter N (from 0 to n^64-1): "
	main_massage_size equ ($-main_massage)
	error_massage db "Error! Enter N again: "
	error_massage_size equ ($-error_massage)

section .bss
	input_massage resb 32
	input_massage_size equ ($-input_massage)
	input_bytes dq ? ; количество введенных байт
section .text

get_valid_int:
	mov rsi, main_massage
	mov rdx, main_massage_size
	call stdout  ; вывод сообщения 
	call stdin	; ввод сообщения 
				; проходим по массиву символов и проверяем их >=48 &&<=57
	xor rcx, rcx
	mov rcx, [input_bytes]
	movzx rbx, byte [input_massage + rcx] ; последний символ обязательно 10
while:
	dec rcx ;  если счетчик упал ниже нуля, то выходим из цикла
	js endwhile ;
	movzx rbx, byte [input_massage + rcx]
	cmp rbx, 48 ;
	jb error; если регистр rbx меньше 47 

	cmp rbx, 57;
	ja error; если регистр rbx ,больше 58 

	cmp rcx, 0
	jne while
	ret
endwhile:
	

error:
	mov rsi, error_massage
	mov rdx, error_massage_size
	call stdout 
	call stdin	; ввод сообщения 
	xor rcx, rcx
	mov rcx, [input_bytes]
	xor rbx,rbx
	movzx rbx, byte [input_massage + rcx] ; последний символ обязательно 10
	jmp while
	
stdout:
	mov rdi, 1
	mov rax, 1
	syscall
	ret
stdin:
	mov rdi, 0
	mov rax, 0
	mov rsi, input_massage
	mov rdx, input_massage_size
	syscall
	dec rax
	jz get_valid_int
	mov [input_bytes], qword rax
	ret
