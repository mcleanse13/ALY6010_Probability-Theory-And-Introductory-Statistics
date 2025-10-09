#ALY 6010 - Module 5 - Practice Assignment
#Installing packages  in R
install.packages("vcd")

#Importing VCD library
library(vcd)

#Installing multiple packages
myPackages <- c("Hmisc", "tidyr", "dplyr", "summarytools", "psych", "forcats", "devtools")
install.packages(myPackages)
library(ggplot2)
library(dplyr)

#Importing the dataset
reg <- read.csv("regression_practice_corrected_dataset.csv", header=TRUE)
reg

#Summary statistics of the data set
summary(reg)
View(reg)
dim(reg)
head(reg)
tail(reg)
str(reg)
table(reg)
class(reg)
range(reg$Attendance)
fortify(reg)
aes(reg)

#Question 1
# Sample data
set.seed(123)

# Creating a correlation matrix
correlation_matrix <- cor(reg)

# Visualizing the correlation matrix as a heatmap
library(ggplot2)
library(reshape2)

# Melt the correlation matrix for plotting
melted_correlation <- melt(correlation_matrix)

# Create a heatmap
ggplot(data = melted_correlation, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "red", high = "green", na.value = "white") +
  theme_minimal() +
  labs(title = "Correlation Heatmap of Student Academic Performance")

#Question 2
# Performing multiple linear regression with Test Scores
model <- lm(Test_Scores ~ Hours_Study + Attendance + Participation, data = reg)
summary(model)

# Performing multiple linear regression with Project Scores
models <- lm(Project_Scores ~ Hours_Study + Attendance + Participation, data = reg)
summary(models)
