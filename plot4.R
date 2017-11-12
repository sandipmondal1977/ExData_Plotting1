# Code for Exploratory Data Analysis course week1 project:Plot 4
# The data file named household_power_consumption.txt is saved in the R working directory

# reading the data into R
sourceData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)

# Converting "Date" column to data type
sourceData$Date <- as.Date(sourceData$Date, format="%d/%m/%Y")

# Filtering data from 2007-02-01 to 2007-02-02 as required
finteredData <- subset(sourceData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Combining data and time
dateTime <- paste(as.Date(finteredData$Date), finteredData$Time)

finteredData$Datetime <- as.POSIXct(dateTime)


#generating the plot
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(finteredData, {

    plot(Datetime,  as.numeric(Global_active_power), type = "l", xlab = "", ylab="Global Active Power")
    
    plot(Datetime, as.numeric(Voltage), type = "l", xlab = "", ylab = "Voltage (volt)")
    
    plot(Datetime,as.numeric(Sub_metering_1),col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
    lines(Datetime, as.numeric(Sub_metering_2), col = "red")
    lines(Datetime, as.numeric(Sub_metering_3), col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"))
    
    plot(Datetime, as.numeric(Global_reactive_power), type = "l", xlab = "", ylab = "Global Rective Power (kilowatts)")
})

# saving to file as per directions 
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
