## Course Project 2: Question 5 ##

## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Setting "ggplot2" Function ##
library("ggplot2", lib.loc="~/Library/R/3.1/library")

## Setting Working Directory ##
setwd("/Users/Kheng/Documents/Data Sceince/Exploratory Data Analysis/Course Project 2")

## Reading Datasets ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subsetting Data: Baltimore City, Maryland == fips ##
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregating Data Sets ##
MD.df <- aggregate(MD.onroad[, 'Emissions'], by = list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

## Generating Graph ##
png('plot5.png')
ggplot(data = MD.df, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
dev.off()