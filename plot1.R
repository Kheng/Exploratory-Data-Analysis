## Courser Project 2: Question 1 ##

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

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

## Creating Plot 1 ##
hist(Subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

## Saving to File ##
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()