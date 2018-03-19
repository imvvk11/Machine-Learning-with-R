df=read.csv2("/home/sunbeam/Bank/bank-full.csv")
df=df[c("age","marital","balance", "housing", "loan","duration","pdays","y")]
head(df)

#data cleasing
library(caTools)
df$marital=factor(df$marital,levels = c("married","divorced","single"),labels =c(100,200,300))
df$housing=factor(df$housing,levels = c("yes","no"),labels = c(10,11))
df$loan=factor(df$loan,levels = c("yes","no"),labels = c(21,22))
df$y=factor(df$y,levels = c("yes","no"),labels = c(1,0))
#df$default=factor(df$default,levels = c("yes","no"),labels = c(31,32))
#df$month=factor(df$y,levels = c("apr","aug","dec","feb","jan","jul","jun","mar","may","nov","oct","sep"),labels = c(201,202,203,204,205,206,207,208,209,210,211,212))
head(df)
#spiliting data
result = sample.split(df$y, SplitRatio = 0.80)
train = df[result==TRUE,]
test = df[result==FALSE,]

classifier = glm(formula = y ~ ., data=train,family=binomial)
y_predict = predict(classifier, newdata=train, type="response")
y_predict=ifelse(y_predict>.5,1,0)
cm=table(train$y,y_predict)
corrcted_rec=sum(diag(cm))
total_record=sum(cm)
accuracy=corrcted_rec/total_record
accuracy

