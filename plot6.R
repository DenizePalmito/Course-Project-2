library(plyr)
library(ggplot2)
library(grid)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")




vehicles1 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
vehicles <- SCC[SCC$EI.Sector %in% vehicles1, ]["SCC"]

vehiclesBaltimore_ <- NEI[NEI$SCC %in% vehicles$SCC & NEI$fips == "24510",]

vehiclesLosAngelesCounty <- NEI[NEI$SCC %in% vehicles$SCC & NEI$fips == "06037",]

vehiclesCompare <- rbind(vehiclesBaltimore_, vehiclesLosAngelesCounty)

vehiclesCompareYearly <- aggregate(Emissions ~ fips * year, data = vehiclesCompare, 
                                   FUN = sum )

vehiclesCompareYearly$county <- ifelse(vehiclesCompareYearly$fips == "06037", "Los Angeles", "Baltimore_")

# Plot 6
X11()
qplot(year, Emissions, data = vehiclesCompareYearly, geom = "line", color = county, 
      size = Emissions) + 
  ggtitle("PM2.5 Emissions by Motor Vehicles in Baltimore_ City, MD, Vs Los Angeles County, CA") + xlab("Year") + ylab("PM2.5 Emissions in Tons")

