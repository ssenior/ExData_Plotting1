###############################################################################
# load_dataset.R
#
# Reads in the Electric power consumption dataset from the UC Irvine Machine 
# Learning Repository, a popular repository for machine learning datasets and
# returns a data table
#
###############################################################################

load_dataset <- function(filepath) {
    
    # validate that the Electric power consumption dataset is in the filepath
    # provided as the argument
    if (!file.exists(filepath)) {
        stop("Can not locate Electric power consumption dataset. Download the data set from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
    }
    
    # read in Electric power consumption dataset and convert character date and time
    # to appropriate classes
    dt_data <- read.table(filepath, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na="?")
    dt_data$Time <- strptime(paste(dt_data$Date, dt_data$Time), "%d/%m/%Y %H:%M:%S")
    dt_data$Date <- as.Date(dt_data$Date, "%d/%m/%Y")
    
    dt_data
    
}