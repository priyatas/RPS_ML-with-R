data <- read.csv("D:/RProgramming/Day1/data-marketing-budget-12mo.csv")
data
apply(data,1,sum)

apply(data,2,mean)

lapply(data,function(data) data/2) #Output will be list, used on dataframe
sapply(data, function(data) data/2) #Output will be vector, used on dataframe

mapply(sum,1:4,1:4,1:4) #multi variate function in R

install.packages("gdata")
library(gdata)

View(iris)
attach(iris)

tapply(iris$Sepal.Length,Species,mean) #grouped tabular data
x=list(1,2,3,4)
rapply(x,function(x){x^2},class=c("numeric")) #recursive apply
vapply(1:5,sqrt,numeric(length=1)) #used on list

install.packages("dplyr")
library(dplyr)

#select query
selectedData <- select(data,Spend,Sales)
head(selectedData,n = 5L)
?head
filter(data, Spend >= 4000)
filter(data, Spend >= 4000, Month >= 2)

#arrange or reorder rows
data %>% arrange(Spend) %>% head

#arrange with 2 columns
arrange(data,Spend,desc(Sales))

#create new columns
data %>% mutate(profit = Sales-Spend)

#create summary

data %>% summarise(avg_spend = mean(Spend))

#binning data

mycolors <- c("red", "purple","blue","blue","orange","red","orange")
install.packages("car")
library(car)
recode(mycolors,"'red'=1;'blue'=2;'purple'=3;'orange'=4")
