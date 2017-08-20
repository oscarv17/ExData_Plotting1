data.source <- "./data/household_power_consumption.txt"
data <- read.table(data.source, header = TRUE, sep = ";", stringsAsFactors = FALSE)

data2 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

d.time <- strptime(paste(data2$Date,data2$Time), format = "%d/%m/%Y %H:%M:%S")
Global.active.power <- as.numeric(data2$Global_active_power)

png("plot2.png",width = 480, height = 480)

plot(d.time,Global.active.power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
