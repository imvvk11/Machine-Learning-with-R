Association rules 


#step1: load the library arules

library(arules)

#read the data
sm = read.transactions("Market_Basket_Optimisation.csv")
summary(sm)

itemFrequencyPlot(sm)

rules = eclat(data = sm, parameter = list(support = 0.03, minlen = 3))

inspect(rules)
