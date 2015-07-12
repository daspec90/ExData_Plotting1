plot2 <- function(){
	library(lubridate)
	
	# For larger data sets, designating classes can save time.
	classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
	
	data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", comment.char = "", colClasses = classes)
	
	# Subset for only 2/1/07 - 2/2/07.	
	tidydata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
	
	# Add Date + Time while reformatting into POSIXct.		
	tidydata <- cbind(datetime = 0, tidydata)
	tidydata$datetime <- dmy(tidydata$Date) + hms(tidydata$Time)
	
	# Make png file and turn device off.
	png(file = "plot2.png", width = 480, height =480)

	# Plot Global Active Power as a function of time.
	par(bg = "white")
	plot(tidydata$datetime, tidydata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
	
	# Turns off png device.	
	dev.off()
}