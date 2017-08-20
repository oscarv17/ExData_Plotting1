data.source <- "./data/household_power_consumption.txt"
data <- read.table(data.source, header = TRUE, sep = ";", stringsAsFactors = FALSE)

data2 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

Global.active.power <- as.numeric(data2$Global_active_power)

png("plot1.png",width = 480, height = 480)

hist(Global.active.power,col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
