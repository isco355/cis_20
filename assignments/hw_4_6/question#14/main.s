
.text
.global main 

main: 
  # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 

    LDR r0, =value_prompt
    BL  printf    
    LDR r0, =input
    LDR r1, =num
    BL scanf    
    LDR r1, =num
    LDR r4, [r1, #0]

    MOV r3,#0
    MOV R2, R4, LSL #2
    ADD r3,r3,r2

    MOV R2, R4, LSL #1
    ADD r3,r3,r2

    ADD r3,r3,r4


    LDR r0,=output_format
    MOV r1,r4
    MOV r2,r3
    BL printf


    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    value_prompt: .asciz "Enter value: "
    input: .asciz "%d"
    num: .word 0
    output_format: .asciz "shift  and addition operations only:\nYour operation: %d * 7 = %d  \n"



