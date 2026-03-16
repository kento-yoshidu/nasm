; https://atcoder.jp/contests/abc016/tasks/abc016_1

section .data
    fmt_in  db "%d %d", 0
    fmt_out db "%s", 10, 0
    yes     db "YES", 0
    no      db "NO", 0

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
    mov ecx, [rsp + 4]
    xor edx, edx
    div ecx

    cmp edx, 0
    jne .no

.yes:
    lea rsi, [rel yes]
    jmp .print

.no:
    lea rsi, [rel no]

.print:
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    add rsp, 24
    ret

section .note.GNU-stack
