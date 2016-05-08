
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # 受け取った入力変数obs を引数にrnorm で正規分布を生成する
    
    dist <- rgamma(input$obs,1)
    
    
    
    # ここでヒストグラムを描画する
    hist(dist)

  })

})
