dataset=read.csv("dataset/Position_Salaries.csv")
dataset=dataset[2:3]

library(e1071)
regressor = svm(formula=Salary~.,
                data=dataset,
                type='eps-regression')

y_pred=predict(regressor, data.frame(Level=6.5))
y_pred

ggplot() +
  geom_point(aes(x=dataset$Level,
                 y=dataset$Salary),
             colour='red') +
  geom_line(aes(x=dataset$Level,
                y=predict(regressor, newdata=dataset)),
            colour='blue') +
  ggtitle('Truth or Bluff') +
  xlab('Level') +
  ylab('Salary')