##########################################################################################################
# Coursera Exploratory Data Analysis Project 1 - Plot1

# plot1.r File Description:
# This script will perform the following steps
# 1. Unzip and read the household_power_consumption.txt file
# 2. Convert the Date column to class of type Date
# 3. Create a file with the subset of the main file (Dates between 2007-02-01 and 2007-02-02)
# 4. Plot the corresponding plot1.png for the project
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

# Open the PNG file for plotting
png(filename = "./plot1.png", width = 480, height = 480)

# Plot 1
hist(data_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close
dev.off()

