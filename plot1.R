## code to import power consumption data and generate plot 1 for first
## exploratory data assignment

## uses the sqldf package and assumes the 'household_power_consumption.txt' file is in the working directory

install.packages("sqldf")
library(sqldf)

## set file name

filename <- "household_power_consumption.txt"

## read data from file for first two days in February using read.csv.sql function

power_data <- read.csv.sql(filename, "SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')", sep = ';')
closeAllconnections()

## create a png file containing the histogram

png(filename = "plot1.png", width = 480, height = 480)
hist(power_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col ="red" )
dev.off()

