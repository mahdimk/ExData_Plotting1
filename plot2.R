##
##set working directory to file location
##

##data preperation

data <- read.csv("household_power_consumption.txt", header=T, sep=";")
data[data=='?'] <- NA
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
data <- subset(data, data$Date %in% c(d1,d2))
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S", tz="UTC")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
data$Sub_metering_1<- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<- as.numeric(as.character(data$Sub_metering_3))




##plot 2
plot(data$DateTime, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

##output
png(filename = "plot2.png", width=480, height = 480)
plot(data$DateTime, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()





