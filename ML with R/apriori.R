#Associative algorithm

# step: read the file

#import library arules
library(arules)
sm = read.transactions("Market_Basket_Optimisation.csv", sep = ',', rm.duplicates = TRUE)
summary(sm)

itemFrequencyPlot(sm)

# install.packages('arules')
rules = apriori(data = sm, parameter = list(support = 0.003, confidence = 0.2))
sorted_rules = sort(rules, by = 'confidence')
inspect(sorted_rules[1:10])
