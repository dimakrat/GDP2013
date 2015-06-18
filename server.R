library(shiny)
library(googleVis)
load("df.RData")

shinyServer(
  
  function(input, output) {
### Map Tab        
    output$chart <- renderGvis(gvisGeoChart(df[input$filter[1]:input$filter[2], ], 
                                            locationvar = "Country", 
                                            colorvar = "usd", 
                                            options = list(width = 900,
                                                           height = 500, 
                                                           region=input$region,
                                                           colorAxis="{colors:['#e7711c', '#4374e0']}",
                                                           showLegend=TRUE              
                                            )))
 
### Data Tab
    output$dfTable = renderDataTable({
      df[input$filter[1]:input$filter[2],]
    })
### Plot Tab    
    output$distPlot <- renderPlot({
      par(las=2)
      barplot(df$usd[input$filter[1]:input$filter[2]],
              names.arg=df$Country[input$filter[1]:input$filter[2]])
    })
    
### Testing Tab
    output$act <- renderText({ paste("Action button has clicked", input$action, "times") })
    output$scheck <- renderText({ paste("Your choise is:", input$checkbox) })
    output$gcheck <- renderText({ paste(input$checkGroup) })
    output$date <- renderText({ paste("Date:",input$date) })
    output$dates <- renderText({ paste("Dates from",input$dates[1],"to",input$dates[2]) })
    output$sl1 <- renderText({ paste("Slider value:",input$slider1) })
    output$sl2 <- renderText({ paste("Slider-2 from",input$slider2[1],"to",input$slider2[2]) })
    output$num <- renderText({ paste("Number :",input$num) })
    output$select <- renderText({ paste("Choice :",input$select) })
    output$radio <- renderText({ paste("Radio :",input$radio) })
    output$text <- renderText({ paste("Text :",input$text) })
### End of Testing Tab  
  }
  
)