.data
	num_array: -3, 7, 12, 2
	array_size: .word 4
	

.text
	.globl main
main:
	
	la $t0, num_array
	lw $t1, array_size
	sll $t1, $t1, 2
	add $t1, $t1, $t0
	
loop:
	bge $t0, $t1 endLoop
	
	li $v0, 1
	lw $a0, ($t0)
	syscall
	jal newLine
	
	addi $t0, $t0, 4
	b loop
endLoop:



#end of main
	jr $ra
	
newLine:
	li $v0, 11
	li $a0, 10
	syscall
	jr $ra