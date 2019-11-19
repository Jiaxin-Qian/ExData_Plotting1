##Course Project 1: Plot 2
##load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##convert Date variable to Date Class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##covert dates and time 
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
##plot 2
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power(Kilowatts)", xlab = "" )
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)
##The Chinese characters shown on the x-axis mean Thursday, Friday, and Saturday individually

