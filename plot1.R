# Imports the data if it hasn't been imported yet
# Saves only the rows that range in date from 2/1/07 to 2/2/07
if(!exists("inputData")) {
    inputData = subset(read.csv("household_power_consumption.txt",
                                sep=";",
                                colClasses=c(rep("character", 2), rep("numeric", 7)),
                                na.strings=c("?")),
                       Date=="1/2/2007" | Date=="2/2/2007")
}

# Open plot1.png as the graphics device
png("plot1.png")

# Make the histogram
# Display frequency of Global_active_power values
hist(inputData$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")

# Close the graphics device
dev.off()