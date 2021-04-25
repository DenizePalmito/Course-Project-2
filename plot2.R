

##Packeges 

library(plyr)
library(ggplot2)
library(grid)
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

Baltimore_ <- subset(NEI, fips == "24510")

# Total in 1999 to 2008
totalBaltimore_ <- tapply(Baltimore_$Emissions, Baltimore_$year, sum)

# Plot 2
X11()
par(bg = 'White')
barplot(totalBaltimore_, col = rainbow(5, start = 0, end = 1), 
        xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)", 
        main = "Yearly Emissions (tons) in Baltimore_ City, Maryland")


