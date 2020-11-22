png(filename = "Plot4.png",width = 480,height = 480)

file <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = "character")
file$DateTime <- paste(file$Date,file$Time)
file$DateTime <- strptime(file$DateTime,format = "%d/%m/%Y %H:%M:%S")
dates <- file[file$DateTime>="2007-02-01 00:00:00"&file$DateTime<="2007-02-02 23:59:00",]

for (x in seq(names(dates))) {
        if (x > 2 & x < 10) {
                dates[[x]] <- as.numeric(dates[[x]])
        }
}

par(mfrow = c(2,2))
with(dates,plot(DateTime,Global_active_power,xlab = "",ylab ="Global Active power (Kilowatts)",type = "l"))
with(dates,plot(DateTime,Voltage,type = "l"))
with(dates,plot(DateTime,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = ""))
with(dates,{lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")})
legend("topright",lty = c(1,1,1),col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(dates,plot(DateTime,Global_reactive_power,type = "l"))

dev.off()
