# ICS3203-CAT2-Assembly-GabrielMungai152048
## Purpose of the programs
### Question1.asm
- This program prompts the user to input a number and classifies it as POSITIVE, NEGATIVE, or ZERO.

### Question2.asm 
- This program reverses an array of integers in place, without using additional memory for the reversed array.

### Question3.asm
- This program calculates the factorial of a number using a recursive subroutine.

### Question4.asm: 
This program simulates a control system that:

-Reads a "sensor value" from a memory location or input port (simulating a water level sensor).

-Performs specific actions based on the sensor input:
* Turns on a motor (by setting a bit in a specific memory location) if the water level is low.
* Triggers an alarm if the water level is too high.
* Stops the motor if the water level is moderate.

## Instructions on Compiling code
* First save the code e.g *questionx.asm* (x represents the number)

* Compile the code
```sh
nasm -f elf32 questionx.asm -o questionx.o
ld -m elf_i386 questionx.o -o questionx
./questionx
```
* Run the code
```sh
gdb --silent questionx
layout reg
break_start
stepi
```
* To run through and exit the code
```sh
continue
quit
```
## Challenges
### Question1.asm
- The question required the use of both conditional (je, jl, etc.) and unconditional jumps (jmp), which needed to be balanced effectively to maintain readability and logic.

### Question2.asm
- Direct manipulation of memory requires careful use of registers and addresses.
- Handling ASCII conversion ensures correct output for numeric values.

### Question3.asm
- Managing the stack efficiently is critical to avoid corruption of data.
- Recursive implementation was avoided for simplicity, and an iterative approach was used.

### Question4.asm
- Efficient branching is crucial to avoid redundant operations.
- Simulating hardware behavior requires careful handling of memory-mapped variables.

