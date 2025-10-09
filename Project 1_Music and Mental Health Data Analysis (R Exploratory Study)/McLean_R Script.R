#Week 1 R Script.R

#Installing multiple packages
myPackages <- c("Hmisc", "tidyr", "dplyr", "summarytools", "psych", "forcats", "devtools")
install.packages(myPackages)
#Generating New Variables
#Installing dplyr to get access to mutate()
library(dplyr)

#Importing the dataset
mxmh <- read.csv("mxmh_survey_results.csv", header=TRUE)
str(mxmh)
class(mxmh)
names(mxmh)

#Installing packages in R
install.packages("vcd")
#Importing VCD library
library(vcd)

#Creating a dataframe
mxmh <- data.frame(mxmh)
mxmh

#Specifying some elements in the data frame
mxmh[1:27]
mxmh[c("Age", "Primary.streaming.service", "Hours.per.day")]
mxmh$While.working
summary(mxmh)

#Condensing the variables in the data set to just five genres of music
#Removing the Permissions variable from data set because each row is the same.
mxmh <- mxmh %>% select(-c(Permissions, Timestamp, Instrumentalist, Composer, Foreign.languages, BPM))
mxmh
names(mxmh)

#To reduce the data set to make it easier to plot, the dataset was condensed to just people surveyed that listen to Spotify and listen longer than 3 hours to music at work.
mxmh <- mxmh[mxmh$Primary.streaming.service == 'Spotify', ]
mxmh
summary(mxmh)

mxmh <- mxmh[mxmh$Hours.per.day >= 3, ]
mxmh
summary(mxmh)
data.frame(mxmh)
head(mxmh)
tail(mxmh)

#Cross tabulations to look at the relationships between the variables in the data set.
cross_table <- table(mxmh$Hours.per.day, mxmh$Music.effects)
print(cross_table)

cross_table1 <- table(mxmh$While.working, mxmh$Music.effects)
print(cross_table1)

cross_table2 <- table(mxmh$Frequency..Rock., mxmh$Music.effects)
print(cross_table2)

cross_table3 <- table(mxmh$Frequency..Pop., mxmh$Music.effects)
print(cross_table3)

cross_table4 <- table(mxmh$Frequency..Country., mxmh$Music.effects)
print(cross_table4)

cross_table5 <- table(mxmh$Age, mxmh$Music.effects)
print(cross_table5)

#Frequency tables of some of the variables in the dataset
mxmh_frequency <- table(mxmh$Frequency..Pop.)
print(mxmh_frequency)

mxmh_frequency1 <- table(mxmh$Depression)
print(mxmh_frequency1)

mxmh_frequency2 <- table(mxmh$Music.effects)
print(mxmh_frequency2)

mxmh_frequency3 <- table(mxmh$Age)
print(mxmh_frequency3)

#The range of the ages among the people being surveyed.
range(mxmh_frequency3)

#Histograms of some of the variables in the dataset.
hist(mxmh$Depression, col = "lightblue", main = "Histogram of People Surveyed with Depression", xlab = "Reported Depression Scale", ylab = "People Surveyed")
hist(mxmh$Hours.per.day, col = "lightgreen", main = "Histogram of Hours Per Day Music Was Listened To", xlab = "Hours Per Day", ylab = "Listeners")

#Bar plot created to show the frequency of listens for five selected genres of music.
selected_data <- mxmh[, c("Frequency..Pop.", "Frequency..Rock.", "Frequency..Country.", "Frequency..Hip.hop.", "Frequency..R.B.")]
selected_data

freq_table <- lapply(selected_data, table)
freq_table

par(mfrow = c(2, 3))
for (i in seq_along(freq_table)) {
  barplot(freq_table[[i]], main = names(freq_table)[i], xlab = "Categories", ylab = "Frequency", col = "lightblue")
}

# Example using data with non-numerical variables from variable 'Frequency..Country."
categories <- c("Never", "Rarely", "Sometimes", "Very frequently")
values <- c(120, 81, 43, 22)  # Assign numerical values to the categories

# Created a line plot from the created data table
plot(values, type = "o", pch = 19, col = "blue", xlab = "Frequency", ylab = "Listens", 
     main = "Frequency of Country Music Listens Per Person", axes = FALSE)
axis(1, at = 1:4, labels = categories)
axis(2)
box()  
