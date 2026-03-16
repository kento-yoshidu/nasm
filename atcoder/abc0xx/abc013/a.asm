; https://atcoder.jp/contests/abc013/tasks/abc013_1

section .data
    fmt_in  db "%c", 0
    fmt_out db "%d", 10, 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    call scanf WRT ..plt

    movzx eax, byte [rsp]
    sub eax, 'A'
    add eax, 1

    lea rdi, [rel fmt_out]
    mov esi, eax
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-stack
