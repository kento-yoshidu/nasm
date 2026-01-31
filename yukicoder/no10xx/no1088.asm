; https://yukicoder.me/problems/no/1088

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
    lea rdx, [rsp+4]
    xor eax, eax
    call scanf WRT ..plt

    mov eax, [rsp]
    add eax, [rsp+4]

    mov esi, eax
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret
