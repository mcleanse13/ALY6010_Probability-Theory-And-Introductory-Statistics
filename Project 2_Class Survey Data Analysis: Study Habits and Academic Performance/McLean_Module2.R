#ALY 6010 - Module 2 - Practice Assignment
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
library(readxl)
student <- "student_survey_data.xlsx"
data <- read_excel(student)

#Summary statistics of the data set
summary(data)
dim(data)
head(data)
tail(data)
str(data)
table(data)
class(data)
range(data$Age)

# Create a simple three-line table
datatable <- data.frame(
  Age = c(30, 23, 18),
  Gender = c(0, 0, 0),
  StudyHours = c(20, 17, 0),
  Major = c("Commerce", "Arts", "Commerce"),
  GPA = c(3.48, 3.05, 3.77)
)
print(datatable)

#Checking to see how many total males and females are in the data set
gender_count_dplyr <- data %>% count(Gender)
print(gender_count_dplyr)

#Total amount of every value in each category of the variable sans GPA
value_counts_age <- table(data$Age)
print(value_counts_age)

value_counts_major <- table(data$Major)
print(value_counts_major)

value_counts_study_hours <- table(data$StudyHours)
print(value_counts_study_hours)

value_counts_gender <- table(data$Gender)
print(value_counts_gender)

#Comparing variables in the data set with their averages
avg_gpa <- aggregate(GPA ~ Age, data = data, FUN = mean)
print(avg_gpa)

avg_gpa1 <- aggregate(GPA ~ Major, data = data, FUN = mean)
print(avg_gpa1)

avg_gpa2 <- aggregate(GPA ~ Gender, data = data, FUN = mean)
print(avg_gpa2)

avg_gpa3 <- aggregate(GPA ~ StudyHours, data = data, FUN = mean)
print(avg_gpa3)

avg_studyhours <- aggregate(StudyHours ~ Gender, data = data, FUN = mean)
print(avg_studyhours)

avg_studyhours1 <- aggregate(StudyHours ~ Age, data = data, FUN = mean)
print(avg_studyhours1)

#Locating the highest and lowest average of Study Hours for any Age
highest_total <- max(avg_studyhours1$StudyHours)
print(highest_total)

lowest_total <- min(avg_studyhours1$StudyHours)
print(lowest_total)

# Creating a scatter plot comparing GPA and Study Hours
plot(avg_gpa3$GPA, avg_gpa3$StudyHours, 
     xlab = "GPA", ylab = "Study Hours",
     main = "Grade Point Average Per Amount of Study Hours",
     col = "red")
# Adding a line of best fit (linear regression line)
abline(lm(StudyHours ~ GPA, data = avg_gpa3), col = "blue")

# Creating a line plot using ggplot2 comparing GPA and Study Hours per Gender
ggplot(data, aes(x = GPA, y = StudyHours, color = Gender)) +
  geom_line() +
  labs(x = "GPA", y = "Study Hours", title = "Study Hours by GPA Segmented by Gender")

# Creating a bar plot using ggplot2 comparing Study Hours and Age
ggplot(avg_studyhours1, aes(x = Age, y = StudyHours)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(x = "Age", y = "Study Hours", title = "Average Study Hours Per Age")

#Creating a variable for each gender from initial data set
male <- data[data$Gender == 0, ]
print(male)           

female <- data[data$Gender == 1, ]
print(female)

# Creating a box plot comparing the gender variables and GPA's
boxplot(male$GPA, female$GPA, 
        names = c("Male", "Female"),
        col = c("green", "yellow"),
        xlab = "Gender", ylab = "GPA",
        main = "Boxplot Comparison of GPA For Both Genders")

# Creating a boxplot comparing the gender variables and Study Hours
boxplot(male$StudyHours, female$StudyHours, 
        names = c("Male", "Female"),
        col = c("purple", "brown"),
        xlab = "Gender", ylab = "Study Hours",
        main = "Boxplot Comparison of Study Hours For Both Genders")

# Creating a jitter plot using ggplot2 and comparing Majors and GPA
ggplot(data, aes(x = Major, y = GPA)) +
  geom_jitter(width = 0.3, height = 0) +
  labs(x = "Major", y = "GPA", title = "Jitter Plot Comparing Average GPA Per Major") +
  theme_minimal()

#Creating separate plots for each column of the data set
par(mfrow = c(1, 1))  # Set layout to 2 rows and 3 columns for 6 plots

for (i in 1:ncol(data)) {
  hist(data[, i], main = colnames(data)[i], xlab = "", col = "yellow", border = "black")
}

# Creating multiple plots based on different columns in the data set
plot1 <- ggplot(data, aes(x = StudyHours, y = GPA)) + geom_point()
plot2 <- ggplot(data, aes(x = Age, y = GPA)) + geom_point()
plot3 <- ggplot(data, aes(x = Gender, y = GPA)) + geom_point()
plot4 <- ggplot(data, aes(x = Major, y = GPA)) + geom_point()


plot1_grob <- ggplotGrob(plot1)
plot2_grob <- ggplotGrob(plot2)
plot3_grob <- ggplotGrob(plot3)
plot4_grob <- ggplotGrob(plot4)

# Arrange the plots in a grid layout
grid.arrange(plot1_grob, plot2_grob, plot3_grob, plot4_grob, ncol = 2)
