#read 
df=read.csv("/home/sunbeam/Programs/pythonprogram/DATASET/foods.csv")
head(df)
#cleasing
df=df[2:6]
df$Gender=factor(df$Gender,levels = c("Female","Male"),labels = c(10,20))
df$City=factor(df$City,levels = c("New York","Philadelphia","Stamford"),labels = c(100,200,300))
df$Frequency=factor(df$Frequency,levels = c("Daily","Monthly","Never","Often","Once","Seldom","Weekly","Yearly"),labels = c(1,2,3,4,5,6,7,8))
df$Item=factor(df$Item,levels = c("Burger","Burrito","Chalupa","Donut","Ice Cream","Sushi"),labels = c(1000,2000,3000,4000,5000,6000))
head(df)

library(caTools)
result=sample.split(df$Spend,SplitRatio =0.80)
train=df[result==TRUE,]
test=df[result==FALSE,]
train
test

#regresser
lin_reg=lm(formula =Spend~Item+Frequency+City, data = train)
summary(lin_reg)
y.pred=predict(reg,test)
y.pred

library(e1071)
svm_reg=svm(formula = Spend~Item+Frequency+City,data=train,type="eps-regression")
y_pred2=predict(svm_reg, test)
y_pred2

library(rpart)
rpart_reg=rpart(formula = Spend~Item+Frequency+City,data=train,control = rpart.control(minsplit = 10000))
y_pred3=predict(rpart_reg,test)
y_pred3

library(randomForest)
rm_reg=randomForest(formula = Spend~Item+Frequency+City,data=train,ntree=2)
y_pred4=predict(rm_reg,test)
y_pred4
