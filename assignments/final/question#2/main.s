
.text
.global main
printNewLine:
        push {lr}
        ldr r0,=end_line
        BL printf
        pop {pc}
        bx lr
printElement:
        push {lr}
        ldr r0,=element_output
        ldr r1, [r4, r8, LSL #2]
        BL printf
        pop {pc}
        bx lr
traverse_array:
        cmp r8,r9 
        BEQ end_traversal
        BL printElement
        add r8,#1
        B traverse_array

iterate_array:
        push {lr}
        MOV r8,#0

        B traverse_array
        pop {pc}
        bx lr
end_traversal:
        BL printNewLine
        pop {pc}
        bx lr

indexes:
        push {lr}
        ldr r0,=output
        MOV r1,r5
        MOV r2,r6
        BL printf
        pop {pc}
        bx lr
main:
        push {lr}

        ldr r4, =array
        ldr r9, =size
        ldr r9, [r9]

        MOV r5,#0 // r5: start_index (0)
        SUB r6,r9,#1  // r6: end_index(size-1)


        ldr r0,=original_arr_message
        BL printf

        BL iterate_array
        B loop
        B end 
loop:
        cmp r5,r6
        BGE end

        add r0, r4, r5, lsl #2    //address of array[start]
        add r1, r4, r6, lsl #2    //address of array[end]

        ldr r2, [r0]              // r2 = array[start]
        ldr r3, [r1]              // r3 = array[end]

        str r2,[r1]
        str r3,[r0]

        add r5,#1
        sub r6,#1
        B loop

end:

        ldr r0,=reverse_arr_message
        BL printf
        BL iterate_array
        pop {lr}
        bx lr
        

.data
        original_arr_message: .asciz "original array:\n"
        reverse_arr_message: .asciz "original array reversed:\n"
        end_line: .asciz "\n"
        element_output: .asciz "%d "
        output: .asciz "start: %d , end: %d\n"
        array:  .word 55, 21, 78, 19
        size: .word 4

