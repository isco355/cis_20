.text

.global requestInput,CtoF,InchesToFT
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
CtoF:
#input -> r0: Celsius
#return -> r0: Fahrenheit
  push {lr}
  mov r1,#9
  mul r0,r0,r1
  mov r1,#5
  BL __aeabi_idiv
  ADD r0,#32
  pop {pc}
  bx lr
  
InchesToFT:
  push {lr}
  MOV r1,#12
  BL __aeabi_idiv
  MUL r1,r0,r1
  SUB r1,r5,r1
  pop {pc}
  bx lr


.data
    input: .asciz "%d"
    num: .word 0 

