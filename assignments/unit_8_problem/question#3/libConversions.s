.text

# .global requestInput
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


.data
    input: .asciz "%d"
    num: .word 0 

