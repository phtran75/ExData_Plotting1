# Exploratory_Data_Analysis
# Assignment 1
#
# plot4.R
#
# constructs plot4.png
#

# names
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3

# unzip data file in the current directory
if(!file.exists("./exdata_data_household_power_consumption.zip")) { 
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./exdata_data_household_power_consumption.zip")
        unzip("exdata_data_household_power_consumption.zip",exdir= ".")
}

# read input data file
# data included from line 66638 to line 69517 also 2880 lines to read
input_data <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";")

library(datasets)

par(mfrow = c(2, 2))

with(input_data, {
plot(input_data$V2, input_data$V3, type = "l", xaxt = "n", ylab = "Global Active Power")
axis(1, c(0, 720, 1440), c("Thu", "Fri", "Sat"))

plot(input_data$V2, input_data$V5, type = "l", col = "red", xaxt = "n", ylab = "Voltage", sub = "datetime")
axis(1, c(0, 720, 1440), c("Thu", "Fri", "Sat"))

plot(input_data$V2, input_data$V9, type = "l", col = "blue", xaxt = "n", ylab = "Energy sub meeting")
axis(1, c(0, 720, 1440), c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))

plot(input_data$V2, input_data$V4, type = "l", col = "blue", xaxt = "n", ylab = "Global_reactive_power", sub = "datetime")
axis(1, c(0, 720, 1440), c("Thu", "Fri", "Sat"))
})

# produces plot4.png as we have seen during Week1 slides
# but I am sure I can find a better code for that

# with(input_data, {
#         }
# )

dev.copy(png, file = "plot4.png")
dev.off()

