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
        bl summation_recursive     // call recursive function

        pop {lr}
        bx lr

printOdd:
        mov r1,r0
        ldr r0, =output
        bl printf
        bl end_odd

isOdd:
        push {r0,lr}
        tst r0, #1
        moveq r2, #0        @ If LSB is 0 (even), set result to 0
        movne r2, #1        @ If LSB is 1 (odd), set result to 1
        cmp r2,#1
        BEQ printOdd
end_odd:
        pop {r0,lr}
        bx lr

summation_recursive:
        push {lr}
        cmp r0, #0                 // if n == 0
        beq base_case

        push {r0}
        # push {r0}                  // save (n-1)
        bl isOdd
        sub r0, r0, #1             
        bl summation_recursive     // recursive call: sum(n-1)
        pop {r0}                   // restore (n-1)
        # add r0, r0, r1             // result = sum(n-1) + n

        pop {lr}
        bx lr

base_case:
        # mov r0, r5                 // base case: n 
        pop {lr}
        bx lr
.data
    prompt: .asciz "Enter n= "
    format: .asciz "%d"
    output: .asciz " %d\n"
    num: .word 0


