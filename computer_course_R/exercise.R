# Exercises for a scientific programming course:

# Remember to uncomment library() for the libs used in this script for the first run
# in a session.

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

# "The following objects are masked from ‘package:base’:" - if there are libraries
# which have functions with the same names - it will use the function from the latest
# loaded library.

# Changing from wide to long format (excluding the Patient column from shaping):
head(dataset1)
dataset1_shaped <- gather(dataset1, Day, Inflammation_Level, -Patient)
View(dataset1_shaped)
dataset1_reshaped <- spread(dataset1_shaped, Day, Inflammation_Level)

# Plotting with ggplot:
#library(ggplot2)

# Standard datasets for ggplot (iris, cars and mtcars):
head(iris)
head(mtcars)

# Scatterplots:
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+geom_point()

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species))+geom_point()
p <- ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, 
                       color=Species))+geom_point(aes(size=Species))
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, 
                           color=Species))+geom_point(aes(size=Sepal.Length))
pp <- p+geom_point(aes(size=Species))+facet_wrap(~Species)
ppp <- pp+stat_smooth(method="lm")

dataset1_plot <- ggplot(dataset1_shaped, aes(x=Day,
                                             y=Inflammation_Level,
                                             color=Patient))+geom_point()

dataset1_plot <- dataset1_plot+facet_wrap(~Patient)

dataset1_plot <- ggplot(dataset1_shaped, aes(x=Day,
                                             y=Inflammation_Level))+geom_boxplot()

dataset1_plot <- ggplot(dataset1_shaped,
                        aes(x=Day,
                            y=Inflammation_Level))+geom_boxplot()+geom_point()

# Documenting code in R and exporting to HTML:
#comments as plain text in {} (???) R markdown, knitr for automatic reports
#return(day_sum)
# Shiny for interactive plots