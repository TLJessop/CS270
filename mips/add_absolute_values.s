.data
	array: .word 3, -3, 4, 5, -1
	array_size: .word 5
.text
	.globl main
main:
	la $t0, array
	lw $t1, array_size
	
	sll $t1, $t1, 2
	add $t1, $t0, $t1
	
	li $a0, 0
	li $v0, 1
loop:
	beq $t0, $t1, end
	lw $t2, ($t0)
	abs $t2, $t2
	add $a0, $a0, $t2
	addi $t0, $t0, 4
	b loop
end:
	syscall
	jr $ra