; https://atcoder.jp/contests/abc045/tasks/abc045_a

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

    lea rdi, [rel fmt_in]
    lea rsi, [rsp + 8]
    xor eax, eax
    call scanf WRT ..plt

    mov eax, dword [rsp]
    add eax, dword [rsp + 4]
    imul eax, dword [rsp + 8]
    shr eax, 1

    mov esi, eax
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret
