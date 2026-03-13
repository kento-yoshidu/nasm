; https://atcoder.jp/contests/abc205/tasks/abc205_a

section .data
    fmt_in  db "%d %d", 0
    fmt_out db "%f", 10, 0
    hundred dq 100.0

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
    imul eax, [rsp + 4]

    cvtsi2sd xmm0, eax

    movsd xmm1, [rel hundred]
    divsd xmm0, xmm1

    lea rdi, [rel fmt_out]
    mov eax, 1
    call printf WRT ..plt

    xor eax, eax
    add rsp, 24
    ret

section .note.GNU-stack
