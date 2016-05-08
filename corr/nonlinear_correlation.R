#install.packages("minerva")
library(minerva)
plot(iris[,1],iris[,3])
mine(iris[,1],iris[,3])$MIC
