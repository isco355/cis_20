
.text
.global main 

main: 
  # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 

    # #request user and store value in register
    LDR r0, =inches_prompt
    BL  printf    
    LDR r0, =input
    LDR r1, =num
    BL scanf    
    LDR r1, =num
    LDR r4, [r1, #0]

    LDR r5,=divisor
    LDR r5,[r5]

    MOV r0,r4
    MOV r1,r5
    BL __aeabi_idiv
    MOV r6,r0

    MUL r8,r6,r5
    SUB r8,r4,r8

    LDR r0,=inches_to_feet_format
    MOV r1,r4
    MOV r2,r6
    MOV r3,r8
    BL printf

    LDR r0, =feet_prompt
    BL  printf    
    LDR r0, =input
    LDR r1, =num
    BL scanf    
    LDR r1, =num
    LDR r4, [r1, #0]


    LDR r0, =addictional_inches_prompt
    BL  printf    
    LDR r0, =input
    LDR r1, =num
    BL scanf    
    LDR r1, =num
    LDR r6, [r1, #0]

    MUL r8,r4,r5
    ADD r8,r8,r6


    LDR r0,=feet_to_inches_format
    MOV r1,r4
    MOV r2,r6
    MOV r3,r8
    BL printf




    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    input: .asciz "%d"
    num: .word 0

    inches_prompt: .asciz "Enter inches: "
    feet_prompt:.asciz "Enter feet: "
    addictional_inches_prompt:.asciz "Enter addictional inches: "
    divisor:  .word 12
    inches_to_feet_format: .asciz "converting %d inches into feet :  %d' %d\" \n"
    feet_to_inches_format: .asciz "converting %d feet and additional inches %d into inches:  %d inches \n"



