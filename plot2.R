## load packages
library(graphics)
library(tidyverse)
library(chron)
library(lubridate)

## loading the data

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

data = data %>% 
  mutate(
    Date = as.Date(Date, format = "%d/%m/%Y")
  ) %>% 
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")

## plot 

data = 
  data %>% 
  mutate(
    Time = times(Time)
  )

data$DateTime = with(data, ymd(Date) + hms(Time))

png(file = "plot2.png")
plot(data$DateTime, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()