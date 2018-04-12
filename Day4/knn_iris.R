View(iris)


# Encoding the target feature as factor
iris_data <- iris
iris_data
iris_data$Species
iris_data$Species = factor(iris_data$Species,
                           levels=c('setosa','versicolor','virginica'),
                           labels = c(0, 1, 2))

# Splitting the dataset into the Training set and Test set
library(caTools)
set.seed(123)
split = sample.split(iris_data$Species, SplitRatio = 0.60)
training_set = subset(iris_data, split == TRUE)
test_set = subset(iris_data, split == FALSE)
training_set
test_set
# Feature Scaling
training_set[-5] = scale(training_set[-5])
test_set[-5] = scale(test_set[-5])

# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -5],
             test = test_set[, -5],
             cl = training_set[, 5],
             k = 3,
             prob = TRUE)


# Making the Confusion Matrix
cm = table(test_set[, 5], y_pred)
cm

# Visualising the Training set results
library(ElemStatLearn)
set = training_set
set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.1)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.1)
X3 = seq(min(set[, 3]) - 1, max(set[, 3]) + 1, by = 0.1)
X4 = seq(min(set[, 4]) - 1, max(set[, 4]) + 1, by = 0.1)
grid_set = expand.grid(X1, X2,X3,X4)
grid_set
colnames(grid_set) = c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width', 'Species')
y_grid = knn(train = training_set[, -5], test = grid_set, cl = training_set[, 5], k = 3)
plot(set[, -5],
     main = 'K-NN (Training set)',
     xlab = 'Species Parameters', ylab = 'Species',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 5] == 1, 'green4', 'red3'))
