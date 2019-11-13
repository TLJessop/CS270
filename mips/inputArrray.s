.data

.text
	.globl main
main:
	subi $sp, $sp, 60
	sw $ra, 56($sp)
	
	la $a0, 52($sp)
	li $a1, 10
	
	lw $ra, 56($sp)
	addi $sp, $sp, 60
	jr $ra
input_to_array:
	subi $sp, $sp, 28
	sw $ra, 24($sp)
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	
	move $s0, $a0
	sll $s1, $a1, 2
	add $s1, $s1, $s0
	
.input_loop:
	bge $s0, $s1, .end_loop
	jal InputConsoleInt
	
	sw $v0, ($s0)
	
	addi $s0, $s0, 4
	b .input_loop
.end_loop:
	lw $ra 24($sp)
	lw $s0, 20($sp)
	lw $s1, 16($sp)
	addi $sp, $sp, 28
	jr $ra
.include "./util.s"