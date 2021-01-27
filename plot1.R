# Reading the data table provided

powerdata <- read.csv("household_power_consumption.txt", 
                      header=TRUE, sep=';', na.strings="?")

# Date transformation

subdata <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

# Plotting the histogram and export

png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
