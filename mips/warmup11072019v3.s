.data
	result: .word 0
.text 
	.globl main
main:
	subi $sp, $sp, 24
	sw $ra 20($sp)

	
	jal InputConsoleInt
	sw $v0, 16($sp)
	
	jal InputConsoleInt
	
	lw $t0, 16($sp)
	add $a0, $v0, $t0
	
	jal PrintInteger
	
	
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	jr $ra
.include "./util.s"