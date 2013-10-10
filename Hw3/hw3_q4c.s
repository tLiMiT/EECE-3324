# EECE 3324 Computer Architecture and Organization
# Homework 3
# Tim Liming

# Question 4 c
# MIPS assembly routines to compute the factorial of a number using:
# Iterative (multiplying 1, 2, …, n) 


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

## Added to main.s     	     	
     	add $t0, $a0, $zero	# store number
     	addi $t2, $zero, 1	# initialize to 1
     	beq $t0, $t2, else	# if the number is not equal to 1...
    	addi $t1, $t0, -1	# ...subtract 1 from number
     	mul $v0, $t0, $t1	# multiply n*(n-1)
     	add $t0, $zero, $t1	# move n-1 to n
factc:
	beq $t0, $t2, else	# if the number is not equal to 1...
	addi $t1, $t0, -1	# ...subtract 1 from number
	mul $v0, $v0, $t1	# multiply n*(n-1)
	add $t0, $zero, $t1	# move n-1 to n
     	j factc 		# jump to factc
else:	
	beq $a0, $t2, end	# if n = 0
##

     	#the factorial number is computed and stored in $v0, copy it to $a1, the original number is in $a0, print both of them them out
end:	add $a1, $zero, $v0   	# second argument for print, the result
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
print:	add $t0, $zero, $a0  	# the orignal number
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

