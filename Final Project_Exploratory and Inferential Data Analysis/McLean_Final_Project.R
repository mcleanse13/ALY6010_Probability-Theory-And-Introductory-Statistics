#ALY 6010 - Final Project: Milestone 1
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

#Summary Statistics of the dataset
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

# Creating a frequency table
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

# Finding the list of all the schools in the 'School' column
unique_categories1 <- unique(cbb1$School)
print(unique_categories1)

# The number of different ranking systems used
num_unique_categories1 <- length(unique_categories1)
print(paste("Number of unique categories:", num_unique_categories1))

#How many complete observations in the data set
dim(cbb1)
complete.cases(cbb1)
sum(complete.cases(cbb1))

#With so many rankings systems, focusing just on one for the season
element_to_keep <- " Associated Press    "
cbb2 <- cbb1[cbb1$`Ranking System` == element_to_keep, ]
print(cbb2)

element_to_keeps <- " USA Today Coaches   "
cbb5 <- cbb1[cbb1$`Ranking System` == element_to_keeps, ]
print(cbb5)

#Descriptive statistics of the new variable with just one ranking system
head(cbb2)
tail(cbb2)
summary(cbb2)

#Table function to tally items in the "Category" column
tally_rankings <- table(cbb2$School)
print(tally_rankings)

cbb3 <- tally_rankings
cbb3
range(tally_rankings)
summary(tally_rankings)
mean(tally_rankings)
median(tally_rankings)
mode(tally_rankings)

# Creating a bar chart
barplot(table(cbb3), main = "Total Rankings Per School", xlab = "Schools", ylab = "Weeks Ranked", col = "skyblue")

#Creating a box plot
quantile(cbb3)
boxplot(cbb3, main = "Boxplot of the Total Rankings Per School", ylab = "Weeks Ranked", col = "red")

# Creating a histogram
hist(cbb3, col = "lightblue", main = "Total Rankings Per School", xlab = "Schools", ylab = "Weeks Ranked")

#Combined two ranking systems data sets into one data set
rankings <- list(cbb2 = cbb2, cbb5 = cbb5)
rankings
View(rankings)

#Milestone 2
#Creating variables with ranking week of the ranking systems
date1 <- "20201001"
date2 <- "20210314"  

# Creating a new data set containing rows with the specified pair of dates
ap <- cbb2[cbb2$`Ranking Week` %in% c(date1), ]
ap
ucp <- cbb2[cbb2$`Ranking Week` %in% c(date2), ]
ucp

#Creating variables with the rankings of the teams that were ranked in first and last polls.
before <- c(1,2,3,4,5,6,8,11,14,15,17,19,21,23,25)
after <- c(1,3,18,15,8,12,2,19,21,13,6,9,14,7,4)

#Performing Welch's t-test of the previous variables
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

#Dot Plot Creation
#Means of each poll
befores <- 11.60
afters <- 10.13

#Creating a data frame for 'means' and 'group' names
means <- c(befores, afters)
groups <- c("Before", "After")
data <- data.frame(means, groups)

# Creating the dot plot
library(ggplot2)
ggplot(data, aes(x = groups, y = means)) +
  geom_point(size = 3, color = "blue") +
  geom_segment(aes(x = groups, xend = groups, y = 0, yend = means), color = "blue") +
  labs(title = "Means for First and Last Polls", x = "Polls", y = "Average Rank")

#Final Project
#Question 1
#Creating variables with the ranking week of the two ranking systems
date3 <- "20201001"
date4 <- "20210314"  

# Creating a new data set containing rows with the specified pair of dates
ap1 <- cbb5[cbb5$`Ranking Week` %in% c(date3), ]
ap1
ucp1 <- cbb5[cbb5$`Ranking Week` %in% c(date4), ]
ucp1

# Creating a new variable by stacking one variable on top of the other
polls1 <- rbind(ap, ucp)
polls1
View(polls1)

polls2 <- rbind(ap1, ucp1)
polls2
View(polls2)

polls <- rbind(polls1, polls2)
polls
View(polls)
str(polls)
head(polls)

# Checking the relationships between variables by calculating the correlation coefficient
cor(polls$Rank, polls$`School ID#`)
cor(polls$Rank, polls$`Ranking Week`)
cor(polls$`Ranking Week`, polls$`School ID#`)

# Creating dummy variables for the two ranking systems
ranking_system <- factor(polls$`Ranking System`, labels = c("Associated Press", "USA Today Coaches"))

# Performing regression analysis
model <- lm(polls$Rank ~ polls$`School ID#` + ranking_system, data = polls) 

# Summary of the regression model
summary(model)

#Creating a scatterplot of the dummy, dependent, and independent variables based off the question
library(ggplot2)
ggplot(model, aes(x = polls$`School ID#`, y = polls$Rank, color = ranking_system)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(title = "Top 25 Hoops Rankings For One Week By Ranking Systems",
       x = "School ID#", y = "Ranking")

#Question 2
#Creating a new variable that contains the categories being researched in the question.
polls3 <- data.frame(polls$`Ranking Week`, polls$`Ranking System`, polls$`School ID#`)
View(polls3)

# Performing regression analysis with the interaction term
model <- lm(polls3$polls..School.ID.. ~ polls3$polls..Ranking.Week. * polls3$polls..Ranking.System., data = polls3)

# Summary of the regression results
summary(model)

#Creating individual scatterplots for each ranking system to see the difference in polls for the first and last weeks.
#Scatterplot for the Associated Press rankings
library(ggplot2)
ggplot(polls1, aes(x = polls1$`Ranking Week`, y = polls1$`School ID#`, color = polls1$`Ranking System`)) +
  geom_point(size = 1, color = "blue") +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(title = "Top 25 Schools in First and Last Polls From Associated Press",
       x = "Week", y = "School ID#")

#Scatterplot for the USA Today Coaches rankings
library(ggplot2)
ggplot(polls2, aes(x = polls2$`Ranking Week`, y = polls2$`School ID#`, color = polls2$`Ranking System`)) +
  geom_point(size = 1, color = "orange") +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(title = "Top 25 Schools in First and Last Polls By USA Today Coaches",
       x = "Week", y = "School ID#")
