.data
	user_string: .space 40
	prompt: .asciiz "Type something: "
.text 
	.globl main
main:
	subi $sp, $sp, 20
	sw $ra, 16($sp)
	
	la $a0, prompt
	la $a1, user_string
	li $a2, 40
	
	jal InputConsoleString
	
	la $a0, user_string
	jal PrintString
	
	
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
.include "./util.s"