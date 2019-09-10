sum(seq(10,100,10))
V1 <- seq(10,1000,10)
length(V1)
V1
sum(V1)

# Make a vector, "V2", of 100 elements of the value 25. What is the total value (sum) of "V2"?
V2 <- rep(25, 100)
sum(V2)

#Make a vector, "V3", that is "V1" divided by "V2". What is the max value of "V3"? 
V3 <- V1/V2
max(V3)

# Create data frame, "df1", comprised of "V1","V2", and "V3". 
#Name the columns "Vector_1", "Vector_2", and "Vector_3" respectively. 
#Paste your code in the text box below. 
df1 <- data.frame(V1, V2, V3)
colnames(df1)<-c('Vector_1', 'Vector_2', 'Vector_3')
df1

# How many rows are in "df1"?
dim(df1)

#What is the index of the max observation in "df1" column "Vector_3"?
# Index =
which.max(df1$Vector_3)
# Value =
df1$Vector_3[which.max(df1$Vector_3)]

#Create a new column in "df1", "Vector_4", 
#that is the result of adding "Vector_1" and "Vector_3" together. 
#What is the maximum value in "Vector_4"?
df1$Vector_4 <- df1$Vector_1 + df1$Vector_3
max(df1$Vector_4)    

#Move the column "Vector_4" to the first column of "df1" Paste your code in the text box below. 
df1 <- df1[,c(4,1:3)]
df1

# What value is in row 81, column 1 of "df1"?
df1[81, 1]

# Reassign the minimum value in row 86 to 1. What is the mean of "Vector_2"?
df1[86,]
df1[86, 3] <- 1
df1[86, 3]
mean(df1$Vector_2)

#Create a new column in "df1", "Row_Mean", that is the average of the values in 
#columns. What is the value of "Row_Mean" for row 45?
df1$Row_Mean <- rowMeans(df1)
df1[45,5]


#Create a list, "l1", from "df1". Paste your code in the text bow below. 
l1 <- list(df1)
str(l1)

#What is the mean of the combined elements from 
#"l1" components "Vector 1" and "Vector 2"?
#mean(l1[1]$Vector_1 + l1[1]$Vector_2)

#sum(l1[[1]]$Vector_1 + l1[[1]]$Vector_2)/length(l1[[1]])

combined_list <- c(l1[[1]]$Vector_1, l1[[1]]$Vector_2)
mean(combined_list)
