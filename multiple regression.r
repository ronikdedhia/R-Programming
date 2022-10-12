dataset=read.csv("dataset/50_Startups.csv")

dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1,2,3))

library('caTools')
set.seed(123)
split=sample.split(dataset$Profit, 0.8)
training_set=subset(dataset, split==TRUE)
test_set=subset(dataset, split==FALSE)

regressor=lm(formula=Profit ~ .,
             data=training_set)
summary(regressor)

y_pred=predict(regressor, newdata=test_set)
y_pred