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

png(file = "plot4.png")
par(mfrow = c(2, 2), ps = 8)
plot(data$DateTime, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)", cex = 0.5)
lines(data$DateTime, data$Global_active_power)
plot(data$DateTime, data$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(data$DateTime, data$Voltage)
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "#FF6600")
lines(data$DateTime, data$Sub_metering_3, col = "#0000FF")
legend("topright", lty = "solid", col = c("black", "#FF6600", "#0000FF"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5, bty = "n")
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(data$DateTime, data$Global_reactive_power)
dev.off()