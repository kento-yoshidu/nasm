; https://atcoder.jp/contests/abc033/tasks/abc033_a

section .data
    fmt_in    db "%d", 0
    fmt_out   db "%s", 10, 0
    same      db "SAME", 0
    different db "DIFFERENT", 0

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
    mov ecx, 1111
    div ecx
    mov esi, edx

    cmp edx, 0
    je .same

.different:
    lea rsi, [rel different]
    jmp .printf

.same:
    lea rsi, [rel same]

.printf
    lea rdi, [rel fmt_out]
    call printf WRT ..plt

    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-satck
