; https://atcoder.jp/contests/abc087/tasks/abc087_a

section .data
    fmt_in  db "%d %d %d", 0
    fmt_out db "%d", 10, 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    lea rdx, [rsp + 4]
    lea rcx, [rsp + 8]
    call scanf WRT ..plt

    mov eax, [rsp]
    sub eax, [rsp + 4]

    xor edx, edx
    div dword [rsp + 8]

    lea rdi, [rel fmt_out]
    mov esi, edx
    xor eax, eax
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
