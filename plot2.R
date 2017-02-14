##########################################################################################################
# Coursera Exploratory Data Analysis Project 1 - Plot2

# plot2.r File Description:
# This script will perform the following steps
# 1. Unzip and read the household_power_consumption.txt file
# 2. Convert the Date column to class of type Date
# 3. Create a file with the subset of the main file (Dates between 2007-02-01 and 2007-02-02)
# 4. Create a Datetime variable and append it to the file
# 5. Plot the corresponding plot2.png for the project
##########################################################################################################
# Load the data.table package
library(data.table)

# unzip the data file
if (!file.exists("household_power_consumption")) { 
  unzip(zipfile="./project1/household_power_consumption.zip",exdir="./project1") }

# Read the unzipped file to a variable 
data <- fread("./project1/household_power_consumption.txt",na.strings = "?",stringsAsFactors=FALSE)

# Convert the class for the Date column to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsetting the data
data_sub <- subset(data, data$Date >= "2007-02-01"  & data$Date <= "2007-02-02")

# Append a column DateTime to the subset Data file
data_sub$DateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time))

# Open the PNG file for plotting
png(filename = "./plot2.png", width = 480, height = 480)

# Plot 2
with(data_sub, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Close
dev.off()

