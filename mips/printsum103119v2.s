.data 
	
.text
	.globl main
main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	subi $sp, $sp, 20
	sw $ra, 16($sp)
	li $a1, 5
	sw $a0, 20($sp)
	
	jal returnsum
	lw $ra, 16($sp)
	move $a0, $v0
	li $v0, 1
	syscall #print sum
	
	lw $a0, 20($sp)
	syscall #print the user given number
	
	addi $sp, $sp, 20
	
	
	
	jr $ra
	
returnsum:
	add $v0, $a0, $a1
	jr $ra