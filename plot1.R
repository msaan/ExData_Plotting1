##reading data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##making a subset
data_subset <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
##change dates 
data_subset$Date <- as.Date(data_subset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)
##plot1
hist(data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##making png file 
dev.copy(png, file="plot1.png", height=480, width=480)
##closing 
dev.off()