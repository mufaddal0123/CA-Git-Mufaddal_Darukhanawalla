.text
.globl main

main:
    li x20, 5          
    li x21, 0          # b = 0 + 0

    addi x20, x21, 32  # a = b + 32

    add x5, x20, x21   
    addi x23, x5, -5   # d = (a + b) - 5

    sub x5, x20, x23   
    sub x6, x21, x20   
    add x5, x5, x6    
    add x24, x5, x23   

    add x5, x20, x21   
    add x5, x5, x23    
    add x24, x5, x24   # e = a + b + d + e

end:
    j end              
