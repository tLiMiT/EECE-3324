# EECE 3324 Computer Architecture and Organization
# Homework 3
# Tim Liming

# Question 2
# Write a program to print out your name and the name of your favorite sports team in 
# MIPS assembly.

# Text
	.text 
	.globl  main
main:
	la $a0, Name     	# load Name string 
        li $v0, 4          	# print string command
	syscall			# print Name string
	la $a0, Team     	# load Team string 
        li $v0, 4          	# print string command
	syscall			# print Team string
	
	li $v0, 10	        # exit program command
        syscall			# exit program

# Data
	.data
Name:	.ascii "Hello, my name is: "
	.asciiz "Tim Liming \n"			# Name goes here
Team:	.ascii "My favorite sports team is: "
	.asciiz "FC Bayern Munich \n"		# Sports team goes here