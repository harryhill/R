library(ggplot2)
library(dplyr)
# plot data using ggplot2

###########
#
# qplot
#
###########

# qplot is an easy version of func. to plot
iris.plot <- qplot(x= Sepal.Width, y = Sepal.Length,
                   data = iris,
                   color = Species)
iris.plot

# to create plots individually
iris.plot + facet_wrap(~ Species)

# also can change shapes of points by filling argument:shape
qplot(x = Sepal.Width, y = Sepal.Length,
      color = Species,
      size = 2,
      shape = Species,
      data = iris)

# data plot by box plot
qplot(x = Species, y = Sepal.Length,
      data = iris,
      geom = "boxplot")




###########
#
# ggplot
#
###########

# create base plot field + layer parts

ggplot(
  mapping = aes( # base plot field
    x = Sepal.Width, y = Sepal.Length, color = Species),
  data = iris) +
  geom_point() # layer part of "data points". There're "geom_point()", "geom_bar()", "geom_boxplot()" exist.

# plot data and linear regression line
filter(iris, Species == "setosa")  %>% 
  ggplot(
    mapping = aes(
      x = Sepal.Width, y = Sepal.Length),
    data = .) -> iris.plot

iris.plot + geom_point() + geom_smooth(method = lm, se = F)



ggplot(data = iris,
       aes(x= Sepal.Width, y = Sepal.Length, color = Species)) +
  geom_point() + 
  theme_classic() +
  theme_bw(base_size = 12) # change color of field by edit theme






# output pngfile
png(filename="iris_graph.png", width=300, height=300)
ggplot(
  mapping = aes( # base plot field
    x = Sepal.Width, y = Sepal.Length, color = Species),
  data = iris) +
  geom_point() # layer part of "data points". There're "geom_point()", "geom_bar()", "geom_boxplot()" exist.
dev.off()
