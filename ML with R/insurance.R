df=read.csv("/home/sunbeam/insurance.csv")
df
library(caTools)
library(e1071)
library(rpart)
# df["age2"]=df$age^2
# df["smoker2"]=df$smoker
head(df)
result=sample.split(df$expenses,SplitRatio = 0.80)

train=df[result==TRUE,]
test=df[result==FALSE,]
train
test
head(df)
#Sigle Linear
lin_reg=lm(formula = expenses~age,data=train)
summary(lin_reg)
y_pred=predict(lin_reg,train)
y_pred
library(ggplot2)
ggplot()+
  geom_point(aes(x=train$age,y=train$expenses),data=train,colour="red")+
  geom_line(aes(x=train$age,y=y_pred),data=train,colour="blue")
#Multi_line
multi_reg=lm(formula = expenses~smoker+age,data=train)
summary(multi_reg)
y_pred2=predict(multi_reg,train)
ggplot()+
  geom_point(aes(x=train$age,y=train$expenses),data=train,colour="red")+
  geom_line(aes(x=train$age,y=y_pred2),data=train,colour="blue")
#svm
svm_reg=svm(formula=expenses~age+smoker,data=train,type="eps-regression")
summary(svm_reg)
y_pred3=predict(svm_reg,train)
ggplot()+
  geom_point(aes(x=head(train$age),y=head(train$expenses)),data=head(train),colour="red")+
  geom_line(aes(x=head(train$age),y=head(y_pred3)),data=head(train),colour="blue")

