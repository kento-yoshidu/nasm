; https://atcoder.jp/contests/abc010/tasks/abc010_1

section .data
    fmt_in  db "%s", 0
    fmt_out db "%spp", 10, 0

section .bss
    s resb 32

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rel s]
    call scanf WRT ..plt

    lea rdi, [rel fmt_out]
    lea rsi, [rel s]
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-stack
