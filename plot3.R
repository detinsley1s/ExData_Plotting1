# Imports the data if it hasn't been imported yet
# Saves only the rows that range in date from 2/1/07 to 2/2/07
if(!exists("inputData")) {
    inputData = subset(read.csv("household_power_consumption.txt",
                                sep=";",
                                colClasses=c(rep("character", 2), rep("numeric", 7)),
                                na.strings=c("?")),
                       Date=="1/2/2007" | Date=="2/2/2007")
}

# Open plot3.png as the graphics device
png("plot3.png")

# Save the date/time as one variable
datetime <- strptime(paste(inputData$Date, inputData$Time), "%d/%m/%Y %H:%M:%S")

# Make the plot
# Display Sub_metering_1 over time
plot(datetime,
     inputData$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

# Add Sub_metering_2 to the plot
lines(datetime,
      inputData$Sub_metering_2,
      col="red")

# Add Sub_metering_3 to the plot
lines(datetime,
      inputData$Sub_metering_3,
      col="blue")

# Add the legend for the plot
legend("topright",
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

# Close the graphics device
dev.off()