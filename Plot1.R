##Course Project 1: Plot 1
##load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##convert Date variable to Date Class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##covert dates and time 
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#plot 1
attach(data)
hist(Global_active_power, main="Global Active Power", xlab = "Global Active Power(kilowatts)", col = "Red")
#save file to png format
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)

