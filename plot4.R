#load file & subset data

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]




#convert data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
globalVolage <- as.numeric(subSetData$Voltage)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# plot Global Active Power
plot(datetime, globalActivePower, type = "l", xlab="", ylab="Global Active Power")

# plot Voltage
plot(datetime, globalVolage, type = "l", ylab="Voltage")




#plot Energy Submetering
plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, Sub_metering_2, type = "l", col = "red")
lines(datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


# plot Global Reactive Power
plot(datetime, globalReactivePower, type = "l", ylab="Global_reactive_power")


dev.off()