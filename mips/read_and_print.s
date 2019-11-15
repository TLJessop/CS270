.data 
	prompt: .asciiz "Enter a string: "
	.align 2
.text
	.globl main
main:
	subi $sp, $sp, 40
	sw $ra, 36($sp)
	
	la $a0, prompt
	la $a1, 32($sp)
	li $a2, 20
	
	jal InputConsoleString
	
	la $a0, 32($sp)
	jal PrintString	
	
	lw $ra, 36($sp)
	addi $sp, $sp, 40
	jr $ra
.include "./util.s"