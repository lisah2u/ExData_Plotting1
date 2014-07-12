# plot2.R

source("readData.R")

downloadFile()
hpc <- readZip()

plot2 <- function() {
	png("plot2.png")
	with(hpc, 
		 plot(
		 	 newDateTime,
		 	 Global_active_power,
		 	 type="l",ylab="Global Active Power (kilowatts)", 
		 	 xlab=""
		 	 )
		 )
	dev.off()
}

plot2()