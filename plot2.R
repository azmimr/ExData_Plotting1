# Read in file as a table and subset for 1st and 2nd Feb 2007
uzfile <- "household_power_consumption.txt"
data <- read.table(uzfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 2 is a time series plot of Global Active Power over the 2 day period
#Concat Date+Time columns and convert to POSIXlt class
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(data2$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()