library(plyr)
library(ggplot2)
library(grid)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

Baltimore_ <- subset(NEI, fips == "24510")


typeBaltimore_ <- ddply(Baltimore_, .(year, type), function(x) sum(x$Emissions))


colnames(typeBaltimore_)[3] <- "emissions"

# Plot 3
X11()
par(bg = 'White')
qplot(year, emissions, data = typeBaltimore_, color = type, geom = "line") + 
  ggtitle("PM2.5 Emission by Type and Year in Baltimore_ City") + xlab("Year") +
  ylab("Total PM2.5 Emissions in tons") + 
  theme(legend.position = c(0.9, 0.85))

