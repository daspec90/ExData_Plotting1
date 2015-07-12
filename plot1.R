plot1 <- function(){
	library(lubridate)
	data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", comment.char = "")
	
	# Subset for only 2/1/07 - 2/2/07.	
	tidydata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
	
	# Add Date + Time while reformatting into POSIXct.		
	tidydata <- cbind(datetime = 0, tidydata)
	tidydata$datetime <- dmy(tidydata$Date) + hms(tidydata$Time)
		
		
	# Make png file.
	png(file = "plot1.png", width = 480, height =480)
	
	# Histogram of Global Active Power.

	hist(tidydata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = 2, bg = "white")
	
	# Turn device off.	
	dev.off()
}