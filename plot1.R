## Coded by PBG
## The datafile "household_power_consumption.txt" must be in the working directory
##

## The following line will install and load the "sqldf" package if it is not already loaded  

require(sqldf)
 
 
 hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
 closeAllConnections()
 
 hist(hpc$Global_active_power, xlab = "Global Active Power (Kilowatts)", main ="Global Active Power", col = "Red", cex.main = 0.75, cex.lab = 0.75, cex.axis = 0.75)
 
 dev.copy(png, file = "plot1.png")
 dev.off()