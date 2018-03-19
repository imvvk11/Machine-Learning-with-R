df=read.csv2("/home/sunbeam/Bank/bank-full.csv")
df=df[c("age","marital","balance", "housing", "loan","duration","pdays","y")]
head(df)



df$marital=factor(df$marital,levels = c("married","divorced","single"),labels =c(100,200,300))
df$housing=factor(df$housing,levels = c("yes","no"),labels = c(10,11))
df$loan=factor(df$loan,levels = c("yes","no"),labels = c(21,22))
df$y=factor(df$y,levels = c("yes","no"),labels = c(1,0))

library(caTools)
result=sample.split(df$y,SplitRatio = 0.80)
train_s=df[result==TRUE,]
test_s=df[result==FALSE,]
train_s
test_s

library(class)
k_n=knn(train=train_s,test = test_s,cl=train_s$y,k=)
cm=table(test_s$y,k_n)
acuracy=sum(diag(cm))/sum(cm)
acuracy

