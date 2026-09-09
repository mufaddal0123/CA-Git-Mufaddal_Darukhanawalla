.text
.globl main

main:
    li x10, 0x100       
    li x11, 0x200       
    li x12, 0x300      
     # Index 0: c[0] = a[0] + b[0]
    lb  x13, 0(x10)     # x13 = a[0]
    lh  x14, 0(x11)     # x14 = b[0]
    add x15, x13, x14   # x15 = a[0] + b[0]
    sw  x15, 0(x12)     # c[0] = x15

    # Index 1: c[1] = a[1] + b[1]
    lb  x13, 1(x10)     # x13 = a[1]
    lh  x14, 2(x11)     # x14 = b[1]
    add x15, x13, x14   # x15 = a[1] + b[1]
    sw  x15, 4(x12)     # c[1] = x15
     # Index 2: c[2] = a[2] + b[2]
    lb  x13, 2(x10)     # x13 = a[2]
    lh  x14, 4(x11)     # x14 = b[2]
    add x15, x13, x14   # x15 = a[2] + b[2]
    sw  x15, 8(x12)     # c[2] = x15

    # Index 3: c[3] = a[3] + b[3]
    lb  x13, 3(x10)     # x13 = a[3]
    lh  x14, 6(x11)     # x14 = b[3]
    add x15, x13, x14   # x15 = a[3] + b[3]
    sw  x15, 12(x12)    # c[3] = x15
done:
    j done