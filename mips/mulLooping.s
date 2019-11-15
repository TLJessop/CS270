.text
	.globl main
main:
	subi $sp, $sp, 28
	sw $ra, 24($sp)
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	
	li $s0, 1
	li $s1, 0
	
main_loop:
	li $t0, 2
	bge $s1, $t0 main_end
	
	jal InputConsoleInt
	
	move $a0, $s0
	move $a1, $v0
	jal multiply
	
	move $s0, $v0
	addi $s1, $s1, 1
	b main_loop
	
main_end:
	move $a0, $s0
	jal PrintInteger
	lw $ra, 24($sp)
	lw $s0, 20($s0)
	lw $s1, 16($sp)
	addi $sp, $sp, 28
	jr $ra
	
multiply:
	subi $sp, $sp, 36
	sw $ra, 32($sp)
	sw $s0, 28($sp)
	sw $s1, 24($sp)
	sw $s2, 20($sp)
	sw $s3, 16($sp)
	
	move $s0, $a0
	move $s1, $a1
	
	li $s2, 0
	li $s3, 0
		
mul_loop:
	bge $s2, $s0, mul_end
	
	add $s3, $s3, $s1
	
	addi $s2, $s2, 1
	b mul_loop
	
mul_end:
	move $v0, $s3

	lw $ra, 32($sp)
	lw $s0, 28($sp)
	lw $s1, 24($sp)
	lw $s2, 20($sp)
	lw $s3, 16($sp)
	addi $sp, $sp, 36
	jr $ra

.include "./util.s"
