##Importing the data
dataset <- read.csv("D:/RProgramming/Day3/50_Startups.csv")
dataset

#Encode categorical data
dataset$State = factor(dataset$State,
                      levels=c('New York','California','Florida'),
                      labels=c(1,2,3))

dataset
# Splitting the dataset into the Training set and Test set
set.seed(123)
split = sample.split(dataset$Profit,SplitRatio=0.8)
split
training_set = subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
training_set

# Fitting Multi Linear Regression to the Training set

regressor= lm(formula= Profit ~ ., data = training_set)
regressor

regressor= lm(formula= Profit ~ ., data = training_set)
regressor

#Predicting the test set results

y_pred <- predict(regressor,newdata=test_set)
y_pred

# summarize accuracy
mse <- sqrt(sum((test_set$Profit - y_pred)^2))
print(mse)

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x= (test_set$R.D.Spend+test_set$Administration+test_set$Marketing.Spend),y= test_set$Profit), colour='red') +
  geom_line(aes(x=(test_set$R.D.Spend+test_set$Administration+test_set$Marketing.Spend),y=y_pred),colour='blue')+
  ggtitle('Expense Vs Profit (Test set)') +
  xlab('Expense') +
  ylab('Profit')

library(ggplot2)
ggplot() +
  geom_point(aes(x= (test_set$R.D.Spend),y= test_set$Profit), colour='red') +
  geom_line(aes(x=(test_set$R.D.Spend),y=y_pred),colour='blue')+
  ggtitle('Expense Vs Profit (Test set)') +
  xlab('Expense') +
  ylab('Profit')

# Fitting Multi Linear Regression to the Training set
regressor1= lm(formula= Profit ~ R.D.Spend+Administration+Marketing.Spend, data = training_set)
regressor1

#Predicting the test set results

y_pred1 <- predict(regressor1,newdata=test_set)
y_pred1

# summarize accuracy
mse <- sqrt(sum((test_set$Profit - y_pred1)^2))
print(mse)

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x= (test_set$R.D.Spend+test_set$Administration+test_set$Marketing.Spend),y= test_set$Profit), colour='red') +
  geom_line(aes(x=(test_set$R.D.Spend+test_set$Administration+test_set$Marketing.Spend),y=y_pred1),colour='blue')+
  ggtitle('Expense Vs Profit (Test set)') +
  xlab('Expense') +
  ylab('Profit')
