
.text
.global main

main:
    push {lr}

    ldr r0, =array //address        
    ldr r1, =size
    ldr r1, [r1]   //size              
    MOV r2,#0 //index
    MOV r3,#0 //current element
    MOV r4,#0 //max value

    BL iteration

    B end
setMaxvalue:
    MOV r4,r3
    B end_max

checkMaxValue:
    push {lr}
    cmp r3,r4
    BGT setMaxvalue
end_max:
    pop {pc}
    bx lr


iteration:
    cmp r2, r1                   
    beq end

    ldr r3, [r0, r2, LSL #2]
    BL checkMaxValue
    add r2, r2, #1               

    b iteration


end:
    mov r1, r4                 
    ldr r0, =output
    bl printf                  

    pop {lr}
    bx lr


.data
    output: .asciz "MAXIMUM VALUE: %d\n"
    array:  .word 12, 7, 22, 5, 17
    size: .word 5





