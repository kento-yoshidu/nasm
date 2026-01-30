section .data
    fmt_in  db "%d", 0
    fmt_abc db "ABC", 10, 0
    fmt_abd db "ABD", 10, 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    xor eax, eax
    call scanf WRT ..plt

    mov eax, dword [rsp]
    cmp eax, 999
    jle .print_abc

.print_abd:
    lea rdi, [rel fmt_abd]
    xor eax, eax
    call printf WRT ..plt
    jmp .end

.print_abc:
    lea rdi, [rel fmt_abc]
    xor eax, eax
    call printf WRT ..plt

.end:
    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-stack
