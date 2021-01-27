# Reading the data table provided

powerdata <- read.csv("household_power_consumption.txt", 
                      header=TRUE, sep=';', na.strings="?")

subdata <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

# Date transformation

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

subdatatime <- paste(as.Date(subdata$Date), subdata$Time)

subdata$Datetime <- as.POSIXct(subdatatime)

# Plot and export of 2nd graph

png("plot2.png", width=480, height=480)

with(subdata, {plot(Global_active_power~Datetime, type="l", 
                    xlab="", ylab="Global Active Power (kilowatts)")})

dev.off()
