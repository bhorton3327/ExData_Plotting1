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

png(file = "plot3.png")
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "#FF6600")
lines(data$DateTime, data$Sub_metering_3, col = "#0000FF")
legend("topright", lty = "solid", col = c("black", "#FF6600", "#0000FF"), border = "black", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()