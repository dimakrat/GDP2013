shinyUI(fluidPage(  
  headerPanel(h1("Gross Domestic Product 2013 in billions USD",align = "center")),
  
  sidebarLayout(
      sidebarPanel(
        
        radioButtons("region", label = "Choose region",
                     c("Whole World" = "world",
                       "North America" = "021",
                       "South America" = "005",
                       "Western Europe" = "150",
                       "Eastern Europe" = "151",
                       "Africa" = "002",
                       "Asia" = "142",
                       "Pacific Region" = "035",
                       "Australia and New Zealand" = "009"
                     )),
        
        sliderInput('filter', label= 'GDP Rank',value = c(1, nrow(df)),
                    min = 1, max = nrow(df), step = 1, ticks=FALSE)
        
      ),
      mainPanel(
        tabsetPanel(
### Map Tab          
          tabPanel("Map",
                   htmlOutput("chart")), 
### Plot Tab
          tabPanel("Plot",
                   plotOutput("distPlot")),

### Data Tab          
          tabPanel("Data",
                   dataTableOutput('dfTable')),

### Help Tab          
          tabPanel("Help",
                   
                   h3("GDP Review"),
                   p("This app made by Dmitry Ermakov as part of",
                    em("'Course Project: Shiny Application and Reproducible Pitch'"), 
                      "It helps to review the Gross Domestic Product 2013 by countries. 
                     The data donwloaded from", a("THE WORLD BANK", href = "http://data.worldbank.org/indicator/NY.GDP.MKTP.CD"),
                     "and prepared in ", strong("CLEANING.R"), "module."),
                   h4("MAP"),
                   p("The tab MAP shows GDP on geografical map. Selecet the region on side panel ", strong("Choose region"),
                     " and choose rank of countries on ", strong("GDP Rank."), 
                     "Move the mouse coursor to the country on the map and you will see the name and GDP in billions US dollars"
                     ),
                   h4("PLOT"),
                   p("The tab PLOT shows plot of GDP by countries.", "Choose rank of countries on ", strong("GDP Rank"),
                     " on the side panel."), 
                   h4("DATA"),
                   p("The tab DATA shows GDP data table. Choose rank of countries on ", strong("GDP Rank"),
                     " on the side panel and you will see result in the table. You can use 'search:' and switch pages in the table"
                     ),
                   h4("HELP"),
                   p("The tab HELP shows this text."),
                   h4("<<<<Testing>>>>"),
                   p("The tab <<<<Testing>>>> for testing :) .")
                   
                   ), # End Help Tab

### Testing tab #############
          tabPanel("<<<<Testing>>>>",
                   titlePanel("Basic widgets"),
                   
                   fluidRow(
                     
                     column(3,
                            h3("Buttons"),
                            actionButton("action", label = "Action")
                            #            br(),
                            #            br(), 
                            #            submitButton("Submit")
                     ),
                     
                     column(3,
                            h3("Single checkbox"),
                            checkboxInput("checkbox", label = "Choice A", value = TRUE)),
                     
                     column(3, 
                            checkboxGroupInput("checkGroup", 
                                               label = h3("Checkbox group"), 
                                               choices = list("Choice 1" = 1, 
                                                              "Choice 2" = 2, "Choice 3" = 3),
                                               selected = c(1,2,3) )),
                     
                     column(3, 
                            dateInput("date", 
                                      label = h3("Date input"), 
                                      value = "2014-01-01"))   
                   ),
                   
                   fluidRow(
                     
                     column(3,
                            dateRangeInput("dates", label = h3("Date range"))),
                     
                     
                     column(3, 
                            h3("Help text"),
                            helpText("Note: help text isn't a true widget,", 
                                     "but it provides an easy way to add text to",
                                     "accompany other widgets.")),
                     column(3, 
                            sliderInput("slider1", label = h3("Sliders"),
                                        min = 0, max = 100, value = 50),
                            sliderInput("slider2", "",
                                        min = 0, max = 100, value = c(25, 75))),
                     
                     column(3, 
                            numericInput("num", 
                                         label = h3("Numeric input"), 
                                         value = 1))   
                   ),
                   
                   fluidRow(
                     
                     column(3,
                            radioButtons("radio", label = h3("Radio buttons"),
                                         choices = list("Choice 1" = 1, "Choice 2" = 2,
                                                        "Choice 3" = 3), selected = 1 )),
                     
                     column(3,
                            selectInput("select", label = h3("Select box"), 
                                        choices = list("Choice 1" = 1, "Choice 2" = 2,
                                                       "Choice 3" = 3), selected = 1)),
                     
                     
                     column(3, 
                            textInput("text", label = h3("Text input"), 
                                      value = "Enter text..."))   
                   ),
                   mainPanel(
                     hr(),
                     
                     h3("Results"),
                     textOutput("act"),
                     textOutput("scheck"),
                     "Group choice :", 
                     strong(textOutput("gcheck")),
                     textOutput("date"),
                     textOutput("dates"),
                     textOutput("sl1"),
                     textOutput("sl2"),
                     textOutput("num"),
                     textOutput("radio"),
                     textOutput("select"),
                     textOutput("text")
                     
                   )  
          )
          
          ) #end of tabsetPanel
      ) #end of mainPanel
  ) 
))