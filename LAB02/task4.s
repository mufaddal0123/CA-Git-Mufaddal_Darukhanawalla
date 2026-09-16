.text
main:
    li x5, 3            # a = 3 
    li x6, 4            # b = 4 
    li x10, 0x200       # Base address of array D
    li x7, 0            # i = 0

OuterLoop:
    bge x7, x5, EndOut  
    li x29, 0           # j = 0

InnerLoop:
    bge x29, x6, EndIn  
    
    # Using x11, x12, x13 for temporary math to protect x5, x6, x7
    add x11, x7, x29    # x11 = i + j
    
    slli x12, x29, 4    # Multiply j by 16 for offset
    add x13, x10, x12   # Add offset to base address
    sw x11, 0(x13)      # D[4*j] = i + j
    
    addi x29, x29, 1    # j++
    beq x0, x0, InnerLoop

EndIn:
    addi x7, x7, 1      # i++
    beq x0, x0, OuterLoop

EndOut:
    beq x0, x0, EndOut  # 