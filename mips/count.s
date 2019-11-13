.data
	numbers: .word 1, 0, 3, 0, 0, 3
	array_size: .word 6
.text 
	.globl main
main:
	la $t0, numbers
	lw $t1, array_size
	sll $t1, $t1, 2
	add $t1, $t1, $t0
	li $t4, 0
	li $t5, 0
Loop:
	bge $t0, $t1, End
	lw $t3, ($t0)
	addi $t0,$t0, 4
	beq $t4, $t3, CountZeros
	b Loop
End:
	move $a0, $t5
	li $v0, 1
	syscall
	jr $ra
CountZeros:
	addi $t5, $t5, 1
	b Loop
