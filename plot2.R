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
	
	# Plot Global Active Power as a function of time.
	plot(tidydata$datetime, tidydata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
		
	# Make png file and turn device off.
	dev.copy(png, file = "plot2.png")
	dev.off()
}