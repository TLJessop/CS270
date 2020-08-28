    .data
min:       .word 1
max:       .word 10
num:       .word 8     # I'd recommend trying different values
                       # for this variable when testing.
msgintro:  .asciiz "Guess must be a hexadecimal number between "
msgand:    .asciiz " and "
msgend:    .asciiz "\nEnter your guess (or nothing to quit).\n"
msgnl:     .asciiz "\n"
msgwin:    .asciiz "Got it!"
msghigh:   .asciiz "Guess is too high."
msglow:    .asciiz "Guess is too low."
    .text
    .globl main
main:
    ##################
    # YOUR CODE HERE #
    ##################
	subi $sp, $sp, 36
	sw $ra, 32($sp)
	sw $s0, 28($sp)
	sw $s1, 24($sp)
	sw $s2, 20($sp)

    # Step 1: Build prompt.
   la $a0, msgintro
   la $a1, msgand
   
   jal strdup2
   
   move $a0, $v0
   la $a1, msgend
   
   jal strdup2
   
   move $s0, $v0
   
    # Step 2: Repeatedly use GetGuess to get a guess
    # from the user and report if it is too high, too
    # low, or correct.
 .Lguess_loop:
 
   move $a0, $s0 
   lw    $a1, min
   lw    $a2, max
   jal   GetGuess
   
   lw $t0, num
   
   beq $t0, $v0, .Lright
   blt $t0, $v0, .Ltoo_low
   bgt $t0, $v0, .Ltoo_high
   
.Lend:
   lw $ra, 32($sp)
   lw $s0, 28($sp)
   lw $s1, 24($sp)
   lw $s2, 20($sp)
   jr $ra
   
.Lright:
	la $a0, msgwin
	jal PrintString
	b .Lend

.Ltoo_high:
	la $a0, msghigh
	jal PrintString
	b  .Lguess_loop

.Ltoo_low:
	la $a0, msglow
	jal PrintString
	b  .Lguess_loop
   


################################
# GetGuess
################################
    .data
invalid:    .asciiz "Not a valid hexadecimal number"
badrange:   .asciiz "Guess not in range"
    .text
    .globl  GetGuess
# 
# int GetGuess(char * question, int min, int max)
# -----
# This is your function from assignment 5. It repeatedly
# asks the user for a guess until the guess is a valid
# hexadecimal number between min and max.
GetGuess:
    
    ###################################
    # YOUR CODE FROM ASMT 5 HERE      #
    ###################################    
	subi $sp, $sp, 44
	sw $ra, 40($sp)
	sw $a0, 44($sp)
	sw $a1, 48($sp)
	sw $a2, 52($sp)
.Lwhile:
	#pompt input setup
	lw $a0, 44($sp)
	la $a1, 32($sp)
	li $a2, 16
	
	jal InputConsoleString
	
	beqz $v0, .Lempty
	
	la $a0, 36($sp)
	la $a1, 32($sp)
	
	jal axtoi
	
	beq $v0, 1, .Lrange_check
	
	la $a0, invalid
	jal PrintString
	
	b .Lwhile
	
.Lrange_check:	
	lw $t0, 36($sp)
		
	lw $t1, 48($sp)
	bgt $t1, $t0, .Lout_range
	
	lw $t2, 52($sp)
	blt $t2, $t0, .Lout_range
	
	move $v0, $t0
	
.Lend_guess:
	lw $ra, 40($sp)
	addi $sp, $sp, 44
	jr $ra
	
.Lempty:
	li $v0, -1
	b .Lend_guess
	
.Lout_range:
	la $a0, badrange
	jal PrintString
	b .Lwhile

	    

###################################
#     OTHER HELPER FUNCTIONS      #
###################################

#
# char * strdup2 (char * str1, char * str2)
# -----
# strdup2 takes two strings, allocates new space big enough to hold 
# of them concatenated (str1 followed by str2), then copies each 
# string to the new space and returns a pointer to the result.
#
# strdup2 assumes neither str1 no str2 is NULL AND that malloc
# returns a valid pointer.
    .globl  strdup2
strdup2:
    # $ra   at 28($sp)
    # len1  at 24($sp)
    # len2  at 20($sp)
    # new   at 16($sp)
    sub     $sp,$sp,32
    sw      $ra,28($sp)
    
    # save $a0,$a1
    # str1  at 32($sp)
    # str2  at 36($sp)
    sw      $a0,32($sp)
    sw      $a1,36($sp)
    
    # get the lengths of each string 
    jal     strlen
    sw      $v0,24($sp)

    lw      $a0,36($sp)
    jal     strlen
    sw      $v0,20($sp)

    # allocate space for the new concatenated string 
    add     $a0,$v0,1
    lw      $t0,24($sp)
    add     $a0,$a0,$t0
    jal     malloc
    
    sw      $v0,16($sp)

    # copy each to the new area 
    move    $a0,$v0
    lw      $a1,32($sp)
    jal     strcpy

    lw      $a0,16($sp)
    lw      $t0,24($sp)
    add     $a0,$a0,$t0
    lw      $a1,36($sp)
    jal     strcpy

    # return the new string
    lw      $v0,16($sp)
    lw      $ra,28($sp)
    add     $sp,$sp,32
    jr      $ra

    .include  "./util.s"
