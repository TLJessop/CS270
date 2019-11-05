.data
	a: .word 1
	b: .word 2
	c: .word 4
	d: .word 8
	
.text
	.globl main
main:
	#load the variables
	lw $t0, a
	lw $t1, b
	lw $t2, c
	lw $t3, d
	
	sll $a0, $t0, 24
	sll $t1, $t1, 16
	sll $t2, $t2, 8
	
	or $a0, $a0, $t1
	or $a0, $a0, $t2
	or $a0, $a0, $t3 


	li $v0, 1
	syscall
	
	jr $ra