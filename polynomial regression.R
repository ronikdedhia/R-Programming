dataset=read.csv("dataset/Position_Salaries.csv")
dataset=dataset[2:3]

lin_Reg = lm(formula = Salary ~ .,
             data=dataset)
summary(lin_Reg)

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

reg = lm(formula=Salary~.,
         data=dataset)
summary(reg)

install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x=dataset$Level,
                 y=dataset$Salary),
             colour='red') +
  geom_line(aes(x=dataset$Level,
                  y=predict(reg, newdata=dataset)),
            colour='blue') +
  ggtitle('Truth or Bluff') +
  xlab('Level') +
  ylab('Salary')