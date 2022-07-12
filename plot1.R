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
png(file = "plot1.png")
hist(data$Global_active_power, col = "#FF3300", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()