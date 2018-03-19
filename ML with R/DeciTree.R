#classifier as a Decision Tree
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

library(rpart)

classifier = rpart(formula = Purchased ~ ., data=train_set)

prediction = predict(classifier, newdata= test_set, type="class")

cm = table(test_set$Purchased, prediction)
cm

accuracy = sum(diag(cm))/sum(cm)
accuracy
