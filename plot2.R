#load file & subset data

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#convert data
globalActivePower <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()