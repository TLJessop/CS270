.data 
	letters: .asciiz "aaaaa"
	
.text
	.globl main
	
main:
	la $t0, letters
	li $t1, 0
	li $t2, 5
		
	li $v0, 4
	la $a0, letters
	syscall
	
letterLoop:
	bge $t1, $t2, endLoop
	
	add $t3, $t0, $t1 
	
	lb $t4, ($t3)
	add $t4, $t4, $t1
	
	sb $t4, ($t3)
	
	addi $t1, $t1, 1
	b letterLoop
endLoop:
	li $v0, 11
	li $a0, 10
	syscall
	
	la $a0, letters
	li $v0, 4
	syscall

jr $ra