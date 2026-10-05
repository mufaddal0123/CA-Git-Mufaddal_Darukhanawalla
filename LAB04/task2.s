.text
.globl main

main:
    addi x10, x0, 5         # arg=5
    jal x1, ntri            # Call the ntri function
    
    add x11, x10, x0        # Move result to x11 for ecall
    addi x17, x0, 1         # ecall code 1=print integer
    ecall
    addi x17, x0, 10        # ecall code 10: exit
    ecall

# Recursive Function
ntri:
    addi sp, sp, -8         # Adjust stack to allocate space for 2 items
    sw x1, 4(sp)            # Save the return address
    sw x10, 0(sp)           # Save the argument (num)

    addi x5, x0, 1          # Set temporary register x5=1
    bgt x10, x5, recurse    # if (num>1), branch to recursive step
    
    # Base case execution (num<=1)
    addi x10, x0, 1         # return 1
    addi sp, sp, 8          # Pop the stack
    jalr x0, 0(x1)          # Return to caller

recurse:
    addi x10, x10, -1       # num=num-1
    jal x1, ntri            # Recursive call: ntri(num-1)

    addi x6, x10, 0         # Save the returned result of ntri(num-1) in x6
    lw x10, 0(sp)           # Restore the original num from the stack
    lw x1, 4(sp)            # Restore the return address from the stack
    addi sp, sp, 8          # Pop the stack to deallocate space

    add x10, x10, x6        # Result=num+ntri(num-1)
    jalr x0, 0(x1)          # Return to caller