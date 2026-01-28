
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
