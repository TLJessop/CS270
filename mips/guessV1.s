#######################
# guess.s
# -------
# This program asks the user to enter a guess. It
# reprompts if the user's entry is either an invalid
# hexadecimal number or a valid hexadecimal number
# that is outside the range specified in the program
# by min and max.
#
	.data
min:        .word   1
max:        .word   10
msgguess:   .asciiz "Make a guess.\n"
msgnewline: .asciiz "\n"
	.text
	.globl main
main:
	# Make space for arguments and saved return address
	subi  $sp, $sp, 20
	sw    $ra,16($sp)

	# Get the guess
	la    $a0, msgguess
    	lw    $a1, min
    	lw    $a2, max
    	jal   GetGuess
    
    # Print the guess
    move  $a0, $v0
    jal   PrintInteger
    
    # Print a newline character
    la    $a0, msgnewline
    jal   PrintString
    
    # Return
    lw    $ra, 16($sp)
    addi  $sp, $sp, 20
    jr    $ra

################################
# GetGuess
################################

    .data
invalid:    .asciiz "Not a valid hexadecimal number.\n"
badrange:   .asciiz "Guess not in range.\n"
    .text
    .globl  GetGuess
# 
# C code:
#
# int GetGuess(char * question, int min, int max)
# {
#     // Local variables
#     int theguess;      // Store this on the stack
#     int bytes_read;    // You can just keep this one in a register
#     int status;        // This can also be kept in a register
#     char buffer[16];   // This is 16 contiguous bytes on the stack
#
#     // Loop
#     while (true)
#     {
#         // Print prompt, get string (NOTE: You must pass the
#         // address of the beginning of the character array
#         // buffer as the second argument!)
#         bytes_read = InputConsoleString(question, buffer, 16);
#         if (bytes_read == 0) return -1;
#
#         // Ok, we successfully got a string. Now, give it
#         // to axtoi, which, if successful, will put the
#         // int equivalent in theguess. 
#         //
#         // Here, you must pass the address of theguess as
#         // the first argument, and the address of the
#         // beginning of buffer as the second argument.
#         status = axtoi(&theguess, buffer);
#         if (status != 1)
#         {
#             PrintString(invalid);  // invalid is a global
#             continue;
#         }
#
#         // Now we know we got a valid hexadecimal number, and the
#         // int equivalent is in theguess. Check it against min and
#         // max to make sure it's in the right range.
#         if (theguess < min || theguess > max)
#         {
#             PrintString(badrange); // badrange is a global
#             continue;
#         }
#
#         return theguess;
#     }
# }
#     
#
GetGuess:
    # stack frame must contain $ra (4 bytes)
    # plus room for theguess (int) (4 bytes)
    # plus room for a 16-byte string
    # plus room for arguments (16)
    # total: 40 bytes
    #  16 byte buffer is at 16($sp)
    #  theguess is at 32($sp)
    #

	#######################
	# YOUR CODE HERE      #
	#######################
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
	    
    .include  "./util.s"
