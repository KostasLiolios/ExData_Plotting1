# Reading the data table provided

powerdata <- read.csv("household_power_consumption.txt", 
                      header=TRUE, sep=';', na.strings="?")

subdata <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

# Date transformation

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

subdatatime <- paste(as.Date(subdata$Date), subdata$Time)

subdata$Datetime <- as.POSIXct(subdatatime)

# Plot and export of 3rd graph

png("plot3.png", width=480, height= 480)
with(subdata, {
  plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue')})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

