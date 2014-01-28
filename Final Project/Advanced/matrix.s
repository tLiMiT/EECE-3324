# initialize the two matrices
.data
matrix1:
.word 1, 2, 3, 4, 5, 6, 7, 8, 9
matrix2:
.word 2, 4, 6, 8, 10, 12, 14, 16, 18
matrix3:

.text
    addi  $r24, $r0, 0   # the index for accessing Matrix1 and Matrix2 
    addi  $r25, $r0, 36  # the total number of bytes stored in a matrix 
cal:
    lw    $r2, $r24, matrix1
    lw    $r3, $r24, matrix2
    add   $r8, $r2, $r3    # a load-use stall occurs here, this is the use instruction
                           # followed by an MEM-Ex forwarding
    sw    $r8, $r24, matrix3  # needs X-X forwarding for this instruction 
    addi  $r24, $r24, 4    # r24 = r24 + 4
 
    add   $r15, $r0, $r0   # just to avoid a data hazard over a control instruction 
    add   $r15, $r0, $r0   # for the next instruction
    
    beq   $r24, $r25, cont # control hazard - one cycle delay
    j     cal              # control hazard - one cycle delay
cont:
    # load results to registers for verification
    # a lot of Ex-Ex forwardings happen next
    addi  $r2, $r0, 0
    lw    $r8, $r2, matrix3  # X-X forward
    addi  $r2, $r2, 4 
    lw    $r9, $r2, matrix3
    addi  $r2, $r2, 4
    lw    $r10, $r2, matrix3
    addi  $r2, $r2, 4
    lw    $r11, $r2, matrix3
    addi  $r2, $r2, 4
    lw    $r12, $r2, matrix3
    addi  $r2, $r2, 4
    lw    $r13, $r2, matrix3
    addi  $r2, $r2, 4
    lw    $r14, $r2, matrix3
    addi  $r2, $r2, 4
    lw    $r15, $r2, matrix3
    addi  $r2, $r2, 4
    lw    $r24, $r2, matrix3
    hlt

