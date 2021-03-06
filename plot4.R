my_data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880, col.names = colnames(read.table(
  "household_power_consumption.txt",
  nrow = 1, header = TRUE, sep=";")))
my_data
attach(my_data)
my_data["datetime"] <- NA
datetime <- paste(Date, Time)
my_data["datetime"] <- datetime
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(datetime, Global_active_power, xlab = "",ylab = "Glboal Active Power", 
     type = "n", cex.axis=.8, cex.lab=.8)
lines(datetime, Global_active_power)
plot(datetime, Voltage, cex.axis=.8, cex.lab=.8, type = "n")
lines(datetime, Voltage) 
plot(datetime, Sub_metering_1, xlab = "",ylab = "Energy sub metering",
     cex.axis=.8, cex.lab=.8, type ="n")
lines(datetime, Sub_metering_1)
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), cex=.7, box.lwd=0)
plot(datetime, cex.axis=.8, cex.lab=.8,Global_reactive_power, type = "n")
lines(datetime, Global_reactive_power)
