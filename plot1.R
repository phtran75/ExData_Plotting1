# Exploratory_Data_Analysis
# Assignment 1
#
# plot1.R
#
# constructs plot1.png
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

# hist(input_data$V3, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# produce plot1.png as we have seen during Week1 slides
with(input_data, hist(input_data$V3, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.copy(png, file = "plot1.png")
dev.off()