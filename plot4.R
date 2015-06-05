## code to import power consumption data and generate plot 4 for first exploratory data assignment

## uses the sqldf package and assumes the 'household_power_consumption.txt' file is in the working directory

install.packages("sqldf")
library(sqldf)

## set file name

filename <- "household_power_consumption.txt"

## read data from file for first two days in February using read.csv.sql function

power_data <- read.csv.sql(filename, "SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')", sep = ';')
closeAllconnections()

## create a combined 'datetime' field to be used in time series

power_data$datetime <- strptime(paste(power_data$Date, power_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## create a png file containing the plot - first set the 2 x 2 grid, then add each of the plots

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

## top left plot, same as plot 2

plot(power_data$datetime, power_data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(power_data$datetime, power_data$Global_active_power)

## top right plot 

plot(power_data$datetime, power_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## bottom left plot - same as plot 3 but no border on legend

plot(power_data$datetime, power_data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
lines(power_data$datetime, power_data$Sub_metering_1)
lines(power_data$datetime, power_data$Sub_metering_2, col = "red")
lines(power_data$datetime, power_data$Sub_metering_3, col = "blue")

## bottom right plot

plot(power_data$datetime, power_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

