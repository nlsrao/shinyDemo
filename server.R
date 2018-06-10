#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)
library(datasets)
shinyServer(function(input,output){
  output$details <- renderPrint({
    dataset <- get(input$datasetName, "package:datasets", inherits = FALSE)
    str(dataset)
  })
  output$summary <- renderPrint({
    dataset <- get(input$datasetName, "package:datasets", inherits = FALSE)
    summary(dataset)
  })
  output$plot <- renderPlot({
    dataset <- get(input$datasetName, "package:datasets", inherits = FALSE)
    plot(dataset)
  })
  output$table <- renderTable({
    dataset <- get(input$datasetName, "package:datasets", inherits = FALSE)
    dataset
  })
})