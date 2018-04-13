# Apriori

# Data Preprocessing
 install.packages('arules')
library(arules)
dataset = read.csv('D:/RProgramming/Day5/Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('D:/RProgramming/Day5/Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 100)

# Training Apriori on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

# Visualising the results
inspect(sort(rules, by = 'lift')[1:100])
