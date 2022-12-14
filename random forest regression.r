dataset=read.csv("dataset/Position_Salaries.csv")
dataset=dataset[2:3]

library(randomForest)
set.seed(1234)
regressor = randomForest(x=dataset[1],
                         y=dataset$Salary,
                         ntree=100)

y_pred=predict(regressor, data.frame(Level=6.5))
y_pred

x_grid=seq(min(dataset$Level), max(dataset$Level), 0.01)

ggplot() +
  geom_point(aes(x=dataset$Level,
                 y=dataset$Salary),
             colour='red') +
  geom_line(aes(x=x_grid,
                y=predict(regressor, newdata=data.frame(Level = x_grid))),
            colour='blue') +
  ggtitle('Truth or Bluff') +
  xlab('Level') +
  ylab('Salary')