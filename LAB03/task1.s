.text
.globl main

main:
    addi x10, x0, 12     #a= 12(passed in x10)
    addi x11, x0, 12     #b= 12(passed in x11)
    
    jal x1, sum          #Jump and link to 'sum' and save return address in x1

    # Print the result
    addi x11, x10, 0     # Move the returned result from x10 to x11 for printing
    li x10, 1           
    ecall                #print

    j exit               # Jump to exit 

sum:
    add x10, x10, x11    # x10 = a+b 
    jalr x0, 0(x1)       # Return to the caller 

exit:
    li x10, 10           #exit program 
    ecall