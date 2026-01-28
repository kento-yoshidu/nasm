; https://atcoder.jp/contests/abc084/tasks/abc084_a

section .data
    fmt_in  db "%d", 0
    fmt_out db "%d", 10, 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 8

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    xor eax, eax
    call scanf WRT ..plt

    mov eax, 48
    sub eax, dword [rsp]

    mov esi, eax
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 8
    ret
