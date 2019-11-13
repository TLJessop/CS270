.data 
	
.text
	.globl main
main:
	subi $sp, $sp, 20
	sw $ra, 16($sp)
	li $a0, 4
	li $a1, 5
	jal printsum
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
	
printsum:
	add $a0, $a0, $a1
	li $v0, 1
	syscall
	jr $ra