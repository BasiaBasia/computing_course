# Barplot for quantification of crosslinking of Orb and Orb2 to RNA (RNA to protein).

# Read in data:
crosslink.data <- read.csv("reviews/CPEB_crosslink_quantification.csv", header=T, 
                           row.names=NULL)
crosslink.detailed <- read.csv("reviews/CPEB_crosslink_details.csv", header=T, 
                               row.names=NULL)

# Load library for barplot2:
library(gplots)

colours <- c("blue")
par(mfrow=c(1,2))
barplot2(crosslink.data$Orb.mean, beside=T, col=colours)
barplot2(crosslink.data$Orb2.mean, beside=T, col=colours)

# Testing difference of WT to mutants using T-test: 
print(t.test(crosslink.detailed[1,2:5], crosslink.detailed[3,2:5]))
print(t.test(crosslink.detailed[1,2:5], crosslink.detailed[4,2:5]))
print(t.test(crosslink.detailed[1,2:5], crosslink.detailed[5,2:5]))
print(t.test(crosslink.detailed[1,2:5], crosslink.detailed[6,2:5]))
print(t.test(crosslink.detailed[1,2:5], crosslink.detailed[7,2:5]))

# add error bars to graphs, and significance


#print(t.test(crosslink.detailed[1,6:7], crosslink.detailed[2,2:5]))
