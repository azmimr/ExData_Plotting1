# Read in file as a table and subset for 1st and 2nd Feb 2007
uzfile <- "household_power_consumption.txt"
data <- read.table(uzfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Concat Date+Time columns and convert to POSIXlt class
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# convert in the various columns as needed
globalActivePower <- as.numeric(data2$Global_active_power)
globalReactivePower <- as.numeric(data2$Global_reactive_power)
voltage <- as.numeric(data2$Voltage)
subMetering1 <- as.numeric(data2$Sub_metering_1)
subMetering2 <- as.numeric(data2$Sub_metering_2)
subMetering3 <- as.numeric(data2$Sub_metering_3)

# Plot 4 is a 2x2 mosaic plot. Each is a time series plot for
# 1. Global Active Power
# 2. Voltage
# 3. Sub metering
# 4. Global Reactive Power

# Set up mosaic for plots i.e. 2 x 2
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Top Left: Same as plot2.R
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Top Right: Voltage plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Bottom Left: Same as plot3.R
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Bottom Right: Global Reactive plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()