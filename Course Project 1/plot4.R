## Courser Project 2: Question 4 ##

## Add the PNG file and R code file to your git repository

## Set Working Directory ##
setwd("/Users/Kheng/Documents/Data Sceince/Exploratory Data Analysis/Course Project 1")

## Getting Dataset ##
fulldata<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## Subsetting the Data ##
Subdata <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)

## Converting Dates ##
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)

## Creating Plot 4 ##
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Subdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (Kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (Volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (Kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (Kilowatts)",xlab="")
})

## Saving to File ##
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()