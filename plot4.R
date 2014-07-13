# plot4.R

source("readData.R")

downloadFile()
hpc <- readZip()

plot4 <- function() {
	png("plot4.png")
	par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 
	plot(hpc$newDateTime,hpc$Global_active_power,type="l",ylab="Global Active Power",xlab="")
	plot(hpc$newDateTime,hpc$Voltage,type="l",ylab="Voltage",xlab="datetime")
	plot(hpc$newDateTime,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	lines(hpc$newDateTime,hpc$Sub_metering_2,col="red")
	lines(hpc$newDateTime,hpc$Sub_metering_3,col="blue")
	legend("topright",lty=1,col=c("black","red","blue"),bty="n",
		   legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(hpc$newDateTime,hpc$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")	
	dev.off()
}

plot4()