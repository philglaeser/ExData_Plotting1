## Coded by PBG
## The datafile "household_power_consumption.txt" must be in the working directory

## The following line will install and load the "sqldf" package if it is not already loaded  

require(sqldf)
 
 hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
 closeAllConnections()
 
## combine and reformat Date and Time into usable datetime format 
 xx<- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
 
 par(cex=0.8)  ## Reduce the fonts a bit
 
 ## Open file, plot the data, close file
 png(filename = "plot3.png", width = 480, height = 480)
 plot(xx, hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
 lines(xx, hpc$Sub_metering_2, col = "Red")
 lines(xx, hpc$Sub_metering_3, col = "Blue")
 legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1,col=c("Black", "Red", "Blue"),y.intersp = 1)
 dev.off()