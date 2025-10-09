#ALY 6010 - Module 4 - Practice Assignment
#Installing packages  in R
install.packages("vcd")

#Importing VCD library
library(vcd)

#Installing multiple packages
myPackages <- c("Hmisc", "tidyr", "dplyr", "summarytools", "psych", "forcats", "devtools")
install.packages(myPackages)
library(ggplot2)
library(dplyr)

install.packages("MASS")
library(MASS)

#Importing the dataset
cats <- read.csv("mock_cats_dataset.csv", header=TRUE)
cats

#Summary statistics of the data set
summary(cats)
View(cats)
dim(cats)
head(cats)
tail(cats)
str(cats)
table(cats)
class(cats)
range(cats$Bwt)

#PART 1
male <- subset(cats, subset=(cats$Sex=="M"))
male
summary(male)
#Finding the top 10 male bodyweights in the data set.
top_10_male_values <- male %>% 
  top_n(10, Bwt)
top_10_male_values
# Reordering the top 10 male bodyweights in descending order
top_10_male_values <- top_10_male_values[order(-top_10_male_values$Bwt), ]
top_10_male_values
#Finding the top 10 lowest male bodyweights in the data set and sort in ascending order.
top_10_lowest_m <- male[order(male$Bwt), ]
top_10_lowest_m <- head(top_10_lowest, 10)  
# Adding a rank column
top_10_lowest_m$rank <- rank(top_10_lowest_m$Bwt) 
top_10_lowest_m

female <- subset(cats, subset=(cats$Sex=="F"))
female
summary(female)
#Finding the top 10 female bodyweights in the data set.
top_10_female_values <- female %>% 
  top_n(10, Bwt)
top_10_female_values
#Reordering the top 10 female bodyweights in descending order
top_10_female_values <- top_10_female_values[order(-top_10_female_values$Bwt), ]
top_10_female_values
#Finding the top 10 lowest female bodyweights in the data set and sort in ascending order.
top_10_lowest_f <- female[order(female$Bwt), ]  
top_10_lowest_f <- head(top_10_lowest_f, 10)  
# Adding a rank column
top_10_lowest_f$rank <- rank(top_10_lowest_f$Bwt)
top_10_lowest_f

#Performing Independent Samples T-test
t.test(male$Bwt, female$Bwt)

#Performing Welch's t-test
t.test(male$Bwt, female$Bwt, var.equal = FALSE)

#Performing One-sided t-tests
t.test(male$Bwt, female$Bwt, alternative = "greater")

#Box plot of the variable means
box_colors <- c("yellow", "purple")
boxplot(male$Bwt, female$Bwt, names = c("Male", "Female"),
        xlab = "Gender", ylab = "Bodyweight Average",
        main = "Comparison of Cat Bodyweight Means between Genders", col = box_colors,
        ylim = c(0, 4.5), xlim = c(0, 3))

#PART 2
#Null Hypothesis: The average sleep quality score before the workshop is the same as the average sleep quality score following the workshop.
#Alternate Hypothesis: The average sleep quality score before the workshop is not the same as the average sleep quality score following the workshop.
#Create variables for the before and after samples
before <- c(4.6, 7.8, 9.1, 5.6, 6.9, 8.5, 5.3, 7.1, 3.2, 4.4)
before
after <- c(6.6, 7.7, 9.0, 6.2, 7.8, 8.3, 5.9, 6.5, 5.8, 4.9)
after

#Paired sample t-test with an alpha = 0.05
meditation <- t.test(before, after, paired = TRUE, conf.level = 0.95)
print(meditation)

#Paired sample t-test with an alpha = 0.1
meditation1 <- t.test(before, after, paired = TRUE, conf.level = 0.90)
print(meditation1)

#Performing Welch's t-test
t.test(before, after, var.equal = FALSE)

#Performing One-sided t-tests
t.test(before, after, alternative = "less")

#Performing Independent Samples T-test
t.test(before, after)

#Looking at the averages in data visualizations
# Calculating the means of each variable
sleep <- c(mean(before), mean(after))
sleep
bar_colors <- c("red", "blue")

#Bar plot of the variable means
barplot(sleep, names.arg = c("Before", "After"),
        xlab = "Students", ylab = "Sleep Quality Score",
        main = "Sleep Quality From Meditation", col = bar_colors,
        ylim = c(0, 7))
