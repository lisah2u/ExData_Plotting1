# plot1.R

source("readData.R")

downloadFile()
hpc <- readZip()

plot1 <- function() {
	 png("plot1.png")
	 hist(hpc$Global_active_power,
	 col="red",
	 xlab="Global Active Power (kilowatts)",
	 main="Global Active Power"
	 )
	dev.off()
}

plot1()