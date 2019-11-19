##Course Project 1: Plot 4
##load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##convert Date variable to Date Class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##covert dates and time 
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
##plot 4
data$datetime <- as.POSIXct(data$datetime)
par(mfrow = c(2,2),  mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data, {
  plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(datetime, Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "", col = "Black")
  lines(datetime, Sub_metering_2, col = "Blue")
  lines(datetime, Sub_metering_3, col = "Red")
  legend("topright", lty = 1, col = c("Black", "Blue", "Red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8, bty = "n" )
  plot(datetime, Global_reactive_power, type = "l", ylab = "Global Reative Power", xlab = "datetime")
} )
dev.copy(png, file = "Plot4.png", height = 480, width = 480)
dev.off()
##The Chinese characters shown on the x-axis mean Thursday, Friday, and Saturday individually
