##Step1: Importing Data

data<- read.csv("D:/RProgramming/Day3/Data.csv")
View(data)
library(car)
data$Country<-recode(data$Country,"'France'=1;'Spain'=2;'Germany'=3")
data
data$Purchased<-recode(data$Purchased,"'Yes'=1;'No'=0")
data

##using factor

data$Country = factor(data$Country,
                      levels=c('France','Spain','Germany'),
                      labels=c(1,2,3))
data$Purchased = factor(data$Purchased,
                        levels=c('Yes','No'),
                        labels=c(1,0))

##Step 2 : Clean data
#Replacing Missing Values
data$Age[is.na(data$Age)]<- round(mean(data$Age,na.rm=TRUE))
data

data$Salary[is.na(data$Salary)] <- round(mean(data$Salary,na.rm=TRUE))
data

#Using Group Average

data$Age = ifelse(is.na(data$Age),
                  ave(data$Age,FUN=function(x) mean(x,na.rm=TRUE)),
                  data$Age)
data$Age

data

##Step3  -Training data and test data

install.packages("caTools")
library(caTools)

split= sample.split(data$Purchased,SplitRatio=0.8)
split
training_set = subset(data,split==TRUE)
test_set= subset(data,split==FALSE)
training_set
test_set

##Step4 - Feature Scaling

# Age vector
age <- c(25, 35, 50)
# Salary vector
salary <- c(200000, 1200000, 2000000)
# Data frame created using age and salary
df <- data.frame( "Age" = age, "Salary" = salary, stringsAsFactors = FALSE)
df
#normalize the data or feature scale
#(X - min(X))/(max(X) - min(X)) -- min max normalization or Z-Score Standardization
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
dfNorm <- as.data.frame(lapply(df, normalize))
dfNorm
# Note df[2]
dfNorm <- as.data.frame(lapply(df[2], normalize))
dfNorm
# Note df["Salary"]
dfNorm <- as.data.frame(lapply(df["Salary"], normalize))
dfNorm
#
#dfNormZ <- as.data.frame( scale(df[1:2] ))
#dfNormZ



