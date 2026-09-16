main:
    li x20, 3           # x= 3 (Will trigger Case 3)
    li x22, 10          # b= 10
    li x23, 5           # c= 5
    li x21, 0           # a= 0

    li t0, 1
    beq x20, t0, Case1
    li t0, 2
    beq x20, t0, Case2
    li t0, 3
    beq x20, t0, Case3
    li t0, 4
    beq x20, t0, Case4
    beq x0, x0, Default 

Case1:
    add x21, x22, x23   # a=b+c
    beq x0, x0, End
Case2:
    sub x21, x22, x23   # a=b-c
    beq x0, x0, End
Case3:
    slli x21, x22, 1    # a=b*2 
    beq x0, x0, End
Case4:
    srai x21, x22, 1    # a=b/2 
    beq x0, x0, End
Default:
    li x21, 0           # a=0
End: