.data
	prompt: .asciiz "Enter a hexadecimal number: "
	error: .asciiz "Invalid hexadecimal number.\n"
	my_string: .space 40
	result: .word 0
	
.text
	.globl main
main:	
	subi $sp, $sp, 24
	sw $ra, 20($sp)
	sw $s0, 16($sp)
while:
	la $a0, prompt
	la $a1, my_string
	li $a2, 40
	jal InputConsoleString
	
	la $a0, result
	la $a1, my_string
	jal  axtoi
	
	beq $v0, 1, end
	
	la $a0, error
	jal PrintString
	b while	
end:
	lw $a0, result
	jal   PrintInteger
	
	li $v0, 0

	li $v0, 0
	lw $ra, 20($sp)
	lw $s0, 16($sp)	
	addi $sp, $sp, 24
	jr $ra
.include "./util.s"
