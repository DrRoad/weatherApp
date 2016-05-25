
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Boston Weather Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      dateRangeInput("Date", label = h3("Date range"), start = '2015-01-01', end = '2015-12-31'),
      selectInput("var",
                  label = "Choose a variable to display",
                  choices = list("Temperature", "Dewpoint",
                                 "WindSpeed", "Pressure",
                                 "Density"),
                  selected = "Temperature")
      ),

    mainPanel(
      plotOutput("varPlot")
    )
  )
))
