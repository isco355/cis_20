
.text
.global main 
requestInput:
  push {lr}
  BL  printf   
  LDR r0, =input
  LDR r1, =num
  BL scanf 
  LDR r1, =num
  LDR r1,[r1,#0]
  pop {pc}
  bx lr


setMaxvalue:
    MOV r6,r1
    B end_max

checkMaxValue:
    push {lr}
    cmp r1,r6
    BGT setMaxvalue
end_max:
    pop {pc}
    bx lr

 setMinvalue:
    MOV r8,r1
    B end_min
    
checkMinValue:
    push {lr}
    cmp r1,r8
    BLT  setMinvalue
end_min:
    pop {pc}
    bx lr

summation:
    push {lr}
    ADD r4,r1
    pop {pc}
    bx lr

printMaxMin:
    push {lr}
    LDR r0,=max_min_format
    MOV r1,r6
    MOV r2,r8
    BL printf
    pop {pc}
    bx lr



printResult:
    push {lr}
    MOV r0,r4 
    MOV r1,r5 
    BL __aeabi_idiv
    MOV r3,r0

    LDR r0,=output_format
    MOV r1,r4
    MOV r2,r5
    BL printf
    pop {pc}
    bx lr


welcome_message:
    push {lr}
    LDR r0,=welcome_message_prompt
    BL printf
    pop {pc}
    bx lr

loop:
    LDR r0, =km_prompt
    BL requestInput
    CMP r1, #-1 
    BEQ end

    ADD r5,#1
    BL summation
    BL checkMaxValue
    BL checkMinValue
    B loop

main: 
  # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 
    
    MOV r4,#0
    MOV r5,#0
    MOV r6,#-1
    MOV r8,#-1
    mvn r0, #0
    BL welcome_message
    B loop
    B end


end:

    BL printMaxMin
    BL printResult
    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    input: .asciz "%d"
    num: .word 0 
    welcome_message_prompt: .asciz "Enter values(to quit enter \"-1\" ): \n"
    km_prompt: .asciz " "
    output_format: .asciz "sum: %d total: %d  , average: %d\n"
    max_min_format: .asciz "Max_value: %d, Min_vaue: : %d  \n"



