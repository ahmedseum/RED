%include "util.asm"

global _start

section .bss
	user_num1: resb 8
	user_num2: resb 8
	user_op: resb 2

section .data
	num1: db "Enter number 1 : " ,0
	num2: db "Enter number 2 : " ,0
	op: db "Enter operation : " ,0
	error: db "Can not perform this operation " ,0


section .text
_start:
	mov rdi,num1
	call printstr

	call readint
	mov [user_num1],rax

	mov rdi,num2
	call printstr

	call readint
	mov [user_num2],rax

	mov rdi,op
	call printstr
	mov rdi, user_op
	mov rsi,2
	call readstr


cmp_op:
	mov rdi,[user_op]
	;[cmp rdi,'+'] wont work because cmp only works with int
	cmp rdi,43
	je addition
	
	cmp rdi,45
	je subtration

	cmp rdi,42
	je multiplication

	cmp rdi, 47
	je divition

except:
	mov rdi, error
	call printstr
	call endl
	call exit0

addition:
	mov rdi , [user_num1]
	add rdi , [user_num2]
	call result
	

subtration:
	mov rdi , [user_num1]
	sub rdi , [user_num2]
	call result

multiplication:
	mov rdi, [user_num1]
	imul rdi , [user_num2]
	call result

divition:
	mov rdx,0
	mov rax, [user_num1]
	mov rbx, [user_num2]
	idiv rbx
	mov rdi,rbx
	call result

result:
	call printint
	call endl
	call exit0