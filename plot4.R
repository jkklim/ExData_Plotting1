
## plot4.R


data <- read.table("./household_power_consumption.txt", sep=";" , header=TRUE)
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

par(mfrow=c(2,2))


globalactivepower <- as.numeric(as.character(subsetdata$Global_active_power))
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(as.character(subsetdata$Sub_metering_1))
subMetering2 <- as.numeric(as.character(subsetdata$Sub_metering_2))
subMetering3 <- as.numeric(as.character(subsetdata$Sub_metering_3))

globalreactivepower <- as.numeric(as.character(subsetdata$Global_reactive_power))
voltage <- as.numeric(as.character(subsetdata$Voltage))

## plot 1

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## plot 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## plot 3

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")  
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n", cex=.5)

## plot 4

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()


