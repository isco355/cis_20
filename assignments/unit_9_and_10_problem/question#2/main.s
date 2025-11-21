
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
        bl factorial     // call recursive function

        mov r1, r0                 
        ldr r0, =output
        bl printf                  

        pop {lr}
        bx lr


factorial:
        push {lr}
        cmp r0, #1                 // if n == 0
        beq base_case

        push {r0}                  // save (n-1)
        sub r0, r0, #1             // prepare argument for next call
        bl factorial     // recursive call: factorial(n-1)
        pop {r1}                   // restore (n-1)
        mul r0, r0, r1             // result = factorial(n-1) * n

        pop {lr}
        bx lr

base_case:
        mov r0, #1                 // base case: 1 
        pop {lr}
        bx lr
.data
    prompt: .asciz "Enter a number: "
    format: .asciz "%d"
    output: .asciz "factorial result: %d\n"
    num: .word 0

