#ALY 6010 - Module 6 - R Practice Assignment
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
cars <- read.csv("car_details.csv", header=TRUE)
cars

#Summary statistics of the data set
summary(cars)
View(cars)
dim(cars)
head(cars)
tail(cars)
str(cars)
class(cars)
range(cars$year)
fortify(cars)
aes(cars)
set.seed(123)

# Extract unique seller types
unique_seller_types <- unique(cars$seller_type)
# Count the number of unique seller types
total_unique_seller_types <- length(unique_seller_types)
# Output the total number of unique seller types
print(total_unique_seller_types)

# Checking relationships between variables
cor(cars$selling_price, cars$year)

# Creating dummy variables for seller type
sellers <- factor(cars$seller_type, labels = c("Individual", "Dealer", "Trustmark Dealer"))

# Performing regression analysis
model <- lm(selling_price ~ year + sellers, data = cars)

# Summary of the regression model
summary(model)

# Scatterplot with multiple regression lines for each seller type
library(ggplot2)
ggplot(model, aes(x = cars$year, y = cars$selling_price, color = sellers)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(title = "Cars Sold By Seller Type",
       x = "Year", y = "Selling Price")

types <- c(cars$seller_type)
types

# Regression lines for each subset (Individual, Dealer and Trustmark Dealer)
individual_subset <- subset(cars, sellers == "Individual")
dealer_subset <- subset(cars, sellers == "Dealer")
trustmark_dealer_subset <- subset(cars, sellers == "Trustmark Dealer")

individual_model <- lm(selling_price ~ year, data = individual_subset)
dealer_model <- lm(selling_price ~ year, data = dealer_subset)
trustmark_dealer_model <- lm(selling_price ~ year, data = trustmark_dealer_subset)

summary(individual_model)
summary(dealer_model)
summary(trustmark_dealer_model)

# Scatterplot with separate regression line for 'Individual' seller type
library(ggplot2)
ggplot(individual_model, aes(x = year, y = selling_price, color = "Individual")) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(title = "Cars Sold By Seller Type - Individual",
       x = "Year", y = "Selling Price")

# Scatterplot with separate regression line for 'Dealer' seller type
library(ggplot2)
ggplot(dealer_model, aes(x = year, y = selling_price, color = "Dealer")) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(title = "Cars Sold By Seller Type - Dealer",
       x = "Year", y = "Selling Price")

# Scatterplot with separate regression line for 'Trustmark Dealer' seller type
library(ggplot2)
ggplot(trustmark_dealer_model, aes(x = year, y = selling_price, color = "Trustmark Dealer")) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(title = "Cars Sold By Seller Type - Trustmark Dealer",
       x = "Year", y = "Selling Price")
