.data

.text
	.globl main
main:
	subi $sp, $sp, 24
	sw $ra, 20($sp)
	
	jal InputConsoleInt
	sw $v0, 16($sp)
	jal InputConsoleInt
	
	move $a0, $v0
	lw $a1, 16($sp)
	
	jal comput_sum
	
	move $a0, $v0
	
	jal PrintInteger
	
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	jr $ra
	
comput_sum:
	add $v0, $a0, $a1
	jr $ra
	
.include "./util.s"