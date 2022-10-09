dataset=read.csv("C:/Users/Acer/Documents/R/dataset/Mall_Customers.csv")
X<-dataset[,4:5]

dendogram=hclust(dist(X, method='euclidean'), method='ward.D')
plot(dendogram,
     main=paste('Dendogram'),
     xlab='Customers',
     ylab='Distance')

hc=hclust(dist(X, method='euclidean'), method='ward.D')
y_hc=cutree(hc, 5)
y_hc

clusplot(X, y_hc, lines=0, shade=TRUE, color=TRUE,
         labels=2, plotchar=FALSE, span=TRUE,
         main=paste('Clients'),
         xlab='Annual Income',
         ylab='Spending Score')