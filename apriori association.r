dataset=read.csv("C:/Users/Acer/Documents/R/dataset/Market_Basket_Optimisation.csv", header=FALSE)
library(arules)
dataset=read.transactions("C:/Users/Acer/Documents/R/dataset/Market_Basket_Optimisation.csv", sep=',')
summary(dataset)

itemFrequencyPlot(dataset, topN=20)

rules=apriori(data=dataset, parameter=list(support=0.004, confidence=0.2))

inspect(sort(rules,by='lift')[1:10])