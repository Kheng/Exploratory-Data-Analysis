## Course Project 2: Question 2 ##

## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Setting Working Directory ##
setwd("/Users/Kheng/Documents/Data Sceince/Exploratory Data Analysis/Course Project 2")

## Reading Datasets ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Sampling Data For Testing ##
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

##  Subseting Data and Appends to Data Frame ## 
MD <- subset(NEI, fips == '24510')

# Generating Graph ##
png(filename = 'plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()