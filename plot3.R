rawData <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
filteredData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007", ]
paste(filteredData$Date, filteredData$Time, sep=" ")  
#filteredData$Date <- as.Date(filteredData$Date, "%d/%m/%Y")
filteredData$Time <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

filteredData$Sub_metering_1 <- as.numeric(filteredData$Sub_metering_1)
filteredData$Sub_metering_2 <- as.numeric(filteredData$Sub_metering_2)
filteredData$Sub_metering_3 <- as.numeric(filteredData$Sub_metering_3)

png(filename="plot3.png", width=480, height=480)
with(filteredData, plot(Time, Sub_metering_1, type = "l", ylab="Energy sub metering", , xlab=""))
with(filteredData, lines(Time, Sub_metering_2, type = "l", col="red"))
with(filteredData, lines(Time, Sub_metering_3, type = "l", col="blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()