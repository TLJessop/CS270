.data
	x: .word 7
	hit: .asciiz "  hit  "
	miss: .asciiz "  Miss  "
	endText: .asciiz "   Done"
.text

.globl main

main:

	lw $t0, x
	move $a0, $t0
	li $v0,1
	syscall 
	
	li $v0, 4

	beqz   $t0, Lelse
Lif:
	la $a0, hit
	syscall 
	b Lafter
Lelse:
	la $a0, miss
	syscall 

Lafter:
	la $a0, endText
	syscall 
	
	jr $ra


