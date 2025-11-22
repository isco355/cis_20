
.text
.global main

main:
    push {lr}

    ldr r0, =array               
    ldr r1, =size
    ldr r1, [r1]                 

    bl recursive_sum             
    
    mov r1, r0                 
    ldr r0, =output
    bl printf                  


    pop {lr}
    bx lr

recursive_sum:
    cmp r1, #0                   
    beq base_case

    push {r2,lr}            

    ldr r2, [r0], #4             
    sub r1, r1, #1               
    mov r0, r0                   

    bl recursive_sum             

    add r0, r0, r2               
    pop {r2,lr}             
    bx lr                       

base_case:
    mov r0, #0                   
    bx lr                       
.data
    output: .asciz "sum: %d\n"
    array:  .word 1,2,3,4,5,6,7,8,9,10
    size: .word 10





