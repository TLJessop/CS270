.data 
	
.text
	.globl main
main:
	subi $sp, $sp, 20
	sw $ra, 16($sp)
	jal printFive
	jal printFive
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
	
printFive:
	li $v0, 1
	li $a0, 5
	syscall
	jr $ra