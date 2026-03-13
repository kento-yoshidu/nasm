; https://atcoder.jp/contests/abc437/tasks/abc437_a

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
    call scanf WRT ..plt

    mov eax, [rsp]
    imul eax, 12
    add eax, [rsp + 4]

    lea rdi, [rel fmt_out]
    mov esi, eax
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
