
.text
.global main

main:
        push {lr}

         LDR r4, =arr
        # bl summation_recursive     // call recursive function

        LDR r0, [r4, r6, LSL #1]
        mov r1, r0                 
        ldr r0, =output
        bl printf                  

        pop {lr}
        bx lr


summation_recursive:
        push {lr}
        cmp r0, #1                 // if n == 0
        beq base_case

        sub r0, r0, #1             // prepare argument for next call
        push {r0}                  // save (n-1)
        bl summation_recursive     // recursive call: sum(n-1)
        pop {r1}                   // restore (n-1)
        add r0, r0, r1             // result = sum(n-1) + n

        pop {lr}
        bx lr

base_case:
        LDR r0, [r4, r6, LSL #0]
        pop {lr}
        bx lr
.data
    # prompt: .asciz "Enter a number: "
    format: .asciz "%d"
    output: .asciz "result %d\n"
    num: .word 0
    arr:    .word 5, 10, 15, 20
    arraySize:  .word 4                     @ Store the size of the array


