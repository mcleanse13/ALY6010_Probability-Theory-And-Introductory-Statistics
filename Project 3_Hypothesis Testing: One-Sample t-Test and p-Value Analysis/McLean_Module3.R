#ALY 6010 - Module 3 - Practice Assignment
#Installing packages  in R
install.packages("vcd")

#Importing VCD library
library(vcd)

#Installing multiple packages
myPackages <- c("Hmisc", "tidyr", "dplyr", "summarytools", "psych", "forcats", "devtools")
install.packages(myPackages)
library(ggplot2)
library(dplyr)

#Import the data set as 'patient_health_data.xlsx' into R
library(readxl)
data <- "patient_health_data.xlsx"
health <- read_excel(data)

# Column names of the 'patient_health_data' data set
column_names <- colnames(health)
print(column_names)

#Question 1
#Conduct a one-sample t-test for the mean using an appropriate variable from the data set and also using the t.test( ) in R.
range(health$BMI)
t_test_result <- t.test(health$BMI, mu = 24)
print(t_test_result)

#Question 2
# Conduct hypothesis testing for the p-value using an appropriate variable from the data set.
range(health$ExerciseFrequency)
t_test_result <- t.test(health$ExerciseFrequency, mu = 1)
print(t_test_result)
