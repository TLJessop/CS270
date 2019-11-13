.data
	 x: .word 0X12345678
	 space: .asciiz "          "
 
 .text
 
 .globl main
 
 main:
 	lw $t0, x
 	lw $a0, x
 	li $v0, 1
 	syscall 
 	
 	la $a0, space
 	li $v0, 4
 	syscall 
 	
 	andi $a0, $t0, 0x000000ff
 	li  $v0, 1
 	syscall 
 	
 	sll $a0, $a0, 4
 	syscall 
 	jr $ra