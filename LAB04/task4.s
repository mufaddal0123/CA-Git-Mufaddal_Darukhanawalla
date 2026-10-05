.text
.globl main

main:
    li x10, 2           # Argument 1 (Base): 2
    li x11, 3           # Argument 2 (Exponent): 3
    jal x1, power       # Call power(2, 3)
    
    add x21, x10, x0    # Save final result (8) to x21 for viewing

End:
    beq x0, x0, End     # Infinite loop to halt

#int power(int base, int exp)
power:
    #Base case= if (exp==0) return 1
    bne x11, x0, recurse
    li x10, 1           #Return 1
    jalr x0, 0(x1)      #Return to caller

recurse:
    #allocate stack and save registers
    addi sp, sp, -8     #Make room for 2 items
    sw x1, 4(sp)        #Save return address (ra)
    sw x10, 0(sp)       #Save the original base value

    #for recursive call
    addi x11, x11, -1   #exp=exp-1
    jal x1, power       #Call power(base, exp-1)

    #restore registers
    lw x5, 0(sp)        #Restore original base into a temporary register (x5)
    lw x1, 4(sp)        #Restore return address (ra)
    addi sp, sp, 8      #Pop the stack

    #Calculate final result for this frame
    mul x10, x10, x5    #result=returned_value * original_base
    jalr x0, 0(x1)      #Return to caller