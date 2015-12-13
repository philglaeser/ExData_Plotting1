## Coded by PBG
## The datafile "household_power_consumption.txt" must be in the working directory

## The following line will install and load the "sqldf" package if it is not already loaded  

require(sqldf)
 
 hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
 closeAllConnections()
 
## combine and reformat Date and Time into usable datetime format 
 xx<- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
 
  ## Open file, plot the data, close file
 png(filename = "plot4.png", width = 480, height = 480)
 
 par(cex=1)
 par(mfrow=c(2,2),mar = c(3,3,1,2),mgp = c(1.5, .5, 0))
 
 plot(xx, hpc$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
 
 plot(xx, hpc$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
 
 plot(xx, hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
 lines(xx, hpc$Sub_metering_2, col = "Red")
 lines(xx, hpc$Sub_metering_3, col = "Blue")
 legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1,col=c("Black", "Red", "Blue"),y.intersp = 1, cex=0.9)
 
 plot(xx, hpc$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
 
  dev.off()