
.text
.global main 


main:
    # Push stack to save necessary registers
    sub sp, sp, #8        # Allocate 8 bytes on the stack
    str lr, [sp, #0]      # Save return address
    str r4, [sp, #4]      # Save r4 (will hold n)
    mov r4, r0            # Move input n to r4
    
    # Base Case
    mov r1, #0            # Prepare for comparison with 0
    cmp r4, r1            # Compare n with 0
    beq return            # If n == 0, go to return (base case)
    
    # Recursive Case
    sub r0, r4, #1        # Calculate n-1
    bl main          # Recursive call with n-1
    add r0, r0, r4        # Add n to result of Summation(n-1)
    
    # Pop Stack and Return
return:
    ldr lr, [sp, #0]      # Restore return address
    ldr r4, [sp, #4]      # Restore r4
    add sp, sp, #8        # Deallocate stack space
    mov pc, lr            # Return to caller
