.data
	prompt: .asciiz "Please give a number: "
	result: .ascii "The factoral of that number is: "
.text
	.globl main
main:
	subi $sp, $sp, 24
	sw $ra, 20($sp)
	sw $s0, 16($sp)
	
	la $a0, prompt
	jal PrintString
	
	jal InputConsoleInt
	
	move $a0, $v0
	
	jal findFact
	
	move $s0, $v0
	
	la $a0, result
	jal PrintString
		
	move $a0, $s0
	jal PrintInteger
	
	lw $ra, 20($sp)
	lw $s0, 16($sp)
	addi $sp, $sp, 24

findFact:
	subi $sp, $sp, 20
	sw $ra, 16($sp)
	sw $a0, 20($sp)
	bgt $a0, 1, .rCase
	li $v0, 1
	b .factEnd
	
.rCase:
	subi $a0, $a0, 1
	jal findFact
	lw $a0, 20($sp)
	mul $v0, $a0, $v0
.factEnd:
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
	
.include "./util.s"
