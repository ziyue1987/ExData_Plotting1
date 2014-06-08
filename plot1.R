rawData <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
filteredData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007", ]

filteredData$Global_active_power <- as.numeric(filteredData$Global_active_power)

png(filename="plot1.png", width=480, height=480)
hist(filteredData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


