main:
    li x10, 10   #g= 10
    li x11, 5    #h= 5
    li x12, 3    #i= 3
    li x13, 2    #j= 2

    #call function
    jal x1, leaf_example #Jump to procedure and save return address

    li x17, 10           #call for exit (ecall 10)
    ecall


leaf_example:
    addi sp, sp, -32     #Allocate 32 bytes on the stack
    sw x18, 0(sp)        #temporary register x18
    sw x19, 4(sp)        #temporary register x19
    sw x20, 8(sp)        #Preserve saved register x20 (f)

    add x18, x10, x11    #x18= g+h(x10 + x11)
    add x19, x12, x13    #x19= i+j(x12 + x13)
    sub x20, x18, x19    #x20(f)= (g+h) - (i+j)
    
    addi x10, x20, 0     #move the final result (f) into the return register x10

    lw x18, 0(sp)        #restore original x18
    lw x19, 4(sp)        #restore original x19
    lw x20, 8(sp)        #restore original x20
    addi sp, sp, 32      #deallocate the stack space

    jalr x0, 0(x1)       #Return to caller