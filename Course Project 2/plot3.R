## Course Project 2: Question 3 ##

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999–2008 
## for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Setting "ggplot2" Function ##
library("ggplot2", lib.loc="~/Library/R/3.1/library")

## Setting Working Directory ##
setwd("/Users/Kheng/Documents/Data Sceince/Exploratory Data Analysis/Course Project 2")

## Reading Datasets ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Sampling Data For Testing ## 
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

## Subsetting Data: Baltimore City, Maryland == fips ##
MD <- subset(NEI, fips == 24510)
MD$year <- factor(MD$year, levels = c('1999', '2002', '2005', '2008'))

## Generating Graph ##
png('plot3.png', width = 800, height = 500, units = 'px')
ggplot(data = MD, aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill = F) + geom_boxplot(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + ggtitle('Emissions per Type in Baltimore City, Maryland') + geom_jitter(alpha = 0.10)
dev.off()