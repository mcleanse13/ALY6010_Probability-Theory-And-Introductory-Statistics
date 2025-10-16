#ALY 6010 - Final Project: Milestones 1 and 2
#Milestone 1
#Installing packages  in R
install.packages("vcd")

#Importing VCD library
library(vcd)

#Installing multiple packages
myPackages <- c("Hmisc", "tidyr", "dplyr", "summarytools", "psych", "forcats", "devtools")
install.packages(myPackages)
library(ggplot2)
library(dplyr)

#Import the data set as 'cb2021.csv' into R
cbb <- read.csv(file = 'cb2021.csv', header = TRUE)
head(cbb)
tail(cbb)
class(cbb)
View(cbb)
str(cbb)
attributes(cbb)

# Changing the column names using colnames()
colnames(cbb) <- c("Season", "School ID#", "School", "RS Letter Code", "Ranking System", "Ranking Week", "Rank")
print(cbb)

# Removing columns by index due to the lack of usefulness
cbb1 <- cbb[, -c(1, 4)]
cbb1

#Descriptive Statistics of the revised data set
head(cbb1)
tail(cbb1)
summary(cbb1)
mean(cbb1$Rank)
quantile(cbb1$Rank, c(0.25, 0.5, 0.75))

table(cbb1$`Ranking System`)
table(cbb1$School)

# Create a frequency table
freq_table <- table(cbb1$School)

# Finding the most common school in the rankings for the season
most_common_item <- names(freq_table)[which.max(freq_table)]
print(paste("The most common item is:", most_common_item))

# Finding the least common school in the rankings for the season
least_common_item <- names(freq_table)[which.min(freq_table)]
print(paste("The least common item is:", least_common_item))

# Finding the top 25 most common schools in the rankings for the season
sorted_freq_table <- sort(freq_table, decreasing = TRUE)
top_25_items <- names(sorted_freq_table)[1:25]
print(paste("Top 25 most frequent items:", toString(top_25_items)))

# Finding the top 25 most common schools in the rankings for the season
sorted_freq_table <- sort(freq_table)
top_25_least_frequent_items <- names(sorted_freq_table)[1:25]
print(paste("Top 25 least frequent items:", toString(top_25_least_frequent_items)))

# Finding the list of all ranking systems in the Ranking System column
unique_categories <- unique(cbb1$`Ranking System`)
print(unique_categories)

# The number of different ranking systems used
num_unique_categories <- length(unique_categories)
print(paste("Number of unique categories:", num_unique_categories))

# Finding the list of all the schools in the School column
unique_categories1 <- unique(cbb1$School)
print(unique_categories1)

# The number of different ranking systems used
num_unique_categories1 <- length(unique_categories1)
print(paste("Number of unique categories:", num_unique_categories1))

#How many complete records(Observations) do we have?
dim(cbb1)
complete.cases(cbb1)
sum(complete.cases(cbb1))

#With so many rankings system, focus just on one for the season
element_to_keep <- " Associated Press    "
cbb2 <- cbb1[cbb1$`Ranking System` == element_to_keep, ]
print(cbb2)

element_to_keeps <- " USA Today Coaches   "
cbb5 <- cbb1[cbb1$`Ranking System` == element_to_keeps, ]
print(cbb5)

head(cbb2)
tail(cbb2)
summary(cbb2)

# Use the table function to tally items in the "Category" column
tally_rankings <- table(cbb2$School)
print(tally_rankings)

cbb3 <- tally_rankings
cbb3
range(tally_rankings)
summary(tally_rankings)
mean(tally_rankings)
median(tally_rankings)
mode(tally_rankings)

# Create a bar chart
barplot(table(cbb3), main = "Total Rankings Per School", xlab = "Schools", ylab = "Weeks Ranked", col = "skyblue")

#Create a box plot
quantile(cbb3)
boxplot(cbb3, main = "Boxplot of the Total Rankings Per School", ylab = "Weeks Ranked", col = "red")

# Create a histogram
hist(cbb3, col = "lightblue", main = "Total Rankings Per School", xlab = "Schools", ylab = "Weeks Ranked")

#Combined two ranking systems datasets into one dataset
rankings <- list(cbb2 = cbb2, cbb5 = cbb5)
rankings
View(rankings)

#Milestone 2
#Creating variables with ranking week of ranking systems
date1 <- "20201001"
date2 <- "20210314"  

# Creating a new dataset containing rows with the specified pair of dates
ap <- cbb2[cbb2$`Ranking Week` %in% c(date1), ]
ap
ucp <- cbb2[cbb2$`Ranking Week` %in% c(date2), ]
ucp

#Creating variables with the rankings of the teams that were ranked in first and last polls.
before <- c(1,2,3,4,5,6,8,11,14,15,17,19,21,23,25)
after <- c(1,3,18,15,8,12,2,19,21,13,6,9,14,7,4)

#Performing Welch's t-test
t.test(before, after, var.equal = FALSE)

#Paired sample t-test with an alpha = 0.05
ranks <- t.test(before, after, paired = TRUE, conf.level = 0.95)
print(ranks)

#Paired sample t-test with an alpha = 0.1
polls <- t.test(before, after, paired = TRUE, conf.level = 0.90)
print(polls)

#One-sided paired t-test to check if the mean difference is greater than 0
rated <- t.test(after, before, paired = TRUE, alternative = "greater")
rated

#Performing One-sided t-tests
t.test(before, after, alternative = "less")

#Performing Independent Samples T-test
t.test(before, after)

# Creating a dot plot
#Means of each poll
befores <- 11.60
afters <- 10.13

#Creating a data frame for means and group names
means <- c(befores, afters)
groups <- c("Before", "After")
data <- data.frame(means, groups)

# Creating a dot plot
library(ggplot2)
ggplot(data, aes(x = groups, y = means)) +
  geom_point(size = 3, color = "blue") +
  geom_segment(aes(x = groups, xend = groups, y = 0, yend = means), color = "blue") +
  labs(title = "Means for First and Last Polls", x = "Polls", y = "Average Rank")
