dataset=read.csv("dataset/Salary_Data.csv")

library(caTools)
set.seed(1234)
split=sample.split(dataset$Salary, 2/3)

training_set=subset(dataset, split==TRUE)
test_set=subset(dataset, split==FALSE)

regressor=lm(formula=Salary~YearsExperience,
             data=training_set)
summary(regressor)

y_pred=predict(regressor, newdata=test_set)
y_pred

library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,
                 y=training_set$Salary),
             colour='red')+
  geom_line(aes(x=training_set$YearsExperience,
                y=predict(regressor, newdata=training_set)),
            colour='blue')+
  ggtitle('Salary vs Experience')+
  xlab('Years of Experience')+
  ylab('Salary')