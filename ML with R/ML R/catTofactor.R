library(dplyr)
df = read.csv("/home/sunbeam/Programs/pythonprogram/DATASET/jamesbond.csv")
head(df)

df$Bond.Actor.Salary = ifelse(is.na(df$Bond.Actor.Salary), mean(df$Bond.Actor.Salary, na.rm=TRUE), df$Bond.Actor.Salary)
head(df)

unique(df$Director)
length(unique(df$Actor))


head(df)
levels(df$Director)
df$Actor = factor(df$Actor, levels = c(levels(df$Actor)), labels= seq(1,length(unique(df$Actor))))
df$Director = factor(df$Director, levels = c(levels(df$Director)), labels= seq(20,length(unique(df$Director))+19))
le
#df$Actor = lapply(df$Actor, function(x) as.numeric(seq(1,length(unique(df$Actor)))))
head(df)
df$Actor
head(df)
