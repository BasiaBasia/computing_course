# Cell counting - summary barplot.

# Load library for barplot2:
library(gplots)

# Load data:
DAPI <- c("E12.5"=585, "E12.5"=757, "E14.5"=560, "E14.5"=535, "UI"=561, "UI"=820,
          "UI"=427, "UI"=442, "E12.5"=447, "adult"=495, "PBS"=479, "PBS"=417,
          "E12.5"=386)
Pax6 <- c(305, 361, 277, 256, 243, 292, 368, 293, 265, 315, 247, 158, 174)
Tbr2 <- c(276, 396, 265, 264, 235, 417, 201, 199, 171, 181, 176, 127, 136)
double <- c(144, 199, 151, 126, 93, 152, 165, 119, 117, 97, 78, 42, 55)
names(Pax6) <- names(DAPI)
names(Tbr2) <- names(DAPI)
names(double) <- names(DAPI)
Pax6_only <- Pax6-double
Tbr2_only <- Tbr2-double
names_matrix <- c("Image23", "Image29", "Image25", "Image26", "Image33", "Image1",
                  "Image15", "Image18", "Image9", "Image11", "Image12", "Image20",
                  "Image21")

input_counts <- rbind(DAPI, Pax6, Tbr2, double)
colnames(input_counts) <- names_matrix

# Draw a barplot for raw input:
colours <- c("blue", "red", "green", "pink")
barplot2(input_counts, beside=T, col=colours)

# Draw a barplot for means of conditions:
adult <- c(mean(DAPI[names(DAPI)=="adult"]), mean(Pax6[names(Pax6)=="adult"]),
           mean(Tbr2[names(Tbr2)=="adult"]), mean(double[names(double)=="adult"]))
UI <- c(mean(DAPI[names(DAPI)=="UI"]), mean(Pax6[names(Pax6)=="UI"]),
           mean(Tbr2[names(Tbr2)=="UI"]), mean(double[names(double)=="UI"]))
PBS <- c(mean(DAPI[names(DAPI)=="PBS"]), mean(Pax6[names(Pax6)=="PBS"]),
        mean(Tbr2[names(Tbr2)=="PBS"]), mean(double[names(double)=="PBS"]))
E12.5 <- c(mean(DAPI[names(DAPI)=="E12.5"]), mean(Pax6[names(Pax6)=="E12.5"]),
         mean(Tbr2[names(Tbr2)=="E12.5"]), mean(double[names(double)=="E12.5"]))
E14.5 <- c(mean(DAPI[names(DAPI)=="E14.5"]), mean(Pax6[names(Pax6)=="E14.5"]),
         mean(Tbr2[names(Tbr2)=="E14.5"]), mean(double[names(double)=="E14.5"]))

conditions_input <- rbind(adult, UI, PBS, E12.5, E14.5)
colnames(conditions_input) <- rownames(input_counts)

colours <- c(rep("blue", 5), rep("red", 5), rep("green", 5), rep("pink", 5))
barplot2(conditions_input, beside=T, col=colours)

barplot2(conditions_input/conditions_input[,1], beside=T, col=colours)

# Try boxplot (work on it...):

for (i in 1:length(rownames(conditions_input)) ) {
  boxplot(input_counts[i,], col=colours[i])}
