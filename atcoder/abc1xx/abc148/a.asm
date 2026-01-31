; https://atcoder.jp/contests/abc148/tasks/abc148_a

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
    xor eax, eax
    call scanf WRT ..plt

    lea rdi, [rel fmt_in]
    lea rsi, [rsp + 4]
    xor eax, eax
    call scanf WRT ..plt

    mov eax, [rsp]
    xor eax, [rsp + 4]

    lea rdi, [rel fmt_out]
    mov esi, eax
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
