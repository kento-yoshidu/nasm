
nasm -f elf64 xxx.asm -o a.o

gcc -no-pie a.o -o a

./a
