# plot3.R

source("readData.R")

downloadFile()
hpc <- readZip()

plot3 <- function() {
	png("plot3.png")
	plot(hpc$newDateTime,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	lines(hpc$newDateTime,hpc$Sub_metering_2,col="red")
	lines(hpc$newDateTime,hpc$Sub_metering_3,col="blue")
	legend("topright",lty=1,col=c("black","red","blue"),
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	dev.off()
}

plot3()