dataset=read.csv("C:/Users/Acer/Documents/R/dataset/Market_Basket_Optimisation.csv", header=FALSE)
library(arules)
dataset=read.transactions("C:/Users/Acer/Documents/R/dataset/Market_Basket_Optimisation.csv", sep=',')
summary(dataset)

itemFrequencyPlot(dataset, topN=20)

rules=eclat(data=dataset, parameter=list(support=0.004, minlen=2))

inspect(sort(rules,by='support')[1:10])