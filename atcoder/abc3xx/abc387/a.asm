; https://atcoder.jp/contests/abc387/tasks/abc387_a

section .data
    fmt_in  db "%d %d", 0
    fmt_out db "%d", 10, 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    lea rdx, [rsp + 4]
    xor eax, eax
    call scanf WRT ..plt

    mov eax, [rsp]
    add eax, [rsp + 4]
    imul eax, eax

    lea rdi, [rel fmt_out]
    mov esi, eax
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
