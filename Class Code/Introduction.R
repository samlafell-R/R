
###------------------------------------###
##
## Class One: Introduction to R
## For: Institute of Advanced Analytics 
## Instructor: Aaron Baker 
## Email: ambaker31991@gmail.com
##
###------------------------------------### 


# The comment symbol: place a hashtag # to comment a line of code 
# The comment symbol will cause that line to not be executed 
# The comment symbol is used to stop code from executing 


##----------------------------##
## Arithmetic Operators 
##----------------------------##

# R can be a calculator:

# addition
1 + 1

# subtraction
5 - 4 

# multiplication 
2 * 2 

# division
9 / 3 
9.2 / 3

# integer divison (floor)
9.2 %/% 3 
9.7 %/% 3

# modulo (modulus) (remainder after division)
9.2 %% 3 
9.7 %% 3

# exponential
3^2 

# paranthetical operations - square root
9^(1/2) 

# Note I can execute these without the need for an end-line command, such as a ":" or ";" 
# R executes by line, unless designated with a semi-colon ; 
3^2; 9^(1/2) 
3^2 9^(1/2) #this will error

# In addition to operators, R comes with numerous functions that you can call to perform operations 

# Square root function
9^(1/2)
sqrt(9)
exp(9)

# Floor function
9 %/% 3 
floor(9.2/3)

# Ceiling 
ceiling(9.2/3)

# Round
round(9.1234567, 4)
round(9.1234567, 0)

# Note in the previous example, the round() function is given two arguments
# How did I know what arguments to use?
# The arguments for a function can be determined using the help or ? operator 
?round()
help(round)

# If you're not sure of the function to use, search the help instead 
help.search("rounding")

# Or you can find all of the functions within a package, such as "base" by typing the package name and :: 
base::
  
  # In the help, I found: 
  # round(x, digits = 0)
  # x	a numeric vector. Or, for round and signif, a complex vector.
  # digits	integer indicating the number of decimal places (round) or significant digits (signif) to be used. 
  # Negative values are allowed (see 'Details').
  
  # Note for a function, I can provide the values in argument order or I can specify the argument out of order 
  round(9.1234567, 4)
round(x=9.1234567, digits=4)
round(4, 9.1234567)
round(digits=4, x=9.1234567)

# Additionally, in the function arguments you will notice an equal sign (=)
# The equal sign is the default value if no value is passed 
round(9.1234567,0)
round(9.1234567)

# We will cover how to create functions in class 3

##-------------------##
## Assignments
##-------------------##

# We often don't want to just output the results, but instead store it to use further in the code 
# We accomplish this by assigning the data to a variable 
# R uses the assignment operator "<-" to assign variables 
variable <- 8
variable

# If you're exposed to other programming languages, note you don't have to create an empty variable, specify type, or memory
# R handles all of this natively 

# A variable can be operated on 
variable + 1

# And passed to a function
sqrt(variable + 1)

# To reassign a variable, just reassign in
variable <- 3000
variable 

# You can also reassign a variable to itself 
variable <- 8
variable

variable <- variable + 1
variable

# You can use almost anything as a variable name 
a <- 8
a
a <- 5

b <- 1
b

c <- a + b
c

# Except starting with a number
1a <- 1
10 <- a

a1 <- 1

# If you want to clear a variable from memory explicitly using the rm() function
rm("a")
a

# If you want to clear all the variables from memory, you can combine the rm() and ls() functions
rm(list = ls())

# Note, a variable constructed of other variables only updates upon execution of the assignment
# not upon updating of the dependent variables
a <- 8 
b <- 1
c <- a + b
c

a <- 5
c # note that c remains 9 instead of a+b = 6

c <- a + b #to reflect the change in A, you need to execute the c assignment again
c

# You can broaden assignments beyond numbers 
result <- sqrt(9)

fruit_1 <- "apple"
fruit_2 <- "banana"
fruit_3 <- "cantaloupe"
fruit_1
fruit_2
fruit_3

# Why the assignment operator and not an equal sign (=) as in other languages?
# You can use = in R for assignment but note the following:
# <- is how you will see it written in many R code examples 
# there are additional uses for assignment notation 
# left hand assignment 
# global enviornment assignment (we will cover in Class 4)

# = and <- are the same
a = 1
a

b <- 1
b

# left hand assignment
1 -> a
a

1 = a #note cannot do left hand assignment in R 

# if you really want to have fun ...
a <- b <- c <- 6


