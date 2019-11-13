.data
	

.text
	.globl main
main:
	subi $sp, $sp, 28
	sw $ra, 24($sp)
	
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	
	li $s0, 0
	li $s1, 0
loop:
	li $t2, 3
	beq $s0, $t2, end
	jal InputConsoleInt
	add $s1, $v0, $s1
	addi $s0, $s0, 1
	b loop
end:	
	move $a0, $s1
	jal PrintInteger
	lw $ra 24($sp)
	lw $s0, 20($sp)
	lw $s1, 16($sp)
	addi $sp, $sp, 28
	li $v0, 0
	jr $ra
	
.include "./util.s"