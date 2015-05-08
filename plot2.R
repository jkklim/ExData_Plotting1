
## plot2.R


data <- read.table("./household_power_consumption.txt", sep=";" , header=TRUE)
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

globalactivepower <- as.numeric(as.character(subsetdata$Global_active_power))

datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()


