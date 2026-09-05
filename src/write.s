.intel_syntax noprefix
.global write 
.text

write:
    mov rax, 1      
    syscall
    ret


