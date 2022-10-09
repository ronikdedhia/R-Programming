dataset=read.csv("C:/Users/Acer/Documents/R/dataset/Mall_Customers.csv")
X<-dataset[,4:5]

set.seed(29)
kmeans<-kmeans(X,5,iter.max=300, nstart=10)

library(cluster)
clusplot(X, kmeans$cluster, lines=0, shade=TRUE, color=TRUE,
         labels=2, plotchar=FALSE, span=TRUE,
         main=paste('Clients'),
         xlab='Annual Income',
         ylab='Spending Score')