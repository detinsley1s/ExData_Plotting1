# Imports the data if it hasn't been imported yet
# Saves only the rows that range in date from 2/1/07 to 2/2/07
if(!exists("inputData")) {
    inputData = subset(read.csv("household_power_consumption.txt",
                                sep=";",
                                colClasses=c(rep("character", 2), rep("numeric", 7)),
                                na.strings=c("?")),
                       Date=="1/2/2007" | Date=="2/2/2007")
}

# Open plot4.png as the graphics device
png("plot4.png")

# Save the date/time as one variable
datetime <- strptime(paste(inputData$Date, inputData$Time), "%d/%m/%Y %H:%M:%S")

# Make the plot layout 2x2
par(mfrow=c(2, 2))

# Make the upper-left plot
# Display Global_active_power over time
plot(datetime,
     inputData$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Make the upper-right plot
# Display Voltage over time
plot(datetime,
     inputData$Voltage,
     xlab="datetime",
     ylab="Voltage",
     type="l")

# Make the lower-left plot
# Display Sub_metering_1 over time
plot(datetime,
     inputData$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

# Add Sub_metering_2 to the lower-left plot
lines(datetime,
      inputData$Sub_metering_2,
      col="red")

# Add Sub_metering_3 to the lower-left plot
lines(datetime,
      inputData$Sub_metering_3,
      col="blue")

# Add a legend for the lower-left plot
legend("topright",
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       bty="n",
       cex=0.92)

# Make the lower-right plot
# Display Global_reactive_power over time
plot(datetime,
     inputData$Global_reactive_power,
     xlab="datetime",
     ylab="Global_reactive_power",
     type="l")

# Close the graphics device
dev.off()