# Program Name: printName&Age 
# Author: Francisco Ortega Pantoja
# Date: 9/07/2020 

.text 
.global main 

main: 
    # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 
    
    # Prompt for an name input 
    LDR r0, =prompt_name
    BL printf 
    
    # Scanf (request user name)
    LDR r0, =name_input 
    LDR r1, =name 
    BL scanf 

    # Prompt for an age input 
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
    # Prompt the user to enter their name 
    prompt_name: .asciz "Enter your name: " 
    # Format for input (read a string) 
    name_input: .asciz "%s" 
    # Reserves space in the memory for name 
    name: .space 40
    # Prompt the user to enter their name 
    prompt_age: .asciz "Enter your age: " 
    # Format for input (read a int) 
    age_input: .asciz "%d" 
    # Reserves space in the memory for name 
    age: .word 0
    # Format of the program output
    format: .asciz "The user %s is %d year old \n" 
