.data
	string: .asciiz "f720"
	.align 2
	result: .space 4
	
.text
	.globl main
main:
	subi $sp, $sp, 20
	sw $ra, 16($sp)
	
	la $a0, result
	la $a1, string
	
	jal axtoi
	
	lw $a0, result
	jal PrintInteger
	
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
	
.include "./util.s"