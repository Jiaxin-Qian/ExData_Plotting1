##Course Project 1: Plot 3
##load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##convert Date variable to Date Class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##covert dates and time 
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
##plot 3
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy Sub Metering", xlab = "", col = "Black")
lines(Sub_metering_2 ~ datetime, col = "Blue")
lines(Sub_metering_3 ~ datetime, col = "Red")
legend("topright", lty = 1, col = c("Black", "Blue", "Red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "Plot3.png", height = 480, width = 480)
dev.off()
detach(data)
##The Chinese characters shown on the x-axis mean Thursday, Friday, and Saturday individually

