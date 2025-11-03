
.text
.global main 

main: 
  # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 

    LDR r0, =km_prompt
    BL requestInput
    MOV r4,r1

    LDR r0, =hours_prompt
    BL requestInput
    MOV r5,r1

    MOV r0,r4
    MOV r1,r5
#---indivuals function call----
    BL k2m
    MOV r1,r5
    BL mph
    mov r6,r0
    LDR r0,=inputs
    MOV r1,r4
    MOV r2,r5
    MOV r3,r6
    BL printf

#-- single Call()---
    # MOV r0,r4
    # MOV r1,r5
    # BL ktoMph
    #
    # mov r6,r0
    # LDR r0,=inputs
    # MOV r1,r4
    # MOV r2,r5
    # MOV r3,r6
    # BL printf


    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    km_prompt: .asciz "Enter Kilometers: "
    hours_prompt:.asciz "Enter Hours: "
    average: .asciz "%d m/h   \n"
    inputs: .asciz "kilometer %d hours: %d  = %d miles per hour \n"



