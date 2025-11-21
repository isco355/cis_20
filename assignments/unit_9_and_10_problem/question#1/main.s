
.text
.global main

main:
        push {lr}

        ldr r0, =prompt
        bl printf                  
        ldr r0, =format
        ldr r1, =num
        bl scanf                   

        ldr r0, =num
        ldr r0, [r0]               
        MOV r5, r0              
        bl summation_recursive     // call recursive function

        mov r1, r0                 
        ldr r0, =output
        bl printf                  

        pop {lr}
        bx lr


summation_recursive:
        push {lr}
        cmp r0, #1                 // if n == 0
        beq base_case

        sub r0, r0, #1             
        push {r0}                  // save (n-1)
        bl summation_recursive     // recursive call: sum(n-1)
        pop {r1}                   // restore (n-1)
        add r0, r0, r5             // result = sum(n-1) + n

        pop {lr}
        bx lr

base_case:
        mov r0, r5                 // base case: n 
        pop {lr}
        bx lr
.data
    prompt: .asciz "Enter a number: "
    format: .asciz "%d"
    output: .asciz "result %d\n"
    num: .word 0


