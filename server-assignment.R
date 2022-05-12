#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 sorts<-reactive({
  #  output$table1 <- renderTable(input$Sortorder)
     x <- input$Sortorder
     y<-input$IncDec
     n<-input$Numd
     print(x)
    az<-as.data.frame(USArrests)
    az$State<-row.names(az)
    azs<-az
    if (y=="Increasing") {
   # print(azs)
    if ( x=="Murder") {azs<-azs[order(azs$Murder,decreasing=FALSE),]}
     else if ( x=="Rape") { azs<-azs[order(azs$Rape,decreasing=FALSE),]}
     else if( x=="Assault") { azs<-azs[order(azs$Assault,decreasing=FALSE),]}
    }
    if (y=="Decreasing") {
        # print(azs)
        if ( x=="Murder") {azs<-azs[order(azs$Murder,decreasing=TRUE),]}
        else if ( x=="Rape") { azs<-azs[order(azs$Rape,decreasing=TRUE),]}
        else if( x=="Assault") { azs<-azs[order(azs$Assault,decreasing=TRUE),]}
    }
    azs2<-head(azs,n)
    print(azs2)


  #  head(azs)
 #   azs
  #  output$hist<-renderTable(azs)

    })


   output$hist<-renderTable({sorts()})
})


