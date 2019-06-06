#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(ggplot2)
library(splines)

shinyServer(function(input,output){
    dataset <- reactive({
        diamonds[sample(nrow(diamonds), input$sampleSize),]
    })
    
    output$diamondPlot <- renderPlot({
        myTitle <- "Relationship of Diamond Price Vs its Weight"
        qplot(carat, price, data=dataset(), geom = c("point", "smooth"),method = "lm") + labs(title = myTitle)
    })
    
})
