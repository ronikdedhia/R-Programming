dataset=read.csv("C:/Users/Acer/Documents/R/dataset/Social_Network_Ads.csv")
dataset=dataset[,3:5]

library(caTools)
set.seed(1234)
split=sample.split(dataset$Purchased, 0.75)

training_set=subset(dataset, split==TRUE)
test_set=subset(dataset, split==FALSE)

training_set[,1:2]=scale(training_set[,1:2])
test_set[,1:2]=scale(test_set[,1:2])

library(class)
y_pred = knn(train=training_set[,-3],
             test=test_set[,-3],
             cl=training_set[,3],
             k=5)
y_pred

cm=table(test_set[,3], y_pred)
cm