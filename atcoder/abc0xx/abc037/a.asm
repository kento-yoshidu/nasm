; https://atcoder.jp/contests/abc037/tasks/abc037_a

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
    xor eax, eax
    call scanf WRT ..plt

    mov eax, [rsp]
    mov ecx, [rsp + 4]
    cmp eax, ecx
    jle .a_is_min
    mov eax, ecx
.a_is_min:

    mov ecx, eax
    mov eax, [rsp + 8]
    cdq
    div ecx

    mov esi, eax
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-stack
