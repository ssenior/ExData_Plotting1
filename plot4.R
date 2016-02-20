###############################################################################
# plot4.R
#
# Reads in the Electric power consumption dataset from the UC Irvine Machine 
# Learning Repository, a popular repository for machine learning datasets, and 
# creates 4 plots:
#    1. Line plot of Global Active Power vs. Time
#    2. Line plot of Voltage vs. Time
#    3. 3 line plot of 
#       a. Energy sub-metering No. 1 vs. Time (black)
#       b. Energy sub-metering No. 2 vs. Time (red)
#       c. Energy sub-metering No. 3 vs. Time (blue)
#    4. Line plot of Global Reactive Power vs. Time
#
# The output is saved to a plot4.png file in the working directory.
#
#
###############################################################################

# load the utility script that loads dataset
source('load_dataset.R')

plot4 <- function(filepath  = "household_power_consumption.txt") {
    
    # load in the dataset
    dt_data <- load_dataset(filepath)
    
    # subset the data to between '2007-02-01' and '2007-02-02'
    plot_data <- subset(dt_data, Date >= '2007-02-01' & Date <= '2007-02-02')
    
    # plot the graphs
    png('./plot4.png', width = 480, height = 480)
    
    # set the appropriate graph layout
    par(mfrow = c(2,2))
    
    # plot graph 1
    plot(plot_data$Time, plot_data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
    
    # plot graph 2
    plot(plot_data$Time, plot_data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    
    # plot graph 3
    plot(plot_data$Time, plot_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
    lines(plot_data$Time, plot_data$Sub_metering_2, type = "l", col = "red")
    lines(plot_data$Time, plot_data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, bty = "n")
    
    # plot graph 4
    plot(plot_data$Time, plot_data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
    
    dev.off()
    
}