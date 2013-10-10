# EECE 3324 Computer Architecture and Organization
# Homework 3
# Tim Liming

# Question 1
# Write a MIPS assembly program that loads 2 integers from memory, generates their 
# sum, their difference, and then stores these two new values back to memory.

# Text
	.text           	
        .globl  main		
main:
	la $a0, prompt     	# prompt for numbers 
        li $v0, 4          	# print string command
	syscall			# print prompt
        li $v0, 5          	# read int command
        syscall 		# read int
        sw $v0, NUM1		# store first integer 
        li $v0, 5         	# read int command
        syscall 		# read int
        sw $v0, NUM2       	# store second integer
	
	lw $t0, NUM1
	lw $t1, NUM2
        add $a0, $t0, $t1	# find the sum
        add $s0, $zero, $a0	# store sum in $s0
        li $v0, 1		# print int command
        syscall			# print int
        la $a0, sum 		# load sum string
        li $v0, 4 		# print string command
        syscall			# print sum string
        
        sub $a0, $t0, $t1	# find the diff
        add $s1, $zero, $a0	# store diff in $s1
        li $v0, 1		# print int command
        syscall			# print int
        la $a0, diff 		# load diff string
        li $v0, 4 		# print string command
        syscall			# print diff srting
        
	li $v0, 10	        # exit program command
        syscall			# exit program

# Data
	.data
NUM1:	.word 0			
NUM2:	.word 0 		
prompt: .asciiz "Enter 2 integers (use Enter key):\n" 
sum:  	.asciiz " is the sum.\n"
diff:  	.asciiz " is the difference.\n"

