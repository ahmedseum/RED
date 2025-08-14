global _start

section .text
_start:
	;taking user input
	mov rax ,1 
	mov rdi ,1
	mov rsi ,txt1
	mov rdx ,length

	syscall

user_input:
	mov rax , 0
	mov rdi , 0
	mov rsi , input
	mov rdx , 100
	syscall

final_output:

	mov rax ,1 
	mov rdi ,1
	mov rsi ,helo
	mov rdx , hlen
	syscall
	
	mov rax ,1 
	mov rdi ,1
	mov rsi ,input
	mov rdx , 100
	syscall


exit:

	mov rax , 60
	mov rdi , 23
	syscall

section .data
	txt1: db "Enter your name :"
	length: equ $-txt1
	helo: db "Hi , "
	hlen: equ $-helo

section .bss
	input: resb 100