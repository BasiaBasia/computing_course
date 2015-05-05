# Analysis of embryo/pup size and mass in relation to the strain.

# Load library for barplot2:
library(gplots)

# Load library for each():
library(plyr)

# Load library for std.error():
library(plotrix)

# Read in data:
pregnancy.data <- read.csv("pregnancy_datasheet.csv", header=T, row.names=NULL)
pregnancy.data2 <- read.csv("pregnancy_datasheet_2.csv", header=T, row.names=NULL)

# Subset the data by strain and stage and save into matrices:
AJ13.5 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="A/JolaHsd" & pregnancy.data2$stage=="E13.5",3:5])
AJ16.5 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="A/JolaHsd" & pregnancy.data2$stage=="E16.5",3:5])
AJP0 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="A/JolaHsd" & pregnancy.data2$stage=="P0 (E19.5)",
                  3:5])
BL13.5 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="C57BL/6JOlaHsd" & pregnancy.data2$stage=="E13.5",
                  3:5])
BL16.5 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="C57BL/6JOlaHsd" & pregnancy.data2$stage=="E16.5",
                  3:5])
BLP0 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="C57BL/6JOlaHsd" & pregnancy.data2$stage=="P0 (E19.5)",
                  3:5])
FVB13.5 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="FVB/NHanHsd" & pregnancy.data2$stage=="E13.5",
                  3:5])
FVB16.5 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="FVB/NHanHsd" & pregnancy.data2$stage=="E16.5",
                  3:5])
FVBP0 <- as.matrix(
  pregnancy.data2[pregnancy.data2$strain=="FVB/NHanHsd" & pregnancy.data2$stage=="P0 (E19.5)",
                  3:5])

# Combine martices into one list of input and assign names:
input.per.condition <- list(AJ13.5, AJ16.5, AJP0, BL13.5, BL16.5, BLP0, FVB13.5, FVB16.5,
                         FVBP0)

condition.names <- c(paste(unique(pregnancy.data2$strain)[1], unique(pregnancy.data2$stage)),
                     paste(unique(pregnancy.data2$strain)[2], unique(pregnancy.data2$stage)),
                     paste(unique(pregnancy.data2$strain)[3], unique(pregnancy.data2$stage)))

names(input.per.condition) <- condition.names

# Calculate mean, median, stdev and standard error for body weight and brain weight
# for each age and strain separately. Use each() function to run multiple functions on each
# dataset.

body.stats <- matrix(,9,4)
brain.stats <- matrix(,9,4)
for (i in 1:length(input.per.condition)) {
  body.stats[i,] <- each(mean, median, sd, std.error)(input.per.condition[[i]][,1])
  brain.stats[i,] <- each(mean, median, sd, std.error)(input.per.condition[[i]][,2])
}

functions.used <- c("mean", "median", "sd", "se")
colnames(body.stats) <- functions.used
rownames(body.stats) <- condition.names
colnames(brain.stats) <- functions.used
rownames(brain.stats) <- condition.names

# Plot barplots.

par(mfrow=c(1,2))
barplot2(body.stats[,"mean"])
barplot2(brain.stats[,"mean"])
barplot2(body.stats[,"median"])
barplot2(brain.stats[,"median"])

# Re-calculate the mean correcting for the liter size.

# Test differences between the strains using T-test and Anova.


# Correlate brain and body weight and liter size to one another.

# Plot correlations.

# Plot boxplots.