; https://atcoder.jp/contests/abc026/tasks/abc026_a

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
    mov ecx, 2
    div ecx
    imul eax, eax

    mov esi, eax
    lea rdi, [rel fmt_out]
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-stack

; 10
;=> 25

; 60
;=> 900
