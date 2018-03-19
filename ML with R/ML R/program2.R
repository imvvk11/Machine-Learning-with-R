# step 1:
df = read.csv('Social_Network_Ads.csv')

# step 2:
df = df[3:5]

df$Purchased = factor(df$Purchased, levels = c(0, 1))

library(caTools)
result = sample.split(df$Purchased, SplitRatio = 0.8)
train_set = df[result == TRUE, ]
test_set = df[result == FALSE, ]


# step 3:
library(e1071)
classifier = naiveBayes(formula = Purchased ~ ., data = train_set)
prediction = predict(classifier, newdata = test_set)

cm = table(test_set$Purchased, prediction)

accuracy = sum(diag(cm)) / sum(cm)
