# Imports the data if it hasn't been imported yet
# Saves only the rows that range in date from 2/1/07 to 2/2/07
if(!exists("inputData")) {
    inputData = subset(read.csv("household_power_consumption.txt",
                                sep=";",
                                colClasses=c(rep("character", 2), rep("numeric", 7)),
                                na.strings=c("?")),
                       Date=="1/2/2007" | Date=="2/2/2007")
}

# Open plot2.png as the graphics device
png("plot2.png")

# Save the date/time as one variable
datetime <- strptime(paste(inputData$Date, inputData$Time), "%d/%m/%Y %H:%M:%S")

# Make the plot
# Display Global_active_power over time
plot(datetime,
     inputData$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Close the graphics device
dev.off()