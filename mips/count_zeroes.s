.data
	array: .word 1, 2, 0, 3, 0, 8
	array_size: .word 6
.text
	.globl main
main:
	la $t0, array
	lw $t1, array_size
	
	sll $t1, $t1, 2
	add $t1, $t0, $t1
	li $t2, 0
loop:
	beq $t0, $t1, end
	lw $t3, ($t0)
	addi $t0, $t0, 4
	beqz $t3, count
	b loop
end:
	li $v0, 1
	move $a0, $t2
	syscall
	jr $ra
count:
	addi $t2, $t2, 1
	b loop
	