##Importing the data
dataset <- read.csv("D:/RProgramming/Day3/Position_Salary.csv")
dataset

#dataset <- data.frame("x"=YearsExperience,"y"=Salary,stringsAsFactors = FALSE)

# Splitting the dataset into the Training set and Test set
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio=0.8)
split
training_set = subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
training_set
# Fitting Simple Linear Regression to the Training set

regressor= lm(formula= Salary ~ Level, data = training_set)

#Predicting the test set results

y_pred <- predict(regressor,newdata=test_set)
y_pred

# summarize accuracy
mse <- sqrt((test_set$Salary - y_pred)^2)
print(mse)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$Level, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$Level, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Level vs Price (Training set)') +
  xlab('Level') +
  ylab('Price')


# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x= test_set$YearsExperience,y= test_set$Salary), colour='red') +
  geom_line(aes(x=test_set$YearsExperience,y=y_pred),colour='blue')+
  ggtitle('Size vs Price (Test set)') +
  xlab('Size') +
  ylab('Price')

