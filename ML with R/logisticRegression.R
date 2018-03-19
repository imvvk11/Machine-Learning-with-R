#classifiers using logistic regression
#step1: read the data
df = read.csv("/home/sunbeam/Social_Network_Ads.csv")
head(df)
#step2: data processing
df = df[3:5]
head(df)
#step3: data cleansing


#step4: split the data in training and testing
library(caTools)
set.seed(1234)
result = sample.split(df$Purchased, SplitRatio = 0.80)
train_set = df[result==TRUE,]
test_set = df[result == FALSE,]

#step3: classifier

classifier = glm(formula = Purchased ~ .,data= train_set, family = binomial)
y_predict = predict(classifier, newdata = test_set, type ="response")
y_predict

#y_predict = ifelse(y_predict >= 0.5, 1, 0)
cm = table(test_set$Purchased, y_predict>0.5)
cm
accuracy = sum(diag(cm))/sum(cm)
accuracy
ggplot(train_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", se=FALSE)
