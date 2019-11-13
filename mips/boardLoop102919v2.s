.data
	numbers: .word 7, 2, -5, 6, 4
	array_size: .word 5
.text
	.globl main
	
main:
	li $t0, 0
	lw $t1, array_size
	la $t2, numbers

Lbegin:
	bge $t0, $t1, Lend
	sll $t3, $t0, 4
	add $t3, $t3, $t2
	lw $t4, ($t3)
	addi $t4, $t4, 1
	sw $t4, ($t3)
	addi $t0, $t0, 1
	b Lbegin
Lend:
	jr $ra