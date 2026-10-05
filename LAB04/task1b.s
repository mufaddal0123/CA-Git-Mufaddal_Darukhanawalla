.text
.globl main

main:
    li x10, 5           #Load argument n=5
    jal x1, fact        #Call iterative factorial
    add x21, x10, x0    #Save final result to x21 for viewing

End:
    beq x0, x0, End     # Infinite loop to halt execution

fact:
    li x11, 1           # acc=1 (using x11 as the accumulator)

loop:
    ble x10, x0, done   # while (n>0): if n<=0, branch to 'done'
    mul x11, x11, x10   # acc=acc*n
    addi x10, x10, -1   # n=n-1
    j loop              # jump back to start of loop

done:
    add x10, x11, x0    # Move the result (acc) into x10 for return
    jalr x0, 0(x1)      # Return to caller