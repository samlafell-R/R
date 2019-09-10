
###------------------------------------###
##
## Class Two: Data Structures
## For: Institute of Advanced Analytics 
## Instructor: Aaron Baker 
## Email: ambaker31991@gmail.com
##
###------------------------------------### 

##----------------------------##
## Set WD
##----------------------------##
setwd("~/Desktop/MSA/R/Class Code")


##----------------------------##
## Vectors
##----------------------------##

# In class one, we covered assignments such as:

a <- 1 
b <- 2 
results <- a + b
results

# Here we assigned a value to variable
# However, we can assign multiple values to a single variable, thus creating a vector 
# A vector is a data structure that holds multiple elements 
# Vectors elements are "indexed". You access the element with the [x] operator 
results[1]

# Note, R is one orgin indexed. The first element is [1], opposed to [0] in some languages.
results[0]

# We can add another element to the vector
results[2] <- 3 + 4
results
length(results)
results[2]

results[3] <- 5 + 6
results
results[4] <- 7 + 8
results

# Or we can construct a vector using the combine (c) function:
other_results <- c(9+10, 11+12, 13+14, 15+16)
other_results
length(other_results)
other_results[3]

# You can combine (merge/append) vectors using the combine function as well
combined_results <- c(results, other_results)

# Vectors can be added together in an element-wise operation:
total_add <- results + other_results
total_div <- results / other_results
total_mod <- results %% other_results

results
other_results
total_add
total_div
total_mod

# Functions can be applied to each element of the vector 
total_rou <- round(total_div, 2)
total_rou

# Or a vector can be operated on by a scalar (singular value)
total_add / 3
total_add + 3

# Or individual elements can be extracted for use:
other_results[3]/results[2]

# Some useful functions for vectors 
sum(total_add)
length(total_add)
max(total_add)
which.max(total_add)
sort(total_add, decreasing = TRUE)
sort(total_add, decreasing = FALSE)

total_add[which.max(total_add)]

# There are also functions for constructing useful types of vectors 

# Replicate - replicates a value X number of times 
identity_vector <- rep(1,10)
identity_vector


# Sequence operator ":" From:To 
sequence_vector <- 1:10

# Sequence function - allows sequencing by a value
sequence_by_two_vector <- seq(0,10, 2)
sequence_by_two_vector

# Sample function - take a random sample from a vector
random_vector <- sample(sequence_by_two_vector,3)
?sample()

# Finally, a vector doesn't have to be numeric:
names <- c("Simmons", "Race", "Healey", "LaBarr", "Villanes")
names

names <- sort(names, decreasing = TRUE)
names

names <- sort(names, decreasing = FALSE)
names

# A vector doesn't have to be made with consistent elements, but it will force them to one type
values <- c("IAA", 1, "2018", 5)
values

# An important thing to note - the elements of a vector can only be of one type. 
# If you want elements of different types... you need a list

typeof(values)
class(values) # class of a data object as it relates to whatever package it's used for.
   # time series: type = numeric, class = time series

##----------------------------##
## Lists
##----------------------------##   

# A list is an object that can contain other objects in it's elements 

# Here are 3 vectors of different types
v1 <- c("apple", "banana")
v2 <- c("dog", "cat", "bunny", "pig", "cow", "horse")
v3 <- seq(0,10,by=2)

# Going to put all of these vectors into a list
l1 <- list(v1, v2, v3)
l1

class(l1)
typeof(l1)

# List elements can be accessed via index
# Note, the component of a list is accessed via the [[x]] operator

l1[[1]]

l1[[1]][1]

l1[[2]]

l1[[3]]

# List elements can be named 
names(l1) <- c("Fruit", "Animals", "Even_Numbers")
l1 <- list(Fruit=v1, Animals=v2, Even_Numbers=v3)

# Elements in a list can be retrieved by name
l1$Fruit
l1$Fruit[1]

l1$Even_Numbers
max(l1$Even_Numbers)


# A list can contain lists 
l2 <- list(Odd_Numbers=seq(1,10,by=2), l1=l1)
l2

# First Vector
l2$Odd_Numbers
l2[[1]]

# l1 within L2
l2$l1
l2[[2]]

l2$l1$Fruit
l2[[2]][1]

l2$l1$Fruit[1]
l2[[2]][[1]][1]

l2[[2]][[1]][3] <- "blueberry"
l2$l1$Fruit
l2

#To combine (append/merge) lists
l4 <- list(More_Fruit=c("melon", "orange"))
l1 <- c(l1,l4)

#If you want to update part of a list, just operate on it accordingly
l1$Fruit <- c(l1$Fruit, l4$More_Fruit)
l1$Fruit

##----------------------------##
## Arrays
##----------------------------##

# Arrays are similar to vectors, except that they are multi-dimensional 
sequence_vector

# 1 dimension - 1 row (vector)
sequence_array_1_dim <- array(1:10, 10)
sequence_array_1_dim

# 2 dimensions - 2 rows, 5 columns 
sequence_array_2_dim <- array(1:10, c(2,5))
sequence_array_2_dim

# 3 dimensions - 2 rows, 5 columns, 2 tables
sequence_array_3_dim <- array(1:20, c(2,5,2))
sequence_array_3_dim

# 4 dimensions - 2 rows, 5 columns, 2 tables, 2 sets 
sequence_array_4_dim <- array(1:40, c(2,5,2,2))
sequence_array_4_dim

sequence_array_4_dim <- array(1:20, c(2,5,2,2))
sequence_array_4_dim

