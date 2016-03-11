library(cluster)
library(dplyr)
library(scatterplot3d)
library(ggplot2)

#This code supporsed to be used when crassify data into clusters without distinction


#set iris$Sepal.Length, Sepal.Width, Petal.Length, Petal.Width as training data
#    Sepal.Length Sepal.Width Petal.Length Petal.Width
#1            5.1         3.5          1.4         0.2
#2            4.9         3.0          1.4         0.2
#3            4.7         3.2          1.3         0.2
#4            4.6         3.1          1.5         0.2

x <- iris[1:4]

#use Fuzzy c means function named cluster::fanny
cm <- cluster::fanny(x,3)

#check result of FCM from membership
cm$membership
member <- as.data.frame(cm$membership)

member <- member %>%
  mutate(Species = iris$Species)

#visualize result
plot(member[,1],member[,3])


filterm <- member %>%
  filter(V1^2+V2^2+V3 > 0.7) 

#3d plot might be better for more comprehension
scatterplot3d(filterm[,1:3])

