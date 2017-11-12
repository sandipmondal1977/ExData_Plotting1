# Code for Exploratory Data Analysis course week1 project:Plot 2
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

#Generating the lines plot
plot(finteredData$Datetime,as.numeric(finteredData$Global_active_power),type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")


#save file as directed 	 
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

