
.text
.global main 
requestInput:
        #input r0 : format
        #input r1: entered valued
        push {lr}
        BL  printf   
        LDR r0, =input
        LDR r1, =num
        BL scanf 
        LDR r1, =num
        LDR r1,[r1,#0]
        pop {pc}
        bx lr

main: 
        push {lr}

        LDR r0, =quantity_prompt
        BL requestInput
        MOV r4,r1

        LDR r0, =price_prompt
        BL requestInput
        MOV r5,r1

        MUL r6,r4,r5
        LDR r0,=inputs
        MOV r1,r4
        MOV r2,r5
        MOV r3,r6
        BL printf


        pop {pc}
        bx lr

.data   
        quantity_prompt: .asciz "Enter quantity: "
        price_prompt:.asciz "Enter price: $"
        inputs: .asciz "quantity %d * price: $%d  => total: $%d  \n"
        input: .asciz "%d"
        num: .word 0 


