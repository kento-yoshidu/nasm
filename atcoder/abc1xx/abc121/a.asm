; https://atcoder.jp/contests/abc121/tasks/abc121_a

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
    xor eax, eax
    call scanf WRT ..plt

    lea rdi, [rel fmt_in]
    lea rsi, [rsp + 8]
    lea rdx, [rsp + 12]
    xor eax, eax
    call scanf WRT ..plt

    mov eax, [rsp]
    sub eax, [rsp + 8]
    mov ecx, [rsp + 4]
    sub ecx, [rsp + 12]

    imul eax, ecx

    mov esi, eax
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
