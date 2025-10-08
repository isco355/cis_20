.text
.global main


main:
    # Save return to OS on stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Enter your program here.
    MOV r0, #12
    MOV r1, #3
    BL __aeabi_idiv


    # Move the result of division (in r0) to r1 as the argument for printf
     MOV r1, r0

    # Printing The Message
    LDR r0, =format  @ load address of format string into r0
    BL printf


    # Return to the OS
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
format:
    .asciz "%d\n"   @ Format string for printing an integer


