.data 
	x: .word 0X00000080
	y: .word 0
	
.text	
.globl main

main:
	la $t0, x
	move $a0, $t0
	li $v0 1
	syscall 
	
	sll $t0, $t0, 28
	srl $t0, $t0, 28
	
	move $a0, $t0
	
	sw $t0, y
	
	jr $ra