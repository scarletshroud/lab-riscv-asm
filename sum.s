.data

array_size:
    .word 4

row:
    .word 2

array:
    .word 4, 3, 4, 5
    .word 1, 4, 5, 7
    .word 5, 1, 0, 6
    .word 10, 11, 1, 2

sum:
    .word 0

message:
    .asciiz "Result: "

.text
.globl start

start:
    la a2, array_size
    la a3, array
    la a4, sum
    la a5, row
    
    call main

    call print_message
    call print_int
    call print_newline

    call exit

main:
    lw t1, 0(a2) # load the array size
    lw t4, 0(a5) # load the row for summation
    lw t2, 0(a3) # load the pointer to array
    addi t3, zero, 0 # store the result
    addi t5, zero, 1 # counter

    li t6, 1 # calculate the row offset
    slli t6, t1, 2

shift: # shift to the desired row 
    bge t5, t4, shift_end
    add a3, a3, t6
    addi t5, t5, 1
    jal zero, shift

shift_end:
    li t5, 0 # clear the counter

count_row: # sum up the row
    bge t5, t1, count_row_end
    lw t2, 0(a3)
    add t3, t3, t2
    addi a3, a3, 4
    addi t5, t5, 1
    jal zero, count_row

count_row_end: # store the result
    sw t3, 0(a4)
    ret
 
exit:
    addi a0, zero, 10
    ecall

print_int:
    addi, a0, zero, 1 # print int ecall
    lw a1, 0(a4)
    ecall
    ret

print_message:
    addi a0, zero, 4 # print string ecall
    la a1, message
    ecall
    ret

print_newline:
    addi a0, zero, 11
    addi a1, zero, '\n'
    ecall
    ret