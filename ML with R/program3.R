df = read.csv('creditset.csv')
head(df)

df[c("clientid", "LTI")]
library(caTools)

result = sample.split(df$default10yr, SplitRatio = 0.8)
train_set = df[result == TRUE, ]
test_set = df[result == FALSE, ]

classifier = glm(formula = default10yr ~ ., data = train_set, family = binomial)
predicted_values = predict(classifier, newdata = train_set, type = 'response')

predicted_values = ifelse(predicted_values >= 0.5, 1, 0)
predicted_values

cm = table(train_set$default10yr, predicted_values)
cm

correct_record = sum(diag(cm))
total_record = sum(cm)
accuracy = correct_record/total_record
accuracy


#visualization
library(ggplot2)
ggplot()+ geom_point(aes(x=train_set$loan, y = train_set$default10yr),data=train_set)+
  geom_line(aes(x=train_set$loan, y = predict(classifier, newdata=train_set, type="response"), data= train_set))
