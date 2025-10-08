.text
.global main

main:
    # Save return to OS on stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Enter your program here.
    MOV r4, #81
    MOV r5, #9

    MOV r0,r4
    MOV r1,r5
    BL __aeabi_idiv
    MOV r2,r0

    LDR r0, = format     @ load address of format string into r0
    MOV r3,r2
    MOV r1,r4
    MOV r2,r5
    BL printf

    # Return to the OS
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
format:
    .asciz "%d / %d = %d\n"   @ Format string for printing an integer


