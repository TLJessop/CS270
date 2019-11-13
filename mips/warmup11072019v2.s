.data
	result: .word 0
.text 
	.globl main
main:
	subi $sp, $sp, 20
	sw $ra 16($sp)

	
	jal InputConsoleInt
	sw $v0, result
	
	jal InputConsoleInt
	
	lw $t0, result
	add $a0, $v0, $t0
	
	jal PrintInteger
	
	
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
.include "./util.s"