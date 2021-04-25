##Packeges 

library(plyr)
library(ggplot2)
library(grid)

##
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

t_NEI <- tapply(NEI$Emissions, NEI$year, sum)
par(bg = 'white')

#Plot 1

X11()
barplot(t_NEI, col = rainbow(11, start = 0, end = 1), 
        xlab = "Year", ylab = "Total PM2.5 Emissions in Tons",
        main = "Total PM 2.5 Emissions (tons) in USA")

