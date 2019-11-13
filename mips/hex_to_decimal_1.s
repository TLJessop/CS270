.data
	prompt: .asciiz "Enter a hexadecimal number: "
	my_string: .space 40
	result: .word 0
	.align 2
	
.text
	.globl main
main:	
	subi $sp, $sp, 20
	sw $ra, 16($sp)
	
	la $a0, prompt
	la $a1, my_string
	li $a2, 40
	jal InputConsoleString
	
	la $a0, result
	la $a1, my_string
	jal  axtoi
	
	lw $a0, result
	jal   PrintInteger
	
	li $v0, 0
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra

	li $v0, 0
	lw $ra, 16($sp)	
	addi $sp, $sp, 20
	jr $ra
.include "./util.s"
