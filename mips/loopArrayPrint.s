.data 
	names: .space 16
	
	thomas: .asciiz "Thomas"
	.align 2
	david: .asciiz "David"
	.align 2
	jonathan: .asciiz "Jonathan"
	.align 2
	james: .asciiz "James"
 	.align 2
	
	array_size: .word 4
	
.text
	.globl main
	
main:

	la $t0, names
	la $t1, thomas
	la $t2, david
	la $t3, jonathan
	la $t4, james
	
	sw $t1, 0($t0)
	sw $t2, 4($t0)
	sw $t3, 8($t0)
	sw $t4, 12($t0)
	
	
	lw $t6, array_size
	sll $t6, $t6, 2
	add $t6, $t6, $t0
	
	li $v0, 4
	
printLoop:
	bge $t0, $t6, endLoop
	lw $a0, ($t0)
	syscall
	
	addi $t0, $t0, 4
	b printLoop
	
endLoop:

#exiting
	jr $ra
