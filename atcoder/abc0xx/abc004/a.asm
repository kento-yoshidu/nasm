; https://atcoder.jp/contests/abc004/tasks/abc004_1

section .data
    fmt_in  db "%d", 0
    fmt_out db "%d", 10, 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    call scanf WRT ..plt

    mov eax, [rsp]
    imul eax, 2

    lea rdi, [rel fmt_out]
    mov esi, eax
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
