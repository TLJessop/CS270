.data 

	word: .asciiz "jonathan"

.text
	.globl main
	
main:
	lb $t0, word
	subi $t0, $t0 32
	sb $t0, word
	
	li $v0, 4
	la $a0, word
	syscall


jr $ra