## R script to read in the electric power consumption dataset and create a plot

## read in the data assuming you are in the correct working dir
hcp <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

## change the format of the Date and Time variables
hcp$Date <- as.Date(hcp$Date, "%d/%m/%Y")
hcp$Time <- strptime(paste(hcp$Date, hcp$Time), "%Y-%m-%d %H:%M:%S")

## subset the data to dates 2007-02-01 and 2007-02-02
sub_hcp <- subset(hcp, hcp$Date >= "2007-02-01" & hcp$Date <= "2007-02-02")

## change the class of the sub metering variables to numeric
sub_hcp$Sub_metering_1 <- as.numeric(sub_hcp$Sub_metering_1)
sub_hcp$Sub_metering_2 <- as.numeric(sub_hcp$Sub_metering_2)
sub_hcp$Sub_metering_3 <- as.numeric(sub_hcp$Sub_metering_3)

## create a plot of the energy sub-metering from 2007-02-01 and 2007-02-02
plot(sub_hcp$Time, sub_hcp$Sub_metering_1, xlab="", ylab="Energy sub metering",
     pch=NA_integer_)

lines(sub_hcp$Time, sub_hcp$Sub_metering_1)
lines(sub_hcp$Time, sub_hcp$Sub_metering_2, col="red")
lines(sub_hcp$Time, sub_hcp$Sub_metering_3, col="blue")

legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
