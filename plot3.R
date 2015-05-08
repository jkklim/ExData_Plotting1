
## plot3.R


data <- read.table("./household_power_consumption.txt", sep=";" , header=TRUE)
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

globalactivepower <- as.numeric(as.character(subsetdata$Global_active_power))
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(as.character(subsetdata$Sub_metering_1))
subMetering2 <- as.numeric(as.character(subsetdata$Sub_metering_2))
subMetering3 <- as.numeric(as.character(subsetdata$Sub_metering_3))

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")  
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()


