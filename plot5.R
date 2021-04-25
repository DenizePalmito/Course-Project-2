
library(plyr)
library(ggplot2)
library(grid)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")



vehicles1 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
vehicles <- SCC[SCC$EI.Sector %in% vehicles1, ]["SCC"]

vehiclesBaltimore_ <- NEI[NEI$SCC %in% vehicles$SCC & NEI$fips == "24510",]

vehiclesBaltimore_Yearly <- ddply(vehiclesBaltimore_, .(year), function(x) sum(x$Emissions))

colnames(vehiclesBaltimore_Yearly)[2] <- "emissions"

# Plot 5
X11()
qplot(year, emissions, data = vehiclesBaltimore_Yearly, geom = "line",
      color = emissions, size = 1) + 
  ggtitle("PM2.5 Emissions by Motor Vehicles in Baltimore_ City") + 
  xlab("Year") + ylab("PM2.5 Emissions in Tons")


