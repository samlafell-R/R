# Set Seed = 1
set.seed(1)

# Create a variable "pop_truth" that is 100,000 samples from an exponential distribution with rate 2. 
# https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/Exponential
pop_truth <- rexp(100000, rate=2)

# What is the mean of pop_truth rounded to 2 decimals?
round(mean(pop_truth), 2)

# Create a variable "sample_pop" that is a random sample of 5,000 values from "pop_truth". 
#Paste your code in the text box below.
?sample()
sample_pop <- sample(pop_truth, size=5000)

#Create a function named "sample_stats" that calculates and 
#returns the mean and standard deviation from a provided vector. 
#Paste your code in the text box below.
sample_stats <- function(data){
  mean <- mean(data)
  std <- sd(data)
  l1 <- list(mean=mean, std=std)
  return(l1)
}
sample_stats(sample_pop)


# Occassionally, we need perform a task in an iterative cycle, also known as a loop
# For loops - they iterate a defined number of times 
sequence <- seq(1,10000,1)
#Note this will iterate 10000 times, the number of elements in "sequence"
for (i in 1:length(sequence)) {
  if (i==1) {
    df_results <- data.frame('mean'=numeric(0), 'stdev'=numeric(0), 'iteration'=numeric(0))
  }
  sample_pop <- sample(pop_truth, size=500)
  metrics <- sample_stats(sample_pop)
  metrics[3] <- i
  metrics <- as.data.frame(metrics)
  colnames(metrics) <- c('mean', 'stdev', 'iteration')
  df_results <- rbind(df_results, metrics)
  print(paste('Currently on iteration: ', i))
}

# What is the average of "df_results$mean", rounded to two decimals? 
round(mean(df_results$mean),2)

# Compute the 5th and 95th percentiles of "df_results$mean". 
#What is the 5th percentile, rounded to two decimals?
?quantile()
round(quantile(df_results$mean, probs=.05),2)
quantile(df_results$mean, probs=.95)

#Use the hist() function to create a histogram of "df_results$mean" and "pop_truth". 
#What type of distribution does "df_results$mean" appear to be?
?hist()
hist(df_results$mean)
