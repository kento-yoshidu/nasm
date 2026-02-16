
```bash
nasm -f elf64 xxx.asm -o a.o

gcc -no-pie a.o -o a

./a
```

|レジスタ|主な役割|
|-------|------------|
|**RAX**|戻り値・演算の中心|
|**RBX**|callee-saved|
|**RCX**|カウンタ・第4引数|
|**RDX**|第3引数|
|**RSI**|第2引数|
|**RDI**|第1引数|
|**RSP**|スタックポインタ|
|**RBP**|フレームポインタ|
|**R8**|第5引数|
|**R9**|第6引数|
|**R10**|一時|
|**R11**|一時|
|**R12**|calee-saved|
|**R13**|calee-saved|
|**R14**|calee-saved|
|**R15**|calee-saved|

|用途|レジスタ|
|----|----|
|第1引数|RDI|
|第2引数|RSI|
|第3引数|RDX|
|第4引数|RCX|
|第5引数|R8|
|第6引数|R9|
|戻り値|RAX|

| 命令   | 意味       | 例                    |
| ---- | -------- | -------------------- |
| mov  | コピー      | `mov rax, 48`        |
| lea  | アドレス計算   | `lea rdi, [rel fmt]` |
| push | スタックに積む  | `push rbp`           |
| pop  | スタックから取る | `pop rbp`            |

| 命令   | 意味   | 例              |
| ---- | ---- | -------------- |
| add  | 加算   | `add rax, rcx` |
| sub  | 減算   | `sub rax, rdx` |
| imul | 乗算   | `imul rax, 10` |
| inc  | +1   | `inc rax`      |
| dec  | -1   | `dec rax`      |
| neg  | 符号反転 | `neg rax`      |

| 命令  | 意味      | 例             |
| --- | ------- | ------------- |
| cmp | 比較      | `cmp rax, 10` |
| je  | 等しい     | `je L1`       |
| jne | 等しくない   | `jne L1`      |
| jl  | <（符号付き） | `jl L1`       |
| jle | ≤（符号付き） | `jle L1`      |
| jg  | >（符号付き） | `jg L1`       |
| jge | ≥（符号付き） | `jge L1`      |
| jmp | 無条件     | `jmp L1`      |

| 命令   | 意味         | 例               |
| ---- | ---------- | --------------- |
| and  | AND        | `and rax, 1`    |
| or   | OR         | `or rax, 1`     |
| xor  | XOR / 0クリア | `xor rax, rax`  |
| test | AND比較      | `test rax, rax` |
| shl  | 左シフト       | `shl rax, 1`    |
| shr  | 右シフト       | `shr rax, 1`    |

| 命令   | 意味   | 例                       |
| ---- | ---- | ----------------------- |
| call | 呼び出し | `call printf WRT ..plt` |
| ret  | 戻る   | `ret`                   |

| 書き方           | 意味         |
| ------------- | ---------- |
| `[rsp]`       | 64bit 読み書き |
| `qword [rsp]` | 64bit 明示   |
| `[rbp-8]`     | ローカル変数     |

```nasm
section .data                      ; データ領域（定数や文字列を置く場所）

    fmt_in  db "%d %d", 0          ; scanf用フォーマット文字列
                                   ; db = 1バイトずつ配置
                                   ; 0 は C文字列の終端（ヌル文字）

    fmt_out db "%f", 10, 0         ; printf用フォーマット
                                   ; "%f" で double を表示
                                   ; 10 = 改行 '\n'
                                   ; 0  = ヌル終端

    hundred dq 100.0               ; dq = 8バイト確保
                                   ; double は 8バイトなので dq
                                   ; 100.0 をメモリに保存

section .text                      ; 命令を書く領域

    global main                    ; main を外部公開（エントリーポイント）
    extern scanf, printf           ; 外部関数を使う宣言

main:

    sub rsp, 24                    ; スタックに24バイト確保
                                   ; rsp = スタックポインタ
                                   ; ここに scanf の入力値を保存する
                                   ;
                                   ; [rsp]     に1つ目のint
                                   ; [rsp+4]   に2つ目のint
                                   ;
                                   ; ※ 本来は16バイトアラインを意識する必要あり

    ; ------------------------------
    ; scanf("%d %d", &a, &b)
    ; ------------------------------

    lea rdi, [rel fmt_in]          ; 第1引数 rdi = フォーマット文字列
                                   ; lea = アドレスを入れる命令

    lea rsi, [rsp]                 ; 第2引数 rsi = 1つ目の整数の保存先
                                   ; &a に相当

    lea rdx, [rsp + 4]             ; 第3引数 rdx = 2つ目の整数の保存先
                                   ; &b に相当

    call scanf WRT ..plt           ; scanf呼び出し
                                   ; 実行後:
                                   ; [rsp]     = a
                                   ; [rsp+4]   = b

    ; ------------------------------
    ; a * b を計算
    ; ------------------------------

    mov eax, [rsp]                 ; eax = a
                                   ; 32bit整数ロード

    imul eax, [rsp + 4]            ; eax = eax * b
                                   ; 符号付き整数乗算
                                   ; 結果は eax に入る

    ; ------------------------------
    ; int → double 変換
    ; ------------------------------

    cvtsi2sd xmm0, eax             ; Convert Signed Integer to Scalar Double
                                   ; xmm0 = (double) eax
                                   ;
                                   ; printf("%f") は double を要求するので
                                   ; 必ず double に変換する必要がある

    ; ------------------------------
    ; 100.0 で割る
    ; ------------------------------

    movsd xmm1, [rel hundred]      ; xmm1 = 100.0
                                   ; movsd = double をロード

    divsd xmm0, xmm1               ; xmm0 = xmm0 / xmm1
                                   ; つまり (a*b)/100.0

    ; ------------------------------
    ; printf("%f\n", result)
    ; ------------------------------

    lea rdi, [rel fmt_out]         ; 第1引数 rdi = フォーマット文字列

    mov eax, 1                     ; ★超重要★
                                   ; printfは可変長関数
                                   ; System V ABIでは
                                   ; rax = 使用したxmmレジスタ数
                                   ;
                                   ; 今回は xmm0 を使っているので 1

    call printf WRT ..plt          ; printf呼び出し
                                   ;
                                   ; この時のレジスタ状態:
                                   ; rdi  = "%f\n"
                                   ; xmm0 = 計算結果(double)
                                   ; rax  = 1

    ; ------------------------------
    ; return 0
    ; ------------------------------

    xor eax, eax                   ; mainの戻り値 = 0

    add rsp, 24                    ; スタックを元に戻す
                                   ; subで減らした分を戻す

    ret                            ; 呼び出し元へ戻る

section .note.GNU-stack            ; 実行不可スタック指定（セキュリティ用）
```
