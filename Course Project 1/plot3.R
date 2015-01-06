## Courser Project 2: Question 3 ##

## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, 
## i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code 
## for reading the data so that the plot can be fully reproduced. You should also include 
## the code that creates the PNG file.

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

## Creating Plot 3 ##
with(Subdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (Kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to File ##
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()