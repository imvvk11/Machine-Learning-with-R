df =read.csv("/home/sunbeam/fortune1000.csv")
head(df, 10)
library(ggplot2)
library(dplyr)
df = df[c("Profits", "Revenue", "Employees")]
utils::View(df)
head(df)
ggplot(data=df, aes(x= df$Profits,y = df$Revenue))+ 
  geom_point(color="green")

# df = df %>% mutate(revsq = df$Revenue^2)
# head(df)

library(caTools)
result = sample.split(df$Revenue, SplitRatio = 0.80)
train = df[result == TRUE,]
test = df[result == FALSE,]

regressor = lm(formula = Revenue ~ ., data = train)


summary(regressor)

                                
library(e1071)                        
svm_regressor = svm(formula = Revenue~ Profits, data = train, type = "eps-regression")
y_predict =  predict(svm_regressor, newdata = train)
y_predict

#Decision Tree
library(rpart)
dt=rpart(formula = Revenue~ Profits, data = train)
predict_dt = predict(dt, newdata= test)
predict_dt
