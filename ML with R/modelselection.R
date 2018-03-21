df = read.csv("/home/sunbeam/Social_Network_Ads.csv")
head(df)
#step2: data processing
df = df[3:5]
head(df)
#step3: data cleansing

library(caret)
library(e1071)

folds = createFolds(df$Purchased, k = 20)

accuracies = lapply(folds, function(x){
  
  train_set = df[-x,]
  test_set = df[x,] 
  
  classifier = svm(formula = Purchased ~ ., data = train_set, type = "C-classification")
  
  predictions = predict(classifier, newdata = test_set)
  cm = table(test_set$Purchased, predictions)
  
  accuracy = sum(diag(cm))/sum(cm)
  return (accuracy)
  
})
print(accuracies)
print(mean(as.numeric(accuracies)))
