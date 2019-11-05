.data 
	sentence: .asciiz "Why! what! where!"
.text
	.globl main
main:
	la $t0, sentence
	li $t3, 33
	li $a0, 0
loop:
	lb $t1, ($t0)
	beqz $t1, end
	addi $t0, $t0, 1
	beq $t1, $t3, count
	b loop
end:
	li $v0, 1
	syscall
	jr $ra
count:
	addi $a0, $a0, 1
	b loop