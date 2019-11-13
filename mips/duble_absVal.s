.data
	
	
.text
	.globl main
main:
	li $v0, 5
	syscall
	move $a0, $v0
	syscall 
	move $a1, $v0
	jal comput_abs_val_sum
	jr $ra



comput_abs_val_sum:
	subi $sp, $sp, 24
	sw $ra, 20($sp)
	
	sw $a1, 28($sp)
	jal abs_val
	sw $v0, 16($sp)
	lw $a0, 28($sp)
	jal abs_val
	lw $t0, 16($sp)
	add $v0, $v0, $t0
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	jr $ra
	

abs_val: 
	beqz $a0, Labs_val_return
	sub $a0, $zero, $a0
	
Labs_val_return
	move $v0, $a0
	jr $ra