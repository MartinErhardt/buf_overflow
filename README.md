buf_overflow
============
### Short description
> just an exploitation of a real stupid dummy process using a buffer overflow

### Some general notes
This will only work on FREEBSD ARM and probably even more specific a few raspberry pis running freebsd
Stack layout in ARM:
      	- fp[-0] saved pc, where we stored this frame.
        - fp[-1] saved lr, the return address for this function. 
	- fp[-2] previous sp, before this function eats stack.
        - fp[-3] previous fp, the last stack frame.
We overwrite the return address with 0xbfffec70 which is most of the time the address where our shellcode is stored at. sometimes it has also been 0xbfffec40 especcially if I attached gdb.
This works only in about 70 % of cases. Maybe it tries to access the stack sometimes.
0xeafffffe is the ARM opcode for "label: b label" or simply an endless loop. Unfortunately ARM Opcode of the NOP instruction contains NUL bytes, and the 0x90 I filled the rest of the 12 bytes can't be by my RPI for obvious reasons.
# How to test
```
./run.sh
```
