.data
	 
	num: .word 5
.text
	.globl main
main:
	subi $sp, $sp, 4
	sw $ra, ($sp)
	jal printTwoNums
	lw $ra, ($sp)
	addi $sp, $sp, 4
	#Exit
	jr $ra

printFive:
	li $v0, 1
	li $a0, 5
	syscall 
	jr $ra
printTwoNums:
	subi $sp, $sp, 4
	sw $ra ($sp)
	jal printFive
	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	subi $sp, $sp, 4
	sw $ra ($sp)
	jal printFive
	lw $ra, ($sp)
	addi $sp, $sp, 4
	 
	jr $ra
