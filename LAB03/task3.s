.text
.globl main

main:
    li x10, 0x200        #base address of our array
    li x11, 2            #setting index k to 2
    li x28, 10           
    sw x28, 0(x10)       #v[0]=10
    li x28, 20           
    sw x28, 4(x10)       #v[1]=20
    li x28, 30           
    sw x28, 8(x10)       #v[2]=30
    li x28, 40           
    sw x28, 12(x10)      #v[3]=40

    jal x1, swap         #jump to the swap function
    j finish             

swap:
    slli x29, x11, 2     #multiply k by 4 to get byte offset
    add x30, x10, x29    #find the exact memory address of v[k]

    lw x31, 0(x30)       #read the first number
    lw x7, 4(x30)        #read the number right next to it
    
    sw x7, 0(x30)        #store the second number in the first spot
    sw x31, 4(x30)       #store the first number in the second spot

    jalr x0, 0(x1)       #return to main

finish:
    j finish
    