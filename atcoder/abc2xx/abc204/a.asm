; https://atcoder.jp/contests/abc204/tasks/abc204_a

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

    mov eax, 6
    sub eax, [rsp]
    sub eax, [rsp + 4]

    xor edx, edx
    mov ecx, 3
    div ecx

    mov esi, edx
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
