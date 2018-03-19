#classifier as kernel Support Vector Machine
df = read.csv("/home/sunbeam/Social_Network_Ads.csv")
head(df)
#step2: data processing
df = df[3:5]
head(df)
#step3: data cleansing

df$Purchased = factor(df$Purchased, levels=c(0,1))
#step4: split the data in training and testing
library(caTools)

result = sample.split(df$Purchased, SplitRatio = 0.80)
train_set = df[result==TRUE,]
test_set = df[result == FALSE,]

library(e1071)

classifier = svm(formula = Purchased~., data= train_set, type = "C-classification", kernel ="linear")

prediction = predict(classifier, newdata= test_set)
cm = table(test_set$Purchased, prediction)
cm

accuracy = sum(diag(cm)) / sum(cm)
accuracy


