.text

.global k2m,mph,ktoMph,requestInput
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
k2m:
#input -> r0: kilometer
#return -> r0: miles
  push {lr}
  mov r1,#10
  mul r0,r0,r1
  mov r1,#16
  BL __aeabi_idiv
  pop {pc}
  bx lr

mph:

#inputs ->r0: miles
#         r1: hours
#return -> r0: speed
  push {lr}
  BL __aeabi_idiv
  pop {pc}
  bx lr


ktoMph:
#inputs ->r0: kilometer
#         r1: hours
#return -> r0: speed
  push {lr}
  MOV r8,r1
  BL k2m
  MOV r1,r8
  BL mph
  pop {pc}
  bx lr

  

.data
    input: .asciz "%d"
    num: .word 0 

