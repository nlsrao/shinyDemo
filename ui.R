#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)
library(datasets)
shinyUI(
  dashboardPage(
    dashboardHeader(title = "R Datasets"),
    dashboardSidebar(
        selectInput("datasetName", "Select Dataset", 
                    choices = ls("package:datasets"), selected = "mtcars", multiple = FALSE, selectize = TRUE, width = "100%"
                    ),
                    
          sidebarMenu(
            menuItem("Dataset Details", tabName = "ddetails"),
            menuItem("About", tabName = "about")
    )),
    dashboardBody(
      tabItems(
        tabItem(tabName = "ddetails",
            fluidRow(
                  column(width = 12,
                         h3("Details of dataset ")),
                  tabBox(width = "98%",
                         tabPanel(title = "Structure", verbatimTextOutput("details")),
                         tabPanel(title = "Summary", verbatimTextOutput("summary")),
                         tabPanel(title = "Plots", plotOutput("plot")),
                         tabPanel(title = "Table", tableOutput("table"))
                  ))),
        tabItem(tabName = "about",
                h2("Documentation"),
                h4("This is a simple shiny application to demo the reactive response from server with a input from UI.
                   This application is to display the details of datasets in R. This shows the structure, summary, plot and the table values of the dataset."),
                h4("Just select a dataset from the dropdown menu, the corresponding details of the dataset will be displayed on the main page.
                   structure, summary, plot and table values are made available in different tabs. Shiny Dashboard package has been used for better look and feel.")
            )
      )
        
    )
  )   
)
