data.source <- "./data/household_power_consumption.txt"
data <- read.table(data.source, header = TRUE, sep = ";", stringsAsFactors = FALSE)

data2 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

d.time <- strptime(paste(data2$Date,data2$Time), format = "%d/%m/%Y %H:%M:%S")
Global.active.power <- as.numeric(data2$Global_active_power)
Global.reactive.power <- as.numeric(data2$Global_reactive_power)
voltage <- as.numeric(data2$Voltage)
sub.metering.1 <- as.numeric(data2$Sub_metering_1)
sub.metering.2 <- as.numeric(data2$Sub_metering_2)
sub.metering.3 <- as.numeric(data2$Sub_metering_3)

png("plot4.png",width = 480, height = 480)

par(mfrow = c(2,2), mar=c(4,4,2,2))

plot(d.time,Global.active.power, type = "l", xlab = "", ylab = "Global Active Power")

plot(d.time,voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(d.time,sub.metering.1, type = "n", xlab = "",ylab = "Energy sub metering")

lines(d.time,sub.metering.1,col="black")
lines(d.time,sub.metering.2,col="red")
lines(d.time,sub.metering.3,col="blue")

legend("topright",lwd = 1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

plot(d.time,Global.reactive.power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()
