
.text
.global main 

main: 
  # Save return to os on stack 
    SUB sp, sp, #4
    STR lr, [sp, #0] 

    # #---convert Fahrenheit to Celsius
    LDR r0, =C_promt
    BL requestInput
    MOV r4,r1
    MOV r0,r4

    BL CtoF

    MOV r2,r0
    LDR r0,=temperature_format
    MOV r1,r4
    BL printf

    #---convert inches to Feet
    LDR r0, =inches_promt
    BL requestInput
    MOV r5,r1
    MOV r0,r5
    BL InchesToFT

    MOV r2,r0
    MOV r3,r1
    LDR r0,=length_format
    MOV r1,r5
    BL printf

    LDR lr,[sp,#0]
    ADD sp,sp, #4
    MOV pc,lr

.data   
    inches_promt: .asciz "Enter inches: "
    C_promt: .asciz "Enter Celsius: "
    hours_prompt:.asciz "Enter Hours: "
    average: .asciz "%d m/h   \n"
    temperature_format: .asciz "Celsius %d C to Fehrenheit %d F \n"
    length_format: .asciz "inches: %dinch to feet: %dft + %d inches\n"



