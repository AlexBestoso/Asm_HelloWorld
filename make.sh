#bin/bash
clear
gcc hello.s -o hello.o -nostdlib
ld hello.o
echo "Run by executing the a.out ELF file like so:"
echo "./a.out"
