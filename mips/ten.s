.data
	prompt: .asciiz "Enter number: "
	ten: .asciiz "Ten!"

.text
	.globl main
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	
	li $t0, 10
	
	beq $v0, $t0, printTen
	
	jr $ra
printTen:
	li $v0, 4
	la $a0, ten
	syscall 
	jr $ra