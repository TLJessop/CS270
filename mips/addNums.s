.data
	x: .word 5
	y: .word 2
.text
	.globl main
main:
	lw $t0, x
	lw $t1, y
	
	add $a0, $t0, $t1
	
	li $v0, 1
	
	syscall
	
	 jr $ra 