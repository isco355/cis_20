# Program Name: printThreeParameters
# Author: Francisco Ortega Pantoja
# Date: 9/08/2020 

.text 
.global main 

main: 
    # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 
    
     
    # Printing the message 
    LDR r0, =format 
    LDR r1, =num1 
    LDR r2, =num2
    LDR r3, =num3
    MOV r1, #5
    MOV r2, #7
    MOV r3, #9

    # LDR r2,[r2]
    BL printf 
    
    # Return to the OS 
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 
    
.data 
    num1: .word 12
    num2: .word 2
    num3: .word 53
    # Format of the program output
    format: .asciz "int1 = %d, int2 = %d, and int3 = %d \n" 
