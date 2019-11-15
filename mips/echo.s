.data 
	prefix: .asciiz "You typed: "
	prompt: .asciiz "Enter a string: "
	string_to_modify: .space 40
.text
	.globl main
main:
	subi $sp, $sp, 20
	sw $ra, 16($sp)
	
	
	la $a0, string_to_modify
	li $a1, 40
	jal generate_echo_string
	
	la $a0, string_to_modify
	jal PrintString
		
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	li $v0, 0
	jr $ra
	
	.globl generate_echo_string
generate_echo_string:
	subi $sp, $sp, 28
	sw $ra, 24($sp)
	sw $s0, 20($sp)
	sw $s1, 16($sp)

	move $s0, $a0
	move $s1, $a1
	
	add $t0, $a0, $a1
	subi $t0, $t0, 1 
	sb $zero, ($t0)
	
	move $a2, $a1
	subi $a2, $a2, 1
	la $a1, prefix
	
	jal strncpy
	
	la $a0, prefix
	jal strlen
	
	bge $v0, $s1, .Lend_echo
	
	la $a0, prompt
	add $a1, $s0, $v0
	subi $a2, $s1, 1
	
	jal InputConsoleString
	
.Lend_echo:	
	lw $ra, 24($sp)
	lw $s0, 20($sp)
	lw $s1, 16($sp)
	addi $sp, $sp, 28
	jr $ra
	
.include "./util.s"
