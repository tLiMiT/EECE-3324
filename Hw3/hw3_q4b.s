# EECE 3324 Computer Architecture and Organization
# Homework 3
# Tim Liming

# Question 4 b
# MIPS assembly routines to compute the factorial of a number using:
# Recursive, using callee-save registers


###### MAIN.S FILE

# Compute factorial of a number and print
	.data
prompt: .asciiz "Please input a non-negative integer number for computation.\n"
	.text

# user inputs the number 
pr:  	la $a0, prompt		# load address of prompt for syscall
	li $v0, 4     		# specify system service of Print String
     	syscall         	# print the prompt string
     	li $v0, 5     		# specify system service of Read Integer
     	syscall         	# Read the number. After this instruction, the number read is in $v0.
     	blt $v0, $zero, pr   	# Check if the input is a positive integer
     	add $a0, $v0, $zero  	# transfer the number to the desired register
     	add  $s1, $a0, $zero	# save original number
      
     	jal factb 		# jump to factb

     	#the factorial number is computed and stored in $v0, copy it to $a1, the original number is in $a0, print both of them them out
     	add $a1, $zero, $v0   	# second argument for print, the result
     	jal print            	# call print routine. 

     	# The program is finished. Exit.
     	li $v0, 10          	# system call for exit
     	syscall               	# Exit!
		

###############################################################
# Subroutine to print the given number and its factorial.
	.data
head: 	.asciiz  "The given number is: " 
head2: 	.asciiz "; \nIts Factorial is: "

	.text
print: 	add $t0, $zero, $s1  	# the orignal number
      	add $t1, $zero, $a1   	# the computed result

      	la $a0, head        	# load address of the print heading string
      	li $v0, 4           	# specify Print String service
      	syscall               	# print the heading string
      
      	add $a0, $zero, $t0 	# load the integer to be printed (the current Fib. number)
      	li $v0, 1           	# specify Print Integer service
      	syscall               	# print original number
      
      	la $a0, head2        	# load address of the print heading string
      	li $v0, 4           	# specify Print String service
      	syscall               	# print the heading string
      
      	add $a0, $zero, $t1     # load the integer to be printed (the factorial number)
      	li $v0, 1           	# specify Print Integer service
      	syscall               	# print the result
      
      	jr $ra              	# return from subroutine
# End of subroutine to print the numbers on one line
###############################################################

#### FACT function b
# Recursive
	.text
factb:	
	addi $sp, $sp, -8	# adjust stack for 2 numbers
     	sw $s0, 0($sp)		# store pointer to front
	sw $ra, 4($sp)		# store return address
	add $fp, $sp, 8		# add stack address back to normal
	sw $a0, -8($fp)		# store number where $s0 is stored
	move $s0, $a0		# move number to $s0
	slti $t0, $s0, 1	# if number is greater than 1...
	beq $t0, $zero, recur	# ...jump to recursive caller
	addi $v0, $zero, 1	# else, number equals 1
	addi $sp, $sp, 8	# pop 2 numbers from stack
	jr $ra			# return

recur: 	addi $a0, $a0, -1	# decrement by 1
	jal factb		# recurse
	lw $s0, 0($sp)		# restore original number
	lw $ra, 4($sp)		# restore return address
	addi $sp, $sp, 8	# pop 1 number from stack
	mul $v0, $s0, $v0	# multiply to get factorial
	jr $ra			# return
	
	