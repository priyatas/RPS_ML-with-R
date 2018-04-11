# Importing the dataset
size <- c(7,8,10,12,14)
price <- c(5,6,7,8,10)

dataset=data.frame("x"= size, "y"=price,stringsAsFactors = FALSE)
dataset


# Splitting the dataset into the Training set and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$y,SplitRatio=0.8)
split
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
training_set
test_set

# Fitting Simple Linear Regression to the Training set
regressor =lm(formula=y~x, data = training_set)

#Predicting the test set results
y_pred = predict(regressor,newdata=test_set)
y_pred

# summarize accuracy
mse <- sqrt((test_set$y - y_pred)^2)
print(mse)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$x, y = training_set$y),
             colour = 'red') +
  geom_line(aes(x = training_set$x, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Size vs Price (Training set)') +
  xlab('Size') +
  ylab('Price')

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$x, y = test_set$y),
             colour = 'red') +
  geom_line(aes(x = training_set$x, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Size vs Price (Test set)') +
  xlab('Size') +
  ylab('Price')
