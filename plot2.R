#Read data
data_plots <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")

#Convert to Date
data_plots$Date = paste(data_plots$Date, data_plots$Time)
data_plots$Date <- as.POSIXlt(data_plots$Date,format="%d/%m/%Y %H:%M:%S")

#Get only data from the dates 2007-02-01 and 2007-02-02
data_subset <- data_plots
data_subset <- data_subset[which(data_subset$Date$year==107),]
data_subset <- data_subset[which(data_subset$Date$mon==1),]
data_subset <- data_subset[which(data_subset$Date$mday==1|data_subset$Date$mday==2),]

#Plot 2
png("plot2.png", width = 480, height = 480)
plot(x=(data_subset$Date),y=data_subset$Global_active_power,type="l", xlab= "", ylab="Global Active Power (kilowatts)")
dev.off()