library(cluster)
library(dplyr)
library(scatterplot3d)
library(ggplot2)

x <- iris[1:4]
cm <- fanny(x,3)
cm$membership
member <- cm$membership
plot(member[,1],member[,3])
filterm <- member %>% filter(member > 0.6) 
scatterplot3d(member)
scatterplot3d
