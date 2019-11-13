.data 
	greeting: .asciiz "Hi!"
	
.text
	.globl main
	
main:
	la $t1, greeting
	lb $t0, greeting	
	
	#addi $t1, $t1, 2
	#lb $t0, ($t1)
		
	jr $ra	