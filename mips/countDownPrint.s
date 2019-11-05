.data
	prompt: .asciiz "Enter number: "

.text
	.globl main
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $a0, $v0
	
	li $v0, 1
	
printLoop:
	blez $a0, end
	syscall
	
	subi $a0, $a0, 1
	b printLoop
end:
	jr $ra
