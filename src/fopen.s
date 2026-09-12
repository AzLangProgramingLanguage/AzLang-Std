.intel_syntax noprefix
.global fopen
.text

fopen:
    mov rax, 2      
    syscall
    ret
