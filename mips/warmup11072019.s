.data

.text 
	.globl main
main:
	subi $sp, $sp, 24
	sw $ra 20($sp)
	sw $s0, 16($sp)
	
	jal InputConsoleInt
	move $s0, $v0
	
	jal InputConsoleInt
	
	add $a0, $v0, $s0
	
	jal PrintInteger
	
	
	lw $ra, 20($sp)
	lw $sp 16($sp)
	addi $sp, $sp, 24
	jr $ra
.include "./util.s"