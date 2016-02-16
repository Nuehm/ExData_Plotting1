url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url,"HouseholdPowerConsumption.zip")

unzip("HouseholdPowerConsumption.zip")

Data <- read.csv("household_power_consumption.txt", sep = ";", 
na.strings = "?")

library(lubridate)

SubData <- subset(Data, 
    dmy(Data$Date) >= ymd("2007-02-01") & 
    dmy(Data$Date) <= ymd("2007-02-02"))

png(filename = "plot2.png", width = 480, height = 480)

TimeDate <- dmy_hms(paste(SubData$Date, SubData$Time))

plot(TimeDate, SubData$Global_active_power, type = "l",
    ylab = "Global Active Power (kilowatts)",
    xlab = "")
    
dev.off()