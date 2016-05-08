
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(
      # 入力 変数名：obs
      sliderInput("obs",
                  "Number of observations:",
                  min = 1,
                  max = 500,
                  value = 100)
    ),
    mainPanel(
      # 出力 変数名：distPlot
      plotOutput("distPlot")
    )
  )
))

