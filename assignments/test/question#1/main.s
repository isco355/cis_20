.global main

.equ endlist, 0xaaaaaaaa  @ Define end marker constant

main:
    LDR R0, =list        @ Load address of list into R0
    MOV R2, #0           @ Initialize sum to 0
    LDR R3, =endlist     @ Load end marker value into R3
    
    @ Load first element and add to sum
    LDR R1, [R0]         @ Load first element
    ADD R2, R2, R1       @ Add to sum
    ADD R0, R0, #4       @ Move to next element
    
loop:
    LDR R1, [R0]         @ Load current element
    CMP R1, R3           @ Compare with end marker
    BEQ exit             @ If equal to end marker, exit loop
    
    ADD R2, R2, R1       @ Add current element to sum
    ADD R0, R0, #4       @ Move to next element (4 bytes)
    B loop               @ Branch back to start of loop

exit:

.data
    list: .word 1, 2, 3, 4, 0xaaaaaaaa  @ List with end marker
