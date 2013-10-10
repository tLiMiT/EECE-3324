# EECE 3324 Computer Architecture and Organization
# Homework 3
# Tim Liming

# Question 3
# Write a MIPS assembly program that checks to see if a string is a palindrome.
# The string can be stored in the static data area of your main, and is passed from main to 2 functions. 
# The first function named string_length determines the string’s length. Then the string and the string 
# length are passed to a function named palindrome, which returns a true or false indication of whether 
# the string is a palindrome. The program should print out an indication of whether the stored string is 
# a palindrome. Provide examples that show both cases. Allow your program to handle blanks and mixed case 
# in the input, ignoring them, and still finding a palindrome. For example, “A daffodil slid off Ada” is 
# an example of a palindrome if you ignore spaces and letter case.

.text
	.globl main
main:
	la $a0, prompt		# load prompt string
	li $v0, 4		# print string command
	syscall			# print prompt string
	la $a0, input_string	# load input string
	li $a1, 1024		# set length limit
	li $v0, 8		# read string command
	syscall			# read input string
	
	la $t2, input_string	# points to beginning of input string	
	li $t1, 0		# initialize $t1 to 0
	
string_length:	
	lb $t0, 0($t2)		# get a byte from string
	beq $t0, $zero, slEnd	# branch to end if $t0 == 0
	add $t1, $t1, 1		# increment count
	add $t2, $t2, 1		# move to the next char
	j string_length		# iterate
slEnd:	
	la $a0, strLength	# load strLength string
	li $v0, 4		# print string command
	syscall			# print strLenght string
	addi $t1, $t1, -1	# remove the end line from our string
	move $a0, $t1		# load length int
	li $v0, 1		# print integer command
	syscall			# print the string length
	la $a0, endl		# load new line string
	li $v0, 4		# print string command
	syscall			# print new line string

	la $a0, input_string	# load string into $a0
	move $a1, $t1		# save string length
     	li $t1, 0		# initialize to 0 (our point A)
     	addi $t2, $a1, -1	# set $t2 to string length -1 (our point B)
     	li $t4, 1		# True/False flag
	li $t9, 32		# ASCII code for Space, used to check for spaces
	
palindrome:
     	slt $t3, $t1, $t2	# if A has passed B...
     	beq $t3, $zero, true	# ... we have found a palindrome
     	beq $t1, $t2, true	# if A and B are in the same place, we have found a palindrome
     	add $t5, $a0, $t1	# address of A in str
     	add $t6, $a0, $t2	# address of B in str
     	lb $t7, 0($t5)		# get byte A from string
     	lb $t8, 0($t6)		# get byte B from string
     	slti $t3, $t7, 97	# if A is less than 97...
     	bne $t3, $zero, checkA	# ...check for a space
     	addi $t7, $t7, -32 	# else, convert A to an upper case letter 
checkA:
     	bne $t9, $t7, isLetterA	# branch if A is a letter
     	addi $t1, $t1, 1	# move A over the space, thus ignoring it
     	j palindrome		# iterate
isLetterA:
     	slti $t3, $t8, 97	# if B is less than 97...
     	bne $t3, $zero, checkB	# ...check for a space
     	addi $t8, $t8, -32	# else, convert B to an upper case letter
checkB:
     	bne $t9, $t8, isLetterB	# branch if B is a letter
     	addi $t2, $t2, -1	# move B over the space, thus ignoring it
     	j palindrome		# iterate
isLetterB:
     	beq $t7, $t8, equal	# A and B are equal, we can continue
     	li $t4, 0		# set flag to False
     	j false			# jump to false
equal:
     	addi $t1, $t1, 1	# move A left 1 space
     	addi $t2, $t2, -1	# move B right 1 space
     	j palindrome		# iterate
true:
	la $a0, trueMsg		# load trueMsg string
	li $v0, 4		# print string command
	syscall			# print trueMsg string
	j exit			# jump to exit to close
false:
	la $a0, falseMsg	# load falseMsg string
	li $v0, 4		# print string command
	syscall			# print falseMsg string
	j exit			# jump to exit 
	
exit:
	li $v0, 10	        # exit program command
        syscall			# exit program
	
## Data	
	.data
input_string:	.space 1024	# space reserved for input string
prompt:		.asciiz "Input a string to check if string is a palindrome:\n"
strLength:	.asciiz "String length is: "
endl:		.asciiz "\n"
trueMsg:	.asciiz "The string is a palindrome.\n"
falseMsg:	.asciiz "The string is not a palindrome.\n"

## End of file