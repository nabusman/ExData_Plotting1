# Read Data
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 stringsAsFactors = FALSE, 
                 na.strings = "?")

# Set formats and remove data not needed
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- NULL
data$Time <- NULL
full_data <- data
data <- data[which(data$DateTime >= as.POSIXct("2007-02-01 00:00:00") & data$DateTime <= as.POSIXct("2007-02-02 23:59:59")),]

# Create plot
png(file = "plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid")
dev.off()
