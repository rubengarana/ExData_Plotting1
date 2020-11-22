png(filename = "Plot1.png",width = 480,height = 480)

file <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = "character")
file$Date <- as.Date(file$Date,format="%d/%m/%Y")
dates <- file[file$Date>="2007-02-01"&file$Date<="2007-02-02",]
dates$Global_active_power<-as.numeric(dates$Global_active_power)
hist(dates$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active power (Kilowatts")

dev.off()