## Courser Project 2: Question 2 ##

## Name each of the plot files as plot1.png, plot2.png, etc.

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

## Creating Plot 2 ##
plot(Subdata$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (Kilowatts)", xlab="")

## Saving to File ##
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()