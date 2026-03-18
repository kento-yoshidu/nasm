; https://atcoder.jp/contests/abc012/tasks/abc012_1

section .data
    fmt_in  db "%d %d", 0
    fmt_out db "%d %d", 10, 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    lea rdx, [rsp + 4]
    call scanf WRT ..plt

    lea rdi, [rel fmt_out]
    mov esi, [rsp + 4]
    mov edx, [rsp]
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