# You can use this to store or extract elements 
sequence_array_4_dim[2,5,2,1]

sequence_array_4_dim[2,5,2,1] <- 1000

sequence_array_4_dim

# Similar to vectors, functions can be applied to arrays
dim(sequence_array_4_dim)
length(sequence_array_4_dim)
sum(sequence_array_4_dim)
max(sequence_array_4_dim)
which.max(sequence_array_4_dim)

# Operators still function pairwise 
another_2_dim_array <- array(1:10, c(2,5))

result_array <- sequence_array_2_dim + another_2_dim_array
result_array

# In all honestly, you won't encounter or require arrays frequently. 
# If you do, it's often 2 dimensional and rarely beyond 3 dimensions

a1 <- array(1:10, c(2,5))
a2 <- array(1:10, c(2,5))
r1 <- a1 * a2

a1
a2
r1

# Note, multiplying a 2 dimension array results in a matrix
class(r1)

##----------------------------##
## Matrices
##----------------------------##

# A matrix is a 2-demensional (row x column) array 
A <- matrix(1:25, 5, 5)
A

B <- matrix(1:25, 5, 5, byrow=TRUE) #if you want to fill down the row instead of across the columns
B

C <- matrix(1:5, 1, 5)
C

D <- matrix(1:5, 5, 1)
D

# Make an identity matrix
I <- diag(5)
I

# Matrices are convient because you can do linear algrebra with them... 

# Element-wise operators 
A + B
A - B
A * B
A / B

# Matrix Multiplication
C %*% D

# Transpose 
C
t(C)

# You can also name the matrix columns and and rows 
colnames(A) <- c("Column_1", "Column_2", "Column_3", "Column_4", "Column_5")
A

colnames(A)[4] <- "Changed_It"
A

rownames(A)  <- c("Row_1", "Row_2", "Row_3", "Row_4", "Row_5")
A

# Some helpful functions for matrices
colSums(A)
rowSums(A)
sum(A)
dim(A)
length(A)

# You can extract information from a matrix using similar index notation (row, column)
A

A[2,1] # Single element 

A[,1] # All rows in the first column
A[,c(1,2)] # All rows for columns 1 and 2

A[1,] # All columns in the first row 
A[c(1,2),] # All columns for rows 1 and 2

A["Row_1","Column_2"]

##----------------------------##
## Data Frames
##----------------------------## 

# A data frame is essentially a 2 dimensional matrix (row x column)
# Think of it like an excel table or relational database table 

# You create a data frame from a set of vectors:
dt1 <- data.frame(
  names =  c("Simmons", "Race", "Healey", "LaBarr", "Villanes", "Baker"),
  class = c("Regression", "Linear Algebra", "Visualization", "Time Series", "Text Mining", "R"),
  phd = c(1,1,1,1,1,0),
  stringsAsFactors = FALSE #For now, keep strings as factors = False. 
  #Factors are used when modeling but troublesome if doing munging tasks
)

# View the table
View(dt1)

# Head of the table
head(dt1, 2)

# Change the column names
colnames(dt1)
colnames(dt1) <- c("Last_Name", "Class_Taught", "Has_Phd?")
colnames(dt1)
colnames(dt1)[2] <- "Classes_Taught"
colnames(dt1)

# Reference a column by name
dt1$Last_Name
dt1$Classes_Taught

#Data frame indexes - similar to vectors and arrays 

# Retrieve a row
# leaving the row or column blank means "everything"
# the negative operator "-" means "everything but"
dt1[1,]
dt1[2:5,]
dt1[-1,]


## Give me the last row
# how many rows?
dim(dt1)

# Remove rows 1-5 since there are 6 columns
dt1[-(1:5),]



# Retreive a column
dt1[,1]
dt1[,-3]
dt1[,c(1:2)]
dt1[,"Last_Name"]
dt1[,c("Last_Name","Has_Phd?")]

# Retreive an element
dt1[6,2]

# Reassign an element 
dt1[6,2] <- "R & Digital Analytics"
dt1[6,]

#Find elements that meet a condition
dt1$`Has_Phd?`==1

# Filter by an value 
dt1[dt1$`Has_Phd?`==1,]

# Add a new row - rbind (row-bind) function
dt1 <- rbind(dt1, c("Dasmohapatra", "Clustering", 1))
dt1

# Add a new column
dt1$First_Name <- c("Susan", "Shaina", "Christopher", "Aric", "Andrea", "Aaron", "Sudipta")

# Change the order of columns 
dt1 <- dt1[,c(4,1:3)]
dt1

# Make columns based off other columns
dt1$First_Name_Length <- nchar(dt1$First_Name)
dt1$Last_Name_Length <- nchar(dt1$Last_Name)
dt1$Total_Name_Length <- dt1$First_Name_Length + dt1$Last_Name_Length + 1
dt1$Full_Name <- paste(dt1$First_Name, dt1$Last_Name, sep=" ")
dt1 

# Remove some intermediate step columns
dt1 <- dt1[,-c(5,6)]

##--------------------------------##
## Working with different types
##--------------------------------##

# If you're unsure of what you have, use the class function:
total_add
class(total_add)

names
class(names)

l2
class(l2)

sequence_array_1_dim
class(sequence_array_1_dim)

A
class(A)

dt1
class(dt1)

dt1$First_Name
class(dt1$First_Name)

# Additionally, you can do some conversions between them using the "as" functions

new_array <- as.array(total_add)
class(new_array)

old_vector <- as.vector(new_array) 
class(old_vector)

dfA <- as.data.frame(A)
class(dfA)


