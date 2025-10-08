.text
.global main

main:
    # Save return to OS on stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Enter your program here.
    MOV r0, #53
    MOV r1, #40
    ADD r2, r0, r1  @ register to add

    # Printing The Message

    MOV r2, r1
    MOV r3, r2
    MOV r1, r0
    LDR r0, = format     @ load address of format string into r0
    BL printf

    # Return to the OS
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
format:
    .asciz "%d + %d = %d\n"   @ Format string for printing an integer


