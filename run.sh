cc -o exploit exploit.c
cc -o to_exploit to_exploit.c
./exploit | ./to_exploit