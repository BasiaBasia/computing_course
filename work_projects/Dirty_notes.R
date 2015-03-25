# Dirty notes ;):

#Set and prove working directory:
setwd("/Users/stepien/Desktop/git/work_projects/")
print(getwd())

#Read in data (weights of pregnant mice on each day of the pregnancy):
weights <- read.csv("mouse_weight_data.csv", header=T, row.names=NULL)
column.names <- colnames(weights)
subset.column.names <- column.names[3:length(column.names)]

#Subset the data.frame to extract the right values:
weights.subset <- subset(weights, select=subset.column.names)

#Set values for x variable:
days <- c(0.5:9.5)

#Plot data for each mouse separately - weight vs embryonic day. Label each strain
#with a different colour:
plot(days, weights.subset[1,], type="l", xlab="embryonic day", ylab="weight [g]",
     xlim=c(0.5, max(days)-2), ylim=c(16, max(weights.subset, na.rm=T)), col="red")
for (i in 2:length(rownames(weights.subset))) {
  if (weights$mouse.weight..g..records[i]=="C57BL/6JOlaHsd") {
    colour="red"
    } else {
      colour="blue"}
  lines(days, weights.subset[i,], col=colour)
}

#Calculate statistics for weight gain:
#Change of weight from E0.5 to the last day:
change <- c(weights.subset[,8][1:5]-weights.subset[,1][1:5],
            weights.subset[,7][6:10]-weights.subset[,1][6:10])
names(change) <- weights[,1]


mean(change)
median(change)

#Weight gain per day:
change.per.day <- change/(length(names(weights.subset))-2)

#Test differences in weight gain between genotypes:
t.test()
