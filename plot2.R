## code to import power consumption data and generate plot 2 for first exploratory data assignment

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

## create a png file containing the plot - first initialise the plot with axis labels then add the line

png(filename = "plot2.png", width = 480, height = 480)
plot(power_data$datetime, power_data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(power_data$datetime, power_data$Global_active_power)
dev.off()

