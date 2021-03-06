rawData <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
filteredData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007", ]
paste(filteredData$Date, filteredData$Time, sep=" ")  
#filteredData$Date <- as.Date(filteredData$Date, "%d/%m/%Y")
filteredData$Time <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

filteredData$Global_active_power <- as.numeric(filteredData$Global_active_power)
filteredData$Voltage <- as.numeric(filteredData$Voltage)
filteredData$Sub_metering_1 <- as.numeric(filteredData$Sub_metering_1)
filteredData$Sub_metering_2 <- as.numeric(filteredData$Sub_metering_2)
filteredData$Sub_metering_3 <- as.numeric(filteredData$Sub_metering_3)
filteredData$Global_reactive_power <- as.numeric(filteredData$Global_reactive_power)

png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(filteredData, { plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", , xlab="") 
                     plot(Time, Voltage, type="l", ylab="Voltage", xlab="datetime") 
                     plot(Time, Sub_metering_1, type = "l", ylab="Energy sub metering", , xlab="")
                     lines(Time, Sub_metering_2, type = "l", col="red")
                     lines(Time, Sub_metering_3, type = "l", col="blue")
                     plot(Time, Global_reactive_power, type = "l", ylab="Global_reactive_power", , xlab="datetime")
})
dev.off()