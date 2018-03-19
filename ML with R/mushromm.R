df = read.csv("mushrooms.csv")
df=df[c("type","cap_shape","population","habitat","odor")]
head(df)
#data cleasing
library(caTools)
df$type=factor(df$type,levels = c("edible","poisonous"),labels =c(0,1))
df$cap_shape=factor(df$cap_shape,levels = c("bell","conical","convex","flat","knobbed","sunken"),labels = c(10,11,12,13,14,15))
df$population=factor(df$population,levels = c("abundant","clustered","numerous","scattered","several","solitary"),labels = c(21,22,23,24,25,26))
df$habitat = factor(df$habitat, levels=c("urban","grasses","leaves","meadows","paths","waste","woods"), labels=c(31,32,33,34,35,36,37))
head(df)

result = sample.split(df$type, SplitRatio = 0.80)
train = df[result==TRUE,]
test = df[result==FALSE,]

classifier = glm(formula = type ~ ., data=train,family=binomial)
y_predict = predict(classifier, newdata=train, type="response")
y_predict=ifelse(y_predict>.5,1,0)
cm=table(train$type,y_predict)
corrcted_rec=sum(diag(cm))
total_record=sum(cm)
accuracy=corrcted_rec/total_record
accuracy

mtcars
library(ggplot2)
ggplot(data = mtcars, aes(x = mtcars$cyl, y = mtcars$hp)) +
  geom_point(color="blue")

cov(mtcars$cyl, mtcars$hp)
