url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url,"HouseholdPowerConsumption.zip")

unzip("HouseholdPowerConsumption.zip")

Data <- read.csv("household_power_consumption.txt", sep = ";", 
na.strings = "?")

library(lubridate)

SubData <- subset(Data, 
    dmy(Data$Date) >= ymd("2007-02-01") & 
    dmy(Data$Date) <= ymd("2007-02-02"))

TimeDate <- dmy_hms(paste(SubData$Date, SubData$Time))

png(filename = "plot3.png", width = 480, height = 480)

plot(TimeDate, SubData$Sub_metering_1, type = "n",
     ylab = "Energy sub metering",
     xlab = ""
)
lines(TimeDate, SubData$Sub_metering_1, col = "black")
lines(TimeDate, SubData$Sub_metering_2, col = "red")
lines(TimeDate, SubData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       lty = c(1, 1, 1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()