plot3 <- function(){
	library(lubridate)
	
	# For larger data sets, designating classes can save time.
	classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
	
	data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", comment.char = "", colClasses = classes)
	
	# Subset for only 2/1/07 - 2/2/07.	
	tidydata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
	
	# Add Date + Time while reformatting into POSIXct.		
	tidydata <- cbind(datetime = 0, tidydata)
	tidydata$datetime <- dmy(tidydata$Date) + hms(tidydata$Time)

	# Make png file.
	png(file = "plot3.png", width = 480, height =480)
	
	# Plots 3 Sub-metering variables as a function of time.
	par(bg = "white")
	plot(tidydata$datetime, tidydata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
	
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2)
	points(tidydata$datetime, tidydata$Sub_metering_1, type = "l")
	points(tidydata$datetime, tidydata$Sub_metering_2, type = "l", col = "red")
	points(tidydata$datetime, tidydata$Sub_metering_3, type = "l", col = "blue")
	
	# Turn device off.
	dev.off()
}