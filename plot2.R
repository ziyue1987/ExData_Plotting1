rawData <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
filteredData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007", ]
paste(filteredData$Date, filteredData$Time, sep=" ")  
#filteredData$Date <- as.Date(filteredData$Date, "%d/%m/%Y")
filteredData$Time <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

filteredData$Global_active_power <- as.numeric(filteredData$Global_active_power)

png(filename="plot2.png", width=480, height=480)
plot(time, filteredData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()