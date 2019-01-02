##reading data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##making a subset
data_subset <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
##change dates 
data_subset$Date <- as.Date(data_subset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)
##plot 2
with(data_subset, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
##copy to file
dev.copy(png, file="plot2.png", height=480, width=480)
##close connection
dev.off()
