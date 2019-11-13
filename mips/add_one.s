.data 
	
.text
	.globl main
main: 
	li $a0, 9
	subi $sp, $sp, 20
	sw $ra 16($sp)
	
	jal add_one 
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
add_one:
	addi $v0, $a0, 1
	jr $ra