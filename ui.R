
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
                  selected = "Temperature"),
    p("Please use the above to select the date rate you would like to look at.
      Use the selector below to choose which quantity to view."),
    p("Allowed span only 2015."),
    p("The possible selections for data type are Temperature, Dewpoint, Wind Speed, Pressure, and Density. All but Density are from weather.gov, the density is calculated from the other quantities.")
    ),

    mainPanel(
      plotOutput("varPlot")
    )
  )
))
