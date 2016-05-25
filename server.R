
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)
source("helpers.R")

shinyServer(function(input, output) {

  weatherData <- readWeatherData('assets/weatherHistory.csv')


  output$varPlot <- renderPlot({
    weatherDataSub <- filter(weatherData, Date >= input$Date[1] & Date <= input$Date[2])

   dataSwitch <- switch(input$var,
                       "Temperature" = weatherDataSub$Temperature,
                       "WindSpeed" = weatherDataSub$WindSpeed,
                       "Dewpoint" = weatherDataSub$Dewpoint,
                       "Pressure" = weatherDataSub$Pressure,
                       "Density" = (weatherDataSub$Pressure * 3386.39) / ((weatherDataSub$Temperature + 459.67) * (5/9) * 287.058))

   plot(x = weatherDataSub$Date, y = dataSwitch, type = 'l',
        xlab = 'Date',
        ylab = input$var,
        main = paste(input$var, 'for Boston', input$Date[1], 'to', input$Date[2])
   )
  })
})

