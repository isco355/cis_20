
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


    LDR r0,=output_format
    MOV r1,r4
    MOV R2, R4, LSL #3 
    BL printf


    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    value_prompt: .asciz "Enter value: "
    input: .asciz "%d"
    num: .word 0
    output_format: .asciz "Your operation:\nvalue << 3 = value * 8\n %d << 3  =  %d  \n"



