###############################################################################
# plot3.R
#
# Reads in the Electric power consumption dataset from the UC Irvine Machine 
# Learning Repository, a popular repository for machine learning datasets, and 
# creates a plot with 3 lines:
#    1. Energy sub-metering No. 1 vs. Time (black)
#    2. Energy sub-metering No. 2 vs. Time (red)
#    3. Energy sub-metering No. 3 vs. Time (blue)

# The output is saved to a plot3.png file in the working directory.
#
#
###############################################################################

# load the utility script that loads dataset
source('load_dataset.R')

plot3 <- function(filepath  = "household_power_consumption.txt") {
    
    # load in the dataset
    dt_data <- load_dataset(filepath)
    
    # subset the data to between '2007-02-01' and '2007-02-02'
    plot_data <- subset(dt_data, Date >= '2007-02-01' & Date <= '2007-02-02')
    
    # plot the graph
    png('./plot3.png', width = 480, height = 480)
    par(mfrow = c(1,1))
    plot(plot_data$Time, plot_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
    lines(plot_data$Time, plot_data$Sub_metering_2, type = "l", col = "red")
    lines(plot_data$Time, plot_data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2)
    dev.off()
    
}