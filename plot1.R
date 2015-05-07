
## plot1.R


data <- read.table("./household_power_consumption.txt", sep=";" , header=TRUE)
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

globalactivepower <- as.numeric(as.character(subsetdata$Global_active_power))

hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


