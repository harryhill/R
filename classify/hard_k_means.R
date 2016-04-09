library(cluster)
library(dplyr)
library(scatterplot3d)
library(ggplot2)



#set iris$Sepal.Length, Sepal.Width, Petal.Length, Petal.Width as training data
#    Sepal.Length Sepal.Width Petal.Length Petal.Width
#1            5.1         3.5          1.4         0.2
#2            4.9         3.0          1.4         0.2
#3            4.7         3.2          1.3         0.2
#4            4.6         3.1          1.5         0.2

x <- iris[1:4]


class <- kmeans(x,3)

cross_table <- table(iris[,5],class$cluster)

cross_table