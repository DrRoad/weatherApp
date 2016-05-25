#helpers.R
library(dplyr)

readWeatherData <- function(x) {
  weatherData <- read.csv(x, stringsAsFactors = FALSE) %>%
    mutate(Date = as.Date(EST),
           Temperature = Mean.TemperatureF,
           Dewpoint = MeanDew.PointF,
           WindSpeed = Mean.Wind.SpeedMPH,
           Pressure = Mean.Sea.Level.PressureIn) %>%
    select(Date, Temperature, Dewpoint, WindSpeed, Pressure)
  return(weatherData)
}