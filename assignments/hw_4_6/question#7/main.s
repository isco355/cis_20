
.text
.global main 

main: 
  # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 

    LDR r0,=prompt
    BL printf

    LDR r0, =input 
    LDR r1, =char_val 
    BL scanf 

    LDR r1,=char_val
    LDRB r1,[r1]
    LDR r0,=output_format

    AND r2,r1,#0xdf
    BL printf


    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    prompt: .asciz "Enter a character(a-z):" 
    input: .asciz "%c" 
    char_val: .byte 0
    output_format: .asciz "characte  %c and uppercase : %c \n"


