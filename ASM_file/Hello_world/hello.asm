global _start

section .text
_start :
	;print hello world
	mov rax ,1 ; write system call
	mov rdi ,1 ; fd -> 1 (output) -> 2 (erroe) -> 0 (input)
	mov rsi , hello
	mov rdx , 11 ; count (size)
	syscall

	mov rax,60
	mov rdx ,23
	syscall

section .data
	hello: db "Hello World"