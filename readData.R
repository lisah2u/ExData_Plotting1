# read_data.R
options(gsubfn.engine = "R") #add this line before loading sqldf 
library(sqldf)

url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataDir <- "data/"
fileDir <- "data/hpc.zip"

# Download and load the following data set:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

downloadFile <- function() {
	if(!file.exists(dataDir)) { 
		dir.create(dataDir) 
	}
	if(!file.exists(fileDir)) {
		download.file(url,destfile=fileDir,method="curl")
	}
}

# If it's already downloaded, connect to the zipfile and load
# 2007-02-01 and 2007-02-01
# convert the Date and Time variables to Date/Time classes  
# `strptime()` and `as.Date()`

readZip <- function() {
	unzip(fileDir)
	f <- unzip(fileDir,list=TRUE)  # filename is f$Name
	query <- "SELECT * from file where Date='1/2/2007' OR Date ='2/2/2007'"
	hpc <- read.csv2.sql(paste(dataDir,f$Name,sep=""),sql=query)
	
	#hpc$newDate <- as.Date(hpc$Date, format="%d/%m/%Y") 
	#hpc$newDateTime <- as.character(paste(hpc$newDate,hpc$Time))
	#hpc$newDateTime <- strptime(hpc$newDateTime, "%Y-%m-%d %H:%M:%S")
	hpc$newDateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
	hpc
}

