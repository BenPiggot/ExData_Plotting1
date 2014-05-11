my_data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880, col.names = colnames(read.table(
  "household_power_consumption.txt",
  nrow = 1, header = TRUE, sep=";")))
my_data
attach(my_data)
my_data["datetime"] <- NA
datetime <- paste(Date, Time)
my_data["datetime"] <- datetime
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
plot(datetime, Global_active_power, xlab = "",ylab = "Glboal Active Power (kilowatts)", type = "n", pin = c(5,5))
lines(datetime, Global_active_power)