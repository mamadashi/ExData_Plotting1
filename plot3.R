## Reading data from file
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=F)
## Subsetting
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
## Add Data+Time column
data$DateTime <- strptime( paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
## Set device
file = "plot3.png"
png(filename=file,width=480, height=480, bg="white")
## just in case..
par(mfrow=c(1,1))
## Plot
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="",  ylab="Energy submettering")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col ="blue")

legend("topright", 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	col=c("Black", "Red", "Blue"), 
    lwd = 2, lty=1, pch=NA)
## Close device
dev.off()
