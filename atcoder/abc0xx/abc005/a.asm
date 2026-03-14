; https://atcoder.jp/contests/abc005/tasks/abc005_1

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

    mov eax, [rsp + 4]
    xor edx, edx
    mov ecx, [rsp]
    div ecx

    mov esi, eax
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-stack

; 4 8
;=> 2

; 4 7
;=> 1

; 4 3
;=> 0
