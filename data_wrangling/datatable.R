library(data.table)
library(dtplyr)


df <- data.frame(iris)
df1 <- df %>% mutate(key = row_number())

dt <- data.table(df1)
setkey(dt, key)

dt.summary <- dt[, list(S.L = mean(Sepal.Length),
                        S.W = mean(Sepal.Width),
                        P.L = mean(Petal.Length),
                        P.W = mean(Petal.Width)
                        ), by = Species
                 ]


dt.summary1 <- dt[, list(S.L = Sepal.Length,
                         S.W = Sepal.Width
                         ), by = list(key,Species)
                  ]

dt.summary2 <- dt[, list(P.L = Petal.Length,
                         P.W = Petal.Width
                         ), by = list(key,Species)
                  ]


setkey(dt.summary1, key)
setkey(dt.summary2, key)
origin.dt <- merge(dt.summary1, dt.summary2)

origin.dt <- origin.dt %>%
  select(Species.x, S.L, S.W, P.L, P.W)




dt_tmp1 <- origin.dt %>%
  group_by(Species.x) %>%
  summarise(mean(S.L),
            mean(S.W),
            mean(P.L),
            mean(P.W))








dt <- data.table(x=rep(c("a","b","c"),each=3), y=c(1,3,6), v=1:9)



