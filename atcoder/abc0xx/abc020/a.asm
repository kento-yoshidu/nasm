; https://atcoder.jp/contests/abc020/tasks/abc020_a

section .data
    fmt_in   db "%d", 0
    fmt_out  db "%s", 10, 0
    abc      db "ABC", 0
    chokudai db "chokudai", 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    call scanf WRT ..plt

    mov eax, [rsp]
    cmp eax, 1
    jne .chokudai

.abc:
    lea rsi, [rel abc]
    jmp .print

.chokudai:
    lea rsi, [rel chokudai]

.print:
    lea rdi, [rel fmt_out]
    xor eax, eax
    call printf WRT ..plt

    add rsp, 24
    ret
