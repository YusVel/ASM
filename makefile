all:
	gcc  -c -g -ggdb -o main.o main.c
	nasm -f elf64 -F dwarf test.asm -o test.o 
	gcc -g main.o test.o -o main -no-pie

