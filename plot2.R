## Coded by PBG
## The datafile "household_power_consumption.txt" must be in the working directory

## The following line will install and load the "sqldf" package if it is not already loaded  

require(sqldf)
 
 hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
 closeAllConnections()
 
 xx<- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
 plot(xx, hpc$Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l", cex.main = 0.75, cex.lab = 0.75, cex.axis = 0.75)
 
 dev.copy(png, file = "plot2.png")
 dev.off()