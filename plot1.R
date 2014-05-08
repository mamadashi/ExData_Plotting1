## Reading data from file
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=F)
## Subsetting
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
## Add Data+Time column
data$DateTime <- strptime( paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
## Set device
file = "plot1.png"
png(filename=file,width=480, height=480, bg="white")
## just in case..
par(mfrow=c(1,1))
## Plot
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
## Close device
dev.off()
