# Data file downloaded from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Unzip file is not done already
zfile <- "exdata_data_household_power_consumption.zip"
uzfile <- "household_power_consumption.txt"
if(!file.exists(uzfile)){
    print("Unzipping file ...")
    unzip(zfile, list = FALSE, overwrite = TRUE)
}

# Read in file as a table and subset for 1st and 2nd Feb 2007
data <- read.table(uzfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# NOTE: all columns read as char (try : summary(data))

# plot 1 is to display a histogram of the 'global active power'. Need to convert
# this column to a numeric first.
globalActivePower <- as.numeric(data2$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
