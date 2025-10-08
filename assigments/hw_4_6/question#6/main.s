
.text
.global main 

main: 
  # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 

    LDR r0, =miles_prompt
    BL  printf    
    LDR r0, =input
    LDR r1, =num
    BL scanf    
    LDR r1, =num
    LDR r4, [r1, #0]


    LDR r0, =hours_prompt
    BL  printf    
    LDR r0, =input
    LDR r1, =num
    BL scanf    
    LDR r1, =num
    LDR r5, [r1, #0]

    MOV r0,r4
    MOV r1,r5
    BL __aeabi_idiv
    MOV r6,r0

    LDR r0,=output_format
    MOV r1,r4
    MOV r2,r5
    MOV r3,r6
    BL printf




    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    miles_prompt: .asciz "Enter miles: "
    hours_prompt: .asciz "Enter hours: "
    input: .asciz "%d"
    num: .word 0
    output_format: .asciz "Your entered: %d miles and %d hours:\nApproximate speed: %d mile/hour \n"



