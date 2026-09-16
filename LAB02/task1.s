.text
.globl main

#listing 3
main:
    li x22, 8
    li x23, 7
    li x20, 3
    li x21, 1

    bne x22, x23, Else
    add x19, x20, x21
    beq x0, x0, Exit
    Else: sub x19, x20, x21
    Exit:

#listing 4
main:
    li x22, 0           # i=0
    li x24, 2           # k=2
    li x25, 0x200       # Base address

    # Memory Initialization: save[i] = [2,2,4,2]
    li x10, 2
    sw x10, 0(x25)      # save[0]=2
    sw x10, 4(x25)      # save[1]=2
    li x10, 4
    sw x10, 8(x25)      # save[2]=4
    li x10, 2
    sw x10, 12(x25)     # save[3]=2

loop: 
    slli x10, x22, 2    # Offset=i * 4
    add x10, x10, x25   # Address of save[i]
    lw x9, 0(x10)       # Load save[i] into x9
    bne x9, x24, Exit   # If save[i]!=k, exit loop
    addi x22, x22, 1    # i++
    beq x0, x0, loop    # Jump back to loop

Exit:
