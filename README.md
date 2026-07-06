# x86-64 Assembly Journey

> Entering the metal.

This repository documents my journey learning x86-64 Assembly from scratch — understanding how computers actually work beneath high-level languages.

Instead of relying on abstractions, this repo focuses on:
- raw Linux syscalls
- registers
- memory
- program flow
- CPU instructions
- low-level debugging
- ELF sections
- system architecture fundamentals

---

# Why?

I wanted to understand what really happens underneath languages like Python, JavaScript, and C.

Assembly strips programming down to its core:
- moving data
- manipulating memory
- making decisions
- communicating with the kernel

No frameworks.
No runtime magic.
Just the machine.

---

# Topics Covered

## Basics
- Hello World
- Linux syscalls
- Registers
- Program entry points
- Exiting programs
- Calculator

## Memory
- `.text`
- `.data`
- `.bss`
- Buffers
- Memory addressing

## Logic
- Comparisons
- CPU flags
- Conditional jumps
- Labels
- Control flow
- itoa and atoi

## Input / Output
- `read`
- `write`
- Terminal interaction

---

# Build & Run

Using GNU assembler (`as`) and linker (`ld`):

```bash
as program.s -o program.o
ld program.o -o program
./program
```

```bash
gcc -nostdlib -no-pie program.s -o program
./program
```
