.data
	numbers: .word 7, 2, -5, 6, 4
	array_size: .word 5

.text
	.globl main
main:
	la $t0, numbers
	lw $t1 array_ size
	sll $t1, $t1, 2
	add $t2, $t0, $t1
	
Lbegin:
	bge $t0, $t2, Lend
	lw $t3, ($t0)
	addi $t3, $t3, 1
	sw $t3, ($t0)
	addi $t0, $t0, 4
	b Lbegin

Lend
	jr $ra