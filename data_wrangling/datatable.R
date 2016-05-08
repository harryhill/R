library(data.table)
library(dplyr)

df <- data.frame(iris)
df[, list(Species, Sepal.Width)] # select columns

df1 <- df %>% mutate(key = row_number())

dt <- data.table(df1)
setkey(dt, key)

dt.summ <- dt[, list(S.L = mean(Sepal.Length),
                      S.W = mean(Sepal.Width),
                      P.L = mean(Petal.Length),
                      P.W = mean(Petal.Width)
                      ), by = Species]


dt.summ1 <- dt[, list(S.L = Sepal.Length,
                     S.W = Sepal.Width
                     ), by = list(key,Species)]

dt.summ2 <- dt[, list(P.L = Petal.Length,
                     P.W = Petal.Width
                     ), by = list(key,Species)]


setkey(dt.summ1, key)
setkey(dt.summ2, key)
origin.dt <- merge(dt.summ1, dt.summ2)

origin.dt <- origin.dt %>%
  dplyr::select(Species.x, S.L, S.W, P.L, P.W)


