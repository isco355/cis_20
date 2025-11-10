
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

#
printMaxValue:
    push {lr}
    LDR r0,=max_msg
    MOV r1,r4
    BL printf
    pop {pc}
    bx lr

printMinValue:
    push {lr}
    LDR r0,=min_msg
    MOV r1,r5
    BL printf
    pop {pc}
    bx lr
    B end


setValues:
    MOV r0,r4
    MOV r4,r5
    MOV r5,r0
    B continue

sortValue:
    push {lr}
    CMP r4,r5
    BLT setValues 
    pop {pc}
    bx lr
main: 
  # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 
    

    LDR r0,=message_prompt
    BL requestInput
    MOV r4,r1

    LDR r0,=message_prompt
    BL requestInput
    MOV r5,r1
    BL sortValue
continue:
    LDR r0,=code_prompt
    BL requestInput

    CMP r1,#1
    BEQ printMaxValue
    BL printMinValue

end:
    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    input: .asciz "%d"
    num: .word 0 
    message_prompt: .asciz "Enter a value: \n"
    code_prompt: .asciz "enter 1(to display highest value) or 2(to smallest value): \n"
    max_msg: .asciz "Max value: %d \n"
    min_msg: .asciz "Min value: %d \n"



