; https://atcoder.jp/contests/abc074/tasks/abc074_a

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
    imul eax, eax
    sub eax, [rsp + 4]

    mov esi, eax
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-stack
