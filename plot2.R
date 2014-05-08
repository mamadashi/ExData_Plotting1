## Reading data from file
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=F)
## Subsetting
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
## Add Data+Time column
data$DateTime <- strptime( paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
## Set device
file = "plot2.png"
png(filename=file,width=480, height=480, bg="white")
## just in case..
par(mfrow=c(1,1))
## Plot
plot(data$DateTime, data$Global_active_power, 
	type="l", 
	lwd=1, 
	col="black", 
	xlab="", 
	ylab='Global Active Power (kilowatts)')
## Close device
dev.off()
