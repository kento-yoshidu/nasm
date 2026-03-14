; https://atcoder.jp/contests/abc011/tasks/abc011_1

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

    xor edx, edx
    mov ecx, 12
    div ecx

    mov eax, edx
    add eax, 1

    mov esi, eax
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
