## R script to read in the electric power consumption dataset and create a plot

## read in the data assuming you are in the correct working dir
hcp <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

## change the format of the Date and Time variables
hcp$Date <- as.Date(hcp$Date, "%d/%m/%Y")
hcp$Time <- strptime(paste(hcp$Date, hcp$Time), "%Y-%m-%d %H:%M:%S")

## subset the data to dates 2007-02-01 and 2007-02-02
sub_hcp <- subset(hcp, hcp$Date >= "2007-02-01" & hcp$Date <= "2007-02-02")

## change the class of the global active power variable to numeric
sub_hcp$Global_active_power <- as.numeric(sub_hcp$Global_active_power)

## create a plot of the global active power from 2007-02-01 and 2007-02-02
plot(sub_hcp$Time, sub_hcp$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", pch=NA_integer_)

lines(sub_hcp$Time, sub_hcp$Global_active_power)