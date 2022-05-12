#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Sorts"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
         h2("Select Sort Field"),
         radioButtons("Sortorder","Pick 1",c("Murder","Assault","Rape")),
         h2("Select Sort Order"),
         radioButtons("IncDec","Pick 1",c("Increasing","Decreasing")),
         h2("Select Number Display Lines"),
         numericInput("Numd","How many lines to display?",value=50,min=1,max=50,step=1)
        ),
        mainPanel(
            h3("USA ARRESTS PER MILLION BY STATE"),
             #textOutput("text1"),
            tableOutput("hist")

        )
    )
))
