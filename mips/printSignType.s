.data
	prompt: .asciiz "Enter number: "
	positive: .asciiz "positive"
	negitive: .asciiz "negative"
	zero: .asciiz "zero"

.text
	.globl main
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	
	beqz $v0, zeroCase
	bltz $v0, negCase
	
	li $v0, 4
	la $a0, positive
	syscall
	
	b end
negCase:
	li $v0, 4
	la $a0, negitive
	syscall
	b end
zeroCase:
	li $v0, 4
	la $a0, zero
	syscall
	b end
end:
	jr $ra