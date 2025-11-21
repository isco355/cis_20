.global main
.text

main:
    # Save return to OS on stack
    sub sp, sp, #4
    str lr, [sp, #0]
    
    # Prompt user for input
    ldr r0, =prompt
    bl printf
    
    # Get user input
    ldr r0, =format
    sub sp, sp, #4          @ Create space for input value
    mov r1, sp              @ Point r1 to this space
    bl scanf
    ldr r0, [sp]            @ Load the input value into r0
    add sp, sp, #4          @ Restore stack after scanf
    
    # Call Summation function with user input
    bl Summation
    
    # Print result
    mov r1, r0              @ Move result to r1 for printf
    ldr r0, =output
    bl printf
    
    # Return to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    prompt: .asciz "Enter a number to calculate the sum from 1 to n: "
    format: .asciz "%d"
    output: .asciz "The sum from 1 to n is: %d\n"

.text
Summation:
    # Push stack to save necessary registers
    sub sp, sp, #8          @ Allocate 8 bytes on the stack for local storage
    str lr, [sp, #0]        @ Save the link register (return address) at the top of the stack
    str r4, [sp, #4]        @ Save r4 (used for holding `n`) on the stack
    mov r4, r0              @ Move the input argument `n` (in r0) to r4 for preservation
    
    # Base Case
    mov r1, #0              @ Set r1 to 0, which will be used as the base case comparison
    cmp r4, r1              @ Compare `n` with 0
    beq return              @ If `n` == 0, branch to the return label (base case reached)
    
    # Recursive Case
    sub r0, r4, #1          @ Subtract 1 from `n` (held in r4) and store in r0
    bl Summation            @ Recursive call to Summation with `n-1`
    add r0, r0, r4          @ Add the result from Summation(n-1) to `n` (held in r4)
    
    # Pop Stack and Return
return: 
    ldr lr, [sp, #0]        @ Restore the original link register (return address) from the stack
    ldr r4, [sp, #4]        @ Restore the original value of r4 from the stack
    add sp, sp, #8          @ Deallocate 8 bytes from the stack
    mov pc, lr              @ Return to the calling function by setting the program counter to lr
