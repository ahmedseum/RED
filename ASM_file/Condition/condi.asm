global _start

section .text
_start:
    jmp main

main:
    mov rax , 0           ; sys_read
    mov rdi , 0           ; stdin
    mov rsi , data
    mov rdx, 100
    syscall               ; rax = bytes read

    ; ===== remove newline if exists =====
    mov rcx, rax          ; rcx = length
    dec rcx               ; index of last char
    mov al, byte [data + rcx]
    cmp al, 10            ; '\n' ?
    jne no_newline
    mov byte [data + rcx], 0  ; replace newline with null
    mov rax, rcx          ; update length in rax
no_newline:

com_key:
    cmp rax, lkey
    je compare_strings
    jne access_denied

compare_strings:
    mov rsi , key         ; original value
    mov rdi , data
    cmpsb                 ; compare first byte
    jne access_denied
    je access_granted
    jmp exit

access_granted:
    mov rax,1
    mov rdi,1
    mov rsi ,access_granted_txt
    mov rdx, laccess_granted_txt
    syscall
    jmp exit

access_denied:
    mov rax,1 
    mov rdi,1
    mov rsi, access_denied_txt
    mov rdx ,laccess_denied_txt
    syscall
    jmp exit

exit:
    mov rax,60
    mov rdi , 0
    syscall

section .data
    access_granted_txt: db "access_granted", 10 
    laccess_granted_txt: equ $-access_granted_txt

    access_denied_txt: db "access_denied", 10
    laccess_denied_txt: equ $-access_denied_txt

    key: db "123"
    lkey: equ $-key

section .bss
    data: resb 100
