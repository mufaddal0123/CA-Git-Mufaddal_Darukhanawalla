main:
    li x22, 0           # i=0
    li x23, 0           # sum=0
    li t0, 0x200        # Base address of a
    li t1, 10           # Loop limit (i<10)

# First loop: a[i]=i
Loop1:
    bge x22, t1, EndL1  
    slli t2, x22, 2     # offset =i*4(since it's a 4-byte integer)
    add t3, t0, t2      # Address of a[i]
    sw x22, 0(t3)       # a[i]=i
    addi x22, x22, 1    # i++
    beq x0, x0, Loop1   
EndL1:

    li x22, 0           # Reset i=0 for the second loop
    
# Second loop: sum=sum+a[i]
Loop2:
    bge x22, t1, EndL2  
    slli t2, x22, 2     
    add t3, t0, t2      
    lw t4, 0(t3)        # Load a[i] into t4
    add x23, x23, t4    # sum=sum+a[i]
    addi x22, x22, 1    # i++
    beq x0, x0, Loop2   
EndL2: