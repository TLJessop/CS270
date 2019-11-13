.data 
	x: .word 7
	y: .word 4
.text

.globl main

main:

	lw $a0, x
	li $v0, 1 
	syscall 
	b LjumpHere
	
LjumpHere:
	lw $a0, y
	syscall 
	b main
	
	jr $ra