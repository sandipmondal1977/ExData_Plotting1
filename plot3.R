# Code for Exploratory Data Analysis course week1 project:Plot 3
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

with(finteredData, {
plot(Datetime,as.numeric(Sub_metering_1),col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(Datetime, as.numeric(Sub_metering_2), col = "red")
lines(Datetime, as.numeric(Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"))
})

#save file as directed 	 
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()






