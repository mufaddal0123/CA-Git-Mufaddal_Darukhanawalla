.text
.globl main

main:
    li x11, 0x200        # y string address
    li x10, 0x300        # x string address 

    li x28, 'H'          
    sb x28, 0(x11)       
    li x28, 'i'          
    sb x28, 1(x11)      
    li x28, 0            
    sb x28, 2(x11)       
    jal x1, strcpy       # call func

finish:
    li x10, 10           # exit code
    ecall                # stop program

strcpy:
    addi sp, sp, -16     # make 16-byte space on stack
    sw x19, 0(sp)        
    li x19, 0            # i = 0

loop:
    add t1, x11, x19     # get y[i] address
    lbu t2, 0(t1)        # load letter
    add t3, x10, x19     # get x[i] address
    sb t2, 0(t3)         # save letter to x
    beq t2, x0, done     # exit loop if null (0)
    addi x19, x19, 1     # i++
    j loop               # go back
done:
    lw x19, 0(sp)        # get old x19 back using lw (32-bit)
    addi sp, sp, 16     
    jalr x0, 0(x1)       # return to main