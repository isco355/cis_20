# Program Name: printName&Age 
# Author: Francisco Ortega Pantoja
# Date: 9/07/2020 

.text 
.global main 

main: 
    # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 
    
    # Prompt for string input 
    LDR r0, =string_prompt
    BL printf 
    # Scanf (request user enter a string)
    LDR r0, =str_input 
    LDR r1, =str1
    BL scanf 


    # Prompt for string input 
    LDR r0, =string_prompt
    BL printf 
    # Scanf (request user enter a string)
    LDR r0, =str_input 
    LDR r1, =str2
    BL scanf 


    
    # Prompt for string input 
    LDR r0, =prompt_age
    BL printf 
    # Scanf (request user age)
    LDR r0, =age_input 
    LDR r1, =age 
    BL scanf 
    
    # Printing the message 
    LDR r0, =format 
    LDR r1, =name 
    LDR r2, =age 
    LDR r2,[r2]
    BL printf 
    
    # Return to the OS 
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 
    
.data 
    # Prompt string message
    string_prompt: .asciz "Enter a string:" 
    # Format for string input (read a string) 
    str_input: .asciz "%s" 
    # Reserves space in the memory for name 
    str1: .space 40
    str2: .space 40
    # Prompt number message
    int_prompt: .asciz "Enter a number: " 
    # Format for int input (read a int) 
    int_input: .asciz "%d" 
    # Reserves space in the memory for number 
    number: .word 0
    # Format of the program output
    format: .asciz "int1 = %d, int2 = %d, and int3 = %d" 
