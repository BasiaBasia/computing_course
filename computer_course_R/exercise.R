# Exercises for a scientific programming course:

# Set working directory:
setwd("~/Desktop/training/Shell_R_Python/python/data/")

# Read data in form of .csv:
dataset1 <- read.csv(
            file="~/Desktop/training/Shell_R_Python/python/data/inflammation-01.csv",
            header=FALSE)
# also possible this way (bad it's a nighmare for reading - not advisable):
read.csv(file="~/Desktop/training/Shell_R_Python/python/data/inflammation-01.csv",
  header=FALSE) -> dataset1

head(dataset1)
weight <- 55

# Type of variable (floating point number is called double):
typeof(weight)

weight_lb <- weight*2.2
weights <- c(56, 80, 90, 91)
typeof(weights)

# Data structure:
str(weights)

# Data dimensions:
dim(dataset1)
ncol(dataset1)
nrow(dataset1)

# Slicing:
print(dataset1[1,1])
print(dataset1[20,31])
print(dataset1[1:4, 1:10])
small<-(dataset1[c(3, 5, 10), c(4, 5)])
dataset1[5,]
dataset1[,5]

patient_5 <- dataset1[5,]
min(patient_5)
max(patient_5)
mean(as.matrix(patient_5))

# Apply function: apply on dataset1, on all columns (2 - rows would be 1) and function max():
max_inflammation_per_day <- apply(dataset1, 2, max)
max_inflammation_per_patient <- apply(dataset1, 1, max)

# Basic plotting:
plot(max_inflammation_per_day)
plot(max_inflammation_per_patient)

# Show column names:
colnames(dataset1)

# Naming rows and columns:
colnames(dataset1) <- 1:ncol(dataset1) 
rownames(dataset1) <- 1:nrow(dataset1)

dataset1$"40"
dataset1$Patient <- 1:nrow(dataset1)

rownames(dataset1) <- paste("patient_", 1:nrow(dataset1), sep="")

# sprintf() function; %03d syntax -adding numbers with 3 places: 001, 002, ...):
dataset1$Patient <- sprintf("Patient_%03d", 1:nrow(dataset1))

# Converting wide and long (for ggplot2, plyr, modelling functions e.g. lm())
# data formats - data wrangling:
# tidyr() (succesor of reshape)
# dplyr()

# Installing packages and loading libraries:
#install.packages("tidyr")
#library("tidyr")

#install.packages("dplyr")
#library("dplyr")



