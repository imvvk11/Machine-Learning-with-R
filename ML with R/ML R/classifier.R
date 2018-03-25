
# step 1:
df = read.csv('/Volumes/Data/Sunbeam/2018/feb/DBDA/dataset/Social_Network_Ads.csv')

# step 2:
df = df[3:5]


#convert for decision tree, random forest, naive bias
df$Purchased = factor(df$Purchased, levels = c(0, 1))

library(caTools)
set.seed(1234)
result = sample.split(df$Purchased, SplitRatio = 0.8)
train_set = df[result == TRUE, ]
test_set = df[result == FALSE, ]


# step 3

# logistic regression
# classifier = glm(formula = Purchased ~ ., data = train_set, family = binomial)
# prediction = predict(classifier, newdata = test_set, type = 'response')
# prediction = ifelse(prediction >= 0.5, 1, 0)

# K-Nearest Neighbours
# library(class)
# prediction = knn(train = train_set[-3], test = test_set[-3], cl = train_set$Purchased, k = 5)

# Support Vector Machine
# library(e1071)
# classifier = svm(formula = Purchased ~ ., data = train_set, type = 'C-classification')
# prediction = predict(classifier, newdata = test_set)

# Kenel Support Vector Machine
# library(e1071)
# classifier = svm(formula = Purchased ~ ., data = train_set, type = 'C-classification', kernel = 'radial')
# prediction = predict(classifier, newdata = test_set)

# decision tree
# library(rpart)
# classifier = rpart(formula = Purchased ~ ., data = train_set, control = rpart.control(minsplit = 100))
# prediction = predict(classifier, newdata = test_set, type = 'class')

# random forest
# library(randomForest)
# classifier = randomForest(formula = Purchased ~ ., data = train_set, ntree = 100)
# prediction = predict(classifier, newdata = test_set)

# naive bayes
# library(e1071)
# classifier = naiveBayes(formula = Purchased ~ ., data = train_set)
# prediction = predict(classifier, newdata = test_set)

# calculate the accuracy
cm = table(test_set$Purchased, prediction)
accuracy = sum(diag(cm)) / sum(cm)















