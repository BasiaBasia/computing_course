# Cell counting - summary barplot.

# Load library for barplot2:
library(gplots)

# Load data:
DAPI <- c(585, 757, 560, 535, 561, 820)
Pax6 <- c(305, 361, 277, 256, 243, 292)
Tbr2 <- c(276, 396, 265, 264, 235, 417)
double <- c(144, 199, 151, 126, 93, 152)
Pax6_only <- Pax6-double
Tbr2_only <- Tbr2-double
names_matrix <- c("Image23", "Image29", "Image25", "Image26", "Image33", "Image1")

input_counts <- rbind(DAPI, Pax6, Tbr2, double)
colnames(input_counts) <- names_matrix

# Draw a barplot:
colours <- c("blue", "red", "green", "pink")
barplot2(input_counts, beside=T, col=colours)