.text
.globl main

main:
    addi sp, sp, -20

    li x28, 5
    sw x28, 0(sp)       # arr[0]=5    
    li x28, 2
    sw x28, 4(sp)       # arr[1]=2
    li x28, 9
    sw x28, 8(sp)       # arr[2]=9
    li x28, 1
    sw x28, 12(sp)      # arr[3]=1
    li x28, 7
    sw x28, 16(sp)      # arr[4]=7

    # Load arguments for bubble sort
    add x10, sp, x0     # x10=base address of the array
    li x11, 5           # x11=length of the array 

    # Call the bubble sort procedure
    jal x1, bubble

End:
    addi sp, sp, 20     # Deallocate stack space once sorting is done
trap:
    beq x0, x0, trap   


# void bubble(int *a, unsigned int len)
bubble:
    # Check null/zero conditions
    beq x10, x0, end_bubble  # if (a==null),return
    beq x11, x0, end_bubble  # if (len==0),return
    add x5, x0, x0           # int i=0 

outer_loop:
    bge x5, x11, end_bubble  # if (i>=len),end outer loop
    add x6, x5, x0           # int j=i 

inner_loop:
    bge x6, x11, end_outer   # if (j>=len),end inner loop

    # Load a[i]
    slli x7, x5, 2           # Calculate byte offset for i(i*4)
    add x7, x10, x7          # Memory address of a[i]
    lw x28, 0(x7)            # Load a[i] into x28

    # Load a[j]
    slli x29, x6, 2          # Calculate byte offset for j(j*4)
    add x29, x10, x29        # Memory address of a[j]
    lw x30, 0(x29)           # Load a[j] into x30

    # Compare and conditional swap
    bge x28, x30, skip_swap  # if (a[i]>=a[j]),skip the swap block

    # Perform swap
    sw x30, 0(x7)            # a[i]=a[j]
    sw x28, 0(x29)           # a[j]=temp (original a[i])

skip_swap:
    addi x6, x6, 1           # j++
    j inner_loop             # Jump back to start of inner loop

end_outer:
    addi x5, x5, 1           # i++
    j outer_loop             # Jump back to start of outer loop

end_bubble:
    jalr x0, 0(x1)           # Return to caller