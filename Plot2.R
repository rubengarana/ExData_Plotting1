png(filename = "Plot2.png",width = 480,height = 480)


file <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = "character")
file$DateTime <- paste(file$Date,file$Time)
file$DateTime <- strptime(file$DateTime,format = "%d/%m/%Y %H:%M:%S")
dates <- file[file$DateTime>="2007-02-01 00:00:00"&file$DateTime<="2007-02-02 23:59:00",]
dates$Global_active_power<-as.numeric(dates$Global_active_power)
with(dates,plot(DateTime,Global_active_power,xlab = "",ylab ="Global Active power (Kilowatts)",type = "n"))
with(dates,lines(DateTime,Global_active_power))

dev.off()