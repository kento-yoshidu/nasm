; https://atcoder.jp/contests/abc030/tasks/abc030_a

section .data
    fmt_in  db "%d %d %d %d", 0
    fmt_out db "%s", 10, 0
    takahashi db "TAKAHASHI", 0
    aoki db "AOKI", 0
    draw db "DRAW", 0

section .text
    global main
    extern scanf, printf

main:
    sub rsp, 24

    lea rdi, [rel fmt_in]
    lea rsi, [rsp]
    lea rdx, [rsp + 4]
    lea rcx, [rsp + 8]
    lea r8,  [rsp + 12]
    call scanf WRT ..plt

    mov eax, [rsp]
    mov ebx, [rsp + 4]
    mov ecx, [rsp + 8]
    mov edx, [rsp + 12]

    ; B * C
    mov esi, ebx
    imul esi, ecx

    ; A * D
    mov edi, eax
    imul edi, edx

    cmp esi, edi
    jg takahashi_win
    jl aoki_win

draw_case:
    lea rdi, [rel fmt_out]
    lea rsi, [rel draw]
    call printf WRT ..plt
    jmp end

takahashi_win:
    lea rdi, [rel fmt_out]
    lea rsi, [rel takahashi]
    call printf WRT ..plt
    jmp end

aoki_win:
    lea rdi, [rel fmt_out]
    lea rsi, [rel aoki]
    call printf WRT ..plt

end:
    add rsp, 24
    xor eax, eax
    ret

section .note.GNU-stack
